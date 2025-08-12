<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('conversations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('listing_id')->constrained('listings')->cascadeOnDelete();
            $table->foreignId('host_id')->constrained('users');
            $table->foreignId('renter_id')->constrained('users');
            $table->timestamp('last_message_at')->nullable();
            $table->unsignedSmallInteger('unread_for_host')->default(0);
            $table->unsignedSmallInteger('unread_for_renter')->default(0);
            $table->timestamps();

            $table->unique(['listing_id','host_id','renter_id']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('conversations');
    }
};
