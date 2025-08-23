<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class BoostPlan extends Model
{
    use HasFactory, HasUuids;

    protected $fillable = [
        'name',
        'days',
        'price_paisa',
        'currency',
        'priority',
    ];

    protected $casts = [
        'days' => 'integer',
        'price_paisa' => 'integer',
        'priority' => 'integer',
    ];

    public function boosts(): HasMany
    {
        return $this->hasMany(Boost::class, 'plan_id');
    }
}
