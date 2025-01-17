<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\LoginLog;
use App\Models\Karyawan;
use Carbon\Carbon;

class TestingLoginLogsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $karyawan = Karyawan::where('username', 'alex')->first();

        if ($karyawan) {
            // Masukkan 30 data login logs
            for ($i = 0; $i < 30; $i++) {
                LoginLog::create([
                    'karyawan_id' => $karyawan->id,
                    // Tanggal/waktu login kita random-kan sedikit
                    'login_time'  => Carbon::now()->subMinutes(rand(0, 59)),
                    // IP address dummy
                    'ip_address'  => '127.0.0.' . rand(1, 254),
                ]);
            }

            $this->command->info("Berhasil menambahkan 30 data login_logs untuk user: {$karyawan->username}");
        } else {
            $this->command->error("Karyawan dengan username 'testuser' tidak ditemukan!");
        }
    }
}
