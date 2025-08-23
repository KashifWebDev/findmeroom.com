<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Services\OrderService;
use App\Traits\ApiResponse;
use Illuminate\Http\Request;

class WebhookPaymentsController extends Controller
{
    use ApiResponse;

    public function handle(Request $request, string $provider)
    {
        // Verify webhook secret
        $secret = config("payments.providers.{$provider}.secret");
        if (!$secret || $request->header('X-Webhook-Secret') !== $secret) {
            return $this->fail('UNAUTHORIZED', 'Invalid webhook secret', null, 401);
        }
        
        try {
            $payload = $request->all();
            
            // Process payment using service
            $orderService = app(OrderService::class);
            $orderService->confirmPayment($provider, $payload);
            
            return $this->ok(['message' => 'Webhook processed successfully']);
            
        } catch (\Exception $e) {
            return $this->fail('SERVER_ERROR', 'Failed to process webhook', null, 500);
        }
    }
}
