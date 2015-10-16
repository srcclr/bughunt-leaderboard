/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table challenges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `challenges`;

CREATE TABLE `challenges` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `solutions` text NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL,
  `exclude_leaderboard` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;

INSERT INTO `challenges` (`id`, `name`, `url`, `solutions`, `date_begin`, `date_end`, `exclude_leaderboard`)
VALUES
    (1,'ExampleChallenge','https://github.com/ExampleChallenge','[\"42\"]','2010-01-01','2010-01-01',1),
    (2,'challenge1','https://github.com/challenge1','[\"100\"]','2015-06-01','2015-06-07',0),
    (3,'NumberTwo','https://github.com/NumberTwo','[\"100\"]','2015-06-08','2015-06-14',0),
    (4,'The3rd','https://github.com/The3rd','[\"100\"]','2015-06-15','2015-06-21',0),
    (5,'Fore','https://github.com/Fore','[\"100\"]','2015-06-22','2015-06-28',0);

/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table submissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `submissions`;

CREATE TABLE `submissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `challenge_id` int(11) unsigned NOT NULL,
  `hash` varchar(100) NOT NULL DEFAULT '',
  `submission_count` int(11) unsigned NOT NULL DEFAULT '1',
  `is_correct` tinyint(1) unsigned NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_challenge_id` (`user_id`,`challenge_id`),
  KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`),
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;

INSERT INTO `submissions` (`id`, `user_id`, `challenge_id`, `hash`, `submission_count`, `is_correct`, `date_created`, `last_updated`)
VALUES
    (1,4,1,'ermergerd',6,0,'2015-07-07 22:17:31','2015-07-17 22:07:46'),
    (2,4,2,'1234',1,1,'2015-06-01 11:52:19','2015-06-01 11:52:19'),
    (3,2,2,'1234',2,1,'2015-06-02 00:00:00','2015-06-02 00:00:00'),
    (4,5,2,'1234',1,1,'2015-06-01 00:00:00','2015-06-01 00:00:00'),
    (5,6,2,'1234',15,0,'2015-06-03 00:00:00','2015-06-03 00:00:00'),
    (6,7,2,'1234',3,1,'2015-06-05 00:00:00','2015-06-05 00:00:00'),
    (7,4,3,'1234',3,0,'2015-06-08 12:30:44','2015-06-08 12:32:18'),
    (8,2,3,'1234',1,1,'2015-06-08 00:00:00','2015-06-08 00:00:00'),
    (9,5,3,'1234',1,1,'2015-06-14 00:00:00','2015-06-14 00:00:00'),
    (10,7,3,'1234',3,1,'2015-06-10 00:00:00','2015-06-10 00:00:00'),
    (11,4,4,'1234',1,1,'2015-06-15 00:00:00','2015-06-15 00:00:00'),
    (12,2,4,'1234',1,1,'2015-06-16 00:00:00','2015-06-16 00:00:00'),
    (13,5,4,'1234',1,0,'2015-06-18 00:00:00','2015-06-18 00:00:00'),
    (14,6,4,'1234',4,1,'2015-06-15 00:00:00','2015-06-15 00:00:00'),
    (15,7,4,'1234',2,1,'2015-06-21 00:00:00','2015-06-21 00:00:00'),
    (16,8,4,'1234',1,1,'2015-06-19 00:00:00','2015-06-19 00:00:00'),
    (17,4,5,'1234',2,1,'2015-06-23 00:00:00','2015-07-31 13:43:55'),
    (18,5,5,'1234',6,1,'2015-06-22 00:00:00','2015-06-22 00:00:00'),
    (19,6,5,'1234',5,0,'2015-06-24 00:00:00','2015-06-24 00:00:00'),
    (20,8,5,'1234',1,1,'2015-06-22 00:00:00','2015-06-22 00:00:00');

/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) unsigned NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `code` varchar(50) NOT NULL DEFAULT '',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exclude_leaderboard` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_type_id_username` (`user_type_id`,`username`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `user_type_id`, `username`, `code`, `date_created`, `exclude_leaderboard`)
VALUES
    (2,1,'caleb_fenton','asdfzxcvqwerty1234','2015-06-27 19:20:45',1),
    (4,1,'cherlerngebert2','asdfzxcvqwerty1234','2015-06-28 10:39:25',0),
    (5,1,'asankhaya','asdfzxcvqwerty1234','2015-07-21 22:17:35',1),
    (6,1,'pretentiousderp','asdfzxcvqwerty1234','2015-07-27 17:31:56',0),
    (7,1,'jjarmoc','asdfzxcvqwerty1234','2015-07-27 18:19:58',0),
    (8,1,'timstrazz','asdfzxcvqwerty1234','2015-07-28 01:51:12',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
