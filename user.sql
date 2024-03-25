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
INSERT INTO `user` VALUES (2, 'eden', '', 0, '11', '', '13621877812', 0, '30/11/2023', '410326988568', '1700647260014_IMG_20231119_200114.jpg', '2023-11-15 16:18:51', '');


DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'name',
  `category` int(10) NULL DEFAULT NULL COMMENT '0 1 2 3 4',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'image',
  `created_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'created_time',
  `user_id` int(10) NOT NULL,
  `practice` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ingredients` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recipe
-- ----------------------------
INSERT INTO `recipe` VALUES (2, 'Braised Yellow Croaker with Sauce', 1, '1711272450894_3.png', '2024-03-24 17:40:51', 2, '[{\"icon\":\"1711272600859_4.png\",\"info\":1,\"name\":\"Wash the yellow croaker, treat the internal organs, cut the surface a few times, sprinkle a little salt, and marinate for a while\"},{\"icon\":\"1711272627194_5.png\",\"info\":1,\"name\":\"Cut ginger into shreds and scallions into sections\"},{\"icon\":\"1711272669060_6.png\",\"info\":1,\"name\":\"Pour oil into the pot and preheat it\"},{\"icon\":\"1711272778898_8.png\",\"info\":1,\"name\":\"Heat up and slowly fry yellow croaker. Gently shake the pan and fry one side until set. Flip over and fry the other side\"},{\"icon\":\"1711272796763_9.png\",\"info\":1,\"name\":\"Fry both sides until golden brown, then serve out\"},{\"icon\":\"1711272818113_10.png\",\"info\":1,\"name\":\"Leave a little oil in the pot, stir fry until fragrant with scallions and shredded ginger\"},{\"icon\":\"1711272900750_12.png\",\"info\":1,\"name\":\"Add bean paste, light soy sauce, and cooking wine\"},{\"icon\":\"1711272912107_13.png\",\"info\":1,\"name\":\"Pour in water\"},{\"icon\":\"1711272920224_14.png\",\"info\":1,\"name\":\"Put in the fried yellow croaker, bring to a boil over high heat and simmer over low heat for 10 minutes\"},{\"icon\":\"1711272925482_15.png\",\"info\":1,\"name\":\"10 minutes later, add a little salt and sugar, and turn on the fire to harvest the juice\"},{\"icon\":\"1711272932713_16.png\",\"info\":1,\"name\":\"Collect the juice until it thickens\"},{\"icon\":\"1711272940268_17.png\",\"info\":1,\"name\":\"Chen Pin\"}]', 'A simple delicacy that even kitchen novices can get started with~Exotic style~', '[{\"name\":\"Small yellow croaker\",\"number\":\"1\",\"unit\":0},{\"name\":\"ginger\",\"number\":1,\"unit\":3},{\"name\":\"Cooking wine\",\"number\":1,\"unit\":1},{\"name\":\"White sugar\",\"number\":\"0.25\",\"unit\":1}]');
INSERT INTO `recipe` VALUES (3, 'Braised Yellow Croaker with Sauce', 1, '1711272450894_3.png', '2024-03-24 17:40:51', 2, '[{\"icon\":\"1711272600859_4.png\",\"info\":1,\"name\":\"Wash the yellow croaker, treat the internal organs, cut the surface a few times, sprinkle a little salt, and marinate for a while\"},{\"icon\":\"1711272627194_5.png\",\"info\":1,\"name\":\"Cut ginger into shreds and scallions into sections\"},{\"icon\":\"1711272669060_6.png\",\"info\":1,\"name\":\"Pour oil into the pot and preheat it\"},{\"icon\":\"1711272778898_8.png\",\"info\":1,\"name\":\"Heat up and slowly fry yellow croaker. Gently shake the pan and fry one side until set. Flip over and fry the other side\"},{\"icon\":\"1711272796763_9.png\",\"info\":1,\"name\":\"Fry both sides until golden brown, then serve out\"},{\"icon\":\"1711272818113_10.png\",\"info\":1,\"name\":\"Leave a little oil in the pot, stir fry until fragrant with scallions and shredded ginger\"},{\"icon\":\"1711272900750_12.png\",\"info\":1,\"name\":\"Add bean paste, light soy sauce, and cooking wine\"},{\"icon\":\"1711272912107_13.png\",\"info\":1,\"name\":\"Pour in water\"},{\"icon\":\"1711272920224_14.png\",\"info\":1,\"name\":\"Put in the fried yellow croaker, bring to a boil over high heat and simmer over low heat for 10 minutes\"},{\"icon\":\"1711272925482_15.png\",\"info\":1,\"name\":\"10 minutes later, add a little salt and sugar, and turn on the fire to harvest the juice\"},{\"icon\":\"1711272932713_16.png\",\"info\":1,\"name\":\"Collect the juice until it thickens\"},{\"icon\":\"1711272940268_17.png\",\"info\":1,\"name\":\"Chen Pin\"}]', 'A simple delicacy that even kitchen novices can get started with~Exotic style~', '[{\"name\":\"Small yellow croaker\",\"number\":\"1\",\"unit\":0},{\"name\":\"ginger\",\"number\":1,\"unit\":3},{\"name\":\"Cooking wine\",\"number\":1,\"unit\":1},{\"name\":\"White sugar\",\"number\":\"0.25\",\"unit\":1}]');
INSERT INTO `recipe` VALUES (4, 'Braised Yellow Croaker with Sauce', 1, '1711272450894_3.png', '2024-03-24 17:40:51', 12122, '[{\"icon\":\"1711272600859_4.png\",\"info\":1,\"name\":\"Wash the yellow croaker, treat the internal organs, cut the surface a few times, sprinkle a little salt, and marinate for a while\"},{\"icon\":\"1711272627194_5.png\",\"info\":1,\"name\":\"Cut ginger into shreds and scallions into sections\"},{\"icon\":\"1711272669060_6.png\",\"info\":1,\"name\":\"Pour oil into the pot and preheat it\"},{\"icon\":\"1711272778898_8.png\",\"info\":1,\"name\":\"Heat up and slowly fry yellow croaker. Gently shake the pan and fry one side until set. Flip over and fry the other side\"},{\"icon\":\"1711272796763_9.png\",\"info\":1,\"name\":\"Fry both sides until golden brown, then serve out\"},{\"icon\":\"1711272818113_10.png\",\"info\":1,\"name\":\"Leave a little oil in the pot, stir fry until fragrant with scallions and shredded ginger\"},{\"icon\":\"1711272900750_12.png\",\"info\":1,\"name\":\"Add bean paste, light soy sauce, and cooking wine\"},{\"icon\":\"1711272912107_13.png\",\"info\":1,\"name\":\"Pour in water\"},{\"icon\":\"1711272920224_14.png\",\"info\":1,\"name\":\"Put in the fried yellow croaker, bring to a boil over high heat and simmer over low heat for 10 minutes\"},{\"icon\":\"1711272925482_15.png\",\"info\":1,\"name\":\"10 minutes later, add a little salt and sugar, and turn on the fire to harvest the juice\"},{\"icon\":\"1711272932713_16.png\",\"info\":1,\"name\":\"Collect the juice until it thickens\"},{\"icon\":\"1711272940268_17.png\",\"info\":1,\"name\":\"Chen Pin\"}]', 'A simple delicacy that even kitchen novices can get started with~Exotic style~', '[{\"name\":\"Small yellow croaker\",\"number\":\"1\",\"unit\":0},{\"name\":\"ginger\",\"number\":1,\"unit\":3},{\"name\":\"Cooking wine\",\"number\":1,\"unit\":1},{\"name\":\"White sugar\",\"number\":\"0.25\",\"unit\":1}]');
INSERT INTO `recipe` VALUES (5, 'Braised Yellow Croaker with Sauce', 1, '1711272450894_3.png', '2024-03-24 17:40:51', 12122, '[{\"icon\":\"1711272600859_4.png\",\"info\":1,\"name\":\"Wash the yellow croaker, treat the internal organs, cut the surface a few times, sprinkle a little salt, and marinate for a while\"},{\"icon\":\"1711272627194_5.png\",\"info\":1,\"name\":\"Cut ginger into shreds and scallions into sections\"},{\"icon\":\"1711272669060_6.png\",\"info\":1,\"name\":\"Pour oil into the pot and preheat it\"},{\"icon\":\"1711272778898_8.png\",\"info\":1,\"name\":\"Heat up and slowly fry yellow croaker. Gently shake the pan and fry one side until set. Flip over and fry the other side\"},{\"icon\":\"1711272796763_9.png\",\"info\":1,\"name\":\"Fry both sides until golden brown, then serve out\"},{\"icon\":\"1711272818113_10.png\",\"info\":1,\"name\":\"Leave a little oil in the pot, stir fry until fragrant with scallions and shredded ginger\"},{\"icon\":\"1711272900750_12.png\",\"info\":1,\"name\":\"Add bean paste, light soy sauce, and cooking wine\"},{\"icon\":\"1711272912107_13.png\",\"info\":1,\"name\":\"Pour in water\"},{\"icon\":\"1711272920224_14.png\",\"info\":1,\"name\":\"Put in the fried yellow croaker, bring to a boil over high heat and simmer over low heat for 10 minutes\"},{\"icon\":\"1711272925482_15.png\",\"info\":1,\"name\":\"10 minutes later, add a little salt and sugar, and turn on the fire to harvest the juice\"},{\"icon\":\"1711272932713_16.png\",\"info\":1,\"name\":\"Collect the juice until it thickens\"},{\"icon\":\"1711272940268_17.png\",\"info\":1,\"name\":\"Chen Pin\"}]', 'A simple delicacy that even kitchen novices can get started with~Exotic style~', '[{\"name\":\"Small yellow croaker\",\"number\":\"1\",\"unit\":0},{\"name\":\"ginger\",\"number\":1,\"unit\":3},{\"name\":\"Cooking wine\",\"number\":1,\"unit\":1},{\"name\":\"White sugar\",\"number\":\"0.25\",\"unit\":1}]');
SET FOREIGN_KEY_CHECKS = 1;
