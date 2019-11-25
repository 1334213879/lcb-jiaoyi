/**
 * 虚拟货币列表模块
 * @author sha.wang@jrj.com.cn
 * @date 2018.3.13
 * @version 1.0
 */
(function($) {
    $(function() {
        //初始化数据
        idealMoney.init();
        //每10秒刷新数据
        setInterval(function() {
            idealMoney.getListData();
        }, 1*1000);
        //点击切换排序方式
        $('.bitcoin_list table th.sort').click(function() {
            if ($(this).hasClass('desc')) {
                $(this).removeClass('desc').addClass('asc');
                idealMoney.order = 'asc';
            } else if ($(this).hasClass('asc')) {
                $(this).removeClass('asc').addClass('desc');
                idealMoney.order = 'desc';
            } else {
                $(this).addClass('desc').siblings().removeClass('desc').removeClass('asc');
                idealMoney.order = 'desc';
            }
            idealMoney.sort = $(this).attr('data-sort');
            idealMoney.column = $(this).attr('data-column');
            idealMoney.init();
        });
    });
    var idealMoney = {
        sort: 'last_numeric',
        order: 'desc',
        column: '4',
        init: function() {
            this.getListData();
        },
        /**
         * 获取表格数据渲染
         */
        getListData: function() {
            var sort = this.sort;
            var order = this.order;
            var column = this.column;
            var url = 'http://stock.jrj.com.cn/action/blockchain/allBlockChainInfo.jspa?sort=' + sort + '&order=' + order;
            $.getScript(url, function() {
                var listDataStr = "";
                for (var i = 0; i < blockchainData.data.length; i++) {
                    if (blockchainData.data[i].pc.toFixed(2) == 0) blockchainData.data[i].pc = 0;
					blockchainData.data[i].ys = blockchainData.data[i].last_dir =='greenBg' ? 'h' : blockchainData.data[i].last_dir =='redBg'  ? 'r' : '';
                    blockchainData.data[i].color1 = blockchainData.data[i].pcp > 0 ? 'red' : blockchainData.data[i].pcp < 0 ? 'gre' : '';
					blockchainData.data[i].jia = blockchainData.data[i].pcp > 0 ? '+' : '';
                    blockchainData.data[i].color2 = blockchainData.data[i].pc > 0 ? 'red' : blockchainData.data[i].pc < 0 ? 'gre' : '';
                    blockchainData.data[i].color3 = blockchainData.data[i].high.toFixed(2) > blockchainData.data[i].last_numeric.toFixed(2) ? 'red' : blockchainData.data[i].high.toFixed(2) < blockchainData.data[i].last_numeric.toFixed(2) ? 'gre' : '';
                    blockchainData.data[i].color4 = blockchainData.data[i].low.toFixed(2) > blockchainData.data[i].last_numeric.toFixed(2) ? 'red' : blockchainData.data[i].low.toFixed(2) < blockchainData.data[i].last_numeric.toFixed(2) ? 'gre' : '';
                    listDataStr += '<tr>\
									  <td class="column1"><div class="' + blockchainData.data[i].abbrname + '"style="width:25px;height:25px;margin-left:5px"></div></td>\
									  <td class="column1">' + blockchainData.data[i].abbrname + '</td>\
                                      <td class="column1">' + blockchainData.data[i].fullname + '</td>\
                                      <td class="column7">$' + (blockchainData.data[i].turnover / 10000).toFixed(2) + '万</td>\
									  <td class="column4 ' + blockchainData.data[i].ys + '">$' + blockchainData.data[i].last_numeric.toFixed(2) + '</td>\
									  <td class="column5"><div class="column5a ' + blockchainData.data[i].color1 + '">'+ blockchainData.data[i].jia +'' + blockchainData.data[i].pcp.toFixed(2) + '%&nbsp</div></td>\
                                     </tr>'
                }
                $('#moneyList').html(listDataStr);
                //改变排序列颜色
				$('.h').css('color', '#f70000');
				$('.r').css('color', '#02b300')
                //渲染获取时间
                $('#getTime').html('行情获取时间：' + blockchainData.hqTime);
            });
        },
    }
    var Sys = {};
    var ua = navigator.userAgent.toLowerCase();
    var s;
    (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
    (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
    (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
    (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
    (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
    //以下进行测试
  
    if (Sys.safari) {
    $(".nav_tool p a, .nav_tool p b").css({
        "padding": "0 5px 0 5px",
       "font-size":"12px"
    })
  
    }
})(jQuery)