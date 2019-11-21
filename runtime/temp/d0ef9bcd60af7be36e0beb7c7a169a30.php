<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:87:"C:\Users\Administrator\Desktop\tpbt\public/../application/admin\view\auth\ruleEdit.html";i:1552012172;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainHead.html";i:1573868955;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainFoot.html";i:1573868942;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Paging</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/static/admin/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/static/admin/css/global.css" media="all">
    <link rel="stylesheet" href="/static/admin/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/admin/css/style.css">
    <link rel="stylesheet" href="/static/admin/css/animate.css" />
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
</head>
<body>
<div style="margin: 15px;" ng-app="hd" ng-controller="ctrl" class="fadeInUp animated">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>编辑权限</legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        1、《控/方》：意思是 控制器/方法; 例如 Sys/sysList<br/>
        2、图标名称为左侧导航栏目的图标样式，具体可查看<a href="http://fontawesome.io/icons/" target="_blank">FontAwesome</a>图标CSS样式
    </blockquote>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">权限名称</label>
            <div class="layui-input-4">
                <input type="text" name="title" ng-model="field.title" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>权限名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">控制器/方法</label>
            <div class="layui-input-4">
                <input type="text" name="href" ng-model="field.href" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>控制器/方法" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标名称</label>
            <div class="layui-input-4">
                <input type="text" name="icon" ng-model="field.icon" placeholder="<?php echo lang('pleaseEnter'); ?>图标名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">菜单状态</label>
            <div class="layui-input-block">
                <input type="radio" name="menustatus" ng-model="field.menustatus" ng-checked="field.menustatus==1" ng-value="1" title="开启">
                <input type="radio" name="menustatus" ng-model="field.menustatus" ng-checked="field.menustatus==0" ng-value="0" title="关闭">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">排序</label>
            <div class="layui-input-2">
                <input type="text" name="sort" ng-model="field.sort" placeholder="<?php echo lang('pleaseEnter'); ?>排序编号" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="auth">立即提交</button>
                <a href="<?php echo url('adminRule'); ?>" class="layui-btn layui-btn-primary">返回</a>
            </div>
        </div>
    </form>
</div>
<!-- <script type="text/javascript" src="/static/admin/plugins/layui/layui.js"></script> -->
<script src="/static/js/jquery.2.1.1.min.js"></script>

<script src="/static/js/angular.min.js"></script>
<script>
    var m = angular.module('hd',[]);
    m.controller('ctrl',['$scope',function($scope){
        $scope.field = <?php echo $rule; ?>;
        layui.use(['form', 'layer'], function () {
            var form = layui.form,layer = layui.layer;
            form.on('submit(auth)', function (data) {
                // 提交到方法 默认为本身
                data.field.id =  $scope.field.id;
                $.post("<?php echo url('ruleEdit'); ?>",data.field,function(res){
                    if(res.code > 0){
                        layer.msg(res.msg,{time:1800},function(){
                            location.href = res.url;
                        });
                    }else{
                        layer.msg(res.msg,{time:1800});
                    }
                });
            })
        })
    }]);
</script>