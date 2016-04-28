CREATE DATABASE  IF NOT EXISTS `almacenp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `almacenp`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: argsa.com.ar    Database: almacenp
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
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajas`
--

LOCK TABLES `cajas` WRITE;
/*!40000 ALTER TABLE `cajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(32) DEFAULT NULL,
  `descripcion_producto` varchar(64) DEFAULT NULL,
  `foto_categoria` varchar(32) DEFAULT NULL,
  `activo_categoria` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_proveedor`
--

DROP TABLE IF EXISTS `compras_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras_proveedor` (
  `id_compra_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `valor_compra` float DEFAULT NULL,
  `cantidad_compra` float DEFAULT NULL,
  `fecha_compra` date DEFAULT '2016-01-01',
  `id_producto_compra` int(11) DEFAULT NULL,
  `id_proveedor_compra` int(11) DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `precio_compra` float DEFAULT NULL,
  PRIMARY KEY (`id_compra_proveedor`),
  KEY `id_producto_compra` (`id_producto_compra`),
  KEY `id_proveedor_compra` (`id_proveedor_compra`),
  CONSTRAINT `compras_proveedor_ibfk_1` FOREIGN KEY (`id_producto_compra`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `compras_proveedor_ibfk_2` FOREIGN KEY (`id_proveedor_compra`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_proveedor`
--

LOCK TABLES `compras_proveedor` WRITE;
/*!40000 ALTER TABLE `compras_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id_empleados` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(32) DEFAULT NULL,
  `apellido_empleado` varchar(32) DEFAULT NULL,
  `id_perfil_empleado` int(11) DEFAULT NULL,
  `usuario_empleado` varchar(32) DEFAULT NULL,
  `contrasena_empleado` varchar(32) DEFAULT NULL,
  `foto_empleado` varchar(32) DEFAULT NULL,
  `activo_empleado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_empleados`),
  KEY `id_perfil_empleado` (`id_perfil_empleado`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_perfil_empleado`) REFERENCES `perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastos` (
  `id_gastos` int(11) NOT NULL AUTO_INCREMENT,
  `concepto_gasto` varchar(64) DEFAULT NULL,
  `valor_gasto` float DEFAULT NULL,
  `id_compra` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_gastos`),
  KEY `id_compra` (`id_compra`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compras_proveedor` (`id_compra_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(32) DEFAULT NULL,
  `foto_marca` varchar(32) DEFAULT NULL,
  `activo_marca` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaciones`
--

DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operaciones` (
  `id_operacion` double NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_perfil` int(11) DEFAULT NULL,
  `nivel_perfil` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(64) DEFAULT NULL,
  `descripcion_producto` varchar(128) DEFAULT NULL,
  `precio_producto` float DEFAULT '0',
  `stock_producto` int(11) DEFAULT NULL,
  `id_categoria_producto` int(11) DEFAULT NULL,
  `id_marcar_producto` int(11) DEFAULT NULL,
  `id_ultimo_proveedor` int(11) DEFAULT NULL,
  `fecha_alta_producto` date DEFAULT '2016-01-01',
  `foto_producto` varchar(32) DEFAULT NULL,
  `activo_producto` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria_producto` (`id_categoria_producto`),
  KEY `id_marcar_producto` (`id_marcar_producto`),
  KEY `id_ultimo_proveedor` (`id_ultimo_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria_producto`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_marcar_producto`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_ultimo_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promociones` (
  `id_promocion` double NOT NULL AUTO_INCREMENT,
  `descripcion_promocion` varchar(32) DEFAULT NULL,
  `fecha_inicio_promocion` date DEFAULT '2016-01-01',
  `fecha_fin_promocion` date DEFAULT '2016-01-01',
  `activo_promocion` tinyint(1) DEFAULT '1',
  `id_tipo_promociones` int(11) NOT NULL,
  PRIMARY KEY (`id_promocion`),
  KEY `id_tipo_promociones` (`id_tipo_promociones`),
  CONSTRAINT `promociones_ibfk_1` FOREIGN KEY (`id_tipo_promociones`) REFERENCES `tipo_promociones` (`id_tipo_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(64) DEFAULT NULL,
  `descripcion_producto` varchar(128) DEFAULT NULL,
  `nombre_contacto` varchar(32) DEFAULT NULL,
  `email_contacto` varchar(64) DEFAULT NULL,
  `direccion_contacto` varchar(128) DEFAULT NULL,
  `telefono_contacto1` varchar(32) DEFAULT NULL,
  `telefono_contacto2` varchar(32) DEFAULT NULL,
  `foto_proveedor` varchar(32) DEFAULT NULL,
  `activo_proveedor` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_promociones`
--

DROP TABLE IF EXISTS `tipo_promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_promociones` (
  `id_tipo_promociones` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_tipo_prom` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_promociones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_promociones`
--

LOCK TABLES `tipo_promociones` WRITE;
/*!40000 ALTER TABLE `tipo_promociones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_venta`
--

DROP TABLE IF EXISTS `tipo_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_venta` (
  `id_tipo_venta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_venta` varchar(32) DEFAULT NULL,
  `porcent_descuento` int(11) DEFAULT NULL,
  `activo_tipo_venta` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_tipo_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_venta`
--

LOCK TABLES `tipo_venta` WRITE;
/*!40000 ALTER TABLE `tipo_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` double NOT NULL AUTO_INCREMENT,
  `id_producto_venta` int(11) DEFAULT NULL,
  `id_promocion_venta` double DEFAULT NULL,
  `id_tipo_ventas` int(11) DEFAULT NULL,
  `id_operaciones_ventas` double DEFAULT NULL,
  `cantidad_venta` int(11) DEFAULT NULL,
  `monto_venta` float DEFAULT NULL,
  `descuento_venta` float DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_producto_venta` (`id_producto_venta`),
  KEY `id_promocion_venta` (`id_promocion_venta`),
  KEY `id_tipo_ventas` (`id_tipo_ventas`),
  KEY `id_operaciones_ventas` (`id_operaciones_ventas`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_producto_venta`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_promocion_venta`) REFERENCES `promociones` (`id_promocion`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_tipo_ventas`) REFERENCES `tipo_venta` (`id_tipo_venta`),
  CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`id_operaciones_ventas`) REFERENCES `operaciones` (`id_operacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'almacenp'
--

--
-- Dumping routines for database 'almacenp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-20  3:40:29
