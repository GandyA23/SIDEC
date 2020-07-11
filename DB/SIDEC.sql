-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-07-2020 a las 03:40:58
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sidec`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Conducta`(
	IN mat VARCHAR(15),
    IN fecha DATETIME,
    IN obs TEXT
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
		
	INSERT INTO Conducta VALUES (mat, fecha, obs);
        
    COMMIT;
END$$

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
END$$

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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Informacion_Clinica`(
	IN mat VARCHAR(15),
    IN peso DECIMAL(5,2),
    IN est DECIMAL(5,2),
    IN imc DECIMAL(5,2),
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
		
	INSERT INTO Informacion_Clinica VALUES (
		mat,
		peso,
		est,
		imc,
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_Logro`(
	IN folio INT,
    IN mat VARCHAR(15),
    IN tipo VARCHAR(20),
    IN descrip TEXT,
    IN fecha DATE
)
BEGIN
	-- Iniciamos una nueva transacción 
    START TRANSACTION;
		
	INSERT INTO Logro VALUES (folio, mat, tipo, descrip, fecha);
        
    COMMIT;
END$$

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
END$$

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
END$$

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
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conducta`
--

CREATE TABLE IF NOT EXISTS `conducta` (
  `MatEstudiante` varchar(15) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Observaciones` text NOT NULL,
  PRIMARY KEY (`MatEstudiante`,`Fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE IF NOT EXISTS `domicilio` (
  `MatEstudiante` varchar(15) NOT NULL,
  `IdTutor` int(11) NOT NULL,
  `Calle` varchar(30) NOT NULL,
  `NoExterior` varchar(5) NOT NULL,
  `NoInterior` varchar(5) DEFAULT 'S/N',
  `Colonia` varchar(30) NOT NULL,
  `Municipio` varchar(30) NOT NULL,
  `CodigoPostal` varchar(5) NOT NULL,
  PRIMARY KEY (`IdTutor`,`MatEstudiante`),
  KEY `FK_EST_idx` (`MatEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE IF NOT EXISTS `estudiante` (
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
  `Status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Matricula`),
  UNIQUE KEY `UNIQUE_Curp` (`Curp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_clinica`
--

CREATE TABLE IF NOT EXISTS `informacion_clinica` (
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
  PRIMARY KEY (`MatEstudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logro`
--

CREATE TABLE IF NOT EXISTS `logro` (
  `Folio` int(11) NOT NULL AUTO_INCREMENT,
  `MatEstudiante` varchar(15) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Folio`),
  KEY `fk_LOG_EST_idx` (`MatEstudiante`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=201 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE IF NOT EXISTS `reporte` (
  `Folio` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` datetime NOT NULL,
  `Motivo` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL,
  `Canalizacion` text NOT NULL,
  `CCT` varchar(15) NOT NULL,
  `MatEstudiante` varchar(15) NOT NULL,
  PRIMARY KEY (`Folio`,`MatEstudiante`,`CCT`),
  KEY `FK_USU_REP_idx` (`CCT`),
  KEY `FK_EST_REP_idx` (`MatEstudiante`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE IF NOT EXISTS `tutor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(15) NOT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `TelefonoPersonal` varchar(20) NOT NULL,
  `TelefonoTrabajo` varchar(20) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Genero` varchar(10) NOT NULL DEFAULT 'Masculino',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=301 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `CCT` varchar(15) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido1` varchar(15) NOT NULL,
  `Apellido2` varchar(15) DEFAULT NULL,
  `Rol` varchar(15) NOT NULL DEFAULT 'Docente',
  PRIMARY KEY (`CCT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conducta`
--
ALTER TABLE `conducta`
  ADD CONSTRAINT `FK_EST_CON` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `FK_EST_DOM` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_TUT_DOM` FOREIGN KEY (`IdTutor`) REFERENCES `tutor` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `informacion_clinica`
--
ALTER TABLE `informacion_clinica`
  ADD CONSTRAINT `FK_ESTUDIANTES_INFORMACION_CLINICA` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `logro`
--
ALTER TABLE `logro`
  ADD CONSTRAINT `fk_LOG_EST` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `FK_EST_REP` FOREIGN KEY (`MatEstudiante`) REFERENCES `estudiante` (`Matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_USU_REP` FOREIGN KEY (`CCT`) REFERENCES `usuario` (`CCT`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
