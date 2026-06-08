<?php

namespace FindMeRoom\RoomRequest\Support;

use FindMeRoom\RoomRequest\Models\RoomRequest;
use Illuminate\Support\Str;

class ShareSlugGenerator
{
    public static function generate(RoomRequest $roomRequest): string
    {
        do {
            $slug = 'rr-' . Str::lower(Str::random(12));
        } while (RoomRequest::query()->where('share_slug', $slug)->exists());

        return $slug;
    }
}
