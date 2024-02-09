-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Фев 09 2024 г., 03:47
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_gatiyatov7605_work`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Груз`
--

CREATE TABLE `Груз` (
  `ID` int NOT NULL,
  `ID_Рейса` int NOT NULL,
  `Вес` int NOT NULL,
  `Отправитель` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Груз`
--

INSERT INTO `Груз` (`ID`, `ID_Рейса`, `Вес`, `Отправитель`) VALUES
(10000, 1000, 1000, 'Иванов Александр '),
(10001, 1001, 12000, 'ООО \"Чистый период\"'),
(10002, 1003, 900, 'Степан Александр'),
(10003, 1002, 4500, 'ИП Сорокин Василий'),
(10004, 1004, 1200, 'ООО \"Материал\"');

-- --------------------------------------------------------

--
-- Структура таблицы `Маршрут`
--

CREATE TABLE `Маршрут` (
  `ID` int NOT NULL,
  `Наименование` varchar(50) NOT NULL,
  `Тариф_за_1_кг` int NOT NULL,
  `Расстояние` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Маршрут`
--

INSERT INTO `Маршрут` (`ID`, `Наименование`, `Тариф_за_1_кг`, `Расстояние`) VALUES
(100, 'Сургут - Нефтеюганск', 4, 46),
(101, 'Сургут - Нижневартовск', 7, 222),
(102, 'Сургут - Лянтор', 5, 92),
(103, 'Сургут - Пыть-Ях', 6, 103),
(104, 'Сургут - Тюмень', 8, 787);

-- --------------------------------------------------------

--
-- Структура таблицы `Рейс`
--

CREATE TABLE `Рейс` (
  `ID` int NOT NULL,
  `ID_Маршрута` int NOT NULL,
  `ID_Транспорта` int NOT NULL,
  `Дата_и_время_отправления` datetime(6) NOT NULL,
  `Дата_и_время_прибытия` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Рейс`
--

INSERT INTO `Рейс` (`ID`, `ID_Маршрута`, `ID_Транспорта`, `Дата_и_время_отправления`, `Дата_и_время_прибытия`) VALUES
(1000, 104, 10, '2024-01-01 11:34:22.000000', '2024-01-01 21:00:00.000000'),
(1001, 102, 12, '2024-02-01 19:48:22.000000', '2024-02-02 04:00:00.000000'),
(1002, 100, 11, '2024-02-05 20:07:59.000000', '2024-02-05 21:20:00.000000'),
(1003, 101, 14, '2024-02-07 15:07:39.000000', '2024-02-07 20:00:00.000000'),
(1004, 103, 13, '2024-02-06 04:07:59.000000', '2024-02-06 08:07:59.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `Транспорт`
--

CREATE TABLE `Транспорт` (
  `ID` int NOT NULL,
  `Наименования` varchar(50) NOT NULL,
  `Грузоподъёмность` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `Транспорт`
--

INSERT INTO `Транспорт` (`ID`, `Наименования`, `Грузоподъёмность`) VALUES
(10, 'ГАЗ-3302', 3500),
(11, 'ЗИЛ-130', 5000),
(12, 'КамАЗ-65115', 15000),
(13, 'ЗИЛ-5301', 3000),
(14, 'Hyundai Porter', 950);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Груз`
--
ALTER TABLE `Груз`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Рейса` (`ID_Рейса`);

--
-- Индексы таблицы `Маршрут`
--
ALTER TABLE `Маршрут`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `Рейс`
--
ALTER TABLE `Рейс`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_Маршрута` (`ID_Маршрута`) USING BTREE,
  ADD UNIQUE KEY `ID_Транспорта` (`ID_Транспорта`) USING BTREE;

--
-- Индексы таблицы `Транспорт`
--
ALTER TABLE `Транспорт`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Груз`
--
ALTER TABLE `Груз`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10005;

--
-- AUTO_INCREMENT для таблицы `Маршрут`
--
ALTER TABLE `Маршрут`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT для таблицы `Рейс`
--
ALTER TABLE `Рейс`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT для таблицы `Транспорт`
--
ALTER TABLE `Транспорт`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Груз`
--
ALTER TABLE `Груз`
  ADD CONSTRAINT `Груз_ibfk_1` FOREIGN KEY (`ID_Рейса`) REFERENCES `Рейс` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Рейс`
--
ALTER TABLE `Рейс`
  ADD CONSTRAINT `Рейс_ibfk_1` FOREIGN KEY (`ID_Маршрута`) REFERENCES `Маршрут` (`ID`),
  ADD CONSTRAINT `Рейс_ibfk_2` FOREIGN KEY (`ID_Транспорта`) REFERENCES `Транспорт` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
