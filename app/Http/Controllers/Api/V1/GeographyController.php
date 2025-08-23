<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Area;
use App\Models\City;
use App\Models\Campus;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class GeographyController extends Controller
{
    use ApiResponse;

    public function cities(Request $request)
    {
        $query = City::query();
        
        if ($request->has('region_id')) {
            $query->where('region_id', $request->region_id);
        }
        
        $cities = $query->select('id', 'name', 'region_id')->get();
        
        return $this->ok($cities);
    }

    public function areas(Request $request)
    {
        $request->validate([
            'city_id' => 'required|exists:cities,id',
        ]);
        
        $areas = Area::where('city_id', $request->city_id)
            ->select('id', 'name', 'city_id')
            ->get();
        
        return $this->ok($areas);
    }

    public function campuses(Request $request)
    {
        $query = Campus::query();
        
        if ($request->has('city_id')) {
            $query->where('city_id', $request->city_id);
        }
        
        $campuses = $query->select('id', 'name', 'city_id')->get();
        
        return $this->ok($campuses);
    }
}
