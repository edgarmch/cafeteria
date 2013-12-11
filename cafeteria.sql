-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 10, 2013 at 07:59 PM
-- Server version: 5.5.34
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cafeteria`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalogos`
--

CREATE TABLE IF NOT EXISTS `catalogos` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idtipo_producto` int(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `k_tipo_producti_idx` (`idtipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `idclientes` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido_pat` varchar(45) DEFAULT NULL,
  `apellido_mat` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(65) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `contraseña` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idclientes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `idempleados` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(45) DEFAULT NULL,
  `contraseña` varchar(15) DEFAULT NULL,
  `idpuesto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idempleados`),
  KEY `k_puesto_idx` (`idpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mesas`
--

CREATE TABLE IF NOT EXISTS `mesas` (
  `idmesas` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) DEFAULT NULL,
  `idempleados` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmesas`),
  KEY `k_mesas_idx` (`idempleados`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ordens`
--

CREATE TABLE IF NOT EXISTS `ordens` (
  `idorden` int(11) NOT NULL AUTO_INCREMENT,
  `idclientes` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  `costo_total` int(11) DEFAULT NULL,
  `fecha_orden` date DEFAULT NULL,
  `ventas_idventas` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idorden`,`ventas_idventas`),
  KEY `k_orden_cliente_idx` (`idclientes`),
  KEY `fk_orden_ventas1_idx` (`ventas_idventas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `productos_vendidos`
--

CREATE TABLE IF NOT EXISTS `productos_vendidos` (
  `catálogo_idproducto` int(11) NOT NULL DEFAULT '0',
  `orden_idorden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`catálogo_idproducto`,`orden_idorden`),
  KEY `fk_catálogo_has_orden_orden1_idx` (`orden_idorden`),
  KEY `fk_catálogo_has_orden_catálogo1_idx` (`catálogo_idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `puestos`
--

CREATE TABLE IF NOT EXISTS `puestos` (
  `idpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_productos`
--

CREATE TABLE IF NOT EXISTS `tipo_productos` (
  `idtipo_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `idventas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ventas` date DEFAULT NULL,
  `utilidad` int(11) DEFAULT NULL,
  `idorden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idventas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalogos`
--
ALTER TABLE `catalogos`
  ADD CONSTRAINT `k_tipo_producti` FOREIGN KEY (`idtipo_producto`) REFERENCES `tipo_productos` (`idtipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `k_puesto` FOREIGN KEY (`idpuesto`) REFERENCES `puestos` (`idpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `k_mesas` FOREIGN KEY (`idempleados`) REFERENCES `empleados` (`idempleados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ordens`
--
ALTER TABLE `ordens`
  ADD CONSTRAINT `fk_orden_ventas1` FOREIGN KEY (`ventas_idventas`) REFERENCES `ventas` (`idventas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `k_orden_cliente` FOREIGN KEY (`idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productos_vendidos`
--
ALTER TABLE `productos_vendidos`
  ADD CONSTRAINT `fk_catálogo_has_orden_catálogo1` FOREIGN KEY (`catálogo_idproducto`) REFERENCES `catalogos` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_catálogo_has_orden_orden1` FOREIGN KEY (`orden_idorden`) REFERENCES `ordens` (`idorden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
