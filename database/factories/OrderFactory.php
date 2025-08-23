<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory(),
            'amount_paisa' => $this->faker->numberBetween(50000, 2000000),
            'currency' => 'PKR',
            'purpose' => $this->faker->randomElement(['boost', 'subscription']),
            'status' => $this->faker->randomElement(['pending', 'paid', 'failed', 'refunded']),
            'provider' => $this->faker->randomElement(['stripe', 'paypal', 'razorpay']),
            'provider_ref' => $this->faker->optional(0.7)->uuid(),
            'meta' => [
                'ip_address' => $this->faker->ipv4(),
                'user_agent' => $this->faker->userAgent(),
            ],
        ];
    }
}
