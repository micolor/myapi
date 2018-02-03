<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;
    protected $guarded = array();


    /**
     * 自定义用Passport授权登录：用户名+密码
     * @param $username
     * @return mixed
     */
    public function findForPassport($username)
    {
        return self::where('mobile', $username)->first();
    }
}
