<?php

namespace FindMeRoom\RoomRequest\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static RoomRequestResponseStatusEnum PENDING()
 * @method static RoomRequestResponseStatusEnum VISIBLE()
 * @method static RoomRequestResponseStatusEnum APPROVED()
 * @method static RoomRequestResponseStatusEnum REJECTED()
 * @method static RoomRequestResponseStatusEnum REPORTED()
 * @method static RoomRequestResponseStatusEnum SPAM()
 */
class RoomRequestResponseStatusEnum extends Enum
{
    public const PENDING = 'pending';

    public const VISIBLE = 'visible';

    public const APPROVED = 'approved';

    public const REJECTED = 'rejected';

    public const REPORTED = 'reported';

    public const SPAM = 'spam';

    public static $langPath = 'plugins/findmeroom-room-request::room-request.response_statuses';

    public function toHtml(): HtmlString|string
    {
        return match ($this->value) {
            self::PENDING => Html::tag('span', self::PENDING()->label(), ['class' => 'badge bg-warning text-warning-fg']),
            self::VISIBLE => Html::tag('span', self::VISIBLE()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::APPROVED => Html::tag('span', self::APPROVED()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::REJECTED => Html::tag('span', self::REJECTED()->label(), ['class' => 'badge bg-secondary text-secondary-fg']),
            self::REPORTED => Html::tag('span', self::REPORTED()->label(), ['class' => 'badge bg-orange text-orange-fg']),
            self::SPAM => Html::tag('span', self::SPAM()->label(), ['class' => 'badge bg-danger text-danger-fg']),
            default => parent::toHtml(),
        };
    }
}
