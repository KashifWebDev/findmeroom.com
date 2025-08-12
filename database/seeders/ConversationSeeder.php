<?php

namespace Database\Seeders;

use App\Models\Conversation;
use App\Models\Listing;
use App\Models\Message;
use App\Models\User;
use Illuminate\Database\Seeder;

class ConversationSeeder extends Seeder
{
    public function run(): void
    {
        $listings = Listing::inRandomOrder()->take(20)->get();

        foreach ($listings as $listing) {
            $host = $listing->user;
            $renter = User::where('id', '!=', $host->id)->inRandomOrder()->first();

            $conversation = Conversation::create([
                'listing_id' => $listing->id,
                'host_id' => $host->id,
                'renter_id' => $renter->id,
            ]);

            $messages = Message::factory()->count(rand(3, 8))->state(function () use ($host, $renter) {
                return [
                    'sender_id' => fake()->randomElement([$host->id, $renter->id]),
                ];
            })->for($conversation)->create();

            $conversation->update([
                'last_message_at' => $messages->last()->created_at,
                'unread_for_host' => rand(0, 5),
                'unread_for_renter' => rand(0, 5),
            ]);
        }
    }
}
