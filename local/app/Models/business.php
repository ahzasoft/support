<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class business extends Model
{
    use HasFactory;
    protected $table = 'business';
    protected $fillable = [
        'name',
        'start_date',
    ];


}
