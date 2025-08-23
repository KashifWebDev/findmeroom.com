<?php

namespace Database\Factories;

use App\Models\Listing;
use App\Models\Tenant;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Enquiry>
 */
class EnquiryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'listing_id' => Listing::factory(),
            'tenant_id' => $this->faker->optional(0.7)->randomElement([Tenant::factory()]),
            'message' => $this->faker->paragraphs(2, true),
            'contact_phone' => $this->faker->optional(0.8)->phoneNumber(),
            'contact_email' => $this->faker->optional(0.8)->safeEmail(),
            'status' => $this->faker->randomElement(['new', 'responded', 'closed', 'spam']),
            'responded_at' => $this->faker->optional(0.3)->dateTimeBetween('-1 month', 'now'),
        ];
    }
}
