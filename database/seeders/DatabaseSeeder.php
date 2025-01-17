<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Insert data for units
        DB::table('units')->insert([
            ['nama_unit' => 'Finance'],
            ['nama_unit' => 'HR'],
            ['nama_unit' => 'IT'],
            ['nama_unit' => 'Marketing'],
            ['nama_unit' => 'Operations']
        ]);

        // Insert data for jabatans
        DB::table('jabatans')->insert([
            ['nama_jabatan' => 'Manager'],
            ['nama_jabatan' => 'Supervisor'],
            ['nama_jabatan' => 'Staff'],
            ['nama_jabatan' => 'Intern']
        ]);

        // Insert data for karyawans
        DB::table('karyawans')->insert([
            ['nama' => 'John Doe', 'username' => 'johndoe', 'password' => 'password123', 'unit_id' => 1, 'tanggal_bergabung' => '2023-01-01'],
            ['nama' => 'Jane Smith', 'username' => 'janesmith', 'password' => 'password123', 'unit_id' => 2, 'tanggal_bergabung' => '2023-02-15'],
            ['nama' => 'Alice Johnson', 'username' => 'alicej', 'password' => 'password123', 'unit_id' => 3, 'tanggal_bergabung' => '2023-03-10'],
            ['nama' => 'Bob Brown', 'username' => 'bobbrown', 'password' => 'password123', 'unit_id' => 4, 'tanggal_bergabung' => '2023-04-05'],
            ['nama' => 'Charlie White', 'username' => 'charliew', 'password' => 'password123', 'unit_id' => 5, 'tanggal_bergabung' => '2023-05-20'],
            ['nama' => 'Diana Prince', 'username' => 'dianap', 'password' => 'password123', 'unit_id' => 1, 'tanggal_bergabung' => '2023-06-25'],
            ['nama' => 'Ethan Hunt', 'username' => 'ethanh', 'password' => 'password123', 'unit_id' => 2, 'tanggal_bergabung' => '2023-07-15'],
            ['nama' => 'Fiona Carter', 'username' => 'fionac', 'password' => 'password123', 'unit_id' => 3, 'tanggal_bergabung' => '2023-08-05'],
            ['nama' => 'George Miller', 'username' => 'georgem', 'password' => 'password123', 'unit_id' => 4, 'tanggal_bergabung' => '2023-09-10'],
            ['nama' => 'Hannah Lee', 'username' => 'hannahlee', 'password' => 'password123', 'unit_id' => 5, 'tanggal_bergabung' => '2023-10-01']
        ]);

        // Assign jabatan to karyawans (pivot table data)
        DB::table('karyawan_jabatan')->insert([
            ['karyawan_id' => 1, 'jabatan_id' => 1],
            ['karyawan_id' => 2, 'jabatan_id' => 2],
            ['karyawan_id' => 3, 'jabatan_id' => 3],
            ['karyawan_id' => 4, 'jabatan_id' => 1],
            ['karyawan_id' => 5, 'jabatan_id' => 2],
            ['karyawan_id' => 6, 'jabatan_id' => 3],
            ['karyawan_id' => 7, 'jabatan_id' => 4],
            ['karyawan_id' => 8, 'jabatan_id' => 3],
            ['karyawan_id' => 9, 'jabatan_id' => 2],
            ['karyawan_id' => 10, 'jabatan_id' => 1]
        ]);
    }
}
