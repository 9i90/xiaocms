/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : campaign

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-01-28 18:28:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `campaign_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_attribute`;
CREATE TABLE `campaign_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL COMMENT '节点ID',
  `code` varchar(50) NOT NULL COMMENT '属性编码',
  `name` varchar(50) NOT NULL COMMENT '属性名称',
  `type` varchar(10) NOT NULL COMMENT '属性类型',
  PRIMARY KEY (`id`),
  KEY `node_fk` (`node_id`),
  CONSTRAINT `node_fk` FOREIGN KEY (`node_id`) REFERENCES `campaign_node` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='活动节点属性表';

-- ----------------------------
-- Records of campaign_attribute
-- ----------------------------
INSERT INTO `campaign_attribute` VALUES ('1', '2', 'phone', '电话号', 'string');
INSERT INTO `campaign_attribute` VALUES ('2', '2', 'userId', '用户ID', 'int');
INSERT INTO `campaign_attribute` VALUES ('3', '1', 'userId', '用户ID', 'int');
INSERT INTO `campaign_attribute` VALUES ('4', '2', 'cashtime', '提现时间', 'date');
INSERT INTO `campaign_attribute` VALUES ('5', '2', 'source', '提现来源', 'inParam');
INSERT INTO `campaign_attribute` VALUES ('6', '1', 'source', '数据来源', 'inParam');
INSERT INTO `campaign_attribute` VALUES ('7', '5', 'userId', '用户ID', 'inParam');
INSERT INTO `campaign_attribute` VALUES ('8', '5', 'isFirstTenderCFDBZ', '是否首次投资财富大爆炸', 'inParam');

-- ----------------------------
-- Table structure for `campaign_info`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_info`;
CREATE TABLE `campaign_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `type` varchar(10) NOT NULL COMMENT '活动类型',
  `add_time` datetime NOT NULL COMMENT '活动录入时间',
  `start_time` datetime NOT NULL COMMENT '活动有效期起',
  `end_time` datetime NOT NULL COMMENT '活动有效期止',
  `remark` varchar(200) DEFAULT NULL COMMENT '活动备注',
  `status` varchar(2) NOT NULL COMMENT '活动状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of campaign_info
-- ----------------------------

-- ----------------------------
-- Table structure for `campaign_node`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_node`;
CREATE TABLE `campaign_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node` varchar(50) NOT NULL COMMENT '节点',
  `name` varchar(50) NOT NULL COMMENT '节点名称',
  `avi_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '有效标志（1：有效，0：无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='活动配置节点';

-- ----------------------------
-- Records of campaign_node
-- ----------------------------
INSERT INTO `campaign_node` VALUES ('1', 'userSignIn', '用户签到', '1');
INSERT INTO `campaign_node` VALUES ('2', 'saveFormWithdraw', '用户提现', '1');
INSERT INTO `campaign_node` VALUES ('5', 'tender', '投资', '1');

-- ----------------------------
-- Table structure for `campaign_node_attr_info`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_node_attr_info`;
CREATE TABLE `campaign_node_attr_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_info_id` int(11) NOT NULL COMMENT '活动ID',
  `attr_id` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `info_type` varchar(255) NOT NULL COMMENT '属性类型（1:in;2:out）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of campaign_node_attr_info
-- ----------------------------
INSERT INTO `campaign_node_attr_info` VALUES ('1', '1', '1', '18612972371', '2');
INSERT INTO `campaign_node_attr_info` VALUES ('2', '1', '2', '5', '1');

-- ----------------------------
-- Table structure for `campaign_node_info`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_node_info`;
CREATE TABLE `campaign_node_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `node_id` int(11) NOT NULL COMMENT '节点ID',
  `add_time` datetime NOT NULL COMMENT '活动录入时间',
  `start_time` datetime NOT NULL COMMENT '活动有效期起',
  `end_time` datetime NOT NULL COMMENT '活动有效期止',
  `expression` varchar(500) NOT NULL COMMENT '表达式',
  `result` varchar(100) NOT NULL COMMENT '期望结果',
  `remark` varchar(200) DEFAULT NULL COMMENT '活动备注',
  `status` varchar(2) NOT NULL COMMENT '活动状态',
  `exec_content` varchar(100) DEFAULT NULL COMMENT '活动执行内容（多个逗号分隔）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of campaign_node_info
-- ----------------------------
INSERT INTO `campaign_node_info` VALUES ('1', '提现站内信通知', '2', '2016-01-20 09:09:48', '2016-01-20 09:09:50', '2016-01-21 09:09:55', 'userId-2==3&&$DAYEQUALS($SYSDATE(),[2016-01-22])', 'true', '测试数据', '1', 'sendMsg');
INSERT INTO `campaign_node_info` VALUES ('2', 'yshj10', '1', '2016-01-28 11:58:51', '2016-01-28 11:58:53', '2016-01-28 11:58:54', '121', '2132', '323', '1', 'sendEmail');

-- ----------------------------
-- Table structure for `campaign_scheduling`
-- ----------------------------
DROP TABLE IF EXISTS `campaign_scheduling`;
CREATE TABLE `campaign_scheduling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '调度名称',
  `cron_expression` varchar(50) NOT NULL COMMENT '调度配置表达式',
  `add_time` datetime NOT NULL,
  `status` varchar(2) NOT NULL COMMENT '状态',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='调度配置表';

-- ----------------------------
-- Records of campaign_scheduling
-- ----------------------------
INSERT INTO `campaign_scheduling` VALUES ('1', '还款', '0 0 8-12 * * ?', '2016-01-26 11:57:15', '1', '每天8-12点每隔一个小时执行一次');

-- ----------------------------
-- Table structure for `t_s_base_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_base_user`;
CREATE TABLE `t_s_base_user` (
  `ID` varchar(32) NOT NULL,
  `activitiSync` smallint(6) DEFAULT NULL,
  `browser` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `signature` blob,
  `status` smallint(6) DEFAULT NULL,
  `userkey` varchar(200) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  `departid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_15jh1g4iem1857546ggor42et` (`departid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_base_user
-- ----------------------------
INSERT INTO `t_s_base_user` VALUES ('8a8a82db525cce4701525ccf91100001', null, null, '20d2e9bb99e8168ffd821f2c6af69c3f', 'zhang123', null, '1', '管理员', 'zhang123', null);
INSERT INTO `t_s_base_user` VALUES ('8a8a83e9510e73d801510ed292790036', null, null, '8bd0ca2135ef4ece', '金牛座', null, '1', '普通用户', 'jnzuo', null);
INSERT INTO `t_s_base_user` VALUES ('8a8ab0b246dc81120146dc8181950052', null, null, '8020fb3a83d38584', '管理员', null, '1', '管理员', 'admin', '8a8ab0b246dc81120146dc8180a20016');

-- ----------------------------
-- Table structure for `t_s_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_config`;
CREATE TABLE `t_s_config` (
  `ID` varchar(32) NOT NULL,
  `code` varchar(100) DEFAULT NULL,
  `content` longtext,
  `name` varchar(100) NOT NULL,
  `note` longtext,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_m3q8r50ror4fl7fjkvd82tqgn` (`userid`),
  CONSTRAINT `t_s_config_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_config
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_data_rule`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_data_rule`;
CREATE TABLE `t_s_data_rule` (
  `id` varchar(96) DEFAULT NULL,
  `rule_name` varchar(96) DEFAULT NULL,
  `rule_column` varchar(300) DEFAULT NULL,
  `rule_conditions` varchar(300) DEFAULT NULL,
  `rule_value` varchar(300) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(96) DEFAULT NULL,
  `create_name` varchar(96) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(96) DEFAULT NULL,
  `update_name` varchar(96) DEFAULT NULL,
  `functionId` varchar(96) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_data_rule
-- ----------------------------
INSERT INTO `t_s_data_rule` VALUES ('f852d85d47f224990147f2284c0c0005', '小于', 'test', '<=', '11', '2014-08-20 14:43:52', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null, null);
INSERT INTO `t_s_data_rule` VALUES ('f852d85d47f224990147f2284c0c0005', '小于', 'test', '<=', '11', '2014-08-20 14:43:52', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null, null);
INSERT INTO `t_s_data_rule` VALUES ('402889fe47fcb29c0147fcb6b6220001', '12', '12', '>', '12', '2014-08-22 15:55:38', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null, '8a8ab0b246dc81120146dc8180fe002b');
INSERT INTO `t_s_data_rule` VALUES ('402889fb486e848101486e913cd6000b', 'userName', 'userName', '=', 'admin', '2014-09-13 18:31:25', 'admin', '管理员', null, null, null, '402889fb486e848101486e8e2e8b0007');
INSERT INTO `t_s_data_rule` VALUES ('402889fb486e848101486e98d20d0016', 'title', 'title', '=', '12', null, null, null, '2014-09-13 22:18:22', 'scott', '张代浩', '402889fb486e848101486e93a7c80014');
INSERT INTO `t_s_data_rule` VALUES ('402880e6487e661a01487e732c020005', 'SYS_ORG_CODE', 'SYS_ORG_CODE', 'LIKE', '010201%', '2014-09-16 20:32:30', 'admin', '管理员', null, null, null, '402889fb486e848101486e93a7c80014');
INSERT INTO `t_s_data_rule` VALUES ('402880e6487e661a01487e8153ee0007', 'create_by', 'create_by', '', '#{SYS_USER_CODE}', '2014-09-16 20:47:57', 'admin', '管理员', null, null, null, '402889fb486e848101486e93a7c80014');

-- ----------------------------
-- Table structure for `t_s_data_source`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_data_source`;
CREATE TABLE `t_s_data_source` (
  `id` varchar(36) NOT NULL,
  `db_key` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `driver_class` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `db_user` varchar(50) NOT NULL,
  `db_password` varchar(50) DEFAULT NULL,
  `db_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_data_source
-- ----------------------------
INSERT INTO `t_s_data_source` VALUES ('8a8aada9486347c001486401180a0003', 'SAP_DB', 'sap db', 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@127.0.0.1:1521:oral', 'db_user', 'db_password', 'oracle');

-- ----------------------------
-- Table structure for `t_s_depart`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_depart`;
CREATE TABLE `t_s_depart` (
  `ID` varchar(32) NOT NULL,
  `departname` varchar(100) NOT NULL,
  `description` longtext,
  `parentdepartid` varchar(32) DEFAULT NULL,
  `org_code` varchar(64) DEFAULT NULL,
  `org_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_knnm3wb0bembwvm0il7tf6686` (`parentdepartid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_depart
-- ----------------------------
INSERT INTO `t_s_depart` VALUES ('402880e447e99cf10147e9a03b320003', '金牛座', '', null, '01', '1');
INSERT INTO `t_s_depart` VALUES ('402880e447e9a9570147e9b677320003', '技术部', '', '402880e447e99cf10147e9a03b320003', '0101', '2');
INSERT INTO `t_s_depart` VALUES ('402880e447e9a9570147e9b6a3be0005', '运营部', '', '402880e447e99cf10147e9a03b320003', '0102', '2');
INSERT INTO `t_s_depart` VALUES ('402880e447e9a9570147e9b710d20007', '人力资源部', '', '402880e447e99cf10147e9a03b320003', '0103', '2');
INSERT INTO `t_s_depart` VALUES ('8a8a83e9510e73d801510ec6e93b0019', '财务部', '', '402880e447e99cf10147e9a03b320003', '0104', '2');

-- ----------------------------
-- Table structure for `t_s_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_function`;
CREATE TABLE `t_s_function` (
  `ID` varchar(32) NOT NULL,
  `functioniframe` smallint(6) DEFAULT NULL,
  `functionlevel` smallint(6) DEFAULT NULL,
  `functionname` varchar(50) NOT NULL,
  `functionorder` varchar(255) DEFAULT NULL,
  `functionurl` varchar(100) DEFAULT NULL,
  `parentfunctionid` varchar(32) DEFAULT NULL,
  `iconid` varchar(32) DEFAULT NULL,
  `desk_iconid` varchar(32) DEFAULT NULL,
  `functiontype` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_brd7b3keorj8pmxcv8bpahnxp` (`parentfunctionid`),
  KEY `FK_q5tqo3v4ltsp1pehdxd59rccx` (`iconid`),
  KEY `FK_gbdacaoju6d5u53rp4jo4rbs9` (`desk_iconid`),
  CONSTRAINT `t_s_function_ibfk_1` FOREIGN KEY (`parentfunctionid`) REFERENCES `t_s_function` (`ID`),
  CONSTRAINT `t_s_function_ibfk_2` FOREIGN KEY (`desk_iconid`) REFERENCES `t_s_icon` (`ID`),
  CONSTRAINT `t_s_function_ibfk_3` FOREIGN KEY (`iconid`) REFERENCES `t_s_icon` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_function
-- ----------------------------
INSERT INTO `t_s_function` VALUES ('402881c746de1ea60146de207d770001', null, '1', 'language.manage', '5', 'mutiLangController.do?mutiLang', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82db525edf4c01525eee68b4000b', null, '0', '客户管理', '6', '', null, '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82db525eefbb01525ef6107e0008', null, '1', '个人用户信息', '1', 'userInfoController.do?userPInfo', '8a8a82db525edf4c01525eee68b4000b', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82db5268a6e2015268bb50970002', null, '1', '企业用户信息', '2', 'userInfoController.do?userCInfo', '8a8a82db525edf4c01525eee68b4000b', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82db5268c087015268d1be270006', null, '1', '用户基本信息', '1', 'userInfoController.do?userInfo', '8a8a82db525edf4c01525eee68b4000b', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82e0527c0cc601527c0f93050004', null, '1', '节点活动管理', '3', 'campaignNodeInfoController.do?campaignNodeInfo', '8a8a82f95244ca5b015244ce1dd10001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82e0527c0cc601527c104ab40006', null, '1', '节点活动属性', '4', 'campaignNodeAttrController.do?campaignNodeAttr', '8a8a82f95244ca5b015244ce1dd10001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82e0527c0cc601527c1102f20008', null, '1', '调度器管理', '5', 'campaignSchedulingController.do?campaignScheduling', '8a8a82f95244ca5b015244ce1dd10001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82e05287713b015287728e340001', null, '1', '表达式编辑', '6', 'campaignNodeAttrController.do?textaraEdit', '8a8a82f95244ca5b015244ce1dd10001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82f95244ca5b015244ce1dd10001', null, '0', '活动管理', '1', '', null, '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a82f95244db41015244de200d0003', null, '1', '节点管理', '1', 'nodeController.do?node', '8a8a82f95244ca5b015244ce1dd10001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c525edc5901525ededcf40001', null, '0', '参数维护', '5', '', null, '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c525edc5901525f133a890007', null, '1', '系统编码', '1', 'codeController.do?code', '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c5263a889015263b2cfeb0001', null, '1', '系统参数配置管理', '2', 'systemParameterController.do?systemParameter', '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c5263a889015263b3a8440003', null, '1', '推广渠道信息', '3', 'channelController.do?channel', '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c5263a889015263b426ed0005', null, '1', '省市区维护', '4', 'cityInfoController.do?cityInfo', '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c5263a889015263b4e0410007', null, '1', '模板列表', '5', 'templateController.do?template', '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8a892c5263a889015263b56d3b0009', null, '1', '借款费用计算规则', '6', 'borrowConfigController.do?borrowConfig', '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180d2001a', null, '0', 'system.manage', '5', '', null, '8a8ab0b246dc81120146dc8180860006', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180d9001d', null, '0', 'system.monitor', '2', '', null, '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180df001f', null, '1', 'user.manage', '1', 'userController.do?user', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180e30021', null, '1', 'role.manage', '2', 'roleController.do?role', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180e10020', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180e70023', null, '1', 'menu.manage', '3', 'functionController.do?function', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180e50022', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180ee0025', null, '1', 'common.data.dictionary', '6', 'systemController.do?typeGroupList', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180eb0024', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180f30027', null, '1', 'icon.manage', '8', 'iconController.do?icon', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180f00026', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc8180f60028', null, '1', 'department.manage', '4', 'departController.do?depart', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8180dd001e', '0');
INSERT INTO `t_s_function` VALUES ('8a8ab0b246dc81120146dc81811d0032', null, '1', 'system.log', '2', 'logController.do?log', '8a8ab0b246dc81120146dc8180d9001d', '8a8ab0b246dc81120146dc8180460000', '8a8ab0b246dc81120146dc8181150031', '0');

-- ----------------------------
-- Table structure for `t_s_icon`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_icon`;
CREATE TABLE `t_s_icon` (
  `ID` varchar(32) NOT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `iconclas` varchar(200) DEFAULT NULL,
  `content` blob,
  `name` varchar(100) NOT NULL,
  `path` longtext,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_icon
-- ----------------------------
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180460000', 'png', 'default', null, 'common.default.icon', 'plug-in/accordion/images/default.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180800001', 'png', 'back', null, 'common.back', 'plug-in/accordion/images/back.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180810002', 'png', 'pie', null, 'common.smallpie.icon', 'plug-in/accordion/images/pie.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180820003', 'png', 'pictures', null, 'common.picture', 'plug-in/accordion/images/pictures.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180830004', 'png', 'pencil', null, 'common.pencil.icon', 'plug-in/accordion/images/pencil.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180850005', 'png', 'map', null, 'common.smallmap', 'plug-in/accordion/images/map.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180860006', 'png', 'group_add', null, 'common.group', 'plug-in/accordion/images/group_add.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180880007', 'png', 'calculator', null, 'common.calculator', 'plug-in/accordion/images/calculator.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180890008', 'png', 'folder', null, 'common.folder', 'plug-in/accordion/images/folder.png', '1');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180dd001e', 'png', 'deskIcon', null, 'user.manage', 'plug-in/sliding/icon/Finder.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180e10020', 'png', 'deskIcon', null, 'role.manage', 'plug-in/sliding/icon/friendgroup.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180e50022', 'png', 'deskIcon', null, 'menu.manage', 'plug-in/sliding/icon/kaikai.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180eb0024', 'png', 'deskIcon', null, 'dict.manage', 'plug-in/sliding/icon/friendnear.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180f00026', 'png', 'deskIcon', null, 'icon.manage', 'plug-in/sliding/icon/kxjy.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8180fb002a', 'png', 'deskIcon', null, 'user.analysis', 'plug-in/sliding/icon/User.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc818102002c', 'png', 'deskIcon', null, 'form.config', 'plug-in/sliding/icon/Applications Folder.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc81810d002f', 'png', 'deskIcon', null, 'data.monitor', 'plug-in/sliding/icon/Super Disk.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8181150031', 'png', 'deskIcon', null, 'system.log', 'plug-in/sliding/icon/fastsearch.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8181210033', 'png', 'deskIcon', null, 'common.schedule.task', 'plug-in/sliding/icon/Utilities.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8181290035', 'png', 'deskIcon', null, '表单验证', 'plug-in/sliding/icon/qidianzhongwen.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc8181560043', 'png', 'deskIcon', null, '特殊布局', 'plug-in/sliding/icon/xiami.png', '3');
INSERT INTO `t_s_icon` VALUES ('8a8ab0b246dc81120146dc81816e004a', 'png', 'deskIcon', null, '多附件管理', 'plug-in/sliding/icon/vadio.png', '3');

-- ----------------------------
-- Table structure for `t_s_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_log`;
CREATE TABLE `t_s_log` (
  `ID` varchar(32) NOT NULL,
  `broswer` varchar(100) DEFAULT NULL,
  `logcontent` longtext NOT NULL,
  `loglevel` smallint(6) DEFAULT NULL,
  `note` longtext,
  `operatetime` datetime NOT NULL,
  `operatetype` smallint(6) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_oe64k4852uylhyc5a00rfwtay` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_log
-- ----------------------------
INSERT INTO `t_s_log` VALUES ('8a8a82e0527d96ac01527d999f660000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-26 19:02:45', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0527dad3201527dadbbd30000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-26 19:24:43', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0527daf0e01527daf8ede0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-26 19:26:43', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0527daf0e01527dafd7700001', 'Chrome', '错误异常: SQLException,错误描述：Field \'node_id\' doesn\'t have a default value', '6', '10.10.2.96', '2016-01-26 19:27:02', '3', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0527db26c01527db2c79e0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-26 19:30:14', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0527db26c01527db2fc7b0001', 'Chrome', '节点属性配置添加成功', '3', '10.10.2.96', '2016-01-26 19:30:28', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0527db26c01527db38e4c0002', 'Chrome', '节点属性配置更新成功', '5', '10.10.2.96', '2016-01-26 19:31:05', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05282c117015282c15aac0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-27 19:04:15', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052860aef0152860b680b0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 10:24:00', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052860aef0152860bb4a50001', 'Chrome', '菜单删除成功', '4', '10.10.2.96', '2016-01-28 10:24:20', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052860aef0152862204420002', 'Chrome', '用户admin已退出', '2', '10.10.2.96', '2016-01-28 10:48:42', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052860aef01528622396e0003', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 10:48:55', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052862928015286297df70000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 10:56:52', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286292801528638bf910001', 'Chrome', '错误异常: NullPointerException,错误描述：null', '6', '10.10.2.96', '2016-01-28 11:13:32', '3', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052864d620152864dbcc70000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 11:36:27', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152865133b30000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 11:40:14', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286510101528657c53b0001', 'Chrome', '错误异常: SQLException,错误描述：Field \'node_id\' doesn\'t have a default value', '6', '10.10.2.96', '2016-01-28 11:47:25', '3', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286510101528662a17a0002', 'Chrome', '节点活动管理添加成功', '3', '10.10.2.96', '2016-01-28 11:59:16', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152867e3e6a0004', 'Chrome', '类型: 日期被添加成功', '3', '10.10.2.96', '2016-01-28 12:29:26', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152867f37ff0006', 'Chrome', '类型: asd被添加成功', '3', '10.10.2.96', '2016-01-28 12:30:30', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152867f4d410007', 'Chrome', '类型: asd被删除 成功', '4', '10.10.2.96', '2016-01-28 12:30:35', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152867f7d1b0008', 'Chrome', '类型: 日期被更新成功', '5', '10.10.2.96', '2016-01-28 12:30:48', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152867fad940009', 'Chrome', '类型: 日期被更新成功', '5', '10.10.2.96', '2016-01-28 12:31:00', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528651010152867fc353000a', 'Chrome', '类型: 日期被更新成功', '5', '10.10.2.96', '2016-01-28 12:31:06', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052865101015286810801000b', 'Chrome', '节点属性配置添加成功', '3', '10.10.2.96', '2016-01-28 12:32:29', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286cddb220000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 13:56:23', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286dffe590001', 'Chrome', '类型: 节点入参被更新成功', '5', '10.10.2.96', '2016-01-28 14:16:12', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286e06ea10003', 'Chrome', '类型: 节点出参被添加成功', '3', '10.10.2.96', '2016-01-28 14:16:41', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286e1336f0004', 'Chrome', '节点属性配置更新成功', '5', '10.10.2.96', '2016-01-28 14:17:31', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286e1a7d10005', 'Chrome', '节点属性配置添加成功', '3', '10.10.2.96', '2016-01-28 14:18:01', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286e22f160006', 'Chrome', '节点属性配置添加成功', '3', '10.10.2.96', '2016-01-28 14:18:36', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286f0c98e0007', 'Chrome', '活动节点管理添加成功', '3', '10.10.2.96', '2016-01-28 14:34:33', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286f106920008', 'Chrome', '节点属性配置添加成功', '3', '10.10.2.96', '2016-01-28 14:34:48', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286f422fb0009', 'Chrome', '节点属性配置添加成功', '3', '10.10.2.96', '2016-01-28 14:38:12', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286fdcb9e000a', 'Chrome', '类型分组: 活动状态被添加成功', '3', '10.10.2.96', '2016-01-28 14:48:45', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286fe7512000c', 'Chrome', '类型: 0被添加成功', '3', '10.10.2.96', '2016-01-28 14:49:29', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286fe9b31000e', 'Chrome', '类型: 启用被添加成功', '3', '10.10.2.96', '2016-01-28 14:49:38', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286fecd560010', 'Chrome', '类型: 停用被添加成功', '3', '10.10.2.96', '2016-01-28 14:49:51', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd22015286ff46ef0011', 'Chrome', '类型: 草稿被更新成功', '5', '10.10.2.96', '2016-01-28 14:50:22', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05286cd2201528704819e0012', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 14:56:05', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528725a601528725fbda0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 15:32:39', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052873827015287386e4f0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 15:52:48', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746d72d0001', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:32', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746dc580002', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:34', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746deb80003', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:34', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746e0970004', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:35', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746eae70005', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:37', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746ec4f0006', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:38', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528746f6eb0007', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:40', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e0528738270152874714ce0008', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:08:48', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287382701528747474c0009', 'Chrome', '节点活动管理更新成功', '5', '10.10.2.96', '2016-01-28 16:09:01', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052875c4a0152875c95f50000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 16:32:17', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287713b01528771935d0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 16:55:13', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287713b015287728e600002', 'Chrome', '菜单 录入成功', '3', '10.10.2.96', '2016-01-28 16:56:17', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287713b01528772a2b60003', 'Chrome', '用户admin已退出', '2', '10.10.2.96', '2016-01-28 16:56:22', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287713b01528772c89d0004', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 16:56:32', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287713b01528773b72a0006', 'Chrome', '用户admin已退出', '2', '10.10.2.96', '2016-01-28 16:57:33', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e05287713b01528773d9dc0007', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 16:57:42', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052877e540152877ea20e0000', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 17:09:29', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052877e54015287851f190001', 'Chrome', '用户admin已退出', '2', '10.10.2.96', '2016-01-28 17:16:34', '1', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_log` VALUES ('8a8a82e052877e540152878549930002', 'Chrome', '用户: admin[人力资源部]common.login.success', '1', '10.10.2.96', '2016-01-28 17:16:45', '1', '8a8ab0b246dc81120146dc8181950052');

-- ----------------------------
-- Table structure for `t_s_muti_lang`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_muti_lang`;
CREATE TABLE `t_s_muti_lang` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `lang_key` varchar(50) NOT NULL COMMENT '语言主键',
  `lang_context` varchar(500) NOT NULL COMMENT '内容',
  `lang_code` varchar(50) NOT NULL COMMENT '语言',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人编号',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新人编号',
  `update_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_langkey_langcode` (`lang_key`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_muti_lang
-- ----------------------------
INSERT INTO `t_s_muti_lang` VALUES ('01ca201223b14e3e86c13904a9ae5ca2', 'common.password', '密码', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('02916620f68b4845ba09773de6799706', 'please.select.department', 'Please select a department', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('0ab1a1fddf14420fa0dbcbfb5d2e9e85', 'common.strong', 'Strong', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('0bacd0fab1c84f03854435c1adab88c2', 'common.lock.user', '锁定用户', 'zh-cn', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('11d18a9927e34873a813eade025b5c18', 'fill.realname', 'Fill in the real name', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('121a68d32c6a419b800eb92431b20dd4', 'common.department', 'Org', 'en', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('1e5963a78dcd4b1fa5f9d6d845f151be', 'common.department', '组织机构', 'zh-cn', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('2075b6c641bc44b392638fed9a62cce9', 'password.rang6to18', '密码至少6个字符,最多18个字符', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('27a06a8ed99f45438be00b7f1ca097f7', 'common.username', '用户名', 'zh-cn', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ff41480146ffbb62a30012', 'menu.manage', 'Menu Manage', 'en', '2014-07-04 12:56:50', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:06:15', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ff41480146ffbc59ac0014', 'menu.manage', '菜单管理', 'zh-cn', '2014-07-04 12:57:54', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:06:26', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffc8cd320001', 'common.id', 'ID', 'en', '2014-07-04 13:11:28', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-21 14:04:37', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffc933dc0003', 'common.id', '编号', 'zh-cn', '2014-07-04 13:11:54', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:11:54', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffc9b4bb0005', 'menu.name', 'Menu Name', 'en', '2014-07-04 13:12:27', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:14:52', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffcd8f60000b', 'menu.name', '菜单名称', 'zh-cn', '2014-07-04 13:16:40', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:16:40', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffcdc44b000d', 'common.icon', 'Icon', 'en', '2014-07-04 13:16:53', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:16:53', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffcdf4a6000f', 'common.icon', '图标', 'zh-cn', '2014-07-04 13:17:06', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:17:06', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffce76c70011', 'menu.url', 'Menu Url', 'en', '2014-07-04 13:17:39', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:17:39', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffcea7d80013', 'menu.url', '菜单地址', 'zh-cn', '2014-07-04 13:17:51', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:17:51', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffcf13090015', 'menu.order', 'Menu Order', 'en', '2014-07-04 13:18:19', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:18:19', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffcf4b0a0017', 'menu.order', '菜单顺序', 'zh-cn', '2014-07-04 13:18:33', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:18:33', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffd059670019', 'menu.add', 'Function Add', 'en', '2014-07-04 13:19:42', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:22:11', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffd1cfeb001d', 'menu.edit', 'Menu Edit', 'en', '2014-07-04 13:21:18', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:21:18', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffd20205001f', 'menu.edit', '菜单编辑', 'zh-cn', '2014-07-04 13:21:31', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:21:31', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffe1a54f0023', 'menu.level', 'Menu Level', 'en', '2014-07-04 13:38:36', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:38:36', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffe1e8530025', 'menu.level', '菜单等级', 'zh-cn', '2014-07-04 13:38:53', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:38:53', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffe5e2860027', 'parent.function', 'Parent Function', 'en', '2014-07-04 13:43:14', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:54:25', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffe6108b0029', 'parent.function', '父菜单', 'zh-cn', '2014-07-04 13:43:26', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:54:37', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffe9ec39002b', 'main.function', 'Main Function', 'en', '2014-07-04 13:47:38', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:54:52', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffea3970002d', 'main.function', '一级菜单', 'zh-cn', '2014-07-04 13:47:58', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:55:06', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffea9f27002f', 'sub.function', 'Sub Function', 'en', '2014-07-04 13:48:24', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:55:23', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffead7b80031', 'sub.function', '下级菜单', 'zh-cn', '2014-07-04 13:48:39', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:55:34', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffebb2660033', 'desktop.icon', 'Desk Icon', 'en', '2014-07-04 13:49:35', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:49:35', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046ffc2ca0146ffebdf940035', 'desktop.icon', '桌面图标', 'zh-cn', '2014-07-04 13:49:46', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 13:49:46', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380146fffca39a0003', 'icon.list', 'Icon List', 'en', '2014-07-04 14:08:05', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:20:31', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380146fffd42c40005', 'icon.list', '图标列表', 'zh-cn', '2014-07-04 14:08:46', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:20:45', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470001e905000b', 'common.icon.name', 'Icon Name', 'en', '2014-07-04 14:13:50', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:13:50', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470002280b000d', 'common.icon.name', '图标名称', 'zh-cn', '2014-07-04 14:14:07', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:14:07', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700030848000f', 'common.icon.style', 'Icon Style', 'en', '2014-07-04 14:15:04', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:21:40', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147000332810011', 'common.icon.style', '图标样式', 'zh-cn', '2014-07-04 14:15:15', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:15:15', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147000387440013', 'common.icon.type', 'Icon Type', 'en', '2014-07-04 14:15:37', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:15:37', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470003af940015', 'common.icon.type', '图标类型', 'zh-cn', '2014-07-04 14:15:47', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:15:47', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700054be10020', 'icon.add', 'Icon Add', 'en', '2014-07-04 14:17:32', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:17:32', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470005af9a0024', 'icon.edit', 'Icon Edit', 'en', '2014-07-04 14:17:58', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:17:58', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470005d3550026', 'icon.edit', '图标修改', 'zh-cn', '2014-07-04 14:18:07', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:18:07', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700063c220028', 'batch.generate.style', 'Batch Generate Style', 'en', '2014-07-04 14:18:34', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-21 11:32:32', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700068560002a', 'batch.generate.style', '批量生成样式', 'zh-cn', '2014-07-04 14:18:53', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:18:53', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470015a389002e', 'common.department.list', 'Org List', 'en', '2014-07-04 14:35:23', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:17:33', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470015ff8f0030', 'common.department.list', '组织机构列表', 'zh-cn', '2014-07-04 14:35:47', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:17:09', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470016d58e0036', 'common.department.name', 'Org Name', 'en', '2014-07-04 14:36:42', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:36:42', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700172e590038', 'common.department.name', '组织机构名称', 'zh-cn', '2014-07-04 14:37:04', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:37:04', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470017a515003a', 'position.desc', 'Org Desc', 'en', '2014-07-04 14:37:35', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-08-18 23:41:49', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470017d2fb003c', 'position.desc', '组织机构描述', 'zh-cn', '2014-07-04 14:37:47', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-08-18 23:41:59', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700193e67003e', 'view.member', 'View Member', 'en', '2014-07-04 14:39:20', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:39:20', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147001963ef0040', 'view.member', '查看成员', 'zh-cn', '2014-07-04 14:39:29', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:39:29', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147001ab010004a', 'parent.depart', 'Parent Org', 'en', '2014-07-04 14:40:54', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:40:54', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147001ad6a7004c', 'parent.depart', '上级组织机构', 'zh-cn', '2014-07-04 14:41:04', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:41:04', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700256132004e', 'area.manage', 'Area Manage', 'en', '2014-07-04 14:52:35', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:52:35', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470025a7e70050', 'area.manage', '地域管理', 'zh-cn', '2014-07-04 14:52:53', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:52:53', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002800990056', 'area.name', 'Area Name', 'en', '2014-07-04 14:55:27', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:55:27', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470028c0330058', 'area.name', '地域名称', 'zh-cn', '2014-07-04 14:56:16', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:56:16', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff238014700295bd8005a', 'area.code', 'Area Code', 'en', '2014-07-04 14:56:56', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:56:56', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002981ee005c', 'area.code', '地域编码', 'zh-cn', '2014-07-04 14:57:06', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:57:06', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff23801470029c84d005e', 'display.order', 'Area Sort', 'en', '2014-07-04 14:57:24', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:57:37', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002a3fa50061', 'display.order', '显示顺序', 'zh-cn', '2014-07-04 14:57:54', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:58:02', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002a93ba0064', 'area.add.param', 'Area Add', 'en', '2014-07-04 14:58:16', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:12:56', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002c144c006c', 'area.level', 'Area Level', 'en', '2014-07-04 14:59:54', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 14:59:54', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002c3711006e', 'area.level', '地域等级', 'zh-cn', '2014-07-04 15:00:03', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:00:03', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002ce8a70070', 'parent.area', 'Parent Area', 'en', '2014-07-04 15:00:48', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:00:48', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201046fff2380147002d42990072', 'parent.area', '父地域', 'zh-cn', '2014-07-04 15:01:11', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 15:01:11', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701d4ac920001', 'system.icon', 'System Icon', 'en', '2014-07-04 22:43:40', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:43:40', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701d4e2990003', 'system.icon', '系统图标', 'zh-cn', '2014-07-04 22:43:54', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:43:54', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701d53b200005', 'menu.icon', 'Menu Icon', 'en', '2014-07-04 22:44:17', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:44:17', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701d5c6cc0007', 'menu.icon', '菜单图标', 'zh-cn', '2014-07-04 22:44:53', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:44:53', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701dda832000d', 'main.area', 'Main Level', 'en', '2014-07-04 22:53:29', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:53:29', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701ddf718000f', 'main.area', '一级地域', 'zh-cn', '2014-07-04 22:53:49', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:58:41', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701de50dd0011', 'sub.area', 'Sub Level', 'en', '2014-07-04 22:54:12', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:55:00', '297e201046d3660a0146d36d7b7a01e7', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701c151014701dece660013', 'sub.area', '下级地域', 'zh-cn', '2014-07-04 22:54:44', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 22:54:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701ecd4014701f3a69c0001', 'member.list', 'Member List', 'en', '2014-07-04 23:17:30', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 23:17:30', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104701ecd4014701f3dcfb0003', 'member.list', '成员列表', 'zh-cn', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e2010477674e7014776e5ffae0005', 'iconname.rang2to10', '名称范围2~10位字符,且不为空', 'zh-cn', '2014-07-27 16:18:12', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e2010477674e7014776e6eecd0007', 'iconname.rang2to10', 'Icon name should be 2-10 characters and should not empty', 'en', '2014-07-27 16:19:11', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a01477784810a000f', 'operate.name', '页面控件名称', 'zh-cn', '2014-07-27 19:11:18', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:28:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a0147778a170d0011', 'operate.name', 'Page Element Name', 'en', '2014-07-27 19:17:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:30:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a01477791affe0014', 'operate.manage', 'Page access control', 'en', '2014-07-27 19:25:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:21:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a01477791eea00016', 'operate.manage', '页面控件权限配置', 'zh-cn', '2014-07-27 19:25:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:22:00', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a01477796ccde0018', 'operatename.rang2to20', '操作名称范围2~20位字符', 'zh-cn', '2014-07-27 19:31:17', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a014777979ab6001a', 'operatename.rang2to20', 'Operate name should be 2-20 characters', 'en', '2014-07-27 19:32:10', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a014777991ef9001c', 'operatestatus.number', '必须为数字', 'zh-cn', '2014-07-27 19:33:49', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777447a0147779a0f71001e', 'operatestatus.number', 'Must be numeric', 'en', '2014-07-27 19:34:50', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777a9190b0007', 'common.default.icon', 'default', 'en', '2014-07-27 19:51:16', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777a974ca0009', 'common.default.icon', '默认', 'zh-cn', '2014-07-27 19:51:39', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777a9cbc3000b', 'common.back', 'back', 'en', '2014-07-27 19:52:02', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777a9f433000d', 'common.back', '返回', 'zh-cn', '2014-07-27 19:52:12', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777ae465e000f', 'common.smallpie.icon', 'smallpie', 'en', '2014-07-27 19:56:55', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777aeb70c0011', 'common.smallpie.icon', '小饼状图', 'zh-cn', '2014-07-27 19:57:24', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777af2a970013', 'common.picture', '图片', 'zh-cn', '2014-07-27 19:57:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-27 19:58:19', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777af611a0015', 'common.picture', 'pictures', 'en', '2014-07-27 19:58:08', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777afea2c0018', 'common.pencil.icon', '笔', 'zh-cn', '2014-07-27 19:58:43', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b01f4a001a', 'common.pencil.icon', 'pencil', 'en', '2014-07-27 19:58:56', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b210ae001c', 'common.smallmap', '小地图', 'zh-cn', '2014-07-27 20:01:04', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b2638d001e', 'common.smallmap', 'smallmap', 'en', '2014-07-27 20:01:25', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b2d38b0020', 'common.group', '组', 'zh-cn', '2014-07-27 20:01:54', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b3010a0022', 'common.group', 'group', 'en', '2014-07-27 20:02:05', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b361fa0024', 'common.calculator', '计算器', 'zh-cn', '2014-07-27 20:02:30', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b39c390026', 'common.calculator', 'calculator', 'en', '2014-07-27 20:02:45', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b3ed9e0028', 'common.folder', '文件夹', 'zh-cn', '2014-07-27 20:03:06', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047779c5b014777b440fd002a', 'common.folder', 'folder', 'en', '2014-07-27 20:03:27', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777c827014777f13d7f0002', 'common.delete.fail.param', '{0}删除失败{1}', 'zh-cn', '2014-07-27 21:10:04', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777c827014777f282f60004', 'common.delete.fail.param', '{0} delete fail{1}', 'en', '2014-07-27 21:11:27', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777c827014777f52cd10006', 'common.icon.isusing', '！图标正在使用，不允许删除。', 'zh-cn', '2014-07-27 21:14:22', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e20104777c827014777f8c27e0008', 'common.icon.isusing', ', Icon is using, can not be deleted.', 'en', '2014-07-27 21:18:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-27 21:27:54', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201047781c8e014778273b160007', 'departmentname.rang3to10', '机构名称在3~10位字符', 'zh-cn', '2014-07-27 22:09:02', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047781c8e0147782885e90009', 'departmentname.rang3to10', 'Department name should be 3-10 characters', 'en', '2014-07-27 22:10:27', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047781c8e0147782a1443000b', 'areaname.rang2to15', '地域名称范围2~15位字符,且不为空', 'zh-cn', '2014-07-27 22:12:09', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047781c8e0147782a6615000d', 'areaname.rang2to15', 'Area name should be 2-15 characters and should not empty', 'en', '2014-07-27 22:12:30', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e7ffd4540028', 'common.org.code', '机构编码', 'zh-cn', '2014-08-18 15:23:28', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e8004113002a', 'common.org.code', 'Org Code', 'en', '2014-08-18 15:23:56', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e800add5002c', 'common.org.type', '机构类型', 'zh-cn', '2014-08-18 15:24:24', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e800edf8002e', 'common.org.type', 'Org Type', 'en', '2014-08-18 15:24:40', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e80a71980030', 'common.company', '公司', 'zh-cn', '2014-08-18 15:35:04', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e80abac10032', 'common.company', 'Company', 'en', '2014-08-18 15:35:23', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e815144e0034', 'common.position', '岗位', 'zh-cn', '2014-08-18 15:46:41', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047e73d0f0147e81561a80036', 'common.position', 'Position', 'en', '2014-08-18 15:47:01', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047f766400147f7b9d4d20009', 'role.set', '角色设置', 'zh-cn', '2014-08-21 16:40:56', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201047f766400147f7be2c6a000c', 'current.org', '当前机构', 'zh-cn', '2014-08-21 16:45:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-21 16:49:44', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201047f766400147f7be6144000e', 'current.org', 'Current Org', 'en', '2014-08-21 16:45:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-21 16:50:03', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('297e201047f8c5050147f923e5e8000c', 'role.set', 'Role Set', 'en', '2014-08-21 23:16:25', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048154920014815c3e9a7000c', 'common.add.exist.user', '添加已有客户', 'zh-cn', '2014-08-27 12:40:33', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048154920014815c47ac1000e', 'common.add.exist.user', 'Add Exist User', 'en', '2014-08-27 12:41:11', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b7e5c60148b7ffe64e0001', 'common.type.list', '类型列表', 'zh-cn', '2014-09-28 00:44:34', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b7e5c60148b8002b620003', 'common.type.list', 'Type List', 'en', '2014-09-28 00:44:51', 'admin', '管理员', '2014-09-28 00:46:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b7e5c60148b801c7520006', 'common.type.code', '类型编码', 'zh-cn', '2014-09-28 00:46:37', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b7e5c60148b801f8dc0008', 'common.type.code', 'Type Code', 'en', '2014-09-28 00:46:50', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b7e5c60148b8024884000a', 'common.type.name', '类型名称', 'zh-cn', '2014-09-28 00:47:10', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b7e5c60148b802773e000c', 'common.type.name', 'Type Name', 'en', '2014-09-28 00:47:22', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b803ec0148b80d34360001', 'common.type.view', '查看类型', 'zh-cn', '2014-09-28 00:59:06', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('297e201048b803ec0148b80d6da10003', 'common.type.view', 'Type View', 'en', '2014-09-28 00:59:20', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('2a609258aef344bbbcf0c766d922e449', 'common.phone', 'Phone', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('2bad4a20100e456aac2f6be3d1cc85ac', 'common.real.name', 'Real Name', 'en', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('2d70c1a8158b415b9aff12e1957c1819', 'common.repeat.password', 'Repeat Password', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('2fe5274af5d94fb49240d82b7b8d2a95', 'common.tel', 'Telephone', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('3db54b3731434dc38bc5ea3b20de7db8', 'common.middle', 'Middle', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402831814d8a1ae0014d8a239f520001', 'common.unlock.user', '激活用户', 'zh-cn', '2015-05-25 16:14:59', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402831814d8a1ae0014d8a2402d40003', 'common.unlock.user', 'unlock user', 'en', '2015-05-25 16:15:25', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f3e70d0147f3eb326b0005', 'funcType', '菜单类型', 'zh-cn', '2014-08-20 22:56:23', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f3e70d0147f3eb9f400007', 'funcType', 'funcType', 'en', '2014-08-20 22:56:51', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f3e70d0147f3ef30570009', 'funcType.page', '菜单类型', 'zh-cn', '2014-08-20 23:00:44', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-23 01:48:20', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f3e70d0147f3ef5482000b', 'funcType.page', 'menu type', 'en', '2014-08-20 23:00:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-23 01:48:29', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f3e70d0147f3ef8590000d', 'funcType.from', 'access type', 'en', '2014-08-20 23:01:06', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-23 01:49:57', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f3e70d0147f3efcd02000f', 'funcType.from', '访问类型', 'zh-cn', '2014-08-20 23:01:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-23 01:50:07', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f972bb0147f9749a7b0003', 'operationType.disabled', 'disabled', 'en', '2014-08-22 00:44:34', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f972bb0147f974dc860005', 'operationType.disabled', '禁用', 'zh-cn', '2014-08-22 00:44:51', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f972bb0147f9754c030007', 'common.enable', '有效', 'zh-cn', '2014-08-22 00:45:19', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f972bb0147f97581920009', 'common.enable', 'enable', 'en', '2014-08-22 00:45:33', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f972bb0147f975c3c8000b', 'common.disable', '无效', 'zh-cn', '2014-08-22 00:45:50', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('4028808847f972bb0147f97612a1000d', 'common.disable', 'disable', 'en', '2014-08-22 00:46:10', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e447e9ba550147e9be3a3a0003', 'common.rang', '{0}Operate name  should be {1}-{2} characters', 'en', '2014-08-18 23:31:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-08-18 23:32:00', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e447e9ba550147e9bf9eaa0006', 'common.rang', '{0}范围{1}~{2}位字符', 'zh-cn', '2014-08-18 23:32:35', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e447e9ba550147e9c1ab590008', 'departmentname.rang1to20', 'Depart name should be 1-20 characters', 'en', '2014-08-18 23:34:49', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e447e9ba550147e9c25bbe000a', 'departmentname.rang1to20', '组织机构范围1~20位字符', 'zh-cn', '2014-08-18 23:35:34', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e4489db6e601489dbc2cdc0001', 'common.add.to', 'AddTo', 'en', '2014-09-22 22:20:28', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e4489db6e601489dbc61380003', 'common.add.to', '添加', 'zh-cn', '2014-09-22 22:20:41', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705eee9120001', 'user.analysis.line', 'User analysis Line', 'en', '2014-07-05 17:50:49', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705f1741c0003', 'user.analysis.line', '用户分析 Line', 'zh-cn', '2014-07-05 17:53:35', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705f535a50005', 'user.analysis.pie', 'User analysis Pie', 'en', '2014-07-05 17:57:41', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705f597d10007', 'user.analysis.pie', '用户分析 Pie', 'zh-cn', '2014-07-05 17:58:07', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705f82a580009', 'user.analysis.histogram', 'User Analysis Histogram', 'en', '2014-07-05 18:00:55', '402880e64705a8ce014705af94280052', 'admin', '2014-07-21 10:08:08', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705fc8656000b', 'user.browser.analysis', ' Analysis of the user\'s browser proportion', 'en', '2014-07-05 18:05:41', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014705fce72d000d', 'user.browser.analysis', '用户浏览器比例分析', 'zh-cn', '2014-07-05 18:06:06', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca901470608088c000f', 'class.student.count.analysis', 'Class student ratio analysis', 'en', '2014-07-05 18:18:15', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014706088d7c0011', 'class.student.count.analysis', '班级学生人数比例分析', 'zh-cn', '2014-07-05 18:18:49', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060a873a0013', 'common.line.chart', 'Line chart', 'en', '2014-07-05 18:20:59', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060aef730015', 'common.line.chart', '折线图', 'zh-cn', '2014-07-05 18:21:25', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060bfcae0017', 'common.pie.chart', 'pie', 'en', '2014-07-05 18:22:34', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060c5e310019', 'common.pie.chart', '饼状图', 'zh-cn', '2014-07-05 18:22:59', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060dc6b6001b', 'common.histogram', 'Histogram', 'en', '2014-07-05 18:24:31', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060e11f3001d', 'common.histogram', '柱状图', 'zh-cn', '2014-07-05 18:24:51', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060fa1ba001f', 'class.count.statistics', 'Class size statistics', 'en', '2014-07-05 18:26:33', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147060fdf3a0021', 'class.count.statistics', '班级人数统计', 'zh-cn', '2014-07-05 18:26:49', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451230', 'common.query.statistics', '统计查询', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451231', 'common.query.statistics', 'Statistics Query', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451232', 'common.schedule.task', '定时任务', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451233', 'common.schedule.task', 'Timed Task', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451234', 'system.log', '系统日志', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451235', 'system.log', 'Sys Log', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451236', 'data.monitor', '数据监控', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451237', 'data.monitor', 'Data Monitor', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451238', 'form.config', '表单配置', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451239', 'form.config', 'Form Config', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451240', 'dynamic.form.config', '动态报表配置', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451241', 'dynamic.form.config', 'Dynamic Report Config', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451242', 'user.analysis', '用户分析', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061123451243', 'user.analysis', 'User Analysis', 'en', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061365350027', 'lang.class', 'Class', 'en', '2014-07-05 18:30:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-20 11:56:18', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca901470614932d0029', 'lang.class', '班级', 'zh-cn', '2014-07-05 18:31:57', '402880e64705a8ce014705af94280052', 'admin', '2014-07-20 11:56:24', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca9014706152c0a002b', 'number.ofpeople', ' Number of people', 'en', '2014-07-05 18:32:36', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca901470615588b002d', 'number.ofpeople', '人数', 'zh-cn', '2014-07-05 18:32:48', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca901470615f986002f', 'common.proportion', 'Proportion', 'en', '2014-07-05 18:33:29', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e64705eca90147061627450031', 'common.proportion', '比例', 'zh-cn', '2014-07-05 18:33:40', '402880e64705a8ce014705af94280052', 'admin', '2014-07-04 23:17:44', '297e201046d3660a0146d36d7b7a01e7', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c5e73f5014c5e80548f0001', 'user.report', '综合报表', 'zh-cn', '2015-03-28 11:50:10', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c5e73f5014c5e809f9d0003', 'user.report', 'newReport', 'en', '2015-03-28 11:50:30', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c6084c9014c609276500002', 'common.start', '启动', 'zh-cn', '2015-03-28 21:29:13', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c6084c9014c60929d5b0004', 'start', 'common.start', 'en', '2015-03-28 21:29:23', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c7a776c014c7a8121980004', 'operate.manage.data', '数据权限控制', 'zh-cn', '2015-04-02 22:20:25', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c7a776c014c7a817cd30006', 'operate.manage.data', 'Data access control', 'en', '2015-04-02 22:20:48', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c7a776c014c7a8c8c860010', 'operation.type', 'rule type', 'en', '2015-04-02 22:32:53', 'admin', '管理员', '2015-04-02 22:34:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e74c7a776c014c7a8cb6290012', 'operation.type', '规则类型', 'zh-cn', '2015-04-02 22:33:04', 'admin', '管理员', '2015-04-02 22:34:06', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402880e74d762a40014d76332b370003', 'rolescope.rang2to8.notnull', 'Role need 2~8 bits', 'en', '2015-05-21 19:19:34', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74d762a40014d7633a30c0005', 'rolescope.rang2to8.notnull', '角色范围在2~8位字符', 'zh-cn', '2015-05-21 19:20:05', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74d762a40014d76342eb00007', 'rolecode.rang2to15.notnull', '角色编码范围在2~15位字符', 'zh-cn', '2015-05-21 19:20:40', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402880e74d762a40014d76348d970009', 'rolecode.rang2to15.notnull', 'Rolecode need 2~15 bits', 'en', '2015-05-21 19:21:05', 'admin', '管理员', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728dc0fdf0005', 'has.sync', '已同步', 'zh-cn', '2014-07-12 12:36:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:36:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728dcc32c0007', 'has.sync', 'Synchronized', 'en', '2014-07-12 12:37:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:10:45', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728dd29140009', 'have.nosync', '未同步', 'zh-cn', '2014-07-12 12:38:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:38:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728dd8161000b', 'have.nosync', 'No Synchronize', 'en', '2014-07-12 12:38:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:38:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728dfe5610013', 'single.table', '单表', 'zh-cn', '2014-07-12 12:41:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:41:07', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728e0077e0015', 'single.table', 'Single Table', 'en', '2014-07-12 12:41:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:41:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728e0f6500017', 'slave.table', '附表', 'zh-cn', '2014-07-12 12:42:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:42:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728d95a014728e1183d0019', 'slave.table', 'Slave Table', 'en', '2014-07-12 12:42:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 12:42:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014728fd5f160003', 'smart.form.setting', '智能表单配置', 'zh-cn', '2014-07-12 13:13:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:13:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014728fd89ff0005', 'smart.form.setting', 'Smart Form Setting', 'en', '2014-07-12 13:13:30', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:13:30', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014728feca7b0007', 'generate.form', '生成表单', 'zh-cn', '2014-07-12 13:14:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:14:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014728feedfa0009', 'generate.form', 'Generate Form', 'en', '2014-07-12 13:15:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:15:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014728ff5a4e000b', 'generate.success', '生成成功', 'zh-cn', '2014-07-12 13:15:29', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:15:29', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014728ff7e81000d', 'generate.success', 'Generate Success', 'en', '2014-07-12 13:15:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:15:38', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa2801472900fe10000f', 'please.select.generate.item', '请选择要生成表单的项!', 'zh-cn', '2014-07-12 13:17:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:17:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa2801472901dab10011', 'please.select.generate.item', 'Please select should be generated item.', 'en', '2014-07-12 13:18:13', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:18:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa280147290fad990013', 'button.code', '按钮编码', 'zh-cn', '2014-07-12 13:33:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:33:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa280147290fcac30015', 'button.code', 'Button Code', 'en', '2014-07-12 13:33:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:33:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa2801472910045f0017', 'button.name', '按钮名称', 'zh-cn', '2014-07-12 13:33:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:33:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa28014729101a4a0019', 'button.name', 'Button Name', 'en', '2014-07-12 13:33:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:33:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa280147291059ca001b', 'button.style', '按钮样式', 'zh-cn', '2014-07-12 13:34:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:34:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa2801472910776c001d', 'button.style', 'Button Style', 'en', '2014-07-12 13:34:10', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:34:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa2801472910a634001f', 'action.type', '动作类型', 'zh-cn', '2014-07-12 13:34:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:34:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881034728fa2801472910bdd70021', 'action.type', 'Action Type', 'en', '2014-07-12 13:34:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 13:34:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293008280009', 'super.admin', '超级管理员', 'zh-cn', '2014-07-12 14:08:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:08:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293021c7000b', 'super.admin', 'Super Admin', 'en', '2014-07-12 14:08:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:08:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c73014729308a0e000d', 'please.select.lock.item', '请选择锁定项目', 'zh-cn', '2014-07-12 14:09:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:09:12', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c7301472930ae9e000f', 'please.select.lock.item', 'Please select locked item', 'en', '2014-07-12 14:09:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:09:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c7301472931c5900011', 'is.confirm', '确定吗', 'zh-cn', '2014-07-12 14:10:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:10:33', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c73014729320e310013', 'is.confirm', 'Confirm?', 'en', '2014-07-12 14:10:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:10:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c73014729369dde0015', 'current.permission', '当前权限', 'zh-cn', '2014-07-12 14:15:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:15:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c7301472936c80f0017', 'current.permission', 'Current Permission', 'en', '2014-07-12 14:16:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:16:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c73014729386dce0019', 'confirm.delete.this.record', '确定删除该记录吗', 'zh-cn', '2014-07-12 14:17:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:17:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c7301472938c6f9001b', 'confirm.delete.this.record', 'Delete this record, Confirm?', 'en', '2014-07-12 14:18:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:18:12', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c7301472939f98b001d', 'menu.list', '菜单列表', 'zh-cn', '2014-07-12 14:19:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:19:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293a157d001f', 'menu.list', 'Menu List', 'en', '2014-07-12 14:19:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:19:38', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293ab7a10021', 'operate.button.list', '精细化权限控制', 'zh-cn', '2014-07-12 14:20:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:25:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293aefc40023', 'operate.button.list', 'Fine access control', 'en', '2014-07-12 14:20:34', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:25:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293b76f80025', 'select.all', '全选', 'zh-cn', '2014-07-12 14:21:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:21:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810347292c730147293b8dc60027', 'select.all', 'Select All', 'en', '2014-07-12 14:21:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-12 14:21:14', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('40288103472948880147294b26420002', 'button.setting', '页面控件权限', 'zh-cn', '2014-07-12 14:38:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:12:27', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('40288103472948880147294b432a0004', 'button.setting', 'Page control config', 'en', '2014-07-12 14:38:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 20:06:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf3de950001', 'common.button.code', '按钮编码', 'zh-cn', '2014-07-19 12:49:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:49:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf407a90003', 'common.button.code', 'Button Code', 'en', '2014-07-19 12:49:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:49:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf46f7f0005', 'common.button.name', '按钮名称', 'zh-cn', '2014-07-19 12:49:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:49:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf4994d0007', 'common.button.name', 'Button Name', 'en', '2014-07-19 12:50:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:50:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf4f6430009', 'common.button.style', '按钮样式', 'zh-cn', '2014-07-19 12:50:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:50:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf517aa000b', 'common.button.style', 'Button Style', 'en', '2014-07-19 12:50:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:50:36', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf5930c000d', 'common.action.type', '动作类型', 'zh-cn', '2014-07-19 12:51:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:51:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf5af11000f', 'common.action.type', 'Action Type', 'en', '2014-07-19 12:51:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:51:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf652c20011', 'common.show.sequence', 'Show Sequence', 'en', '2014-07-19 12:51:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:04:07', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf694a20013', 'common.show.sequence', '显示顺序', 'zh-cn', '2014-07-19 12:52:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:52:14', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf6fa160015', 'common.show.icon.style', '显示图标样式', 'zh-cn', '2014-07-19 12:52:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:52:40', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf71da40017', 'common.show.icon.style', 'Show Icon Style', 'en', '2014-07-19 12:52:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:52:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf776390019', 'common.show.expression', '显示表达式', 'zh-cn', '2014-07-19 12:53:11', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:53:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474cf7972c001b', 'common.show.expression', 'Show Expression', 'en', '2014-07-19 12:53:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 12:53:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474d025ae20024', 'lang.code.cannot.add.update.delete', '编码不能是add/update/delete', 'zh-cn', '2014-07-19 13:05:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:05:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474cecc301474d0294e30026', 'lang.code.cannot.add.update.delete', 'Code cannot be add/update/delete', 'en', '2014-07-19 13:05:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:05:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d28a1fe0002', 'lang.user.online', '人在线', 'zh-cn', '2014-07-19 13:46:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:46:54', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d28cef50004', 'lang.user.online', 'user online', 'en', '2014-07-19 13:47:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:47:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2cc7d80006', 'common.login.name', '登录名', 'zh-cn', '2014-07-19 13:51:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:51:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2cf5650008', 'common.login.name', 'Login Name', 'en', '2014-07-19 13:51:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:51:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2ed970000a', 'common.login.time', '登录时间', 'zh-cn', '2014-07-19 13:53:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340000c', 'common.login.time', 'Login Time', 'en', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340001c', 'common.enter.verifycode', '请输入验证码', 'zh-cn', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340002c', 'common.verifycode.error', '验证码错误', 'zh-cn', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340003c', 'common.username.or.password.error', '用户名或密码错误', 'zh-cn', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340004c', 'common.enter.verifycode', 'Please enter the verification code', 'en', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340005c', 'common.verifycode.error', 'Verification code error', 'en', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d2f0340006c', 'common.username.or.password.error', 'User name or password error', 'en', '2014-07-19 13:53:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 13:53:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d3ad8c9000f', 'common.select', '选择', 'zh-cn', '2014-07-19 14:06:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 14:06:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d3b14bb0011', 'common.select', 'Select', 'en', '2014-07-19 14:07:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 14:07:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d3b61020013', 'common.clear', '清空', 'zh-cn', '2014-07-19 14:07:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 14:07:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028810b474d25ab01474d3b78f30015', 'common.clear', 'Clear', 'en', '2014-07-19 14:07:29', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-19 14:07:29', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028813f4752b0d7014752b35e4f0001', 'username.rang2to10', 'Username need 2~10 bits', 'en', '2014-07-20 15:36:32', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 15:36:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028813f4752c793014752cd3369000a', 'common.delete.success.param', '{0}删除成功', 'zh-cn', '2014-07-20 16:04:45', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 16:04:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028813f4752dc11014752e731930003', 'lang.dictionary.type', '字典分类', 'zh-cn', '2014-07-20 16:33:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 16:33:09', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028813f4752dc11014752e765dd0005', 'lang.dictionary.type', 'Dictionary Type', 'en', '2014-07-20 16:33:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 16:33:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028813f4752dc11014752e98bf90007', 'lang.dictionary.value', '字典值', 'zh-cn', '2014-07-20 16:35:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 16:35:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028813f4752dc11014752e9eba60009', 'lang.dictionary.value', 'Dictionary Value', 'en', '2014-07-20 16:36:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 14:06:50', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f793fd690016', 'common.taskid', 'Task Id', 'en', '2014-07-02 22:56:50', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:41:28', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f794259e0018', 'common.taskid', '任务ID', 'zh-cn', '2014-07-02 22:57:00', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:19:13', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7949e2d001a', 'common.task.desc', '任务描述', 'zh-cn', '2014-07-02 22:57:31', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-03 12:37:08', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f794d224001c', 'common.task.desc', 'Task Describe', 'en', '2014-07-02 22:57:44', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:41:38', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79550c4001e', 'cron.expression', 'cron表达式', 'zh-cn', '2014-07-02 22:58:16', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:22:37', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7956b7b0020', 'cron.expression', 'Cron Expression', 'en', '2014-07-02 22:58:23', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:41:44', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f795c74b0022', 'common.iseffect', '是否生效', 'zh-cn', '2014-07-02 22:58:47', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:22:58', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79643cc0024', 'common.iseffect', 'isEffect', 'en', '2014-07-02 22:59:19', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:23:03', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f796fbd60026', 'running.state', '运行状态', 'zh-cn', '2014-07-02 23:00:06', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:23:19', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79729ce0028', 'running.state', 'Running State', 'en', '2014-07-02 23:00:17', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:41:52', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f798b8850034', 'common.createby', 'Create By', 'en', '2014-07-02 23:02:00', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:41:58', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f798f9cf0036', 'common.createby', '创建人', 'zh-cn', '2014-07-02 23:02:16', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:23:44', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7999ffd003c', 'common.updateby', 'Update By', 'en', '2014-07-02 23:02:59', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:12', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f799e7e9003e', 'common.updateby', '修改人', 'zh-cn', '2014-07-02 23:03:17', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:24:30', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79a3aed0040', 'common.updatetime', '修改时间', 'zh-cn', '2014-07-02 23:03:38', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:24:47', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79a6c310042', 'common.updatetime', 'Update Time', 'en', '2014-07-02 23:03:51', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:21', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79b70e90044', 'common.operation', 'Operation', 'en', '2014-07-02 23:04:58', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:27', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79b9eef0046', 'common.operation', '操作', 'zh-cn', '2014-07-02 23:05:10', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:25:17', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79d8ea10048', 'common.start', 'Start', 'en', '2014-07-02 23:07:17', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:32', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79e5f54004c', 'common.stop', 'Stop', 'en', '2014-07-02 23:08:10', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:38', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79e7be9004e', 'common.stop', '停止', 'zh-cn', '2014-07-02 23:08:17', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:26:27', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79faa1d0050', 'effective.immediately', 'Effective Immediately', 'en', '2014-07-02 23:09:35', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:26:35', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f79fcc7f0052', 'effective.immediately', '立即生效', 'zh-cn', '2014-07-02 23:09:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:26:39', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a011b60054', 'common.delete', 'Delete', 'en', '2014-07-02 23:10:01', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:44', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a02ccc0056', 'common.delete', '删除', 'zh-cn', '2014-07-02 23:10:08', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:26:55', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a0da820059', 'common.add', 'Add', 'en', '2014-07-02 23:10:53', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:42:57', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a106cf005b', 'common.add', '录入', 'zh-cn', '2014-07-02 23:11:04', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:13', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a1500f005d', 'common.edit', 'Edit', 'en', '2014-07-02 23:11:23', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:43:04', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a16f90005f', 'common.edit', '编辑', 'zh-cn', '2014-07-02 23:11:31', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:24', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a186c20061', 'common.view', 'View', 'en', '2014-07-02 23:11:37', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:43:09', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a1aa900063', 'common.view', '查看', 'zh-cn', '2014-07-02 23:11:46', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:36', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a44eb60065', 'schedule.task.manage', 'Timed Task Manage', 'en', '2014-07-02 23:14:39', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:28:08', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7a471110067', 'schedule.task.manage', '定时任务管理', 'zh-cn', '2014-07-02 23:14:48', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7b7f88700a0', 'log.content', 'Log Content', 'en', '2014-07-02 23:36:08', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:41:04', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7b828ee00a2', 'log.content', '日志内容', 'zh-cn', '2014-07-02 23:36:20', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7b932f600a4', 'operate.ip', 'Operate IP', 'en', '2014-07-02 23:37:28', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:43:30', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7b9677100a6', 'operate.ip', '操作IP', 'zh-cn', '2014-07-02 23:37:41', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7b9bd7d00a8', 'common.browser', 'Broswer', 'en', '2014-07-02 23:38:04', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:43:36', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7b9f40a00aa', 'common.browser', '浏览器', 'zh-cn', '2014-07-02 23:38:17', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7ba2e7e00ac', 'operate.time', 'Operate Time', 'en', '2014-07-02 23:38:32', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:43:44', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7ba610e00ae', 'operate.time', '操作时间', 'zh-cn', '2014-07-02 23:38:45', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7bb601a00b0', 'log.manage', 'Log Manage', 'en', '2014-07-02 23:39:51', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7bb7ef200b2', 'log.manage', '日志管理', 'zh-cn', '2014-07-02 23:39:59', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7bbef3600b4', 'log.level', 'Log Level', 'en', '2014-07-02 23:40:27', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c012cd00cc', 'select.loglevel', 'Please select log level', 'en', '2014-07-02 23:44:59', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c086ff00ce', 'select.loglevel', '选择日志类型', 'zh-cn', '2014-07-02 23:45:28', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c0c98a00d0', 'common.login', 'Login', 'en', '2014-07-02 23:45:45', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c0ecb900d2', 'common.login', '登录', 'zh-cn', '2014-07-02 23:45:54', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c287de00d9', 'common.insert', 'Insert', 'en', '2014-07-02 23:47:40', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c2a1f200db', 'common.insert', '插入', 'zh-cn', '2014-07-02 23:47:46', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c4ad4600e1', 'common.update', 'Update', 'en', '2014-07-02 23:50:00', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c4dc8700e3', 'common.update', '更新', 'zh-cn', '2014-07-02 23:50:12', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c5815c00e5', 'common.upload', 'Upload', 'en', '2014-07-02 23:50:55', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c5a60600e7', 'common.upload', '上传', 'zh-cn', '2014-07-02 23:51:04', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c5fd5700e9', 'common.other', 'Other', 'en', '2014-07-02 23:51:26', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46f7832b0146f7c62c2400eb', 'common.other', '其他', 'zh-cn', '2014-07-02 23:51:38', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028818d46fa75be0146fa855c60000e', 'log.level', '日志类型', 'zh-cn', '2014-07-03 12:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146effd3b0a0001', 'common.language', '语言', 'zh-cn', '2014-07-01 11:34:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 11:41:20', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146effd5d980003', 'language', 'Languge', 'en', '2014-07-01 11:34:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:01:46', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146f001f7cd0007', 'common.delete.success.param', '{0} delete success', 'en', '2014-07-01 11:39:59', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 11:40:26', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146f00e2152000b', 'common.edit.success.param', '{0} 更新成功', 'zh-cn', '2014-07-01 11:53:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:17:01', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146f00f05aa000d', 'common.edit.success.param', '{0} update success', 'en', '2014-07-01 11:54:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 16:03:05', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146f01110bc000f', 'common.add.success.param', '{0} 录入成功', 'zh-cn', '2014-07-01 11:56:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 11:56:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046efce8d0146f01153070011', 'common.add.success.param', '{0} add success', 'en', '2014-07-01 11:56:45', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 11:56:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046f02a3f0146f02d9e910002', 'common.refresh.success', '刷新成功', 'zh-cn', '2014-07-01 12:27:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:27:40', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046f02a3f0146f02df49c0004', 'common.refresh.success', 'Refresh success', 'en', '2014-07-01 12:28:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:28:02', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046f02a3f0146f0301b150006', 'common.edit.fail.param', '{0} 更新失败', 'zh-cn', '2014-07-01 12:30:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:30:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046f02a3f0146f030cde00008', 'common.edit.fail.param', '{0} update fail', 'en', '2014-07-01 12:31:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:31:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046f02a3f0146f0346009000a', 'common.refresh.fail', '刷新失败', 'zh-cn', '2014-07-01 12:35:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:35:02', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c046f02a3f0146f0348bc9000c', 'common.refresh.fail', 'Refresh Fail', 'en', '2014-07-01 12:35:13', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-01 12:35:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147063dc2080001', 'database.property', '数据库属性', 'zh-cn', '2014-07-05 19:16:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:16:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147063e03aa0003', 'database.property', 'Database Property', 'en', '2014-07-05 19:17:13', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:17:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147063e73640005', 'page.property', '页面属性', 'zh-cn', '2014-07-05 19:17:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:17:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147063e910c0007', 'page.property', 'Page Property', 'en', '2014-07-05 19:17:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:17:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147063f9a4a0009', 'validate.dict', 'Validate Dictionary', 'en', '2014-07-05 19:18:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:18:57', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147063fe101000b', 'validate.dict', '校验字典', 'zh-cn', '2014-07-05 19:19:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:19:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe014706408c51000d', 'common.fk', '外键', 'zh-cn', '2014-07-05 19:19:59', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:19:59', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147064102b0000f', 'common.fk', 'Foreign Key', 'en', '2014-07-05 19:20:29', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:20:29', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147065887a70011', 'smark.form.form.maintain', '智能表单-表单维护', 'zh-cn', '2014-07-05 19:46:10', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:46:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe01470658c29d0013', 'smark.form.form.maintain', 'Smart Form', 'en', '2014-07-05 19:46:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:46:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147065a870d0015', 'common.one.to.many', '一对多', 'zh-cn', '2014-07-05 19:48:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:48:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147065acd6d0017', 'common.one.to.many', 'One To Many', 'en', '2014-07-05 19:48:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:48:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147065c1d980019', 'comon.one.to.one', '一对一', 'zh-cn', '2014-07-05 19:50:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:50:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147065c3551001b', 'comon.one.to.one', 'One To One', 'en', '2014-07-05 19:50:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:50:12', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147066041eb001d', 'common.uuid36bit', 'UUID(36位唯一编码)', 'zh-cn', '2014-07-05 19:54:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:54:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe01470660a327001f', 'common.uuid36bit', 'UUID(36 Bit Unique Code)', 'en', '2014-07-05 19:55:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:55:02', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe0147066267e70021', 'common.native.auto.increment', 'NATIVE(自增长方式)', 'zh-cn', '2014-07-05 19:56:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:56:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe01470662f1dd0023', 'common.native.auto.increment', 'NATIVE(Auto Increment)', 'en', '2014-07-05 19:57:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:57:33', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe01470663fbd00025', 'common.sequence', 'SEQUENCE(序列方式)', 'zh-cn', '2014-07-05 19:58:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:58:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe014706646c6b0027', 'common.sequence', 'SEQUENCE(Sequence)', 'en', '2014-07-05 19:59:10', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 19:59:19', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe014706669f32002a', 'please.input.table.name', '请输入表名！', 'zh-cn', '2014-07-05 20:01:34', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 20:01:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c1470636fe01470666c8e8002c', 'please.input.table.name', 'Please Input Table Name', 'en', '2014-07-05 20:01:45', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-05 20:01:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c347203fcc0147204d69020009', 'input.error', '输入错误', 'zh-cn', '2014-07-10 20:44:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 20:44:09', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c347203fcc0147204d9ef9000b', 'input.error', 'Input error', 'en', '2014-07-10 20:44:23', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 20:44:23', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c347205fc0014720704aa50001', 'menuname.rang4to15', '菜单名称范围4~15位字符,且不为空', 'zh-cn', '2014-07-10 21:22:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 21:22:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c347205fc0014720718d360003', 'menuname.rang4to15', 'Menu name should be 4-15 characters and should not empty', 'en', '2014-07-10 21:23:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 21:23:38', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c347205fc001472082f5130005', 'jeect.platform', 'jnzuo 金牛座统计分析后台', 'zh-cn', '2014-07-10 21:42:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 21:42:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881c347205fc00147208321e10007', 'jeect.platform', 'jnzuo 金牛座统计分析后台', 'en', '2014-07-10 21:42:50', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 21:42:50', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f486df0146f49af73f0001', 'pk.strategies', 'Primary key strategies', 'en', '2014-07-02 09:05:35', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 09:05:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f486df0146f49c57320003', 'pk.strategies', '主键策略', 'zh-cn', '2014-07-02 09:07:05', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 09:07:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f5f492d60001', 'table.name', '表名', 'zh-cn', '2014-07-02 15:23:04', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 15:23:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f5f4b8fe0003', 'table.name', 'Table Name', 'en', '2014-07-02 15:23:14', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 15:23:14', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f5f536b50005', 'table.description', 'Table Desc', 'en', '2014-07-02 15:23:46', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-21 10:16:11', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f5f56e0d0007', 'table.description', '表描述', 'zh-cn', '2014-07-02 15:24:00', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-21 10:16:15', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f5f648c00009', 'table.type', 'Table Type', 'en', '2014-07-02 15:24:56', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 15:24:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f5f672b6000b', 'table.type', '表类型', 'zh-cn', '2014-07-02 15:25:07', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 15:25:07', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f61534a0000d', 'sequence.name', 'Sequence Name', 'en', '2014-07-02 15:58:43', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 15:58:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f621503b0019', 'master.table', '主表', 'zh-cn', '2014-07-02 16:11:56', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:11:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f621dddd001b', 'master.table', 'Master Table', 'en', '2014-07-02 16:12:33', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:12:33', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6279e0f001d', 'common.yes', 'Yes', 'en', '2014-07-02 16:18:50', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:18:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f627cd1f001f', 'common.yes', '是', 'zh-cn', '2014-07-02 16:19:02', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:19:02', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f627f2040021', 'common.no', 'No', 'en', '2014-07-02 16:19:11', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:19:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6281f900023', 'common.no', '否', 'zh-cn', '2014-07-02 16:19:23', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:19:23', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f62fe8800025', 'single.query', 'Single Choice Query', 'en', '2014-07-02 16:27:53', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:27:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6302a9f0027', 'single.query', '单表查询', 'zh-cn', '2014-07-02 16:28:10', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:28:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f630e67d0029', 'combine.query', '组合查询', 'zh-cn', '2014-07-02 16:28:58', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:28:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6312721002b', 'combine.query', 'Combined Query', 'en', '2014-07-02 16:29:14', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:29:14', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6422c510036', 'common.isnull', 'Is Null', 'en', '2014-07-02 16:47:50', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:47:50', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6428fd00038', 'common.isnull', '是否为空', 'zh-cn', '2014-07-02 16:48:15', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:48:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f642e30f003a', 'common.pk', 'Primary Key', 'en', '2014-07-02 16:48:37', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:48:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f64311fb003c', 'common.pk', '主键', 'zh-cn', '2014-07-02 16:48:49', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:48:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6457894003e', 'field.type', 'Filed Type', 'en', '2014-07-02 16:51:26', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:51:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e446f5ec0b0146f6459cd30040', 'field.type', '字段类型', 'zh-cn', '2014-07-02 16:51:35', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 16:51:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca464640011', 'common.version', 'Version', 'en', '2014-06-30 19:58:55', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 19:58:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca47e280013', 'common.version', '版本', 'zh-cn', '2014-06-30 19:59:01', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 19:59:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca4b6bf0015', 'is.tree', 'Is Tree', 'en', '2014-06-30 19:59:16', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 19:59:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca4d8ba0017', 'is.tree', '是否树', 'zh-cn', '2014-06-30 19:59:24', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 19:59:24', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca510d60019', 'is.page', 'Is Page', 'en', '2014-06-30 19:59:39', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 19:59:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca537b7001b', 'is.page', '是否分页', 'zh-cn', '2014-06-30 19:59:49', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 19:59:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca6c3b8001d', 'sync.db', 'Sync DB', 'en', '2014-06-30 20:01:30', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:01:30', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca7193f001f', 'sync.db', '同步数据库', 'zh-cn', '2014-06-30 20:01:52', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:01:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146eca922890025', 'common.createtime', 'Create Time', 'en', '2014-06-30 20:04:05', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:04:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecab61a50033', 'common.createtime', '创建时间', 'zh-cn', '2014-06-30 20:06:33', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:53:48', '402881e946e70d550146e70fa0680086', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecac51520039', 'show.checkbox', 'Show Checkbox', 'en', '2014-06-30 20:07:34', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:07:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecac8bed003b', 'show.checkbox', '显示复选框', 'zh-cn', '2014-06-30 20:07:49', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:07:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecaea5630041', 'edit.form', 'Edit Table', 'en', '2014-06-30 20:10:07', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:10:07', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecaed7730043', 'edit.form', '编辑表单', 'zh-cn', '2014-06-30 20:10:19', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:10:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecaf39000045', 'create.form', 'Create From', 'en', '2014-06-30 20:10:44', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:10:44', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecaf63e00047', 'create.form', '创建表单', 'zh-cn', '2014-06-30 20:10:55', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:10:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb108de0049', 'custom.button', 'Custom Button', 'en', '2014-06-30 20:12:43', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:12:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb18fa6004b', 'custom.button', '自定义按钮', 'zh-cn', '2014-06-30 20:13:18', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:13:31', '402881e946e70d550146e70fa0680086', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb3bd13004e', 'form.generate', 'Generated From From DB', 'en', '2014-06-30 20:15:40', '402881e946e70d550146e70fa0680086', 'admin', '2014-09-15 11:28:33', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb3f9df0050', 'form.generate', '数据库导入表单', 'zh-cn', '2014-06-30 20:15:56', '402881e946e70d550146e70fa0680086', 'admin', '2014-09-15 11:28:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb58ed40052', 'form.import', '表单导入', 'zh-cn', '2014-06-30 20:17:40', '402881e946e70d550146e70fa0680086', 'admin', '2014-09-15 11:28:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb5a76b0054', 'form.import', 'From Import', 'en', '2014-06-30 20:17:46', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:17:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb72e600056', 'form.export', 'From Export', 'en', '2014-06-30 20:19:26', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:19:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecb762b50058', 'form.export', '表单导出', 'zh-cn', '2014-06-30 20:19:39', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:40:55', '402881e946e70d550146e70fa0680086', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecc71340005a', 'js.enhance', 'JsEnhance', 'en', '2014-06-30 20:36:48', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:36:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecc74476005c', 'js.enhance', 'js增强', 'zh-cn', '2014-06-30 20:37:00', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:37:00', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecca27d20062', 'sql.enhance', 'SqlEnhance', 'en', '2014-06-30 20:40:09', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:40:09', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecca51c60064', 'sql.enhance', 'sql增强', 'zh-cn', '2014-06-30 20:40:20', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:40:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecd312230068', 'smart.form.config', 'Smart Form Config', 'en', '2014-06-30 20:49:54', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:49:54', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946eca0a40146ecd3732a006a', 'smart.form.config', '只能表单配置', 'zh-cn', '2014-06-30 20:50:19', '402881e946e70d550146e70fa0680086', 'admin', '2014-06-30 20:50:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f728bca20001', 'common.code', 'Code', 'en', '2014-07-02 20:59:40', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 20:59:40', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f728e6220003', 'common.code', '编码', 'zh-cn', '2014-07-02 20:59:51', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 20:59:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72b42b40015', 'common.batch.delete', 'Batch Delete', 'en', '2014-07-02 21:02:25', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:02:25', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72b9a000017', 'common.batch.delete', '批量删除', 'zh-cn', '2014-07-02 21:02:48', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:02:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72ce5260021', 'query.sql', 'Query Sql', 'en', '2014-07-02 21:04:13', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:04:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72d1b480023', 'query.sql', '查询sql', 'zh-cn', '2014-07-02 21:04:26', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:04:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72d54c60025', 'common.name', 'Name', 'en', '2014-07-02 21:04:41', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:04:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72d72840027', 'common.name', '名称', 'zh-cn', '2014-07-02 21:04:49', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:04:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72e486c0029', 'dynamic.table.head', 'Dynamic Table', 'en', '2014-07-02 21:05:44', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:05:44', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881e946f723300146f72e7bda002b', 'dynamic.table.head', '动态表头', 'zh-cn', '2014-07-02 21:05:57', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-02 21:05:57', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706da32a10009', 'common.order', 'Order', 'en', '2014-07-05 22:07:48', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:07:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706da55fa000b', 'common.order', '排序', 'zh-cn', '2014-07-05 22:07:57', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:07:57', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706daa606000d', 'common.text', 'Text', 'en', '2014-07-05 22:08:18', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:08:18', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dadb74000f', 'common.text', '文本框', 'zh-cn', '2014-07-05 22:08:32', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:08:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706db1a6f0011', 'common.type', 'Type', 'en', '2014-07-05 22:08:48', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:08:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706db389d0013', 'common.type', '类型', 'zh-cn', '2014-07-05 22:08:55', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:08:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706db76390015', 'common.isshow', 'Is Show', 'en', '2014-07-05 22:09:11', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:09:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706db99420017', 'common.isshow', '是否显示', 'zh-cn', '2014-07-05 22:09:20', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:09:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dbdb330019', 'common.href', 'Href', 'en', '2014-07-05 22:09:37', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:09:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dc0bfe001b', 'common.href', '字段href', 'zh-cn', '2014-07-05 22:09:50', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:09:50', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dc5fc0001d', 'common.query.module', 'Query Module', 'en', '2014-07-05 22:10:11', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:10:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dc87df001f', 'common.query.module', '查询模式', 'zh-cn', '2014-07-05 22:10:21', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:10:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dd524d0021', 'dict.code', '字典Code', 'zh-cn', '2014-07-05 22:11:13', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:11:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706dd8a300023', 'dict.code', 'Dict Code', 'en', '2014-07-05 22:11:27', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:11:27', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706ddc7570025', 'common.isquery', 'Is Query', 'en', '2014-07-05 22:11:43', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:11:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706ddec9e0027', 'common.isquery', '是否查询', 'zh-cn', '2014-07-05 22:11:53', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:11:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706e230b80029', 'common.text.type', 'Column Type', 'en', '2014-07-05 22:16:32', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:16:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706e25a9f002b', 'common.text.type', '文本类型', 'zh-cn', '2014-07-05 22:16:43', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:16:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706e368c9002d', 'common.hide', 'Hideen', 'en', '2014-07-05 22:17:52', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:17:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706e3b1e2002f', 'common.hide', '隐藏', 'zh-cn', '2014-07-05 22:18:11', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:18:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706e3fe800031', 'common.show', 'Show', 'en', '2014-07-05 22:18:30', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:18:30', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706e423e40033', 'common.show', '显示', 'zh-cn', '2014-07-05 22:18:40', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:18:40', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706eba47c003e', 'dynamic.report.config.detail', 'Dyna Report Detail', 'en', '2014-07-05 22:26:52', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:29:53', '402881e946e70d550146e70fa0680086', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881ea4706d22b014706ebe1cd0040', 'dynamic.report.config.detail', '动态报表配置明细', 'zh-cn', '2014-07-05 22:27:07', '402881e946e70d550146e70fa0680086', 'admin', '2014-07-05 22:30:02', '402881e946e70d550146e70fa0680086', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470fefea200003', 'dict.manage', '数据字典管理', 'zh-cn', '2014-07-07 16:28:07', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470ff21ddd0009', 'dict.name', 'Dict Name', 'en', '2014-07-07 16:30:31', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470ff24cb8000b', 'dict.name', '字典名称', 'zh-cn', '2014-07-07 16:30:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470ff4e2830019', 'common.add.param', '{0} Add', 'en', '2014-07-07 16:33:33', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-20 16:02:09', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470ff51cc9001b', 'common.add.param', '{0}录入', 'zh-cn', '2014-07-07 16:33:48', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-20 16:02:23', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470ff925da0025', 'dict.information.type', 'Data Dictionary Group Info', 'en', '2014-07-07 16:38:12', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601470ff950100027', 'dict.information.type', '字典类型信息', 'zh-cn', '2014-07-07 16:38:23', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:43:03', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601471005919a0037', 'common.role.list', 'Role List', 'en', '2014-07-07 16:51:46', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601471005f5ac0039', 'common.role.list', '角色列表', 'zh-cn', '2014-07-07 16:52:12', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601471006c0bf003f', 'common.role.code', 'Role Code', 'en', '2014-07-07 16:53:04', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601471006e44a0041', 'common.role.code', '角色编码', 'zh-cn', '2014-07-07 16:53:13', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100713840043', 'common.role.name', 'Role Name', 'en', '2014-07-07 16:53:25', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe926014710073e820045', 'common.role.name', '角色名称', 'zh-cn', '2014-07-07 16:53:36', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe926014710095eb50053', 'common.edit.param', '{0} Edit', 'en', '2014-07-07 16:55:55', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-20 15:07:04', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100980ee0055', 'common.edit.param', '{0}编辑', 'zh-cn', '2014-07-07 16:56:04', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-20 15:07:13', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100affff0057', 'common.role.info', 'Role Info', 'en', '2014-07-07 16:57:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100b20eb0059', 'common.role.info', '角色信息', 'zh-cn', '2014-07-07 16:57:51', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100bf680005b', 'permission.set', 'Permission', 'en', '2014-07-07 16:58:45', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100c2c96005d', 'permission.set', '权限设置', 'zh-cn', '2014-07-07 16:58:59', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100e5051005f', 'permission.manage', 'Permission Manage', 'en', '2014-07-07 17:01:19', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100e8a360061', 'permission.manage', '权限管理', 'zh-cn', '2014-07-07 17:01:34', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100f73140067', 'permission.name', 'Permission Name', 'en', '2014-07-07 17:02:34', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147100fa9270069', 'permission.name', '权限名称', 'zh-cn', '2014-07-07 17:02:48', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe9260147101199f1006f', 'permission.collection', 'Permission Collection', 'en', '2014-07-07 17:04:55', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402881fa470fe92601471011bb380071', 'permission.collection', '权限集合', 'zh-cn', '2014-07-07 17:05:03', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-07 16:42:54', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc3fc7350002', 'common.change.refresh', '样式修改成功，请刷新页面', 'zh-cn', '2014-06-24 13:01:10', 'admin', '管理员', '2014-06-24 13:01:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc4029a60004', 'common.change.refresh', 'Style change success, please refresh', 'en', '2014-06-24 13:01:35', 'admin', '管理员', '2014-06-24 13:01:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc4541cb0006', 'common.login.again', '请登录后再操作', 'zh-cn', '2014-06-24 13:07:09', 'admin', '管理员', '2014-06-24 13:07:09', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc45c1270008', 'common.login.again', 'Please login again', 'en', '2014-06-24 13:07:41', 'admin', '管理员', '2014-06-24 13:07:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc4de4da000a', 'common.userinfo', '用户信息', 'zh-cn', '2014-06-24 13:16:35', 'admin', '管理员', '2014-06-24 13:16:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc4e7b25000c', 'common.userinfo', 'My Profile', 'en', '2014-06-24 13:17:13', 'admin', '管理员', '2014-06-24 13:17:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc55cac30012', 'common.surname', '姓名', 'zh-cn', '2014-06-24 13:25:13', 'admin', '管理员', '2014-06-24 13:25:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('402884f146cc37ab0146cc55f21b0014', 'common.surname', 'Name', 'en', '2014-06-24 13:25:23', 'admin', '管理员', '2014-06-24 13:25:23', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4a15aa60003', 'common.calendar', '日历', 'zh-cn', '2014-06-23 01:30:47', 'admin', '管理员', '2014-06-23 01:30:47', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4a190580005', 'common.calendar', 'Calendar', 'en', '2014-06-23 01:31:01', 'admin', '管理员', '2014-06-23 01:31:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4a2dc220007', 'common.map', '地图', 'zh-cn', '2014-06-23 01:32:26', 'admin', '管理员', '2014-06-23 01:32:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4a2f24e0009', 'common.map', 'Map', 'en', '2014-06-23 01:32:31', 'admin', '管理员', '2014-06-23 01:32:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4aff7ea000b', 'common.please.select', '---请选择---', 'zh-cn', '2014-06-23 01:46:45', 'admin', '管理员', '2014-06-23 01:46:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4b03310000d', 'common.please.select', 'Please Select', 'en', '2014-06-23 01:47:00', 'admin', '管理员', '2014-06-23 02:01:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4b8af79000f', 'common.please.input.keyword', '请输入关键字', 'zh-cn', '2014-06-23 01:56:16', 'admin', '管理员', '2014-06-23 01:56:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4b8f7aa0011', 'common.please.input.keyword', 'Keyword', 'en', '2014-06-23 01:56:34', 'admin', '管理员', '2014-06-23 01:56:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4ba979a0013', 'common.please.input.query.keyword', '请输入查询关键字', 'zh-cn', '2014-06-23 01:58:21', 'admin', '管理员', '2014-06-23 01:58:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4bade820015', 'common.please.input.query.keyword', 'Query keyword', 'en', '2014-06-23 01:58:39', 'admin', '管理员', '2014-06-23 01:58:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4bee05c0018', 'common.query', '查询', 'zh-cn', '2014-06-23 02:03:02', 'admin', '管理员', '2014-06-23 02:03:02', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4bf0575001a', 'common.query', 'Query', 'en', '2014-06-23 02:03:11', 'admin', '管理员', '2014-06-23 02:03:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4bf4239001c', 'common.reset', '重置', 'zh-cn', '2014-06-23 02:03:27', 'admin', '管理员', '2014-06-23 02:03:27', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc4d46c481da0146c4bf638a001e', 'common.reset', 'Reset', 'en', '2014-06-23 02:03:35', 'admin', '管理员', '2014-06-23 02:03:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c19fa9370004', 'common.navegation', '导航菜单', 'zh-cn', '2014-06-22 11:30:04', 'admin', '管理员', '2014-06-22 11:30:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a0a4d50006', 'common.navegation', 'Navegation', 'en', '2014-06-22 11:31:09', 'admin', '管理员', '2014-06-22 11:31:09', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a1b46e0008', 'common.control.panel', 'Control Panel', 'en', '2014-06-22 11:32:18', 'admin', '管理员', '2014-06-22 11:32:18', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a1e59b000a', 'common.control.panel', '控制面板', 'zh-cn', '2014-06-22 11:32:31', 'admin', '管理员', '2014-06-22 11:32:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a2d668000c', 'common.profile', '个人信息', 'zh-cn', '2014-06-22 11:33:32', 'admin', '管理员', '2014-06-22 11:33:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a31e02000e', 'common.profile', 'Profile', 'en', '2014-06-22 11:33:51', 'admin', '管理员', '2014-06-22 11:33:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a386000010', 'common.my.style', '首页风格', 'zh-cn', '2014-06-22 11:34:17', 'admin', '管理员', '2014-06-22 11:34:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a3bccd0012', 'common.my.style', 'Style', 'en', '2014-06-22 11:34:31', 'admin', '管理员', '2014-06-22 11:34:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a412670014', 'common.logout', '注销', 'zh-cn', '2014-06-22 11:34:53', 'admin', '管理员', '2014-06-22 11:36:06', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a4f99a0016', 'common.logout', 'Logout', 'en', '2014-06-22 11:35:52', 'admin', '管理员', '2014-06-22 11:35:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a5edff0019', 'common.exit', '退出', 'zh-cn', '2014-06-22 11:36:55', 'admin', '管理员', '2014-06-22 11:36:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a60dff001b', 'common.exit', 'Exit', 'en', '2014-06-22 11:37:03', 'admin', '管理员', '2014-06-22 11:37:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a85f8e001d', 'common.user', 'User', 'en', '2014-06-22 11:39:35', 'admin', '管理员', '2014-06-22 11:39:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1a88d9b001f', 'common.user', '用户', 'zh-cn', '2014-06-22 11:39:47', 'admin', '管理员', '2014-06-22 11:39:47', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1aae98c0025', 'common.platform', 'JEECG 演示系统', 'zh-cn', '2014-06-22 11:42:22', 'admin', '管理员', '2014-06-22 11:42:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c18cdc0146c1ab90ac0027', 'common.platform', 'JEECG Platform', 'en', '2014-06-22 11:43:04', 'admin', '管理员', '2014-06-22 11:43:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1e09ce00017', 'lang.maintain', '语言信息维护', 'zh-cn', '2014-06-22 12:41:01', 'admin', '管理员', '2014-06-22 12:41:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1e0f0780019', 'lang.maintain', 'Language Maintain', 'en', '2014-06-22 12:41:22', 'admin', '管理员', '2014-06-23 13:37:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ea9872002b', 'online.develop', 'Online Develop', 'en', '2014-06-22 12:51:55', 'admin', '管理员', '2014-06-22 12:51:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1eaf4d6002d', 'online.develop', 'Online 开发', 'zh-cn', '2014-06-22 12:52:19', 'admin', '管理员', '2014-06-22 12:52:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1eb749c002f', 'system.manage', '系统管理', 'zh-cn', '2014-06-22 12:52:51', 'admin', '管理员', '2014-06-22 12:52:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ebac710031', 'system.manage', 'System Manage', 'en', '2014-06-22 12:53:06', 'admin', '管理员', '2014-06-22 12:53:06', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ec37a10033', 'project.manage', '项目管理', 'zh-cn', '2014-06-22 12:53:41', 'admin', '管理员', '2014-06-22 12:53:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ec67a40035', 'project.manage', 'Project Manage', 'en', '2014-06-22 12:53:54', 'admin', '管理员', '2014-06-22 12:53:54', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ed9e6e0037', 'general.demo', '常用示例', 'zh-cn', '2014-06-22 12:55:13', 'admin', '管理员', '2014-06-22 12:55:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1edcc6d0039', 'general.demo', 'Demo', 'en', '2014-06-22 12:55:25', 'admin', '管理员', '2014-06-22 12:55:25', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ee629d003b', 'system.monitor', '系统监控', 'zh-cn', '2014-06-22 12:56:03', 'admin', '管理员', '2014-06-22 12:56:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1eebe6c003d', 'system.monitor', 'System Monitor', 'en', '2014-06-22 12:56:27', 'admin', '管理员', '2014-06-22 12:56:27', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ef4206003f', 'workflow.manage', '工作流管理', 'zh-cn', '2014-06-22 12:57:01', 'admin', '管理员', '2014-06-22 12:57:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1ef78d20041', 'workflow.manage', 'Workflow Manage', 'en', '2014-06-22 12:57:15', 'admin', '管理员', '2014-06-22 12:57:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1fe512f0045', 'common.change.password', '修改密码', 'zh-cn', '2014-06-22 13:13:28', 'admin', '管理员', '2014-06-22 13:13:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c1fe90260047', 'common.change.password', 'Change Password', 'en', '2014-06-22 13:13:44', 'admin', '管理员', '2014-06-22 13:13:44', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c202c92c0049', 'common.copyright', 'JNZUO 版权所有', 'zh-cn', '2014-06-22 13:18:20', 'admin', '管理员', '2014-06-23 11:01:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c203cd8d004b', 'common.copyright', 'JNZUO Copyright Reserved', 'en', '2014-06-22 13:19:27', 'admin', '管理员', '2014-06-22 13:19:27', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c20508bf004d', 'common.refresh', '刷新', 'zh-cn', '2014-06-22 13:20:48', 'admin', '管理员', '2014-06-22 13:20:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2053659004f', 'common.refresh', 'Refresh', 'en', '2014-06-22 13:20:59', 'admin', '管理员', '2014-06-22 13:20:59', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2057c580051', 'common.close', 'Close', 'en', '2014-06-22 13:21:17', 'admin', '管理员', '2014-06-22 13:21:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c205aff20053', 'common.close', '关闭', 'zh-cn', '2014-06-22 13:21:31', 'admin', '管理员', '2014-06-22 13:21:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c205f4be0055', 'common.close.all', '全部关闭', 'zh-cn', '2014-06-22 13:21:48', 'admin', '管理员', '2014-06-22 13:21:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c20631f70057', 'common.close.all', 'Close All', 'en', '2014-06-22 13:22:04', 'admin', '管理员', '2014-06-22 13:22:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2070b8a0059', 'common.close.all.but.this', 'Close all but this', 'en', '2014-06-22 13:23:00', 'admin', '管理员', '2014-06-22 13:23:00', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2074657005b', 'common.close.all.but.this', '除此之外全部关闭', 'zh-cn', '2014-06-22 13:23:15', 'admin', '管理员', '2014-06-22 13:23:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c207f0bc005d', 'common.close.all.right', '当前页右侧全部关闭', 'zh-cn', '2014-06-22 13:23:58', 'admin', '管理员', '2014-06-22 13:23:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2085b89005f', 'common.close.all.right', 'Close all on right', 'en', '2014-06-22 13:24:26', 'admin', '管理员', '2014-06-22 13:24:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c208cabc0061', 'common.close.all.left', '当前页左侧全部关闭', 'zh-cn', '2014-06-22 13:24:54', 'admin', '管理员', '2014-06-22 13:24:54', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2094dee0063', 'common.close.all.left', 'Close all on left', 'en', '2014-06-22 13:25:28', 'admin', '管理员', '2014-06-22 13:25:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2325e890069', 'common.assist.tools', '辅助工具', 'zh-cn', '2014-06-22 14:10:19', 'admin', '管理员', '2014-06-22 14:10:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c2330cf3006b', 'common.assist.tools', 'Tool', 'en', '2014-06-22 14:11:04', 'admin', '管理员', '2014-06-22 14:11:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c238a6eb006d', 'common.online.user', '用户在线列表', 'zh-cn', '2014-06-22 14:17:11', 'admin', '管理员', '2014-06-22 14:17:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fc5346c1aec50146c238d41e006f', 'common.online.user', 'Online User', 'en', '2014-06-22 14:17:22', 'admin', '管理员', '2014-06-22 14:17:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471f9575f10001', 'language.manage', '语言管理', 'zh-cn', '2014-07-10 17:23:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 17:23:14', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471f95fdd20003', 'language.manage', 'Lang Manage', 'en', '2014-07-10 17:23:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 17:23:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fc8bd5d0010', 'form.template', '表单模板', 'zh-cn', '2014-07-10 18:19:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:19:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fc8dc9b0012', 'form.template', 'Form Template', 'en', '2014-07-10 18:19:23', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:19:23', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fc961b70014', 'function.test', '功能测试', 'zh-cn', '2014-07-10 18:19:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:19:57', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fc97f300016', 'function.test', 'Function Test', 'en', '2014-07-10 18:20:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:20:04', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fc9e6310018', 'config.place', '配置地址', 'zh-cn', '2014-07-10 18:20:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:20:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fca0508001a', 'config.place', 'Setting Address', 'en', '2014-07-10 18:20:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:20:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fcd6c920020', 'table.exit.in.db.confirm', '表在数据库中已存在\\n确认删除', 'zh-cn', '2014-07-10 18:24:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:24:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fcdd7140022', 'table.exit.in.db.confirm', 'Table exit already\\n Confirm Delete', 'en', '2014-07-10 18:24:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:24:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fce9e7a0024', 'confirm.delete.record', '确认移除该记录', 'zh-cn', '2014-07-10 18:25:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:25:40', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fcec9d60026', 'confirm.delete.record', 'Confirm delete record', 'en', '2014-07-10 18:25:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:25:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fcf68be0028', 'form.datalist', '表单数据列表', 'zh-cn', '2014-07-10 18:26:32', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:26:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fcf948f002a', 'form.datalist', 'Form data list', 'en', '2014-07-10 18:26:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:26:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fd33eb1002e', 'common.please.select.edit.item', '请选择编辑项目', 'zh-cn', '2014-07-10 18:30:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:30:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fd36c4d0030', 'common.please.select.edit.item', 'Please select edit item', 'en', '2014-07-10 18:30:55', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:30:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fd429130032', 'common.please.select.one.record.to.edit', '请选择一条记录再编辑', 'zh-cn', '2014-07-10 18:31:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:31:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fd487c40034', 'common.please.select.one.record.to.edit', 'Please select one record to edit', 'en', '2014-07-10 18:32:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:32:07', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fd8bd8f003c', 'common.menu.link', '菜单链接', 'zh-cn', '2014-07-10 18:36:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:36:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fd8d355003e', 'common.menu.link', 'Menu Link', 'en', '2014-07-10 18:36:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:36:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdae99f0040', 'form.sqlimport', '表单SQL导入', 'zh-cn', '2014-07-10 18:39:06', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:39:06', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdb06f60042', 'form.sqlimport', 'Form SQL Import', 'en', '2014-07-10 18:39:13', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:39:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdbd2b60044', 'slave.table.can.not.generate.code', '附表不能代码生成', 'zh-cn', '2014-07-10 18:40:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:40:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdc1ba70046', 'slave.table.can.not.generate.code', 'Slave table can not generate code', 'en', '2014-07-10 18:40:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:47:00', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdd7b230048', 'please.syncdb', '请先同步数据库', 'zh-cn', '2014-07-10 18:41:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:41:54', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fde0d02004a', 'please.syncdb', 'Please synchronize database first', 'en', '2014-07-10 18:42:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:42:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fde8727004c', 'code.generate', '代码生成', 'zh-cn', '2014-07-10 18:43:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:43:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdebba6004e', 'code.generate', 'Code Generate', 'en', '2014-07-10 18:43:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:43:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdfb0040050', 'please.select.sync.method', '请选择同步方式', 'zh-cn', '2014-07-10 18:44:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:44:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fdff96f0052', 'please.select.sync.method', 'Please select synchronize method', 'en', '2014-07-10 18:44:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:44:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fe393f60059', 'normal.sync', '普通同步(保留表数据)', 'zh-cn', '2014-07-10 18:48:34', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:48:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fe4c6cb005b', 'normal.sync', 'Normal Sync(Retain Data)', 'en', '2014-07-10 18:49:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:49:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fe58641005d', 'force.sync', '强制同步(删除表,重新生成)', 'zh-cn', '2014-07-10 18:50:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:50:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471fe611cd005f', 'force.sync', 'Force Sync(Delete Table, ReGenerate)', 'en', '2014-07-10 18:51:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 18:51:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ff8d3000061', 'enhance.type', '增强类型', 'zh-cn', '2014-07-10 19:11:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:11:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ff8fcca0063', 'enhance.type', 'Enhance Type', 'en', '2014-07-10 19:11:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:11:57', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ff9ec220065', 'enhance.js', '增强js', 'zh-cn', '2014-07-10 19:12:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:12:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffa2ef10067', 'enhance.js', 'Enhance JS', 'en', '2014-07-10 19:13:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:13:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffb99300069', 'get.error', '出错了', 'zh-cn', '2014-07-10 19:14:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:14:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffbb3d7006b', 'get.error', 'Get Error', 'en', '2014-07-10 19:14:55', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:14:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffcc59f006d', 'operate.code', '页面控件编码', 'zh-cn', '2014-07-10 19:16:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:30:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffce066006f', 'operate.code', 'Page Element Code', 'en', '2014-07-10 19:16:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-02 22:30:50', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffed3280075', 'enhance.sql', '增强sql', 'zh-cn', '2014-07-10 19:18:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:18:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('4028fd2b471f63bb01471ffeef0d0077', 'enhance.sql', 'Enhance SQL', 'en', '2014-07-10 19:18:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-10 19:18:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('41e9ba5d4f2546fd871d0a4a401732a8', 'common.phone', '手机号码', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('42a24520ac85497d9da92af210113da2', 'common.status', '状态', 'zh-cn', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('52ce422654ab40329fe3a0518b5c8f67', 'password.rang6to18', 'The password is at least 6 characters long, up to 18 characters', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('5910b83799b242318f456a4f42303cb0', 'select.byrole', '按角色选择', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('5e5106b716d6476cae700ab27f2da555', 'common.middle', '中', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('767053e885704be2b203fbe5c0389b73', 'common.password.reset', '密码重置', 'zh-cn', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('7aae85094220429a84158e4db5c05d45', 'common.status', 'Status', 'en', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('7f980a800b114020b085530096b95d86', 'role.muti.select', '角色可多选', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c741b9ed0045', 'lang.langkey', '语言主键', 'zh-cn', '2014-06-23 13:45:11', 'admin', '管理员', '2014-06-23 13:45:11', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c74226100047', 'lang.langkey', 'Lang Key', 'en', '2014-06-23 13:45:39', 'admin', '管理员', '2014-06-23 13:45:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c743a8a40049', 'common.content', '内容', 'zh-cn', '2014-06-23 13:47:18', 'admin', '管理员', '2014-06-23 13:47:18', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c74416f5004b', 'common.content', 'Content', 'en', '2014-06-23 13:47:46', 'admin', '管理员', '2014-06-23 13:47:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c74526330050', 'common.language', 'Language', 'en', '2014-06-23 13:48:56', 'admin', '管理员', '2014-06-23 13:48:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c77efdb60076', 'common.import', '数据导入', 'zh-cn', '2014-06-23 14:52:06', 'admin', '管理员', '2014-06-23 14:52:06', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c77f95070078', 'common.import', 'Data Import', 'en', '2014-06-23 14:52:45', 'admin', '管理员', '2014-06-23 14:52:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c7802f4f007a', 'common.export', '数据导出', 'zh-cn', '2014-06-23 14:53:25', 'admin', '管理员', '2014-06-23 14:58:50', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846c664b70146c7809eb6007c', 'common.export', 'Data Export', 'en', '2014-06-23 14:53:53', 'admin', '管理员', '2014-06-23 14:59:00', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1ef63000003', 'user.manage', '用户管理', 'zh-cn', '2014-06-25 15:31:05', 'admin', '管理员', '2014-06-25 15:31:05', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1eff19e0005', 'user.manage', 'User Manage', 'en', '2014-06-25 15:31:41', 'admin', '管理员', '2014-06-25 15:31:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1f12ae00007', 'common.data.dictionary', 'Data Dictionary ', 'en', '2014-06-25 15:33:01', 'admin', '管理员', '2014-06-25 16:10:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1f1635a0009', 'common.data.dictionary', '数据字典', 'zh-cn', '2014-06-25 15:33:16', 'admin', '管理员', '2014-06-25 15:33:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1f24c0b000b', 'role.manage', '角色管理', 'zh-cn', '2014-06-25 15:34:15', 'admin', '管理员', '2014-06-25 15:34:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1f35861000f', 'role.manage', 'Role Manage', 'en', '2014-06-25 15:35:24', 'admin', '管理员', '2014-06-25 15:35:24', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1f8e1610015', 'icon.manage', '图标管理', 'zh-cn', '2014-06-25 15:41:27', 'admin', '管理员', '2014-06-25 15:41:27', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1fbc5bf0017', 'icon.manage', 'Icon Manage', 'en', '2014-06-25 15:44:36', 'admin', '管理员', '2014-06-25 15:44:36', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d1fffdb40019', 'department.manage', '组织机构管理', 'zh-cn', '2014-06-25 15:49:13', 'admin', '管理员', '2014-06-25 15:49:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab00846d1bb660146d20cbafe001b', 'department.manage', 'Org Manage', 'en', '2014-06-25 16:03:08', 'admin', '管理员', '2014-06-25 16:03:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b7bff40146b7c2eb6f0001', 'common.dash_board', '首页', 'zh-cn', '2014-06-20 13:32:23', 'admin', '管理员', '2014-06-20 14:58:43', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b7bff40146b7c38f560003', 'common.dash_board', 'Dashboard', 'en', '2014-06-20 13:33:05', 'admin', '管理员', '2014-06-20 14:58:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b802300146b8038a070001', 'common.add.success', '添加成功', 'zh-cn', '2014-06-20 14:42:58', 'admin', '管理员', '2014-06-20 14:42:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b802300146b8048a5e0004', 'common.add.success', 'Add success', 'en', '2014-06-20 14:44:03', 'admin', '管理员', '2014-06-20 14:44:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b802300146b806d7bd0006', 'common.edit.success', '更新成功', 'zh-cn', '2014-06-20 14:46:34', 'admin', '管理员', '2014-06-20 14:46:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b802300146b807c4e60008', 'common.edit.success', 'Update success', 'en', '2014-06-20 14:47:35', 'admin', '管理员', '2014-06-20 14:47:35', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b80a850146b80cf84d0002', 'common.delete.success', '删除成功', 'zh-cn', '2014-06-20 14:53:16', 'admin', '管理员', '2014-06-20 14:53:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b80a850146b80d35b70004', 'common.delete.success', 'Delete success', 'en', '2014-06-20 14:53:31', 'admin', '管理员', '2014-06-20 14:53:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b80a850146b80e7d420006', 'common.edit.fail', '更新失败', 'zh-cn', '2014-06-20 14:54:55', 'admin', '管理员', '2014-06-20 14:54:55', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b80a850146b80eddca0008', 'common.edit.fail', 'Update Fail', 'en', '2014-06-20 14:55:20', 'admin', '管理员', '2014-06-20 14:55:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b83b0b0146b83ec7070008', 'common.notfind.langkey', '', 'zh-cn', '2014-06-20 15:55:50', 'admin', '管理员', '2014-06-21 01:18:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab01b46b83b0b0146b83ec7070009', 'common.notfind.langkey', '', 'en', '2014-06-20 15:57:14', 'admin', '管理员', '2014-06-21 01:18:16', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474264c8980002', 'common.confirm', '确定', 'zh-cn', '2014-07-17 11:36:47', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:36:47', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474264e0510004', 'common.confirm', 'Confirm', 'en', '2014-07-17 11:36:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:36:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c51014742654bd20006', 'common.remove', 'Remove', 'en', '2014-07-17 11:37:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:37:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c510147426569f90008', 'common.remove', '移除', 'zh-cn', '2014-07-17 11:37:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:37:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474265ac98000a', 'common.item', '条', 'zh-cn', '2014-07-17 11:37:45', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:37:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474265cdc1000c', 'common.item', 'Item', 'en', '2014-07-17 11:37:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:37:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c51014742662411000e', 'common.total', '共', 'zh-cn', '2014-07-17 11:38:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:38:15', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c51014742664c5c0010', 'common.total', 'Total', 'en', '2014-07-17 11:38:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:38:26', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c51014742669c660012', 'common.inactive', '未激活', 'zh-cn', '2014-07-17 11:38:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:38:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474266cf100014', 'common.inactive', 'Inactive', 'en', '2014-07-17 11:38:59', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:38:59', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474267077d0016', 'common.active', '激活', 'zh-cn', '2014-07-17 11:39:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:39:14', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c510147426722730018', 'common.active', 'Active', 'en', '2014-07-17 11:39:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:39:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c5101474267fdef001e', 'common.languagekey', 'Lang Key', 'en', '2014-07-17 11:40:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:40:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab02147423c51014742687da20020', 'common.languagekey', '语言Key', 'zh-cn', '2014-07-17 11:40:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-17 11:40:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b05f8860005', 'common.remember.user', '是否记住用户名', 'zh-cn', '2014-07-25 08:57:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 08:57:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b0642280007', 'common.remember.user', 'Remember User', 'en', '2014-07-25 08:57:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 08:57:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b0b61120009', 'common.login.success.wait', '登陆成功!请稍后....', 'zh-cn', '2014-07-25 09:03:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:03:33', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b0bc257000b', 'common.login.success.wait', 'Login success, waiting....', 'en', '2014-07-25 09:03:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:03:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b0d4233000d', 'common.init.data', '是否初始化数据', 'zh-cn', '2014-07-25 09:05:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:05:36', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b0db938000f', 'common.init.data', 'Initialize data?', 'en', '2014-07-25 09:06:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:06:07', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b162e630012', 'lang.order.type', '订单类型', 'zh-cn', '2014-07-25 09:15:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:15:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b164ceb0014', 'lang.order.type', 'Order Type', 'en', '2014-07-25 09:15:29', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:15:29', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b16a56e0016', 'lang.customer.type', '客户类型', 'zh-cn', '2014-07-25 09:15:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:15:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b16c0d50018', 'lang.customer.type', 'Customer Type', 'en', '2014-07-25 09:15:59', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:15:59', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b170b9a001a', 'lang.service.item.type', '服务项目类型', 'zh-cn', '2014-07-25 09:16:18', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:16:18', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1749cc001c', 'lang.service.item.type', 'Service Item Type', 'en', '2014-07-25 09:16:34', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:16:34', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1936c60020', 'common.logic.condition', '逻辑条件', 'zh-cn', '2014-07-25 09:18:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:18:40', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1956dd0022', 'common.logic.condition', 'Logic Condition', 'en', '2014-07-25 09:18:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:18:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1a1cc30024', 'common.data.table', '数据表', 'zh-cn', '2014-07-25 09:19:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:19:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1a3c0a0026', 'common.data.table', 'Data Table', 'en', '2014-07-25 09:19:47', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:19:47', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1ac59e0028', 'common.document.category', '文档分类', 'zh-cn', '2014-07-25 09:20:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:20:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1aeaa3002a', 'common.document.category', 'Document Category', 'en', '2014-07-25 09:20:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:20:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1b3e55002c', 'common.sex.type', '性别类', 'zh-cn', '2014-07-25 09:20:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:20:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1b59af002e', 'common.sex.type', 'Sex Type', 'en', '2014-07-25 09:21:00', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:21:00', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1c08ba0030', 'common.attachment', '附件', 'zh-cn', '2014-07-25 09:21:45', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:21:45', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1c22dd0032', 'common.attachment', 'Attachment', 'en', '2014-07-25 09:21:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:21:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1d4e400034', 'lang.excellent.order', '优质订单', 'zh-cn', '2014-07-25 09:23:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:23:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1d7ece0036', 'lang.excellent.order', 'Excellent Order', 'en', '2014-07-25 09:23:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:23:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1de2050038', 'lang.normal.order', '普通订单', 'zh-cn', '2014-07-25 09:23:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:23:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1dfde4003a', 'lang.normal.order', 'Normal Order', 'en', '2014-07-25 09:23:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:23:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1ef393003c', 'lang.contract.customer', '签约客户', 'zh-cn', '2014-07-25 09:24:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:24:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1f0b32003e', 'lang.contract.customer', 'Contract Customer', 'en', '2014-07-25 09:25:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:25:02', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1f4fea0040', 'lang.normal.customer', '普通客户', 'zh-cn', '2014-07-25 09:25:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:25:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1f67050042', 'lang.normal.customer', 'Normal Customer', 'en', '2014-07-25 09:25:25', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:25:25', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1fa93d0044', 'lang.special.servcie', '特殊服务', 'zh-cn', '2014-07-25 09:25:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:25:42', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b1fceec0046', 'lang.special.servcie', 'Special Service', 'en', '2014-07-25 09:25:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:25:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b2014720048', 'lang.normal.service', '普通服务', 'zh-cn', '2014-07-25 09:26:10', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:26:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b203ca4004a', 'lang.normal.service', 'Normal Service', 'en', '2014-07-25 09:26:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:26:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b20bf5a004c', 'common.single.condition.query', '单条件查询', 'zh-cn', '2014-07-25 09:26:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:26:54', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b20e447004e', 'common.single.condition.query', 'Single Condition Query', 'en', '2014-07-25 09:27:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:27:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b214fe20050', 'common.scope.query', '范围查询', 'zh-cn', '2014-07-25 09:27:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:27:31', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b2171de0052', 'common.scope.query', 'Scope Queyr', 'en', '2014-07-25 09:27:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:27:39', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b21ffbf0054', 'common.db.integer', 'Integer', 'en', '2014-07-25 09:28:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:29:19', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b2227930056', 'common.db.integer', '数值类型', 'zh-cn', '2014-07-25 09:28:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:29:23', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b234ba5005a', 'common.db.date', 'Date', 'en', '2014-07-25 09:29:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:29:41', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b238657005c', 'common.db.date', '日期类型', 'zh-cn', '2014-07-25 09:29:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:29:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b23efed005e', 'common.db.string', '字符类型', 'zh-cn', '2014-07-25 09:30:23', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:30:23', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b2404d30060', 'common.db.string', 'String', 'en', '2014-07-25 09:30:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:30:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b245e800062', 'common.db.long', 'Long', 'en', '2014-07-25 09:30:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:30:51', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b248ee60064', 'common.db.long', '长整型', 'zh-cn', '2014-07-25 09:31:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:31:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b253d760066', 'common.workflow.engine.table', '工作流引擎表', 'zh-cn', '2014-07-25 09:31:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:31:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b256e3a0068', 'common.workflow.engine.table', 'Workflow Engine Table', 'en', '2014-07-25 09:32:00', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:32:00', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b25c1d4006a', 'common.system.table', '系统基础表', 'zh-cn', '2014-07-25 09:32:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:32:22', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b25d9b3006c', 'common.system.table', 'System Table', 'en', '2014-07-25 09:32:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:32:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b267773006e', 'common.business.table', '业务表', 'zh-cn', '2014-07-25 09:33:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:33:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b26a71c0070', 'common.business.table', 'Business Table', 'en', '2014-07-25 09:33:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:33:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b2761320072', 'common.customer.engine.table', '自定义引擎表', 'zh-cn', '2014-07-25 09:34:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:34:08', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b2791440074', 'common.customer.engine.table', 'Customer Engine Table', 'en', '2014-07-25 09:34:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:34:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b27d3790076', 'common.news', '新闻', 'zh-cn', '2014-07-25 09:34:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:34:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b27f9b30078', '新闻', 'News', 'en', '2014-07-25 09:34:47', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:34:47', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b28e56e007a', 'common.male', '男性', 'zh-cn', '2014-07-25 09:35:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:35:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b28fa30007c', 'common.male', 'Male', 'en', '2014-07-25 09:35:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:35:53', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b291a73007e', 'common.female', '女性', 'zh-cn', '2014-07-25 09:36:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:36:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0af476afe8501476b29466c0080', 'common.female', 'Female', 'en', '2014-07-25 09:36:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 09:36:12', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c37d001487c488a4d0006', 'common.datasource.manage', '多数据源管理', 'zh-cn', '2014-09-16 10:26:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-09-16 10:30:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c37d001487c491f480008', 'common.datasource.manage', 'Multiple DataSource Manage', 'en', '2014-09-16 10:27:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-09-16 10:30:56', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c5f6d400001', 'common.datasrouce.key', '多数据源主键', 'zh-cn', '2014-09-16 10:51:41', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c5fba980003', 'common.datasrouce.key', 'Mutipule DataSource Key', 'en', '2014-09-16 10:52:01', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c6193ec0005', 'common.driverclass', '驱动类', 'zh-cn', '2014-09-16 10:54:02', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c61b73d0007', 'common.driverclass', 'Driver Class', 'en', '2014-09-16 10:54:11', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c62b0b00009', 'common.datasrouce.url', '数据源地址', 'zh-cn', '2014-09-16 10:55:15', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c62f4d8000b', 'common.datasrouce.url', 'DataSource URL', 'en', '2014-09-16 10:55:33', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c63c17c000d', 'common.dbuser', '数据库用户名', 'zh-cn', '2014-09-16 10:56:25', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c63f0bf000f', 'common.dbuser', 'DB User', 'en', '2014-09-16 10:56:37', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c6430510011', 'common.dbpassword', '数据库密码', 'zh-cn', '2014-09-16 10:56:53', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c6456940013', 'common.dbpassword', 'DB Password', 'en', '2014-09-16 10:57:03', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c66d45d0015', 'common.dbtype', '数据库类型', 'zh-cn', '2014-09-16 10:59:46', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c66ffe00017', 'common.dbtype', 'DB Type', 'en', '2014-09-16 10:59:58', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c79d0660021', 'common.oracle', '甲骨文Oracle数据库', 'zh-cn', '2014-09-16 11:20:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-09-16 11:21:58', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c7aee7b0024', 'common.oracle', 'Oracle', 'en', '2014-09-16 11:21:44', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c8f0bfc0027', 'common.sqlserver2008', '微软SQL Server2008', 'zh-cn', '2014-09-16 11:43:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-09-16 11:48:44', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c8f57910029', 'common.sqlserver2008', 'SQL Server2008', 'en', '2014-09-16 11:44:01', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c94614b002d', 'common.mysql', '甲骨文MySQL', 'zh-cn', '2014-09-16 11:49:32', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0ba487c527201487c948fc0002f', 'common.mysql', 'MySQL', 'en', '2014-09-16 11:49:44', '8a8ab0b246dc81120146dc8181950052', 'admin', null, null, null);
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0c34761c347014761dfb98c0001', 'common.english', 'English', 'en', '2014-07-23 14:19:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-23 14:19:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0c34761c347014761dfde030003', 'common.english', 'English', 'zh-cn', '2014-07-23 14:19:27', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 08:51:07', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0c34761c347014761e00f350005', 'common.chinese', '中文', 'en', '2014-07-23 14:19:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-25 08:51:20', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0c34761c347014761e0305c0007', 'common.chinese', '中文', 'zh-cn', '2014-07-23 14:19:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-23 14:19:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756a3bd014756ad82990002', 'user.analysis.histogram', '用户分析直方图', 'zh-cn', '2014-07-21 10:08:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 10:08:37', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756a3bd014756ae22ce0004', 'usename.range2to10', '用户名长度范围在2~10', 'zh-cn', '2014-07-21 10:09:18', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 10:09:18', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756a3bd014756ae9c2a0006', 'sequence.name', '序号名称', 'zh-cn', '2014-07-21 10:09:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 10:09:49', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756ec17014756eff8410001', 'common.menu', '菜单', 'zh-cn', '2014-07-21 11:21:13', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 11:21:13', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756ec17014756f0122e0003', 'common.menu', 'Menu', 'en', '2014-07-21 11:21:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 11:21:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756ec17014756f5940d0007', 'common.area', '地域', 'zh-cn', '2014-07-21 11:27:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 11:27:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44756ec17014756f5b12e0009', 'common.area', 'Area', 'en', '2014-07-21 11:27:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 11:27:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d447576a86014757a4266d0004', 'common.role.select', '角色选择', 'zh-cn', '2014-07-21 14:38:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 14:38:01', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d447576a86014757a44a7b0006', 'common.role.select', 'Role Select', 'en', '2014-07-21 14:38:10', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 14:38:10', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44757b3f2014757b802010004', 'common.cancel', 'Cancel', 'en', '2014-07-21 14:59:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 14:59:42', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0d44757b3f2014757b821e00006', 'common.cancel', '取消', 'zh-cn', '2014-07-21 14:59:50', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-21 14:59:50', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c674f6ee0002', 'common.data.loading', '数据加载中...', 'zh-cn', '2014-06-23 10:01:32', 'admin', '管理员', '2014-06-23 10:01:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c675351b0004', 'common.data.loading', 'Data Loading......', 'en', '2014-06-23 10:01:48', 'admin', '管理员', '2014-06-23 10:01:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c6788e550006', 'common.exit.confirm', '确定退出该系统吗 ?', 'zh-cn', '2014-06-23 10:05:28', 'admin', '管理员', '2014-06-23 10:05:28', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c678d8600008', 'common.exit.confirm', 'Confirm Exit?', 'en', '2014-06-23 10:05:46', 'admin', '管理员', '2014-06-23 10:05:46', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c67af864000a', 'common.change.style', '切换页面风格', 'zh-cn', '2014-06-23 10:08:06', 'admin', '管理员', '2015-05-29 14:09:17', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c67b3590000c', 'common.change.style', 'Change Style', 'en', '2014-06-23 10:08:21', 'admin', '管理员', '2014-06-23 10:08:21', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c683c4ea0012', 'common.browser.recommend', '(推荐使用IE8+,谷歌浏览器可以获得更快,更安全的页面响应速度) 技术支持：', 'zh-cn', '2014-06-23 10:17:42', 'admin', '管理员', '2014-06-23 11:05:48', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0de46c66d490146c68486160014', 'common.browser.recommend', '(Recommend IE+, Google browser) Support: ', 'en', '2014-06-23 10:18:32', 'admin', '管理员', '2014-06-23 10:18:32', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0e8476756d8014767594f500001', 'common.mutilang', '多语言', 'zh-cn', '2014-07-24 15:50:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-24 15:50:12', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8ab0e8476756d801476759b8930003', 'common.mutilang', 'Muti Language', 'en', '2014-07-24 15:50:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-24 15:50:38', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8c8d1c475192970147519e89800004', 'common.description', 'Description', 'en', '2014-07-20 10:34:10', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 10:35:01', '8a8ab0b246dc81120146dc8181950052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8a8c8d1c475192970147519eae6d0006', 'common.description', '描述', 'zh-cn', '2014-07-20 10:34:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 10:34:19', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8c8d1c4751c965014751cb1ff50001', 'common.langcontext.exist', '该内容已经存在，请不要重复添加', 'zh-cn', '2014-07-20 11:22:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 11:22:52', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8a8c8d1c4751c965014751cd221a0003', 'common.langcontext.exist', 'Lang context exist already, don\'t add it again', 'en', '2014-07-20 11:25:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2014-07-20 11:25:03', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('8b4f561992c84eaa958b10c7912896b8', 'common.weak', '弱', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('8ca84db9bbcb44bfb39746822a976907', 'common.role', 'Role', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('95903aa116c74bdb95b5be510a89c79d', 'common.tel', '办公电话', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('9c3a8db4891a4d4390f6093ae2fd81af', 'common.strong', '强', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('9f750fb969ed4bdcbbdb212c43746112', 'common.lock.user', 'lock user', 'en', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('a8e5a8e8c5e44576a1500c3b5f57937b', 'select.byrole', 'According to the role select', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('ac43aecc3356487c8eb5fa869149412f', 'common.repeat.password', '重复密码', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('aec73ffa01b5499db0253b3b34194560', 'username.rang2to10', '用户名范围在2~10位字符', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('b8865c9032054772b39d43efda9ba0c8', 'role.muti.select', 'The role of multiple choices', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('b8dae445b3ef468db87167ddd8cd1b64', 'please.select.department', '请选择组织机构', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('c150726fac0d43fd9bf28f4590018950', 'common.username', 'User Name', 'en', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('caaf209a7acb413ea59bbdf30e944f20', 'common.common.mail', 'Mail', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('ce8b2968f1fc49bba1a636ca18e7f08f', 'usename.range2to10', 'The user name in the range of 2~10 characters', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('d136cd1f25cc42fe8a0fae2dddc5de23', 'common.weak', 'Weak', 'en', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('dc787a2087ea4f248a394f8a88a5792c', 'common.real.name', '真实姓名', 'zh-cn', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('df075bc6373b4658afcfaff33b088952', 'common.role', '角色', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('e1fb12b3993b4d1ea35bd536801ada1f', 'common.common.mail', '常用邮箱', 'zh-cn', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2015-04-02 23:10:33', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('e547fec1826c4811b6d759f2d81153f8', 'common.password.reset', 'Password Reset', 'en', '2014-07-03 18:39:42', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('f9f74528bde04a0f9e25e29cbc87d9fb', 'fill.realname', '填写个人真实姓名', 'zh-cn', '2014-07-04 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-04 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('fa07850cb8ed4c268cc91ffd31e7ace1', 'common.password', 'Password', 'en', '2014-07-03 18:39:43', '4028818d46f764fb0146f7661cb60052', 'admin', '2014-07-02 23:27:53', '4028818d46f764fb0146f7661cb60052', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d000', 'common.querybuilder', '高级查询', 'zh-cn', '2015-04-28 10:26:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-04-28 10:30:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d001', 'common.code.range', '编码范围在2~8位字符', 'zh-cn', '2015-06-01 10:21:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-01 10:22:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d002', 'common.code.range', 'The coding in the range of 2~8 characters', 'en', '2015-06-01 10:29:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-01 10:30:54', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d003', 'common.name.range', '名称范围在2~10位字符', 'zh-cn', '2015-06-01 10:49:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-01 10:49:57', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d004', 'common.name.range', 'The name in the range of 2~10 characters', 'en', '2015-06-01 10:51:35', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-01 10:51:48', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d005', 'menu.graph.configuration', '图表配置', 'zh-cn', '2015-06-02 11:29:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:30:02', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d006', 'menu.graph.configuration', 'The graph configuration', 'en', '2015-06-02 11:31:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:31:26', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d007', 'menu.input.demo', '事例录入', 'zh-cn', '2015-06-02 11:40:30', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:40:43', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d008', 'menu.input.demo', 'input demo', 'en', '2015-06-02 11:41:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:41:29', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d009', 'menu.push.message', '消息推送', 'zh-cn', '2015-06-02 11:45:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:45:48', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d010', 'menu.push.message', 'push message', 'en', '2015-06-02 11:46:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:46:55', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d011', 'menu.business.management', '业务管理', 'zh-cn', '2015-06-02 11:49:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:49:42', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d012', 'menu.business.management', 'business management', 'en', '2015-06-02 11:50:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:51:00', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d013', 'menu.message.template', '消息模板管理', 'zh-cn', '2015-06-02 11:54:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:54:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d014', 'menu.message.template', 'The message template', 'en', '2015-06-02 11:54:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:55:03', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d015', 'menu.Business.configuration', '业务配置', 'zh-cn', '2015-06-02 11:58:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:58:58', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d016', 'menu.Business.configuration', 'Business configuration', 'en', '2015-06-02 11:58:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 11:59:01', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d017', 'menu.send.message', '消息发送监控', 'zh-cn', '2015-06-02 12:02:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:02:43', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d018', 'menu.send.message', 'Message is sent', 'en', '2015-06-02 12:02:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:03:00', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d019', 'menu.sort.management', '分类管理', 'zh-cn', '2015-06-02 12:07:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:07:23', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d020', 'menu.sort.management', 'sort management', 'en', '2015-06-02 12:07:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:07:27', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d021', 'menu.nice.list', '漂亮列表', 'zh-cn', '2015-06-02 12:11:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:11:29', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d022', 'menu.nice.list', 'Nice list', 'en', '2015-06-02 12:11:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:11:26', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d023', 'menu.data.permission', '数据权限', 'zh-cn', '2015-06-02 12:14:25', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:14:39', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d024', 'menu.data.permission', 'data permission', 'en', '2015-06-02 12:14:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 12:14:58', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d025', 'menu.user.management', '用户管理', 'zh-cn', '2015-06-02 13:14:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 13:14:32', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d026', 'menu.user.management', 'user management', 'en', '2015-06-02 13:14:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 13:14:44', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d027', 'menu.Leave.data.access', 'OL请假数据权限', 'zh-cn', '2015-06-02 13:19:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 13:20:10', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d028', 'menu.Leave.data.access', 'Leave the data access', 'en', '2015-06-02 13:19:55', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 13:20:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d029', 'menu.form.validation', '表单验证', 'zh-cn', '2015-06-02 14:49:50', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 14:55:01', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d030', 'menu.form.validation', 'Form validation', 'en', '2015-06-02 14:49:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 14:55:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d031', 'menu.demo.example', 'demo示例', 'zh-cn', '2015-06-02 14:58:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 14:58:59', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d032', 'menu.demo.example', 'demo example', 'en', '2015-06-02 14:58:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 14:59:11', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d033', 'menu.minidao.example', 'minidao例子', 'zh-cn', '2015-06-02 15:03:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:04:04', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d034', 'menu.minidao.example', 'minidao example', 'en', '2015-06-02 15:03:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:04:10', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d035', 'menu.form.model', '表单模型', 'zh-cn', '2015-06-02 15:13:44', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:13:59', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d036', 'menu.form.model', 'The form model', 'en', '2015-06-02 15:13:47', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:14:02', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d037', 'menu.one_to_many.model', '一对多模型', 'zh-cn', '2015-06-02 15:17:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:18:18', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d038', 'menu.one_to_many.model', 'one-to-many model', 'en', '2015-06-02 15:17:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:18:21', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d039', 'menu.import_export.excel', 'Excel导入导出', 'zh-cn', '2015-06-02 15:23:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:23:39', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d040', 'menu.import_export.excel', 'import and export of the excel ', 'en', '2015-06-02 15:23:06', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:23:43', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d041', 'menu.uploads_downloads', '上传下载', 'zh-cn', '2015-06-02 15:31:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:32:04', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d042', 'menu.uploads_downloads', 'Uploads and downloads', 'en', '2015-06-02 15:31:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:32:09', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d043', 'menu.JqueryFileUpload.example', 'JqueryFileUpload示例', 'zh-cn', '2015-06-02 15:35:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:35:30', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d044', 'menu.JqueryFileUpload.example', 'JqueryFileUpload example', 'en', '2015-06-02 15:35:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:35:32', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d045', 'menu.no.paging', '无分页列表', 'zh-cn', '2015-06-02 15:39:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:39:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d046', 'menu.no.paging', 'No paging  list', 'en', '2015-06-02 15:39:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:39:37', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d047', 'menu.jdbc.example', 'jdbc示例', 'zh-cn', '2015-06-02 15:42:32', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:42:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d048', 'menu.jdbc.example', 'jdbc example', 'en', '2015-06-02 15:42:34', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:42:52', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d049', 'menu.sql.separation', 'SQL分离', 'zh-cn', '2015-06-02 15:47:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:47:17', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d050', 'menu.sql.separation', 'SQL separation', 'en', '2015-06-02 15:47:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:47:23', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d051', 'menu.dictionary.labels', '字典标签', 'zh-cn', '2015-06-02 15:49:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:50:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d052', 'menu.dictionary.labels', 'The dictionary labels', 'en', '2015-06-02 15:50:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:50:40', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d053', 'menu.form.thePop_UpStyle', '表单弹出风格', 'zh-cn', '2015-06-02 15:54:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:55:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d054', 'menu.form.thePop_UpStyle', 'Form the pop-up style', 'en', '2015-06-02 15:54:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:55:15', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d055', 'menu.special.layout', '特殊布局', 'zh-cn', '2015-06-02 15:58:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:58:57', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d056', 'menu.special.layout', 'The special layout', 'en', '2015-06-02 15:58:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 15:58:59', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d057', 'menu.single.table', '单表例子（无tag）', 'zh-cn', '2015-06-02 16:02:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:02:52', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d058', 'menu.single.table', 'Single table example(no tag)', 'en', '2015-06-02 16:02:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:02:54', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d059', 'menu.one_to_many.example', '一对多例子（无tag）', 'zh-cn', '2015-06-02 16:06:06', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:08:01', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d060', 'menu.one_to_many.example', 'one to many example(no tag)', 'en', '2015-06-02 16:07:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:08:04', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d061', 'menu.html.editor', 'HTML编辑器', 'zh-cn', '2015-06-02 16:11:39', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:12:00', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d062', 'menu.html.editor', 'HTML editor', 'en', '2015-06-02 16:11:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:12:03', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d063', 'menu.word.online', '在线word(IE)', 'zh-cn', '2015-06-02 16:14:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:14:55', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d064', 'menu.word.online', 'word online(IE)', 'en', '2015-06-02 16:14:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:14:58', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d065', 'menu.webOfficeo.fficialExample', 'WebOffice官方例子', 'zh-cn', '2015-06-02 16:19:45', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:20:05', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d066', 'menu.webOfficeo.fficialExample', 'The official example of WebOffice', 'en', '2015-06-02 16:19:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:20:07', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d067', 'menu.moreAccessoriesManagement', '多附件管理', 'zh-cn', '2015-06-02 16:24:18', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:24:36', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d068', 'menu.moreAccessoriesManagement', 'More accessories management', 'en', '2015-06-02 16:24:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:24:39', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d069', 'menu.datagridHandHtml', 'Datagrid手工Html', 'zh-cn', '2015-06-02 16:28:48', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:29:04', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d070', 'menu.datagridHandHtml', 'Datagrid Html with hand', 'en', '2015-06-02 16:28:50', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:29:06', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d071', 'menu.materialPom', '物料POM', 'zh-cn', '2015-06-02 16:37:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:37:27', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d072', 'menu.materialPom', 'material pom', 'en', '2015-06-02 16:37:11', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:37:29', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d073', 'menu.ckfinderDemo', 'ckfinder例子', 'zh-cn', '2015-06-02 16:40:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:40:26', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d074', 'menu.ckfinderDemo', 'ckfinder demo', 'en', '2015-06-02 16:40:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:40:28', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d075', 'menu.queryEditor', '查询编辑器', 'zh-cn', '2015-06-02 16:44:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:44:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba487c37d001487c488a4d076', 'menu.queryEditor', 'The query editor', 'en', '2015-06-02 16:44:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-02 16:44:38', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0001', 'common.wage', 'wage', 'en', '2015-06-03 16:34:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:34:52', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0002', 'common.clear.localstorage', '清除缓存', 'zh-cn', '2015-04-28 10:26:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-05-25 16:30:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0003', 'common.clear.localstorage', 'Clear Cache', 'en', '2015-04-28 10:26:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-05-25 16:30:20', 'admin', '管理员');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0004', 'common.messageSend.record', '消息发送记录表', 'zh-cn', '2015-06-03 10:50:30', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 10:50:48', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0005', 'common.messageSend.record', 'data record to send message', 'en', '2015-06-03 10:50:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 10:50:50', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0006', 'common.messageHeader', '消息标题', 'zh-cn', '2015-06-03 11:05:23', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:05:46', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0007', 'common.messageHeader', 'message header', 'en', '2015-06-03 11:05:25', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:05:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0008', 'common.messageType', '消息类型', 'zh-cn', '2015-06-03 11:09:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:09:35', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0009', 'common.messageType', 'message type', 'en', '2015-06-03 11:09:13', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:09:38', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0010', 'common.sender', '发送人', 'zh-cn', '2015-06-03 11:13:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:13:26', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0011', 'common.sender', 'sender', 'en', '2015-06-03 11:13:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:13:29', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0012', 'common.receiver', '接收人', 'zh-cn', '2015-06-03 11:15:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:16:21', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0013', 'common.receiver', 'receiver', 'en', '2015-06-03 11:16:00', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:16:24', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0014', 'common.content_2', '内容', 'zh-cn', '2015-06-03 11:19:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:20:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0015', 'common.content_2', 'content', 'en', '2015-06-03 11:19:53', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:20:16', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0016', 'common.dateCreated', '创建日期', 'zh-cn', '2015-06-03 11:22:32', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:22:55', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0017', 'common.dateCreated', 'date created', 'en', '2015-06-03 11:22:34', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:22:59', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0018', 'common.sendtime', '发送时间', 'zh-cn', '2015-06-03 11:25:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:26:02', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0019', 'common.sendtime', 'sendtime', 'en', '2015-06-03 11:25:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:26:05', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0020', 'common.sendState', '发送状态', 'zh-cn', '2015-06-03 11:30:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:30:23', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0021', 'common.sendState', 'send state', 'en', '2015-06-03 11:30:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:30:26', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0022', 'common.remark', '备注', 'zh-cn', '2015-06-03 11:32:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:32:56', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0023', 'common.remark', 'remark', 'en', '2015-06-03 11:32:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:33:00', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0024', 'common.esId', '主键', 'zh-cn', '2015-06-03 11:37:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:37:38', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0025', 'common.esId', 'ID', 'en', '2015-06-03 11:37:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:37:41', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0026', 'common.iconEdit', '消息修正', 'zh-cn', '2015-06-03 11:40:50', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:41:09', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0027', 'common.iconEdit', 'Message modification', 'en', '2015-06-03 11:40:52', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:41:11', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0028', 'common.businessSqlTable', '业务SQL表', 'zh-cn', '2015-06-03 11:50:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:50:48', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0029', 'common.businessSqlTable', 'The SQL table of business', 'en', '2015-06-03 11:50:27', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:50:52', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0030', 'common.sqlName', 'SQL名称', 'zh-cn', '2015-06-03 11:53:08', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:53:28', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0031', 'common.sqlName', 'SQL name', 'en', '2015-06-03 11:53:11', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:53:33', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0032', 'common.sqlContent', 'SQL内容', 'zh-cn', '2015-06-03 11:55:25', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:55:47', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0033', 'common.sqlContent', 'SQL content', 'en', '2015-06-03 11:55:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:55:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0034', 'common.operate', '操作', 'zh-cn', '2015-06-03 11:57:51', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:58:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0035', 'common.operate', 'operate', 'en', '2015-06-03 11:57:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 11:58:16', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0036', 'common.delete_2', '删除', 'zh-cn', '2015-06-03 12:01:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:01:48', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0037', 'common.delete_2', 'delete', 'en', '2015-06-03 12:01:25', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:01:51', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0038', 'common.add_2', '录入', 'zh-cn', '2015-06-03 12:04:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:04:28', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0039', 'common.add_2', 'add', 'en', '2015-06-03 12:04:06', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:04:31', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0040', 'common.edit_2', '编辑', 'zh-cn', '2015-06-03 12:06:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:06:46', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0041', 'common.edit_2', 'edit', 'en', '2015-06-03 12:06:26', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:06:50', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0042', 'common.batchDelete', '批量删除', 'zh-cn', '2015-06-03 12:09:29', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:09:52', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0043', 'common.batchDelete', 'Batch Delete', 'en', '2015-06-03 12:09:32', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:09:57', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0044', 'common.search', '查看', 'zh-cn', '2015-06-03 12:12:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:13:15', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0045', 'common.search', 'check', 'en', '2015-06-03 12:13:01', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 12:13:17', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0046', 'common.isId', '主键', 'zh-cn', '2015-06-03 14:29:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:30:06', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0047', 'common.isId', 'ID', 'en', '2015-06-03 14:29:49', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:30:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0048', 'common.createName', '创建人名称', 'zh-cn', '2015-06-03 14:32:21', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:32:41', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0049', 'common.createName', 'createName', 'en', '2015-06-03 14:32:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:32:45', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0050', 'common.create.By', '创建人登录名', 'zh-cn', '2015-06-03 14:35:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:36:23', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0051', 'common.create.By', 'createBy', 'en', '2015-06-03 14:35:47', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:36:27', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0052', 'common.createDate', '创建日期', 'zh-cn', '2015-06-03 14:38:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:38:42', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0053', 'common.createDate', 'createDate', 'en', '2015-06-03 14:38:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:38:45', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0054', 'common.updateName', '更新人名称', 'zh-cn', '2015-06-03 14:41:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:41:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0055', 'common.updateName', 'updateName', 'en', '2015-06-03 14:41:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:41:37', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0056', 'common.updateByName', '更新人登录名称', 'zh-cn', '2015-06-03 14:44:11', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:44:30', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0057', 'common.updateByName', 'updateByName', 'en', '2015-06-03 14:44:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:44:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0058', 'common.updateDate', '更新日期', 'zh-cn', '2015-06-03 14:46:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:46:41', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0059', 'common.updateDate', 'updateDate', 'en', '2015-06-03 14:46:27', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:46:44', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0060', 'common.templateName', '模板名称', 'zh-cn', '2015-06-03 14:49:29', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:49:54', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0061', 'common.templateName', 'templateName', 'en', '2015-06-03 14:49:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:49:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0062', 'common.templateType', '模板类型', 'zh-cn', '2015-06-03 14:51:59', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:52:18', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0063', 'common.templateType', 'templateType', 'en', '2015-06-03 14:52:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:52:21', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0064', 'common.templateContent', '模板内容', 'zh-cn', '2015-06-03 14:54:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:55:00', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0065', 'common.templateContent', 'templateContent', 'en', '2015-06-03 14:54:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:55:04', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0066', 'common.opt', '操作', 'zh-cn', '2015-06-03 14:56:50', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:57:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0067', 'common.opt', 'opt', 'en', '2015-06-03 14:56:55', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 14:57:15', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0068', 'common.deleteTo', '删除', 'zh-cn', '2015-06-03 15:01:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:01:22', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0069', 'common.deleteTo', 'delete', 'en', '2015-06-03 15:01:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:01:25', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0070', 'common.icon.add', '录入', 'zh-cn', '2015-06-03 15:03:55', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:04:15', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0071', 'common.icon.add', 'add', 'en', '2015-06-03 15:03:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:04:18', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0072', 'common.icon.edit', '编辑', 'zh-cn', '2015-06-03 15:06:14', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:06:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0073', 'common.icon.edit', 'edit', 'en', '2015-06-03 15:06:17', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:06:38', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0074', 'common.icon.remove', '批量删除', 'zh-cn', '2015-06-03 15:08:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:08:55', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0075', 'common.icon.remove', 'Batch Delete', 'en', '2015-06-03 15:08:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:08:58', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0076', 'common.icon.search', '查看', 'zh-cn', '2015-06-03 15:10:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:11:07', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0077', 'common.icon.search', 'search', 'en', '2015-06-03 15:10:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:11:10', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0078', 'common.msgTemplateTable', '消息模板表', 'zh-cn', '2015-06-03 15:14:16', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:14:35', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0079', 'common.msgTemplateTable', 'message template table', 'en', '2015-06-03 15:14:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:14:39', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0080', 'common.sqlDataTable', '消息模板_业务SQL配置表', 'zh-cn', '2015-06-03 15:29:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:30:01', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0081', 'common.sqlDataTable', 'message template_sql configuration', 'en', '2015-06-03 15:29:46', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:30:04', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0082', 'common.createLoginName', '创建人登录名称', 'zh-cn', '2015-06-03 15:46:04', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:46:25', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0083', 'common.createLoginName', 'create by name to login', 'en', '2015-06-03 15:46:07', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:46:30', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0084', 'common.configurationCODE', '配置CODE', 'zh-cn', '2015-06-03 15:50:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:50:57', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0085', 'common.configurationCODE', 'configurationCODE', 'en', '2015-06-03 15:50:43', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:51:00', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0086', 'common.configurationName', '配置名称', 'zh-cn', '2015-06-03 15:53:03', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:53:19', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0087', 'common.configurationName', 'configurationName', 'en', '2015-06-03 15:53:06', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:53:22', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0088', 'common.sqlBusinessId', '业务SQLID', 'zh-cn', '2015-06-03 15:56:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:56:59', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0089', 'common.sqlBusinessId', 'ID of SQL business', 'en', '2015-06-03 15:56:40', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 15:57:01', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0090', 'common.msgModeliD', '消息模本ID', 'zh-cn', '2015-06-03 16:01:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:01:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0091', 'common.msgModeliD', 'message model ID ', 'en', '2015-06-03 16:01:23', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:01:52', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0092', 'common.pushTest', '推送测试', 'zh-cn', '2015-06-03 16:04:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:05:13', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0093', 'common.pushTest', 'push test', 'en', '2015-06-03 16:04:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:05:16', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0094', 'common.moblePhone', '手机', 'zh-cn', '2015-06-03 16:24:12', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:24:29', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0095', 'common.moblePhone', 'moble phone', 'en', '2015-06-03 16:24:15', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:24:33', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0096', 'common.age', '年龄', 'zh-cn', '2015-06-03 16:26:36', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:26:54', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0097', 'common.age', 'age', 'en', '2015-06-03 16:26:38', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:26:57', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0098', 'common.email', '电子邮箱', 'zh-cn', '2015-06-03 16:29:02', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:29:19', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0099', 'common.email', 'email', 'en', '2015-06-03 16:29:05', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:29:22', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c488a4d0100', 'common.wage', '工资', 'zh-cn', '2015-06-03 16:34:33', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:34:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0002', 'common.sex', '性别', 'zh-cn', '2015-06-03 16:37:19', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:37:36', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0003', 'common.sex', 'sex', 'en', '2015-06-03 16:37:23', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:37:39', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0004', 'common.birthday', '生日', 'zh-cn', '2015-06-03 16:40:24', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:40:49', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0005', 'common.birthday', 'birthday', 'en', '2015-06-03 16:40:27', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-03 16:40:53', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0022', 'common.sendSuccess', '发送成功', 'zh-cn', '2015-06-05 10:38:37', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:38:53', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0023', 'common.sendSuccess', 'send success', 'en', '2015-06-05 10:38:41', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:38:55', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0024', 'common.failToSend', '发送失败', 'zh-cn', '2015-06-05 10:42:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:42:58', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0025', 'common.failToSend', 'fail to send', 'en', '2015-06-05 10:42:44', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:43:01', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0026', 'common.didNotSend', '未发送', 'zh-cn', '2015-06-05 10:47:58', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:48:18', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0027', 'common.didNotSend', 'Did not send', 'en', '2015-06-05 10:48:00', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:48:20', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0028', 'common.smsAlerts', '短信提醒', 'zh-cn', '2015-06-05 10:51:28', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:51:42', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0029', 'common.smsAlerts', 'SMS alerts', 'en', '2015-06-05 10:51:30', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:51:45', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0030', 'common.emailAlerts', '邮件提醒', 'zh-cn', '2015-06-05 10:58:42', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:58:55', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0031', 'common.emailAlerts', ' Email Alerts', 'en', '2015-06-05 10:58:44', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 10:58:57', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0032', 'common.sysAlerts', '系统提醒', 'zh-cn', '2015-06-05 11:02:54', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 11:03:08', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0033', 'common.sysAlerts', 'SYS alerts', 'en', '2015-06-05 11:02:56', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 11:03:10', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0034', 'common.smsAlertsModel', '短信提醒模板', 'zh-cn', '2015-06-05 11:07:30', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 11:07:43', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0035', 'common.smsAlertsModel', 'SMS alerts model', 'en', '2015-06-05 11:07:31', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 11:07:45', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0036', 'common.emailAlertsModel', '邮件提醒模板', 'zh-cn', '2015-06-05 11:11:57', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 11:12:12', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d0037', 'common.emailAlertsModel', 'Email alerts model', 'en', '2015-06-05 11:12:00', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 11:12:14', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d1111', 'common.lock.user.tips', '确定锁定用户吗', 'zh-cn', '2015-06-05 16:56:09', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 16:56:23', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d1112', 'common.lock.user.tips', 'is confirm lock user', 'en', '2015-06-05 16:56:11', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 16:56:26', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d1113', 'common.unlock.user.tips', '确定激活用户吗', 'zh-cn', '2015-06-05 16:59:20', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 16:59:34', 'admin', 'admin');
INSERT INTO `t_s_muti_lang` VALUES ('jglongjba87c37d001487c499a4d1114', 'common.unlock.user.tips', 'Sure to activate user', 'en', '2015-06-05 16:59:22', '8a8ab0b246dc81120146dc8181950052', 'admin', '2015-06-05 16:59:36', 'admin', 'admin');

-- ----------------------------
-- Table structure for `t_s_operation`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_operation`;
CREATE TABLE `t_s_operation` (
  `ID` varchar(32) NOT NULL,
  `operationcode` varchar(50) DEFAULT NULL,
  `operationicon` varchar(100) DEFAULT NULL,
  `operationname` varchar(50) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `functionid` varchar(32) DEFAULT NULL,
  `iconid` varchar(32) DEFAULT NULL,
  `operationtype` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_pceuy41wr2fjbcilyc7mk3m1f` (`functionid`),
  KEY `FK_ny5de7922l39ta2pkhyspd5f` (`iconid`),
  CONSTRAINT `t_s_operation_ibfk_1` FOREIGN KEY (`iconid`) REFERENCES `t_s_icon` (`ID`),
  CONSTRAINT `t_s_operation_ibfk_2` FOREIGN KEY (`functionid`) REFERENCES `t_s_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_operation
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `ID` varchar(32) NOT NULL,
  `rolecode` varchar(10) DEFAULT NULL,
  `rolename` varchar(100) NOT NULL,
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_role
-- ----------------------------
INSERT INTO `t_s_role` VALUES ('8a8ab0b246dc81120146dc8181870050', 'admin', '管理员', null, null, null, null, null, null);
INSERT INTO `t_s_role` VALUES ('8a8ab0b246dc81120146dc81818b0051', 'manager', '普通用户', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_s_role_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_function`;
CREATE TABLE `t_s_role_function` (
  `ID` varchar(32) NOT NULL,
  `operation` varchar(10000) DEFAULT NULL,
  `functionid` varchar(32) DEFAULT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  `datarule` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_fvsillj2cxyk5thnuu625urab` (`functionid`),
  KEY `FK_9dww3p4w8jwvlrgwhpitsbfif` (`roleid`),
  CONSTRAINT `t_s_role_function_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `t_s_role` (`ID`),
  CONSTRAINT `t_s_role_function_ibfk_2` FOREIGN KEY (`functionid`) REFERENCES `t_s_function` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_role_function
-- ----------------------------
INSERT INTO `t_s_role_function` VALUES ('402881c746de1ea60146de20b9d60003', '', '402881c746de1ea60146de207d770001', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82db525eefbb01525ef174270003', null, '8a8a82db525edf4c01525eee68b4000b', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82db525eefbb01525ef662e2000a', null, '8a8a82db525eefbb01525ef6107e0008', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82db5268c087015268c86fde0003', null, '8a8a82db5268a6e2015268bb50970002', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82db5268d2fb015268d3d8070001', null, '8a8a82db5268c087015268d1be270006', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82e0527c11ab01527c12a67f0001', null, '8a8a82e0527c0cc601527c1102f20008', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82e0527c11ab01527c12a6810002', null, '8a8a82e0527c0cc601527c0f93050004', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82e0527c11ab01527c12a6810003', null, '8a8a82e0527c0cc601527c104ab40006', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82e05287713b0152877396d70005', null, '8a8a82e05287713b015287728e340001', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82f95244db41015244deca740006', null, '8a8a82f95244db41015244de200d0003', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a82f95244db41015244deca8c0007', null, '8a8a82f95244ca5b015244ce1dd10001', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c525edc5901525edf38c40003', null, '8a8a892c525edc5901525ededcf40001', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c525f144301525f15617f0001', null, '8a8a892c525edc5901525f133a890007', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c5263a889015263b632d8000d', null, '8a8a892c5263a889015263b4e0410007', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c5263a889015263b632fb000e', null, '8a8a892c5263a889015263b3a8440003', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c5263a889015263b632fb000f', null, '8a8a892c5263a889015263b2cfeb0001', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c5263a889015263b632fb0010', null, '8a8a892c5263a889015263b56d3b0009', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8a892c5263a889015263b632fb0011', null, '8a8a892c5263a889015263b426ed0005', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc818275007e', '', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc818279007f', '', '8a8ab0b246dc81120146dc8180d2001a', '8a8ab0b246dc81120146dc81818b0051', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182920084', '', '8a8ab0b246dc81120146dc8180d9001d', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182980086', '', '8a8ab0b246dc81120146dc8180df001f', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc81829b0087', '', '8a8ab0b246dc81120146dc8180df001f', '8a8ab0b246dc81120146dc81818b0051', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc81829e0088', '', '8a8ab0b246dc81120146dc8180e30021', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182a5008a', '', '8a8ab0b246dc81120146dc8180e70023', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182aa008c', '', '8a8ab0b246dc81120146dc8180ee0025', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182b0008e', '', '8a8ab0b246dc81120146dc8180f30027', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182b40090', '', '8a8ab0b246dc81120146dc8180f60028', '8a8ab0b246dc81120146dc8181870050', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182b60091', '', '8a8ab0b246dc81120146dc8180f60028', '8a8ab0b246dc81120146dc81818b0051', null);
INSERT INTO `t_s_role_function` VALUES ('8a8ab0b246dc81120146dc8182c9009c', '', '8a8ab0b246dc81120146dc81811d0032', '8a8ab0b246dc81120146dc8181870050', null);

-- ----------------------------
-- Table structure for `t_s_role_org`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_org`;
CREATE TABLE `t_s_role_org` (
  `ID` varchar(32) NOT NULL,
  `org_id` varchar(32) DEFAULT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_role_org
-- ----------------------------

-- ----------------------------
-- Table structure for `t_s_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_user`;
CREATE TABLE `t_s_role_user` (
  `ID` varchar(32) NOT NULL,
  `roleid` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_n2ucxeorvpjy7qhnmuem01kbx` (`roleid`),
  KEY `FK_d4qb5xld2pfb0bkjx9iwtolda` (`userid`),
  CONSTRAINT `t_s_role_user_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `t_s_user` (`id`),
  CONSTRAINT `t_s_role_user_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `t_s_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_role_user
-- ----------------------------
INSERT INTO `t_s_role_user` VALUES ('402885e950faffb60150fb00a0530002', '8a8ab0b246dc81120146dc8181870050', '8a8ab0b246dc81120146dc8181950052');
INSERT INTO `t_s_role_user` VALUES ('8a8a82db525cce4701525cd483c50010', '8a8ab0b246dc81120146dc8181870050', '8a8a82db525cce4701525ccf91100001');
INSERT INTO `t_s_role_user` VALUES ('8a8a83e9510e73d801510ed292d70038', '8a8ab0b246dc81120146dc81818b0051', '8a8a83e9510e73d801510ed292790036');

-- ----------------------------
-- Table structure for `t_s_territory`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_territory`;
CREATE TABLE `t_s_territory` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(10) NOT NULL,
  `territorylevel` smallint(6) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city_sort` varchar(3) NOT NULL,
  `city_parentid` int(10) DEFAULT NULL,
  `online_flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_territory
-- ----------------------------
INSERT INTO `t_s_territory` VALUES ('1', '100', '1', '全国', null, '0', '0', null);
INSERT INTO `t_s_territory` VALUES ('3273', '110000', '0', '北京市', '110000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3274', '110100', '0', '北京市', '110000', '', '3273', null);
INSERT INTO `t_s_territory` VALUES ('3293', '120000', '0', '天津市', '120000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3294', '120100', '0', '天津市', '120000', '', '3293', null);
INSERT INTO `t_s_territory` VALUES ('3313', '130000', '0', '河北省', '130000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3314', '130100', '0', '石家庄市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3338', '130200', '0', '唐山市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3353', '130300', '0', '秦皇岛市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3361', '130400', '0', '邯郸市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3381', '130500', '0', '邢台市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3401', '130600', '0', '保定市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3427', '130700', '0', '张家口市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3441', '130800', '0', '承德市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3453', '130900', '0', '沧州市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3470', '131000', '0', '廊坊市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3481', '131100', '0', '衡水市', '130000', '', '3313', null);
INSERT INTO `t_s_territory` VALUES ('3493', '140000', '0', '山西省', '140000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3494', '140100', '0', '太原市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3505', '140200', '0', '大同市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3517', '140300', '0', '阳泉市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3523', '140400', '0', '长治市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3537', '140500', '0', '晋城市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3544', '140600', '0', '朔州市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3551', '140700', '0', '晋中市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3563', '140800', '0', '运城市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3577', '140900', '0', '忻州市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3592', '141000', '0', '临汾市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3610', '141100', '0', '吕梁市', '140000', '', '3493', null);
INSERT INTO `t_s_territory` VALUES ('3624', '150000', '0', '内蒙古自治区', '150000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3625', '150100', '0', '呼和浩特市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3635', '150200', '0', '包头市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3645', '150300', '0', '乌海市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3649', '150400', '0', '赤峰市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3662', '150500', '0', '通辽市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3671', '150600', '0', '鄂尔多斯市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3680', '150700', '0', '呼伦贝尔市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3694', '150800', '0', '巴彦淖尔市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3702', '150900', '0', '乌兰察布市', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3714', '152200', '0', '兴安盟  ', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3721', '152500', '0', '锡林郭勒盟', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3734', '152900', '0', '阿拉善盟  ', '150000', '', '3624', null);
INSERT INTO `t_s_territory` VALUES ('3738', '210000', '0', '辽宁省', '210000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3739', '210100', '0', '沈阳市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3753', '210200', '0', '大连市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3764', '210300', '0', '鞍山市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3772', '210400', '0', '抚顺市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3780', '210500', '0', '本溪市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3787', '210600', '0', '丹东市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3794', '210700', '0', '锦州市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3802', '210800', '0', '营口市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3809', '210900', '0', '阜新市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3817', '211000', '0', '辽阳市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3825', '211100', '0', '盘锦市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3830', '211200', '0', '铁岭市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3838', '211300', '0', '朝阳市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3846', '211400', '0', '葫芦岛市', '210000', '', '3738', null);
INSERT INTO `t_s_territory` VALUES ('3853', '220000', '0', '吉林省', '220000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3854', '220100', '0', '长春市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3865', '220200', '0', '吉林市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3875', '220300', '0', '四平市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3882', '220400', '0', '辽源市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3887', '220500', '0', '通化市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3895', '220600', '0', '白山市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3902', '220700', '0', '松原市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3908', '220800', '0', '白城市', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3914', '222400', '0', '延边朝鲜族自治州', '220000', '', '3853', null);
INSERT INTO `t_s_territory` VALUES ('3923', '230000', '0', '黑龙江省', '230000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('3924', '230100', '0', '哈尔滨市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('3943', '230200', '0', '齐齐哈尔市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('3960', '230300', '0', '鸡西市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('3970', '230400', '0', '鹤岗市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('3979', '230500', '0', '双鸭山市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('3988', '230600', '0', '大庆市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('3998', '230700', '0', '伊春市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4016', '230800', '0', '佳木斯市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4027', '230900', '0', '七台河市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4032', '231000', '0', '牡丹江市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4043', '231100', '0', '黑河市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4050', '231200', '0', '绥化市', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4061', '232700', '0', '大兴安岭地区', '230000', '', '3923', null);
INSERT INTO `t_s_territory` VALUES ('4069', '310000', '0', '上海市', '310000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4070', '310100', '0', '上海市', '310000', '', '4069', null);
INSERT INTO `t_s_territory` VALUES ('4090', '320000', '0', '江苏省', '320000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4091', '320100', '0', '南京市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4105', '320200', '0', '无锡市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4114', '320300', '0', '徐州市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4126', '320400', '0', '常州市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4134', '320500', '0', '苏州市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4146', '320600', '0', '南通市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4155', '320700', '0', '连云港市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4163', '320800', '0', '淮安市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4172', '320900', '0', '盐城市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4182', '321000', '0', '扬州市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4190', '321100', '0', '镇江市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4197', '321200', '0', '泰州市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4204', '321300', '0', '宿迁市', '320000', '', '4090', null);
INSERT INTO `t_s_territory` VALUES ('4210', '330000', '0', '浙江省', '330000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4211', '330100', '0', '杭州市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4225', '330200', '0', '宁波市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4237', '330300', '0', '温州市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4249', '330400', '0', '嘉兴市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4257', '330500', '0', '湖州市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4263', '330600', '0', '绍兴市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4270', '330700', '0', '金华市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4280', '330800', '0', '衢州市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4287', '330900', '0', '舟山市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4292', '331000', '0', '台州市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4302', '331100', '0', '丽水市', '330000', '', '4210', null);
INSERT INTO `t_s_territory` VALUES ('4312', '340000', '0', '安徽省', '340000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4313', '340100', '0', '合肥市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4321', '340200', '0', '芜湖市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4329', '340300', '0', '蚌埠市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4337', '340400', '0', '淮南市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4344', '340500', '0', '马鞍山市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4349', '340600', '0', '淮北市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4354', '340700', '0', '铜陵市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4359', '340800', '0', '安庆市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4371', '341000', '0', '黄山市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4379', '341100', '0', '滁州市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4388', '341200', '0', '阜阳市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4397', '341300', '0', '宿州市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4403', '341400', '0', '巢湖市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4409', '341500', '0', '六安市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4417', '341600', '0', '亳州市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4422', '341700', '0', '池州市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4427', '341800', '0', '宣城市', '340000', '', '4312', null);
INSERT INTO `t_s_territory` VALUES ('4435', '350000', '0', '福建省', '350000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4436', '350100', '0', '福州市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4450', '350200', '0', '厦门市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4457', '350300', '0', '莆田市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4463', '350400', '0', '三明市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4476', '350500', '0', '泉州市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4489', '350600', '0', '漳州市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4501', '350700', '0', '南平市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4512', '350800', '0', '龙岩市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4520', '350900', '0', '宁德市', '350000', '', '4435', null);
INSERT INTO `t_s_territory` VALUES ('4530', '360000', '0', '江西省', '360000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4531', '360100', '0', '南昌市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4541', '360200', '0', '景德镇市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4546', '360300', '0', '萍乡市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4552', '360400', '0', '九江市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4565', '360500', '0', '新余市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4568', '360600', '0', '鹰潭市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4572', '360700', '0', '赣州市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4591', '360800', '0', '吉安市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4605', '360900', '0', '宜春市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4616', '361000', '0', '抚州市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4628', '361100', '0', '上饶市', '360000', '', '4530', null);
INSERT INTO `t_s_territory` VALUES ('4641', '370000', '0', '山东省', '370000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4642', '370100', '0', '济南市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4653', '370200', '0', '青岛市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4666', '370300', '0', '淄博市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4675', '370400', '0', '枣庄市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4682', '370500', '0', '东营市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4688', '370600', '0', '烟台市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4701', '370700', '0', '潍坊市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4714', '370800', '0', '济宁市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4727', '370900', '0', '泰安市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4734', '371000', '0', '威海市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4739', '371100', '0', '日照市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4744', '371200', '0', '莱芜市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4747', '371300', '0', '临沂市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4760', '371400', '0', '德州市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4772', '371500', '0', '聊城市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4781', '371600', '0', '滨州市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4789', '371700', '0', '菏泽市', '370000', '', '4641', null);
INSERT INTO `t_s_territory` VALUES ('4799', '410000', '0', '河南省', '410000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4800', '410100', '0', '郑州市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4813', '410200', '0', '开封市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4824', '410300', '0', '洛阳市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4840', '410400', '0', '平顶山市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4851', '410500', '0', '安阳市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4861', '410600', '0', '鹤壁市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4867', '410700', '0', '新乡市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4880', '410800', '0', '焦作市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4891', '410900', '0', '濮阳市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4898', '411000', '0', '许昌市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4905', '411100', '0', '漯河市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4911', '411200', '0', '三门峡市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4918', '411300', '0', '南阳市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4932', '411400', '0', '商丘市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4941', '411500', '0', '信阳市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4952', '411600', '0', '周口市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4963', '411700', '0', '驻马店市', '410000', '', '4799', null);
INSERT INTO `t_s_territory` VALUES ('4976', '420000', '0', '湖北省', '420000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('4977', '420100', '0', '武汉市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('4991', '420200', '0', '黄石市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('4998', '420300', '0', '十堰市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5007', '420500', '0', '宜昌市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5021', '420600', '0', '襄阳市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5031', '420700', '0', '鄂州市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5035', '420800', '0', '荆门市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5041', '420900', '0', '孝感市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5049', '421000', '0', '荆州市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5058', '421100', '0', '黄冈市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5069', '421200', '0', '咸宁市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5076', '421300', '0', '随州市', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5079', '422800', '0', '恩施土家族苗族自治州', '420000', '', '4976', null);
INSERT INTO `t_s_territory` VALUES ('5093', '430000', '0', '湖南省', '430000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5094', '430100', '0', '长沙市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5104', '430200', '0', '株洲市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5114', '430300', '0', '湘潭市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5120', '430400', '0', '衡阳市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5133', '430500', '0', '邵阳市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5146', '430600', '0', '岳阳市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5156', '430700', '0', '常德市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5166', '430800', '0', '张家界市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5171', '430900', '0', '益阳市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5178', '431000', '0', '郴州市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5190', '431100', '0', '永州市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5202', '431200', '0', '怀化市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5215', '431300', '0', '娄底市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5221', '433100', '0', '吉首市', '430000', '', '5093', null);
INSERT INTO `t_s_territory` VALUES ('5230', '440000', '0', '广东省', '440000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5231', '440100', '0', '广州市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5244', '440200', '0', '韶关市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5255', '440300', '0', '深圳市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5262', '440400', '0', '珠海市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5266', '440500', '0', '汕头市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5274', '440600', '0', '佛山市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5280', '440700', '0', '江门市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5288', '440800', '0', '湛江市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5298', '440900', '0', '茂名市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5305', '441200', '0', '肇庆市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5314', '441300', '0', '惠州市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5320', '441400', '0', '梅州市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5329', '441500', '0', '汕尾市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5334', '441600', '0', '河源市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5341', '441700', '0', '阳江市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5346', '441800', '0', '清远市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5355', '441900', '0', '东莞市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5388', '442000', '0', '中山市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5390', '445100', '0', '潮州市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5394', '445200', '0', '揭阳市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5400', '445300', '0', '云浮市', '440000', '', '5230', null);
INSERT INTO `t_s_territory` VALUES ('5406', '450000', '0', '广西自治区', '450000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5407', '450100', '0', '南宁市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5420', '450200', '0', '柳州市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5431', '450300', '0', '桂林市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5449', '450400', '0', '梧州市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5457', '450500', '0', '北海市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5462', '450600', '0', '防城港市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5467', '450700', '0', '钦州市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5472', '450800', '0', '贵港市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5478', '450900', '0', '玉林市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5485', '451000', '0', '百色市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5498', '451100', '0', '贺州市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5503', '451200', '0', '河池市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5515', '451300', '0', '来宾市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5522', '451400', '0', '崇左市', '450000', '', '5406', null);
INSERT INTO `t_s_territory` VALUES ('5530', '460000', '0', '海南省', '460000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5531', '460100', '0', '海口市', '460000', '', '5530', null);
INSERT INTO `t_s_territory` VALUES ('5536', '460200', '0', '三亚市', '460000', '', '5530', null);
INSERT INTO `t_s_territory` VALUES ('5557', '500000', '0', '重庆市', '500000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5558', '500100', '0', '重庆市', '500000', '', '5557', null);
INSERT INTO `t_s_territory` VALUES ('5559', '500101', '0', '万州区', '500000', '', '5557', '');
INSERT INTO `t_s_territory` VALUES ('5560', '500102', '0', '涪陵市', '500000', '', '5557', '');
INSERT INTO `t_s_territory` VALUES ('5572', '500114', '0', '黔江区', '500000', '', '5557', '');
INSERT INTO `t_s_territory` VALUES ('5599', '510000', '0', '四川省', '510000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5600', '510100', '0', '成都市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5620', '510300', '0', '自贡市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5627', '510400', '0', '攀枝花市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5633', '510500', '0', '泸州市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5641', '510600', '0', '德阳市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5648', '510700', '0', '绵阳市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5658', '510800', '0', '广元市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5666', '510900', '0', '遂宁市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5672', '511000', '0', '内江市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5678', '511100', '0', '乐山市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5690', '511300', '0', '南充市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5700', '511400', '0', '眉山市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5707', '511500', '0', '宜宾市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5718', '511600', '0', '广安市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5724', '511700', '0', '达州市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5732', '511800', '0', '雅安市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5741', '511900', '0', '巴中市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5746', '512000', '0', '资阳市', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5751', '513200', '0', '阿坝藏族羌族自治州', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5765', '513300', '0', '甘孜藏族自治州', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5784', '513400', '0', '凉山彝族自治州', '510000', '', '5599', null);
INSERT INTO `t_s_territory` VALUES ('5802', '520000', '0', '贵州省', '520000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5803', '520100', '0', '贵阳市', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5814', '520200', '0', '六盘水市', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5819', '520300', '0', '遵义市', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5834', '520400', '0', '安顺市', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5841', '522200', '0', '铜仁地区', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5842', '522201', '0', '铜仁市', '520000', '', '5802', '');
INSERT INTO `t_s_territory` VALUES ('5852', '522300', '0', '黔西南布依族苗族自治州', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5861', '522400', '0', '毕节市', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5870', '522600', '0', '黔东南苗族侗族自治州', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5887', '522700', '0', '黔南州', '520000', '', '5802', null);
INSERT INTO `t_s_territory` VALUES ('5900', '530000', '0', '云南省', '530000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('5901', '530100', '0', '昆明市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5916', '530300', '0', '曲靖市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5926', '530400', '0', '玉溪市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5936', '530500', '0', '保山市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5942', '530600', '0', '昭通市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5954', '530700', '0', '丽江市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5960', '530800', '0', '普洱市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5971', '530900', '0', '临沧市', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5980', '532300', '0', '楚雄彝族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('5991', '532500', '0', '红河哈尼族彝族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6005', '532600', '0', '文山壮族苗族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6014', '532800', '0', '西双版纳傣族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6018', '532900', '0', '大理白族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6031', '533100', '0', '德宏傣族景颇族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6037', '533300', '0', '怒江傈僳族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6042', '533400', '0', '迪庆藏族自治州', '530000', '', '5900', null);
INSERT INTO `t_s_territory` VALUES ('6046', '540000', '0', '西藏自治区', '540000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('6047', '540100', '0', '拉萨市', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6056', '542100', '0', '昌都地区', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6068', '542200', '0', '山南地区', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6081', '542300', '0', '日喀则地区', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6100', '542400', '0', '那曲地区', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6111', '542500', '0', '阿里地区', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6119', '542600', '0', '林芝地区', '540000', '', '6046', null);
INSERT INTO `t_s_territory` VALUES ('6127', '610000', '0', '陕西省', '610000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('6128', '610100', '0', '西安市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6142', '610200', '0', '铜川市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6147', '610300', '0', '宝鸡市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6160', '610400', '0', '咸阳市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6175', '610500', '0', '渭南市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6187', '610600', '0', '延安市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6201', '610700', '0', '汉中市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6213', '610800', '0', '榆林市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6226', '610900', '0', '安康市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6237', '611000', '0', '商洛市', '610000', '', '6127', null);
INSERT INTO `t_s_territory` VALUES ('6245', '620000', '0', '甘肃省', '620000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('6246', '620100', '0', '兰州市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6255', '620200', '0', '嘉峪关市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6256', '620300', '0', '金昌市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6259', '620400', '0', '白银市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6265', '620500', '0', '天水市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6273', '620600', '0', '武威市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6278', '620700', '0', '张掖市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6285', '620800', '0', '平凉市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6293', '620900', '0', '酒泉市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6301', '621000', '0', '庆阳市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6310', '621100', '0', '定西市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6318', '621200', '0', '陇南市', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6328', '622900', '0', '临夏回族自治州', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6337', '623000', '0', '甘南藏族自治州', '620000', '', '6245', null);
INSERT INTO `t_s_territory` VALUES ('6346', '630000', '0', '青海省', '630000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('6347', '630100', '0', '西宁市', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6355', '632100', '0', '海东地区', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6362', '632200', '0', '海北藏族自治州', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6367', '632300', '0', '黄南藏族自治州', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6372', '632500', '0', '海南藏族自治州', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6378', '632600', '0', '果洛藏族自治州', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6385', '632700', '0', '玉树藏族自治州', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6392', '632800', '0', '海西蒙古族藏族自治州', '630000', '', '6346', null);
INSERT INTO `t_s_territory` VALUES ('6398', '640000', '0', '宁夏自治区', '640000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('6399', '640100', '0', '银川市', '640000', '', '6398', null);
INSERT INTO `t_s_territory` VALUES ('6406', '640200', '0', '石嘴山市', '640000', '', '6398', null);
INSERT INTO `t_s_territory` VALUES ('6410', '640300', '0', '吴忠市', '640000', '', '6398', null);
INSERT INTO `t_s_territory` VALUES ('6415', '640400', '0', '固原市', '640000', '', '6398', null);
INSERT INTO `t_s_territory` VALUES ('6421', '640500', '0', '中卫市', '640000', '', '6398', null);
INSERT INTO `t_s_territory` VALUES ('6425', '650000', '0', '新疆自治区', '650000', '', '1', null);
INSERT INTO `t_s_territory` VALUES ('6426', '650100', '0', '乌鲁木齐市', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6435', '650200', '0', '克拉玛依市', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6440', '652100', '0', '吐鲁番地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6444', '652200', '0', '哈密地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6448', '652300', '0', '昌吉回族自治州', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6456', '652700', '0', '博尔塔拉蒙古自治州', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6460', '652800', '0', '巴音郭楞蒙古自治州', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6470', '652900', '0', '阿克苏地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6480', '653000', '0', '克孜勒苏柯尔克孜自治州', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6485', '653100', '0', '喀什地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6498', '653200', '0', '和田地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6507', '654000', '0', '伊犁哈萨克自治州', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6518', '654200', '0', '塔城地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6526', '654300', '0', '阿勒泰地区', '650000', '', '6425', null);
INSERT INTO `t_s_territory` VALUES ('6535', '659001', '0', '石河子市', '650000', '', '6425', '');
INSERT INTO `t_s_territory` VALUES ('6536', '659002', '0', '阿拉尔市', '650000', '', '6425', '');
INSERT INTO `t_s_territory` VALUES ('6537', '659003', '0', '图木舒克市', '650000', '', '6425', '');

-- ----------------------------
-- Table structure for `t_s_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_type`;
CREATE TABLE `t_s_type` (
  `ID` varchar(32) NOT NULL,
  `typecode` varchar(50) DEFAULT NULL,
  `typename` varchar(100) DEFAULT NULL,
  `typename_full` varchar(200) DEFAULT NULL,
  `typestatus` varchar(10) DEFAULT NULL,
  `typepid` varchar(32) DEFAULT NULL,
  `typegroupid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_nw2b22gy7plh7pqows186odmq` (`typepid`),
  KEY `FK_3q40mr4ebtd0cvx79matl39x1` (`typegroupid`),
  CONSTRAINT `t_s_type_ibfk_1` FOREIGN KEY (`typegroupid`) REFERENCES `t_s_typegroup` (`ID`),
  CONSTRAINT `t_s_type_ibfk_2` FOREIGN KEY (`typepid`) REFERENCES `t_s_type` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_type
-- ----------------------------
INSERT INTO `t_s_type` VALUES ('297e201047e95ee30147e9baab5c000b', '1', 'common.company', null, null, null, '297e201047e95ee30147e9ba56ce0009');
INSERT INTO `t_s_type` VALUES ('297e201047e95ee30147e9baef97000d', '2', 'common.department', null, null, null, '297e201047e95ee30147e9ba56ce0009');
INSERT INTO `t_s_type` VALUES ('297e201047e95ee30147e9bb1210000f', '3', 'common.position', null, null, null, '297e201047e95ee30147e9ba56ce0009');
INSERT INTO `t_s_type` VALUES ('2c90ac564c9d1734014c9db1e025002d', 'Y', '是', null, null, null, '2c90ac564c9d1734014c9db1a167002b');
INSERT INTO `t_s_type` VALUES ('2c90ac564c9d1734014c9db20b0d002f', 'N', '否', null, null, null, '2c90ac564c9d1734014c9db1a167002b');
INSERT INTO `t_s_type` VALUES ('402880884883eff4014884180bf80029', '1', '蔷薇七村', null, null, null, '402880884883eff401488415cbb60027');
INSERT INTO `t_s_type` VALUES ('402880cd4dbd4baa014dbd9c184f0003', 'WXTP', '图片', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('402881e64ca6fd1b014ca7052d930006', 'spline', '曲线图', null, null, null, '402881e64ca6fd1b014ca7044c370004');
INSERT INTO `t_s_type` VALUES ('402881e64ca6fd1b014ca705b2b40008', 'column', '柱状图', null, null, null, '402881e64ca6fd1b014ca7044c370004');
INSERT INTO `t_s_type` VALUES ('402881e64ca6fd1b014ca7061fb7000a', 'pie', '饼图', null, null, null, '402881e64ca6fd1b014ca7044c370004');
INSERT INTO `t_s_type` VALUES ('402881e946e71f5f0146e736c4e80008', 'en', 'common.english', null, null, null, '402881e946e71f5f0146e73619bb0002');
INSERT INTO `t_s_type` VALUES ('402881e946e71f5f0146e740dcad0012', 'zh-cn', 'common.chinese', null, null, null, '402881e946e71f5f0146e73619bb0002');
INSERT INTO `t_s_type` VALUES ('72cfaa46bb6911e5b03c448a5bc5ec97', 'CCB', '建设银行', '中国建设银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72cfaea4bb6911e5b03c448a5bc5ec97', 'ABC', '农业银行', '中国农业银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d257dfbb6911e5b03c448a5bc5ec97', 'ICBC', '工商银行', '中国工商银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25907bb6911e5b03c448a5bc5ec97', 'CMBC', '民生银行', '中国民生银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25974bb6911e5b03c448a5bc5ec97', 'CMB', '招商银行', '招商银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d259e0bb6911e5b03c448a5bc5ec97', 'BOC', '中国银行', '中国银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25a3bbb6911e5b03c448a5bc5ec97', 'COMM', '交通银行', '交通银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25a91bb6911e5b03c448a5bc5ec97', 'CEB', '中国光大银行', '中国光大银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25ae3bb6911e5b03c448a5bc5ec97', 'CIB', '兴业银行', '兴业银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25b33bb6911e5b03c448a5bc5ec97', 'CITIC', '中信银行', '中信银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25b80bb6911e5b03c448a5bc5ec97', 'CQRCB', '重庆农村商业银行', '重庆农村商业银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25d04bb6911e5b03c448a5bc5ec97', 'POST', '中国邮政储蓄银行', '中国邮政储蓄银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25d5cbb6911e5b03c448a5bc5ec97', 'SPDB', '浦发银行', '上海浦东发展银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25dacbb6911e5b03c448a5bc5ec97', 'UNION', '中国银联', '中国银联', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25e05bb6911e5b03c448a5bc5ec97', 'CQCB', '重庆银行', '重庆银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25e60bb6911e5b03c448a5bc5ec97', 'GDB', '广发银行', '广发银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25eadbb6911e5b03c448a5bc5ec97', 'SDB', '深圳发展银行', '深圳发展银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25efabb6911e5b03c448a5bc5ec97', 'HXB', '华夏银行', '华夏银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25f44bb6911e5b03c448a5bc5ec97', 'CQTGB', '重庆三峡银行', '重庆三峡银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25f8ebb6911e5b03c448a5bc5ec97', 'PBA', '平安银行', '平安银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d25fd5bb6911e5b03c448a5bc5ec97', 'BOS', '上海银行', '上海银行', '1', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d2601fbb6911e5b03c448a5bc5ec97', 'TCCB', '天津银行', '天津银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d2606cbb6911e5b03c448a5bc5ec97', 'NBCB', '宁波银行', '宁波银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d260b4bb6911e5b03c448a5bc5ec97', 'NJCB', '南京银行', '南京银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('72d260febb6911e5b03c448a5bc5ec97', 'BOBJ', '北京银行', '北京银行', '0', null, 'BACK_DICK');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a3859a2c1001a', '1', 'common.smsAlertsModel', null, null, null, '8a71b40e4a38319b014a3858fca40018');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385a01d1001c', '2', 'common.emailAlertsModel', null, null, null, '8a71b40e4a38319b014a3858fca40018');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385d30300020', '1', 'common.smsAlerts', null, null, null, '8a71b40e4a38319b014a385cb115001e');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385d86c30022', '2', 'common.emailAlerts', null, null, null, '8a71b40e4a38319b014a385cb115001e');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385dc1370024', '3', 'common.sysAlerts', null, null, null, '8a71b40e4a38319b014a385cb115001e');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a3860603f0028', '1', 'common.didNotSend', null, null, null, '8a71b40e4a38319b014a386022bd0026');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a38608d98002a', '2', 'common.sendSuccess', null, null, null, '8a71b40e4a38319b014a386022bd0026');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a3860b181002c', '3', 'common.failToSend', null, null, null, '8a71b40e4a38319b014a386022bd0026');
INSERT INTO `t_s_type` VALUES ('8a8a82e0527d5b7a01527d5f0b850002', '1', '有效', null, null, null, '297e201047e95ee30147e9ba56ce0121');
INSERT INTO `t_s_type` VALUES ('8a8a82e0527d5b7a01527d5f28d40004', '0', '无效', null, null, null, '297e201047e95ee30147e9ba56ce0121');
INSERT INTO `t_s_type` VALUES ('8a8a82e0527d5fc401527d67ca320005', 'string', '字符串', null, null, null, '297e201047e95ee30147e9ba56ce1229');
INSERT INTO `t_s_type` VALUES ('8a8a82e0527d5fc401527d67f6100007', 'int', '整形', null, null, null, '297e201047e95ee30147e9ba56ce1229');
INSERT INTO `t_s_type` VALUES ('8a8a82e0527d5fc401527d6826210009', 'float', '浮点数', null, null, null, '297e201047e95ee30147e9ba56ce1229');
INSERT INTO `t_s_type` VALUES ('8a8a82e0527d5fc401527d6847b1000b', 'inParam', '节点入参', null, null, null, '297e201047e95ee30147e9ba56ce1229');
INSERT INTO `t_s_type` VALUES ('8a8a82e0528651010152867e3e400003', 'date', '日期', null, null, null, '297e201047e95ee30147e9ba56ce1229');
INSERT INTO `t_s_type` VALUES ('8a8a82e05286cd22015286e06e7b0002', 'outParam', '节点出参', null, null, null, '297e201047e95ee30147e9ba56ce1229');
INSERT INTO `t_s_type` VALUES ('8a8a82e05286cd22015286fe74e6000b', '0', '草稿', null, null, null, '297e201047e95ee30147e93123424449');
INSERT INTO `t_s_type` VALUES ('8a8a82e05286cd22015286fe9b05000d', '1', '启用', null, null, null, '297e201047e95ee30147e93123424449');
INSERT INTO `t_s_type` VALUES ('8a8a82e05286cd22015286feccc4000f', '-1', '停用', null, null, null, '297e201047e95ee30147e93123424449');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181f30060', '2', 'menu.icon', null, null, null, '8a8ab0b246dc81120146dc8181aa0056');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181f70061', '1', 'system.icon', null, null, null, '8a8ab0b246dc81120146dc8181aa0056');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181fa0062', 'files', 'common.attachment', null, null, null, '8a8ab0b246dc81120146dc8181ca005e');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181fe0063', '1', 'lang.excellent.order', null, null, null, '8a8ab0b246dc81120146dc8181b10057');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182010064', '2', 'lang.normal.order', null, null, null, '8a8ab0b246dc81120146dc8181b10057');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182050065', '1', 'lang.contract.customer', null, null, null, '8a8ab0b246dc81120146dc8181b50058');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182080066', '2', 'lang.normal.customer', null, null, null, '8a8ab0b246dc81120146dc8181b50058');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81820b0067', '1', 'lang.special.servcie', null, null, null, '8a8ab0b246dc81120146dc8181b90059');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182100068', '2', 'lang.normal.service', null, null, null, '8a8ab0b246dc81120146dc8181b90059');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182130069', 'single', 'common.single.condition.query', null, null, null, '8a8ab0b246dc81120146dc8181bc005a');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818216006a', 'group', 'common.scope.query', null, null, null, '8a8ab0b246dc81120146dc8181bc005a');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81821a006b', 'Y', 'common.yes', null, null, null, '8a8ab0b246dc81120146dc8181c0005b');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81821d006c', 'N', 'common.no', null, null, null, '8a8ab0b246dc81120146dc8181c0005b');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818221006d', 'Integer', 'common.db.integer', null, null, null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818224006e', 'Date', 'common.db.date', null, null, null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818227006f', 'String', 'common.db.string', null, null, null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81822b0070', 'Long', 'common.db.long', null, null, null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81822f0071', 'act', 'common.workflow.engine.table', null, null, null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182320072', 't_s', 'common.system.table', null, null, null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182350073', 't_b', 'common.business.table', null, null, null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182390074', 't_p', 'common.customer.engine.table', null, null, null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81823c0075', 'news', 'common.news', null, null, null, '8a8ab0b246dc81120146dc8181ca005e');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182400076', '0', 'common.male', null, null, null, '8a8ab0b246dc81120146dc8181cd005f');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182430077', '1', 'common.female', null, null, null, '8a8ab0b246dc81120146dc8181cd005f');
INSERT INTO `t_s_type` VALUES ('8a8ab0ba487c527201487c7863ec001b', 'oracle', 'common.oracle', null, null, null, '8a8ab0ba487c527201487c7732790019');
INSERT INTO `t_s_type` VALUES ('8a8ab0ba487c527201487c78aefc001d', 'sqlserver2008', 'common.sqlserver2008', null, null, null, '8a8ab0ba487c527201487c7732790019');
INSERT INTO `t_s_type` VALUES ('8a8ab0ba487c527201487c78fbb5001f', 'mysql', 'common.mysql', null, null, null, '8a8ab0ba487c527201487c7732790019');
INSERT INTO `t_s_type` VALUES ('a9eb3caebb6711e5b03c448a5bc5ec97', 'Y', '有效', null, null, null, 'SYS_VALID_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb3f21bb6711e5b03c448a5bc5ec97', 'N', '无效', null, null, null, 'SYS_VALID_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb3fccbb6711e5b03c448a5bc5ec97', '1', '投标中', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4060bb6711e5b03c448a5bc5ec97', '2', '满标', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb40e6bb6711e5b03c448a5bc5ec97', '3', '还款中', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4178bb6711e5b03c448a5bc5ec97', '4', '已还清', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb41edbb6711e5b03c448a5bc5ec97', '1', '已还', null, null, null, 'COLLECTION_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb425fbb6711e5b03c448a5bc5ec97', '2', '未还', null, null, null, 'COLLECTION_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb42d1bb6711e5b03c448a5bc5ec97', '3', '逾期已还', null, null, null, 'COLLECTION_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb434ebb6711e5b03c448a5bc5ec97', '4', '逾期未还', null, null, null, 'COLLECTION_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb43c3bb6711e5b03c448a5bc5ec97', 'P', '个人', null, null, null, 'USER_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb4452bb6711e5b03c448a5bc5ec97', 'B', '企业', null, null, null, 'USER_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb44c4bb6711e5b03c448a5bc5ec97', '0', '初始状态', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb453ebb6711e5b03c448a5bc5ec97', '1', '未通过', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb45b6bb6711e5b03c448a5bc5ec97', '0', '初始状态', null, null, null, 'USER_PHONE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb461fbb6711e5b03c448a5bc5ec97', '1', '已认证', null, null, null, 'USER_PHONE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb468cbb6711e5b03c448a5bc5ec97', '0', '初始状态', null, null, null, 'USER_EMAIL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb46fbbb6711e5b03c448a5bc5ec97', '1', '已认证', null, null, null, 'USER_EMAIL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb476abb6711e5b03c448a5bc5ec97', '1', '手机', null, null, null, 'SEND_MSG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb47d4bb6711e5b03c448a5bc5ec97', '2', '邮件', null, null, null, 'SEND_MSG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb4843bb6711e5b03c448a5bc5ec97', '1', '发送成功', null, null, null, 'SEND_MSG_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb48b2bb6711e5b03c448a5bc5ec97', '0', '发送失败', null, null, null, 'SEND_MSG_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4924bb6711e5b03c448a5bc5ec97', '0', '正常', null, null, null, 'USER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4993bb6711e5b03c448a5bc5ec97', '1', '冻结', null, null, null, 'USER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4a08bb6711e5b03c448a5bc5ec97', '0', '初始状态', null, null, null, 'USER_YZZ_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4a83bb6711e5b03c448a5bc5ec97', '1', '已认证', null, null, null, 'USER_YZZ_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4b3cbb6711e5b03c448a5bc5ec97', 'F', '女', null, null, null, 'USER_SEX');
INSERT INTO `t_s_type` VALUES ('a9eb4baebb6711e5b03c448a5bc5ec97', 'M', '男', null, null, null, 'USER_SEX');
INSERT INTO `t_s_type` VALUES ('a9eb4c1dbb6711e5b03c448a5bc5ec97', '0', '待发布', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4c92bb6711e5b03c448a5bc5ec97', '-1', '发标待审核', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4d0dbb6711e5b03c448a5bc5ec97', '0', '初始状态', null, null, null, 'ACCOUNT_BANK_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4d7fbb6711e5b03c448a5bc5ec97', '1', '绑定状态', null, null, null, 'ACCOUNT_BANK_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4df1bb6711e5b03c448a5bc5ec97', '2', '未绑定', null, null, null, 'ACCOUNT_BANK_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb4e63bb6711e5b03c448a5bc5ec97', '1', '身份证', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb4ecfbb6711e5b03c448a5bc5ec97', '2', '军官证', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb4f3ebb6711e5b03c448a5bc5ec97', '3', '护照', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb4fb0bb6711e5b03c448a5bc5ec97', '4', '台胞证', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb5028bb6711e5b03c448a5bc5ec97', '5', '警官证', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb50a0bb6711e5b03c448a5bc5ec97', '6', '士兵证', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb5109bb6711e5b03c448a5bc5ec97', '7', '回乡证', null, null, null, 'USER_CARD_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb5173bb6711e5b03c448a5bc5ec97', 'Y', '是', null, null, null, 'TENDER_AUTO_REPUR');
INSERT INTO `t_s_type` VALUES ('a9eb51e2bb6711e5b03c448a5bc5ec97', '1', '显示', null, null, null, 'SITE_ARTICLE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5254bb6711e5b03c448a5bc5ec97', '2', '隐藏', null, null, null, 'SITE_ARTICLE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb52c0bb6711e5b03c448a5bc5ec97', 'N', '否', null, null, null, 'TENDER_AUTO_REPUR');
INSERT INTO `t_s_type` VALUES ('a9eb5330bb6711e5b03c448a5bc5ec97', '1', '启用', null, null, null, 'BANNER_PIC_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5396bb6711e5b03c448a5bc5ec97', '2', '不启用', null, null, null, 'BANNER_PIC_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5408bb6711e5b03c448a5bc5ec97', '0', '充值失败', null, null, null, 'ACCOUNT_RECHARGE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5483bb6711e5b03c448a5bc5ec97', '1', '充值成功', null, null, null, 'ACCOUNT_RECHARGE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb54fdbb6711e5b03c448a5bc5ec97', '0', '提现失败', null, null, null, 'ACCOUNT_CASH_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5570bb6711e5b03c448a5bc5ec97', '1', '提现成功', null, null, null, 'ACCOUNT_CASH_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb55e4bb6711e5b03c448a5bc5ec97', '1', '待还', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb564ebb6711e5b03c448a5bc5ec97', '2', '已还', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb56bdbb6711e5b03c448a5bc5ec97', '3', '逾期', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb572fbb6711e5b03c448a5bc5ec97', '4', '逾期已还', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb57bebb6711e5b03c448a5bc5ec97', '8', '满标审核未通过', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5844bb6711e5b03c448a5bc5ec97', '9', '流标', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb58bbbb6711e5b03c448a5bc5ec97', '0', '未审核', null, null, null, 'VERIFY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5928bb6711e5b03c448a5bc5ec97', '1', '审核通过', null, null, null, 'VERIFY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5997bb6711e5b03c448a5bc5ec97', '2', '审核未通过', null, null, null, 'VERIFY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5a06bb6711e5b03c448a5bc5ec97', 'NEWS', '新闻公告', null, null, null, 'SITE_LOCATION');
INSERT INTO `t_s_type` VALUES ('a9eb5a75bb6711e5b03c448a5bc5ec97', 'MEDIA', '媒体公告', null, null, null, 'SITE_LOCATION');
INSERT INTO `t_s_type` VALUES ('a9eb5ae7bb6711e5b03c448a5bc5ec97', '-1', '充值初始状态', null, null, null, 'ACCOUNT_RECHARGE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5b79bb6711e5b03c448a5bc5ec97', '-1', '提现初始状态', null, null, null, 'ACCOUNT_CASH_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5bf6bb6711e5b03c448a5bc5ec97', '5', '放款处理中', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb5c74bb6711e5b03c448a5bc5ec97', '1', '借款费率', null, null, null, 'BORROW_CONFIG_APR_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb5ce9bb6711e5b03c448a5bc5ec97', '2', '投资费率', null, null, null, 'BORROW_CONFIG_APR_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb5d5bbb6711e5b03c448a5bc5ec97', '2', '金额', null, null, null, 'BORROW_CONFIG_RULE');
INSERT INTO `t_s_type` VALUES ('a9eb5dd2bb6711e5b03c448a5bc5ec97', '1', '比例', null, null, null, 'BORROW_CONFIG_RULE');
INSERT INTO `t_s_type` VALUES ('a9eb5e44bb6711e5b03c448a5bc5ec97', 'Y', '是', null, null, null, 'BORROW_CONFIG_IS_PERIOD');
INSERT INTO `t_s_type` VALUES ('a9eb5eb6bb6711e5b03c448a5bc5ec97', 'N', '否', null, null, null, 'BORROW_CONFIG_IS_PERIOD');
INSERT INTO `t_s_type` VALUES ('a9eb5f2bbb6711e5b03c448a5bc5ec97', '1001', '充值入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb5f9abb6711e5b03c448a5bc5ec97', '1002', '充值手续费扣减', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb600abb6711e5b03c448a5bc5ec97', '2001', '提现', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb6081bb6711e5b03c448a5bc5ec97', '2002', '提现手续费扣减', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb60f6bb6711e5b03c448a5bc5ec97', '3001', '投资资金冻结', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb6165bb6711e5b03c448a5bc5ec97', '3002', '流标资金解冻', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb61ccbb6711e5b03c448a5bc5ec97', '4001', '投资资金解冻', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb6236bb6711e5b03c448a5bc5ec97', '4002', '投资资金划拨', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb62b9bb6711e5b03c448a5bc5ec97', '4003', '借款资金入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb6325bb6711e5b03c448a5bc5ec97', '4004', '平台服务费', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb63b1bb6711e5b03c448a5bc5ec97', '2', '证件过期', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6b24bb6711e5b03c448a5bc5ec97', '3', '身份证快速认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6bc4bb6711e5b03c448a5bc5ec97', '4', '个人普通认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6c4fbb6711e5b03c448a5bc5ec97', '5', '个人增强认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6ccdbb6711e5b03c448a5bc5ec97', '6', '个人非大陆担保认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6d53bb6711e5b03c448a5bc5ec97', '7', '普通企业认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6dbfbb6711e5b03c448a5bc5ec97', '8', '个体工商户认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6e2cbb6711e5b03c448a5bc5ec97', '9', '境外企业认证', null, null, null, 'USER_REAL_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6e92bb6711e5b03c448a5bc5ec97', '0', '初始状态', null, null, null, 'YJF_INTERACTIVE_RECORD_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6f10bb6711e5b03c448a5bc5ec97', '1', '处理成功', null, null, null, 'YJF_INTERACTIVE_RECORD_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6f85bb6711e5b03c448a5bc5ec97', '2', '处理失败', null, null, null, 'YJF_INTERACTIVE_RECORD_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb6fffbb6711e5b03c448a5bc5ec97', '1', '投标中', null, null, null, 'BORROW_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7077bb6711e5b03c448a5bc5ec97', '2', '还款中', null, null, null, 'BORROW_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb70f7bb6711e5b03c448a5bc5ec97', '3', '已完成', null, null, null, 'BORROW_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb718bbb6711e5b03c448a5bc5ec97', 'Y', '线上收费', null, null, null, 'BORROW_CONFIG_ONLINE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9eb73a6bb6711e5b03c448a5bc5ec97', 'N', '线下收费', null, null, null, 'BORROW_CONFIG_ONLINE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9eb73fcbb6711e5b03c448a5bc5ec97', '4', '流标', null, null, null, 'BORROW_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb744cbb6711e5b03c448a5bc5ec97', '0', '未签约', null, null, null, 'USER_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb748dbb6711e5b03c448a5bc5ec97', '1', '已签约', null, null, null, 'USER_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb74d2bb6711e5b03c448a5bc5ec97', '0', '未签约', null, null, null, 'USER_REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7513bb6711e5b03c448a5bc5ec97', '1', '已签约', null, null, null, 'USER_REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb755abb6711e5b03c448a5bc5ec97', '0', '未签约', null, null, null, 'USER_WITHHOLD_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb759fbb6711e5b03c448a5bc5ec97', '1', '已签约', null, null, null, 'USER_WITHHOLD_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb75e6bb6711e5b03c448a5bc5ec97', '6', '还款处理中', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb762dbb6711e5b03c448a5bc5ec97', '7', '垫付处理中', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7675bb6711e5b03c448a5bc5ec97', '4005', '账户管理费', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb76bfbb6711e5b03c448a5bc5ec97', '4006', '财务审核费', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7706bb6711e5b03c448a5bc5ec97', '4007', '信审费', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb774bbb6711e5b03c448a5bc5ec97', '5001', '本金归还', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7792bb6711e5b03c448a5bc5ec97', '5002', '利息归还', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb77d9bb6711e5b03c448a5bc5ec97', '5003', '逾期罚息', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb781bbb6711e5b03c448a5bc5ec97', '5004', '逾期管理费', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7859bb6711e5b03c448a5bc5ec97', '5005', '本金回收', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7895bb6711e5b03c448a5bc5ec97', '5006', '利息回收', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb78d4bb6711e5b03c448a5bc5ec97', '5007', '利息管理费扣除', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7913bb6711e5b03c448a5bc5ec97', '6001', '本金垫付', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7951bb6711e5b03c448a5bc5ec97', '6002', '利息垫付', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7990bb6711e5b03c448a5bc5ec97', '6', '流标处理中', null, null, null, 'BORROW_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb79ddbb6711e5b03c448a5bc5ec97', 'C', '平台', null, null, null, 'USER_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7a24bb6711e5b03c448a5bc5ec97', '0101', '普通借款借款人三方合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9eb7a69bb6711e5b03c448a5bc5ec97', '0102', '普通借款投资人三方合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9eb7aadbb6711e5b03c448a5bc5ec97', '0', '草稿', null, null, null, 'ACCOUNT_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7af4bb6711e5b03c448a5bc5ec97', '1', '审核中', null, null, null, 'ACCOUNT_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7b3fbb6711e5b03c448a5bc5ec97', '2', '审核通过', null, null, null, 'ACCOUNT_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7b86bb6711e5b03c448a5bc5ec97', '3', '审核不通过', null, null, null, 'ACCOUNT_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7bd0bb6711e5b03c448a5bc5ec97', '0', '审核不通过', null, null, null, 'AUDITOPTION_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7c12bb6711e5b03c448a5bc5ec97', '1', '审核通过', null, null, null, 'AUDITOPTION_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7c53bb6711e5b03c448a5bc5ec97', '7001', '平台转账商户划拨', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7c9dbb6711e5b03c448a5bc5ec97', '7002', '平台转账商户入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7ce7bb6711e5b03c448a5bc5ec97', '4', '转账处理中', null, null, null, 'ACCOUNT_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7d32bb6711e5b03c448a5bc5ec97', '8001', '平台易极付对账平台金额增加', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7d7fbb6711e5b03c448a5bc5ec97', '8002', '平台易极付对账平台金额减少', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7dcebb6711e5b03c448a5bc5ec97', '8003', '新老系统对账平台金额增加', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7e21bb6711e5b03c448a5bc5ec97', '8004', '新老系统对账平台金额减少', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb7e6bbb6711e5b03c448a5bc5ec97', 'Y', '已垫付', null, null, null, 'ADVANCE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9eb7eb2bb6711e5b03c448a5bc5ec97', 'N', '未垫付', null, null, null, 'ADVANCE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9eb7ef7bb6711e5b03c448a5bc5ec97', '8', '逾期还款处理中', null, null, null, 'REPAYMENT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb7f41bb6711e5b03c448a5bc5ec97', '1', '自动流标', null, null, null, 'BORROW_LOSE_STATE');
INSERT INTO `t_s_type` VALUES ('a9eb7f85bb6711e5b03c448a5bc5ec97', '2', '手动流标', null, null, null, 'BORROW_LOSE_STATE');
INSERT INTO `t_s_type` VALUES ('a9eb7fcdbb6711e5b03c448a5bc5ec97', '1', '线上还款', null, null, null, 'BORROW_REPAYMENT_STYLE');
INSERT INTO `t_s_type` VALUES ('a9eb8011bb6711e5b03c448a5bc5ec97', '2', '线下还款', null, null, null, 'BORROW_REPAYMENT_STYLE');
INSERT INTO `t_s_type` VALUES ('a9eb8058bb6711e5b03c448a5bc5ec97', '0', '自动执行', null, null, null, 'JOB_LOG_EXECUTE_STYLE');
INSERT INTO `t_s_type` VALUES ('a9eb809dbb6711e5b03c448a5bc5ec97', '1', '手动执行', null, null, null, 'JOB_LOG_EXECUTE_STYLE');
INSERT INTO `t_s_type` VALUES ('a9eb80e1bb6711e5b03c448a5bc5ec97', '0', '不允许手动执行', null, null, null, 'JOB_SCHEDULE_IS_ALLOW_MANUAL');
INSERT INTO `t_s_type` VALUES ('a9eb8126bb6711e5b03c448a5bc5ec97', '1', '允许手动执行', null, null, null, 'JOB_SCHEDULE_IS_ALLOW_MANUAL');
INSERT INTO `t_s_type` VALUES ('a9eb816dbb6711e5b03c448a5bc5ec97', 'FK', '放款通知', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb81b4bb6711e5b03c448a5bc5ec97', 'HK', '回款通知', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb81f9bb6711e5b03c448a5bc5ec97', 'TF', '用户转账给平台通知', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8240bb6711e5b03c448a5bc5ec97', 'CZ', '充值提醒', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8281bb6711e5b03c448a5bc5ec97', 'YQ', '逾期提醒', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb82c3bb6711e5b03c448a5bc5ec97', 'LB', '流标提醒', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb82ffbb6711e5b03c448a5bc5ec97', '1', '手机短信', null, null, null, 'TASK_OP_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8343bb6711e5b03c448a5bc5ec97', '2', '邮箱', null, null, null, 'TASK_OP_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8388bb6711e5b03c448a5bc5ec97', '0', '未执行', null, null, null, 'TASK_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb83ccbb6711e5b03c448a5bc5ec97', '1', '执行成功', null, null, null, 'TASK_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb840ebb6711e5b03c448a5bc5ec97', '2', '执行失败', null, null, null, 'TASK_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb8455bb6711e5b03c448a5bc5ec97', '1', '一级栏目', null, null, null, 'SITE_RANK');
INSERT INTO `t_s_type` VALUES ('a9eb8499bb6711e5b03c448a5bc5ec97', '2', '二级栏目', null, null, null, 'SITE_RANK');
INSERT INTO `t_s_type` VALUES ('a9eb84dbbb6711e5b03c448a5bc5ec97', '1', '文章', null, null, null, 'SITE_STYLE');
INSERT INTO `t_s_type` VALUES ('a9eb851dbb6711e5b03c448a5bc5ec97', '0', '列表', null, null, null, 'SITE_STYLE');
INSERT INTO `t_s_type` VALUES ('a9eb8561bb6711e5b03c448a5bc5ec97', '1', '启用', null, null, null, 'BANNER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb85a5bb6711e5b03c448a5bc5ec97', '2', '停用', null, null, null, 'BANNER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9eb85eabb6711e5b03c448a5bc5ec97', '1', '身份证明', null, null, null, 'BID_MATERIAL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb862ebb6711e5b03c448a5bc5ec97', '2', '企业证照', null, null, null, 'BID_MATERIAL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8670bb6711e5b03c448a5bc5ec97', '3', '实地照片', null, null, null, 'BID_MATERIAL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb86b7bb6711e5b03c448a5bc5ec97', '2003', '提现资金冻结', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8704bb6711e5b03c448a5bc5ec97', '2004', '提现资金解冻', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9eb8751bb6711e5b03c448a5bc5ec97', 'Y', '是', null, null, null, 'MY_BORROW_FAMILY_KNOW');
INSERT INTO `t_s_type` VALUES ('a9eb8795bb6711e5b03c448a5bc5ec97', 'N', '否', null, null, null, 'MY_BORROW_FAMILY_KNOW');
INSERT INTO `t_s_type` VALUES ('a9eb87dabb6711e5b03c448a5bc5ec97', '1', '良好', null, null, null, 'MY_BORROW_HEALTH_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee741dbb6711e5b03c448a5bc5ec97', '2', '优秀', null, null, null, 'MY_BORROW_HEALTH_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee74dcbb6711e5b03c448a5bc5ec97', '1', '未婚', null, null, null, 'MY_BORROW_MARRIAGE_STATE');
INSERT INTO `t_s_type` VALUES ('a9ee753abb6711e5b03c448a5bc5ec97', '2', '已婚', null, null, null, 'MY_BORROW_MARRIAGE_STATE');
INSERT INTO `t_s_type` VALUES ('a9ee758dbb6711e5b03c448a5bc5ec97', '3', '离异', null, null, null, 'MY_BORROW_MARRIAGE_STATE');
INSERT INTO `t_s_type` VALUES ('a9ee75dfbb6711e5b03c448a5bc5ec97', '4', '丧偶', null, null, null, 'MY_BORROW_MARRIAGE_STATE');
INSERT INTO `t_s_type` VALUES ('a9ee7621bb6711e5b03c448a5bc5ec97', '1', '自有住房（无按揭）', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee7674bb6711e5b03c448a5bc5ec97', '2', '贷款购房', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee76bebb6711e5b03c448a5bc5ec97', '3', '自建房', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee7708bb6711e5b03c448a5bc5ec97', '4', '租用', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee7752bb6711e5b03c448a5bc5ec97', '5', '与亲属合住', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee779fbb6711e5b03c448a5bc5ec97', '6', '集体宿舍', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9ee77e3bb6711e5b03c448a5bc5ec97', '7', '其他', null, null, null, 'MY_BORROW_HOUSE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0dd51bb6711e5b03c448a5bc5ec97', '1', '父母', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0de3ebb6711e5b03c448a5bc5ec97', '2', '配偶', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0de96bb6711e5b03c448a5bc5ec97', '3', '子女', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0def4bb6711e5b03c448a5bc5ec97', '4', '朋友', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0df44bb6711e5b03c448a5bc5ec97', '5', '同事', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0df94bb6711e5b03c448a5bc5ec97', '6', '独居', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0dfd9bb6711e5b03c448a5bc5ec97', '7', '其他', null, null, null, 'MY_BORROW_FAMILY_LIVE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f0e195bb6711e5b03c448a5bc5ec97', '1', '硕士及以上', null, null, null, 'MY_BORROW_EDUCATION');
INSERT INTO `t_s_type` VALUES ('a9f0e1f3bb6711e5b03c448a5bc5ec97', '2', '本科', null, null, null, 'MY_BORROW_EDUCATION');
INSERT INTO `t_s_type` VALUES ('a9f0e243bb6711e5b03c448a5bc5ec97', '3', '专科', null, null, null, 'MY_BORROW_EDUCATION');
INSERT INTO `t_s_type` VALUES ('a9f0e2aabb6711e5b03c448a5bc5ec97', '4', '高中及以下', null, null, null, 'MY_BORROW_EDUCATION');
INSERT INTO `t_s_type` VALUES ('a9f0e2fdbb6711e5b03c448a5bc5ec97', '1', '父母', null, null, null, 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP');
INSERT INTO `t_s_type` VALUES ('a9f0e347bb6711e5b03c448a5bc5ec97', '2', '配偶', null, null, null, 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP');
INSERT INTO `t_s_type` VALUES ('a9f0e38bbb6711e5b03c448a5bc5ec97', '3', '子女', null, null, null, 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP');
INSERT INTO `t_s_type` VALUES ('a9f0e3d5bb6711e5b03c448a5bc5ec97', '4', '朋友', null, null, null, 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP');
INSERT INTO `t_s_type` VALUES ('a9f0e41fbb6711e5b03c448a5bc5ec97', '5', '同事', null, null, null, 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP');
INSERT INTO `t_s_type` VALUES ('a9f0e46fbb6711e5b03c448a5bc5ec97', '6', '其他', null, null, null, 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP');
INSERT INTO `t_s_type` VALUES ('a9f0e4b4bb6711e5b03c448a5bc5ec97', '1', '申请中', null, null, null, 'MY_BORROW_APPLY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e4fbbb6711e5b03c448a5bc5ec97', '2', '审核中', null, null, null, 'MY_BORROW_APPLY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e542bb6711e5b03c448a5bc5ec97', '3', '审核通过', null, null, null, 'MY_BORROW_APPLY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e58cbb6711e5b03c448a5bc5ec97', '4', '审核不通过', null, null, null, 'MY_BORROW_APPLY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e5d6bb6711e5b03c448a5bc5ec97', 'Y', '有', null, null, null, 'MY_BORROW_IS_PROCREATE');
INSERT INTO `t_s_type` VALUES ('a9f0e61ebb6711e5b03c448a5bc5ec97', 'N', '无', null, null, null, 'MY_BORROW_IS_PROCREATE');
INSERT INTO `t_s_type` VALUES ('a9f0e668bb6711e5b03c448a5bc5ec97', '1', '初审中', null, null, null, 'CASH_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e6acbb6711e5b03c448a5bc5ec97', '2', '初审通过', null, null, null, 'CASH_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e6f1bb6711e5b03c448a5bc5ec97', '3', '初审不通过', null, null, null, 'CASH_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e738bb6711e5b03c448a5bc5ec97', '4', '复审不通过', null, null, null, 'CASH_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f0e77fbb6711e5b03c448a5bc5ec97', '5', '复审通过', null, null, null, 'CASH_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f475adbb6711e5b03c448a5bc5ec97', '1', '初审', null, null, null, 'CASH_AUDIT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4765dbb6711e5b03c448a5bc5ec97', '2', '复审', null, null, null, 'CASH_AUDIT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f476aabb6711e5b03c448a5bc5ec97', '0', '否', null, null, null, 'BANK_DEFAULT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f4785fbb6711e5b03c448a5bc5ec97', '1', '是', null, null, null, 'BANK_DEFAULT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f478b4bb6711e5b03c448a5bc5ec97', '1', '放款计息', null, null, null, 'INTEREST_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47907bb6711e5b03c448a5bc5ec97', '2', '投资计息', null, null, null, 'INTEREST_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4794ebb6711e5b03c448a5bc5ec97', '1', '标准化标的', null, null, null, 'SUBJECT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4799ebb6711e5b03c448a5bc5ec97', '2', 'T加零标的', null, null, null, 'SUBJECT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f479e5bb6711e5b03c448a5bc5ec97', '3', '好友标的', null, null, null, 'SUBJECT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47a40bb6711e5b03c448a5bc5ec97', 'Y', '已发放', null, null, null, 'COUPON_GRANT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47a85bb6711e5b03c448a5bc5ec97', 'N', '未发放', null, null, null, 'COUPON_GRANT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47ad2bb6711e5b03c448a5bc5ec97', '0', '草稿', null, null, null, 'COUPON_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47b19bb6711e5b03c448a5bc5ec97', '1', '审核中', null, null, null, 'COUPON_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47b60bb6711e5b03c448a5bc5ec97', '2', '审核通过', null, null, null, 'COUPON_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47baabb6711e5b03c448a5bc5ec97', '3', '审核不通过', null, null, null, 'COUPON_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47befbb6711e5b03c448a5bc5ec97', '4', '审核处理中', null, null, null, 'COUPON_AUDIT_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47c36bb6711e5b03c448a5bc5ec97', '9101', '投资代金券划拨', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47c80bb6711e5b03c448a5bc5ec97', '0', '未认证', null, null, null, 'LICENCE_CODE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47cc8bb6711e5b03c448a5bc5ec97', '1', '已认证', null, null, null, 'LICENCE_CODE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47d0fbb6711e5b03c448a5bc5ec97', '0', '未认证', null, null, null, 'BUSINESS_CODE_LICENSE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47d53bb6711e5b03c448a5bc5ec97', '1', '已认证', null, null, null, 'BUSINESS_CODE_LICENSE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47d9abb6711e5b03c448a5bc5ec97', '3003', '体验金投资', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47de7bb6711e5b03c448a5bc5ec97', '4009', '体验金利息划拨', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47e37bb6711e5b03c448a5bc5ec97', '4010', '体验金利息入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47e84bb6711e5b03c448a5bc5ec97', '0', '已停用', null, null, null, 'NEWBIG_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47eccbb6711e5b03c448a5bc5ec97', '1', '已启用', null, null, null, 'NEWBIG_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47f10bb6711e5b03c448a5bc5ec97', '1', '已还', null, null, null, 'NEWBIG_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47f57bb6711e5b03c448a5bc5ec97', '2', '未还', null, null, null, 'NEWBIG_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f47f9cbb6711e5b03c448a5bc5ec97', '2', '代金券', null, null, null, 'COUPON_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f47fe6bb6711e5b03c448a5bc5ec97', '3', '加息券', null, null, null, 'COUPON_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4802dbb6711e5b03c448a5bc5ec97', '4', '体验金', null, null, null, 'COUPON_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f48071bb6711e5b03c448a5bc5ec97', '0', '转让待审核', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f480bebb6711e5b03c448a5bc5ec97', '1', '投标中', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f4810ebb6711e5b03c448a5bc5ec97', '2', '满标', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48158bb6711e5b03c448a5bc5ec97', '3', '还款中', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f481a5bb6711e5b03c448a5bc5ec97', '4', '已还清', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f481f2bb6711e5b03c448a5bc5ec97', '5', '放款处理中', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48237bb6711e5b03c448a5bc5ec97', '6', '流标处理中', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48276bb6711e5b03c448a5bc5ec97', '9', '流标', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f482babb6711e5b03c448a5bc5ec97', 'T', '投资', null, null, null, 'COUPON_USE_SCOPE');
INSERT INTO `t_s_type` VALUES ('a9f482fbbb6711e5b03c448a5bc5ec97', 'W', '提现', null, null, null, 'COUPON_USE_SCOPE');
INSERT INTO `t_s_type` VALUES ('a9f48343bb6711e5b03c448a5bc5ec97', '10', '已转让', null, null, null, 'BORROW_TRANSFER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48384bb6711e5b03c448a5bc5ec97', '0', '布衣', null, null, null, 'MEMBER_LEVEL');
INSERT INTO `t_s_type` VALUES ('a9f483c9bb6711e5b03c448a5bc5ec97', '1', '黑铁', null, null, null, 'MEMBER_LEVEL');
INSERT INTO `t_s_type` VALUES ('a9f48410bb6711e5b03c448a5bc5ec97', '2', '青铜', null, null, null, 'MEMBER_LEVEL');
INSERT INTO `t_s_type` VALUES ('a9f48457bb6711e5b03c448a5bc5ec97', '3', '白银', null, null, null, 'MEMBER_LEVEL');
INSERT INTO `t_s_type` VALUES ('a9f484a1bb6711e5b03c448a5bc5ec97', '4', '黄金', null, null, null, 'MEMBER_LEVEL');
INSERT INTO `t_s_type` VALUES ('a9f484e6bb6711e5b03c448a5bc5ec97', '5', '钻石', null, null, null, 'MEMBER_LEVEL');
INSERT INTO `t_s_type` VALUES ('a9f48525bb6711e5b03c448a5bc5ec97', '3', '同意还款', null, null, null, 'NEWBIG_TENDER_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48572bb6711e5b03c448a5bc5ec97', '0201', '普通借款借款人四方合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f485bfbb6711e5b03c448a5bc5ec97', '0202', '普通借款投资人四方合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f48606bb6711e5b03c448a5bc5ec97', '0301', '众星捧月借款人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f48650bb6711e5b03c448a5bc5ec97', '0302', '众星捧月投资人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f4869abb6711e5b03c448a5bc5ec97', '0401', '债权转让借款人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f486eabb6711e5b03c448a5bc5ec97', '0402', '债权转让投资人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f48729bb6711e5b03c448a5bc5ec97', '3', '删除', null, null, null, 'NOTICE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f4876dbb6711e5b03c448a5bc5ec97', '1', '已读', null, null, null, 'NOTICE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f487afbb6711e5b03c448a5bc5ec97', '0', '未读', null, null, null, 'NOTICE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f487f3bb6711e5b03c448a5bc5ec97', 'WX_PTGG', 'WX_平台公告', null, null, null, 'SITE_LOCATION');
INSERT INTO `t_s_type` VALUES ('a9f4883dbb6711e5b03c448a5bc5ec97', 'WX_ZXHD', 'WX_最新活动', null, null, null, 'SITE_LOCATION');
INSERT INTO `t_s_type` VALUES ('a9f48884bb6711e5b03c448a5bc5ec97', '1', '喜乐航', null, null, null, 'COUPON_GRANT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f488cfbb6711e5b03c448a5bc5ec97', '2', '系统', null, null, null, 'COUPON_GRANT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4891cbb6711e5b03c448a5bc5ec97', '1', '身份认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f48966bb6711e5b03c448a5bc5ec97', '2', '房产认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f489a7bb6711e5b03c448a5bc5ec97', '3', '学历认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f489f1bb6711e5b03c448a5bc5ec97', '4', '车产认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f48a33bb6711e5b03c448a5bc5ec97', '5', '信用认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f48a7abb6711e5b03c448a5bc5ec97', '6', '收入认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f48ab9bb6711e5b03c448a5bc5ec97', '0', '未认证', null, null, null, 'AUTHORITY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48afdbb6711e5b03c448a5bc5ec97', '1', '已认证', null, null, null, 'AUTHORITY_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f48b42bb6711e5b03c448a5bc5ec97', '1001', '充值入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48b94bb6711e5b03c448a5bc5ec97', '1002', '充值手续费扣减', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48bdfbb6711e5b03c448a5bc5ec97', '2001', '提现', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48c2ebb6711e5b03c448a5bc5ec97', '2002', '提现手续费扣减', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48c7bbb6711e5b03c448a5bc5ec97', '3001', '投资资金冻结', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48ccebb6711e5b03c448a5bc5ec97', '3002', '流标资金解冻', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48d10bb6711e5b03c448a5bc5ec97', '4001', '投资资金解冻', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48d54bb6711e5b03c448a5bc5ec97', '4003', '借款资金入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48d96bb6711e5b03c448a5bc5ec97', '5001', '本金归还', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48dd7bb6711e5b03c448a5bc5ec97', '5002', '利息归还', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48e27bb6711e5b03c448a5bc5ec97', '5003', '逾期罚息', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48e69bb6711e5b03c448a5bc5ec97', '5005', '本金回收', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48eaabb6711e5b03c448a5bc5ec97', '5006', '利息回收', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48eecbb6711e5b03c448a5bc5ec97', '6001', '本金垫付', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48f2abb6711e5b03c448a5bc5ec97', '6002', '利息垫付', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48f69bb6711e5b03c448a5bc5ec97', '9101', '投资代金券划拨', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48faebb6711e5b03c448a5bc5ec97', '3003', '体验金投资', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f48fefbb6711e5b03c448a5bc5ec97', '4009', '体验金利息划拨', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f49034bb6711e5b03c448a5bc5ec97', '4010', '体验金利息入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f49075bb6711e5b03c448a5bc5ec97', '1', '热', null, null, null, 'BORROW_HEAT');
INSERT INTO `t_s_type` VALUES ('a9f490bfbb6711e5b03c448a5bc5ec97', '2', '荐', null, null, null, 'BORROW_HEAT');
INSERT INTO `t_s_type` VALUES ('a9f49109bb6711e5b03c448a5bc5ec97', '7', '工作认证', null, null, null, 'AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f49154bb6711e5b03c448a5bc5ec97', '1', '企业证件认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4919bbb6711e5b03c448a5bc5ec97', '2', '法人身份认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f491e2bb6711e5b03c448a5bc5ec97', '3', '经营地址认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4922cbb6711e5b03c448a5bc5ec97', '4', '实地征信认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f49276bb6711e5b03c448a5bc5ec97', '5', '信用状况认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f492bebb6711e5b03c448a5bc5ec97', '6', '担保机构认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f492ffbb6711e5b03c448a5bc5ec97', '7', '抵质押物认证', null, null, null, 'BUSINESS_AUTHORITY_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f49341bb6711e5b03c448a5bc5ec97', '4002', '投资资金划拨', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f49393bb6711e5b03c448a5bc5ec97', '2003', '提现资金冻结', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f493efbb6711e5b03c448a5bc5ec97', '2004', '提现资金解冻', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f4943fbb6711e5b03c448a5bc5ec97', '7002', '平台转账商户入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f4948ebb6711e5b03c448a5bc5ec97', 'ACTIVITY', '最新活动', null, null, null, 'SITE_LOCATION');
INSERT INTO `t_s_type` VALUES ('a9f494e1bb6711e5b03c448a5bc5ec97', '01', '金牛座借款合同（三方）', null, null, null, 'CONTRACT_SORT_QT');
INSERT INTO `t_s_type` VALUES ('a9f49528bb6711e5b03c448a5bc5ec97', '05', '应收账款收益权转让合同', null, null, null, 'CONTRACT_SORT_QT');
INSERT INTO `t_s_type` VALUES ('a9f49575bb6711e5b03c448a5bc5ec97', '0501', '应收账款收益权转让借款人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f495c5bb6711e5b03c448a5bc5ec97', '0502', '应收账款收益权转让投资人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f4960cbb6711e5b03c448a5bc5ec97', '7004', '红包入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f4965cbb6711e5b03c448a5bc5ec97', '4', '双十一', null, null, null, 'SUBJECT_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f496a9bb6711e5b03c448a5bc5ec97', '5009', '逾期利息回收', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f496f9bb6711e5b03c448a5bc5ec97', '5009', '逾期利息回收', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f4974cbb6711e5b03c448a5bc5ec97', '7003', '平台红包出账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f4979cbb6711e5b03c448a5bc5ec97', '7004', '用户红包入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f73128bb6711e5b03c448a5bc5ec97', '9201', '用户代金券变现', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f7352bbb6711e5b03c448a5bc5ec97', '9201', '用户代金券变现', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f73697bb6711e5b03c448a5bc5ec97', '9202', '平台代金券兑现', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f73807bb6711e5b03c448a5bc5ec97', '1', '一等奖', null, null, null, 'LOTTERY_GRADE');
INSERT INTO `t_s_type` VALUES ('a9f73941bb6711e5b03c448a5bc5ec97', '2', '二等奖', null, null, null, 'LOTTERY_GRADE');
INSERT INTO `t_s_type` VALUES ('a9f73a53bb6711e5b03c448a5bc5ec97', '3', '三等奖', null, null, null, 'LOTTERY_GRADE');
INSERT INTO `t_s_type` VALUES ('a9f73b56bb6711e5b03c448a5bc5ec97', '4', '四等奖', null, null, null, 'LOTTERY_GRADE');
INSERT INTO `t_s_type` VALUES ('a9f73c5cbb6711e5b03c448a5bc5ec97', '5', '五等奖', null, null, null, 'LOTTERY_GRADE');
INSERT INTO `t_s_type` VALUES ('a9f73d6ebb6711e5b03c448a5bc5ec97', '6', '六等奖', null, null, null, 'LOTTERY_GRADE');
INSERT INTO `t_s_type` VALUES ('a9f73e58bb6711e5b03c448a5bc5ec97', '11', '单式投注', null, null, null, 'LOTTERY_VOTE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f73f64bb6711e5b03c448a5bc5ec97', '201', '双色球', null, null, null, 'LOTTERY_GAME_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f7406abb6711e5b03c448a5bc5ec97', '1', '投注成功', null, null, null, 'LOTTERY_RETRESUT');
INSERT INTO `t_s_type` VALUES ('a9f74187bb6711e5b03c448a5bc5ec97', '0', '投注失败', null, null, null, 'LOTTERY_RETRESUT');
INSERT INTO `t_s_type` VALUES ('a9f7428bbb6711e5b03c448a5bc5ec97', '2', '未中奖', null, null, null, 'LOTTERY_RETRESUT');
INSERT INTO `t_s_type` VALUES ('a9f74399bb6711e5b03c448a5bc5ec97', '3', '中小奖', null, null, null, 'LOTTERY_RETRESUT');
INSERT INTO `t_s_type` VALUES ('a9f744b1bb6711e5b03c448a5bc5ec97', '4', '中大奖', null, null, null, 'LOTTERY_RETRESUT');
INSERT INTO `t_s_type` VALUES ('a9f745c2bb6711e5b03c448a5bc5ec97', '5', '中小奖，已兑奖', null, null, null, 'LOTTERY_RETRESUT');
INSERT INTO `t_s_type` VALUES ('a9f746b5bb6711e5b03c448a5bc5ec97', '0', '销售', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f747c1bb6711e5b03c448a5bc5ec97', '1', '暂停', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f748c4bb6711e5b03c448a5bc5ec97', '2', '封期', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f749e7bb6711e5b03c448a5bc5ec97', '3', '开奖', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f74b01bb6711e5b03c448a5bc5ec97', '4', '搅奖', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f74c24bb6711e5b03c448a5bc5ec97', '5', '派奖', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f74d22bb6711e5b03c448a5bc5ec97', '6', '兑奖', null, null, null, 'LOTTERY_ISSUE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f74e1dbb6711e5b03c448a5bc5ec97', '0', '未中奖', null, null, null, 'LOTTERY_ISSUE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9f74f23bb6711e5b03c448a5bc5ec97', '1', '已中奖', null, null, null, 'LOTTERY_ISSUE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9f7502fbb6711e5b03c448a5bc5ec97', '2', '已兑奖', null, null, null, 'LOTTERY_ISSUE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9f75146bb6711e5b03c448a5bc5ec97', '0', '全部用户', null, null, null, 'LOTTERY_RULE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f7525bbb6711e5b03c448a5bc5ec97', '1', '渠道用户', null, null, null, 'LOTTERY_RULE_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f75370bb6711e5b03c448a5bc5ec97', '0', '未生效', null, null, null, 'LOTTERY_RULE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f75470bb6711e5b03c448a5bc5ec97', '1', '已生效', null, null, null, 'LOTTERY_RULE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f7556ebb6711e5b03c448a5bc5ec97', '2', '已作废', null, null, null, 'LOTTERY_RULE_STATUS');
INSERT INTO `t_s_type` VALUES ('a9f7567abb6711e5b03c448a5bc5ec97', '7101', '用户彩票投注平台出账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f757a8bb6711e5b03c448a5bc5ec97', '7101', '用户彩票投注平台出账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f758f6bb6711e5b03c448a5bc5ec97', '7102', '用户彩票中奖平台出账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f75a18bb6711e5b03c448a5bc5ec97', '7102', '用户彩票中奖平台出账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f75b49bb6711e5b03c448a5bc5ec97', '7103', '用户彩票中奖入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f75c72bb6711e5b03c448a5bc5ec97', '7103', '用户彩票中奖入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f75da9bb6711e5b03c448a5bc5ec97', '1', '彩票渠道', null, null, null, 'CHANNEL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f75ea9bb6711e5b03c448a5bc5ec97', '2', '短信渠道', null, null, null, 'CHANNEL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f75fbbbb6711e5b03c448a5bc5ec97', '3', '推广渠道', null, null, null, 'CHANNEL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f760c1bb6711e5b03c448a5bc5ec97', '9', '其它渠道', null, null, null, 'CHANNEL_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f761c5bb6711e5b03c448a5bc5ec97', '4011', '转让标承接人红包入账', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f76301bb6711e5b03c448a5bc5ec97', '4012', '转让转让人红包划拨', null, null, null, 'ACCOUNT_LOG_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f7642dbb6711e5b03c448a5bc5ec97', '4011', '转让标承接人红包入账', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f7654fbb6711e5b03c448a5bc5ec97', '4012', '转让转让人红包划拨', null, null, null, 'ACCOUNT_LOG_TYPE_QT');
INSERT INTO `t_s_type` VALUES ('a9f7667ebb6711e5b03c448a5bc5ec97', '0', '未使用', null, null, null, 'COUPON_USE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9f767babb6711e5b03c448a5bc5ec97', '1', '已使用', null, null, null, 'COUPON_USE_FLAG');
INSERT INTO `t_s_type` VALUES ('a9f768ccbb6711e5b03c448a5bc5ec97', 'ZC', '注册通知', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f769e3bb6711e5b03c448a5bc5ec97', 'HKTX', '还款提前提醒', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f76b7ebb6711e5b03c448a5bc5ec97', 'DETX', '大额提现提醒', null, null, null, 'TASK_TYPE');
INSERT INTO `t_s_type` VALUES ('a9f76d10bb6711e5b03c448a5bc5ec97', '0.001', '应收账款转让及回购逾期利率', null, null, null, 'B_06_LATE_APR');
INSERT INTO `t_s_type` VALUES ('a9f76e27bb6711e5b03c448a5bc5ec97', '0.0', '应收账款转让及回购逾期管理费', null, null, null, 'B_06_FORFEIT_APR');
INSERT INTO `t_s_type` VALUES ('a9f76f30bb6711e5b03c448a5bc5ec97', '06', '应收账款转让及回购协议', null, null, null, 'CONTRACT_SORT_QT');
INSERT INTO `t_s_type` VALUES ('a9f7704abb6711e5b03c448a5bc5ec97', '0601', '应收账款转让及回购协议借款人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('a9f77159bb6711e5b03c448a5bc5ec97', '0602', '应收账款转让及回购协议投资人合同', null, null, null, 'CONTRACT_ITEM');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed71f6b40005', '>', '大于', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed72a9dc0007', '>=', '大于等于', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed750e1c0009', '<', '小于', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed753b6f000b', '<=', '小于等于', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed75afe5000d', '=', '等于', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed75ed62000f', 'IN', '包含', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed7638b20011', 'LIKE', '模糊', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed767c240013', '!=', '不等于', null, null, null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('ff90c048bb6411e5b03c448a5bc5ec97', 'C', '财神到', null, null, null, 'PRODUCT_TYPE1');
INSERT INTO `t_s_type` VALUES ('ff90c353bb6411e5b03c448a5bc5ec97', 'Z', '招财宝', null, null, null, 'PRODUCT_TYPE1');
INSERT INTO `t_s_type` VALUES ('ff90c434bb6411e5b03c448a5bc5ec97', 'F', '发财树', null, null, null, 'PRODUCT_TYPE1');
INSERT INTO `t_s_type` VALUES ('ff90c4dcbb6411e5b03c448a5bc5ec97', 'CJ', '经营贷', null, null, null, 'BORROW_TYPE');
INSERT INTO `t_s_type` VALUES ('ff90c57fbb6411e5b03c448a5bc5ec97', 'FJ', '消费贷', null, null, null, 'BORROW_TYPE');
INSERT INTO `t_s_type` VALUES ('ff92b574bb6411e5b03c448a5bc5ec97', 'DC', '票据贷', null, null, null, 'BORROW_TYPE');
INSERT INTO `t_s_type` VALUES ('ff92b647bb6411e5b03c448a5bc5ec97', 'DQHB', '一次性还本付息', null, null, null, 'STYLE_TYPE');
INSERT INTO `t_s_type` VALUES ('ff92b6b7bb6411e5b03c448a5bc5ec97', 'XXHB', '每月付息到期还本', null, null, null, 'STYLE_TYPE');
INSERT INTO `t_s_type` VALUES ('ff92b718bb6411e5b03c448a5bc5ec97', 'DEBX', '等额本息', null, null, null, 'STYLE_TYPE');
INSERT INTO `t_s_type` VALUES ('ff92b787bb6411e5b03c448a5bc5ec97', 'E', '邮件', null, null, null, 'SEND_MESSAGE');
INSERT INTO `t_s_type` VALUES ('ff92b7d7bb6411e5b03c448a5bc5ec97', 'M', '短信', null, null, null, 'SEND_MESSAGE');
INSERT INTO `t_s_type` VALUES ('ff92b826bb6411e5b03c448a5bc5ec97', 'FW', '平台服务费率', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff92b893bb6411e5b03c448a5bc5ec97', 'CW', '财务审核费率', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff92b8e5bb6411e5b03c448a5bc5ec97', 'ZHGL', '账户管理费率', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff92ba30bb6411e5b03c448a5bc5ec97', 'ZX', '咨询费', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff92bb50bb6411e5b03c448a5bc5ec97', 'N', '年化收益', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff92be5dbb6411e5b03c448a5bc5ec97', 'XS', '借款服务费', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff9aa59ebb6411e5b03c448a5bc5ec97', 'LXGL', '利息管理费', null, null, null, 'APR_ITEM');
INSERT INTO `t_s_type` VALUES ('ff9aa7b6bb6411e5b03c448a5bc5ec97', 'CFDBZ', '财富大爆炸', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('ff9ab446bb6411e5b03c448a5bc5ec97', 'SHUI', '水', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('ff9ab6f8bb6411e5b03c448a5bc5ec97', 'FENG', '风', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('ff9ac7a4bb6411e5b03c448a5bc5ec97', 'HUO', '火', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('ff9ac950bb6411e5b03c448a5bc5ec97', 'TU', '土', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('ff9aca95bb6411e5b03c448a5bc5ec97', 'CS', '测试（勿用）', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('ff9acbffbb6411e5b03c448a5bc5ec97', 'TYB', '体验标', null, null, null, 'PRODUCT_TYPE');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000001', 'WXGZYD', '关注引导', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000002', 'WXNRQ', '内容区', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000003', 'WXYWYD', '原文引导', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000004', 'WXBT', '标题', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000005', 'WXFGX', '分隔线', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000006', 'WXHTZH', '互推账号', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000007', 'WXQT', '其他', null, null, null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000008', 'WXWDYS', '我的样式', null, null, null, 'jglongjbtstypegourp2015060400001');

-- ----------------------------
-- Table structure for `t_s_typegroup`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_typegroup`;
CREATE TABLE `t_s_typegroup` (
  `ID` varchar(50) NOT NULL,
  `typegroupcode` varchar(50) DEFAULT NULL,
  `typegroupname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_typegroup
-- ----------------------------
INSERT INTO `t_s_typegroup` VALUES ('297e201047e95ee30147e93123424449', 'c_status', '活动状态');
INSERT INTO `t_s_typegroup` VALUES ('297e201047e95ee30147e9ba56ce0009', 'orgtype', 'common.org.type');
INSERT INTO `t_s_typegroup` VALUES ('297e201047e95ee30147e9ba56ce0121', 'c_aviflag', '节点是否有效');
INSERT INTO `t_s_typegroup` VALUES ('297e201047e95ee30147e9ba56ce1229', 'c_datatype', '数据类型');
INSERT INTO `t_s_typegroup` VALUES ('2c90ac564c9d1734014c9db1a167002b', 'sf_yn', '是否YN');
INSERT INTO `t_s_typegroup` VALUES ('402880884883eff401488415cbb60027', 'smsTplType', '模板类型');
INSERT INTO `t_s_typegroup` VALUES ('402881e64ca6fd1b014ca7044c370004', 'tblx', '图表类型');
INSERT INTO `t_s_typegroup` VALUES ('402881e946e71f5f0146e73619bb0002', 'lang', 'common.mutilang');
INSERT INTO `t_s_typegroup` VALUES ('8a71b40e4a38319b014a3858fca40018', 'msgTplType', '消息模板分类');
INSERT INTO `t_s_typegroup` VALUES ('8a71b40e4a38319b014a385cb115001e', 'msgType', '消息类别');
INSERT INTO `t_s_typegroup` VALUES ('8a71b40e4a38319b014a386022bd0026', 'msgStatus', '消息发送状态');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181aa0056', 'icontype', 'common.icon.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181b10057', 'order', 'lang.order.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181b50058', 'custom', 'lang.customer.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181b90059', 'service', 'lang.service.item.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181bc005a', 'searchmode', 'common.query.module');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181c0005b', 'yesorno', 'common.logic.condition');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181c3005c', 'fieldtype', 'field.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181c6005d', 'database', 'common.data.table');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181ca005e', 'fieltype', 'common.document.category');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181cd005f', 'sex', 'common.sex.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0ba487c527201487c7732790019', 'dbtype', 'common.dbtype');
INSERT INTO `t_s_typegroup` VALUES ('ACCOUNT_BANK_STATUS', 'ACCOUNT_BANK_STATUS', '银行卡状态');
INSERT INTO `t_s_typegroup` VALUES ('ACCOUNT_CASH_STATUS', 'ACCOUNT_CASH_STATUS', '提现状态');
INSERT INTO `t_s_typegroup` VALUES ('ACCOUNT_LOG_TYPE', 'ACCOUNT_LOG_TYPE', '用户资金变动记录日志表dw_account_log的类型type');
INSERT INTO `t_s_typegroup` VALUES ('ACCOUNT_LOG_TYPE_QT', 'ACCOUNT_LOG_TYPE_QT', '前台展示-用户资金变动记录日志表dw_account_log的类型type');
INSERT INTO `t_s_typegroup` VALUES ('ACCOUNT_RECHARGE_STATUS', 'ACCOUNT_RECHARGE_STATUS', '充值状态');
INSERT INTO `t_s_typegroup` VALUES ('ACCOUNT_TRANSFER_STATUS', 'ACCOUNT_TRANSFER_STATUS', '平台转账状态');
INSERT INTO `t_s_typegroup` VALUES ('ADVANCE_FLAG', 'ADVANCE_FLAG', '平台是否垫付');
INSERT INTO `t_s_typegroup` VALUES ('APR_ITEM', 'APR_ITEM', '费率类型(平台服务费率)');
INSERT INTO `t_s_typegroup` VALUES ('AUDITOPTION_STATUS', 'AUDITOPTION_STATUS', '审核状态');
INSERT INTO `t_s_typegroup` VALUES ('AUTHORITY_STATUS', 'AUTHORITY_STATUS', '认证状态');
INSERT INTO `t_s_typegroup` VALUES ('AUTHORITY_TYPE', 'AUTHORITY_TYPE', '用户认证类型');
INSERT INTO `t_s_typegroup` VALUES ('BACK_DICK', 'BACK_DICK', '银行字典');
INSERT INTO `t_s_typegroup` VALUES ('BANK_DEFAULT_STATUS', 'BANK_DEFAULT_STATUS', '银行卡默认状态');
INSERT INTO `t_s_typegroup` VALUES ('BANNER_PIC_STATUS', 'BANNER_PIC_STATUS', '横幅图片启用状态');
INSERT INTO `t_s_typegroup` VALUES ('BANNER_STATUS', 'BANNER_STATUS', 'banner表dw_banner中的status banner状态');
INSERT INTO `t_s_typegroup` VALUES ('BID_MATERIAL_TYPE', 'BID_MATERIAL_TYPE', '标的资料图片dw_bid_material中的type图片类型');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_CONFIG_APR_TYPE', 'BORROW_CONFIG_APR_TYPE', 'dw_borrow_config表中的费率类型');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_CONFIG_IS_PERIOD', 'BORROW_CONFIG_IS_PERIOD', '借款投资费用计算规则表dw_borrow_config表中的是否按期is_period字段');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_CONFIG_ONLINE_FLAG', 'BORROW_CONFIG_ONLINE_FLAG', '费率收费方向（Y：线上收费；N：线下收费）');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_CONFIG_RULE', 'BORROW_CONFIG_RULE', '借款投资费用计算规则表dw_borrow_config表中的信审费用计算规则[rule]');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_HEAT', 'BORROW_HEAT', '标的热度');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_LOSE_STATE', 'BORROW_LOSE_STATE', 'BORROW表流标类型');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_REPAYMENT_STYLE', 'BORROW_REPAYMENT_STYLE', '还款记录表dw_borrow_repayment还款类型');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_STATUS', 'BORROW_STATUS', '借款状态');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_TENDER_STATUS', 'BORROW_TENDER_STATUS', '投标表状态');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_TRANSFER_STATUS', 'BORROW_TRANSFER_STATUS', '转让标的状态');
INSERT INTO `t_s_typegroup` VALUES ('BORROW_TYPE', 'BORROW_TYPE', '借款管理(经营贷)');
INSERT INTO `t_s_typegroup` VALUES ('BUSINESS_AUTHORITY_TYPE', 'BUSINESS_AUTHORITY_TYPE', '企业用户认证类型');
INSERT INTO `t_s_typegroup` VALUES ('BUSINESS_CODE_LICENSE_STATUS', 'BUSINESS_CODE_LICENSE_STATUS', '企业营业执照组织编码认证状态');
INSERT INTO `t_s_typegroup` VALUES ('B_06_FORFEIT_APR', 'B_06_FORFEIT_APR', '逾期利率');
INSERT INTO `t_s_typegroup` VALUES ('B_06_LATE_APR', 'B_06_LATE_APR', '逾期利率');
INSERT INTO `t_s_typegroup` VALUES ('CASH_AUDIT_STATUS', 'CASH_AUDIT_STATUS', '提现审核状态');
INSERT INTO `t_s_typegroup` VALUES ('CASH_AUDIT_TYPE', 'CASH_AUDIT_TYPE', '提现审核类型');
INSERT INTO `t_s_typegroup` VALUES ('CHANNEL_TYPE', 'CHANNEL_TYPE', '渠道类型');
INSERT INTO `t_s_typegroup` VALUES ('COLLECTION_STATUS', 'COLLECTION_STATUS', '回款状态');
INSERT INTO `t_s_typegroup` VALUES ('CONTRACT_ITEM', 'CONTRACT_ITEM', '合同类型');
INSERT INTO `t_s_typegroup` VALUES ('CONTRACT_SORT_QT', 'CONTRACT_SORT_QT', '前台展示-借款合同类型');
INSERT INTO `t_s_typegroup` VALUES ('COUPON_AUDIT_STATUS', 'COUPON_AUDIT_STATUS', '代金券审核状态');
INSERT INTO `t_s_typegroup` VALUES ('COUPON_GRANT_STATUS', 'COUPON_GRANT_STATUS', '代金券发放状态');
INSERT INTO `t_s_typegroup` VALUES ('COUPON_GRANT_TYPE', 'COUPON_GRANT_TYPE', '券发放类型');
INSERT INTO `t_s_typegroup` VALUES ('COUPON_TYPE', 'COUPON_TYPE', '券类型');
INSERT INTO `t_s_typegroup` VALUES ('COUPON_USE_FLAG', 'COUPON_USE_FLAG', '用户券使用标志');
INSERT INTO `t_s_typegroup` VALUES ('COUPON_USE_SCOPE', 'COUPON_USE_SCOPE', '券使用范围');
INSERT INTO `t_s_typegroup` VALUES ('f852d85d47ed64a40147ed70894c0003', 'rulecon', '规则条件');
INSERT INTO `t_s_typegroup` VALUES ('INTEREST_TYPE', 'INTEREST_TYPE', '计息方式');
INSERT INTO `t_s_typegroup` VALUES ('jglongjbtstypegourp2015060400001', 'weixin', '微信模板类型');
INSERT INTO `t_s_typegroup` VALUES ('JOB_LOG_EXECUTE_STYLE', 'JOB_LOG_EXECUTE_STYLE', '任务日志表job_log中执行方式');
INSERT INTO `t_s_typegroup` VALUES ('JOB_SCHEDULE_IS_ALLOW_MANUAL', 'JOB_SCHEDULE_IS_ALLOW_MANUAL', '计划进度表job_schedule中is_allow_manual');
INSERT INTO `t_s_typegroup` VALUES ('LICENCE_CODE_STATUS', 'LICENCE_CODE_STATUS', 'dw_user用户表中企业营业执照和组织机构代码认证状态');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_GAME_TYPE', 'LOTTERY_GAME_TYPE', '彩票玩法');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_GRADE', 'LOTTERY_GRADE', '彩票奖等');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_ISSUE_FLAG', 'LOTTERY_ISSUE_FLAG', '期状态');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_ISSUE_STATUS', 'LOTTERY_ISSUE_STATUS', '期状态');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_RETRESUT', 'LOTTERY_RETRESUT', '投注结果');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_RULE_STATUS', 'LOTTERY_RULE_STATUS', '渠道状态');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_RULE_TYPE', 'LOTTERY_RULE_TYPE', '渠道类型');
INSERT INTO `t_s_typegroup` VALUES ('LOTTERY_VOTE_TYPE', 'LOTTERY_VOTE_TYPE', '彩票投资方式');
INSERT INTO `t_s_typegroup` VALUES ('MEMBER_LEVEL', 'MEMBER_LEVEL', '会员级别');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_APPLY_STATUS', 'MY_BORROW_APPLY_STATUS', '申请状态；我要融资dw_my_borrow中的apply_status');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_CONTACT_PERSON_RELATIONSHIP', 'MY_BORROW_CONTACT_PERSON_RELATIONSHIP', '紧急联系人关系；我要融资dw_my_borrow中的contact_person_relationship');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_EDUCATION', 'MY_BORROW_EDUCATION', '最高学历；我要融资dw_my_borrow中的education');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_FAMILY_KNOW', 'MY_BORROW_FAMILY_KNOW', '我要融资dw_my_borrow中的family_know');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_FAMILY_LIVE_TYPE', 'MY_BORROW_FAMILY_LIVE_TYPE', '共同居住者；我要融资dw_my_borrow中的family_live_type');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_HEALTH_TYPE', 'MY_BORROW_HEALTH_TYPE', '我要融资dw_my_borrow中的health_type，健康状况');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_HOUSE_TYPE', 'MY_BORROW_HOUSE_TYPE', '房产状况；我要融资dw_my_borrow中的house_type');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_IS_PROCREATE', 'MY_BORROW_IS_PROCREATE', '有无子女；我要融资dw_my_borrow中的is_procreate');
INSERT INTO `t_s_typegroup` VALUES ('MY_BORROW_MARRIAGE_STATE', 'MY_BORROW_MARRIAGE_STATE', '我要融资dw_my_borrow中的marriage_state，婚姻状况');
INSERT INTO `t_s_typegroup` VALUES ('NEWBIG_STATUS', 'NEWBIG_STATUS', '新手标状态');
INSERT INTO `t_s_typegroup` VALUES ('NEWBIG_TENDER_STATUS', 'NEWBIG_TENDER_STATUS', '新手标投标状态');
INSERT INTO `t_s_typegroup` VALUES ('NOTICE_STATUS', 'NOTICE_STATUS', '站内信状态');
INSERT INTO `t_s_typegroup` VALUES ('PRODUCT_TYPE', 'PRODUCT_TYPE', '借款管理-产品类型(财富大爆炸)');
INSERT INTO `t_s_typegroup` VALUES ('PRODUCT_TYPE1', 'PRODUCT_TYPE1', '借款管理(财神到)');
INSERT INTO `t_s_typegroup` VALUES ('REPAYMENT_STATUS', 'REPAYMENT_STATUS', '还款状态');
INSERT INTO `t_s_typegroup` VALUES ('SEND_MESSAGE', 'SEND_MESSAGE', '基础数据维护(邮件)');
INSERT INTO `t_s_typegroup` VALUES ('SEND_MSG_STATUS', 'SEND_MSG_STATUS', '发送状态');
INSERT INTO `t_s_typegroup` VALUES ('SEND_MSG_TYPE', 'SEND_MSG_TYPE', '发送方式');
INSERT INTO `t_s_typegroup` VALUES ('SITE_ARTICLE_STATUS', 'SITE_ARTICLE_STATUS', '栏目文章状态');
INSERT INTO `t_s_typegroup` VALUES ('SITE_LOCATION', 'SITE_LOCATION', '前台网站首页显示位置');
INSERT INTO `t_s_typegroup` VALUES ('SITE_RANK', 'SITE_RANK', '栏目表dw_site中的rank 栏目级别');
INSERT INTO `t_s_typegroup` VALUES ('SITE_STYLE', 'SITE_STYLE', '栏目表dw_site中的style 栏目格式');
INSERT INTO `t_s_typegroup` VALUES ('STYLE_TYPE', 'STYLE_TYPE', '借款管理(一次性还本付息)');
INSERT INTO `t_s_typegroup` VALUES ('SUBJECT_TYPE', 'SUBJECT_TYPE', '标的类型');
INSERT INTO `t_s_typegroup` VALUES ('SYS_VALID_STATUS', 'SYS_VALID_STATUS', '有效标志');
INSERT INTO `t_s_typegroup` VALUES ('TASK_OP_TYPE', 'TASK_OP_TYPE', '任务表dw_task中op_type 操作类型');
INSERT INTO `t_s_typegroup` VALUES ('TASK_STATUS', 'TASK_STATUS', '任务表dw_task中task_status  任务状态');
INSERT INTO `t_s_typegroup` VALUES ('TASK_TYPE', 'TASK_TYPE', '任务表dw_task中task_type 任务类型');
INSERT INTO `t_s_typegroup` VALUES ('TENDER_AUTO_REPUR', 'TENDER_AUTO_REPUR', '是否自动续转');
INSERT INTO `t_s_typegroup` VALUES ('USER_CARD_TYPE', 'USER_CARD_TYPE', '证件类型');
INSERT INTO `t_s_typegroup` VALUES ('USER_EMAIL_STATUS', 'USER_EMAIL_STATUS', '邮箱认证状态');
INSERT INTO `t_s_typegroup` VALUES ('USER_PHONE_STATUS', 'USER_PHONE_STATUS', '手机认证状态');
INSERT INTO `t_s_typegroup` VALUES ('USER_REAL_STATUS', 'USER_REAL_STATUS', '实名状态');
INSERT INTO `t_s_typegroup` VALUES ('USER_REPAYMENT_STATUS', 'USER_REPAYMENT_STATUS', '还款签约状态（0：未签约1：已签约）');
INSERT INTO `t_s_typegroup` VALUES ('USER_SEX', 'USER_SEX', '性别');
INSERT INTO `t_s_typegroup` VALUES ('USER_STATUS', 'USER_STATUS', '用户状态');
INSERT INTO `t_s_typegroup` VALUES ('USER_TENDER_STATUS', 'USER_TENDER_STATUS', '投标签约状态（0：未签约1：已签约）');
INSERT INTO `t_s_typegroup` VALUES ('USER_TYPE', 'USER_TYPE', '用户类型');
INSERT INTO `t_s_typegroup` VALUES ('USER_WITHHOLD_STATUS', 'USER_WITHHOLD_STATUS', '代扣签约状态（0：未签约1:已签约）');
INSERT INTO `t_s_typegroup` VALUES ('USER_YZZ_STATUS', 'USER_YZZ_STATUS', '易极付托管账户状态');
INSERT INTO `t_s_typegroup` VALUES ('VERIFY_STATUS', 'VERIFY_STATUS', '满标审核状态');
INSERT INTO `t_s_typegroup` VALUES ('YJF_INTERACTIVE_RECORD_STATUS', 'YJF_INTERACTIVE_RECORD_STATUS', '易极付日志处理状态');

-- ----------------------------
-- Table structure for `t_s_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE `t_s_user` (
  `email` varchar(50) DEFAULT NULL,
  `mobilePhone` varchar(30) DEFAULT NULL,
  `officePhone` varchar(20) DEFAULT NULL,
  `signatureFile` varchar(100) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `update_name` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人id',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`),
  KEY `FK_2cuji5h6yorrxgsr8ojndlmal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_user
-- ----------------------------
INSERT INTO `t_s_user` VALUES ('', '13396216996', '', null, '8a8a82db525cce4701525ccf91100001', '管理员', '2016-01-20 10:19:19', 'admin', '管理员', '2016-01-20 10:14:13', 'admin');
INSERT INTO `t_s_user` VALUES ('', '', '', null, '8a8a83e9510e73d801510ed292790036', '管理员', '2015-11-16 13:44:20', 'admin', '管理员', '2015-11-16 13:44:20', 'admin');
INSERT INTO `t_s_user` VALUES ('', '', '', 'images/renfang/qm/licf.gif', '8a8ab0b246dc81120146dc8181950052', '管理员', '2016-01-25 16:08:56', 'admin', null, null, null);

-- ----------------------------
-- Table structure for `t_s_user_org`
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_org`;
CREATE TABLE `t_s_user_org` (
  `ID` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `org_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_s_user_org
-- ----------------------------
INSERT INTO `t_s_user_org` VALUES ('402885e950faffb60150fb00a0280001', '8a8ab0b246dc81120146dc8181950052', '402880e447e9a9570147e9b710d20007');
INSERT INTO `t_s_user_org` VALUES ('8a8a82db525cce4701525cd4084b000e', '8a8a82db525cce4701525ccf91100001', '402880e447e99cf10147e9a03b320003');
INSERT INTO `t_s_user_org` VALUES ('8a8a82db525cce4701525cd40864000f', '8a8a82db525cce4701525ccf91100001', '402880e447e9a9570147e9b677320003');
INSERT INTO `t_s_user_org` VALUES ('8a8a83e9510e73d801510ed292a20037', '8a8a83e9510e73d801510ed292790036', '402880e447e99cf10147e9a03b320003');
