@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <div class="row flex-lg-row-reverse">
        <div class="col-lg-4">
            <x-core::card class="mb-3">
                <x-core::card.header>
                    <x-core::card.title>
                        {{ trans('plugins/findmeroom-room-request::room-request.responses.moderation') }}
                    </x-core::card.title>
                </x-core::card.header>
                <x-core::card.body>
                    @include('plugins/findmeroom-room-request::partials.response-actions', ['response' => $response])
                </x-core::card.body>
            </x-core::card>

            <x-core::card>
                <x-core::card.header>
                    <x-core::card.title>
                        {{ trans('plugins/findmeroom-room-request::room-request.tables.status') }}
                    </x-core::card.title>
                </x-core::card.header>
                <x-core::card.body>
                    <p class="mb-2">{!! $response->status->toHtml() !!}</p>
                    @if ($response->reported_at)
                        <p class="mb-1 text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.responses.tables.reported_at') }}</p>
                        <p class="mb-2">{{ $response->reported_at->format('Y-m-d H:i') }}</p>
                    @endif
                    @if ($response->report_reason)
                        <p class="mb-1 text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.responses.tables.report_reason') }}</p>
                        <p class="mb-0">{{ $response->report_reason }}</p>
                    @endif
                </x-core::card.body>
            </x-core::card>
        </div>

        <div class="col-lg-8">
            <x-core::card>
                <x-core::card.header>
                    <x-core::card.title>
                        {{ trans('plugins/findmeroom-room-request::room-request.responses.response_information') }}
                    </x-core::card.title>
                </x-core::card.header>
                <x-core::card.body>
                    @include('plugins/findmeroom-room-request::partials.response-info', ['response' => $response])
                </x-core::card.body>
            </x-core::card>
        </div>
    </div>
@endsection

@push('footer')
    <x-core::modal.action
        id="visible-room-request-response-modal"
        type="success"
        :title="trans('plugins/findmeroom-room-request::room-request.responses.actions.visible')"
        :description="trans('plugins/findmeroom-room-request::room-request.responses.actions.visible_confirm')"
        :form-action="route('room-request-responses.visible', $response->getKey())"
    />

    <x-core::modal.action
        id="reject-room-request-response-modal"
        type="warning"
        :title="trans('plugins/findmeroom-room-request::room-request.responses.actions.reject')"
        :description="trans('plugins/findmeroom-room-request::room-request.responses.actions.reject_confirm')"
        :form-action="route('room-request-responses.reject', $response->getKey())"
    />

    <x-core::modal.action
        id="spam-room-request-response-modal"
        type="danger"
        :title="trans('plugins/findmeroom-room-request::room-request.responses.actions.spam')"
        :description="trans('plugins/findmeroom-room-request::room-request.responses.actions.spam_confirm')"
        :form-action="route('room-request-responses.spam', $response->getKey())"
    />
@endpush
