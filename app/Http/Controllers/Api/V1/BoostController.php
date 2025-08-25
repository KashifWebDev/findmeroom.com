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

    public function plans()
    {
        $plans = BoostPlan::orderBy('priority')->get();
        
        $items = $plans->map(function ($plan) {
            return [
                'id' => $plan->id,
                'uuid' => $plan->uuid,
                'name' => $plan->name,
                'days' => $plan->days,
                'price' => $plan->price,
                'currency' => $plan->currency,
                'priority' => $plan->priority,
            ];
        });
        
        return $this->ok($items);
    }

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
        
        $listing = Listing::where('uuid', $data['listing_id'])->firstOrFail();
        $plan = BoostPlan::where('uuid', $data['plan_id'])->firstOrFail();
        
        // Check if user owns the listing
        if ($listing->landlord_id !== auth()->id()) {
            return $this->fail('FORBIDDEN', 'You do not own this listing', null, 403);
        }
        
        // Create order using service
        $orderService = app(OrderService::class);
        $order = $orderService->createBoostOrder(auth()->user(), $listing, $plan);
        
        // Return order details
        return $this->created([
            'id' => $order->id,
            'uuid' => $order->uuid,
            'amount' => number_format($order->amount, 2, '.', ''),
            'currency' => $order->currency,
            'purpose' => $order->purpose,
            'status' => $order->status,
            'provider' => $order->provider,
            'provider_ref' => $order->provider_ref,
            'created_at' => $order->created_at->toISOString(),
            'updated_at' => $order->updated_at->toISOString(),
        ]);
    }
}
