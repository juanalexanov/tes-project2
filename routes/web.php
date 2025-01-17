<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\JabatanController;
use App\Http\Controllers\KaryawanController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\UnitController;
use App\Models\Unit;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [LoginController::class, 'login'])->name('login');
Route::post('actionlogin', [LoginController::class, 'actionlogin'])->name('actionlogin');


// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->name('dashboard');


Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');

Route::get('master-karyawan', [KaryawanController::class, 'index']);
Route::post('get-jabatan', [KaryawanController::class, 'getJabatan']);
Route::post('edit', [KaryawanController::class, 'edit']);
Route::post('store', [KaryawanController::class, 'store']);
Route::post('delete', [KaryawanController::class, 'delete']);

Route::get('master-unit', [UnitController::class, 'index']);
Route::post('edit-unit', [UnitController::class, 'edit']);
Route::post('store-unit', [UnitController::class, 'store']);
Route::post('delete-unit', [UnitController::class, 'delete']);

Route::get('master-jabatan', [JabatanController::class, 'index']);
Route::post('edit-jabatan', [JabatanController::class, 'edit']);
Route::post('store-jabatan', [JabatanController::class, 'store']);
Route::post('delete-jabatan', [JabatanController::class, 'delete']);
