/*
SQLyog Ultimate v9.63 
MySQL - 8.0.21 : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `laravel`;

/*Table structure for table `action_status` */

DROP TABLE IF EXISTS `action_status`;

CREATE TABLE `action_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `action_status` */

LOCK TABLES `action_status` WRITE;

insert  into `action_status`(`id`,`status`) values (1,'فعال'),(2,'غير فعال');

UNLOCK TABLES;

/*Table structure for table `actions` */

DROP TABLE IF EXISTS `actions`;

CREATE TABLE `actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `clinic_id` int DEFAULT NULL,
  `busines_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `sessions` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `actions` */

LOCK TABLES `actions` WRITE;

insert  into `actions`(`id`,`name`,`clinic_id`,`busines_id`,`price`,`sessions`,`status`,`type`,`created_at`,`updated_at`) values (6,'كشف',53,6,200,1,1,NULL,'2020-11-27 09:00:56','2020-12-18 21:48:11'),(8,'مقياس سمع',44,6,300,20,1,NULL,'2020-11-27 09:11:12','2020-12-19 20:13:59'),(12,'ولادة طبيعي',44,6,2000,1,1,NULL,'2020-11-28 08:31:48','2020-12-19 20:14:32'),(13,'ولادة قيصرية',44,6,3000,2,1,NULL,'2020-11-28 08:35:50','2020-12-22 18:37:35'),(16,'إستشارة',53,6,70,1,1,NULL,'2020-11-29 17:22:26','2020-12-18 21:52:31'),(17,'نظارة',53,6,250,1,1,NULL,'2020-11-30 17:48:25','2020-12-18 21:52:36'),(18,'قيصرية',48,6,333330,10,1,NULL,'2020-12-16 20:37:00','2020-12-22 18:38:25');

UNLOCK TABLES;

/*Table structure for table `appointment_source` */

DROP TABLE IF EXISTS `appointment_source`;

CREATE TABLE `appointment_source` (
  `id` int NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `appointment_source` */

LOCK TABLES `appointment_source` WRITE;

insert  into `appointment_source`(`id`,`source`) values (1,'مرضي'),(2,'أطباء'),(3,'تعاقدات'),(4,'مصروفات');

UNLOCK TABLES;

/*Table structure for table `appointment_status` */

DROP TABLE IF EXISTS `appointment_status`;

CREATE TABLE `appointment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointstatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `appointment_status` */

LOCK TABLES `appointment_status` WRITE;

insert  into `appointment_status`(`id`,`appointstatus`) values (1,'حجز'),(2,'مؤكد'),(3,'حضر'),(4,'جاري الكشف'),(5,'منتهي'),(6,'ملغي');

UNLOCK TABLES;

/*Table structure for table `appointments` */

DROP TABLE IF EXISTS `appointments`;

CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `busines_id` int DEFAULT NULL,
  `action_id` int DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `clinic_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `contract_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `Paid_val` int DEFAULT NULL,
  `rem_val` int DEFAULT NULL,
  `contract_val` int DEFAULT NULL,
  `patient_val` int DEFAULT NULL,
  `appoint_date` date DEFAULT NULL,
  `appoint_houre` int DEFAULT NULL,
  `appoint_time` int DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `doctorpercint` decimal(10,2) DEFAULT NULL,
  `contractpercint` decimal(10,2) DEFAULT NULL,
  `contractvalue` decimal(10,2) DEFAULT NULL,
  `doctorfat_id` int DEFAULT '0',
  `contractfat_id` int DEFAULT '0',
  `type` int DEFAULT '0' COMMENT '1   for in\\n2   for out',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `source` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `appointments` */

LOCK TABLES `appointments` WRITE;

insert  into `appointments`(`id`,`patient_id`,`busines_id`,`action_id`,`doctor_id`,`clinic_id`,`user_id`,`contract_id`,`price`,`Paid_val`,`rem_val`,`contract_val`,`patient_val`,`appoint_date`,`appoint_houre`,`appoint_time`,`notes`,`status`,`doctorpercint`,`contractpercint`,`contractvalue`,`doctorfat_id`,`contractfat_id`,`type`,`created_at`,`updated_at`,`source`) values (29,7,6,18,5,48,14,0,333330,NULL,333330,0,333330,'2020-12-31',0,8,NULL,5,NULL,NULL,NULL,0,0,0,'2020-12-31 21:08:37','2020-12-31 21:12:17',NULL),(30,3,6,12,5,44,14,2,2000,NULL,2000,0,2000,'2020-12-31',0,8,NULL,5,NULL,NULL,NULL,0,0,0,'2020-12-31 21:08:50','2020-12-31 21:15:32',NULL),(31,6,6,18,5,48,14,0,333330,NULL,333330,0,333330,'2020-12-31',0,16,NULL,5,NULL,NULL,NULL,0,0,0,'2020-12-31 21:16:51','2020-12-31 21:17:02',NULL),(32,3,6,18,7,48,47,0,333330,50,333280,0,333330,'2021-01-26',0,44,NULL,5,NULL,NULL,NULL,0,0,0,'2021-01-02 06:40:12','2021-01-27 14:44:42',NULL),(33,3,6,8,5,44,14,0,300,300,0,0,300,'2021-01-02',0,54,NULL,3,NULL,NULL,NULL,0,0,0,'2021-01-02 06:54:25','2021-01-10 01:21:09',NULL),(34,3,6,12,5,44,14,2,2000,NULL,2000,0,2000,'2021-01-02',0,19,NULL,3,NULL,NULL,NULL,0,0,0,'2021-01-02 08:19:21','2021-01-10 01:21:12',NULL),(36,15,6,8,4,44,14,0,300,200,100,0,300,'2021-01-02',0,24,NULL,3,NULL,NULL,NULL,0,0,1,'2021-01-02 08:25:06','2021-01-10 01:21:14',1),(37,12,6,8,6,44,14,0,300,300,0,0,300,'2021-01-02',0,52,NULL,3,NULL,NULL,NULL,0,0,1,'2021-01-02 08:52:23','2021-01-10 01:21:17',1),(38,31,6,8,5,44,14,1,300,50,50,200,100,'2021-01-02',0,3,NULL,2,NULL,NULL,NULL,0,0,1,'2021-01-02 11:04:09','2021-01-03 18:31:23',1),(39,2,6,18,5,48,14,2,333330,40000,293330,0,333330,'2021-01-02',0,5,NULL,2,NULL,NULL,NULL,0,0,1,'2021-01-02 11:06:03','2021-01-03 18:31:25',1),(40,6,6,15,6,44,14,0,200,200,0,0,200,'2021-01-03',0,33,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:34:43','2021-01-03 22:18:55',1),(41,2,6,8,6,44,14,0,300,300,0,0,300,'2021-01-03',0,34,NULL,4,NULL,NULL,NULL,0,0,1,'2021-01-03 18:35:34','2021-01-03 22:18:17',1),(42,26,6,8,4,44,14,1,300,100,0,200,100,'2021-01-03',0,37,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:41:07','2021-01-03 22:18:21',1),(43,26,6,8,4,44,14,1,300,100,0,200,100,'2021-01-03',0,37,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:42:18','2021-01-03 22:18:47',1),(44,26,6,8,4,44,14,1,300,100,0,200,100,'2021-01-03',0,37,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:43:09','2021-01-03 22:20:00',1),(45,2,6,18,5,48,14,0,333330,NULL,333330,0,333330,'2021-01-03',0,43,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:43:25','2021-01-03 22:20:03',1),(46,2,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,43,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:44:40','2021-01-03 22:20:06',1),(47,2,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,43,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:47:08','2021-01-03 18:47:08',1),(48,2,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,43,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:47:35','2021-01-03 18:47:35',1),(49,2,6,12,5,44,14,0,300,200,100,0,300,'2021-01-10',0,43,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:49:39','2021-01-03 18:49:39',1),(50,21,6,8,5,44,14,0,300,250,50,0,300,'2021-01-03',0,50,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:50:20','2021-01-03 18:50:20',1),(51,21,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,53,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:54:06','2021-01-03 18:54:06',1),(52,21,6,6,6,53,14,1,200,200,0,0,200,'2021-01-03',0,55,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:55:32','2021-01-03 18:55:32',1),(53,3,6,12,5,44,14,1,2000,NULL,600,1500,600,'2021-01-03',0,1,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 19:01:54','2021-01-03 22:20:16',1),(54,3,6,12,4,44,14,0,2000,NULL,2000,0,2000,'2021-01-03',0,2,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 19:02:19','2021-01-10 01:21:00',1),(55,3,6,8,5,44,14,0,300,NULL,300,0,300,'2021-01-03',0,7,NULL,2,NULL,NULL,NULL,0,0,1,'2021-01-03 19:07:48','2021-01-03 22:20:11',1),(56,9,6,18,5,48,46,1,333330,50000,283330,0,333330,'2021-01-03',0,53,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 19:53:56','2021-01-03 22:18:34',1),(57,6,6,8,4,44,14,1,300,100,0,200,100,'2021-01-17',0,46,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 04:47:25','2021-01-17 04:47:25',1),(58,7,6,16,6,53,14,0,70,70,0,0,70,'2021-01-17',0,48,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 05:49:12','2021-01-26 20:16:33',1),(59,7,6,15,7,44,14,0,200,200,0,0,200,'2021-01-17',0,49,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 05:50:15','2021-01-26 20:16:42',1),(60,7,6,8,11,44,14,0,300,300,0,0,300,'2021-01-17',0,50,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 05:55:21','2021-01-17 05:55:21',1),(61,6,6,18,16,48,47,0,333330,33333,299997,0,333330,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:05:55','2021-01-17 06:05:55',1),(62,6,6,8,6,44,47,1,300,50,50,200,100,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:07:26','2021-01-17 06:07:26',1),(63,6,6,8,6,44,47,1,300,50,50,200,100,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:08:22','2021-01-17 06:08:22',1),(64,23,6,18,6,48,47,0,333330,50,333280,0,333330,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:08:51','2021-01-17 06:08:51',1),(65,3,6,12,5,44,47,0,2000,2000,0,0,2000,'2021-01-17',0,13,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:13:32','2021-01-17 06:13:32',1),(66,3,6,12,5,44,47,0,2000,2000,0,0,2000,'2021-01-17',0,13,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:17:35','2021-01-17 06:17:35',1);

UNLOCK TABLES;

/*Table structure for table `biometrics` */

DROP TABLE IF EXISTS `biometrics`;

CREATE TABLE `biometrics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `temperature` varchar(45) DEFAULT NULL,
  `pressure` varchar(45) DEFAULT NULL,
  `pulse` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `fasting_sugar` varchar(45) DEFAULT NULL,
  `fater_sugar` varchar(45) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `biometrics` */

LOCK TABLES `biometrics` WRITE;

insert  into `biometrics`(`id`,`patient_id`,`user_id`,`date`,`temperature`,`pressure`,`pulse`,`weight`,`fasting_sugar`,`fater_sugar`,`notes`,`created_at`,`updated_at`) values (1,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 17:57:50','2021-01-17 17:57:50'),(2,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 17:57:52','2021-01-17 17:57:52'),(3,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 17:57:55','2021-01-17 17:57:55'),(4,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:35','2021-01-17 18:03:35'),(5,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:38','2021-01-17 18:03:38'),(6,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:41','2021-01-17 18:03:41'),(7,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:44','2021-01-17 18:03:44'),(8,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:04:08','2021-01-17 18:04:08'),(9,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:04:11','2021-01-17 18:04:11'),(10,6,1,'2021-01-31','100','80/120','80','95','60','90',NULL,'2021-01-17 18:04:56','2021-01-17 18:28:29'),(11,6,1,'2021-01-31','50','120','30','50','70','90',NULL,'2021-01-17 18:04:59','2021-01-17 18:21:08'),(12,6,47,'2021-01-17','33434','34','343','333','34','66',NULL,'2021-01-17 18:31:10','2021-01-17 18:31:10'),(21,7,47,'2021-01-26','90','100',NULL,NULL,NULL,NULL,NULL,'2021-01-26 19:59:26','2021-01-26 20:02:28'),(26,7,47,'2021-01-26','20','120',NULL,NULL,NULL,NULL,NULL,'2021-01-26 20:13:39','2021-01-26 20:14:13');

UNLOCK TABLES;

/*Table structure for table `business` */

DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int unsigned DEFAULT NULL,
  `default_profit_percent` double(5,2) DEFAULT '0.00',
  `owner_id` int unsigned DEFAULT NULL,
  `time_zone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'includes',
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'keep_selling',
  `stop_selling_before` int DEFAULT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int unsigned DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int unsigned NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int unsigned NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pos_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `woocommerce_api_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `woocommerce_wh_oc_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_ou_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_od_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `woocommerce_wh_or_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `essentials_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) DEFAULT '1',
  `enable_inline_tax` tinyint(1) DEFAULT '1',
  `currency_symbol_placement` enum('before','after') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'before',
  `enabled_modules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'm/d/Y',
  `time_format` enum('12','24') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '24',
  `ref_no_prefixes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `enable_rp` tinyint(1) DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sms_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `custom_labels` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `common_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `business` */

LOCK TABLES `business` WRITE;

insert  into `business`(`id`,`name`,`currency_id`,`is_active`,`start_date`,`tax_number_1`,`tax_label_1`,`tax_number_2`,`tax_label_2`,`default_sales_tax`,`default_profit_percent`,`owner_id`,`time_zone`,`fy_start_month`,`accounting_method`,`default_sales_discount`,`sell_price_tax`,`logo`,`sku_prefix`,`enable_product_expiry`,`expiry_type`,`on_product_expiry`,`stop_selling_before`,`enable_tooltip`,`purchase_in_diff_currency`,`purchase_currency_id`,`p_exchange_rate`,`transaction_edit_days`,`stock_expiry_alert_days`,`keyboard_shortcuts`,`pos_settings`,`woocommerce_api_settings`,`woocommerce_wh_oc_secret`,`woocommerce_wh_ou_secret`,`woocommerce_wh_od_secret`,`woocommerce_wh_or_secret`,`essentials_settings`,`weighing_scale_setting`,`enable_brand`,`enable_category`,`enable_sub_category`,`enable_price_tax`,`enable_purchase_status`,`enable_lot_number`,`default_unit`,`enable_sub_units`,`enable_racks`,`enable_row`,`enable_position`,`enable_editing_product_from_purchase`,`sales_cmsn_agnt`,`item_addition_method`,`enable_inline_tax`,`currency_symbol_placement`,`enabled_modules`,`date_format`,`time_format`,`ref_no_prefixes`,`theme_color`,`created_by`,`enable_rp`,`rp_name`,`amount_for_unit_rp`,`min_order_total_for_rp`,`max_rp_per_order`,`redeem_amount_per_unit_rp`,`min_order_total_for_redeem`,`min_redeem_point`,`max_redeem_point`,`rp_expiry_period`,`rp_expiry_type`,`email_settings`,`sms_settings`,`custom_labels`,`common_settings`,`created_at`,`updated_at`) values (1,'New Pharmacy',NULL,1,'2020-11-05',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-05 07:34:25','2020-11-05 07:34:25'),(2,'New Pharmacy',NULL,1,'2020-11-05',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-05 07:48:32','2020-11-05 07:48:32'),(3,'New Pharmacy',NULL,1,'2020-11-05',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-05 07:50:34','2020-11-05 07:50:34'),(4,'New Pharmacy',NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:33:18','2020-11-06 12:33:18'),(5,'New Pharmacy',NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:33:41','2020-11-06 12:33:41'),(6,'New Pharmacy',NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:35:09','2020-11-06 12:35:09'),(7,'New Pharmacy',NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:37:37','2020-11-06 12:37:37'),(8,'New Pharmacy',NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 13:21:53','2020-11-06 13:21:53'),(9,'New Pharmacy',NULL,1,'2020-11-10',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-10 06:21:07','2020-11-10 06:21:07'),(10,'New Pharmacy',NULL,1,'2020-11-10',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-10 18:46:08','2020-11-10 18:46:08');

UNLOCK TABLES;

/*Table structure for table `clinic_types` */

DROP TABLE IF EXISTS `clinic_types`;

CREATE TABLE `clinic_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinic_types` */

LOCK TABLES `clinic_types` WRITE;

insert  into `clinic_types`(`id`,`type`) values (1,'جلدية'),(2,'اسنان'),(3,'عيون'),(4,'نساء وتوليد'),(5,'مخ واعصاب'),(6,'اطفال وحديثي الولادة'),(7,'انف واذن وحنجرة'),(8,'قلب واوعية دموية'),(9,'امراض دم'),(10,'اورام'),(11,'باطنة'),(12,'تخسيس وتغذية'),(13,'جراحة اطفال'),(14,'جراحة أورام'),(15,'جراحة اوعية دموية'),(16,'جراحة تجميل'),(17,'جراحة سمنة ومناظير'),(18,'جراحة عامة'),(19,'جراحة عمود فقري'),(20,'جراحة قلب وصدر'),(21,'جراحة مخ واعصاب'),(22,'جهاز هضمي ومناظير'),(23,'حساسية ومناعة'),(24,'حقن مجهري واطفال انابيب'),(25,'روماتيزم'),(26,'سكر وغدد صماء'),(27,'نفسي'),(28,'عامة');

UNLOCK TABLES;

/*Table structure for table `clinics` */

DROP TABLE IF EXISTS `clinics`;

CREATE TABLE `clinics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `busines_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephon1` varchar(20) DEFAULT NULL,
  `telephon2` varchar(20) DEFAULT NULL,
  `logo` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `morning_from` varchar(45) DEFAULT NULL,
  `morning_to` varchar(45) DEFAULT NULL,
  `night_from` varchar(45) DEFAULT NULL,
  `night_to` varchar(45) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinics` */

LOCK TABLES `clinics` WRITE;

insert  into `clinics`(`id`,`code`,`busines_id`,`type`,`address`,`telephon1`,`telephon2`,`logo`,`status`,`morning_from`,`morning_to`,`night_from`,`night_to`,`notes`,`created_at`,`updated_at`) values (44,'عيادة الجلدية',6,6,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية','23456','6262626262626','6_1605644637.png',1,NULL,NULL,NULL,NULL,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-14 14:34:17','2021-01-25 20:48:13'),(48,'حديثي الولادة',6,6,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,NULL,'',0,NULL,NULL,NULL,NULL,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-14 14:35:37','2020-11-14 14:35:37'),(53,'عيادة العيون',6,1,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية','23456','456','',0,NULL,NULL,NULL,NULL,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-14 17:11:16','2020-11-14 17:11:16'),(81,'Test',6,1,NULL,NULL,NULL,'6_1611607450.jpeg',0,NULL,NULL,NULL,NULL,'asasa','2021-01-25 20:44:10','2021-01-25 20:44:10');

UNLOCK TABLES;

/*Table structure for table `contract_actions` */

DROP TABLE IF EXISTS `contract_actions`;

CREATE TABLE `contract_actions` (
  `contract_id` int DEFAULT NULL,
  `action_id` int DEFAULT NULL,
  `contract_val` int DEFAULT NULL,
  `patient_val` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `contract_actions` */

LOCK TABLES `contract_actions` WRITE;

insert  into `contract_actions`(`contract_id`,`action_id`,`contract_val`,`patient_val`,`created_at`,`updated_at`) values (1,10,NULL,NULL,'2020-12-19 00:31:32','2020-12-19 00:31:32'),(3,8,400,500,'2020-12-19 06:09:08','2020-12-19 06:09:08'),(3,15,200,60,'2020-12-19 06:09:52','2020-12-19 06:09:52'),(1,15,150,70,'2020-12-19 20:15:09','2020-12-19 20:15:09'),(1,12,1500,600,'2020-12-19 20:41:25','2020-12-19 20:41:25'),(1,13,2000,1000,'2020-12-19 20:41:26','2020-12-19 20:41:26'),(1,14,100,70,'2020-12-19 20:41:26','2020-12-19 20:41:26'),(1,8,200,100,'2020-12-19 20:41:27','2020-12-19 20:41:27');

UNLOCK TABLES;

/*Table structure for table `contract_status` */

DROP TABLE IF EXISTS `contract_status`;

CREATE TABLE `contract_status` (
  `id` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `contract_status` */

LOCK TABLES `contract_status` WRITE;

insert  into `contract_status`(`id`,`status`) values (1,'متعاقد'),(2,'غير متعاقد'),(3,'متوقف مؤقتا');

UNLOCK TABLES;

/*Table structure for table `contracts` */

DROP TABLE IF EXISTS `contracts`;

CREATE TABLE `contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `responsible` varchar(45) DEFAULT NULL,
  `busines_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephon1` varchar(20) DEFAULT NULL,
  `telephon2` varchar(20) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `contracts` */

LOCK TABLES `contracts` WRITE;

insert  into `contracts`(`id`,`name`,`responsible`,`busines_id`,`status`,`address`,`telephon1`,`telephon2`,`notes`,`created_at`,`updated_at`) values (1,'المصرية للإتصالات','محمد علي',6,1,'الإسماعيلية المستقبل  شارع المدينة المنورة','01024649844',NULL,NULL,'2020-11-29 14:41:57','2020-11-29 14:41:57'),(2,'شركة كهرباء القناة','محمد حسن',6,2,'مصر الجديدة القاهرة','01024649855','258741245654578',NULL,'2020-11-29 17:02:33','2020-12-18 06:52:16'),(3,'بنك القاهرة','محمد حسن',6,1,'القاهرة','121212223456','258741245654578',NULL,'2020-11-29 17:03:07','2020-12-18 06:52:32'),(6,'شركة كهرباء القناة','محمد حسن',6,3,'مصر الجديدة القاهرة','01024649855','258741245654578',NULL,'2020-11-29 17:23:19','2020-11-29 17:40:19');

UNLOCK TABLES;

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currencies` */

LOCK TABLES `currencies` WRITE;

UNLOCK TABLES;

/*Table structure for table `diagnosis` */

DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE `diagnosis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `doctor_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `diagnosis` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `diagnosis` */

LOCK TABLES `diagnosis` WRITE;

insert  into `diagnosis`(`id`,`date`,`doctor_id`,`patient_id`,`diagnosis`,`created_at`,`updated_at`) values (14,'2021-01-26',40,7,'tisre dfgdfg','2021-01-26 19:46:02','2021-01-26 19:46:02');

UNLOCK TABLES;

/*Table structure for table `doctor_status` */

DROP TABLE IF EXISTS `doctor_status`;

CREATE TABLE `doctor_status` (
  `id` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctor_status` */

LOCK TABLES `doctor_status` WRITE;

insert  into `doctor_status`(`id`,`status`) values (1,'In work'),(2,' Not working'),(3,'deleted');

UNLOCK TABLES;

/*Table structure for table `doctors` */

DROP TABLE IF EXISTS `doctors`;

CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busines_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `titel` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `telephon2` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '1-In work  2- Not working   3-deleted',
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctors` */

LOCK TABLES `doctors` WRITE;

insert  into `doctors`(`id`,`busines_id`,`name`,`titel`,`mobile`,`telephon2`,`address`,`email`,`status`,`notes`,`created_at`,`updated_at`) values (4,'6','محمد أحمد 2',NULL,'01024649888','456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:09:25','2021-01-02 20:27:53'),(5,'6','محمد علي السيد',NULL,'01024649844',NULL,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:24:27','2020-11-26 21:24:27'),(6,'6','مصطفي العدوي',NULL,'01024649844','456',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:29:38','2020-11-26 21:29:38'),(7,'6','إبراهيم كمال',NULL,'01024649844','456',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:33:40','2020-11-26 21:33:40'),(8,'6','جمال السيد',NULL,'01024649844','369582147',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:33:50','2020-11-26 21:33:50'),(9,'6','حسن علي',NULL,'01024649844','369582147',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:33:58','2020-11-26 21:33:58'),(11,'6','باسم مصطفي السيد',NULL,'01024649844','147',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:35:06','2021-01-02 17:49:30'),(12,'2','فؤاد خليل',NULL,'01024649844','258741245654578',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:35:32','2020-11-26 21:38:03'),(13,'6','علي مصطفي',NULL,'01024649844',NULL,NULL,NULL,1,'مرحبا','2021-01-02 17:50:20','2021-01-02 17:50:20'),(14,'6','كمال السيد',NULL,NULL,NULL,NULL,NULL,1,'يسسسب','2021-01-02 18:00:36','2021-01-02 18:00:36'),(15,'6','كمال السيد',NULL,NULL,NULL,NULL,NULL,1,'يسسسب','2021-01-02 18:00:41','2021-01-02 18:00:41'),(16,'6','كمال السيد',NULL,NULL,NULL,NULL,NULL,1,'يسسسب','2021-01-02 18:00:49','2021-01-02 18:00:49'),(17,'6','كمال جمال',NULL,NULL,NULL,NULL,NULL,1,'يبسيبي','2021-01-02 18:01:23','2021-01-02 18:01:23'),(18,'6','كمال جمال',NULL,NULL,NULL,NULL,NULL,1,'يبسيبي','2021-01-02 18:03:14','2021-01-02 18:03:14'),(19,'6','محمد أحمد',NULL,NULL,'456',NULL,NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:30:21','2021-01-02 19:30:21'),(20,'6','محمد أحمد',NULL,NULL,'456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:39:12','2021-01-02 19:39:12'),(21,'6','محمد أحمد',NULL,NULL,'456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:39:19','2021-01-02 19:39:19'),(22,'6','محمد أحمد',NULL,NULL,'456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:39:22','2021-01-02 19:39:22'),(23,'6','save password',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:46:18','2021-01-02 19:46:18'),(24,'6','save password',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:48:00','2021-01-02 19:48:00'),(25,'6','save password',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:50:48','2021-01-02 19:50:48'),(26,'6','save password',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:53:00','2021-01-02 19:53:00'),(27,'6','new doctore',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:00:40','2021-01-02 20:00:40'),(28,'6','new doctore',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:01:59','2021-01-02 20:01:59'),(29,'6','حسام',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:18:08','2021-01-02 20:18:08'),(30,'6','sdhsjdhsjdhs',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:20:24','2021-01-02 20:20:24'),(31,'6','sdhsjdhsjdhs',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:21:05','2021-01-02 20:21:05'),(32,'6','sdhsjdhsjdhs',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:23:25','2021-01-02 20:23:25'),(33,'6','حسن الجمال',NULL,NULL,'12133323',NULL,NULL,1,NULL,'2021-01-02 20:24:57','2021-01-02 20:24:57'),(34,'6','حسمامبلبلبل',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:27:36','2021-01-02 20:27:36'),(35,'6','حسمامبلبلبل',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:27:42','2021-01-02 20:27:42'),(36,'6','سلامة الونش',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:15:41','2021-01-03 19:15:41'),(37,'6','سلامة الونش',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:15:49','2021-01-03 19:15:49'),(38,'6','حسن',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:19:25','2021-01-03 19:19:25'),(39,'6','كمال',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:21:21','2021-01-03 19:21:21'),(40,'6','كمال',NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:22:30','2021-01-03 19:22:30'),(41,'6','حسن السيد',NULL,NULL,'01024564854',NULL,NULL,1,NULL,'2021-01-25 20:51:13','2021-01-25 20:51:13');

UNLOCK TABLES;

/*Table structure for table `dosages` */

DROP TABLE IF EXISTS `dosages`;

CREATE TABLE `dosages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `busines_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dosages` */

LOCK TABLES `dosages` WRITE;

insert  into `dosages`(`id`,`name`,`busines_id`,`created_at`,`updated_at`) values (19,'مرة واحدة يوميا',6,'2020-11-29 08:17:23','2020-11-29 08:17:23'),(20,'مرتين كل 12 ساعة',6,'2020-11-29 08:17:38','2020-11-29 08:17:38'),(21,'3 مرات كل 8 ساعات',6,'2020-11-29 08:17:56','2020-11-29 08:17:56'),(22,'حقنة عضل يوم بعد يوم',6,'2020-11-29 08:18:06','2020-11-29 08:18:06');

UNLOCK TABLES;

/*Table structure for table `expenses_cats` */

DROP TABLE IF EXISTS `expenses_cats`;

CREATE TABLE `expenses_cats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `busines_id` int DEFAULT NULL,
  `cost` varchar(45) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `expenses_cats` */

LOCK TABLES `expenses_cats` WRITE;

insert  into `expenses_cats`(`id`,`name`,`busines_id`,`cost`,`notes`,`created_at`,`updated_at`) values (5,'فاتورة تليفون 2',6,'2000.5','asasas','2020-11-30 18:22:37','2020-11-30 18:30:30'),(6,'سمك بوري',6,'20.5',NULL,'2020-11-30 18:22:44','2020-11-30 18:22:44'),(7,'سمك بوري مشوي',6,'300',NULL,'2020-11-30 18:22:53','2020-11-30 18:30:44');

UNLOCK TABLES;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

LOCK TABLES `failed_jobs` WRITE;

UNLOCK TABLES;

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2020_11_02_173935_create_sessions_table',1),(7,'2020_11_02_184530_create_permission_tables',2);

UNLOCK TABLES;

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

LOCK TABLES `model_has_permissions` WRITE;

insert  into `model_has_permissions`(`permission_id`,`model_type`,`model_id`) values (2,'App\\Models\\User',52),(3,'App\\Models\\User',52);

UNLOCK TABLES;

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

LOCK TABLES `model_has_roles` WRITE;

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',6),(5,'App\\Models\\User',6),(6,'App\\Models\\User',6),(7,'App\\Models\\User',6),(1,'App\\Models\\User',11),(5,'App\\Models\\User',11),(6,'App\\Models\\User',11),(7,'App\\Models\\User',11),(1,'App\\Models\\User',12),(1,'App\\Models\\User',14),(5,'App\\Models\\User',14),(7,'App\\Models\\User',14),(1,'App\\Models\\User',31),(1,'App\\Models\\User',32),(2,'App\\Models\\User',43),(1,'App\\Models\\User',47),(2,'App\\Models\\User',47),(2,'App\\Models\\User',54);

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

LOCK TABLES `password_resets` WRITE;

UNLOCK TABLES;

/*Table structure for table `patients` */

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busines_id` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `telephone1` varchar(45) DEFAULT NULL,
  `telephone2` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `attention` int DEFAULT '0' COMMENT 'تنبية الطبيب للنظر في سجل المريض عند الكشف ',
  `notes` text,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `patients` */

LOCK TABLES `patients` WRITE;

insert  into `patients`(`id`,`busines_id`,`name`,`telephone1`,`telephone2`,`address`,`birthdate`,`sex`,`email`,`attention`,`notes`,`status`,`created_at`,`updated_at`) values (2,6,'محمد علي السيد ءءءءء','01024649844',NULL,NULL,'1976-02-10 00:00:00',2,NULL,0,NULL,NULL,'2020-12-05 21:04:06','2021-01-03 20:31:33'),(3,6,'محمد علي السيد 2 ',NULL,NULL,NULL,'1975-11-15 00:00:00',2,NULL,1,NULL,NULL,'2020-12-05 21:04:24','2020-12-05 21:04:24'),(6,6,'محمد علي السيد',NULL,NULL,NULL,'1976-05-10 00:00:00',2,NULL,1,NULL,NULL,'2020-12-05 21:06:28','2020-12-05 21:06:28'),(7,6,'محمد علي السيد','01024649844',NULL,NULL,'1920-06-10 00:00:00',1,NULL,0,NULL,NULL,'2020-12-05 21:14:27','2020-12-05 21:14:27'),(9,6,'محمد علي السيد','01024649844',NULL,NULL,'2015-09-10 00:00:00',2,NULL,1,'يبيسبيب\r\nيبيبيب\r\n\r\nيبيبيب',NULL,'2020-12-05 21:16:51','2020-12-05 21:16:51'),(12,6,'سمك بوري','01024649844',NULL,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية','1920-08-10 00:00:00',2,'g3.ali.telecom@gmail.com',1,NULL,NULL,'2020-12-05 22:08:37','2020-12-05 22:08:37'),(13,6,'السيد المحترم','01024649855',NULL,'مصر الجديدة القاهرة2','1990-12-30 00:00:00',2,'g.ali.telecom@gmail.com',1,'1-تجربة \r\n2- تجربة 2\r\n3- تجربة 3',NULL,'2020-12-06 17:44:29','2020-12-06 17:52:56'),(15,6,'علي','01024649844',NULL,NULL,'1920-01-10 00:00:00',1,NULL,1,NULL,NULL,'2020-12-11 05:02:40','2020-12-11 05:02:40'),(16,6,'محمود عبدالرحمن','01024648944',NULL,NULL,'1950-01-10 00:00:00',1,NULL,0,NULL,NULL,'2020-12-30 17:47:08','2020-12-30 17:47:08'),(17,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:33:31','2021-01-02 10:33:31'),(18,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:35:19','2021-01-02 10:35:19'),(19,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:35:27','2021-01-02 10:35:27'),(20,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:37:11','2021-01-02 10:37:11'),(21,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:37:27','2021-01-02 10:37:27'),(22,6,'السيد محمد رمضان 3','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:37:48','2021-01-02 10:41:15'),(23,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:42:14','2021-01-02 10:42:14'),(24,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:46:32','2021-01-02 10:46:32'),(25,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:47:06','2021-01-02 10:47:06'),(26,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:59:34','2021-01-02 10:59:34'),(27,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:00:29','2021-01-02 11:00:29'),(28,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:01:13','2021-01-02 11:01:13'),(29,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:02:31','2021-01-02 11:02:31'),(30,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:02:58','2021-01-02 11:02:58'),(31,6,'سمير عبدالعظيم','01036495877',NULL,'الإسماعيلية','1920-01-10 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:03:41','2021-01-02 11:03:41');

UNLOCK TABLES;

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

LOCK TABLES `permissions` WRITE;

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'role.view','web','2020-11-06 19:55:07','2020-11-06 19:55:07'),(2,'role.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(3,'role.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(4,'role.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(5,'user.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(6,'user.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(7,'user.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(8,'user.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(10,'clinic.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(11,'clinic.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(12,'clinic.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(13,'clinic.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(14,'doctor.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(15,'doctor.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(16,'doctor.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(17,'doctor.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(18,'doctor.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(19,'doctor.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(20,'doctor.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(21,'doctor.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50');

UNLOCK TABLES;

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

LOCK TABLES `personal_access_tokens` WRITE;

UNLOCK TABLES;

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

LOCK TABLES `role_has_permissions` WRITE;

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(6,1),(7,1),(8,1),(6,9),(7,9),(8,9),(1,13),(2,13),(3,13),(4,13),(6,13),(7,13),(8,13),(1,14),(6,14),(8,14),(2,15),(3,15),(6,15),(8,15),(1,18),(2,18),(3,18),(4,18),(6,18),(7,18),(8,18);

UNLOCK TABLES;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `busines_id` int DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

LOCK TABLES `roles` WRITE;

insert  into `roles`(`id`,`name`,`busines_id`,`guard_name`,`created_at`,`updated_at`) values (1,'Super Admin',0,'web',NULL,NULL),(2,'doctor',1,'web',NULL,NULL),(3,'nursing',1,'web','2020-11-06 19:54:14','2020-11-06 19:54:14'),(4,'secretary',1,'web',NULL,NULL),(5,'account',1,'web',NULL,NULL),(6,'nursin',1,'web',NULL,NULL),(7,'secrtarial',1,'web',NULL,NULL),(9,'Mohamed',1,'web','2021-01-14 20:40:40','2021-01-14 20:40:40'),(10,'admin',1,'web','2021-01-14 20:56:10','2021-01-14 20:56:10'),(11,'Test2',NULL,'web','2021-01-14 20:57:36','2021-01-14 20:57:36'),(12,'Test3',NULL,'web','2021-01-14 21:00:59','2021-01-14 21:00:59'),(13,'Test4',NULL,'web','2021-01-14 21:07:22','2021-01-14 21:07:22'),(14,'Test5',NULL,'web','2021-01-14 21:07:52','2021-01-16 16:13:58'),(15,'asas',NULL,'web','2021-01-16 12:30:25','2021-01-16 12:30:25'),(18,'Test 1 from azha care',NULL,'web','2021-01-19 19:09:07','2021-01-19 19:09:07');

UNLOCK TABLES;

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

LOCK TABLES `sessions` WRITE;

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('5Ns6TE3oNJ655WWudyk4A179NawbLuIPl2sIYZ40',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVBqM2cyQmo4SEdXd0NXaXp1b3ZuejVWUGJxOEVpWnBPUGlGcmJGMSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovL2xvY2FsaG9zdC9hemhhY2FyZS9yb2xlcy9jcmVhdGU/MT0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1612619539),('bx3GSiQOHFLBV0wdJgqpJT4KNWLthQseNrWcFrmc',32,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMVhiQndxOVR0VUgybU5MYWdETm1Ic2FpWUthR01jYU5teWdTVnVBYSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI1OiJodHRwOi8vbG9jYWxob3N0L0F6aGFDYXJlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MzI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRXeU9jUHFib3dNcEczbXhKNU9JbHUubi5JUjUwbjMvenlMTExyeGZWZEFYazFNenkxTjNmYSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkV3lPY1BxYm93TXBHM214SjVPSWx1Lm4uSVI1MG4zL3p5TExMcnhmVmRBWGsxTXp5MU4zZmEiO30=',1612674220),('CGanyPfR6dEX5ZrhDAY5TKMO0UblSj8iyXrbdwQw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVjd1azJrckZHQno0T1Z3UTN2SEdRUk9zMWt3OHN5dllpcXRyUHJ5VSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovL2F6aGFjYXJlLmxvY2FsIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9hemhhY2FyZS5sb2NhbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1612634124),('E7oiQrrEGCREsXclbpVl7Jwg9jTpuPPNUJEtXSU0',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSklwZWdjcEtRUmpvT2N4MEpMUmpYQzgwUTJrQXZEaGlhYWQwQWoyMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNToiaHR0cDovL2xvY2FsaG9zdC9hemhhY2FyZSI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM0OiJodHRwOi8vbG9jYWxob3N0L2F6aGFjYXJlL3JlZ2lzdGVyIjt9fQ==',1612684259),('Hwru55Lmz2wFkVmuyf6COHFkyiliOyMAR6CZFJom',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoidGdPVDJ1ZGo1OWswQkZnZDNvNEptSmNwRWoxTWtnWlB5UGo1UE1KNyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovL2xvY2FsaG9zdC9hemhhY2FyZS9yb2xlcy9jcmVhdGU/MT0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1612619539),('kYBZarUO9ePsAvAkS7oosg2m65KTTV7K0dqsX8Jv',14,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiamh1Q2xRa2hCQWZSNFdBZzBzd0c3bmNJczQ5VWxyMzZGaFc0UkJqbiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMyOiJodHRwOi8vYXpoYWNhcmUubG9jYWwvY2xpbmljL2FkZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE0O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkbGVYT0xmd0dmNlg5SDVLc1BYWnlIdUhuV09wamRkRm5TSXhPeS85N01hYk54UW9mRFo4VGEiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGxlWE9MZndHZjZYOUg1S3NQWFp5SHVIbldPcGpkZEZuU0l4T3kvOTdNYWJOeFFvZkRaOFRhIjt9',1612634208),('mwzUwe7UpkX8fju1gdIiMqRKfJlsc4uYfXAlOfWi',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG1RREtVdnZPV1BON05tblBGbVVLT2JHclhvU2h4SUZkNVJZOTF3USI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovL2xvY2FsaG9zdC9hemhhY2FyZS9yb2xlcy9jcmVhdGU/MT0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1612619539),('qjOraCGUkjkOmbnGqcjOsp7sTrYLUk3JgxHZ6opn',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNUZaUW91eWF2czBRaEJMckZTdkM1bVFzTDNMaTFodk94QTg5YW1KTCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovL2F6aGFjYXJlLmxvY2FsIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9hemhhY2FyZS5sb2NhbCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1612634329),('SX0lSSWG9ti8ZrEFY8YhmI5pWH5KZFUscw3BOSRN',32,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTo3OntzOjY6Il90b2tlbiI7czo0MDoicjBVSUdBZnpGTHVOUmlmU0p3WFVsNVhxeWhNdUZEVnZJUkE3VGx6YiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vbG9jYWxob3N0L2F6aGFjYXJlL3JvbGVzL2FkZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjMyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkV3lPY1BxYm93TXBHM214SjVPSWx1Lm4uSVI1MG4zL3p5TExMcnhmVmRBWGsxTXp5MU4zZmEiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFd5T2NQcWJvd01wRzNteEo1T0lsdS5uLklSNTBuMy96eUxMTHJ4ZlZkQVhrMU16eTFOM2ZhIjt9',1612621880),('watv9gN66N7uoF4eXElps9QeRIrjNa4H75sim0Uj',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2U2VXRGNXIwazk1WE45eVZWN2FyaXBiV0wwaWg0d0Y0eFN6SHNxWCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovL2xvY2FsaG9zdC9hemhhY2FyZS9yb2xlcy9jcmVhdGU/MT0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1612619539),('WM6kzCxrz4hOEgmmepFezfgPv41vQcqOpKbQy6Yf',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT0FrVDlLQktQYktBUzdJZ05peGIxd0VXUW9Db0ZNVjNiT0RjT2NQRyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoxNToiaHR0cDovL2F6aGFjYXJlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9hemhhY2FyZS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1612678012),('x7OI3DgfObCpI6uGY1Gg1UsZyrzEI5Ex5EE93wCc',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUJlQjJZaGZoWFBPYUV6aGxKYlRWbXJVN1BwbU5DZHpCWm9yd1hkUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9hemhhY2FyZS5sb2NhbC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1612634330);

UNLOCK TABLES;

/*Table structure for table `specialitylist` */

DROP TABLE IF EXISTS `specialitylist`;

CREATE TABLE `specialitylist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `specialitylist` */

LOCK TABLES `specialitylist` WRITE;

insert  into `specialitylist`(`id`,`name`) values (1,'اسنان'),(2,'اطفال'),(3,'أنف واذن وحنجرة وسمعيات'),(4,'اورام'),(5,'باطنة'),(6,'التجميل'),(7,'تخاطب'),(8,'تخدير والام'),(9,'تمريض ورعاية'),(10,'التخصصات الجراحية'),(11,'الإضطرابات الجنسية'),(12,'جلدية وتناسلية'),(13,'عيون'),(14,'السمنة والتغذية'),(15,'الصحة النفسية'),(16,'طب الطوارئ'),(17,'الطب المهني'),(18,'نفسي و عصبي'),(19,'علاج طبيعي'),(20,'قلب'),(21,'مخ وأعصاب'),(22,'معمل انسجة'),(23,'طب الأسرة'),(24,'نساء وتوليد'),(25,'الأشعة التداخلية'),(26,'عظام'),(27,'مسالك بولية'),(28,'الحالات الحرجة'),(29,'امراض الصدر'),(30,'جهاز هضمي وحميات'),(31,'جراحة قلب وصدر'),(32,'روماتيزم');

UNLOCK TABLES;

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `test` */

LOCK TABLES `test` WRITE;

insert  into `test`(`name`,`email`,`created_at`,`updated_at`) values ('pa','pa@gmail.com','2021-01-01 23:59:27','2021-01-01 23:59:27'),('pa','pa@gmail.com','2021-01-02 00:00:48','2021-01-02 00:00:48'),('1','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('2','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('3','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('4','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('5','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('6','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('7','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('8','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('9','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('10','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('11','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('12','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('13','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('14','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('15','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('16','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('17','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('18','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('19','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('20','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('21','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('22','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('23','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('24','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('25','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('26','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('27','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('28','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('29','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('30','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('31','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('32','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('33','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('34','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34'),('35','pa@gmail.com','2021-01-02 00:01:34','2021-01-02 00:01:34');

UNLOCK TABLES;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `busines_id` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0  New  1  active 2  blocked  3  deleted ',
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `doctor_id` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`name`,`mobile`,`email`,`email_verified_at`,`password`,`busines_id`,`status`,`two_factor_secret`,`two_factor_recovery_codes`,`remember_token`,`current_team_id`,`profile_photo_path`,`doctor_id`,`created_at`,`updated_at`) values (2,'Mohamed Ali',NULL,'g2.ali.telecom@gmail.com',NULL,'$2y$10$ql9O4jjsG9aqSGhOo8X1XuJtBSwGLleW2CB0mA93YiQ8.xDl2M4XK',5,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-04 04:53:31','2020-11-04 04:53:31'),(6,'ali2','01333232332','g@gmail.com',NULL,'$2y$10$OVK360Smz1hOuePcOc5xkecpkv9HT9.MlJrUAtqQLgDy5Y20o0G4K',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-05 04:30:38','2020-12-01 23:02:17'),(7,'Test','01024649846','g3.ali.telecom@gmail.com',NULL,'$2y$10$KKq2D5mdG/HRhBWeXDSymOo2pFa.3i1oH.bfR8iOcSNwJ7e7Pw3.a',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-05 07:34:25','2020-11-05 07:34:25'),(9,'Test2','01024649847','g4.ali.telecom@gmail.com',NULL,'$2y$10$EdhrXDq5UcWj7ijJjswFkOoUT.FrUo3GplseXulf.C0SX5lE9cU6.',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-05 07:48:32','2020-11-05 07:48:32'),(11,'Test4','01024649848','g8.ali.telecom@gmail.com',NULL,'$2y$10$gBNvwm7Js1gZfaxLDquYROiXCmcBwVmM8ASqHEgPHWPXayBQW78NC',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-05 07:50:34','2020-11-05 07:50:34'),(12,'Test 4','01024649849','g9.ali.telecom@gmail.com',NULL,'$2y$10$rWKaof9ABqgIE/y9kRCYEubp6zaIzV3pnlduUkX117PjqtLpXFToq',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-06 12:35:10','2020-11-06 12:35:10'),(13,'test 5','01024649842','g5.ali.telecom@gmail.com',NULL,'$2y$10$GRofB162mjqChzujnDGa/OPsWV4FZ5lhyNYHO.H48SkB/d2.ii0/a',7,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-06 12:37:37','2020-11-06 12:37:37'),(14,'test 6','01024649841','g6.ali.telecom@gmail.com',NULL,'$2y$10$leXOLfwGf6X9H5KsPXZyHuHnWOpjddFnSIxOy/97MabNxQofDZ8Ta',6,'0',NULL,NULL,'UZ87Qzic3PeRSTS8BDgpfhHBkfFw90B0NkHMWhQAQNlDZmlYFzpSsRWyagib',NULL,NULL,0,'2020-11-06 13:21:53','2020-11-06 13:21:53'),(15,'محمد علي السيد','01024649899','g33.ali.telecom@gmail.com',NULL,'$2y$10$y5utOXZ4r6u90EgRCZbaG.oGtf9s9NRWG2IM8HYtgknlQuMFyi8ja',9,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-10 06:21:07','2020-11-10 06:21:07'),(16,'محمد علي السيد 2','01024649822','g22.ali.telecom@gmail.com',NULL,'$2y$10$Mr0L8wfXNB/xP40aGdkq5uQ8Mc3iQrRYh.wSJORA7BC3cMMBDGHPq',10,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-10 18:46:08','2020-11-10 18:46:08'),(19,'محمد علي السيد','01034649844','x.ali.telecom@gmail.com',NULL,'123456',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-30 20:49:11','2020-11-30 20:49:11'),(20,'صنف قائمة 1','01044649844','A.ali.telecom@gmail.com',NULL,'$2y$10$6Y4v3ZEAjaK9Szws8ok3feIXncS2DVyDwizmmp2ZKAggfxi9J7TgG',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-11-30 20:53:34','2020-11-30 20:53:34'),(21,'محمد علي السيد','01024649889','s.ali.telecom@gmail.com',NULL,'$2y$10$cgXtSsm.pYuwkZa2r.qGne0WAZo741y1bcpuzDy9fkE9tulZRDM5a',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 12:52:11','2020-12-01 12:52:11'),(24,'محمد علي السيد','01054649889','y.ali.telecom@gmail.com',NULL,'$2y$10$evhi04XAiv2/cZnsWlMNIutv/iLIb5hz8DLM/GIGm1PvphdjZ4r4e',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 12:53:37','2020-12-01 12:53:37'),(26,'محمد علي السيد','01084649889','z.ali.telecom@gmail.com',NULL,'$2y$10$V5emiCjQcZos0zbmWUw1C.fFBrhLVKBHnS3UXSHHVyCiiJDCZm5KK',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 12:54:26','2020-12-01 12:54:26'),(27,'محمد علي السيد','01094649889','f.ali.telecom@gmail.com',NULL,'$2y$10$3yztiq2qUsz2No6NHapfJOC6wqYjqnhIkus/dG77cA/UFJWEkKMDC',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 12:56:28','2020-12-01 12:56:28'),(28,'محمد علي السيد','01055649889','as.ali.telecom@gmail.com',NULL,'$2y$10$eKA8RW6.oAVqdKMz8QMQNeyCB10mgN9OFeCoJJ4jIXyijjuXbms16',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 13:10:28','2020-12-01 13:10:28'),(29,'Item 1','010774649844','AA.ali.telecom@gmail.com',NULL,'$2y$10$2YfxHIcEf.5Blg1HKAI5w.46AqtD0GcmXWY2O71XuZ1G6wUYBO.YK',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 13:13:17','2020-12-01 13:13:17'),(30,'Item 1','010884649844','MM.ali.telecom@gmail.com',NULL,'$2y$10$DbyxnK7RhxYEQdolC4p1nO9ETx9WjUfOmJnvscXehcXwGXYPmyGyu',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 13:16:09','2020-12-01 13:16:09'),(31,'Item 1','010984649844','Mn.ali.telecom@gmail.com',NULL,'$2y$10$7hDuy9DzDqj70c9auUq6B.Eh27xxtWuqC4CBl/Bg07lSvmov7rxrK',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2020-12-01 13:26:33','2020-12-01 13:26:33'),(32,'Mohamed Ali','01024649844','azhasoft@gmail.com',NULL,'$2y$10$WyOcPqbowMpG3mxJ5OIlu.n.IR50n3/zyLLLrxfVdAXk1Mzy1N3fa',6,'1',NULL,NULL,'4F0ot50ZHGeYdlxZzOsT5bqJdvZ6aBdaTgeHuVPwp8Tc5eWm4QRrieNxdpaC',NULL,NULL,0,'2021-01-02 19:48:00','2021-01-03 19:32:10'),(34,'save password','01024649898','azhasoft@gmail.com',NULL,'$2y$10$l3Hs6k/pweWcWr8vV.LkCewAIZdeu.O5XtAa3PIpwWID/491I/gMu',6,'1',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 19:53:00','2021-01-02 19:53:00'),(35,'ugd','01345865990','g.ali.telecom33@gmail.com',NULL,'$2y$10$C.2GZlWWtsWfo1R7MfchTeEF66//JH8zV6T7cxLbr3oXakfBjj43W',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 19:55:32','2021-01-02 19:55:32'),(36,'new doctore','01024649355','azhasoft@gmail.com',NULL,'$2y$10$Ct6YWDCh27jZjSk7vZ85y.fgkzTRakceezdJThpPRq3JVv342KEqi',6,'1',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:00:40','2021-01-02 20:00:40'),(37,'new doctore','010246494444','azhasoft@gmail.com',NULL,'$2y$10$/imlH4xIsExBHR3.2sIbp.Veyu.bkIDWVixO5.Jy7/4UE3zpXWoX2',6,'1',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:01:59','2021-01-02 20:01:59'),(38,'حسام','01034756822','azhasoft@gmail.com',NULL,'$2y$10$F3BipJtyaFRrnUgMLJNyruDr3NZx9.B8VRQcbrCA/j1a9MHTf6rdu',6,'1',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:18:09','2021-01-02 20:18:09'),(39,'ugddfdfdf','01645895455','g555.ali.telecom@gmail.com',NULL,'$2y$10$dgFRr2/UiGIEyfo0lPyqRuz15tFHy0oi2yFbUs0Mllupvji1W9vv2',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:19:35','2021-01-02 20:19:35'),(40,'sdhsjdhsjdhs','00 0192356477','azhasoft@gmail.com',NULL,'$2y$10$Osk5vpSUMjBuGVWw6rZs/u19x6OznAD46eZQEOB9kgbVZqRK2eCC.',6,'1',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:20:24','2021-01-02 20:20:24'),(41,'sdhsjdhsjdhs','990192356477','azhasoft@gmail.com',NULL,'$2y$10$srpoVu7VIDragN6QTx8g1OJ8UWrIHCEjIxQkHo9/9vwuMNdg6DZqK',6,'1',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:21:05','2021-01-02 20:21:05'),(42,'sdhsjdhsjdhs','990192356433','azhasoft@gmail.com',NULL,'$2y$10$zsJDO2sbA9uV5omOfusn6.0A1dPPxdBPSfOWJ7tgPjyEjjxxUQXey',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:23:25','2021-01-02 20:23:25'),(43,'حسن الجمال','01025599887744','azhasoft@gmail.com',NULL,'$2y$10$zWji7.CsC7FBqhdrVPdmBuirBjWkoxnfNWOFwyKTiR7JKs12sqGRa',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2021-01-02 20:24:57','2021-01-02 20:24:57'),(46,'حسن','0106456789588','azhasoft@gmail.com',NULL,'$2y$10$ylckWTV0O2Jy1wJPBpGT9uXqFRZ7KNsC6wD8E1DyUWhmHhgyzCAfm',6,'0',NULL,NULL,NULL,NULL,NULL,38,'2021-01-03 19:19:25','2021-01-03 19:19:25'),(47,'كمال','01045678955','azhasoft2@gmail.com',NULL,'$2y$10$01pw99hhkLJ00ghErb73PO4ZMEfW//5gYPsLxejooQfJj0d1mtoHW',6,'1',NULL,NULL,NULL,NULL,NULL,40,'2021-01-03 19:22:30','2021-01-03 19:28:38'),(52,'محمد علي السيد','01024649800','g.ali.telecom@gmail.com','2021-01-12 15:56:40','$2y$10$.1mJxrNPIcakzsJ2SUe10eWRFPEh2.xv0Et4x4xa5yxEDzeKyQSIC',NULL,'0',NULL,NULL,'pYGJ7rWaYAyGj9t75Cfi1QWz0ETCJjvijkb9t8Nq6vIq0CDaVnicaJ0iAwJo',NULL,NULL,0,'2021-01-12 15:40:48','2021-01-25 20:52:52'),(53,'Test user 2','01024659844','g.ali.telecom39@gmail.com',NULL,'$2y$10$GCmsF1Km51yWpKpxdBBoCu7ccEeOmvSF2MZB/54gD3OzcYCjdyZtS',6,'0',NULL,NULL,NULL,NULL,NULL,0,'2021-01-25 20:11:54','2021-01-25 20:12:08'),(54,'حسن السيد','01024648577','azhasoft@gmail.com',NULL,'$2y$10$SF388ANDjC88nDBtyj0dUuNgsCk3sAB2OQOCrMCzdRUximwV0z65e',6,'0',NULL,NULL,NULL,NULL,NULL,41,'2021-01-25 20:51:13','2021-01-25 20:51:13');

UNLOCK TABLES;

/*Table structure for table `colum_name` */

DROP TABLE IF EXISTS `colum_name`;

/*!50001 DROP VIEW IF EXISTS `colum_name` */;
/*!50001 DROP TABLE IF EXISTS `colum_name` */;

/*!50001 CREATE TABLE  `colum_name`(
 `schema` varchar(64) ,
 `table` varchar(64) ,
 `column` varchar(64) ,
 `Data_type` longtext 
)*/;

/*View structure for view colum_name */

/*!50001 DROP TABLE IF EXISTS `colum_name` */;
/*!50001 DROP VIEW IF EXISTS `colum_name` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `colum_name` AS select `columns`.`TABLE_SCHEMA` AS `schema`,`columns`.`TABLE_NAME` AS `table`,`columns`.`COLUMN_NAME` AS `column`,`columns`.`DATA_TYPE` AS `Data_type` from `information_schema`.`COLUMNS` where (`columns`.`TABLE_SCHEMA` = 'laravel') order by `columns`.`TABLE_NAME` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
