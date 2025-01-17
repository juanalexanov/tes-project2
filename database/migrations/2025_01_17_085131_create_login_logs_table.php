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
        Schema::create('login_logs', function (Blueprint $table) {
            $table->id();
            // Mengaitkan ke tabel karyawans (primary key = id).
            $table->foreignId('karyawan_id')->constrained('karyawans')->onDelete('cascade');

            // Waktu login
            $table->dateTime('login_time')->nullable();

            // IP address (opsional)
            $table->string('ip_address', 45)->nullable();

            // created_at & updated_at
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('login_logs');
    }
};
