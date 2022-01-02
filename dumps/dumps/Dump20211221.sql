CREATE DATABASE  IF NOT EXISTS `covid` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `covid`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: covid
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `rowid` bigint NOT NULL AUTO_INCREMENT,
  `id_number` varchar(10) NOT NULL,
  `date` varchar(45) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` int NOT NULL,
  `infect_covid` int NOT NULL,
  `infect_date` date DEFAULT NULL,
  `treatment_place` int DEFAULT NULL,
  `oxygen_treatment` int DEFAULT NULL,
  `ICU_treatment` int DEFAULT NULL,
  `discharged_date` date DEFAULT NULL,
  `revisit` int DEFAULT NULL,
  `revisit_division` int DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `deal_with` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `serial_number` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `id_number_UNIQUE` (`id_number`),
  UNIQUE KEY `serial_number_UNIQUE` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (31,'A109687927','2021-02-15','吳單車','1970-01-03',1,1,'2020-06-02',1,3,1,'2020-06-30',0,3,'bicyclewu0103@gmail.com',3,0,901505),(33,'A234556915','2021-12-31','許稚稚','1988-03-19',0,1,'2020-05-22',1,2,1,'2020-06-20',1,1,'linda0319@gmail.com',1,NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialnumber`
--

DROP TABLE IF EXISTS `serialnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serialnumber` (
  `rowid` bigint NOT NULL AUTO_INCREMENT,
  `serialnumber` varchar(45) NOT NULL,
  `id_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `id_number_UNIQUE` (`id_number`),
  CONSTRAINT `serialnumber_ibfk_1` FOREIGN KEY (`id_number`) REFERENCES `patient` (`id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialnumber`
--

LOCK TABLES `serialnumber` WRITE;
/*!40000 ALTER TABLE `serialnumber` DISABLE KEYS */;
INSERT INTO `serialnumber` VALUES (1,'Jk2Kc4Rx','A109687927'),(2,'N71LUhhq',NULL),(3,'JHbj2UCx',NULL),(4,'VbDI164l',NULL),(5,'KY7K4uA8',NULL),(6,'094OXb41',NULL),(7,'4GYvJ1aJ',NULL),(8,'W6wp4INa',NULL),(9,'KzGEs7mw',NULL),(10,'N52NfK6i',NULL),(11,'ZJmrPar8',NULL),(12,'LG47v9s5',NULL),(13,'9dFh39s1',NULL),(14,'pSAD6tia',NULL),(15,'MpC9PoZ9',NULL);
/*!40000 ALTER TABLE `serialnumber` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-21 17:11:32
