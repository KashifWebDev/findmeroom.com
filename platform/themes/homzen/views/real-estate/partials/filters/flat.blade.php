<div @class(['widget-price', $class ?? null])>
    <div class="box-title-price">
        <span class="title-price">{{ __('Flat Range') }}</span>
        <div class="caption-price">
            <span>{{ __('from') }}</span>
            <span id="slider-flat-value01" class="fw-7"></span>
            <span>{{ __('to') }}</span>
            <span id="slider-flat-value02" class="fw-7"></span>
        </div>
    </div>
    <div id="slider-flat" data-min="{{ $minFlat = get_min_flat() }}" data-max="{{ $maxFlat = get_max_flat() }}"></div>
    <div class="slider-labels">
        <div>
            <input type="hidden" name="min_flat" value="{{ BaseHelper::stringify(request()->query('min_flat', $minFlat)) }}" />
            <input type="hidden" name="max_flat" value="{{ BaseHelper::stringify(request()->query('max_flat', $maxFlat)) }}" />
        </div>
    </div>
</div>
