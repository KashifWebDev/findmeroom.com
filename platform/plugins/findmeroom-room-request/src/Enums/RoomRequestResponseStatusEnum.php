<?php

namespace FindMeRoom\RoomRequest\Enums;

use Botble\Base\Supports\Enum;

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
}
