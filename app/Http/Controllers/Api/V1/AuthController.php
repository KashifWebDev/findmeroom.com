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
                'user_id' => $user->id,
                'rating_avg' => 0,
                'rating_count' => 0,
            ]);
        } elseif ($userData['role'] === 'tenant') {
            $user->tenant()->create([
                'user_id' => $user->id,
                'preferences' => [],
            ]);
        }
        
        return $this->created([
            'user' => $user->load('roles'),
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
            throw ValidationException::withMessages([
                'credentials' => ['The provided credentials are incorrect.'],
            ]);
        }
        
        // Create Sanctum token
        $token = $user->createToken('auth-token')->plainTextToken;
        
        return $this->ok([
            'user' => $user->load('roles'),
            'token' => $token,
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        
        return $this->ok(['message' => 'Successfully logged out']);
    }

    public function me(Request $request)
    {
        $user = $request->user()->load('roles');
        
        return $this->ok($user);
    }
}
