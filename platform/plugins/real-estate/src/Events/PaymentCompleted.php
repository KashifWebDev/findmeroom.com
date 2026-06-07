<?php

namespace Botble\RealEstate\Events;

use Botble\Base\Events\Event;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Events\Dispatchable;

class PaymentCompleted extends Event
{
    use Dispatchable;

    public function __construct(public Model $payment)
    {
    }
}
