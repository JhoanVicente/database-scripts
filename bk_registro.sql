-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: registros
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `REGISTRO`
--

DROP TABLE IF EXISTS `REGISTRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REGISTRO` (
  `CODCLI` char(3) NOT NULL,
  `MOMCLI` varchar(60) NOT NULL,
  `APECLI` varchar(70) NOT NULL,
  `DNICLI` char(8) NOT NULL,
  `EMACLI` varchar(60) DEFAULT NULL,
  `ESTCLI` char(1) DEFAULT 'A',
  PRIMARY KEY (`CODCLI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REGISTRO`
--

LOCK TABLES `REGISTRO` WRITE;
/*!40000 ALTER TABLE `REGISTRO` DISABLE KEYS */;
INSERT INTO `REGISTRO` VALUES ('01','Efsun','Soto Salazar','78542364','efsunsoto@gmail.com','A'),('02','Denisse','Rojas Acevedo','78749564','denisse.rojas@gmail.com','A'),('03','Nicoly','Franco Salinas','47522364','nicoly.franco@gmail.com','A'),('04','Giomar','Salinas Velarde','78566664','giomar.salinas@gmail.com','A'),('05','Mathias','Guerra Campos','78477374','mathiasguerra@gmail.com','A'),('06','Maricely','Gutierrez Aybas','73265184','maricelysoto@gmail.com','A'),('07','Arturo','Huari Huari','65752364','arturohuari@gmail.com','A'),('08','Rosa','Luis Cardenas','78692554','rosa.luis@gmail.com','A'),('09','Fiorella','Fulchi Leo','78777364','fiorellafulchi@gmail.com','A'),('10','Carlos','Rojas Quispe','78625622','carlos.rojas@gmail.com','A');
/*!40000 ALTER TABLE `REGISTRO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-26  3:43:15
