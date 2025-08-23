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
use Illuminate\Support\Str;

class DemoDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Check if demo data already exists
        if (User::where('email', 'admin@findmeroom.com')->exists()) {
            $this->command->info('Demo data already exists. Skipping...');
            return;
        }

        // Create one admin user
        $admin = User::firstOrCreate(
            ['email' => 'admin@findmeroom.com'],
            [
                'name' => 'Admin User',
                'phone_e164' => '+923001234567',
                'password' => bcrypt('password'),
                'role' => 'admin',
                'status' => 'active',
                'meta' => [],
            ]
        );

        // Create 5 landlord users
        $landlordUsers = [];
        for ($i = 1; $i <= 5; $i++) {
            $landlordUsers[] = User::create([
                'name' => "Landlord $i",
                'email' => "landlord$i@example.com",
                'phone_e164' => "+92300123456$i",
                'password' => bcrypt('password'),
                'role' => 'landlord',
                'status' => 'active',
                'meta' => [],
            ]);
        }

        // Create 10 tenant users
        $tenantUsers = [];
        for ($i = 1; $i <= 10; $i++) {
            $tenantUsers[] = User::create([
                'name' => "Tenant $i",
                'email' => "tenant$i@example.com",
                'phone_e164' => "+92301234567$i",
                'password' => bcrypt('password'),
                'role' => 'tenant',
                'status' => 'active',
                'meta' => [],
            ]);
        }

        // Create landlords
        $landlords = [];
        foreach ($landlordUsers as $user) {
            $landlords[] = Landlord::create([
                'user_id' => $user->id,
                'company_name' => fake()->company(),
                'contact_name' => $user->name,
                'response_time_minutes' => fake()->numberBetween(5, 120),
                'rating_avg' => fake()->randomFloat(2, 3.0, 5.0),
                'rating_count' => fake()->numberBetween(1, 50),
            ]);
        }

        // Create tenants
        $tenants = [];
        foreach ($tenantUsers as $user) {
            $tenants[] = Tenant::create([
                'user_id' => $user->id,
                'preferences' => [
                    'max_rent' => fake()->numberBetween(20000, 80000),
                    'room_type' => fake()->randomElement(['private_room', 'shared_room', 'whole_place']),
                    'gender_pref' => fake()->randomElement(['any', 'male_only', 'female_only']),
                    'furnished' => fake()->boolean(),
                    'near_campus' => fake()->boolean(),
                ],
            ]);
        }

        // Get existing data
        $areas = Area::all();
        $amenities = Amenity::all();
        $boostPlans = BoostPlan::all();

        if ($areas->isEmpty()) {
            $this->command->warn('No areas found. Make sure GeographySeeder has run first.');
            return;
        }

        // Create listings for each landlord
        $allListings = [];
        foreach ($landlords as $landlord) {
            for ($i = 1; $i <= 4; $i++) { // 4 listings per landlord = 20 total
                $title = fake()->randomElement([
                    'Cozy Room Near Campus',
                    'Modern Apartment',
                    'Furnished Studio',
                    'Spacious Room',
                    'Student Housing',
                    'Premium Location',
                    'Quiet Neighborhood',
                    'Budget-Friendly Room'
                ]);

                $listing = Listing::create([
                    'landlord_id' => $landlord->user_id,
                    'area_id' => $areas->random()->id,
                    'campus_id' => null,
                    'title' => $title . " #$i",
                    'slug' => Str::slug($title . " $i " . $landlord->user_id),
                    'description' => "A great place to stay for students and professionals. Located in a prime area with easy access to transportation and amenities.",
                    'rent_monthly_paisa' => fake()->numberBetween(25000, 75000) * 100,
                    'deposit_paisa' => fake()->numberBetween(15000, 40000) * 100,
                    'bills_included' => fake()->boolean(0.3),
                    'room_type' => fake()->randomElement(['private_room', 'shared_room', 'whole_place']),
                    'gender_pref' => fake()->randomElement(['any', 'male_only', 'female_only']),
                    'furnished' => fake()->boolean(0.6),
                    'verified_level' => fake()->randomElement(['none', 'basic', 'verified']),
                    'status' => 'published',
                    'lat' => fake()->latitude(31.4, 31.6), // Lahore area
                    'lng' => fake()->longitude(74.2, 74.4),
                    'address_line' => fake()->streetAddress(),
                    'distance_to_campus_m' => fake()->numberBetween(500, 3000),
                    'available_from' => now()->addDays(fake()->numberBetween(1, 30)),
                    'available_to' => now()->addMonths(fake()->numberBetween(6, 12)),
                    'views_count' => fake()->numberBetween(10, 500),
                    'favourites_count' => fake()->numberBetween(0, 50),
                    'published_at' => now()->subDays(fake()->numberBetween(1, 30)),
                ]);

                $allListings[] = $listing;

                // Attach 3-6 random amenities
                $randomAmenities = $amenities->random(fake()->numberBetween(3, 6));
                $listing->amenities()->attach($randomAmenities);

                // Create 2-3 listing rules
                $rules = [
                    ['key' => 'no_smoking', 'value' => true],
                    ['key' => 'no_pets', 'value' => fake()->boolean()],
                    ['key' => 'quiet_hours', 'value' => true],
                ];

                foreach ($rules as $rule) {
                    ListingRule::create([
                        'listing_id' => $listing->id,
                        'key' => $rule['key'],
                        'value' => $rule['value'],
                    ]);
                }

                // Create 1-2 enquiries per listing
                for ($j = 0; $j < fake()->numberBetween(1, 2); $j++) {
                    Enquiry::create([
                        'listing_id' => $listing->id,
                        'tenant_id' => fake()->randomElement($tenants)->user_id,
                        'message' => 'Hi, I am interested in this room. Can we schedule a viewing?',
                        'status' => fake()->randomElement(['new', 'responded', 'closed']),
                    ]);
                }
            }
        }

        // Create some boosts
        foreach (fake()->randomElements($allListings, 10) as $listing) {
            $boostPlan = $boostPlans->random();
            Boost::create([
                'listing_id' => $listing->id,
                'plan_id' => $boostPlan->id,
                'starts_at' => now(),
                'ends_at' => now()->addDays($boostPlan->days),
                'status' => 'active',
            ]);
        }

        // Create a few orders and payments
        for ($i = 1; $i <= 3; $i++) {
            $order = Order::create([
                'user_id' => fake()->randomElement($landlordUsers)->id,
                'purpose' => 'boost',
                'amount_paisa' => fake()->numberBetween(500, 2000) * 100,
                'currency' => 'PKR',
                'status' => 'paid',
                'provider' => 'stripe',
                'provider_ref' => 'pi_' . Str::random(24),
                'meta' => ['boost_plan' => 'premium'],
            ]);

            Payment::create([
                'order_id' => $order->id,
                'paid_at' => now(),
                'amount_paisa' => $order->amount_paisa,
                'provider_fee_paisa' => fake()->numberBetween(100, 500),
                'receipt_url' => 'https://example.com/receipt/' . Str::random(16),
                'meta' => ['transaction_id' => 'pi_' . Str::random(24)],
            ]);
        }

        $this->command->info("Created:");
        $this->command->info("- 1 admin user");
        $this->command->info("- 5 landlords with users");
        $this->command->info("- 10 tenants with users");
        $this->command->info("- 20 listings with amenities and rules");
        $this->command->info("- Enquiries, boosts, orders, and payments");
    }
}