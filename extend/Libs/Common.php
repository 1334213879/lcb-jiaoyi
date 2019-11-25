<?php
/**
 * Libs\Common
 */

namespace Libs;

class Common
{
    /**
     * 获取一个用于表单验证的hash值（注：只在半小时内有效，超出则会自动更新）
     *
     * @param  bool   $reset 是否重新生成hash值，默认为false，则原hash值在半小时内有效
     * @return string $hash  生成后的hash值
     */
    public static function hash($reset = false)
    {
        if(empty(session('oec_hash')) || empty(session('oec_hash_time')) ||
            ((time() - session('oec_hash_time')) > 1800) || $reset)
        {
            $hash = (session_id() . time() . mt_rand(1, 9999));
            $hash = md5(hash('sha256', $hash));
            session('oec_hash', $hash);
            session('oec_hash_time', time());
        }
        else
        {
            $hash = session('oec_hash');
        }

        return $hash;
    }

    /**
     * 验证一个hash值是否有效
     *
     * @param  string $hash  要验证的hash值
     * @param  bool   $reset 是否重新生成hash值，默认为true则验证成功后重置该hash值
     * @return bool          验证成功或有效时返回true,否则返回false
     */
    public static function checkHash($hash, $reset = true)
    {
        if(!empty(session('oec_hash')) && !empty(session('oec_hash_time')) &&
            ($hash === session('oec_hash')) && (time() - session('oec_hash_time') <= 1800))
        {
            if($reset)
            {
                self::hash(true); // 验证通过后让重新生成hash值
            }

            return true;
        }

        return false;
    }
}