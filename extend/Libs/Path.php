<?php
/**
 * Libs\Path
 */

namespace Libs;


class Path
{
    /**
     * 检测路径是否存在
     *
     * @param  string $path         要检测的路径（为了安全性，如果$auto_create为true时该参数必须为完整绝对路径）
     * @param  bool   $auto_create  如果不存在是否自动创建
     * @return bool
     */
    public static function checkDir($path, $auto_create = true)
    {
        if($auto_create)
        {
            // 非法路径
            if(false !== strpos($path, '.')) {
                return false;
            }

            $root = dirname(realpath(APP_PATH));

            if(0 !== stripos($path, $root)) {
                $path = $root . $path;
            }

            $subPath = str_replace($root, '', $path);
            $subPathArr = array_filter(explode(DIRECTORY_SEPARATOR, $subPath));

            foreach($subPathArr as $_path)
            {
                $root .= DIRECTORY_SEPARATOR . $_path;

                if(!is_dir($root))
                {
                    mkdir($root, 0777);
                }
            }

            $path = $root;
        }

        return is_dir($path);
    }
}