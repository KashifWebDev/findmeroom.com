<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::factory()->create([
            'name' => 'Admin',
            'email' => 'admin@findmeroom.com',
            'password' => 'password',
            'is_admin' => true,
        ]);

        User::factory(30)->create();
    }
}
