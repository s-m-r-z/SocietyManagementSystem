-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2022 at 08:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_charges`
--

CREATE TABLE `additional_charges` (
  `ChargeID` int(11) NOT NULL,
  `FlatID` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Reason` varchar(500) NOT NULL,
  `Bill_month` varchar(100) NOT NULL,
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `additional_charges`
--

INSERT INTO `additional_charges` (`ChargeID`, `FlatID`, `Amount`, `Reason`, `Bill_month`, `Updated_at`, `Updated_by`) VALUES
(241, 8, 35, 'Annual Fees', 'Apr 2022', '2022-05-23 16:59:13', 'admin3'),
(242, 83, 35, 'Annual Fees', 'Apr 2022', '2022-05-23 16:59:13', 'admin3'),
(243, 84, 35, 'Annual Fees', 'Apr 2022', '2022-05-23 16:59:13', 'admin3'),
(244, 86, 35, 'Annual Fees', 'Apr 2022', '2022-05-23 16:59:13', 'admin3'),
(245, 87, 35, 'Annual Fees', 'Apr 2022', '2022-05-23 16:59:13', 'admin3'),
(246, 86, 50, 'Fine for littering', 'Apr 2022', '2022-05-23 16:59:41', 'admin3'),
(247, 83, 350, 'Due Passed', 'Apr 2022', '2022-05-23 17:08:18', 'admin3');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` bigint(20) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Name` text NOT NULL,
  `Password` varchar(150) NOT NULL,
  `ContactNumber` bigint(10) NOT NULL,
  `EmailID` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Username`, `Name`, `Password`, `ContactNumber`, `EmailID`, `updated_at`) VALUES
(1, 'Admin1', 'Miran Ul Haq', 'e5f0f20b92f7022779015774e90ce917', 923322331710, 'miran.uh@gmail.com', '2021-04-22 22:42:52'),
(2, 'Admin2', 'Mehdi', '5f4dcc3b5aa765d61d8327deb882cf99', 3329654123, 'mehdi@gmail.com', '2021-04-22 22:42:52'),
(3, 'Admin3', 'Shahzaib', '5f4dcc3b5aa765d61d8327deb882cf99', 332345678, 'shahzaib@gmail.com', '2021-04-22 22:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `allotments`
--

CREATE TABLE `allotments` (
  `AllotmentID` bigint(20) NOT NULL,
  `FlatID` bigint(20) NOT NULL,
  `FlatNumber` varchar(20) NOT NULL,
  `BlockNumber` varchar(50) NOT NULL,
  `OwnerName` varchar(500) NOT NULL,
  `OwnerEmail` varchar(100) NOT NULL,
  `OwnerContactNumber` bigint(10) NOT NULL,
  `OwnerAlternateContactNumber` bigint(10) NOT NULL,
  `OwnerMemberCount` bigint(20) NOT NULL,
  `isRent` tinyint(1) NOT NULL,
  `RenteeName` varchar(500) DEFAULT NULL,
  `RenteeEmail` varchar(100) DEFAULT NULL,
  `RenteeContactNumber` bigint(10) DEFAULT NULL,
  `RenteeAlternateContactNumber` bigint(10) DEFAULT NULL,
  `RenteeMemberCount` bigint(20) DEFAULT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allotments`
--

INSERT INTO `allotments` (`AllotmentID`, `FlatID`, `FlatNumber`, `BlockNumber`, `OwnerName`, `OwnerEmail`, `OwnerContactNumber`, `OwnerAlternateContactNumber`, `OwnerMemberCount`, `isRent`, `RenteeName`, `RenteeEmail`, `RenteeContactNumber`, `RenteeAlternateContactNumber`, `RenteeMemberCount`, `updated_by`, `updated_at`) VALUES
(28, 83, '101', 'A', 'Ali', 'temp@email.com', 1234567890, 9296048506, 5, 0, '', '', 0, 0, 0, 'admin1', '2022-05-21 12:27:38'),
(29, 8, '401', 'D', 'Saad', 'saad@email.com', 3008292627, 3008292627, 3, 1, 'Saud', 'user123@gmail.com', 3218292627, 3218292627, 3, 'admin3', '2022-05-23 16:55:13'),
(30, 86, '125', 'B', 'Moiz', 'haq@gmail.com', 3322221710, 3322221710, 1, 0, '', '', 0, 0, 0, 'admin3', '2022-05-23 16:56:05');

-- --------------------------------------------------------

--
-- Table structure for table `bills_paid`
--

CREATE TABLE `bills_paid` (
  `BillID` bigint(20) NOT NULL,
  `BillQueueID` bigint(20) NOT NULL,
  `FlatID` bigint(20) NOT NULL,
  `BillAmount` double NOT NULL,
  `Status` int(11) NOT NULL,
  `Receipt` blob NOT NULL,
  `ReceiptName` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bill_queue`
--

CREATE TABLE `bill_queue` (
  `bill_id` bigint(20) NOT NULL,
  `FlatID` bigint(20) NOT NULL,
  `to_email` varchar(100) NOT NULL,
  `bill_month` varchar(255) NOT NULL,
  `maintenance_charges` bigint(15) NOT NULL,
  `additional_charges` int(11) NOT NULL,
  `total_charges` int(11) NOT NULL,
  `bill_gen_date` date NOT NULL,
  `bill_due_date` date NOT NULL,
  `charges_after_due` bigint(15) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `filemime` varchar(255) NOT NULL,
  `data` blob NOT NULL,
  `is_sent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_queue`
--

INSERT INTO `bill_queue` (`bill_id`, `FlatID`, `to_email`, `bill_month`, `maintenance_charges`, `additional_charges`, `total_charges`, `bill_gen_date`, `bill_due_date`, `charges_after_due`, `filename`, `filemime`, `data`, `is_sent`) VALUES
(123, 83, 'temp@email.com', 'Apr 2022', 750, 35, 785, '2022-05-23', '2022-06-07', 950, 'A-101-Apr 2022.pdf', 'application/pdf', 0x433a2f78616d70702f6874646f63732f736f63696574792d6d616e6167656d656e742d73797374656d2f42696c6c55706c6f6164732f412d3130312d41707220323032322e706466, 0);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `RequestID` bigint(20) NOT NULL,
  `ComplaintType` varchar(50) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `BlockNumber` varchar(10) NOT NULL,
  `FlatNumber` int(11) NOT NULL,
  `ContactNumber` bigint(10) NOT NULL,
  `RaisedDate` date NOT NULL,
  `AdminRemark` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `ResolvedDate` date NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`RequestID`, `ComplaintType`, `Description`, `BlockNumber`, `FlatNumber`, `ContactNumber`, `RaisedDate`, `AdminRemark`, `Status`, `ResolvedDate`, `updated_at`) VALUES
(25, '8', 'Not enough space for parking of 2', 'A', 101, 1234567890, '2022-05-23', 'No remark', '0', '0000-00-00', '2022-05-23 17:09:39'),
(26, '5', 'No security guard on gate 2', 'A', 101, 1234567890, '2022-05-23', 'No remark', '0', '0000-00-00', '2022-05-23 17:09:59'),
(27, '11', 'There should be a public gathering weekly for entertainment', 'A', 101, 1234567890, '2022-05-23', 'No remark', '0', '0000-00-00', '2022-05-23 17:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `complainttypes`
--

CREATE TABLE `complainttypes` (
  `complaint_id` int(11) NOT NULL,
  `complaint_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complainttypes`
--

INSERT INTO `complainttypes` (`complaint_id`, `complaint_type`) VALUES
(1, 'Carpenter'),
(2, 'Electrical'),
(3, 'Plumbing'),
(4, 'Common Area'),
(5, 'Security'),
(6, 'Lift'),
(7, 'Sports & Recreational'),
(8, 'Parking'),
(9, 'Fire'),
(10, 'Billing & Payment'),
(11, 'Events'),
(12, 'Landscaping'),
(13, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `flat`
--

CREATE TABLE `flat` (
  `FlatID` bigint(20) DEFAULT NULL,
  `FlatNumber` bigint(20) DEFAULT NULL,
  `BlockNumber` varchar(20) DEFAULT NULL,
  `Floor` bigint(20) DEFAULT NULL,
  `FlatAreaID` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flat`
--

INSERT INTO `flat` (`FlatID`, `FlatNumber`, `BlockNumber`, `Floor`, `FlatAreaID`, `created_at`, `updated_at`) VALUES
(0, 121, 'A', 1, 0, '2022-05-23 16:53:42', '2022-05-23 16:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `flatarea`
--

CREATE TABLE `flatarea` (
  `FlatAreaID` bigint(20) NOT NULL,
  `BlockNumber` varchar(20) NOT NULL,
  `FlatSeries` bigint(20) NOT NULL,
  `FlatArea` bigint(20) NOT NULL,
  `FlatType` varchar(10) NOT NULL,
  `Ratepsq` double NOT NULL,
  `Updatedby` varchar(20) NOT NULL,
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flatarea`
--

INSERT INTO `flatarea` (`FlatAreaID`, `BlockNumber`, `FlatSeries`, `FlatArea`, `FlatType`, `Ratepsq`, `Updatedby`, `UpdatedAt`) VALUES
(141, 'A', 1, 125, '1BHK', 6, 'admin3', '2022-05-23 16:50:50'),
(142, 'D', 4, 220, '3BHK', 59, 'admin3', '2022-05-23 16:51:15'),
(143, 'B', 2, 175, '2BHK', 30, 'admin3', '2022-05-23 16:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `flats`
--

CREATE TABLE `flats` (
  `FlatID` bigint(20) NOT NULL,
  `FlatNumber` bigint(20) NOT NULL,
  `BlockNumber` varchar(20) NOT NULL,
  `Floor` bigint(20) NOT NULL,
  `FlatAreaID` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flats`
--

INSERT INTO `flats` (`FlatID`, `FlatNumber`, `BlockNumber`, `Floor`, `FlatAreaID`, `created_at`, `updated_at`) VALUES
(8, 401, 'D', 4, 142, '2021-04-23 10:37:26', '2021-04-23 10:37:26'),
(83, 101, 'A', 1, 141, '2021-04-23 10:37:26', '2021-04-23 10:37:26'),
(84, 201, 'A', 2, 141, '2021-04-23 10:37:26', '2021-04-23 10:37:26'),
(86, 125, 'B', 1, 143, '2021-04-23 10:37:26', '2021-04-23 10:37:26'),
(87, 310, 'D', 3, 142, '2021-04-23 10:37:26', '2021-04-23 10:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `namaz`
--

CREATE TABLE `namaz` (
  `NamazId` int(1) NOT NULL,
  `NamazName` varchar(100) NOT NULL,
  `NamazTime` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `namaz`
--

INSERT INTO `namaz` (`NamazId`, `NamazName`, `NamazTime`) VALUES
(1, 'Fajar', '5.10'),
(2, 'Zuhr', '1.15'),
(3, 'Asar', '5.30'),
(4, 'Maghrib', '7.15'),
(5, 'Isha', '9.00');

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

CREATE TABLE `security` (
  `SecurityID` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ContactNumber` bigint(10) NOT NULL,
  `Shift` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `security`
--

INSERT INTO `security` (`SecurityID`, `Name`, `ContactNumber`, `Shift`, `created_at`, `updated_at`) VALUES
(1, 'Abdullah', 3219876543, 'Evening', '2022-05-23 02:35:21', '2022-05-23 02:35:21'),
(147, 'Noor', 3319874563, 'Morning', '2022-05-23 16:57:22', '2022-05-23 16:57:22'),
(456, 'Munir', 3358292627, 'Afternoon', '2022-05-23 16:57:04', '2022-05-23 16:57:04');

-- --------------------------------------------------------

--
-- Table structure for table `securitylogin`
--

CREATE TABLE `securitylogin` (
  `SecID` bigint(20) NOT NULL,
  `SecurityID` bigint(20) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `securitylogin`
--

INSERT INTO `securitylogin` (`SecID`, `SecurityID`, `Username`, `Password`, `updated_at`) VALUES
(1, 1, 'Abdullah', 'e5f0f20b92f7022779015774e90ce917', '2022-04-09 16:33:02');

-- --------------------------------------------------------

--
-- Table structure for table `shoutbox`
--

CREATE TABLE `shoutbox` (
  `ShoutBoxID` bigint(20) NOT NULL,
  `Admin` varchar(50) NOT NULL,
  `FlatID` varchar(20) NOT NULL,
  `Chat` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shoutbox`
--

INSERT INTO `shoutbox` (`ShoutBoxID`, `Admin`, `FlatID`, `Chat`, `created_at`) VALUES
(38, 'admin3', '', 'Greetings Members!', '2022-05-23 11:57:54'),
(39, 'admin3', '', 'This is the Announcement and Communcations Box of the Society. Please check it regularly and dont misuse it. ', '2022-05-23 11:58:31'),
(40, 'admin3', '', 'Your friendly Admin Team', '2022-05-23 11:58:35'),
(41, '', '83 ', 'Acknowledge ', '2022-05-23 13:06:03');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `VisitorID` bigint(20) NOT NULL,
  `FlatID` bigint(20) NOT NULL,
  `VisitorName` varchar(100) NOT NULL,
  `VisitorContactNo` bigint(10) NOT NULL,
  `AlternateVisitorContactNo` bigint(20) NOT NULL,
  `BlockNumber` varchar(50) NOT NULL,
  `FlatNumber` bigint(20) NOT NULL,
  `NoOfPeople` int(11) NOT NULL,
  `WhomToMeet` varchar(100) NOT NULL,
  `ReasonToMeet` varchar(1000) NOT NULL,
  `OTP` bigint(20) NOT NULL,
  `StartDate` date NOT NULL,
  `Duration` bigint(20) NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`VisitorID`, `FlatID`, `VisitorName`, `VisitorContactNo`, `AlternateVisitorContactNo`, `BlockNumber`, `FlatNumber`, `NoOfPeople`, `WhomToMeet`, `ReasonToMeet`, `OTP`, `StartDate`, `Duration`, `updated_by`, `updated_at`) VALUES
(116, 83, 'Nabi', 3327896541, 3329874563, 'A', 101, 2, '', 'Meet and Greet', 924938, '2022-05-23', 2, '', '2022-05-23 17:11:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_charges`
--
ALTER TABLE `additional_charges`
  ADD PRIMARY KEY (`ChargeID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `allotments`
--
ALTER TABLE `allotments`
  ADD PRIMARY KEY (`AllotmentID`);

--
-- Indexes for table `bills_paid`
--
ALTER TABLE `bills_paid`
  ADD PRIMARY KEY (`BillID`);

--
-- Indexes for table `bill_queue`
--
ALTER TABLE `bill_queue`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`RequestID`);

--
-- Indexes for table `complainttypes`
--
ALTER TABLE `complainttypes`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `flatarea`
--
ALTER TABLE `flatarea`
  ADD PRIMARY KEY (`FlatAreaID`);

--
-- Indexes for table `flats`
--
ALTER TABLE `flats`
  ADD PRIMARY KEY (`FlatID`);

--
-- Indexes for table `namaz`
--
ALTER TABLE `namaz`
  ADD PRIMARY KEY (`NamazId`);

--
-- Indexes for table `security`
--
ALTER TABLE `security`
  ADD PRIMARY KEY (`SecurityID`);

--
-- Indexes for table `securitylogin`
--
ALTER TABLE `securitylogin`
  ADD PRIMARY KEY (`SecID`);

--
-- Indexes for table `shoutbox`
--
ALTER TABLE `shoutbox`
  ADD PRIMARY KEY (`ShoutBoxID`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`VisitorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_charges`
--
ALTER TABLE `additional_charges`
  MODIFY `ChargeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `allotments`
--
ALTER TABLE `allotments`
  MODIFY `AllotmentID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `bills_paid`
--
ALTER TABLE `bills_paid`
  MODIFY `BillID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `bill_queue`
--
ALTER TABLE `bill_queue`
  MODIFY `bill_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `RequestID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `complainttypes`
--
ALTER TABLE `complainttypes`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `flatarea`
--
ALTER TABLE `flatarea`
  MODIFY `FlatAreaID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `flats`
--
ALTER TABLE `flats`
  MODIFY `FlatID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `security`
--
ALTER TABLE `security`
  MODIFY `SecurityID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123457;

--
-- AUTO_INCREMENT for table `securitylogin`
--
ALTER TABLE `securitylogin`
  MODIFY `SecID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shoutbox`
--
ALTER TABLE `shoutbox`
  MODIFY `ShoutBoxID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `VisitorID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
