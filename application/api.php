<?php
date_default_timezone_set('PRC');
$url1 = 'http://localhost/sc/index/oec.html';
$content = file_get_contents($url1);
$url1 = 'http://localhost/sc/index/gm0.html';
$content = file_get_contents($url1);
$url1 = 'http://localhost/sc/index/gm1.html';
$content = file_get_contents($url1);
$url1 = 'http://localhost/sc/index/gm2.html';
$content = file_get_contents($url1);
$url1 = 'http://localhost/sc/index/gm6.html';
$content = file_get_contents($url1);
$url1 = 'http://localhost/sc/index/jg.html';
$content = file_get_contents($url1);
$url1 = 'http://localhost/sc/index/kq.html';
$content = file_get_contents($url1);

echo 'OK --- ' . date('Y-m-d H:i:s') . PHP_EOL;
?>