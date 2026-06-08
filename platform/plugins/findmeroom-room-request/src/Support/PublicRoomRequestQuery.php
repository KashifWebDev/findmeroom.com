<?php

namespace FindMeRoom\RoomRequest\Support;

use FindMeRoom\RoomRequest\Enums\RoomRequestStatusEnum;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;

class PublicRoomRequestQuery
{
    public static function baseQuery(): Builder
    {
        return RoomRequest::query()
            ->where('status', RoomRequestStatusEnum::APPROVED)
            ->where('is_public', true)
            ->where(function (Builder $query): void {
                $query
                    ->whereNull('expires_at')
                    ->orWhere('expires_at', '>', now());
            });
    }

    public static function paginateBoard(Request $request, int $perPage = 12): LengthAwarePaginator
    {
        $query = static::baseQuery()
            ->with(['city', 'state', 'country'])
            ->select([
                'id',
                'public_name',
                'country_id',
                'state_id',
                'city_id',
                'city_text',
                'area_text',
                'budget_min',
                'budget_max',
                'room_type',
                'tenant_type',
                'move_in_date',
                'approved_at',
                'created_at',
                'share_slug',
                'allow_public_phone',
                'phone',
            ])
            ->latest('approved_at')
            ->latest('id');

        static::applyFilters($query, $request);

        return $query
            ->paginate($perPage)
            ->withQueryString();
    }

    public static function findVisibleBySlug(string $slug): ?RoomRequest
    {
        $roomRequest = RoomRequest::query()
            ->where('share_slug', $slug)
            ->first();

        if (! $roomRequest || ! $roomRequest->isPubliclyVisible()) {
            return null;
        }

        return $roomRequest;
    }

    public static function applyFilters(Builder $query, Request $request): Builder
    {
        if ($request->filled('state_id')) {
            $query->where('state_id', (int) $request->input('state_id'));
        }

        if ($request->filled('city_id')) {
            $query->where('city_id', (int) $request->input('city_id'));
        }

        if ($city = $request->string('city_text')->trim()->toString()) {
            $query->where(function (Builder $inner) use ($city): void {
                $inner
                    ->where('city_text', 'like', '%' . $city . '%')
                    ->orWhereHas('city', function (Builder $cityQuery) use ($city): void {
                        $cityQuery->where('name', 'like', '%' . $city . '%');
                    });
            });
        }

        if ($area = $request->string('area_text')->trim()->toString()) {
            $query->where('area_text', 'like', '%' . $area . '%');
        }

        if ($request->filled('budget_max')) {
            $query->where('budget_max', '<=', (int) $request->input('budget_max'));
        }

        if ($roomType = $request->string('room_type')->trim()->toString()) {
            $query->where('room_type', $roomType);
        }

        if ($tenantType = $request->string('tenant_type')->trim()->toString()) {
            $query->where('tenant_type', $tenantType);
        }

        return $query;
    }
}
