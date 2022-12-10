/*
 Navicat Premium Data Transfer

 Source Server         : goproject
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost
 Source Database       : woodpecker

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : utf-8

 Date: 12/10/2022 09:50:45 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `gen_table`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8_bin DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8_bin DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码生成业务表';

-- ----------------------------
--  Table structure for `gen_table_column`
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码生成业务表字段';

-- ----------------------------
--  Table structure for `replay_diff`
-- ----------------------------
DROP TABLE IF EXISTS `replay_diff`;
CREATE TABLE `replay_diff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `basic_version` varchar(16) DEFAULT NULL,
  `test_version` varchar(16) DEFAULT NULL,
  `diff_result` text COMMENT '接口出参',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='接口Diff结果';

-- ----------------------------
--  Records of `replay_diff`
-- ----------------------------
BEGIN;
INSERT INTO `replay_diff` VALUES ('5', 'v1.0', 'v3.0', '[{\"ddce22b8c0a8007c539382ba\":[{\"diffType\":\"MODIFY\",\"left\":\"6\",\"leftPath\":\"data.addressId\",\"right\":\"7\",\"rightPath\":\"data.addressId\"}]},{\"ddce22b8c0a8007c53938857\":[{\"diffType\":\"MODIFY\",\"left\":\"200\",\"leftPath\":\"resultCode\",\"right\":\"500\",\"rightPath\":\"resultCode\"}]}]', '2022-12-10 09:47:39', '2022-12-10 09:47:39'), ('6', 'v1.0', 'v3.0', '[{\"ddce22b8c0a8007c53938857\":[{\"diffType\":\"MODIFY\",\"left\":\"200\",\"leftPath\":\"resultCode\",\"right\":\"500\",\"rightPath\":\"resultCode\"}]}]', '2022-12-10 09:49:51', '2022-12-10 09:49:51');
COMMIT;

-- ----------------------------
--  Table structure for `replay_flow`
-- ----------------------------
DROP TABLE IF EXISTS `replay_flow`;
CREATE TABLE `replay_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gor_id` varchar(30) NOT NULL COMMENT 'gor返回id',
  `req_url` varchar(30) NOT NULL COMMENT '请求url',
  `req_path` varchar(256) DEFAULT '' COMMENT '请求资源路径',
  `req_method` varchar(20) DEFAULT '' COMMENT '请求方法',
  `req_cookies` varchar(1024) DEFAULT '' COMMENT '登录态',
  `req_content_type` varchar(256) DEFAULT '' COMMENT '请求格式',
  `req_param` varchar(2048) DEFAULT NULL COMMENT '入参',
  `resp_status_code` varchar(20) DEFAULT '' COMMENT '接口返回状态码',
  `resp_data` text COMMENT '接口出参',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `version` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='回放接口信息表';

-- ----------------------------
--  Records of `replay_flow`
-- ----------------------------
BEGIN;
INSERT INTO `replay_flow` VALUES ('1', 'd8ed22b8c0a8007c88ebb18d', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-22 16:35:41', null, 'V1.0'), ('2', 'd8ed22b8c0a8007c88ebb3cd', '192.168.0.174:8888', '/api/v1/shop-cart', 'POST', 'fc9b1c4eec585b577386b02ff177cf9c', '', '{\"goodsCount\":1,\"goodsId\":10283}', '', '{\"resultCode\":500,\"data\":null,\"message\":\"授权已过期\"}', '2022-10-22 16:35:42', null, 'V1.0'), ('3', 'd8ed22b8c0a8007c88ebb619', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-22 16:35:42', null, 'V1.0'), ('4', 'ddce22b8c0a8007c539371f7', '192.168.0.174:8888', '/api/v1/shop-cart', 'POST', 'fc9b1c4eec585b577386b02ff177cf9c', '', '{\"goodsCount\":1,\"goodsId\":10283}', '', null, '2022-10-22 16:35:56', null, 'V1.0'), ('5', 'ddce22b8c0a8007c53937443', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-22 16:35:56', null, 'V1.0'), ('6', 'ddce22b8c0a8007c53937813', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-22 16:35:56', null, 'V1.0'), ('7', 'ddce22b8c0a8007c53937be3', '192.168.0.174:8888', '/api/v1/shop-cart?pageNumber=1', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-22 16:35:56', null, 'V1.0'), ('8', 'ddce22b8c0a8007c53937fb3', '192.168.0.174:8888', '/api/v1/shop-cart/settle?cartItemIds=235', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":null,\"message\":\"SUCCESS\"}', '2022-10-22 16:36:06', null, 'V1.0'), ('9', 'ddce22b8c0a8007c539382ba', '192.168.0.174:8888', '/api/v1/address/default', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":{\"addressId\":7,\"userId\":7,\"userName\":\"ffff\",\"userPhone\":\"18684940190\",\"defaultFlag\":1,\"provinceName\":\"河北省\",\"cityName\":\"石家庄市\",\"regionName\":\"长安区\",\"detailAddress\":\"222222\",\"isDeleted\":0,\"createTime\":\"2022-05-04 11:29:40\",\"updateTime\":\"2022-05-04 11:29:40\"},\"message\":\"SUCCESS\"}', '2022-10-22 16:36:06', null, 'V1.0'), ('10', 'ddce22b8c0a8007c53938608', '192.168.0.174:8888', '/api/v1/saveOrder', 'POST', 'fc9b1c4eec585b577386b02ff177cf9c', '', '{\"addressId\":7,\"cartItemIds\":[235]}', '', null, '2022-10-22 16:36:08', null, 'V1.0'), ('11', 'ddce22b8c0a8007c53938857', '192.168.0.174:8888', '/api/v1/paySuccess?orderNo=16664277678821530&payType=1', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":500,\"data\":{},\"message\":\"订单支付失败:订单状态异常！\"}', '2022-10-22 16:36:10', null, 'V1.0'), ('12', 'ddce22b8c0a8007c53938aa0', '192.168.0.174:8888', '/api/v1/order?pageNumber=1&status=', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":{\"list\":[{\"orderId\":4,\"orderNo\":\"16516457472257660\",\"totalPrice\":3999,\"payType\":1,\"orderStatus\":4,\"orderStatusString\":\"交易成功\",\"createTime\":\"2022-05-04 14:29:07\",\"newBeeMallOrderItemVOS\":[{\"goodsId\":10895,\"goodsName\":\"HUAWEI Mate 30 4000万超感光徕卡影像...\",\"goodsCount\":1,\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":3999}]},{\"orderId\":6,\"orderNo\":\"16599724551281398\",\"totalPrice\":9999,\"payType\":1,\"orderStatus\":1,\"orderStatusString\":\"已支付\",\"createTime\":\"2022-08-08 23:27:35\",\"newBeeMallOrderItemVOS\":[{\"goodsId\":10320,\"goodsName\":\"Apple iPhone 11 Pro\",\"goodsCount\":1,\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":9999}]},{\"orderId\":7,\"orderNo\":\"16616109449917215\",\"totalPrice\":12999,\"payType\":1,\"orderStatus\":1,\"orderStatusString\":\"已支付\",\"createTime\":\"2022-08-27 22:35:45\",\"newBeeMallOrderItemVOS\":[{\"goodsId\":10269,\"goodsName\":\"Apple 2019新品 Macbook Pro 13...\",\"goodsCount\":1,\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":12999}]}],\"totalCount\":15,\"totalPage\":0,\"currPage\":1,\"pageSize\":5},\"message\":\"SUCCESS\"}', '2022-10-22 16:36:12', null, 'V1.0'), ('25', 'd8ed22b8c0a8007c88ebb18d', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('26', 'd8ed22b8c0a8007c88ebb3cd', '192.168.0.174:8888', '/api/v1/shop-cart', 'POST', 'fc9b1c4eec585b577386b02ff177cf9c', '', '{\"goodsCount\":1,\"goodsId\":10283}', '', '{\"resultCode\":500,\"data\":null,\"message\":\"授权已过期\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('27', 'd8ed22b8c0a8007c88ebb619', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('28', 'ddce22b8c0a8007c539371f7', '192.168.0.174:8888', '/api/v1/shop-cart', 'POST', 'fc9b1c4eec585b577386b02ff177cf9c', '', '{\"goodsCount\":1,\"goodsId\":10283}', '', null, '2022-10-30 11:07:52', null, 'v3.0'), ('29', 'ddce22b8c0a8007c53937443', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('30', 'ddce22b8c0a8007c53937813', '192.168.0.174:8888', '/api/v1/shop-cart', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('31', 'ddce22b8c0a8007c53937be3', '192.168.0.174:8888', '/api/v1/shop-cart?pageNumber=1', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":[{\"cartItemId\":236,\"goodsId\":10283,\"goodsCount\":1,\"goodsName\":\"Apple iPhone 11 (A2223)\",\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":6799}],\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('32', 'ddce22b8c0a8007c53937fb3', '192.168.0.174:8888', '/api/v1/shop-cart/settle?cartItemIds=235', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":null,\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('33', 'ddce22b8c0a8007c539382ba', '192.168.0.174:8888', '/api/v1/address/default', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":{\"addressId\":6,\"userId\":7,\"userName\":\"ffff\",\"userPhone\":\"18684940190\",\"defaultFlag\":1,\"provinceName\":\"河北省\",\"cityName\":\"石家庄市\",\"regionName\":\"长安区\",\"detailAddress\":\"222222\",\"isDeleted\":0,\"createTime\":\"2022-05-04 11:29:40\",\"updateTime\":\"2022-05-04 11:29:40\"},\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('34', 'ddce22b8c0a8007c53938608', '192.168.0.174:8888', '/api/v1/saveOrder', 'POST', 'fc9b1c4eec585b577386b02ff177cf9c', '', '{\"addressId\":7,\"cartItemIds\":[235]}', '', null, '2022-10-30 11:07:52', null, 'v3.0'), ('35', 'ddce22b8c0a8007c53938857', '192.168.0.174:8888', '/api/v1/paySuccess?orderNo=16664277678821530&payType=1', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":{},\"message\":\"订单支付失败:订单状态异常！\"}', '2022-10-30 11:07:52', null, 'v3.0'), ('36', 'ddce22b8c0a8007c53938aa0', '192.168.0.174:8888', '/api/v1/order?pageNumber=1&status=', 'GET', 'fc9b1c4eec585b577386b02ff177cf9c', '', ' ', '', '{\"resultCode\":200,\"data\":{\"list\":[{\"orderId\":4,\"orderNo\":\"16516457472257660\",\"totalPrice\":3999,\"payType\":1,\"orderStatus\":4,\"orderStatusString\":\"交易成功\",\"createTime\":\"2022-05-04 14:29:07\",\"newBeeMallOrderItemVOS\":[{\"goodsId\":10895,\"goodsName\":\"HUAWEI Mate 30 4000万超感光徕卡影像...\",\"goodsCount\":1,\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":3999}]},{\"orderId\":6,\"orderNo\":\"16599724551281398\",\"totalPrice\":9999,\"payType\":1,\"orderStatus\":1,\"orderStatusString\":\"已支付\",\"createTime\":\"2022-08-08 23:27:35\",\"newBeeMallOrderItemVOS\":[{\"goodsId\":10320,\"goodsName\":\"Apple iPhone 11 Pro\",\"goodsCount\":1,\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":9999}]},{\"orderId\":7,\"orderNo\":\"16616109449917215\",\"totalPrice\":12999,\"payType\":1,\"orderStatus\":1,\"orderStatusString\":\"已支付\",\"createTime\":\"2022-08-27 22:35:45\",\"newBeeMallOrderItemVOS\":[{\"goodsId\":10269,\"goodsName\":\"Apple 2019新品 Macbook Pro 13...\",\"goodsCount\":1,\"goodsCoverImg\":\"https://newbee-mall.oss-cn-beijing.aliyuncs.com/images/p50-pocket-gold.png\",\"sellingPrice\":12999}]}],\"totalCount\":15,\"totalPage\":0,\"currPage\":1,\"pageSize\":5},\"message\":\"SUCCESS\"}', '2022-10-30 11:07:52', null, 'v3.0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参数配置表';

-- ----------------------------
--  Records of `sys_config`
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-08-06 22:26:02', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'), ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-08-06 22:26:02', '', null, '初始化密码 123456'), ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-08-06 22:26:02', '', null, '深色主题theme-dark，浅色主题theme-light'), ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2022-08-06 22:26:02', '', null, '是否开启验证码功能（true开启，false关闭）'), ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-08-06 22:26:02', '', null, '是否开启注册用户功能（true开启，false关闭）');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='部门表';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null), ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-08-06 22:26:01', '', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典数据表';

-- ----------------------------
--  Records of `sys_dict_data`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '性别男'), ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '性别女'), ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '性别未知'), ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '显示菜单'), ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '隐藏菜单'), ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '正常状态'), ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '停用状态'), ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '正常状态'), ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '停用状态'), ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '默认分组'), ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '系统分组'), ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '系统默认是'), ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '系统默认否'), ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '通知'), ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '公告'), ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-08-06 22:26:02', '', null, '正常状态'), ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '关闭状态'), ('18', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '新增操作'), ('19', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '修改操作'), ('20', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '删除操作'), ('21', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '授权操作'), ('22', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '导出操作'), ('23', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '导入操作'), ('24', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '强退操作'), ('25', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '生成操作'), ('26', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '清空操作'), ('27', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '正常状态'), ('28', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-08-06 22:26:02', '', null, '停用状态');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典类型表';

-- ----------------------------
--  Records of `sys_dict_type`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-08-06 22:26:02', '', null, '用户性别列表'), ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-08-06 22:26:02', '', null, '菜单状态列表'), ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-08-06 22:26:02', '', null, '系统开关列表'), ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-08-06 22:26:02', '', null, '任务状态列表'), ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-08-06 22:26:02', '', null, '任务分组列表'), ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-08-06 22:26:02', '', null, '系统是否列表'), ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-08-06 22:26:02', '', null, '通知类型列表'), ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-08-06 22:26:02', '', null, '通知状态列表'), ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-08-06 22:26:02', '', null, '操作类型列表'), ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-08-06 22:26:02', '', null, '登录状态列表');
COMMIT;

-- ----------------------------
--  Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_bin DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='定时任务调度表';

-- ----------------------------
--  Records of `sys_job`
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-08-06 22:26:02', '', null, ''), ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-08-06 22:26:02', '', null, ''), ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-08-06 22:26:02', '', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='定时任务调度日志表';

-- ----------------------------
--  Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统访问记录';

-- ----------------------------
--  Records of `sys_logininfor`
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-08-06 23:35:18'), ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-08-09 22:25:58'), ('102', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '1', '验证码错误', '2022-08-09 22:33:38'), ('103', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-08-09 22:33:42'), ('104', 'admin', '127.0.0.1', '内网IP', 'Chrome Mobile', 'Android 6.x', '0', '登录成功', '2022-09-08 12:02:57'), ('105', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-09-09 22:48:34'), ('106', null, '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '登录用户：NONE_PROVIDED 不存在', '2022-10-23 16:31:49'), ('107', null, '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '登录用户：NONE_PROVIDED 不存在', '2022-10-30 10:36:05'), ('108', null, '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '登录用户：NONE_PROVIDED 不存在', '2022-10-30 10:36:30'), ('109', null, '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '登录用户：NONE_PROVIDED 不存在', '2022-10-30 10:57:01'), ('110', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-10-30 10:57:10'), ('111', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-05 16:14:30'), ('112', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-11-05 18:08:58'), ('113', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-05 18:09:02'), ('114', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-05 19:37:48'), ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-11-29 21:09:31'), ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-03 09:49:40'), ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '退出成功', '2022-12-03 11:04:30'), ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Mac OS X', '0', '登录成功', '2022-12-03 11:05:30');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单权限表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-08-06 22:26:02', '', null, '系统管理目录'), ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-08-06 22:26:02', '', null, '系统监控目录'), ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-08-06 22:26:02', '', null, '用户管理菜单'), ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-08-06 22:26:02', '', null, '角色管理菜单'), ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-08-06 22:26:02', '', null, '菜单管理菜单'), ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-08-06 22:26:02', '', null, '部门管理菜单'), ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-08-06 22:26:02', '', null, '岗位管理菜单'), ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-08-06 22:26:02', '', null, '字典管理菜单'), ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-08-06 22:26:02', '', null, '参数设置菜单'), ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-08-06 22:26:02', '', null, '通知公告菜单'), ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-08-06 22:26:02', '', null, '日志管理菜单'), ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-08-06 22:26:02', '', null, '在线用户菜单'), ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-08-06 22:26:02', '', null, '定时任务菜单'), ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-08-06 22:26:02', '', null, '数据监控菜单'), ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-08-06 22:26:02', '', null, '服务监控菜单'), ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-08-06 22:26:02', '', null, '缓存监控菜单'), ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-08-06 22:26:02', '', null, '缓存列表菜单'), ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-08-06 22:26:02', '', null, '操作日志菜单'), ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-08-06 22:26:02', '', null, '登录日志菜单'), ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1041', '日志导出', '500', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1045', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1046', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1047', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1048', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1049', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1050', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1051', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1052', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1053', '任务导出', '110', '7', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-08-06 22:26:02', '', null, ''), ('1054', '流量回放', '0', '3', '/replay', null, null, '1', '0', 'M', '0', '0', null, 'bug', 'admin', '2022-11-05 16:48:27', '', null, ''), ('1055', '流量数据', '1054', '1', 'replay', 'replay/index', null, '1', '0', 'C', '0', '0', '', 'list', 'admin', '2022-11-05 16:54:28', 'admin', '2022-11-05 16:56:39', ''), ('1056', '流量比对', '1054', '2', 'diff', 'replay/diff', null, '1', '0', 'C', '0', '0', '', 'monitor', 'admin', '2022-11-05 16:58:40', 'admin', '2022-11-05 16:59:22', '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知公告表';

-- ----------------------------
--  Records of `sys_notice`
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xe696b0e78988e69cace58685e5aeb9, '0', 'admin', '2022-08-06 22:26:02', '', null, '管理员'), ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xe7bbb4e68aa4e58685e5aeb9, '0', 'admin', '2022-08-06 22:26:02', '', null, '管理员');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志记录';

-- ----------------------------
--  Records of `sys_oper_log`
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES ('1', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/3', '127.0.0.1', '内网IP', '{menuId=3}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2022-08-09 22:53:11'), ('2', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/117', '127.0.0.1', '内网IP', '{menuId=117}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', '0', null, '2022-08-09 22:53:15'), ('3', '角色管理', '2', 'com.kele.woodpecker.project.system.controller.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-08-06 22:26:01\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,2,109,1045,1046,1047,110,1048,1049,1050,1051,1052,1053,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:53:40'), ('4', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/117', '127.0.0.1', '内网IP', '{menuId=117}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:53:49'), ('5', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/116', '127.0.0.1', '内网IP', '{menuId=116}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:53:52'), ('6', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', '0', null, '2022-08-09 22:53:56'), ('7', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1059', '127.0.0.1', '内网IP', '{menuId=1059}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:01'), ('8', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1058', '127.0.0.1', '内网IP', '{menuId=1058}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:04'), ('9', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1056', '127.0.0.1', '内网IP', '{menuId=1056}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:06'), ('10', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1057', '127.0.0.1', '内网IP', '{menuId=1057}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:09'), ('11', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1055', '127.0.0.1', '内网IP', '{menuId=1055}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:11'), ('12', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1054', '127.0.0.1', '内网IP', '{menuId=1054}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:12'), ('13', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/115', '127.0.0.1', '内网IP', '{menuId=115}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:15'), ('14', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/3', '127.0.0.1', '内网IP', '{menuId=3}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:17'), ('15', '菜单管理', '3', 'com.kele.woodpecker.project.system.controller.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-08-09 22:54:54'), ('16', '菜单管理', '1', 'com.kele.woodpecker.project.system.controller.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流量回放\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/replay\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:48:27'), ('17', '菜单管理', '1', 'com.kele.woodpecker.project.system.controller.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流量数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1054,\"path\":\"gor\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:54:28'), ('18', '菜单管理', '2', 'com.kele.woodpecker.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"/replay/gor\",\"createTime\":\"2022-11-05 16:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1055,\"menuName\":\"流量数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1054,\"path\":\"gor\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:55:08'), ('19', '菜单管理', '2', 'com.kele.woodpecker.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"replay/gor\",\"createTime\":\"2022-11-05 16:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1055,\"menuName\":\"流量数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1054,\"path\":\"gor\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:55:15'), ('20', '菜单管理', '2', 'com.kele.woodpecker.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"replay/index\",\"createTime\":\"2022-11-05 16:54:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1055,\"menuName\":\"流量数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1054,\"path\":\"replay\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:55:47'), ('21', '菜单管理', '2', 'com.kele.woodpecker.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"replay/index\",\"createTime\":\"2022-11-05 16:54:28\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1055,\"menuName\":\"流量数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1054,\"path\":\"replay\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:56:39'), ('22', '菜单管理', '1', 'com.kele.woodpecker.project.system.controller.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"流量比对\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":1054,\"path\":\"replay/diff\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:58:40'), ('23', '菜单管理', '2', 'com.kele.woodpecker.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2022-11-05 16:58:40\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1056,\"menuName\":\"流量比对\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":1054,\"path\":\"replay/diff\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:59:01'), ('24', '菜单管理', '2', 'com.kele.woodpecker.project.system.controller.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"replay/diff\",\"createTime\":\"2022-11-05 16:58:40\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1056,\"menuName\":\"流量比对\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1054,\"path\":\"diff\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-11-05 16:59:22');
COMMIT;

-- ----------------------------
--  Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='岗位信息表';

-- ----------------------------
--  Records of `sys_post`
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-08-06 22:26:01', '', null, ''), ('2', 'se', '项目经理', '2', '0', 'admin', '2022-08-06 22:26:01', '', null, ''), ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-08-06 22:26:01', '', null, ''), ('4', 'user', '普通员工', '4', '0', 'admin', '2022-08-06 22:26:01', '', null, '');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色信息表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-08-06 22:26:01', '', null, '超级管理员'), ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-08-06 22:26:01', 'admin', '2022-08-09 22:53:40', '普通角色');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和部门关联表';

-- ----------------------------
--  Records of `sys_role_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES ('2', '100'), ('2', '101'), ('2', '105');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和菜单关联表';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('2', '1'), ('2', '2'), ('2', '100'), ('2', '101'), ('2', '102'), ('2', '103'), ('2', '104'), ('2', '105'), ('2', '106'), ('2', '107'), ('2', '108'), ('2', '109'), ('2', '110'), ('2', '111'), ('2', '112'), ('2', '113'), ('2', '114'), ('2', '500'), ('2', '501'), ('2', '1000'), ('2', '1001'), ('2', '1002'), ('2', '1003'), ('2', '1004'), ('2', '1005'), ('2', '1006'), ('2', '1007'), ('2', '1008'), ('2', '1009'), ('2', '1010'), ('2', '1011'), ('2', '1012'), ('2', '1013'), ('2', '1014'), ('2', '1015'), ('2', '1016'), ('2', '1017'), ('2', '1018'), ('2', '1019'), ('2', '1020'), ('2', '1021'), ('2', '1022'), ('2', '1023'), ('2', '1024'), ('2', '1025'), ('2', '1026'), ('2', '1027'), ('2', '1028'), ('2', '1029'), ('2', '1030'), ('2', '1031'), ('2', '1032'), ('2', '1033'), ('2', '1034'), ('2', '1035'), ('2', '1036'), ('2', '1037'), ('2', '1038'), ('2', '1039'), ('2', '1040'), ('2', '1041'), ('2', '1042'), ('2', '1043'), ('2', '1044'), ('2', '1045'), ('2', '1046'), ('2', '1047'), ('2', '1048'), ('2', '1049'), ('2', '1050'), ('2', '1051'), ('2', '1052'), ('2', '1053');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-12-03 11:05:30', 'admin', '2022-08-06 22:26:01', '', '2022-12-03 11:05:30', '管理员'), ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-08-06 22:26:01', 'admin', '2022-08-06 22:26:01', '', null, '测试员');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户与岗位关联表';

-- ----------------------------
--  Records of `sys_user_post`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES ('1', '1'), ('2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户和角色关联表';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('2', '2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
