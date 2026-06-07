<?php

namespace Botble\RealEstate\Providers;

use Botble\Base\Events\UpdatedContentEvent;
use Botble\RealEstate\Events\PaymentCompleted;
use Botble\RealEstate\Events\PropertyCreated;
use Botble\RealEstate\Events\PropertyDeleted;
use Botble\RealEstate\Events\PropertyUpdated;
use Botble\RealEstate\Listeners\AddSitemapListener;
use Botble\RealEstate\Listeners\SendWebhookWhenPropertyCreated;
use Botble\RealEstate\Listeners\SendWebhookWhenPropertyDeleted;
use Botble\RealEstate\Listeners\SendWebhookWhenPropertyImagesAdded;
use Botble\RealEstate\Listeners\SendWebhookWhenPropertyUpdated;
use Botble\RealEstate\Listeners\SubscribedPackageListener;
use Botble\RealEstate\Listeners\UpdatedContentListener;
use Botble\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        RenderingSiteMapEvent::class => [
            AddSitemapListener::class,
        ],
        PaymentCompleted::class => [
            SubscribedPackageListener::class,
        ],
        PropertyCreated::class => [
            SendWebhookWhenPropertyCreated::class,
        ],
        PropertyUpdated::class => [
            SendWebhookWhenPropertyUpdated::class,
            SendWebhookWhenPropertyImagesAdded::class,
        ],
        PropertyDeleted::class => [
            SendWebhookWhenPropertyDeleted::class,
        ],
    ];

    public function boot(): void
    {
        if (is_plugin_active('payment')) {
            $this->listen['Botble\\Payment\\Events\\PaymentWebhookReceived'] = [
                SubscribedPackageListener::class,
            ];
        }

        parent::boot();
    }
}
