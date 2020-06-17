DROP DATABASE IF EXISTS accertify;
CREATE DATABASE accertify;

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 10.52.20.119    Database: accertify
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `accertify`.`accertify_recommendations`
--

DROP TABLE IF EXISTS `accertify`.`accertify_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_recommendations` (
  `AccertifyRecommendationId` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  PRIMARY KEY (`AccertifyRecommendationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_recommendations`
--

LOCK TABLES `accertify`.`accertify_recommendations` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_recommendations` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_recommendations` VALUES (1,'ACCEPT'),(2,'REJECT'),(3,'REVIEW');
/*!40000 ALTER TABLE `accertify`.`accertify_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_resolutions`
--

DROP TABLE IF EXISTS `accertify`.`accertify_resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_resolutions` (
  `AccertifyResolutionsId` int(11) NOT NULL AUTO_INCREMENT,
  `BookTransactionId` varchar(100) NOT NULL,
  `ReservationId` int(11) DEFAULT NULL,
  `ResolutionType` varchar(50) NOT NULL,
  `Resolution` varchar(100) DEFAULT NULL,
  `ResolutionDate` datetime NOT NULL,
  `ResolutionId` varchar(100) DEFAULT NULL,
  `Observations` longtext,
  PRIMARY KEY (`AccertifyResolutionsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_resolutions`
--

LOCK TABLES `accertify`.`accertify_resolutions` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_resolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accertify`.`accertify_resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions` (
  `AccertifyTransactionId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyRecommendationId` int(11) NOT NULL,
  `ResponseDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Score` int(11) NOT NULL,
  `BookTransactionId` varchar(100) NOT NULL,
  `ReservationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionId`),
  KEY `FK_AccertifyRecommendation_idx` (`AccertifyRecommendationId`),
  CONSTRAINT `FK_AccertifyRecommendation` FOREIGN KEY (`AccertifyRecommendationId`) REFERENCES `accertify`.`accertify_recommendations` (`AccertifyRecommendationId`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions`
--

LOCK TABLES `accertify`.`accertify_transactions` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions` VALUES (1,1,'2020-03-04 12:57:09',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(5,1,'2020-03-04 13:09:31',1,'d7ac712c-e549-4f13-81d4-200bf1052a10',0),(6,1,'2020-03-04 13:15:17',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(7,1,'2020-03-04 13:15:27',1,'2fe12c8c-d34a-4dd0-93fc-92d5adc9b582',0),(8,1,'2020-03-04 13:33:38',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(9,1,'2020-03-04 17:35:31',1,'d7ac712c-e549-4f13-81d4-200bf1052a10',0),(10,1,'2020-03-04 17:45:25',1,'18dce788-4b85-4dd1-9427-94bde5aa1dce',0),(11,1,'2020-03-05 16:46:28',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(14,1,'2020-03-06 13:12:17',1,'e9156bec-c29a-4545-b8cf-ea20ff5e6cfa',0),(15,3,'2020-03-06 13:16:32',7001,'e9156bec-c29a-4545-b8cf-ea20ff5e6cfa',0),(16,3,'2020-03-06 13:28:51',7001,'e9156bec-c29a-4545-b8cf-ea20ff5e6cfa',0),(17,1,'2020-03-13 17:12:39',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(18,1,'2020-03-17 14:39:18',1,'e9156bec-c29a-4545-b8cf-ea20ff5e6cfa',0),(19,1,'2020-03-17 15:03:23',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(20,1,'2020-03-17 15:09:43',1,'18dce788-4b85-4dd1-9427-94bde5aa1dce',0),(21,1,'2020-03-17 15:12:36',1,'2fe12c8c-d34a-4dd0-93fc-92d5adc9b582',0),(22,1,'2020-03-17 15:15:06',1,'2fe12c8c-d34a-4dd0-93fc-92d5adc9b582',0),(23,1,'2020-03-17 16:02:03',1,'t12fe12c8c-d34a-4dd0-93fc-92d5adc9b582',0),(24,3,'2020-03-17 17:04:32',7001,'c09ea673-8a2b-456c-ade7-c892e442fc5f',97000170),(25,3,'2020-03-17 17:05:02',7001,'c09ea673-8a2b-456c-ade7-c892e442fc5f',97000170),(26,3,'2020-03-17 17:17:37',7001,'f2e9f3a8-d321-46e5-992c-9a0eedd4a9fd',0),(27,3,'2020-03-17 17:28:26',7001,'f2e9f3a8-d321-46e5-992c-9a0eedd4a9fd',0),(28,3,'2020-03-17 17:37:37',7001,'f2e9f3a8-d321-46e5-992c-9a0eedd4a9fd',0),(29,1,'2020-03-17 17:38:20',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(30,1,'2020-03-17 17:54:24',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(31,1,'2020-03-17 18:04:50',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(32,3,'2020-03-17 18:17:55',7001,'06577b5d-8904-47af-b68b-a81481b45dad',0),(33,3,'2020-03-17 18:18:14',7001,'06577b5d-8904-47af-b68b-a81481b45dad',97000291),(34,1,'2020-03-17 18:47:23',1,'4f4c3f27-d2f7-46c9-834b-b60d6b46919f',0),(35,3,'2020-03-18 09:17:08',7001,'be8e6fed-c64d-4570-ab12-ead98c607747',0),(36,3,'2020-03-18 09:17:39',7001,'be8e6fed-c64d-4570-ab12-ead98c607747',97000292),(37,3,'2020-03-18 09:29:45',7001,'0537294d-478b-4182-9746-7313c1f9fead',0),(38,3,'2020-03-18 09:29:58',7001,'0537294d-478b-4182-9746-7313c1f9fead',97000293),(39,1,'2020-03-18 10:23:15',1,'c09ea673-8a2b-456c-ade7-c892e442fc5f',97000170),(40,1,'2020-03-18 10:38:14',1,'c09ea673-8a2b-456c-ade7-c892e442fc5f',97000170),(41,3,'2020-03-18 12:31:35',7001,'1xac3f27-d2f7-46c9-834b-b60d6b46919f',0),(42,3,'2020-03-18 12:32:00',7001,'1xac3f27-d2f7-46c9-834b-b60d6b46919f',97000294),(43,3,'2020-03-18 13:51:26',7001,'1xac3f27-d2f7-46c9-834b-b60d6b46919f',0),(44,3,'2020-03-18 13:51:47',7001,'1xac3f27-d2f7-46c9-834b-b60d6b46919f',97000295),(45,2,'2020-03-18 13:54:55',50001,'97a291bc-0aba-48c8-8b67-9249d158fccb',0),(46,2,'2020-03-18 13:55:06',50001,'97a291bc-0aba-48c8-8b67-9249d158fccb',97000296),(47,3,'2020-03-18 14:05:39',7001,'1xac3f27-d2f7-46c9-834b-b60d6b46919f',0),(48,3,'2020-03-18 14:05:53',7001,'1xac3f27-d2f7-46c9-834b-b60d6b46919f',97000297),(49,3,'2020-03-18 14:06:35',7001,'1xac8f27-d2f7-46c9-834b-b60d6b46919f',0),(50,3,'2020-03-18 14:06:47',7001,'1xac8f27-d2f7-46c9-834b-b60d6b46919f',97000298),(51,3,'2020-03-18 18:28:41',7001,'1xac8f27-d2f7-46c9-834b-b60d6b46919f',0),(52,3,'2020-03-18 18:29:05',7001,'1xac8f27-d2f7-46c9-834b-b60d6b46919f',97000299),(53,3,'2020-03-18 18:33:45',7001,'3xac8f29-d2f7-46c9-834b-b60d6b46919f',0),(54,3,'2020-03-18 18:33:56',7001,'3xac8f29-d2f7-46c9-834b-b60d6b46919f',97000300),(56,3,'2020-03-18 19:37:10',7001,'2a155954-fd80-47e4-a951-b858dc632f90',0),(57,3,'2020-03-18 19:37:29',7001,'2a155954-fd80-47e4-a951-b858dc632f90',97000304),(58,3,'2020-03-18 19:42:12',7001,'4bfcd048-43b7-4e6e-b080-903fb5454227',0),(59,3,'2020-03-18 19:42:23',7001,'4bfcd048-43b7-4e6e-b080-903fb5454227',97000305),(60,3,'2020-03-19 09:25:28',7001,'8163f844-35a4-45d9-a80d-2930b4e11918',0),(61,3,'2020-03-19 09:25:43',7001,'8163f844-35a4-45d9-a80d-2930b4e11918',97000306),(62,3,'2020-03-19 10:08:38',7001,'4ffa0583-ed52-4934-a7cb-e053f7e6c4ca',0),(63,3,'2020-03-19 10:08:52',7001,'4ffa0583-ed52-4934-a7cb-e053f7e6c4ca',97000308),(64,1,'2020-03-19 10:31:30',1,'3a31a054-b673-41b3-8fd2-42b36f341094',0),(65,1,'2020-03-19 11:10:28',-45641,'ad55b8f3-69b1-494a-913a-a775da3f3ccf',0),(66,1,'2020-03-19 11:10:34',-45639,'ad55b8f3-69b1-494a-913a-a775da3f3ccf',97000309),(67,3,'2020-03-19 11:19:03',7001,'b0da0ff3-6954-4361-9083-671528e4f7d6',0),(68,3,'2020-03-19 11:19:17',7001,'b0da0ff3-6954-4361-9083-671528e4f7d6',97000310),(69,3,'2020-03-19 11:29:04',7001,'b0da0ff3-6954-4361-9083-671528e4f7d6',0),(70,3,'2020-03-19 11:29:14',7001,'b0da0ff3-6954-4361-9083-671528e4f7d6',97000311),(71,1,'2020-03-19 11:46:14',1,'3a31a054-b673-41b3-8fd2-42b36f341094',0),(72,1,'2020-03-19 12:14:11',1,'3a31a054-b673-41b3-8fd2-42b36f341094',0),(73,1,'2020-03-19 12:34:26',1,'3a31a054-b673-41b3-8fd2-42b36f341094',0),(74,3,'2020-03-19 12:41:27',7001,'7c4f62de-74fc-475f-b4d0-f78551264529',0),(75,3,'2020-03-19 12:41:51',7001,'7c4f62de-74fc-475f-b4d0-f78551264529',97000312),(76,3,'2020-03-19 13:23:11',7001,'19aeac91-69a1-4380-a1aa-616e6ebabf26',0),(77,3,'2020-03-19 13:23:21',7001,'19aeac91-69a1-4380-a1aa-616e6ebabf26',97000313),(78,3,'2020-03-19 13:25:07',7001,'19aeac91-69a1-4380-a1aa-616e6ebabf26',0),(79,3,'2020-03-19 13:25:14',7001,'19aeac91-69a1-4380-a1aa-616e6ebabf26',97000314),(80,3,'2020-03-19 19:29:06',7001,'89b21e5d-6c8f-498d-9f77-ef97b875f7e3',0),(81,3,'2020-03-19 19:29:25',7001,'89b21e5d-6c8f-498d-9f77-ef97b875f7e3',97000315),(82,3,'2020-03-19 19:32:57',7001,'89b21e5d-6c8f-498d-9f77-ef97b875f7e3',0),(83,3,'2020-03-19 19:33:08',7001,'89b21e5d-6c8f-498d-9f77-ef97b875f7e3',97000316),(84,1,'2020-03-20 11:23:21',1,'05141db9-df4a-4e74-8f62-bbb2bea86e24',0),(85,3,'2020-03-20 11:49:58',7001,'t2a35223-a5fd-45cc-b417-3106602fb10c',0),(86,3,'2020-03-20 11:50:21',7001,'t2a35223-a5fd-45cc-b417-3106602fb10c',97000317),(87,3,'2020-03-20 11:51:51',7001,'94613c19-df3f-4620-a155-00e0888a3d8f',0),(88,3,'2020-03-20 11:52:05',7001,'94613c19-df3f-4620-a155-00e0888a3d8f',97000318),(89,3,'2020-03-20 16:11:38',7001,'t025182fa-02ee-4ea5-9411-9b0de1d8408c',0),(95,2,'2020-03-20 17:04:13',189316,'b68e5f52-90e5-4688-944b-e1547690f1aa',78965412),(96,2,'2020-03-20 17:11:41',189316,'b68e5f52-90e5-4688-944b-e1547690f1aa',78965412),(97,1,'2020-03-20 17:21:11',1,'3a31a054-b673-41b3-8fd2-42b36f341094',0),(98,1,'2020-03-20 17:21:57',1,'05141db9-df4a-4e74-8f62-bbb2bea86e24',0),(99,1,'2020-03-20 17:22:07',1,'3a31a054-b673-41b3-8fd2-42b36f341094',0),(100,2,'2020-03-20 17:31:10',189316,'b68e5f52-90e5-4688-944b-e1547690f1aa',78965412),(101,2,'2020-03-20 17:41:00',171017,'b68e5f52-90e5-4688-944b-e1547690f1aa',78965412),(102,1,'2020-03-20 17:44:25',1,'461e624a-dcdb-4443-9ba8-b946c2e5b5e8',0),(103,1,'2020-03-20 17:44:40',1,'461e624a-dcdb-4443-9ba8-b946c2e5b5e8',97000319),(107,2,'2020-03-20 18:05:01',171218,'b68e5f52-90e5-4688-944b-e1547690f1aa',78965412);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_cars`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_cars` (
  `AccertifyTransactionCarId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `Supplier` varchar(100) DEFAULT NULL,
  `DeliverCity` varchar(100) DEFAULT NULL,
  `DeliverDate` datetime DEFAULT NULL,
  `DevolutionCity` varchar(100) DEFAULT NULL,
  `DevolutionDate` datetime DEFAULT NULL,
  `Amount` decimal(10,4) DEFAULT NULL,
  `AmountUSD` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionCarId`),
  KEY `FK_AccertifyTransactionId_idx` (`AccertifyTransactionId`),
  CONSTRAINT `FK_AccertifyTransactionIdCars` FOREIGN KEY (`AccertifyTransactionId`) REFERENCES `accertify`.`accertify_transactions` (`AccertifyTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_cars`
--

LOCK TABLES `accertify`.`accertify_transactions_cars` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_cars` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_cars` VALUES (1,10,'Hertz','','2020-03-30 14:00:00','','2020-03-31 14:00:00',154.2200,7.8290),(2,20,'Hertz','','2020-03-30 14:00:00','','2020-03-31 14:00:00',154.2200,7.8290),(3,60,'Hertz','','2020-06-23 14:00:00','','2020-06-24 14:00:00',118.8500,5.1545),(4,61,'Hertz','','2020-06-23 14:00:00','','2020-06-24 14:00:00',118.8500,5.1545),(5,107,'Alamo','FLMiami Beach','2020-10-02 00:00:00','FLMiami Beach','2020-10-06 15:00:00',3082.6400,139.1598);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_flights`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_flights` (
  `AccertifyTransactionFlightId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `Airline` varchar(100) DEFAULT NULL,
  `DepartureAirport` varchar(100) DEFAULT NULL,
  `DepartureDate` datetime DEFAULT NULL,
  `ArriveAirport` varchar(100) DEFAULT NULL,
  `ArriveDate` datetime DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionFlightId`),
  KEY `FK_AccertifyTransactionIdFlights_idx` (`AccertifyTransactionId`),
  CONSTRAINT `FK_AccertifyTransactionIdFlights` FOREIGN KEY (`AccertifyTransactionId`) REFERENCES `accertify`.`accertify_transactions` (`AccertifyTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_flights`
--

LOCK TABLES `accertify`.`accertify_transactions_flights` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_flights` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_flights` VALUES (1,7,'Aeromexico','CUN','2020-04-30 08:30:00','MEX',NULL),(2,22,'Aeromexico','CUN','2020-04-30 08:30:00','MEX',NULL),(3,23,'Aeromexico','CUN','2020-04-30 08:30:00','MEX',NULL),(4,58,'Aeromexico','CUN','2020-05-31 10:50:00','MEX',NULL),(5,59,'Aeromexico','CUN','2020-05-31 10:50:00','MEX',NULL),(6,65,'Aeromexico','CUN','2020-04-30 06:01:00','MEX',NULL),(7,66,'Aeromexico','CUN','2020-04-30 06:01:00','MEX',NULL),(8,67,'Aeromexico','CUN','2020-04-30 07:30:00','MEX',NULL),(9,68,'Aeromexico','CUN','2020-04-30 07:30:00','MEX',NULL),(10,69,'Aeromexico','CUN','2020-04-30 07:30:00','MEX',NULL),(11,70,'Aeromexico','CUN','2020-04-30 07:30:00','MEX',NULL),(12,76,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(13,77,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(14,78,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(15,79,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(16,80,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(17,81,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(18,82,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(19,83,'Aeromexico','CUN','2020-06-30 21:35:00','MEX',NULL),(20,101,'Viva Aerobus','CUN','2020-03-20 18:15:00','GDL',NULL),(21,107,'Viva Aerobus','CUN','2020-03-20 18:15:00','GDL',NULL);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_hotels`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_hotels` (
  `AccertifyTransactionsHotelsId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `HotelId` int(11) DEFAULT NULL,
  `HotelName` varchar(200) DEFAULT NULL,
  `DestinationId` int(11) DEFAULT NULL,
  `DestinationName` varchar(200) DEFAULT NULL,
  `CityId` varchar(50) DEFAULT NULL,
  `CityName` varchar(200) DEFAULT NULL,
  `HotelNotificationType` int(11) DEFAULT NULL,
  `CheckIn` datetime DEFAULT NULL,
  `CheckOut` datetime DEFAULT NULL,
  `Amount` decimal(10,4) DEFAULT NULL,
  `AmountUSD` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionsHotelsId`),
  KEY `FK_AccertifyTransactionIdHotels_idx` (`AccertifyTransactionId`),
  CONSTRAINT `FK_AccertifyTransactionIdHotels` FOREIGN KEY (`AccertifyTransactionId`) REFERENCES `accertify`.`accertify_transactions` (`AccertifyTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_hotels`
--

LOCK TABLES `accertify`.`accertify_transactions_hotels` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_hotels` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_hotels` VALUES (1,5,2243,'Suites Gaby Hotel',2,'','MXCanzc','Cancún-Centro',82,'2020-06-21 15:00:00','2020-06-23 15:00:00',1523.1760,77.3245),(2,9,2243,'Suites Gaby Hotel',2,'','MXCanzc','Cancún-Centro',82,'2020-06-21 15:00:00','2020-06-23 15:00:00',1523.1760,77.3245),(3,21,2243,'Suites Gaby Hotel',2,'','MXCanzc','Cancún-Centro',82,'2020-06-21 15:00:00','2020-06-23 15:00:00',0.0000,0.0000),(4,72,2243,'Suites Gaby Hotel',2,'','MXCanzc','Cancún-Centro',82,'2020-07-30 15:00:00','2020-07-31 15:00:00',1523.1760,66.0605),(5,73,2243,'Suites Gaby Hotel',2,'','MXCanzc','Cancún-Centro',82,'2020-07-30 15:00:00','2020-07-31 15:00:00',1523.1760,66.0605),(6,74,4248,'Hotel HC Internacional',2,'','MXCanzc','Cancún-Centro',65,'2020-06-30 15:00:00','2020-07-01 15:00:00',564.3000,24.4738),(7,75,4248,'Hotel HC Internacional',2,'','MXCanzc','Cancún-Centro',65,'2020-06-30 15:00:00','2020-07-01 15:00:00',564.3000,24.4738),(8,80,3768,'Emporio Cancún',2,'','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',69,'2020-05-31 15:00:00','2020-06-01 15:00:00',2619.0060,113.5868),(9,81,3768,'Emporio Cancún',2,'','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',69,'2020-05-31 15:00:00','2020-06-01 15:00:00',2619.0060,113.5868),(10,82,3768,'Emporio Cancún',2,'','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',69,'2020-05-31 15:00:00','2020-06-01 15:00:00',2619.0060,113.5868),(11,83,3768,'Emporio Cancún',2,'','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',69,'2020-05-31 15:00:00','2020-06-01 15:00:00',2619.0060,113.5868),(12,85,10,'Imperial Las Perlas',2,'','MXCzhbahia','Cancún-Zona Hotelera Bahía Isla Mujeres',69,'2020-07-30 15:00:00','2020-07-31 15:00:00',1285.2000,53.7723),(13,86,10,'Imperial Las Perlas',2,'','MXCzhbahia','Cancún-Zona Hotelera Bahía Isla Mujeres',69,'2020-07-30 15:00:00','2020-07-31 15:00:00',1285.2000,53.7723),(14,87,3768,'Emporio Cancún',2,'','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',69,'2020-04-30 15:00:00','2020-05-01 15:00:00',2779.3530,116.2870),(15,88,3768,'Emporio Cancún',2,'','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',69,'2020-04-30 15:00:00','2020-05-01 15:00:00',2779.3530,116.2870),(16,107,326,'Hard Rock Hotel Cancún',2,'Cancún','MXCmarcarib','Cancún-Zona Hotelera Mar Caribe',87,'2020-03-18 15:00:00','2020-03-20 15:00:00',11994.6100,541.4734);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_payments`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_payments` (
  `AccertifyTransactionPaymentId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `Holder` varchar(200) DEFAULT NULL,
  `CreditCard` varchar(2) DEFAULT NULL,
  `Amount` decimal(10,4) DEFAULT NULL,
  `AmountUSD` decimal(10,4) DEFAULT NULL,
  `CardNumber` varchar(16) DEFAULT NULL,
  `Authorization` varchar(50) DEFAULT NULL,
  `BankResponse` varchar(100) DEFAULT NULL,
  `IsOnline` tinyint(4) DEFAULT NULL,
  `PaymentEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionPaymentId`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_payments`
--

LOCK TABLES `accertify`.`accertify_transactions_payments` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_payments` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_payments` VALUES (1,1,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(5,5,'prueba prueba','V',1523.1700,77.3242,'491566XXXXXX8367','','',0,'accept@bestday.com'),(6,6,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(7,7,'prueba','V',2101.8400,109.7080,'491566XXXXXX8367','','',0,'accept@bestday.com'),(8,8,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(9,9,'prueba prueba','V',1523.1700,77.3242,'491566XXXXXX8367','','',0,'accept@bestday.com'),(10,10,'prueba','V',154.2200,7.8290,'491566XXXXXX8367','','',0,'accept@bestday.com'),(11,11,'Prueba','V',268.1000,13.9029,'491566XXXXXX8367','','',0,'accept@bestday.com'),(14,14,'Prueba','V',149.0000,7.6279,'491566XXXXXX8367','','',0,'accept@bestday.com'),(15,15,'Prueba','V',149.0000,7.6279,'491566XXXXXX8367','','',0,'review@bestday.com'),(16,16,'Prueba','V',149.0000,7.6279,'491566XXXXXX8367','','',0,'review@bestday.com'),(17,17,'Prueba','V',268.1000,12.6385,'491566XXXXXX8367','','',0,'accept@bestday.com'),(18,19,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(19,20,'prueba','V',154.2200,7.8290,'491566XXXXXX8367','','',0,'accept@bestday.com'),(20,21,'prueba','V',2101.8400,109.7080,'491566XXXXXX8367','','',0,'accept@bestday.com'),(21,22,'prueba','V',2101.8400,109.7080,'491566XXXXXX8367','','',0,'accept@bestday.com'),(22,23,'prueba','V',2101.8400,109.7080,'491566XXXXXX8367','','',0,'accept@bestday.com'),(23,26,'prueba','V',750.0000,33.8573,'491566XXXXXX8367','','',0,'review@bestday.com'),(24,27,'prueba','V',750.0000,33.8573,'491566XXXXXX8367','','',0,'review@bestday.com'),(25,28,'prueba','V',750.0000,33.8573,'491566XXXXXX8367','','',0,'review@bestday.com'),(26,29,'Prueba','V',268.1000,12.1029,'491566XXXXXX8367','','',0,'accept@bestday.com'),(27,30,'Prueba','V',268.1000,12.1029,'491566XXXXXX8367','','',0,'accept@bestday.com'),(28,31,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(29,32,'prueba prueba','V',170.0000,7.6743,'491566XXXXXX8367','','',0,'Review@bestday.com'),(30,33,'prueba prueba','V',170.0000,7.6743,'491566XXXXXX8367','','',0,'Review@bestday.com'),(31,34,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(32,35,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(33,36,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(34,37,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(35,38,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(36,39,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(37,40,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(38,41,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(39,42,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(40,43,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(41,44,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(42,45,'Approved prueba','V',750.0000,34.2016,'517844XXXXXX2238','','',0,'reject@bestday.com'),(43,46,'Approved prueba','V',750.0000,34.2016,'517844XXXXXX2238','','',0,'reject@bestday.com'),(44,47,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(45,48,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(46,49,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(47,50,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(48,51,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(49,52,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(50,53,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(51,54,'prueba prueba','V',170.0000,7.7524,'491566XXXXXX8367','','',0,'Review@bestday.com'),(53,56,'prueba','V',750.0000,34.2016,'517844XXXXXX2238','','',0,'Review@bestday.com'),(54,57,'prueba','V',750.0000,34.2016,'517844XXXXXX2238','','',0,'Review@bestday.com'),(55,58,'prueba prueba','V',2667.0417,121.6228,'517844XXXXXX2238','','',0,'Review@bestday.com'),(56,59,'prueba prueba','V',2667.0417,121.6228,'517844XXXXXX2238','','',0,'Review@bestday.com'),(57,60,'prueba','V',118.8500,5.1545,'517844XXXXXX2238','','',0,'Review@bestday.com'),(58,61,'prueba','V',118.8500,5.1545,'517844XXXXXX2238','','',0,'Review@bestday.com'),(59,62,'prueba','V',149.0000,6.4622,'517844XXXXXX2238','','',0,'Review@bestday.com'),(60,63,'prueba','V',149.0000,6.4622,'517844XXXXXX2238','','',0,'Review@bestday.com'),(61,64,'prueba prueba','V',1523.1700,66.0602,'491566XXXXXX8367','','',0,'accept@bestday.com'),(62,65,'moises m','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'moises.perez@gmail.com'),(63,66,'moises m','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'moises.perez@gmail.com'),(64,67,'prueba prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(65,68,'prueba prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(66,69,'prueba prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(67,70,'prueba prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(68,71,'prueba prueba','V',1523.1700,66.0602,'491566XXXXXX8367','','',0,'accept@bestday.com'),(69,72,'prueba prueba','V',1523.1700,66.0602,'491566XXXXXX8367','','',0,'accept@bestday.com'),(70,73,'prueba prueba','V',1523.1700,66.0602,'491566XXXXXX8367','','',0,'accept@bestday.com'),(71,74,'prueba','V',564.2900,24.4734,'517844XXXXXX2238','','',0,'Review@bestday.com'),(72,75,'prueba','V',564.2900,24.4734,'517844XXXXXX2238','','',0,'Review@bestday.com'),(73,76,'prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(74,77,'prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(75,78,'prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(76,79,'prueba','V',2070.9650,89.8182,'517844XXXXXX2238','','',0,'Review@bestday.com'),(77,80,'prueba prueba','V',5575.6360,241.8165,'517844XXXXXX2238','','',0,'Review@bestday.com'),(78,81,'prueba prueba','V',5575.6360,241.8165,'517844XXXXXX2238','','',0,'Review@bestday.com'),(79,82,'prueba prueba','V',5575.6360,241.8165,'517844XXXXXX2238','','',0,'Review@bestday.com'),(80,83,'prueba prueba','V',5575.6360,241.8165,'517844XXXXXX2238','','',0,'Review@bestday.com'),(81,84,'Prueba','V',268.1000,13.8215,'491566XXXXXX8367','','',0,'accept@bestday.com'),(82,85,'Approved prueba','V',1743.0732,72.9295,'517844XXXXXX2238','','',0,'Review@bestday.com'),(83,86,'Approved prueba','V',1743.0732,72.9295,'517844XXXXXX2238','','',0,'Review@bestday.com'),(84,87,'prueba','V',2779.3500,116.2869,'517844XXXXXX2238','','',0,'Review@bestday.com'),(85,88,'prueba','V',2779.3500,116.2869,'517844XXXXXX2238','','',0,'Review@bestday.com'),(86,89,'prueba','V',750.0000,33.8573,'491566XXXXXX8367','','',0,'review@bestday.com'),(92,95,'JUAN PEREZ','A',379.5000,72.4237,'342663XXXXXX7262','','',1,'juan.perez@miserver.com'),(93,96,'JUAN PEREZ','A',379.5000,72.4237,'342663XXXXXX7262','','',1,'juan.perez@miserver.com'),(94,97,'prueba prueba','V',1523.1700,63.7288,'491566XXXXXX8367','','',0,'accept@bestday.com'),(95,98,'Prueba','V',268.1000,11.2172,'491566XXXXXX8367','','',0,'accept@bestday.com'),(96,99,'prueba prueba','V',1523.1700,63.7288,'491566XXXXXX8367','','',0,'accept@bestday.com'),(97,100,'JUAN PEREZ','A',379.5000,72.4237,'342663XXXXXX7262','','',1,'juan.perez@miserver.com'),(98,101,'JUAN PEREZ','A',379.5000,72.4237,'342663XXXXXX7262','','',1,'juan.perez@miserver.com'),(99,102,'Approved prueba','V',750.0000,31.3797,'517844XXXXXX2238','','',0,'accept@bestday.com'),(100,103,'Approved prueba','V',750.0000,31.3797,'517844XXXXXX2238','QA866633','Approved',0,'accept@bestday.com'),(101,107,'JUAN PEREZ','A',379.5000,72.4237,'342663XXXXXX7262','','',1,'juan.perez@miserver.com');
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_pnrs`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_pnrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_pnrs` (
  `AccertifyTransactionPNRId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `PNR` varchar(100) DEFAULT NULL,
  `PNRName` varchar(200) DEFAULT NULL,
  `PNRTelephone` varchar(200) DEFAULT NULL,
  `PNRAmount` decimal(10,4) DEFAULT NULL,
  `PNRAmountUSD` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionPNRId`),
  KEY `FK_AccertifyTransactionPNRId_idx` (`AccertifyTransactionId`),
  CONSTRAINT `FK_AccertifyTransactionPNRId` FOREIGN KEY (`AccertifyTransactionId`) REFERENCES `accertify`.`accertify_transactions` (`AccertifyTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_pnrs`
--

LOCK TABLES `accertify`.`accertify_transactions_pnrs` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_pnrs` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_pnrs` VALUES (1,7,'1',' ','',2101.8400,109.7080),(2,22,'1',' ','',2101.8400,109.7080),(3,23,'1',' ','',2101.8400,109.7080),(4,58,'1',' ','',3549.5200,161.8657),(5,59,'1',' ','',3549.5200,161.8657),(6,65,'1',' ','',4388.8000,190.3432),(7,66,'1',' ','',4388.8000,190.3432),(8,67,'1',' ','',2070.9650,89.8182),(9,68,'1',' ','',2070.9650,89.8182),(10,69,'1',' ','',2070.9650,89.8182),(11,70,'1',' ','',2070.9650,89.8182),(12,76,'1',' ','',2070.9650,89.8182),(13,77,'1',' ','',2070.9650,89.8182),(14,78,'1',' ','',2070.9650,89.8182),(15,79,'1',' ','',2070.9650,89.8182),(16,80,'1',' ','',1237.6000,53.6750),(17,81,'1',' ','',1237.6000,53.6750),(18,82,'1',' ','',1237.6000,53.6750),(19,83,'1',' ','',1237.6000,53.6750),(20,101,'ZZZZZZ','Jose Perez',' (+52)3366554477',6283.0400,283.6356),(21,107,'ZZZZZZ','Jose Perez',' (+52)3366554477',6283.0400,283.6356);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_pnrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_shuttles`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_shuttles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_shuttles` (
  `AccertifyTransactionShuttleId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `ShuttleId` int(11) DEFAULT NULL,
  `ShuttleName` varchar(100) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Departure` datetime DEFAULT NULL,
  `Arrive` datetime DEFAULT NULL,
  `DestinationId` int(11) DEFAULT NULL,
  `Destination` varchar(100) DEFAULT NULL,
  `Amount` decimal(10,4) DEFAULT NULL,
  `AmountUSD` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionShuttleId`),
  KEY `FK_AccertifyTransactionId_idx` (`AccertifyTransactionId`),
  CONSTRAINT `FK_AccertifyTransactionIdShuttles` FOREIGN KEY (`AccertifyTransactionId`) REFERENCES `accertify`.`accertify_transactions` (`AccertifyTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_shuttles`
--

LOCK TABLES `accertify`.`accertify_transactions_shuttles` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_shuttles` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_shuttles` VALUES (1,14,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-03-31 01:00:00',2,'Cancún',149.0000,7.6279),(2,15,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-03-31 01:00:00',2,'Cancún',149.0000,7.6279),(3,16,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-03-31 01:00:00',2,'Cancún',149.0000,7.6279),(4,18,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-03-31 01:00:00',2,'Cancún',149.0000,7.8778),(5,62,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-04-23 01:01:00',2,'Cancún',149.0000,6.4622),(6,63,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-04-23 01:01:00',2,'Cancún',149.0000,6.4622),(7,64,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-04-23 01:01:00',2,'Cancún',149.0000,6.4622),(8,71,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-04-23 01:01:00',2,'Cancún',149.0000,6.4622),(9,97,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-04-23 01:01:00',2,'Cancún',149.0000,6.2341),(10,99,600,'Traslado Compartido:Vehiculo con AA y WiFi','BD Experience',NULL,'2020-04-23 01:01:00',2,'Cancún',149.0000,6.2341),(11,107,11,'Traslado Privado Van (9 Personas) - Vehiculo con AA y WiFi','BD Experience','2020-03-20 19:31:00','2020-03-20 19:31:00',2,'Cancun',1400.0000,63.2003);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_shuttles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accertify`.`accertify_transactions_tours`
--

DROP TABLE IF EXISTS `accertify`.`accertify_transactions_tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accertify`.`accertify_transactions_tours` (
  `AccertifyTransactionTourId` int(11) NOT NULL AUTO_INCREMENT,
  `AccertifyTransactionId` int(11) NOT NULL,
  `TourId` int(11) DEFAULT NULL,
  `Tour` varchar(100) DEFAULT NULL,
  `DestinationId` int(11) DEFAULT NULL,
  `DestinationName` varchar(100) DEFAULT NULL,
  `TourDate` datetime DEFAULT NULL,
  `Amount` decimal(10,4) DEFAULT NULL,
  `AmountUSD` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`AccertifyTransactionTourId`),
  KEY `FK_AccertifyTransactionIdTours_idx` (`AccertifyTransactionId`),
  CONSTRAINT `FK_AccertifyTransactionIdTours` FOREIGN KEY (`AccertifyTransactionId`) REFERENCES `accertify`.`accertify_transactions` (`AccertifyTransactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accertify`.`accertify_transactions_tours`
--

LOCK TABLES `accertify`.`accertify_transactions_tours` WRITE;
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_tours` DISABLE KEYS */;
INSERT INTO `accertify`.`accertify_transactions_tours` VALUES (1,1,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(2,6,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(3,8,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(4,11,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.9029),(5,17,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,12.6385),(6,19,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(7,26,1258,'Tour Ventura Park',0,'','2020-05-15 00:00:00',750.0000,33.8573),(8,27,1258,'Tour Ventura Park',0,'','2020-05-15 00:00:00',750.0000,33.8573),(9,28,1258,'Tour Ventura Park',0,'','2020-05-15 00:00:00',750.0000,33.8573),(10,29,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,12.1029),(11,30,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,12.1029),(12,31,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(13,32,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.6743),(14,33,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.6743),(15,34,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(16,35,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(17,36,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(18,37,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(19,38,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(20,39,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(21,40,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(22,41,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(23,42,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(24,43,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(25,44,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(26,45,1258,'Tour Ventura Park',0,'','2020-05-20 00:00:00',750.0000,34.2016),(27,46,1258,'Tour Ventura Park',0,'','2020-05-20 00:00:00',750.0000,34.2016),(28,47,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(29,48,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(30,49,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(31,50,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(32,51,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(33,52,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(34,53,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(35,54,712,'Tour Turibus Centro Histórico, Basílica, Polanco y Zona Sur',0,'','2020-06-30 00:00:00',170.0000,7.7524),(36,56,1258,'Tour Ventura Park',0,'','2020-04-30 00:00:00',750.0000,34.2016),(37,57,1258,'Tour Ventura Park',0,'','2020-04-30 00:00:00',750.0000,34.2016),(38,84,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,13.8215),(39,89,1258,'Tour Ventura Park',0,'','2020-05-15 00:00:00',750.0000,33.8573),(40,95,4381,'Universal Theme Parks Orlando',0,'','2020-04-14 00:00:00',1107.0800,212.4914),(41,96,4381,'Universal Theme Parks Orlando',0,'','2020-04-14 00:00:00',1107.0800,212.4914),(42,98,1913,'Tour Parque Acuático Hydrobounce',0,'','2019-05-17 00:00:00',268.1000,11.2172),(43,100,4381,'Universal Theme Parks Orlando',0,'','2020-04-14 00:00:00',1107.0800,212.4914),(44,102,1258,'Tour Ventura Park',0,'','2020-04-30 00:00:00',750.0000,31.3797),(45,103,1258,'Tour Ventura Park',0,'','2020-04-30 00:00:00',750.0000,31.3797),(46,107,4381,'Universal Theme Parks Orlando',0,'','2020-04-14 00:00:00',1107.0800,212.4914);
/*!40000 ALTER TABLE `accertify`.`accertify_transactions_tours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-01 16:26:09
