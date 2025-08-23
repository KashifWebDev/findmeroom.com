<?php

return [
    'providers' => [
        'stripe' => [
            'secret' => env('STRIPE_WEBHOOK_SECRET', 'whsec_test_secret'),
        ],
        'paypal' => [
            'secret' => env('PAYPAL_WEBHOOK_SECRET', 'test_paypal_secret'),
        ],
        'razorpay' => [
            'secret' => env('RAZORPAY_WEBHOOK_SECRET', 'test_razorpay_secret'),
        ],
    ],
];
