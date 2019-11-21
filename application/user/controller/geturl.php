<?php
function geturl($url){
	$gs=count($url);
	$a=array();
	for($i=0;$i<$gs;$i++){
	$content= file_get_contents('http://api.chbtc.com/data/v1/ticker?currency='.$url[$i]);
	$content = json_decode($content);//将json字符串转化成php数组
	$object[$i] =  json_decode( json_encode( $content),true);
	$object[$i]['ticker']['bz']=$url[$i];
}
    return $object;
}

function curl_get_https($url, $timeout = 10, array $options = []){
    $curl = curl_init(); // 启动一个CURL会话
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_HEADER, 0);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false); // 跳过证书检查
    curl_setopt($curl, CURLOPT_TIMEOUT, $timeout);

    if(!empty($options))
    {
        curl_setopt_array($curl, $options);
    }

    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);  // 从证书中检查SSL加密算法是否存在
    $tmpInfo = curl_exec($curl);     //返回api的json对象
    //关闭URL请求
    curl_close($curl);
    return $tmpInfo;    //返回json对象
}