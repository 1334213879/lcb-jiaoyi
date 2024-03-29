<?php
namespace app\admin\controller;
use think\Db;
use think\Request;
use think\Controller;
class Yy extends Common
{
    public function _initialize(){
        parent::_initialize();
    }
    //应用列表
    public function index(){
        $key=input('post.key');
        $this->assign('testkey',$key);
        $list=Db::table(config('database.prefix').'yy')->alias('a')
            ->join(config('database.prefix').'ad_type at','a.type_id = at.type_id','left')
            ->field('a.*,at.name as typename')
            ->where('a.name','like',"%".$key."%")
            ->order('a.sort')
            ->select();
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function add(){
        if(request()->isPost()) {
            //构建数组
            $data = input('post.');
            $data['addtime'] = time();
            db('yy')->insert($data);
            $result['code'] = 1;
            $result['msg'] = '应用添加成功!';
            $result['url'] = url('index');
            return $result;
        }else{
            $adtypeList=db('ad_type')->order('sort')->select();//获取所有应用位
            $this->assign('adtypeList',json_encode($adtypeList,true));
            $this->assign('title',lang('add').lang('yy'));
            $this->assign('info','null');
            return $this->fetch('form');
        }
    }
    public function edit(){
        if(request()->isPost()) {
            $data = input('post.');
            db('yy')->update($data);
            $result['code'] = 1;
            $result['msg'] = '应用修改成功!';
            $result['url'] = url('index');
            return $result;
        }else{
            $adtypeList=db('ad_type')->select();
            $ad_id=input('ad_id');
            $adInfo=db('yy')->where(array('ad_id'=>$ad_id))->find();
            $this->assign('adtypeList',json_encode($adtypeList,true));
            $this->assign('info',json_encode($adInfo,true));
            $this->assign('title',lang('edit').lang('yy'));
            return $this->fetch('form');
        }
    }
    public function editState(){
        $id=input('post.id');
        $open=db('yy')->where(array('ad_id'=>$id))->value('open');//判断当前状态情况
        if($open==1){
            $data['open'] = 0;
            db('yy')->where(array('ad_id'=>$id))->setField($data);
            $result['status'] = 1;
            $result['info'] = '状态禁止';
        }else{
            $data['open'] = 1;
            db('yy')->where(array('ad_id'=>$id))->setField($data);
            $result['status'] = 1;
            $result['info'] = '状态开启';
        }
        return $result;
    }
    public function adOrder(){
        $ad=db('yy');
        foreach (input('post.') as $id => $sort){
            $ad->where(array('ad_id' => $id ))->setField('sort' , $sort);
        }
        $result['code'] = 1;
        $result['msg'] = '应用排序更新成功';
        $result['url'] = url('index');
        return $result;
    }
    public function del(){
        db('yy')->where(array('ad_id'=>input('ad_id')))->delete();
        $this->redirect('index');
    }

    //位置
    public function type(){
        $key=input('key');
        $this->assign('testkey',$key);
        $list=db('ad_type')->where('name','like',"%".$key."%")->order('sort')->select();
        $this->assign('list',$list);
        return $this->fetch();
    }
    public function typeOrder(){
        $ad_type=db('ad_type');
        foreach (input('post.') as $id => $sort){
            $ad_type->where(array('type_id' => $id ))->setField('sort',$sort);
        }
        $result['code'] = 1;
        $result['msg'] = '应用位排序更新成功!';
        $result['url'] = url('type');
        return $result;
    }
    public function addType(){
        if(request()->isPost()) {
            db('ad_type')->insert(input('post.'));
            $result['code'] = 1;
            $result['msg'] = '应用位保存成功!';
            $result['url'] = url('type');
            return $result;
        }else{
            $this->assign('title',lang('add').lang('yy').'位');
            $this->assign('info','null');
            return $this->fetch('typeForm');
        }
    }
    public function editType(){
        if(request()->isPost()) {
            db('ad_type')->update(input('post.'));
            $result['code'] = 1;
            $result['msg'] = '应用位修改成功!';
            $result['url'] = url('type');
            return $result;
        }else{
            $type_id=input('param.type_id');
            $info=db('ad_type')->where('type_id',$type_id)->find();
            $this->assign('title',lang('edit').lang('yy').'位');
            $this->assign('info',json_encode($info,true));
            return $this->fetch('typeForm');
        }
    }
    public function delType(){
        $map['type_id'] = input('param.type_id');
        db('ad_type')->where($map)->delete();//删除应用位
        db('yy')->where($map)->delete();//删除该应用位所有应用
        $this->redirect('type');
    }
}