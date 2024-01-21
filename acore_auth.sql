-- MariaDB dump 10.19-11.0.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: acore_auth
-- ------------------------------------------------------
-- Server version	11.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `salt` binary(32) NOT NULL,
  `verifier` binary(32) NOT NULL,
  `session_key` binary(40) DEFAULT NULL,
  `totp_secret` varbinary(128) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `reg_mail` varchar(255) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT 0,
  `locked` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` int(10) unsigned NOT NULL DEFAULT 0,
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `mutetime` bigint(20) NOT NULL DEFAULT 0,
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT 0,
  `totaltime` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES
(1,'ACORE','÷2ê=ñSe‚ãäÿ³üJxAårÅlŠåfŽyM”k›v','üÀn\ZsÀu×RÑü×9º¢…xéí‘·ù”¤w','–,\'˜ÐÓöTGÈâ	·=¡Ý\rv¼65ƒ\0öwÓÉØ×ÊiN[–',NULL,'','','2023-02-08 12:25:28','192.168.1.116','192.168.1.116',0,0,'00','2023-07-20 07:40:18',1,2,0,'','',0,'Win',0,177034),
(2,'ACORE2','ÀU\r4ï© mi«æ&ºüFmÐwæó¾~BÛ ›q','³õæÅ\"’ýxßý1~Å[•6`¬,(¥ô,Ø½ê¨n','còŠh.[è*•Äza–šßÊ.ÒÃâo[‘e\0Í^ÖÌ£‹ƒj\'Z9»J',NULL,'','','2023-03-07 12:46:30','192.168.1.114','192.168.1.114',0,0,'00','2023-03-18 09:09:03',0,2,0,'','',0,'Win',0,654);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_access`
--

DROP TABLE IF EXISTS `account_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT -1,
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_access`
--

LOCK TABLES `account_access` WRITE;
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
INSERT INTO `account_access` VALUES
(1,3,-1,''),
(2,3,-1,'');
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_banned`
--

DROP TABLE IF EXISTS `account_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT 0,
  `unbandate` int(10) unsigned NOT NULL DEFAULT 0,
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_banned`
--

LOCK TABLES `account_banned` WRITE;
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_muted`
--

DROP TABLE IF EXISTS `account_muted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_muted` (
  `guid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Global Unique Identifier',
  `mutedate` int(10) unsigned NOT NULL DEFAULT 0,
  `mutetime` int(10) unsigned NOT NULL DEFAULT 0,
  `mutedby` varchar(50) NOT NULL,
  `mutereason` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='mute List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_muted`
--

LOCK TABLES `account_muted` WRITE;
/*!40000 ALTER TABLE `account_muted` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_muted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autobroadcast`
--

DROP TABLE IF EXISTS `autobroadcast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT -1,
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT 1,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autobroadcast`
--

LOCK TABLES `autobroadcast` WRITE;
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `build_info`
--

DROP TABLE IF EXISTS `build_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `build_info` (
  `build` int(11) NOT NULL,
  `majorVersion` int(11) DEFAULT NULL,
  `minorVersion` int(11) DEFAULT NULL,
  `bugfixVersion` int(11) DEFAULT NULL,
  `hotfixVersion` char(3) DEFAULT NULL,
  `winAuthSeed` varchar(32) DEFAULT NULL,
  `win64AuthSeed` varchar(32) DEFAULT NULL,
  `mac64AuthSeed` varchar(32) DEFAULT NULL,
  `winChecksumSeed` varchar(40) DEFAULT NULL,
  `macChecksumSeed` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `build_info`
--

LOCK TABLES `build_info` WRITE;
/*!40000 ALTER TABLE `build_info` DISABLE KEYS */;
INSERT INTO `build_info` VALUES
(5875,1,12,1,NULL,NULL,NULL,NULL,'95EDB27C7823B363CBDDAB56A392E7CB73FCCA20','8D173CC381961EEBABF336F5E6675B101BB513E5'),
(6005,1,12,2,NULL,NULL,NULL,NULL,NULL,NULL),
(6141,1,12,3,NULL,NULL,NULL,NULL,NULL,NULL),
(8606,2,4,3,NULL,NULL,NULL,NULL,'319AFAA3F2559682F9FF658BE01456255F456FB1','D8B0ECFE534BC1131E19BAD1D4C0E813EEE4994F'),
(9947,3,1,3,NULL,NULL,NULL,NULL,NULL,NULL),
(10505,3,2,2,'a',NULL,NULL,NULL,NULL,NULL),
(11159,3,3,0,'a',NULL,NULL,NULL,NULL,NULL),
(11403,3,3,2,NULL,NULL,NULL,NULL,NULL,NULL),
(11723,3,3,3,'a',NULL,NULL,NULL,NULL,NULL),
(12340,3,3,5,'a',NULL,NULL,NULL,'CDCBBD5188315E6B4D19449D492DBCFAF156A347','B706D13FF2F4018839729461E3F8A0E2B5FDC034'),
(13930,3,3,5,'a',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `build_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_banned`
--

DROP TABLE IF EXISTS `ip_banned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banned IPs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_banned`
--

LOCK TABLES `ip_banned` WRITE;
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` varchar(250) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `string` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_ip_actions`
--

DROP TABLE IF EXISTS `logs_ip_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs_ip_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int(10) unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` int(10) unsigned NOT NULL COMMENT 'Character Guid',
  `type` tinyint(3) unsigned NOT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text DEFAULT NULL COMMENT 'Notes inserted by system',
  `unixtime` int(10) unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Timestamp',
  `comment` text DEFAULT NULL COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Used to log ips of individual actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_ip_actions`
--

LOCK TABLES `logs_ip_actions` WRITE;
/*!40000 ALTER TABLE `logs_ip_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_ip_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motd`
--

DROP TABLE IF EXISTS `motd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motd` (
  `realmid` int(11) NOT NULL,
  `text` longtext DEFAULT NULL,
  PRIMARY KEY (`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motd`
--

LOCK TABLES `motd` WRITE;
/*!40000 ALTER TABLE `motd` DISABLE KEYS */;
INSERT INTO `motd` VALUES
(-1,'Welcome to an AzerothCore server.');
/*!40000 ALTER TABLE `motd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmcharacters`
--

DROP TABLE IF EXISTS `realmcharacters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT 0,
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm Character Tracker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmcharacters`
--

LOCK TABLES `realmcharacters` WRITE;
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` VALUES
(1,1,10),
(1,2,1);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realmlist`
--

DROP TABLE IF EXISTS `realmlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT 8085,
  `icon` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `population` float NOT NULL DEFAULT 0,
  `gamebuild` int(10) unsigned NOT NULL DEFAULT 12340,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  CONSTRAINT `realmlist_chk_1` CHECK (`population` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm System';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realmlist`
--

LOCK TABLES `realmlist` WRITE;
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` VALUES
(1,'AzerothCore','192.168.1.135','127.0.0.1','255.255.255.0',8085,1,0,1,0,0,12340);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_digest`
--

DROP TABLE IF EXISTS `secret_digest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secret_digest` (
  `id` int(10) unsigned NOT NULL,
  `digest` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_digest`
--

LOCK TABLES `secret_digest` WRITE;
/*!40000 ALTER TABLE `secret_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret_digest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','CUSTOM','MODULE','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'timestamp when the query was applied.',
  `speed` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES
('2016_07_09_00.sql','B692C4D5E96D26616E1E655D99DD27F6AC4FFDA6','ARCHIVED','2021-10-14 07:13:44',1),
('2016_07_09_01.sql','DE551E4708FE31AAC60CEF69466BBC5DFAC46F79','ARCHIVED','2021-10-14 07:13:44',1),
('2016_07_10_00.sql','0AE2F7FB1E9C1E2BC2870D0EB817F3C87E0A39B3','ARCHIVED','2021-10-14 07:13:44',1),
('2016_08_25_00.sql','707016C338350676C814D7926DFB6081E57091C3','ARCHIVED','2021-10-14 07:13:44',1),
('2016_08_25_01.sql','A5A2BE04C8E8E85CD177B8684DFFEACF71C9CF69','ARCHIVED','2021-10-14 07:13:44',1),
('2016_09_04_00.sql','420ACF7160BF5549BC298EB6A1319969789DA140','ARCHIVED','2021-10-14 07:13:44',1),
('2016_11_18_00.sql','92D22B3A45466470239402367D94C3791A243EF7','ARCHIVED','2021-10-14 07:13:44',1),
('2016_11_19_00.sql','C55E73648F661F40237B03F266F7169D231B3D8D','ARCHIVED','2021-10-14 07:13:44',1),
('2017_08_19_00.sql','E4457FFFFC0D3F86750F07CF88F549529E1B27E5','ARCHIVED','2021-10-14 07:13:44',1),
('2017_08_20_01.sql','E6190311E1A12E259C6CD21ACFC8BAA1D3F597DF','ARCHIVED','2021-10-14 07:13:44',1),
('2017_12_05_00.sql','475860B881DE6E9CAC93AD3B37E7AAA8D63FB1B9','ARCHIVED','2021-10-14 07:13:44',1),
('2018_01_21_00.sql','570FC5FC653D81B0E498E3EAB6706C9868CE8079','ARCHIVED','2021-10-14 07:13:44',1),
('2018_09_17_00.sql','31743E771FFA4C92D6B6CF747DE4302814BDF257','ARCHIVED','2021-10-14 07:13:44',1),
('2019_01_05_00.sql','2449121ABB0D5004BF6941B340F5C294AD95EBE9','ARCHIVED','2021-10-14 07:13:44',1),
('2019_02_08_00.sql','18FF48FC1B1C238D44198FA1E2D422BAB4C9C338','ARCHIVED','2021-10-14 07:13:44',1),
('2019_02_17_00.sql','1F4C4A15313A261088E40909DCCAA068EAAAAAAE','ARCHIVED','2021-10-14 07:13:44',1),
('2019_04_13_00.sql','183C28E079DAB46AD6F7C0617E19346CAD043141','ARCHIVED','2021-10-14 07:13:44',1),
('2020_02_07_00.sql','9549BF7354B4FA5A661EC094A2C3AAF665678152','ARCHIVED','2021-10-14 07:13:44',1),
('2021_01_25_00.sql','5FA7F802E04CBF66848938FE7FC14FC4CC815F3C','ARCHIVED','2021-10-15 00:59:32',51),
('2021_03_21_00.sql','1E98E516DAD70DC101E339950C1BCC1D15BE78B6','ARCHIVED','2021-10-15 00:59:32',102),
('2021_03_23_00.sql','0EA578B7108559B4E54CAE99714F695659EDE6E5','ARCHIVED','2021-10-15 00:59:32',77),
('2021_05_13_00.sql','B9CABD6897489B20D6523AEDC61AD9075BCA398A','ARCHIVED','2021-10-15 00:59:32',104),
('2021_05_26_00.sql','435822D9482BA2C5F0D8E54E3A587611A453B0FA','ARCHIVED','2021-10-15 00:59:32',71),
('2021_05_30_00.sql','E70A61123CBE2DC8AF332D03DF1889EB0DF3CEAB','ARCHIVED','2021-10-15 00:59:32',64),
('2021_06_17_00.sql','36686970C025046FD49FA4BF6F8283A1AE2BE8F3','ARCHIVED','2021-10-15 00:59:33',52),
('2021_10_14_00.sql','D4378AFC454DF8351A6DE6C6B6144F82C62980A5','ARCHIVED','2021-10-15 00:59:33',53),
('2021_10_14_01_auth.sql','A4495131ADD2AB4AB6682C1621683963247368F0','ARCHIVED','2022-01-22 02:36:20',20),
('2021_11_06_00.sql','E08D11C492289879C460BB063457DAD968545752','ARCHIVED','2022-01-22 02:36:20',39),
('2022_01_23_00.sql','6291006CD2B38EEE02EDDD8AEB6A952477854C77','ARCHIVED','2022-04-24 18:19:14',28),
('2022_04_24_00.sql','CFB8D5B896B2A5900F5E5A2262B356E0842405BB','ARCHIVED','2022-08-21 12:56:35',34),
('2022_04_28_00.sql','26108CBD35D4B885A90CEC25665DCBC00FD06809','ARCHIVED','2022-08-21 12:56:35',30),
('2022_08_21_00.sql','E333B1A3FD1A25298D29B8FCAA0EE8AE5985202F','ARCHIVED','2023-01-31 23:19:58',28),
('2023_01_31_00.sql','0ACDD35EC9745231BCFA701B78056DEF94D0CC53','ARCHIVED','2023-02-08 11:36:51',4),
('2023_02_20_00.sql','B2A8F337A3699322D19729AF07ADC5607FAEEF83','ARCHIVED','2023-03-13 14:51:43',101),
('2023_04_23_00.sql','F853503AAFB22DB3493F2ADC8B6BBB7B648EDBA9','ARCHIVED','2023-05-07 11:55:10',249),
('2023_04_24_00.sql','D164A70B22B2462464484614018C3218B3259AE4','RELEASED','2023-05-07 11:55:10',6);
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates_include`
--

DROP TABLE IF EXISTS `updates_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED','CUSTOM') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates_include`
--

LOCK TABLES `updates_include` WRITE;
/*!40000 ALTER TABLE `updates_include` DISABLE KEYS */;
INSERT INTO `updates_include` VALUES
('$/data/sql/archive/db_auth','ARCHIVED'),
('$/data/sql/custom/db_auth','CUSTOM'),
('$/data/sql/updates/db_auth','RELEASED');
/*!40000 ALTER TABLE `updates_include` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uptime`
--

DROP TABLE IF EXISTS `uptime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `uptime` int(10) unsigned NOT NULL DEFAULT 0,
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT 0,
  `revision` varchar(255) NOT NULL DEFAULT 'AzerothCore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Uptime system';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uptime`
--

LOCK TABLES `uptime` WRITE;
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` VALUES
(1,1550400304,121,0,'AzerothCore rev. 2bcedc2859e7 2019-02-17 10:04:09 +0100 (master branch) (Unix, Debug)'),
(1,1550400454,1440,0,'AzerothCore rev. 2bcedc2859e7 2019-02-17 10:04:09 +0100 (master branch) (Unix, Debug)'),
(1,1661068597,0,0,'AzerothCore rev. 5d6dfca80cf1 2022-08-21 09:48:09 +0200 (new-squash-POGGIES branch) (Win64, RelWithDebInfo, Static)'),
(1,1675207201,0,0,'AzerothCore rev. e7cbc80a913b 2023-01-31 22:22:22 +0000 (master branch) (Win64, RelWithDebInfo, Static)'),
(1,1675856189,87,0,'AzerothCore rev. 6e8e70aa1a55 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1675859032,246,1,'AzerothCore rev. 6e8e70aa1a55 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1675860246,1925,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1675865446,545,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1675867659,2285,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1676030704,8165,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1676112529,2225,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1676293383,7326,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1676910023,4687,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1676980431,2105,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677422659,7146,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677585293,666,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677670138,3185,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677679643,726,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677680696,724,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677681683,724,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677683297,304,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677683665,3006,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677756139,2585,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677758955,125,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1677858281,1206,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678172485,248,1,'AzerothCore rev. 850dfb93203b+ 2023-03-06 13:56:10 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678172757,606,1,'AzerothCore rev. 850dfb93203b+ 2023-03-06 13:56:10 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678173432,65,1,'AzerothCore rev. 850dfb93203b+ 2023-03-06 13:56:10 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678173510,0,0,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678192968,846,2,'AzerothCore rev. 850dfb93203b+ 2023-03-06 13:56:10 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678193984,5645,1,'AzerothCore rev. 850dfb93203b+ 2023-03-06 13:56:10 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678279180,3245,1,'AzerothCore rev. 850dfb93203b+ 2023-03-06 13:56:10 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678569507,426,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678569958,66,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678570048,66,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678614001,126,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678616274,366,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678616706,245,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678617007,10806,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678638565,10986,1,'AzerothCore rev. 479c965c4ee8+ 2023-03-11 16:58:44 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678714494,1445,1,'AzerothCore rev. a1c644fd3971+ 2023-03-13 13:21:43 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678715975,486,1,'AzerothCore rev. 6e8e70aa1a55+ 2023-02-07 16:44:17 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678719103,965,1,'AzerothCore rev. a1c644fd3971+ 2023-03-13 13:21:43 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678720137,125,1,'AzerothCore rev. a1c644fd3971+ 2023-03-13 13:21:43 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678720338,6246,1,'AzerothCore rev. a1c644fd3971+ 2023-03-13 13:21:43 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678795261,1806,1,'AzerothCore rev. a1c644fd3971+ 2023-03-13 13:21:43 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678797115,3965,1,'AzerothCore rev. a1c644fd3971+ 2023-03-13 13:21:43 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678883736,427,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678884207,185,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678891815,7925,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678899807,2466,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678902509,665,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678903253,1386,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678904908,2045,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678948597,125,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678948952,426,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678949844,246,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678953713,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678953883,66,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1678954010,485,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679002982,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679081245,65,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679081452,65,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679081657,65,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679089413,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679089735,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679089897,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679090023,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679090165,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679090366,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679130383,246,2,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679130913,65,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679131123,65,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679131582,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679134842,65,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679135158,8765,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679258400,1925,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679400301,306,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679400660,185,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679400907,305,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679401273,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679401529,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679401697,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679402185,245,1,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679416822,1806,1,'AzerothCore rev. 2396638a70d5+ 2023-03-21 12:45:47 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679418816,15365,1,'AzerothCore rev. 2396638a70d5+ 2023-03-21 12:45:47 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679557797,0,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679558376,1925,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679560723,126,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679560855,185,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679561291,245,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679561579,785,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679562431,0,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679562537,125,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679562714,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679563084,725,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679563872,8105,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679572309,245,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679572802,3245,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679576327,136,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, DEBUG, Static)'),
(1,1679576602,555,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, DEBUG, Static)'),
(1,1679577599,75,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, DEBUG, Static)'),
(1,1679577739,0,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, DEBUG, Static)'),
(1,1679578045,0,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679578220,2894,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679581179,5595,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679586793,127,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1679659211,1335,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679833040,17054,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679924698,1874,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679927031,0,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679927542,6375,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1679995483,0,0,'AzerothCore rev. 725609d06f4c+ 2023-03-15 03:10:22 +0000 (master branch) (Unix, RelWithDebInfo, Static)'),
(1,1680001680,2595,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680008957,134,0,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680009521,255,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680010082,315,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680010579,74,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680010874,5535,1,'AzerothCore rev. 989584b199ee+ 2023-03-22 15:02:31 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680086216,495,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680086786,0,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680086860,74,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680087127,3134,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680090314,4635,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680194674,434,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680249793,135,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680250347,75,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680364893,975,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680365929,2115,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680383969,314,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680384584,315,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680429667,1515,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680431269,75,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680432382,74,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680438890,0,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680524455,12494,0,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680547204,2595,1,'AzerothCore rev. d030260dd4b7+ 2023-03-29 03:12:41 -0300 (master branch) (Unix, Debug, Static)'),
(1,1680595297,195,0,'AzerothCore rev. 686055c54757+ 2023-04-04 03:23:02 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680600636,135,0,'AzerothCore rev. 686055c54757+ 2023-04-04 03:23:02 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680600920,74,0,'AzerothCore rev. 686055c54757+ 2023-04-04 03:23:02 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680601772,0,0,'AzerothCore rev. 686055c54757+ 2023-04-04 03:23:02 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680688607,75,0,'AzerothCore rev. 686055c54757+ 2023-04-04 03:23:02 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680768585,75,0,'AzerothCore rev. 37f0b7095f94+ 2023-04-06 03:52:19 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680769054,0,0,'AzerothCore rev. 37f0b7095f94+ 2023-04-06 03:52:19 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680769127,74,0,'AzerothCore rev. 37f0b7095f94+ 2023-04-06 03:52:19 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680866541,314,0,'AzerothCore rev. 37f0b7095f94+ 2023-04-06 03:52:19 +0000 (master branch) (Unix, Debug, Static)'),
(1,1680866939,854,0,'AzerothCore rev. 37f0b7095f94+ 2023-04-06 03:52:19 +0000 (master branch) (Unix, Debug, Static)'),
(1,1681910924,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1681911092,1275,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1681913275,494,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1681926037,10934,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1681999764,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1681999825,1935,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682011164,675,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682014575,315,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682015642,374,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682016466,674,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682017167,254,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682018421,2235,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682071648,2655,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682088563,1515,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682177098,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682177333,1215,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682178722,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682178806,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682179063,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682179177,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682179217,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682179265,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682179325,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682179366,914,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682180415,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682180489,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682180543,434,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682181010,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682182339,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682191961,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682192315,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682192448,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682195493,914,1,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682197856,1216,1,'AzerothCore rev. 96a5224d927f+ 2023-04-22 07:25:31 +0700 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682244015,0,0,'AzerothCore rev. 96a5224d927f+ 2023-04-22 07:25:31 +0700 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682244870,0,0,'AzerothCore rev. 5de7a24cb378+ 2023-04-18 11:08:45 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682247655,854,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682248776,74,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682248921,435,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682250254,1095,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682251467,975,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682252471,495,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682253008,316,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682274679,0,0,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682274888,0,0,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682275325,0,0,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682275756,1634,1,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682277537,0,0,'AzerothCore rev. 4b6c595677ec+ 2023-04-23 12:01:24 +0200 (arathi_basin branch) (Unix, Debug, Static)'),
(1,1682435124,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682435349,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682435508,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682435543,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682435705,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682435865,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682435897,735,1,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682436713,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682436771,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682436858,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682439114,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682439191,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682439559,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682439757,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440096,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440370,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440529,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440566,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440675,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440740,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440761,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440940,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682440968,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682441040,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682441095,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682441434,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682441541,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682441601,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682441662,2775,1,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682444455,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682444498,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682445078,1514,1,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682446719,3614,1,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682450477,3975,1,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682486913,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682487864,0,0,'AzerothCore rev. dcf579aa8e73+ 2023-04-25 20:53:47 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682603919,316,1,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682604378,3795,1,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682937617,7935,1,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1682953325,20115,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683009090,12196,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683022790,37454,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683091263,0,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683091570,435,1,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683092114,27854,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683120022,26655,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683181635,8835,0,'AzerothCore rev. ade228524689+ 2023-04-27 15:24:22 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683460510,15415,1,'AzerothCore rev. 489bbe15e19d+ 2023-05-07 12:31:40 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683554671,140,1,'AzerothCore rev. 489bbe15e19d+ 2023-05-07 12:31:40 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683555023,257,1,'AzerothCore rev. 489bbe15e19d+ 2023-05-07 12:31:40 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1683555371,320,1,'AzerothCore rev. 489bbe15e19d+ 2023-05-07 12:31:40 +0700 (npcbots_3.3.5 branch) (Unix, Debug, Static)'),
(1,1684133336,18620,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684409385,379,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684410596,259,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684411038,319,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684411393,320,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684411780,4218,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684426622,15379,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684862723,14300,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684918408,41478,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684992715,4939,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1684997797,14058,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685016355,18140,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685034715,1759,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685036616,3799,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685040958,2180,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685043234,4460,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685102928,33140,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685136195,39979,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685185567,19700,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685206956,0,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685207161,54498,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685275848,10040,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685285961,20360,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685306563,72921,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685392275,81920,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685476488,53239,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685529885,559,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685530540,11238,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685541832,8060,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685549930,14540,1,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685571908,26780,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1685790254,533853,0,'AzerothCore rev. 9ce833a68a8c+ 2023-05-14 15:32:29 +0000 (master branch) (Unix, Debug, Static)'),
(1,1686813434,0,0,'AzerothCore rev. 886ba497ec67 2023-06-14 15:55:26 +0200 (master branch) (Unix, Debug, Static)'),
(1,1686813785,44538,0,'AzerothCore rev. 886ba497ec67 2023-06-14 15:55:26 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687028563,14779,0,'AzerothCore rev. dd762df93a45 2023-06-17 16:31:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687076735,3620,0,'AzerothCore rev. dd762df93a45+ 2023-06-17 16:31:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687347613,140,0,'AzerothCore rev. dd762df93a45+ 2023-06-17 16:31:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687442769,6019,0,'AzerothCore rev. dd762df93a45+ 2023-06-17 16:31:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687819308,0,0,'AzerothCore rev. e2c7c56c6b86 2023-06-26 22:34:30 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687930569,0,0,'AzerothCore rev. e2c7c56c6b86 2023-06-26 22:34:30 +0200 (master branch) (Unix, Debug, Static)'),
(1,1687930748,1156,0,'AzerothCore rev. 96d3bf317e60 2023-06-27 07:12:21 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688015228,0,0,'AzerothCore rev. 96d3bf317e60 2023-06-27 07:12:21 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688015350,53296,1,'AzerothCore rev. 96d3bf317e60 2023-06-27 07:12:21 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688114438,20236,0,'AzerothCore rev. ba87447e0c61+ 2023-06-29 17:58:31 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688134772,4396,0,'AzerothCore rev. ba87447e0c61+ 2023-06-29 17:58:31 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688546966,556,0,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688558171,5896,1,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688564117,2055,1,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688724472,124516,1,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1688926832,319,0,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1689747124,16880,1,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1689804000,500,0,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, Debug, Static)'),
(1,1689832416,17051,1,'AzerothCore rev. d421b266211c 2023-07-04 13:35:53 +0200 (master branch) (Unix, RelWithDebInfo, Static)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31 10:17:24
