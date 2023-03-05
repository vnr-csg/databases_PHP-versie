/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aankopen` (
  `id` int NOT NULL,
  `code` varchar(3) NOT NULL,
  `prijs` int DEFAULT NULL,
  PRIMARY KEY (`id`,`code`),
  KEY `code` (`code`),
  CONSTRAINT `aankopen_ibfk_1` FOREIGN KEY (`id`) REFERENCES `vrienden` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `aankopen_ibfk_2` FOREIGN KEY (`code`) REFERENCES `telefoons` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `aankopen` (`id`, `code`, `prijs`) VALUES (1,'a1',819),(2,'s1',319),(3,'s1',299),(4,'a2',929),(6,'a1',849),(7,'x1',415),(8,'g2',589),(8,'s1',NULL),(8,'x2',499),(9,'o1',869),(9,'s3',929);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefoons` (
  `code` varchar(3) NOT NULL,
  `merk` text NOT NULL,
  `type` varchar(16) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `telefoons` (`code`, `merk`, `type`) VALUES ('a1','Apple','iPhone 13'),('a2','Apple','iPhone 14'),('a3','Apple','iPhone SE'),('g1','Google','Pixel 6a'),('g2','Google','Pixel 7'),('o1','OnePlus','11'),('s1','Samsung','Galaxy A23'),('s2','Samsung','Galaxy S23'),('s3','Samsung','Z flip 4'),('x1','Xiaomi','12 Lite'),('x2','Xiaomi','12X');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vrienden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naam` text NOT NULL,
  `plaats` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `vrienden` (`id`, `naam`, `plaats`) VALUES (1,'Alan','Groningen'),(2,'Bob','Assen'),(3,'Christel','Heerlen'),(4,'Daphne','Groningen'),(5,'Eve','Heerlen'),(6,'Frits','Delft'),(7,'Gonny','Groningen'),(8,'Hajar','Emmen'),(9,'Ingo','Assen');
