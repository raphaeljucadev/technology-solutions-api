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
        Schema::create('historico_alteracoes_perfil', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // Usuário cujo perfil foi alterado
            $table->unsignedBigInteger('user_type_old_id')->nullable(); // Tipo de usuário anterior
            $table->unsignedBigInteger('user_type_new_id')->nullable(); // Novo tipo de usuário
            $table->unsignedBigInteger('alterado_por'); // Usuário que fez a alteração
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('user_type_old_id')->references('id')->on('user_types')->onDelete('set null');
            $table->foreign('user_type_new_id')->references('id')->on('user_types')->onDelete('set null');
            $table->foreign('alterado_por')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('historico_alteracoes_perfil');
    }
};
