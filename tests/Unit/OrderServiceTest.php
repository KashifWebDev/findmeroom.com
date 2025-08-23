<?php

use App\Models\BoostPlan;
use App\Models\Listing;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Boost;
use App\Models\User;
use App\Services\OrderService;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->user = $this->makeLandlord();
    $this->listing = Listing::factory()->create([
        'landlord_id' => $this->user->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    $this->boostPlan = BoostPlan::create([
        'name' => 'Test Boost',
        'days' => 7,
        'price' => 500,
        'currency' => 'PKR',
        'priority' => 1,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    $this->service = new OrderService();
});

test('create boost order creates order with correct data', function () {
    $order = $this->service->createBoostOrder($this->user, $this->listing, $this->boostPlan);
    
    $this->assertInstanceOf(Order::class, $order);
    $this->assertEquals($this->user->id, $order->user_id);
    $this->assertEquals('boost', $order->purpose);
    $this->assertEquals(500, $order->amount);
    $this->assertEquals('PKR', $order->currency);
    $this->assertEquals('pending', $order->status);
    $this->assertArrayHasKey('boost_plan', $order->meta);
    $this->assertArrayHasKey('listing_id', $order->meta);
    $this->assertEquals($this->boostPlan->id, $order->meta['boost_plan']);
    $this->assertEquals($this->listing->id, $order->meta['listing_id']);
});

test('create boost order generates provider reference', function () {
    $order = $this->service->createBoostOrder($this->user, $this->listing, $this->boostPlan);
    
    $this->assertNotEmpty($order->provider_ref);
    $this->assertStringStartsWith('pi_', $order->provider_ref);
    $this->assertEquals(27, strlen($order->provider_ref)); // 'pi_' + 24 random chars
});

test('create boost order sets provider to stripe', function () {
    $order = $this->service->createBoostOrder($this->user, $this->listing, $this->boostPlan);
    
    $this->assertEquals('stripe', $order->provider);
});

test('confirm payment updates order status to paid', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
        'receipt_url' => 'https://example.com/receipt',
        'provider_fee' => 25,
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    $order->refresh();
    $this->assertEquals('paid', $order->status);
});

test('confirm payment creates payment record', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
        'receipt_url' => 'https://example.com/receipt',
        'provider_fee' => 25,
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    $this->assertDatabaseHas('payments', [
        'order_id' => $order->id,
        'amount' => 500,
        'provider_fee' => 25,
        'receipt_url' => 'https://example.com/receipt',
    ]);
});

test('confirm payment creates boost for boost orders', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    $this->assertDatabaseHas('boosts', [
        'listing_id' => $this->listing->id,
        'plan_id' => $this->boostPlan->id,
        'status' => 'active',
    ]);
});

test('confirm payment sets correct boost dates', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    $boost = Boost::where('listing_id', $this->listing->id)->first();
    
    $this->assertNotNull($boost);
    $this->assertEquals(now()->toDateString(), $boost->starts_at->toDateString());
    $this->assertEquals(now()->addDays(7)->toDateString(), $boost->ends_at->toDateString());
});

test('confirm payment handles missing provider ref gracefully', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'status' => 'paid',
        // Missing provider_ref
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    // Order should remain unchanged
    $order->refresh();
    $this->assertEquals('pending', $order->status);
});

test('confirm payment handles non-existent order gracefully', function () {
    $payload = [
        'provider_ref' => 'non_existent_ref',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    // Should not throw exception
    $this->assertTrue(true);
});

test('confirm payment handles already paid order gracefully', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'paid',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    // Should not create duplicate payment or boost
    $this->assertDatabaseCount('payments', 0);
    $this->assertDatabaseCount('boosts', 0);
});

test('confirm payment handles missing boost plan gracefully', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => 99999, // Non-existent plan
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    // Order should be marked as paid
    $order->refresh();
    $this->assertEquals('paid', $order->status);
    
    // But no boost should be created
    $this->assertDatabaseCount('boosts', 0);
});

test('confirm payment handles missing listing gracefully', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => 99999, // Non-existent listing
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    // Order should be marked as paid
    $order->refresh();
    $this->assertEquals('paid', $order->status);
    
    // But no boost should be created
    $this->assertDatabaseCount('boosts', 0);
});

test('confirm payment handles non-boost orders gracefully', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'subscription',
        'amount' => 1000,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'subscription_plan' => 1,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    // Order should be marked as paid
    $order->refresh();
    $this->assertEquals('paid', $order->status);
    
    // But no boost should be created
    $this->assertDatabaseCount('boosts', 0);
});

test('confirm payment logs activity', function () {
    $order = Order::create([
        'user_id' => $this->user->id,
        'purpose' => 'boost',
        'amount' => 500,
        'currency' => 'PKR',
        'status' => 'pending',
        'provider' => 'stripe',
        'provider_ref' => 'pi_test123',
        'meta' => [
            'boost_plan' => $this->boostPlan->id,
            'listing_id' => $this->listing->id,
        ],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $payload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->service->confirmPayment('stripe', $payload);
    
    $this->assertDatabaseHas('activity_log', [
        'subject_type' => Order::class,
        'subject_id' => $order->id,
        'event' => 'order.paid',
        'causer_id' => $this->user->id,
    ]);
});
