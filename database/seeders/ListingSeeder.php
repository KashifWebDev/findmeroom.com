<?php

namespace Database\Seeders;

use App\Models\Listing;
use App\Models\ListingPhoto;
use App\Models\User;
use Illuminate\Database\Seeder;

class ListingSeeder extends Seeder
{
    public function run(): void
    {
        $users = User::inRandomOrder()->take(25)->get();

        $users->each(function (User $user) {
            Listing::factory(rand(1, 3))
                ->for($user)
                ->has(ListingPhoto::factory()->count(rand(3, 5)))
                ->create();
        });
    }
}
