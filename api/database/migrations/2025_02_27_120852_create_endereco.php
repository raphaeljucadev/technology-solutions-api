<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Criando a tabela enderecos
        Schema::create('enderecos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // Chave estrangeira para users
            $table->string('cep', 9);
            $table->string('uf', 2);
            $table->string('localidade', 30);
            $table->string('bairro', 40);
            $table->string('logradouro', 100);
            $table->timestamps();

            // Definição da chave estrangeira
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enderecos');
    }
};
