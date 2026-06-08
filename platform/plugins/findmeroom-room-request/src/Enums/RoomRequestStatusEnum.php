<?php

namespace FindMeRoom\RoomRequest\Enums;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static RoomRequestStatusEnum PENDING()
 * @method static RoomRequestStatusEnum APPROVED()
 * @method static RoomRequestStatusEnum REJECTED()
 * @method static RoomRequestStatusEnum FOUND()
 * @method static RoomRequestStatusEnum EXPIRED()
 * @method static RoomRequestStatusEnum SPAM()
 */
class RoomRequestStatusEnum extends Enum
{
    public const PENDING = 'pending';

    public const APPROVED = 'approved';

    public const REJECTED = 'rejected';

    public const FOUND = 'found';

    public const EXPIRED = 'expired';

    public const SPAM = 'spam';

    public static $langPath = 'plugins/findmeroom-room-request::room-request.statuses';

    public function toHtml(): HtmlString|string
    {
        return match ($this->value) {
            self::PENDING => Html::tag('span', self::PENDING()->label(), ['class' => 'badge bg-warning text-warning-fg']),
            self::APPROVED => Html::tag('span', self::APPROVED()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::REJECTED => Html::tag('span', self::REJECTED()->label(), ['class' => 'badge bg-secondary text-secondary-fg']),
            self::FOUND => Html::tag('span', self::FOUND()->label(), ['class' => 'badge bg-info text-info-fg']),
            self::EXPIRED => Html::tag('span', self::EXPIRED()->label(), ['class' => 'badge bg-dark text-dark-fg']),
            self::SPAM => Html::tag('span', self::SPAM()->label(), ['class' => 'badge bg-danger text-danger-fg']),
            default => parent::toHtml(),
        };
    }
}
