<?php

namespace App\Providers;

use App\Models\Article;
use App\Models\Listing;
use App\Observers\ArticleObserver;
use App\Observers\ListingObserver;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [];

    public function boot(): void
    {
        Listing::observe(ListingObserver::class);
        Article::observe(ArticleObserver::class);
    }
}
