@php
    $categories = get_property_categories([
        'indent' => '↳',
        'conditions' => ['status' => \Botble\Base\Enums\BaseStatusEnum::PUBLISHED],
    ]);
@endphp

<div class="form-group-3 form-style">
    <label for="category_id">{{ __('Category') }}</label>
    <div class="group-select">
        <select name="category_id" id="category_id" class="select_js">
            <option value="">{{ __('All') }}</option>
            @foreach($categories as $category)
                <option value="{{ $category->getKey() }}"@selected(request()->query('category_id') == $category->getKey())>{{ $category->name }}</option>
            @endforeach
        </select>
    </div>
</div>
