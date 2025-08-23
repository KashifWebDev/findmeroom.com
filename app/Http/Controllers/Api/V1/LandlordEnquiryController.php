<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Enquiry;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class LandlordEnquiryController extends Controller
{
    use ApiResponse;

    public function index()
    {
        $enquiries = Enquiry::whereHas('listing', function ($query) {
            $query->where('landlord_id', auth()->id());
        })
        ->with(['listing.area.city', 'tenant.user'])
        ->orderBy('created_at', 'desc')
        ->paginate(20);
        
        $items = $enquiries->getCollection()->map(function ($enquiry) {
            return [
                'id' => $enquiry->id,
                'message' => $enquiry->message,
                'status' => $enquiry->status,
                'created_at' => $enquiry->created_at->toISOString(),
                'tenant' => [
                    'name' => $enquiry->tenant->user->name,
                    'email' => $enquiry->tenant->user->email,
                    'phone_e164' => $enquiry->tenant->user->phone_e164,
                ],
                'listing' => [
                    'uuid' => $enquiry->listing->uuid,
                    'title' => $enquiry->listing->title,
                    'rent_monthly' => $enquiry->listing->rent_monthly,
                    'city' => $enquiry->listing->area->city->name ?? null,
                    'area' => $enquiry->listing->area->name ?? null,
                    'cover_url' => $enquiry->listing->getFirstMediaUrl('listing_cover'),
                ],
            ];
        });
        
        return $this->paginated($enquiries, $items);
    }
}
