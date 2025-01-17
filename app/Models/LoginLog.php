<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoginLog extends Model
{
    use HasFactory;
    protected $table = 'login_logs';


    protected $fillable = [
        'karyawan_id',
        'login_time',
        'ip_address'
    ];

    public function karyawan()
    {
        // belongsTo( Model, 'foreign_key', 'owner_key' );
        return $this->belongsTo(Karyawan::class, 'karyawan_id', 'id');
    }
}
