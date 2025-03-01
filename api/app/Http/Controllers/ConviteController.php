<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\ConviteService;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\JsonResponse;


/**
 * @OA\Tag(
 *     name="Convites",
 *     description="Gerenciamento de convites para colaboradores"
 * )
 */
class ConviteController extends Controller
{
    protected ConviteService $conviteService;

    public function __construct(ConviteService $conviteService)
    {
        $this->conviteService = $conviteService;
    }

    /**
     * Enviar um convite para um novo colaborador.
     *
     * @OA\Post(
     *     path="/api/convites",
     *     tags={"Convites"},
     *     summary="Envia um convite para um novo colaborador",
     *     security={{"bearerAuth":{}}},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"email", "user_id"},
     *             @OA\Property(property="email", type="string", format="email", example="colaborador@email.com"),
     *             @OA\Property(property="user_id", type="integer", example=1, description="ID do usuário que está enviando o convite")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Convite enviado com sucesso",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=201),
     *             @OA\Property(property="message", type="string", example="Convite enviado com sucesso"),
     *             @OA\Property(property="convite", type="object",
     *                 @OA\Property(property="email", type="string", example="colaborador@email.com"),
     *                 @OA\Property(property="token", type="string", example="randomToken123"),
     *                 @OA\Property(property="enviado_por", type="integer", example=1)
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Erro de validação",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=400),
     *             @OA\Property(property="message", type="string", example="O e-mail já foi convidado.")
     *         )
     *     ),
     *     @OA\Response(
     *         response=403,
     *         description="Usuário sem permissão",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=403),
     *             @OA\Property(property="message", type="string", example="Você não tem permissão para convidar colaboradores.")
     *         )
     *     )
     * )
     */
    public function enviarConvite(Request $request)
    {
        $response = $this->conviteService->enviarConvite($request->all());

        return response()->json($response->getData(), $response->getStatusCode());
    }

    /**
     * @OA\Get(
     *     path="/api/convites-get/{token}",
     *     summary="Buscar convite pelo token",
     *     tags={"Convites"},
     *     @OA\Parameter(
     *         name="token",
     *         in="path",
     *         required=true,
     *         description="Token único do convite",
     *         @OA\Schema(type="string")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Convite encontrado",
     *         @OA\JsonContent(
     *             type="object",
     *             @OA\Property(property="email", type="string", example="colaborador@email.com")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Convite não encontrado"
     *     )
     * )
     */
    public function getInvitationByToken(string $token): JsonResponse
    {
        $email = $this->conviteService->findEmailByToken($token);

        return response()->json(['email' => $email]);
    }

}
