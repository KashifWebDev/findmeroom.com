<?php

namespace FindMeRoom\RoomRequest\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\RealEstate\Models\Account;
use FindMeRoom\RoomRequest\Enums\RoomRequestResponseStatusEnum;
use FindMeRoom\RoomRequest\Http\Requests\ReportRoomRequestResponseRequest;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use FindMeRoom\RoomRequest\Models\RoomRequestResponse;
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
                    $query->forTenantDisplay();
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
            ->forTenantDisplay()
            ->latest()
            ->get();

        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.account.detail_title', [
            'name' => $roomRequest->public_name,
        ]));

        return view('plugins/findmeroom-room-request::account.show', compact('roomRequest', 'responses'));
    }

    public function markAsFound(RoomRequest $roomRequest, RoomRequestOwnershipService $ownershipService)
    {
        /** @var Account $account */
        $account = auth('account')->user();

        $ownershipService->attachByEmail($account);

        abort_unless((int) $roomRequest->account_id === (int) $account->getKey(), 404);
        abort_unless($roomRequest->canBeMarkedFound(), 404);

        $roomRequest->markAsFound();

        return redirect()
            ->route('public.account.room-requests.show', $roomRequest->getKey())
            ->with('mark_found_success', true);
    }

    public function reportResponse(
        RoomRequest $roomRequest,
        RoomRequestResponse $response,
        ReportRoomRequestResponseRequest $request,
        RoomRequestOwnershipService $ownershipService
    ) {
        /** @var Account $account */
        $account = auth('account')->user();

        $ownershipService->attachByEmail($account);

        abort_unless((int) $roomRequest->account_id === (int) $account->getKey(), 404);
        abort_unless((int) $response->room_request_id === (int) $roomRequest->getKey(), 404);
        abort_unless($response->status->getValue() === RoomRequestResponseStatusEnum::VISIBLE, 404);

        $response->report($request->input('report_reason'));

        return redirect()
            ->route('public.account.room-requests.show', $roomRequest->getKey())
            ->with('report_response_success', true);
    }
}
