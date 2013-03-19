
<?php
require_once 'lib/global.php';

header('Access-Control-Allow-Origin:*');
header('Content-Type: application/json; charset=utf-8');

$results = array();

$results['Products'] = array();
$results['Products'][] = array(
	'ProductId' => 1001, 
	'ProductPrice' => 48.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/1.jpg', 
	'ProdcutName' => '大耳朵好可爱哦~绒绒的想咬一口~',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1002, 
	'ProductPrice' => 88.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/2.jpg', 
	'ProdcutName' => '森女文艺范 蕾丝拼接 雪纺开衫',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1003, 
	'ProductPrice' => 28.5,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/3.jpg', 
	'ProdcutName' => '薄荷绿！！卖萌啦~~',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1004, 
	'ProductPrice' => 89.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/4.jpg', 
	'ProdcutName' => '好看的牛仔外套 可以单穿 百搭 复古黑灰很美',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1005, 
	'ProductPrice' => 198.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/5.jpg', 
	'ProdcutName' => '很爆的一款皮草~很明星范.搞促销83包邮大爱~！',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1005, 
	'ProductPrice' => 198.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/6.jpg', 
	'ProdcutName' => '超级重磅的手工钉珠质感十足，驼色搭配同色系的荧光绿色优雅迷人，黑色对撞荧光绿色珠子低调华贵！超级推荐！超值收到便知！',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1005, 
	'ProductPrice' => 198.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/7.jpg', 
	'ProdcutName' => '针织衫开衫的 百搭条纹 大爱');


$results['Products'][] = array(
	'ProductId' => 1005, 
	'ProductPrice' => 198.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/8.jpg', 
	'ProdcutName' => '【BB家】几何图案简约百搭撞色条纹线衣开衫',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1005, 
	'ProductPrice' => 198.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/9.jpg', 
	'ProdcutName' => '适合初春的季节哦！好美，好个性！',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

$results['Products'][] = array(
	'ProductId' => 1005, 
	'ProductPrice' => 198.0,
	'ProductImage' => 'http://127.0.0.1/com.ios/api/ws02/images/10.jpg', 
	'ProdcutName' => '很漂亮的颜色~很有大牌的感觉~试穿了下，还不错。',
	'ProductUrl' => 'http://a.m.taobao.com/i20141968826.htm');

output($results);
?>
