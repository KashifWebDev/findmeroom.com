<?php

namespace FindMeRoom\RoomRequest\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use FindMeRoom\RoomRequest\Enums\RoomRequestResponseStatusEnum;
use FindMeRoom\RoomRequest\Models\RoomRequestResponse;
use FindMeRoom\RoomRequest\Tables\RoomRequestResponseTable;

class RoomRequestResponseController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans('plugins/findmeroom-room-request::room-request.menu'), route('room-requests.index'))
            ->add(trans('plugins/findmeroom-room-request::room-request.responses.menu'), route('room-request-responses.index'));
    }

    public function index(RoomRequestResponseTable $table)
    {
        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.responses.menu'));

        return $table->renderTable();
    }

    public function edit(RoomRequestResponse $roomRequestResponse)
    {
        $roomRequestResponse->load(['roomRequest']);

        $this->pageTitle(trans('plugins/findmeroom-room-request::room-request.responses.admin_detail', [
            'id' => $roomRequestResponse->getKey(),
        ]));

        return view('plugins/findmeroom-room-request::responses.edit', [
            'response' => $roomRequestResponse,
        ]);
    }

    public function markVisible(RoomRequestResponse $roomRequestResponse)
    {
        $roomRequestResponse->markVisibleForTenant();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('room-request-responses.edit', $roomRequestResponse->getKey()))
            ->setMessage(trans('plugins/findmeroom-room-request::room-request.responses.messages.visible'));
    }

    public function reject(RoomRequestResponse $roomRequestResponse)
    {
        $roomRequestResponse->update([
            'status' => RoomRequestResponseStatusEnum::REJECTED,
        ]);

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('room-request-responses.edit', $roomRequestResponse->getKey()))
            ->setMessage(trans('plugins/findmeroom-room-request::room-request.responses.messages.rejected'));
    }

    public function spam(RoomRequestResponse $roomRequestResponse)
    {
        $roomRequestResponse->update([
            'status' => RoomRequestResponseStatusEnum::SPAM,
        ]);

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('room-request-responses.index'))
            ->setMessage(trans('plugins/findmeroom-room-request::room-request.responses.messages.spam'));
    }
}
