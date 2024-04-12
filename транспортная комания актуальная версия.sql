-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 12 2024 г., 08:00
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Работа2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cargo`
--

CREATE TABLE `cargo` (
  `ID` int NOT NULL,
  `ID_Рейса` int NOT NULL,
  `Вес` int NOT NULL,
  `Отправитель` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `cargo`
--

INSERT INTO `cargo` (`ID`, `ID_Рейса`, `Вес`, `Отправитель`) VALUES
(10000, 1000, 1000, 'Иванов Александр'),
(10001, 1000, 12000, 'ООО \"Чистый период\"'),
(10002, 1001, 900, 'Степан Александр'),
(10003, 1001, 2500, 'ИП Сорокин Василий'),
(10004, 1002, 1200, 'ООО \"Материал\"'),
(10005, 1002, 300, 'Василий Тёркин'),
(10006, 1003, 400, 'Джон Гаврилов'),
(10007, 1003, 1000, 'ООО \"Быстрые ноги\"'),
(10008, 1004, 10, 'Миша Юрченко'),
(10009, 1005, 5000, 'ИП Иванов Иванович '),
(10010, 1005, 1000, 'Пётр Петрович'),
(10011, 1006, 3500, 'ООО Алёна Гаврилова');

-- --------------------------------------------------------

--
-- Структура таблицы `cruise`
--

CREATE TABLE `cruise` (
  `ID` int NOT NULL,
  `ID_Маршрута` int NOT NULL,
  `ID_Транспорта` int NOT NULL,
  `Дата_и_время_отправления` datetime(6) NOT NULL,
  `Дата_и_время_прибытия` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `cruise`
--

INSERT INTO `cruise` (`ID`, `ID_Маршрута`, `ID_Транспорта`, `Дата_и_время_отправления`, `Дата_и_время_прибытия`) VALUES
(1000, 101, 12, '2024-03-06 16:14:00.000000', '2024-03-06 21:14:00.000000'),
(1001, 101, 10, '2024-03-01 11:00:00.000000', '2024-03-01 14:00:00.000000'),
(1002, 101, 11, '2024-03-03 08:14:00.000000', '2024-03-03 13:14:00.000000'),
(1003, 100, 10, '2024-03-04 14:19:03.000000', '2024-03-04 12:14:16.000000'),
(1004, 100, 11, '2024-03-11 14:38:13.000000', '2024-03-11 16:19:03.000000'),
(1005, 102, 12, '2024-03-12 15:31:18.000000', '2024-03-12 18:21:18.000000'),
(1006, 102, 10, '2024-03-08 13:29:18.000000', '2024-03-08 16:21:18.000000'),
(1007, 101, 10, '2024-03-20 09:33:26.000000', '2024-03-21 09:33:26.000000');

-- --------------------------------------------------------

--
-- Структура таблицы `route`
--

CREATE TABLE `route` (
  `ID` int NOT NULL,
  `Наименование` varchar(50) NOT NULL,
  `Тариф_за_1_кг` int NOT NULL,
  `Расстояние` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `route`
--

INSERT INTO `route` (`ID`, `Наименование`, `Тариф_за_1_кг`, `Расстояние`) VALUES
(100, 'Сургут - Нефтеюганск', 4, 46),
(101, 'Сургут - Нижневартовск', 7, 222),
(102, 'Сургут - Лянтор', 5, 92);

-- --------------------------------------------------------

--
-- Структура таблицы `transport`
--

CREATE TABLE `transport` (
  `ID` int NOT NULL,
  `Наименования` varchar(50) NOT NULL,
  `Грузоподъёмность` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `transport`
--

INSERT INTO `transport` (`ID`, `Наименования`, `Грузоподъёмность`) VALUES
(10, 'ГАЗ-3302', 3500),
(11, 'ЗИЛ-130', 5000),
(12, 'КамАЗ-65115', 15000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Рейса` (`ID_Рейса`) USING BTREE;

--
-- Индексы таблицы `cruise`
--
ALTER TABLE `cruise`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_Маршрута` (`ID_Маршрута`) USING BTREE,
  ADD KEY `ID_Транспорта` (`ID_Транспорта`) USING BTREE;

--
-- Индексы таблицы `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `transport`
--
ALTER TABLE `transport`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cargo`
--
ALTER TABLE `cargo`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10012;

--
-- AUTO_INCREMENT для таблицы `cruise`
--
ALTER TABLE `cruise`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10004;

--
-- AUTO_INCREMENT для таблицы `route`
--
ALTER TABLE `route`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT для таблицы `transport`
--
ALTER TABLE `transport`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `Груз_ibfk_1` FOREIGN KEY (`ID_Рейса`) REFERENCES `cruise` (`ID`);

--
-- Ограничения внешнего ключа таблицы `cruise`
--
ALTER TABLE `cruise`
  ADD CONSTRAINT `Рейс_ibfk_1` FOREIGN KEY (`ID_Маршрута`) REFERENCES `route` (`ID`),
  ADD CONSTRAINT `Рейс_ibfk_2` FOREIGN KEY (`ID_Транспорта`) REFERENCES `transport` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
