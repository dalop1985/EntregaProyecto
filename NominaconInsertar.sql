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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Es la tabla que nos servirá para saber la clasificación del empleado la cual se le dará al momento de darse de alta, como por ejemplo: Temporal, Por Contrato, De Confianza, Sindicalizado, etc..';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomclasificacion`
--

LOCK TABLES `nomclasificacion` WRITE;
/*!40000 ALTER TABLE `nomclasificacion` DISABLE KEYS */;
INSERT INTO `nomclasificacion` VALUES (1,'CONFIANZA','Temporal','De acuerdo al Art 35 de la Constitución'),(2,'SINDICALIZADO','Indefinido','De acuerdo al Art 35 Sec B de la Constitución'),(3,'SINDICALIZADO B','Temporal','De acuerdo al Art 37 de la Constitución'),(4,'POR CONTRATO','Temporal','De acuerdo al Art 42 de la Constitución');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que nos dará la información de las Deducciones que se hacen en la empresa (Restas)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomdeducciones`
--

LOCK TABLES `nomdeducciones` WRITE;
/*!40000 ALTER TABLE `nomdeducciones` DISABLE KEYS */;
INSERT INTO `nomdeducciones` VALUES (1,'Prestamo Personal',1500),(2,'Prestamo Ejecutivo',15000),(3,'Pensión',500),(4,'Seguro GM',1900),(5,'Devolución Cajas',0);
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
  `NOM_TELDEPARTA` varchar(10) DEFAULT NULL,
  `NOM_IDEMPLEADOENCARGADO` int DEFAULT NULL,
  PRIMARY KEY (`NOM_IDDEPARTA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que servirá de enlace para validar la ubicación del Empleado dentro de la organización.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomdepartamento`
--

LOCK TABLES `nomdepartamento` WRITE;
/*!40000 ALTER TABLE `nomdepartamento` DISABLE KEYS */;
INSERT INTO `nomdepartamento` VALUES (1,'Sistemas',1,'9992601401',2),(2,'Compras',2,'9992010102',1),(3,'Bodega',1,'9992010108',8),(4,'Ingresos',3,'9992010111',3),(5,'Egresos',3,'9992010112',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Es la tabla en donde podremos saber la información del Empleado que ha entrado a laborar en la empresa, la cual tiene bastante información con respecto al puesto laboral.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomempleados`
--

LOCK TABLES `nomempleados` WRITE;
/*!40000 ALTER TABLE `nomempleados` DISABLE KEYS */;
INSERT INTO `nomempleados` VALUES (1,10,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Transferencia',1,1),(2,8,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Efectivo',1,1),(3,2,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Cheque',1,1),(4,1,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Efectivo',1,1),(5,9,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Transferencia',1,1),(6,7,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Transferencia',1,1),(7,5,1,1,'2015-12-31 00:00:00',980,1,'0000-00-00 00:00:00','Transferencia',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se guardará la información acerca de donde se tomará el importe para poder realizar el pago al empleado, así como el importe base de ese puesto.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomfuenteingreso`
--

LOCK TABLES `nomfuenteingreso` WRITE;
/*!40000 ALTER TABLE `nomfuenteingreso` DISABLE KEYS */;
INSERT INTO `nomfuenteingreso` VALUES (1,'Sueldo A',1,'Sueldo Empleados de Confianza','2022-01-13 00:00:00',200),(2,'Sueldo B',1,'Sueldo Empleados de Sindicalizado','2022-01-13 00:00:00',350),(3,'Sueldo C',1,'Sueldo Empleados de Sindicalizado B','2022-01-13 00:00:00',500),(4,'Sueldo D',1,'Sueldo Empleados de Contrato','2022-01-13 00:00:00',280),(5,'Deducción A',1,'Prestamo del Empleado','2022-01-13 00:00:00',1500),(6,'Deducción B',1,'Prestamo Ejecutivo','2022-01-13 00:00:00',15000),(7,'Deducción C',0,'Pensión','2022-01-13 00:00:00',500),(8,'Deducción D',0,'Seguro Gastos Medicos Mayores','2022-01-13 00:00:00',1900),(9,'Deducción E',1,'Faltantes en Caja por parte de Cajeros','2022-01-13 00:00:00',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que nos dará la información de las Incidencias que se hacen en la empresa (Sumas)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomincidencias`
--

LOCK TABLES `nomincidencias` WRITE;
/*!40000 ALTER TABLE `nomincidencias` DISABLE KEYS */;
INSERT INTO `nomincidencias` VALUES (1,'Bono Puntualidad',500),(2,'Bono Grupal',1000),(3,'Bono Comportamiento',800),(4,'Incentivo',2000),(5,'Promoción puesto',3000);
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
  `NOM_TELEFONO` char(10) DEFAULT NULL,
  `NOM_CORREO` char(50) DEFAULT NULL,
  `NOMPERSONAcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`NOM_ID_PERSONA`),
  KEY `NOM_ID_CIUDADNAC_idx` (`NOM_ID_CIUDADNAC`),
  CONSTRAINT `NOM_ID_CIUDADNAC` FOREIGN KEY (`NOM_ID_CIUDADNAC`) REFERENCES `princiudades` (`PRIN_IDCIUDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla servirá para poder dar de alta al padrón de Personas que podrán ser empleados y por lo tanto contiene información personal ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nompersona`
--

LOCK TABLES `nompersona` WRITE;
/*!40000 ALTER TABLE `nompersona` DISABLE KEYS */;
INSERT INTO `nompersona` VALUES (1,'David Jose','Lopez Chan',5,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal1@gmail.com',NULL),(2,'Rolando de Jesús','Pech Tun',1,'1985-12-31 00:00:00',37,1,1,1,'LUC997995','PETR850330LJ4','PETR850330HQRPHV98','9992601402','personal2@gmail.com',NULL),(3,'Shirley María','Canul Dzib',1,'1985-12-31 00:00:00',34,1,1,4,'LUC997115','CADS871231LL7','CADS871231MQRPHV58','9992601403','personal3@gmail.com',NULL),(4,'Diana Lucía','Ventura Tzec',1,'1985-12-31 00:00:00',33,0,1,1,'LUC994585','VETD890624DU7','VETD890624QRNPHV68','9992601407','personal4@gmail.com',NULL),(5,'Sandra Maribel','Escalante Vallejos',5,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal5@gmail.com',NULL),(6,'Ruben','Prado Cano',1,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal6@gmail.com',NULL),(7,'Jesús del Carmen','Avila Camacho',5,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal7@gmail.com',NULL),(8,'Darinel Eduardo','Lope Castillo',5,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal8@gmail.com',NULL),(9,'Jorge Alberto','Navarrete Tzuc',5,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal9@gmail.com',NULL),(10,'Victoria Albertana','Romero Zozaya',5,'1985-12-31 00:00:00',36,1,1,3,'LUC997885','LOCD851231LJ4','LOCD851231HYNPHV58','9992601401','personal10@gmail.com',NULL);
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
  `NOM_IDDEDUCCIONES` int NOT NULL,
  `NOM_IMPORTEDEDUCCION` float DEFAULT NULL,
  `NOM_IDINCIDENCIAS` int NOT NULL,
  `NOM_IMPORTEINCIDENCIA` float DEFAULT NULL,
  PRIMARY KEY (`NOM_IDPERIODO`,`NOM_MES`,`NOM_QUINCENA`,`NOM_IDEMPLEADO`),
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
INSERT INTO `nomprocesos` VALUES (2022,1,1,1,15,0,1,1500,2,1000),(2022,1,1,2,15,0,1,1500,2,1000),(2022,1,1,3,15,0,1,1500,2,1000),(2022,1,1,4,15,0,1,1500,2,1000),(2022,1,1,5,15,0,1,1500,2,1000),(2022,1,1,6,15,0,1,1500,2,1000),(2022,1,1,7,15,0,1,1500,2,1000);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla para guardar los diferentes puestos que pueden tener el personal dentro de la empresa, así como activar a los puestos nuevos y desactivar puestos que no necesitemos.	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nompuestos`
--

LOCK TABLES `nompuestos` WRITE;
/*!40000 ALTER TABLE `nompuestos` DISABLE KEYS */;
INSERT INTO `nompuestos` VALUES (1,'Director',15000,3,'(dias*sueldo)-deducciones+incidencias',1),(2,'Jefe de Departamento',8900,2,'(dias*sueldo)-deducciones+incidencias',1),(3,'Jefe de Departamento B',10900,2,'(dias*sueldo)-deducciones+incidencias',1),(4,'Secretaria',6900,1,'(dias*sueldo)-deducciones+incidencias',1),(5,'Fiscal',9500,4,'(dias*sueldo)-deducciones+incidencias',1);
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
  `NOM_ID_CIUDAD` char(10) DEFAULT NULL,
  PRIMARY KEY (`NOM_ID_UBICACION`),
  KEY `NOM_ID_CIUDAD_idx` (`NOM_ID_CIUDAD`),
  KEY `NOM_IDEMPLEADOENCARGADO_idx` (`NOM_IDEMPLEADOENCARGADO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla donde se guardan las ubicaciones físicas del o los lugares donde se encontrará laborando el empleado, así como la información del encargado del lugar para tener comunicación.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomubicacion`
--

LOCK TABLES `nomubicacion` WRITE;
/*!40000 ALTER TABLE `nomubicacion` DISABLE KEYS */;
INSERT INTO `nomubicacion` VALUES (1,'Plaza Tulum','Av Tulum entre Osiris Depto 1','Rolando de Jesús Pech Tun',2,0,'9998642525','1'),(2,'Oficinas de Tesorería','Av Tulum entre Osiris Depto 4-9','Shirley MAría Canul Dzib',3,0,'9998642526','1'),(3,'Deportivo','Av Orion nte entre Andromeda sur Mza 1','Diana Lucía Ventura Tzec',4,0,'9998642527','1'),(4,'Matriz','Calle 35 x 25 y 27A','Sandra Maribel Escalante Vallejos',5,1,'975556417','6'),(5,'Matriz Oriente','Calle 95 x 37 Diag y 9','Darinel Eduardo Lope Castillo',8,1,'975556417','8');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que nos dará la información de las ciudades o pueblos a los que puede pertenecer la persona';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `princiudades`
--

LOCK TABLES `princiudades` WRITE;
/*!40000 ALTER TABLE `princiudades` DISABLE KEYS */;
INSERT INTO `princiudades` VALUES (1,'Tulum','Quintana Roo','México'),(2,'Playa del Carmen','Quintana Roo','México'),(3,'Cancún','Quintana Roo','México'),(4,'Chetumal','Quintana Roo','México'),(5,'Ticul','Yucatán','México'),(6,'Mérida','Yucatán','México'),(7,'Progreso','Yucatán','México'),(8,'Valladolid','Yucatán','México'),(9,'Izamal','Yucatán','México'),(10,'Oxcutzcab','Yucatán','México');
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

-- Dump completed on 2022-10-24 19:58:11
