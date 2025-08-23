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
        Schema::create('listings', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->foreignId('landlord_id')->constrained('landlords', 'user_id')->restrictOnDelete();
            $table->foreignId('area_id')->constrained()->restrictOnDelete();
            $table->foreignId('campus_id')->nullable()->constrained()->restrictOnDelete();
            $table->string('title', 140);
            $table->string('slug', 180)->unique();
            $table->longText('description');
            $table->integer('rent_monthly_paisa');
            $table->integer('deposit_paisa')->nullable();
            $table->boolean('bills_included')->default(false);
            $table->enum('room_type', ['private_room', 'shared_room', 'whole_place']);
            $table->enum('gender_pref', ['any', 'male_only', 'female_only'])->default('any');
            $table->boolean('furnished')->default(false);
            $table->enum('verified_level', ['none', 'basic', 'verified'])->default('none');
            $table->enum('status', ['draft', 'review', 'published', 'rejected', 'archived'])->default('draft');
            $table->decimal('lat', 9, 6)->nullable();
            $table->decimal('lng', 9, 6)->nullable();
            $table->string('address_line', 180)->nullable();
            $table->unsignedInteger('distance_to_campus_m')->nullable();
            $table->date('available_from')->nullable();
            $table->date('available_to')->nullable();
            $table->unsignedInteger('views_count')->default(0);
            $table->unsignedInteger('favourites_count')->default(0);
            $table->timestamp('published_at')->nullable();
            $table->timestamps();
            $table->softDeletes();
            
            $table->index(['status', 'verified_level', 'published_at']);
            $table->index(['area_id', 'rent_monthly_paisa']);
            $table->index(['room_type', 'gender_pref', 'furnished']);
            $table->index(['landlord_id', 'published_at']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('listings');
    }
};
