<div class="form-group-2 form-style" data-bb-toggle="search-suggestion">
    <label>{{ __('Location') }}</label>
    <div class="position-relative">
        <div @class(['group-ip', 'ip-icon' => $style === 3])>
            <input type="text" class="form-control" placeholder="{{ __('Search for Location') }}" value="{{ BaseHelper::stringify(request()->query('location')) }}" name="location" data-url="{{ route('public.ajax.cities') }}" />
            <x-core::icon name="ti ti-current-location" @class(['icon-right icon-location' => $style === 3]) />
        </div>
        <div data-bb-toggle="data-suggestion"></div>
    </div>
</div>
