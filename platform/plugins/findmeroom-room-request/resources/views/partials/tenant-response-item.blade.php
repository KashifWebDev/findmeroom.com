<div class="{{ $wrapperClass ?? 'list-group-item px-0' }}">
    <div class="row">
        <div class="col-md-6 mb-2">
            <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_name') }}</div>
            <div class="fw-medium">{{ $response->owner_name }}</div>
        </div>
        <div class="col-md-6 mb-2">
            <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_phone') }}</div>
            <div><a href="tel:{{ $response->owner_phone }}">{{ $response->owner_phone }}</a></div>
        </div>
        @if ($response->owner_email)
            <div class="col-md-6 mb-2">
                <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_email') }}</div>
                <div><a href="mailto:{{ $response->owner_email }}">{{ $response->owner_email }}</a></div>
            </div>
        @endif
        <div class="col-md-6 mb-2">
            <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.area_text') }}</div>
            <div>{{ $response->area_text }}</div>
        </div>
        <div class="col-md-6 mb-2">
            <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.rent') }}</div>
            <div>Rs {{ number_format($response->rent) }}</div>
        </div>
        @if ($response->room_type)
            <div class="col-md-6 mb-2">
                <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.room_type') }}</div>
                <div>{{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $response->room_type) }}</div>
            </div>
        @endif
        <div class="col-12 mb-2">
            <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.message') }}</div>
            <div>{{ $response->message }}</div>
        </div>
        <div class="col-12 mb-3">
            <div class="text-muted small">{{ trans('plugins/findmeroom-room-request::room-request.account.received_at') }}</div>
            <div>{{ $response->created_at->translatedFormat('M d, Y H:i') }}</div>
        </div>
    </div>

    <details class="tenant-response-report">
        <summary class="btn btn-sm btn-outline-danger mb-2">
            {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.report_response') }}
        </summary>
        <form method="POST" action="{{ $reportAction }}" class="border rounded p-3 bg-light">
            @csrf
            <div class="mb-3">
                <label for="report_reason_{{ $response->getKey() }}" class="form-label">
                    {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.report_reason') }}
                </label>
                <textarea
                    class="form-control"
                    id="report_reason_{{ $response->getKey() }}"
                    name="report_reason"
                    rows="3"
                    maxlength="500"
                    placeholder="{{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.report_reason_placeholder') }}"
                ></textarea>
            </div>
            <button type="submit" class="btn btn-danger btn-sm">
                {{ trans('plugins/findmeroom-room-request::room-request.tenant_actions.report_submit') }}
            </button>
        </form>
    </details>
</div>
