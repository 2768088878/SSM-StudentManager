/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : localhost:3306
 Source Schema         : practice

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 06/03/2020 21:31:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absence
-- ----------------------------
DROP TABLE IF EXISTS `absence`;
CREATE TABLE `absence`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `student` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `className` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程',
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假原因',
  `deal` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未受理' COMMENT '处理',
  `absent` int(2) NOT NULL DEFAULT 0 COMMENT '1：缺勤 0：无',
  `isView` int(2) NOT NULL DEFAULT -1 COMMENT '1:已阅  0:未阅 -1:未有通知(未处理)',
  `gmtCreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '生成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of absence
-- ----------------------------
INSERT INTO `absence` VALUES (1, '四四四', '4', '心理', '第1周,周一', '打打', '批准', 0, 1, '2020-02-05 16:59:36');
INSERT INTO `absence` VALUES (2, '四四四', '4', '心理', '第1周,周一', '三生三世', '批准', 0, 0, '2020-03-06 20:48:25');
INSERT INTO `absence` VALUES (3, '简炜枫', '1', '心理', '第1周,周一', '无', '批准', 0, 1, '2020-03-01 22:36:58');
INSERT INTO `absence` VALUES (4, '简炜枫', '1', '高数', '第1周,周一', '', '驳回', 1, 1, '2020-03-06 20:48:20');
INSERT INTO `absence` VALUES (30, '简炜枫', '1', '马克思', '第1周,周一', '时间', '批准', 0, 1, '2020-03-06 21:30:20');

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS `people`;
CREATE TABLE `people`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `age` int(11) NOT NULL COMMENT '年龄',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `access` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址',
  `major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业',
  `classNo` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班别',
  `iphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `IDcard` char(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `isManager` int(2) NOT NULL DEFAULT 0 COMMENT '是否管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of people
-- ----------------------------
INSERT INTO `people` VALUES (1, '0', '0', '0', 0, '0', '0', '0', '0', '0', '0', '男', 1);
INSERT INTO `people` VALUES (2, '1', '111', '简炜枫', 25, 'jwf2768088878@163.com', '广东佛山市南海区大沥镇盐步南井村', '计算机科学与技术', '1', '17665681640', '440682166711051357', '男', 0);
INSERT INTO `people` VALUES (136, '201413546109', '1', '小明413546109', 11, '1111', 'bh', '计算机科学与技术', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (139, '20150002228', '1', '小明50002228', 11, '1111', 'bh', '计算机科学与技术', '1', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (140, '201572344350', '1', '小明572344350', 11, '1111', 'bh', '计算机科学与技术', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (145, '201700471224', '1', '小红471224', 11, '1111', 'bh', '会计', '3', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (146, '201956199380', '1', '小红199380', 11, '1111', 'bh', '会计', '4', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (147, '201106749719', '1', '小红749719', 11, '1111', 'bh', '会计', '2', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (150, '201189417708', '1', '小红417708', 11, '1111', 'bh', '会计', '4', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (153, '201352389549', '1', '小红389549', 11, '1111', 'bh', '会计', '4', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (154, '201527564124', '1', '小红564124', 11, '1111', 'bh', '会计', '3', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (155, '201574177350', '1', '小红177350', 11, '1111', 'bh', '会计', '3', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (156, '201794526647', '1', '小红526647', 11, '1111', 'bh', '会计', '5', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (157, '201398483830', '1', '小红483830', 11, '1111', 'bh', '会计', '2', '123456', '4406821997', '女', 0);
INSERT INTO `people` VALUES (164, '201219363781', '1', '李四363781', 11, '1111', 'bh', '网工', '1', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (165, '201232286097', '1', '李四286097', 11, '1111', 'bh', '网工', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (167, '201846658205', '1', '李四658205', 11, '1111', 'bh', '网工', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (168, '201940995888', '1', '李四995888', 11, '1111', 'bh', '网工', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (169, '20172688390', '1', '李四88390', 11, '1111', 'bh', '网工', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (170, '201377962674', '1', '李四962674', 11, '1111', 'bh', '网工', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (171, '201225927137', '1', '李四927137', 11, '1111', 'bh', '网工', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (186, '201709104649', '1', '张三104649', 11, '1111', 'bh', '建筑', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (187, '201797665022', '1', '张三665022', 11, '1111', 'bh', '建筑', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (188, '201486114290', '1', '张三114290', 11, '1111', 'bh', '建筑', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (189, '201349941038', '1', '张三941038', 11, '1111', 'bh', '建筑', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (190, '201894369454', '1', '张三369454', 11, '1111', 'bh', '建筑', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (191, '201979877951', '1', '张三877951', 11, '1111', 'bh', '建筑', '5', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (192, '201101801015', '1', '张三801015', 11, '1111', 'bh', '建筑', '4', '123456', '4406821997', '男', 0);
INSERT INTO `people` VALUES (193, '201553060721', '1', '张三060721', 11, '1111', 'bh', '建筑', '4', '123456', '4406821997', '男', 0);

SET FOREIGN_KEY_CHECKS = 1;
