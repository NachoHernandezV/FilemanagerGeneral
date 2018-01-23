-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 23, 2018 at 06:09 PM
-- Server version: 5.7.13-log
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `almacenararchivos`
--
CREATE DATABASE IF NOT EXISTS `almacenararchivos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `almacenararchivos`;

-- --------------------------------------------------------

--
-- Table structure for table `archivos`
--

DROP TABLE IF EXISTS `archivos`;
CREATE TABLE `archivos` (
  `idarchivo` int(11) NOT NULL,
  `nombrearchivo` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `nombrereal` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `idcarpeta` int(11) NOT NULL,
  `iddepartamento` int(10) NOT NULL,
  `creador` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `archivos`
--

INSERT INTO `archivos` (`idarchivo`, `nombrearchivo`, `nombrereal`, `fecha`, `departamento`, `idcarpeta`, `iddepartamento`, `creador`) VALUES
(74, 'one', 'adivinanzaas.docx', '12:39   09-12-2016 ', 'Gerencia Planeacion', 24, 36, ''),
(75, 'PLAN_ S&OP_24-11-16_2', 'PLAN_ SaOP_24-11-16_2.xlsx', '09:38   20-12-2016 ', 'Gerencia Planeacion', 1, 36, ''),
(78, 'prueba', 'verbos compuestos.docx', '10:14   17-03-2017 ', 'Planeacion', 8, 23, ''),
(79, 'prueba', 'Doc1.docx', '16:24   11-04-2017 ', 'Investigacion', 0, 14, 'rodrigo'),
(82, 'reporte', 'report_20150824164722260.pdf', '15:56   12-04-2017 ', 'Investigacion', 16, 14, 'lili'),
(83, '6 archivo', '(6)CMF Carta Maestra de Formula.rar', '16:02   12-04-2017 ', 'Investigacion', 17, 14, 'lili'),
(84, 'CMF', '(6)CMF Carta Maestra de Formula.rar', '13:35   13-04-2017 ', 'Investigacion', 0, 14, 'lili');

-- --------------------------------------------------------

--
-- Table structure for table `carpetas`
--

DROP TABLE IF EXISTS `carpetas`;
CREATE TABLE `carpetas` (
  `idcarpeta` int(11) NOT NULL,
  `carpeta` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `carpetaMadre` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `iddepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `carpetas`
--

INSERT INTO `carpetas` (`idcarpeta`, `carpeta`, `carpetaMadre`, `departamento`, `iddepartamento`) VALUES
(1, 'S&OP', 'Cero', 'Gerencia Planeacion', 36),
(8, 'ejemplo', 'Cero', 'Planeacion', 23),
(17, 'segunda', 'prueba', 'Investigacion', 14),
(23, 'CMF', 'Cero', 'Investigacion', 14);

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `iddepartamento` int(11) NOT NULL,
  `departamento` varchar(130) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `departamentoJunto` varchar(130) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`iddepartamento`, `departamento`, `departamentoJunto`) VALUES
(1, 'Almacen', 'Almacen'),
(2, 'Basculas', 'Basculas'),
(3, 'Calidad', 'Calidad'),
(4, 'Cedi', 'Cedi'),
(5, 'Compras', 'Compras'),
(6, 'Contabilidad', 'Contabilidad'),
(7, 'Credito', 'Credito'),
(8, 'Direccion Administrativa', 'DireccionAdministrativa'),
(9, 'Direccion General', 'DireccionGeneral'),
(10, 'Embarques', 'Embarques'),
(11, 'Envasado', 'Envasado'),
(12, 'Sanidad Y Trigos', 'SanidadyTrigos'),
(13, 'Gestion de personal', 'Gestiondepersonal'),
(14, 'Investigacion', 'Investigacion'),
(15, 'Lab. Funcionales', 'LabFuncionales'),
(16, 'Lab. Harinas', 'LabHarinas'),
(17, 'Lab. Microbiologia', 'LabMicrobiologia'),
(18, 'Legal', 'Legal'),
(19, 'Mantenimiento', 'Mantenimiento'),
(20, 'Mezclas', 'Mezclas'),
(21, 'Molino', 'Molino'),
(22, 'Panaderia', 'Panaderia'),
(23, 'Planeacion', 'Planeacion'),
(24, 'Recepcion', 'Recepcion'),
(25, 'Ribera', 'Ribera'),
(26, 'Seguridad Industrial', 'SeguridadIndustrial'),
(27, 'Sistemas', 'Sistemas'),
(28, 'Tesoreria', 'Tesoreria'),
(29, 'Ventas', 'Ventas'),
(30, 'Direccion de Ventas', 'DirecciondeVentas'),
(31, 'Direccion de Calidad', 'DirecciondeCalidad'),
(32, 'Direccion de Produccion', 'DirecciondeProduccion'),
(33, 'Gerencia Investigacion', 'GerenciaInvestigacion'),
(34, 'Gerencia Cedi', 'GerenciaCedi'),
(35, 'Gerencia Mezclado', 'GerenciaMezclado'),
(36, 'Gerencia Planeacion', 'GerenciaPlaneacion');

-- --------------------------------------------------------

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `idgrupo` int(130) NOT NULL,
  `idusuario` int(9) NOT NULL,
  `nombregrupo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `idpermisos` int(7) NOT NULL,
  `idarchivo` int(7) NOT NULL,
  `Almacen` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Basculas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Calidad` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Cedi` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Compras` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Contabilidad` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Credito` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `DireccionAdministrativa` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `DireccionGeneral` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Embarques` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Envasado` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `SanidadyTrigos` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Gestiondepersonal` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Investigacion` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `LabFuncionales` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `LabHarinas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `LabMicrobiologia` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Legal` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Mantenimiento` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Mezclas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Molino` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Panaderia` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Planeacion` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Recepcion` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Ribera` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `SeguridadIndustrial` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Sistemas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Tesoreria` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Ventas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `DirecciondeVentas` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `DirecciondeCalidad` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `DirecciondeProduccion` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaInvestigacion` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaCedi` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaMezclado` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaPlaneacion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `permisos`
--

INSERT INTO `permisos` (`idpermisos`, `idarchivo`, `Almacen`, `Basculas`, `Calidad`, `Cedi`, `Compras`, `Contabilidad`, `Credito`, `DireccionAdministrativa`, `DireccionGeneral`, `Embarques`, `Envasado`, `SanidadyTrigos`, `Gestiondepersonal`, `Investigacion`, `LabFuncionales`, `LabHarinas`, `LabMicrobiologia`, `Legal`, `Mantenimiento`, `Mezclas`, `Molino`, `Panaderia`, `Planeacion`, `Recepcion`, `Ribera`, `SeguridadIndustrial`, `Sistemas`, `Tesoreria`, `Ventas`, `DirecciondeVentas`, `DirecciondeCalidad`, `DirecciondeProduccion`, `GerenciaInvestigacion`, `GerenciaCedi`, `GerenciaMezclado`, `GerenciaPlaneacion`) VALUES
(1, 75, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si'),
(4, 78, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si'),
(5, 0, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si'),
(6, 79, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'si', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'si'),
(9, 82, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no'),
(10, 83, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no'),
(11, 84, 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'no', 'si', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `permisosusuarios`
--

DROP TABLE IF EXISTS `permisosusuarios`;
CREATE TABLE `permisosusuarios` (
  `idpermisosuser` int(7) NOT NULL,
  `idusuario` int(7) NOT NULL,
  `Almacen` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Basculas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Calidad` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Cedi` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Compras` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Contabilidad` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Credito` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `DireccionAdministrativa` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `DireccionGeneral` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Embarques` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Envasado` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `SanidadyTrigos` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Gestiondepersonal` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Investigacion` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `LabFuncionales` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `LabHarinas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `LabMicrobiologia` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Legal` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Mantenimiento` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Mezclas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Molino` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Panaderia` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Planeacion` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Recepcion` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Ribera` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `SeguridadIndustrial` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Sistemas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Tesoreria` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `Ventas` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `DirecciondeVentas` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `DirecciondeCalidad` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `DirecciondeProduccion` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaInvestigacion` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaCedi` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaMezclado` varchar(130) COLLATE utf8_spanish2_ci NOT NULL,
  `GerenciaPlaneacion` varchar(120) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `permisosusuarios`
--

INSERT INTO `permisosusuarios` (`idpermisosuser`, `idusuario`, `Almacen`, `Basculas`, `Calidad`, `Cedi`, `Compras`, `Contabilidad`, `Credito`, `DireccionAdministrativa`, `DireccionGeneral`, `Embarques`, `Envasado`, `SanidadyTrigos`, `Gestiondepersonal`, `Investigacion`, `LabFuncionales`, `LabHarinas`, `LabMicrobiologia`, `Legal`, `Mantenimiento`, `Mezclas`, `Molino`, `Panaderia`, `Planeacion`, `Recepcion`, `Ribera`, `SeguridadIndustrial`, `Sistemas`, `Tesoreria`, `Ventas`, `DirecciondeVentas`, `DirecciondeCalidad`, `DirecciondeProduccion`, `GerenciaInvestigacion`, `GerenciaCedi`, `GerenciaMezclado`, `GerenciaPlaneacion`) VALUES
(4, 4, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'si', ''),
(5, 5, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'si', 'si'),
(7, 7, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'si', 'si'),
(8, 8, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si'),
(10, 10, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'no', 'no', 'no', 'si', 'no', 'no', 'no'),
(11, 11, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'no', 'no', 'no', 'si', 'no', 'no', 'no'),
(12, 12, 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'si', 'no', 'si', 'si', 'no', 'no', 'no', 'si', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `nivelpermiso` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `nombre`, `password`, `departamento`, `nivelpermiso`) VALUES
(4, 'IvanR', 'y69qJZDF', 'Gerencia Planeacion', 'E'),
(5, 'BiridianaR', 'L6x28w3x', 'Planeacion', 'E'),
(7, 'ManuelE', '0gUCvM9s', 'Ventas', 'E'),
(8, 'Edna', 'vq1kMT48', 'Gerencia Investigacion', 'E'),
(10, 'Amador', 'OJhizdX', 'Investigacion', 'E'),
(11, 'Rodrigo', '0EmBt4I', 'Investigacion', 'E'),
(12, 'lili', 'HJdm7FC', 'Investigacion', 'E');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`idarchivo`),
  ADD KEY `iddepartamento` (`iddepartamento`);

--
-- Indexes for table `carpetas`
--
ALTER TABLE `carpetas`
  ADD PRIMARY KEY (`idcarpeta`),
  ADD KEY `iddepartamento` (`iddepartamento`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indexes for table `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`idgrupo`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indexes for table `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`idpermisos`);

--
-- Indexes for table `permisosusuarios`
--
ALTER TABLE `permisosusuarios`
  ADD PRIMARY KEY (`idpermisosuser`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archivos`
--
ALTER TABLE `archivos`
  MODIFY `idarchivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `carpetas`
--
ALTER TABLE `carpetas`
  MODIFY `idcarpeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `iddepartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `grupos`
--
ALTER TABLE `grupos`
  MODIFY `idgrupo` int(130) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permisos`
--
ALTER TABLE `permisos`
  MODIFY `idpermisos` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `permisosusuarios`
--
ALTER TABLE `permisosusuarios`
  MODIFY `idpermisosuser` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_ibfk_1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`);

--
-- Constraints for table `carpetas`
--
ALTER TABLE `carpetas`
  ADD CONSTRAINT `carpetas_ibfk_1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamentos` (`iddepartamento`);

--
-- Constraints for table `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

--
-- Constraints for table `permisosusuarios`
--
ALTER TABLE `permisosusuarios`
  ADD CONSTRAINT `permisosusuarios_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
