<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Payment extends Model
{
    protected $primaryKey = 'order_id';
    public $incrementing = false;

    protected $fillable = [
        'order_id',
        'paid_at',
        'amount',
        'provider_fee',
        'receipt_url',
        'meta',
    ];

    protected $casts = [
        'paid_at' => 'datetime',
        'amount_paisa' => 'integer',
        'provider_fee_paisa' => 'integer',
        'meta' => 'array',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class);
    }
}
