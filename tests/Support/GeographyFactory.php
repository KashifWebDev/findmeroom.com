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
    public static function createCountry(string $name = 'Pakistan', string $code = 'PK'): Country
    {
        return Country::create([
            'name' => $name,
            'code' => $code,
            'uuid' => Str::uuid(),
        ]);
    }
    
    public static function createRegion(string $name = 'Punjab', Country $country = null): Region
    {
        if (!$country) {
            $country = self::createCountry();
        }
        
        return Region::create([
            'name' => $name,
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
            'name' => $name,
            'region_id' => $region->id,
            'uuid' => Str::uuid(),
            'slug' => Str::slug($name),
        ]);
    }
    
    public static function createArea(string $name = 'Gulberg', City $city = null): Area
    {
        if (!$city) {
            $city = self::createCity();
        }
        
        return Area::create([
            'name' => $name,
            'city_id' => $city->id,
            'uuid' => Str::uuid(),
            'slug' => Str::slug($name),
        ]);
    }
    
    public static function createCampus(string $name = 'LUMS', Area $area = null): Campus
    {
        if (!$area) {
            $area = self::createArea();
        }
        
        return Campus::create([
            'name' => $name,
            'city_id' => $area->city_id,
            'uuid' => Str::uuid(),
            'slug' => Str::slug($name),
        ]);
    }
    
    public static function createFullGeography(): array
    {
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
