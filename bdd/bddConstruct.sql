-- MariaDB 10.4.28 database script dump file for bddSC


DROP DATABASE IF EXISTS `bddSC`;
CREATE DATABASE IF NOT EXISTS `bddSC`;

USE `bddSC`;

-- Table structure for table `users`
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  `user_role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`user_email`)
);

-- Table structure for table `species`
CREATE TABLE IF NOT EXISTS `species` (
  `species_id` int(11) NOT NULL AUTO_INCREMENT,
  `species_name` varchar(45) NOT NULL,
  PRIMARY KEY (`species_id`),
  UNIQUE KEY `name_UNIQUE` (`species_name`)
);

-- Table structure for table `models`
CREATE TABLE IF NOT EXISTS `models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(45) NOT NULL,
  `model_manufacturer` varchar(45) NOT NULL,
  `model_species` int(11) NOT NULL,
  `model_length` float NOT NULL,
  `model_width` float NOT NULL,
  `model_height` float NOT NULL,
  `model_minCrew` int(11) NOT NULL,
  `model_maxCrew` int(11) NOT NULL,
  `model_cargo_capacity` int(11) NOT NULL,
  `model_starship_class` varchar(45) NOT NULL,
  PRIMARY KEY (`model_id`),
  KEY `model_species_idx` (`model_species`),
  CONSTRAINT `model_species` FOREIGN KEY (`model_species`) REFERENCES `species` (`species_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Table structure for table `starships`
CREATE TABLE IF NOT EXISTS `starships` (
  `starship_id` int(11) NOT NULL AUTO_INCREMENT,
  `starship_model` int(11) NOT NULL,
  `starship_name` varchar(45) NOT NULL,
  `starship_owner` int(11) NOT NULL,
  PRIMARY KEY (`starship_id`),
  KEY `starship_model_idx` (`starship_model`),
  KEY `starship_owner_idx` (`starship_owner`),
  CONSTRAINT `starship_model` FOREIGN KEY (`starship_model`) REFERENCES `models` (`model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `starship_owner` FOREIGN KEY (`starship_owner`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Table structure for table `armaments`
CREATE TABLE IF NOT EXISTS `armaments` (
  `armament_id` int(11) NOT NULL AUTO_INCREMENT,
  `armament_name` varchar(45) NOT NULL,
  `armament_manufacturer` varchar(45) NOT NULL,
  `armament_type` varchar(45) NOT NULL,
  `armament_size` varchar(45) NOT NULL,
  PRIMARY KEY (`armament_id`)
);

-- Table structure for table `starship_has_armament`
CREATE TABLE IF NOT EXISTS `starship_has_armament` (
  `id_starship` int(11) NOT NULL,
  `id_armament` int(11) NOT NULL,
    KEY `starship_has_armament_armament_idx` (`id_armament`),
    KEY `starship_has_armament_starship_idx` (`id_starship`),
    CONSTRAINT `starship_has_armament_armament` FOREIGN KEY (`id_armament`) REFERENCES `armaments` (`armament_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `starship_has_armament_starship` FOREIGN KEY (`id_starship`) REFERENCES `starships` (`starship_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Add data to table `users`
INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_role`) VALUES
(1, 'admin', 'admin@sc.net', 'admin', 'admin'),
(2, 'user1', 'user1@sc.net', 'user1', 'user'),
(3, 'user2', 'user2@sc.net', 'user2', 'user');

-- Add data to table `species`
INSERT INTO `species` (`species_id`, `species_name`) VALUES

(1, 'Human'),

(2, 'Banu'),

(3, 'Tevarin'),

(4, "Xi'An"),

(5, 'Vanduul'),

(6, "Kr'Thak"),

(7, 'Hadesians');


--  Add data to table `models`
INSERT INTO `models` (`model_id`, `model_name`, `model_manufacturer`, `model_species`, `model_length`, `model_width`, `model_height`, `model_minCrew`, `model_maxCrew`, `model_cargo_capacity`, `model_starship_class`) VALUES

(1, 'ORIG 100i', 'Origin Jumpworks GmbH', 1, 15.00, 10.00, 4.00, 1, 1, 2, 'Touring'),

(2, 'ORIG 300i', 'Origin Jumpworks GmbH', 1, 24.00, 16.00, 6.00, 1, 2, 4, 'Touring'),

(3, 'ORIG 600i', 'Origin Jumpworks GmbH', 1, 61.00, 40.00, 16.00, 3, 5, 40, 'Touring'),

(4, 'AEGS Avenger Titan', 'Aegis Dynamics', 1, 22.50, 16.50, 5.50, 1, 1, 8, 'Light Freighter'),

(5, 'AEGS Gladius', 'Aegis Dynamics', 1, 20.00, 17.00, 5.50, 1, 1, 0, 'Light Fighter'),

(6, 'AEGS Hammerhead', 'Aegis Dynamics', 1, 126.00, 91.00, 22.00, 9, 28, 0, 'Heavy Gunship'),

(7, 'ANVL Arrow', 'Anvil Aerospace', 1, 16.00, 12.00, 4.00, 1, 1, 0, 'Light Fighter'),

(8, 'ANVL F7C Hornet', 'Anvil Aerospace', 1, 22.50, 16.50, 5.50, 1, 2, 8, 'Medium Fighter'),

(9, 'ANVL F7C-M Super Hornet', 'Anvil Aerospace', 1, 22.50, 16.50, 5.50, 2, 2, 2, 'Medium Fighter'),

(10, 'AOPA Khartu-Al', 'Aopoa', 4, 16.00, 12.00, 4.00, 1, 1, 0, 'Interceptor'),

(11, 'AOPA Nox', 'Aopoa', 4, 3.00, 1.00, 1.00, 1, 1, 0, 'Snub'),

(12, "AOPA San'tok.yāi", 'Aopoa', 4, 30.00, 20.00, 10.00, 1, 1, 0, 'Heavy Fighter'),

(13, 'ARGO Mole', 'ARGO Astronautics', 1, 32.00, 16.00, 8.00, 3, 3, 96, 'Mining'),

(14, 'ARGO SRV', 'ARGO Astronautics', 1, 10.00, 5.00, 3.00, 1, 1, 0, 'Repair'),

(15, 'ARGO MPUV Cargo', 'ARGO Astronautics', 1, 10.00, 5.00, 3.00, 1, 1, 0, 'Transport'),

(16, 'BANU Defender', 'Banu Souli', 2, 55.00, 30.00, 10.00, 2, 2, 0, 'Medium Fighter'),

(17, 'BANU Merchantman', 'Banu Souli', 2, 100.00, 50.00, 20.00, 8, 40, 0, 'Heavy Freighter'),

(18, 'CNOU Mustang Alpha', 'Consolidated Outland', 1, 16.00, 12.00, 4.00, 1, 1, 4, 'Touring'),

(19, 'CNOU Mustang Beta', 'Consolidated Outland', 1, 16.00, 12.00, 4.00, 1, 2, 4, 'Light Fighter'),

(20, 'CNOU Mustang Delta', 'Consolidated Outland', 1, 16.00, 12.00, 4.00, 1, 2, 4, 'Dogfighter'),

(21, 'CRSD Genesis Starliner', 'Crusader Industries', 1, 90.00, 60.00, 20.00, 5, 40, 0, 'Passenger'),

(22, 'CRSD Hercules Starlifter', 'Crusader Industries', 1, 90.00, 60.00, 20.00, 5, 40, 0, 'Heavy Gunship'),

(23, 'CRSD Mercury Star Runner', 'Crusader Industries', 1, 30.00, 20.00, 10.00, 1, 3, 0, 'Medium Freighter'),

(24, 'DRAK Cutlass Black', 'Drake Interplanetary', 1, 29.00, 21.00, 8.00, 1, 3, 12, 'Medium Fighter'),

(25, 'DRAK Kraken', 'Drake Interplanetary', 1, 270.00, 150.00, 50.00, 5, 20, 0, 'Light Carrier'),

(26, 'DRAK Vulture', 'Drake Interplanetary', 1, 10.00, 5.00, 3.00, 1, 1, 0, 'Salvage'),

(27, 'ESRA Prowler', 'Esperia Inc.', 3, 30.00, 20.00, 10.00, 1, 1, 0, 'Dropship'),

(28, 'ESRA Talon', 'Esperia Inc.', 3, 16.00, 12.00, 4.00, 1, 1, 0, 'Light Fighter'),

(29, 'ESRA Glaive', 'Esperia Inc.', 5, 30.00, 20.00, 10.00, 1, 1, 0, 'Medium Fighter');

-- Add data to table `starships` 15 row
INSERT INTO `starships` (`starship_id`, `starship_model`, `starship_name`, `starship_owner`) VALUES
(1, 1, 'Interpid', 2),
(2, 2, 'Vulture', 2),
(3, 3, 'Hari Seldon', 2),
(4, 1, 'Golden Fate', 1),
(5, 4, 'Fastest Wind', 1),
(6, 6, 'Dauntless', 1),
(7, 7, 'The Arrow', 1),
(8, 2, 'Runaway', 3),
(9, 9, 'Pyrodoun', 3),
(10, 10, 'Devil', 3),
(11, 7, 'Nox', 3),
(12, 12, 'The Beast', 3),
(13, 15, 'Mole', 3),
(14, 19, 'SRV', 3),
(15, 25, 'Cargo', 3);

-- Add data to table `armaments` 10 row
INSERT INTO `armaments` (`armament_id`, `armament_name`, `armament_manufacturer`, `armament_type`, `armament_size`) VALUES
(1, 'M4A Laser Cannon', 'Behring', 'Laser Cannon', 'S1'),
(2, 'M3A Laser Cannon', 'Behring', 'Laser Cannon', 'S2'),
(3, 'M6A Laser Cannon', 'Behring', 'Laser Cannon', 'S3'),
(4, 'Dominator II', 'Talon Weapon System', 'Missiles', 'S1'),
(5, 'Dominator III', 'Talon Weapon System', 'Missiles', 'S2'),
(6, 'Dominator IV', 'Talon Weapon System', 'Missiles', 'S3'),
(7, 'Ignite', 'Firestorm Kinetics', 'Ballistic Cannon', 'S1'),
(8, 'Scattergun', 'Behring', 'Ballistic Cannon', 'S2'),
(9, 'Mantis GT-220', 'Klaus & Werner', 'Ballistic Cannon', 'S3'),
(10, 'Mantis GT-220', 'Klaus & Werner', 'Ballistic Cannon', 'S3');

-- Add data to table `starship_has_armament` create armament for all starship
INSERT INTO `starship_has_armament` (`id_starship`, `id_armament`) VALUES
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 1),
(1, 5),
(2, 2),
(2, 2),
(2, 2),
(2, 6),
(2, 6),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(3, 3),
(3, 3);