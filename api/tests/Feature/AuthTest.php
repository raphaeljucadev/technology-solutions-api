<?php

namespace Tests\Feature;

use App\Models\User;
use Laravel\Passport\Passport;
use Tests\TestCase;
use PHPUnit\Framework\Attributes\Test;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\Hash;

class AuthTest extends TestCase
{
    use DatabaseTransactions;

    #[Test]
    public function usuario_pode_fazer_login_com_credenciais_validas()
    {
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);

        $response = $this->postJson('/api/login', [
            'cpf' => '529.982.247-25',
            'password' => 'Senha123!', // Senha corrigida
        ]);

        $response->assertStatus(200)
                 ->assertJsonStructure([
                     'token',
                     'user' => [
                         'id',
                         'name',
                         'cpf',
                         'email',
                     ]
                 ]);
    }

    #[Test]
    public function usuario_nao_pode_fazer_login_com_credenciais_invalidas()
    {
        User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);

        $response = $this->postJson('/api/login', [
            'cpf' => '529.982.247-25',
            'password' => 'SenhaErrada!', // Senha errada
        ]);

        $response->assertStatus(401)
                 ->assertJson(['message' => 'Credenciais inválidas']);
    }

    #[Test]
    public function usuario_autenticado_pode_fazer_logout()
    {
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);

        Passport::actingAs($user, ['*']); // Garantir permissões

        $response = $this->postJson('/api/logout');

        $response->assertStatus(200)
                 ->assertJson(['message' => 'Logout realizado com sucesso']);
    }

    #[Test]
    public function usuario_nao_autenticado_nao_pode_fazer_logout()
    {
        $response = $this->postJson('/api/logout');

        $response->assertStatus(401);
    }

    #[Test]
    public function usuario_pode_resetar_senha_com_cpf_valido()
    {
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);

        $response = $this->postJson('/api/password/reset', [
            'cpf' => '529.982.247-25',
            'password' => 'NovaSenha@123'
        ]);

        $response->assertStatus(200)
                 ->assertJson(['message' => 'Senha alterada com sucesso.']);

        $user->refresh();
        $this->assertTrue(Hash::check('NovaSenha@123', $user->password));
    }

    #[Test]
    public function usuario_nao_pode_resetar_senha_com_cpf_invalido()
    {
        User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);

        $response = $this->postJson('/api/password/reset', [
            'cpf' => '111.111.111-11', // CPF não cadastrado
            'password' => 'NovaSenha@123'
        ]);

        $response->assertStatus(422)
                 ->assertJson(['errors' => ['cpf' => ['O CPF informado é inválido.']]]);
    }
}
