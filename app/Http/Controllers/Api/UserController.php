<?php
/**
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/2/1
 * Time: 10:37
 */

namespace App\Http\Controllers\Api;


use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class UserController extends ApiController
{

    /**
     * 用户管理列表
     * @param Request $request
     * @return mixed
     */
    public function list(Request $request)
    {
        $sortBy = $request->input('sortBy');
        $whereBy =  $request->input('searchBy');
        $data = User::when($sortBy, function ($query) use ($sortBy) {
            return $query->orderByRaw($sortBy);
        }, function ($query) {
            return $query->orderByRaw('created_at desc');
        })->when($whereBy, function ($query) use ($whereBy) {
            return $query->whereRaw($whereBy);
        })->paginate($request->input('pageSize') ?: 20);
        return $this->success($data);
    }


    public function del(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        $user = User::find($request->input("id"));
        if ($user && $user->delete()) {
            $message = '操作成功';
            $status = 'success';
        } else {
            $message = '操作失败';
            $status = 'error';
        };
        return $this->message($message, $status);
    }
}
