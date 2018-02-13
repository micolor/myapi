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

//登入获取token
Route::post('/login','Api\LoginController@login');
//需要客户端认证后才能访问
Route::middleware('client')->group(function (){

});

//需要登录认证后访问
Route::middleware('auth:api')->group(function (){
    Route::prefix('user')->group(function (){
        Route::any('/index','Api\UserController@index')->middleware('ctablelist');
        Route::any('/del','Api\UserController@del');
    });
    //角色管理
    Route::prefix('role')->group(function (){
        Route::post('/index','Api\RoleController@index');
        Route::post('/add','Api\RoleController@add');
        Route::post('/del','Api\RoleController@del');
        Route::post('/edit','Api\RoleController@edit');
    });
    //权限管理
    Route::prefix('permission')->group(function (){
        Route::post('/index','Api\PermissionController@index');
        Route::post('/add','Api\PermissionController@add');
        Route::post('/del','Api\PermissionController@del');
        Route::post('/edit','Api\PermissionController@edit');
    });
});

Route::any('/test',function(Request $request){
    return response($request);
});


