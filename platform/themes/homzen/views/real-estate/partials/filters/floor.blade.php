<div @class(['box-select',  $class ?? null])>
<label for="floor" class="title-select fw-5">{{ __('Floors') }}</label>
    <select name="floor" id="floor" class="select_js">
        <option value="">{{ __('All') }}</option>
        @foreach(range(1, 5) as $i)
            <option value="{{ $i }}">
                @if($i < 5)
                    {{ $i === 1 ? __('1 Floor') : __(':number Floors', ['number' => $i]) }}
                @else
                    {{ __(':number+ Floors', ['number' => $i]) }}
                @endif
            </option>
        @endforeach
    </select>
</div>
