<div class="col-md-6 col-lg-4 mb-4">
    <div class="card h-100 border">
        <div class="card-body d-flex flex-column">
            <h5 class="card-title mb-1">{{ $request->public_name }}</h5>
            <p class="text-muted small mb-2">{{ $request->displayLocationShort() }} · {{ $request->area_text }}</p>

            <ul class="list-unstyled small mb-3 flex-grow-1">
                <li><strong>{{ trans('plugins/findmeroom-room-request::room-request.form.budget') }}:</strong> {{ $request->displayBudget() }}</li>
                @if ($request->room_type)
                    <li><strong>{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}:</strong> {{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $request->room_type) }}</li>
                @endif
                @if ($request->tenant_type)
                    <li><strong>{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}:</strong> {{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $request->tenant_type) }}</li>
                @endif
                @if ($request->move_in_date)
                    <li><strong>{{ trans('plugins/findmeroom-room-request::room-request.form.move_in_date') }}:</strong> {{ $request->move_in_date->format('Y-m-d') }}</li>
                @endif
                <li><strong>{{ trans('plugins/findmeroom-room-request::room-request.board.listed') }}:</strong> {{ $request->displayListedDate() }}</li>
                @if ($request->allow_public_phone && $request->phone)
                    <li><strong>{{ trans('plugins/findmeroom-room-request::room-request.form.phone') }}:</strong> <a href="tel:{{ $request->phone }}">{{ $request->phone }}</a></li>
                @endif
            </ul>

            <a href="{{ $request->publicDetailUrl() }}" class="tf-btn primary mt-auto align-self-start">
                {{ trans('plugins/findmeroom-room-request::room-request.board.view_details') }}
            </a>
        </div>
    </div>
</div>
