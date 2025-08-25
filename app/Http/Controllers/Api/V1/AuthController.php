<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\LoginRequest;
use App\Http\Requests\V1\RegisterRequest;
use App\Models\User;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use Spatie\Permission\Models\Role;

class AuthController extends Controller
{
    use ApiResponse;

    public function register(RegisterRequest $request)
    {
        $userData = $request->validated();
        $userData['password'] = Hash::make($userData['password']);
        
        // Set default role if not specified
        if (!isset($userData['role'])) {
            $userData['role'] = 'tenant';
        }
        
        // Set default status
        if (!isset($userData['status'])) {
            $userData['status'] = 'active';
        }
        
        $user = User::create($userData);
        
        // Assign role
        $role = Role::where('name', $userData['role'])->first();
        if ($role) {
            $user->assignRole($role);
        }
        
        // Create Sanctum token
        $token = $user->createToken('auth-token')->plainTextToken;
        
        // Create tenant/landlord profile if needed
        if ($userData['role'] === 'landlord') {
            $user->landlord()->create([
                'rating_avg' => 0,
                'rating_count' => 0,
            ]);
        } elseif ($userData['role'] === 'tenant') {
            $user->tenant()->create([
                'preferences' => [],
            ]);
        }
        
        return $this->created([
            'user' => [
                'id' => $user->id,
                'uuid' => $user->uuid,
                'name' => $user->name,
                'email' => $user->email,
                'phone_e164' => $user->phone_e164,
                'role' => $user->role,
                'status' => $user->status,
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ],
            'token' => $token,
        ]);
    }

    public function login(LoginRequest $request)
    {
        $credentials = $request->validated();
        
        // Find user by email or phone
        $user = null;
        if (isset($credentials['email'])) {
            $user = User::where('email', $credentials['email'])->first();
        } elseif (isset($credentials['phone_e164'])) {
            $user = User::where('phone_e164', $credentials['phone_e164'])->first();
        }
        
        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return $this->fail('INVALID_CREDENTIALS', 'The provided credentials are incorrect.', null, 401);
        }
        
        // Create Sanctum token
        $token = $user->createToken('auth-token')->plainTextToken;
        
        return $this->ok([
            'user' => [
                'id' => $user->id,
                'uuid' => $user->uuid,
                'name' => $user->name,
                'email' => $user->email,
                'phone_e164' => $user->phone_e164,
                'role' => $user->role,
                'status' => $user->status,
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
            ],
            'token' => $token,
        ]);
    }

    public function logout(Request $request)
    {
        // Delete all tokens for this user to ensure logout
        $request->user()->tokens()->delete();
        
        return $this->noContent();
    }

    public function me(Request $request)
    {
        $user = $request->user();
        
        return $this->ok([
            'id' => $user->id,
            'uuid' => $user->uuid,
            'name' => $user->name,
            'email' => $user->email,
            'phone_e164' => $user->phone_e164,
            'role' => $user->role,
            'status' => $user->status,
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ]);
    }
}
