-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-10-2021 a las 01:22:25
-- Versión del servidor: 8.0.26-0ubuntu0.20.04.3
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
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 0),
(12, 12, 0),
(13, 13, 0),
(14, 14, 0),
(15, 15, 0),
(16, 16, 0),
(17, 17, 0),
(18, 18, 0),
(19, 19, 0),
(20, 20, 0),
(21, 21, 0),
(22, 22, 0),
(23, 23, 0),
(24, 24, 0),
(25, 25, 0),
(26, 26, 0),
(27, 27, 0),
(28, 28, 0),
(29, 29, 0),
(30, 30, 0),
(31, 31, 0),
(32, 32, 0),
(33, 33, 0),
(34, 34, 0),
(35, 35, 0),
(36, 36, 0),
(37, 37, 0),
(38, 38, 0),
(39, 39, 0),
(40, 40, 0),
(41, 41, 0),
(42, 42, 0),
(43, 43, 0),
(44, 44, 0),
(45, 45, 0),
(46, 46, 0),
(47, 47, 0),
(48, 48, 0),
(49, 49, 0),
(50, 50, 0);

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
  `id_cama` int DEFAULT NULL,
  `fecha_ingreso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `sexo`, `edad`, `numero_personal`, `numero_familiar`, `direccion`, `enfermedad`, `medicamento_habitual`, `cirugias`, `habitos_alimentos`, `habitos_ejercicio`, `fumador`, `alcoholico`, `toma_cafe`, `enfermedad_familiar`, `motivo`, `medicamento_hosp`, `observacion`, `dado_alta`, `id_cama`, `fecha_ingreso`) VALUES
(2, 'Julio', 'Rodriguez', 'Masculino', 22, 4121075643, 4121075641, 'Valera, cobrapza', 'Diarrea', 'Acetaminofen', 0, 'Come mucha manzana', 'Ninguno', 'no', 'Si. Una vez al mes', 'Si. Cada dos semanas', 'Ninguna', 'Tiene infeccion estomacal', 'loperamida', 'Ha sido vacunado hace 3 dias', 1, NULL, '2021-10-24 22:01:35'),
(6, 'Carlos', 'Jose', 'Masculino', 18, 122223, 1221, 'Santa ana, Merida', 'Migraña', 'DOL', 0, 'No desayuna arepas', 'Dos veces a la semana va el GYM', 'Si. Cada dos dias', 'si, cada dos semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 0, 2, '2021-10-24 22:01:35'),
(11, 'Diana', 'Perez', 'Femenino', 15, 4122222232, 4142232232, 'Carvajal, campo alegre', 'Fiebre', 'Ninguno', 0, 'No come grasa', 'Hace cardio una vez al dia', 'No', 'si, cada tres semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 0, 3, '2021-10-24 22:01:35'),
(13, 'Jose', 'Paez', 'Masculino', 30, 1212, 1212122, 'Motatan', 'Vomito', 'Bugresic', 0, 'No tiene', 'No hace ejercicio', 'No', 'Si. cada 2 meses', 'Si. En las mañana y noche', 'No poseen', 'Vomito agudo', 'Acetaminofen', 'Ninguna', 0, 1, '2021-10-24 22:01:35'),
(18, 'Manuel', 'Avila', 'Masculino', 22, 4147154561, 4147154562, 'Las Acacias', 'Dolor en los ojos', 'Ninguno', 0, 'Come arroz de almuerzo', 'Ninguno', 'Si. Todos los dias', 'No', 'Si. Todos los dias', 'Ninguno', 'Dolor intenso en los ojos', 'DOL', 'No usa lentes', 0, 26, '2021-10-24 23:17:14'),
(19, 'Jose', 'Garcia', 'Masculino', 60, 41471545611, 41471545615, 'San Luis', 'Cancer', 'Buprenorfina', 1, 'Solo come al horno', 'Camina las mañanas', 'Si. Cuando tenia 50 ', 'No', 'Si. Por las tarde ', 'Diabetez', 'Dolor de hueso', 'Celecoxib', 'Ninguna', 0, NULL, '2021-10-24 23:21:44'),
(20, 'Maria', 'Cano', 'Femenino', 30, 412335632, 412335631, 'La paz, Trujillo', 'Nervios', 'diazepam', 0, 'Come mucho huevo', 'Ninguno', 'No', 'No', 'Si. Cada3 horas ', 'Problemas psicoligicos y violencia', 'Nervios y panico intenso', 'estazolam', 'Toma mucho cafe', 0, NULL, '2021-10-24 23:31:30');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
