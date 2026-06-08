<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('room_request_responses', function (Blueprint $table): void {
            if (! Schema::hasColumn('room_request_responses', 'room_type')) {
                $table->string('room_type', 32)->nullable()->after('rent');
            }

            if (! Schema::hasColumn('room_request_responses', 'responder_account_id')) {
                $table->unsignedBigInteger('responder_account_id')->nullable()->after('status');
                $table->foreign('responder_account_id')->references('id')->on('re_accounts')->nullOnDelete();
                $table->index('responder_account_id');
            }

            if (! Schema::hasColumn('room_request_responses', 'reported_at')) {
                $table->timestamp('reported_at')->nullable()->after('admin_notes');
            }

            if (! Schema::hasColumn('room_request_responses', 'report_reason')) {
                $table->string('report_reason', 255)->nullable()->after('reported_at');
            }

            if (! Schema::hasColumn('room_request_responses', 'ip_address')) {
                $table->string('ip_address', 45)->nullable()->after('report_reason');
            }
        });
    }

    public function down(): void
    {
        Schema::table('room_request_responses', function (Blueprint $table): void {
            if (Schema::hasColumn('room_request_responses', 'ip_address')) {
                $table->dropColumn('ip_address');
            }

            if (Schema::hasColumn('room_request_responses', 'report_reason')) {
                $table->dropColumn('report_reason');
            }

            if (Schema::hasColumn('room_request_responses', 'reported_at')) {
                $table->dropColumn('reported_at');
            }

            if (Schema::hasColumn('room_request_responses', 'responder_account_id')) {
                $table->dropForeign(['responder_account_id']);
                $table->dropIndex(['responder_account_id']);
                $table->dropColumn('responder_account_id');
            }

            if (Schema::hasColumn('room_request_responses', 'room_type')) {
                $table->dropColumn('room_type');
            }
        });
    }
};
