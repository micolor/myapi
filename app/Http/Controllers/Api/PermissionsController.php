<?php

namespace App\Http\Controllers\Api;

use App\models\Permission;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PermissionsController extends ApiController
{
    /**
     * 授权列表
     * @param Request $request
     */
    public function index(Request $request){
        $validator = Validator::make($request->all(), [
            'rid' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $rid = $request->input('rid');
        $role = Role::find($rid);
        $models = Permission::modelsList(0,$role);
        return $this->success($models);
    }
    /**
     * 授权给角色
     * @param Request $request
     */
    public function permission2role(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'rid' => 'required',
            'permission' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $id = $request->input('rid');
        $permission = $request->input('permission');
        $permission = explode(',', $permission);
        $role = Role::find($id);
        $role->syncPermissions($permission);
        return $this->message("操作成功！");
    }
}
