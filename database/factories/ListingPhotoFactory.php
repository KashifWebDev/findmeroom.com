<?php

namespace Database\Factories;

use App\Models\Listing;
use App\Models\ListingPhoto;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/** @extends Factory<ListingPhoto> */
class ListingPhotoFactory extends Factory
{
    protected $model = ListingPhoto::class;

    public function definition(): array
    {
        $seed = Str::random(8);

        return [
            'listing_id' => Listing::factory(),
            'url' => "https://picsum.photos/seed/{$seed}/800/600",
            'position' => 0,
        ];
    }
}
