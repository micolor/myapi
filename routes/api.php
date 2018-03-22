<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//统一处理options请求
Route::options('{all}', function () {
    $response = Response::make('OK');
    $response->header('Access-Control-Allow-Origin', '*');
    $response->header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept, Authorization,X-Auth-Token, X-Requested-with');
    $response->header('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE');
    $response->header('Access-Control-Allow-Credentials', 'true');
    return $response;
});

//登入获取token
Route::post('/login', 'Api\LoginController@login');

//需要客户端认证后才能访问
Route::middleware('client')->group(function () {
});

//需要登录认证后访问
Route::middleware('auth:api', 'checkAuth')->group(function () {
    //用户管理
    Route::prefix('user')->group(function () {
        Route::post('/index', 'Api\UserController@index')->middleware('tableList');
        Route::any('/del', 'Api\UserController@del');
    });
    //角色管理
    Route::prefix('role')->group(function () {
        Route::post('/index', 'Api\RolesController@index');
        Route::post('/add', 'Api\RolesController@add');
        Route::post('/del', 'Api\RolesController@del');
        Route::post('/edit', 'Api\RolesController@edit');
        Route::post('/role2user', 'Api\RolesController@role2user');
    });
    //权限管理
    Route::prefix('permission')->group(function () {
        Route::post('/index', 'Api\PermissionsController@index');
        Route::post('/permission2role', 'Api\PermissionsController@permission2role');
    });

    //菜单管理
    Route::prefix('module')->group(function () {
        Route::post('/index', 'Api\ModuleController@index');
        Route::post('/add', 'Api\ModuleController@add');
        Route::post('/del', 'Api\ModuleController@del');
        Route::post('/edit', 'Api\ModuleController@edit');
        Route::post('/detail', 'Api\ModuleController@detail');
        Route::post('/sort', 'Api\ModuleController@sort');
    });
});

Route::any('/test', function (Request $request) {
    return response($request);
});


