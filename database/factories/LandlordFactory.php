<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Landlord>
 */
class LandlordFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory()->landlord(),
            'company_name' => $this->faker->optional(0.7)->company(),
            'contact_name' => $this->faker->optional(0.8)->name(),
            'response_time_minutes' => $this->faker->optional(0.6)->numberBetween(1, 1440),
            'rating_avg' => $this->faker->randomFloat(2, 1, 5),
            'rating_count' => $this->faker->numberBetween(0, 100),
        ];
    }
}
