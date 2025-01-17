<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Management Karyawan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <meta name="csrf-token" content="{{ csrf_token() }}">

</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Management Karyawan</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <!-- Dashboard -->
                <li class="nav-item {{ Request::is('dashboard') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ url('/dashboard') }}">
                        Dashboard
                    </a>
                </li>

                <!-- Master Karyawan -->
                <li class="nav-item {{ Request::is('master-karyawan') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ url('master-karyawan') }}">
                        Master Karyawan
                    </a>
                </li>

                <!-- Master Unit -->
                <li class="nav-item {{ Request::is('master-unit') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ url('master-unit') }}">
                        Master Unit
                    </a>
                </li>

                <!-- Master Jabatan -->
                <li class="nav-item {{ Request::is('master-jabatan') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ url('master-jabatan') }}">
                        Master Jabatan
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container my-5">
        @yield('content')
    </div>

    <!-- Footer -->
    {{-- <footer class="bg-dark text-center text-lg-start mt-auto py-3 text-white">
        <div class="container text-center">
            <p class="mb-0">&copy; {{ date('Y') }} Tes Project Juan Alexanov. All rights reserved.</p>
        </div>
    </footer> --}}


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>
