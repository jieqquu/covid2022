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
  `revisit_dicision` int DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `deal_with` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `serial_number` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `id_number_UNIQUE` (`id_number`),
  UNIQUE KEY `serial_number_UNIQUE` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (31,'A109687927','2021-02-15','吳單車','1970-01-03',1,1,'2020-06-02',1,3,1,'2020-06-30',0,3,'bicyclewu0103@gmail.com',3,0,901505),(33,'A234556915','2021-12-31','許稚稚','1988-03-19',0,1,'2020-05-22',1,2,1,'2020-06-20',1,1,'linda0319@gmail.com',1,NULL,909802),(35,'A112234456','2021-05-31','湯綠豆','1977-05-14',1,1,'2020-12-09',1,2,1,'2021-01-15',1,1,'greenben@gmail.com',2,NULL,621896);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-02 23:05:28
CREATE DATABASE  IF NOT EXISTS `covidin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `covidin`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: covidin
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
-- Table structure for table `case3`
--

DROP TABLE IF EXISTS `case3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `case3` (
  `id_number` varchar(45) NOT NULL,
  `infect_covid` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `infect_date` date DEFAULT NULL,
  `treatment_place` int DEFAULT NULL,
  `oxygen_treatment` int DEFAULT NULL,
  `ICU_treatment` int DEFAULT NULL,
  `discharged_date` date DEFAULT NULL,
  `revisit` int DEFAULT NULL,
  `revisit_dicision` int DEFAULT NULL,
  `deal_with` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `rowid` bigint DEFAULT NULL,
  PRIMARY KEY (`id_number`),
  CONSTRAINT `case3_ibfk_2` FOREIGN KEY (`id_number`) REFERENCES `patient` (`id_number`),
  CONSTRAINT `case3_ibfk_3` FOREIGN KEY (`id_number`) REFERENCES `patient` (`id_number`),
  CONSTRAINT `case3_ibfk_4` FOREIGN KEY (`id_number`) REFERENCES `patient` (`id_number`),
  CONSTRAINT `case3_ibfk_5` FOREIGN KEY (`id_number`) REFERENCES `patient` (`id_number`),
  CONSTRAINT `case3_ibfk_6` FOREIGN KEY (`id_number`) REFERENCES `patient` (`id_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case3`
--

LOCK TABLES `case3` WRITE;
/*!40000 ALTER TABLE `case3` DISABLE KEYS */;
INSERT INTO `case3` VALUES ('A109687927',1,'2021-02-15','2020-06-02',1,2,1,'2020-06-29',1,3,3,0,NULL),('A123456788',1,'2022-01-03','2021-05-21',1,1,2,'2021-06-25',1,4,3,0,NULL),('A213478903',1,'2021-07-18','2021-03-06',1,1,0,'2021-06-18',1,1,4,0,NULL),('A263748473',1,'2020-04-03','2020-01-15',1,1,0,'2020-03-20',0,NULL,4,0,NULL),('F278927164',1,'2021-05-08','2020-11-03',2,0,0,'2021-02-01',0,NULL,2,0,NULL),('F298754693',1,'2021-06-09','2021-01-11',2,0,0,'2021-05-02',1,5,2,0,NULL),('H176029365',1,'2021-01-09','2020-08-19',1,3,1,'2020-12-31',1,1,1,1,NULL),('I1627484732',1,'2020-09-10','2020-04-10',1,2,0,'2020-08-17',1,1,1,0,NULL);
/*!40000 ALTER TABLE `case3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `rowid` bigint NOT NULL AUTO_INCREMENT,
  `account` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(10) NOT NULL,
  `office` varchar(45) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'A6BIK57S9QO','340b75mrau','李宜靜','個管師'),(2,'ANE2O9NRNHV','gb42a207qc','張淑娥','個管師'),(3,'AWAJZOF1YH3','mwcj4xyya9','李淑婷','個管師'),(4,'ASG7LLNWT75','wblke24rla','許家屏','個管師'),(5,'BAW11JK0P8S','4subrpaqf6','詹昌智','心理師'),(6,'BNEWPH0G1KO','9dkyx5wb8a','謝家瑋','心理師'),(7,'BOSCLOYRXEV','dq61pwwmxm','林國榮','心理師'),(8,'C15WRKXQ0RT','nlvhha19go','謝家豪','社工師'),(9,'CN830VWRBBP','pyv9fvue21','韓偉倫','社工師'),(10,'CQR9EQFEPRQ','wugsjiiqie','李任原','社工師');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `rowid` bigint NOT NULL AUTO_INCREMENT,
  `medical_record_number` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `NHI_number` varchar(20) NOT NULL,
  `id_number` varchar(15) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `id_number` (`id_number`),
  UNIQUE KEY `medical_record_number_UNIQUE` (`medical_record_number`),
  UNIQUE KEY `NHI_number_UNIQUE` (`NHI_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,987654,'李睿睿','0000 1459 7731','A123456788','1950-02-28',0),(2,1891657,'李壞掉','0000 6789 2345','H283740298','1945-03-10',0),(3,2148590,'郝可愛','0000 8763 4567','H176029365','2003-06-01',1),(4,2574610,'莊蘋果','0000 1223 3456','F278927164','2015-05-03',0),(5,2846310,'莊怕怕','0011 2345 8765','A109687927','2000-01-19',1),(6,5412116,'吳有病','0000 9876 7654','I1627484732','1956-10-17',1),(7,5971436,'葉子','0000 1332 9876','A213478903','2010-08-31',1),(8,7108111,'李杯杯','0000 8765 4321','A109384756','1991-05-06',1),(9,8469147,'林香蕉','0000 8903 9876','F298754693','1987-09-20',0),(10,8714101,'陳奶奶','0020 5678 5432','A263748473','1990-08-09',0);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-02 23:05:28
