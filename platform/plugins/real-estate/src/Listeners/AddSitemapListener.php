<?php

namespace Botble\RealEstate\Listeners;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Location\Models\City;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Models\Account;
use Botble\RealEstate\Models\Category;
use Botble\RealEstate\Models\Project;
use Botble\RealEstate\Models\Property;
use Botble\Theme\Events\RenderingSiteMapEvent;
use Botble\Theme\Facades\SiteMapManager;
use Illuminate\Support\Arr;

class AddSitemapListener
{
    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($key = $event->key) {
            switch ($key) {
                case 'agents':

                    if (RealEstateHelper::isDisabledPublicProfile()) {
                        break;
                    }

                    $agentLastUpdated = Account::query()
                        ->latest('updated_at')
                        ->value('updated_at');

                    SiteMapManager::add(route('public.agents'), $agentLastUpdated, '0.4', 'monthly');

                    $items = Account::query()
                        ->latest('created_at')
                        ->get();

                    foreach ($items as $item) {
                        SiteMapManager::add($item->url, $item->updated_at, '0.8');
                    }

                    break;

                case 'property-categories':

                    $items = Category::query()
                        ->with('slugable')
                        ->where('status', BaseStatusEnum::PUBLISHED)
                        ->latest('created_at')
                        ->get();

                    foreach ($items as $item) {
                        SiteMapManager::add($item->url, $item->updated_at, '0.8');
                    }

                    break;

                case 'properties-city':

                    $items = City::query()
                        ->where('status', BaseStatusEnum::PUBLISHED)
                        ->whereExists(function ($query) {
                            $query->from('re_properties')
                                ->whereColumn('re_properties.city_id', 'cities.id')
                                ->where(RealEstateHelper::getPropertyDisplayQueryConditions())
                                ->where(function ($q) {
                                    $q->where('re_properties.expire_date', '>=', now())
                                        ->orWhere('re_properties.never_expired', true);
                                });
                        })
                        ->latest('updated_at')
                        ->get();

                    foreach ($items as $item) {
                        SiteMapManager::add(route('public.properties-by-city', $item->slug), $item->updated_at, '0.8');
                    }

                    break;

                case 'projects-city':
                    if (! RealEstateHelper::isEnabledProjects()) {
                        break;
                    }

                    $items = City::query()
                        ->where('status', BaseStatusEnum::PUBLISHED)
                        ->whereExists(function ($query) {
                            $query->from('re_projects')
                                ->whereColumn('re_projects.city_id', 'cities.id')
                                ->where(RealEstateHelper::getProjectDisplayQueryConditions());
                        })
                        ->latest('updated_at')
                        ->get();

                    foreach ($items as $item) {
                        SiteMapManager::add(route('public.projects-by-city', $item->slug), $item->updated_at, '0.8');
                    }

                    break;
            }

            // Consolidated properties handler with optional page-based pagination.
            // Matches: properties, properties-page-{N}
            if ($key === 'properties' || preg_match('/^properties-page-(\d+)$/', $key, $propertyPageMatches)) {
                $itemsPerPage = SiteMapManager::getItemsPerPage();
                $page = isset($propertyPageMatches[1]) ? max(1, (int) $propertyPageMatches[1]) : 1;
                $offset = ($page - 1) * $itemsPerPage;

                $properties = Property::query()
                    ->active()
                    ->latest('updated_at')
                    ->select(['id', 'name', 'updated_at'])
                    ->with(['slugable'])
                    ->skip($offset)
                    ->take($itemsPerPage)
                    ->get();

                foreach ($properties as $property) {
                    if (! $property->slugable) {
                        continue;
                    }

                    SiteMapManager::add($property->url, $property->updated_at, '0.8');
                }

                return;
            }

            // Consolidated projects handler with optional page-based pagination.
            // Matches: projects, projects-page-{N}
            if (RealEstateHelper::isEnabledProjects()
                && ($key === 'projects' || preg_match('/^projects-page-(\d+)$/', $key, $projectPageMatches))
            ) {
                $itemsPerPage = SiteMapManager::getItemsPerPage();
                $page = isset($projectPageMatches[1]) ? max(1, (int) $projectPageMatches[1]) : 1;
                $offset = ($page - 1) * $itemsPerPage;

                $projects = Project::query()
                    ->active()
                    ->latest('updated_at')
                    ->select(['id', 'name', 'updated_at'])
                    ->with(['slugable'])
                    ->skip($offset)
                    ->take($itemsPerPage)
                    ->get();

                foreach ($projects as $project) {
                    if (! $project->slugable) {
                        continue;
                    }

                    SiteMapManager::add($project->url, $project->updated_at, '0.8');
                }

                return;
            }

            // Backward compatibility: legacy monthly archive URLs for properties.
            $paginationData = SiteMapManager::extractPaginationDataByPattern($key, 'properties', 'monthly-archive');

            if ($paginationData) {
                $matches = $paginationData['matches'];
                $year = Arr::get($matches, 1);
                $month = Arr::get($matches, 2);

                if ($year && $month) {
                    $properties = Property::query()
                        ->active()
                        ->whereYear('updated_at', $year)
                        ->whereMonth('updated_at', $month)
                        ->latest('updated_at')
                        ->select(['id', 'name', 'updated_at'])
                        ->with(['slugable'])
                        ->skip($paginationData['offset'])
                        ->take($paginationData['limit'])
                        ->get();

                    foreach ($properties as $property) {
                        if (! $property->slugable) {
                            continue;
                        }

                        SiteMapManager::add($property->url, $property->updated_at, '0.8');
                    }
                }
            }

            // Backward compatibility: legacy monthly archive URLs for projects.
            if (RealEstateHelper::isEnabledProjects()) {
                $projectPaginationData = SiteMapManager::extractPaginationDataByPattern($key, 'projects', 'monthly-archive');

                if ($projectPaginationData) {
                    $matches = $projectPaginationData['matches'];
                    $year = Arr::get($matches, 1);
                    $month = Arr::get($matches, 2);

                    if ($year && $month) {
                        $projects = Project::query()
                            ->active()
                            ->whereYear('updated_at', $year)
                            ->whereMonth('updated_at', $month)
                            ->latest('updated_at')
                            ->select(['id', 'name', 'updated_at'])
                            ->with(['slugable'])
                            ->skip($projectPaginationData['offset'])
                            ->take($projectPaginationData['limit'])
                            ->get();

                        foreach ($projects as $project) {
                            if (! $project->slugable) {
                                continue;
                            }

                            SiteMapManager::add($project->url, $project->updated_at, '0.8');
                        }
                    }
                }
            }

            return;
        }

        // Sitemap index registration.
        // Match pages.xml behavior: single consolidated properties.xml / projects.xml by default,
        // auto-paginate only when total exceeds items_per_page threshold.
        $totalProperties = Property::query()->active()->count();

        if ($totalProperties > 0) {
            $latestPropertyUpdated = Property::query()
                ->active()
                ->latest('updated_at')
                ->value('updated_at');

            SiteMapManager::createPaginatedSitemaps('properties', $totalProperties, $latestPropertyUpdated);
        }

        if (RealEstateHelper::isEnabledProjects()) {
            $totalProjects = Project::query()->active()->count();

            if ($totalProjects > 0) {
                $latestProjectUpdated = Project::query()
                    ->active()
                    ->latest('updated_at')
                    ->value('updated_at');

                SiteMapManager::createPaginatedSitemaps('projects', $totalProjects, $latestProjectUpdated);
            }
        }

        if (! RealEstateHelper::isDisabledPublicProfile()) {
            $agentLastUpdated = Account::query()
                ->latest('updated_at')
                ->value('updated_at');

            SiteMapManager::addSitemap(SiteMapManager::route('agents'), $agentLastUpdated);
        }

        $propertyCityExists = City::query()
            ->where('status', BaseStatusEnum::PUBLISHED)
            ->whereExists(function ($query) {
                $query->from('re_properties')
                    ->whereColumn('re_properties.city_id', 'cities.id')
                    ->where(RealEstateHelper::getPropertyDisplayQueryConditions())
                    ->where(function ($q) {
                        $q->where('re_properties.expire_date', '>=', now())
                            ->orWhere('re_properties.never_expired', true);
                    });
            })
            ->exists();

        if ($propertyCityExists) {
            $cityLastUpdated = City::query()
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->latest('updated_at')
                ->value('updated_at');

            SiteMapManager::addSitemap(SiteMapManager::route('properties-city'), $cityLastUpdated);
        }

        if (RealEstateHelper::isEnabledProjects()) {
            $projectCityExists = City::query()
                ->where('status', BaseStatusEnum::PUBLISHED)
                ->whereExists(function ($query) {
                    $query->from('re_projects')
                        ->whereColumn('re_projects.city_id', 'cities.id')
                        ->where(RealEstateHelper::getProjectDisplayQueryConditions());
                })
                ->exists();

            if ($projectCityExists) {
                $cityLastUpdated = City::query()
                    ->where('status', BaseStatusEnum::PUBLISHED)
                    ->latest('updated_at')
                    ->value('updated_at');

                SiteMapManager::addSitemap(SiteMapManager::route('projects-city'), $cityLastUpdated);
            }
        }
    }
}
