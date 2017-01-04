<?php

//$data=array("ownerName"=>"18565370974", "pin"=>"1001", "displayE164"=>"18565370974", "rewriteRulesOutCallee"=>"", "language"=>"", "memo"=>"");
//创建账户
//$uri = "http://121.14.149.189:8080/external/server/CreateCustomer";
//$data = array("account"=>"daxun", "name"=>"daxun", "money"=>"10");


//创建在用电话卡
//$uri = "http://121.14.149.189:8080/external/server/CreateActivePhoneCard";
//$data = array("pin"=>"2118565370974", "account"=>"218565370974", "password"=>"123456", "displayE164"=>"218565370974", "bindLimit"=>"1", "memo"=>"");


//创建绑定号码
//$uri = "http://121.14.149.189:8080/external/server/CreateBindedE164";
//$data = array("e164"=>"18565370974", "pin"=>"18565370974");


//查询账户
//$uri = "http://121.14.149.189:8080/external/server/GetCustomer";
//$data = array("accounts"=>array("daxun"));

//回拨
//$uri = "http://121.14.149.189:8080/external/server/CallBack";
$uri = "http://113.105.152.156:8088/thirdparty/getcustomer.jsp?name=%E6%B5%8B%E8%AF%95&type=0&loginName=poo&loginPassword=poo1788";
//$data = array("callerE164"=>"10118565370974", "calleeE164s"=>"20115360704607", "accessE164"=>"400", "accessE164Password"=>"256357", "callerDisplayNumber"=>"18565370974");
//$data = array("name"=>"测试", "type"=>0, "loginName"=>"poo", "loginPassword"=>"poo1788");
$data = array();
//创建话机
//$uri = "http://121.14.149.189:8080/external/server/CreatePhone";
//$data = array("callerE164"=>"18565370974", "calleeE164s"=>"13751773402", "accessE164"=>"02062861994", "accessE164Password"=>"847166");

//电话卡激活
//$uri = "http://121.14.149.189:8080/external/server/PhoneCardActive";
//$data = array("pin"=>"2", "password"=>"676469", "bindedE164"=>"418565370974");

//查询绑定号码
//$uri = "http://121.14.149.189:8080/external/server/GetBindedE164";
//$data = array("e164s"=>array("318565370974"));
//return {"retCode":0,"infoBindedE164s":[{"e164":"318565370974","pin":"10011","account":"10011","displayE164":"","rewriteRulesOutCallee":"","bindTime":1429324653274,"language":"","memo":""}]}

//查询账户
//$uri = "http://121.14.149.189:8080/external/server/GetCustomer";
//$data = array("accounts"=>array("10011"));
//{"retCode":0,"infoCustomers":[{"account":"10011","name":"10011","money":10.0,"limitMoney":0.0,"feeRateGroup":"用户","type":1,
//"lockType":0,"agentAccount":"111","phoneBookLimit":2147483647,"startTime":1429324653274,"validTime":1431916653274,"todayConsumption":0.0,
//"memo":"","infoCustomerAdditional":{"cardType":0,"reportType":0}}]}

//电话卡充值
//$uri = "http://121.14.149.189:8080/external/server/PayByPhoneCard";
//$data = array("ownerName"=>"318565370974", "ownerType"=>"25", "pin"=>"10012", "password"=>"807088");

//充值
//$uri = "http://121.14.149.189:8080/external/server/Pay";
//$data = array("ownerName"=>"10113751773402", "ownerType"=>"25", "money"=>"-13", "memo"=>"积分兑换100");
//$uri = "http://120.26.58.199:8080/internal/setcustomer.jsp";
//$data = array("account"=>"18565370974", "money"=>"10", "feerateGroupName"=>"121", "agentAccount"=>"dajiang", "loginName"=>"internal", "loginPassword"=>"internal", "operationType"=>0);


//无锡  一万以内
//创建账户
//http://120.26.58.199:8080/softswitch/internal/setcustomer.jsp?loginName=internal&loginPassword=internal&account=18565370974&money=10&agentAccount=dajiang&operationType=0&feerateGroupName=taojinceshi&type=1

//创建话机
//http://120.26.58.199:8080/softswitch/internal/setphone.jsp?loginName=internal&loginPassword=internal&e164=400&password=256357&operationType=0&displayNumber=88888&calleebilling=0&capacity=1000&memo=test&account=ivr
//$data = json_encode($data);

//print_r($data);exit;
//$data="1212=1212";
//print_r($data);exit;

//创建账户
//http://113.105.152.156:8088/thirdparty/setcustomer.jsp?loginName=poo&loginPassword=poo1788&type=0&account=18565370975&accountType=1&money=10&feerateGroup=poo&agentAccount=poo
//创建在用电话卡
//http://113.105.152.156:8088/thirdparty/setactivephonecard.jsp?pin=10118565370974&account=10118565370974&password=123456&loginName=poo&loginPassword=poo1788&type=0
//创建绑定电话
//http://113.105.152.156:8088/thirdparty/setbindede164.jsp?e164=10118565370974&activePhoneCard=10118565370974&loginName=poo&loginPassword=poo1788&type=0
//充值或扣费
//http://113.105.152.156:8088/thirdparty/pay.jsp?account=10118565370974&money=1&memo=%E5%85%85%E5%80%BC%E4%B8%80%E5%85%83&loginName=poo&loginPassword=poo1788
//查询余额
//http://113.105.152.156:8088/thirdparty/getcustomer.jsp?name=10118565370974&type=2&loginName=poo&loginPassword=poo1788
//打电话
//http://113.105.152.156:8088/thirdparty/callback.jsp?caller=418565370974&callees=115913533846&number=400&password=837017&callbackBillingNumber=10118565370974&callbackBillingPassword=123456&calloutBillingNumber=10118565370974&calloutBillingPassword=123456&displayNumber=18565370974

$ch = curl_init ();

curl_setopt ( $ch, CURLOPT_URL, $uri );
curl_setopt ( $ch, CURLOPT_POST, 1 );
curl_setopt ( $ch, CURLOPT_HEADER, 0 );
curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
curl_setopt ( $ch, CURLOPT_POSTFIELDS, $data );
$return = curl_exec ( $ch );
curl_close ( $ch );
 
print_r($return);
?>
