-- MariaDB dump 10.19  Distrib 10.10.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB-1:10.10.2+maria~ubu2204

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `idx-auth_assignment-user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES
('ADMIN','1',1681121129),
('PELANGGAN','6',1681184782),
('PELANGGAN','7',1681184991);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES
('/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/assignment/*',2,NULL,NULL,NULL,1681098221,1681098221),
('/admin/assignment/assign',2,NULL,NULL,NULL,1681098221,1681098221),
('/admin/assignment/index',2,NULL,NULL,NULL,1681098221,1681098221),
('/admin/assignment/revoke',2,NULL,NULL,NULL,1681098221,1681098221),
('/admin/assignment/view',2,NULL,NULL,NULL,1681098221,1681098221),
('/admin/default/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/default/index',2,NULL,NULL,NULL,1681098221,1681098221),
('/admin/menu/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/menu/create',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/menu/delete',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/menu/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/menu/update',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/menu/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/assign',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/create',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/delete',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/get-users',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/remove',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/update',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/permission/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/assign',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/create',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/delete',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/get-users',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/remove',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/update',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/role/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/route/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/route/assign',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/route/create',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/route/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/route/refresh',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/route/remove',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/rule/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/rule/create',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/rule/delete',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/rule/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/rule/update',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/rule/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/activate',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/change-password',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/delete',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/login',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/logout',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/request-password-reset',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/reset-password',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/signup',2,NULL,NULL,NULL,1681098222,1681098222),
('/admin/user/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/buku/*',2,NULL,NULL,NULL,1681126581,1681126581),
('/buku/create',2,NULL,NULL,NULL,1681126581,1681126581),
('/buku/delete',2,NULL,NULL,NULL,1681126581,1681126581),
('/buku/index',2,NULL,NULL,NULL,1681126581,1681126581),
('/buku/update',2,NULL,NULL,NULL,1681126581,1681126581),
('/buku/view',2,NULL,NULL,NULL,1681126581,1681126581),
('/debug/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/default/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/default/db-explain',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/default/download-mail',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/default/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/default/toolbar',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/default/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/user/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/user/reset-identity',2,NULL,NULL,NULL,1681098222,1681098222),
('/debug/user/set-identity',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/default/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/default/action',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/default/diff',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/default/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/default/preview',2,NULL,NULL,NULL,1681098222,1681098222),
('/gii/default/view',2,NULL,NULL,NULL,1681098222,1681098222),
('/kategori-buku/*',2,NULL,NULL,NULL,1681120499,1681120499),
('/kategori-buku/create',2,NULL,NULL,NULL,1681120499,1681120499),
('/kategori-buku/delete',2,NULL,NULL,NULL,1681120499,1681120499),
('/kategori-buku/index',2,NULL,NULL,NULL,1681120499,1681120499),
('/kategori-buku/update',2,NULL,NULL,NULL,1681120499,1681120499),
('/kategori-buku/view',2,NULL,NULL,NULL,1681120499,1681120499),
('/order/*',2,NULL,NULL,NULL,1681126581,1681126581),
('/order/create',2,NULL,NULL,NULL,1681126581,1681126581),
('/order/delete',2,NULL,NULL,NULL,1681126581,1681126581),
('/order/index',2,NULL,NULL,NULL,1681126581,1681126581),
('/order/update',2,NULL,NULL,NULL,1681126581,1681126581),
('/order/view',2,NULL,NULL,NULL,1681126581,1681126581),
('/site/*',2,NULL,NULL,NULL,1681098222,1681098222),
('/site/about',2,NULL,NULL,NULL,1681098222,1681098222),
('/site/captcha',2,NULL,NULL,NULL,1681120499,1681120499),
('/site/contact',2,NULL,NULL,NULL,1681120499,1681120499),
('/site/dashboard',2,NULL,NULL,NULL,1681120499,1681120499),
('/site/error',2,NULL,NULL,NULL,1681098222,1681098222),
('/site/index',2,NULL,NULL,NULL,1681098222,1681098222),
('/user/*',2,NULL,NULL,NULL,1681120499,1681120499),
('/user/change-password',2,NULL,NULL,NULL,1681120499,1681120499),
('/user/login',2,NULL,NULL,NULL,1681120499,1681120499),
('/user/logout',2,NULL,NULL,NULL,1681120499,1681120499),
('/user/request-password-reset',2,NULL,NULL,NULL,1681120499,1681120499),
('/user/reset-password',2,NULL,NULL,NULL,1681120499,1681120499),
('/user/signup',2,NULL,NULL,NULL,1681120499,1681120499),
('ADMIN',1,'Administrator',NULL,NULL,1681110018,1681120414),
('admin area',2,NULL,NULL,NULL,1681120694,1681120918),
('basic user',2,'All of basic user authenticated actions',NULL,NULL,1681120541,1681120541),
('master data',2,NULL,NULL,NULL,1681120860,1681120860),
('order manage',2,NULL,NULL,NULL,1681126755,1681126755),
('PELANGGAN',1,'Pelanggan',NULL,NULL,1681110037,1681110037);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES
('ADMIN','admin area'),
('ADMIN','basic user'),
('ADMIN','master data'),
('ADMIN','order manage'),
('admin area','/admin/assignment/*'),
('admin area','/admin/assignment/assign'),
('admin area','/admin/assignment/index'),
('admin area','/admin/assignment/revoke'),
('admin area','/admin/assignment/view'),
('admin area','/admin/default/*'),
('admin area','/admin/default/index'),
('admin area','/admin/menu/*'),
('admin area','/admin/menu/create'),
('admin area','/admin/menu/delete'),
('admin area','/admin/menu/index'),
('admin area','/admin/menu/update'),
('admin area','/admin/menu/view'),
('admin area','/admin/permission/*'),
('admin area','/admin/permission/assign'),
('admin area','/admin/permission/create'),
('admin area','/admin/permission/delete'),
('admin area','/admin/permission/get-users'),
('admin area','/admin/permission/index'),
('admin area','/admin/permission/remove'),
('admin area','/admin/permission/update'),
('admin area','/admin/permission/view'),
('admin area','/admin/role/*'),
('admin area','/admin/role/assign'),
('admin area','/admin/role/create'),
('admin area','/admin/role/delete'),
('admin area','/admin/role/get-users'),
('admin area','/admin/role/index'),
('admin area','/admin/role/remove'),
('admin area','/admin/role/update'),
('admin area','/admin/role/view'),
('admin area','/admin/route/*'),
('admin area','/admin/route/assign'),
('admin area','/admin/route/create'),
('admin area','/admin/route/index'),
('admin area','/admin/route/refresh'),
('admin area','/admin/route/remove'),
('admin area','/admin/rule/*'),
('admin area','/admin/rule/create'),
('admin area','/admin/rule/delete'),
('admin area','/admin/rule/index'),
('admin area','/admin/rule/update'),
('admin area','/admin/rule/view'),
('admin area','/admin/user/*'),
('admin area','/admin/user/activate'),
('admin area','/admin/user/change-password'),
('admin area','/admin/user/delete'),
('admin area','/admin/user/index'),
('admin area','/admin/user/view'),
('admin area','/site/dashboard'),
('basic user','/user/change-password'),
('basic user','/user/logout'),
('master data','/buku/*'),
('master data','/kategori-buku/*'),
('order manage','/order/*'),
('PELANGGAN','basic user');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `harga` double NOT NULL,
  `stok` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `abstrak` text DEFAULT 'NULL',
  PRIMARY KEY (`id`),
  KEY `buku_kategori_id_fkey` (`kategori_id`),
  CONSTRAINT `buku_kategori_id_fkey` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES
(4,'Harry Potter and the Philosopher\'s Stone','J.K. Rowling','Bloomsbury Publishing',1997,100000,10,1,'s2pi7xdk77SLsVsQLyTQArkQy94QQ9ZE.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis dolorem exercitationem praesentium. Odio illo, dicta saepe sint expedita quis. Doloremque itaque placeat ipsum quis nam, amet iure at quaerat saepe! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis optio adipisci ad dicta minima sunt quisquam neque quis voluptate repellat, esse iure facere eaque vero quibusdam dolore! Provident, maiores architecto!'),
(5,'Ruang Sunyi','Cahaya Dewi','ABC',2020,150000,50,1,'eAjx_U17T2ZJs_PmzZCzdFahv3ltMYhY.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?'),
(6,'Menanti Restu Langit','Makhasin','XYZ',2019,78000,50,2,'T7AD_s7GKIrjiVILNkiNpyaLH8RjqDKo.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?'),
(8,'Teluk Alaska','Eka Aryani','Erlangga',2020,55000,90,2,'MlCcjLMTciztpjk7XEWX_J5tVEtCbQxH.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?'),
(9,'Harry Potter and the Sorcerer Stone','J.K. Rowling','Bloomsbury Publishing',1998,130000,30,1,'x0OZpFURR_V6KeViKNR0xHlTUgllOq1F.jpg','Lorem ipsum dolor sit amet consectetur adipisicing elit. Nobis dolorem exercitationem praesentium. Odio illo, dicta saepe sint expedita quis. Doloremque itaque placeat ipsum quis nam, amet iure at quaerat saepe! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis optio adipisci ad dicta minima sunt quisquam neque quis voluptate repellat, esse iure facere eaque vero quibusdam dolore! Provident, maiores architecto!');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelanggan_id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `checkout` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `cart_pelanggan_id_fkey` (`pelanggan_id`),
  CONSTRAINT `cart_pelanggan_id_fkey` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_detail_cart_id_fkey` (`cart_id`),
  KEY `cart_detail_buku_id_fkey` (`buku_id`),
  CONSTRAINT `cart_detail_buku_id_fkey` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cart_detail_cart_id_fkey` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_buku`
--

DROP TABLE IF EXISTS `kategori_buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori_buku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_buku`
--

LOCK TABLES `kategori_buku` WRITE;
/*!40000 ALTER TABLE `kategori_buku` DISABLE KEYS */;
INSERT INTO `kategori_buku` VALUES
(1,'Fiksi'),
(2,'Non-Fiksi'),
(3,'Sejarah'),
(4,'Teknologi'),
(5,'Sains');
/*!40000 ALTER TABLE `kategori_buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES
('m000000_000000_base',1681089630),
('m140506_102106_rbac_init',1681089674),
('m140602_111327_create_menu_table',1681089695),
('m160312_050000_create_user',1681089695),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id',1681089674),
('m180523_151638_rbac_updates_indexes_without_prefix',1681089674),
('m200409_110543_rbac_update_mssql_trigger',1681089674);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelanggan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL DEFAULT current_timestamp(),
  `total_harga` double NOT NULL DEFAULT 0,
  `status_order` enum('unpaid','paid','shipped') NOT NULL DEFAULT 'unpaid',
  PRIMARY KEY (`id`),
  KEY `order_pelanggan_id_fkey` (`pelanggan_id`),
  CONSTRAINT `order_pelanggan_id_fkey` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `buku_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_detail_order_id_fkey` (`order_id`),
  KEY `order_detail_buku_id_fkey` (`buku_id`),
  CONSTRAINT `order_detail_buku_id_fkey` FOREIGN KEY (`buku_id`) REFERENCES `buku` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `order_detail_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `alamat` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelanggan_user_id_fkey` (`user_id`),
  CONSTRAINT `pelanggan_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES
(3,'Edo Riansyah',NULL,6),
(4,'Nasrul',NULL,7);
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `waktu_bayar` datetime NOT NULL DEFAULT current_timestamp(),
  `bukti` varchar(100) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `pembayaran_order_id_fkey` (`order_id`),
  CONSTRAINT `pembayaran_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'admin','QGaUPjyfjWb_nRWJKSXBeU5pWxR-mtT6','$2y$13$w6xwrGRof5xPtLOwjBcQyuDdrJnQ4OvWaBgPn5aNz9Zl6cuSACt1.',NULL,'admin@example.com',10,1681098397,1681098397),
(6,'edoriansyah','e9n95jmDZJEgguLvoTgyWwCNkntjAeu3','$2y$13$3ao6KnOXGTd9PGNmZf8Jd.8ZynSJUfxZ0xfLGvbFJMAM29/4EU5Da',NULL,'edo@example.com',10,1681184782,1681184782),
(7,'nasrul','1Ni2jI3z3MoL2sd3SXnd2HAwVR4u1DDC','$2y$13$y8iVzQXE/cz7JC8hozcZcu4vigbu8lGQVBGL0jrwTe5yq3KpwWOnC',NULL,'nasrul@example.com',10,1681184991,1681184991);
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

-- Dump completed on 2023-04-11  9:13:10
