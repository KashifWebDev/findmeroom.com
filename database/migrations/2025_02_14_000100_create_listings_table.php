<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('listings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('user_id')->constrained()->cascadeOnDelete();
            $table->string('title');
            $table->string('slug')->unique();
            $table->longText('description');
            $table->string('city');
            $table->string('country');
            $table->decimal('lat', 10, 7)->nullable();
            $table->decimal('lng', 10, 7)->nullable();
            $table->enum('type', ['private_room','shared_room','hostel','sublet','student','emergency']);
            $table->unsignedInteger('price_minor');
            $table->char('currency', 3);
            $table->date('available_from')->nullable();
            $table->string('image_url')->nullable();
            $table->enum('status', ['draft','published','suspended'])->default('published');
            $table->timestamps();
            $table->softDeletes();

            $table->index('city');
            $table->index('country');
            $table->index('currency');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('listings');
    }
};
