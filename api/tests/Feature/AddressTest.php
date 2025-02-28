<?php

namespace Tests\Feature;

use App\Models\Address;
use App\Models\User;
use Laravel\Passport\Passport;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class AddressTest extends TestCase
{
    use DatabaseTransactions;

    public function test_usuario_pode_criar_endereco()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        $resposta = $this->postJson('/api/endereco', [
            'user_id' => $usuario->id,
            'cep' => '01001-000',
            'uf' => 'SP',
            'localidade' => 'São Paulo',
            'bairro' => 'Centro',
            'logradouro' => 'Rua Teste',
        ]);

        $resposta->assertStatus(201)
            ->assertJson([
                'cep' => '01001-000',
                'uf' => 'SP',
            ]);
    }

    public function test_usuario_pode_obter_endereco_por_id()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        $endereco = Address::factory()->create(['user_id' => $usuario->id]);

        $resposta = $this->getJson("/api/endereco/{$endereco->id}");

        $resposta->assertStatus(200)
            ->assertJson([
                'id' => $endereco->id,
                'cep' => $endereco->cep,
            ]);
    }

    public function test_usuario_pode_atualizar_endereco()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        $endereco = Address::factory()->create([
            'user_id' => $usuario->id,
            'cep' => '01001-000',
            'uf' => 'SP',
            'localidade' => 'São Paulo',
            'bairro' => 'Centro',
            'logradouro' => 'Rua Teste',
        ]);

        $resposta = $this->putJson("/api/endereco/{$endereco->id}", [
            'cep' => '22041-001',
            'uf' => 'RJ',
            'localidade' => 'Rio de Janeiro',
            'bairro' => 'Rocinha',
            'logradouro' => 'Rua Teste 2',
        ]);

        $resposta->assertStatus(200)
            ->assertJson([
                'cep' => '22041-001',
                'uf' => 'RJ',
            ]);
    }

    public function test_usuario_nao_autenticado_nao_pode_criar_endereco()
    {
        $resposta = $this->postJson('/api/endereco', [
            'user_id' => 1,
            'cep' => '01001-000',
            'uf' => 'SP',
            'localidade' => 'São Paulo',
            'bairro' => 'Centro',
            'logradouro' => 'Rua Teste',
        ]);

        $resposta->assertStatus(401);
    }
}
