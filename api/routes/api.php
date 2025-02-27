<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;



//criação de rotas para login e logout
Route::post('/login', [AuthController::class, 'login']);

//uso do middleware para proteger as rotas
Route::middleware('auth:api')->group(function () {

    // criação de rota para logout
    Route::post('/logout', [AuthController::class, 'logout']);

});


