-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2022 a las 23:55:18
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `what_the_food`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continents`
--

CREATE TABLE `continents` (
  `id_continent` int(11) NOT NULL,
  `nom_continent` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `continents`
--

INSERT INTO `continents` (`id_continent`, `nom_continent`) VALUES
(1, 'Europa'),
(2, 'Africa'),
(3, 'Asia'),
(4, 'America'),
(5, 'Oceania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredients`
--

CREATE TABLE `ingredients` (
  `id_ingredient` int(11) NOT NULL,
  `nom_ingredient` varchar(255) DEFAULT NULL,
  `tipus_id_ingredient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingredients`
--

INSERT INTO `ingredients` (`id_ingredient`, `nom_ingredient`, `tipus_id_ingredient`) VALUES
(1, 'Nata', 1),
(2, 'Yogur', 1),
(3, 'Leche', 1),
(4, 'Helado', 1),
(5, 'Queso', 1),
(6, 'Cuajada', 1),
(7, 'Mantequilla', 1),
(8, 'Alubias', 2),
(17, 'Guisante', 2),
(18, 'Haba', 2),
(19, 'Lenteja', 2),
(20, 'Soja', 2),
(21, 'Seta', 3),
(22, 'Hongo', 3),
(23, 'Champiñón', 3),
(24, 'Trufa', 3),
(53, 'Niscalo', 3),
(54, 'Patata', 4),
(55, 'Lechuga', 4),
(56, 'Acelga', 4),
(57, 'Alcachofa', 4),
(58, 'Berenjena', 4),
(59, 'Brócoli', 4),
(60, 'Brecol', 4),
(61, 'Calabacín', 4),
(62, 'Calabaza', 4),
(63, 'Cardo', 4),
(64, 'Cebolla', 4),
(65, 'Cebolleta', 4),
(66, 'Col', 4),
(67, 'Coliflor', 4),
(68, 'Tomate', 4),
(69, 'Zanahoria', 4),
(70, 'Escarola', 4),
(71, 'Espárrago', 4),
(72, 'Espinaca', 4),
(73, 'Hinojo', 4),
(74, 'Judías', 4),
(75, 'Maíz', 4),
(76, 'Palmito', 4),
(77, 'Pepino', 4),
(78, 'Pimiento', 4),
(79, 'Puerro', 4),
(80, 'Remolacha', 4),
(102, 'Albaricoque', 5),
(103, 'Aguacate', 5),
(104, 'Cereza', 5),
(105, 'Mango', 5),
(106, 'Melocotones', 5),
(107, 'Nectarina', 5),
(108, 'Ciruela', 5),
(109, 'Pera', 5),
(110, 'Manzana', 5),
(111, 'Uva', 5),
(112, 'Fresa', 5),
(113, 'Granada', 5),
(114, 'Kiwi', 5),
(115, 'Limón', 5),
(116, 'Mandarina', 5),
(117, 'Melón', 5),
(118, 'Naranja', 5),
(119, 'Piña', 5),
(120, 'Plátano', 5),
(121, 'Pomelo', 5),
(122, 'Sandía', 6),
(143, 'Anchoa', 6),
(144, 'Atún', 6),
(145, 'Bacalao', 6),
(146, 'Besugo', 6),
(147, 'Bonito', 6),
(148, 'Boquerón', 6),
(149, 'Caballa', 6),
(150, 'Chicharro', 6),
(151, 'Corvina', 6),
(152, 'Dorada', 6),
(153, 'Lenguado', 6),
(154, 'Lubina', 6),
(155, 'Merluza', 6),
(156, 'Mero', 6),
(157, 'Palometa', 6),
(158, 'Rape', 6),
(159, 'Rodaballo', 6),
(160, 'Salmón', 6),
(161, 'Sardina', 6),
(162, 'Trucha', 6),
(163, 'Camarón', 7),
(164, 'Cigala', 7),
(165, 'Langostino', 7),
(166, 'Percebe', 7),
(167, 'Almeja', 7),
(168, 'Calamar', 7),
(169, 'Calamar', 7),
(170, 'Ostra', 7),
(171, 'Pulpo', 7),
(172, 'Sepia', 7),
(173, 'Vieira', 7),
(174, 'Cordero', 8),
(175, 'Oveja', 8),
(176, 'Ternera', 8),
(177, 'Buey', 8),
(178, 'Caballo', 8),
(179, 'Cabra', 8),
(180, 'Cerdo', 7),
(181, 'Vaca', 8),
(182, 'Pollo\r\n', 8),
(183, 'Conejo', 8),
(184, 'Caracoles', 8),
(185, 'Cerveza', 9),
(186, 'Sidras', 9),
(187, 'Licor', 9),
(188, 'Vino blanco', 9),
(189, 'Vino caliente', 9),
(190, 'Vino tinto', 9),
(191, 'Vino rosado', 9),
(192, 'Vino dulce', 9),
(193, 'Whisky', 9),
(194, 'Café', 10),
(195, 'Cola', 10),
(196, 'Agua', 10),
(197, 'Zumo', 10),
(198, 'Té', 10),
(199, 'Horchata', 10),
(200, 'Cerveza sin alcohol', 10),
(201, 'Cereal', 11),
(202, 'Arroz', 11),
(203, 'Pan', 12),
(204, 'Pasta', 12),
(205, 'Aceite de soja', 13),
(206, 'Aceite de maíz', 13),
(207, 'Aceite de oliva', 13),
(208, 'Aceite de trufa', 13),
(209, 'Harina', 12),
(210, 'Huevo', 23);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredients_recepta`
--

CREATE TABLE `ingredients_recepta` (
  `ingredients_id_ingredient` int(11) NOT NULL,
  `receptas_id_recepta` int(11) NOT NULL,
  `cantidad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id_pais` int(11) NOT NULL,
  `nombre_pais` varchar(80) NOT NULL,
  `continentes_id_continente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`, `continentes_id_continente`) VALUES
(1, 'Afganistán', 3),
(2, 'Islas Aland', 1),
(3, 'Albania', 1),
(4, 'Argelia', 2),
(5, 'Samoa Americana', 5),
(6, 'Andorra', 1),
(7, 'Angola', 2),
(8, 'Anguila', 4),
(10, 'Antigua y Barbuda', 4),
(11, 'Argentina', 4),
(12, 'Armenia', 3),
(13, 'Aruba', 4),
(14, 'Australia', 5),
(15, 'Austria', 1),
(16, 'Azerbaiyán', 3),
(17, 'Bahamas', 4),
(18, 'Bahréin', 3),
(19, 'Bangladesh', 3),
(20, 'Barbados', 4),
(21, 'Bielorrusia', 1),
(22, 'Bélgica', 1),
(23, 'Belice', 4),
(24, 'Benin', 2),
(25, 'islas Bermudas', 4),
(26, 'Bután', 3),
(27, 'Bolivia', 4),
(28, 'Bonaire, Sint Eustatius y Saba', 4),
(29, 'Bosnia y Herzegovina', 1),
(30, 'Botswana', 2),
(32, 'Brasil', 4),
(33, 'Territorio Británico del Océano Índico', 3),
(34, 'Brunei Darussalam', 3),
(35, 'Bulgaria', 1),
(36, 'Burkina Faso', 2),
(37, 'Burundi', 2),
(38, 'Camboya', 3),
(39, 'Camerún', 2),
(40, 'Canadá', 4),
(41, 'Cabo Verde', 2),
(42, 'Islas Caimán', 4),
(43, 'República Centro2na', 2),
(44, 'Chad', 2),
(45, 'Chile', 4),
(46, 'porcelana', 3),
(47, 'Isla de Navidad', 3),
(48, 'Islas Cocos (Keeling)', 3),
(49, 'Colombia', 4),
(50, 'Comoras', 2),
(51, 'Congo', 2),
(52, 'Congo, República Democrática del Congo', 2),
(53, 'Islas Cook', 5),
(54, 'Costa Rica', 4),
(55, 'Costa de Marfil', 2),
(56, 'Croacia', 1),
(57, 'Cuba', 4),
(58, 'Curazao', 4),
(59, 'Chipre', 3),
(60, 'Republica checa', 1),
(61, 'Dinamarca', 1),
(62, 'Djibouti', 2),
(63, 'Dominica', 4),
(64, 'República Dominicana', 4),
(65, 'Ecuador', 4),
(66, 'Egipto', 2),
(67, 'El Salvador', 4),
(68, 'Guinea Ecuatorial', 2),
(69, 'Eritrea', 2),
(70, 'Estonia', 1),
(71, 'Etiopía', 2),
(72, 'Islas Falkland (Malvinas)', 4),
(73, 'Islas Faroe', 1),
(74, 'Fiyi', 5),
(75, 'Finlandia', 1),
(76, 'Francia', 1),
(77, 'Guayana Francesa', 4),
(78, 'Polinesia francés', 5),
(80, 'Gabón', 2),
(81, 'Gambia', 2),
(82, 'Georgia', 3),
(83, 'Alemania', 1),
(84, 'Ghana', 2),
(85, 'Gibraltar', 1),
(86, 'Grecia', 1),
(87, 'Groenlandia', 4),
(88, 'Granada', 4),
(89, 'Guadalupe', 4),
(90, 'Guam', 5),
(91, 'Guatemala', 4),
(92, 'Guernsey', 1),
(93, 'Guinea', 2),
(94, 'Guinea-Bissau', 2),
(95, 'Guayana', 4),
(96, 'Haití', 4),
(98, 'Santa Sede (Estado de la Ciudad del Vaticano)', 1),
(99, 'Honduras', 4),
(100, 'Hong Kong', 3),
(101, 'Hungría', 1),
(102, 'Islandia', 1),
(103, 'India', 3),
(104, 'Indonesia', 3),
(105, 'Irán (República Islámica de', 3),
(106, 'Irak', 3),
(107, 'Irlanda', 1),
(108, 'Isla del hombre', 1),
(109, 'Israel', 3),
(110, 'Italia', 1),
(111, 'Jamaica', 4),
(112, 'Japón', 3),
(113, 'Jersey', 1),
(114, 'Jordán', 3),
(115, 'Kazajstán', 3),
(116, 'Kenia', 2),
(117, 'Kiribati', 5),
(118, 'República de Corea, Popular Democrática de', 3),
(119, 'Corea, república de', 3),
(120, 'Kosovo', 1),
(121, 'Kuwait', 3),
(122, 'Kirguistán', 3),
(123, 'República Democrática Popular Lao', 3),
(124, 'Letonia', 1),
(125, 'Líbano', 3),
(126, 'Lesoto', 2),
(127, 'Liberia', 2),
(128, 'Jamahiriya Arabe Libia', 2),
(129, 'Liechtenstein', 1),
(130, 'Lituania', 1),
(131, 'Luxemburgo', 1),
(132, 'Macao', 3),
(133, 'Macedonia, la ex República Yugoslava de', 1),
(134, 'Madagascar', 2),
(135, 'Malawi', 2),
(136, 'Mal3', 3),
(137, 'Maldivas', 3),
(138, 'Mali', 2),
(139, 'Malta', 1),
(140, 'Islas Marshall', 5),
(141, 'Martinica', 4),
(142, 'Mauritania', 2),
(143, 'Mauricio', 2),
(144, 'Mayotte', 2),
(145, 'México', 4),
(146, 'Micronesia, Estados Federados de', 5),
(147, 'Moldavia, República de', 1),
(148, 'Mónaco', 1),
(149, 'Mongolia', 3),
(150, 'Montenegro', 1),
(151, 'Montserrat', 4),
(152, 'Marruecos', 2),
(153, 'Mozambique', 2),
(154, 'Myanmar', 3),
(155, 'Namibia', 2),
(156, 'Nauru', 5),
(157, 'Nepal', 3),
(158, 'Países Bajos', 1),
(159, 'Antillas Holandesas', 4),
(160, 'Nueva Caledonia', 5),
(161, 'Nueva Zelanda', 5),
(162, 'Nicaragua', 4),
(163, 'Níger', 2),
(164, 'Nigeria', 2),
(165, 'Niue', 5),
(166, 'Isla Norfolk', 5),
(167, 'Islas Marianas del Norte', 5),
(168, 'Noruega', 1),
(169, 'Omán', 3),
(170, 'Pakistán', 3),
(171, 'Palau', 5),
(172, 'Territorio Palestino, Ocupado', 3),
(173, 'Panamá', 4),
(174, 'Papúa Nueva Guinea', 5),
(175, 'Paraguay', 4),
(176, 'Perú', 4),
(177, 'Filipinas', 3),
(178, 'Pitcairn', 1),
(179, 'Polonia', 1),
(180, 'Portugal', 1),
(181, 'Puerto Rico', 4),
(182, 'Katar', 3),
(183, 'Reunión', 2),
(184, 'Rumania', 1),
(185, 'Federación Rusa', 3),
(186, 'Ruanda', 2),
(187, 'San Bartolomé', 4),
(188, 'Santa elena', 2),
(189, 'Saint Kitts y Nevis', 4),
(190, 'Santa Lucía', 4),
(191, 'San Martín', 4),
(192, 'San Pedro y Miquelón', 4),
(193, 'San Vicente y las Granadinas', 4),
(194, 'Samoa', 5),
(195, 'San Marino', 1),
(196, 'Santo Tomé y Príncipe', 2),
(197, 'Arabia Saudita', 3),
(198, 'Senegal', 2),
(199, 'Serbia', 1),
(200, 'Serbia y Montenegro', 1),
(201, 'Seychelles', 2),
(202, 'Sierra Leona', 2),
(203, 'Singapur', 3),
(204, 'San Martín', 4),
(205, 'Eslovaquia', 1),
(206, 'Eslovenia', 1),
(207, 'Islas Salomón', 5),
(208, 'Somalia', 2),
(209, 'Sudáfrica', 2),
(211, 'Sudán del Sur', 2),
(212, 'España', 1),
(213, 'Sri Lanka', 3),
(214, 'Sudán', 2),
(215, 'Surinam', 4),
(216, 'Svalbard y Jan Mayen', 1),
(217, 'Swazilandia', 2),
(218, 'Suecia', 1),
(219, 'Suiza', 1),
(220, 'República Árabe Siria', 3),
(221, 'Taiwan, provincia de China', 3),
(222, 'Tayikistán', 3),
(223, 'Tanzania, República Unida de', 2),
(224, 'Tailandia', 3),
(225, 'Timor-Leste', 3),
(226, 'Para llevar', 2),
(227, 'Tokelau', 5),
(228, 'Tonga', 5),
(229, 'Trinidad y Tobago', 4),
(230, 'Túnez', 2),
(231, 'pavo', 3),
(232, 'Turkmenistán', 3),
(233, 'Islas Turcas y Caicos', 4),
(234, 'Tuvalu', 5),
(235, 'Uganda', 2),
(236, 'Ucrania', 1),
(237, 'Emiratos Árabes Unidos', 3),
(238, 'Reino Unido', 1),
(239, 'Estados Unidos', 4),
(240, 'Islas menores alejadas de los Estados Unidos', 4),
(241, 'Uruguay', 4),
(242, 'Uzbekistan', 3),
(243, 'Vanuatu', 5),
(244, 'Venezuela', 4),
(245, 'Vietnam', 3),
(246, 'Islas Vírgenes Británicas', 4),
(247, 'Islas Vírgenes, EE. UU.', 4),
(248, 'Wallis y Futuna', 5),
(249, 'Sahara Occidental', 2),
(250, 'Yemen', 3),
(251, 'Zambia', 2),
(252, 'Zimbabue', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptes`
--

CREATE TABLE `receptes` (
  `id_recepta` int(11) NOT NULL,
  `nom_recepta` varchar(100) NOT NULL,
  `descripcio_recepta` varchar(1500) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `paisos_id_pais` int(11) NOT NULL,
  `usuaris_id_usuari` int(11) NOT NULL,
  `validat_recepta` int(1) NOT NULL,
  `temps` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receptes_favorites`
--

CREATE TABLE `receptes_favorites` (
  `receptas_id_recepta` int(11) NOT NULL,
  `usuaris_id_usuari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('24HqZwFOKTXplzx9D9b5yaz1FpuoX1eT', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('7Nmqddnu9tZq-ZMg3fhY9K6HMstgNcVG', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('9h45Xc5TGDEDilh_jbdVtYaaR_JZVpz3', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('B9nKJRFV9ymS4Cf9JXcOb9Yi24UCJGoD', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Fn9uEf152QJbZOw_3_r4qMS76ejo-6SJ', 1653312587, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":79}}'),
('JeBMjH5qQMJAI9jJsvvGaQaQr6ZSfBAG', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZBJpyGhk3qFIzon4cXZeYWIugCF-tHlS', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_PsRpnvl32RxWmeVDvuWjwubJuWRQd0_', 1653342896, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":79}}'),
('mTAY-3-AS7EPgwmqL9_bTAJWiW-8Gc5Z', 1653313246, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus`
--

CREATE TABLE `tipus` (
  `id_tipus` int(11) NOT NULL,
  `nom_tipus` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipus`
--

INSERT INTO `tipus` (`id_tipus`, `nom_tipus`) VALUES
(1, 'lacteo'),
(2, 'legumbre'),
(3, 'seta/hongo'),
(4, 'verdura'),
(5, 'fruta'),
(6, 'pescado'),
(7, 'marisco'),
(8, 'carne'),
(9, 'bebida alcoholica'),
(10, 'bebida no alcoholica'),
(11, 'cereales'),
(12, 'harina'),
(13, 'aceite'),
(23, 'Procedencia Animal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuari` int(11) NOT NULL,
  `nom_usuari` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `gmail_account` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuari`, `nom_usuari`, `password`, `mail`, `gmail_account`) VALUES
(1, 'Admin', '$2a$10$/2GgxZWfPYB4d.vLr7BujuI0cOxDjx1M7w6lxZRIMP6GuDADUC34u', 'albertobermejo8@gmail.com', 0),
(77, 'Albertosa', '$2a$10$qvXr3KRiyfONGx4RiliEpOEHvL3SnJR4inVyNc/DB29jQ3cQDRkJ6', 'albSADAerto@gmail.com', 0),
(78, 'SDAASD', '$2a$10$qTa2sTk16RhhpHxmSA8sjOl1fQ63SxGMfFmRlRcYf1ur2W/PjRn4C', 'asdasd@gmail.com', 0),
(79, 'Alberto', '$2a$10$3PoYRCRSsFHQK2ICFJrpPeFijOr2eYRU9PxmZ2khcYwp4WrU76ZpG', 'alberto@gmail.com', 0),
(80, 'aaa', '$2a$10$qnoNTAM38x0pHWei28cD9OLl2fsDkfIe.7T6X90wmC2o01uTym1dG', 'alberato@gmail.com', 0),
(82, 'Pedro', '$2a$10$8YFVSmRkNmmIH29DruiL0OLsVs4STa6IUpV/E8kLYYHICLaRHFFCe', 'adsasd@gmail.com', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id_continent`);

--
-- Indices de la tabla `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id_ingredient`),
  ADD KEY `FK_tipus_id_ingredient` (`tipus_id_ingredient`);

--
-- Indices de la tabla `ingredients_recepta`
--
ALTER TABLE `ingredients_recepta`
  ADD PRIMARY KEY (`ingredients_id_ingredient`,`receptas_id_recepta`),
  ADD KEY `FK_receptas_id_recepta` (`receptas_id_recepta`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id_pais`),
  ADD KEY `continentes_id_continente` (`continentes_id_continente`);

--
-- Indices de la tabla `receptes`
--
ALTER TABLE `receptes`
  ADD PRIMARY KEY (`id_recepta`),
  ADD KEY `FK_usuaris_id_usuari` (`usuaris_id_usuari`),
  ADD KEY `paisos_id_pais` (`paisos_id_pais`);

--
-- Indices de la tabla `receptes_favorites`
--
ALTER TABLE `receptes_favorites`
  ADD PRIMARY KEY (`receptas_id_recepta`,`usuaris_id_usuari`),
  ADD KEY `FK_usuaris_id_usuari_fav` (`usuaris_id_usuari`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `tipus`
--
ALTER TABLE `tipus`
  ADD PRIMARY KEY (`id_tipus`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuari`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `nom_usuari` (`nom_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `continents`
--
ALTER TABLE `continents`
  MODIFY `id_continent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT de la tabla `receptes`
--
ALTER TABLE `receptes`
  MODIFY `id_recepta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `tipus`
--
ALTER TABLE `tipus`
  MODIFY `id_tipus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `FK_tipus_id_ingredient` FOREIGN KEY (`tipus_id_ingredient`) REFERENCES `tipus` (`id_tipus`);

--
-- Filtros para la tabla `ingredients_recepta`
--
ALTER TABLE `ingredients_recepta`
  ADD CONSTRAINT `FK_ingredients_id_ingredient` FOREIGN KEY (`ingredients_id_ingredient`) REFERENCES `ingredients` (`id_ingredient`),
  ADD CONSTRAINT `FK_receptas_id_recepta` FOREIGN KEY (`receptas_id_recepta`) REFERENCES `receptes` (`id_recepta`);

--
-- Filtros para la tabla `paises`
--
ALTER TABLE `paises`
  ADD CONSTRAINT `paises_ibfk_1` FOREIGN KEY (`continentes_id_continente`) REFERENCES `continents` (`id_continent`);

--
-- Filtros para la tabla `receptes`
--
ALTER TABLE `receptes`
  ADD CONSTRAINT `FK_usuaris_id_usuari` FOREIGN KEY (`usuaris_id_usuari`) REFERENCES `users` (`id_usuari`),
  ADD CONSTRAINT `receptes_ibfk_1` FOREIGN KEY (`paisos_id_pais`) REFERENCES `paises` (`id_pais`);

--
-- Filtros para la tabla `receptes_favorites`
--
ALTER TABLE `receptes_favorites`
  ADD CONSTRAINT `FK_receptas_id_recepta_fav` FOREIGN KEY (`receptas_id_recepta`) REFERENCES `receptes` (`id_recepta`),
  ADD CONSTRAINT `FK_usuaris_id_usuari_fav` FOREIGN KEY (`usuaris_id_usuari`) REFERENCES `users` (`id_usuari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
