<section class="flat-section flat-room-request-manage">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="box-title mb-4">
                    <h1 class="title">{{ trans('plugins/findmeroom-room-request::room-request.manage.heading') }}</h1>
                    <p class="desc text-muted">{{ $roomRequest->public_name }} · {{ $roomRequest->displayLocationShort() }}</p>
                </div>

                <div class="alert alert-warning mb-4" role="note">
                    {{ trans('plugins/findmeroom-room-request::room-request.manage.private_notice') }}
                </div>

                <div class="card border mb-4">
                    <div class="card-body">
                        <h2 class="h5 mb-3">{{ trans('plugins/findmeroom-room-request::room-request.manage.request_summary') }}</h2>
                        <dl class="row mb-0">
                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.public_name') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->public_name }}</dd>

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.location') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->displayLocation() }}</dd>

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.budget') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->displayBudget() }}</dd>

                            @if ($roomRequest->room_type)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}</dt>
                                <dd class="col-sm-8">{{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $roomRequest->room_type) }}</dd>
                            @endif

                            @if ($roomRequest->tenant_type)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}</dt>
                                <dd class="col-sm-8">{{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $roomRequest->tenant_type) }}</dd>
                            @endif

                            @if ($roomRequest->move_in_date)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.move_in_date') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->move_in_date->format('Y-m-d') }}</dd>
                            @endif

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.tables.status') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->status->label() }}</dd>

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.tables.created_at') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->created_at->translatedFormat('M d, Y') }}</dd>

                            @if ($roomRequest->approved_at)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.tables.approved_at') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->approved_at->translatedFormat('M d, Y') }}</dd>
                            @endif

                            @if ($roomRequest->expires_at)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.tables.expires_at') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->expires_at->translatedFormat('M d, Y') }}</dd>
                            @endif

                            @if ($roomRequest->isPubliclyVisible())
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.manage.public_link') }}</dt>
                                <dd class="col-sm-8">
                                    <a href="{{ $roomRequest->publicDetailUrl() }}" target="_blank" rel="noopener">
                                        {{ $roomRequest->publicDetailUrl() }}
                                    </a>
                                </dd>
                            @endif
                        </dl>
                    </div>
                </div>

                <div class="card border mb-4">
                    <div class="card-body">
                        <h2 class="h5 mb-3">
                            {{ trans('plugins/findmeroom-room-request::room-request.manage.owner_responses') }}
                            @if ($responses->isNotEmpty())
                                <span class="badge bg-primary ms-1">{{ $responses->count() }}</span>
                            @endif
                        </h2>

                        @if ($roomRequest->isPending())
                            <div class="alert alert-info mb-0" role="status">
                                {{ trans('plugins/findmeroom-room-request::room-request.manage.pending_notice') }}
                            </div>
                        @elseif ($responses->isEmpty())
                            <div class="alert alert-info mb-0" role="status">
                                <p class="mb-1 fw-semibold">{{ trans('plugins/findmeroom-room-request::room-request.manage.no_responses_title') }}</p>
                                <p class="mb-0">{{ trans('plugins/findmeroom-room-request::room-request.manage.no_responses_subtitle') }}</p>
                            </div>
                        @else
                            @foreach ($responses as $response)
                                <div class="border rounded p-3 mb-3 {{ $loop->last ? 'mb-0' : '' }}">
                                    <dl class="row mb-0">
                                        <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_name') }}</dt>
                                        <dd class="col-sm-8">{{ $response->owner_name }}</dd>

                                        <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_phone') }}</dt>
                                        <dd class="col-sm-8"><a href="tel:{{ $response->owner_phone }}">{{ $response->owner_phone }}</a></dd>

                                        @if ($response->owner_email)
                                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_email') }}</dt>
                                            <dd class="col-sm-8"><a href="mailto:{{ $response->owner_email }}">{{ $response->owner_email }}</a></dd>
                                        @endif

                                        <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.area_text') }}</dt>
                                        <dd class="col-sm-8">{{ $response->area_text }}</dd>

                                        <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.rent') }}</dt>
                                        <dd class="col-sm-8">Rs {{ number_format($response->rent) }}</dd>

                                        @if ($response->room_type)
                                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.room_type') }}</dt>
                                            <dd class="col-sm-8">{{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $response->room_type) }}</dd>
                                        @endif

                                        <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.message') }}</dt>
                                        <dd class="col-sm-8">{{ $response->message }}</dd>

                                        <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.manage.received_at') }}</dt>
                                        <dd class="col-sm-8">{{ $response->created_at->translatedFormat('M d, Y H:i') }}</dd>
                                    </dl>
                                </div>
                            @endforeach
                        @endif
                    </div>
                </div>

                @if (! auth('account')->check())
                    <div class="card border mb-4">
                        <div class="card-body text-center">
                            <p class="mb-3">{{ trans('plugins/findmeroom-room-request::room-request.manage.account_cta') }}</p>
                            <div class="d-flex flex-wrap justify-content-center gap-2">
                                @if (Route::has('public.account.register'))
                                    <a href="{{ route('public.account.register') }}" class="tf-btn primary">
                                        {{ trans('plugins/findmeroom-room-request::room-request.manage.create_account') }}
                                    </a>
                                @endif
                                @if (Route::has('public.account.login'))
                                    <a href="{{ route('public.account.login') }}" class="tf-btn btn-line">
                                        {{ trans('plugins/findmeroom-room-request::room-request.manage.login') }}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </div>
</section>
