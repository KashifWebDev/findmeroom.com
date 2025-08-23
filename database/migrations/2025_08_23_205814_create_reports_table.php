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
        Schema::create('reports', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->foreignId('reporter_user_id')->constrained('users')->restrictOnDelete();
            $table->enum('target_type', ['listing', 'user']);
            $table->unsignedBigInteger('target_id');
            $table->enum('reason', ['scam', 'offensive', 'inaccurate', 'duplicate', 'other']);
            $table->text('details')->nullable();
            $table->enum('status', ['open', 'in_review', 'actioned', 'dismissed'])->default('open');
            $table->timestamps();
            
            $table->index('status');
            $table->index(['target_type', 'target_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reports');
    }
};
