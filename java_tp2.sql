-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-05-2015 a las 02:16:25
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `java_tp2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Calificacion`
--

CREATE TABLE IF NOT EXISTS `Calificacion` (
`id` bigint(20) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `puntaje` int(11) NOT NULL,
  `calificado_id` bigint(20) DEFAULT NULL,
  `calificador_id` bigint(20) DEFAULT NULL,
  `recorrido_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `Calificacion`
--

INSERT INTO `Calificacion` (`id`, `baja`, `puntaje`, `calificado_id`, `calificador_id`, `recorrido_id`) VALUES
(25, 0, -1, 4, 2, 7),
(26, 0, -1, 4, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comentario`
--

CREATE TABLE IF NOT EXISTS `Comentario` (
`id` bigint(20) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `evento_id` bigint(20) DEFAULT NULL,
  `recorrido_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `Comentario`
--

INSERT INTO `Comentario` (`id`, `baja`, `mensaje`, `evento_id`, `recorrido_id`, `usuario_id`) VALUES
(1, 0, 'NUEVO MENSAJE EVENTO', 1, NULL, 2),
(2, 0, 'que buen recorrido!!', NULL, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Comentario_Denuncia`
--

CREATE TABLE IF NOT EXISTS `Comentario_Denuncia` (
  `Comentario_id` bigint(20) NOT NULL,
  `denuncias_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Denuncia`
--

CREATE TABLE IF NOT EXISTS `Denuncia` (
`id` bigint(20) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `visto` tinyint(1) NOT NULL,
  `comentario_id` bigint(20) DEFAULT NULL,
  `denunciante_id` bigint(20) DEFAULT NULL,
  `recorrido_id` bigint(20) DEFAULT NULL,
  `usuario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `Denuncia`
--

INSERT INTO `Denuncia` (`id`, `baja`, `fecha`, `hora`, `motivo`, `visto`, `comentario_id`, `denunciante_id`, `recorrido_id`, `usuario_id`) VALUES
(1, 0, '2015-04-27', '21:12:14', 'Maneja muy lento :P', 1, NULL, 3, NULL, 2),
(2, 0, '2015-04-27', '21:12:14', 'es ofensivo', 0, 2, 3, NULL, NULL),
(3, 0, '2015-04-27', '21:12:14', 'Es mentira', 0, NULL, 3, 1, NULL),
(4, 0, '2015-05-15', '18:46:17', 'No me gustó su cara.\r\nManito abajo', 0, NULL, 2, 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dia`
--

CREATE TABLE IF NOT EXISTS `Dia` (
`id` bigint(20) NOT NULL,
  `dia` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora_ida` time DEFAULT NULL,
  `hora_vuelta` time DEFAULT NULL,
  `recorrido_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `Dia`
--

INSERT INTO `Dia` (`id`, `dia`, `fecha`, `hora_ida`, `hora_vuelta`, `recorrido_id`) VALUES
(1, 2, '2015-04-27', NULL, NULL, NULL),
(2, NULL, '2014-12-12', '00:00:00', '22:22:00', 2),
(3, NULL, '2014-12-12', '01:00:00', '14:12:00', 3),
(4, NULL, '2014-12-12', '13:00:00', '22:00:00', 4),
(5, NULL, '2015-05-22', '01:00:00', '14:00:00', 5),
(6, 2, NULL, '11:00:00', '13:00:00', 6),
(7, NULL, '2015-05-07', '01:00:00', '01:01:00', 7),
(8, NULL, '2015-05-29', '12:00:00', '13:00:00', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Evento`
--

CREATE TABLE IF NOT EXISTS `Evento` (
`id` bigint(20) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `hora` varchar(255) DEFAULT NULL,
  `mapPosition` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `creador_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `Evento`
--

INSERT INTO `Evento` (`id`, `baja`, `descripcion`, `direccion`, `fecha`, `hora`, `mapPosition`, `nombre`, `creador_id`) VALUES
(1, 0, 'NUEVA DESCRIPCION', 'Calle 50 452-500, La Plata, Buenos Aires, Argentina', '2014-12-12', '14:12', '(-34.91239942857932, -57.946786880493164)', 'Viaje a Tecnopolis', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Mensaje`
--

CREATE TABLE IF NOT EXISTS `Mensaje` (
`id` bigint(20) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `visto` tinyint(1) NOT NULL,
  `emisor_id` bigint(20) DEFAULT NULL,
  `receptor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Volcado de datos para la tabla `Mensaje`
--

INSERT INTO `Mensaje` (`id`, `baja`, `fecha`, `hora`, `mensaje`, `visto`, `emisor_id`, `receptor_id`) VALUES
(1, 0, '2015-04-27', '21:12:14', 'HOLA ADMIN!', 1, 2, 1),
(2, 0, '2015-04-27', '21:12:52', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 3),
(3, 0, '2015-04-27', '21:14:31', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 3),
(4, 0, '2015-05-13', '09:55:33', 'Su propuesta al recorrido fue aceptada :)', 0, 4, 5),
(5, 0, '2015-05-13', '09:57:15', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 5),
(6, 0, '2015-05-13', '10:52:26', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 4),
(7, 0, '2015-05-13', '10:52:28', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 4),
(8, 0, '2015-05-13', '10:54:45', 'Su propuesta al recorrido fue aceptada :)', 1, 4, 2),
(9, 0, '2015-05-13', '10:54:48', 'Su propuesta al recorrido fue aceptada :)', 1, 4, 2),
(10, 0, '2015-05-13', '11:20:07', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 4),
(11, 0, '2015-05-13', '11:36:32', 'Su propuesta al recorrido fue aceptada :)', 0, 2, 4),
(12, 0, NULL, NULL, 'hola', 1, 2, 2),
(13, 0, NULL, NULL, 'hola', 1, 2, 2),
(14, 0, NULL, NULL, 'asdasdasdasd', 1, 2, 2),
(15, 0, '2015-05-15', '20:38:15', '123123', 1, 2, 2),
(16, 0, '2015-05-15', '20:39:49', 'Hola!', 0, 2, 4),
(17, 0, '2015-05-15', '20:41:14', 'asdads', 0, 2, 4),
(18, 0, '2015-05-15', '20:45:59', 'asdasdasdasdasdasdaf11f1f 12123', 0, 2, 4),
(19, 0, '2015-05-15', '20:47:05', 'Hola, como estas?\r\nYo estoy bien ### @', 0, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Propuesta`
--

CREATE TABLE IF NOT EXISTS `Propuesta` (
`id` bigint(20) NOT NULL,
  `aprobado` tinyint(1) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  `visto` tinyint(1) NOT NULL,
  `candidato_id` bigint(20) DEFAULT NULL,
  `recorrido_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `Propuesta`
--

INSERT INTO `Propuesta` (`id`, `aprobado`, `baja`, `mensaje`, `visto`, `candidato_id`, `recorrido_id`) VALUES
(1, 1, 0, 'hola me gustaria sumarme, puedo esperarte en 1 y 58?', 1, 3, 1),
(2, 1, 0, 'asdasdsad', 1, 3, 2),
(3, 1, 0, 'Quiero unirme', 1, 5, 3),
(4, 1, 0, 'Quiero ir', 1, 5, 2),
(5, 1, 0, 'asd', 1, 4, 2),
(6, 1, 0, 'asdasd2', 1, 4, 4),
(7, 1, 0, 'asdasd', 1, 2, 5),
(8, 1, 0, 'dfgdfg', 1, 2, 5),
(9, 1, 0, 'Quiero viajar los martes', 1, 4, 6),
(10, 1, 0, 'asdasdasdasdasdasdasd', 1, 2, 7),
(11, 1, 0, '123123', 1, 4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido`
--

CREATE TABLE IF NOT EXISTS `Recorrido` (
`id` bigint(20) NOT NULL,
  `baja` tinyint(1) NOT NULL,
  `desdePosition` varchar(255) DEFAULT NULL,
  `direccion_desde` varchar(255) DEFAULT NULL,
  `direccion_hasta` varchar(255) DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `hastaPosition` varchar(255) DEFAULT NULL,
  `total_asientos` int(11) NOT NULL,
  `creador_id` bigint(20) DEFAULT NULL,
  `evento_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `Recorrido`
--

INSERT INTO `Recorrido` (`id`, `baja`, `desdePosition`, `direccion_desde`, `direccion_hasta`, `fecha_fin`, `fecha_inicio`, `hastaPosition`, `total_asientos`, `creador_id`, `evento_id`) VALUES
(1, 0, '(-34.90029256179422, -57.97905921936035)', 'NUEVA DIRE DESDE', 'Calle 115, La Plata, Buenos Aires, Argentina', '2015-04-27', '2015-04-27', '(-34.911414052670544, -57.937517166137695)', 5, 2, NULL),
(2, 0, '(-34.91802992116086, -57.97313690185547)', 'Avenida 19 351-399, La Plata, Buenos Aires, Argentina', 'Avenida 1 1100-1148, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.911414052670544, -57.93966293334961)', 2, 2, 1),
(3, 0, '(-34.92520823904691, -57.96318054199219)', 'Avenida 19 801-849, La Plata, Buenos Aires, Argentina', 'Avenida 1 902-950, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.909443265371415, -57.943267822265625)', 2, 4, 1),
(4, 0, '(-34.906486995721075, -57.94670104980469)', 'Calle 46 251-299, La Plata, Buenos Aires, Argentina', 'Calle 50 1101-1149, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.9245045101532, -57.960777282714844)', 3, 2, 1),
(5, 0, '(-34.917326130709455, -57.97313690185547)', 'Calle 39 1151-1199, La Plata, Buenos Aires, Argentina', 'Calle 5 1272-1300, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.91746688928252, -57.94120788574219)', 2, 4, NULL),
(6, 0, '(-34.90437530937564, -57.97554016113281)', 'Calle 12 100-198, Tolosa, Buenos Aires, Argentina', 'Avenida Iraola, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.909302493039796, -57.93794631958008)', 1, 2, NULL),
(7, 0, '(-34.91113251452425, -57.98635482788086)', 'Calle 529 2500-2598, Tolosa, Buenos Aires, Argentina', 'Calle 50 401-449, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.91127328371809, -57.946014404296875)', 1, 4, NULL),
(8, 0, '(-34.90113728484302, -58.034934997558594)', 'Calle 133 4002-4100, Gonnet, Buenos Aires, Argentina', 'Calle 11 951-999, La Plata, Buenos Aires, Argentina', NULL, NULL, '(-34.91915597333065, -57.95219421386719)', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido_Calificacion`
--

CREATE TABLE IF NOT EXISTS `Recorrido_Calificacion` (
  `Recorrido_id` bigint(20) NOT NULL,
  `calificaciones_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Recorrido_Calificacion`
--

INSERT INTO `Recorrido_Calificacion` (`Recorrido_id`, `calificaciones_id`) VALUES
(5, 26),
(7, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido_Comentario`
--

CREATE TABLE IF NOT EXISTS `Recorrido_Comentario` (
  `Recorrido_id` bigint(20) NOT NULL,
  `comentarios_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido_Denuncia`
--

CREATE TABLE IF NOT EXISTS `Recorrido_Denuncia` (
  `Recorrido_id` bigint(20) NOT NULL,
  `denuncias_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido_Propuesta`
--

CREATE TABLE IF NOT EXISTS `Recorrido_Propuesta` (
  `Recorrido_id` bigint(20) NOT NULL,
  `propuestas_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recorrido_Usuario`
--

CREATE TABLE IF NOT EXISTS `Recorrido_Usuario` (
  `Recorrido_id` bigint(20) NOT NULL,
  `participantes_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Recorrido_Usuario`
--

INSERT INTO `Recorrido_Usuario` (`Recorrido_id`, `participantes_id`) VALUES
(2, 4),
(4, 4),
(5, 2),
(5, 2),
(6, 4),
(7, 2),
(8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
`id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `baja` tinyint(1) NOT NULL,
  `bloquado` tinyint(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `foto_path` varchar(255) DEFAULT NULL,
  `isAdministrador` tinyint(1) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `participoEn_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`id`, `apellido`, `baja`, `bloquado`, `email`, `foto_path`, `isAdministrador`, `nombre`, `password`, `telefono`, `username`, `participoEn_id`) VALUES
(1, NULL, 0, 0, 'te.seoane@gmail.com', NULL, 1, NULL, '1234', NULL, 'titoAdmin2', NULL),
(2, 'pachenco', 0, 0, 'email@email.com', NULL, 0, 'federico', '1234', NULL, 'fedeeeee2', NULL),
(3, 'Tomas', 0, 0, 'tomi@gmail.com', NULL, 0, 'Seoane', '1234', NULL, 'Tomas', NULL),
(4, 'Alguien', 0, 0, 'alguien@mail.com', NULL, 0, 'Alguien', 'alguien', NULL, 'alguien', NULL),
(5, 'Alguien', 0, 0, 'alguien2@gmail.com', NULL, 0, 'Alguien2', 'alguien2', NULL, 'alguien2', NULL),
(6, 'Pacheco', 0, 0, 'federico_focus@hotmail.com', NULL, 0, 'Federico', '1234', NULL, 'fede0d', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario_Comentario`
--

CREATE TABLE IF NOT EXISTS `Usuario_Comentario` (
  `Usuario_id` bigint(20) NOT NULL,
  `comentarios_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario_Denuncia`
--

CREATE TABLE IF NOT EXISTS `Usuario_Denuncia` (
  `Usuario_id` bigint(20) NOT NULL,
  `denuncias_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario_Evento`
--

CREATE TABLE IF NOT EXISTS `Usuario_Evento` (
  `Usuario_id` bigint(20) NOT NULL,
  `eventos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario_Recorrido`
--

CREATE TABLE IF NOT EXISTS `Usuario_Recorrido` (
  `Usuario_id` bigint(20) NOT NULL,
  `recorridos_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Calificacion`
--
ALTER TABLE `Calificacion`
 ADD PRIMARY KEY (`id`), ADD KEY `FK11CEB821DD3F2D22` (`calificado_id`), ADD KEY `FK11CEB821FB8A7ADE` (`calificador_id`), ADD KEY `FK11CEB821350625BB` (`recorrido_id`);

--
-- Indices de la tabla `Comentario`
--
ALTER TABLE `Comentario`
 ADD PRIMARY KEY (`id`), ADD KEY `FK14DFC40172BE035B` (`usuario_id`), ADD KEY `FK14DFC401A3CFC519` (`evento_id`), ADD KEY `FK14DFC401350625BB` (`recorrido_id`);

--
-- Indices de la tabla `Comentario_Denuncia`
--
ALTER TABLE `Comentario_Denuncia`
 ADD UNIQUE KEY `denuncias_id` (`denuncias_id`), ADD KEY `FK6349FE336598EA19` (`Comentario_id`), ADD KEY `FK6349FE33297CE0D0` (`denuncias_id`);

--
-- Indices de la tabla `Denuncia`
--
ALTER TABLE `Denuncia`
 ADD PRIMARY KEY (`id`), ADD KEY `FK38FE9FB572BE035B` (`usuario_id`), ADD KEY `FK38FE9FB54AD9095F` (`denunciante_id`), ADD KEY `FK38FE9FB56598EA19` (`comentario_id`), ADD KEY `FK38FE9FB5350625BB` (`recorrido_id`);

--
-- Indices de la tabla `Dia`
--
ALTER TABLE `Dia`
 ADD PRIMARY KEY (`id`), ADD KEY `FK10C5C350625BB` (`recorrido_id`);

--
-- Indices de la tabla `Evento`
--
ALTER TABLE `Evento`
 ADD PRIMARY KEY (`id`), ADD KEY `FK7C6CCD351BAEE3AD` (`creador_id`);

--
-- Indices de la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
 ADD PRIMARY KEY (`id`), ADD KEY `FK9BDD22BFD6E1E18D` (`receptor_id`), ADD KEY `FK9BDD22BF1BA273F4` (`emisor_id`);

--
-- Indices de la tabla `Propuesta`
--
ALTER TABLE `Propuesta`
 ADD PRIMARY KEY (`id`), ADD KEY `FK4D3B87ED1CD1509C` (`candidato_id`), ADD KEY `FK4D3B87ED350625BB` (`recorrido_id`);

--
-- Indices de la tabla `Recorrido`
--
ALTER TABLE `Recorrido`
 ADD PRIMARY KEY (`id`), ADD KEY `FKB2B0F9D51BAEE3AD` (`creador_id`), ADD KEY `FKB2B0F9D5A3CFC519` (`evento_id`);

--
-- Indices de la tabla `Recorrido_Calificacion`
--
ALTER TABLE `Recorrido_Calificacion`
 ADD UNIQUE KEY `calificaciones_id` (`calificaciones_id`), ADD KEY `FK66628A4B350625BB` (`Recorrido_id`), ADD KEY `FK66628A4B6FE2E32B` (`calificaciones_id`);

--
-- Indices de la tabla `Recorrido_Comentario`
--
ALTER TABLE `Recorrido_Comentario`
 ADD UNIQUE KEY `comentarios_id` (`comentarios_id`), ADD KEY `FK45B618AB4B73FA8` (`comentarios_id`), ADD KEY `FK45B618AB350625BB` (`Recorrido_id`);

--
-- Indices de la tabla `Recorrido_Denuncia`
--
ALTER TABLE `Recorrido_Denuncia`
 ADD UNIQUE KEY `denuncias_id` (`denuncias_id`), ADD KEY `FK41D616DF350625BB` (`Recorrido_id`), ADD KEY `FK41D616DF297CE0D0` (`denuncias_id`);

--
-- Indices de la tabla `Recorrido_Propuesta`
--
ALTER TABLE `Recorrido_Propuesta`
 ADD UNIQUE KEY `propuestas_id` (`propuestas_id`), ADD KEY `FK5F52F603DC3BAE22` (`propuestas_id`), ADD KEY `FK5F52F603350625BB` (`Recorrido_id`);

--
-- Indices de la tabla `Recorrido_Usuario`
--
ALTER TABLE `Recorrido_Usuario`
 ADD KEY `FKD77586A4350625BB` (`Recorrido_id`), ADD KEY `FKD77586A4F8311288` (`participantes_id`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
 ADD PRIMARY KEY (`id`), ADD KEY `FK5B4D8B0EDF316AAC` (`participoEn_id`);

--
-- Indices de la tabla `Usuario_Comentario`
--
ALTER TABLE `Usuario_Comentario`
 ADD UNIQUE KEY `comentarios_id` (`comentarios_id`), ADD KEY `FKB8D2B9D24B73FA8` (`comentarios_id`), ADD KEY `FKB8D2B9D272BE035B` (`Usuario_id`);

--
-- Indices de la tabla `Usuario_Denuncia`
--
ALTER TABLE `Usuario_Denuncia`
 ADD UNIQUE KEY `denuncias_id` (`denuncias_id`), ADD KEY `FK8626D5C672BE035B` (`Usuario_id`), ADD KEY `FK8626D5C6297CE0D0` (`denuncias_id`);

--
-- Indices de la tabla `Usuario_Evento`
--
ALTER TABLE `Usuario_Evento`
 ADD UNIQUE KEY `eventos_id` (`eventos_id`), ADD KEY `FKD39D538672BE035B` (`Usuario_id`), ADD KEY `FKD39D5386DD714F90` (`eventos_id`);

--
-- Indices de la tabla `Usuario_Recorrido`
--
ALTER TABLE `Usuario_Recorrido`
 ADD UNIQUE KEY `recorridos_id` (`recorridos_id`), ADD KEY `FKA8F85E472BE035B` (`Usuario_id`), ADD KEY `FKA8F85E429CB5DF2` (`recorridos_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Calificacion`
--
ALTER TABLE `Calificacion`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT de la tabla `Comentario`
--
ALTER TABLE `Comentario`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Denuncia`
--
ALTER TABLE `Denuncia`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `Dia`
--
ALTER TABLE `Dia`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `Evento`
--
ALTER TABLE `Evento`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `Propuesta`
--
ALTER TABLE `Propuesta`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `Recorrido`
--
ALTER TABLE `Recorrido`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `Usuario`
--
ALTER TABLE `Usuario`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Calificacion`
--
ALTER TABLE `Calificacion`
ADD CONSTRAINT `FK11CEB821350625BB` FOREIGN KEY (`recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FK11CEB821DD3F2D22` FOREIGN KEY (`calificado_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FK11CEB821FB8A7ADE` FOREIGN KEY (`calificador_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Comentario`
--
ALTER TABLE `Comentario`
ADD CONSTRAINT `FK14DFC401350625BB` FOREIGN KEY (`recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FK14DFC40172BE035B` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FK14DFC401A3CFC519` FOREIGN KEY (`evento_id`) REFERENCES `Evento` (`id`);

--
-- Filtros para la tabla `Comentario_Denuncia`
--
ALTER TABLE `Comentario_Denuncia`
ADD CONSTRAINT `FK6349FE33297CE0D0` FOREIGN KEY (`denuncias_id`) REFERENCES `Denuncia` (`id`),
ADD CONSTRAINT `FK6349FE336598EA19` FOREIGN KEY (`Comentario_id`) REFERENCES `Comentario` (`id`);

--
-- Filtros para la tabla `Denuncia`
--
ALTER TABLE `Denuncia`
ADD CONSTRAINT `FK38FE9FB5350625BB` FOREIGN KEY (`recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FK38FE9FB54AD9095F` FOREIGN KEY (`denunciante_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FK38FE9FB56598EA19` FOREIGN KEY (`comentario_id`) REFERENCES `Comentario` (`id`),
ADD CONSTRAINT `FK38FE9FB572BE035B` FOREIGN KEY (`usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Dia`
--
ALTER TABLE `Dia`
ADD CONSTRAINT `FK10C5C350625BB` FOREIGN KEY (`recorrido_id`) REFERENCES `Recorrido` (`id`);

--
-- Filtros para la tabla `Evento`
--
ALTER TABLE `Evento`
ADD CONSTRAINT `FK7C6CCD351BAEE3AD` FOREIGN KEY (`creador_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Mensaje`
--
ALTER TABLE `Mensaje`
ADD CONSTRAINT `FK9BDD22BF1BA273F4` FOREIGN KEY (`emisor_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FK9BDD22BFD6E1E18D` FOREIGN KEY (`receptor_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Propuesta`
--
ALTER TABLE `Propuesta`
ADD CONSTRAINT `FK4D3B87ED1CD1509C` FOREIGN KEY (`candidato_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FK4D3B87ED350625BB` FOREIGN KEY (`recorrido_id`) REFERENCES `Recorrido` (`id`);

--
-- Filtros para la tabla `Recorrido`
--
ALTER TABLE `Recorrido`
ADD CONSTRAINT `FKB2B0F9D51BAEE3AD` FOREIGN KEY (`creador_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FKB2B0F9D5A3CFC519` FOREIGN KEY (`evento_id`) REFERENCES `Evento` (`id`);

--
-- Filtros para la tabla `Recorrido_Calificacion`
--
ALTER TABLE `Recorrido_Calificacion`
ADD CONSTRAINT `FK66628A4B350625BB` FOREIGN KEY (`Recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FK66628A4B6FE2E32B` FOREIGN KEY (`calificaciones_id`) REFERENCES `Calificacion` (`id`);

--
-- Filtros para la tabla `Recorrido_Comentario`
--
ALTER TABLE `Recorrido_Comentario`
ADD CONSTRAINT `FK45B618AB350625BB` FOREIGN KEY (`Recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FK45B618AB4B73FA8` FOREIGN KEY (`comentarios_id`) REFERENCES `Comentario` (`id`);

--
-- Filtros para la tabla `Recorrido_Denuncia`
--
ALTER TABLE `Recorrido_Denuncia`
ADD CONSTRAINT `FK41D616DF297CE0D0` FOREIGN KEY (`denuncias_id`) REFERENCES `Denuncia` (`id`),
ADD CONSTRAINT `FK41D616DF350625BB` FOREIGN KEY (`Recorrido_id`) REFERENCES `Recorrido` (`id`);

--
-- Filtros para la tabla `Recorrido_Propuesta`
--
ALTER TABLE `Recorrido_Propuesta`
ADD CONSTRAINT `FK5F52F603350625BB` FOREIGN KEY (`Recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FK5F52F603DC3BAE22` FOREIGN KEY (`propuestas_id`) REFERENCES `Propuesta` (`id`);

--
-- Filtros para la tabla `Recorrido_Usuario`
--
ALTER TABLE `Recorrido_Usuario`
ADD CONSTRAINT `FKD77586A4350625BB` FOREIGN KEY (`Recorrido_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FKD77586A4F8311288` FOREIGN KEY (`participantes_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Usuario`
--
ALTER TABLE `Usuario`
ADD CONSTRAINT `FK5B4D8B0EDF316AAC` FOREIGN KEY (`participoEn_id`) REFERENCES `Recorrido` (`id`);

--
-- Filtros para la tabla `Usuario_Comentario`
--
ALTER TABLE `Usuario_Comentario`
ADD CONSTRAINT `FKB8D2B9D24B73FA8` FOREIGN KEY (`comentarios_id`) REFERENCES `Comentario` (`id`),
ADD CONSTRAINT `FKB8D2B9D272BE035B` FOREIGN KEY (`Usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Usuario_Denuncia`
--
ALTER TABLE `Usuario_Denuncia`
ADD CONSTRAINT `FK8626D5C6297CE0D0` FOREIGN KEY (`denuncias_id`) REFERENCES `Denuncia` (`id`),
ADD CONSTRAINT `FK8626D5C672BE035B` FOREIGN KEY (`Usuario_id`) REFERENCES `Usuario` (`id`);

--
-- Filtros para la tabla `Usuario_Evento`
--
ALTER TABLE `Usuario_Evento`
ADD CONSTRAINT `FKD39D538672BE035B` FOREIGN KEY (`Usuario_id`) REFERENCES `Usuario` (`id`),
ADD CONSTRAINT `FKD39D5386DD714F90` FOREIGN KEY (`eventos_id`) REFERENCES `Evento` (`id`);

--
-- Filtros para la tabla `Usuario_Recorrido`
--
ALTER TABLE `Usuario_Recorrido`
ADD CONSTRAINT `FKA8F85E429CB5DF2` FOREIGN KEY (`recorridos_id`) REFERENCES `Recorrido` (`id`),
ADD CONSTRAINT `FKA8F85E472BE035B` FOREIGN KEY (`Usuario_id`) REFERENCES `Usuario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
