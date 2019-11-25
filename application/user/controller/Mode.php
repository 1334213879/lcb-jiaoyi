<?php
namespace app\user\controller;
use app\user\model\Users;
use think\Cache;
use think\Db;
use think\Input;

class Mode extends Common {
	public function _initialize() {
		parent::_initialize();
	}
	public function cs() {
		return Users::pw3(10804);
	}
	public function bb() {
		$user_id = input('user_id') ? input('user_id') : session('user.user_id');
		$hongbao = 0;
		//先检查红包是否被冻结
		if (Users::isRedEnvelope($user_id)) {
			Users::uplevel($user_id);
			$hongbao = Users::hongbao($user_id, input('type'));
		}
		$system = $this->_system;

		$reg['end'] = db('endcontract')->where('user_id', $user_id)->order('id', 'desc')->find();
		$reg['jk'] = db('borrow')->where('uid', $user_id)->select();
		$reg['tx'] = db('log')->where('user_id', $user_id)->where('type', 50)->select();
		$reg['user'] = db('users')->field('user_id,nickname,is_autonym,mobile,level,nmct,token,pass,nmct_dj,xmt,money_usdt,token_address,is_red_envelope,bonus,yet_tx_money')->where(array('user_id' => $user_id))->find();
		$reg['code'] = db('code')->where("`user_id`={$user_id}")->order('time desc')->select();
		$reg['level'] = db('user_level')->where("level_id>{$reg['user']['level']}")->order('level_id desc')->select();
		$reg['system'] = $system;
		$reg['user']['hongbao'] = $hongbao;
		$reg['hongbao'] = db('log')->where("`user_id`={$user_id} and type=6")->order('time desc')->value('nmct');
		$reg['hongbao'] = intval($reg['hongbao']);
		$reg['list'] = db('log')->where("`user_id`={$user_id}")->order('time desc')->limit(300)->select();
		$reg['yhk'] = db('yhk')->where('user_id', $user_id)->find();
		foreach ($reg['list'] as $i => $a) {
			if (!empty($a['text']) && $a['text'] > 0) {
				$member = db('users')->field('xm,nickname,mobile')->where("`user_id`={$reg['list'][$i]['text']}")->find(); //直推
				$reg['list'][$i]['xm'] = !empty($member['xm']) ? $member['xm'] : $member['nickname'];
				$reg['list'][$i]['mobile'] = $member['mobile'];
			}
		}
		if (empty($reg['tx'])) {
			$money = $reg['user']['money_usdt'] - 300;
		} else {
			$money = 3000 - $reg['user']['yet_tx_money'];

		}
		$reg['end_money'] = $money;
		return $reg;
	}
	public function zc() {
		$system = $this->_system;
		$user = db('users')->where(array('user_id' => session('user.user_id')))->find();
		$number = input('number');
		$img = input('img');
		$type = input('type');
		$log['time'] = time();
		$log['user_id'] = $user['user_id'];
		if ($user['level'] == 1 && $type < 3) {
			return ['status' => 0, 'msg' => '请先激活帐号并升级会员！'];
		}
		if ($number < 100 && $type < 4) {
			return ['status' => 0, 'msg' => '复投，转投，充值100起！'];
		}
		if ($type == 0) {
			$my_money = $user['nmct'];
			$log['type'] = 7;
			$log['nmct'] = -$number;
			$log['nmct_dj'] = $number * 6;
			$log['title'] = 'NMCT通证复投NMCT资产';
			$data['nmct'] = ['exp', "`nmct`-{$number}"];
			$data['nmct_dj'] = ['exp', "`nmct_dj`+{$log['nmct_dj']}"];
		}
		if ($type == 1) {
			$level = db('user_level')->where("level_id={$user['level']}")->order('level_id desc')->find();
			$my_money = $user['money_usdt'];
			$log['type'] = 8;
			$log['usdt'] = -$number;
			$log['nmct_dj'] = $number * 7 * $level['multiple'];
			$log['title'] = 'USDT复投NMCT资产';
			$data['money_usdt'] = ['exp', "`money_usdt`-{$number}"];
			$data['nmct_dj'] = ['exp', "`nmct_dj`+{$log['nmct_dj']}"];
		}
		if ($type == 2) {
			$my_money = $user['nmct'];
			$log['type'] = 9;
			$log['nmct'] = -$number;
			$log['xmt'] = $number * $system['money_nmct'] / $system['money_xmt'];
			$log['title'] = 'NMCT通证转XMT通证';
			$data['nmct'] = ['exp', "`nmct`-{$number}"];
			$data['xmt'] = ['exp', "`xmt`+{$log['xmt']}"];
		}
		if ($type == 3) {
			$my_money = $number;
			if ($my_money != 1500) {
				return ['status' => 0, 'msg' => '固定额度1500！'];
			}
			$caican = db::name('users')->where('user_id', session('user.user_id'))->find();
			if ($caican['money_usdt'] != 0) {
				return ['status' => 0, 'msg' => 'usdt尚有未使用'];
			}
			$chack_ = db('log')->where(array('user_id' => session('user.user_id'), 'type' => 0))->find();
			$first_ = db('log')->where('user_id', session('user.user_id'))->whereIN('type', [0, 1])->find();

			if (!empty($chack_)) {
				return ['status' => 0, 'msg' => '已有充值USDT订单审核中，请勿重复提交！'];
			}
			$log['type'] = 0;
			$log['usdt'] = $number;
			if (empty($img) || $img == '') {
				return ['status' => 0, 'msg' => '请上传凭证！'];
			}
			$log['img'] = $img;
			$log['title'] = '充值USDT审核中';
			//邀请注册奖
			if (empty($first_)) {
				$sj = db('users')->where('user_id', session('user.user_id'))->find();
				$c = Cache::get('reg_usdt');
				array_push($c, $sj['fxid']);
				cache('reg_usdt', $c, 0);
				Cache::get('reg_usdt');

			}
		}
		if ($type == 4) {
//购买激活码
			$gs = input('number');
			if ($gs > 10) {
				return ['status' => 0, 'msg' => '每次最多购买10个！'];
			}
			$number = $gs * 10;
			$my_money = $user['money_usdt'];
			$log['type'] = 10;
			$log['usdt'] = -$number;
			$log['title'] = '购买激活码' . $gs . '个';
			$data['money_usdt'] = ['exp', "`money_usdt`-{$number}"];
		}
		if ($type == 5) {
//激活帐号
			$my_money = $number;
			$code = db('code')->where(array("status" => 1, "code" => $number))->find();
			if ($user['pass'] == 1) {
				return ['status' => 0, 'msg' => '帐号已激活，请勿重复激活！'];
			}
			if (empty($code)) {
				return ['status' => 0, 'msg' => '激活码已使用或不存在！'];
			}
			$data['pass'] = 1;
			$log['type'] = 5;
			$log['title'] = '使用激活码：' . $code['code'] . '激活帐号';
		}
		if ($type == 6) {
//升级VIP
			$my_money = $user['money_usdt'];
			$level = db('user_level')->where("level_id={$number}")->find(); //是否大于当前级别
			if ($user['pass'] == 0) {
				return ['status' => 0, 'msg' => '请先激活帐号！'];
			}
			if ($level['level_id'] <= $user['level']) {
				return ['status' => 0, 'msg' => '已经达到当前级别！'];
			}
			if ($level['money'] / 2 > input('level_usdt')) {
				return ['status' => 0, 'msg' => '至少需要一半以上USDT！'];
			}
			if ($level['money'] < input('level_usdt')) {
				return ['status' => 0, 'msg' => '错误！'];
			}
			$number = input('level_usdt');
			if ($level['money'] > $number && ($level['money'] - $number) / $system['money_xmt'] > $user['xmt']) {
				return ['status' => 0, 'msg' => 'XMT不足！'];
			}
			unset($log);unset($data);
		}
		if ($type == 7) {
//升级VIP
			$user_ = input('user');
			$check = db('users')->where("user_id={$user_} or mobile={$user_}")->find(); //是否大于当前级别
			if (empty($check) || $user_ == $user['user_id'] || $user_ == $user['mobile']) {
				return ['status' => 0, 'msg' => '转出用户不存在！'];
			}
			$my_money = $user['xmt'];
			$number = input('number');
			$log['type'] = 10;
			$log['xmt'] = -$number;
			$log['title'] = 'XMT通证转出';
			$log['text'] = $check['user_id'];
			$data['xmt'] = ['exp', "`xmt`-{$number}"];
		}

		//还款
		if ($type == 8) {
			// $my_money = $number;
			$chack_ = db('borrow')->where('uid', session('user.user_id'))->where('status', 2)->find();
			if (empty($chack_)) {
				return ['status' => 0, 'msg' => '您暂时没有借款！'];
			}
			$msg = Db::name('borrow')
				->where('uid', session('user.user_id'))
				->where('status', 2)
				->data(['status' => 5])
				->update();
			if ($msg) {
				return ['status' => 1, 'msg' => '提交成功，审核中！'];
			} else {
				return ['status' => 0, 'msg' => '提交失败'];
			}
		}

		if ($my_money >= $number) {
			Db::startTrans();
			try {
				if (!empty($log)) {
					Db::name('log')->insert($log); //增加记录
				}
				if (!empty($data)) {
					Db::name('users')->where('user_id', session('user.user_id'))->setField($data);
				}
				if ($type == 4) {
					for ($i = $gs; $i > 0; $i--) {
//生成激活码
						Db::name('code')->insert([
							'time' => time(),
							'user_id' => $user['user_id'],
							'code' => Users::randomkeys(6),
							'status' => 1,
						]);
					}
				}
				if ($type == 5) {
					Db::name('code')->where('id', $code['id'])->setField([
						'use_time' => time(),
						'use_id' => $user['user_id'],
						'status' => 0,
					]);
				}
				if ($type == 6) {
					$level = Users::uplevel($user['user_id'], $level['level_id'], input('level_usdt'));
				}
				if ($type == 7) {
					Db::name('users')->where('user_id', $check['user_id'])->setField([
						'xmt' => ['exp', "`xmt`+{$number}"],
					]);
					$log['text'] = session('user.user_id');
					$log['user_id'] = $check['user_id'];
					$log['title'] = 'XMT通证转入';
					$log['xmt'] = $number;
					Db::name('log')->insert($log); //增加记录
				}
				Db::commit();
				$reg['status'] = 1;
				$reg['msg'] = lang('操作成功');
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				$reg['status'] = 0;
				$reg['msg'] = '操作失败';
			}
		} else {
			$reg['status'] = 0;
			if ($type == 0 || $type == 2) {
				$reg['msg'] = 'NMCT通证不足';
			}
			if ($type == 1 || $type == 4 || $type == 5 || $type == 6) {
				$reg['msg'] = 'USDT不足';
			}
		}
		return $reg;
	}
	public function my() {
		$user = db('users')
			->field('user_id,nickname,level,nmct,xmt,g,money_usdt,head_pic,money_cz')
			->where(array('user_id' => session('user.user_id')))
			->find();

		$system = $this->_system;
		if (!empty($user)) {
			$reg['user'] = $user;
			$reg['status'] = 1;
			$reg['system'] = $system;
			$reg['log'] = db('log')
				->where("`user_id`={$user['user_id']}")
				->order('time desc')
				->select();

			$reg['level'] = db('user_level')
				->where("`type`=1 and money>0 and `level_id`>{$user['level']}")
				->select(); //VIP级别

			$reg['user']['g_name'] = db('user_g')
				->where("`level_id`={$user['g']}")
				->value('level_name'); //合伙人级别

			$reg['team'] = db('users')
				->where("`fxid`={$user['user_id']}")
				->select(); //直推

			$t2 = 0;
			$t4 = 0;
			foreach ($reg['team'] as $key => $value) {
				$member_money_cz = db('users')
					->where("`level` >1 and find_in_set({$value['user_id']},all_fxid)")
					->sum('money_cz'); //查找所有邀请会员的充值金额
				$member_cz = floor($member_money_cz / 10) * 10;
				$user_cz = floor($value['money_cz'] / 10) * 10;
				$reg['team'][$key]['money_cz'] = $member_cz + $user_cz;
				$t2 += $reg['team'][$key]['money_cz'];
				$t4 = $t4 > $reg['team'][$key]['money_cz'] ? $t4 : $reg['team'][$key]['money_cz'];
			}

			//代数算法有误 导致当前登录会员算的总额与1代会员算的总额对不上  记得去查问题哦
			$reg['t']['t1'] = count($reg['team']);
			$reg['t']['t2'] = $t2;
			$reg['t']['t3'] = $t2 - $t4;
			$reg['t']['t4'] = $t4;

			foreach ($reg['log'] as $i => $a) {
				if (!empty($a['text']) && $a['text'] > 0) {
					$member = db('users')->field('xm,nickname,mobile')->where("`user_id`={$reg['log'][$i]['text']}")->find(); //直推
					$reg['log'][$i]['xm'] = !empty($member['xm']) ? $member['xm'] : $member['nickname'];
					$reg['log'][$i]['mobile'] = $member['mobile'];
				}
				$reg['log'][$i]['title'] = lang($a['title']);
			}
			//$aa = db('users')->field('money_usdt')->where("find_in_set({$user['user_id']},all_fxid)>0 and money_usdt>0")->select();
			//			 $aa =  Db::query("
			//				select money_cz from clt_users where `level` >1 and find_in_set({$user['user_id']},all_fxid)>0 and money_cz>0
			//			");
			//			$reg['aa'] = $aa;
			//			foreach($aa as $a){
			//				$reg['t']['t2'] += intval($a['money_cz']);
			//			}
		} else {
			$reg['status'] = 0;
			$reg['msg'] = '未登入';
		}
		return $reg;
	}
	public function index() {
		$page = input('post.page');
		$pageSize = input('post.pageSize');
		$xw = db('xw')->alias('a')
			->join(config('database.prefix') . 'qkl c', 'a.qkl_id = c.ad_id', 'left')
			->where(array('a.open' => 1, 'a.type_id' => 9))
			->field('a.pic as pic,a.name as name,a.addtime as time,a.ad_id as ad_id,c.name as qkl_name')
			->limit($this->_start, $this->_pageSize)
			->order('ad_id desc')
			->select();
		return $xw;
	}
}