<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $fillable = [
        'title', 'duration', 'status', 'start_date','end_date'
    ];

    public function users()
    {
        return $this->belongsToMany(User::class);
    }
    public function marks()
    {
        return $this->hasMany(Mark::class);
    }
    public function lessons()
    {
        return $this->hasMany(Lesson::class);
    }

}
