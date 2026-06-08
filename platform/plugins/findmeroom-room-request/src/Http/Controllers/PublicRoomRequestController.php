<?php

namespace FindMeRoom\RoomRequest\Http\Controllers;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Location\Models\City;
use Botble\Location\Models\State;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use FindMeRoom\RoomRequest\Http\Requests\StoreRoomRequestRequest;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use FindMeRoom\RoomRequest\Support\LocationFormHelper;
use FindMeRoom\RoomRequest\Support\PhoneHelper;
use FindMeRoom\RoomRequest\Support\PublicRoomRequestQuery;
use FindMeRoom\RoomRequest\Support\RoomRequestOwnershipService;
use FindMeRoom\RoomRequest\Enums\RoomRequestStatusEnum;
use Illuminate\Http\Request;

class PublicRoomRequestController extends BaseController
{
    public function create()
    {
        SeoHelper::setTitle(trans('plugins/findmeroom-room-request::room-request.front.form_title'));

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(trans('plugins/findmeroom-room-request::room-request.front.form_title'), route('public.room-request.create'));

        if (LocationFormHelper::isAvailable()) {
            LocationFormHelper::registerFrontAssets();
        }

        return Theme::scope(
            'findmeroom-room-request.front.form',
            $this->formViewData(),
            'plugins/findmeroom-room-request::front.form'
        )->render();
    }

    public function store(StoreRoomRequestRequest $request)
    {
        if (filled($request->input('website'))) {
            return redirect()->route('public.room-request.success');
        }

        $countryId = $request->input('country_id') ?: (LocationFormHelper::isAvailable() ? LocationFormHelper::defaultCountryId() : null);
        $stateId = $request->input('state_id');
        $cityId = $request->input('city_id');
        $cityText = LocationFormHelper::resolveCityText(
            $cityId ? (int) $cityId : null,
            $request->input('city_text'),
            $stateId ? (int) $stateId : null,
            $countryId ? (int) $countryId : null
        );

        $accountId = auth('account')->check() ? (int) auth('account')->id() : null;

        $roomRequest = RoomRequest::query()->create([
            'name' => $request->input('name'),
            'public_name' => $request->input('public_name'),
            'phone' => PhoneHelper::normalize($request->input('phone')),
            'email' => $request->input('email'),
            'account_id' => $accountId,
            'country_id' => $countryId,
            'state_id' => $stateId,
            'city_id' => $cityId,
            'city_text' => $cityText,
            'area_text' => $request->input('area_text'),
            'budget_min' => $request->input('budget_min'),
            'budget_max' => $request->input('budget_max'),
            'gender_preference' => $request->input('gender_preference', 'any'),
            'room_type' => $request->input('room_type', 'any'),
            'tenant_type' => $request->input('tenant_type'),
            'nearby_place' => $request->input('nearby_place'),
            'move_in_date' => $request->input('move_in_date'),
            'notes' => $request->input('notes'),
            'allow_public_phone' => $request->boolean('allow_public_phone'),
            'status' => RoomRequestStatusEnum::PENDING,
            'is_public' => false,
        ]);

        $manageUrl = null;

        if (! $accountId) {
            app(RoomRequestOwnershipService::class)->ensureManageToken($roomRequest);
            $manageUrl = app(RoomRequestOwnershipService::class)->manageUrl($roomRequest);
        }

        return redirect()
            ->route('public.room-request.success')
            ->with('manage_url', $manageUrl);
    }

    public function index(Request $request)
    {
        SeoHelper::setTitle(trans('plugins/findmeroom-room-request::room-request.board.seo_title'));

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(trans('plugins/findmeroom-room-request::room-request.board.title'), route('public.room-request.index'));

        $requests = PublicRoomRequestQuery::paginateBoard($request);

        $locationEnabled = LocationFormHelper::isAvailable();
        $filterStates = collect();
        $filterCities = collect();

        if ($locationEnabled) {
            $filterStates = LocationFormHelper::filterStates(
                $request->filled('country_id') ? (int) $request->input('country_id') : LocationFormHelper::defaultCountryId()
            );

            $filterCities = LocationFormHelper::filterCities(
                $request->filled('state_id') ? (int) $request->input('state_id') : null
            );
        }

        return Theme::scope(
            'findmeroom-room-request.front.board',
            compact('requests', 'filterStates', 'filterCities', 'locationEnabled'),
            'plugins/findmeroom-room-request::front.board'
        )->render();
    }

    public function manage(string $token)
    {
        $roomRequest = RoomRequest::query()
            ->where('manage_token', $token)
            ->first();

        abort_unless($roomRequest, 404);

        $roomRequest->load(['city', 'state', 'country']);

        SeoHelper::setTitle(trans('plugins/findmeroom-room-request::room-request.manage.title'));
        SeoHelper::meta()->addMeta('robots', 'noindex, nofollow');

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(trans('plugins/findmeroom-room-request::room-request.manage.title'), route('public.room-request.manage', ['token' => $token]));

        return Theme::scope(
            'findmeroom-room-request.front.manage',
            compact('roomRequest'),
            'plugins/findmeroom-room-request::front.manage'
        )->render();
    }

    public function show(string $slug)
    {
        $roomRequest = PublicRoomRequestQuery::findVisibleBySlug($slug);

        abort_unless($roomRequest, 404);

        $roomRequest->load(['city', 'state', 'country']);

        SeoHelper::setTitle(trans('plugins/findmeroom-room-request::room-request.show.seo_title', [
            'area' => $roomRequest->area_text,
            'budget' => number_format($roomRequest->budget_max),
        ]));

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(trans('plugins/findmeroom-room-request::room-request.board.title'), route('public.room-request.index'))
            ->add($roomRequest->public_name, $roomRequest->publicDetailUrl());

        return Theme::scope(
            'findmeroom-room-request.front.show',
            compact('roomRequest'),
            'plugins/findmeroom-room-request::front.show'
        )->render();
    }

    public function success()
    {
        SeoHelper::setTitle(trans('plugins/findmeroom-room-request::room-request.front.success_title'));

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(trans('plugins/findmeroom-room-request::room-request.front.form_title'), route('public.room-request.create'))
            ->add(trans('plugins/findmeroom-room-request::room-request.front.success_title'), route('public.room-request.success'));

        return Theme::scope(
            'findmeroom-room-request.front.success',
            [
                'manageUrl' => session('manage_url'),
                'isAccountUser' => auth('account')->check(),
            ],
            'plugins/findmeroom-room-request::front.success'
        )->render();
    }

    protected function formViewData(): array
    {
        $locationEnabled = LocationFormHelper::isAvailable();
        $defaultCountryId = LocationFormHelper::defaultCountryId();
        $selectedState = null;
        $selectedCity = null;

        if ($locationEnabled && old('state_id')) {
            $selectedState = State::query()->find(old('state_id'));
        }

        if ($locationEnabled && old('city_id')) {
            $selectedCity = City::query()->find(old('city_id'));
        }

        return [
            'locationEnabled' => $locationEnabled,
            'countries' => LocationFormHelper::countries(),
            'defaultCountryId' => $defaultCountryId,
            'selectedState' => $selectedState,
            'selectedCity' => $selectedCity,
        ];
    }
}
