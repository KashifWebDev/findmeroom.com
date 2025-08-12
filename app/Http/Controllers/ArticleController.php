<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ArticleController extends Controller
{
    public function index(Request $request)
    {
        $query = Article::query()->whereNotNull('published_at');
        if ($category = $request->input('category')) {
            $query->where('category', $category);
        }
        $items = $query->latest()->paginate(12)->withQueryString();

        return Inertia::render('Articles/Index/Index', [
            'items' => $items->items(),
            'pagination' => [
                'total' => $items->total(),
                'per_page' => $items->perPage(),
                'current_page' => $items->currentPage(),
                'last_page' => $items->lastPage(),
            ],
        ]);
    }

    public function show($slug)
    {
        $article = Article::where('slug', $slug)->firstOrFail();

        return Inertia::render('Articles/Show/Index', [
            'article' => $article,
        ]);
    }

    public function adminIndex()
    {
        $items = Article::latest()->paginate(12);

        return Inertia::render('Articles/Admin/Index/Index', [
            'items' => $items,
        ]);
    }

    public function create()
    {
        return Inertia::render('Articles/Admin/Create/Index');
    }

    public function edit(Article $article)
    {
        return Inertia::render('Articles/Admin/Edit/Index', [
            'article' => $article,
        ]);
    }
}
