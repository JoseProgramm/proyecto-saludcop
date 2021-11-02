-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-11-2021 a las 21:01:27

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
(6, 'Carlos', 'Jose', 'Masculino', 18, 122223, 1221, 'Santa ana, Merida', 'Migraña', 'DOL', 0, 'No desayuna arepas', 'Dos veces a la semana va el GYM', 'Si. Cada dos dias', 'si, cada dos semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 1, NULL, '2021-10-24 22:01:35'),
(11, 'Diana', 'Perez', 'Femenino', 15, 4122222232, 4142232232, 'Carvajal, campo alegre', 'Fiebre', 'Ninguno', 0, 'No come grasa', 'Hace cardio una vez al dia', 'No', 'si, cada tres semanas', 'Si. Todas las mañanas', 'Diabetes', 'Tiene una migraña desde hace dos dias', 'Paracetamol', 'Ninguna', 1, NULL, '2021-10-24 22:01:35'),
(13, 'Jose', 'Paez', 'Masculino', 30, 1212, 1212122, 'Motatan', 'Vomito', 'Bugresic', 0, 'No tiene', 'No hace ejercicio', 'No', 'Si. cada 2 meses', 'Si. En las mañana y noche', 'No poseen', 'Vomito agudo', 'Acetaminofen', 'Ninguna', 0, 1, '2021-10-24 22:01:35'),
(19, 'Jose', 'Garcia', 'Masculino', 60, 41471545611, 41471545615, 'San Luis', 'Cancer', 'Buprenorfina', 1, 'Solo come al horno', 'Camina las mañanas', 'Si. Cuando tenia 50 ', 'No', 'Si. Por las tarde ', 'Diabetez', 'Dolor de hueso', 'Celecoxib', 'Ninguna', 0, 2, '2021-10-24 23:21:44'),
(20, 'Maria', 'Cano', 'Femenino', 30, 412335632, 412335631, 'La paz, Trujillo', 'Nervios', 'diazepam', 0, 'Come mucho huevo', 'Ninguno', 'No', 'No', 'Si. Cada3 horas ', 'Problemas psicoligicos y violencia', 'Nervios y panico intenso', 'estazolam', 'Toma mucho cafe', 1, NULL, '2021-10-24 23:31:30'),
(21, 'Enderson', 'Moran', 'Masculino', 31, 4147154560, 4147154561, 'Beatriz, bloque 9', 'Azucar alta', 'insulina', 0, 'Como mucho', 'Niguno', 'No', 'Si. todos los fines de semana ', 'No', 'Diabetez', 'Azucar muy alta', 'Metformina', 'Toma mucho alcohol', 0, 3, '2021-11-01 22:23:11'),
(22, 'Jose', 'Perez', 'Masculino', 22, 4147154562, 4147154522, 'San luis', 'Gastritis', 'Protonix', 0, 'Ninguno', 'Ninguno', 'No', 'No', 'Si. Todas las mañanas ', 'Diabetez', 'Gastritis intensa', 'Dexilant', 'Ninguna', 0, 4, '2021-11-01 22:34:51'),
(23, 'Mariangel', 'Cornelis', 'Femenino', 13, 4121075632, 4247135571, 'Maracaibo, Pueblo Nuevo', 'Anemia', 'Corticoesteroides', 1, 'Come mucha salsa roja', 'No realiza actividad fisica', 'No', 'No', 'Si. Mañanas y tardes ', 'Diabetez, Hipertension', 'Se siente muy debil', 'Transfusiones de sangre.', 'Sangre A negativo', 0, 5, '2021-11-01 22:46:28'),
(24, 'Jhenny', 'Artigas', 'Femenino', 34, 4247135571, 2716672514, 'Maracaibo, la Victoria', 'Dolor en la muela', 'Ibuprofeno', 0, 'Come ensalada de frutas los viernes', 'Realiza cardio las mañana', 'No', 'Si. Solo en fiestas ', 'Si. En las tardes ', 'Diabetes', 'Dolor de muela en la parte inferior, no le permite comer ni dormin', 'Naproxeno', 'Considerar extraer muela por caries', 0, 6, '2021-11-01 22:50:03'),
(25, 'Dayanna', 'Alviarez', 'Femenino', 42, 41213244, 2716672321, 'Comuna Antonio Nicolas Briceño', 'Gripe', 'Acetaminofen', 0, 'No hace diete', '3 veces por semana', 'No', 'No', 'Si. Todas las mañanas ', 'Ninguna', 'Gripe con flema', 'Oseltamivir', 'No es COVID-19', 0, 7, '2021-11-01 22:52:55'),
(26, 'Anny', 'Marquinez', 'Femenino', 27, 4167743501, 4167743502, 'Maracaibo, la victoria', 'Diarrea', 'Kaopectate', 0, 'Evita frituras', 'Ninguna', 'No', 'No', 'Si. Mañana y tardes ', 'Hipertension', 'Diarrea y deshidratación', 'Pepto-Bismol', 'Ingirió comida pesada en la cena', 0, 8, '2021-11-01 22:56:30'),
(32, 'Elizabeth', 'Godoy', 'Femenino', 22, 27166242, 41471545620, 'Motatan', 'Fiebre', 'Paracetamol', 0, 'Come frutas todas las tardes', 'Levanta pesas', 'Si. 2 veces por semana ', 'No', 'No', 'Ninguno', 'Fiebre y dolor de cuerpo', 'Ibuprofeno', 'Fiebre a 45°', 0, 9, '2021-11-01 23:28:03'),
(33, 'Daniel', 'Jose', 'Femenino', 33, 414715011, 41471523011, 'Carvajal, El filo', 'Quemadura de 2 gradura', 'Ibuprofeno', 1, 'Ninguni', 'Ninguno', 'No', 'Si. Cada dos dias ', 'No', 'Aleve', 'Quemadura de segundo grado, le cayo aceite caliente en la cara', 'Advil', 'La herida esta cerca del ojo', 0, 10, '2021-11-01 23:31:50'),
(34, 'Enmanuel', 'Jose', 'Masculino', 12, 4147154567, 4147154566, 'Mendoza fria', 'Dolor de ojos', 'Ninguno', 0, 'Come mucha frituras', 'No realiza actividad fisica', 'No', 'Si. Mañana y nochse ', 'No', 'Demencia', 'Dolor en los ojos y espalda', 'lodoxamida oftalmatica', 'No ha dormido', 0, 11, '2021-11-01 23:40:45'),
(35, 'Jesus', 'Garcia', 'Masculino', 23, 4147154564, 147154560, 'Carvajal, Trujillo', 'Dolor de huesos', 'Diclofenaco', 2, 'Come solo a la plancha', 'Realiza yoga las tardes', 'Si. Cada 5 dias ', 'No', 'No', 'Cancer', 'Dolor en los huesos y cuerpo', 'Etodolaco', 'Ninguna', 0, 12, '2021-11-01 23:52:17');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
