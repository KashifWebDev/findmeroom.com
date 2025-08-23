<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Scout\Searchable;
use Spatie\Activitylog\LogOptions;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Illuminate\Support\Str;

class Listing extends Model implements HasMedia
{
    use HasFactory, SoftDeletes, LogsActivity, InteractsWithMedia, Searchable;

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
        'landlord_id',
        'area_id',
        'campus_id',
        'title',
        'slug',
        'description',
        'rent_monthly_paisa',
        'deposit_paisa',
        'bills_included',
        'room_type',
        'gender_pref',
        'furnished',
        'verified_level',
        'status',
        'lat',
        'lng',
        'address_line',
        'distance_to_campus_m',
        'available_from',
        'available_to',
        'views_count',
        'favourites_count',
        'published_at',
    ];

    protected $casts = [
        'bills_included' => 'boolean',
        'furnished' => 'boolean',
        'published_at' => 'datetime',
        'available_from' => 'date',
        'available_to' => 'date',
        'lat' => 'decimal:6',
        'lng' => 'decimal:6',
        'views_count' => 'integer',
        'favourites_count' => 'integer',
    ];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['title', 'status', 'verified_level', 'published_at'])
            ->logOnlyDirty();
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('listing_cover')
            ->singleFile()
            ->useDisk('public');

        $this->addMediaCollection('listing_gallery')
            ->useDisk('public');
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(320)
            ->performOnCollections('listing_cover', 'listing_gallery');

        $this->addMediaConversion('large')
            ->width(1280)
            ->performOnCollections('listing_cover', 'listing_gallery');
    }

    public function landlord(): BelongsTo
    {
        return $this->belongsTo(Landlord::class);
    }

    public function area(): BelongsTo
    {
        return $this->belongsTo(Area::class);
    }

    public function campus(): BelongsTo
    {
        return $this->belongsTo(Campus::class);
    }

    public function listingRules(): HasMany
    {
        return $this->hasMany(ListingRule::class);
    }

    public function amenities(): BelongsToMany
    {
        return $this->belongsToMany(Amenity::class, 'listing_amenities');
    }

    public function boosts(): HasMany
    {
        return $this->hasMany(Boost::class);
    }

    public function enquiries(): HasMany
    {
        return $this->hasMany(Enquiry::class);
    }

    public function toSearchableArray(): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => substr($this->description, 0, 500),
            'city_name' => $this->area->city->name ?? '',
            'area_name' => $this->area->name ?? '',
            'rent' => $this->rent_monthly_paisa,
            'furnished' => $this->furnished,
            'gender_pref' => $this->gender_pref,
            'verified_level' => $this->verified_level,
        ];
    }
}
