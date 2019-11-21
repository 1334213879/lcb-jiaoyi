<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:81:"C:\Users\Administrator\Desktop\tpbt\public/../application/user\view\index\jy.html";i:1559739583;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">  
    <link rel="stylesheet" href="/static/xmt/css/pages/jy-index.css?v=1.02">
  <link rel="stylesheet" href="/static/xmt/css/sm.min.css">
    <link rel="stylesheet" href="/static/xmt/css/sm-extend.css">
    <script type='text/javascript' src='/static/xmt/js/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/sm-extend.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/global.js?v=1.0.2' charset='utf-8'></script>
  <script type='text/javascript' src='/static/xmt/js/vue.min.js' charset='utf-8'></script>
  <script type='text/javascript' src='/static/xmt/js/vue-resource.min.js' charset='utf-8'></script>
</head>
<style>
  .content-block{
    margin:.75rem 0;
  }
</style>  
<body>
<!-- page集合的容器，里面放多个平行的.page，其他.page作为内联页面由路由控制展示 -->
    <div class="page-group">
        <!-- 单个page ,第一个.page默认被展示-->
        <div class="page">
            <!-- 标题栏 -->
            <header class="bar bar-nav">
        <a href="" onclick="javascript:history.go(-1);"></a>
        <h3><?php echo lang("交易中心"); ?></h3>
      </header>
            <!-- 这里是页面内容区 -->
            <div class="content" style="background:#fff;">
          <div class='xs' v-if="status<0 && zl==1">
          <div class='qdgm'>
            <div onclick="location.href='/user/index/my.html';" style="text-align: center;color: #e6e6e6;">
              <span><?php echo lang("请完善个人资料待,银行卡信息及安全密码,前往设置"); ?></span>
            </div>
          </div>
        </div>
  <div class="content-block jytitle" style="margin:0">
    <h2 class="header_dh10" @click="getData(10)"><?php echo lang("求购列表"); ?></h2>
    <h2 class="header_dh0 now" @click="getData(0)"><?php echo lang("挂卖列表"); ?></h2>
    <h2 class="header_dh9" @click="getData(9)"><?php echo lang("挂卖"); ?></h2>
    <h2 class="header_dh8" @click="want_buy(10)"><?php echo lang("求购"); ?></h2>
    <h2 class="header_dh1" @click="getData(1)"><?php echo lang("我的订单"); ?></h2>
    <h2 class="header_dh3" @click="getData(3)"><?php echo lang("已完成"); ?></h2>
  </div>
  <div class="content-block">
    <ul style="margin-bottom:3rem;">        
      <li v-for="(a,i) in list" v-if="a.my_id==a.buy_id || a.my_id==a.user_id">
        <!-- 自己买的单或者自己挂出的单 -->      
        <p v-if="a.status<10">
          <span>{{a.yhk_name.substr(0,1)}}**&nbsp;&nbsp;&nbsp;&nbsp;ID:{{a.my_id}}</span>         
            <span>{{a.time}}</span></p>
                  
        <p v-else><span>{{a.buyname.substr(0,1)}}**&nbsp;&nbsp;&nbsp;&nbsp;ID:{{a.my_id}}</span><span>{{a.time}}</span></p>                    
              <!--  购买方式-->
                <p v-if="a.pay==0" class="pay_path"><img src="/static/xmt/images/p0.png" alt=""></p>
                <p v-else-if="a.pay==1" class="pay_path"><img src="/static/xmt/images/p1.png" alt =""></p> 
         		<p v-else-if="a.pay==2" class="pay_path"><img src="/static/xmt/images/p2.png" alt =""></p> 
        <p>
              <span><?php echo lang("总额"); ?>：<strong>${{a.zg}}</strong></span>
              <!-- <span><img src="/static/xmt/images/alipay.png" alt=""></span> -->
            </p>
            <p><span><?php echo lang("单价"); ?>：${{a.jg}}</span></p>
             <p>
            <span><?php echo lang("数量"); ?>：{{a.gs}}</span>
            <!-- 状态 -->
            <span v-if="a.status==1 && a.gm==1" @click="pay_(0,i);"><a>{{a.zt}}</a></span>
        <span v-else-if="a.status==1 && a.my_id==a.user_id" @click="pay_(0,i);"><a>{{a.zt}}</a></span>
        <span v-else-if="(a.status==2 || a.status==12) && a.my_id==a.user_id" @click="pay_(0,i);"><a><?php echo lang("待通过"); ?></a></span>
        <span v-else-if="(a.status==2 || a.status==12) && a.my_id!=a.user_id" @click="wboos.toast('<?php echo lang('您已经打款，待对方确定收到打款!'); ?>')"><a>{{a.zt}}</a></span>
        <span v-else-if="a.status==11" @click="pay_(0,i);"><a>{{a.zt}}</a></span>
          
        <!-- 操作 -->
        <span v-if="a.status==0 && a.my_id!=a.user_id"><a @click="buy_(0,i);"><?php echo lang('买入'); ?>&gt;</a></span>
            <span v-else-if="a.status==10 && a.my_id!=a.buy_id"><a @click="buy_(0,i);"><?php echo lang('卖出'); ?>&gt;</a></span>
            <span v-else-if="a.status==0 && a.my_id==a.user_id"><a @click="buy_(4,i);" style="color:red;"><?php echo lang('撤回'); ?>&gt;</a></span>
            <span v-else-if="a.status==10 && a.my_id==a.buy_id"><a @click="buy_(14,i);"><?php echo lang('撤回'); ?>&gt;</a></span>
      </p>
    </li>

          <li v-for="(a,i) in list" v-if="a.my_id!=a.buy_id && a.my_id!=a.user_id">
              <!-- 挂卖 -->
        <p v-if="a.status<10"><span>{{a.yhk_name.substr(0,1)}}**&nbsp;&nbsp;&nbsp;&nbsp;ID:&nbsp;&nbsp;{{a.user_id}}</span><span>{{a.time}}</span></p>
        <p v-else><span>{{a.buyname.substr(0,1)}}**&nbsp;&nbsp;&nbsp;&nbsp;ID:&nbsp;&nbsp;{{a.buy_id}}</span><span>{{a.time}}</span></p>   
            <!--  购买方式-->
                 <p v-if="a.pay==0" class="pay_path"><img src="/static/xmt/images/p0.png" alt=""></p>
                <p v-else-if="a.pay==1" class="pay_path"><img src="/static/xmt/images/p1.png" alt =""></p>
            	<p v-else-if="a.pay==2" class="pay_path"><img src="/static/xmt/images/p2.png" alt =""></p> 
        <p>
              <span><?php echo lang('总额'); ?>：<strong>${{a.zg}}</strong></span>
              <!-- <span><img src="/static/xmt/images/alipay.png" alt=""></span> -->
            </p>
            <p><span><?php echo lang('单价'); ?>：${{a.jg}}</span></p>
            <p>
              <span><?php echo lang('数量'); ?>：{{a.gs}}</span>
              <!-- 状态 -->
              <span v-if="a.status==1 && a.gm==1" @click="pay_(0,i);">{{a.zt}}</span>
          <span v-else-if="a.status==1 && a.my_id==a.user_id" @click="pay_(0,i);">{{a.zt}}</span>
          <span v-else-if="(a.status==2 || a.status==12) && a.my_id==a.user_id" @click="pay_(0,i);"><?php echo lang('待通过'); ?></span>
          <span v-else-if="(a.status==2 || a.status==12) && a.my_id!=a.user_id" @click="wboos.toast('<?php echo lang('您已经打款，待对方确定收到打款!'); ?>')">{{a.zt}}</span>
          <span v-else-if="a.status==11" @click="pay_(0,i);">{{a.zt}}</span>
            
             
          <!-- 操作 -->
            
                    <span v-if="a.status==0 && a.my_id!=a.user_id"><a @click="buy_(0,i);"><?php echo lang('买入'); ?>&gt;</a></span>
              <span v-else-if="a.status==10 && a.my_id!=a.buy_id"><a @click="buy_(0,i);"><?php echo lang('卖出'); ?>&gt;</a></span>
              <span v-else-if="a.status==0 && a.my_id==a.user_id"><a @click="buy_(4,i);"><?php echo lang('撤回'); ?>&gt;</a></span>
              <span v-else-if="a.status==10 && a.my_id==a.buy_id"><a @click="buy_(14,i);"><?php echo lang('撤回'); ?>&gt;</a></span>
                  

        </p>
      
        <!-- <td>
          <a v-if="a.status==0 && a.my_id!=a.user_id" @click="buy_(0,i);">买入</a>
          <a v-else-if="a.status==0 && a.my_id==a.user_id" @click="buy_(4,i);">撤回</a>
          <a v-else-if="a.status==1 && a.gm==1" @click="pay_(0,i);">{{a.zt}}</a>
          <a v-else-if="a.status==1 && a.my_id==a.user_id" @click="pay_(0,i);">{{a.zt}}</a>
          <a v-else-if="(a.status==2 || a.status==12) && a.my_id==a.user_id" @click="pay_(0,i);">待通过</a>
          <a v-else-if="(a.status==2 || a.status==12) && a.my_id!=a.user_id" @click="wboos.toast('您已经打款，待对方确定收到打款!')">{{a.zt}}</a>
          <a v-else-if="a.status==10 && a.my_id==a.buy_id" @click="buy_(14,i);">撤回</a>
          
          <a v-else-if="a.status==10 && a.my_id!=a.buy_id"  @click="buy_(0,i);">卖给TA</a>
          <a v-else-if="a.status==11" @click="pay_(0,i);">{{a.zt}}</a>
          <a v-else class="dk5">{{a.zt}}</a>
        </td> -->
      </li>
    </ul>
  </div>

  <!-- 挂卖求购弹出框 -->
  <div class="content-block">
  <div v-if="gm.status>0">  
    <div class="xs buyin">
      <h2>
        <span v-if="gm.status==1"><?php echo lang('提交挂卖'); ?></span>
        <span v-else-if="gm.status==2"><?php echo lang('提交求购'); ?></span>
      </h2>
      
      <div>
        <p>
          <span><?php echo lang('我的NMCT通证'); ?>:</span><span id='zc'>{{gm.credit1}}</span>
        </p>
        <p>
          <span><?php echo lang('当前价格'); ?>:</span><span id='jg'>${{gm.price}}</span>
        </p>
        <p>     
          <span v-if="gm.status==1"><?php echo lang('输入挂卖数量'); ?>:</span>
          <span v-else-if="gm.status==2"><?php echo lang('输入求购数量'); ?>:</span>
          <span>
          <input id='wygm' type='number' v-model="gm_number" name='wygm'>
          </span>     
        </p>        
        <p>
          <span><?php echo lang('当前价值'); ?>$:</span>
          <span id='jz'>{{gm_number*gm.price*0.8}}</span>
        </p>
            <p>
              <span v-if="gm.status==1">
            <?php echo lang('收款方式'); ?>:
          </span>
          <span v-if="gm.status==2">
            <?php echo lang('付款方式'); ?>:
          </span>     
                <span>
              <label><input name="pay" type="radio" value="1" checked="checked"/><?php echo lang('钱包地址'); ?>:</label>
          </span>
            </p>
            <p>
              <span><?php echo lang('安全密码'); ?>：</span>
          <span><input id='mm' name='mm' type='password' maxlength='6'/></span>
        </p>
      </div>
      <div v-if="gm.status==1" class='qdgm'>
        <a @click="gm_(0)" class="cancel"><?php echo lang('取消'); ?></a>
        <a @click="gm_(2);if($('#mm').val().length==6){aqmm_($('#mm').val())}" class="ensure">
          <?php echo lang('发布挂卖'); ?>
        </a>
      </div>
      <div v-else-if="gm.status==2" class='qdgm'>
        <a @click="gm_(0)" class="cancel"><?php echo lang('取消'); ?></a>
        <a @click="want_buy();if($('#mm').val().length==6){aqmm_($('#mm').val())}" class="ensure">
          <?php echo lang('发布求购'); ?>
        </a>
      </div>
    </div>
  <!-- xs end -->
  </div>
  <!-- 挂卖求购弹出框 end -->
  <!-- 买入卖出弹出框 -->
  <div v-if="buy.status>-1">
    <div class='xs buyin' style="">
      <h2><?php echo lang('NMCT通证交易'); ?></h2>
      <div>
        <p>
        <span><?php echo lang('订单ID'); ?>:</span>
        <span id='zc'>{{buy.id}}</span>
        </p>      
        <p>
        <span><?php echo lang('交易数量'); ?>:</span>
        <span id='jg'>{{buy.gs}}</span>
        </p>    
        <p>
        <span><?php echo lang('当前价格'); ?>:</span>
        <span id='jg'>${{buy.jg}}</span>
        </p>      
        <p>
        <span><?php echo lang('合计'); ?>:</span>
        <span id='jg'>${{buy.zg}}</span>
        </p>      
        <p>
        <span><?php echo lang('联系方式'); ?>:</span>
        <span id='mobile_' v-if="buy.buy_mobile>0">{{buy.buy_mobile}}</span>
        <span id='mobile_' v-else="buy.user_mobile>0">{{buy.user_mobile}}</span>
        </p>
        <p>
          <span><?php echo lang('安全密码'); ?>：</span>
          <span><input id='mm' name='mm' type='password' maxlength='6'/></span>
        </p>
      </div>
      <div class='qdgm' v-if="(buy.status==0 && buy.my_id==buy.user_id) || (buy.status==10 && buy.my_id==buy.buy_id)">
        <a @click="buy_(-1)" class="cancel"><?php echo lang('取消'); ?></a>
        <a @click="buy_(1);if($('#mm').val().length==6){aqmm_($('#mm').val())}" class="ensure"><?php echo lang('确定撤回'); ?></a>
      </div>
      <div class='qdgm' v-else-if="buy.status<10">
        <a @click="buy_(-1)" class="cancel"><?php echo lang('取消'); ?></a>
        <a @click="buy_(1);if($('#mm').val().length==6){aqmm_($('#mm').val())}" class="ensure"><?php echo lang('确定买入'); ?></a>
      </div>
      <div class='qdgm' v-else>
        <a @click="buy_(-1)" class="cancel"><?php echo lang('取消'); ?></a>
        <a @click="buy_(1);if($('#mm').val().length==6){aqmm_($('#mm').val())}" class="ensure"><?php echo lang('确定卖出'); ?></a>
      </div>
    </div>
  </div>
  <!-- 买入卖出弹出框end -->
  

  <!-- 打款 -->
  <div v-if="pay.status>0">   
    <div class="xs buyin">
      <h2><?php echo lang('订单确认'); ?></h2>
      
      <div>
      <p>
        <span><?php echo lang('订单ID'); ?>:</span><span id='je'>{{pay.id}}</span>
      </p>
      <p>
        <span><?php echo lang('订单类型'); ?>:</span><span>{{pay.lang}}</span>
      </p>
      <p>
        <span><?php echo lang('打款金额'); ?>:</span><span id='je'>${{pay.zg}}</span>
      </p>
            <p>
        <span><?php echo lang('联系方式'); ?>:</span><span id='yh'>{{pay.user_mobile}}</span>
      </p>

          <p v-if="pay.pay==0">       
        <span><?php echo lang('打款银行'); ?>:</span><span id='yh'>{{pay.yhk}}</span>
      </p>
          <p v-if="pay.pay==0">
            <span><?php echo lang('银行卡号'); ?>:</span><span id='yhk'>{{pay.yhk_h}}</span>
          </p>
           <p v-if="pay.pay==0">
            <span><?php echo lang('持卡用户'); ?>:</span><span id='name'>{{pay.yhk_name}}</span>
          </p>       

          <p v-if="pay.pay==1">
        <span><?php echo lang('钱包地址'); ?>:</span><span id='token_address'>{{pay.token_address}}</span>
          </p>


      <p v-if="pay.pay==2">
          <span><?php echo lang('支付宝账号'); ?>:</span><span id='alipay'>{{pay.alipay}}</span>
      </p>

            <p>
        <span><?php echo lang('购买者手机'); ?>:</span><span id='name'>{{pay.buy_mobile}}</span>
      </p>

      <p id='dkpz' v-if="pay.gm==1" >
        <span><?php echo lang('打款凭证'); ?></span>
        <span style="width: 100%">
          <input type='file' id='file-avatar' @change="upload()" name='file-avatar' accept='image/*'/>
        </span>
      </p>

      <p id='dkpz' v-if="pay.gm==0 && pay.img!='' && pay.img!=null" onclick="$('#jy_status2_img').show();">
        <span><?php echo lang('查看凭证'); ?></span>
      </p>

      <p class='qdgm' v-if="pay.status==1 && pay.my_id==pay.user_id" style="border-bottom:0">
              <a @click='pay_(-1)' class="cancel"><?php echo lang('返回'); ?></a>
        <a @click="wboos.toast('<?php echo lang('待对方打款'); ?>!')" class="ensure"><?php echo lang('待对方打款'); ?></a>
      </p>

      <p class='qdgm' v-else-if="pay.gm==1" style="border-bottom:0">  
        <a @click='pay_(-1)' class="cancel"><?php echo lang('返回'); ?></a>
        <a @click='pay_(1,pay.id)' class="ensure"><?php echo lang('确定已打款'); ?></a>
      </p>

      <p class='qdgm' v-else-if="pay.gm==0" style="border-bottom:0">
        <a @click='pay_(-1)' class="cancel"><?php echo lang('返回'); ?></a>
        <a @click='pay_(3,pay.id)' class="ensure" style="padding:0 1rem;"><?php echo lang('确定已收到打款'); ?></a>
      </p>
    </div>
    </div>
    <img v-bind:src="wboos.url(pay.img)" id="ck_img" style='width:100%;display:none;z-index:22;position: fixed;top:0;left:0' onclick="$(this).hide()"/>
    <img v-bind:src="wboos.url(pay.img)" id="jy_status2_img" style='width:100%;display:none;z-index:22;position: fixed;top:0;left:0' onclick="$(this).hide()"/>
  </div>
</div>
</div>
</div>

<script>
  parent.$('#dhl').show();
  function timestampToTime(timestamp) {
            var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            Y = date.getFullYear() + '-';
            M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
            D = date.getDate() + ' ';
            h = date.getHours() + ':';
            m = date.getMinutes() + ':';
            s = date.getSeconds();
            return Y+M+D;
    };
    new Vue({
      el: '.page-group',
      data: {
      status:'0',
      gm:{
        'status':0,
        'credit1':0,
        'price':0,
        'dj':0,
      },
      buy:{
        'status':-1,
        'id':0,
        'gs':0,
        'jg':0,
        'zg':0,
      },
      pay:{
        'status':0,
      },
      gm_number:'0',
      aqmm:'0',
      list:'',
      id:'0',
      page:'1',
      zs:'',
      zl:'0',
      system:'0',
      pageSize:'100'
      },
      methods:{
        getData(id){
        if(id==9){
          $('.header_dh'+id).addClass("now").siblings().removeClass("now");
          this.gm_(1);
        }else{

          this.$http.post(wboos.url('user/buy/jy_lb'),{ad_id:49,id:id,page:this.page,pageSize:this.pageSize},{withCredentials: true}).then(function (response) {
              this.id = id;
              this.zs = response.body.zs;
              this.system = response.body.system;             
              this.list = response.body.jy;
              this.status = response.body.status;
              $('.header_dh'+id).addClass("now").siblings().removeClass("now");
          });
        }
        },
        want_buy(id){
        if(this.system==0){
                        wboos.toast('<?php echo lang('C2C交易暂未开放！'); ?>');return;
                     }
                    if(this.zs==1){
                        wboos.toast('<?php echo lang('无此权限！'); ?>');return;
                       }
          if(id==10){
            $('.header_dh8').addClass("now").siblings().removeClass("now");
            this.$http.post(wboos.url('user/buy/gm'),{id:1},{withCredentials: true}).then(function (response) {
                this.gm = response.body;
                this.gm.status = 2;
              });
          }else{
          if($('#wygm').val()==0 || $('#wygm').val()%100!==0 || $('#wygm').val()<99){
            wboos.toast('<?php echo lang('求购必须100的倍数起!'); ?>');
          }else if(this.aqmm_('want_buy')){
                       var pay =  $('input[name="pay"]:checked').val();
            this.$http.post(wboos.url('user/buy/wantbuy'),{gm_number:this.gm_number,pay:pay},{withCredentials: true}).then(function (response) {
              wboos.toast(response.body.msg);
              if(response.body.status==1){
                 this.getData(10);
                 this.gm.status = 0;
              }
            });
          }
          }
        },
        gm_(id){
        if(this.system==0){
                        wboos.toast('<?php echo lang('C2C交易暂未开放！'); ?>');return;
                     }
                  if(this.zs==1){
                        wboos.toast('<?php echo lang('无此权限！'); ?>');return;
                       }
        if(this.status==1){
          if(id==0){
            this.gm = '';
          }else if(id==1){
            this.$http.post(wboos.url('user/buy/gm'),{id:id},{withCredentials: true}).then(function (response) {
              this.gm = response.body;
              wboos.toast('<?php echo lang('请输入安全密码'); ?>');
            });
          }else if(id==2){
            if($('#wygm').val()==0 || $('#wygm').val()%100!==0 || $('#jz').text()<199){
              wboos.toast('<?php echo lang('挂卖必须200$起且为挂卖个数为100的倍数'); ?>');
            }else if($('#zc').text()-$('#wygm').val()<0){
              wboos.toast('<?php echo lang('NMCT通证不足！'); ?>');return;
            }else if(this.gm.level_money<this.gm_number){
              wboos.toast('<?php echo lang('单次挂卖金额不能超过会员级别！'); ?>');
            }else if(this.aqmm_()){
            var pay =  $('input[name="pay"]:checked').val();
            this.$http.post(wboos.url('user/buy/gm'),{id:id,gm_number:this.gm_number,pay:pay},{withCredentials: true}).then(function (response) {
              wboos.toast(response.body.msg);
              if(response.body.status==1){
                 this.getData(0);
                 this.gm_(0);
              }
            });
            }
          }
          }else{
            this.zl = 1;
          }
        },
        buy_(status,id){
        if(this.system==0){
                        wboos.toast('<?php echo lang('C2C交易暂未开放！'); ?>');return;
                     }
                  if(this.zs==1){
                        wboos.toast('<?php echo lang('无此权限！'); ?>');return;
                       }
        if(this.status==1){
          if(id>=0){
            this.buy = this.list[id];
          }
          if(status==14){
            this.buy.status = status;
          }
          if(status==-1){
            this.buy = '';
            this.aqmm = 0;
          }else if(status>=0 && this.aqmm_()){
            this.$http.post(wboos.url('user/buy/buy'),{id:this.buy.id,status:status},{withCredentials: true}).then(function (response) {
              wboos.toast(response.body.msg);
              if(response.body.status==1){
                 this.getData(status);
                 this.buy_(-1);
              }
            });
          }
          }else{
            this.zl = 1;
          }
        },
        pay_(status,id){
          if(this.system==0){
                        wboos.toast('<?php echo lang('C2C交易暂未开放！'); ?>');return;
                     }
                  if(this.zs==1){
                        wboos.toast('<?php echo lang('无此权限！'); ?>');return;
                       }
          if(status==-1){
            this.pay.status = 0;
            this.aqmm = 0;
          }else if(status==0){
              var list = this.list[id];
              this.pay.id = list.id;
              this.pay.lang = list.lang;
              this.pay.my_id = list.my_id;
              this.pay.user_id = list.user_id;
                          this.pay.pay = list.pay;
                          this.pay.token_address = list.token_address;
              this.pay.alipay = list.alipay;
                          this.pay.buy_mobile = list.buy_mobile;
                          this.pay.user_mobile = list.user_mobile;
              this.pay.yhk = list.yhk;
              this.pay.img = list.img;
              this.pay.gm = list.gm;
              this.pay.yhk_h = list.yhk_h;
              this.pay.yhk_name = list.yhk_name;
              this.pay.zg = list.zg;
              this.pay.status = list.status;
              console.log(this.pay);
          }else if(this.pay.gm==1 && this.pay.img==null){
              wboos.toast('<?php echo lang('请上传打款凭证'); ?>');
          }else if(status>=1 && this.aqmm_()){
            this.$http.post(wboos.url('user/buy/pay'),{id:this.pay.id,img:this.pay.img,status:this.pay.status},{withCredentials: true}).then(function (response) {
              wboos.toast(response.body.msg);
              console.log(this.pay.gm);
              if(response.body.status>0){
                this.getData(response.body.status);
                 this.pay_(-1);
              }
            });
          }
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
            this.pay.img = res.body.url;
            $('#ck_img').attr('src',wboos.url(res.body.url));
            //this.$set(this.pay, 'img',res.body.url);
            $('.fui-list-group').css('background','#42bd40').html("<div style='width:100%;height:100%;'onclick=\"$('#ck_img').show();\";>打款凭证</div>");
          }).catch(function(error){
            console.log(error);
          })
        },
        aqmm_(aqmm,black){
         if(aqmm>0){
          this.$http.post(wboos.url('user/buy/aqmm'),{aqmm:aqmm},{withCredentials: true}).then(function (response) {
            if(response.body.status==0){
              wboos.toast('<?php echo lang('安全密码错误'); ?>');
              $('#mm').val('');
            }else if(this.gm.status==1){
              console.log('this.gm.status==1');
              this.gm_(2);
            }else if(this.gm.status==2){
              console.log('this.gm.status==2');
              this.want_buy();
            }else if(this.buy.status>-1){
              console.log('this.buy.status==1');
              this.buy_(this.buy.status);
            }else if(this.pay.status>0){
              console.log('this.pay.status==1');
              this.pay_(this.pay.status);
            }
            this.aqmm = 0;
          });
         }else if($('#mm').val()=='' || this.aqmm == 0){
          // wboos.toast('请输入安全密码');
          this.aqmm = 1;  
          return false;
         }else{
          return true;
         }
      },
      },
      created:function () {
         this.getData(10);
      },
    })
</script>
    <!-- 默认必须要执行$.init(),实际业务里一般不会在HTML文档里执行，通常是在业务页面代码的最后执行 -->
    <script>$.init()</script></body>
</html>