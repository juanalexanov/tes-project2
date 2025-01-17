<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Karyawan;
use App\Models\Unit;
use App\Models\Jabatan;
use App\Models\LoginLog;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        // Cek apakah tombol Reset ditekan
        if ($request->has('reset')) {
            // Kosongkan start_date & end_date
            $start_date_str = null;
            $end_date_str   = null;
        } else {
            // Ambil input date-time lokal
            $start_date_str = $request->input('start_date');
            $end_date_str   = $request->input('end_date');
        }

        // Parsing date-time jika ada
        $startDate = null;
        $endDate   = null;

        if ($start_date_str && $end_date_str) {
            // Ganti 'T' dengan spasi agar jadi "YYYY-MM-DD HH:mm"
            $start_date_str = str_replace('T', ' ', $start_date_str);
            $end_date_str   = str_replace('T', ' ', $end_date_str);

            // Convert ke Carbon
            $startDate = Carbon::parse($start_date_str);
            $endDate   = Carbon::parse($end_date_str);
        }

        if ($startDate && $endDate) {
            $totalKaryawan = Karyawan::whereBetween('created_at', [$startDate, $endDate])->count();
            $totalUnits    = Unit::whereBetween('created_at', [$startDate, $endDate])->count();
            $totalJabatans = Jabatan::whereBetween('created_at', [$startDate, $endDate])->count();
            $totalLogins   = LoginLog::whereBetween('login_time', [$startDate, $endDate])->count();
        } else {
            $totalKaryawan = Karyawan::count();
            $totalUnits    = Unit::count();
            $totalJabatans = Jabatan::count();
            $totalLogins   = LoginLog::count();
        }

        // Top 10 user (login > 25)
        $topUsersQuery = LoginLog::select(
            'karyawan_id',
            DB::raw('COUNT(*) as total_login')
        )
        ->when($startDate && $endDate, function($query) use($startDate, $endDate) {
            return $query->whereBetween('login_time', [$startDate, $endDate]);
        })
        ->groupBy('karyawan_id')
        ->havingRaw('COUNT(*) > 25')
        ->orderBy('total_login', 'DESC')
        ->limit(10);
        $topUsers = $topUsersQuery->get();

        return view('dashboard', [
            'totalKaryawan' => $totalKaryawan,
            'totalUnits'    => $totalUnits,
            'totalJabatans' => $totalJabatans,
            'totalLogins'   => $totalLogins,
            'topUsers'      => $topUsers,

            // Kembalikan ke blade agar form tetap menampilkan nilai
            // (kosong jika reset, atau input semula jika filter)
            'start_date'    => $request->has('reset') ? null : $request->input('start_date'),
            'end_date'      => $request->has('reset') ? null : $request->input('end_date'),
        ]);
    }

}
