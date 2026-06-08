<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('room_requests', function (Blueprint $table): void {
            $table->id();
            $table->string('name', 120);
            $table->string('public_name', 80);
            $table->string('phone', 20);
            $table->string('email', 120)->nullable();
            $table->unsignedBigInteger('city_id')->nullable()->index();
            $table->string('city_text', 120);
            $table->string('area_text', 160);
            $table->unsignedInteger('budget_min')->nullable();
            $table->unsignedInteger('budget_max');
            $table->string('gender_preference', 32)->nullable();
            $table->string('room_type', 32)->nullable();
            $table->string('tenant_type', 32)->nullable();
            $table->string('nearby_place', 160)->nullable();
            $table->date('move_in_date')->nullable();
            $table->text('notes')->nullable();
            $table->boolean('allow_public_phone')->default(false);
            $table->string('status', 20)->default('pending')->index();
            $table->boolean('is_public')->default(false);
            $table->string('share_slug', 160)->nullable()->unique();
            $table->timestamp('expires_at')->nullable()->index();
            $table->timestamp('approved_at')->nullable();
            $table->unsignedBigInteger('approved_by')->nullable();
            $table->timestamp('found_at')->nullable();
            $table->timestamps();

            $table->index(['status', 'is_public', 'expires_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('room_requests');
    }
};
