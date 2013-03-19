<?php
require_once 'lib/global.php';

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json; charset=utf-8');

$productId = isset($_GET['productId']) ? intval($_GET['productId']) : 0;

$results = array();

$results['CategoryDetail'] = array(
	'CategoryId' => 201,
	'CategoryName' => '衣服',
	'CategoryDescription' => '衬衫、打底裤、牛仔裤',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/101.png',
	'SubCategories' => array()
);



$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 201,
	'CategoryName' => '打底裤',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/201.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 202,
	'CategoryName' => '牛仔裤',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/202.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 203,
	'CategoryName' => '吊带衫',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/203.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 204,
	'CategoryName' => '针织衫',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/204.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 205,
	'CategoryName' => '内衣',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/205.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 206,
	'CategoryName' => '套装',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/206.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 207,
	'CategoryName' => '夹克',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/207.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 208,
	'CategoryName' => '皮衣/皮草',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/208.jpg'
);
$results['CategoryDetail']['SubCategories'][] = array(
	'CategoryId' => 206,
	'CategoryName' => '连衣裙',
	'CategoryImage' => 'http://127.0.0.1/com.ios/api/ws02/images/category/209.jpg'
);

output($results);
?>
