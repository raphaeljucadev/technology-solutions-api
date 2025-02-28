<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Telefone;
use App\Models\User;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Telefone>
 */
class TelefoneFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'ddd' => $this->faker->numerify('##'), // Gera um número de 2 dígitos
            'celular' => $this->faker->regexify('[0-9]{5}-[0-9]{4}'), // Formato xxxxx-xxxx
        ];
    }
}
