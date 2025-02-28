<?php
namespace App\Services;

use App\Models\UserType;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class UserTypeService
{
    public function getAll()
    {
        return UserType::all();
    }

    public function findById(int $id)
    {
        return UserType::findOrFail($id);
    }

    public function create(array $data)
    {
        return UserType::create($data);
    }
}
