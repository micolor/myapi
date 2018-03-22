<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class module extends Model
{
    /**
     * 菜单列表
     * @param $parentId
     * @return mixed
     */
    static function modelsList($parentId)
    {
        $data = self::where('parentId', $parentId)->orderBy('sort', 'asc')->get();
        foreach ($data as $k => $v) {
            if (!$data->isEmpty()) {
                $data[$k]['children'] = self::modelsList($v->id);
            }
        }
        return $data;
    }

    /**
     * 根据当前数据获取父级以逗号隔开
     * @param $id
     */
    static function parentIdStr($id)
    {
        $array = array();
        do {
            $info = self::find($id);
            array_push($array, $info->parentid);
            $id = $info->parentid;
            unset($info);
        } while ($id && $id != '0');
        $res = implode(",", array_reverse ($array));
        return $res;
    }
}
