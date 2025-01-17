<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Karyawan extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['nama', 'username', 'password', 'unit_id', 'tanggal_bergabung'];

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function jabatans()
    {
        return $this->belongsToMany(Jabatan::class, 'karyawan_jabatan');
    }
}
