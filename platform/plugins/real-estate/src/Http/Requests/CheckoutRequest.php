<?php

namespace Botble\RealEstate\Http\Requests;

use Botble\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CheckoutRequest extends Request
{
    public function rules(): array
    {
        $paymentMethods = [];

        if (is_plugin_active('payment')) {
            $paymentMethodEnum = 'Botble\\Payment\\Enums\\PaymentMethodEnum';
            $paymentMethods = $paymentMethodEnum::values();
        }

        return [
            'payment_method' => 'required|string|' . Rule::in($paymentMethods),
            'amount' => ['required', 'numeric', 'min:0'],
            'currency' => ['required', 'string'],
        ];
    }
}
