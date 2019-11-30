<?php
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Request;

class News extends Common {
	public function _initialize() {
		parent::_initialize();
	}
	//广告列表
	public function index() {
		$key = input('post.key');
		$this->assign('testkey', $key);
		$list = Db::table(config('database.prefix') . 'xw')->alias('a')
			->join(config('database.prefix') . 'ad_type at', 'a.type_id = at.type_id', 'left')
			->field('a.*,at.name as typename')
			->where('a.name', 'like', "%" . $key . "%")
			->order('a.sort')
			->select();
		$this->assign('list', $list);
		return $this->fetch();
	}
	public function add() {
		// if (request()->isPost()) {
		// 	//构建数组
		// 	$data = input('post.');
		// 	$data['addtime'] = time();
		// 	$typeId = explode(':', $data['type_id']);
		// 	$data['type_id'] = $typeId[1];
		// 	$qkl_id = explode(':', $data['qkl_id']);
		// 	$data['qkl_id'] = $qkl_id[1];
		// 	db('xw')->insert($data);
		// 	$result['code'] = 1;
		// 	$result['msg'] = '广告添加成功!';
		// 	$result['url'] = url('index');
		// 	return $result;
		// } else {
		$adtypeList = db('ad_type')->order('sort')->select(); //获取所有广告位
		$this->assign('adtypeList', json_encode($adtypeList, true));
		$qkl = db('qkl')->order('sort')->select(); //获取所有广告位
		$this->assign('title', lang('add') . lang('xw'));
		$this->assign('qkl', json_encode($qkl, true));
		$this->assign('info', 'null');
		$this->assign('adInfo', []);
		return $this->fetch('form');
		// }
	}
	public function edit() {
		// if (request()->isPost()) {
		// 	$data = input('post.');
		// 	$typeId = explode(':', $data['type_id']);
		// 	$data['type_id'] = $typeId[1];
		// 	$qkl_id = explode(':', $data['qkl_id']);
		// 	$data['qkl_id'] = $qkl_id[1];
		// 	db('xw')->update($data);
		// 	$result['code'] = 1;
		// 	$result['msg'] = '广告修改成功!';
		// 	$result['url'] = url('index');
		// 	return $result;
		// } else {
		$adtypeList = db('ad_type')->select();
		$ad_id = input('ad_id');
		$adInfo = db('xw')->where(array('ad_id' => $ad_id))->find();
		$qkl = db('qkl')->order('sort')->select(); //获取所有广告位
		$this->assign('adInfo', $adInfo);
		$this->assign('adtypeList', json_encode($adtypeList, true));
		$this->assign('info', json_encode($adInfo, true));
		$this->assign('title', lang('edit') . lang('xw'));
		$this->assign('qkl', json_encode($qkl, true));

		return $this->fetch('form');
		// }
	}
	public function editState() {
		$id = input('post.id');
		$open = db('xw')->where(array('ad_id' => $id))->value('open'); //判断当前状态情况
		if ($open == 1) {
			$data['open'] = 0;
			db('xw')->where(array('ad_id' => $id))->setField($data);
			$result['status'] = 1;
			$result['info'] = '状态禁止';
		} else {
			$data['open'] = 1;
			db('xw')->where(array('ad_id' => $id))->setField($data);
			$result['status'] = 1;
			$result['info'] = '状态开启';
		}
		return $result;
	}
	public function adOrder() {
		$ad = db('xw');
		foreach (input('post.') as $id => $sort) {
			$ad->where(array('ad_id' => $id))->setField('sort', $sort);
		}
		$result['code'] = 1;
		$result['msg'] = '广告排序更新成功';
		$result['url'] = url('index');
		return $result;
	}
	public function del() {
		db('xw')->where(array('ad_id' => input('ad_id')))->delete();
		$this->redirect('index');
	}

	//位置
	public function type() {
		$key = input('key');
		$this->assign('testkey', $key);
		$list = db('ad_type')->where('name', 'like', "%" . $key . "%")->order('sort')->select();
		$this->assign('list', $list);
		return $this->fetch();
	}
	public function typeOrder() {
		$ad_type = db('ad_type');
		foreach (input('post.') as $id => $sort) {
			$ad_type->where(array('type_id' => $id))->setField('sort', $sort);
		}
		$result['code'] = 1;
		$result['msg'] = '广告位排序更新成功!';
		$result['url'] = url('type');
		return $result;
	}
	public function addType() {
		if (request()->isPost()) {
			db('ad_type')->insert(input('post.'));
			$result['code'] = 1;
			$result['msg'] = '广告位保存成功!';
			$result['url'] = url('type');
			return $result;
		} else {
			$this->assign('title', lang('add') . lang('xw') . '位');
			$this->assign('info', 'null');
			return $this->fetch('typeForm');
		}
	}
	public function editType() {
		if (request()->isPost()) {
			db('ad_type')->update(input('post.'));
			$result['code'] = 1;
			$result['msg'] = '广告位修改成功!';
			$result['url'] = url('type');
			return $result;
		} else {
			$type_id = input('param.type_id');
			$info = db('ad_type')->where('type_id', $type_id)->find();
			$this->assign('title', lang('edit') . lang('xw') . '位');
			$this->assign('info', json_encode($info, true));
			return $this->fetch('typeForm');
		}
	}
	public function delType() {
		$map['type_id'] = input('param.type_id');
		db('ad_type')->where($map)->delete(); //删除广告位
		db('xw')->where($map)->delete(); //删除该广告位所有广告
		$this->redirect('type');
	}
	public function aupdate() {

		$title = input('post.name');
		$content = input('post.content');
		$data = [];
		$data['name'] = $title;
		$data['content'] = $content;
		if (input('post.ad_id') && !empty(input('post.ad_id'))) {
			$msg = db::name('xw')->where('ad_id', input('ad_id'))->update($data);
		} else {
			$msg = db::name('xw')->insert($data);
		}

		if ($msg) {
			$result['code'] = 1;
			$result['msg'] = '成功!';
			$result['url'] = url('/admin/News/index');
			return $result;
		} else {

			$result['code'] = 0;
			$result['msg'] = '失败!';
			$result['url'] = url('/admin/News/index');
			return $result;}

	}

}