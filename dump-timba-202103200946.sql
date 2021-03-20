-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: timba
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idaccessories_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES (1,'Bags and backpacks','2021-03-17 07:36:22','2021-03-17 07:36:22'),(2,'Belts','2021-03-17 07:36:22','2021-03-17 07:36:22'),(3,'Socks','2021-03-17 07:36:22','2021-03-17 07:36:22'),(4,'Hats and scarves','2021-03-17 07:36:22','2021-03-17 07:36:22'),(5,'Wallets','2021-03-17 07:36:22','2021-03-17 07:36:22'),(6,'Shoe accessories','2021-03-17 07:36:22','2021-03-17 07:36:22'),(7,'Gift cards','2021-03-17 07:36:22','2021-03-17 07:36:22');
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `total_price` decimal(11,2) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcart_UNIQUE` (`id`),
  KEY `fk_cart_users_idx` (`user_id`),
  KEY `fk_cart_product_idx` (`product_id`),
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,4,2,10,9000.00,18000.00,'2021-03-19 13:02:04','2021-03-19 13:02:04'),(2,5,1,1,NULL,12899.99,12899.99,'2021-03-19 13:02:04','2021-03-19 13:02:04'),(3,4,2,1,5,23200.00,23200.00,'2021-03-19 13:02:04','2021-03-19 13:02:04'),(4,4,5,1,NULL,13000.00,13000.00,'2021-03-19 13:02:04','2021-03-19 13:02:04');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothes_type`
--

DROP TABLE IF EXISTS `clothes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clothes_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  `prod_type_id` int NOT NULL,
  `prod_cat_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_clothes_type_prod_type` (`prod_type_id`),
  KEY `fk_clothes_type_prod_cat` (`prod_cat_id`),
  CONSTRAINT `fk_clothes_type_prod_cat` FOREIGN KEY (`prod_cat_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_clothes_type_prod_type` FOREIGN KEY (`prod_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothes_type`
--

LOCK TABLES `clothes_type` WRITE;
/*!40000 ALTER TABLE `clothes_type` DISABLE KEYS */;
INSERT INTO `clothes_type` VALUES (1,'outerwear',1,2,'2021-03-17 22:42:06','2021-03-17 22:42:06'),(2,'sweaters and hoodies',1,2,'2021-03-17 22:42:06','2021-03-17 22:42:06'),(3,'shirts',1,2,'2021-03-17 22:42:06','2021-03-17 22:42:06'),(4,'t-shirts and polos',1,2,'2021-03-17 22:42:06','2021-03-17 22:42:06');
/*!40000 ALTER TABLE `clothes_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `colors` varchar(25) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idcolor_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Brown','2021-03-14 19:40:19'),(2,'Creamy','2021-03-14 19:40:19'),(3,'green ','2021-03-14 19:40:19'),(4,'Grey','2021-03-14 19:40:19'),(5,'red','2021-03-14 19:40:19'),(6,'blue','2021-03-14 19:40:19'),(7,'blac','2021-03-14 19:40:19'),(8,'Purple','2021-03-14 19:40:19'),(9,'Sand','2021-03-14 19:40:19'),(10,'wрite','2021-03-14 19:40:19');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faforite`
--

DROP TABLE IF EXISTS `faforite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faforite` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_faforite_users_idx` (`user_id`),
  KEY `fk_faforite_product_idx` (`product_id`),
  CONSTRAINT `fk_faforite_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_faforite_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faforite`
--

LOCK TABLES `faforite` WRITE;
/*!40000 ALTER TABLE `faforite` DISABLE KEYS */;
INSERT INTO `faforite` VALUES (1,3,NULL,'2021-03-19 12:43:54','2021-03-19 12:43:54'),(2,6,3,'2021-03-19 12:44:19','2021-03-19 12:44:19'),(3,1,5,'2021-03-19 12:44:19','2021-03-19 12:44:19'),(4,4,2,'2021-03-19 12:44:19','2021-03-19 12:44:19'),(5,3,NULL,'2021-03-19 12:44:19','2021-03-19 12:44:19');
/*!40000 ALTER TABLE `faforite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,'waterproof','2021-03-16 21:49:55','2021-03-16 21:49:55'),(2,'technological filler','2021-03-16 21:49:55','2021-03-16 21:49:55');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `for_whom`
--

DROP TABLE IF EXISTS `for_whom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `for_whom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idfor_whom_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `for_whom`
--

LOCK TABLES `for_whom` WRITE;
/*!40000 ALTER TABLE `for_whom` DISABLE KEYS */;
INSERT INTO `for_whom` VALUES (1,'children','2021-03-16 17:02:30','2021-03-16 17:02:30'),(2,'male','2021-03-16 17:02:45','2021-03-16 17:02:45'),(3,'female','2021-03-16 17:02:48','2021-03-16 17:02:48');
/*!40000 ALTER TABLE `for_whom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heat`
--

DROP TABLE IF EXISTS `heat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `heat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_heat` varchar(20) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heat`
--

LOCK TABLES `heat` WRITE;
/*!40000 ALTER TABLE `heat` DISABLE KEYS */;
INSERT INTO `heat` VALUES (1,'warmer','2021-03-16 21:44:55','2021-03-16 21:44:55'),(2,'very warm','2021-03-16 21:44:58','2021-03-16 21:44:58');
/*!40000 ALTER TABLE `heat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `size` int NOT NULL,
  `metadata` longtext COLLATE utf8_bin NOT NULL,
  `media_type_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_media_media_type_idx` (`media_type_id`),
  CONSTRAINT `fk_media_media_type` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'jacket',1681257,'https://timberland.ru/upload/iblock/30e/5f61ced69e152.jpg',2,'2021-03-17 22:28:04','2021-03-17 22:28:04'),(2,'jacket',723254,'https://timberland.ru/upload/iblock/7ad/5f6499ea19bb4.jpg',2,'2021-03-17 22:28:04','2021-03-17 22:28:04'),(3,'sweater',245213,'https://timberland.ru/upload/iblock/050/601d01c1f3629.jpg',2,'2021-03-17 22:28:04','2021-03-17 22:28:04'),(4,'shirt',512367,'https://timberland.ru/upload/iblock/27e/602635132b5e9_first_photo.jpg',2,'2021-03-17 22:28:04','2021-03-17 22:28:04'),(5,'sneakers',1238795,'https://timberland.ru/upload/iblock/17e/5d97536a25824.jpg',2,'2021-03-17 22:28:04','2021-03-17 22:28:04');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_type_med` enum('images','video') COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
INSERT INTO `media_type` VALUES (1,'video','2021-03-16 21:29:18','2021-03-16 21:29:18'),(2,'images','2021-03-16 21:30:19','2021-03-16 21:30:19');
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pro_cat_id` int NOT NULL,
  `pro_type_id` int NOT NULL,
  `color_id` int NOT NULL,
  `features_id` int NOT NULL,
  `heat_id` int NOT NULL,
  `season_id` int NOT NULL,
  `size_id` int NOT NULL,
  `technology_id` int NOT NULL,
  `media_id` int NOT NULL,
  `discount` float unsigned DEFAULT NULL,
  `price` decimal(11,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idproduct_UNIQUE` (`id`),
  KEY `fk_product_pro_cat_idx` (`pro_cat_id`),
  KEY `fk_product_pro_type_idx` (`pro_type_id`),
  KEY `fk_product_color_idx` (`color_id`),
  KEY `fk_product_features_idx` (`features_id`),
  KEY `fk_product_heat_idx` (`heat_id`),
  KEY `fk_product_season_idx` (`season_id`),
  KEY `fk_product_size_idx` (`size_id`),
  KEY `fk_product_technology_idx` (`technology_id`),
  KEY `fk_product_media_idx` (`media_id`),
  CONSTRAINT `fk_product_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_features` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_heat` FOREIGN KEY (`heat_id`) REFERENCES `heat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_media` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_pro_cat` FOREIGN KEY (`pro_cat_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_pro_type` FOREIGN KEY (`pro_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_season` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_size` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_technology` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,3,2,3,1,1,2,4,4,5,NULL,12899.99,'2021-03-19 12:30:03','2021-03-19 12:30:03'),(2,2,1,2,2,2,1,4,1,1,5,24000.00,'2021-03-19 12:30:03','2021-03-19 12:30:03'),(3,3,2,7,1,1,2,4,4,5,NULL,14999.99,'2021-03-19 12:30:03','2021-03-19 12:30:03'),(4,2,1,9,2,2,1,5,2,3,NULL,10000.00,'2021-03-19 12:30:03','2021-03-19 12:30:03'),(5,1,2,1,2,1,3,5,5,5,10,13000.00,'2021-03-19 12:30:03','2021-03-19 12:30:03'),(6,1,2,2,1,1,4,2,2,5,NULL,9000.00,'2021-03-19 12:30:03','2021-03-19 12:30:03');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idproduct_category_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,'boots','2021-03-16 21:40:37','2021-03-16 21:40:37'),(2,'jacket','2021-03-16 21:40:40','2021-03-16 21:40:40'),(3,'low shoes','2021-03-16 21:40:44','2021-03-16 21:40:44');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES (1,'clothes','2021-03-16 16:52:04','2021-03-16 16:52:04'),(2,'shoes','2021-03-16 16:53:13','2021-03-16 16:53:13');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('M','F') COLLATE utf8_bin NOT NULL,
  `birthday` date NOT NULL,
  `country` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'M','1979-08-21','russia','kazan','lenina-42','2021-03-17 23:08:51','2021-03-17 23:08:51'),(2,'M','1984-03-14','denmark','kopenhagen',NULL,'2021-03-17 23:08:51','2021-03-17 23:08:51'),(3,'M','2002-01-23',NULL,NULL,NULL,'2021-03-17 23:08:51','2021-03-17 23:08:51'),(4,'M','1995-04-17','israel','holon','vaycman-68','2021-03-17 23:08:51','2021-03-17 23:08:51'),(5,'M','1998-05-10','israel',NULL,NULL,'2021-03-17 23:08:51','2021-03-17 23:08:51'),(6,'F','1989-06-22','denmark','odense','nyborgvej-12','2021-03-17 23:08:51','2021-03-17 23:08:51');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` enum('winter','autumn','spring','summer') COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idseason_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'winter','2021-03-16 17:40:00'),(2,'autumn','2021-03-16 17:40:00'),(3,'spring','2021-03-16 17:40:00'),(4,'summer','2021-03-16 17:40:00');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoes_type`
--

DROP TABLE IF EXISTS `shoes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoes_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `prod_type_id` int NOT NULL,
  `cat_type_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_shoes_type_prod_type` (`prod_type_id`),
  KEY `fk_shoes_type_prod_cat` (`cat_type_id`),
  CONSTRAINT `fk_shoes_type_prod_cat` FOREIGN KEY (`cat_type_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shoes_type_prod_type` FOREIGN KEY (`prod_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes_type`
--

LOCK TABLES `shoes_type` WRITE;
/*!40000 ALTER TABLE `shoes_type` DISABLE KEYS */;
INSERT INTO `shoes_type` VALUES (1,'boots',2,1,'2021-03-17 22:06:06','2021-03-17 22:06:06'),(2,'low shoes',2,3,'2021-03-17 22:06:06','2021-03-17 22:06:06'),(3,'sneakers',2,3,'2021-03-17 22:06:06','2021-03-17 22:06:06'),(4,'moccasins',2,3,'2021-03-17 22:06:06','2021-03-17 22:06:06'),(5,'sandals',2,3,'2021-03-17 22:06:06','2021-03-17 22:06:06');
/*!40000 ALTER TABLE `shoes_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(15) COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idsize_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'s','2021-03-16 17:06:12'),(2,'m','2021-03-16 17:06:12'),(3,'l','2021-03-16 17:06:12'),(4,'xl','2021-03-16 17:06:12'),(5,'xxl','2021-03-16 17:06:12'),(6,'3xl','2021-03-16 17:06:12');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_techno` varchar(125) COLLATE utf8_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `fk_technology_technology_type` FOREIGN KEY (`id`) REFERENCES `technology_type` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'heat','2021-03-16 20:07:34','2021-03-16 20:07:34'),(2,'dry','2021-03-16 20:07:34','2021-03-16 20:07:34'),(3,'breathability','2021-03-16 20:07:34','2021-03-16 20:07:34'),(4,'comfort','2021-03-16 20:07:34','2021-03-16 20:07:34'),(5,'environmental care','2021-03-16 20:07:34','2021-03-16 20:07:34');
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_type`
--

DROP TABLE IF EXISTS `technology_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `technology_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_technology_type_technology_idx` (`technology_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_type`
--

LOCK TABLES `technology_type` WRITE;
/*!40000 ALTER TABLE `technology_type` DISABLE KEYS */;
INSERT INTO `technology_type` VALUES (1,'primaloft_eco',1,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(2,'dryvent_waterproof_technology',2,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(3,'timberland_waterproof',2,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(4,'gore-tax',2,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(5,'timberdry',2,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(6,'comfortemp',3,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(7,'aerecore_energy_system',4,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(8,'anti-fatigue',4,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(9,'ortholite',4,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(10,'sensorflex',4,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(11,'timbergrip',5,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(12,'greenstride',6,'2021-03-16 20:36:02','2021-03-16 20:36:02'),(13,'rebolt',6,'2021-03-16 20:36:02','2021-03-16 20:36:02');
/*!40000 ALTER TABLE `technology_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `phone` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Genadiy','Muhich','bhf56874268','muhich@mail.ru','72546982138','2021-03-16 07:27:32','2021-03-16 17:47:48'),(2,'Artiom','Pupkin','bdth454df','pupkin@gmail.com','+45623897525','2021-03-16 17:56:28','2021-03-16 17:56:28'),(3,'David','Lagrisa','4521451hkie4','lagri@gmail.com','+972589378169','2021-03-16 17:56:28','2021-03-16 17:56:28'),(4,'Tom','Feldman','qrd5484gtyu25','tomfeldman@gmail.com','+972521875837','2021-03-16 17:56:28','2021-03-16 17:56:28'),(5,'Amnon','Talgauker','an54785412','talg@gmail.com','+972506893418','2021-03-16 17:56:28','2021-03-16 17:56:28'),(6,'Tina','Boyd','fhgj4523897','boydti@mail.ru','+4525879614','2021-03-16 18:02:25','2021-03-16 18:02:25');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `users_AFTER_INSERT` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT INTO profiles VALUES ('NEW.user_id');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'timba'
--

--
-- Dumping routines for database 'timba'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-20  9:46:29
