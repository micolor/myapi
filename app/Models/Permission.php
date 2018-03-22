<?php

namespace App\models;

use Illuminate\Support\Facades\DB;

class Permission extends \Spatie\Permission\Models\Permission
{

    /**
     * 授权菜单数据处理
     * @param $parentId
     * @param $role
     * @return mixed
     */
    static function modelsList($parentId, $role)
    {
        $permission = DB::table('permissions')
            ->leftJoin('menus', 'permissions.id', '=', 'menus.id')->where('menus.parentid', '=', $parentId)->select('menus.*', 'permissions.name as permissionName')
            ->orderBy('sort', 'asc')
            ->get();
        foreach ($permission as $k => $v) {
            if ($role->hasPermissionTo($v->permissionName)) {
                $v->isCheck = '1';
            } else {
                $v->isCheck = '2';
            }
            if (!$permission->isEmpty()) {
                $v->children = self::modelsList($v->id,$role);
            }
        }
        return $permission;
    }

    /**
     * 查找权限名称
     * @param $url
     * @return mixed
     */
    static function findPermissionName($url)
    {
        $data = DB::table('permissions')
            ->leftJoin('menus', 'permissions.id', '=', 'menus.id')->where('menus.url', '=', $url)->select('permissions.name')
            ->first();
        $name = null;
        if($data) $name = $data->name;
        return $name;
    }
}
