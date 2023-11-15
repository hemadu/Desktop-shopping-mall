/*
Navicat MySQL Data Transfer

Source Server         : mysql2
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : db_computer

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2023-11-16 01:24:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `uid` int(4) DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) DEFAULT NULL COMMENT '地址详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '11', '翻斗大街');
INSERT INTO `address` VALUES ('4', '11', '新华网新华网新华网');
INSERT INTO `address` VALUES ('5', '11', '1111');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `uid` int(4) DEFAULT NULL COMMENT '用户',
  `gid` int(4) DEFAULT NULL COMMENT '商品',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES ('6', '1', '1', '1');
INSERT INTO `carts` VALUES ('11', '11', '1', '1');
INSERT INTO `carts` VALUES ('12', '11', '3', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tid` int(4) DEFAULT NULL COMMENT '产品类型',
  `name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `price` double DEFAULT NULL COMMENT '价格',
  `quantity` int(11) DEFAULT NULL COMMENT '库存',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` varchar(255) DEFAULT NULL COMMENT '描述',
  `isdel` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', 'Intel 酷睿i3 10100', '2000', '97', '1.jpg', '插槽类型：LGA 1200 CPU主频：3.6GHz 三级缓存：6MB 核心数量：四核心 八线程二级缓存：256KB ', '0');
INSERT INTO `goods` VALUES ('2', '2', '微星MAG B460M MORTAR', '769', '97', '2.jpg', '主芯片组：Intel B460 CPU插槽：LGA 1200 主板板型：Micro ATX板型 集成芯片：声卡/网卡 内存类型：4×DDR4 DIMM', '0');
INSERT INTO `goods` VALUES ('3', '3', '海盗船复仇者RGB PRO 16GB DDR4 3000', '639', '97', '3.jpg', '内存容量：16GB 容量描述：套装（2×8GB） 内存类型：DDR4 内存主频：3000MHz 工作电压：1.35V ', '0');
INSERT INTO `goods` VALUES ('4', '2', '222', '222', '22', '1.png', '<p>22</p>', '1');
INSERT INTO `goods` VALUES ('5', '4', '222', '222', '22', '1.jpg', '<p>11</p>', '1');
INSERT INTO `goods` VALUES ('6', '4', '222', '222', '22', '', '', '1');
INSERT INTO `goods` VALUES ('7', '1', '111', '111', '11', '1.jpg', '<p>11</p>', '1');
INSERT INTO `goods` VALUES ('8', '1', '1122', '11', '11', '1.jpg', '<p>11</p>', '1');
INSERT INTO `goods` VALUES ('9', '1', '11', '11', '1', '1.jpg', '<p>1</p>', '1');
INSERT INTO `goods` VALUES ('10', '1', '111', '111', '111', '3.png', '<p>111</p>', '0');
INSERT INTO `goods` VALUES ('11', '1', '111', '111', '111', '3.png', '<p>111</p>', '0');
INSERT INTO `goods` VALUES ('12', '1', '111', '111', '111', '3.png', '<p>111</p>', '0');

-- ----------------------------
-- Table structure for odetail
-- ----------------------------
DROP TABLE IF EXISTS `odetail`;
CREATE TABLE `odetail` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `oid` int(4) DEFAULT NULL COMMENT '订单',
  `gid` int(4) DEFAULT NULL COMMENT '商品',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of odetail
-- ----------------------------
INSERT INTO `odetail` VALUES ('78', '1', '1', '1');
INSERT INTO `odetail` VALUES ('79', '1', '1', '1');
INSERT INTO `odetail` VALUES ('80', '2', '1', '3');
INSERT INTO `odetail` VALUES ('81', '2', '1', '2');
INSERT INTO `odetail` VALUES ('82', '2', '1', '1');
INSERT INTO `odetail` VALUES ('83', '2', '1', '2');
INSERT INTO `odetail` VALUES ('84', '2', '1', '1');
INSERT INTO `odetail` VALUES ('85', '2', '1', '1');
INSERT INTO `odetail` VALUES ('86', '2', '1', '1');
INSERT INTO `odetail` VALUES ('87', '2', '1', '1');
INSERT INTO `odetail` VALUES ('88', '3', '1', '1');
INSERT INTO `odetail` VALUES ('89', '3', '1', '1');
INSERT INTO `odetail` VALUES ('90', '3', '3', '1');
INSERT INTO `odetail` VALUES ('91', '4', '1', '1');
INSERT INTO `odetail` VALUES ('92', '4', '2', '1');
INSERT INTO `odetail` VALUES ('93', '4', '3', '1');
INSERT INTO `odetail` VALUES ('94', '5', '2', '1');
INSERT INTO `odetail` VALUES ('95', '5', '3', '1');
INSERT INTO `odetail` VALUES ('96', '5', '1', '1');
INSERT INTO `odetail` VALUES ('97', '6', '2', '1');
INSERT INTO `odetail` VALUES ('98', '6', '1', '1');
INSERT INTO `odetail` VALUES ('99', '6', '3', '1');
INSERT INTO `odetail` VALUES ('100', '7', '1', '1');
INSERT INTO `odetail` VALUES ('101', '7', '2', '1');
INSERT INTO `odetail` VALUES ('102', '7', '3', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `uid` int(4) DEFAULT NULL COMMENT '用户',
  `price` double DEFAULT NULL COMMENT '总价',
  `no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `quantity` int(11) DEFAULT NULL COMMENT '总数',
  `type` varchar(255) DEFAULT NULL COMMENT '订单类型',
  `status` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `isdel` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '11', '5000', '20210514153410', '3', '学习家用型', '已退货', '0');
INSERT INTO `orders` VALUES ('2', '11', '5000', '20210514153420', '3', '学习家用型', '已完成', '0');
INSERT INTO `orders` VALUES ('3', '11', '4000', '20210123204101', '2', '自助装机', '已完成', '1');
INSERT INTO `orders` VALUES ('4', '11', '6000', '20210124134556', '3', '学习家用型', '已完成', '0');
INSERT INTO `orders` VALUES ('5', '11', '3408', '20210129193348', '3', '学习家用型', '已完成', '0');
INSERT INTO `orders` VALUES ('6', '11', '3408', '20210205161014', '3', '自助装机', '申请退货', '0');
INSERT INTO `orders` VALUES ('7', '11', '3408', '20210205163840', '3', '自助装机', '已退货', '0');

-- ----------------------------
-- Table structure for pdetail
-- ----------------------------
DROP TABLE IF EXISTS `pdetail`;
CREATE TABLE `pdetail` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pid` int(4) DEFAULT NULL COMMENT '方案ID',
  `gid` int(4) DEFAULT NULL COMMENT '商品',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pdetail
-- ----------------------------
INSERT INTO `pdetail` VALUES ('1', '1', '1', '1');
INSERT INTO `pdetail` VALUES ('2', '1', '2', '1');
INSERT INTO `pdetail` VALUES ('3', '1', '3', '1');
INSERT INTO `pdetail` VALUES ('6', '2', '2', '1');
INSERT INTO `pdetail` VALUES ('7', '2', '3', '1');
INSERT INTO `pdetail` VALUES ('11', '5', '2', '1');
INSERT INTO `pdetail` VALUES ('12', '6', '1', '1');
INSERT INTO `pdetail` VALUES ('15', '3', '1', '1');
INSERT INTO `pdetail` VALUES ('18', '3', '2', '1');
INSERT INTO `pdetail` VALUES ('19', '12', '1', '1');
INSERT INTO `pdetail` VALUES ('20', '12', '3', '1');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '方案名称',
  `type` varchar(255) DEFAULT NULL COMMENT '方案类型',
  `price` double DEFAULT NULL COMMENT '方案总价',
  `isdel` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('1', '学习家用型', '游戏型', '3408', '0');
INSERT INTO `plan` VALUES ('2', '极致性能', '游戏型', '1408', '0');
INSERT INTO `plan` VALUES ('3', '实用型', '实用型', '2769', '0');
INSERT INTO `plan` VALUES ('6', '11', '11', '11', '1');
INSERT INTO `plan` VALUES ('7', '11', '11', '0', '1');
INSERT INTO `plan` VALUES ('8', '学习家用型', '游戏型', '3408', '1');
INSERT INTO `plan` VALUES ('9', '学习家用型', '游戏型', '3408', '1');
INSERT INTO `plan` VALUES ('10', '极致性能', '游戏型', '1408', '1');
INSERT INTO `plan` VALUES ('11', '实用型', '实用型', '0', '1');
INSERT INTO `plan` VALUES ('12', '111', '111', '2639', '0');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `isdel` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', 'CPU', '0');
INSERT INTO `type` VALUES ('2', '主板', '1');
INSERT INTO `type` VALUES ('3', '内存', '0');
INSERT INTO `type` VALUES ('4', '硬盘', '0');
INSERT INTO `type` VALUES ('5', '固态硬盘', '0');
INSERT INTO `type` VALUES ('6', '显卡', '0');
INSERT INTO `type` VALUES ('7', '显示器', '0');
INSERT INTO `type` VALUES ('8', '机箱', '0');
INSERT INTO `type` VALUES ('9', '电源', '0');
INSERT INTO `type` VALUES ('10', '散热器', '0');
INSERT INTO `type` VALUES ('11', '鼠标', '0');
INSERT INTO `type` VALUES ('12', '键盘', '0');
INSERT INTO `type` VALUES ('13', '键鼠套装', '0');
INSERT INTO `type` VALUES ('14', '音箱', '0');
INSERT INTO `type` VALUES ('15', '光驱', '0');
INSERT INTO `type` VALUES ('16', '声卡', '0');
INSERT INTO `type` VALUES ('17', '网卡', '0');
INSERT INTO `type` VALUES ('18', '21', '1');
INSERT INTO `type` VALUES ('19', '22', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `role` int(4) DEFAULT NULL COMMENT '0会员1管理员',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `aid` int(4) DEFAULT NULL COMMENT '地址ID',
  `pic` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `birth` varchar(255) DEFAULT NULL COMMENT '生日',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `isdel` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', '13112345678', 'admin', 'admin', 'admin', '1', '3.png', '男', '1991-01-01', '17876765444@qq.com', '0');
INSERT INTO `users` VALUES ('11', '0', '13367890900', '111', '111', '111', '5', '4.png', '男', '1991-01-01', '17876765444@qq.com', '0');
