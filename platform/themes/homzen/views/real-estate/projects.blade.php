@php
    Theme::layout('full-width');
    Theme::set('pageTitle', __('Projects'));
@endphp

@if (Theme::get('breadcrumbEnabled', 'yes') !== 'yes' || Theme::get('breadcrumbStyle', 'default') === 'without-title')
    <h1 class="d-none">{{ __('Projects') }}</h1>
@endif

@include(Theme::getThemeNamespace('views.real-estate.partials.listing'), [
    'actionUrl' => $actionUrl ?? RealEstateHelper::getProjectsListPageUrl(),
    'ajaxUrl' => $ajaxUrl ?? route('public.projects'),
    'mapUrl' => $mapUrl ?? route('public.ajax.projects.map-all'),
    'perPages' => RealEstateHelper::getProjectsPerPageList(),
    'itemLayout' => request()->query('layout', 'grid'),
    'layout' => theme_option('real_estate_project_listing_layout', 'top-map'),
    'filterViewPath' => Theme::getThemeNamespace('views.real-estate.partials.filters.project-search-box'),
    'itemsViewPath' => Theme::getThemeNamespace('views.real-estate.projects.index'),
])

@include(Theme::getThemeNamespace('views.real-estate.partials.project-map-content'))
