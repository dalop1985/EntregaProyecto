CREATE DATABASE  IF NOT EXISTS `nomina` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nomina`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: nomina
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `nomclasificacion`
--

DROP TABLE IF EXISTS `nomclasificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomclasificacion` (
  `NOM_IDCLASIFICACION` int NOT NULL AUTO_INCREMENT,
  `NOM_CLADIFICACION` varchar(45) DEFAULT NULL,
  `NOM_TIPOCONTRATO` varchar(45) DEFAULT NULL,
  `NOM_JUSTIFICACION` text,
  PRIMARY KEY (`NOM_IDCLASIFICACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Es la tabla que nos servirá para saber la clasificación del empleado la cual se le dará al momento de darse de alta, como por ejemplo: Temporal, Por Contrato, De Confianza, Sindicalizado, etc..';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomclasificacion`
--

LOCK TABLES `nomclasificacion` WRITE;
/*!40000 ALTER TABLE `nomclasificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomclasificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomdeducciones`
--

DROP TABLE IF EXISTS `nomdeducciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomdeducciones` (
  `NOM_IDDEDUCCIONES` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMBREDEDUCCION` varchar(45) DEFAULT NULL,
  `NOM_IMPORTEBASE` float DEFAULT NULL,
  PRIMARY KEY (`NOM_IDDEDUCCIONES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que nos dará la información de las Deducciones que se hacen en la empresa (Restas)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomdeducciones`
--

LOCK TABLES `nomdeducciones` WRITE;
/*!40000 ALTER TABLE `nomdeducciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomdeducciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomdepartamento`
--

DROP TABLE IF EXISTS `nomdepartamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomdepartamento` (
  `NOM_IDDEPARTA` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMDEPARTA` varchar(65) DEFAULT NULL,
  `NOM_IDUBICACION` int DEFAULT NULL,
  `NOM_TELDEPARTA` int DEFAULT NULL,
  `NOM_IDEMPLEADOENCARGADO` int DEFAULT NULL,
  PRIMARY KEY (`NOM_IDDEPARTA`),
  KEY `NOM_IDUBICACION_idx` (`NOM_IDUBICACION`),
  KEY `NOM_IDEMPLEADOENCARGADO_idx` (`NOM_IDEMPLEADOENCARGADO`),
  CONSTRAINT `NOM_IDEMPLEADOENCARGADO` FOREIGN KEY (`NOM_IDEMPLEADOENCARGADO`) REFERENCES `nomempleados` (`NOM_ID_EMPLEADO`),
  CONSTRAINT `NOM_IDUBICACION` FOREIGN KEY (`NOM_IDUBICACION`) REFERENCES `nomubicacion` (`NOM_ID_UBICACION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que servirá de enlace para validar la ubicación del Empleado dentro de la organización.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomdepartamento`
--

LOCK TABLES `nomdepartamento` WRITE;
/*!40000 ALTER TABLE `nomdepartamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomdepartamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomempleados`
--

DROP TABLE IF EXISTS `nomempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomempleados` (
  `NOM_ID_EMPLEADO` int NOT NULL AUTO_INCREMENT,
  `NOM_ID_PERSONA` int DEFAULT NULL,
  `NOM_ID_PUESTO` int DEFAULT NULL,
  `NOM_ID_UBICACION` int DEFAULT NULL,
  `NOM_FECHAING` datetime DEFAULT NULL,
  `NOM_SUELDODIARIO` float DEFAULT NULL,
  `NOM_ACTIVO` int DEFAULT NULL,
  `NOM_FECHABAJA` datetime DEFAULT NULL,
  `NOM_FORMAPAGO` varchar(30) DEFAULT NULL,
  `NOM_IDDEPARTAMENTO` int DEFAULT NULL,
  `NOM_IDCLASIFICACION` int DEFAULT NULL,
  PRIMARY KEY (`NOM_ID_EMPLEADO`),
  KEY `NOM_ID_PERSONA_idx` (`NOM_ID_PERSONA`),
  KEY `NOM_ID_PUESTO_idx` (`NOM_ID_PUESTO`),
  KEY `NOM_ID_UBICACION_idx` (`NOM_ID_UBICACION`),
  KEY `NOM_IDDEPARTAMENTO_idx` (`NOM_IDDEPARTAMENTO`),
  KEY `NOM_IDCLASIFICACION_idx` (`NOM_IDCLASIFICACION`),
  CONSTRAINT `NOM_ID_PERSONA` FOREIGN KEY (`NOM_ID_PERSONA`) REFERENCES `nompersona` (`NOM_ID_PERSONA`),
  CONSTRAINT `NOM_ID_PUESTO` FOREIGN KEY (`NOM_ID_PUESTO`) REFERENCES `nompuestos` (`NOM_ID_PUESTO`),
  CONSTRAINT `NOM_ID_UBICACION` FOREIGN KEY (`NOM_ID_UBICACION`) REFERENCES `nomubicacion` (`NOM_ID_UBICACION`),
  CONSTRAINT `NOM_IDCLASIFICACION` FOREIGN KEY (`NOM_IDCLASIFICACION`) REFERENCES `nomclasificacion` (`NOM_IDCLASIFICACION`),
  CONSTRAINT `NOM_IDDEPARTAMENTO` FOREIGN KEY (`NOM_IDDEPARTAMENTO`) REFERENCES `nomdepartamento` (`NOM_IDDEPARTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Es la tabla en donde podremos saber la información del Empleado que ha entrado a laborar en la empresa, la cual tiene bastante información con respecto al puesto laboral.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomempleados`
--

LOCK TABLES `nomempleados` WRITE;
/*!40000 ALTER TABLE `nomempleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomfuenteingreso`
--

DROP TABLE IF EXISTS `nomfuenteingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomfuenteingreso` (
  `NOM_IDFUENTEINGRESO` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMBREFUENTE` varchar(45) DEFAULT NULL,
  `NOM_ACTIVO` int DEFAULT NULL,
  `NOM_OBSERVACION` text,
  `NOM_FECHAALTA` datetime DEFAULT NULL,
  `NOM_IMPORTEBASE` float DEFAULT NULL,
  PRIMARY KEY (`NOM_IDFUENTEINGRESO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se guardará la información acerca de donde se tomará el importe para poder realizar el pago al empleado, así como el importe base de ese puesto.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomfuenteingreso`
--

LOCK TABLES `nomfuenteingreso` WRITE;
/*!40000 ALTER TABLE `nomfuenteingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomfuenteingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomincidencias`
--

DROP TABLE IF EXISTS `nomincidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomincidencias` (
  `NOM_IDINCIDENCIAS` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMBREINCIDENCIA` varchar(45) DEFAULT NULL,
  `NOM_IMPORTEBASE` float DEFAULT NULL,
  PRIMARY KEY (`NOM_IDINCIDENCIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que nos dará la información de las Incidencias que se hacen en la empresa (Sumas)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomincidencias`
--

LOCK TABLES `nomincidencias` WRITE;
/*!40000 ALTER TABLE `nomincidencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomincidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nompersona`
--

DROP TABLE IF EXISTS `nompersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nompersona` (
  `NOM_ID_PERSONA` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMBRE` varchar(100) DEFAULT NULL,
  `NOM_APELLIDO` varchar(100) DEFAULT NULL,
  `NOM_ID_CIUDADNAC` int DEFAULT NULL,
  `NOM_FECHA_NAC` datetime DEFAULT NULL,
  `NOM_EDAD` int DEFAULT NULL,
  `NOM_CASADO` int DEFAULT NULL,
  `NOM_HIJOS` int DEFAULT NULL,
  `NOM_NUMEROHIJOS` int DEFAULT NULL,
  `NOM_IDENTIFICACION` char(20) DEFAULT NULL,
  `NOM_RFC` char(13) DEFAULT NULL,
  `NOM_CURP` char(18) DEFAULT NULL,
  `NOM_TELEFONO` int DEFAULT NULL,
  `NOM_CORREO` char(50) DEFAULT NULL,
  `NOMPERSONAcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NOM_ID_PERSONA`),
  KEY `NOM_ID_CIUDADNAC_idx` (`NOM_ID_CIUDADNAC`),
  CONSTRAINT `NOM_ID_CIUDADNAC` FOREIGN KEY (`NOM_ID_CIUDADNAC`) REFERENCES `princiudades` (`PRIN_IDCIUDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla servirá para poder dar de alta al padrón de Personas que podrán ser empleados y por lo tanto contiene información personal ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nompersona`
--

LOCK TABLES `nompersona` WRITE;
/*!40000 ALTER TABLE `nompersona` DISABLE KEYS */;
/*!40000 ALTER TABLE `nompersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomprocesos`
--

DROP TABLE IF EXISTS `nomprocesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomprocesos` (
  `NOM_IDPERIODO` year NOT NULL,
  `NOM_MES` int NOT NULL,
  `NOM_QUINCENA` int NOT NULL,
  `NOM_IDEMPLEADO` int NOT NULL,
  `NOM_DIASTRABAJO` int DEFAULT NULL,
  `NOM_FALTAS` int DEFAULT NULL,
  `NOM_IDDEDUCCIONES` int DEFAULT NULL,
  `NOM_IMPORTEDEDUCCION` float DEFAULT NULL,
  `NOM_IDINCIDENCIAS` int DEFAULT NULL,
  `NOM_IMPORTEINCIDENCIA` float DEFAULT NULL,
  PRIMARY KEY (`NOM_IDPERIODO`,`NOM_MES`,`NOM_QUINCENA`),
  KEY `NOM_IDEMPLEADO_idx` (`NOM_IDEMPLEADO`),
  KEY `NOM_IDDEDUCCIONES_idx` (`NOM_IDDEDUCCIONES`),
  KEY `NOM_IDINCIDENCIAS_idx` (`NOM_IDINCIDENCIAS`),
  CONSTRAINT `NOM_IDDEDUCCIONES` FOREIGN KEY (`NOM_IDDEDUCCIONES`) REFERENCES `nomdeducciones` (`NOM_IDDEDUCCIONES`),
  CONSTRAINT `NOM_IDEMPLEADO` FOREIGN KEY (`NOM_IDEMPLEADO`) REFERENCES `nomempleados` (`NOM_ID_EMPLEADO`),
  CONSTRAINT `NOM_IDINCIDENCIAS` FOREIGN KEY (`NOM_IDINCIDENCIAS`) REFERENCES `nomincidencias` (`NOM_IDINCIDENCIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se van guardando las todas las incidencias y deducciones que el empleado tiene por periodo (ejemplo: 2022-10-1, esto es que es la primera quincena de Octubre del 2022) se guardarán cada incidencia y deducción para tener el historial completo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomprocesos`
--

LOCK TABLES `nomprocesos` WRITE;
/*!40000 ALTER TABLE `nomprocesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomprocesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nompuestos`
--

DROP TABLE IF EXISTS `nompuestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nompuestos` (
  `NOM_ID_PUESTO` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMBREPUESTO` varchar(45) DEFAULT NULL,
  `NOM_IMPORTE` float DEFAULT NULL,
  `NOM_IDFUENTEDEINGRESO` int DEFAULT NULL,
  `NOM_CALCULO` varchar(250) DEFAULT NULL,
  `NOM_ACTIVO` int DEFAULT NULL,
  PRIMARY KEY (`NOM_ID_PUESTO`),
  KEY `NOM_IDFUENTEDEINGRESO_idx` (`NOM_IDFUENTEDEINGRESO`),
  CONSTRAINT `NOM_IDFUENTEDEINGRESO` FOREIGN KEY (`NOM_IDFUENTEDEINGRESO`) REFERENCES `nomfuenteingreso` (`NOM_IDFUENTEINGRESO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para guardar los diferentes puestos que pueden tener el personal dentro de la empresa, así como activar a los puestos nuevos y desactivar puestos que no necesitemos.	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nompuestos`
--

LOCK TABLES `nompuestos` WRITE;
/*!40000 ALTER TABLE `nompuestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `nompuestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomubicacion`
--

DROP TABLE IF EXISTS `nomubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomubicacion` (
  `NOM_ID_UBICACION` int NOT NULL AUTO_INCREMENT,
  `NOM_NOMBRELUGAR` varchar(45) DEFAULT NULL,
  `NOM_DIRECCION` varchar(65) DEFAULT NULL,
  `NOM_ENCARGADO` varchar(200) DEFAULT NULL,
  `NOM_IDEMPLEADOENCARGADO` int DEFAULT NULL,
  `NOM_FORANEO` int DEFAULT NULL,
  `NOM_TELEFONO` char(12) DEFAULT NULL,
  `NOM_ID_CIUDAD` int DEFAULT NULL,
  PRIMARY KEY (`NOM_ID_UBICACION`),
  KEY `NOM_ID_CIUDAD_idx` (`NOM_ID_CIUDAD`),
  KEY `NOM_IDEMPLEADOENCARGADO_idx` (`NOM_IDEMPLEADOENCARGADO`),
  CONSTRAINT `NOM_ID_CIUDAD` FOREIGN KEY (`NOM_ID_CIUDAD`) REFERENCES `princiudades` (`PRIN_IDCIUDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se guardan las ubicaciones físicas del o los lugares donde se encontrará laborando el empleado, así como la información del encargado del lugar para tener comunicación.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomubicacion`
--

LOCK TABLES `nomubicacion` WRITE;
/*!40000 ALTER TABLE `nomubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `nomubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `princiudades`
--

DROP TABLE IF EXISTS `princiudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `princiudades` (
  `PRIN_IDCIUDAD` int NOT NULL AUTO_INCREMENT,
  `PRIN_NOMBRECIUDAD` varchar(40) DEFAULT NULL,
  `PRIN_NOMBREESTADO` varchar(40) DEFAULT NULL,
  `PRIN_NOMBREPAIS` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PRIN_IDCIUDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que nos dará la información de las ciudades o pueblos a los que puede pertenecer la persona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `princiudades`
--

LOCK TABLES `princiudades` WRITE;
/*!40000 ALTER TABLE `princiudades` DISABLE KEYS */;
/*!40000 ALTER TABLE `princiudades` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-12 22:36:04
