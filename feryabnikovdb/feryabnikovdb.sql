-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Апр 21 2023 г., 15:30
-- Версия сервера: 5.7.24
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `feryabnikovdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manager_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `manager_id`) VALUES
(1, 'Отдел продаж', 8),
(2, 'Отдел разработки', 6),
(3, 'Отдел маркетинга', 3),
(4, 'Финансовый отдел', 4),
(5, 'Отдел обслуживания', 5),
(6, 'Отдел кадров', 7),
(7, 'Отдел продукта', 13),
(8, 'Отдел аналитики', 9),
(9, 'Отдел контента', 12),
(10, 'Технический отдел', 11),
(11, 'Отдел продаж', 1),
(12, 'Отдел разработки', 2),
(13, 'Отдел маркетинга', 3),
(14, 'Финансовый отдел', 4),
(15, 'Отдел обслуживания', 5),
(16, 'Отдел продаж', 1),
(17, 'Отдел разработки', 2),
(18, 'Отдел маркетинга', 3),
(19, 'Финансовый отдел', 4),
(20, 'Отдел обслуживания', 5),
(21, 'Отдел кадров', 6),
(22, 'Отдел продукта', 7),
(23, 'Отдел аналитики', 8),
(24, 'Отдел контента', 9),
(25, 'Технический отдел', 10),
(26, 'Отдел технической поддержки', 11),
(27, 'Отдел тестирования', 12),
(28, 'Отдел дизайна', 13),
(29, 'Отдел управления проектами', 14),
(30, 'Отдел логистики', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `hire_date` date NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`employee_id`, `name`, `position`, `salary`, `hire_date`, `department_id`) VALUES
(1, 'Иван Иванов', 'Менеджер', '50000.00', '2021-01-01', 1),
(2, 'Петр Петров', 'Программист', '60000.00', '2020-05-15', 2),
(3, 'Ольга Смирнова', 'Маркетолог', '45000.00', '2021-03-20', 3),
(4, 'Алексей Козлов', 'Бухгалтер', '55000.00', '2020-02-10', 4),
(5, 'Анна Иванова', 'Администратор', '40000.00', '2021-04-25', 5),
(6, 'Максим Соколов', 'Разработчик', '65000.00', '2019-10-07', 6),
(7, 'Екатерина Кузнецова', 'HR-специалист', '45000.00', '2020-08-15', 7),
(8, 'Дмитрий Петров', 'Менеджер по продажам', '55000.00', '2021-02-05', 8),
(9, 'Наталья Ильина', 'Аналитик', '60000.00', '2019-05-10', 9),
(10, 'Роман Соловьев', 'Дизайнер', '50000.00', '2020-11-15', 10),
(11, 'Сергей Лебедев', 'Инженер', '65000.00', '2021-06-01', 11),
(12, 'Татьяна Комарова', 'Контент-менеджер', '45000.00', '2019-04-20', 12),
(13, 'Александр Иванов', 'Продукт-менеджер', '70000.00', '2018-08-10', 13),
(14, 'Ирина Федорова', 'Финансовый аналитик', '60000.00', '2020-01-01', 14),
(15, 'Мария Никитина', 'Копирайтер', '40000.00', '2021-07-15', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `employee_transfer_log`
--

CREATE TABLE `employee_transfer_log` (
  `transfer_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `from_department_id` int(11) NOT NULL,
  `to_department_id` int(11) NOT NULL,
  `transfer_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employee_transfer_log`
--

INSERT INTO `employee_transfer_log` (`transfer_id`, `employee_id`, `from_department_id`, `to_department_id`, `transfer_date`) VALUES
(1, 1, 13, 8, '2021-06-01'),
(2, 2, 2, 6, '2021-03-15'),
(3, 3, 7, 3, '2021-07-20'),
(4, 4, 4, 14, '2021-01-01'),
(5, 5, 10, 5, '2021-05-15'),
(6, 6, 1, 15, '2021-02-20'),
(7, 7, 15, 12, '2021-04-01'),
(8, 8, 8, 13, '2021-08-01'),
(9, 9, 9, 2, '2021-06-15'),
(10, 10, 5, 10, '2021-03-01'),
(11, 11, 11, 4, '2021-02-15'),
(12, 12, 12, 7, '2021-05-01'),
(13, 13, 13, 11, '2021-04-15'),
(14, 14, 14, 9, '2021-03-01'),
(15, 15, 6, 1, '2021-07-01');

-- --------------------------------------------------------

--
-- Структура таблицы `job_positions`
--

CREATE TABLE `job_positions` (
  `position_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `requirements` text NOT NULL,
  `salary` decimal(10,2) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `job_positions`
--

INSERT INTO `job_positions` (`position_id`, `title`, `requirements`, `salary`, `department_id`) VALUES
(1, 'Менеджер по продажам', 'Опыт работы в продажах от 3 лет, коммуникабельность, стрессоустойчивость', '60000.00', 1),
(2, 'Ведущий программист', 'Опыт разработки ПО от 5 лет, знание C++, знание протоколов TCP/IP', '90000.00', 2),
(3, 'Маркетолог', 'Знание основ маркетинга, опыт проведения и анализа маркетинговых кампаний от 2 лет', '50000.00', 3),
(4, 'Бухгалтер', 'Опыт ведения бухгалтерского учета, знание налогового законодательства РФ', '55000.00', 4),
(5, 'Администратор', 'Опыт работы в офисе от 1 года, знание программ MS Office', '40000.00', 5),
(6, 'Разработчик', 'Опыт разработки ПО на Java от 3 лет, знание основ HTML/CSS/JS', '75000.00', 6),
(7, 'HR-специалист', 'Опыт работы в рекрутменте от 2 лет, коммуникабельность, умение работать с кадровой документацией', '45000.00', 7),
(8, 'Менеджер по продукту', 'Опыт в продуктовой разработке от 5 лет, умение проводить маркетинговые исследования', '85000.00', 8),
(9, 'Аналитик', 'Опыт работы с анализом данных от 3 лет, знание SQL', '65000.00', 9),
(10, 'Дизайнер', 'Опыт работы в дизайне от 2 лет, знание Adobe Photoshop, Adobe Illustrator', '60000.00', 10),
(11, 'Инженер', 'Опыт работы в разработке механизмов от 3 лет, знание CAD-программ', '80000.00', 11),
(12, 'Контент-менеджер', 'Опыт работы с текстом от 2 лет, умение работать с CMS', '45000.00', 12),
(13, 'Продукт-менеджер', 'Опыт работы в продуктовой разработке от 5 лет, умение проводить маркетинговые исследования', '85000.00', 13),
(14, 'Финансовый аналитик', 'Опыт работы в финансовом анализе от 3 лет, знание Excel', '70000.00', 14),
(15, 'Копирайтер', 'Опыт работы с текстом от 1 года, знание SEO', '40000.00', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(100) UNSIGNED NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `name`, `mail`) VALUES
(0, 'Feryabnikov', '12345', 'Nikita', 'moshniypo4an@gmail.com'),
(1, 'test', '12345', 'test', 'test@gmail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Индексы таблицы `employee_transfer_log`
--
ALTER TABLE `employee_transfer_log`
  ADD PRIMARY KEY (`transfer_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `from_department_id` (`from_department_id`),
  ADD KEY `to_department_id` (`to_department_id`);

--
-- Индексы таблицы `job_positions`
--
ALTER TABLE `job_positions`
  ADD PRIMARY KEY (`position_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `employee_transfer_log`
--
ALTER TABLE `employee_transfer_log`
  MODIFY `transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `job_positions`
--
ALTER TABLE `job_positions`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);

--
-- Ограничения внешнего ключа таблицы `employee_transfer_log`
--
ALTER TABLE `employee_transfer_log`
  ADD CONSTRAINT `employee_transfer_log_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `employee_transfer_log_ibfk_2` FOREIGN KEY (`from_department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `employee_transfer_log_ibfk_3` FOREIGN KEY (`to_department_id`) REFERENCES `departments` (`department_id`);

--
-- Ограничения внешнего ключа таблицы `job_positions`
--
ALTER TABLE `job_positions`
  ADD CONSTRAINT `job_positions_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
