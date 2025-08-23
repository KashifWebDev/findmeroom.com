<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Amenity>
 */
class AmenityFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $amenities = [
            ['key' => 'wifi', 'label' => 'WiFi', 'category' => 'internet', 'sort_order' => 1],
            ['key' => 'furnished', 'label' => 'Furnished', 'category' => 'furniture', 'sort_order' => 2],
            ['key' => 'ac', 'label' => 'Air Conditioning', 'category' => 'climate', 'sort_order' => 3],
            ['key' => 'heater', 'label' => 'Heater', 'category' => 'climate', 'sort_order' => 4],
            ['key' => 'ensuite', 'label' => 'Ensuite Bathroom', 'category' => 'bathroom', 'sort_order' => 5],
            ['key' => 'parking', 'label' => 'Parking', 'category' => 'transport', 'sort_order' => 6],
            ['key' => 'generator', 'label' => 'Generator', 'category' => 'power', 'sort_order' => 7],
            ['key' => 'inverter', 'label' => 'Inverter', 'category' => 'power', 'sort_order' => 8],
            ['key' => 'security', 'label' => 'Security Guard', 'category' => 'security', 'sort_order' => 9],
            ['key' => 'cctv', 'label' => 'CCTV', 'category' => 'security', 'sort_order' => 10],
            ['key' => 'laundry', 'label' => 'Laundry', 'category' => 'utilities', 'sort_order' => 11],
        ];

        $amenity = $this->faker->randomElement($amenities);
        
        return [
            'key' => $amenity['key'],
            'label' => $amenity['label'],
            'category' => $amenity['category'],
            'sort_order' => $amenity['sort_order'],
        ];
    }
}
