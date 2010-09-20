-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pdns_dev
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.6

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
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditable_id` int(11) DEFAULT NULL,
  `auditable_type` varchar(255) DEFAULT NULL,
  `auditable_parent_id` int(11) DEFAULT NULL,
  `auditable_parent_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `changes` text,
  `version` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auditable_index` (`auditable_id`,`auditable_type`),
  KEY `auditable_parent_index` (`auditable_parent_id`,`auditable_parent_type`),
  KEY `user_index` (`user_id`,`user_type`),
  KEY `index_audits_on_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
INSERT INTO `audits` VALUES (1,9,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 4.2.2.1\ndomain_id: 1\nname: foo.example.com\nprio: \nttl: 3600\ntype: A\n',1,'2010-09-08 01:02:47'),(2,10,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 1.2.3.4\ndomain_id: 1\nname: fdghfgh.example.com\nprio: \nttl: 4545\ntype: A\n',1,'2010-09-08 01:10:14'),(3,11,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 1.2.1.1\ndomain_id: 1\nname: dfsdfsdg.example.com\nprio: \nttl: 1\ntype: A\n',1,'2010-09-08 01:11:51'),(4,2,'Domain',NULL,NULL,1,'User',NULL,'create','--- \naccount: \nlast_check: \nmaster: \"\"\nname: test.com\nnotes: \nnotified_serial: \nttl: 86400\nuser_id: \n',1,'2010-09-08 01:19:16'),(5,12,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: ns1.test.com east-coast@example.com 2010090800 10800 7200 604800 10800\ndomain_id: 2\nname: test.com\nprio: \nttl: 86400\ntype: SOA\n',1,'2010-09-08 01:19:16'),(6,13,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: ns1.test.com\ndomain_id: 2\nname: test.com\nprio: \nttl: 86400\ntype: NS\n',1,'2010-09-08 01:19:16'),(7,14,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: ns2.test.com\ndomain_id: 2\nname: test.com\nprio: \nttl: 86400\ntype: NS\n',1,'2010-09-08 01:19:16'),(8,15,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 10.0.0.1\ndomain_id: 2\nname: ns1.test.com\nprio: \nttl: 86400\ntype: A\n',1,'2010-09-08 01:19:16'),(9,16,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 10.0.0.2\ndomain_id: 2\nname: ns2.test.com\nprio: \nttl: 86400\ntype: A\n',1,'2010-09-08 01:19:16'),(10,17,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 10.0.0.3\ndomain_id: 2\nname: test.com\nprio: \nttl: 86400\ntype: A\n',1,'2010-09-08 01:19:16'),(11,18,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: 10.0.0.4\ndomain_id: 2\nname: mail.test.com\nprio: \nttl: 86400\ntype: A\n',1,'2010-09-08 01:19:16'),(12,19,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: mail\ndomain_id: 2\nname: test.com\nprio: 10\nttl: 86400\ntype: MX\n',1,'2010-09-08 01:19:16'),(13,20,'Record',NULL,NULL,1,'User',NULL,'create','--- \ncontent: \"@\"\ndomain_id: 2\nname: mike.test.com\nprio: \nttl: 1800\ntype: CNAME\n',1,'2010-09-08 01:19:33'),(14,3,'Domain',NULL,NULL,3,'User',NULL,'create','--- \naccount: \nlast_check: \nmaster: \"\"\nname: foobar.com\nnotes: \nnotified_serial: \nttl: 86400\nuser_id: 3\n',1,'2010-09-08 03:14:40'),(15,21,'Record',NULL,NULL,3,'User',NULL,'create','--- \ncontent: 1.2.3.4 mike@bailey.net.au 2010090800 1 1 1 1\ndomain_id: 3\nname: foobar.com\nprio: \nttl: 86400\ntype: SOA\n',1,'2010-09-08 03:14:40');
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `master` varchar(255) DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT 'NATIVE',
  `notified_serial` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `ttl` int(11) DEFAULT '86400',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `index_domains_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
INSERT INTO `domains` VALUES (1,'example.com',NULL,NULL,'NATIVE',NULL,NULL,86400,'2010-09-08 00:45:06','2010-09-08 00:45:06',NULL,NULL),(2,'test.com','',NULL,'NATIVE',NULL,NULL,86400,'2010-09-08 01:19:16','2010-09-08 01:19:16',NULL,NULL),(3,'foobar.com','',NULL,'NATIVE',NULL,NULL,86400,'2010-09-08 03:14:40','2010-09-08 03:14:40',3,NULL);
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macro_steps`
--

DROP TABLE IF EXISTS `macro_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macro_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macro_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `record_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macro_steps`
--

LOCK TABLES `macro_steps` WRITE;
/*!40000 ALTER TABLE `macro_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `macro_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macros`
--

DROP TABLE IF EXISTS `macros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macros`
--

LOCK TABLES `macros` WRITE;
/*!40000 ALTER TABLE `macros` DISABLE KEYS */;
/*!40000 ALTER TABLE `macros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_templates`
--

DROP TABLE IF EXISTS `record_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_template_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `record_type` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ttl` int(11) NOT NULL,
  `prio` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_templates`
--

LOCK TABLES `record_templates` WRITE;
/*!40000 ALTER TABLE `record_templates` DISABLE KEYS */;
INSERT INTO `record_templates` VALUES (1,1,NULL,'SOA','ns1.%ZONE% east-coast@example.com 0 10800 7200 604800 10800',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(2,1,NULL,'NS','ns1.%ZONE%',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(3,1,NULL,'NS','ns2.%ZONE%',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(4,1,'ns1','A','10.0.0.1',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(5,1,'ns2','A','10.0.0.2',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(6,1,NULL,'A','10.0.0.3',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(7,1,'mail','A','10.0.0.4',86400,NULL,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(8,1,NULL,'MX','mail',86400,10,'2010-09-08 00:45:06','2010-09-08 00:45:06');
/*!40000 ALTER TABLE `record_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(16) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ttl` int(11) NOT NULL,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_records_on_domain_id` (`domain_id`),
  KEY `index_records_on_name` (`name`),
  KEY `index_records_on_name_and_type` (`name`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (1,1,'example.com','SOA','ns1.example.com admin@example.com 2010090810 10800 7200 604800 10800',86400,NULL,1283908311,'2010-09-08 00:45:06','2010-09-08 01:11:51'),(2,1,'@.example.com','NS','ns1.example.com.',86400,NULL,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(3,1,'@.example.com','NS','ns2.example.com.',86400,NULL,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(4,1,'ns1.example.com','A','10.0.0.1',86400,NULL,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(5,1,'ns2.example.com','A','10.0.0.2',86400,NULL,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(6,1,'@.example.com','A','10.0.0.3',86400,NULL,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(7,1,'@.example.com','MX','mail',86400,10,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(8,1,'mail.example.com','A','10.0.0.4',86400,NULL,1283906706,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(9,1,'foo.example.com','A','4.2.2.1',3600,NULL,1283907767,'2010-09-08 01:02:47','2010-09-08 01:02:47'),(10,1,'fdghfgh.example.com','A','1.2.3.4',4545,NULL,1283908214,'2010-09-08 01:10:14','2010-09-08 01:10:14'),(11,1,'dfsdfsdg.example.com','A','1.2.1.1',1,NULL,1283908311,'2010-09-08 01:11:51','2010-09-08 01:11:51'),(12,2,'test.com','SOA','ns1.test.com east-coast@example.com 2010090802 10800 7200 604800 10800',86400,NULL,1283908773,'2010-09-08 01:19:16','2010-09-08 01:19:33'),(13,2,'test.com','NS','ns1.test.com',86400,NULL,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(14,2,'test.com','NS','ns2.test.com',86400,NULL,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(15,2,'ns1.test.com','A','10.0.0.1',86400,NULL,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(16,2,'ns2.test.com','A','10.0.0.2',86400,NULL,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(17,2,'test.com','A','10.0.0.3',86400,NULL,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(18,2,'mail.test.com','A','10.0.0.4',86400,NULL,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(19,2,'test.com','MX','mail',86400,10,1283908756,'2010-09-08 00:45:06','2010-09-08 00:45:06'),(20,2,'mike.test.com','CNAME','@',1800,NULL,1283908773,'2010-09-08 01:19:33','2010-09-08 01:19:33'),(21,3,'foobar.com','SOA','1.2.3.4 mike@bailey.net.au 2010090800 1 1 1 1',86400,NULL,1283915680,'2010-09-08 03:14:40','2010-09-08 03:14:40');
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'owner'),(3,'auth_token');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_roles_users_on_role_id` (`role_id`),
  KEY `index_roles_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(3,2),(2,3);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('10'),('2'),('20081228121040'),('20090505124622'),('3'),('4'),('5'),('6'),('7'),('8'),('9');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_token_expires_at` datetime DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `activated_at` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT 'passive',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@example.com','213313b767f1e6d30f84264d5ff63e52b2afed1f','448d6c6a9a905729353e3935c5c522bd7ca4ca7c','2010-09-08 00:45:06','2010-09-08 00:45:06',NULL,NULL,NULL,NULL,'active',NULL),(2,'token','tokens@example.com','7d0dd768f7e7b0de3d230b2b9d0f7c6bddb035b4','9a06bc0c39ed17bd91e7345f5c7790b807cef42f','2010-09-08 00:45:06','2010-09-08 00:45:06',NULL,NULL,NULL,NULL,'active',NULL),(3,'mike','mike@bailey.net.au','a83f0f2ca613666d599c88b2939e82c2062a9ef7','cee268bb87e4536df0d6ee888ad8077823d0b2f9','2010-09-08 03:12:25','2010-09-08 03:12:25',NULL,NULL,NULL,NULL,'active',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_templates`
--

DROP TABLE IF EXISTS `zone_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ttl` int(11) DEFAULT '86400',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_templates`
--

LOCK TABLES `zone_templates` WRITE;
/*!40000 ALTER TABLE `zone_templates` DISABLE KEYS */;
INSERT INTO `zone_templates` VALUES (1,'East Coast Data Center',86400,'2010-09-08 00:45:06','2010-09-08 00:45:06',NULL),(2,'mike template',86400,'2010-09-08 03:13:10','2010-09-08 03:13:10',3);
/*!40000 ALTER TABLE `zone_templates` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-09-20 22:53:32
