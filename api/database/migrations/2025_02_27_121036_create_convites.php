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
         // Criando a tabela convites
         Schema::create('convites', function (Blueprint $table) {
            $table->id();
            $table->string('email', 150);
            $table->unsignedBigInteger('user_id'); // Chave estrangeira para users
            $table->string('token', 255)->unique();
            $table->unsignedBigInteger('status_id'); // Chave estrangeira para status_convites
            $table->timestamps();
            $table->timestamp('expires_at')->nullable();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('status_id')->references('id')->on('status_convites')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('convites');
    }
};
