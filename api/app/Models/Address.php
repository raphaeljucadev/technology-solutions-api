<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

    protected $table = 'enderecos';

    protected $fillable = ['user_id', 'cep', 'uf', 'localidade', 'bairro', 'logradouro'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
