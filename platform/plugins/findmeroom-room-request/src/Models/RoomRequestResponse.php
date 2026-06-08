<?php

namespace FindMeRoom\RoomRequest\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Models\BaseModel;
use Botble\RealEstate\Models\Account;
use FindMeRoom\RoomRequest\Enums\RoomRequestResponseStatusEnum;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RoomRequestResponse extends BaseModel
{
    protected $table = 'room_request_responses';

    protected $fillable = [
        'room_request_id',
        'property_id',
        'owner_name',
        'owner_phone',
        'owner_email',
        'area_text',
        'rent',
        'room_type',
        'message',
        'status',
        'admin_notes',
        'responder_account_id',
        'reported_at',
        'report_reason',
        'ip_address',
    ];

    protected $casts = [
        'status' => RoomRequestResponseStatusEnum::class,
        'rent' => 'integer',
        'reported_at' => 'datetime',
        'owner_name' => SafeContent::class,
        'area_text' => SafeContent::class,
        'message' => SafeContent::class,
        'admin_notes' => SafeContent::class,
        'report_reason' => SafeContent::class,
    ];

    public function roomRequest(): BelongsTo
    {
        return $this->belongsTo(RoomRequest::class);
    }

    public function responderAccount(): BelongsTo
    {
        return $this->belongsTo(Account::class, 'responder_account_id')->withDefault();
    }

    /**
     * Owner location is stored in area_text (legacy column name).
     */
    public function getLocationAttribute(): ?string
    {
        return $this->area_text;
    }

    public function setLocationAttribute(?string $value): void
    {
        $this->area_text = $value;
    }

    public function scopeVisibleToTenant(Builder $query): Builder
    {
        return $query
            ->whereNull('reported_at')
            ->whereNotIn('status', [
                RoomRequestResponseStatusEnum::SPAM,
                RoomRequestResponseStatusEnum::REJECTED,
                RoomRequestResponseStatusEnum::REPORTED,
            ]);
    }

    public function scopeForTenantDisplay(Builder $query): Builder
    {
        return $query->where('status', RoomRequestResponseStatusEnum::VISIBLE);
    }

    public function report(?string $reason = null): self
    {
        $this->update([
            'status' => RoomRequestResponseStatusEnum::REPORTED,
            'reported_at' => now(),
            'report_reason' => $reason,
        ]);

        return $this->refresh();
    }

    public function markVisibleForTenant(): self
    {
        $this->update([
            'status' => RoomRequestResponseStatusEnum::VISIBLE,
            'reported_at' => null,
            'report_reason' => null,
        ]);

        return $this->refresh();
    }

    public function scopeNotSpam(Builder $query): Builder
    {
        return $query->where('status', '!=', RoomRequestResponseStatusEnum::SPAM);
    }

    public function scopeReported(Builder $query): Builder
    {
        return $query->whereNotNull('reported_at');
    }
}
