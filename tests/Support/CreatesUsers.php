<?php

namespace Tests\Support;

use App\Models\User;
use App\Models\Landlord;
use App\Models\Tenant;
use Illuminate\Support\Str;
use Laravel\Sanctum\Sanctum;

trait CreatesUsers
{
    public function makeTenant(array $attributes = []): User
    {
        $user = User::factory()->create(array_merge([
            'role' => 'tenant',
            'uuid' => Str::uuid(),
        ], $attributes));
        
        $user->assignRole('tenant');
        
        Tenant::create([
            'user_id' => $user->id,
            'preferences' => ['room_type' => 'private_room'],
        ]);
        
        return $user;
    }
    
    public function makeLandlord(array $attributes = []): User
    {
        $user = User::factory()->create(array_merge([
            'role' => 'landlord',
            'uuid' => Str::uuid(),
        ], $attributes));
        
        $user->assignRole('landlord');
        
        Landlord::create([
            'user_id' => $user->id,
            'rating_avg' => 4.5,
            'rating_count' => 10,
        ]);
        
        return $user;
    }
    
    public function makeAdmin(array $attributes = []): User
    {
        $user = User::factory()->create(array_merge([
            'role' => 'admin',
            'uuid' => Str::uuid(),
        ], $attributes));
        
        $user->assignRole('admin');
        
        return $user;
    }
    
    public function actingAsTenant(array $attributes = []): User
    {
        $user = $this->makeTenant($attributes);
        Sanctum::actingAs($user);
        return $user;
    }
    
    public function actingAsLandlord(array $attributes = []): User
    {
        $user = $this->makeLandlord($attributes);
        Sanctum::actingAs($user);
        return $user;
    }
    
    public function actingAsAdmin(array $attributes = []): User
    {
        $user = $this->makeAdmin($attributes);
        Sanctum::actingAs($user);
        return $user;
    }
}
