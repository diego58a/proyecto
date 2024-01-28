-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2024 a las 00:45:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `institucion`
--
CREATE DATABASE IF NOT EXISTS `institucion` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `institucion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `apellido` varchar(256) NOT NULL,
  `cedula` varchar(9) NOT NULL,
  `grado` varchar(15) NOT NULL,
  `foto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `codigo`, `nombre`, `apellido`, `cedula`, `grado`, `foto`) VALUES
(1, '200205', 'Anazzz', 'Bermudeezzz', '32548495', '1', ''),
(2, '100002', 'Juan', 'Soteldo', '7832463', '1', ''),
(3, '100003', 'Pedro', 'Poncio', '6158188', '1', ''),
(5, '100005', 'Luis', 'Tucan', '2590044', '1', ''),
(6, '100006', 'Andrea', 'Petit', '8939378 ', '1', ''),
(7, '100007', 'Shirley', 'García', '1237869', '1', ''),
(8, '100008', 'Luisa', 'Soto', '6178842', '1', ''),
(9, '100009', 'Luisana', 'Vargas', '8786952', '1', ''),
(10, '100010', 'Diana', 'Petit', '215887', '1', ''),
(11, '200001', 'Daniela', 'Campos', '3540898', '2', ''),
(12, '200002', 'Juana', 'Ocampo', '3919169', '2', ''),
(13, '200003', 'Cindy', 'Ocasio', '8388404', '2', ''),
(14, '200004', 'Ara', 'Gazmey', '3174912', '2', ''),
(15, '200005', 'Ana', 'Sandoval', '3519936', '2', ''),
(16, '200007', 'Roxy', 'Daza', '8810637', '2', ''),
(17, '200008', 'Rosa', 'Diaz', '3547000', '2', ''),
(18, '200009', 'María', 'Camargo', '2100065', '2', ''),
(19, '200010', 'Valeria', 'Ramos', '4181540', '2', ''),
(20, '200006', 'Mafer', 'García', '1292333', '2', ''),
(21, '300001', 'Nina', 'Marin', '1647508', '3', ''),
(25, '300003', 'Sofia', 'Andrade', '9770762', '3', ''),
(26, '300004', 'Jesus', 'Letargo', '6907113', '3', ''),
(27, '300005', 'Joan', 'Mandela', '4114291', '3', ''),
(28, '300006', 'Joel', 'Garces', '1110744', '3', ''),
(29, '300007', 'Julieta', 'Quiva', '4325845', '3', ''),
(30, '300008', 'Kely', 'Mogollon', '5964662', '3', ''),
(31, '300009', 'Laura', 'de los Angeles', '4671396', '3', ''),
(32, '300010', 'Julia', 'Zambrano', '7734532', '3', ''),
(34, '100011', 'John', 'Fernandez', '30843814', '1', ''),
(35, '100011', 'John', 'Fernandez', '30843814', '1', ''),
(36, '100015', 'Andres', 'Quevedo', '25469875', '1', '65ada05bed657.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id_materia` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `grado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id_materia`, `codigo`, `nombre`, `grado`) VALUES
(1, 'cast1', 'Castellano', '1'),
(2, 'ing2', 'Ingles', '2'),
(3, 'ing3', 'Ingles', '3'),
(4, 'ing4', 'Ingles', '4'),
(5, 'ing5', 'Ingles', '5'),
(6, 'cast1', 'Castellano', '1'),
(7, 'cast2', 'Castellano', '2'),
(8, 'cast3', 'Castellano', '3'),
(9, 'cast4', 'Castellano', '4'),
(10, 'cast5', 'Castellano', '5'),
(11, 'proy1', 'Proyecto', '1'),
(12, 'proy2', 'Proyecto', '2'),
(13, 'proy3', 'Proyecto', '3'),
(14, 'proy4', 'Proyecto', '4'),
(15, 'proy5', 'Proyecto', '5'),
(16, 'mat1', 'Matematicas', '1'),
(17, 'dep1', 'Deporte', '1'),
(18, 'mat2', 'Matematicas', '2'),
(19, 'dep2', 'Deporte', '2'),
(20, 'mat3', 'Matematicas', '3'),
(21, 'dep3', 'Deporte', '3'),
(22, 'mat4', 'Matematicas', '4'),
(23, 'dep4', 'Deporte', '4'),
(24, 'mat5', 'Matematicas', '5'),
(25, 'dep5', 'Deporte', '5'),
(26, 'mat1', 'Matematicas', '1'),
(27, 'Dep1', 'Deporte', '1'),
(28, 'cs1', 'Ciencias', '1'),
(29, 'cs2', 'Ciencias', '2'),
(30, 'cs3', 'Ciencias', '3'),
(31, 'cs4', 'Ciencias', '4'),
(32, 'cs5', 'Ciencias', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `nota` varchar(10) NOT NULL,
  `lapso` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_nota`, `id_materia`, `id_alumno`, `id_periodo`, `nota`, `lapso`) VALUES
(1, 1, 2, 2, '20', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id_periodo` int(11) NOT NULL,
  `periodo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`id_periodo`, `periodo`) VALUES
(1, '22/23'),
(2, '23/24'),
(3, '24/25');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id_materia`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_materia` (`id_materia`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_periodo` (`id_periodo`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id_periodo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_materia`) REFERENCES `materias` (`id_materia`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
