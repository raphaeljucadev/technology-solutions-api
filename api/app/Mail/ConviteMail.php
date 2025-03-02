<?php
namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Convite;

class ConviteMail extends Mailable
{
    use Queueable, SerializesModels;

    public Convite $convite;

    /**
     * Criar uma nova instância de e-mail.
     */
    public function __construct(Convite $convite)
    {
        $this->convite = $convite;
    }

    /**
     * Definir o envelope do e-mail.
     */
    public function envelope(): \Illuminate\Mail\Mailables\Envelope
    {
        return new \Illuminate\Mail\Mailables\Envelope(
            subject: 'Convite para Cadastro'
        );
    }

    /**
     * Definir o conteúdo do e-mail.
     */
    public function content(): \Illuminate\Mail\Mailables\Content
    {
        return new \Illuminate\Mail\Mailables\Content(
            view: 'emails.convite', // Define a view do e-mail
            with: [
                'link' => url('http://angular-app:4200/cadastro?token=' . $this->convite->token),
                'email' => $this->convite->email
            ]
        );
    }

    /**
     * Anexos do e-mail (se houver).
     */
    public function attachments(): array
    {
        return [];
    }
}
