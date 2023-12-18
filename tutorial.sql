-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 18, 2023 at 12:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tutorial`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblauction`
--

CREATE TABLE `tblauction` (
  `GroupId` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `AmountAuctioned` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblauction`
--

INSERT INTO `tblauction` (`GroupId`, `Date`, `AmountAuctioned`) VALUES
(1, '2023-12-01', 50000),
(2, '2023-12-14', 50000),
(2, '2023-12-24', 70000),
(3, '2023-12-16', 10),
(3, '2023-12-16', 10),
(3, '2023-12-16', 100000),
(3, '2023-12-20', 40000),
(1, '2023-12-17', 400000),
(1, '2023-12-17', 400000),
(3, '2023-12-17', 190000),
(1, '2023-12-23', 34567),
(1, '2023-12-15', 23456),
(1, '2023-12-23', 10000),
(1, '2023-12-23', 987654),
(3, '2023-12-16', 34567),
(1, '2023-12-16', 6543),
(2, '2023-12-14', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `tblbids`
--

CREATE TABLE `tblbids` (
  `BidId` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `RequestedAmount` int(11) DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `BidDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblbids`
--

INSERT INTO `tblbids` (`BidId`, `UserId`, `RequestedAmount`, `Reason`, `BidDate`) VALUES
(1, 2, 6000, 'code red', '2023-12-14 08:09:10'),
(3, 1, 1788, 'pink code', '2023-12-14 11:21:27'),
(5, 1, 2300, 'voilet', '2023-12-14 11:25:46'),
(6, 1, 1000, 'neon', '2023-12-15 07:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `tblgroup`
--

CREATE TABLE `tblgroup` (
  `GroupId` int(11) NOT NULL,
  `GroupName` varchar(50) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `AgencyPercentage` decimal(5,2) DEFAULT NULL,
  `Agency` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblgroup`
--

INSERT INTO `tblgroup` (`GroupId`, `GroupName`, `StartDate`, `AgencyPercentage`, `Agency`, `Amount`) VALUES
(1, 'ABC', '2023-01-01', '7.00', 'ABYZ Agency', '0.00'),
(2, 'PDF', '2023-01-01', '6.00', 'XYZ Agency', '6297.06'),
(3, 'Tech', '2023-12-14', '7.00', 'ABY', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbltransaction`
--

CREATE TABLE `tbltransaction` (
  `UserId` int(11) DEFAULT NULL,
  `AmountPaid` int(11) DEFAULT NULL,
  `TransactionTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbltransaction`
--

INSERT INTO `tbltransaction` (`UserId`, `AmountPaid`, `TransactionTime`) VALUES
(1, 32885, '2023-12-18 11:33:50'),
(2, 30000, '2023-12-18 06:54:14'),
(3, 32885, '2023-12-18 11:33:50'),
(16, 32885, '2023-12-18 11:33:50'),
(16, 32885, '2023-12-18 11:33:50');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserTypeId` int(11) DEFAULT NULL,
  `GroupId` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL DEFAULT 'unknown@example.com',
  `Password` varchar(255) NOT NULL DEFAULT 'password123'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `UserName`, `UserTypeId`, `GroupId`, `Email`, `Password`) VALUES
(1, 'Hritwika', 2, 2, 'unknown@example.com', 'password123'),
(2, 'Aarti', 2, 1, 'unknown@example.com', 'password123'),
(3, 'Megha', 1, 2, 'm@gmail.com', '2345'),
(16, 'Pranav', 2, 2, 'p@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `tblusertype`
--

CREATE TABLE `tblusertype` (
  `UserTypeId` int(11) NOT NULL,
  `UserType` varchar(50) DEFAULT NULL,
  `GroupName` varchar(50) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblusertype`
--

INSERT INTO `tblusertype` (`UserTypeId`, `UserType`, `GroupName`, `UserId`) VALUES
(1, 'Regular', 'ABC', NULL),
(2, 'Admin', 'PDF', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblbids`
--
ALTER TABLE `tblbids`
  ADD PRIMARY KEY (`BidId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `tblgroup`
--
ALTER TABLE `tblgroup`
  ADD PRIMARY KEY (`GroupId`),
  ADD UNIQUE KEY `GroupName` (`GroupName`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`),
  ADD KEY `UserTypeId` (`UserTypeId`),
  ADD KEY `GroupId` (`GroupId`);

--
-- Indexes for table `tblusertype`
--
ALTER TABLE `tblusertype`
  ADD PRIMARY KEY (`UserTypeId`),
  ADD UNIQUE KEY `UserType` (`UserType`),
  ADD KEY `GroupName` (`GroupName`),
  ADD KEY `UserId` (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblbids`
--
ALTER TABLE `tblbids`
  MODIFY `BidId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblgroup`
--
ALTER TABLE `tblgroup`
  MODIFY `GroupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tblusertype`
--
ALTER TABLE `tblusertype`
  MODIFY `UserTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbids`
--
ALTER TABLE `tblbids`
  ADD CONSTRAINT `tblbids_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`UserId`);

--
-- Constraints for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD CONSTRAINT `tbluser_ibfk_1` FOREIGN KEY (`UserTypeId`) REFERENCES `tblusertype` (`UserTypeId`),
  ADD CONSTRAINT `tbluser_ibfk_2` FOREIGN KEY (`GroupId`) REFERENCES `tblgroup` (`GroupId`);

--
-- Constraints for table `tblusertype`
--
ALTER TABLE `tblusertype`
  ADD CONSTRAINT `tblusertype_ibfk_1` FOREIGN KEY (`GroupName`) REFERENCES `tblgroup` (`GroupName`),
  ADD CONSTRAINT `tblusertype_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `tbluser` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
