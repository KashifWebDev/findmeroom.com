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
        $listings = Listing::whereIn('status', ['review', 'draft'])
            ->with(['landlord.user', 'area.city'])
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        $items = $listings->getCollection()->map(function ($listing) {
            return [
                'id' => $listing->id,
                'uuid' => $listing->uuid,
                'title' => $listing->title,
                'status' => $listing->status,
                'verified_level' => $listing->verified_level,
                'created_at' => $listing->created_at->toISOString(),
                'landlord' => [
                    'name' => $listing->landlord->user->name,
                    'email' => $listing->landlord->user->email,
                ],
                'area' => [
                    'name' => $listing->area->name,
                    'city' => [
                        'name' => $listing->area->city->name,
                    ],
                ],
            ];
        });
        
        return $this->paginated($listings, $items);
    }

    public function approve(Request $request, Listing $listing)
    {
        $request->validate([
            'reason' => 'required|string|max:500',
        ]);
        
        if ($listing->status === 'published') {
            return $this->fail('ALREADY_PUBLISHED', 'Listing is already published', null, 422);
        }
        
        $listing->update([
            'status' => 'published',
            'published_at' => now(),
        ]);
        
        $listing->touch();
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.approved')
            ->log('Listing approved by admin: ' . $request->reason);
        
        return $this->ok(['message' => 'Listing approved successfully']);
    }

    public function reject(Request $request, Listing $listing)
    {
        $request->validate([
            'reason' => 'required|string|max:500',
        ]);
        
        if ($listing->status === 'rejected') {
            return $this->fail('ALREADY_REJECTED', 'Listing is already rejected', null, 422);
        }
        
        $listing->update(['status' => 'rejected']);
        
        // Log activity
        activity()
            ->performedOn($listing)
            ->causedBy(auth()->user())
            ->event('listing.rejected')
            ->log('Listing rejected by admin: ' . $request->reason);
        
        return $this->ok(['message' => 'Listing rejected successfully']);
    }
}
