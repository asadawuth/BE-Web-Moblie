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
-- Table structure for table `integratedinformation`
--

DROP TABLE IF EXISTS `integratedinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integratedinformation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `male` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `female` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `household` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `store` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `restaurant` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `place` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `accommodation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `userId` int DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `integratedinformation_userId_fkey` (`userId`),
  CONSTRAINT `integratedinformation_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integratedinformation`
--

LOCK TABLES `integratedinformation` WRITE;
/*!40000 ALTER TABLE `integratedinformation` DISABLE KEYS */;
INSERT INTO `integratedinformation` VALUES (27,'1','1','1','1','1','1','1',1,'2025-04-09 04:41:49'),(28,'10','1','1','1','1','1','1',1,'2025-04-09 04:44:26'),(29,'10','10','1','1','1','1','1',1,'2025-04-25 07:04:24'),(30,'0','0','0','0','0','0','1',1,'2025-04-25 09:34:11'),(31,'0','0','0','0','0','0','0',1,'2025-04-25 09:34:17'),(32,'10','10','10','10','10','10','10',1,'2025-04-25 09:36:10'),(33,'10','10','0','10','10','10','10',1,'2025-04-25 09:37:56');
/*!40000 ALTER TABLE `integratedinformation` ENABLE KEYS */;
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
