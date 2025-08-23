<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->foreignId('order_id')->primary()->constrained()->cascadeOnDelete();
            $table->timestamp('paid_at');
            $table->integer('amount_paisa');
            $table->integer('provider_fee_paisa')->default(0);
            $table->text('receipt_url')->nullable();
            $table->json('meta')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
