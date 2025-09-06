<div class="bg-surface top-header">
    <div class="top-header-left">
        @if($hotline = theme_option('hotline'))
            <div class="top-header-item">
                <x-core::icon name="ti ti-phone" style="width: 1.25rem; height: 1.25rem" />
                <a href="tel:{{ $hotline }}">{{ $hotline }}</a>
            </div>
        @endif
        @if($email = theme_option('email'))
            <div class="top-header-item">
                <x-core::icon name="ti ti-mail" style="width: 1.25rem; height: 1.25rem" />
                <a href="mailto:{{ $email }}">{{ $email }}</a>
            </div>
        @endif
    </div>

    <div class="top-header-right">
        <a href="{{ route('public.wishlist') }}">
            {{ __('My Wishlist') }}
            (<span data-bb-toggle="wishlist-count" class="fw-medium">0</span>)
        </a>
        {!! Theme::partial('currency-switcher') !!}
        {!! Theme::partial('language-switcher') !!}
        @auth('account')
            <a href="{{ route('public.account.dashboard') }}" class="d-flex gap-2 align-items-center me-3">
                {{ RvMedia::image(auth('account')->user()->avatar_url, auth('account')->user()->name, attributes: ['class' => 'rounded-circle', 'style' => 'width: 22px']) }}
                <span class="text-body-2 fw-semibold">{{ auth('account')->user()->name }}</span>
            </a>
        @else
            <div class="register">
                <ul class="d-flex">
                    <li>
                        <a
                            @if(theme_option('use_modal_for_authentication', true))
                                href="#modalLogin"
                                data-bs-toggle="modal"
                            @else
                                href="{{ route('public.account.login') }}"
                            @endif
                        >
                            {{ __('Login') }}
                        </a>
                    </li>
                    <li>/</li>
                    <li>
                        <a
                            @if(theme_option('use_modal_for_authentication', true))
                                href="#modalRegister"
                            data-bs-toggle="modal"
                            @else
                                href="{{ route('public.account.register') }}"
                            @endif
                        >
                            {{ __('Register') }}
                        </a>
                    </li>
                </ul>
            </div>
        @endauth
    </div>
</div>
