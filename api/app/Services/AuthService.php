<?php


namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Rules\CpfRule;
use App\Rules\StrongPasswordRule;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\Client;

class AuthService
{
    public function login(string $cpf, string $password)
{
    // Validação do CPF usando a regra personalizada CpfRule
    $validator = Validator::make(['cpf' => $cpf], ['cpf' => new CpfRule()]);

    if ($validator->fails()) {
        throw ValidationException::withMessages(['cpf' => 'O CPF informado é inválido.']);
    }


    // Buscar usuário pelo CPF formatado
    $user = User::where('cpf', $cpf)->first();

    // Verificar se o usuário existe e se a senha está correta
    if (!$user || !Hash::check($password, $user->password)) {
        throw ValidationException::withMessages(['message' => 'Credenciais inválidas']);
    }

    // Revogar tokens antigos
    $user->tokens()->delete();

    $personalAccessClient = Client::where('personal_access_client', true)->first();

    $token = $user->createToken('auth_token', ['*'], $personalAccessClient->id)->accessToken;

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

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cpf' => ['required', 'string', 'size:14', 'unique:users', new CpfRule()],
            'password' => ['required', 'string', new StrongPasswordRule()],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::where('cpf', $request->cpf)->first();
        $user->password = Hash::make($request->password);
        $user->save();

        return response()->json(['message' => 'Senha alterada com sucesso.']);
    }
}
