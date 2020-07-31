-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2020 at 11:12 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sidec`
--

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
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

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`Matricula`, `Curp`, `Nombre`, `Apellido1`, `Apellido2`, `FechaNacimiento`, `Telefono`, `Correo`, `Genero`, `CicloEscolar`, `NivelActual`, `Status`) VALUES
('Matricula1', 'CURP1', 'IMANOL', 'ROA', 'NADAL', '2006-01-09', '+85 756-119-1711', 'Matricula1@gmail.com', 'Hombre', '2013-2016', 'Secundaria', 1),
('Matricula115', 'CURP115', 'EMA', 'ZARATE', 'BAJONERO', '2015-09-11', '+40 549-362-6585', 'Matricula115@gmail.com', 'Mujer', '2011-2017', 'Primaria', 1),
('Matricula119', 'CURP119', 'FLAVIO', 'CASTELLANOS', 'BALLESTEROS', '2010-04-04', '+10 938-526-1704', 'Matricula119@gmail.com', 'Hombre', '2011-2014', 'Secundaria', 0),
('Matricula130', 'CURP130', 'ROMINA', 'PARENTE', 'ZAPATA', '2010-08-20', '+82 581-435-2312', 'Matricula130@gmail.com', 'Mujer', '2013-2019', 'Primaria', 0),
('Matricula14', 'CURP14', 'NORMA', 'BAENA', 'MOLINA', '2010-09-06', '+107 544-943-1640', 'Matricula14@gmail.com', 'Mujer', '2014-2020', 'Primaria', 1),
('Matricula145', 'CURP145', 'VANESA', 'ESCAMILLA', 'AGUIRRE', '2015-01-21', '+32 376-495-7580', 'Matricula145@gmail.com', 'Mujer', '2012-2018', 'Primaria', 0),
('Matricula155', 'CURP155', 'MAT?AS', 'PERALTA', 'GODOY', '2015-06-23', '+70 406-481-1522', 'Matricula155@gmail.com', 'Hombre', '2013-2019', 'Primaria', 1),
('Matricula160', 'CURP160', 'NÁLIDA', 'MORA', 'GUTIERREZ', '2014-04-02', '+37 608-203-4021', 'Matricula160@gmail.com', 'Mujer', '2010-2013', 'Secundaria', 1),
('Matricula170', 'CURP170', 'DOLORES', 'ENRIQUEZ', 'BATISTA', '2015-03-13', '+21 423-557-9097', 'Matricula170@gmail.com', 'Mujer', '2010-2016', 'Primaria', 1),
('Matricula173', 'CURP173', 'GEDEÓN', 'BAYER', 'CABALLERO', '2015-03-11', '+74 447-763-7717', 'Matricula173@gmail.com', 'Hombre', '2013-2019', 'Primaria', 1),
('Matricula192', 'CURP192', 'DIANA', 'MORENO', 'GALVAN', '2009-12-10', '+66 633-255-3665', 'Matricula192@gmail.com', 'Mujer', '2013-2016', 'Secundaria', 0),
('Matricula196', 'CURP196', 'GASPAR', 'GÁEMES', 'GALINDO', '2013-03-03', '+57 659-542-7039', 'Matricula196@gmail.com', 'Hombre', '2012-2018', 'Primaria', 1),
('Matricula203', 'CURP203', 'ISAÍAS', 'BATRES', 'DIMÍNGUEZ', '2015-04-14', '+73 740-226-9543', 'Matricula203@gmail.com', 'Hombre', '2011-2014', 'Secundaria', 1),
('Matricula23', 'CURP23', 'ISA?AS', 'NEGRETE', 'VIVAR', '2013-03-18', '+90 643-429-5215', 'Matricula23@gmail.com', 'Hombre', '2014-2017', 'Secundaria', 1),
('Matricula230', 'CURP230', 'GREGORIO', 'GOMEZ', 'AGUSTÍN', '2010-08-13', '+39 373-149-5865', 'Matricula230@gmail.com', 'Hombre', '2014-2020', 'Primaria', 1),
('Matricula238', 'CURP238', 'LUIS', 'ALCOCER', 'GOIRI', '2015-06-16', '+62 951-629-7816', 'Matricula238@gmail.com', 'Hombre', '2014-2020', 'Primaria', 0),
('Matricula245', 'CURP245', 'CAMELIA', 'BURGOS', 'RUBALCAVA', '2014-10-01', '+75 528-135-6941', 'Matricula245@gmail.com', 'Mujer', '2014-2020', 'Primaria', 1),
('Matricula257', 'CURP257', 'FLORA', 'ABARCA', 'CAPISTRAN', '2008-03-01', '+73 107-667-1230', 'Matricula257@gmail.com', 'Mujer', '2012-2018', 'Primaria', 1),
('Matricula3232', 'CURP3232', 'Jair', 'Vásquez', 'Martinez', '2005-06-07', '7771112223', 'jair@gmail.com', 'Hombre', '2013-2016', 'Secundaria', 1),
('Matricula333', 'CURP333', 'JAIR', 'VÁSQUEZ', 'MARITNEZ', '2011-06-23', '7775893621', 'jair@gmail.com', 'Hombre', '2013-2016', 'Secundaria', 0),
('Matricula5', 'CURP5', 'RENATA', 'CASAS', 'GRANADA', '2006-06-12', '+13 595-549-4327', 'Matricula5@gmail.com', 'Mujer', '2011-2014', 'Secundaria', 1),
('Matricula55', 'CURP55', 'SANTIAGO', 'ESPINOSA', 'ALLER', '2013-06-21', '+57 733-804-8348', 'Matricula55@gmail.com', 'Hombre', '2012-2015', 'Secundaria', 1),
('Matricula57', 'CURP57', 'ADELAIDA', 'VAZQUEZ', 'ANDUAGA', '2008-12-20', '+39 316-148-6763', 'Matricula57@gmail.com', 'Mujer', '2013-2016', 'Secundaria', 0),
('Matricula98', 'CURP98', 'MARTA', 'SALAZAR', 'GRANDE', '2010-04-01', '+29 913-120-7229', 'Matricula98@gmail.com', 'Mujer', '2012-2018', 'Primaria', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
