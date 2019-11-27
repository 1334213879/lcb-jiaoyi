<?php
namespace app\home\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class Upgrade extends Command {
	protected function configure() {
		$this->setName('upgrade')->setDescription('up level ');
	}

	protected function execute(Input $input, Output $output) {
		$this->upgrade();
		$output->writeln("完成");
	}
	//升级 每天一次
	public function upgrade() {
		$users = db::name('users')->select();
		foreach ($users as $k => $v) {

			switch ($v['level']) {
			// case 1:
			// 	$num = db::name('users')->where('fxid', $v['user_id'])->count();
			// 	if ($num >= 3) {
			// 		db::name('users')->where('user_id', $v['user_id'])->setField('level', 2);
			// 	}
			// 	break;
			case 1:
				$num = db::name('users')->where('fxid', $v['user_id'])->count();
				$u = db::name('users')->where('fxid', $v['user_id'])->select();
				$zs_id = array_column($u, 'user_id');
				$sum = db::name('log')->whereIN('user_id', $zs_id)->where('type', 1)->sum('usdt');

				if ($num >= 3 && $sum > 30000) {
					db::name('users')->where('user_id', $v['user_id'])->setField('level', 2);
				}
				break;
			case 2:
				$th = $this->jisuan($v, 2, 3);
				break;
			case 3:
				$th = $this->jisuan($v, 3, 3);
				break;
			case 4:
				$th = $this->jisuan($v, 4, 3);
				break;
			case 5:
				$th = $this->jisuan($v, 5, 10);
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

	public function jisuan($v, $l, $n) {
		$all = db::name('users')->where('all_fxid', 'like', '%' . $v['user_id'] . '%')->where('level', '>=', $l)->select();
		$f_num = $this->quchong($all, 'fxid');
		$num = count($f_num);
		if ($num >= $n) {
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