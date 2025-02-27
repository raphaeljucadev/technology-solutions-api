<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\AuthService;
use Illuminate\Support\Facades\Auth;

//controller para autenticação

/**
 * @OA\Info(
 *      title="API Technology Solutions",
 *      version="1.0.0",
 *      description="Documentação da API de onboarding de colaboradores",
 *      @OA\Contact(
 *          email="suporte@empresa.com"
 *      )
 * )
 */

class AuthController extends Controller
{
    protected $authService;

    // Injeção de Dependência do AuthService
        public function __construct(AuthService $authService)
    {
    $this->authService = $authService;

    }

   /**
 * @OA\Post(
 *      path="/api/login",
 *      tags={"Autenticação"},
 *      summary="Realiza o login do usuário",
 *      description="Autentica um usuário e retorna um token OAuth2",
 *      @OA\RequestBody(
 *          required=true,
 *          @OA\JsonContent(
 *              required={"cpf", "password"},
 *              @OA\Property(property="cpf", type="string", example="000.000.000-00"),
 *              @OA\Property(property="password", type="string", format="password", example="Senha123!")
 *          ),
 *      ),
 *      @OA\Response(
 *          response=200,
 *          description="Login realizado com sucesso",
 *          @OA\JsonContent(
 *              @OA\Property(property="token", type="string", example="eyJhbGciOiJIUzI1..."),
 *              @OA\Property(property="user", type="object",
 *                  @OA\Property(property="id", type="integer", example=1),
 *                  @OA\Property(property="name", type="string", example="João da Silva"),
 *                  @OA\Property(property="cpf", type="string", example="000.000.000-00"),
 *                  @OA\Property(property="email", type="string", example="usuario@empresa.com"),
 *              )
 *          )
 *      ),
 *      @OA\Response(response=401, description="Credenciais inválidas"),
 * )
 */


    //método para login
    public function login(Request $request)
    {
        $request->validate([
            'cpf' => 'required|string|size:14',
            'password' => 'required|string|min:8',
        ]);

        try {
            $data = $this->authService->login($request->cpf, $request->password);
            return response()->json($data);
        } catch (ValidationException $e) {
            return response()->json(['message' => 'Credenciais inválidas'], 401);
        }
    }

/**
 * @OA\Post(
 *      path="/api/logout",
 *      tags={"Autenticação"},
 *      summary="Faz logout do usuário",
 *      description="Revoga o token de autenticação do usuário",
 *      security={{"passport":{}}},
 *      @OA\Response(
 *          response=200,
 *          description="Logout realizado com sucesso",
 *          @OA\JsonContent(
 *              @OA\Property(property="message", type="string", example="Logout realizado com sucesso")
 *          )
 *      ),
 *      @OA\Response(response=401, description="Não autenticado"),
 * )
 */


//método para logout
public function logout()
{
    $this->authService->logout(Auth::user());

    return response()->json(['message' => 'Logout realizado com sucesso']);
}
}
