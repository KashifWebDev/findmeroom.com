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

test('min_price scope filters listings above minimum price', function () {
    $cheapListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 5000,
    ]);
    
    $expensiveListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 15000,
    ]);
    
    $listings = Listing::minPrice(8000)->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($expensiveListing->id, $listings->first()->id);
});

test('min_price scope includes listings at minimum price', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 10000,
    ]);
    
    $listings = Listing::minPrice(10000)->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing->id, $listings->first()->id);
});

test('min_price scope with zero includes all listings', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 1000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 50000,
    ]);
    
    $listings = Listing::minPrice(0)->get();
    
    $this->assertCount(2, $listings);
});

test('max_price scope filters listings below maximum price', function () {
    $cheapListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 5000,
    ]);
    
    $expensiveListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 15000,
    ]);
    
    $listings = Listing::maxPrice(10000)->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($cheapListing->id, $listings->first()->id);
});

test('max_price scope includes listings at maximum price', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 10000,
    ]);
    
    $listings = Listing::maxPrice(10000)->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing->id, $listings->first()->id);
});

test('max_price scope with high value includes all listings', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 1000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 50000,
    ]);
    
    $listings = Listing::maxPrice(100000)->get();
    
    $this->assertCount(2, $listings);
});

test('min_price and max_price scopes can be combined', function () {
    $cheapListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 5000,
    ]);
    
    $midListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 10000,
    ]);
    
    $expensiveListing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 15000,
    ]);
    
    $listings = Listing::minPrice(8000)->maxPrice(12000)->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($midListing->id, $listings->first()->id);
});

test('price scopes work with decimal values', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 9999.99,
    ]);
    
    $listings = Listing::minPrice(9999.98)->maxPrice(10000.00)->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing->id, $listings->first()->id);
});

test('price scopes handle edge cases correctly', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 0.01,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 999999.99,
    ]);
    
    // Test very low min price
    $listings = Listing::minPrice(0.01)->get();
    $this->assertCount(2, $listings);
    
    // Test very high max price
    $listings = Listing::maxPrice(999999.99)->get();
    $this->assertCount(2, $listings);
    
    // Test exact range
    $listings = Listing::minPrice(0.01)->maxPrice(999999.99)->get();
    $this->assertCount(2, $listings);
});

test('price scopes work with other scopes', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 10000,
        'room_type' => 'private_room',
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 20000,
        'room_type' => 'shared_room',
    ]);
    
    $listings = Listing::where('room_type', 'private_room')
        ->minPrice(5000)
        ->maxPrice(15000)
        ->get();
    
    $this->assertCount(1, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
});

test('price scopes return query builder for chaining', function () {
    $query = Listing::minPrice(1000);
    
    $this->assertInstanceOf(\Illuminate\Database\Eloquent\Builder::class, $query);
    
    $query = Listing::maxPrice(50000);
    
    $this->assertInstanceOf(\Illuminate\Database\Eloquent\Builder::class, $query);
});

test('price scopes handle null values gracefully', function () {
    $listing = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 10000,
    ]);
    
    // These should not throw errors
    $listings = Listing::minPrice(null)->get();
    $this->assertCount(1, $listings);
    
    $listings = Listing::maxPrice(null)->get();
    $this->assertCount(1, $listings);
});

test('price scopes work with order by clauses', function () {
    $listing1 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 5000,
    ]);
    
    $listing2 = Listing::factory()->create([
        'landlord_id' => $this->landlord->id,
        'area_id' => $this->geography['area']->id,
        'rent_monthly' => 10000,
    ]);
    
    $listings = Listing::minPrice(1000)
        ->maxPrice(15000)
        ->orderBy('rent_monthly', 'asc')
        ->get();
    
    $this->assertCount(2, $listings);
    $this->assertEquals($listing1->id, $listings->first()->id);
    $this->assertEquals($listing2->id, $listings->last()->id);
});
