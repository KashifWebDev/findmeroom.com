<?php

namespace Database\Factories;

use App\Models\Area;
use App\Models\Campus;
use App\Models\Landlord;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Listing>
 */
class ListingFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title = $this->faker->randomElement([
            'Cozy Room Near Campus',
            'Modern Apartment with Amenities',
            'Furnished Studio for Students',
            'Spacious Room with Ensuite',
            'Affordable Student Housing',
            'Premium Location Room',
            'Newly Renovated Apartment',
            'Quiet Neighborhood Room',
            'Campus View Apartment',
            'Budget-Friendly Student Room'
        ]);

        return [
            'landlord_id' => Landlord::factory(),
            'area_id' => Area::factory(),
            'campus_id' => $this->faker->optional(0.7)->randomElement([Campus::factory()]),
            'title' => $title,
            'slug' => Str::slug($title) . '-' . $this->faker->unique()->numberBetween(1000, 9999),
            'description' => $this->faker->paragraphs(3, true),
            'rent_monthly_paisa' => $this->faker->numberBetween(15000, 100000) * 100,
            'deposit_paisa' => $this->faker->optional(0.8)->numberBetween(10000, 50000) * 100,
            'bills_included' => $this->faker->boolean(0.3),
            'room_type' => $this->faker->randomElement(['private_room', 'shared_room', 'whole_place']),
            'gender_pref' => $this->faker->randomElement(['any', 'male_only', 'female_only']),
            'furnished' => $this->faker->boolean(0.6),
            'verified_level' => $this->faker->randomElement(['none', 'basic', 'verified']),
            'status' => $this->faker->randomElement(['draft', 'review', 'published', 'rejected', 'archived']),
            'lat' => $this->faker->optional(0.8)->latitude(30, 35),
            'lng' => $this->faker->optional(0.8)->longitude(70, 75),
            'address_line' => $this->faker->optional(0.7)->address(),
            'distance_to_campus_m' => $this->faker->optional(0.6)->numberBetween(100, 5000),
            'available_from' => $this->faker->optional(0.8)->dateTimeBetween('now', '+2 months'),
            'available_to' => $this->faker->optional(0.5)->dateTimeBetween('+3 months', '+1 year'),
            'views_count' => $this->faker->optional(0.7)->numberBetween(0, 1000),
            'favourites_count' => $this->faker->optional(0.7)->numberBetween(0, 100),
            'published_at' => $this->faker->optional(0.6)->dateTimeBetween('-1 month', 'now'),
        ];
    }

    /**
     * Indicate that the listing is published.
     */
    public function published(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'published',
            'published_at' => now(),
        ]);
    }
}
