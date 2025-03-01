<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\Colaboradores;

/**
 * @OA\Tag(
 *     name="Colaboradores",
 *     description="Sessão para informações sobre colaboradores"
 * )
 */
class ColaboradoresController extends Controller
{
    protected Colaboradores $colaboradorService;

    public function __construct(Colaboradores $colaboradorService)
    {
        $this->colaboradorService = $colaboradorService;
    }

    /**
     * Listar colaboradores
     *
     * @OA\Get(
     *     path="/api/colaboradores",
     *     tags={"Colaboradores"},
     *     summary="Lista todos os colaboradores, com opção de pesquisa",
     *     security={{"bearerAuth":{}}},
     *     @OA\Response(
     *         response=200,
     *         description="Lista de colaboradores paginada",
     *         @OA\JsonContent(
     *             @OA\Property(property="current_page", type="integer", example=1),
     *             @OA\Property(property="data", type="array",
     *                 @OA\Items(
     *                     @OA\Property(property="id", type="integer", example=1),
     *                     @OA\Property(property="name", type="string", example="João Silva"),
     *                     @OA\Property(property="email", type="string", example="joao@email.com"),
     *                     @OA\Property(property="cpf", type="string", example="123.456.789-00")
     *                 )
     *             ),
     *             @OA\Property(property="first_page_url", type="string", example="http://localhost:8000/api/colaboradores?page=1"),
     *             @OA\Property(property="next_page_url", type="string", example="http://localhost:8000/api/colaboradores?page=2"),
     *             @OA\Property(property="per_page", type="integer", example=10),
     *             @OA\Property(property="total", type="integer", example=50)
     *         )
     *     ),
     *     @OA\Response(
     *         response=401,
     *         description="Não autorizado"
     *     )
     * )
     */
    public function index(Request $request)
    {
        $colaboradores = $this->colaboradorService->getColaboradoresFinalizados();

        return response()->json($colaboradores);
    }

/**
 * Pesquisar colaboradores finalizados
 *
 * @OA\Get(
 *     path="/api/colaboradores/search",
 *     tags={"Colaboradores"},
 *     summary="Pesquisa colaboradores pelo nome, email ou CPF e verifica se possuem convites finalizados",
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="query",
 *         in="query",
 *         required=true,
 *         description="Nome, email ou CPF do colaborador",
 *         @OA\Schema(type="string", example="João")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Lista de colaboradores filtrados",
 *         @OA\JsonContent(
 *             @OA\Property(property="current_page", type="integer", example=1),
 *             @OA\Property(property="data", type="array",
 *                 @OA\Items(
 *                     @OA\Property(property="id", type="integer", example=1),
 *                     @OA\Property(property="name", type="string", example="João Silva"),
 *                     @OA\Property(property="email", type="string", example="joao@email.com"),
 *                     @OA\Property(property="cpf", type="string", example="123.456.789-00")
 *                 )
 *             ),
 *             @OA\Property(property="per_page", type="integer", example=10),
 *             @OA\Property(property="total", type="integer", example=5)
 *         )
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Parâmetro de pesquisa inválido"
 *     ),
 *     @OA\Response(
 *         response=401,
 *         description="Não autorizado"
 *     )
 * )
 */
public function search(Request $request)
{
    $query = $request->query('query');

    if (!$query) {
        return response()->json(['error' => 'O parâmetro de pesquisa é obrigatório.'], 400);
    }

    $colaboradores = $this->colaboradorService->search($query);

    return response()->json($colaboradores);
}

/**
 * Obter informações de um colaborador pelo ID
 *
 * @OA\Get(
 *     path="/api/colaboradores/{id}",
 *     tags={"Colaboradores"},
 *     summary="Obtém todas as informações de um colaborador pelo ID",
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID do colaborador",
 *         @OA\Schema(type="integer", example=1)
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Detalhes do colaborador",
 *         @OA\JsonContent(
 *             @OA\Property(property="id", type="integer", example=1),
 *             @OA\Property(property="name", type="string", example="João Silva"),
 *             @OA\Property(property="email", type="string", example="joao@email.com"),
 *             @OA\Property(property="cpf", type="string", example="123.456.789-00"),
 *             @OA\Property(property="user_type", type="object",
 *                 @OA\Property(property="id", type="integer", example=2),
 *                 @OA\Property(property="name", type="string", example="Colaborador Comum")
 *             ),
 *             @OA\Property(property="telefones", type="array",
 *                 @OA\Items(
 *                     @OA\Property(property="id", type="integer", example=1),
 *                     @OA\Property(property="numero", type="string", example="(11) 91234-5678")
 *                 )
 *             ),
 *             @OA\Property(property="endereco", type="object",
 *                 @OA\Property(property="logradouro", type="string", example="Rua Exemplo, 123"),
 *                 @OA\Property(property="cidade", type="string", example="São Paulo"),
 *                 @OA\Property(property="estado", type="string", example="SP"),
 *                 @OA\Property(property="cep", type="string", example="01000-000")
 *             )
 *         )
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Colaborador não encontrado"
 *     )
 * )
 */
public function show($id)
{
    $colaborador = $this->colaboradorService->getColaboradorById($id);

    if (!$colaborador) {
        return response()->json(['error' => 'Colaborador não encontrado'], 404);
    }

    return response()->json($colaborador);
}

  /**
     * Atualizar perfil do colaborador
     *
     * @OA\Put(
     *     path="/api/colaboradores/{id}/perfil",
     *     tags={"Colaboradores"},
     *     summary="Atualiza o tipo de perfil do colaborador",
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         required=true,
     *         description="ID do colaborador",
     *         @OA\Schema(type="integer", example=1)
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"user_type_id"},
     *             @OA\Property(property="user_type_id", type="integer", example=2),
     *             @OA\Property(property="password", type="string", example="novaSenha123", description="Obrigatório para Administrador ou Gente e Cultura")
     *         )
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Perfil atualizado com sucesso",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=200),
     *             @OA\Property(property="message", type="string", example="Perfil atualizado com sucesso"),
     *             @OA\Property(property="user", type="object",
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="João Silva"),
     *                 @OA\Property(property="email", type="string", example="joao@email.com"),
     *                 @OA\Property(property="user_type_id", type="integer", example=1)
     *             )
     *         )
     *     ),
     *     @OA\Response(
     *         response=400,
     *         description="Erro de validação",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=400),
     *             @OA\Property(property="message", type="string", example="Senha obrigatória para este tipo de perfil")
     *         )
     *     ),
     *     @OA\Response(
     *         response=403,
     *         description="Usuário sem permissão",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=403),
     *             @OA\Property(property="message", type="string", example="Você não tem permissão para essa alteração")
     *         )
     *     ),
     *     @OA\Response(
     *         response=404,
     *         description="Usuário não encontrado",
     *         @OA\JsonContent(
     *             @OA\Property(property="code", type="integer", example=404),
     *             @OA\Property(property="message", type="string", example="Usuário não encontrado")
     *         )
     *     )
     * )
     */
    public function updateUserType(Request $request, $id)
    {
        $request->validate([
            'user_type_id' => 'required|integer|exists:user_types,id',
            'password' => 'nullable|string|min:6'
        ]);

        $response = $this->colaboradorService->updateUserType($id, $request->user_type_id, $request->password);

        return $response;
    }


}
