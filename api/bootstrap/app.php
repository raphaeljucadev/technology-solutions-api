<?php

use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use League\OAuth2\Server\Exception\OAuthServerException;
use Symfony\Component\HttpKernel\Exception\UnauthorizedHttpException;
use Illuminate\Auth\Middleware\Authenticate;
use Symfony\Component\HttpFoundation\Response;


return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->validateCsrfTokens(except: [
           'api/*',
        ]);

    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Captura erros de token expirado/revogado e retorna 401
        $exceptions->render(function (OAuthServerException $exception) {
            return response()->json([
                'message' => 'Token inválido ou expirado. Faça login novamente.'
            ], 401);
        });

        // Captura erros de autenticação e retorna 401
        $exceptions->render(function (AuthenticationException $exception) {
            return response()->json([
                'message' => 'Usuário não autenticado. Faça login novamente.'
            ], 401);
        });

        // Captura outros erros 401 para garantir respostas consistentes
        $exceptions->render(function (UnauthorizedHttpException $exception) {
            return response()->json([
                'message' => 'Acesso negado. Token inválido ou ausente.'
            ], 401);
        });
    })
    ->create();
