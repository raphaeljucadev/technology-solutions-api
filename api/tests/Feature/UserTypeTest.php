<?php

namespace Tests\Feature;

use App\Models\UserType;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use PHPUnit\Framework\Attributes\Test;
use Laravel\Passport\Passport;
use App\Models\User;

use Tests\TestCase;

class UserTypeTest extends TestCase
{
    use DatabaseTransactions;

    #[Test]
    public function pode_listar_tipos_de_usuario()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);


        // Fazer requisição GET para listar os tipos de usuário
        $response = $this->getJson('/api/user-types');

        // Verificar se a resposta foi bem-sucedida e contém 3 registros
        $response->assertStatus(200)
                 ->assertJsonCount(3);
    }

    #[Test]
    public function pode_exibir_um_tipo_de_usuario()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        // Criar um tipo de usuário
        $userType = UserType::factory()->create();

        // Fazer requisição GET para buscar esse tipo de usuário pelo ID
        $response = $this->getJson("/api/user-types/{$userType->id}");

        // Verificar se a resposta foi bem-sucedida e contém o ID correto
        $response->assertStatus(200)
                 ->assertJson(['id' => $userType->id]);
    }

    #[Test]
    public function pode_criar_um_novo_tipo_de_usuario()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        // Dados para criação de um tipo de usuário
        $data = ['name' => 'vendedor'];

        // Fazer requisição POST para criar o tipo de usuário
        $response = $this->postJson('/api/user-types', $data);

        // Verificar se a resposta foi de criação (201) e contém os dados corretos
        $response->assertStatus(201)
                 ->assertJson(['name' => 'vendedor']);

        // Verificar se o dado foi salvo no banco de dados
        $this->assertDatabaseHas('user_types', $data);

         // Apagar o registro criado no final do teste
    UserType::where('name', 'vendedor')->delete();
    }

    #[Test]
    public function nao_pode_criar_tipo_de_usuario_duplicado()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        // Criar um tipo de usuário no banco
        $userType = UserType::factory()->create();

        // Fazer requisição POST tentando criar um nome já existente
        $response = $this->postJson('/api/user-types', ['name' => $userType->name]);

        // Verificar se a resposta retorna erro de validação (422)
        $response->assertStatus(422);
    }

    #[Test]
    public function nao_pode_exibir_tipo_de_usuario_inexistente()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        // Fazer requisição GET para um ID inexistente
        $response = $this->getJson('/api/user-types/999');

        // Verificar se retorna erro 404 (não encontrado)
        $response->assertStatus(404);
    }
}
