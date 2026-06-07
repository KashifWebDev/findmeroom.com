@php
    // Shared listing-card image renderer.
    //
    // When the theme option `real_estate_enable_swipeable_card_images` is off
    // (default) OR the item has 0-1 images, this renders the exact same
    // `RvMedia::image(...)` call cards used before — so disabling the option
    // produces byte-identical output to the previous version.
    //
    // When enabled and there are 2+ images, renders a Swiper container. The
    // Swiper instance itself is lazy-initialised from script.js on the first
    // pointerenter/touchstart, so listing pages don't pay init cost for 20+
    // cards up front.

    $item ??= null;
    $alt ??= '';
    $size ??= 'medium-rectangle';
    $limit ??= 5;

    $swipeable = theme_option('real_estate_enable_swipeable_card_images', 'no') === 'yes';
    $images = $swipeable && $item ? array_values(array_filter((array) $item->images)) : [];
    $images = array_slice($images, 0, max(1, (int) $limit));
@endphp

@if (count($images) < 2)
    {{ RvMedia::image($item?->image, $alt, $size) }}
@else
    <div class="card-image-slider swiper" data-swipe-init="false">
        <div class="swiper-wrapper">
            @foreach ($images as $index => $path)
                <div class="swiper-slide">
                    <img
                        src="{{ RvMedia::getImageUrl($path, $size, false, RvMedia::getDefaultImage()) }}"
                        alt="{{ $alt }}"
                        @if ($index === 0)
                            loading="eager"
                            fetchpriority="high"
                        @else
                            loading="lazy"
                            decoding="async"
                        @endif
                    >
                </div>
            @endforeach
        </div>
        <div class="swiper-pagination"></div>
        <button type="button" class="swiper-button-prev" aria-label="{{ __('Previous image') }}"></button>
        <button type="button" class="swiper-button-next" aria-label="{{ __('Next image') }}"></button>
    </div>
@endif
