<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
class Jl extends Common
{
    public function _initialize(){
        parent::_initialize();
    }
    //列表
    public function index(){
        $key=input('post.key');
        $this->assign('testkey',$key);
        $list=Db::table(config('database.prefix').'zw')
            ->where('title','like',"%".$key."%")
            ->order('listorder')
            ->select();
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function add(){
        if(request()->isPost()) {
            //构建数组
            $data = input('post.');
            $data['createtime'] = time();
            db('zw')->insert($data);
            $result['code'] = 1;
            $result['msg'] = '添加成功!';
            $result['url'] = url('index');
            return $result;
        }else{
            $this->assign('title',lang('add').'产品');
            $this->assign('info','null');
            return $this->fetch('form');
        }
    }
    public function edit(){
        if(request()->isPost()) {
            $data = input('post.');
            db('zw')->update($data);
            $result['code'] = 1;
            $result['msg'] = '修改成功!';
            $result['url'] = url('index');
            return $result;
        }else{
            $ad_id=input('ad_id');
            $adInfo=db('zw')->where(array('id'=>$ad_id))->find();
            $this->assign('info',json_encode($adInfo,true));
            $this->assign('title',lang('edit').'产品');
            return $this->fetch('form');
        }
    }
    public function editState(){
        $id=input('post.id');
        $open=db('my_buy')->where(array('id'=>$id))->field('status,money,userid')->find();//判断当前状态情况
        if($open['status']==1){
            $data['status'] = 0;
            $data['updatetime'] = time();
            $r = db('my_buy')->where(array('id'=>$id))->setField($data);
            db('users')->where('user_id', $open['userid'])->setDec('money', $open['money']);
            if($r){
              // $m['pid']=$id;
              // db('restoration_log')->where($m)->delete();
               $info = db('users')->field('pid,nickname,all_pid')->find($open['userid']);
               $fund = db('fund_log')->where(array('uid'=>$info['pid'],'pid'=>$id))->field('money')->find();
                if ($fund['money']) {
                           db('users')->where('user_id', $info['pid'])->setDec('money', $fund['money']);
                           $m['uid']=$info['pid'];
                           $m['money']=$fund['money'];
                           $m['note']='下级投资审核未通过，推荐奖励退还，用户：'.$info['nickname'];
                           $m['type']=1;
                           $m['tid']=1;
                           $m['addtime']=time();
                           $m['pid']=$id;
                           $m['act']='-';
                           db('fund_log')->insert($m);
                                          //退还上级获得50%收益
                           $all_pid = str_replace("|".$info['pid'].'|',"|",$info['all_pid']);
                           $arr = array_filter(explode("|",$all_pid));
                           if (count($arr)) {
                               $m_1['act']='-';
                               $m_1['type']=7;
                               $m_1['pid']=$id;
                               $m_1['addtime']=time();
                               $m_1['note']='投资审核未通过，退还下级收益的50%';
                                foreach ($arr as $key => $value) {
                                     $mm=round($fund['money']/pow(2,$key),2);
                                     if ($mm < 15) {
                                       break;
                                     }
                                     db('users')->where('user_id', $value)->setDec('money', $mm);
                                     $m_1['uid']=$value;
                                     $m_1['money']=$mm;
                                     db('fund_log')->insert($m_1);
                                }
                           }
                           //团队奖退还
                           return_m($id);
                 }
               $result['status'] = 1;
               $result['info'] = '审核不通过';
            }
        }else{
            $data['status'] = 1;
            $data['updatetime'] = time();
            $data['re_time'] = time()+3600*24*7;
            $data['re_money'] = round(($open['money']*3)/104,2);
            $r = db('my_buy')->where(array('id'=>$id))->setField($data);
            if($r){
               /* $money = $open['money']*3;
                $s=3600*24*7;
                $inser_in='';
                $w['money']=$money/104;
                $w['pid']=$id;
                $w['userid']=$open['userid'];
                for ($i=1; $i < 105; $i++) { 
                     $w['re_time']=time()+$s*$i;
                     db('restoration_log')->insert($w);
                     $rid = db('restoration_log')->getLastInsID();
                     $inser_in.=$rid.',';
                }*/
               // if (count(array_filter(explode(",", $inser_in)))==104) {
                  // return array('code'=>1,'msg'=>'投资成功');
                       $sys=db('system')->field('yongjin,yongjin1')->find(1);
                       $info = db('users')->field('pid,nickname,all_pid,level,account')->find($open['userid']);
                       if ($info['pid']) {
                         $p_info = db('users')->field('account,level,pid')->find($info['pid']);
                        //上级获得推荐奖
                           $m1=round($open['money']*($sys['yongjin']/100),2);
                           db('users')->where('user_id', $info['pid'])->setInc('money', $m1);
                           $m['uid']=$info['pid'];
                           $m['money']=$m1;
                           $m['note']='下级投资推荐奖励，用户：'.$info['nickname'];
                           $m['type']=1;
                           $m['tid']=1;
                           $m['addtime']=time();
                           $m['pid']=$id;
                           $m['act']='+';
                           db('fund_log')->insert($m);
                           //上级获得50%收益
                           $all_pid = str_replace("|".$info['pid'].'|',"|",$info['all_pid']);
                           $arr = array_filter(explode("|",$all_pid));
                           if (count($arr)) {
                               $m_1['act']='+';
                               $m_1['type']=7;
                               $m_1['pid']=$id;
                               $m_1['addtime']=time();
                               $m_1['note']='获得下级收益的50%';
                                foreach ($arr as $key => $value) {
                                     $mm=round($m1/pow(2,$key),2);
                                     if ($mm < 15) {
                                       break;
                                     }
                                     db('users')->where('user_id', $value)->setInc('money', $mm);
                                     $m_1['uid']=$value;
                                     $m_1['money']=$mm;
                                     db('fund_log')->insert($m_1);
                                }
                           }
                           //团队奖
                           re_team($info['level'],$p_info['level'],$info['pid'],$open['money'],$info['nickname'],$id);
                       }
                       //增加投资总额
                       db('users')->where('user_id', $open['userid'])->setInc('money', $open['money']);
                       //判断级别
                       isteam($open['userid'],$info['account'],$info['level']);
                       if ($info['pid']) {
                          isteam($info['pid'],$p_info['account'],$p_info['level']);
                          if ($p_info['pid']) {
                             $p_info1 = db('users')->field('account,level')->find($p_info['pid']);
                             isteam($p_info['pid'],$p_info1['account'],$p_info1['level']);
                          }
                       }
                       $result['status'] = 1;
                       $result['info'] = '审核通过';
              /*  }else{
                     $data['status'] = 0;
                     $data['updatetime'] = time();
                     db('my_buy')->where(array('id'=>$id))->setField($data);
                     $m['pid']=$id;
                     db('restoration_log')->where($m)->delete();
                     $result['status'] = 1;
                     $result['info'] = '审核失败';
                }*/
            }
        }
        return $result;
    }
    public function adOrder(){
        $ad=db('zw');
        foreach (input('post.') as $id => $sort){
            $ad->where(array('id' => $id ))->setField('listorder' , $sort);
        }
        $result['code'] = 1;
        $result['msg'] = '排序更新成功';
        $result['url'] = url('index');
        return $result;
    }    
    public function pf(){
      //检查是否董事
            $map1['level']=9;
            $map1['is_ds']=0;
            $allid2=db('users')->where($map1)->field('user_id,account')->select();
            foreach ($allid2 as $key => $value) {
                      $allid1=db('users')->where('pid',$value['user_id'])->field('user_id,account')->select();
                      foreach ($allid1 as $key1 => $value1) {
                          $ac = db('users')->where('all_pid','like','%|'.$value1['user_id'].'|%')->sum('account');
                          $ac =$ac+$value['account'];
                          if ($ac >= 10000000) {
                             db('users')->where(array('user_id'=>$value['user_id']))->setField(array('is_ds'=>1));
                          }
                      }
            }
        if(request()->isPost()) {
            $datas = input('post.');
            if (!is_numeric($datas['k'])) {
              return json(array('code' => 0, 'msg' =>'填写数字！'));
            }
            if (!intval($datas['is_p'])) {
              return json(array('code' => 0, 'msg' =>'选择哪部电影！'));
            }
            $sys=db('system')->field('pf')->find(1);

            $list = db('users')->where("is_ds=1 and `is_p` NOT LIKE ',".$datas['is_p'].",'")->field('user_id,is_p')->select();
            if (empty($list)) {
              return json(array('code' => 0, 'msg' =>'还没有董事！'));
            }
            $in='';
            foreach ($list as $key => $value) {
              $in.=$value['user_id'].',';
            }
            $m=round($datas['k']*($sys['pf']/100)/count($list),2);
            //return json(array('code' => 0, 'msg' =>'还没有董事！'.$m));
            $map['user_id']=array('in',substr($in,0,-1));
            $r = db('users')->where($map)->setInc('money', $m);
            if($r) {
                               $m_1['act']='+';
                               $m_1['type']=9;
                               $m_1['addtime']=time();
                               $m_1['note']='票房奖励';
                               $m_1['money']=$m;
                                foreach ($list as $key => $value) {
                                     db('users')->where(array('user_id'=>$value['user_id']))->setField(array('is_p'=>$value['is_p'].intval($datas['is_p']).','));
                                     $m_1['uid']=$value['user_id'];
                                     db('fund_log')->insert($m_1);
                                }
                return json(['code' => 1, 'msg' => '奖励成功!', 'url' => url('goods/pf')]);
            } else {
                db('users')->where($map)->setDec('money', $m);
                return json(array('code' => 0, 'msg' =>'奖励失败！'));
          }
        }else{
            $list = db('users')->where('is_ds',1)->field('nickname,mobile')->select();
             $this->assign('list',$list);
            return $this->fetch();
        }
    }
    public function del(){
        db('my_buy')->where(array('id'=>input('id')))->delete();
        $this->redirect('check');
    }
    public function tj(){
        $buy = db('my_buy')->where(array('status'=>1))->sum('money');
        $tx = db('fund_log')->where(array('type'=>8,'tid'=>1))->sum('money');
        $map['a.type']=array("in",'1,2,3,4,5,7,9,10');
        $map['a.act']='+';
        $zsy = db('fund_log')                 
                 ->alias('a')
                 ->join('clt_users w','a.uid = w.user_id','LEFT')
                 ->where($map)
                 ->sum('a.money');
        $this->assign('buy',$buy);
        $this->assign('tx',$tx);
        $this->assign('bfb',round($tx/$buy,2));
        $this->assign('zsy',$zsy);
        return $this->fetch();
    }
    public function check(){
        if(request()->isPost()){
            $key=input('post.key');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
            $map['w.mobile|w.nickname']=array('like',"%".$key."%");
            $map['a.status']=1;
            $list=db('my_buy')
                 ->alias('a')
                 ->join('clt_users w','a.userid = w.user_id','LEFT')
                 ->where($map)
                 ->field('a.*,w.nickname,w.mobile')
                 ->order('a.id desc')
                 ->paginate(array('list_rows'=>$pageSize,'page'=>$page))
                 ->toArray();
                //foreach ($list['data'] as $key => $value) {
                  //$list['data'][$key]['week']=getweek($value['id']);
                //}
               // echo db('my_buy')->getLastSql();
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
        }
        return $this->fetch();
    }
    public function check1(){
        if(request()->isPost()){
            $key=input('post.key');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
            $map['w.mobile|w.nickname']=array('like',"%".$key."%");
            $map['a.status']=0;
            $list=db('my_buy')
                 ->alias('a')
                 ->join('clt_users w','a.userid = w.user_id','LEFT')
                 ->where($map)
                 ->field('a.*,w.nickname,w.mobile')
                 ->order('a.id desc')
                ->paginate(array('list_rows'=>$pageSize,'page'=>$page))
                ->toArray();
               // foreach ($list['data'] as $key => $value) {
                 // $list['data'][$key]['week']=getweek($value['id']);
                //}
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
        }
        return $this->fetch();
    }
    public function jsb(){
        if(request()->isPost()){
            $key=input('post.key');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
            $list=db('jsb')
                ->where('username','like',"%".$key."%")
                ->order('id desc')
                ->paginate(array('list_rows'=>$pageSize,'page'=>$page))
                ->toArray();
                foreach ($list['data'] as $key => $value) {
                  $list[$key]['day']=1;
                }
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
        }
        return $this->fetch();
    }
}