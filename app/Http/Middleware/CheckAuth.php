<?php

namespace App\Http\Middleware;

use App\Api\Helpers\Api\ApiResponse;
use App\models\Permission;
use Closure;

class CheckAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    use ApiResponse;
    public function handle($request, Closure $next)
    {
        $user = $request->user();
        if($user->id !=1){
            $permission = Permission::findPermissionName($request->getPathInfo());
            if (!($permission && $user->can($permission, Post::class))) {
                return $this->failed('权限不足', '401', $status = 'error');
            }
        }
        return $next($request);
    }
}
