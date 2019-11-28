<?php
namespace app\home\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class Jxj extends Command {
	protected function configure() {
		$this->setName('Jxj')->setDescription('eeee ');
	}
	protected function execute(Input $input, Output $output) {
		$this->jiangli();
		$output->writeln("完成");
	}
	public function jiangli() {
		ini_set('max_execution_time', 0); //300 seconds = 5 minutes
		try {

			$users = db::name('users')->field('user_id,fxid,all_fxid,money_usdt,level,last_award_time,is_overdue,is_excess')->where('is_lock', 0)->select(); //2592000一个月2592000
			$push = [];
			foreach ($users as $k => $v) {
				//有借款未还，停止动态奖励，静态变为1/3
				// $log = db::name('borrow')->where('uid', $v['user_id'])->where('status', 4)->find();

				$time = time() - $v['last_award_time'];
				//时间相差大概在2小时内
				if ($time > (2592000 - 500) || $v['last_award_time'] == 0) {
					//提现超过3000不在享受绩效奖
					if ($v['is_excess'] == 0) {
						//绩效奖
						$jixiao = db::name('users')->where('fxid', $v['user_id'])->field('fxid')->select();

						if (count($jixiao) >= 3) {
							$cn = count($jixiao);
							$mn = (1500 * 6 / 100) * 0.5 * $cn;
							$data = ['user_id' => $v['user_id'], 'type' => 56, 'text' => $mn, 'time' => time()];
							Db::name('log')->insert($data);
							db::name('users')->where('user_id', $v['user_id'])->setInc('bonus', $mn);
						}
					}

					//静态奖
					if ($v['is_overdue'] == 0) {
						$data = ['user_id' => $v['user_id'], 'type' => 57, 'text' => 1500 * 6 / 100, 'time' => time()];
						Db::name('log')->insert($data);
						db::name('users')->where('user_id', $v['user_id'])->setInc('j_bonus', (1500 * 6 / 100));
					} else {
						//减少1/3
						$data = ['user_id' => $v['user_id'], 'type' => 57, 'text' => (1500 * 6 / 100) * 2 / 3, 'time' => time()];
						Db::name('log')->insert($data);
						db::name('users')->where('user_id', $v['user_id'])->setInc('j_bonus', (1500 * 6 / 100) * 2 / 3);
					}

					Db::name('users')->where('user_id', $v['user_id'])->setField('last_award_time', time());

					if ($v['is_overdue'] == 0) {
						// $push[] = $v['user_id'];

						$fxid = explode(',', $v['all_fxid']);
						$i = 0;
						// 管理奖
						$i = 0;
						//所有上级只有一人

						if (count($fxid) == 1) {
							// print_r($v['user_id']);
							if ($v['level'] != 1 && !empty($v['fxid'])) {

								$fd = db::name('users')->where('user_id', $v['fxid'])->find();

								if ($fd['level'] == $v['level']) {
									//平级
									// var_dump(1);
									$data = ['user_id' => $fd['user_id'], 'text' => 1500 * 0.06 * 1 / 100, 'type' => 55, 'time' => time()];
									Db::name('log')->insert($data);
									db::name('users')->where('user_id', $fd['user_id'])->setInc('bonus', (1500 * 0.06 * 1 / 100));
									continue;
								} elseif ($v['level'] > $fd['level']) {
									//越级
									// var_dump(2);
									$data = ['user_id' => $fd['user_id'], 'text' => 1500 * 0.06 * 0.5 / 100, 'type' => 55, 'time' => time()];
									Db::name('log')->insert($data);
									db::name('users')->where('user_id', $fd['user_id'])->setInc('bonus', (1500 * 0.06 * 0.5 / 100));
									continue;

								} else {
									// var_dump(3);
									$zs = db::name('users')->where('user_id', $v['fxid'])->find();
									$pl = $this->beilv($zs['level']);
									$data = ['user_id' => $fd['user_id'], 'text' => 1500 * 6 / 100 * $pl, 'type' => 55, 'time' => time()];
									Db::name('log')->insert($data);
									db::name('users')->where('user_id', $fxid[0])->setInc('bonus', (1500 * 6 / 100) * $pl);
									continue;
								}
							}
						}

// 1020,1013,1000

						//处理平级和越级人
						while ($i <= 13) {
							if (isset($fxid[$i]) && !empty($fxid[$i])) {
								$lev = db::name('users')->where('user_id', $fxid[$i])->find();
								if (isset($fxid[$i + 1])) {

									$xlev = db::name('users')->where('user_id', $fxid[$i + 1])->find();
									if ($lev['level'] != 1) {

										if ($lev['level'] > $xlev['level']) {
											//越级
											$data = ['user_id' => $fxid[$i + 1], 'text' => 1500 * 0.06 * 0.5 / 100, 'type' => 55, 'time' => time()];
											Db::name('log')->insert($data);
											db::name('users')->where('user_id', $fxid[$i + 1])->setInc('bonus', (1500 * 0.06 * 0.5 / 100));
											unset($fxid[$i + 1]);
										} elseif ($lev['level'] == $xlev['level']) {
											//平级
											$data = ['user_id' => $fxid[$i + 1], 'text' => 1500 * 0.06 * 1 / 100, 'type' => 55, 'time' => time()];
											Db::name('log')->insert($data);
											db::name('users')->where('user_id', $fxid[$i + 1])->setInc('bonus', (1500 * 0.06 * 1 / 100));
											unset($fxid[$i + 1]);
										} else {
											//正常
											// db::name('users')->where('user_id', $fxid[$i + 1])->setInc('bonus', (1500*6%));
											$i++;
										}
									} else {
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
						// if ($v['user_id'] == 1021) {
						// var_dump($fxid);
						// }
						$num = count($fxid);
						// print_r($num);	print_r('xxxxxxxxxxx');	print_r($fxid);
						// if ($v['user_id'] == 1023) {
						// 	var_dump($num);
						// }
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
								$data = ['user_id' => $fxid[0], 'text' => (1500 * 6 / 100) * $pl, 'type' => 55, 'time' => time()];
								Db::name('log')->insert($data);
								db::name('users')->where('user_id', $fxid[0])->setInc('bonus', (1500 * 6 / 100) * $pl);
								break;
							// case 2:
							// 	$xc = 0;
							// 	foreach ($fxid as $key => $value) {

							// 		$zs = db::name('users')->where('user_id', $value)->find();
							// 		$azn = db::name('users')->where('fxid', $value)->count();
							// 		if ($azn < 3) {
							// 			$pl = 0;
							// 			$xc = $pl;
							// 		} else {
							// 			if (!isset($xc) || $xc == 0) {

							// 				$pl = $this->beilv($zs['level']);

							// 				if ($key == 0) {
							// 					$xc = $pl;
							// 				} else {
							// 					$pl = $zgfzje - $xc;
							// 					$pl = $xc;
							// 				}
							// 				// var_dump($pl);
							// 			}

							// 		}

							// 		// if ($key != 0) {
							// 		// 	$pl = $zgfzje - $pl;
							// 		// }
							// 		//

							// 		// print_r('|');
							// 		$data = ['user_id' => $value, 'text' => (1500 * 6 / 100) * $pl, 'type' => 444];
							// 		Db::name('log')->insert($data);
							// 		db::name('users')->where('user_id', $value)->setInc('bonus', (1500 * 6 / 100) * $pl);
							// 	}
							// 	break;
							default:
								// var_dump($fxid);
								$xc = 0;
								$pl = 0;

								$fxid = array_reverse($fxid);
								// print_r($fxid);
								foreach ($fxid as $key => $value) {
									$zs = db::name('users')->where('user_id', $value)->find();
									$zs['level'] == 4 ? $nv = 10 : $nv = 3;
									$azn = db::name('users')->where('fxid', $value)->count();

									if ($azn < $nv) {
										$pl = 0;
									} else {
										$pl1 = $this->beilv($zs['level']);

										// isset($fxid[$key + 1]) ? $nl = $fxid[$key + 1] : $nl = 0;
										if (isset($fxid[$key + 1])) {
											$p2 = db::name('users')->where('user_id', $fxid[$key + 1])->find();
											$pl2 = $this->beilv($p2['level']);
										} else {
											$pl2 = 0;
										}

										// $xc += $pl;
										// print_r($xc);
										// $pl = $zgfzje - $xc;
										// // print_r($pl);
										// print_r('||');
									}
									$pl = $pl1 - $pl2;
									$pl <= 0 ? $pl = 0 : $pl;
									// if ($pl > $zgfzje) {
									// 	continue;
									// }
									// print_r($zgfzje);
									// print_r('--');
									// print_r($pl);
									// print_r('--');
									// print_r($value);
									// print_r('||');

									// $pl < 0 ? $pl = abs($pl) : $pl;
									// if ($key == 0) {

									// 	if($azn < $nv){
									// 		$pl = 0;
									// 	}else{
									// 		$pl = $this->beilv($zs['level']);
									// 	}

									// } else {
									// 	$ap = $this->beilv($zs['level']);
									// 	$pl += $ap - $pl;
									// }

									// $ap = $this->beilv($zs['level']);

									// if ($azn < $nv) {
									// 	$pl = 0;
									// } else {
									// 	isset($pl) ? $pl : 0;
									// 	$pl = abs($ap - $pl);
									// }

									//
									// print_r($pl);	print_r('---');
									$data = ['user_id' => $value, 'text' => (1500 * 6 / 100) * $pl, 'type' => 55, 'time' => time()];
									Db::name('log')->insert($data);
									db::name('users')->where('user_id', $value)->setInc('bonus', (1500 * 6 / 100) * $pl);

								}
								break;
							}
						}

						// 	//提现超过3000不在享受绩效奖
						// 	if ($v['is_excess'] == 0) {
						// 		//绩效奖
						// 		$jixiao = db::name('users')->where('fxid', $v['user_id'])->field('fxid')->select();

						// 		if (count($jixiao) >= 3) {
						// 			$cn = count($jixiao);
						// 			$mn = (1500 * 6 / 100) * 0.5 * $cn;
						// 			$data = ['user_id' => $v['user_id'], 'text' => $mn];
						// 			Db::name('log')->insert($data);
						// 			db::name('users')->where('user_id', $v['user_id'])->setInc('bonus', $mn);
						// 		}
						// 	}

						// }
						// //静态奖
						// if ($v['is_overdue'] == 0) {
						// 	db::name('users')->where('user_id', $v['user_id'])->setInc('j_bonus', (1500 * 6 / 100));
						// } else {
						// 	//减少1/3
						// 	db::name('users')->where('user_id', $v['user_id'])->setInc('j_bonus', (1500 * 6 / 100) * 2 / 3);
						// }

						// Db::name('users')->where('user_id', $v['user_id'])->setField('last_award_time', time());

					}
				}
			}

		} catch (Exception $e) {

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
}