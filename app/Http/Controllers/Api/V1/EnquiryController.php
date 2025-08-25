<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\EnquiryStoreRequest;
use App\Models\Enquiry;
use App\Models\Listing;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class EnquiryController extends Controller
{
    use ApiResponse;

    public function store(EnquiryStoreRequest $request)
    {
        $data = $request->validated();
        
        $listing = Listing::where('uuid', $data['listing_id'])->first();
        
        if (!$listing) {
            return $this->fail('LISTING_NOT_FOUND', 'Listing not found', [], 404);
        }
        
        $enquiry = Enquiry::create([
            'listing_id' => $listing->id,
            'tenant_id' => auth()->id(),
            'message' => $data['message'],
            'preferred_contact' => $data['preferred_contact'] ?? 'email',
            'status' => 'new',
        ]);
        
        // Log activity
        activity()
            ->performedOn($enquiry)
            ->causedBy(auth()->user())
            ->event('enquiry.created')
            ->log('Enquiry sent for listing');
        
        return $this->created($enquiry);
    }

    public function index(Request $request)
    {
        $enquiries = Enquiry::where('tenant_id', auth()->id())
            ->with(['listing.area.city', 'listing.landlord.user'])
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        $items = $enquiries->getCollection()->map(function ($enquiry) {
            return [
                'id' => $enquiry->id,
                'uuid' => $enquiry->uuid,
                'message' => $enquiry->message,
                'preferred_contact' => $enquiry->preferred_contact,
                'status' => $enquiry->status,
                'created_at' => $enquiry->created_at->toISOString(),
                'updated_at' => $enquiry->updated_at->toISOString(),
                'listing' => [
                    'id' => $enquiry->listing->id,
                    'uuid' => $enquiry->listing->uuid,
                    'title' => $enquiry->listing->title,
                ],
            ];
        });
        
        return $this->paginated($enquiries, $items);
    }
}
