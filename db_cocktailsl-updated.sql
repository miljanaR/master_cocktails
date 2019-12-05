/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.4.8-MariaDB : Database - db_cocktails
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_cocktails` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_cocktails`;

/*Table structure for table `cocktail` */

DROP TABLE IF EXISTS `cocktail`;

CREATE TABLE `cocktail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `cocktail-strength` int(11) NOT NULL,
  `ingredients` varchar(100) NOT NULL,
  `style` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(100) DEFAULT 'blue',
  `country` varchar(100) NOT NULL,
  `mix` varchar(100) NOT NULL,
  `picture` varchar(500) DEFAULT '/images/18.png',
  `season` int(11) DEFAULT NULL,
  `moment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `style` (`style`),
  KEY `season` (`season`),
  KEY `moment` (`moment`),
  KEY `cocktail-strength` (`cocktail-strength`),
  CONSTRAINT `cock_ibfk_1` FOREIGN KEY (`style`) REFERENCES `style` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cocktail_ibfk_1` FOREIGN KEY (`season`) REFERENCES `season` (`id`),
  CONSTRAINT `cocktail_ibfk_2` FOREIGN KEY (`moment`) REFERENCES `moment` (`id`),
  CONSTRAINT `cocktail_ibfk_3` FOREIGN KEY (`cocktail-strength`) REFERENCES `cocktail-strength` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `cocktail` */

insert  into `cocktail`(`id`,`name`,`cocktail-strength`,`ingredients`,`style`,`price`,`color`,`country`,`mix`,`picture`,`season`,`moment`) values
(7,'Black and Tan',1,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',4,1,'blue','Mexico','pour stout beer into the beer glass pour lager into the glass','/images/7.png',4,11),
(8,'cocktail 2',5,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',2,1,'blue','Japan','pour stout beer into the beer glass pour lager into the glass','/images/8.png',2,2),
(9,'cocktail 3',3,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',3,1,'blue','India','pour stout beer into the beer glass pour lager into the glass','/images/9.png',3,3),
(10,'cocktail 4',2,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',4,1,'blue','Tunis','pour stout beer into the beer glass pour lager into the glass','/images/18.png',4,4),
(11,'cocktail 5 ',1,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',4,1,'red','Thailand','pour stout beer into the beer glass pour lager into the glass','/images/18.png',5,5),
(12,'cocktail 6 ',2,'1/2 pints stout beer 1/2 pints lager \n                     \n                     \n                \n ',6,1,'blue','Srbija','pour stout beer into the beer glass pour lager into the glass ','/images/18.png',2,6),
(13,'cocktail 7',2,'1/2 pints stout beer 1/2 pints lager\n                     \n                     ',2,1,'blue','','pour stout beer into the beer glass pour lager into the glass','/images/18.png',2,7),
(14,'cocktail 8',2,'',3,1,'blue','','pour stout beer into the beer glass pour lager into the glass','/images/18.png',5,8);

/*Table structure for table `cocktail-strength` */

DROP TABLE IF EXISTS `cocktail-strength`;

CREATE TABLE `cocktail-strength` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cocktail-strength` */

insert  into `cocktail-strength`(`id`,`name`) values
(1,'Nonalcohoic'),
(2,'Weak'),
(3,'Light'),
(4,'Medium'),
(5,'Strong'),
(6,'Extremly Strong');

/*Table structure for table `moment` */

DROP TABLE IF EXISTS `moment`;

CREATE TABLE `moment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

/*Data for the table `moment` */

insert  into `moment`(`id`,`name`) values
(1,'Staying in, by the fire'),
(2,'Poolside'),
(3,'Company Party'),
(4,'Downtown'),
(5,'Family Gathering'),
(6,'Girls\' Night Out'),
(7,'Guys\' Night'),
(8,'House Party'),
(9,'Club'),
(10,'Restaurant'),
(11,'Movie Night'),
(12,'Beach'),
(13,'Barbecue & Picnic'),
(14,'Taking Time for Yourself');

/*Table structure for table `season` */

DROP TABLE IF EXISTS `season`;

CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `season` */

insert  into `season`(`id`,`name`) values
(1,'Fall'),
(2,'Spring'),
(3,'Summer'),
(4,'Winter'),
(5,'All seasons');

/*Table structure for table `style` */

DROP TABLE IF EXISTS `style`;

CREATE TABLE `style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `style` */

insert  into `style`(`id`,`name`) values
(2,'Classic'),
(3,'Creamy'),
(4,'Frozen'),
(5,'Hot'),
(6,'Longdrink'),
(7,'Martini'),
(8,'Nonalcoholic'),
(9,'Shooter'),
(10,'Short'),
(11,'Smoothie'),
(1,'Sparkling'),
(12,'Tropical');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`name`,`surname`,`email`,`role`) values
(1,'milja','$2a$10$CuwDkTuD4zc1x7adyx8NxuwHs7ML5qzHYK7bTha5FC/zVTwEzJK3O','Miljana','Ratkov','m.ratkov995@gmail.com','user'),
(2,'admin','$2a$04$RNs5Xtjo7F3upPGzSbVPTOfEOPkevYQYk96t82l4A47UenCK6l9Ou','Test','Admin','admin@gmail.com','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
