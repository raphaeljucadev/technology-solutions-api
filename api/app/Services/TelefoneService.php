<?php

namespace App\Services;

use App\Models\Telefone;
use App\Rules\DddFormat;
use App\Rules\CelularFormat;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class TelefoneService
{
    public function validateData(array $data, bool $isUpdate = false): array
    {
        $rules = [
            'user_id' => $isUpdate ? 'sometimes|exists:users,id' : 'required|exists:users,id',
            'telefones' => 'required|array|min:1',
            'telefones.*.id' => $isUpdate ? 'required|exists:telefones,id' : 'sometimes|exists:telefones,id',
            'telefones.*.ddd' => ['required', 'string', new DddFormat],
            'telefones.*.celular' => ['nullable', 'string', new CelularFormat],
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }

        return $validator->validated();
    }

    public function create(array $data): array
    {
        $validatedData = $this->validateData($data);

        $telefonesCriados = [];
        foreach ($validatedData['telefones'] as $telefone) {
            $telefonesCriados[] = Telefone::create([
                'user_id' => $validatedData['user_id'],
                'ddd' => $telefone['ddd'],
                'celular' => $telefone['celular'] ?? null,
            ]);
        }

        return $telefonesCriados;
    }

    public function findById(int $id): Telefone
    {
        return Telefone::findOrFail($id);
    }

    public function update(array $data): array
    {
        $validatedData = $this->validateData($data, true);

        $telefonesAtualizados = [];
        foreach ($validatedData['telefones'] as $telefone) {
            $telefoneModel = Telefone::findOrFail($telefone['id']);
            $telefoneModel->update([
                'ddd' => $telefone['ddd'],
                'celular' => $telefone['celular'] ?? null,
            ]);
            $telefonesAtualizados[] = $telefoneModel;
        }

        return $telefonesAtualizados;
    }
}
