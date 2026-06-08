@if ($roomRequest->canBeModerated())
    <p class="text-muted mb-3">{{ trans('plugins/findmeroom-room-request::room-request.actions.pending_hint') }}</p>

    <div class="d-grid gap-2">
        <x-core::button
            type="button"
            color="success"
            icon="ti ti-check"
            data-bs-toggle="modal"
            data-bs-target="#approve-room-request-modal"
            class="w-100"
        >
            {{ trans('plugins/findmeroom-room-request::room-request.actions.approve') }}
        </x-core::button>

        <x-core::button
            type="button"
            color="warning"
            icon="ti ti-x"
            data-bs-toggle="modal"
            data-bs-target="#reject-room-request-modal"
            class="w-100"
        >
            {{ trans('plugins/findmeroom-room-request::room-request.actions.reject') }}
        </x-core::button>

        <x-core::button
            type="button"
            color="danger"
            icon="ti ti-ban"
            data-bs-toggle="modal"
            data-bs-target="#spam-room-request-modal"
            class="w-100"
        >
            {{ trans('plugins/findmeroom-room-request::room-request.actions.spam') }}
        </x-core::button>
    </div>
@else
    <p class="text-muted mb-0">{{ trans('plugins/findmeroom-room-request::room-request.actions.no_actions') }}</p>
@endif
