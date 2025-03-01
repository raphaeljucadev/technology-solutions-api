<?php

namespace Tests\Unit;

use App\Rules\DddFormat;
use Illuminate\Support\Facades\Validator;
use Tests\TestCase;

class DddFormatTest extends TestCase
{
    public function test_ddd_valido_deve_passar_na_validacao()
    {
        $rule = new DddFormat();

        $validator = Validator::make(
            ['ddd' => '11'],
            ['ddd' => [$rule]]
        );

        $this->assertFalse($validator->fails(), 'DDD válido não deveria falhar na validação.');
    }

    public function test_ddd_invalido_deve_falhar_na_validacao()
    {
        $rule = new DddFormat();

        $ddds_invalidos = [
            '1',    // Apenas 1 dígito
            '111',  // Mais de 2 dígitos
            'AA',   // Letras no lugar dos números
            'A1',   // Mistura de letras e números
        ];

        foreach ($ddds_invalidos as $ddd) {
            $validator = Validator::make(
                ['ddd' => $ddd],
                ['ddd' => [$rule]]
            );

            $this->assertTrue($validator->fails(), "O DDD inválido '{$ddd}' deveria falhar na validação.");
        }
    }
}
