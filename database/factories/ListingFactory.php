<?php

namespace Database\Factories;

use App\Models\Listing;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends Factory<Listing>
 */
class ListingFactory extends Factory
{
    protected $model = Listing::class;

    public function definition(): array
    {
        $title = fake()->sentence(3);
        $city = fake()->randomElement(['London','New York','Berlin','Paris','Toronto','Sydney','Dubai','Singapore','Mumbai','Sao Paulo']);
        $type = fake()->randomElement(['private_room','shared_room','hostel','sublet','student','emergency']);
        $currency = fake()->randomElement(['USD','EUR','GBP','INR','AUD','SGD']);

        return [
            'user_id' => User::factory(),
            'title' => $title,
            'slug' => Str::slug($title).'-'.Str::random(5),
            'description' => fake()->paragraph(),
            'city' => $city,
            'country' => fake()->country(),
            'lat' => fake()->latitude(),
            'lng' => fake()->longitude(),
            'type' => $type,
            'price_minor' => fake()->numberBetween(10000, 100000),
            'currency' => $currency,
            'available_from' => now()->addDays(rand(1, 30)),
            'image_url' => 'https://picsum.photos/seed/'.Str::slug($title).'/800/600',
            'status' => 'published',
        ];
    }
}
