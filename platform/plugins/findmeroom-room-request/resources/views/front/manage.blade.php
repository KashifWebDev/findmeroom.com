<section class="flat-section flat-room-request-manage">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="box-title mb-4">
                    <h1 class="title">{{ trans('plugins/findmeroom-room-request::room-request.manage.heading') }}</h1>
                    <p class="desc text-muted">{{ $roomRequest->public_name }} · {{ $roomRequest->displayLocationShort() }}</p>
                </div>

                <div class="card border mb-4">
                    <div class="card-body">
                        <dl class="row mb-0">
                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.tables.status') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->status->label() }}</dd>

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.location') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->displayLocation() }}</dd>

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.area') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->area_text }}</dd>

                            <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.budget') }}</dt>
                            <dd class="col-sm-8">{{ $roomRequest->displayBudget() }}</dd>

                            @if ($roomRequest->gender_preference)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.gender_preference') }}</dt>
                                <dd class="col-sm-8">{{ trans('plugins/findmeroom-room-request::room-request.options.gender.' . $roomRequest->gender_preference) }}</dd>
                            @endif

                            @if ($roomRequest->room_type)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}</dt>
                                <dd class="col-sm-8">{{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $roomRequest->room_type) }}</dd>
                            @endif

                            @if ($roomRequest->tenant_type)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}</dt>
                                <dd class="col-sm-8">{{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $roomRequest->tenant_type) }}</dd>
                            @endif

                            @if ($roomRequest->nearby_place)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.nearby_place') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->nearby_place }}</dd>
                            @endif

                            @if ($roomRequest->move_in_date)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.move_in_date') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->move_in_date->format('Y-m-d') }}</dd>
                            @endif

                            @if ($roomRequest->notes)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.notes') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->notes }}</dd>
                            @endif

                            @if ($roomRequest->allow_public_phone && $roomRequest->phone)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.phone') }}</dt>
                                <dd class="col-sm-8"><a href="tel:{{ $roomRequest->phone }}">{{ $roomRequest->phone }}</a></dd>
                            @endif
                        </dl>
                    </div>
                </div>

                <div class="alert alert-info" role="status">
                    {{ trans('plugins/findmeroom-room-request::room-request.manage.responses_placeholder') }}
                </div>
            </div>
        </div>
    </div>
</section>
