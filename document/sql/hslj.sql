/*
 Navicat Premium Data Transfer

 Source Server         : centos
 Source Server Type    : MySQL
 Source Server Version : 50742
 Source Host           : 172.30.100.23:3306
 Source Schema         : HSLJ_DB

 Target Server Type    : MySQL
 Target Server Version : 50742
 File Encoding         : 65001

 Date: 04/05/2023 15:16:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
    `id`           int(11)                                                      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `login_id`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录id，唯一',
    `name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
    `password`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
    `role`         tinyint(4)                                                   NOT NULL DEFAULT 1 COMMENT '管理员类型：1  超级管理员 ',
    `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话号码',
    `creator_id`   int(11)                                                      NOT NULL DEFAULT 0 COMMENT '创建人id',
    `is_deleted`   tinyint(4)                                                   NOT NULL DEFAULT 1 COMMENT '是否删除 1-否 2-是',
    `created_at`   timestamp(0)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
    `updated_at`   timestamp(0)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '管理员，包括超级管理员，管理员，可以登录后台进行编辑和管理'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`
VALUES (1, '0', 'admin2', 'admin2', 0, '', 0, 0, '2023-06-07 09:49:22', '2023-06-07 09:49:22');
INSERT INTO `admin`
VALUES (2, '0', 'admin1', 'admin1', 0, '', 0, 0, '2023-06-07 09:49:27', '2023-06-07 09:49:27');



-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`           int(11)                                                      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `login_id`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录id，唯一',
    `name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
    `password`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
    `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话号码',
    `active`       int(11)                                                      NOT NULL DEFAULT 0 COMMENT '活跃度，参与打卡的次数',
    `rank`         int(11)                                                      NOT NULL DEFAULT 0 COMMENT '用户评级',
    `created_at`   timestamp(0)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
    `updated_at`   timestamp(0)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户表，student表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES (1, '202311111111', 'user1', '11111111', '0', 0, 1, '2023-03-09 16:53:08', '2023-04-17 10:29:32');
INSERT INTO `user`
VALUES (2, '202311111112', 'lixunguang', 'uua', '0', 0, 1, '2023-03-09 16:54:12', '2023-03-09 16:54:12');
INSERT INTO `user`
VALUES (3, '12134', 'admin', 'admin', '0', 0, 1, '2023-03-09 16:55:09', '2023-03-09 16:55:09');
INSERT INTO `user`
VALUES (4, '111222', 'admin', 'admin', '0', 0, 1, '2023-03-21 15:46:25', '2023-04-17 10:29:24');
INSERT INTO `user`
VALUES (12, '122222', 'liteacher', 'adminxx', '0', 0, 1, '2023-03-15 09:16:32', '2023-03-22 18:30:07');


-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`
(
    `id`         int(11)                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地点名字',
    `desc`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '地点描述',
    `location`   geometry                                                      NULL COMMENT '位置',
    `frequency`  int(11)                                                       NOT NULL DEFAULT 0 COMMENT '频率',
    `time_str`   text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '时间信息',
    `people_num` int(11)                                                       NOT NULL DEFAULT 0 COMMENT '参与人数',
    `rating`     int(11)                                                       NOT NULL DEFAULT 0 COMMENT '评分',
    `hot`        int(11)                                                       NOT NULL DEFAULT 0 COMMENT '热度，统计多少人来这里踢过',
    `is_auth`    tinyint                                                       NOT NULL DEFAULT 0 COMMENT '是否已经验证0 未验证，1 已经验证',
    `created_at` timestamp(0)                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
    `updated_at` timestamp(0)                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '地点表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location`
VALUES (1, '北京颐和园北宫门', '颐和园是一个皇家园林。', ST_GeomFromText('POINT(121.474103 31.232862)'), 1, "08:00~9:00;3:00~5:00", 2, '0',
        13,
        '0', '2023-03-09 16:53:08',
        '2023-04-17 10:29:32');
INSERT INTO `location`
VALUES (2, '北京天坛', '天坛是明清两代皇帝“祭天”“祈谷”的场所，总面积273公顷。', ST_GeomFromText('POINT(121.474103 31.232862)'), 1,
        "08:00~9:00;3:00~5:00", 2, '0', 20, '0',
        '2023-03-09 16:53:08', '2023-04-17 10:29:32');
INSERT INTO `location`
VALUES (3, '北京玉渊潭公园', '元代,丁氏在池边建亭,以“玉渊”名其亭,于是有了玉渊潭之名。当时,这里已是有名的风景区。', ST_GeomFromText('POINT(121.474103 31.232862)'), 1,
        "08:00~9:00;3:00~5:00", 2,
        '0', 14, '0', '2023-03-09 16:53:08', '2023-04-17 10:29:32');
INSERT INTO `location`
VALUES (4, '北京望京北小河', '望京北小河。', ST_GeomFromText('POINT(121.474103 31.232862)'), 1, "08:00~9:00;3:00~5:00", 2, '0', 3,
        '0',
        '2023-03-09 16:53:08',
        '2023-04-17 10:29:32');
INSERT INTO `location`
VALUES (5, '北京地坛', '原名方泽坛，为明清两代皇帝祭祀皇地祗的场所。', ST_GeomFromText('POINT(121.474103 31.232862)'), 1, "08:00~9:00;3:00~5:00",
        2, '0', 15, '0',
        '2023-03-09 16:53:08', '2023-04-17 10:29:32');

INSERT INTO `location`
VALUES (6, '仰山公园', '一个有很多雕塑的公园。', ST_GeomFromText('POINT(121.474103 31.232862)'), 1, "08:00~9:00;3:00~5:00",
        2, '0', 12, '0',
        '2023-03-09 16:53:08', '2023-04-17 10:29:32');



-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`
(
    `id`          int(11)                                                       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `title`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '新闻标题',
    `content`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         NULL COMMENT '新闻内容',
    `picture_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '图片url',
    `author`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '发布人',
    `view_count`  int(11)                                                       NULL     DEFAULT NULL COMMENT '浏览次数',
    `created_at`  timestamp(0)                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
    `updated_at`  timestamp(0)                                                  NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 103
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '新闻表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news`
VALUES (1, '新闻通知1', '111', '', 'admin', 1, '2023-03-14 11:06:09', '2023-03-15 17:39:40');
INSERT INTO `news`
VALUES (2, '新闻通知2', 'abcd', '', 'admin', 1, '2023-03-14 11:06:09', '2023-03-15 17:39:40');
INSERT INTO `news`
VALUES (3, '新闻通知3', 'abcde', '', 'admin', 1, '2023-03-14 11:06:09', '2023-03-15 17:39:40');


-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`
(
    `id`            int(11)                                                      NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_login_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录id，唯一',
    `location_id`   int(11)                                                      NULL     DEFAULT NULL COMMENT '地点id',
    `created_at`    timestamp(0)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
    `updated_at`    timestamp(0)                                                 NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 103
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record`
VALUES (11, 12134, 3, '2023-07-05 15:50:07', '2023-07-05 19:55:59');
INSERT INTO `record`
VALUES (12, 111222, 2, '2023-07-05 15:49:46', '2023-07-05 19:56:03');
INSERT INTO `record`
VALUES (103, 12134, 3, '2023-07-05 15:43:34', '2023-07-05 19:56:00');


SET FOREIGN_KEY_CHECKS = 1;


