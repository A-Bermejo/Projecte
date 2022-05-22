-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2022 a las 01:31:31
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
(210, 'Huevo', 23),
(213, 'Azucar', 24),
(214, 'Miel', 24),
(215, 'Vinagre', 24),
(216, 'Nacho', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredients_recepta`
--

CREATE TABLE `ingredients_recepta` (
  `ingredients_id_ingredient` int(11) NOT NULL,
  `receptas_id_recepta` int(11) NOT NULL,
  `cantidad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingredients_recepta`
--

INSERT INTO `ingredients_recepta` (`ingredients_id_ingredient`, `receptas_id_recepta`, `cantidad`) VALUES
(2, 32, '500 gr'),
(3, 31, '400 ml'),
(3, 32, '1 taza'),
(3, 41, '1 L'),
(3, 45, '50 ml'),
(5, 31, '200 g lonc'),
(5, 40, ''),
(5, 41, 'Queso rall'),
(5, 42, '60 g'),
(5, 43, ''),
(7, 33, '50 gr'),
(7, 42, ''),
(7, 45, ''),
(20, 37, '100 ml.'),
(21, 37, '150 g. '),
(23, 33, '1 bote'),
(54, 36, '700 g'),
(54, 40, '2'),
(58, 40, '2'),
(64, 31, '1'),
(64, 33, '2'),
(64, 34, '2'),
(64, 35, '1'),
(64, 36, '300 g'),
(64, 37, ''),
(64, 40, '1'),
(64, 43, ''),
(64, 44, '30 g'),
(65, 44, '2'),
(68, 31, 'g de salsa'),
(68, 33, '900 gr'),
(68, 34, '4'),
(68, 35, '100 ml de '),
(68, 38, '(Triturado'),
(68, 39, '1'),
(68, 40, '3'),
(68, 41, '200ml'),
(68, 44, '50 g'),
(69, 34, '3'),
(69, 37, '4'),
(69, 40, '1'),
(74, 38, '500 g'),
(78, 34, '1'),
(78, 38, ''),
(78, 43, '2'),
(78, 44, '1/4'),
(79, 34, '1'),
(103, 44, '2'),
(105, 32, '500 gr'),
(118, 33, '(Zumo)'),
(160, 33, '6'),
(176, 35, '300 gr de '),
(176, 45, '200g'),
(180, 31, ''),
(180, 37, '6 rodajas '),
(180, 41, '500g'),
(180, 42, '200 g'),
(180, 45, '200g'),
(181, 34, '1 kg. de c'),
(181, 40, '400 g'),
(181, 41, '500g'),
(182, 37, '1,5 kg.'),
(182, 38, '1'),
(183, 38, '0.5'),
(184, 38, '500 g'),
(188, 31, '200 ml'),
(190, 34, '1l'),
(190, 40, 'Medio vaso'),
(196, 35, '50ml'),
(196, 45, '20 ml'),
(202, 38, '1500 g'),
(203, 39, ''),
(203, 45, '200g'),
(204, 31, '12 Placas '),
(204, 37, '300 g. fid'),
(204, 41, 'Lamina par'),
(204, 42, '320 g de e'),
(206, 33, 'ml'),
(207, 34, '100 ml'),
(207, 35, ''),
(207, 36, ''),
(207, 38, ''),
(207, 39, ''),
(209, 31, '25 g'),
(209, 35, 'Una cuchar'),
(210, 35, '1'),
(210, 36, '6'),
(210, 37, '6'),
(210, 42, '6'),
(210, 45, '1'),
(213, 32, '2 cuchaara'),
(213, 33, '1/4 de cuc'),
(216, 43, '');

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
(231, 'Turquía', 3),
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
  `descripcio_recepta` varchar(2500) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `paisos_id_pais` int(11) NOT NULL,
  `usuaris_id_usuari` int(11) NOT NULL,
  `validat_recepta` int(1) NOT NULL,
  `temps` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `receptes`
--

INSERT INTO `receptes` (`id_recepta`, `nom_recepta`, `descripcio_recepta`, `img`, `paisos_id_pais`, `usuaris_id_usuari`, `validat_recepta`, `temps`) VALUES
(31, 'Lasaña', '1.- Prepara el relleno. Coloca un poco de aceite de oliva en una sartén al fuego y añade la carne picada con sal y pimienta al gusto. Ve moviendo y separando la carne con el fuego bastante vivo. Añade la cebolla, picada a cuchillo, cuando la carne esté ya dorada. Sigue removiendo y, tras 4 o 5 minutos, cuando la cebolla ya se empiece a cocinar, añade el vino blanco. Pon el fuego moderado y, cuando el alcohol haya reducido, añade la salsa de tomate. Remueve bien y deja que reduzca un poco el tomate. Cuando consigas la consistencia que quieres para tu relleno, retira la sartén del fuego.\r\n\r\n2.- Cuece la pasta. Pon una olla con abundante agua y un poco de sal al fuego. Cuando el agua empiece a hervir, introduce las placas una a una. Cuece la pasta según lo que te marque el fabricante.\r\n\r\n3.- Preparara la bechamel. Derrite la mantequilla en una sartén al fuego y añade una cucharada bien colmada de harina. Tuesta un poquito la harina y añade la leche caliente poco a poco sin dejar de remover. Añade una punta de pimienta negra, otra de nuez moscada y un poco de sal. Espera a que empiece a hervir de nuevo y ya tienes la bechamel preparada.\r\n\r\n4.- Enfría la pasta. Ve quitando el agua caliente de la cazuela y deja que entre agua fría para que se corte la cocción de la pasta. Deja las placas sobre un trapo.\r\n\r\n5.- Monta la lasaña. Pon unas cucharadas de bechamel en la base de la bandeja para que no se pegue la lasaña. Añade la primera capa de placas haciéndolas coincidir unas encima de', 'img-1653257418231.jpeg', 110, 1, 1, '01:00:00'),
(32, 'Lassi', '1. Pela y corta a trocitos los mangos.\r\n2. Mete los mangos, la leche, el yogurt y el azúcar en el vaso de la licuadora.\r\n3. Licua a velocidad máxima durante un par de minutos.\r\n4. Para decorar podemos añadirle un poco de canela y algún fruto seco, como yo he hecho, en mi caso nueces pero pistachos o cacahuetes también es una buena opción.\r\n\r\nLa consistencia debe de ser homogénea y espesa', 'img-1653259003950.jpeg', 170, 1, 1, '00:05:00'),
(33, 'Lüfer', '1. Para comenzar debes lavar, limpiar y escurrir el pescado para asegurarte de retirar todo sucio o elementos no deseados. Luego será momento de sazonar tu delicioso pescado azul y añadir el zumo o jugo de limón sobre ellos.\r\n2. Tras realizar el paso anterior, coloca a un lado tus Lüfer para que absorban todo los ingredientes que le has agregado. Para continuar coloca el aceite en una sartén a tu elección y añade el ajo picado y las cebollas picadas en dos partes.\r\n3. Asegúrate de mover constantemente tus ingredientes al momento de agregarlos al sartén con aceite. Luego añade los trozos de tomate picado y comienza a salpimentar todos tus ingredientes mientras continuas moviendolso para evitar que se peguen.\r\n4. Añade ahora el azúcar, el perejil y los champiñones. Luego deja toda tu preparación sobre el satén al menos 8 o 10 minutos.\r\n5. Tras haber transcurrido el tiempo antes mencionado será momento de colocar tu pescado sobre un plato resistente a altas temperaturas. Añade a dicho plato con el pescado tu mezcla de tomates y agrega las hojas dos hojas de laurel.\r\nLuego solo deberás agregar una tapadera o “tapa” a tu plato resistente al calor y dejarlo en proceso de cocción durante 20 minutos.', 'img-1653259423381.jpeg', 231, 1, 1, '01:30:00'),
(34, 'Goulash', 'A la hora de comprar la carne pedidle al carnicero que os la corte a trozos regulares para guiso y que os la limpie, que le quite la grasa sobrante. Os quedarán unos trozos de 20 g más o menos. Si compramos la carne entera para guisar os recomiendo cortarla en casa en trozos de 2-3 cm, no os olvidéis de repasar y limpiar los posibles restos de grasa, ternillas y huesecillos.\r\nSalpimentamos la carne y pasamos por harina. Una vez enharinada y sacudida, la freiremos en la cazuela donde vamos a preparar el estofado. Calentamos el aceite de oliva virgen extra en una cazuela, echamos la carne y marcamos los trozos hasta que queden bien dorados, soltará parte de su jugo. Retiramos la carne y reservamos. En el aceite que hemos usado para la marcar la carne quedarán restos de la harina, nos servirá para espesar la salsa en la futura cocción del estofado.\r\nPelamos los ajos, la cebolla y el puerro, y picamos muy finamente. Sofreímos todos los vegetales en el mismo aceite donde hemos dorado la carne durante unos 10 minutos a fuego lento.\r\nCuando el sofrito esté bien dorado añadimos una buena cucharada de paprika. Este es el secreto de un excelente Gulash húngaro, la calidad del pimentón, aunque si no es húngaro podemos usar pimentón de la Vera, que tiene un toque ahumado delicioso. Removemos todo bien a temperatura baja para que no se nos queme.\r\nPelamos las zanahorias y lavamos el pimiento rojo. Cortamos en rodajas lo más finas posibles las zanahorias (así se harán mucho antes en nuestro guiso) y el pimiento en daditos muy pequeños. Los tomates los cortamos a la mitad y rallamos hasta que nos quede sólo la pulpa del mismo. Añadimos estos ingredientes al sofrito anterior y removemos todo bien con una cuchara de madera mezclando los sabores.\r\nTroceamos el perejil fresco lo más picadito posible. Añadimos una cucharada de comino en polvo (opcional, a mi me encanta el toque de esta especia), el perejil y los pimientos húngaros (si no los encontráis sustituidlos por chile o cayenas, siempre que os guste el toque picante que le da al estofado). Removemos todo con suavidad para juntar los sabores.\r\nAñadimos los trozos de carne que tenemos reservados y echamos un vaso de vino tinto, en mi caso un buen mencía de la Ribeira Sacra para darle potencia al sabor del estofado y un color impresionante.\r\nAñadimos las hojas de laurel y rectificamos sal y pimienta. Dejamos que reduzca un poco, aproximadamente unos 10-15 minutos a fuego medio.\r\nCubrimos todo con el resto del vino y si qu', 'img-1653259625254.jpeg', 101, 1, 1, '02:00:00'),
(35, 'Pie floater', '1.- Comenzamos preparando el relleno del pastel de carne, para ello ponemos en una sartén a sofreir la cebolla picada fina. Cuando dore un poco añadimos la carne picada y la cocinamos unos minutos más.\r\n2.- Añadimos a la carne el tomate, la harina disuelta en el agua y la salsa de soja. Dejamos cocer hasta que la salsa espese. Dejamos enfriar\r\n3.- Para preparar los pasteles tenemos que forrar el interior de cuatro flaneras  con círculos de masa quebrada (Yo no tenia flaneras y he usado los moldes de silicona para cupcakes) debemos cubrir bien el fondo y las paredes y dejar una «pestaña» por fuera del molde que luego nos servirá para cerrarlo.\r\n4.- Rellenamos con la carne que ya tendremos fría y cubrimos con otros círculos, ésta vez del mismo tamaño que la flanera. Pintamos la pestaña con huevo y la doblamos sobre la tapa.\r\n5.- Pintamos la parte superior del pastel con huevo, Hacemos un pequeño corte en el centro para que respire y no se rompa y horneamos durante 20 -25 minutos a 190ºC con el horno ya precalentado.\r\n6.- Mientras se hornean los pasteles preparamos la crema de guisantes. Sofreimos la cebolla en un cazo con un chorrito de aceite. Cuando dore la cebolla añadimos los guisantes y el caldo y dejamos cocer 3 o 4 minutos. Trituramos y ponemos a punto de sal y pimienta.\r\n7.- Una vez tengamos los pasteles horneados los desmoldamos con cuidado y los servimos acompañados con la crema de guisantes', 'img-1653259787984.jpeg', 14, 1, 1, '01:00:00'),
(36, 'Tortilla de patata', 'Comenzamos con la tarea más larga, la de caramelizar la cebolla que nos llevará unos 30 minutos. Para ello, pelamos la cebolla y la cortamos en juliana. Después la ponemos en una sartén a fuego muy lento y dejamos que se haga muy despacio, removiendo de vez en cuando. No nos interesa que se dore la cebolla sino que se vaya pochando muy despacio. Aquí podéis ver con detalle todos los trucos para caramelizar la cebolla en sus propios azúcares naturales.\r\n\r\nMientras la cebolla se hace, pelamos las patatas y las cortamos en rodajas finas, procurando que todas ellas sean de tamaño uniforme. Las dejamos en agua durante 15 minutos y ponemos una sartén con aceite de oliva abundante en el fuego.\r\n\r\nSin dar tiempo a que el aceite se caliente, añadimos las patatas y dejamos que se vayan friendo muy despacio, partiendo de un aceite casi en frío. Así conseguimos que las patatas se confiten en lugar de dorarse. De todas formas, cuando lleven unos diez minutos y hayamos removido de vez en cuando, podemos subir el fuego para conseguir que algunas de las patatas queden más tostaditas, originando así contrastes en el plato final.\r\n\r\nSacamos las patatas y las escurrimos bien del aceite y las ponemos en un bol grande. Escurrimos la cebolla cuando esté en su punto, y la ponemos sobre las patatas. Batimos los huevos y los añadimos al bol, removiendo con un tenedor para que se mezclen bien los tres ingredientes.', 'img-1653259934303.jpeg', 212, 1, 1, '00:45:00'),
(37, 'Ramen', 'Atamos la panceta con hilo de bramante de forma que la piel quede por fuera y prácticamente se junten un extremo y otro. Calentamos un poco de aceite en una olla exprés y marcamos la panceta por todas partes hasta dorar. Retiramos y desechamos el aceite.\r\n\r\nIntroducimos todas las verduras, peladas y lavadas, en la olla: la cebolla, la parte verde de los puerros, las zanahorias y los dientes de ajo. Limpiamos las setas de restos de tierra, cortamos tres rodajas de jengibre y añadimos a la olla.\r\n\r\nIncorporamos la carcasa de pollo y la panceta. Cubrimos con agua, cerramos la olla y llevamos a ebullición. Colocamos la válvula en la posición 2 y contamos 15 minutos desde el momento en que empiece a salir el vapor. Apagamos el fuego y esperamos a que baje la presión para abrir la olla.\r\n\r\nReservamos la panceta y las setas, utilizaremos ambos como acompañamiento del ramen. Colamos el caldo y desechamos el resto de tropezones. Desgrasamos para que quede más ligero.\r\n\r\nPara preparar los huevos marinados llenamos un cacito con agua y llevamos a ebullición. Introducimos los huevos con cuidado de no golpearlos y cocemos durante exactamente seis minutos. Enfriamos en un cuenco con agua helada para cortar la cocción y pelamos.\r\n\r\nCalentamos todos los ingredientes de la marinada en un cacito. Cuando hiervan retiramos del fuego y sumergimos los huevos y la panceta. Marinamos durante un par de horas, volteando de vez en cuando para que se impregnen de la salsa por todas partes.\r\n\r\nPor último cocemos los fideos siguiendo las instrucciones del paquete y ya estamos casi listos para montar el ramen y servirlo. Solo falta quitar el hilo de la panceta y cortar en lonchas finas, cortar los huevos por la mitad, picar el cebollino, laminar las setas y trocear una lámina de alga nori.\r\n\r\nA la hora de servir calentamos el caldo hasta que hierva para que llegue con buena temperatura a la mesa. Ponemos en cada cuenco cuatro o cinco cucharadas de la marinada de los huevos y la panceta, una ración de caldo, una ración de fideos, dos mitades de huevo cortado en dos mitades y un montoncito de panceta en rodajas.\r\n\r\nAcompañamos de las setas laminadas, un puñado de brotes de espinacas, alga nori y cebollino picado. Espolvoreamos con semillas de sésamo negro y listos para disfrutar de la mejor receta de ramen que vais a encontrar.', 'img-1653260493439.jpeg', 112, 1, 1, '01:09:00'),
(38, 'Paella valenciana', 'Toda paella que se precie comienza por un buen sofrito. En una paella cuanto más grande mejor, se sofríe en abundante aceite el pollo, el conejo, las judías, las alcachofas y los caracoles (la que veis en la foto no tiene garrofó porque no es temporada y el congelado no es igual), sazonando con un poco de sal y pimentón hacia el final. Cuando esté bien dorado se añade el tomate triturado y se rehoga.\r\n\r\nCon el sofrito listo se debe de añadir el agua. Las proporciones dependen mucho del fuego, del calor que haga, del grado de humedad y de lo grande que sea la paella, pero para comenzar, una buena proporción es la de añadir tres veces el volumen de agua que de arroz, aunque es la experiencia la que os hará ajustar y perfeccionar estas cantidades, que acabaréis haciendo a ojo, como hicieron la tía y la madre de mi novia, que eran las encargadas de esta paella (a pesar de que la tradición marca que sea el hombre de la casa el que la prepare).\r\n\r\nEchamos ahora algunos troncos más al fuego para que suba de potencia y se haga bien el caldo durante 25 o 30 minutos. Es un buen momento de echar el azafrán o, en su defecto, el sazonador de paella (el más popular es \"el paellador), que lleva sal, ajo, colorante y un poco de azafrán.\r\n\r\nLuego añadimos el arroz \"en caballete\" (en diagonal) y lo distribuimos por la paella. Cocemos entre 17 y 20 minutos, aunque aquí el tiempo lo marca de nuevo el grano de arroz y la potencia del fuego, que debemos ir dejando consumirse. Tiene que quedar completamente seco y suelto. Mi recomendación para los primerizos es que tengáis un cazo con agua hirviendo al lado, por si hay que añadir agua. A mitad cocción también podemos poner unas ramitas de romero, que retiraremos antes de servir.\r\n\r\nPor último, conviene dejar la paella reposar unos minutos tapada con un gran paño o papel de periódico --no es bueno porque con la humedad se puede liberar algo de tinta, pero toda la vida lo he visto usar-- antes de servirla y recibir el aplauso de los presentes.', 'img-1653260719099.jpeg', 212, 1, 1, '01:25:00'),
(39, 'Pa amb tomàquet', ') Cortar el pan en rodajas y tostar.\r\n\r\n2) Raspar con el ajo, partido al medio, el pan. Este paso es opcional y cada uno aprenderá a conocer cómo le gusta: cuánto más fuerte se frote el ajo, más picante quedará.\r\n\r\n3) Cortar el tomate a la mitad y refregarlo por el pan, para que lo impregne con su jugo.\r\n\r\n4) Agregar sal y un buen chorro de aceite de oliva.', 'img-1653260804336.jpeg', 212, 1, 1, '00:05:00'),
(40, 'Musaka', 'Esta receta es laboriosa, aunque ninguna de las fases que tiene esta elaboración tienen dificultad. Comenzamos cortando las berenjenas en láminas y las ponemos con un poco de sal sobre un papel absorbente para que recoja el agua que suelten y así las berenjenas no tendrán ningún regusto amargo. Después las freímos ligeramente y las reservamos.\r\n\r\nPor otra parte, picamos la cebolla y la zanahoria en brunoise y las pochamos en una sartén. Cuando estén blanditas, añadimos los tomates muy picados y dejamos que se cocinen en la sartén hasta tener un buen sofrito o salsa para la carne. Freímos ligeramente la carne picada en una sartén, la añadimos a la salsa de tomate y hortalizas y agregamos el tomillo, el vino y el caldo, dejando que cueza durante unos diez minutos hasta que no quede rastro de líquido.\r\n\r\nFinalmente, hacemos una salsa bechamel con 25 g de harina, 25 g de mantequilla y medio litro de leche, removiendo hasta que esté bien espeso. Con todos estos preparativos, podemos comenzar a montar el plato para después hornearlo, según os cuento a continuación.\r\nEn la receta habitual de moussaka que vemos en España no necesitamos nada más, pero en la mayoría de recetas tradicionales de moussaka en Grecia, se pone una primera capa de patatas cortadas en rodajas y fritas ligeramente. Esta capa hace de base para la moussaka. Sobre las patatas se pone una primera capa de berenjenas que después se cubren con una capa de carne.\r\n\r\nSobre la capa de carne ponemos otra capa de láminas de berenjena y volvemos a cubrir con la carne de cordero con la salsa, aplastando un poco con el dorso de la cuchara para que quede bien compacta. Finalmente cubrimos con bechamel, espolvoreamos con queso rallado y metemos la fuente en el horno donde horneamos durante 20 minutos a 160º y gratinamos 3 minutos a 220º.\r\n', 'img-1653261048015.jpeg', 86, 1, 1, '02:00:00'),
(41, 'Canelones', 'Aunque ella insiste en que preparar sus canelones no tiene misterio alguno, la verdad es que es una receta entretenida, aunque no hay ningún paso especialmente complicado.\r\n\r\nEmpezamos picando la cebolla y el ajo y poniéndolos a pochar en una sartén. Luego incorporamos la carne picada y, cuando se haya dorado, añadimos el paté, removiendo bien hasta que se integre. Retiramos del fuego y reservamos.\r\n\r\nPor otro lado, ponemos a cocer las láminas de pasta en abundante agua salada hirviendo, removiendo con frecuencia para que no se peguen. Tras 10 minutos (o lo que indique el envase), las escurrimos con agua fría y las extendemos rápidamente sobre un paño de cocina.\r\n\r\nAhora llega el momento de rellenar los canelones con la carne picada. Conviene no poner demasiada cantidad para que cierren bien, pero la suficiente para que no quede escaso. Para que queden más jugosos, mi abuela cubre la bandeja del horno con un papel de hornear untado con tomate frito.\r\n\r\nEl penúltimo paso es preparar la bechamel. En un cazo, derretimos los 100g de mantequilla, luego incorporamos las cuatro cucharadas colmadas de harina y removemos bien. Finalmente, vamos incorporando la leche sin dejar de remover, hasta que quede una bechamel cremosa, sin grumos, y un poco más líquida que la que se usa para las croquetas.\r\n\r\nAhora ya solo queda repartir la bechamel por encima de los canelones, colocar el queso rallado y gratinar en la parte alta del horno a máxima temperatura durante unos 15 minutos, hasta que quede bien dorado.', 'img-1653261557630.jpeg', 212, 1, 1, '01:30:00'),
(42, 'Spaghetti alla Carbonara', 'Comienza por partir la panceta en trozos gruesos y rallar el queso pecorino. Reserva estos ingredientes. Aprovecha también para separar las yemas de las claras de los huevos.\r\nSeguidamente, vamos a cocer los espaguetis. En un recipiente amplio calienta agua y cuando llegue a su punto de ebullición echa un buen pellizco de sal. Pon a cocer la pasta el tiempo que se indica en el paquete. Luego la vamos a saltear, por lo que deberás dejarla 1 minuto menos de lo recomendado. También puedes usar pasta fresca, por supuesto.\r\nPor otro lado, saltea la panceta en una sartén grande hasta que la parte grasa esté transparente y ligeramente tostada. En principio no es necesario incorporar más aceite, pues la propia panceta irá soltando grasita.\r\nEn otro recipiente mezcla las yemas con el queso pecorino (del cual habrás reservado un poco para espolvorear al final). Sazona con pimienta negra recién molida y un pellizco de sal. Añade un par de cucharadas del agua de la cocción de la pasta para hacer más fluida esta salsa carbonara.\r\nCuando a la pasta le quede 1 minuto de cocción para estar lista, añádela a la sartén y saltéala a fuego vivo durante otro minuto. Así se impregnará del sabor y la grasa que haya soltado la panceta.\r\nRetira la sartén del fuego y añade la mezcla de yemas y pecorino. Remueve bien teniendo cuidado de que no se cuaje el huevo. Añade alguna cucharada más del agua de la cocción para que la salsa quede más ligada.\r\nPrueba el punto de sal y pimienta. Espolvorea el resto del pecorino por encima de los espagueti y sírvelos recién hechos. \r\n', 'img-1653261799545.jpeg', 110, 1, 1, '00:20:00'),
(43, 'Nachos', 'Precalienta el horno a 180ºC con calor arriba y abajo.\r\nColoca en un plato o bandeja apta para horno una base de nachos.\r\nPor encima echa la mitad del chili con carne y esparce la mitad del queso rallado.\r\nDe nuevo pon una capa encima de nachos, un poco más metida hacia dentro que la anterior.\r\nVierte la otra mitad del chili con carne y también el queso restante\r\nIntroduce el plato o bandeja en el horno a altura media y hornea durante unos 10-15 minutos o lo que tarde el queso en gratinarse.\r\nMientras, prepara el guacamole. Pica la cebolleta y ponla en un bol.\r\nAbre el aguacate, retírale el hueso, saca la carne con ayuda de una cuchara sopera, ponlo en el bol y cháfalo con un tenedor para que quede grumoso o tritúralo junto con la cebolleta con una batidora si te gusta más finito.\r\nAñade el zumo de limón, el tabasco, el aceite de oliva y la sal y mezcla bien.\r\nPor último pica las hojas de cilantro y mézclalas con el guacamole. Pruébalo por si tienes que rectificarlo de sal o de cualquier otro ingrediente y ya lo tienes listo.\r\nLava el pimiento rojo, retírale el pedúnculo y las semillas y córtalo en tiras. Haz lo mismo con el pimiento verde. Después pica las tiras para conseguir trocitos pequeños.\r\nCuando saques el plato o bandeja del horno, reparte los chiles jalapeños.\r\nVierte también el pimiento rojo y el pimiento verde por encima, repartiéndolos por toda la superficie.\r\nTermina colocando el guacamole en el centro (o parte de él si es mucha cantidad) y decora con un poco de cilantro picado o en hojas.\r\n', 'img-1653262016592.jpeg', 145, 1, 1, '00:30:00'),
(44, 'Guacamole', 'Partimos los aguacates por la mitad longitudinalmente, retiramos el hueso (es fácil quitarlo si utilizas un cuchillo afilado y lo clavas a lo largo, girando luego), y con la ayuda de una cuchara sopera vaciamos las dos mitades.\r\nDisponemos los aguacates en un plato y con un tenedor o un aplastapurés trituramos. A nosotros personalmente nos gusta dejar el aguacate no demasiado triturado, para que no parezca un puré.\r\nTroceamos la cebolla en trocitos pequeños. Hacemos lo mismo con el tomate y el pimiento verde. Reservamos.\r\nPicamos el cilantro en trocitos pequeños, aproximadamente ½ cucharadita una vez este picado\r\n', 'img-1653262149680.jpeg', 145, 1, 1, '00:45:00'),
(45, 'Frikadellen', 'Basta con mezclar los ingredientes en un bol, trabajándolos con un tenedor hasta obtener una mezcla homogénea de carne picada. Cubrimos la mezcla con film de cocina y dejamos reposar dentro de la nevera durante 30 minutos.\r\nPasado ese tiempo, dividimos la mezcla en 6 partes y formamos 6 bolas como si estuviéramos haciendo albóndigas grandes. Con la palma de la mano las aplanamos un poco dándoles forma ovalada y las ponemos sobre la fuente de horno o plancha en la que las vamos a cocinar dejando cierta separación entre unas y otras.\r\nSi se hacen en el horno, quedan especialmente buenas porque no es necesario utilizar nada de grasa y los jugos se quedan en el interior obteniéndose como resultado unas frikadellen muy sabrosas debido a las especias y muy jugosas en su interior.\r\nPara cocinarlas basta ponerlas en el horno durante 8 minutos por un lado y otros 4 por el otro a una temperatura de 180ºC', 'img-1653262270913.jpeg', 83, 1, 1, '00:20:00');

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
('Ao8wXF8vJDkjbcHysSqwkR-_O9riU_Wx', 1653348671, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}'),
('B9nKJRFV9ymS4Cf9JXcOb9Yi24UCJGoD', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('Fn9uEf152QJbZOw_3_r4qMS76ejo-6SJ', 1653312587, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":79}}'),
('JeBMjH5qQMJAI9jJsvvGaQaQr6ZSfBAG', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('ZBJpyGhk3qFIzon4cXZeYWIugCF-tHlS', 1653312694, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('_PsRpnvl32RxWmeVDvuWjwubJuWRQd0_', 1653344456, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{},\"passport\":{\"user\":1}}'),
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
(23, 'Procedencia Animal'),
(24, 'Otros');

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
  MODIFY `id_ingredient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT de la tabla `receptes`
--
ALTER TABLE `receptes`
  MODIFY `id_recepta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `tipus`
--
ALTER TABLE `tipus`
  MODIFY `id_tipus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
