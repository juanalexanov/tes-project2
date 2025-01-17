@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Dashboard</h1>


    <form action="{{ route('dashboard') }}" method="GET" class="mb-3">
        <div class="row">
            <div class="col-md-3">
                <label for="start_date">Start Date</label>
                <input type="datetime-local" id="start_date" name="start_date"
                       value="{{ $start_date }}" class="form-control">
            </div>
            <div class="col-md-3">
                <label for="end_date">End Date</label>
                <input type="datetime-local" id="end_date" name="end_date"
                       value="{{ $end_date }}" class="form-control">
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <!-- Tombol Apply Filter -->
                <button type="submit" class="btn btn-primary mt-2">Filter</button>

                <!-- Tombol Reset Filter -->
                <button type="submit" name="reset" value="1" class="btn btn-secondary mt-2 ms-2">
                    Reset
                </button>
            </div>
        </div>
    </form>

    <hr>

    {{-- Dashboard Summary --}}
    <div class="row">
        <div class="col-md-3">
            <div class="alert alert-info">
                <strong>Jumlah Karyawan{{ $start_date && $end_date ? ' (Filtered)' : '' }}:</strong>
                <h4>{{ $totalKaryawan }}</h4>
            </div>
        </div>
        <div class="col-md-3">
            <div class="alert alert-info">
                <strong>Jumlah Unit{{ $start_date && $end_date ? ' (Filtered)' : '' }}:</strong>
                <h4>{{ $totalUnits }}</h4>
            </div>
        </div>
        <div class="col-md-3">
            <div class="alert alert-info">
                <strong>Jumlah Jabatan{{ $start_date && $end_date ? ' (Filtered)' : '' }}:</strong>
                <h4>{{ $totalJabatans }}</h4>
            </div>
        </div>
        <div class="col-md-3">
            <div class="alert alert-info">
                <strong>Jumlah Login{{ $start_date && $end_date ? ' (Filtered)' : '' }}:</strong>
                <h4>{{ $totalLogins }}</h4>
            </div>
        </div>
    </div>

    {{-- Top 10 User dengan login > 25 --}}
    <h3>Top 10 User dengan Login lebih 25</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Nama Karyawan</th>
                <th>Total Login</th>
            </tr>
        </thead>
        <tbody>
            @forelse($topUsers as $user)
                <tr>
                    <td>

                        {{ optional($user->karyawan)->nama }}
                    </td>
                    <td>{{ $user->total_login }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="2">Tidak ada data (atau belum ada yang > 25 login)</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>
@endsection
