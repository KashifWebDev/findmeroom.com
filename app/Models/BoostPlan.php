<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;

class BoostPlan extends Model
{
    use HasFactory;

    protected static function boot()
    {
        parent::boot();
        
        static::creating(function ($model) {
            if (empty($model->uuid)) {
                $model->uuid = Str::uuid();
            }
        });
    }

    protected $fillable = [
        'name',
        'days',
        'price',
        'currency',
        'priority',
    ];

    protected $casts = [
        'days' => 'integer',
        'price' => 'decimal:2',
        'priority' => 'integer',
    ];

    public function boosts(): HasMany
    {
        return $this->hasMany(Boost::class, 'plan_id');
    }
}
