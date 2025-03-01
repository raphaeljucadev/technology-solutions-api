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
use Illuminate\Http\JsonResponse;


class ConviteService
{
    public function enviarConvite(array $dados): JsonResponse
    {
        // Buscar o usuário que está enviando o convite
        $usuarioAtual = User::find($dados['user_id']);

        if (!$usuarioAtual) {
            return response()->json([
                'code' => Response::HTTP_NOT_FOUND,
                'message' => 'Usuário que enviou o convite não encontrado.'
            ], Response::HTTP_NOT_FOUND);
        }

        // Verificar permissão do usuário
        $perfisPermitidos = Config::get('permissions.can_invite_users', []);
        if (!in_array($usuarioAtual->userType->name, $perfisPermitidos)) {
            return response()->json([
                'code' => Response::HTTP_FORBIDDEN,
                'message' => 'Você não tem permissão para convidar colaboradores.'
            ], Response::HTTP_FORBIDDEN);
        }

        // Buscar status "Em Aberto", "Vencido" e "Finalizado"
        $statusEmAberto = StatusConvite::where('name', 'Em Aberto')->first();
        $statusVencido = StatusConvite::where('name', 'Vencido')->first();
        $statusFinalizado = StatusConvite::where('name', 'Finalizado')->first();

        if (!$statusEmAberto || !$statusVencido || !$statusFinalizado) {
            return response()->json([
                'code' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message' => 'Erro interno: Status de convite não configurado corretamente.'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        // Buscar convites existentes para o mesmo e-mail
        $conviteExistente = Convite::where('email', $dados['email'])->first();

        // Se já houver um convite "Finalizado", o usuário já foi cadastrado
        if ($conviteExistente && $conviteExistente->status_id === $statusFinalizado->id) {
            return response()->json([
                'code' => Response::HTTP_CONFLICT,
                'message' => 'Usuário já cadastrado no sistema.'
            ], Response::HTTP_CONFLICT);
        }

        // Se houver um convite "Em Aberto" ou "Vencido" expirado, atualiza os dados
        if ($conviteExistente && in_array($conviteExistente->status_id, [$statusEmAberto->id, $statusVencido->id])) {
            if (Carbon::now()->greaterThan($conviteExistente->expires_at)) {
                $token = Str::random(32);
                $conviteExistente->update([
                    'token' => $token,
                    'expires_at' => Carbon::now()->addHours(24),
                    'user_id' => $usuarioAtual->id,
                    'status_id' => $statusEmAberto->id // Define como "Em Aberto" novamente
                ]);

                // Enviar novo e-mail
                dispatch(new SendConviteEmailJob($conviteExistente))->onQueue('convites');

                return response()->json([
                    'code' => Response::HTTP_OK,
                    'message' => 'Convite renovado com sucesso.',
                    'convite' => [
                        'email' => $conviteExistente->email,
                        'token' => $conviteExistente->token
                    ]
                ], Response::HTTP_OK);
            }
        }

        // Criar um novo convite
        $token = Str::random(32);
        $convite = Convite::create([
            'email' => $dados['email'],
            'token' => $token,
            'status_id' => $statusEmAberto->id,
            'user_id' => $usuarioAtual->id,
            'expires_at' => Carbon::now()->addHours(24)
        ]);

        // Adicionar na fila com Redis
        dispatch(new SendConviteEmailJob($convite))->onQueue('convites');

        return response()->json([
            'code' => Response::HTTP_CREATED,
            'message' => 'Convite enviado com sucesso.',
            'convite' => [
                'email' => $convite->email,
                'token' => $convite->token
            ]
        ], Response::HTTP_CREATED);
    }

    public function findEmailByToken(string $token): JsonResponse
    {
        // Buscar o convite pelo token
        $invitation = Convite::where('token', $token)->first();

        if (!$invitation) {
            return response()->json([
                'code' => Response::HTTP_NOT_FOUND,
                'message' => 'Convite não encontrado.'
            ], Response::HTTP_NOT_FOUND);
        }

        // Buscar status "Em Aberto" e "Vencido"
        $statusEmAberto = StatusConvite::where('name', 'Em Aberto')->first();
        $statusVencido = StatusConvite::where('name', 'Vencido')->first();

        if (!$statusEmAberto || !$statusVencido) {
            return response()->json([
                'code' => Response::HTTP_INTERNAL_SERVER_ERROR,
                'message' => 'Erro interno: Status de convite não configurado corretamente.'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        // Verificar se o convite ainda está "Em Aberto"
        if ($invitation->status_id !== $statusEmAberto->id) {
            return response()->json([
                'code' => Response::HTTP_BAD_REQUEST,
                'message' => 'Convite não está mais disponível.'
            ], Response::HTTP_BAD_REQUEST);
        }

        // Verificar se o convite já expirou
        if (Carbon::now()->greaterThan($invitation->expires_at)) {
            // Atualizar status para "Vencido"
            $invitation->update(['status_id' => $statusVencido->id]);

            return response()->json([
                'code' => Response::HTTP_GONE, // 410 - Gone (Recurso expirado)
                'message' => 'Link expirado. Solicite outro convite.'
            ], Response::HTTP_GONE);
        }

        // Retornar o e-mail se estiver tudo certo
        return response()->json([
            'code' => Response::HTTP_OK,
            'message' => 'Convite válido.',
            'data' => ['email' => $invitation->email]
        ], Response::HTTP_OK);
    }
}
