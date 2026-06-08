<section class="flat-section flat-room-requests-board">
    <div class="container">
        <div class="box-title text-center mb-4">
            <h1 class="title">{{ trans('plugins/findmeroom-room-request::room-request.board.heading') }}</h1>
            <p class="desc">{{ trans('plugins/findmeroom-room-request::room-request.board.intro') }}</p>
        </div>

        @include('plugins/findmeroom-room-request::partials.board-filters')

        @if ($requests->isEmpty())
            <div class="alert alert-info text-center">
                {{ trans('plugins/findmeroom-room-request::room-request.board.empty') }}
            </div>
            <div class="text-center">
                <a href="{{ route('public.room-request.create') }}" class="tf-btn primary">
                    {{ trans('plugins/findmeroom-room-request::room-request.board.post_need') }}
                </a>
            </div>
        @else
            <div class="row">
                @foreach ($requests as $request)
                    @include('plugins/findmeroom-room-request::partials.request-card', ['request' => $request])
                @endforeach
            </div>

            <nav class="d-flex justify-content-center pt-3">
                {!! $requests->links() !!}
            </nav>
        @endif

        <div class="text-center mt-4">
            <a href="{{ route('public.room-request.create') }}" class="tf-btn btn-line me-2">
                {{ trans('plugins/findmeroom-room-request::room-request.board.post_need') }}
            </a>
            <a href="{{ url('/properties') }}" class="tf-btn btn-line">
                {{ trans('plugins/findmeroom-room-request::room-request.front.find_a_room') }}
            </a>
        </div>
    </div>
</section>
