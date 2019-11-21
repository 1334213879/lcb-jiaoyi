<?php
namespace app\user\model;

use think\Model;
use think\Db;
class Exchange extends Model
{
  public static function gm($user_id,$gs,$name='',$band_name='',$band_k='',$band_xm='',$token_address='',$alipay=''){
				$check = db('gm')->where("buy_id = {$user_id} and status in (0,1,2)")->whereOr("user_id = {$user_id} and status in (0,1,2,10,11,12)")->find();
				if(!empty($check)){
					return ['status'=>0,'msg'=>'您有交易尚未完成！'];
				}
				$check_time = db('gm')->where("user_id = {$user_id} and status in (0,1,2,3)")->whereTime('time','today')->find();
				if(!empty($check_time)){
					return ['status'=>0,'msg'=>'每日只能挂卖一单！'];
				}
				$system=db('system')->where(array('id'=>1))->find();
				$users=db('users')->where(array('user_id'=>$user_id))->find();
				$yhk=db('yhk')->where(array('user_id'=>$user_id))->find();
   				 $credit1 = $users['nmct'];
				if(!empty($name) ||!empty($band_name) ||!empty($band_k) ||!empty($band_xm) && $user_id==0){
					$credit1 = 100000000;
				}else{
					if(!$yhk || $yhk['yh']=='' || $yhk['yhk']=='' || $yhk['name']==''){
						$data['status']=0;
						$data['msg']='银行卡未绑定';
						return $data;						
					}
				}
				$price = $system['money_nmct'];
				$dj = $system['dj'];
				$data['ok']=1;
    			$gm['pay'] = !empty($token_address)?1:0;
				$gm['pay'] = !empty($alipay)?2:$gm['pay'];
    			$gm['token_address'] = $token_address;
				$gm['alipay'] = $alipay;
				$gm['jg']=$price;
				$gm['gs']=$gs;
				$gm['dj']=$dj*$gm['gs'];
				$gm['time']=time();
				$gm['zg']= ($gm['gs']*$gm['jg']*800000)/1000000;
				$gm['rq']=date("Y-m-d",time());
				$gm['user_id']=$user_id;
				if($credit1<$gm['gs']+$gm['dj']){
					$data['status']=0;
					$data['msg']='资产不足';
                  return $data;
				}else if(intval($gm)>99){
					$data['status']=0;
					$data['msg']='非法错误';
                  return $data;
				}else{
				$gm['zt']='挂卖中';
				$gm['nickname']=!empty($name)?$name:$users['nickname'];
				$gm['yhk']=!empty($band_name)?$band_name:$yhk['yh'];
				$gm['yhk_name']=!empty($band_xm)?$band_xm:$yhk['name'];
				$gm['yhk_h']=!empty($band_k)?$band_k:$yhk['yhk'];
				Db::startTrans();
				try{
				$gm_id = Db::name('gm')->insertGetId($gm);
				db('log')->insert([
					'time'=>time(),'type'=>20,'text'=>'挂卖',
					'title'=>'挂卖NMCT','user_id'=>$user_id,
					'nmct'=>-$gm['gs'],'reward1'=>$gm['dj'],'status'=>0,
					'member_id'=>$gm_id,
				]);
				if($user_id>0){
					Db::name('users')->where('user_id',$user_id)->setDec('nmct',$gm['gs']+$gm['dj']);
				}
				// 更新成功 提交事务
				$data['status']=1;
				$data['tz']=0;
				$data['msg']='挂卖成功';
				$data['msg1']='挂卖中，待购买';
				Db::commit();
				} catch (\Exception $e) {
					// 更新失败 回滚事务
					Db::rollback();
					$data['status']=0;
					$data['msg']='操作失败';
				}
				}
				return $data;
  }
  public static function wantbuy($user_id,$gs,$name='',$pay='0'){
	  $check = db('gm')->where("buy_id = {$user_id} and status in (10,11,12)")->whereOr("user_id = {$user_id} and status in (0,1,2,10,11,12)")->count();
   	  $check1 = db('gm')->where("user_id = {$user_id} and status in (0,1,2)")->count();
    			if($check1>0){
					return ['status'=>0,'msg'=>'您的挂卖交易尚未完成！'];
				}
				if($check>9){
					return ['status'=>0,'msg'=>'每次最多只能求购10单！'];
				}
		$system=db('system')->where(array('id'=>1))->find();
		$users=db('users')->where(array('user_id'=>$user_id))->find();
		$gm['buy_id'] = $user_id;
		if(!empty($name)){
			$gm['buyname'] = $name;
		}else{
			$gm['buyname'] = !empty($users['xm'])?$users['xm']:$users['nickname'];
		}
		$gm['status'] = 10;
		$gm['jg'] = $system['money_nmct'];
		$gm['lang'] = '求购';
		$gm['zt'] = '求购中';
		$gm['gs'] = $gs;
   	 $gm['pay']=$pay;
		$gm['zg'] = ($gm['gs']*$gm['jg']*80000)/100000;
		$gm['dj'] = $gm['gs']*$system['dj'];
		$gm['time'] = time();
		if(db('gm')->insert($gm)){
			$data['status']=1;
			$data['msg']='求购成功';
		}else{
			$data['status']=0;
			$data['msg']='操作失败';
		}
		return $data;
	}
	public static function black($user_id=0,$gm_id,$zt=''){
		$my_gm=db('gm')->where("id={$gm_id} and status in (0,10,1,11)")->find();
			if(empty($my_gm)){
				$data['status']=0;
				$data['msg']='改订单处于交易状态或不存在！';
			}else if(!empty($my_gm)){
				$zt = !empty($zt)?$zt:'已撤回'.$my_gm['lang'];
             	 $status = $my_gm['status']>9?14:4;
				
				if($user_id>0){
                  db('gm')->where(array('id'=>$gm_id,'user_id'=>$user_id))->update(array(
                      'status'=>$status,'time3'=>time(),'zt'=>$zt
                  ));
					db('log')->insert([
						'time'=>time(),'type'=>24,'text'=>$my_gm['lang'],
						'title'=>$zt,'user_id'=>$user_id,
						'nmct'=>$my_gm['gs']+$my_gm['dj'],'status'=>1,
						'member_id'=>$gm_id,
					]);
                  db('users')->where('user_id',$user_id)->setInc('nmct',$my_gm['gs']+$my_gm['dj']);
				}else{
                	db('gm')->where(array('id'=>$gm_id))->update(array(
                      'status'=>$status,'time3'=>time(),'zt'=>$zt
                  ));
                }
				$data['msg']='撤回成功';
				$data['status']=1;
				$data['tz']=1;
			}else{
				$data['status']=0;
				$data['msg']='错误';
			}
			return $data;
	}
}