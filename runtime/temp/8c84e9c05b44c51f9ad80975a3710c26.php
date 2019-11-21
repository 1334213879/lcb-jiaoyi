<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:81:"C:\Users\Administrator\Desktop\tpbt\public/../application/user\view\index\my.html";i:1574214652;}*/ ?>
<!DOCTYPE html>
<html style="height: 100%">
<head>
    <meta charset="utf-8">
    <title>NMCT和XMT双通证平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="/static/xmt/css/sm.min.css">
    <link rel="stylesheet" href="/static/xmt/css/sm-extend.css">
    <script type='text/javascript' src='/static/xmt/js/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/sm-extend.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/global.js?v=1.0.2' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/vue.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='/static/xmt/js/vue-resource.min.js' charset='utf-8'></script>
    <script type="text/javascript" src="/static/xmt/js/qrcode.js"></script>
    <link rel="stylesheet" href="/static/xmt/css/pages/my.css?v=1.02">
</head>
  <script>
    $(document).on("pageInit", "#wboos-page-my-members", function(e, id, page) {
        $('#wboos-page-my-members .wboos-btn-logout').off('click');
        $('#wboos-page-my-members .wboos-btn-logout').on('click', function() {                    
            wboos.httpRequest({
                url: '<?php echo url('user/index/logout'); ?>',
                type: 'post',
                data: {
                    wboos_hash: '<?php echo $wboos_hash; ?>'
                },
                success: function(res) {
                    if (res.status == 1) {
                        window.location.href = '<?php echo url('user/login/index'); ?>';
                        return true;
                    }
                    $.alert(res.msg);
                }                        
            });
        });
    });
</script>
<body>
<div class="page-group">

<div id="topvue">

    <div class="page page-current wboos-page-my-members" id="wboos-page-my-members">
    
        <div class="content">
            <header class="bar-nav">               
                <h1 class="title"><?php echo lang('我的资料'); ?></h1>
                <a href="#page-setting" class="modify_selfinfo"><i><img src="/static/xmt/images/personal.png" alt=""></i></a>
            </header>

            <div class="content-block" style="padding:0;background: #fff;">
                <div class="card">
                    <div class="card-content">
                        <div class="card-content-inner">
                           <div class="u-pic">
                              <img v-bind:src="setDefaultImg(user.head_pic)" onerror="javascript:this.src='/static/xmt/images/avatar.png';"/>
                            </div>

                           <div class="username">
                            <span><?php echo lang('欢迎'); ?>，<?php echo $userInfo['nickname']; ?></span>
                            <span><?php echo lang('会员ID'); ?>:<?php echo $userInfo['user_id']; ?></span>
                           </div>
                           <div class="user-info">
                            <span>V<?php echo $userInfo['level']-1; ?><?php echo lang('会员'); ?></span>
                            
                            <span v-if="user.g>0">G{{user.g}}</span>
                            
                            <!-- 这里有一条VUE数据 -->
                            
                            
                           </div>
                           <div class="user-info" style="top: 38%;right: -1rem;">
                                <span><a class="page-upgrade" href="#page-upgrade"><?php echo lang('升级'); ?></a></span>
                           </div>                      
                        </div>
                    </div>
                </div>
            </div>


            <div class="record">
                <div class="row1">
                    <a class="page-nmct-record" href="#page-nmct-record"><i><img src="/static/xmt/images/record1.png" alt=""></i><?php echo lang('NMCT记录'); ?></a>
                    <a class="page-usdt-record" href="#page-usdt-record"><i><img src="/static/xmt/images/record2.png" alt=""></i><?php echo lang('USDT记录'); ?></a>
                    <a class="page-active" href="#page-active"><i><img src="/static/xmt/images/active_icon.png" alt=""></i><?php echo lang('激活'); ?></a>
                </div>
            </div>

            <div class="list-block" style="width: 100%;margin:0">
                <div class="list-group">
                    <ul>
                        <li>
                            <a class="page-pic" href="#page-pic">
                                <div class="item-content item-link">
                                    <div class="item-inner">
                                        <div class="item-title"><i><img src="/static/xmt/images/pcon1.png" alt=""></i><span><?php echo lang('头像设置'); ?></span></div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>                         
                            <a href="#page-bind-card">
                                <div class="item-content item-link">
                                    <div class="item-inner">
                                        <div class="item-title">
                                            <i><img src="/static/xmt/images/bankcard.png" alt=""></i>
                                            <span><?php echo lang('绑定银行卡'); ?></span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-password" href="#page-change-password">
                                <div class="item-content item-link">
                                    <div class="item-inner">
                                        <div class="item-title"><i><img src="/static/xmt/images/pcon2.png" alt=""></i> <span><?php echo lang('修改密码'); ?></span></div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-change-security-password" href="#page-change-security-password">
                                <div class="item-content item-link">
                                    <div class="item-inner">
                                        <div class="item-title"><i><img src="/static/xmt/images/pcon3.png" alt=""></i> <span><?php echo lang('安全密码'); ?></span></div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        
                        <li>
                            <a class="page-activeaccount" href="#page-activeaccount">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon4.png" alt=""></i> <span><?php echo lang('直推好友'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                        <li>
                        <a class="page-gl" href="#page-gl">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon5.png" alt=""></i> <span><?php echo lang('管理好友'); ?></span></div>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li>
                        <a class="page-invite" href="#page-invite">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon6.png" alt=""></i> <span><?php echo lang('邀请好友'); ?></span></div>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li>
                        <a class="page-invite" href="#page-tdyj">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/tdyj.png" alt=""></i> <span><?php echo lang('团队业绩'); ?></span></div>
                                </div>
                            </div>
                        </a>
                        </li>                        
                        <li>
                            <a class="page-cz" href="#page-cz">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon7.png" alt=""></i> <span><?php echo lang('充值记录'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-hongbao" href="#page-hongbao">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon8.png" alt=""></i> <span><?php echo lang('红包记录'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-ft" href="#page-ft">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon9.png" alt=""></i> <span><?php echo lang('复投记录'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-c2c" href="#page-c2c">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon10.png" alt=""></i> <span><?php echo lang('C2C记录'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-xmt" href="#page-xmt">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon11.png" alt=""></i> <span><?php echo lang('XMT记录'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a class="page-vip" href="#page-vip">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon12.png" alt=""></i> <span><?php echo lang('VIP记录'); ?></span></div>
                                </div>
                            </div>
                            </a>
                        </li>
                         <li>
                        <a class="page-version" href="#page-gy">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon13.png" alt=""></i><span><?php echo lang('关于系统'); ?></span></div>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li>
                        <a class="page-invite" href="#page-lxkf">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/lxkf.png" alt=""></i> <span><?php echo lang('联系客服'); ?></span></div>
                                </div>
                            </div>
                        </a>
                        </li>
                        <li>
                        <a class="page-version" href="#page-version">
                            <div class="item-content item-link">
                                <div class="item-inner">
                                    <div class="item-title"><i><img src="/static/xmt/images/pcon14.png" alt=""></i><span><?php echo lang('版本更新'); ?></span></div>
                                </div>
                            </div>
                        </a>
                        </li>
                    </ul>
                </div>
                <p class="wboos-p-btn"><a class="button button-fill button-wboos wboos-btn-logout"><?php echo lang('退出登录'); ?></a></p>
            </div>   


        </div>
        
        <!-- content end -->
    </div>
    <!-- page end -->

<div class="app">

        <div class="page" id="page-invite">
                <div class="content">
                    <header class="bar bar-nav">
                        <a class="icon pull-left back"></a>
                        <h1 class="title"><?php echo lang('邀请好友'); ?></h1>
                    </header>
                    <div style="padding-top: 3rem;text-align: center;font-size: 14px;line-height: 2;">        
                    <div style="width: 96%;margin:0 auto;font-size: 14px;line-height: 2;text-align: center;">
                <h3 style="text-align:center;"><?php echo lang('邀请好友拿奖金，注册就送88'); ?></h3>  
                <div class="qrcode" style="width: 200px;margin:0 auto">
                    <div id="qrcode" style="width:180px; height:180px;margin:0 auto"></div>
                </div>
                <div style="position: absolute;top: 0;left: 0;opacity: 0;z-index: -10;" id="content">
                    {{link}}
                </div>
                <div class="invite-btn" style="margin:auto;text-align:center;color: #f6383a;padding: 5px 10px;margin-top: 0.6rem;" @click="copy()">
                   <?php echo lang('点击复制分享链接'); ?>
                </div>
                </div>
                    <br>
                    <br>
                    <br>
                </div>
                </div>
                </div>

        <div class="page" id="page-tdyj">
            <div class="content">
                <header class="bar bar-nav">
                    <a class="icon pull-left back"></a>
                    <h1 class="title"><?php echo lang('团队业绩'); ?></h1>
                </header>
                <div style="padding-top: 3rem;text-align: center;font-size: 14px;line-height: 2;">
                    <ul class="square">
                        <li>
                            <span><?php echo lang('团队总业绩（USDT）'); ?></span>
                            <p>{{t.t2}}</p>
                        </li>
                        <li>
                            <span><?php echo lang('累计邀请'); ?></span>
                            <p>{{t.t1}}人</p>
                        </li>
                        <li>
                            <span><?php echo lang('大市场业绩（USDT）'); ?></span>
                            <p>{{t.t4}}</p>
                        </li>
                        <li>
                            <span><?php echo lang('小市场业绩（USDT）'); ?></span>
                            <p>{{t.t3}}</p>
                        </li>
                    </ul> 
                </div>
                <h2 style="text-align: center;font-size: 14px;"><?php echo lang('团队业绩明细'); ?></h2>
                <div class="content-block" style="padding:1px .5rem 2rem; margin: 0">
                   <table style="background:aliceblue;" class="usdt_yj">
                        <tr>
                            <th  width="10%"><?php echo lang('头像'); ?></th>
                            <th  width="25%"><?php echo lang('昵称'); ?></th>
                            <th  width="15%">ID</th>
                            <th  width="15%"><?php echo lang('VIP等级'); ?></th>
                            <th  width="35%"><?php echo lang('充值USDT'); ?></th>
                        </tr>
                        <tr v-for="a in team">
                            <td class="img-td"><img v-bind:src="setDefaultImg(a.head_pic)"></td>
                            <td>{{a.nickname}}</td>
                            <td>{{a.user_id}}</td>
                            <td>VIP{{a.level-1}}</td>
                            <td>{{parseInt(a.money_cz)}}</td>
                        </tr>
                    </table>           
          </div>
            </div>  
        </div>

        <div class="page" id="page-lxkf">
            <div class="content">
                <header class="bar bar-nav">
                    <a class="icon pull-left back"></a>
                    <h1 class="title"><?php echo lang('联系客服'); ?></h1>
                </header>
                <div class="list-block">
                    <ul>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label" style="width: 50%!important;"><?php echo lang('QQ客服'); ?></div>
                                    <div class="item-input">
                                        <?php echo lang('点击联系'); ?>&gt;
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label" style="width: 50%!important;"><?php echo lang('微信客服'); ?></div>
                                    <div class="item-input">
                                        <?php echo lang('点击联系'); ?>&gt;
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>  
        </div>

        <div class="page" id="page-gy">
        <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('系统介绍'); ?></h1>
            </header>
        <div style="width: 96%;margin:3rem auto 0;line-height: 2.5;font-size:14px;">
            <h3><?php echo lang('邀友越多赚取越多'); ?></h3>   
            <p><?php echo lang('1、邀请好友开启社区三生万物！双赢双益'); ?></p>      
            <p><?php echo lang('2、US.NMCT国际社区收益多样化，分享奖金（分享奖金/社区管理奖）更是丰富无穷！领略社区收益奖金的魅力！进入NMCT社区文化的魅力！'); ?></p> 
            <p><?php echo lang('3、US.NMCT新媒体国际社区俱乐部是由全球多个国家的区块链底层技术研究院共同研发并认证的一个涵盖全球的超级社区！美国新媒体俱乐部强强联手与亚泰东盟集团，为NMCT新媒体促进长久、稳定的社区俱乐部平台做出合作！'); ?></p>
            <h3><?php echo lang('US.NMCT CLUB期待您的加入！'); ?></h3>
        </div>      
      <br>
    </div>
</div>

        <div class="page" id="page-activeaccount">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('我的社区'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px .5rem 2rem;">
           <table>
                <tr>
                    <th  width="10%"><?php echo lang('头像'); ?></th>
                    <th  width="25%"><?php echo lang('昵称'); ?></th>
                    <th  width="15%">ID</th>
                    <th  width="15%"><?php echo lang('VIP等级'); ?></th>
                    <th  width="35%"><?php echo lang('时间'); ?></th>
                </tr>
                <tr v-for="a in team">
                    <td class="img-td"><img v-bind:src="setDefaultImg(a.head_pic)"></td>
                    <td>{{a.nickname}}</td>
                    <td>{{a.user_id}}</td>
                    <td>VIP{{a.level-1}}</td>
                    <td>{{timestampToTime1(a.reg_time)}}</td>
                </tr>
            </table>           
          </div>
        </div>

        <div class="page" id="page-cz">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('充值记录'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:0 1rem 2rem;">
            <li v-for="a in list" v-if="a.type==1">
                <p class="source">
                    <span class="charge-style">{{a.title}}</span>
                    <span class="timestamp">{{timestampToTime(a.time)}}</span> <br>
                        <span class="money-num" v-if="a.usdt!=0">{{int_(a.usdt)}}</span>
                        <span class="money-num" v-if="a.nmct!=0">{{int_(a.nmct)}}</span>
                        <span class="money-num" v-if="a.xmt!=0">{{int_(a.xmt)}}</span>
                        <span class="money-num" v-if="a.nmct_dj!=0">{{int_(a.nmct_dj)}}</span>

                </P>
            </li>
          </div>
        </div>

        <div class="page" id="page-c2c">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('C2C记录'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px 1rem 2rem;">
                <li v-for="a in list" v-if="a.type==20">
                     <p class="source">
                        <span>{{a.title}}</span>
                        <span>{{timestampToTime(a.time)}}</span>
                    </p>
                    <p style="width:100%;margin:0;font-size: 14px;">
                        <span class="money-num">
                            <span v-if="a.usdt!=0">USDT&nbsp;{{int_(a.usdt)}}</span>
                            <span v-if="a.nmct!=0"><?php echo lang('NMCT通证'); ?>&nbsp;{{int_(a.nmct)}}</span>
                            <span v-if="a.xmt!=0"><?php echo lang('XMT通证'); ?>&nbsp;{{int_(a.xmt)}}</span>
                            <span v-if="a.nmct_dj!=0"><?php echo lang('NMCT资产'); ?>&nbsp;{{int_(a.nmct_dj)}}</span>
                        </span>
                    </P>
                   
                </li>   
          </div>
        </div>

        <div class="page" id="page-xmt">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('XMT记录'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px 1rem 2rem;">
                <li v-for="a in list" v-if="a.xmt!=0">
                     <p class="source">
                        <span>{{a.title}}</span>
                        <span>{{timestampToTime(a.time)}}</span>
                    </p>
                    <p style="width:100%;margin:0;font-size: 14px;">
                        <span class="money-num">
                            <span v-if="a.usdt!=0">USDT&nbsp;{{int_(a.usdt)}}</span>
                            <span v-if="a.nmct!=0"><?php echo lang('NMCT通证'); ?>&nbsp;{{int_(a.nmct)}}</span>
                            <span v-if="a.xmt!=0"><?php echo lang('XMT通证'); ?>&nbsp;{{int_(a.xmt)}}</span>
                            <span v-if="a.nmct_dj!=0"><?php echo lang('NMCT资产'); ?>&nbsp;{{int_(a.nmct_dj)}}</span>
                        </span>
                    </P>                   
                </li>   
          </div>
        </div>

        <div class="page" id="page-hongbao">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('领取红包记录'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px 1rem 2rem;">
                <li v-for="a in list" v-if="a.type==6" class="list_hb">
                    <p class="source">
                        <span>{{a.title}}</span>
                        <span>{{timestampToTime(a.time)}}</span>                       
                    </p>
                    <p style="width:100%;margin:0;font-size: 14px;">                        
                        <span class="money-num">
                            <span v-if="a.usdt!=0">USDT&nbsp;{{int_(a.usdt)}}</span>
                            <span v-if="a.nmct!=0"><?php echo lang('NMCT通证'); ?>&nbsp;{{int_(a.nmct)}}</span>
                            <span v-if="a.xmt!=0"><?php echo lang('XMT通证'); ?>&nbsp;{{int_(a.xmt)}}</span>
                            <span v-if="a.nmct_dj!=0"><?php echo lang('NMCT资产'); ?>&nbsp;{{int_(a.nmct_dj)}}</span>
                        </span>
                    </p>                    
                </li>   
          </div>
        </div>

        <div class="page" id="page-ft">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('复投记录'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px 1rem 2rem;">
                <li v-for="a in list" v-if="a.type==7" class="list_hb">
                    <p class="source">
                        <span>{{a.title}}</span><span>{{timestampToTime(a.time)}}</span>
                    </p>
                    <p style="width:100%;margin:0;font-size: 14px;">
                        <span class="money-num">
                            <span v-if="a.usdt!=0">USDT&nbsp;{{int_(a.usdt)}}</span>
                            <span v-if="a.nmct!=0"><?php echo lang('NMCT通证'); ?>&nbsp;{{int_(a.nmct)}}</span>
                            <span v-if="a.xmt!=0"><?php echo lang('XMT通证'); ?>&nbsp;{{int_(a.xmt)}}</span>
                            <span v-if="a.nmct_dj!=0"><?php echo lang('NMCT资产'); ?>&nbsp;{{int_(a.nmct_dj)}}</span>
                        </span>
                    </P>
                   
                </li>   
          </div>
        </div>

        <div class="page" id="page-vip">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('VIP记录'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px 1rem 2rem;">
                <li v-for="a in list" v-if="a.type==5">
                    <p class="source">
                        <span>{{a.title}}</span><span>{{timestampToTime(a.time)}}</span>
                    </p>
                    <p style="width:100%;margin:0;font-size: 14px;">
                        <span class="money-num">
                            <span v-if="a.usdt!=0">USDT&nbsp;{{int_(a.usdt)}}</span>
                            <span v-if="a.nmct!=0"><?php echo lang('NMCT通证'); ?>&nbsp;{{int_(a.nmct)}}</span>
                            <span v-if="a.xmt!=0"><?php echo lang('XMT通证'); ?>&nbsp;{{int_(a.xmt)}}</span>
                            <span v-if="a.nmct_dj!=0"><?php echo lang('NMCT资产'); ?>&nbsp;{{int_(a.nmct_dj)}}</span>
                        </span>
                    </P>
                   
                </li>   
          </div>
        </div>

        <div class="page" id="page-gl">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('管理好友'); ?></h1>
            </header>
          <div class="content-block" style="margin-top: 3rem;padding:1px .5rem 2rem;">
           <table>
                <tr>
                    <th width="10%"><?php echo lang('头像'); ?></th>
                    <th width="25%"><?php echo lang('昵称'); ?></th>
                    <th width="15%">ID</th>
                    <th width="15%"><?php echo lang('合伙人'); ?></th>
                    <th width="35%"><?php echo lang('时间'); ?></th>
                </tr>
                <tr v-for="a in team" v-if="a.g>0">
                    <td class="img-td"><img v-bind:src="setDefaultImg(a.head_pic)"></td>
                    <td>{{a.nickname}}</td>
                    <td>{{a.user_id}}</td>
                    <td>G{{a.g}}</td>
                    <td>{{timestampToTime1(a.reg_time)}}</td>
                </tr>
            </table>           
          </div>
        </div>

        <div class="page" id="page-version">
     <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back "></a>
                <h1 class="title"><?php echo lang('系统版本'); ?></h1>
            </header>
            <div class="list-block">
                <ul>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label" style="width: 50%!important;"><?php echo lang('系统版本'); ?></div>
                                <div class="item-input">
                                    2.0.1
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
     </div>
    </div>

        <div class="page" id="page-change-password">
        <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back "></a>
                <h1 class="title"><?php echo lang('修改登录密码'); ?></h1>
            </header>
            <form method="post" action="<?php echo url('user/set/repass'); ?>">
                <div class="list-block">
                    <ul>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('原登录密码'); ?></div>
                                    <div class="item-input">
                                        <input type="password" name="nowpass" placeholder="<?php echo lang('请输入原登录密码'); ?>" maxlength=20>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('新密码'); ?></div>
                                    <div class="item-input">
                                        <input type="password" name="pass" placeholder="<?php echo lang('请输入5-20位的新密码'); ?>" maxlength=20>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('确认密码'); ?></div>
                                    <div class="item-input">
                                        <input type="password" name="repass" placeholder="<?php echo lang('请输入确认密码'); ?>" maxlength=20>
                                    </div>
                                </div>
                            </div>
                        </li>
                      
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('短信验证码'); ?></div>
                                    <div class="item-input send_yzm_pw1">
                                        <input type="text" style="width:50%;float:left;" name="sms" maxlength="6">
                                        <div class='send_yzm_pw' onclick="send_phone_pw()"><span id='modify_pw' style='text-align:right;'><?php echo lang('获取验证码'); ?></span></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <p class="wboos-p-btn"><input type="submit" class="button button-fill button-wboos"  value="<?php echo lang('保 存'); ?>" /></p>
                
                </div>
            </form>
        </div>
    </div>

        <div class="page" id="page-setting">
        <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('修改个人资料'); ?></h1>
            </header>
            <form method="post" action="<?php echo url('user/set/index'); ?>">
            <div class="list-block" style="padding:0">
                <ul>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('账号'); ?></div>
                                <div class="item-input">
                                    <input type="text" name="mobile" value="<?php echo $userInfo['mobile']; ?>" placeholder="<?php echo lang('请输入您的账号'); ?>">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('姓名'); ?></div>
                                <div class="item-input">
                                    <input type="text" name="xm" value="<?php echo $userInfo['xm']; ?>" placeholder="<?php echo lang('请输入您的姓名'); ?>" maxlength="60">
                                </div>
                            </div>
                        </div>
                    </li>
                     <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('昵称'); ?></div>
                                <div class="item-input">
                                    <input type="text" name="nickname" value="<?php echo $userInfo['nickname']; ?>" placeholder="<?php echo lang('请输入您的昵称'); ?>" maxlength="60">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('邮箱地址'); ?></div>
                                <div class="item-input">
                                    <input type="text" name="email" value="<?php echo $userInfo['email']; ?>" placeholder="<?php echo lang('请输入您的邮箱地址'); ?>" maxlength=60>
                                </div>
                            </div>
                        </div>
                    </li>
                     <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('电子钱包地址'); ?></div>
                                <div class="item-input">
                                    <input type="text" name="token_address" value="<?php echo $userInfo['token_address']; ?>" placeholder="<?php echo lang('请输入您电子钱包地址'); ?>" maxlength="225">
                                </div>
                            </div>
                        </div>
                    </li>
                    <!-- <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('支付宝账号'); ?></div>
                                <div class="item-input">
                                    <input type="text" name="alipay" value="<?php echo $userInfo['alipay']; ?>" placeholder="<?php echo lang('请输入您的支付宝账号'); ?>" maxlength="20">
                                </div>
                            </div>
                        </div>
                    </li> -->
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('短信验证码'); ?></div>
                                <div class="item-input send_yzm1">
                                    <input type="text" style="width:50%;float:left;" id="sms1" name="sms" placeholder="<?php echo lang('请输入验证码'); ?>" maxlength="6">
                                    <div class='send_phone1' onclick="send_phone(1)"><span id='zphone1' style='text-align:right;'><?php echo lang('获取验证码'); ?></span></div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <p class="wboos-p-btn"><input type="submit" class="button button-fill button-wboos" value="<?php echo lang('保 存'); ?>"/></p>
            </div>
            </form>
        </div>
    </div>
    
        <div class="page" id="page-change-security-password">
        <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php if($userInfo['aqmm'] ==''): ?><?php echo lang('设置'); else: ?><?php echo lang('修改'); endif; ?><?php echo lang('安全密码'); ?></h1>
            </header>
        </div>
        <form method="post" action="<?php echo url('user/set/aqmm'); ?>">
            <div class="list-block">
                <ul>
                    <?php if($userInfo['aqmm'] !=''): ?>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('登录密码'); ?></div>
                                <div class="item-input">
                                    <input type="password" name="nowpass" placeholder="<?php echo lang('登录密码'); ?>" >
                                </div>
                            </div>
                        </div>
                    </li>
                    <?php endif; ?>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('安全密码'); ?></div>
                                    <div class="item-input">
                                        <input type="password" name="pass" placeholder="<?php echo lang('请输入安全密码（6位数字）'); ?>" onkeyup="value=value.replace(/[^\d]/g,'');" maxlength=6>
                                    </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label"><?php echo lang('确认密码'); ?></div>
                                <div class="item-input">
                                    <input type="password" name="repass" placeholder="<?php echo lang('请输入确认密码'); ?>" onkeyup="value=value.replace(/[^\d]/g,'');" maxlength=6>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <p class="wboos-p-btn"><input type="submit" class="button button-fill button-wboos" value="<?php echo lang('保 存'); ?>"/></p>
            </div>
        </form>
    </div>

        <div class="page" id="page-bind-card">
        <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('绑定银行卡'); ?></h1>
            </header>
            <form method="post" action="<?php echo url('user/set/yhk'); ?>">
                <div class="list-block">
                    <ul>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('所在银行'); ?></div>
                                    <div class="item-input">
                                        <?php if(empty($yz['yh'])) { $yz['yh'] = ''; }?>
                                        <select lay-filter="aihao" name="yh" id="yh" class="layui-input">
                                            <option value=""><?php echo lang('请选择所在银行'); ?></option>
                                            <?php
                                            $banks = [
                                                lang("工商银行"),
                                                lang("农业银行"),
                                                lang("建设银行"),
                                                lang("中国银行"),
                                                lang("光大银行"),
                                                lang("中信实业银行"),
                                                lang("恒丰银行"),
                                                lang("兴业银行"),
                                                lang("交通银行"),
                                                lang("民生银行"),
                                                lang("华夏银行"),
                                                lang("农村商业"),
                                                lang("邮政银行")
                                            ];
                                            foreach($banks as $key => $name) {
                                                if($name == $yz['yh']) {
                                                    $selected = ' selected = "selected"';
                                                } else {
                                                    $selected = '';
                                                }

                                                echo ('<option value="' . $name . '" ' . $selected . '>' . $name . '</option>');
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('持卡姓名'); ?></div>
                                    <div class="item-input">
                                        <?php if(empty($yz['name'])) { $yz['name'] = ''; }?>
                                        <input type="text" name="name" placeholder="<?php echo lang('请输入持卡姓名'); ?>" value="<?php echo $yz['name']; ?>" maxlength=60>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('银行卡账号'); ?></div>
                                    <div class="item-input">
                                        <?php if(empty($yz['yhk'])) { $yz['yhk'] = ''; }?>
                                        <input type="text" name="yhk" placeholder="<?php echo lang('请输入银行卡账号'); ?>" value="<?php echo $yz['yhk']; ?>" maxlength=60/>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-name"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label"><?php echo lang('短信验证码'); ?></div>
                                    <div class="item-input send_yzm2">
                                        <input type="text" name="sms" maxlength="6" placeholder="<?php echo lang('请输入短信验证码'); ?>">
                                        <div class='send_phone2' onclick="send_phone(2)" style="position: absolute;right: 0;top: 0"><span id='zphone2' style='text-align:right;'><?php echo lang('获取验证码'); ?></span></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <p class="wboos-p-btn"><input type="submit" class="button button-fill button-wboos" value="<?php echo lang('保 存'); ?>"/></p>
                </div>
            </form>
        </div>
    </div>

        <div class="page" id="page-pic">
        <div class="content">
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a>
                <h1 class="title"><?php echo lang('修改个人头像'); ?></h1>
            </header>
            <form method="post" action="<?php echo url('user/set/avatar'); ?>">
            <div class="list-block">
                    <div class="item-content">
                        <div class="avatar-add" style="width:96%;">
                            <p></p>
                            <p><?php echo lang('建议尺寸168*168，支持jpg、png、gif，最大不能超过30KB'); ?></p>
                            <div class="upload-img" style="margin-bottom: 15px;">
                                <input type="file" id="LAY-file" accept="image*/" lay-title="<?php echo lang('上传头像'); ?>" style="display: none;">
                            </div>
                            <?php if($userInfo['head_pic']): ?>
                            <div class="picboxbg">
                               <img style="width:120px;height:120px" id='pic' src="<?php echo imgUrl($userInfo['head_pic']); ?>"> 
                            </div>                            
                            <input id="head_pic" type="text" name="head_pic" value="<?php echo imgUrl($userInfo['head_pic']); ?>" style="display:none;">
                            <?php else: ?>
                            <div class="picboxbg">
                                <img style="width:120px;height:120px" id='pic' src="/static/xmt/images/avatar.png">
                            </div>                            
                            <input id="head_pic" type="text" name="head_pic" value="" style="display:none;">
                            <?php endif; ?>
                        </div>

                    </div>
                    <p class="wboos-p-btn"><input type="button" class="button button-fill button-wboos" id="choose" value="<?php echo lang('选择头像'); ?>" @click="triggerclick();"/></p>
                    <p class="wboos-p-btn"><input type="submit" class="button button-fill button-wboos" value="<?php echo lang('保 存'); ?>"/>
                    </p>
                      
               </div>
              </form>
        </div>
    </div>

</div>
</div>
<div id="addpage">

<div class="page" id="page-usdt-record">
        <div class="content">
        <!-- usdt记录页面 -->
            <header class="bar bar-nav">
                <a class="icon pull-left back"></a> 
                <h1 class="title"><?php echo lang('USDT记录'); ?></h1>
            </header>
            <div class="content-block">
                <div class="list-block" style="">
                 <ul class="record-list">
                    <li v-for="a in list" v-if="a.usdt!=0 || a.type==5">                        
                        <p class="source">
                            <span>{{a.title}}</span><span>{{a.time|timestampToTime}}</span>                 
                        </p>
                        <p style="width:100%;margin:0;font-size: 14px;">
                            <span class="money-num">
                                <span v-if="a.usdt!=0">{{a.usdt|int_}}&nbsp;USDT</span>
                            </span>
                        </p>
                    </li>                   
                 </ul>
                </div>
            </div>    
        <!-- usdt记录页面end-->
        </div>
    </div>


<div class="page" id="page-nmct-record">
    <div class="content">
<!-- nmct记录页面 -->
    <header class="bar bar-nav">
        <a class="icon pull-left back"></a>
        <h1 class="title"><?php echo lang('NMCT记录'); ?></h1>
    </header>
    <div class="content-block">
        <div class="list-block" style="padding:0">
            <ul class="record-list">
                <li v-for="a in list" v-if="a.nmct!=0 || a.nmct_dj!=0 || a.xmt!=0">
                    <p class="source">
                        <span>{{a.title}}</span>
                        <span>{{a.time|timestampToTime}}</span>
                    </p>
                    <p style="width:100%;font-size: 14px;margin:0">
                        <span class="money-num">
                            <span v-if="a.nmct!=0"><?php echo lang('NMCT通证'); ?>&nbsp;{{a.nmct|int_}}</span>
                            <span v-if="a.xmt!=0"><?php echo lang('XMT通证'); ?>&nbsp;{{a.xmt|int_}}</span>
                            <span v-if="a.nmct_dj!=0"><?php echo lang('NMCT资产'); ?>&nbsp;{{a.nmct_dj|int_}}</span>
                        </span>
                    </p>
                    
                </li>       
             </ul>
        </div>
     </div>
<!-- nmct记录页面end-->
    </div>
</div>


<!-- 激活 -->
<div class="page" id="page-active">
    <div class="content">
    <header class="bar bar-nav">
        <a class="icon pull-left back"></a>
        <h1 class="title"><?php echo lang('激活会员'); ?></h1>
    </header>
    <div class="buttons-tab" style="margin-top: 3rem;">
        <a href="#cz_1" class="tab-link active button"><?php echo lang('购买激活码'); ?></a>
        <a href="#cz_2" class="tab-link button"><?php echo lang('我的激活码'); ?></a>
        <a href="#cz_3" v-if="user.pass==0" class="tab-link button"><?php echo lang('激活帐号'); ?></a>
    </div>
    <div class="content-block">
        <div class="tabs">
            <div id="cz_1" class="tab active">
                <div class="trans-info" style="margin-top:1rem">
                    <div class="trans-pic">
                        <img src="/static/xmt/images/transfer.png" alt="">
                    </div>
                    <p><?php echo lang('购买激活码（10USDT一枚）'); ?></p>
                    <span><?php echo lang('请输入购买数量'); ?>：</span>
                    <input type="number" id="jh_1" class="trans-num" />
                </div>
                <div class="btns">
                    <a @click="zc_(4);" class="confirm"><?php echo lang('确定购买'); ?></a>
                </div>
            </div>

            <div id="cz_2" class="tab">
                <p v-for="(a,i) in code">
                    <?php echo lang('激活码'); ?>：{{a.code}}
                    <span style="float:right" v-if="a.status==0"><?php echo lang('已使用'); ?></span>
                    <span style="float:right" v-else><?php echo lang('未使用'); ?></span>
                </p>
            </div>

            <div id="cz_3" class="tab">
                <div class="trans-info">
                    <div class="trans-pic">
                        <img src="/static/xmt/images/transfer.png" alt=""/>
                    </div>
                    <p><?php echo lang('激活帐号'); ?></p>
                    <span><?php echo lang('请输入激活码'); ?>：</span>
                    <input type="text" id="jh_2" class="trans-num" />
                </div>
                <div class="btns">                  
                    <a @click="zc_(5);" class="confirm"><?php echo lang('确定激活'); ?></a>
                </div>
            </div>

        </div>
    </div>
</div>
</div>
<!-- 激活 -->


<!-- 升级VIP -->
<div class="page" id="page-upgrade">
    <header class="bar bar-nav">
        <a class="icon pull-left back"></a>
        <h1 class="title"><?php echo lang('升级VIP'); ?></h1>
    </header>
    <div class="trans-info">
        <div class="trans-pic">
            <img src="/static/xmt/images/transfer.png" alt=""/>
        </div>
        <p><?php echo lang('当前级别VIP'); ?>{{user.level-1}}</p>
        <span><?php echo lang('请选择升级VIP'); ?>：</span>
         <select name="level" @change="$('#level_usdt').val(level_.money)" v-model='level_'>
            <option v-for="a in level" v-bind:value="a">{{a.level_name}}（{{a.money}}USDT）</option>
        </select>
		<p><?php echo lang('至少需要一半USDT'); ?></p>
        <span><?php echo lang('支付USDT'); ?>：</span>
        <input type="number" id="level_usdt" @keyup="level_2=(level_.money-$('#level_usdt').val())/system.money_xmt" class="trans-num" />
		<br>
		<span><?php echo lang('所需XMT'); ?>：{{level_2}}</span>
    </div>
    <div class="btns">
        <a @click="zc_(6);" class="confirm"><?php echo lang('确定转出'); ?></a>
    </div>
</div>
<!-- 升级VIP END -->

</div>

</div>

<script type="text/javascript">
     function triggerclick(){
          $('#LAY-file').trigger('click'); 
     }
</script>
<script type="text/javascript">
function int_(i){
    if(i>0){
        return '+'+i;
    }else if(i<0){
        return i;
    }
}
var submitDatas = function(id,_target, callback) {
    wboos.httpRequest({
        url: _target.attr('action'),
        type: 'post',
        data: _target.serialize(),
        success: function(res) {
            if(res.status != 1) {
                wboos.toast(res.msg);
                return false;
            }

            if(typeof callback != 'function') {
                callback = function() {
                    //location.href='./my.html';
                    $('.').click();
                }
            }
            wboos.toast('修改成功', callback);
            //document.write($("#page-setting").next().attr('id')); 
            //var n = $('#'+id).next().attr('id');
            //if(n==''){
            //  wboos.toast('修改成功', callback);
            //}else{
            //  $('.'+n).click();
            //}
            //wboos.toast(res.msg, callback);
        }
    })
}
$(document).on("pageInit", "#page-pic", function(e, id, page) {
    $("#LAY-file").change(function(){
        var formData = new FormData();    
        formData.append("file", $(this).get(0).files[0]);
        $.ajax({
            url:"<?php echo url('user/index/upload'); ?>",
            type:'POST',
            data:formData,
            cache: false,
            contentType: false,    //不可缺
            processData: false,    //不可缺
            dataType:'json',
            success:function(data){
                $('#pic').attr('src',""+data.url+"");
                $('#head_pic').val(""+data.url+"");
            }
        });
    })
    $('#page-pic form').off('submit');
    $('#page-pic form').on('submit', function() {
        var pic = $('#pic').attr('src');
        if(!pic) {
            wboos.toast(pic.attr('<?php echo lang('未选择头像'); ?>'));
            return false;
        }
        $("#hh").text("#page-pic");
        submitDatas(id,$(this));
        return false;
    })
});
function send_phone(id){
    if(id==1){
        var mobile = $('input[name="mobile"]').val();
        var xm = $('input[name="xm"]');
        var nickname = $('input[name="nickname"]');
       // var alipay = $('input[name="alipay"]');
        if(!xm.val()) {
            wboos.toast(xm.attr('placeholder'));
            return false;
        }
        if(!nickname.val()) {
            wboos.toast(nickname.attr('placeholder'));
            return false;
        }
        /* if(!alipay.val()) {
            wboos.toast(alipay.attr('placeholder'));
            return false;
        } */
        var content = '<?php echo lang('修改资料'); ?>';
    }else{
        var mobile="<?php echo $userInfo['mobile']; ?>";
        var content = '<?php echo lang('修改银行卡资料'); ?>';
    }
    if(mobile=="" || !/^(13[0-9]|14[0-9]|15[0-9]|17[0-9]|18[0-9])\d{8}$/i.test(mobile)){
        wboos.toast('<?php echo lang('请填写正确手机号码'); ?>',{time:1800});
    }else{
        $.post("<?php echo url('user/login/sendEmail'); ?>",{email:mobile,content:content},function(res){
            if(res.code > 0){
                wboos.toast(res.msg,{time:1800});
                $('.send_phone'+id).remove();
                //$('.send_yzm'+id).append("<div class="'send_phone'+id+"><span id="'zphone'+id+" style='color:#50b936;text-align:right;'>输入验证码</span></div>");
                $('.send_yzm'+id).append('<div class="send_phone'+id+'"><span id="zphone'+id+'" style="color:#50b936;text-align:right;"><?php echo lang('输入验证码'); ?></span></div>');
            }else{
                wboos.toast(res.msg,{time:1800});
            }
        });
    }
}
  
function send_phone_pw(){
    var oldpwd = $('input[name="nowpass"]');
    if(!oldpwd.val()) {
        wboos.toast(oldpwd.attr('placeholder'));
        return false;
    }
    var newpwd = $('input[name="pass"]');
    if(!newpwd.val()) {
        wboos.toast(newpwd.attr('placeholder'));
        return false;
    }
    var newpwd1 = $('input[name="repass"]');
    if(!newpwd1.val()) {
        wboos.toast(newpwd1.attr('placeholder'));
        return false;
    }
    $.post("<?php echo url('user/login/sendPassWord'); ?>",{},function(res){
        if(res.code > 0){
            wboos.toast(res.msg,{time:1800});
            $('.send_yzm_pw').remove();
            $('.send_yzm_pw1').append('<div class="send_yzm_pw"><span id="modify_pw" style="color:#50b936;text-align:right;"><?php echo lang('输入验证码'); ?></span></div>');
        }else{
            wboos.toast(res.msg,{time:1800});
        }
    });
}
$(document).on("pageInit", "#page-setting", function(e, id, page) {
    $('#page-setting form').off('submit');
    $('#page-setting form').on('submit', function() {
        var xm = $('input[name="xm"]');
		//var alipay = $('input[name="alipay"]');
        var email = $('input[name="email"]');
        var nickname = $('input[name="nickname"]');
        var sms = $("#sms1");
        console.log(xm);
        if(!xm.val()) {
            wboos.toast(xm.attr('placeholder'));
            return false;
        }
		if(!nickname.val()) {
            wboos.toast(nickname.attr('placeholder'));
            return false;
        }
		if(!email.val()) {
            wboos.toast(email.attr('placeholder'));
            return false;
        }
		/* if(!alipay.val()) {
            wboos.toast(alipay.attr('placeholder'));
            return false;
        } */
        if(!sms.val()) {
            wboos.toast(sms.attr('placeholder'));
            return false;
        }
        submitDatas(id,$(this));
        return false;
    })
});

$(document).on("pageInit", "#page-change-password", function(e, id, page) {
    $('#page-change-password form').off('submit');
    $('#page-change-password form').on('submit', function() {
        var nowpass = $(this).find('input[name="nowpass"]');
        var pass = $(this).find('input[name="pass"]');
        var repass = $(this).find('input[name="repass"]');

        if(!nowpass.val()) {
            wboos.toast(nowpass.attr('placeholder'));
            return false;
        }
        if(!pass.val() || (pass.val().length < 5) || (pass.val().length > 20)) {
            wboos.toast(pass.attr('placeholder'));
            return false;
        }
        if(!repass.val()) {
            wboos.toast(repass.attr('placeholder'));
            return false;
        }

        if(pass.val() != repass.val()) {
            wboos.toast('<?php echo lang('确认密码必须与新密码相同'); ?>');
            return false;
        }
        submitDatas(id,$(this), function() {
            window.location.href = '<?php echo url('user/login/index'); ?>';
        });
        return false;
    })
});

$(document).on("pageInit", "#page-change-security-password", function(e, id, page) {
    $('#page-change-security-password form').off('submit');
    $('#page-change-security-password form').on('submit', function() {
        var pass = $(this).find('input[name="pass"]');
        var repass = $(this).find('input[name="repass"]');
        
        <?php if($userInfo['aqmm'] !=''): ?>
        var nowpass = $(this).find('input[name="nowpass"]');
        if(!nowpass.val() && !pass.val() && !repass.val()){
             var target = $(this);
        submitDatas(id,target, function(){
            target[0].reset();
            $.router.back();
        });
        return false;
        }
        if(!nowpass.val()){
            wboos.toast(nowpass.attr('placeholder'));
            return false;
        }
        <?php endif; ?>

        if(!pass.val() || (pass.val().length < 5) || (pass.val().length > 20)) {
            wboos.toast(pass.attr('placeholder'));
            return false;
        }

        if(!repass.val()) {
            wboos.toast(repass.attr('placeholder'));
            return false;
        }

        if(pass.val() != repass.val()) {
            wboos.toast('<?php echo lang('确认密码必须与新密码相同'); ?>');
            return false;
        }
        var target = $(this);
        submitDatas(id,target, function() {
            target[0].reset();
            $.router.back();
        });
        return false;
    })
});
$(document).on("pageInit", "#page-bind-card", function(e, id, page) {
    $('#page-bind-card form').off('submit');
    $('#page-bind-card form').on('submit', function() {
        var yh = $(this).find('select[name="yh"]');
        var name = $(this).find('input[name="name"]');
        var yhk = $(this).find('input[name="yhk"]');
        if( !yh.val() ) {
            wboos.toast("<?php echo lang('请选择所在银行'); ?>");
            return false;
        }
        if(!name.val()) {
            wboos.toast(name.attr('placeholder'));
            return false;
        }

        if(!yhk.val()) {
            wboos.toast(yhk.attr('placeholder'));
            return false;
        }
        submitDatas(id,$(this));
        return false;
    })
});
    </script>
    <script type="text/javascript">

function setDefaultImg(e){
    if(e=='' || e==null){
     return "/static/xmt/images/avatar.png";
    }else{
     return e;
    }
}
 function timestampToTime(timestamp) {
        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y+M+D+h+m+s;
         }
 function timestampToTime1(timestamp) {
        var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y+M+D;
         }
new Vue({
  el: '#topvue',
  data: {
    link:'',
    user:'',
    list:'',
    level:'',
    t:'',
    team:'',
  },
  methods: {
        getData(){
            this.$http.get('/user/mode/my.html').then(function (res){
                var i = res.body;
                if(i.status==0){
                    wboos.toast(i.msg);
                }else{
                    this.level = i.level;
                    this.list = i.log;
                    this.user = i.user;
                    this.t = i.t;
                    this.team = i.team;
                    this.link =  wboos.url('user/login/zc.html?fxid='+i.user.user_id+'');
                    var qrcode = new QRCode(document.getElementById("qrcode"), {
                        width : 180,
                        height : 180,
                    });
                    qrcode.makeCode(this.link);
                    parent.$('#dhl').show();
                }
            })
        },
        level_(i){
            this.level_buy = i=='x'?'':this.level[i];
        },
        list2_buy_(i){
            this.list2_buy = i=='x'?'':this.list2[i];
        },
        list3_buy_(i){
            this.list3_buy = i=='x'?'':this.list3[i];
        },
        buy(id,i){
            var url = '/user/mode/buy'+i+'.html';
            var pay = $("input[name='pay']:checked").val();
            if(pay==null){
                wboos.toast('<?php echo lang('请选择优先扣款账户'); ?>');
            }else{
            this.$http.post(url,{id:id,pay:pay},{withCredentials: true}).then(function (res){
                var i = res.body;
                if(i.status==0){
                    wboos.toast(i.msg);
                }else{
                    wboos.toast(i.msg);
                    this.getData();
                    this.level_('x');
                    this.list2_buy_('x');
                    this.list3_buy_('x');
                    $('.close-popup').click();
                }
            })
            }
        },
    },
    created:function () {
        this.getData();
    },
  })
</script>




<script>
function copy(id)
    {
    var id = "content";
        const range = document.createRange();
        range.selectNode(document.getElementById(id));
        const selection = window.getSelection();//选择
        if(selection.rangeCount > 0) selection.removeAllRanges();
        selection.addRange(range);
        document.execCommand('copy');
        wboos.toast('<?php echo lang('复制成功'); ?>');
    }
var app = new Vue({
  el: '#addpage',
  data: {
    img:'',
    user:'',
    list:'',
    code:'',
    level:'',
    hongbao:'',
    level_:'',
	level_2:0,
    xmtt:'',
    usdt:'',
    system:'',
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
    timestampToTime1(timestamp) {
                var date = new Date(timestamp * 1000);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
                Y = date.getFullYear() + '-';
                M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
                D = date.getDate() + ' ';
                h = date.getHours() + ':';
                m = date.getMinutes() + ':';
                s = date.getSeconds();
                return Y+M+D;
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
		var level_usdt = '';
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
                var number = this.level_.level_id;
				var level_usdt = $('#level_usdt').val();
            }else if(type==7){
                var number = $('#xmt_num').val();
                var user = $('#xmt_p').val();
            }
        wboos.confirm('<?php echo lang('确定要提交?'); ?>', function () {
                        wboos.httpRequest({
                            url: '/user/mode/zc.html',
                            type: 'post',
                            data: {type:type,number:number,img:img,user:user,level_usdt:level_usdt},
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




</body></html>