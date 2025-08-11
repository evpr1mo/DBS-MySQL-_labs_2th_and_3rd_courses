-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Трв 28 2024 р., 21:29
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `theaterdb`
--

-- --------------------------------------------------------

--
-- Структура таблиці `actors`
--

CREATE TABLE `actors` (
  `Actor_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Vocal_Data` varchar(45) NOT NULL,
  `Actor_Height` decimal(5,2) NOT NULL,
  `Actor_Awards` varchar(100) NOT NULL,
  `Actor_IsStudent` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `actors`
--

INSERT INTO `actors` (`Actor_ID`, `Emp_ID`, `Vocal_Data`, `Actor_Height`, `Actor_Awards`, `Actor_IsStudent`) VALUES
(1, 1, 'Baritone', 180.50, 'Best Actor 2019', 0),
(2, 2, 'Soprano', 165.00, 'Best Newcomer 2020', 1),
(3, 3, 'Soprano', 170.20, 'Best Actress 2018', 1),
(4, 4, 'Tenor', 175.00, 'Lifetime Achievement 2017', 0),
(5, 5, 'Contralto', 168.30, 'Best Supporting Actress 2016', 0),
(6, 19, 'Baritone', 188.20, 'Best Actor 2021', 0);

--
-- Тригери `actors`
--
DELIMITER $$
CREATE TRIGGER `DeleteActor` AFTER DELETE ON `actors` FOR EACH ROW BEGIN
   DELETE FROM Cast WHERE Actor_ID=OLD.Actor_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `authors`
--

CREATE TABLE `authors` (
  `Author_ID` int(11) NOT NULL,
  `Author_Name` varchar(45) NOT NULL,
  `Author_Country` varchar(45) NOT NULL,
  `Author_BirthCentury` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `authors`
--

INSERT INTO `authors` (`Author_ID`, `Author_Name`, `Author_Country`, `Author_BirthCentury`) VALUES
(1, 'William Shakespeare', 'England', 16),
(2, 'Georges Bizet', 'France', 18),
(3, 'Richard Brinsley', 'England', 19);

-- --------------------------------------------------------

--
-- Структура таблиці `cast`
--

CREATE TABLE `cast` (
  `Role_ID` int(11) NOT NULL,
  `Actor_ID` int(11) NOT NULL,
  `Role_Acceptance` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `cast`
--

INSERT INTO `cast` (`Role_ID`, `Actor_ID`, `Role_Acceptance`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 4, 1),
(4, 3, 1),
(5, 6, 1),
(6, 3, 1),
(7, 1, 1),
(8, 5, 1),
(9, 2, 1),
(10, 4, 1),
(11, 1, 1),
(12, 3, 1),
(13, 6, 1),
(14, 4, 1),
(15, 1, 1),
(16, 2, 1),
(17, 3, 1),
(18, 4, 1),
(19, 6, 1),
(20, 4, 1),
(21, 2, 1),
(22, 6, 1),
(23, 5, 1),
(24, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `directors`
--

CREATE TABLE `directors` (
  `Director_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Specialization` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `directors`
--

INSERT INTO `directors` (`Director_ID`, `Emp_ID`, `Specialization`) VALUES
(1, 10, 'Music Director'),
(2, 11, 'Art Designer'),
(3, 12, 'Set Director'),
(4, 13, 'Script Writer');

--
-- Тригери `directors`
--
DELIMITER $$
CREATE TRIGGER `DeleteDirector` AFTER DELETE ON `directors` FOR EACH ROW BEGIN
   DELETE FROM Performances WHERE Director_ID=OLD.Director_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `employees`
--

CREATE TABLE `employees` (
  `Emp_ID` int(11) NOT NULL,
  `Emp_Name` varchar(45) NOT NULL,
  `Emp_DoB` date NOT NULL,
  `Emp_Position` varchar(45) NOT NULL,
  `Emp_Gender` varchar(45) NOT NULL,
  `Emp_Salary` decimal(10,0) NOT NULL,
  `Emp_IsOnTour` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `employees`
--

INSERT INTO `employees` (`Emp_ID`, `Emp_Name`, `Emp_DoB`, `Emp_Position`, `Emp_Gender`, `Emp_Salary`, `Emp_IsOnTour`) VALUES
(1, 'John Doe', '1980-05-15', 'Actor', 'Male', 50000, 0),
(2, 'Jane Smith', '1985-08-25', 'Actor', 'Female', 52000, 1),
(3, 'Dakota Johnson', '1990-11-05', 'Actor', 'Female', 68000, 0),
(4, 'Bob Brown', '1975-12-20', 'Actor', 'Male', 53000, 0),
(5, 'Clara White', '1983-03-17', 'Actor', 'Female', 51000, 0),
(6, 'Michael Black', '1978-09-10', 'Musician', 'Male', 55000, 0),
(7, 'Nancy Green', '1988-07-22', 'Musician', 'Female', 50000, 1),
(8, 'Hanz Zimmer', '1982-02-14', 'Musician', 'Male', 53000, 0),
(9, 'Linda Ambers', '1991-06-30', 'Musician', 'Female', 52000, 1),
(10, 'Thomas Gray', '1969-01-25', 'Director', 'Male', 60000, 0),
(11, 'Sarah Lane', '1984-11-15', 'Director', 'Female', 58000, 0),
(12, 'Michael Bay', '1972-04-05', 'Director', 'Male', 59000, 1),
(13, 'Anna Orange', '1993-08-19', 'Director', 'Female', 54000, 0),
(14, 'Richard Silveo', '1977-03-14', 'OtherStaff', 'Male', 45000, 0),
(15, 'Patricia Gold', '1986-12-02', 'OtherStaff', 'Female', 46000, 0),
(16, 'Charles Bronson', '1981-07-08', 'OtherStaff', 'Male', 47000, 0),
(17, 'Laura Plateau', '1989-05-29', 'OtherStaff', 'Female', 44000, 0),
(18, 'Saul Goodman', '1995-10-17', 'OtherStaff', 'Male', 42000, 0),
(19, 'Ben Affleck', '1996-11-14', 'Actor', 'Male', 56000, 0),
(22, 'Jesse Pinkman', '1997-11-03', 'OtherStaff', 'Male', 56000, 0);

--
-- Тригери `employees`
--
DELIMITER $$
CREATE TRIGGER `DeleteEmpAndTour` AFTER DELETE ON `employees` FOR EACH ROW BEGIN
    DELETE FROM Tour WHERE Emp_ID=OLD.Emp_ID;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DeleteEmps` AFTER DELETE ON `employees` FOR EACH ROW BEGIN
    DECLARE position VARCHAR(45);
    SET position = (SELECT Emp_Position FROM Employees WHERE Emp_ID = OLD.Emp_ID);

    IF position = 'Actor' THEN
        DELETE FROM Actors WHERE Emp_ID = OLD.Emp_ID;
    ELSEIF position = 'Musician' THEN
        DELETE FROM Musicians WHERE Emp_ID = OLD.Emp_ID;
    ELSEIF position = 'Director' THEN
        DELETE FROM Directors WHERE Emp_ID = OLD.Emp_ID;
    ELSEIF position = 'OtherStaff' THEN
        DELETE FROM OtherStaff WHERE Emp_ID = OLD.Emp_ID;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `musicians`
--

CREATE TABLE `musicians` (
  `Musician_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Musician_Instrument` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `musicians`
--

INSERT INTO `musicians` (`Musician_ID`, `Emp_ID`, `Musician_Instrument`) VALUES
(1, 6, 'Violin'),
(2, 7, 'Piano'),
(3, 8, 'Saxophone'),
(4, 9, 'Flute');

-- --------------------------------------------------------

--
-- Структура таблиці `otherstaff`
--

CREATE TABLE `otherstaff` (
  `Staff_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Department` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `otherstaff`
--

INSERT INTO `otherstaff` (`Staff_ID`, `Emp_ID`, `Department`) VALUES
(1, 14, 'Technical'),
(2, 15, 'Administration'),
(3, 16, 'Management'),
(4, 17, 'Cleaning'),
(5, 18, 'Security'),
(6, 22, 'Advertisement');

-- --------------------------------------------------------

--
-- Структура таблиці `performances`
--

CREATE TABLE `performances` (
  `Performance_ID` int(11) NOT NULL,
  `Play_ID` int(11) NOT NULL,
  `Director_ID` int(11) NOT NULL,
  `Performance_Date` date NOT NULL,
  `Performance_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `performances`
--

INSERT INTO `performances` (`Performance_ID`, `Play_ID`, `Director_ID`, `Performance_Date`, `Performance_Time`) VALUES
(1, 1, 4, '2020-10-10', '12:00:00'),
(2, 1, 2, '2020-10-12', '12:00:00'),
(3, 1, 2, '2020-10-13', '14:00:00'),
(4, 2, 4, '2021-05-01', '10:25:00'),
(5, 2, 1, '2021-05-04', '10:25:00'),
(6, 2, 1, '2021-05-05', '11:00:00'),
(7, 3, 4, '2021-07-15', '12:00:00'),
(8, 3, 3, '2021-07-17', '12:00:00'),
(9, 3, 3, '2021-07-18', '12:00:00'),
(10, 4, 4, '2021-11-20', '11:00:00'),
(11, 4, 1, '2021-11-21', '14:00:00'),
(12, 5, 4, '2022-03-05', '10:25:00'),
(13, 5, 1, '2022-03-06', '11:00:00');

--
-- Тригери `performances`
--
DELIMITER $$
CREATE TRIGGER `Add9TicketsForPerf` AFTER INSERT ON `performances` FOR EACH ROW BEGIN
    -- Додати квитки для нової вистави
    INSERT INTO Tickets (Performance_ID, Seat_Number, Ticket_Price, Ticket_IsSold, Ticket_IsSubscription)
    VALUES (NEW.Performance_ID, 11, 200.00, 0, 0),
           (NEW.Performance_ID, 12, 200.00, 0, 0),
           (NEW.Performance_ID, 13, 200.00, 0, 0),
           (NEW.Performance_ID, 21, 150.00, 0, 0),
           (NEW.Performance_ID, 22, 150.00, 0, 0),
           (NEW.Performance_ID, 23, 150.00, 0, 0),
           (NEW.Performance_ID, 31, 100.00, 0, 0),
           (NEW.Performance_ID, 32, 100.00, 0, 0),
           (NEW.Performance_ID, 33, 100.00, 0, 0);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Delete9TicketsForPerf` BEFORE DELETE ON `performances` FOR EACH ROW BEGIN
    DELETE FROM Tickets WHERE Performance_ID = OLD.Performance_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `playauthors`
--

CREATE TABLE `playauthors` (
  `PlayID` int(11) NOT NULL,
  `Author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `playauthors`
--

INSERT INTO `playauthors` (`PlayID`, `Author_ID`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `plays`
--

CREATE TABLE `plays` (
  `Play_ID` int(11) NOT NULL,
  `Play_Title` varchar(45) NOT NULL,
  `Play_Genre` varchar(45) NOT NULL,
  `Play_IsForKids` tinyint(4) DEFAULT NULL,
  `Play_PremiereDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `plays`
--

INSERT INTO `plays` (`Play_ID`, `Play_Title`, `Play_Genre`, `Play_IsForKids`, `Play_PremiereDate`) VALUES
(1, 'Romeo and Juliette', 'Tragedy', 0, '2020-10-10'),
(2, 'Carmen', 'Opera', 0, '2021-05-01'),
(3, 'A Midsummer Night’s Dream', 'Comedy', 1, '2021-07-15'),
(4, 'School for Scandal', 'Comedy', 0, '2021-11-20'),
(5, 'King Lear', 'Tragedy', 0, '2022-03-05');

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` varchar(45) NOT NULL,
  `Play_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`Role_ID`, `Role_Name`, `Play_ID`) VALUES
(1, 'Romeo', 1),
(2, 'Juliette', 1),
(3, 'Mercutio', 1),
(4, 'Tybalt', 1),
(5, 'Paris', 1),
(6, 'Carmen', 2),
(7, 'Escamillo', 2),
(8, 'Michaela', 2),
(9, 'Zuniga', 2),
(10, 'Dancairo', 2),
(11, 'Theseus', 3),
(12, 'Hippolita', 3),
(13, 'Oberon', 3),
(14, 'Lysander', 3),
(15, 'Peter Teazle', 4),
(16, 'Lady Teazle', 4),
(17, 'Maria', 4),
(18, 'Snake', 4),
(19, 'Rowley', 4),
(20, 'King Lear', 5),
(21, 'Cordelia', 5),
(22, 'Goneril', 5),
(23, 'Regan', 5),
(24, 'Oswald', 5);

-- --------------------------------------------------------

--
-- Структура таблиці `subscriptions`
--

CREATE TABLE `subscriptions` (
  `Subscription_ID` int(11) NOT NULL,
  `Subscription_Name` varchar(45) NOT NULL,
  `Subscription_Genre` varchar(45) NOT NULL,
  `Author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `subscriptions`
--

INSERT INTO `subscriptions` (`Subscription_ID`, `Subscription_Name`, `Subscription_Genre`, `Author_ID`) VALUES
(1, 'Shakespeare(Tragedy pass)', 'Tragedy', 1),
(2, 'Shakespeare(Comedy pass)', 'Comedy', 1),
(3, 'Georges Bizet(Opera pass)', 'Opera', 2),
(4, 'Richard Brinsley(Comedy pass)', 'Comedy', 3);

-- --------------------------------------------------------

--
-- Структура таблиці `tickets`
--

CREATE TABLE `tickets` (
  `Ticket_ID` int(11) NOT NULL,
  `Performance_ID` int(11) NOT NULL,
  `Seat_Number` int(11) NOT NULL,
  `Ticket_Price` decimal(10,0) NOT NULL,
  `Ticket_IsSold` tinyint(4) DEFAULT NULL,
  `Ticket_IsSubscription` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `tickets`
--

INSERT INTO `tickets` (`Ticket_ID`, `Performance_ID`, `Seat_Number`, `Ticket_Price`, `Ticket_IsSold`, `Ticket_IsSubscription`) VALUES
(1, 1, 11, 200, 1, 1),
(2, 1, 21, 150, 1, 0),
(3, 1, 31, 100, 0, 1),
(4, 4, 12, 200, 1, 1),
(5, 4, 22, 150, 1, 1),
(6, 4, 32, 100, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `tour`
--

CREATE TABLE `tour` (
  `Tour_ID` int(11) NOT NULL,
  `Emp_ID` int(11) NOT NULL,
  `Tour_StartDate` date NOT NULL,
  `Tour_EndDate` date NOT NULL,
  `Tour_Location` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп даних таблиці `tour`
--

INSERT INTO `tour` (`Tour_ID`, `Emp_ID`, `Tour_StartDate`, `Tour_EndDate`, `Tour_Location`) VALUES
(1, 2, '2022-04-11', '2022-04-21', 'Spain'),
(2, 7, '2022-05-12', '2022-05-22', 'Brazil'),
(3, 9, '2022-05-10', '2022-05-21', 'Argentina'),
(4, 12, '2022-04-01', '2022-04-11', 'France');

--
-- Тригери `tour`
--
DELIMITER $$
CREATE TRIGGER `UpdTourStatusOn0` AFTER DELETE ON `tour` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM Employees WHERE Emp_ID = OLD.Emp_ID) THEN
        UPDATE Employees
        SET Emp_IsOnTour = 0
        WHERE Emp_ID = OLD.Emp_ID;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateTourStatusOn1` AFTER INSERT ON `tour` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM Employees WHERE Emp_ID = NEW.Emp_ID) THEN
        UPDATE Employees
        SET Emp_IsOnTour = 1
        WHERE Emp_ID = NEW.Emp_ID;
    END IF;
END
$$
DELIMITER ;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`Actor_ID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`);

--
-- Індекси таблиці `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`Author_ID`);

--
-- Індекси таблиці `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`Role_ID`,`Actor_ID`),
  ADD KEY `Actor_ID_idx` (`Actor_ID`);

--
-- Індекси таблиці `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`Director_ID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`);

--
-- Індекси таблиці `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`Emp_ID`);

--
-- Індекси таблиці `musicians`
--
ALTER TABLE `musicians`
  ADD PRIMARY KEY (`Musician_ID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`);

--
-- Індекси таблиці `otherstaff`
--
ALTER TABLE `otherstaff`
  ADD PRIMARY KEY (`Staff_ID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`);

--
-- Індекси таблиці `performances`
--
ALTER TABLE `performances`
  ADD PRIMARY KEY (`Performance_ID`),
  ADD KEY `Play_ID_idx` (`Play_ID`),
  ADD KEY `Director_ID_idx` (`Director_ID`);

--
-- Індекси таблиці `playauthors`
--
ALTER TABLE `playauthors`
  ADD PRIMARY KEY (`PlayID`,`Author_ID`),
  ADD KEY `Author_ID_idx` (`Author_ID`);

--
-- Індекси таблиці `plays`
--
ALTER TABLE `plays`
  ADD PRIMARY KEY (`Play_ID`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Role_ID`),
  ADD KEY `Play_ID_idx` (`Play_ID`);

--
-- Індекси таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`Subscription_ID`),
  ADD KEY `Author_ID_idx` (`Author_ID`);

--
-- Індекси таблиці `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `Performance_ID_idx` (`Performance_ID`);

--
-- Індекси таблиці `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`Tour_ID`),
  ADD KEY `Emp_ID_idx` (`Emp_ID`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `actors`
--
ALTER TABLE `actors`
  MODIFY `Actor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `authors`
--
ALTER TABLE `authors`
  MODIFY `Author_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `directors`
--
ALTER TABLE `directors`
  MODIFY `Director_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `employees`
--
ALTER TABLE `employees`
  MODIFY `Emp_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблиці `musicians`
--
ALTER TABLE `musicians`
  MODIFY `Musician_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `otherstaff`
--
ALTER TABLE `otherstaff`
  MODIFY `Staff_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблиці `performances`
--
ALTER TABLE `performances`
  MODIFY `Performance_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `plays`
--
ALTER TABLE `plays`
  MODIFY `Play_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `Role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `Subscription_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `tickets`
--
ALTER TABLE `tickets`
  MODIFY `Ticket_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблиці `tour`
--
ALTER TABLE `tour`
  MODIFY `Tour_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `actors`
--
ALTER TABLE `actors`
  ADD CONSTRAINT `fk_actors_employees` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`Emp_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `cast`
--
ALTER TABLE `cast`
  ADD CONSTRAINT `fk_cast_actors` FOREIGN KEY (`Actor_ID`) REFERENCES `actors` (`Actor_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cast_roles` FOREIGN KEY (`Role_ID`) REFERENCES `roles` (`Role_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `directors`
--
ALTER TABLE `directors`
  ADD CONSTRAINT `fk_directors_employees` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`Emp_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `musicians`
--
ALTER TABLE `musicians`
  ADD CONSTRAINT `fk_musicians_employees` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`Emp_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `otherstaff`
--
ALTER TABLE `otherstaff`
  ADD CONSTRAINT `fk_otherstaff_employees` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`Emp_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `fk_performances_directors` FOREIGN KEY (`Director_ID`) REFERENCES `directors` (`Director_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_performances_plays` FOREIGN KEY (`Play_ID`) REFERENCES `plays` (`Play_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `playauthors`
--
ALTER TABLE `playauthors`
  ADD CONSTRAINT `fk_playauthors_authors` FOREIGN KEY (`Author_ID`) REFERENCES `authors` (`Author_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_playauthors_plays` FOREIGN KEY (`PlayID`) REFERENCES `plays` (`Play_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `fk_roles_plays` FOREIGN KEY (`Play_ID`) REFERENCES `plays` (`Play_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `fk_subscriptions_authors` FOREIGN KEY (`Author_ID`) REFERENCES `authors` (`Author_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_tickets_performances` FOREIGN KEY (`Performance_ID`) REFERENCES `performances` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `tour`
--
ALTER TABLE `tour`
  ADD CONSTRAINT `fk_tour_employees` FOREIGN KEY (`Emp_ID`) REFERENCES `employees` (`Emp_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
