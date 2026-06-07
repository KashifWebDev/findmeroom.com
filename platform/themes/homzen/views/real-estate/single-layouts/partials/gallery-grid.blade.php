@php
    $model = $model ?? $property ?? null;
@endphp

@if ($model->images)
    <section class="flat-gallery-single">
        @foreach((array) $model->images as $image)
            @if($loop->first)
                <a href="{{ RvMedia::getImageUrl($image) }}" data-fancybox="gallery" data-thumb="{{ RvMedia::getImageUrl($image, 'thumb') }}" class="item1 box-img">
                    {{ RvMedia::image($image, $model->name, 'medium-rectangle', attributes: ['fetchpriority' => 'high', 'loading' => 'eager'], lazy: false) }}
                    <div class="box-btn">
                        <span class="tf-btn primary">{{ __('View All Photos (:count)', ['count' => count($model->images)]) }}</span>
                    </div>
                </a>
            @else
                <a href="{{ RvMedia::getImageUrl($image) }}" class="item-{{ $loop->iteration }} box-img" data-fancybox="gallery" data-thumb="{{ RvMedia::getImageUrl($image, 'thumb') }}" @style(['display: none' => $loop->iteration > 5])>
                    {{ RvMedia::image($image, $model->name, 'medium-rectangle', attributes: ['loading' => $loop->iteration <= 5 ? 'eager' : 'lazy'], lazy: $loop->iteration > 5) }}
                </a>
            @endif
        @endforeach
    </section>
@endif
