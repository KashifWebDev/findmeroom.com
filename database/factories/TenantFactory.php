<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Tenant>
 */
class TenantFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory()->tenant(),
            'preferences' => [
                'max_rent' => $this->faker->numberBetween(15000, 100000),
                'room_type' => $this->faker->randomElement(['private_room', 'shared_room', 'whole_place']),
                'gender_pref' => $this->faker->randomElement(['any', 'male_only', 'female_only']),
                'furnished' => $this->faker->boolean(),
                'near_campus' => $this->faker->boolean(),
            ],
        ];
    }
}
