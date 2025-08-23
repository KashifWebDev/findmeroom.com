<?php

use App\Http\Controllers\Api\V1\AdminListingModerationController;
use App\Http\Controllers\Api\V1\AuthController;
use App\Http\Controllers\Api\V1\BoostController;
use App\Http\Controllers\Api\V1\EnquiryController;
use App\Http\Controllers\Api\V1\GeographyController;
use App\Http\Controllers\Api\V1\HealthController;
use App\Http\Controllers\Api\V1\LandlordEnquiryController;
use App\Http\Controllers\Api\V1\ListingMediaController;
use App\Http\Controllers\Api\V1\ListingOwnerController;
use App\Http\Controllers\Api\V1\ListingPublicController;
use App\Http\Controllers\Api\V1\SavedListingController;
use App\Http\Controllers\Api\V1\SavedSearchController;
use App\Http\Controllers\Api\V1\VerificationController;
use App\Http\Controllers\Api\V1\WebhookPaymentsController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->name('api.v1.')->middleware(['throttle:api'])->group(function () {
    
    // Public routes
    Route::get('/health', HealthController::class);
    Route::get('/cities', [GeographyController::class, 'cities']);
    Route::get('/areas', [GeographyController::class, 'areas']);
    Route::get('/campuses', [GeographyController::class, 'campuses']);
    Route::get('/listings', [ListingPublicController::class, 'index']);
    Route::get('/listings/{listing:uuid}', [ListingPublicController::class, 'show']);
    
    // Auth routes
    Route::post('/auth/register', [AuthController::class, 'register'])->middleware('throttle:auth');
    Route::post('/auth/login', [AuthController::class, 'login'])->middleware('throttle:auth');
    Route::post('/auth/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
    Route::get('/auth/me', [AuthController::class, 'me'])->middleware('auth:sanctum');
    
    // Tenant routes (auth:sanctum)
    Route::middleware(['auth:sanctum'])->group(function () {
        Route::post('/enquiries', [EnquiryController::class, 'store'])->middleware('throttle:enquiries');
        Route::get('/me/enquiries', [EnquiryController::class, 'index']);
        Route::post('/me/saved-listings/{listing:uuid}', [SavedListingController::class, 'store']);
        Route::delete('/me/saved-listings/{listing:uuid}', [SavedListingController::class, 'destroy']);
        Route::get('/me/saved-listings', [SavedListingController::class, 'index']);
        Route::post('/me/saved-searches', [SavedSearchController::class, 'store']);
        Route::get('/me/saved-searches', [SavedSearchController::class, 'index']);
        Route::delete('/me/saved-searches/{id}', [SavedSearchController::class, 'destroy']);
    });
    
    // Landlord routes (auth:sanctum, role:landlord)
    Route::middleware(['auth:sanctum', 'role:landlord'])->group(function () {
        Route::get('/me/listings', [ListingOwnerController::class, 'index']);
        Route::post('/me/listings', [ListingOwnerController::class, 'store']);
        Route::put('/me/listings/{listing:uuid}', [ListingOwnerController::class, 'update'])->middleware('owns.listing');
        Route::delete('/me/listings/{listing:uuid}', [ListingOwnerController::class, 'destroy'])->middleware('owns.listing');
        
        // Media
        Route::post('/me/listings/{listing:uuid}/cover', [ListingMediaController::class, 'uploadCover'])->middleware('owns.listing');
        Route::post('/me/listings/{listing:uuid}/gallery', [ListingMediaController::class, 'uploadGallery'])->middleware('owns.listing');
        Route::delete('/me/listings/{listing:uuid}/gallery/{mediaId}', [ListingMediaController::class, 'deleteGallery'])->middleware('owns.listing');
        
        // Enquiries received
        Route::get('/me/enquiries', [LandlordEnquiryController::class, 'index']);
        
        // Boosts
        Route::get('/me/boosts', [BoostController::class, 'index']);
        Route::post('/me/boosts', [BoostController::class, 'store']);
    });
    
    // Verification (auth:sanctum)
    Route::middleware(['auth:sanctum'])->group(function () {
        Route::post('/me/verification/docs', [VerificationController::class, 'storeDocs']);
        Route::get('/me/verification', [VerificationController::class, 'show']);
    });
    
    // Admin routes (auth:sanctum, role:admin)
    Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
        Route::get('/admin/listings', [AdminListingModerationController::class, 'index']);
        Route::post('/admin/listings/{listing:uuid}/approve', [AdminListingModerationController::class, 'approve']);
        Route::post('/admin/listings/{listing:uuid}/reject', [AdminListingModerationController::class, 'reject']);
    });
    
    // Webhooks
    Route::post('/webhooks/payments/{provider}', [WebhookPaymentsController::class, 'handle']);
});
