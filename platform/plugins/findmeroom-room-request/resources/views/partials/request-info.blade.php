<x-core::datagrid>
    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.full_name') }}</x-slot:title>
        {{ $roomRequest->name }}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.public_name') }}</x-slot:title>
        {{ $roomRequest->public_name }}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.phone') }}</x-slot:title>
        <a href="tel:{{ $roomRequest->phone }}">{{ $roomRequest->phone }}</a>
    </x-core::datagrid.item>

    @if ($roomRequest->email)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.email') }}</x-slot:title>
            {{ Html::mailto($roomRequest->email) }}
        </x-core::datagrid.item>
    @endif

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.location') }}</x-slot:title>
        {{ $roomRequest->displayLocation() }}
    </x-core::datagrid.item>

    @if ($roomRequest->city_text && $roomRequest->city_id && $roomRequest->city_text !== $roomRequest->displayCity())
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.city_text') }}</x-slot:title>
            {{ $roomRequest->city_text }}
        </x-core::datagrid.item>
    @elseif (! $roomRequest->city_id && $roomRequest->city_text)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.city_text') }}</x-slot:title>
            {{ $roomRequest->city_text }}
        </x-core::datagrid.item>
    @endif

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.area') }}</x-slot:title>
        {{ $roomRequest->area_text }}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.budget') }}</x-slot:title>
        @if ($roomRequest->budget_min)
            Rs {{ number_format($roomRequest->budget_min) }} – Rs {{ number_format($roomRequest->budget_max) }}
        @else
            Up to Rs {{ number_format($roomRequest->budget_max) }}
        @endif
    </x-core::datagrid.item>

    @if ($roomRequest->gender_preference)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.gender_preference') }}</x-slot:title>
            {{ trans('plugins/findmeroom-room-request::room-request.options.gender.' . $roomRequest->gender_preference) }}
        </x-core::datagrid.item>
    @endif

    @if ($roomRequest->room_type)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}</x-slot:title>
            {{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $roomRequest->room_type) }}
        </x-core::datagrid.item>
    @endif

    @if ($roomRequest->tenant_type)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}</x-slot:title>
            {{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $roomRequest->tenant_type) }}
        </x-core::datagrid.item>
    @endif

    @if ($roomRequest->nearby_place)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.nearby_place') }}</x-slot:title>
            {{ $roomRequest->nearby_place }}
        </x-core::datagrid.item>
    @endif

    @if ($roomRequest->move_in_date)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.move_in_date') }}</x-slot:title>
            {{ $roomRequest->move_in_date->format('Y-m-d') }}
        </x-core::datagrid.item>
    @endif

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.allow_public_phone') }}</x-slot:title>
        {{ $roomRequest->allow_public_phone ? trans('core/base::base.yes') : trans('core/base::base.no') }}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.created_at') }}</x-slot:title>
        {{ $roomRequest->created_at->translatedFormat('d M Y H:i:s') }}
    </x-core::datagrid.item>
</x-core::datagrid>

@if ($roomRequest->notes)
    <x-core::datagrid.item class="mt-3">
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.form.notes') }}</x-slot:title>
        {{ $roomRequest->notes }}
    </x-core::datagrid.item>
@endif
