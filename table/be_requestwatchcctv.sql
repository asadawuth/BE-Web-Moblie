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
-- Table structure for table `requestwatchcctv`
--

DROP TABLE IF EXISTS `requestwatchcctv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestwatchcctv` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationalId` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numDocument` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `point` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int DEFAULT NULL,
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requestwatchcctv_userId_fkey` (`userId`),
  CONSTRAINT `requestwatchcctv_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestwatchcctv`
--

LOCK TABLES `requestwatchcctv` WRITE;
/*!40000 ALTER TABLE `requestwatchcctv` DISABLE KEYS */;
INSERT INTO `requestwatchcctv` VALUES (12,'test1','test1','1111111111','1111111111111','11/111','2025-03-27 08:55:48.093','จุดที่1 ตัวที่ 111','ยื่นเอกสาร',NULL,'http://localhost:8888/public/1743065751192.webp',38,'2025-03-27 08:55:48.093'),(13,'test2','test2','2222222222','2222222222222','22/222','2025-01-01 11:11:59.999','จุดที่2 ตัวที่ 222','ยื่นเอกสาร',NULL,'http://localhost:8888/public/1743066461534.jpg',38,'2025-03-27 09:07:31.553'),(14,'test3','test3','3333333333','3333333333333','33/333','2024-12-31 23:59:59.999','จุดที่3 ตัวที่ 333','ยื่นเอกสาร',NULL,'http://localhost:8888/public/1743067307851.jpg',38,'2025-03-27 09:21:42.213'),(15,'test4','test4','4444444444','4444444444444','44/444','2024-11-30 23:59:59.999','จุดที่4 ตัวที่ 444','ยื่นเอกสาร',NULL,'http://localhost:8888/public/1743127454571.jpg',38,'2025-03-28 02:04:14.189'),(16,'test5','test5','5555555555','5555555555555','55/555','2024-10-29 07:59:59.999','จุดที่5 ตัวที่ 555','ยื่นเอกสาร',NULL,'http://localhost:8888/public/1743127566581.jpg',38,'2025-03-28 02:06:03.545'),(17,'test6','test6','6666666666','6666666666666','66/666','2025-03-28 02:08:57.398','จุดที่6 ตัวที่ 666','ยื่นเอกสาร',NULL,'http://localhost:8888/public/1743127744302.jpg',38,'2025-03-28 02:08:57.398'),(18,'test7','test7','7777777777','7777777777777','77/777','2025-03-28 02:10:51.606','จุดที่7 ตัวที่ 777','ไม่ผ่าน',NULL,'http://localhost:8888/public/1743127854002.webp',38,'2025-04-25 03:53:35.369'),(19,'test8','test8','8888888888','8888888888888','88/888','2025-03-28 02:13:15.427','จุดที่8 ตัวที่ 888','ยื่นเอกสาร','5','http://localhost:8888/public/1743127996099.jpg',38,'2025-04-25 03:56:26.713');
/*!40000 ALTER TABLE `requestwatchcctv` ENABLE KEYS */;
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
