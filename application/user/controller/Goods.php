<?php
namespace app\user\controller;
use think\Input;
use think\Cookie;
class Goods extends Common{
    public function _initialize(){
      parent::_initialize();
    }
    public function index(){
		if (!session('user.user_id')) {
            $this->redirect('login/index');
        }
        if(request()->isPost()){
            $data = input('post.');
            $user = db('users');
            $oldEmail = $user->where(['user_id'=>$data['user_id']])->value('email');
            if($oldEmail != $data['eamil']){
                $data['email_validated'] = 0;
            }
            if (db('users')->update($data)!==false) {
                $result['msg'] = '编辑资料成功!';
                $result['status'] = 1;
            } else {
                $result['msg'] = '编辑资料失败!';
                $result['status'] = 0;
            }
            return $result;
        }else{
            $province = db('Region')->where ( array('pid'=>1) )->select ();
            $this->assign('province',$province);
            $city = db('Region')->where ( array('pid'=>$this->userInfo['province']) )->select ();
            $this->assign('city',$city);
            $district = db('Region')->where ( array('pid'=>$this->userInfo['city']) )->select ();
            $this->assign('district',$district);
            $this->assign('title','基本设置');
            return $this->fetch();
        }
    }
    public function getRegion(){
        $Region=db("region");
        $map['pid'] = input("pid");
        $list=$Region->where($map)->select();
        return $list;
    }
    public function buy(){
		if (!session('user.user_id')) {
            $this->redirect('login/index');
        }
        if(request()->isPost()){
                $money = input('post.money')*3;
                $pid = input('post.id');
                $s=3600*24*7;
                $inser_in='';
                $w['money']=$money/103;
                $w['pid']=$pid;
                $w['userid']=session('user.user_id');
                for ($i=1; $i < 104; $i++) { 
                     $w['re_time']=time()+$s*$i;
                     $result = db('restoration_log')->insert($w);
                     $rid = db('restoration_log')->getLastInsID();
                     $inser_in.=$rid.',';
                }
                if (count(array_filter(explode(",", $inser_in)))==103) {
                   return array('code'=>1,'msg'=>'投资成功');
                }else{
                    $m['id']=array("in",substr($inser_in, 0, -1));
                    db('restoration_log')->where($m)->delete();
                    return array('code'=>0,'msg'=>'投资失败');
                }
                
        }else{
            //cookie('name1', 'value11', 60);
            echo cookie('name1');

         $list = db('goods')->where ( array('status'=>1) )->select ();
         $this->assign('list',$list);
         return $this->fetch();
        }
    }
    public function add(){
		if (!session('user.user_id')) {
            $this->redirect('login/index');
        }
        $data = input('post.');
        $data['createtime']=time();
        $data['userid']=session('user.user_id');
        $result = db('my_buy')->insert($data);
        if ($result) {
            return array('code'=>1,'msg'=>'提交成功，等待管理员审核');
        }else
           return array('code'=>0,'msg'=>'提交失败');
    }
    /*
    public function aa(){
        session_start(); 
        print_r($_COOKIE);
        echo cookie('name1');
    }*/
    /**
     * 修改密码
     * @param $old_password  旧密码
     * @param $new_password  新密码
     * @param $confirm_password 确认新 密码
     */
    public function repass(){
		if (!session('user.user_id')) {
            $this->redirect('login/index');
        }
        $old_password  = input('post.nowpass');
        $new_password = input('post.pass');
        $confirm_password = input('post.repass');

        if(strlen($new_password) < 6)
            return array('status'=>0,'msg'=>'密码不能低于6位字符');
        if($new_password != $confirm_password)
            return array('status'=>0,'msg'=>'两次密码输入不一致');
        //验证原密码
        if(($this->userInfo['password'] != '' && Users::password($old_password) != $this->userInfo['password']))
            return array('status'=>0,'msg'=>'密码验证失败');
        if(db('users')->where("user_id", session('user.user_id'))->update(array('password'=>Users::password($new_password)))!==false){

            return array('status'=>1,'msg'=>'修改成功','action'=>url('index'));
        }else{
            return array('status'=>0,'msg'=>'修改失败');
        }
    }
}