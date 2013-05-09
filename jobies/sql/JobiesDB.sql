# ************************************************************
# Sequel Pro SQL dump
# Version 4004
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29)
# Database: JobiesDB
# Generation Time: 2013-04-30 04:12:38 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Emails`;

CREATE TABLE `Emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(255) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Emails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Emails` WRITE;
/*!40000 ALTER TABLE `Emails` DISABLE KEYS */;

INSERT INTO `Emails` (`id`, `userId`, `email`)
VALUES
	(1,2,'zach@gmail.com'),
	(2,2,'newzach@gmail.com');

/*!40000 ALTER TABLE `Emails` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Employers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Employers`;

CREATE TABLE `Employers` (
  `id` int(11) NOT NULL,
  `userId` int(255) NOT NULL,
  `employerName` varchar(50) NOT NULL DEFAULT '',
  `employerLocation` varchar(50) NOT NULL DEFAULT '',
  `employerAbout` varchar(500) NOT NULL DEFAULT '',
  `employerPhone` varchar(20) DEFAULT NULL,
  `employerURL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Employers_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table FollowedEmployers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FollowedEmployers`;

CREATE TABLE `FollowedEmployers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `studentId` int(11) DEFAULT NULL,
  `employerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employerId` (`employerId`),
  KEY `studentId` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table FollowedJobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `FollowedJobs`;

CREATE TABLE `FollowedJobs` (
  `jobId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  PRIMARY KEY (`jobId`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `FollowedJobs_ibfk_1` FOREIGN KEY (`jobId`) REFERENCES `Jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Jobs`;

CREATE TABLE `Jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdBy` int(255) NOT NULL,
  `jobTitle` varchar(50) DEFAULT NULL,
  `description` text,
  `datePosted` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `applicationURL` varchar(50) DEFAULT '',
  `salary` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`),
  CONSTRAINT `Jobs_ibfk_1` FOREIGN KEY (`createdBy`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Jobs` WRITE;
/*!40000 ALTER TABLE `Jobs` DISABLE KEYS */;

INSERT INTO `Jobs` (`id`, `createdBy`, `jobTitle`, `description`, `datePosted`, `expirationDate`, `applicationURL`, `salary`)
VALUES
	(6,2,'Web Developer','Web Developer is great and fun! Web Development for everyone!',NULL,NULL,'',NULL);

/*!40000 ALTER TABLE `Jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Programs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Programs`;

CREATE TABLE `Programs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `accronym` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Programs` WRITE;
/*!40000 ALTER TABLE `Programs` DISABLE KEYS */;

INSERT INTO `Programs` (`id`, `title`, `accronym`)
VALUES
	(1,'WDD',''),
	(2,'GD','');

/*!40000 ALTER TABLE `Programs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Skills`;

CREATE TABLE `Skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill` varchar(30) DEFAULT NULL,
  `userId` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Skills_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Students`;

CREATE TABLE `Students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(255) DEFAULT NULL,
  `followedJobId` int(255) DEFAULT NULL,
  `followedEmployerId` int(255) DEFAULT NULL,
  `imageURL` varchar(50) DEFAULT NULL,
  `firstName` varchar(30) NOT NULL DEFAULT '',
  `middleInitial` varchar(1) DEFAULT NULL,
  `lastName` varchar(30) NOT NULL DEFAULT '',
  `jobTitle` varchar(40) DEFAULT NULL,
  `about` text NOT NULL,
  `websiteURL` varchar(50) DEFAULT NULL,
  `twitterURL` varchar(50) DEFAULT NULL,
  `facebookURL` varchar(50) DEFAULT NULL,
  `youtubeURL` varchar(50) DEFAULT NULL,
  `programId` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programId` (`programId`),
  KEY `userId` (`userId`),
  KEY `followedEmployerId` (`followedEmployerId`),
  KEY `followedJobId` (`followedJobId`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`programId`) REFERENCES `Programs` (`id`),
  CONSTRAINT `Students_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`id`),
  CONSTRAINT `Students_ibfk_3` FOREIGN KEY (`followedEmployerId`) REFERENCES `FollowedEmployers` (`employerId`),
  CONSTRAINT `Students_ibfk_4` FOREIGN KEY (`followedJobId`) REFERENCES `FollowedJobs` (`jobId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table Types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Types`;

CREATE TABLE `Types` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Types` WRITE;
/*!40000 ALTER TABLE `Types` DISABLE KEYS */;

INSERT INTO `Types` (`id`, `type`)
VALUES
	(1,'Admin'),
	(2,'Employer'),
	(3,'Student');

/*!40000 ALTER TABLE `Types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `typeId` int(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `Users_ibfk_2` FOREIGN KEY (`typeId`) REFERENCES `Types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;

INSERT INTO `Users` (`id`, `name`, `password`, `typeId`)
VALUES
	(1,'Alyssa','Alyssa',3),
	(2,'Zach','Zach',3),
	(3,'JimmyJohns','password',3),
	(8,'a','a',1),
	(10,'A','A',1),
	(11,'alyssamichelle','A',1),
	(12,'zach nicoll','a',3),
	(13,'zzz','a',2),
	(14,'aaaa','a',2),
	(15,'rrrrr','a',1),
	(16,'rrrrrrr','r',1),
	(17,'eeeeeeee','a',1),
	(18,'ffffff','a',1),
	(19,'zach not nicoll','mypassword',2);

/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
