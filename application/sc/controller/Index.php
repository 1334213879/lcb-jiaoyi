<?php
namespace app\sc\controller;
use app\user\model\Users;
use think\Db;

class Index extends Common {
	public function hongbao() {
//静态红包
		$time = date("Ymd");
		if (date("H") == 0 || date("H") == 1) {
			$list = db('users')->field('user_id,nmct_dj,hongbao')->where("`level`>1 and `pass`=1 and `nmct_dj`>0 and `hongbao_time`!={$time}")->order('user_id desc')->limit(300)->select();
			//var_dump($list);die;
			foreach ($list as $i => $a) {
				db('users')->where('user_id', $a['user_id'])->update(array('hongbao' => $a['nmct_dj'] * 0.003, 'hongbao_time' => $time));
			}
			echo $time . '正常触发' . count($list);
		} else {
			$count = db('users')->where("`level`>1 and `pass`=1 and `nmct_dj`>0 and `hongbao_time`!={$time}")->count();
			$count1 = db('log')->where("`type`=5")->whereTime('time', 'today')->count();
			if ($count - $count1 / 2 > 0 && $count1 > 1) {
				Users::smsapi('', '红包异常请及时处理');
				echo $time . '日异常个数' . $count;
			} else {
				echo $time . '正常';
			}
			$jy = db('gm')->field('dj,gs,time,time1,time2,user_id,buy_id,id')->whereTime('time', 'today')->where("`status`=4 and `time1`>0")->select();
			foreach ($jy as $i) {
				$nmct = db('users')->where('user_id', $i['user_id'])->value('nmct');
				if (empty($i['time2']) && $nmct < $i['gs']) {
//查看交易异常
					Users::smsapi('', '交易异常请及时处理');
					echo $time . '交易异常请及时处理' . $i['id'];
				}
			}
			//var_dump($list);die;
		}
	}
	public function sms() {
//短信提醒
		$map0['status'] = array('in', '1,11');
		$map0['time1'] = array('elt', time() - 3600 * 24);
		$gm_1 = db('gm')->field('dj,gs,time,time1,user_id,buy_id,id')->where($map0)->limit(1000)->select();
		if (count($gm_1) > 0) {
			Db::startTrans();
			try {
				foreach ($gm_1 as $r) {
					$mobile = db('users')->where('user_id', $r['buy_id'])->value('mobile');
					Users::smsapi($mobile, '【LCB】您的订单已经超过24H未付款，请即时处理！');
				}
				Db::commit();
				echo ('<br>挂卖超过24小时未付款' . count($gm_1));
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				Db::rollback();
				echo ('<br>操作失败');
			}
		} else {
			echo ('<br>没有超过1小时未付款');
		}
	}
	public function gm0() {
		$map0['status'] = array('in', '0,10');
		$map0['time'] = array('elt', time() - 48 * 3600);
		$gm_0 = db('gm')->where($map0)->limit(1000)->select();
		if (count($gm_0) > 0) {
			Db::startTrans();
			try {
				foreach ($gm_0 as $r) {
					if ($r['status'] == 0) {
						//Db::name('gm')->where(array('id'=>$r['id']))->update(array('status'=>1,'time1'=>time(),'buy_id'=>0,'buy_name'=>'系统','zt'=>'待打款'));
					} else {
						//Db::name('gm')->where(array('id'=>$r['id']))->update(array('status'=>14,'time3'=>time(),'zt'=>'无人出售'));
					}
				}
				Db::commit();
				echo ('<br>48小时挂卖系统回购' . count($gm_0));
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				Db::rollback();
				echo ('<br>操作失败');
			}
		} else {
			echo ('<br>没有需要挂卖下架');
		}
	}
	public function gm1() {
//订单撤回
		$map0['status'] = array('in', '1,11');
		$map0['time1'] = array('elt', time() - 3600 * 48);
		$gm_1 = db('gm')->field('dj,gs,time,time1,user_id,status,id')->where($map0)->limit(1000)->select();
		//var_dump($gm_1);die;
		if (count($gm_1) > 0) {
			Db::startTrans();
			try {
				foreach ($gm_1 as $r) {
					if ($r['status'] == 1) {
						Db::name('gm')->where(array('id' => $r['id']))->update(array('status' => 0, 'zt' => '挂卖中'));
					} else {
						Db::name('gm')->where(array('id' => $r['id']))->update(array('status' => 10, 'zt' => '求购中'));
					}
				}
				Db::commit();
				echo ('<br>挂卖超过48小时未付款' . count($gm_1));
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				Db::rollback();
				echo ('<br>操作失败');
			}
		} else {
			echo ('<br>没有超过25小时未付款');
		}
	}
	public function gm2() {
		$map0['status'] = array('in', '2,12');
		$map0['time2'] = array('elt', time() - 3600 * 48);
		$gm_2 = db('gm')->field('dj,gs,time,time1,user_id,id,zg,status')->where($map0)->limit(1000)->select();
		if (count($gm_2) > 0) {
			Db::startTrans();
			try {
				foreach ($gm_2 as $r) {
					if ($r['status'] == 2) {
						//Db::name('gm')->where(array('id'=>$r['id']))->update(array('status'=>5,'zt'=>'挂卖异常'));
					} else {
						//Db::name('gm')->where(array('id'=>$r['id']))->update(array('status'=>15,'zt'=>'求购异常'));
					}
				}
				Db::commit();
				echo ('<br>已打款未确定，交易异常');
			} catch (\Exception $e) {
				// 更新失败 回滚事务
				Db::rollback();
				echo ('<br>操作失败');
			}
		} else {
			echo ('<br>没有交易异常');
		}
	}
}