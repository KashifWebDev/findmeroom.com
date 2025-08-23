<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\VerificationDocsRequest;
use App\Models\Verification;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class VerificationController extends Controller
{
    use ApiResponse;

    public function storeDocs(VerificationDocsRequest $request)
    {
        $data = $request->validated();
        
        // Get or create verification record
        $verification = Verification::firstOrCreate(
            ['user_id' => auth()->id()],
            [
                'user_id' => auth()->id(),
                'status' => 'pending',
                'submitted_at' => null,
            ]
        );
        
        // Clear existing documents
        $verification->clearMediaCollection('verification_docs');
        
        // Upload new documents
        $verification->addMediaFromRequest('cnic')
            ->toMediaCollection('verification_docs', 'public');
        
        $verification->addMediaFromRequest('selfie')
            ->toMediaCollection('verification_docs', 'public');
        
        $verification->addMediaFromRequest('proof')
            ->toMediaCollection('verification_docs', 'public');
        
        // Update status
        $verification->update([
            'status' => 'submitted',
            'submitted_at' => now(),
        ]);
        
        // Log activity
        activity()
            ->performedOn($verification)
            ->causedBy(auth()->user())
            ->event('verification.submitted')
            ->log('Verification documents submitted');
        
        return $this->ok(['message' => 'Verification documents uploaded successfully']);
    }

    public function show()
    {
        $verification = Verification::where('user_id', auth()->id())->first();
        
        if (!$verification) {
            return $this->ok([
                'status' => 'none',
                'submitted_at' => null,
                'documents' => [],
            ]);
        }
        
        $documents = $verification->getMedia('verification_docs')->map(function ($media) {
            return [
                'id' => $media->id,
                'file_name' => $media->file_name,
                'url' => $media->getUrl(),
            ];
        });
        
        return $this->ok([
            'status' => $verification->status,
            'submitted_at' => $verification->submitted_at?->toISOString(),
            'documents' => $documents,
        ]);
    }
}
