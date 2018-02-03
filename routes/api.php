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
Route::any('/login','Api\LoginController@login');

//需要客户端认证后才能访问
Route::middleware('client')->group(function (){

});

//需要登录认证后访问
//Route::middleware('auth:api')->group(function (){
    Route::prefix('user')->group(function (){
        Route::any('/list','Api\UserController@list');
        Route::any('/del','Api\UserController@del');
        Route::any('/index','Api\UserController@list');
    });
//});

Route::any('cors/test',function(){
    return response('111');
});


