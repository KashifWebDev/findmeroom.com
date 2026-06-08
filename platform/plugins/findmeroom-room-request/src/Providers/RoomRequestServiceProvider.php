<?php

namespace FindMeRoom\RoomRequest\Providers;

use Botble\Base\Facades\DashboardMenu;
use Botble\Base\Supports\ServiceProvider;
use Botble\Base\Traits\LoadAndPublishDataTrait;
use Botble\Theme\Events\ThemeRoutingBeforeEvent;
use FindMeRoom\RoomRequest\Listeners\AttachRoomRequestsOnAccountAuthListener;
use FindMeRoom\RoomRequest\Listeners\RegisterPublicRoomRequestRoutes;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Registered;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\RateLimiter;

class RoomRequestServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        RateLimiter::for('room-request-owner-response', function (Request $request) {
            return Limit::perDay(
                (int) config('plugins.findmeroom-room-request.room-request.owner_response_daily_limit', 10)
            )->by($request->ip());
        });

        $this
            ->setNamespace('plugins/findmeroom-room-request')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions', 'room-request'])
            ->loadRoutes(['web', 'account'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        $this->app->register(CommandServiceProvider::class);

        Event::listen(ThemeRoutingBeforeEvent::class, RegisterPublicRoomRequestRoutes::class);

        Event::listen(Login::class, AttachRoomRequestsOnAccountAuthListener::class);
        Event::listen(Registered::class, AttachRoomRequestsOnAccountAuthListener::class);

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-room-requests',
                    'priority' => 5,
                    'parent_id' => 'cms-plugins-real-estate',
                    'name' => 'plugins/findmeroom-room-request::room-request.menu',
                    'icon' => 'ti ti-home-search',
                    'route' => 'room-requests.index',
                    'permissions' => ['room-requests.index'],
                ]);
        });

        DashboardMenu::for('account')->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-account-room-requests',
                    'priority' => 2.5,
                    'name' => 'plugins/findmeroom-room-request::room-request.account.menu',
                    'url' => fn () => route('public.account.room-requests.index'),
                    'icon' => 'ti ti-home-search',
                ]);
        });
    }
}
