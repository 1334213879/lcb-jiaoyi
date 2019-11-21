<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:84:"C:\Users\Administrator\Desktop\tpbt\public/../application/admin\view\goods\code.html";i:1552012172;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainHead.html";i:1573868955;s:79:"C:\Users\Administrator\Desktop\tpbt\application\admin\view\common\mainFoot.html";i:1573868942;}*/ ?>
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
						<a href="<?php echo url('code'); ?>?status=1" class="layui-btn">未使用</a>
					</div>
					<div class="layui-form-mid layui-word-aux" style="padding:0;">
						<a href="<?php echo url('code'); ?>?status=0" class="layui-btn">已使用</a>
					</div>
					<div class="layui-form-mid layui-word-aux" style="padding:0;">
						<a href="<?php echo url('code_add'); ?>" class="layui-btn">生成激活码</a>
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
                    <th>编号</th>
                    <th>购买方</th>
                    <th>激活码</th>
					<th>使用方</th>
					<th>状态</th>
                    <th>时间</th>
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
        <td>{{ item.id }}</td>
		<td>{{ item.nickname }}</td>
		<td>{{ item.code }}</td>
		<td>{{ item.use_nickname }}</td>
		<td>
		{{# if(item.status==0){ }}
		已使用
		 {{# }else{  }}
		未使用
		{{# } }}</td>
		<td>{{ getdate(item.time) }}</td>
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