<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:84:"C:\Users\Administrator\Desktop\tpbt\public/../application/user\view\login\index.html";i:1557883518;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo $title; ?></title>
	<script src="/static/home/js/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="/static/home/js/jquery.min.js"></script>
	<script src="/static/user/layui/layui.js?v=1.02"></script>
	<link rel="stylesheet" href="/static/user/layui/css/layui.css?v=1.02">
    <link rel="stylesheet" href="/static/xmt/css/pages/loginpage.css?v=1.02">
</head>
<body class="login_bg">
<div class="smz_x"> 
	<img style="width:25px;height:25px;" src="/static/home/btb/fh.png?v=1.02"/ onclick="parent.location.href='<?php echo url('user/index/index'); ?>'">
</div>
	<div class="reg">
		<h2><?php echo lang('登录'); ?></h2>
			<div class="mobile">
				<i><img src="/static/xmt/images/mobile.png?v=1.02" alt=""></i>
				<input id="mobile" type="text" placeholder="<?php echo lang('请输入您的手机号码'); ?>" maxlength='11' value="<?php echo $mobile; ?>" />
			</div>
			<div class="lock">
				<i><img src="/static/xmt/images/lock.png?v=1.02" alt=""></i>
				<input id="mm" name="mm" type="password" placeholder="<?php echo lang('请输入您的密码'); ?>" maxlength='12' value="<?php echo $pw; ?>" />
			</div>

		<div class="help">
			<input type="checkbox" name="remember_pw" <?php if((!empty($pw))): ?>checked="checked"<?php endif; ?>><span><?php echo lang('记住密码'); ?></span>
		</div>
		<div class="sub" onclick="kq()" style="border:none"><?php echo lang('登录'); ?></div>
	</div>
	
	<div class="sub_p">
		<span onclick="location.href ='<?php echo url('user/login/zc'); ?>';" class="regis"><?php echo lang('注册'); ?></span>
		<span onclick="location.href ='<?php echo url('user/login/forget'); ?>';" class="forget"><?php echo lang('忘记密码'); ?></span>
	</div>
	<div class="switch">
		<span><?php echo lang('切换语言版本'); ?></span><br>
	</div>
	<div class="cn">
		<a class ="lang_btn" lang ="cn" ><img src="/static/xmt/images/cn.png?v=1.02" alt=""></a>
		<a class ="lang_btn" lang ="en" ><img src="/static/xmt/images/en.png?v=1.02" alt=""></a>
	</div>
<script type="text/javascript"> 
 $(function(){
	$('#dhl',window.parent.document).hide();
	//parent.location.href="<?php echo url('user/login/index'); ?>";
	 $('.lang_btn').click(function(){
		 var data={'lang':$(this).attr('lang')}
		 $.get("<?php echo url('user/index/lang'); ?>",data,function(){
			 location.reload();
		 })
	 })
 })
function kq(){
	if($("#mobile").val()==""){
		layer.msg("<?php echo lang('请填写帐号'); ?>");return false;
	}
	if($("#mm").val()==""){
		layer.msg("<?php echo lang('请填写密码'); ?>");return false;
	}else{
			$.post("<?php echo url('index'); ?>",
			{mobile:$("#mobile").val(),password:$("#mm").val(),remember_pw:$('input:checkbox[name="remember_pw"]:checked').val()},function(res){
				if(res.code > 0){
					layer.msg(res.msg,{time:1800},function(){
                    parent.location.href = "<?php echo url('index'); ?>";
                    });
					}else{
					layer.msg(res.msg,{time:1800});
				}
			});
	}
}
function callParent(){
            parent.window.document.getElementById("dhl").hide();
        }
</script> 
<!-- 倒计时 -->
<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form(),layer = layui.layer;
        // 登录提交监听
        form.on('submit(sub)', function (data) {
            // 提交到方法 默认为本身
            $.post("<?php echo url('reg'); ?>",data.field,function(res){
                if(res.code > 0){
                    layer.msg(res.msg,{time:1800},function(){
                       location.href = "<?php echo url('../home/index/sy'); ?>";
                    });
                }else{
                    layer.msg(res.msg,{time:1800});
                }
            });
        })
    })
</script>
</body>
</html>