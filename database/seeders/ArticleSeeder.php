<?php

namespace Database\Seeders;

use App\Models\Article;
use App\Models\User;
use Illuminate\Database\Seeder;

class ArticleSeeder extends Seeder
{
    public function run(): void
    {
        $authors = User::inRandomOrder()->take(5)->get();

        foreach (range(1, 12) as $i) {
            Article::factory()->for($authors->random())->create();
        }
    }
}
