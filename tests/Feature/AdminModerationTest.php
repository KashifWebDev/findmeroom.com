<?php

use App\Models\Listing;
use App\Models\Landlord;
use App\Models\User;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->admin = $this->actingAsAdmin();
    $this->landlord = $this->makeLandlord();
});

test('admin can view all listings for moderation', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'draft',
    ]);
    
    $response = $this->getJson('/api/v1/admin/listings');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'title',
                    'status',
                    'verified_level',
                    'created_at',
                    'landlord' => [
                        'name',
                        'email',
                    ],
                    'area' => [
                        'name',
                        'city' => [
                            'name',
                        ],
                    ],
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
    
    $listings = $response->json('data');
    $this->assertCount(2, $listings);
});

test('admin can approve listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $response = $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/approve', [
        'reason' => 'Listing meets all requirements',
    ]);
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
        ]);
    
    $this->assertDatabaseHas('listings', [
        'id' => $listing->id,
        'status' => 'published',
        'published_at' => now()->toDateString(),
    ]);
});

test('admin can reject listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $response = $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/reject', [
        'reason' => 'Photos are unclear, please resubmit with better quality images',
    ]);
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
        ]);
    
    $this->assertDatabaseHas('listings', [
        'id' => $listing->id,
        'status' => 'rejected',
    ]);
});

test('listing approval requires reason', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $response = $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/approve', []);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('listing rejection requires reason', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $response = $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/reject', []);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('admin cannot approve already published listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $response = $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/approve', [
        'reason' => 'Already published',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('admin cannot reject already rejected listing', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'rejected',
    ]);
    
    $response = $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/reject', [
        'reason' => 'Already rejected',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('non-admin user cannot access admin endpoints', function () {
    $tenant = $this->actingAsTenant();
    
    $response = $this->getJson('/api/v1/admin/listings');
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('landlord cannot access admin endpoints', function () {
    $landlord = $this->actingAsLandlord();
    
    $response = $this->getJson('/api/v1/admin/listings');
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('admin moderation activity is logged', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/approve', [
        'reason' => 'Listing approved by admin',
    ]);
    
    $this->assertDatabaseHas('activity_log', [
        'subject_type' => Listing::class,
        'subject_id' => $listing->id,
        'event' => 'listing.approved',
        'causer_id' => $this->admin->id,
    ]);
    
    // Test rejection logging
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $this->postJson('/api/v1/admin/listings/' . $listing2->uuid . '/reject', [
        'reason' => 'Listing rejected by admin',
    ]);
    
    $this->assertDatabaseHas('activity_log', [
        'subject_type' => Listing::class,
        'subject_id' => $listing2->id,
        'event' => 'listing.rejected',
        'causer_id' => $this->admin->id,
    ]);
});

test('admin can view listing details for moderation', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $response = $this->getJson('/api/v1/admin/listings');
    
    $response->assertOk();
    
    $listings = $response->json('data');
    $moderatedListing = collect($listings)->firstWhere('uuid', $listing->uuid);
    
    $this->assertNotNull($moderatedListing);
    $this->assertEquals('pending_review', $moderatedListing['status']);
    $this->assertEquals($listing->title, $moderatedListing['title']);
});

test('admin moderation updates listing timestamps correctly', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
        'created_at' => now()->subDays(5),
    ]);
    
    $originalUpdatedAt = $listing->updated_at;
    
    $this->postJson('/api/v1/admin/listings/' . $listing->uuid . '/approve', [
        'reason' => 'Listing approved',
    ]);
    
    $listing->refresh();
    
    $this->assertTrue($listing->updated_at->gt($originalUpdatedAt));
    $this->assertNotNull($listing->published_at);
});

test('admin can moderate listings from different landlords', function () {
    $landlord1 = $this->makeLandlord();
    $landlord2 = $this->makeLandlord();
    
    $listing1 = Listing::factory()->create([
        'landlord_id' => $landlord1->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $landlord2->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'pending_review',
    ]);
    
    // Approve first listing
    $this->postJson('/api/v1/admin/listings/' . $listing1->uuid . '/approve', [
        'reason' => 'First listing approved',
    ])->assertOk();
    
    // Reject second listing
    $this->postJson('/api/v1/admin/listings/' . $listing2->uuid . '/reject', [
        'reason' => 'Second listing rejected',
    ])->assertOk();
    
    $this->assertDatabaseHas('listings', [
        'id' => $listing1->id,
        'status' => 'published',
    ]);
    
    $this->assertDatabaseHas('listings', [
        'id' => $listing2->id,
        'status' => 'rejected',
    ]);
});
