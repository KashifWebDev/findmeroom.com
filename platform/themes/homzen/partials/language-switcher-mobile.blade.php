@if (is_plugin_active('language'))
    @php
        $supportedLocales = Language::getSupportedLocales();
        $languageDisplay = setting('language_display', 'all');
        $currentLocale = Language::getCurrentLocale();
    @endphp

    @if ($supportedLocales && count($supportedLocales) > 1)
        <div>{{ __('Language') }}</div>
        <div class="language-list-mobile">
            @foreach ($supportedLocales as $localeCode => $properties)
                <a @class(['language-item', 'active' => $localeCode === $currentLocale]) href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}">
                    @if ($languageDisplay == 'all' || $languageDisplay == 'flag')
                        <span class="language-flag">{!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}</span>
                    @endif
                    @if ($languageDisplay == 'all' || $languageDisplay == 'name')
                        <span class="language-name">{{ $properties['lang_name'] }}</span>
                    @endif
                </a>
            @endforeach
        </div>
    @endif
@endif
