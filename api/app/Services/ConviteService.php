<?php
namespace App\Services;

use App\Models\Convite;
use App\Models\StatusConvite;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Str;
use App\Jobs\SendConviteEmailJob;
use Carbon\Carbon;
use Symfony\Component\HttpFoundation\Response;

class ConviteService
{
    public function enviarConvite(array $dados)
    {
        // Buscar o usuário que está enviando o convite
        $usuarioAtual = User::find($dados['user_id']);

        if (!$usuarioAtual) {
            return response()->json([
                'code' => Response::HTTP_NOT_FOUND,
                'message' => 'Usuário que enviou o convite não encontrado.'
            ], Response::HTTP_NOT_FOUND);
        }

        // Buscar a permissão do usuário no banco
        $userType = $usuarioAtual->userType;

        if (!$userType) {
            return response()->json([
                'code' => Response::HTTP_FORBIDDEN,
                'message' => 'Não foi possível verificar a permissão do usuário.'
            ], Response::HTTP_FORBIDDEN);
        }

        // Buscar permissões permitidas do arquivo de configuração
        $perfisPermitidos = Config::get('permissions.can_invite_users', []);

        // Verificar se o usuário tem permissão
        if (!in_array($userType->name, $perfisPermitidos)) {
            return response()->json([
                'code' => Response::HTTP_FORBIDDEN,
                'message' => 'Você não tem permissão para convidar colaboradores.'
            ], Response::HTTP_FORBIDDEN);
        }

        // Validação do e-mail
        $validator = Validator::make($dados, [
            'email' => 'required|email|unique:convites,email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'code' => Response::HTTP_BAD_REQUEST,
                'message' => $validator->errors()->first()
            ], Response::HTTP_BAD_REQUEST);
        }

        // Criar token e salvar no banco com validade de 24 horas
        $token = Str::random(32);
        $statusPendente = StatusConvite::where('name', 'Em Aberto')->first();

        if (!$statusPendente) {
            return response()->json([
                'code' => 500,
                'message' => 'Erro interno: Status "Em Aberto" não encontrado no banco.'
            ], 500);
        }


        $convite = Convite::create([
            'email' => $dados['email'],
            'token' => $token,
            'status_id' => $statusPendente->id,
            'user_id' => $usuarioAtual->id,
            'expires_at' => Carbon::now()->addHours(24)
        ]);

        // Adicionar na fila com Redis
        dispatch(new SendConviteEmailJob($convite))->onQueue('convites');

        return response()->json([
            'code' => Response::HTTP_CREATED,
            'message' => 'Convite enviado com sucesso',
            'convite' => [
                'email' => $convite->email,
                'token' => $convite->token,
                'enviado_por' => $usuarioAtual->id // Retornando o ID de quem enviou
            ]
        ], Response::HTTP_CREATED);
    }
}
