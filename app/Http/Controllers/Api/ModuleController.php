<?php

namespace App\Http\Controllers\Api;

use App\Models\Module;
use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;


class ModuleController extends ApiController
{
    /**
     *菜单管理列表
     */
    public function index()
    {
        $module = Module::modelsList(0);
        return $this->success($module);
    }

    /**
     * 新增菜单
     * @param Request $request
     * @return mixed
     */
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'url' => 'required',
            'parentId' => 'required',
            'permission' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $permission = Permission::create(['name' => $request->input('permission')]);
        if ($permission->id) {
            $message = '操作成功!';
            $status = 'success';
            $module = new Module();
            $module->name = $request->input('name');
            $module->url = $request->input('url');
            $module->parentId = $request->input('parentId');
            $module->id = $permission->id;
            $module->icon = $request->input('icon');
            $module->show = $request->input('show');
            $module->save();
        } else {
            $message = '操作失败!';
            $status = 'error';
        }
        return $this->message($message, $status);
    }

    /**
     * 删除菜单
     * @param Id $id
     */
    public function del(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $id = $request->input('id');
        $permission = Permission::find($id);
        if ($permission && $permission->delete()) {
            $message = '操作成功';
            $status = 'success';
        } else {
            $message = '操作失败';
            $status = 'error';
        };
        return $this->message($message, $status);
    }

    /**
     * 菜单编辑
     * @param Request $request
     * @return mixed
     */
    public function edit(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id'=>'required',
            'name' => 'required',
            'url' => 'required',
            'parentId' => 'required',
            'permission' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $message = '操作成功!';
        $status = 'success';
        $id = $request->input('id');
        $Permission = Permission::find($id);
        if ($Permission->id) {
            $Permission->name = $request->input('permission');
            $Permission->save();
            $menus = Module::find($Permission->id);
            $menus->name = $request->input('name');
            $menus->url = $request->input('url');
            $menus->parentId = $request->input('parentId');
            $menus->icon = $request->input('icon');
            $menus->show = $request->input('show');
            $menus->save();
        } else {
            $message = '操作失败!';
            $status = 'error';
        }
        return $this->message($message, $status);
    }

    /**
     * 菜单详情
     * @param Request $request
     * @return mixed
     */
    public function detail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $id = $request->input('id');
        $info = DB::table('permissions')
            ->leftJoin('modules', 'permissions.id', '=', 'modules.id')->where('permissions.id', '=', $id)->select('modules.*','permissions.name as permission')
            ->first();
        $str =  module::parentIdStr($info->id);
        $info->chose = $str;
        return $this->success($info);
    }

    /**
     * 菜单排序
     * @param Request $request
     */
    public function sort(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
            'sort' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $id = $request->input('id');
        $sort = $request->input('sort');
        $menus = Menus::find($id);
        $menus->sort = $sort;
        $menus->save();
        return $this->message("操作成功！");
    }

}
