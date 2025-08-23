<?php

use Tests\TestCase;

uses(TestCase::class)->in('Feature');
uses(TestCase::class)->in('Unit');

beforeEach(function () {
    // Create Spatie roles for testing
    $this->artisan('permission:create-permission', ['name' => 'admin']);
    $this->artisan('permission:create-permission', ['name' => 'landlord']);
    $this->artisan('permission:create-permission', ['name' => 'tenant']);
    
    $this->artisan('permission:create-role', ['name' => 'admin']);
    $this->artisan('permission:create-role', ['name' => 'landlord']);
    $this->artisan('permission:create-role', ['name' => 'tenant']);
    
    $this->artisan('permission:give-permission-to-role', ['role' => 'admin', 'permission' => 'admin']);
    $this->artisan('permission:give-permission-to-role', ['role' => 'landlord', 'permission' => 'landlord']);
    $this->artisan('permission:give-permission-to-role', ['role' => 'tenant', 'permission' => 'tenant']);
});

/*
|--------------------------------------------------------------------------
| Expectations
|--------------------------------------------------------------------------
|
| When you're writing tests, you often need to check that values meet certain conditions. The
| "expect()" function gives you access to a set of "expectations" methods that you can use
| to assert different things. Of course, you may extend the Expectation API at any time.
|
*/

expect()->extend('toBeOne', function () {
    return $this->toBe(1);
});

/*
|--------------------------------------------------------------------------
| Functions
|--------------------------------------------------------------------------
|
| While Pest is very powerful out-of-the-box, you may have some testing code specific to your
| project that you don't want to repeat in every file. Here you can also expose helpers as
| global functions to help you to reduce the number of lines of code in your test files.
|
*/

function something()
{
    // ..
}
