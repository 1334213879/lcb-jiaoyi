<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:82:"C:\Users\Administrator\Desktop\tpbt\public/../application/admin\view\goods\cz.html";i:1573807337;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainHead.html";i:1573868955;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainFoot.html";i:1573868942;}*/ ?>
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
<div class="admin-main fadeInUp animated">
 <blockquote class="layui-elem-quote">
        <form  class="layui-form">
            <div class="layui-form-item search-input"  style="margin:0;">
					<div class="layui-form-mid layui-word-aux" style="padding:0;">
						<a href="<?php echo url('cz'); ?>?type=0" class="layui-btn">待审核</a>
					</div>
					<div class="layui-form-mid layui-word-aux" style="padding:0;">
						<a href="<?php echo url('cz'); ?>?type=1" class="layui-btn">已通过</a>
					</div>
					 <div class="layui-form-mid layui-word-aux" style="padding:0;">
						<a href="<?php echo url('cz'); ?>?type=-1" class="layui-btn">已拒绝</a>
					</div>
				</div>
        </form>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>充值USDT</legend>
        <div class="layui-field-box table-responsive">
            <table class="layui-table table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox" id="selected-all" onclick="$('input[name*=\'userId\']').prop('checked', this.checked);"></th>
                    <th>编号</th>
                    <th>充值方</th>
                    <th>操作</th>
                    <th>充值USDT数量</th>
                    <th>打款凭证</th>
                    <th>时间</th>
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
        <td><input type="checkbox" name="userId[]" value="{{ item.user_id }}"></td>
        <td>{{ item.id }}</td>
		<td>{{ item.nickname }}</td>
        <td>{{ (item.type==0)?'审核中':(item.type==1)?'审核通过':'已拒绝' }}</td>
		<td>{{ item.usdt }}</td>
		<td> 
		{{# if(item.img==''){ }}
		 {{# }else{  }}
				支付凭证：
		<div id="layer-photos-demo{{ item.id }}" onclick="view({{ item.id }})">
		  <img layer-pid="图片id，可以不写" layer-src="{{ item.img }}" src="{{ item.img }}" alt="{{ item.img }}" style="max-width: 70px;">
		</div>
		{{# } }}
		</td>
		<td>{{ getdate(item.time) }}</td>
		<td>{{# if(item.type==0){ }} 
			<a class="red" href="javascript:" onclick="return stateyes('{{ item.id }}','1');" title="审核通过">
                <button class="layui-btn layui-btn-warm layui-btn-mini">通过</button>
            </a> 
			<a class="red" href="javascript:" onclick="return stateyes('{{ item.id }}','-1');" title="拒绝">
                <button class="layui-btn layui-btn-warm layui-btn-mini">拒绝</button>
            </a> 
			{{# } }}
		</td>
    </tr>
    {{# }); }}
</script>
<!-- <script type="text/javascript" src="/static/admin/plugins/layui/layui.js"></script> -->
<script src="/static/js/jquery.2.1.1.min.js"></script>

<script>
    layui.config({
        base: '/static/admin/js/'
    }).use(['paging', 'code','icheck','layer'], function(){
        layui.code();
        var paging = layui.paging(),layer = parent.layer === undefined ? layui.layer : parent.layer;
        paging.init({
            url: "", //地址
            elem: '#con', //内容容器
            params: {}, //发送到服务端的参数
            tempElem: '#conTemp', //模块容器
            pageConfig: { //分页参数配置
                elem: 'paged', //分页容器
                pageSize: 15 //分页大小
            },
            success: function() { //渲染成功的回调
                //alert('渲染成功');
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
    function view(id) {
    	  layer.photos({
            photos: '#layer-photos-demo'+id
            ,closeBtn: 1
            ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
          }); 
    }
    function stateyes(id,type) {
	if(type==1){
	 var t = '你确定审核通过吗?';
	}else{
	 var t = '你确定拒绝吗?';
	}
        layer.confirm(t, {icon: 3}, function (index) {
            $.post('<?php echo url("cz_type"); ?>', {id:id,type:type}, function (data) {
                if (data.status = 1) {
                    layer.msg(data.msg,{time:1000,icon:6});
					history.go(0); 
                }else{
                    layer.msg(data.msg,{time:1000,icon:5});
					//history.go(0); 
                    return false;
                }
            });
            return false;
      });
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