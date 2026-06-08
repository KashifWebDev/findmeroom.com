<?php

namespace FindMeRoom\RoomRequest\Tables;

use FindMeRoom\RoomRequest\Models\RoomRequestResponse;
use Illuminate\Support\Str;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\EditAction;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;

class RoomRequestResponseTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(RoomRequestResponse::class)
            ->addActions([
                EditAction::make()->route('room-request-responses.edit'),
            ]);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->with(['roomRequest'])
            ->select([
                'id',
                'room_request_id',
                'owner_name',
                'owner_phone',
                'owner_email',
                'area_text',
                'rent',
                'message',
                'status',
                'reported_at',
                'report_reason',
                'created_at',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            FormattedColumn::make('room_request_id')
                ->title(trans('plugins/findmeroom-room-request::room-request.responses.tables.request'))
                ->getValueUsing(function (FormattedColumn $column) {
                    $request = $column->getItem()->roomRequest;

                    return $request ? $request->public_name : '—';
                }),
            NameColumn::make('owner_name')
                ->title(trans('plugins/findmeroom-room-request::room-request.owner_response.owner_name'))
                ->route('room-request-responses.edit'),
            Column::make('owner_phone')
                ->title(trans('plugins/findmeroom-room-request::room-request.owner_response.owner_phone')),
            Column::make('owner_email')
                ->title(trans('plugins/findmeroom-room-request::room-request.owner_response.owner_email')),
            Column::make('rent')
                ->title(trans('plugins/findmeroom-room-request::room-request.owner_response.rent'))
                ->alignCenter(),
            Column::make('area_text')
                ->title(trans('plugins/findmeroom-room-request::room-request.owner_response.area_text')),
            FormattedColumn::make('message')
                ->title(trans('plugins/findmeroom-room-request::room-request.owner_response.message'))
                ->limit(60),
            StatusColumn::make()
                ->title(trans('plugins/findmeroom-room-request::room-request.tables.status')),
            FormattedColumn::make('reported_at')
                ->title(trans('plugins/findmeroom-room-request::room-request.responses.tables.reported_at'))
                ->getValueUsing(function (FormattedColumn $column) {
                    $reportedAt = $column->getItem()->reported_at;

                    return $reportedAt ? $reportedAt->format('Y-m-d H:i') : '—';
                }),
            FormattedColumn::make('report_reason')
                ->title(trans('plugins/findmeroom-room-request::room-request.responses.tables.report_reason'))
                ->getValueUsing(fn (FormattedColumn $column) => $column->getItem()->report_reason
                    ? Str::limit($column->getItem()->report_reason, 40)
                    : '—'),
            CreatedAtColumn::make(),
        ];
    }
}
