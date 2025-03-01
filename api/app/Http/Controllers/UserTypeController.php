<?php


namespace App\Http\Controllers;

use App\Services\UserTypeService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

/**
 * @OA\Tag(
 *     name="Tipos de Usuário",
 *     description="APIs para gerenciamento de tipos de usuário"
 * )
 */
class UserTypeController extends Controller
{
    protected $service;

    public function __construct(UserTypeService $service)
    {
        $this->service = $service;
    }

    /**
     * Listar todos os tipos de usuário
     *
     * @OA\Get(
     *     path="/api/user-types",
     *     summary="Lista todos os tipos de usuário",
     *     tags={"Tipos de Usuário"},
     *     @OA\Response(
     *         response=200,
     *         description="Lista de tipos de usuário",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="Administrador")
     *             )
     *         )
     *     )
     * )
     */
    public function index(): JsonResponse
    {
        return response()->json($this->service->getAll());
    }

    /**
     * Exibir um tipo de usuário específico
     *
     * @OA\Get(
     *     path="/api/user-types/{id}",
     *     summary="Exibe um tipo de usuário pelo ID",
     *     tags={"Tipos de Usuário"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID do tipo de usuário",
     *         @OA\Schema(type="integer", example=1)
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Detalhes do tipo de usuário",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=1),
     *             @OA\Property(property="name", type="string", example="Administrador")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Tipo de usuário não encontrado",
     *         @OA\JsonContent(
     *             @OA\Property(property="error", type="string", example="User type not found")
     *         )
     *     )
     * )
     */
    public function show(int $id): JsonResponse
    {
        try {
            return response()->json($this->service->findById($id));
        } catch (\Exception $e) {
            return response()->json(['error' => 'User type not found'], 404);
        }
    }

    /**
     * Criar um novo tipo de usuário
     *
     * @OA\Post(
     *     path="/api/user-types",
     *     summary="Cria um novo tipo de usuário",
     *     tags={"Tipos de Usuário"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name"},
     *             @OA\Property(property="name", type="string", example="Vendedor")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Tipo de usuário criado com sucesso",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=2),
     *             @OA\Property(property="name", type="string", example="Vendedor")
     *         )
     *     ),
     *     @OA\Response(
     *         response=422,
     *         description="Erro de validação",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="O campo nome é obrigatório.")
     *         )
     *     )
     * )
     */
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100|unique:user_types,name',
        ]);

        return response()->json($this->service->create($validated), 201);
    }
}
