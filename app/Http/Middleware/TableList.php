<?php

namespace App\Http\Middleware;

use App\Api\Helpers\Api\ApiResponse;
use Closure;
use Illuminate\Support\Facades\Validator;

class TableList
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
        $validator = Validator::make($request->all(), [
            'page' => 'numeric',
            'pageSize' => 'numeric'
        ]);
        if ($validator->fails()) {
            return $this->message('请求参数有误', $status = 'error');
        };
        if (is_array($request->input('sortBy'))) {
            $sortBy = $request->input('sortBy')['key'] . " " . $request->input('sortBy')['order'];
            request()->offsetSet('sortBy', $sortBy);
        }
        if (is_array($request->input('searchBy'))) {
            $searchBy = array();
            foreach ($request->input('searchBy') as $k => $v) {
                switch ($v['isEq']) {
                    case 'like':
                        array_push($searchBy, $this->searchByLike($v));
                        break;
                    case 'like-l':
                        array_push($searchBy, $this->searchByLikeL($v));
                        break;
                    case 'eq':
                        array_push($searchBy, $this->searchByEq($v));
                    case 'in':
                        array_push($searchBy, $this->searchByIn($v));
                        break;
                    case 'lt':
                        array_push($searchBy, $this->searchByLt($v));
                        break;
                    case 'lte':
                        array_push($searchBy, $this->searchByLt($v));
                        break;
                    case 'gt':
                        array_push($searchBy, $this->searchByGt($v));
                        break;
                    case 'gte':
                        array_push($searchBy, $this->searchByGte($v));
                        break;
                    case 'between':
                        array_push($searchBy, $this->searchByBetween($v));
                        break;
                }
            }
            request()->offsetSet('searchBy', implode(" and ", $searchBy));
        }
        return $next($request);
    }

    /**
     * 模糊查找
     * @param $data
     * @return string
     */
    public function searchByLike($data)
    {
        return $data['name'] . ' like \'%' . $data['val'] . '%\'';
    }

    /**
     * 模糊查找从左边开始匹配
     * @param $data
     * @return string
     */
    public function searchByLikeL($data)
    {
        return $data['name'] . ' like \'' . $data['val'] . '%\'';
    }

    /**
     * where In
     * @param $data
     * @return string
     */
    public function searchByIn($data)
    {
        return $data['name'] . ' in (' . implode(',', $data['val']) . ')';
    }

    /**
     * where <
     * @param $data
     * @return string
     */
    public function searchByLt($data)
    {
        return $data['name'] . ' <  ' . $data['val'] . '\'';
    }

    /**
     * where <=
     * @param $data
     * @return string
     */
    public function searchByLte($data)
    {
        return $data['name'] . ' <=  ' . $data['val'] . '\'';
    }

    /**
     * where >
     * @param $data
     * @return string
     */
    public function searchByGt($data)
    {
        return $data['name'] . ' >  ' . $data['val'] . '\'';
    }

    /**
     * where >=
     * @param $data
     * @return string
     */
    public function searchByGtE($data)
    {
        return $data['name'] . ' >=  ' . $data['val'] . '\'';
    }

    /**
     * where between
     * @param $data
     * @return string
     */
    public function searchByBetween($data)
    {
        $bl = date("Y-m-d H:i:s", strtotime($data['val'][0]));
        $br = date("Y-m-d H:i:s", strtotime($data['val'][1]) + 86400);
        return $data['name'] . ' > \'' . $bl . '\' and ' . $data['name'] . ' < \'' . $br . '\'';
    }

    /**
     * where eq
     * @param $data
     * @return string
     */
    public function searchByEq($data)
    {
        return $data['name'] . '= \'' . $data['val'] . '\'';
    }
}
