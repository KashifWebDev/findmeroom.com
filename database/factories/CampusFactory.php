<?php

namespace Database\Factories;

use App\Models\City;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Campus>
 */
class CampusFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->randomElement([
            'LUMS', 'FAST', 'COMSATS', 'UET', 'Punjab University',
            'Karachi University', 'NED', 'IBA', 'KU', 'SZABIST',
            'Quaid-i-Azam University', 'COMSATS Islamabad', 'FAST Islamabad', 'NUST', 'Air University'
        ]);
        
        return [
            'city_id' => City::factory(),
            'name' => $name,
            'slug' => Str::slug($name),
            'lat' => $this->faker->latitude(30, 35),
            'lng' => $this->faker->longitude(70, 75),
        ];
    }
}
