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
-- Table structure for table `postuserreport`
--

DROP TABLE IF EXISTS `postuserreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postuserreport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texttitle` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `textstory` text COLLATE utf8mb4_unicode_ci,
  `map` text COLLATE utf8mb4_unicode_ci,
  `vdo` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `userId` int NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `postuserreport_userId_fkey` (`userId`),
  CONSTRAINT `postuserreport_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postuserreport`
--

LOCK TABLES `postuserreport` WRITE;
/*!40000 ALTER TABLE `postuserreport` DISABLE KEYS */;
INSERT INTO `postuserreport` VALUES (1,'dwdwdwdw','http://localhost:8888/public/1741767950592.png','11111111111111','ยังไม่มี',NULL,'แจ้ง','2025-01-01 15:59:59.999',6,'2025-05-02 02:04:59.063'),(2,'เนื้อหา','http://localhost:8888/public/1742883464088.jpg','หัวข้อร้องเรียน 1 ',NULL,NULL,'รับแจ้งแล้ว','2024-11-02 11:30:59.999',38,'2025-05-02 01:07:07.320'),(3,'เนื้อหา','http://localhost:8888/public/1742884503887.jpg','หัวข้อร้องเรียน 2',NULL,NULL,'แจ้ง','2024-12-31 23:59:59.999',38,'2025-05-02 02:50:56.634'),(4,'เนื้อหา','http://localhost:8888/public/1742884510010.jpg','หัวข้อร้องเรียน 3',NULL,NULL,'จัดการเสร็จสิ้น','2024-12-31 23:59:59.999',38,'2025-05-02 02:41:04.916'),(5,'เนื้อหา','http://localhost:8888/public/1742884547813.jpg','หัวข้อร้องเรียน 4',NULL,NULL,'รับแจ้งแล้ว','2025-01-01 23:59:59.999',38,'2025-05-02 03:13:33.445'),(6,'เนื้อหา','http://localhost:8888/public/1742884720777.jpg','หัวข้อร้องเรียน 5',NULL,NULL,'รับแจ้งแล้ว','2025-02-02 17:59:59.999',38,'2025-05-02 01:42:08.440'),(7,'เนื้อหา','http://localhost:8888/public/1742884812675.webp','หัวข้อร้องเรียน 6',NULL,NULL,'แจ้ง','2025-03-02 13:59:59.000',38,'2025-03-25 06:40:04.488'),(8,'เนื้อหา','http://localhost:8888/public/1742884835194.jpg','หัวข้อร้องเรียน 7',NULL,NULL,'แจ้ง','2025-03-03 12:12:12.000',38,'2025-03-25 06:40:29.013'),(9,'เนื้อหา','http://localhost:8888/public/1742884940744.jpg','หัวข้อร้องเรียน 8',NULL,NULL,'แจ้ง','2025-03-19 09:59:59.999',38,'2025-03-25 06:42:12.695'),(10,'เนื้อหา','http://localhost:8888/public/1742885187491.jpg','หัวข้อร้องเรียน 10',NULL,NULL,'รับแจ้งแล้ว','2025-03-19 09:59:59.999',38,'2025-04-22 02:48:15.913');
/*!40000 ALTER TABLE `postuserreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02 13:33:22
