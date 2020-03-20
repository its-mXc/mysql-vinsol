-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: vtapp
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assigned_tasks`
--

DROP TABLE IF EXISTS `assigned_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `runner_id` int DEFAULT NULL,
  `reviewer_id` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `runner_id` (`runner_id`),
  KEY `reviewer_id` (`reviewer_id`),
  CONSTRAINT `assigned_tasks_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `assigned_tasks_ibfk_2` FOREIGN KEY (`runner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `assigned_tasks_ibfk_3` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_tasks`
--

LOCK TABLES `assigned_tasks` WRITE;
/*!40000 ALTER TABLE `assigned_tasks` DISABLE KEYS */;
INSERT INTO `assigned_tasks` VALUES (1,1,1,4,'pending','2020-03-19 16:05:26'),(2,2,1,4,'accepted',NULL),(3,3,2,4,'pending',NULL),(4,4,2,4,'pending',NULL),(5,5,3,4,'accepted',NULL),(6,6,3,4,'accepted',NULL),(7,7,1,4,'started',NULL),(8,8,2,4,'started',NULL),(9,1,1,5,'Rejected',NULL),(10,1,1,5,'Rejected',NULL),(11,1,1,5,'Rejected',NULL);
/*!40000 ALTER TABLE `assigned_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assigned_task_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_task_id` (`assigned_task_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`assigned_task_id`) REFERENCES `assigned_tasks` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,4,'good','2020-03-19 12:15:13'),(2,2,5,'bad','2020-03-19 12:15:13'),(3,3,6,'awesome','2020-03-19 12:15:13'),(4,4,4,'poor','2020-03-19 12:15:13');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assigned_task_id` int DEFAULT NULL,
  `href` varchar(50) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_task_id` (`assigned_task_id`),
  CONSTRAINT `links_ibfk_1` FOREIGN KEY (`assigned_task_id`) REFERENCES `assigned_tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,1,'www.github.com/maskedXchaotic','2020-03-19 12:12:47'),(2,3,'www.github.com/himanshi','2020-03-19 12:12:48'),(3,5,'www.github.com/rahul','2020-03-19 12:12:48'),(4,2,'www.github.com/maskedXchaotic','2020-03-19 12:12:48');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `track_id` int NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`owner_id`),
  KEY `track_id` (`track_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `owners_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,4),(1,5),(2,4),(3,6),(4,6),(5,4),(5,5);
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `type` enum('study_task','exercise') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'data-types',1,'study_task'),(2,'calculator',1,'exercise'),(3,'gc',2,'study_task'),(4,'cattr',2,'exercise'),(5,'table',3,'exercise'),(6,'shopping-page',4,'exercise'),(7,'data-types',5,'study_task'),(8,'product-store',5,'exercise');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_reviewers`
--

DROP TABLE IF EXISTS `track_reviewers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_reviewers` (
  `track_id` int NOT NULL,
  `reviewer_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`reviewer_id`),
  KEY `track_id` (`track_id`),
  KEY `reviewer_id` (`reviewer_id`),
  CONSTRAINT `track_reviewers_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `track_reviewers_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_reviewers`
--

LOCK TABLES `track_reviewers` WRITE;
/*!40000 ALTER TABLE `track_reviewers` DISABLE KEYS */;
INSERT INTO `track_reviewers` VALUES (1,4),(2,4),(3,4),(4,4),(5,4);
/*!40000 ALTER TABLE `track_reviewers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_runners`
--

DROP TABLE IF EXISTS `track_runners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `track_runners` (
  `track_id` int NOT NULL,
  `runner_id` int NOT NULL,
  PRIMARY KEY (`track_id`,`runner_id`),
  KEY `track_id` (`track_id`),
  KEY `runner_id` (`runner_id`),
  CONSTRAINT `track_runners_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`id`),
  CONSTRAINT `track_runners_ibfk_2` FOREIGN KEY (`runner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_runners`
--

LOCK TABLES `track_runners` WRITE;
/*!40000 ALTER TABLE `track_runners` DISABLE KEYS */;
INSERT INTO `track_runners` VALUES (1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,1),(4,2),(4,3),(5,1),(5,2);
/*!40000 ALTER TABLE `track_runners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracks`
--

DROP TABLE IF EXISTS `tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracks`
--

LOCK TABLES `tracks` WRITE;
/*!40000 ALTER TABLE `tracks` DISABLE KEYS */;
INSERT INTO `tracks` VALUES (1,'ruby'),(2,'adv. ruby'),(3,'html'),(4,'css'),(5,'js');
/*!40000 ALTER TABLE `tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `type` enum('employee','admin','trainee') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Uday','trainee'),(2,'Himanshi','trainee'),(3,'Rahul','employee'),(4,'Akhil','employee'),(5,'Tanmay','admin'),(6,'Himanshu','employee'),(7,'Manish','employee');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-20 10:32:31
