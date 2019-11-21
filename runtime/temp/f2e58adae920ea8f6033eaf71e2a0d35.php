<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:90:"C:\Users\Administrator\Desktop\lcb-jiaoyi\public/../application/user\view\index\index.html";i:1574317250;}*/ ?>
<html style="background-color:#ffffff;">
<head>
    <meta charset="utf-8">
    <title>NMCT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
    <meta name="description" content="<?php echo $title; ?>">
    <link rel="stylesheet" href="/static/admin/plugins/layui/css/layui.css?v=1.02">
	<script src="/static/home/js/jquery.min.js"></script>
	<style>
    .hb>tr>th{
    	background:#33344c;color:#ffffff;font-weight:600;
    }
    .fui-navbar .nav-item{
        line-height: 1!important;
        padding-top: .2rem;
    }
    .fui-navbar .nav-item .label{
        padding-top: .2rem;
    }
    .nav-item.active{
        color: #1296db!important;
    }
    .fui-navbar .nav-item .icon{
        width: 1.2rem;
        height: 1.2rem;
        display: inline-block;
        background-size: 100% 100%;
    }
    .active span.label{
        color: #1296db;
    }
    span.label{
        color: #9a9a9a;
    }
    .icon-home{
        background: url('/static/xmt/images/home.png');    
    }
    .active .icon-home{
         background: url('/static/xmt/images/home-1.png');
    }
    .icon-exchange{
        background: url('/static/xmt/images/exchange.png');
    }
    .active .icon-exchange{
         background: url('/static/xmt/images/exchange-1.png');
    }
    .icon-mall{
        background: url('/static/xmt/images/mall.png');
    }
    .active .icon-mall{
         background: url('/static/xmt/images/mall-1.png');
    }
    .icon-wallet{
        background: url('/static/xmt/images/wallet.png');
    }
    .active .icon-wallet{
         background: url('/static/xmt/images/wallet-1.png');
    }
    .icon-my{
        background: url('/static/xmt/images/my.png');
    }
    .active .icon-my{
         background: url('/static/xmt/images/my-1.png');
    }
	</style>
</head>
<body>
	<iframe id="iframe" src="<?php echo url('index1'); ?>?v=1.01" width="100%" frameborder="0" allowtransparency="true" marginwidth="0" marginheight="0">
	</iframe>
<!-- footer start here -->
<link rel="stylesheet" href="/static/home/css/foxui.min.css"/>
<div id="dhl" class="fui-navbar" style="background:#fff;width:100%;">
   <a onclick="iframe('<?php echo url('user/index/index1'); ?>','a1')" class="nav-item a1 active" >
        <span class="icon icon-home"></span>
        <span class="label"><?php echo lang("首页"); ?></span>
   </a>
   <a onclick="iframe('http://www.xmtclub.com','a4')"class="nav-item a4">
        <span class="icon icon-mall"></span>
        <span class="label"><?php echo lang("商城"); ?></span>
   </a>
   <a onclick="iframe('<?php echo url('user/index/jy'); ?>?id=49','a2')" class="nav-item a2">
        <span class="icon icon-exchange"></span>
        <span class="label"><?php echo lang("交易"); ?></span>
    </a>    
	<a onclick="iframe('<?php echo url('user/set/bb'); ?>','a3')" class="nav-item a3">
        <span class="icon icon-wallet"></span>
        <span class="label"><?php echo lang("钱包"); ?></span>
    </a>  
	<a onclick="iframe('<?php echo url('user/index/my'); ?>','a5')" class="nav-item a5">
        <span class="icon icon-my"></span>
        <span class="label"><?php echo lang("我的"); ?></span>
    </a>
</div>
<div style="clear:both;"></div>
<script>
    function iframe(id,a){
    $('iframe').attr('src',id + '?v=<?php echo $version;?>');
    $('.nav-item').css('background','');
    $("." +a).addClass('active').siblings().removeClass('active');
}
    $(function innerHeight(){
        var height = window.parent.innerHeight;
        var h = height+'px';
        $('#iframe',window.parent.document).css("height",h);
    })
</script>
</body>
</html>