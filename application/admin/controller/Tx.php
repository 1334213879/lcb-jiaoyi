<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
class Tx extends Common
{
    public function _initialize(){
        parent::_initialize();
    }
    public function editState(){
        $id=input('post.id');
        $v=input('post.v');
        $open=db('tx')->where(array('id'=>$id))->field('status,sj,sxf,jf,money,userid,username')->find();//判断当前状态情况
        if($v==2){
            $data['status'] = 2;
            $data['updatetime'] = time();
            $r = db('tx')->where(array('id'=>$id))->setField($data);
            /* db('users')->where('user_id', $open['userid'])->setDec('account', $open['money']); */
            if($r){
			   db('users')->where('user_id', $open['userid'])->setInc('money', $open['money']);
               $data1['status'] = -3;
               $r = db('xx')->where(array('czid'=>$id))->setField($data1);
               $result['status'] = 1;
               $result['info'] = '审核不通过';
            }
        }else{
            $data['status'] = 1;
            $data['updatetime'] = time();
            $r = db('tx')->where(array('id'=>$id))->setField($data);
            if($r){
                $data1['status'] = -4;
				$r = db('xx')->where(array('czid'=>$id))->setField($data1);
				db('users')->where('user_id', $open['userid'])->setInc('jf', floor($open['jf']));
		$mapjf['rq']=date("Y-m-d",time());
		$mapjf['userid']=$open['userid'];
		$mapjf['createtime']=time();
		$mapjf['name']=$open['username'];
		$mapjf['status']=7;
		$mapjf['money']=floor($open['jf']);
		$mapjf['zw']=1;
		$mapjf['note']='获得'.floor($open['jf']).'金积分';
			db('xx')->insert($mapjf);
                $result['status'] = 1;
                $result['info'] = '审核通过';
            }
        }
        return $result;
    }
    public function del(){
        db('tx')->where(array('id'=>input('id')))->delete();
        $this->redirect('check');
    }
    public function check(){
        if(request()->isPost()){
            $key=input('post.key');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
            $map['title|username']=array('like',"%".$key."%");
            $map['status']=0;
           /*  $map["checktime"]=array("lt",time()); */
            $list=db('tx')
                ->where($map)
                ->order('id desc')
                ->paginate(array('list_rows'=>$pageSize,'page'=>$page))
                ->toArray();
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
        }
        return $this->fetch();
    }
    public function check1(){
        if(request()->isPost()){
            $key=input('post.key');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
            $map['title|username']=array('like',"%".$key."%");
            $map['status']=1;
            /* $map["checktime"]=array("gt",time()); */
            $list=db('tx')
                ->where($map)
                ->order('id desc')
                ->paginate(array('list_rows'=>$pageSize,'page'=>$page))
                ->toArray();
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
        }
        return $this->fetch();
    }
    public function check2(){
        if(request()->isPost()){
            $key=input('post.key');
            $page =input('pageIndex');
            $pageSize =input('pageSize');
            $map['title|username']=array('like',"%".$key."%");
            $map['status']=array("gt",0);
            $list=db('tx')
                ->where($map)
                ->order('id desc')
                ->paginate(array('list_rows'=>$pageSize,'page'=>$page))
                ->toArray();
            return $result = ['code'=>0,'msg'=>'获取成功!','list'=>$list['data'],'count'=>$list['total'],'rel'=>1];
        }
        return $this->fetch();
    }

}