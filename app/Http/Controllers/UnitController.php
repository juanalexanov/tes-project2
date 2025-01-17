<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Models\Unit;

class UnitController extends Controller
{
    public function index()
    {
        $units = Unit::all();
        if (request()->ajax()) {
            return datatables()->of(Unit::select('*'))
                ->addColumn('action', 'karyawan_action')
                ->rawColumns(['action'])
                ->addIndexColumn()
                ->make(true);
        }
        return view('unit', compact('units'));
    }

    public function store(Request $request)
    {
        try{
            $request->validate([
                'nama_unit' => 'required|string|max:255',
            ]);

            $unit = Unit::updateOrCreate(
                ['id' => $request->id],
                [
                    'nama_unit' => $request->nama_unit,
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
        $unit = Unit::where($where)->first();

        return response()->json($unit);
    }

    public function delete(Request $request)
    {
        $unit = Unit::findOrFail($request->id);
        $unit->forceDelete();

        return response()->json(['success' => 'Data berhasil dihapus.']);
    }
}
