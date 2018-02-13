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
use GuzzleHttp\Client;

class LoginController extends ApiController
{
    public function __construct()
    {

    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->success('请求参数有误', $status = 'error');
        };

        if (Auth::attempt(['mobile' => $request->get('username'), 'password' => $request->get('password')])) {
            $user = User::where('mobile', $request->get('username'))->first();
            $client = new Client;
            $post = ['form_params' => [
                'grant_type' => 'password',
                'client_id' => '2',
                'client_secret' => 'psi1tc9zVIPDSXVSy4nm94BXOv0AlMKikReAN40R',
                'username' => $request->get('username'),
                'password' => $request->get('password'),
                'scope' => '*']
            ];
            $response = $client->post($request->getHttpHost().'/oauth/token', $post);
            $data = json_decode((string)$response->getBody(),true);
            $data['userinfo'] = $user;
            return $this->success($data);
        } else {
            return $this->failed('账号信息有误');
        }
    }
}
