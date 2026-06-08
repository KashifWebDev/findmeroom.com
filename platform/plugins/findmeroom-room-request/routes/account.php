<?php

use Botble\RealEstate\Http\Middleware\EnsureAccountIsApproved;
use Botble\RealEstate\Http\Middleware\LocaleMiddleware;
use FindMeRoom\RoomRequest\Http\Controllers\AccountRoomRequestController;
use Illuminate\Support\Facades\Route;

if (defined('THEME_MODULE_SCREEN_NAME')) {
    Route::group([
        'middleware' => ['web', 'core', 'account', EnsureAccountIsApproved::class, 'account.not_blocked', LocaleMiddleware::class],
    ], function (): void {
        Route::prefix('account')->name('public.account.')->group(function (): void {
            Route::get('room-requests', [AccountRoomRequestController::class, 'index'])
                ->name('room-requests.index');

            Route::get('room-requests/{roomRequest}', [AccountRoomRequestController::class, 'show'])
                ->name('room-requests.show')
                ->wherePrimaryKey();
        });
    });
}
