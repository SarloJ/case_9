-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 24 2023 г., 02:19
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `online store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `go` int UNSIGNED NOT NULL,
  `product id` int UNSIGNED NOT NULL,
  `quantity in stock` int UNSIGNED NOT NULL,
  `price` int UNSIGNED NOT NULL,
  `product category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trade marks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `goods in stores`
--

CREATE TABLE `goods in stores` (
  `gis` int UNSIGNED NOT NULL,
  `store id` int UNSIGNED NOT NULL,
  `product id` int UNSIGNED NOT NULL,
  `quantity of goods` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `point of issue`
--

CREATE TABLE `point of issue` (
  `ts` int UNSIGNED NOT NULL,
  `point of issue id` int UNSIGNED NOT NULL,
  `town` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hous` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `store support phone` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `product category`
--

CREATE TABLE `product category` (
  `pc` int UNSIGNED NOT NULL,
  `category id` int UNSIGNED NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shipments`
--

CREATE TABLE `shipments` (
  `sh` int UNSIGNED NOT NULL,
  `shipment id` int NOT NULL,
  `Shipping date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `store id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `shipped goods`
--

CREATE TABLE `shipped goods` (
  `sg` int UNSIGNED NOT NULL,
  `product id` int UNSIGNED NOT NULL,
  `shipment id` int UNSIGNED NOT NULL,
  `number` int UNSIGNED NOT NULL,
  `taken into account` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `store inventory`
--

CREATE TABLE `store inventory` (
  `si` int UNSIGNED NOT NULL,
  `store id` int UNSIGNED NOT NULL,
  `quantity of goods` int UNSIGNED NOT NULL,
  `product id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `the shops`
--

CREATE TABLE `the shops` (
  `ts` int UNSIGNED NOT NULL,
  `store id` int NOT NULL,
  `town` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hous` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `store support phone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `trade marks`
--

CREATE TABLE `trade marks` (
  `tm` int UNSIGNED NOT NULL,
  `brand id` int UNSIGNED NOT NULL,
  `trademark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `the address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brand phone` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user account`
--

CREATE TABLE `user account` (
  `ua` int UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e-mail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user order`
--

CREATE TABLE `user order` (
  `ur` int UNSIGNED NOT NULL,
  `User id` int UNSIGNED NOT NULL,
  `issuing store id` int UNSIGNED NOT NULL,
  `product id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`go`);

--
-- Индексы таблицы `goods in stores`
--
ALTER TABLE `goods in stores`
  ADD PRIMARY KEY (`gis`);

--
-- Индексы таблицы `point of issue`
--
ALTER TABLE `point of issue`
  ADD PRIMARY KEY (`ts`);

--
-- Индексы таблицы `product category`
--
ALTER TABLE `product category`
  ADD PRIMARY KEY (`pc`);

--
-- Индексы таблицы `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`sh`);

--
-- Индексы таблицы `shipped goods`
--
ALTER TABLE `shipped goods`
  ADD PRIMARY KEY (`sg`);

--
-- Индексы таблицы `store inventory`
--
ALTER TABLE `store inventory`
  ADD PRIMARY KEY (`si`);

--
-- Индексы таблицы `the shops`
--
ALTER TABLE `the shops`
  ADD PRIMARY KEY (`ts`);

--
-- Индексы таблицы `trade marks`
--
ALTER TABLE `trade marks`
  ADD PRIMARY KEY (`tm`),
  ADD UNIQUE KEY `brand id` (`brand id`),
  ADD UNIQUE KEY `trademark` (`trademark`);

--
-- Индексы таблицы `user account`
--
ALTER TABLE `user account`
  ADD PRIMARY KEY (`ua`),
  ADD UNIQUE KEY `e-mail` (`e-mail`);

--
-- Индексы таблицы `user order`
--
ALTER TABLE `user order`
  ADD PRIMARY KEY (`ur`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `go` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `goods in stores`
--
ALTER TABLE `goods in stores`
  MODIFY `gis` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `point of issue`
--
ALTER TABLE `point of issue`
  MODIFY `ts` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product category`
--
ALTER TABLE `product category`
  MODIFY `pc` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store inventory`
--
ALTER TABLE `store inventory`
  MODIFY `si` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `the shops`
--
ALTER TABLE `the shops`
  MODIFY `ts` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `trade marks`
--
ALTER TABLE `trade marks`
  MODIFY `tm` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user account`
--
ALTER TABLE `user account`
  MODIFY `ua` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user order`
--
ALTER TABLE `user order`
  MODIFY `ur` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
