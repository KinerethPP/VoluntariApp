-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: voluntariapp
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` int NOT NULL,
  `answer` varchar(255) NOT NULL,
  `is_correct` varchar(45) NOT NULL,
  `question_id` int NOT NULL,
  `form_id` int NOT NULL,
  `volunteer_answer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Answers_Questions1_idx` (`question_id`,`form_id`),
  KEY `fk_Answers_Volunteers_answers1_idx` (`volunteer_answer_id`),
  KEY `fk_Answers_Questions2` (`form_id`),
  CONSTRAINT `fk_Answers_Questions1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `fk_Answers_Questions2` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`),
  CONSTRAINT `fk_Answers_Volunteers_answers1` FOREIGN KEY (`volunteer_answer_id`) REFERENCES `volunteers_answers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configurations` (
  `id` int NOT NULL,
  `primary_color` varchar(255) DEFAULT NULL,
  `secondary_color` varchar(45) DEFAULT NULL,
  `url_logo` mediumblob NOT NULL,
  `organization_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Configurations_Organization1_idx` (`organization_id`,`user_id`),
  KEY `fk_Configurations_Organization2` (`user_id`),
  CONSTRAINT `fk_Configurations_Organization1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  CONSTRAINT `fk_Configurations_Organization2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_has_photos`
--

DROP TABLE IF EXISTS `event_has_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_has_photos` (
  `id` int NOT NULL,
  `photo` mediumblob NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Event_has_photos_Events1_idx` (`event_id`),
  CONSTRAINT `fk_Event_has_photos_Events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_has_photos`
--

LOCK TABLES `event_has_photos` WRITE;
/*!40000 ALTER TABLE `event_has_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_has_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `event_date` date NOT NULL,
  `description` text NOT NULL,
  `street` varchar(45) NOT NULL,
  `cologne` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `municypaly` varchar(45) NOT NULL,
  `user_id` int NOT NULL,
  `organization_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Events_Organization1_idx` (`organization_id`,`user_id`),
  KEY `fk_Events_Organization2` (`user_id`),
  CONSTRAINT `fk_Events_Organization1` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`),
  CONSTRAINT `fk_Events_Organization2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` int NOT NULL,
  `name_forms` varchar(45) NOT NULL,
  `instructions` text NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Forms_Events1_idx` (`event_id`),
  CONSTRAINT `fk_Forms_Events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bussines_name` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `cologne` varchar(45) NOT NULL,
  `postal_code` varchar(5) NOT NULL,
  `municipality` varchar(45) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Organization_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Organization_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'DIF','Benito Juarez','Republica Dominicana','62790','Xochitepec','SDI7901012H52','7771436571',3),(2,'VLO','eeee','eeee','62790','Xochitepec','SSSSSSSSASA','7776789010',9),(3,'CEF','eeee','eeee','62790','Xochitepec','SSSSSSSSASA','7771436571',17);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` varchar(45) NOT NULL,
  `profil_photo` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Photos_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Photos_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postulations`
--

DROP TABLE IF EXISTS `postulations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postulations` (
  `id` int NOT NULL,
  `is_accept` tinyint NOT NULL,
  `volunteer_id` int NOT NULL,
  `user_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Postulations_Volunteers1_idx` (`volunteer_id`,`user_id`),
  KEY `fk_Postulations_Events1_idx` (`event_id`),
  CONSTRAINT `fk_Postulations_Events1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `fk_Postulations_Volunteers1` FOREIGN KEY (`volunteer_id`, `user_id`) REFERENCES `volunteers` (`id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postulations`
--

LOCK TABLES `postulations` WRITE;
/*!40000 ALTER TABLE `postulations` DISABLE KEYS */;
/*!40000 ALTER TABLE `postulations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL,
  `question` varchar(45) NOT NULL,
  `form_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Questions_Forms1_idx` (`form_id`),
  CONSTRAINT `fk_Questions_Forms1` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ADMIN'),(2,'ORGANIZATION'),(3,'VOLUNTEER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(12) NOT NULL,
  `enable` tinyint NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Users_Roles1_idx` (`role_id`),
  CONSTRAINT `fk_Users_Roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jassiel@gmail.com','admin',1,1),(2,'e@gmail.com','12345',0,1),(3,'dif@gmail.com','dif1234',0,2),(4,'kin@gmail.com','kin1234',0,3),(5,'fernanda@gmail.com','fer123',0,1),(6,'juan@gmail.com','edu23',0,1),(7,'mike@gmail.com','12345',0,1),(9,'vlo@gmail.com','123',1,2),(10,'fer@gmail.com','marfer123',0,1),(11,'mar@gmail.com','123',0,3),(12,'ale@gmail.com','12345',0,3),(13,'dul@gmail.com','1234',0,3),(14,'e2@gmail.com','345',0,3),(15,'holi@gmail.com','123',0,3),(16,'fabina@gmail.com','fabian123',0,1),(17,'cef@gmail.com','123',0,2),(18,'ee@gmail.com','123',0,3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `lastanme` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_Volunteers_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Volunteers_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` VALUES (1,'Vania Kinereth','Quezada','Lopez','2004-03-11','Saltillo Lagunilla','7771436571','QULV040311MMSPNA0',4),(2,'Fernanda','Martinez','Rodriguez','2023-06-26','cccccc','7776789010','',11),(3,'Liam','Alejandro','Jaramillo','2004-06-18','Cuernavaca Col. Centro','7775484757','JAEL18060469NASOWS',12),(4,'dulce','maria','gonzales','2023-07-06','svszvg','7772546842','dddddddddddddddddd',13),(5,'Fernanda','fff','Rodriguez','2023-06-29','cccccc','7776789010','eeeeeeeeeeeeeeeeee',14),(6,'sss','fff','dddd','2023-06-29','dddd','7771436571','dddddddddddddddddd',15),(7,'Fernanda','wwww','wwww','2023-06-29','wwww','7776789010','dddddddddddddddddd',18);
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers_answers`
--

DROP TABLE IF EXISTS `volunteers_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteers_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postulations_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Volunteers_answers_Postulations1_idx` (`postulations_id`),
  CONSTRAINT `fk_Volunteers_answers_Postulations1` FOREIGN KEY (`postulations_id`) REFERENCES `postulations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers_answers`
--

LOCK TABLES `volunteers_answers` WRITE;
/*!40000 ALTER TABLE `volunteers_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteers_answers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-27 22:01:17
