<?php
namespace Tests\Unit;

use App\Rules\CpfRule;
use Illuminate\Support\Facades\Validator;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

class CpfRuleTest extends TestCase
{
    #[Test]
    public function aceita_um_cpf_valido()
    {
        $rule = new CpfRule();
        $validator = Validator::make(['cpf' => '529.982.247-25'], ['cpf' => $rule]);

        $this->assertFalse($validator->fails(), 'O CPF válido não deveria falhar.');
    }

    #[Test]
    public function rejeita_um_cpf_com_formato_incorreto()
    {
        $rule = new CpfRule();
        $validator = Validator::make(['cpf' => '123.456.789.000'], ['cpf' => $rule]);

        $this->assertTrue($validator->fails(), 'O CPF com formato inválido deveria falhar.');
    }

    #[Test]
    public function rejeita_um_cpf_com_numeros_repetidos()
    {
        $rule = new CpfRule();
        $validator = Validator::make(['cpf' => '111.111.111-11'], ['cpf' => $rule]);

        $this->assertTrue($validator->fails(), 'O CPF com todos os números iguais deveria ser inválido.');
    }

    #[Test]
    public function rejeita_um_cpf_invalido()
    {
        $rule = new CpfRule();
        $validator = Validator::make(['cpf' => '529.982.247-26'], ['cpf' => $rule]); // Número errado

        $this->assertTrue($validator->fails(), 'O CPF inválido deveria falhar.');
    }
}
