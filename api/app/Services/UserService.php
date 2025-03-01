<?php

namespace App\Services;

use App\Models\User;
use App\Models\UserType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Rules\CpfRule;
use App\Rules\StrongPasswordRule;
Use App\Models\StatusConvite;
Use App\Models\Convite;

class UserService
{
    public function createUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:100',
            'cpf' => ['required', 'string', 'size:14', 'unique:users', new CpfRule()],
            'email' => 'required|email|unique:users',

        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Buscar o ID do UserType onde o name é "Colaborador Comum"
        $userType = UserType::where('name', 'Colaborador Comum')->first();

        if (!$userType) {
            return response()->json(['error' => 'Tipo de usuário "Colaborador Comum" não encontrado.'], 404);
        }

        $user = User::create([
            'name' => $request->name,
            'cpf' => $request->cpf,
            'email' => $request->email,
            'password' => Hash::make('SenhaP@adrao123'),
            'user_type_id' => $userType->id
        ]);

        // Obter o status "Finalizado"
        $status_convites = StatusConvite::where('name', 'Finalizado')->first();

        // Verificar se o status foi encontrado
    if ($status_convites) {
    // Atualizar o campo status_id na tabela Convites
    $convite = Convite::where('email', $user->email)->first();

    if ($convite) {
        $convite->status_id = $status_convites->id;
        $convite->save();
    }
}

        return response()->json(['message' => 'Usuário criado com sucesso!', 'user' => $user], 201);
    }

    public function updateUser(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'name' => 'sometimes|required|string|max:100',
            'cpf' => 'sometimes|required|string|size:14|unique:users,cpf,' . $id,
            'user_type_id' => 'sometimes|required|integer|exists:user_types,id'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user->update($request->only(['name', 'cpf', 'user_type_id']));

        return response()->json(['message' => 'Usuário atualizado com sucesso!', 'user' => $user]);
    }
}
