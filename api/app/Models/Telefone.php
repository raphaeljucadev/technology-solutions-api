<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Telefone extends Model
{
    use HasFactory;

    protected $table = 'telefones';

    protected $fillable = ['user_id', 'ddd', 'celular'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
