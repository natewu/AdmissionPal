-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2021 at 11:42 PM
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

DROP TABLE `majors`;
DROP TABLE `major_names`;
DROP TABLE `universities`;

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
(6, 1, 2, '95.5%', 'Average taken from 2020 cutoff (minimum grade),Required Courses:,English Language Arts 30-1,Mathematics 30-1 OR 31,Physics 30,Chemistry 30,An approved (academic) course'),
(7, 2, 2, '92%', 'Average taken from 2020 cutoff (minimum grade),Required courses:,English Language Arts 30-1,Mathematics 30-1 OR 31,Two of Physics 30/Chemistry 30/Biology 30,An approved (academic) course'),
(8, 3, 2, '0', ''),
(9, 4, 2, '0', ''),
(10, 5, 2, '0', ''),
(11, 1, 3, '75-85%', 'Course Requirements:,Mathematics 30-1,Chemistry 30,Physics 30,Biology 30 OR Math 31,An approved course,Math 31 and English 30-1 Recommended'),
(12, 2, 3, '85-88%', 'Course Requirements:,Mathematics 30-1,Mathematics 31,Three approved courses,English 30-1 Recommended'),
(13, 3, 3, '0', ''),
(14, 4, 3, '0', ''),
(15, 5, 3, '0', ''),
(16, 1, 4, 'N/A', 'MRU does not currently offer engineering degrees'),
(17, 2, 4, '80-90%', 'Required courses: English 30-1,Mathematics 30-1,Three other approved 30 level courses'),
(18, 3, 4, '0', ''),
(19, 4, 4, '0', ''),
(20, 5, 4, '0', ''),
(21, 1, 5, 'N/A', 'U of T does not offer software engineering but does offer computer engineering'),
(22, 2, 5, '90%', 'Approximate Admission Range: Low 90s,There is a written component to the U of C computer science application,Required Courses:,English Language Arts 30-1,Mathematics 31,Three other approved courses'),
(23, 3, 5, '0', ''),
(24, 4, 5, '0', ''),
(25, 5, 5, '0', ''),
(26, 1, 6, '95%*', 'Half of students with a 95% average were accepted into software engineering at Waterloo,Required Courses:,Mathematics 30-1,Mathematics 31,Chemistry 30,Physics 30,English Language Arts 30-1'),
(27, 2, 6, '90%*', 'From the low 90s students are individually selected based on their application,Required Courses:,Mathematics 30-1,Mathematics 31,English Language Arts 30-1'),
(28, 3, 6, '0', ''),
(29, 4, 6, '0', ''),
(30, 5, 6, '0', ''),
(31, 1, 7, '80%*', 'Cut-off is \"low 80s\" for engineering,Required Courses:,Mathematics 30-1,Mathematics 31,Chemistry 30,Physics 30,English Language Arts 30-1'),
(32, 2, 7, '80%*', 'Cut-off is \"low 80s\",Bachelor of Arts (BA) and Science (BSc) both offered,BA Requirements:,English Language Arts 30-1,Math 30-1 or Math 30-1,Math 31 Recommended,BSc Requirements:,English Language Arts 30-1,Chemistry 30 OR Physics 30,Math 30-1 or Math 30-2,Math 31 Recommended'),
(33, 3, 7, '0', ''),
(34, 4, 7, '0', ''),
(35, 5, 7, '0', ''),
(36, 1, 8, '75%', ''),
(37, 2, 8, '75%', ''),
(38, 3, 8, '0', ''),
(39, 4, 8, '0', ''),
(40, 5, 8, '0', ''),
(41, 1, 9, '89%', ''),
(42, 2, 9, '85-90%', ''),
(43, 3, 9, '0', ''),
(44, 4, 9, '0', ''),
(45, 5, 9, '0', ''),
(46, 1, 10, '80-85%', ''),
(47, 2, 10, '75-84%', ''),
(48, 3, 10, '0', ''),
(49, 4, 10, '0', ''),
(50, 5, 10, '0', ''),
(51, 1, 11, '90%', ''),
(52, 2, 11, '84%', ''),
(53, 3, 11, '0', ''),
(54, 4, 11, '0', ''),
(55, 5, 11, '0', ''),
(56, 1, 12, '85%', ''),
(57, 2, 12, '70%', ''),
(58, 3, 12, '0', ''),
(59, 4, 12, '0', ''),
(60, 5, 12, '0', ''),
(61, 1, 13, '85%', ''),
(62, 2, 13, '86%', ''),
(63, 3, 13, '0', ''),
(64, 4, 13, '0', ''),
(65, 5, 13, '0', ''),
(66, 1, 14, '87%', ''),
(67, 2, 14, '83.5%', ''),
(68, 3, 14, '0', ''),
(69, 4, 14, '0', ''),
(70, 5, 14, '0', ''),
(71, 1, 15, '', ''),
(72, 2, 15, '70%', ''),
(73, 3, 15, '0', ''),
(74, 4, 15, '0', ''),
(75, 5, 15, '0', ''),
(76, 1, 16, '80-85%', ''),
(77, 2, 16, '70-90%', ''),
(78, 3, 16, '0', ''),
(79, 4, 16, '0', ''),
(80, 5, 16, '0', ''),
(81, 1, 17, '83-85%', ''),
(82, 2, 17, '80-85%', ''),
(83, 3, 17, '0', ''),
(84, 4, 17, '0', ''),
(85, 5, 17, '0', ''),
(86, 1, 18, '70%', ''),
(87, 2, 18, '70%', ''),
(88, 3, 18, '0', ''),
(89, 4, 18, '0', ''),
(90, 5, 18, '0', ''),
(91, 1, 19, '75%', ''),
(92, 2, 19, '75%', ''),
(93, 3, 19, '0', ''),
(94, 4, 19, '0', ''),
(95, 5, 19, '0', ''),
(96, 1, 20, '70-90%', ''),
(97, 2, 20, '70%', ''),
(98, 3, 20, '0', ''),
(99, 4, 20, '0', ''),
(100, 5, 20, '0', ''),
(101, 1, 21, '88-90%', ''),
(102, 2, 21, '72-90%', ''),
(103, 3, 21, '0', ''),
(104, 4, 21, '0', ''),
(105, 5, 21, '0', ''),
(106, 1, 22, '86%', ''),
(107, 2, 22, '85%', ''),
(108, 3, 22, '0', ''),
(109, 4, 22, '0', ''),
(110, 5, 22, '0', ''),
(111, 1, 23, '84%', ''),
(112, 2, 23, '82%', ''),
(113, 3, 23, '0', ''),
(114, 4, 23, '0', ''),
(115, 5, 23, '0', ''),
(116, 1, 24, '', ''),
(117, 2, 24, '74-91%', ''),
(118, 3, 24, '0', ''),
(119, 4, 24, '0', ''),
(120, 5, 24, '0', ''),
(121, 1, 25, '74%', ''),
(122, 2, 25, '70%', ''),
(123, 3, 25, '0', ''),
(124, 4, 25, '0', ''),
(125, 5, 25, '0', ''),
(126, 1, 26, '70%', ''),
(127, 2, 26, '70%', ''),
(128, 3, 26, '0', ''),
(129, 4, 26, '0', ''),
(130, 5, 26, '0', ''),
(131, 1, 27, '', ''),
(132, 2, 27, '75%', ''),
(133, 3, 27, '0', ''),
(134, 4, 27, '0', ''),
(135, 5, 27, '0', ''),
(136, 1, 28, '', ''),
(137, 2, 28, '60%', ''),
(138, 3, 28, '0', ''),
(139, 4, 28, '0', ''),
(140, 5, 28, '0', ''),
(141, 1, 29, '65%', ''),
(142, 2, 29, '65%', ''),
(143, 3, 29, '0', ''),
(144, 4, 29, '0', ''),
(145, 5, 29, '0', ''),
(146, 1, 30, '70%', ''),
(147, 2, 30, '70%', ''),
(148, 3, 30, '0', ''),
(149, 4, 30, '0', ''),
(150, 5, 30, '0', ''),
(151, 1, 31, '72-80%', ''),
(152, 2, 31, '72%', ''),
(153, 3, 31, '0', ''),
(154, 4, 31, '0', ''),
(155, 5, 31, '0', ''),
(156, 1, 32, '', ''),
(157, 2, 32, '65%', ''),
(158, 3, 32, '0', ''),
(159, 4, 32, '0', ''),
(160, 5, 32, '0', ''),
(161, 1, 33, '68.5%', ''),
(162, 2, 33, '73%', ''),
(163, 3, 33, '0', ''),
(164, 4, 33, '0', ''),
(165, 5, 33, '0', ''),
(166, 1, 34, '', ''),
(167, 2, 34, '73.5%', ''),
(168, 3, 34, '0', ''),
(169, 4, 34, '0', ''),
(170, 5, 34, '0', ''),
(171, 1, 35, '', ''),
(172, 2, 35, '71%', ''),
(173, 3, 35, '0', ''),
(174, 4, 35, '0', ''),
(175, 5, 35, '0', ''),
(176, 1, 36, '', ''),
(177, 2, 36, '70%', ''),
(178, 3, 36, '0', ''),
(179, 4, 36, '0', ''),
(180, 5, 36, '0', ''),
(181, 1, 37, '70%', ''),
(182, 2, 37, '70%', ''),
(183, 3, 37, '0', ''),
(184, 4, 37, '0', ''),
(185, 5, 37, '0', ''),
(186, 1, 38, '71.0%', ''),
(187, 2, 38, '70%', ''),
(188, 3, 38, '0', ''),
(189, 4, 38, '0', ''),
(190, 5, 38, '0', ''),
(191, 1, 39, '', ''),
(192, 2, 39, '70%', ''),
(193, 3, 39, '0', ''),
(194, 4, 39, '0', ''),
(195, 5, 39, '0', ''),
(196, 1, 40, '75%', ''),
(197, 2, 40, '67%', ''),
(198, 3, 40, '0', ''),
(199, 4, 40, '0', ''),
(200, 5, 40, '0', ''),
(201, 1, 41, '80-85%', ''),
(202, 2, 41, '70-80%', ''),
(203, 3, 41, '0', ''),
(204, 4, 41, '0', ''),
(205, 5, 41, '0', ''),
(206, 1, 42, '74%', ''),
(207, 2, 42, '70%', ''),
(208, 3, 42, '0', ''),
(209, 4, 42, '0', ''),
(210, 5, 42, '0', ''),
(211, 1, 43, '', ''),
(212, 2, 43, '54%', ''),
(213, 3, 43, '0', ''),
(214, 4, 43, '0', ''),
(215, 5, 43, '0', ''),
(216, 1, 44, '65%', ''),
(217, 2, 44, '65%', ''),
(218, 3, 44, '0', ''),
(219, 4, 44, '0', ''),
(220, 5, 44, '0', ''),
(221, 1, 45, '73%', ''),
(222, 2, 45, '70%', ''),
(223, 3, 45, '0', ''),
(224, 4, 45, '0', ''),
(225, 5, 45, '0', ''),
(226, 1, 46, '75%', ''),
(227, 2, 46, '65%', ''),
(228, 3, 46, '0', ''),
(229, 4, 46, '0', ''),
(230, 5, 46, '0', '');


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
(1, 'University of Calgary', 'Average calculated from Top 5 approved 30 level courses including program prerequisites,Admission is solely marks-based'),
(2, 'McGill University', 'Average calculated from Top 5 approved 30 level courses including program prerequisites,Admission is solely marks-based'),
(3, 'Carleton University', 'Grade ranges apply to the overall and prerequisite average.'),
(4, 'Mount Royal University', 'Average calculated from top 2 Group A subjects'),
(5, 'University of Toronto', 'Average calculated from Top 5 approved 30 level courses'),
(6, 'University of Waterloo', 'Average calculated from Top 5 approved 30 level courses,Admission is holistic'),
(7, 'York University', 'Average calculated from Top 5 approved 30 level courses'),
(8, 'Dalhousie University', ''),
(9, 'McMaster University', ''),
(10, 'University of Ottawa', ''),
(11, 'Queens University', ''),
(12, 'University of Saskatchewan', ''),
(13, 'University of British Columbia', ''),
(14, 'Western University', ''),
(15, 'Brock University', ''),
(16, 'Concordia University', ''),
(17, 'University of Guelph', ''),
(18, 'Memorial University', ''),
(19, 'University of New Brunswick', ''),
(20, 'University of Regina', ''),
(21, 'Ryerson University', ''),
(22, 'Simon Fraser University', ''),
(23, 'University of Victoria', ''),
(24, 'Wilfred Laurier University', ''),
(25, 'University of Windsor', ''),
(26, 'Acadia University', ''),
(27, 'Bishops University', ''),
(28, 'Brandon University', ''),
(29, 'Cape Breton University', ''),
(30, 'Lakehead University', ''),
(31, 'Laurentian University', ''),
(32, 'University of Lethbridge', ''),
(33, 'University of Moncton', ''),
(34, 'Mount Allison University', ''),
(35, 'Mount Saint Vincent University', ''),
(36, 'Nipissing University', ''),
(37, 'Saint Marys University', ''),
(38, 'St. Francis Xavier University', ''),
(39, 'Trent University', ''),
(40, 'UNBC', ''),
(41, 'UOIT', ''),
(42, 'UPEI', ''),
(43, 'University of Winnipeg', ''),
(44, 'Algoma University', ''),
(45, 'Fraser Valley', ''),
(46, 'MacEwan University', '');

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
  MODIFY `Major_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `major_names`
--
ALTER TABLE `major_names`
  MODIFY `Name_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `Uni_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `majors`
--
ALTER TABLE `majors`
  ADD CONSTRAINT `majors_ibfk_1` FOREIGN KEY (`Name_ID`) REFERENCES `major_names` (`Name_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `majors_ibfk_2` FOREIGN KEY (`Uni_ID`) REFERENCES `universities` (`Uni_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
