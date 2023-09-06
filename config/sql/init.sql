-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (x86_64)
--
-- Host: 127.0.0.1    Database: ruoyu_nacos
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ruoyu_nacos`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ruoyu_nacos` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ruoyu_nacos`;

--
-- Table structure for table `config_info`
--

DROP TABLE IF EXISTS `config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
  `c_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8mb3_bin,
  `encrypted_data_key` text COLLATE utf8mb3_bin NOT NULL COMMENT 'ç§˜é’¥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info`
--

LOCK TABLES `config_info` WRITE;
/*!40000 ALTER TABLE `config_info` DISABLE KEYS */;
INSERT INTO `config_info` VALUES (1,'seataServer.properties','SEATA_GROUP','store.mode=db\n#-----db-----\nstore.db.datasource=druid\nstore.db.dbType=mysql\n# 需要根据mysql的版本调整driverClassName\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\nstore.db.url=jdbc:mysql://mysql:3306/ruoyu_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\nstore.db.user=root\nstore.db.password=root\n# 数据库初始连接数\nstore.db.minConn=1\n# 数据库最大连接数\nstore.db.maxConn=20\n# 获取连接时最大等待时间 默认5000，单位毫秒\nstore.db.maxWait=5000\n# 全局事务表名 默认global_table\nstore.db.globalTable=global_table\n# 分支事务表名 默认branch_table\nstore.db.branchTable=branch_table\n# 全局锁表名 默认lock_table\nstore.db.lockTable=lock_table\n# db模式Sever端事务管理全局锁存储表名\nstore.db.distributedLockTable=distributed_lock\n# 查询全局事务一次的最大条数 默认100\nstore.db.queryLimit=100\n\n\n# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo\nserver.undo.logSaveDays=365\n# undo清理线程间隔时间 默认86400000，单位毫秒\nserver.undo.logDeletePeriod=86400000\n# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试\n# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试\n# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用\nserver.maxCommitRetryTimeout=-1\n# 二阶段回滚重试超时时长\nserver.maxRollbackRetryTimeout=-1\n# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒\nserver.recovery.committingRetryPeriod=1000\n# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒\nserver.recovery.asynCommittingRetryPeriod=1000\n# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒\nserver.recovery.rollbackingRetryPeriod=1000\n# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器\nserver.recovery.timeoutRetryPeriod=1000','b4b0264117d0ded46db26bb016b92655','2023-07-19 14:18:40','2023-07-19 14:18:40',NULL,'192.168.228.1','','seata-server',NULL,NULL,NULL,'properties',NULL,''),(6,'seataServer.properties','seata','store.mode=db\n#-----db-----\nstore.db.datasource=druid\nstore.db.dbType=mysql\n# 需要根据mysql的版本调整driverClassName\n# mysql8及以上版本对应的driver：com.mysql.cj.jdbc.Driver\n# mysql8以下版本的driver：com.mysql.jdbc.Driver\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\nstore.db.url=jdbc:mysql://mysql:3306/ruoyu_seata?useUnicode=true&characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useSSL=false\nstore.db.user=root\nstore.db.password=root\n# 数据库初始连接数\nstore.db.minConn=1\n# 数据库最大连接数\nstore.db.maxConn=20\n# 获取连接时最大等待时间 默认5000，单位毫秒\nstore.db.maxWait=5000\n# 全局事务表名 默认global_table\nstore.db.globalTable=global_table\n# 分支事务表名 默认branch_table\nstore.db.branchTable=branch_table\n# 全局锁表名 默认lock_table\nstore.db.lockTable=lock_table\n# db模式Sever端事务管理全局锁存储表名\nstore.db.distributedLockTable=distributed_lock\n# 查询全局事务一次的最大条数 默认100\nstore.db.queryLimit=100\n\n\n# undo保留天数 默认7天,log_status=1（附录3）和未正常清理的undo\nserver.undo.logSaveDays=365\n# undo清理线程间隔时间 默认86400000，单位毫秒\nserver.undo.logDeletePeriod=86400000\n# 二阶段提交重试超时时长 单位ms,s,m,h,d,对应毫秒,秒,分,小时,天,默认毫秒。默认值-1表示无限重试\n# 公式: timeout>=now-globalTransactionBeginTime,true表示超时则不再重试\n# 注: 达到超时时间后将不会做任何重试,有数据不一致风险,除非业务自行可校准数据,否者慎用\nserver.maxCommitRetryTimeout=-1\n# 二阶段回滚重试超时时长\nserver.maxRollbackRetryTimeout=-1\n# 二阶段提交未完成状态全局事务重试提交线程间隔时间 默认1000，单位毫秒\nserver.recovery.committingRetryPeriod=1000\n# 二阶段异步提交状态重试提交线程间隔时间 默认1000，单位毫秒\nserver.recovery.asynCommittingRetryPeriod=1000\n# 二阶段回滚状态重试回滚线程间隔时间  默认1000，单位毫秒\nserver.recovery.rollbackingRetryPeriod=1000\n# 超时状态检测重试线程间隔时间 默认1000，单位毫秒，检测出超时将全局事务置入回滚会话管理器\nserver.recovery.timeoutRetryPeriod=1000','b4b0264117d0ded46db26bb016b92655','2023-08-01 13:55:17','2023-08-01 13:55:17',NULL,'192.168.228.1','','ruoyu',NULL,NULL,NULL,'properties',NULL,''),(7,'common-service.yml','DEFAULT_GROUP','server:\n  servlet:\n    context-path: /${spring.application.name}\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: ${spring.cloud.nacos.config.server-addr}\n        namespace: ${spring.cloud.nacos.config.namespace}\n    openfeign:\n      client:\n        config:\n          default:\n            connectTimeout: 5000\n            readTimeout: 5000\n      compression:\n        request:\n          enabled: true\n        response:\n          enabled: true\n  data:\n    redis:\n      host: 127.0.0.1\n      port: 6379\n      password: root\n','6ce1effb020dd747f4604c447e0860c1','2023-08-04 08:35:56','2023-08-24 14:28:46',NULL,'192.168.228.1','','ruoyu','','','','yaml','',''),(9,'ruoyu-order-flow','DEFAULT_GROUP','[\n    {\n        \"resource\": \"/order\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1.0,\n        \"strategy\": 0,\n        \"refResource\": \"demoData\",\n        \"controlBehavior\": 0,\n        \"warmUpPeriodSec\": 1,\n        \"maxQueueingTimeMs\": 1,\n        \"clusterMode\": false\n    }\n]','98af83cc5445ceddb118fa9cc46d6f9f','2023-09-01 14:19:13','2023-09-04 16:33:24',NULL,'192.168.228.1','','ruoyu','','','','json','',''),(10,'ruoyu-order-degrade','DEFAULT_GROUP','[\n    {\n        \"resource\": \"/order\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1.0,\n        \"timeWindow\": 1,\n        \"minRequestAmount\": 1,\n        \"slowRatioThreshold\": 1.0,\n        \"statIntervalMs\": 1\n    }\n]','a8b7d62be18daeef989ccd2c3fd1d8a8','2023-09-01 14:20:31','2023-09-01 14:20:31',NULL,'192.168.228.1','','ruoyu',NULL,NULL,NULL,'json',NULL,'');
/*!40000 ALTER TABLE `config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_aggr`
--

DROP TABLE IF EXISTS `config_info_aggr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_aggr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'å†…å®¹',
  `gmt_modified` datetime NOT NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='å¢žåŠ ç§Ÿæˆ·å­—æ®µ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_aggr`
--

LOCK TABLES `config_info_aggr` WRITE;
/*!40000 ALTER TABLE `config_info_aggr` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_aggr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_beta`
--

DROP TABLE IF EXISTS `config_info_beta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_beta` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
  `encrypted_data_key` text COLLATE utf8mb3_bin NOT NULL COMMENT 'ç§˜é’¥',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_beta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_beta`
--

LOCK TABLES `config_info_beta` WRITE;
/*!40000 ALTER TABLE `config_info_beta` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_beta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_info_tag`
--

DROP TABLE IF EXISTS `config_info_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_info_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
  `src_user` text COLLATE utf8mb3_bin COMMENT 'source user',
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_info_tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_info_tag`
--

LOCK TABLES `config_info_tag` WRITE;
/*!40000 ALTER TABLE `config_info_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_info_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_tags_relation`
--

DROP TABLE IF EXISTS `config_tags_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_tags_relation` (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='config_tag_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_tags_relation`
--

LOCK TABLES `config_tags_relation` WRITE;
/*!40000 ALTER TABLE `config_tags_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_tags_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_capacity`
--

DROP TABLE IF EXISTS `group_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®ID',
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group IDï¼Œç©ºå­—ç¬¦è¡¨ç¤ºæ•´ä¸ªé›†ç¾¤',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT 'é…é¢ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT 'ä½¿ç”¨é‡',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT 'å•ä¸ªé…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'èšåˆå­é…ç½®æœ€å¤§ä¸ªæ•°ï¼Œï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT 'å•ä¸ªèšåˆæ•°æ®çš„å­é…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'æœ€å¤§å˜æ›´åŽ†å²æ•°é‡',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='é›†ç¾¤ã€å„Groupå®¹é‡ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_capacity`
--

LOCK TABLES `group_capacity` WRITE;
/*!40000 ALTER TABLE `group_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `his_config_info`
--

DROP TABLE IF EXISTS `his_config_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `his_config_info` (
  `id` bigint unsigned NOT NULL,
  `nid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8mb3_bin,
  `src_ip` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8mb3_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'ç§Ÿæˆ·å­—æ®µ',
  `encrypted_data_key` text COLLATE utf8mb3_bin NOT NULL COMMENT 'ç§˜é’¥',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='å¤šç§Ÿæˆ·æ”¹é€ ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `his_config_info`
--

LOCK TABLES `his_config_info` WRITE;
/*!40000 ALTER TABLE `his_config_info` DISABLE KEYS */;
INSERT INTO `his_config_info` VALUES (7,12,'common-service.yml','DEFAULT_GROUP','','server:\n  servlet:\n    context-path: /${spring.application.name}\nspring:\n  application:\n    name: ruoyu-order\n  cloud:\n    nacos:\n      discovery:\n        server-addr: ${spring.cloud.nacos.config.server-addr}\n        namespace: ${spring.cloud.nacos.config.namespace}\n    openfeign:\n      client:\n        config:\n          default:\n            connectTimeout: 5000\n            readTimeout: 5000\n      compression:\n        request:\n          enabled: true\n        response:\n          enabled: true\n  data:\n    redis:\n      host: 127.0.0.1\n      port: 6379\n      password: root\n','c09f4744b6815dc3c4da8d626259387d','2023-08-24 14:28:46','2023-08-24 14:28:46',NULL,'192.168.228.1','U','ruoyu',''),(0,13,'ruoyu-order-flow','DEFAULT_GROUP','','[\n    {\n        \"resource\": \"/order\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1.0,\n        \"strategy\": 0,\n        \"refResource\": \"demoData\",\n        \"controlBehavior\": 1,\n        \"warmUpPeriodSec\": 1,\n        \"maxQueueingTimeMs\": 1,\n        \"clusterMode\": false\n    }\n]','5a1c5827f3478a74ebdc6de322f7aeef','2023-09-01 14:19:12','2023-09-01 14:19:13',NULL,'192.168.228.1','I','ruoyu',''),(0,14,'ruoyu-order-degrade','DEFAULT_GROUP','','[\n    {\n        \"resource\": \"/order\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1.0,\n        \"timeWindow\": 1,\n        \"minRequestAmount\": 1,\n        \"slowRatioThreshold\": 1.0,\n        \"statIntervalMs\": 1\n    }\n]','a8b7d62be18daeef989ccd2c3fd1d8a8','2023-09-01 14:20:30','2023-09-01 14:20:31',NULL,'192.168.228.1','I','ruoyu',''),(9,15,'ruoyu-order-flow','DEFAULT_GROUP','','[\n    {\n        \"resource\": \"/order\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1.0,\n        \"strategy\": 0,\n        \"refResource\": \"demoData\",\n        \"controlBehavior\": 1,\n        \"warmUpPeriodSec\": 1,\n        \"maxQueueingTimeMs\": 1,\n        \"clusterMode\": false\n    }\n]','5a1c5827f3478a74ebdc6de322f7aeef','2023-09-04 16:33:25','2023-09-04 16:33:24',NULL,'192.168.228.1','U','ruoyu','');
/*!40000 ALTER TABLE `his_config_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('nacos','ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_capacity`
--

DROP TABLE IF EXISTS `tenant_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_capacity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ä¸»é”®ID',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int unsigned NOT NULL DEFAULT '0' COMMENT 'é…é¢ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `usage` int unsigned NOT NULL DEFAULT '0' COMMENT 'ä½¿ç”¨é‡',
  `max_size` int unsigned NOT NULL DEFAULT '0' COMMENT 'å•ä¸ªé…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `max_aggr_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'èšåˆå­é…ç½®æœ€å¤§ä¸ªæ•°',
  `max_aggr_size` int unsigned NOT NULL DEFAULT '0' COMMENT 'å•ä¸ªèšåˆæ•°æ®çš„å­é…ç½®å¤§å°ä¸Šé™ï¼Œå•ä½ä¸ºå­—èŠ‚ï¼Œ0è¡¨ç¤ºä½¿ç”¨é»˜è®¤å€¼',
  `max_history_count` int unsigned NOT NULL DEFAULT '0' COMMENT 'æœ€å¤§å˜æ›´åŽ†å²æ•°é‡',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'åˆ›å»ºæ—¶é—´',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ä¿®æ”¹æ—¶é—´',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='ç§Ÿæˆ·å®¹é‡ä¿¡æ¯è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_capacity`
--

LOCK TABLES `tenant_capacity` WRITE;
/*!40000 ALTER TABLE `tenant_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_info`
--

DROP TABLE IF EXISTS `tenant_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8mb3_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8mb3_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `gmt_modified` bigint NOT NULL COMMENT 'ä¿®æ”¹æ—¶é—´',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='tenant_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_info`
--

LOCK TABLES `tenant_info` WRITE;
/*!40000 ALTER TABLE `tenant_info` DISABLE KEYS */;
INSERT INTO `tenant_info` VALUES (4,'1','ruoyu','ruoyu','ruoyu','nacos',1690869076624,1690869076624);
/*!40000 ALTER TABLE `tenant_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nacos','$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ruoyu_order`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ruoyu_order` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ruoyu_order`;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` decimal(16,4) NOT NULL,
  `create_time` bigint unsigned NOT NULL,
  `update_time` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` VALUES (1,1,'','','',1.0000,1691041099655,1691041099655),(2,1,'','','',1.0000,1691041131053,1691041131053),(3,1,'','','',1.0000,1691048568085,1691048568085),(4,1,'','','',1.0000,1691048870281,1691048870281),(5,1,'','','',1.0000,1691048890524,1691048890524),(6,1,'','','',1.0000,1691049105585,1691049105585),(7,1,'','','',1.0000,1691049145494,1691049145494),(8,1,'','','',1.0000,1691049216875,1691049216875),(9,1,'','','',1.0000,1691049280742,1691049280742),(10,1,'','','',1.0000,1691049621195,1691049621195),(11,1,'','','',1.0000,1691049795378,1691049795378),(12,1,'','','',1.0000,1691050463101,1691050463101),(13,1,'','','',1.0000,1691113656597,1691113656597),(14,1,'','','',1.0000,1691113699698,1691113699698),(15,1,'','','',1.0000,1691496316884,1691496316884),(16,1,'','','',1.0000,1691500287872,1691500287872),(17,1,'','','',1.0000,1691744988439,1691744988439),(18,1,'','','',1.0000,1693470377083,1693470377083),(19,1,'','','',1.0000,1693470377730,1693470377730),(20,1,'','','',1.0000,1693470378798,1693470378798),(21,1,'','','',1.0000,1693470379819,1693470379819),(22,1,'','','',1.0000,1693470419609,1693470419609),(23,1,'','','',1.0000,1693470422032,1693470422032),(24,1,'','','',1.0000,1693470423692,1693470423692),(25,1,'','','',1.0000,1693470424691,1693470424691),(26,1,'','','',1.0000,1693470425608,1693470425608),(27,1,'','','',1.0000,1693470647618,1693470647618),(28,1,'','','',1.0000,1693470673918,1693470673918),(29,1,'','','',1.0000,1693470675816,1693470675816),(30,1,'','','',1.0000,1693470676275,1693470676275),(31,1,'','','',1.0000,1693470676688,1693470676688),(32,1,'','','',1.0000,1693470677187,1693470677187),(33,1,'','','',1.0000,1693470677552,1693470677552),(34,1,'','','',1.0000,1693470678803,1693470678803),(35,1,'','','',1.0000,1693473977728,1693473977728),(36,1,'','','',1.0000,1693474477022,1693474477022),(37,1,'','','',1.0000,1693474478065,1693474478065),(38,1,'','','',1.0000,1693474481599,1693474481599),(39,1,'','','',1.0000,1693474483521,1693474483521),(40,1,'','','',1.0000,1693816456118,1693816456118),(41,1,'','','',1.0000,1693816561390,1693816561390),(42,1,'','','',1.0000,1693816927646,1693816927646),(43,1,'','','',1.0000,1693818229299,1693818229299),(44,1,'','','',1.0000,1693818282630,1693818282630),(45,1,'','','',1.0000,1693820512173,1693820512173),(46,1,'','','',1.0000,1693821633643,1693821633643),(47,1,'','','',1.0000,1693875932304,1693875932304),(48,1,'','','',1.0000,1693877368004,1693877368004),(49,1,'','','',1.0000,1693877582799,1693877582799),(50,1,'','','',1.0000,1693879003674,1693879003674),(51,1,'','','',1.0000,1693882243582,1693882243582);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_info_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` decimal(16,4) NOT NULL,
  `product_count` int unsigned NOT NULL,
  `create_time` bigint unsigned NOT NULL,
  `update_time` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,'苹果手机',5999.0000,1,1691041099655,1691041099655),(2,2,1,'苹果手机',5999.0000,1,1691041131053,1691041131053),(3,3,1,'苹果手机',5999.0000,1,1691048568085,1691048568085),(4,4,1,'苹果手机',5999.0000,1,1691048870281,1691048870281),(5,5,1,'苹果手机',5999.0000,1,1691048890524,1691048890524),(6,6,1,'苹果手机',5999.0000,1,1691049105585,1691049105585),(7,7,1,'苹果手机',5999.0000,1,1691049145494,1691049145494),(8,8,1,'苹果手机',5999.0000,1,1691049216875,1691049216875),(9,9,1,'苹果手机',5999.0000,1,1691049280742,1691049280742),(10,10,1,'苹果手机',5999.0000,1,1691049621195,1691049621195),(11,11,1,'苹果手机',5999.0000,1,1691049795378,1691049795378),(12,12,1,'苹果手机',5999.0000,1,1691050463101,1691050463101),(13,13,1,'苹果手机',5999.0000,1,1691113656597,1691113656597),(14,14,1,'苹果手机',5999.0000,1,1691113699698,1691113699698),(15,15,1,'苹果手机',5999.0000,1,1691496316884,1691496316884),(16,16,1,'苹果手机',5999.0000,1,1691500287872,1691500287872),(17,17,1,'苹果手机',5999.0000,1,1691744988439,1691744988439),(18,18,1,'苹果手机',5999.0000,1,1693470377083,1693470377083),(19,19,1,'苹果手机',5999.0000,1,1693470377730,1693470377730),(20,20,1,'苹果手机',5999.0000,1,1693470378798,1693470378798),(21,21,1,'苹果手机',5999.0000,1,1693470379819,1693470379819),(22,22,1,'苹果手机',5999.0000,1,1693470419609,1693470419609),(23,23,1,'苹果手机',5999.0000,1,1693470422032,1693470422032),(24,24,1,'苹果手机',5999.0000,1,1693470423692,1693470423692),(25,25,1,'苹果手机',5999.0000,1,1693470424691,1693470424691),(26,26,1,'苹果手机',5999.0000,1,1693470425608,1693470425608),(27,27,1,'苹果手机',5999.0000,1,1693470647618,1693470647618),(28,28,1,'苹果手机',5999.0000,1,1693470673918,1693470673918),(29,29,1,'苹果手机',5999.0000,1,1693470675816,1693470675816),(30,30,1,'苹果手机',5999.0000,1,1693470676275,1693470676275),(31,31,1,'苹果手机',5999.0000,1,1693470676688,1693470676688),(32,32,1,'苹果手机',5999.0000,1,1693470677187,1693470677187),(33,33,1,'苹果手机',5999.0000,1,1693470677552,1693470677552),(34,34,1,'苹果手机',5999.0000,1,1693470678803,1693470678803),(35,35,1,'苹果手机',5999.0000,1,1693473977728,1693473977728),(36,36,1,'苹果手机',5999.0000,1,1693474477022,1693474477022),(37,37,1,'苹果手机',5999.0000,1,1693474478065,1693474478065),(38,38,1,'苹果手机',5999.0000,1,1693474481599,1693474481599),(39,39,1,'苹果手机',5999.0000,1,1693474483521,1693474483521),(40,40,1,'苹果手机',5999.0000,1,1693816456118,1693816456118),(41,41,1,'苹果手机',5999.0000,1,1693816561390,1693816561390),(42,42,1,'苹果手机',5999.0000,1,1693816927646,1693816927646),(43,43,1,'苹果手机',5999.0000,1,1693818229299,1693818229299),(44,44,1,'苹果手机',5999.0000,1,1693818282630,1693818282630),(45,45,1,'苹果手机',5999.0000,1,1693820512173,1693820512173),(46,46,1,'苹果手机',5999.0000,1,1693821633643,1693821633643),(47,47,1,'苹果手机',5999.0000,1,1693875932304,1693875932304),(48,48,1,'苹果手机',5999.0000,1,1693877368004,1693877368004),(49,49,1,'苹果手机',5999.0000,1,1693877582799,1693877582799),(50,50,1,'苹果手机',5999.0000,1,1693879003674,1693879003674),(51,51,1,'苹果手机',5999.0000,1,1693882243582,1693882243582);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ruoyu_product`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ruoyu_product` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ruoyu_product`;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` decimal(16,4) NOT NULL,
  `product_stock` int unsigned NOT NULL,
  `create_time` bigint unsigned NOT NULL,
  `update_time` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'苹果手机',5999.0000,43,1691030466000,1693882243554);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ruoyu_seata`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ruoyu_seata` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ruoyu_seata`;

--
-- Table structure for table `branch_table`
--

DROP TABLE IF EXISTS `branch_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_table` (
  `branch_id` bigint NOT NULL,
  `xid` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_id` bigint DEFAULT NULL,
  `resource_group_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resource_id` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `branch_type` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `client_id` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `application_data` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime(6) DEFAULT NULL,
  `gmt_modified` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `idx_xid` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_table`
--

LOCK TABLES `branch_table` WRITE;
/*!40000 ALTER TABLE `branch_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributed_lock`
--

DROP TABLE IF EXISTS `distributed_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributed_lock` (
  `lock_key` char(20) COLLATE utf8mb4_general_ci NOT NULL,
  `lock_value` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `expire` bigint DEFAULT NULL,
  PRIMARY KEY (`lock_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributed_lock`
--

LOCK TABLES `distributed_lock` WRITE;
/*!40000 ALTER TABLE `distributed_lock` DISABLE KEYS */;
INSERT INTO `distributed_lock` VALUES ('AsyncCommitting',' ',0),('RetryCommitting',' ',0),('RetryRollbacking',' ',0),('TxTimeoutCheck',' ',0),('UndologDelete',' ',0);
/*!40000 ALTER TABLE `distributed_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_table`
--

DROP TABLE IF EXISTS `global_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_table` (
  `xid` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_id` bigint DEFAULT NULL,
  `status` tinyint NOT NULL,
  `application_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_service_group` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `timeout` int DEFAULT NULL,
  `begin_time` bigint DEFAULT NULL,
  `application_data` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`xid`),
  KEY `idx_status_gmt_modified` (`status`,`gmt_modified`),
  KEY `idx_transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_table`
--

LOCK TABLES `global_table` WRITE;
/*!40000 ALTER TABLE `global_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_table`
--

DROP TABLE IF EXISTS `lock_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_table` (
  `row_key` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `xid` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id` bigint DEFAULT NULL,
  `branch_id` bigint NOT NULL,
  `resource_id` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_name` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pk` varchar(36) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0:locked ,1:rollbacking',
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`row_key`),
  KEY `idx_status` (`status`),
  KEY `idx_branch_id` (`branch_id`),
  KEY `idx_xid` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_table`
--

LOCK TABLES `lock_table` WRITE;
/*!40000 ALTER TABLE `lock_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ruoyu_user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ruoyu_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ruoyu_user`;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_pwd` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_status` tinyint unsigned NOT NULL,
  `create_time` bigint unsigned NOT NULL,
  `update_time` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'name','123','1982022','广东',1,1690859752000,1690859752000);
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

-- Dump completed on 2023-09-05 11:03:43
