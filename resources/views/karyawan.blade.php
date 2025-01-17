<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>MASTER KARYAWAN (Create Read Update and Delete)</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <!-- Tom Select CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tom-select/dist/css/tom-select.bootstrap5.min.css" rel="stylesheet">

    <!-- Tom Select JS -->
    <script src="https://cdn.jsdelivr.net/npm/tom-select/dist/js/tom-select.complete.min.js"></script>

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

    <div class="container mt-2">
        <div class="row">
            <div class="col-lg-12 margin-tb">
                <div class="pull-left">
                    <h2>Master Karyawan CRUD (Create Read Update and Delete) </h2>
                </div>
                <div class="pull-right mb-2">
                    <a class="btn btn-success" onClick="add()" href="javascript:void(0)"> Create Karyawan</a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered" id="master-karyawan">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Unit</th>
                        <th>Jabatan</th>
                        <th>Tanggal Bergabung</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

    <!-- boostrap karyawan modal -->
    <div class="modal fade" id="employee-modal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Karyawan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="javascript:void(0)" id="EmployeeForm" name="EmployeeForm" class="form-horizontal"
                        method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="id" id="id">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Nama Karyawan</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="nama" name="nama"
                                    placeholder="Enter Name" maxlength="50" required="">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Username</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="username" name="username"
                                    placeholder="Enter username" maxlength="50" required="">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="password" name="password"
                                    placeholder="Enter Password" required="">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="unit" class="col-sm-2 control-label">Unit</label>
                            <div class="col-sm-12">
                                <select class="form-control" id="unit_id" name="unit_id" required="">
                                    <option value="">Select Unit</option>
                                    @foreach ($units as $unit)
                                        <option value="{{ $unit->id }}">{{ $unit->nama_unit }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="tanggal_bergabung" class="col-sm-2 control-label">Tanggal Bergabung</label>
                            <div class="col-sm-12">
                                <input type="date" class="form-control" id="tanggal_bergabung"
                                    name="tanggal_bergabung" required="">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="jabatan" class="col-sm-2 control-label">Jabatan</label>
                            <div class="col-sm-12">
                                <select class="form-control" id="jabatan_ids" name="jabatan_ids[]" multiple>
                                    @foreach ($jabatans as $jabatan)
                                        <option value="{{ $jabatan->id }}">{{ $jabatan->nama_jabatan }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <div class="col-sm-offset-2 col-sm-10"><br />
                            <button type="submit" class="btn btn-primary" id="btn-save">Save changes</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <!-- end bootstrap model -->
    <script type="text/javascript">
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('#master-karyawan').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ url('master-karyawan') }}",
                columns: [{
                        data: 'id',
                        name: 'id'
                    },
                    {
                        data: 'nama',
                        name: 'nama'
                    },
                    {
                        data: 'username',
                        name: 'username'
                    },
                    {
                        data: 'password',
                        name: 'password'
                    },
                    {
                        data: 'unit',
                        name: 'unit'
                    },
                    {
                        data: 'jabatan',
                        name: 'jabatan'
                    },
                    {
                        data: 'tanggal_bergabung',
                        name: 'tanggal_bergabung'
                    },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false
                    },
                ],
                order: [
                    [0, 'asc']
                ]
            });

            // Inisialisasi Tom Select
            new TomSelect('#jabatan_ids', {
                plugins: {
                    remove_button: {
                        title: 'Hapus'
                    }
                },
                maxItems: null,
                valueField: 'id',
                labelField: 'nama_jabatan',
                searchField: 'nama_jabatan',
                load: function(query, callback) {
                    if (!query.length) return callback();
                    fetch("{{ url('get-jabatan') }}", {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                            },
                            body: JSON.stringify({
                                name: query
                            })
                        })
                        .then(response => response.json())
                        .then(json => {
                            callback(json);
                        })
                        .catch(() => {
                            callback();
                        });
                },
            });
        });

        function add() {
            $('#EmployeeForm').trigger("reset");
            $('#EmployeeModal').html("Add Employee");
            $('#employee-modal').modal('show');
            $('#id').val('');

            // Reset Tom Select agar kosong
            var jabatanSelect = TomSelect.getInstance('#jabatan_ids');
            if (jabatanSelect) jabatanSelect.clear();
        }

        function editFunc(id) {
            $.ajax({
                type: "POST",
                url: "{{ url('edit') }}",
                data: {
                    id: id
                },
                dataType: 'json',
                success: function(res) {
                    $('#EmployeeModal').html("Edit Karyawan");
                    $('#employee-modal').modal('show');
                    $('#id').val(res.id);
                    $('#nama').val(res.nama);
                    $('#username').val(res.username);
                    $('#password').val(res.password);
                    $('#unit_id').val(res.unit_id);
                    // Set value Tom Select
                    var jabatanSelect = TomSelect.getInstance('#jabatan_ids');
                    if (jabatanSelect) {
                        jabatanSelect.clear();
                        // Pastikan data dari res.jabatans ada
                        if (res.jabatans) {
                            let jabatanArray = res.jabatans.map(j => j.id);
                            // Set multiple selected
                            jabatanSelect.setValue(jabatanArray);
                        }
                    }
                    $('#tanggal_bergabung').val(res.tanggal_bergabung);
                }
            });
        }

        function deleteFunc(id) {
            if (confirm("Are you sure you want to delete this record?")) {
                $.ajax({
                    type: "POST",
                    url: "{{ url('delete') }}",
                    data: {
                        id: id,
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    dataType: "json",
                    success: function(res) {
                        alert('Record deleted successfully!');
                        $('#master-karyawan').DataTable().ajax.reload();
                    },
                    error: function(err) {
                        console.error(err);
                        alert('Failed to delete record. Please check console for details.');
                    }
                });
            }
        }

        $('#EmployeeForm').submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                type: 'POST',
                url: "{{ url('store') }}",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {
                    if (data.success) {
                        alert(data.success);
                        $('#employee-modal').modal('hide');
                        $('#master-karyawan').DataTable().ajax.reload();
                    }
                },
                error: function(xhr) {
                    if (xhr.status === 422) {
                        // Validasi error dari backend
                        var errors = xhr.responseJSON.errors;
                        var errorMessage = '';
                        for (var key in errors) {
                            if (errors.hasOwnProperty(key)) {
                                errorMessage += errors[key][0] + '\n';
                            }
                        }
                        alert(errorMessage);
                    } else {
                        alert('An error occurred. Please try again.');
                    }
                }
            });
        });
    </script>

</body>

</html>
