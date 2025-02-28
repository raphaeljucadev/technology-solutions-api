<?php

namespace App\Services;

use App\Models\Address;
use App\Rules\CepFormat;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;

class AddressService
{
    public function validateData(array $data, bool $isUpdate = false): array
    {
        $rules = [
            'user_id' => $isUpdate ? 'sometimes|exists:users,id' : 'required|exists:users,id',
            'cep' => ['required', 'string', new CepFormat],
            'uf' => 'required|string|size:2',
            'localidade' => 'required|string|max:30',
            'bairro' => 'required|string|max:40',
            'logradouro' => 'required|string|max:100',
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }

        return $validator->validated();
    }

    public function create(array $data): Address
    {
        $validatedData = $this->validateData($data);
        return Address::create($validatedData);
    }

    public function findById(int $id): Address
    {
        return Address::findOrFail($id);
    }

    public function update(int $id, array $data): Address
    {
        $address = Address::findOrFail($id);
        $validatedData = $this->validateData($data, true);
        $address->update($validatedData);
        return $address;
    }
}
