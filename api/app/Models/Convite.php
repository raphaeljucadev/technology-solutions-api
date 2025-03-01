<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Convite extends Model
{
    protected $table = 'convites';



    protected $fillable = ['email', 'token', 'status_id', 'user_id','expires_at','user_id'];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function status(): BelongsTo
    {
        return $this->belongsTo(StatusConvite::class, 'status_id');
    }


}
