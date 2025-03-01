<?php


namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Rules\CpfRule;
use App\Rules\StrongPasswordRule;
use Illuminate\Support\Facades\Validator;
use Laravel\Passport\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Http\Exceptions\HttpResponseException;
use App\Models\Usertype;


class AuthService
{
    public function login(string $cpf, string $password)
{
    // Validação do CPF usando a regra personalizada CpfRule
    $validator = Validator::make(['cpf' => $cpf], ['cpf' => new CpfRule()]);

    if ($validator->fails()) {

        throw new HttpResponseException(
            response()->json(['message' => 'O CPF informado é inválido.'], 401)
        );
    }


    // Buscar usuário pelo CPF formatado
    $user = User::where('cpf', $cpf)->first();

    // Verificar se o usuário existe e se a senha está correta
    if (!$user || !Hash::check($password, $user->password)) {
        throw new HttpResponseException(
            response()->json(['message' => 'Credenciais inválidas'], 401)
        );
    }

    $user_type_id = $user->user_type_id;

    $users_type = Usertype::where('id', $user_type_id)->first();

    if ($users_type->name != 'Administrador' && $users_type->name != 'Gente e Cultura') {
        throw new HttpResponseException(
            response()->json(['message' => 'Você não tem permissões.'], 401)
        );
    }



    // Revogar tokens antigos
    $user->tokens()->delete();
    $client = Client::where('password_client', true)->first();


    if (!$client) {
        return response()->json(['message' => 'Cliente OAuth não encontrado'], 500);
    }

    $token = $user->createToken('auth_token', ['*'], $client->id)->accessToken;



    return [
        'token' => $token,
        'user' => [
            'id' => $user->id,
            'name' => $user->name,
            'cpf' => $user->cpf,
            'email' => $user->email,
            'user_type_id' => $user->user_type_id,

        ]
    ];
}
public function logout()
{
    $user = Auth::user();

    if (!$user) {
        return response()->json(['message' => 'Usuário não autenticado'], 401);
    }

    // Revogar todos os tokens do usuário autenticado
    $user->tokens()->delete();

    return response()->json(['message' => 'Logout realizado com sucesso']);
}

    public function resetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'cpf' => ['required', 'string', 'size:14', new CpfRule()],
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
