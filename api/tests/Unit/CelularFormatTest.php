<?php

namespace Tests\Unit;

use App\Rules\CelularFormat;
use Illuminate\Support\Facades\Validator;
use Tests\TestCase;

class CelularFormatTest extends TestCase
{
    public function test_celular_valido_deve_passar_na_validacao()
    {
        $rule = new CelularFormat();

        $validator = Validator::make(
            ['celular' => '98765-4321'],
            ['celular' => [$rule]]
        );

        $this->assertFalse($validator->fails(), 'Celular válido não deveria falhar na validação.');
    }

    public function test_celular_invalido_deve_falhar_na_validacao()
    {
        $rule = new CelularFormat();

        $celulares_invalidos = [
            '987654321',  // Sem hífen
            '9876-4321',  // Dígitos insuficientes
            'abcde-1234', // Letras no lugar dos números
            '12345-67890' // Dígitos a mais
        ];

        foreach ($celulares_invalidos as $celular) {
            $validator = Validator::make(
                ['celular' => $celular],
                ['celular' => [$rule]]
            );

            $this->assertTrue($validator->fails(), "O celular inválido '{$celular}' deveria falhar na validação.");
        }
    }
}
