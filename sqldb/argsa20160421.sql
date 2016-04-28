-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2016 a las 22:33:58
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
  `cantvend` varchar(32) DEFAULT NULL,
  `precioprod` varchar(32) DEFAULT NULL,
  `monto` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=157 ;

--
-- Volcado de datos para la tabla `operaciones`
--

INSERT INTO `operaciones` (`idventa`, `codigobarra`, `cantvend`, `precioprod`, `monto`) VALUES
(84, '754125', '25', '150', '3750'),
(85, '123456', '36', '150', '5400'),
(86, '789632541', '9512', '255', '2425560'),
(87, '75321698', '5', '93', '465'),
(88, '123456', '36', '150', '450'),
(89, '754125', '25', '150', '2250'),
(90, '123456', '36', '150', '3750'),
(91, '123456', '36', '150', '3750'),
(92, '123456', '36', '150', '3750'),
(93, '123456', '36', '150', '3750'),
(94, '123456', '36', '150', '150'),
(95, '123456', '36', '150', '150'),
(96, '123456', '36', '150', '150'),
(97, '123456', '36', '150', '150'),
(98, '123456', '36', '150', '150'),
(99, '123456', '36', '150', '150'),
(100, '123456', '36', '150', '150'),
(101, '123456', '36', '150', '150'),
(102, '123456', '36', '150', '150'),
(103, '123456', '36', '150', '150'),
(104, '123456', '36', '150', '150'),
(105, '123456', '', '150', '150'),
(106, '123456', '36', '150', '150'),
(107, '123456', '36', '150', '150'),
(108, '123456', '36', '150', '150'),
(109, '123456', '36', '150', '150'),
(110, '123456', '36', '150', '150'),
(111, '123456', '36', '150', '150'),
(112, '754125', '25', '150', '300'),
(113, '123456', '36', '150', '150'),
(114, '123456', '36', '150', '150'),
(115, '', 'NaN', '', '0'),
(116, '', 'NaN', '', '0'),
(117, '', 'NaN', '', '0'),
(118, '123456', '36', '150', '150'),
(119, '123456', '36', '150', '150'),
(120, '754125', '25', '150', '2250'),
(121, '123456', '36', '150', '150'),
(122, '754125', '25', '150', '2250'),
(123, '123456', '36', '150', '150'),
(124, '754125', '25', '150', '150'),
(125, '123456', '36', '150', '150'),
(126, '123456', '36', '150', '150'),
(127, '123456', '36', '150', '150'),
(128, '123456', '36', '150', '150'),
(129, '123456', '36', '150', '150'),
(130, '123456', '36', '150', '150'),
(131, '123456', '36', '150', '150'),
(132, '123456', '36', '150', '150'),
(133, '123456', '36', '150', '150'),
(134, '754125', '25', '150', '150'),
(135, '123456', '36', '150', '450'),
(136, '754125', '25', '150', '900'),
(137, '123456', '36', '150', '150'),
(138, '123456', '36', '150', '150'),
(139, '123456', '36', '150', '150'),
(140, '123456', '6', '150', '900'),
(141, '123456', '1', '150', '150'),
(142, '123456', '1', '150', '150'),
(143, '123456', '1', '150', '150'),
(144, '123456', '1', '150', '150'),
(145, '123456', '1', '150', '150'),
(146, '123456', '5', '150', '750'),
(147, '123456', '1', '150', '150'),
(148, '123456', '1', '150', '150'),
(149, '123456', '1', '150', '150'),
(150, '754125', '1', '150', '150'),
(151, '754125', '1', '150', '150'),
(152, '754125', '1', '150', '150'),
(153, '123456', '1', '150', '150'),
(154, '123456', '1', '150', '150'),
(155, '123456', '1', '150', '150'),
(156, '123456', '1', '150', '150');

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
(1, 754125, 'SHAMPOO XXL2', 150, 22),
(2, 123456, 'ACONDICIONADOR XXL2', 150, 23),
(3, 789632541, 'AFEITADORA RELD', 255, 9512),
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
(1, 'Santiago', 'malvinas', 'lucentesanti@erp.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
