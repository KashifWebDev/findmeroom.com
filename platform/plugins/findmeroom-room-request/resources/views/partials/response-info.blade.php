<x-core::datagrid>
    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.responses.tables.request') }}</x-slot:title>
        @if ($response->roomRequest)
            <a href="{{ route('room-requests.edit', $response->roomRequest->getKey()) }}">
                {{ $response->roomRequest->public_name }} (#{{ $response->roomRequest->getKey() }})
            </a>
        @else
            —
        @endif
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_name') }}</x-slot:title>
        {{ $response->owner_name }}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_phone') }}</x-slot:title>
        <a href="tel:{{ $response->owner_phone }}">{{ $response->owner_phone }}</a>
    </x-core::datagrid.item>

    @if ($response->owner_email)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_email') }}</x-slot:title>
            {{ Html::mailto($response->owner_email) }}
        </x-core::datagrid.item>
    @endif

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.rent') }}</x-slot:title>
        Rs {{ number_format($response->rent) }}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.area_text') }}</x-slot:title>
        {{ $response->area_text }}
    </x-core::datagrid.item>

    @if ($response->room_type)
        <x-core::datagrid.item>
            <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.room_type') }}</x-slot:title>
            {{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $response->room_type) }}
        </x-core::datagrid.item>
    @endif

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.created_at') }}</x-slot:title>
        {{ $response->created_at->translatedFormat('d M Y H:i:s') }}
    </x-core::datagrid.item>
</x-core::datagrid>

@if ($response->message)
    <x-core::datagrid.item class="mt-3">
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.owner_response.message') }}</x-slot:title>
        {{ $response->message }}
    </x-core::datagrid.item>
@endif
