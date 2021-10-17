-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-10-2021 a las 20:18:25
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto-hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camas`
--

CREATE TABLE `camas` (
  `id` int NOT NULL,
  `numero_cama` int NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `camas`
--

INSERT INTO `camas` (`id`, `numero_cama`, `disponible`) VALUES
(1, 1, 1),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(39, 39, 1),
(40, 40, 1),
(41, 41, 1),
(42, 42, 1),
(43, 43, 1),
(44, 44, 1),
(45, 45, 1),
(46, 46, 1),
(47, 47, 1),
(48, 48, 1),
(49, 49, 1),
(50, 50, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int NOT NULL,
  `nombre` varchar(400) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `edad` int NOT NULL,
  `numero_personal` bigint NOT NULL,
  `numero_familiar` bigint NOT NULL,
  `direccion` text NOT NULL,
  `enfermedad` varchar(400) NOT NULL,
  `medicamento_habitual` varchar(300) NOT NULL,
  `cirugias` int NOT NULL,
  `habitos_alimentos` text NOT NULL,
  `habitos_ejercicio` text NOT NULL,
  `fumador` varchar(500) NOT NULL,
  `alcoholico` varchar(500) NOT NULL,
  `toma_cafe` varchar(400) NOT NULL,
  `enfermedad_familiar` text NOT NULL,
  `motivo` longtext NOT NULL,
  `medicamento_hosp` text NOT NULL,
  `observacion` longtext NOT NULL,
  `dado_alta` tinyint(1) NOT NULL DEFAULT '0',
  `id_cama` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `sexo`, `edad`, `numero_personal`, `numero_familiar`, `direccion`, `enfermedad`, `medicamento_habitual`, `cirugias`, `habitos_alimentos`, `habitos_ejercicio`, `fumador`, `alcoholico`, `toma_cafe`, `enfermedad_familiar`, `motivo`, `medicamento_hosp`, `observacion`, `dado_alta`, `id_cama`) VALUES
(2, 'Julio', 'Rodriguez', 'Masculino', 22, 4121075643, 4121075641, 'Valera, cobrapza', 'Ejemplo', 'Acetaminofen', 0, 'Come mucha manzana', 'Ninguno', 'no', 'Si. Una vez al mes', 'Cada dos semanas', 'Ninguna', 'Tiene infeccion estomacal', 'loperamida', 'Ha sido vacunado hace 3 dias', 1, NULL),
(6, 'Carlos', 'Jose', 'Masculino', 2, 122223, 1221, 'Santa ana, Merida', 'Migraña', 'DOL', 0, 'No desayuna arepas', 'Dos veces a la semana va el GYM', 'Si. Cada dos dias', 'si, cada dos semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 0, 2),
(8, 'Carlos', 'Jose', 'Masculino', 2, 1222223, 12221, 'Santa ana, Merida', 'Migraña', 'DOL', 0, 'No desayuna arepas', 'Dos veces a la semana va el GYM', 'Si. Cada dos dias', 'si, cada dos semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 0, 3),
(10, 'Carlos', 'Jose', 'Masculino', 2, 12222223, 122221, 'Santa ana, Merida', 'Migraña', 'DOL', 0, 'No desayuna arepas', 'Dos veces a la semana va el GYM', 'Si. Cada dos dias', 'si, cada dos semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 0, 4),
(11, 'Diana', 'Perez', 'Femenino', 2, 4122222232, 4142232232, 'Carvajal, campo alegreg', 'Fiebre', 'Ninguno', 0, 'ejeml', 'Dos veces a la semana va el GYM', 'Si. Cada dos dias', 'si, cada dos semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 0, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `camas`
--
ALTER TABLE `camas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_personal` (`numero_personal`),
  ADD UNIQUE KEY `numero_familiar` (`numero_familiar`),
  ADD KEY `id_cama` (`id_cama`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `camas`
--
ALTER TABLE `camas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_cama`) REFERENCES `camas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
