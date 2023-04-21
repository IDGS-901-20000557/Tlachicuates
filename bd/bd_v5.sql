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
) ENGINE=InnoDB AUTO_INCREMENT=468 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (271,4,'Inserción','Inventario','Registro lote','2023-04-19 19:17:16'),(272,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 19:25:56'),(273,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 21:43:42'),(274,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 21:46:30'),(275,3,'inicio sesion','login','Usuario rol: 3 con nombre: Claudio Cliente Tamayo Torres','2023-04-19 21:46:38'),(276,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 21:47:45'),(277,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:01:20'),(278,4,'Inserción','Inventario','Registro lote','2023-04-19 22:02:03'),(279,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-19 22:02:03'),(280,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-19 22:02:03'),(281,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-19 22:02:03'),(282,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:02:52'),(283,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:27:21'),(284,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:28:03'),(285,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:33:04'),(286,4,'Eliminar','Lote','Lote Eliminado','2023-04-19 22:51:53'),(287,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:52:55'),(288,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 22:54:11'),(289,4,'Eliminar','Lote','Lote Eliminado','2023-04-19 22:54:20'),(290,4,'Eliminar','Lote','Lote Eliminado','2023-04-19 22:55:48'),(291,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 23:09:11'),(292,4,'Modificación','Inventario','Registro lote','2023-04-19 23:10:06'),(293,4,'Eliminar','Lote','Insumos Lotes Eliminadss con Id del lote: 1','2023-04-19 23:10:06'),(294,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 23:14:51'),(295,4,'Modificación','Inventario','Registro lote','2023-04-19 23:17:36'),(296,4,'Eliminar','Lote','Insumos Lotes Eliminadas con Id del lote: 1','2023-04-19 23:17:36'),(297,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-19 23:17:36'),(298,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-19 23:17:36'),(299,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:36:31'),(300,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:37:52'),(301,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:38:37'),(302,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:41:31'),(303,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:42:49'),(304,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:43:45'),(305,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:43:52'),(306,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-19 23:51:03'),(307,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:54:11'),(308,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:54:11'),(309,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:54:11'),(310,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:55:49'),(311,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:55:49'),(312,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:55:49'),(313,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:58:53'),(314,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:58:53'),(315,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-19 23:58:53'),(316,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 00:01:23'),(317,4,'Modificación','Inventario','Registro lote','2023-04-20 00:03:56'),(318,4,'Eliminar','Lote','Insumos Lotes Eliminadas con Id del lote: 3','2023-04-20 00:03:56'),(319,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-20 00:03:56'),(320,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-20 00:03:56'),(321,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 00:04:19'),(322,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 00:04:19'),(323,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 17:18:13'),(324,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 17:27:01'),(325,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 17:40:42'),(326,4,'Inserción','Inventario','Registro lote','2023-04-20 17:42:41'),(327,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 17:48:08'),(328,4,'Inserción','Inventario','Registro lote','2023-04-20 17:48:33'),(329,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 17:49:43'),(330,4,'Inserción','Inventario','Registro lote','2023-04-20 17:50:13'),(331,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 17:50:52'),(332,4,'Inserción','Inventario','Registro lote','2023-04-20 17:51:12'),(333,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 17:51:13'),(334,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 17:51:13'),(335,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 18:05:20'),(336,4,'Modificación','Inventario','Registro lote','2023-04-20 18:08:48'),(337,4,'Modificación','Inventario','Registro lote','2023-04-20 18:09:20'),(338,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 18:10:44'),(339,4,'Modificación','Inventario','Registro lote','2023-04-20 18:11:16'),(340,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 18:14:36'),(341,4,'Modificación','Inventario','Registro lote','2023-04-20 18:31:31'),(342,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 2','2023-04-20 18:31:31'),(343,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 18:33:00'),(344,4,'Modificación','Inventario','Registro lote','2023-04-20 18:33:26'),(345,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 2','2023-04-20 18:33:26'),(346,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:33:26'),(347,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:33:26'),(348,4,'Eliminar','Lote','Lote Eliminado','2023-04-20 18:34:40'),(349,4,'Modificación','Inventario','Registro lote','2023-04-20 18:34:57'),(350,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 1','2023-04-20 18:34:57'),(351,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:34:57'),(352,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:34:57'),(353,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:34:57'),(354,4,'Modificación','Inventario','Registro lote','2023-04-20 18:35:19'),(355,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 1','2023-04-20 18:35:19'),(356,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:35:19'),(357,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:35:19'),(358,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:35:19'),(359,4,'Modificación','Inventario','Registro lote','2023-04-20 18:35:43'),(360,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 7','2023-04-20 18:35:43'),(361,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:35:43'),(362,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:35:43'),(363,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 18:35:43'),(364,4,'Modificación','Inventario','Registro lote','2023-04-20 18:44:03'),(365,4,'Eliminar','Lote','Insumos Lotes Eliminadas con Id del lote: 1','2023-04-20 18:44:03'),(366,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-20 18:44:03'),(367,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-20 18:44:03'),(368,4,'Insertar','Inventario','Registro Insumo y Lote dentro del inventario','2023-04-20 18:44:03'),(369,4,'Eliminar','Lote','Lote Eliminado','2023-04-20 18:44:15'),(370,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:37:03'),(371,4,'Modificación','Inventario','Registro lote','2023-04-20 20:38:32'),(372,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 7','2023-04-20 20:38:32'),(373,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 20:38:32'),(374,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 20:38:32'),(375,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 20:38:32'),(376,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:42:38'),(377,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:44:36'),(378,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:45:41'),(379,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:47:04'),(380,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:48:18'),(381,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:49:48'),(382,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 20:50:52'),(383,4,'Modificación','Inventario','Registro lote','2023-04-20 20:51:07'),(384,4,'Eliminar','Lote','Productos Lotes Eliminados con Id del lote: 7','2023-04-20 20:51:07'),(385,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 20:51:07'),(386,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 20:51:07'),(387,4,'Insertar','Inventario','Registro Producto y Lote dentro del inventario','2023-04-20 20:51:07'),(388,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 22:44:39'),(389,4,'Agregar Producto a Inventario','Inventario','Registro de productos dentro del almacen','2023-04-20 23:07:19'),(390,4,'Agregar Producto a Inventario','Inventario','Registro de productos dentro del almacen','2023-04-20 23:10:24'),(391,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 23:15:17'),(392,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 23:24:07'),(393,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:24:22'),(394,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:24:22'),(395,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:24:22'),(396,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:24:22'),(397,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:24:22'),(398,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:24:22'),(399,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:24:22'),(400,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:24:22'),(401,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:24:22'),(402,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:30:00'),(403,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:30:00'),(404,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:30:00'),(405,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:30:00'),(406,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:30:00'),(407,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:30:00'),(408,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:30:00'),(409,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:30:00'),(410,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:30:00'),(411,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:30:46'),(412,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:31:36'),(413,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:31:36'),(414,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:32:31'),(415,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:34:01'),(416,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:34:01'),(417,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:34:01'),(418,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:34:01'),(419,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:34:01'),(420,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:34:01'),(421,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:34:01'),(422,4,'Agregar Insumos a Inventario','Inventario','Registro de insumos dentro del almacen','2023-04-20 23:34:01'),(423,4,'Eliminar Insumo de Inventario','Inventario','Registro de uso de insumos dentro del almacen','2023-04-20 23:34:01'),(424,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-20 23:54:07'),(425,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 00:19:36'),(426,4,'Insertar','Venta','venta registrada','2023-04-21 01:52:36'),(427,4,'Insertar','Venta','venta registrada','2023-04-21 02:00:26'),(428,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:00:56'),(429,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:11:11'),(430,4,'Inserción','Inventario','Registro lote','2023-04-21 02:11:32'),(431,4,'Insertar','Venta','venta registrada','2023-04-21 02:12:48'),(432,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:12:48'),(433,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:12:48'),(434,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:14:23'),(435,4,'Insertar','Venta','venta registrada','2023-04-21 02:14:45'),(436,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:14:45'),(437,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:14:45'),(438,4,'Insertar','Venta','venta registrada','2023-04-21 02:16:08'),(439,4,'Insertar','Venta','venta registrada','2023-04-21 02:16:37'),(440,4,'Insertar','Venta','venta registrada','2023-04-21 02:17:06'),(441,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:17:06'),(442,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:17:06'),(443,4,'Insertar','Venta','venta producto registrado','2023-04-21 02:17:06'),(444,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:22:51'),(445,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:37:59'),(446,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:38:56'),(447,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:40:30'),(448,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:41:01'),(449,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:41:30'),(450,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:50:08'),(451,4,'Eliminar','Venta','venta Eliminada','2023-04-21 02:55:38'),(452,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 02:58:18'),(453,4,'Eliminar','Venta','venta Eliminada','2023-04-21 02:58:37'),(454,4,'Eliminar','Venta','venta Eliminada','2023-04-21 02:58:53'),(455,4,'Eliminar','Venta','venta Eliminada','2023-04-21 02:59:05'),(456,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:13:43'),(457,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:16:08'),(458,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:18:46'),(459,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:19:24'),(460,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:21:11'),(461,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:22:05'),(462,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:23:05'),(463,4,'inicio sesion','login','Usuario rol: 1 con nombre: Claudio Emiliano Tamayo Torres','2023-04-21 03:24:04'),(464,4,'Insertar','Venta','venta registrada','2023-04-21 03:24:52'),(465,4,'Insertar','Venta','venta producto registrado','2023-04-21 03:24:52'),(466,4,'Insertar','Venta','venta registrada','2023-04-21 03:27:11'),(467,4,'Insertar','Venta','venta producto registrado','2023-04-21 03:27:11');
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
  `precio` float NOT NULL,
  `estatus` varchar(1) NOT NULL,
  PRIMARY KEY (`idinsumo`),
  KEY `FK_insumos_Stock_idx` (`idStock`),
  KEY `FK_insumos_Proveedor_idx` (`idProveedor`),
  CONSTRAINT `FK_insumos_Proveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_insumos_Stock` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idstock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'AGUA',3,1,'lt',15,'0'),(5,'Agua',3,5,'ml',10,'1'),(7,'guayaba',4,7,'kl',30,'1');
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
  `cantidad` float NOT NULL,
  PRIMARY KEY (`idproducto_lote`),
  KEY `FK_Producto_Lote_Lote_idx` (`idLote`),
  KEY `FK_Insumo_Lote_Insumo_idx` (`idInsumo`),
  CONSTRAINT `FK_Insumo_Lote_Insumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Insumo_Lote_Lote` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_lote`
--

LOCK TABLES `insumo_lote` WRITE;
/*!40000 ALTER TABLE `insumo_lote` DISABLE KEYS */;
INSERT INTO `insumo_lote` VALUES (8,7,3,3),(9,5,3,2),(10,5,1,0.4),(11,7,1,0.3),(12,7,1,1);
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
  `cantidadInsumo` float DEFAULT NULL,
  PRIMARY KEY (`idlibroRecetas`),
  KEY `FK_libroRecetas_producto_idx` (`idProducto`),
  KEY `FK_libroRecetas_insumo_idx` (`idInsumo`),
  CONSTRAINT `FK_libroRecetas_insumo` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_libroRecetas_producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librorecetas`
--

LOCK TABLES `librorecetas` WRITE;
/*!40000 ALTER TABLE `librorecetas` DISABLE KEYS */;
INSERT INTO `librorecetas` VALUES (1,1,7,10),(12,3,7,0.7),(13,3,5,0.2),(14,2,7,3),(15,2,5,2),(16,2,7,1);
/*!40000 ALTER TABLE `librorecetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `noLote` varchar(10) NOT NULL,
  `fechaCaducidad` date DEFAULT NULL,
  `observaciones` longtext NOT NULL,
  `fechaObtencion` date DEFAULT NULL,
  `fechaGenerado` date NOT NULL,
  `estatus` varchar(1) NOT NULL,
  `costo` double NOT NULL,
  PRIMARY KEY (`idLote`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,'12345',NULL,'Segundo    ',NULL,'2023-04-19','0',43),(2,'67890',NULL,'Holis 2',NULL,'2023-04-19','0',433),(3,'62056','2023-04-21','Por ahora ninguna ','2023-04-20','2023-04-19','2',110),(5,'54612',NULL,'obsr',NULL,'2023-04-20','0',293),(6,'38675',NULL,'hola',NULL,'2023-04-20','0',293),(7,'81944','2023-04-07','jo s  ','2023-04-20','2023-04-20','2',2208);
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
  `fechaVenta` date NOT NULL,
  `estatus` varchar(1) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`idorden_venta`),
  KEY `FK_orden_venta_empleado_idx` (`idEmpleado`),
  CONSTRAINT `FK_orden_venta_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta`
--

LOCK TABLES `orden_venta` WRITE;
/*!40000 ALTER TABLE `orden_venta` DISABLE KEYS */;
INSERT INTO `orden_venta` VALUES (2,4,'2023-04-21','1',2),(3,4,'2023-04-21','0',83),(4,4,'2023-04-21','0',293),(5,4,'2023-04-21','0',2),(6,4,'2023-04-21','0',2),(7,4,'2023-04-21','1',331),(8,4,'2023-04-21','1',6.5),(9,4,'2023-04-21','1',6.5);
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
  `cantidad` float NOT NULL,
  `unidad` float NOT NULL,
  `estatus` varchar(1) NOT NULL,
  `id_orden_venta` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  PRIMARY KEY (`idorden_venta_producto`),
  KEY `FK_orden_venta_empleado0_idx` (`id_orden_venta`),
  KEY `FK_orden_venta_producto_producto_idx` (`idproducto`),
  CONSTRAINT `FK_orden_venta_producto_orden_venta` FOREIGN KEY (`id_orden_venta`) REFERENCES `orden_venta` (`idorden_venta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orden_venta_producto_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta_producto`
--

LOCK TABLES `orden_venta_producto` WRITE;
/*!40000 ALTER TABLE `orden_venta_producto` DISABLE KEYS */;
INSERT INTO `orden_venta_producto` VALUES (1,10,1,'1',2,3),(2,1,1,'1',7,1),(3,2,1,'1',7,2),(4,3,1,'1',7,3),(5,2,0.25,'1',8,3),(6,2,0.25,'1',9,3);
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
  `cantidad` float NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Claudio Cliente','Tamayo','Torres','4775547262',3),(2,'Claudio Emiliano','Tamayo','Torres','4775547262',4),(3,'Pedro2','Torres','Pascal','4776667788',5),(4,'pruebas','Prueba3P','Prueba3M','4775555262',6),(6,'Prueba3','Prueba3P','Prueba3M','4775555262',8),(10,'Prueba','pruebap','pruebam','47775547262',12),(11,'Arturo','Tamayo','Torres','4777661212',13),(13,'Maria','Torres','Enriquez','4779990022',15),(14,'pruebas','PruebaP','PruebaM','7440009988',16),(15,'Prueba','prueba2','prueba','4775555262',17),(16,'Prueba','Prueba3P','Prueba3M','4775555262',18),(17,'s','s','Prueba3M','4775555262',19),(18,'s','s','s','74400099889',20),(19,'NO','Tamayo','Torress','7440009988',21),(20,'s','sa','s','4775555262',22);
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
  `descripcion` longtext NOT NULL,
  `foto` longtext NOT NULL,
  `costoProduccion` float NOT NULL,
  `precioVenta` float NOT NULL,
  `observaciones` longtext NOT NULL,
  `idStock` int(11) NOT NULL,
  `estatus` varchar(1) NOT NULL,
  PRIMARY KEY (`idproductos`),
  KEY `FK_producto_Stock_idx` (`idStock`),
  CONSTRAINT `FK_producto_Stock` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idstock`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'prueba 2','segunda prueba','data:image/png;base64,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',12,24,'ninguna otra',8,'1'),(2,'prueba 3','si ','data:image/png;base64,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',140,160,'no ',11,'1'),(3,'pulque de guayaba','es un pulque de guayaba','data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0BAMAAAA5+MK5AAAAG1BMVEXMzMyWlpacnJy3t7fFxcW+vr6xsbGqqqqjo6PhoLtdAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAD6klEQVR4nO3aTW8aRxgAYIwXzDHjJnGOoV/K0T5U6hF6yDlUzT1Uldpj6S8IrdTf3flY8DZNvSwWZg7PczCz4Fea0cy+87E7GgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8Bnfz9/c7sqXf17/9ZTR5/VDCOH6XSk383jxzdNFP7lxKL5IF5NcfFF+WeWLdyeMPrOLbuWXpbxI5aaUn58w+syW3cpvS/ljKs9K+dUJo8+sW/nLEF4u3rZj9i6EX5p1z5h9XPSZrcKXWcpIs1zVVemrbWrDpO3E00Sf2V25N7NleBn/TvPtGm/WD/Fi/fDt+rjoM1uHbvl1+pinak/DdSqPc3tOFH1mm04m2uauim34mIZvrvX04Uz1uOgz297cl9uJaRmepWkrj9U4ck8XfWbz+yE5KaM0DtMXKV29Lr/vk/S4zdfr3aplUHSFypScXYbSh1fpu7vwe77YhN2qvM3XTTdtHx5dn6bThdM2KeXPdblz95+jdsKKTbvP6kOiqzMJzyd/XP+9SOWrtg9z/+36a9d/o92UvQw3R0VX5zI828TVWG7NrO3DSWritr1LV/fDO/b3bWrV86OiqzMNb/JK9OtRSlClUU1KWPN2WC/bhJW/j+V2sTI8ujpX7SL8enFA5ddxTM/aRD48ujbtDiuke3KcZuTRvvLlH7qVH8cfVp2kPiy6NnGyvvmp+Tnvty7ayo/SQmS3GNl/Ocp7s9tt9+4dFF2bi3yi1GxTbuqv/Dx89a996LDoyixLXp6lybq/8qtdOj8qujJvf80TcJPmrf67dfbJmdOw6EptY6bqz9Hp4PHD0dGVuot1PKDymzyPHRtdp1THA9Zj6+6sPji6TmmX3b8Kb/5nwB8WXamUivv3XlftovW46EqlIdu/406T2+dO2w6Lrkvz/n0ppGOV/nOWbdquLI6Nrsv+8Cx3U9/pWpzbvgudu3dYdG1269J8nNp3pjqOF5vOwcyw6NrMS30nuRF9J+l3sdnLbmsGRdemfT4yzlXte34yjx161d2/DIquzSq8WuS9V6p2z1Ozafo5H9UcE12duOP+Nu+4U/dMus9KV/95VlrG+rpzVjEkujqXu3OWPP8+/IS8ZLhlZy07JLo+m1LHshx58L2I9tnDtLuWPTy6QrP94dqo522YWXsx7zTo8OgabXZvRSQ/hvt3oCafvAPVJrA4xd0cEV2j5rd55wW3oW++PS4aAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAKJ/ANlf1wmZYXVYAAAAAElFTkSuQmCC',13,20,'debe conservarse en ambientes frios',12,'1');
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
  `cantidad` float NOT NULL,
  PRIMARY KEY (`idproducto_lote`),
  KEY `FK_Producto_Lote_Producto_idx` (`idProducto`),
  KEY `FK_Producto_Lote_Lote_idx` (`idLote`),
  CONSTRAINT `FK_Producto_Lote_Lote` FOREIGN KEY (`idLote`) REFERENCES `lote` (`idLote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Producto_Lote_Producto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idproductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_lote`
--

LOCK TABLES `producto_lote` WRITE;
/*!40000 ALTER TABLE `producto_lote` DISABLE KEYS */;
INSERT INTO `producto_lote` VALUES (5,2,2,3),(6,3,2,1),(19,3,7,3),(20,2,7,1),(21,1,7,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2,'SDIB',13,'0'),(3,'UTL',14,'1'),(4,'YES',16,'1'),(5,'NO',19,'0');
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
  `cantidadDisonible` float NOT NULL,
  PRIMARY KEY (`idstock`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,0),(5,5.4),(7,18.8),(8,2),(11,1),(12,9.5);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'claudio.moustro@hotmail.com','sha256$KBAxkoZSaCfEOv4l$751b034af8b68e3c6a26f9cbda5a155c681273e12334465dc1f274c9c4ecfb93',1,'2023-04-08 12:00:55'),(4,'claudioracoon@hotmail.com','sha256$TX4QJHzROg3Gp0oy$b0ac574e4ed87145d22e55a5825bee09ecf00abc63bd68a110b44be8406fed1a',1,'2023-04-08 17:23:54'),(5,'pedro@hotmail.com','sha256$TX4QJHzROg3Gp0oy$b0ac574e4ed87145d22e55a5825bee09ecf00abc63bd68a110b44be8406fed1a',0,'2023-04-09 08:13:04'),(6,'claudiooo@hotmail.com','sha256$ILnMIdEaAW4S1Wij$f5822efde94707d4e566b4564d1d4997fb6a81b6f08039cd786c53469542a012',1,'2023-04-09 13:29:43'),(8,'coon@hotmail.com','sha256$e58lqsvflGGc9Lsr$90ed9b9e0870f067f1e02dfd87d3db6c276d769240192dcec36fa924b662db37',0,'2023-04-09 15:39:53'),(12,'claudioss@hotmail.com','sha256$TX4QJHzROg3Gp0oy$b0ac574e4ed87145d22e55a5825bee09ecf00abc63bd68a110b44be8406fed1a',0,'2023-04-09 19:49:35'),(13,'pci@hotmail.com','12345678',0,'2023-04-10 17:36:27'),(15,'claud@sdib.com','12345678',0,'2023-04-10 17:40:49'),(16,'utl@hotmail.com','12345678',0,'2023-04-10 18:45:07'),(17,'asd@hotmail.com','sha256$6lenHqrpgDmCShga$0927866975a7cf43718892a130b357c73a7d2af58fc33eb715faddd06ad89fbf',0,'2023-04-16 13:14:22'),(18,'yes@hotmail.com','12345678',0,'2023-04-16 13:22:18'),(19,'oon@hotmail.com','sha256$0xtdSp2k5BU13DHA$efa7267fc8a796099163e8e62b5327d54071cd39dfc2f35de41ba68667cf758d',0,'2023-04-16 13:23:14'),(20,'n@hotmail.com','sha256$OGYqyYZw2q8V2EDx$485d17c070bfaea351ba0a4896df453e7f122ef15cb3b06328acc38ea3efbded',0,'2023-04-16 13:24:02'),(21,'NOutl@hotmail.com','12345678',0,'2023-04-16 13:25:57'),(22,'pen@hotmail.com','sha256$bHUe8lxSXUKf9kS1$1c06c5f4e7b16a393e557992bec5d1c37c47feb76ce7ef9c3d38e23754d5a008',0,'2023-04-16 14:05:56');
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
INSERT INTO `users_roles` VALUES (3,3),(4,1),(5,3),(6,2),(8,3),(12,3),(12,3),(13,3),(15,3),(16,3),(17,3),(18,3),(19,3),(20,3),(21,3),(22,3);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdtlachicuates'
--

--
-- Dumping routines for database 'bdtlachicuates'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_agregarInventario_Insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_agregarInventario_Insumos`(
IN var_idUsuario INT,
IN var_idLote INT, 
IN var_idInsumo INT,
IN var_fechaCaducidad DATE,
OUT var_salida longtext
)
BEGIN
DECLARE total double;
DECLARE stockPreventivo double;
DECLARE stockagregado double;
DECLARE var_idStock INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
SET stockagregado = (SELECT sum(cantidad) FROM insumo_lote
WHERE idLote=var_idLote AND idInsumo=var_idInsumo);

SET var_idStock = (SELECT idStock FROM Insumo WHERE idInsumo=var_idInsumo);

SET stockPreventivo = (SELECT sum(cantidadDisonible) FROM stock
 WHERE   idStock = var_idStock);

SET total = stockagregado+stockPreventivo;

UPDATE  stock SET     cantidadDisonible = total
                        WHERE   idStock = var_idStock;

UPDATE  lote SET     estatus = 2,
					 fechaCaducidad=var_fechaCaducidad,
                     fechaObtencion=NOW()
                        WHERE   idLote = var_idLote;


INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Agregar Insumos a Inventario', 'Inventario', 'Registro de insumos dentro del almacen', NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_agregarInventario_Productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_agregarInventario_Productos`(
IN var_idUsuario INT,
IN var_idLote INT, 
IN var_idProducto INT,
IN var_fechaCaducidad DATE,
OUT var_salida longtext
)
BEGIN
DECLARE total double;
DECLARE stockPreventivo double;
DECLARE stockagregado double;
DECLARE var_idStock INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
SET stockagregado = (SELECT sum(cantidad) FROM producto_lote
WHERE idLote=var_idLote AND idProducto=var_idProducto);

SET var_idStock = (SELECT idStock FROM Producto WHERE idproductos=var_idProducto);

SET stockPreventivo = (SELECT sum(cantidadDisonible) FROM stock
 WHERE   idStock = var_idStock);

SET total = stockagregado+stockPreventivo;

UPDATE  stock SET     cantidadDisonible = total
                        WHERE   idStock = var_idStock;

UPDATE  lote SET     estatus = 2,
					 fechaCaducidad=var_fechaCaducidad,
                     fechaObtencion=NOW()
                        WHERE   idLote = var_idLote;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Agregar Insumos a Inventario', 'Inventario', 'Registro de insumos dentro del almacen', NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminarInventario_Insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminarInventario_Insumos`(
IN var_idUsuario INT,
IN var_idInsumo INT,
IN var_idProducto INT,
IN var_idLote INT,
OUT var_salida longtext
)
BEGIN
DECLARE total double;
DECLARE stockPreventivo double;
DECLARE stockagregado double;
DECLARE insumoNecesario float;
DECLARE insumoRestado double;
DECLARE var_idStock INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

SET stockagregado = (SELECT sum(cantidad) FROM producto_lote
WHERE idLote=var_idLote AND idProducto=var_idProducto);

SET insumoNecesario = (SELECT cantidadInsumo FROM librorecetas WHERE idInsumo=var_idInsumo AND idProducto=var_idProducto);

SET insumoRestado=stockagregado*insumoNecesario;
SET var_idStock = (SELECT idStock FROM Insumo WHERE idInsumo=var_idInsumo);

SET stockPreventivo = (SELECT sum(cantidadDisonible) FROM stock
 WHERE   idStock = var_idStock);

SET total = stockPreventivo-insumoRestado;

UPDATE  stock SET     cantidadDisonible = total
                        WHERE   idStock = var_idStock;

INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar Insumo de Inventario', 'Inventario', 'Registro de uso de insumos dentro del almacen', NOW());
                    
                    
SET var_salida="exito"; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_eliminar_insumo`(
IN var_idUsuario INT,
IN var_idInsumo INT, 
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
UPDATE  insumo SET     estatus = 0
                        WHERE   idinsumo = var_idInsumo;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Insumo', 'Insumo Eliminado', NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_insumos_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminar_insumos_lote`(
IN var_idUsuario INT,
IN var_idLote INT, 
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
DELETE FROM insumo_lote
WHERE idLote = var_idLote;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Lote', CONCAT('Insumos Lotes Eliminadas con Id del lote: ', var_idLote), NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_Lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminar_Lote`(
IN var_idUsuario INT,
IN var_idLote INT, 
OUT var_salida longtext
)
BEGIN

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
UPDATE  lote SET     estatus = 0
                        WHERE   idLote = var_idLote;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Lote', 'Lote Eliminado', NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminar_producto`(
IN var_idUsuario INT,
IN var_idProducto INT, 
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
UPDATE  producto SET     estatus = 0
                        WHERE   idproductos = var_idProducto;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Producto', 'Producto Eliminado', NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_productos_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminar_productos_lote`(
IN var_idUsuario INT,
IN var_idLote INT, 
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
DELETE FROM producto_lote
WHERE idLote = var_idLote;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Lote', CONCAT('Productos Lotes Eliminados con Id del lote: ', var_idLote), NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_eliminar_proveedor`(
IN var_idUsuario INT,
IN var_idProveedor INT, 
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
UPDATE  proveedor SET     estatus = 0
                        WHERE   idproveedor = var_idProveedor;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Proveedor', 'Proveedor Eliminado', NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_receta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminar_receta`(
IN var_idUsuario INT,
IN var_idProducto INT, 
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
DELETE FROM librorecetas
WHERE idProducto = var_idProducto;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Receta', CONCAT('Recetas Eliminadas con Id del producto: ', var_idProducto), NOW());
                    
SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_eliminar_Venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_eliminar_Venta`(
IN var_idUsuario INT,
IN var_idVenta INT, 
OUT var_salida longtext
)
BEGIN

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
UPDATE  orden_venta SET     estatus = 0
                        WHERE   idorden_venta = var_idVenta;
                        
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Eliminar', 'Venta', 'venta Eliminada', NOW());
                    
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_insertar_orden_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_insertar_orden_venta`(
IN var_idUsuario int,
IN var_total double,
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

INSERT INTO orden_venta (idEmpleado,fechaVenta,estatus,total) 
                    VALUES( var_idUsuario, NOW(),1,var_total);
                            SET var_salida = LAST_INSERT_ID();              
 INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Insertar', 'Venta', 'venta registrada', NOW());                   
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_insert_Lote_Insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_insert_Lote_Insumos`(
IN var_idUsuario int,
IN var_idLote int,
IN var_idInsumo int,
IN  var_cantidad float,
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

INSERT INTO insumo_lote (idInsumo,idLote,cantidad) 
                    VALUES( var_idInsumo, var_idLote,var_cantidad);
   
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Insertar', 'Inventario', 'Registro Insumo y Lote dentro del inventario', NOW());
                    
                    
                    SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insert_lote_Productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_insert_lote_Productos`(
IN var_idUsuario int,
IN var_idLote int,
IN var_idProducto int,
IN  var_cantidad float,
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

INSERT INTO producto_lote (idProducto,idLote,cantidad) 
                    VALUES( var_idProducto, var_idLote,var_cantidad);
   
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Insertar', 'Inventario', 'Registro Producto y Lote dentro del inventario', NOW());
                    
                    
                    SET var_salida = 'exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_insert_orden_venta_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_insert_orden_venta_producto`(
IN var_idUsuario int,
IN var_idordenVenta int,
IN var_idproducto int,
IN var_cantidad float,
IN var_unidad float,
OUT var_salida longtext
)
BEGIN
DECLARE var_idStock int;
DECLARE var_Stock float;
DECLARE var_Total double;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
SET var_idStock=(SELECT S.idStock FROM producto AS I
INNER JOIN stock AS S ON I.idStock=S.idStock
WHERE I.idproductos=var_idProducto);

SET var_Stock=(SELECT cantidadDisonible FROM stock 
WHERE idStock=var_idStock);

SET var_Total=var_Stock-(var_cantidad*var_unidad);

UPDATE  stock SET     cantidadDisonible = var_Total
                        WHERE   idStock=var_idStock;

INSERT INTO orden_venta_producto (cantidad,unidad,estatus,id_orden_venta,idproducto) 
                    VALUES(var_cantidad, var_unidad,1,var_idordenVenta,var_idproducto);

 INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Insertar', 'Venta', 'venta producto registrado', NOW());
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insert_Receta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_Insert_Receta`(
IN var_idUsuario int,
IN var_idProducto int,
IN var_idInsumo int,
IN  var_cantidad float,
OUT var_salida longtext
)
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

INSERT INTO librorecetas (idProducto,idInsumo,cantidadInsumo) 
                    VALUES( var_idProducto, var_idInsumo,var_cantidad);
   
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, 'Insertar', 'Recetas', 'Registro Insumo y producto dentro de la receta', NOW());
                    
                    
                    SET var_salida = 'exito';
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insert_Update_Insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_Update_Insumo`(
IN var_idUsuario int,
IN var_idProveedor int,
IN var_idInsumo int,
IN var_nombreInsumo VARCHAR(100),
IN  var_unidad  VARCHAR(50),
IN  var_precio float,
OUT var_salida longtext
)
BEGIN
DECLARE accion varchar(50);
DECLARE var_idStock INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
if var_idInsumo<0 then
SET accion= 'Inserción';
	INSERT INTO stock (cantidadDisonible) 
                    VALUES(0);
	SET var_idStock = LAST_INSERT_ID();
INSERT INTO insumo (nombreInsumo,idProveedor,idStock,unidad,precio,estatus) 
                    VALUES( var_nombreInsumo, var_idProveedor, var_idStock, var_unidad, var_precio,1);
else
SET accion= 'Modificación';
   UPDATE  insumo SET     nombreInsumo = var_nombreInsumo,
									idProveedor = var_idProveedor,
                                    unidad = var_unidad,
                                    precio = var_precio
                        WHERE   idinsumo = var_idInsumo;
end if;

                    

                    

                    
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, accion, 'Insumos', 'Registro insumos', NOW());
                    
SET var_salida = 'exito';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insert_Update_Lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_Insert_Update_Lote`(
IN var_idUsuario int,
IN var_idLote int,
IN var_noLote int,
IN var_costo float,
IN var_observaciones longtext,
OUT var_salida longtext
)
BEGIN

DECLARE accion varchar(50);
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

if var_idLote<0 then
SET accion= 'Inserción';
    INSERT INTO lote (noLote,observaciones,fechaGenerado,estatus,costo) 
                    VALUES( var_noLote, var_observaciones, NOW(),1,var_costo);
    SET var_salida =  LAST_INSERT_ID();
else
SET accion= 'Modificación';
UPDATE  lote SET     observaciones = var_observaciones,
									costo = var_costo
                        WHERE   idLote = var_idLote;
                        SET var_salida =  var_idLote;
end if;

                    
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, accion, 'Inventario', 'Registro lote', NOW());
                    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Insert_Update_Producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_Update_Producto`(
IN var_idUsuario int,
IN var_idProducto int,
IN var_nombreProducto VARCHAR(100),
IN var_descripcion longtext,
IN  var_foto  longtext,
IN  var_costo float,
IN  var_precio float,
IN  var_observaciones longtext,
OUT var_salida longtext
)
BEGIN

DECLARE accion varchar(50);
DECLARE var_idStock INT;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

if var_idProducto<0 then
SET accion= 'Inserción';
   INSERT INTO stock (cantidadDisonible) 
                    VALUES(0);
	SET var_idStock = LAST_INSERT_ID();
    INSERT INTO producto (nombreProducto,descripcion,foto,costoProduccion,precioVenta,observaciones,idStock,estatus) 
                    VALUES( var_nombreProducto, var_descripcion, var_foto,var_costo,var_precio,var_observaciones,var_idStock,1);
    SET var_salida =  LAST_INSERT_ID();
else
SET accion= 'Modificación';
UPDATE  producto SET     nombreProducto = var_nombreProducto,
									descripcion = var_descripcion,
                                    foto = var_foto,
                                    costoProduccion = var_costo,
                                    precioVenta = var_precio,
                                    observaciones = var_observaciones
                        WHERE   idproductos = var_idProducto;
                        SET var_salida =  var_idProducto;
end if;

                    
INSERT INTO bitacora (idUsuario, movimiento, modulo, observaciones, fecha) 
                    VALUES(var_idUsuario, accion, 'Productos', 'Registro producto', NOW());
                    

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
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrarStockReal_Insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrarStockReal_Insumos`()
BEGIN
SELECT nombreInsumo, cantidadDisonible, precio, unidad, 'Insumo' FROM Stock AS S
LEFT JOIN insumo AS I ON I.idStock=S.idStock
WHERE estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrarStockReal_Productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrarStockReal_Productos`()
BEGIN
SELECT nombreProducto, cantidadDisonible, costoProduccion, 'lt', 'Producto' FROM Stock AS S
LEFT JOIN producto AS P ON P.idStock=S.idStock
WHERE estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_Insumo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_Insumo`(
IN var_idInsumo INT
)
BEGIN
SELECT idinsumo, nombreInsumo, idProveedor,unidad, precio FROM insumo 
WHERE idinsumo=var_idInsumo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_insumos`()
BEGIN
SELECT idinsumo,nombreInsumo,unidad,precio FROM insumo
WHERE estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_lote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_lote`(
IN var_idLote INT
)
BEGIN
SELECT DISTINCT L.idLote,L.noLote, L.observaciones, L.costo, 
       CASE 
           WHEN IL.idLote IS NOT NULL THEN 'Insumo' 
           ELSE 'Producto' 
       END AS tipo
FROM lote AS L
LEFT JOIN insumo_lote AS IL ON IL.idLote = L.idLote
LEFT JOIN producto_lote AS PL ON PL.idLote = L.idLote
WHERE L.idLote=var_idLote;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_Lotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_Lotes`()
BEGIN
SELECT distinct L.idLote,L.noLote, L.fechaGenerado, L.costo, 
       CASE 
           WHEN IL.idLote IS NOT NULL THEN 'Insumo' 
           ELSE 'Producto' 
       END AS tipo
FROM lote AS L
LEFT JOIN insumo_lote AS IL ON IL.idLote = L.idLote
LEFT JOIN producto_lote AS PL ON PL.idLote = L.idLote
WHERE L.estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_lote_insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_lote_insumos`(
IN var_idLote INT
)
BEGIN
SELECT IL.idInsumo, i.precio,I.unidad, IL.cantidad  FROM insumo_lote AS IL
INNER JOIN insumo AS I ON I.idinsumo=IL.idinsumo
WHERE idLote=var_idLote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_lote_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_lote_productos`(
IN var_idLote INT
)
BEGIN
SELECT IP.idProducto, P.precioVenta,'lt', IP.cantidad  FROM producto_lote AS IP
INNER JOIN producto AS P ON P.idProductos=IP.idProducto
WHERE idLote=var_idLote;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_orden_venta_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_orden_venta_productos`(
IN idVenta INT
)
BEGIN
select idproducto, precioVenta, unidad, cantidad from orden_venta_producto
inner join producto on producto.idproductos=orden_venta_producto.idproducto
WHERE id_orden_venta=idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_producto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_producto`(
IN var_idProducto INT
)
BEGIN
SELECT idproductos, nombreProducto, descripcion, foto, costoProduccion, precioVenta, observaciones FROM producto
WHERE idproductos=var_idProducto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_mostrar_productos`()
BEGIN
SELECT idproductos, nombreProducto, costoProduccion, precioVenta FROM producto
WHERE estatus=1;
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
SELECT PR.nombreEmpresa, concat(apellidoP, ' ', nombre), telefono,U.id, PR.idproveedor  FROM proveedor AS PR
LEFT JOIN persona AS PE ON PE.idpersona=PR.idPersona
LEFT JOIN user AS U ON U.id=PE.idUsuario
WHERE pr.estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_receta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_receta`(
IN var_idProducto INT
)
BEGIN
SELECT I.idinsumo, I.precio, I.unidad, LR.cantidadInsumo FROM librorecetas AS LR
INNER JOIN insumo AS I ON I.idinsumo=LR.idInsumo
WHERE idproducto=var_idProducto;
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
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_venta`(
IN idVenta INT
)
BEGIN
select idorden_venta, total from orden_venta
WHERE idorden_venta=idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_mostrar_ventas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_mostrar_ventas`()
BEGIN
select idorden_venta,fechaVenta, total from orden_venta
WHERE estatus=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_verificar_inventario_insumos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_verificar_inventario_insumos`(
IN var_idProducto int,
IN var_idInsumo int,
IN var_cantidad float,
OUT var_salida longtext
)
BEGIN
DECLARE cantidadInsumo float;
DECLARE cantidadDisponible float;
DECLARE var_nombreInsumo varchar(250);
DECLARE var_nombreProducto varchar(250);
DECLARE verificar double;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;
SET cantidadInsumo=(SELECT LR.cantidadInsumo FROM librorecetas AS LR
INNER JOIN insumo AS I ON I.idInsumo=LR.idInsumo
WHERE I.idInsumo=var_idInsumo AND idProducto=var_idProducto);

SET cantidadDisponible=(SELECT S.cantidadDisonible FROM insumo AS I
INNER JOIN stock AS S ON I.idStock=S.idStock
WHERE I.idInsumo=var_idInsumo);

SET verificar=cantidadDisponible-(var_cantidad*cantidadInsumo);

 IF verificar < 0 THEN
	SET  var_nombreInsumo=(select nombreInsumo from insumo WHERE idinsumo=var_idInsumo);
    SET  var_nombreProducto=(select nombreProducto from producto WHERE idproductos=var_idProducto);
    SET var_salida=CONCAT("Insuficiente Insumo de: ", var_nombreInsumo," Para el producto: ",  var_nombreProducto);
  ELSE
    SET var_salida="SI";
  END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_verificar_inventario_Productos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`claudio`@`localhost` PROCEDURE `SP_verificar_inventario_Productos`(
IN var_idProducto int,
IN var_cantidad float,
OUT var_salida longtext
)
BEGIN
DECLARE cantidadProducto float;
DECLARE cantidadDisponible float;
DECLARE var_nombreInsumo varchar(250);
DECLARE var_nombreProducto varchar(250);
DECLARE verificar double;


DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
    GET DIAGNOSTICS CONDITION 1 var_salida = MESSAGE_TEXT;
    ROLLBACK;
END;

SET cantidadDisponible=(SELECT S.cantidadDisonible FROM producto AS I
INNER JOIN stock AS S ON I.idStock=S.idStock
WHERE I.idproductos=var_idProducto);

SET verificar=cantidadDisponible-var_cantidad;

 IF verificar < 0 THEN
    SET  var_nombreProducto=(select nombreProducto from producto WHERE idproductos=var_idProducto);
    SET var_salida=CONCAT("Insuficiente producto: ",  var_nombreProducto);
  ELSE
    SET var_salida="SI";
  END IF;

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

-- Dump completed on 2023-04-21  3:28:52
