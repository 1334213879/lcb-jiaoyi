<?php
/**
 * Libs\Http
 */

namespace Libs;


class Http
{
    public static function curl_get_https($url, $timeout = 10)
    {
        // 暂时保留该方法，后期需要整理
        require_once APP_PATH . 'user/controller/geturl.php';
        return curl_get_https($url, $timeout);
    }
}