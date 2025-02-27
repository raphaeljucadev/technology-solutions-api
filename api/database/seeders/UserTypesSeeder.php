<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserTypesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */

     // Método para inserir os tipos de usuários
    public function run(): void
    {
        $userTypes = [
            ['name' => 'Administrador'],
            ['name' => 'Gente e Cultura'],
            ['name' => 'Colaborador Comum'],
        ];

        DB::table('user_types')->insert($userTypes);
    }
}
