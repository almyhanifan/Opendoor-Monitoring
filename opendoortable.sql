-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2017 at 06:37 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opendoortry1`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `Log_Id` int(11) NOT NULL,
  `nama_pintu` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `waktu` varchar(255) NOT NULL,
  `randNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`Log_Id`, `nama_pintu`, `status`, `waktu`, `randNum`) VALUES
(6587, 'pintu1', 'Buka', '2017-01-21 22:22:47', 2062767),
(6588, 'pintu1', 'Tutup', '2017-01-21 22:23:05', 4303455),
(6589, 'pintu1', 'Buka', '2017-01-21 22:24:25', 9841133),
(6590, 'pintu1', 'Tutup', '2017-01-21 22:25:45', 9841133),
(6591, 'pintu1', 'Buka', '2017-01-21 23:06:49', 9841133),
(6592, 'pintu1', 'Tutup', '2017-01-21 23:23:25', 9841133),
(6593, 'pintu1', 'Buka', '2017-01-22 00:18:33', 9841133),
(6594, 'pintu1', 'Tutup', '2017-01-30 11:38:13', 9841133),
(6595, 'pintu1', 'Buka', '2017-01-30 11:38:18', 9841133),
(6596, 'pintu1', 'Tutup', '2017-01-30 11:38:31', 9841133),
(6597, 'pintu1', 'Buka', '2017-01-30 11:38:41', 9841133),
(6598, 'pintu1', 'Tutup', '2017-01-30 11:39:02', 9841133),
(6599, 'pintu1', 'Buka', '2017-01-30 11:39:26', 9841133),
(6600, 'pintu1', 'Tutup', '2017-01-30 21:13:23', 9841133),
(6601, 'pintu1', 'Buka', '2017-01-30 21:15:15', 9841133),
(6602, 'pintu1', 'Tutup', '2017-01-30 21:15:18', 9841133),
(6603, 'pintu1', 'Buka', '2017-01-30 21:15:22', 9841133),
(6604, 'pintu1', 'Tutup', '2017-01-30 22:23:39', 9841133),
(6605, 'pintu1', 'Buka', '2017-01-30 22:23:43', 9841133),
(6606, 'pintu1', 'Tutup', '2017-01-30 22:23:47', 9841133),
(6607, 'pintu1', 'Buka', '2017-01-30 22:23:49', 9841133),
(6608, 'pintu1', 'Tutup', '2017-01-30 22:23:52', 9841133);

-- --------------------------------------------------------

--
-- Table structure for table `pintu`
--

CREATE TABLE `pintu` (
  `id` varchar(32) NOT NULL,
  `nama_pintu` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `randNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pintu`
--

INSERT INTO `pintu` (`id`, `nama_pintu`, `status`, `waktu`, `randNum`) VALUES
('1', 'pintu1', 'Tutup', '2017-01-30 15:23:52', 9841133),
('2', 'pintu2', 'Buka', '2016-11-05 16:53:00', 0),
('3', 'pintu3', 'Tutup\r\n', '2016-11-05 16:45:04', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`Log_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `Log_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6609;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
