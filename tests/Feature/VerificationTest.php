<?php

use App\Models\Verification;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\Support\CreatesUsers;

uses(CreatesUsers::class);

beforeEach(function () {
    $this->user = $this->actingAsTenant();
});

test('user can upload verification documents', function () {
    $files = [
        'id_proof' => UploadedFile::fake()->image('id_card.jpg', 800, 600),
        'address_proof' => UploadedFile::fake()->image('utility_bill.jpg', 800, 600),
        'income_proof' => UploadedFile::fake()->image('salary_slip.jpg', 800, 600),
    ];
    
    $response = $this->postJson('/api/v1/me/verification/docs', $files);
    
    $response->assertCreated()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'uuid',
                'status',
                'submitted_at',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'status' => 'pending',
            ],
        ]);
    
    $this->assertDatabaseHas('verifications', [
        'user_id' => $this->user->id,
        'status' => 'pending',
    ]);
    
    // Check media files were uploaded
    foreach ($files as $file) {
        Storage::disk('public')->assertExists('media/' . $file->hashName());
    }
});

test('verification document upload fails with invalid file types', function () {
    $files = [
        'id_proof' => UploadedFile::fake()->create('document.pdf', 100),
        'address_proof' => UploadedFile::fake()->image('utility_bill.jpg', 800, 600),
    ];
    
    $response = $this->postJson('/api/v1/me/verification/docs', $files);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('verification document upload fails with oversized files', function () {
    $files = [
        'id_proof' => UploadedFile::fake()->image('id_card.jpg', 800, 600)->size(10240), // 10MB
        'address_proof' => UploadedFile::fake()->image('utility_bill.jpg', 800, 600),
    ];
    
    $response = $this->postJson('/api/v1/me/verification/docs', $files);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('user can view their verification status', function () {
    $verification = Verification::create([
        'user_id' => $this->user->id,
        'status' => 'pending',
        'submitted_at' => now(),
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->getJson('/api/v1/me/verification');
    
    $response->assertOk()
        ->assertJsonStructure([
            'ok',
            'data' => [
                'id',
                'uuid',
                'status',
                'submitted_at',
                'decided_at',
                'decision_reason',
                'created_at',
                'updated_at',
            ],
            'meta',
        ])
        ->assertJson([
            'ok' => true,
            'data' => [
                'status' => 'pending',
            ],
        ]);
});

test('verification shows approved status correctly', function () {
    $verification = Verification::create([
        'user_id' => $this->user->id,
        'status' => 'approved',
        'submitted_at' => now()->subDays(2),
        'decided_at' => now()->subDay(),
        'decision_reason' => 'Documents verified successfully',
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->getJson('/api/v1/me/verification');
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
            'data' => [
                'status' => 'approved',
                'decision_reason' => 'Documents verified successfully',
            ],
        ]);
});

test('verification shows rejected status correctly', function () {
    $verification = Verification::create([
        'user_id' => $this->user->id,
        'status' => 'rejected',
        'submitted_at' => now()->subDays(2),
        'decided_at' => now()->subDay(),
        'decision_reason' => 'ID proof is unclear, please resubmit',
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $response = $this->getJson('/api/v1/me/verification');
    
    $response->assertOk()
        ->assertJson([
            'ok' => true,
            'data' => [
                'status' => 'rejected',
                'decision_reason' => 'ID proof is unclear, please resubmit',
            ],
        ]);
});

test('verification documents are stored in correct collection', function () {
    $files = [
        'id_proof' => UploadedFile::fake()->image('id_card.jpg', 800, 600),
        'address_proof' => UploadedFile::fake()->image('utility_bill.jpg', 800, 600),
    ];
    
    $this->postJson('/api/v1/me/verification/docs', $files);
    
    $verification = Verification::where('user_id', $this->user->id)->first();
    
    $this->assertNotNull($verification);
    
    // Check media files are in verification_docs collection
    foreach ($files as $file) {
        $media = $verification->getMedia('verification_docs')->where('file_name', $file->getClientOriginalName())->first();
        $this->assertNotNull($media);
        $this->assertEquals('verification_docs', $media->collection_name);
    }
});

test('user cannot upload verification documents multiple times', function () {
    // First upload
    $files1 = [
        'id_proof' => UploadedFile::fake()->image('id_card.jpg', 800, 600),
    ];
    
    $this->postJson('/api/v1/me/verification/docs', $files1)->assertCreated();
    
    // Second upload should fail
    $files2 = [
        'address_proof' => UploadedFile::fake()->image('utility_bill.jpg', 800, 600),
    ];
    
    $response = $this->postJson('/api/v1/me/verification/docs', $files2);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
        ]);
});

test('verification activity is logged', function () {
    $files = [
        'id_proof' => UploadedFile::fake()->image('id_card.jpg', 800, 600),
    ];
    
    $this->postJson('/api/v1/me/verification/docs', $files);
    
    $verification = Verification::where('user_id', $this->user->id)->first();
    
    $this->assertDatabaseHas('activity_log', [
        'subject_type' => Verification::class,
        'subject_id' => $verification->id,
        'event' => 'verification.submitted',
        'causer_id' => $this->user->id,
    ]);
});

test('unauthenticated user cannot access verification endpoints', function () {
    $this->withoutMiddleware(\Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class);
    
    $response = $this->getJson('/api/v1/me/verification');
    
    $response->assertStatus(401)
        ->assertJson([
            'ok' => false,
        ]);
});

test('verification document validation requires at least one document', function () {
    $response = $this->postJson('/api/v1/me/verification/docs', []);
    
    $response->assertStatus(422)
        ->assertJson([
            'ok' => false,
            'error' => [
                'code' => 'VALIDATION_ERROR',
            ],
        ]);
});

test('verification status transitions work correctly', function () {
    // Start with pending
    $verification = Verification::create([
        'user_id' => $this->user->id,
        'status' => 'pending',
        'submitted_at' => now(),
        'uuid' => \Illuminate\Support\Str::uuid(),
    ]);
    
    $this->assertEquals('pending', $verification->status);
    
    // Can transition to approved
    $verification->update([
        'status' => 'approved',
        'decided_at' => now(),
        'decision_reason' => 'Documents verified',
    ]);
    
    $this->assertEquals('approved', $verification->fresh()->status);
    
    // Can transition to rejected
    $verification->update([
        'status' => 'rejected',
        'decision_reason' => 'Documents unclear',
    ]);
    
    $this->assertEquals('rejected', $verification->fresh()->status);
});
