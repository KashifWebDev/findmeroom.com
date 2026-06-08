<?php

namespace FindMeRoom\RoomRequest\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\RealEstate\Models\Account;
use FindMeRoom\RoomRequest\Enums\RoomRequestResponseStatusEnum;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use FindMeRoom\RoomRequest\Support\RoomRequestOwnershipService;

class AccountRoomRequestController extends BaseController
{
    public function index(RoomRequestOwnershipService $ownershipService)
    {
        /** @var Account $account */
        $account = auth('account')->user();

        $ownershipService->attachByEmail($account);

        $roomRequests = RoomRequest::query()
            ->ownedByAccount($account)
            ->with(['city', 'state', 'country'])
            ->withCount([
                'responses as visible_responses_count' => function ($query): void {
                    $query
                        ->visibleToTenant()
                        ->where('status', RoomRequestResponseStatusEnum::VISIBLE);
                },
            ])
            ->latest('created_at')
            ->paginate(12);

        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.account.menu'));

        return view('plugins/findmeroom-room-request::account.index', compact('roomRequests'));
    }

    public function show(RoomRequest $roomRequest, RoomRequestOwnershipService $ownershipService)
    {
        /** @var Account $account */
        $account = auth('account')->user();

        $ownershipService->attachByEmail($account);

        abort_unless((int) $roomRequest->account_id === (int) $account->getKey(), 404);

        $roomRequest->load(['city', 'state', 'country']);

        $responses = $roomRequest->responses()
            ->visibleToTenant()
            ->where('status', RoomRequestResponseStatusEnum::VISIBLE)
            ->latest()
            ->get();

        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.account.detail_title', [
            'name' => $roomRequest->public_name,
        ]));

        return view('plugins/findmeroom-room-request::account.show', compact('roomRequest', 'responses'));
    }
}
