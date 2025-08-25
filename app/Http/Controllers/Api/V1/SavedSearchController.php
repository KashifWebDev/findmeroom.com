<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\V1\SavedSearchStoreRequest;
use App\Models\SavedSearch;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class SavedSearchController extends Controller
{
    use ApiResponse;

    public function store(SavedSearchStoreRequest $request)
    {
        $data = $request->validated();
        
        $filters = $data['filters'] ?? [];
        
        $savedSearch = SavedSearch::create([
            'user_id' => auth()->id(),
            'name' => $data['name'],
            'city_id' => $data['city_id'] ?? $filters['city_id'] ?? null,
            'area_id' => $data['area_id'] ?? $filters['area_id'] ?? null,
            'campus_id' => $data['campus_id'] ?? $filters['campus_id'] ?? null,
            'filters' => $filters,
            'notify_channel' => 'email',
        ]);
        
        return $this->created($savedSearch);
    }

    public function index()
    {
        $savedSearches = SavedSearch::where('user_id', auth()->id())
            ->orderBy('created_at', 'desc')
            ->paginate(20);
        
        return $this->paginated($savedSearches, $savedSearches->items());
    }

    public function destroy(int $id)
    {
        $savedSearch = SavedSearch::where('user_id', auth()->id())
            ->where('id', $id)
            ->firstOrFail();
        
        $savedSearch->delete();
        
        return response()->noContent();
    }
}
