<?php
defined('THINK_PATH') or exit();
/*
 * 
 * 打印信息
 */
function showMessage($info, $href="") {
	echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
	echo"<script> alert('".$info."');</script>";
	if (empty($href)) {
		echo "<script>window.history.go(-1)</script>";
	}
	else {
		echo "<script>javascript:window.location.href='".$href."'</script>";
	}
	
	exit();
}

function showMessage1($info, $href="") {
	echo '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />';
	//echo"<script> alert('".$info."');</script>";
	if (empty($href)) {
		echo "<script>window.history.go(-1)</script>";
	}
	else {
		echo "<script>javascript:top.location.href='".$href."'</script>";
	}

	exit();
}

/**

* 判断管理员对某一个操作是否有权限。

*

* 根据当前对应的action_code，然后再和用户session里面的action_list做匹配，以此来决定是否可以继续执行。

* @param     string    $priv_str    操作对应的priv_str

* @param     string    $msg_type       返回的类型

* @return true/false

*/

function admin_priv($priv_str, $msg_type = '' , $msg_output = true)

{
	$action_list = session('acctinfo.priv_action');
	
	if ($action_list == 'all')
	{
		return true;
	}

	if (strpos(',' . $action_list . ',', ',' . $priv_str . ',') === false)
	{

		if ( $msg_output)
		{
			showMessage("您没有权限");
		}

		return false;

	}
	else
	{
		return true;
	}
}


/*
 * 获得当前账户顶级账户信息
 * 下级代理用户注册全部注册在顶级代理商下面
 */
function get_top_agent_info($agent_id) {
	$acctDb = M("acct");
	
	$agent_id = intval($agent_id);
	
	if ($agent_id == 1 || $agent_id == 0) {
		return array('agent_id'=>$agent_id);
	}
	for($i=0; $i<10; $i++){
		
		$res = $acctDb->field('id, agent_id, acctname')->where('id='.$agent_id)->find();
		
		if ($res['agent_id'] == 1 || empty($res['agent_id'])) {
			return $res;
		}
		else {
			$agent_id = $res['agent_id'];
		}
		
	}
}
/*
 * 使用积分
 */

function use_integral($integral) {
	$acctId = session("acctinfo.id");
	
	$integral = intval($integral);
	
	$acctDb = M("acct");
	
	if ($integral > session("acctinfo.integral") || $integral <= 0) {
		return false;
	}
	
	//扣除当前用户费用
	$acctDb->where(array('id'=>$acctId))->setDec('integral',$integral);
	$acctDb->where(array('id'=>$acctId))->setInc('costintegral', $integral);
	
	return true;
} 

/*
 * 记录系统日志
*/
function sys_log($logtext, $acctname="") {
	if (empty($acctname)) {
		$data['agent_id'] = session("acctinfo.id");
		$data['acctname'] = session("acctinfo.acctname");
	}
	$data['createtime'] = time();
	$data['clientip'] = get_client_ip();
	$data['logtext'] = $logtext;

	$syslogDb = M("syslog");

	$result = $syslogDb->add($data);

	return $result;
}
/*
 * 代理商账单记录
 */
/* function acct_integral($curr_agent_id,$integral,$msg,$type){
    $data['agent_id'] = $curr_agent_id;
    $data['integral'] = $integral;
    $data['msg'] = $msg;
    $data['createtime'] = time();
    $data['type']=$type;
    $integral_log=M('acct_integral_log');
    $return=$integral_log->add($data);
    return $return;
} */
/*
 * 生成密码
 */
function create_pwd() {
	$str = "1234567890";
	$len = strlen( $str ) - 1;
	
	for ($j = 0; $j < 6; ++$j)
	{
		$num = mt_rand( 0, $len );
		$randString .= $str[$num];
	}
	
	return $randString;
}
//上传单张图片
function  upload($file, $width="480px", $height="800px") {

    $upload = new \Think\Upload();// 实例化上传类;
    $upload->maxSize = 2097152; //2M

    $upload->autoSub  = true;
    $upload->saveRule = uniqid;
    $upload->subType  = date;
    $upload->thumbMaxWidth = $width;
    $upload->thumbMaxHeight = $height;
    $upload->thumbPath = UPLOAD_PATH .'/Home/';
    $upload->thumbRemoveOrigin = true;

    //缩略图处理
    $upload->thumb = true;
    $upload->allowExts  = array('jpg', 'gif', 'png', 'jpeg');
    $upload->savePath =  UPLOAD_PATH .'/Home/';
    //$res = $upload->uploadOne($file);
    //print_r($_FILES);echo "<br />";
    $res = $upload->upload();
    //var_dump($res);exit;
    if ($res === false) {   
    } else {
        return $res;
    }
}

/*
 * 中文字符串截取
 */

function mb_zw_string($string, $len='60', $encode='utf-8'){
	if (mb_strlen($string, 'utf-8') > $len) {
		$string = mb_substr($string, 0, $len, 'utf-8');
	
		$string = $string  . '...';
	}
	
	return $string;
}

?>