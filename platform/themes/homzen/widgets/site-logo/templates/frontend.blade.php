@php
    // The `lazy` argument was added to Theme::getLogoImage() in core 7.6.7.
    // Older cores throw "Unknown named parameter $lazy" (fatal 500), so only
    // pass it when the running core actually supports it. On older cores the
    // footer logo simply loads eagerly instead of breaking the page.
    $logoArguments = ['logoKey' => 'logo_light', 'maxHeight' => 44];

    if (collect((new ReflectionMethod(Theme::getFacadeRoot(), 'getLogoImage'))->getParameters())
        ->contains(fn ($parameter) => $parameter->getName() === 'lazy')) {
        $logoArguments['lazy'] = true;
    }
@endphp
<div class="footer-logo">
    <a href="{{ BaseHelper::getHomepageUrl() }}">
        {{ Theme::getLogoImage(...$logoArguments) }}
    </a>
</div>
