-- MariaDB 10.4.28 database script dump file for bddSC



CREATE DATABASE IF NOT EXISTS `bddSC`;

USE `bddSC`;

-- Table structure for table `user`
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

-- Table structure for table `model`
CREATE TABLE IF NOT EXISTS `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `species` int(11) NOT NULL,
  `length` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `minCrew` int(11) NOT NULL,
  `maxCrew` int(11) NOT NULL,
  `cargo_capacity` int(11) NOT NULL,
  `starship_class` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_species_idx` (`species`),
  CONSTRAINT `model_species` FOREIGN KEY (`species`) REFERENCES `species` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Table structure for table `species`
CREATE TABLE IF NOT EXISTS `species` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
);

-- Table structure for table `starship`
CREATE TABLE IF NOT EXISTS `starship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `owner` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `starship_model_idx` (`model`),
  KEY `starship_owner_idx` (`owner`),
  CONSTRAINT `starship_model` FOREIGN KEY (`model`) REFERENCES `model` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `starship_owner` FOREIGN KEY (`owner`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Table structure for table `armament`
CREATE TABLE IF NOT EXISTS `armament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `damage` int(11) NOT NULL,
  `range` int(11) NOT NULL,
  `rateOfFire` int(11) NOT NULL,
  `ammo` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Table structure for table `starship_has_armament`
CREATE TABLE IF NOT EXISTS `starship_has_armament` (
  `starship` int(11) NOT NULL,
  `armament` int(11) NOT NULL,
  PRIMARY KEY (`starship`,`armament`),
  KEY `starship_has_armament_armament_idx` (`armament`),
  CONSTRAINT `starship_has_armament_armament` FOREIGN KEY (`armament`) REFERENCES `armament` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `starship_has_armament_starship` FOREIGN KEY (`starship`) REFERENCES `starship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Table structure for table `starship_has_user`
CREATE TABLE IF NOT EXISTS `starship_has_user` (
  `starship` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`starship`,`user`),
  KEY `starship_has_user_user_idx` (`user`),
  CONSTRAINT `starship_has_user_starship` FOREIGN KEY (`starship`) REFERENCES `starship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `starship_has_user_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Table structure for table `starship_has_user_has_armament`
CREATE TABLE IF NOT EXISTS `starship_has_user_has_armament` (
  `starship` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `armament` int(11) NOT NULL,
  PRIMARY KEY (`starship`,`user`,`armament`),
  KEY `starship_has_user_has_armament_user_idx` (`user`),
  KEY `starship_has_user_has_armament_armament_idx` (`armament`),
  CONSTRAINT `starship_has_user_has_armament_armament` FOREIGN KEY (`armament`) REFERENCES `armament` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `starship_has_user_has_armament_starship` FOREIGN KEY (`starship`) REFERENCES `starship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `starship_has_user_has_armament_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Add data to table `user`
INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin@sc.net', 'admin', 'admin'),
(2, 'user1', 'user@sc.net', 'user1', 'user'),
(3, 'user2', 'user@sc.net', 'user2', 'user');

-- Add data to table `species`
INSERT INTO `species` (`id`, `name`) VALUES

(1, 'Human'),

(2, 'Banu'),

(3, 'Tevarin'),

(4, "Xi'An"),

(5, 'Vanduul'),

(6, "Kr'Thak"),

(7, 'Hadesians');


--  Add data to table `model`


INSERT INTO `model` (`id`, `name`, `manufacturer`, `species`, `length`, `width`, `height`, `minCrew`, `maxCrew`, `cargo_capacity`, `starship_class`) VALUES

(1, 'ORIG 100i', 'Origin Jumpworks GmbH', 1, 15.00, 10.00, 4.00, 1, 1, 2, 'Touring'),

(2, 'ORIG 125a', 'Origin Jumpworks GmbH', 1, 15.00, 10.00, 4.00, 1, 1, 2, 'Interdiction'),

(3, 'ORIG 135c', 'Origin Jumpworks GmbH', 1, 15.00, 10.00, 4.00, 1, 1, 6, 'Transport'),

(4, 'ORIG 300i', 'Origin Jumpworks GmbH', 1, 24.00, 16.00, 6.00, 1, 1, 8, 'Touring'),

(5, 'ORIG 315p', 'Origin Jumpworks GmbH', 1, 24.00, 16.00, 6.00, 1, 1, 12, 'Pathfinder'),

(6, 'ORIG 325a', 'Origin Jumpworks GmbH', 1, 24.00, 16.00, 6.00, 1, 2, 4, 'Interdiction'),

(7, 'ORIG 350r', 'Origin Jumpworks GmbH', 1, 24.00, 16.00, 6.00, 1, 2, 4, 'Racing'),

(8, 'ORIG 600i Explorer', 'Origin Jumpworks GmbH', 1, 61.00, 40.00, 16.00, 3, 5, 40, 'Pathfinder'),

(9, 'ORIG 600i Touring', 'Origin Jumpworks GmbH', 1, 61.00, 40.00, 16.00, 3, 5, 16, 'Touring'),

(10, 'ORIG 85X', 'Origin Jumpworks GmbH', 1, 9.00, 6.00, 3.00, 1, 1, 0, 'Snub'),

(11, 'ORIG M50', 'Origin Jumpworks GmbH', 1, 16.00, 11.00, 4.00, 1, 1, 2, 'Racing'),

(12, 'RSI Aurora CL', 'Roberts Space Industries', 1, 18.00, 9.00, 4.00, 1, 2, 6, 'Transport'),

(13, 'RSI Aurora ES', 'Roberts Space Industries', 1, 18.00, 9.00, 4.00, 1, 1, 3, 'Starter'),

(14, 'RSI Aurora LN', 'Roberts Space Industries', 1, 18.00, 9.00, 4.00, 1, 2, 6, 'Combat'),

(15, 'RSI Aurora LX', 'Roberts Space Industries', 1, 18.00, 9.00, 4.00, 1, 2, 6, 'Exploration'),

(16, 'RSI Aurora MR', 'Roberts Space Industries', 1, 18.00, 9.00, 4.00, 1, 2, 6, 'Starter'),

(17, 'RSI Constellation Andromeda', 'Roberts Space Industries', 1, 61.00, 38.00, 16.00, 4, 8, 96, 'Multi-crew'),

(18, 'RSI Constellation Aquila', 'Roberts Space Industries', 1, 61.00, 38.00, 16.00, 4, 8, 96, 'Multi-crew'),

(19, 'RSI Constellation Phoenix', 'Roberts Space Industries', 1, 61.00, 38.00, 16.00, 4, 8, 96, 'Multi-crew'),

(20, 'RSI Constellation Taurus', 'Roberts Space Industries', 1, 61.00, 38.00, 16.00, 4, 8, 96, 'Multi-crew'),

(21, 'RSI Orion', 'Roberts Space Industries', 1, 170.00, 126.00, 48.00, 6, 8, 384, 'Industrial'),

(22, 'RSI Polaris', 'Roberts Space Industries', 1, 155.00, 100.00, 40.00, 7, 9, 768, 'Corvette'),

(23, 'RSI Ursa Rover', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(24, 'RSI Ursa Rover Fortuna', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(25, 'RSI Ursa Rover Rover', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(26, 'RSI Ursa Rover Tonk', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(27, 'RSI Ursa Rover TR', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(28, 'RSI Ursa Rover TR Fortuna', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(29, 'RSI Ursa Rover TR Tonk', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(30, 'RSI Ursa Rover Tonk Fortuna', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground'),

(31, 'RSI Ursa Rover Tonk TR', 'Roberts Space Industries', 1, 8.00, 4.00, 3.00, 1, 1, 0, 'Ground');