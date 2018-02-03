<?php
/**
 * Created by PhpStorm.
 * User: Ann
 * Date: 2018/2/1
 * Time: 14:22
 */

namespace App\Http\Controllers\Api;


use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class LoginController extends ApiController
{

public function login(Request $request){

    $validator = Validator::make($request->all(), [
        'username'    => 'required',
        'password' => 'required',
    ]);

    if($validator->fails()) {
        return $this->message('请求参数有误',$status='error');
    };

    if (Auth::attempt(['mobile' => $request->get('username'), 'password' => $request->get('password')])) {
        $user = User::where('mobile',$request->get('username'))->first();
        $token = $user->createToken($user['name'])->accessToken;
        $data = $user;
        $data['token_type'] = "Bearer";
        $data['token'] = $token;
        return $this->success($data);
    }else{
        return $this->failed('账号信息有误');
    }

}
}
