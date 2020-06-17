-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: carritocompras
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Current Database: `carritocompras`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `carritocompras` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `carritocompras`;

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogo` (
  `id_cat` smallint(6) NOT NULL AUTO_INCREMENT,
  `des_cat` varchar(100) NOT NULL,
  `img_cat` varchar(300) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
INSERT INTO `catalogo` VALUES (5,'Bebes','https://i.pinimg.com/originals/21/98/80/219880367fe9b1ef97caca1b66f9a697.jpg'),(7,'Damas','https://i.ytimg.com/vi/V6NnweIhXbw/hqdefault.jpg'),(11,'Niños','https://zapachic.com/wp-content/uploads/2014/07/5-zapatos-Terra-para-ni%C3%B1o-con-estilo-n%C3%A1utico-en-colores-cl%C3%A1sicos-.jpg'),(12,'Niñas','https://zapachic.com/wp-content/uploads/2013/08/2-cat%C3%A1logo-Cklass-ni%C3%B1os-2013-ni%C3%B1as-balerinas.jpg'),(13,'Caballeros','https://zapachic.com/wp-content/uploads/2015/01/Zapatos-de-vestir-en-Cklass-Caballero-2015.jpg');
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_cae` smallint(6) NOT NULL AUTO_INCREMENT,
  `des_cae` varchar(100) NOT NULL,
  `id_cat` smallint(6) NOT NULL,
  PRIMARY KEY (`id_cae`),
  KEY `fk4` (`id_cat`),
  CONSTRAINT `fk4` FOREIGN KEY (`id_cat`) REFERENCES `catalogo` (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (11,'Casual',7),(14,'Escolar',11),(16,'Tenis',11),(17,'Tenis',12),(18,'Zapatillas',7);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcionventa`
--

DROP TABLE IF EXISTS `descripcionventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descripcionventa` (
  `id_dev` bigint(20) NOT NULL AUTO_INCREMENT,
  `fec_dev` datetime NOT NULL,
  `fol_dev` varchar(7) NOT NULL,
  `tot_dev` decimal(20,2) NOT NULL,
  `sub_dev` decimal(20,2) NOT NULL,
  `iva_dev` decimal(20,2) NOT NULL,
  `id_dez` bigint(20) NOT NULL,
  `id_usu` bigint(20) NOT NULL,
  `id_pag` bigint(20) NOT NULL,
  `can_dev` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_dev`),
  KEY `fk12` (`id_dez`),
  KEY `fk13` (`id_usu`),
  KEY `fk14` (`id_pag`),
  CONSTRAINT `fk12` FOREIGN KEY (`id_dez`) REFERENCES `descripcionzapato` (`id_dez`),
  CONSTRAINT `fk13` FOREIGN KEY (`id_usu`) REFERENCES `usuario` (`id_usu`),
  CONSTRAINT `fk14` FOREIGN KEY (`id_pag`) REFERENCES `pago` (`id_pag`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcionventa`
--

LOCK TABLES `descripcionventa` WRITE;
/*!40000 ALTER TABLE `descripcionventa` DISABLE KEYS */;
INSERT INTO `descripcionventa` VALUES (21,'2019-05-11 00:22:40','FL0068',600.00,504.00,96.00,6,4,2,4),(22,'2019-05-11 00:23:11','FL0069',450.00,378.00,72.00,6,4,2,3);
/*!40000 ALTER TABLE `descripcionventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descripcionzapato`
--

DROP TABLE IF EXISTS `descripcionzapato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descripcionzapato` (
  `id_dez` bigint(20) NOT NULL AUTO_INCREMENT,
  `mod_dez` varchar(100) NOT NULL,
  `can_dez` smallint(6) NOT NULL,
  `pre_dez` decimal(10,2) DEFAULT NULL,
  `des_dez` varchar(200) NOT NULL,
  `id_tal` bigint(20) NOT NULL,
  `id_mar` bigint(20) NOT NULL,
  `id_cae` smallint(6) NOT NULL,
  `img_dez` varchar(200) NOT NULL,
  PRIMARY KEY (`id_dez`),
  KEY `fk5` (`id_tal`),
  KEY `fk6` (`id_mar`),
  KEY `fk7` (`id_cae`),
  CONSTRAINT `fk5` FOREIGN KEY (`id_tal`) REFERENCES `talla` (`id_tal`),
  CONSTRAINT `fk6` FOREIGN KEY (`id_mar`) REFERENCES `marca` (`id_mar`),
  CONSTRAINT `fk7` FOREIGN KEY (`id_cae`) REFERENCES `categoria` (`id_cae`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descripcionzapato`
--

LOCK TABLES `descripcionzapato` WRITE;
/*!40000 ALTER TABLE `descripcionzapato` DISABLE KEYS */;
INSERT INTO `descripcionzapato` VALUES (6,'CD0001',18,150.00,'Tacon de 30 cm color rojo',28,2,18,'http://www.johnappleman.com/applemanmagazine/wp-content/uploads/2016/04/pedro-alpera-gif-animados-diseno.gif'),(7,'CD0001',38,380.00,'Tacon grande con suela roja',24,2,18,'isjoisdcoudhcius'),(8,'CD0002',50,700.00,'Color blanco con franjas rosas',20,6,17,'aosijxsoijx'),(13,'CD0003',26,600.00,'Zapato negro de Charol',20,6,17,'sfhisdufh'),(14,'CD0004',1,800.00,'dpifjsodfhsudhf',3,2,16,'dpijsodijfosidjf'),(19,'dsdfsd',52,852.00,'sdfsdfdf',17,2,11,'dfsdf');
/*!40000 ALTER TABLE `descripcionzapato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id_mar` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_mar` varchar(100) NOT NULL,
  `dir_mar` varchar(300) NOT NULL,
  PRIMARY KEY (`id_mar`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (2,'Andrea','nosex2'),(6,'Flexi','nose'),(7,'Adidas','nosex3'),(9,'Nike','nosex4'),(11,'fddfsdf','sdfsdfsdf');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero`
--

DROP TABLE IF EXISTS `numero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numero` (
  `num_num` varchar(50) NOT NULL,
  PRIMARY KEY (`num_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero`
--

LOCK TABLES `numero` WRITE;
/*!40000 ALTER TABLE `numero` DISABLE KEYS */;
INSERT INTO `numero` VALUES ('FL0069');
/*!40000 ALTER TABLE `numero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `id_pag` bigint(20) NOT NULL AUTO_INCREMENT,
  `des_pag` varchar(30) NOT NULL,
  PRIMARY KEY (`id_pag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'PayPal'),(2,'Tarjeta de Debito o Credito'),(3,'Efectivo');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id_sex` bigint(20) NOT NULL AUTO_INCREMENT,
  `des_sex` varchar(20) NOT NULL,
  PRIMARY KEY (`id_sex`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'Femenino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talla` (
  `id_tal` bigint(20) NOT NULL AUTO_INCREMENT,
  `des_tal` varchar(30) NOT NULL,
  PRIMARY KEY (`id_tal`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
INSERT INTO `talla` VALUES (3,'11'),(4,'11.5'),(5,'12'),(6,'12.5'),(7,'13'),(8,'13.5'),(9,'14'),(10,'14.5'),(11,'15'),(12,'15.5'),(13,'16'),(14,'16.5'),(15,'17.5'),(16,'17'),(17,'18'),(18,'18.5'),(19,'19'),(20,'20'),(21,'21'),(22,'20.5'),(23,'21.5'),(24,'22'),(25,'22.5'),(26,'23'),(27,'23.5'),(28,'24'),(29,'24.5'),(30,'25'),(31,'25.5'),(32,'26'),(33,'26.5'),(34,'27'),(35,'27.5'),(36,'28'),(37,'29'),(38,'28.5'),(39,'29.5'),(40,'30'),(41,'30.5'),(42,'31'),(43,'31.5'),(44,'32'),(46,'10'),(47,'10.5');
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `id_tip` bigint(20) NOT NULL AUTO_INCREMENT,
  `des_tip` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'Administrador'),(3,'Usuario');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usu` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom_usu` varchar(30) NOT NULL,
  `app_usu` varchar(30) NOT NULL,
  `apm_usu` varchar(30) NOT NULL,
  `usu_usu` varchar(30) NOT NULL,
  `pas_usu` varchar(30) NOT NULL,
  `id_sex` bigint(20) NOT NULL,
  `id_tip` bigint(20) NOT NULL,
  PRIMARY KEY (`id_usu`),
  KEY `fk1` (`id_sex`),
  KEY `fk2` (`id_tip`),
  CONSTRAINT `fk1` FOREIGN KEY (`id_sex`) REFERENCES `sexo` (`id_sex`),
  CONSTRAINT `fk2` FOREIGN KEY (`id_tip`) REFERENCES `tipousuario` (`id_tip`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Angel','Rodriguez','Rodriguez','Admon','poder',1,1),(2,'Angel','Rodriguez','Rodriguez','Admon2','poder',1,1),(4,'Gabriel','Rodriguez','Rodriguez','Alucard','hola',1,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-11  2:02:07
