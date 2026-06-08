<section class="flat-section flat-room-request-detail">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="box-title mb-4">
                    <h1 class="title">{{ $roomRequest->public_name }} {{ trans('plugins/findmeroom-room-request::room-request.show.needs_room') }}</h1>
                    <p class="desc text-muted">{{ $roomRequest->displayLocation() }} · {{ $roomRequest->area_text }}</p>
                </div>

                <div class="card border mb-4">
                    <div class="card-body">
                        <dl class="row mb-0">
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

                            @if ($roomRequest->expires_at)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.tables.expires_at') }}</dt>
                                <dd class="col-sm-8">{{ $roomRequest->expires_at->translatedFormat('M d, Y') }}</dd>
                            @endif

                            @if ($roomRequest->allow_public_phone && $roomRequest->phone)
                                <dt class="col-sm-4">{{ trans('plugins/findmeroom-room-request::room-request.form.phone') }}</dt>
                                <dd class="col-sm-8"><a href="tel:{{ $roomRequest->phone }}">{{ $roomRequest->phone }}</a></dd>
                            @endif
                        </dl>
                    </div>
                </div>

                <div class="d-flex flex-wrap gap-2">
                    <a href="{{ route('public.room-request.index') }}" class="tf-btn btn-line">
                        {{ trans('plugins/findmeroom-room-request::room-request.show.back_to_board') }}
                    </a>
                    <a href="{{ url('/properties') }}" class="tf-btn primary">
                        {{ trans('plugins/findmeroom-room-request::room-request.front.find_a_room') }}
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
