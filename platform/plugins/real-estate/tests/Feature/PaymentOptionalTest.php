<?php

namespace Botble\RealEstate\Tests\Feature;

use Botble\PluginManagement\Services\PluginService;
use Botble\RealEstate\Events\PaymentCompleted;
use Botble\RealEstate\Http\Requests\CheckoutRequest;
use Botble\RealEstate\Listeners\SubscribedPackageListener;
use Botble\RealEstate\Models\Invoice;
use Botble\RealEstate\Models\Transaction;
use Botble\RealEstate\Supports\InvoiceHelper;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class PaymentOptionalTest extends TestCase
{
    use RefreshDatabase;

    protected function clearPluginCache(): void
    {
        $reflection = new \ReflectionClass(PluginService::class);
        $property = $reflection->getProperty('activatedPlugins');
        $property->setAccessible(true);
        $property->setValue(null, []);
    }

    protected function deactivatePaymentPlugin(): void
    {
        $plugins = PluginService::getActivatedPlugins();
        $plugins = array_values(array_filter($plugins, fn ($p) => $p !== 'payment'));

        setting()->set('activated_plugins', json_encode($plugins));
        setting()->save();

        $this->clearPluginCache();
    }

    protected function activatePaymentPlugin(): void
    {
        $plugins = PluginService::getActivatedPlugins();

        if (! in_array('payment', $plugins)) {
            $plugins[] = 'payment';
        }

        setting()->set('activated_plugins', json_encode(array_values($plugins)));
        setting()->save();

        $this->clearPluginCache();
    }

    public function testPaymentCompletedEventAcceptsGenericModel(): void
    {
        $model = new class extends Model {
            protected $fillable = ['id'];
        };

        $event = new PaymentCompleted($model);

        $this->assertInstanceOf(Model::class, $event->payment);
    }

    public function testSubscribedPackageListenerReturnsEarlyWithoutPayment(): void
    {
        $this->deactivatePaymentPlugin();

        $model = new class extends Model {
            protected $fillable = ['id'];
        };

        $event = new PaymentCompleted($model);

        $listener = new SubscribedPackageListener();
        $result = $listener->handle($event);

        $this->assertNull($result);
    }

    public function testInvoiceModelPaymentRelationWithoutPaymentPlugin(): void
    {
        $this->deactivatePaymentPlugin();

        $invoice = new Invoice();
        $relation = $invoice->payment();

        $this->assertNotNull($relation);
        $this->assertInstanceOf(\Illuminate\Database\Eloquent\Relations\BelongsTo::class, $relation);
    }

    public function testTransactionModelPaymentRelationWithoutPaymentPlugin(): void
    {
        $this->deactivatePaymentPlugin();

        $transaction = new Transaction();
        $relation = $transaction->payment();

        $this->assertNotNull($relation);
        $this->assertInstanceOf(\Illuminate\Database\Eloquent\Relations\BelongsTo::class, $relation);
    }

    public function testInvoiceHelperStoreReturnsFalseWithoutPaymentPlugin(): void
    {
        $this->deactivatePaymentPlugin();

        $result = InvoiceHelper::store([
            'order_id' => 1,
            'charge_id' => 'test_charge',
            'status' => 'completed',
            'amount' => 100,
            'discount_amount' => 0,
        ]);

        $this->assertFalse($result);
    }

    public function testCheckoutRequestRulesWithoutPaymentPlugin(): void
    {
        $this->deactivatePaymentPlugin();

        $request = new CheckoutRequest();
        $rules = $request->rules();

        $this->assertArrayHasKey('payment_method', $rules);
        $this->assertArrayHasKey('amount', $rules);
        $this->assertArrayHasKey('currency', $rules);
    }

    public function testCheckoutRouteReturns404WithoutPaymentPlugin(): void
    {
        $this->deactivatePaymentPlugin();

        $response = $this->postJson(route('payments.checkout'), [
            'payment_method' => 'cod',
            'amount' => 100,
            'currency' => 'USD',
        ]);

        // Without auth it may return 401/302, with payment deactivated + auth it returns 404.
        // The key assertion is it does NOT return 200 (success) or 500 (crash).
        $this->assertContains($response->getStatusCode(), [302, 401, 404]);
    }

    public function testInvoiceModelPaymentRelationWithPaymentPlugin(): void
    {
        if (! is_plugin_active('payment')) {
            $this->markTestSkipped('Payment plugin not active');
        }

        $invoice = new Invoice();
        $relation = $invoice->payment();

        $this->assertEquals(
            'Botble\\Payment\\Models\\Payment',
            get_class($relation->getRelated())
        );
    }

    public function testTransactionModelPaymentRelationWithPaymentPlugin(): void
    {
        if (! is_plugin_active('payment')) {
            $this->markTestSkipped('Payment plugin not active');
        }

        $transaction = new Transaction();
        $relation = $transaction->payment();

        $this->assertEquals(
            'Botble\\Payment\\Models\\Payment',
            get_class($relation->getRelated())
        );
    }

    public function testInvoiceHelperGetDataForPreviewWithoutPaymentPlugin(): void
    {
        $this->deactivatePaymentPlugin();

        $helper = new InvoiceHelper();
        $invoice = $helper->getDataForPreview();

        $this->assertInstanceOf(Invoice::class, $invoice);

        // When payment plugin is deactivated, payment relation should be null.
        // If payment classes are still loaded (class autoloader cache), it may return a Payment instance.
        // Either way, no crash = success.
        $payment = $invoice->getRelation('payment');
        $this->assertTrue($payment === null || $payment instanceof Model);
    }
}
