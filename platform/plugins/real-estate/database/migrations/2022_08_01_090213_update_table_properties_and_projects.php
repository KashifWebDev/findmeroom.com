<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class() extends Migration
{
    public function up(): void
    {
        Schema::table('re_properties', function (Blueprint $table) {
            $table->foreignId('country_id')->default(1)->nullable();
            $table->foreignId('state_id')->nullable();
        });

        Schema::table('re_projects', function (Blueprint $table) {
            $table->foreignId('country_id')->default(1)->nullable();
            $table->foreignId('state_id')->nullable();
        });

        $tablePrefix = Schema::getConnection()->getTablePrefix();

        DB::statement("
            UPDATE {$tablePrefix}re_properties INNER JOIN {$tablePrefix}cities ON {$tablePrefix}re_properties.city_id = {$tablePrefix}cities.id
            SET {$tablePrefix}re_properties.state_id = {$tablePrefix}cities.state_id, {$tablePrefix}re_properties.country_id = {$tablePrefix}cities.country_id WHERE {$tablePrefix}re_properties.city_id IS NOT NULL
        ");

        DB::statement("
            UPDATE {$tablePrefix}re_projects INNER JOIN {$tablePrefix}cities ON {$tablePrefix}re_projects.city_id = {$tablePrefix}cities.id
            SET {$tablePrefix}re_projects.state_id = {$tablePrefix}cities.state_id, {$tablePrefix}re_projects.country_id = {$tablePrefix}cities.country_id WHERE {$tablePrefix}re_projects.city_id IS NOT NULL
        ");
    }
};
