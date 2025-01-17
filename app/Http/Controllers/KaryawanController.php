<?php

namespace App\Http\Controllers;

use App\Models\Jabatan;
use App\Models\Karyawan;
use App\Models\Unit;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class KaryawanController extends Controller
{
    // public function index()
    // {
    //     if(request()->ajax()) {
    //         return datatables()->of(Karyawan::select('*'))
    //         ->addColumn('action', 'karyawan-action')
    //         ->rawColumns(['action'])
    //         ->addIndexColumn()
    //         ->make(true);
    //     }
    //     return view('karyawan');
    // }
    public function index()
    {
        $units = Unit::all();
        $jabatans = Jabatan::all();
        if (request()->ajax()) {
            return datatables()->of(Karyawan::with('unit', 'jabatans')->select('*'))
                ->addColumn('unit', function ($row) {
                    return $row->unit ? $row->unit->nama_unit : 'Unit';
                })
                ->addColumn('jabatan', function ($row) {
                    return $row->jabatans->pluck('nama_jabatan')->implode(', ') ?: 'Jabatan';
                })
                ->addColumn('action', 'karyawan_action')
                ->rawColumns(['action'])
                ->addIndexColumn()
                ->make(true);
        }
        return view('karyawan', compact('units', 'jabatans'));
    }

    public function getJabatan(Request $request)
    {
        $search = $request->input('name');
        $jabatans = Jabatan::where('nama_jabatan', 'like', '%' . $search . '%')->get();

        return response()->json($jabatans);
    }


    public function store(Request $request)
    {
        try {
            $request->validate([
                'nama' => 'required|string|max:255',
                'username' => [
                    'required',
                    'string',
                    'max:255',
                    Rule::unique('karyawans', 'username')
                        ->ignore($request->id)
                        ->whereNull('deleted_at'),
                ],
                'password' => 'required|string|max:255',
                'unit_id' => 'required|exists:units,id',
                'tanggal_bergabung' => 'required|date',
                'jabatan_ids' => 'array',
                'jabatan_ids.*' => 'exists:jabatans,id',
            ], [
                'username.unique' => 'Username sudah digunakan. Silakan pilih username lain.',
                'username.required' => 'Username wajib diisi.',
                'nama.required' => 'Nama karyawan wajib diisi.',
            ]);

            // Simpan atau perbarui data
            $karyawan = Karyawan::updateOrCreate(
                ['id' => $request->id],
                [
                    'nama' => $request->nama,
                    'username' => $request->username,
                    'password' => $request->password,
                    'unit_id' => $request->unit_id,
                    'tanggal_bergabung' => $request->tanggal_bergabung,
                ]
            );

            if ($request->has('jabatan_ids')) {
                $karyawan->jabatans()->sync($request->jabatan_ids);
            }

            return response()->json(['success' => 'Karyawan saved successfully.']);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'error' => 'Validasi gagal.',
                'messages' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Terjadi kesalahan saat menyimpan data. Silakan coba lagi.',
                'message' => $e->getMessage(),
            ], 500);
        }
    }


    public function edit(Request $request)
    {
        $where = array('id' => $request->id);
        $karyawan  = Karyawan::where($where)->first();

        return Response()->json($karyawan);
    }

    public function delete(Request $request)
    {
        try {

            $karyawan = Karyawan::findOrFail($request->id);


            $karyawan->jabatans()->detach();

            $karyawan->forceDelete();

            return response()->json(['success' => 'Karyawan deleted successfully.']);
        } catch (\Exception $e) {
            return response()->json([
                'error' => 'Failed to delete karyawan. Please try again later.'
            ], 500);
        }
    }


}
