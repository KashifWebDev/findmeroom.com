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
        // Check if user already has a verification
        $existingVerification = Verification::where('user_id', auth()->id())->first();
        if ($existingVerification) {
            return $this->fail('VERIFICATION_EXISTS', 'Verification documents already submitted', [], 422);
        }
        
        // Create verification record
        $verification = Verification::create([
            'user_id' => auth()->id(),
            'status' => 'pending',
            'submitted_at' => now(),
        ]);
        
        // Upload documents if provided
        $documentTypes = ['id_proof', 'address_proof', 'income_proof'];
        
        foreach ($documentTypes as $documentType) {
            if ($request->hasFile($documentType)) {
                $verification->addMediaFromRequest($documentType)
                    ->toMediaCollection('verification_docs', 'public');
            }
        }
        
        // Log activity
        activity()
            ->performedOn($verification)
            ->causedBy(auth()->user())
            ->event('verification.submitted')
            ->log('Verification documents submitted');
        
        return $this->created($verification);
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
            'id' => $verification->id,
            'uuid' => $verification->uuid,
            'status' => $verification->status,
            'submitted_at' => $verification->submitted_at?->toISOString(),
            'decided_at' => $verification->decided_at?->toISOString(),
            'decision_reason' => $verification->decision_reason,
            'created_at' => $verification->created_at->toISOString(),
            'updated_at' => $verification->updated_at->toISOString(),
            'documents' => $documents,
        ]);
    }
}
