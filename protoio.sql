-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 07, 2018 at 09:49 AM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `protoio`
--

-- --------------------------------------------------------

--
-- Table structure for table `protoio`
--

CREATE TABLE `protoio` (
  `id` int(11) NOT NULL,
  `facility` varchar(255) NOT NULL,
  `patientid` varchar(255) NOT NULL,
  `collection_date` varchar(255) NOT NULL,
  `analysis_date` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `file1path` varchar(255) NOT NULL,
  `file2path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `protoio`
--

INSERT INTO `protoio` (`id`, `facility`, `patientid`, `collection_date`, `analysis_date`, `description`, `file1path`, `file2path`) VALUES
(12, 'New York', '8583a513-26e9-4241-8095-8a34e76bf474', '01/30/2018', '01/31/2018', 'desc', 'uploads/8583a513-26e9-4241-8095-8a34e76bf474/sample_amr.txt', 'uploads/8583a513-26e9-4241-8095-8a34e76bf474/sample_vf.txt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `protoio`
--
ALTER TABLE `protoio`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `protoio`
--
ALTER TABLE `protoio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
