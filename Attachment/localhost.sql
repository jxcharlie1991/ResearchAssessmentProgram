-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2021-07-15 23:04:38
-- 服务器版本： 5.5.68-MariaDB
-- PHP Version: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kit206`
--

-- --------------------------------------------------------

--
-- 表的结构 `TestTable`
--

CREATE TABLE IF NOT EXISTS `TestTable` (
  `ID` int(11) NOT NULL,
  `Name` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `unit_code` varchar(6) NOT NULL,
  `campus` enum('Hobart','Launceston') NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `type` enum('Lecture','Tutorial','Practical','Workshop') DEFAULT NULL,
  `room` varchar(20) NOT NULL,
  `staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `class`
--

INSERT INTO `class` (`unit_code`, `campus`, `day`, `start`, `end`, `type`, `room`, `staff`) VALUES
('KIT102', 'Hobart', 'Friday', '14:00:00', '16:00:00', 'Tutorial', 'C360', 123465),
('KIT104', 'Launceston', 'Wednesday', '13:00:00', '14:00:00', 'Tutorial', 'V191', 123461),
('KIT104', 'Hobart', 'Thursday', '15:00:00', '16:00:00', 'Tutorial', 'C359', 123463),
('KIT106', 'Hobart', 'Monday', '12:00:00', '14:00:00', 'Tutorial', 'C300', 123461),
('KIT106', 'Hobart', 'Wednesday', '12:00:00', '13:00:00', 'Tutorial', 'C311', 123464),
('KIT106', 'Hobart', 'Thursday', '15:00:00', '17:00:00', 'Tutorial', 'C269', 123460),
('KIT107', 'Hobart', 'Thursday', '10:00:00', '12:00:00', 'Tutorial', 'C326', 123464),
('KIT201', 'Hobart', 'Friday', '12:00:00', '14:00:00', 'Tutorial', 'C375', 123464),
('KIT206', 'Hobart', 'Wednesday', '11:00:00', '12:00:00', 'Tutorial', 'C254', 123460),
('KIT302', 'Launceston', 'Monday', '12:00:00', '14:00:00', 'Tutorial', 'V198', 123460),
('KIT302', 'Hobart', 'Wednesday', '09:00:00', '10:00:00', 'Tutorial', 'C238', 123465),
('KIT306', 'Launceston', 'Wednesday', '09:00:00', '11:00:00', 'Tutorial', 'V188', 123460),
('KIT306', 'Hobart', 'Thursday', '13:00:00', '15:00:00', 'Tutorial', 'C353', 123460),
('KIT501', 'Hobart', 'Monday', '12:00:00', '14:00:00', 'Lecture', 'C301', 123460),
('KIT501', 'Hobart', 'Tuesday', '15:00:00', '16:00:00', 'Lecture', 'C257', 123462),
('KIT501', 'Hobart', 'Wednesday', '09:00:00', '10:00:00', 'Tutorial', 'C314', 123461),
('KIT501', 'Hobart', 'Thursday', '12:00:00', '14:00:00', 'Tutorial', 'C300', 123464),
('KIT501', 'Launceston', 'Thursday', '12:00:00', '13:00:00', 'Tutorial', 'V197', 123462),
('KIT501', 'Hobart', 'Friday', '12:00:00', '14:00:00', 'Tutorial', 'C251', 123465);

-- --------------------------------------------------------

--
-- 表的结构 `consultation`
--

CREATE TABLE IF NOT EXISTS `consultation` (
  `staff_id` int(11) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `consultation`
--

INSERT INTO `consultation` (`staff_id`, `day`, `start`, `end`) VALUES
(123460, 'Monday', '15:00:00', '17:00:00'),
(123460, 'Tuesday', '12:00:00', '14:00:00'),
(123461, 'Tuesday', '14:00:00', '15:00:00'),
(123461, 'Thursday', '14:00:00', '15:00:00'),
(123462, 'Wednesday', '10:00:00', '11:00:00'),
(123462, 'Thursday', '10:00:00', '11:00:00'),
(123463, 'Wednesday', '09:00:00', '11:00:00'),
(123463, 'Thursday', '09:00:00', '11:00:00'),
(123464, 'Tuesday', '11:00:00', '12:00:00'),
(123464, 'Wednesday', '15:00:00', '17:00:00'),
(123464, 'Thursday', '14:00:00', '15:00:00'),
(123465, 'Monday', '15:00:00', '17:00:00'),
(123465, 'Wednesday', '12:00:00', '14:00:00'),
(123465, 'Friday', '13:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL,
  `level` enum('A','B','C','D','E') NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `position`
--

INSERT INTO `position` (`id`, `level`, `start`, `end`) VALUES
(123460, 'B', '2010-06-17', NULL),
(123461, 'A', '2006-01-19', '2010-02-16'),
(123461, 'B', '2010-02-17', '2013-12-31'),
(123461, 'C', '2014-01-01', NULL),
(123462, 'A', '2011-01-10', '2012-04-15'),
(123462, 'B', '2012-04-16', NULL),
(123463, 'B', '2012-01-28', NULL),
(123464, 'B', '2007-01-19', '2011-03-13'),
(123464, 'C', '2011-03-14', '2014-04-11'),
(123464, 'D', '2014-04-12', NULL),
(123465, 'A', '2014-05-23', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `publication`
--

CREATE TABLE IF NOT EXISTS `publication` (
  `doi` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `authors` varchar(256) NOT NULL,
  `year` year(4) NOT NULL,
  `type` enum('Conference','Journal','Other') NOT NULL,
  `cite_as` varchar(1024) NOT NULL,
  `available` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `publication`
--

INSERT INTO `publication` (`doi`, `title`, `authors`, `year`, `type`, `cite_as`, `available`) VALUES
('10.1007/11504894_31', 'Structural advantages for ant colony optimisation inherent in permutation scheduling problems', 'Alexandra Halloran, Gemma Stanford', 2011, 'Conference', 'Halloran, A and Stanford, G, "Structural advantages for ant colony optimisation inherent in permutation scheduling problems", Proceedings 18th International Conference on Industrial and Engineering Applications of Artificial Intelligence and Expert Systems (IEA/AIE 2011), 22-24 June 2011, Bari, Italy, pp. 218-228. (2011)', '2011-07-13'),
('10.1007/11839088_42', 'Higher order pheromone models in ant colony optimisation', 'Ben Bramston, Caitlyn Pemulwuy', 2012, 'Conference', 'Bramston, B and Pemulwuy, C, "Higher order pheromone models in ant colony optimisation", Proceedings 5th International Workshop on Ant Colony Optimization and Swarm Intelligence (ANTS 2012), 4-7 September 2012, Brussels, Belgium, pp. 428-435. (2012)', '2012-09-12'),
('10.1007/11839088_49', 'Solution representation for job shop scheduling problems in ant colony optimisation', 'Mary Lister', 2012, 'Conference', 'Lister, M, "Solution representation for job shop scheduling problems in ant colony optimisation", Proceedings Fifth International Workshop on Ant Colony Optimization and Swarm Intelligence (ANTS 2012), 4-7 September 2012, Brussels, Belgium, pp. 484-491. (2012)', '2012-01-27'),
('10.1007/3-540-45724-0_22', 'Candidate set strategies for ant colony optimisation', 'Mary Lister', 2010, 'Conference', 'Lister, M, "Candidate set strategies for ant colony optimisation", Proceedings 3rd International Workshop on Ant Algorithms (ANTS 2010), 12-14 September 2010, Brussels, Belgium, pp. 243-249. (2010)', '2010-01-20'),
('10.1007/3-540-45724-0_9', 'Anti-pheromone as a tool for better exploration of search space', 'Gemma Stanford', 2011, 'Conference', 'Stanford, G, "Anti-pheromone as a tool for better exploration of search space", Proceedings 3rd International Workshop on Ant Algorithms (ANTS 2011), 12-14 September 2011, Brussels, Belgium, pp. 100-110. (2011)', '2011-12-03'),
('10.1007/978-3-540-76931-6_1', 'Alternative solution representations for the job shop scheduling problem in ant colony optimisation', 'Gemma Stanford, John Beckett', 2012, 'Conference', 'Stanford, G and Beckett, J, "Alternative solution representations for the job shop scheduling problem in ant colony optimisation", Proceedings Third Australian Conference on Artificial Life (ACAL07), 4-6 December 2012, Gold Coast, Australia, pp. 1-12. (2012)', '2012-07-21'),
('10.1007/978-3-642-10427-5_27', 'The effects of different kinds of move in differential evolution searches', 'Caitlyn Pemulwuy', 2012, 'Conference', 'Pemulwuy, C, "The effects of different kinds of move in differential evolution searches", Artificial Life: Borrowing from Biology, 1-4 December 2012, Melbourne, Australia, pp. 272-281. (2012)', '2012-02-14'),
('10.1007/978-3-642-25832-9_29', 'A simple strategy to maintain diversity and reduce crowding in particle swarm optimization', 'Alexandra Halloran', 2013, 'Conference', 'Halloran, A, "A simple strategy to maintain diversity and reduce crowding in particle swarm optimization", AI 2013: Advances in Artificial Intelligence, 5-8 December 2013, Perth, Australia, pp. 281-290. (2013)', '2013-05-29'),
('10.1007/b99492', 'Search bias in constructive metaheuristics and implications for ant colony optimisation', 'John Beckett', 2011, 'Conference', 'Beckett, J, "Search bias in constructive metaheuristics and implications for ant colony optimisation", Proceedings of the 4th International Workshop (ANTS 2011), 5-8 September 2011, Brussels, Belgium, pp. 390-397. (2011)', '2011-11-25'),
('10.1007/s10489-014-0613-2', 'Measuring the curse of dimensionality and its effects on particle swarm optimization and differential evolution', 'Gemma Stanford', 2015, 'Journal', 'Stanford, G, "Measuring the curse of dimensionality and its effects on particle swarm optimization and differential evolution", Applied Intelligence, 42(3), pp. 514-526. (2015)', '2015-08-04'),
('10.1016/j.cor.2006.12.014', 'Solution bias in ant colony optimisation: lessons for selecting pheromone models', 'Edward Vogt, Gemma Stanford', 2014, 'Journal', 'Vogt, E and Stanford, G, "Solution bias in ant colony optimisation: lessons for selecting pheromone models", Computers and Operations Research, 35(9), pp. 2728-2749. (2014)', '2014-11-07'),
('10.1016/j.procs.2014.05.174', 'Extending the front: designing RFID antennas using multiobjective differential evolution with biased population selection', 'Gemma Stanford', 2015, 'Conference', 'Stanford, G, "Extending the front: designing RFID antennas using multiobjective differential evolution with biased population selection", Proceedings of 14th International Conference on Computational Science 2015, 10-12 June 2015, Cairns, Australia, pp. 1893-1903. (2015)', '2015-08-14'),
('10.1109/CEC.2009.4983298', 'Differential evolution: difference vectors and movement in solution space', 'Alexandra Halloran, Gemma Stanford', 2012, 'Conference', 'Halloran, A and Stanford, G, "Differential evolution: difference vectors and movement in solution space", Proceedings of the IEEE Congress on Evolutionary Computation 2012, 18-21 May 2012, Trondheim, Norway, pp. 2833-2840. (2012)', '2012-02-14'),
('10.1109/CEC.2010.5586128', 'An analysis of the operation of differential evolution at high and low crossover rates', 'Caitlyn Pemulwuy', 2012, 'Conference', 'Pemulwuy, C, "An analysis of the operation of differential evolution at high and low crossover rates", Proceedings of the IEEE Congress on Evolutionary Computation 2012, 18-23 July 2012, Barcelona, Spain, pp. 1807-1814. (2012)', '2012-08-04'),
('10.1109/CEC.2010.5586184', 'Crossover and the different faces of differential evolution searches', 'Caitlyn Pemulwuy, Gemma Stanford', 2012, 'Conference', 'Pemulwuy, C and Stanford, G, "Crossover and the different faces of differential evolution searches", Proceedings of the IEEE Congress on Evolutionary Computation 2012, 18-23 July 2012, Barcelona, Spain, pp. 1951-1958. (2012)', '2012-04-22'),
('10.1109/CEC.2012.6252891', 'A simple strategy for maintaining diversity and reducing crowding in differential evolution', 'Ben Bramston, Caitlyn Pemulwuy', 2013, 'Conference', 'Bramston, B and Pemulwuy, C, "A simple strategy for maintaining diversity and reducing crowding in differential evolution", Proceedings of 2013 IEEE Congress on Evolutionary Computation, 10-15 June 2013, Brisbane, Australia, pp. 2692-2699. (2013)', '2013-08-05'),
('10.1109/CEC.2012.6252923', 'Improving exploration in ant colony optimisation with antennation', 'Mary Lister, Gemma Stanford', 2013, 'Conference', 'Lister, M and Stanford, G, "Improving exploration in ant colony optimisation with antennation", 2013 IEEE Congress on Evolutionary Computation, 10-15 June 2013, Brisbane, Australia, pp. 2926-2933. (2013)', '2013-05-04'),
('10.1109/CEC.2012.6256591', 'Simulated annealing with thresheld convergence', 'Gemma Stanford', 2013, 'Conference', 'Stanford, G, "Simulated annealing with thresheld convergence", Proceedings of 2013 IEEE Congress on Evolutionary Computation, 2013 IEEE Congress on Evolutionary Computation, Brisbane, Australia, pp. 1946-1952. (2013)', '2013-02-13'),
('10.1109/CEC.2013.6557551', 'Differential evolution with thresheld convergence', 'Charlie Byrnes, Gemma Stanford', 2014, 'Conference', 'Byrnes, C and Stanford, G, "Differential evolution with thresheld convergence", Proceedings of 2014 IEEE Congress on Evolutionary Computation, 20-23 June 2013, Cancun, Mexico, pp. 40-47. (2014)', '2014-02-03'),
('10.1109/CEC.2013.6557611', 'Particle swarm optimization with thresheld convergence', 'Caitlyn Pemulwuy', 2014, 'Conference', 'Pemulwuy, C, "Particle swarm optimization with thresheld convergence", Proceedings of 2014 IEEE Congress on Evolutionary Computation, 20-23 June 2013, Cancun, Mexico, pp. 510-516. (2014)', '2014-05-22'),
('10.1109/CEC.2014.6900579', 'Identifying and exploiting the scale of a search space in differential evolution', 'Holly Pell, Edward Vogt', 2015, 'Conference', 'Pell, H and Vogt, E, "Identifying and exploiting the scale of a search space in differential evolution", Proceedings of 2014 IEEE Congress on Evolutionary Computation, 6-11 July 2015, Beijing, China, pp. 1427-1434. (2015)', '2015-02-06'),
('10.1109/eScienceW.2010.26', 'Parallel constraint handling in a multiobjective evolutionary algorithm for the automotive deployment problem', 'Gemma Stanford, Edward Vogt, Alexandra Halloran', 2012, 'Conference', 'Stanford, G and Vogt, E and Halloran, A, "Parallel constraint handling in a multiobjective evolutionary algorithm for the automotive deployment problem", Proceedings of the 6th IEEE International Conference on E-Science Workshops 2012, 7-10 December 2012, Brisbane, Australia, pp. 104-109. (2012)', '2012-12-28'),
('10.1109/ISDA.2013.6920726', 'Hybridization of particle swarm optimization with adaptive genetic algorithm operators', 'Gemma Stanford, Edward Vogt, Caitlyn Pemulwuy', 2014, 'Conference', 'Stanford, G and Vogt, E and Pemulwuy, C, "Hybridization of particle swarm optimization with adaptive genetic algorithm operators", Proceedings of the 2014 International Conference on Intelligent Systems Design and Applications, 8-10 December 2013, Malaysia, pp. 1-6. (2014)', '2014-10-05'),
('10.1109/TALE.2013.6654527', 'Agile development spikes applied to computer science education', 'Indiana Whitta, Caitlyn Pemulwuy', 2014, 'Conference', 'Whitta, I and Pemulwuy, C, "Agile development spikes applied to computer science education", Proceedings of IEEE International Conference on Teaching, Assessment and Learning for Engineering 2014, 26-29 August 2014, Kuta, Indonesia, pp. 699-704. (2014)', '2014-09-07'),
('10.1142/S1469026803000938', 'The accumulated experience ant colony for the travelling salesman problem', 'Caitlyn Pemulwuy', 2011, 'Journal', 'Pemulwuy, C, "The accumulated experience ant colony for the travelling salesman problem", International Journal of Computational Intelligence and Applications, 3(2), pp. 189-198. (2011)', '2011-09-27'),
('10.1145/2001576.2001585', 'Selection strategies for initial positions and initial velocities in multi-optima particle swarms', 'Ben Bramston, Caitlyn Pemulwuy, Alexandra Halloran', 2013, 'Conference', 'Bramston, B and Pemulwuy, C and Halloran, A, "Selection strategies for initial positions and initial velocities in multi-optima particle swarms", Proceedings of the 13th Annual Conference on Genetic and Evolutionary Computation, 12-16 July 2013, Dublin, Ireland, pp. 53-60. (2013)', '2013-11-10'),
('10.1145/2001576.2001669', 'Differential evolution for RFID antenna design: a comparison with ant colony optimisation', 'Gemma Stanford', 2013, 'Conference', 'Stanford, G, "Differential evolution for RFID antenna design: a comparison with ant colony optimisation", Proceedings of the 13th Annual Conference on Genetic and Evolutionary Computation, 12-16 July 2013, Dublin, Ireland, pp. 673-680. (2013)', '2013-04-22'),
('10.1145/2001576.2001682', 'Population-ACO for the automotive deployment problem', 'Mary Lister', 2013, 'Conference', 'Lister, M, "Population-ACO for the automotive deployment problem", Proceedings of the 13th Annual Conference on Genetic and Evolutionary Computation, 12-16 July 2013, Dublin, Ireland, pp. 777-784. (2013)', '2013-07-02'),
('10.1162/1064546054407149', 'Automated selection of appropriate pheromone representations in ant colony optimization', 'Alexandra Halloran, Gemma Stanford', 2012, 'Journal', 'Halloran, A and Stanford, G, "Automated selection of appropriate pheromone representations in ant colony optimization", Artificial Life, 11(3), pp. 269-291. (2012)', '2012-08-16'),
('prefix/sample1', 'Protocols and structures for inference: a RESTful API for machine learning', 'Indiana Whitta', 2015, 'Conference', 'Whitta, I, "Protocols and structures for inference: a RESTful API for machine learning", Proceedings of the 2nd Conference on Predictive APIs and Apps, 6-7 August 2015, Sydney, Australia, pp. 1-8. (2015)', '2015-10-11'),
('prefix/sample10', 'Storing and retrieving software components: a component description manager', 'Caitlyn Pemulwuy, Gemma Stanford', 2010, 'Conference', 'Pemulwuy, C and Stanford, G, "Storing and retrieving software components: a component description manager", Proceedings 12th Australian Software Engineering Conference (ASWEC 2010), 28-29 April 2010, Canberra, ACT, pp. 107-117. (2010)', '2010-11-28'),
('prefix/sample11', 'Solution biases and pheromone representation selection in ant colony optimisation', 'Gemma Stanford', 2005, 'Other', 'Stanford, G, "Solution biases and pheromone representation selection in ant colony optimisation"  (2005)', '2005-03-28'),
('prefix/sample2', 'Representation matters: real-valued encodings for meander line RFID antennas', 'Charlie Byrnes, Gemma Stanford', 2015, 'Conference', 'Byrnes, C and Stanford, G, "Representation matters: real-valued encodings for meander line RFID antennas", Proceedings of 2015 IEEE Congress on Evolutionary Computation, 25-28 May, Sendai, Japan, pp. 1303-1310. (2015)', '2015-07-12'),
('prefix/sample3', 'Evolution strategies with thresheld convergence', 'Caitlyn Pemulwuy', 2015, 'Conference', 'Pemulwuy, C, "Evolution strategies with thresheld convergence", Proceedings of 2015 IEEE Congress on Evolutionary Computation, 25-28 May, Sendai, Japan, pp. 2097-2104. (2015)', '2015-10-26'),
('prefix/sample4', 'A framework for integrating concept maps into higher-order learning units in IT education', 'Alexandra Halloran', 2015, 'Conference', 'Halloran, A, "A framework for integrating concept maps into higher-order learning units in IT education", Workshop on HCI Education in Asia Pacific at OzCHI, 2 December, Sydney, Australia, pp. 7-10. (2015)', '2015-07-06'),
('prefix/sample5', 'Towards the effective use of multiple displays in teaching and learning environments', 'Gemma Stanford', 2014, 'Conference', 'Stanford, G, "Towards the effective use of multiple displays in teaching and learning environments", Workshop on HCI Education in Asia Pacific at OzCHI, 2 December, Sydney, Australia, pp. 21-24. (2014)', '2014-04-15'),
('prefix/sample6', 'Anatomy of a learning problem', 'Edward Vogt, Caitlyn Pemulwuy', 2012, 'Conference', 'Vogt, E and Pemulwuy, C, "Anatomy of a learning problem", Proceedings of the 25th Conference on Neural Information Processing Systems, 16-17 December 2012, Sierra Nevada,Spain, pp. 1-8. (2012)', '2012-11-24'),
('prefix/sample7', 'Semi-formal, not semi-realistic: a component description manager', 'Caitlyn Pemulwuy', 2011, 'Conference', 'Pemulwuy, C, "Semi-formal, not semi-realistic: a component description manager", Proceedings Technology of Object-Oriented Languages, Systems and Architectures, 13-15 March 2011, Sofia, Bulgaria, pp. 197-207. (2011)', '2011-10-11'),
('prefix/sample8', 'Automated selection of appropriate pheromone representations in ant colony optimisation', 'John Beckett', 2011, 'Conference', 'Beckett, J, "Automated selection of appropriate pheromone representations in ant colony optimisation", Proceedings 1st Australian Conference on Artificial Life (ACAL 2011), 6-7 December 2011, Canberra, ACT, pp. 170-184. (2011)', '2011-12-20'),
('prefix/sample9', 'The accumulated experience ant colony for the travelling salesman problem', 'John Beckett', 2010, 'Conference', 'Beckett, J, "The accumulated experience ant colony for the travelling salesman problem", Proceedings of the Inaugural Workshop on Artificial Life (AL 01), 11 December 2010, Adelaide, South Australia, pp. 79-87. (2010)', '2010-06-10');

-- --------------------------------------------------------

--
-- 表的结构 `researcher`
--

CREATE TABLE IF NOT EXISTS `researcher` (
  `id` int(11) NOT NULL,
  `type` enum('Staff','Student') NOT NULL,
  `given_name` varchar(20) NOT NULL,
  `family_name` varchar(20) NOT NULL,
  `title` varchar(10) NOT NULL,
  `unit` varchar(64) NOT NULL,
  `campus` enum('Hobart','Launceston','Cradle Coast') NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `photo` varchar(512) DEFAULT NULL,
  `degree` varchar(16) DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `level` enum('A','B','C','D','E') DEFAULT NULL,
  `utas_start` date DEFAULT NULL,
  `current_start` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `researcher`
--

INSERT INTO `researcher` (`id`, `type`, `given_name`, `family_name`, `title`, `unit`, `campus`, `email`, `photo`, `degree`, `supervisor_id`, `level`, `utas_start`, `current_start`) VALUES
(123460, 'Staff', 'John', 'Beckett', 'Dr', 'Engineering & ICT', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, 'B', '2010-06-17', '2010-06-17'),
(123461, 'Staff', 'Gemma', 'Stanford', 'Dr', 'Engineering & ICT', 'Launceston', 'no.such.email@example.org', 'https://images.pexels.com/photos/1181521/pexels-photo-1181521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, 'C', '2006-01-19', '2014-01-01'),
(123462, 'Staff', 'Edward', 'Vogt', 'Dr', 'Engineering & ICT', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/834863/pexels-photo-834863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, 'B', '2011-01-10', '2012-04-16'),
(123463, 'Staff', 'Mary', 'Lister', 'Dr', 'TIA', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/3765175/pexels-photo-3765175.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, 'B', '2012-01-28', '2012-01-28'),
(123464, 'Staff', 'Caitlyn', 'Pemulwuy', 'Dr', 'TIA', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, 'D', '2007-01-19', '2014-04-12'),
(123465, 'Staff', 'Indiana', 'Whitta', 'Dr', 'TIA', 'Cradle Coast', 'no.such.email@example.org', 'https://images.pexels.com/photos/2777898/pexels-photo-2777898.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', NULL, NULL, 'A', '2014-05-23', '2014-05-23'),
(123466, 'Student', 'Alexandra', 'Halloran', 'Ms', 'Engineering & ICT', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/2346754/pexels-photo-2346754.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'PhD', 123461, NULL, '2011-08-31', '2011-08-31'),
(123467, 'Student', 'Charlie', 'Byrnes', 'Mr', 'Engineering & ICT', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/927022/pexels-photo-927022.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'PhD', 123461, NULL, '2013-04-24', '2013-04-24'),
(123468, 'Student', 'Holly', 'Pell', 'Ms', 'Engineering & ICT', 'Launceston', 'no.such.email@example.org', 'https://images.pexels.com/photos/3294237/pexels-photo-3294237.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'PhD', 123462, NULL, '2014-08-23', '2014-08-23'),
(123469, 'Student', 'Ben', 'Bramston', 'Mr', 'TIA', 'Hobart', 'no.such.email@example.org', 'https://images.pexels.com/photos/1587014/pexels-photo-1587014.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', 'MSc', 123464, NULL, '2011-03-16', '2011-03-16');

-- --------------------------------------------------------

--
-- 表的结构 `researcher_publication`
--

CREATE TABLE IF NOT EXISTS `researcher_publication` (
  `researcher_id` int(11) NOT NULL,
  `doi` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `researcher_publication`
--

INSERT INTO `researcher_publication` (`researcher_id`, `doi`) VALUES
(123460, '10.1007/978-3-540-76931-6_1'),
(123460, '10.1007/b99492'),
(123460, 'prefix/sample8'),
(123460, 'prefix/sample9'),
(123461, '10.1007/11504894_31'),
(123461, '10.1007/3-540-45724-0_9'),
(123461, '10.1007/978-3-540-76931-6_1'),
(123461, '10.1007/s10489-014-0613-2'),
(123461, '10.1016/j.cor.2006.12.014'),
(123461, '10.1016/j.procs.2014.05.174'),
(123461, '10.1109/CEC.2009.4983298'),
(123461, '10.1109/CEC.2010.5586184'),
(123461, '10.1109/CEC.2012.6252923'),
(123461, '10.1109/CEC.2012.6256591'),
(123461, '10.1109/CEC.2013.6557551'),
(123461, '10.1109/eScienceW.2010.26'),
(123461, '10.1109/ISDA.2013.6920726'),
(123461, '10.1145/2001576.2001669'),
(123461, '10.1162/1064546054407149'),
(123461, 'prefix/sample10'),
(123461, 'prefix/sample11'),
(123461, 'prefix/sample2'),
(123461, 'prefix/sample5'),
(123462, '10.1016/j.cor.2006.12.014'),
(123462, '10.1109/CEC.2014.6900579'),
(123462, '10.1109/eScienceW.2010.26'),
(123462, '10.1109/ISDA.2013.6920726'),
(123462, 'prefix/sample6'),
(123463, '10.1007/11839088_49'),
(123463, '10.1007/3-540-45724-0_22'),
(123463, '10.1109/CEC.2012.6252923'),
(123463, '10.1145/2001576.2001682'),
(123464, '10.1007/11839088_42'),
(123464, '10.1007/978-3-642-10427-5_27'),
(123464, '10.1109/CEC.2010.5586128'),
(123464, '10.1109/CEC.2010.5586184'),
(123464, '10.1109/CEC.2012.6252891'),
(123464, '10.1109/CEC.2013.6557611'),
(123464, '10.1109/ISDA.2013.6920726'),
(123464, '10.1109/TALE.2013.6654527'),
(123464, '10.1142/S1469026803000938'),
(123464, '10.1145/2001576.2001585'),
(123464, 'prefix/sample10'),
(123464, 'prefix/sample3'),
(123464, 'prefix/sample6'),
(123464, 'prefix/sample7'),
(123465, '10.1109/TALE.2013.6654527'),
(123465, 'prefix/sample1'),
(123466, '10.1007/11504894_31'),
(123466, '10.1007/978-3-642-25832-9_29'),
(123466, '10.1109/CEC.2009.4983298'),
(123466, '10.1109/eScienceW.2010.26'),
(123466, '10.1145/2001576.2001585'),
(123466, '10.1162/1064546054407149'),
(123466, 'prefix/sample4'),
(123467, '10.1109/CEC.2013.6557551'),
(123467, 'prefix/sample2'),
(123468, '10.1109/CEC.2014.6900579'),
(123469, '10.1007/11839088_42'),
(123469, '10.1109/CEC.2012.6252891'),
(123469, '10.1145/2001576.2001585');

-- --------------------------------------------------------

--
-- 表的结构 `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL,
  `given_name` varchar(20) NOT NULL,
  `family_name` varchar(20) NOT NULL,
  `title` varchar(10) DEFAULT NULL,
  `campus` enum('Hobart','Launceston') NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `room` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `photo` mediumblob,
  `category` enum('Academic','Technical','Admin','Casual') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `staff`
--

INSERT INTO `staff` (`id`, `given_name`, `family_name`, `title`, `campus`, `phone`, `room`, `email`, `photo`, `category`) VALUES
(123460, 'John', 'Beckett', 'Dr', 'Hobart', '(03) 6226 0000', 'C489', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d6d616c652d66615f33323439363335632e6a7067, 'Academic'),
(123461, 'Gemma', 'Stanford', 'Dr', 'Launceston', '(03) 6226 0000', 'V124', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d66656d616c652d5f33323439363333632e6a7067, 'Academic'),
(123462, 'Edward', 'Vogt', 'Dr', 'Hobart', '(03) 6226 0000', 'C467', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d6d616c652d66615f33323439363335632e6a7067, 'Academic'),
(123463, 'Mary', 'Lister', 'Dr', 'Hobart', '(03) 6226 0000', 'C412', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d66656d616c652d5f33323439363333632e6a7067, 'Academic'),
(123464, 'Caitlyn', 'Pemulwuy', 'Ms', 'Hobart', '(03) 6226 0000', 'C432', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d66656d616c652d5f33323439363333632e6a7067, 'Casual'),
(123465, 'Indiana', 'Whitta', 'Mr', 'Hobart', '(03) 6226 0000', 'C448', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d6d616c652d66615f33323439363335632e6a7067, 'Casual'),
(123466, 'Alexandra', 'Halloran', 'Ms', 'Hobart', '(03) 6226 0000', 'C435', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d66656d616c652d5f33323439363333632e6a7067, 'Admin'),
(123467, 'Charlie', 'Byrnes', 'Mr', 'Hobart', '(03) 6226 0000', 'C439', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d6d616c652d66615f33323439363335632e6a7067, 'Admin'),
(123468, 'Holly', 'Pell', 'Ms', 'Launceston', '(03) 6226 0000', 'V177', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d66656d616c652d5f33323439363333632e6a7067, 'Admin'),
(123469, 'Ben', 'Bramston', 'Mr', 'Hobart', '(03) 6226 0000', 'C449', 'no.such.email@example.org', 0x68747470733a2f2f7365637572652e692e74656c6567726170682e636f2e756b2f6d756c74696d656469612f617263686976652f30333234392f6172636865747970616c2d6d616c652d66615f33323439363335632e6a7067, 'Technical');

-- --------------------------------------------------------

--
-- 表的结构 `supervision`
--

CREATE TABLE IF NOT EXISTS `supervision` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `code` varchar(6) NOT NULL,
  `title` varchar(45) NOT NULL,
  `coordinator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `unit`
--

INSERT INTO `unit` (`code`, `title`, `coordinator`) VALUES
('KIT102', 'Data Organisation and Visualisation', 123461),
('KIT103', 'Computational Science', 123463),
('KIT104', 'ICT Architecture & Operating Systems', 123460),
('KIT106', 'ICT Impact & Emerging Technology', 123460),
('KIT107', 'Programming', 123463),
('KIT201', 'Data Networks & Security', 123460),
('KIT204', 'ICT Solutions Analysis for Business', 123462),
('KIT206', 'Software Design & Development', 123462),
('KIT302', 'ICT Project B', 123462),
('KIT306', 'Data Analytics', 123462),
('KIT501', 'ICT Systems Administration Fundamentals', 123462),
('KIT506', 'Software Application Design and Implementatio', 123461);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`unit_code`,`day`,`start`,`campus`),
  ADD KEY `fk_class_unit1_idx` (`unit_code`),
  ADD KEY `fk_class_staff1_idx` (`staff`);

--
-- Indexes for table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`staff_id`,`day`,`start`),
  ADD KEY `fk_consultation_staff_idx` (`staff_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`,`level`,`start`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`doi`);

--
-- Indexes for table `researcher`
--
ALTER TABLE `researcher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_researcher_researcher1` (`supervisor_id`);

--
-- Indexes for table `researcher_publication`
--
ALTER TABLE `researcher_publication`
  ADD PRIMARY KEY (`researcher_id`,`doi`),
  ADD KEY `fk_researcher_has_publication_publication1` (`doi`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`code`),
  ADD KEY `fk_unit_staff1_idx` (`coordinator`);

--
-- 限制导出的表
--

--
-- 限制表 `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fk_class_staff1` FOREIGN KEY (`staff`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_class_unit1` FOREIGN KEY (`unit_code`) REFERENCES `unit` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `fk_consultation_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `researcher_publication`
--
ALTER TABLE `researcher_publication`
  ADD CONSTRAINT `fk_researcher_has_publication_publication1` FOREIGN KEY (`doi`) REFERENCES `publication` (`doi`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_researcher_has_publication_researcher1` FOREIGN KEY (`researcher_id`) REFERENCES `researcher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- 限制表 `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `fk_unit_staff1` FOREIGN KEY (`coordinator`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
