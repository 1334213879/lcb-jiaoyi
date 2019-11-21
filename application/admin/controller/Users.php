<?php
namespace app\admin\controller;
use think\Db;
use think\Input;
use think\Request;
use think\Controller;
use app\admin\model\Users as UsersModel;//后台充值MODE
use app\user\model\Users as Users_;//购买VIP
class Users extends Common{
	public function dieall(){
		 //db('users')->where(array('ad_id'=>input('ad_id')))->delete();
			 db('log')->where('id','>',0)->delete();
			 db('users')->where('user_id','>',0)->delete();
			 return 1;
	}
	public static function password($pass, $salt = '')
    {
        $enPass = hash('sha256', $salt. $pass . $salt);
        $enPass = md5($salt. $enPass . $salt);
        return $enPass;
    }
	public function list_(){
		 if(request()->isPost()) {
			$user_id=input('user_id');
			$type= input('type');
			if($type ==1){
				$map['usdt'] = array('neq',0);
			}elseif($type ==2){
				$map['xmt'] = array('neq',0);
			}elseif($type ==3){
				$map['nmct'] = array('neq',0);
			}elseif($type ==4){
				$map['nmct_dj'] = array('neq',0);
			}
			$all = db('users')->where("find_in_set({$user_id},all_fxid)")->column('user_id');
			if(!empty($all)){
				$all = implode(',',array_unique($all));
			}
			$map['user_id'] = array('in',$all);
			$page =input('pageIndex');
			$pageSize =input('pageSize');
			$list=db('log')
					->where($map)
					->order('time desc')
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			foreach($list['data'] as $i=>$a){
				$user=db('users')->field('nickname,xm,mobile')->where('user_id',$list['data'][$i]['user_id'])->find();
				$list['data'][$i]['nickname'] = $user['nickname'];
				$list['data'][$i]['xm'] = $user['xm'];
				$list['data'][$i]['mobile'] = $user['mobile'];
			}
			return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
		 }else{
			$user_id=input('user_id');
			$type=input('type');
			$this->assign([
				'type'=>$type,
				'user_id'=>$user_id,
			]);
			return $this->fetch();
		 }
    }
	public function adduser(){
		 if(request()->isPost()) {
			$data = input('post.'); 
			if(!$data['nickname'] || !$data['mobile'] || !$data['password'] || !$data['fxid'] ){
                return array('code'=>0,'msg'=>'请完善信息');
            }
			$data['fxid'] = empty($data['fxid'])?0:$data['fxid'];
			$jc=db('users')->field('user_id')->where("mobile",$data['mobile'])->find();
			$fxid=db('users')->field('user_id,all_fxid')->where('user_id',$data['fxid'])->find();
			if($jc){
				return array('code'=>0,'msg'=>'该手机已注册');
			}
			if($data['fxid']>0 && empty($fxid)){
				return array('code'=>0,'msg'=>'该上级不存在');
			}else{
				$map['fxid'] = $fxid['user_id'];	
				$map['all_fxid'] = !empty($fxid['all_fxid'])?$fxid['user_id'].','.$fxid['all_fxid']:$fxid['user_id'];
			}
			$time=intval(time())+3600*24*30;
			$map['last_ip'] = $_SERVER['REMOTE_ADDR'];
			$map['mobile'] = $data['mobile'];
			$map['pass'] = $data['pass'];
            $map['nickname'] = $data['nickname'];
			$map['xm'] = $data['xm'];
			$map['reg_time'] = time();
			$map['password'] = Users_::password($data['password'], $map['reg_time']);
			$map['rq']=date("Y-m-d",time());
			$map['token'] = md5(time().mt_rand(1,99999));
			//$level_ = Db::name('user_level')->where('level_id',$data['level_id'])->find();
			$code = 1;
			$data['usdt'] = empty($data['usdt'])?0:$data['usdt'];
			$data['xmtt'] = empty($data['xmtt'])?0:$data['xmtt'];
			 Db::startTrans();
				try{
					$user_id = Db::name('users')->insertGetId($map);
					$user=db('users')->where('user_id',$user_id)->find();
					if($data['usdt']>0){
						UsersModel::cz(array(
							'user_id'=>$user_id,
							'type_'=>'usdt',
							'num'=>$data['usdt'],
						));
					}
					UsersModel::cz(array(
							'user_id'=>$user_id,
							'type_'=>'nmct_dj',
							'title'=>'注册赠送NMCT资产',
							'num'=>88,
						));
					if($data['level']>0){
						Users_::uplevel($user_id,$data['level']);
					}
					Db::commit();
					return array('code'=>1,'user_id'=>$user_id,'msg'=>'注册成功');
				} catch (\Exception $e) {
					// 更新失败 回滚事务
					Db::rollback();
					return array('code'=>0,'msg'=>'注册失败');
			}
			}
			$fx=db('users')->field('user_id,nickname')->where('user_id',input('fxid'))->find();
			$this->assign('fx',$fx);
			return $this->fetch();
    }
	public function pass(){
		 if(request()->isPost()) {
			$id=input('post.user_id');
			db('users')->where(array('user_id'=>$id))->update(array('pass'=>input('post.pass')));
			return ['code'=>1,'url'=>url('index')];
		 }else{
			$id=input('user_id');
			$user=db('users')->where(array('user_id'=>$id))->find();//判断当前状态情况
			$user['sfz_img'] = json_decode($user['sfz_img']);
			$yhk=db('yhk')->where(array('user_id'=>$id))->find();//判断当前状态情况
			$this->assign([
				'user'=>$user,
				'yhk'=>$yhk,
			]);
			return $this->fetch();
		 }
    }
	
	  public function hy(){
		 if(request()->isPost()) {
            //构建数组
            $data = input('post.');
            $data['addtime'] = time();
            $typeId = explode(':',$data['type_id']);
            $data['type_id'] =$typeId[1];
			$qkl_id = explode(':',$data['qkl_id']);
            $data['qkl_id'] =$qkl_id[1];
            db('xw')->insert($data);
            $result['code'] = 1;
            $result['msg'] = '广告添加成功!';
            $result['url'] = url('index');
            return $result;
        }else{
			return $this->fetch();
		}
    }
	  public function index(){
        if(request()->isPost()){
			$type=input('type');
			$all_p=input('all_p');
          $g=input('g');
			$key=input('post.key');
			$page =input('pageIndex');
			$pageSize =input('pageSize');
			if($all_p>0){
				$list=db('users')
					->where("find_in_set({$all_p},all_fxid)")
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}elseif(!empty($type) && $type=='gl'){
				$gl = db('log')->where('type',8)->column('user_id');
				$gl = implode(',',array_unique($gl));
				$list=db('users')
					->where("`user_id` in ({$gl})")
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}elseif(!empty($g) && $g=='1'){
				$list=db('users')
					->where('g>0')
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(!empty($type) && $type=='money_nocz'){
				$list=db('users')
					->where('money_cz',0)
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(!empty($type) && $type=='dj'){
				$list=db('users')
					->where('is_lock',1)
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(!empty($type) && $type=='zs'){
				$list=db('users')
					->where('zs',1)
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(!empty($type) && $type=='ndj'){
				$list=db('users')
					->where('is_lock',0)
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(!empty($type) && $type>0){
				$list=db('users')
					->where('level',$type)
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(!empty($type)){
				$list=db('users')
					->where($type,'>',0)
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}else if(empty($type)){
				$list=db('users')
					->where('mobile|nickname|rq|user_id|xm','like',"%".$key."%")
					->paginate(array('list_rows'=>$pageSize,'page'=>$page))
					->toArray();
			}
			$tj = [
			'level'=>0,'level1'=>0,'level2'=>0,'level3'=>0,'level4'=>0,'level5'=>0,'g'=>0,'dj'=>0,'ndj'=>0,'zs'=>0,
			'usdt'=>0,'money_cz'=>0,'xmt'=>0,'nmct'=>0,'nmct_dj'=>0,
			'count'=>count($list['data']),'people_nocz'=>0
			];
          $fole = 1000000000;
			foreach ($list['data'] as $key => $value) {
				$list['data'][$key]['sj_nickname'] = db('users')->where(array('user_id'=>$list['data'][$key]['fxid']))->value('nickname');
				$tj['level'] += $list['data'][$key]['level']==1?1:0;
				$tj['level1'] += $list['data'][$key]['level']==2?1:0;
				$tj['level2'] += $list['data'][$key]['level']==3?1:0;
				$tj['level3'] += $list['data'][$key]['level']==4?1:0;
				$tj['level4'] += $list['data'][$key]['level']==5?1:0;
				$tj['level5'] += $list['data'][$key]['level']==6?1:0;
             	 $tj['zs'] += $list['data'][$key]['zs'];
				$tj['g'] += $list['data'][$key]['g']>0?1:0;
				$tj['people_nocz'] += $list['data'][$key]['money_cz']==0?1:0;
				$tj['usdt'] += $list['data'][$key]['money_usdt']*$fole;
				$tj['money_cz'] += $list['data'][$key]['money_cz']*$fole;
				$tj['xmt'] += $list['data'][$key]['xmt']*$fole;
				$tj['nmct'] += $list['data'][$key]['nmct']*$fole;
				$tj['nmct_dj'] += $list['data'][$key]['nmct_dj']*$fole;
			}
			$tj['usdt'] = $tj['usdt']/$fole;
			$tj['money_cz'] = $tj['money_cz']/$fole;
			$tj['xmt'] = $tj['xmt']/$fole;
			$tj['nmct'] = $tj['nmct']/$fole;
			$tj['nmct_dj'] = $tj['nmct_dj']/$fole;
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1,'tj'=>$tj];
        }
		$my=db('users')->where(array('user_id'=>input('all_p')))->find();//判断当前状态情况
		$this->assign(['type'=>input('type'),'all_p'=>input('all_p'),'g'=>input('g'),'my'=>$my]);
        return $this->fetch();
    }
    public function usersState(){
        $id=input('post.id');
		$type=input('post.type');
		if($type>0){
			$status=db('users')->where(array('user_id'=>$id))->value('zs');//判断当前状态情况
			if($status==1){
				$data['zs'] = 0;
				db('users')->where(array('user_id'=>$id))->setField($data);
				$result['info'] = '非赠送';
				$result['status'] = 1;
			}else{
				$data['zs'] = 1;
				db('users')->where(array('user_id'=>$id))->setField($data);
				$result['info'] = '赠送';
				$result['status'] = 1;
			}
		}else{
			$status=db('users')->where(array('user_id'=>$id))->value('is_lock');//判断当前状态情况
			if($status==1){
				$data['is_lock'] = 0;
				db('users')->where(array('user_id'=>$id))->setField($data);
				$result['info'] = '状态开启';
				$result['status'] = 1;
			}else{
				$data['is_lock'] = 1;
				db('users')->where(array('user_id'=>$id))->setField($data);
				$result['info'] = '状态禁止';
				$result['status'] = 1;
			}
		}
        
        return $result;
    }

    /**
     * 冻结领取红包
     * @return mixed
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function usersRedStatus()
    {
        $id = input('post.id');

        $result['code'] = '000000';

        $users = db('users')
            ->field('is_red_envelope')
            ->where(['user_id'=>$id])
            ->find();

        if(!$users){
            $result['code'] = 'U00001';
            $result['msg'] = '用户不存在';
            return $result;
        }

        $status = 0;
        if($users['is_red_envelope'] == 0){
            $status = 1;
        }

        $modify = db('users')
            ->where(['user_id'=>$id])
            ->update(['is_red_envelope'=>$status]);

        if(!$modify){
            $result['code'] = 'U00001';
            $result['msg'] = '红包冻结状态修改失败';
            return $result;
        }

        $result['msg'] = '红包已冻结';
        if(!$status){
            $result['msg'] = '红包已取消冻结';
        }

        $result['data'] = [
            'status' => $status
        ];
        return $result;
    }

	public function jy_log(){
	if(request()->isPost()){
			$id=input('user_id');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
			$list=db('gm')->where("user_id={$id} OR buy_id={$id}")->order('id desc')->paginate(array('list_rows'=>$pageSize,'page'=>$page))->toArray();
			foreach ($list['data'] as $key => $value) {
				$list['data'][$key]['j']='';
				$list['data'][$key]['j']=$list['data'][$key]['user_id']==$id?'-':'+';
				/* $list['data'][$key]['nickname']=$list['data'][$key]['user_id']==$id?$list['data'][$key]['nickname']:$list['data'][$key]['buy_name'];
				$list['data'][$key]['buy_name']=$list['data'][$key]['user_id']==$id?$list['data'][$key]['buy_name']:$list['data'][$key]['nickname']; */
				if($list['data'][$key]['status']==0){
						$list['data'][$key]['zt']='挂卖中';
					}else if($list['data'][$key]['status']==1){
						$list['data'][$key]['zt']='待打款';
					}else if($list['data'][$key]['status']==2){
						$list['data'][$key]['zt']='待同意';
					}else if($list['data'][$key]['status']==3){
						$list['data'][$key]['zt']=$list['data'][$key]['user_id']==$id?'已卖出':'已买入';
					}else if($list['data'][$key]['status']==4){
						$list['data'][$key]['zt']='交易失败';
					}else if($list['data'][$key]['ht']==1){
						$list['data'][$key]['zt']='挂卖异常已通过';
					}else if($list['data'][$key]['ht']==1){
						$list['data'][$key]['zt']='挂卖异常未通过';
					}else if($list['data'][$key]['status']==5 && $list['data'][$key]['ht']==0){
						$list['data'][$key]['zt']='挂卖异常待处理';
					}
				$list['data'][$key]['img']=empty($list['data'][$key]['img'])?0:$list['data'][$key]['img'];
				$list['data'][$key]['buy_name']=db('users')->where(array('user_id'=>$list['data'][$key]['buy_id']))->value('nickname');
				$list['data'][$key]['buy_name']=empty($list['data'][$key]['buy_name'])?'暂无人购买':$list['data'][$key]['buy_name'];
				$list['data'][$key]['nickname']=db('users')->where(array('user_id'=>$list['data'][$key]['user_id']))->value('nickname');
			}
			return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
		}
			$nickname=db('users')->where(array('user_id'=>input('user_id')))->value('nickname');
			$this->assign('title',$nickname.'的交易信息');
			return $this->fetch();
	}
	public function zr_log(){
		if(request()->isPost()){
			$id=input('user_id');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
			$list=db('zc_news')->where("my_id={$id} OR you_id={$id}")->order('id desc')->paginate(array('list_rows'=>$pageSize,'page'=>$page))->toArray();
			/* $list=db('zc_news')->where("my_id={$id} OR you_id={$id}")->order('id desc')->paginate(array('list_rows'=>$pageSize,'page'=>$page))->toArray(); */
			foreach ($list['data'] as $key => $value) {
				$list['data'][$key]['rq']=date('Y-m-d',$list['data'][$key]['time']);
				$list['data'][$key]['my']=db('users')->where(array('user_id'=>$list['data'][$key]['my_id']))->value('nickname');
				$list['data'][$key]['you']=db('users')->where(array('user_id'=>$list['data'][$key]['you_id']))->value('nickname');
			}
			return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
		}
			$nickname=db('users')->where(array('user_id'=>input('user_id')))->value('nickname');
			$this->assign('title',$nickname.'的转让记录');
			return $this->fetch();
	}
	public function recharge_log(){
		$this->assign([
				'user_id'=>input('user_id'),
			]);
			return $this->fetch();
	}
	public function recharge(){
		if(request()->isPost()){
			$result	= UsersModel::cz(input('post.'));
            return $result;
		}else{
			$id=input('user_id');
			$qkl=db('qkl')->order('sort')->select();
			$user=db('users')->where(array('user_id'=>$id))->find();
			$level=db('user_level')->where("`level_id`>{$user['level']}")->select();
			$this->assign(['user'=>$user,'title'=>'后台充值','level'=>$level]);
			return $this->fetch();
		}
	}
     public function edit($user_id=''){
        if(request()->isPost()){
            $user = db('users');
            $data = input('post.');
			if(!empty($data['num']) && $data['num']>0 && !empty($data['type_'])){
				$reg = UsersModel::cz(array(
					'user_id'=>$user_id,
					'type_'=>$data['type_'],
					'num'=>$data['num'],
				));
				if($reg['code']==0){
					return $reg;
				}
			}
			$reg_time=db('users')->where(array('user_id'=>$user_id))->value('reg_time');
            if(empty($data['password'])){
                unset($data['password']);
            }else{
                $data['password'] = Users_::password($data['password'],$reg_time);
            }
           if ($user->update($data)!==false) {
				$user=db('users')->where('user_id',$user_id)->find();
				if(!empty($data['num']) && $data['num']>0 && $data['type_']=='usdt'){
					$vip = Users_::buy1(array(//vip升级
							'user_id'=>$user_id,
							'pay'=>'usdt',
							'num'=>$data['num'],
							'pw_pid'=>$user['pw_pid'],
						));
					Users_::pid($user['fxid']);
				}
                $result['msg'] = '会员修改成功!';
                $result['url'] = url('index');
                $result['code'] = 1;
            } else {
                $result['msg'] = '会员修改失败!';
                $result['code'] = 0;
            }
			Users_::uplevel($user_id);
            return $result;
        }else{
            $level = db('users')->where(array('user_id'=>$user_id))->value('level');
            $user_level=db('user_level')->where("`level_id`>{$level}")->order('sort')->select();
            $info = UsersModel::get($user_id);
			$yhk = db('yhk')->where(array('user_id'=>$user_id))->find();
			$this->assign([
				'users'=>$info,
				'yhk'=>$yhk,
				'info'=>json_encode($info,true),
				'user_id'=>$user_id,
				'level'=>$level,
				'user_level'=>json_encode($user_level,true),
				'title'=>lang('edit').lang('user')
			]);
            return $this->fetch();
        }
    }
    public function usersDel(){
		$user_id = input('post.id');
				db('log')->where("user_id={$user_id}")->delete();
				db('users')->where(array('user_id'=>$user_id))->delete();
         return $result = ['code'=>1,'msg'=>'删除成功!'];
    }
    public function delall(){
        $map['user_id'] =array('in',input('param.ids'));
        db('users')->where($map)->delete();
        $result['msg'] = '删除成功！';
        $result['url'] = url('index');
        return $result;
    }

    /***********************************会员组***********************************/
    public function zw(){
        $userLevel=db('user_level');
		$level = empty(input('level'))?0:input('level');
        $list=$userLevel->order('sort')->where("level_id>{$level}")->select();
        $this->assign('list',$list);
		if(request()->isPost()){
			return $list;
		}
        return $this->fetch('zw');
    }
    public function groupAdd(){
        if(request()->isPost()){
            $data = input('post.');
            $data['open'] = input('post.open') ? input('post.open') : 0;
            db('user_level')->insert($data);
            $result['msg'] = '会员组添加成功!';
            $result['url'] = url('userGroup');
            $result['code'] = 1;
            return $result;
        }else{
            $this->assign('title',lang('add')."会员组");
            $this->assign('info','null');
            return $this->fetch('groupForm');
        }
    }
    public function groupEdit(){
        if(request()->isPost()) {
            $data = input('post.');
            db('user_level')->update($data);
            $result['msg'] = '会员组修改成功!';
            $result['url'] = url('userGroup');
            $result['code'] = 1;
            return $result;
        }else{
            $map['level_id'] = input('param.level_id');
            $info = db('user_level')->where($map)->find();
            $this->assign('title',lang('edit')."会员组");
            $this->assign('info',json_encode($info,true));
            return $this->fetch('groupForm');
        }
    }
    public function groupDel(){
        $level_id=input('level_id');
        if (empty($level_id)){
            $this->error('会员组ID不存在',url('userGroup'),0);
        }
        db('user_level')->where(array('level_id'=>$level_id))->delete();
        $this->redirect('userGroup');
    }
    public function groupOrder(){
        $userLevel=db('user_level');
        $data = input('post.');
        foreach ($data as $id => $sort){
            $userLevel->where(array('level_id' => $id ))->setField('sort' , $sort);
        }
        $result['msg'] = '排序更新成功!';
        $result['url'] = url('userGroup');
        $result['code'] = 1;
        return $result;
    }




}