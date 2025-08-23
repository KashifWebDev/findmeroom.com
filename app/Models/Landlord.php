<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;

class Landlord extends Model
{
    use HasFactory, LogsActivity;

    protected $primaryKey = 'user_id';
    public $incrementing = false;

    protected $fillable = [
        'user_id',
        'company_name',
        'contact_name',
        'response_time_minutes',
        'rating_avg',
        'rating_count',
    ];

    protected $casts = [
        'response_time_minutes' => 'integer',
        'rating_avg' => 'decimal:2',
        'rating_count' => 'integer',
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['company_name', 'contact_name', 'response_time_minutes', 'rating_avg', 'rating_count'])
            ->logOnlyDirty();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function listings(): HasMany
    {
        return $this->hasMany(Listing::class);
    }
}
