<div class="card border mb-4" id="owner-response-form">
    <div class="card-body">
        <div class="box-title mb-4">
            <h2 class="title h4">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.heading') }}</h2>
            <p class="desc text-muted mb-0">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.intro') }}</p>
        </div>

        <form method="POST" action="{{ route('public.room-request.respond', ['slug' => $roomRequest->share_slug]) }}" class="form-contact">
            @csrf

            <div class="d-none" aria-hidden="true">
                <label for="owner_website">{{ __('Website') }}</label>
                <input type="text" name="website" id="owner_website" tabindex="-1" autocomplete="off" value="">
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="owner_name" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_name') }} *</label>
                    <input type="text" class="form-control" id="owner_name" name="owner_name" value="{{ old('owner_name') }}" required maxlength="120">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="owner_phone" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_phone') }} *</label>
                    <input type="text" class="form-control" id="owner_phone" name="owner_phone" value="{{ old('owner_phone') }}" required maxlength="20" placeholder="03XXXXXXXXX">
                </div>
            </div>

            <div class="mb-3">
                <label for="owner_email" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.owner_email') }}</label>
                <input type="email" class="form-control" id="owner_email" name="owner_email" value="{{ old('owner_email') }}" maxlength="120">
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="owner_area_text" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.area_text') }} *</label>
                    <input type="text" class="form-control" id="owner_area_text" name="area_text" value="{{ old('area_text') }}" required maxlength="160" placeholder="{{ trans('plugins/findmeroom-room-request::room-request.form.area_placeholder') }}">
                </div>
                <div class="col-md-6 mb-3">
                    <label for="owner_rent" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.rent') }} *</label>
                    <input type="number" class="form-control" id="owner_rent" name="rent" value="{{ old('rent') }}" required min="1" max="9999999" step="1">
                </div>
            </div>

            <div class="mb-3">
                <label for="owner_room_type" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.room_type') }}</label>
                <select class="form-select" id="owner_room_type" name="room_type">
                    <option value="">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.room_type_select') }}</option>
                    @foreach (['single', 'shared', 'any'] as $value)
                        <option value="{{ $value }}" @selected(old('room_type') === $value)>
                            {{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $value) }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label for="owner_message" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.message') }} *</label>
                <textarea class="form-control" id="owner_message" name="message" rows="4" required maxlength="2000">{{ old('message') }}</textarea>
            </div>

            <button type="submit" class="tf-btn primary">{{ trans('plugins/findmeroom-room-request::room-request.owner_response.submit') }}</button>
        </form>
    </div>
</div>
