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
        // Criar um usuário no banco de testes
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);


        // Tentar fazer login
        $response = $this->postJson('/api/login', [
            'cpf' => '529.982.247-25',
            'password' => 'Senha123!', // Senha correta
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
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);


        $response = $this->postJson('/api/login', [
            'cpf' => '529.982.247-25',
            'password' => 'SenhaErrada!2',
        ]);


        $response->assertStatus(401)
                 ->assertJson(['message' => 'Credenciais inválidas']);
    }


    #[Test]
    public function usuario_nao_pode_fazer_login_com_cpf_invalido()
    {
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);


        $response = $this->postJson('/api/login', [
            'cpf' => '00000000000000',
            'password' => 'Senha123!',
        ]);


        $response->assertStatus(401)
                 ->assertJson(['message' => 'O CPF informado é inválido.']);
    }

    #[Test]
public function usuario_autenticado_pode_fazer_logout()
{
    // Criar usuário e autenticar com Passport
    $user = User::factory()->create([
        'name' => 'New User',
        'cpf' => '529.982.247-25',
        'email' => 'new@example.com',
        'password' => Hash::make('Senha123!'),
        'user_type_id' => 1
    ]);

    // Gerar token OAuth2 real para o usuário
    $token = $user->createToken('auth_token')->accessToken;

    // Enviar requisição de logout com token válido
    $response = $this->postJson('/api/logout', [], [
        'Authorization' => 'Bearer ' . $token
    ]);

    // Validar resposta
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
        // Simular autenticação do usuário com Passport
        Passport::actingAs($user);

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
        $user = User::factory()->create([
            'name' => 'New User',
            'cpf' => '529.982.247-25',
            'email' => 'new@example.com',
            'password' => Hash::make('Senha123!'),
            'user_type_id' => 1
        ]);

        // Simular autenticação do Passport no ambiente de testes
        Passport::actingAs($user, ['*']);

        $response = $this->postJson('/api/password/reset', [
            'cpf' => '111.111.111-11', // CPF não cadastrado
            'password' => 'NovaSenha@123'
        ]);

        $response->assertStatus(422)
                 ->assertJson(['errors' => ['cpf' => ['O CPF informado é inválido.']]]);
    }
}
