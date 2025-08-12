<?php

namespace App\Observers;

use App\Models\Listing;
use Illuminate\Support\Str;

class ListingObserver
{
    public function creating(Listing $listing): void
    {
        if (empty($listing->slug)) {
            $listing->slug = Str::slug($listing->title);
        }
        if (empty($listing->status)) {
            $listing->status = 'published';
        }
    }

    public function deleting(Listing $listing): void
    {
        $listing->photos()->delete();
    }
}
