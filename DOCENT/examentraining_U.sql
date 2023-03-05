DROP DATABASE IF EXISTS `examentraining`;
CREATE DATABASE `examentraining`;
USE `examentraining`;

CREATE TABLE `leerlingen` (
    `id_leerling` int AUTO_INCREMENT PRIMARY KEY,
    `naam` text NOT NULL,
    `klas` text NOT NULL
);

CREATE TABLE `vakken` (
    `vak` varchar(16) PRIMARY KEY,
    `docentcode` varchar(3) NOT NULL,
    `docentnaam` text NOT NULL,
    `lokaal` text
);

CREATE TABLE `inschrijvingen` (
    `id_leerling` int,
    `vak` varchar(16),
    PRIMARY KEY (`id_leerling`,`vak`),
    CONSTRAINT FOREIGN KEY (`id_leerling`) REFERENCES `leerlingen` (`id_leerling`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT FOREIGN KEY (`vak`) REFERENCES `vakken` (`vak`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO `leerlingen` (`id_leerling`, `naam`, `klas`) VALUES
(153052, 'Jan', 'Groningen');

INSERT INTO `vakken` (`vak`, `docentcode`, `docentnaam`, `lokaal`) VALUES
('natuurkunde', 'PLP', 'Palsma', 'B206'),
('Engels', 'OSI', 'Osinga', 'A201');

INSERT INTO `inschrijvingen` (`id_leerling`, `vak`) VALUES
(153052, 'natuurkunde'),
(153052, 'Engels');