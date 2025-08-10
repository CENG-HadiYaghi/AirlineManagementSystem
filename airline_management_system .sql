-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 04:51 PM
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
-- Database: `airline_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `aircrafts`
--

CREATE TABLE `aircrafts` (
  `AircraftID` int(11) NOT NULL,
  `Registration` varchar(50) DEFAULT NULL,
  `Manufacture` varchar(100) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `SeatCapacity` int(11) DEFAULT NULL,
  `CurrentStatus` varchar(50) DEFAULT NULL,
  `OwnershipType` enum('Owned','Leased') DEFAULT NULL,
  `LeaseExpiry` date DEFAULT NULL,
  `PurchasePrice` decimal(15,2) DEFAULT NULL,
  `MonthlyLease` decimal(15,2) DEFAULT NULL,
  `FirstClassSeats` int(11) DEFAULT 0,
  `BusinessSeats` int(11) DEFAULT 0,
  `EconomySeats` int(11) DEFAULT 0,
  `EngineType` varchar(100) DEFAULT NULL,
  `EngineCount` int(11) DEFAULT 0,
  `FuelCapacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aircrafts`
--

INSERT INTO `aircrafts` (`AircraftID`, `Registration`, `Manufacture`, `Model`, `SeatCapacity`, `CurrentStatus`, `OwnershipType`, `LeaseExpiry`, `PurchasePrice`, `MonthlyLease`, `FirstClassSeats`, `BusinessSeats`, `EconomySeats`, `EngineType`, `EngineCount`, `FuelCapacity`) VALUES
(1, 'N123AB', 'Boeing', '737-800', 160, 'ACTIVE', 'Owned', NULL, 95000000.00, NULL, 12, 24, 124, 'CFM56', 2, 26000),
(3, 'N789EF', 'Embraer', 'E195', 120, 'ACTIVE', 'Owned', NULL, 48000000.00, NULL, 6, 18, 96, 'PW1900G', 2, 13600),
(4, 'N234GH', 'Bombardier', 'CRJ900', 90, 'ACTIVE', 'Leased', '2025-11-15', NULL, 900000.00, 4, 12, 74, 'CF34-8C5', 2, 8300),
(5, 'N567IJ', 'Boeing', '777-300ER', 396, 'ACTIVE', 'Owned', NULL, 320000000.00, NULL, 8, 42, 346, 'GE90', 2, 181283),
(570904, '217935547', 'Airbus', 'A320', 100, 'Active', 'Owned', NULL, 1000000.00, NULL, 30, 10, 70, 'Turbofan', 1, 19876);

-- --------------------------------------------------------

--
-- Table structure for table `airports`
--

CREATE TABLE `airports` (
  `Code` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `airports`
--

INSERT INTO `airports` (`Code`, `Name`, `Country`, `City`) VALUES
('BEY', 'Beirut–Rafic Hariri International Airport', 'Lebanon', 'Beirut'),
('DXB', 'Dubai International Airport', 'United Arab Emirates', 'Dubai'),
('JFK', 'John F. Kennedy International Airport', 'United States', 'New York');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `Date_Of_BIrth` date DEFAULT NULL,
  `Gender` varchar(200) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `jobTitle` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `passwordHash` varchar(256) NOT NULL,
  `hireDate` date DEFAULT NULL,
  `active` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `fullName`, `Date_Of_BIrth`, `Gender`, `email`, `phone`, `jobTitle`, `department`, `username`, `passwordHash`, `hireDate`, `active`) VALUES
(347650, 'Roy Eid', '2005-09-09', 'Male', 'roy.eid@gmail.com', '81987156', 'Administrator', 'Administration', 'roy10984', 'Holdal1122', '2025-07-05', 'active'),
(358974, 'hadi yaghi', '1992-07-06', 'Male', 'hadi@gmail.com', '81241492', 'Pilot', 'Flight Operations', 'hadi21', '76636225', '2025-07-07', 'active'),
(784501, 'Test test', '2025-07-13', 'Male', 'test@gmail,com', '81241492', 'Customer Service Agent', 'Customer Service', 'test', 'test123', '2025-07-14', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flightId` int(11) NOT NULL,
  `flightNumber` varchar(20) NOT NULL,
  `origin` varchar(11) NOT NULL,
  `destination` varchar(11) NOT NULL,
  `flightDate` date DEFAULT NULL,
  `departureOnlyTime` time DEFAULT NULL,
  `arrivalOnlyTime` time DEFAULT NULL,
  `flightStatus` enum('SCHEDULED','DELAYED','CANCELLED','COMPLETED') DEFAULT 'SCHEDULED',
  `aircraftModel` varchar(111) NOT NULL,
  `availableSeats` int(11) DEFAULT NULL,
  `Reservations` int(111) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flightId`, `flightNumber`, `origin`, `destination`, `flightDate`, `departureOnlyTime`, `arrivalOnlyTime`, `flightStatus`, `aircraftModel`, `availableSeats`, `Reservations`) VALUES
(5, 'ME310', 'BEY', 'DXB', NULL, NULL, NULL, 'SCHEDULED', 'Boeing - 737-800', 160, 0),
(8, 'EK202', 'BEY', 'DXB', NULL, NULL, NULL, 'SCHEDULED', 'Embraer - E195', 120, 0),
(9, 'ME354', 'BEY', 'DXB', NULL, NULL, NULL, 'SCHEDULED', 'Airbus - A320', 100, 0),
(12, 'ME345', 'BEY', 'DXB', '2025-07-26', '03:00:00', '03:00:00', 'SCHEDULED', 'Boeing - 737-800', 0, 0),
(13, 'ME38776', 'BEY', 'DXB', '2025-07-26', '07:00:00', '17:00:00', 'SCHEDULED', 'Airbus - A320', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passengerId` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `passportNumber` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passengerId`, `fullName`, `email`, `phone`, `passportNumber`, `nationality`, `dateOfBirth`, `gender`) VALUES
(624246, 'roy eid', 'roy@gmail', '123456', '213123312', 'Lebanese', '2025-07-18', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `reservationID` int(11) NOT NULL,
  `ReservationType` varchar(11) NOT NULL,
  `paymentDate` datetime DEFAULT current_timestamp(),
  `amount` decimal(10,2) NOT NULL,
  `paymentMethod` enum('CARD','CASH','ONLINE') DEFAULT 'CARD',
  `Card Number` int(11) NOT NULL,
  `cvv` char(4) DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  `Billing Address` varchar(50) NOT NULL,
  `isRefunded` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `reservationID`, `ReservationType`, `paymentDate`, `amount`, `paymentMethod`, `Card Number`, `cvv`, `ExpiryDate`, `Billing Address`, `isRefunded`) VALUES
(672757, 601382, 'First', '2025-07-24 00:00:00', 0.00, 'CASH', 0, '0000', NULL, 'N/A', 0);

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `price_id` int(11) NOT NULL,
  `flightNumber` varchar(20) NOT NULL,
  `class_type` enum('economy','business','first') NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `taxes_fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `baggage_fee` decimal(10,2) DEFAULT 0.00,
  `meal_fee` decimal(10,2) DEFAULT 0.00,
  `seat_selection_fee` decimal(10,2) DEFAULT 0.00,
  `Total` decimal(10,2) DEFAULT 0.00,
  `currency` char(3) DEFAULT 'USD'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`price_id`, `flightNumber`, `class_type`, `base_price`, `taxes_fees`, `baggage_fee`, `meal_fee`, `seat_selection_fee`, `Total`, `currency`) VALUES
(6, 'EK202', 'business', 100.00, 10.00, 10.00, 10.00, 10.00, 140.00, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `ReservationId` int(100) NOT NULL,
  `passenger Name` varchar(100) NOT NULL,
  `class_type` varchar(100) NOT NULL,
  `from` varchar(100) NOT NULL,
  `To` varchar(100) NOT NULL,
  `flightNumber` varchar(11) NOT NULL,
  `flightDate` date NOT NULL,
  `Departure Time` time NOT NULL,
  `Arrival Time` time NOT NULL,
  `Bagagge Weight` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`ReservationId`, `passenger Name`, `class_type`, `from`, `To`, `flightNumber`, `flightDate`, `Departure Time`, `Arrival Time`, `Bagagge Weight`) VALUES
(782135, 'roy eid', 'First', 'BEY', 'DXB', 'ME38776', '2025-07-26', '07:00:00', '17:00:00', 25),
(447961, 'roy eid', 'First', 'BEY', 'DXB', 'ME38776', '2025-07-26', '07:00:00', '17:00:00', 25),
(601382, 'roy eid', 'First', 'BEY', 'DXB', 'ME38776', '2025-07-26', '07:00:00', '17:00:00', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aircrafts`
--
ALTER TABLE `aircrafts`
  ADD PRIMARY KEY (`AircraftID`),
  ADD UNIQUE KEY `Registration` (`Registration`),
  ADD UNIQUE KEY `SeatCapacity` (`SeatCapacity`);

--
-- Indexes for table `airports`
--
ALTER TABLE `airports`
  ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flightId`),
  ADD UNIQUE KEY `flightNumber` (`flightNumber`),
  ADD KEY `fk_flight_origin` (`origin`),
  ADD KEY `fk_flight_destination` (`destination`),
  ADD KEY `flightId` (`flightId`) USING BTREE;

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passengerId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD KEY `fk_payment_ticket` (`reservationID`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`price_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flightId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=672758;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
