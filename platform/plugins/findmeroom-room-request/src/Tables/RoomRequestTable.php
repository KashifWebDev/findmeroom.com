<?php

namespace FindMeRoom\RoomRequest\Tables;

use FindMeRoom\RoomRequest\Enums\RoomRequestStatusEnum;
use FindMeRoom\RoomRequest\Models\RoomRequest;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;

class RoomRequestTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(RoomRequest::class)
            ->addActions([
                EditAction::make()->route('room-requests.edit'),
                DeleteAction::make()->route('room-requests.destroy'),
            ]);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->with(['city'])
            ->select([
                'id',
                'public_name',
                'city_id',
                'city_text',
                'area_text',
                'budget_max',
                'status',
                'created_at',
                'expires_at',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            NameColumn::make('public_name')
                ->title(trans('plugins/findmeroom-room-request::room-request.tables.public_name'))
                ->route('room-requests.edit'),
            FormattedColumn::make('city_text')
                ->title(trans('plugins/findmeroom-room-request::room-request.tables.city'))
                ->getValueUsing(function (FormattedColumn $column) {
                    return $column->getItem()->displayCity();
                }),
            Column::make('area_text')
                ->title(trans('plugins/findmeroom-room-request::room-request.tables.area')),
            FormattedColumn::make('budget_max')
                ->title(trans('plugins/findmeroom-room-request::room-request.tables.budget_max'))
                ->getValueUsing(function (FormattedColumn $column) {
                    return 'Rs ' . number_format($column->getItem()->budget_max);
                }),
            CreatedAtColumn::make(),
            FormattedColumn::make('expires_at')
                ->title(trans('plugins/findmeroom-room-request::room-request.tables.expires_at'))
                ->getValueUsing(function (FormattedColumn $column) {
                    $expiresAt = $column->getItem()->expires_at;

                    return $expiresAt ? $expiresAt->format('Y-m-d') : '—';
                }),
            StatusColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('room-requests.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            StatusBulkChange::make()->choices(RoomRequestStatusEnum::labels()),
            CreatedAtBulkChange::make(),
        ];
    }
}
