<form method="GET" action="{{ route('public.room-request.index') }}" class="mb-4">
    <div class="row g-3">
        @if (! empty($locationEnabled) && ! empty($filterStates))
            <div class="col-md-4">
                <label for="filter_state_id" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.state') }}</label>
                <select class="form-control" id="filter_state_id" name="state_id" onchange="this.form.submit()">
                    <option value="">{{ trans('plugins/findmeroom-room-request::room-request.board.all') }}</option>
                    @foreach ($filterStates as $id => $name)
                        <option value="{{ $id }}" @selected((string) request('state_id') === (string) $id)>{{ $name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4">
                <label for="filter_city_id" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.city') }}</label>
                <select class="form-control" id="filter_city_id" name="city_id">
                    <option value="">{{ trans('plugins/findmeroom-room-request::room-request.board.all') }}</option>
                    @foreach ($filterCities ?? [] as $id => $name)
                        <option value="{{ $id }}" @selected((string) request('city_id') === (string) $id)>{{ $name }}</option>
                    @endforeach
                </select>
            </div>
        @endif
        <div class="col-md-4">
            <label for="filter_city_text" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.board.city_text_filter') }}</label>
            <input type="text" class="form-control" id="filter_city_text" name="city_text" value="{{ request('city_text') }}" maxlength="120" placeholder="{{ trans('plugins/findmeroom-room-request::room-request.board.legacy_city_hint') }}">
        </div>
        <div class="col-md-4">
            <label for="filter_area_text" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.area') }}</label>
            <input type="text" class="form-control" id="filter_area_text" name="area_text" value="{{ request('area_text') }}" maxlength="160">
        </div>
        <div class="col-md-4">
            <label for="filter_budget_max" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.board.max_budget_filter') }}</label>
            <input type="number" class="form-control" id="filter_budget_max" name="budget_max" value="{{ request('budget_max') }}" min="1000" placeholder="e.g. 25000">
        </div>
        <div class="col-md-4">
            <label for="filter_room_type" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}</label>
            <select class="form-control" id="filter_room_type" name="room_type">
                <option value="">{{ trans('plugins/findmeroom-room-request::room-request.board.all') }}</option>
                @foreach (['any', 'single', 'shared'] as $value)
                    <option value="{{ $value }}" @selected(request('room_type') === $value)>
                        {{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $value) }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4">
            <label for="filter_tenant_type" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}</label>
            <select class="form-control" id="filter_tenant_type" name="tenant_type">
                <option value="">{{ trans('plugins/findmeroom-room-request::room-request.board.all') }}</option>
                @foreach (['student', 'working', 'family', 'other'] as $value)
                    <option value="{{ $value }}" @selected(request('tenant_type') === $value)>
                        {{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $value) }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4 d-flex align-items-end gap-2">
            <button type="submit" class="tf-btn primary">{{ trans('plugins/findmeroom-room-request::room-request.board.filter') }}</button>
            <a href="{{ route('public.room-request.index') }}" class="tf-btn btn-line">{{ trans('plugins/findmeroom-room-request::room-request.board.reset') }}</a>
        </div>
    </div>
</form>
