/*
Navicat MySQL Data Transfer

Source Server         : 智购通、千手
Source Server Version : 50615
Source Host           : 120.26.46.78:3306
Source Database       : yst5566

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2015-09-22 22:07:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ab_detail_pic
-- ----------------------------
DROP TABLE IF EXISTS `ab_detail_pic`;
CREATE TABLE `ab_detail_pic` (
  `ap_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_id` int(11) DEFAULT NULL,
  `detail_pic_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ab_detail_pic
-- ----------------------------

-- ----------------------------
-- Table structure for acct
-- ----------------------------
DROP TABLE IF EXISTS `acct`;
CREATE TABLE `acct` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acctname` char(20) NOT NULL DEFAULT '',
  `password` char(60) NOT NULL DEFAULT '',
  `integral` int(6) unsigned NOT NULL DEFAULT '0',
  `costintegral` int(6) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `enable` int(4) unsigned NOT NULL DEFAULT '1',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `priv_action` text NOT NULL,
  `create_people` char(20) NOT NULL DEFAULT '',
  `hidden_prefix` smallint(6) unsigned NOT NULL,
  `show_prefix` smallint(6) unsigned NOT NULL,
  `agent_prefix` smallint(6) unsigned NOT NULL DEFAULT '0',
  `call_type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `mode` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minute` int(6) NOT NULL DEFAULT '0',
  `reg_fee` smallint(5) unsigned NOT NULL DEFAULT '0',
  `gift_fee` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sign_fee` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `acctname` (`acctname`),
  KEY `agent_id` (`agent_id`),
  KEY `agent_perfix` (`agent_prefix`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct
-- ----------------------------
INSERT INTO `acct` VALUES ('1', 'all', '6cf1+ghm+oAM59w+kUOEL8BgVt0/TG5bwDzZvZBecuSAEScA', '66986533', '48', '0', '1', '0', 'all', 'all', '100', '200', '0', '1', '0', '0', '1', '0', '1');
INSERT INTO `acct` VALUES ('83', '微话电讯', '0767uMMMjRKakTx59ELNA/pRXhUsgMEMbGlpxsKXdCCDKgjs3g', '0', '0', '1', '1', '1440728449', 'agentView,cardView,userView,callRecord,syslogView,warnLogView,userIntegralLog,agentIntegralLog,location_view,location_add,prelation_view,prelation_add,plu_view,plu_add,news_view,news_add,news_update,product_view,product_add,recommendation_view,recommendation_add,reservation_view,Cooperation_view,Cooperation_add,Recruitment_view,Recruitment_add,Interaction_view,Interaction_add,Joinus_view,Joinus_add,Brandstory_view,Brandstory_add,Business_view,Business_add,Contactus_view,Contactus_add,Message_view,Productmg_view,Consulting_view,Freegrab_view,Freegrab_add,addUser,userPay,service_view,service_add,hcardView', 'all', '101', '201', '100', '0', '1', '100', '2', '0', '0');

-- ----------------------------
-- Table structure for acct_integral_log
-- ----------------------------
DROP TABLE IF EXISTS `acct_integral_log`;
CREATE TABLE `acct_integral_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `msg` varchar(120) DEFAULT '',
  `createtime` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acct_integral_log
-- ----------------------------

-- ----------------------------
-- Table structure for admin_action
-- ----------------------------
DROP TABLE IF EXISTS `admin_action`;
CREATE TABLE `admin_action` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `action_code` varchar(20) NOT NULL DEFAULT '',
  `is_show` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_action
-- ----------------------------
INSERT INTO `admin_action` VALUES ('1', '0', '01_fee_system', '1');
INSERT INTO `admin_action` VALUES ('2', '0', '02_flow_system', '1');
INSERT INTO `admin_action` VALUES ('3', '0', '03_integral_system', '1');
INSERT INTO `admin_action` VALUES ('4', '0', '04_report', '1');
INSERT INTO `admin_action` VALUES ('5', '0', '05_agent_manage', '1');
INSERT INTO `admin_action` VALUES ('6', '0', '06_user_manage', '1');
INSERT INTO `admin_action` VALUES ('8', '0', '07_web_manage', '1');
INSERT INTO `admin_action` VALUES ('20', '1', 'hcardView', '1');
INSERT INTO `admin_action` VALUES ('21', '1', 'haddCard', '0');
INSERT INTO `admin_action` VALUES ('22', '1', 'htransferCard', '1');
INSERT INTO `admin_action` VALUES ('23', '1', 'hcardDelete', '1');
INSERT INTO `admin_action` VALUES ('24', '1', 'hcardEn', '1');
INSERT INTO `admin_action` VALUES ('25', '1', 'haddExport', '1');
INSERT INTO `admin_action` VALUES ('26', '1', 'userRecord', '1');
INSERT INTO `admin_action` VALUES ('27', '1', 'hcardRecord', '1');
INSERT INTO `admin_action` VALUES ('28', '1', 'webcallback', '0');
INSERT INTO `admin_action` VALUES ('40', '2', 'lcardView', '1');
INSERT INTO `admin_action` VALUES ('41', '2', 'laddCard', '1');
INSERT INTO `admin_action` VALUES ('42', '2', 'ltransferCard', '1');
INSERT INTO `admin_action` VALUES ('43', '2', 'lcardDelete', '1');
INSERT INTO `admin_action` VALUES ('44', '2', 'lcardEn', '1');
INSERT INTO `admin_action` VALUES ('45', '2', 'laddExport', '1');
INSERT INTO `admin_action` VALUES ('46', '2', 'lcardRecord', '1');
INSERT INTO `admin_action` VALUES ('60', '3', 'cardView', '1');
INSERT INTO `admin_action` VALUES ('61', '3', 'addCard', '1');
INSERT INTO `admin_action` VALUES ('62', '3', 'transferCard', '1');
INSERT INTO `admin_action` VALUES ('63', '3', 'cardDelete', '1');
INSERT INTO `admin_action` VALUES ('64', '3', 'cardEn', '1');
INSERT INTO `admin_action` VALUES ('65', '3', 'addExport', '1');
INSERT INTO `admin_action` VALUES ('66', '3', 'cardrecord', '1');
INSERT INTO `admin_action` VALUES ('80', '4', 'feereport', '1');
INSERT INTO `admin_action` VALUES ('81', '4', 'flowreport', '1');
INSERT INTO `admin_action` VALUES ('82', '4', 'integralreport', '1');
INSERT INTO `admin_action` VALUES ('83', '4', 'downreport', '1');
INSERT INTO `admin_action` VALUES ('100', '5', 'agentView', '1');
INSERT INTO `admin_action` VALUES ('101', '5', 'agentAdd', '1');
INSERT INTO `admin_action` VALUES ('102', '5', 'agentPay', '1');
INSERT INTO `admin_action` VALUES ('103', '5', 'agentPrivilege', '1');
INSERT INTO `admin_action` VALUES ('104', '5', 'agentEdit', '1');
INSERT INTO `admin_action` VALUES ('105', '5', 'agentDelete', '1');
INSERT INTO `admin_action` VALUES ('106', '5', 'agentEn', '1');
INSERT INTO `admin_action` VALUES ('120', '6', 'userView', '1');
INSERT INTO `admin_action` VALUES ('121', '6', 'addUser', '1');
INSERT INTO `admin_action` VALUES ('122', '6', 'userEdit', '1');
INSERT INTO `admin_action` VALUES ('123', '6', 'userPay', '1');
INSERT INTO `admin_action` VALUES ('124', '6', 'userEn', '1');
INSERT INTO `admin_action` VALUES ('140', '7', 'syslogView', '1');
INSERT INTO `admin_action` VALUES ('141', '7', 'warnLogView', '1');
INSERT INTO `admin_action` VALUES ('142', '7', 'userIntegralLog', '1');
INSERT INTO `admin_action` VALUES ('160', '8', 'product_view', '1');
INSERT INTO `admin_action` VALUES ('161', '8', 'product_add', '1');
INSERT INTO `admin_action` VALUES ('162', '8', 'recommendation_view', '1');
INSERT INTO `admin_action` VALUES ('163', '8', 'recommendation_add', '1');
INSERT INTO `admin_action` VALUES ('164', '8', 'reservation_view', '1');
INSERT INTO `admin_action` VALUES ('165', '8', 'service_view', '1');
INSERT INTO `admin_action` VALUES ('166', '8', 'service_add', '1');
INSERT INTO `admin_action` VALUES ('167', '8', 'Brandstory_view', '1');
INSERT INTO `admin_action` VALUES ('168', '8', 'Brandstory_add', '1');
INSERT INTO `admin_action` VALUES ('169', '8', 'news_view', '1');
INSERT INTO `admin_action` VALUES ('170', '8', 'news_add', '1');
INSERT INTO `admin_action` VALUES ('171', '8', 'Contactus_view', '1');
INSERT INTO `admin_action` VALUES ('172', '8', 'Message_view', '1');
INSERT INTO `admin_action` VALUES ('173', '8', 'Freegrab_view', '1');
INSERT INTO `admin_action` VALUES ('174', '8', 'Freegrab_add', '1');
INSERT INTO `admin_action` VALUES ('175', '8', 'Productmg_view', '1');
INSERT INTO `admin_action` VALUES ('176', '8', 'Recruitment_view', '1');
INSERT INTO `admin_action` VALUES ('177', '8', 'Recruitment_add', '1');
INSERT INTO `admin_action` VALUES ('178', '8', 'Business_view', '1');
INSERT INTO `admin_action` VALUES ('179', '8', 'Business_add', '1');
INSERT INTO `admin_action` VALUES ('180', '8', 'Cooperation_view', '1');
INSERT INTO `admin_action` VALUES ('181', '8', 'Cooperation_add', '1');
INSERT INTO `admin_action` VALUES ('182', '8', 'Interaction_view', '1');
INSERT INTO `admin_action` VALUES ('183', '8', 'Interaction_add', '1');
INSERT INTO `admin_action` VALUES ('7', '0', '08_system_mamage', '1');
INSERT INTO `admin_action` VALUES ('184', '8', 'location_view', '1');
INSERT INTO `admin_action` VALUES ('185', '8', 'location_add', '1');
INSERT INTO `admin_action` VALUES ('186', '8', 'prelation_view', '1');
INSERT INTO `admin_action` VALUES ('187', '8', 'prelation_add', '1');
INSERT INTO `admin_action` VALUES ('188', '8', 'plu_view', '1');
INSERT INTO `admin_action` VALUES ('189', '8', 'plu_add', '1');
INSERT INTO `admin_action` VALUES ('29', '1', 'haddbaoyueCard', '0');
INSERT INTO `admin_action` VALUES ('30', '1', 'hbaoyueCard', '1');
INSERT INTO `admin_action` VALUES ('190', '8', 'disclaimer_view', '1');
INSERT INTO `admin_action` VALUES ('191', '8', 'help_view', '1');
INSERT INTO `admin_action` VALUES ('107', '5', 'agentBaoyue', '1');

-- ----------------------------
-- Table structure for advert
-- ----------------------------
DROP TABLE IF EXISTS `advert`;
CREATE TABLE `advert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roll` varchar(60) NOT NULL DEFAULT '',
  `tb_huafei` varchar(360) NOT NULL DEFAULT '',
  `tb_liuliang` varchar(360) NOT NULL DEFAULT '',
  `youhui` text NOT NULL,
  `jiameng` text NOT NULL,
  `shuoming` text NOT NULL,
  `guanyu` text NOT NULL,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advert
-- ----------------------------

-- ----------------------------
-- Table structure for appkey
-- ----------------------------
DROP TABLE IF EXISTS `appkey`;
CREATE TABLE `appkey` (
  `app_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` smallint(11) unsigned NOT NULL DEFAULT '0',
  `appid` varchar(255) NOT NULL DEFAULT '',
  `secret` varchar(255) NOT NULL DEFAULT '',
  `app_status` tinyint(11) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(255) NOT NULL DEFAULT '',
  `app_time` int(30) unsigned NOT NULL DEFAULT '0',
  `wx_id` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`app_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appkey
-- ----------------------------
INSERT INTO `appkey` VALUES ('3', '1', 'wx68aa323e10990418', '1b7df14bc5cde1d82e0e64dc11458d41', '0', '2nCwlQ4fiy4VabxkxnGLkvZH0BbThPDqRc4nlTDbVpJlnt4FnxDFvsxswJkKkmxt1p6qmlg_DlvV-CvSW6_g2yaSEOanliKzMXQxEaBqlt8', '1441000551', 'gh_853fb0ae847c');
INSERT INTO `appkey` VALUES ('4', '33', 'wx68aa323e10990418', '1b7df14bc5cde1d82e0e64dc11458d41', '0', '7CW3AY3cJk85LbUCESKbrCWevOtOZPhG0ran_fu7DDPxb0x6NqEdbi7jr2mSY9bgl9Tpqj9gIGOm5dPWID5BWFpaIjO585S6GIze1HUV3z0', '1440584237', '');

-- ----------------------------
-- Table structure for apply_box
-- ----------------------------
DROP TABLE IF EXISTS `apply_box`;
CREATE TABLE `apply_box` (
  `ab_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用id',
  `ab_name` varchar(60) DEFAULT '' COMMENT '应用名称',
  `ab_pic` varchar(60) DEFAULT '' COMMENT '应用图标',
  `ab_desc` varchar(255) DEFAULT '' COMMENT '应用描述',
  `ab_detail` varchar(255) DEFAULT '' COMMENT '应用详情',
  `ab_price` float DEFAULT '0' COMMENT '应用价格',
  `ab_comment_num` int(11) DEFAULT '0' COMMENT '应用评论数',
  `ab_sales_volume` int(11) DEFAULT '0' COMMENT '销量',
  `ab_type` int(11) DEFAULT '0' COMMENT '是否上架',
  `ab_discount` float DEFAULT NULL,
  `ab_createtime` int(11) DEFAULT NULL,
  `ab_developers` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_box
-- ----------------------------
INSERT INTO `apply_box` VALUES ('9', '雅芳', '20150730/thumb_55b9c0a5b687f.png', '121212', '12121212', '2000', '0', '0', '1', '1888', '1438236837', '广州派我');

-- ----------------------------
-- Table structure for brand_story
-- ----------------------------
DROP TABLE IF EXISTS `brand_story`;
CREATE TABLE `brand_story` (
  `bs_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bs_content` text NOT NULL,
  `bs_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `bs_order` int(4) unsigned NOT NULL DEFAULT '0',
  `bs_title` varchar(255) NOT NULL DEFAULT '',
  `bs_time` varchar(15) NOT NULL DEFAULT '',
  `bs_img` varchar(255) NOT NULL DEFAULT '',
  `bs_desc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`bs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand_story
-- ----------------------------
INSERT INTO `brand_story` VALUES ('48', '<div style=\"text-align:center;\">\r\n	<embed src=\"http://player.youku.com/player.php/sid/XMTMyNDA0MDc5Mg==/v.swf\" type=\"application/x-shockwave-flash\" width=\"550\" height=\"400\" quality=\"high\" /><br />\r\n</div>', '1', '0', '12', '1441766031', '39', '12');

-- ----------------------------
-- Table structure for brand_story_url
-- ----------------------------
DROP TABLE IF EXISTS `brand_story_url`;
CREATE TABLE `brand_story_url` (
  `bsu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bsu_url` varchar(255) NOT NULL DEFAULT '',
  `bsu_uid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bsu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand_story_url
-- ----------------------------
INSERT INTO `brand_story_url` VALUES ('39', '20150909/thumb_55ef9a8f3e88a.png', '0');

-- ----------------------------
-- Table structure for business_qualification
-- ----------------------------
DROP TABLE IF EXISTS `business_qualification`;
CREATE TABLE `business_qualification` (
  `bq_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bq_content` text NOT NULL,
  `bq_corporation` varchar(255) NOT NULL DEFAULT '',
  `bq_address` varchar(255) NOT NULL DEFAULT '',
  `bq_time` varchar(255) NOT NULL DEFAULT '',
  `bq_type` varchar(255) NOT NULL DEFAULT '',
  `bq_money` varchar(255) NOT NULL DEFAULT '',
  `bq_scope` varchar(255) NOT NULL DEFAULT '',
  `bq_ratify` varchar(255) NOT NULL DEFAULT '',
  `bq_product` varchar(255) NOT NULL DEFAULT '',
  `bq_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `bq_name` varchar(255) NOT NULL,
  PRIMARY KEY (`bq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_qualification
-- ----------------------------

-- ----------------------------
-- Table structure for button_type
-- ----------------------------
DROP TABLE IF EXISTS `button_type`;
CREATE TABLE `button_type` (
  `bt_id` int(11) NOT NULL AUTO_INCREMENT,
  `bt_type` varchar(10) NOT NULL DEFAULT '',
  `bt_name` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`bt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of button_type
-- ----------------------------
INSERT INTO `button_type` VALUES ('1', 'view', '关联url');
INSERT INTO `button_type` VALUES ('2', 'click', '关联关键词');
INSERT INTO `button_type` VALUES ('3', 'none', '无');

-- ----------------------------
-- Table structure for buy_apply_box
-- ----------------------------
DROP TABLE IF EXISTS `buy_apply_box`;
CREATE TABLE `buy_apply_box` (
  `bb_id` int(11) NOT NULL AUTO_INCREMENT,
  `bb_apply_name` varchar(30) DEFAULT NULL,
  `bb_username``` varchar(30) DEFAULT NULL,
  `bb_time` int(11) DEFAULT NULL,
  `bb_type` int(11) DEFAULT NULL,
  `bb_price` float DEFAULT NULL,
  PRIMARY KEY (`bb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy_apply_box
-- ----------------------------

-- ----------------------------
-- Table structure for call_push
-- ----------------------------
DROP TABLE IF EXISTS `call_push`;
CREATE TABLE `call_push` (
  `ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_url` varchar(255) DEFAULT '',
  `ip_sore` int(11) DEFAULT '0',
  `phone_type` int(11) DEFAULT '1',
  `ip_uid` int(11) NOT NULL DEFAULT '0',
  `ip_img` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of call_push
-- ----------------------------

-- ----------------------------
-- Table structure for callback_key
-- ----------------------------
DROP TABLE IF EXISTS `callback_key`;
CREATE TABLE `callback_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL DEFAULT '',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `callee` bigint(20) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=1492 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of callback_key
-- ----------------------------
INSERT INTO `callback_key` VALUES ('1366', '14404121914375', '18565370974', '15360704607', '1440412193', '33');
INSERT INTO `callback_key` VALUES ('1367', '14404756051757', '18565370974', '13790701296', '1440475607', '33');
INSERT INTO `callback_key` VALUES ('1368', '14404756111765', '18565370974', '13790701296', '1440475613', '33');
INSERT INTO `callback_key` VALUES ('1369', '14404756161771', '18565370974', '13790701296', '1440475618', '33');
INSERT INTO `callback_key` VALUES ('1370', '14404756201780', '18565370974', '13790701296', '1440475622', '33');
INSERT INTO `callback_key` VALUES ('1371', '14404756231787', '18565370974', '13790701296', '1440475625', '33');
INSERT INTO `callback_key` VALUES ('1372', '14404825495248', '18565370974', '13711778726', '1440482551', '33');
INSERT INTO `callback_key` VALUES ('1373', '14404826415404', '18565370974', '13711778726', '1440482643', '33');
INSERT INTO `callback_key` VALUES ('1374', '14404827245568', '18565370974', '13711778726', '1440482726', '33');
INSERT INTO `callback_key` VALUES ('1375', '14404827365592', '18565370974', '13711778726', '1440482738', '33');
INSERT INTO `callback_key` VALUES ('1376', '14404828195751', '18565370974', '13711778726', '1440482821', '33');
INSERT INTO `callback_key` VALUES ('1377', '14404828795852', '18565370974', '13711778726', '1440482881', '33');
INSERT INTO `callback_key` VALUES ('1378', '14404834946934', '18565370974', '13790701265', '1440483496', '33');
INSERT INTO `callback_key` VALUES ('1379', '14404843338604', '18565370974', '13707012962', '1440484336', '33');
INSERT INTO `callback_key` VALUES ('1380', '14404884647689', '18565370974', '13790701296', '1440488466', '33');
INSERT INTO `callback_key` VALUES ('1381', '14404886478097', '18565370974', '13790701258', '1440488650', '33');
INSERT INTO `callback_key` VALUES ('1382', '14404887108242', '18565370974', '13790853912', '1440488713', '33');
INSERT INTO `callback_key` VALUES ('1383', '14404887438309', '18565370974', '13790852369', '1440488745', '33');
INSERT INTO `callback_key` VALUES ('1384', '14404889408755', '18565370974', '13790062285', '1440488942', '33');
INSERT INTO `callback_key` VALUES ('1385', '14404890048896', '18565370974', '13789562563', '1440489006', '33');
INSERT INTO `callback_key` VALUES ('1386', '14404893139592', '18565370974', '13790708523', '1440489316', '33');
INSERT INTO `callback_key` VALUES ('1387', '14404893759741', '18565370974', '13785698569', '1440489378', '33');
INSERT INTO `callback_key` VALUES ('1388', '14404897440558', '18565370974', '13797082582', '1440489746', '33');
INSERT INTO `callback_key` VALUES ('1389', '14404897840650', '18565370974', '13790708523', '1440489787', '33');
INSERT INTO `callback_key` VALUES ('1390', '14404897860655', '18565370974', '13790708523', '1440489788', '33');
INSERT INTO `callback_key` VALUES ('1391', '14404903391986', '18588691207', '13790701256', '1440490341', '33');
INSERT INTO `callback_key` VALUES ('1392', '14404903802079', '18588691207', '13790852369', '1440490382', '33');
INSERT INTO `callback_key` VALUES ('1393', '14404904922339', '18588691207', '13790701296', '1440490495', '33');
INSERT INTO `callback_key` VALUES ('1394', '14404905732538', '18588691207', '13790701296', '1440490575', '33');
INSERT INTO `callback_key` VALUES ('1395', '14404906552725', '18588691207', '13790701296', '1440490657', '33');
INSERT INTO `callback_key` VALUES ('1396', '14404907622975', '18588691207', '13788268622', '1440490765', '33');
INSERT INTO `callback_key` VALUES ('1397', '14404907883038', '18588691207', '13798523690', '1440490791', '33');
INSERT INTO `callback_key` VALUES ('1398', '14404907903049', '18588691207', '13798523690', '1440490792', '33');
INSERT INTO `callback_key` VALUES ('1399', '14404914094514', '18588691207', '13790701296', '1440491411', '33');
INSERT INTO `callback_key` VALUES ('1400', '14404914814682', '18588691207', '13790708523', '1440491483', '33');
INSERT INTO `callback_key` VALUES ('1401', '14404917855378', '18588691207', '13790708523', '1440491787', '33');
INSERT INTO `callback_key` VALUES ('1402', '14404920395938', '18588691207', '13790852369', '1440492042', '33');
INSERT INTO `callback_key` VALUES ('1403', '14404920415942', '18588691207', '13790852369', '1440492044', '33');
INSERT INTO `callback_key` VALUES ('1404', '14404920666001', '18588691207', '13790701256', '1440492069', '33');
INSERT INTO `callback_key` VALUES ('1405', '14404920686007', '18588691207', '13790701256', '1440492070', '33');
INSERT INTO `callback_key` VALUES ('1406', '14404921906277', '18588691207', '13790852369', '1440492192', '33');
INSERT INTO `callback_key` VALUES ('1407', '14404924076716', '18588691207', '13790852369', '1440492409', '33');
INSERT INTO `callback_key` VALUES ('1408', '14404924386786', '18588691207', '13790852369', '1440492440', '33');
INSERT INTO `callback_key` VALUES ('1409', '14404949932898', '18588691207', '13790701258', '1440494995', '33');
INSERT INTO `callback_key` VALUES ('1410', '14404950553016', '18588691207', '13790708523', '1440495057', '33');
INSERT INTO `callback_key` VALUES ('1411', '14404970718839', '18588691207', '13790852369', '1440497074', '33');
INSERT INTO `callback_key` VALUES ('1412', '14404970858887', '18588691207', '13790852369', '1440497087', '33');
INSERT INTO `callback_key` VALUES ('1413', '14404974540057', '18588691207', '13790701240', '1440497457', '33');
INSERT INTO `callback_key` VALUES ('1414', '14404983222401', '18588691207', '13788268600', '1440498325', '33');
INSERT INTO `callback_key` VALUES ('1415', '14404983862600', '18588691207', '13791256660', '1440498388', '33');
INSERT INTO `callback_key` VALUES ('1416', '14404986173209', '18588691207', '13790708523', '1440498619', '33');
INSERT INTO `callback_key` VALUES ('1417', '14404986873407', '18588691207', '13790701222', '1440498690', '33');
INSERT INTO `callback_key` VALUES ('1418', '14404987963669', '18588691207', '13791256660', '1440498799', '33');
INSERT INTO `callback_key` VALUES ('1419', '14404988363764', '18588691207', '13790708523', '1440498839', '33');
INSERT INTO `callback_key` VALUES ('1420', '14404989103964', '18588691207', '13790708520', '1440498912', '33');
INSERT INTO `callback_key` VALUES ('1421', '14404989143977', '18588691207', '13790708520', '1440498916', '33');
INSERT INTO `callback_key` VALUES ('1422', '14404989153980', '18588691207', '13790708523', '1440498918', '33');
INSERT INTO `callback_key` VALUES ('1423', '14404991574594', '18588691207', '13790708520', '1440499160', '33');
INSERT INTO `callback_key` VALUES ('1424', '14404991834658', '18588691207', '13788268600', '1440499185', '33');
INSERT INTO `callback_key` VALUES ('1425', '14404992004693', '18588691207', '13790701258', '1440499202', '33');
INSERT INTO `callback_key` VALUES ('1426', '14404992194755', '18588691207', '13790701258', '1440499221', '33');
INSERT INTO `callback_key` VALUES ('1427', '14404992784912', '18588691207', '13788268600', '1440499280', '33');
INSERT INTO `callback_key` VALUES ('1428', '14405001237111', '18588691207', '13790701296', '1440500126', '33');
INSERT INTO `callback_key` VALUES ('1429', '14405002767476', '18588691207', '13790852369', '1440500278', '33');
INSERT INTO `callback_key` VALUES ('1430', '14405002787484', '18588691207', '13790852369', '1440500280', '33');
INSERT INTO `callback_key` VALUES ('1431', '14405002987532', '18588691207', '13790852369', '1440500301', '33');
INSERT INTO `callback_key` VALUES ('1432', '14405005358121', '18588691207', '13790852369', '1440500537', '33');
INSERT INTO `callback_key` VALUES ('1433', '14405006038280', '18588691207', '13790852369', '1440500606', '33');
INSERT INTO `callback_key` VALUES ('1434', '14405006308346', '18588691207', '13790852369', '1440500632', '33');
INSERT INTO `callback_key` VALUES ('1435', '14405023752912', '18588691207', '13790852369', '1440502378', '33');
INSERT INTO `callback_key` VALUES ('1436', '14405031725007', '18565370974', '13711778726', '1440503175', '33');
INSERT INTO `callback_key` VALUES ('1437', '14405033465440', '18565370974', '13711778726', '1440503349', '33');
INSERT INTO `callback_key` VALUES ('1438', '14405033545456', '18565370974', '13711778726', '1440503357', '33');
INSERT INTO `callback_key` VALUES ('1439', '14405041147456', '18588691207', '13790708523', '1440504116', '33');
INSERT INTO `callback_key` VALUES ('1440', '14405070428611', '18565370974', '13711778726', '1440507045', '33');
INSERT INTO `callback_key` VALUES ('1441', '14405075760160', '18588691207', '13790701296', '1440507578', '33');
INSERT INTO `callback_key` VALUES ('1442', '14405075770164', '18588691207', '13790701296', '1440507580', '33');
INSERT INTO `callback_key` VALUES ('1443', '14405076520410', '18588691207', '13790701296', '1440507655', '33');
INSERT INTO `callback_key` VALUES ('1444', '14405076550419', '18588691207', '13790701296', '1440507657', '33');
INSERT INTO `callback_key` VALUES ('1445', '14405086143900', '18588691207', '13790701258', '1440508617', '33');
INSERT INTO `callback_key` VALUES ('1446', '14405086794271', '18588691207', '13790701296', '1440508681', '33');
INSERT INTO `callback_key` VALUES ('1447', '14405087214449', '18588691207', '13790701222', '1440508723', '33');
INSERT INTO `callback_key` VALUES ('1448', '14405087234458', '18588691207', '13790708523', '1440508725', '33');
INSERT INTO `callback_key` VALUES ('1449', '14405091506210', '18588691207', '13790701240', '1440509153', '33');
INSERT INTO `callback_key` VALUES ('1450', '14405091716253', '18588691207', '13790701240', '1440509174', '33');
INSERT INTO `callback_key` VALUES ('1451', '14405091926323', '18588691207', '13790701222', '1440509194', '33');
INSERT INTO `callback_key` VALUES ('1452', '14405092536507', '18588691207', '13788268600', '1440509256', '33');
INSERT INTO `callback_key` VALUES ('1453', '14405093036664', '18588691207', '13790708523', '1440509306', '33');
INSERT INTO `callback_key` VALUES ('1454', '14405094887232', '18588691207', '13790708523', '1440509491', '33');
INSERT INTO `callback_key` VALUES ('1455', '14405099108407', '18588691207', '13790708523', '1440509913', '33');
INSERT INTO `callback_key` VALUES ('1456', '14405099308502', '18588691207', '13790701296', '1440509933', '33');
INSERT INTO `callback_key` VALUES ('1457', '14405102869664', '18588691207', '13790701296', '1440510289', '33');
INSERT INTO `callback_key` VALUES ('1458', '14405103049713', '18588691207', '13790701296', '1440510307', '33');
INSERT INTO `callback_key` VALUES ('1459', '14405103469838', '18588691207', '13790701240', '1440510349', '33');
INSERT INTO `callback_key` VALUES ('1460', '14405104430082', '18588691207', '13790701258', '1440510446', '33');
INSERT INTO `callback_key` VALUES ('1461', '14405108271003', '18588691207', '18565370974', '1440510830', '33');
INSERT INTO `callback_key` VALUES ('1462', '14405111131694', '18588691207', '18565370974', '1440511115', '33');
INSERT INTO `callback_key` VALUES ('1463', '14405113402214', '18565370974', '13711778726', '1440511342', '33');
INSERT INTO `callback_key` VALUES ('1464', '14405113532239', '18565370974', '13790256562', '1440511356', '33');
INSERT INTO `callback_key` VALUES ('1465', '14405113742290', '18565370974', '15360704608', '1440511377', '33');
INSERT INTO `callback_key` VALUES ('1466', '14405113912312', '18565370974', '15360704608', '1440511393', '33');
INSERT INTO `callback_key` VALUES ('1467', '14405113922319', '18565370974', '15360704608', '1440511395', '33');
INSERT INTO `callback_key` VALUES ('1468', '14405113962337', '18588691207', '13791256660', '1440511399', '33');
INSERT INTO `callback_key` VALUES ('1469', '14405114552576', '18565370974', '15360704608', '1440511458', '33');
INSERT INTO `callback_key` VALUES ('1470', '14405114782639', '18565370974', '15360704608', '1440511481', '33');
INSERT INTO `callback_key` VALUES ('1471', '14405115242795', '18565370974', '15360704608', '1440511527', '33');
INSERT INTO `callback_key` VALUES ('1472', '14405115372833', '18565370974', '15360704608', '1440511539', '33');
INSERT INTO `callback_key` VALUES ('1473', '14405116643236', '18565370974', '13790701296', '1440511667', '33');
INSERT INTO `callback_key` VALUES ('1474', '14405117933628', '18565370974', '15360704608', '1440511796', '33');
INSERT INTO `callback_key` VALUES ('1475', '14405118203710', '18565370974', '15360704608', '1440511823', '33');
INSERT INTO `callback_key` VALUES ('1476', '14405536539601', '18588691207', '13790852369', '1440553655', '33');
INSERT INTO `callback_key` VALUES ('1477', '14405542480785', '18588691207', '13790701258', '1440554250', '33');
INSERT INTO `callback_key` VALUES ('1478', '14405578368872', '18588691207', '18565370974', '1440557838', '33');
INSERT INTO `callback_key` VALUES ('1479', '14405634421328', '18588691207', '13790712804', '1440563444', '33');
INSERT INTO `callback_key` VALUES ('1480', '14405685090100', '18588691207', '13790712804', '1440568511', '33');
INSERT INTO `callback_key` VALUES ('1481', '14405685310137', '18588691207', '13790712804', '1440568533', '33');
INSERT INTO `callback_key` VALUES ('1482', '14405688550634', '18565370974', '15360704607', '1440568858', '33');
INSERT INTO `callback_key` VALUES ('1483', '14405694371668', '18588691207', '18565370974', '1440569439', '33');
INSERT INTO `callback_key` VALUES ('1484', '14405694401672', '18588691207', '18565370974', '1440569442', '33');
INSERT INTO `callback_key` VALUES ('1485', '14405702082950', '18565370974', '15360704607', '1440570211', '33');
INSERT INTO `callback_key` VALUES ('1486', '14405763044213', '18588691207', '13790708520', '1440576306', '33');
INSERT INTO `callback_key` VALUES ('1487', '14417676480832', '18565370974', '15992294393', '1441767650', '83');
INSERT INTO `callback_key` VALUES ('1488', '14417677180910', '18565370974', '15992294393', '1441767720', '83');
INSERT INTO `callback_key` VALUES ('1489', '14417677920992', '18565370974', '15992294393', '1441767794', '83');
INSERT INTO `callback_key` VALUES ('1490', '14417680361263', '18565370974', '15992294393', '1441768039', '83');
INSERT INTO `callback_key` VALUES ('1491', '14418730102710', '18565370974', '13414080935', '1441873012', '83');

-- ----------------------------
-- Table structure for callrecord
-- ----------------------------
DROP TABLE IF EXISTS `callrecord`;
CREATE TABLE `callrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardid` char(30) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `second` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of callrecord
-- ----------------------------

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `voucher_acctname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` smallint(6) unsigned NOT NULL DEFAULT '0',
  `activedate` int(11) unsigned NOT NULL DEFAULT '0',
  `expiredays` smallint(6) unsigned NOT NULL DEFAULT '90',
  `enable` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `vouchered` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`cardname`),
  UNIQUE KEY `cardname` (`cardname`) USING BTREE,
  KEY `agent_id` (`agent_id`),
  KEY `balance` (`balance`),
  KEY `activedate` (`activedate`),
  KEY `enable` (`enable`),
  KEY `vouchered` (`vouchered`),
  KEY `voucher_acctname` (`voucher_acctname`),
  KEY `createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------

-- ----------------------------
-- Table structure for cardrecord
-- ----------------------------
DROP TABLE IF EXISTS `cardrecord`;
CREATE TABLE `cardrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cardname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `balance` int(10) unsigned NOT NULL DEFAULT '0',
  `vouchertime` int(10) unsigned NOT NULL DEFAULT '0',
  `oper` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `vouchertime` (`vouchertime`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cardrecord
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(30) NOT NULL,
  `description` mediumtext NOT NULL,
  `url` varchar(100) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `c_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_content` text NOT NULL,
  `c_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `c_phone` varchar(50) NOT NULL DEFAULT '',
  `c_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `c_time` int(11) unsigned NOT NULL DEFAULT '0',
  `c_pro` int(11) unsigned NOT NULL DEFAULT '0',
  `c_title` varchar(255) DEFAULT '',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for comment_box
-- ----------------------------
DROP TABLE IF EXISTS `comment_box`;
CREATE TABLE `comment_box` (
  `cb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `cb_pid` int(11) DEFAULT NULL COMMENT '应用pid',
  `cb_comment_type` int(11) DEFAULT NULL COMMENT '评论阶级',
  `cb_content` varchar(255) DEFAULT '' COMMENT '评论内容',
  `cb_uid` int(11) DEFAULT NULL COMMENT '代理商（用户）id',
  `cb_username` varchar(255) DEFAULT '' COMMENT '用户名称',
  `cb_comment_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_box
-- ----------------------------
INSERT INTO `comment_box` VALUES ('36', '9', '4', '1212', '1', 'all', '1438238445');
INSERT INTO `comment_box` VALUES ('37', '9', '1', '1212', '1', 'all', '1438238807');
INSERT INTO `comment_box` VALUES ('38', '9', '1', '11111111', '1', 'all', '1438238830');
INSERT INTO `comment_box` VALUES ('39', '9', '1', '1212', '1', 'all', '1438238842');
INSERT INTO `comment_box` VALUES ('40', '9', '1', '222', '1', 'all', '1438238852');
INSERT INTO `comment_box` VALUES ('41', '9', '5', '1212', '1', 'all', '1438238862');
INSERT INTO `comment_box` VALUES ('42', '9', '5', '1212', '1', 'all', '1438238870');

-- ----------------------------
-- Table structure for consulting
-- ----------------------------
DROP TABLE IF EXISTS `consulting`;
CREATE TABLE `consulting` (
  `c_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_content` varchar(255) NOT NULL DEFAULT '',
  `c_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `c_phone` varchar(50) NOT NULL DEFAULT '',
  `c_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `c_time` int(11) unsigned NOT NULL DEFAULT '0',
  `c_agent` int(11) unsigned NOT NULL DEFAULT '0',
  `c_first` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consulting
-- ----------------------------

-- ----------------------------
-- Table structure for contact_us
-- ----------------------------
DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE `contact_us` (
  `cu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cu_content` varchar(255) NOT NULL DEFAULT '',
  `cu_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `cu_order` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contact_us
-- ----------------------------

-- ----------------------------
-- Table structure for cooperation
-- ----------------------------
DROP TABLE IF EXISTS `cooperation`;
CREATE TABLE `cooperation` (
  `c_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `c_prospect` text NOT NULL,
  `c_conditions` text NOT NULL,
  `c_security` text NOT NULL,
  `c_uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cooperation
-- ----------------------------

-- ----------------------------
-- Table structure for cooperation_join
-- ----------------------------
DROP TABLE IF EXISTS `cooperation_join`;
CREATE TABLE `cooperation_join` (
  `cj_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cj_content` mediumtext NOT NULL,
  `cj_uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cooperation_join
-- ----------------------------

-- ----------------------------
-- Table structure for deposit_push
-- ----------------------------
DROP TABLE IF EXISTS `deposit_push`;
CREATE TABLE `deposit_push` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_url` varchar(255) DEFAULT '',
  `dep_sore` int(11) DEFAULT '0',
  `phone_type` int(11) DEFAULT '0',
  `dep_uid` int(11) DEFAULT '0',
  `dep_img` int(11) DEFAULT '0',
  PRIMARY KEY (`dep_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deposit_push
-- ----------------------------

-- ----------------------------
-- Table structure for dialing_push
-- ----------------------------
DROP TABLE IF EXISTS `dialing_push`;
CREATE TABLE `dialing_push` (
  `dp_id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_url` varchar(255) DEFAULT '',
  `dp_sore` int(11) DEFAULT '0',
  `phone_type` int(11) DEFAULT '0',
  `dp_uid` int(11) DEFAULT '0',
  `dp_img` int(11) DEFAULT '0',
  PRIMARY KEY (`dp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dialing_push
-- ----------------------------

-- ----------------------------
-- Table structure for disclaimer
-- ----------------------------
DROP TABLE IF EXISTS `disclaimer`;
CREATE TABLE `disclaimer` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_uid` int(11) NOT NULL DEFAULT '0',
  `d_time` varchar(20) NOT NULL,
  `d_order` int(11) NOT NULL DEFAULT '0',
  `d_content` text NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disclaimer
-- ----------------------------

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `f_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `f_pro` int(11) unsigned NOT NULL DEFAULT '0',
  `f_phone` varchar(30) NOT NULL DEFAULT '0',
  `f_uid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`f_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorites
-- ----------------------------

-- ----------------------------
-- Table structure for free_grab
-- ----------------------------
DROP TABLE IF EXISTS `free_grab`;
CREATE TABLE `free_grab` (
  `fg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fg_pic` varchar(255) NOT NULL DEFAULT '',
  `fg_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `fg_order` int(5) unsigned NOT NULL DEFAULT '0',
  `fg_desc` varchar(255) NOT NULL DEFAULT '',
  `fg_ptype` int(2) unsigned NOT NULL DEFAULT '0',
  `fg_title` varchar(255) NOT NULL DEFAULT '',
  `fg_starttime` int(11) unsigned NOT NULL,
  `fg_endtime` int(11) unsigned NOT NULL,
  `fg_send` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`fg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of free_grab
-- ----------------------------

-- ----------------------------
-- Table structure for free_grab_record
-- ----------------------------
DROP TABLE IF EXISTS `free_grab_record`;
CREATE TABLE `free_grab_record` (
  `fgr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fgr_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `fgr_phone` varchar(20) NOT NULL DEFAULT '',
  `fgr_fg` int(11) unsigned NOT NULL DEFAULT '0',
  `fgr_time` varchar(20) NOT NULL DEFAULT '',
  `fgr_winning` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`fgr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of free_grab_record
-- ----------------------------

-- ----------------------------
-- Table structure for free_grab_url
-- ----------------------------
DROP TABLE IF EXISTS `free_grab_url`;
CREATE TABLE `free_grab_url` (
  `fgu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fgu_full` varchar(255) NOT NULL DEFAULT '',
  `fgu_operation` varchar(255) NOT NULL DEFAULT '',
  `fgu_uid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fgu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of free_grab_url
-- ----------------------------

-- ----------------------------
-- Table structure for free_grab_zan
-- ----------------------------
DROP TABLE IF EXISTS `free_grab_zan`;
CREATE TABLE `free_grab_zan` (
  `fgz_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fgz_phone` varchar(35) NOT NULL DEFAULT '',
  `fgz_fg` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fgz_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of free_grab_zan
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_act
-- ----------------------------
DROP TABLE IF EXISTS `ftf_act`;
CREATE TABLE `ftf_act` (
  `act_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `act_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动主题',
  `act_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动属性',
  `act_time` varchar(255) NOT NULL DEFAULT '' COMMENT '活动时间',
  `act_address` varchar(255) NOT NULL DEFAULT '' COMMENT '活动地点',
  `act_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '活动简介',
  `act_topic` varchar(255) NOT NULL DEFAULT '' COMMENT '活动话题',
  `act_lable` int(8) NOT NULL DEFAULT '0' COMMENT '活动标签',
  `act_fqr_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动发起人ID',
  `act_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '活动状态（0:正常 1：暂停活动 2：取消活动）',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  `msg` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`act_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of ftf_act
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actcomment
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actcomment`;
CREATE TABLE `ftf_actcomment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `act_id` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(11) unsigned NOT NULL DEFAULT '0',
  `comment_content` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`comment_id`),
  KEY `act_id` (`act_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='活动评论表';

-- ----------------------------
-- Records of ftf_actcomment
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actimg
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actimg`;
CREATE TABLE `ftf_actimg` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `photo_url` varchar(255) NOT NULL DEFAULT '',
  `act_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  KEY `act_id` (`act_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='活动相册表';

-- ----------------------------
-- Records of ftf_actimg
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actlog
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actlog`;
CREATE TABLE `ftf_actlog` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `act_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `user_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送人ID',
  `log_title` varchar(255) NOT NULL DEFAULT '' COMMENT '日志主题',
  `log_content` text NOT NULL COMMENT '日志内容',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`log_id`),
  KEY `act_id` (`act_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='活动日志表';

-- ----------------------------
-- Records of ftf_actlog
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actlogreview
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actlogreview`;
CREATE TABLE `ftf_actlogreview` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `log_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `comment_fbq_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '发送人ID',
  `comment_content` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '消息发送时间',
  PRIMARY KEY (`msg_id`),
  KEY `comment_fbq_id` (`comment_fbq_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='活动日志评论表';

-- ----------------------------
-- Records of ftf_actlogreview
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actpraise
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actpraise`;
CREATE TABLE `ftf_actpraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `act_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `user_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '点赞人',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '点赞时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='活动点赞记录表';

-- ----------------------------
-- Records of ftf_actpraise
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actreview
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actreview`;
CREATE TABLE `ftf_actreview` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `act_id` int(11) NOT NULL DEFAULT '0' COMMENT '活动ID',
  `user_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送人ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '消息内容（文字/url）',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '消息发送时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型（0文字（表情）、1图片、2语音）',
  `content_time` varchar(100) NOT NULL DEFAULT '' COMMENT ' 消息时长（语音）',
  PRIMARY KEY (`msg_id`),
  KEY `act_id` (`act_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=264 DEFAULT CHARSET=utf8 COMMENT='活动评论表';

-- ----------------------------
-- Records of ftf_actreview
-- ----------------------------

-- ----------------------------
-- Table structure for ftf_actuser
-- ----------------------------
DROP TABLE IF EXISTS `ftf_actuser`;
CREATE TABLE `ftf_actuser` (
  `act_id` int(11) NOT NULL COMMENT '活动ID',
  `act_uid` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否参加 1邀请 2参加 3退出',
  `permissions` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 没有权限 1：有权限',
  `act_time` varchar(255) NOT NULL DEFAULT '0',
  `act_address` varchar(255) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '加入时间',
  KEY `act_id` (`act_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动参与表';

-- ----------------------------
-- Records of ftf_actuser
-- ----------------------------

-- ----------------------------
-- Table structure for hcard
-- ----------------------------
DROP TABLE IF EXISTS `hcard`;
CREATE TABLE `hcard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `voucher_acctname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` int(6) unsigned NOT NULL DEFAULT '0',
  `activedate` int(11) unsigned NOT NULL DEFAULT '0',
  `expiredays` smallint(6) unsigned NOT NULL DEFAULT '90',
  `enable` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `vouchered` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `card_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`cardname`),
  UNIQUE KEY `cardname` (`cardname`) USING BTREE,
  KEY `agent_id` (`agent_id`),
  KEY `balance` (`balance`),
  KEY `activedate` (`activedate`),
  KEY `enable` (`enable`),
  KEY `vouchered` (`vouchered`),
  KEY `voucher_acctname` (`voucher_acctname`),
  KEY `createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=119011 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcard
-- ----------------------------

-- ----------------------------
-- Table structure for hcardrecord
-- ----------------------------
DROP TABLE IF EXISTS `hcardrecord`;
CREATE TABLE `hcardrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cardname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `balance` int(10) unsigned NOT NULL DEFAULT '0',
  `vouchertime` int(10) unsigned NOT NULL DEFAULT '0',
  `oper` varchar(20) NOT NULL DEFAULT '',
  `card_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `vouchertime` (`vouchertime`)
) ENGINE=MyISAM AUTO_INCREMENT=610 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hcardrecord
-- ----------------------------
INSERT INTO `hcardrecord` VALUES ('606', '18565370974', '33', '100010', '10', '1440475531', '18565370974', '0');
INSERT INTO `hcardrecord` VALUES ('607', '18588691207', '33', '100009', '10', '1440496909', '18588691207', '0');
INSERT INTO `hcardrecord` VALUES ('608', '18565370979', '83', '10000010', '10', '1440729134', 'all', '0');
INSERT INTO `hcardrecord` VALUES ('609', '18565370979', '83', '10000009', '10', '1440729182', '18565370979', '0');

-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_uid` int(11) NOT NULL,
  `h_order` int(11) NOT NULL,
  `h_time` varchar(20) DEFAULT '',
  `h_content` text,
  PRIMARY KEY (`h_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of help
-- ----------------------------

-- ----------------------------
-- Table structure for img_push_url
-- ----------------------------
DROP TABLE IF EXISTS `img_push_url`;
CREATE TABLE `img_push_url` (
  `ipu_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipu_uid` int(11) DEFAULT '0',
  `ipu_pic_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ipu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img_push_url
-- ----------------------------

-- ----------------------------
-- Table structure for integral_log
-- ----------------------------
DROP TABLE IF EXISTS `integral_log`;
CREATE TABLE `integral_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) NOT NULL DEFAULT '0',
  `msg` char(30) NOT NULL DEFAULT '',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `createtime` (`createtime`),
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2206 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of integral_log
-- ----------------------------
INSERT INTO `integral_log` VALUES ('2200', '1', '18565370974', '0', '代理商 all 充值 12分钟', '1440468529', '5');
INSERT INTO `integral_log` VALUES ('2201', '33', '18565370974', '10', '100010 充值 10 分钟', '1440475531', '5');
INSERT INTO `integral_log` VALUES ('2202', '33', '18588691207', '10', '100009 充值 10 分钟', '1440496909', '5');
INSERT INTO `integral_log` VALUES ('2203', '1', '18565370979', '0', '代理商 all 充值 1面值', '1440729080', '5');
INSERT INTO `integral_log` VALUES ('2204', '83', '18565370979', '10', '10000010 充值 10 金额', '1440729134', '5');
INSERT INTO `integral_log` VALUES ('2205', '83', '18565370979', '10', '10000009 充值 10 面值', '1440729182', '5');

-- ----------------------------
-- Table structure for interaction_ad
-- ----------------------------
DROP TABLE IF EXISTS `interaction_ad`;
CREATE TABLE `interaction_ad` (
  `ia_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ia_url` varchar(255) NOT NULL DEFAULT '',
  `ia_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `ia_order` int(5) unsigned NOT NULL DEFAULT '0',
  `ia_pic` varchar(255) NOT NULL DEFAULT '',
  `ia_position` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`ia_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interaction_ad
-- ----------------------------

-- ----------------------------
-- Table structure for interaction_ad_url
-- ----------------------------
DROP TABLE IF EXISTS `interaction_ad_url`;
CREATE TABLE `interaction_ad_url` (
  `iau_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `iau_small_full` varchar(255) NOT NULL DEFAULT '',
  `iau_small_operation` varchar(255) NOT NULL DEFAULT '',
  `iau_uid` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`iau_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of interaction_ad_url
-- ----------------------------

-- ----------------------------
-- Table structure for join_apply
-- ----------------------------
DROP TABLE IF EXISTS `join_apply`;
CREATE TABLE `join_apply` (
  `ja_id` int(11) NOT NULL AUTO_INCREMENT,
  `ja_company` varchar(255) NOT NULL DEFAULT '',
  `ja_address` varchar(255) NOT NULL DEFAULT '',
  `ja_people` varchar(255) NOT NULL DEFAULT '',
  `ja_phone` varchar(20) NOT NULL DEFAULT '',
  `ja_num` varchar(20) NOT NULL DEFAULT '',
  `ja_uid` int(11) NOT NULL DEFAULT '0',
  `ja_brand` mediumtext NOT NULL,
  `ja_advantage` mediumtext NOT NULL,
  `ja_operation` mediumtext NOT NULL,
  `ja_pid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ja_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of join_apply
-- ----------------------------

-- ----------------------------
-- Table structure for join_us
-- ----------------------------
DROP TABLE IF EXISTS `join_us`;
CREATE TABLE `join_us` (
  `ju_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ju_content` varchar(255) NOT NULL DEFAULT '',
  `ju_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `ju_type` int(5) unsigned NOT NULL DEFAULT '0',
  `ju_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ju_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of join_us
-- ----------------------------

-- ----------------------------
-- Table structure for ju_type
-- ----------------------------
DROP TABLE IF EXISTS `ju_type`;
CREATE TABLE `ju_type` (
  `jut_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `jut_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`jut_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ju_type
-- ----------------------------
INSERT INTO `ju_type` VALUES ('4', '招商加盟');
INSERT INTO `ju_type` VALUES ('5', '会员说明');

-- ----------------------------
-- Table structure for lcard
-- ----------------------------
DROP TABLE IF EXISTS `lcard`;
CREATE TABLE `lcard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cardname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `password` char(10) NOT NULL DEFAULT '',
  `voucher_acctname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` smallint(6) unsigned NOT NULL DEFAULT '0',
  `activedate` int(11) unsigned NOT NULL DEFAULT '0',
  `enable` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `vouchered` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `flow_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`cardname`),
  UNIQUE KEY `cardname` (`cardname`) USING BTREE,
  KEY `agent_id` (`agent_id`),
  KEY `balance` (`balance`),
  KEY `activedate` (`activedate`),
  KEY `enable` (`enable`),
  KEY `vouchered` (`vouchered`),
  KEY `voucher_acctname` (`voucher_acctname`),
  KEY `createtime` (`createtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lcard
-- ----------------------------

-- ----------------------------
-- Table structure for lcardrecord
-- ----------------------------
DROP TABLE IF EXISTS `lcardrecord`;
CREATE TABLE `lcardrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cardname` bigint(20) unsigned NOT NULL DEFAULT '0',
  `balance` int(10) unsigned NOT NULL DEFAULT '0',
  `vouchertime` int(10) unsigned NOT NULL DEFAULT '0',
  `oper` varchar(20) NOT NULL DEFAULT '',
  `orderid` varchar(30) NOT NULL DEFAULT '',
  `flow_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `desc` varchar(30) NOT NULL DEFAULT '',
  `mporderid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `vouchertime` (`vouchertime`),
  KEY `mporderid` (`mporderid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lcardrecord
-- ----------------------------

-- ----------------------------
-- Table structure for location_pic
-- ----------------------------
DROP TABLE IF EXISTS `location_pic`;
CREATE TABLE `location_pic` (
  `lp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lp_pic` varchar(255) NOT NULL DEFAULT '',
  `lp_ptype` int(5) unsigned NOT NULL DEFAULT '0',
  `lp_url` varchar(255) NOT NULL DEFAULT '',
  `lp_uid` int(5) unsigned NOT NULL DEFAULT '0',
  `lp_order` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of location_pic
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `m_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `m_content` varchar(255) NOT NULL DEFAULT '',
  `m_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `m_phone` varchar(50) NOT NULL DEFAULT '',
  `m_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `m_time` int(11) unsigned NOT NULL DEFAULT '0',
  `m_agent` int(11) unsigned NOT NULL DEFAULT '0',
  `m_first` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`m_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for news_central
-- ----------------------------
DROP TABLE IF EXISTS `news_central`;
CREATE TABLE `news_central` (
  `nc_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nc_content` text NOT NULL,
  `nc_type` int(5) unsigned NOT NULL DEFAULT '0',
  `nc_uid` int(5) unsigned NOT NULL DEFAULT '0',
  `nc_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `nc_time` int(11) unsigned DEFAULT '0',
  `nc_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`nc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_central
-- ----------------------------
INSERT INTO `news_central` VALUES ('78', '12', '1', '33', '0', '1438134124', '12');

-- ----------------------------
-- Table structure for news_reading
-- ----------------------------
DROP TABLE IF EXISTS `news_reading`;
CREATE TABLE `news_reading` (
  `nr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nr_phone` varchar(35) NOT NULL DEFAULT '',
  `nr_nc` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_reading
-- ----------------------------

-- ----------------------------
-- Table structure for news_type
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `nt_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nt_name` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_type
-- ----------------------------
INSERT INTO `news_type` VALUES ('1', '公告');
INSERT INTO `news_type` VALUES ('2', '活动');
INSERT INTO `news_type` VALUES ('3', '阅读');
INSERT INTO `news_type` VALUES ('4', '新闻');

-- ----------------------------
-- Table structure for order_box
-- ----------------------------
DROP TABLE IF EXISTS `order_box`;
CREATE TABLE `order_box` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_product` varchar(30) DEFAULT '',
  `o_price` float DEFAULT '0',
  `o_username` varchar(30) DEFAULT '',
  `o_createtime` int(11) DEFAULT NULL,
  `o_status` int(11) DEFAULT '0',
  `order_id` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_box
-- ----------------------------
INSERT INTO `order_box` VALUES ('3', '雅芳', '2000', null, '1438238641', '0', 'DJ201507300244016767');
INSERT INTO `order_box` VALUES ('4', '雅芳', '2000', null, '1439257900', '0', 'DJ201508110951403073');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` varchar(30) NOT NULL DEFAULT '',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` smallint(6) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `flow_type` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `createtime` (`createtime`),
  KEY `flow_type` (`flow_type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for picture_type
-- ----------------------------
DROP TABLE IF EXISTS `picture_type`;
CREATE TABLE `picture_type` (
  `pt_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pt_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture_type
-- ----------------------------
INSERT INTO `picture_type` VALUES ('1', 'iPhone');
INSERT INTO `picture_type` VALUES ('2', 'Android');

-- ----------------------------
-- Table structure for picture_url
-- ----------------------------
DROP TABLE IF EXISTS `picture_url`;
CREATE TABLE `picture_url` (
  `pu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pu_small_full` varchar(255) NOT NULL DEFAULT '',
  `pu_small_operation` varchar(255) NOT NULL DEFAULT '',
  `pu_uid` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=410 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture_url
-- ----------------------------

-- ----------------------------
-- Table structure for plu_pic
-- ----------------------------
DROP TABLE IF EXISTS `plu_pic`;
CREATE TABLE `plu_pic` (
  `pp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pp_pic` varchar(255) NOT NULL DEFAULT '',
  `pp_ptype` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_url` varchar(255) NOT NULL DEFAULT '',
  `pp_uid` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_order` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plu_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pro_manager
-- ----------------------------
DROP TABLE IF EXISTS `pro_manager`;
CREATE TABLE `pro_manager` (
  `prm_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prm_content` text NOT NULL,
  `prm_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `prm_time` varchar(15) NOT NULL DEFAULT '',
  `prm_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `prm_phone` varchar(20) NOT NULL DEFAULT '',
  `prm_pro` int(11) unsigned NOT NULL DEFAULT '0',
  `prm_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`prm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_manager
-- ----------------------------

-- ----------------------------
-- Table structure for pro_send_log
-- ----------------------------
DROP TABLE IF EXISTS `pro_send_log`;
CREATE TABLE `pro_send_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pro_id` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `createtime` (`createtime`),
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_send_log
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_show_pic` varchar(255) NOT NULL DEFAULT '',
  `pro_details_pic` text NOT NULL,
  `pro_desc` varchar(255) NOT NULL DEFAULT '',
  `pro_url_page` varchar(255) NOT NULL DEFAULT '',
  `pro_uid` int(5) unsigned NOT NULL DEFAULT '0',
  `pro_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pro_member_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `pro_title` varchar(255) NOT NULL DEFAULT '',
  `pro_details_desc` varchar(255) NOT NULL DEFAULT '',
  `pro_order` int(5) unsigned NOT NULL DEFAULT '0',
  `pro_read_minutes` float NOT NULL,
  `pro_read_amount` decimal(10,2) NOT NULL,
  `pro_share_amount` decimal(10,2) NOT NULL,
  `pro_show` int(11) NOT NULL DEFAULT '0',
  `pro_category` int(11) NOT NULL DEFAULT '0',
  `pro_corner_mark` varchar(15) NOT NULL,
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pro_id`)
) ENGINE=MyISAM AUTO_INCREMENT=360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `pc_id` int(5) unsigned NOT NULL DEFAULT '0',
  `pc_name` varchar(20) NOT NULL DEFAULT '',
  `agent_id` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '全部', '0');
INSERT INTO `product_category` VALUES ('2', '有礼', '0');
INSERT INTO `product_category` VALUES ('3', '特惠', '0');
INSERT INTO `product_category` VALUES ('4', '最新', '0');
INSERT INTO `product_category` VALUES ('1', '全部', '33');
INSERT INTO `product_category` VALUES ('2', '新品', '33');
INSERT INTO `product_category` VALUES ('3', '特价', '33');
INSERT INTO `product_category` VALUES ('4', '红包', '33');
INSERT INTO `product_category` VALUES ('1', '求是初中', '70');
INSERT INTO `product_category` VALUES ('2', '求是高中', '70');
INSERT INTO `product_category` VALUES ('3', '求是美术', '70');
INSERT INTO `product_category` VALUES ('4', '花季雨季', '70');
INSERT INTO `product_category` VALUES ('1', '生态景区', '71');
INSERT INTO `product_category` VALUES ('2', '酒店宾馆', '71');
INSERT INTO `product_category` VALUES ('3', '生态旅游商品', '71');
INSERT INTO `product_category` VALUES ('4', '特色农家乐', '71');
INSERT INTO `product_category` VALUES ('1', '全部', '72');
INSERT INTO `product_category` VALUES ('2', '最新', '72');
INSERT INTO `product_category` VALUES ('3', '特惠', '72');
INSERT INTO `product_category` VALUES ('4', '咨询', '72');

-- ----------------------------
-- Table structure for product_exchange
-- ----------------------------
DROP TABLE IF EXISTS `product_exchange`;
CREATE TABLE `product_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pro_id` int(10) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `consignee_number` varchar(30) NOT NULL DEFAULT '',
  `consignee` varchar(30) NOT NULL DEFAULT '',
  `consignee_addr` varchar(255) NOT NULL DEFAULT '',
  `username` bigint(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pro_id` (`pro_id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for product_manager
-- ----------------------------
DROP TABLE IF EXISTS `product_manager`;
CREATE TABLE `product_manager` (
  `pm_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pm_content` varchar(255) NOT NULL DEFAULT '',
  `pm_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `pm_time` varchar(15) NOT NULL DEFAULT '',
  `pm_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `pm_phone` varchar(20) NOT NULL DEFAULT '',
  `pm_suggest` text NOT NULL,
  PRIMARY KEY (`pm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_manager
-- ----------------------------

-- ----------------------------
-- Table structure for product_push
-- ----------------------------
DROP TABLE IF EXISTS `product_push`;
CREATE TABLE `product_push` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_url` varchar(255) DEFAULT '',
  `pp_sore` int(11) DEFAULT '0',
  `phone_type` int(11) DEFAULT '0',
  `pp_uid` int(11) DEFAULT '0',
  `pp_img` int(11) DEFAULT '0',
  PRIMARY KEY (`pp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_push
-- ----------------------------

-- ----------------------------
-- Table structure for product_url
-- ----------------------------
DROP TABLE IF EXISTS `product_url`;
CREATE TABLE `product_url` (
  `pru_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pru_small_full` varchar(255) NOT NULL DEFAULT '',
  `pru_small_operation` varchar(255) NOT NULL DEFAULT '',
  `pru_uid` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pru_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1368 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_url
-- ----------------------------

-- ----------------------------
-- Table structure for public_relations_pic
-- ----------------------------
DROP TABLE IF EXISTS `public_relations_pic`;
CREATE TABLE `public_relations_pic` (
  `prp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `prp_pic` varchar(255) NOT NULL DEFAULT '',
  `prp_ptype` int(5) unsigned NOT NULL DEFAULT '0',
  `prp_url` varchar(255) NOT NULL DEFAULT '',
  `prp_uid` int(5) unsigned NOT NULL DEFAULT '0',
  `prp_order` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`prp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of public_relations_pic
-- ----------------------------

-- ----------------------------
-- Table structure for recommendation_pic
-- ----------------------------
DROP TABLE IF EXISTS `recommendation_pic`;
CREATE TABLE `recommendation_pic` (
  `rp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `rp_url` varchar(255) NOT NULL DEFAULT '',
  `rp_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `rp_order` int(5) unsigned NOT NULL DEFAULT '0',
  `rp_pic` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommendation_pic
-- ----------------------------

-- ----------------------------
-- Table structure for record201508
-- ----------------------------
DROP TABLE IF EXISTS `record201508`;
CREATE TABLE `record201508` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `callee` bigint(20) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `second` int(11) NOT NULL DEFAULT '0',
  `key` bigint(20) unsigned NOT NULL DEFAULT '0',
  `callid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `callee` (`callee`),
  KEY `starttime` (`starttime`),
  KEY `key` (`key`),
  KEY `callid` (`callid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record201508
-- ----------------------------

-- ----------------------------
-- Table structure for record201509
-- ----------------------------
DROP TABLE IF EXISTS `record201509`;
CREATE TABLE `record201509` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `callee` bigint(20) unsigned NOT NULL DEFAULT '0',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `second` int(11) NOT NULL DEFAULT '0',
  `key` bigint(20) unsigned NOT NULL DEFAULT '0',
  `callid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `username` (`username`),
  KEY `callee` (`callee`),
  KEY `starttime` (`starttime`),
  KEY `key` (`key`),
  KEY `callid` (`callid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record201509
-- ----------------------------

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment` (
  `r_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `r_content` text NOT NULL,
  `r_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `r_time` varchar(20) NOT NULL DEFAULT '',
  `r_post_name` varchar(255) NOT NULL DEFAULT '',
  `r_company_name` varchar(255) NOT NULL DEFAULT '',
  `r_wage` varchar(20) NOT NULL DEFAULT '',
  `r_working_time` varchar(20) NOT NULL DEFAULT '',
  `r_education` varchar(20) NOT NULL DEFAULT '',
  `r_working_place` varchar(20) NOT NULL DEFAULT '',
  `r_phone` varchar(20) NOT NULL DEFAULT '',
  `r_Email` varchar(20) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recruitment
-- ----------------------------

-- ----------------------------
-- Table structure for reply_box
-- ----------------------------
DROP TABLE IF EXISTS `reply_box`;
CREATE TABLE `reply_box` (
  `rb_id` int(11) NOT NULL AUTO_INCREMENT,
  `rb_cid` int(11) DEFAULT '0',
  `rb_content` varchar(255) DEFAULT '',
  `rb_uid` int(11) DEFAULT '0',
  `rb_username` varchar(30) DEFAULT '',
  `rb_reply_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply_box
-- ----------------------------

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `r_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `r_pro` int(11) unsigned NOT NULL DEFAULT '0',
  `r_content` text NOT NULL,
  `r_phone` varchar(30) NOT NULL DEFAULT '',
  `r_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `r_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `r_time` int(11) unsigned NOT NULL DEFAULT '0',
  `r_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`r_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `re_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `re_pro` int(11) unsigned NOT NULL DEFAULT '0',
  `re_phone` varchar(30) NOT NULL DEFAULT '',
  `re_uid` int(11) unsigned NOT NULL DEFAULT '0',
  `re_unread` int(2) unsigned NOT NULL DEFAULT '0',
  `re_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`re_id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------

-- ----------------------------
-- Table structure for service_net
-- ----------------------------
DROP TABLE IF EXISTS `service_net`;
CREATE TABLE `service_net` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `x` decimal(17,7) DEFAULT '0.0000000',
  `y` decimal(17,7) DEFAULT '0.0000000',
  `s_order` int(11) DEFAULT '0',
  `s_time` int(11) DEFAULT '0',
  `mark` varchar(30) DEFAULT '',
  `s_uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_net
-- ----------------------------

-- ----------------------------
-- Table structure for servicetel
-- ----------------------------
DROP TABLE IF EXISTS `servicetel`;
CREATE TABLE `servicetel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servicetel
-- ----------------------------
INSERT INTO `servicetel` VALUES ('7', '82', '12', '12', '123');
INSERT INTO `servicetel` VALUES ('8', '1', '0', '', '');
INSERT INTO `servicetel` VALUES ('6', '1', '123', '12', '1223');

-- ----------------------------
-- Table structure for session_box
-- ----------------------------
DROP TABLE IF EXISTS `session_box`;
CREATE TABLE `session_box` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_pid` int(11) DEFAULT NULL,
  `s_uid` int(11) DEFAULT NULL,
  `s_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of session_box
-- ----------------------------
INSERT INTO `session_box` VALUES ('2', '9', '1', '1438238479');

-- ----------------------------
-- Table structure for share
-- ----------------------------
DROP TABLE IF EXISTS `share`;
CREATE TABLE `share` (
  `s_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `s_pro` int(11) unsigned NOT NULL DEFAULT '0',
  `s_phone` varchar(30) NOT NULL DEFAULT '',
  `s_uid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`s_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of share
-- ----------------------------

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acctname` char(20) NOT NULL DEFAULT '',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `clientip` char(30) NOT NULL DEFAULT '',
  `logtext` char(200) NOT NULL DEFAULT '',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2749 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('2653', 'all', '1', '0.0.0.0', '用户登录', '1437787190');
INSERT INTO `syslog` VALUES ('2654', 'all', '1', '0.0.0.0', '用户登录', '1437805700');
INSERT INTO `syslog` VALUES ('2655', 'all', '1', '0.0.0.0', '添加代理商 12', '1437815335');
INSERT INTO `syslog` VALUES ('2656', 'all', '1', '0.0.0.0', '用户登录', '1437957913');
INSERT INTO `syslog` VALUES ('2657', 'all', '1', '0.0.0.0', '用户登录', '1437975790');
INSERT INTO `syslog` VALUES ('2658', 'all', '1', '0.0.0.0', '添加客服电话', '1437983430');
INSERT INTO `syslog` VALUES ('2659', 'all', '1', '0.0.0.0', '添加客服电话', '1437983529');
INSERT INTO `syslog` VALUES ('2660', 'all', '1', '0.0.0.0', '添加客服电话', '1437983545');
INSERT INTO `syslog` VALUES ('2661', 'all', '1', '0.0.0.0', '添加客服电话', '1437983571');
INSERT INTO `syslog` VALUES ('2662', 'all', '1', '0.0.0.0', '添加客服电话', '1437983584');
INSERT INTO `syslog` VALUES ('2663', 'all', '1', '0.0.0.0', '修改客服电话 12', '1437990524');
INSERT INTO `syslog` VALUES ('2664', 'all', '1', '0.0.0.0', '修改客服电话 12', '1437990528');
INSERT INTO `syslog` VALUES ('2665', 'all', '1', '0.0.0.0', '删除客服电话', '1437991138');
INSERT INTO `syslog` VALUES ('2666', 'all', '1', '0.0.0.0', '删除客服电话', '1437991141');
INSERT INTO `syslog` VALUES ('2667', 'all', '1', '0.0.0.0', '删除客服电话', '1437991143');
INSERT INTO `syslog` VALUES ('2668', 'all', '1', '0.0.0.0', '修改客服电话 12', '1437991147');
INSERT INTO `syslog` VALUES ('2669', 'all', '1', '0.0.0.0', '添加客服电话 12', '1437991152');
INSERT INTO `syslog` VALUES ('2670', 'all', '1', '0.0.0.0', '修改客服电话 12', '1437991156');
INSERT INTO `syslog` VALUES ('2671', 'all', '1', '0.0.0.0', '添加客服电话', '1437994603');
INSERT INTO `syslog` VALUES ('2672', 'all', '1', '0.0.0.0', '添加官方网站', '1437994634');
INSERT INTO `syslog` VALUES ('2673', 'all', '1', '0.0.0.0', '添加官方网站', '1437994641');
INSERT INTO `syslog` VALUES ('2674', 'all', '1', '0.0.0.0', '添加官方网站', '1437994647');
INSERT INTO `syslog` VALUES ('2675', 'all', '1', '0.0.0.0', '修改官方网站', '1437995341');
INSERT INTO `syslog` VALUES ('2676', 'all', '1', '0.0.0.0', '修改官方网站', '1437995345');
INSERT INTO `syslog` VALUES ('2677', 'all', '1', '0.0.0.0', '删除官方网站', '1437995351');
INSERT INTO `syslog` VALUES ('2678', 'all', '1', '0.0.0.0', '删除官方网站', '1437995372');
INSERT INTO `syslog` VALUES ('2679', '12', '82', '0.0.0.0', '用户登录', '1438001188');
INSERT INTO `syslog` VALUES ('2680', 'all', '1', '0.0.0.0', '用户登录', '1438001204');
INSERT INTO `syslog` VALUES ('2681', '12', '82', '0.0.0.0', '用户登录', '1438001222');
INSERT INTO `syslog` VALUES ('2682', 'all', '1', '0.0.0.0', '用户登录', '1438132323');
INSERT INTO `syslog` VALUES ('2683', '12', '33', '0.0.0.0', '用户登录', '1438132750');
INSERT INTO `syslog` VALUES ('2684', 'all', '1', '0.0.0.0', '用户登录', '1438134139');
INSERT INTO `syslog` VALUES ('2685', 'all', '1', '0.0.0.0', '用户登录', '1438236554');
INSERT INTO `syslog` VALUES ('2686', 'all', '1', '0.0.0.0', '用户登录', '1438322686');
INSERT INTO `syslog` VALUES ('2687', 'all', '1', '0.0.0.0', '用户登录', '1438414334');
INSERT INTO `syslog` VALUES ('2688', 'all', '1', '127.0.0.1', '用户登录', '1438753060');
INSERT INTO `syslog` VALUES ('2689', 'all', '1', '0.0.0.0', '用户登录', '1439255169');
INSERT INTO `syslog` VALUES ('2690', 'all', '1', '0.0.0.0', '用户登录', '1439277491');
INSERT INTO `syslog` VALUES ('2691', 'all', '1', '0.0.0.0', '用户登录', '1439280369');
INSERT INTO `syslog` VALUES ('2692', 'all', '1', '0.0.0.0', '用户登录', '1439373390');
INSERT INTO `syslog` VALUES ('2693', 'all', '1', '0.0.0.0', '用户登录', '1439373795');
INSERT INTO `syslog` VALUES ('2694', 'all', '1', '0.0.0.0', '用户登录', '1439437599');
INSERT INTO `syslog` VALUES ('2695', 'all', '1', '0.0.0.0', '用户登录', '1439544484');
INSERT INTO `syslog` VALUES ('2696', 'all', '1', '0.0.0.0', '用户登录', '1439544811');
INSERT INTO `syslog` VALUES ('2697', 'all', '1', '0.0.0.0', '用户登录', '1439644244');
INSERT INTO `syslog` VALUES ('2698', 'all', '1', '0.0.0.0', '用户登录', '1439719595');
INSERT INTO `syslog` VALUES ('2699', 'all', '1', '0.0.0.0', '用户登录', '1439817692');
INSERT INTO `syslog` VALUES ('2700', 'all', '1', '0.0.0.0', '用户登录', '1439861306');
INSERT INTO `syslog` VALUES ('2701', 'all', '1', '0.0.0.0', '用户登录', '1439989973');
INSERT INTO `syslog` VALUES ('2702', 'all', '1', '0.0.0.0', '用户登录', '1440040825');
INSERT INTO `syslog` VALUES ('2703', 'all', '1', '0.0.0.0', '用户登录', '1440065444');
INSERT INTO `syslog` VALUES ('2704', 'all', '1', '0.0.0.0', '用户登录', '1440121432');
INSERT INTO `syslog` VALUES ('2705', 'all', '1', '0.0.0.0', '用户登录', '1440145959');
INSERT INTO `syslog` VALUES ('2706', 'all', '1', '0.0.0.0', '用户登录', '1440229098');
INSERT INTO `syslog` VALUES ('2707', 'all', '1', '0.0.0.0', '用户登录', '1440320339');
INSERT INTO `syslog` VALUES ('2708', 'all', '1', '0.0.0.0', '用户登录', '1440400968');
INSERT INTO `syslog` VALUES ('2709', 'all', '1', '0.0.0.0', '生成话费卡100001 - 100011', '1440400982');
INSERT INTO `syslog` VALUES ('2710', 'all', '1', '0.0.0.0', '用户登录', '1440413642');
INSERT INTO `syslog` VALUES ('2711', 'all', '1', '0.0.0.0', '用户登录', '1440468370');
INSERT INTO `syslog` VALUES ('2712', 'all', '1', '0.0.0.0', '给用户   充值 12 分钟', '1440468529');
INSERT INTO `syslog` VALUES ('2713', 'all', '1', '0.0.0.0', '生成话费卡100011 - 100023', '1440468589');
INSERT INTO `syslog` VALUES ('2714', '12', '33', '0.0.0.0', '用户登录', '1440468823');
INSERT INTO `syslog` VALUES ('2715', 'all', '1', '0.0.0.0', '用户登录', '1440468918');
INSERT INTO `syslog` VALUES ('2716', '12', '33', '0.0.0.0', '用户登录', '1440468934');
INSERT INTO `syslog` VALUES ('2717', 'all', '1', '0.0.0.0', '用户登录', '1440470543');
INSERT INTO `syslog` VALUES ('2718', '', '0', '0.0.0.0', '用户名或密码错误', '1440489937');
INSERT INTO `syslog` VALUES ('2719', 'all', '1', '0.0.0.0', '用户登录', '1440489941');
INSERT INTO `syslog` VALUES ('2720', 'all', '1', '0.0.0.0', '用户登录', '1440495091');
INSERT INTO `syslog` VALUES ('2721', 'all', '1', '0.0.0.0', '修改代理商密码 all', '1440502041');
INSERT INTO `syslog` VALUES ('2722', 'all', '1', '0.0.0.0', '代理商 12 禁用成功', '1440511882');
INSERT INTO `syslog` VALUES ('2723', 'all', '1', '0.0.0.0', '用户登录', '1440553451');
INSERT INTO `syslog` VALUES ('2724', 'all', '1', '0.0.0.0', '代理商 12 激活成功', '1440553462');
INSERT INTO `syslog` VALUES ('2725', 'all', '1', '0.0.0.0', '用户登录', '1440580948');
INSERT INTO `syslog` VALUES ('2726', 'all', '1', '0.0.0.0', '用户登录', '1440592765');
INSERT INTO `syslog` VALUES ('2727', 'all', '1', '0.0.0.0', '用户登录', '1440647908');
INSERT INTO `syslog` VALUES ('2728', 'all', '1', '0.0.0.0', '用户登录', '1440659429');
INSERT INTO `syslog` VALUES ('2729', 'all', '1', '0.0.0.0', '用户登录', '1440671129');
INSERT INTO `syslog` VALUES ('2730', 'all', '1', '0.0.0.0', '删除代理商 12', '1440728423');
INSERT INTO `syslog` VALUES ('2731', 'all', '1', '0.0.0.0', '添加代理商 微话电讯', '1440728449');
INSERT INTO `syslog` VALUES ('2732', 'all', '1', '0.0.0.0', '修改代理商密码 微话电讯', '1440728455');
INSERT INTO `syslog` VALUES ('2733', 'all', '1', '0.0.0.0', '修改代理商密码 微话电讯', '1440728655');
INSERT INTO `syslog` VALUES ('2734', 'all', '1', '0.0.0.0', '给用户   充值 1 面值', '1440729080');
INSERT INTO `syslog` VALUES ('2735', 'all', '1', '0.0.0.0', '生成话费卡10000001 - 10000011', '1440729112');
INSERT INTO `syslog` VALUES ('2736', 'all', '1', '0.0.0.0', '充值话费卡 10000010', '1440729134');
INSERT INTO `syslog` VALUES ('2737', 'all', '1', '0.0.0.0', '添加代理商 12', '1440729719');
INSERT INTO `syslog` VALUES ('2738', 'all', '1', '0.0.0.0', '添加代理商 123', '1440729803');
INSERT INTO `syslog` VALUES ('2739', 'all', '1', '0.0.0.0', '删除代理商 123', '1440729835');
INSERT INTO `syslog` VALUES ('2740', 'all', '1', '0.0.0.0', '删除代理商 12', '1440729837');
INSERT INTO `syslog` VALUES ('2741', 'all', '1', '0.0.0.0', '用户登录', '1440832960');
INSERT INTO `syslog` VALUES ('2742', 'all', '1', '0.0.0.0', '用户登录', '1440991298');
INSERT INTO `syslog` VALUES ('2743', 'all', '1', '0.0.0.0', '用户登录', '1441763665');
INSERT INTO `syslog` VALUES ('2744', 'all', '1', '0.0.0.0', '修改代理商密码 微话电讯', '1441767560');
INSERT INTO `syslog` VALUES ('2745', 'all', '1', '0.0.0.0', '用户登录', '1441873401');
INSERT INTO `syslog` VALUES ('2746', 'all', '1', '183.5.239.221', '用户登录', '1442930660');
INSERT INTO `syslog` VALUES ('2747', 'all', '1', '183.5.239.221', '用户登录', '1442930808');
INSERT INTO `syslog` VALUES ('2748', 'all', '1', '183.5.239.221', '用户登录', '1442930880');

-- ----------------------------
-- Table structure for user_box
-- ----------------------------
DROP TABLE IF EXISTS `user_box`;
CREATE TABLE `user_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `db_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_box
-- ----------------------------
INSERT INTO `user_box` VALUES ('1', 'all', 'vosweb625');
INSERT INTO `user_box` VALUES ('2', 'poo_1', '1vosweb');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `balance` int(11) NOT NULL DEFAULT '0',
  `limitbalance` int(11) unsigned NOT NULL DEFAULT '0',
  `activedate` int(11) unsigned NOT NULL DEFAULT '0',
  `expiredate` int(11) unsigned NOT NULL DEFAULT '0',
  `enable` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `nick` varchar(32) NOT NULL DEFAULT '',
  `user_pic` varchar(100) NOT NULL DEFAULT '',
  `integral` int(11) unsigned NOT NULL DEFAULT '0',
  `costintegral` int(11) unsigned NOT NULL DEFAULT '0',
  `card_type` tinyint(4) NOT NULL DEFAULT '0',
  `baoyueexpire` int(10) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `age` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hobby` varchar(255) NOT NULL DEFAULT '',
  `is_gift` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `area` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `agent_id` (`agent_id`),
  KEY `activedate` (`activedate`)
) ENGINE=MyISAM AUTO_INCREMENT=1807 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1804', '18565370974', '123456', '83', '-1', '0', '1439279476', '1541871476', '1', '', '', '0', '0', '0', '0', '0', '0', '', '0', '');
INSERT INTO `users` VALUES ('1806', '18565370979', '123467', '83', '23', '0', '1440728810', '1448504810', '1', '', '', '0', '0', '0', '0', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for warnlog
-- ----------------------------
DROP TABLE IF EXISTS `warnlog`;
CREATE TABLE `warnlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg` varchar(60) NOT NULL DEFAULT '',
  `username` bigint(20) unsigned NOT NULL DEFAULT '0',
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2054 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warnlog
-- ----------------------------
INSERT INTO `warnlog` VALUES ('2000', '用户已过期 18565370974, 被叫 15360704607', '18565370974', '33', '1440320322');
INSERT INTO `warnlog` VALUES ('2001', '用户已过期 18565370974, 被叫 15360704607', '18565370974', '33', '1440397153');
INSERT INTO `warnlog` VALUES ('2002', '用户已过期 18565370974, 被叫 15360704607', '18565370974', '33', '1440397412');
INSERT INTO `warnlog` VALUES ('2003', '用户已过期 18565370974, 被叫 15360704607', '18565370974', '33', '1440397766');
INSERT INTO `warnlog` VALUES ('2004', '用户分钟数不足,主叫 18565370974, 被叫 15360704607, 分钟数 -1', '18565370974', '33', '1440397840');
INSERT INTO `warnlog` VALUES ('2005', '用户分钟数不足,主叫 18565370974, 被叫 15360704607, 分钟数 -1', '18565370974', '33', '1440401867');
INSERT INTO `warnlog` VALUES ('2006', '用户分钟数不足,主叫 18565370974, 被叫 13790858589, 分钟数 -1', '18565370974', '33', '1440404597');
INSERT INTO `warnlog` VALUES ('2007', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440407509');
INSERT INTO `warnlog` VALUES ('2008', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440407541');
INSERT INTO `warnlog` VALUES ('2009', '用户分钟数不足,主叫 18565370974, 被叫 13707012969, 分钟数 -1', '18565370974', '33', '1440411673');
INSERT INTO `warnlog` VALUES ('2010', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440411692');
INSERT INTO `warnlog` VALUES ('2011', '用户分钟数不足,主叫 18565370974, 被叫 13790701263, 分钟数 -1', '18565370974', '33', '1440411742');
INSERT INTO `warnlog` VALUES ('2012', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440411752');
INSERT INTO `warnlog` VALUES ('2013', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440411773');
INSERT INTO `warnlog` VALUES ('2014', '呼叫号码错误,主叫 18565370974, 被叫 12390701296', '18565370974', '33', '1440474150');
INSERT INTO `warnlog` VALUES ('2015', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440474840');
INSERT INTO `warnlog` VALUES ('2016', '用户分钟数不足,主叫 18565370974, 被叫 13790701296, 分钟数 -1', '18565370974', '33', '1440474900');
INSERT INTO `warnlog` VALUES ('2017', '用户分钟数不足,主叫 18565370974, 被叫 15360704607, 分钟数 -1', '18565370974', '33', '1440475051');
INSERT INTO `warnlog` VALUES ('2018', '代理商未激活,主叫 18565370974, 被叫 15360704608', '18565370974', '33', '1440511897');
INSERT INTO `warnlog` VALUES ('2019', '代理商未激活,主叫 18565370974, 被叫 15360704608', '18565370974', '33', '1440511953');
INSERT INTO `warnlog` VALUES ('2020', '代理商未激活,主叫 18565370974, 被叫 13790701296', '18565370974', '33', '1440511955');
INSERT INTO `warnlog` VALUES ('2021', '代理商未激活,主叫 18565370974, 被叫 15360704608', '18565370974', '33', '1440511958');
INSERT INTO `warnlog` VALUES ('2022', '代理商未激活,主叫 18588691207, 被叫 13790785202', '18588691207', '33', '1440552125');
INSERT INTO `warnlog` VALUES ('2023', '代理商未激活,主叫 18588691207, 被叫 13790852369', '18588691207', '33', '1440553268');
INSERT INTO `warnlog` VALUES ('2024', '代理商未激活,主叫 18588691207, 被叫 13798523690', '18588691207', '33', '1440553285');
INSERT INTO `warnlog` VALUES ('2025', '用户分钟数不足,主叫 18588691207, 被叫 13790708520, 分钟数 -1', '18588691207', '33', '1440662293');
INSERT INTO `warnlog` VALUES ('2026', '用户分钟数不足,主叫 18588691207, 被叫 13790708520, 分钟数 -1', '18588691207', '33', '1440665018');
INSERT INTO `warnlog` VALUES ('2027', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183249');
INSERT INTO `warnlog` VALUES ('2028', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183253');
INSERT INTO `warnlog` VALUES ('2029', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183256');
INSERT INTO `warnlog` VALUES ('2030', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183259');
INSERT INTO `warnlog` VALUES ('2031', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183261');
INSERT INTO `warnlog` VALUES ('2032', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183263');
INSERT INTO `warnlog` VALUES ('2033', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183265');
INSERT INTO `warnlog` VALUES ('2034', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183267');
INSERT INTO `warnlog` VALUES ('2035', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183269');
INSERT INTO `warnlog` VALUES ('2036', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183271');
INSERT INTO `warnlog` VALUES ('2037', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183273');
INSERT INTO `warnlog` VALUES ('2038', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441183279');
INSERT INTO `warnlog` VALUES ('2039', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763642');
INSERT INTO `warnlog` VALUES ('2040', '用户分钟数不足,主叫 18565370974, 被叫 15992294392, 分钟数 -1', '18565370974', '83', '1441763696');
INSERT INTO `warnlog` VALUES ('2041', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763730');
INSERT INTO `warnlog` VALUES ('2042', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763732');
INSERT INTO `warnlog` VALUES ('2043', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763734');
INSERT INTO `warnlog` VALUES ('2044', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763737');
INSERT INTO `warnlog` VALUES ('2045', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763739');
INSERT INTO `warnlog` VALUES ('2046', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763744');
INSERT INTO `warnlog` VALUES ('2047', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763767');
INSERT INTO `warnlog` VALUES ('2048', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763794');
INSERT INTO `warnlog` VALUES ('2049', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441763831');
INSERT INTO `warnlog` VALUES ('2050', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441765883');
INSERT INTO `warnlog` VALUES ('2051', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441766217');
INSERT INTO `warnlog` VALUES ('2052', '用户分钟数不足,主叫 18565370974, 被叫 15992294393, 分钟数 -1', '18565370974', '83', '1441767579');
INSERT INTO `warnlog` VALUES ('2053', '用户分钟数不足,主叫 18565370974, 被叫 13143511153, 分钟数 -1', '18565370974', '83', '1441872960');

-- ----------------------------
-- Table structure for website
-- ----------------------------
DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `order` smallint(6) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of website
-- ----------------------------
INSERT INTO `website` VALUES ('3', '82', '2', 'http://localhost/vosweb/index.php/home/index/index.html');

-- ----------------------------
-- Table structure for wx_call_mark
-- ----------------------------
DROP TABLE IF EXISTS `wx_call_mark`;
CREATE TABLE `wx_call_mark` (
  `cm_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_phone` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户的手机号',
  `call_phone` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '通话记录号码',
  `call_time` int(30) unsigned NOT NULL DEFAULT '0' COMMENT '接通时间',
  `cm_acctname` int(30) unsigned NOT NULL DEFAULT '0' COMMENT '代理商名',
  `phone_address` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`cm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_call_mark
-- ----------------------------
INSERT INTO `wx_call_mark` VALUES ('122', '18565370974', '13790852369', '1440488745', '33', '');
INSERT INTO `wx_call_mark` VALUES ('121', '18565370974', '13790853912', '1440488713', '33', '');
INSERT INTO `wx_call_mark` VALUES ('120', '18565370974', '13790701258', '1440488650', '33', '');
INSERT INTO `wx_call_mark` VALUES ('119', '18565370974', '13790701296', '1440488466', '33', '');
INSERT INTO `wx_call_mark` VALUES ('118', '18565370974', '13707012962', '1440484336', '33', '');
INSERT INTO `wx_call_mark` VALUES ('111', '18565370974', '13711778726', '1440482551', '33', '');
INSERT INTO `wx_call_mark` VALUES ('112', '18565370974', '13711778726', '1440482643', '33', '');
INSERT INTO `wx_call_mark` VALUES ('113', '18565370974', '13711778726', '1440482726', '33', '');
INSERT INTO `wx_call_mark` VALUES ('114', '18565370974', '13711778726', '1440482738', '33', '');
INSERT INTO `wx_call_mark` VALUES ('115', '18565370974', '13711778726', '1440482821', '33', '');
INSERT INTO `wx_call_mark` VALUES ('116', '18565370974', '13711778726', '1440482881', '33', '');
INSERT INTO `wx_call_mark` VALUES ('117', '18565370974', '13790701265', '1440483496', '33', '');
INSERT INTO `wx_call_mark` VALUES ('123', '18565370974', '13790062285', '1440488943', '33', '');
INSERT INTO `wx_call_mark` VALUES ('124', '18565370974', '13789562563', '1440489006', '33', '');
INSERT INTO `wx_call_mark` VALUES ('125', '18565370974', '13790708523', '1440489316', '33', '');
INSERT INTO `wx_call_mark` VALUES ('126', '18565370974', '13785698569', '1440489378', '33', '');
INSERT INTO `wx_call_mark` VALUES ('127', '18565370974', '13797082582', '1440489746', '33', '');
INSERT INTO `wx_call_mark` VALUES ('128', '18565370974', '13790708523', '1440489787', '33', '');
INSERT INTO `wx_call_mark` VALUES ('129', '18565370974', '13790708523', '1440489788', '33', '');
INSERT INTO `wx_call_mark` VALUES ('148', '18588691207', '13790701258', '1440494995', '33', '');
INSERT INTO `wx_call_mark` VALUES ('196', '18588691207', '13790701296', '1440510289', '33', '');
INSERT INTO `wx_call_mark` VALUES ('197', '18588691207', '13790701296', '1440510307', '33', '');
INSERT INTO `wx_call_mark` VALUES ('134', '18588691207', '13790701296', '1440490657', '33', '');
INSERT INTO `wx_call_mark` VALUES ('135', '18588691207', '13788268622', '1440490765', '33', '');
INSERT INTO `wx_call_mark` VALUES ('136', '18588691207', '13798523690', '1440490791', '33', '');
INSERT INTO `wx_call_mark` VALUES ('182', '18588691207', '13790701296', '1440507655', '33', '');
INSERT INTO `wx_call_mark` VALUES ('138', '18588691207', '13790701296', '1440491411', '33', '');
INSERT INTO `wx_call_mark` VALUES ('139', '18588691207', '13790708523', '1440491483', '33', '');
INSERT INTO `wx_call_mark` VALUES ('150', '18588691207', '13790852369', '1440497074', '33', '');
INSERT INTO `wx_call_mark` VALUES ('191', '18588691207', '13788268600', '1440509256', '33', '');
INSERT INTO `wx_call_mark` VALUES ('152', '18588691207', '13790701240', '1440497457', '33', '');
INSERT INTO `wx_call_mark` VALUES ('195', '18588691207', '13790701296', '1440509933', '33', '');
INSERT INTO `wx_call_mark` VALUES ('144', '18588691207', '13790701256', '1440492070', '33', '');
INSERT INTO `wx_call_mark` VALUES ('194', '18588691207', '13790708523', '1440509913', '33', '');
INSERT INTO `wx_call_mark` VALUES ('192', '18588691207', '13790708523', '1440509306', '33', '');
INSERT INTO `wx_call_mark` VALUES ('153', '18588691207', '13788268600', '1440498325', '33', '');
INSERT INTO `wx_call_mark` VALUES ('154', '18588691207', '13791256660', '1440498388', '33', '');
INSERT INTO `wx_call_mark` VALUES ('155', '18588691207', '13790708523', '1440498619', '33', '');
INSERT INTO `wx_call_mark` VALUES ('156', '18588691207', '13790701222', '1440498690', '33', '');
INSERT INTO `wx_call_mark` VALUES ('157', '18588691207', '13791256660', '1440498799', '33', '');
INSERT INTO `wx_call_mark` VALUES ('158', '18588691207', '13790708523', '1440498839', '33', '');
INSERT INTO `wx_call_mark` VALUES ('159', '18588691207', '13790708520', '1440498912', '33', '');
INSERT INTO `wx_call_mark` VALUES ('185', '18588691207', '13790701296', '1440508681', '33', '');
INSERT INTO `wx_call_mark` VALUES ('161', '18588691207', '13790708523', '1440498918', '33', '');
INSERT INTO `wx_call_mark` VALUES ('184', '18588691207', '13790701258', '1440508617', '33', '');
INSERT INTO `wx_call_mark` VALUES ('163', '18588691207', '13788268600', '1440499185', '33', '');
INSERT INTO `wx_call_mark` VALUES ('183', '18588691207', '13790701296', '1440507657', '33', '');
INSERT INTO `wx_call_mark` VALUES ('165', '18588691207', '13790701258', '1440499221', '33', '');
INSERT INTO `wx_call_mark` VALUES ('166', '18588691207', '13788268600', '1440499280', '33', '');
INSERT INTO `wx_call_mark` VALUES ('167', '18588691207', '13790701296', '1440500126', '33', '');
INSERT INTO `wx_call_mark` VALUES ('168', '18588691207', '13790852369', '1440500278', '33', '');
INSERT INTO `wx_call_mark` VALUES ('193', '18588691207', '13790708523', '1440509491', '33', '');
INSERT INTO `wx_call_mark` VALUES ('190', '18588691207', '13790701222', '1440509194', '33', '');
INSERT INTO `wx_call_mark` VALUES ('189', '18588691207', '13790701240', '1440509174', '33', '');
INSERT INTO `wx_call_mark` VALUES ('188', '18588691207', '13790701240', '1440509153', '33', '');
INSERT INTO `wx_call_mark` VALUES ('187', '18588691207', '13790708523', '1440508725', '33', '');
INSERT INTO `wx_call_mark` VALUES ('186', '18588691207', '13790701222', '1440508723', '33', '');
INSERT INTO `wx_call_mark` VALUES ('175', '18565370974', '13711778726', '1440503175', '33', '');
INSERT INTO `wx_call_mark` VALUES ('176', '18565370974', '13711778726', '1440503349', '33', '');
INSERT INTO `wx_call_mark` VALUES ('177', '18565370974', '13711778726', '1440503357', '33', '');
INSERT INTO `wx_call_mark` VALUES ('178', '18588691207', '13790708523', '1440504116', '33', '');
INSERT INTO `wx_call_mark` VALUES ('179', '18565370974', '13711778726', '1440507045', '33', '');
INSERT INTO `wx_call_mark` VALUES ('180', '18588691207', '13790701296', '1440507578', '33', '');
INSERT INTO `wx_call_mark` VALUES ('181', '18588691207', '13790701296', '1440507580', '33', '');
INSERT INTO `wx_call_mark` VALUES ('198', '18588691207', '13790701240', '1440510349', '33', '');
INSERT INTO `wx_call_mark` VALUES ('199', '18588691207', '13790701258', '1440510446', '33', '');
INSERT INTO `wx_call_mark` VALUES ('200', '18588691207', '18565370974', '1440510830', '33', '');
INSERT INTO `wx_call_mark` VALUES ('201', '18588691207', '18565370974', '1440511115', '33', '');
INSERT INTO `wx_call_mark` VALUES ('202', '18565370974', '13711778726', '1440511342', '33', '');
INSERT INTO `wx_call_mark` VALUES ('203', '18565370974', '13790256562', '1440511356', '33', '');
INSERT INTO `wx_call_mark` VALUES ('204', '18565370974', '15360704608', '1440511377', '33', '');
INSERT INTO `wx_call_mark` VALUES ('205', '18565370974', '15360704608', '1440511393', '33', '');
INSERT INTO `wx_call_mark` VALUES ('206', '18565370974', '15360704608', '1440511395', '33', '');
INSERT INTO `wx_call_mark` VALUES ('207', '18588691207', '13791256660', '1440511399', '33', '');
INSERT INTO `wx_call_mark` VALUES ('208', '18565370974', '15360704608', '1440511458', '33', '');
INSERT INTO `wx_call_mark` VALUES ('209', '18565370974', '15360704608', '1440511481', '33', '');
INSERT INTO `wx_call_mark` VALUES ('210', '18565370974', '15360704608', '1440511527', '33', '');
INSERT INTO `wx_call_mark` VALUES ('211', '18565370974', '15360704608', '1440511539', '33', '');
INSERT INTO `wx_call_mark` VALUES ('212', '18565370974', '13790701296', '1440511667', '33', '');
INSERT INTO `wx_call_mark` VALUES ('213', '18565370974', '15360704608', '1440511796', '33', '');
INSERT INTO `wx_call_mark` VALUES ('214', '18565370974', '15360704608', '1440511823', '33', '');
INSERT INTO `wx_call_mark` VALUES ('215', '18588691207', '13790852369', '1440553655', '33', '');
INSERT INTO `wx_call_mark` VALUES ('216', '18588691207', '13790701258', '1440554250', '33', '');
INSERT INTO `wx_call_mark` VALUES ('217', '18588691207', '18565370974', '1440557838', '33', '');
INSERT INTO `wx_call_mark` VALUES ('218', '18588691207', '13790712804', '1440563444', '33', '');
INSERT INTO `wx_call_mark` VALUES ('219', '18588691207', '13790712804', '1440568511', '33', '');
INSERT INTO `wx_call_mark` VALUES ('220', '18588691207', '13790712804', '1440568533', '33', '');
INSERT INTO `wx_call_mark` VALUES ('221', '18565370974', '15360704607', '1440568858', '33', '');
INSERT INTO `wx_call_mark` VALUES ('222', '18588691207', '18565370974', '1440569439', '33', '');
INSERT INTO `wx_call_mark` VALUES ('223', '18588691207', '18565370974', '1440569442', '33', '');
INSERT INTO `wx_call_mark` VALUES ('224', '18565370974', '15360704607', '1440570211', '33', '');
INSERT INTO `wx_call_mark` VALUES ('225', '18588691207', '13790708520', '1440576306', '33', '');
INSERT INTO `wx_call_mark` VALUES ('226', '18565370974', '15992294393', '1441767650', '83', '');
INSERT INTO `wx_call_mark` VALUES ('227', '18565370974', '15992294393', '1441767720', '83', '');
INSERT INTO `wx_call_mark` VALUES ('228', '18565370974', '15992294393', '1441767794', '83', '');
INSERT INTO `wx_call_mark` VALUES ('229', '18565370974', '15992294393', '1441768039', '83', '');
INSERT INTO `wx_call_mark` VALUES ('230', '18565370974', '13414080935', '1441873012', '83', '');

-- ----------------------------
-- Table structure for wx_event
-- ----------------------------
DROP TABLE IF EXISTS `wx_event`;
CREATE TABLE `wx_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(5) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `menuid` (`menuid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_event
-- ----------------------------
INSERT INTO `wx_event` VALUES ('1', '11', 'news', '1313');

-- ----------------------------
-- Table structure for wx_event_news
-- ----------------------------
DROP TABLE IF EXISTS `wx_event_news`;
CREATE TABLE `wx_event_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eventid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `picurl` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `event_id` (`eventid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_event_news
-- ----------------------------
INSERT INTO `wx_event_news` VALUES ('2', '1', '12', '12', '20150821/thumb_55d68b17bfdb3.jpg', 'http://www.baidu.com', '0');

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `wx_menu`;
CREATE TABLE `wx_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL DEFAULT '',
  `type` varchar(15) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_menu
-- ----------------------------
INSERT INTO `wx_menu` VALUES ('15', '1', '淘宝商城', 'view', 'http://www.taobao.com/', '12', '1');
INSERT INTO `wx_menu` VALUES ('16', '1', '免费电话', 'none', '', '0', '1');
INSERT INTO `wx_menu` VALUES ('24', '1', 'APP下载', 'view', 'http://www.poo168.cn/paiwo/', '18', '3');
INSERT INTO `wx_menu` VALUES ('10', '1', '每日签到', 'view', 'http://www.c1788.cn/Home/wxcommon/oauth/acctname/雅芳/type/1', '12', '12');
INSERT INTO `wx_menu` VALUES ('22', '1', 'poo商城', 'view', 'http://wap.koudaitong.com/v2/feature/sfxqbcv', '0', '2');
INSERT INTO `wx_menu` VALUES ('18', '1', '关于poo', 'none', '', '0', '3');
INSERT INTO `wx_menu` VALUES ('19', '1', '免费电话', 'view', 'http://www.c1788.cn/Home/wxcommon/oauth/acctname/派我/', '16', '1');
INSERT INTO `wx_menu` VALUES ('20', '1', '每日签到', 'view', 'http://www.c1788.cn/Home/wxcommon/oauth/acctname/派我/type/1', '16', '2');
INSERT INTO `wx_menu` VALUES ('21', '1', '分享挣话费', 'view', 'http://www.c1788.cn/Home/wxcommon/oauth/acctname/派我/type/2', '16', '3');
INSERT INTO `wx_menu` VALUES ('23', '1', 'APP安装流程', 'view', 'http://wap.koudaitong.com/v2/feature/h6dh5hg1', '18', '2');

-- ----------------------------
-- Table structure for wx_news
-- ----------------------------
DROP TABLE IF EXISTS `wx_news`;
CREATE TABLE `wx_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `share_fee` smallint(5) unsigned NOT NULL DEFAULT '0',
  `share_content` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_news
-- ----------------------------
INSERT INTO `wx_news` VALUES ('11', '1', '1212', '123', '1440675837', '12', '12');
INSERT INTO `wx_news` VALUES ('10', '1', '12', '12', '1440675803', '12', '');

-- ----------------------------
-- Table structure for wx_phone_contact
-- ----------------------------
DROP TABLE IF EXISTS `wx_phone_contact`;
CREATE TABLE `wx_phone_contact` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_phone` bigint(30) unsigned NOT NULL DEFAULT '0' COMMENT '用户手机',
  `pc_phone` bigint(30) unsigned NOT NULL DEFAULT '0' COMMENT '联系人手机',
  `pc_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `pc_acctname` int(30) unsigned NOT NULL DEFAULT '0' COMMENT '代理商名',
  PRIMARY KEY (`pc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_phone_contact
-- ----------------------------
INSERT INTO `wx_phone_contact` VALUES ('31', '18565370974', '15360704608', 'xiaolan21', '33');
INSERT INTO `wx_phone_contact` VALUES ('32', '18565370974', '13790256562', 'ih', '33');
INSERT INTO `wx_phone_contact` VALUES ('33', '18588691207', '13790852369', '一个我', '33');
INSERT INTO `wx_phone_contact` VALUES ('43', '18588691207', '13798523690', 'd j ji', '33');
INSERT INTO `wx_phone_contact` VALUES ('42', '18588691207', '13790852355', 'g', '33');
INSERT INTO `wx_phone_contact` VALUES ('36', '18588691207', '13790708520', '120', '33');
INSERT INTO `wx_phone_contact` VALUES ('38', '18588691207', '13791256660', 'ddd', '33');
INSERT INTO `wx_phone_contact` VALUES ('39', '18588691207', '13790701258', '你说', '33');
INSERT INTO `wx_phone_contact` VALUES ('41', '18588691207', '13790852365', 'skjn', '33');
INSERT INTO `wx_phone_contact` VALUES ('44', '18588691207', '18565370974', '海滩', '33');
INSERT INTO `wx_phone_contact` VALUES ('45', '18588691207', '18565370975', 'c', '33');
INSERT INTO `wx_phone_contact` VALUES ('46', '18588691207', '13760854123', 'hkk', '33');
INSERT INTO `wx_phone_contact` VALUES ('47', '18588691207', '13589625632', '符合', '33');
INSERT INTO `wx_phone_contact` VALUES ('48', '18565370974', '15992294393', '阿萨德', '83');

-- ----------------------------
-- Table structure for wx_reply
-- ----------------------------
DROP TABLE IF EXISTS `wx_reply`;
CREATE TABLE `wx_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(60) NOT NULL DEFAULT '',
  `type` char(5) NOT NULL DEFAULT '0',
  `content` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `picurl` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_reply
-- ----------------------------
INSERT INTO `wx_reply` VALUES ('4', '83', '12', 'news', '12', '12', '12', '20150831/thumb_55e3c870eb57f.png', '12');

-- ----------------------------
-- Table structure for wx_share
-- ----------------------------
DROP TABLE IF EXISTS `wx_share`;
CREATE TABLE `wx_share` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL DEFAULT '',
  `news_id` text NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `share_fee` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_share
-- ----------------------------
