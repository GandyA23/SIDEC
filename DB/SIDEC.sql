CREATE DATABASE  IF NOT EXISTS `sidec` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sidec`;
-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: sidec
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `domicilio`
--

DROP TABLE IF EXISTS `domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilio` (
  `MatEstudiante` varchar(15) NOT NULL,
  `IdTutor` int NOT NULL,
  `Calle` varchar(30) NOT NULL,
  `NoExterior` varchar(5) NOT NULL,
  `NoInterior` varchar(5) DEFAULT 'S/N',
  `Colonia` varchar(30) NOT NULL,
  `Municipio` varchar(30) NOT NULL,
  `CodigoPostal` varchar(5) NOT NULL,
  PRIMARY KEY (`IdTutor`,`MatEstudiante`),
  KEY `FK_EST_idx` (`MatEstudiante`),
  CONSTRAINT `FK_EST_DOM` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TUT_DOM` FOREIGN KEY (`IdTutor`) REFERENCES `tutor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilio`
--

LOCK TABLES `domicilio` WRITE;
/*!40000 ALTER TABLE `domicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `Matricula` varchar(15) NOT NULL,
  `Curp` varchar(18) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(15) NOT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `FechaNacimiento` date NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Genero` varchar(10) NOT NULL DEFAULT 'Masculino',
  `CicloEscolar` varchar(10) NOT NULL,
  `NivelActual` varchar(15) NOT NULL DEFAULT 'Primaria',
  `Foto` blob,
  `Status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`Matricula`),
  UNIQUE KEY `UNIQUE_Curp` (`Curp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_academica`
--

DROP TABLE IF EXISTS `informacion_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion_academica` (
  `Matricula` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Diploma` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `Reconocimiento` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `Mencion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `Certificacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `Observacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`Matricula`),
  CONSTRAINT `fk_informacion_academica_1` FOREIGN KEY (`Matricula`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_academica`
--

LOCK TABLES `informacion_academica` WRITE;
/*!40000 ALTER TABLE `informacion_academica` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion_academica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_clinica`
--

DROP TABLE IF EXISTS `informacion_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion_clinica` (
  `MatEstudiante` varchar(15) NOT NULL,
  `Peso` decimal(5,2) NOT NULL,
  `Estatura` decimal(5,2) NOT NULL,
  `Imc` decimal(5,2) NOT NULL,
  `TipoSangre` varchar(5) NOT NULL DEFAULT 'O+',
  `NumeroSeguro` varchar(20) NOT NULL,
  `UnidadMedica` varchar(10) NOT NULL,
  `Alergias` text,
  `EnferCronicas` text,
  `EnferHereditarias` text,
  `Discapacidades` text,
  `DiagPsico` text,
  PRIMARY KEY (`MatEstudiante`),
  CONSTRAINT `FK_ESTUDIANTES_INFORMACION_CLINICA` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_clinica`
--

LOCK TABLES `informacion_clinica` WRITE;
/*!40000 ALTER TABLE `informacion_clinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `Folio` int NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL,
  `Motivo` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL,
  `Canalizacion` text NOT NULL,
  `CCT` varchar(15) NOT NULL,
  `MatEstudiante` varchar(15) NOT NULL,
  PRIMARY KEY (`Folio`,`MatEstudiante`,`CCT`),
  KEY `FK_USU_REP_idx` (`CCT`),
  KEY `FK_EST_REP_idx` (`MatEstudiante`),
  CONSTRAINT `FK_EST_REP` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USU_REP` FOREIGN KEY (`CCT`) REFERENCES `usuario` (`CCT`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutor` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(15) NOT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `TelefonoPersonal` varchar(20) NOT NULL,
  `TelefonoTrabajo` varchar(20) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Genero` varchar(10) NOT NULL DEFAULT 'Masculino',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutor`
--

LOCK TABLES `tutor` WRITE;
/*!40000 ALTER TABLE `tutor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `CCT` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(15) NOT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `Rol` varchar(15) NOT NULL DEFAULT 'Docente',
  PRIMARY KEY (`CCT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sidec'
--
/*!50003 DROP PROCEDURE IF EXISTS `Add_Domicilio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Domicilio`(
	IN mat VARCHAR(15),
    IN idTut INT,
    IN calle VARCHAR(30),
    IN noExt VARCHAR(5),
    IN noInt VARCHAR(5),
    IN col VARCHAR(30),
    IN mun VARCHAR(30),
    IN codPos VARCHAR(5)
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
		
	INSERT INTO Domicilio VALUES (mat, idTut, calle, noExt, noInt, col, mun, codPos);
        
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Estudiante`(
	IN mat VARCHAR(15),
    IN curp VARCHAR(18),
    IN nom VARCHAR(30),
    IN ap1 VARCHAR(15),
    IN ap2 VARCHAR(15),
    IN fechaNac DATE,
    IN tel VARCHAR(20),
    IN cor VARCHAR(30),
    IN gen VARCHAR(10),
    IN cic VARCHAR(10),
    IN nivA VARCHAR(15)
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
    
    -- Cuando registran los datos de un nuevo estudiante, este por default estara activo
	INSERT INTO Estudiante VALUES (mat, curp, nom, ap1, ap2, fechaNac, tel, cor, gen, cic, nivA, 1);
    
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Informacion_Academica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Informacion_Academica`(
	IN mat VARCHAR(15),
    IN dip TEXT,
    IN rec TEXT,
    IN men TEXT,
    IN cer TEXT,
    IN obs TEXT
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
	
	INSERT INTO Informacion_Academica VALUES (mat, dip, rec, men, cer, obs);
        
    COMMIT;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Informacion_Clinica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Informacion_Clinica`(
	IN mat VARCHAR(15),
    IN peso DECIMAL(5,2),
    IN est DECIMAL(5,2),
    IN tipoSan VARCHAR(5),
    IN numSeg VARCHAR(20),
	IN uniMed VARCHAR(10),
    IN aler TEXT,
    IN enferCro TEXT,
    IN enferHer TEXT,
    IN discap TEXT,
    IN diagPsico TEXT
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
	
    -- IMC = Peso (kg) / altura (m^2)
    SET @imc := peso/est*est ;
        
	INSERT INTO Informacion_Clinica VALUES (
		mat,
		peso,
		est,
		@imc,
		tipoSan,
		numSeg,
		uniMed,
		aler,
		enferCro,
		enferHer,
		discap,
		diagPsico
    );
        
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Reporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Reporte`(
	IN folio INT,
    IN fecha DATETIME,
    IN mot VARCHAR(30),
    IN descrip TEXT,
    IN canal TEXT,
    IN cct VARCHAR(15),
    IN mat VARCHAR(15)
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
		
	INSERT INTO Reporte VALUES (folio, fecha, mot, descrip, canal, cct, mat);
        
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Tutor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Tutor`(
	IN id INT,
    IN nom VARCHAR(30),
    IN ap1 VARCHAR(15),
    IN ap2 VARCHAR(15),
    IN telPer VARCHAR(20),
    IN telTrab VARCHAR(20),
    IN cor VARCHAR(30),
    IN gen VARCHAR(10)
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
		
	INSERT INTO Tutor VALUES (id, nom, ap1, ap2, telPer, telTrab, cor, gen);
        
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Add_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Usuario`(
	IN cct VARCHAR(15),
    IN pass VARCHAR(255),
    IN cor VARCHAR(30),
    IN nom VARCHAR(30),
    IN ap1 VARCHAR(15),
    IN ap2 VARCHAR(15),
    IN rol VARCHAR(15),
    IN pass_encrypt VARCHAR(255)
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
		
	INSERT INTO Usuario VALUES (cct, aes_encrypt(pass, pass_encrypt), cor, nom, ap1, ap2, rol);
        
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Delete_Estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_Estudiante`(IN mat VARCHAR(15))
BEGIN
	/*
    Cuando nos referimos a eliminar estudiantes, 
    no eliminamos sus datos para que ya no existan, 
    solo ya no lo mostrara cuando consultan a todos 
    los estudiantes, es a lo que llamamos “borrado lógico”
    */
    
    -- Iniciamos una nueva transacción 
    START TRANSACTION;
    
	UPDATE Estudiante SET Status=0 WHERE Matricula=mat ;
    
    COMMIT;
    
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

-- Dump completed on 2020-07-29 20:11:35
