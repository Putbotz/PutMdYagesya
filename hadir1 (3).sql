-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2024 at 03:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hadir1`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktiviti`
--

CREATE TABLE `aktiviti` (
  `kod` int(15) NOT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `tarikhAktiviti` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aktiviti`
--

INSERT INTO `aktiviti` (`kod`, `keterangan`, `tarikhAktiviti`) VALUES
(7, 'SENAM ROBIK', '2024-07-09'),
(8, 'BELAJAR TEKNIK TEMPUR', '2024-07-11'),
(9, 'BELAJAR JURUS PERTAHANAN DIRI', '2024-08-21'),
(11, 'BELAJAR SILIBUS SILAT', '2024-08-23');

-- --------------------------------------------------------

--
-- Table structure for table `hadir`
--

CREATE TABLE `hadir` (
  `bil` int(15) NOT NULL,
  `masa` time DEFAULT NULL,
  `tarikh` date DEFAULT NULL,
  `nomKp` varchar(12) DEFAULT NULL,
  `kod` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hadir`
--

INSERT INTO `hadir` (`bil`, `masa`, `tarikh`, `nomKp`, `kod`) VALUES
(9, '08:31:56', '2024-07-09', '070201030163', 7),
(10, '22:46:56', '2024-07-11', '070201030163', 8),
(11, '09:53:32', '2024-08-21', '070424030163', 9),
(12, '09:54:02', '2024-08-21', '080203010431', 9),
(13, '09:54:35', '2024-08-21', '070907020163', 9),
(14, '09:55:16', '2024-08-21', '070201040163', 9),
(15, '09:56:40', '2024-08-21', '070201030163', 9);

-- --------------------------------------------------------

--
-- Table structure for table `hp`
--

CREATE TABLE `hp` (
  `nomHp` varchar(14) NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hp`
--

INSERT INTO `hp` (`nomHp`, `nama`) VALUES
('0119876253', 'syamina'),
('0123689323', 'hafiz'),
('0129383292', 'anis'),
('01322827362', 'foo seng'),
('0132873728', 'amir'),
('0139887878', 'PENTADBIR'),
('0178965423', 'alyaa'),
('0192837366', 'harraz'),
('0199262674', 'NUREEN'),
('0199287674', 'AFEEF'),
('601117066021', 'Alieff Putra');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `nomKp` varchar(12) NOT NULL,
  `jantina` varchar(11) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `aras` varchar(10) DEFAULT NULL,
  `nomHp` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`nomKp`, `jantina`, `password`, `aras`, `nomHp`) VALUES
('052012029198', 'PEREMPUAN', '029198', 'PENGGUNA', '0129383292'),
('070201030163', 'LELAKI', '030163', 'PENGGUNA', '601117066021'),
('070201040163', 'PEREMPUAN', '040163', 'PENGGUNA', '0119876253'),
('070224100280', 'LELAKI', '100280', 'PENGGUNA', '01322827362'),
('070424030163', 'PEREMPUAN', '030163', 'PENGGUNA', '0178965423'),
('070907020163', 'LELAKI', '020163', 'PENGGUNA', '0192837366'),
('073004040123', 'LELAKI', '040123', 'PENGGUNA', '0132873728'),
('080203010431', 'LELAKI', '010431', 'PENGGUNA', '0123689323'),
('770628043355', 'LELAKI', '043355', 'PENGGUNA', '0199287674'),
('821215043322', 'PEREMPUAN', '043322', 'PENGGUNA', '0199262674'),
('887766554433', 'LELAKI', '554433', 'ADMIN', '0139887878');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktiviti`
--
ALTER TABLE `aktiviti`
  ADD PRIMARY KEY (`kod`);

--
-- Indexes for table `hadir`
--
ALTER TABLE `hadir`
  ADD PRIMARY KEY (`bil`),
  ADD KEY `nomKp` (`nomKp`),
  ADD KEY `kod` (`kod`);

--
-- Indexes for table `hp`
--
ALTER TABLE `hp`
  ADD PRIMARY KEY (`nomHp`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`nomKp`),
  ADD UNIQUE KEY `nomHp` (`nomHp`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktiviti`
--
ALTER TABLE `aktiviti`
  MODIFY `kod` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hadir`
--
ALTER TABLE `hadir`
  MODIFY `bil` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hadir`
--
ALTER TABLE `hadir`
  ADD CONSTRAINT `hadir_ibfk_1` FOREIGN KEY (`nomKp`) REFERENCES `peserta` (`nomKp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hadir_ibfk_2` FOREIGN KEY (`kod`) REFERENCES `aktiviti` (`kod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`nomHp`) REFERENCES `hp` (`nomHp`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
