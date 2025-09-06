<?php

namespace Theme\Homzen\Actions;

use Botble\RealEstate\Enums\ModerationStatusEnum;
use Botble\RealEstate\Facades\RealEstateHelper;
use Botble\RealEstate\Models\Property;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;

class GetPropertiesAction
{
    /**
     * @return \Illuminate\Database\Eloquent\Collection<\Botble\RealEstate\Models\Property>
     */
    public function handle(?int $limit = 4, ?string $categoryId = null, ?string $type = null, bool $featured = false): Collection
    {
        return Property::query()
            ->where('moderation_status', ModerationStatusEnum::APPROVED)
            ->whereNotIn('status', RealEstateHelper::exceptedPropertyStatuses())
            ->when(
                $featured,
                fn (Builder $query, string $type) => $query->where('is_featured', $featured)
            )
            ->when(
                $type,
                fn (Builder $query, string $type) => $query->where('type', $type)
            )
            ->when(
                $categoryId,
                fn (Builder $query, string $categoryId) => $query->whereRelation('categories', 'id', $categoryId)
            )
            ->take($limit)
            ->latest()
            ->with([...RealEstateHelper::getPropertyRelationsQuery(), 'author'])
            ->get();
    }
}
