<?php

namespace App\Http\Controllers;
/**
 * @OA\Info(
 *      title="API Technology Solutions",
 *      version="1.0.0",
 *      description="Documentação da API de onboarding de colaboradores",
 *      @OA\Contact(
 *          email="suporte@empresa.com"
 *      )
 * )
 * @OA\SecurityScheme(
 *     securityScheme="bearerAuth",
 *     type="http",
 *     scheme="bearer",
 *     bearerFormat="JWT",
 *     description="Utilize o Bearer Token para acessar rotas seguras"
 * )
 */
abstract class Controller
{
    //
}
