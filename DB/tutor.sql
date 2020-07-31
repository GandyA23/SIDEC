-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2020 at 11:02 PM
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
-- Table structure for table `tutor`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=308 ;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`Id`, `Nombre`, `Apellido1`, `Apellido2`, `TelefonoPersonal`, `TelefonoTrabajo`, `Correo`, `Genero`) VALUES
(null, 'ELOY', 'SALAZAR', 'SANCHEZ', '+90 389-433-2343', '+73 813-390-5207', 'Matricula6@gmail.com', 'Hombre'),
(null, 'ESTELA', 'CEPEDA', 'ROSALIO', '+93 196-666-5611', '+19 530-502-3390', 'Matricula7@gmail.com', 'Mujer'),
(null, 'HEIDI', 'OLEA', 'ZAVALA', '+86 958-986-3953', '+78 413-540-9698', 'Matricula9@gmail.com', 'Mujer'),
(null, 'AMPARO', 'CALDERON', 'MIRANDA', '+73 392-933-2287', '+35 761-335-2736', 'Matricula10@gmail.com', 'Hombre'),
(null, 'TOMÁS', 'OLIVOS', 'ESPARZA', '+94 580-214-3274', '+76 583-697-2115', 'Matricula15@gmail.com', 'Hombre'),
(null, 'RAIMUNDO', 'DONCEL', 'TAPIA', '+74 464-194-7993', '+96 118-555-8579', 'Matricula40@gmail.com', 'Hombre'),
(null, 'CELIA', 'ENCINAS', 'SANZ', '+73 477-435-1387', '+24 954-373-8534', 'Matricula45@gmail.com', 'Mujer'),
(null, 'ALIN', 'TAPIA', 'ALEGRÍA', '+106 132-737-6970', '+23 287-362-1406', 'Matricula49@gmail.com', 'Mujer'),
(null, 'ELENA', 'BARRIENTOS', 'ANTÍNEZ', '+73 399-171-5543', '+59 760-886-8873', 'Matricula60@gmail.com', 'Mujer'),
(null, 'LORENZO', 'CALDERÓN', 'GALVAN', '+52 157-377-9612', '+17 141-445-2058', 'Matricula61@gmail.com', 'Hombre'),
(null, 'JESSICA', 'SACRISTIN', 'VEGA', '+63 604-992-8795', '+53 202-671-1712', 'Matricula65@gmail.com', 'Mujer'),
(null, 'WALTER', 'ELEIZALDE', 'CERECERES', '+54 665-405-9947', '+55 237-936-5908', 'Matricula67@gmail.com', 'Hombre'),
(null, 'BELINDA', 'CARMONA', 'SALINAS', '+46 100-397-3176', '+89 503-993-1369', 'Matricula74@gmail.com', 'Mujer'),
(null, 'SORAYA', 'ESCALANTE', 'CONTRERAS', '+73 834-612-4993', '+62 389-382-2438', 'Matricula79@gmail.com', 'Mujer'),
(null, 'JULIANA', 'QUINTANA', 'ROSA', '+47 863-538-5455', '+28 766-533-2489', 'Matricula102@gmail.com', 'Mujer'),
(null, 'EDGARDO', 'CARRERAS', 'ALLER', '+79 968-161-9862', '+57 344-979-6992', 'Matricula115@gmail.com', 'Hombre'),
(null, 'EMILIANO', 'GUARDIOLA', 'DONAIRE', '+71 981-259-2004', '+25 789-262-2079', 'Matricula116@gmail.com', 'Hombre'),
(null, 'ANTONIO', 'ENRIQUEZ', 'GATICA', '+63 785-946-2368', '+62 922-760-4461', 'Matricula134@gmail.com', 'Hombre'),
(null, 'GRACIELA', 'CARRILLO', 'ECHEBERRÍA', '+78 627-559-8601', '+74 959-101-5585', 'Matricula136@gmail.com', 'Mujer'),
(null, 'DOMINGO', 'ITURBIDE', 'CAMACHO', '+95 997-687-7724', '+37 275-497-6072', 'Matricula149@gmail.com', 'Hombre'),
(null, 'IVONNE', 'CASTAÑEDA', 'ARANDA', '+105 270-348-5206', '+61 646-296-9369', 'Matricula160@gmail.com', 'Hombre'),
(null, 'ADALID', 'OLMEDO', 'AVELLANEDA', '+25 314-417-7351', '+16 133-559-8183', 'Matricula161@gmail.com', 'Mujer'),
(null, 'BLAS', 'TRUJILLO', 'FIERRO', '+74 193-702-6591', '+98 105-143-9312', 'Matricula164@gmail.com', 'Hombre'),
(null, 'PASCUAL', 'DIM?NGUEZ', 'RIOS', '+32 319-195-4797', '+13 378-548-5777', 'Matricula177@gmail.com', 'Hombre'),
(null, 'INDALECIO', 'PALOMINO', 'MIRELES', '+60 875-526-7999', '+29 699-234-1274', 'Matricula181@gmail.com', 'Hombre'),
(null, 'RUTH', 'ELEIZALDE', 'ABURTO', '+41 270-368-9512', '+66 377-318-3970', 'Matricula186@gmail.com', 'Mujer'),
(null, 'BR?GIDA', 'DORANTES', 'ROSALES', '+52 539-431-9226', '+55 307-677-7557', 'Matricula188@gmail.com', 'Mujer'),
(null, 'MATILDE', 'BAHENA', 'FLORES', '+18 386-261-7795', '+93 830-656-2651', 'Matricula189@gmail.com', 'Mujer'),
(null, 'REBECA', 'GOROSTIETA', 'CASTAÑARES', '+57 972-437-4247', '+82 134-941-1910', 'Matricula193@gmail.com', 'Mujer'),
(null, 'JES?S', 'LEYVA', 'CABELLO', '+99 872-925-3355', '+25 757-296-6770', 'Matricula196@gmail.com', 'Hombre'),
(null, 'H?CTOR', 'OLIVOS', 'MENDOZA', '+48 128-335-4931', '+39 572-522-6866', 'Matricula206@gmail.com', 'Hombre'),
(null, 'MARIANA', 'ACOSTA', 'RAMIREZ', '+76 107-212-3671', '+18 396-711-4027', 'Matricula217@gmail.com', 'Mujer'),
(null, 'CARLOS', 'BENITEZ', 'ALMEIDA', '+36 514-476-1322', '+19 855-186-9859', 'Matricula225@gmail.com', 'Hombre'),
(null, 'REINALDO', 'CLAVIJO', 'POBLANO', '+102 673-743-4561', '+50 743-276-4052', 'Matricula232@gmail.com', 'Hombre'),
(null, 'SERAPIO', 'ROA', 'RENDON', '+39 205-582-3628', '+96 230-254-2327', 'Matricula236@gmail.com', 'Hombre'),
(null, 'C?SAR', 'AMADOR', 'ALDAY', '+35 213-258-3314', '+58 966-486-4673', 'Matricula247@gmail.com', 'Hombre'),
(null, 'KEISI', 'MORALES', 'ONOFRE', '+24 878-974-4030', '+60 614-213-8897', 'Matricula252@gmail.com', 'Mujer'),
(null, 'PETRA', 'ZARZO', 'SAMANIEGO', '+77 121-955-3751', '+71 506-395-7670', 'Matricula255@gmail.com', 'Mujer'),
(null, 'NICOMEDES', 'O DONELL', 'CLEMENTE', '+36 245-951-1157', '+87 214-516-1211', 'Matricula279@gmail.com', 'Mujer'),
(null, 'TRINIDAD', 'ALVARADO', 'SERNA', '+43 730-819-3165', '+91 388-596-8958', 'Matricula286@gmail.com', 'Mujer'),
(null, 'JOANA', 'SARAVIA', 'ORTIZ', '+32 269-281-6407', '+85 225-914-8584', 'Matricula298@gmail.com', 'Mujer'),
(null, 'Jair', 'Vasquez', 'Espinoza', '7774170032', '7772003901', 'jair.vasquez023@gmail.com', 'Hombre'),
(null, 'David', 'Perez', 'Lorenz', '7772533355', '', 'davis232@gmail.com', 'Hombre'),
(null, 'Jose ', 'Perez', 'Leon', '7772005896', '', '', 'Hombre');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
