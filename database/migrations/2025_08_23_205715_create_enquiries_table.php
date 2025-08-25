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
        Schema::create('enquiries', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->foreignId('listing_id')->constrained()->cascadeOnDelete();
            $table->foreignId('tenant_id')->nullable()->constrained('tenants', 'user_id')->nullOnDelete();
            $table->text('message');
            $table->enum('preferred_contact', ['email', 'phone', 'whatsapp'])->default('email');
            $table->string('contact_phone', 20)->nullable();
            $table->string('contact_email', 190)->nullable();
            $table->enum('status', ['new', 'responded', 'closed', 'spam'])->default('new');
            $table->timestamp('responded_at')->nullable();
            $table->timestamps();
            
            $table->index(['listing_id', 'created_at']);
            $table->index(['tenant_id', 'created_at']);
            $table->index('status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enquiries');
    }
};
