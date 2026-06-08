<?php

use Botble\Base\Facades\AdminHelper;
use FindMeRoom\RoomRequest\Http\Controllers\RoomRequestController;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'FindMeRoom\RoomRequest\Http\Controllers'], function (): void {
    AdminHelper::registerRoutes(function (): void {
        Route::group(['prefix' => 'room-requests', 'as' => 'room-requests.'], function (): void {
            Route::resource('', RoomRequestController::class)
                ->except(['create', 'store', 'update'])
                ->parameters(['' => 'roomRequest']);

            Route::group(['permission' => 'room-requests.edit'], function (): void {
                Route::post('{roomRequest}/approve', [RoomRequestController::class, 'approve'])
                    ->name('approve')
                    ->wherePrimaryKey();
                Route::post('{roomRequest}/reject', [RoomRequestController::class, 'reject'])
                    ->name('reject')
                    ->wherePrimaryKey();
                Route::post('{roomRequest}/spam', [RoomRequestController::class, 'spam'])
                    ->name('spam')
                    ->wherePrimaryKey();
            });
        });
    });
});
