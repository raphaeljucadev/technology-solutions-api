<?php

use Illuminate\Console\Scheduling\Schedule;
use App\Console\Commands\AtualizarConvitesExpirados;

return function (Schedule $schedule) {
    $schedule->command(AtualizarConvitesExpirados::class)->everyMinute(); // Executa a cada 1 minuto
};
