if(typeof $ == 'function')
{
    $(function() {
        if(typeof $.init == 'function')
        {
            $.init();
        }
    })
}

var wboos = {
    httpRequest: function(params) {
        if(!params.type) {
            params.type = 'GET';
        }

        if(!params.dataType) {
            params.dataType = 'json';
        }

        return $.ajax(params);
    },

    toast: function(message, callback, duration) {
        if(typeof $.toast != 'function') {
            return alert(message);
        }

        if(!duration) {
            duration = 2000;
        }

        var info = $.toast(message, duration);
        if(typeof callback == 'function') {
            setTimeout(function() {
                callback();
            }, duration);
        }
		
        return info;
    },
    confirm: function(message, callback) {
        var info = $.confirm(message, callback);

        if($('.modal').length <= 0) {
            $(info).css({'zIndex': 99999});
            $(document.body).append(info);
        }

        return info;
    },
	getRequest: function (message) {
        var url = decodeURI(location.search); //鑾峰彇url涓�"?"绗﹀悗鐨勫瓧涓�
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for ( var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }
		if(message){
			theRequest=theRequest[message];
		}
        return theRequest;
    },
	//璇诲彇cookie锛岄渶瑕佹敞鎰忕殑鏄痗ookie鏄笉鑳藉瓨涓枃鐨勶紝濡傛灉闇€瑕佸瓨涓枃锛岃В鍐虫柟娉曟槸鍚庣鍏堣繘琛岀紪鐮乪ncode()锛屽墠绔彇鍑烘潵涔嬪悗鐢╠ecodeURI('string')瑙ｇ爜銆傦紙瀹夊崜鍙互鍙栦腑鏂嘽ookie锛孖OS涓嶈锛�
    getCookie: function (name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg)){
        return true;
       // return (arr[2]);
      }else{
		return false
	  }
	},
	//璁剧疆cookie   name涓篶ookie鐨勫悕瀛楋紝value鏄€硷紝expiredays涓鸿繃鏈熸椂闂达紙澶╂暟锛�
	setCookie: function (name, value, expiredays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
	},
	//鍒犻櫎cookie
   delCookie: function (name) {
      var exp = new Date();
      exp.setTime(exp.getTime() - 1);
      var cval = getCookie(name);
     if (cval != null)
     document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
   },
   url:function (e,a){
	   var i = window.location.host;
      var p = document.location.protocol;
     if(p=='http:'){
         var url = 'http://'+i+'/'+e+'';
        }else{
        var url = 'https://'+i+'/'+e+'';
        }
	   return url;
   },
}