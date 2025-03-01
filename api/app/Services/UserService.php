<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Rules\CpfRule;
use App\Rules\StrongPasswordRule;

class UserService
{
    public function createUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:100',
            'cpf' => ['required', 'string', 'size:14', 'unique:users', new CpfRule()],
            'email' => 'required|email|unique:users',
            'password' => ['required', 'string', new StrongPasswordRule()],
            'user_type_id' => 'required|integer|exists:user_types,id'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = User::create([
            'name' => $request->name,
            'cpf' => $request->cpf,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'user_type_id' => $request->user_type_id
        ]);
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
