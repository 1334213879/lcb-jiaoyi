<?php
namespace app\admin\model;

use app\user\model\Users as Users_;
use think\Db;
use think\Model;
//
class Users extends Model {
	protected $name = 'users';
	// birthday修改器
	protected function setpwdAttr($value) {
		return md5($value);
	}
	public static function cz($data) {
//后台充值 type_充值种类 title标题 user_id会员ID
		$user = db('users')->field('fxid,money_cz,user_id,nickname,level')->where(array('user_id' => $data['user_id']))->find();
		$data['time'] = time();
		$data['status'] = 1;
		if ($data['num'] > 0) {
			Db::startTrans();
			try {
				if ($data['type_'] == 'usdt') {
					$data['type'] = 1;
					$data['usdt'] = $data['num'];
					$data['title'] = !empty($data['title']) ? $data['title'] : '充值USDT';
					$c['money_usdt'] = ['exp', "`money_usdt`+{$data['num']}"];
					$c['money_cz'] = ['exp', "`money_cz`+{$data['num']}"];
				} else if ($data['type_'] == 'nmct_dj') {
					$data['type'] = 2;
					$data['nmct_dj'] = $data['num'];
					$data['title'] = !empty($data['title']) ? $data['title'] : '充值NMCT资产';
					$c['nmct_dj'] = ['exp', "`nmct_dj`+{$data['num']}"];
				} else if ($data['type_'] == 'nmct') {
					$data['type'] = 3;
					$data['nmct'] = $data['num'];
					$data['title'] = !empty($data['title']) ? $data['title'] : '充值NMCT通证';
					$c['nmct'] = ['exp', "`nmct`+{$data['num']}"];
				} else if ($data['type_'] == 'xmt') {
					$data['type'] = 4;
					$data['xmt'] = $data['num'];
					$data['title'] = !empty($data['title']) ? $data['title'] : '充值XMT通证';
					$c['xmt'] = ['exp', "`xmt`+{$data['num']}"];
				}
				Db::name('users')->where('user_id', $data['user_id'])->setField($c);
				$aid = Db::name('log')->insertGetId($data);
				$result['msg'] = '充值成功';
				$result['url'] = 'index';
				$result['code'] = 1;
				Db::commit();
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				Db::rollback();
				$result['code'] = 0;
				$result['msg'] = '充值失败';
			}
		} else {
			$result['msg'] = '充值数量不能小于0';
			$result['code'] = 0;
		}
		Users_::uplevel($data['user_id']); //升级
		return $result;
	}
}