-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2019 at 09:50 PM
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
-- Database: `WU_Data_Management`
--

-- --------------------------------------------------------

--
-- Table structure for table `SEQUENCE_T`
--

CREATE TABLE `SEQUENCE_T` (
  `Seq_num` int(2) NOT NULL,
  `Station_ID` int(11) NOT NULL,
  `Train_schedule_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SEQUENCE_T`
--

INSERT INTO `SEQUENCE_T` (`Seq_num`, `Station_ID`, `Train_schedule_ID`) VALUES
(0, 0, 0),
(1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `STATIONS_T`
--

CREATE TABLE `STATIONS_T` (
  `Station_ID` int(11) NOT NULL,
  `Station_Name` varchar(30) NOT NULL,
  `City` varchar(11) DEFAULT NULL,
  `Province` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `STATIONS_T`
--

INSERT INTO `STATIONS_T` (`Station_ID`, `Station_Name`, `City`, `Province`) VALUES
(0, 'London_Junction', 'London', 'ON'),
(1, 'Toronto_Junction', 'Toronto', 'ON');

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
-- Table structure for table `TICKET_T`
--

CREATE TABLE `TICKET_T` (
  `Ticket_ID` int(11) NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `J_Date` datetime DEFAULT NULL,
  `From_Station_ID` int(11) DEFAULT NULL,
  `To_Station_ID` int(11) DEFAULT NULL,
  `Coach` varchar(30) DEFAULT NULL,
  `Seat_No` int(11) DEFAULT NULL,
  `Passenger_Name` varchar(30) DEFAULT NULL,
  `Ticket_Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TICKET_T`
--

INSERT INTO `TICKET_T` (`Ticket_ID`, `Train_ID`, `J_Date`, `From_Station_ID`, `To_Station_ID`, `Coach`, `Seat_No`, `Passenger_Name`, `Ticket_Price`) VALUES
(0, 0, '2019-11-11 00:00:00', 0, 1, 'ABC', 123, 'John Doe', 50),
(1, 1, '2019-11-11 00:00:00', 0, 1, '124', 123, 'Jane Doe', 60);

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
-- Table structure for table `TRACK_T`
--

CREATE TABLE `TRACK_T` (
  `Track_ID` int(11) NOT NULL,
  `Station1_ID` int(11) NOT NULL,
  `Station2_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TRACK_T`
--

INSERT INTO `TRACK_T` (`Track_ID`, `Station1_ID`, `Station2_ID`) VALUES
(0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `TRAIN_SCHEDULE_T`
--

CREATE TABLE `TRAIN_SCHEDULE_T` (
  `Train_Schedule_ID` int(11) NOT NULL,
  `Train_ID` int(11) NOT NULL,
  `Time_In` datetime NOT NULL,
  `Time_Out` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TRAIN_SCHEDULE_T`
--

INSERT INTO `TRAIN_SCHEDULE_T` (`Train_Schedule_ID`, `Train_ID`, `Time_In`, `Time_Out`) VALUES
(0, 0, '2019-11-11 00:00:00', '2019-11-11 01:00:00'),
(1, 0, '2019-11-11 02:00:00', '2019-11-11 04:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `TRAIN_T`
--

CREATE TABLE `TRAIN_T` (
  `Train_ID` int(11) NOT NULL,
  `Train_Name` varchar(30) NOT NULL,
  `Coach` int(11) DEFAULT NULL,
  `Total_Seat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TRAIN_T`
--

INSERT INTO `TRAIN_T` (`Train_ID`, `Train_Name`, `Coach`, `Total_Seat`) VALUES
(0, 'Train A', 11, 100),
(1, 'Train B', 10, 150);

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
-- Indexes for table `SEQUENCE_T`
--
ALTER TABLE `SEQUENCE_T`
  ADD PRIMARY KEY (`Station_ID`,`Train_schedule_ID`),
  ADD KEY `SCHEDULE_T_FK2` (`Train_schedule_ID`);

--
-- Indexes for table `STATIONS_T`
--
ALTER TABLE `STATIONS_T`
  ADD PRIMARY KEY (`Station_ID`);

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
-- Indexes for table `TICKET_T`
--
ALTER TABLE `TICKET_T`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `PASSENGER_T_FK1` (`Train_ID`),
  ADD KEY `PASSENGER_T_FK2` (`From_Station_ID`),
  ADD KEY `PASSENGER_T_FK3` (`To_Station_ID`);

--
-- Indexes for table `TIME_TS`
--
ALTER TABLE `TIME_TS`
  ADD PRIMARY KEY (`Time_ID`);

--
-- Indexes for table `TRACK_T`
--
ALTER TABLE `TRACK_T`
  ADD PRIMARY KEY (`Track_ID`),
  ADD KEY `TRACK_T_FK1` (`Station1_ID`),
  ADD KEY `TRACK_T_FK2` (`Station2_ID`);

--
-- Indexes for table `TRAIN_SCHEDULE_T`
--
ALTER TABLE `TRAIN_SCHEDULE_T`
  ADD PRIMARY KEY (`Train_Schedule_ID`),
  ADD KEY `TRAIN_SCHEDULE_T_FK` (`Train_ID`);

--
-- Indexes for table `TRAIN_T`
--
ALTER TABLE `TRAIN_T`
  ADD PRIMARY KEY (`Train_ID`);

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
-- Constraints for table `SEQUENCE_T`
--
ALTER TABLE `SEQUENCE_T`
  ADD CONSTRAINT `SCHEDULE_T_FK1` FOREIGN KEY (`Station_ID`) REFERENCES `STATIONS_T` (`Station_ID`),
  ADD CONSTRAINT `SCHEDULE_T_FK2` FOREIGN KEY (`Train_schedule_ID`) REFERENCES `TRAIN_SCHEDULE_T` (`Train_Schedule_ID`);

--
-- Constraints for table `TICKET_FACT_TS`
--
ALTER TABLE `TICKET_FACT_TS`
  ADD CONSTRAINT `TICKET_FACT_TS_FK1` FOREIGN KEY (`Train_ID`) REFERENCES `TRAIN_TS` (`Train_ID`),
  ADD CONSTRAINT `TICKET_FACT_TS_FK2` FOREIGN KEY (`Station_ID`) REFERENCES `STATIONS_TS` (`Station_ID`),
  ADD CONSTRAINT `TICKET_FACT_TS_FK3` FOREIGN KEY (`Time_ID`) REFERENCES `TIME_TS` (`Time_ID`);

--
-- Constraints for table `TICKET_T`
--
ALTER TABLE `TICKET_T`
  ADD CONSTRAINT `PASSENGER_T_FK1` FOREIGN KEY (`Train_ID`) REFERENCES `TRAIN_T` (`Train_ID`),
  ADD CONSTRAINT `PASSENGER_T_FK2` FOREIGN KEY (`From_Station_ID`) REFERENCES `STATIONS_T` (`Station_ID`),
  ADD CONSTRAINT `PASSENGER_T_FK3` FOREIGN KEY (`To_Station_ID`) REFERENCES `STATIONS_T` (`Station_ID`);

--
-- Constraints for table `TRACK_T`
--
ALTER TABLE `TRACK_T`
  ADD CONSTRAINT `TRACK_T_FK1` FOREIGN KEY (`Station1_ID`) REFERENCES `STATIONS_T` (`Station_ID`),
  ADD CONSTRAINT `TRACK_T_FK2` FOREIGN KEY (`Station2_ID`) REFERENCES `STATIONS_T` (`Station_ID`);

--
-- Constraints for table `TRAIN_SCHEDULE_T`
--
ALTER TABLE `TRAIN_SCHEDULE_T`
  ADD CONSTRAINT `TRAIN_SCHEDULE_T_FK` FOREIGN KEY (`Train_ID`) REFERENCES `TRAIN_T` (`Train_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
