<?php

namespace Tests\Support;

use App\Models\Country;
use App\Models\Region;
use App\Models\City;
use App\Models\Area;
use App\Models\Campus;
use Illuminate\Support\Str;

class GeographyFactory
{
    public static function createCountry(string $name = 'Pakistan'): Country
    {
        // Generate 2-character codes to fit the database constraint
        $randomCode = chr(65 + rand(0, 25)) . chr(65 + rand(0, 25)); // AA-ZZ
        
        return Country::create([
            'name' => $name . '_' . Str::random(4),
            'code' => $randomCode,
            'uuid' => Str::uuid(),
        ]);
    }
    
    public static function createRegion(string $name = 'Punjab', Country $country = null): Region
    {
        if (!$country) {
            $country = self::createCountry();
        }
        
        return Region::create([
            'name' => $name . '_' . Str::random(4),
            'country_id' => $country->id,
            'uuid' => Str::uuid(),
        ]);
    }
    
    public static function createCity(string $name = 'Lahore', Region $region = null): City
    {
        if (!$region) {
            $region = self::createRegion();
        }
        
        return City::create([
            'name' => $name . '_' . Str::random(4),
            'region_id' => $region->id,
            'uuid' => Str::uuid(),
            'slug' => Str::slug($name . '_' . Str::random(4)),
        ]);
    }
    
    public static function createArea(string $name = 'Gulberg', City $city = null): Area
    {
        if (!$city) {
            $city = self::createCity();
        }
        
        return Area::create([
            'name' => $name . '_' . Str::random(4),
            'city_id' => $city->id,
            'uuid' => Str::uuid(),
            'slug' => Str::slug($name . '_' . Str::random(4)),
        ]);
    }
    
    public static function createCampus(string $name = 'LUMS', Area $area = null): Campus
    {
        if (!$area) {
            $area = self::createArea();
        }
        
        return Campus::create([
            'name' => $name . '_' . Str::random(4),
            'city_id' => $area->city_id,
            'uuid' => Str::uuid(),
            'slug' => Str::slug($name . '_' . Str::random(4)),
        ]);
    }
    
    public static function createFullGeography(): array
    {
        // Check if geography data already exists
        $existingCountry = Country::first();
        if ($existingCountry) {
            $existingRegion = Region::where('country_id', $existingCountry->id)->first();
            $existingCity = City::where('region_id', $existingRegion->id)->first();
            $existingArea = Area::where('city_id', $existingCity->id)->first();
            $existingCampus = Campus::where('city_id', $existingCity->id)->first();
            
            if ($existingRegion && $existingCity && $existingArea) {
                return [
                    'country' => $existingCountry,
                    'region' => $existingRegion,
                    'city' => $existingCity,
                    'area' => $existingArea,
                    'campus' => $existingCampus,
                ];
            }
        }
        
        // Create new geography data if none exists
        $country = self::createCountry();
        $region = self::createRegion(country: $country);
        $city = self::createCity(region: $region);
        $area = self::createArea(city: $city);
        $campus = self::createCampus(area: $area);
        
        return [
            'country' => $country,
            'region' => $region,
            'city' => $city,
            'area' => $area,
            'campus' => $campus,
        ];
    }
}
