-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2021 at 03:17 PM
-- Server version: 5.5.45
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admissionpal_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `Major_ID` int(11) NOT NULL,
  `Name_ID` int(11) NOT NULL,
  `Uni_ID` int(11) NOT NULL,
  `Admission_Avg` char(10) NOT NULL,
  `Extra_Info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`Major_ID`, `Name_ID`, `Uni_ID`, `Admission_Avg`, `Extra_Info`) VALUES
(1, 1, 1, '85%*', 'Competitive admission average:,\"Mid 80s ( High 80s without Calculus)\",Required Courses:,English Language Arts 30-1,Mathematics 30-1,Mathematics 31,Chemistry 30,Physics 30 or Biology 30'),
(2, 2, 1, '87%*', 'Competitive admission average:,\"High 80s\",Required Courses:,English Language Arts 30-1,Mathematics 30-1,Two of: Biology 30/Chemistry 30/Physics 30/Mathematics 31 or CTS Computer Science Advanced 5-credits,An approved course or option'),
(3, 3, 1, '0', ''),
(4, 4, 1, '0', ''),
(5, 5, 1, '0', ''),
(8, 1, 2, '95.5%', 'Average taken from 2020 cutoff (minimum grade),Required Courses:,English Language Arts 30-1,Mathematics 30-1 OR 31,Physics 30,Chemistry 30,An approved (academic) course'),
(9, 2, 2, '92%', 'Average taken from 2020 cutoff (minimum grade),Required courses:,English Language Arts 30-1,Mathematics 30-1 OR 31,Two of Physics 30/Chemistry 30/Biology 30,An approved (academic) course'),
(10, 3, 2, '0', ''),
(11, 4, 2, '0', ''),
(12, 5, 2, '0', ''),
(15, 1, 3, '75-85%', 'Course Requirements:,Mathematics 30-1,Chemistry 30,Physics 30,Biology 30 OR Math 31,An approved course,Math 31 and English 30-1 Recommended'),
(16, 2, 3, '85-88%', 'Course Requirements:,Mathematics 30-1,Mathematics 31,Three approved courses,English 30-1 Recommended'),
(17, 3, 3, '0', ''),
(18, 4, 3, '0', ''),
(19, 5, 3, '0', ''),
(22, 1, 4, 'N/A', 'MRU does not currently offer engineering degrees'),
(23, 2, 4, '80-90%', 'Required courses: English 30-1,Mathematics 30-1,Three other approved 30 level courses'),
(24, 3, 4, '0', ''),
(25, 4, 4, '0', ''),
(26, 5, 4, '0', ''),
(29, 1, 5, 'N/A', 'U of T does not offer software engineering but does offer computer engineering'),
(30, 2, 5, '90%', 'Approximate Admission Range: Low 90s,There is a written component to the U of C computer science application,Required Courses:,English Language Arts 30-1,Mathematics 31,Three other approved courses'),
(31, 3, 5, '0', ''),
(32, 4, 5, '0', ''),
(33, 5, 5, '0', '');

-- --------------------------------------------------------

--
-- Table structure for table `major_names`
--

CREATE TABLE `major_names` (
  `Name_ID` int(11) NOT NULL,
  `Major_Name` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `major_names`
--

INSERT INTO `major_names` (`Name_ID`, `Major_Name`) VALUES
(1, 'Software Engineering'),
(2, 'Computer Science'),
(3, 'Mathematics'),
(4, 'English'),
(5, 'Psychology');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `Uni_ID` int(11) NOT NULL,
  `Uni_Name` char(50) NOT NULL,
  `Uni_Info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`Uni_ID`, `Uni_Name`, `Uni_Info`) VALUES
(1, 'University of Calgary', 'Average calculated from Top 5 approved 30 level courses including program prerequisites'),
(2, 'McGill University', 'Average calculated from Top 5 approved 30 level courses including program prerequisites'),
(3, 'Carleton University', 'Grade ranges apply to the overall and prerequisite average.'),
(4, 'Mount Royal University', 'Average calculated from top 2 Group A subjects'),
(5, 'University of Toronto', 'Average calculated from Top 5 approved 30 level courses');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`Major_ID`),
  ADD KEY `majors_ibfk_1` (`Name_ID`),
  ADD KEY `majors_ibfk_2` (`Uni_ID`);

--
-- Indexes for table `major_names`
--
ALTER TABLE `major_names`
  ADD PRIMARY KEY (`Name_ID`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`Uni_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `Major_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `major_names`
--
ALTER TABLE `major_names`
  MODIFY `Name_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `Uni_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `majors`
--
ALTER TABLE `majors`
  ADD CONSTRAINT `majors_ibfk_2` FOREIGN KEY (`Uni_ID`) REFERENCES `universities` (`Uni_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `majors_ibfk_1` FOREIGN KEY (`Name_ID`) REFERENCES `major_names` (`Name_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
