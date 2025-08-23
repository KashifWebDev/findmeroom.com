<?php

namespace Database\Seeders;

use App\Models\BoostPlan;
use App\Models\SubscriptionPlan;
use Illuminate\Database\Seeder;

class PlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create boost plans
        $boostPlans = [
            ['name' => 'Basic Boost', 'days' => 7, 'price_paisa' => 50000, 'priority' => 1],
            ['name' => 'Premium Boost', 'days' => 14, 'price_paisa' => 90000, 'priority' => 2],
            ['name' => 'Super Boost', 'days' => 30, 'price_paisa' => 150000, 'priority' => 3],
            ['name' => 'Mega Boost', 'days' => 60, 'price_paisa' => 250000, 'priority' => 4],
        ];

        foreach ($boostPlans as $plan) {
            BoostPlan::create($plan);
        }

        // Create subscription plans
        $subscriptionPlans = [
            ['name' => 'Basic Plan', 'price_paisa' => 500000, 'interval' => 'month', 'quota_listings' => 5, 'quota_boosts' => 2],
            ['name' => 'Pro Plan', 'price_paisa' => 1000000, 'interval' => 'month', 'quota_listings' => 15, 'quota_boosts' => 5],
            ['name' => 'Enterprise Plan', 'price_paisa' => 2000000, 'interval' => 'month', 'quota_listings' => 50, 'quota_boosts' => 15],
            ['name' => 'Annual Basic', 'price_paisa' => 5000000, 'interval' => 'year', 'quota_listings' => 60, 'quota_boosts' => 24],
            ['name' => 'Annual Pro', 'price_paisa' => 10000000, 'interval' => 'year', 'quota_listings' => 180, 'quota_boosts' => 60],
        ];

        foreach ($subscriptionPlans as $plan) {
            SubscriptionPlan::create($plan);
        }
    }
}
