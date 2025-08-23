<?php

use App\Models\User;

test('health endpoint returns correct response structure', function () {
    $response = $this->getJson('/api/v1/health');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'app',
                'version',
                'time',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'app' => config('app.name'),
            ],
        ]);
});

test('health endpoint returns valid timestamp', function () {
    $response = $this->getJson('/api/v1/health');
    
    $response->assertOk();
    
    $timestamp = $response->json('data.time');
    $this->assertNotNull($timestamp);
    $this->assertIsString($timestamp);
    
    // Verify it's a valid ISO 8601 timestamp
    $date = \Carbon\Carbon::parse($timestamp);
    $this->assertInstanceOf(\Carbon\Carbon::class, $date);
});
