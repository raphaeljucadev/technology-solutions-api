<?php

namespace App\Services;

use App\Models\User;
use App\Models\UserType;
use App\Models\StatusConvite;
use App\Models\Convite;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Config;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;
use App\Rules\StrongPasswordRule;

class Colaboradores
{   public function getColaboradoresFinalizados()
    {
        // Buscar o ID do status "Finalizado" na tabela status_convites
        $statusFinalizado = StatusConvite::where('name', 'Finalizado')->first();

        if (!$statusFinalizado) {
            return collect(); // Retorna coleção vazia se não existir
        }

        // Buscar todos os convites com status "Finalizado"
        $userIds = Convite::where('status_id', $statusFinalizado->id)
                          ->pluck('user_id'); // Pegamos apenas os IDs dos usuários

        // Buscar os usuários com esses IDs
        return User::whereIn('id', $userIds)
                   ->orderBy('name', 'asc')
                   ->paginate(10);
    }



    public function search($query)
    {
        // Buscar o ID do status "Finalizado" na tabela status_convites
        $statusFinalizado = StatusConvite::where('name', 'Finalizado')->first();

        if (!$statusFinalizado) {
            return collect(); // Retorna coleção vazia se o status não existir
        }

        // Buscar usuários que correspondem à pesquisa (nome, email ou CPF)
        return User::where(function ($q) use ($query) {
                $q->where('name', 'like', "%{$query}%")
                  ->orWhere('email', 'like', "%{$query}%")
                  ->orWhere('cpf', 'like', "%{$query}%");
            })
            ->whereHas('convites', function ($q) use ($statusFinalizado) {
                $q->where('status_id', $statusFinalizado->id);
            })
            ->orderBy('name', 'asc')
            ->paginate(10);
    }

    public function getColaboradorById($id)
    {
        // Buscar o usuário e carregar os relacionamentos (userType, telefones, endereco)
        $colaborador = User::with(['userType', 'telefones', 'endereco'])->find($id);

        // Se não encontrar, retorna null
        if (!$colaborador) {
            return null;
        }

        return $colaborador;
    }

    public function updateUserType($userId, $newUserTypeId, $password = null)
    {
        // Buscar o usuário
        $user = User::find($userId);
        if (!$user) {
            return response()->json([
                'code' => Response::HTTP_NOT_FOUND,
                'message' => 'Usuário não encontrado'
            ], Response::HTTP_NOT_FOUND);
        }

        // Buscar o tipo de usuário atual e o novo tipo
        $currentUserType = $user->userType->name ?? null;
        $newUserType = UserType::find($newUserTypeId);

        if (!$newUserType) {
            return response()->json([
                'code' => Response::HTTP_BAD_REQUEST,
                'message' => 'Tipo de usuário inválido'
            ], Response::HTTP_BAD_REQUEST);
        }

        // Obter regras de permissão do arquivo de configuração
        $permissoes = Config::get('permissions.user_type_changes', []);

        // Verificar se o usuário tem permissão para alterar para o novo perfil
        if (!isset($permissoes[$currentUserType]) || !in_array($newUserType->name, $permissoes[$currentUserType])) {
            return response()->json([
                'code' => Response::HTTP_FORBIDDEN,
                'message' => 'Você não tem permissão para essa alteração'
            ], Response::HTTP_FORBIDDEN);
        }

        // Se o novo perfil for "Administrador" ou "Gente e Cultura", a senha é obrigatória
        if (in_array($newUserType->name, ['Administrador', 'Gente e Cultura'])) {
            // Validação da senha com a regra StrongPasswordRule
            $validator = Validator::make(['password' => $password], [
                'password' => ['required', 'string', new StrongPasswordRule()]
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'code' => Response::HTTP_BAD_REQUEST,
                    'message' => $validator->errors()->first('password')
                ], Response::HTTP_BAD_REQUEST);
            }
        }

        // Atualizar o tipo de usuário
        $user->user_type_id = $newUserTypeId;

        // Se uma senha foi fornecida, atualizar também
        if ($password) {
            $user->password = Hash::make($password);
        }

        $user->save();

        $user = User::find($userId);


        return response()->json([
            'code' => Response::HTTP_OK,
            'message' => 'Perfil atualizado com sucesso',
            'user' => $user
        ], Response::HTTP_OK);
    }


}
