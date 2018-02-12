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
     * 在用户模型和角色模型中实现多对多
     * @return $this
     */
    public function roles()
    {
        return $this->belongsToMany('App\Model\Role', 'user_role', 'user_id', 'role_id')->withPivot('user_id', 'role_id');
    }
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
