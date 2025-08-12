<?php

namespace App\Observers;

use App\Models\Article;
use Illuminate\Support\Str;

class ArticleObserver
{
    public function creating(Article $article): void
    {
        if (empty($article->slug)) {
            $article->slug = Str::slug($article->title);
        }
    }
}
