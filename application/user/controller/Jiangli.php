<?php
namespace app\user\controller;
use think\Db;

class Jiangli extends Common {

	/**
	 * 借款
	 * @return array
	 * @throws \think\Exception
	 * @throws \think\exception\PDOException
	 */
	public function jiangli() {
		ini_set('max_execution_time', 0); //300 seconds = 5 minutes
		try {

			$users = db::name('users')->field('user_id,fxid,all_fxid,money_usdt,level,last_award_time')->select(); //2592000一个月2592000
			$push = [];
			foreach ($users as $k => $v) {

				$time = time() - $v['last_award_time'];
				//时间相差大概在2小时内
				if ($time > (2592000 + 7000) || $v['last_award_time'] == 0) {

					// $push[] = $v['user_id'];
					if (empty($v['all_fxid'])) {
						continue;
						var_dump(11);
					} else {
						$fxid = explode(',', $v['all_fxid']);
						$i = 0;
						// 管理奖
						$i = 0;
						//处理平级和越级人
						while ($i <= 13) {
							if (isset($fxid[$i]) && !empty($fxid[$i])) {
								$lev = db::name('users')->where('user_id', $fxid[$i])->find();
								if (isset($fxid[$i + 1])) {

									$xlev = db::name('users')->where('user_id', $fxid[$i + 1])->find();

									if ($lev['level'] > $xlev['level']) {
										//越级
										db::name('users')->where('user_id', $fxid[$i + 1])->setInc('bonus', (1500 * 0.5 / 100));
										unset($fxid[$i + 1]);
									} elseif ($lev['level'] = $xlev['level']) {
										//平级
										db::name('users')->where('user_id', $fxid[$i + 1])->setInc('bonus', (1500 * 1 / 100));
										unset($fxid[$i + 1]);
									} else {
										//正常
										// db::name('users')->where('user_id', $fxid[$i + 1])->setInc('bonus', (1500*6%));
										$i++;
									}
								} else {
									$i++;
								}
								$fxid = array_values($fxid);
							} else {
								$i++;
							}
						}
						//处理剩余人
						$fxid = array_values($fxid);
						$num = count($fxid);
						if ($num) {
							$maxu = $fxid[$num - 1];
							$zg = db::name('users')->where('user_id', $maxu)->find();
							$zgl = $zg['level'];
							$zgfzje = $this->beilv($zgl);
							//判断剩余人数,剩余最多为5人
							switch ($num) {
							case 1:
								$zs = db::name('users')->where('user_id', $fxid[0])->find();
								$pl = $this->beilv($zs['level']);
								db::name('users')->where('user_id', $fxid[0])->setInc('bonus', (1500 * 6 / 100) * $pl);
								break;
							case 2:
								foreach ($fxid as $key => $value) {
									$zs = db::name('users')->where('user_id', $value)->find();
									$pl = $this->beilv($zs['level']);
									if ($key != 0) {
										$pl = $zgfzje - $pl;
									}
									//
									db::name('users')->where('user_id', $value)->setInc('bonus', (1500 * 6 / 100) * $pl);
								}
								break;
							default:
								foreach ($fxid as $key => $value) {
									$zs = db::name('users')->where('user_id', $value)->find();

									if ($key == 0) {
										$pl = $this->beilv($zs['level']);
									} else {
										$ap = $this->beilv($zs['level']);
										$pl += $ap - $pl;
									}
									//
									db::name('users')->where('user_id', $value)->setInc('bonus', (1500 * 6 / 100) * $pl);

								}
								break;
							}
						}

					}
					//绩效奖
					$jixiao = db::name('users')->where('fxid', $v['user_id'])->field('fxid')->select();

					if (count($jixiao) > 3) {
						db::name('users')->where('user_id', $v['user_id'])->setInc('bonus', (1500 * 6 / 100) * 0.5);
					}
					//静态奖
					db::name('users')->where('user_id', $v['user_id'])->setInc('bonus', (1500 * 6 / 100));

					Db::name('users')->where('user_id', $v['user_id'])->setField('last_award_time', time());

				}

			}
			return '成功';
		} catch (Exception $e) {
			return '失败';
		}

	}

	public function beilv($level) {
		switch ($level) {
		case 1:
			$zeng = 0.1; //普通
			break;
		case 2:
			$zeng = 0.2; //区
			break;
		case 3:
			$zeng = 0.3; //市
			break;
		case 4:
			$zeng = 0.4; //省
			break;
		case 5:
			$zeng = 0.5; //总
			break;
		default:
			$zeng = 0;
			break;
		}
		return $zeng;
	}

	//升级 每天一次
	public function upgrade() {
		$users = db::name('users')->select();
		foreach ($users as $k => $v) {

			switch ($v['level']) {
			case 1:
				$num = db::name('users')->where('fxid', $v['user_id'])->count();
				if ($num >= 3) {
					db::name('users')->where('user_id', $v['user_id'])->setField('level', 2);
				}
				break;
			case 2:
				$num = db::name('users')->where('fxid', $v['user_id'])->count();
				$u = db::name('users')->where('fxid', $v['user_id'])->select();
				$zs_id = array_column($u, 'user_id');
				$sum = db::name('log')->whereIN('user_id', $zs_id)->where('type', 1)->sum('usdt');

				if ($num >= 3 && $sum > 30000) {
					db::name('users')->where('user_id', $v['user_id'])->setField('level', 3);
				}
				break;
			case 3:
				$th = $this->jisuan($v, 3);
				break;
			case 4:
				$th = $this->jisuan($v, 4);
				break;
			case 5:
				$th = $this->jisuan($v, 5);
				break;
			default:
				// $num = db::name('users')->where('fxid', $v['user_id'])->count();
				// if ($num >= 3) {
				// 	db::name('users')->where('user_id', $v['user_id'])->->setField('level', 2 );
				// }
				break;
			}

		}

	}

	public function jisuan($v, $l) {
		$all = db::name('users')->where('all_fxid', 'like', '%' . $v['user_id'] . '%')->where('level', '>', $l)->select();
		$f_num = $this->quchong($all, 'fxid');
		$num = count($f_num);
		if ($num >= 3) {
			db::name('users')->where('user_id', $v['user_id'])->setField('level', $v['level'] + 1);
		}
		return 1;
	}

	//去重
	public function quchong($arr, $key) {

		$tmp_arr = array();

		foreach ($arr as $k => $v) {

			if (in_array($v[$key], $tmp_arr)) {
//搜索$v[$key]是否在$tmp_arr数组中存在，若存在返回true
				unset($arr[$k]);

			} else {

				$tmp_arr[] = $v[$key];

			}

		}

		sort($arr); //sort函数对数组进行排序

		return $arr;

	}
}
