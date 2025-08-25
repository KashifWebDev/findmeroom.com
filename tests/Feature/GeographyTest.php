<?php

use App\Models\Country;
use App\Models\Region;
use App\Models\City;
use App\Models\Area;
use App\Models\Campus;
use Tests\Support\GeographyFactory;

test('cities endpoint returns correct response structure', function () {
    $geography = GeographyFactory::createFullGeography();
    
    $response = $this->getJson('/api/v1/cities');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'name',
                    'region_id',
                    'created_at',
                    'updated_at',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
});

test('areas endpoint returns correct response structure', function () {
    $geography = GeographyFactory::createFullGeography();
    
    $response = $this->getJson('/api/v1/areas?city_id=' . $geography['city']->id);
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'name',
                    'city_id',
                    'created_at',
                    'updated_at',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
});

test('campuses endpoint returns correct response structure', function () {
    $geography = GeographyFactory::createFullGeography();
    
    $response = $this->getJson('/api/v1/campuses');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                '*' => [
                    'id',
                    'uuid',
                    'name',
                    'city_id',
                    'created_at',
                    'updated_at',
                ],
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
        ]);
});

test('geography endpoints return empty arrays when no data exists', function () {
    $response = $this->getJson('/api/v1/cities');
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
            'data' => [],
        ]);
});

test('geography data is properly seeded', function () {
    $geography = GeographyFactory::createFullGeography();
    
    $this->assertDatabaseHas('cities', [
        'id' => $geography['city']->id,
        'name' => $geography['city']->name,
    ]);
    
    $this->assertDatabaseHas('areas', [
        'id' => $geography['area']->id,
        'name' => $geography['area']->name,
    ]);
    
    $this->assertDatabaseHas('campuses', [
        'id' => $geography['campus']->id,
        'name' => $geography['campus']->name,
    ]);
});
