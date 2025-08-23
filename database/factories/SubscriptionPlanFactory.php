<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SubscriptionPlan>
 */
class SubscriptionPlanFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $plans = [
            ['name' => 'Basic Plan', 'price' => 5000, 'interval' => 'month', 'quota_listings' => 5, 'quota_boosts' => 2],
            ['name' => 'Pro Plan', 'price' => 10000, 'interval' => 'month', 'quota_listings' => 15, 'quota_boosts' => 5],
            ['name' => 'Enterprise Plan', 'price' => 20000, 'interval' => 'month', 'quota_listings' => 50, 'quota_boosts' => 15],
            ['name' => 'Annual Basic', 'price' => 50000, 'interval' => 'year', 'quota_listings' => 60, 'quota_boosts' => 24],
        ];

        $plan = $this->faker->randomElement($plans);
        
        return [
            'name' => $plan['name'],
            'price' => $plan['price'],
            'currency' => 'PKR',
            'interval' => $plan['interval'],
            'quota_listings' => $plan['quota_listings'],
            'quota_boosts' => $plan['quota_boosts'],
        ];
    }
}
