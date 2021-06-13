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
(1, 1, 1, '85%*', 'Competitive admission average: \"Mid 80s ( High 80s without Calculus)\". English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Chemistry 30, Physics 30 or Biology 30'),
(2, 2, 1, '87%*', 'Competitive admission average: \"High 80s\". English Language Arts 30-1, Mathematics 30-1, Two of: Biology 30/Chemistry 30/Physics 30/Mathematics 31 or CTS Computer Science Advanced 5-credits'),
(3, 3, 1, '0', ''),
(4, 4, 1, '0', ''),
(5, 5, 1, '0', ''),
(6, 6, 1, '85%*', 'Competitive admission average: \"Mid 80s\". English Language Arts 30-1, Mathematics 30-1'),
(7, 7, 1, '75%*', 'Competitive admission average: \"Mid 70s\". English Language Arts 30-1'),
(8, 1, 2, '95.5%', 'English Language Arts 30-1, Mathematics 30-1 OR 31, Physics 30, Chemistry 30'),
(9, 2, 2, '92%', 'English Language Arts 30-1, Mathematics 30-1 OR 31, Two of Physics 30/Chemistry 30/Biology 30'),
(10, 3, 2, '0', ''),
(11, 4, 2, '0', ''),
(12, 5, 2, '0', ''),
(13, 6, 2, '93%', 'English Language Arts 30-1, Mathematics 30-1 OR 31'),
(14, 7, 2, '86.8%', 'English Language Arts 30-1'),
(15, 1, 3, '75-85%', 'Mathematics 30-1, Chemistry 30,Physics 30,Biology 30 OR Math 31,An approved course,Math 31 and English 30-1 Recommended'),
(16, 2, 3, '85-88%', 'Mathematics 30-1, Mathematics 31, English 30-1 Recommended'),
(17, 3, 3, '0', ''),
(18, 4, 3, '0', ''),
(19, 5, 3, '0', ''),
(20, 6, 3, '80%', 'English Language Arts 30-1'),
(21, 7, 3, '78%', 'English Language Arts 30-1'),
(22, 1, 4, 'N/A', 'MRU does not currently offer engineering degrees'),
(23, 2, 4, '80-90%', 'English 30-1, Mathematics 30-1'),
(24, 3, 4, '0', ''),
(25, 4, 4, '0', ''),
(26, 5, 4, '0', ''),
(28, 6, 4, '0', ''),
(29, 7, 4, '0', ''),
(30, 1, 5, 'N/A', 'U of T does not offer software engineering but does offer computer engineering'),
(31, 2, 5, '90%', 'Approximate Admission Range: Low 90s. There is a written component to the U of C computer science application. English Language Arts 30-1, Mathematics 31, Three other approved courses'),
(32, 3, 5, '0', ''),
(33, 4, 5, '0', ''),
(34, 5, 5, '0', ''),
(35, 6, 5, '83-88%', 'English Language Arts 30-1'),
(36, 7, 5, '75-84%', 'English Language Arts 30-1'),
(37, 1, 6, '95%*', 'Half of students with a 95% average were accepted into software engineering at Waterloo. Mathematics 30-1, Mathematics 31, Chemistry 30, Physics 30, English Language Arts 30-1'),
(38, 2, 6, '90%*', 'From the low 90s, students are individually selected based on their application. Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(39, 3, 6, '0', ''),
(40, 4, 6, '0', ''),
(41, 5, 6, '0', ''),
(42, 6, 6, '80%-92%', 'English Language Arts 30-1'),
(43, 7, 6, '80%', 'English Language Arts 30-1'),
(44, 1, 7, '80%*', 'Cut-off is \"low 80s\" for engineering. Required Courses:,Mathematics 30-1,Mathematics 31,Chemistry 30,Physics 30,English Language Arts 30-1'),
(45, 2, 7, '80%*', 'Cut-off is \"low 80s\". Bachelor of Arts (BA) and Science (BSc) both offered. BA Requirements: English Language Arts 30-1, Math 30-1 or Math 30-1, Math 31 Recommended. BSc Requirements: English Language Arts 30-1, Chemistry 30 OR Physics 30, Math 30-1 or Math 30-2, Math 31 Recommended'),
(46, 3, 7, '0', ''),
(47, 4, 7, '0', ''),
(48, 5, 7, '0', ''),
(49, 6, 7, '90%', 'English Language Arts 30-1'),
(50, 7, 7, '75%', 'English Language Arts 30-1'),
(51, 1, 8, '75%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(52, 2, 8, '75%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(53, 3, 8, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(54, 4, 8, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(55, 5, 8, '0', 'English Language Arts 30-1'),
(56, 6, 8, '78%', 'English Language Arts 30-1'),
(57, 7, 8, '70%', 'English Language Arts 30-1'),
(58, 1, 9, '89%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(59, 2, 9, '85-90%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(60, 3, 9, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(61, 4, 9, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(62, 5, 9, '0', 'English Language Arts 30-1'),
(63, 6, 9, '82.5%', 'English Language Arts 30-1'),
(64, 7, 9, '75%', 'English Language Arts 30-1'),
(65, 1, 10, '80-85%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(66, 2, 10, '75-84%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(67, 3, 10, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(68, 4, 10, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(69, 5, 10, '0', 'English Language Arts 30-1'),
(70, 6, 10, '75-85%', 'English Language Arts 30-1'),
(71, 7, 10, '73-78%', 'English Language Arts 30-1'),
(72, 1, 11, '90%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(73, 2, 11, '84%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(74, 3, 11, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(75, 4, 11, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(76, 5, 11, '0', 'English Language Arts 30-1'),
(77, 6, 11, '87%', 'English Language Arts 30-1'),
(78, 7, 11, '80%', 'English Language Arts 30-1'),
(79, 1, 12, '85%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(80, 2, 12, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(81, 3, 12, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(82, 4, 12, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(83, 5, 12, '0', 'English Language Arts 30-1'),
(84, 6, 12, '83%', 'English Language Arts 30-1'),
(85, 7, 12, '70%', 'English Language Arts 30-1'),
(86, 1, 13, '85%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(87, 2, 13, '86%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(88, 3, 13, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(89, 4, 13, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(90, 5, 13, '0', 'English Language Arts 30-1'),
(91, 6, 13, '84%', 'English Language Arts 30-1'),
(92, 7, 13, '75%', 'English Language Arts 30-1'),
(93, 1, 14, '87%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(94, 2, 14, '83.5%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(95, 3, 14, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(96, 4, 14, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(97, 5, 14, '0', 'English Language Arts 30-1'),
(98, 6, 14, '87.5%', 'English Language Arts 30-1'),
(99, 7, 14, '83.5%', 'English Language Arts 30-1'),
(100, 1, 15, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(101, 2, 15, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(102, 3, 15, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(103, 4, 15, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(104, 5, 15, '0', 'English Language Arts 30-1'),
(105, 6, 15, '84%', 'English Language Arts 30-1'),
(106, 7, 15, '70%', 'English Language Arts 30-1'),
(107, 1, 16, '80-85%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(108, 2, 16, '70-90%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(109, 3, 16, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(110, 4, 16, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(111, 5, 16, '0', 'English Language Arts 30-1'),
(112, 6, 16, '80%', 'English Language Arts 30-1'),
(113, 7, 16, '70-90%', 'English Language Arts 30-1'),
(114, 1, 17, '83-85%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(115, 2, 17, '80-85%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(116, 3, 17, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(117, 4, 17, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(118, 5, 17, '0', 'English Language Arts 30-1'),
(119, 6, 17, '78-84%', 'English Language Arts 30-1'),
(120, 7, 17, '78-84%', 'English Language Arts 30-1'),
(121, 1, 18, '70%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(122, 2, 18, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(123, 3, 18, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(124, 4, 18, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(125, 5, 18, '0', 'English Language Arts 30-1'),
(126, 6, 18, '70%', 'English Language Arts 30-1'),
(127, 7, 18, '70%', 'English Language Arts 30-1'),
(128, 1, 19, '75%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(129, 2, 19, '75%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(130, 3, 19, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(131, 4, 19, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(132, 5, 19, '0', 'English Language Arts 30-1'),
(133, 6, 19, '75%', 'English Language Arts 30-1'),
(134, 7, 19, '65%', 'English Language Arts 30-1'),
(135, 1, 20, '70-90%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(136, 2, 20, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(137, 3, 20, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(138, 4, 20, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(139, 5, 20, '0', 'English Language Arts 30-1'),
(140, 6, 20, '85%', 'English Language Arts 30-1'),
(141, 7, 20, '65%', 'English Language Arts 30-1'),
(142, 1, 21, '88-90%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(143, 2, 21, '72-90%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(144, 3, 21, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(145, 4, 21, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(146, 5, 21, '0', 'English Language Arts 30-1'),
(147, 6, 21, '72-85%', 'English Language Arts 30-1'),
(148, 7, 21, '73-88%', 'English Language Arts 30-1'),
(149, 1, 22, '86%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(150, 2, 22, '85%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(151, 3, 22, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(152, 4, 22, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(153, 5, 22, '0', 'English Language Arts 30-1'),
(154, 6, 22, '83%', 'English Language Arts 30-1'),
(155, 7, 22, '80%', 'English Language Arts 30-1'),
(156, 1, 23, '84%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(157, 2, 23, '82%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(158, 3, 23, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(159, 4, 23, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(160, 5, 23, '0', 'English Language Arts 30-1'),
(161, 6, 23, '80%', 'English Language Arts 30-1'),
(162, 7, 23, '77%', 'English Language Arts 30-1'),
(163, 1, 24, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(164, 2, 24, '74-91%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(165, 3, 24, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(166, 4, 24, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(167, 5, 24, '0', 'English Language Arts 30-1'),
(168, 6, 24, '89-93.5%', 'English Language Arts 30-1'),
(169, 7, 24, '70-86%', 'English Language Arts 30-1'),
(170, 1, 25, '74%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(171, 2, 25, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(172, 3, 25, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(173, 4, 25, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(174, 5, 25, '0', 'English Language Arts 30-1'),
(175, 6, 25, '73-78%', 'English Language Arts 30-1'),
(176, 7, 25, '70-80%', 'English Language Arts 30-1'),
(177, 1, 26, '70%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(178, 2, 26, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(179, 3, 26, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(180, 4, 26, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(181, 5, 26, '0', 'English Language Arts 30-1'),
(182, 6, 26, '70%', 'English Language Arts 30-1'),
(183, 7, 26, '70%', 'English Language Arts 30-1'),
(184, 1, 27, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(185, 2, 27, '75%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(186, 3, 27, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(187, 4, 27, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(188, 5, 27, '0', 'English Language Arts 30-1'),
(189, 6, 27, '80%', 'English Language Arts 30-1'),
(190, 7, 27, '75%', 'English Language Arts 30-1'),
(191, 1, 28, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(192, 2, 28, '60%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(193, 3, 28, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(194, 4, 28, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(195, 5, 28, '0', 'English Language Arts 30-1'),
(196, 6, 28, '60%', 'English Language Arts 30-1'),
(197, 7, 28, '60%', 'English Language Arts 30-1'),
(198, 1, 29, '65%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(199, 2, 29, '65%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(200, 3, 29, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(201, 4, 29, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(202, 5, 29, '0', 'English Language Arts 30-1'),
(203, 6, 29, '65%', 'English Language Arts 30-1'),
(204, 7, 29, '65%', 'English Language Arts 30-1'),
(205, 1, 30, '70%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(206, 2, 30, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(207, 3, 30, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(208, 4, 30, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(209, 5, 30, '0', 'English Language Arts 30-1'),
(210, 6, 30, '70%', 'English Language Arts 30-1'),
(211, 7, 30, '70%', 'English Language Arts 30-1'),
(212, 1, 31, '72-80%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(213, 2, 31, '72%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(214, 3, 31, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(215, 4, 31, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(216, 5, 31, '0', 'English Language Arts 30-1'),
(217, 6, 31, '72%', 'English Language Arts 30-1'),
(218, 7, 31, '72%', 'English Language Arts 30-1'),
(219, 1, 32, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(220, 2, 32, '65%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(221, 3, 32, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(222, 4, 32, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(223, 5, 32, '0', 'English Language Arts 30-1'),
(224, 6, 32, '65%', 'English Language Arts 30-1'),
(225, 7, 32, '65%', 'English Language Arts 30-1'),
(226, 1, 33, '68.5%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(227, 2, 33, '73%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(228, 3, 33, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(229, 4, 33, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(230, 5, 33, '0', 'English Language Arts 30-1'),
(231, 6, 33, '68%', 'English Language Arts 30-1'),
(232, 7, 33, '68.9%', 'English Language Arts 30-1'),
(233, 1, 34, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(234, 2, 34, '73.5%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(235, 3, 34, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(236, 4, 34, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(237, 5, 34, '0', 'English Language Arts 30-1'),
(238, 6, 34, '73.2%', 'English Language Arts 30-1'),
(239, 7, 34, '70.9%', 'English Language Arts 30-1'),
(240, 1, 35, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(241, 2, 35, '71%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(242, 3, 35, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(243, 4, 35, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(244, 5, 35, '0', 'English Language Arts 30-1'),
(245, 6, 35, '70.4%', 'English Language Arts 30-1'),
(246, 7, 35, '70%', 'English Language Arts 30-1'),
(247, 1, 36, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(248, 2, 36, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(249, 3, 36, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(250, 4, 36, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(251, 5, 36, '0', 'English Language Arts 30-1'),
(252, 6, 36, '70%', 'English Language Arts 30-1'),
(253, 7, 36, '70%', 'English Language Arts 30-1'),
(254, 1, 37, '70%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(255, 2, 37, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(256, 3, 37, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(257, 4, 37, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(258, 5, 37, '0', 'English Language Arts 30-1'),
(259, 6, 37, '70%', 'English Language Arts 30-1'),
(260, 7, 37, '70%', 'English Language Arts 30-1'),
(261, 1, 38, '71.0%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(262, 2, 38, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(263, 3, 38, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(264, 4, 38, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(265, 5, 38, '0', 'English Language Arts 30-1'),
(266, 6, 38, '70%', 'English Language Arts 30-1'),
(267, 7, 38, '70%', 'English Language Arts 30-1'),
(268, 1, 39, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(269, 2, 39, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(270, 3, 39, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(271, 4, 39, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(272, 5, 39, '0', 'English Language Arts 30-1'),
(273, 6, 39, '70%', 'English Language Arts 30-1'),
(274, 7, 39, '70%', 'English Language Arts 30-1'),
(275, 1, 40, '75%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(276, 2, 40, '67%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(277, 3, 40, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(278, 4, 40, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(279, 5, 40, '0', 'English Language Arts 30-1'),
(280, 6, 40, '67%', 'English Language Arts 30-1'),
(281, 7, 40, '67%', 'English Language Arts 30-1'),
(282, 1, 41, '80-85%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(283, 2, 41, '70-80%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(284, 3, 41, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(285, 4, 41, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(286, 5, 41, '0', 'English Language Arts 30-1'),
(287, 6, 41, '75-80%', 'English Language Arts 30-1'),
(288, 7, 41, '70-75%', 'English Language Arts 30-1'),
(289, 1, 42, '74%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(290, 2, 42, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(291, 3, 42, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(292, 4, 42, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(293, 5, 42, '0', 'English Language Arts 30-1'),
(294, 6, 42, '70%', 'English Language Arts 30-1'),
(295, 7, 42, '70%', 'English Language Arts 30-1'),
(296, 1, 43, '', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(297, 2, 43, '54%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(298, 3, 43, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(299, 4, 43, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(300, 5, 43, '0', 'English Language Arts 30-1'),
(301, 6, 43, '54.7%', 'English Language Arts 30-1'),
(302, 7, 43, '55.3%', 'English Language Arts 30-1'),
(303, 1, 44, '65%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(304, 2, 44, '65%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(305, 3, 44, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(306, 4, 44, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(307, 5, 44, '0', 'English Language Arts 30-1'),
(308, 6, 44, '65%', 'English Language Arts 30-1'),
(309, 7, 44, '65%', 'English Language Arts 30-1'),
(310, 1, 45, '73%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(311, 2, 45, '70%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(312, 3, 45, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(313, 4, 45, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(314, 5, 45, '0', 'English Language Arts 30-1'),
(315, 6, 45, '70%', 'English Language Arts 30-1'),
(316, 7, 45, '72%', 'English Language Arts 30-1'),
(317, 1, 46, '75%', 'Mathematics 30-1, Mathematics 31, Chemistry 30, English Language Arts 30-1, Physics 30'),
(318, 2, 46, '65%', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(319, 3, 46, '0', 'Mathematics 30-1, Mathematics 31, English Language Arts 30-1'),
(320, 4, 46, '0', 'English Language Arts 30-1, Mathematics 30-1, Mathematics 31, Physics 30'),
(321, 5, 46, '0', 'English Language Arts 30-1'),
(322, 6, 46, '65%', 'English Language Arts 30-1'),
(323, 7, 46, '65%', 'English Language Arts 30-1');


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
(5, 'Psychology'),
(6, 'Commerce'),
(7, 'Art');

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
(1, 'University of Calgary', 'Average calculated from Top 5 approved 30 level courses including program prerequisites. Admission is solely marks-based'),
(2, 'McGill University', 'Average calculated from Top 5 approved 30 level courses including program prerequisites. Admission is solely marks-based and averages taken from 2020 cutoffs (minimum grade)'),
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
