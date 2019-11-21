<?php
namespace app\admin\command;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/2/22
 * Time: 14:57
 */
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class Jixiaojiang extends Command {

	protected function configure() {
		$this->setName('jixiaojiang')->setDescription("绩效奖静态奖 30天每次");
	}

	//调用SendMessage 这个类时,会自动运行execute方法
	protected function execute(Input $input, Output $output) {

		$this->jiangli(); //发短信

	}

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

}