<?php

use Botble\Base\Facades\AdminHelper;
use FindMeRoom\RoomRequest\Http\Controllers\RoomRequestController;
use FindMeRoom\RoomRequest\Http\Controllers\RoomRequestResponseController;
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

        Route::group(['prefix' => 'room-request-responses', 'as' => 'room-request-responses.'], function (): void {
            Route::match(['GET', 'POST'], '', [RoomRequestResponseController::class, 'index'])
                ->name('index');

            Route::group(['permission' => 'room-request-responses.edit'], function (): void {
                Route::get('edit/{roomRequestResponse}', [RoomRequestResponseController::class, 'edit'])
                    ->name('edit')
                    ->wherePrimaryKey();

                Route::post('{roomRequestResponse}/visible', [RoomRequestResponseController::class, 'markVisible'])
                    ->name('visible')
                    ->wherePrimaryKey();

                Route::post('{roomRequestResponse}/reject', [RoomRequestResponseController::class, 'reject'])
                    ->name('reject')
                    ->wherePrimaryKey();

                Route::post('{roomRequestResponse}/spam', [RoomRequestResponseController::class, 'spam'])
                    ->name('spam')
                    ->wherePrimaryKey();
            });
        });
    });
});
