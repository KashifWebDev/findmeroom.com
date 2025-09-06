<div @class(['widget-price', $class ?? null])>
    <div class="box-title-price">
        <span class="title-price">{{ __('Square Range') }}</span>
        <div class="caption-price">
            <span>{{ __('from') }}</span>
            <span id="slider-range-value01" class="fw-7"></span>
            <span>{{ __('to') }}</span>
            <span id="slider-range-value02" class="fw-7"></span>
        </div>
    </div>
    <div
        id="slider-range2"
        data-min="{{ $minSquare = get_min_square() }}"
        data-max="{{ $maxSquare = get_max_square() }}"
        data-unit="{{ setting('real_estate_square_unit', 'm²') }}"
    ></div>
    <div class="slider-labels">
        <div>
            <input type="hidden" name="min_square" value="{{ BaseHelper::stringify(request()->query('min_square', $minSquare)) }}" />
            <input type="hidden" name="max_square" value="{{ BaseHelper::stringify(request()->query('max_square', $maxSquare)) }}" />
        </div>
    </div>
</div>
