<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\BoostStoreRequest;
use App\Models\Boost;
use App\Models\BoostPlan;
use App\Models\Listing;
use App\Services\OrderService;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class BoostController extends Controller
{
    use ApiResponse;

    public function index()
    {
        $boosts = Boost::whereHas('listing', function ($query) {
            $query->where('landlord_id', auth()->id());
        })
        ->with(['listing.area.city', 'plan'])
        ->orderBy('created_at', 'desc')
        ->paginate(20);
        
        $items = $boosts->getCollection()->map(function ($boost) {
            return [
                'id' => $boost->id,
                'plan_name' => $boost->plan->name,
                'days' => $boost->plan->days,
                'starts_at' => $boost->starts_at->toISOString(),
                'ends_at' => $boost->ends_at->toISOString(),
                'status' => $boost->status,
                'listing' => [
                    'uuid' => $boost->listing->uuid,
                    'title' => $boost->listing->title,
                    'city' => $boost->listing->area->city->name ?? null,
                    'area' => $boost->listing->area->name ?? null,
                ],
            ];
        });
        
        return $this->paginated($boosts, $items);
    }

    public function store(BoostStoreRequest $request)
    {
        $data = $request->validated();
        
        $listing = Listing::where('uuid', $data['listing_uuid'])->firstOrFail();
        $plan = BoostPlan::findOrFail($data['plan_id']);
        
        // Create order using service
        $orderService = app(OrderService::class);
        $order = $orderService->createBoostOrder(auth()->user(), $listing, $plan);
        
        // Return order details with fake payment URL
        return $this->created([
            'order_uuid' => $order->uuid,
            'amount' => $order->amount,
            'currency' => $order->currency,
            'payment_url' => 'https://example.com/pay/' . $order->uuid, // Placeholder
        ]);
    }
}
