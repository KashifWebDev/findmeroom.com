<x-core::datagrid>
    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.status') }}</x-slot:title>
        {!! $roomRequest->status->toHtml() !!}
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.is_public') }}</x-slot:title>
        @if ($roomRequest->is_public)
            <span class="badge bg-success">{{ trans('core/base::base.yes') }}</span>
        @else
            <span class="badge bg-secondary">{{ trans('core/base::base.no') }}</span>
        @endif
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.share_slug') }}</x-slot:title>
        @if ($roomRequest->share_slug)
            <code>{{ $roomRequest->share_slug }}</code>
        @else
            <span class="text-muted">—</span>
        @endif
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.expires_at') }}</x-slot:title>
        @if ($roomRequest->expires_at)
            {{ $roomRequest->expires_at->translatedFormat('d M Y H:i:s') }}
        @else
            <span class="text-muted">—</span>
        @endif
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.approved_at') }}</x-slot:title>
        @if ($roomRequest->approved_at)
            {{ $roomRequest->approved_at->translatedFormat('d M Y H:i:s') }}
        @else
            <span class="text-muted">—</span>
        @endif
    </x-core::datagrid.item>

    <x-core::datagrid.item>
        <x-slot:title>{{ trans('plugins/findmeroom-room-request::room-request.tables.approved_by') }}</x-slot:title>
        @if ($roomRequest->approved_by && $roomRequest->approvedBy->getKey())
            {{ $roomRequest->approvedBy->name }}
        @else
            <span class="text-muted">—</span>
        @endif
    </x-core::datagrid.item>
</x-core::datagrid>

@if ($roomRequest->isPending())
    <p class="text-muted small mb-0 mt-3">
        {{ trans('plugins/findmeroom-room-request::room-request.actions.pending_hint') }}
    </p>
@elseif ($roomRequest->isApproved())
    <x-core::alert type="success" class="mt-3 mb-0">
        {{ trans('plugins/findmeroom-room-request::room-request.actions.approved_info') }}
    </x-core::alert>
@elseif ($roomRequest->isRejected())
    <x-core::alert type="warning" class="mt-3 mb-0">
        {{ trans('plugins/findmeroom-room-request::room-request.actions.rejected_info') }}
    </x-core::alert>
@elseif ($roomRequest->isSpam())
    <x-core::alert type="danger" class="mt-3 mb-0">
        {{ trans('plugins/findmeroom-room-request::room-request.actions.spam_info') }}
    </x-core::alert>
@endif
