<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = 'role';
    protected $primaryKey = 'id';

    public $guarded = [];

    public function privileges()
    {
        return $this->belongsToMany('App\Model\Privilege', 'role_privilege', 'role_id', 'privilege_id')->withPivot(['role_id', 'privilege_id']);
    }
}
