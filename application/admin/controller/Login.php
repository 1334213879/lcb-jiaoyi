<?php
namespace app\admin\controller;
use app\admin\model\Admin;
use think\Controller;
use think\Db;

class Login extends Controller {
	private $cache_model, $system;
	public function index() {
		if (request()->isPost()) {
			$admin = new Admin();
			$data = input('post.');
			$num = $admin->login($data);
			if ($num == 1) {
				db('admin')->where("pwd", md5($data['password']))->setField([
					'ip' => $_SERVER['REMOTE_ADDR'],
					'last_login' => time(),
					'login_number' => Db::raw('login_number+1'),
				]);
				return json(['code' => 1, 'msg' => '登录成功!', 'url' => url('index/index')]);
			} else {
				return json(array('code' => 0, 'msg' => '用户名或者密码错误，重新输入!'));
			}
		}
		$this->cache_model = array('Module', 'Role', 'Category', 'Posid', 'Field', 'System');
		$this->system = F('System');
		if (empty($this->system)) {
			foreach ($this->cache_model as $r) {
				savecache($r);
			}
		}
		return $this->fetch('login');
	}
	//退出登陆
	public function logout() {
		session(null);
		$this->redirect('login/index');
	}
}