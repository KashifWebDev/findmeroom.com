@php
    Theme::set('breadcrumbEnabled', false);

    Theme::asset()->container('footer')->usePath()->add('nice-select', 'js/jquery.nice-select.min.js');
    Theme::asset()->container('footer')->usePath()->add('nouislider', 'js/nouislider.min.js');
    Theme::asset()->container('footer')->usePath()->add('wnumb', 'js/wNumb.min.js');
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

    <section class="flat-section-v6 flat-recommended flat-sidebar">
        <div class="container">
            @include(Theme::getThemeNamespace('views.real-estate.partials.listing-top'))

            {!! apply_filters('ads_render', null, 'listing_page_before') !!}

            <div class="row">
                <div class="col-xl-4 col-lg-5">
                    <div class="widget-sidebar fixed-sidebar">
                        @include($filterViewPath, ['style' => 'sidebar'])
                    </div>
                </div>

                <div class="col-xl-8 col-lg-7">
                    <div class="position-relative" data-bb-toggle="data-listing">
                        @include($itemsViewPath, ['itemLayout' => $itemLayout, 'itemsPerRow' => $itemLayout === 'grid' ? 2 : 1])
                    </div>
                </div>
            </div>

            {!! apply_filters('ads_render', null, 'listing_page_after') !!}
        </div>
    </section>
</form>
