<?php

use App\Models\Listing;
use App\Models\Area;
use App\Models\City;
use App\Models\Landlord;
use App\Services\ListingQueryService;
use Illuminate\Http\Request;
use Tests\Support\CreatesUsers;
use Tests\Support\GeographyFactory;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->geography = GeographyFactory::createFullGeography();
    $this->landlordUser = $this->makeLandlord();
    $this->service = new ListingQueryService();
});

test('public index query only includes published listings', function () {
    // Create published listing
    $publishedListing = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    // Create draft listing
    $draftListing = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'draft',
        'published_at' => null,
    ]);
    
    $request = new Request();
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($publishedListing->id, $listings->first()->id);
});

test('public index query supports area filtering', function () {
    $otherArea = Area::create([
        'name' => 'Other Area',
        'city_id' => $this->geography['city']->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'campus_id' => null,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $otherArea->id,
        'status' => 'published',
        'published_at' => now(),
        'campus_id' => null,
    ]);
    
    $request = new Request(['area_id' => $this->geography['area']->id]);
    $query = $this->service->publicIndex($request);
    $listings = $query->get();
    
    expect($listings)->toHaveCount(1);
    expect($listings->first()->id)->toBe($listing1->id);
});

test('public index query supports city filtering', function () {
    $otherCity = City::create([
        'name' => 'Other City',
        'region_id' => $this->geography['region']->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $otherArea = Area::create([
        'name' => 'Other Area',
        'city_id' => $otherCity->id,
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $otherArea->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $request = new Request(['city_id' => $this->geography['city']->id]);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports room type filtering', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'room_type' => 'private_room',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'room_type' => 'shared_room',
    ]);
    
    $request = new Request(['room_type' => 'private_room']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports gender preference filtering', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'gender_pref' => 'male_only',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'gender_pref' => 'female_only',
    ]);
    
    $request = new Request(['gender_pref' => 'male_only']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports furnished filtering', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'furnished' => true,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'furnished' => false,
    ]);
    
    $request = new Request(['furnished' => '1']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports verified level filtering', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'verified_level' => 'verified',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'verified_level' => 'none',
    ]);
    
    $request = new Request(['verified_level' => 'verified']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports title text search', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'title' => 'Beautiful apartment in Gulberg',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'title' => 'Student accommodation near campus',
    ]);
    
    $request = new Request(['title' => 'apartment']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports min price filtering', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 10000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 5000,
    ]);
    
    $request = new Request(['min_price' => 8000]);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports max price filtering', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 5000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 15000,
    ]);
    
    $request = new Request(['max_price' => 10000]);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('public index query supports sorting by published_at', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now()->subDays(2),
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now()->subDays(1),
    ]);
    
    $request = new Request(['sort' => 'published_at']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(2, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id); // Older first
    $this->assertEquals($listing2->id, $listings->last()->id); // Newer last
});

test('public index query supports sorting by rent_monthly', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 15000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'rent_monthly' => 5000,
    ]);
    
    $request = new Request(['sort' => 'rent_monthly']);
    $query = $this->service->publicIndex($request);
    
    $listings = $query->get();
    
    $this->assertCount(2, $listings);
    $this->assertEquals($listing2->id, $listings->first()->id); // Cheaper first
    $this->assertEquals($listing1->id, $listings->last()->id); // More expensive last
});

test('public index query includes relationships', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
    ]);
    
    $request = new Request();
    $query = $this->service->publicIndex($request);
    
    $listingWithRelations = $query->first();
    
    $this->assertTrue($listingWithRelations->relationLoaded('area'));
    $this->assertTrue($listingWithRelations->relationLoaded('landlord'));
    $this->assertNotNull($listingWithRelations->area);
    $this->assertNotNull($listingWithRelations->landlord);
});

test('public index query handles multiple filters', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'room_type' => 'private_room',
        'furnished' => true,
        'rent_monthly' => 10000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlordUser->id,
        'area_id' => $this->geography['area']->id,
        'status' => 'published',
        'published_at' => now(),
        'room_type' => 'shared_room',
        'furnished' => false,
        'rent_monthly' => 5000,
    ]);
    
    $request = new Request([
        'room_type' => 'private_room',
        'furnished' => '1',
        'max_price' => 15000,
    ]);
    
    $query = $this->service->publicIndex($request);
    $listings = $query->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});
