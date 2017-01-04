<?php
/*
 * 使用积分
 */

function use_integral($integral,$agent_id) {
    //$acctId = session("acctinfo.id");

    $integral = intval($integral);

    $acctDb = M("acct");
    $acctInfo = $acctDb->field('integral')->where(array('id'=>$agent_id))->find();
    
    if ($integral > $acctInfo['integral']|| $integral <= 0) {
        return false;
    }

    //扣除当前用户费用
    $acctDb->where(array('id'=>$agent_id))->setDec('integral',$integral);
    $acctDb->where(array('id'=>$agent_id))->setInc('costintegral', $integral);

    return true;
}



?>