<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Listing;
use App\Services\ListingQueryService;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ListingPublicController extends Controller
{
    use ApiResponse;

    public function index(Request $request)
    {
        $query = app(ListingQueryService::class)->publicIndex($request);
        
        $listings = $query->paginate(20);
        
        $items = $listings->getCollection()->map(function ($listing) {
            return [
                'uuid' => $listing->uuid,
                'title' => $listing->title,
                'rent_monthly' => $listing->rent_monthly,
                'city' => $listing->area->city->name ?? null,
                'area' => $listing->area->name ?? null,
                'furnished' => $listing->furnished,
                'gender_pref' => $listing->gender_pref,
                'verified_level' => $listing->verified_level,
                'cover_url' => $listing->getFirstMediaUrl('listing_cover'),
                'published_at' => $listing->published_at?->toISOString(),
            ];
        });
        
        return $this->paginated($listings, $items);
    }

    public function show(Listing $listing)
    {
        // Check if listing is published or user owns it or is admin
        if ($listing->status !== 'published') {
            $user = auth()->user();
            if (!$user || 
                ($user->id !== $listing->landlord->user_id && !$user->hasRole('admin'))) {
                return $this->fail('NOT_FOUND', 'Listing not found', null, 404);
            }
        }
        
        $listing->load(['area.city', 'landlord.user', 'amenities', 'listingRules']);
        
        $data = [
            'uuid' => $listing->uuid,
            'title' => $listing->title,
            'description' => $listing->description,
            'rent_monthly' => $listing->rent_monthly,
            'deposit' => $listing->deposit,
            'bills_included' => $listing->bills_included,
            'room_type' => $listing->room_type,
            'gender_pref' => $listing->gender_pref,
            'furnished' => $listing->furnished,
            'verified_level' => $listing->verified_level,
            'status' => $listing->status,
            'lat' => $listing->lat,
            'lng' => $listing->lng,
            'address_line' => $listing->address_line,
            'distance_to_campus_m' => $listing->distance_to_campus_m,
            'available_from' => $listing->available_from?->toISOString(),
            'available_to' => $listing->available_to?->toISOString(),
            'views_count' => $listing->views_count,
            'favourites_count' => $listing->favourites_count,
            'published_at' => $listing->published_at?->toISOString(),
            'area' => [
                'id' => $listing->area->id,
                'name' => $listing->area->name,
                'city' => [
                    'id' => $listing->area->city->id,
                    'name' => $listing->area->city->name,
                ],
            ],
            'landlord' => [
                'name' => $listing->landlord->user->name,
                'company_name' => $listing->landlord->company_name,
                'rating_avg' => $listing->landlord->rating_avg,
                'rating_count' => $listing->landlord->rating_count,
            ],
            'amenities' => $listing->amenities->pluck('name'),
            'rules' => $listing->listingRules->mapWithKeys(function ($rule) {
                return [$rule->key => $rule->value];
            }),
            'cover_url' => $listing->getFirstMediaUrl('listing_cover'),
            'gallery' => $listing->getMedia('listing_gallery')->map(function ($media) {
                return [
                    'id' => $media->id,
                    'url' => $media->getUrl(),
                ];
            }),
        ];
        
        return $this->ok($data);
    }
}
