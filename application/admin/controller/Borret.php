<?php
namespace app\admin\controller;
use app\admin\model\Admin;
use think\Db;
use think\Request;

class Borret extends Common {

	public function index() {
	}
	//借款列表
	public function list() {
		$status = input('status');

		$where = [];
		if (isset($status) && !empty($status)) {
			$where['k.status'] = $status;
		}

		$list = Db::table(config('database.prefix') . 'borrow')->alias('k')
			->join(config('database.prefix') . 'users i', 'k.uid = i.user_id', 'left')
			->field('i.nickname,k.*')
			->where($where)
			->select();
		$this->assign('list', $list);
		return $this->fetch();
	}
	//审核通过
	public function upload(Request $request) {
		$file = $request->file('file');
		$id = input('id');
		$uid = input('uid');
		if ($file) {
			$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
			if ($info) {
				$img = $info->getSaveName(); //获取名称
				$imgpath = DS . 'uploads' . DS . $img;
				try {
					Db::startTrans();
					$inser = Db::name('borrow')
						->where('id', $id)
						->data(['voucher' => $imgpath, 'status' => 2])
						->update();
					$users = Db::name('users')
						->where('user_id', $uid)
						->setDec('money_usdt', 500);
					if ($inser && $users) {
						Db::commit();
						return ['code' => 1, 'msg' => '成功'];
					} else {
						return ['code' => 0, 'msg' => '失败'];
					}

				} catch (Exception $e) {
					Db::rollback();
					return ['code' => 0, 'msg' => '失败'];
				}

			} else {
				$status = 0;
				$message = '图片上传失败';
				return ['code' => $status, 'msg' => $message];
			}
		} else {
			$status = 0;
			$message = '图片上传失败';
			return ['code' => $status, 'msg' => $message];
		}

	}
	//审核还款
	public function status(Request $request) {
		$id = input('id');
		$uid = input('uid');
		try {
			Db::startTrans();
			$msg = Db::name('borrow')
				->where('id', $id)
				->data(['status' => 3])
				->update();
			$users = Db::name('users')
				->where('user_id', $uid)
				->setInc('money_usdt', 500);
			if ($msg && $users) {
				Db::commit();
				return ['code' => 1, 'msg' => '成功'];
			} else {
				return ['code' => 0, 'msg' => '失败'];
			}

		} catch (Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '失败'];
		}

		if ($msg) {
			return ['code' => 1, 'msg' => '成功'];
		} else {
			return ['code' => 0, 'msg' => '失败'];
		}
	}

	//提现列表
	public function withdraw() {
		$status = input('status');
		$key = input('key');
		$where = [];
		if (isset($status) && !empty($status)) {
			$where['k.status'] = $status;
		}
		if (isset($key) && !empty($key)) {
			$where['i.nickname'] = $key;
		}
		$list = Db::table(config('database.prefix') . 'log')->alias('k')
			->join(config('database.prefix') . 'users i', 'k.user_id = i.user_id', 'left')
			->field('i.nickname,k.*')
			->where($where)
			->where('type', 50)
			->select();
		$this->assign('list', $list);
		return $this->fetch();
	}
	//提现，终止合同上传凭证通过
	public function txup(Request $request) {
		$file = $request->file('file');
		$id = input('id');
		$uid = input('uid');
		$type = input('type');

		if ($file) {
			$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
			if ($info) {
				$img = $info->getSaveName(); //获取名称
				$imgpath = DS . 'uploads' . DS . $img;
				try {
					//终止合同
					if (isset($type) && !empty($type) && $type == 'end') {

						Db::startTrans();
						$Db = db::name('endcontract')->where('id', $id)->data(['status' => 2, 'img' => $imgpath])->update();
						Db::commit();
						return ['code' => 1, 'msg' => '成功'];

					} else {

						Db::startTrans();
						$user = Db('users')->where('user_id', $uid)->find();
						if ($user['yet_tx_money'] >= 3000) {
							$user = Db('users')->where('user_id', $uid)->data(['out_time' => time()])->update();
						}
						$Db = db::name('log')->where('id', $id)->data(['status' => 2, 'img' => $imgpath])->update();
						Db::commit();
						return ['code' => 1, 'msg' => '成功'];

					}

				} catch (Exception $e) {
					Db::rollback();
					return ['code' => 0, 'msg' => '失败'];
				}

			} else {
				$status = 0;
				$message = '图片上传失败';
				return ['code' => $status, 'msg' => $message];
			}
		} else {
			$status = 0;
			$message = '图片上传失败';
			return ['code' => $status, 'msg' => $message];
		}

	}

	public function endlist() {
		$status = input('status');

		$where = [];
		if (isset($status) && !empty($status)) {
			$where['k.status'] = $status;
		}

		$list = Db::table(config('database.prefix') . 'endcontract')->alias('k')
			->join(config('database.prefix') . 'users i', 'k.user_id = i.user_id', 'left')
			->field('i.nickname,k.*')
			->where($where)
			->select();
		$this->assign('list', $list);
		return $this->fetch();
	}

	public function endstatus() {
		$id = input('id');
		$uid = input('uid');
		try {
			Db::startTrans();
			$users = Db::name('users')
				->where('user_id', $uid)
				->data(['money_usdt' => 0])
				->update();
			$end = Db::name('endcontract')
				->where('id', $id)
				->data(['status' => 3])
				->update();
			Db::commit();
			return ['code' => 1, 'msg' => '成功'];
		} catch (Exception $e) {
			Db::rollback();
			return ['code' => 0, 'msg' => '失败'];
		}

	}

}