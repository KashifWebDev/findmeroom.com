<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Storage;
use Laravel\Scout\ScoutServiceProvider;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication, RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        
        // Fake storage for media tests
        Storage::fake('public');
        
        // Set Scout driver to array for testing
        config(['scout.driver' => 'array']);
        
        // Set timezone to UTC
        config(['app.timezone' => 'UTC']);
    }
}
