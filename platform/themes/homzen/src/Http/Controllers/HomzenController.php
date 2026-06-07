<?php

namespace Theme\Homzen\Http\Controllers;

use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Language\Facades\Language;
use Botble\Location\Models\City;
use Botble\Location\Repositories\Interfaces\CityInterface;
use Botble\Media\Facades\RvMedia;
use Botble\RealEstate\Enums\PropertyTypeEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Models\Currency;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Repositories\Interfaces\ProjectInterface;
use Botble\RealEstate\Repositories\Interfaces\PropertyInterface;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\Theme\Facades\Theme;
use Botble\Theme\Http\Controllers\PublicController;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Cache;
use Illuminate\Validation\Rule;
use Theme\Homzen\Actions\GetProjectsAction;
use Theme\Homzen\Actions\GetPropertiesAction;
use Theme\Homzen\Http\Resources\ProjectResource;
use Theme\Homzen\Http\Resources\PropertyResource;

class HomzenController extends PublicController
{
    public function ajaxGetProperties(Request $request, GetPropertiesAction $getPropertiesAction): BaseHttpResponse
    {
        $request->validate([
            'type' => ['nullable', Rule::in(PropertyTypeEnum::values())],
            'limit' => ['required', 'integer'],
            'is_featured' => ['boolean'],
            'category_id' => ['nullable', 'string'],
            'category_ids' => ['nullable', 'array'],
        ]);

        $cacheKey = 'ajax_properties_' . md5(serialize($request->only([
            'type', 'limit', 'is_featured', 'category_id', 'category_ids',
        ])) . app()->getLocale());

        $html = Cache::remember($cacheKey, 600, function () use ($request, $getPropertiesAction) {
            $properties = $getPropertiesAction->handle(
                $request->integer('limit', 6),
                $request->input('category_id'),
                $request->string('type'),
                $request->boolean('is_featured'),
                (array) $request->input('category_ids', [])
            );

            return view(
                Theme::getThemeNamespace('views.real-estate.properties.index'),
                ['properties' => $properties, 'itemsPerRow' => 3]
            )->render();
        });

        return $this->httpResponse()->setData($html);
    }

    public function ajaxGetPropertiesForMap(Request $request): JsonResource
    {
        $validated = $request->validate([
            'k' => ['nullable', 'string'],
            'type' => ['nullable', Rule::in(PropertyTypeEnum::values())],
            'bedroom' => ['nullable'],
            'bathroom' => ['nullable'],
            'floor' => ['nullable'],
            'min_price' => ['nullable', 'numeric'],
            'max_price' => ['nullable', 'numeric'],
            'min_square' => ['nullable', 'numeric'],
            'max_square' => ['nullable', 'numeric'],
            'project' => ['nullable', 'string'],
            'category_id' => ['nullable', 'string'],
            'city' => ['nullable', 'string'],
            'city_id' => ['nullable', 'integer'],
            'state' => ['nullable', 'string'],
            'state_id' => ['nullable', 'integer'],
            'location' => ['nullable', 'string'],
        ]);

        $validated['keyword'] = $validated['k'] ?? null;

        $params = [
            'with' => RealEstateHelper::getPropertyRelationsQuery(),
            'paginate' => [
                'per_page' => 20,
                'current_paged' => $request->integer('page', 1),
            ],
        ];

        $properties = app(PropertyInterface::class)->getProperties($validated, $params);

        return $this
            ->httpResponse()
            ->setData(PropertyResource::collection($properties))
            ->toApiResponse();
    }

    public function ajaxGetProjects(Request $request, GetProjectsAction $getProjectsAction): BaseHttpResponse
    {
        if (! RealEstateHelper::isEnabledProjects()) {
            return $this->httpResponse()->setData([]);
        }

        $request->validate([
            'limit' => ['required', 'integer'],
            'is_featured' => ['boolean'],
            'category_id' => ['nullable', 'string'],
            'category_ids' => ['nullable', 'array'],
        ]);

        $cacheKey = 'ajax_projects_' . md5(serialize($request->only([
            'limit', 'is_featured', 'category_id', 'category_ids',
        ])) . app()->getLocale());

        $html = Cache::remember($cacheKey, 600, function () use ($request, $getProjectsAction) {
            $projects = $getProjectsAction->handle(
                $request->integer('limit', 6),
                $request->input('category_id'),
                $request->boolean('is_featured'),
                (array) $request->input('category_ids', [])
            );

            return view(
                Theme::getThemeNamespace('views.real-estate.projects.grid'),
                compact('projects')
            )->render();
        });

        return $this->httpResponse()->setData($html);
    }

    public function ajaxSearchProjects(Request $request): BaseHttpResponse
    {
        $request->validate([
            'k' => ['nullable', 'string'],
        ]);

        $projects = Project::query()
            ->when($request->filled('k'), function (Builder $query) use ($request): void {
                $keyword = $request->input('k');

                if (is_plugin_active('language') && is_plugin_active('language-advanced') && Language::getCurrentLocale() != Language::getDefaultLocale()) {
                    $query->whereHas('translations', function ($q) use ($keyword): void {
                        $q->where('name', 'LIKE', '%' . $keyword . '%');
                    });
                } else {
                    $query->where('name', 'LIKE', '%' . $keyword . '%');
                }
            })
            ->select(['id', 'name'])
            ->take(10)
            ->oldest('name')
            ->get();

        return $this
            ->httpResponse()
            ->setData(view(
                Theme::getThemeNamespace('views.real-estate.partials.filters.projects-suggestion'),
                compact('projects')
            )->render());
    }

    public function ajaxGetProjectsForMap(Request $request, ProjectInterface $projectRepository)
    {
        $filters = $request->only($this->getProjectFilterKeys());
        $filters['keyword'] = $filters['k'] ?? null;

        ksort($filters);

        $page = $request->integer('page', 1);
        $cacheKey = 'ajax_projects_map_' . md5(serialize($filters) . $page . app()->getLocale());

        $data = Cache::remember($cacheKey, 300, function () use ($filters, $page, $projectRepository) {
            $params = [
                'with' => $this->getProjectMapRelations(),
                'paginate' => [
                    'per_page' => 20,
                    'current_paged' => $page,
                ],
            ];

            return ProjectResource::collection($projectRepository->getProjects($filters, $params));
        });

        return $this
            ->httpResponse()
            ->setData($data)
            ->toApiResponse();
    }

    protected function getProjectFilterKeys(): array
    {
        return [
            'k',
            'category_id',
            'category_ids',
            'city',
            'city_id',
            'state',
            'state_id',
            'location',
            'zip_code',
            'min_price',
            'max_price',
            'min_floor',
            'max_floor',
            'floor',
            'blocks',
            'min_flat',
            'max_flat',
            'features',
            'sort_by',
        ];
    }

    protected function getProjectMapRelations(): array
    {
        $relations = [
            'slugable:id,key,prefix,reference_id',
            'currency:id,is_default,exchange_rate,symbol,title,is_prefix_symbol,decimals,space_between_price_and_currency,number_format_style',
        ];

        if (is_plugin_active('location')) {
            $relations[] = 'city:id,name';
            $relations[] = 'state:id,name';
        }

        return $relations;
    }

    public function ajaxGetAllPropertiesForMap(Request $request): BaseHttpResponse
    {
        $validated = $request->validate([
            'k' => ['nullable', 'string'],
            'type' => ['nullable', Rule::in(PropertyTypeEnum::values())],
            'bedroom' => ['nullable'],
            'bathroom' => ['nullable'],
            'floor' => ['nullable'],
            'min_price' => ['nullable', 'numeric'],
            'max_price' => ['nullable', 'numeric'],
            'min_square' => ['nullable', 'numeric'],
            'max_square' => ['nullable', 'numeric'],
            'project' => ['nullable', 'string'],
            'category_id' => ['nullable', 'string'],
            'city' => ['nullable', 'string'],
            'city_id' => ['nullable', 'integer'],
            'state' => ['nullable', 'string'],
            'state_id' => ['nullable', 'integer'],
            'location' => ['nullable', 'string'],
        ]);

        $validated['keyword'] = $validated['k'] ?? null;

        $hasFilters = collect($validated)->filter()->isNotEmpty();
        $cacheKey = 'map_all_properties_' . md5(serialize($validated) . app()->getLocale());
        $cacheTtl = $hasFilters ? 60 : 300;

        $data = Cache::remember($cacheKey, $cacheTtl, function () use ($validated) {
            $params = [
                'with' => RealEstateHelper::getPropertyRelationsQuery(),
                'paginate' => [
                    'per_page' => 10000,
                    'current_paged' => 1,
                ],
            ];

            return PropertyResource::collection(
                app(PropertyInterface::class)->getProperties($validated, $params)
            )->resolve();
        });

        return $this->httpResponse()->setData($data);
    }

    public function ajaxGetAllProjectsForMap(Request $request, ProjectInterface $projectRepository): BaseHttpResponse
    {
        $filters = $request->only($this->getProjectFilterKeys());
        $filters['keyword'] = $filters['k'] ?? null;

        ksort($filters);

        $hasFilters = collect($filters)->filter()->isNotEmpty();
        $cacheKey = 'map_all_projects_' . md5(serialize($filters) . app()->getLocale());
        $cacheTtl = $hasFilters ? 60 : 3600;

        $data = Cache::remember($cacheKey, $cacheTtl, function () use ($filters, $projectRepository) {
            $params = [
                'with' => $this->getProjectMapRelations(),
                'paginate' => [
                    'per_page' => 10000,
                    'current_paged' => 1,
                ],
            ];

            return $this->buildProjectMapPayload(
                $projectRepository->getProjects($filters, $params)
            );
        });

        return $this->httpResponse()->setData($data);
    }

    /**
     * Serialize projects for the map endpoint without JsonResource overhead.
     *
     * Hoists per-request invariants out of the loop (setting/plugin/default-image lookups,
     * application currency, format_price settings, translation labels become O(1) instead
     * of O(n)). Memoizes status HTML by enum value (max 5 variants), formatted prices by
     * (price, currency_id), image URLs by path, and resolved locations by (city_id, state_id)
     * since real-estate datasets cluster on a small set of distinct values. Produces the
     * same field shape as ProjectResource.
     */
    protected function buildProjectMapPayload(iterable $projects): array
    {
        $hidePrice = (bool) setting('real_estate_hide_price', false);
        $locationActive = is_plugin_active('location');
        $defaultImage = RvMedia::getDefaultImage();

        // Hoist every input format_price()/human_price_text() would read per call.
        // Stock format_price does 4 setting() lookups + get_application_currency()
        // per invocation. At 429 rows x 2 prices that's ~3,400 setting calls — each
        // cheap but collectively expensive. Resolve once and pass explicitly.
        $appCurrency = $hidePrice ? null : get_application_currency();
        $hideSymbol = ! $hidePrice && (bool) setting('real_estate_hide_currency_symbol', false);
        $convertToText = ! $hidePrice && (bool) setting('real_estate_convert_money_to_text_enabled', false);
        $decimalSeparator = setting('real_estate_decimal_separator', '.');
        $thousandSeparator = setting('real_estate_thousands_separator', ',');
        if ($decimalSeparator === 'space') {
            $decimalSeparator = ' ';
        }
        if ($thousandSeparator === 'space') {
            $thousandSeparator = ' ';
        }
        $millionLabel = $convertToText ? trans('plugins/real-estate::general.million') : '';
        $billionLabel = $convertToText ? trans('plugins/real-estate::general.billion') : '';

        $statusHtmlCache = [];
        $priceCache = [];
        $imageUrlCache = [];
        $locationCache = [];

        $items = [];

        foreach ($projects as $project) {
            if (! $project->latitude || ! $project->longitude) {
                continue;
            }

            $statusKey = $project->status?->value ?? (string) $project->status;
            if (! array_key_exists($statusKey, $statusHtmlCache)) {
                $statusHtmlCache[$statusKey] = $project->status?->toHtml() ?? '';
            }

            $priceText = '';
            if (! $hidePrice) {
                $currency = $project->currency;
                $currencyKey = $currency?->getKey() ?? 0;

                if ($project->price_from) {
                    $fromKey = $project->price_from . '|' . $currencyKey;
                    if (! array_key_exists($fromKey, $priceCache)) {
                        $priceCache[$fromKey] = $this->formatMapPrice(
                            $project->price_from,
                            $currency,
                            $appCurrency,
                            $hideSymbol,
                            $convertToText,
                            $decimalSeparator,
                            $thousandSeparator,
                            $millionLabel,
                            $billionLabel
                        );
                    }
                    $priceText = $priceCache[$fromKey];
                }

                if ($project->price_to) {
                    $toKey = $project->price_to . '|' . $currencyKey;
                    if (! array_key_exists($toKey, $priceCache)) {
                        $priceCache[$toKey] = $this->formatMapPrice(
                            $project->price_to,
                            $currency,
                            $appCurrency,
                            $hideSymbol,
                            $convertToText,
                            $decimalSeparator,
                            $thousandSeparator,
                            $millionLabel,
                            $billionLabel
                        );
                    }
                    $priceText .= sprintf(' - %s', $priceCache[$toKey]);
                }
            }

            // Location memoized by (city_id, state_id). Typical datasets cluster on
            // <100 unique pairs, so 90%+ of city->name / state->name magic __get
            // accesses are skipped.
            if ($locationActive) {
                $locationKey = ($project->city_id ?? 0) . '|' . ($project->state_id ?? 0);
                if (! array_key_exists($locationKey, $locationCache)) {
                    $locationCache[$locationKey] = implode(', ', array_filter([
                        $project->city?->name,
                        $project->state?->name,
                    ]));
                }
                $location = $locationCache[$locationKey];
            } else {
                $location = $project->location;
            }

            $imageThumb = null;
            if ($project->image) {
                if (! array_key_exists($project->image, $imageUrlCache)) {
                    $imageUrlCache[$project->image] = RvMedia::getImageUrl($project->image, 'thumb', false, $defaultImage);
                }
                $imageThumb = $imageUrlCache[$project->image];
            }

            $items[] = [
                'name' => $project->name,
                'url' => $project->url,
                'image_thumb' => $imageThumb,
                'latitude' => $project->latitude,
                'longitude' => $project->longitude,
                'location' => $location,
                'formatted_price' => $priceText,
                'map_icon' => $project->name,
                'status_html' => $statusHtmlCache[$statusKey],
            ];
        }

        return $items;
    }

    /**
     * Inline format_price implementation. All invariants (app currency, separators,
     * setting toggles, trans labels) are resolved once by the caller and passed in,
     * so each call only touches the row-specific Currency model. Matches stock
     * format_price()/human_price_text() output exactly.
     */
    protected function formatMapPrice(
        float|int|string $price,
        ?Currency $currency,
        ?Currency $appCurrency,
        bool $hideSymbol,
        bool $convertToText,
        string $decimalSeparator,
        string $thousandSeparator,
        string $millionLabel,
        string $billionLabel
    ): string {
        // Convert to application currency — mirrors format_price() branches.
        if ($currency && $appCurrency && $currency->getKey() != $appCurrency->getKey() && $currency->exchange_rate > 0) {
            if ($appCurrency->is_default) {
                $price = $price / $currency->exchange_rate;
            } else {
                $price = $price / $currency->exchange_rate * $appCurrency->exchange_rate;
            }
            $currency = $appCurrency;
        } elseif (! $currency && $appCurrency) {
            $currency = $appCurrency;
            if (! $currency->is_default && $currency->exchange_rate > 0) {
                $price = $price * $currency->exchange_rate;
            }
        }

        $numberAfterDot = $currency?->decimals ?? 0;
        $unitPrefix = '';

        if ($convertToText) {
            if ($price >= 1000000000) {
                $price = round($price / 1000000000, 2) + 0;
                $unitPrefix = ' ' . $billionLabel;
                $numberAfterDot = strlen(substr(strrchr((string) $price, '.'), 1));
            } elseif ($price >= 1000000) {
                $price = round($price / 1000000, 2) + 0;
                $unitPrefix = ' ' . $millionLabel;
                $numberAfterDot = strlen(substr(strrchr((string) $price, '.'), 1));
            }
        }

        if (is_numeric($price)) {
            $price = preg_replace('/[^0-9,.]/s', '', (string) $price);
        }

        $numberStyle = $currency?->number_format_style ?? 'western';
        if ($numberStyle === 'indian') {
            $formatted = format_indian_number((float) $price, (int) $numberAfterDot, $decimalSeparator, $thousandSeparator);
        } else {
            $formatted = number_format((float) $price, (int) $numberAfterDot, $decimalSeparator, $thousandSeparator);
        }

        if ($hideSymbol || ! $currency) {
            return $formatted . $unitPrefix;
        }

        $space = $currency->space_between_price_and_currency ? ' ' : '';

        if ($currency->is_prefix_symbol) {
            return $currency->symbol . $space . $formatted . $unitPrefix;
        }

        return $formatted . $unitPrefix . $space . $currency->symbol;
    }

    public function ajaxGetCities(Request $request)
    {
        if (! is_plugin_active('location')) {
            return $this->httpResponse()->setData([]);
        }

        $request->validate([
            'location' => ['nullable', 'string'],
            'page' => ['nullable', 'integer'],
            'minimal' => ['nullable', 'boolean'],
        ]);

        $cacheKey = 'ajax_cities_' . md5(serialize($request->only([
            'location', 'page', 'minimal',
        ])) . app()->getLocale());

        if ($request->boolean('minimal')) {
            $data = Cache::remember($cacheKey, 86400, function () use ($request) {
                $page = $request->integer('page', 1);
                $perPage = (int) theme_option('number_of_cities_per_page', 10);

                $query = City::query()
                    ->wherePublished()
                    ->with('state')
                    ->orderBy('name');

                if ($request->input('location')) {
                    $query->where('name', 'LIKE', '%' . $request->input('location') . '%');
                }

                $cities = $query->paginate($perPage, ['*'], 'page', $page);

                $items = $cities->map(function ($city) {
                    return [
                        'id' => $city->id,
                        'text' => $city->name . ($city->state ? ', ' . $city->state->name : ''),
                    ];
                });

                return [
                    'items' => $items,
                    'has_more' => $cities->hasMorePages(),
                    'total' => $cities->total(),
                ];
            });

            return $this->httpResponse()->setData($data)->toApiResponse();
        }

        $html = Cache::remember($cacheKey, 86400, function () use ($request) {
            $cities = app(CityInterface::class)->filters($request->input('location'));

            return view(
                Theme::getThemeNamespace('views.real-estate.partials.filters.cities-suggestion'),
                compact('cities')
            )->render();
        });

        return $this->httpResponse()->setData($html);
    }

    public function getWishlist(Request $request, PropertyInterface $propertyRepository, ProjectInterface $projectRepository)
    {
        abort_unless(RealEstateHelper::isEnabledWishlist(), 404);

        SeoHelper::setTitle(__('Wishlist'))
            ->setDescription(__('Wishlist'));

        $propertyWishlist = isset($_COOKIE['wishlist']) ? explode(',', $_COOKIE['wishlist']) : [];
        $propertyWishlist = array_filter($propertyWishlist);
        $projectWishlist = isset($_COOKIE['project_wishlist']) ? explode(',', $_COOKIE['project_wishlist']) : [];
        $projectWishlist = array_filter($projectWishlist);

        $properties = collect();
        $projects = collect();

        if (! empty($propertyWishlist)) {
            $properties = $propertyRepository->advancedGet([
                'condition' => [
                    ['re_properties.id', 'IN', $propertyWishlist],
                ],
                'order_by' => [
                    're_properties.id' => 'DESC',
                ],
                'paginate' => [
                    'per_page' => (int) theme_option('number_of_properties_per_page', 12),
                    'current_paged' => $request->integer('page', 1),
                ],
                'with' => RealEstateHelper::getPropertyRelationsQuery(),
            ]);
        }

        if (! empty($projectWishlist)) {
            $projects = $projectRepository->advancedGet([
                'condition' => [
                    ['re_projects.id', 'IN', $projectWishlist],
                ],
                'order_by' => [
                    're_projects.id' => 'DESC',
                ],
                'paginate' => [
                    'per_page' => (int) theme_option('number_of_properties_per_page', 12),
                    'current_paged' => $request->integer('page', 1),
                ],
                'with' => RealEstateHelper::getProjectRelationsQuery(),
            ]);
        }

        Theme::breadcrumb()->add(__('Wishlist'));

        return Theme::scope('real-estate.wishlist', compact('properties', 'projects'))->render();
    }
}
