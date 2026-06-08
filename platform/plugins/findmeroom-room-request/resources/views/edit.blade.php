@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <div class="row flex-lg-row-reverse">
        <div class="col-lg-4">
            <x-core::card class="mb-3">
                <x-core::card.header>
                    <x-core::card.title>
                        {{ trans('plugins/findmeroom-room-request::room-request.moderation') }}
                    </x-core::card.title>
                </x-core::card.header>
                <x-core::card.body>
                    @include('plugins/findmeroom-room-request::partials.request-actions', ['roomRequest' => $roomRequest])
                </x-core::card.body>
            </x-core::card>

            <x-core::card>
                <x-core::card.header>
                    <x-core::card.title>
                        {{ trans('plugins/findmeroom-room-request::room-request.approval_details') }}
                    </x-core::card.title>
                </x-core::card.header>
                <x-core::card.body>
                    @include('plugins/findmeroom-room-request::partials.approval-details', ['roomRequest' => $roomRequest])
                </x-core::card.body>
            </x-core::card>
        </div>

        <div class="col-lg-8">
            <x-core::card>
                <x-core::card.header>
                    <x-core::card.title>
                        {{ trans('plugins/findmeroom-room-request::room-request.request_information') }}
                    </x-core::card.title>
                </x-core::card.header>
                <x-core::card.body>
                    @include('plugins/findmeroom-room-request::partials.request-info', ['roomRequest' => $roomRequest])
                </x-core::card.body>
            </x-core::card>
        </div>
    </div>
@endsection

@if ($roomRequest->canBeModerated())
    @push('footer')
        <x-core::modal.action
            id="approve-room-request-modal"
            type="success"
            :title="trans('plugins/findmeroom-room-request::room-request.actions.approve')"
            :description="trans('plugins/findmeroom-room-request::room-request.actions.approve_confirm')"
            :form-action="route('room-requests.approve', $roomRequest->getKey())"
        >
            <x-slot:footer>
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <button type="submit" class="w-100 btn btn-success">
                                {{ trans('plugins/findmeroom-room-request::room-request.actions.approve') }}
                            </button>
                        </div>
                        <div class="col">
                            <button type="button" class="w-100 btn" data-bs-dismiss="modal">
                                {{ trans('core/base::base.close') }}
                            </button>
                        </div>
                    </div>
                </div>
            </x-slot:footer>
        </x-core::modal.action>

        <x-core::modal.action
            id="reject-room-request-modal"
            type="warning"
            :title="trans('plugins/findmeroom-room-request::room-request.actions.reject')"
            :description="trans('plugins/findmeroom-room-request::room-request.actions.reject_confirm')"
            :form-action="route('room-requests.reject', $roomRequest->getKey())"
        >
            <x-slot:footer>
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <button type="submit" class="w-100 btn btn-warning">
                                {{ trans('plugins/findmeroom-room-request::room-request.actions.reject') }}
                            </button>
                        </div>
                        <div class="col">
                            <button type="button" class="w-100 btn" data-bs-dismiss="modal">
                                {{ trans('core/base::base.close') }}
                            </button>
                        </div>
                    </div>
                </div>
            </x-slot:footer>
        </x-core::modal.action>

        <x-core::modal.action
            id="spam-room-request-modal"
            type="danger"
            :title="trans('plugins/findmeroom-room-request::room-request.actions.spam')"
            :description="trans('plugins/findmeroom-room-request::room-request.actions.spam_confirm')"
            :form-action="route('room-requests.spam', $roomRequest->getKey())"
        >
            <x-slot:footer>
                <div class="w-100">
                    <div class="row">
                        <div class="col">
                            <button type="submit" class="w-100 btn btn-danger">
                                {{ trans('plugins/findmeroom-room-request::room-request.actions.spam') }}
                            </button>
                        </div>
                        <div class="col">
                            <button type="button" class="w-100 btn" data-bs-dismiss="modal">
                                {{ trans('core/base::base.close') }}
                            </button>
                        </div>
                    </div>
                </div>
            </x-slot:footer>
        </x-core::modal.action>
    @endpush
@endif
