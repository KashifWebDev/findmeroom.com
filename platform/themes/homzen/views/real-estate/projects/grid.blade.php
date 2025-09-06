@php
    $itemsPerRow ??= 3;
@endphp

<div class="row row-cols-1 row-cols-md-{{ $itemsPerRow - 1 }} row-cols-xl-{{ $itemsPerRow }}">
    @foreach($projects as $project)
        <div class="col">
            @include(Theme::getThemeNamespace('views.real-estate.projects.item-grid'))
        </div>
    @endforeach
</div>
