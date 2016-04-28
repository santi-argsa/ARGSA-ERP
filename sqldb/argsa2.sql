-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2016 a las 23:01:57
-- Versión del servidor: 5.6.11
-- Versión de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `argsa`
--
CREATE DATABASE IF NOT EXISTS `argsa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `argsa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operaciones`
--

CREATE TABLE IF NOT EXISTS `operaciones` (
  `idventa` double NOT NULL AUTO_INCREMENT,
  `codigobarra` varchar(64) DEFAULT NULL,
  `cantvend` int(11) DEFAULT NULL,
  `precioprod` float DEFAULT NULL,
  `monto` float DEFAULT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`idventa`, `codigobarra`, `cantvend`, `precioprod`, `monto`) VALUES
(5, '', 0, 0, 0),
(17, '', 0, 0, 0),
(18, '', 0, 0, 0),
(19, '', 0, 0, 0),
(20, '', 0, 0, 0),
(21, '', 0, 0, 0),
(22, '', 0, 0, 0),
(23, '', 0, 0, 0),
(24, '', 0, 0, 0),
(25, '', 0, 0, 0),
(26, '', 0, 0, 0),
(27, '', 0, 0, 0),
(28, '', 0, 0, 0),
(29, '', 0, 0, 0),
(30, '', 0, 0, 0),
(31, '', 0, 0, 0),
(32, '', 0, 0, 0),
(33, '', 0, 0, 0),
(34, '', 0, 0, 0),
(46, '123456', 25, 150, 3750),
(48, '75321698', 20, 93, 1860);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigobarra` double DEFAULT NULL,
  `nombre` varchar(32) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `stockexistente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `codigobarra`, `nombre`, `precio`, `stockexistente`) VALUES
(1, 754125, 'SHAMPOO XXL2', 150, 96),
(2, 123456, 'ACONDICIONADOR XXL2', 150, 95),
(3, 789632541, 'AFEITADORA RELD', 255, 95),
(4, 75321698, 'TIJERA SOLARD', 93, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `passwd`, `email`) VALUES
(1, 'santiago', 'malvinas', 'lucentesanti@erp.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
