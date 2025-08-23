<?php

use App\Models\Listing;
use App\Models\Enquiry;
use App\Models\Landlord;
use App\Models\Amenity;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->landlord = $this->actingAsLandlord();
    $this->amenity = Amenity::create([
        'name' => 'WiFi',
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
});

test('landlord can create listing', function () {
    $listingData = [
        'title' => 'Beautiful apartment in Gulberg',
        'description' => 'A spacious 2-bedroom apartment with modern amenities',
        'rent_monthly' => 25000,
        'deposit' => 50000,
        'bills_included' => true,
        'room_type' => 'whole_place',
        'gender_pref' => 'any',
        'furnished' => true,
        'area_id' => $this->geography['area']->id,
        'campus_id' => $this->geography['campus']->id,
        'available_from' => now()->addDays(30)->toDateString(),
        'available_to' => now()->addMonths(6)->toDateString(),
        'lat' => 31.5204,
        'lng' => 74.3587,
    ];
    
    $response = $this->postJson('/api/v1/me/listings', $listingData);
    
    $response->assertCreated()
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
                'area_id',
                'campus_id',
                'available_from',
                'available_to',
                'lat',
                'lng',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'title' => 'Beautiful apartment in Gulberg',
                'rent_monthly' => '25000.00',
                'status' => 'draft',
            ],
        ]);
    
    $this->assertDatabaseHas('listings', [
        'landlord_id' => $this->landlord->landlord->id,
        'title' => 'Beautiful apartment in Gulberg',
        'rent_monthly' => 25000,
        'status' => 'draft',
    ]);
});

test('listing creation fails with invalid data', function () {
    $response = $this->postJson('/api/v1/me/listings', [
        'title' => '',
        'rent_monthly' => -1000,
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('landlord can view their listings', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'draft',
    ]);
    
    $response = $this->getJson('/api/v1/me/listings');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'title',
                    'slug',
                    'status',
                    'rent_monthly',
                    'area' => [
                        'name',
                        'city' => [
                            'name',
                        ],
                    ],
                    'created_at',
                    'updated_at',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
    
    $listings = $response->json('data');
    $this->assertCount(1, $listings);
    $this->assertEquals($listing->uuid, $listings[0]['uuid']);
});

test('landlord can update their listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'draft',
    ]);
    
    $updateData = [
        'title' => 'Updated apartment title',
        'rent_monthly' => 30000,
        'description' => 'Updated description',
    ];
    
    $response = $this->putJson('/api/v1/me/listings/' . $listing->uuid, $updateData);
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
            'data' => [
                'title' => 'Updated apartment title',
                'rent_monthly' => '30000.00',
            ],
        ]);
    
    $this->assertDatabaseHas('listings', [
        'id' => $listing->id,
        'title' => 'Updated apartment title',
        'rent_monthly' => 30000,
    ]);
});

test('landlord cannot update listing they do not own', function () {
    $otherLandlord = $this->makeLandlord();
    $listing = Listing::factory()->create([
        'landlord_id' => $otherLandlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $response = $this->putJson('/api/v1/me/listings/' . $listing->uuid, [
        'title' => 'Updated title',
    ]);
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('landlord can delete their listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $response = $this->deleteJson('/api/v1/me/listings/' . $listing->uuid);
    
    $response->assertNoContent();
    
    $this->assertSoftDeleted('listings', [
        'id' => $listing->id,
    ]);
});

test('landlord can upload listing cover image', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $file = UploadedFile::fake()->image('cover.jpg', 800, 600);
    
    $response = $this->postJson('/api/v1/me/listings/' . $listing->uuid . '/cover', [
        'cover' => $file,
    ]);
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
        ]);
    
    $this->assertDatabaseHas('media', [
        'model_type' => Listing::class,
        'model_id' => $listing->id,
        'collection_name' => 'listing_cover',
    ]);
    
    Storage::disk('public')->assertExists('media/' . $file->hashName());
});

test('cover upload fails with invalid file type', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $file = UploadedFile::fake()->create('document.pdf', 100);
    
    $response = $this->postJson('/api/v1/me/listings/' . $listing->uuid . '/cover', [
        'cover' => $file,
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('landlord can upload gallery images', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $files = [
        UploadedFile::fake()->image('gallery1.jpg', 800, 600),
        UploadedFile::fake()->image('gallery2.jpg', 800, 600),
    ];
    
    $response = $this->postJson('/api/v1/me/listings/' . $listing->uuid . '/gallery', [
        'gallery' => $files,
    ]);
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
        ]);
    
    $this->assertDatabaseHas('media', [
        'model_type' => Listing::class,
        'model_id' => $listing->id,
        'collection_name' => 'listing_gallery',
    ]);
    
    foreach ($files as $file) {
        Storage::disk('public')->assertExists('media/' . $file->hashName());
    }
});

test('landlord can delete gallery image', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $file = UploadedFile::fake()->image('gallery.jpg', 800, 600);
    $media = $listing->addMedia($file)->toMediaCollection('listing_gallery');
    
    $response = $this->deleteJson('/api/v1/me/listings/' . $listing->uuid . '/gallery/' . $media->id);
    
    $response->assertNoContent();
    
    $this->assertDatabaseMissing('media', [
        'id' => $media->id,
    ]);
});

test('landlord can view enquiries for their listings', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $enquiry = Enquiry::create([
        'user_id' => $this->makeTenant()->id,
        'listing_id' => $listing->id,
        'message' => 'I am interested in this property',
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
                    'user' => [
                        'name',
                        'email',
                    ],
                    'listing' => [
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

test('non-landlord user cannot access landlord endpoints', function () {
    $tenant = $this->actingAsTenant();
    
    $response = $this->getJson('/api/v1/me/listings');
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('listing media collections are properly configured', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    // Test cover collection
    $coverFile = UploadedFile::fake()->image('cover.jpg', 800, 600);
    $coverMedia = $listing->addMedia($coverFile)->toMediaCollection('listing_cover');
    
    $this->assertEquals('listing_cover', $coverMedia->collection_name);
    
    // Test gallery collection
    $galleryFile = UploadedFile::fake()->image('gallery.jpg', 800, 600);
    $galleryMedia = $listing->addMedia($galleryFile)->toMediaCollection('listing_gallery');
    
    $this->assertEquals('listing_gallery', $galleryMedia->collection_name);
});

test('listing update validates required fields', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $response = $this->putJson('/api/v1/me/listings/' . $listing->uuid, [
        'title' => '',
        'rent_monthly' => 'invalid',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});
