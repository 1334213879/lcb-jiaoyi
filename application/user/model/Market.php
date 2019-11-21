<?php
namespace app\user\model;

use think\Model;
use think\Request;
use Libs\Http;

class Market extends Model
{
    public static function getDatas()
    {
        $url='http://api.coindog.com/api/v1/currency/ranks';
        $list = (string) Http::curl_get_https($url);
        $list= json_decode($list, true);//得到的是 array
        return $list;
    }
	public static function ranking()
    {
     	$user=db('users')->field('nickname,oec')->where('oec','>','0')->order('oec desc')->limit(30)->select();
		$system=db('system')->field('number')->find(1);
		$count=db('users')->count();
		$user[0]['number']=$system['number']+$count;
		return json_encode($user);
    }
}