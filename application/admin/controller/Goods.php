<?php
namespace app\admin\controller;
use app\user\model\Exchange;
use app\user\model\Users;
use think\Controller;
use think\Db;
use think\Request;

class Goods extends Common {
	public function _initialize() {
		parent::_initialize();
	}
	//列表
	public function index() {
		if (request()->isPost()) {
			$type = input('type');
			$user_id = input('user_id');
			$page = input('pageIndex');
			$pageSize = input('pageSize');
			if ($user_id > 0) {
				$list = db('gm')->where("user_id = {$user_id} OR buy_id = {$user_id}")->order('time2 desc,time1 desc,time desc,time3 desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif ($type == 1) {
				$map['rq'] = date('Y-m-d', time());
				$map['status'] = array('in', '0,1');
				$list = db('gm')->where($map)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif ($type == 2) {
				$list = db('gm')->where("status in (2,12)")->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif ($type == 3) {
				$list = db('gm')->where("status in (3,13)")->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif ($type == 10) {
				$list = db('gm')->order('id desc')->where("status in (10,11)")->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif (empty($type)) {
				$list = db('gm')->order('id desc')->where("status in (0,1)")->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			}
			foreach ($list['data'] as $key => $value) {
				if (!empty($list['data'][$key]['buy_id'])) {
					$list['data'][$key]['buyname'] = db('users')->where("user_id", $list['data'][$key]['buy_id'])->value('nickname');
				}
				if ($list['data'][$key]['status'] == 0) {
					$list['data'][$key]['zt'] = '挂卖中';
				} else if ($list['data'][$key]['status'] == 1) {
					$list['data'][$key]['zt'] = '待打款';
				} else if ($list['data'][$key]['status'] == 2) {
					$list['data'][$key]['zt'] = '待同意';
				} else if ($list['data'][$key]['status'] == 3) {
					$list['data'][$key]['zt'] = '已完成';
				} else if ($list['data'][$key]['ht'] == 1) {
					$list['data'][$key]['zt'] = '挂卖异常已通过';
				} else if ($list['data'][$key]['ht'] == 1) {
					$list['data'][$key]['zt'] = '挂卖异常未通过';
				} else if ($list['data'][$key]['status'] == 5 && $list['data'][$key]['ht'] == 0) {
					$list['data'][$key]['zt'] = '挂卖异常待处理';
				}
				$list['data'][$key]['img'] = empty($list['data'][$key]['img']) ? 0 : $list['data'][$key]['img'];
			}
			return $result = ['code' => 0, 'msg' => '获取成功!', 'list' => $list['data'], 'count' => $list['total'], 'rel' => 1];
		}
		$system = db('system')->where(array('id' => 1))->find();
		$price = db('price')->limit(10)->select();
		$gm = Db::query("
			select
			SUM(if(status=3 || status=13,gs,null)) as gm_3,
			SUM(if(status=3 || status=13,zg,null)) as zg_3,
			SUM(if(status=0 || status=1,gs,null)) as gm_0,
			SUM(if(status=0 || status=1,zg,null)) as zg_0,
			SUM(if(status=2 || status=12,gs,null)) as gm_2,
			SUM(if(status=2 || status=12,zg,null)) as zg_2,
			SUM(if(status=10 || status=11,dj,null)) as gm_10,
			SUM(if(status=10 || status=11,dj,null)) as zg_10
			from clt_gm
		");
		$gm[0]['gm_usdt'] = db('gm')->whereTime('time', 'today')->where("`status` in (0,1,2,3)")->sum('zg');
		$gm[0]['qg_usdt'] = db('gm')->whereTime('time', 'today')->where("`status` in (10,11,12,13)")->sum('zg');
		$this->assign(['title' => 'C2C列表', 'type' => input('type'), 'gm' => $gm[0], 'price' => $price, 'nmct' => $system['money_nmct'], 'system' => $system, 'user_id' => input('user_id')]);
		return $this->fetch();
	}
	public function black() {
		if (request()->isPost()) {
			$data = Exchange::black(input('post.userid'), input('post.id'));
			return $data;
		}
	}
	public function ok() {
		$gm_id = input('post.id');
		$user_id = input('post.userid');
		$my_gm = db('gm')->where("id={$gm_id} and status in (2,12)")->find();
		if (empty($my_gm)) {
			$data['status'] = 0;
			$data['msg'] = '改订单处于交易状态或不存在！';
		} else if (!empty($my_gm)) {
			$zt = '交易完成';
			db('gm')->where('id', $gm_id)->update(array(
				'status' => $my_gm['status'] + 1, 'time3' => time(), 'zt' => $zt,
			));
			//log记录
			if ($my_gm['status'] < 6) {
				db('log')->insert([
					'time' => time(), 'type' => 24, 'text' => $my_gm['lang'],
					'title' => '已撤回挂卖NMCT', 'user_id' => $user_id,
					'nmct' => $my_gm['gs'] + $my_gm['dj'], 'status' => 1,
					'member_id' => $gm_id,
				]);
			}
			//log记录
			db('users')->where('user_id', $user_id)->setInc('nmct', $my_gm['gs']);
			$data['msg'] = '撤回成功';
			$data['status'] = 1;
			$data['tz'] = 1;
		} else {
			$data['status'] = 0;
			$data['msg'] = '错误';
		}
		return $data;
	}
	public function jy() {
		if (db('system')->where("id=1")->update(array('jy' => input('post.jy')))) {
			return $result = ['code' => 1, 'msg' => '操作成功！'];
		} else {
			return $result = ['code' => 0, 'msg' => '操作失败！'];
		}
	}
	public function buy() {
		if (request()->isPost()) {
			$id = input('post.id');
			$status = input('post.status');
			$img = input('post.img');
			$buyname = input('post.buyname');
			$list = db('gm')->where(array('id' => $id, 'status' => $status))->find();
			if (!empty($list)) {
				if ($status == 0) {
					db('gm')->where(array('id' => $id, 'status' => $status))->update(array('status' => $status + 1, 'time1' => time(), 'buy_id' => 0, 'buyname' => $buyname));
				} else if ($status > 1) {
					if (!empty($img)) {
						db('gm')->where(array('id' => $id, 'status' => $status))->update(array('status' => $status + 1, 'time2' => time(), 'img' => $img, 'zt' => '已打款待同意'));
					} else {
						return $result = ['code' => 0, 'msg' => $status];
					}
				}
				return $result = ['code' => 1, 'msg' => '成功!'];
			} else {
				return $result = ['code' => 0, 'msg' => $status];
			}
		}
		$id = input('id');
		$list = db('gm')->find($id);
		$user = db('users')->find($list['user_id']);
		$this->assign(['list' => $list, 'user' => $user]);
		return $this->fetch();
	}
	public function sellbuy() {
		if (request()->isPost()) {
			if (input('post.status') == 0) {
				$data = Exchange::gm(0, input('post.num'), input('post.name'), input('post.yhk'), input('post.yhk_h'), input('post.yhk_name'));
			} else {
				$data = Exchange::wantbuy(0, input('post.num'), input('post.name'));
			}
			return $data;
		}
		$type = input('type');
		$title = $type == 0 ? '发布挂卖' : '发布求购';
		$this->assign(['title' => $title, 'type' => $type]);
		return $this->fetch();
	}
	public function sell() {
		if (request()->isPost()) {
			$id = input('post.id');
			$status = input('post.status');
			$nickname = input('post.nickname');
			$yhk_name = input('post.yhk_name');
			$yhk = input('post.yhk');
			$yhk_h = input('post.yhk_h');
			$list = db('gm')->where(array('id' => $id, 'status' => $status))->find();
			if (!empty($list) && $status == 12) {
				db('users')->where('user_id', $list['buy_id'])->setInc('xmt', $list['gs']);
				db('gm')->where(array('id' => $list['id']))->update(array('status' => 13, 'time3' => time(), 'zt' => '交易完成'));
				db('log')->insert([
					'time' => time(), 'type' => 23, 'text' => '买入XMT',
					'title' => '买入XMT', 'user_id' => $list['buy_id'],
					'num' => $list['gs'], 'reward' => $list['dj'], 'status' => 1,
					'member_id' => $list['id'],
				]);
				return $result = ['code' => 1, 'msg' => '成功!'];
			} else if (!empty($list) && $status == 10) {
				db('gm')->where(array('id' => $id))->update(array(
					'status' => 11, 'time1' => time(), 'user_id' => 0, 'nickname' => $nickname,
					'yhk_name' => $yhk_name, 'yhk' => $yhk, 'yhk_h' => $yhk_h, 'zt' => '求购待打款',
				));
				return $result = ['code' => 1, 'msg' => '成功!'];
			} else {
				return $result = ['code' => 0, 'msg' => $status];
			}
		}
		$id = input('id');
		$list = db('gm')->find($id);
		$user = db('users')->find($list['buy_id']);
		$this->assign(['list' => $list, 'user' => $user]);
		return $this->fetch();
	}
	public function add() {
		if (request()->isPost()) {
			//构建数组
			$data = input('post.');
			$data['createtime'] = time();
			db('goods')->insert($data);
			$result['code'] = 1;
			$result['msg'] = '添加成功!';
			$result['url'] = url('index');
			return $result;
		} else {
			$this->assign('title', lang('add') . '产品');
			$this->assign('info', 'null');
			return $this->fetch('form');
		}
	}
	public function edit() {
		if (request()->isPost()) {
			$data = input('post.');
			db('goods')->update($data);
			$result['code'] = 1;
			$result['msg'] = '修改成功!';
			$result['url'] = url('index');
			return $result;
		} else {
			$ad_id = input('ad_id');
			$adInfo = db('goods')->where(array('id' => $ad_id))->find();
			$this->assign('info', json_encode($adInfo, true));
			$this->assign('title', lang('edit') . '产品');
			return $this->fetch('form');
		}
	}
	public function editState() {
		$id = input('post.id');
		$ok = input('post.ok');
		$gm = db('gm')->where(array('id' => $id))->field('id,gs,buy_id,sjk_zd')->find(); //判断当前状态情况
		if ($ok == 0) {
			db('users')->where('user_id', $gm['buy_id'])->setInc('xmt', $gm['gs']);
			db('gm')->where(array('id' => $gm['id']))->update(array('status' => 3, 'ht' => 1));
			$result['status'] = 1;
			$result['info'] = '审核通过';
		} elseif ($ok == 1) {
			db('gm')->where(array('id' => $gm['id']))->update(array('status' => 0, 'ht' => 2));
			$result['status'] = 1;
			$result['info'] = '审核不通过';
		}
		return $result;
	}
	public function adOrder() {
		$ad = db('goods');
		foreach (input('post.') as $id => $sort) {
			$ad->where(array('id' => $id))->setField('listorder', $sort);
		}
		$result['code'] = 1;
		$result['msg'] = '排序更新成功';
		$result['url'] = url('index');
		return $result;
	}
	public function del() {
		db('goods')->where(array('id' => input('ad_id')))->delete();
		$this->redirect('index');
	}
	public function check1del() {
		db('my_buy')->where(array('id' => input('id')))->delete();
		$this->redirect('check1');
	}
	public function dsc() {
		$list = db('number')->order('time desc')->select(); //未激活66
		foreach ($list as $i => $a) {
			$user = db('users')->where('user_id', $list[$i]['user_id'])->find();
			$list[$i]['xm'] = $user['xm'];
			$list[$i]['nickname'] = $user['nickname'];
			$list[$i]['mobile'] = $user['mobile'];
		}
		$this->assign(['user' => $user]);
		return $this->fetch();
	}
	public function tj() {
		$data = input('post.');
		$rq = !empty($data['rq']) ? $data['rq'] : date('Y-m-d', time());
		$ymd = count(explode('-', $rq)) == 1 ? '%Y' : (count(explode('-', $rq)) == 2 ? '%Y-%m' : '%Y-%m-%d');
		if (empty($data['rq'])) {
			$where['reg_time'] = "";
			$where['time'] = "";
		} else {
			$where['reg_time'] = "where FROM_UNIXTIME(`reg_time`,'{$ymd}')='{$rq}'";
			$where['time'] = "where FROM_UNIXTIME(`time`,'{$ymd}')='{$rq}'";
		}
		$user = Db::query("
			select count(*) as count,count(if(money_cz>0,true,null)) as count_today,
			count(if(money_cz>0,true,null)) as count_today,
			count(if(hongbao>0 && pass>0 && level>1,true,null)) as hongbao_count,
			sum(money_usdt) as usdt,
			sum(nmct_dj) as nmct_dj,
            sum(zs) as zs,
			sum(nmct) as nmct,
			sum(xmt) as xmt,
			count(if(level=2,true,null)) as level1,
			count(if(level=3,true,null)) as level2,
			count(if(level=4,true,null)) as level3,
			count(if(level=5,true,null)) as level4,
			count(if(level=6,true,null)) as level5,
            count(if(g=1,true,null)) as g1,
            count(if(g=2,true,null)) as g2,
            count(if(g=3,true,null)) as g3
			from clt_users {$where['reg_time']}
		"); //新进会员
		$c_ = db('users')->where('level>1 and hongbao>0')->count();
		$b_ = db('log')->whereTime('time', 'today')->where('type', '6')->count();
		$hongbao_ = $c_ - $b_;
		$usdt = Db::query("
			select count(if(type=1,true,null)) as count,
			SUM(if(type=1,usdt,null)) as usdt1,
			SUM(if(type=2,nmct_dj,null)) as nmct_dj2,
			SUM(if(type=6 ,nmct,null)) as lqhb,
			SUM(if(type=6 ,1,0)) as count6,
			SUM(if(type=7 && title = '红包复投',nmct_dj,null)) as hbft,
			SUM(if(type=7 && title = 'NMCT通证复投NMCT资产',0-nmct,null)) as tz2zc,
			SUM(if(type=9 ,xmt,null)) as nmct2xmt,
			SUM(if(type=10 ,usdt,null)) as usdt10
			from clt_log {$where['time']}
		");
		$gm = Db::query("
			select
			SUM(if(status=3 || status=6,gs,null)) as gm_3,
			SUM(if(status=5,gs,null)) as gm_5,
			SUM(if(status!=4,dj,null)) as gm_dj,
			SUM(if(status=3,1,0)) as count3,
			SUM(if(lang='求购',1,0)) as count1,
			SUM(if(lang='求购',gs,0)) as gs1,
			count(*) as count,
			SUM(gs) as gm_gs,
			SUM(if(status!=4,zg,null)) as gm_zg
			from clt_gm {$where['time']}
		");
		$qkl = db('qkl')->where('ad_id', '49')->find();
		$system = db('system')->where('id', 1)->find();
		$this->assign([
			'user' => $user[0],
			'usdt' => $usdt[0],
			'hongbao_' => $hongbao_,
			'gm' => $gm[0],
			'qkl' => $qkl,
			'system' => $system,
			'rq' => $rq,
		]);
		return $this->fetch();
	}
	public function yhcheck() {
		if (request()->isPost()) {
			$key = input('post.key');
			$page = input('pageIndex');
			$pageSize = input('pageSize');
			$map['a.status'] = 15;
			$list = db('xx')
				->alias('a')
				->join('goods_order w', 'a.id = w.czid', 'LEFT')
				->where($map)
				->field('a.*,w.dz,w.mobile,w.xm')
				->order('a.id desc')
				->paginate(array('list_rows' => $pageSize, 'page' => $page))
				->toArray();
			return $result = ['code' => 0, 'msg' => '获取成功!', 'list' => $list['data'], 'count' => $list['total'], 'rel' => 1];
		}
		return $this->fetch();
	}
	public function check() {
		if (request()->isPost()) {
			$id = input('id');
			$page = input('pageIndex');
			$pageSize = input('pageSize');
			if ($id == 1) {
				$map['rq'] = date('Y-m-d', time());
				$map['status'] = array('in', '0,1,2,3,4,5');
				$list = db('gm')->where($map)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif ($id == 2) {
				$map['status'] = array('in', '0,1,2,3,4,5');
				$list = db('gm')->where($map)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif ($id == 3) {
				$map['status'] = 3;
				$list = db('gm')->where($map)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			} elseif (empty($id)) {
				$map['ht'] = array('in', '1,2');
				$list = db('gm')->where($map)->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			}
			foreach ($list['data'] as $key => $value) {
				$list['data'][$key]['buy_name'] = db('users')->where(array('user_id' => $list['data'][$key]['buy_id']))->value('nickname');
				$list['data'][$key]['buy_name'] = empty($list['data'][$key]['buy_name']) ? '暂无人购买' : $list['data'][$key]['buy_name'];
				$list['data'][$key]['nickname'] = db('users')->where(array('user_id' => $list['data'][$key]['user_id']))->value('nickname');
				$list['data'][$key]['j'] = '';
				$list['data'][$key]['rq'] = date('Y-m-d', $list['data'][$key]['time']);
				$list['data'][$key]['j'] = $list['data'][$key]['user_id'] == $id ? '-' : '+';
				if ($list['data'][$key]['status'] == 0) {
					$list['data'][$key]['zt'] = '挂卖中';
				} else if ($list['data'][$key]['status'] == 1) {
					$list['data'][$key]['zt'] = '待打款';
				} else if ($list['data'][$key]['status'] == 2) {
					$list['data'][$key]['zt'] = '待同意';
				} else if ($list['data'][$key]['status'] == 3) {
					$list['data'][$key]['zt'] = '已完成';
				} else if ($list['data'][$key]['status'] == 4) {
					$list['data'][$key]['zt'] = '挂卖失败';
				} else if ($list['data'][$key]['ht'] == 1) {
					$list['data'][$key]['zt'] = '挂卖异常已通过';
				} else if ($list['data'][$key]['ht'] == 1) {
					$list['data'][$key]['zt'] = '挂卖异常未通过';
				} else if ($list['data'][$key]['status'] == 5 && $list['data'][$key]['ht'] == 0) {
					$list['data'][$key]['zt'] = '挂卖异常待处理';
				}
				$list['data'][$key]['img'] = empty($list['data'][$key]['img']) ? 0 : $list['data'][$key]['img'];
			}
			return $result = ['code' => 0, 'msg' => '获取成功!', 'list' => $list['data'], 'count' => $list['total'], 'rel' => 1];
		}
		$id = input('id');
		if ($id == 1) {
			$title = '今日挂卖列表';
		} else if ($id == 2) {
			$title = '挂卖列表';
		} else if ($id == 3) {
			$title = '挂卖交易成功';
		} else if (empty($id)) {
			$title = '已处理挂卖异常';
		}
		$this->assign(['title' => $title, 'id' => $id]);
		return $this->fetch();
	}
	public function cz() {
		if (request()->isPost()) {
			$page = input('pageIndex');
			$pageSize = input('pageSize');
			$map['type'] = empty(input('type')) ? 0 : input('type');
			$list = db('log')->where($map)->order('time desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			foreach ($list['data'] as $key => $value) {
				$users = db('users')->where(array('user_id' => $list['data'][$key]['user_id']))->find();
				$list['data'][$key]['nickname'] = $users['nickname'];
				$list['data'][$key]['mobile'] = $users['mobile'];
			}
			return $result = ['code' => 0, 'msg' => '获取成功!', 'list' => $list['data'], 'count' => $list['total'], 'rel' => 1];
		}
		$this->assign(['type' => input('type')]);
		return $this->fetch();
	}
	public function code() {
		if (request()->isPost()) {
			$page = input('pageIndex');
			$pageSize = input('pageSize');
			if (empty(input('status')) || input('status') == 0) {
				$map['status'] = 0;
			} else {
				$map['status'] = input('status');
			}
			$list = db('code')->where($map)->order('time desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			foreach ($list['data'] as $key => $value) {
				$users = db('users')->where(array('user_id' => $list['data'][$key]['user_id']))->find();
				$use = db('users')->where(array('user_id' => $list['data'][$key]['use_id']))->find();
				$list['data'][$key]['nickname'] = !empty($users) ? $users['nickname'] : '系统';
				$list['data'][$key]['mobile'] = $users['mobile'];
				$list['data'][$key]['use_nickname'] = $use['nickname'];
				$list['data'][$key]['use_mobile'] = $use['mobile'];
			}
			return $result = ['code' => 0, 'msg' => '获取成功!', 'list' => $list['data'], 'count' => $list['total'], 'rel' => 1];
		}
		$this->assign(['status' => input('status')]);
		return $this->fetch();
	}
	public function code_add() {
		if (request()->isPost()) {
			$gs = input('post.gs');
			for ($i = $gs; $i > 0; $i--) {
//生成激活码
				Db::name('code')->insert([
					'time' => time(),
					'user_id' => 0,
					'code' => Users::randomkeys(6),
					'status' => 1,
				]);
			}
			return ['status' => 1, 'msg' => '操作成功！'];
		}
		return $this->fetch();
	}
	public function cz_type() {
		$id = input('id');
		$type = input('type');
		$log = db('log')->where("`id`={$id}")->find();
		if ($type > 0) {
			$title = '充值USDT审核通过';
		} else {
			$title = '充值USDT已拒绝';
		}
		db('log')->where("`id`={$id}")->setField(['type' => $type, 'title' => $title]);
		if ($type > 0 && $log['type'] == 0) {
			// db('users')->where("`user_id`={$log['user_id']}")
			// ->setField([
			// 	'money_usdt' => ["exp", "`money_usdt`+{$log['usdt']}"], 'money_cz' => ["exp", "`money_cz`+{$log['usdt']}"],
			// ]);
			db('users')->where("`user_id`={$log['user_id']}")->->setInc('money_usdt', $log['usdt']);
			db('users')->where("`user_id`={$log['user_id']}")->->setInc('money_cz', $log['usdt']);
		}
		return ['status' => 1, 'msg' => '操作成功！'];
	}
	public function check1() {
		if (request()->isPost()) {
			$key = input('post.key');
			$page = input('pageIndex');
			$pageSize = input('pageSize');
			$list = db('gm')->where("zt='挂卖异常' || zt='求购异常' ")->order('id desc')->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();
			foreach ($list['data'] as $key => $value) {
				$list['data'][$key]['nickname'] = db('users')->where(array('user_id' => $list['data'][$key]['user_id']))->value('nickname');
				$list['data'][$key]['buy_name'] = db('users')->where(array('user_id' => $list['data'][$key]['buy_id']))->value('nickname');
				$list['data'][$key]['rq'] = date('Y-m-d', $list['data'][$key]['time']);
			}
			return $result = ['code' => 0, 'msg' => '获取成功!', 'list' => $list['data'], 'count' => $list['total'], 'rel' => 1];
		}
		return $this->fetch();
	}
}