<?php

return [
    [
        'name' => 'Room Requests',
        'flag' => 'room-requests.index',
        'parent_flag' => 'plugins.real-estate',
    ],
    [
        'name' => 'Edit',
        'flag' => 'room-requests.edit',
        'parent_flag' => 'room-requests.index',
    ],
    [
        'name' => 'Delete',
        'flag' => 'room-requests.destroy',
        'parent_flag' => 'room-requests.index',
    ],
];
