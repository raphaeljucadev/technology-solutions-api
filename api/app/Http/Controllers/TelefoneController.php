<?php

namespace App\Http\Controllers;

use App\Services\TelefoneService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

/**
 * @OA\Tag(
 *     name="Telefone",
 *     description="Gerenciamento de telefones dos usuários"
 * )
 */
class TelefoneController extends Controller
{
    private TelefoneService $telefoneService;

    public function __construct(TelefoneService $telefoneService)
    {
        $this->telefoneService = $telefoneService;
    }

    /**
     * @OA\Post(
     *      path="/api/telefone",
     *      tags={"Telefone"},
     *      summary="Cria um ou mais telefones para um usuário",
     *      security={{"bearerAuth":{}}},
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              required={"user_id", "telefones"},
     *              @OA\Property(property="user_id", type="integer", example=1),
     *              @OA\Property(
     *                  property="telefones",
     *                  type="array",
     *                  @OA\Items(
     *                      @OA\Property(property="ddd", type="string", example="11"),
     *                      @OA\Property(property="celular", type="string", example="98765-4321")
     *                  )
     *              )
     *          )
     *      ),
     *      @OA\Response(response=201, description="Telefones criados com sucesso"),
     *      @OA\Response(response=422, description="Erro de validação"),
     *      @OA\Response(response=401, description="Não autorizado")
     * )
     */
    public function store(Request $request): JsonResponse
    {
        try {
            $telefones = $this->telefoneService->create($request->all());
            return response()->json($telefones, 201);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
    }

    /**
     * @OA\Get(
     *      path="/api/telefone/{id}",
     *      tags={"Telefone"},
     *      summary="Busca um telefone pelo ID",
     *      security={{"bearerAuth":{}}},
     *      @OA\Parameter(name="id", in="path", required=true, description="ID do telefone", @OA\Schema(type="integer")),
     *      @OA\Response(response=200, description="Telefone encontrado"),
     *      @OA\Response(response=404, description="Telefone não encontrado"),
     *      @OA\Response(response=401, description="Não autorizado")
     * )
     */
    public function show($id): JsonResponse
    {
        $telefone = $this->telefoneService->findById($id);
        return response()->json($telefone);
    }

    /**
     * @OA\Put(
     *      path="/api/telefone",
     *      tags={"Telefone"},
     *      summary="Atualiza um ou mais telefones existentes",
     *      security={{"bearerAuth":{}}},
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              required={"user_id", "telefones"},
     *              @OA\Property(property="user_id", type="integer", example=1),
     *              @OA\Property(
     *                  property="telefones",
     *                  type="array",
     *                  @OA\Items(
     *                      required={"id", "ddd", "celular"},
     *                      @OA\Property(property="id", type="integer", example=10),
     *                      @OA\Property(property="ddd", type="string", example="21"),
     *                      @OA\Property(property="celular", type="string", example="92345-6789")
     *                  )
     *              )
     *          )
     *      ),
     *      @OA\Response(response=200, description="Telefones atualizados com sucesso"),
     *      @OA\Response(response=422, description="Erro de validação"),
     *      @OA\Response(response=401, description="Não autorizado")
     * )
     */
    public function update(Request $request): JsonResponse
    {
        try {
            $telefones = $this->telefoneService->update($request->all());
            return response()->json($telefones);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
    }
}
