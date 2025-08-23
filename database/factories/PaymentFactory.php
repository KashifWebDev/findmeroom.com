<?php

namespace Database\Factories;

use App\Models\Order;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Payment>
 */
class PaymentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'paid_at' => $this->faker->dateTimeBetween('-1 month', 'now'),
            'amount_paisa' => $this->faker->numberBetween(50000, 2000000),
            'provider_fee_paisa' => $this->faker->numberBetween(1000, 10000),
            'receipt_url' => $this->faker->optional(0.8)->url(),
            'meta' => [
                'transaction_id' => $this->faker->uuid(),
                'payment_method' => $this->faker->randomElement(['card', 'bank_transfer', 'wallet']),
            ],
        ];
    }
}
