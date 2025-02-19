-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 12:13 PM
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
-- Database: `f_squad_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `formation`
--

CREATE TABLE `formation` (
  `id` int(2) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formation`
--

INSERT INTO `formation` (`id`, `name`) VALUES
(1, '4-4-2'),
(2, '3-5-2'),
(3, '4-2-3-1'),
(4, '4-3-3'),
(5, '5-4-1');

-- --------------------------------------------------------

--
-- Table structure for table `formation_position`
--

CREATE TABLE `formation_position` (
  `formation_id` int(2) NOT NULL,
  `position_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formation_position`
--

INSERT INTO `formation_position` (`formation_id`, `position_id`) VALUES
(4, 2),
(4, 5),
(4, 6),
(4, 3),
(4, 15),
(4, 16),
(4, 17),
(4, 20),
(4, 21),
(4, 22),
(1, 5),
(1, 6),
(1, 2),
(1, 3),
(1, 15),
(1, 16),
(1, 12),
(1, 13),
(1, 23),
(1, 24),
(2, 4),
(2, 5),
(2, 6),
(2, 10),
(2, 11),
(2, 14),
(2, 12),
(2, 13),
(2, 23),
(2, 24),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 15),
(5, 16),
(5, 12),
(5, 13),
(5, 22),
(3, 5),
(3, 6),
(3, 2),
(3, 3),
(3, 10),
(3, 11),
(3, 17),
(3, 18),
(3, 19),
(3, 22),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `age` int(2) NOT NULL,
  `pref_foot` varchar(1) NOT NULL,
  `playing_number` int(2) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `first_name`, `last_name`, `age`, `pref_foot`, `playing_number`, `status`) VALUES
(1, 'Leo', 'Blackwood', 27, 'R', 1, 'Available'),
(2, 'Marco', 'Varela', 24, 'L', 2, 'Available'),
(3, 'Felix', 'Drayton', 30, 'R', 3, 'Injured'),
(4, 'Ryan', 'Holloway', 25, 'R', 4, 'Available'),
(5, 'Dante', 'Moretti', 29, 'L', 5, 'Available'),
(6, 'Javier', 'Mendoza', 23, 'R', 6, 'Available'),
(7, 'Elias', 'Thornton', 28, 'R', 7, 'Available'),
(8, 'Hugo', 'Lindholm', 26, 'L', 8, 'Available'),
(9, 'Matteo', 'Santoro', 22, 'L', 9, 'Available'),
(10, 'Rafael', 'Storm', 31, 'R', 10, 'Available'),
(11, 'Zane', 'Holloway', 27, 'L', 11, 'Suspended'),
(12, 'Bob', 'Hooper', 19, 'L', 48, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `player_position`
--

CREATE TABLE `player_position` (
  `player_id` int(11) NOT NULL,
  `position_id` int(2) NOT NULL,
  `proficiency` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player_position`
--

INSERT INTO `player_position` (`player_id`, `position_id`, `proficiency`) VALUES
(1, 1, 5),
(2, 3, 5),
(2, 2, 3),
(2, 5, 3),
(2, 6, 3),
(2, 4, 3),
(3, 2, 5),
(3, 4, 3),
(3, 5, 3),
(3, 7, 3),
(4, 4, 5),
(4, 5, 3),
(4, 6, 3),
(4, 3, 3),
(5, 4, 5),
(5, 9, 3),
(5, 5, 3),
(5, 6, 3),
(5, 10, 3),
(5, 11, 3),
(6, 9, 5),
(6, 10, 3),
(6, 11, 3),
(6, 14, 3),
(6, 15, 3),
(6, 16, 3),
(7, 13, 5),
(7, 14, 3),
(7, 16, 3),
(7, 21, 3),
(7, 8, 3),
(8, 14, 5),
(8, 15, 3),
(8, 16, 3),
(8, 17, 3),
(8, 10, 3),
(8, 9, 3),
(8, 11, 3),
(9, 22, 5),
(9, 17, 3),
(9, 19, 3),
(9, 18, 3),
(9, 23, 3),
(9, 24, 3),
(10, 17, 5),
(10, 18, 3),
(10, 19, 3),
(10, 20, 3),
(10, 21, 3),
(10, 22, 3),
(11, 20, 5),
(11, 21, 3),
(11, 22, 3),
(11, 23, 3),
(11, 24, 3),
(11, 18, 3),
(12, 2, 5),
(12, 5, 3),
(12, 6, 3),
(12, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(2) NOT NULL,
  `name` varchar(27) NOT NULL,
  `abbreviation` varchar(3) NOT NULL,
  `xposition` int(1) NOT NULL,
  `yposition` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `name`, `abbreviation`, `xposition`, `yposition`) VALUES
(1, 'Goalkeeper', 'GK', 2, 5),
(2, 'Leftback', 'LB', 0, 4),
(3, 'Rightback', 'RB', 4, 4),
(4, 'Centerback', 'CB', 2, 4),
(5, 'Left Centerback', 'LCB', 1, 4),
(6, 'Right Centerback', 'RCB', 3, 4),
(7, 'Left Wingback', 'LWB', 0, 3),
(8, 'Right Wingback', 'RWB', 4, 3),
(9, 'Center Defensive Midfielder', 'CDM', 2, 3),
(10, 'Left Defensive Midfielder', 'LDM', 1, 3),
(11, 'Right Defensive Midfielder', 'RDM', 3, 3),
(12, 'Left Midfielder', 'LM', 0, 2),
(13, 'Right Midfielder', 'RM', 4, 2),
(14, 'Center Midfielder', 'CM', 2, 2),
(15, 'Left Center Midfielder', 'LCM', 1, 2),
(16, 'Right Center Midfielder', 'RCM', 3, 2),
(17, 'Attacking Midfielder', 'AMC', 2, 1),
(18, 'Left Attacking Midfielder', 'AML', 0, 1),
(19, 'Right Attacking Midfielder', 'AMR', 4, 1),
(20, 'Left Winger', 'LW', 0, 0),
(21, 'Right Winger', 'RW', 4, 0),
(22, 'Striker', 'ST', 2, 0),
(23, 'Left Forward', 'LF', 1, 0),
(24, 'Right Forward', 'RF', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `selection`
--

CREATE TABLE `selection` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `formation_id` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selection`
--

INSERT INTO `selection` (`id`, `name`, `date`, `user_id`, `formation_id`) VALUES
(1, 'Attacking Scenario 1', '2025-02-18', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `selection_details`
--

CREATE TABLE `selection_details` (
  `selection_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `position_id` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selection_details`
--

INSERT INTO `selection_details` (`selection_id`, `player_id`, `position_id`) VALUES
(1, 11, 20),
(1, 9, 22),
(1, 10, 17),
(1, 2, 3),
(1, 1, 1),
(1, 7, 21),
(1, 5, 5),
(1, 4, 6),
(1, 8, 15),
(1, 6, 16),
(1, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `role`) VALUES
(1, 'manager', '$2a$12$3vDrR8Dz7BmZNZcskfiJjuAjXIw0olyQZpkwq1BFQFxXDmOvZZWmO', 'manager'),
(2, 'physio', '$2a$12$RXNF5fObn4kuq61QbFLUIeJYW5RKVSBJK8WIM7m72SCNrDb806QRK', 'physiotherapist'),
(3, 'assistant', '$2a$12$HBtZt.p866HpgCxSM6dF5OoxspSidDQngY3mt3PwFmLJma1GLQyC6', 'assistant-manage');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formation_position`
--
ALTER TABLE `formation_position`
  ADD KEY `fk_formation_id` (`formation_id`),
  ADD KEY `fk_position_id` (`position_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_player` (`first_name`,`last_name`,`age`),
  ADD KEY `player_id_idx` (`id`);

--
-- Indexes for table `player_position`
--
ALTER TABLE `player_position`
  ADD KEY `fk_player_id` (`player_id`),
  ADD KEY `fk_pposition_id` (`position_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `selection`
--
ALTER TABLE `selection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`),
  ADD KEY `fk_sformation_id` (`formation_id`);

--
-- Indexes for table `selection_details`
--
ALTER TABLE `selection_details`
  ADD KEY `fk_splayer_id` (`player_id`),
  ADD KEY `fk_sposition_id` (`position_id`),
  ADD KEY `fk_sselection_id` (`selection_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `selection`
--
ALTER TABLE `selection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `formation_position`
--
ALTER TABLE `formation_position`
  ADD CONSTRAINT `fk_formation_id` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `fk_position_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);

--
-- Constraints for table `player_position`
--
ALTER TABLE `player_position`
  ADD CONSTRAINT `fk_player_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `fk_pposition_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`);

--
-- Constraints for table `selection`
--
ALTER TABLE `selection`
  ADD CONSTRAINT `fk_sformation_id` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `selection_details`
--
ALTER TABLE `selection_details`
  ADD CONSTRAINT `fk_selection_id` FOREIGN KEY (`selection_id`) REFERENCES `selection` (`id`),
  ADD CONSTRAINT `fk_splayer_id` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
  ADD CONSTRAINT `fk_sposition_id` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `fk_sselection_id` FOREIGN KEY (`selection_id`) REFERENCES `selection` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
