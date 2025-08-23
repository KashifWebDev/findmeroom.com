<?php

namespace Database\Factories;

use App\Models\Region;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\City>
 */
class CityFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->randomElement(['Lahore', 'Karachi', 'Islamabad', 'Rawalpindi', 'Faisalabad']);
        
        return [
            'region_id' => Region::factory(),
            'name' => $name,
            'slug' => Str::slug($name),
        ];
    }
}
