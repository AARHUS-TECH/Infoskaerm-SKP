-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Vært: localhost:3306
-- Genereringstid: 08. 12 2021 kl. 12:37:30
-- Serverversion: 10.3.31-MariaDB-0+deb10u1
-- PHP-version: 7.3.31-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infoscreendb`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `news`
--

CREATE TABLE `news` (
  `ID` int(11) NOT NULL,
  `Header` varchar(300) NOT NULL,
  `Body` varchar(24000) DEFAULT NULL,
  `Startdate` date DEFAULT NULL,
  `Enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Data dump for tabellen `news`
--

INSERT INTO `news` (`ID`, `Header`, `Body`, `Startdate`, `Enddate`) VALUES
(1, 'Påskeferien er lige om hjørnet', 'Vi vil gerne benytte lejligheden til at ønske Jer alle en god og velfortjent påskeferie. Håber I får tid til at nyde det forhåbentlige gode vejr sammen med familie og venner.', '2022-04-07', '2022-04-18');
(2, 'Farvel til hovedforløbs eleverne', 'Herfra skal der lyde et farvel til de elever som skal starte på Hoverforløb efter påske. Vi har en del som starter på HF efter påske så held og lykke og få nu det allermeste ud af jeres undervisning', '2022-04-07', '2022-04-18');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Fornavn` varchar(14) NOT NULL,
  `mellemnavn` varchar(24) DEFAULT NULL,
  `Efternavn` varchar(15) NOT NULL,
  `status` varchar(9) NOT NULL,
  `password` varchar(6) DEFAULT NULL,
  `birthday` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`Id`, `Fornavn`, `mellemnavn`, `Efternavn`, `status`, `password`, `birthday`) VALUES
(0, 'skodatait', '', '', 'superuser', 'FWh51UnBmjTH', NULL),
(1, 'Simon', '', '', 'superuser', NULL, NULL),
(2, 'Abdel-Rahman', 'Mohammad', 'Issa', 'user', NULL, NULL),
(3, 'Abdullah', NULL, 'Abbas', 'user', NULL, NULL),
(4, 'Abdullah', 'Mohamad', 'Ali', 'user', NULL, NULL),
(5, 'Ahmad', NULL, 'Ibrahim', 'user', NULL, NULL),
(6, 'Alex', NULL, 'Møller', 'user', NULL, NULL),
(7, 'Alexander', 'Due', 'Jepsen', 'user', NULL, NULL),
(8, 'Anders', NULL, 'Thau', 'user', NULL, NULL),
(9, 'Andreas', 'Bech', 'Hansen', 'user', NULL, NULL),
(10, 'Andreas', 'Loft', 'Nørgård', 'user', NULL, NULL),
(11, 'Ayman', NULL, 'Amche', 'user', NULL, NULL),
(12, 'Bastian', NULL, 'Johansen', 'superuser', '050804', NULL),
(13, 'Bjarke', 'Welander', 'Hald', 'user', NULL, NULL),
(14, 'Bjørn', 'Svane', 'Magnus', 'user', NULL, NULL),
(15, 'Casper', NULL, 'Nielsen', 'user', NULL, NULL),
(16, 'Cedar', 'Benjamin Weed', 'Hansen', 'user', NULL, NULL),
(17, 'Christoffer', 'Juul', 'Mortensen', 'user', NULL, NULL),
(18, 'Dalil', 'Faeq', 'Abdal', 'user', NULL, NULL),
(19, 'Deniz', NULL, 'Tecer', 'user', NULL, NULL),
(20, 'Dennis', 'Cornett', 'Hansen', 'user', NULL, NULL),
(21, 'Emil', 'Alexander Rauff', 'Kastrup', 'user', NULL, NULL),
(22, 'Emil', NULL, 'Qvistgaard', 'user', NULL, NULL),
(23, 'Eray', NULL, 'Tecer', 'superuser', '290703', NULL),
(24, 'Esben', 'Stenger', 'Jacobsen', 'user', NULL, NULL),
(25, 'Frank', 'Møller', 'Jensen', 'user', NULL, NULL),
(26, 'Frederik', 'Emil', 'Hartvigsen', 'user', NULL, NULL),
(27, 'Gustav', 'Dyrmose', 'Angelo', 'user', NULL, NULL),
(28, 'Gustav', 'Kjær', 'Nielsen', 'user', NULL, NULL),
(29, 'Hakan', NULL, 'Sahin', 'user', NULL, NULL),
(30, 'Hariraj', NULL, 'Gajendran', 'user', NULL, NULL),
(31, 'Henrik', 'Bojsen', 'Nehm', 'user', NULL, NULL),
(32, 'Jacob', 'Kaae', 'Jørgensen', 'user', NULL, NULL),
(33, 'Jacob', 'Aagaard Farcinsen', 'Leth', 'user', NULL, NULL),
(34, 'Jakob', 'Hubert', 'Hvid', 'user', NULL, NULL),
(35, 'Janni', 'Maria', 'Barstad', 'user', NULL, NULL),
(36, 'Jesper', 'Sloth', 'Nielsen', 'user', NULL, NULL),
(37, 'Jonas', 'Bålow', 'Schou', 'user', NULL, NULL),
(38, 'Jonas', 'Wagner', 'Langmaack', 'user', NULL, NULL),
(39, 'Kasper', 'Anholm', 'Salomonsen', 'user', NULL, NULL),
(40, 'Kasper', NULL, 'Kammer', 'superuser', '080502', NULL),
(41, 'Kasper', 'Plass', 'Jensen', 'user', NULL, NULL),
(42, 'Lasse', 'Emil', 'Jensen', 'user', NULL, NULL),
(43, 'Laurits', 'Anders Flinck', 'Hansen', 'user', NULL, NULL),
(44, 'Magne', 'Bjørn', 'Pedersen', 'user', NULL, NULL),
(45, 'Magnus', 'Frederik', 'Nicolajsen', 'user', NULL, NULL),
(46, 'Magnus', 'Frydensbjerg', 'Bodenhoff', 'user', NULL, NULL),
(47, 'Malte', 'Glob', 'Ketscher', 'user', NULL, NULL),
(48, 'Malte', 'Marcus', 'Fønsbo', 'user', NULL, NULL),
(49, 'Marcus', 'Weje', 'Kristiansen', 'user', NULL, NULL),
(50, 'Mario', NULL, 'Yordanov', 'user', NULL, NULL),
(51, 'Martin', 'Mandrup', 'Gaarskjær', 'user', NULL, NULL),
(52, 'Martin', 'Spangsberg', 'Nielsen', 'user', NULL, NULL),
(53, 'Mathias', 'Astrup', 'Thorup', 'user', NULL, NULL),
(54, 'Mathias', 'Ellegaard', 'Østergaard', 'user', NULL, NULL),
(55, 'Mehmet', 'Samet', 'Erbas', 'user', NULL, NULL),
(56, 'Miklas', NULL, 'Rommedal', 'user', NULL, NULL),
(57, 'Mohammad', NULL, 'Ahmad', 'user', NULL, NULL),
(58, 'Morten', NULL, 'Bak-Christensen', 'user', NULL, NULL),
(59, 'Murat', NULL, 'Tecer', 'user', NULL, NULL),
(60, 'Nicholas', 'George', 'Kyriacou', 'user', NULL, NULL),
(61, 'Nicolai', 'Ekkelund', 'Pedersen', 'user', NULL, NULL),
(62, 'Niklas', 'Emil Soares de A ', 'Bjoerkaer', 'user', NULL, NULL),
(63, 'Nikolaj', NULL, 'Ringgaard', 'user', NULL, NULL),
(64, 'Oskar', 'Martin', 'Have', 'user', NULL, NULL),
(65, 'Philip', 'Fay', 'Svendsen', 'user', NULL, NULL),
(66, 'Priyanka', NULL, 'Srivastava', 'user', NULL, NULL),
(67, 'Rasmus', 'Damsgaard', 'Andersen', 'user', NULL, NULL),
(68, 'Rasmus', 'Høllund', 'Kristensen', 'superuser', '230204', NULL),
(69, 'Rico', 'Sikem', 'Carlsson', 'user', NULL, NULL),
(70, 'Samuel', 'Ghebrehiwet', 'Gebremichael', 'user', NULL, NULL),
(71, 'Sebastian', 'Skovbo', 'Clausen', 'user', NULL, NULL),
(72, 'Silas', 'Patrick', 'Højgård', 'user', NULL, NULL),
(73, 'Simon', 'Emil', 'Ovesen', 'user', NULL, NULL),
(74, 'Simon', 'Juel', 'Erichsen', 'user', NULL, NULL),
(75, 'Simon', NULL, 'Secher-Jensen', 'user', NULL, NULL),
(76, 'Sune', 'Ulsøe', 'Jensen', 'user', NULL, NULL),
(77, 'Tade', NULL, 'Shahnazariyans', 'user', NULL, NULL),
(78, 'Teis', NULL, 'Hjelm', 'user', NULL, NULL),
(79, 'Thomas', 'Stanley', 'Toustrup', 'user', NULL, NULL),
(80, 'Thorbjørn', 'Leth', 'Lyk', 'user', NULL, NULL),
(81, 'Thorisan', 'Andru', 'Narenthirarajah', 'user', NULL, NULL),
(82, 'Tobias', 'Thien', 'Tran', 'user', NULL, NULL),
(83, 'Tobias', 'Trane', 'Moser', 'user', NULL, NULL),
(84, 'Tony-Alexandru', NULL, 'Teglas-Szabo', 'user', NULL, NULL),
(85, 'Ulloriaq', 'Piitannguaq W H', 'Petrussen', 'user', NULL, NULL),
(86, 'Warin', NULL, 'Suphawan', 'user', NULL, NULL);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
