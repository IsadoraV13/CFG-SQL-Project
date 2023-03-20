-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (arm64)
--
-- Host: localhost    Database: FitLife
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `check_in` timestamp NULL DEFAULT NULL,
  `check_out` timestamp NULL DEFAULT NULL,
  `eligible_session` int DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,7,'2022-11-07 08:09:23','2022-11-07 08:51:39',0),(2,3,'2022-11-07 08:09:25','2022-11-07 08:51:39',0),(3,7,'2022-11-08 09:01:40','2022-11-08 10:05:26',1),(4,9,'2022-11-08 10:55:56','2022-11-08 11:45:33',1),(5,2,'2022-11-09 08:03:28','2022-11-09 09:13:08',1),(6,14,'2022-11-09 10:54:32','2022-11-09 11:57:14',1),(7,7,'2022-11-10 14:40:47','2022-11-10 15:54:22',1),(8,6,'2022-11-10 10:22:16','2022-11-10 10:42:13',0),(9,3,'2022-11-11 12:54:06','2022-11-11 13:44:09',1),(10,7,'2022-11-11 12:11:25','2022-11-11 13:34:56',1),(11,2,'2022-11-12 18:28:19','2022-11-12 18:40:06',0),(12,2,'2022-11-12 18:44:06','2022-11-12 19:30:26',1),(13,13,'2022-11-13 08:00:31','2022-11-13 08:45:33',1),(14,13,'2022-11-13 12:32:06','2022-11-13 13:19:36',0),(15,1,'2022-11-14 08:09:23','2022-11-14 08:51:37',0),(16,7,'2022-11-14 08:48:33','2022-11-14 09:51:37',1),(17,6,'2022-11-15 09:01:40','2022-11-15 10:05:26',1),(18,12,'2022-11-15 10:55:56','2022-11-15 11:45:33',1),(19,12,'2022-11-16 08:03:28','2022-11-16 09:13:08',1),(20,7,'2022-11-16 10:54:32','2022-11-16 11:57:14',1),(21,12,'2022-11-17 14:40:47','2022-11-17 15:54:22',1),(22,4,'2022-11-17 10:22:16','2022-11-17 10:42:13',0),(23,11,'2022-11-18 12:54:06','2022-11-18 13:44:09',1),(24,5,'2022-11-18 12:11:25','2022-11-18 13:34:56',1),(25,10,'2022-11-19 18:28:19','2022-11-19 18:40:06',0),(26,12,'2022-11-19 18:44:06','2022-11-19 19:30:26',1),(27,10,'2022-11-20 08:00:31','2022-11-20 08:35:33',0),(28,7,'2022-11-20 12:32:06','2022-11-20 13:19:36',1),(29,12,'2022-11-21 08:09:23','2022-11-21 08:59:37',1),(30,7,'2022-11-21 09:01:40','2022-11-21 10:05:26',1),(31,11,'2023-01-22 10:55:56','2022-11-22 11:45:33',0),(32,3,'2022-11-23 08:03:28','2022-11-23 09:13:08',1),(33,12,'2022-11-23 10:54:32','2022-11-23 11:57:14',1),(34,7,'2022-11-24 14:40:47','2022-11-24 15:54:22',1),(35,3,'2022-11-24 10:22:16','2022-11-24 10:42:13',0),(36,11,'2022-11-25 12:54:06','2022-11-25 13:44:09',1),(37,12,'2022-11-25 12:11:25','2022-11-25 13:34:56',1),(38,7,'2022-11-26 18:28:19','2022-11-26 19:40:06',1),(39,13,'2022-11-26 18:44:06','2022-11-26 19:30:26',1),(40,11,'2022-11-27 08:00:31','2022-11-27 08:35:33',0),(41,7,'2022-11-27 12:32:06','2022-11-28 13:19:36',1),(42,4,'2022-11-28 08:09:23','2022-11-28 08:51:37',0),(43,3,'2022-11-28 09:01:40','2022-11-29 10:05:26',1),(44,7,'2022-11-29 10:55:56','2022-11-29 11:45:33',1),(45,1,'2022-11-30 08:03:28','2022-11-30 09:13:08',1),(46,5,'2022-11-30 10:54:32','2022-11-30 11:57:14',1),(47,7,'2022-12-01 14:40:47','2022-12-01 15:54:22',1),(48,11,'2022-12-01 10:22:16','2022-12-01 10:42:13',0),(49,11,'2022-12-02 12:54:06','2022-12-02 13:44:09',1),(50,13,'2022-12-02 12:11:25','2022-12-02 13:34:56',1),(51,7,'2022-12-03 18:28:19','2022-12-03 19:40:06',1),(52,13,'2022-12-03 18:44:06','2022-12-03 19:30:26',1),(53,5,'2022-12-04 08:00:31','2022-12-04 08:35:33',0),(54,7,'2022-12-04 12:32:06','2022-12-04 13:19:36',1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `session_eligibility_check` BEFORE INSERT ON `attendance` FOR EACH ROW BEGIN
	SET new.eligible_session = IF 
		(TIMESTAMPDIFF(MINUTE, new.check_in, new.check_out) >= 45 AND 
			NOT EXISTS (SELECT member_id, CONVERT(check_in, DATE), eligible_session FROM attendance
			 WHERE member_id=new.member_id AND CONVERT(check_in, DATE)=CONVERT(new.check_in, DATE) AND eligible_session=1),
		1, 0); -- an eligibility of 1 means there was already an eligible session that day
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `coach_id` int DEFAULT NULL,
  `class_description` varchar(30) DEFAULT NULL,
  `class_start` timestamp NULL DEFAULT NULL,
  `class_end` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `coach_id` (`coach_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,4,'HIIT','2023-01-09 07:00:00','2023-01-09 08:00:00'),(2,4,'HIIT','2023-01-09 16:00:00','2023-01-09 17:00:00'),(3,1,'Circuit','2023-01-10 07:00:00','2023-01-10 08:00:00'),(4,1,'Circuit','2023-01-10 16:00:00','2023-01-10 17:00:00'),(5,3,'Strength','2023-01-11 07:00:00','2023-01-11 08:00:00'),(6,3,'Strength','2023-01-11 16:00:00','2023-01-11 17:00:00'),(7,2,'Cardio','2023-01-12 07:00:00','2023-01-12 08:00:00'),(8,2,'Cardio','2023-01-12 16:00:00','2023-01-12 17:00:00'),(9,1,'Spinning','2023-01-13 07:00:00','2023-01-13 08:00:00');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `classschedule`
--

DROP TABLE IF EXISTS `classschedule`;
/*!50001 DROP VIEW IF EXISTS `classschedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classschedule` AS SELECT 
 1 AS `Day`,
 1 AS `Date`,
 1 AS `Start`,
 1 AS `End`,
 1 AS `Class`,
 1 AS `Coach`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  PRIMARY KEY (`coach_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'Lara','Croft','lcroft@fl.com','2022-10-01'),(2,'Pop','Eye','peye@fl.com','2022-11-01'),(3,'Hulk','Green','hgreen@fl.com','2022-11-01'),(4,'Wonder','Woman','wwoman@fl.com','2022-10-01');
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_band` int NOT NULL,
  `discount_percent` int DEFAULT NULL,
  PRIMARY KEY (`discount_band`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (0,0),(1,3),(2,6),(3,9),(4,20);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fee` (
  `member_id` int DEFAULT NULL,
  `discount_band` int DEFAULT NULL,
  `fee` decimal(5,2) DEFAULT '30.00',
  KEY `member_id` (`member_id`),
  KEY `discount_band` (`discount_band`),
  CONSTRAINT `fee_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `fee_ibfk_2` FOREIGN KEY (`discount_band`) REFERENCES `discount` (`discount_band`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fee`
--

LOCK TABLES `fee` WRITE;
/*!40000 ALTER TABLE `fee` DISABLE KEYS */;
/*!40000 ALTER TABLE `fee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Akshay','Kumar','akumar@fl.com'),(2,'John','Smith','jsmith@fl.com'),(3,'Priya','Patel','ppatel@fl.com'),(4,'Tunde','Okoye','tokoye@fl.com'),(5,'Opeyemi','Abiola','oabiola@fl.com'),(6,'Amana','Abubakar','aabubakar@fl.com'),(7,'Dung','Nguyen','dnguyen@fl.com'),(8,'Anh','Tran','atran@fl.com'),(9,'Fang','Zhao','fzhao@fl.com'),(10,'Jenny','Chan','jchan@fl.com'),(11,'Jing','Li','jli@fl.com'),(12,'Jane','Doe','jdoe@fl.com'),(13,'Khalil','Abad','kabad@flcom'),(14,'David','Abrams','dabrams@fl.com'),(15,'Olga','Ivanov','oivanov@fl.com'),(16,'Ivan','Kovalenko','ikovalenko@fl.com');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'FitLife'
--

--
-- Dumping routines for database 'FitLife'
--
/*!50003 DROP FUNCTION IF EXISTS `calculateRevenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculateRevenue`() RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN
	DECLARE revenueThisPeriod decimal(5,2);
    SELECT SUM(fee) FROM fee INTO revenueThisPeriod;
    RETURN revenueThisPeriod;
	
-- again, we are only re-calculating the fee for those who earned a discount (not the whole table)
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateDiscountBand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDiscountBand`()
BEGIN
	-- select only members who have weeks with at least 3 sessions
    -- and return via a Common Table Expression the sum of the count of those weeks,
    -- e.g. a member with a sum of 2 has had 2 weeks with the minimum attendance of 3 sessions
    -- a sum of 2 is equal to discount_band 2, which is 6%
	WITH results AS(
    SELECT m_id, sum(weeks) AS discount_band
	FROM 
	(SELECT member_id as m_id, COUNT(DISTINCT(week(check_in,1))) AS weeks FROM attendance
	-- for this to work for this project, the WHERE clause checks between 7Nov (first timestamp in attendance Table) and now
    -- next to it I have commented the actual code I would use to check 'the last 4 weeks'
    -- 'NOW()' would be as per the event further down that would trigger the day after the end of every 4 week period
    WHERE check_in between '2022-11-07 00:00:00' AND NOW() -- between date_sub(NOW(),INTERVAL 4 WEEK) AND NOW()
	GROUP BY member_id, week(check_in,1)
	HAVING SUM(eligible_session) >=3
	) AS countWeeks
	GROUP BY m_id
    )
    
    -- once we have the results from the CTE, update the fee table with the correct discount_band for each user
    UPDATE fee f
	INNER JOIN results r
    ON r.m_id = f.member_id
    SET f.discount_band = r.discount_band;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateFee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFee`()
BEGIN
	DECLARE defaultFee decimal(5,2);
    SET defaultFee = 30.00;
	UPDATE fee f
    INNER JOIN discount d
	ON f.discount_band = d. discount_band 
	SET f.fee = defaultFee * (100-d.discount_percent)/100;
-- check that all others (where discount != something, stay at 0) 
-- ideally we don't want to re-calc the fee for every member who did not earn any discount
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateFeeTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateFeeTable`()
BEGIN
	INSERT INTO fee(member_id) SELECT member_id FROM members;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `classschedule`
--

/*!50001 DROP VIEW IF EXISTS `classschedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classschedule` AS select dayname(`classes`.`class_start`) AS `Day`,cast(`classes`.`class_start` as date) AS `Date`,cast(`classes`.`class_start` as time) AS `Start`,cast(`classes`.`class_end` as time) AS `End`,`classes`.`class_description` AS `Class`,concat(`coaches`.`first_name`,' ',`coaches`.`surname`) AS `Coach` from (`classes` join `coaches` on((`classes`.`coach_id` = `coaches`.`coach_id`))) order by cast(`classes`.`class_start` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-03 13:27:36
