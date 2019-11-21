<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:85:"C:\Users\Administrator\Desktop\tpbt\public/../application/admin\view\users\index.html";i:1557387056;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainHead.html";i:1573868955;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainFoot.html";i:1573868942;}*/ ?>
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
<style>
.red{
	background:#FFB800;
}
#tj>td{
font-size:18px;font-weight:600;text-align:center
}
</style>
<div class="admin-main fadeInUp animated">
    <blockquote class="layui-elem-quote">
        <form  class="layui-form">
            <div class="layui-form-item search-input"  style="margin:0;">
                <div class="layui-input-inline">
                    <input type="text" name="key" id="key" class="layui-input" placeholder="<?php echo lang('pleaseEnter'); ?>关键字！">
                </div>
                <div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <button type="button" class="layui-btn" id="search"><?php echo lang('search'); ?></button>
                    <a href="<?php echo url('index'); ?>" class="layui-btn">显示全部</a>
                </div>
				 <div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('adduser'); ?>" class="layui-btn">添加会员</a>
                </div>
				 
            </div>
        </form>
    </blockquote>
    <fieldset class="layui-elem-field">
	<legend><?php if(!empty($my)): ?><span style="color:red;">(ID:<?php echo $my['user_id']; ?>,昵称:<?php echo $my['nickname']; ?>)的团队成员</span><?php else: ?>页面小计<?php endif; ?></legend>
	<table class="layui-table table-hover">
        				<thead>
					<tr>
						<th>
			<div class="layui-form-mid layui-word-aux" style="padding:0;">
                 <a href="<?php echo url('index'); ?>" class="layui-btn <?php if($type==null): ?>red<?php endif; ?>">全部会员</a>
            </div>
						</th>
						<th>
			<div class="layui-form-mid layui-word-aux" style="padding:0;">
                  <a href="<?php echo url('index'); ?>?type=money_cz" class="layui-btn <?php if($type=='money_cz'): ?>red<?php endif; ?>">充值会员</a>
            </div>
						</th>
						<th>
			<div class="layui-form-mid layui-word-aux" style="padding:0;">
                  <a href="<?php echo url('index'); ?>?type=money_nocz" class="layui-btn <?php if($type=='money_nocz'): ?>red<?php endif; ?>">未充值会员</a>
            </div>
						</th>
						<th>
				<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=2" class="layui-btn <?php if($type==2): ?>red<?php endif; ?>">VIP1</a>
                </div>
						</th>
						<th>
				<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=3" class="layui-btn <?php if($type==3): ?>red<?php endif; ?>">VIP2</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=4" class="layui-btn <?php if($type==4): ?>red<?php endif; ?>">VIP3</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=5" class="layui-btn <?php if($type==5): ?>red<?php endif; ?>">VIP4</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=6" class="layui-btn <?php if($type==6): ?>red<?php endif; ?>">VIP5</a>
                </div>
						</th>
                      <th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?g=1" class="layui-btn <?php if($g==1): ?>red<?php endif; ?>">G</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=money_usdt" class="layui-btn <?php if($type=='money_usdt'): ?>red<?php endif; ?>">USDT</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=zs" class="layui-btn <?php if($type=='zs'): ?>red<?php endif; ?>">赠送</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=xmt" class="layui-btn <?php if($type=='xmt'): ?>red<?php endif; ?>">XMT</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=nmct" class="layui-btn <?php if($type=='nmct'): ?>red<?php endif; ?>">NMCT资产</a>
                </div>
						</th>
						<th>
				<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=nmct_dj" class="layui-btn <?php if($type=='nmct_dj'): ?>red<?php endif; ?>">NMCT通证</a>
                </div>
						</th>
						<th>
						<div class="layui-form-mid layui-word-aux" style="padding:0;">
                    <a href="<?php echo url('index'); ?>?type=gl" class="layui-btn <?php if($type=='gl'): ?>red<?php endif; ?>">合伙人</a>
                </div>
						</th>
					</tr>
					<tr id="tj"></tr>
                </thead>
		</table>
        <div class="layui-field-box table-responsive">
            <table class="layui-table table-hover">
                <thead>
                <tr>
                    <th>赠送</th>
                    <th>编号</th>
					<th>姓名</th>
                    <th>昵称</th>
					<th>推荐人</th>
					<th>状态</th>
					<th>级别</th>
					<th>USDT</th>
					<th>USDT充值总额</th>
					<th>XMT</th>
					<th>NMCT资产</th>
					<th>NMCT通证</th>
                    <th><?php echo lang('tel'); ?></th>
                    <!--<th>认证</th>-->
					<th>冻结</th>
                    <th>创建时间</th>
					<th>登入时间</th>
					<th>IP</th>
                    <th>操作</th>
                </tr>
                </thead>
                <!--内容容器-->
                <tbody id="con">
                </tbody>
                <tfoot>
                <tr>
				<td colspan="2">
				 <button type="button" class="layui-btn layui-btn-small" onclick="window.history.back();"><?php echo lang('back'); ?></button>
				</td>
                    <td colspan="10">
                        <!--分页容器-->
                        <div id="paged" style="text-align: right"></div>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </fieldset>
</div>

<!--模板-->
<script type="text/html" id="conTemp">
    {{# layui.each(d.list, function(index, item){ }}
    <tr>
        <td>{{# if(item.zs==0){ }}
            <a class="red" href="javascript:" onclick="return stateyes('{{ item.user_id }}','1');" title="非赠送">
                <div id="zs{{ item.user_id }}">
                    <button class="layui-btn layui-btn-warm layui-btn-mini">非赠送</button>
                </div>
            </a>
            {{# }else{  }}
            <a class="red" href="javascript:" onclick="return stateyes('{{ item.user_id }}','2');" title="已赠送">
                <div id="zs{{ item.user_id }}">
                    <button class="layui-btn layui-btn-danger layui-btn-mini">赠送</button>
                </div>
            </a>
            {{# } }}
		</td>
        <td>{{ item.user_id }}</td>
		<td>{{ item.xm }}</td>
        <td>{{ item.nickname }}</td>
		<td>
		{{# if(item.fxid>0){ }}
		{{ item.sj_nickname }}<br>ID:{{item.fxid}}
		{{# } }}
		</td>
		<td>
		{{# if(item.pass>0){ }}
			已激活
		 {{# }else{  }}
			未激活
		{{# } }}
		</td>
		<td>V{{ item.level-1 }}
  {{# if(item.g>0){ }}
  		(G{{ item.g }})
  {{# } }}
  </td>
		 <td>{{ item.money_usdt }}</td>
		 <td>{{ item.money_cz }}</td>
		 <td>{{ item.xmt }}</td>
		 <td>{{ item.nmct_dj }}</td>
		 <td>{{ item.nmct }}</td>
        <td>{{ item.mobile }}</td>
		<td>
            {{# if(item.is_lock==0){ }}
            <a class="red" href="javascript:" onclick="return stateyes('{{ item.user_id }}','0');" title="已开启">
                <div id="zt{{ item.user_id }}">
                    <button class="layui-btn layui-btn-warm layui-btn-mini">未冻结</button>
                </div>
            </a>
            {{# }else{  }}
            <a class="red" href="javascript:" onclick="return stateyes('{{ item.user_id }}','0');" title="已禁用">
                <div id="zt{{ item.user_id }}">
                    <button class="layui-btn layui-btn-danger layui-btn-mini">冻结</button>
                </div>
            </a>
            {{# } }}
            {{# if(item.is_red_envelope==0){ }}
            <a class="red" href="javascript:" onclick="return redStatus('{{ item.user_id }}');" title="未冻结">
                <div id="redFrozen{{ item.user_id }}">
                    <button class="layui-btn layui-btn-warm layui-btn-mini">红包未冻结</button>
                </div>
            </a>
            {{# }else{  }}
            <a class="red" href="javascript:" onclick="return redStatus('{{ item.user_id }}');" title="冻结">
                <div id="redFrozen{{ item.user_id }}">
                    <button class="layui-btn layui-btn-danger layui-btn-mini">红包已冻结</button>
                </div>
            </a>
            {{# } }}
		</td>
		<td>{{ getdate(item.reg_time) }}</td>
		<td>{{ getdate(item.last_login) }}</td>
		<td>{{ item.last_ip }}</td>
        <td>
            <a href="<?php echo url('edit'); ?>?user_id={{item.user_id}}" class="layui-btn layui-btn-mini">会员信息</a>
			<a href="<?php echo url('index'); ?>?all_p={{item.user_id}}" class="layui-btn layui-btn-mini">我的团队</a>
			<a href="<?php echo url('list_'); ?>?user_id={{item.user_id}}" class="layui-btn layui-btn-mini">团队交易信息</a>
			<a href="<?php echo url('recharge'); ?>?user_id={{item.user_id}}" class="layui-btn layui-btn-mini">充值</a> 
			<a href="<?php echo url('recharge_log'); ?>?user_id={{item.user_id}}" class="layui-btn layui-btn-mini">资产记录</a>
            <a href="<?php echo url('goods/index'); ?>?user_id={{item.user_id}}" class="layui-btn layui-btn-mini">C2C记录</a>
			<a href="javascript:;" onclick="return del({{item.user_id}})" data-id="1" data-opt="del" class="layui-btn layui-btn-danger layui-btn-mini">删除</a> 
        </td>
    </tr>
    {{# }); }}
</script>
<!-- <script type="text/javascript" src="/static/admin/plugins/layui/layui.js"></script> -->
<script src="/static/js/jquery.2.1.1.min.js"></script>

<script>
    layui.config({
        base: '/static/admin/js/'
    }).use(['paging', 'code','icheck','layer'], function() {
        layui.code();
        var paging = layui.paging(),layer = parent.layer === undefined ? layui.layer : parent.layer;
        paging.init({
            url: "<?php echo url('index'); ?>", //地址
            elem: '#con', //内容容器
            params: {type: "<?php echo $type; ?>",all_p:"<?php echo $all_p; ?>",g:"<?php echo $g; ?>"}, //发送到服务端的参数
            tempElem: '#conTemp', //模块容器
            pageConfig: { //分页参数配置
                elem: 'paged', //分页容器
                pageSize: 15 //分页大小
            },
            success: function(msg) { //渲染成功的回调
                //alert('渲染成功');
				var tj = msg.tj;
				if(tj){
				var level = tj.count-tj.level;
					var html ='\
						<td>'+tj.count+'</td>\
						<td>'+level+'</td>\
						<td>'+tj.level+'</td>\
						<td>'+tj.level1+'</td>\
						<td>'+tj.level2+'</td>\
						<td>'+tj.level3+'</td>\
						<td>'+tj.level4+'</td>\
						<td>'+tj.level5+'</td>\
						<td>'+tj.g+'</td>\
						<td>'+tj.usdt+'</td>\
						<td>'+tj.zs+'</td>\
						<td>'+tj.xmt+'</td>\
						<td>'+tj.nmct_dj+'</td>\
						<td>'+tj.nmct+'</td>\
						<td>'+tj.g+'</td>\
					';
				}
				console.log(tj);
				$('#tj').html(html);
            },
            fail: function(msg) { //获取数据失败的回调
                //alert('获取数据失败')
            },
            complate: function() { //完成的回调
                //alert('处理完成');
            }
        });
        //搜索
        $('#search').on('click', function() {
            var $this = $(this);
            var key = $('#key').val();
            if($.trim(key)=='') {
                layer.msg('<?php echo lang('pleaseEnter'); ?>关键字！');
                return;
            }
            //调用get方法获取数据
            paging.get({
                key: key //获取输入的关键字。
            });
        });
    });
    function stateyes(id,type) {
        $.post('<?php echo url("usersState"); ?>', {id: id,type:type}, function (data) {
            if (data.status) {
				if(type>0){
					 if (type == 1) {
                    var a = '<button class="layui-btn layui-btn-danger layui-btn-mini">赠送</button>'
                    $('#zs' + id).html(a);
                    layer.msg(data.info, {icon: 5});
                    return false;
					} else {
						var b = '<button class="layui-btn layui-btn-warm layui-btn-mini">非赠送</button>'
						$('#zs' + id).html(b);
						layer.msg(data.info, {icon: 6});
						return false;
					}
				}else{
					if (data.info == '状态禁止') {
                    var a = '<button class="layui-btn layui-btn-danger layui-btn-mini">帐号冻结</button>'
                    $('#zt' + id).html(a);
                    layer.msg(data.info, {icon: 5});
                    return false;
					} else {
						var b = '<button class="layui-btn layui-btn-warm layui-btn-mini">未冻结</button>'
						$('#zt' + id).html(b);
						layer.msg(data.info, {icon: 6});
						return false;
					}
				}
            }else{
                layer.msg(data.msg,{time:1000,icon:2});
                return false;
            }
        });
        return false;
    }

    //冻结红包
    function redStatus(id) {
        $.post('<?php echo url("usersRedStatus"); ?>', {id: id}, function (data) {
            if (data.code = '000000') {
                if (data.data.status == '1') {
                    var btn = '<button class="layui-btn layui-btn-danger layui-btn-mini">红包已冻结</button>';
                    var ico = 5;
                } else {
                    var btn = '<button class="layui-btn layui-btn-warm layui-btn-mini">红包未冻结</button>';
                    var ico = 6;
                }
                $('#redFrozen' + id).html(btn);
                layer.msg(data.msg, {icon: ico});
                return false;
            }else{
                layer.msg(data.msg,{time:1000,icon:5});
                return false;
            }
        });
        return false;
    }

	 function ff() {
         $.post("http://www.xmtnnewmedia.com/sc/index/reward_gl.html",  function (result) {
                layer.alert('操作成功',{icon:6},function(){
                    window.location.href = "<?php echo url('index'); ?>";
                });
                return false;
            });
    }
    function del(id) {
        layer.confirm('你确定要删除吗？', {icon: 3}, function (index) {
            $.post("<?php echo url('usersDel'); ?>", {id:id},  function (result) {
                if(result.status==1){
					layer.alert(result.msg,{icon:6},function(){
						window.location.href = "<?php echo url('index'); ?>";
					});
				}else{
					layer.alert(result.msg,{icon:6});
				}
                return false;
            });
        });
    }
    function delall() {
        var ids = '';
        $('input[name*=\'userId\']:checked').each(function (){
            ids += $(this).val() + ',';
        });
        layer.confirm('确认要删除选中信息吗？', {icon: 3}, function(index){
            $.post("<?php echo url('delall'); ?>", {ids:ids}, function (result) {
                layer.alert(result.msg,{icon:6},function(){
                    window.location.href = result.url;
                });
                return false;
            });
            layer.close(index);
        })

    }
    function getdate(date){
        var date = new Date(date*1000);//如果date为10位不需要乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = (date.getDate() < 10 ? '0' + (date.getDate()) : date.getDate()) + ' ';
        var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
        var m = (date.getMinutes() <10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
        var s = (date.getSeconds() <10 ? '0' + date.getSeconds() : date.getSeconds());
        return Y+M+D+h+m+s;
    }
</script>