<?php

namespace Theme\Homzen\Observers;

use Botble\Language\Facades\Language;
use Botble\RealEstate\Models\Project;
use Illuminate\Support\Facades\Cache;

/**
 * Invalidates the no-filter map cache written by HomzenController::ajaxGetAllProjectsForMap().
 *
 * Filtered map keys use a 60s TTL and self-expire, so this observer only targets the
 * long-lived (3600s) no-filter primary key per locale. Triggers on saved/deleted — direct
 * DB::table() writes skip this by design, so imports that bypass Eloquent should call
 * ProjectMapCacheObserver::flush() once at the end of the batch.
 */
class ProjectMapCacheObserver
{
    public function saved(Project $project): void
    {
        self::flush();
    }

    public function deleted(Project $project): void
    {
        self::flush();
    }

    public static function flush(): void
    {
        foreach (self::locales() as $locale) {
            Cache::forget(self::cacheKey($locale));
        }
    }

    protected static function locales(): array
    {
        // HomzenController uses app()->getLocale() in the cache key. The language
        // middleware sets that via App::setLocale($paramLocale), and $paramLocale is
        // validated against Language::getSupportedLocales() whose array keys are
        // lang_locale values (e.g. 'en', 'hu') — not lang_code (e.g. 'en_US', 'hu_HU').
        if (is_plugin_active('language')) {
            $locales = Language::getActiveLanguage(['lang_locale'])->pluck('lang_locale')->filter()->all();

            if (! empty($locales)) {
                return $locales;
            }
        }

        return [app()->getLocale()];
    }

    protected static function cacheKey(string $locale): string
    {
        // Mirror HomzenController::ajaxGetAllProjectsForMap() for the no-filter case.
        // Controller uses $request->only(filterKeys), which returns ONLY present keys,
        // then always adds $filters['keyword'] = $filters['k'] ?? null. For a request
        // with no query params, the resulting payload is literally ['keyword' => null].
        $filters = ['keyword' => null];
        ksort($filters);

        return 'map_all_projects_' . md5(serialize($filters) . $locale);
    }
}
