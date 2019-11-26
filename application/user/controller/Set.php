<?php
namespace app\user\controller;
use app\user\model\Market;
use app\user\model\Users;
use think\Db;
use think\Input;

class Set extends Common {
	public function _initialize() {
		parent::_initialize();
	}
	public function index() {
		if (!session('user.user_id')) {
			$this->redirect('../user/login/index');
		}
		if (request()->isPost()) {
			$data = input('post.');
			if (!session('yzm.yzm') || session('yzm.time') < time()) {
				return array('status' => 0, 'msg' => '验证码不存在或已失效!');
			}
			if (session('yzm.yzm') != $data['sms']) {
				return array('status' => 0, 'msg' => '验证码错误!');
			}
			$a['xm'] = $data['xm'];
			$a['email'] = $data['email'];
			$a['nickname'] = $data['nickname'];
			$user_id = session('user.user_id');
			if (!empty($data['mobile']) && strlen($data['mobile']) > 10) {
				$mobile = db('users')->where("user_id!={$user_id} and mobile={$data['mobile']}")->find();
				if (!empty($mobile)) {
					return array('status' => 0, 'msg' => '该手机号已绑定！');
				} else {
					$a['mobile'] = $data['mobile'];
				}
			} else {
				return array('status' => 0, 'msg' => '手机号格式错误！');
			}
			//$a['alipay']=$data['alipay'];
			$a['token_address'] = $data['token_address'];
			$user = db('users');
			if (empty($a['xm'])) {
				return array('status' => 0, 'msg' => '不能为空');
			}

			if (strlen($a['xm']) < 5) {
				return array('status' => 0, 'msg' => '姓名长度错误');
			}

			if (strlen($a['nickname']) < 0) {
				return array('status' => 0, 'msg' => '请填写昵称');
			}

			if (strlen($a['email']) < 8) {
				return array('status' => 0, 'msg' => '邮箱错误');
			}

			if (db('users')->where(['user_id' => session('user.user_id')])->update($a) !== false) {
				session('yzm', null);
				return array('status' => 1, 'msg' => '编辑资料成功');
			} else {
				return array('status' => 0, 'msg' => '编辑资料失败');
			}
		} else {
			$yy = db('yy')->order('sort')->select();
			$user = db('users')->find(session('user.user_id'));
			$this->assign(['user' => $user, 'yy' => $yy]);
			return $this->fetch('');
		}
	}
	public function sy() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		return $this->fetch();
	}
	public function bb() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		return $this->fetch();
	}
	public function mod1() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$users = db('users')->where("user_id", session('user.user_id'))->find();
		return $this->fetch();
	}
	public function gx() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$yz = db('yhk')->where("user_id", session('user.user_id'))->select();
		$xw = db('xw')->alias('a')
			->join(config('database.prefix') . 'qkl c', 'a.qkl_id = c.ad_id', 'left')
			->where(array('a.open' => 1))
			->field('a.*,c.name as qkl_name,c.pic as pic')
			->limit('10')
			->order('ad_id asc')
			->select();
		$this->assign('yz', $yz);
		$this->assign('xw', $xw);
		return $this->fetch();
	}
	public function sqgg() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$id = input('id');
		//$xw = db('xw')->where("ad_id",$id)->find();
		$xw = db('xw')->alias('a')
			->join(config('database.prefix') . 'qkl c', 'a.qkl_id = c.ad_id', 'left')
			->where(array('a.open' => 1, 'a.ad_id' => $id))
			->field('a.*,c.name as qkl_name,c.pic as img')
			->find();
		if ($xw) {
			$reg['code'] = 1;
			$reg['name'] = $xw['name'];
			$reg['content'] = $xw['content'];
			$reg['qkl_name'] = $xw['qkl_name'];
			$reg['sj'] = date('m-d H:i', $xw['addtime']);
			$reg['img'] = $xw['img'];
		} else {
			$reg['code'] = 0;
		}
		$this->assign('xw', $xw);
		return $this->fetch();
	}
	public function zc_sl() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$users = db('users')->field('aqmm,is_lock')->find(session('user.user_id'));
		$z_num_reward = intval(db('recharge')->where(array('status' => 2, 'fxid' => session('user.user_id')))->sum('z_num_reward')) - db('cash')->where(array('status' => 2, 'user_id' => session('user.user_id')))->sum('num'); //我的直推奖
		$g_num_reward = db('recharge')->where('buy_id', '>', session('user.user_id'))->sum('g_num_reward') - db('cash')->where(array('status' => 1, 'user_id' => session('user.user_id')))->sum('num'); //我的共享奖
		$data['mm'] = input('post.mm');
		$data['zt'] = input('post.zt');
		$data['gs'] = $data['zt'] == 1 ? $g_num_reward : $z_num_reward;
		if ($users['is_lock'] == 1) {
			return array('code' => 0, 'msg' => '您的账号已被冻结，暂无此权限！');
		} elseif ($data['gs'] < 1) {
			return array('code' => 0, 'msg' => '大于1才可以转至');
		} elseif ($users['aqmm'] !== Users::password($data['mm'])) {
			return array('code' => 0, 'msg' => '安全密码错误');
		} elseif ($data['zt'] == 2 && $z_num_reward < $data['gs']) {
			return array('code' => 0, 'msg' => '直推帐号不足');
		} elseif ($data['zt'] == 1 && $g_num_reward < $data['gs']) {
			return array('code' => 0, 'msg' => '共享帐号不足');
		} elseif ($data['zt'] > 0 && $data['gs'] > 0) {
			//db('users')->where("user_id",session('user.user_id'))->setDec('sl_zc',$data['gs']);
			Db::startTrans();
			try {
				Db::name('users')->where("user_id", session('user.user_id'))->setInc('oec', number_format($data['gs'] * 0.9, 2));
				//  数据表中当前角色的权限;  $info['id'] 角色执行循环插入数据之前先清空
				$a['time'] = time();
				$a['status'] = $data['zt']; //2为直推奖，1为共享奖
				$a['sxf'] = number_format(($data['gs'] * 0.1), 2); //手续费
				$a['rq'] = date('Y-m-d', time());
				$a['num'] = isset($data['gs']) ? $data['gs'] : 0;
				$a['dm'] = 'oec';
				$a['ad_id'] = '49';
				$a['user_id'] = session('user.user_id');
				Db::name('cash')->insert($a);
				// 更新成功 提交事务
				Db::commit();
				return array('code' => 1, 'msg' => '操作成功');
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				Db::rollback();
				return array('code' => 0, 'msg' => '操作失败');
			}

		}

		if ($data['zt'] == 1) {
			if ($users['aqmm'] !== Users::password($data['mm'])) {
				return array('code' => 0, 'msg' => '安全密码错误');
			} elseif ($users['fx_zc'] < $data['gs']) {
				return array('code' => 0, 'msg' => '分享帐号不足');
			} else {
				db('users')->where("user_id", session('user.user_id'))->setDec('fx_zc', $data['gs']);
				db('users')->where("user_id", session('user.user_id'))->setInc('zc', $data['gs'] * 0.9);
				return array('code' => 1, 'msg' => '操作成功');
			}
		}
		/* if($data['zt']==3){
						$sj_id=db('users')->field('user_id,all_pid')->find($data['gs']);
						$count=db('users')->where("sjid",$data['gs'])->count();
						if($users['aqmm']!==Users::password($data['mm'])){
							return array('code'=>0,'msg'=>'安全密码错误');
						}elseif(empty($data['gs'])){
							db('users')->where("user_id",session('user.user_id'))->update(array('sjid'=>1));
							return array('code'=>1,'msg'=>'操作成功');
						}elseif(!$sj_id || $count>1){
							return array('code'=>0,'msg'=>'该上级不存在或已满2个下线');
						}elseif($data['gs']==session('user.user_id')){
							return array('code'=>0,'msg'=>'不能为自己');
						}else{
							if($sj_id['all_pid']){
			                $all_pid = '|'.$sj_id['user_id'] .$sj_id['all_pid'];
			                }else{
			                $all_pid = '|'.$sj_id['user_id'] .'|'. $sj_id['all_pid'];
			                }
							db('users')->where('user_id',session('user.user_id'))->update(array('sjid'=>$sj_id['user_id'],'all_pid'=>$all_pid));
							return array('code'=>1,'msg'=>'操作成功');
						}
		*/
	}
	public function index1() {
		if (!session('user.user_id')) {
			$this->redirect('../user/login/index');
		}
		if (request()->isPost()) {
			$data = input('post.');
			$a['xm'] = $data['xm'];
			$a['sfz'] = $data['sfz'];
			$user = db('users');
			//var_dump($data);exit;
			// $oldEmail = $user->where(['user_id'=>session('user.user_id')])->value('email');
			if (empty($a['xm']) || empty($a['sfz'])) {
				return array('status' => 0, 'msg' => '不能为空');
			}

			if ($this->userInfo['xm'] == $a['xm'] && $this->userInfo['sfz'] == $a['sfz']) {
				return array('status' => 0, 'msg' => '没有修改内容');
			}

			if (strlen($a['xm']) < 5) {
				return array('status' => 0, 'msg' => '姓名长度错误');
			}

			if (strlen($a['sfz']) < 15) {
				return array('status' => 0, 'msg' => '身份证长度错误');
			}

			if (db('users')->where(['user_id' => session('user.user_id')])->update($a) !== false) {
				return array('status' => 1, 'msg' => '编辑资料成功');
			} else {
				return array('status' => 0, 'msg' => '编辑资料失败');
			}
		} else {
			$user = db('users')->find(session('user.user_id'));
			$yz = db('yhk')->where("user_id", session('user.user_id'))->find(); //银行卡
			$this->assign('user', $user);
			$this->assign('yz', $yz);
			$ranking = Cache::get('ranking');
			if (empty($ranking)) {
				$ranking = Market::ranking();
				// 缓存10秒
				Cache::set('ranking', $ranking, 3600 * 24);
			}
			//var_dump($ranking);exit;

			return $this->fetch('');
		}
	}
	public function getRegion() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$Region = db("region");
		$map['pid'] = input("pid");
		$list = $Region->where($map)->select();
		return $list;
	}
	public function avatar() {
		$data = input('post.');
		db('users')->where(['user_id' => session('user.user_id')])->update($data);
		return array('status' => 1, 'msg' => '修改成功');
	}

	/**
	 * 修改密码
	 * @return array
	 * @throws \think\Exception
	 * @throws \think\exception\PDOException
	 */
	public function repass() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$old_password = input('post.nowpass'); //旧密码
		$new_password = input('post.pass'); //新密码
		$confirm_password = input('post.repass'); //确认新 密码
		//验证码
		$sms_code = input('post.sms');
		if (empty($sms_code)) {
			return array('status' => 0, 'msg' => '验证码不能为空');
		}
		$sj_vcode = session('yzm.yzm');
		if (!$sj_vcode || session('yzm.time') < time()) {
			return array('code' => 0, 'msg' => '验证码不存在或已失效');
		}

		if ($sj_vcode != $sms_code) {
			return array('status' => -1, 'msg' => '验证失败,验证码有误');
		}
		session('yzm', null);

		if (empty($old_password) || empty($new_password) || empty($confirm_password)) {
			return array('status' => 0, 'msg' => '不能为空');
		}

		if (($this->userInfo['password'] != '' && Users::password($old_password, $this->userInfo['reg_time']) != $this->userInfo['password'])) {
			return array('status' => 0, 'msg' => '旧密码不正确');
		}

		if (strlen($new_password) < 6 || strlen($new_password) > 20) {
			return array('status' => 0, 'msg' => '密码不能低于6位字符高于20位');
		}

		if ($new_password != $confirm_password) {
			return array('status' => 0, 'msg' => '两次密码输入不一致');
		}

		//验证原密码
		if (Users::password($new_password, $this->userInfo['reg_time']) == $this->userInfo['password']) {
			return array('status' => 0, 'msg' => '错误，新密码与旧密码相同');
		}

		if (db('users')->where("user_id", session('user.user_id'))->update(array('password' => Users::password($new_password, $this->userInfo['reg_time']))) !== false) {
			session('user.user_id', null); // logout
			return array('status' => 1, 'msg' => '修改成功');
		} else {
			return array('status' => 0, 'msg' => '修改失败');
		}
	}
	public function aqmm() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$users = db('users')->field('aqmm,password')->find(session('user.user_id'));
		if ($users['aqmm'] == '') {
			$new_password = input('post.pass');
			$confirm_password = input('post.repass');
			if (strlen($new_password) !== 6 && !is_numeric($new_password)) {
				return array('status' => 0, 'msg' => '密码只能为6位数字');
			}

			if ($new_password != $confirm_password) {
				return array('status' => 0, 'msg' => '两次密码输入不一致');
			}

			if (db('users')->where("user_id", session('user.user_id'))->update(array('aqmm' => Users::password($new_password))) !== false) {
				return array('status' => 1, 'msg' => '设置成功');
			} else {
				return array('status' => 0, 'msg' => '设置失败');
			}
		} else {
			$old_password = input('post.nowpass');
		}

		$new_password = input('post.pass');
		$confirm_password = input('post.repass');
		if (empty($old_password) && empty($new_password) && empty($confirm_password)) {
			return array('status' => 1, 'msg' => 'ok');
		}
		if ((Users::password($old_password, $this->userInfo['reg_time']) !== $users['password'])) {
			return array('status' => 0, 'msg' => '登录密码不正确');
		}

		if ($users['aqmm'] == Users::password($new_password)) {
			return array('status' => 0, 'msg' => '错误，新密码与旧密码相同');
		}

		if (!is_numeric($new_password) && !is_numeric($confirm_password)) {
			return array('status' => 0, 'msg' => '错误，密码只能为数字');
		}

		if (strlen($new_password) !== 6 && strlen($confirm_password) !== 6) {
			return array('status' => 0, 'msg' => '错误，只能为6位字符');
		}

		if ($new_password != $confirm_password) {
			return array('status' => 0, 'msg' => '两次密码输入不一致');
		}

		//验证原密码
		if (db('users')->where("user_id", session('user.user_id'))->update(array('aqmm' => Users::password($new_password))) !== false) {
			return array('status' => 1, 'msg' => '修改成功');
		} else {
			return array('status' => 0, 'msg' => '修改失败');
		}
	}
	public function yhk() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$data = input('post.');
		$yh = input('post.yh');
		$name = input('post.name');
		$yhk = input('post.yhk');
		// $money_address = input('post.money_address');
		$user_id = session('user.user_id');
		$yz = db('yhk')->where("user_id", session('user.user_id'))->find();
		// if (!empty($yhk)) {
		// 	$yhk_ = db('yhk')->where("`yhk`={$yhk} and user_id!={$user_id}")->find();
		// 	if (!empty($yhk_)) {
		// 		return array('status' => 0, 'msg' => '每个钱包地址只能绑定一个用户！');
		// 	}
		// }
		if (empty($yhk)) {
			return array('status' => 0, 'msg' => '银行卡不能为空');
		} /* elseif($yh==$yz['yh'] && $name==$yz['name'] && $yhk==$yz['yhk']){
			return array('status'=>0,'msg'=>'没有修改');
		} */else if (strlen($yhk) < 20) {
			// if (!session('yzm.yzm') || session('yzm.time') < time()) {
			// 	return array('status' => 0, 'msg' => '验证码不存在或已失效!');
			// }
			// if (session('yzm.yzm') != $data['sms']) {
			// 	return array('status' => 0, 'msg' => '验证码错误!');
			// }
			if ($yz) {
				if (db('yhk')->where(['user_id' => session('user.user_id')])->update($data) !== false) {
					session('yzm', null);
					return array('status' => 1, 'msg' => '成功');
				} else {
					return array('status' => 0, 'msg' => '失败');
				}
				/* db('users')->where(['user_id'=>session('user.user_id')])->update($data);
				return array('status'=>1,'msg'=>'修改成功'); */
			} else {
				// $map['yh'] = $yh;
				// $map['name'] = $name;
				$map['yhk'] = $yhk;
				// $map['money_address'] = $money_address;
				$map['user_id'] = session('user.user_id');
				if (db('yhk')->insertGetId($map) !== false) {
					session('yzm', null);
					return array('status' => 1, 'msg' => '绑定成功');
				} else {
					return array('status' => 0, 'msg' => '绑定失败');
				}
			}
		} else {
			return array('status' => 0, 'msg' => '格式错误，请认真填写！');
		}
	}

	public function up_autonym() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$autonym_number = input('post.uid');
		$xm = input('post.cc_name');
		$img1 = input('post.uid_front');
		$img2 = input('post.uid_back');
		$img3 = input('post.uid_hand');
		
		if (empty($img1) || empty($img2) || empty($img3) || empty($autonym_number) || empty($xm)) {
			return false;
		}
		$user_id = session('user.user_id');
		$img = [$img1, $img2, $img3];
		$json = implode(',', $img);
		// $json = json_encode($img1 . ',' . $img2 . ',' . $img3);
		$msg = db::name('users')->where('user_id', $user_id)->update(['autonym_img' => $json, 'autonym_number' => $autonym_number, 'xm' => $xm]);
		if ($msg) {
			return $this->redirect('user/index/my');
		} else {
			return false;
		}
	}
}