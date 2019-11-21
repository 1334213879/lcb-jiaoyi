<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:79:"C:\Users\Administrator\Desktop\tpbt\public/../application/user\view\set\bb.html";i:1574211659;s:74:"C:\Users\Administrator\Desktop\tpbt\application\user\view\common\head.html";i:1557729324;}*/ ?>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <title><?php echo lang('NMCT和XMT双通证平台'); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="/static/xmt/css/sm.min.css">
    <link rel="stylesheet" href="/static/xmt/css/sm-extend.css">
    <script type='text/javascript' src='/static/xmt/js/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/sm-extend.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/global.js' charset='utf-8'></script>
	<script type='text/javascript' src='/static/xmt/js/vue.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='/static/xmt/js/vue-resource.min.js' charset='utf-8'></script>
</head>


<link rel="stylesheet" href="/static/xmt/css/pages/wallet-index.css?v=1.02">
<script src="/static/xmt/js/mathlib-min.js?v=1.02"></script>
<script src="/static/xmt/js/k3d-min.js?v=1.02"></script>
<script src="/static/xmt/js/radiation.js?v=1.02"></script>
<link rel="stylesheet" href="/static/xmt/css/style.css?v=1.02">

<body>
 <div class="page-group">
    <div class="page page-current">
	<header class="bar bar-nav">
		<h3><?php echo lang('我的钱包'); ?></h3>
	</header>
	<div class="content">
		<div class="content-block">
			<!-- usdt账户信息 -->
			<div class="card">
			    <div class="card-content">
			      <div class="card-content-inner">
					<p><?php echo lang('USDT账户'); ?></p>
					<div class="xmtt-acc">			
						<h3>${{user.money_usdt}}</h3>
						<p data-popup=".popup-cz" class="open-popup"><?php echo lang('充值USDT'); ?></p>
					</div>				
			      </div>		      
			    </div>		  	   
			</div>
			<!-- usdt账户信息end -->
		</div>
  		<!-- content-block END -->





  		<!-- 红包 -->
  		 <div class="content-block hb" style="padding: 0;" v-if="user.hongbao>0">        	
			<div class="qd" style="width: 90%;margin: 10px auto;overflow: hidden;" @click='getData(1)'>
				<div class="upper">
					<img src="/static/xmt/images/xhb.png" alt="" style="float: left;">
					<p><?php echo lang('今天还有红包未领取哦！'); ?></p>
					<a><?php echo lang('点击领取'); ?></a>
				</div>
				<div class="downer">
					<span><?php echo lang('NMCT红包'); ?></span>
				</div>
			</div>			
		</div>
		<!-- 红包end -->



  		<div class="content-block nmct">
			<div class="z_num">
				<div class="nmct_z">
					<p><?php echo lang('NMCT资产'); ?></p>
					<h2>{{user.nmct_dj}}</h2>
				</div>
				<div class="nmct_t">
					<p><?php echo lang('NMCT通证'); ?></p>
					<h2>{{user.nmct}}</h2>
				</div>
			</div>
			<p class="nmct_p"><?php echo lang('NMCT当前价格'); ?>：${{system.money_nmct}}</p>
			<div class="nmct_op">
				<span data-popup=".popup-transfer" class="open-popup"><?php echo lang('复投'); ?></span>
				<span>|</span>
				<span data-popup=".popup-xmt" class="open-popup"><?php echo lang('转XMT'); ?></span>
			</div>
  		</div>

  		<div class="content-block nmct" style="margin-bottom:4rem;">
			<div class="z_num">
				<div class="nmct_z">
					<p><?php echo lang('XMT通证'); ?></p>
					<h2>{{user.xmt}}</h2>
				</div>				
			</div>
			<p class="nmct_p"><?php echo lang('XMT当前价格'); ?>：${{system.money_xmt}}</p>
			<div class="nmct_op">
				<span data-popup=".popup-xmt_zc" class="open-popup"><?php echo lang('XMT转出'); ?></span>
			</div>
  		</div>


<!-- 复投 -->
<div class="popup zc popup-transfer">
	<header class="bar bar-nav">
		<h3><?php echo lang('NMCT通证复投'); ?></h3>
	</header>
	<div class="trans-info">
		<div class="trans-pic">
			<img src="/static/xmt/images/transfer.png" alt="">
		</div>
		<p><?php echo lang('NMCT通证复投NMCT资产'); ?></p>
		<span><?php echo lang('请输入复投数量'); ?>：</span>
		<input type="number" id="nmct" class="trans-num" />
	</div>
	<div class="btns">
		<a class="close-popup cancel"><?php echo lang('取消'); ?></a>
		<a @click="zc_(0);" class="confirm"><?php echo lang('确定复投'); ?></a>
	</div>
</div>
<!-- 复投 -->
<!-- USDT转nmct，功能暂时不用 -->
<div class="popup zc popup-usdt">
	<header class="bar bar-nav">
		<h3><?php echo lang('USDT转至NMCT资产'); ?></h3>
	</header>
	<div class="trans-info">
		<div class="trans-pic">
			<img src="/static/xmt/images/transfer.png" alt="">
		</div>
		<p><?php echo lang('将从USDT账户转至NMCT资产账户'); ?></p>
		<span><?php echo lang('请输入转出数量'); ?>：</span>
		<input type="number" id="usdt" class="trans-num"/>
	</div>
	<div class="btns">
		<a class="close-popup cancel"><?php echo lang('取消'); ?></a>
		<a @click="zc_(1);" class="confirm"><?php echo lang('确定转出'); ?></a>
	</div>
</div>
<!-- USDT转nmct，功能暂时不用 -->


<!-- XMT转出 -->
<div class="popup zc popup-xmt_zc">
	<header class="bar bar-nav">
		<h3><?php echo lang('转出XMT通证'); ?></h3>
	</header>
	<div class="trans-info">
		<div class="trans-pic">
			<img src="/static/xmt/images/transfer.png" alt="">
		</div>
		<p><?php echo lang('转出XMT通证'); ?></p>
		<span><?php echo lang('转入ID或手机号'); ?>：</span>
		<input type="number" id="xmt_p" class="trans-num" />
		<p>
		<span><?php echo lang('转入XMT通证数'); ?>：</span>
		<input type="number" id="xmt_num" class="trans-num" />
		</p>
        <p>
          <span><?php echo lang('给他留言'); ?>：</span>
          <input type="text"  class="trans-num" />
          </p>
           <p>
		<span><?php echo lang('短信验证码'); ?>：</span>
			<input type="text" name="sms" id="sms" maxlength="6" ><span onclick="send_phone(1)" id="zphone1" style="text-align: right;font-size:0.875em;color:#ccc;">获取验证码</span>
		</p>
      
	</div>
	<div class="btns">
		<a class="close-popup cancel"><?php echo lang('取消'); ?></a>
		<a @click="zc_(7);" class="confirm"><?php echo lang('确定转出'); ?></a>
	</div>
</div>
<!-- XMT转出 -->

<!-- 转XMT -->
<div class="popup zc popup-xmt">
	<header class="bar bar-nav">
		<h3><?php echo lang('NMCT通证转XMT通证'); ?></h3>
	</header>
	<div class="trans-info">
		<div class="trans-pic">
			<img src="/static/xmt/images/transfer.png" alt="">
		</div>
		<p><?php echo lang('NMCT通证转XMT通证'); ?></p>
		<span><?php echo lang('请输入转投数量'); ?>：</span>
		<input type="number" id="xmt" class="trans-num" />
	</div>
	<div class="btns">
		<a class="close-popup cancel"><?php echo lang('取消'); ?></a>
		<a @click="zc_(2);" class="confirm"><?php echo lang('确定转投'); ?></a>
	</div>
</div>
<!-- 转XMT -->
      
     
<!-- 充值USDT -->
<div class="popup zc popup-cz">
	<header class="bar bar-nav">
		<h3><?php echo lang('充值USDT'); ?></h3>
	</header>
	<div class="trans-info">
		<div class="trans-pic">
			<img src="/static/xmt/images/transfer.png" alt="">
		</div>
		<p><?php echo lang('汇入USDT钱包地址'); ?>：</p>
		<p id="qbdz50" oncopy="myFunction()">{{system.usdt_addres}}</p>
		<div onclick="copy(50)" class='cope'><?php echo lang('复制地址'); ?></div>
		<p><span><?php echo lang('充值数量'); ?>：</span>
		<input type="number" id="money_usdt" class="trans-num"/>
		</p>
		<a href="javascript:;" class="a-upload">
			<input type="file" name='file-avatar' id='file-avatar' @change="upload()" accept='image/*'/><?php echo lang('点击这里上传打款凭证'); ?>
		</a>
		<div v-if="img" onclick="$('#ck_img').show();" class='cope'><?php echo lang('查看凭证'); ?></div>
		<img v-bind:src="img" id="ck_img" style='width:100%;display:none;z-index:22;position: fixed;top:0;left:0' onclick="$(this).hide()"/>
	</div>
	<div class="btns">
		<a class="close-popup cancel"><?php echo lang('取消'); ?></a>
		<a @click="zc_(3);" class="confirm"><?php echo lang('确定充值'); ?></a>
	</div>
</div>
<!--充值USDT end -->
</div>
<!-- content end -->
</div>
<!-- page-current end-->
<canvas id="canvas" style="position: relative; background-color: #fed261;display:none;"></canvas>
<div class="container" id="container" style="display:none;">
	<div class="RedBox">
		<div class="topcontent">
			<h2 class="bounceInDown" style="padding-top:40px;"><?php echo lang('恭喜你领取红包成功！'); ?></h2>
			<span class="text flash" style="font-size:14px;padding-top:40px;"><b>+{{hongbao}}</b><br><?php echo lang('NMCT通证'); ?></span>
			<div class="description1 flipInX" style="margin-top:130px;" onclick="location.href='/user/index/my.html#page-hongbao';"><?php echo lang('查看红包记录'); ?>
			</div>
			<div class="description2" @click="getData(0);$('#canvas').hide();$('#container').hide();$('.page').show();"><?php echo lang('关闭'); ?>
			</div>
		</div>
	</div>
</div>

</div>

<script>
parent.$('#dhl').show();
function copy(id){
	var id = "qbdz"+id;
    const range = document.createRange();
    range.selectNode(document.getElementById(id));
    const selection = window.getSelection();//选择
    if(selection.rangeCount > 0) selection.removeAllRanges();
    selection.addRange(range);
    document.execCommand('copy');
	wboos.toast('<?php echo lang('复制成功'); ?>');
	}
  
    	//xmt转出验证码
	 function send_phone(id){
         if(id==1){
           			var number = $('#xmt_num').val();
					var mobile = $('#xmt_p').val();
          if(number==""){
            wboos.toast('<?php echo lang('请输入转出XMT通证数'); ?>',{time:1800});
      
            return false;
    }
           var mobile=<?php echo $userInfo['mobile']; ?>;
			 $.post("<?php echo url('user/login/sendSms'); ?>",{mobile:mobile},function(res){
				 if(res.code > 0){
					 wboos.toast(res.msg,{time:1800});
					 $('.send_phone'+id).remove();
	
				 }else{
					 wboos.toast(res.msg,{time:1800});
				 }
			 });


		 
         }


	 }

  
  
  
  
var app = new Vue({
  el: '.page-group',
  data: {
	img:'',
	user:'',
	list:'',
	code:'',
	level:'',
	hongbao:'',
	level_:'',
	xmtt:'',
	usdt:'',
	system:'',
	money_usdt:'',
	image:{
        url:'',
        value:'<?php echo lang('请上传付款凭证'); ?>',
        background:'background:#fff;',
      },
  },
  filters: {
   timestampToTime(timestamp) {
        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y+M+D+h+m+s;
   		 },
	  int_(i){
		if(i>0){
			return '+'+i;
		}else if(i<0){
			return i;
		}
	},
	  numFilter(value) {
	     var toFixedNum = Number(value).toFixed(3);
		  var realVal = toFixedNum.substring(0, toFixedNum.toString().length - 1);
		  return realVal;
	  },
  },
  methods: {
	getData(type){
		this.$http.post('/user/mode/bb.html',{type:type}).then(function (res){
			console.log(res)
			var i = res.body;
			if(type==1){
				var audio = new Audio("/static/home/kq/mp3.mp3");//播放mp3
				audio.play();
				this.hongbao=i.hongbao;
				$('.page').hide();
				$('#canvas').show();$('#container').show();
					var oOpen = document.getElementById("open");
					var oClose = document.getElementById("open");
					var oContainer = document.getElementById("container");
					oChai.onclick = function (){
						oChai.setAttribute("class", "rotate");
					};
			}
			this.user=i.user;
			this.level=i.level;
			this.list=i.list;
			this.code=i.code;
			this.xmtt=i.xmtt;
			this.system = i.system;
			this.usdt=i.usdt;
			if(type>0){
				this.user.hongbao = 0;
				wboos.toast('<?php echo lang('领取成功'); ?>！');
			}
			if(i.user.pass==0){
				wboos.toast('<?php echo lang('帐号未激活，请激活帐号！'); ?>');
				$('.jh_code').click();
			}
		})
	},
	upload(){
			wboos.toast('<?php echo lang('打款凭证上传中'); ?>');
			var formData = new FormData();
			formData.append("file", $(this.$el).find('#file-avatar')[0].files[0]);
			this.$http.post(wboos.url('user/index/upload'),formData,{
			method: 'post',
			headers: {'Content-Type': 'multipart/form-data'},
			withCredentials: true,
			}).then(function (res) {
				wboos.toast(res.body.info);
				this.img = res.body.url;
				//this.$set(this.pay, 'img',res.body.url);
			}).catch(function(error){
				console.log(error);
			})
	},
	zc_(type){
		var img = this.img;
		var user = '';
		if(type==0){
			var number = $('#nmct').val();
			if($('#nmct').val()==0 || $('#nmct').val()%100!==0 || $('#nmct').val()<99){
				wboos.toast('<?php echo lang('复投100的倍数起'); ?>');return;
			}
		}else if(type==1){
			var number = $('#usdt').val();
		}else if(type==2){
			var number = $('#xmt').val();
		}else if(type==3){
			var number = $('#money_usdt').val();
		}else if(type==4){
			var number = $('#jh_1').val();
		}else if(type==5){
			var number = $('#jh_2').val();
		}else if(type==6){
			var number = this.level_;
		}else if(type==7){
			var number = $('#xmt_num').val();
			var user = $('#xmt_p').val();
	        var sms  =$('#sms').val();
		}
      if(sms==""){
            wboos.toast('<?php echo lang('请输入验证码'); ?>',{time:1800});
           }
		wboos.confirm('<?php echo lang("确定要提交?"); ?>', function () {
			wboos.httpRequest({
			url: '/user/mode/zc.html',
			type: 'post',
			data: {type:type,number:number,img:img,user:user},
			success: function(i){
			    if(i.status==0){
					wboos.toast(i.msg);
				}else{
					wboos.toast(i.msg);
					$('.cancel').click();
					app.getData();
				}
			}
			});
			});
	},
  },
  created:function (){
	this.getData(0);
  },
})
</script>
</body>
</html>