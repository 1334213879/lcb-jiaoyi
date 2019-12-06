<?php
namespace app\home\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;

class Zchb extends Command {
	protected function configure() {
		$this->setName('Zchb')->setDescription('xml红包 ');
	}

	protected function execute(Input $input, Output $output) {
		$users = db::name('users')->select();
		foreach ($users as $key => $value) {
			$num = $value['xmt'] * 5 / 100 / 30;
			db('log')->insert(['user_id' => $value['user_id'], 'type' => 60, 'text' => $num]);
			db::name('users')->where('user_id', $value['user_id'])->setInc('nmct', $num);
			db::name('users')->where('user_id', $value['user_id'])->setDec('xmt', $num);
		}
		$output->writeln('完成');
	}
}