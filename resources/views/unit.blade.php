<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MASTER UNIT (Create Read Update and Delete)</title>
<meta name="csrf-token" content="{{ csrf_token() }}">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" >
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<link  href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<!-- Tom Select CSS -->
<link href="https://cdn.jsdelivr.net/npm/tom-select/dist/css/tom-select.bootstrap5.min.css" rel="stylesheet">

<!-- Tom Select JS -->
<script src="https://cdn.jsdelivr.net/npm/tom-select/dist/js/tom-select.complete.min.js"></script>

</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Management Unit</a>
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
                <h2>Master Unit CRUD (Create Read Update and Delete) </h2>
            </div>
            <div class="pull-right mb-2">
                <a class="btn btn-success" onClick="add()" href="javascript:void(0)"> Create Unit</a>
            </div>
        </div>
    </div>
    <div class="card-body">
        <table class="table table-bordered" id="master-unit">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nama Unit</th>
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
                <h5 class="modal-title">Unit</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="javascript:void(0)" id="EmployeeForm" name="EmployeeForm" class="form-horizontal" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" id="id">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Nama Unit</label>
                            <div class="col-sm-12">
                            <input type="text" class="form-control" id="nama_unit" name="nama_unit" placeholder="Enter Unit Name" maxlength="50" required="">
                        </div>
                    </div>
                    <div class="col-sm-offset-2 col-sm-10"><br/>
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
    $(document).ready( function () {
        $.ajaxSetup({
            headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#master-unit').DataTable({
            processing: true,
            serverSide: true,
            ajax: "{{ url('master-unit') }}",
            columns: [
                { data: 'id', name: 'id' },
                { data: 'nama_unit', name: 'nama_unit' },
                { data: 'action', name: 'action', orderable: false },
            ],
            order: [[0, 'asc']]
        });
    });

    function add(){
        $('#EmployeeForm').trigger("reset");
        $('#EmployeeModal').html("Add Unit");
        $('#employee-modal').modal('show');
        $('#id').val('');
    }

    function editFunc(id) {
        $.ajax({
            type: "POST",
            url: "{{ url('edit-unit') }}",
            data: { id: id },
            dataType: 'json',
            success: function(res) {
                $('#EmployeeModal').html("Edit Unit");
                $('#employee-modal').modal('show');
                $('#id').val(res.id);
                $('#nama_unit').val(res.nama_unit);
            }
        });
    }

    function deleteFunc(id) {
        if (confirm("Are you sure you want to delete this record?")) {
            $.ajax({
                type: "POST",
                url: "{{ url('delete-unit') }}",
                data: {
                    id: id,
                    _token: $('meta[name="csrf-token"]').attr('content')
                },
                dataType: "json",
                success: function(res) {
                    alert('Record deleted successfully!');
                    $('#master-unit').DataTable().ajax.reload();
                },
                error: function(err) {
                    console.error(err);
                    alert('Failed to delete record. Please check console for details.');
                }
            });
        }
    }

    $('#EmployeeForm').submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);

        $.ajax({
            type: 'POST',
            url: "{{ url('store-unit') }}",
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                if (data.success) {
                    alert(data.success);
                    $('#employee-modal').modal('hide');
                    $('#master-unit').DataTable().ajax.reload();
                }
            },
            error: function (xhr) {
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
