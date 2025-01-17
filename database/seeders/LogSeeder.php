<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\LoginLog;
use App\Models\Karyawan;
use Carbon\Carbon;

class LogSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Ambil semua id karyawan, lalu simpan dalam array
        $karyawanIds = Karyawan::pluck('id')->toArray();

        // Generate 200 data login secara acak
        for ($i = 0; $i < 200; $i++) {
            LoginLog::create([
                'karyawan_id' => $karyawanIds[array_rand($karyawanIds)],

                // Waktu login antara 0-30 hari lalu, jam & menit juga random
                'login_time' => Carbon::now()
                                ->subDays(rand(0, 30))
                                ->subHours(rand(0, 23))
                                ->subMinutes(rand(0, 59)),

                // IP Address acak (versi IPv4)
                'ip_address' => long2ip(random_int(0, 4294967295)),

                // Timestamps laravel, bisa diisi manual atau otomatis
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
