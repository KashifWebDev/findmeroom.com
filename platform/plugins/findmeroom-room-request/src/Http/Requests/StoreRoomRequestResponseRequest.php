<?php

namespace FindMeRoom\RoomRequest\Http\Requests;

use Botble\Base\Rules\EmailRule;
use Botble\Support\Http\Requests\Request;
use FindMeRoom\RoomRequest\Models\RoomRequestResponse;
use FindMeRoom\RoomRequest\Support\PhoneHelper;
use FindMeRoom\RoomRequest\Support\PublicRoomRequestQuery;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Validator;

class StoreRoomRequestResponseRequest extends Request
{
    public function rules(): array
    {
        return [
            'owner_name' => ['required', 'string', 'max:120'],
            'owner_phone' => ['required', 'string', 'max:20'],
            'owner_email' => ['nullable', new EmailRule(), 'max:120'],
            'area_text' => ['required', 'string', 'max:160'],
            'rent' => ['required', 'integer', 'min:1', 'max:9999999'],
            'room_type' => ['nullable', 'string', Rule::in(['single', 'shared', 'any'])],
            'message' => ['required', 'string', 'max:2000'],
        ];
    }

    public function withValidator(Validator $validator): void
    {
        $validator->after(function (Validator $validator): void {
            if (filled($this->input('website'))) {
                $validator->errors()->add('website', trans('plugins/findmeroom-room-request::room-request.validation.spam_detected'));
            }

            if (! PhoneHelper::isValidPakistanMobile($this->input('owner_phone'))) {
                $validator->errors()->add('owner_phone', trans('plugins/findmeroom-room-request::room-request.validation.phone_invalid'));
            }

            $slug = $this->route('slug');

            if (! $slug) {
                return;
            }

            $roomRequest = PublicRoomRequestQuery::findVisibleBySlug($slug);

            if (! $roomRequest || ! $roomRequest->acceptsOwnerResponses()) {
                $validator->errors()->add('owner_name', trans('plugins/findmeroom-room-request::room-request.owner_response.request_not_eligible'));

                return;
            }

            $perRequestLimit = (int) config('plugins.findmeroom-room-request.room-request.owner_response_per_request_daily_limit', 3);
            $ip = $this->ip();

            $responsesToday = RoomRequestResponse::query()
                ->where('room_request_id', $roomRequest->getKey())
                ->where('ip_address', $ip)
                ->where('created_at', '>=', now()->subDay())
                ->count();

            if ($responsesToday >= $perRequestLimit) {
                $validator->errors()->add('owner_phone', trans('plugins/findmeroom-room-request::room-request.owner_response.per_request_limit'));
            }
        });
    }

    public function attributes(): array
    {
        return [
            'owner_name' => trans('plugins/findmeroom-room-request::room-request.owner_response.owner_name'),
            'owner_phone' => trans('plugins/findmeroom-room-request::room-request.owner_response.owner_phone'),
            'owner_email' => trans('plugins/findmeroom-room-request::room-request.owner_response.owner_email'),
            'area_text' => trans('plugins/findmeroom-room-request::room-request.owner_response.area_text'),
            'rent' => trans('plugins/findmeroom-room-request::room-request.owner_response.rent'),
            'room_type' => trans('plugins/findmeroom-room-request::room-request.owner_response.room_type'),
            'message' => trans('plugins/findmeroom-room-request::room-request.owner_response.message'),
        ];
    }
}
