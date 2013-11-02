-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: jobenfance
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.13.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `llx_axagenda_calendar_event`
--

DROP TABLE IF EXISTS `llx_axagenda_calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_axagenda_calendar_event` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `userId` bigint(255) NOT NULL,
  `calendarId` bigint(255) NOT NULL,
  `repeatType` longtext NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `description` longtext,
  `subject` varchar(255) DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A9BEA59743E7F7` (`calendarId`),
  KEY `FK2A9BEA59581C403A` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `llx_axagenda_calendar_event_reminder`
--

DROP TABLE IF EXISTS `llx_axagenda_calendar_event_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_axagenda_calendar_event_reminder` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `eventId` int(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `early` int(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `alerted` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `llx_axagenda_calendar_setting`
--

DROP TABLE IF EXISTS `llx_axagenda_calendar_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_axagenda_calendar_setting` (
  `userId` int(255) NOT NULL,
  `hourFormat` varchar(255) DEFAULT NULL,
  `dayFormat` varchar(255) DEFAULT NULL,
  `weekFormat` varchar(255) DEFAULT NULL,
  `monthFormat` varchar(255) DEFAULT NULL,
  `fromtoFormat` varchar(255) DEFAULT NULL,
  `activeStartTime` varchar(255) NOT NULL,
  `activeEndTime` varchar(255) NOT NULL,
  `createByDblclick` tinyint(1) NOT NULL,
  `hideInactiveRow` tinyint(1) NOT NULL,
  `singleDay` tinyint(1) NOT NULL,
  `language` varchar(255) NOT NULL,
  `intervalSlot` int(255) NOT NULL DEFAULT '30',
  `startDay` varchar(255) NOT NULL DEFAULT '0',
  `readOnly` tinyint(1) DEFAULT NULL,
  `initialView` int(11) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `llx_axagenda_calendar_type`
--

DROP TABLE IF EXISTS `llx_axagenda_calendar_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_axagenda_calendar_type` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` int(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL,
  `description` longtext,
  `hide` tinyint(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7503A39B581C403A` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `llx_axagenda_user`
--

DROP TABLE IF EXISTS `llx_axagenda_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_axagenda_user` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_show` int(1) NOT NULL,
  `enabled` int(1) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-02 16:56:27
