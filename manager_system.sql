/*
 Navicat Premium Data Transfer

 Source Server         : localMysql
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : manager_system

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 01/01/2020 14:57:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `createtime` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_admin`(`rid`) USING BTREE,
  CONSTRAINT `FK_admin` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (15, 'superadmin', '$2a$10$EoeTmeoeNPBDH2g5qM.tYuQAkkQTi/uL..WszntwqEHzQkkAMPScC', '13333634203', '1710031565@qq.com', 1, 1, '2019-07-18');
INSERT INTO `admin` VALUES (27, 'superNice', '$2a$10$EoeTmeoeNPBDH2g5qM.tYuQAkkQTi/uL..WszntwqEHzQkkAMPScC', '12589745201', 'wdd@qq.com', 2, 1, '2019-07-19');

-- ----------------------------
-- Table structure for icon
-- ----------------------------
DROP TABLE IF EXISTS `icon`;
CREATE TABLE `icon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icon
-- ----------------------------
INSERT INTO `icon` VALUES (1, 'fa-home');
INSERT INTO `icon` VALUES (2, 'fa-book');
INSERT INTO `icon` VALUES (3, 'fa-pencil');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `logTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 816 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_SUPER_ADMIN');
INSERT INTO `role` VALUES (2, 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for role_treemenu
-- ----------------------------
DROP TABLE IF EXISTS `role_treemenu`;
CREATE TABLE `role_treemenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL,
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_role_treemenu`(`rid`) USING BTREE,
  INDEX `FK_role_treemenu1`(`tid`) USING BTREE,
  CONSTRAINT `FK_role_treemenu` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_role_treemenu1` FOREIGN KEY (`tid`) REFERENCES `treemenu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_treemenu
-- ----------------------------
INSERT INTO `role_treemenu` VALUES (85, 1, 1);
INSERT INTO `role_treemenu` VALUES (86, 1, 6);
INSERT INTO `role_treemenu` VALUES (87, 1, 2);
INSERT INTO `role_treemenu` VALUES (88, 1, 3);
INSERT INTO `role_treemenu` VALUES (89, 1, 4);
INSERT INTO `role_treemenu` VALUES (90, 1, 9);
INSERT INTO `role_treemenu` VALUES (91, 1, 7);
INSERT INTO `role_treemenu` VALUES (92, 1, 11);
INSERT INTO `role_treemenu` VALUES (98, 2, 1);
INSERT INTO `role_treemenu` VALUES (99, 2, 6);
INSERT INTO `role_treemenu` VALUES (100, 2, 2);
INSERT INTO `role_treemenu` VALUES (101, 2, 3);
INSERT INTO `role_treemenu` VALUES (102, 2, 4);

-- ----------------------------
-- Table structure for treemenu
-- ----------------------------
DROP TABLE IF EXISTS `treemenu`;
CREATE TABLE `treemenu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of treemenu
-- ----------------------------
INSERT INTO `treemenu` VALUES (1, -1, '控制面板', 'fa-home', '');
INSERT INTO `treemenu` VALUES (2, -1, '用户管理', 'fa-book', '');
INSERT INTO `treemenu` VALUES (3, 2, '用户列表', NULL, '/manager/admin');
INSERT INTO `treemenu` VALUES (4, 2, '角色列表', NULL, '/manager/role');
INSERT INTO `treemenu` VALUES (6, 1, '后台主页', NULL, '/manager/index');
INSERT INTO `treemenu` VALUES (7, -1, '系统日志', 'fa-pencil', '');
INSERT INTO `treemenu` VALUES (9, 2, '权限列表', NULL, '/manager/permission');
INSERT INTO `treemenu` VALUES (11, 7, '日志列表', NULL, '/manager/log');

SET FOREIGN_KEY_CHECKS = 1;
