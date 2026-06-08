<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('room_requests', function (Blueprint $table): void {
            if (! Schema::hasColumn('room_requests', 'account_id')) {
                $table->unsignedBigInteger('account_id')->nullable()->after('email');
                $table->foreign('account_id')->references('id')->on('re_accounts')->nullOnDelete();
                $table->index('account_id');
            }

            if (! Schema::hasColumn('room_requests', 'manage_token')) {
                $table->string('manage_token', 64)->nullable()->unique()->after('account_id');
                $table->index('manage_token');
            }

            if (! $this->hasIndex('room_requests', 'room_requests_email_index')) {
                $table->index('email');
            }
        });
    }

    public function down(): void
    {
        Schema::table('room_requests', function (Blueprint $table): void {
            if (Schema::hasColumn('room_requests', 'manage_token')) {
                $table->dropUnique(['manage_token']);
                $table->dropIndex(['manage_token']);
                $table->dropColumn('manage_token');
            }

            if (Schema::hasColumn('room_requests', 'account_id')) {
                $table->dropForeign(['account_id']);
                $table->dropIndex(['account_id']);
                $table->dropColumn('account_id');
            }

            if ($this->hasIndex('room_requests', 'room_requests_email_index')) {
                $table->dropIndex(['email']);
            }
        });
    }

    protected function hasIndex(string $table, string $indexName): bool
    {
        $indexes = Schema::getIndexes($table);

        foreach ($indexes as $index) {
            if (($index['name'] ?? '') === $indexName) {
                return true;
            }
        }

        return false;
    }
};
