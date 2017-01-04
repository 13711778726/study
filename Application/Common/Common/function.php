<?php
//检测手机号码格式是否正确
function chenkPhone($mobile) {
	if(preg_match('/^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/', $mobile) || preg_match('/^((0?1[358]\d{9})|((0(10|2[0-4]|[3-9]\d{2}))?[1-9]\d{6,7})|((400){1}\d{7}))$/', $mobile)){
			//验证通过
		 return true;
	}else{
		//手机号码格式不对
	     return false;
	}
}


/*
 * 代理商账单记录
 */
function acct_integral($curr_agent_id,$integral,$msg,$type){
    $data['agent_id'] = $curr_agent_id;
    $data['integral'] = $integral;
    $data['msg'] = $msg;
    $data['createtime'] = time();
    $data['type']=$type;
    $integral_log=M('acct_integral_log');
    $return=$integral_log->add($data);
    return $return;
}

/*
 * 记录警告日志
*/
function warn_log($username, $agent_id,  $msg) {
	$data['username'] = $username;
	$data['msg'] = $msg;
	$data['createtime'] = time();
	$data['agent_id'] = $agent_id;

	$warnlogDb = M("warnlog");

	$result = $warnlogDb->add($data);

	return $result;
}
/*
 * 记录分钟卡日志
 */
function hcard_log($agent_id, $username, $balance, $cardname, $oper, $card_type="0"){
	$data['agent_id'] = $agent_id;
	$data['username'] = $username;
	$data['balance'] = $balance;
	$data['cardname'] = $cardname;
	$data['oper'] = $oper;
	$data['card_type'] = $card_type;
	$data['vouchertime'] = time();
	
	$hcardlogDb = M('hcardrecord');
	
	$result = $hcardlogDb->add($data);
	return $result;
}
/*
 * 记录流量卡日志
*/
function lcard_log($agent_id, $username, $balance, $cardname, $oper, $flow_type, $orderid, $mporderid){
	$data['agent_id'] = $agent_id;
	$data['username'] = $username;
	$data['balance'] = $balance;
	$data['cardname'] = $cardname;
	$data['oper'] = $oper;
	$data['vouchertime'] = time();
	$data['orderid'] = $orderid;
	$data['mporderid'] = $mporderid;
	$data['flow_type'] = $flow_type;

	$lcardlogDb = M('lcardrecord');

	$result = $lcardlogDb->add($data);

	return $result;
}
/*
 * 记录积分卡日志
*/
function card_log($agent_id, $username, $balance, $cardname, $oper){
	$data['agent_id'] = $agent_id;
	$data['username'] = $username;
	$data['balance'] = $balance;
	$data['cardname'] = $cardname;
	$data['oper'] = $oper;
	$data['vouchertime'] = time();

	$lcardlogDb = M('cardrecord');

	$result = $lcardlogDb->add($data);

	return $result;
}

/*
 * 检查用户
 */
function checkuser($uid, $username=""){
	if (empty($username)) {
		$username = I("request.username", "", "string");
	}
	$childs = get_agent_childids($uid);
	$childs[] = $uid;

	$users=M('users');
	$res=$users->field('agent_id')->where(array('username'=>$username,'agent_id'=>array('in',$childs)))->find();

	return $res['agent_id'];
}

/*
 * 获得下级代理商id列表
*/
function get_agent_childids($curr_acct_id) {
	static $childids = array();
	$acctDb  = M("acct");

	$res = $acctDb->field('id')->where('agent_id='.$curr_acct_id)->select();

	foreach ($res as $key=>$val){
		$childids[] = $val['id'];
		$curr_acct_id = $val['id'];

		get_agent_childids($curr_acct_id);
	}

	return $childids;
}

/*
 * 获得下级代理商id列表
*/
function get_agent_childids1($curr_acct_id) {
	static $childids1 = array();
	$acctDb  = M("acct");

	$res = $acctDb->field('id')->where('agent_id='.$curr_acct_id)->select();

	foreach ($res as $key=>$val){
		$childids1[] = $val['id'];
		$curr_acct_id = $val['id'];

		get_agent_childids1($curr_acct_id);
	}

	return $childids1;
}
/*
 * 获得当前代理商
 */
function getacct($acct_id){
    $acctDb = M("acct");
    $res = $acctDb->field('id, acctname')->where("id=".$acct_id)->find();
    $res['decode_id'] = base64_encode($acct_id);
    return $res;
}
/*
 * 获得代理商下级代理商列表
*/
function getlist_agents_child( $acct_id, $n = -1 )
{
	static $sort_array = array();
	$acctDb = M("acct");
	$res = $acctDb->field('id, acctname')->where("agent_id=".$acct_id)->select();

	++$n;
	foreach ($res as $key=>$val) {
		$val['acctname'] = str_repeat('&nbsp;', 4*$n) . $val['acctname'];
		$val['decode_id'] = base64_encode($val['id']);

		$sort_array[] = $val;
		$acct_id = $val['id'];

		getlist_agents_child($acct_id, $n);
	}

	return $sort_array;
}

/*
 * 检查代理商是否是当前下级代理商
*/
function is_childs($child_acct_id, $curr_acct_id="") {

	if (empty($curr_acct_id)) {
		$curr_acct_id = session('acctinfo.id');
	}

	if ($curr_acct_id == $child_acct_id) {
		return true;
	}

	$childids = get_agent_childids($curr_acct_id);

	return in_array($child_acct_id, $childids);
}


/*
 * 积分变动记录
 */
function integral_log($username, $agent_id, $integral, $msg, $type) {
	$data['username'] = $username;
	$data['agent_id'] = $agent_id;
	$data['integral'] = $integral;
	$data['msg'] = $msg;
	$data['type'] = $type;
	$data['createtime'] = time();
	
	$integralLogDb = M("integralLog");
	
	$return = $integralLogDb->add($data);
	
	return $return;
}
/*
 * 硬回拨web键值保持
 */
function callback_key($key, $username, $callee, $agent_id, $type) {
	//$callbackKeyDb = M("callbackKey");
	$tableName = 'record' . date('Ym');
	$sql = "SHOW TABLES LIKE '" . $tableName . "'";
	$createDb = M();
	$res = $createDb->query($sql);
	
	if (empty($res)) {
		$sql = "CREATE TABLE `".$tableName."`(
				`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
				`agent_id` INT UNSIGNED NOT NULL DEFAULT 0,
				`username` BIGINT UNSIGNED NOT NULL DEFAULT 0,
				`callee`  BIGINT UNSIGNED NOT NULL DEFAULT 0,
				`starttime` INT UNSIGNED NOT NULL DEFAULT 0,
				`endtime`  INT UNSIGNED NOT NULL DEFAULT 0,
				`second`  INT  NOT NULL DEFAULT 0,
				`key` 	BIGINT UNSIGNED NOT NULL DEFAULT 0,
				`callid` INT UNSIGNED NOT NULL DEFAULT 0,
				`type` TINYINT UNSIGNED NOT NULL DEFAULT 0,
				PRIMARY KEY(`id`),
				KEY(`agent_id`),
				KEY(`username`),
				KEY(`callee`),
				KEY(`starttime`),
				KEY(`key`),
				KEY(`callid`),
				KEY(`type`)
				)ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;";
		//print_r($sql);exit;
		$res = $createDb->execute($sql);
	}

	
	$data['key'] = $key;
	$data['username'] = $username;
	$data['callee'] = $callee;
	$data['agent_id'] = $agent_id;
	$data['callid'] = time();
	$data['type'] = $type;
	
	$callrecordDb = M($tableName);
	$return = $callrecordDb->add($data);
	
	
	return $return;
}

// $string： 明文 或 密文
// $operation：DECODE表示解密,其它表示加密
// $key： 密匙
// $expiry：密文有效期
function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0) {
	// 动态密匙长度，相同的明文会生成不同密文就是依靠动态密匙
	$ckey_length = 4;

	// 密匙
	$key = md5($key ? $key : C('AU_KEY'));

	// 密匙a会参与加解密
	$keya = md5(substr($key, 0, 16));
	// 密匙b会用来做数据完整性验证
	$keyb = md5(substr($key, 16, 16));
	// 密匙c用于变化生成的密文
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';
	// 参与运算的密匙
	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);
	// 明文，前10位用来保存时间戳，解密时验证数据有效性，10到26位用来保存$keyb(密匙b)，解密时会通过这个密匙验证数据完整性
	// 如果是解码的话，会从第$ckey_length位开始，因为密文前$ckey_length位保存 动态密匙，以保证解密正确
	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);
	$result = '';
	$box = range(0, 255);
	$rndkey = array();
	// 产生密匙簿
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}
	// 用固定的算法，打乱密匙簿，增加随机性，好像很复杂，实际上对并不会增加密文的强度
	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}
	// 核心加解密部分
	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		// 从密匙簿得出密匙进行异或，再转成字符
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		// substr($result, 0, 10) == 0 验证数据有效性
		// substr($result, 0, 10) - time() > 0 验证数据有效性
		// substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16) 验证数据完整性
		// 验证数据有效性，请看未加密明文的格式
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		// 把动态密匙保存在密文里，这也是为什么同样的明文，生产不同密文后能解密的原因
		// 因为加密后的密文可能是一些特殊字符，复制过程可能会丢失，所以用base64编码
		return $keyc.str_replace('=', '', base64_encode($result));
	}
}


?>