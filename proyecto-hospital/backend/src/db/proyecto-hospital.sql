-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-11-2021 a las 15:55:54
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
(19, 'Jose', 'Garcia', 'Masculino', 60, 41471545611, 41471545615, 'San Luis', 'Cancer', 'Buprenorfina', 1, 'Solo come al horno', 'Camina las mañanas', 'Si. Cuando tenia 50 ', 'No', 'Si. Por las tarde ', 'Diabetez', 'Dolor de hueso', 'Celecoxib', 'Ninguna', 1, NULL, '2021-10-24 23:21:44'),
(20, 'Maria', 'Cano', 'Femenino', 30, 412335632, 412335631, 'La paz, Trujillo', 'Nervios', 'diazepam', 0, 'Come mucho huevo', 'Ninguno', 'No', 'No', 'Si. Cada3 horas ', 'Problemas psicoligicos y violencia', 'Nervios y panico intenso', 'estazolam', 'Toma mucho cafe', 1, NULL, '2021-10-24 23:31:30'),
(21, 'Enderson', 'Moran', 'Masculino', 31, 4147154560, 4147154561, 'Beatriz, bloque 9', 'Azucar alta', 'insulina', 0, 'Como mucho', 'Niguno', 'No', 'Si. todos los fines de semana ', 'No', 'Diabetez', 'Azucar muy alta', 'Metformina', 'Toma mucho alcohol', 0, 3, '2021-11-01 22:23:11'),
(22, 'Jose', 'Perez', 'Masculino', 22, 4147154562, 4147154522, 'San luis', 'Gastritis', 'Protonix', 0, 'Ninguno', 'Ninguno', 'No', 'No', 'Si. Todas las mañanas ', 'Diabetez', 'Gastritis intensa', 'Dexilant', 'Ninguna', 1, NULL, '2021-11-01 22:34:51'),
(23, 'Mariangel', 'Cornelis', 'Femenino', 13, 4121075632, 4247135571, 'Maracaibo, Pueblo Nuevo', 'Anemia', 'Corticoesteroides', 1, 'Come mucha salsa roja', 'No realiza actividad fisica', 'No', 'No', 'Si. Mañanas y tardes ', 'Diabetez, Hipertension', 'Se siente muy debil', 'Transfusiones de sangre.', 'Sangre A negativo', 0, 5, '2021-11-01 22:46:28'),
(24, 'Jhenny', 'Artigas', 'Femenino', 34, 4247135571, 2716672514, 'Maracaibo, la Victoria', 'Dolor en la muela', 'Ibuprofeno', 0, 'Come ensalada de frutas los viernes', 'Realiza cardio las mañana', 'No', 'Si. Solo en fiestas ', 'Si. En las tardes ', 'Diabetes', 'Dolor de muela en la parte inferior, no le permite comer ni dormin', 'Naproxeno', 'Considerar extraer muela por caries', 0, 6, '2021-11-01 22:50:03'),
(25, 'Dayanna', 'Alviarez', 'Femenino', 42, 41213244, 2716672321, 'Comuna Antonio Nicolas Briceño', 'Gripe', 'Acetaminofen', 0, 'No hace diete', '3 veces por semana', 'No', 'No', 'Si. Todas las mañanas ', 'Ninguna', 'Gripe con flema', 'Oseltamivir', 'No es COVID-19', 0, 7, '2021-11-01 22:52:55'),
(26, 'Anny', 'Marquinez', 'Femenino', 27, 4167743501, 4167743502, 'Maracaibo, la victoria', 'Diarrea', 'Kaopectate', 0, 'Evita frituras', 'Ninguna', 'No', 'No', 'Si. Mañana y tardes ', 'Hipertension', 'Diarrea y deshidratación', 'Pepto-Bismol', 'Ingirió comida pesada en la cena', 1, NULL, '2021-11-01 22:56:30'),
(32, 'Elizabeth', 'Godoy', 'Femenino', 22, 27166242, 41471545620, 'Motatan', 'Fiebre', 'Paracetamol', 0, 'Come frutas todas las tardes', 'Levanta pesas', 'Si. 2 veces por semana ', 'No', 'No', 'Ninguno', 'Fiebre y dolor de cuerpo', 'Ibuprofeno', 'Fiebre a 45°', 0, 9, '2021-11-01 23:28:03'),
(33, 'Daniel', 'Jose', 'Femenino', 33, 414715011, 41471523011, 'Carvajal, El filo', 'Quemadura de 2 gradura', 'Ibuprofeno', 1, 'Ninguni', 'Ninguno', 'No', 'Si. Cada dos dias ', 'No', 'Aleve', 'Quemadura de segundo grado, le cayo aceite caliente en la cara', 'Advil', 'La herida esta cerca del ojo', 1, NULL, '2021-11-01 23:31:50'),
(34, 'Enmanuel', 'Jose', 'Masculino', 12, 4147154567, 4147154566, 'Mendoza fria', 'Dolor de ojos', 'Ninguno', 0, 'Come mucha frituras', 'No realiza actividad fisica', 'No', 'Si. Mañana y nochse ', 'No', 'Demencia', 'Dolor en los ojos y espalda', 'lodoxamida oftalmatica', 'No ha dormido', 1, NULL, '2021-11-01 23:40:45'),
(35, 'Jesus', 'Garcia', 'Masculino', 23, 4147154564, 147154560, 'Carvajal, Trujillo', 'Dolor de huesos', 'Diclofenaco', 2, 'Come solo a la plancha', 'Realiza yoga las tardes', 'Si. Cada 5 dias ', 'No', 'No', 'Cancer', 'Dolor en los huesos y cuerpo', 'Etodolaco', 'Ninguna', 1, NULL, '2021-11-01 23:52:17'),
(39, 'Veronica', 'Azuaje', 'Masculino', 22, 4147154561, 414715452, 'Santa Cruz', 'Fractura', 'acetaminofen', 0, 'Come huevos fritos en la mañana', 'Ninguno', 'No', 'Si. Todas las mañanas ', 'No', 'Cancer', 'Fractura en el brazo izquierdo', 'Ibuprofeno', 'No puede mover el brazo', 0, 2, '2021-11-08 01:11:27'),
(40, 'Diego', 'Martinez', 'Masculino', 22, 41471545221, 42471545221, 'Jalisco', 'VIH Sida', 'Vacunas contra el VIH', 9, 'Desayuna a las 10 am', 'Trota en las mañanas', 'No', 'No', 'Si. Dos tazas al dia ', 'Diabetes', 'Tiene una enfermedad de transmision sexual', 'Vacunas especiales contra el VIH', 'Ultima actividad sexual hace 2 dias', 0, 4, '2021-11-08 03:23:00'),
(41, 'Luis', 'Plaza', 'Masculino', 40, 4123774568, 4123774561, 'Al frente del liceo Rafael Rangel, Valera', 'Accidente de transito', 'Ninguno', 2, 'Come arepas fritas', 'Ninguna', 'Si. Cada 3 dias ', 'Si. los fines de semana ', 'Si. Dos tazas al dias ', 'Cancer', 'Sufrio un accidente de transito, entro en estado critico debido a fuerte golpe en el hombro derecho', 'Antibioticos para el dolor', 'La sangre es B+', 0, 8, '2021-11-08 03:26:46'),
(42, 'Patricia', 'Delgado', 'Femenino', 19, 2716672512, 2716672511, 'San genaro, Carvajal Trujillo', 'Complicaciones en aborto', 'Ninguno', 3, 'Come mucha comida chatarra', 'Ninguno', 'No', 'Si. 3 dias a la semana ', 'No', 'Diabetes', 'Complicaciones en el aborto. Tiene infeccion', 'Clotrimazol', 'Tenia 3 meses el feto. La infeccion es avanzada', 0, 10, '2021-11-08 03:30:22'),
(43, 'Maria', 'Godoy', 'Femenino', 23, 4121012233, 4121012234, 'Santa Cruz, las comunas', 'Diarrea cronica', 'Acetaminofen', 1, 'Realiza dieta', 'Ninguno', 'No', 'No', 'Si. Todos las mañanas ', 'Diabetes', 'Diarrea intensa y dolor en el estomago', 'Antibioticos por inyeccion', 'No puede tomar cafe', 1, NULL, '2021-11-08 03:33:49'),
(44, 'Marcos', 'Perez', 'Masculino', 67, 41471545222, 41471545223, 'Escuque. Trujillo, Valera', 'Dolores oculares', 'Ninguno', 3, 'No come huevo', 'Trota en las tardes', 'No', 'Si. Dos veces al dia ', 'No', 'Cancer', 'Dolor intenso en los ojos', 'DOL', 'No puede soportar la luz', 1, NULL, '2021-11-08 03:37:02'),
(45, 'Daniel', 'Peña', 'Masculino', 22, 414715451, 4247136671, 'Merida, Ejido', 'Dolor de cabeza', 'Ninguna', 2, 'Toma mucho cafe', 'Ninguno', 'No', 'No', 'Si. Cada 5 horas ', 'Dolor en los huesos', 'Dolor en la cabeza agudo', 'DOL', 'El paciente es adicto a la cafeina', 1, NULL, '2021-11-08 03:40:28'),
(46, 'Maria', 'Virginia', 'Femenino', 13, 421442232, 421442231, 'Piedras del sol. Jalisco', 'Parasitos estomacales', 'Ninguno', 0, 'Toma muchas gaseosas', 'Ninguno', 'No', 'No', 'No', 'Diabetes', 'Parasitos estomacales, no dejan dormir al paciente', 'Albendazol', 'Come mucho dulce', 1, NULL, '2021-11-08 03:45:50'),
(47, 'Jackson', 'Rojo', 'Masculino', 23, 4166672514, 4136672514, 'San luis. Los manguitos, Valera', 'COVID', 'Ninguna', 0, 'Ninguno', 'No realiza', 'No', 'No', 'Si. Todas las mañanas ', 'Demencia', 'Covid-19 y problemas para respirar correctamente', 'Dexametazona', 'Ya realizo cuarentena en casa', 1, NULL, '2021-11-08 03:48:19'),
(48, 'Carla', 'Linarez', 'Femenino', 10, 4147545620, 4147515620, 'Pampanito, Trujillo', 'Fiebre alta', 'Acetaminofen', 0, 'Come frituras en las tarde', 'Realiza cardio los domingos', 'No', 'Si. 4 dias por semana ', 'Si. 3 veces por semana ', 'Obesidad', 'Fiebere a mas de 30°', 'Tachipirin', 'La fiebre aumenta en las noches', 1, NULL, '2021-11-08 03:51:34'),
(50, 'Julio', 'Perez', 'Masculino', 20, 4147154522, 4147154511, 'Carvajal, La cabecera', 'Dolor de espalda', 'Ninguna', 0, 'Come muchos dulces', 'Realiza cardio 3 veces al dia', 'Si. 4 veces por semana ', 'No', 'No', 'Ninguno', 'Dolor en la espalda no permite moverse', 'Ibuprofeno', 'Corregir postura', 0, 11, '2021-11-08 03:59:10'),
(51, 'Ivana', 'Martinez', 'Femenino', 33, 41471456022, 41471456029, 'La Arboleda. Carvajal, trujillo', 'Dolor en los pies', 'Paracetamol', 2, 'Ninguno', 'No realiza', 'No', 'No', 'Si. 2 veces por dia ', 'Dermatitis', 'Dolor en la planta de los pies no permite caminar al paciente', 'Ibuprofeno', 'Debe usar silla de ruedas', 1, NULL, '2021-11-08 04:01:40'),
(52, 'Jorge', 'Laguna', 'Masculino', 33, 4147145602, 4147145604, 'Cabimas, Zulia', 'Diabetes', 'Ninguna', 3, 'Come mucha comida chatarra', 'Ninguno', 'No', 'Si. 5 veces a la semana ', 'No', 'Diabetes', 'El paciente tiene diabetes avanzada', 'Insulina por inyeccion', 'Suministrar 3 veces al dias', 0, 12, '2021-11-08 04:03:51'),
(53, 'Lorena', 'Peña', 'Femenino', 44, 4471545602, 4471545612, 'El filo, Carvajal. Trujillo', 'Infeccion en la garganta', 'Ninguna', 0, 'Come mucha grasa', 'No realiza', 'Si. 4 veces al dia ', 'No', 'No', 'Ninguno', 'Dolor en la garganta no permite comer o hablar', 'Loratadina', 'Es alergico al mango', 0, NULL, '2021-11-08 04:06:14'),
(55, 'Carla', 'Linarez', 'Femenino', 10, 4147542620, 41472515620, 'Pampanito, Trujillo', 'Fiebre alta', 'Acetaminofen', 0, 'Come frituras en las tarde', 'Realiza cardio los domingos', 'No', 'Si. 4 dias por semana ', 'Si. 3 veces por semana ', 'Obesidad', 'Fiebere a mas de 30°', 'Tachipirin', 'La fiebre aumenta en las noches', 1, NULL, '2021-11-08 03:51:34'),
(56, 'Rebeca', 'Sanchez', 'Femenino', 22, 42142154220, 42222154220, 'Campo Alegre, Trujillo. Carvajal', 'Dolor de muela', 'Ninguno', 0, 'Come muchos dulces', 'Ninguno', 'Si. 1 vez al mes ', 'No', 'No', 'Caries', 'Dolor en la muela del cachete izquierdo, los examenes arrojaron infección', 'Ibuprofeno', 'Considerar extraerla muela', 1, NULL, '2021-11-13 23:08:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `clave`, `admin`, `fecha_creacion`) VALUES
(1, 'Administrador', 'admin@email.com', '$2b$10$6viOVzliez1ZjgTwBoFQd.t17YKYAG3jawPySve./HbxO.r8kGcFC', 1, '2021-11-13 22:12:14'),
(2, 'Julio', 'julio@email.com', '$2b$10$kkub5pOz4Y2S/A.y4l/MWO5Bg5uF7W.aa4qMivj/aQnPPAMDVsaaa', 0, '2021-11-13 22:12:14'),
(5, 'Jose', 'jose@saludcop.com', '$2b$10$6f9HjdWOr5GxM37fNKnxH.4R9A1CGYc7/6dKaOf4oUkWONo6YjXZ.', 0, '2021-11-13 23:17:37'),
(7, 'Victor', 'victor@saludcop.com', '$2b$10$WzDpIJnlWiYotEOWDBorhOyZXwmeKdWQ4thIh7VEGcMNO/dwUGebe', 0, '2021-11-20 19:39:52');

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
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
