<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BoostPlan>
 */
class BoostPlanFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $plans = [
            ['name' => 'Basic Boost', 'days' => 7, 'price' => 500, 'priority' => 1],
            ['name' => 'Premium Boost', 'days' => 14, 'price' => 900, 'priority' => 2],
            ['name' => 'Super Boost', 'days' => 30, 'price' => 1500, 'priority' => 3],
        ];

        $plan = $this->faker->randomElement($plans);
        
        return [
            'name' => $plan['name'],
            'days' => $plan['days'],
            'price' => $plan['price'],
            'currency' => 'PKR',
            'priority' => $plan['priority'],
        ];
    }
}
