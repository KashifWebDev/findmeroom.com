<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\SaveListingRequest;
use App\Models\Listing;
use App\Models\SavedListing;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class SavedListingController extends Controller
{
    use ApiResponse;

    public function store(SaveListingRequest $request)
    {
        $data = $request->validated();
        
        $listing = Listing::where('uuid', $data['listing_uuid'])->firstOrFail();
        
        // Check if already saved
        $existing = SavedListing::where('tenant_id', auth()->id())
            ->where('listing_id', $listing->id)
            ->first();
        
        if ($existing) {
            return $this->ok(['message' => 'Listing already saved']);
        }
        
        SavedListing::create([
            'tenant_id' => auth()->id(),
            'listing_id' => $listing->id,
        ]);
        
        return $this->ok(['message' => 'Listing saved successfully']);
    }

    public function destroy(Listing $listing)
    {
        SavedListing::where('tenant_id', auth()->id())
            ->where('listing_id', $listing->id)
            ->delete();
        
        return $this->ok(['message' => 'Listing removed from saved']);
    }

    public function index()
    {
        $savedListings = SavedListing::where('tenant_id', auth()->id())
            ->with(['listing.area.city', 'listing.landlord.user'])
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        $items = $savedListings->getCollection()->map(function ($saved) {
            return [
                'id' => $saved->id,
                'saved_at' => $saved->created_at->toISOString(),
                'listing' => [
                    'uuid' => $saved->listing->uuid,
                    'title' => $saved->listing->title,
                    'rent_monthly' => $saved->listing->rent_monthly,
                    'city' => $saved->listing->area->city->name ?? null,
                    'area' => $saved->listing->area->name ?? null,
                    'furnished' => $saved->listing->furnished,
                    'gender_pref' => $saved->listing->gender_pref,
                    'verified_level' => $saved->listing->verified_level,
                    'cover_url' => $saved->listing->getFirstMediaUrl('listing_cover'),
                    'published_at' => $saved->listing->published_at?->toISOString(),
                ],
            ];
        });
        
        return $this->paginated($savedListings, $items);
    }
}
