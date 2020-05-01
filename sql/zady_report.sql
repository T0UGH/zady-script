/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : zady_report

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/05/2020 10:14:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bornout
-- ----------------------------
DROP TABLE IF EXISTS `bornout`;
CREATE TABLE `bornout`  (
  `bornout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sprint_id` int(10) UNSIGNED NOT NULL,
  `create_date` date NOT NULL,
  `finished_story_num` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`bornout_id`) USING BTREE,
  INDEX `id`(`bornout_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bornout
-- ----------------------------
INSERT INTO `bornout` VALUES (1, 1, '2020-04-08', 1);
INSERT INTO `bornout` VALUES (2, 4, '2020-04-23', 2);

-- ----------------------------
-- Table structure for dash_board
-- ----------------------------
DROP TABLE IF EXISTS `dash_board`;
CREATE TABLE `dash_board`  (
  `dash_board_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) UNSIGNED NOT NULL,
  `sprint_id` int(10) UNSIGNED NOT NULL,
  `slot_id` tinyint(4) UNSIGNED NOT NULL,
  `backlog_num` mediumint(8) NOT NULL DEFAULT 0,
  `finished_backlog_num` tinyint(4) NOT NULL DEFAULT 0,
  `story_num` mediumint(8) NOT NULL DEFAULT 0,
  `finished_story_num` mediumint(8) NOT NULL DEFAULT 0,
  `bug_num` mediumint(8) NOT NULL DEFAULT 0,
  `solved_bug_num` mediumint(8) NOT NULL DEFAULT 0,
  `in_time_story_num` mediumint(8) NOT NULL DEFAULT 0,
  `out_time_story_num` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`dash_board_id`) USING BTREE,
  UNIQUE INDEX `id`(`dash_board_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dash_board
-- ----------------------------
INSERT INTO `dash_board` VALUES (1, 1, 1, 1, -2, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (2, 1, 1, 2, -1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (3, 1, 1, 3, 1, 0, 1, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (4, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (5, 1, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (6, 1, 1, 6, 1, 0, 0, 0, 1, 0, 0, 0);
INSERT INTO `dash_board` VALUES (7, 1, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO `dash_board` VALUES (8, 1, 1, 8, 0, 0, 0, 1, 0, 0, 1, 0);
INSERT INTO `dash_board` VALUES (9, 1, 1, 9, 1, 1, 0, 1, 0, 0, 0, 1);
INSERT INTO `dash_board` VALUES (10, 1, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (11, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (12, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (13, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (14, 1, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (15, 1, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (16, 1, 2, 6, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (17, 1, 2, 7, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (18, 1, 2, 8, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (19, 1, 2, 9, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (20, 1, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (21, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (22, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (23, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (24, 1, 3, 4, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (25, 1, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (26, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (27, 1, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (28, 1, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (29, 1, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (30, 1, 3, 10, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (31, 1, 4, 1, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (32, 1, 4, 2, 1, 0, -1, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (33, 1, 4, 3, 1, 0, -2, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (34, 1, 4, 4, 0, 0, -2, 1, 2, 1, 1, 0);
INSERT INTO `dash_board` VALUES (35, 1, 4, 5, 0, 0, 1, 0, 0, 1, 0, 0);
INSERT INTO `dash_board` VALUES (36, 1, 4, 6, 0, 0, 2, 0, 0, 0, 0, 0);
INSERT INTO `dash_board` VALUES (37, 1, 4, 7, 0, 0, 1, 0, 1, 0, 0, 0);
INSERT INTO `dash_board` VALUES (38, 1, 4, 8, 0, 0, 5, 0, 1, 0, 0, 0);
INSERT INTO `dash_board` VALUES (39, 1, 4, 9, 0, 0, -3, 1, 0, 1, 1, 0);
INSERT INTO `dash_board` VALUES (40, 1, 4, 10, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NOT NULL,
  `log_modified` datetime(0) NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
