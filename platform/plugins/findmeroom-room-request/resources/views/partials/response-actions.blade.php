<div class="d-grid gap-2">
  <x-core::button
      type="button"
      color="success"
      icon="ti ti-eye"
      data-bs-toggle="modal"
      data-bs-target="#visible-room-request-response-modal"
      class="w-100"
  >
      {{ trans('plugins/findmeroom-room-request::room-request.responses.actions.visible') }}
  </x-core::button>

  <x-core::button
      type="button"
      color="warning"
      icon="ti ti-x"
      data-bs-toggle="modal"
      data-bs-target="#reject-room-request-response-modal"
      class="w-100"
  >
      {{ trans('plugins/findmeroom-room-request::room-request.responses.actions.reject') }}
  </x-core::button>

  <x-core::button
      type="button"
      color="danger"
      icon="ti ti-ban"
      data-bs-toggle="modal"
      data-bs-target="#spam-room-request-response-modal"
      class="w-100"
  >
      {{ trans('plugins/findmeroom-room-request::room-request.responses.actions.spam') }}
  </x-core::button>
</div>
