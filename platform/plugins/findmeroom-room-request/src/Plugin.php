<?php

namespace FindMeRoom\RoomRequest;

use Botble\PluginManagement\Abstracts\PluginOperationAbstract;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('room_request_responses');
        Schema::dropIfExists('room_requests');
    }
}
