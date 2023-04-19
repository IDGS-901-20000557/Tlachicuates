-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: bdtlachicuates
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `avisos`
--

DROP TABLE IF EXISTS `avisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avisos` (
  `idavisos` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `nivelMinimoExistencias` decimal(5,0) NOT NULL,
  `prioridad` int(11) NOT NULL,
  `estatus` varchar(1) NOT NULL,
  PRIMARY KEY (`idavisos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos`
--

LOCK TABLES `avisos` WRITE;
/*!40000 ALTER TABLE `avisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `avisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avisos_insumos`
--

DROP TABLE IF EXISTS `avisos_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avisos_insumos` (
  `idavisos_productos` int(11) NOT NULL AUTO_INCREMENT,
  `idaviso` int(11) NOT NULL,
  `idinsumos` int(11) NOT NULL,
  PRIMARY KEY (`idavisos_productos`),
  KEY `FK_avisos_insumos_avisos_idx` (`idaviso`),
  KEY `FK_avisos_insumos_insumos_idx` (`idinsumos`),
  CONSTRAINT `FK_avisos_insumos_avisos` FOREIGN KEY (`idaviso`) REFERENCES `avisos` (`idavisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_avisos_insumos_insumos` FOREIGN KEY (`idinsumos`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos_insumos`
--

LOCK TABLES `avisos_insumos` WRITE;
/*!40000 ALTER TABLE `avisos_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `avisos_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avisos_productos`
--

DROP TABLE IF EXISTS `avisos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avisos_productos` (
  `idavisos_productos` int(11) NOT NULL AUTO_INCREMENT,
  `idaviso` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`idavisos_productos`),
  KEY `FK_avisos_productos_avisos_idx` (`idaviso`),
  KEY `FK_avisos_productos_productos_idx` (`idproducto`),
  CONSTRAINT `FK_avisos_productos_avisos` FOREIGN KEY (`idaviso`) REFERENCES `avisos` (`idavisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_avisos_productos_productos` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avisos_productos`
--

LOCK TABLES `avisos_productos` WRITE;
/*!40000 ALTER TABLE `avisos_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `avisos_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `idbitacora` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `movimiento` varchar(50) NOT NULL,
  `modulo` varchar(50) NOT NULL,
  `observaciones` mediumtext NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`idbitacora`),
  KEY `FK_bitacora_user_idx` (`idUsuario`),
  CONSTRAINT `FK_bitacora_user` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,4,'registro cliente','registro','Cliente registrado','2023-04-08 17:23:54'),(16,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-08 18:36:04'),(17,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-08 18:36:16'),(33,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-08 23:42:16'),(35,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-08 23:44:48'),(36,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-08 23:48:00'),(38,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-08 23:50:13'),(39,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 00:11:02'),(40,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 00:15:53'),(41,4,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 00:25:16'),(42,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 00:28:37'),(43,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 00:37:45'),(44,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 00:41:10'),(45,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 07:22:57'),(49,4,'Inserción/Modificación','registro administrador','Usuario registrado','2023-04-09 07:54:33'),(50,4,'Inserción/Modificación','registro administrador','Usuario registrado','2023-04-09 07:55:18'),(51,4,'Inserción/Modificación','registro administrador','Usuario registrado','2023-04-09 07:55:52'),(52,4,'Inserción/Modificación','registro administrador','Usuario registrado','2023-04-09 07:56:27'),(53,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 08:13:04'),(54,4,'Modificación','registro administrador','Usuario registrado','2023-04-09 08:14:14'),(55,4,'Modificación','registro administrador','Usuario registrado','2023-04-09 08:14:55'),(56,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 08:38:46'),(57,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 08:43:51'),(58,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 12:47:07'),(59,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 12:50:08'),(60,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:11:58'),(61,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:14:01'),(62,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:14:58'),(63,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:16:58'),(64,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:19:44'),(65,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:23:33'),(66,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:26:59'),(67,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:28:08'),(68,4,'Modificación','registro administrador','Usuario registrado','2023-04-09 13:28:31'),(69,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:29:11'),(70,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 13:29:43'),(71,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 13:41:54'),(72,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:05:24'),(73,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:06:09'),(74,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:07:15'),(75,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:09:09'),(76,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:09:50'),(77,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:12:00'),(78,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:47:35'),(79,4,'Modificación','registro administrador','Usuario registrado','2023-04-09 14:52:53'),(80,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 14:54:51'),(81,4,'Modificación','registro administrador','Usuario registrado','2023-04-09 14:55:05'),(82,3,'Eliminar','Usuarios','Usuario Eliminado','2023-04-09 14:59:51'),(83,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:03:23'),(84,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:04:07'),(85,4,'Eliminar','Usuarios','Usuario Eliminado','2023-04-09 15:04:21'),(86,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:07:11'),(87,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:31:42'),(88,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 15:31:52'),(89,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:39:37'),(90,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 15:39:53'),(91,4,'Eliminar','Usuarios','Usuario Eliminado','2023-04-09 15:40:04'),(92,4,'Eliminar','Usuarios','Usuario Eliminado','2023-04-09 15:40:12'),(93,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 15:42:07'),(94,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:43:12'),(95,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 15:43:24'),(96,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:45:09'),(97,4,'Inserción','registro administrador','Usuario registrado','2023-04-09 15:45:18'),(98,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 15:46:07'),(99,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 17:47:51'),(100,6,'inicio sesion','login','Usuario rol: 2 con nombre: pruebas Prueba3P Prueba3M','2023-04-09 17:52:10'),(101,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 17:52:31'),(102,4,'Modificación','registro administrador','Usuario registrado','2023-04-09 17:53:26'),(103,6,'inicio sesion','login','Usuario rol: 3 con nombre: pruebas Prueba3P Prueba3M','2023-04-09 17:53:40'),(104,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 17:54:26'),(105,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-09 19:14:12'),(106,4,'Inserción','proveedor','Proveedor registrado','2023-04-09 19:49:36'),(107,4,'Inserción','Proveedores','Registro proveedor','2023-04-10 17:36:27'),(108,4,'Inserción','Proveedores','Registro proveedor','2023-04-10 17:40:21'),(109,4,'Inserción','Proveedores','Registro proveedor','2023-04-10 17:40:49'),(110,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 17:43:38'),(111,4,'Modificación','Proveedores','Registro proveedor','2023-04-10 18:08:02'),(112,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:13:05'),(113,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:15:58'),(114,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:36:23'),(115,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:36:44'),(116,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:36:59'),(117,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:37:40'),(118,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 18:44:00'),(119,4,'Inserción','Proveedores','Registro proveedor','2023-04-10 18:45:07'),(120,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:21:07'),(121,6,'inicio sesion','login','Usuario rol: 3 con nombre: pruebas Prueba3P Prueba3M','2023-04-10 19:22:03'),(122,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:22:18'),(123,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:22:30'),(124,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:25:36'),(125,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:26:38'),(126,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:27:30'),(127,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:28:22'),(128,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 19:42:31'),(129,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 23:33:02'),(130,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 23:39:10'),(131,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-10 23:39:17'),(132,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-11 00:06:38');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `FK_cliente_persona_idx` (`idPersona`),
  CONSTRAINT `FK_cliente_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `idEmpleados` int(11) NOT NULL AUTO_INCREMENT,
  `rfc` varchar(45) NOT NULL,
  `idPuesto` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleados`),
  KEY `FK_empleado_persona_idx` (`idPersona`),
  KEY `FK_empleado_puesto_idx` (`idPuesto`),
  CONSTRAINT `FK_empleado_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_empleado_puesto` FOREIGN KEY (`idPuesto`) REFERENCES `puesto` (`idpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `idhorario` int(11) NOT NULL AUTO_INCREMENT,
  `horaInicio` datetime NOT NULL,
  `horaFin` datetime NOT NULL,
  PRIMARY KEY (`idhorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `idinsumo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreInsumo` varchar(100) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `idStock` int(11) NOT NULL,
  `unidad` varchar(10) NOT NULL,
  `precio` decimal(5,0) NOT NULL,
  PRIMARY KEY (`idinsumo`),
  KEY `FK_insumos_Stock_idx` (`idStock`),
  KEY `FK_insumos_Proveedor_idx` (`idProveedor`),
  CONSTRAINT `FK_insumos_Proveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_insumos_Stock` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idstock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_lote`
--

DROP TABLE IF EXISTS `insumo_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo_lote` (
  `idproducto_lote` int(11) NOT NULL AUTO_INCREMENT,
  `idInsumo` int(11) NOT NULL,
  `idLote` int(11) NOT NULL,
  PRIMARY KEY (`idproducto_lote`),
  KEY `FK_Producto_Lote_Lote_idx` (`idLote`),
  KEY `FK_Insumo_Lote_Insumo_idx` (`idInsumo`),
  CONSTRAINT `FK_Insumo_Lote_Insumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Insumo_Lote_Lote` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idstockInsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_lote`
--

LOCK TABLES `insumo_lote` WRITE;
/*!40000 ALTER TABLE `insumo_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumo_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librorecetas`
--

DROP TABLE IF EXISTS `librorecetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librorecetas` (
  `idlibroRecetas` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idInsumo` int(11) NOT NULL,
  `cantidadInsumo` decimal(5,0) DEFAULT NULL,
  PRIMARY KEY (`idlibroRecetas`),
  KEY `FK_libroRecetas_producto_idx` (`idProducto`),
  KEY `FK_libroRecetas_insumo_idx` (`idInsumo`),
  CONSTRAINT `FK_libroRecetas_insumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_libroRecetas_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librorecetas`
--

LOCK TABLES `librorecetas` WRITE;
/*!40000 ALTER TABLE `librorecetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `librorecetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `idstockInsumo` int(11) NOT NULL AUTO_INCREMENT,
  `noLote` varchar(10) NOT NULL,
  `fechaCaducidad` date NOT NULL,
  `obesrvaciones` longtext NOT NULL,
  `fechaObtencion` date NOT NULL,
  `cantidad` decimal(5,0) NOT NULL,
  `unidad` varchar(5) NOT NULL,
  `estatus` varchar(1) NOT NULL,
  PRIMARY KEY (`idstockInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `idmesas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idmesas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_venta`
--

DROP TABLE IF EXISTS `orden_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_venta` (
  `idorden_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpleado` int(11) NOT NULL,
  `fechaVenta` datetime NOT NULL,
  `estatus` varchar(1) NOT NULL,
  PRIMARY KEY (`idorden_venta`),
  KEY `FK_orden_venta_empleado_idx` (`idEmpleado`),
  CONSTRAINT `FK_orden_venta_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleados`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta`
--

LOCK TABLES `orden_venta` WRITE;
/*!40000 ALTER TABLE `orden_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_venta_producto`
--

DROP TABLE IF EXISTS `orden_venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_venta_producto` (
  `idorden_venta_producto` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(5,0) NOT NULL,
  `unidad` datetime NOT NULL,
  `estatus` varchar(1) NOT NULL,
  `id_orden_venta` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`idorden_venta_producto`),
  KEY `FK_orden_venta_empleado0_idx` (`id_orden_venta`),
  KEY `FK_orden_venta_producto_producto_idx` (`idproducto`),
  CONSTRAINT `FK_orden_venta_producto_orden_venta` FOREIGN KEY (`id_orden_venta`) REFERENCES `orden_venta` (`idorden_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orden_venta_producto_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta_producto`
--

LOCK TABLES `orden_venta_producto` WRITE;
/*!40000 ALTER TABLE `orden_venta_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_venta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `fechaPedido` datetime NOT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `codigo` int(11) NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `FK_pedido_cliente_idx` (`idCliente`),
  CONSTRAINT `FK_pedido_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_producto`
--

DROP TABLE IF EXISTS `pedido_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_producto` (
  `idpedido_producto` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(5,0) NOT NULL,
  `unidad` varchar(5) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  PRIMARY KEY (`idpedido_producto`),
  KEY `FK_pedido_producto_pedido_idx` (`idPedido`),
  KEY `FK_pedido_producto_producto_idx` (`idProducto`),
  CONSTRAINT `FK_pedido_producto_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_pedido_producto_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_producto`
--

LOCK TABLES `pedido_producto` WRITE;
/*!40000 ALTER TABLE `pedido_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidoP` varchar(100) NOT NULL,
  `apellidoM` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idpersona`),
  KEY `FK_persona_user_idx` (`idUsuario`),
  CONSTRAINT `FK_persona_user` FOREIGN KEY (`idUsuario`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Claudio Cliente','Tamayo','Torres','4775547262',3),(2,'Claudio Emiliano','Tamayo','Torres','4775547262',4),(3,'Pedro2','Torres','Pascal','4776667788',5),(4,'pruebas','Prueba3P','Prueba3M','4775555262',6),(6,'Prueba3','Prueba3P','Prueba3M','4775555262',8),(10,'Prueba','pruebap','pruebam','47775547262',12),(11,'Arturo','Tamayo','Torres','4777661212',13),(13,'Maria','Torres','Enriquez','4779990022',15),(14,'pruebas','PruebaP','PruebaM','7440009988',16);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproductos` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(45) NOT NULL,
  `descripción` longtext NOT NULL,
  `foto` longtext NOT NULL,
  `costoProducción` decimal(10,0) NOT NULL,
  `precioVenta` decimal(10,0) NOT NULL,
  `observaciones` longtext NOT NULL,
  `idStock` int(11) NOT NULL,
  PRIMARY KEY (`idproductos`),
  KEY `FK_producto_Stock_idx` (`idStock`),
  CONSTRAINT `FK_producto_Stock` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idstock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_lote`
--

DROP TABLE IF EXISTS `producto_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_lote` (
  `idproducto_lote` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idLote` int(11) NOT NULL,
  PRIMARY KEY (`idproducto_lote`),
  KEY `FK_Producto_Lote_Producto_idx` (`idProducto`),
  KEY `FK_Producto_Lote_Lote_idx` (`idLote`),
  CONSTRAINT `FK_Producto_Lote_Lote` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idstockInsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Producto_Lote_Producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_lote`
--

LOCK TABLES `producto_lote` WRITE;
/*!40000 ALTER TABLE `producto_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` varchar(45) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `estatus` varchar(1) NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `FK_proveedor_persona_idx` (`idPersona`),
  CONSTRAINT `FK_proveedor_persona` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2,'SDIB',13,'1'),(3,'UTL',14,'1');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `idpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePuesto` varchar(45) NOT NULL,
  PRIMARY KEY (`idpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservacion` (
  `idreservacion` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `idHorario` int(11) NOT NULL,
  PRIMARY KEY (`idreservacion`),
  KEY `FK_reservacion_cliente_idx` (`idCliente`),
  KEY `FK_reservacion_mesa_idx` (`idMesa`),
  KEY `FK_reservacion_horario_idx` (`idHorario`),
  CONSTRAINT `FK_reservacion_cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reservacion_horario` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idhorario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reservacion_mesa` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idmesas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion`
--

LOCK TABLES `reservacion` WRITE;
/*!40000 ALTER TABLE `reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'administrador','acceso total del sistema'),(2,'empleado','acceso a ventas'),(3,'cliente','acceso a compras');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadDisonible` decimal(5,0) NOT NULL,
  PRIMARY KEY (`idstock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` longtext NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'claudio.moustro@hotmail.com','123',1,'2023-04-08 12:00:55'),(4,'claudioracoon@hotmail.com','sha256$TX4QJHzROg3Gp0oy$b0ac574e4ed87145d22e55a5825bee09ecf00abc63bd68a110b44be8406fed1a',1,'2023-04-08 17:23:54'),(5,'pedro@hotmail.com','si',0,'2023-04-09 08:13:04'),(6,'claudiooo@hotmail.com','sha256$hgAVt6PNLpoNA6Fw$17a3f80b9b5db9606395a1551a77a37a2492aaf1cdf36d1e623d76cb655241d1',1,'2023-04-09 13:29:43'),(8,'coon@hotmail.com','sha256$e58lqsvflGGc9Lsr$90ed9b9e0870f067f1e02dfd87d3db6c276d769240192dcec36fa924b662db37',0,'2023-04-09 15:39:53'),(12,'claudioss@hotmail.com','12345678',0,'2023-04-09 19:49:35'),(13,'pci@hotmail.com','12345678',0,'2023-04-10 17:36:27'),(15,'claud@sdib.com','12345678',0,'2023-04-10 17:40:49'),(16,'utl@hotmail.com','12345678',0,'2023-04-10 18:45:07');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_roles_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `users_roles_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (3,3),(4,1),(5,3),(6,3),(8,3),(12,3),(12,3),(13,3),(15,3),(16,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bdtlachicuates'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_eliminar_usuario`(
IN var_idUsuario INT,
IN var_idUser INT, 
OUT var_salida longtext
)
BEGIN

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
UPDATE  user SET     active = 0
                        WHERE   id = var_idUser;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Usuarios', 'Usuario Eliminado', NOW());
                    
SET var_salida = 'exito';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Inicio_Sesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Inicio_Sesion`(
IN  Parametroemail VARCHAR(50)
)
BEGIN
SELECT @idUsuario:=idUsuario,@roleId:=roleId, @nombre:=concat(nombre, ' ', apellidoP, ' ',apellidoM)
FROM user U
INNER JOIN users_roles AS UR ON UR.userId=U.id
INNER JOIN persona AS P ON P.idUsuario=U.id WHERE email LIKE Parametroemail;
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(@idUsuario, 'inicio sesion', 'login', concat('Usuario rol: ',@roleId,' con nombre: ',@nombre), NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insert_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_Cliente`(
IN  nombre          VARCHAR(50),
IN  apellidom VARCHAR(100),
IN  apellidop VARCHAR(100),
IN  email VARCHAR(50),
IN  contrasennia longtext,
IN  telefono varchar(50),
OUT salida longtext
)
BEGIN
DECLARE idUsuario INT DEFAULT 0;

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 salida = MESSAGE_TEXT;
    ROLLBACK;
END;

INSERT INTO user (email, password, active, confirmed_at) 
                    VALUES( email, contrasennia, 1, NOW());
SET idUsuario = LAST_INSERT_ID();
                    
INSERT INTO users_roles (userId, roleId) 
                    VALUES( idUsuario, 3);
                    
INSERT INTO persona (nombre, apellidoP, apellidoM, telefono, idUsuario) 
                    VALUES( nombre, apellidop, apellidom, telefono, idUsuario);
                    
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(idUsuario, 'registro cliente', 'registro', 'Cliente registrado', NOW());
                    
SET salida = 'exito';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insert_update_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_insert_update_Cliente`(
IN var_idUsuario int,
IN var_idUsuarioNew int,
IN var_idRol int,
IN  var_nombre          VARCHAR(50),
IN  var_apellidom VARCHAR(100),
IN  var_apellidop VARCHAR(100),
IN  var_email VARCHAR(50),
IN  var_contrasennia longtext,
IN  var_telefono varchar(50),
OUT var_salida longtext
)
BEGIN
DECLARE accion varchar(50);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
if var_idUsuarioNew<0 then
SET accion= 'Inserción';

   INSERT INTO user (email, password, active, confirmed_at) 
                    VALUES( var_email, var_contrasennia, 1, NOW());
SET var_idUsuarioNew = LAST_INSERT_ID();
INSERT INTO persona (nombre, apellidoP, apellidoM, telefono, idUsuario) 
                    VALUES( var_nombre, var_apellidop, var_apellidom, var_telefono, var_idUsuarioNew);
INSERT INTO users_roles (userId, roleId) 
                    VALUES( var_idUsuarioNew, var_idRol);
else
SET accion= 'Modificación';

 UPDATE  user SET     email = var_email,
						password = var_contrasennia
                        WHERE   id = var_idUsuarioNew;
   UPDATE  persona SET     nombre = var_nombre,
									apellidoM = var_apellidom,
                                    apellidoP = var_apellidop,
                                    telefono = var_telefono
                        WHERE   idUsuario = var_idUsuarioNew;
	 UPDATE  users_roles SET     roleID = var_idRol
                        WHERE   userId = var_idUsuarioNew;
end if;

                    

                    

                    
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, accion, 'registro administrador', 'Usuario registrado', NOW());
                    
SET var_salida = 'exito';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insert_Update_Proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_Update_Proveedor`(
IN var_idUsuario int,
IN var_idUsuarioNew int,
IN var_idProveedor int,
IN var_nombreEmpresa VARCHAR(100),
IN  var_nombre  VARCHAR(50),
IN  var_apellidom VARCHAR(100),
IN  var_apellidop VARCHAR(100),
IN  var_email VARCHAR(50),
IN  var_telefono varchar(50),
OUT var_salida longtext
)
BEGIN


DECLARE accion varchar(50);
DECLARE var_idPersona INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
if var_idUsuarioNew<0 then
SET accion= 'Inserción';

   INSERT INTO user (email, password, active, confirmed_at) 
                    VALUES( var_email, '12345678', 0, NOW());
SET var_idUsuarioNew = LAST_INSERT_ID();
INSERT INTO persona (nombre, apellidoP, apellidoM, telefono, idUsuario) 
                    VALUES( var_nombre, var_apellidop, var_apellidom, var_telefono, var_idUsuarioNew);
                    SET var_idPersona = LAST_INSERT_ID();
INSERT INTO users_roles (userId, roleId) 
                    VALUES( var_idUsuarioNew, 3);
	INSERT INTO proveedor (nombreEmpresa,idPersona, estatus) 
                    VALUES( var_nombreEmpresa, var_idPersona, 1);
else
SET accion= 'Modificación';

 UPDATE  user SET     email = var_email
                        WHERE   id = var_idUsuarioNew;
   UPDATE  persona SET     nombre = var_nombre,
									apellidoM = var_apellidom,
                                    apellidoP = var_apellidop,
                                    telefono = var_telefono
                        WHERE   idUsuario = var_idUsuarioNew;
	 UPDATE  proveedor SET     nombreEmpresa = var_nombreEmpresa
                        WHERE   idproveedor = var_idProveedor;
end if;

                    

                    

                    
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, accion, 'Proveedores', 'Registro proveedor', NOW());
                    
SET var_salida = 'exito';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_proveedor`(
IN var_idUser INT
)
BEGIN
SELECT idproveedor, U.id, PE.nombre, PE.apellidoP, PE.apellidoM, PE.telefono, PR.nombreEmpresa, u.email  FROM proveedor AS PR
LEFT JOIN persona AS PE ON PE.idpersona=PR.idpersona
LEFT JOIN user AS U ON U.id=PE.idUsuario
WHERE PR.estatus AND U.id=var_idUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_proveedores`()
BEGIN
SELECT PR.nombreEmpresa, concat(apellidoP, ' ', nombre), telefono,U.id  FROM proveedor AS PR
LEFT JOIN persona AS PE ON PE.idpersona=PR.idPersona
LEFT JOIN user AS U ON U.id=PE.idUsuario
WHERE pr.estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_usuario`(
IN var_idUser INT
)
BEGIN
SELECT u.id, p.nombre, p.apellidop, p.apellidom, p.telefono, u.email, u.password, r.id FROM user AS u
INNER JOIN persona AS p ON P.idUsuario=u.id
INNER JOIN users_roles AS up ON up.userId=u.id
INNER JOIN role AS r ON r.id=up.roleId
WHERE u.active=1 AND u.id=var_idUser;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_usuarios`()
BEGIN
SELECT u.email, CONCAT(p.apellidoP, ' ', p.nombre),  r.name, u.id FROM user AS u
INNER JOIN persona AS p ON P.idUsuario=u.id
INNER JOIN users_roles AS up ON up.userId=u.id
INNER JOIN role AS r ON r.id=up.roleId
WHERE u.active=1;
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

-- Dump completed on 2023-04-12 17:58:49
