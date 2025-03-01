<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\UserService;




/**
 * @OA\Tag(
 *     name="Usuários",
 *     description="APIs para gerenciamento de usuários"
 * )
 */
class UserController extends Controller
{
    protected UserService $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

   /**
 * Criar novo usuário
 *
 * @OA\Post(
 *     path="/api/users",
 *     summary="Cria um novo usuário",
 *     tags={"Usuários"},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"name","cpf","email","password","user_type_id"},
 *             @OA\Property(property="name", type="string", example="Maria Souza"),
 *             @OA\Property(property="cpf", type="string", example="123.456.789-00"),
 *             @OA\Property(property="email", type="string", format="email", example="maria@example.com"),
 *         )
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Usuário criado com sucesso!",
 *         @OA\JsonContent(
 *             @OA\Property(property="message", type="string", example="Usuário criado com sucesso!"),
 *             @OA\Property(property="user", type="object",
 *                 @OA\Property(property="id", type="integer", example=2),
 *                 @OA\Property(property="name", type="string", example="Maria Souza"),
 *                 @OA\Property(property="cpf", type="string", example="123.456.789-00"),
 *                 @OA\Property(property="email", type="string", format="email", example="maria@example.com")
 *             )
 *         )
 *     )
 * )
 */
    public function store(Request $request)
    {
        return $this->userService->createUser($request);
    }

    /**
     * Atualizar usuário
     *
     * @OA\Put(
     *     path="/api/users/{id}",
     *     summary="Atualiza um usuário",
     *     tags={"Usuários"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID do usuário",
     *         @OA\Schema(type="integer", example=1)
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             @OA\Property(property="name", type="string", example="Maria Souza Atualizada"),
     *             @OA\Property(property="cpf", type="string", example="123.456.789-00"),
     *             @OA\Property(property="user_type_id", type="integer", example=1)
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Usuário atualizado com sucesso!",
     *         @OA\JsonContent(
     *             @OA\Property(property="message", type="string", example="Usuário atualizado com sucesso!"),
     *             @OA\Property(property="user", type="object",
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="Maria Souza Atualizada"),
     *                 @OA\Property(property="cpf", type="string", example="123.456.789-00"),
     *                 @OA\Property(property="email", type="string", format="email", example="maria@example.com")
     *             )
     *         )
     *     )
     * )
     */
    public function update(Request $request, $id)
    {
        return $this->userService->updateUser($request, $id);
    }

}
