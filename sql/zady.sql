/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : zady

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 29/04/2020 16:34:45
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
  PRIMARY KEY (`flag`, `status`, `project_id`, `backlog_id`) USING BTREE,
  INDEX `1_sp_i`(`sprint_id`) USING BTREE,
  INDEX `2_sp_i`(`backlog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backlog
-- ----------------------------
INSERT INTO `backlog` VALUES (1, 1, '导出封装包', '导出封装包', 'E', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (2, 1, '导入到库', '导入到库', 'C', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (4, 1, '小小吴最棒的', '小小吴最小的', 'A', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (7, 1, '一个新工作', 'DNFH', 'B', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (14, 1, '新工作哦', '新工作哦', 'A', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (16, 1, '工作名称', '工作描述', 'C', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (18, 1, '新工作', 'balalalalaaa', 'C', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (24, 1, '很新的工作', 'DNFH', 'B', '未开始', NULL, b'0');
INSERT INTO `backlog` VALUES (3, 1, '小小吴最勤劳', '小小吴最勤劳', 'B', '进行中', 4, b'0');
INSERT INTO `backlog` VALUES (23, 1, '小小吴最棒的', '小小吴最大对对对', 'A', '进行中', 4, b'0');
INSERT INTO `backlog` VALUES (5, 1, '一个新backlog', '创建一个小小吴', 'C', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (6, 1, '一个新的小小吴', '创建一个新的小小吴', 'B', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (15, 1, '2', '3', 'C', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (17, 1, '1', '2', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (19, 1, '2333eee', '3333eeee', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (20, 1, 'ssss', 'xxxxxxx', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (21, 1, 'x', 'x', 'D', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (22, 1, '小小吴最最棒', '小小吴最棒了最棒了', 'A', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (25, 1, '一个新信心', '一个新信心', 'C', '未开始', NULL, b'1');
INSERT INTO `backlog` VALUES (26, 1, '一个', '一个', 'A', '未开始', NULL, b'1');

-- ----------------------------
-- Table structure for bornout
-- ----------------------------
DROP TABLE IF EXISTS `bornout`;
CREATE TABLE `bornout`  (
  `bornout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sprint_id` int(10) UNSIGNED NOT NULL,
  `create_date` date NOT NULL,
  `finished_story_num` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`sprint_id`, `create_date`) USING BTREE,
  INDEX `id`(`bornout_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bornout
-- ----------------------------
INSERT INTO `bornout` VALUES (1, 1, '2020-04-08', 3);
INSERT INTO `bornout` VALUES (2, 4, '2020-04-23', 2);

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
  PRIMARY KEY (`project_id`, `sprint_id`, `backlog_id`, `story_id`, `bug_id`) USING BTREE,
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
  PRIMARY KEY (`project_id`, `sprint_id`, `slot_id`) USING BTREE,
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
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `project_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `github_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `master_id` int(11) UNSIGNED NOT NULL,
  `sprint_num` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `current_sprint_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '不大的项目', '很小note', 'https://github.com/T0UGH/t0ugh.github.io', 1, 4, 4);
INSERT INTO `project` VALUES (3, '测试项目0404', '测试项目0404的简介', 'https://github.com/T0UGH/zady', 9, 0, NULL);
INSERT INTO `project` VALUES (4, '测试项目0405', '测试项目0404的简介', 'https://github.com/T0UGH/watersoup', 9, 0, NULL);
INSERT INTO `project` VALUES (5, '测试项目0404', '测试项目0404的简介', 'https://github.com/T0UGH/zady', 9, 0, NULL);
INSERT INTO `project` VALUES (6, '测试项目0404', '测试项目0404的简介', 'https://github.com/T0UGH/zady', 9, 0, NULL);
INSERT INTO `project` VALUES (7, 'nameval', 'noteval', NULL, 1, 0, NULL);
INSERT INTO `project` VALUES (8, '新建项目从前端', '很大很大', 'https://www.example.com', 1, 0, NULL);
INSERT INTO `project` VALUES (11, 'xdd', 'xdd', 'xdd', 1, 0, NULL);
INSERT INTO `project` VALUES (13, '项目名称', '项目名称', NULL, 15, 0, NULL);
INSERT INTO `project` VALUES (14, '新项目', 'xdd', NULL, 16, 0, NULL);
INSERT INTO `project` VALUES (16, '132321', '2', NULL, 17, 0, NULL);
INSERT INTO `project` VALUES (17, '132321', '2', NULL, 17, 0, NULL);
INSERT INTO `project` VALUES (18, '132321', '2', NULL, 17, 0, NULL);
INSERT INTO `project` VALUES (19, 'xx', 'xx', NULL, 20, 0, NULL);
INSERT INTO `project` VALUES (20, 'xcc', '1', '1', 21, 0, NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `role` set('master','owner','developer','tester') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `invite` bit(1) NOT NULL DEFAULT b'1',
  `flag` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`flag`, `invite`, `project_id`, `user_id`, `role_id`) USING BTREE,
  UNIQUE INDEX `id_pu_i`(`role_id`) USING BTREE,
  INDEX `dd_pu_i`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 1, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (2, 1, 9, 'owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (7, 3, 1, 'developer', b'0', b'0');
INSERT INTO `role` VALUES (3, 3, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (4, 4, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (5, 5, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (6, 6, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (8, 7, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (10, 8, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (18, 11, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (20, 13, 15, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (21, 16, 17, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (22, 17, 17, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (23, 18, 17, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (24, 20, 21, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (13, 1, 12, 'owner,developer,tester', b'1', b'0');
INSERT INTO `role` VALUES (19, 1, 13, 'developer,tester', b'1', b'0');
INSERT INTO `role` VALUES (12, 4, 1, 'owner,developer,tester', b'1', b'0');
INSERT INTO `role` VALUES (11, 3, 1, 'developer,tester', b'0', b'1');
INSERT INTO `role` VALUES (9, 1, 11, 'developer', b'1', b'1');
INSERT INTO `role` VALUES (14, 1, 13, 'developer,tester', b'1', b'1');
INSERT INTO `role` VALUES (15, 1, 14, 'owner,developer,tester', b'1', b'1');

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
  PRIMARY KEY (`status`, `project_id`, `round_id`) USING BTREE,
  INDEX `id_sp_i`(`sprint_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sprint
-- ----------------------------
INSERT INTO `sprint` VALUES (4, 1, 4, 'zady:sp4', 'zady:sp4', '进行中', '2020-04-21', '2020-06-30', NULL);
INSERT INTO `sprint` VALUES (1, 1, 1, 'zady:sp', '第一轮迭代', '已完成', '2020-04-05', '2020-07-02', '2020-04-21');
INSERT INTO `sprint` VALUES (2, 1, 2, 'zady:sp2', '第二轮冲刺', '已完成', '2020-04-21', '2020-08-06', '2020-04-21');
INSERT INTO `sprint` VALUES (3, 1, 3, 'zady:sp3', '第三轮迭代', '已完成', '2020-04-21', '2020-04-22', '2020-04-21');

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
  PRIMARY KEY (`flag`, `project_id`, `sprint_id`, `backlog_id`, `story_id`) USING BTREE,
  UNIQUE INDEX `1_st_i`(`story_id`) USING BTREE,
  INDEX `3_st_i`(`flag`, `sprint_id`, `status`) USING BTREE,
  INDEX `2_st_i`(`flag`, `backlog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of story
-- ----------------------------
INSERT INTO `story` VALUES (1, 1, 1, 1, '已完成', '我是一个管理员，我想要一个小功能导出包', 8, 12, '2020-04-06', '2020-04-06', 1, 1, b'0');
INSERT INTO `story` VALUES (3, 1, 4, 3, '已完成', '小小吴不打小王', 4, 0, '2020-04-21', '2020-04-23', 1, 1, b'0');
INSERT INTO `story` VALUES (4, 1, 4, 3, '已完成', '小小吴是小麻花', 8, 0, '2020-04-22', '2020-04-23', 1, 1, b'0');
INSERT INTO `story` VALUES (5, 1, 4, 3, '完成中', '再来一个故事', 5, 0, '2020-04-23', NULL, 1, 1, b'0');
INSERT INTO `story` VALUES (6, 1, 4, 23, '待导入', '小小吴我今天好难啊', 9, 0, '2020-04-23', NULL, NULL, NULL, b'0');
INSERT INTO `story` VALUES (2, 1, 4, 3, '待导入', '小小吴不吃小青蛙', 8, 0, '2020-04-21', NULL, NULL, NULL, b'1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sha1码',
  `default_project_id` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_email_i`(`email`) USING BTREE,
  INDEX `user_name_i`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '小小吴姐姐', 'test@neu.com', 'https://i.loli.net/2020/04/09/3XhA4796VbYcC51.png', '47b4c47e6f66e12e99a616114b8a5eed3999c437', 1);
INSERT INTO `user` VALUES (9, 'testBoy', 'neusoft@neusoft.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', 1);
INSERT INTO `user` VALUES (11, '曲阳', 'm.thbtvmd@gelqo.int', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', NULL);
INSERT INTO `user` VALUES (12, '小李', 'xiaoli@neusoft.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', NULL);
INSERT INTO `user` VALUES (13, '小王', 'xiaowang@neusoft.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', NULL);
INSERT INTO `user` VALUES (14, '小张', 'xiaozhang@neusoft.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', NULL);
INSERT INTO `user` VALUES (15, '12222', '12222@neu.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', 13);
INSERT INTO `user` VALUES (16, '17', '17@neu.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '352cf7c49c00bb6bcd2d1cd25893ac8e92cdff7e', 14);
INSERT INTO `user` VALUES (17, 'test', '18@neu.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '352cf7c49c00bb6bcd2d1cd25893ac8e92cdff7e', 15);
INSERT INTO `user` VALUES (18, 'x', 'r@neu,com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', NULL);
INSERT INTO `user` VALUES (19, 'x', 'x@neu.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '47b4c47e6f66e12e99a616114b8a5eed3999c437', NULL);
INSERT INTO `user` VALUES (20, 'm', 'm@m.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '352cf7c49c00bb6bcd2d1cd25893ac8e92cdff7e', 19);
INSERT INTO `user` VALUES (21, 'q@qq.com', 'q@qq.com', 'https://i.loli.net/2020/03/21/rtR3HPBNlMUjSAG.jpg', '352cf7c49c00bb6bcd2d1cd25893ac8e92cdff7e', 20);

SET FOREIGN_KEY_CHECKS = 1;
