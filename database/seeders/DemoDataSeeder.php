<?php

namespace Database\Seeders;

use App\Models\Amenity;
use App\Models\Area;
use App\Models\Boost;
use App\Models\BoostPlan;
use App\Models\Enquiry;
use App\Models\Landlord;
use App\Models\Listing;
use App\Models\ListingRule;
use App\Models\Order;
use App\Models\Payment;
use App\Models\Tenant;
use App\Models\User;
use Illuminate\Database\Seeder;

class DemoDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create one admin user
        $admin = User::factory()->admin()->create();

        // Create five landlords
        $landlords = Landlord::factory(5)->create();

        // Create twenty tenants
        $tenants = Tenant::factory(20)->create();

        // Get some areas and amenities for listings
        $areas = Area::all();
        $amenities = Amenity::all();
        $boostPlans = BoostPlan::all();

        // For each landlord create ten listings
        foreach ($landlords as $landlord) {
            for ($i = 0; $i < 10; $i++) {
                $listing = Listing::factory()->published()->create([
                    'landlord_id' => $landlord->user_id,
                    'area_id' => $areas->random()->id,
                ]);

                // Attach random amenities
                $randomAmenities = $amenities->random(rand(3, 8));
                $listing->amenities()->attach($randomAmenities);

                // Create a few rules
                $rules = ['no_smoking', 'no_pets', 'no_parties', 'quiet_hours'];
                foreach (array_rand(array_flip($rules), rand(2, 4)) as $rule) {
                    ListingRule::create([
                        'listing_id' => $listing->id,
                        'key' => $rule,
                        'value' => true,
                    ]);
                }

                // Add media (placeholder URLs)
                $listing->addMediaFromUrl('https://picsum.photos/800/600?random=' . $listing->id)
                    ->toMediaCollection('listing_cover');

                for ($j = 0; $j < rand(3, 6); $j++) {
                    $listing->addMediaFromUrl('https://picsum.photos/800/600?random=' . $listing->id . $j)
                        ->toMediaCollection('listing_gallery');
                }

                // Generate a few enquiries per listing
                Enquiry::factory(rand(1, 4))->create([
                    'listing_id' => $listing->id,
                    'tenant_id' => $tenants->random()->user_id,
                ]);

                // Create some boosts
                if (rand(0, 1)) {
                    $boostPlan = $boostPlans->random();
                    Boost::create([
                        'listing_id' => $listing->id,
                        'plan_id' => $boostPlan->id,
                        'starts_at' => now(),
                        'ends_at' => now()->addDays($boostPlan->days),
                        'status' => 'active',
                    ]);
                }
            }
        }

        // Create a couple of orders and payments for boosts
        for ($i = 0; $i < 5; $i++) {
            $order = Order::factory()->create([
                'purpose' => 'boost',
                'status' => 'paid',
            ]);

            Payment::factory()->create([
                'order_id' => $order->id,
            ]);
        }
    }
}
