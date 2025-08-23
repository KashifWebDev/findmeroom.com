<?php

use App\Models\Listing;
use App\Models\Enquiry;
use App\Models\SavedListing;
use App\Models\SavedSearch;
use App\Models\Landlord;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->landlord = $this->makeLandlord();
    $this->tenant = $this->actingAsTenant();
    $this->listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
});

test('tenant can create enquiry for listing', function () {
    $enquiryData = [
        'message' => 'I am interested in this property. Is it still available?',
        'preferred_contact' => 'email',
    ];
    
    $response = $this->postJson('/api/v1/enquiries', array_merge($enquiryData, [
        'listing_id' => $this->listing->uuid,
    ]));
    
    $response->assertCreated()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'uuid',
                'message',
                'preferred_contact',
                'status',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'message' => 'I am interested in this property. Is it still available?',
                'preferred_contact' => 'email',
                'status' => 'new',
            ],
        ]);
    
    $this->assertDatabaseHas('enquiries', [
        'user_id' => $this->tenant->id,
        'listing_id' => $this->listing->id,
        'message' => 'I am interested in this property. Is it still available?',
        'preferred_contact' => 'email',
        'status' => 'new',
    ]);
});

test('enquiry creation fails with invalid data', function () {
    $response = $this->postJson('/api/v1/enquiries', [
        'listing_id' => $this->listing->uuid,
        'message' => '',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('enquiry creation fails for non-existent listing', function () {
    $response = $this->postJson('/api/v1/enquiries', [
        'listing_id' => 'non-existent-uuid',
        'message' => 'Test message',
    ]);
    
    $response->assertStatus(404)
        ->assertJson([
            'ok' => false,
        ]);
});

test('tenant can view their enquiries', function () {
    $enquiry = Enquiry::create([
        'user_id' => $this->tenant->id,
        'listing_id' => $this->listing->id,
        'message' => 'Test enquiry',
        'preferred_contact' => 'email',
        'status' => 'new',
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->getJson('/api/v1/me/enquiries');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'message',
                    'preferred_contact',
                    'status',
                    'created_at',
                    'updated_at',
                    'listing' => [
                        'id',
                        'uuid',
                        'title',
                    ],
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
    
    $enquiries = $response->json('data');
    $this->assertCount(1, $enquiries);
    $this->assertEquals($enquiry->uuid, $enquiries[0]['uuid']);
});

test('tenant can save listing', function () {
    $response = $this->postJson('/api/v1/me/saved-listings/' . $this->listing->uuid);
    
    $response->assertCreated()
        ->assertJson([
            'ok' => true,
        ]);
    
    $this->assertDatabaseHas('saved_listings', [
        'user_id' => $this->tenant->id,
        'listing_id' => $this->listing->id,
    ]);
});

test('tenant cannot save already saved listing', function () {
    SavedListing::create([
        'user_id' => $this->tenant->id,
        'listing_id' => $this->listing->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->postJson('/api/v1/me/saved-listings/' . $this->listing->uuid);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('tenant can view saved listings', function () {
    SavedListing::create([
        'user_id' => $this->tenant->id,
        'listing_id' => $this->listing->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->getJson('/api/v1/me/saved-listings');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'created_at',
                    'listing' => [
                        'id',
                        'uuid',
                        'title',
                        'rent_monthly',
                        'area' => [
                            'name',
                            'city' => [
                                'name',
                            ],
                        ],
                    ],
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
    
    $savedListings = $response->json('data');
    $this->assertCount(1, $savedListings);
    $this->assertEquals($this->listing->uuid, $savedListings[0]['listing']['uuid']);
});

test('tenant can remove saved listing', function () {
    $savedListing = SavedListing::create([
        'user_id' => $this->tenant->id,
        'listing_id' => $this->listing->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->deleteJson('/api/v1/me/saved-listings/' . $this->listing->uuid);
    
    $response->assertNoContent();
    
    $this->assertDatabaseMissing('saved_listings', [
        'id' => $savedListing->id,
    ]);
});

test('tenant can create saved search', function () {
    $searchData = [
        'name' => 'My Search',
        'filters' => [
            'area_id' => $this->geography['area']->id,
            'room_type' => 'private_room',
            'max_price' => 20000,
        ],
    ];
    
    $response = $this->postJson('/api/v1/me/saved-searches', $searchData);
    
    $response->assertCreated()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'name',
                'filters',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'name' => 'My Search',
                'filters' => [
                    'area_id' => $this->geography['area']->id,
                    'room_type' => 'private_room',
                    'max_price' => 20000,
                ],
            ],
        ]);
    
    $this->assertDatabaseHas('saved_searches', [
        'user_id' => $this->tenant->id,
        'name' => 'My Search',
    ]);
});

test('saved search creation fails with invalid data', function () {
    $response = $this->postJson('/api/v1/me/saved-searches', [
        'name' => '',
        'filters' => [],
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('tenant can view saved searches', function () {
    $savedSearch = SavedSearch::create([
        'user_id' => $this->tenant->id,
        'name' => 'Test Search',
        'filters' => ['area_id' => $this->geography['area']->id],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->getJson('/api/v1/me/saved-searches');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'name',
                    'filters',
                    'created_at',
                    'updated_at',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
    
    $savedSearches = $response->json('data');
    $this->assertCount(1, $savedSearches);
    $this->assertEquals($savedSearch->name, $savedSearches[0]['name']);
});

test('tenant can delete saved search', function () {
    $savedSearch = SavedSearch::create([
        'user_id' => $this->tenant->id,
        'name' => 'Test Search',
        'filters' => ['area_id' => $this->geography['area']->id],
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->deleteJson('/api/v1/me/saved-searches/' . $savedSearch->id);
    
    $response->assertNoContent();
    
    $this->assertDatabaseMissing('saved_searches', [
        'id' => $savedSearch->id,
    ]);
});

test('enquiry rate limiting works', function () {
    // Create 5 enquiries (rate limit is 5 per minute)
    for ($i = 0; $i < 5; $i++) {
        $this->postJson('/api/v1/enquiries', [
            'listing_id' => $this->listing->uuid,
            'message' => "Test enquiry {$i}",
        ])->assertCreated();
    }
    
    // 6th enquiry should be rate limited
    $response = $this->postJson('/api/v1/enquiries', [
        'listing_id' => $this->listing->uuid,
        'message' => 'Rate limited enquiry',
    ]);
    
    $response->assertStatus(429);
});

test('unauthenticated user cannot access tenant endpoints', function () {
    $this->withoutMiddleware(\Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class);
    
    $response = $this->postJson('/api/v1/enquiries', [
        'listing_id' => $this->listing->uuid,
        'message' => 'Test message',
    ]);
    
    $response->assertStatus(401);
});
