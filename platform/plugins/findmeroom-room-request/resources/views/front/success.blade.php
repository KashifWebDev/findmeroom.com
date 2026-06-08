<section class="flat-section flat-room-request-success">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="box-title mb-4">
                    <h1 class="title">{{ trans('plugins/findmeroom-room-request::room-request.front.success_heading') }}</h1>
                    <p class="desc">{{ trans('plugins/findmeroom-room-request::room-request.front.success_message') }}</p>
                </div>

                @if (! empty($manageUrl) && ! ($isAccountUser ?? false))
                    <div class="alert alert-info text-start mb-4" role="status">
                        <p class="mb-2 fw-semibold">{{ trans('plugins/findmeroom-room-request::room-request.front.manage_link_heading') }}</p>
                        <p class="mb-2 small">{{ trans('plugins/findmeroom-room-request::room-request.front.manage_link_hint') }}</p>
                        <code class="d-block text-break user-select-all">{{ $manageUrl }}</code>
                    </div>
                @endif

                <a href="{{ route('public.room-request.create') }}" class="tf-btn primary me-2">
                    {{ trans('plugins/findmeroom-room-request::room-request.front.post_another') }}
                </a>
                <a href="{{ url('/properties') }}" class="tf-btn btn-line">
                    {{ trans('plugins/findmeroom-room-request::room-request.front.find_a_room') }}
                </a>
            </div>
        </div>
    </div>
</section>
