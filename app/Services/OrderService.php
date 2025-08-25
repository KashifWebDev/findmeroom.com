<?php

namespace App\Services;

use App\Models\BoostPlan;
use App\Models\Listing;
use App\Models\Order;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Support\Str;

class OrderService
{
    public function createBoostOrder(User $user, Listing $listing, BoostPlan $plan): Order
    {
        $order = Order::create([
            'user_id' => $user->id,
            'purpose' => 'boost',
            'amount' => $plan->price,
            'currency' => $plan->currency ?? 'PKR',
            'status' => 'pending',
            'provider' => 'stripe', // Placeholder
            'provider_ref' => 'pi_' . Str::random(24), // Placeholder
            'meta' => [
                'boost_plan' => $plan->id,
                'listing_id' => $listing->id,
            ],
        ]);

        // Log activity
        activity()
            ->performedOn($order)
            ->causedBy($user)
            ->event('order.created')
            ->log("Boost order created for listing {$listing->title}");

        return $order;
    }

    public function confirmPayment(string $provider, array $payload): void
    {
        $providerRef = $payload['provider_ref'] ?? null;
        
        if (!$providerRef) {
            return;
        }

        $order = Order::where('provider_ref', $providerRef)->first();
        
        if (!$order || $order->status === 'paid') {
            return; // Already processed
        }

        // Mark order as paid
        $order->update(['status' => 'paid']);

        // Create payment record
        Payment::create([
            'order_id' => $order->id,
            'paid_at' => now(),
            'amount' => $order->amount,
            'provider_fee' => $payload['provider_fee'] ?? 0,
            'receipt_url' => $payload['receipt_url'] ?? null,
            'meta' => $payload,
        ]);

        // Create boost if this is a boost order
        if ($order->purpose === 'boost' && isset($order->meta['boost_plan'])) {
            $plan = BoostPlan::find($order->meta['boost_plan']);
            $listing = Listing::find($order->meta['listing_id']);
            
            if ($plan && $listing) {
                \App\Models\Boost::create([
                    'listing_id' => $listing->id,
                    'plan_id' => $plan->id,
                    'starts_at' => now(),
                    'ends_at' => now()->addDays($plan->days),
                    'status' => 'active',
                ]);
            }
        }

        // Log activity
        activity()
            ->performedOn($order)
            ->causedBy($order->user)
            ->event('order.paid')
            ->log("Payment confirmed via {$provider}");
    }
}
