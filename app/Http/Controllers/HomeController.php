<?php

namespace App\Http\Controllers;

use App\Models\Article;
use App\Models\Listing;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function index()
    {
        $featuredListings = Listing::latest()->take(6)->get();
        $trendingCities = Listing::select('city', \DB::raw('count(*) as count'))
            ->groupBy('city')
            ->orderByDesc('count')
            ->take(6)
            ->get();
        $articles = Article::latest()->take(3)->get();

        return Inertia::render('Home/Index', [
            'featuredListings' => $featuredListings,
            'trendingCities' => $trendingCities,
            'articles' => $articles,
        ]);
    }
}
