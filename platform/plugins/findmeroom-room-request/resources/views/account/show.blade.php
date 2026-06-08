@extends('plugins/real-estate::themes.dashboard.layouts.master')

@section('content')
    <div class="mb-3">
        <a href="{{ route('public.account.room-requests.index') }}" class="btn btn-link px-0">
            <x-core::icon name="ti ti-arrow-left" />
            {{ trans('plugins/findmeroom-room-request::room-request.account.back_to_list') }}
        </a>
    </div>

    @if (session('mark_found_success'))
        <div class="alert alert-success mb-4" role="status">
            {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.mark_found_success') }}
        </div>
    @endif

    @if (session('report_response_success'))
        <div class="alert alert-success mb-4" role="status">
            {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.report_success') }}
        </div>
    @endif

    <x-core::card class="mb-4">
        <x-core::card.header>
            <x-core::card.title>
                {{ trans('plugins/findmeroom-room-request::room-request.account.request_summary') }}
            </x-core::card.title>
        </x-core::card.header>
        <x-core::card.body>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.public_name') }}</div>
                    <div class="fw-medium">{{ $roomRequest->public_name }}</div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.tables.status') }}</div>
                    <div>{!! $roomRequest->status->toHtml() !!}</div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.location') }}</div>
                    <div>{{ $roomRequest->displayLocation() }}</div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.area') }}</div>
                    <div>{{ $roomRequest->area_text }}</div>
                </div>
                <div class="col-md-6 mb-3">
                    <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.budget') }}</div>
                    <div>{{ $roomRequest->displayBudget() }}</div>
                </div>
                @if ($roomRequest->room_type)
                    <div class="col-md-6 mb-3">
                        <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}</div>
                        <div>{{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $roomRequest->room_type) }}</div>
                    </div>
                @endif
                @if ($roomRequest->tenant_type)
                    <div class="col-md-6 mb-3">
                        <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}</div>
                        <div>{{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $roomRequest->tenant_type) }}</div>
                    </div>
                @endif
                @if ($roomRequest->move_in_date)
                    <div class="col-md-6 mb-3">
                        <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.form.move_in_date') }}</div>
                        <div>{{ $roomRequest->move_in_date->format('Y-m-d') }}</div>
                    </div>
                @endif
                @if ($roomRequest->isPubliclyVisible())
                    <div class="col-12 mb-3">
                        <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.account.public_link') }}</div>
                        <a href="{{ $roomRequest->publicDetailUrl() }}" target="_blank" rel="noopener">
                            {{ $roomRequest->publicDetailUrl() }}
                        </a>
                    </div>
                @endif
                <div class="col-12">
                    @include('plugins/findmeroom-room-request::partials.mark-found-action', [
                        'roomRequest' => $roomRequest,
                        'action' => route('public.account.room-requests.found', $roomRequest->getKey()),
                    ])
                </div>
            </div>
        </x-core::card.body>
    </x-core::card>

    <x-core::card>
        <x-core::card.header>
            <x-core::card.title>
                {{ trans('plugins/findmeroom-room-request::room-request.account.owner_responses') }}
                <span class="badge bg-primary ms-1">{{ $responses->count() }}</span>
            </x-core::card.title>
        </x-core::card.header>
        <x-core::card.body>
            @if ($responses->isEmpty())
                <div class="empty py-4">
                    <div class="empty-icon">
                        <x-core::icon name="ti ti-inbox" />
                    </div>
                    <p class="empty-title">
                        {{ trans('plugins/findmeroom-room-request::room-request.account.no_responses_title') }}
                    </p>
                    <p class="empty-subtitle text-muted">
                        {{ trans('plugins/findmeroom-room-request::room-request.account.no_responses_subtitle') }}
                    </p>
                </div>
            @else
                <div class="list-group list-group-flush">
                    @foreach ($responses as $response)
                        @include('plugins/findmeroom-room-request::partials.tenant-response-item', [
                            'response' => $response,
                            'reportAction' => route('public.account.room-requests.responses.report', [
                                'roomRequest' => $roomRequest->getKey(),
                                'response' => $response->getKey(),
                            ]),
                        ])
                    @endforeach
                </div>
            @endif
        </x-core::card.body>
    </x-core::card>
@stop
