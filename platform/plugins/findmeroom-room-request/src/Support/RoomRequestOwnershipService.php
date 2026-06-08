<?php

namespace FindMeRoom\RoomRequest\Support;

use Botble\RealEstate\Models\Account;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use Illuminate\Support\Str;

class RoomRequestOwnershipService
{
    public function attachByEmail(Account $account): int
    {
        if (! filled($account->email)) {
            return 0;
        }

        $email = mb_strtolower(trim($account->email));

        return RoomRequest::query()
            ->whereNull('account_id')
            ->whereRaw('LOWER(email) = ?', [$email])
            ->update(['account_id' => $account->getKey()]);
    }

    public function generateManageToken(): string
    {
        return Str::random(64);
    }

    public function ensureManageToken(RoomRequest $request): RoomRequest
    {
        if ($request->account_id || filled($request->manage_token)) {
            return $request;
        }

        $request->manage_token = $this->generateManageToken();
        $request->save();

        return $request;
    }

    public function manageUrl(RoomRequest $request): ?string
    {
        if (! $request->manage_token) {
            return null;
        }

        return route('public.room-request.manage', ['token' => $request->manage_token]);
    }
}
