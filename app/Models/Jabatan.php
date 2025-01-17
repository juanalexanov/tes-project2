<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Jabatan extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['nama_jabatan'];


    public function karyawans()
    {
        return $this->belongsToMany(Karyawan::class, 'karyawan_jabatan');
    }
}
