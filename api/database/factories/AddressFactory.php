<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Address;
use App\Models\User;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Address>
 */
class AddressFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */

     protected $model = Address::class;

    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'cep' => $this->faker->regexify('[0-9]{5}-[0-9]{3}'),
            'uf' => $this->faker->stateAbbr(),
            'localidade' => $this->faker->city(),
            'bairro' => $this->faker->word(),
            'logradouro' => $this->faker->streetAddress(),
        ];
    }
}
