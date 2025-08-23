<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Listing;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class ListingMediaController extends Controller
{
    use ApiResponse;

    public function uploadCover(Request $request, Listing $listing)
    {
        $request->validate([
            'cover' => 'required|image|mimes:jpeg,png,webp|max:5120',
        ]);
        
        // Remove existing cover
        $listing->clearMediaCollection('listing_cover');
        
        // Add new cover
        $media = $listing->addMediaFromRequest('cover')
            ->toMediaCollection('listing_cover', 'public');
        
        return $this->ok([
            'cover_url' => $media->getUrl(),
        ]);
    }

    public function uploadGallery(Request $request, Listing $listing)
    {
        $request->validate([
            'photos.*' => 'required|image|mimes:jpeg,png,webp|max:8192',
        ], [
            'photos.*.max' => 'Each photo must be less than 8MB.',
        ]);
        
        $photos = $request->file('photos');
        
        if (count($photos) > 10) {
            return $this->fail('VALIDATION_ERROR', 'Maximum 10 photos allowed per request', null, 422);
        }
        
        $mediaItems = [];
        
        foreach ($photos as $photo) {
            $media = $listing->addMedia($photo)
                ->toMediaCollection('listing_gallery', 'public');
            
            $mediaItems[] = [
                'id' => $media->id,
                'url' => $media->getUrl(),
            ];
        }
        
        return $this->ok($mediaItems);
    }

    public function deleteGallery(Listing $listing, int $mediaId)
    {
        $media = $listing->getMedia('listing_gallery')
            ->where('id', $mediaId)
            ->first();
        
        if (!$media) {
            return $this->fail('NOT_FOUND', 'Media not found', null, 404);
        }
        
        $media->delete();
        
        return $this->ok(['message' => 'Media deleted successfully']);
    }
}
