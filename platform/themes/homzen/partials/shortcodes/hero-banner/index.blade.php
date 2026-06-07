@php
    $style = in_array($shortcode->style, range(1, 5)) ? $shortcode->style : 1;

    if (in_array($style, [1, 3])) {
        $heroPreloadImage = $shortcode->background_image ?: $shortcode->slider_image_1;

        if ($heroPreloadImage) {
            add_filter(THEME_FRONT_HEADER, function (?string $html) use ($heroPreloadImage): string {
                $imageUrl = RvMedia::getImageUrl($heroPreloadImage);

                return $html . '<link rel="preload" href="' . e($imageUrl) . '" as="image" fetchpriority="high">';
            });
        }
    }
@endphp

@include(Theme::getThemeNamespace("partials.shortcodes.hero-banner.styles.style-$style"))
