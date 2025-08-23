<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'phone_e164' => '+92' . fake()->numberBetween(3000000000, 3999999999),
            'password' => bcrypt('password'),
            'role' => fake()->randomElement(['admin', 'landlord', 'tenant', 'agent']),
            'status' => 'active',
            'last_login_at' => fake()->optional()->dateTimeBetween('-1 month', 'now'),
            'meta' => [],
        ];
    }

    /**
     * Indicate that the user is an admin.
     */
    public function admin(): static
    {
        return $this->state(fn (array $attributes) => [
            'role' => 'admin',
        ]);
    }

    /**
     * Indicate that the user is a landlord.
     */
    public function landlord(): static
    {
        return $this->state(fn (array $attributes) => [
            'role' => 'landlord',
        ]);
    }

    /**
     * Indicate that the user is a tenant.
     */
    public function tenant(): static
    {
        return $this->state(fn (array $attributes) => [
            'role' => 'tenant',
        ]);
    }
}
