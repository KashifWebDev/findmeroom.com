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
    public function publicIndex(Request $request): QueryBuilder
    {
        $query = QueryBuilder::for(Listing::query()->where('status', 'published'))
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

        // Temporary fix: manually apply filters since QueryBuilder isn't working
        // TODO: Fix QueryBuilder configuration later
        if ($request->has('area_id')) {
            $query = $query->where('area_id', $request->get('area_id'));
        }
        
        if ($request->has('city_id')) {
            $query = $query->whereHas('area', function ($q) use ($request) {
                $q->where('city_id', $request->get('city_id'));
            });
        }
        
        if ($request->has('campus_id')) {
            $query = $query->where('campus_id', $request->get('campus_id'));
        }
        
        if ($request->has('furnished')) {
            $query = $query->where('furnished', $request->get('furnished') === '1');
        }
        
        if ($request->has('gender_pref')) {
            $query = $query->where('gender_pref', $request->get('gender_pref'));
        }
        
        if ($request->has('verified_level')) {
            $query = $query->where('verified_level', $request->get('verified_level'));
        }
        
        if ($request->has('room_type')) {
            $query = $query->where('room_type', $request->get('room_type'));
        }
        
        if ($request->has('min_price')) {
            $query = $query->where('rent_monthly', '>=', $request->get('min_price'));
        }
        
        if ($request->has('max_price')) {
            $query = $query->where('rent_monthly', '<=', $request->get('max_price'));
        }
        
        if ($request->has('title')) {
            $query = $query->where('title', 'like', '%' . $request->get('title') . '%');
        }
        
        // Handle sorting
        if ($request->has('sort')) {
            $sortField = $request->get('sort');
            if (in_array($sortField, ['published_at', 'rent_monthly'])) {
                $query = $query->orderBy($sortField);
            }
        }
        
        return $query;
    }
}
