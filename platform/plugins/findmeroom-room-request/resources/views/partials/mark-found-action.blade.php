@if ($roomRequest->isFound())
    <div class="alert alert-success mb-0" role="status">
        {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.mark_found_done') }}
    </div>
@elseif ($roomRequest->canBeMarkedFound())
    <form
        method="POST"
        action="{{ $action }}"
        onsubmit="return confirm(@js(trans('plugins/findmeroom-room-request::room-request.tenant_actions.mark_found_confirm')))"
    >
        @csrf
        <button type="submit" class="btn btn-warning">
            {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.mark_found') }}
        </button>
    </form>
@endif
