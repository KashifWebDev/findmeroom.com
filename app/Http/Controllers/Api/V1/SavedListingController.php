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

    public function store(Listing $listing)
    {
        
        // Check if already saved
        $existing = SavedListing::where('user_id', auth()->id())
            ->where('listing_id', $listing->id)
            ->first();
        
        if ($existing) {
            return $this->fail('LISTING_ALREADY_SAVED', 'Listing already saved', [], 422);
        }
        
        $savedListing = SavedListing::create([
            'user_id' => auth()->id(),
            'listing_id' => $listing->id,
        ]);
        
        return $this->created($savedListing);
    }

    public function destroy(Listing $listing)
    {
        SavedListing::where('user_id', auth()->id())
            ->where('listing_id', $listing->id)
            ->delete();
        
        return response()->noContent();
    }

    public function index()
    {
        $savedListings = SavedListing::where('user_id', auth()->id())
            ->with(['listing.area.city', 'listing.landlord.user'])
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        $items = $savedListings->getCollection()->map(function ($saved) {
            return [
                'id' => $saved->id,
                'uuid' => $saved->uuid,
                'created_at' => $saved->created_at->toISOString(),
                'listing' => [
                    'id' => $saved->listing->id,
                    'uuid' => $saved->listing->uuid,
                    'title' => $saved->listing->title,
                    'rent_monthly' => $saved->listing->rent_monthly,
                    'area' => [
                        'name' => $saved->listing->area->name ?? null,
                        'city' => [
                            'name' => $saved->listing->area->city->name ?? null,
                        ],
                    ],
                ],
            ];
        });
        
        return $this->paginated($savedListings, $items);
    }
}
