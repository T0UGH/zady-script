/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : zady_user

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/05/2020 10:14:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `id_pu_i`(`role_id`) USING BTREE,
  INDEX `dd_pu_i`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 1, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (2, 1, 9, 'owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (3, 3, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (4, 4, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (5, 5, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (6, 6, 9, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (7, 3, 1, 'developer', b'0', b'0');
INSERT INTO `role` VALUES (8, 7, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (9, 1, 11, 'developer', b'1', b'1');
INSERT INTO `role` VALUES (10, 8, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (11, 3, 1, 'developer,tester', b'0', b'1');
INSERT INTO `role` VALUES (12, 4, 1, 'owner,developer,tester', b'1', b'0');
INSERT INTO `role` VALUES (13, 1, 12, 'owner,developer,tester', b'1', b'0');
INSERT INTO `role` VALUES (14, 1, 13, 'developer,tester', b'1', b'1');
INSERT INTO `role` VALUES (15, 1, 14, 'owner,developer,tester', b'1', b'1');
INSERT INTO `role` VALUES (18, 11, 1, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (19, 1, 13, 'developer,tester', b'1', b'0');
INSERT INTO `role` VALUES (20, 13, 15, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (21, 16, 17, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (22, 17, 17, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (23, 18, 17, 'master,owner,developer,tester', b'0', b'0');
INSERT INTO `role` VALUES (24, 20, 21, 'master,owner,developer,tester', b'0', b'0');

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
