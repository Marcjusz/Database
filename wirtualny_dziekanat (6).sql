-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Cze 2016, 15:57
-- Wersja serwera: 10.1.10-MariaDB
-- Wersja PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wirtualny dziekanat`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ocenakońcowa`
--

CREATE TABLE `ocenakońcowa` (
  `Wartość` float(1,1) NOT NULL,
  `DataWystawienia` date NOT NULL,
  `NumerAlbumu` int(6) NOT NULL,
  `ID_Przedmiotu` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `prowadzący`
--

CREATE TABLE `prowadzący` (
  `ID_Prowadzacego` int(6) NOT NULL,
  `Nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Imię` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Tytuł` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `prowadzący`
--

INSERT INTO `prowadzący` (`ID_Prowadzacego`, `Nazwisko`, `Imię`, `Tytuł`) VALUES
(287117, 'Maleńczuk ', 'Marek', 'mgr inż.'),
(323111, 'Skiba', 'Krzysztof', 'mgr inż.'),
(337974, 'Piaseczny', 'Andrzej', 'mgr'),
(436222, 'Kowalski', 'Sławomir', 'dr inż.'),
(547892, 'Podsiadło', 'Dawid', 'dr hab. inż.'),
(562917, 'Rabczewska', 'Dorota', 'prof. dr hab. inż.'),
(666865, 'Krawczyk', 'Krzysztof', 'dr hab. inż.'),
(753868, 'Rodowicz', 'Maryla', 'dr inż.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmiot`
--

CREATE TABLE `przedmiot` (
  `ID_Przedmiotu` int(6) NOT NULL,
  `Nazwa` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `ECTS` int(2) NOT NULL,
  `SposóbZaliczenia` enum('Egzamin','Zaliczenie','','') COLLATE utf8_polish_ci NOT NULL,
  `Semestr` int(1) NOT NULL,
  `ID_TypuPrzedmiotu` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `przedmiot`
--

INSERT INTO `przedmiot` (`ID_Przedmiotu`, `Nazwa`, `ECTS`, `SposóbZaliczenia`, `Semestr`, `ID_TypuPrzedmiotu`) VALUES
(222000, 'Wychowanie Fizyczne', 2, 'Zaliczenie', 1, 111000),
(222001, 'Wychowanie Fizyczne', 2, 'Zaliczenie', 2, 111000),
(222002, 'Język Angielski', 4, 'Zaliczenie', 1, 111000),
(222003, 'Język Angielski', 4, 'Zaliczenie', 2, 111000),
(222004, 'Język Angielski', 4, 'Zaliczenie', 3, 111000),
(222005, 'Łacina', 5, 'Egzamin', 4, 111001),
(222006, 'Muzyczny Kanon Informatyka', 1, 'Egzamin', 7, 111002),
(222007, 'Matematyka Dyskretna', 8, 'Egzamin', 4, 111002),
(222008, 'Sieci Komputerowe', 6, 'Egzamin', 5, 111004),
(222009, 'Plastyka', 4, 'Egzamin', 6, 111003),
(222010, 'Architektura Systemów Komputerowych ', 1, 'Zaliczenie', 4, 111005),
(222011, 'Matematyka Niedyskretna i Hazard', 4, 'Egzamin', 3, 111001);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `student`
--

CREATE TABLE `student` (
  `NumerAlbumu` int(6) NOT NULL,
  `PESEL` int(11) NOT NULL,
  `Imię` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `Nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `Kierunek` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `Status` enum('zawieszony','skreślony','studiuje','dług kredytowy','urlop') COLLATE utf8_polish_ci NOT NULL,
  `Grupa` varchar(3) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typprzedmiotu`
--

CREATE TABLE `typprzedmiotu` (
  `ID_TypuPrzedmiotu` int(6) NOT NULL,
  `NazwaTypu` enum('Obieralny','Podstawowy','Kierunkowy','') COLLATE utf8_polish_ci NOT NULL,
  `IlośćGodzin` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `typprzedmiotu`
--

INSERT INTO `typprzedmiotu` (`ID_TypuPrzedmiotu`, `NazwaTypu`, `IlośćGodzin`) VALUES
(111000, 'Podstawowy', 30),
(111001, 'Podstawowy', 45),
(111002, 'Kierunkowy', 60),
(111003, 'Obieralny', 120),
(111004, 'Obieralny', 150),
(111005, 'Kierunkowy', 90);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typzajęć`
--

CREATE TABLE `typzajęć` (
  `ID_TypuZajęć` int(6) NOT NULL,
  `NazwaTypuZajęć` enum('Laboratorium','Projekt','Wykład','Ćwiczenia') COLLATE utf8_polish_ci NOT NULL,
  `IlośćGodzin` int(3) NOT NULL,
  `MaxLiczbaMiejsc` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `typzajęć`
--

INSERT INTO `typzajęć` (`ID_TypuZajęć`, `NazwaTypuZajęć`, `IlośćGodzin`, `MaxLiczbaMiejsc`) VALUES
(333000, 'Laboratorium', 30, 15),
(333001, 'Laboratorium', 15, 30),
(333002, 'Laboratorium', 30, 30),
(333003, 'Projekt', 45, 20),
(333004, 'Wykład', 30, 120),
(333005, 'Wykład', 45, 240),
(333006, 'Ćwiczenia', 15, 30),
(333007, 'Ćwiczenia', 30, 15);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zajęcia`
--

CREATE TABLE `zajęcia` (
  `ID_Zajęć` int(6) NOT NULL,
  `Godzina` time NOT NULL,
  `NumerSali` varchar(5) COLLATE utf8_polish_ci NOT NULL,
  `DzieńTygodnia` enum('pon','wt','śr','czw','pt','sob','nd') COLLATE utf8_polish_ci NOT NULL,
  `ID_TypuZajęć` int(6) NOT NULL,
  `ID_Prowadzącego` int(6) NOT NULL,
  `ID_Przedmiotu` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zajęcia`
--

INSERT INTO `zajęcia` (`ID_Zajęć`, `Godzina`, `NumerSali`, `DzieńTygodnia`, `ID_TypuZajęć`, `ID_Prowadzącego`, `ID_Przedmiotu`) VALUES
(444001, '07:15:00', '12', 'pon', 333006, 287117, 222000),
(444002, '07:15:00', '6', 'wt', 333006, 323111, 222000),
(444003, '07:30:00', '12', 'pt', 333006, 287117, 222001),
(444004, '09:15:00', '5', 'pt', 333006, 323111, 222001),
(444005, '11:00:00', '301', 'pon', 333007, 337974, 222002),
(444006, '16:15:00', '112', 'pon', 333007, 337974, 222003),
(444007, '18:00:00', '908', 'śr', 333007, 337974, 222004),
(444008, '11:00:00', '404', 'śr', 333006, 436222, 222005),
(444009, '16:15:00', '3c', 'czw', 333004, 436222, 222005),
(444010, '14:30:00', '3c', 'czw', 333005, 547892, 222006),
(444011, '12:45:00', '13', 'czw', 333001, 547892, 222006),
(444012, '19:45:00', '401', 'śr', 333002, 562917, 222007),
(444013, '18:00:00', '505a', 'śr', 333007, 753868, 222007),
(444014, '16:15:00', '404a', 'śr', 333003, 666865, 222008),
(444015, '09:15:00', '13', 'pon', 333001, 436222, 222008),
(444016, '12:45:00', '101a', 'pon', 333000, 323111, 222008),
(444017, '12:45:00', '2', 'pon', 333007, 547892, 222008),
(444018, '18:00:00', '908b', 'pon', 333004, 287117, 222008),
(444019, '19:45:00', '12', 'pon', 333005, 287117, 222009),
(444020, '09:15:00', '303d', 'wt', 333003, 323111, 222009),
(444021, '11:00:00', '13', 'wt', 333000, 436222, 222009),
(444022, '12:45:00', '13b', 'wt', 333002, 337974, 222010),
(444023, '14:30:00', '13', 'wt', 333000, 436222, 222010),
(444024, '16:15:00', '103', 'wt', 333007, 547892, 222010),
(444025, '19:45:00', '11', 'wt', 333001, 436222, 222011),
(444046, '09:15:00', '202', 'pon', 333007, 666865, 222011);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zajęciastudenta`
--

CREATE TABLE `zajęciastudenta` (
  `NumerAlbumu` int(6) NOT NULL,
  `ID_Zajęć` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `ocenakońcowa`
--
ALTER TABLE `ocenakońcowa`
  ADD KEY `NumerAlbumu` (`NumerAlbumu`),
  ADD KEY `ID_Przedmiotu` (`ID_Przedmiotu`);

--
-- Indexes for table `prowadzący`
--
ALTER TABLE `prowadzący`
  ADD PRIMARY KEY (`ID_Prowadzacego`);

--
-- Indexes for table `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD PRIMARY KEY (`ID_Przedmiotu`),
  ADD KEY `ID_TypuPrzedmiotu` (`ID_TypuPrzedmiotu`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`NumerAlbumu`);

--
-- Indexes for table `typprzedmiotu`
--
ALTER TABLE `typprzedmiotu`
  ADD PRIMARY KEY (`ID_TypuPrzedmiotu`);

--
-- Indexes for table `typzajęć`
--
ALTER TABLE `typzajęć`
  ADD PRIMARY KEY (`ID_TypuZajęć`);

--
-- Indexes for table `zajęcia`
--
ALTER TABLE `zajęcia`
  ADD PRIMARY KEY (`ID_Zajęć`),
  ADD KEY `ID_TypuZajęć` (`ID_TypuZajęć`),
  ADD KEY `ID_Prowadzącego` (`ID_Prowadzącego`),
  ADD KEY `ID_Przedmiotu` (`ID_Przedmiotu`);

--
-- Indexes for table `zajęciastudenta`
--
ALTER TABLE `zajęciastudenta`
  ADD KEY `ID_Zajęć` (`ID_Zajęć`),
  ADD KEY `NumerAlbumu` (`NumerAlbumu`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `ocenakońcowa`
--
ALTER TABLE `ocenakońcowa`
  ADD CONSTRAINT `ocenakońcowa_ibfk_1` FOREIGN KEY (`NumerAlbumu`) REFERENCES `student` (`NumerAlbumu`),
  ADD CONSTRAINT `ocenakońcowa_ibfk_2` FOREIGN KEY (`ID_Przedmiotu`) REFERENCES `przedmiot` (`ID_Przedmiotu`);

--
-- Ograniczenia dla tabeli `przedmiot`
--
ALTER TABLE `przedmiot`
  ADD CONSTRAINT `przedmiot_ibfk_1` FOREIGN KEY (`ID_TypuPrzedmiotu`) REFERENCES `typprzedmiotu` (`ID_TypuPrzedmiotu`);

--
-- Ograniczenia dla tabeli `zajęcia`
--
ALTER TABLE `zajęcia`
  ADD CONSTRAINT `zajęcia_ibfk_1` FOREIGN KEY (`ID_Prowadzącego`) REFERENCES `prowadzący` (`ID_Prowadzacego`),
  ADD CONSTRAINT `zajęcia_ibfk_2` FOREIGN KEY (`ID_TypuZajęć`) REFERENCES `typzajęć` (`ID_TypuZajęć`),
  ADD CONSTRAINT `zajęcia_ibfk_3` FOREIGN KEY (`ID_Przedmiotu`) REFERENCES `przedmiot` (`ID_Przedmiotu`);

--
-- Ograniczenia dla tabeli `zajęciastudenta`
--
ALTER TABLE `zajęciastudenta`
  ADD CONSTRAINT `zajęciastudenta_ibfk_1` FOREIGN KEY (`NumerAlbumu`) REFERENCES `student` (`NumerAlbumu`),
  ADD CONSTRAINT `zajęciastudenta_ibfk_2` FOREIGN KEY (`ID_Zajęć`) REFERENCES `zajęcia` (`ID_Zajęć`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
