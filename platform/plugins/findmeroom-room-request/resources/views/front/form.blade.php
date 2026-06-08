@include('plugins/findmeroom-room-request::partials.form-select2-styles')

<section class="flat-section flat-room-request-form">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="box-title text-center mb-4">
                    <h1 class="title">{{ trans('plugins/findmeroom-room-request::room-request.front.form_heading') }}</h1>
                    <p class="desc">{{ trans('plugins/findmeroom-room-request::room-request.front.form_intro') }}</p>
                </div>

                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul class="mb-0">
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form method="POST" action="{{ route('public.room-request.store') }}" class="form-contact">
                    @csrf

                    {{-- Honeypot --}}
                    <div class="d-none" aria-hidden="true">
                        <label for="website">{{ __('Website') }}</label>
                        <input type="text" name="website" id="website" tabindex="-1" autocomplete="off" value="">
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.full_name') }} *</label>
                            <input type="text" class="form-control" id="name" name="name" value="{{ old('name') }}" required maxlength="120">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="public_name" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.public_name') }} *</label>
                            <input type="text" class="form-control" id="public_name" name="public_name" value="{{ old('public_name') }}" required maxlength="80">
                            <small class="text-muted">{{ trans('plugins/findmeroom-room-request::room-request.form.public_name_hint') }}</small>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="phone" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.phone') }} *</label>
                            <input type="tel" class="form-control" id="phone" name="phone" value="{{ old('phone') }}" required maxlength="20" placeholder="03XXXXXXXXX">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.email') }}</label>
                            <input type="email" class="form-control" id="email" name="email" value="{{ old('email') }}" maxlength="120">
                        </div>
                    </div>

                    <div class="row">
                        @include('plugins/findmeroom-room-request::partials.location-fields')
                    </div>

                    <div class="mb-3">
                        <label for="area_text" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.area') }} *</label>
                        <input type="text" class="form-control" id="area_text" name="area_text" value="{{ old('area_text') }}" required maxlength="160" placeholder="{{ trans('plugins/findmeroom-room-request::room-request.form.area_placeholder') }}">
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="budget_min" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.budget_min') }}</label>
                            <input type="number" class="form-control" id="budget_min" name="budget_min" value="{{ old('budget_min') }}" min="0" max="9999999">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="budget_max" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.budget_max') }} *</label>
                            <input type="number" class="form-control" id="budget_max" name="budget_max" value="{{ old('budget_max') }}" required min="1000" max="9999999">
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label for="gender_preference" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.gender_preference') }}</label>
                            <select class="form-control" id="gender_preference" name="gender_preference">
                                @foreach (['any', 'female_only', 'male_only'] as $value)
                                    <option value="{{ $value }}" @selected(old('gender_preference', 'any') === $value)>
                                        {{ trans('plugins/findmeroom-room-request::room-request.options.gender.' . $value) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="room_type" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.room_type') }}</label>
                            <select class="form-control" id="room_type" name="room_type">
                                @foreach (['any', 'single', 'shared'] as $value)
                                    <option value="{{ $value }}" @selected(old('room_type', 'any') === $value)>
                                        {{ trans('plugins/findmeroom-room-request::room-request.options.room_type.' . $value) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label for="tenant_type" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type') }}</label>
                            <select class="form-control" id="tenant_type" name="tenant_type">
                                <option value="">{{ trans('plugins/findmeroom-room-request::room-request.form.tenant_type_select') }}</option>
                                @foreach (['student', 'working', 'family', 'other'] as $value)
                                    <option value="{{ $value }}" @selected(old('tenant_type') === $value)>
                                        {{ trans('plugins/findmeroom-room-request::room-request.options.tenant_type.' . $value) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="nearby_place" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.nearby_place') }}</label>
                            <input type="text" class="form-control" id="nearby_place" name="nearby_place" value="{{ old('nearby_place') }}" maxlength="160">
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="move_in_date" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.move_in_date') }}</label>
                            <input type="date" class="form-control" id="move_in_date" name="move_in_date" value="{{ old('move_in_date') }}" min="{{ date('Y-m-d') }}">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="notes" class="form-label">{{ trans('plugins/findmeroom-room-request::room-request.form.notes') }}</label>
                        <textarea class="form-control" id="notes" name="notes" rows="4" maxlength="1000">{{ old('notes') }}</textarea>
                    </div>

                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="allow_public_phone" name="allow_public_phone" value="1" @checked(old('allow_public_phone'))>
                        <label class="form-check-label" for="allow_public_phone">{{ trans('plugins/findmeroom-room-request::room-request.form.allow_public_phone') }}</label>
                    </div>

                    <button type="submit" class="tf-btn primary">{{ trans('plugins/findmeroom-room-request::room-request.front.submit') }}</button>
                </form>
            </div>
        </div>
    </div>
</section>
