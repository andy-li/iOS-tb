
<?php
require_once 'lib/global.php';

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json; charset=utf-8');

$productId = isset($_GET['productId']) ? intval($_GET['productId']) : 0;

$results = array();

$results['Product'] = array(
	'ProductId' => $productId,
	'ProductTitle' => '欧密达2012秋冬季新款连衣裙 韩版女装修身长袖冬装打底衫针织裙子',
	'ProductDescription' => '气质耸肩公主袖：挺括有型的裁剪，泡泡袖的设计，很可爱哦。高贵显瘦燕尾摆：弧形的轮廓，燕尾的后摆，显瘦的同时更突显高贵气质。',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm',
	'ProductPrice' => 120.0,
	'LikedNumber' => 21,
	'BoughtNumber' => 30,
	'ProductImages' => array(
		0 => 'http://127.0.0.1/com.ios/api/ws02/images/1.jpg',
		1 => 'http://127.0.0.1/com.ios/api/ws02/images/2.jpg',
		2 => 'http://127.0.0.1/com.ios/api/ws02/images/3.jpg',
		3 => 'http://127.0.0.1/com.ios/api/ws02/images/4.jpg'
	),
	'ProductComments' => array(
		0 => array(
			'CommentId' => 10201, 
			'MemberId' => 320, 
			'MemberName' => '月落江枫', 
			'MemberAvatar' => 'http://127.0.0.1/com.ios/api/ws02/images/0.jpg', 
			'CommentContent' => '这件也很漂亮，更适合甜美小mm。挂在我的小店里，招揽顾客正好哈哈。', 
			'Dateline' => '2013-03-05 14:31:20')
	)
);

output($results);
?>
