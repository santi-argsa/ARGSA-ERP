-- MySQL dump 10.13  Distrib 5.5.47, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: argsa
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb8u1

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
-- Table structure for table `cajas`
--

DROP TABLE IF EXISTS `cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajas` (
  `id_caja` double NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `turno` varchar(8) DEFAULT NULL,
  `estado` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
/*INSERT INTO `cajas` VALUES (13,'2016-04-26','T',2),(15,'2016-04-26','T',2),(18,'2016-04-27','T',1);*/
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaciones`
--



DROP TABLE IF EXISTS `ventas`;

CREATE TABLE `ventas`(
`id_venta` double NOT NULL AUTO_INCREMENT,
`fecha` date DEFAULT NULL,
`estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operaciones` (
  `id_operacion` double NOT NULL AUTO_INCREMENT,
  `codigobarra` varchar(64) DEFAULT NULL,
  `cantvend` varchar(32) DEFAULT NULL,
  `precioprod` varchar(32) DEFAULT NULL,
  `monto` varchar(32) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_operacion`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
/*INSERT INTO `operaciones` VALUES (84,'754125','25','150','3750',NULL),(85,'123456','36','150','5400',NULL),(86,'789632541','9512','255','2425560',NULL),(87,'75321698','5','93','465',NULL),(88,'123456','36','150','450',NULL),(89,'754125','25','150','2250',NULL),(90,'123456','36','150','3750',NULL),(91,'123456','36','150','3750',NULL),(92,'123456','36','150','3750',NULL),(93,'123456','36','150','3750',NULL),(94,'123456','36','150','150',NULL),(95,'123456','36','150','150',NULL),(96,'123456','36','150','150',NULL),(97,'123456','36','150','150',NULL),(98,'123456','36','150','150',NULL),(99,'123456','36','150','150',NULL),(100,'123456','36','150','150',NULL),(101,'123456','36','150','150',NULL),(102,'123456','36','150','150',NULL),(103,'123456','36','150','150',NULL),(104,'123456','36','150','150',NULL),(105,'123456','','150','150',NULL),(106,'123456','36','150','150',NULL),(107,'123456','36','150','150',NULL),(108,'123456','36','150','150',NULL),(109,'123456','36','150','150',NULL),(110,'123456','36','150','150',NULL),(111,'123456','36','150','150',NULL),(112,'754125','25','150','300',NULL),(113,'123456','36','150','150',NULL),(114,'123456','36','150','150',NULL),(118,'123456','36','150','150',NULL),(119,'123456','36','150','150',NULL),(120,'754125','25','150','2250',NULL),(121,'123456','36','150','150',NULL),(122,'754125','25','150','2250',NULL),(123,'123456','36','150','150',NULL),(124,'754125','25','150','150',NULL),(125,'123456','36','150','150',NULL),(126,'123456','36','150','150',NULL),(127,'123456','36','150','150',NULL),(128,'123456','36','150','150',NULL),(129,'123456','36','150','150',NULL),(130,'123456','36','150','150',NULL),(131,'123456','36','150','150',NULL),(132,'123456','36','150','150',NULL),(133,'123456','36','150','150',NULL),(134,'754125','25','150','150',NULL),(135,'123456','36','150','450',NULL),(136,'754125','25','150','900',NULL),(137,'123456','36','150','150',NULL),(138,'123456','36','150','150',NULL),(139,'123456','36','150','150',NULL),(140,'123456','6','150','900',NULL),(141,'123456','1','150','150',NULL),(142,'123456','1','150','150',NULL),(143,'123456','1','150','150',NULL),(144,'123456','1','150','150',NULL),(145,'123456','1','150','150',NULL),(146,'123456','5','150','750',NULL),(147,'123456','1','150','150',NULL),(148,'123456','1','150','150',NULL),(149,'123456','1','150','150',NULL),(150,'754125','1','150','150',NULL),(151,'754125','1','150','150',NULL),(152,'754125','1','150','150',NULL),(153,'123456','1','150','150',NULL),(154,'123456','1','150','150',NULL),(155,'123456','1','150','150',NULL),(156,'123456','1','150','150',NULL),(161,'123456','1','150','150',NULL),(163,'123456','1','150','150',NULL),(166,'123456','1','150','150',NULL),(173,'123456','1','150','150',NULL),(175,'123456','2','150','300',NULL),(177,'123456','1','150','150',NULL),(179,'123456','1','150','150',NULL),(181,'123456','1','150','150',NULL),(183,'123456','1','150','150',NULL),(185,'123456','1','150','150',NULL),(187,'123456','1','150','150',NULL),(189,'123456','1','150','150',NULL),(191,'123456','1','150','150',NULL),(193,'123456','1','150','150',NULL),(195,'123456','1','60','60',NULL),(196,'123456','1','60','60',NULL),(197,'754125','1','80','80',NULL),(199,'123456','1','60','60',NULL),(200,'754125','14','80','1120',NULL),(202,'123456','1','60','60',NULL),(203,'123456','11','60','660',NULL),(205,'123456','1','60','60',NULL),(207,'123456','1','60','60',NULL),(209,'123456','1','60','60',NULL),(211,'123456','1','60','60',NULL),(213,'123456','1','60','60',NULL),(215,'98765','1','46','46',NULL),(216,'98765','45','46','2070',NULL),(217,'123456','1','60','60',NULL),(219,'678','50','10','500',NULL),(221,'678','1','10','10',NULL),(223,'123456','1','60','60',NULL),(225,'123456','1','60','60',NULL),(227,'678','1','10','10',NULL),(228,'123456','1','60','60',NULL),(230,'123456','1','60','60',NULL),(232,'789632541','1','99','99',0),(234,'123456','1','60','60',0),(236,'75321698','1','99','99',0),(238,'123456','1','60','60',0),(240,'75321698','1','99','99',0),(242,'123456','1','60','60',0),(244,'754125','1','80','80',0),(246,'678','1','10','10',0),(248,'678','1','10','10',0),(250,'754125','1','80','80',0),(252,'999999999','1','999','999',0),(254,'678','1','10','10',0),(256,'123456','1','60','60',13),(258,'678','3','10','30',13),(259,'789632541','1','99','99',13),(260,'123456','1','60','60',13),(262,'7792798007493','1','45','45',13),(263,'7792860001114','1','14','14',13),(264,'7790580252809','1','11','11',13),(265,'7790895009235','1','30','30',13),(266,'7798171930013','1','35','35',13),(268,'754125','1','80','80',0),(269,'77900845','1','15','15',0),(271,'7790895008498','1','40','40',0),(272,'13','1','20','20',0),(274,'754125','1','80','80',15),(276,'789632541','1','99','99',15),(277,'678','1','10','10',15),(278,'7790895640452','1','28','28',15),(280,'123456','1','60','60',15),(281,'789632541','1','99','99',15),(282,'98765','1','46','46',15),(283,'123456','1','60','60',15),(284,'7790895641237','1','38','38',15),(285,'7790895003875','1','32','32',15),(286,'123456','1','60','60',15),(287,'7790380002734','1','11','11',15),(288,'123456','1','60','60',15),(289,'123456','1','60','60',15),(290,'123456','1','60','60',15),(291,'123456','1','60','60',15),(292,'98765','1','46','46',15),(293,'98765','1','46','46',15),(294,'98765','1','46','46',15),(295,'98765','1','46','46',15),(296,'98765','1','46','46',15),(297,'123456','1','60','60',15),(298,'77933911','1','18','18',15),(299,'7790580697303','123','25','3075',15),(300,'999999999','135','999','134865',15),(301,'754125','1','80','80',15),(302,'7790895000430','1','45','45',15),(303,'7790895000430','1','45','45',15),(304,'7790895640476','1','40','40',15),(305,'13','6','20','120',15),(306,'789632541','135','99','13365',0),(307,'27','46','1025','47150',0),(308,'27','1','1025','1025',0),(309,'7790040374706','1','17','17',18);*/
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigobarra` varchar(32) DEFAULT NULL,
  `nombre` varchar(32) DEFAULT NULL,
  `preciocompra` float DEFAULT NULL,
  `stockexistente` int(11) DEFAULT NULL,
  `precioventa` float DEFAULT NULL,
  `imagen` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` longtext,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'754125','SHAMPOO XXL2',150,147,80,'shampo.jpg',NULL,NULL),(2,'123456','ACONDICIONADOR XXL2',150,142,30,'shampo.jpg',NULL,NULL),(3,'789632541','AFEITADORA RELD',255,13,99,'shampo.jpg',NULL,NULL),(4,'75321698','TIJERA SOLARD',93,150,99,'shampo.jpg',NULL,NULL),(5,'678','DESODORANTE',6,149,33,'sinfoto.jpg','1','PROBANDO'),(6,'98765','CHEETOS',15,144,46,'shampo.jpg','1','CHEETOS'),(7,'999999999','DEFAULT',999,15,59,'shampo.jpg','2',''),(8,'7790580697303','SALADIX CAJA',15,27,25,'shampo.jpg',NULL,NULL),(9,'7792860001114','PICODULCE',4,149,14,'shampo.jpg',NULL,NULL),(10,'7790580252809','CHUPETIN POPS',1,149,11,'shampo.jpg',NULL,NULL),(11,'7790380002734','FLIN PAFF',1,149,11,'shampo.jpg',NULL,NULL),(12,'7791249450222','CHICLE BAZOOKA   MENTA',1,150,11,'shampo.jpg',NULL,NULL),(13,'7791249450239','CHICLE BAZOOKA   FRUTAL',1,150,11,'shampo.jpg',NULL,NULL),(14,'7790895008498','AQUARIUSLIMON',30,149,40,'shampo.jpg',NULL,NULL),(15,'7792798007493','BRAHMA',35,149,45,'shampo.jpg',NULL,NULL),(16,'7792798007387','QUILMES',35,150,45,'shampo.jpg',NULL,NULL),(17,'7790895005374','COCA VIDRIO',30,150,40,'shampo.jpg',NULL,NULL),(18,'7790895006968','COCA CHICA',20,150,30,'shampo.jpg',NULL,NULL),(19,'7790895006975','COCA-LIGHT CHICA',20,150,30,'shampo.jpg',NULL,NULL),(20,'7790895007439','SPRITE CHICA',20,150,30,'shampo.jpg',NULL,NULL),(21,'7790895003875','AGUA GRANDE',22,149,32,'shampo.jpg',NULL,NULL),(22,'7790895003868','AGUA CHICA',12,150,22,'shampo.jpg',NULL,NULL),(23,'7790895000447','SPRITE',35,150,45,'shampo.jpg',NULL,NULL),(24,'7790895003943','SODITA',12,150,22,'shampo.jpg',NULL,NULL),(25,'7790895006029','POWER AZUL',30,150,40,'shampo.jpg',NULL,NULL),(26,'7790895006104','POWER ROJO',30,150,40,'shampo.jpg',NULL,NULL),(27,'7790895000430','COCA PLASTICO',35,148,45,'shampo.jpg',NULL,NULL),(28,'7790895001260','VITAMINWATER VIOLETA',24,150,34,'shampo.jpg',NULL,NULL),(29,'7798171930013','ENERGIZANTE AMARILLO',25,149,35,'shampo.jpg',NULL,NULL),(30,'7793147001179','PALERMO',32,150,42,'shampo.jpg',NULL,NULL),(31,'7790895640476','AQUARIUS PERA',30,149,40,'shampo.jpg',NULL,NULL),(32,'7790895641237','AQUARIUS NARANJA',28,149,38,'shampo.jpg',NULL,NULL),(33,'7790895641220','AQUARIUS UVA',30,150,40,'shampo.jpg',NULL,NULL),(34,'7790895640483','AQUARIUS MANZANA',30,150,40,'shampo.jpg',NULL,NULL),(35,'7790895004049','AQUARIUS ROSADO',28,150,38,'shampo.jpg',NULL,NULL),(36,'7790895640490','AQUARIUS AMARILLO',30,150,40,'shampo.jpg',NULL,NULL),(37,'7790895640452','AQ. 600 MANZANA',18,149,28,'shampo.jpg',NULL,NULL),(38,'7790895640469','AQ. 600 AMARILLO',18,150,28,'shampo.jpg',NULL,NULL),(39,'7790895641213','AQ. 600 NARANJA',18,150,28,'shampo.jpg',NULL,NULL),(40,'11','PATY COMPLETO',30,150,40,'shampo.jpg',NULL,NULL),(41,'2','PANCHO',18,150,28,'shampo.jpg',NULL,NULL),(42,'4','MILACARNE COMPLETA',30,150,40,'shampo.jpg',NULL,NULL),(43,'20','MILAPOLLO SIMPLE',26,150,36,'shampo.jpg',NULL,NULL),(44,'21','MILAPOLLO COMPLETA',30,150,40,'shampo.jpg',NULL,NULL),(45,'24','BONDIOLA COMPLETA',35,150,45,'shampo.jpg',NULL,NULL),(46,'7','PIZZA ',65,150,75,'shampo.jpg',NULL,NULL),(47,'8','PIZZETA',20,150,30,'shampo.jpg',NULL,NULL),(48,'13','EMPANADAS',10,143,20,'shampo.jpg',NULL,NULL),(49,'14','PEBETE',20,150,30,'shampo.jpg',NULL,NULL),(50,'18','MEDIALUNA SIMPLE',6,150,16,'shampo.jpg',NULL,NULL),(51,'19','MEDIALUNA J/Q',8,150,18,'shampo.jpg',NULL,NULL),(52,'9','PORCION PIZZA',10,150,20,'shampo.jpg',NULL,NULL),(53,'15','CAFE',15,150,25,'shampo.jpg',NULL,NULL),(54,'16','CAFE C/LECHE',15,150,25,'shampo.jpg',NULL,NULL),(55,'17','TE',10,150,20,'shampo.jpg',NULL,NULL),(56,'77980212','ALFAJOR BLANCO',5,150,15,'shampo.jpg',NULL,NULL),(57,'77980229','ALFAJOR CHOCOLATE',5,150,15,'shampo.jpg',NULL,NULL),(58,'25','SNACK $10',10,150,20,'shampo.jpg',NULL,NULL),(59,'26','SNACK $12',12,150,22,'shampo.jpg',NULL,NULL),(60,'7795735000335','DONSATUR DULCE',15,150,25,'shampo.jpg',NULL,NULL),(61,'7795735000328','DONSATUR SALADA',15,150,25,'shampo.jpg',NULL,NULL),(62,'7794700000011','TUTUCA',8,150,18,'shampo.jpg',NULL,NULL),(63,'7790040374706','SALADIXBOLSA DUO',7,149,17,'shampo.jpg',NULL,NULL),(64,'7790580387105','SALADIXBOLSA JAMON',7,150,17,'shampo.jpg',NULL,NULL),(65,'7795522000524','TURRON PALMESANO',3,150,13,'shampo.jpg',NULL,NULL),(66,'77940148','TURRON MISKY',4,150,14,'shampo.jpg',NULL,NULL),(67,'77995681','RHODESIA',6,150,16,'shampo.jpg',NULL,NULL),(68,'7790250000358','PAÃ±UELITOS ELITE',4,150,14,'shampo.jpg',NULL,NULL),(69,'7798137710017','PAÃ±UELITOS BLUESOFT',4,150,14,'shampo.jpg',NULL,NULL),(70,'77942654','SHAMPOO',4,150,14,'shampo.jpg',NULL,NULL),(71,'77942661','ACONDICIONADOR ',4,150,14,'shampo.jpg',NULL,NULL),(72,'77942371','BELDENT MENTA (VERDE)',8,150,18,'shampo.jpg',NULL,NULL),(73,'77944276','BELDENT GLOBO (ROSA)',8,150,18,'shampo.jpg',NULL,NULL),(74,'7790580387006','SALADIXBOLSA PIZZA',7,150,17,'shampo.jpg',NULL,NULL),(75,'27','GOMITAS',25,103,1025,'shampo.jpg',NULL,NULL),(76,'77900845','TITA',5,149,15,'shampo.jpg',NULL,NULL),(77,'7798137710024','BLUESOTT',4,150,14,'shampo.jpg',NULL,NULL),(78,'7790580100940','CHUPETIN POPS',1,150,11,'shampo.jpg',NULL,NULL),(79,'28','CARAMELO',25,150,35,'shampo.jpg',NULL,NULL),(80,'77933911','HALLS AZUL',8,149,18,'shampo.jpg',NULL,NULL),(81,'7790580103446','CHOCOLATE',20,150,30,'shampo.jpg',NULL,NULL),(82,'7790895009235','NARANJA 600',20,149,30,'shampo.jpg',NULL,NULL),(83,'7790895009211','MANZANA 600',20,150,30,'shampo.jpg',NULL,NULL),(84,'7790895009228','AMARILLO 600',20,150,30,'shampo.jpg',NULL,NULL),(85,'7798061220057','CIMES S/GAS 600',15,150,25,'shampo.jpg',NULL,NULL),(86,'7790895009051','AQ. MULTIFRUTA',30,150,40,'shampo.jpg',NULL,NULL),(87,'7798061220033','CIMES GRANDE S/GAS',25,150,35,'shampo.jpg',NULL,NULL),(88,'7790580716707','SALADIX CAJA JAMON',20,150,30,'shampo.jpg',NULL,NULL),(89,'77942630','SHAMPOO CERAMIDA',5,150,15,'shampo.jpg',NULL,NULL),(90,'77933904','HALLS MENTOL',8,150,18,'shampo.jpg',NULL,NULL),(91,'77912732','HALLS CERESA',8,150,18,'shampo.jpg',NULL,NULL),(92,'77905291','HALLS MIEL',8,150,18,'shampo.jpg',NULL,NULL),(93,'7790828101548','JABON KENYA',8,150,18,'shampo.jpg',NULL,NULL),(94,'7790168114000','VINO COLON',60,150,70,'shampo.jpg',NULL,NULL),(95,'7790290000523','MEDIDA BRANCA',25,150,35,'shampo.jpg',NULL,NULL),(96,'7792410010009','MEDIDA WHISKEY',45,150,55,'shampo.jpg',NULL,NULL),(97,'23','CHORIPAN',20,150,30,'shampo.jpg',NULL,NULL),(98,'7793147000899','HEINEKEN',45,150,55,'shampo.jpg',NULL,NULL),(99,'7792170002016','GATORADE NARANJA',25,150,35,'shampo.jpg',NULL,NULL),(100,'7790975000312','VALMONT',90,150,100,'shampo.jpg',NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (0,'Agustin','malvinas','alecci.agustin@argsa.com.ar'),(1,'Santiago','malvinas','lucente.santiago@argsa.com.ar');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'argsa'
--

--
-- Dumping routines for database 'argsa'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_abrir_caja` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abrir_caja`(IN `fecha_v` DATE, IN `turno_v` VARCHAR(8), IN `estado_v` INT)
BEGIN

INSERT INTO cajas (fecha, turno, estado) values(fecha_v, turno_v, estado_v);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_caja_abierta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_caja_abierta`()
BEGIN
SELECT id_caja from cajas where estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-27  1:24:15
