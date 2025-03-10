-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2025 a las 19:36:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejemplo_base`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`` PROCEDURE `contar_productos_agotados` (OUT `cantidad` INT)   BEGIN
    SELECT COUNT(*) INTO cantidad FROM productos WHERE estado = 'agotado';
END$$

CREATE DEFINER=`` PROCEDURE `contar_productos_disponibles` (OUT `cantidad` INT)   BEGIN
    SELECT COUNT(*) INTO cantidad FROM productos WHERE estado = 'disponible';
END$$

CREATE DEFINER=`` PROCEDURE `contar_productos_no_disponibles` (OUT `cantidad` INT)   BEGIN
    SELECT COUNT(*) INTO cantidad FROM productos WHERE estado = 'no disponible';
END$$

CREATE DEFINER=`` PROCEDURE `obtenerProductosPorEstado` (IN `nombre_estado` VARCHAR(255))   BEGIN
  SELECT * FROM productos WHERE estado = nombre_estado;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'disponible',
  `precio` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `estado`, `precio`) VALUES
(1, 'producto a', 'disponible', 3),
(2, 'producto b', 'disponible', 4),
(3, 'producto c', 'agotado', 7),
(4, 'Tarjeta Gráfica RTX ', 'agotado', 450),
(5, 'Fuente de Poder 750W', 'agotado', 120),
(6, 'Teclado Mecánico', 'agotado', 85),
(7, 'Cámara Web HD', 'agotado', 50),
(8, 'Mouse Logitech', 'disponible', 25.99),
(9, 'Impresora Epson', 'disponible', 150),
(10, 'Disco Duro 1TB', 'disponible', 80.2),
(11, 'Silla Gamer', 'disponible', 200),
(12, 'Auriculares Bluetoot', 'disponible', 70.5),
(13, 'Router WiFi 6', 'disponible', 110.75),
(14, 'Tablet Samsung', 'disponible', 320),
(15, 'Teclado Redragon', 'no disponible', 45.5),
(16, 'Procesador Ryzen 7', 'no disponible', 350),
(17, 'SSD NVMe 1TB', 'no disponible', 130),
(18, 'Caja para PC ATX', 'no disponible', 90),
(19, 'Sistema de Refrigera', 'no disponible', 180),
(20, 'Tarjeta Madre MSI', 'no disponible', 220),
(21, 'Micrófono USB', 'no disponible', 60),
(22, 'Laptop HP', 'agotado', 1200),
(23, 'Monitor Samsung', 'agotado', 300.75),
(24, 'Memoria RAM 16GB', 'agotado', 95.99);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
