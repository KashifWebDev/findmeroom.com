<?php

namespace App\Http\Controllers;

use App\Models\Listing;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ListingController extends Controller
{
    public function index(Request $request)
    {
        $query = Listing::query()->with('user');

        if ($search = $request->input('q')) {
            $query->whereFullText(['title', 'description'], $search);
        }
        if ($city = $request->input('city')) {
            $query->where('city', $city);
        }
        if ($type = $request->input('type')) {
            $query->where('type', $type);
        }
        if ($currency = $request->input('currency')) {
            $query->where('currency', $currency);
        }
        if ($min = $request->input('min_price')) {
            $query->where('price_minor', '>=', $min);
        }
        if ($max = $request->input('max_price')) {
            $query->where('price_minor', '<=', $max);
        }

        $items = $query->paginate(12)->withQueryString();

        return Inertia::render('Listings/Index/Index', [
            'items' => $items->items(),
            'filters' => $request->all(),
            'pagination' => [
                'total' => $items->total(),
                'per_page' => $items->perPage(),
                'current_page' => $items->currentPage(),
                'last_page' => $items->lastPage(),
            ],
        ]);
    }

    public function show(Listing $listing)
    {
        $listing->load('photos', 'user');
        $similar = Listing::where('id', '!=', $listing->id)
            ->where(function ($q) use ($listing) {
                $q->where('city', $listing->city)
                  ->orWhere('type', $listing->type);
            })
            ->take(6)
            ->get();

        return Inertia::render('Listings/Show/Index', [
            'listing' => $listing,
            'similar' => $similar,
        ]);
    }

    public function create()
    {
        return Inertia::render('Listings/Create/Index');
    }

    public function edit(Listing $listing)
    {
        return Inertia::render('Listings/Edit/Index', [
            'listing' => $listing,
        ]);
    }
}
