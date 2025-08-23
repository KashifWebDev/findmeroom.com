<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class HealthController extends Controller
{
    use ApiResponse;

    public function __invoke(Request $request)
    {
        return $this->ok([
            'app' => config('app.name'),
            'version' => app()->version(),
            'time' => now()->toISOString(),
        ]);
    }
}
