<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:85:"C:\Users\Administrator\Desktop\tpbt\public/../application/user\view\index\index1.html";i:1574317353;s:76:"C:\Users\Administrator\Desktop\tpbt\application\user\view\common\footer.html";i:1552012170;}*/ ?>
<!DOCTYPE html>
<html style="background-color:#fff;">
<head>
<meta charset="utf-8">
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,user-scalable=no">
<meta name="description" content="<?php echo $title; ?>">
<script type='text/javascript' src='/static/xmt/js/vue.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/static/xmt/js/vue-resource.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/static/xmt/js/global.js' charset='utf-8'></script>
<script src="/static/home/js/swiper-3.4.2.min.js"></script>
<link type="text/css" rel="stylesheet" href="/static/home/btb/idealMoneyList.css">
<link rel="stylesheet" href="/static/home/css/swiper-3.4.2.min.css">
<link rel="stylesheet" href="/static/xmt/css/sm.min.css">
<link rel="stylesheet" href="/static/xmt/css/sm-extend.css">
<script type='text/javascript' src='/static/xmt/js/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/static/xmt/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='/static/xmt/js/sm-extend.min.js' charset='utf-8'></script>
<style>
.page, .page-group{
	background: #fff;
}
.title-bar{
/*background: url('/static/xmt/images/headbar_bg.gif') center center no-repeat;*/
width: 100%;
background-size:100% 100%;
}
.title-bar h3{
text-align: center;
color:#1d3891;
font-size: 14px;
font-weight: 600;
margin:0;
padding:0;
}
.title-bar h3 i{
background: url('/static/xmt/images/xmt.png') center no-repeat;
background-size: 100% 100%;
display: inline-block;
width: 1.5rem;
height: 1.5rem;
overflow: hidden;
position: relative;
top: .5rem;
left: -.5rem;
}
.swiper-container{
width: 100%;
position:relative;
}
.swiper-container,.swiper-wrapper{
height:170px;
overflow:hidden;
}
.swiper-wrapper{
position:absolute;
left:0;
}
.swiper-button-next, .swiper-button-prev{
width: 25px;
height: 22px;
}
.swiper-slide img{
height: 170px;
width: 100%;
}
.news-block{
width: 96%;
margin:6px auto 0;
position: relative;
}
.news-block ul li{
border-bottom: solid 1px #ccc;
}
.news-block ul li a{
display: block;
overflow: hidden;
padding:2%;
}
.news-brief{
float: left;
width: 63%;
margin-left: 2%;
}
.newspic{
float: left;
width: 35%;
height: 80px;
border-radius: 4px;
position: relative;
overflow: hidden;
}
.newspic img{
width: 100%;
}
.news-brief .news-title{
color: #888;
}
.news-brief .news-author{
font-size: .7rem;
color: #ccc;
margin-top: 1rem;
}
.hb>tr{
	background: #0894ec;
}
.hb>tr>th{
color:#fff;
text-align: left;
background: transparent;
}
.market>tr{}
table td,table th{
font-size:12px;
color:#000;
font-weight: normal;
text-align: left;
background: #fff;
white-space: nowrap;
line-height: 20px;
padding:5px 0;
}
tr>th:first-child{
width: 2rem;
}
tr>td:first-child{
width: 2rem;
}
tr>td:nth-child(2){
max-width: 80px;
text-overflow: ellipsis;
white-space: nowrap;
overflow: hidden;
}
.apple_title{
height: 30px;
width: 10%;
line-height: 30px;
float: left;
font-size: 15px;
font-weight: 600;
color: #0a8ddf;
text-align: center;
}
.apple_title>i{
	display: block;
    position: relative;
    width: 100%;
    height: 21px;
    padding-top: 3px;
}
.apple_title>i>img{
	width: 40%;
}
.shell{
width:500px; 
}
#div1{
overflow:hidden;
height:30px;
}
#div1>a{
display:block;
line-height:30px;
text-decoration:none;
color:#333;
font-family:Arial;
font-size:12px;
display: -webkit-box;
-webkit-box-orient: vertical;
-webkit-line-clamp: 1;
margin-top:1px;
max-width: 14rem;
padding-left: .2rem;
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
}
.kl_jh {
position: absolute;
width: 5%;
top: 22%;
z-index: 2;
}
.kl_tltle{
background: url(/static/xmt/images/headbar_bg.gif);
width: 100%;
}
.title {
position: absolute;
display: block;
width: 100%;
padding: 0;
margin: 0 -.5rem;
font-size: .85rem;
font-weight: 500;
line-height: 2.2rem;
color: #fff;
text-align: center;
white-space: nowrap;
}
.notice_box{
width: 98%;
margin: 0 auto;
height: 30px;
overflow: hidden;
margin-top: 5px;
margin-bottom: 4px;
line-height: 30px;
background: #eee;
border-radius: 4px;
}
/* NINE */
.hamburger .line {
    width: 16px;
    height: 2px;
    background-color: #0a8ddf;
    display: block;
    margin: 3px auto;
}

</style>
</head>
<body style="padding-bottom: 1rem">
 <div class="page-group" style="background: #fff;">
        <div class="page page-current">
    <div class="title-bar">
        <h3><i></i><?php echo lang('USA NMCT/XMT资产双通证平台'); ?></h3>
    </div>
<div class="content" style="margin-top:45px;">
   <!-- Swiper -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <!--<div class="swiper-slide"><img src="/static/home/images/slide1.jpg" alt=""/></div>-->
            <div class="swiper-slide"><img src="/static/home/images/slide2.png" alt=""/></div>
          	<div class="swiper-slide"><img src="/static/home/images/slide3.jpg" alt=""/></div>
          	<div class="swiper-slide"><img src="/static/home/images/slide4.png" alt=""/></div>
          	<div class="swiper-slide"><img src="/static/home/images/slide5.png" alt=""/></div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination swiper-pagination-white"></div>
    </div>
    <!-- Initialize Swiper -->
    <script type="text/javascript">
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: '.swiper-pagination',
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 30,
        effect: 'fade',
        loop:'loop',
        autoplay:2000,
    });
    </script>                                                 
     <!-- Swiper end-->
<div class="notice_box">
		<div class="apple_title"><i><img src="/static/xmt/images/speaker1.png" alt=""></i></div>
		<div style="float: right;margin: .3rem .6rem;" data-popup=".popup-about" onclick="$('.block').hide();" class="open-popup hamburger" id="hamburger-9">
		          <span class="line"></span>
		          <span class="line"></span>
		          <span class="line"></span>
		</div>
		
		<div id="div1">
		<?php if(is_array($xw) || $xw instanceof \think\Collection || $xw instanceof \think\Paginator): $i = 0; $__LIST__ = $xw;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$a): $mod = ($i % 2 );++$i;?>
			<a href="<?php echo url('user/set/sqgg'); ?>?id=<?php echo $a['ad_id']; ?>"><?php echo $a['name']; ?></a>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>    
	<!-- <script src="/static/home/btb/idealMoneyDetal.js"></script> -->
     <!-- news section -->
     <div class="bitcoin_list clearfix" id="app">
		<table>
			<thead class="hb" style="border: 0;background: #0a8ddf">
					<tr>
						<th style="text-indent:.5rem"><?php echo lang('图标'); ?></th>
						<th width="80"><?php echo lang('名称'); ?></th>
						<th class="column7 sort" data-column="7" data-sort="turnover"><?php echo lang('交易量'); ?></th>
						<th class="column4 sort desc" data-column="4" data-sort="last_numeric"><?php echo lang('最新价'); ?></th>
						<th class="column5 sort" data-column="5" data-sort="pcp"><?php echo lang('涨跌幅/24H'); ?></th>
                   </tr>
            </thead>
			<tbody class="market">
				<tr v-for="a in list" v-if="a.iconUrl!='https://resource.jinse.com/'">
					<td>
						<img v-bind:src="a.iconUrl" style="width:25px;height:25px;margin-left:5px;vertical-align: middle;"/>
					</td>
                  <td>{{a.currency}}<br><span>{{a.name}}</span></td>
					<td>{{a.vol/100000000|number}}<?php echo lang('亿'); ?></td>
					<td>{{a.price|number}}</td>
					<td>
						<div v-if="a.change>0" class="column5a red">+{{a.change}}%</div>
						<div v-else class="column5a gre">{{a.change}}%</div>
					</td>
				</tr>
		   </tbody>
		</table>
     </div>
	</div>
	 <div class="popup popup-about">
				<header class="bar bar-nav kl_tltle">
						<a href="#" class="close-popup" onclick="$('.block').show();" style="color:#fff;">
							<img src="http://kc.inonecity.com/style/area/images/history.png" class="kl_jh"/>
						</a>
						<h1 class="title klt_txt"/><?php echo lang('公告'); ?></h1>
				</header>
			<div class="list-block cards-list" style="margin-top:3rem;margin-bottom:50px;">
			  <ul>
			  <?php if(is_array($xw) || $xw instanceof \think\Collection || $xw instanceof \think\Paginator): $i = 0; $__LIST__ = $xw;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$a): $mod = ($i % 2 );++$i;?>
				<li class="card" v-for="(a,i) in list">
					<div class="card-header"><?php echo $a['name']; ?></div>
				  <div class="card-content">
					<div class="card-content-inner"><?php echo $a['jj']; ?></div>
				  </div>
				  <div class="card-footer">  <?php echo date('y-m-d h:i:s',$a['addtime']); ?>
					<a href="<?php echo url('user/set/sqgg'); ?>?id=<?php echo $a['ad_id']; ?>" style="float:right;"><?php echo lang('立即查看'); ?></a>
				  </div>
				</li>
			  <?php endforeach; endif; else: echo "" ;endif; ?>
			  </ul>
		  </div>
		</div>
</div>
</div>
<script>
var c,_=Function;
with(o=document.getElementById("div1")){ innerHTML+=innerHTML; onmouseover=_("c=1"); onmouseout=_("c=0");}
(F=_("if(#%18||!c)#++,#%=o.scrollHeight>>1;setTimeout(F,#%32?10:1500);".replace(/#/g,"o.scrollTop")))();
new Vue({
  el: '#app',
  data: {
	isLoading: true,
    list: '',
  },
  methods: {
	getData(){
		this.$http.get('/user/index/market.html').then(function (res) {
			this.list = res.body;
		})		
	},
	getCookieObj(){
    var cookieObj={},
    cookieSplit=[], // 以分号（;）分组
    cookieArr=document.cookie.split(";");
    for(var i=0,len=cookieArr.length;i<len;i++)
        if(cookieArr[i]) {
            // 以等号（=）分组
            cookieSplit=cookieArr[i].split("=");
            // Trim() 是自定义的函数，用来删除字符串两边的空格
            cookieObj[cookieSplit[0].replace(/^(\s|\xA0)+|(\s|\xA0)+$/g, '')]=cookieSplit[1].replace(/^(\s|\xA0)+|(\s|\xA0)+$/g, '');
        }
        return cookieObj;
      },
  },
  created:function (){
	this.getData();this.getCookieObj();
  },
 filters: {
    //保留2位小数点过滤器 不四舍五入
    number(value) {
      var toFixedNum = Number(value).toFixed(3);
      var realVal = toFixedNum.substring(0, toFixedNum.toString().length - 1);
      return realVal;
    }
  },
})
parent.$('#dhl').show();
</script>

</body>
</html>