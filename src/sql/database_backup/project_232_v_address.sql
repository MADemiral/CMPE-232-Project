-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: project_232
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `v_address`
--

DROP TABLE IF EXISTS `v_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `v_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `v_zip` varchar(255) DEFAULT NULL,
  `v_city` varchar(255) DEFAULT NULL,
  `v_ssn` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `v_ssn` (`v_ssn`),
  CONSTRAINT `v_address_ibfk_1` FOREIGN KEY (`v_ssn`) REFERENCES `visitors` (`v_ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `v_address`
--

LOCK TABLES `v_address` WRITE;
/*!40000 ALTER TABLE `v_address` DISABLE KEYS */;
INSERT INTO `v_address` VALUES (2,'06400','Ankara',987654321),(3,'98765','City3',555111222),(5,'87654','City5',888777666),(7,'56789','City7',999888777),(8,'34567','City8',666555444),(9,'65432','City9',333222111),(10,'87654','City10',777666555),(14,'06600','Ankara',784784784),(30,'34400','Ankara',138550661),(31,'06600','Ankara',150520663),(32,'06600','Ankara',999888546),(34,'34400','Istanbul',908809908),(35,'34400','Istanbul',123545654);
/*!40000 ALTER TABLE `v_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-08 19:11:58