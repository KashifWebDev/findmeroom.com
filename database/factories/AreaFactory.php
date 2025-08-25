<?php

namespace Database\Factories;

use App\Models\City;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Area>
 */
class AreaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->randomElement([
            'Gulberg', 'Defence', 'Model Town', 'Johar Town', 'Bahria Town',
            'Clifton', 'DHA', 'Karachi University', 'Gulshan-e-Iqbal', 'North Nazimabad',
            'Blue Area', 'F-7', 'F-8', 'E-7', 'E-8',
            'Satellite Town', 'Chaklala', 'Westridge', 'Bahria Town', 'DHA Phase 1',
            'DHA Phase 2', 'DHA Phase 3', 'DHA Phase 4', 'DHA Phase 5', 'DHA Phase 6'
        ]);
        
        return [
            'city_id' => City::factory(),
            'name' => $name . '_' . Str::random(4),
            'slug' => Str::slug($name . '_' . Str::random(4)),
        ];
    }
}
