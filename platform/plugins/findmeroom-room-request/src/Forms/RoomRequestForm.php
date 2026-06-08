<?php

namespace FindMeRoom\RoomRequest\Forms;

use Botble\Base\Forms\FormAbstract;
use FindMeRoom\RoomRequest\Models\RoomRequest;

class RoomRequestForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(RoomRequest::class)
            ->setUrl('#')
            ->setActionButtons('')
            ->addMetaBoxes([
                'information' => [
                    'title' => trans('plugins/findmeroom-room-request::room-request.request_information'),
                    'content' => view('plugins/findmeroom-room-request::partials.request-info', [
                        'roomRequest' => $this->getModel(),
                    ])->render(),
                ],
                'actions' => [
                    'title' => trans('plugins/findmeroom-room-request::room-request.moderation'),
                    'content' => view('plugins/findmeroom-room-request::partials.request-actions', [
                        'roomRequest' => $this->getModel(),
                    ])->render(),
                ],
            ]);
    }
}
