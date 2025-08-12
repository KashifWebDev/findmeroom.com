<?php

namespace Database\Factories;

use App\Models\Conversation;
use App\Models\Listing;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/** @extends Factory<Conversation> */
class ConversationFactory extends Factory
{
    protected $model = Conversation::class;

    public function definition(): array
    {
        return [
            'listing_id' => Listing::factory(),
            'host_id' => User::factory(),
            'renter_id' => User::factory(),
            'last_message_at' => now(),
            'unread_for_host' => 0,
            'unread_for_renter' => 0,
        ];
    }
}
