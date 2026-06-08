<section class="flat-section flat-room-request-manage">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="box-title mb-4">
                    <h1 class="title">{{ trans('plugins/findmeroom-room-request::room-request.manage.heading') }}</h1>
                    <p class="desc text-muted">{{ $roomRequest->public_name }} · {{ $roomRequest->displayLocationShort() }}</p>
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

                <div class="alert alert-warning mb-4" role="note">
                    {{ trans('plugins/findmeroom-room-request::room-request.manage.private_notice') }}
                </div>

                <div class="card border mb-4">
                    <div class="card-body">
                        <h2 class="h5 mb-3">{{ trans('plugins/findmeroom-room-request::room-request.manage.request_summary') }}</h2>
                        <dl class="row mb-4">
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

                        @include('plugins/findmeroom-room-request::partials.mark-found-action', [
                            'roomRequest' => $roomRequest,
                            'action' => route('public.room-request.manage.found', ['token' => $token]),
                        ])
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
                                @include('plugins/findmeroom-room-request::partials.tenant-response-item', [
                                    'response' => $response,
                                    'wrapperClass' => 'border rounded p-3 mb-3' . ($loop->last ? ' mb-0' : ''),
                                    'reportAction' => route('public.room-request.manage.responses.report', [
                                        'token' => $token,
                                        'response' => $response->getKey(),
                                    ]),
                                ])
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
