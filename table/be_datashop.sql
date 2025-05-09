-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: be
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datashop`
--

DROP TABLE IF EXISTS `datashop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datashop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longtitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datashop_userId_fkey` (`userId`),
  CONSTRAINT `datashop_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datashop`
--

LOCK TABLES `datashop` WRITE;
/*!40000 ALTER TABLE `datashop` DISABLE KEYS */;
INSERT INTO `datashop` VALUES (1,'2025-01-31 23:59:59.999','14/2/68','ทดสอบหัวข้อ','0859300756','http://localhost:8888/public/1741858747157.jpg','สถานที่','ทดสอบข้อความ ','สำเร็จ','13.650362','100.675973',48),(2,'2024-11-02 11:30:59.999','14/2/68','ทดสอบหัวข้อ','0859300756','http://localhost:8888/public/1741914737244.jpg','ร้านค้า','ทดสอบข้อความ ','กำลังเช็คเอกสาร','13.650362','100.675973',48),(3,'2024-12-31 23:59:59.999','14/2/68','ทดสอบหัวข้อ','0859300756','http://localhost:8888/public/1742888104902.webp','ร้านค้า','ทดสอบข้อความ ','สำเร็จ','11.11','11.11',38),(4,'2025-01-01 23:59:59.999','14/2/68','ทดสอบหัวข้อ','0000000000','http://localhost:8888/public/1742888504976.jpg','ร้านอาหาร','ทดสอบข้อความ ','สำเร็จ','11.11','11.11',38),(5,'2024-10-16 12:59:59.999','14/2/68','ทดสอบหัวข้อ','1111111111','http://localhost:8888/public/1742888533685.jpg','ร้านอาหาร','ทดสอบข้อความ ','ส่งเรื่องแล้ว','11.11','11.11',38),(6,'2025-03-19 09:59:59.999','14/2/68','ทดสอบหัวข้อ','1361368521','http://localhost:8888/public/1742888576491.jpg','สถานที่','ทดสอบข้อความ ','ส่งเรื่องแล้ว','11.11','11.11',38),(7,'2025-03-25 07:46:16.145','กไกไกไกไ','ทดสอบหัวข้อ','1361368521','http://localhost:8888/public/1742888781583.jpg','สถานที่ ','ทดสอบข้อความ ','ส่งเรื่องแล้ว','11.11','11.11',38),(8,'2025-03-25 07:51:47.318','ขายยย','ทดสอบหัวข้อ','1361368521','http://localhost:8888/public/1742889116452.jpg','ร้านค้า','ทดสอบข้อความ ','สำเร็จ','11.11','11.11',38);
/*!40000 ALTER TABLE `datashop` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02 13:33:24
