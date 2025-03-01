<?php
namespace App\Jobs;

use App\Models\Convite;
use App\Mail\ConviteMail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class SendConviteEmailJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $convite;

    public function __construct(Convite $convite)
    {
        $this->convite = $convite;
    }

    public function handle()
    {
        Mail::to($this->convite->email)->send(new ConviteMail($this->convite));
    }
}
