-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2020 at 10:39 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helthcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appoinment`
--

CREATE TABLE `appoinment` (
  `appoinmentId` int(11) NOT NULL,
  `appoinmentDateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `patientId` int(11) NOT NULL,
  `paymentId` int(11) NOT NULL,
  `docId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docId` int(11) NOT NULL,
  `fName` varchar(100) NOT NULL,
  `lNmae` varchar(100) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `age` int(11) NOT NULL,
  `docNIC` varchar(13) NOT NULL,
  `docEmail` varchar(200) DEFAULT NULL,
  `passwod` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doc_phoneno`
--

CREATE TABLE `doc_phoneno` (
  `dPId` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `docId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalId` int(11) NOT NULL,
  `hospitalNmae` varchar(100) NOT NULL,
  `hospitalAddress` varchar(200) NOT NULL,
  `hospitalEmail` varchar(50) DEFAULT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hospitalId`, `hospitalNmae`, `hospitalAddress`, `hospitalEmail`, `password`) VALUES
(1, 'asirimedicare', 'colombo 02', 'asiricare@gmail.com', 'asiri345'),
(2345, 'lanka ', 'maharagama', 'lanka@gmail.com', 'lanka'),
(34567, 'asirimedical', 'colombo03', 'asiri@gmail.com', 'asiri123'),
(98765, 'nawinna medicare', 'Nawinna', 'medicare@gmail.com', 'medi123'),
(18064032, 'heams', 'colombo3', 'hemas@gmail.com', 'hemas'),
(18064033, 'Nawalakoka', 'colombo 5', 'Nawaloka@gmail.com', 'nawaloka123');

-- --------------------------------------------------------

--
-- Table structure for table `hospitaldoctor`
--

CREATE TABLE `hospitaldoctor` (
  `docId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL,
  `avaliableDate` varchar(100) NOT NULL,
  `avaliableTime` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `host_phoneno`
--

CREATE TABLE `host_phoneno` (
  `hPId` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laboratoryreport`
--

CREATE TABLE `laboratoryreport` (
  `labId` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `LabDate` date NOT NULL,
  `Desacription` varchar(600) NOT NULL,
  `patientId` int(11) NOT NULL,
  `hospitalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratoryreport`
--

INSERT INTO `laboratoryreport` (`labId`, `type`, `LabDate`, `Desacription`, `patientId`, `hospitalId`) VALUES
(59, 'Suguar', '2020-05-23', 'low', 9876, 1),
(60, 'PTS', '2020-06-05', 'High', 12345, 1),
(61, 'Bloodreport', '2020-05-23', 'well', 21345, 1),
(62, 'CTR', '2020-08-17', 'Doingwell', 18064031, 1),
(63, 'MRscan', '2020-07-16', 'redline', 18064032, 1),
(64, 'EcoScan', '2020-05-11', 'perfect', 18063, 1),
(66, 'CT Sacn', '2020-05-15', 'high precentage', 18064, 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `fNmae` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `age` int(11) NOT NULL,
  `patientNIC` varchar(13) NOT NULL,
  `address` varchar(500) NOT NULL,
  `patientEmail` varchar(200) NOT NULL,
  `passwod` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientId`, `fNmae`, `lName`, `gender`, `age`, `patientNIC`, `address`, `patientEmail`, `passwod`) VALUES
(1, 'wer', 'wer', 'f', 56, '2345v', 'wertyu', 'sdf', '@d.1234'),
(1234, '', '', '', 0, '', '', '', ''),
(9876, 'Radil', 'perera', 'male', 25, '992074512V', 'Nugegoda', 'radil@gmail.com', 'radil123'),
(12345, 'kisha', 'perera', 'male', 45, '57141108V', 'colombo', 'kisha@gmail.com', 'kisha123'),
(18063, 'kethaki', 'perera', 'female', 24, '51478541V', 'kadawatha', 'kethaki@gmail.com', 'kethaki123'),
(18064, 'devinda', 'rajapaksha', 'male', 23, '990141182V', 'Kottawa', 'devinda@gmail.com', 'devinda123'),
(21345, 'sachintha', 'bandara', 'male', 28, '99324512V', 'pathiragoda', 'sachintha@gmail.com', 'sachintha123'),
(18054906, 'rahal', 'sandeepa', 'male', 23, '990141193V', 'maharagama', 'lassa@gmail.com', 'lasan123'),
(18064031, 'saman', 'perera', 'male', 25, '970141139V', 'maaragama', 'saman@gmail.com', 'samanp'),
(18064032, 'amal', 'perera', 'male', 43, '98263632V', 'maharagama', 'amal@gmail.com', 'amal123');

-- --------------------------------------------------------

--
-- Table structure for table `patient_phoneno`
--

CREATE TABLE `patient_phoneno` (
  `pPId` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `patientId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD PRIMARY KEY (`appoinmentId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `paymentId` (`paymentId`),
  ADD KEY `docId` (`docId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docId`);

--
-- Indexes for table `doc_phoneno`
--
ALTER TABLE `doc_phoneno`
  ADD PRIMARY KEY (`dPId`),
  ADD KEY `docId` (`docId`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalId`);

--
-- Indexes for table `hospitaldoctor`
--
ALTER TABLE `hospitaldoctor`
  ADD PRIMARY KEY (`docId`,`hospitalId`),
  ADD KEY `docId` (`docId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `host_phoneno`
--
ALTER TABLE `host_phoneno`
  ADD PRIMARY KEY (`hPId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `laboratoryreport`
--
ALTER TABLE `laboratoryreport`
  ADD PRIMARY KEY (`labId`),
  ADD KEY `patientId` (`patientId`),
  ADD KEY `hospitalId` (`hospitalId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`);

--
-- Indexes for table `patient_phoneno`
--
ALTER TABLE `patient_phoneno`
  ADD PRIMARY KEY (`pPId`),
  ADD KEY `patientId` (`patientId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appoinment`
--
ALTER TABLE `appoinment`
  MODIFY `appoinmentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doc_phoneno`
--
ALTER TABLE `doc_phoneno`
  MODIFY `dPId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18064034;

--
-- AUTO_INCREMENT for table `host_phoneno`
--
ALTER TABLE `host_phoneno`
  MODIFY `hPId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laboratoryreport`
--
ALTER TABLE `laboratoryreport`
  MODIFY `labId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18064033;

--
-- AUTO_INCREMENT for table `patient_phoneno`
--
ALTER TABLE `patient_phoneno`
  MODIFY `pPId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appoinment`
--
ALTER TABLE `appoinment`
  ADD CONSTRAINT `FK_appoinment_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`),
  ADD CONSTRAINT `FK_appoinment_2` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`paymentId`),
  ADD CONSTRAINT `FK_appoinment_3` FOREIGN KEY (`docId`) REFERENCES `doctor` (`docId`),
  ADD CONSTRAINT `FK_appoinment_4` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`);

--
-- Constraints for table `doc_phoneno`
--
ALTER TABLE `doc_phoneno`
  ADD CONSTRAINT `FK_doc_phoneno_1` FOREIGN KEY (`docId`) REFERENCES `doctor` (`docId`);

--
-- Constraints for table `hospitaldoctor`
--
ALTER TABLE `hospitaldoctor`
  ADD CONSTRAINT `FK_hospitaldoctor_1` FOREIGN KEY (`docId`) REFERENCES `doctor` (`docId`),
  ADD CONSTRAINT `FK_hospitaldoctor_2` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`);

--
-- Constraints for table `host_phoneno`
--
ALTER TABLE `host_phoneno`
  ADD CONSTRAINT `FK_host_phoneno_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`);

--
-- Constraints for table `laboratoryreport`
--
ALTER TABLE `laboratoryreport`
  ADD CONSTRAINT `FK_laboratoryreport_1` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`),
  ADD CONSTRAINT `FK_laboratoryreport_2` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);

--
-- Constraints for table `patient_phoneno`
--
ALTER TABLE `patient_phoneno`
  ADD CONSTRAINT `FK_patient_phoneno_1` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
