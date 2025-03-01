<?php



namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Console\Scheduling\Schedule;
use App\Models\Convite;
use App\Models\StatusConvite;
use Carbon\Carbon;

class AtualizarConvitesExpirados extends Command
{
    /**
     * Nome do comando Artisan.
     */
    protected $signature = 'app:atualizar-convites-expirados';

    /**
     * Descrição do comando.
     */
    protected $description = 'Atualiza convites expirados para o status "Vencido".';

    /**
     * Agendar a execução do comando automaticamente.
     */
    public function schedule(Schedule $schedule): void
    {
        $schedule->command(static::class)->everyMinute(); // Executa a cada 1 minuto
    }

    /**
     * Executa o comando.
     */
    public function handle()
    {
        $this->info('Iniciando atualização de convites expirados...');

        // Buscar o status "Vencido"
        $statusVencido = StatusConvite::where('name', 'Vencido')->first();

        if (!$statusVencido) {
            $this->error('Erro: Status "Vencido" não encontrado.');
            return;
        }

        // Atualizar convites expirados
        $convitesAtualizados = Convite::where('status_id', '!=', $statusVencido->id)
            ->where('expires_at', '<', Carbon::now()) // Apenas os que já expiraram
            ->update(['status_id' => $statusVencido->id]);

        $this->info("Convites expirados atualizados: $convitesAtualizados");
    }
}

