<?php
namespace app\home\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class TimeMonitor extends Command {
	protected function configure() {
		$this->setName('TimeMonitor')->setDescription('时间监测,每天');
	}

	protected function execute(Input $input, Output $output) {
		$this->txtime();
		$output->writeln("完成");
	}

	//提现超三千出局以后不在享受绩效奖
	public function txtime() {
		$users = db::name('users')->select();
		foreach ($users as $key => $value) {
			if ($value['yet_tx_money'] >= 3000) {
				db::name('users')->where('user_id', $value['user_id'])->update(['is_excess' => 1, 'j_bonus' => 0, 'bonus' => 0]);
				// ->setField('is_excess', 1);
			}
			//48小时内未激活自动销号
			if (!empty($value['out_time']) && (time() - $value['out_time'] >= 172800)) {
				db::name('users')->where('user_id', $value['user_id'])->setField('is_lock', 1);
			}
			//借款逾期
			$overdue = db::name('borrow')->where('uid', $value['user_id'])->where('status', 2)->order('j_time', 'desc')->find();

			if (!empty($overdue)) {

				if (time() - $overdue['j_time'] >= 172800) {
					db::name('users')->where('user_id', $value['user_id'])->setField('is_overdue', 1);
					db::name('borrow')->where('id', $overdue['id'])->setField('status', 4);
				}
			}

		}

	}

}