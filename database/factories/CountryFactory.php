<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Country>
 */
class CountryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // Generate unique 2-character country codes
        do {
            $code = chr(65 + mt_rand(0, 25)) . chr(65 + mt_rand(0, 25));
        } while (\App\Models\Country::where('code', $code)->exists());
        
        return [
            'code' => $code,
            'name' => $this->faker->country,
        ];
    }
}
