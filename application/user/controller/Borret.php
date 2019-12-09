<?php
namespace app\user\controller;
use think\Db;

class Borret extends Common {

	/**
	 * 借款
	 * @return array
	 * @throws \think\Exception
	 * @throws \think\exception\PDOException
	 */
	public function borrow() {
		// new Users;
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$_user = db('users')->where('user_id', session('user.user_id'))->find();

		if ($_user['is_autonym'] != 1) {
			return array('status' => 0, 'msg' => '请实名');
		}

		$uid = session('user.user_id');
		$is_ing = db('borrow')->where('uid', $uid)->whereIn('status', [1, 2, 4])->find();

		if (!empty($is_ing)) {
			return json_encode(['code' => 0, 'msg' => '您已在借款中或您已逾期']);
		}
		$money_address = db::name('yhk')->where('user_id', $uid)->find();
		if (empty($money_address)) {
			return json_encode(['code' => 0, 'msg' => '无钱包地址']);
		}
		$data = [];
		$data['status'] = "1";
		$data['j_time'] = time();
		$data['uid'] = $uid;
		$data['address'] = $money_address['yhk'];
		$msg = db('borrow')->insert($data);

		if ($msg) {
			return json_encode(['code' => 1, 'msg' => '已提交申请']);
		} else {
			return json_encode(['code' => 0, 'msg' => '申请失败']);
		}
	}
	//还款
	public function huankuan() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		// $uid = session('user.user_id');
		$id = input('id');
		$img = input('img');
		$msg = db::name('borrow')->where('id', $id)->update(['h_time' => time(), 'h_voucher' => $img, 'status' => 5]);
		if ($msg) {
			return json_encode(['code' => 1, 'msg' => '已提交审核']);
		} else {
			return json_encode(['code' => 0, 'msg' => '失败']);
		}

	}

	//借还款列表
	public function borlist() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$uid = session('user.user_id');
		$list = db('borrow')->where('uid', $uid)->select();
		$this->assign('list', $list);
		$this->assign('title', '借款列表');
		return $this->fetch();
	}
//提现
	public function withdraw() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		// $t_money = input('money');
		$address = input('address');
		if (empty($address)) {
			$result['status'] = 0;
			$result['msg'] = '请去个人资料完善钱包地址';
			return json_encode($result);
		}
		// $money = $t_money - 5;
		$ytx = DB::name('users')->where('user_id', session('user.user_id'))->find();
		if ($ytx['is_autonym'] == 0) {
			$result['status'] = 0;
			$result['msg'] = '请实名';
			return json_encode($result);
		}
		$is_tx = DB::name('log')->where('type', 50)->where('status', 1)->where('user_id', session('user.user_id'))->find();
		if ($is_tx) {
			$result['status'] = 0;
			$result['msg'] = '已有申请，请勿重新提交';
			return json_encode($result);
		}

		$todaymoney = DB::name('log')->where('type', 50)->where('status', 2)->where('user_id', session('user.user_id'))->whereTime('time', 'today')->sum('nmct');
		if ($todaymoney >= 500) {
			$result['status'] = 0;
			$result['msg'] = '日提现额度最多为500';
			return json_encode($result);
		}
		//可提
		$tmonry = $ytx['bonus'] + $ytx['j_bonus'];

		if ($tmonry <= 0) {
			$result['status'] = 0;
			$result['msg'] = '奖金金额不足';
			return json_encode($result);
		}

		// $t = 0;
		// $y = 0;
		// if (($tmonry + $todaymoney) > 500) {
		// $money = 3000 - $ytx['yet_tx_money'];
		$t = 500 - $todaymoney;
		// }

		// if (($tmonry + $ytx['yet_tx_money']) > 3000) {
		$y = 3000 - $ytx['yet_tx_money'];
		// }
		//对比月余额和日月取小值
		if ($t < $y) {
			$money = $t;
		} elseif ($t > $y) {
			$money = $y;
		} else {
			$money = $tmonry;
		}

		if ($tmonry < $money) {
			$money = $tmonry;
		}

		if ($money < 35) {
			$result['status'] = 0;
			$result['msg'] = '满35U可提现(5U手续费)';
			return json_encode($result);
		}
		$money = $money - 5; //扣除手续费
		// $money = $money -5;
		// if ($ytx['bonus'] < 0 || $ytx['bonus'] < $money) {
		// 	$result['status'] = 0;
		// 	$result['msg'] = '提现余额不足';
		// 	return json_encode($result);
		// }
		// if (($ytx['yet_tx_money'] + $money) > 3000) {
		// 	$result['status'] = 0;
		// 	$result['msg'] = '提现超最大额度，还可提' . (3000 - $ytx);
		// 	return json_encode($result);
		// }

		try {
			Db::startTrans();
			// DB::name('users')->where('user_id', session('user.user_id'))->setDec('money_usdt', $money);
			$k_c_money = $money + 5;
			if ($k_c_money > $ytx['j_bonus']) {
				DB::name('users')->where('user_id', session('user.user_id'))->setDec('j_bonus', $ytx['j_bonus']);

				DB::name('users')->where('user_id', session('user.user_id'))->setDec('bonus', $k_c_money - $ytx['j_bonus']);
			} else {
				DB::name('users')->where('user_id', session('user.user_id'))->setDec('j_bonus', $k_c_money);
			}
			// DB::name('users')->where('user_id', session('user.user_id'))->setDec('bonus', $money);

			DB::name('users')->where('user_id', session('user.user_id'))->setInc('yet_tx_money', $money);
			db('log')->insert([
				'time' => time(), 'type' => 50, 'title' => '提现UMCT', 'user_id' => session('user.user_id'),
				'nmct' => $money, 'text' => $address, 'status' => 1, //提现审核中
			]);

			Db::commit();
			$result['status'] = 1;
			$result['msg'] = '提交成功,请等待审核' . $money . 'USDT';
			return json_encode($result);
		} catch (Exception $e) {
			$result['status'] = 0;
			$result['msg'] = '提现失败';
			return json_encode($result);
			Db::rollback();
		}

		// if ($todaymoney >= 3000) {
		// 	$result['status'] = 0;
		// 	$result['msg'] = '月提现额超额';
		// 	return json_encode($result);
		// }
		// var_dump($msg1);
	}
	//借款列表
	public function withdrawlist() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$uid = session('user.user_id');
		$list = db('log')->where('user_id', $uid)->where('type', 50)->select();
		$this->assign('list', $list);
		$this->assign('title', '提现列表');
		return $this->fetch();
	}

	//退市,终止合同
	public function endcontract() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$uid = session('user.user_id');
		$end = db::name('endcontract')->where('user_id', $uid)->where('status', 1)->find();
		if ($end) {
			$result['status'] = 0;
			$result['msg'] = '已有申请或以终止合同，请勿重新提交';
			return json_encode($result);
		}

		$user = db::name('users')->where('user_id', $uid)->find();
		$log = db::name('log')->where('type', 50)->find();
		if (empty($log)) {
			$money = $user['money_usdt'] - 300;
		} else {
			$money = 3000 - $user['yet_tx_money'];

		}

		$data = [];
		$data['user_id'] = $uid;
		$data['money'] = $money;
		$data['status'] = 1;
		$data['time'] = time();
		$msg = db::name('endcontract')->insert($data);
		if ($msg) {
			$result['status'] = 1;
			$result['msg'] = '申请成功，请等待审核';
		} else {
			$result['status'] = 0;
			$result['msg'] = '申请失败';
		}
		return json_encode($result);
	}

	public function sureend() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$uid = session('user.user_id');
		try {
			Db::startTrans();
			$end = db::name('endcontract')
				->where('user_id', $uid)
				->where('status', 2)
				->data(['status' => 3])
				->update();
			$user = db::name('users')
				->where('user_id', $uid)
				->data(['money_usdt' => 0, 'is_lock' => 1])
				->update();
			Db::commit();
			$result['status'] = 1;
			$result['msg'] = '终止成功';
			session('user', null);
		} catch (Exception $e) {
			$result['status'] = 0;
			$result['msg'] = '终止失败';
			Db::rollback();
		}
		return json_encode($result);
	}

	//t提币，（通证提取）
	public function Mention() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$uid = session('user.user_id');
		$money = input('money');
		$address = input('address');
		if (empty($address)) {
			$result['status'] = 0;
			$result['msg'] = '请填写提币地址';
			return $result;
		}
		if (empty($money)) {
			$result['status'] = 0;
			$result['msg'] = '请输入金额';
			return $result;
		}
		$user = db::name('users')->where('user_id', $uid)->find();

		if ($user['nmct'] < $money) {
			$result['status'] = 0;
			$result['msg'] = '请输入正确金额';
			return $result;
		}
		$is_cun = db::name('log')->where('user_id', $uid)->where('type', 59)->where('status', 1)->find();
		if ($is_cun) {
			$result['status'] = 0;
			$result['msg'] = '已有审核，请勿重复提交';
			return $result;
		}
		// $yhk = db::name('yhk')->where('user_id', $uid)->find();
		$data = [];
		$data['user_id'] = $uid;
		$data['time'] = time();
		$data['type'] = 59;
		$data['status'] = 1; //已申请待审核
		$data['nmct'] = $money; //已申请待审核
		$data['title'] = '通证提币'; //已申请待审核
		$msg = db::name('log')->insert($data);
		if ($msg) {
			$result['status'] = 1;
			$result['msg'] = '申请成功，请等待审核';
		} else {
			$result['status'] = 0;
			$result['msg'] = '申请失败';
		}

		return $result;
	}

}