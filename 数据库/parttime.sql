/*
Navicat MySQL Data Transfer

Source Server         : news
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : news

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2023-02-23 12:48:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activity_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `activity_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `activity_lable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `activity_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `activity_locale` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `activity_content` longtext COLLATE utf8mb4_bin,
  `activity_img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createtime` bigint(25) DEFAULT NULL,
  `activity_statetime` bigint(20) DEFAULT NULL,
  `activity_endtime` bigint(20) DEFAULT NULL,
  `updatetime` bigint(25) DEFAULT NULL,
  `activity_favour_num` int(10) DEFAULT NULL,
  `activity_num` int(10) DEFAULT NULL,
  `activity_read_num` int(10) DEFAULT NULL,
  `activity_state` int(10) DEFAULT NULL,
  `activity_istop` int(10) DEFAULT NULL,
  `ispublic` int(10) DEFAULT NULL,
  `activity_impose` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_createtime` bigint(25) DEFAULT NULL,
  `isfk` char(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `isgl` char(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `issh` char(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `isyh` char(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_state` char(2) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('69941670-b1d3-11ea-b59c-0367d155e2d0', 'admin', '3e1a8c4d35c7041a2704e9f1a044c50e', '管理员', '1592533186775', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `announcement_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `announcement_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `announcement_content` longtext COLLATE utf8mb4_bin,
  `announcement_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `content_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `announcement_createtime` bigint(25) DEFAULT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of announcement
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `article_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `article_introduction` longtext COLLATE utf8mb4_bin,
  `article_lable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `article_content` longtext COLLATE utf8mb4_bin,
  `article_createtime` bigint(25) DEFAULT NULL,
  `article_updatetime` bigint(25) DEFAULT NULL,
  `article_favour_num` int(25) DEFAULT NULL,
  `article_read_num` int(25) DEFAULT NULL,
  `article_state` int(25) DEFAULT NULL,
  `article_istop` int(25) DEFAULT NULL,
  `ispublic` int(25) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1a0990f0-b291-11ed-92f8-5747b2590a46', '31ab2740-b125-11ed-a5da-b5580e96bc7f', '哈哈哈', 0xE59388E59388E59388, '校园', 0x3C703EE59388E59388E593883C2F703E, '1677057150719', '1677057150719', '0', '103', '0', '0', '1', 'admin');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `carousel_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `carousel_img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `carousel_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `carousel_createtime` bigint(25) DEFAULT NULL,
  `carousel_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of carousel
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `username` varchar(255) DEFAULT NULL,
  `article_title` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('管理员', '哈哈哈');
INSERT INTO `collection` VALUES ('123', '1236');
INSERT INTO `collection` VALUES ('管理员', '哈哈哈哈');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `content_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `comment_content` longtext COLLATE utf8mb4_bin,
  `comment_createtime` bigint(25) DEFAULT NULL,
  `comment_favour_num` int(25) DEFAULT NULL,
  `comment_state` int(25) DEFAULT NULL,
  `comment_istop` int(25) DEFAULT NULL,
  `ispublic` int(25) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `company_scale` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `company_content` longtext COLLATE utf8mb4_bin,
  `company_createtime` bigint(25) DEFAULT NULL,
  `company_updatetime` bigint(25) DEFAULT NULL,
  `company_favour_num` int(25) DEFAULT NULL,
  `company_read_num` int(25) DEFAULT NULL,
  `company_state` int(25) DEFAULT NULL,
  `company_istop` int(25) DEFAULT NULL,
  `company_ispublic` int(25) DEFAULT NULL,
  `company_mail` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for fankui
-- ----------------------------
DROP TABLE IF EXISTS `fankui`;
CREATE TABLE `fankui` (
  `fankui_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fankui_content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fankui_user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fankui_createtime` bigint(25) DEFAULT NULL,
  `fankui_state` int(2) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of fankui
-- ----------------------------

-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help` (
  `help_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `help_title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `help_tag` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `help_lable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `help_content` longtext COLLATE utf8mb4_bin,
  `help_img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  `help_favour_num` int(11) DEFAULT NULL,
  `help_read_num` int(11) DEFAULT NULL,
  `help_state` int(11) DEFAULT NULL,
  `help_istop` int(11) DEFAULT NULL,
  `ispublic` int(11) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`help_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of help
-- ----------------------------

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `job_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `company_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_salary` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_num` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_lable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `job_content` longtext COLLATE utf8mb4_bin,
  `job_createtime` bigint(25) DEFAULT NULL,
  `job_updatetime` bigint(25) DEFAULT NULL,
  `job_favour_num` int(25) DEFAULT NULL,
  `job_read_num` int(25) DEFAULT NULL,
  `job_state` int(25) DEFAULT NULL,
  `job_istop` int(25) DEFAULT NULL,
  `ispublic` int(25) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of job
-- ----------------------------

-- ----------------------------
-- Table structure for joins
-- ----------------------------
DROP TABLE IF EXISTS `joins`;
CREATE TABLE `joins` (
  `join_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `describe` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `content_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jions_createtime` bigint(25) DEFAULT NULL,
  PRIMARY KEY (`join_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of joins
-- ----------------------------

-- ----------------------------
-- Table structure for jubao
-- ----------------------------
DROP TABLE IF EXISTS `jubao`;
CREATE TABLE `jubao` (
  `jubao_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jubao_content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jubao_user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jubao_img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jubao_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jubao_createtime` bigint(25) DEFAULT NULL,
  `jubao_state` int(2) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of jubao
-- ----------------------------

-- ----------------------------
-- Table structure for lable
-- ----------------------------
DROP TABLE IF EXISTS `lable`;
CREATE TABLE `lable` (
  `lable_id` char(255) COLLATE utf8mb4_bin NOT NULL,
  `lable_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `inputshow` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of lable
-- ----------------------------
INSERT INTO `lable` VALUES ('1', '文章分类', '[\"校园\",\"体育\",\"社团\"]', '0');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `notice_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `user_from` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_to` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `content_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `router` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createtime` bigint(25) DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `content_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for oldstuff
-- ----------------------------
DROP TABLE IF EXISTS `oldstuff`;
CREATE TABLE `oldstuff` (
  `oldstuff_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `oldstuff_img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `oldstuff_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `oldstuff_price` int(5) DEFAULT NULL,
  `oldstuff_content` longtext COLLATE utf8mb4_bin,
  `createtime` bigint(25) DEFAULT NULL,
  `oldstuff_lable` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updatetime` bigint(25) DEFAULT NULL,
  `oldstuff_favour_num` int(5) DEFAULT NULL,
  `oldstuff_read_num` int(5) DEFAULT NULL,
  `oldstuff_state` int(5) DEFAULT NULL,
  `oldstuff_istop` int(5) DEFAULT NULL,
  `ispublic` int(5) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of oldstuff
-- ----------------------------

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `comment_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `reply_content` longtext COLLATE utf8mb4_bin,
  `tousernickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `touserid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createtime` bigint(25) DEFAULT NULL,
  `reply_state` int(25) DEFAULT NULL,
  `reply_istop` int(25) DEFAULT NULL,
  `ispublic` int(25) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for shensu
-- ----------------------------
DROP TABLE IF EXISTS `shensu`;
CREATE TABLE `shensu` (
  `shensu_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shensu_content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shensu_user` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shensu_jubao_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shensu_createtime` bigint(25) DEFAULT NULL,
  `shensu_state` int(2) DEFAULT NULL,
  `admin` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of shensu
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `studentid` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `studentcard` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `realstate` int(2) DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mail` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `synopsis` longtext COLLATE utf8mb4_bin,
  `phone` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `companyname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `companyimg` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `companystate` int(2) DEFAULT NULL,
  `user_state` char(2) COLLATE utf8mb4_bin DEFAULT NULL,
  `user_createtime` bigint(25) DEFAULT NULL,
  `activationdate` bigint(25) DEFAULT NULL,
  `jubao_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('31ab2740-b125-11ed-a5da-b5580e96bc7f', 'a123456', 'db9c1bdba32bef6c015428bb1337b5ff', '管理员', null, null, null, '1', 'http://oss.guoang.xyz/morentouxiang.jpg', '', '', '', '', null, null, '1', '2', '1676900853556', null, null);
