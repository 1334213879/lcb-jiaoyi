<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:87:"C:\Users\Administrator\Desktop\tpbt\public/../application/admin\view\system\system.html";i:1559651781;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainHead.html";i:1573868955;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainFoot.html";i:1573868942;}*/ ?>
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
<div class="admin-main fadeInUp animated" ng-app="hd" ng-controller="ctrl">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend><?php echo lang('systemSet'); ?></legend>
    </fieldset>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('websiteName'); ?></label>
            <div class="layui-input-4">
                <input type="text" ng-model="field.name" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('websiteName'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">网站首页图</label>
            <div class="layui-input-block">
                <div class="site-demo-upload">
                    <img id="cltLogo" src="/static/admin/images/tong.png">
                    <div class="site-demo-upbar">
                        <input type="file" name="logo" lay-type="images" class="layui-upload-file" id="logo">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('recordNum'); ?></label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.bah" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('recordNum'); ?>" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">Copyright</label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.copyright" placeholder="<?php echo lang('pleaseEnter'); ?>Copyright" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('companyAddress'); ?></label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.ads" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('companyAddress'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('tel'); ?></label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.tel" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('tel'); ?>" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><?php echo lang('email'); ?></label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.email" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('email'); ?>" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">虚拟会员数</label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.number" placeholder="虚拟会员数" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">挂买冻结资产</label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.dj" placeholder="挂买冻结nmct" class="layui-input">(如设置为0.01；挂卖100则冻结1)
            </div>
        </div>
      <div class="layui-form-item">
            <label class="layui-form-label">NMCT单价</label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.money_nmct" placeholder="NMCT单价" class="layui-input">
            </div>
        </div>
      <div class="layui-form-item">
            <label class="layui-form-label">XMT单价</label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.money_xmt" placeholder="XMT单价" class="layui-input">
            </div>
        </div>
		<div class="layui-form-item">
            <label class="layui-form-label">USDT打款地址</label>
            <div class="layui-input-3">
                <input type="text" ng-model="field.usdt_addres" placeholder="USDT打款地址" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="sys"><?php echo lang('submit'); ?></button>
                <button type="reset" class="layui-btn layui-btn-primary"><?php echo lang('reset'); ?></button>
            </div>
        </div>
    </form>
</div>
<script src="/static/js/angular.min.js"></script>
<!-- <script type="text/javascript" src="/static/admin/plugins/layui/layui.js"></script> -->
<script src="/static/js/jquery.2.1.1.min.js"></script>

<script>
    var m = angular.module('hd',[]);
    m.controller('ctrl',['$scope','$http',function($scope,$http){
        $scope.field = <?php echo $system; ?>;
        layui.use(['form', 'layer','upload'], function () {
            var form = layui.form,layer = layui.layer,upload = layui.upload;
            if($scope.field.logo){
                cltLogo.src = "/"+ $scope.field.logo;
            }
             var uploadInst = upload.render({
                elem: '#cltLogo'
                ,url: '<?php echo url("UpFiles/upload"); ?>'
                ,ext: 'jpg|png|gif'
                ,before: function(obj){
                  //预读本地文件示例，不支持ie8
                  obj.preview(function(index, file, result){
                    $('#logo').attr('src', result); //图片链接（base64）
                  });
                }
                ,done: function(res){
                  //如果上传失败
                  if(res.code > 0){
                    cltLogo.src = "/"+res.url;
                    $scope.field.logo = res.url;
                    return layer.msg('上传成功');
                  }
                  //上传成功
                }
                ,error: function(){
                  //演示失败状态，并实现重传
                  var demoText = $('#demoText');
                  demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                  demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                  });
                }
              });
            // 登录提交监听
            form.on('submit(sys)', function () {
                // 提交到方法 默认为本身
                $.post("<?php echo url('system/system'); ?>",$scope.field,function(res){
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