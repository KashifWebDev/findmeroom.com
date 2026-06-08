<?php

namespace FindMeRoom\RoomRequest\Http\Requests;

use Botble\Base\Rules\EmailRule;
use Botble\Support\Http\Requests\Request;
use FindMeRoom\RoomRequest\Support\LocationFormHelper;
use FindMeRoom\RoomRequest\Support\PhoneHelper;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Validator;

class StoreRoomRequestRequest extends Request
{
    public function rules(): array
    {
        $locationActive = LocationFormHelper::isAvailable();

        $rules = [
            'name' => ['required', 'string', 'max:120'],
            'public_name' => ['required', 'string', 'max:80'],
            'phone' => ['required', 'string', 'max:20'],
            'email' => ['nullable', new EmailRule(), 'max:120'],
            'area_text' => ['required', 'string', 'max:160'],
            'budget_min' => ['nullable', 'integer', 'min:0', 'max:9999999'],
            'budget_max' => ['required', 'integer', 'min:1000', 'max:9999999'],
            'gender_preference' => ['nullable', 'string', Rule::in(['any', 'female_only', 'male_only'])],
            'room_type' => ['nullable', 'string', Rule::in(['single', 'shared', 'any'])],
            'tenant_type' => ['nullable', 'string', Rule::in(['student', 'working', 'family', 'other'])],
            'nearby_place' => ['nullable', 'string', 'max:160'],
            'move_in_date' => ['nullable', 'date', 'after_or_equal:today', 'before:+1 year'],
            'notes' => ['nullable', 'string', 'max:1000'],
            'allow_public_phone' => ['nullable', 'boolean'],
        ];

        if ($locationActive) {
            $rules['country_id'] = ['nullable', Rule::exists('countries', 'id')];
            $rules['state_id'] = ['nullable', Rule::exists('states', 'id')];
            $rules['city_id'] = ['nullable', Rule::exists('cities', 'id'), 'required_without:city_text'];
            $rules['city_text'] = ['nullable', 'string', 'max:120', 'required_without:city_id'];
        } else {
            $rules['city_text'] = ['required', 'string', 'max:120'];
        }

        return $rules;
    }

    public function withValidator(Validator $validator): void
    {
        $validator->after(function (Validator $validator): void {
            if (filled($this->input('website'))) {
                $validator->errors()->add('website', trans('plugins/findmeroom-room-request::room-request.validation.spam_detected'));
            }

            if (! PhoneHelper::isValidPakistanMobile($this->input('phone'))) {
                $validator->errors()->add('phone', trans('plugins/findmeroom-room-request::room-request.validation.phone_invalid'));
            }

            $budgetMin = $this->input('budget_min');
            $budgetMax = $this->input('budget_max');

            if ($budgetMin !== null && $budgetMax !== null && (int) $budgetMax < (int) $budgetMin) {
                $validator->errors()->add('budget_max', trans('plugins/findmeroom-room-request::room-request.validation.budget_max_gte_min'));
            }
        });
    }

    public function attributes(): array
    {
        return [
            'name' => trans('plugins/findmeroom-room-request::room-request.form.full_name'),
            'public_name' => trans('plugins/findmeroom-room-request::room-request.form.public_name'),
            'phone' => trans('plugins/findmeroom-room-request::room-request.form.phone'),
            'email' => trans('plugins/findmeroom-room-request::room-request.form.email'),
            'country_id' => trans('plugins/findmeroom-room-request::room-request.form.country'),
            'state_id' => trans('plugins/findmeroom-room-request::room-request.form.state'),
            'city_id' => trans('plugins/findmeroom-room-request::room-request.form.city'),
            'city_text' => trans('plugins/findmeroom-room-request::room-request.form.city_text'),
            'area_text' => trans('plugins/findmeroom-room-request::room-request.form.area'),
            'budget_min' => trans('plugins/findmeroom-room-request::room-request.form.budget_min'),
            'budget_max' => trans('plugins/findmeroom-room-request::room-request.form.budget_max'),
            'gender_preference' => trans('plugins/findmeroom-room-request::room-request.form.gender_preference'),
            'room_type' => trans('plugins/findmeroom-room-request::room-request.form.room_type'),
            'tenant_type' => trans('plugins/findmeroom-room-request::room-request.form.tenant_type'),
            'nearby_place' => trans('plugins/findmeroom-room-request::room-request.form.nearby_place'),
            'move_in_date' => trans('plugins/findmeroom-room-request::room-request.form.move_in_date'),
            'notes' => trans('plugins/findmeroom-room-request::room-request.form.notes'),
            'allow_public_phone' => trans('plugins/findmeroom-room-request::room-request.form.allow_public_phone'),
        ];
    }
}
