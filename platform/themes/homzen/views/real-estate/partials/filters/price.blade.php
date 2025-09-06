<div @class(['widget-price', $class ?? null]) data-bb-toggle="range" data-min="0" data-max="{{ $maxPrice = get_max_properties_price() }}">
    <div class="box-title-price">
        <span class="title-price">{{ __('Price Range') }}</span>
        <div class="caption-price">
            <span>{{ __('from') }}</span>
            <span data-bb-toggle="range-from-value" class="fw-7"></span>
            <span>{{ __('to') }}</span>
            <span data-bb-toggle="range-to-value" class="fw-7"></span>
        </div>
    </div>
    <div data-bb-toggle="range-slider"></div>
    <div class="slider-labels">
        <div>
            <input type="hidden" data-bb-toggle="min-input" name="min_price" value="{{ BaseHelper::stringify(request()->float('min_price')) }}" />
            <input type="hidden" data-bb-toggle="max-input" name="max_price" value="{{ BaseHelper::stringify(request()->float('max_price', $maxPrice)) }}" />
        </div>
    </div>
</div>
