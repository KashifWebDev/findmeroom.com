<?php

use App\Models\Listing;
use App\Models\Landlord;
use App\Models\Area;
use App\Models\Amenity;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->landlord = $this->makeLandlord();
    $this->amenity = Amenity::create([
        'key' => 'wifi',
        'label' => 'WiFi',
        'category' => 'internet',
        'sort_order' => 1,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
});

test('public listings index returns correct response structure', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $response = $this->getJson('/api/v1/listings');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'title',
                    'slug',
                    'description',
                    'rent_monthly',
                    'deposit',
                    'bills_included',
                    'room_type',
                    'gender_pref',
                    'furnished',
                    'status',
                    'verified_level',
                    'published_at',
                    'area' => [
                        'id',
                        'name',
                        'city' => [
                            'id',
                            'name',
                        ],
                    ],
                    'landlord' => [
                        'id',
                        'name',
                        'rating_avg',
                    ],
                ],
            ],
            'meta' => [
                'page',
                'per_page',
                'total',
                'last_page',
            ],
        ])
        ->assertJson([
            'ok' => true,
        ]);
});

test('public listings index only shows published listings', function () {
    // Create published listing
    $publishedListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    // Create draft listing
    $draftListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'draft',
        'published_at' => null,
    ]);
    
    $response = $this->getJson('/api/v1/listings');
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $this->assertCount(1, $listings);
    $this->assertEquals($publishedListing->uuid, $listings[0]['uuid']);
});

test('public listings index supports filtering by area', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $otherArea = Area::create([
        'name' => 'Other Area',
        'city_id' => $this->geography['city']->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $otherArea->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $response = $this->getJson('/api/v1/listings?area_id=' . $this->geography['area']->id);
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->uuid, $listings[0]['uuid']);
});

test('public listings index supports filtering by room type', function () {
    $privateListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'room_type' => 'private_room',
    ]);
    
    $sharedListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'room_type' => 'shared_room',
    ]);
    
    $response = $this->getJson('/api/v1/listings?room_type=private_room');
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $this->assertCount(1, $listings);
    $this->assertEquals($privateListing->uuid, $listings[0]['uuid']);
});

test('public listings index supports price filtering', function () {
    $cheapListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 5000,
    ]);
    
    $expensiveListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 50000,
    ]);
    
    $response = $this->getJson('/api/v1/listings?min_price=10000&max_price=60000');
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $this->assertCount(1, $listings);
    $this->assertEquals($expensiveListing->uuid, $listings[0]['uuid']);
});

test('public listings index supports text search', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'title' => 'Beautiful apartment in Gulberg',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'title' => 'Student accommodation near campus',
    ]);
    
    $response = $this->getJson('/api/v1/listings?title=apartment');
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->uuid, $listings[0]['uuid']);
});

test('public listings index supports sorting', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now()->subDays(2),
        'rent_monthly' => 10000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now()->subDays(1),
        'rent_monthly' => 5000,
    ]);
    
    $response = $this->getJson('/api/v1/listings?sort=rent_monthly');
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $this->assertCount(2, $listings);
    $this->assertEquals($listing2->uuid, $listings[0]['uuid']); // Cheaper first
    $this->assertEquals($listing1->uuid, $listings[1]['uuid']); // More expensive second
});

test('public listings show returns correct response structure', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $response = $this->getJson('/api/v1/listings/' . $listing->uuid);
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'uuid',
                'title',
                'slug',
                'description',
                'rent_monthly',
                'deposit',
                'bills_included',
                'room_type',
                'gender_pref',
                'furnished',
                'status',
                'verified_level',
                'published_at',
                'area' => [
                    'id',
                    'name',
                    'city' => [
                        'id',
                        'name',
                    ],
                ],
                'landlord' => [
                    'id',
                    'name',
                    'rating_avg',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'uuid' => $listing->uuid,
                'title' => $listing->title,
            ],
        ]);
});

test('public listings show returns 404 for non-existent listing', function () {
    $response = $this->getJson('/api/v1/listings/non-existent-uuid');
    
    $response->assertStatus(404)
        ->assertJson([
            'ok' => false,
        ]);
});

test('public listings show returns 404 for draft listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'draft',
        'published_at' => null,
    ]);
    
    $response = $this->getJson('/api/v1/listings/' . $listing->uuid);
    
    $response->assertStatus(404)
        ->assertJson([
            'ok' => false,
        ]);
});

test('public listings index pagination works correctly', function () {
    // Create 25 listings (more than default per_page of 20)
    for ($i = 0; $i < 25; $i++) {
        Listing::factory()->create([
            'landlord_id' => $this->landlord->id,
            'area_id' => $this->geography['area']->id,
            'status' => 'published',
            'published_at' => now(),
        ]);
    }
    
    $response = $this->getJson('/api/v1/listings');
    
    $response->assertOk();
    
    $meta = $response->json('meta');
    $this->assertEquals(1, $meta['page']);
    $this->assertEquals(20, $meta['per_page']);
    $this->assertEquals(25, $meta['total']);
    $this->assertEquals(2, $meta['last_page']);
    
    $listings = $response->json('data');
    $this->assertCount(20, $listings);
    
    // Test second page
    $response2 = $this->getJson('/api/v1/listings?page=2');
    $response2->assertOk();
    
    $listings2 = $response2->json('data');
    $this->assertCount(5, $listings2);
});
