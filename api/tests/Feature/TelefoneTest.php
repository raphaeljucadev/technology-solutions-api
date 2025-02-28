<?php

namespace Tests\Feature;

use App\Models\Telefone;
use App\Models\User;
use Laravel\Passport\Passport;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

class TelefoneTest extends TestCase
{
    use DatabaseTransactions;

    public function test_usuario_pode_criar_varios_telefones()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        $resposta = $this->postJson('/api/telefone', [
            'user_id' => $usuario->id,
            'telefones' => [
                ['ddd' => '11', 'celular' => '98765-4321'],
                ['ddd' => '21', 'celular' => '92345-6789'],
                ['ddd' => '31', 'celular' => '96547-1234'],
            ],
        ]);

        $resposta->assertStatus(201)
            ->assertJsonCount(3) // ✅ Garante que 3 telefones foram criados
            ->assertJsonFragment(['ddd' => '11', 'celular' => '98765-4321'])
            ->assertJsonFragment(['ddd' => '21', 'celular' => '92345-6789'])
            ->assertJsonFragment(['ddd' => '31', 'celular' => '96547-1234']);
    }

    public function test_usuario_pode_obter_telefone_por_id()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        $telefone = Telefone::factory()->create(['user_id' => $usuario->id]);

        $resposta = $this->getJson("/api/telefone/{$telefone->id}");

        $resposta->assertStatus(200)
            ->assertJson([
                'id' => $telefone->id,
                'ddd' => $telefone->ddd,
            ]);
    }

    public function test_usuario_pode_atualizar_varios_telefones()
    {
        $usuario = User::factory()->create();
        Passport::actingAs($usuario);

        $telefones = Telefone::factory()->count(3)->create(['user_id' => $usuario->id]);

        $resposta = $this->putJson('/api/telefone', [
            'user_id' => $usuario->id,
            'telefones' => [
                ['id' => $telefones[0]->id, 'ddd' => '22', 'celular' => '91234-5678'],
                ['id' => $telefones[1]->id, 'ddd' => '32', 'celular' => '94567-8901'],
                ['id' => $telefones[2]->id, 'ddd' => '42', 'celular' => '95678-9012'],
            ],
        ]);

        $resposta->assertStatus(200)
            ->assertJsonFragment(['ddd' => '22', 'celular' => '91234-5678'])
            ->assertJsonFragment(['ddd' => '32', 'celular' => '94567-8901'])
            ->assertJsonFragment(['ddd' => '42', 'celular' => '95678-9012']);
    }
}
