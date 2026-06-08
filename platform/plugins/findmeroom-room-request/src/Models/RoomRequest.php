<?php

namespace FindMeRoom\RoomRequest\Models;

use Botble\Base\Casts\SafeContent;
use Botble\Base\Models\BaseModel;
use FindMeRoom\RoomRequest\Enums\RoomRequestStatusEnum;
use Botble\Location\Models\City;
use Botble\Location\Models\Country;
use Botble\Location\Models\State;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Botble\ACL\Models\User;
use Botble\RealEstate\Models\Account;
use FindMeRoom\RoomRequest\Support\RoomRequestOwnershipService;
use Illuminate\Database\Eloquent\Builder;

class RoomRequest extends BaseModel
{
    protected $table = 'room_requests';

    protected $fillable = [
        'name',
        'public_name',
        'phone',
        'email',
        'account_id',
        'manage_token',
        'country_id',
        'state_id',
        'city_id',
        'city_text',
        'area_text',
        'budget_min',
        'budget_max',
        'gender_preference',
        'room_type',
        'tenant_type',
        'nearby_place',
        'move_in_date',
        'notes',
        'allow_public_phone',
        'status',
        'is_public',
        'share_slug',
        'expires_at',
        'approved_at',
        'approved_by',
        'found_at',
    ];

    protected $casts = [
        'status' => RoomRequestStatusEnum::class,
        'allow_public_phone' => 'boolean',
        'is_public' => 'boolean',
        'budget_min' => 'integer',
        'budget_max' => 'integer',
        'move_in_date' => 'date',
        'expires_at' => 'datetime',
        'approved_at' => 'datetime',
        'found_at' => 'datetime',
        'name' => SafeContent::class,
        'public_name' => SafeContent::class,
        'city_text' => SafeContent::class,
        'area_text' => SafeContent::class,
        'nearby_place' => SafeContent::class,
        'notes' => SafeContent::class,
    ];

    protected $hidden = [
        'manage_token',
    ];

    public function account(): BelongsTo
    {
        return $this->belongsTo(Account::class, 'account_id')->withDefault();
    }

    public function responses(): HasMany
    {
        return $this->hasMany(RoomRequestResponse::class);
    }

    public function approvedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'approved_by')->withDefault();
    }

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class, 'country_id')->withDefault();
    }

    public function state(): BelongsTo
    {
        return $this->belongsTo(State::class, 'state_id')->withDefault();
    }

    public function city(): BelongsTo
    {
        return $this->belongsTo(City::class, 'city_id')->withDefault();
    }

    public function isPending(): bool
    {
        return $this->status->getValue() === RoomRequestStatusEnum::PENDING;
    }

    public function isApproved(): bool
    {
        return $this->status->getValue() === RoomRequestStatusEnum::APPROVED;
    }

    public function isRejected(): bool
    {
        return $this->status->getValue() === RoomRequestStatusEnum::REJECTED;
    }

    public function isSpam(): bool
    {
        return $this->status->getValue() === RoomRequestStatusEnum::SPAM;
    }

    public function isExpired(): bool
    {
        return $this->status->getValue() === RoomRequestStatusEnum::EXPIRED;
    }

    public function isFound(): bool
    {
        return $this->status->getValue() === RoomRequestStatusEnum::FOUND;
    }

    public function isPubliclyVisible(): bool
    {
        if (! $this->isApproved() || ! $this->is_public) {
            return false;
        }

        if ($this->expires_at && $this->expires_at->isPast()) {
            return false;
        }

        return true;
    }

    public function acceptsOwnerResponses(): bool
    {
        if (! $this->isPubliclyVisible()) {
            return false;
        }

        if ($this->isFound() || $this->isSpam() || $this->isRejected() || $this->found_at) {
            return false;
        }

        return true;
    }

    public function displayBudget(): string
    {
        if ($this->budget_min) {
            return 'Rs ' . number_format($this->budget_min) . ' – Rs ' . number_format($this->budget_max);
        }

        return trans('plugins/findmeroom-room-request::room-request.board.up_to_budget', [
            'amount' => number_format($this->budget_max),
        ]);
    }

    public function publicDetailUrl(): string
    {
        return route('public.room-request.show', $this->share_slug);
    }

    public function displayListedDate(): string
    {
        $date = $this->approved_at ?: $this->created_at;

        return $date ? $date->translatedFormat('M d, Y') : '—';
    }

    public function canBeModerated(): bool
    {
        return $this->isPending();
    }

    public function displayCity(): string
    {
        if ($this->city_id && $this->city->getKey()) {
            return $this->city->name;
        }

        return $this->city_text ?: '—';
    }

    public function displayState(): ?string
    {
        if ($this->state_id && $this->state->getKey()) {
            return $this->state->name;
        }

        return null;
    }

    public function displayCountry(): ?string
    {
        if ($this->country_id && $this->country->getKey()) {
            return $this->country->name;
        }

        return null;
    }

    public function displayLocation(): string
    {
        $parts = array_filter([
            $this->displayCity() !== '—' ? $this->displayCity() : null,
            $this->displayState(),
            $this->displayCountry(),
        ]);

        return $parts ? implode(', ', $parts) : '—';
    }

    public function displayLocationShort(): string
    {
        $parts = array_filter([
            $this->displayCity() !== '—' ? $this->displayCity() : null,
            $this->displayState(),
        ]);

        if ($parts) {
            return implode(' · ', $parts);
        }

        return $this->city_text ?: '—';
    }

    public function scopeOwnedByAccount(Builder $query, Account|int $account): Builder
    {
        $accountId = $account instanceof Account ? $account->getKey() : $account;

        return $query->where('account_id', $accountId);
    }

    public function ensureManageToken(): self
    {
        app(RoomRequestOwnershipService::class)->ensureManageToken($this);

        return $this->refresh();
    }

    public function generateManageTokenIfMissing(): self
    {
        return $this->ensureManageToken();
    }

    public function manageUrl(): ?string
    {
        return app(RoomRequestOwnershipService::class)->manageUrl($this);
    }
}
