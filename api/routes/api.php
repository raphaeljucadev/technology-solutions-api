<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AddressController;
use App\Http\Controllers\TelefoneController;
use App\Http\Controllers\UserTypeController;
use App\Http\Controllers\ColaboradoresController;
use App\Http\Controllers\ConviteController;




Route::prefix('api')->group(function () {

    //criação de rotas para login
    Route::post('/login', [AuthController::class, 'login']);

     //criação de rotas para usuários
    Route::post('/users', [UserController::class, 'store']);





    // Rotas protegidas
    Route::middleware('auth:api')->group(function () {
        // criação de rota para logout
        Route::post('/logout', [AuthController::class, 'logout']);
        //criação de rota para alterar users
        Route::put('/users/{id}', [UserController::class, 'update']);
        //alterar senha
        Route::post('/password/reset', [AuthController::class, 'resetPassword']);


        //criação de rotas para endereços
        Route::post('/endereco', [AddressController::class, 'store']);
        Route::get('/endereco/{id}', [AddressController::class, 'show']);
        Route::put('/endereco/{id}', [AddressController::class, 'update']);

        //criação de rotas para telefones

        Route::post('/telefone', [TelefoneController::class, 'store']);
        Route::get('/telefone/{id}', [TelefoneController::class, 'show']);
        Route::put('/telefone', [TelefoneController::class, 'update']);

        //criação de rotas para tipos de usuários
        Route::get('/user-types', [UserTypeController::class, 'index']);
        Route::get('/user-types/{id}', [UserTypeController::class, 'show']);
        Route::post('/user-types', [UserTypeController::class, 'store']);


        Route::get('/colaboradores', [ColaboradoresController::class, 'index']);

        Route::get('/colaboradores/search', [ColaboradoresController::class, 'search']);

        Route::get('/colaboradores/{id}', [ColaboradoresController::class, 'show']);

        Route::put('/colaboradores/{id}/perfil', [ColaboradoresController::class, 'updateUserType']);

        Route::post('/convites', [ConviteController::class, 'enviarConvite']);


    });



});

