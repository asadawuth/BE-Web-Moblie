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
-- Table structure for table `commentinpostuserreport`
--

DROP TABLE IF EXISTS `commentinpostuserreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentinpostuserreport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vdo` text COLLATE utf8mb4_unicode_ci,
  `userId` int NOT NULL,
  `reportId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commentinpostuserreport_userId_fkey` (`userId`),
  KEY `commentinpostuserreport_reportId_fkey` (`reportId`),
  CONSTRAINT `commentinpostuserreport_reportId_fkey` FOREIGN KEY (`reportId`) REFERENCES `postuserreport` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `commentinpostuserreport_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentinpostuserreport`
--

LOCK TABLES `commentinpostuserreport` WRITE;
/*!40000 ALTER TABLE `commentinpostuserreport` DISABLE KEYS */;
INSERT INTO `commentinpostuserreport` VALUES (1,'ตอบกลับประชาชน',NULL,'2025-04-22 02:39:34.282','ยกเลิก',NULL,1,10),(2,'2',NULL,'2025-05-02 01:33:08.496','รับแจ้งแล้ว',NULL,1,10),(3,'1',NULL,'2025-05-02 01:33:28.392','แจ้ง',NULL,1,9),(4,'1',NULL,'2025-05-02 01:41:26.176','แจ้ง',NULL,1,6),(5,'1',NULL,'2025-05-02 01:54:59.661','แจ้ง',NULL,1,5),(6,'1',NULL,'2025-05-02 02:05:38.520','จัดการเสร็จสิ้น',NULL,1,3),(7,'2',NULL,'2025-05-02 02:51:13.245','แจ้ง',NULL,1,5);
/*!40000 ALTER TABLE `commentinpostuserreport` ENABLE KEYS */;
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
