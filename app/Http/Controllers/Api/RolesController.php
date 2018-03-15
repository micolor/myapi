<?php
/**
 * 角色管理
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/2/13
 * Time: 10:39
 */

namespace App\Http\Controllers\api;

use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Role;

class RoleController extends ApiController
{
    use Authorizable;

    /**
     * 角色列表
     * @return mixed
     */
    public function index()
    {
        $roles = Role::all();
        return $this->success($roles);
    }

    /**
     * 添加角色
     * @param Request $request
     * @return mixed
     */
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'roleName' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $roleName = $request->input('roleName');
        $role = Role::create(['name' => $roleName]);
        return $this->success($role);
    }

    /**
     * 删除角色
     * @param Request $request
     * @return mixed
     */
    public function del(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $rid = $request->input('id');
        $role = Role::findById($rid);
        if ($role && $role->delete()) {
            $message = '操作成功';
            $status = 'success';
        } else {
            $message = '操作失败';
            $status = 'error';
        };
        return $this->message($message, $status);
    }

    /**
     * 编辑角色
     */
    public function edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'roleName' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $rid = $request->input('id');
        $roleName = $request->input('roleName');
        $role = Role::findById($rid);
        $role->name = $roleName;
        if ($role->save()) {
            $message = '操作成功';
            $status = 'success';
        } else {
            $message = '操作失败';
            $status = 'error';
        };
        return $this->message($message, $status);
    }
}
