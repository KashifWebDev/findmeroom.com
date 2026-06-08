<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('room_requests', function (Blueprint $table): void {
            $table->unsignedBigInteger('country_id')->nullable()->after('email')->index();
            $table->unsignedBigInteger('state_id')->nullable()->after('country_id')->index();
        });
    }

    public function down(): void
    {
        Schema::table('room_requests', function (Blueprint $table): void {
            $table->dropColumn(['country_id', 'state_id']);
        });
    }
};
