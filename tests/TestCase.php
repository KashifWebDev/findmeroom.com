<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Storage;
use Laravel\Scout\ScoutServiceProvider;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication, RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        

        
        // Create Spatie roles for testing
        Role::firstOrCreate(['name' => 'admin']);
        Role::firstOrCreate(['name' => 'landlord']);
        Role::firstOrCreate(['name' => 'tenant']);
        
        // Create basic permissions
        Permission::firstOrCreate(['name' => 'admin']);
        Permission::firstOrCreate(['name' => 'landlord']);
        Permission::firstOrCreate(['name' => 'tenant']);
        
        // Assign permissions to roles
        $adminRole = Role::findByName('admin');
        $landlordRole = Role::findByName('landlord');
        $tenantRole = Role::findByName('tenant');
        
        $adminRole->givePermissionTo('admin');
        $landlordRole->givePermissionTo('landlord');
        $tenantRole->givePermissionTo('tenant');
        
        // Fake storage for media tests
        Storage::fake('public');
        
        // Set Scout driver to null for testing
        config(['scout.driver' => 'null']);
        
        // Set timezone to UTC
        config(['app.timezone' => 'UTC']);
    }
}
