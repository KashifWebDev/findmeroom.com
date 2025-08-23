<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Amenity extends Model
{
    use HasUuids;

    protected $fillable = [
        'key',
        'label',
        'category',
        'sort_order',
    ];

    protected $casts = [
        'sort_order' => 'integer',
    ];

    public function listings(): BelongsToMany
    {
        return $this->belongsToMany(Listing::class, 'listing_amenities');
    }
}
