<?php

namespace Database\Seeders;

use App\Models\Amenity;
use Illuminate\Database\Seeder;

class AmenitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
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

        foreach ($amenities as $amenity) {
            Amenity::create($amenity);
        }
    }
}
