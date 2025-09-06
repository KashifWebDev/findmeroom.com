@php
    $itemsPerRow ??= 3;
@endphp

<div class="row row-cols-1 row-cols-md-{{ $itemsPerRow - 1 }} row-cols-xl-{{ $itemsPerRow }}">
    @foreach($properties as $property)
        <div class="col">
            @include(Theme::getThemeNamespace('views.real-estate.properties.item-grid'))
        </div>
    @endforeach
</div>
