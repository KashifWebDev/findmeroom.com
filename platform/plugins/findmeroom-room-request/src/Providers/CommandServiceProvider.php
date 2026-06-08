<?php

namespace FindMeRoom\RoomRequest\Providers;

use Botble\Base\Supports\ServiceProvider;
use FindMeRoom\RoomRequest\Console\ExpireRoomRequestsCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ExpireRoomRequestsCommand::class,
        ]);
    }
}
