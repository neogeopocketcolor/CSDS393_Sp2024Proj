/*
 Navicat Premium Data Transfer

 Source Server         : dev
 Source Server Type    : MySQL
 Source Server Version : 80011 (8.0.11)
 Source Host           : 172.16.2.86:3306
 Source Schema         : fjt_test

 Target Server Type    : MySQL
 Target Server Version : 80011 (8.0.11)
 File Encoding         : 65001

 Date: 08/03/2024 13:40:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` int(11) NOT NULL DEFAULT 0 COMMENT '性别',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `role` int(11) NOT NULL DEFAULT 0 COMMENT '角色',
  `birthday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '出生日期',
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `created_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  PRIMARY KEY (`id`, `account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', '管理员', 0, 'root', 'dj', '4', 1, '', '', '', '2023-11-15 16:18:51', NULL);
INSERT INTO `user` VALUES (20, 'eden', '张三丰', 0, '11', '洛阳龙门1', '13621877812', 0, '30/11/2023', '410326988568', '1700647260014_IMG_20231119_200114.jpg', '2023-11-15 16:18:51', '狗-洋葱');
INSERT INTO `user` VALUES (21, 'eden1', '张三丰1', 1, '1', '洛阳龙门', '13621877812', 0, '15/11/2023', '41032698856', '1700029097520_IMG_20231105_151135.jpg', '2023-11-15 16:18:51', NULL);
INSERT INTO `user` VALUES (22, '15', '哈哈哈', 0, '111', '', '', 0, '', '', '', '2023-11-22 17:57:38', NULL);
INSERT INTO `user` VALUES (23, '123', '万达', 0, '123', '', '', 0, '', '', '', '2023-11-22 17:58:02', NULL);
INSERT INTO `user` VALUES (24, '2', '', 0, '2', '', '', 0, '', '', '', '2024-03-08 13:04:44', NULL);
INSERT INTO `user` VALUES (25, '1', '1', 0, '1', '', '1', 0, '', '', '', '2024-03-08 13:19:58', '1');

SET FOREIGN_KEY_CHECKS = 1;
