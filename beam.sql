-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 04:20 AM
-- Server version: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `beam`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE IF NOT EXISTS `agents` (
  `AgtNo` int(11) NOT NULL,
  `AgtGivenName` varchar(45) DEFAULT NULL,
  `AgtFamilyName` varchar(45) DEFAULT NULL,
  `AgtContact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AgtNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`AgtNo`, `AgtGivenName`, `AgtFamilyName`, `AgtContact`) VALUES
(111, 'John', 'Ripov', '0203 4567890'),
(222, 'Mary', 'Dancing', '0765 4320243'),
(333, 'Anil', 'Rating', '0121 2130321'),
(444, 'Lim', 'Popo', '0911 2345432'),
(555, 'Mary', 'Ripov', '0203 4567890');

-- --------------------------------------------------------

--
-- Table structure for table `bands`
--

CREATE TABLE IF NOT EXISTS `bands` (
  `BandNo` int(11) NOT NULL AUTO_INCREMENT,
  `BandStatus` varchar(45) DEFAULT NULL,
  `BandName` varchar(45) DEFAULT NULL,
  `BandDesc` varchar(60) DEFAULT NULL,
  `BandAgent` varchar(45) DEFAULT NULL,
  `AgtNo` int(11) NOT NULL,
  PRIMARY KEY (`BandNo`),
  KEY `fk_Band_Agent_idx` (`AgtNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bands`
--

INSERT INTO `bands` (`BandNo`, `BandStatus`, `BandName`, `BandDesc`, `BandAgent`, `AgtNo`) VALUES
(2, 'Active', 'Green Dragons', 'Heavy Rock', NULL, 222),
(3, 'Active', 'Wellies', 'Easy Listening', NULL, 333),
(4, 'Active', 'Lazy Dancers', 'Garage', NULL, 111),
(5, 'Active', 'The Vultures', 'Easy Listening', NULL, 333),
(6, 'Active', 'Future Explosion', 'Heavy Rock', NULL, 444),
(7, 'Active', 'Killers', 'Heavy Rock', NULL, 555);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `MemID` int(11) NOT NULL,
  `MemTitle` varchar(10) DEFAULT NULL,
  `MemGivenName` varchar(45) DEFAULT NULL,
  `MemFamilyName` varchar(45) DEFAULT NULL,
  `MemJobType` varchar(45) DEFAULT NULL,
  `MemStatus` varchar(10) DEFAULT NULL,
  `BandNo` int(11) NOT NULL,
  PRIMARY KEY (`MemID`),
  KEY `fk_Members_Bands1_idx` (`BandNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`MemID`, `MemTitle`, `MemGivenName`, `MemFamilyName`, `MemJobType`, `MemStatus`, `BandNo`) VALUES
(1111, 'Ms', 'Helen', 'Miranda', 'Lead Guitar', 'Active', 2),
(1234, 'Mr', 'Jose', 'Jose Alves', 'Bass Guitar', 'Active', 2),
(1235, 'Mr', 'Lai', 'Zee', 'Roadie', 'Active', 3),
(1333, 'Dr', 'Vito', 'Gelato', 'Voice Coach', 'Active', 3),
(1344, 'Dr', 'Guy', 'Redmond', 'Make-up', 'Active', 7),
(1444, 'Ms', 'Maria', 'Partou', 'Vocals', 'Active', 3),
(2111, 'Ms', 'Lindsay', 'White', 'Dancer', 'Cancelled', 6),
(2121, 'Mr', 'David', 'Wikinson', 'Backing', 'Cancelled', 5),
(3333, 'Ms', 'Olenka', 'Sama', 'Sound Tech', 'Active', 7),
(4545, 'Ms', 'Lee', 'Ping', 'Lead Guitar', 'Active', 4),
(5555, 'Mr', 'Tom', 'Tumbling', 'Drums', 'Active', 3),
(5665, 'Ms', 'Sing', 'Song', 'Vocals', 'Active', 5),
(6666, 'Mr', 'Fingers', 'Malone', 'Guitar', 'Active', 3),
(7271, 'Mr', 'Dan', 'Dreary', 'Make-up', 'Active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `performances`
--

CREATE TABLE IF NOT EXISTS `performances` (
  `PerfNo` int(11) NOT NULL,
  `PerfDate` date DEFAULT NULL,
  `PerfTime` time DEFAULT NULL,
  `StageNo` int(11) NOT NULL,
  `BandNo` int(11) NOT NULL,
  PRIMARY KEY (`PerfNo`),
  KEY `fk_Performance_Stage1_idx` (`StageNo`),
  KEY `fk_Performances_Bands1_idx` (`BandNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `performances`
--

INSERT INTO `performances` (`PerfNo`, `PerfDate`, `PerfTime`, `StageNo`, `BandNo`) VALUES
(1, '2020-06-25', '10:00:00', 1, 3),
(2, '2020-06-25', '18:00:00', 2, 3),
(3, '2020-06-27', '12:00:00', 1, 5),
(4, '2020-06-26', '18:00:00', 3, 3),
(5, '2020-06-26', '15:00:00', 3, 5),
(6, '2020-06-25', '13:00:00', 1, 7),
(7, '2020-06-26', '13:00:00', 5, 3),
(8, '2020-06-27', '13:00:00', 6, 5),
(9, '2020-06-26', '13:00:00', 2, 7),
(10, '2020-06-25', '17:00:00', 4, 4),
(11, '2020-06-27', '14:00:00', 1, 3),
(12, '2020-06-25', '17:00:00', 4, 4),
(13, '2020-06-26', '18:00:00', 6, 2),
(14, '2020-06-26', '19:00:00', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE IF NOT EXISTS `stages` (
  `StageNo` int(11) NOT NULL,
  `StageName` varchar(45) DEFAULT NULL,
  `StageBackCapacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`StageNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`StageNo`, `StageName`, `StageBackCapacity`) VALUES
(1, 'John Peel', 20),
(2, 'The Bowl', 10),
(3, 'Main', 30),
(4, 'The Oasis', 20),
(5, 'Jam Sessions', 3),
(6, 'Premium', 50);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bands`
--
ALTER TABLE `bands`
  ADD CONSTRAINT `fk_Band_Agent` FOREIGN KEY (`AgtNo`) REFERENCES `agents` (`AgtNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `fk_Members_Bands1` FOREIGN KEY (`BandNo`) REFERENCES `bands` (`BandNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `performances`
--
ALTER TABLE `performances`
  ADD CONSTRAINT `fk_Performances_Bands1` FOREIGN KEY (`BandNo`) REFERENCES `bands` (`BandNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Performance_Stage1` FOREIGN KEY (`StageNo`) REFERENCES `stages` (`StageNo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
