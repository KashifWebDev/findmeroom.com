@php
    Theme::addBodyAttributes(['class' => Theme::getBodyAttribute('class') . ' listing-no-map']);

    Theme::asset()->container('footer')->usePath()->add('nice-select', 'js/jquery.nice-select.min.js');

    $itemLayout = request()->input('layout', $itemLayout ?? 'grid');
@endphp

<form
    action="{{ $actionUrl }}"
    data-url="{{ $ajaxUrl }}"
    method="get"
    class="filter-form"
>
    @csrf

    <input type="hidden" name="page" value="{{ BaseHelper::stringify(request()->integer('page', 1)) }}" />
    <input type="hidden" name="layout" value="{{ BaseHelper::stringify(request()->input('layout', 'grid')) }}" />

    <section class="flat-map">
        <div class="container">
            <div class="wrap-filter-search">
                @include($filterViewPath, ['style' => 2])
            </div>
        </div>
    </section>

    <section class="flat-section-v5 flat-recommended flat-recommended-v2">
        <div class="container">
            @include(Theme::getThemeNamespace('views.real-estate.partials.listing-top'))

            {!! apply_filters('ads_render', null, 'listing_page_before') !!}

            <div class="position-relative" data-bb-toggle="data-listing">
                @include($itemsViewPath, compact('itemLayout'))
            </div>

            {!! apply_filters('ads_render', null, 'listing_page_after') !!}
        </div>
    </section>
</form>
