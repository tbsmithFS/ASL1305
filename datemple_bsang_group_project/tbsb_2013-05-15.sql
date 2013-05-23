# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.10)
# Database: tbsb
# Generation Time: 2013-05-16 03:43:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table playlist_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `playlist_details`;

CREATE TABLE `playlist_details` (
  `playlistId` int(11) NOT NULL AUTO_INCREMENT,
  `playlistName` varchar(128) NOT NULL DEFAULT '',
  `trackId_1` int(11) NOT NULL,
  PRIMARY KEY (`playlistId`),
  UNIQUE KEY `playlistName` (`playlistName`),
  KEY `trackId_1` (`trackId_1`),
  CONSTRAINT `playlist_details_ibfk_1` FOREIGN KEY (`trackId_1`) REFERENCES `tracks` (`trackId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table playlists
# ------------------------------------------------------------

DROP TABLE IF EXISTS `playlists`;

CREATE TABLE `playlists` (
  `userId` int(11) NOT NULL,
  `playlistId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`playlistId`),
  KEY `playlistId` (`playlistId`),
  CONSTRAINT `playlists_ibfk_2` FOREIGN KEY (`playlistId`) REFERENCES `playlist_details` (`playlistId`),
  CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table salt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salt`;

CREATE TABLE `salt` (
  `saltId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `salt` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`saltId`),
  UNIQUE KEY `userId` (`userId`),
  CONSTRAINT `salt_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table tracks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tracks`;

CREATE TABLE `tracks` (
  `trackId` int(11) NOT NULL AUTO_INCREMENT,
  `trackLink` varchar(45) NOT NULL DEFAULT '',
  `trackName` varchar(45) NOT NULL DEFAULT '',
  `albumName` varchar(45) NOT NULL DEFAULT '',
  `artistName` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`trackId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) NOT NULL DEFAULT '',
  `passHash` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
