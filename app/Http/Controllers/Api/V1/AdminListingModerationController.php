<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Listing;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class AdminListingModerationController extends Controller
{
    use ApiResponse;

    public function index()
    {
        $listings = Listing::where('status', 'review')
            ->with(['landlord.user', 'area.city'])
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        $items = $listings->getCollection()->map(function ($listing) {
            return [
                'uuid' => $listing->uuid,
                'title' => $listing->title,
                'rent_monthly' => $listing->rent_monthly,
                'created_at' => $listing->created_at->toISOString(),
                'landlord' => [
                    'name' => $listing->landlord->user->name,
                    'email' => $listing->landlord->user->email,
                ],
                'area' => [
                    'name' => $listing->area->name,
                    'city' => $listing->area->city->name,
                ],
            ];
        });
        
        return $this->paginated($listings, $items);
    }

    public function approve(Listing $listing)
    {
        $listing->update([
            'status' => 'published',
            'published_at' => now(),
        ]);
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.published')
            ->log('Listing approved by admin');
        
        return $this->ok(['message' => 'Listing approved successfully']);
    }

    public function reject(Listing $listing)
    {
        $listing->update(['status' => 'rejected']);
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.rejected')
            ->log('Listing rejected by admin');
        
        return $this->ok(['message' => 'Listing rejected successfully']);
    }
}
