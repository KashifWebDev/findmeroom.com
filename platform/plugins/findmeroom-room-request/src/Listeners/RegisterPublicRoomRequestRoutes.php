<?php

namespace FindMeRoom\RoomRequest\Listeners;

use Botble\Theme\Events\ThemeRoutingBeforeEvent;
use FindMeRoom\RoomRequest\Http\Controllers\PublicRoomRequestController;
use Illuminate\Support\Facades\Route;

class RegisterPublicRoomRequestRoutes
{
    public function handle(ThemeRoutingBeforeEvent $event): void
    {
        $rateLimit = (int) config('plugins.findmeroom-room-request.room-request.rate_limit', 5);
        $rateDecay = (int) config('plugins.findmeroom-room-request.room-request.rate_limit_decay_minutes', 60);

        Route::get('post-room-need/success', [PublicRoomRequestController::class, 'success'])
            ->name('public.room-request.success');

        Route::get('post-room-need', [PublicRoomRequestController::class, 'create'])
            ->name('public.room-request.create');

        Route::post('post-room-need', [PublicRoomRequestController::class, 'store'])
            ->middleware('throttle:' . $rateLimit . ',' . $rateDecay)
            ->name('public.room-request.store');

        Route::get('my-room-request/{token}', [PublicRoomRequestController::class, 'manage'])
            ->where('token', '[A-Za-z0-9]{64}')
            ->name('public.room-request.manage');

        Route::get('room-requests', [PublicRoomRequestController::class, 'index'])
            ->name('public.room-request.index');

        Route::get('room-requests/{slug}', [PublicRoomRequestController::class, 'show'])
            ->where('slug', '[a-zA-Z0-9\-]+')
            ->name('public.room-request.show');
    }
}
