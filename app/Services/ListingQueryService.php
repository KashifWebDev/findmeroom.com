<?php

namespace App\Services;

use App\Models\Listing;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Spatie\QueryBuilder\AllowedFilter;
use Spatie\QueryBuilder\AllowedSort;
use Spatie\QueryBuilder\QueryBuilder;

class ListingQueryService
{
    public function publicIndex(Request $request): Builder
    {
        return QueryBuilder::for(Listing::query()->where('status', 'published'))
            ->allowedFilters([
                AllowedFilter::exact('city_id', 'area.city_id'),
                AllowedFilter::exact('area_id'),
                AllowedFilter::exact('campus_id'),
                AllowedFilter::exact('furnished'),
                AllowedFilter::exact('gender_pref'),
                AllowedFilter::exact('verified_level'),
                AllowedFilter::exact('room_type'),
                AllowedFilter::scope('min_price'),
                AllowedFilter::scope('max_price'),
                AllowedFilter::partial('title'),
            ])
            ->allowedSorts(['published_at', 'rent_monthly'])
            ->with(['area.city', 'landlord']);
    }
}
