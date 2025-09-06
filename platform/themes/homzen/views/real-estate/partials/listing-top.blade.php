<div @class(['box-title-listing', $class ?? null])>
    <div data-bb-toggle="pagination-info"></div>
    <div class="box-filter-tab">
        <a href="{{ $actionUrl }}" class="reset-filter-btn" @style(['display: none' => empty(request()->query())])>
            <x-core::icon name="ti ti-refresh" />
            {{ __('Reset') }}
        </a>
        <ul class="nav-tab-filter" role="tablist">
            <li class="nav-tab-item" role="presentation">
                <button @class(['nav-link-item', 'active' => $itemLayout === 'grid']) data-bs-toggle="tab" data-bb-toggle="change-layout" data-value="grid">
                    <x-core::icon name="ti ti-layout-grid" />
                </button>
            </li>
            <li class="nav-tab-item" role="presentation">
                <button @class(['nav-link-item', 'active' => $itemLayout === 'list']) data-bs-toggle="tab" data-bb-toggle="change-layout" data-value="list">
                    <x-core::icon name="ti ti-layout-list" />
                </button>
            </li>
        </ul>
        <select name="per_page" id="per_page" class="list-page select_js">
            @foreach ($perPages as $perPage)
                <option value="{{ $perPage }}" @selected(BaseHelper::stringify(request()->integer('per_page', 12)) == $perPage)>{{ $perPage }}</option>
            @endforeach
        </select>
        <select name="sort_by" id="sort_by" class="list-sort select_js">
            <option value="">{{ __('Default') }}</option>
            @foreach (RealEstateHelper::getSortByList() as $key => $sortBy)
                <option value="{{ $key }}" @selected(BaseHelper::stringify(request()->query('sort_by')) === $key)>{{ $sortBy }}</option>
            @endforeach
        </select>
    </div>
</div>
