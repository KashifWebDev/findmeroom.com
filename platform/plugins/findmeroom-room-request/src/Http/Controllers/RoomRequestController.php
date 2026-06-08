<?php

namespace FindMeRoom\RoomRequest\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Base\Http\Controllers\BaseController;
use Carbon\Carbon;
use FindMeRoom\RoomRequest\Enums\RoomRequestStatusEnum;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use FindMeRoom\RoomRequest\Support\ShareSlugGenerator;
use FindMeRoom\RoomRequest\Tables\RoomRequestTable;

class RoomRequestController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/findmeroom-room-request::room-request.menu'), route('room-requests.index'));
    }

    public function index(RoomRequestTable $table)
    {
        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.menu'));

        return $table->renderTable();
    }

    public function edit(RoomRequest $roomRequest)
    {
        $roomRequest->load(['responses', 'approvedBy', 'country', 'state', 'city']);

        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.admin_detail', [
            'name' => $roomRequest->public_name,
        ]));

        return view('plugins/findmeroom-room-request::edit', compact('roomRequest'));
    }

    public function approve(RoomRequest $roomRequest)
    {
        abort_unless($roomRequest->canBeModerated(), 404);

        $expiryDays = (int) config('plugins.findmeroom-room-request.room-request.expiry_days', 30);

        $roomRequest->update([
            'status' => RoomRequestStatusEnum::APPROVED,
            'is_public' => true,
            'approved_at' => Carbon::now(),
            'approved_by' => auth()->id(),
            'expires_at' => Carbon::now()->addDays($expiryDays),
            'share_slug' => $roomRequest->share_slug ?: ShareSlugGenerator::generate($roomRequest),
        ]);

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('room-requests.edit', $roomRequest->getKey()))
            ->setMessage(trans('plugins/findmeroom-room-request::room-request.messages.approved'));
    }

    public function reject(RoomRequest $roomRequest)
    {
        abort_unless($roomRequest->canBeModerated(), 404);

        $roomRequest->update([
            'status' => RoomRequestStatusEnum::REJECTED,
            'is_public' => false,
        ]);

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('room-requests.edit', $roomRequest->getKey()))
            ->setMessage(trans('plugins/findmeroom-room-request::room-request.messages.rejected'));
    }

    public function spam(RoomRequest $roomRequest)
    {
        abort_unless($roomRequest->canBeModerated(), 404);

        $roomRequest->update([
            'status' => RoomRequestStatusEnum::SPAM,
            'is_public' => false,
        ]);

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('room-requests.index'))
            ->setMessage(trans('plugins/findmeroom-room-request::room-request.messages.spam'));
    }

    public function destroy(RoomRequest $roomRequest)
    {
        return DeleteResourceAction::make($roomRequest);
    }
}
