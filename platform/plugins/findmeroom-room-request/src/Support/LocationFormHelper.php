<?php

namespace FindMeRoom\RoomRequest\Support;

use Botble\Location\Models\City;
use Botble\Location\Models\Country;
use Botble\Location\Models\State;
use Botble\Theme\Facades\Theme;
use Illuminate\Support\Collection;

class LocationFormHelper
{
    public static function isAvailable(): bool
    {
        return is_plugin_active('location');
    }

    public static function registerFrontAssets(): void
    {
        Theme::asset()
            ->usePath(false)
            ->add('room-request-select2-css', [
                'vendor/core/core/base/libraries/select2/css/select2.min.css',
                'vendor/core/core/base/css/libraries/select2.css',
            ]);

        Theme::asset()
            ->container('footer')
            ->usePath(false)
            ->add(
                'room-request-select2-js',
                'vendor/core/core/base/libraries/select2/js/select2.min.js',
                ['jquery']
            );

        Theme::asset()
            ->container('footer')
            ->usePath(false)
            ->add(
                'room-request-location-js',
                'vendor/core/plugins/location/js/location.js',
                ['jquery', 'room-request-select2-js']
            );
    }

    public static function defaultCountryId(): ?int
    {
        if (! static::isAvailable()) {
            return null;
        }

        $pakistan = Country::query()
            ->wherePublished()
            ->where(function ($query): void {
                $query
                    ->where('code', 'PK')
                    ->orWhere('name', 'like', 'Pakistan%');
            })
            ->orderBy('order')
            ->value('id');

        if ($pakistan) {
            return (int) $pakistan;
        }

        return Country::query()
            ->wherePublished()
            ->where('is_default', true)
            ->value('id');
    }

    public static function countries(): Collection
    {
        if (! static::isAvailable()) {
            return collect();
        }

        return Country::query()
            ->wherePublished()
            ->orderByDesc('is_default')
            ->orderBy('order')
            ->orderBy('name')
            ->pluck('name', 'id');
    }

    public static function statesForCountry(?int $countryId): Collection
    {
        if (! static::isAvailable() || ! $countryId) {
            return collect();
        }

        return State::query()
            ->wherePublished()
            ->where('country_id', $countryId)
            ->orderBy('order')
            ->orderBy('name')
            ->pluck('name', 'id');
    }

    public static function citiesForState(?int $stateId): Collection
    {
        if (! static::isAvailable() || ! $stateId) {
            return collect();
        }

        return City::query()
            ->wherePublished()
            ->where('state_id', $stateId)
            ->orderBy('order')
            ->orderBy('name')
            ->pluck('name', 'id');
    }

    public static function resolveCityText(
        ?int $cityId,
        ?string $cityText,
        ?int $stateId = null,
        ?int $countryId = null
    ): string {
        if ($cityId && static::isAvailable()) {
            $city = City::query()->find($cityId);

            if ($city) {
                return $city->name;
            }
        }

        return trim((string) $cityText);
    }

    public static function filterStates(?int $countryId = null): Collection
    {
        $countryId = $countryId ?: static::defaultCountryId();

        return static::statesForCountry($countryId);
    }

    public static function filterCities(?int $stateId): Collection
    {
        return static::citiesForState($stateId);
    }
}
