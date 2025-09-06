@if ($videoUrl = $property->getMetaData('video_url', true))
    <div @class(['single-property-video', $class ?? null])>
        <div class="h7 title fw-7">{{ __('Video') }}</div>
        <div class="img-video">
            <img src="{{ RvMedia::getImageUrl($property->getMetaData('video_thumbnail', true)) ?: \Botble\Theme\Supports\Youtube::getThumbnail($videoUrl) }}" alt="{{ $property->name }}">
            <a href="{{ $videoUrl }}" @if(\Botble\Theme\Supports\Youtube::isYoutubeURL($videoUrl)) data-fancybox="gallery2" @endif class="btn-video">
                <x-core::icon name="ti ti-player-play-filled" />
            </a>
        </div>
    </div>
@endif
