-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2023 a las 13:09:02
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(45) NOT NULL,
  `descripcion_categoria` varchar(455) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`) VALUES
(1, 'Tecnología', 'Categoría para productos electrónicos y tecnológicos.'),
(2, 'Ropa', 'Categoría para ropa y accesorios de moda.'),
(3, 'Hogar', 'Categoría para productos para el hogar como muebles y electrodomésticos.'),
(4, 'Salud y Belleza', 'Categoría para productos de cuidado personal y belleza.'),
(5, 'Deportes y Aire libre', 'Categoría para productos relacionados con deportes y actividades al aire libre.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `id_usuario_chat` int(11) NOT NULL,
  `id_empresa_chat` int(11) NOT NULL,
  `mensaje_chat` varchar(1000) NOT NULL,
  `fecha_hora_envio_chat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chat`
--

INSERT INTO `chat` (`id_chat`, `id_usuario_chat`, `id_empresa_chat`, `mensaje_chat`, `fecha_hora_envio_chat`) VALUES
(1, 1, 1, 'Hola, ¿puedo reservar una mesa para dos personas el próximo sábado a las 8 pm?', '2023-04-24 13:30:00'),
(2, 1, 1, 'Claro, ¿en qué nombre hago la reserva?', '2023-04-24 13:35:00'),
(3, 2, 2, 'Buenas tardes, quisiera solicitar información sobre sus servicios de catering para eventos', '2023-04-23 10:15:00'),
(4, 2, 2, '¡Hola! Claro, tenemos diferentes opciones de menú y servicios, ¿me puede proporcionar más detalles sobre el evento?', '2023-04-23 10:20:00'),
(5, 3, 3, 'Buen día, ¿tienen disponibilidad para un masaje de 60 minutos esta tarde?', '2023-04-22 16:45:00'),
(6, 3, 3, 'Sí, tenemos disponibilidad a las 18:00 horas. ¿Le interesa agendar la cita?', '2023-04-22 16:50:00'),
(7, 4, 4, 'Hola, quisiera reservar una habitación doble para el fin de semana del 6 al 8 de mayo', '2023-04-21 14:00:00'),
(8, 4, 4, 'Perfecto, ¿en qué nombre se hará la reserva?', '2023-04-21 14:05:00'),
(9, 5, 5, 'Buenas tardes, quisiera solicitar información sobre su servicio de diseño web', '2023-04-20 11:30:00'),
(10, 5, 5, 'Hola, con gusto le puedo proporcionar información, ¿en qué puedo ayudarle específicamente?', '2023-04-20 11:35:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id_empresa` int(11) NOT NULL,
  `nombre_empresa` varchar(45) NOT NULL,
  `cif_empresa` varchar(10) NOT NULL,
  `email_empresa` varchar(255) NOT NULL,
  `email_recuperacion_empresa` varchar(255) NOT NULL,
  `ciudad_empresa` varchar(45) NOT NULL,
  `direccion_empresa` varchar(255) NOT NULL,
  `telefono1_empresa` varchar(45) NOT NULL,
  `telefono2_empresa` varchar(45) DEFAULT NULL,
  `telefono3_empresa` varchar(45) DEFAULT NULL,
  `pass_empresa` varchar(255) NOT NULL,
  `web_empresa` varchar(255) DEFAULT NULL,
  `descripcion_empresa` varchar(455) DEFAULT NULL,
  `fecha_creacion_empresa` timestamp NOT NULL DEFAULT current_timestamp(),
  `horario_empresa` varchar(255) DEFAULT NULL,
  `id_categoria_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `cif_empresa`, `email_empresa`, `email_recuperacion_empresa`, `ciudad_empresa`, `direccion_empresa`, `telefono1_empresa`, `telefono2_empresa`, `telefono3_empresa`, `pass_empresa`, `web_empresa`, `descripcion_empresa`, `fecha_creacion_empresa`, `horario_empresa`, `id_categoria_empresa`) VALUES
(1, 'Electrodomésticos S.A.', 'A1234567', 'electrodomesticos@example.com', 'electrodomesticos_recovery@example.com', 'Madrid', 'Calle Mayor 1', '+34 911 111 111', '+34 911 111 222', '', 'password123', 'www.electrodomesticos.com', 'Empresa dedicada a la venta de electrodomésticos de alta calidad', '2023-04-24 10:30:42', 'Lunes a Viernes de 9:00 a 18:00', 3),
(2, 'Moda y Complementos S.L.', 'B2345678', 'modaycomplementos@example.com', 'modaycomplementos_recovery@example.com', 'Barcelona', 'Avenida Diagonal 100', '+34 922 222 111', '+34 922 222 222', '', 'password123', 'www.modaycomplementos.com', 'Empresa dedicada a la venta de ropa y accesorios de moda', '2023-04-24 10:30:42', 'Lunes a Viernes de 10:00 a 20:00', 2),
(3, 'Tecnología e Informática S.L.', 'C3456789', 'tecnologiainformatica@example.com', 'tecnologiainformatica_recovery@example.com', 'Valencia', 'Calle San Vicente 25', '+34 933 333 111', '+34 933 333 222', '', 'password123', 'www.tecnologiainformatica.com', 'Empresa dedicada a la venta de productos electrónicos y tecnológicos', '2023-04-24 10:30:42', 'Lunes a Viernes de 9:00 a 18:00', 1),
(4, 'Deportes y Aire Libre S.A.', 'D4567890', 'deportesyairelibre@example.com', 'deportesyairelibre_recovery@example.com', 'Sevilla', 'Calle Sierpes 10', '+34 944 444 111', '+34 944 444 222', '', 'password123', 'www.deportesyairelibre.com', 'Empresa dedicada a la venta de productos relacionados con deportes y actividades al aire libre', '2023-04-24 10:30:42', 'Lunes a Viernes de 10:00 a 20:00', 5),
(5, 'Muebles y Decoración S.A.', 'E5678901', 'mueblesydecoracion@example.com', 'mueblesydecoracion_recovery@example.com', 'Bilbao', 'Calle Gran Vía 50', '+34 955 555 111', '+34 955 555 222', '', 'password123', 'www.mueblesydecoracion.com', 'Empresa dedicada a la venta de muebles y artículos de decoración para el hogar', '2023-04-24 10:30:42', 'Lunes a Viernes de 9:00 a 18:00', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL,
  `id_reserva_factura` int(11) NOT NULL,
  `precio_factura` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`id_factura`, `id_reserva_factura`, `precio_factura`) VALUES
(1, 1, 25.99),
(2, 2, 15.5),
(3, 3, 32.75),
(4, 4, 45),
(5, 5, 28.99),
(6, 6, 39.5),
(7, 7, 20),
(8, 8, 55),
(9, 9, 30.99),
(10, 10, 18.5),
(11, 11, 27.75),
(12, 12, 50),
(13, 13, 33.99),
(14, 14, 45.5),
(15, 15, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `fecha_hora_reserva` datetime NOT NULL,
  `comentario_reserva` varchar(455) DEFAULT NULL,
  `id_usuario_reserva` int(11) NOT NULL,
  `id_empresa_reserva` int(11) NOT NULL,
  `id_servicio_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `fecha_hora_reserva`, `comentario_reserva`, `id_usuario_reserva`, `id_empresa_reserva`, `id_servicio_reserva`) VALUES
(1, '2023-05-01 10:00:00', 'Quiero reservar para dos personas', 1, 3, 8),
(2, '2023-06-15 16:30:00', 'Necesito una mesa para cuatro personas', 1, 1, 5),
(3, '2023-07-20 12:00:00', 'Quiero reservar una habitación doble', 1, 2, 10),
(4, '2023-05-10 15:00:00', 'Necesito un presupuesto para un proyecto', 2, 4, 13),
(5, '2023-06-25 18:00:00', 'Quiero reservar una sesión de entrenamiento', 2, 5, 15),
(6, '2023-08-05 10:30:00', 'Necesito un presupuesto para el diseño de una página web', 2, 1, 3),
(7, '2023-05-17 19:00:00', 'Quiero reservar una mesa para dos personas', 3, 3, 7),
(8, '2023-06-30 11:00:00', 'Quiero reservar una habitación individual', 3, 2, 11),
(9, '2023-07-15 14:00:00', 'Necesito un presupuesto para la reparación de mi ordenador', 3, 4, 1),
(10, '2023-05-08 12:30:00', 'Quiero reservar una sesión de manicura y pedicura', 4, 3, 9),
(11, '2023-06-20 16:00:00', 'Quiero reservar una sesión de maquillaje', 4, 5, 12),
(12, '2023-08-10 09:00:00', 'Necesito un presupuesto para el mantenimiento de mi red', 4, 1, 2),
(13, '2023-05-25 20:00:00', 'Quiero reservar una mesa para cuatro personas', 5, 3, 7),
(14, '2023-06-10 14:00:00', 'Quiero reservar una habitación doble', 5, 2, 10),
(15, '2023-07-05 11:00:00', 'Quiero reservar una sesión de entrenamiento personal', 5, 5, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(45) NOT NULL,
  `id_categoria_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `id_categoria_servicio`) VALUES
(1, 'Reparación de ordenadores', 1),
(2, 'Mantenimiento de redes', 1),
(3, 'Diseño de páginas web', 1),
(4, 'Catering para eventos', 2),
(5, 'Comida a domicilio', 2),
(6, 'Postres y pasteles personalizados', 2),
(7, 'Corte de cabello', 3),
(8, 'Manicura y pedicura', 3),
(9, 'Maquillaje profesional', 3),
(10, 'Decoración de interiores', 4),
(11, 'Montaje de muebles', 4),
(12, 'Limpieza del hogar', 4),
(13, 'Entrenamiento personal', 5),
(14, 'Caminatas y senderismo', 5),
(15, 'Alquiler de bicicletas', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `apellidos_usuario` varchar(45) NOT NULL,
  `email_usuario` varchar(255) NOT NULL,
  `pass_usuario` varchar(255) NOT NULL,
  `fecha_nacimiento_usuario` date NOT NULL,
  `telefono_usuario` varchar(45) DEFAULT NULL,
  `email_recuperacion_usuario` varchar(255) NOT NULL,
  `fecha_creacion_usuario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `apellidos_usuario`, `email_usuario`, `pass_usuario`, `fecha_nacimiento_usuario`, `telefono_usuario`, `email_recuperacion_usuario`, `fecha_creacion_usuario`) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', 'password123', '1990-01-01', '+1-555-555-5555', 'johndoe_recovery@example.com', '2023-04-24 10:30:42'),
(2, 'Jane', 'Doe', 'janedoe@example.com', 'password123', '1995-05-05', '+1-555-555-5555', 'janedoe_recovery@example.com', '2023-04-24 10:30:42'),
(3, 'Bob', 'Smith', 'bobsmith@example.com', 'password123', '1985-12-12', '+1-555-555-5555', 'bobsmith_recovery@example.com', '2023-04-24 10:30:42'),
(4, 'Alice', 'Johnson', 'alicejohnson@example.com', 'password123', '1988-09-15', '+1-555-555-5555', 'alicejohnson_recovery@example.com', '2023-04-24 10:30:42'),
(5, 'Tom', 'Davis', 'tomdavis@example.com', 'password123', '1992-06-30', '+1-555-555-5555', 'tomdavis_recovery@example.com', '2023-04-24 10:30:42');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_usuario_chat` (`id_usuario_chat`),
  ADD KEY `id_empresa_chat` (`id_empresa_chat`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id_empresa`),
  ADD UNIQUE KEY `cif_empresa` (`cif_empresa`),
  ADD UNIQUE KEY `email_empresa` (`email_empresa`),
  ADD KEY `id_categoria_empresa` (`id_categoria_empresa`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_reserva_factura` (`id_reserva_factura`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario_reserva` (`id_usuario_reserva`),
  ADD KEY `id_empresa_reserva` (`id_empresa_reserva`),
  ADD KEY `id_servicio_reserva` (`id_servicio_reserva`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_categoria_servicio` (`id_categoria_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email_usuario` (`email_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`id_usuario_chat`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`id_empresa_chat`) REFERENCES `empresas` (`id_empresa`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`id_categoria_empresa`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_reserva_factura`) REFERENCES `reservas` (`id_reserva`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario_reserva`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_empresa_reserva`) REFERENCES `empresas` (`id_empresa`),
  ADD CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_servicio_reserva`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`id_categoria_servicio`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
