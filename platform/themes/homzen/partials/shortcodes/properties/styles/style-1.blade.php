<section
    class="flat-section flat-property"
    @style(["background-color: $shortcode->background_color" => $shortcode->background_color])
>
    <div class="container">
        {!! Theme::partial('shortcode-heading', ['shortcode' => $shortcode, 'centered' => false]) !!}

        <div class="wrap-property row row-cols-lg-2 g-4">
            <div class="box-left wow fadeInLeftSmall" data-wow-delay=".2s" data-wow-duration="2000ms">
                @php
                    $firstProperty = $properties->first();
                @endphp

                @include(Theme::getThemeNamespace('views.real-estate.properties.item-grid'), ['property' => $firstProperty, 'class' => 'lg'])
            </div>

            <div class="box-right wow fadeInRightSmall" data-wow-delay=".2s" data-wow-duration="2000ms">
                @foreach($properties->skip(1) as $property)
                    @include(Theme::getThemeNamespace('views.real-estate.properties.item-list'))
                @endforeach
            </div>
        </div>
    </div>
</section>
