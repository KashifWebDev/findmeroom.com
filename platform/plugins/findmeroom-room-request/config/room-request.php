<?php

return [
    'expiry_days' => (int) env('ROOM_REQUEST_EXPIRY_DAYS', 30),
    'rate_limit' => (int) env('ROOM_REQUEST_RATE_LIMIT', 30),
    'rate_limit_decay_minutes' => (int) env('ROOM_REQUEST_RATE_LIMIT_DECAY', 60),
    'owner_response_daily_limit' => (int) env('ROOM_REQUEST_OWNER_RESPONSE_DAILY_LIMIT', 10),
    'owner_response_per_request_daily_limit' => (int) env('ROOM_REQUEST_OWNER_RESPONSE_PER_REQUEST_DAILY_LIMIT', 3),
];
