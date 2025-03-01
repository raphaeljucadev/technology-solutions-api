<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens,HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'user_type_id',
        'cpf',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function convites()
{
    return $this->hasMany(Convite::class, 'user_id');
}
 /**
     * Relacionamento com UserType (Cada usuário pertence a um tipo de usuário)
     */
    public function userType(): BelongsTo
    {
        return $this->belongsTo(UserType::class, 'user_type_id');
    }

    /**
     * Relacionamento com Telefone (Um usuário pode ter vários telefones)
     */
    public function telefones(): HasMany
    {
        return $this->hasMany(Telefone::class, 'user_id');
    }

    /**
     * Relacionamento com Address (Um usuário tem um endereço)
     */
    public function endereco(): HasOne
    {
        return $this->hasOne(Address::class, 'user_id');
    }

}
