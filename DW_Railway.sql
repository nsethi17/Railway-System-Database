-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2019 at 09:45 PM
-- Server version: 5.7.25
-- PHP Version: 7.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `DW_Western`
--

-- --------------------------------------------------------

--
-- Table structure for table `STATIONS_TS`
--

CREATE TABLE `STATIONS_TS` (
  `Station_ID` int(11) NOT NULL,
  `Station_Name` varchar(30) NOT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Province` varchar(30) DEFAULT NULL,
  `Station_B_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `STATIONS_TS`
--

INSERT INTO `STATIONS_TS` (`Station_ID`, `Station_Name`, `City`, `Province`, `Station_B_ID`) VALUES
(1, 'London_Junction', 'London', 'ON', 0),
(2, 'Toronto_Junction', 'Toronto', 'ON', 1);

-- --------------------------------------------------------

--
-- Table structure for table `TICKET_FACT_TS`
--

CREATE TABLE `TICKET_FACT_TS` (
  `Ticket_ID` int(11) NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `Station_ID` int(11) NOT NULL,
  `Time_ID` int(11) NOT NULL,
  `Ticket_Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TICKET_FACT_TS`
--

INSERT INTO `TICKET_FACT_TS` (`Ticket_ID`, `Train_ID`, `Station_ID`, `Time_ID`, `Ticket_Price`) VALUES
(1, 1, 1, 1, 50),
(2, 1, 1, 1, 60),
(3, 2, 1, 1, 50),
(4, 2, 1, 1, 60),
(5, 1, 2, 1, 50),
(6, 1, 2, 1, 60),
(7, 2, 2, 1, 50),
(8, 2, 2, 1, 60),
(9, 1, 1, 2, 50),
(10, 1, 1, 2, 60),
(11, 2, 1, 2, 50),
(12, 2, 1, 2, 60),
(13, 1, 2, 2, 50),
(14, 1, 2, 2, 60),
(15, 2, 2, 2, 50),
(16, 2, 2, 2, 60);

-- --------------------------------------------------------

--
-- Table structure for table `TIME_TS`
--

CREATE TABLE `TIME_TS` (
  `Time_ID` int(11) NOT NULL,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TIME_TS`
--

INSERT INTO `TIME_TS` (`Time_ID`, `Day`, `Month`, `Year`) VALUES
(1, 11, 11, 2019),
(2, 11, 11, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `TRAIN_TS`
--

CREATE TABLE `TRAIN_TS` (
  `Train_ID` int(11) NOT NULL,
  `Coach` varchar(30) NOT NULL,
  `Train_Name` varchar(30) DEFAULT NULL,
  `Train_B_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TRAIN_TS`
--

INSERT INTO `TRAIN_TS` (`Train_ID`, `Coach`, `Train_Name`, `Train_B_ID`) VALUES
(1, '11', 'Train A', 0),
(2, '10', 'Train B', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `STATIONS_TS`
--
ALTER TABLE `STATIONS_TS`
  ADD PRIMARY KEY (`Station_ID`);

--
-- Indexes for table `TICKET_FACT_TS`
--
ALTER TABLE `TICKET_FACT_TS`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `TICKET_FACT_TS_FK1` (`Train_ID`),
  ADD KEY `TICKET_FACT_TS_FK2` (`Station_ID`),
  ADD KEY `TICKET_FACT_TS_FK3` (`Time_ID`);

--
-- Indexes for table `TIME_TS`
--
ALTER TABLE `TIME_TS`
  ADD PRIMARY KEY (`Time_ID`);

--
-- Indexes for table `TRAIN_TS`
--
ALTER TABLE `TRAIN_TS`
  ADD PRIMARY KEY (`Train_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `STATIONS_TS`
--
ALTER TABLE `STATIONS_TS`
  MODIFY `Station_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `TICKET_FACT_TS`
--
ALTER TABLE `TICKET_FACT_TS`
  MODIFY `Ticket_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `TIME_TS`
--
ALTER TABLE `TIME_TS`
  MODIFY `Time_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `TRAIN_TS`
--
ALTER TABLE `TRAIN_TS`
  MODIFY `Train_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `TICKET_FACT_TS`
--
ALTER TABLE `TICKET_FACT_TS`
  ADD CONSTRAINT `TICKET_FACT_TS_FK1` FOREIGN KEY (`Train_ID`) REFERENCES `TRAIN_TS` (`Train_ID`),
  ADD CONSTRAINT `TICKET_FACT_TS_FK2` FOREIGN KEY (`Station_ID`) REFERENCES `STATIONS_TS` (`Station_ID`),
  ADD CONSTRAINT `TICKET_FACT_TS_FK3` FOREIGN KEY (`Time_ID`) REFERENCES `TIME_TS` (`Time_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
