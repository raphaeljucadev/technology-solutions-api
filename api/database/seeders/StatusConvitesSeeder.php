<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class StatusConvitesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */

     // Método para inserir os status dos convites
    public function run(): void
    {
        $status = [
            ['name' => 'Finalizado'],
            ['name' => 'Em Aberto'],
            ['name' => 'Vencido'],
        ];

        DB::table('status_convites')->insert($status);
    }
}

