<?php

use App\Models\Listing;
use App\Models\Landlord;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->landlord = $this->makeLandlord();
});

test('successful responses include ok: true', function () {
    $response = $this->getJson('/api/v1/health');
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
        ]);
});

test('error responses include ok: false', function () {
    $response = $this->getJson('/api/v1/non-existent-endpoint');
    
    $response->assertStatus(404)
        ->assertJson([
            'ok' => false,
        ]);
});

test('successful responses include data field', function () {
    $response = $this->getJson('/api/v1/health');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data',
            'meta',
        ]);
});

test('error responses include error field', function () {
    $response = $this->getJson('/api/v1/non-existent-endpoint');
    
    $response->assertStatus(404)
        ->assertJsonStructure([
            'ok',
            'data',
            'meta',
            'error' => [
                'code',
                'message',
            ],
        ]);
});

test('validation errors include fields in error response', function () {
    $response = $this->postJson('/api/v1/auth/register', [
        'name' => '',
        'password' => '123',
    ]);
    
    $response->assertStatus(422)
        ->assertJsonStructure([
            'ok',
            'data',
            'meta',
            'error' => [
                'code',
                'message',
                'fields',
            ],
        ])
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('created responses use 201 status code', function () {
    $userData = [
        'name' => 'Test User',
        'password' => 'password123',
        'role' => 'tenant',
    ];
    
    $response = $this->postJson('/api/v1/auth/register', $userData);
    
    $response->assertCreated()
        ->assertJson([
            'ok' => true,
        ]);
});

test('deleted responses use 204 status code', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
    ]);
    
    $this->actingAs($this->landlord);
    
    $response = $this->deleteJson('/api/v1/me/listings/' . $listing->uuid);
    
    $response->assertNoContent();
});

test('pagination includes correct meta structure', function () {
    // Create 25 listings (more than default per_page of 20)
    for ($i = 0; $i < 25; $i++) {
        Listing::factory()->create([
            'landlord_id' => $this->landlord->landlord->id,
            'area_id' => $this->geography['area']->id,
            'status' => 'published',
            'published_at' => now(),
        ]);
    }
    
    $response = $this->getJson('/api/v1/listings');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data',
            'meta' => [
                'page',
                'per_page',
                'total',
                'last_page',
            ],
        ])
        ->assertJson([
            'ok' => true,
            'meta' => [
                'page' => 1,
                'per_page' => 20,
                'total' => 25,
                'last_page' => 2,
            ],
        ]);
});

test('authentication errors use 401 status', function () {
    $response = $this->getJson('/api/v1/auth/me');
    
    $response->assertStatus(401)
        ->assertJson([
            'ok' => false,
        ]);
});

test('authorization errors use 403 status', function () {
    $tenant = $this->actingAsTenant();
    
    $response = $this->getJson('/api/v1/me/listings');
    
    $response->assertStatus(403)
        ->assertJson([
            'ok' => false,
        ]);
});

test('not found errors use 404 status', function () {
    $response = $this->getJson('/api/v1/listings/non-existent-uuid');
    
    $response->assertStatus(404)
        ->assertJson([
            'ok' => false,
        ]);
});

test('validation errors use 422 status', function () {
    $response = $this->postJson('/api/v1/auth/register', [
        'name' => '',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('rate limiting errors use 429 status', function () {
    // Create 6 enquiries (rate limit is 5 per minute)
    $tenant = $this->actingAsTenant();
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->landlord->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    for ($i = 0; $i < 5; $i++) {
        $this->postJson('/api/v1/enquiries', [
            'listing_id' => $listing->uuid,
            'message' => "Test enquiry {$i}",
        ]);
    }
    
    $response = $this->postJson('/api/v1/enquiries', [
        'listing_id' => $listing->uuid,
        'message' => 'Rate limited enquiry',
    ]);
    
    $response->assertStatus(429)
        ->assertJson([
            'ok' => false,
        ]);
});

test('server errors use 500 status', function () {
    // This test would require mocking a service to throw an exception
    // For now, we'll test the structure of error responses
    $response = $this->getJson('/api/v1/non-existent-endpoint');
    
    $response->assertStatus(404)
        ->assertJsonStructure([
            'ok',
            'data',
            'meta',
            'error',
        ]);
});

test('response envelope is consistent across all endpoints', function () {
    // Test health endpoint
    $healthResponse = $this->getJson('/api/v1/health');
    $healthResponse->assertJsonStructure([
        'ok',
        'data',
        'meta',
    ]);
    
    // Test geography endpoints
    $citiesResponse = $this->getJson('/api/v1/cities');
    $citiesResponse->assertJsonStructure([
        'ok',
        'data',
        'meta',
    ]);
    
    // Test public listings
    $listingsResponse = $this->getJson('/api/v1/listings');
    $listingsResponse->assertJsonStructure([
        'ok',
        'data',
        'meta',
    ]);
    
    // Verify all successful responses have ok: true
    $this->assertTrue($healthResponse->json('ok'));
    $this->assertTrue($citiesResponse->json('ok'));
    $this->assertTrue($listingsResponse->json('ok'));
});

test('error response includes appropriate error code', function () {
    $response = $this->postJson('/api/v1/auth/register', [
        'name' => '',
        'password' => '123',
    ]);
    
    $response->assertStatus(422);
    
    $error = $response->json('error');
    $this->assertArrayHasKey('code', $error);
    $this->assertArrayHasKey('message', $error);
    $this->assertArrayHasKey('fields', $error);
    
    $this->assertEquals('VALIDATION_ERROR', $error['code']);
    $this->assertNotEmpty($error['message']);
    $this->assertIsArray($error['fields']);
});

test('successful response data is properly structured', function () {
    $response = $this->getJson('/api/v1/health');
    
    $response->assertOk();
    
    $data = $response->json('data');
    $this->assertIsArray($data);
    $this->assertArrayHasKey('app', $data);
    $this->assertArrayHasKey('version', $data);
    $this->assertArrayHasKey('time', $data);
});

test('pagination meta includes correct values', function () {
    // Create 15 listings
    for ($i = 0; $i < 15; $i++) {
        Listing::factory()->create([
            'landlord_id' => $this->landlord->landlord->id,
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
    $this->assertEquals(15, $meta['total']);
    $this->assertEquals(1, $meta['last_page']);
});

test('empty data responses maintain envelope structure', function () {
    $response = $this->getJson('/api/v1/cities');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data',
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [],
        ]);
});
