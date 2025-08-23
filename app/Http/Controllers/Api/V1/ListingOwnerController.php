<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\ListingStoreRequest;
use App\Http\Requests\V1\ListingUpdateRequest;
use App\Models\Listing;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class ListingOwnerController extends Controller
{
    use ApiResponse;

    public function index()
    {
        $listings = Listing::where('landlord_id', auth()->id())
            ->with(['area.city', 'amenities'])
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        $items = $listings->getCollection()->map(function ($listing) {
            return [
                'uuid' => $listing->uuid,
                'title' => $listing->title,
                'status' => $listing->status,
                'rent_monthly' => $listing->rent_monthly,
                'city' => $listing->area->city->name ?? null,
                'area' => $listing->area->name ?? null,
                'views_count' => $listing->views_count,
                'favourites_count' => $listing->favourites_count,
                'published_at' => $listing->published_at?->toISOString(),
                'created_at' => $listing->created_at->toISOString(),
            ];
        });
        
        return $this->paginated($listings, $items);
    }

    public function store(ListingStoreRequest $request)
    {
        $data = $request->validated();
        
        $listing = Listing::create([
            'landlord_id' => auth()->id(),
            'area_id' => $data['area_id'],
            'campus_id' => $data['campus_id'] ?? null,
            'title' => $data['title'],
            'slug' => Str::slug($data['title']) . '-' . Str::random(6),
            'description' => $data['description'],
            'rent_monthly' => $data['rent_monthly'],
            'deposit' => $data['deposit'] ?? null,
            'bills_included' => $data['bills_included'] ?? false,
            'room_type' => $data['room_type'],
            'gender_pref' => $data['gender_pref'] ?? 'any',
            'furnished' => $data['furnished'] ?? false,
            'verified_level' => 'none',
            'status' => 'draft',
            'lat' => $data['lat'] ?? null,
            'lng' => $data['lng'] ?? null,
            'address_line' => $data['address_line'] ?? null,
            'distance_to_campus_m' => $data['distance_to_campus_m'] ?? null,
            'available_from' => $data['available_from'] ?? null,
            'available_to' => $data['available_to'] ?? null,
            'views_count' => 0,
            'favourites_count' => 0,
        ]);
        
        // Sync amenities if provided
        if (isset($data['amenities'])) {
            $listing->amenities()->sync($data['amenities']);
        }
        
        // Create listing rules if provided
        if (isset($data['rules'])) {
            foreach ($data['rules'] as $rule) {
                $listing->listingRules()->create([
                    'key' => $rule['key'],
                    'value' => $rule['value'],
                ]);
            }
        }
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.created')
            ->log('Listing created');
        
        return $this->created(['uuid' => $listing->uuid]);
    }

    public function update(ListingUpdateRequest $request, Listing $listing)
    {
        $data = $request->validated();
        
        $listing->update($data);
        
        // Sync amenities if provided
        if (isset($data['amenities'])) {
            $listing->amenities()->sync($data['amenities']);
        }
        
        // Update listing rules if provided
        if (isset($data['rules'])) {
            $listing->listingRules()->delete();
            foreach ($data['rules'] as $rule) {
                $listing->listingRules()->create([
                    'key' => $rule['key'],
                    'value' => $rule['value'],
                ]);
            }
        }
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.updated')
            ->log('Listing updated');
        
        return $this->ok(['message' => 'Listing updated successfully']);
    }

    public function destroy(Listing $listing)
    {
        $listing->delete();
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.deleted')
            ->log('Listing deleted');
        
        return $this->noContent();
    }
}
