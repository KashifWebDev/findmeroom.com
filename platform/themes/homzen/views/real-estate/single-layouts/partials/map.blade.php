<div @class(['single-property-map', $class ?? null])>
    <div class="h7 title fw-7">{{ __('Map') }}</div>
    @if ($property->latitude && $property->longitude)
        <div data-bb-toggle="detail-map" id="map" style="min-height: 400px;" data-tile-layer="{{ RealEstateHelper::getMapTileLayer() }}" data-center="{{ json_encode([$property->latitude, $property->longitude]) }}" data-map-icon="{{ $property->map_icon }}"></div>
    @else
        <iframe width="100%" style="min-height: 400px" src="https://maps.google.com/maps?q={{ urlencode($property->location) }}%20&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
    @endif
    <ul class="info-map">
        <li>
            <div class="fw-7">{{ __('Address') }}</div>
            <a class="mt-4 text-variant-1" href="https://www.google.com/maps/search/{{ urlencode($property->location) }}">
                {{ $property->location ?: $property->short_address }}
            </a>
        </li>
    </ul>
</div>
