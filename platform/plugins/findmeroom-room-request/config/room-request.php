<?php

return [
    'expiry_days' => (int) env('ROOM_REQUEST_EXPIRY_DAYS', 30),
    'rate_limit' => (int) env('ROOM_REQUEST_RATE_LIMIT', 30),
    'rate_limit_decay_minutes' => (int) env('ROOM_REQUEST_RATE_LIMIT_DECAY', 60),
];
