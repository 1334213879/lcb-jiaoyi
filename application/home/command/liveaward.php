<?php
namespace app\home\command;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/2/22
 * Time: 14:57
 */
use think\Cache;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class liveaward extends Command {

	protected function configure() {
		$this->setName('liveaward')->setDescription("days 直推奖");
	}

	//调用SendMessage 这个类时,会自动运行execute方法
	protected function execute(Input $input, Output $output) {
		// $output->writeln('Date Crontab job start...');
		/*** 这里写计划任务列表集 START ***/

		$this->birthday(); //发短信
		$output->writeln("完成");
		/*** 这里写计划任务列表集 END ***/
		// $output->writeln('Date Crontab job end...');
	}

	//直推奖
	public function birthday() {
		try {
			Db::startTrans();
			$arr = Cache::get('reg_usdt');
			if (!empty($arr)) {
				foreach ($arr as $k => $v) {
					$msg = db::name('users')->where('user_id', $v)->setInc('money_usdt', 88);
				}
			}
			Cache::rm('reg_usdt');
			Db::commit();
		} catch (Exception $e) {
			Db::rollback();
		}

	}

}