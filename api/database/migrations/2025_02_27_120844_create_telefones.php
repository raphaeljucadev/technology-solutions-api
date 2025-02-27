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
       // Criando a tabela telefones
       Schema::create('telefones', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('user_id'); // Chave estrangeira para users
        $table->string('ddd', 2);
        $table->string('celular', 15)->nullable(); // (xx) xxxxx-xxxx
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
        Schema::dropIfExists('telefones');
    }
};
