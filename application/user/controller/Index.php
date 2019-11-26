<?php
namespace app\user\controller;
use app\user\model\Market;
use app\user\model\Users;
use think\Cache;
use think\Db;
use think\Input;
use think\Session;

class Index extends Common {
	public function _initialize() {
		parent::_initialize();
	}

	public function lang() {
		$lang = input('lang');
		switch ($lang) {
		case 'cn':
			cookie('think_var', 'zh-cn');
			break;
		case 'en':
			cookie('think_var', 'en-us');
			break;
		//其它语言
		default:
			cookie('think_var', 'zh-cn');
			break;
		}
		return;
	}

	public function upload() {
		// 获取上传文件表单字段名
		$fileKey = array_keys(request()->file());
		// 获取表单上传文件
		$file = request()->file($fileKey['0']);
		// 移动到框架应用根目录/public/uploads/ 目录下
		$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		if ($info) {
			$res['code'] = 1;
			$res['info'] = '图片上传成功!';
			$path = str_replace('\\', '/', $info->getSaveName());
			$res['url'] = '/uploads/' . $path;
			echo json_encode($res, true);
		} else {
			// 上传失败获取错误信息
			$res['code'] = 0;
			$res['info'] = '图片上传失败!';
			$res['url'] = '';
			echo json_encode($res, true);
		}
	}
	public function index() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		return $this->fetch();
	}
	public function index_() {
		return $this->fetch("index/index");
	}
	public function yy() {
		$yy = db('yy')->where(array('open' => 1))->select();
		$this->assign('yy', $yy);
		return $this->toHtml()->fetch();
	}
	/**
	 * 获取市场数据
	 *
	 * @return mixed
	 */
	public function my() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$yz = db('yhk')->where("user_id", session('user.user_id'))->find();
		$this->assign('yz', $yz);
		return $this->toHtml()->fetch();
	}
	public function index1() {
		$xw = db('xw')->where("open=1")->field('name,ad_id,jj,pic,addtime')->limit('10')->select();
		$this->assign([
			'xw' => $xw,
		]);
		return $this->fetch();
	}
	public function market() {
		$market = Cache::get('market');
		if (empty($market)) {
			$market = Market::getDatas();
			// 缓存10小时
			Cache::set('market', $market, 3600 * 10);
		}
		return $market;
	}
	public function qddk() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		$id = input('id');
		$mm = Users::password(input('mm'));
		$img = input('img');
		$ad_id = input('ad_id');
		$qkl = db('qkl')->field('ad_id,sjk_zd')->where(array('ad_id' => $ad_id, 'open' => 1))->find();
		$user = db('users')->field('aqmm')->where(array('user_id' => session('user.user_id')))->find();
		$my_gm = db('gm')->where(array('id' => $id, 'status' => 1))->find();
		$my_gm1 = db('gm')->where(array('id' => $id, 'status' => 2))->find();
		if ($id && $img == 1 && $mm == $user['aqmm']) {
			if ($my_gm1['user_id'] == session('user.user_id')) {
				Db::startTrans();
				try {
					$gm = db('gm')->field('gs,buy_id,dj,zg')->where(array('id' => $id))->find();
					Db::name('users')->where('user_id', $gm['buy_id'])->setInc($qkl['sjk_zd'], $gm['gs']);
					Db::name('gm')->where(array('user_id' => session('user.user_id'), 'id' => $id, 'ad_id' => $qkl['ad_id']))->update(array('status' => 3, 'time3' => time()));
					$rq = date("Y-m-d", time());
					Db::name('statistical')->where(array('rq' => $rq, 'qkl_id' => $qkl['ad_id']))->setInc('gm3', 1); //每日统计
					Db::name('statistical')->where(array('rq' => $rq, 'qkl_id' => $qkl['ad_id']))->setInc('gm3_gs', $gm['gs']);
					Db::name('statistical')->where(array('rq' => $rq, 'qkl_id' => $qkl['ad_id']))->setInc('gm3_dj', $gm['dj']);
					Db::name('statistical')->where(array('rq' => $rq, 'qkl_id' => $qkl['ad_id']))->setInc('gm3_money', $gm['zg']);
					$data['ok'] = 1;
					$data['status'] = 3;
					$data['msg'] = '操作成功';
					$data['msg1'] = '已收到打款，交易完成';
					Db::commit();
				} catch (\Exception $e) {
					// 更新失败 回滚事务
					Db::rollback();
					$data['ok'] = 0;
					$data['status'] = 0;
					$data['msg'] = '操作失败';
				}
			} else {
				$data['ok'] = 0;
				$data['status'] = 0;
				$data['msg'] = '安全密码错误';
			}
		} elseif (!empty($img) && !empty($my_gm) && $my_gm['buy_id'] == session('user.user_id')) {
			db('gm')->where(array('id' => $id, 'ad_id' => $qkl['ad_id']))->update(array('status' => 2, 'time2' => time(), 'img' => $img));
			$data['code'] = 0;
			$data['status'] = 1;
			$data['msg'] = '上传凭证成功';
			$data['msg1'] = '待卖方审核通过';
		} else {
			$data['status'] = 0;
			$data['msg'] = '失败';
		}
		echo json_encode($data);
	}
	public function jy() {
		if (!session('user.user_id')) {
			$this->redirect('login/index');
		}
		return $this->fetch();
	}
	public function logout() {
		$status = false;
		$wboos_hash = Input('post.wboos_hash');
		if (!empty($wboos_hash) && ($wboos_hash === session('oec_hash'))) {
			#session('user.user_id', null);
			session('user', null);
			session('oec_hash', null);
			$status = true;
		}

		if (request()->isAjax()) {
			if ($status) {
				return ([
					'status' => 1,
					'msg' => '退出成功',
				]);
			}

			return ([
				'status' => 0,
				'msg' => '退出失败，请稍候重试。',
			]);
		}

		$this->redirect('../user/login/index');
	}
}