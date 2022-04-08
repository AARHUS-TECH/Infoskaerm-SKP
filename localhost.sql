-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Vært: localhost:3306
-- Genereringstid: 08. 04 2022 kl. 10:12:02
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
CREATE DATABASE IF NOT EXISTS `infoscreendb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `infoscreendb`;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `news`
--

CREATE TABLE `news` (
  `ID` int(11) NOT NULL,
  `Header` varchar(100) NOT NULL,
  `Body` varchar(2400) DEFAULT NULL,
  `Startdate` date DEFAULT NULL,
  `Enddate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

--
-- Data dump for tabellen `news`
--

INSERT INTO `news` (`ID`, `Header`, `Body`, `Startdate`, `Enddate`) VALUES
(13, 'Påskeferien er lige om hjørnet', 'Vi vil gerne benytte lejligheden til at ønske Jer alle en god og velfortjent påskeferie. Håber I får tid til at nyde det forhåbentlige gode vejr sammen med familie og venner.', '2022-04-07', '2022-04-18'),
(14, 'Farvel til hovedforløbs eleverne', 'Herfra skal der lyde et farvel til de elever som skal starte på Hoverforløb efter påske. Vi har en del som starter på HF efter påske så held og lykke og få nu det allermeste ud af jeres undervisning', '2022-04-07', '2022-04-18');

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
(0, 'Karsten', '', '', 'superuser', NULL, NULL),
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Data dump for tabellen `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'admin', 'server', 'infoskærm', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"infoscreendb\",\"phpmyadmin\"],\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktur for tabel @TABLE@\",\"latex_structure_continued_caption\":\"Struktur for tabel @TABLE@ (fortsættes)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Indhold af tabel @TABLE@\",\"latex_data_continued_caption\":\"Indhold af tabel @TABLE@ (fortsættes)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"yaml_structure_or_data\":\"data\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"texytext_columns\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"json_pretty_print\":null}');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Data dump for tabellen `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('admin', '[{\"db\":\"infoscreendb\",\"table\":\"news\"},{\"db\":\"infoscreendb\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Data dump for tabellen `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('admin', 'infoscreendb', 'news', '{\"CREATE_TIME\":\"2021-11-02 11:56:42\",\"col_visib\":[\"1\",\"1\",\"1\",\"1\",\"1\"],\"sorted_col\":\"`news`.`ID` ASC\"}', '2021-11-16 09:31:24');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Data dump for tabellen `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('admin', '2021-11-24 11:54:38', '{\"collation_connection\":\"utf8mb4_unicode_ci\",\"SendErrorReports\":\"always\",\"lang\":\"da\"}'),
('phpmyadmin', '2021-10-28 09:51:21', '{\"lang\":\"da\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks for tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks for tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks for tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks for tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks for tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks for tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks for tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks for tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks for tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks for tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks for tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks for tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks for tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks for tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks for tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks for tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks for tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tilføj AUTO_INCREMENT i tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
