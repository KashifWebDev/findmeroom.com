<?php

namespace App\Http\Controllers;

use App\Models\Conversation;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ConversationController extends Controller
{
    public function index(Request $request)
    {
        $userId = $request->user()->id;
        $conversations = Conversation::with(['listing', 'host', 'renter'])
            ->where(function ($q) use ($userId) {
                $q->where('host_id', $userId)->orWhere('renter_id', $userId);
            })
            ->latest('last_message_at')
            ->get();

        return Inertia::render('Conversations/Index/Index', [
            'items' => $conversations,
        ]);
    }

    public function show($id)
    {
        $conversation = Conversation::with(['messages.sender', 'listing', 'host', 'renter'])
            ->findOrFail($id);

        return Inertia::render('Conversations/Show/Index', [
            'conversation' => $conversation,
            'messages' => $conversation->messages()->latest()->take(30)->get()->reverse()->values(),
        ]);
    }
}
