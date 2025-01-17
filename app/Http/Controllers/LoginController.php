<?php

namespace App\Http\Controllers;

use App\Models\Karyawan;
use App\Models\LoginLog;
use Carbon\Carbon;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function login()
    {
        return view('login');
    }

    public function actionLogin(Request $request)
    {
        $username = $request->input('username');
        $password = $request->input('password');

        $karyawan = Karyawan::where('username', $username)->first();
        if ($karyawan) {
            if ($password === $karyawan->password) {

                 // CATAT log login
                 LoginLog::create([
                    'karyawan_id' => $karyawan->id,
                    'login_time'  => Carbon::now(),
                    'ip_address'  => $request->ip(),
                ]);

                return redirect()->route('dashboard')->with('success', 'Login berhasil!');
                // dd('Login berhasil!');
            } else {
                return redirect()->back()->withErrors(['password' => 'Password salah!']);
            }
        } else {
            return redirect()->back()->withErrors(['username' => 'Username tidak ditemukan!']);
        }
    }


}
