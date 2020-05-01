/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : zady_story

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/05/2020 10:14:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for backlog
-- ----------------------------
DROP TABLE IF EXISTS `backlog`;
CREATE TABLE `backlog`  (
  `backlog_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` enum('A','B','C','D','E') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'C',
  `status` enum('未开始','进行中','已完成') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未开始',
  `sprint_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `flag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`backlog_id`) USING BTREE,
  INDEX `1_sp_i`(`sprint_id`) USING BTREE,
  INDEX `2_sp_i`(`backlog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backlog
-- ----------------------------
INSERT INTO `backlog` VALUES (1, 1, '导出封装包', '导出封装包', 'E', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (2, 1, '导入到库', '导入到库', 'C', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (3, 1, '小小吴最勤劳', '小小吴最勤劳', 'B', '进行中', 4, b'0');
INSERT INTO `backlog` VALUES (4, 1, '小小吴最棒的', '小小吴最小的', 'A', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (5, 1, '一个新backlog', '创建一个小小吴', 'C', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (6, 1, '一个新的小小吴', '创建一个新的小小吴', 'B', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (7, 1, '一个新工作', 'DNFH', 'B', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (14, 1, '新工作哦', '新工作哦', 'A', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (15, 1, '2', '3', 'C', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (16, 1, '工作名称', '工作描述', 'C', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (17, 1, '1', '2', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (18, 1, '新工作', 'balalalalaaa', 'C', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (19, 1, '2333eee', '3333eeee', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (20, 1, 'ssss', 'xxxxxxx', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (21, 1, 'x', 'x', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (22, 1, '小小吴最最棒', '小小吴最棒了最棒了', 'A', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (23, 1, '小小吴最棒的', '小小吴最大对对对', 'A', '进行中', 4, b'0');
INSERT INTO `backlog` VALUES (24, 1, '很新的工作', 'DNFH', 'B', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (25, 1, '一个新信心', '一个新信心', 'C', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (26, 1, '一个', '一个', 'A', '未开始', NULL, b'1');

-- ----------------------------
-- Table structure for bug
-- ----------------------------
DROP TABLE IF EXISTS `bug`;
CREATE TABLE `bug`  (
  `bug_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NOT NULL,
  `sprint_id` int(10) UNSIGNED NOT NULL,
  `backlog_id` int(10) UNSIGNED NOT NULL,
  `story_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` enum('A','B','C','D') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'C',
  `status` enum('待确认','待修改','待复核','已完成') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待确认',
  `developer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `tester_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `flag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`bug_id`) USING BTREE,
  INDEX `id`(`bug_id`) USING BTREE,
  INDEX `sprint_id`(`sprint_id`, `status`) USING BTREE,
  INDEX `story_id`(`story_id`, `status`) USING BTREE,
  INDEX `backlog_id`(`backlog_id`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bug
-- ----------------------------
INSERT INTO `bug` VALUES (1, 1, 1, 1, 1, '导出格式错误x', '导出格式错误', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', 'C', '已完成', 1, 1, b'0');
INSERT INTO `bug` VALUES (2, 1, 1, 1, 1, '代码错误', '代码错误', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', 'C', '已完成', 1, 1, b'0');
INSERT INTO `bug` VALUES (3, 1, 4, 3, 5, '一个新的bug', '一个新的bug', NULL, 'D', '已完成', 1, 1, b'0');
INSERT INTO `bug` VALUES (4, 1, 4, 3, 5, '再来一个', '再来一个', NULL, 'C', '已完成', 1, 1, b'0');
INSERT INTO `bug` VALUES (5, 1, 4, 3, 5, '再来第二个', '再来第二个', NULL, 'B', '已完成', 1, 1, b'0');
INSERT INTO `bug` VALUES (6, 1, 4, 3, 5, '为森么', '为森么', NULL, 'B', '待复核', 1, 1, b'0');

-- ----------------------------
-- Table structure for sprint
-- ----------------------------
DROP TABLE IF EXISTS `sprint`;
CREATE TABLE `sprint`  (
  `sprint_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NOT NULL,
  `round_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('进行中','已完成') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '进行中',
  `start_date` date NOT NULL,
  `expected_end_date` date NOT NULL,
  `actual_end_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`sprint_id`) USING BTREE,
  INDEX `id_sp_i`(`sprint_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sprint
-- ----------------------------
INSERT INTO `sprint` VALUES (1, 1, 1, 'zady:sp', '第一轮迭代', '已完成', '2020-04-05', '2020-07-02', '2020-04-21');
INSERT INTO `sprint` VALUES (2, 1, 2, 'zady:sp2', '第二轮冲刺', '已完成', '2020-04-21', '2020-08-06', '2020-04-21');
INSERT INTO `sprint` VALUES (3, 1, 3, 'zady:sp3', '第三轮迭代', '已完成', '2020-04-21', '2020-04-22', '2020-04-21');
INSERT INTO `sprint` VALUES (4, 1, 4, 'zady:sp4', 'zady:sp4', '进行中', '2020-04-21', '2020-06-30', NULL);

-- ----------------------------
-- Table structure for story
-- ----------------------------
DROP TABLE IF EXISTS `story`;
CREATE TABLE `story`  (
  `story_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NOT NULL,
  `sprint_id` int(10) UNSIGNED NOT NULL,
  `backlog_id` int(10) UNSIGNED NOT NULL,
  `status` enum('待导入','待完成','完成中','待测试','测试中','已完成') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待导入',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '8',
  `expected_hours` tinyint(255) UNSIGNED NOT NULL,
  `current_hours` tinyint(255) UNSIGNED NOT NULL DEFAULT 0,
  `created_date` date NOT NULL,
  `finished_date` date NULL DEFAULT NULL,
  `developer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `tester_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `flag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`story_id`) USING BTREE,
  UNIQUE INDEX `1_st_i`(`story_id`) USING BTREE,
  INDEX `3_st_i`(`flag`, `sprint_id`, `status`) USING BTREE,
  INDEX `2_st_i`(`flag`, `backlog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES (1, 1, 1, 1, '已完成', '我是一个管理员，我想要一个小功能导出包', 8, 12, '2020-04-06', '2020-04-06', 1, 1, b'0');
INSERT INTO `story` VALUES (2, 1, 4, 3, '待导入', '小小吴不吃小青蛙', 8, 0, '2020-04-21', NULL, NULL, NULL, b'1');
INSERT INTO `story` VALUES (3, 1, 4, 3, '已完成', '小小吴不打小王', 4, 0, '2020-04-21', '2020-04-23', 1, 1, b'0');
INSERT INTO `story` VALUES (4, 1, 4, 3, '已完成', '小小吴是小麻花', 8, 0, '2020-04-22', '2020-04-23', 1, 1, b'0');
INSERT INTO `story` VALUES (5, 1, 4, 3, '完成中', '再来一个故事', 5, 0, '2020-04-23', NULL, 1, 1, b'0');
INSERT INTO `story` VALUES (6, 1, 4, 23, '待导入', '小小吴我今天好难啊', 9, 0, '2020-04-23', NULL, NULL, NULL, b'0');

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
