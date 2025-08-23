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
            ['name' => 'Basic Boost', 'days' => 7, 'price' => 500, 'priority' => 1],
            ['name' => 'Premium Boost', 'days' => 14, 'price' => 900, 'priority' => 2],
            ['name' => 'Super Boost', 'days' => 30, 'price' => 1500, 'priority' => 3],
            ['name' => 'Mega Boost', 'days' => 60, 'price' => 2500, 'priority' => 4],
        ];

        foreach ($boostPlans as $plan) {
            BoostPlan::create($plan);
        }

        // Create subscription plans
        $subscriptionPlans = [
            ['name' => 'Basic Plan', 'price' => 5000, 'interval' => 'month', 'quota_listings' => 5, 'quota_boosts' => 2],
            ['name' => 'Pro Plan', 'price' => 10000, 'interval' => 'month', 'quota_listings' => 15, 'quota_boosts' => 5],
            ['name' => 'Enterprise Plan', 'price' => 20000, 'interval' => 'month', 'quota_listings' => 50, 'quota_boosts' => 15],
            ['name' => 'Annual Basic', 'price' => 50000, 'interval' => 'year', 'quota_listings' => 60, 'quota_boosts' => 24],
            ['name' => 'Annual Pro', 'price' => 100000, 'interval' => 'year', 'quota_listings' => 180, 'quota_boosts' => 60],
        ];

        foreach ($subscriptionPlans as $plan) {
            SubscriptionPlan::create($plan);
        }
    }
}
