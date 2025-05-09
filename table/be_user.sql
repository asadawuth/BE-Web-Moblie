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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'asadawuth','paijit','taodewy@gmail.com','0859300756','$2b$10$dj24t6w/lARbNzcIK04xk.SZtvPNo9AJ0srtOn2PX6VExSTMTLMCi','ผู้ดูแลระบบ','http://localhost:8888/public/1741591380325.jpg','นาย'),(2,'asadawuth1','paijit1','taodewy10@gmail.com','1859300756','$2b$12$U.AT1boxcWa0jg5DWtrFBOfyHFb4FfKA35dkb7TPkNzMLnhqxHjoq','resign',NULL,'นาย'),(3,'asadawuth3','paijit3','taodewy30@gmail.com','3859300756','$2b$12$g9DNa8RhRcDAH7dzMa3AiO15D.t0JdkcrROElJaYtj5xZnPt4N.VO','resign',NULL,'นาย'),(4,'asadawuth4','paijit4','taodewy40@gmail.com','4859300756','$2b$12$4fdp90UMOqKxh.sFLtG4GO/iqEp55Mrsl.GaVSs1548XVWXTvEqae','resign',NULL,'นาย'),(5,'asadawuth5','paijit5','taodewy5@gmail.com','5555555555','$2b$12$LhoP4weJ48igk1CmoMQkKe1XyFO8b4BWVhlCpbgXOjraCy0DOR04.','resign',NULL,'นาย'),(6,'asadawuth11','paijit11','taodewy11@gmail.com','7410753159','$2b$12$De4HZOqTgouRikGmZ.MzyOIJ6uw5yeXgIFaHXfZRx06woz2M9Y476','resign',NULL,'นาง'),(7,'dwdwdw','dwdwdw','taodewy12@gmail.com','7895854185','$2b$12$rlrw33C.b9Nh5HUp0anTGe27O7tPuT2KBK9NDWuaq2zrp95P2ZWZW','resign',NULL,'นาง'),(8,'dwdwdw','dwfcwwfc','taodewy13@gmail.com','1385214785','$2b$12$kDR4EwOceuKVKA/.UMkmW.3a5bxEyHXpRxCQqYwnsgDKLCXDdJqcm','resign',NULL,'นาง'),(9,'dwdw','wdwvwgvehj5','egve@gmail.com','8521598745','$2b$12$72HR0ImXCm5yB78eoj0M7.FjmPuBg9IL7ubsG9K/jr8lnT6n3p8T.','resign',NULL,'นางสาว'),(10,'dwfwd','h4rhb4e','taodewydwdwdw@gmail.com','8524561238','$2b$12$7lpnPE5drFyBoBrr2W/zIubwb.jlFsOEgIUbnE1nuNr95tN6lWuWm','resign',NULL,'นางสาว'),(12,'fefeg3h4','34252f2qw','admin@gmail.com','7777777777','$2b$12$gEf1PTA2rKO.UHx171mbBOlu0WG6uHCrfcV.vfuwRFVkmqPv/V25.','resign',NULL,'นางสาว'),(13,'efeg34wh','bvwebr','gmeogmoew@gmail.com','7418529635','$2b$12$cuzQ.IWIT8Ev9fWsJW676u9SqAD22eS1fnnEyi2YIjjRN.jptSVi.','resign',NULL,'นาย'),(14,'wdfwgv','r2dww','femgovm@gmail.com','8521598528','$2b$12$nst2/dfqNaHRY7MSytWffelozfTcmtiaWt2wI3lz9rAd7bDaXXxWe','resign',NULL,'นาย'),(15,'dwg3g3e','r3rwwsds','taodewydwd@gmail.com','8888885555','$2b$12$FKYJU4keCfRmDnBQWb4peuKnwFBG8I.Vgo3g2xeckEA1f0QT1Rom.','resign',NULL,'นาย'),(16,'cwcw','cwcw','swxw@gmail.com','7777788888','$2b$12$ZLpTrsZV2uX9DPJd1Gj6bOy4sOnDYRDL.TAkWyrDcgh2TjrcKi916','resign',NULL,'นาย'),(17,'gegv3w','vwfw','2fwdfc@gmail.com','5555555550','$2b$12$ZqKorI3lzzHdkt3u2vWHMu6Dbj1DjCiChfj98ARrsVrIxwSJqb2lO','resign',NULL,'นาย'),(18,'dw','wfvw','wfsc@gmail.com','1111144488','$2b$12$kqandF3n.fShwgAP9W2K7.fmtYlH.oCEPhky6OeOIp93L77CbB7U6','resign',NULL,'นาย'),(19,'3fesc','dwfwf','t@gmail.com','8888896359','$2b$12$vuMQDpkd.64MWL6Mf1v5J.oBg/U3lltBu2zd7N3xFQ0/C0rVfYwSO','resign',NULL,'นาย'),(20,'fef3','fwfwf','dwdwd23@gmail.com','8521598888','$2b$12$zwpTF1fmV0704120pjNEQeHpI4LQQ95CfaDLwMDnWXzOBVTvMk1hO','resign',NULL,'นาย'),(21,'dw2ds','dwdw','2dsd@gmail.com','1115559998','$2b$12$ve.T9vd04yLnHpiZciYZuecIbigTb2vWJ4exlRVnKaM6rmGVQ6EHG','resign',NULL,'นาย'),(22,'wwwwwdsdwdw','dwdwdwwwww','--dddd@gmail.com','4859300786','$2b$12$3mz5jFzIV3GNVfBLby8rc.IJLX/gz42rBfRsjnc7cVBVzhjdHunXO','resign',NULL,'นาย'),(23,'fefe','xcwdw','rgr@gmail.com','8888899999','$2b$12$GRL9tDuFG9u4j1ElUcLVVuMiMbUoNuJqsgk5brrHAnq6.BUrWet1e','resign',NULL,'นาง'),(24,'fefedw','vwvwv','vgevge@gmail.com','7777744444','$2b$12$Hx/ERag90BB0OntHau5fke1hRwhmS/RO.HAjn2Iesb2uae7xpbQPi','เจ้าหน้าที่ซ่อมบำรุง',NULL,'นาง'),(25,'vgeber','fefv','fwfw@gmail.com','5555544444','$2b$12$INoc.NWBV9SSKIkED1Zux.1.QmZ1vvAvN5kOWLa2D37KMIyjxOpY.','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาง'),(26,'fwfwegve','efcwf','fwd@gmail.com','8885521596','$2b$12$UxAQuHVC6uxcalQarn6NWO4IMxD/CTFhZXYn38FdvsOrFL3Wxf1rK','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาย'),(27,'dwfw','dwdw','dwv@gmail.com','7774411111','$2b$12$3iq.evPAfOxux3yIrShcEOxwMC1VD/TabbX7qzXyA4F5cy.qOwH/m','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาย'),(28,'fwfw','dwf','4tgedv@gmail.com','7774485215','$2b$12$ESSeDMfy9qZa6VKdjlnbF.6iE9s1aot5EQYQnPeaM6GwbBKdCouAq','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาย'),(29,'dwfwfwxxx','fefesssss','a1@gmail.com','4859300788','$2b$12$2WUIzfrduGrckLQYpbiometZByCMWJ8H70gab5.N24VSCC932CLVq','บล็อค',NULL,'นาย'),(30,'rfyh','edtgftg','asss1@gmail.com','4850000000','$2b$12$RaACOIAipxaNxl/vcsv1jeDvJm7Ff.ocgGl1C8y3/3jnH08t62Z.a','บล็อค',NULL,'นาย'),(31,'ijhgverfgh','hrshb','abrv1@gmail.com','1115558885','$2b$12$tLBDW4OxV4k4v0hWnI48nOdsza1PK.SycRIGKLgdwDU6rUG/05KPq','บล็อค',NULL,'นาย'),(32,'ijhs','hrshs','abrvss1@gmail.com','1115558880','$2b$12$t2bT08gIWGLY7TSVbNUDS.W9S77GCDeaG6iS/Xcn7nYecwnYiWiT2','บล็อค',NULL,'นาย'),(33,'ijhssss','hrshsss','abrvssdwdfw1@gmail.com','1115558333','$2b$12$exCSZlj5tA/bPNC6xHfWXOcw1x3zGRAT/q/.ws0j/Zd3zG74r0vJS','บล็อค',NULL,'นาย'),(34,'ssss','shsss','dwdfw1@gmail.com','1115558433','$2b$12$siYwN6f3rQcBKcwMnzeZCeq0e3cEYaTvNcluqt/ybcG6fXLDW4rZm','resign',NULL,'นาย'),(35,'sssstgtg','shssstgtg','dwdfw1gg@gmail.com','1115558477','$2b$12$OTRTQQmye0laqGafy18MkO.b8qDdW6X.XxAymL5OyKa825G1og1WC','ประชาชน',NULL,'นาย'),(36,'tgbyhn','tgbyhnh','rfvtgb@gmail.com','1115333477','$2b$12$uJz9lNLj5q0UGdPqHwocietPFwBLsedUrRWolZlri1kPfibEcMDQi','ประชาชน',NULL,'นาย'),(37,'rehgesse','vrhsbeee','rfved@gmail.com','1855555489','$2b$12$HoO4.PQRSf6WAvDqZifqnuwcZ/RYfWt28DIupIYz24wZ.AhKoA.by','ประชาชน',NULL,'นาย'),(38,'rehges','vrhsbe','rfveddd@gmail.com','1855555499','$2b$12$WSJyH/xV9TBqUvDubQ0T2OuU3z8LjKL0sAsFud2ILKdSHvyERYMG2','ประชาชน',NULL,'นาย'),(39,'rerges','vrhsbefe','rfvetgw@gmail.com','1855558889','$2b$12$CgKZxyqn/68LNkXjgnOlZuBP0m3yH5AfCXZaeKX9nNZn7fqvg7c.2','ประชาชน',NULL,'นาย'),(40,'rergess','vrhsbefes','rfvetgwss@gmail.com','1855558999','$2b$12$af7pZrsrsqrzg845hfNziOubGOMtX8BGE0bE9A9GGx0IcXVJqmqWq','ประชาชน',NULL,'นาย'),(41,'rergessa','vrhsbefesa','rfvetgwssa@gmail.com','1855558990','$2b$12$OhqtiPVyFJdPgw42XHmhBuYXiuqvMITDDFqkaGN4H7ZSClUWaM3km','ประชาชน',NULL,'นาย'),(42,'mokowds','vfkfkjps','rfvetgwssaqa@gmail.com','1855558111','$2b$12$wcfzP8TY1J7aF7IglYkSYOm6fAwFf7g3xeE/PVISyFXgT87qHmbhK','ประชาชน',NULL,'นาย'),(43,'moko','vfkf','rfvetgws@gmail.com','1855558222','$2b$12$naz7HcLbx6yozBLZYrBoFugGIqUVr8mzQz0dNn9HcH6E6v5bFSyy.','ประชาชน',NULL,'นาย'),(44,'mokotg','vfkftg','rfvtg@gmail.com','1855558444','$2b$12$Opdf5lk.xJbaXq.prKzrRuPFgzE/EhaGkUZQqJsDRJm9oiodO5G66','ประชาชน',NULL,'นาย'),(45,'moijyg','vfigjh','rfvtg1@gmail.com','1855558555','$2b$12$39J7NlINgFAJF9/zGhTs7ObN57WucnIeEK/UO63whw8SrMc8STtqi','ประชาชน',NULL,'นาย'),(46,'moijyga','vfigjha','rfvtg2@gmail.com','1855556666','$2b$12$l7znKiakk4Z8vjGCKl9q0uS9oGAOalAX5MbFQ7DFogxAhXa2bN4TW','ประชาชน',NULL,'นาย'),(47,'moijyu','vfigju','rfvtg7@gmail.com','1855557777','$2b$12$17DJsKUsVu6NKZINhdx1rerFyBPmekHhe/.VhG.O2XCyG588WpKqi','ประชาชน',NULL,'นาย'),(48,'moijyuaa','vfigjuaa','rfvtg7aa@gmail.com','1855550000','$2b$12$EUsrcr/7WCnsGSKo1t04u.79QiL6HDNSMQwvsXqKn0MA6.IIIa/gi','ประชาชน',NULL,'นาย'),(49,'moijyuaaqq','vfigjuaaqq','rfvtg7qq@gmail.com','1855574185','$2b$12$oVpZPVoAs0Cng6R1sOqhNeAApcF485L8SEtzeiGFxo8S.vPjX0T3u','บล็อค',NULL,'นาย'),(50,'aaa','bbb','taodewyb@gmail.com','2222258524','$2b$12$hX3JMT9dFhnPLSQmoS/WOucTb1glTlr06lYqMik.Ud9hhsxnmLtum','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาง'),(51,'wdwd','dwdwd','taodewy33@gmail.com','7418529568','$2b$12$ecjvqqTVspTCVh2nVq71xeQhfMuqlN8RGxYnsjPeLBzPtX0kfH.Om','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาง'),(52,'wrshw','fgwehw','taodewyssss@gmail.com','7418521598','$2b$12$.m01k1u/tCJ9js61a.EU3ua5bigKaezXTFUxquFKumI91OAFju08G','เจ้าหน้าที่ซ่อมบำรุง',NULL,'นาย'),(53,'fefw','fwfdw','fwwdy@gmail.com','7418525588','$2b$12$C3cjsRh0VyXiuPGMGuan/uGxYD1Dz04YynETODYyb1g4YeY1/tj3u','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาง'),(54,'dwdwf','dwdw','dwdwddwdw@gmail.com','8885525988','$2b$12$NPCCZfTOZX62qXeow8MkNO5HofzmvjOgGVtvKLGcYphBqgnETcf8q','ผู้ดำเนินการศูนย์บัญชาการ',NULL,'นาง'),(55,'dwfwf','dwdwsw','dwfwfgggg@gmail.com','8484848475','$2b$12$PQZhhp0OWr1sNKF8.Al0vu9YaFgezdNdXeQXcaEy.OVPM1/JwwHOW','เจ้าหน้าที่ซ่อมบำรุง',NULL,'นาย'),(56,'nn','nn','nn@kk.com','0255698539','$2b$12$2xAE2keXhsaxALp2mQlGheOF7Iw6odIPlpdTPNf7NXc.UPft1huwe','resign',NULL,'นางสาว');
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

-- Dump completed on 2025-05-02 13:33:24
