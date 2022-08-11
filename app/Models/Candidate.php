<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Candidate extends Model
{
    use HasFactory;

    protected $fillable = [
        'job_id',
        'name',
        'email',
        'phone',
        'year',
    ];

    protected $casts = [
        'created_at' => 'datetime:d-M-Y'
    ];

    protected $with = ['jobs'];
}
