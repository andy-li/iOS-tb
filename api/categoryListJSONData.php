
<?php
require_once 'lib/global.php';

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json; charset=utf-8');

$productId = isset($_GET['productId']) ? intval($_GET['productId']) : 0;

$results = array();

$results['Categories'] = array();
$results['Categories'][] = array(
	'CategoryId' => 101,
	'CategoryName' => '衣服',
	'CategoryDescription' => '衬衫、打底裤、牛仔裤',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/101.png'
);
$results['Categories'][] = array(
	'CategoryId' => 102,
	'CategoryName' => '鞋子',
	'CategoryDescription' => '马丁靴、旅行箱、豆豆谢',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/102.png'
);
$results['Categories'][] = array(
	'CategoryId' => 103,
	'CategoryName' => '包包',
	'CategoryDescription' => '单肩、旅行箱、钱包',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/103.png'
);
$results['Categories'][] = array(
	'CategoryId' => 104,
	'CategoryName' => '配饰',
	'CategoryDescription' => '耳环、手镯、锁骨链',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/104.png'
);
$results['Categories'][] = array(
	'CategoryId' => 105,
	'CategoryName' => '家居',
	'CategoryDescription' => '香蕉、杯具、iPhone壳',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/105.png'
);
$results['Categories'][] = array(
	'CategoryId' => 106,
	'CategoryName' => '零食',
	'CategoryDescription' => '优质坚果、糖果蜜饯、甜蜜烘焙',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/106.png'
);

output($results);
?>
