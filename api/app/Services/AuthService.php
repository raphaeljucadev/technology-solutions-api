<?php


namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthService
{
    public function login(string $cpf, string $password)
    {
        // Buscar usuário pelo CPF
        $user = User::where('cpf', $cpf)->first();

        // Verificar se o usuário existe e se a senha está correta
        if (!$user || !Hash::check($password, $user->password)) {
            throw ValidationException::withMessages(['message' => 'Credenciais inválidas']);
        }

        // Revogar tokens antigos
        $user->tokens()->delete();

        // Criar um novo token OAuth2
        $token = $user->createToken('auth_token')->accessToken;

        return [
            'token' => $token,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'cpf' => $user->cpf,
                'email' => $user->email,
            ]
        ];
    }

    public function logout($user)
    {
        $user->token()->revoke();
    }
}
