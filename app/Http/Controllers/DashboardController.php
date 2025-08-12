<?php

namespace App\Http\Controllers;

use App\Models\Listing;
use App\Models\Message;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function user(Request $request)
    {
        $user = $request->user();
        $listingCount = $user->listings()->count();
        $unreadMessages = Message::whereHas('conversation', function ($q) use ($user) {
            $q->where('host_id', $user->id)->orWhere('renter_id', $user->id);
        })->whereNull('read_at')->count();

        return Inertia::render('Account/Dashboard/Index', [
            'listingCount' => $listingCount,
            'unreadMessages' => $unreadMessages,
        ]);
    }

    public function admin()
    {
        return Inertia::render('Admin/Dashboard/Index', [
            'kpis' => [
                'activeListings' => Listing::count(),
                'users' => User::count(),
                'messages' => Message::count(),
            ],
        ]);
    }
}
