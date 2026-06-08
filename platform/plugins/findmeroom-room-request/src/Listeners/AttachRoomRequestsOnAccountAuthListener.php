<?php

namespace FindMeRoom\RoomRequest\Listeners;

use Botble\RealEstate\Models\Account;
use FindMeRoom\RoomRequest\Support\RoomRequestOwnershipService;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Registered;

class AttachRoomRequestsOnAccountAuthListener
{
    public function __construct(
        protected RoomRequestOwnershipService $ownershipService
    ) {
    }

    public function handle(Login|Registered $event): void
    {
        if ($event instanceof Login && $event->guard !== 'account') {
            return;
        }

        $user = $event->user;

        if (! $user instanceof Account) {
            return;
        }

        $this->ownershipService->attachByEmail($user);
    }
}
