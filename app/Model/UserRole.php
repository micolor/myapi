<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    protected $primaryKey = 'id';
    protected $table = 'user_role';

    public $guarded = [];
}
