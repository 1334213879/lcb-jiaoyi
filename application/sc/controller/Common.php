<?php
namespace app\sc\controller;
use think\Input;
use think\Controller;
class Common extends Controller{
    public function _initialize(){

    }
    public function _empty(){
        return $this->error('空操作，返回上次访问页面中...');
    }
}