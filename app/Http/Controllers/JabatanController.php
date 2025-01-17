<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Jabatan;

class JabatanController extends Controller
{
    public function index()
    {
        $jabatans = Jabatan::all();
        if (request()->ajax()) {
            return datatables()->of(Jabatan::select('*'))
                ->addColumn('action', 'karyawan_action')
                ->rawColumns(['action'])
                ->addIndexColumn()
                ->make(true);
        }
        return view('jabatan', compact('jabatans'));
    }

    public function store(Request $request)
    {
        try{
            $request->validate([
                'nama_jabatan' => 'required|string|max:255',
            ]);

            $jabatan = Jabatan::updateOrCreate(
                ['id' => $request->id],
                [
                    'nama_jabatan' => $request->nama_jabatan,
                ]
            );

            return response()->json(['success' => 'Data berhasil disimpan.']);
        }catch(\Exception $e){
            return response()->json(['error' => 'Data gagal disimpan.']);
        }

        return response()->json(['success' => 'Data berhasil disimpan.']);
    }

    public function edit(Request $request)
    {
        $where = array('id' => $request->id);
        $jabatan = Jabatan::where($where)->first();

        return response()->json($jabatan);
    }

    public function delete(Request $request)
    {
        $jabatan = Jabatan::findOrFail($request->id);
        $jabatan->forceDelete();

        return response()->json(['success' => 'Data berhasil dihapus.']);
    }
}
