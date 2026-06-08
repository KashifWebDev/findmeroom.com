<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('room_request_responses', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('room_request_id')->constrained('room_requests')->cascadeOnDelete();
            $table->unsignedBigInteger('property_id')->nullable()->index();
            $table->string('owner_name', 120);
            $table->string('owner_phone', 20);
            $table->string('owner_email', 120)->nullable();
            $table->string('area_text', 160)->nullable();
            $table->unsignedInteger('rent')->nullable();
            $table->text('message')->nullable();
            $table->string('status', 20)->default('pending')->index();
            $table->text('admin_notes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('room_request_responses');
    }
};
