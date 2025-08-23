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
            ['name' => 'Basic Plan', 'price_paisa' => 500000, 'interval' => 'month', 'quota_listings' => 5, 'quota_boosts' => 2],
            ['name' => 'Pro Plan', 'price_paisa' => 1000000, 'interval' => 'month', 'quota_listings' => 15, 'quota_boosts' => 5],
            ['name' => 'Enterprise Plan', 'price_paisa' => 2000000, 'interval' => 'month', 'quota_listings' => 50, 'quota_boosts' => 15],
            ['name' => 'Annual Basic', 'price_paisa' => 5000000, 'interval' => 'year', 'quota_listings' => 60, 'quota_boosts' => 24],
        ];

        $plan = $this->faker->randomElement($plans);
        
        return [
            'name' => $plan['name'],
            'price_paisa' => $plan['price_paisa'],
            'currency' => 'PKR',
            'interval' => $plan['interval'],
            'quota_listings' => $plan['quota_listings'],
            'quota_boosts' => $plan['quota_boosts'],
        ];
    }
}
