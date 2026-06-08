@if ($locationEnabled)
    <div class="select-location-fields mb-3" data-select2-dropdown-parent="true">
        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="country_id" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.country') }}</label>
                <select
                    class="form-control select-search-location"
                    id="country_id"
                    name="country_id"
                    data-type="country"
                >
                    <option value="">{{ trans('plugins/location::city.select_country') }}</option>
                    @foreach ($countries as $id => $name)
                        <option value="{{ $id }}" @selected((string) old('country_id', $defaultCountryId) === (string) $id)>{{ $name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label for="state_id" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.state') }}</label>
                <select
                    class="form-control select-location-ajax"
                    id="state_id"
                    name="state_id"
                    data-type="state"
                    data-url="{{ route('ajax.states-by-country') }}"
                    data-country-id="{{ old('country_id', $defaultCountryId) }}"
                >
                    <option value="">{{ trans('plugins/location::city.select_state') }}</option>
                    @if ($selectedState)
                        <option value="{{ $selectedState->id }}" selected>{{ $selectedState->name }}</option>
                    @endif
                </select>
            </div>
            <div class="col-md-4 mb-3">
                <label for="city_id" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.city') }} *</label>
                <select
                    class="form-control select-location-ajax"
                    id="city_id"
                    name="city_id"
                    data-type="city"
                    data-url="{{ route('ajax.cities-by-state') }}"
                    data-state-id="{{ old('state_id') }}"
                    data-country-id="{{ old('country_id', $defaultCountryId) }}"
                >
                    <option value="">{{ trans('plugins/location::city.select_city') }}</option>
                    @if ($selectedCity)
                        <option value="{{ $selectedCity->id }}" selected>{{ $selectedCity->name }}</option>
                    @endif
                </select>
            </div>
        </div>
        <div class="mb-3">
            <label for="city_text" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.city_text') }}</label>
            <input type="text" class="form-control" id="city_text" name="city_text" value="{{ old('city_text') }}" maxlength="120">
            <small class="text-muted">{{ trans('plugins/findmeroom-room-request::room-request.form.city_text_hint') }}</small>
        </div>
    </div>
@else
    <div class="mb-3">
        <label for="city_text" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.city') }} *</label>
        <input type="text" class="form-control" id="city_text" name="city_text" value="{{ old('city_text') }}" required maxlength="120">
    </div>
@endif
