<?php
namespace app\user\model;
use think\Model;
use think\Db;
class Users extends Model
{
    protected $name = 'users';
  	public static function order($list,$t){
		//多维数组重新排序
		if(count($list)>0 && !empty($t)){
			foreach($list as $i=> $a){
						$volume[$i] = $a[$t];
				}
			array_multisort($volume,SORT_DESC,$list);
		}
		return $list;
	}
   public static function smsapi($mobile='',$content=''){
		 $smsapi="https://api.smsbao.com/";
		 $user=13922525853;//短信平台帐号
		 $pass=md5("vv19800228");//短信平台密码
		 $sendurl=$smsapi."sms?u=".$user."&p=".$pass."&m=".$mobile."&c=".urlencode($content);
		 if(!empty($mobile) && !empty($content)){
			$result=file_get_contents($sendurl); 
		 }
		 if(empty($result)) {
		 	return array('code' => 1, 'msg' => '验证码发送成功');
		 } else {
		 	return array('code' => 0, 'msg' => '验证码发送失败');
		 }
	 }
	public static function randomkeys($length)   
	{
   $pattern = '1234567890ABCDEFGHIJKLOMNOPQRSTUVWXYZ';
	$key = '';
    for($i=0;$i<$length;$i++)   
    {
        $key .= $pattern{mt_rand(0,35)};    //生成php随机数   
    }
    return $key;   
	}   
	public static function uplevel($user_id,$level = 0){//会员升级
        $user=db('users')->where('user_id',$user_id)->find();
		$data['time'] = time();
		$data['user_id'] = $user_id;
		$level=db('user_level')->where("level_id={$level} and money<={$user['money_usdt']} and level_id>{$user['level']}")->find();//是否大于当前级别
		if(!empty($level) && $user['pass']==1){//升级vip
			$data['title'] = '升级至'.$level['level_name'];
			$data['type'] =5;
			unset($data['usdt']);
			$data['usdt'] = -$level['money'];
			$data['nmct_dj'] = $level['money']*7*$level['multiple'];//usdt换算nmct = usdt*7*级别倍数 = 冻结nmct
			if(db('log')->insert($data)){
				db('users')->where("user_id={$user['user_id']} and pass=1")->setField([
					'level' =>$level['level_id'],
					'money_usdt'=>['exp',"`money_usdt`-{$level['money']}"],
					'nmct_dj'=>['exp',"`nmct_dj`+{$data['nmct_dj']}"],
				]);
			}
		}
		//升级合伙人
				$g = 0;
			if($user['nmct_dj']>=500000){
				$g = 1;
				$h1=db('users')->where("`fxid`={$user_id} and `g`=1")->count();
				if($user['g']>0 && $h1>=3){
					$g = 2;
					$h2=db('users')->where("`fxid`={$user_id} and `g`=2")->count();
					if($user['g']>1 && $h2>=3){
						$g = 3;
					}
				}
			}
			if($user['g']!=$g){
				db('users')->where('user_id',$user['user_id'])->setField([
						'g' =>$g,
					]);
			}
		return true;
    }
	public static function hongbao($user_id,$type = 0){//红包
		$user=db('users')->where("`user_id`={$user_id}")->find();
		$log=db('log')->where("`user_id`={$user_id} and type=6")->whereTime('time', 'today')->find();
		$data['reward1'] = 0;
		$data['reward2'] = 0;
		$data['reward3'] = 0;
		$data['time'] = time();
		$data['type'] = 6;//领取红包
		$data['user_id'] = $user_id;
		if($user['level']>1 && empty($log) && date("H")>1 && date("H")<24){
			//静态收益
			$data['reward1'] = $user['hongbao'];
			//静态收益
			//动态收益
			$z_count=db('users')->where("`fxid`={$user_id}")->count();//直推人数=奖励代数
			$z_count = $z_count>50?50:$z_count;
			$hongbao = Db::query("
				select hongbao,find_in_set({$user_id},all_fxid) as f from clt_users where find_in_set({$user_id},all_fxid)>0 and find_in_set({$user_id},all_fxid)<={$z_count} and level>1 and pass>0 and hongbao>0
			");
			if(count($hongbao)>0){
				foreach($hongbao as $a){
					$a['f'] = ($a['f'] == 1 ? 1 : 
					($a['f']>=2 && $a['f']<=5 ? 0.2 : 
					($a['f']>=6 && $a['f']<=10 ? 0.1 : 0.01
					 ) ) );
					$a['hongbao'] = ($a['hongbao']>$user['hongbao']?$user['hongbao']:$a['hongbao'])*$a['f'];//烧伤
					$data['reward2'] += $a['hongbao'];
				}
			}
			//动态收益
			//管理奖
			if($user['g']>0){
				$money_3 = 0;
				$list_1 = db('users')->field('level')->where("find_in_set({$user_id},all_fxid) and g<{$user['g']} and level>1")->select();
				if(count($list_1)>0){
					foreach($list_1 as $i){
						if($i['level']==2){
							$money_3 += 6.3;
						}
						if($i['level']==3){
							$money_3 += 36.75;
						}
						if($i['level']==4){
							$money_3 += 84;
						}
						if($i['level']==5){
							$money_3 += 283.5;
						}
						if($i['level']==6){
							$money_3 += 525;
						}
					}
				}
				$jc_list = db('users')->where("find_in_set({$user_id},all_fxid) and g<{$user['g']} and g>0")->select();//极差
				$jc = 0;
				if(count($jc_list)>0){
					foreach($jc_list as $i => $a){
						//$jc_sum = db('users')->where("find_in_set({$a['user_id']},all_fxid)")->sum('hongbao');
						$jc_sum_ = Db::query("
							select count(if(level=2,true,null)) as level1,
							count(if(level=3,true,null)) as level2,
							count(if(level=4,true,null)) as level3,
							count(if(level=5,true,null)) as level4,
							count(if(level=6,true,null)) as level5
							from clt_users where find_in_set({$a['user_id']},all_fxid)>0 and level>1
						");
						$jc_sum = $jc_sum_[0]['level1']*6.3+$jc_sum_[0]['level1']*36.75+$jc_sum_[0]['level1']*84+$jc_sum_[0]['level1']*283.5+$jc_sum_[0]['level1']*525;
						$jc += $a['g']*0.05*$jc_sum;
					}
				}
				$data['reward3'] = $money_3*0.05*$user['g'] - $jc;
				$data['reward3'] = $data['reward3']>0?$data['reward3']:0;
			}
			//管理奖
			$money = round($data['reward1']+$data['reward2']+$data['reward3'],8);
			if($type>0 && $money>0){
				$data['title'] = '领取红包';
				$data['nmct'] = $money;
				$data['nmct_dj'] = -$money;
				$nmct = $user['nmct_dj']>($money/2)?($money/2):$user['nmct_dj'];
				if(db('log')->insert($data)){
					db('users')->where('user_id',$user_id)->setField([
						'nmct_dj' =>['exp',"`nmct_dj`-{$nmct}"],
						'nmct' =>['exp',"`nmct`+{$nmct}"],
					]);
					$data['title'] = '红包复投';
					$data['type'] = 7;
					$data['nmct'] = -$nmct;
					$data['nmct_dj'] = $nmct;
					unset($data['reward1']);unset($data['reward2']);unset($data['reward3']);
					db('log')->insert($data);
				}
			}
			return $money;
		}else{
			return 0;
		}
	}
	public static function password($pass, $salt = '')
    {
        $enPass = hash('sha256', $salt. $pass . $salt);
        $enPass = md5($salt. $enPass . $salt);
        return $enPass;
    }
}