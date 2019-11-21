<?php
namespace app\user\model;
use think\Db;
use think\Model;

class Users extends Model {
	protected $name = 'users';

	//合伙人对应比
	private static $gpercentage = [
		1 => 0.05,
		2 => 0.10,
		3 => 0.15,
		4 => 0.20,
	];

	public static function order($list, $t) {
		//多维数组重新排序
		if (count($list) > 0 && !empty($t)) {
			foreach ($list as $i => $a) {
				$volume[$i] = $a[$t];
			}
			array_multisort($volume, SORT_DESC, $list);
		}
		return $list;
	}

	public static function smsapi($mobile = '', $content = '') {
		$smsapi = "https://api.smsbao.com/";
		$user = 13922525853; //短信平台帐号
		$pass = md5("vv19800228"); //短信平台密码
		$sendurl = $smsapi . "sms?u=" . $user . "&p=" . $pass . "&m=" . $mobile . "&c=" . urlencode($content);
		if (!empty($mobile) && !empty($content)) {
			$result = file_get_contents($sendurl);
		}
		if (empty($result)) {
			return array('code' => 1, 'msg' => '验证码发送成功');
		} else {
			return array('code' => 0, 'msg' => '验证码发送失败');
		}
	}

	public static function randomkeys($length) {
		$pattern = '1234567890ABCDEFGHIJKLOMNOPQRSTUVWXYZ';
		$key = '';
		for ($i = 0; $i < $length; $i++) {
			$key .= $pattern{mt_rand(0, 35)}; //生成php随机数
		}
		return $key;
	}

	//会员升级
	public static function uplevel($user_id, $level = 0, $number = 0) {
		$user = db('users')->where('user_id', $user_id)->find();
		$system = db('system')->find();
		$data['time'] = time();
		$data['user_id'] = $user_id;
		$number = $number = 0 ? $user['money_usdt'] : $number;
		$level = db('user_level')->where("level_id={$level} and level_id>{$user['level']}")->find(); //是否大于当前级别
		if (!empty($level) && $user['pass'] == 1) {
//升级vip
			$data['title'] = '升级至' . $level['level_name'];
			$data['type'] = 5;
			unset($data['usdt']);
			$data['usdt'] = -$number;
			$xmt_number = ($level['money'] - $number) / $system['money_xmt'];
			if ($level['money'] > $number && $xmt_number > $user['xmt']) {
				return ['status' => 0, 'msg' => 'XMT不足！'];
			}
			$data['xmt'] = -$xmt_number;
			$data['nmct_dj'] = $level['money'] * 7 * $level['multiple']; //usdt换算nmct = usdt*7*级别倍数 = 冻结nmct
			if (db('log')->insert($data)) {
				db('users')->where("user_id={$user['user_id']} and pass=1")->setField([
					'level' => $level['level_id'],
					'money_usdt' => ['exp', "`money_usdt`-{$number}"],
					'xmt' => ['exp', "`xmt`-{$xmt_number}"],
					'nmct_dj' => ['exp', "`nmct_dj`+{$data['nmct_dj']}"],
				]);
			}
		}
		//升级合伙人
		$g = 0;
		if ($user['nmct_dj'] >= 500000) {
			$g = 1;
			$h1 = db('users')->where("`fxid`={$user_id} and `g`=1")->count();
			if ($user['g'] > 0 && $h1 >= 3) {
				$g = 2;
				$h2 = db('users')->where("`fxid`={$user_id} and `g`=2")->count();
				if ($user['g'] > 1 && $h2 >= 3) {
					$g = 3;
				}
			}

			//修改算法
			//            if (intval($user['g'], 0) >= 1) {
			//                $h1 = self::gCount($user_id,1);
			//                $g = 1;
			//
			//                if ($h1 > 3) {
			//                    $h2 = self::gCount($user_id,2);
			//                    $g = 2;
			//
			//                    if($h2 > 3){
			//                        $g = 3;
			//                    }
			//                }
			//
			//            }

		}
		if ($user['g'] != $g) {
			db('users')->where('user_id', $user['user_id'])->setField([
				'g' => $g,
			]);
		}
		return true;
	}

//    private static function gCount($fxid,$count = 1)
	//    {
	//        $total = db('users')
	//            ->where([
	//                'fxid' => $fxid,
	//                'g' => ['>=', $count]
	//            ])
	//            ->count();
	//
	//        return $total;
	//    }

	public static function isRedEnvelope($user_id) {
		$is_lock = db('users')->where("`user_id`={$user_id}")->value('is_red_envelope');
		if (!$is_lock) {
			return true;
		}
		return false;
	}

	/**
	 * 红包
	 * @param $user_id
	 * @param int $type
	 * @return float|int
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public static function hongbao($user_id, $type = 0) {
		$user = db('users')
			->where("`user_id`={$user_id}")
			->find();

		$log = db('log')
			->where("`user_id`={$user_id} and type=6")
			->whereTime('time', 'today')
			->find();

		//奖励
		$data['reward1'] = 0; //自身红包
		$data['reward2'] = 0; //邀请会员代数红包
		$data['reward3'] = 0; //合伙人极差

		$data['time'] = time();
		$data['type'] = 6; //领取红包
		$data['user_id'] = $user_id;

		if ($user['level'] > 1 && empty($log) && date("H") > 1 && date("H") < 24) {
			//静态收益
			$data['reward1'] = $user['hongbao'];

			//动态收益
			$z_count = db('users')
				->where("`fxid`={$user_id} and `is_red_envelope` = 0")
				->count(); //直推人数 = 奖励代数
			$z_count = $z_count > 50 ? 50 : $z_count; //最高50代
			$inv_hongbao = Db::query("select level,hongbao,find_in_set({$user_id},all_fxid) as f from clt_users where `level`>1 and find_in_set({$user_id},all_fxid)>0 and find_in_set({$user_id},all_fxid)<={$z_count} and pass>0 and hongbao>0 and `is_red_envelope` = 0 ");

			//代数奖励
			//1代 = 1
			//2代~5代 = 0.2
			//6代至10代 = 0.1
			//10代以后 = 0.01
			$hongbao = 0;
			foreach ($inv_hongbao as $a) {
				$a['f'] = ($a['f'] == 1 ? 1 :
					($a['f'] >= 2 && $a['f'] <= 5 ? 0.2 :
						($a['f'] >= 6 && $a['f'] <= 10 ? 0.1 : 0.01
						)));
				//$a['hongbao'] = ($a['hongbao'] > $user['hongbao'] ? $user['hongbao'] : $a['hongbao']) * $a['f'];  //计算代数奖励不能大于自身会员等级所领取的红包额度
				$a['hongbao'] = $a['hongbao'] > $user['hongbao'] ? $user['hongbao'] : $a['hongbao'];
				$a['level'] = $a['level'] > $user['level'] ? $user['level'] : $a['level'];
				if ($a['level'] == 2) {
					$hongbao = 6.3;
				}
				if ($a['level'] == 3) {
					$hongbao = 36.75;
				}
				if ($a['level'] == 4) {
					$hongbao = 84;
				}
				if ($a['level'] == 5) {
					$hongbao = 283.5;
				}
				if ($a['level'] == 6) {
					$hongbao = 525;
				}
				if ($a['level'] == 7) {
					$hongbao = 2520;
				}
				$data['reward2'] += $hongbao * $a['f'];
			}

			//合伙人极差算法
			//计算自身合伙人以下的所有会员的红包金额 - 自身合伙人以下的合伙人下（注意是合伙人）的所有会员的红包金额 = 合伙人极差极差
			if ($user['g'] > 0) {
				//计算自身合伙人以下的所有会员的红包金额
				$money_3 = self::partnerMoney($user);

				//自身合伙人以下的合伙人下（注意是合伙人）的所有会员的红包金额
				$partner_money = 0;
				$partner_list = db('users')
					->where("find_in_set({$user_id},all_fxid) and g>0 and g<{$user['g']} and `is_red_envelope` = 0")
					->select();

				foreach ($partner_list as $v) {
					$partner_money += self::partnerMoney($v);
				}

				$data['reward3'] = $money_3 - $partner_money;
				$data['reward3'] = $data['reward3'] > 0 ? $data['reward3'] : 0;
			}

			//总红包 取8位小数
			$money = round($data['reward1'] + $data['reward2'] + $data['reward3'], 8);

			if ($type > 0 && $money > 0) {
				$data['title'] = '领取红包';
				$data['nmct'] = $money; //收款方
				$data['nmct_dj'] = -$money; //待取
				$nmct = $user['nmct_dj'] > ($money / 2) ? ($money / 2) : $user['nmct_dj'];
				if (db('log')->insert($data)) {
					db('users')
						->where([
							'user_id' => $user_id,
							'is_red_envelope' => 0,
						])
						->setField([
							'nmct_dj' => ['exp', "`nmct_dj`-{$nmct}"],
							'nmct' => ['exp', "`nmct`+{$nmct}"],
						]);
					$data['title'] = '红包复投';
					$data['type'] = 7;
					$data['nmct'] = -$nmct;
					$data['nmct_dj'] = $nmct;
					unset($data['reward1']);
					unset($data['reward2']);
					unset($data['reward3']);
					db('log')->insert($data);
				}
			}
			return $money;
		} else {
			return 0;
		}
	}

	/**
	 * 计算合伙人下所有会员的等级对应红包金额
	 * @param array $user
	 * @return int|mixed
	 */
	public static function partnerMoney(array $user) {
		$money = 0;
		$list = db('users')
			->field('level,hongbao')
			->where("find_in_set({$user['user_id']},all_fxid)")
			->where([
				'level' => ['>', 1],
				'g' => ['<', $user['g']],
				'is_red_envelope' => 0,
			])
			->select();

		foreach ($list as $value) {
			//不能领取大于自身会员等级的红包
			$level = $value['level'] > $user['level'] ? $user['level'] : $value['level'];
			if ($level == 2) {
				$member_hongbao = 6.3;
			}
			if ($level == 3) {
				$member_hongbao = 36.75;
			}
			if ($level == 4) {
				$member_hongbao = 84;
			}
			if ($level == 5) {
				$member_hongbao = 283.5;
			}
			if ($level == 6) {
				$member_hongbao = 525;
			}
			if ($level == 7) {
				$member_hongbao = 2520;
			}

			$money += $member_hongbao;
		}

		$money = self::$gpercentage[$user['g']] * $money;

		return $money;
	}

	public static function password($pass, $salt = '') {
		$enPass = hash('sha256', $salt . $pass . $salt);
		$enPass = md5($salt . $enPass . $salt);
		return $enPass;
	}
}