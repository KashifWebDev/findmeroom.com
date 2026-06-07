@php
    Theme::layout('full-width');
    Theme::set('pageTitle', __('Properties'));
@endphp

@if (Theme::get('breadcrumbEnabled', 'yes') !== 'yes' || Theme::get('breadcrumbStyle', 'default') === 'without-title')
    <h1 class="d-none">{{ __('Properties') }}</h1>
@endif

@include(Theme::getThemeNamespace('views.real-estate.partials.listing'), [
    'actionUrl' => $actionUrl ?? RealEstateHelper::getPropertiesListPageUrl(),
    'ajaxUrl' => $ajaxUrl ?? route('public.properties'),
    'mapUrl' => $mapUrl ?? route('public.ajax.properties.map-all'),
    'itemLayout' => request()->input('layout', 'grid'),
    'layout' => theme_option('real_estate_property_listing_layout', 'top-map'),
    'perPages' => RealEstateHelper::getPropertiesPerPageList(),
    'filterViewPath' => Theme::getThemeNamespace('views.real-estate.partials.filters.property-search-box'),
    'itemsViewPath' => Theme::getThemeNamespace('views.real-estate.properties.index'),
])

@include(Theme::getThemeNamespace('views.real-estate.partials.property-map-content'))
