/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inschrijvingen` (
  `id_leerling` int NOT NULL,
  `vak` varchar(16) NOT NULL,
  PRIMARY KEY (`id_leerling`,`vak`),
  KEY `vak` (`vak`),
  CONSTRAINT `inschrijvingen_ibfk_1` FOREIGN KEY (`id_leerling`) REFERENCES `leerlingen` (`id_leerling`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inschrijvingen_ibfk_2` FOREIGN KEY (`vak`) REFERENCES `vakken` (`vak`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `inschrijvingen` (`id_leerling`, `vak`) VALUES (153052,'Engels'),(153052,'natuurkunde');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leerlingen` (
  `id_leerling` int NOT NULL,
  `naam` text NOT NULL,
  `klas` text NOT NULL,
  PRIMARY KEY (`id_leerling`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `leerlingen` (`id_leerling`, `naam`, `klas`) VALUES (153052,'Jan','Groningen');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vakken` (
  `vak` varchar(16) NOT NULL,
  `docentcode` varchar(3) NOT NULL,
  `docentnaam` text NOT NULL,
  `lokaal` text,
  PRIMARY KEY (`vak`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `vakken` (`vak`, `docentcode`, `docentnaam`, `lokaal`) VALUES ('Engels','OSI','Osinga','A201'),('natuurkunde','PLP','Palsma','B206');
