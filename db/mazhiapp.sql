-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mazhiapp
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '马的名称',
  `images` varchar(255) DEFAULT NULL COMMENT '马的图片，多张图片以","隔开',
  `breed` varchar(32) DEFAULT NULL COMMENT '马的品种',
  `age` tinyint(4) DEFAULT NULL COMMENT '马的年龄',
  `info` varchar(255) DEFAULT NULL COMMENT '马的介绍',
  `status_health` tinyint(4) NOT NULL DEFAULT 0 COMMENT '马的健康状态 0健康 1生病 2死亡',
  `status_activity` tinyint(4) NOT NULL COMMENT '马的活动状态 0空闲 1使用中',
  `features` varchar(255) DEFAULT NULL COMMENT '马的特点',
  `tags` varchar(255) DEFAULT NULL COMMENT '马的标签，多个标签以","隔开',
  `special` varchar(255) DEFAULT NULL COMMENT '马的特别说明',
  `manager_user_id` int(11) NOT NULL DEFAULT current_timestamp() COMMENT '管理用户ID',
  `look_number` int(11) NOT NULL COMMENT '浏览人数',
  `use_number` int(11) NOT NULL COMMENT '使用次数',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse`
--

LOCK TABLES `horse` WRITE;
/*!40000 ALTER TABLE `horse` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse_apply`
--

DROP TABLE IF EXISTS `horse_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horse_id` int(11) NOT NULL COMMENT '马ID',
  `user_id` int(11) NOT NULL COMMENT '申请的用户ID',
  `approval_user_id` int(11) NOT NULL DEFAULT -1 COMMENT '审批用户ID 默认-1',
  `message` varchar(255) DEFAULT NULL COMMENT '留言',
  `start_time` char(9) NOT NULL COMMENT '每天开始的时间，格式：10:00:00',
  `end_time` char(9) NOT NULL COMMENT '每天结束时间',
  `start_date` char(10) NOT NULL COMMENT '开始日期，格式：2020-07-08',
  `end_date` char(10) NOT NULL COMMENT '结束日期',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse_apply`
--

LOCK TABLES `horse_apply` WRITE;
/*!40000 ALTER TABLE `horse_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse_appointment`
--

DROP TABLE IF EXISTS `horse_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horse_id` int(11) NOT NULL COMMENT '预约哪只马id',
  `user_id` int(11) NOT NULL COMMENT '预约的用户id',
  `approval_user_id` int(11) NOT NULL COMMENT '审批用户ID 默认-1',
  `start_datetime` varchar(20) NOT NULL COMMENT '开始的日期和时间，格式:2020-01-09 16:11:11',
  `end_datetime` varchar(20) NOT NULL COMMENT '结束时间和日期',
  `message` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse_appointment`
--

LOCK TABLES `horse_appointment` WRITE;
/*!40000 ALTER TABLE `horse_appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse_report`
--

DROP TABLE IF EXISTS `horse_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status_health` tinyint(4) NOT NULL DEFAULT 0 COMMENT '马的健康状态 0健康 1生病 2死亡',
  `status_activity` tinyint(4) NOT NULL COMMENT '马的活动状态 0空闲 1使用中',
  `heat` tinyint(4) NOT NULL COMMENT '体温，摄氏度',
  `locaion` varchar(255) NOT NULL COMMENT '当前位置，经度,维度',
  `address` varchar(255) NOT NULL COMMENT '当前地址',
  `kg` tinyint(4) NOT NULL COMMENT '重量，千克',
  `message` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse_report`
--

LOCK TABLES `horse_report` WRITE;
/*!40000 ALTER TABLE `horse_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse_signin`
--

DROP TABLE IF EXISTS `horse_signin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horse_signin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horse_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(36) DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) DEFAULT NULL COMMENT '经纬度，格式：经度,维度',
  `address` varchar(255) DEFAULT NULL COMMENT '地点名称',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse_signin`
--

LOCK TABLES `horse_signin` WRITE;
/*!40000 ALTER TABLE `horse_signin` DISABLE KEYS */;
/*!40000 ALTER TABLE `horse_signin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id，如果为0表示系统日志',
  `message` varchar(255) NOT NULL COMMENT '消息',
  `type` tinyint(4) NOT NULL COMMENT '日志类型',
  `loc` varchar(255) DEFAULT NULL COMMENT '代码位置',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 普通消息 1 用户反馈',
  `send_user_id` int(11) NOT NULL COMMENT '发送的用户ID 如果为0表示系统消息',
  `accpet_user_id` int(11) NOT NULL COMMENT '接受的用户ID 如果为0表示所有用户',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父ID',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `info` varchar(64) DEFAULT NULL COMMENT '角色介绍',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_apply`
--

DROP TABLE IF EXISTS `role_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '申请的用户',
  `role_id` int(11) NOT NULL COMMENT '申请的角色',
  `approval_user_id` int(11) NOT NULL DEFAULT -1 COMMENT '审批的用户ID，如果为-1 表示还没有审批 如果为0表示拒绝',
  `message` varchar(255) DEFAULT NULL COMMENT '留言',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_del` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`role_id`) USING BTREE COMMENT '一个用户只能申请一个角色'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_apply`
--

LOCK TABLES `role_apply` WRITE;
/*!40000 ALTER TABLE `role_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_power_router`
--

DROP TABLE IF EXISTS `role_power_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_power_router` (
  `role_id` int(11) NOT NULL,
  `router` varchar(255) NOT NULL COMMENT '路由',
  `is_allow` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否允许访问 默认 0（否）',
  `is_inherit` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否继承 默认1（是）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_power_router`
--

LOCK TABLES `role_power_router` WRITE;
/*!40000 ALTER TABLE `role_power_router` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_power_router` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `username` varchar(32) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT 'MD5密码',
  `nick` varchar(32) NOT NULL COMMENT '昵称',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `age` tinyint(4) DEFAULT NULL COMMENT '年龄',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别 0 男 1女 2 中性',
  `phone_number` varchar(11) DEFAULT NULL COMMENT '手机号',
  `affiliation` varchar(255) DEFAULT NULL COMMENT '所属集体',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新时间',
  `is_del` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `nick` (`nick`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `phone_number` (`phone_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-11  1:11:42
