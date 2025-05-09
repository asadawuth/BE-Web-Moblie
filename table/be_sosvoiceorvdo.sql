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
-- Table structure for table `sosvoiceorvdo`
--

DROP TABLE IF EXISTS `sosvoiceorvdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sosvoiceorvdo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `file` text COLLATE utf8mb4_unicode_ci,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `userId` int DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longtitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sosvoiceorvdo_userId_fkey` (`userId`),
  CONSTRAINT `sosvoiceorvdo_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sosvoiceorvdo`
--

LOCK TABLES `sosvoiceorvdo` WRITE;
/*!40000 ALTER TABLE `sosvoiceorvdo` DISABLE KEYS */;
INSERT INTO `sosvoiceorvdo` VALUES (1,'http://localhost:8888/public/1741916469010.wav','2024-11-15 16:16:59.999',48,'13.650362','100.675973','จัดการเร็จสิ้น','2025-03-14 02:15:28.867'),(2,'http://localhost:8888/public/1742971536598.wav','2024-11-15 17:16:59.999',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:35.470'),(3,'http://localhost:8888/public/1742971550653.wav','2024-12-15 17:16:59.999',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:41.924'),(4,'http://localhost:8888/public/1742971549745.wav','2024-12-15 17:16:59.999',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:43.032'),(5,'http://localhost:8888/public/1742971548433.wav','2025-01-31 23:59:59.999',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:43.894'),(6,'http://localhost:8888/public/1742971546833.wav','2025-02-14 01:30:30.999',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:44.762'),(7,'http://localhost:8888/public/1742971545922.wav','2025-01-01 23:59:59.999',38,'13.650362','100.675973','จัดการเร็จสิ้น','2025-05-01 07:30:04.756'),(8,'http://localhost:8888/public/1742971551069.wav','2025-03-26 06:45:46.260',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:46.260'),(9,'http://localhost:8888/public/1742971557063.wav','2024-12-31 23:59:59.999',38,'13.650362','100.675973','แจ้ง','2025-03-26 06:45:47.075'),(10,'http://localhost:8888/public/1744186295874.wav','2025-04-09 08:11:35.479',48,'13.650362','100.675973','แจ้ง','2025-04-09 08:11:35.479'),(11,'http://localhost:8888/public/1744186340379.wav','2025-04-09 08:12:11.523',48,'13.650362','100.675973','แจ้ง','2025-04-09 08:12:11.523'),(12,'http://localhost:8888/public/1744187574088.wav','2025-04-09 08:32:52.561',48,'13.650362','100.675973','แจ้ง','2025-04-09 08:32:52.561');
/*!40000 ALTER TABLE `sosvoiceorvdo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02 13:33:23
