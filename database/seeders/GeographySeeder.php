<?php

namespace Database\Seeders;

use App\Models\Area;
use App\Models\City;
use App\Models\Country;
use App\Models\Region;
use Illuminate\Database\Seeder;

class GeographySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create Pakistan
        $pakistan = Country::create([
            'code' => 'PK',
            'name' => 'Pakistan',
        ]);

        // Create regions
        $regions = [
            'Punjab' => [
                'Lahore' => [
                    'Gulberg', 'Defence', 'Model Town', 'Johar Town', 'Bahria Town',
                    'DHA Phase 1', 'DHA Phase 2', 'DHA Phase 3', 'DHA Phase 4', 'DHA Phase 5'
                ],
                'Faisalabad' => [
                    'Satellite Town', 'D Ground', 'Jinnah Colony', 'Madina Town', 'Peoples Colony',
                    'Gulistan Colony', 'Lyallpur Town', 'Model Town', 'Civil Lines', 'Railway Colony'
                ]
            ],
            'Sindh' => [
                'Karachi' => [
                    'Clifton', 'DHA', 'Karachi University', 'Gulshan-e-Iqbal', 'North Nazimabad',
                    'Gulistan-e-Jauhar', 'Malir', 'Korangi', 'Landhi', 'Bin Qasim'
                ]
            ],
            'Khyber Pakhtunkhwa' => [
                'Peshawar' => [
                    'University Town', 'Hayatabad', 'Gulbahar', 'Warsak Road', 'Charsadda Road',
                    'Ring Road', 'Kohat Road', 'Jamrud Road', 'Bara Road', 'Khyber Road'
                ]
            ],
            'Balochistan' => [
                'Quetta' => [
                    'Jinnah Town', 'Samungli', 'Kuchlak', 'Hanna Valley', 'Urak',
                    'Brewery Road', 'Sariab Road', 'Spinny Road', 'Airport Road', 'Sabzal Road'
                ]
            ],
            'Islamabad Capital Territory' => [
                'Islamabad' => [
                    'Blue Area', 'F-7', 'F-8', 'E-7', 'E-8',
                    'G-7', 'G-8', 'H-8', 'H-9', 'I-8'
                ],
                'Rawalpindi' => [
                    'Satellite Town', 'Chaklala', 'Westridge', 'Bahria Town', 'DHA Phase 1',
                    'DHA Phase 2', 'DHA Phase 3', 'DHA Phase 4', 'DHA Phase 5', 'DHA Phase 6'
                ]
            ]
        ];

        foreach ($regions as $regionName => $cities) {
            $region = Region::create([
                'country_id' => $pakistan->id,
                'name' => $regionName,
            ]);

            foreach ($cities as $cityName => $areas) {
                $city = City::create([
                    'region_id' => $region->id,
                    'name' => $cityName,
                    'slug' => strtolower(str_replace(' ', '-', $cityName)),
                ]);

                foreach ($areas as $areaName) {
                    Area::create([
                        'city_id' => $city->id,
                        'name' => $areaName,
                        'slug' => strtolower(str_replace(' ', '-', $areaName)),
                    ]);
                }
            }
        }

        // Create campuses
        $campusData = [
            'Lahore' => [
                ['name' => 'LUMS', 'lat' => 31.4707, 'lng' => 74.4081],
                ['name' => 'FAST', 'lat' => 31.5204, 'lng' => 74.3587],
                ['name' => 'COMSATS', 'lat' => 31.5204, 'lng' => 74.3587],
            ],
            'Karachi' => [
                ['name' => 'Karachi University', 'lat' => 24.9285, 'lng' => 67.1156],
                ['name' => 'NED', 'lat' => 24.9285, 'lng' => 67.1156],
                ['name' => 'IBA', 'lat' => 24.9285, 'lng' => 67.1156],
            ],
            'Islamabad' => [
                ['name' => 'Quaid-i-Azam University', 'lat' => 33.7294, 'lng' => 73.0931],
                ['name' => 'COMSATS Islamabad', 'lat' => 33.7294, 'lng' => 73.0931],
                ['name' => 'FAST Islamabad', 'lat' => 33.7294, 'lng' => 73.0931],
            ],
            'Rawalpindi' => [
                ['name' => 'NUST', 'lat' => 33.7294, 'lng' => 73.0931],
                ['name' => 'Air University', 'lat' => 33.7294, 'lng' => 73.0931],
            ]
        ];

        foreach ($campusData as $cityName => $campuses) {
            $city = City::where('name', $cityName)->first();
            if ($city) {
                foreach ($campuses as $campus) {
                    $city->campuses()->create([
                        'name' => $campus['name'],
                        'slug' => strtolower(str_replace(' ', '-', $campus['name'])),
                        'lat' => $campus['lat'],
                        'lng' => $campus['lng'],
                    ]);
                }
            }
        }
    }
}
