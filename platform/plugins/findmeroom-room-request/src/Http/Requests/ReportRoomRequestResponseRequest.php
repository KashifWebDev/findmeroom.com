<?php

namespace FindMeRoom\RoomRequest\Http\Requests;

use Botble\Support\Http\Requests\Request;

class ReportRoomRequestResponseRequest extends Request
{
    public function rules(): array
    {
        return [
            'report_reason' => ['nullable', 'string', 'max:500'],
        ];
    }

    public function attributes(): array
    {
        return [
            'report_reason' => trans('plugins/findmeroom-room-request::room-request.tenant_actions.report_reason'),
        ];
    }
}
