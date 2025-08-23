<?php

use App\Models\Listing;
use App\Models\BoostPlan;
use App\Models\Boost;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Landlord;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->landlord = $this->actingAsLandlord();
    $this->listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
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
});

test('landlord can view available boost plans', function () {
    $response = $this->getJson('/api/v1/me/boosts');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'name',
                    'days',
                    'price',
                    'currency',
                    'priority',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
});

test('landlord can purchase boost for their listing', function () {
    $boostData = [
        'listing_id' => $this->listing->uuid,
        'plan_id' => $this->boostPlan->uuid,
    ];
    
    $response = $this->postJson('/api/v1/me/boosts', $boostData);
    
    $response->assertCreated()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'uuid',
                'amount',
                'currency',
                'purpose',
                'status',
                'provider',
                'provider_ref',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'amount' => '500.00',
                'currency' => 'PKR',
                'purpose' => 'boost',
                'status' => 'pending',
            ],
        ]);
    
    $this->assertDatabaseHas('orders', [
        'user_id' => $this->landlord->id,
        'amount' => 500,
        'purpose' => 'boost',
        'status' => 'pending',
    ]);
});

test('boost purchase fails for non-owned listing', function () {
    $otherLandlord = $this->makeLandlord();
    $otherListing = Listing::factory()->create([
        'landlord_id' => $otherLandlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $boostData = [
        'listing_id' => $otherListing->uuid,
        'plan_id' => $this->boostPlan->uuid,
    ];
    
    $response = $this->postJson('/api/v1/me/boosts', $boostData);
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('boost purchase fails with invalid data', function () {
    $response = $this->postJson('/api/v1/me/boosts', [
        'listing_id' => 'invalid-uuid',
        'plan_id' => $this->boostPlan->uuid,
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('payment webhook processes successful payment', function () {
    $order = Order::create([
        'user_id' => $this->landlord->id,
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
    
    $webhookPayload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
        'receipt_url' => 'https://example.com/receipt',
        'provider_fee' => 25,
    ];
    
    $response = $this->postJson('/api/v1/webhooks/payments/stripe', $webhookPayload);
    
    $response->assertOk();
    
    // Check order status updated
    $this->assertDatabaseHas('orders', [
        'id' => $order->id,
        'status' => 'paid',
    ]);
    
    // Check payment record created
    $this->assertDatabaseHas('payments', [
        'order_id' => $order->id,
        'amount' => 500,
        'provider_fee' => 25,
    ]);
    
    // Check boost created
    $this->assertDatabaseHas('boosts', [
        'listing_id' => $this->listing->id,
        'plan_id' => $this->boostPlan->id,
        'status' => 'active',
    ]);
});

test('payment webhook handles duplicate processing', function () {
    $order = Order::create([
        'user_id' => $this->landlord->id,
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
    
    // Create payment record
    Payment::create([
        'order_id' => $order->id,
        'paid_at' => now(),
        'amount' => 500,
        'provider_fee' => 25,
        'receipt_url' => 'https://example.com/receipt',
        'meta' => [],
    ]);
    
    $webhookPayload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $response = $this->postJson('/api/v1/webhooks/payments/stripe', $webhookPayload);
    
    $response->assertOk();
    
    // Should not create duplicate payment or boost
    $this->assertDatabaseCount('payments', 1);
    $this->assertDatabaseCount('boosts', 0); // Boost already exists
});

test('payment webhook validates provider', function () {
    $response = $this->postJson('/api/v1/webhooks/payments/invalid-provider', []);
    
    $response->assertStatus(400)
        ->assertJson([
            'ok' => false,
        ]);
});

test('boost purchase creates correct order metadata', function () {
    $boostData = [
        'listing_id' => $this->listing->uuid,
        'plan_id' => $this->boostPlan->uuid,
    ];
    
    $this->postJson('/api/v1/me/boosts', $boostData);
    
    $order = Order::where('user_id', $this->landlord->id)->first();
    
    $this->assertNotNull($order);
    $this->assertEquals('boost', $order->purpose);
    $this->assertEquals(500, $order->amount);
    $this->assertEquals('PKR', $order->currency);
    $this->assertEquals('pending', $order->status);
    $this->assertArrayHasKey('boost_plan', $order->meta);
    $this->assertArrayHasKey('listing_id', $order->meta);
    $this->assertEquals($this->boostPlan->id, $order->meta['boost_plan']);
    $this->assertEquals($this->listing->id, $order->meta['listing_id']);
});

test('boost activation sets correct start and end dates', function () {
    $order = Order::create([
        'user_id' => $this->landlord->id,
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
    
    $webhookPayload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->postJson('/api/v1/webhooks/payments/stripe', $webhookPayload);
    
    $boost = Boost::where('listing_id', $this->listing->id)->first();
    
    $this->assertNotNull($boost);
    $this->assertEquals('active', $boost->status);
    $this->assertEquals(now()->toDateString(), $boost->starts_at->toDateString());
    $this->assertEquals(now()->addDays(7)->toDateString(), $boost->ends_at->toDateString());
});

test('boost purchase activity is logged', function () {
    $boostData = [
        'listing_id' => $this->listing->uuid,
        'plan_id' => $this->boostPlan->uuid,
    ];
    
    $this->postJson('/api/v1/me/boosts', $boostData);
    
    $order = Order::where('user_id', $this->landlord->id)->first();
    
    $this->assertDatabaseHas('activity_log', [
        'subject_type' => Order::class,
        'subject_id' => $order->id,
        'event' => 'order.created',
        'causer_id' => $this->landlord->id,
    ]);
});

test('payment confirmation activity is logged', function () {
    $order = Order::create([
        'user_id' => $this->landlord->id,
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
    
    $webhookPayload = [
        'provider_ref' => 'pi_test123',
        'status' => 'paid',
    ];
    
    $this->postJson('/api/v1/webhooks/payments/stripe', $webhookPayload);
    
    $this->assertDatabaseHas('activity_log', [
        'subject_type' => Order::class,
        'subject_id' => $order->id,
        'event' => 'order.paid',
    ]);
});

test('non-landlord user cannot purchase boosts', function () {
    $tenant = $this->actingAsTenant();
    
    $boostData = [
        'listing_id' => $this->listing->uuid,
        'plan_id' => $this->boostPlan->uuid,
    ];
    
    $response = $this->postJson('/api/v1/me/boosts', $boostData);
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('boost purchase requires valid listing and plan', function () {
    $response = $this->postJson('/api/v1/me/boosts', [
        'listing_id' => 'non-existent-listing',
        'plan_id' => 'non-existent-plan',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});
