/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : houserent

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 08/05/2020 11:36:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `Hid` int(0) NOT NULL AUTO_INCREMENT,
  `Hname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Hprice` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Haddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Hsize` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Hflag` int(0) NOT NULL,
  `Hdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Uid` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`Hid`) USING BTREE,
  INDEX `Hid`(`Hid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, '香格丽舍', '666666', '金水市', '500', 0, '无', 1);
INSERT INTO `house` VALUES (2, '爱琴堡', '999999', '天元镇', '1000', 0, '无', 2);
INSERT INTO `house` VALUES (3, '忘忧阁', '222222', '飞音镇', '300', 0, '无', 3);
INSERT INTO `house` VALUES (4, '凌月馆', '222222', '日川市', '200', 0, '无', 4);
INSERT INTO `house` VALUES (5, '花果园', '555555', '道古市', '600', 0, '无', 5);
INSERT INTO `house` VALUES (6, '七里香都', '888888', '西达镇', '700', 0, '无', 6);

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner`  (
  `Oid` int(0) NOT NULL AUTO_INCREMENT,
  `Oname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Telephone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Osex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Oid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES (1, '张三', 'zhangsan', '1302222001', '男');
INSERT INTO `owner` VALUES (2, '李四', 'lisi', '1302222002', '男');
INSERT INTO `owner` VALUES (3, '王五', 'wangwu', '1230222032', '男');
INSERT INTO `owner` VALUES (4, '麻婆', 'mapo', '1234315354', '女');
INSERT INTO `owner` VALUES (5, '艾米', 'aimi', '1563156345', '女');
INSERT INTO `owner` VALUES (6, '琪亚娜', 'qiyana', '4534245646', '女');
INSERT INTO `owner` VALUES (9, '香菜', 'xiangcai', '12514256589', 'female');
INSERT INTO `owner` VALUES (14, '香菜', 'xiangcai', '12514256589', 'female');

SET FOREIGN_KEY_CHECKS = 1;
