<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Skill_set extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $fillable = [
        'job_id',
        'candidate_id',
        'skill_id',
    ];

    public function jobs()
    {
        return $this->belongsTo(Job::class, 'job_id');
    }
    public function skills()
    {
        return $this->belongsTo(Skill::class, 'skill_id');
    }

    protected $with = ['jobs', 'skills'];
}
