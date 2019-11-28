<?php
namespace app\user\controller;
use app\user\model\Exchange;
use app\user\model\Users;
use think\Db;
use think\Input;

class Buy extends Common {
	public function _initialize() {
		parent::_initialize();
	}
	public function jy_lb() {
		$user = db('users')->field('aqmm,pass,zs')->where(array('user_id' => session('user.user_id')))->find();
		$id = input('id');
		/* $cacheKey = "jy_lb{$id}_{$this->_start}";
        $data = Cache::get($cacheKey); 关闭缓存*/
		if (empty($data)) {
			if ($id == 0) {
				// 交易列表
				$where = array('status' => 0);
				$jy = db('gm')->where($where)->limit($this->_start, $this->_pageSize)->order('time desc')->select();
				$total = db('gm')->where($where)->count();
			} elseif ($id == 1) {
				// 待确认交易
				$map['status'] = array('in', '0,10,1,2,11,12');
				$user_id = session('user.user_id');
				$jy = db('gm')->where($map)
					->where("`user_id` = {$user_id} OR `buy_id` = {$user_id}")
				#->fetchSql(true)
					->limit($this->_start, $this->_pageSize)
					->order('time desc,time2 desc,time1 desc')
					->select();
				$total = db('gm')->where($map)
					->where("`user_id` = {$user_id} OR `buy_id` = {$user_id}")
					->count();
			} elseif ($id == 3) {
				// 已完成交易
				$map['status'] = array('in', '3,4,5,13,14');
				$user_id = session('user.user_id');
				$jy = db('gm')->where($map)
					->where("`user_id` = {$user_id} OR `buy_id` = {$user_id}")
				#->fetchSql(true)
					->order('time desc,time3 desc,time2 desc,time1 desc')
					->select();
				$total = db('gm')->where($map)
					->where("`user_id` = {$user_id} OR `buy_id` = {$user_id}")
					->count();
			} elseif ($id == 10) {
				// 已完成交易
				$map['status'] = array('in', '10');
				$user_id = session('user.user_id');
				$jy = db('gm')->where($map)
					->where($map)
				#->fetchSql(true)
					->limit($this->_start, $this->_pageSize)
					->order('time desc')
					->select();
				$total = db('gm')->where($map)
					->count();
			}foreach ((array) $jy as $key => $r) {
				if (!empty($jy[$key]['user_id'])) {
					$jy[$key]['user_mobile'] = db('users')->where(array('user_id' => $jy[$key]['user_id']))->value('mobile');
				} else {
					$jy[$key]['user_mobile'] = '0';
				}
				if (!empty($jy[$key]['buy_id'])) {
					$buy_xx = db('users')->field('mobile,nickname')->where(array('user_id' => $jy[$key]['buy_id']))->find();
					$jy[$key]['buy_mobile'] = $buy_xx['mobile'];
					$jy[$key]['buy_nickname'] = $buy_xx['nickname'];
				} else {
					$jy[$key]['buy_mobile'] = '0';
				}
				//$jy[$key]['time'] = $this->time_tran($jy[$key]['time']);
				$jy[$key]['time'] = date('m-d', $jy[$key]['time']);
				$jy[$key]['time1'] = empty($jy[$key]['time1']) ? 0 : date('m-d', $jy[$key]['time1']);
				$jy[$key]['time2'] = empty($jy[$key]['time2']) ? 0 : date('m-d', $jy[$key]['time2']);
				$jy[$key]['time3'] = empty($jy[$key]['time3']) ? 0 : date('m-d', $jy[$key]['time3']);
				$jy[$key]['gm'] = $jy[$key]['user_id'] == session('user.user_id') ? '0' : '1';
				$jy[$key]['t'] = $jy[$key]['lang'];
				$jy[$key]['lang'] = $jy[$key]['status'] > 10 ? $jy[$key]['buy_nickname'] . '的' . $jy[$key]['lang'] : $jy[$key]['nickname'] . '的' . $jy[$key]['lang'];
				$jy[$key]['my_id'] = session('user.user_id');
				if ($jy[$key]['status'] == 0) {
					$jy[$key]['zt'] = '立即买入';
				} elseif ($jy[$key]['status'] == 1) {
					$jy[$key]['zt'] = $jy[$key]['user_id'] == session('user.user_id') ? '待打款' : '去打款';
				} elseif ($jy[$key]['status'] == 2) {
					$jy[$key]['zt'] = $jy[$key]['user_id'] == session('user.user_id') ? '已打款' : '待确定';
				} elseif ($jy[$key]['status'] == 14) {
					$jy[$key]['zt'] = $jy[$key]['user_id'] == session('user.user_id') ? '撤回出售' : $jy[$key]['zt'];
				} elseif ($jy[$key]['status'] == 3) {
					$jy[$key]['zt'] = $jy[$key]['user_id'] == session('user.user_id') ? '已卖出' : '已买入';
				} /* elseif ($jy[$key]['status'] == 5) {
	                    $jy[$key]['zt'] = '异常';
*/elseif ($jy[$key]['status'] == 11 && $jy[$key]['user_id'] == session('user.user_id')) {
					$jy[$key]['zt'] = '对方暂未打款';
				}
			}
			if (empty($user['aqmm'])) {
				$status = -2;
			} else {
				$status = 1;
			}

			$system=db('system')->where(array('id'=>1))->value('jy');
			$yhk = db('yhk')->where('user_id',session('user.user_id'))->find();
			$data = [
					'status' =>$status,
                    'jy' => $jy,
					'system'=>$system,
					'zs' => $user['zs'],
                    'count' => count($jy),
                    'total' => $total,
					'yhk'=>$yhk
                ];
           //Cache::set($cacheKey, $data, 10);  缓存10秒
        }
        return $data;

	}
	function time_tran($time) {
		$text = '';
		$time = $time === NULL || $time > time() ? time() : intval($time);
		$t = time() - $time; //时间差 （秒）
		$y = date('Y', $time) - date('Y', time()); //是否跨年
		switch ($t) {
		case $t == 0:
			$text = '刚刚';
			break;
		case $t < 60:
			$text = $t . '秒前'; // 一分钟内
			break;
		case $t < 60 * 60:
			$text = floor($t / 60) . '分钟前'; //一小时内
			break;
		case $t < 60 * 60 * 24:
			$text = floor($t / (60 * 60)) . '小时前'; // 一天内
			break;
		case $t < 60 * 60 * 24 * 3:
			$text = floor($time / (60 * 60 * 24)) == 1 ? '昨天 ' . date('H:i', $time) : '前天 ' . date('H:i', $time); //昨天和前天
			break;
		case $t < 60 * 60 * 24 * 30:
			$text = date('m月d日 H:i', $time); //一个月内
			break;
		case $t < 60 * 60 * 24 * 365 && $y == 0:
			$text = date('m月d日', $time); //一年内
			break;
		default:
			$text = date('Y年m月d日', $time); //一年以前
			break;
		}
		return $text;
	}
	public function gm() {
		$id = input('id');
		$users = db('users')->where(array('user_id' => session('user.user_id')))->find();
		$system = db('system')->where(array('id' => 1))->find();
		$money = db('user_level')->where(array('level_id' => $users['level']))->value('money');
		$credit1 = $users['nmct'];
		$price = $system['money_nmct'];
		$dj = $system['dj'];

		$yhk = db('yhk')->where('user_id',session('user.user_id'))->find();
		if(empty($credit1) || empty($price)){

			return json_encode([
				'status' => 0,
			]);
		} else if ($id == 1) {
			return ([
				'status' => 1,
				'level_money' => $money / $price,
				'credit1' => $credit1,
				'price' => $price,
				'dj' => $dj,
			]);

		}else if($id==2){
          $pay = input('pay');
             		if(empty($yhk['yhk']) && $pay==1){
                        	 $data['status']=0;
                            $data['msg']='未填写钱包地址';
                            return $data;		
                        }
          if( $pay==1){
          $token_address = $yhk['yhk'];//$users['token_address'];
          }else{
           $token_address = '';
          }
		  if(empty($users['alipay']) && $pay==2){
		                	 $data['status']=0;
		                    $data['msg']='未填写支付宝账号';
		                    return $data;		
		                }
		  if( $pay==2){
		  $alipay = $users['alipay'];
		  }else{
		   $alipay = '';
		  }
			$data = Exchange::gm(session('user.user_id'),input('gm_number'),'','','','',$token_address,$alipay);

		// } else if ($id == 2) {
		// 	$pay = input('pay');
		// 	if (empty($users['token_address']) && $pay == 1) {
		// 		$data['status'] = 0;
		// 		$data['msg'] = '未填写钱包地址';
		// 		return $data;
		// 	}
		// 	if ($pay == 1) {
		// 		$token_address = $users['token_address'];
		// 	} else {
		// 		$token_address = '';
		// 	}
		// 	if (empty($users['alipay']) && $pay == 2) {
		// 		$data['status'] = 0;
		// 		$data['msg'] = '未填写支付宝账号';
		// 		return $data;
		// 	}
		// 	if ($pay == 2) {
		// 		$alipay = $users['alipay'];
		// 	} else {
		// 		$alipay = '';
		// 	}
		// 	$data = Exchange::gm(session('user.user_id'), input('gm_number'), '', '', '', '', $token_address, $alipay);

			return $data;
		}
	}
	public function buy() {
		$gm_id = input('id');
		$status = input('status');
		if ($status == 0) {
			$my_gm = db('gm')->where(array('id' => $gm_id, 'status' => 0))->find();
			if ($my_gm['user_id'] == session('user.user_id')) {
				$data = Exchange::black(session('user.user_id'), $gm_id);
			} else if (!empty($my_gm)) {
				db('gm')->where(array('id' => $gm_id, 'status' => 0))->update(array(
					'status' => 1, 'time1' => time(), 'buy_id' => session('user.user_id'), 'zt' => '待打款',
				));
				$data['msg'] = '操作成功,待支付';
				$data['status'] = 1;
				$data['tz'] = 1;
			} else {
				$data['status'] = 0;
				$data['msg'] = '错误';
			}

		}else if($status==10){
         
			$my_gm=db('gm')->where(array('id'=>$gm_id,'status'=>10))->find();
			$user=db('users')->where("user_id",session('user.user_id'))->find();
			$yhk=db('yhk')->where(array('user_id'=>session('user.user_id')))->find();
			if(!$yhk || $yhk['yh']=='' || $yhk['yhk']=='' || $yhk['name']==''){
				$data['status']=0;
				$data['msg']='银行卡未绑定!';	
			}else if($my_gm['pay']==1 && empty($user['token_address'])){
				$data['status']=0;
				$data['msg']='钱包地址未填写！';
			}else if($my_gm['pay']==2 && empty($user['alipay'])){
				$data['status']=0;
				$data['msg']='支付宝未填写！';
			}else if($user['nmct']<$my_gm['gs']+$my_gm['dj']){
				$data['status']=0;
				$data['msg']='LCB不足！';
			}else if($my_gm['buy_id']==session('user.user_id')){
				$data = Exchange::black(0,$gm_id);
			}else if(!empty($my_gm)){
				db('log')->insert([
					'time'=>time(),'type'=>20,'text'=>'求购',
					'title'=>'出售LCB','user_id'=>session('user.user_id'),
					'nmct'=>-$my_gm['gs'],'reward'=>$my_gm['dj'],'status'=>0,
					'member_id'=>$gm_id,
				]);
				db('gm')->where(array('id' => $gm_id, 'status' => 10))->update([
					'status' => 11, 'time1' => time(), 'zt' => '求购待打款', 'user_id' => session('user.user_id'),
					'yhk_h' => $yhk['yhk'], 'yhk' => $yhk['yh'], 'yhk_name' => $yhk['name'],
					'token_address' => $user['token_address'], 'alipay' => $user['alipay'],
					'nickname' => !empty($user['xm']) ? $user['xm'] : $user['nickname'],
				]);
				db('users')->where('user_id', session('user.user_id'))->setDec('nmct', $my_gm['gs'] + $my_gm['dj']);
				$data['msg'] = '操作成功,待支付';
				$data['status'] = 1;
				$data['tz'] = 1;
			} else {
				$data['status'] = 0;
				$data['msg'] = '错误';
			}
		} else if ($status == 14) {
			$data = Exchange::black(0, $gm_id);
		}
		return $data;
	}
	public function pay() {
		$id = input('id');
		$img = input('img');
		$status = input('status');
		$user_id = session('user.user_id');
		$my_gm = db('gm')->where("id={$id} and buy_id={$user_id} and status in(1,11)")->find();
		$my_gm1 = db('gm')->where("id={$id} and user_id={$user_id} and status in(2,12)")->find();
		if ($my_gm1['user_id'] == session('user.user_id')) {
			Db::startTrans();
			try {
				$gm = db('gm')->field('gs,buy_id,dj,zg')->where(array('id' => $id))->find();
				Db::name('users')->where('user_id', $gm['buy_id'])->setInc('nmct', $gm['gs']);
				Db::name('gm')->where(array('user_id' => session('user.user_id'), 'id' => $id))->update(array('status' => $status + 1, 'time3' => time(), 'zt' => '交易完成'));
				db('log')->insert([
					'time' => time(), 'type' => 23, 'text' => '买入NMCT',
					'title' => '买入NMCT', 'user_id' => $my_gm1['buy_id'],
					'nmct' => $my_gm1['gs'], 'reward' => $my_gm1['dj'], 'status' => 1,
					'member_id' => $my_gm1['id'],
				]);
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
		} elseif (!empty($img) && !empty($my_gm) && $my_gm['buy_id'] == session('user.user_id')) {
			db('gm')->where(array('id' => $id))->update(array('status' => $status + 1, 'time2' => time(), 'img' => $img, 'zt' => '已打款待确定'));
			$mobile = db('users')->where('user_id', $my_gm['user_id'])->value('mobile');
			Users::smsapi($mobile, '【NMCT】您的订单对方已经打款，请即时处理！');
			$data['code'] = 0;
			$data['status'] = 1;
			$data['msg'] = '上传凭证成功';
			$data['msg1'] = '待卖方审核通过';
		} else if (empty($img)) {
			$data['status'] = 0;
			$data['msg'] = '请上传打款凭证';
		} else {
			$data['status'] = 0;
			$data['msg'] = '失败';
		}
		return $data;
	}
	public function aqmm() {
		$aqmm = db('users')->where(array('user_id' => session('user.user_id')))->value('aqmm');
		if (Users::password(input('aqmm')) == $aqmm) {
			$status = 1;
		} else {
			$status = 0;
		}
		return ([
			'status' => $status,
		]);
	}
	public function wantbuy() {
		$data = Exchange::wantbuy(session('user.user_id'), input('gm_number'), '', input('pay'));
		return $data;
	}
}