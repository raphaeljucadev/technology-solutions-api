<?php

namespace Tests\Unit;

use App\Rules\StrongPasswordRule;
use Illuminate\Support\Facades\Validator;
use PHPUnit\Framework\Attributes\Test;
use Tests\TestCase;

class StrongPasswordRuleTest extends TestCase
{
    #[Test]
    public function aceita_uma_senha_forte()
    {
        $rule = new StrongPasswordRule();
        $validator = Validator::make(['password' => 'Secure@123'], ['password' => $rule]);

        $this->assertFalse($validator->fails(), 'A senha forte não deveria falhar.');
    }

    #[Test]
    public function rejeita_uma_senha_com_menos_de_8_caracteres()
    {
        $rule = new StrongPasswordRule();
        $validator = Validator::make(['password' => 'S@1a'], ['password' => $rule]);

        $this->assertTrue($validator->fails(), 'Senhas com menos de 8 caracteres devem ser rejeitadas.');
    }

    #[Test]
    public function rejeita_uma_senha_sem_letra_maiuscula()
    {
        $rule = new StrongPasswordRule();
        $validator = Validator::make(['password' => 'secure@123'], ['password' => $rule]);

        $this->assertTrue($validator->fails(), 'Senhas sem letra maiúscula devem ser rejeitadas.');
    }

    #[Test]
    public function rejeita_uma_senha_sem_letra_minuscula()
    {
        $rule = new StrongPasswordRule();
        $validator = Validator::make(['password' => 'SECURE@123'], ['password' => $rule]);

        $this->assertTrue($validator->fails(), 'Senhas sem letra minúscula devem ser rejeitadas.');
    }

    #[Test]
    public function rejeita_uma_senha_sem_numeros()
    {
        $rule = new StrongPasswordRule();
        $validator = Validator::make(['password' => 'Secure@aaa'], ['password' => $rule]);

        $this->assertTrue($validator->fails(), 'Senhas sem números devem ser rejeitadas.');
    }

    #[Test]
    public function rejeita_uma_senha_sem_caractere_especial()
    {
        $rule = new StrongPasswordRule();
        $validator = Validator::make(['password' => 'Secure123'], ['password' => $rule]);

        $this->assertTrue($validator->fails(), 'Senhas sem caractere especial devem ser rejeitadas.');
    }
}
