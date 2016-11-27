-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: 121db_new
-- ------------------------------------------------------
-- Server version	5.5.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_activity`
--

DROP TABLE IF EXISTS `app_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_activity` (
  `id` int(11) NOT NULL DEFAULT '0',
  `app_module_id` int(11) DEFAULT NULL,
  `activity_code` varchar(20) DEFAULT NULL,
  `activity_name` varchar(30) DEFAULT NULL,
  `activity_desc` varchar(160) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_activity`
--

LOCK TABLES `app_activity` WRITE;
/*!40000 ALTER TABLE `app_activity` DISABLE KEYS */;
INSERT INTO `app_activity` VALUES (1,3,'app-catalogs','应用目录','应用目录资源及相关处理','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(2,3,'app-orders','应用购买订单','应用购买订单及相关处理','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(3,1,'psc-order-status','采购订单状态','应用采购订单状态及相关处理','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(4,1,'psc-order-price','采购订单价格','应用采购订单价格及相关处理','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(5,2,'sdc-order-status','销售订单状态','应用销售订单状态及相关处理','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(6,2,'sdc-order-price','销售订单价格','应用销售订单价格及相关处理','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_app_rel`
--

DROP TABLE IF EXISTS `app_app_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_app_rel` (
  `biz_role_rel` int(11) NOT NULL,
  `app_module_id` int(11) NOT NULL,
  `partner_app_module_id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`app_module_id`,`biz_role_rel`,`partner_app_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_app_rel`
--

LOCK TABLES `app_app_rel` WRITE;
/*!40000 ALTER TABLE `app_app_rel` DISABLE KEYS */;
INSERT INTO `app_app_rel` VALUES (1,2,3,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_app_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_biz_role`
--

DROP TABLE IF EXISTS `app_biz_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_biz_role` (
  `app_module_id` int(11) NOT NULL,
  `biz_role_id` int(11) NOT NULL,
  `is_master` tinyint(1) DEFAULT '0',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`app_module_id`,`biz_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_biz_role`
--

LOCK TABLES `app_biz_role` WRITE;
/*!40000 ALTER TABLE `app_biz_role` DISABLE KEYS */;
INSERT INTO `app_biz_role` VALUES (5,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(6,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(7,2,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_biz_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_biz_role_rel`
--

DROP TABLE IF EXISTS `app_biz_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_biz_role_rel` (
  `app_module_id` int(11) NOT NULL DEFAULT '0',
  `biz_role_rel_id` int(11) NOT NULL DEFAULT '0',
  `is_reverse` tinyint(1) NOT NULL DEFAULT '0',
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`app_module_id`,`biz_role_rel_id`,`is_reverse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_biz_role_rel`
--

LOCK TABLES `app_biz_role_rel` WRITE;
/*!40000 ALTER TABLE `app_biz_role_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_biz_role_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_feature`
--

DROP TABLE IF EXISTS `app_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_feature` (
  `id` int(11) NOT NULL DEFAULT '0',
  `app_module_id` int(11) DEFAULT NULL,
  `app_version_id` int(11) DEFAULT NULL,
  `feature_code` varchar(20) DEFAULT NULL,
  `feature_name` varchar(30) DEFAULT NULL,
  `feature_desc` varchar(160) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1app_biz_feature` (`feature_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_feature`
--

LOCK TABLES `app_feature` WRITE;
/*!40000 ALTER TABLE `app_feature` DISABLE KEYS */;
INSERT INTO `app_feature` VALUES (1,1,NULL,'PSC_STATUS','采购协同订单状态协同','采购协同订单状态协同描述',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(2,1,NULL,'PSC_PRICE','采购协同订单价格协同','采购协同订单价格协同描述',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(3,2,NULL,'SDC_STATUS','销售协同订单状态协同','销售协同订单状态协同描述',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(4,2,NULL,'SDC_PRICE','销售协同订单价格协同','销售协同订单价格协同描述',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_feature_activity`
--

DROP TABLE IF EXISTS `app_feature_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_feature_activity` (
  `id` char(18) NOT NULL DEFAULT '',
  `app_feature_id` int(11) DEFAULT NULL,
  `app_activity_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_feature_activity`
--

LOCK TABLES `app_feature_activity` WRITE;
/*!40000 ALTER TABLE `app_feature_activity` DISABLE KEYS */;
INSERT INTO `app_feature_activity` VALUES ('1',1,3,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL),('2',2,4,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL),('3',3,5,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL),('4',4,6,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_feature_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_inst_acct_rel`
--

DROP TABLE IF EXISTS `app_inst_acct_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_inst_acct_rel` (
  `org_acct_id` int(11) NOT NULL DEFAULT '0',
  `app_module_id` int(11) NOT NULL DEFAULT '0',
  `biz_role_rel_id` int(11) NOT NULL DEFAULT '0',
  `is_reverse` tinyint(1) NOT NULL DEFAULT '0',
  `to_org_acct_id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`org_acct_id`,`app_module_id`,`biz_role_rel_id`,`is_reverse`,`to_org_acct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_inst_acct_rel`
--

LOCK TABLES `app_inst_acct_rel` WRITE;
/*!40000 ALTER TABLE `app_inst_acct_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_inst_acct_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_module`
--

DROP TABLE IF EXISTS `app_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_module` (
  `id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `short_desc` varchar(160) DEFAULT NULL,
  `long_desc` varchar(500) DEFAULT NULL,
  `app_type_code` varchar(20) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `XAK1app_module` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_module`
--

LOCK TABLES `app_module` WRITE;
/*!40000 ALTER TABLE `app_module` DISABLE KEYS */;
INSERT INTO `app_module` VALUES (1,'app-shopping','应用购买','提供应用及应用购买相关服务。','长描述：提供应用及应用购买相关服务。','REQUIRED','A',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(5,'ocr-goods-center','商品中心','121全渠道分销零售-商品中心',NULL,'OPTIONAL','A',0,NULL,NULL,NULL,NULL,NULL),(6,'ocr-channel-manager','渠道管理','121全渠道分销零售-渠道管理',NULL,'OPTIONAL','A',NULL,NULL,NULL,NULL,NULL,NULL),(7,'ocr-sales-center','营销中心','121全渠道分销零售-营销中心',NULL,'OPTIONAL','A',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_module_info_extra`
--

DROP TABLE IF EXISTS `app_module_info_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_module_info_extra` (
  `id` int(11) NOT NULL DEFAULT '0',
  `app_module_id` int(11) DEFAULT NULL,
  `app_module_info_item_id` int(11) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `item_value` varchar(160) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1app_module_info_extra` (`app_module_id`,`app_module_info_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_module_info_extra`
--

LOCK TABLES `app_module_info_extra` WRITE;
/*!40000 ALTER TABLE `app_module_info_extra` DISABLE KEYS */;
INSERT INTO `app_module_info_extra` VALUES (1,1,1,1,'psc_large_1.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(2,1,1,2,'psc_large_2.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(3,1,1,3,'psc_large_3.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(4,1,2,1,'psc_medium_1.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(5,1,2,2,'psc_medium_2.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(6,1,3,1,'psc_small_1.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(7,1,4,1,'采购协同功能1',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(8,1,4,2,'采购协同功能2',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(9,1,4,3,'采购协同功能3',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(10,1,4,4,'采购协同功能4',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(21,2,1,1,'sdc_large_1.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(22,2,1,2,'sdc_large_2.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(23,2,1,3,'sdc_large_3.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(24,2,2,1,'sdc_medium_1.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(25,2,2,2,'sdc_medium_2.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(26,2,3,1,'sdc_small_1.jpg',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(27,2,4,1,'销售协同功能1',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(28,2,4,2,'销售协同功能2',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(29,2,4,3,'销售协同功能3',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(30,2,4,4,'销售协同功能4',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_module_info_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_module_info_item`
--

DROP TABLE IF EXISTS `app_module_info_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_module_info_item` (
  `id` int(11) NOT NULL DEFAULT '0',
  `segment_name` varchar(30) DEFAULT NULL,
  `item_name` varchar(30) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `data_type` varchar(30) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_module_info_item`
--

LOCK TABLES `app_module_info_item` WRITE;
/*!40000 ALTER TABLE `app_module_info_item` DISABLE KEYS */;
INSERT INTO `app_module_info_item` VALUES (1,'IMAGES','LARGE',1,'S','A',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(2,'IMAGES','MEDIUM',2,'S','A',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(3,'IMAGES','SMALL',3,'S','A',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(4,'SPECIFICATION','FUNCTION',4,'S','A',0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_module_info_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_module_pkg`
--

DROP TABLE IF EXISTS `app_module_pkg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_module_pkg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_module_id` int(11) DEFAULT NULL,
  `pkg_name` varchar(30) DEFAULT NULL,
  `pkg_desc` varchar(160) DEFAULT NULL,
  `group_id` varchar(30) DEFAULT NULL,
  `artifact_id` varchar(30) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_module_pkg`
--

LOCK TABLES `app_module_pkg` WRITE;
/*!40000 ALTER TABLE `app_module_pkg` DISABLE KEYS */;
INSERT INTO `app_module_pkg` VALUES (3,NULL,'应用购买','完成应用购买及应用查询','otocloud','otocloud-app-shopping',0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_module_pkg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_operation`
--

DROP TABLE IF EXISTS `app_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_operation` (
  `id` int(11) NOT NULL DEFAULT '0',
  `app_activity_id` int(11) DEFAULT NULL,
  `http_method` varchar(20) DEFAULT NULL,
  `operation_desc` varchar(160) DEFAULT NULL,
  `input_desc` varchar(160) DEFAULT NULL,
  `output_desc` varchar(160) DEFAULT NULL,
  `rest_url` varchar(60) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `XAK1app_operation` (`app_activity_id`,`http_method`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_operation`
--

LOCK TABLES `app_operation` WRITE;
/*!40000 ALTER TABLE `app_operation` DISABLE KEYS */;
INSERT INTO `app_operation` VALUES (1,1,'GET','返回应用目录列表','无','应用目录JSON数组','/app-shopping/app-catalogs/:id','A','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(2,2,'GET','返回用户订单列表','用户帐户编号','该账户下用户订单JSON数组','/api/app-orders','A','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(3,2,'PUT','提交新的或修改已有订单','用户订单','返回新增的或已修成功的订单','/api/app-orders','A','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL),(4,2,'DELETE','删除订单','用户帐户号和订单编号。','删除订单的ID编号。','/api/app-orders','A','2015-11-18 15:19:08',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order_detail`
--

DROP TABLE IF EXISTS `app_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_order_header_id` int(11) DEFAULT NULL,
  `app_module_id` int(11) DEFAULT NULL,
  `app_feature_id` int(11) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `extended_price` decimal(9,2) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order_detail`
--

LOCK TABLES `app_order_detail` WRITE;
/*!40000 ALTER TABLE `app_order_detail` DISABLE KEYS */;
INSERT INTO `app_order_detail` VALUES (1,1,2,NULL,3000.00,1,3000.00,0,'2015-11-18 16:17:52',NULL,NULL,NULL,NULL),(2,1,2,3,1500.00,1,1500.00,0,'2015-11-18 16:17:52',NULL,NULL,NULL,NULL),(3,2,1,NULL,8000.00,1,8000.00,0,'2015-11-18 16:17:52',NULL,NULL,NULL,NULL),(4,3,1,1,4500.00,1,4500.00,0,'2015-11-18 16:17:52',511,'2015-11-26 14:24:10',511,'2015-11-26 14:24:11'),(5,3,2,3,3000.00,1,3000.00,0,'2015-11-18 16:17:52',511,'2015-11-26 14:24:10',511,'2015-11-26 14:24:11'),(6,4,1,NULL,600.00,1,600.00,0,'2015-11-18 16:17:52',99,'2015-11-26 14:24:11',99,'2015-11-26 14:24:11'),(7,4,2,3,1500.00,1,1500.00,0,'2015-11-18 16:17:52',99,'2015-11-26 14:24:11',99,'2015-11-26 14:24:11'),(88,36,1,NULL,5500.00,1,5500.00,511,'2015-11-25 12:06:04',NULL,NULL,NULL,NULL),(89,36,2,3,1000.00,1,1000.00,511,'2015-11-25 12:06:04',NULL,NULL,NULL,NULL),(90,37,1,NULL,5500.00,1,5500.00,511,'2015-11-25 12:08:58',NULL,NULL,NULL,NULL),(91,37,2,3,1000.00,1,1000.00,511,'2015-11-25 12:08:58',NULL,NULL,NULL,NULL),(92,38,1,NULL,5500.00,1,5500.00,511,'2015-11-25 12:09:39',NULL,NULL,NULL,NULL),(93,38,2,3,1000.00,1,1000.00,511,'2015-11-25 12:09:39',NULL,NULL,NULL,NULL),(94,39,1,NULL,5500.00,1,5500.00,511,'2015-11-25 14:52:47',NULL,NULL,NULL,NULL),(95,39,2,3,1000.00,1,1000.00,511,'2015-11-25 14:52:47',NULL,NULL,NULL,NULL),(96,10,2,2,250.00,1,250.00,77,'2015-11-25 14:59:28',NULL,NULL,NULL,NULL),(97,10,3,5,350.00,1,250.00,77,'2015-11-25 14:59:28',NULL,NULL,NULL,NULL),(98,10,1,1,150.00,1,150.00,77,'2015-11-25 14:59:28',NULL,NULL,NULL,NULL),(99,41,1,1,150.00,1,150.00,77,'2015-11-25 14:59:28',NULL,NULL,NULL,NULL),(100,41,1,2,250.00,1,250.00,77,'2015-11-25 14:59:28',NULL,NULL,NULL,NULL),(101,41,2,5,350.00,1,250.00,77,'2015-11-25 14:59:28',NULL,NULL,NULL,NULL),(102,42,1,NULL,5500.00,1,5500.00,511,'2015-11-25 14:59:30',NULL,NULL,NULL,NULL),(103,42,2,3,1000.00,1,1000.00,511,'2015-11-25 14:59:30',NULL,NULL,NULL,NULL),(104,43,1,NULL,500.00,1,500.00,99,'2015-11-25 14:59:32',NULL,NULL,NULL,NULL),(105,43,2,3,2000.00,1,2000.00,99,'2015-11-25 14:59:32',NULL,NULL,NULL,NULL),(106,44,1,NULL,5500.00,1,5500.00,511,'2015-11-25 16:05:51',NULL,NULL,NULL,NULL),(107,44,2,3,1000.00,1,1000.00,511,'2015-11-25 16:05:51',NULL,NULL,NULL,NULL),(108,45,1,NULL,500.00,1,500.00,99,'2015-11-25 16:06:24',NULL,NULL,NULL,NULL),(109,45,2,3,2000.00,1,2000.00,99,'2015-11-25 16:06:24',NULL,NULL,NULL,NULL),(110,10,1,1,150.00,1,150.00,77,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(111,10,3,5,350.00,1,250.00,77,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(112,10,2,2,250.00,1,250.00,77,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(113,47,1,1,150.00,1,150.00,77,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(114,47,1,2,250.00,1,250.00,77,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(115,47,2,5,350.00,1,250.00,77,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(116,48,1,NULL,5500.00,1,5500.00,511,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(117,48,2,3,1000.00,1,1000.00,511,'2015-11-25 16:57:59',NULL,NULL,NULL,NULL),(118,49,1,NULL,500.00,1,500.00,99,'2015-11-25 16:58:01',NULL,NULL,NULL,NULL),(119,49,2,3,2000.00,1,2000.00,99,'2015-11-25 16:58:01',NULL,NULL,NULL,NULL),(120,10,1,1,150.00,1,150.00,77,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(121,10,2,2,250.00,1,250.00,77,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(122,10,3,5,350.00,1,250.00,77,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(123,51,1,1,150.00,1,150.00,77,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(124,51,1,2,250.00,1,250.00,77,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(125,51,2,5,350.00,1,250.00,77,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(126,52,1,NULL,5500.00,1,5500.00,511,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(127,52,2,3,1000.00,1,1000.00,511,'2015-11-25 16:58:29',NULL,NULL,NULL,NULL),(128,53,1,NULL,500.00,1,500.00,99,'2015-11-25 16:58:30',NULL,NULL,NULL,NULL),(129,53,2,3,2000.00,1,2000.00,99,'2015-11-25 16:58:30',NULL,NULL,NULL,NULL),(130,10,2,2,250.00,1,250.00,77,'2015-11-26 10:37:36',NULL,NULL,NULL,NULL),(131,10,1,1,150.00,1,150.00,77,'2015-11-26 10:37:36',NULL,NULL,NULL,NULL),(132,10,3,5,350.00,1,250.00,77,'2015-11-26 10:37:36',NULL,NULL,NULL,NULL),(133,55,1,1,150.00,1,150.00,77,'2015-11-26 10:37:38',NULL,NULL,NULL,NULL),(134,55,1,2,250.00,1,250.00,77,'2015-11-26 10:37:38',NULL,NULL,NULL,NULL),(135,55,2,5,350.00,1,250.00,77,'2015-11-26 10:37:38',NULL,NULL,NULL,NULL),(136,56,1,NULL,500.00,1,500.00,99,'2015-11-26 10:37:44',NULL,NULL,NULL,NULL),(137,56,2,3,2000.00,1,2000.00,99,'2015-11-26 10:37:44',NULL,NULL,NULL,NULL),(138,10,2,2,250.00,1,250.00,77,'2015-11-26 11:26:55',NULL,NULL,NULL,NULL),(139,10,3,5,350.00,1,250.00,77,'2015-11-26 11:26:55',NULL,NULL,NULL,NULL),(140,10,1,1,150.00,1,150.00,77,'2015-11-26 11:26:55',NULL,NULL,NULL,NULL),(141,58,1,1,150.00,1,150.00,77,'2015-11-26 11:26:56',NULL,NULL,NULL,NULL),(142,58,1,2,250.00,1,250.00,77,'2015-11-26 11:26:56',NULL,NULL,NULL,NULL),(143,58,2,5,350.00,1,250.00,77,'2015-11-26 11:26:56',NULL,NULL,NULL,NULL),(144,59,1,NULL,500.00,1,500.00,99,'2015-11-26 11:27:03',NULL,NULL,NULL,NULL),(145,59,2,3,2000.00,1,2000.00,99,'2015-11-26 11:27:03',NULL,NULL,NULL,NULL),(146,10,2,2,250.00,1,250.00,77,'2015-11-26 12:07:22',NULL,NULL,NULL,NULL),(147,10,1,1,150.00,1,150.00,77,'2015-11-26 12:07:22',NULL,NULL,NULL,NULL),(148,10,3,5,350.00,1,250.00,77,'2015-11-26 12:07:22',NULL,NULL,NULL,NULL),(149,61,1,1,150.00,1,150.00,77,'2015-11-26 12:07:23',NULL,NULL,NULL,NULL),(150,61,1,2,250.00,1,250.00,77,'2015-11-26 12:07:23',NULL,NULL,NULL,NULL),(151,61,2,5,350.00,1,250.00,77,'2015-11-26 12:07:23',NULL,NULL,NULL,NULL),(152,62,1,NULL,500.00,1,500.00,99,'2015-11-26 12:07:29',NULL,NULL,NULL,NULL),(153,62,2,3,2000.00,1,2000.00,99,'2015-11-26 12:07:29',NULL,NULL,NULL,NULL),(154,10,2,2,250.00,1,250.00,77,'2015-11-26 12:12:03',NULL,NULL,NULL,NULL),(155,10,1,1,150.00,1,150.00,77,'2015-11-26 12:12:03',NULL,NULL,NULL,NULL),(156,10,3,5,350.00,1,250.00,77,'2015-11-26 12:12:03',NULL,NULL,NULL,NULL),(157,64,1,1,150.00,1,150.00,77,'2015-11-26 12:12:04',NULL,NULL,NULL,NULL),(158,64,1,2,250.00,1,250.00,77,'2015-11-26 12:12:04',NULL,NULL,NULL,NULL),(159,64,2,5,350.00,1,250.00,77,'2015-11-26 12:12:04',NULL,NULL,NULL,NULL),(160,65,1,NULL,500.00,1,500.00,99,'2015-11-26 12:12:10',NULL,NULL,NULL,NULL),(161,65,2,3,2000.00,1,2000.00,99,'2015-11-26 12:12:10',NULL,NULL,NULL,NULL),(162,10,3,5,350.00,1,250.00,77,'2015-11-26 14:03:20',NULL,NULL,NULL,NULL),(163,10,1,1,150.00,1,150.00,77,'2015-11-26 14:03:20',NULL,NULL,NULL,NULL),(164,10,2,2,250.00,1,250.00,77,'2015-11-26 14:03:20',NULL,NULL,NULL,NULL),(165,67,1,1,150.00,1,150.00,77,'2015-11-26 14:03:20',NULL,NULL,NULL,NULL),(166,67,1,2,250.00,1,250.00,77,'2015-11-26 14:03:20',NULL,NULL,NULL,NULL),(167,67,2,5,350.00,1,250.00,77,'2015-11-26 14:03:20',NULL,NULL,NULL,NULL),(168,68,1,NULL,500.00,1,500.00,99,'2015-11-26 14:03:26',NULL,NULL,NULL,NULL),(169,68,2,3,2000.00,1,2000.00,99,'2015-11-26 14:03:26',NULL,NULL,NULL,NULL),(170,69,1,NULL,5500.00,1,5500.00,511,'2015-11-26 14:22:51',NULL,NULL,NULL,NULL),(171,69,2,3,1000.00,1,1000.00,511,'2015-11-26 14:22:51',NULL,NULL,NULL,NULL),(172,10,1,1,150.00,1,150.00,77,'2015-11-26 14:24:09',NULL,NULL,NULL,NULL),(173,10,2,2,250.00,1,250.00,77,'2015-11-26 14:24:09',NULL,NULL,NULL,NULL),(174,10,3,5,350.00,1,250.00,77,'2015-11-26 14:24:09',NULL,NULL,NULL,NULL),(175,71,1,1,150.00,1,150.00,77,'2015-11-26 14:24:09',NULL,NULL,NULL,NULL),(176,71,1,2,250.00,1,250.00,77,'2015-11-26 14:24:09',NULL,NULL,NULL,NULL),(177,71,2,5,350.00,1,250.00,77,'2015-11-26 14:24:09',NULL,NULL,NULL,NULL),(178,72,1,NULL,5500.00,1,5500.00,511,'2015-11-26 14:24:10',NULL,NULL,NULL,NULL),(179,72,2,3,1000.00,1,1000.00,511,'2015-11-26 14:24:10',NULL,NULL,NULL,NULL),(180,73,1,NULL,500.00,1,500.00,99,'2015-11-26 14:24:11',NULL,NULL,NULL,NULL),(181,73,2,3,2000.00,1,2000.00,99,'2015-11-26 14:24:11',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order_header`
--

DROP TABLE IF EXISTS `app_order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_order_header` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acct_id` int(11) DEFAULT NULL,
  `total_price` decimal(9,2) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order_header`
--

LOCK TABLES `app_order_header` WRITE;
/*!40000 ALTER TABLE `app_order_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_order_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_price`
--

DROP TABLE IF EXISTS `app_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_price` (
  `id` int(11) NOT NULL DEFAULT '0',
  `app_module_id` int(11) DEFAULT NULL,
  `app_feature_id` int(11) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `since_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1app_price` (`app_module_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_price`
--

LOCK TABLES `app_price` WRITE;
/*!40000 ALTER TABLE `app_price` DISABLE KEYS */;
INSERT INTO `app_price` VALUES (1,1,NULL,5000.00,'2015-11-18',NULL,0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(2,1,1,1000.00,'2015-11-18',NULL,0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(3,1,2,1500.00,'2015-11-18',NULL,0,'2015-11-18 15:19:08',NULL,NULL,NULL,NULL),(4,2,NULL,8000.00,'2015-11-18',NULL,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL),(5,2,3,2000.00,'2015-11-18',NULL,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL),(6,2,4,2500.00,'2015-11-18',NULL,0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_module_id` int(11) DEFAULT NULL,
  `version` varchar(30) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `version_desc` varchar(160) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version`
--

LOCK TABLES `app_version` WRITE;
/*!40000 ALTER TABLE `app_version` DISABLE KEYS */;
INSERT INTO `app_version` VALUES (1,1,'1.0.0-SNAPSHOT','2015-11-18','应用购买开发版本',0,'2015-11-18 15:19:09',NULL,NULL,NULL,NULL),(5,5,'1.0.0-SNAPSHOT','2015-11-18','应用购买开发版本',0,'2015-11-18 00:00:00',NULL,NULL,NULL,NULL),(6,6,'1.0.0-SNAPSHOT','2016-11-20','应用购买开发版本',0,'2015-11-18 00:00:00',NULL,NULL,NULL,NULL),(7,7,'1.0.0-SNAPSHOT','2016-11-20','应用购买开发版本',0,'2015-11-18 00:00:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_module`
--

DROP TABLE IF EXISTS `asset_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `supportingERPs` varchar(200) DEFAULT NULL,
  `main_verticle` varchar(10240) DEFAULT NULL,
  `artifact_identifier` varchar(100) DEFAULT NULL,
  `discription` varchar(200) DEFAULT NULL,
  `creator` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `modified_time` datetime DEFAULT NULL,
  `deleter` int(11) DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_module`
--

LOCK TABLES `asset_module` WRITE;
/*!40000 ALTER TABLE `asset_module` DISABLE KEYS */;
INSERT INTO `asset_module` VALUES (3,'APINSK','1.0.0','凯拿应付保理','供应链金融','NC 5.7;NC 6.3;NC 6.5;U8 12.0;K3 13.1','{\"className\":\"otocloud.server.OtoCloudServerVerticle\"}','otocloud:otocloud-test:jar:1.0.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'APINSK','1.1.0','凯拿应付保理','供应链金融','NC 5.7;NC 6.3;NC 6.5;U8 12.0;K3 13.1','{\"className\":\"otocloud.server.OtoCloudServerVerticle\"}','otocloud:otocloud-test:jar:1.1.0',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `asset_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_acct_role`
--

DROP TABLE IF EXISTS `auth_acct_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_acct_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acct_id` int(11) DEFAULT NULL,
  `auth_role_id` int(11) DEFAULT NULL,
  `auth_type_code` varchar(20) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_acct_role`
--

LOCK TABLES `auth_acct_role` WRITE;
/*!40000 ALTER TABLE `auth_acct_role` DISABLE KEYS */;
INSERT INTO `auth_acct_role` VALUES (21,156,27,'A',NULL,0,'2016-01-07 15:55:10',NULL,NULL,NULL,NULL),(22,89,14,'A',NULL,0,'2016-01-07 15:58:21',NULL,NULL,NULL,NULL),(23,89,29,'A',NULL,0,'2016-01-07 15:58:23',NULL,NULL,NULL,NULL),(24,89,14,'A',NULL,0,'2016-01-07 15:59:29',NULL,NULL,NULL,NULL),(25,89,31,'A',NULL,0,'2016-01-07 15:59:30',NULL,NULL,NULL,NULL),(26,89,14,'A',NULL,0,'2016-01-07 16:38:51',NULL,NULL,NULL,NULL),(27,89,33,'A',NULL,0,'2016-01-07 16:38:52',NULL,NULL,NULL,NULL),(28,89,34,'A',NULL,0,'2016-01-07 16:39:48',NULL,NULL,NULL,NULL),(29,89,14,'A',NULL,0,'2016-01-07 16:40:33',NULL,NULL,NULL,NULL),(30,89,36,'A',NULL,0,'2016-01-07 16:40:34',NULL,NULL,NULL,NULL),(31,123,37,'A',NULL,0,'2016-01-07 16:40:37',NULL,NULL,NULL,NULL),(32,123,38,'A',NULL,0,'2016-01-07 16:42:01',NULL,NULL,NULL,NULL),(33,159,39,'A',NULL,0,'2016-01-07 21:13:49',NULL,NULL,NULL,NULL),(34,160,40,'A',NULL,0,'2016-01-07 21:15:25',NULL,NULL,NULL,NULL),(35,162,41,'A',NULL,0,'2016-01-07 21:22:15',NULL,NULL,NULL,NULL),(36,163,42,'A',NULL,0,'2016-01-07 21:23:48',NULL,NULL,NULL,NULL),(37,164,43,'A',NULL,0,'2016-01-07 21:24:26',NULL,NULL,NULL,NULL),(38,166,44,'A',NULL,0,'2016-01-07 21:29:35',NULL,NULL,NULL,NULL),(39,89,14,'A',NULL,0,'2016-01-07 21:29:42',NULL,NULL,NULL,NULL),(40,89,46,'A',NULL,0,'2016-01-07 21:29:44',NULL,NULL,NULL,NULL),(41,123,47,'A',NULL,0,'2016-01-07 21:36:17',NULL,NULL,NULL,NULL),(42,89,14,'A',NULL,0,'2016-01-07 21:36:41',NULL,NULL,NULL,NULL),(43,89,49,'A',NULL,0,'2016-01-07 21:36:42',NULL,NULL,NULL,NULL),(44,167,50,'A',NULL,0,'2016-01-07 22:09:55',NULL,NULL,NULL,NULL),(45,123,51,'A',NULL,0,'2016-01-07 22:02:36',NULL,NULL,NULL,NULL),(46,89,14,'A',NULL,0,'2016-01-07 22:03:08',NULL,NULL,NULL,NULL),(47,89,53,'A',NULL,0,'2016-01-07 22:03:09',NULL,NULL,NULL,NULL),(48,123,54,'A',NULL,0,'2016-01-07 22:03:12',NULL,NULL,NULL,NULL),(49,89,14,'A',NULL,0,'2016-01-07 22:03:48',NULL,NULL,NULL,NULL),(50,89,56,'A',NULL,0,'2016-01-07 22:03:49',NULL,NULL,NULL,NULL),(51,123,57,'A',NULL,0,'2016-01-07 22:03:52',NULL,NULL,NULL,NULL),(52,123,58,'A',NULL,0,'2016-01-07 22:04:49',NULL,NULL,NULL,NULL),(53,168,59,'A',NULL,0,'2016-01-07 22:29:43',NULL,NULL,NULL,NULL),(54,169,60,'A',NULL,0,'2016-01-07 22:32:50',NULL,NULL,NULL,NULL),(55,89,14,'A',NULL,0,'2016-01-07 22:24:46',NULL,NULL,NULL,NULL),(56,89,62,'A',NULL,0,'2016-01-07 22:24:47',NULL,NULL,NULL,NULL),(57,123,63,'A',NULL,0,'2016-01-07 22:29:31',NULL,NULL,NULL,NULL),(58,170,64,'A',NULL,0,'2016-01-07 22:55:21',NULL,NULL,NULL,NULL),(59,171,65,'A',NULL,0,'2016-01-07 23:08:57',NULL,NULL,NULL,NULL),(60,172,66,'A',NULL,0,'2016-01-07 23:25:36',NULL,NULL,NULL,NULL),(61,173,67,'A',NULL,0,'2016-01-07 23:32:59',NULL,NULL,NULL,NULL),(62,174,68,'A',NULL,0,'2016-01-08 13:36:24',NULL,NULL,NULL,NULL),(63,175,69,'A',NULL,0,'2016-01-12 13:55:04',NULL,NULL,NULL,NULL),(64,123,70,'A',NULL,0,'2016-01-12 16:48:20',NULL,NULL,NULL,NULL),(65,123,71,'A',NULL,0,'2016-01-12 16:49:00',NULL,NULL,NULL,NULL),(66,123,72,'A',NULL,0,'2016-01-12 16:59:37',NULL,NULL,NULL,NULL),(67,123,73,'A',NULL,0,'2016-01-12 17:00:00',NULL,NULL,NULL,NULL),(68,123,74,'A',NULL,0,'2016-01-12 17:06:45',NULL,NULL,NULL,NULL),(69,123,75,'A',NULL,0,'2016-01-13 14:36:54',NULL,NULL,NULL,NULL),(70,123,76,'A',NULL,0,'2016-01-13 14:54:46',NULL,NULL,NULL,NULL),(71,123,77,'A',NULL,0,'2016-01-13 14:57:05',NULL,NULL,NULL,NULL),(72,123,78,'A',NULL,0,'2016-01-13 15:00:16',NULL,NULL,NULL,NULL),(73,123,79,'A',NULL,0,'2016-01-13 15:00:56',NULL,NULL,NULL,NULL),(74,89,14,'A',NULL,0,'2016-01-13 15:01:17',NULL,NULL,NULL,NULL),(75,89,81,'A',NULL,0,'2016-01-13 15:04:45',NULL,NULL,NULL,NULL),(76,89,14,'A',NULL,0,'2016-01-13 15:05:26',NULL,NULL,NULL,NULL),(77,89,83,'A',NULL,0,'2016-01-13 15:05:27',NULL,NULL,NULL,NULL),(78,123,84,'A',NULL,0,'2016-01-13 15:06:03',NULL,NULL,NULL,NULL),(79,89,14,'A',NULL,0,'2016-01-13 15:08:03',NULL,NULL,NULL,NULL),(80,89,86,'A',NULL,0,'2016-01-13 15:08:04',NULL,NULL,NULL,NULL),(81,123,87,'A',NULL,0,'2016-01-13 15:08:06',NULL,NULL,NULL,NULL),(82,89,14,'A',NULL,0,'2016-01-13 15:11:50',NULL,NULL,NULL,NULL),(83,89,89,'A',NULL,0,'2016-01-13 15:11:51',NULL,NULL,NULL,NULL),(84,123,90,'A',NULL,0,'2016-01-13 15:11:53',NULL,NULL,NULL,NULL),(85,123,91,'A',NULL,0,'2016-01-13 15:11:55',NULL,NULL,NULL,NULL),(86,123,92,'A',NULL,0,'2016-01-14 11:46:01',NULL,NULL,NULL,NULL),(87,156,93,'A',NULL,0,'2016-01-15 13:47:49',NULL,NULL,NULL,NULL),(88,89,14,'A',NULL,0,'2016-01-18 11:07:03',NULL,NULL,NULL,NULL),(89,89,95,'A',NULL,0,'2016-01-18 11:07:04',NULL,NULL,NULL,NULL),(90,123,96,'A',NULL,0,'2016-01-18 11:07:07',NULL,NULL,NULL,NULL),(91,123,97,'A',NULL,0,'2016-01-18 11:07:10',NULL,NULL,NULL,NULL),(92,176,98,'A',NULL,0,'2016-01-18 11:36:24',NULL,NULL,NULL,NULL),(93,177,99,'A',NULL,0,'2016-01-18 14:52:27',NULL,NULL,NULL,NULL),(94,178,100,'A',NULL,0,'2016-01-19 09:09:58',NULL,NULL,NULL,NULL),(95,179,101,'A',NULL,0,'2016-01-19 09:26:25',NULL,NULL,NULL,NULL),(96,180,102,'A',NULL,0,'2016-01-19 11:51:16',NULL,NULL,NULL,NULL),(97,181,103,'A',NULL,0,'2016-01-19 12:33:02',NULL,NULL,NULL,NULL),(98,182,104,'A',NULL,0,'2016-01-19 14:09:30',NULL,NULL,NULL,NULL),(99,183,105,'A',NULL,0,'2016-01-19 14:17:13',NULL,NULL,NULL,NULL),(100,184,106,'A',NULL,0,'2016-01-20 10:02:32',NULL,NULL,NULL,NULL),(101,123,107,'A',NULL,0,'2016-01-20 11:57:34',NULL,NULL,NULL,NULL),(102,0,108,'A',NULL,0,'2016-01-21 11:02:19',NULL,NULL,NULL,NULL),(103,89,14,'A',NULL,0,'2016-01-21 11:02:26',NULL,NULL,NULL,NULL),(104,89,110,'A',NULL,0,'2016-01-21 11:02:28',NULL,NULL,NULL,NULL),(105,123,111,'A',NULL,0,'2016-01-21 11:02:32',NULL,NULL,NULL,NULL),(106,123,112,'A',NULL,0,'2016-01-21 11:02:35',NULL,NULL,NULL,NULL),(107,89,14,'A',NULL,0,'2016-01-21 11:14:13',NULL,NULL,NULL,NULL),(108,89,114,'A',NULL,0,'2016-01-21 11:14:15',NULL,NULL,NULL,NULL),(109,123,115,'A',NULL,0,'2016-01-21 11:14:18',NULL,NULL,NULL,NULL),(110,123,116,'A',NULL,0,'2016-01-21 11:14:21',NULL,NULL,NULL,NULL),(111,185,117,'A',NULL,0,'2016-01-21 14:00:16',NULL,NULL,NULL,NULL),(112,186,118,'A',NULL,0,'2016-01-21 16:04:11',NULL,NULL,NULL,NULL),(113,89,14,'A',NULL,0,'2016-01-21 16:19:56',NULL,NULL,NULL,NULL),(114,89,27,'A',NULL,0,'2016-01-21 16:19:57',NULL,NULL,NULL,NULL),(115,89,120,'A',NULL,0,'2016-01-21 16:19:57',NULL,NULL,NULL,NULL),(116,123,27,'A',NULL,0,'2016-01-21 16:20:30',NULL,NULL,NULL,NULL),(117,123,120,'A',NULL,0,'2016-01-21 16:20:30',NULL,NULL,NULL,NULL),(118,123,27,'A',NULL,0,'2016-01-21 16:20:32',NULL,NULL,NULL,NULL),(119,123,120,'A',NULL,0,'2016-01-21 16:20:32',NULL,NULL,NULL,NULL),(120,89,14,'A',NULL,0,'2016-01-21 16:21:15',NULL,NULL,NULL,NULL),(121,89,27,'A',NULL,0,'2016-01-21 16:21:16',NULL,NULL,NULL,NULL),(122,89,120,'A',NULL,0,'2016-01-21 16:21:16',NULL,NULL,NULL,NULL),(123,89,14,'A',NULL,0,'2016-01-21 16:23:37',NULL,NULL,NULL,NULL),(124,89,27,'A',NULL,0,'2016-01-21 16:23:38',NULL,NULL,NULL,NULL),(125,89,120,'A',NULL,0,'2016-01-21 16:23:38',NULL,NULL,NULL,NULL),(126,123,27,'A',NULL,0,'2016-01-21 16:23:40',NULL,NULL,NULL,NULL),(127,123,120,'A',NULL,0,'2016-01-21 16:23:40',NULL,NULL,NULL,NULL),(128,123,27,'A',NULL,0,'2016-01-21 16:23:42',NULL,NULL,NULL,NULL),(129,123,120,'A',NULL,0,'2016-01-21 16:23:42',NULL,NULL,NULL,NULL),(130,89,14,'A',NULL,0,'2016-01-21 16:27:13',NULL,NULL,NULL,NULL),(131,89,27,'A',NULL,0,'2016-01-21 16:27:14',NULL,NULL,NULL,NULL),(132,89,120,'A',NULL,0,'2016-01-21 16:27:14',NULL,NULL,NULL,NULL),(133,123,27,'A',NULL,0,'2016-01-21 16:27:17',NULL,NULL,NULL,NULL),(134,123,120,'A',NULL,0,'2016-01-21 16:27:17',NULL,NULL,NULL,NULL),(135,123,27,'A',NULL,0,'2016-01-21 16:27:19',NULL,NULL,NULL,NULL),(136,123,120,'A',NULL,0,'2016-01-21 16:27:19',NULL,NULL,NULL,NULL),(137,89,14,'A',NULL,0,'2016-01-21 16:27:49',NULL,NULL,NULL,NULL),(138,89,27,'A',NULL,0,'2016-01-21 16:27:51',NULL,NULL,NULL,NULL),(139,89,120,'A',NULL,0,'2016-01-21 16:27:51',NULL,NULL,NULL,NULL),(140,123,27,'A',NULL,0,'2016-01-21 16:27:53',NULL,NULL,NULL,NULL),(141,123,120,'A',NULL,0,'2016-01-21 16:27:53',NULL,NULL,NULL,NULL),(142,123,27,'A',NULL,0,'2016-01-21 16:27:56',NULL,NULL,NULL,NULL),(143,123,120,'A',NULL,0,'2016-01-21 16:27:56',NULL,NULL,NULL,NULL),(144,123,27,'A',NULL,0,'2016-01-25 15:32:11',NULL,NULL,NULL,NULL),(145,123,120,'A',NULL,0,'2016-01-25 15:32:11',NULL,NULL,NULL,NULL),(146,89,14,'A',NULL,0,'2016-01-25 15:32:49',NULL,NULL,NULL,NULL),(147,89,27,'A',NULL,0,'2016-01-25 15:32:50',NULL,NULL,NULL,NULL),(148,89,120,'A',NULL,0,'2016-01-25 15:32:50',NULL,NULL,NULL,NULL),(149,123,27,'A',NULL,0,'2016-01-25 15:32:53',NULL,NULL,NULL,NULL),(150,123,120,'A',NULL,0,'2016-01-25 15:32:53',NULL,NULL,NULL,NULL),(151,123,27,'A',NULL,0,'2016-01-25 15:32:55',NULL,NULL,NULL,NULL),(152,123,120,'A',NULL,0,'2016-01-25 15:32:55',NULL,NULL,NULL,NULL),(153,89,14,'A',NULL,0,'2016-01-25 15:38:51',NULL,NULL,NULL,NULL),(154,89,27,'A',NULL,0,'2016-01-25 15:38:52',NULL,NULL,NULL,NULL),(155,89,120,'A',NULL,0,'2016-01-25 15:38:52',NULL,NULL,NULL,NULL),(156,123,27,'A',NULL,0,'2016-01-25 15:38:54',NULL,NULL,NULL,NULL),(157,123,120,'A',NULL,0,'2016-01-25 15:38:54',NULL,NULL,NULL,NULL),(158,123,27,'A',NULL,0,'2016-01-25 15:38:56',NULL,NULL,NULL,NULL),(159,123,120,'A',NULL,0,'2016-01-25 15:38:56',NULL,NULL,NULL,NULL),(160,89,14,'A',NULL,0,'2016-01-25 15:46:55',NULL,NULL,NULL,NULL),(161,89,27,'A',NULL,0,'2016-01-25 15:46:57',NULL,NULL,NULL,NULL),(162,89,120,'A',NULL,0,'2016-01-25 15:46:57',NULL,NULL,NULL,NULL),(163,89,14,'A',NULL,0,'2016-01-25 15:47:34',NULL,NULL,NULL,NULL),(164,89,27,'A',NULL,0,'2016-01-25 15:47:35',NULL,NULL,NULL,NULL),(165,89,120,'A',NULL,0,'2016-01-25 15:47:35',NULL,NULL,NULL,NULL),(166,123,27,'A',NULL,0,'2016-01-25 15:47:38',NULL,NULL,NULL,NULL),(167,123,120,'A',NULL,0,'2016-01-25 15:47:38',NULL,NULL,NULL,NULL),(168,123,27,'A',NULL,0,'2016-01-25 15:47:41',NULL,NULL,NULL,NULL),(169,123,120,'A',NULL,0,'2016-01-25 15:47:41',NULL,NULL,NULL,NULL),(170,123,27,'A',NULL,0,'2016-01-25 15:57:11',NULL,NULL,NULL,NULL),(171,123,120,'A',NULL,0,'2016-01-25 15:57:11',NULL,NULL,NULL,NULL),(172,89,14,'A',NULL,0,'2016-01-25 15:59:10',NULL,NULL,NULL,NULL),(173,89,27,'A',NULL,0,'2016-01-25 15:59:11',NULL,NULL,NULL,NULL),(174,89,120,'A',NULL,0,'2016-01-25 15:59:11',NULL,NULL,NULL,NULL),(175,123,27,'A',NULL,0,'2016-01-25 15:59:14',NULL,NULL,NULL,NULL),(176,123,120,'A',NULL,0,'2016-01-25 15:59:14',NULL,NULL,NULL,NULL),(177,123,27,'A',NULL,0,'2016-01-25 15:59:17',NULL,NULL,NULL,NULL),(178,123,120,'A',NULL,0,'2016-01-25 15:59:17',NULL,NULL,NULL,NULL),(179,188,27,'A',NULL,0,'2016-01-25 16:40:18',NULL,NULL,NULL,NULL),(180,188,120,'A',NULL,0,'2016-01-25 16:40:18',NULL,NULL,NULL,NULL),(181,123,27,'A',NULL,0,'2016-01-25 16:29:04',NULL,NULL,NULL,NULL),(182,123,120,'A',NULL,0,'2016-01-25 16:29:04',NULL,NULL,NULL,NULL),(183,190,27,'A',NULL,0,'2016-01-25 16:50:29',NULL,NULL,NULL,NULL),(184,190,120,'A',NULL,0,'2016-01-25 16:50:29',NULL,NULL,NULL,NULL),(185,123,27,'A',NULL,0,'2016-01-25 17:02:33',NULL,NULL,NULL,NULL),(186,123,120,'A',NULL,0,'2016-01-25 17:02:33',NULL,NULL,NULL,NULL),(187,196,27,'A',NULL,0,'2016-01-25 17:24:43',NULL,NULL,NULL,NULL),(188,196,120,'A',NULL,0,'2016-01-25 17:24:43',NULL,NULL,NULL,NULL),(189,202,27,'A',NULL,0,'2016-01-25 17:37:16',NULL,NULL,NULL,NULL),(190,202,120,'A',NULL,0,'2016-01-25 17:37:16',NULL,NULL,NULL,NULL),(191,204,27,'A',NULL,0,'2016-01-25 17:41:53',NULL,NULL,NULL,NULL),(192,204,120,'A',NULL,0,'2016-01-25 17:41:53',NULL,NULL,NULL,NULL),(193,205,27,'A',NULL,0,'2016-01-25 17:45:05',NULL,NULL,NULL,NULL),(194,205,120,'A',NULL,0,'2016-01-25 17:45:06',NULL,NULL,NULL,NULL),(195,207,27,'A',NULL,0,'2016-01-25 17:47:07',NULL,NULL,NULL,NULL),(196,207,120,'A',NULL,0,'2016-01-25 17:47:07',NULL,NULL,NULL,NULL),(197,208,27,'A',NULL,0,'2016-01-25 17:49:16',NULL,NULL,NULL,NULL),(198,208,120,'A',NULL,0,'2016-01-25 17:49:16',NULL,NULL,NULL,NULL),(199,209,27,'A',NULL,0,'2016-01-25 17:50:33',NULL,NULL,NULL,NULL),(200,209,120,'A',NULL,0,'2016-01-25 17:50:33',NULL,NULL,NULL,NULL),(201,210,27,'A',NULL,0,'2016-01-25 17:51:42',NULL,NULL,NULL,NULL),(202,210,120,'A',NULL,0,'2016-01-25 17:51:42',NULL,NULL,NULL,NULL),(203,211,27,'A',NULL,0,'2016-01-25 17:52:59',NULL,NULL,NULL,NULL),(204,211,120,'A',NULL,0,'2016-01-25 17:52:59',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_acct_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_resource`
--

DROP TABLE IF EXISTS `auth_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_resource` (
  `id` int(11) NOT NULL DEFAULT '0',
  `resource_type_code` varchar(20) DEFAULT NULL,
  `resource_ref_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_resource`
--

LOCK TABLES `auth_resource` WRITE;
/*!40000 ALTER TABLE `auth_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role`
--

DROP TABLE IF EXISTS `auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  `role_type_code` varchar(20) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1auth_role` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role`
--

LOCK TABLES `auth_role` WRITE;
/*!40000 ALTER TABLE `auth_role` DISABLE KEYS */;
INSERT INTO `auth_role` VALUES (27,'企业管理员','ACCT_MANAGER',0,'2016-01-07 15:55:10',NULL,NULL,NULL,NULL),(28,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 15:58:21',NULL,NULL,NULL,NULL),(29,'企业管理员','ACCT_MANAGER',0,'2016-01-07 15:58:22',NULL,NULL,NULL,NULL),(30,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 15:59:29',NULL,NULL,NULL,NULL),(31,'企业管理员','ACCT_MANAGER',0,'2016-01-07 15:59:30',NULL,NULL,NULL,NULL),(32,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 16:38:51',NULL,NULL,NULL,NULL),(33,'企业管理员','ACCT_MANAGER',0,'2016-01-07 16:38:52',NULL,NULL,NULL,NULL),(34,'企业管理员','ACCT_MANAGER',0,'2016-01-07 16:39:48',NULL,NULL,NULL,NULL),(35,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 16:40:33',NULL,NULL,NULL,NULL),(36,'企业管理员','ACCT_MANAGER',0,'2016-01-07 16:40:34',NULL,NULL,NULL,NULL),(37,'企业管理员','ACCT_MANAGER',0,'2016-01-07 16:40:37',NULL,NULL,NULL,NULL),(38,'企业管理员','ACCT_MANAGER',0,'2016-01-07 16:42:01',NULL,NULL,NULL,NULL),(39,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:13:49',NULL,NULL,NULL,NULL),(40,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:15:25',NULL,NULL,NULL,NULL),(41,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:22:15',NULL,NULL,NULL,NULL),(42,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:23:48',NULL,NULL,NULL,NULL),(43,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:24:26',NULL,NULL,NULL,NULL),(44,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:29:35',NULL,NULL,NULL,NULL),(45,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 21:29:42',NULL,NULL,NULL,NULL),(46,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:29:44',NULL,NULL,NULL,NULL),(47,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:36:17',NULL,NULL,NULL,NULL),(48,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 21:36:41',NULL,NULL,NULL,NULL),(49,'企业管理员','ACCT_MANAGER',0,'2016-01-07 21:36:42',NULL,NULL,NULL,NULL),(50,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:09:55',NULL,NULL,NULL,NULL),(51,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:02:36',NULL,NULL,NULL,NULL),(52,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 22:03:08',NULL,NULL,NULL,NULL),(53,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:03:09',NULL,NULL,NULL,NULL),(54,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:03:12',NULL,NULL,NULL,NULL),(55,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 22:03:48',NULL,NULL,NULL,NULL),(56,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:03:49',NULL,NULL,NULL,NULL),(57,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:03:52',NULL,NULL,NULL,NULL),(58,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:04:49',NULL,NULL,NULL,NULL),(59,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:29:43',NULL,NULL,NULL,NULL),(60,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:32:50',NULL,NULL,NULL,NULL),(61,'企业管理员test','ACCT_MANAGER',0,'2016-01-07 22:24:46',NULL,NULL,NULL,NULL),(62,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:24:47',NULL,NULL,NULL,NULL),(63,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:29:31',NULL,NULL,NULL,NULL),(64,'企业管理员','ACCT_MANAGER',0,'2016-01-07 22:55:21',NULL,NULL,NULL,NULL),(65,'企业管理员','ACCT_MANAGER',0,'2016-01-07 23:08:57',NULL,NULL,NULL,NULL),(66,'企业管理员','ACCT_MANAGER',0,'2016-01-07 23:25:36',NULL,NULL,NULL,NULL),(67,'企业管理员','ACCT_MANAGER',0,'2016-01-07 23:32:59',NULL,NULL,NULL,NULL),(68,'企业管理员','ACCT_MANAGER',0,'2016-01-08 13:36:24',NULL,NULL,NULL,NULL),(69,'企业管理员','ACCT_MANAGER',0,'2016-01-12 13:55:04',NULL,NULL,NULL,NULL),(70,'企业管理员','ACCT_MANAGER',0,'2016-01-12 16:48:20',NULL,NULL,NULL,NULL),(71,'企业管理员','ACCT_MANAGER',0,'2016-01-12 16:49:00',NULL,NULL,NULL,NULL),(72,'企业管理员','ACCT_MANAGER',0,'2016-01-12 16:59:37',NULL,NULL,NULL,NULL),(73,'企业管理员','ACCT_MANAGER',0,'2016-01-12 17:00:00',NULL,NULL,NULL,NULL),(74,'企业管理员','ACCT_MANAGER',0,'2016-01-12 17:06:45',NULL,NULL,NULL,NULL),(75,'企业管理员','ACCT_MANAGER',0,'2016-01-13 14:36:54',NULL,NULL,NULL,NULL),(76,'企业管理员','ACCT_MANAGER',0,'2016-01-13 14:54:46',NULL,NULL,NULL,NULL),(77,'企业管理员','ACCT_MANAGER',0,'2016-01-13 14:57:05',NULL,NULL,NULL,NULL),(78,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:00:16',NULL,NULL,NULL,NULL),(79,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:00:56',NULL,NULL,NULL,NULL),(80,'企业管理员test','ACCT_MANAGER',0,'2016-01-13 15:01:17',NULL,NULL,NULL,NULL),(81,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:04:45',NULL,NULL,NULL,NULL),(82,'企业管理员test','ACCT_MANAGER',0,'2016-01-13 15:05:26',NULL,NULL,NULL,NULL),(83,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:05:27',NULL,NULL,NULL,NULL),(84,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:06:03',NULL,NULL,NULL,NULL),(85,'企业管理员test','ACCT_MANAGER',0,'2016-01-13 15:08:03',NULL,NULL,NULL,NULL),(86,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:08:04',NULL,NULL,NULL,NULL),(87,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:08:06',NULL,NULL,NULL,NULL),(88,'企业管理员test','ACCT_MANAGER',0,'2016-01-13 15:11:50',NULL,NULL,NULL,NULL),(89,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:11:51',NULL,NULL,NULL,NULL),(90,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:11:53',NULL,NULL,NULL,NULL),(91,'企业管理员','ACCT_MANAGER',0,'2016-01-13 15:11:55',NULL,NULL,NULL,NULL),(92,'企业管理员','ACCT_MANAGER',0,'2016-01-14 11:46:01',NULL,NULL,NULL,NULL),(93,'企业管理员','ACCT_MANAGER',0,'2016-01-15 13:47:49',NULL,NULL,NULL,NULL),(94,'企业管理员test','ACCT_MANAGER',0,'2016-01-18 11:07:03',NULL,NULL,NULL,NULL),(95,'企业管理员','ACCT_MANAGER',0,'2016-01-18 11:07:04',NULL,NULL,NULL,NULL),(96,'企业管理员','ACCT_MANAGER',0,'2016-01-18 11:07:07',NULL,NULL,NULL,NULL),(97,'企业管理员','ACCT_MANAGER',0,'2016-01-18 11:07:10',NULL,NULL,NULL,NULL),(98,'企业管理员','ACCT_MANAGER',0,'2016-01-18 11:36:24',NULL,NULL,NULL,NULL),(99,'企业管理员','ACCT_MANAGER',0,'2016-01-18 14:52:26',NULL,NULL,NULL,NULL),(100,'企业管理员','ACCT_MANAGER',0,'2016-01-19 09:09:58',NULL,NULL,NULL,NULL),(101,'企业管理员','ACCT_MANAGER',0,'2016-01-19 09:26:25',NULL,NULL,NULL,NULL),(102,'企业管理员','ACCT_MANAGER',0,'2016-01-19 11:51:16',NULL,NULL,NULL,NULL),(103,'企业管理员','ACCT_MANAGER',0,'2016-01-19 12:33:02',NULL,NULL,NULL,NULL),(104,'企业管理员','ACCT_MANAGER',0,'2016-01-19 14:09:30',NULL,NULL,NULL,NULL),(105,'企业管理员','ACCT_MANAGER',0,'2016-01-19 14:17:13',NULL,NULL,NULL,NULL),(106,'企业管理员','ACCT_MANAGER',0,'2016-01-20 10:02:32',NULL,NULL,NULL,NULL),(107,'企业管理员','ACCT_MANAGER',0,'2016-01-20 11:57:34',NULL,NULL,NULL,NULL),(108,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:02:19',NULL,NULL,NULL,NULL),(109,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 11:02:26',NULL,NULL,NULL,NULL),(110,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:02:28',NULL,NULL,NULL,NULL),(111,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:02:32',NULL,NULL,NULL,NULL),(112,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:02:35',NULL,NULL,NULL,NULL),(113,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 11:14:13',NULL,NULL,NULL,NULL),(114,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:14:15',NULL,NULL,NULL,NULL),(115,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:14:18',NULL,NULL,NULL,NULL),(116,'企业管理员','ACCT_MANAGER',0,'2016-01-21 11:14:21',NULL,NULL,NULL,NULL),(117,'企业管理员','ACCT_MANAGER',0,'2016-01-21 14:00:16',NULL,NULL,NULL,NULL),(118,'企业管理员','ACCT_MANAGER',0,'2016-01-21 16:04:11',NULL,NULL,NULL,NULL),(119,'企业管理员','ACCT_MANAGER',0,'2016-01-21 15:47:28',NULL,NULL,NULL,NULL),(120,'业务员','BIZ_OPERATOR',0,'2016-01-21 15:47:28',NULL,NULL,NULL,NULL),(121,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 16:19:56',NULL,NULL,NULL,NULL),(122,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 16:21:15',NULL,NULL,NULL,NULL),(123,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 16:23:37',NULL,NULL,NULL,NULL),(124,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 16:27:13',NULL,NULL,NULL,NULL),(125,'企业管理员test','ACCT_MANAGER',0,'2016-01-21 16:27:50',NULL,NULL,NULL,NULL),(126,'企业管理员test','ACCT_MANAGER',0,'2016-01-25 15:32:49',NULL,NULL,NULL,NULL),(127,'企业管理员test','ACCT_MANAGER',0,'2016-01-25 15:38:51',NULL,NULL,NULL,NULL),(128,'企业管理员test','ACCT_MANAGER',0,'2016-01-25 15:46:55',NULL,NULL,NULL,NULL),(129,'企业管理员test','ACCT_MANAGER',0,'2016-01-25 15:47:34',NULL,NULL,NULL,NULL),(130,'企业管理员test','ACCT_MANAGER',0,'2016-01-25 15:59:10',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_role_right`
--

DROP TABLE IF EXISTS `auth_role_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_role_id` int(11) DEFAULT NULL,
  `auth_resource_id` int(11) DEFAULT NULL,
  `auth_type_code` varchar(20) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_role_right`
--

LOCK TABLES `auth_role_right` WRITE;
/*!40000 ALTER TABLE `auth_role_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_role_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acct_id` int(11) DEFAULT NULL,
  `org_dept_id` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `cell_no` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `erp_user_code` varchar(30) DEFAULT NULL,
  `connected_with_erp` char(1) DEFAULT NULL,
  `last_pwd_changed_datetime` datetime DEFAULT NULL,
  `last_login_datetime` datetime DEFAULT NULL,
  `last_failed_datetime` datetime DEFAULT NULL,
  `login_failed_times` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1auth_user` (`cell_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (919,180,NULL,'jnjgadmin','15110284698','','ld09WLvyZ/+PzhLDE0HOmbVvXgedUK2ChCilXM8ufdMTCBU1fFVqVMWd6F1PQvON','c1','Y',NULL,'2016-01-26 14:12:53',NULL,NULL,'A',0,'2016-01-19 11:34:24',NULL,NULL,NULL,NULL),(921,182,NULL,'jnjg2admin','13867876543','','MXVvwCkolHqaBgEsZrWjo8s9Ytn25Pem15UQR9Gs/b5nDjXFwBf+Hw9eDQA1CGw4','c1','Y',NULL,'2016-01-26 16:18:27',NULL,NULL,'A',0,'2016-01-19 13:52:38',NULL,NULL,NULL,NULL),(922,182,-1,'011',NULL,NULL,NULL,'011','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(923,182,-1,'012',NULL,NULL,NULL,'012','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(924,182,-1,'1010',NULL,NULL,NULL,'1010','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(925,182,-1,'aaa111',NULL,NULL,NULL,'aaa111','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(926,182,-1,'ll',NULL,NULL,NULL,'ll','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(927,182,-1,'lishn',NULL,NULL,NULL,'lishn','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(928,182,-1,'wang',NULL,NULL,NULL,'wang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(929,182,-1,'y',NULL,NULL,NULL,'y','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(930,182,-1,'y1',NULL,NULL,NULL,'y1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(931,182,-1,'jianglx',NULL,NULL,NULL,'jianglx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(932,182,-1,'lixfh',NULL,NULL,NULL,'lixfh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(933,182,-1,'lixf',NULL,NULL,NULL,'lixf','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(934,182,-1,'h1',NULL,NULL,NULL,'h1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(935,182,-1,'h2',NULL,NULL,NULL,'h2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(936,182,-1,'h3',NULL,NULL,NULL,'h3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(937,182,-1,'h4',NULL,NULL,NULL,'h4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(938,182,-1,'xm',NULL,NULL,NULL,'xm','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(939,182,-1,'0101',NULL,NULL,NULL,'0101','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(940,182,-1,'0202',NULL,NULL,NULL,'0202','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(941,182,-1,'xx',NULL,NULL,NULL,'xx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(942,182,-1,'a1',NULL,NULL,NULL,'a1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(943,182,-1,'a2',NULL,NULL,NULL,'a2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(944,182,-1,'008',NULL,NULL,NULL,'008','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(945,182,-1,'sf1',NULL,NULL,NULL,'sf1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(946,182,-1,'sf2',NULL,NULL,NULL,'sf2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(947,182,-1,'q',NULL,NULL,NULL,'q','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(948,182,-1,'whj',NULL,NULL,NULL,'whj','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(949,182,-1,'cp',NULL,NULL,NULL,'cp','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(950,182,-1,'d',NULL,NULL,NULL,'d','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(951,182,-1,'y02',NULL,NULL,NULL,'y02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(952,182,-1,'h',NULL,NULL,NULL,'h','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(953,182,-1,'qzh',NULL,NULL,NULL,'qzh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(954,182,-1,'q1',NULL,NULL,NULL,'q1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(955,182,-1,'q2',NULL,NULL,NULL,'q2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(956,182,-1,'dd',NULL,NULL,NULL,'dd','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(957,182,-1,'xjz',NULL,NULL,NULL,'xjz','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(958,182,-1,'25',NULL,NULL,NULL,'25','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(959,182,-1,'26',NULL,NULL,NULL,'26','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(960,182,-1,'11',NULL,NULL,NULL,'11','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(961,182,-1,'22',NULL,NULL,NULL,'22','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(962,182,-1,'33',NULL,NULL,NULL,'33','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(963,182,-1,'nc4',NULL,NULL,NULL,'nc4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(964,182,-1,'nc6',NULL,NULL,NULL,'nc6','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(965,182,-1,'nc7',NULL,NULL,NULL,'nc7','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(966,182,-1,'nc8',NULL,NULL,NULL,'nc8','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(967,182,-1,'nc9',NULL,NULL,NULL,'nc9','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(968,182,-1,'nc10',NULL,NULL,NULL,'nc10','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(969,182,-1,'nc5',NULL,NULL,NULL,'nc5','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(970,182,-1,'nc1',NULL,NULL,NULL,'nc1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(971,182,-1,'nc2',NULL,NULL,NULL,'nc2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(972,182,-1,'nc3',NULL,NULL,NULL,'nc3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(973,182,-1,'ttt',NULL,NULL,NULL,'ttt','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(974,182,-1,'ou1',NULL,NULL,NULL,'ou1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(975,182,-1,'yy',NULL,NULL,NULL,'yy','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(976,182,-1,'zt',NULL,NULL,NULL,'zt','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(977,182,-1,'zz',NULL,NULL,NULL,'zz','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(978,182,-1,'aa',NULL,NULL,NULL,'aa','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(979,182,-1,'txt',NULL,NULL,NULL,'txt','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(980,182,-1,'77',NULL,NULL,NULL,'77','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(981,182,-1,'123',NULL,NULL,NULL,'123','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(982,182,-1,'spc-liuhuiying',NULL,NULL,NULL,'spc-liuhuiying','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(983,182,-1,'spc-chulili',NULL,NULL,NULL,'spc-chulili','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(984,182,-1,'spc-chenying',NULL,NULL,NULL,'spc-chenying','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(985,182,-1,'spc-panshanshan',NULL,NULL,NULL,'spc-panshanshan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(986,182,-1,'spc-zhangyan',NULL,NULL,NULL,'spc-zhangyan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(987,182,-1,'spc-zhangfeng',NULL,NULL,NULL,'spc-zhangfeng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(988,182,-1,'spc-liuyanjuan',NULL,NULL,NULL,'spc-liuyanjuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(989,182,-1,'ufida-oub',NULL,NULL,NULL,'ufida-oub','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(990,182,-1,'zpc-huangshaohui',NULL,NULL,NULL,'zpc-huangshaohui','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(991,182,-1,'spc-yangshuxin',NULL,NULL,NULL,'spc-yangshuxin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(992,182,-1,'spc-gejunwei',NULL,NULL,NULL,'spc-gejunwei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(993,182,-1,'spc-lvdan',NULL,NULL,NULL,'spc-lvdan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(994,182,-1,'spc-yurenning',NULL,NULL,NULL,'spc-yurenning','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(995,182,-1,'spc-anxuemei',NULL,NULL,NULL,'spc-anxuemei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(996,182,-1,'zpc-chenliyun',NULL,NULL,NULL,'zpc-chenliyun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(997,182,-1,'pcc-peichunrong',NULL,NULL,NULL,'pcc-peichunrong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(998,182,-1,'wpc-liudan',NULL,NULL,NULL,'wpc-liudan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(999,182,-1,'wpc-xuli',NULL,NULL,NULL,'wpc-xuli','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1000,182,-1,'wpc-lizemin',NULL,NULL,NULL,'wpc-lizemin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1001,182,-1,'wpc-luxun',NULL,NULL,NULL,'wpc-luxun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1002,182,-1,'wpc-yangfan',NULL,NULL,NULL,'wpc-yangfan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1003,182,-1,'zpc-qinlei',NULL,NULL,NULL,'zpc-qinlei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1004,182,-1,'zpc-zhangmeichun',NULL,NULL,NULL,'zpc-zhangmeichun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1005,182,-1,'zpc-liuqiurong',NULL,NULL,NULL,'zpc-liuqiurong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1006,182,-1,'zpc-youlixian',NULL,NULL,NULL,'zpc-youlixian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1007,182,-1,'zpc-wangzhiping',NULL,NULL,NULL,'zpc-wangzhiping','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1008,182,-1,'bpc-shenji1',NULL,NULL,NULL,'bpc-shenji1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1009,182,-1,'bpc-shenji3',NULL,NULL,NULL,'bpc-shenji3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1010,182,-1,'wpc-huangfengjuan',NULL,NULL,NULL,'wpc-huangfengjuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1011,182,-1,'spc-wulingling',NULL,NULL,NULL,'spc-wulingling','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1012,182,-1,'spc-shaojinbai',NULL,NULL,NULL,'spc-shaojinbai','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1013,182,-1,'dean',NULL,NULL,NULL,'dean','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1014,182,-1,'user01',NULL,NULL,NULL,'user01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1015,182,-1,'BPC-xuzhanlong',NULL,NULL,NULL,'BPC-xuzhanlong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1016,182,-1,'BPC-zhafanghua',NULL,NULL,NULL,'BPC-zhafanghua','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1017,182,-1,'qpc-yukaifang',NULL,NULL,NULL,'qpc-yukaifang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1018,182,-1,'QPC-luyang',NULL,NULL,NULL,'QPC-luyang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1019,182,-1,'QPC-zhangqing',NULL,NULL,NULL,'QPC-zhangqing','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1020,182,-1,'pcc-zhangling',NULL,NULL,NULL,'pcc-zhangling','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1021,182,-1,'BPC-liuwei',NULL,NULL,NULL,'BPC-liuwei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1022,182,-1,'BPC-yanghongbin',NULL,NULL,NULL,'BPC-yanghongbin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1023,182,-1,'BPC-lizheng',NULL,NULL,NULL,'BPC-lizheng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1024,182,-1,'BPC-zhaoli',NULL,NULL,NULL,'BPC-zhaoli','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1025,182,-1,'BPC-yuqian',NULL,NULL,NULL,'BPC-yuqian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1026,182,-1,'BPC-fanjinge',NULL,NULL,NULL,'BPC-fanjinge','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1027,182,-1,'BPC-zhangchunlei',NULL,NULL,NULL,'BPC-zhangchunlei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1028,182,-1,'BPC-zhongxinjun',NULL,NULL,NULL,'BPC-zhongxinjun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1029,182,-1,'BPC-xiaoshou',NULL,NULL,NULL,'BPC-xiaoshou','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1030,182,-1,'BPC-ruanguobin',NULL,NULL,NULL,'BPC-ruanguobin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1031,182,-1,'BPC-zhaiyujing',NULL,NULL,NULL,'BPC-zhaiyujing','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1032,182,-1,'BPC-tangyin',NULL,NULL,NULL,'BPC-tangyin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1033,182,-1,'BPC-wenhaipeng',NULL,NULL,NULL,'BPC-wenhaipeng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1034,182,-1,'spc-yinxiaona',NULL,NULL,NULL,'spc-yinxiaona','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1035,182,-1,'spc-mengxianli',NULL,NULL,NULL,'spc-mengxianli','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1036,182,-1,'pcc-wangxiaoyue',NULL,NULL,NULL,'pcc-wangxiaoyue','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1037,182,-1,'wpc-huangchenliang',NULL,NULL,NULL,'wpc-huangchenliang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1038,182,-1,'wpc-majing',NULL,NULL,NULL,'wpc-majing','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1039,182,-1,'wpc-daitianyong',NULL,NULL,NULL,'wpc-daitianyong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1040,182,-1,'wpc-wanghuijun',NULL,NULL,NULL,'wpc-wanghuijun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1041,182,-1,'wpc-yanfei',NULL,NULL,NULL,'wpc-yanfei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1042,182,-1,'wpc-yangli',NULL,NULL,NULL,'wpc-yangli','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1043,182,-1,'wpc-zengzhiying',NULL,NULL,NULL,'wpc-zengzhiying','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1044,182,-1,'wpc-lijianhua',NULL,NULL,NULL,'wpc-lijianhua','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1045,182,-1,'wpc-xieshixiong',NULL,NULL,NULL,'wpc-xieshixiong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1046,182,-1,'wpc-futian',NULL,NULL,NULL,'wpc-futian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1047,182,-1,'wpc-zhangtianrong',NULL,NULL,NULL,'wpc-zhangtianrong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1048,182,-1,'wpc-tongling',NULL,NULL,NULL,'wpc-tongling','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1049,182,-1,'spc-huwenbao',NULL,NULL,NULL,'spc-huwenbao','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1050,182,-1,'ufida',NULL,NULL,NULL,'ufida','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1051,182,-1,'BPC-shengchan',NULL,NULL,NULL,'BPC-shengchan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1052,182,-1,'bpc-zhikong',NULL,NULL,NULL,'bpc-zhikong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1053,182,-1,'BPC-guoxiaoping',NULL,NULL,NULL,'BPC-guoxiaoping','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1054,182,-1,'BPC-weiling',NULL,NULL,NULL,'BPC-weiling','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1055,182,-1,'QPC-tangjiabao',NULL,NULL,NULL,'QPC-tangjiabao','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1056,182,-1,'pcc-stanley to',NULL,NULL,NULL,'pcc-stanley to','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1057,182,-1,'xuhw',NULL,NULL,NULL,'xuhw','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1058,182,-1,'pcc-wilson',NULL,NULL,NULL,'pcc-wilson','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1059,182,-1,'BPC-renyuan',NULL,NULL,NULL,'BPC-renyuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1060,182,-1,'QPC-zuomiaomiao',NULL,NULL,NULL,'QPC-zuomiaomiao','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1061,182,-1,'QPC-wanlina',NULL,NULL,NULL,'QPC-wanlina','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1062,182,-1,'QPC-sunjie',NULL,NULL,NULL,'QPC-sunjie','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1063,182,-1,'QPC-duhongyu',NULL,NULL,NULL,'QPC-duhongyu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1064,182,-1,'QPC-dinghuachang',NULL,NULL,NULL,'QPC-dinghuachang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1065,182,-1,'QPC-chenchengdong',NULL,NULL,NULL,'QPC-chenchengdong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1066,182,-1,'qpc-liuxiaofei',NULL,NULL,NULL,'qpc-liuxiaofei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1067,182,-1,'QPC-liuxianzhu',NULL,NULL,NULL,'QPC-liuxianzhu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1068,182,-1,'QPC-liqingtao',NULL,NULL,NULL,'QPC-liqingtao','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1069,182,-1,'QPC-xuguofeng',NULL,NULL,NULL,'QPC-xuguofeng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1070,182,-1,'QPC-zhanglili',NULL,NULL,NULL,'QPC-zhanglili','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1071,182,-1,'QPC-liujing',NULL,NULL,NULL,'QPC-liujing','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1072,182,-1,'QPC-lvmeiyu',NULL,NULL,NULL,'QPC-lvmeiyu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1073,182,-1,'QPC-zhangxiuzhu',NULL,NULL,NULL,'QPC-zhangxiuzhu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1074,182,-1,'QPC-fuhai',NULL,NULL,NULL,'QPC-fuhai','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1075,182,-1,'QPC-zhouyong',NULL,NULL,NULL,'QPC-zhouyong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1076,182,-1,'QPC-wanghuahua',NULL,NULL,NULL,'QPC-wanghuahua','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1077,182,-1,'QPC-liushuai',NULL,NULL,NULL,'QPC-liushuai','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1078,182,-1,'QPC-test',NULL,NULL,NULL,'QPC-test','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1079,182,-1,'BPC-yaojian',NULL,NULL,NULL,'BPC-yaojian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1080,182,-1,'BPC-liuheng',NULL,NULL,NULL,'BPC-liuheng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1081,182,-1,'jefry.liu',NULL,NULL,NULL,'jefry.liu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1082,182,-1,'qpc-wangguohui',NULL,NULL,NULL,'qpc-wangguohui','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1083,182,-1,'ufida-sunzhijing',NULL,NULL,NULL,'ufida-sunzhijing','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1084,182,-1,'ufida-xuetingting',NULL,NULL,NULL,'ufida-xuetingting','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1085,182,-1,'BPC-xuxiumei',NULL,NULL,NULL,'BPC-xuxiumei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1086,182,-1,'BPC-wanziqian',NULL,NULL,NULL,'BPC-wanziqian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1087,182,-1,'BPC-lishuping',NULL,NULL,NULL,'BPC-lishuping','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1088,182,-1,'BPC-jiaochunyan',NULL,NULL,NULL,'BPC-jiaochunyan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1089,182,-1,'BPC-liubo',NULL,NULL,NULL,'BPC-liubo','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1090,182,-1,'ufxb1',NULL,NULL,NULL,'ufxb1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1091,182,-1,'wpc-luhaifang',NULL,NULL,NULL,'wpc-luhaifang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1092,182,-1,'zpc-yangzhihong',NULL,NULL,NULL,'zpc-yangzhihong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1093,182,-1,'zpc-chencaiyun',NULL,NULL,NULL,'zpc-chencaiyun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1094,182,-1,'zpc-chenxiujuan',NULL,NULL,NULL,'zpc-chenxiujuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1095,182,-1,'zpc-yanxiaobin',NULL,NULL,NULL,'zpc-yanxiaobin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1096,182,-1,'zpc-huanglili',NULL,NULL,NULL,'zpc-huanglili','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1097,182,-1,'zpc-yelishuang',NULL,NULL,NULL,'zpc-yelishuang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1098,182,-1,'zpc-huangxiaofei',NULL,NULL,NULL,'zpc-huangxiaofei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1099,182,-1,'zpc-zhuyijuan',NULL,NULL,NULL,'zpc-zhuyijuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1100,182,-1,'zpc-ganyahong',NULL,NULL,NULL,'zpc-ganyahong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1101,182,-1,'zpc-kanghuangying',NULL,NULL,NULL,'zpc-kanghuangying','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1102,182,-1,'zpc-guoxiaoguang',NULL,NULL,NULL,'zpc-guoxiaoguang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1103,182,-1,'0001',NULL,NULL,NULL,'0001','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1104,182,-1,'zpc-zhangchunkun',NULL,NULL,NULL,'zpc-zhangchunkun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1105,182,-1,'zpc-liuzhihuang',NULL,NULL,NULL,'zpc-liuzhihuang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1106,182,-1,'zpc-heyiming',NULL,NULL,NULL,'zpc-heyiming','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1107,182,-1,'zpc-yangxiaoyi',NULL,NULL,NULL,'zpc-yangxiaoyi','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1108,182,-1,'zpc-chenhuiqin',NULL,NULL,NULL,'zpc-chenhuiqin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1109,182,-1,'spc-yaozhiwen',NULL,NULL,NULL,'spc-yaozhiwen','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1110,182,-1,'spc-wangyibo',NULL,NULL,NULL,'spc-wangyibo','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1111,182,-1,'spc-limingya',NULL,NULL,NULL,'spc-limingya','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1112,182,-1,'spc-xubaogang',NULL,NULL,NULL,'spc-xubaogang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1113,182,-1,'spc-liuwei',NULL,NULL,NULL,'spc-liuwei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1114,182,-1,'spc-shenxiaodan',NULL,NULL,NULL,'spc-shenxiaodan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1115,182,-1,'spc-weiling',NULL,NULL,NULL,'spc-weiling','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1116,182,-1,'spc-yaojian',NULL,NULL,NULL,'spc-yaojian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1117,182,-1,'spc-shixiaoshu',NULL,NULL,NULL,'spc-shixiaoshu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1118,182,-1,'spc-zhangtao',NULL,NULL,NULL,'spc-zhangtao','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1119,182,-1,'spc-fangshu',NULL,NULL,NULL,'spc-fangshu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1120,182,-1,'zpc-wangshumei',NULL,NULL,NULL,'zpc-wangshumei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1121,182,-1,'zpc-zhengzuoxun',NULL,NULL,NULL,'zpc-zhengzuoxun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1122,182,-1,'zpc-liuchunfeng',NULL,NULL,NULL,'zpc-liuchunfeng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1123,182,-1,'zpc-linlianzhu',NULL,NULL,NULL,'zpc-linlianzhu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1124,182,-1,'spc-lichunning',NULL,NULL,NULL,'spc-lichunning','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1125,182,-1,'g1',NULL,NULL,NULL,'g1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1126,182,-1,'zzz',NULL,NULL,NULL,'zzz','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1127,182,-1,'zong',NULL,NULL,NULL,'zong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1128,182,-1,'jiga1',NULL,NULL,NULL,'jiga1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1129,182,-1,'zhangchaoc',NULL,NULL,NULL,'zhangchaoc','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1130,182,-1,'cw',NULL,NULL,NULL,'cw','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1131,182,-1,'cyfei',NULL,NULL,NULL,'cyfei','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1132,182,-1,'wq01',NULL,NULL,NULL,'wq01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1133,182,-1,'gy1',NULL,NULL,NULL,'gy1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1134,182,-1,'gy2',NULL,NULL,NULL,'gy2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1135,182,-1,'gy3',NULL,NULL,NULL,'gy3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1136,182,-1,'gy4',NULL,NULL,NULL,'gy4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1137,182,-1,'lu',NULL,NULL,NULL,'lu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1138,182,-1,'881',NULL,NULL,NULL,'881','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1139,182,-1,'882',NULL,NULL,NULL,'882','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1140,182,-1,'songtt',NULL,NULL,NULL,'songtt','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1141,182,-1,'zxd1',NULL,NULL,NULL,'zxd1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1142,182,-1,'ou2',NULL,NULL,NULL,'ou2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1143,182,-1,'ou3',NULL,NULL,NULL,'ou3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1144,182,-1,'ou4',NULL,NULL,NULL,'ou4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1145,182,-1,'lhj',NULL,NULL,NULL,'lhj','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1146,182,-1,'hz1',NULL,NULL,NULL,'hz1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1147,182,-1,'hz2',NULL,NULL,NULL,'hz2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1148,182,-1,'hl2',NULL,NULL,NULL,'hl2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1149,182,-1,'27',NULL,NULL,NULL,'27','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1150,182,-1,'28',NULL,NULL,NULL,'28','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1151,182,-1,'20130411',NULL,NULL,NULL,'20130411','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1152,182,-1,'hyq1',NULL,NULL,NULL,'hyq1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1153,182,-1,'r2',NULL,NULL,NULL,'r2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1154,182,-1,'r21',NULL,NULL,NULL,'r21','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1155,182,-1,'r3',NULL,NULL,NULL,'r3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1156,182,-1,'r31',NULL,NULL,NULL,'r31','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1157,182,-1,'29',NULL,NULL,NULL,'29','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1158,182,-1,'24',NULL,NULL,NULL,'24','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1159,182,-1,'y2',NULL,NULL,NULL,'y2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1160,182,-1,'hyl',NULL,NULL,NULL,'hyl','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1161,182,-1,'xyh',NULL,NULL,NULL,'xyh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1162,182,-1,'mm',NULL,NULL,NULL,'mm','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1163,182,-1,'aa01',NULL,NULL,NULL,'aa01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1164,182,-1,'aa02',NULL,NULL,NULL,'aa02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1165,182,-1,'s01',NULL,NULL,NULL,'s01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1166,182,-1,'s02',NULL,NULL,NULL,'s02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1167,182,-1,'cgw',NULL,NULL,NULL,'cgw','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1168,182,-1,'lizf4',NULL,NULL,NULL,'lizf4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1169,182,-1,'lcx',NULL,NULL,NULL,'lcx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1170,182,-1,'zongxh',NULL,NULL,NULL,'zongxh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1171,182,-1,'811',NULL,NULL,NULL,'811','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1172,182,-1,'qpc-wanhaiyan',NULL,NULL,NULL,'qpc-wanhaiyan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1173,182,-1,'spc-wangyang',NULL,NULL,NULL,'spc-wangyang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1174,182,-1,'s03',NULL,NULL,NULL,'s03','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1175,182,-1,'s04',NULL,NULL,NULL,'s04','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1176,182,-1,'cc1',NULL,NULL,NULL,'cc1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1177,182,-1,'cc2',NULL,NULL,NULL,'cc2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1178,182,-1,'cc3',NULL,NULL,NULL,'cc3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1179,182,-1,'zg',NULL,NULL,NULL,'zg','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1180,182,-1,'gz',NULL,NULL,NULL,'gz','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1181,182,-1,'0002',NULL,NULL,NULL,'0002','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1182,182,-1,'34',NULL,NULL,NULL,'34','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1183,182,-1,'liuxg',NULL,NULL,NULL,'liuxg','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1184,182,-1,'jh',NULL,NULL,NULL,'jh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1185,182,-1,'456',NULL,NULL,NULL,'456','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1186,182,-1,'457',NULL,NULL,NULL,'457','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1187,182,-1,'j1',NULL,NULL,NULL,'j1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1188,182,-1,'j2',NULL,NULL,NULL,'j2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1189,182,-1,'gaofeb',NULL,NULL,NULL,'gaofeb','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1190,182,-1,'ufida13',NULL,NULL,NULL,'ufida13','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1191,182,-1,'lwqx',NULL,NULL,NULL,'lwqx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1192,182,-1,'hll01',NULL,NULL,NULL,'hll01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1193,182,-1,'abc',NULL,NULL,NULL,'abc','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1194,182,-1,'812',NULL,NULL,NULL,'812','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1195,182,-1,'xn',NULL,NULL,NULL,'xn','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1196,182,-1,'j3',NULL,NULL,NULL,'j3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1197,182,-1,'2020',NULL,NULL,NULL,'2020','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1198,182,-1,'wjx4',NULL,NULL,NULL,'wjx4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1199,182,-1,'ty01',NULL,NULL,NULL,'ty01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1200,182,-1,'wjx',NULL,NULL,NULL,'wjx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1201,182,-1,'ty',NULL,NULL,NULL,'ty','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1202,182,-1,'lcx1',NULL,NULL,NULL,'lcx1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1203,182,-1,'ly',NULL,NULL,NULL,'ly','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1204,182,-1,'1133',NULL,NULL,NULL,'1133','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1205,182,-1,'ly01',NULL,NULL,NULL,'ly01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1206,182,-1,'999',NULL,NULL,NULL,'999','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1207,182,-1,'901',NULL,NULL,NULL,'901','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1208,182,-1,'sp',NULL,NULL,NULL,'sp','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1209,182,-1,'jj',NULL,NULL,NULL,'jj','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1210,182,-1,'jj1',NULL,NULL,NULL,'jj1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1211,182,-1,'jj2',NULL,NULL,NULL,'jj2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1212,182,-1,'jgy1',NULL,NULL,NULL,'jgy1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1213,182,-1,'jgy2',NULL,NULL,NULL,'jgy2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1214,182,-1,'zzzz',NULL,NULL,NULL,'zzzz','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1215,182,-1,'1293',NULL,NULL,NULL,'1293','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1216,182,-1,'m9',NULL,NULL,NULL,'m9','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1217,182,-1,'gd',NULL,NULL,NULL,'gd','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1218,182,-1,'wangk',NULL,NULL,NULL,'wangk','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1219,182,-1,'yang',NULL,NULL,NULL,'yang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1220,182,-1,'xq',NULL,NULL,NULL,'xq','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1221,182,-1,'wk',NULL,NULL,NULL,'wk','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1222,182,-1,'wk1',NULL,NULL,NULL,'wk1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1223,182,-1,'wk2',NULL,NULL,NULL,'wk2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1224,182,-1,'wk3',NULL,NULL,NULL,'wk3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1225,182,-1,'wk4',NULL,NULL,NULL,'wk4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1226,182,-1,'wk5',NULL,NULL,NULL,'wk5','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1227,182,-1,'yang01',NULL,NULL,NULL,'yang01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1228,182,-1,'yang02',NULL,NULL,NULL,'yang02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1229,182,-1,'12',NULL,NULL,NULL,'12','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1230,182,-1,'xn0',NULL,NULL,NULL,'xn0','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1231,182,-1,'yw01',NULL,NULL,NULL,'yw01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1232,182,-1,'10',NULL,NULL,NULL,'10','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1233,182,-1,'wang1',NULL,NULL,NULL,'wang1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1234,182,-1,'yw0001',NULL,NULL,NULL,'yw0001','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1235,182,-1,'yw110',NULL,NULL,NULL,'yw110','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1236,182,-1,'PCC-dean',NULL,NULL,NULL,'PCC-dean','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1237,182,-1,'BPC-chuhaishan',NULL,NULL,NULL,'BPC-chuhaishan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1238,182,-1,'BPC-cuiyushi',NULL,NULL,NULL,'BPC-cuiyushi','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1239,182,-1,'BPC-tianye',NULL,NULL,NULL,'BPC-tianye','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1240,182,-1,'pcc-jessica',NULL,NULL,NULL,'pcc-jessica','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1241,182,-1,'pcc-eunice',NULL,NULL,NULL,'pcc-eunice','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1242,182,-1,'BPC-yanxiaoqiang',NULL,NULL,NULL,'BPC-yanxiaoqiang','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1243,182,-1,'BPC-dingzhendong',NULL,NULL,NULL,'BPC-dingzhendong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1244,182,-1,'BPC-shenxiaodan',NULL,NULL,NULL,'BPC-shenxiaodan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1245,182,-1,'ufida-jga',NULL,NULL,NULL,'ufida-jga','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1246,182,-1,'ufxb',NULL,NULL,NULL,'ufxb','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1247,182,-1,'pcc-yangshupeng',NULL,NULL,NULL,'pcc-yangshupeng','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1248,182,-1,'pcc-lijin',NULL,NULL,NULL,'pcc-lijin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1249,182,-1,'BPC-jiangyue',NULL,NULL,NULL,'BPC-jiangyue','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1250,182,-1,'ufida-wuling',NULL,NULL,NULL,'ufida-wuling','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1251,182,-1,'ufida-yhy',NULL,NULL,NULL,'ufida-yhy','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1252,182,-1,'pcc-dean1',NULL,NULL,NULL,'pcc-dean1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1253,182,-1,'wpc-maobaohua',NULL,NULL,NULL,'wpc-maobaohua','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1254,182,-1,'wpc-linxueyuan',NULL,NULL,NULL,'wpc-linxueyuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1255,182,-1,'wpc-xiejun',NULL,NULL,NULL,'wpc-xiejun','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1256,182,-1,'wpc-xuping',NULL,NULL,NULL,'wpc-xuping','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1257,182,-1,'wpc-lidehua',NULL,NULL,NULL,'wpc-lidehua','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1258,182,-1,'wpc-xielingyan',NULL,NULL,NULL,'wpc-xielingyan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1259,182,-1,'wpc-caidan',NULL,NULL,NULL,'wpc-caidan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1260,182,-1,'wpc-jiazhen',NULL,NULL,NULL,'wpc-jiazhen','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1261,182,-1,'wpc-xiaoyong',NULL,NULL,NULL,'wpc-xiaoyong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1262,182,-1,'wpc-liuhaiyan',NULL,NULL,NULL,'wpc-liuhaiyan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1263,182,-1,'wpc-wujincui',NULL,NULL,NULL,'wpc-wujincui','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1264,182,-1,'zpc-huangconghui',NULL,NULL,NULL,'zpc-huangconghui','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1265,182,-1,'zpc-chenjinfu',NULL,NULL,NULL,'zpc-chenjinfu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1266,182,-1,'bpc-shenji2',NULL,NULL,NULL,'bpc-shenji2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1267,182,-1,'bpc-shenji4',NULL,NULL,NULL,'bpc-shenji4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1268,182,-1,'zpc-chenjianzhong',NULL,NULL,NULL,'zpc-chenjianzhong','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1269,182,-1,'zpc-wangyijuan',NULL,NULL,NULL,'zpc-wangyijuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1270,182,-1,'zpc-huanghuizhen',NULL,NULL,NULL,'zpc-huanghuizhen','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1271,182,-1,'zpc-kexin',NULL,NULL,NULL,'zpc-kexin','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1272,182,-1,'zpc-wuhuana',NULL,NULL,NULL,'zpc-wuhuana','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1273,182,-1,'zpc-huangxiujuan',NULL,NULL,NULL,'zpc-huangxiujuan','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1274,182,-1,'a01',NULL,NULL,NULL,'a01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1275,182,-1,'lwu',NULL,NULL,NULL,'lwu','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1276,182,-1,'lw1',NULL,NULL,NULL,'lw1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1277,182,-1,'lw2',NULL,NULL,NULL,'lw2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1278,182,-1,'lw3',NULL,NULL,NULL,'lw3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1279,182,-1,'nc012',NULL,NULL,NULL,'nc012','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1280,182,-1,'kk',NULL,NULL,NULL,'kk','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1281,182,-1,'x1',NULL,NULL,NULL,'x1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1282,182,-1,'loubing',NULL,NULL,NULL,'loubing','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1283,182,-1,'911',NULL,NULL,NULL,'911','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1284,182,-1,'hl1',NULL,NULL,NULL,'hl1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1285,182,-1,'yx',NULL,NULL,NULL,'yx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1286,182,-1,'kk22',NULL,NULL,NULL,'kk22','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1287,182,-1,'e1',NULL,NULL,NULL,'e1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1288,182,-1,'w1',NULL,NULL,NULL,'w1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1289,182,-1,'nn1',NULL,NULL,NULL,'nn1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1290,182,-1,'nn2',NULL,NULL,NULL,'nn2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1291,182,-1,'nc008',NULL,NULL,NULL,'nc008','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1292,182,-1,'zx',NULL,NULL,NULL,'zx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1293,182,-1,'sp1',NULL,NULL,NULL,'sp1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1294,182,-1,'cw1',NULL,NULL,NULL,'cw1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1295,182,-1,'cw2',NULL,NULL,NULL,'cw2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1296,182,-1,'zx01',NULL,NULL,NULL,'zx01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1297,182,-1,'zx02',NULL,NULL,NULL,'zx02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1298,182,-1,'ec0002',NULL,NULL,NULL,'ec0002','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1299,182,-1,'621',NULL,NULL,NULL,'621','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1300,182,-1,'y3',NULL,NULL,NULL,'y3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1301,182,-1,'vv',NULL,NULL,NULL,'vv','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1302,182,-1,'xu1',NULL,NULL,NULL,'xu1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1303,182,-1,'xu2',NULL,NULL,NULL,'xu2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1304,182,-1,'xu3',NULL,NULL,NULL,'xu3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1305,182,-1,'0000',NULL,NULL,NULL,'0000','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1306,182,-1,'1111',NULL,NULL,NULL,'1111','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1307,182,-1,'lyc',NULL,NULL,NULL,'lyc','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1308,182,-1,'lyc02',NULL,NULL,NULL,'lyc02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1309,182,-1,'whx',NULL,NULL,NULL,'whx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1310,182,-1,'ww0',NULL,NULL,NULL,'ww0','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1311,182,-1,'ww1',NULL,NULL,NULL,'ww1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1312,182,-1,'wyp1',NULL,NULL,NULL,'wyp1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1313,182,-1,'wyp2',NULL,NULL,NULL,'wyp2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1314,182,-1,'wyp3',NULL,NULL,NULL,'wyp3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1315,182,-1,'r1',NULL,NULL,NULL,'r1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1316,182,-1,'r11',NULL,NULL,NULL,'r11','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1317,182,-1,'h0',NULL,NULL,NULL,'h0','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1318,182,-1,'mwq',NULL,NULL,NULL,'mwq','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1319,182,-1,'fh',NULL,NULL,NULL,'fh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1320,182,-1,'fh1',NULL,NULL,NULL,'fh1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1321,182,-1,'wg',NULL,NULL,NULL,'wg','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1322,182,-1,'cm6',NULL,NULL,NULL,'cm6','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1323,182,-1,'c1',NULL,NULL,NULL,'c1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1324,182,-1,'zhaowg',NULL,NULL,NULL,'zhaowg','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1325,182,-1,'c3',NULL,NULL,NULL,'c3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1326,182,-1,'c4',NULL,NULL,NULL,'c4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1327,182,-1,'c2',NULL,NULL,NULL,'c2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1328,182,-1,'c5',NULL,NULL,NULL,'c5','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1329,182,-1,'wg1',NULL,NULL,NULL,'wg1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1330,182,-1,'wg2',NULL,NULL,NULL,'wg2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1331,182,-1,'songtt1',NULL,NULL,NULL,'songtt1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1332,182,-1,'cp1',NULL,NULL,NULL,'cp1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1333,182,-1,'cp2',NULL,NULL,NULL,'cp2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1334,182,-1,'hyq',NULL,NULL,NULL,'hyq','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1335,182,-1,'a3',NULL,NULL,NULL,'a3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1336,182,-1,'m8',NULL,NULL,NULL,'m8','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1337,182,-1,'g',NULL,NULL,NULL,'g','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1338,182,-1,'g2',NULL,NULL,NULL,'g2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1339,182,-1,'g3',NULL,NULL,NULL,'g3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1340,182,-1,'g4',NULL,NULL,NULL,'g4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1341,182,-1,'g5',NULL,NULL,NULL,'g5','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1342,182,-1,'ss',NULL,NULL,NULL,'ss','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1343,182,-1,'jh01',NULL,NULL,NULL,'jh01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1344,182,-1,'jh02',NULL,NULL,NULL,'jh02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1345,182,-1,'kk11',NULL,NULL,NULL,'kk11','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1346,182,-1,'whx1',NULL,NULL,NULL,'whx1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1347,182,-1,'whx2',NULL,NULL,NULL,'whx2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1348,182,-1,'wuzhn',NULL,NULL,NULL,'wuzhn','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1349,182,-1,'wuzhn1',NULL,NULL,NULL,'wuzhn1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1350,182,-1,'jianglx1',NULL,NULL,NULL,'jianglx1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1351,182,-1,'x2',NULL,NULL,NULL,'x2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1352,182,-1,'x3',NULL,NULL,NULL,'x3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1353,182,-1,'nc61',NULL,NULL,NULL,'nc61','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1354,182,-1,'mmm',NULL,NULL,NULL,'mmm','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1355,182,-1,'tt',NULL,NULL,NULL,'tt','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1356,182,-1,'tian',NULL,NULL,NULL,'tian','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1357,182,-1,'cx',NULL,NULL,NULL,'cx','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1358,182,-1,'1212',NULL,NULL,NULL,'1212','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1359,182,-1,'g01',NULL,NULL,NULL,'g01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1360,182,-1,'g02',NULL,NULL,NULL,'g02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1361,182,-1,'g03',NULL,NULL,NULL,'g03','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1362,182,-1,'g04',NULL,NULL,NULL,'g04','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1363,182,-1,'cm',NULL,NULL,NULL,'cm','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1364,182,-1,'lh01',NULL,NULL,NULL,'lh01','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1365,182,-1,'lh',NULL,NULL,NULL,'lh','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1366,182,-1,'lh02',NULL,NULL,NULL,'lh02','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1367,182,-1,'lh03',NULL,NULL,NULL,'lh03','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1368,182,-1,'cm1',NULL,NULL,NULL,'cm1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1369,182,-1,'cm2',NULL,NULL,NULL,'cm2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1370,182,-1,'cm3',NULL,NULL,NULL,'cm3','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1371,182,-1,'cm4',NULL,NULL,NULL,'cm4','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1372,182,-1,'cm5',NULL,NULL,NULL,'cm5','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1373,182,-1,'hxl',NULL,NULL,NULL,'hxl','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1374,182,-1,'hdl',NULL,NULL,NULL,'hdl','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1375,182,-1,'xd',NULL,NULL,NULL,'xd','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1376,182,-1,'xb',NULL,NULL,NULL,'xb','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1377,182,-1,'xn1',NULL,NULL,NULL,'xn1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1378,182,-1,'xx1',NULL,NULL,NULL,'xx1','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1379,183,NULL,'li','13401157658','','zzx6M9HPFjE5TWKwDgB1M8J5LEbj3xMOvxgKABkWxd/cdWRTOzLDHqhbBBJ777fX','c1','Y',NULL,'2016-01-28 09:28:39',NULL,NULL,'A',0,'2016-01-19 14:00:21',NULL,NULL,NULL,NULL),(1380,184,NULL,'lj2','1678765432','','JXn2bpWw/pt+Fhkoyt6kzBQceP2uUABTOkw8hmgzCk7B70tM8rgB9JrxzMs6XyCT','c1','Y',NULL,'2016-01-20 10:20:28',NULL,NULL,'A',0,'2016-01-20 09:45:37',NULL,NULL,NULL,NULL),(1381,123,NULL,'zhangye','91cfc8af-a9','test@yonyou.com','kkvw3ruBLWj7YNCIETdHB9mq4JHkyl8Bz8nuShE94/vLyzm8CSpvuwjBp+93vTi4',NULL,NULL,NULL,'2016-01-27 13:52:48',NULL,NULL,'A',0,'2016-01-20 11:57:32',NULL,NULL,NULL,NULL),(1382,0,NULL,'zhang','12345678901','','ywOcLTHvKpL0sQx79VgE2/Lz+QvKfMfQfl1SbigNKdPopRQo8LFA1Utr5hwWTpLV','c1','Y',NULL,'2016-01-25 15:59:16',NULL,NULL,'A',0,'2016-01-21 11:02:15',NULL,NULL,NULL,NULL),(1383,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 11:02:20',NULL,NULL,0,'2016-01-25 15:59:07'),(1384,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 11:02:26',NULL,NULL,NULL,NULL),(1385,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1386,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1387,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1388,123,NULL,'zhangye','e5514dc6-37','test@yonyou.com','eqH7MtbOYr7oBa88TwpYxDzq+qbLLkIV6scVgiyZH1FAxWi2MJNnm7FT0tLCqkWX','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-21 11:02:28',NULL,NULL,NULL,NULL),(1389,123,NULL,'zhangye','a9b7af2b-21','test@yonyou.com','YfMEfWmp6exCEVYfW65rnjvu/xJToryZ5JTuv9mhSy65DsRyDCHiReZltIGr/zTf','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-21 11:02:31',NULL,NULL,NULL,NULL),(1390,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 11:14:07',NULL,NULL,0,'2016-01-25 15:59:07'),(1391,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 11:14:13',NULL,NULL,NULL,NULL),(1392,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1393,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1394,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1395,123,NULL,'zhangye','3bfce246-84','test@yonyou.com','pWrp//pcRNB/qIFogOFEFE/M/qOy4b13ZJRovMJ5hGMi/aQhb8vD7zj3e6iiSjQo','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-21 11:14:14',NULL,NULL,NULL,NULL),(1396,123,NULL,'zhangye','949f8fd2-d9','test@yonyou.com','MdhKS3u3gbmwjmTc5alKLsKcnKPacuZGA7JDzYwJaNHlma6urCY0Ef0w+TnkdSR0','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-21 11:14:17',NULL,NULL,NULL,NULL),(1397,185,NULL,'geadmin','123454321','','5U6yeS0j6cbYYVjcJ1BFMdWOVrhm8AEXd0ES/SP7RFKgnL7yJS7g08rh3dB5sD/N','c1','Y',NULL,'2016-01-28 09:32:31',NULL,NULL,'A',0,'2016-01-21 13:43:16',NULL,NULL,NULL,NULL),(1398,186,NULL,'zhaowg','12','','x8eUK+TFmb3CplCjcGyJbphhanJ9Avci9oTQG5unKamib+qH0fAPHL05046WLKVd','c1','Y',NULL,'2016-01-21 16:04:12',NULL,NULL,'A',0,'2016-01-21 15:47:11',NULL,NULL,NULL,NULL),(1399,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:19:54',NULL,NULL,0,'2016-01-25 15:59:07'),(1400,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 16:19:56',NULL,NULL,NULL,NULL),(1401,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1402,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1403,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1404,123,NULL,'zhangye','0aa47dca-36','test@yonyou.com','zPAq0NVPYxjJCNI7xX6/toZLsokp2bSXlZoed1AD9Abgs/usxlzxo+t7vZWnzPSC','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-21 16:20:29',NULL,NULL,NULL,NULL),(1405,123,NULL,'zhangye','776f5d8b-22','test@yonyou.com','PzjPH63dWlm+/+gSpx/6n/hhbSnf205W8ptoEkMcgZY4JjtWXHDn0GsD+cbe2omE','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:20:31',NULL,NULL,NULL,NULL),(1406,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:21:13',NULL,NULL,0,'2016-01-25 15:59:07'),(1407,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 16:21:15',NULL,NULL,NULL,NULL),(1408,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1409,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1410,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:23:35',NULL,NULL,0,'2016-01-25 15:59:07'),(1411,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 16:23:37',NULL,NULL,NULL,NULL),(1412,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1413,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1414,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1415,123,NULL,'zhangye','59f80fe0-e5','test@yonyou.com','38c+YV9AVlzFLwHCzcT/X5CG6PkQCSRLf36jUs7G1Hv5DJx0lzhUk01uVFD4xxjX','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-21 16:23:39',NULL,NULL,NULL,NULL),(1416,123,NULL,'zhangye','8311a729-94','test@yonyou.com','6FAmw/wr3+240bHL0t7Q0KL8a67egzixzHTlKrRcnUhV2nya8er1M+w3XHXYEEt8','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:23:41',NULL,NULL,NULL,NULL),(1417,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:27:11',NULL,NULL,0,'2016-01-25 15:59:07'),(1418,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 16:27:13',NULL,NULL,NULL,NULL),(1419,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1420,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1421,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1422,123,NULL,'zhangye','d6f96b05-d7','test@yonyou.com','wmRY8djh0MLfnk2m6AM1HHt888HxeH7PAyDnhX6G0RXOb7Rx+1V2BulcLALuDHxj','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-21 16:27:16',NULL,NULL,NULL,NULL),(1423,123,NULL,'zhangye','565b207e-05','test@yonyou.com','ue2EkCbhLlzsal9s4LdxS4gjYZ10yqVNXmFekLpXb99LLC9TlzPSgHyvllXi3UUU','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:27:18',NULL,NULL,NULL,NULL),(1424,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:27:47',NULL,NULL,0,'2016-01-25 15:59:07'),(1425,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-21 16:27:50',NULL,NULL,NULL,NULL),(1426,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1427,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1428,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1429,123,NULL,'zhangye','9a6a953e-98','test@yonyou.com','XPJQ4bGAyjUfsU5eekfi+7JPedHd//cDzVgxegzRlyJZaE3CbE7dsvuuzurFg1vc','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-21 16:27:52',NULL,NULL,NULL,NULL),(1430,123,NULL,'zhangye','23b62a45-01','test@yonyou.com','+Qy5n93ghrmOa9556ZVJZ8I8gI0A3L3qat9T2lMosT+tqgw95wuOMBXQF2oXaD5s','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-21 16:27:54',NULL,NULL,NULL,NULL),(1431,123,-1,'???????????','???','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-21 19:51:18',NULL,NULL,NULL,NULL),(1432,123,-1,'???????????','???','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-21 19:53:32',NULL,NULL,NULL,NULL),(1433,123,-1,'???????????','???','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-21 19:57:48',NULL,NULL,NULL,NULL),(1434,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-21 20:01:06',NULL,NULL,NULL,NULL),(1435,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-21 20:08:34',NULL,NULL,NULL,NULL),(1436,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:32:11',NULL,NULL,NULL,NULL),(1437,123,NULL,'zhangye','765f8a1c-c9','test@yonyou.com','mh+snpibGRSF4xgSu5B1d3R0TkUwc7XR4DAaVSKvPzFr3CAoCFW5sF1z4uc4iqVc','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:32:10',NULL,NULL,NULL,NULL),(1438,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-25 15:32:12',NULL,NULL,NULL,NULL),(1439,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:32:47',NULL,NULL,0,'2016-01-25 15:59:07'),(1440,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25 15:32:49',NULL,NULL,NULL,NULL),(1441,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1442,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1443,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:32:52',NULL,NULL,NULL,NULL),(1444,123,NULL,'zhangye','a0fa72e0-dd','test@yonyou.com','w65EBcrO59uS9HXBjnnPvmcjZLL1ATdJGj2a9aVI5bST/q+SnjGlqgLc7xSC2xlh','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:32:51',NULL,NULL,NULL,NULL),(1445,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-25 15:32:53',NULL,NULL,NULL,NULL),(1446,123,NULL,'zhangye','7ffc9853-ab','test@yonyou.com','ljhHdoiVdeRTryscEfQn536vWcsbrAMtkd5EUYQEMZJsg71id1msRnTulwpfGc58','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:32:53',NULL,NULL,NULL,NULL),(1447,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:38:49',NULL,NULL,0,'2016-01-25 15:59:07'),(1448,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25 15:38:51',NULL,NULL,NULL,NULL),(1449,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1450,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1451,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:38:54',NULL,NULL,NULL,NULL),(1452,123,NULL,'zhangye','9dabd9ad-57','test@yonyou.com','TU7Ll/yFh4bmtKs2TaqojURLMF5Y2EStbG/s4MJzh/PYa0jw60Xpf1YjKYm4iVh0','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:38:52',NULL,NULL,NULL,NULL),(1453,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-25 15:38:54',NULL,NULL,NULL,NULL),(1454,123,NULL,'zhangye','43527dd9-e0','test@yonyou.com','zGgg/vBZ3iP2PjPYoESUOdcDD7aBTt176ChVUJ0NlEpq5PpzQsm7dWQmgvrLXhZi','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:38:55',NULL,NULL,NULL,NULL),(1455,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:46:53',NULL,NULL,0,'2016-01-25 15:59:07'),(1456,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25 15:46:55',NULL,NULL,NULL,NULL),(1457,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1458,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1459,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:47:31',NULL,NULL,0,'2016-01-25 15:59:07'),(1460,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25 15:47:34',NULL,NULL,NULL,NULL),(1461,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1462,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1463,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:47:38',NULL,NULL,NULL,NULL),(1464,123,NULL,'zhangye','0ea2ad5c-4c','test@yonyou.com','xx0elBlnEYtdOqNbhSGKF0j6HE21vUuzfQM0yW1RAUe0eNeM8Eq8iQDTNJ38rOKZ','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:47:36',NULL,NULL,NULL,NULL),(1465,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-25 15:47:38',NULL,NULL,NULL,NULL),(1466,123,NULL,'zhangye','c2deb418-04','test@yonyou.com','M2x0yTTphQGOu+Q8dnl9KmqDjVF27H2n7RCsZui9ZlqTDfjQtduSjlapiUeT9npY','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:47:39',NULL,NULL,NULL,NULL),(1467,123,NULL,'zhangye','8101882b-46','test@yonyou.com','2Eq2u22EtjrgH6IKsYDtdfvg82jv6saH3wGAbOLN68ZWcv/6aQFEVQtn4+53OahW','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:57:10',NULL,NULL,NULL,NULL),(1468,111111,NULL,'auth_test_userName','auth_test_cell_no','auth_test_email','auth_test_password*123',NULL,NULL,NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:59:07',NULL,NULL,NULL,NULL),(1469,NULL,NULL,'inserted by mybatis','12312312399',NULL,'*123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-01-25 15:59:10',NULL,NULL,NULL,NULL),(1470,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1471,NULL,NULL,NULL,NULL,NULL,NULL,'erp_code2','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1472,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:59:14',NULL,NULL,NULL,NULL),(1473,123,NULL,'zhangye','7e2d19d4-ba','test@yonyou.com','1X1RSRvAHGttu3IV0OYBAVIkvuw/lkfMXG0PeE2l2N7/weTqq85aP/YWk3q1DPLU','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 15:59:13',NULL,NULL,NULL,NULL),(1474,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-25 15:59:15',NULL,NULL,NULL,NULL),(1475,123,NULL,'zhangye','1c649a75-61','test@yonyou.com','LN9opLoW+z0PH26Y1UAw2roO7/X6h7aPLYACc4n3SCnvwBfzBwf/YEKToyBF/zK2','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 15:59:16',NULL,NULL,NULL,NULL),(1476,188,NULL,'zy','13401157687','','rXHbh1/GXjyvWpQJrQ0vu6X0rWA0O/+Tx2Do1PDlDYPIQPDBTFD5dlSi2KE+z5vE','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 16:23:03',NULL,NULL,NULL,NULL),(1477,123,NULL,'zhangye','c2eb1a1e-22','test@yonyou.com','eCJFX1HNfcb6WsFw2ABuikj7fEtcwcIRgQe03JGlOb0xhuxZyERqoew7s2ay1cfP','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 16:29:02',NULL,NULL,NULL,NULL),(1478,190,NULL,'zy','13401157999','','DWYy3yjMvqNCOLbAfyZh2J7iOkhqtLhQGeZoKGF3LEQiKHh+tYdkcG027UOQUJMg','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 16:33:14',NULL,NULL,NULL,NULL),(1479,123,-1,NULL,NULL,'erp1@yonyou.com',NULL,NULL,'Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 17:02:32',NULL,NULL,NULL,NULL),(1480,123,NULL,'zhangye','2ab8a653-30','test@yonyou.com','anXBO6a0q4PV8Nfo4SaqP8gPQVtz0CkLutN/fPBSvzswj8R3XyfHtFsSFvg0O+Z9','c1','Y',NULL,NULL,NULL,NULL,'A',1381,'2016-01-25 17:02:31',NULL,NULL,NULL,NULL),(1481,123,-1,'管理员手动创建的用户名','手机号','someone@test.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'I',1381,'2016-01-25 17:02:34',NULL,NULL,NULL,NULL),(1482,196,NULL,'zy','13401157444','','ZPqlKEqKNVWjyKGCMg2Yi82P5k9XQ6YLCUUtwJ8xyWhWJEdd7b4L6fSLSYMYgfYR','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:07:28',NULL,NULL,NULL,NULL),(1483,202,NULL,'zy','13401157111','','2TkeVTB8Yzf9ICvisc7zligEbYXKB4BJBBW/qL02sQy+Gfzg5wKGFNVe5r9GCr2X','c1','Y',NULL,'2016-01-26 15:39:28',NULL,NULL,'A',0,'2016-01-25 17:20:00',NULL,NULL,NULL,NULL),(1484,204,NULL,'zy','13401157222','','8hG+zuTkkGY227te7Prxyddj1LMU33UxYqRcWVTMZPXGPSmUVCtnrdNxI0iO8f9y','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:24:38',NULL,NULL,NULL,NULL),(1485,205,NULL,'zy','13401157333','','88/Kt17Dufzsq1eHCjyDDknw760aeG/xDB0kIdSxxc42Q8ZA1agGddMeldjXSiHq','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:27:50',NULL,NULL,NULL,NULL),(1486,207,NULL,'zy','13401157555','','nxJ5xOphLZABx81lXUG7sRVRKsTEmHhh4hEIAIBmsULLOS43E93GsP7CC4JxKQZS','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:29:51',NULL,NULL,NULL,NULL),(1487,208,NULL,'zy','13401151111','','D0vDXT0dDRckpp4rLraByRgLC2H3kCcATzaO9Acg8tfv2I75t1aZcZ1EAbpLvhjK','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:32:01',NULL,NULL,NULL,NULL),(1488,209,NULL,'zy','13401151112','','8m//ib4ViNSn3VJACO5JeqaKBoRxCGpJUhRhxrgwRI82M3OrQ/GYtHwlxfdRVot4','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:33:18',NULL,NULL,NULL,NULL),(1489,210,NULL,'zy','13401151113','','jfs1KgudQSCodawGsiq5YuZ5mgtJ/iVF5LQjG+sJd7tclG+hU9P9KUZHL7j5QGx9','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:34:27',NULL,NULL,NULL,NULL),(1490,211,NULL,'zy','13401151114','','AbCEQkoENjfvqw/b5RqxUs14lu8y1UKf9cP2co8AGSkxheR1OoKiY5e0Kf9Ogd/7','c1','Y',NULL,NULL,NULL,NULL,'A',0,'2016-01-25 17:35:43',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_role`
--

DROP TABLE IF EXISTS `auth_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) DEFAULT NULL,
  `auth_acct_role_id` int(11) DEFAULT NULL,
  `auth_type_code` varchar(20) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_role`
--

LOCK TABLES `auth_user_role` WRITE;
/*!40000 ALTER TABLE `auth_user_role` DISABLE KEYS */;
INSERT INTO `auth_user_role` VALUES (97,919,96,'A',0,'2016-01-19 11:51:16',NULL,NULL,NULL,NULL),(99,921,98,'A',0,'2016-01-19 14:09:30',NULL,NULL,NULL,NULL),(100,1379,99,'A',0,'2016-01-19 14:17:13',NULL,NULL,NULL,NULL),(101,1380,100,'A',0,'2016-01-20 10:02:32',NULL,NULL,NULL,NULL),(102,1381,101,'A',0,'2016-01-20 11:57:34',NULL,NULL,NULL,NULL),(103,1382,102,'A',0,'2016-01-21 11:02:19',NULL,NULL,NULL,NULL),(104,12,9,'A',0,'2016-01-21 11:02:26',NULL,NULL,NULL,NULL),(105,17,104,'A',0,'2016-01-21 11:02:28',NULL,NULL,NULL,NULL),(106,1388,105,'A',0,'2016-01-21 11:02:32',NULL,NULL,NULL,NULL),(107,1389,106,'A',0,'2016-01-21 11:02:35',NULL,NULL,NULL,NULL),(108,12,9,'A',0,'2016-01-21 11:14:13',NULL,NULL,NULL,NULL),(109,17,108,'A',0,'2016-01-21 11:14:15',NULL,NULL,NULL,NULL),(110,1395,109,'A',0,'2016-01-21 11:14:18',NULL,NULL,NULL,NULL),(111,1396,110,'A',0,'2016-01-21 11:14:21',NULL,NULL,NULL,NULL),(112,1397,111,'A',0,'2016-01-21 14:00:16',NULL,NULL,NULL,NULL),(113,1398,112,'A',0,'2016-01-21 16:04:11',NULL,NULL,NULL,NULL),(114,12,9,'A',0,'2016-01-21 16:19:56',NULL,NULL,NULL,NULL),(115,17,114,'A',0,'2016-01-21 16:19:57',NULL,NULL,NULL,NULL),(116,1404,116,'A',0,'2016-01-21 16:20:30',NULL,NULL,NULL,NULL),(117,1405,118,'A',0,'2016-01-21 16:20:32',NULL,NULL,NULL,NULL),(118,12,9,'A',0,'2016-01-21 16:21:15',NULL,NULL,NULL,NULL),(119,17,121,'A',0,'2016-01-21 16:21:16',NULL,NULL,NULL,NULL),(120,12,9,'A',0,'2016-01-21 16:23:37',NULL,NULL,NULL,NULL),(121,17,124,'A',0,'2016-01-21 16:23:38',NULL,NULL,NULL,NULL),(122,1415,126,'A',0,'2016-01-21 16:23:40',NULL,NULL,NULL,NULL),(123,1416,128,'A',0,'2016-01-21 16:23:43',NULL,NULL,NULL,NULL),(124,12,9,'A',0,'2016-01-21 16:27:13',NULL,NULL,NULL,NULL),(125,17,131,'A',0,'2016-01-21 16:27:14',NULL,NULL,NULL,NULL),(126,1422,133,'A',0,'2016-01-21 16:27:17',NULL,NULL,NULL,NULL),(127,1423,135,'A',0,'2016-01-21 16:27:19',NULL,NULL,NULL,NULL),(128,12,9,'A',0,'2016-01-21 16:27:50',NULL,NULL,NULL,NULL),(129,17,138,'A',0,'2016-01-21 16:27:51',NULL,NULL,NULL,NULL),(130,1429,140,'A',0,'2016-01-21 16:27:53',NULL,NULL,NULL,NULL),(131,1430,142,'A',0,'2016-01-21 16:27:56',NULL,NULL,NULL,NULL),(132,1437,144,'A',0,'2016-01-25 15:32:11',NULL,NULL,NULL,NULL),(133,12,9,'A',0,'2016-01-25 15:32:49',NULL,NULL,NULL,NULL),(134,17,147,'A',0,'2016-01-25 15:32:50',NULL,NULL,NULL,NULL),(135,1444,149,'A',0,'2016-01-25 15:32:53',NULL,NULL,NULL,NULL),(136,1446,151,'A',0,'2016-01-25 15:32:55',NULL,NULL,NULL,NULL),(137,12,9,'A',0,'2016-01-25 15:38:51',NULL,NULL,NULL,NULL),(138,17,154,'A',0,'2016-01-25 15:38:52',NULL,NULL,NULL,NULL),(139,1452,156,'A',0,'2016-01-25 15:38:54',NULL,NULL,NULL,NULL),(140,1454,158,'A',0,'2016-01-25 15:38:56',NULL,NULL,NULL,NULL),(141,12,9,'A',0,'2016-01-25 15:46:56',NULL,NULL,NULL,NULL),(142,17,161,'A',0,'2016-01-25 15:46:57',NULL,NULL,NULL,NULL),(143,12,9,'A',0,'2016-01-25 15:47:34',NULL,NULL,NULL,NULL),(144,17,164,'A',0,'2016-01-25 15:47:35',NULL,NULL,NULL,NULL),(145,1464,166,'A',0,'2016-01-25 15:47:38',NULL,NULL,NULL,NULL),(146,1466,168,'A',0,'2016-01-25 15:47:41',NULL,NULL,NULL,NULL),(147,1467,170,'A',0,'2016-01-25 15:57:11',NULL,NULL,NULL,NULL),(148,12,9,'A',0,'2016-01-25 15:59:10',NULL,NULL,NULL,NULL),(149,17,173,'A',0,'2016-01-25 15:59:11',NULL,NULL,NULL,NULL),(150,1473,175,'A',0,'2016-01-25 15:59:14',NULL,NULL,NULL,NULL),(151,1475,177,'A',0,'2016-01-25 15:59:17',NULL,NULL,NULL,NULL),(152,1476,179,'A',0,'2016-01-25 16:40:18',NULL,NULL,NULL,NULL),(153,1477,181,'A',0,'2016-01-25 16:29:04',NULL,NULL,NULL,NULL),(154,1478,183,'A',0,'2016-01-25 16:50:29',NULL,NULL,NULL,NULL),(155,1480,185,'A',0,'2016-01-25 17:02:33',NULL,NULL,NULL,NULL),(156,1482,187,'A',0,'2016-01-25 17:24:43',NULL,NULL,NULL,NULL),(157,1483,189,'A',0,'2016-01-25 17:37:16',NULL,NULL,NULL,NULL),(158,1484,191,'A',0,'2016-01-25 17:41:53',NULL,NULL,NULL,NULL),(159,1485,193,'A',0,'2016-01-25 17:45:06',NULL,NULL,NULL,NULL),(160,1486,195,'A',0,'2016-01-25 17:47:07',NULL,NULL,NULL,NULL),(161,1487,197,'A',0,'2016-01-25 17:49:16',NULL,NULL,NULL,NULL),(162,1488,199,'A',0,'2016-01-25 17:50:33',NULL,NULL,NULL,NULL),(163,1489,201,'A',0,'2016-01-25 17:51:42',NULL,NULL,NULL,NULL),(164,1490,203,'A',0,'2016-01-25 17:52:59',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `auth_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_role`
--

DROP TABLE IF EXISTS `biz_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_role`
--

LOCK TABLES `biz_role` WRITE;
/*!40000 ALTER TABLE `biz_role` DISABLE KEYS */;
INSERT INTO `biz_role` VALUES (2,'center_enterprise','核心企业',NULL,NULL,NULL,NULL,NULL,NULL),(3,'channel','渠道',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `biz_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biz_role_rel`
--

DROP TABLE IF EXISTS `biz_role_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biz_role_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `biz_role_id` int(11) NOT NULL,
  `partner_biz_role_id` int(11) NOT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biz_role_rel`
--

LOCK TABLES `biz_role_rel` WRITE;
/*!40000 ALTER TABLE `biz_role_rel` DISABLE KEYS */;
INSERT INTO `biz_role_rel` VALUES (1,2,3,'分销关系',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `biz_role_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_acct`
--

DROP TABLE IF EXISTS `org_acct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_acct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `acct_type` varchar(20) DEFAULT NULL,
  `acct_code` varchar(60) DEFAULT NULL,
  `acct_name` varchar(60) DEFAULT NULL,
  `enable_erp_user` tinyint(1) DEFAULT '0',
  `status` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1auth_acct` (`acct_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_acct`
--

LOCK TABLES `org_acct` WRITE;
/*!40000 ALTER TABLE `org_acct` DISABLE KEYS */;
INSERT INTO `org_acct` VALUES (3,NULL,'PARTNER',NULL,'卡洛进出口有限公司',0,'A',0,'2016-01-25 17:35:43',NULL,NULL,NULL,NULL),(4,NULL,'PARTNER',NULL,'北京回龙观分店',0,'A',0,'2016-01-25 17:35:43',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `org_acct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_acct_app_inst`
--

DROP TABLE IF EXISTS `org_acct_app_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_acct_app_inst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acct_id` int(11) DEFAULT NULL,
  `app_version_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_acct_app_inst`
--

LOCK TABLES `org_acct_app_inst` WRITE;
/*!40000 ALTER TABLE `org_acct_app_inst` DISABLE KEYS */;
INSERT INTO `org_acct_app_inst` VALUES (1,3,5,0,NULL,NULL,NULL,NULL,NULL),(2,3,6,0,NULL,NULL,NULL,NULL,NULL),(3,3,7,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `org_acct_app_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_acct_app_inst_activity`
--

DROP TABLE IF EXISTS `org_acct_app_inst_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_acct_app_inst_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acct_app_inst_id` int(11) DEFAULT NULL,
  `app_activity_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_acct_app_inst_activity`
--

LOCK TABLES `org_acct_app_inst_activity` WRITE;
/*!40000 ALTER TABLE `org_acct_app_inst_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_acct_app_inst_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_acct_biz_role`
--

DROP TABLE IF EXISTS `org_acct_biz_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_acct_biz_role` (
  `org_acct_id` int(11) NOT NULL,
  `biz_role_id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`org_acct_id`,`biz_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_acct_biz_role`
--

LOCK TABLES `org_acct_biz_role` WRITE;
/*!40000 ALTER TABLE `org_acct_biz_role` DISABLE KEYS */;
INSERT INTO `org_acct_biz_role` VALUES (3,2,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `org_acct_biz_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_dept`
--

DROP TABLE IF EXISTS `org_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_acct_id` int(11) DEFAULT NULL,
  `dept_name` varchar(60) DEFAULT NULL,
  `dept_manager` varchar(30) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `XIE1auth_department` (`dept_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_dept`
--

LOCK TABLES `org_dept` WRITE;
/*!40000 ALTER TABLE `org_dept` DISABLE KEYS */;
INSERT INTO `org_dept` VALUES (40,89,'财务部','李平',16,'2015-12-09 13:28:46',NULL,NULL,NULL,NULL),(41,89,'开发部','aaa',905,'2015-12-14 08:57:19',NULL,NULL,NULL,NULL),(42,89,'','',1379,'2016-01-20 08:41:57',NULL,NULL,NULL,NULL),(43,89,'12','12',1398,'2016-01-21 15:47:49',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `org_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_internal`
--

DROP TABLE IF EXISTS `org_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_internal` (
  `id` int(11) NOT NULL,
  `org_dept_id` int(11) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_internal`
--

LOCK TABLES `org_internal` WRITE;
/*!40000 ALTER TABLE `org_internal` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_internal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_partner`
--

DROP TABLE IF EXISTS `org_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_partner` (
  `id` int(11) NOT NULL,
  `industry_code` varchar(20) DEFAULT NULL,
  `area_code` varchar(20) DEFAULT NULL,
  `ownership_code` varchar(20) DEFAULT NULL,
  `invitation_code` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website_url` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_partner`
--

LOCK TABLES `org_partner` WRITE;
/*!40000 ALTER TABLE `org_partner` DISABLE KEYS */;
INSERT INTO `org_partner` VALUES (1,'0','110108','100',NULL,NULL,NULL,NULL,NULL,NULL,1,'2016-01-01 18:55:55',NULL,NULL,NULL,NULL),(180,'0','0','100','','','','','','',1,'2016-01-19 11:34:23',NULL,NULL,NULL,NULL),(181,'0','0','100','','','','','','',1,'2016-01-19 12:16:09',NULL,NULL,NULL,NULL),(182,'交通运输类','320000','100','','','','','','南京市白下路',1,'2016-01-19 13:52:36',NULL,NULL,NULL,NULL),(183,'0','0','100','','','','','','',1,'2016-01-19 14:00:20',NULL,NULL,NULL,NULL),(184,'0','0','100','','','','','','',1,'2016-01-20 09:45:37',NULL,NULL,NULL,NULL),(185,'0','0','100','','','','','','',1,'2016-01-21 13:43:15',NULL,NULL,NULL,NULL),(186,'0','0','100','','','','','','',1,'2016-01-21 15:47:10',NULL,NULL,NULL,NULL),(188,'0','0','100','','','','','','',1,'2016-01-25 16:23:01',NULL,NULL,NULL,NULL),(190,'0','0','100','','','','','','',1,'2016-01-25 16:33:13',NULL,NULL,NULL,NULL),(196,'0','0','100','','','','','','',1,'2016-01-25 17:07:27',NULL,NULL,NULL,NULL),(202,'0','0','100','','','','','','',1,'2016-01-25 17:20:00',NULL,NULL,NULL,NULL),(204,'0','0','100','','','','','','',1,'2016-01-25 17:24:32',NULL,NULL,NULL,NULL),(205,'0','0','100','','','','','','',1,'2016-01-25 17:27:50',NULL,NULL,NULL,NULL),(207,'0','0','100','','','','','','',1,'2016-01-25 17:29:51',NULL,NULL,NULL,NULL),(208,'0','0','100','','','','','','',1,'2016-01-25 17:32:01',NULL,NULL,NULL,NULL),(209,'0','0','100','','','','','','',1,'2016-01-25 17:33:17',NULL,NULL,NULL,NULL),(210,'0','0','100','','','','','','',1,'2016-01-25 17:34:27',NULL,NULL,NULL,NULL),(211,'0','0','100','','','','','','',1,'2016-01-25 17:35:43',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `org_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sys_config_type_id` int(11) DEFAULT NULL,
  `config_name` varchar(30) DEFAULT NULL,
  `config_value` varchar(90) DEFAULT NULL,
  `config_desc` varchar(160) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `XAK1sys_config` (`sys_config_type_id`,`config_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,1,'max.failed.limit','5','最多连续登录失败次数',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(2,1,'duartion.locked','20','锁定时长（分钟）',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(3,1,'duration.pwd.lifetime','3','密码有效期（月），0为永久有效',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config_type`
--

DROP TABLE IF EXISTS `sys_config_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config_type` (
  `id` int(11) NOT NULL DEFAULT '0',
  `config_type_name` varchar(30) DEFAULT NULL,
  `config_type_desc` varchar(160) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `XAK1sys_config_type` (`config_type_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config_type`
--

LOCK TABLES `sys_config_type` WRITE;
/*!40000 ALTER TABLE `sys_config_type` DISABLE KEYS */;
INSERT INTO `sys_config_type` VALUES (1,'security.configuration','121Cloud安全配置选项',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_config_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_enum`
--

DROP TABLE IF EXISTS `sys_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_enum` (
  `id` int(11) NOT NULL DEFAULT '0',
  `enum_type_id` int(11) DEFAULT NULL,
  `seq_no` int(11) DEFAULT NULL,
  `enum_code` varchar(20) DEFAULT NULL,
  `enum_value` varchar(30) DEFAULT NULL,
  `enum_desc` varchar(160) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `XAK1sys_enum` (`enum_type_id`,`enum_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_enum`
--

LOCK TABLES `sys_enum` WRITE;
/*!40000 ALTER TABLE `sys_enum` DISABLE KEYS */;
INSERT INTO `sys_enum` VALUES (10,1,1,'A','Active','标识当前行有效','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(11,1,2,'D','Discontinued','标识当前行无效','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(20,2,1,'A','Assign','授权','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(21,2,2,'R','Revocation','取消授权','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(30,3,1,'ADMIN','Administrator Role','管理员角色','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(31,3,2,'BIZ','Business Role','业务角色','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(41,4,1,'APP_CATALOG','应用','应用','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(42,4,2,'APP_ACTIVITY','应用活动','应用活动','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(43,4,3,'APP_OPERATION','应用活动操作','应用活动操作','A',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(44,4,4,'APP_DATA','数据权限','数据权限','D',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(50,5,1,'STATE.OWNERSHIP','国有','国有','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(51,5,2,'PRIVATE.OWNERSHIP','民营','民营','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(53,5,3,'SHAREHLD.OWNERSHIP','股份制','股份制','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(60,6,1,'GET','GET','GET','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(61,6,2,'POST','POST','POST','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(62,6,3,'PUT','PUT','PUT','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(63,6,4,'DELETE','DELETE','DELETE','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(70,7,1,'REQUIRED','基础应用','提供基础应用功能','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(71,7,2,'OPTIONAL','可选应用','可选应用，用户必须购买才能使用的应用','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(80,8,1,'PARTNER','合作伙伴账户','关联org_parnter合作伙伴账户','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(81,8,2,'INTERNAL','内部账户','关联org_internal内部账户','A',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_enum_type`
--

DROP TABLE IF EXISTS `sys_enum_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_enum_type` (
  `id` int(11) NOT NULL DEFAULT '0',
  `enum_type_name` varchar(30) DEFAULT NULL,
  `enum_type_desc` varchar(160) DEFAULT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `entry_datetime` datetime DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  `delete_id` int(11) DEFAULT NULL,
  `delete_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `XAK1sys_enum_type` (`enum_type_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_enum_type`
--

LOCK TABLES `sys_enum_type` WRITE;
/*!40000 ALTER TABLE `sys_enum_type` DISABLE KEYS */;
INSERT INTO `sys_enum_type` VALUES (1,'ROW.STATUS','记录状态码',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(2,'ASSIGN.TYPE','授权类型，三个表字段使用该枚举，即auth_user_role.auth_type_code, auth_acct_role.auth_type_code, auth_role_right.auth_type_code。',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(3,'ROLE.TYPE','角色类型，表auth_role.role_type_code使用该枚举。',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(4,'RESOURCE.TYPE','resource_type_code一共分为四种，即：app_catalog、app_activity、app_operation和app_data，resource_ref_id关联不同的表。',0,'2015-10-15 12:11:11',NULL,NULL,NULL,NULL),(5,'CORP.OWNERSHIP','企业性质（国有/民营/股份/有限责任公司。',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(6,'HTTP.METHOD','RESTFUL HTTP方法列表',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(7,'app_module.app_type_code','应用类型列表',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL),(8,'org_acct.acct_type','账户类型，标识账户关联org_partner或org_internal。',0,'2015-10-15 12:11:12',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_enum_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-28  1:16:34
