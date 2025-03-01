<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use App\Models\User;
use Laravel\Passport\Passport;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Hash;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

class UserTest extends TestCase
{
    use DatabaseTransactions;

    #[Test]
    public function cria_um_usuario_com_sucesso()
    {
        $response = $this->postJson('/api/users', [
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => 'Secure@123',
            'user_type_id' => 1
        ]);

        $response->assertStatus(201)
                 ->assertJsonStructure(['message', 'user']);
    }

    #[Test]
    public function atualiza_um_usuario_com_sucesso()
    {
        $user = User::factory()->create();
        Passport::actingAs($user);

        $response = $this->putJson("/api/users/{$user->id}", [
            'name' => 'Updated Name'
        ]);

        $response->assertStatus(200)
                 ->assertJson(['message' => 'Usuário atualizado com sucesso!']);
    }
}
