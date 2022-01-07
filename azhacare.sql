/*
SQLyog Ultimate v9.63 
MySQL - 8.0.21 : Database - azhacare
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`azhacare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `azhacare`;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `actions` */

LOCK TABLES `actions` WRITE;

insert  into `actions`(`id`,`name`,`clinic_id`,`busines_id`,`price`,`sessions`,`status`,`type`,`created_at`,`updated_at`) values (6,'كشف',53,6,200,1,1,NULL,'2020-11-27 09:00:56','2020-12-18 21:48:11'),(8,'مقياس سمع',44,6,300,20,1,NULL,'2020-11-27 09:11:12','2020-12-19 20:13:59'),(12,'ولادة طبيعي',44,6,2000,1,1,NULL,'2020-11-28 08:31:48','2020-12-19 20:14:32'),(13,'ولادة قيصرية',44,6,3000,2,1,NULL,'2020-11-28 08:35:50','2020-12-22 18:37:35'),(16,'إستشارة',53,6,70,1,1,NULL,'2020-11-29 17:22:26','2020-12-18 21:52:31'),(17,'نظارة',53,6,250,1,1,NULL,'2020-11-30 17:48:25','2020-12-18 21:52:36'),(18,'قيصرية',48,6,100,10,1,NULL,'2020-12-16 20:37:00','2021-02-17 08:44:03'),(23,'AAAAAA',44,6,NULL,NULL,1,NULL,'2021-02-28 11:59:33','2021-02-28 11:59:33'),(24,'AAAAAA',44,6,NULL,NULL,1,NULL,'2021-02-28 11:59:56','2021-02-28 11:59:56'),(26,'خلع عادي',82,12,150,1,1,NULL,'2021-03-11 16:55:46','2021-03-11 16:55:46');

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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `appointments` */

LOCK TABLES `appointments` WRITE;

insert  into `appointments`(`id`,`patient_id`,`busines_id`,`action_id`,`doctor_id`,`clinic_id`,`user_id`,`contract_id`,`price`,`Paid_val`,`rem_val`,`contract_val`,`patient_val`,`appoint_date`,`appoint_houre`,`appoint_time`,`notes`,`status`,`doctorpercint`,`contractpercint`,`contractvalue`,`doctorfat_id`,`contractfat_id`,`type`,`created_at`,`updated_at`,`source`) values (29,7,6,18,5,48,14,0,333330,NULL,333330,0,333330,'2020-12-31',0,8,NULL,5,NULL,NULL,NULL,0,0,0,'2020-12-31 21:08:37','2020-12-31 21:12:17',NULL),(30,3,6,12,5,44,14,2,2000,NULL,2000,0,2000,'2020-12-31',0,8,NULL,5,NULL,NULL,NULL,0,0,0,'2020-12-31 21:08:50','2020-12-31 21:15:32',NULL),(31,6,6,18,5,48,14,0,333330,NULL,333330,0,333330,'2020-12-31',0,16,NULL,5,NULL,NULL,NULL,0,0,0,'2020-12-31 21:16:51','2020-12-31 21:17:02',NULL),(32,3,6,18,7,48,47,0,333330,50,333280,0,333330,'2021-01-26',0,44,NULL,5,NULL,NULL,NULL,0,0,0,'2021-01-02 06:40:12','2021-01-27 14:44:42',NULL),(33,3,6,8,5,44,14,0,300,300,0,0,300,'2021-01-02',0,54,NULL,3,NULL,NULL,NULL,0,0,0,'2021-01-02 06:54:25','2021-01-10 01:21:09',NULL),(34,3,6,12,5,44,14,2,2000,NULL,2000,0,2000,'2021-01-02',0,19,NULL,3,NULL,NULL,NULL,0,0,0,'2021-01-02 08:19:21','2021-01-10 01:21:12',NULL),(36,15,6,8,4,44,14,0,300,200,100,0,300,'2021-01-02',0,24,NULL,3,NULL,NULL,NULL,0,0,1,'2021-01-02 08:25:06','2021-01-10 01:21:14',1),(37,12,6,8,6,44,14,0,300,300,0,0,300,'2021-01-02',0,52,NULL,3,NULL,NULL,NULL,0,0,1,'2021-01-02 08:52:23','2021-01-10 01:21:17',1),(38,31,6,8,5,44,14,1,300,50,50,200,100,'2021-01-02',0,3,NULL,2,NULL,NULL,NULL,0,0,1,'2021-01-02 11:04:09','2021-01-03 18:31:23',1),(39,2,6,18,5,48,14,2,333330,40000,293330,0,333330,'2021-01-02',0,5,NULL,2,NULL,NULL,NULL,0,0,1,'2021-01-02 11:06:03','2021-01-03 18:31:25',1),(40,6,6,15,6,44,14,0,200,200,0,0,200,'2021-01-03',0,33,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:34:43','2021-01-03 22:18:55',1),(41,2,6,8,6,44,14,0,300,300,0,0,300,'2021-01-03',0,34,NULL,4,NULL,NULL,NULL,0,0,1,'2021-01-03 18:35:34','2021-01-03 22:18:17',1),(42,26,6,8,4,44,14,1,300,100,0,200,100,'2021-01-03',0,37,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:41:07','2021-01-03 22:18:21',1),(43,26,6,8,4,44,14,1,300,100,0,200,100,'2021-01-03',0,37,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:42:18','2021-01-03 22:18:47',1),(44,26,6,8,4,44,14,1,300,100,0,200,100,'2021-01-03',0,37,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:43:09','2021-01-03 22:20:00',1),(45,2,6,18,5,48,14,0,333330,NULL,333330,0,333330,'2021-01-03',0,43,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:43:25','2021-01-03 22:20:03',1),(46,2,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,43,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 18:44:40','2021-01-03 22:20:06',1),(47,2,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,43,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:47:08','2021-01-03 18:47:08',1),(48,2,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,43,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:47:35','2021-01-03 18:47:35',1),(49,2,6,12,5,44,14,0,300,200,100,0,300,'2021-01-10',0,43,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:49:39','2021-01-03 18:49:39',1),(50,21,6,8,5,44,14,0,300,250,50,0,300,'2021-01-03',0,50,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:50:20','2021-01-03 18:50:20',1),(51,21,6,8,5,44,14,0,300,200,100,0,300,'2021-01-03',0,53,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:54:06','2021-01-03 18:54:06',1),(52,21,6,6,6,53,14,1,200,200,0,0,200,'2021-01-03',0,55,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-03 18:55:32','2021-01-03 18:55:32',1),(53,3,6,12,5,44,14,1,2000,NULL,600,1500,600,'2021-01-03',0,1,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 19:01:54','2021-01-03 22:20:16',1),(54,3,6,12,4,44,14,0,2000,NULL,2000,0,2000,'2021-01-03',0,2,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 19:02:19','2021-01-10 01:21:00',1),(55,3,6,8,5,44,14,0,300,NULL,300,0,300,'2021-01-03',0,7,NULL,2,NULL,NULL,NULL,0,0,1,'2021-01-03 19:07:48','2021-01-03 22:20:11',1),(56,9,6,18,5,48,46,1,333330,50000,283330,0,333330,'2021-01-03',0,53,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-03 19:53:56','2021-01-03 22:18:34',1),(57,6,6,8,4,44,14,1,300,100,0,200,100,'2021-01-17',0,46,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 04:47:25','2021-02-17 16:24:06',1),(58,7,6,16,6,53,14,0,70,70,0,0,70,'2021-01-17',0,48,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 05:49:12','2021-01-26 20:16:33',1),(59,7,6,15,7,44,14,0,200,200,0,0,200,'2021-01-17',0,49,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 05:50:15','2021-01-26 20:16:42',1),(60,7,6,8,11,44,14,0,300,300,0,0,300,'2021-01-17',0,50,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 05:55:21','2021-02-17 20:03:45',1),(61,6,6,18,16,48,47,0,333330,33333,299997,0,333330,'2021-01-17',0,5,NULL,5,NULL,NULL,NULL,0,0,1,'2021-01-17 06:05:55','2021-02-17 16:24:30',1),(62,6,6,8,6,44,47,1,300,50,50,200,100,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:07:26','2021-01-17 06:07:26',1),(63,6,6,8,6,44,47,1,300,50,50,200,100,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:08:22','2021-01-17 06:08:22',1),(64,23,6,18,6,48,47,0,333330,50,333280,0,333330,'2021-01-17',0,5,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:08:51','2021-01-17 06:08:51',1),(65,3,6,12,5,44,47,0,2000,2000,0,0,2000,'2021-01-17',0,13,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:13:32','2021-01-17 06:13:32',1),(66,3,6,12,5,44,47,0,2000,2000,0,0,2000,'2021-01-17',0,13,NULL,1,NULL,NULL,NULL,0,0,1,'2021-01-17 06:17:35','2021-01-17 06:17:35',1),(67,3,6,18,41,48,54,1,333330,300000,33330,0,333330,'2021-02-08',0,7,NULL,6,NULL,NULL,NULL,0,0,1,'2021-02-08 04:37:24','2021-02-20 22:22:17',1),(68,6,6,6,41,53,54,1,200,200,0,0,200,'2021-02-08',0,5,NULL,5,NULL,NULL,NULL,0,0,1,'2021-02-08 05:06:06','2021-02-20 22:22:12',1),(69,2,6,16,6,53,32,2,70,30,0,50,30,'2021-02-17',0,23,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 19:23:39','2021-02-17 19:23:39',1),(70,23,6,6,41,53,54,0,200,150,50,0,200,'2021-02-17',0,12,NULL,3,NULL,NULL,NULL,0,0,1,'2021-02-17 20:12:41','2021-02-17 20:14:53',1),(71,18,6,17,41,53,54,0,250,NULL,250,0,250,'2021-02-17',0,16,NULL,2,NULL,NULL,NULL,0,0,1,'2021-02-17 20:17:07','2021-02-21 18:55:48',1),(72,6,6,16,41,53,54,0,70,300,-230,0,70,'2021-02-17',0,23,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 20:23:29','2021-02-17 20:23:29',1),(73,3,6,0,0,0,54,0,NULL,NULL,NULL,NULL,NULL,'2021-02-17',0,31,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 20:31:09','2021-02-17 20:31:09',1),(74,3,6,0,0,0,54,0,NULL,NULL,NULL,NULL,NULL,'2021-02-17',0,33,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 20:33:35','2021-02-17 20:33:35',1),(75,3,6,0,0,0,54,0,NULL,NULL,NULL,NULL,NULL,'2021-02-17',0,34,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 20:34:50','2021-02-17 20:34:50',1),(76,3,6,0,0,0,54,0,NULL,NULL,NULL,NULL,NULL,'2021-02-17',0,34,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 20:36:33','2021-02-17 20:36:33',1),(77,0,6,0,41,0,54,0,NULL,NULL,NULL,NULL,NULL,'2021-02-17',0,38,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-17 20:38:34','2021-02-17 20:38:34',1),(78,7,6,6,6,53,32,1,200,200,0,0,200,'2021-02-21',0,1,NULL,1,NULL,NULL,NULL,0,0,1,'2021-02-21 19:01:48','2021-02-21 19:01:48',1),(79,35,12,26,46,82,56,8,150,60,0,100,60,'2021-03-11',0,52,NULL,2,NULL,NULL,NULL,0,0,1,'2021-03-11 18:09:32','2021-04-02 05:52:53',1),(81,35,12,26,42,82,56,7,150,150,0,0,150,'2021-03-17',0,15,NULL,5,NULL,NULL,NULL,0,0,1,'2021-03-17 08:15:59','2021-04-02 05:38:24',1),(82,36,12,26,46,82,56,7,150,30,10,120,40,'2021-03-27',0,22,NULL,5,NULL,NULL,NULL,0,0,1,'2021-03-27 17:23:25','2021-04-02 06:01:00',1),(83,35,12,26,46,82,56,7,150,50,-10,120,40,'2021-04-02',0,59,NULL,1,NULL,NULL,NULL,0,0,1,'2021-04-02 06:00:09','2021-04-02 06:00:09',1),(84,36,12,26,46,82,56,0,150,200,-50,0,150,'2021-04-02',0,16,NULL,2,NULL,NULL,NULL,0,0,1,'2021-04-02 06:00:30','2021-04-02 06:16:37',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `biometrics` */

LOCK TABLES `biometrics` WRITE;

insert  into `biometrics`(`id`,`patient_id`,`user_id`,`date`,`temperature`,`pressure`,`pulse`,`weight`,`fasting_sugar`,`fater_sugar`,`notes`,`created_at`,`updated_at`) values (1,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 17:57:50','2021-01-17 17:57:50'),(2,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 17:57:52','2021-01-17 17:57:52'),(3,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 17:57:55','2021-01-17 17:57:55'),(4,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:35','2021-01-17 18:03:35'),(5,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:38','2021-01-17 18:03:38'),(6,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:41','2021-01-17 18:03:41'),(7,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:03:44','2021-01-17 18:03:44'),(8,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:04:08','2021-01-17 18:04:08'),(9,6,1,'2021-01-10','10','80/120','80','95','60','90',NULL,'2021-01-17 18:04:11','2021-01-17 18:04:11'),(10,6,1,'2021-01-31','100','80/120','80','95','60','90',NULL,'2021-01-17 18:04:56','2021-01-17 18:28:29'),(11,6,1,'2021-01-31','50','120','30','50','70','90',NULL,'2021-01-17 18:04:59','2021-01-17 18:21:08'),(12,6,47,'2021-01-17','33434','34','343','333','34','66',NULL,'2021-01-17 18:31:10','2021-01-17 18:31:10'),(21,7,32,'2021-01-26','90','100','30',NULL,NULL,NULL,NULL,'2021-01-26 19:59:26','2021-02-21 19:35:08'),(26,7,47,'2021-01-26','20','120',NULL,NULL,NULL,NULL,NULL,'2021-01-26 20:13:39','2021-01-26 20:14:13');

UNLOCK TABLES;

/*Table structure for table `business` */

DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `presc_width` int DEFAULT NULL,
  `presc_start_print` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `business` */

LOCK TABLES `business` WRITE;

insert  into `business`(`id`,`name`,`presc_width`,`presc_start_print`,`currency_id`,`is_active`,`start_date`,`tax_number_1`,`tax_label_1`,`tax_number_2`,`tax_label_2`,`default_sales_tax`,`default_profit_percent`,`owner_id`,`time_zone`,`fy_start_month`,`accounting_method`,`default_sales_discount`,`sell_price_tax`,`logo`,`sku_prefix`,`enable_product_expiry`,`expiry_type`,`on_product_expiry`,`stop_selling_before`,`enable_tooltip`,`purchase_in_diff_currency`,`purchase_currency_id`,`p_exchange_rate`,`transaction_edit_days`,`stock_expiry_alert_days`,`keyboard_shortcuts`,`pos_settings`,`woocommerce_api_settings`,`woocommerce_wh_oc_secret`,`woocommerce_wh_ou_secret`,`woocommerce_wh_od_secret`,`woocommerce_wh_or_secret`,`essentials_settings`,`weighing_scale_setting`,`enable_brand`,`enable_category`,`enable_sub_category`,`enable_price_tax`,`enable_purchase_status`,`enable_lot_number`,`default_unit`,`enable_sub_units`,`enable_racks`,`enable_row`,`enable_position`,`enable_editing_product_from_purchase`,`sales_cmsn_agnt`,`item_addition_method`,`enable_inline_tax`,`currency_symbol_placement`,`enabled_modules`,`date_format`,`time_format`,`ref_no_prefixes`,`theme_color`,`created_by`,`enable_rp`,`rp_name`,`amount_for_unit_rp`,`min_order_total_for_rp`,`max_rp_per_order`,`redeem_amount_per_unit_rp`,`min_order_total_for_redeem`,`min_redeem_point`,`max_redeem_point`,`rp_expiry_period`,`rp_expiry_type`,`email_settings`,`sms_settings`,`custom_labels`,`common_settings`,`created_at`,`updated_at`) values (1,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-05',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-05 07:34:25','2020-11-05 07:34:25'),(2,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-05',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-05 07:48:32','2020-11-05 07:48:32'),(3,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-05',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-05 07:50:34','2020-11-05 07:50:34'),(4,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:33:18','2020-11-06 12:33:18'),(5,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:33:41','2020-11-06 12:33:41'),(6,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:35:09','2020-11-06 12:35:09'),(7,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 12:37:37','2020-11-06 12:37:37'),(8,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-06',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-06 13:21:53','2020-11-06 13:21:53'),(9,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-10',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-10 06:21:07','2020-11-10 06:21:07'),(10,'New Pharmacy',NULL,NULL,NULL,1,'2020-11-10',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2020-11-10 18:46:08','2020-11-10 18:46:08'),(11,'New Pharmacy',NULL,NULL,NULL,1,'2021-03-11',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2021-03-11 14:25:04','2021-03-11 14:25:04'),(12,'New Pharmacy',500,140,NULL,1,'2021-03-11',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Asia/Kolkata',1,'fifo',NULL,'includes',NULL,NULL,0,'add_expiry','keep_selling',NULL,1,0,NULL,'1.000',30,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,1,1,0,NULL,0,0,0,0,1,NULL,1,1,'before',NULL,'m/d/Y','24',NULL,NULL,NULL,0,NULL,'1.0000','1.0000',NULL,'1.0000','1.0000',NULL,NULL,NULL,'year',NULL,NULL,NULL,NULL,'2021-03-11 14:40:22','2021-03-11 14:40:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `clinics` */

LOCK TABLES `clinics` WRITE;

insert  into `clinics`(`id`,`code`,`busines_id`,`type`,`address`,`telephon1`,`telephon2`,`logo`,`status`,`morning_from`,`morning_to`,`night_from`,`night_to`,`notes`,`created_at`,`updated_at`) values (44,'عيادة الجلدية',6,6,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية','23456','01024649844','6_1605644637.png',1,NULL,NULL,NULL,NULL,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-14 14:34:17','2021-02-16 21:46:32'),(48,'حديثي الولادة',6,6,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,NULL,'',0,NULL,NULL,NULL,NULL,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-14 14:35:37','2020-11-14 14:35:37'),(53,'عيادة العيون',6,1,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية','23456','456','',0,NULL,NULL,NULL,NULL,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-14 17:11:16','2020-11-14 17:11:16'),(81,'Test',6,1,'الإسماعيلية','01024649844',NULL,'6_1611607450.jpeg',0,NULL,NULL,NULL,NULL,'مواعيد العمل','2021-01-25 20:44:10','2021-02-16 21:47:19'),(82,'الأسنان',12,5,NULL,'010246498422',NULL,'',0,NULL,NULL,NULL,NULL,'تعمل يوميا','2021-03-11 15:21:48','2021-03-27 17:22:34');

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

insert  into `contract_actions`(`contract_id`,`action_id`,`contract_val`,`patient_val`,`created_at`,`updated_at`) values (1,10,NULL,NULL,'2020-12-19 00:31:32','2020-12-19 00:31:32'),(3,8,400,500,'2020-12-19 06:09:08','2020-12-19 06:09:08'),(3,15,200,60,'2020-12-19 06:09:52','2020-12-19 06:09:52'),(1,15,150,70,'2020-12-19 20:15:09','2020-12-19 20:15:09'),(1,12,1500,600,'2020-12-19 20:41:25','2020-12-19 20:41:25'),(1,13,2000,1000,'2020-12-19 20:41:26','2020-12-19 20:41:26'),(1,14,100,70,'2020-12-19 20:41:26','2020-12-19 20:41:26'),(1,8,200,100,'2020-12-19 20:41:27','2020-12-19 20:41:27'),(1,18,200,300,'2021-02-17 08:44:03','2021-02-17 08:44:03'),(2,6,100,120,'2021-02-17 16:22:42','2021-02-17 16:22:42'),(2,16,50,30,'2021-02-17 16:22:52','2021-02-17 16:22:52'),(2,17,200,70,'2021-02-17 16:23:03','2021-02-17 16:23:03'),(8,25,90,20,'2021-03-11 17:30:40','2021-03-11 17:30:40'),(8,26,100,60,'2021-03-11 17:30:42','2021-03-11 17:30:42'),(8,27,150,80,'2021-03-11 17:30:43','2021-03-11 17:30:43'),(8,28,800,300,'2021-03-11 17:30:44','2021-03-11 17:30:44'),(7,28,0,0,'2021-03-11 17:36:39','2021-03-11 17:36:39'),(7,26,120,40,'2021-03-27 11:25:23','2021-03-27 11:25:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `contracts` */

LOCK TABLES `contracts` WRITE;

insert  into `contracts`(`id`,`name`,`responsible`,`busines_id`,`status`,`address`,`telephon1`,`telephon2`,`notes`,`created_at`,`updated_at`) values (1,'المصرية للإتصالات','محمد علي',6,1,'الإسماعيلية المستقبل  شارع المدينة المنورة','01024649844',NULL,NULL,'2020-11-29 14:41:57','2020-11-29 14:41:57'),(2,'شركة كهرباء القناة','محمد حسن',6,2,'مصر الجديدة القاهرة','01024649855','258741245654578',NULL,'2020-11-29 17:02:33','2020-12-18 06:52:16'),(3,'بنك القاهرة','محمد حسن',6,1,'القاهرة','121212223456','258741245654578',NULL,'2020-11-29 17:03:07','2020-12-18 06:52:32'),(6,'شركة كهرباء القناة','محمد حسن',6,2,'مصر الجديدة القاهرة','01024649855','010244',NULL,'2020-11-29 17:23:19','2021-02-17 08:41:34'),(7,'شركة الكهرباء','محمد علي',12,1,'الإسماعيلية','01024649844',NULL,NULL,'2021-03-11 16:57:00','2021-03-11 16:57:00'),(8,'المصرية للإتصالات','حسن',12,3,NULL,'01024649844',NULL,NULL,'2021-03-11 16:57:41','2021-03-27 11:24:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `diagnosis` */

LOCK TABLES `diagnosis` WRITE;

insert  into `diagnosis`(`id`,`date`,`doctor_id`,`patient_id`,`diagnosis`,`created_at`,`updated_at`) values (14,'2021-01-26',40,7,'tisre dfgdfg','2021-01-26 19:46:02','2021-01-26 19:46:02'),(19,'2021-02-21',0,3,'this is test','2021-02-21 10:59:25','2021-02-21 10:59:25'),(20,'2021-03-13',0,35,'this is test','2021-03-13 04:46:00','2021-03-13 04:46:00');

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

insert  into `doctor_status`(`id`,`status`) values (1,'يعمل'),(2,'لا يعمل'),(3,'deleted');

UNLOCK TABLES;

/*Table structure for table `doctors` */

DROP TABLE IF EXISTS `doctors`;

CREATE TABLE `doctors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `busines_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `titel` varchar(45) DEFAULT NULL,
  `speciality` int DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `telephon2` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` int DEFAULT NULL COMMENT '1-In work  2- Not working   3-deleted',
  `notes` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `doctors` */

LOCK TABLES `doctors` WRITE;

insert  into `doctors`(`id`,`busines_id`,`name`,`titel`,`speciality`,`mobile`,`telephon2`,`address`,`email`,`status`,`notes`,`created_at`,`updated_at`) values (4,'6','محمد أحمد 2',NULL,NULL,'01024649888','456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:09:25','2021-01-02 20:27:53'),(5,'6','محمد علي السيد',NULL,NULL,'01024649844',NULL,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:24:27','2020-11-26 21:24:27'),(6,'6','مصطفي العدوي',NULL,NULL,'01024649844','456',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:29:38','2020-11-26 21:29:38'),(7,'6','إبراهيم كمال',NULL,NULL,'01024649844','456',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:33:40','2020-11-26 21:33:40'),(8,'6','جمال السيد',NULL,NULL,'01024649844','369582147',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:33:50','2020-11-26 21:33:50'),(9,'6','حسن علي',NULL,NULL,'01024649844','369582147',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:33:58','2020-11-26 21:33:58'),(11,'6','باسم مصطفي السيد',NULL,NULL,'01024649844','147',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:35:06','2021-01-02 17:49:30'),(12,'2','فؤاد خليل',NULL,NULL,'01024649844','258741245654578',NULL,NULL,1,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2020-11-26 21:35:32','2020-11-26 21:38:03'),(13,'6','علي مصطفي',NULL,NULL,'01024649844',NULL,NULL,NULL,1,'مرحبا','2021-01-02 17:50:20','2021-01-02 17:50:20'),(14,'6','كمال السيد',NULL,NULL,NULL,NULL,NULL,NULL,1,'يسسسب','2021-01-02 18:00:36','2021-01-02 18:00:36'),(15,'6','كمال السيد',NULL,NULL,NULL,NULL,NULL,NULL,1,'يسسسب','2021-01-02 18:00:41','2021-01-02 18:00:41'),(16,'6','كمال السيد',NULL,NULL,'01024648955',NULL,NULL,NULL,1,'يسسسب','2021-01-02 18:00:49','2021-02-21 06:39:15'),(17,'6','كمال جمال',NULL,NULL,NULL,NULL,NULL,NULL,1,'يبسيبي','2021-01-02 18:01:23','2021-01-02 18:01:23'),(18,'6','كمال جمال',NULL,NULL,NULL,NULL,NULL,NULL,1,'يبسيبي','2021-01-02 18:03:14','2021-01-02 18:03:14'),(19,'6','محمد أحمد',NULL,NULL,NULL,'456',NULL,NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:30:21','2021-01-02 19:30:21'),(20,'6','محمد أحمد',NULL,NULL,NULL,'456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:39:12','2021-01-02 19:39:12'),(21,'6','محمد أحمد',NULL,NULL,NULL,'456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:39:19','2021-01-02 19:39:19'),(22,'6','محمد أحمد',NULL,NULL,NULL,'456','شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية',NULL,2,'مواعيد العمل يوميا من 3 إلي 6  ومن 8 إلي 10 ماعدا الخميس من 3 إلي 6  الجمعة راحة','2021-01-02 19:39:22','2021-01-02 19:39:22'),(23,'6','save password',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:46:18','2021-01-02 19:46:18'),(24,'6','save password',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:48:00','2021-01-02 19:48:00'),(25,'6','save password',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:50:48','2021-01-02 19:50:48'),(26,'6','save password',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 19:53:00','2021-01-02 19:53:00'),(27,'6','new doctore',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:00:40','2021-01-02 20:00:40'),(28,'6','new doctore',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:01:59','2021-01-02 20:01:59'),(29,'6','حسام',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:18:08','2021-01-02 20:18:08'),(30,'6','sdhsjdhsjdhs',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:20:24','2021-01-02 20:20:24'),(31,'6','sdhsjdhsjdhs',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:21:05','2021-01-02 20:21:05'),(32,'6','sdhsjdhsjdhs',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:23:25','2021-01-02 20:23:25'),(33,'6','حسن الجمال',NULL,NULL,NULL,'12133323',NULL,NULL,1,NULL,'2021-01-02 20:24:57','2021-01-02 20:24:57'),(34,'6','حسمامبلبلبل',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:27:36','2021-01-02 20:27:36'),(35,'6','حسمامبلبلبل',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-02 20:27:42','2021-01-02 20:27:42'),(36,'6','سلامة الونش',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:15:41','2021-01-03 19:15:41'),(37,'6','سلامة الونش',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:15:49','2021-01-03 19:15:49'),(38,'6','حسن',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:19:25','2021-01-03 19:19:25'),(39,'6','كمال',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:21:21','2021-01-03 19:21:21'),(40,'6','كمال',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,'2021-01-03 19:22:30','2021-01-03 19:22:30'),(41,'6','حسن السيد',NULL,NULL,'01024649522','01024564854',NULL,NULL,1,NULL,'2021-01-25 20:51:13','2021-02-21 06:39:46'),(46,'12','محمد علي السيد',NULL,1,'010945658944','01024566363',NULL,NULL,1,'يعود إلي العمل بعد أسبوع','2021-03-27 08:36:04','2021-03-27 17:17:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dosages` */

LOCK TABLES `dosages` WRITE;

insert  into `dosages`(`id`,`name`,`busines_id`,`created_at`,`updated_at`) values (19,'مرة واحدة يوميا',6,'2020-11-29 08:17:23','2020-11-29 08:17:23'),(28,'كل 12 ساعة',12,'2021-03-27 11:19:18','2021-03-27 11:19:18'),(29,'كل 8 ساعات',12,'2021-03-27 11:19:29','2021-03-27 11:19:29'),(30,'مر واحدة يوميا',12,'2021-03-27 11:21:26','2021-03-27 11:21:26'),(69,'3مرات  لمدة أسبوع',12,'2021-03-28 22:03:01','2021-03-28 22:03:01'),(70,'asd',12,'2021-03-29 22:05:31','2021-03-29 22:05:31');

UNLOCK TABLES;

/*Table structure for table `drugs` */

DROP TABLE IF EXISTS `drugs`;

CREATE TABLE `drugs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Generic_Name` text CHARACTER SET utf8 COLLATE utf8_bin,
  `Price` double DEFAULT '0',
  `Price_Old` double DEFAULT '0',
  `Company` text CHARACTER SET utf8 COLLATE utf8_bin,
  `Pharmacology` text CHARACTER SET utf8 COLLATE utf8_bin,
  `Route` text CHARACTER SET utf8 COLLATE utf8_bin,
  `Dosage_ID` int DEFAULT '0',
  `Composition_ID` int DEFAULT '0',
  `GI_ID` int DEFAULT '0',
  `user_id` int DEFAULT '0',
  `approved` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `drugs` */

LOCK TABLES `drugs` WRITE;


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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `expenses_cats` */

LOCK TABLES `expenses_cats` WRITE;

insert  into `expenses_cats`(`id`,`name`,`busines_id`,`cost`,`notes`,`created_at`,`updated_at`) values (5,'فاتورة تليفون 2',6,'1520','asasas','2020-11-30 18:22:37','2021-02-17 15:36:22'),(6,'سمك بوري',6,'20.5',NULL,'2020-11-30 18:22:44','2020-11-30 18:22:44'),(7,'سمك بوري مشوي',6,'300',NULL,'2020-11-30 18:22:53','2020-11-30 18:30:44'),(8,'الإيجار',6,'500',NULL,'2021-02-17 15:12:14','2021-02-17 15:36:09'),(16,'أدوات نظافة',12,'1000',NULL,'2021-03-27 11:35:00','2021-03-27 11:35:00'),(17,'إيجار العيادة',12,'300',NULL,'2021-03-27 11:35:10','2021-03-27 11:35:26');

UNLOCK TABLES;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

LOCK TABLES `migrations` WRITE;

UNLOCK TABLES;

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

LOCK TABLES `model_has_permissions` WRITE;

UNLOCK TABLES;

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

LOCK TABLES `model_has_roles` WRITE;

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values (1,'App\\Models\\User',56),(10,'App\\Models\\User',56),(3,'App\\Models\\User',59),(5,'App\\Models\\User',59),(7,'App\\Models\\User',59),(10,'App\\Models\\User',59),(2,'App\\Models\\User',60),(2,'App\\Models\\User',61),(2,'App\\Models\\User',62),(2,'App\\Models\\User',63),(2,'App\\Models\\User',65);

UNLOCK TABLES;

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `patients` */

LOCK TABLES `patients` WRITE;

insert  into `patients`(`id`,`busines_id`,`name`,`telephone1`,`telephone2`,`address`,`birthdate`,`sex`,`email`,`attention`,`notes`,`status`,`created_at`,`updated_at`) values (2,6,'محمد علي السيد ءءءءء','01024649844',NULL,NULL,'1976-02-10 00:00:00',1,NULL,0,NULL,NULL,'2020-12-05 21:04:06','2021-02-17 19:22:14'),(3,6,'محمد علي السيد 2 ',NULL,NULL,NULL,'1975-11-15 00:00:00',2,NULL,1,NULL,NULL,'2020-12-05 21:04:24','2020-12-05 21:04:24'),(6,6,'محمد علي السيد',NULL,NULL,NULL,'1976-05-10 00:00:00',2,NULL,1,NULL,NULL,'2020-12-05 21:06:28','2020-12-05 21:06:28'),(7,6,'محمد علي السيد','01024649844',NULL,NULL,'1920-06-10 00:00:00',1,NULL,0,NULL,NULL,'2020-12-05 21:14:27','2020-12-05 21:14:27'),(9,6,'محمد علي السيد','01024649844',NULL,NULL,'2015-09-10 00:00:00',2,NULL,1,'يبيسبيب\r\nيبيبيب\r\n\r\nيبيبيب',NULL,'2020-12-05 21:16:51','2020-12-05 21:16:51'),(12,6,'سمك بوري','01024649844',NULL,'شارع سعد بن خيثمه،بجوار مستشفى الولاده الجديد المملكة العربية السعودية','1920-08-10 00:00:00',2,'g3.ali.telecom@gmail.com',1,NULL,NULL,'2020-12-05 22:08:37','2020-12-05 22:08:37'),(13,6,'السيد المحترم','01024649855',NULL,'مصر الجديدة القاهرة2','1990-12-30 00:00:00',2,'g.ali.telecom@gmail.com',1,'1-تجربة \r\n2- تجربة 2\r\n3- تجربة 3',NULL,'2020-12-06 17:44:29','2020-12-06 17:52:56'),(15,6,'علي','01024649844',NULL,NULL,'1920-01-10 00:00:00',1,NULL,1,NULL,NULL,'2020-12-11 05:02:40','2020-12-11 05:02:40'),(16,6,'محمود عبدالرحمن','01024648944',NULL,NULL,'1950-01-10 00:00:00',1,NULL,0,NULL,NULL,'2020-12-30 17:47:08','2020-12-30 17:47:08'),(17,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:33:31','2021-01-02 10:33:31'),(18,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:35:19','2021-01-02 10:35:19'),(19,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:35:27','2021-01-02 10:35:27'),(20,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:37:11','2021-01-02 10:37:11'),(21,6,'السيد محمد رمضان','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:37:27','2021-01-02 10:37:27'),(22,6,'السيد محمد رمضان 3','01024648944',NULL,'الإسماعيلية','1960-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-01-02 10:37:48','2021-01-02 10:41:15'),(23,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:42:14','2021-01-02 10:42:14'),(24,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:46:32','2021-01-02 10:46:32'),(25,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:47:06','2021-01-02 10:47:06'),(26,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 10:59:34','2021-01-02 10:59:34'),(27,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:00:29','2021-01-02 11:00:29'),(28,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:01:13','2021-01-02 11:01:13'),(29,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:02:31','2021-01-02 11:02:31'),(30,6,'رمضا محمد حسن','010245498855',NULL,'الإسماعيلية','1950-01-31 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:02:58','2021-01-02 11:02:58'),(31,6,'سمير عبدالعظيم 2','01036495877',NULL,'الإسماعيلية','1920-01-10 00:00:00',1,NULL,0,NULL,NULL,'2021-01-02 11:03:41','2021-02-17 17:01:35'),(32,6,'كريمة السيد مصطفي','0102456464655',NULL,NULL,'1950-01-30 00:00:00',2,NULL,1,NULL,NULL,'2021-02-17 20:43:27','2021-02-17 20:43:27'),(33,6,'عبدالعظيم','010243666456',NULL,NULL,'1950-01-10 00:00:00',1,NULL,0,NULL,NULL,'2021-02-17 20:47:34','2021-02-17 20:47:34'),(34,6,'سماح السيد جمال','01024654899',NULL,NULL,'1920-01-30 00:00:00',1,NULL,0,NULL,NULL,'2021-02-17 20:49:05','2021-02-17 20:49:05'),(35,12,'محمود حسن','01024649844',NULL,NULL,'1990-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-03-11 18:03:37','2021-03-30 17:25:56'),(36,12,'محمود السيد','01024565656',NULL,NULL,'1950-01-10 00:00:00',1,NULL,1,NULL,NULL,'2021-03-27 11:37:26','2021-03-27 11:37:26');

UNLOCK TABLES;

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

LOCK TABLES `permissions` WRITE;

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values (1,'role.view','web','2020-11-06 19:55:07','2020-11-06 19:55:07'),(2,'role.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(3,'role.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(4,'role.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(5,'user.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(6,'user.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(7,'user.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(8,'user.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(10,'clinic.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(11,'clinic.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(12,'clinic.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(13,'clinic.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(14,'doctor.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(15,'doctor.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(16,'doctor.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(17,'doctor.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(18,'doctor.view','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(19,'doctor.add','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(20,'doctor.edit','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(21,'doctor.delete','web','2020-11-06 20:32:50','2020-11-06 20:32:50'),(22,'Dosage.view','web',NULL,NULL),(23,'Dosage.add','web',NULL,NULL),(24,'Dosage.edit','web',NULL,NULL),(25,'Dosage.delete','web',NULL,NULL),(26,'Contract.view','web',NULL,NULL),(27,'Contract.add','web',NULL,NULL),(28,'Contract.edit','web',NULL,NULL),(29,'Contract.delete','web',NULL,NULL),(30,'ExpensesCat.view','web',NULL,NULL),(31,'ExpensesCat.add','web',NULL,NULL),(32,'ExpensesCat.edit','web',NULL,NULL),(33,'ExpensesCat.delet','web',NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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

/*Table structure for table `prescriptions` */

DROP TABLE IF EXISTS `prescriptions`;

CREATE TABLE `prescriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `appointment_id` int DEFAULT NULL,
  `drug_id` int DEFAULT NULL,
  `dosage_id` int DEFAULT NULL,
  `doctore_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `prescriptions` */

LOCK TABLES `prescriptions` WRITE;

insert  into `prescriptions`(`id`,`appointment_id`,`drug_id`,`dosage_id`,`doctore_id`,`patient_id`,`created_at`,`updated_at`) values (1,NULL,63,NULL,56,35,'2021-03-17 05:11:29','2021-03-17 05:11:29'),(2,NULL,63,NULL,56,35,'2021-03-17 05:11:32','2021-03-17 05:11:32'),(3,NULL,63,19,56,35,'2021-03-17 05:15:13','2021-03-17 05:15:13'),(4,NULL,63,19,56,35,'2021-03-17 05:17:41','2021-03-17 05:17:41'),(5,79,64,19,56,35,'2021-03-17 05:17:57','2021-03-17 05:17:57'),(6,79,64,19,56,35,'2021-03-17 05:29:08','2021-03-17 05:29:08'),(7,79,64,19,56,35,'2021-03-17 05:29:09','2021-03-17 05:29:09'),(8,79,64,19,56,35,'2021-03-17 05:29:10','2021-03-17 05:29:10'),(9,79,64,19,56,35,'2021-03-17 05:29:10','2021-03-17 05:29:10'),(10,79,64,19,56,35,'2021-03-17 05:30:57','2021-03-17 05:30:57'),(11,79,64,19,56,35,'2021-03-17 05:31:24','2021-03-17 05:31:24'),(12,79,64,19,56,35,'2021-03-17 05:32:09','2021-03-17 05:32:09'),(13,79,64,19,56,35,'2021-03-17 05:32:15','2021-03-17 05:32:15'),(14,79,64,19,56,35,'2021-03-17 05:32:16','2021-03-17 05:32:16'),(15,79,64,19,56,35,'2021-03-17 05:32:17','2021-03-17 05:32:17'),(16,79,64,19,56,35,'2021-03-17 05:32:17','2021-03-17 05:32:17'),(17,79,64,19,56,35,'2021-03-17 05:32:17','2021-03-17 05:32:17'),(18,79,NULL,19,56,35,'2021-03-17 05:32:23','2021-03-17 05:32:23'),(19,79,NULL,19,56,35,'2021-03-17 05:32:25','2021-03-17 05:32:25'),(20,79,NULL,19,56,35,'2021-03-17 05:32:26','2021-03-17 05:32:26'),(21,79,NULL,19,56,35,'2021-03-17 05:32:27','2021-03-17 05:32:27'),(22,79,NULL,19,56,35,'2021-03-17 05:35:26','2021-03-17 05:35:26'),(23,79,64,19,56,35,'2021-03-17 05:41:04','2021-03-17 05:41:04'),(24,79,64,19,56,35,'2021-03-17 05:41:06','2021-03-17 05:41:06'),(25,79,63,19,56,35,'2021-03-17 05:41:16','2021-03-17 05:41:16'),(26,79,63,19,56,35,'2021-03-17 05:41:20','2021-03-17 05:41:20'),(27,79,63,19,56,35,'2021-03-17 05:41:56','2021-03-17 05:41:56'),(28,79,261,19,56,35,'2021-03-17 05:43:20','2021-03-17 05:43:20'),(29,79,261,19,56,35,'2021-03-17 05:43:23','2021-03-17 05:43:23'),(30,79,261,19,56,35,'2021-03-17 05:43:25','2021-03-17 05:43:25'),(31,79,261,19,56,35,'2021-03-17 05:43:27','2021-03-17 05:43:27'),(32,79,261,19,56,35,'2021-03-17 05:43:28','2021-03-17 05:43:28'),(33,79,261,19,56,35,'2021-03-17 05:43:30','2021-03-17 05:43:30'),(34,79,65,19,56,35,'2021-03-17 05:46:56','2021-03-17 05:46:56'),(35,79,261,19,56,35,'2021-03-17 05:52:20','2021-03-17 05:52:20'),(36,79,261,19,56,35,'2021-03-17 05:52:22','2021-03-17 05:52:22'),(37,79,261,19,56,35,'2021-03-17 05:52:23','2021-03-17 05:52:23'),(38,79,261,19,56,35,'2021-03-17 05:54:52','2021-03-17 05:54:52'),(39,79,261,19,56,35,'2021-03-17 05:55:34','2021-03-17 05:55:34'),(40,79,64,19,56,35,'2021-03-17 05:56:53','2021-03-17 05:56:53'),(41,79,64,19,56,35,'2021-03-17 06:04:47','2021-03-17 06:04:47'),(42,79,64,19,56,35,'2021-03-17 06:04:49','2021-03-17 06:04:49'),(43,79,261,19,56,35,'2021-03-17 06:07:54','2021-03-17 06:07:54'),(44,79,261,19,56,35,'2021-03-17 06:07:55','2021-03-17 06:07:55'),(45,79,261,19,56,35,'2021-03-17 06:07:56','2021-03-17 06:07:56'),(46,79,261,19,56,35,'2021-03-17 06:07:57','2021-03-17 06:07:57'),(47,79,64,19,56,35,'2021-03-17 06:08:42','2021-03-17 06:08:42'),(48,79,64,19,56,35,'2021-03-17 06:11:23','2021-03-17 06:11:23'),(49,79,64,19,56,35,'2021-03-17 06:11:36','2021-03-17 06:11:36'),(50,79,261,19,56,35,'2021-03-17 06:13:44','2021-03-17 06:13:44'),(51,79,99,19,56,35,'2021-03-17 06:13:59','2021-03-17 06:13:59'),(52,79,99,19,56,35,'2021-03-17 06:14:03','2021-03-17 06:14:03'),(53,79,99,19,56,35,'2021-03-17 06:14:04','2021-03-17 06:14:04'),(54,79,99,19,56,35,'2021-03-17 06:18:36','2021-03-17 06:18:36'),(55,79,99,19,56,35,'2021-03-17 06:18:56','2021-03-17 06:18:56'),(56,79,68,19,56,35,'2021-03-17 06:21:44','2021-03-17 06:21:44'),(57,79,68,19,56,35,'2021-03-17 06:21:46','2021-03-17 06:21:46'),(58,79,64,19,56,35,'2021-03-17 06:22:32','2021-03-17 06:22:32'),(59,79,64,19,56,35,'2021-03-17 06:22:33','2021-03-17 06:22:33'),(60,79,54,19,56,35,'2021-03-17 06:23:24','2021-03-17 06:23:24'),(163,83,4665,19,56,35,'2021-04-02 07:22:45','2021-04-02 07:22:45'),(164,83,1022,19,56,35,'2021-04-02 07:22:51','2021-04-02 07:22:51'),(165,83,378,69,56,35,'2021-04-02 07:23:12','2021-04-02 07:23:12');

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

insert  into `role_has_permissions`(`permission_id`,`role_id`) values (1,1),(2,1),(3,1),(4,1),(6,1),(7,1),(8,1);

UNLOCK TABLES;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `busines_id` int DEFAULT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

LOCK TABLES `roles` WRITE;

insert  into `roles`(`id`,`name`,`busines_id`,`guard_name`,`created_at`,`updated_at`) values (1,'Super Admin',0,'web',NULL,NULL),(2,'doctor',1,'web',NULL,NULL),(3,'nursin',1,'web','2020-11-06 19:54:14','2020-11-06 19:54:14'),(4,'secretary',1,'web',NULL,NULL),(5,'account',1,'web',NULL,NULL),(7,'secrtarial',1,'web',NULL,NULL),(10,'admin',1,'web','2021-01-14 20:56:10','2021-01-14 20:56:10');

UNLOCK TABLES;

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

LOCK TABLES `sessions` WRITE;

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('3wswVv3QAaxxvaPepnVqg6PMZuls6n4Ldxx0Nzzg',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWNWbFEyZjV6ZjhFRmpXcDNWZHU3aDlrV2VWSWk0S2tiOXByMW5McSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9hemhhY2FyZS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1617405395),('A15EVHFm1uTqcQcbyt6XD4dC7e8m9AIZnRLSQzZf',56,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNWV0MHF0cjF2MGdOanNUNlRXR3U0TmxPNkpWY2JYYWpCa2RvcXVldiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTY7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRGQjJGUlJnR2N4V1Mxc05ra0dvOHZlcGwwd2NlZnZxMy9KamNtMndkQTI4bWYxY3BGWlpjQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9hemhhY2FyZS9wcmlzY3RpcHRpb25wcmludC84NS8zNSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1617406603),('NmpUm7d5nZejfgzgy9K5xBCtjXhlf72uoecxcYZs',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:87.0) Gecko/20100101 Firefox/87.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZkJlNEYxVHZWUTlaTnlpZXN0RGxnMU9vQjdsdHozSUFGTkp2MW5GZCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNToiaHR0cDovL2F6aGFjYXJlL3JvbGVzL2FkZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI1OiJodHRwOi8vYXpoYWNhcmUvcm9sZXMvYWRkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1617400280);

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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0' COMMENT '0  New  1  active 2  blocked  3  deleted ',
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `doctor_id` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

LOCK TABLES `users` WRITE;

insert  into `users`(`id`,`name`,`mobile`,`email`,`email_verified_at`,`password`,`business_id`,`status`,`two_factor_secret`,`two_factor_recovery_codes`,`remember_token`,`current_team_id`,`profile_photo_path`,`doctor_id`,`created_at`,`updated_at`) values (56,'Admin','01024649844','g.ali.telecom@gmail.com',NULL,'$2y$10$FB2FRRgGcxWS1sNkkGo8vepl0wcefvq3/Jjcm2wdA28mf1cpFZZcC',12,NULL,NULL,NULL,'PwvkWR85HGzeUTLB3VL8yFLQho5srGFaFiT7yk928O0V3kms60SNbRMoSmOI',NULL,NULL,0,'2021-03-11 14:40:22','2021-03-11 15:18:48'),(59,'تمريض','01024649800','g.ali.telecom1@gmail.com',NULL,'$2y$10$.ejsGlrgsrxIQ8B0q0IH9u66ZVzxIhdaBoRlcqrDDVO2iN2w0bTdS',12,'0',NULL,NULL,NULL,NULL,NULL,0,'2021-03-11 15:15:43','2021-03-11 15:20:53'),(60,'محمد علي السيد','01024649845','azhasoft@gmail.com',NULL,'$2y$10$7mRww/EiuhbGXbvFHSmf.OlhE4Sni.YSmbNvw75xFfkJRgNtenHBm',12,'0',NULL,NULL,NULL,NULL,NULL,42,'2021-03-11 15:24:08','2021-03-11 15:24:08'),(61,'Mohamed Ali','01024645822','azhasoft@gmail.com',NULL,'$2y$10$/pp1CmGDvfHdVJFTx09wXeSlqcVuKyr04eGUqEt4Rqr68gG5eAjS6',12,'0',NULL,NULL,NULL,NULL,NULL,43,'2021-03-27 07:03:17','2021-03-27 07:03:17'),(62,'حسن السيد عبدالرحمن','010345658944','azhasoft@gmail.com',NULL,'$2y$10$DFTnXFZz1EZV39AJ5/NNQ.2ch6Y4DO3ZTBXaTtA6NbHzh3adLoS86',12,'0',NULL,NULL,NULL,NULL,NULL,44,'2021-03-27 07:31:57','2021-03-27 07:31:57'),(63,'جمال السيد','010545658944','azhasoft@gmail.com',NULL,'$2y$10$L4.hN8NlCE4XQ3byORDcf.pmRUHeH.2QIlF4arNVfNdMwPvTkzSZq',12,'0',NULL,NULL,NULL,NULL,NULL,45,'2021-03-27 07:35:08','2021-03-27 07:35:08'),(64,'محمد علي السيد','010945658944','azhasoft33@gmail.com',NULL,'$2y$10$pxNiw4D3fYMYKEVuZWlh8OEkzY6T7FlnQRTkXGWZgnvzp4OTmz5FS',12,'0',NULL,NULL,NULL,NULL,NULL,46,'2021-03-27 08:36:04','2021-04-02 06:16:08'),(65,'ugd','0123446598989','azhasoft@gmail.com',NULL,'$2y$10$PMqlY6XPcdz5t5NxIpwUdOyEcFcn0hfwMeOqu.H0dqWS9sgrqqc4.',12,'0',NULL,NULL,NULL,NULL,NULL,47,'2021-03-27 08:49:55','2021-03-27 08:49:55');

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