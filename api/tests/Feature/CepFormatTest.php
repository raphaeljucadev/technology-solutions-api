<?php

namespace Tests\Unit;

use App\Rules\CepFormat;
use Illuminate\Support\Facades\Validator;
use Tests\TestCase;

class CepFormatTest extends TestCase
{
    public function test_cep_valido_deve_passar_na_validacao()
    {
        $rule = new CepFormat();

        $validator = Validator::make(
            ['cep' => '12345-678'],
            ['cep' => [$rule]]
        );

        $this->assertFalse($validator->fails(), 'CEP válido não deveria falhar na validação.');
    }

    public function test_cep_invalido_deve_falhar_na_validacao()
    {
        $rule = new CepFormat();

        $ceps_invalidos = [
            '12345678',   // Sem hífen
            '1234-567',   // Dígitos insuficientes
            '12a45-678',  // Caracteres inválidos
            '12345-6789', // Dígitos a mais
            'ABCDE-123'   // Letras no lugar dos números
        ];

        foreach ($ceps_invalidos as $cep) {
            $validator = Validator::make(
                ['cep' => $cep],
                ['cep' => [$rule]]
            );

            $this->assertTrue($validator->fails(), "O CEP inválido '{$cep}' deveria falhar na validação.");
        }
    }
}
