<?php

use App\Models\User;
use Laravel\Sanctum\Sanctum;
use Tests\Support\CreatesUsers;

uses(CreatesUsers::class);

test('user can register with valid data', function () {
    $userData = [
        'name' => 'John Doe',
        'email' => 'john@example.com',
        'phone_e164' => '+923001234567',
        'password' => 'password123',
        'role' => 'tenant',
    ];
    
    $response = $this->postJson('/api/v1/auth/register', $userData);
    
    $response->assertCreated()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'user' => [
                    'id',
                    'uuid',
                    'name',
                    'email',
                    'phone_e164',
                    'role',
                    'status',
                    'created_at',
                    'updated_at',
                ],
                'token',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'user' => [
                    'name' => 'John Doe',
                    'email' => 'john@example.com',
                    'phone_e164' => '+923001234567',
                    'role' => 'tenant',
                ],
            ],
        ]);
    
    $this->assertDatabaseHas('users', [
        'name' => 'John Doe',
        'email' => 'john@example.com',
        'phone_e164' => '+923001234567',
        'role' => 'tenant',
    ]);
    
    $this->assertDatabaseHas('tenants', [
        'user_id' => User::where('email', 'john@example.com')->first()->id,
    ]);
});

test('user can register without email or phone', function () {
    $userData = [
        'name' => 'Jane Doe',
        'password' => 'password123',
        'role' => 'landlord',
    ];
    
    $response = $this->postJson('/api/v1/auth/register', $userData);
    
    $response->assertCreated()
        ->assertJson([
            'ok' => true,
            'data' => [
                'user' => [
                    'name' => 'Jane Doe',
                    'role' => 'landlord',
                ],
            ],
        ]);
    
    $this->assertDatabaseHas('users', [
        'name' => 'Jane Doe',
        'role' => 'landlord',
    ]);
    
    $this->assertDatabaseHas('landlords', [
        'user_id' => User::where('name', 'Jane Doe')->first()->id,
    ]);
});

test('registration fails with invalid data', function () {
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

test('registration fails with duplicate email', function () {
    $existingUser = $this->makeTenant(['email' => 'test@example.com']);
    
    $response = $this->postJson('/api/v1/auth/register', [
        'name' => 'Another User',
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('user can login with valid credentials', function () {
    $user = $this->makeTenant([
        'email' => 'login@example.com',
        'password' => bcrypt('password123'),
    ]);
    
    $response = $this->postJson('/api/v1/auth/login', [
        'email' => 'login@example.com',
        'password' => 'password123',
    ]);
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'user' => [
                    'id',
                    'uuid',
                    'name',
                    'email',
                    'role',
                ],
                'token',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'user' => [
                    'email' => 'login@example.com',
                ],
            ],
        ]);
});

test('login fails with invalid credentials', function () {
    $response = $this->postJson('/api/v1/auth/login', [
        'email' => 'nonexistent@example.com',
        'password' => 'wrongpassword',
    ]);
    
    $response->assertStatus(401)
        ->assertJson([
            'ok' => false,
        ]);
});

test('authenticated user can access me endpoint', function () {
    $user = $this->actingAsTenant();
    
    $response = $this->getJson('/api/v1/auth/me');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'uuid',
                'name',
                'email',
                'phone_e164',
                'role',
                'status',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'id' => $user->id,
                'name' => $user->name,
            ],
        ]);
});

test('unauthenticated user cannot access me endpoint', function () {
    $response = $this->getJson('/api/v1/auth/me');
    
    $response->assertStatus(401)
        ->assertJson([
            'ok' => false,
        ]);
});

test('user can logout', function () {
    $user = $this->actingAsTenant();
    
    $response = $this->postJson('/api/v1/auth/logout');
    
    $response->assertNoContent();
    
    // Verify token is invalidated
    $meResponse = $this->getJson('/api/v1/auth/me');
    $meResponse->assertStatus(401);
});

test('registration creates proper role assignments', function () {
    $tenantData = [
        'name' => 'Tenant User',
        'password' => 'password123',
        'role' => 'tenant',
    ];
    
    $landlordData = [
        'name' => 'Landlord User',
        'password' => 'password123',
        'role' => 'landlord',
    ];
    
    $this->postJson('/api/v1/auth/register', $tenantData);
    $this->postJson('/api/v1/auth/register', $landlordData);
    
    $tenant = User::where('name', 'Tenant User')->first();
    $landlord = User::where('name', 'Landlord User')->first();
    
    $this->assertTrue($tenant->hasRole('tenant'));
    $this->assertTrue($landlord->hasRole('landlord'));
    
    $this->assertDatabaseHas('tenants', ['user_id' => $tenant->id]);
    $this->assertDatabaseHas('landlords', ['user_id' => $landlord->id]);
});
