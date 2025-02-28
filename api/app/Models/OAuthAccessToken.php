<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class OAuthAccessToken extends Model
{
    public $incrementing = false;
    protected $keyType = 'string';

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($token) {
            dd('Modelo OAuthAccessToken está sendo usado!');
            $token->id = $token->id ?? (string) Str::uuid(); // Gera um UUID automaticamente
        });
    }
}
