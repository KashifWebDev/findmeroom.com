<?php

namespace Database\Factories;

use App\Models\Article;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/** @extends Factory<Article> */
class ArticleFactory extends Factory
{
    protected $model = Article::class;

    public function definition(): array
    {
        $title = fake()->sentence(6);
        return [
            'user_id' => User::factory(),
            'title' => $title,
            'slug' => Str::slug($title).'-'.Str::random(5),
            'excerpt' => fake()->sentence(),
            'body' => fake()->paragraphs(3, true),
            'category' => fake()->randomElement(['Guides','City Tips','Co-living']),
            'image_url' => 'https://picsum.photos/seed/'.Str::slug($title).'/1200/600',
            'reading_time' => fake()->numberBetween(3, 10),
            'published_at' => now()->subDays(rand(1, 30)),
        ];
    }
}
