<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Console\Scheduling\Schedule;
use App\Console\Commands\AtualizarConvitesExpirados;

app()->booted(function () {
    $schedule = app(Schedule::class);

    $schedule->command(AtualizarConvitesExpirados::class)->everyMinute();
});
