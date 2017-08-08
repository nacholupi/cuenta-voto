-- MySQL dump 10.13  Distrib 5.6.13, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemavotacion
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `circuito`
--

DROP TABLE IF EXISTS `circuito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circuito` (
  `idCircuito` varchar(10) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `cantMesa` int(11) NOT NULL,
  `cantLectores` int(11) NOT NULL,
  PRIMARY KEY (`idCircuito`),
  KEY `FK_Localidad_idx` (`idLocalidad`),
  CONSTRAINT `FK_Localidad` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`idLocalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circuito`
--

LOCK TABLES `circuito` WRITE;
/*!40000 ALTER TABLE `circuito` DISABLE KEYS */;
INSERT INTO `circuito` VALUES ('887',5,39,13411),('888',5,50,17347),('889',2,72,25070),('890',2,9,3063),('891',4,140,48789),('892',3,180,62954),('892A',6,96,33378),('893',2,99,34582),('894',1,16,5341),('895',4,55,18966);
/*!40000 ALTER TABLE `circuito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleccion`
--

DROP TABLE IF EXISTS `eleccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleccion` (
  `acronimo` varchar(10) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`acronimo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleccion`
--

LOCK TABLES `eleccion` WRITE;
/*!40000 ALTER TABLE `eleccion` DISABLE KEYS */;
INSERT INTO `eleccion` VALUES ('2013FEl','Elecciones legislativas paso 2013'),('2013PEL','Elecciones legislativas finales 2013');
/*!40000 ALTER TABLE `eleccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidad` (
  `idLocalidad` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `cantMesas` int(11) NOT NULL,
  `cantElectores` int(11) NOT NULL,
  PRIMARY KEY (`idLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Acassuso',16,5341),(2,'Béccar',180,62715),(3,'Boulogne',180,62954),(4,'Martínez',195,67755),(5,'San Isidro',89,30758),(6,'Villa Adelina',96,33378);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa` (
  `idMesa` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `cantidadVotantes` int(11) NOT NULL,
  `idCircuito` varchar(10) NOT NULL,
  PRIMARY KEY (`idMesa`),
  KEY `FK_Circuito_idx` (`idCircuito`),
  CONSTRAINT `FK_Circuito` FOREIGN KEY (`idCircuito`) REFERENCES `circuito` (`idCircuito`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,'Colegio Ntra. Sra. de La Unidad',350,'887'),(2,'Colegio Ntra. Sra. de La Unidad',350,'887'),(3,'Colegio Ntra. Sra. de La Unidad',350,'887'),(4,'Colegio Ntra. Sra. de La Unidad',350,'887'),(5,'Colegio Ntra. Sra. de La Unidad',350,'887'),(6,'Colegio Ntra. Sra. de La Unidad',350,'887'),(7,'Colegio Ntra. Sra. de La Unidad',350,'887'),(8,'Colegio Ntra. Sra. de La Unidad',350,'887'),(9,'Escuela Es N°8',350,'887'),(10,'Escuela Es N°8',350,'887'),(11,'Escuela Es N°8',350,'887'),(12,'Escuela Es N°8',350,'887'),(13,'Escuela Es N°8',350,'887'),(14,'Escuela Es N°8',350,'887'),(15,'Escuela Es N°8',350,'887'),(16,'Escuela Es N°8',350,'887'),(17,'Escuela Es N°8',350,'887'),(18,'Escuela Es N°8',350,'887'),(19,'Escuela Es N°8',350,'887'),(20,'Escuela Es N°8',350,'887'),(21,'Escuela Es N°8',350,'887'),(22,'Escuela Es N°8',350,'887'),(23,'Colegio Sta. Maria Lujan',350,'887'),(24,'Colegio Sta. Maria Lujan',350,'887'),(25,'Colegio Sta. Maria Lujan',350,'887'),(26,'Colegio Sta. Maria Lujan',350,'887'),(27,'Colegio Sta. Maria Lujan',350,'887'),(28,'Colegio Sta. Maria Lujan',350,'887'),(29,'Colegio Sta. Maria Lujan',350,'887'),(30,'Escuela Ep N°1',350,'887'),(31,'Escuela Ep N°1',350,'887'),(32,'Escuela Ep N°1',350,'887'),(33,'Escuela Ep N°1',350,'887'),(34,'Escuela Ep N°1',350,'887'),(35,'Escuela Ep N°1',350,'887'),(36,'Escuela Ep N°1',350,'887'),(37,'Escuela Ep N°1',350,'887'),(38,'Escuela Ep N°1',350,'887'),(39,'Escuela Ep N°1',111,'887'),(40,'Escuela Ep N°2',350,'888'),(41,'Escuela Ep N°2',350,'888'),(42,'Escuela Ep N°2',350,'888'),(43,'Escuela Ep N°2',350,'888'),(44,'Escuela Ep N°2',350,'888'),(45,'Escuela Ep N°2',350,'888'),(46,'Escuela Ep N°2',350,'888'),(47,'Escuela Ep N°2',350,'888'),(48,'Escuela Ep N°2',350,'888'),(49,'Escuela Santa Isabel',350,'888'),(50,'Escuela Santa Isabel',350,'888'),(51,'Escuela Santa Isabel',350,'888'),(52,'Escuela Santa Isabel',350,'888'),(53,'Escuela Santa Isabel',350,'888'),(54,'Escuela Santa Isabel',350,'888'),(55,'Escuela Santa Isabel',350,'888'),(56,'Escuela Santa Isabel',350,'888'),(57,'Colegio Piaget',350,'888'),(58,'Colegio Piaget',350,'888'),(59,'Colegio Piaget',350,'888'),(60,'Colegio Piaget',350,'888'),(61,'Inst. Incorporado 20 de Junio',350,'888'),(62,'Inst. Incorporado 20 de Junio',350,'888'),(63,'Inst. Incorporado 20 de Junio',350,'888'),(64,'Inst. Incorporado 20 de Junio',350,'888'),(65,'Inst. Incorporado 20 de Junio',350,'888'),(66,'Inst. Incorporado 20 de Junio',350,'888'),(67,'Inst. Incorporado 20 de Junio',350,'888'),(68,'Inst. Incorporado 20 de Junio',350,'888'),(69,'Colegio Cardenal Spinola',350,'888'),(70,'Colegio Cardenal Spinola',350,'888'),(71,'Colegio Cardenal Spinola',350,'888'),(72,'Colegio Cardenal Spinola',350,'888'),(73,'Colegio Cardenal Spinola',350,'888'),(74,'Colegio San Carlos',350,'888'),(75,'Colegio San Carlos',350,'888'),(76,'Colegio San Carlos',350,'888'),(77,'Colegio San Carlos',350,'888'),(78,'Colegio San Carlos',350,'888'),(79,'Colegio Santa Trinidad',350,'888'),(80,'Colegio Santa Trinidad',350,'888'),(81,'Colegio Santa Trinidad',350,'888'),(82,'Colegio Santa Trinidad',350,'888'),(83,'Colegio Santa Trinidad',350,'888'),(84,'Colegio Santa Trinidad',350,'888'),(85,'Escuela Ep N°34',350,'888'),(86,'Escuela Ep N°34',350,'888'),(87,'Escuela Ep N°34',350,'888'),(88,'Escuela Ep N°34',350,'888'),(89,'Escuela Ep N°34',197,'888'),(90,'Escuela Ep N°5',350,'889'),(91,'Escuela Ep N°5',350,'889'),(92,'Escuela Ep N°5',350,'889'),(93,'Escuela Ep N°5',350,'889'),(94,'Escuela Ep N°5',350,'889'),(95,'Escuela Ep N°5',350,'889'),(96,'Colegio Ntra. Sra. de Lourdes',350,'889'),(97,'Colegio Ntra. Sra. de Lourdes',350,'889'),(98,'Colegio Ntra. Sra. de Lourdes',350,'889'),(99,'Colegio Ntra. Sra. de Lourdes',350,'889'),(100,'Colegio Ntra. Sra. de Lourdes',350,'889'),(101,'Colegio Ntra. Sra. de Lourdes',350,'889'),(102,'Colegio Marin',350,'889'),(103,'Colegio Marin',350,'889'),(104,'Colegio Marin',350,'889'),(105,'Colegio Marin',350,'889'),(106,'Colegio Marin',350,'889'),(107,'Colegio Nuevo San Isidro',350,'889'),(108,'Colegio Nuevo San Isidro',350,'889'),(109,'Colegio Nuevo San Isidro',350,'889'),(110,'Colegio Nuevo San Isidro',350,'889'),(111,'Colegio Nuevo San Isidro',350,'889'),(112,'Colegio Nuevo San Isidro',350,'889'),(113,'Colegio Nuevo San Isidro',350,'889'),(114,'Colegio Nuevo San Isidro',350,'889'),(115,'Colegio Nuevo San Isidro',350,'889'),(116,'Escuela Ep N°3',350,'889'),(117,'Escuela Ep N°3',350,'889'),(118,'Escuela Ep N°3',350,'889'),(119,'Escuela Ep N°3',350,'889'),(120,'Escuela Ep N°3',350,'889'),(121,'Escuela Ep N°3',350,'889'),(122,'Escuela Ep N°3',350,'889'),(123,'Escuela Ep N°3',350,'889'),(124,'Escuela Ep N°3',350,'889'),(125,'Escuela Ep N°3',350,'889'),(126,'Escuela Ep N°3',350,'889'),(127,'Escuela Ep N°3',350,'889'),(128,'Escuela Ep N°3',350,'889'),(129,'Escuela Ep N°23',350,'889'),(130,'Escuela Ep N°23',350,'889'),(131,'Escuela Ep N°23',350,'889'),(132,'Escuela Ep N°23',350,'889'),(133,'Escuela Ep N°23',350,'889'),(134,'Escuela Ep N°23',350,'889'),(135,'Escuela Ep N°23',350,'889'),(136,'Escuela Ep N°23',350,'889'),(137,'Escuela Ep N°23',350,'889'),(138,'Escuela Ep N°23',350,'889'),(139,'Escuela Ep N°23',350,'889'),(140,'Escuela Ep N°23',350,'889'),(141,'Escuela Escosesa San Andres',350,'889'),(142,'Escuela Escosesa San Andres',350,'889'),(143,'Escuela Escosesa San Andres',350,'889'),(144,'Escuela Escosesa San Andres',350,'889'),(145,'Escuela Escosesa San Andres',350,'889'),(146,'Escuela Escosesa San Andres',350,'889'),(147,'Escuela Escosesa San Andres',350,'889'),(148,'Escuela Escosesa San Andres',350,'889'),(149,'Escuela Escosesa San Andres',350,'889'),(150,'Escuela Escosesa San Andres',350,'889'),(151,'Bienestar Social Municipal',350,'889'),(152,'Bienestar Social Municipal',350,'889'),(153,'Bienestar Social Municipal',350,'889'),(154,'Bienestar Social Municipal',350,'889'),(155,'Escuela San Juan',350,'889'),(156,'Escuela San Juan',350,'889'),(157,'Escuela San Juan',350,'889'),(158,'Escuela San Juan',350,'889'),(159,'Centro de Alfabetizacion N°29',350,'889'),(160,'Centro de Alfabetizacion N°29',350,'889'),(161,'Centro de Alfabetizacion N°29',220,'889'),(162,'Club Sindic. O. I. V. Y Afines',350,'890'),(163,'Club Sindic. O. I. V. Y Afines',350,'890'),(164,'Club Sindic. O. I. V. Y Afines',350,'890'),(165,'Club Sindic. O. I. V. Y Afines',350,'890'),(166,'Club Sindic. O. I. V. Y Afines',350,'890'),(167,'Club Sindic. O. I. V. Y Afines',350,'890'),(168,'Colegio de La Santa Cruz',350,'890'),(169,'Colegio de La Santa Cruz',350,'890'),(170,'Colegio de La Santa Cruz',263,'890'),(171,'Escuela Ep N°8',350,'891'),(172,'Escuela Ep N°8',350,'891'),(173,'Escuela Ep N°8',350,'891'),(174,'Escuela Ep N°8',350,'891'),(175,'Escuela Ep N°8',350,'891'),(176,'Escuela Ep N°8',350,'891'),(177,'Escuela Ep N°8',350,'891'),(178,'Escuela Ep N°8',350,'891'),(179,'Escuela Ep N°8',350,'891'),(180,'Escuela Ep N°8',350,'891'),(181,'Escuela Ep N°8',350,'891'),(182,'Escuela Ep N°8',350,'891'),(183,'Escuela Ep N°8',350,'891'),(184,'Escuela Ep N°8',350,'891'),(185,'Escuela Ep N°8',350,'891'),(186,'Escuela Ep N°8',350,'891'),(187,'Escuela Ep N°9',350,'891'),(188,'Escuela Ep N°9',350,'891'),(189,'Escuela Ep N°9',350,'891'),(190,'Escuela Ep N°9',350,'891'),(191,'Escuela Ep N°9',350,'891'),(192,'Escuela Ep N°9',350,'891'),(193,'Escuela Ep N°9',350,'891'),(194,'Escuela Ep N°9',350,'891'),(195,'Escuela Ep N°9',350,'891'),(196,'Escuela Ep N°9',350,'891'),(197,'Escuela Ep N°9',350,'891'),(198,'Escuela Ep N°9',350,'891'),(199,'Escuela Ep N°14',350,'891'),(200,'Escuela Ep N°14',350,'891'),(201,'Escuela Ep N°14',350,'891'),(202,'Escuela Ep N°14',350,'891'),(203,'Escuela Ep N°14',350,'891'),(204,'Escuela Ep N°14',350,'891'),(205,'Escuela Ep N°14',350,'891'),(206,'Escuela Es N°5',350,'891'),(207,'Escuela Es N°5',350,'891'),(208,'Escuela Es N°5',350,'891'),(209,'Escuela Es N°5',350,'891'),(210,'Escuela Es N°5',350,'891'),(211,'Escuela Es N°5',350,'891'),(212,'Escuela Es N°5',350,'891'),(213,'Escuela Es N°5',350,'891'),(214,'Escuela Es N°5',350,'891'),(215,'Col. Crist. de Martinez (Sec',350,'891'),(216,'Col. Crist. de Martinez (Sec',350,'891'),(217,'Col. Crist. de Martinez (Sec',350,'891'),(218,'Col. Crist. de Martinez (Sec',350,'891'),(219,'Col. Crist. de Martinez (Sec',350,'891'),(220,'Col. Crist. de Martinez (Sec',350,'891'),(221,'Col. Crist. de Martinez (Sec',350,'891'),(222,'Col. Crist. de Martinez (Sec',350,'891'),(223,'Col. Crist. de Martinez (Sec',350,'891'),(224,'Instituto Mallinckrodt',350,'891'),(225,'Instituto Mallinckrodt',350,'891'),(226,'Instituto Mallinckrodt',350,'891'),(227,'Instituto Mallinckrodt',350,'891'),(228,'Instituto Mallinckrodt',350,'891'),(229,'Instituto Mallinckrodt',350,'891'),(230,'Instituto Mallinckrodt',350,'891'),(231,'Instituto Mallinckrodt',350,'891'),(232,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(233,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(234,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(235,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(236,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(237,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(238,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(239,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(240,'Colegio Sta. Teresa Del Niño Jesus',350,'891'),(241,'Universidad de Buenos Aires',350,'891'),(242,'Universidad de Buenos Aires',350,'891'),(243,'Universidad de Buenos Aires',350,'891'),(244,'Universidad de Buenos Aires',350,'891'),(245,'Universidad de Buenos Aires',350,'891'),(246,'Universidad de Buenos Aires',350,'891'),(247,'Universidad de Buenos Aires',350,'891'),(248,'Universidad de Buenos Aires',350,'891'),(249,'Universidad de Buenos Aires',350,'891'),(250,'Universidad de Buenos Aires',350,'891'),(251,'Universidad de Buenos Aires',350,'891'),(252,'Universidad de Buenos Aires',350,'891'),(253,'Universidad de Buenos Aires',350,'891'),(254,'Universidad de Buenos Aires',350,'891'),(255,'Universidad de Buenos Aires',350,'891'),(256,'Universidad de Buenos Aires',350,'891'),(257,'Escuela Ep N°22',350,'891'),(258,'Escuela Ep N°22',350,'891'),(259,'Escuela Ep N°22',350,'891'),(260,'Escuela Ep N°22',350,'891'),(261,'Escuela Ep N°22',350,'891'),(262,'Escuela Ep N°22',350,'891'),(263,'Escuela Ep N°22',350,'891'),(264,'Escuela Ep N°22',350,'891'),(265,'Escuela Ep N°22',350,'891'),(266,'Escuela Ep N°22',350,'891'),(267,'Escuela Ep N°22',350,'891'),(268,'Escuela Ep N°22',350,'891'),(269,'Colegio Naciones Unidas',350,'891'),(270,'Colegio Naciones Unidas',350,'891'),(271,'Colegio Naciones Unidas',350,'891'),(272,'Colegio Naciones Unidas',350,'891'),(273,'Colegio Naciones Unidas',350,'891'),(274,'Colegio Naciones Unidas',350,'891'),(275,'Instituto Dardo Rocha',350,'891'),(276,'Instituto Dardo Rocha',350,'891'),(277,'Instituto Dardo Rocha',350,'891'),(278,'Instituto Dardo Rocha',350,'891'),(279,'Instituto Dardo Rocha',350,'891'),(280,'Instituto Dardo Rocha',350,'891'),(281,'Instituto Dardo Rocha',350,'891'),(282,'Instituto Dardo Rocha',350,'891'),(283,'Instituto Dardo Rocha',350,'891'),(284,'Escuela Es N°9',350,'891'),(285,'Escuela Es N°9',350,'891'),(286,'Escuela Es N°9',350,'891'),(287,'Escuela Es N°9',350,'891'),(288,'Escuela Es N°9',350,'891'),(289,'Escuela Es N°9',350,'891'),(290,'Escuela Es N°9',350,'891'),(291,'Escuela Es N°9',350,'891'),(292,'Escuela Es N°9',350,'891'),(293,'Inst. San Jose de Martinez',350,'891'),(294,'Inst. San Jose de Martinez',350,'891'),(295,'Inst. San Jose de Martinez',350,'891'),(296,'Inst. San Jose de Martinez',350,'891'),(297,'Inst. San Jose de Martinez',350,'891'),(298,'Inst. San Jose de Martinez',350,'891'),(299,'Inst. San Jose de Martinez',350,'891'),(300,'Inst. San Jose de Martinez',350,'891'),(301,'Escuela Republica Argentina',350,'891'),(302,'Escuela Republica Argentina',350,'891'),(303,'Escuela Republica Argentina',350,'891'),(304,'Escuela Republica Argentina',350,'891'),(305,'Inst. Munic. de Formac. Superior',350,'891'),(306,'Inst. Munic. de Formac. Superior',350,'891'),(307,'Inst. Munic. de Formac. Superior',350,'891'),(308,'Centro Polival. de Arte de S. Isidro',350,'891'),(309,'Centro Polival. de Arte de S. Isidro',350,'891'),(310,'Centro Polival. de Arte de S. Isidro',139,'891'),(311,'Escuela Ep N°18',350,'892'),(312,'Escuela Ep N°18',350,'892'),(313,'Escuela Ep N°18',350,'892'),(314,'Escuela Ep N°18',350,'892'),(315,'Escuela Ep N°18',350,'892'),(316,'Escuela Ep N°18',350,'892'),(317,'Escuela Ep N°18',350,'892'),(318,'Escuela Ep N°18',350,'892'),(319,'Escuela Ep N°18',350,'892'),(320,'Escuela Ep N°18',350,'892'),(321,'Escuela Ep N°18',350,'892'),(322,'Escuela Ep N°18',350,'892'),(323,'Escuela Ep N°17',350,'892'),(324,'Escuela Ep N°17',350,'892'),(325,'Escuela Ep N°17',350,'892'),(326,'Escuela Ep N°17',350,'892'),(327,'Escuela Ep N°17',350,'892'),(328,'Escuela Ep N°17',350,'892'),(329,'Escuela Ep N°17',350,'892'),(330,'Escuela Ep N°17',350,'892'),(331,'Escuela Ep N°17',350,'892'),(332,'Escuela Ep N°17',350,'892'),(333,'Instituto 25 de Mayo',350,'892'),(334,'Instituto 25 de Mayo',350,'892'),(335,'Instituto 25 de Mayo',350,'892'),(336,'Instituto 25 de Mayo',350,'892'),(337,'Instituto 25 de Mayo',350,'892'),(338,'Instituto 25 de Mayo',350,'892'),(339,'Instituto 25 de Mayo',350,'892'),(340,'Instituto 25 de Mayo',350,'892'),(341,'Instituto 25 de Mayo',350,'892'),(342,'Instituto 25 de Mayo',350,'892'),(343,'Instituto 25 de Mayo',350,'892'),(344,'Instituto 25 de Mayo',350,'892'),(345,'Instituto 25 de Mayo',350,'892'),(346,'Instituto 25 de Mayo',350,'892'),(347,'Escuela Gral. Martin Guemes',350,'892'),(348,'Escuela Gral. Martin Guemes',350,'892'),(349,'Escuela Gral. Martin Guemes',350,'892'),(350,'Escuela Gral. Martin Guemes',350,'892'),(351,'Escuela Gral. Martin Guemes',350,'892'),(352,'Escuela Ep N°13/Es N°8',350,'892'),(353,'Escuela Ep N°13/Es N°8',350,'892'),(354,'Escuela Ep N°13/Es N°8',350,'892'),(355,'Escuela Ep N°13/Es N°8',350,'892'),(356,'Escuela Ep N°13/Es N°8',350,'892'),(357,'Escuela Ep N°13/Es N°8',350,'892'),(358,'Escuela Ep N°13/Es N°8',350,'892'),(359,'Escuela Ep N°13/Es N°8',350,'892'),(360,'Escuela Ep N°13/Es N°8',350,'892'),(361,'Escuela Ep N°13/Es N°8',350,'892'),(362,'Escuela Ep N°16',350,'892'),(363,'Escuela Ep N°16',350,'892'),(364,'Escuela Ep N°16',350,'892'),(365,'Escuela Ep N°16',350,'892'),(366,'Escuela Ep N°16',350,'892'),(367,'Escuela Ep N°16',350,'892'),(368,'Escuela Ep N°16',350,'892'),(369,'Escuela Ep N°16',350,'892'),(370,'Escuela Ep N°16',350,'892'),(371,'Escuela Ep N°16',350,'892'),(372,'Escuela Ep N°7',350,'892'),(373,'Escuela Ep N°7',350,'892'),(374,'Escuela Ep N°7',350,'892'),(375,'Escuela Ep N°7',350,'892'),(376,'Escuela Ep N°7',350,'892'),(377,'Escuela Ep N°7',350,'892'),(378,'Escuela Ep N°7',350,'892'),(379,'Escuela Ep N°7',350,'892'),(380,'Escuela Ep N°7',350,'892'),(381,'Escuela Es N°4',350,'892'),(382,'Escuela Es N°4',350,'892'),(383,'Escuela Es N°4',350,'892'),(384,'Escuela Es N°4',350,'892'),(385,'Escuela Es N°4',350,'892'),(386,'Escuela Es N°4',350,'892'),(387,'Escuela Es N°4',350,'892'),(388,'Colegio Gral. J. de San Martin',350,'892'),(389,'Colegio Gral. J. de San Martin',350,'892'),(390,'Colegio Gral. J. de San Martin',350,'892'),(391,'Colegio Gral. J. de San Martin',350,'892'),(392,'Colegio Gral. J. de San Martin',350,'892'),(393,'Escuela Es N°14',350,'892'),(394,'Escuela Es N°14',350,'892'),(395,'Escuela Es N°14',350,'892'),(396,'Escuela Es N°14',350,'892'),(397,'Escuela Es N°14',350,'892'),(398,'Escuela Es N°14',350,'892'),(399,'Escuela Es N°14',350,'892'),(400,'Escuela Es N°14',350,'892'),(401,'Escuela Es N°14',350,'892'),(402,'Escuela Es N°14',350,'892'),(403,'Escuela Es N°14',350,'892'),(404,'Escuela Es N°14',350,'892'),(405,'Escuela Ep N°24',350,'892'),(406,'Escuela Ep N°24',350,'892'),(407,'Escuela Ep N°24',350,'892'),(408,'Escuela Ep N°24',350,'892'),(409,'Escuela Ep N°24',350,'892'),(410,'Escuela Ep N°24',350,'892'),(411,'Escuela Ep N°24',350,'892'),(412,'Escuela Ep N°24',350,'892'),(413,'Escuela Ep N°24',350,'892'),(414,'Escuela Ep N°24',350,'892'),(415,'Escuela Ep N°24',350,'892'),(416,'Escuela Ep N°28',350,'892'),(417,'Escuela Ep N°28',350,'892'),(418,'Escuela Ep N°28',350,'892'),(419,'Escuela Ep N°28',350,'892'),(420,'Escuela Ep N°28',350,'892'),(421,'Escuela Ep N°28',350,'892'),(422,'Escuela Et N°4',350,'892'),(423,'Escuela Et N°4',350,'892'),(424,'Escuela Et N°4',350,'892'),(425,'Escuela Et N°4',350,'892'),(426,'Escuela Et N°4',350,'892'),(427,'Escuela Et N°4',350,'892'),(428,'Escuela Et N°4',350,'892'),(429,'Inst. Ceferino Namuncura',350,'892'),(430,'Inst. Ceferino Namuncura',350,'892'),(431,'Inst. Ceferino Namuncura',350,'892'),(432,'Inst. Ceferino Namuncura',350,'892'),(433,'Inst. Ceferino Namuncura',350,'892'),(434,'Colegio Leonardo Da Vinci',350,'892'),(435,'Colegio Leonardo Da Vinci',350,'892'),(436,'Colegio Leonardo Da Vinci',350,'892'),(437,'Colegio Leonardo Da Vinci',350,'892'),(438,'Colegio Leonardo Da Vinci',350,'892'),(439,'Inst. Secund. Cardenal Newman',350,'892'),(440,'Inst. Secund. Cardenal Newman',350,'892'),(441,'Inst. Secund. Cardenal Newman',350,'892'),(442,'Inst. Secund. Cardenal Newman',350,'892'),(443,'Inst. Secund. Cardenal Newman',350,'892'),(444,'Inst. Secund. Cardenal Newman',350,'892'),(445,'Escuela Ep N°27',350,'892'),(446,'Escuela Ep N°27',350,'892'),(447,'Escuela Ep N°27',350,'892'),(448,'Escuela Ep N°27',350,'892'),(449,'Escuela Ep N°27',350,'892'),(450,'Escuela Ep N°27',350,'892'),(451,'Escuela Ep N°27',350,'892'),(452,'Escuela Parroquial Juan Xxiii',350,'892'),(453,'Escuela Parroquial Juan Xxiii',350,'892'),(454,'Escuela Parroquial Juan Xxiii',350,'892'),(455,'Escuela Parroquial Juan Xxiii',350,'892'),(456,'Escuela Parroquial Juan Xxiii',350,'892'),(457,'Escuela Parroquial Juan Xxiii',350,'892'),(458,'Escuela Parroquial Juan Xxiii',350,'892'),(459,'Escuela Ep N°15',350,'892'),(460,'Escuela Ep N°15',350,'892'),(461,'Escuela Ep N°15',350,'892'),(462,'Escuela Ep N°15',350,'892'),(463,'Escuela Ep N°15',350,'892'),(464,'Escuela Ep N°15',350,'892'),(465,'Escuela Ep N°15',350,'892'),(466,'Escuela Ep N°15',350,'892'),(467,'Escuela Ep N°15',350,'892'),(468,'Escuela Et N°2',350,'892'),(469,'Escuela Et N°2',350,'892'),(470,'Escuela Et N°2',350,'892'),(471,'Escuela Et N°2',350,'892'),(472,'Escuela Et N°2',350,'892'),(473,'Escuela Et N°2',350,'892'),(474,'Escuela Es N°1',350,'892'),(475,'Escuela Es N°1',350,'892'),(476,'Escuela Es N°1',350,'892'),(477,'Escuela Es N°1',350,'892'),(478,'Escuela Es N°1',350,'892'),(479,'Escuela Ep N°33',350,'892'),(480,'Escuela Ep N°33',350,'892'),(481,'Escuela Ep N°33',350,'892'),(482,'Escuela Ep N°33',350,'892'),(483,'Escuela Ep N°33',350,'892'),(484,'Escuela Ep N°33',350,'892'),(485,'Instituto Goethe (Media',350,'892'),(486,'Instituto Goethe (Media',350,'892'),(487,'Instituto Goethe (Media',350,'892'),(488,'Instituto Goethe (Media',350,'892'),(489,'Instituto Goethe (Media',350,'892'),(490,'Instituto Goethe (Media',304,'892'),(491,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(492,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(493,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(494,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(495,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(496,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(497,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(498,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(499,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(500,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(501,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(502,'Escuela Educ. Tecnica A. Manzoni',350,'892A'),(503,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(504,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(505,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(506,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(507,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(508,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(509,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(510,'Coleg. Ntra. Sra. Refug. de Los Pecador',350,'892A'),(511,'Colegio San Andres Avelino',350,'892A'),(512,'Colegio San Andres Avelino',350,'892A'),(513,'Colegio San Andres Avelino',350,'892A'),(514,'Colegio San Andres Avelino',350,'892A'),(515,'Colegio San Cayetano',350,'892A'),(516,'Colegio San Cayetano',350,'892A'),(517,'Colegio San Cayetano',350,'892A'),(518,'Colegio San Cayetano',350,'892A'),(519,'Colegio San Cayetano',350,'892A'),(520,'Colegio San Cayetano',350,'892A'),(521,'Colegio San Cayetano',350,'892A'),(522,'Escuela Es N°7',350,'892A'),(523,'Escuela Es N°7',350,'892A'),(524,'Escuela Es N°7',350,'892A'),(525,'Escuela Es N°7',350,'892A'),(526,'Escuela Es N°7',350,'892A'),(527,'Escuela Es N°7',350,'892A'),(528,'Escuela Es N°7',350,'892A'),(529,'Escuela Es N°7',350,'892A'),(530,'Escuela Es N°7',350,'892A'),(531,'Instituto San Juan Bosco',350,'892A'),(532,'Instituto San Juan Bosco',350,'892A'),(533,'Instituto San Juan Bosco',350,'892A'),(534,'Instituto San Juan Bosco',350,'892A'),(535,'Escuela Ep N°12/Es N°2',350,'892A'),(536,'Escuela Ep N°12/Es N°2',350,'892A'),(537,'Escuela Ep N°12/Es N°2',350,'892A'),(538,'Escuela Ep N°12/Es N°2',350,'892A'),(539,'Escuela Ep N°12/Es N°2',350,'892A'),(540,'Escuela Ep N°12/Es N°2',350,'892A'),(541,'Escuela Ep N°12/Es N°2',350,'892A'),(542,'Escuela Ep N°12/Es N°2',350,'892A'),(543,'Escuela Ep N°12/Es N°2',350,'892A'),(544,'Escuela Ep N°12/Es N°2',350,'892A'),(545,'Escuela Ep N°12/Es N°2',350,'892A'),(546,'Escuela Ep N°12/Es N°2',350,'892A'),(547,'Escuela Ep N°12/Es N°2',350,'892A'),(548,'Escuela Ep N°12/Es N°2',350,'892A'),(549,'Escuela Ep N°12/Es N°2',350,'892A'),(550,'Escuela Ep N°12/Es N°2',350,'892A'),(551,'Escuela Ep N°12/Es N°2',350,'892A'),(552,'Escuela Ep N°12/Es N°2',350,'892A'),(553,'Escuela Ep N°12/Es N°2',350,'892A'),(554,'Escuela Ep N°12/Es N°2',350,'892A'),(555,'Escuela Ep N°21',350,'892A'),(556,'Escuela Ep N°21',350,'892A'),(557,'Escuela Ep N°21',350,'892A'),(558,'Escuela Ep N°21',350,'892A'),(559,'Escuela Ep N°21',350,'892A'),(560,'Escuela Ep N°21',350,'892A'),(561,'Escuela Ep N°21',350,'892A'),(562,'Escuela Ep N°21',350,'892A'),(563,'Escuela Ep N°20',350,'892A'),(564,'Escuela Ep N°20',350,'892A'),(565,'Escuela Ep N°20',350,'892A'),(566,'Escuela Ep N°20',350,'892A'),(567,'Escuela Ep N°20',350,'892A'),(568,'Escuela Ep N°20',350,'892A'),(569,'Escuela Ep N°20',350,'892A'),(570,'Escuela Ep N°20',350,'892A'),(571,'Escuela Ep N°30/Es N°15',350,'892A'),(572,'Escuela Ep N°30/Es N°15',350,'892A'),(573,'Escuela Ep N°30/Es N°15',350,'892A'),(574,'Escuela Ep N°30/Es N°15',350,'892A'),(575,'Escuela Ep N°30/Es N°15',350,'892A'),(576,'Escuela Ep N°30/Es N°15',350,'892A'),(577,'Escuela Ep N°30/Es N°15',350,'892A'),(578,'Escuela Ep N°30/Es N°15',350,'892A'),(579,'Escuela Ep N°30/Es N°15',350,'892A'),(580,'Escuela Ep N°30/Es N°15',350,'892A'),(581,'Escuela Ep N°29',350,'892A'),(582,'Escuela Ep N°29',350,'892A'),(583,'Escuela Es N°11',350,'892A'),(584,'Escuela Es N°11',350,'892A'),(585,'Escuela Es N°11',350,'892A'),(586,'Escuela Es N°11',128,'892A'),(587,'Escuela Ep N°6',350,'893'),(588,'Escuela Ep N°6',350,'893'),(589,'Escuela Ep N°6',350,'893'),(590,'Escuela Ep N°6',350,'893'),(591,'Escuela Ep N°6',350,'893'),(592,'Escuela Ep N°6',350,'893'),(593,'Escuela Ep N°6',350,'893'),(594,'Escuela Ep N°6',350,'893'),(595,'Escuela Ep N°6',350,'893'),(596,'Escuela Ep N°6',350,'893'),(597,'Colegio San Marcos',350,'893'),(598,'Colegio San Marcos',350,'893'),(599,'Colegio San Marcos',350,'893'),(600,'Colegio San Marcos',350,'893'),(601,'Colegio San Marcos',350,'893'),(602,'Colegio San Marcos',350,'893'),(603,'Colegio San Marcos',350,'893'),(604,'Colegio San Marcos',350,'893'),(605,'Colegio San Marcos',350,'893'),(606,'Colegio San Marcos',350,'893'),(607,'Instituto Juan S. Fernandez',350,'893'),(608,'Instituto Juan S. Fernandez',350,'893'),(609,'Instituto Juan S. Fernandez',350,'893'),(610,'Instituto Juan S. Fernandez',350,'893'),(611,'Instituto Juan S. Fernandez',350,'893'),(612,'Instituto Juan S. Fernandez',350,'893'),(613,'Instituto Juan S. Fernandez',350,'893'),(614,'Instituto Juan S. Fernandez',350,'893'),(615,'Instituto Juan S. Fernandez',350,'893'),(616,'Instituto Juan S. Fernandez',350,'893'),(617,'Instituto Juan S. Fernandez',350,'893'),(618,'Instituto Juan S. Fernandez',350,'893'),(619,'Escuela Ep N°19',350,'893'),(620,'Escuela Ep N°19',350,'893'),(621,'Escuela Ep N°19',350,'893'),(622,'Escuela Ep N°19',350,'893'),(623,'Escuela Ep N°19',350,'893'),(624,'Escuela Ep N°19',350,'893'),(625,'Escuela Ep N°19',350,'893'),(626,'Escuela Ep N°19',350,'893'),(627,'Esc. Munic. Malvinas Argentinas',350,'893'),(628,'Esc. Munic. Malvinas Argentinas',350,'893'),(629,'Esc. Munic. Malvinas Argentinas',350,'893'),(630,'Esc. Munic. Malvinas Argentinas',350,'893'),(631,'Esc. Munic. Malvinas Argentinas',350,'893'),(632,'Esc. Munic. Malvinas Argentinas',350,'893'),(633,'Esc. Munic. Malvinas Argentinas',350,'893'),(634,'Esc. Munic. Malvinas Argentinas',350,'893'),(635,'Esc. Munic. Malvinas Argentinas',350,'893'),(636,'Esc. Munic. Malvinas Argentinas',350,'893'),(637,'Esc. Munic. Malvinas Argentinas',350,'893'),(638,'Escuela Ep N°25',350,'893'),(639,'Escuela Ep N°25',350,'893'),(640,'Escuela Ep N°25',350,'893'),(641,'Escuela Ep N°25',350,'893'),(642,'Escuela Ep N°25',350,'893'),(643,'Escuela Ep N°25',350,'893'),(644,'Escuela Ep N°25',350,'893'),(645,'Instituto Sto. Domingo Savio',350,'893'),(646,'Instituto Sto. Domingo Savio',350,'893'),(647,'Instituto Sto. Domingo Savio',350,'893'),(648,'Instituto Sto. Domingo Savio',350,'893'),(649,'Instituto Sto. Domingo Savio',350,'893'),(650,'Instituto Sto. Domingo Savio',350,'893'),(651,'Instituto Sto. Domingo Savio',350,'893'),(652,'Instituto Sto. Domingo Savio',350,'893'),(653,'Instituto Sto. Domingo Savio',350,'893'),(654,'Instituto Sto. Domingo Savio',350,'893'),(655,'Escuela Ep N°31',350,'893'),(656,'Escuela Ep N°31',350,'893'),(657,'Escuela Ep N°31',350,'893'),(658,'Escuela Ep N°31',350,'893'),(659,'Escuela Ep N°31',350,'893'),(660,'Escuela Ep N°31',350,'893'),(661,'Escuela Ep N°31',350,'893'),(662,'Escuela Ep N°31',350,'893'),(663,'Escuela Ep N°31',350,'893'),(664,'Colegio de Los Peregrinos',350,'893'),(665,'Colegio de Los Peregrinos',350,'893'),(666,'Colegio de Los Peregrinos',350,'893'),(667,'Colegio de Los Peregrinos',350,'893'),(668,'Colegio de Los Peregrinos',350,'893'),(669,'Colegio de Los Peregrinos',350,'893'),(670,'Inst. Privado El Buen Ayre',350,'893'),(671,'Inst. Privado El Buen Ayre',350,'893'),(672,'Inst. Privado El Buen Ayre',350,'893'),(673,'Inst. Privado El Buen Ayre',350,'893'),(674,'Colegio Cruz Del Sur',350,'893'),(675,'Colegio Cruz Del Sur',350,'893'),(676,'Colegio Cruz Del Sur',350,'893'),(677,'Centro Educ. Complementario N°1',350,'893'),(678,'Centro Educ. Complementario N°1',350,'893'),(679,'Centro Educ. Complementario N°1',350,'893'),(680,'Centro Educ. Complementario N°1',350,'893'),(681,'Centro Educ. Complementario N°1',350,'893'),(682,'Jardin de Inf. El Trebol',350,'893'),(683,'Jardin de Inf. El Trebol',350,'893'),(684,'Jardin de Inf. El Trebol',350,'893'),(685,'Jardin de Inf. El Trebol',282,'893'),(686,'Club Atletico San Isidro',350,'894'),(687,'Club Atletico San Isidro',350,'894'),(688,'Club Atletico San Isidro',350,'894'),(689,'Instituto Nightingale',350,'894'),(690,'Instituto Nightingale',350,'894'),(691,'Instituto Nightingale',350,'894'),(692,'Instituto Nightingale',350,'894'),(693,'Instituto Nightingale',350,'894'),(694,'Instituto Nightingale',350,'894'),(695,'Esc. Franco-Argentina Martinez',350,'894'),(696,'Esc. Franco-Argentina Martinez',350,'894'),(697,'Esc. Franco-Argentina Martinez',350,'894'),(698,'Esc. Franco-Argentina Martinez',350,'894'),(699,'Esc. Franco-Argentina Martinez',350,'894'),(700,'Esc. Franco-Argentina Martinez',350,'894'),(701,'Esc. Franco-Argentina Martinez',91,'894'),(702,'Colegio Ott',350,'895'),(703,'Colegio Ott',350,'895'),(704,'Colegio Ott',350,'895'),(705,'Colegio Ott',350,'895'),(706,'Instituto Educativo Fatima',350,'895'),(707,'Instituto Educativo Fatima',350,'895'),(708,'Instituto Educativo Fatima',350,'895'),(709,'Instituto Educativo Fatima',350,'895'),(710,'Instituto Educativo Fatima',350,'895'),(711,'Instituto Educativo Fatima',350,'895'),(712,'Instituto Educativo Fatima',350,'895'),(713,'Instituto Educativo Fatima',350,'895'),(714,'Instituto Educativo Fatima',350,'895'),(715,'Instituto Educativo Fatima',350,'895'),(716,'Instituto Educativo Fatima',350,'895'),(717,'Instituto Educativo Fatima',350,'895'),(718,'Instituto Educativo Fatima',350,'895'),(719,'Instituto Educativo Fatima',350,'895'),(720,'Escuela Ep N°10',350,'895'),(721,'Escuela Ep N°10',350,'895'),(722,'Escuela Ep N°10',350,'895'),(723,'Escuela Ep N°10',350,'895'),(724,'Escuela Ep N°10',350,'895'),(725,'Escuela Ep N°10',350,'895'),(726,'Escuela Ep N°10',350,'895'),(727,'Escuela Ep N°10',350,'895'),(728,'Escuela Ep N°10',350,'895'),(729,'Escuela Ep N°10',350,'895'),(730,'Escuela San Juan',350,'895'),(731,'Escuela San Juan',350,'895'),(732,'Escuela San Juan',350,'895'),(733,'Escuela San Juan',350,'895'),(734,'Escuela San Juan',350,'895'),(735,'Colegio de La Ribera',350,'895'),(736,'Colegio de La Ribera',350,'895'),(737,'Colegio de La Ribera',350,'895'),(738,'Colegio de La Ribera',350,'895'),(739,'Colegio de La Ribera',350,'895'),(740,'Colegio de La Ribera',350,'895'),(741,'Colegio de La Ribera',350,'895'),(742,'Escuela Ep N°4',350,'895'),(743,'Escuela Ep N°4',350,'895'),(744,'Escuela Ep N°4',350,'895'),(745,'Escuela Ep N°4',350,'895'),(746,'Escuela Ep N°4',350,'895'),(747,'Escuela Ep N°4',350,'895'),(748,'Escuela Ep N°4',350,'895'),(749,'Escuela Ep N°4',350,'895'),(750,'Escuela Ep N°4',350,'895'),(751,'Escuela Ep N°4',350,'895'),(752,'Jardin Municipal N°902',350,'895'),(753,'Jardin Municipal N°902',350,'895'),(754,'Jardin Municipal N°902',350,'895'),(755,'Jardin Municipal N°902',350,'895'),(756,'Jardin Municipal N°902',66,'895'),(9001,'Club Atlético Beccar',999,'889'),(9002,'Club Atlético Beccar',999,'889'),(9003,'Club Atlético Beccar',999,'889'),(9004,'Instituto Sagrada Familia (Media)',999,'891'),(9005,'Instituto Sagrada Familia (Media)',999,'891'),(9006,'Instituto Sagrada Familia (Media)',999,'891'),(9007,'Instituto Sagrada Familia (Media)',999,'891'),(9008,'Instituto Sagrada Familia (Media)',999,'891'),(9009,'Colegio Sagrado Corazón de Jesús',999,'892'),(9010,'Colegio Sagrado Corazón de Jesús',999,'892'),(9011,'Colegio Sagrado Corazón de Jesús',999,'892'),(9012,'Colegio Sagrado Corazón de Jesús',999,'892'),(9013,'Colegio Sagrado Corazón de Jesús',999,'892'),(9014,'Colegio Sagrado Corazón de Jesús',999,'892'),(9015,'Instituto Sagrada Familia (Media)',999,'891'),(9016,'Escuela Esp. Nº 501',999,'891'),(9017,'Escuela Esp. Nº 501',999,'891'),(9018,'Escuela Esp. Nº 501',999,'891'),(9019,'Escuela Esp. Nº 501',999,'891'),(9020,'Escuela Esp. Nº 501',999,'891'),(9021,'Escuela Esp. Nº 501',999,'891'),(9022,'Escuela Esp. Nº 501',999,'891'),(9023,'Escuela Esp. Nº 501',999,'891'),(9024,'Escuela Esp. Nº 501',999,'891'),(9025,'Escuela Esp. Nº 501',999,'891'),(9027,'Escuela Franco-Argentina',999,'895');
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionvoto`
--

DROP TABLE IF EXISTS `opcionvoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opcionvoto` (
  `idOpcionVoto` int(11) NOT NULL AUTO_INCREMENT,
  `nroLista` int(11) DEFAULT NULL,
  `agrupacion` varchar(45) NOT NULL,
  `listaInt` varchar(45) DEFAULT NULL,
  `tieneSenador` bit(1) NOT NULL,
  `tieneDiputado` bit(1) NOT NULL,
  `tieneLegislador` bit(1) NOT NULL,
  `tieneConsejal` bit(1) NOT NULL,
  `orden` int(11) NOT NULL,
  `esValido` bit(1) NOT NULL,
  `esPartido` bit(1) NOT NULL,
  PRIMARY KEY (`idOpcionVoto`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionvoto`
--

LOCK TABLES `opcionvoto` WRITE;
/*!40000 ALTER TABLE `opcionvoto` DISABLE KEYS */;
INSERT INTO `opcionvoto` VALUES (1,8,'PARTIDO FEDERAL','LISTA -A- ROJO PUNZO','','','\0','\0',1,'',''),(2,8,'PARTIDO FEDERAL','LISTA -B- CELESTE Y BLANCA','','','','\0',2,'',''),(3,8,'PARTIDO FEDERAL','LISTA -C- FEDERALISMO PURO','','','\0','\0',3,'',''),(4,8,'PARTIDO FEDERAL','LISTA -D- ALTERNATIVA','','','\0','\0',4,'',''),(5,22,'PARTIDO HUMANISTA','LISTA A NARANJA','','','\0','\0',5,'',''),(6,259,'PARTIDO DEL CAMPO POPULAR','LISTA A-INDEPENDENCIA','','','\0','\0',6,'',''),(7,259,'PARTIDO DEL CAMPO POPULAR','LISTA B-LIBERTAD','','\0','\0','\0',7,'',''),(8,259,'PARTIDO DEL CAMPO POPULAR','LISTA C-SEGURIDAD','','\0','\0','\0',8,'',''),(9,268,'MOV. AMPLIO DE TRABAJADORES Y JUBILADOS','LISTA UNIDAD 1','','','','\0',9,'',''),(10,298,'TODOS POR BUENOS AIRES','LISTA TOBA','','','','',10,'',''),(11,301,'PATRIA GRANDE','LISTA VAMOS','\0','','\0','\0',11,'',''),(12,301,'PATRIA GRANDE','LISTA FUERZA DE LA GENTE','\0','\0','','',12,'',''),(13,309,'MOVIMIENTO ORGANIZACION DEMOCRATICA','LISTA COMPROMISO CIUDADANO','','','\0','\0',13,'',''),(14,501,'1PAIS','LISTA UN PAIS UNIDO HOY Y SIEMPRE','','','','',14,'',''),(15,502,'FRENTE SOCIALISTA Y POPULAR','LISTA A','','','\0','\0',15,'',''),(16,50286,'PARTIDO SOCIALISTA','LISTA FRENTE SOCIALISTA Y POPULAR','\0','\0','','',16,'',''),(17,503,'UNIDAD CIUDADANA','LISTA CELESTE Y BLANCA U','','','\0','\0',17,'',''),(18,503,'UNIDAD CIUDADANA','LISTA CELESTE Y BLANCA U2','\0','\0','','',18,'',''),(19,503,'UNIDAD CIUDADANA','LISTA 31','\0','\0','\0','',19,'',''),(20,504,'IZQUIERDA AL FRENTE POR EL SOCIALISMO','LISTA UNIDAD DE LA IZQUIERDA','','','','',20,'',''),(21,505,'FRENTE PATRIOTA BANDERA VECINAL','LISTA A-CONDUCCION','','','\0','\0',21,'',''),(22,505,'FRENTE PATRIOTA BANDERA VECINAL','LISTA B-ESPERANZA','','\0','\0','\0',22,'',''),(23,505,'FRENTE PATRIOTA BANDERA VECINAL','LISTA C-ORDEN Y SEGURIDAD','','\0','\0','\0',23,'',''),(24,505,'FRENTE PATRIOTA BANDERA VECINAL','LISTA D-SOLIDARIDAD','','\0','\0','\0',24,'',''),(25,505,'FRENTE PATRIOTA BANDERA VECINAL','LISTA E-PIONEROS','','\0','\0','\0',25,'',''),(26,505,'FRENTE PATRIOTA BANDERA VECINAL','LISTA F-SOBERANIA','','\0','\0','\0',26,'',''),(27,506,'ENC.POPULAR POR TIERRA TECHO Y TRABAJO','L.MEMORIA,VERDAD Y JUSTICIA','\0','','\0','\0',27,'',''),(28,506,'ENC.POPULAR POR TIERRA TECHO Y TRABAJO','L.POR TIERRA, TECHO Y TRABAJO','\0','\0','','\0',28,'',''),(29,507,'CREO','LISTA CONVICCIONES','','','\0','\0',29,'',''),(30,50779,'PARTIDO RENOVADOR FEDERAL','LISTA CONVICCIONES','\0','\0','','',30,'',''),(31,508,'CAMBIEMOS BUENOS AIRES','LISTA CAMBIANDO JUNTOS','','','\0','\0',31,'',''),(32,508,'CAMBIEMOS BUENOS AIRES','LISTA 1A AMARILLO','\0','\0','','',32,'',''),(33,509,'FRENTE JUSTICIALISTA','LISTA CUMPLIR','','','\0','\0',33,'',''),(34,509,'FRENTE JUSTICIALISTA','LISTA CUMPLIR 2','\0','\0','','',34,'',''),(35,509,'FRENTE JUSTICIALISTA','LISTA AMARTE ARGENTINA 32','\0','\0','\0','',35,'',''),(36,510,'FTE.DE IZQUIERDA Y DE LOS TRABAJADORES','LISTA 1','','','','',36,'',''),(37,1902,'FRENTE UNION FEDERAL','L.AUTOCTONO','\0','\0','','\0',37,'',''),(38,1902,'FRENTE UNION FEDERAL','L.DIGNIDAD POPULAR','\0','\0','','',38,'',''),(39,1902,'FRENTE UNION FEDERAL','L.FRENTE UNION FEDERAL','\0','\0','','',39,'',''),(40,1902,'FRENTE UNION FEDERAL','L.PRIMERA DAMA DEL PUEBLO','\0','\0','','\0',40,'',''),(41,1902,'FRENTE UNION FEDERAL','L.LABORISTA','\0','\0','','\0',41,'',''),(42,1902,'FRENTE UNION FEDERAL','L.POPULAR','\0','\0','','',42,'',''),(43,1902,'FRENTE UNION FEDERAL','L.RENOVACION FEDERAL','\0','\0','','\0',43,'',''),(44,1902,'FRENTE UNION FEDERAL','L.TRES BANDERAS','\0','\0','','\0',44,'',''),(45,705,'CON VOCACION POR SAN ISIDRO','LISTA EL PODER DE LOS VECINOS','\0','\0','\0','',45,'\0','\0');
/*!40000 ALTER TABLE `opcionvoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultado` (
  `idOpcionVoto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `resto` decimal(20,4) NOT NULL,
  `votos` int(11) NOT NULL,
  PRIMARY KEY (`idOpcionVoto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
INSERT INTO `resultado` VALUES (18,4,0.3369,104),(34,4,0.4332,107),(38,4,0.1765,99);
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan'),(2,'Pedro');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_consejales_listaint`
--

DROP TABLE IF EXISTS `v_consejales_listaint`;
/*!50001 DROP VIEW IF EXISTS `v_consejales_listaint`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_consejales_listaint` (
  `lista` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_consejales_localidad`
--

DROP TABLE IF EXISTS `v_consejales_localidad`;
/*!50001 DROP VIEW IF EXISTS `v_consejales_localidad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_consejales_localidad` (
  `localidad` tinyint NOT NULL,
  `agrupacion` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_consejales_localidad_reduc`
--

DROP TABLE IF EXISTS `v_consejales_localidad_reduc`;
/*!50001 DROP VIEW IF EXISTS `v_consejales_localidad_reduc`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_consejales_localidad_reduc` (
  `localidad` tinyint NOT NULL,
  `descr_agrup` tinyint NOT NULL,
  `id_agrup` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_consejales_partido`
--

DROP TABLE IF EXISTS `v_consejales_partido`;
/*!50001 DROP VIEW IF EXISTS `v_consejales_partido`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_consejales_partido` (
  `agrupacion` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_fpv_por_localidad`
--

DROP TABLE IF EXISTS `v_fpv_por_localidad`;
/*!50001 DROP VIEW IF EXISTS `v_fpv_por_localidad`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_fpv_por_localidad` (
  `localidad` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_porcentaje_escrutado`
--

DROP TABLE IF EXISTS `v_porcentaje_escrutado`;
/*!50001 DROP VIEW IF EXISTS `v_porcentaje_escrutado`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_porcentaje_escrutado` (
  `Name_exp_1` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_resultado_con`
--

DROP TABLE IF EXISTS `v_resultado_con`;
/*!50001 DROP VIEW IF EXISTS `v_resultado_con`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_resultado_con` (
  `Agrupacion` tinyint NOT NULL,
  `Concejal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_resultado_dip`
--

DROP TABLE IF EXISTS `v_resultado_dip`;
/*!50001 DROP VIEW IF EXISTS `v_resultado_dip`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_resultado_dip` (
  `Agrupacion` tinyint NOT NULL,
  `Diputados` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_resultado_leg`
--

DROP TABLE IF EXISTS `v_resultado_leg`;
/*!50001 DROP VIEW IF EXISTS `v_resultado_leg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_resultado_leg` (
  `Agrupacion` tinyint NOT NULL,
  `Legislador` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_resultados`
--

DROP TABLE IF EXISTS `v_resultados`;
/*!50001 DROP VIEW IF EXISTS `v_resultados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_resultados` (
  `Agrupacion` tinyint NOT NULL,
  `Diputados` tinyint NOT NULL,
  `Legislador` tinyint NOT NULL,
  `Consejal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_top5_listaint`
--

DROP TABLE IF EXISTS `v_top5_listaint`;
/*!50001 DROP VIEW IF EXISTS `v_top5_listaint`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_top5_listaint` (
  `lista` tinyint NOT NULL,
  `cantidad` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_votos`
--

DROP TABLE IF EXISTS `v_votos`;
/*!50001 DROP VIEW IF EXISTS `v_votos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_votos` (
  `sum(``vo``.``cantConsejal``)` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `voto`
--

DROP TABLE IF EXISTS `voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voto` (
  `idVoto` int(11) NOT NULL AUTO_INCREMENT,
  `idMesa` int(11) NOT NULL,
  `idOpcionVoto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `cantSenador` int(11) NOT NULL,
  `cantDiputado` int(11) NOT NULL,
  `cantLegislador` int(11) NOT NULL,
  `cantConsejal` int(11) NOT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idVoto`),
  UNIQUE KEY `UN_Mesa_OpcionVoto` (`idMesa`,`idOpcionVoto`),
  KEY `FK_Opcion_idx` (`idOpcionVoto`),
  KEY `FK_Mesa_idx` (`idMesa`),
  KEY `FK_Usuario_idx` (`idUsuario`),
  CONSTRAINT `FK_Mesa` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Opcion` FOREIGN KEY (`idOpcionVoto`) REFERENCES `opcionvoto` (`idOpcionVoto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15136 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voto`
--

LOCK TABLES `voto` WRITE;
/*!40000 ALTER TABLE `voto` DISABLE KEYS */;
INSERT INTO `voto` VALUES (15091,121,1,1,9,9,0,0,'2017-08-08 04:08:31'),(15092,121,2,1,9,9,9,0,'2017-08-08 04:08:31'),(15093,121,3,1,9,9,0,0,'2017-08-08 04:08:31'),(15094,121,4,1,9,9,0,0,'2017-08-08 04:08:31'),(15095,121,5,1,9,9,0,0,'2017-08-08 04:08:31'),(15096,121,6,1,9,9,0,0,'2017-08-08 04:08:31'),(15097,121,7,1,9,0,0,0,'2017-08-08 04:08:31'),(15098,121,8,1,9,0,0,0,'2017-08-08 04:08:31'),(15099,121,9,1,9,9,9,0,'2017-08-08 04:08:31'),(15100,121,10,1,9,9,9,9,'2017-08-08 04:08:31'),(15101,121,11,1,0,9,0,0,'2017-08-08 04:08:31'),(15102,121,12,1,0,0,9,3,'2017-08-08 04:08:31'),(15103,121,13,1,9,9,0,0,'2017-08-08 04:08:31'),(15104,121,14,1,9,9,9,9,'2017-08-08 04:08:31'),(15105,121,15,1,9,8,0,0,'2017-08-08 04:08:31'),(15106,121,16,1,0,0,9,8,'2017-08-08 04:08:31'),(15107,121,17,1,9,77,0,0,'2017-08-08 04:08:31'),(15108,121,18,1,0,0,9,7,'2017-08-08 04:08:31'),(15109,121,19,1,0,0,0,97,'2017-08-08 04:08:31'),(15110,121,20,1,9,79,7,9,'2017-08-08 04:08:31'),(15111,121,21,1,79,7,0,0,'2017-08-08 04:08:31'),(15112,121,22,1,9,0,0,0,'2017-08-08 04:08:31'),(15113,121,23,1,8,0,0,0,'2017-08-08 04:08:31'),(15114,121,24,1,9,0,0,0,'2017-08-08 04:08:31'),(15115,121,25,1,8,0,0,0,'2017-08-08 04:08:31'),(15116,121,26,1,98,0,0,0,'2017-08-08 04:08:31'),(15117,121,27,1,0,9,0,0,'2017-08-08 04:08:31'),(15118,121,28,1,0,0,8,0,'2017-08-08 04:08:31'),(15119,121,29,1,98,9,0,0,'2017-08-08 04:08:31'),(15120,121,30,1,0,0,8,9,'2017-08-08 04:08:31'),(15121,121,31,1,8,98,0,0,'2017-08-08 04:08:31'),(15122,121,32,1,0,0,9,8,'2017-08-08 04:08:31'),(15123,121,33,1,98,9,0,0,'2017-08-08 04:08:31'),(15124,121,34,1,0,0,8,98,'2017-08-08 04:08:31'),(15125,121,35,1,0,0,0,9,'2017-08-08 04:08:31'),(15126,121,36,1,8,98,98,9,'2017-08-08 04:08:31'),(15127,121,37,1,0,0,8,0,'2017-08-08 04:08:31'),(15128,121,38,1,0,0,98,2,'2017-08-08 04:08:31'),(15129,121,39,1,0,0,9,89,'2017-08-08 04:08:31'),(15130,121,40,1,0,0,8,0,'2017-08-08 04:08:31'),(15131,121,41,1,0,0,98,0,'2017-08-08 04:08:31'),(15132,121,42,1,0,0,9,8,'2017-08-08 04:08:31'),(15133,121,43,1,0,0,98,0,'2017-08-08 04:08:31'),(15134,121,44,1,0,0,9,0,'2017-08-08 04:08:31'),(15135,121,45,1,0,0,0,8,'2017-08-08 04:08:31');
/*!40000 ALTER TABLE `voto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_consejales_listaint`
--

/*!50001 DROP TABLE IF EXISTS `v_consejales_listaint`*/;
/*!50001 DROP VIEW IF EXISTS `v_consejales_listaint`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_consejales_listaint` AS (select concat(`op`.`agrupacion`,' - ',`op`.`listaInt`) AS `lista`,sum(`vo`.`cantConsejal`) AS `cantidad` from (`voto` `vo` join `opcionvoto` `op`) where ((`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and (`op`.`tieneConsejal` = 1) and (`op`.`esPartido` = 1)) group by `op`.`agrupacion`,`op`.`listaInt` order by sum(`vo`.`cantConsejal`) desc limit 5) union (select concat(`op`.`agrupacion`,' - ',`op`.`listaInt`) AS `lista`,sum(`vo`.`cantConsejal`) AS `cantidad` from (`voto` `vo` join `opcionvoto` `op`) where ((`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and ((`op`.`idOpcionVoto` = 9) or (`op`.`idOpcionVoto` = 10))) group by `op`.`agrupacion`,`op`.`listaInt` order by sum(`vo`.`cantConsejal`) desc limit 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_consejales_localidad`
--

/*!50001 DROP TABLE IF EXISTS `v_consejales_localidad`*/;
/*!50001 DROP VIEW IF EXISTS `v_consejales_localidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_consejales_localidad` AS select `lo`.`nombre` AS `localidad`,`op`.`agrupacion` AS `agrupacion`,sum(`vo`.`cantConsejal`) AS `cantidad` from ((((`circuito` `ci` join `localidad` `lo`) join `mesa` `me`) join `opcionvoto` `op`) join `voto` `vo`) where ((`lo`.`idLocalidad` = `ci`.`idLocalidad`) and (`ci`.`idCircuito` = `me`.`idCircuito`) and (`vo`.`idMesa` = `me`.`idMesa`) and (`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and (`op`.`esPartido` = 1) and (`op`.`esValido` = 1) and (`op`.`tieneConsejal` = 1)) group by `lo`.`nombre`,`op`.`agrupacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_consejales_localidad_reduc`
--

/*!50001 DROP TABLE IF EXISTS `v_consejales_localidad_reduc`*/;
/*!50001 DROP VIEW IF EXISTS `v_consejales_localidad_reduc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_consejales_localidad_reduc` AS select `lo`.`nombre` AS `localidad`,`op`.`agrupacion` AS `descr_agrup`,`op`.`idOpcionVoto` AS `id_agrup`,sum(`vo`.`cantConsejal`) AS `cantidad` from ((((`circuito` `ci` join `localidad` `lo`) join `mesa` `me`) join `opcionvoto` `op`) join `voto` `vo`) where ((`lo`.`idLocalidad` = `ci`.`idLocalidad`) and (`ci`.`idCircuito` = `me`.`idCircuito`) and (`vo`.`idMesa` = `me`.`idMesa`) and (`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and (`op`.`esPartido` = 1) and (`op`.`esValido` = 1) and (`op`.`tieneConsejal` = 1) and (`op`.`idOpcionVoto` in (9,10,12,13))) group by `lo`.`nombre`,`op`.`agrupacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_consejales_partido`
--

/*!50001 DROP TABLE IF EXISTS `v_consejales_partido`*/;
/*!50001 DROP VIEW IF EXISTS `v_consejales_partido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_consejales_partido` AS select `op`.`agrupacion` AS `agrupacion`,(sum(`vo`.`cantConsejal`) / ((select sum(`vo1`.`cantConsejal`) from (`voto` `vo1` join `opcionvoto` `op1`) where ((`vo1`.`idOpcionVoto` = `op1`.`idOpcionVoto`) and (`op1`.`tieneConsejal` = 1))) / 100)) AS `cantidad` from (`voto` `vo` join `opcionvoto` `op`) where ((`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and (`op`.`tieneConsejal` = 1)) group by `op`.`agrupacion` order by (sum(`vo`.`cantConsejal`) / ((select sum(`vo1`.`cantConsejal`) from (`voto` `vo1` join `opcionvoto` `op1`) where ((`vo1`.`idOpcionVoto` = `op1`.`idOpcionVoto`) and (`op1`.`tieneConsejal` = 1))) / 100)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_fpv_por_localidad`
--

/*!50001 DROP TABLE IF EXISTS `v_fpv_por_localidad`*/;
/*!50001 DROP VIEW IF EXISTS `v_fpv_por_localidad`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_fpv_por_localidad` AS select `lo`.`nombre` AS `localidad`,sum(`vo`.`cantConsejal`) AS `cantidad` from ((((`circuito` `ci` join `localidad` `lo`) join `mesa` `me`) join `opcionvoto` `op`) join `voto` `vo`) where ((`lo`.`idLocalidad` = `ci`.`idLocalidad`) and (`ci`.`idCircuito` = `me`.`idCircuito`) and (`vo`.`idMesa` = `me`.`idMesa`) and (`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and (`op`.`esPartido` = 1) and (`op`.`esValido` = 1) and (`op`.`tieneConsejal` = 1) and (`op`.`idOpcionVoto` = 9)) group by `lo`.`nombre`,`op`.`agrupacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_porcentaje_escrutado`
--

/*!50001 DROP TABLE IF EXISTS `v_porcentaje_escrutado`*/;
/*!50001 DROP VIEW IF EXISTS `v_porcentaje_escrutado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_porcentaje_escrutado` AS select (((select count(distinct `me`.`idMesa`) from (`mesa` `me` join `voto` `vo`) where (`me`.`idMesa` = `vo`.`idMesa`)) / (select count(`me`.`idMesa`) from `mesa` `me`)) * 100) AS `Name_exp_1` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_resultado_con`
--

/*!50001 DROP TABLE IF EXISTS `v_resultado_con`*/;
/*!50001 DROP VIEW IF EXISTS `v_resultado_con`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resultado_con` AS select `ov`.`agrupacion` AS `Agrupacion`,sum(`vo`.`cantConsejal`) AS `Concejal` from (`opcionvoto` `ov` join `voto` `vo`) where ((`ov`.`idOpcionVoto` = `vo`.`idOpcionVoto`) and (`ov`.`esPartido` = 1)) group by `ov`.`agrupacion` order by sum(`vo`.`cantConsejal`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_resultado_dip`
--

/*!50001 DROP TABLE IF EXISTS `v_resultado_dip`*/;
/*!50001 DROP VIEW IF EXISTS `v_resultado_dip`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resultado_dip` AS select `ov`.`agrupacion` AS `Agrupacion`,sum(`vo`.`cantDiputado`) AS `Diputados` from (`opcionvoto` `ov` join `voto` `vo`) where ((`ov`.`idOpcionVoto` = `vo`.`idOpcionVoto`) and (`ov`.`esPartido` = 1)) group by `ov`.`agrupacion` order by sum(`vo`.`cantDiputado`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_resultado_leg`
--

/*!50001 DROP TABLE IF EXISTS `v_resultado_leg`*/;
/*!50001 DROP VIEW IF EXISTS `v_resultado_leg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resultado_leg` AS select `ov`.`agrupacion` AS `Agrupacion`,sum(`vo`.`cantLegislador`) AS `Legislador` from (`opcionvoto` `ov` join `voto` `vo`) where ((`ov`.`idOpcionVoto` = `vo`.`idOpcionVoto`) and (`ov`.`esPartido` = 1)) group by `ov`.`agrupacion` order by sum(`vo`.`cantLegislador`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_resultados`
--

/*!50001 DROP TABLE IF EXISTS `v_resultados`*/;
/*!50001 DROP VIEW IF EXISTS `v_resultados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_resultados` AS select `ov`.`agrupacion` AS `Agrupacion`,sum(`vo`.`cantDiputado`) AS `Diputados`,sum(`vo`.`cantLegislador`) AS `Legislador`,sum(`vo`.`cantConsejal`) AS `Consejal` from (`opcionvoto` `ov` join `voto` `vo`) where (`ov`.`idOpcionVoto` = `vo`.`idOpcionVoto`) group by `ov`.`agrupacion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_top5_listaint`
--

/*!50001 DROP TABLE IF EXISTS `v_top5_listaint`*/;
/*!50001 DROP VIEW IF EXISTS `v_top5_listaint`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_top5_listaint` AS select concat(`op`.`agrupacion`,' - ',`op`.`listaInt`) AS `lista`,sum(`vo`.`cantConsejal`) AS `cantidad` from (`voto` `vo` join `opcionvoto` `op`) where ((`vo`.`idOpcionVoto` = `op`.`idOpcionVoto`) and (`op`.`tieneConsejal` = 1) and (`op`.`esPartido` = 1) and (`op`.`idOpcionVoto` <> 9) and (`op`.`idOpcionVoto` <> 10)) group by `op`.`agrupacion`,`op`.`listaInt` order by sum(`vo`.`cantConsejal`) desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_votos`
--

/*!50001 DROP TABLE IF EXISTS `v_votos`*/;
/*!50001 DROP VIEW IF EXISTS `v_votos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_votos` AS select sum(`vo`.`cantConsejal`) AS `sum(``vo``.``cantConsejal``)` from (`opcionvoto` `ov` join `voto` `vo`) where ((`ov`.`idOpcionVoto` = `vo`.`idOpcionVoto`) and (`ov`.`esPartido` = 1) and (`ov`.`tieneConsejal` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-08  1:26:01
