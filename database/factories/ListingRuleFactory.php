<?php

namespace Database\Factories;

use App\Models\Listing;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ListingRule>
 */
class ListingRuleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $rules = [
            'no_smoking' => true,
            'no_pets' => true,
            'no_parties' => true,
            'quiet_hours' => true,
            'no_guests' => false,
            'no_cooking' => false,
            'no_music' => false,
        ];

        $key = $this->faker->randomElement(array_keys($rules));
        
        return [
            'listing_id' => Listing::factory(),
            'key' => $key,
            'value' => $rules[$key],
        ];
    }
}
