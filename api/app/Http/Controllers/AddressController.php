<?php

namespace App\Http\Controllers;

use App\Services\AddressService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;


/**
 * @OA\Tag(
 *     name="Endereço",
 *     description="Gerenciamento de endereços dos usuários"
 * )
 */
class AddressController extends Controller
{
    private AddressService $addressService;

    public function __construct(AddressService $addressService)
    {
        $this->addressService = $addressService;
    }

    /**
     * @OA\Post(
     *      path="/api/endereco",
     *      tags={"Endereço"},
     *      summary="Cria um novo endereço",
     *      security={{"bearerAuth":{}}},
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              required={"user_id", "cep", "uf", "localidade", "bairro", "logradouro"},
     *              @OA\Property(property="user_id", type="integer", example=1),
     *              @OA\Property(property="cep", type="string", example="01001-000"),
     *              @OA\Property(property="uf", type="string", example="SP"),
     *              @OA\Property(property="localidade", type="string", example="São Paulo"),
     *              @OA\Property(property="bairro", type="string", example="Centro"),
     *              @OA\Property(property="logradouro", type="string", example="Rua Exemplo")
     *          )
     *      ),
     *      @OA\Response(response=201, description="Endereço criado com sucesso"),
     *      @OA\Response(response=422, description="Erro de validação"),
     *      @OA\Response(response=401, description="Não autorizado")
     * )
     */
    public function store(Request $request): JsonResponse
    {
        try {
            $address = $this->addressService->create($request->all());
            return response()->json($address, 201);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
    }

     /**
     * @OA\Get(
     *      path="/api/endereco/{id}",
     *      tags={"Endereço"},
     *      summary="Busca um endereço pelo ID",
     *      security={{"bearerAuth":{}}},
     *      @OA\Parameter(name="id", in="path", required=true, description="ID do endereço", @OA\Schema(type="integer")),
     *      @OA\Response(response=200, description="Endereço encontrado"),
     *      @OA\Response(response=404, description="Endereço não encontrado"),
     *      @OA\Response(response=401, description="Não autorizado")
     * )
     */
    public function show($id): JsonResponse
    {
        $address = $this->addressService->findById($id);
        return response()->json($address);
    }

      /**
     * @OA\Put(
     *      path="/api/endereco/{id}",
     *      tags={"Endereço"},
     *      summary="Atualiza um endereço existente",
     *      security={{"bearerAuth":{}}},
     *      @OA\Parameter(name="id", in="path", required=true, description="ID do endereço", @OA\Schema(type="integer")),
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              @OA\Property(property="cep", type="string", example="22041-001"),
     *              @OA\Property(property="uf", type="string", example="RJ"),
     *              @OA\Property(property="localidade", type="string", example="Rio de Janeiro"),
     *              @OA\Property(property="bairro", type="string", example="Copacabana"),
     *              @OA\Property(property="logradouro", type="string", example="Avenida Atlântica")
     *          )
     *      ),
     *      @OA\Response(response=200, description="Endereço atualizado com sucesso"),
     *      @OA\Response(response=422, description="Erro de validação"),
     *      @OA\Response(response=401, description="Não autorizado")
     * )
     */
    public function update(Request $request, $id): JsonResponse
    {
        try {
            $address = $this->addressService->update($id, $request->all());
            return response()->json($address);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
    }
}
