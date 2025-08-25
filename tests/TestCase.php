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
        
        // Prevent seeders from running during tests
        config(['app.env' => 'testing']);
        
        // Create Spatie roles for testing (both web and sanctum guards)
        Role::firstOrCreate(['name' => 'admin', 'guard_name' => 'web']);
        Role::firstOrCreate(['name' => 'landlord', 'guard_name' => 'web']);
        Role::firstOrCreate(['name' => 'tenant', 'guard_name' => 'web']);
        Role::firstOrCreate(['name' => 'admin', 'guard_name' => 'sanctum']);
        Role::firstOrCreate(['name' => 'landlord', 'guard_name' => 'sanctum']);
        Role::firstOrCreate(['name' => 'tenant', 'guard_name' => 'sanctum']);
        
        // Create basic permissions
        Permission::firstOrCreate(['name' => 'admin', 'guard_name' => 'web']);
        Permission::firstOrCreate(['name' => 'landlord', 'guard_name' => 'web']);
        Permission::firstOrCreate(['name' => 'tenant', 'guard_name' => 'web']);
        Permission::firstOrCreate(['name' => 'admin', 'guard_name' => 'sanctum']);
        Permission::firstOrCreate(['name' => 'landlord', 'guard_name' => 'sanctum']);
        Permission::firstOrCreate(['name' => 'tenant', 'guard_name' => 'sanctum']);
        
        // Assign permissions to roles (web guard)
        $adminRole = Role::findByName('admin', 'web');
        $landlordRole = Role::findByName('landlord', 'web');
        $tenantRole = Role::findByName('tenant', 'web');
        
        $adminRole->givePermissionTo(Permission::findByName('admin', 'web'));
        $landlordRole->givePermissionTo(Permission::findByName('landlord', 'web'));
        $tenantRole->givePermissionTo(Permission::findByName('tenant', 'web'));
        
        // Assign permissions to roles (sanctum guard)
        $adminRoleSanctum = Role::findByName('admin', 'sanctum');
        $landlordRoleSanctum = Role::findByName('landlord', 'sanctum');
        $tenantRoleSanctum = Role::findByName('tenant', 'sanctum');
        
        $adminRoleSanctum->givePermissionTo(Permission::findByName('admin', 'sanctum'));
        $landlordRoleSanctum->givePermissionTo(Permission::findByName('landlord', 'sanctum'));
        $tenantRoleSanctum->givePermissionTo(Permission::findByName('tenant', 'sanctum'));
        
        // Fake storage for media tests
        Storage::fake('public');
        
        // Set Scout driver to null for testing
        config(['scout.driver' => 'null']);
        
        // Set timezone to UTC
        config(['app.timezone' => 'UTC']);
    }
}
