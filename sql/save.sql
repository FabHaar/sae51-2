-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: dolibarr
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `llx_accounting_account`
--

DROP TABLE IF EXISTS `llx_accounting_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_account` (
  `rowid` bigint NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_pcg_version` varchar(32) NOT NULL,
  `pcg_type` varchar(20) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_parent` int DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `labelshort` varchar(255) DEFAULT NULL,
  `fk_accounting_category` int DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `reconcilable` tinyint NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  KEY `idx_accounting_account_account_parent` (`account_parent`),
  CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llx_accounting_system` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_account`
--

LOCK TABLES `llx_accounting_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_bookkeeping`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_bookkeeping` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `piece_num` int NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int NOT NULL,
  `fk_docdet` int NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) NOT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`,`entity`),
  KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`,`entity`),
  KEY `idx_accounting_bookkeeping_piece_num` (`piece_num`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping`
--

LOCK TABLES `llx_accounting_bookkeeping` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_bookkeeping_tmp`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_bookkeeping_tmp` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int NOT NULL,
  `fk_docdet` int NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping_tmp`
--

LOCK TABLES `llx_accounting_bookkeeping_tmp` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_fiscalyear`
--

DROP TABLE IF EXISTS `llx_accounting_fiscalyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_fiscalyear` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_fiscalyear`
--

LOCK TABLES `llx_accounting_fiscalyear` WRITE;
/*!40000 ALTER TABLE `llx_accounting_fiscalyear` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_fiscalyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_groups_account`
--

DROP TABLE IF EXISTS `llx_accounting_groups_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_groups_account` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_accounting_account` int NOT NULL,
  `fk_c_accounting_category` int NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_groups_account`
--

LOCK TABLES `llx_accounting_groups_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_groups_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_groups_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_journal`
--

DROP TABLE IF EXISTS `llx_accounting_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_journal` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `nature` smallint NOT NULL DEFAULT '1',
  `active` smallint DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_journal`
--

LOCK TABLES `llx_accounting_journal` WRITE;
/*!40000 ALTER TABLE `llx_accounting_journal` DISABLE KEYS */;
INSERT INTO `llx_accounting_journal` VALUES
(1,1,'VT','ACCOUNTING_SELL_JOURNAL',2,1),
(2,1,'AC','ACCOUNTING_PURCHASE_JOURNAL',3,1),
(3,1,'BQ','FinanceJournal',4,1),
(4,1,'OD','ACCOUNTING_MISCELLANEOUS_JOURNAL',1,1),
(5,1,'AN','ACCOUNTING_HAS_NEW_JOURNAL',9,1),
(6,1,'ER','ExpenseReportsJournal',5,1),
(7,1,'INV','InventoryJournal',8,1);
/*!40000 ALTER TABLE `llx_accounting_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_system`
--

DROP TABLE IF EXISTS `llx_accounting_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_system` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_country` int DEFAULT NULL,
  `pcg_version` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_system`
--

LOCK TABLES `llx_accounting_system` WRITE;
/*!40000 ALTER TABLE `llx_accounting_system` DISABLE KEYS */;
INSERT INTO `llx_accounting_system` VALUES
(1,1,'PCG99-ABREGE','The simple accountancy french plan',1),
(2,1,'PCG99-BASE','The base accountancy french plan',1),
(3,1,'PCG14-DEV','The developed accountancy french plan 2014',1),
(4,1,'PCG18-ASSOC','French foundation chart of accounts 2018',1),
(5,1,'PCGAFR14-DEV','The developed farm accountancy french plan 2014',1),
(6,2,'PCMN-BASE','The base accountancy belgium plan',1),
(7,4,'PCG08-PYME','The PYME accountancy spanish plan',1),
(8,5,'SKR03','Standardkontenrahmen SKR 03',1),
(9,5,'SKR04','Standardkontenrahmen SKR 04',1),
(10,6,'PCG_SUISSE','Switzerland plan',1),
(11,7,'ENG-BASE','England plan',1),
(12,10,'PCT','The Tunisia plan',1),
(13,12,'PCG','The Moroccan chart of accounts',1),
(14,13,'NSCF','Nouveau système comptable financier',1),
(15,17,'NL-VERKORT','Verkort rekeningschema',1),
(16,20,'BAS-K1-MINI','The Swedish mini chart of accounts',1),
(17,41,'AT-BASE','Plan Austria',1),
(18,67,'PC-MIPYME','The PYME accountancy Chile plan',1),
(19,80,'DK-STD','Standardkontoplan fra SKAT',1),
(20,84,'EC-SUPERCIAS','Plan de cuentas Ecuador',1),
(21,70,'CO-PUC','Plan único de cuentas Colombia',1),
(22,140,'PCN2020-LUXEMBURG','Plan comptable normalisé 2020 Luxembourgeois',1),
(23,188,'RO-BASE','Plan de conturi romanesc',1),
(24,102,'Ε.Λ.Π.','Ελληνικά Λογιστικά Πρότυπα',1),
(25,49,'SYSCOHADA-BJ','Plan comptable Ouest-Africain',1),
(26,60,'SYSCOHADA-BF','Plan comptable Ouest-Africain',1),
(27,73,'SYSCOHADA-CD','Plan comptable Ouest-Africain',1),
(28,65,'SYSCOHADA-CF','Plan comptable Ouest-Africain',1),
(29,72,'SYSCOHADA-CG','Plan comptable Ouest-Africain',1),
(30,21,'SYSCOHADA-CI','Plan comptable Ouest-Africain',1),
(31,24,'SYSCOHADA-CM','Plan comptable Ouest-Africain',1),
(32,16,'SYSCOHADA-GA','Plan comptable Ouest-Africain',1),
(33,87,'SYSCOHADA-GQ','Plan comptable Ouest-Africain',1),
(34,71,'SYSCOHADA-KM','Plan comptable Ouest-Africain',1),
(35,147,'SYSCOHADA-ML','Plan comptable Ouest-Africain',1),
(36,168,'SYSCOHADA-NE','Plan comptable Ouest-Africain',1),
(37,22,'SYSCOHADA-SN','Plan comptable Ouest-Africain',1),
(38,66,'SYSCOHADA-TD','Plan comptable Ouest-Africain',1),
(39,15,'SYSCOHADA-TG','Plan comptable Ouest-Africain',1),
(40,11,'US-BASE','USA basic chart of accounts',1),
(41,11,'US-GAAP-BASIC','USA GAAP basic chart of accounts',1),
(42,14,'CA-ENG-BASE','Canadian basic chart of accounts - English',1),
(43,154,'SAT/24-2019','Catalogo y codigo agrupador fiscal del 2019',1),
(44,123,'JPN-BASE','日本 勘定科目表 基本版',1);
/*!40000 ALTER TABLE `llx_accounting_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm`
--

DROP TABLE IF EXISTS `llx_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `fk_project` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_parent` int NOT NULL DEFAULT '0',
  `fk_user_action` int DEFAULT NULL,
  `fk_user_done` int DEFAULT NULL,
  `transparency` int DEFAULT NULL,
  `priority` smallint DEFAULT NULL,
  `visibility` varchar(12) DEFAULT 'default',
  `fulldayevent` smallint NOT NULL DEFAULT '0',
  `percent` smallint NOT NULL DEFAULT '0',
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `note` mediumtext,
  `calling_duration` int DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_sender` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `errors_to` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `recurid` varchar(128) DEFAULT NULL,
  `recurrule` varchar(128) DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `num_vote` int DEFAULT NULL,
  `event_paid` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `fk_element` int DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_code` (`code`),
  KEY `idx_actioncomm_fk_element` (`fk_element`),
  KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  KEY `idx_actioncomm_fk_project` (`fk_project`),
  KEY `idx_actioncomm_datep` (`datep`),
  KEY `idx_actioncomm_datep2` (`datep2`),
  KEY `idx_actioncomm_recurid` (`recurid`),
  KEY `idx_actioncomm_ref_ext` (`ref_ext`),
  KEY `idx_actioncomm_percent` (`percent`),
  KEY `idx_actioncomm_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm`
--

LOCK TABLES `llx_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm_extrafields`
--

DROP TABLE IF EXISTS `llx_actioncomm_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_actioncomm_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_extrafields`
--

LOCK TABLES `llx_actioncomm_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm_reminder`
--

DROP TABLE IF EXISTS `llx_actioncomm_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm_reminder` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) NOT NULL,
  `fk_user` int NOT NULL,
  `offsetvalue` int NOT NULL,
  `offsetunit` varchar(1) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `lasterror` varchar(128) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_actioncomm` int NOT NULL,
  `fk_email_template` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_actioncomm`,`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`),
  KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  KEY `idx_actioncomm_reminder_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_reminder`
--

LOCK TABLES `llx_actioncomm_reminder` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm_resources`
--

DROP TABLE IF EXISTS `llx_actioncomm_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm_resources` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_actioncomm` int NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint DEFAULT NULL,
  `transparency` smallint DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  KEY `idx_actioncomm_resources_fk_element` (`fk_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_resources`
--

LOCK TABLES `llx_actioncomm_resources` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent`
--

DROP TABLE IF EXISTS `llx_adherent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `fk_adherent_type` int NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `address` text,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `country` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `public` smallint NOT NULL DEFAULT '0',
  `datefin` datetime DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`),
  CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llx_adherent_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent`
--

LOCK TABLES `llx_adherent` WRITE;
/*!40000 ALTER TABLE `llx_adherent` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_extrafields`
--

DROP TABLE IF EXISTS `llx_adherent_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_extrafields`
--

LOCK TABLES `llx_adherent_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_adherent_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_type`
--

DROP TABLE IF EXISTS `llx_adherent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statut` smallint NOT NULL DEFAULT '0',
  `libelle` varchar(50) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `duration` varchar(6) DEFAULT NULL,
  `subscription` varchar(3) NOT NULL DEFAULT '1',
  `amount` double(24,8) DEFAULT NULL,
  `caneditamount` int DEFAULT '0',
  `vote` varchar(3) NOT NULL DEFAULT '1',
  `note` text,
  `mail_valid` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type`
--

LOCK TABLES `llx_adherent_type` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_type_extrafields`
--

DROP TABLE IF EXISTS `llx_adherent_type_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_type_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type_extrafields`
--

LOCK TABLES `llx_adherent_type_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_type_lang`
--

DROP TABLE IF EXISTS `llx_adherent_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_type_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_type` int NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `email` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type_lang`
--

LOCK TABLES `llx_adherent_type_lang` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank`
--

DROP TABLE IF EXISTS `llx_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `amount_main_currency` double(24,8) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_rappro` int DEFAULT NULL,
  `fk_type` varchar(6) DEFAULT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `rappro` tinyint DEFAULT '0',
  `note` text,
  `fk_bordereau` int DEFAULT '0',
  `position` int DEFAULT '0',
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `origin_id` int DEFAULT NULL,
  `origin_type` varchar(64) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_datev` (`datev`),
  KEY `idx_bank_dateo` (`dateo`),
  KEY `idx_bank_fk_account` (`fk_account`),
  KEY `idx_bank_rappro` (`rappro`),
  KEY `idx_bank_num_releve` (`num_releve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank`
--

LOCK TABLES `llx_bank` WRITE;
/*!40000 ALTER TABLE `llx_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_account`
--

DROP TABLE IF EXISTS `llx_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_account` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(12) NOT NULL,
  `label` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `pti_in_ctti` smallint DEFAULT '0',
  `state_id` int DEFAULT NULL,
  `fk_pays` int NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `owner_zip` varchar(25) DEFAULT NULL,
  `owner_town` varchar(50) DEFAULT NULL,
  `owner_country_id` int DEFAULT NULL,
  `courant` smallint NOT NULL DEFAULT '0',
  `clos` smallint NOT NULL DEFAULT '0',
  `rappro` smallint DEFAULT '1',
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(32) DEFAULT NULL,
  `fk_accountancy_journal` int DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int DEFAULT '0',
  `min_desired` int DEFAULT '0',
  `comment` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `ics` varchar(32) DEFAULT NULL,
  `ics_transfer` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`),
  CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `llx_accounting_journal` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_account`
--

LOCK TABLES `llx_bank_account` WRITE;
/*!40000 ALTER TABLE `llx_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_account_extrafields`
--

DROP TABLE IF EXISTS `llx_bank_account_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_account_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_account_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_account_extrafields`
--

LOCK TABLES `llx_bank_account_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bank_account_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_account_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_categ`
--

DROP TABLE IF EXISTS `llx_bank_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_categ` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_categ`
--

LOCK TABLES `llx_bank_categ` WRITE;
/*!40000 ALTER TABLE `llx_bank_categ` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_class`
--

DROP TABLE IF EXISTS `llx_bank_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_class` (
  `lineid` int NOT NULL,
  `fk_categ` int NOT NULL,
  UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_class`
--

LOCK TABLES `llx_bank_class` WRITE;
/*!40000 ALTER TABLE `llx_bank_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_extrafields`
--

DROP TABLE IF EXISTS `llx_bank_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_extrafields`
--

LOCK TABLES `llx_bank_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bank_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_url`
--

DROP TABLE IF EXISTS `llx_bank_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_url` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_bank` int DEFAULT NULL,
  `url_id` int DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(24) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`),
  KEY `idx_bank_url_url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_url`
--

LOCK TABLES `llx_bank_url` WRITE;
/*!40000 ALTER TABLE `llx_bank_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_blockedlog`
--

DROP TABLE IF EXISTS `llx_blockedlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_blockedlog` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` varchar(50) DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `fk_object` int DEFAULT NULL,
  `ref_object` varchar(255) DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) NOT NULL,
  `signature_line` varchar(100) NOT NULL,
  `object_data` mediumtext,
  `object_version` varchar(32) DEFAULT '',
  `certified` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`),
  KEY `fk_object_element` (`fk_object`,`element`),
  KEY `entity` (`entity`),
  KEY `fk_user` (`fk_user`),
  KEY `entity_action` (`entity`,`action`),
  KEY `entity_action_certified` (`entity`,`action`,`certified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_blockedlog`
--

LOCK TABLES `llx_blockedlog` WRITE;
/*!40000 ALTER TABLE `llx_blockedlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_blockedlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_blockedlog_authority`
--

DROP TABLE IF EXISTS `llx_blockedlog_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_blockedlog_authority` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `blockchain` longtext NOT NULL,
  `signature` varchar(100) NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_blockedlog_authority`
--

LOCK TABLES `llx_blockedlog_authority` WRITE;
/*!40000 ALTER TABLE `llx_blockedlog_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_blockedlog_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bom`
--

DROP TABLE IF EXISTS `llx_bom_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bom` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `bomtype` int DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `description` text,
  `note_public` text,
  `note_private` text,
  `fk_warehouse` int DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(24,8) DEFAULT '1.00000000',
  `duration` double(24,8) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  KEY `idx_bom_bom_rowid` (`rowid`),
  KEY `idx_bom_bom_ref` (`ref`),
  KEY `llx_bom_bom_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bom_bom_status` (`status`),
  KEY `idx_bom_bom_fk_product` (`fk_product`),
  CONSTRAINT `llx_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bom`
--

LOCK TABLES `llx_bom_bom` WRITE;
/*!40000 ALTER TABLE `llx_bom_bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bom_extrafields`
--

DROP TABLE IF EXISTS `llx_bom_bom_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bom_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bom_extrafields_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bom_extrafields`
--

LOCK TABLES `llx_bom_bom_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bom_bom_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bom_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bomline`
--

DROP TABLE IF EXISTS `llx_bom_bomline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bomline` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_bom` int NOT NULL,
  `fk_product` int NOT NULL,
  `fk_bom_child` int DEFAULT NULL,
  `description` text,
  `import_key` varchar(14) DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `qty_frozen` smallint DEFAULT '0',
  `disable_stock_change` smallint DEFAULT '0',
  `efficiency` double(24,8) NOT NULL DEFAULT '1.00000000',
  `fk_unit` int DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `fk_default_workstation` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bomline_rowid` (`rowid`),
  KEY `idx_bom_bomline_fk_product` (`fk_product`),
  KEY `idx_bom_bomline_fk_bom` (`fk_bom`),
  CONSTRAINT `llx_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `llx_bom_bom` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bomline`
--

LOCK TABLES `llx_bom_bomline` WRITE;
/*!40000 ALTER TABLE `llx_bom_bomline` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bomline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bomline_extrafields`
--

DROP TABLE IF EXISTS `llx_bom_bomline_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bomline_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bomline_extrafields`
--

LOCK TABLES `llx_bom_bomline_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bom_bomline_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bomline_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bookmark`
--

DROP TABLE IF EXISTS `llx_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bookmark` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_user` int NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookmark`
--

LOCK TABLES `llx_bookmark` WRITE;
/*!40000 ALTER TABLE `llx_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bordereau_cheque`
--

DROP TABLE IF EXISTS `llx_bordereau_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bordereau_cheque` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` varchar(6) DEFAULT 'CHQ',
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint NOT NULL,
  `fk_bank_account` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bordereau_cheque`
--

LOCK TABLES `llx_bordereau_cheque` WRITE;
/*!40000 ALTER TABLE `llx_bordereau_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bordereau_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_boxes`
--

DROP TABLE IF EXISTS `llx_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_boxes` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `box_id` int NOT NULL,
  `position` smallint NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int NOT NULL DEFAULT '0',
  `maxline` int DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  KEY `idx_boxes_boxid` (`box_id`),
  KEY `idx_boxes_fk_user` (`fk_user`),
  CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llx_boxes_def` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_boxes`
--

LOCK TABLES `llx_boxes` WRITE;
/*!40000 ALTER TABLE `llx_boxes` DISABLE KEYS */;
INSERT INTO `llx_boxes` VALUES
(1,1,1,0,'0',0,NULL,NULL),
(2,1,2,0,'0',0,NULL,NULL),
(3,1,3,0,'0',0,NULL,NULL);
/*!40000 ALTER TABLE `llx_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_boxes_def`
--

DROP TABLE IF EXISTS `llx_boxes_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_boxes_def` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_boxes_def`
--

LOCK TABLES `llx_boxes_def` WRITE;
/*!40000 ALTER TABLE `llx_boxes_def` DISABLE KEYS */;
INSERT INTO `llx_boxes_def` VALUES
(1,'box_lastlogin.php',1,0,'2023-11-22 09:05:55',NULL),
(2,'box_birthdays.php',1,0,'2023-11-22 09:05:55',NULL),
(3,'box_dolibarr_state_board.php',1,0,'2023-11-22 09:05:55',NULL);
/*!40000 ALTER TABLE `llx_boxes_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_budget`
--

DROP TABLE IF EXISTS `llx_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_budget` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `label` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `note` text,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_budget`
--

LOCK TABLES `llx_budget` WRITE;
/*!40000 ALTER TABLE `llx_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_budget_lines`
--

DROP TABLE IF EXISTS `llx_budget_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_budget_lines` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_budget` int NOT NULL,
  `fk_project_ids` varchar(180) NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`),
  CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `llx_budget` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_budget_lines`
--

LOCK TABLES `llx_budget_lines` WRITE;
/*!40000 ALTER TABLE `llx_budget_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_budget_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_accounting_category`
--

DROP TABLE IF EXISTS `llx_c_accounting_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_accounting_category` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `range_account` varchar(255) NOT NULL,
  `sens` tinyint NOT NULL DEFAULT '0',
  `category_type` tinyint NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL,
  `position` int DEFAULT '0',
  `fk_country` int DEFAULT NULL,
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_accounting_category`
--

LOCK TABLES `llx_c_accounting_category` WRITE;
/*!40000 ALTER TABLE `llx_c_accounting_category` DISABLE KEYS */;
INSERT INTO `llx_c_accounting_category` VALUES
(1,1,'INCOMES','Income of products/services','Example: 7xxxxx',0,0,'',10,0,1),
(2,1,'EXPENSES','Expenses of products/services','Example: 6xxxxx',0,0,'',20,0,1),
(3,1,'PROFIT','Balance','',0,1,'INCOMES+EXPENSES',30,0,1);
/*!40000 ALTER TABLE `llx_c_accounting_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_action_trigger`
--

DROP TABLE IF EXISTS `llx_c_action_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_action_trigger` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `elementtype` varchar(64) NOT NULL,
  `code` varchar(128) NOT NULL,
  `contexts` varchar(255) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_action_trigger_code` (`code`),
  KEY `idx_action_trigger_rang` (`rang`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_action_trigger`
--

LOCK TABLES `llx_c_action_trigger` WRITE;
/*!40000 ALTER TABLE `llx_c_action_trigger` DISABLE KEYS */;
INSERT INTO `llx_c_action_trigger` VALUES
(1,'societe','COMPANY_CREATE',NULL,'Third party created','Executed when a third party is created',1),
(2,'societe','COMPANY_MODIFY',NULL,'Third party update','Executed when you update third party',1),
(3,'societe','COMPANY_SENTBYMAIL',NULL,'Mails sent from third party card','Executed when you send email from third party card',1),
(4,'societe','COMPANY_DELETE',NULL,'Third party deleted','Executed when you delete third party',1),
(5,'propal','PROPAL_VALIDATE',NULL,'Customer proposal validated','Executed when a commercial proposal is validated',2),
(6,'propal','PROPAL_MODIFY',NULL,'Customer proposal modified','Executed when a customer proposal is modified',2),
(7,'propal','PROPAL_SENTBYMAIL',NULL,'Commercial proposal sent by mail','Executed when a commercial proposal is sent by mail',3),
(8,'propal','PROPAL_CLOSE_SIGNED',NULL,'Customer proposal closed signed','Executed when a customer proposal is closed signed',2),
(9,'propal','PROPAL_CLOSE_REFUSED',NULL,'Customer proposal closed refused','Executed when a customer proposal is closed refused',2),
(10,'propal','PROPAL_CLASSIFY_BILLED',NULL,'Customer proposal set billed','Executed when a customer proposal is set to billed',2),
(11,'propal','PROPAL_DELETE',NULL,'Customer proposal deleted','Executed when a customer proposal is deleted',2),
(12,'commande','ORDER_VALIDATE',NULL,'Customer order validate','Executed when a customer order is validated',4),
(13,'commande','ORDER_CLOSE',NULL,'Customer order classify delivered','Executed when a customer order is set delivered',5),
(14,'commande','ORDER_MODIFY',NULL,'Customer order modified','Executed when a customer order is set modified',5),
(15,'commande','ORDER_CLASSIFY_BILLED',NULL,'Customer order classify billed','Executed when a customer order is set to billed',5),
(16,'commande','ORDER_CANCEL',NULL,'Customer order canceled','Executed when a customer order is canceled',5),
(17,'commande','ORDER_SENTBYMAIL',NULL,'Customer order sent by mail','Executed when a customer order is sent by mail ',5),
(18,'commande','ORDER_DELETE',NULL,'Customer order deleted','Executed when a customer order is deleted',5),
(19,'facture','BILL_VALIDATE',NULL,'Customer invoice validated','Executed when a customer invoice is approved',6),
(20,'facture','BILL_MODIFY',NULL,'Customer invoice modified','Executed when a customer invoice is modified',7),
(21,'facture','BILL_PAYED',NULL,'Customer invoice payed','Executed when a customer invoice is payed',7),
(22,'facture','BILL_CANCEL',NULL,'Customer invoice canceled','Executed when a customer invoice is conceled',8),
(23,'facture','BILL_SENTBYMAIL',NULL,'Customer invoice sent by mail','Executed when a customer invoice is sent by mail',9),
(24,'facture','BILL_UNVALIDATE',NULL,'Customer invoice unvalidated','Executed when a customer invoice status set back to draft',9),
(25,'facture','BILL_DELETE',NULL,'Customer invoice deleted','Executed when a customer invoice is deleted',9),
(26,'proposal_supplier','PROPOSAL_SUPPLIER_VALIDATE',NULL,'Price request validated','Executed when a commercial proposal is validated',10),
(27,'proposal_supplier','PROPOSAL_SUPPLIER_MODIFY',NULL,'Price request modified','Executed when a commercial proposal is modified',10),
(28,'proposal_supplier','PROPOSAL_SUPPLIER_SENTBYMAIL',NULL,'Price request sent by mail','Executed when a commercial proposal is sent by mail',10),
(29,'proposal_supplier','PROPOSAL_SUPPLIER_CLOSE_SIGNED',NULL,'Price request closed signed','Executed when a customer proposal is closed signed',10),
(30,'proposal_supplier','PROPOSAL_SUPPLIER_CLOSE_REFUSED',NULL,'Price request closed refused','Executed when a customer proposal is closed refused',10),
(31,'proposal_supplier','PROPOSAL_SUPPLIER_DELETE',NULL,'Price request deleted','Executed when a customer proposal delete',10),
(32,'order_supplier','ORDER_SUPPLIER_VALIDATE',NULL,'Supplier order validated','Executed when a supplier order is validated',12),
(33,'order_supplier','ORDER_SUPPLIER_APPROVE',NULL,'Supplier order request approved','Executed when a supplier order is approved',13),
(34,'order_supplier','ORDER_SUPPLIER_MODIFY',NULL,'Supplier order request modified','Executed when a supplier order is modified',13),
(35,'order_supplier','ORDER_SUPPLIER_SUBMIT',NULL,'Supplier order request submited','Executed when a supplier order is approved',13),
(36,'order_supplier','ORDER_SUPPLIER_RECEIVE',NULL,'Supplier order request received','Executed when a supplier order is received',13),
(37,'order_supplier','ORDER_SUPPLIER_REFUSE',NULL,'Supplier order request refused','Executed when a supplier order is refused',13),
(38,'order_supplier','ORDER_SUPPLIER_CANCEL',NULL,'Supplier order request canceled','Executed when a supplier order is canceled',13),
(39,'order_supplier','ORDER_SUPPLIER_SENTBYMAIL',NULL,'Supplier order sent by mail','Executed when a supplier order is sent by mail',14),
(40,'order_supplier','ORDER_SUPPLIER_CLASSIFY_BILLED',NULL,'Supplier order set billed','Executed when a supplier order is set as billed',14),
(41,'order_supplier','ORDER_SUPPLIER_DELETE',NULL,'Supplier order deleted','Executed when a supplier order is deleted',14),
(42,'invoice_supplier','BILL_SUPPLIER_VALIDATE',NULL,'Supplier invoice validated','Executed when a supplier invoice is validated',15),
(43,'invoice_supplier','BILL_SUPPLIER_MODIFY',NULL,'Supplier invoice modified','Executed when a supplier invoice is modified',15),
(44,'invoice_supplier','BILL_SUPPLIER_UNVALIDATE',NULL,'Supplier invoice unvalidated','Executed when a supplier invoice status is set back to draft',15),
(45,'invoice_supplier','BILL_SUPPLIER_PAYED',NULL,'Supplier invoice payed','Executed when a supplier invoice is payed',16),
(46,'invoice_supplier','BILL_SUPPLIER_SENTBYMAIL',NULL,'Supplier invoice sent by mail','Executed when a supplier invoice is sent by mail',17),
(47,'invoice_supplier','BILL_SUPPLIER_CANCELED',NULL,'Supplier invoice cancelled','Executed when a supplier invoice is cancelled',17),
(48,'invoice_supplier','BILL_SUPPLIER_DELETE',NULL,'Supplier invoice deleted','Executed when a supplier invoice is deleted',17),
(49,'contrat','CONTRACT_VALIDATE',NULL,'Contract validated','Executed when a contract is validated',18),
(50,'contrat','CONTRACT_MODIFY',NULL,'Contract modified','Executed when a contract is modified',18),
(51,'contrat','CONTRACT_SENTBYMAIL',NULL,'Contract sent by mail','Executed when a contract is sent by mail',18),
(52,'contrat','CONTRACT_DELETE',NULL,'Contract deleted','Executed when a contract is deleted',18),
(53,'shipping','SHIPPING_VALIDATE',NULL,'Shipping validated','Executed when a shipping is validated',20),
(54,'shipping','SHIPPING_MODIFY',NULL,'Shipping modified','Executed when a shipping is modified',20),
(55,'shipping','SHIPPING_SENTBYMAIL',NULL,'Shipping sent by mail','Executed when a shipping is sent by mail',21),
(56,'shipping','SHIPPING_DELETE',NULL,'Shipping sent is deleted','Executed when a shipping is deleted',21),
(57,'reception','RECEPTION_VALIDATE',NULL,'Reception validated','Executed when a reception is validated',22),
(58,'reception','RECEPTION_SENTBYMAIL',NULL,'Reception sent by mail','Executed when a reception is sent by mail',22),
(59,'member','MEMBER_VALIDATE',NULL,'Member validated','Executed when a member is validated',22),
(60,'member','MEMBER_MODIFY',NULL,'Member modified','Executed when a member is modified',23),
(61,'member','MEMBER_SENTBYMAIL',NULL,'Mails sent from member card','Executed when you send email from member card',23),
(62,'member','MEMBER_SUBSCRIPTION_CREATE',NULL,'Member subscribtion recorded','Executed when a member subscribtion is deleted',24),
(63,'member','MEMBER_SUBSCRIPTION_MODIFY',NULL,'Member subscribtion modified','Executed when a member subscribtion is modified',24),
(64,'member','MEMBER_SUBSCRIPTION_DELETE',NULL,'Member subscribtion deleted','Executed when a member subscribtion is deleted',24),
(65,'member','MEMBER_RESILIATE',NULL,'Member resiliated','Executed when a member is resiliated',25),
(66,'member','MEMBER_DELETE',NULL,'Member deleted','Executed when a member is deleted',26),
(67,'member','MEMBER_EXCLUDE',NULL,'Member excluded','Executed when a member is excluded',27),
(68,'ficheinter','FICHINTER_VALIDATE',NULL,'Intervention validated','Executed when a intervention is validated',30),
(69,'ficheinter','FICHINTER_MODIFY',NULL,'Intervention modify','Executed when a intervention is modify',30),
(70,'ficheinter','FICHINTER_CLASSIFY_BILLED',NULL,'Intervention set billed','Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)',32),
(71,'ficheinter','FICHINTER_CLASSIFY_UNBILLED',NULL,'Intervention set unbilled','Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)',33),
(72,'ficheinter','FICHINTER_REOPEN',NULL,'Intervention opened','Executed when a intervention is re-opened',34),
(73,'ficheinter','FICHINTER_SENTBYMAIL',NULL,'Intervention sent by mail','Executed when a intervention is sent by mail',35),
(74,'ficheinter','FICHINTER_DELETE',NULL,'Intervention is deleted','Executed when a intervention is deleted',35),
(75,'product','PRODUCT_CREATE',NULL,'Product or service created','Executed when a product or sevice is created',40),
(76,'product','PRODUCT_MODIFY',NULL,'Product or service modified','Executed when a product or sevice is modified',41),
(77,'product','PRODUCT_DELETE',NULL,'Product or service deleted','Executed when a product or sevice is deleted',42),
(78,'expensereport','EXPENSE_REPORT_CREATE',NULL,'Expense report created','Executed when an expense report is created',201),
(79,'expensereport','EXPENSE_REPORT_VALIDATE',NULL,'Expense report validated','Executed when an expense report is validated',202),
(80,'expensereport','EXPENSE_REPORT_MODIFY',NULL,'Expense report modified','Executed when an expense report is modified',202),
(81,'expensereport','EXPENSE_REPORT_APPROVE',NULL,'Expense report approved','Executed when an expense report is approved',203),
(82,'expensereport','EXPENSE_REPORT_PAID',NULL,'Expense report billed','Executed when an expense report is set as billed',204),
(83,'expensereport','EXPENSE_REPORT_DELETE',NULL,'Expense report deleted','Executed when an expense report is deleted',205),
(84,'project','PROJECT_CREATE',NULL,'Project creation','Executed when a project is created',140),
(85,'project','PROJECT_VALIDATE',NULL,'Project validation','Executed when a project is validated',141),
(86,'project','PROJECT_MODIFY',NULL,'Project modified','Executed when a project is modified',142),
(87,'project','PROJECT_DELETE',NULL,'Project deleted','Executed when a project is deleted',143),
(88,'project','PROJECT_SENTBYMAIL',NULL,'Project sent by mail','Executed when a project is sent by email',144),
(89,'project','PROJECT_CLOSE',NULL,'Project closed','Executed when a project is closed',145),
(90,'ticket','TICKET_CREATE',NULL,'Ticket created','Executed when a ticket is created',161),
(91,'ticket','TICKET_MODIFY',NULL,'Ticket modified','Executed when a ticket is modified',163),
(92,'ticket','TICKET_ASSIGNED',NULL,'Ticket assigned','Executed when a ticket is modified',164),
(93,'ticket','TICKET_CLOSE',NULL,'Ticket closed','Executed when a ticket is closed',165),
(94,'ticket','TICKET_SENTBYMAIL',NULL,'Ticket message sent by email','Executed when a message is sent from the ticket record',166),
(95,'ticket','TICKET_DELETE',NULL,'Ticket deleted','Executed when a ticket is deleted',167),
(96,'user','USER_SENTBYMAIL',NULL,'Email sent','Executed when an email is sent from user card',300),
(97,'user','USER_CREATE',NULL,'User created','Executed when a user is created',301),
(98,'user','USER_MODIFY',NULL,'User update','Executed when a user is updated',302),
(99,'user','USER_DELETE',NULL,'User update','Executed when a user is deleted',303),
(100,'user','USER_NEW_PASSWORD',NULL,'User update','Executed when a user is change password',304),
(101,'user','USER_ENABLEDISABLE',NULL,'User update','Executed when a user is enable or disable',305),
(103,'bom','BOM_VALIDATE',NULL,'BOM validated','Executed when a BOM is validated',650),
(104,'bom','BOM_UNVALIDATE',NULL,'BOM unvalidated','Executed when a BOM is unvalidated',651),
(105,'bom','BOM_CLOSE',NULL,'BOM disabled','Executed when a BOM is disabled',652),
(106,'bom','BOM_REOPEN',NULL,'BOM reopen','Executed when a BOM is re-open',653),
(107,'bom','BOM_DELETE',NULL,'BOM deleted','Executed when a BOM deleted',654),
(108,'mrp','MRP_MO_VALIDATE',NULL,'MO validated','Executed when a MO is validated',660),
(109,'mrp','MRP_MO_PRODUCED',NULL,'MO produced','Executed when a MO is produced',661),
(110,'mrp','MRP_MO_DELETE',NULL,'MO deleted','Executed when a MO is deleted',662),
(111,'mrp','MRP_MO_CANCEL',NULL,'MO canceled','Executed when a MO is canceled',663),
(112,'contact','CONTACT_CREATE',NULL,'Contact address created','Executed when a contact is created',50),
(113,'contact','CONTACT_MODIFY',NULL,'Contact address update','Executed when a contact is updated',51),
(114,'contact','CONTACT_SENTBYMAIL',NULL,'Mails sent from third party card','Executed when you send email from contact address record',52),
(115,'contact','CONTACT_DELETE',NULL,'Contact address deleted','Executed when a contact is deleted',53),
(116,'recruitment','RECRUITMENTJOBPOSITION_CREATE',NULL,'Job created','Executed when a job is created',7500),
(117,'recruitment','RECRUITMENTJOBPOSITION_MODIFY',NULL,'Job modified','Executed when a job is modified',7502),
(118,'recruitment','RECRUITMENTJOBPOSITION_SENTBYMAIL',NULL,'Mails sent from job record','Executed when you send email from job record',7504),
(119,'recruitment','RECRUITMENTJOBPOSITION_DELETE',NULL,'Job deleted','Executed when a job is deleted',7506),
(120,'recruitment','RECRUITMENTCANDIDATURE_CREATE',NULL,'Candidature created','Executed when a candidature is created',7510),
(121,'recruitment','RECRUITMENTCANDIDATURE_MODIFY',NULL,'Candidature modified','Executed when a candidature is modified',7512),
(122,'recruitment','RECRUITMENTCANDIDATURE_SENTBYMAIL',NULL,'Mails sent from candidature record','Executed when you send email from candidature record',7514),
(123,'recruitment','RECRUITMENTCANDIDATURE_DELETE',NULL,'Candidature deleted','Executed when a candidature is deleted',7516),
(124,'project','TASK_CREATE',NULL,'Task created','Executed when a project task is created',150),
(125,'project','TASK_MODIFY',NULL,'Task modified','Executed when a project task is modified',151),
(126,'project','TASK_DELETE',NULL,'Task deleted','Executed when a project task is deleted',152),
(127,'agenda','ACTION_CREATE',NULL,'Action added','Executed when an action is added to the agenda',700),
(128,'holiday','HOLIDAY_CREATE',NULL,'Holiday created','Executed when a holiday is created',800),
(129,'holiday','HOLIDAY_MODIFY',NULL,'Holiday modified','Executed when a holiday is modified',801),
(130,'holiday','HOLIDAY_VALIDATE',NULL,'Holiday validated','Executed when a holiday is validated',802),
(131,'holiday','HOLIDAY_APPROVE',NULL,'Holiday approved','Executed when a holiday is aprouved',803),
(132,'holiday','HOLIDAY_CANCEL',NULL,'Holiday canceled','Executed when a holiday is canceled',802),
(133,'holiday','HOLIDAY_DELETE',NULL,'Holiday deleted','Executed when a holiday is deleted',804),
(134,'facturerec','BILLREC_CREATE',NULL,'Template invoices created','Executed when a Template invoices is created',900),
(135,'facturerec','BILLREC_MODIFY',NULL,'Template invoices update','Executed when a Template invoices is updated',901),
(136,'facturerec','BILLREC_DELETE',NULL,'Template invoices deleted','Executed when a Template invoices is deleted',902),
(137,'facturerec','BILLREC_AUTOCREATEBILL',NULL,'Template invoices use to create invoices with auto batch','Executed when a Template invoices is use to create invoice with auto batch',903),
(138,'partnership','PARTNERSHIP_CREATE',NULL,'Partnership created','Executed when a partnership is created',58000),
(139,'partnership','PARTNERSHIP_MODIFY',NULL,'Partnership modified','Executed when a partnership is modified',58002),
(140,'partnership','PARTNERSHIP_SENTBYMAIL',NULL,'Mails sent from partnership file','Executed when you send email from partnership file',58004),
(141,'partnership','PARTNERSHIP_DELETE',NULL,'Partnership deleted','Executed when a partnership is deleted',58006);
/*!40000 ALTER TABLE `llx_c_action_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_actioncomm`
--

DROP TABLE IF EXISTS `llx_c_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_actioncomm` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `libelle` varchar(128) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `todo` tinyint DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL,
  `picto` varchar(48) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_actioncomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_actioncomm`
--

LOCK TABLES `llx_c_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_c_actioncomm` DISABLE KEYS */;
INSERT INTO `llx_c_actioncomm` VALUES
(1,'AC_TEL','system','Phone call',NULL,1,NULL,NULL,NULL,2),
(2,'AC_FAX','system','Send Fax',NULL,0,NULL,NULL,NULL,3),
(4,'AC_EMAIL','system','Send Email',NULL,0,NULL,NULL,NULL,4),
(5,'AC_RDV','system','Rendez-vous',NULL,1,NULL,NULL,NULL,1),
(6,'AC_EMAIL_IN','system','Reception Email',NULL,0,NULL,NULL,NULL,4),
(11,'AC_INT','system','Intervention on site',NULL,1,NULL,NULL,NULL,4),
(40,'AC_OTH_AUTO','systemauto','Other (automatically inserted events)',NULL,1,NULL,NULL,NULL,20),
(50,'AC_OTH','system','Other (manually inserted events)',NULL,1,NULL,NULL,NULL,5),
(60,'AC_EO_ONLINECONF','module','Online/Virtual conference','conference@eventorganization',1,NULL,NULL,NULL,60),
(61,'AC_EO_INDOORCONF','module','Indoor conference','conference@eventorganization',1,NULL,NULL,NULL,61),
(62,'AC_EO_ONLINEBOOTH','module','Online/Virtual booth','booth@eventorganization',1,NULL,NULL,NULL,62),
(63,'AC_EO_INDOORBOOTH','module','Indoor booth','booth@eventorganization',1,NULL,NULL,NULL,63);
/*!40000 ALTER TABLE `llx_c_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_availability`
--

DROP TABLE IF EXISTS `llx_c_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_availability` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `label` varchar(128) NOT NULL,
  `type_duration` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_availability` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_availability`
--

LOCK TABLES `llx_c_availability` WRITE;
/*!40000 ALTER TABLE `llx_c_availability` DISABLE KEYS */;
INSERT INTO `llx_c_availability` VALUES
(1,'AV_NOW','Immediate',NULL,0,1,10),
(2,'AV_1D','1 day','d',1,1,11),
(3,'AV_2D','2 days','d',2,1,12),
(4,'AV_3D','3 days','d',3,1,13),
(5,'AV_4D','4 days','d',4,1,14),
(6,'AV_5D','5 days','d',5,1,15),
(7,'AV_1W','1 week','w',1,1,20),
(8,'AV_2W','2 weeks','w',2,1,30),
(9,'AV_3W','3 weeks','w',3,1,40),
(10,'AV_4W','4 weeks','w',4,1,50),
(11,'AV_5W','5 weeks','w',5,1,60),
(12,'AV_6W','6 weeks','w',6,1,70),
(13,'AV_8W','8 weeks','w',8,1,80),
(14,'AV_10W','10 weeks','w',10,1,90),
(15,'AV_12W','12 weeks','w',12,1,100),
(16,'AV_14W','14 weeks','w',14,1,110),
(17,'AV_16W','16 weeks','w',16,1,120);
/*!40000 ALTER TABLE `llx_c_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_barcode_type`
--

DROP TABLE IF EXISTS `llx_c_barcode_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_barcode_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `libelle` varchar(128) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_barcode_type`
--

LOCK TABLES `llx_c_barcode_type` WRITE;
/*!40000 ALTER TABLE `llx_c_barcode_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_barcode_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_chargesociales`
--

DROP TABLE IF EXISTS `llx_c_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_chargesociales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(128) DEFAULT NULL,
  `deductible` smallint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `code` varchar(12) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_pays` int NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_chargesociales`
--

LOCK TABLES `llx_c_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_c_chargesociales` DISABLE KEYS */;
INSERT INTO `llx_c_chargesociales` VALUES
(1,'Securite sociale (URSSAF / MSA)',1,1,'TAXSECU',NULL,1,NULL),
(2,'Securite sociale des indépendants (URSSAF)',1,1,'TAXSSI',NULL,1,NULL),
(10,'Taxe apprentissage',1,1,'TAXAPP',NULL,1,NULL),
(11,'Formation professionnelle continue',1,1,'TAXFPC',NULL,1,NULL),
(12,'Cotisation fonciere des entreprises (CFE)',1,1,'TAXCFE',NULL,1,NULL),
(13,'Cotisation sur la valeur ajoutee des entreprises (CVAE)',1,1,'TAXCVAE',NULL,1,NULL),
(20,'Taxe fonciere',1,1,'TAXFON',NULL,1,NULL),
(25,'Prelevement à la source (PAS)',0,1,'TAXPAS',NULL,1,NULL),
(30,'Prevoyance',1,1,'TAXPREV',NULL,1,NULL),
(40,'Mutuelle',1,1,'TAXMUT',NULL,1,NULL),
(50,'Retraite',1,1,'TAXRET',NULL,1,NULL),
(60,'Taxe sur vehicule societe (TVS)',0,1,'TAXTVS',NULL,1,NULL),
(70,'impôts sur les sociétés (IS)',0,1,'TAXIS',NULL,1,NULL),
(201,'ONSS',1,1,'TAXBEONSS',NULL,2,NULL),
(210,'Precompte professionnel',1,1,'TAXBEPREPRO',NULL,2,NULL),
(220,'Prime existence',1,1,'TAXBEPRIEXI',NULL,2,NULL),
(230,'Precompte immobilier',1,1,'TAXBEPREIMMO',NULL,2,NULL),
(4101,'Krankenversicherung',1,1,'TAXATKV',NULL,41,NULL),
(4102,'Unfallversicherung',1,1,'TAXATUV',NULL,41,NULL),
(4103,'Pensionsversicherung',1,1,'TAXATPV',NULL,41,NULL),
(4104,'Arbeitslosenversicherung',1,1,'TAXATAV',NULL,41,NULL),
(4105,'Insolvenzentgeltsicherungsfond',1,1,'TAXATIESG',NULL,41,NULL),
(4106,'Wohnbauförderung',1,1,'TAXATWF',NULL,41,NULL),
(4107,'Arbeiterkammerumlage',1,1,'TAXATAK',NULL,41,NULL),
(4108,'Mitarbeitervorsorgekasse',1,1,'TAXATMVK',NULL,41,NULL),
(4109,'Familienlastenausgleichsfond',1,1,'TAXATFLAF',NULL,41,NULL),
(10201,'Αναλυτική Περιοδική Δήλωση (ΑΠΔ)',1,1,'ΑΠΔ',NULL,102,NULL),
(10202,'Φόρος Μισθωτών Υπηρεσιών (ΦΜΥ)',1,1,'ΦΜΥ',NULL,102,NULL),
(10203,'Ασφαλιστικές εισφορές (ΕΦΚΑ)',1,1,'ΕΦΚΑ',NULL,102,NULL),
(10204,'Προκαταβολή Φόρου Εισοδήματος',0,1,'ΕΦΟΡΙΑ',NULL,102,NULL),
(10205,'Ενιαίος Φόρος Ιδιοκτησίας Ακινήτων (ΕΝ.Φ.Ι.Α) ',0,1,'ΕΝΦΙΑ',NULL,102,NULL),
(10206,'Ετήσιο τέλος διατήρησης Μερίδας στο Γ.Ε.ΜΗ.',1,1,'ΓΕΜΗ',NULL,102,NULL),
(10207,'Επαγγελματικό Επιμελητήριο',1,1,'ΕΕ',NULL,102,NULL),
(10208,'Εμπορικό και Βιομηχανικό Επιμελητηρίο',1,1,'ΕΒΕ',NULL,102,NULL),
(10209,'Τέλη Κυκλοφορίας',1,1,'ΤΕΛΗ',NULL,102,NULL),
(10210,'Ασφάλιση οχήματος',1,1,'ΑΣΦΑΛΕΙΑ',NULL,102,NULL),
(10211,'Ενοίκιο',1,1,'ΕΝΟΙΚΙΟ',NULL,102,NULL),
(10212,'Κοινόχρηστα',1,1,'ΚΟΙΝΟ',NULL,102,NULL),
(10213,'Ηλεκτροδότηση',1,1,'ΡΕΥΜΑ',NULL,102,NULL);
/*!40000 ALTER TABLE `llx_c_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_civility`
--

DROP TABLE IF EXISTS `llx_c_civility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_civility` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_civility` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_civility`
--

LOCK TABLES `llx_c_civility` WRITE;
/*!40000 ALTER TABLE `llx_c_civility` DISABLE KEYS */;
INSERT INTO `llx_c_civility` VALUES
(1,'MME','Madame',1,NULL),
(2,'MR','Monsieur',1,NULL),
(3,'MLE','Mademoiselle',1,NULL),
(4,'MTRE','Maître',1,NULL),
(5,'DR','Docteur',1,NULL);
/*!40000 ALTER TABLE `llx_c_civility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_country`
--

DROP TABLE IF EXISTS `llx_c_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_country` (
  `rowid` int NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `numeric_code` varchar(3) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `eec` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `favorite` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_country_code` (`code`),
  UNIQUE KEY `idx_c_country_label` (`label`),
  UNIQUE KEY `idx_c_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_country`
--

LOCK TABLES `llx_c_country` WRITE;
/*!40000 ALTER TABLE `llx_c_country` DISABLE KEYS */;
INSERT INTO `llx_c_country` VALUES
(0,'',NULL,NULL,'-',0,1,1),
(1,'FR','FRA','250','France',1,1,0),
(2,'BE','BEL','056','Belgium',1,1,0),
(3,'IT','ITA','380','Italy',1,1,0),
(4,'ES','ESP','724','Spain',1,1,0),
(5,'DE','DEU','276','Germany',1,1,0),
(6,'CH','CHE','756','Switzerland',0,1,0),
(7,'GB','GBR','826','United Kingdom',0,1,0),
(8,'IE','IRL','372','Ireland',1,1,0),
(9,'CN','CHN','156','China',0,1,0),
(10,'TN','TUN','788','Tunisia',0,1,0),
(11,'US','USA','840','United States',0,1,0),
(12,'MA','MAR','504','Morocco',0,1,0),
(13,'DZ','DZA','012','Algeria',0,1,0),
(14,'CA','CAN','124','Canada',0,1,0),
(15,'TG','TGO','768','Togo',0,1,0),
(16,'GA','GAB','266','Gabon',0,1,0),
(17,'NL','NLD','528','Netherlands',1,1,0),
(18,'HU','HUN','348','Hungary',1,1,0),
(19,'RU','RUS','643','Russia',0,1,0),
(20,'SE','SWE','752','Sweden',1,1,0),
(21,'CI','CIV','384','Côte d\'Ivoire',0,1,0),
(22,'SN','SEN','686','Senegal',0,1,0),
(23,'AR','ARG','032','Argentina',0,1,0),
(24,'CM','CMR','120','Cameroun',0,1,0),
(25,'PT','PRT','620','Portugal',1,1,0),
(26,'SA','SAU','682','Saudi Arabia',0,1,0),
(27,'MC','MCO','492','Monaco',1,1,0),
(28,'AU','AUS','036','Australia',0,1,0),
(29,'SG','SGP','702','Singapore',0,1,0),
(30,'AF','AFG','004','Afghanistan',0,1,0),
(31,'AX','ALA','248','Åland Island',0,1,0),
(32,'AL','ALB','008','Albania',0,1,0),
(33,'AS','ASM','016','American Samoa',0,1,0),
(34,'AD','AND','020','Andorra',0,1,0),
(35,'AO','AGO','024','Angola',0,1,0),
(36,'AI','AIA','660','Anguilla',0,1,0),
(37,'AQ','ATA','010','Antarctica',0,1,0),
(38,'AG','ATG','028','Antigua and Barbuda',0,1,0),
(39,'AM','ARM','051','Armenia',0,1,0),
(40,'AW','ABW','533','Aruba',0,1,0),
(41,'AT','AUT','040','Austria',1,1,0),
(42,'AZ','AZE','031','Azerbaijan',0,1,0),
(43,'BS','BHS','044','Bahamas',0,1,0),
(44,'BH','BHR','048','Bahrain',0,1,0),
(45,'BD','BGD','050','Bangladesh',0,1,0),
(46,'BB','BRB','052','Barbados',0,1,0),
(47,'BY','BLR','112','Belarus',0,1,0),
(48,'BZ','BLZ','084','Belize',0,1,0),
(49,'BJ','BEN','204','Benin',0,1,0),
(50,'BM','BMU','060','Bermuda',0,1,0),
(51,'BT','BTN','064','Bhutan',0,1,0),
(52,'BO','BOL','068','Bolivia',0,1,0),
(53,'BA','BIH','070','Bosnia and Herzegovina',0,1,0),
(54,'BW','BWA','072','Botswana',0,1,0),
(55,'BV','BVT','074','Bouvet Island',0,0,0),
(56,'BR','BRA','076','Brazil',0,1,0),
(57,'IO','IOT','086','British Indian Ocean Territory',0,1,0),
(58,'BN','BRN','096','Brunei',0,1,0),
(59,'BG','BGR','100','Bulgaria',1,1,0),
(60,'BF','BFA','854','Burkina Faso',0,1,0),
(61,'BI','BDI','108','Burundi',0,1,0),
(62,'KH','KHM','116','Cambodge / Cambodia',0,1,0),
(63,'CV','CPV','132','Cap-Vert',0,1,0),
(64,'KY','CYM','136','Iles Cayman',0,1,0),
(65,'CF','CAF','140','Central African Republic (CAR/RCA)',0,1,0),
(66,'TD','TCD','148','Tchad',0,1,0),
(67,'CL','CHL','152','Chile',0,1,0),
(68,'CX','CXR','162','Ile Christmas',0,1,0),
(69,'CC','CCK','166','Iles des Cocos (Keeling)',0,1,0),
(70,'CO','COL','170','Colombie',0,1,0),
(71,'KM','COM','174','Comores',0,1,0),
(72,'CG','COG','178','Congo',0,1,0),
(73,'CD','COD','180','DR Congo (RDC)',0,1,0),
(74,'CK','COK','184','Iles Cook',0,1,0),
(75,'CR','CRI','188','Costa Rica',0,1,0),
(76,'HR','HRV','191','Croatia',1,1,0),
(77,'CU','CUB','192','Cuba',0,1,0),
(78,'CY','CYP','196','Cyprus',1,1,0),
(79,'CZ','CZE','203','Czech Republic',1,1,0),
(80,'DK','DNK','208','Denmark',1,1,0),
(81,'DJ','DJI','262','Djibouti',0,1,0),
(82,'DM','DMA','212','Dominica',0,1,0),
(83,'DO','DOM','214','Dominican Republic',0,1,0),
(84,'EC','ECU','218','Republic of Ecuador',0,1,0),
(85,'EG','EGY','818','Egypt',0,1,0),
(86,'SV','SLV','222','El Salvador',0,1,0),
(87,'GQ','GNQ','226','Equatorial Guinea',0,1,0),
(88,'ER','ERI','232','Eritrea',0,1,0),
(89,'EE','EST','233','Estonia',1,1,0),
(90,'ET','ETH','231','Ethiopia',0,1,0),
(91,'FK','FLK','238','Falkland Islands',0,1,0),
(92,'FO','FRO','234','Faroe Islands',0,1,0),
(93,'FJ','FJI','242','Fidji Islands',0,1,0),
(94,'FI','FIN','246','Finland',1,1,0),
(95,'GF','GUF','254','French Guiana',0,1,0),
(96,'PF','PYF','258','French Polynesia',0,1,0),
(97,'TF','ATF','260','Terres australes françaises',0,1,0),
(98,'GM','GMB','270','Gambie',0,1,0),
(99,'GE','GEO','268','Georgia',0,1,0),
(100,'GH','GHA','288','Ghana',0,1,0),
(101,'GI','GIB','292','Gibraltar',0,1,0),
(102,'GR','GRC','300','Greece',1,1,0),
(103,'GL','GRL','304','Groenland',0,1,0),
(104,'GD','GRD','308','Grenade',0,1,0),
(106,'GU','GUM','316','Guam',0,1,0),
(107,'GT','GTM','320','Guatemala',0,1,0),
(108,'GN','GIN','324','Guinea',0,1,0),
(109,'GW','GNB','624','Guinea-Bissao',0,1,0),
(111,'HT','HTI','332','Haiti',0,1,0),
(112,'HM','HMD','334','Iles Heard et McDonald',0,1,0),
(113,'VA','VAT','336','Vatican City (Saint-Siège)',0,1,0),
(114,'HN','HND','340','Honduras',0,1,0),
(115,'HK','HKG','344','Hong Kong',0,1,0),
(116,'IS','ISL','352','Islande',0,1,0),
(117,'IN','IND','356','India',0,1,0),
(118,'ID','IDN','360','Indonesia',0,1,0),
(119,'IR','IRN','364','Iran',0,1,0),
(120,'IQ','IRQ','368','Iraq',0,1,0),
(121,'IL','ISR','376','Israel',0,1,0),
(122,'JM','JAM','388','Jamaica',0,1,0),
(123,'JP','JPN','392','Japan (Nippon)',0,1,0),
(124,'JO','JOR','400','Jordanie',0,1,0),
(125,'KZ','KAZ','398','Kazakhstan',0,1,0),
(126,'KE','KEN','404','Kenya',0,1,0),
(127,'KI','KIR','296','Kiribati',0,1,0),
(128,'KP','PRK','408','North Corea',0,1,0),
(129,'KR','KOR','410','South Corea',0,1,0),
(130,'KW','KWT','414','Koweït',0,1,0),
(131,'KG','KGZ','417','Kirghizistan',0,1,0),
(132,'LA','LAO','418','Laos',0,1,0),
(133,'LV','LVA','428','Lettonie',1,1,0),
(134,'LB','LBN','422','Liban',0,1,0),
(135,'LS','LSO','426','Lesotho',0,1,0),
(136,'LR','LBR','430','Liberia',0,1,0),
(137,'LY','LBY','434','Libye',0,1,0),
(138,'LI','LIE','438','Liechtenstein',0,1,0),
(139,'LT','LTU','440','Lituanie',1,1,0),
(140,'LU','LUX','442','Luxembourg',1,1,0),
(141,'MO','MAC','446','Macao',0,1,0),
(142,'MK','MKD','807','North Macedonia',0,1,0),
(143,'MG','MDG','450','Madagascar',0,1,0),
(144,'MW','MWI','454','Malawi',0,1,0),
(145,'MY','MYS','458','Malaisie',0,1,0),
(146,'MV','MDV','462','Maldives',0,1,0),
(147,'ML','MLI','466','Mali',0,1,0),
(148,'MT','MLT','470','Malte',1,1,0),
(149,'MH','MHL','584','Iles Marshall',0,1,0),
(151,'MR','MRT','478','Mauritanie',0,1,0),
(152,'MU','MUS','480','Maurice',0,1,0),
(153,'YT','MYT','175','Mayotte',0,1,0),
(154,'MX','MEX','484','Mexique',0,1,0),
(155,'FM','FSM','583','Micronésie',0,1,0),
(156,'MD','MDA','498','Moldavie',0,1,0),
(157,'MN','MNG','496','Mongolie',0,1,0),
(158,'MS','MSR','500','Monserrat',0,1,0),
(159,'MZ','MOZ','508','Mozambique',0,1,0),
(160,'MM','MMR','104','Birmanie (Myanmar)',0,1,0),
(161,'NA','NAM','516','Namibie',0,1,0),
(162,'NR','NRU','520','Nauru',0,1,0),
(163,'NP','NPL','524','Népal',0,1,0),
(165,'NC','NCL','540','New Caledonia',0,1,0),
(166,'NZ','NZL','554','New Zealand',0,1,0),
(167,'NI','NIC','558','Nicaragua',0,1,0),
(168,'NE','NER','562','Niger',0,1,0),
(169,'NG','NGA','566','Nigeria',0,1,0),
(170,'NU','NIU','570','Niue',0,1,0),
(171,'NF','NFK','574','Norfolk Island',0,1,0),
(172,'MP','MNP','580','Northern Mariana Islands',0,1,0),
(173,'NO','NOR','578','Norway',0,1,0),
(174,'OM','OMN','512','Oman',0,1,0),
(175,'PK','PAK','586','Pakistan',0,1,0),
(176,'PW','PLW','585','Palau',0,1,0),
(177,'PS','PSE','275','Palestinian territories',0,1,0),
(178,'PA','PAN','591','Panama',0,1,0),
(179,'PG','PNG','598','Papua New Guinea',0,1,0),
(180,'PY','PRY','600','Paraguay',0,1,0),
(181,'PE','PER','604','Peru',0,1,0),
(182,'PH','PHL','608','Philippines',0,1,0),
(183,'PN','PCN','612','Pitcairn Islands',0,1,0),
(184,'PL','POL','616','Pologne',1,1,0),
(185,'PR','PRI','630','Puerto Rico',0,1,0),
(186,'QA','QAT','634','Qatar',0,1,0),
(188,'RO','ROU','642','Romania',1,1,0),
(189,'RW','RWA','646','Rwanda',0,1,0),
(190,'SH','SHN','654','Saint Helena',0,1,0),
(191,'KN','KNA','659','Saint Kitts and Nevis',0,1,0),
(192,'LC','LCA','662','Saint Lucia',0,1,0),
(193,'PM','SPM','666','Saint Pierre and Miquelon',0,1,0),
(194,'VC','VCT','670','Saint Vincent and the Grenadines',0,1,0),
(195,'WS','WSM','882','Samoa',0,1,0),
(196,'SM','SMR','674','San Marino ',0,1,0),
(197,'ST','STP','678','Saint Thomas and Prince',0,1,0),
(198,'RS','SRB','688','Serbia',0,1,0),
(199,'SC','SYC','690','Seychelles',0,1,0),
(200,'SL','SLE','694','Sierra Leone',0,1,0),
(201,'SK','SVK','703','Slovakia',1,1,0),
(202,'SI','SVN','705','Slovenia',1,1,0),
(203,'SB','SLB','090','Solomon Islands',0,1,0),
(204,'SO','SOM','706','Somalia',0,1,0),
(205,'ZA','ZAF','710','South Africa',0,1,0),
(206,'GS','SGS','239','South Georgia and the South Sandwich Islands ',0,1,0),
(207,'LK','LKA','144','Sri Lanka',0,1,0),
(208,'SD','SDN','729','Sudan',0,1,0),
(209,'SR','SUR','740','Suriname',0,1,0),
(210,'SJ','SJM','744','Svalbard and Jan Mayen',0,1,0),
(211,'SZ','SWZ','748','Swaziland / Eswatini',0,1,0),
(212,'SY','SYR','760','Syria',0,1,0),
(213,'TW','TWN','158','Taiwan',0,1,0),
(214,'TJ','TJK','762','Tajikistan',0,1,0),
(215,'TZ','TZA','834','Tanzania',0,1,0),
(216,'TH','THA','764','Thailand',0,1,0),
(217,'TL','TLS','626','Timor-Leste',0,1,0),
(218,'TK','TKL','772','Tokelau',0,1,0),
(219,'TO','TON','776','Tonga',0,1,0),
(220,'TT','TTO','780','Trinidad and Tobago',0,1,0),
(221,'TR','TUR','792','Turkey',0,1,0),
(222,'TM','TKM','795','Turkmenistan',0,1,0),
(223,'TC','TCA','796','Turks and Caicos Islands',0,1,0),
(224,'TV','TUV','798','Tuvalu',0,1,0),
(225,'UG','UGA','800','Uganda',0,1,0),
(226,'UA','UKR','804','Ukraine',0,1,0),
(227,'AE','ARE','784','United Arab Emirates',0,1,0),
(228,'UM','UMI','581','United States Minor Outlying Islands',0,1,0),
(229,'UY','URY','858','Uruguay',0,1,0),
(230,'UZ','UZB','860','Uzbekistan',0,1,0),
(231,'VU','VUT','548','Vanuatu',0,1,0),
(232,'VE','VEN','862','Venezuela',0,1,0),
(233,'VN','VNM','704','Vietnam',0,1,0),
(234,'VG','VGB','092','British Virgin Islands',0,1,0),
(235,'VI','VIR','850','Virgin Islands of the United States',0,1,0),
(236,'WF','WLF','876','Wallis and Futuna',0,1,0),
(237,'EH','ESH','732','Western Sahara',0,1,0),
(238,'YE','YEM','887','Yemen',0,1,0),
(239,'ZM','ZMB','894','Zambia',0,1,0),
(240,'ZW','ZWE','716','Zimbabwe',0,1,0),
(241,'GG','GGY','831','Guernsey',0,1,0),
(242,'IM','IMN','833','Isle of Man',0,1,0),
(243,'JE','JEY','832','Jersey',0,1,0),
(244,'ME','MNE','499','Montenegro',0,1,0),
(245,'BL','BLM','652','Saint-Barthélemy',0,1,0),
(246,'MF','MAF','663','Saint-Martin',0,1,0),
(247,'XK','XKX',NULL,'Kosovo',0,1,0),
(300,'CW','CUW','531','Curaçao',0,1,0),
(301,'SX','SXM','534','Sint Maarten',0,1,0);
/*!40000 ALTER TABLE `llx_c_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_currencies`
--

DROP TABLE IF EXISTS `llx_c_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(128) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_iso`),
  UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_currencies`
--

LOCK TABLES `llx_c_currencies` WRITE;
/*!40000 ALTER TABLE `llx_c_currencies` DISABLE KEYS */;
INSERT INTO `llx_c_currencies` VALUES
('AED','United Arab Emirates Dirham',NULL,1),
('AFN','Afghanistan Afghani','[1547]',1),
('ALL','Albania Lek','[76,101,107]',1),
('ANG','Netherlands Antilles Guilder','[402]',1),
('AOA','Angola Kwanza',NULL,1),
('ARP','Pesos argentins',NULL,0),
('ARS','Argentino Peso','[36]',1),
('ATS','Shiliing autrichiens',NULL,0),
('AUD','Australia Dollar','[36]',1),
('AWG','Aruba Guilder','[402]',1),
('AZN','Azerbaijan New Manat','[1084,1072,1085]',1),
('BAM','Bosnia and Herzegovina Convertible Marka','[75,77]',1),
('BBD','Barbados Dollar','[36]',1),
('BDT','Bangladeshi Taka','[2547]',1),
('BEF','Francs belges',NULL,0),
('BGN','Bulgaria Lev','[1083,1074]',1),
('BHD','Bahrain',NULL,1),
('BIF','Burundi Franc',NULL,1),
('BMD','Bermuda Dollar','[36]',1),
('BND','Brunei Darussalam Dollar','[36]',1),
('BOB','Bolivia Boliviano','[66,115]',1),
('BRL','Brazil Real','[82,36]',1),
('BSD','Bahamas Dollar','[36]',1),
('BWP','Botswana Pula','[80]',1),
('BYR','Belarus Ruble','[112,46]',1),
('BZD','Belize Dollar','[66,90,36]',1),
('CAD','Canada Dollar','[36]',1),
('CHF','Switzerland Franc','[67,72,70]',1),
('CLP','Chile Peso','[36]',1),
('CNY','China Yuan Renminbi','[165]',1),
('COP','Colombia Peso','[36]',1),
('CRC','Costa Rica Colon','[8353]',1),
('CUP','Cuba Peso','[8369]',1),
('CVE','Cap Verde Escudo','[4217]',1),
('CZK','Czech Republic Koruna','[75,269]',1),
('DEM','Deutsche Mark',NULL,0),
('DKK','Denmark Krone','[107,114]',1),
('DOP','Dominican Republic Peso','[82,68,36]',1),
('DZD','Algeria Dinar',NULL,1),
('ECS','Ecuador Sucre','[83,47,46]',1),
('EEK','Estonia Kroon','[107,114]',1),
('EGP','Egypt Pound','[163]',1),
('ESP','Pesete',NULL,0),
('ETB','Ethiopian Birr',NULL,1),
('EUR','Euro Member Countries','[8364]',1),
('FIM','Mark finlandais',NULL,0),
('FJD','Fiji Dollar','[36]',1),
('FKP','Falkland Islands (Malvinas) Pound','[163]',1),
('FRF','Francs francais',NULL,0),
('GBP','United Kingdom Pound','[163]',1),
('GGP','Guernsey Pound','[163]',1),
('GHC','Ghana Cedis','[162]',1),
('GIP','Gibraltar Pound','[163]',1),
('GNF','Guinea Franc','[70,71]',1),
('GRD','Drachme (grece)',NULL,0),
('GTQ','Guatemala Quetzal','[81]',1),
('GYD','Guyana Dollar','[36]',1),
('HKD','Hong Kong Dollar','[36]',1),
('HNL','Honduras Lempira','[76]',1),
('HRK','Croatia Kuna','[107,110]',1),
('HUF','Hungary Forint','[70,116]',1),
('IDR','Indonesia Rupiah','[82,112]',1),
('IEP','Livres irlandaises',NULL,0),
('ILS','Israel Shekel','[8362]',1),
('IMP','Isle of Man Pound','[163]',1),
('INR','India Rupee','[8377]',1),
('IRR','Iran Rial','[65020]',1),
('ISK','Iceland Krona','[107,114]',1),
('ITL','Lires',NULL,0),
('JEP','Jersey Pound','[163]',1),
('JMD','Jamaica Dollar','[74,36]',1),
('JPY','Japan Yen','[165]',1),
('KES','Kenya Shilling',NULL,1),
('KGS','Kyrgyzstan Som','[1083,1074]',1),
('KHR','Cambodia Riel','[6107]',1),
('KPW','Korea (North) Won','[8361]',1),
('KRW','Korea (South) Won','[8361]',1),
('KYD','Cayman Islands Dollar','[36]',1),
('KZT','Kazakhstan Tenge','[1083,1074]',1),
('LAK','Laos Kip','[8365]',1),
('LBP','Lebanon Pound','[163]',1),
('LKR','Sri Lanka Rupee','[8360]',1),
('LRD','Liberia Dollar','[36]',1),
('LTL','Lithuania Litas','[76,116]',1),
('LUF','Francs luxembourgeois',NULL,0),
('LVL','Latvia Lat','[76,115]',1),
('MAD','Morocco Dirham',NULL,1),
('MDL','Moldova Leu',NULL,1),
('MGA','Ariary',NULL,1),
('MKD','Macedonia Denar','[1076,1077,1085]',1),
('MMK','Myanmar Kyat','[75]',1),
('MNT','Mongolia Tughrik','[8366]',1),
('MRO','Mauritania Ouguiya',NULL,1),
('MUR','Mauritius Rupee','[8360]',1),
('MXN','Mexico Peso','[36]',1),
('MXP','Pesos Mexicans',NULL,0),
('MYR','Malaysia Ringgit','[82,77]',1),
('MZN','Mozambique Metical','[77,84]',1),
('NAD','Namibia Dollar','[36]',1),
('NGN','Nigeria Naira','[8358]',1),
('NIO','Nicaragua Cordoba','[67,36]',1),
('NLG','Florins',NULL,0),
('NOK','Norway Krone','[107,114]',1),
('NPR','Nepal Rupee','[8360]',1),
('NZD','New Zealand Dollar','[36]',1),
('OMR','Oman Rial','[65020]',1),
('PAB','Panama Balboa','[66,47,46]',1),
('PEN','Perú Sol','[83,47]',1),
('PHP','Philippines Peso','[8369]',1),
('PKR','Pakistan Rupee','[8360]',1),
('PLN','Poland Zloty','[122,322]',1),
('PTE','Escudos',NULL,0),
('PYG','Paraguay Guarani','[71,115]',1),
('QAR','Qatar Riyal','[65020]',1),
('RON','Romania New Leu','[108,101,105]',1),
('RSD','Serbia Dinar','[1044,1080,1085,46]',1),
('RUB','Russia Ruble','[1088,1091,1073]',1),
('SAR','Saudi Arabia Riyal','[65020]',1),
('SBD','Solomon Islands Dollar','[36]',1),
('SCR','Seychelles Rupee','[8360]',1),
('SEK','Sweden Krona','[107,114]',1),
('SGD','Singapore Dollar','[36]',1),
('SHP','Saint Helena Pound','[163]',1),
('SKK','Couronnes slovaques',NULL,0),
('SOS','Somalia Shilling','[83]',1),
('SRD','Suriname Dollar','[36]',1),
('SUR','Rouble',NULL,0),
('SVC','El Salvador Colon','[36]',1),
('SYP','Syria Pound','[163]',1),
('THB','Thailand Baht','[3647]',1),
('TND','Tunisia Dinar',NULL,1),
('TRL','Turkey Lira','[84,76]',0),
('TRY','Turkey Lira','[8378]',1),
('TTD','Trinidad and Tobago Dollar','[84,84,36]',1),
('TVD','Tuvalu Dollar','[36]',1),
('TWD','Taiwan New Dollar','[78,84,36]',1),
('UAH','Ukraine Hryvna','[8372]',1),
('USD','United States Dollar','[36]',1),
('UYU','Uruguay Peso','[36,85]',1),
('UZS','Uzbekistan Som','[1083,1074]',1),
('VEF','Venezuela Bolivar Fuerte','[66,115]',1),
('VND','Viet Nam Dong','[8363]',1),
('XAF','Communaute Financiere Africaine (BEAC) CFA Franc',NULL,1),
('XCD','East Caribbean Dollar','[36]',1),
('XEU','Ecus',NULL,0),
('XOF','Communaute Financiere Africaine (BCEAO) Franc',NULL,1),
('XPF','Franc CFP','[70]',1),
('YER','Yemen Rial','[65020]',1),
('ZAR','South Africa Rand','[82]',1),
('ZWD','Zimbabwe Dollar','[90,36]',1);
/*!40000 ALTER TABLE `llx_c_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_departements`
--

DROP TABLE IF EXISTS `llx_c_departements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_departements` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  KEY `idx_departements_fk_region` (`fk_region`),
  CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `llx_c_regions` (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=1819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_departements`
--

LOCK TABLES `llx_c_departements` WRITE;
/*!40000 ALTER TABLE `llx_c_departements` DISABLE KEYS */;
INSERT INTO `llx_c_departements` VALUES
(1,'0',0,'0',0,'-','-',1),
(2,'01',1301,'',0,'','Adrar',1),
(3,'02',1301,'',0,'','Chlef',1),
(4,'03',1301,'',0,'','Laghouat',1),
(5,'04',1301,'',0,'','Oum El Bouaghi',1),
(6,'05',1301,'',0,'','Batna',1),
(7,'06',1301,'',0,'','Béjaïa',1),
(8,'07',1301,'',0,'','Biskra',1),
(9,'08',1301,'',0,'','Béchar',1),
(10,'09',1301,'',0,'','Blida',1),
(11,'10',1301,'',0,'','Bouira',1),
(12,'11',1301,'',0,'','Tamanrasset',1),
(13,'12',1301,'',0,'','Tébessa',1),
(14,'13',1301,'',0,'','Tlemcen',1),
(15,'14',1301,'',0,'','Tiaret',1),
(16,'15',1301,'',0,'','Tizi Ouzou',1),
(17,'16',1301,'',0,'','Alger',1),
(18,'17',1301,'',0,'','Djelfa',1),
(19,'18',1301,'',0,'','Jijel',1),
(20,'19',1301,'',0,'','Sétif',1),
(21,'20',1301,'',0,'','Saïda',1),
(22,'21',1301,'',0,'','Skikda',1),
(23,'22',1301,'',0,'','Sidi Bel Abbès',1),
(24,'23',1301,'',0,'','Annaba',1),
(25,'24',1301,'',0,'','Guelma',1),
(26,'25',1301,'',0,'','Constantine',1),
(27,'26',1301,'',0,'','Médéa',1),
(28,'27',1301,'',0,'','Mostaganem',1),
(29,'28',1301,'',0,'','M\'Sila',1),
(30,'29',1301,'',0,'','Mascara',1),
(31,'30',1301,'',0,'','Ouargla',1),
(32,'31',1301,'',0,'','Oran',1),
(33,'32',1301,'',0,'','El Bayadh',1),
(34,'33',1301,'',0,'','Illizi',1),
(35,'34',1301,'',0,'','Bordj Bou Arreridj',1),
(36,'35',1301,'',0,'','Boumerdès',1),
(37,'36',1301,'',0,'','El Tarf',1),
(38,'37',1301,'',0,'','Tindouf',1),
(39,'38',1301,'',0,'','Tissemsilt',1),
(40,'39',1301,'',0,'','El Oued',1),
(41,'40',1301,'',0,'','Khenchela',1),
(42,'41',1301,'',0,'','Souk Ahras',1),
(43,'42',1301,'',0,'','Tipaza',1),
(44,'43',1301,'',0,'','Mila',1),
(45,'44',1301,'',0,'','Aïn Defla',1),
(46,'45',1301,'',0,'','Naâma',1),
(47,'46',1301,'',0,'','Aïn Témouchent',1),
(48,'47',1301,'',0,'','Ghardaïa',1),
(49,'48',1301,'',0,'','Relizane',1),
(50,'49',1301,'',0,'','Timimoun',1),
(51,'50',1301,'',0,'','Bordj Badji Mokhtar',1),
(52,'51',1301,'',0,'','Ouled Djellal',1),
(53,'52',1301,'',0,'','Béni Abbès',1),
(54,'53',1301,'',0,'','In Salah',1),
(55,'54',1301,'',0,'','In Guezzam',1),
(56,'55',1301,'',0,'','Touggourt',1),
(57,'56',1301,'',0,'','Djanet',1),
(58,'57',1301,'',0,'','El M\'Ghair',1),
(59,'58',1301,'',0,'','El Ménéa',1),
(60,'AD-002',34000,'AD100',NULL,NULL,'Canillo',1),
(61,'AD-003',34000,'AD200',NULL,NULL,'Encamp',1),
(62,'AD-004',34000,'AD400',NULL,NULL,'La Massana',1),
(63,'AD-005',34000,'AD300',NULL,NULL,'Ordino',1),
(64,'AD-006',34000,'AD600',NULL,NULL,'Sant Julià de Lòria',1),
(65,'AD-007',34000,'AD500',NULL,NULL,'Andorra la Vella',1),
(66,'AD-008',34000,'AD700',NULL,NULL,'Escaldes-Engordany',1),
(67,'AO-ABO',35001,NULL,NULL,'BENGO','Bengo',1),
(68,'AO-BGU',35001,NULL,NULL,'BENGUELA','Benguela',1),
(69,'AO-BIE',35001,NULL,NULL,'BIÉ','Bié',1),
(70,'AO-CAB',35001,NULL,NULL,'CABINDA','Cabinda',1),
(71,'AO-CCU',35001,NULL,NULL,'KUANDO KUBANGO','Kuando Kubango',1),
(72,'AO-CNO',35001,NULL,NULL,'KWANZA NORTE','Kwanza Norte',1),
(73,'AO-CUS',35001,NULL,NULL,'KWANZA SUL','Kwanza Sul',1),
(74,'AO-CNN',35001,NULL,NULL,'CUNENE','Cunene',1),
(75,'AO-HUA',35001,NULL,NULL,'HUAMBO','Huambo',1),
(76,'AO-HUI',35001,NULL,NULL,'HUÍLA','Huila',1),
(77,'AO-LUA',35001,NULL,NULL,'LUANDA','Luanda',1),
(78,'AO-LNO',35001,NULL,NULL,'LUNDA-NORTE','Lunda-Norte',1),
(79,'AO-LSU',35001,NULL,NULL,'LUNDA-SUL','Lunda-Sul',1),
(80,'AO-MAL',35001,NULL,NULL,'MALANGE','Malange',1),
(81,'AO-MOX',35001,NULL,NULL,'MOXICO','Moxico',1),
(82,'AO-NAM',35001,NULL,NULL,'NAMÍBE','Namíbe',1),
(83,'AO-UIG',35001,NULL,NULL,'UÍGE','Uíge',1),
(84,'AO-ZAI',35001,NULL,NULL,'ZAÍRE','Zaíre',1),
(85,'2301',2301,'',0,'CATAMARCA','Catamarca',1),
(86,'2302',2301,'',0,'JUJUY','Jujuy',1),
(87,'2303',2301,'',0,'TUCAMAN','Tucamán',1),
(88,'2304',2301,'',0,'SANTIAGO DEL ESTERO','Santiago del Estero',1),
(89,'2305',2301,'',0,'SALTA','Salta',1),
(90,'2306',2302,'',0,'CHACO','Chaco',1),
(91,'2307',2302,'',0,'CORRIENTES','Corrientes',1),
(92,'2308',2302,'',0,'ENTRE RIOS','Entre Ríos',1),
(93,'2309',2302,'',0,'FORMOSA','Formosa',1),
(94,'2310',2302,'',0,'SANTA FE','Santa Fe',1),
(95,'2311',2303,'',0,'LA RIOJA','La Rioja',1),
(96,'2312',2303,'',0,'MENDOZA','Mendoza',1),
(97,'2313',2303,'',0,'SAN JUAN','San Juan',1),
(98,'2314',2303,'',0,'SAN LUIS','San Luis',1),
(99,'2315',2304,'',0,'CORDOBA','Córdoba',1),
(100,'2316',2304,'',0,'BUENOS AIRES','Buenos Aires',1),
(101,'2317',2304,'',0,'CABA','Caba',1),
(102,'2318',2305,'',0,'LA PAMPA','La Pampa',1),
(103,'2319',2305,'',0,'NEUQUEN','Neuquén',1),
(104,'2320',2305,'',0,'RIO NEGRO','Río Negro',1),
(105,'2321',2305,'',0,'CHUBUT','Chubut',1),
(106,'2322',2305,'',0,'SANTA CRUZ','Santa Cruz',1),
(107,'2323',2305,'',0,'TIERRA DEL FUEGO','Tierra del Fuego',1),
(108,'2324',2305,'',0,'ISLAS MALVINAS','Islas Malvinas',1),
(109,'2325',2305,'',0,'ANTARTIDA','Antártida',1),
(110,'2326',2305,'',0,'MISIONES','Misiones',1),
(111,'NSW',2801,'',1,'','New South Wales',1),
(112,'VIC',2801,'',1,'','Victoria',1),
(113,'QLD',2801,'',1,'','Queensland',1),
(114,'SA',2801,'',1,'','South Australia',1),
(115,'ACT',2801,'',1,'','Australia Capital Territory',1),
(116,'TAS',2801,'',1,'','Tasmania',1),
(117,'WA',2801,'',1,'','Western Australia',1),
(118,'NT',2801,'',1,'','Northern Territory',1),
(119,'B',4101,NULL,NULL,'BURGENLAND','Burgenland',1),
(120,'K',4101,NULL,NULL,'KAERNTEN','Kärnten',1),
(121,'N',4101,NULL,NULL,'NIEDEROESTERREICH','Niederösterreich',1),
(122,'O',4101,NULL,NULL,'OBEROESTERREICH','Oberösterreich',1),
(123,'S',4101,NULL,NULL,'SALZBURG','Salzburg',1),
(124,'ST',4101,NULL,NULL,'STEIERMARK','Steiermark',1),
(125,'T',4101,NULL,NULL,'TIROL','Tirol',1),
(126,'V',4101,NULL,NULL,'VORARLBERG','Vorarlberg',1),
(127,'W',4101,NULL,NULL,'WIEN','Wien',1),
(128,'CC',4601,'Oistins',0,'CC','Christ Church',1),
(129,'SA',4601,'Greenland',0,'SA','Saint Andrew',1),
(130,'SG',4601,'Bulkeley',0,'SG','Saint George',1),
(131,'JA',4601,'Holetown',0,'JA','Saint James',1),
(132,'SJ',4601,'Four Roads',0,'SJ','Saint John',1),
(133,'SB',4601,'Bathsheba',0,'SB','Saint Joseph',1),
(134,'SL',4601,'Crab Hill',0,'SL','Saint Lucy',1),
(135,'SM',4601,'Bridgetown',0,'SM','Saint Michael',1),
(136,'SP',4601,'Speightstown',0,'SP','Saint Peter',1),
(137,'SC',4601,'Crane',0,'SC','Saint Philip',1),
(138,'ST',4601,'Hillaby',0,'ST','Saint Thomas',1),
(139,'01',201,'',1,'ANVERS','Anvers',1),
(140,'02',203,'',3,'BRUXELLES-CAPITALE','Bruxelles-Capitale',1),
(141,'03',202,'',2,'BRABANT-WALLON','Brabant-Wallon',1),
(142,'04',201,'',1,'BRABANT-FLAMAND','Brabant-Flamand',1),
(143,'05',201,'',1,'FLANDRE-OCCIDENTALE','Flandre-Occidentale',1),
(144,'06',201,'',1,'FLANDRE-ORIENTALE','Flandre-Orientale',1),
(145,'07',202,'',2,'HAINAUT','Hainaut',1),
(146,'08',202,'',2,'LIEGE','Liège',1),
(147,'09',202,'',1,'LIMBOURG','Limbourg',1),
(148,'10',202,'',2,'LUXEMBOURG','Luxembourg',1),
(149,'11',202,'',2,'NAMUR','Namur',1),
(150,'AC',5601,'ACRE',0,'AC','Acre',1),
(151,'AL',5601,'ALAGOAS',0,'AL','Alagoas',1),
(152,'AP',5601,'AMAPA',0,'AP','Amapá',1),
(153,'AM',5601,'AMAZONAS',0,'AM','Amazonas',1),
(154,'BA',5601,'BAHIA',0,'BA','Bahia',1),
(155,'CE',5601,'CEARA',0,'CE','Ceará',1),
(156,'ES',5601,'ESPIRITO SANTO',0,'ES','Espirito Santo',1),
(157,'GO',5601,'GOIAS',0,'GO','Goiás',1),
(158,'MA',5601,'MARANHAO',0,'MA','Maranhão',1),
(159,'MT',5601,'MATO GROSSO',0,'MT','Mato Grosso',1),
(160,'MS',5601,'MATO GROSSO DO SUL',0,'MS','Mato Grosso do Sul',1),
(161,'MG',5601,'MINAS GERAIS',0,'MG','Minas Gerais',1),
(162,'PA',5601,'PARA',0,'PA','Pará',1),
(163,'PB',5601,'PARAIBA',0,'PB','Paraiba',1),
(164,'PR',5601,'PARANA',0,'PR','Paraná',1),
(165,'PE',5601,'PERNAMBUCO',0,'PE','Pernambuco',1),
(166,'PI',5601,'PIAUI',0,'PI','Piauí',1),
(167,'RJ',5601,'RIO DE JANEIRO',0,'RJ','Rio de Janeiro',1),
(168,'RN',5601,'RIO GRANDE DO NORTE',0,'RN','Rio Grande do Norte',1),
(169,'RS',5601,'RIO GRANDE DO SUL',0,'RS','Rio Grande do Sul',1),
(170,'RO',5601,'RONDONIA',0,'RO','Rondônia',1),
(171,'RR',5601,'RORAIMA',0,'RR','Roraima',1),
(172,'SC',5601,'SANTA CATARINA',0,'SC','Santa Catarina',1),
(173,'SE',5601,'SERGIPE',0,'SE','Sergipe',1),
(174,'SP',5601,'SAO PAULO',0,'SP','Sao Paulo',1),
(175,'TO',5601,'TOCANTINS',0,'TO','Tocantins',1),
(176,'DF',5601,'DISTRITO FEDERAL',0,'DF','Distrito Federal',1),
(177,'ON',1401,'',1,'','Ontario',1),
(178,'QC',1401,'',1,'','Quebec',1),
(179,'NS',1401,'',1,'','Nova Scotia',1),
(180,'NB',1401,'',1,'','New Brunswick',1),
(181,'MB',1401,'',1,'','Manitoba',1),
(182,'BC',1401,'',1,'','British Columbia',1),
(183,'PE',1401,'',1,'','Prince Edward Island',1),
(184,'SK',1401,'',1,'','Saskatchewan',1),
(185,'AB',1401,'',1,'','Alberta',1),
(186,'NL',1401,'',1,'','Newfoundland and Labrador',1),
(187,'011',6701,'',0,'011','Iquique',1),
(188,'014',6701,'',0,'014','Tamarugal',1),
(189,'021',6702,'',0,'021','Antofagasa',1),
(190,'022',6702,'',0,'022','El Loa',1),
(191,'023',6702,'',0,'023','Tocopilla',1),
(192,'031',6703,'',0,'031','Copiapó',1),
(193,'032',6703,'',0,'032','Chañaral',1),
(194,'033',6703,'',0,'033','Huasco',1),
(195,'041',6704,'',0,'041','Elqui',1),
(196,'042',6704,'',0,'042','Choapa',1),
(197,'043',6704,'',0,'043','Limarí',1),
(198,'051',6705,'',0,'051','Valparaíso',1),
(199,'052',6705,'',0,'052','Isla de Pascua',1),
(200,'053',6705,'',0,'053','Los Andes',1),
(201,'054',6705,'',0,'054','Petorca',1),
(202,'055',6705,'',0,'055','Quillota',1),
(203,'056',6705,'',0,'056','San Antonio',1),
(204,'057',6705,'',0,'057','San Felipe de Aconcagua',1),
(205,'058',6705,'',0,'058','Marga Marga',1),
(206,'061',6706,'',0,'061','Cachapoal',1),
(207,'062',6706,'',0,'062','Cardenal Caro',1),
(208,'063',6706,'',0,'063','Colchagua',1),
(209,'071',6707,'',0,'071','Talca',1),
(210,'072',6707,'',0,'072','Cauquenes',1),
(211,'073',6707,'',0,'073','Curicó',1),
(212,'074',6707,'',0,'074','Linares',1),
(213,'081',6708,'',0,'081','Concepción',1),
(214,'082',6708,'',0,'082','Arauco',1),
(215,'083',6708,'',0,'083','Biobío',1),
(216,'084',6708,'',0,'084','Ñuble',1),
(217,'091',6709,'',0,'091','Cautín',1),
(218,'092',6709,'',0,'092','Malleco',1),
(219,'101',6710,'',0,'101','Llanquihue',1),
(220,'102',6710,'',0,'102','Chiloé',1),
(221,'103',6710,'',0,'103','Osorno',1),
(222,'104',6710,'',0,'104','Palena',1),
(223,'111',6711,'',0,'111','Coihaique',1),
(224,'112',6711,'',0,'112','Aisén',1),
(225,'113',6711,'',0,'113','Capitán Prat',1),
(226,'114',6711,'',0,'114','General Carrera',1),
(227,'121',6712,'',0,'121','Magallanes',1),
(228,'122',6712,'',0,'122','Antártica Chilena',1),
(229,'123',6712,'',0,'123','Tierra del Fuego',1),
(230,'124',6712,'',0,'124','Última Esperanza',1),
(231,'131',6713,'',0,'131','Santiago',1),
(232,'132',6713,'',0,'132','Cordillera',1),
(233,'133',6713,'',0,'133','Chacabuco',1),
(234,'134',6713,'',0,'134','Maipo',1),
(235,'135',6713,'',0,'135','Melipilla',1),
(236,'136',6713,'',0,'136','Talagante',1),
(237,'141',6714,'',0,'141','Valdivia',1),
(238,'142',6714,'',0,'142','Ranco',1),
(239,'151',6715,'',0,'151','Arica',1),
(240,'152',6715,'',0,'152','Parinacota',1),
(241,'ANT',7001,'',0,'ANT','Antioquia',1),
(242,'BOL',7001,'',0,'BOL','Bolívar',1),
(243,'BOY',7001,'',0,'BOY','Boyacá',1),
(244,'CAL',7001,'',0,'CAL','Caldas',1),
(245,'CAU',7001,'',0,'CAU','Cauca',1),
(246,'CUN',7001,'',0,'CUN','Cundinamarca',1),
(247,'HUI',7001,'',0,'HUI','Huila',1),
(248,'LAG',7001,'',0,'LAG','La Guajira',1),
(249,'MET',7001,'',0,'MET','Meta',1),
(250,'NAR',7001,'',0,'NAR','Nariño',1),
(251,'NDS',7001,'',0,'NDS','Norte de Santander',1),
(252,'SAN',7001,'',0,'SAN','Santander',1),
(253,'SUC',7001,'',0,'SUC','Sucre',1),
(254,'TOL',7001,'',0,'TOL','Tolima',1),
(255,'VAC',7001,'',0,'VAC','Valle del Cauca',1),
(256,'RIS',7001,'',0,'RIS','Risalda',1),
(257,'ATL',7001,'',0,'ATL','Atlántico',1),
(258,'COR',7001,'',0,'COR','Córdoba',1),
(259,'SAP',7001,'',0,'SAP','San Andrés, Providencia y Santa Catalina',1),
(260,'ARA',7001,'',0,'ARA','Arauca',1),
(261,'CAS',7001,'',0,'CAS','Casanare',1),
(262,'AMA',7001,'',0,'AMA','Amazonas',1),
(263,'CAQ',7001,'',0,'CAQ','Caquetá',1),
(264,'CHO',7001,'',0,'CHO','Chocó',1),
(265,'GUA',7001,'',0,'GUA','Guainía',1),
(266,'GUV',7001,'',0,'GUV','Guaviare',1),
(267,'PUT',7001,'',0,'PUT','Putumayo',1),
(268,'QUI',7001,'',0,'QUI','Quindío',1),
(269,'VAU',7001,'',0,'VAU','Vaupés',1),
(270,'BOG',7001,'',0,'BOG','Bogotá',1),
(271,'VID',7001,'',0,'VID','Vichada',1),
(272,'CES',7001,'',0,'CES','Cesar',1),
(273,'MAG',7001,'',0,'MAG','Magdalena',1),
(274,'HR-01',7601,'Bjelovar',0,NULL,'Bjelovarsko-bilogorska županija',1),
(275,'HR-02',7601,'Karlovac',0,NULL,'Karlovačka županija',1),
(276,'HR-03',7601,'Koprivnica',0,NULL,'Koprivničko-križevačka županija',1),
(277,'HR-04',7601,'Krapina',0,NULL,'Krapinsko-zagorska županija',1),
(278,'HR-05',7601,'Gospić',0,NULL,'Ličko-senjska županija',1),
(279,'HR-06',7601,'Čakovec',0,NULL,'Međimurska županija',1),
(280,'HR-07',7601,'Rijeka',0,NULL,'Primorsko-goranska županija',1),
(281,'HR-08',7601,'Sisak',0,NULL,'Sisačko-moslavačka županija',1),
(282,'HR-09',7601,'Varaždin',0,NULL,'Varaždinska županija',1),
(283,'HR-10',7601,'Zagreb',0,NULL,'Zagrebačka županija',1),
(284,'HR-11',7601,'Zagreb',0,NULL,'Grad Zagreb',1),
(285,'HR-12',7602,'Zadar',0,NULL,'Zadarska županija',1),
(286,'HR-13',7602,'Šibenik',0,NULL,'Šibensko-kninska županija',1),
(287,'HR-14',7602,'Split',0,NULL,'Splitsko-dalmatinska županija',1),
(288,'HR-15',7602,'Dubrovnik',0,NULL,'Dubrovačko-neretvanska županija',1),
(289,'HR-16',7603,'Slavonski Brod',0,NULL,'Brodsko-posavska županija',1),
(290,'HR-17',7603,'Osijek',0,NULL,'Osječko-baranjska županija',1),
(291,'HR-18',7603,'Požega',0,NULL,'Požeško-slavonska županija',1),
(292,'HR-19',7603,'Virovitica',0,NULL,'Virovitičko-podravska županija',1),
(293,'HR-20',7603,'Vukovar',0,NULL,'Vukovarsko-srijemska županija',1),
(294,'HR-21',7604,'Pazin',0,NULL,'Istarska županija',1),
(295,'971',1,'97105',3,'GUADELOUPE','Guadeloupe',1),
(296,'972',2,'97209',3,'MARTINIQUE','Martinique',1),
(297,'973',3,'97302',3,'GUYANE','Guyane',1),
(298,'974',4,'97411',3,'REUNION','Réunion',1),
(299,'976',6,'97601',3,'MAYOTTE','Mayotte',1),
(300,'01',84,'01053',5,'AIN','Ain',1),
(301,'02',32,'02408',5,'AISNE','Aisne',1),
(302,'03',84,'03190',5,'ALLIER','Allier',1),
(303,'04',93,'04070',4,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence',1),
(304,'05',93,'05061',4,'HAUTES-ALPES','Hautes-Alpes',1),
(305,'06',93,'06088',4,'ALPES-MARITIMES','Alpes-Maritimes',1),
(306,'07',84,'07186',5,'ARDECHE','Ardèche',1),
(307,'08',44,'08105',4,'ARDENNES','Ardennes',1),
(308,'09',76,'09122',5,'ARIEGE','Ariège',1),
(309,'10',44,'10387',5,'AUBE','Aube',1),
(310,'11',76,'11069',5,'AUDE','Aude',1),
(311,'12',76,'12202',5,'AVEYRON','Aveyron',1),
(312,'13',93,'13055',4,'BOUCHES-DU-RHONE','Bouches-du-Rhône',1),
(313,'14',28,'14118',2,'CALVADOS','Calvados',1),
(314,'15',84,'15014',2,'CANTAL','Cantal',1),
(315,'16',75,'16015',3,'CHARENTE','Charente',1),
(316,'17',75,'17300',3,'CHARENTE-MARITIME','Charente-Maritime',1),
(317,'18',24,'18033',2,'CHER','Cher',1),
(318,'19',75,'19272',3,'CORREZE','Corrèze',1),
(319,'2A',94,'2A004',3,'CORSE-DU-SUD','Corse-du-Sud',1),
(320,'2B',94,'2B033',3,'HAUTE-CORSE','Haute-Corse',1),
(321,'21',27,'21231',3,'COTE-D OR','Côte-d Or',1),
(322,'22',53,'22278',4,'COTES-D ARMOR','Côtes-d Armor',1),
(323,'23',75,'23096',3,'CREUSE','Creuse',1),
(324,'24',75,'24322',3,'DORDOGNE','Dordogne',1),
(325,'25',27,'25056',2,'DOUBS','Doubs',1),
(326,'26',84,'26362',3,'DROME','Drôme',1),
(327,'27',28,'27229',5,'EURE','Eure',1),
(328,'28',24,'28085',1,'EURE-ET-LOIR','Eure-et-Loir',1),
(329,'29',53,'29232',2,'FINISTERE','Finistère',1),
(330,'30',76,'30189',2,'GARD','Gard',1),
(331,'31',76,'31555',3,'HAUTE-GARONNE','Haute-Garonne',1),
(332,'32',76,'32013',2,'GERS','Gers',1),
(333,'33',75,'33063',3,'GIRONDE','Gironde',1),
(334,'34',76,'34172',5,'HERAULT','Hérault',1),
(335,'35',53,'35238',1,'ILLE-ET-VILAINE','Ille-et-Vilaine',1),
(336,'36',24,'36044',5,'INDRE','Indre',1),
(337,'37',24,'37261',1,'INDRE-ET-LOIRE','Indre-et-Loire',1),
(338,'38',84,'38185',5,'ISERE','Isère',1),
(339,'39',27,'39300',2,'JURA','Jura',1),
(340,'40',75,'40192',4,'LANDES','Landes',1),
(341,'41',24,'41018',0,'LOIR-ET-CHER','Loir-et-Cher',1),
(342,'42',84,'42218',3,'LOIRE','Loire',1),
(343,'43',84,'43157',3,'HAUTE-LOIRE','Haute-Loire',1),
(344,'44',52,'44109',3,'LOIRE-ATLANTIQUE','Loire-Atlantique',1),
(345,'45',24,'45234',2,'LOIRET','Loiret',1),
(346,'46',76,'46042',2,'LOT','Lot',1),
(347,'47',75,'47001',0,'LOT-ET-GARONNE','Lot-et-Garonne',1),
(348,'48',76,'48095',3,'LOZERE','Lozère',1),
(349,'49',52,'49007',0,'MAINE-ET-LOIRE','Maine-et-Loire',1),
(350,'50',28,'50502',3,'MANCHE','Manche',1),
(351,'51',44,'51108',3,'MARNE','Marne',1),
(352,'52',44,'52121',3,'HAUTE-MARNE','Haute-Marne',1),
(353,'53',52,'53130',3,'MAYENNE','Mayenne',1),
(354,'54',44,'54395',0,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle',1),
(355,'55',44,'55029',3,'MEUSE','Meuse',1),
(356,'56',53,'56260',2,'MORBIHAN','Morbihan',1),
(357,'57',44,'57463',3,'MOSELLE','Moselle',1),
(358,'58',27,'58194',3,'NIEVRE','Nièvre',1),
(359,'59',32,'59350',2,'NORD','Nord',1),
(360,'60',32,'60057',5,'OISE','Oise',1),
(361,'61',28,'61001',5,'ORNE','Orne',1),
(362,'62',32,'62041',2,'PAS-DE-CALAIS','Pas-de-Calais',1),
(363,'63',84,'63113',2,'PUY-DE-DOME','Puy-de-Dôme',1),
(364,'64',75,'64445',4,'PYRENEES-ATLANTIQUES','Pyrénées-Atlantiques',1),
(365,'65',76,'65440',4,'HAUTES-PYRENEES','Hautes-Pyrénées',1),
(366,'66',76,'66136',4,'PYRENEES-ORIENTALES','Pyrénées-Orientales',1),
(367,'67',44,'67482',2,'BAS-RHIN','Bas-Rhin',1),
(368,'68',44,'68066',2,'HAUT-RHIN','Haut-Rhin',1),
(369,'69',84,'69123',2,'RHONE','Rhône',1),
(370,'70',27,'70550',3,'HAUTE-SAONE','Haute-Saône',1),
(371,'71',27,'71270',0,'SAONE-ET-LOIRE','Saône-et-Loire',1),
(372,'72',52,'72181',3,'SARTHE','Sarthe',1),
(373,'73',84,'73065',3,'SAVOIE','Savoie',1),
(374,'74',84,'74010',3,'HAUTE-SAVOIE','Haute-Savoie',1),
(375,'75',11,'75056',0,'PARIS','Paris',1),
(376,'76',28,'76540',3,'SEINE-MARITIME','Seine-Maritime',1),
(377,'77',11,'77288',0,'SEINE-ET-MARNE','Seine-et-Marne',1),
(378,'78',11,'78646',4,'YVELINES','Yvelines',1),
(379,'79',75,'79191',4,'DEUX-SEVRES','Deux-Sèvres',1),
(380,'80',32,'80021',3,'SOMME','Somme',1),
(381,'81',76,'81004',2,'TARN','Tarn',1),
(382,'82',76,'82121',0,'TARN-ET-GARONNE','Tarn-et-Garonne',1),
(383,'83',93,'83137',2,'VAR','Var',1),
(384,'84',93,'84007',0,'VAUCLUSE','Vaucluse',1),
(385,'85',52,'85191',3,'VENDEE','Vendée',1),
(386,'86',75,'86194',3,'VIENNE','Vienne',1),
(387,'87',75,'87085',3,'HAUTE-VIENNE','Haute-Vienne',1),
(388,'88',44,'88160',4,'VOSGES','Vosges',1),
(389,'89',27,'89024',5,'YONNE','Yonne',1),
(390,'90',27,'90010',0,'TERRITOIRE DE BELFORT','Territoire de Belfort',1),
(391,'91',11,'91228',5,'ESSONNE','Essonne',1),
(392,'92',11,'92050',4,'HAUTS-DE-SEINE','Hauts-de-Seine',1),
(393,'93',11,'93008',3,'SEINE-SAINT-DENIS','Seine-Saint-Denis',1),
(394,'94',11,'94028',2,'VAL-DE-MARNE','Val-de-Marne',1),
(395,'95',11,'95500',2,'VAL-D OISE','Val-d Oise',1),
(396,'BW',501,NULL,NULL,'BADEN-WÜRTTEMBERG','Baden-Württemberg',1),
(397,'BY',501,NULL,NULL,'BAYERN','Bayern',1),
(398,'BE',501,NULL,NULL,'BERLIN','Berlin',1),
(399,'BB',501,NULL,NULL,'BRANDENBURG','Brandenburg',1),
(400,'HB',501,NULL,NULL,'BREMEN','Bremen',1),
(401,'HH',501,NULL,NULL,'HAMBURG','Hamburg',1),
(402,'HE',501,NULL,NULL,'HESSEN','Hessen',1),
(403,'MV',501,NULL,NULL,'MECKLENBURG-VORPOMMERN','Mecklenburg-Vorpommern',1),
(404,'NI',501,NULL,NULL,'NIEDERSACHSEN','Niedersachsen',1),
(405,'NW',501,NULL,NULL,'NORDRHEIN-WESTFALEN','Nordrhein-Westfalen',1),
(406,'RP',501,NULL,NULL,'RHEINLAND-PFALZ','Rheinland-Pfalz',1),
(407,'SL',501,NULL,NULL,'SAARLAND','Saarland',1),
(408,'SN',501,NULL,NULL,'SACHSEN','Sachsen',1),
(409,'ST',501,NULL,NULL,'SACHSEN-ANHALT','Sachsen-Anhalt',1),
(410,'SH',501,NULL,NULL,'SCHLESWIG-HOLSTEIN','Schleswig-Holstein',1),
(411,'TH',501,NULL,NULL,'THÜRINGEN','Thüringen',1),
(412,'66',10201,'',0,'','Αθήνα',1),
(413,'67',10205,'',0,'','Δράμα',1),
(414,'01',10205,'',0,'','Έβρος',1),
(415,'02',10205,'',0,'','Θάσος',1),
(416,'03',10205,'',0,'','Καβάλα',1),
(417,'04',10205,'',0,'','Ξάνθη',1),
(418,'05',10205,'',0,'','Ροδόπη',1),
(419,'06',10203,'',0,'','Ημαθία',1),
(420,'07',10203,'',0,'','Θεσσαλονίκη',1),
(421,'08',10203,'',0,'','Κιλκίς',1),
(422,'09',10203,'',0,'','Πέλλα',1),
(423,'10',10203,'',0,'','Πιερία',1),
(424,'11',10203,'',0,'','Σέρρες',1),
(425,'12',10203,'',0,'','Χαλκιδική',1),
(426,'13',10206,'',0,'','Άρτα',1),
(427,'14',10206,'',0,'','Θεσπρωτία',1),
(428,'15',10206,'',0,'','Ιωάννινα',1),
(429,'16',10206,'',0,'','Πρέβεζα',1),
(430,'17',10213,'',0,'','Γρεβενά',1),
(431,'18',10213,'',0,'','Καστοριά',1),
(432,'19',10213,'',0,'','Κοζάνη',1),
(433,'20',10213,'',0,'','Φλώρινα',1),
(434,'21',10212,'',0,'','Καρδίτσα',1),
(435,'22',10212,'',0,'','Λάρισα',1),
(436,'23',10212,'',0,'','Μαγνησία',1),
(437,'24',10212,'',0,'','Τρίκαλα',1),
(438,'25',10212,'',0,'','Σποράδες',1),
(439,'26',10212,'',0,'','Βοιωτία',1),
(440,'27',10202,'',0,'','Εύβοια',1),
(441,'28',10202,'',0,'','Ευρυτανία',1),
(442,'29',10202,'',0,'','Φθιώτιδα',1),
(443,'30',10202,'',0,'','Φωκίδα',1),
(444,'31',10209,'',0,'','Αργολίδα',1),
(445,'32',10209,'',0,'','Αρκαδία',1),
(446,'33',10209,'',0,'','Κορινθία',1),
(447,'34',10209,'',0,'','Λακωνία',1),
(448,'35',10209,'',0,'','Μεσσηνία',1),
(449,'36',10211,'',0,'','Αιτωλοακαρνανία',1),
(450,'37',10211,'',0,'','Αχαΐα',1),
(451,'38',10211,'',0,'','Ηλεία',1),
(452,'39',10207,'',0,'','Ζάκυνθος',1),
(453,'40',10207,'',0,'','Κέρκυρα',1),
(454,'41',10207,'',0,'','Κεφαλληνία',1),
(455,'42',10207,'',0,'','Ιθάκη',1),
(456,'43',10207,'',0,'','Λευκάδα',1),
(457,'44',10208,'',0,'','Ικαρία',1),
(458,'45',10208,'',0,'','Λέσβος',1),
(459,'46',10208,'',0,'','Λήμνος',1),
(460,'47',10208,'',0,'','Σάμος',1),
(461,'48',10208,'',0,'','Χίος',1),
(462,'49',10210,'',0,'','Άνδρος',1),
(463,'50',10210,'',0,'','Θήρα',1),
(464,'51',10210,'',0,'','Κάλυμνος',1),
(465,'52',10210,'',0,'','Κάρπαθος',1),
(466,'53',10210,'',0,'','Κέα-Κύθνος',1),
(467,'54',10210,'',0,'','Κω',1),
(468,'55',10210,'',0,'','Μήλος',1),
(469,'56',10210,'',0,'','Μύκονος',1),
(470,'57',10210,'',0,'','Νάξος',1),
(471,'58',10210,'',0,'','Πάρος',1),
(472,'59',10210,'',0,'','Ρόδος',1),
(473,'60',10210,'',0,'','Σύρος',1),
(474,'61',10210,'',0,'','Τήνος',1),
(475,'62',10204,'',0,'','Ηράκλειο',1),
(476,'63',10204,'',0,'','Λασίθι',1),
(477,'64',10204,'',0,'','Ρέθυμνο',1),
(478,'65',10204,'',0,'','Χανιά',1),
(479,'AT',11401,'',0,'AT','Atlántida',1),
(480,'CH',11401,'',0,'CH','Choluteca',1),
(481,'CL',11401,'',0,'CL','Colón',1),
(482,'CM',11401,'',0,'CM','Comayagua',1),
(483,'CO',11401,'',0,'CO','Copán',1),
(484,'CR',11401,'',0,'CR','Cortés',1),
(485,'EP',11401,'',0,'EP','El Paraíso',1),
(486,'FM',11401,'',0,'FM','Francisco Morazán',1),
(487,'GD',11401,'',0,'GD','Gracias a Dios',1),
(488,'IN',11401,'',0,'IN','Intibucá',1),
(489,'IB',11401,'',0,'IB','Islas de la Bahía',1),
(490,'LP',11401,'',0,'LP','La Paz',1),
(491,'LM',11401,'',0,'LM','Lempira',1),
(492,'OC',11401,'',0,'OC','Ocotepeque',1),
(493,'OL',11401,'',0,'OL','Olancho',1),
(494,'SB',11401,'',0,'SB','Santa Bárbara',1),
(495,'VL',11401,'',0,'VL','Valle',1),
(496,'YO',11401,'',0,'YO','Yoro',1),
(497,'DC',11401,'',0,'DC','Distrito Central',1),
(498,'HU-BU',180100,'HU101',NULL,NULL,'Budapest',1),
(499,'HU-PE',180100,'HU102',NULL,NULL,'Pest',1),
(500,'HU-FE',182100,'HU211',NULL,NULL,'Fejér',1),
(501,'HU-KE',182100,'HU212',NULL,NULL,'Komárom-Esztergom',1),
(502,'HU-VE',182100,'HU213',NULL,NULL,'Veszprém',1),
(503,'HU-GS',182200,'HU221',NULL,NULL,'Győr-Moson-Sopron',1),
(504,'HU-VA',182200,'HU222',NULL,NULL,'Vas',1),
(505,'HU-ZA',182200,'HU223',NULL,NULL,'Zala',1),
(506,'HU-BA',182300,'HU231',NULL,NULL,'Baranya',1),
(507,'HU-SO',182300,'HU232',NULL,NULL,'Somogy',1),
(508,'HU-TO',182300,'HU233',NULL,NULL,'Tolna',1),
(509,'HU-BZ',183100,'HU311',NULL,NULL,'Borsod-Abaúj-Zemplén',1),
(510,'HU-HE',183100,'HU312',NULL,NULL,'Heves',1),
(511,'HU-NO',183100,'HU313',NULL,NULL,'Nógrád',1),
(512,'HU-HB',183200,'HU321',NULL,NULL,'Hajdú-Bihar',1),
(513,'HU-JN',183200,'HU322',NULL,NULL,'Jász-Nagykun-Szolnok',1),
(514,'HU-SZ',183200,'HU323',NULL,NULL,'Szabolcs-Szatmár-Bereg',1),
(515,'HU-BK',183300,'HU331',NULL,NULL,'Bács-Kiskun',1),
(516,'HU-BE',183300,'HU332',NULL,NULL,'Békés',1),
(517,'HU-CS',183300,'HU333',NULL,NULL,'Csongrád',1),
(518,'AG',315,NULL,NULL,NULL,'AGRIGENTO',1),
(519,'AL',312,NULL,NULL,NULL,'ALESSANDRIA',1),
(520,'AN',310,NULL,NULL,NULL,'ANCONA',1),
(521,'AO',319,NULL,NULL,NULL,'AOSTA',1),
(522,'AR',316,NULL,NULL,NULL,'AREZZO',1),
(523,'AP',310,NULL,NULL,NULL,'ASCOLI PICENO',1),
(524,'AT',312,NULL,NULL,NULL,'ASTI',1),
(525,'AV',304,NULL,NULL,NULL,'AVELLINO',1),
(526,'BA',313,NULL,NULL,NULL,'BARI',1),
(527,'BT',313,NULL,NULL,NULL,'BARLETTA-ANDRIA-TRANI',1),
(528,'BL',320,NULL,NULL,NULL,'BELLUNO',1),
(529,'BN',304,NULL,NULL,NULL,'BENEVENTO',1),
(530,'BG',309,NULL,NULL,NULL,'BERGAMO',1),
(531,'BI',312,NULL,NULL,NULL,'BIELLA',1),
(532,'BO',305,NULL,NULL,NULL,'BOLOGNA',1),
(533,'BZ',317,NULL,NULL,NULL,'BOLZANO',1),
(534,'BS',309,NULL,NULL,NULL,'BRESCIA',1),
(535,'BR',313,NULL,NULL,NULL,'BRINDISI',1),
(536,'CA',314,NULL,NULL,NULL,'CAGLIARI',1),
(537,'CL',315,NULL,NULL,NULL,'CALTANISSETTA',1),
(538,'CB',311,NULL,NULL,NULL,'CAMPOBASSO',1),
(539,'CI',314,NULL,NULL,NULL,'CARBONIA-IGLESIAS',1),
(540,'CE',304,NULL,NULL,NULL,'CASERTA',1),
(541,'CT',315,NULL,NULL,NULL,'CATANIA',1),
(542,'CZ',303,NULL,NULL,NULL,'CATANZARO',1),
(543,'CH',301,NULL,NULL,NULL,'CHIETI',1),
(544,'CO',309,NULL,NULL,NULL,'COMO',1),
(545,'CS',303,NULL,NULL,NULL,'COSENZA',1),
(546,'CR',309,NULL,NULL,NULL,'CREMONA',1),
(547,'KR',303,NULL,NULL,NULL,'CROTONE',1),
(548,'CN',312,NULL,NULL,NULL,'CUNEO',1),
(549,'EN',315,NULL,NULL,NULL,'ENNA',1),
(550,'FM',310,NULL,NULL,NULL,'FERMO',1),
(551,'FE',305,NULL,NULL,NULL,'FERRARA',1),
(552,'FI',316,NULL,NULL,NULL,'FIRENZE',1),
(553,'FG',313,NULL,NULL,NULL,'FOGGIA',1),
(554,'FC',305,NULL,NULL,NULL,'FORLI-CESENA',1),
(555,'FR',307,NULL,NULL,NULL,'FROSINONE',1),
(556,'GE',308,NULL,NULL,NULL,'GENOVA',1),
(557,'GO',306,NULL,NULL,NULL,'GORIZIA',1),
(558,'GR',316,NULL,NULL,NULL,'GROSSETO',1),
(559,'IM',308,NULL,NULL,NULL,'IMPERIA',1),
(560,'IS',311,NULL,NULL,NULL,'ISERNIA',1),
(561,'SP',308,NULL,NULL,NULL,'LA SPEZIA',1),
(562,'AQ',301,NULL,NULL,NULL,'L AQUILA',1),
(563,'LT',307,NULL,NULL,NULL,'LATINA',1),
(564,'LE',313,NULL,NULL,NULL,'LECCE',1),
(565,'LC',309,NULL,NULL,NULL,'LECCO',1),
(566,'LI',316,NULL,NULL,NULL,'LIVORNO',1),
(567,'LO',309,NULL,NULL,NULL,'LODI',1),
(568,'LU',316,NULL,NULL,NULL,'LUCCA',1),
(569,'MC',310,NULL,NULL,NULL,'MACERATA',1),
(570,'MN',309,NULL,NULL,NULL,'MANTOVA',1),
(571,'MS',316,NULL,NULL,NULL,'MASSA-CARRARA',1),
(572,'MT',302,NULL,NULL,NULL,'MATERA',1),
(573,'VS',314,NULL,NULL,NULL,'MEDIO CAMPIDANO',1),
(574,'ME',315,NULL,NULL,NULL,'MESSINA',1),
(575,'MI',309,NULL,NULL,NULL,'MILANO',1),
(576,'MB',309,NULL,NULL,NULL,'MONZA e BRIANZA',1),
(577,'MO',305,NULL,NULL,NULL,'MODENA',1),
(578,'NA',304,NULL,NULL,NULL,'NAPOLI',1),
(579,'NO',312,NULL,NULL,NULL,'NOVARA',1),
(580,'NU',314,NULL,NULL,NULL,'NUORO',1),
(581,'OG',314,NULL,NULL,NULL,'OGLIASTRA',1),
(582,'OT',314,NULL,NULL,NULL,'OLBIA-TEMPIO',1),
(583,'OR',314,NULL,NULL,NULL,'ORISTANO',1),
(584,'PD',320,NULL,NULL,NULL,'PADOVA',1),
(585,'PA',315,NULL,NULL,NULL,'PALERMO',1),
(586,'PR',305,NULL,NULL,NULL,'PARMA',1),
(587,'PV',309,NULL,NULL,NULL,'PAVIA',1),
(588,'PG',318,NULL,NULL,NULL,'PERUGIA',1),
(589,'PU',310,NULL,NULL,NULL,'PESARO e URBINO',1),
(590,'PE',301,NULL,NULL,NULL,'PESCARA',1),
(591,'PC',305,NULL,NULL,NULL,'PIACENZA',1),
(592,'PI',316,NULL,NULL,NULL,'PISA',1),
(593,'PT',316,NULL,NULL,NULL,'PISTOIA',1),
(594,'PN',306,NULL,NULL,NULL,'PORDENONE',1),
(595,'PZ',302,NULL,NULL,NULL,'POTENZA',1),
(596,'PO',316,NULL,NULL,NULL,'PRATO',1),
(597,'RG',315,NULL,NULL,NULL,'RAGUSA',1),
(598,'RA',305,NULL,NULL,NULL,'RAVENNA',1),
(599,'RC',303,NULL,NULL,NULL,'REGGIO CALABRIA',1),
(600,'RE',305,NULL,NULL,NULL,'REGGIO NELL EMILIA',1),
(601,'RI',307,NULL,NULL,NULL,'RIETI',1),
(602,'RN',305,NULL,NULL,NULL,'RIMINI',1),
(603,'RM',307,NULL,NULL,NULL,'ROMA',1),
(604,'RO',320,NULL,NULL,NULL,'ROVIGO',1),
(605,'SA',304,NULL,NULL,NULL,'SALERNO',1),
(606,'SS',314,NULL,NULL,NULL,'SASSARI',1),
(607,'SV',308,NULL,NULL,NULL,'SAVONA',1),
(608,'SI',316,NULL,NULL,NULL,'SIENA',1),
(609,'SR',315,NULL,NULL,NULL,'SIRACUSA',1),
(610,'SO',309,NULL,NULL,NULL,'SONDRIO',1),
(611,'TA',313,NULL,NULL,NULL,'TARANTO',1),
(612,'TE',301,NULL,NULL,NULL,'TERAMO',1),
(613,'TR',318,NULL,NULL,NULL,'TERNI',1),
(614,'TO',312,NULL,NULL,NULL,'TORINO',1),
(615,'TP',315,NULL,NULL,NULL,'TRAPANI',1),
(616,'TN',317,NULL,NULL,NULL,'TRENTO',1),
(617,'TV',320,NULL,NULL,NULL,'TREVISO',1),
(618,'TS',306,NULL,NULL,NULL,'TRIESTE',1),
(619,'UD',306,NULL,NULL,NULL,'UDINE',1),
(620,'VA',309,NULL,NULL,NULL,'VARESE',1),
(621,'VE',320,NULL,NULL,NULL,'VENEZIA',1),
(622,'VB',312,NULL,NULL,NULL,'VERBANO-CUSIO-OSSOLA',1),
(623,'VC',312,NULL,NULL,NULL,'VERCELLI',1),
(624,'VR',320,NULL,NULL,NULL,'VERONA',1),
(625,'VV',303,NULL,NULL,NULL,'VIBO VALENTIA',1),
(626,'VI',320,NULL,NULL,NULL,'VICENZA',1),
(627,'VT',307,NULL,NULL,NULL,'VITERBO',1),
(628,'LU0001',14001,'',0,'','Clervaux',1),
(629,'LU0002',14001,'',0,'','Diekirch',1),
(630,'LU0003',14001,'',0,'','Redange',1),
(631,'LU0004',14001,'',0,'','Vianden',1),
(632,'LU0005',14001,'',0,'','Wiltz',1),
(633,'LU0006',14002,'',0,'','Echternach',1),
(634,'LU0007',14002,'',0,'','Grevenmacher',1),
(635,'LU0008',14002,'',0,'','Remich',1),
(636,'LU0009',14003,'',0,'','Capellen',1),
(637,'LU0010',14003,'',0,'','Esch-sur-Alzette',1),
(638,'LU0011',14003,'',0,'','Luxembourg',1),
(639,'LU0012',14003,'',0,'','Mersch',1),
(640,'MA',1209,'',0,'','Province de Benslimane',1),
(641,'MA1',1209,'',0,'','Province de Berrechid',1),
(642,'MA2',1209,'',0,'','Province de Khouribga',1),
(643,'MA3',1209,'',0,'','Province de Settat',1),
(644,'MA4',1210,'',0,'','Province d\'El Jadida',1),
(645,'MA5',1210,'',0,'','Province de Safi',1),
(646,'MA6',1210,'',0,'','Province de Sidi Bennour',1),
(647,'MA7',1210,'',0,'','Province de Youssoufia',1),
(648,'MA6B',1205,'',0,'','Préfecture de Fès',1),
(649,'MA7B',1205,'',0,'','Province de Boulemane',1),
(650,'MA8',1205,'',0,'','Province de Moulay Yacoub',1),
(651,'MA9',1205,'',0,'','Province de Sefrou',1),
(652,'MA8A',1202,'',0,'','Province de Kénitra',1),
(653,'MA9A',1202,'',0,'','Province de Sidi Kacem',1),
(654,'MA10',1202,'',0,'','Province de Sidi Slimane',1),
(655,'MA11',1208,'',0,'','Préfecture de Casablanca',1),
(656,'MA12',1208,'',0,'','Préfecture de Mohammédia',1),
(657,'MA13',1208,'',0,'','Province de Médiouna',1),
(658,'MA14',1208,'',0,'','Province de Nouaceur',1),
(659,'MA15',1214,'',0,'','Province d\'Assa-Zag',1),
(660,'MA16',1214,'',0,'','Province d\'Es-Semara',1),
(661,'MA17A',1214,'',0,'','Province de Guelmim',1),
(662,'MA18',1214,'',0,'','Province de Tata',1),
(663,'MA19',1214,'',0,'','Province de Tan-Tan',1),
(664,'MA15',1215,'',0,'','Province de Boujdour',1),
(665,'MA16',1215,'',0,'','Province de Lâayoune',1),
(666,'MA17',1215,'',0,'','Province de Tarfaya',1),
(667,'MA18',1211,'',0,'','Préfecture de Marrakech',1),
(668,'MA19',1211,'',0,'','Province d\'Al Haouz',1),
(669,'MA20',1211,'',0,'','Province de Chichaoua',1),
(670,'MA21',1211,'',0,'','Province d\'El Kelâa des Sraghna',1),
(671,'MA22',1211,'',0,'','Province d\'Essaouira',1),
(672,'MA23',1211,'',0,'','Province de Rehamna',1),
(673,'MA24',1206,'',0,'','Préfecture de Meknès',1),
(674,'MA25',1206,'',0,'','Province d’El Hajeb',1),
(675,'MA26',1206,'',0,'','Province d\'Errachidia',1),
(676,'MA27',1206,'',0,'','Province d’Ifrane',1),
(677,'MA28',1206,'',0,'','Province de Khénifra',1),
(678,'MA29',1206,'',0,'','Province de Midelt',1),
(679,'MA30',1204,'',0,'','Préfecture d\'Oujda-Angad',1),
(680,'MA31',1204,'',0,'','Province de Berkane',1),
(681,'MA32',1204,'',0,'','Province de Driouch',1),
(682,'MA33',1204,'',0,'','Province de Figuig',1),
(683,'MA34',1204,'',0,'','Province de Jerada',1),
(684,'MA35',1204,'',0,'','Province de Nador',1),
(685,'MA36',1204,'',0,'','Province de Taourirt',1),
(686,'MA37',1216,'',0,'','Province d\'Aousserd',1),
(687,'MA38',1216,'',0,'','Province d\'Oued Ed-Dahab',1),
(688,'MA39',1207,'',0,'','Préfecture de Rabat',1),
(689,'MA40',1207,'',0,'','Préfecture de Skhirat-Témara',1),
(690,'MA41',1207,'',0,'','Préfecture de Salé',1),
(691,'MA42',1207,'',0,'','Province de Khémisset',1),
(692,'MA43',1213,'',0,'','Préfecture d\'Agadir Ida-Outanane',1),
(693,'MA44',1213,'',0,'','Préfecture d\'Inezgane-Aït Melloul',1),
(694,'MA45',1213,'',0,'','Province de Chtouka-Aït Baha',1),
(695,'MA46',1213,'',0,'','Province d\'Ouarzazate',1),
(696,'MA47',1213,'',0,'','Province de Sidi Ifni',1),
(697,'MA48',1213,'',0,'','Province de Taroudant',1),
(698,'MA49',1213,'',0,'','Province de Tinghir',1),
(699,'MA50',1213,'',0,'','Province de Tiznit',1),
(700,'MA51',1213,'',0,'','Province de Zagora',1),
(701,'MA52',1212,'',0,'','Province d\'Azilal',1),
(702,'MA53',1212,'',0,'','Province de Beni Mellal',1),
(703,'MA54',1212,'',0,'','Province de Fquih Ben Salah',1),
(704,'MA55',1201,'',0,'','Préfecture de M\'diq-Fnideq',1),
(705,'MA56',1201,'',0,'','Préfecture de Tanger-Asilah',1),
(706,'MA57',1201,'',0,'','Province de Chefchaouen',1),
(707,'MA58',1201,'',0,'','Province de Fahs-Anjra',1),
(708,'MA59',1201,'',0,'','Province de Larache',1),
(709,'MA60',1201,'',0,'','Province d\'Ouezzane',1),
(710,'MA61',1201,'',0,'','Province de Tétouan',1),
(711,'MA62',1203,'',0,'','Province de Guercif',1),
(712,'MA63',1203,'',0,'','Province d\'Al Hoceïma',1),
(713,'MA64',1203,'',0,'','Province de Taounate',1),
(714,'MA65',1203,'',0,'','Province de Taza',1),
(715,'MA6A',1205,'',0,'','Préfecture de Fès',1),
(716,'MA7A',1205,'',0,'','Province de Boulemane',1),
(717,'MA15A',1214,'',0,'','Province d\'Assa-Zag',1),
(718,'MA16A',1214,'',0,'','Province d\'Es-Semara',1),
(719,'MA18A',1211,'',0,'','Préfecture de Marrakech',1),
(720,'MA19A',1214,'',0,'','Province de Tan-Tan',1),
(721,'MA19B',1214,'',0,'','Province de Tan-Tan',1),
(722,'GR',1701,NULL,NULL,NULL,'Groningen',1),
(723,'FR',1701,NULL,NULL,NULL,'Friesland',1),
(724,'DR',1701,NULL,NULL,NULL,'Drenthe',1),
(725,'OV',1701,NULL,NULL,NULL,'Overijssel',1),
(726,'GD',1701,NULL,NULL,NULL,'Gelderland',1),
(727,'FL',1701,NULL,NULL,NULL,'Flevoland',1),
(728,'UT',1701,NULL,NULL,NULL,'Utrecht',1),
(729,'NH',1701,NULL,NULL,NULL,'Noord-Holland',1),
(730,'ZH',1701,NULL,NULL,NULL,'Zuid-Holland',1),
(731,'ZL',1701,NULL,NULL,NULL,'Zeeland',1),
(732,'NB',1701,NULL,NULL,NULL,'Noord-Brabant',1),
(733,'LB',1701,NULL,NULL,NULL,'Limburg',1),
(734,'PA-1',17801,'',0,'','Bocas del Toro',1),
(735,'PA-2',17801,'',0,'','Coclé',1),
(736,'PA-3',17801,'',0,'','Colón',1),
(737,'PA-4',17801,'',0,'','Chiriquí',1),
(738,'PA-5',17801,'',0,'','Darién',1),
(739,'PA-6',17801,'',0,'','Herrera',1),
(740,'PA-7',17801,'',0,'','Los Santos',1),
(741,'PA-8',17801,'',0,'','Panamá',1),
(742,'PA-9',17801,'',0,'','Veraguas',1),
(743,'PA-13',17801,'',0,'','Panamá Oeste',1),
(744,'0101',18101,'',0,'','Chachapoyas',1),
(745,'0102',18101,'',0,'','Bagua',1),
(746,'0103',18101,'',0,'','Bongará',1),
(747,'0104',18101,'',0,'','Condorcanqui',1),
(748,'0105',18101,'',0,'','Luya',1),
(749,'0106',18101,'',0,'','Rodríguez de Mendoza',1),
(750,'0107',18101,'',0,'','Utcubamba',1),
(751,'0201',18102,'',0,'','Huaraz',1),
(752,'0202',18102,'',0,'','Aija',1),
(753,'0203',18102,'',0,'','Antonio Raymondi',1),
(754,'0204',18102,'',0,'','Asunción',1),
(755,'0205',18102,'',0,'','Bolognesi',1),
(756,'0206',18102,'',0,'','Carhuaz',1),
(757,'0207',18102,'',0,'','Carlos Fermín Fitzcarrald',1),
(758,'0208',18102,'',0,'','Casma',1),
(759,'0209',18102,'',0,'','Corongo',1),
(760,'0210',18102,'',0,'','Huari',1),
(761,'0211',18102,'',0,'','Huarmey',1),
(762,'0212',18102,'',0,'','Huaylas',1),
(763,'0213',18102,'',0,'','Mariscal Luzuriaga',1),
(764,'0214',18102,'',0,'','Ocros',1),
(765,'0215',18102,'',0,'','Pallasca',1),
(766,'0216',18102,'',0,'','Pomabamba',1),
(767,'0217',18102,'',0,'','Recuay',1),
(768,'0218',18102,'',0,'','Papá',1),
(769,'0219',18102,'',0,'','Sihuas',1),
(770,'0220',18102,'',0,'','Yungay',1),
(771,'0301',18103,'',0,'','Abancay',1),
(772,'0302',18103,'',0,'','Andahuaylas',1),
(773,'0303',18103,'',0,'','Antabamba',1),
(774,'0304',18103,'',0,'','Aymaraes',1),
(775,'0305',18103,'',0,'','Cotabambas',1),
(776,'0306',18103,'',0,'','Chincheros',1),
(777,'0307',18103,'',0,'','Grau',1),
(778,'0401',18104,'',0,'','Arequipa',1),
(779,'0402',18104,'',0,'','Camaná',1),
(780,'0403',18104,'',0,'','Caravelí',1),
(781,'0404',18104,'',0,'','Castilla',1),
(782,'0405',18104,'',0,'','Caylloma',1),
(783,'0406',18104,'',0,'','Condesuyos',1),
(784,'0407',18104,'',0,'','Islay',1),
(785,'0408',18104,'',0,'','La Unión',1),
(786,'0501',18105,'',0,'','Huamanga',1),
(787,'0502',18105,'',0,'','Cangallo',1),
(788,'0503',18105,'',0,'','Huanca Sancos',1),
(789,'0504',18105,'',0,'','Huanta',1),
(790,'0505',18105,'',0,'','La Mar',1),
(791,'0506',18105,'',0,'','Lucanas',1),
(792,'0507',18105,'',0,'','Parinacochas',1),
(793,'0508',18105,'',0,'','Páucar del Sara Sara',1),
(794,'0509',18105,'',0,'','Sucre',1),
(795,'0510',18105,'',0,'','Víctor Fajardo',1),
(796,'0511',18105,'',0,'','Vilcas Huamán',1),
(797,'0601',18106,'',0,'','Cajamarca',1),
(798,'0602',18106,'',0,'','Cajabamba',1),
(799,'0603',18106,'',0,'','Celendín',1),
(800,'0604',18106,'',0,'','Chota',1),
(801,'0605',18106,'',0,'','Contumazá',1),
(802,'0606',18106,'',0,'','Cutervo',1),
(803,'0607',18106,'',0,'','Hualgayoc',1),
(804,'0608',18106,'',0,'','Jaén',1),
(805,'0609',18106,'',0,'','San Ignacio',1),
(806,'0610',18106,'',0,'','San Marcos',1),
(807,'0611',18106,'',0,'','San Miguel',1),
(808,'0612',18106,'',0,'','San Pablo',1),
(809,'0613',18106,'',0,'','Santa Cruz',1),
(810,'0701',18107,'',0,'','Callao',1),
(811,'0801',18108,'',0,'','Cusco',1),
(812,'0802',18108,'',0,'','Acomayo',1),
(813,'0803',18108,'',0,'','Anta',1),
(814,'0804',18108,'',0,'','Calca',1),
(815,'0805',18108,'',0,'','Canas',1),
(816,'0806',18108,'',0,'','Canchis',1),
(817,'0807',18108,'',0,'','Chumbivilcas',1),
(818,'0808',18108,'',0,'','Espinar',1),
(819,'0809',18108,'',0,'','La Convención',1),
(820,'0810',18108,'',0,'','Paruro',1),
(821,'0811',18108,'',0,'','Paucartambo',1),
(822,'0812',18108,'',0,'','Quispicanchi',1),
(823,'0813',18108,'',0,'','Urubamba',1),
(824,'0901',18109,'',0,'','Huancavelica',1),
(825,'0902',18109,'',0,'','Acobamba',1),
(826,'0903',18109,'',0,'','Angaraes',1),
(827,'0904',18109,'',0,'','Castrovirreyna',1),
(828,'0905',18109,'',0,'','Churcampa',1),
(829,'0906',18109,'',0,'','Huaytará',1),
(830,'0907',18109,'',0,'','Tayacaja',1),
(831,'1001',18110,'',0,'','Huánuco',1),
(832,'1002',18110,'',0,'','Ambón',1),
(833,'1003',18110,'',0,'','Dos de Mayo',1),
(834,'1004',18110,'',0,'','Huacaybamba',1),
(835,'1005',18110,'',0,'','Huamalíes',1),
(836,'1006',18110,'',0,'','Leoncio Prado',1),
(837,'1007',18110,'',0,'','Marañón',1),
(838,'1008',18110,'',0,'','Pachitea',1),
(839,'1009',18110,'',0,'','Puerto Inca',1),
(840,'1010',18110,'',0,'','Lauricocha',1),
(841,'1011',18110,'',0,'','Yarowilca',1),
(842,'1101',18111,'',0,'','Ica',1),
(843,'1102',18111,'',0,'','Chincha',1),
(844,'1103',18111,'',0,'','Nazca',1),
(845,'1104',18111,'',0,'','Palpa',1),
(846,'1105',18111,'',0,'','Pisco',1),
(847,'1201',18112,'',0,'','Huancayo',1),
(848,'1202',18112,'',0,'','Concepción',1),
(849,'1203',18112,'',0,'','Chanchamayo',1),
(850,'1204',18112,'',0,'','Jauja',1),
(851,'1205',18112,'',0,'','Junín',1),
(852,'1206',18112,'',0,'','Satipo',1),
(853,'1207',18112,'',0,'','Tarma',1),
(854,'1208',18112,'',0,'','Yauli',1),
(855,'1209',18112,'',0,'','Chupaca',1),
(856,'1301',18113,'',0,'','Trujillo',1),
(857,'1302',18113,'',0,'','Ascope',1),
(858,'1303',18113,'',0,'','Bolívar',1),
(859,'1304',18113,'',0,'','Chepén',1),
(860,'1305',18113,'',0,'','Julcán',1),
(861,'1306',18113,'',0,'','Otuzco',1),
(862,'1307',18113,'',0,'','Pacasmayo',1),
(863,'1308',18113,'',0,'','Pataz',1),
(864,'1309',18113,'',0,'','Sánchez Carrión',1),
(865,'1310',18113,'',0,'','Santiago de Chuco',1),
(866,'1311',18113,'',0,'','Gran Chimú',1),
(867,'1312',18113,'',0,'','Virú',1),
(868,'1401',18114,'',0,'','Chiclayo',1),
(869,'1402',18114,'',0,'','Ferreñafe',1),
(870,'1403',18114,'',0,'','Lambayeque',1),
(871,'1501',18115,'',0,'','Lima',1),
(872,'1502',18116,'',0,'','Huaura',1),
(873,'1503',18116,'',0,'','Barranca',1),
(874,'1504',18116,'',0,'','Cajatambo',1),
(875,'1505',18116,'',0,'','Canta',1),
(876,'1506',18116,'',0,'','Cañete',1),
(877,'1507',18116,'',0,'','Huaral',1),
(878,'1508',18116,'',0,'','Huarochirí',1),
(879,'1509',18116,'',0,'','Oyón',1),
(880,'1510',18116,'',0,'','Yauyos',1),
(881,'1601',18117,'',0,'','Maynas',1),
(882,'1602',18117,'',0,'','Alto Amazonas',1),
(883,'1603',18117,'',0,'','Loreto',1),
(884,'1604',18117,'',0,'','Mariscal Ramón Castilla',1),
(885,'1605',18117,'',0,'','Requena',1),
(886,'1606',18117,'',0,'','Ucayali',1),
(887,'1607',18117,'',0,'','Datem del Marañón',1),
(888,'1701',18118,'',0,'','Tambopata',1),
(889,'1702',18118,'',0,'','Manú',1),
(890,'1703',18118,'',0,'','Tahuamanu',1),
(891,'1801',18119,'',0,'','Mariscal Nieto',1),
(892,'1802',18119,'',0,'','General Sánchez Cerro',1),
(893,'1803',18119,'',0,'','Ilo',1),
(894,'1901',18120,'',0,'','Pasco',1),
(895,'1902',18120,'',0,'','Daniel Alcides Carrión',1),
(896,'1903',18120,'',0,'','Oxapampa',1),
(897,'2001',18121,'',0,'','Piura',1),
(898,'2002',18121,'',0,'','Ayabaca',1),
(899,'2003',18121,'',0,'','Huancabamba',1),
(900,'2004',18121,'',0,'','Morropón',1),
(901,'2005',18121,'',0,'','Paita',1),
(902,'2006',18121,'',0,'','Sullana',1),
(903,'2007',18121,'',0,'','Talara',1),
(904,'2008',18121,'',0,'','Sechura',1),
(905,'2101',18122,'',0,'','Puno',1),
(906,'2102',18122,'',0,'','Azángaro',1),
(907,'2103',18122,'',0,'','Carabaya',1),
(908,'2104',18122,'',0,'','Chucuito',1),
(909,'2105',18122,'',0,'','El Collao',1),
(910,'2106',18122,'',0,'','Huancané',1),
(911,'2107',18122,'',0,'','Lampa',1),
(912,'2108',18122,'',0,'','Melgar',1),
(913,'2109',18122,'',0,'','Moho',1),
(914,'2110',18122,'',0,'','San Antonio de Putina',1),
(915,'2111',18122,'',0,'','San Román',1),
(916,'2112',18122,'',0,'','Sandia',1),
(917,'2113',18122,'',0,'','Yunguyo',1),
(918,'2201',18123,'',0,'','Moyobamba',1),
(919,'2202',18123,'',0,'','Bellavista',1),
(920,'2203',18123,'',0,'','El Dorado',1),
(921,'2204',18123,'',0,'','Huallaga',1),
(922,'2205',18123,'',0,'','Lamas',1),
(923,'2206',18123,'',0,'','Mariscal Cáceres',1),
(924,'2207',18123,'',0,'','Picota',1),
(925,'2208',18123,'',0,'','La Rioja',1),
(926,'2209',18123,'',0,'','San Martín',1),
(927,'2210',18123,'',0,'','Tocache',1),
(928,'2301',18124,'',0,'','Tacna',1),
(929,'2302',18124,'',0,'','Candarave',1),
(930,'2303',18124,'',0,'','Jorge Basadre',1),
(931,'2304',18124,'',0,'','Tarata',1),
(932,'2401',18125,'',0,'','Tumbes',1),
(933,'2402',18125,'',0,'','Contralmirante Villar',1),
(934,'2403',18125,'',0,'','Zarumilla',1),
(935,'2501',18126,'',0,'','Coronel Portillo',1),
(936,'2502',18126,'',0,'','Atalaya',1),
(937,'2503',18126,'',0,'','Padre Abad',1),
(938,'2504',18126,'',0,'','Purús',1),
(939,'PT-AV',15001,NULL,NULL,'AVEIRO','Aveiro',1),
(940,'PT-AC',15002,NULL,NULL,'AZORES','Azores',1),
(941,'PT-BE',15001,NULL,NULL,'BEJA','Beja',1),
(942,'PT-BR',15001,NULL,NULL,'BRAGA','Braga',1),
(943,'PT-BA',15001,NULL,NULL,'BRAGANCA','Bragança',1),
(944,'PT-CB',15001,NULL,NULL,'CASTELO BRANCO','Castelo Branco',1),
(945,'PT-CO',15001,NULL,NULL,'COIMBRA','Coimbra',1),
(946,'PT-EV',15001,NULL,NULL,'EVORA','Évora',1),
(947,'PT-FA',15001,NULL,NULL,'FARO','Faro',1),
(948,'PT-GU',15001,NULL,NULL,'GUARDA','Guarda',1),
(949,'PT-LE',15001,NULL,NULL,'LEIRIA','Leiria',1),
(950,'PT-LI',15001,NULL,NULL,'LISBON','Lisboa',1),
(951,'PT-AML',15001,NULL,NULL,'AREA METROPOLITANA LISBOA','Área Metropolitana de Lisboa',1),
(952,'PT-MA',15002,NULL,NULL,'MADEIRA','Madeira',1),
(953,'PT-PA',15001,NULL,NULL,'PORTALEGRE','Portalegre',1),
(954,'PT-PO',15001,NULL,NULL,'PORTO','Porto',1),
(955,'PT-SA',15001,NULL,NULL,'SANTAREM','Santarém',1),
(956,'PT-SE',15001,NULL,NULL,'SETUBAL','Setúbal',1),
(957,'PT-VC',15001,NULL,NULL,'VIANA DO CASTELO','Viana Do Castelo',1),
(958,'PT-VR',15001,NULL,NULL,'VILA REAL','Vila Real',1),
(959,'PT-VI',15001,NULL,NULL,'VISEU','Viseu',1),
(960,'AB',18801,'',0,'','Alba',1),
(961,'AR',18801,'',0,'','Arad',1),
(962,'AG',18801,'',0,'','Argeș',1),
(963,'BC',18801,'',0,'','Bacău',1),
(964,'BH',18801,'',0,'','Bihor',1),
(965,'BN',18801,'',0,'','Bistrița-Năsăud',1),
(966,'BT',18801,'',0,'','Botoșani',1),
(967,'BV',18801,'',0,'','Brașov',1),
(968,'BR',18801,'',0,'','Brăila',1),
(969,'BU',18801,'',0,'','Bucuresti',1),
(970,'BZ',18801,'',0,'','Buzău',1),
(971,'CL',18801,'',0,'','Călărași',1),
(972,'CS',18801,'',0,'','Caraș-Severin',1),
(973,'CJ',18801,'',0,'','Cluj',1),
(974,'CT',18801,'',0,'','Constanța',1),
(975,'CV',18801,'',0,'','Covasna',1),
(976,'DB',18801,'',0,'','Dâmbovița',1),
(977,'DJ',18801,'',0,'','Dolj',1),
(978,'GL',18801,'',0,'','Galați',1),
(979,'GR',18801,'',0,'','Giurgiu',1),
(980,'GJ',18801,'',0,'','Gorj',1),
(981,'HR',18801,'',0,'','Harghita',1),
(982,'HD',18801,'',0,'','Hunedoara',1),
(983,'IL',18801,'',0,'','Ialomița',1),
(984,'IS',18801,'',0,'','Iași',1),
(985,'IF',18801,'',0,'','Ilfov',1),
(986,'MM',18801,'',0,'','Maramureș',1),
(987,'MH',18801,'',0,'','Mehedinți',1),
(988,'MS',18801,'',0,'','Mureș',1),
(989,'NT',18801,'',0,'','Neamț',1),
(990,'OT',18801,'',0,'','Olt',1),
(991,'PH',18801,'',0,'','Prahova',1),
(992,'SM',18801,'',0,'','Satu Mare',1),
(993,'SJ',18801,'',0,'','Sălaj',1),
(994,'SB',18801,'',0,'','Sibiu',1),
(995,'SV',18801,'',0,'','Suceava',1),
(996,'TR',18801,'',0,'','Teleorman',1),
(997,'TM',18801,'',0,'','Timiș',1),
(998,'TL',18801,'',0,'','Tulcea',1),
(999,'VS',18801,'',0,'','Vaslui',1),
(1000,'VL',18801,'',0,'','Vâlcea',1),
(1001,'VN',18801,'',0,'','Vrancea',1),
(1002,'SS',8601,'',0,'','San Salvador',1),
(1003,'LL',8601,'',0,'','La Libertad',1),
(1004,'CH',8601,'',0,'','Chalatenango',1),
(1005,'CA',8601,'',0,'','Cabañas',1),
(1006,'LP',8601,'',0,'','La Paz',1),
(1007,'SV',8601,'',0,'','San Vicente',1),
(1008,'CU',8601,'',0,'','Cuscatlan',1),
(1009,'US',8602,'',0,'','Usulutan',1),
(1010,'SM',8602,'',0,'','San Miguel',1),
(1011,'MO',8602,'',0,'','Morazan',1),
(1012,'LU',8602,'',0,'','La Union',1),
(1013,'AH',8603,'',0,'','Ahuachapan',1),
(1014,'SA',8603,'',0,'','Santa Ana',1),
(1015,'SO',8603,'',0,'','Sonsonate',1),
(1016,'SI031',20203,NULL,NULL,'MURA','Mura',1),
(1017,'SI032',20203,NULL,NULL,'DRAVA','Drava',1),
(1018,'SI033',20203,NULL,NULL,'CARINTHIA','Carinthia',1),
(1019,'SI034',20203,NULL,NULL,'SAVINJA','Savinja',1),
(1020,'SI035',20203,NULL,NULL,'CENTRAL SAVA','Central Sava',1),
(1021,'SI036',20203,NULL,NULL,'LOWER SAVA','Lower Sava',1),
(1022,'SI037',20203,NULL,NULL,'SOUTHEAST SLOVENIA','Southeast Slovenia',1),
(1023,'SI038',20203,NULL,NULL,'LITTORAL–INNER CARNIOLA','Littoral–Inner Carniola',1),
(1024,'SI041',20204,NULL,NULL,'CENTRAL SLOVENIA','Central Slovenia',1),
(1025,'SI038',20204,NULL,NULL,'UPPER CARNIOLA','Upper Carniola',1),
(1026,'SI043',20204,NULL,NULL,'GORIZIA','Gorizia',1),
(1027,'SI044',20204,NULL,NULL,'COASTAL–KARST','Coastal–Karst',1),
(1028,'AG',601,NULL,NULL,'ARGOVIE','Argovie',1),
(1029,'AI',601,NULL,NULL,'APPENZELL RHODES INTERIEURES','Appenzell Rhodes intérieures',1),
(1030,'AR',601,NULL,NULL,'APPENZELL RHODES EXTERIEURES','Appenzell Rhodes extérieures',1),
(1031,'BE',601,NULL,NULL,'BERNE','Berne',1),
(1032,'BL',601,NULL,NULL,'BALE CAMPAGNE','Bâle Campagne',1),
(1033,'BS',601,NULL,NULL,'BALE VILLE','Bâle Ville',1),
(1034,'FR',601,NULL,NULL,'FRIBOURG','Fribourg',1),
(1035,'GE',601,NULL,NULL,'GENEVE','Genève',1),
(1036,'GL',601,NULL,NULL,'GLARIS','Glaris',1),
(1037,'GR',601,NULL,NULL,'GRISONS','Grisons',1),
(1038,'JU',601,NULL,NULL,'JURA','Jura',1),
(1039,'LU',601,NULL,NULL,'LUCERNE','Lucerne',1),
(1040,'NE',601,NULL,NULL,'NEUCHATEL','Neuchâtel',1),
(1041,'NW',601,NULL,NULL,'NIDWALD','Nidwald',1),
(1042,'OW',601,NULL,NULL,'OBWALD','Obwald',1),
(1043,'SG',601,NULL,NULL,'SAINT-GALL','Saint-Gall',1),
(1044,'SH',601,NULL,NULL,'SCHAFFHOUSE','Schaffhouse',1),
(1045,'SO',601,NULL,NULL,'SOLEURE','Soleure',1),
(1046,'SZ',601,NULL,NULL,'SCHWYZ','Schwyz',1),
(1047,'TG',601,NULL,NULL,'THURGOVIE','Thurgovie',1),
(1048,'TI',601,NULL,NULL,'TESSIN','Tessin',1),
(1049,'UR',601,NULL,NULL,'URI','Uri',1),
(1050,'VD',601,NULL,NULL,'VAUD','Vaud',1),
(1051,'VS',601,NULL,NULL,'VALAIS','Valais',1),
(1052,'ZG',601,NULL,NULL,'ZUG','Zug',1),
(1053,'ZH',601,NULL,NULL,'ZURICH','Zürich',1),
(1054,'TW-KLU',21301,'KLU',NULL,NULL,'基隆市',1),
(1055,'TW-TPE',21301,'TPE',NULL,NULL,'臺北市',1),
(1056,'TW-TPH',21301,'TPH',NULL,NULL,'新北市',1),
(1057,'TW-TYC',21301,'TYC',NULL,NULL,'桃園市',1),
(1058,'TW-HSH',21301,'HSH',NULL,NULL,'新竹縣',1),
(1059,'TW-HSC',21301,'HSC',NULL,NULL,'新竹市',1),
(1060,'TW-MAL',21301,'MAL',NULL,NULL,'苗栗縣',1),
(1061,'TW-MAC',21301,'MAC',NULL,NULL,'苗栗市',1),
(1062,'TW-TXG',21301,'TXG',NULL,NULL,'臺中市',1),
(1063,'TW-CWH',21301,'CWH',NULL,NULL,'彰化縣',1),
(1064,'TW-CWS',21301,'CWS',NULL,NULL,'彰化市',1),
(1065,'TW-NTC',21301,'NTC',NULL,NULL,'南投市',1),
(1066,'TW-NTO',21301,'NTO',NULL,NULL,'南投縣',1),
(1067,'TW-YLH',21301,'YLH',NULL,NULL,'雲林縣',1),
(1068,'TW-CHY',21301,'CHY',NULL,NULL,'嘉義縣',1),
(1069,'TW-CYI',21301,'CYI',NULL,NULL,'嘉義市',1),
(1070,'TW-TNN',21301,'TNN',NULL,NULL,'臺南市',1),
(1071,'TW-KHH',21301,'KHH',NULL,NULL,'高雄市',1),
(1072,'TW-IUH',21301,'IUH',NULL,NULL,'屏東縣',1),
(1073,'TW-PTS',21301,'PTS',NULL,NULL,'屏東市',1),
(1074,'TW-ILN',21301,'ILN',NULL,NULL,'宜蘭縣',1),
(1075,'TW-ILC',21301,'ILC',NULL,NULL,'宜蘭市',1),
(1076,'TW-HWA',21301,'HWA',NULL,NULL,'花蓮縣',1),
(1077,'TW-HWC',21301,'HWC',NULL,NULL,'花蓮市',1),
(1078,'TW-TTC',21301,'TTC',NULL,NULL,'臺東市',1),
(1079,'TW-TTT',21301,'TTT',NULL,NULL,'臺東縣',1),
(1080,'TW-PEH',21301,'PEH',NULL,NULL,'澎湖縣',1),
(1081,'TW-GNI',21301,'GNI',NULL,NULL,'綠島',1),
(1082,'TW-KYD',21301,'KYD',NULL,NULL,'蘭嶼',1),
(1083,'TW-KMN',21301,'KMN',NULL,NULL,'金門縣',1),
(1084,'TW-LNN',21301,'LNN',NULL,NULL,'連江縣',1),
(1085,'TN01',1001,'',0,'','Ariana',1),
(1086,'TN02',1001,'',0,'','Béja',1),
(1087,'TN03',1001,'',0,'','Ben Arous',1),
(1088,'TN04',1001,'',0,'','Bizerte',1),
(1089,'TN05',1001,'',0,'','Gabès',1),
(1090,'TN06',1001,'',0,'','Gafsa',1),
(1091,'TN07',1001,'',0,'','Jendouba',1),
(1092,'TN08',1001,'',0,'','Kairouan',1),
(1093,'TN09',1001,'',0,'','Kasserine',1),
(1094,'TN10',1001,'',0,'','Kébili',1),
(1095,'TN11',1001,'',0,'','La Manouba',1),
(1096,'TN12',1001,'',0,'','Le Kef',1),
(1097,'TN13',1001,'',0,'','Mahdia',1),
(1098,'TN14',1001,'',0,'','Médenine',1),
(1099,'TN15',1001,'',0,'','Monastir',1),
(1100,'TN16',1001,'',0,'','Nabeul',1),
(1101,'TN17',1001,'',0,'','Sfax',1),
(1102,'TN18',1001,'',0,'','Sidi Bouzid',1),
(1103,'TN19',1001,'',0,'','Siliana',1),
(1104,'TN20',1001,'',0,'','Sousse',1),
(1105,'TN21',1001,'',0,'','Tataouine',1),
(1106,'TN22',1001,'',0,'','Tozeur',1),
(1107,'TN23',1001,'',0,'','Tunis',1),
(1108,'TN24',1001,'',0,'','Zaghouan',1),
(1109,'AL',1101,'',0,'ALABAMA','Alabama',1),
(1110,'AK',1101,'',0,'ALASKA','Alaska',1),
(1111,'AZ',1101,'',0,'ARIZONA','Arizona',1),
(1112,'AR',1101,'',0,'ARKANSAS','Arkansas',1),
(1113,'CA',1101,'',0,'CALIFORNIA','California',1),
(1114,'CO',1101,'',0,'COLORADO','Colorado',1),
(1115,'CT',1101,'',0,'CONNECTICUT','Connecticut',1),
(1116,'DE',1101,'',0,'DELAWARE','Delaware',1),
(1117,'FL',1101,'',0,'FLORIDA','Florida',1),
(1118,'GA',1101,'',0,'GEORGIA','Georgia',1),
(1119,'HI',1101,'',0,'HAWAII','Hawaii',1),
(1120,'ID',1101,'',0,'IDAHO','Idaho',1),
(1121,'IL',1101,'',0,'ILLINOIS','Illinois',1),
(1122,'IN',1101,'',0,'INDIANA','Indiana',1),
(1123,'IA',1101,'',0,'IOWA','Iowa',1),
(1124,'KS',1101,'',0,'KANSAS','Kansas',1),
(1125,'KY',1101,'',0,'KENTUCKY','Kentucky',1),
(1126,'LA',1101,'',0,'LOUISIANA','Louisiana',1),
(1127,'ME',1101,'',0,'MAINE','Maine',1),
(1128,'MD',1101,'',0,'MARYLAND','Maryland',1),
(1129,'MA',1101,'',0,'MASSACHUSSETTS','Massachusetts',1),
(1130,'MI',1101,'',0,'MICHIGAN','Michigan',1),
(1131,'MN',1101,'',0,'MINNESOTA','Minnesota',1),
(1132,'MS',1101,'',0,'MISSISSIPPI','Mississippi',1),
(1133,'MO',1101,'',0,'MISSOURI','Missouri',1),
(1134,'MT',1101,'',0,'MONTANA','Montana',1),
(1135,'NE',1101,'',0,'NEBRASKA','Nebraska',1),
(1136,'NV',1101,'',0,'NEVADA','Nevada',1),
(1137,'NH',1101,'',0,'NEW HAMPSHIRE','New Hampshire',1),
(1138,'NJ',1101,'',0,'NEW JERSEY','New Jersey',1),
(1139,'NM',1101,'',0,'NEW MEXICO','New Mexico',1),
(1140,'NY',1101,'',0,'NEW YORK','New York',1),
(1141,'NC',1101,'',0,'NORTH CAROLINA','North Carolina',1),
(1142,'ND',1101,'',0,'NORTH DAKOTA','North Dakota',1),
(1143,'OH',1101,'',0,'OHIO','Ohio',1),
(1144,'OK',1101,'',0,'OKLAHOMA','Oklahoma',1),
(1145,'OR',1101,'',0,'OREGON','Oregon',1),
(1146,'PA',1101,'',0,'PENNSYLVANIA','Pennsylvania',1),
(1147,'RI',1101,'',0,'RHODE ISLAND','Rhode Island',1),
(1148,'SC',1101,'',0,'SOUTH CAROLINA','South Carolina',1),
(1149,'SD',1101,'',0,'SOUTH DAKOTA','South Dakota',1),
(1150,'TN',1101,'',0,'TENNESSEE','Tennessee',1),
(1151,'TX',1101,'',0,'TEXAS','Texas',1),
(1152,'UT',1101,'',0,'UTAH','Utah',1),
(1153,'VT',1101,'',0,'VERMONT','Vermont',1),
(1154,'VA',1101,'',0,'VIRGINIA','Virginia',1),
(1155,'WA',1101,'',0,'WASHINGTON','Washington',1),
(1156,'WV',1101,'',0,'WEST VIRGINIA','West Virginia',1),
(1157,'WI',1101,'',0,'WISCONSIN','Wisconsin',1),
(1158,'WY',1101,'',0,'WYOMING','Wyoming',1),
(1159,'001',5201,'',0,'','Belisario Boeto',1),
(1160,'002',5201,'',0,'','Hernando Siles',1),
(1161,'003',5201,'',0,'','Jaime Zudáñez',1),
(1162,'004',5201,'',0,'','Juana Azurduy de Padilla',1),
(1163,'005',5201,'',0,'','Luis Calvo',1),
(1164,'006',5201,'',0,'','Nor Cinti',1),
(1165,'007',5201,'',0,'','Oropeza',1),
(1166,'008',5201,'',0,'','Sud Cinti',1),
(1167,'009',5201,'',0,'','Tomina',1),
(1168,'010',5201,'',0,'','Yamparáez',1),
(1169,'011',5202,'',0,'','Abel Iturralde',1),
(1170,'012',5202,'',0,'','Aroma',1),
(1171,'013',5202,'',0,'','Bautista Saavedra',1),
(1172,'014',5202,'',0,'','Caranavi',1),
(1173,'015',5202,'',0,'','Eliodoro Camacho',1),
(1174,'016',5202,'',0,'','Franz Tamayo',1),
(1175,'017',5202,'',0,'','Gualberto Villarroel',1),
(1176,'018',5202,'',0,'','Ingaví',1),
(1177,'019',5202,'',0,'','Inquisivi',1),
(1178,'020',5202,'',0,'','José Ramón Loayza',1),
(1179,'021',5202,'',0,'','Larecaja',1),
(1180,'022',5202,'',0,'','Los Andes (Bolivia)',1),
(1181,'023',5202,'',0,'','Manco Kapac',1),
(1182,'024',5202,'',0,'','Muñecas',1),
(1183,'025',5202,'',0,'','Nor Yungas',1),
(1184,'026',5202,'',0,'','Omasuyos',1),
(1185,'027',5202,'',0,'','Pacajes',1),
(1186,'028',5202,'',0,'','Pedro Domingo Murillo',1),
(1187,'029',5202,'',0,'','Sud Yungas',1),
(1188,'030',5202,'',0,'','General José Manuel Pando',1),
(1189,'031',5203,'',0,'','Arani',1),
(1190,'032',5203,'',0,'','Arque',1),
(1191,'033',5203,'',0,'','Ayopaya',1),
(1192,'034',5203,'',0,'','Bolívar (Bolivia)',1),
(1193,'035',5203,'',0,'','Campero',1),
(1194,'036',5203,'',0,'','Capinota',1),
(1195,'037',5203,'',0,'','Cercado (Cochabamba)',1),
(1196,'038',5203,'',0,'','Esteban Arze',1),
(1197,'039',5203,'',0,'','Germán Jordán',1),
(1198,'040',5203,'',0,'','José Carrasco',1),
(1199,'041',5203,'',0,'','Mizque',1),
(1200,'042',5203,'',0,'','Punata',1),
(1201,'043',5203,'',0,'','Quillacollo',1),
(1202,'044',5203,'',0,'','Tapacarí',1),
(1203,'045',5203,'',0,'','Tiraque',1),
(1204,'046',5203,'',0,'','Chapare',1),
(1205,'047',5204,'',0,'','Carangas',1),
(1206,'048',5204,'',0,'','Cercado (Oruro)',1),
(1207,'049',5204,'',0,'','Eduardo Avaroa',1),
(1208,'050',5204,'',0,'','Ladislao Cabrera',1),
(1209,'051',5204,'',0,'','Litoral de Atacama',1),
(1210,'052',5204,'',0,'','Mejillones',1),
(1211,'053',5204,'',0,'','Nor Carangas',1),
(1212,'054',5204,'',0,'','Pantaleón Dalence',1),
(1213,'055',5204,'',0,'','Poopó',1),
(1214,'056',5204,'',0,'','Sabaya',1),
(1215,'057',5204,'',0,'','Sajama',1),
(1216,'058',5204,'',0,'','San Pedro de Totora',1),
(1217,'059',5204,'',0,'','Saucarí',1),
(1218,'060',5204,'',0,'','Sebastián Pagador',1),
(1219,'061',5204,'',0,'','Sud Carangas',1),
(1220,'062',5204,'',0,'','Tomás Barrón',1),
(1221,'063',5205,'',0,'','Alonso de Ibáñez',1),
(1222,'064',5205,'',0,'','Antonio Quijarro',1),
(1223,'065',5205,'',0,'','Bernardino Bilbao',1),
(1224,'066',5205,'',0,'','Charcas (Potosí)',1),
(1225,'067',5205,'',0,'','Chayanta',1),
(1226,'068',5205,'',0,'','Cornelio Saavedra',1),
(1227,'069',5205,'',0,'','Daniel Campos',1),
(1228,'070',5205,'',0,'','Enrique Baldivieso',1),
(1229,'071',5205,'',0,'','José María Linares',1),
(1230,'072',5205,'',0,'','Modesto Omiste',1),
(1231,'073',5205,'',0,'','Nor Chichas',1),
(1232,'074',5205,'',0,'','Nor Lípez',1),
(1233,'075',5205,'',0,'','Rafael Bustillo',1),
(1234,'076',5205,'',0,'','Sud Chichas',1),
(1235,'077',5205,'',0,'','Sud Lípez',1),
(1236,'078',5205,'',0,'','Tomás Frías',1),
(1237,'079',5206,'',0,'','Aniceto Arce',1),
(1238,'080',5206,'',0,'','Burdet O\'Connor',1),
(1239,'081',5206,'',0,'','Cercado (Tarija)',1),
(1240,'082',5206,'',0,'','Eustaquio Méndez',1),
(1241,'083',5206,'',0,'','José María Avilés',1),
(1242,'084',5206,'',0,'','Gran Chaco',1),
(1243,'085',5207,'',0,'','Andrés Ibáñez',1),
(1244,'086',5207,'',0,'','Caballero',1),
(1245,'087',5207,'',0,'','Chiquitos',1),
(1246,'088',5207,'',0,'','Cordillera (Bolivia)',1),
(1247,'089',5207,'',0,'','Florida',1),
(1248,'090',5207,'',0,'','Germán Busch',1),
(1249,'091',5207,'',0,'','Guarayos',1),
(1250,'092',5207,'',0,'','Ichilo',1),
(1251,'093',5207,'',0,'','Obispo Santistevan',1),
(1252,'094',5207,'',0,'','Sara',1),
(1253,'095',5207,'',0,'','Vallegrande',1),
(1254,'096',5207,'',0,'','Velasco',1),
(1255,'097',5207,'',0,'','Warnes',1),
(1256,'098',5207,'',0,'','Ángel Sandóval',1),
(1257,'099',5207,'',0,'','Ñuflo de Chaves',1),
(1258,'100',5208,'',0,'','Cercado (Beni)',1),
(1259,'101',5208,'',0,'','Iténez',1),
(1260,'102',5208,'',0,'','Mamoré',1),
(1261,'103',5208,'',0,'','Marbán',1),
(1262,'104',5208,'',0,'','Moxos',1),
(1263,'105',5208,'',0,'','Vaca Díez',1),
(1264,'106',5208,'',0,'','Yacuma',1),
(1265,'107',5208,'',0,'','General José Ballivián Segurola',1),
(1266,'108',5209,'',0,'','Abuná',1),
(1267,'109',5209,'',0,'','Madre de Dios',1),
(1268,'110',5209,'',0,'','Manuripi',1),
(1269,'111',5209,'',0,'','Nicolás Suárez',1),
(1270,'112',5209,'',0,'','General Federico Román',1),
(1271,'VI',419,'01',19,'ALAVA','Álava',1),
(1272,'AB',404,'02',4,'ALBACETE','Albacete',1),
(1273,'A',411,'03',11,'ALICANTE','Alicante',1),
(1274,'AL',401,'04',1,'ALMERIA','Almería',1),
(1275,'O',418,'33',18,'ASTURIAS','Asturias',1),
(1276,'AV',403,'05',3,'AVILA','Ávila',1),
(1277,'BA',412,'06',12,'BADAJOZ','Badajoz',1),
(1278,'B',406,'08',6,'BARCELONA','Barcelona',1),
(1279,'BU',403,'09',8,'BURGOS','Burgos',1),
(1280,'CC',412,'10',12,'CACERES','Cáceres',1),
(1281,'CA',401,'11',1,'CADIZ','Cádiz',1),
(1282,'S',410,'39',10,'CANTABRIA','Cantabria',1),
(1283,'CS',411,'12',11,'CASTELLON','Castellón',1),
(1284,'CE',407,'51',7,'CEUTA','Ceuta',1),
(1285,'CR',404,'13',4,'CIUDAD REAL','Ciudad Real',1),
(1286,'CO',401,'14',1,'CORDOBA','Córdoba',1),
(1287,'CU',404,'16',4,'CUENCA','Cuenca',1),
(1288,'GI',406,'17',6,'GERONA','Gerona',1),
(1289,'GR',401,'18',1,'GRANADA','Granada',1),
(1290,'GU',404,'19',4,'GUADALAJARA','Guadalajara',1),
(1291,'SS',419,'20',19,'GUIPUZCOA','Guipúzcoa',1),
(1292,'H',401,'21',1,'HUELVA','Huelva',1),
(1293,'HU',402,'22',2,'HUESCA','Huesca',1),
(1294,'PM',414,'07',14,'ISLAS BALEARES','Islas Baleares',1),
(1295,'J',401,'23',1,'JAEN','Jaén',1),
(1296,'C',413,'15',13,'LA CORUÑA','La Coruña',1),
(1297,'LO',415,'26',15,'LA RIOJA','La Rioja',1),
(1298,'GC',405,'35',5,'LAS PALMAS','Las Palmas',1),
(1299,'LE',403,'24',3,'LEON','León',1),
(1300,'L',406,'25',6,'LERIDA','Lérida',1),
(1301,'LU',413,'27',13,'LUGO','Lugo',1),
(1302,'M',416,'28',16,'MADRID','Madrid',1),
(1303,'MA',401,'29',1,'MALAGA','Málaga',1),
(1304,'ML',409,'52',9,'MELILLA','Melilla',1),
(1305,'MU',417,'30',17,'MURCIA','Murcia',1),
(1306,'NA',408,'31',8,'NAVARRA','Navarra',1),
(1307,'OR',413,'32',13,'ORENSE','Orense',1),
(1308,'P',403,'34',3,'PALENCIA','Palencia',1),
(1309,'PO',413,'36',13,'PONTEVEDRA','Pontevedra',1),
(1310,'SA',403,'37',3,'SALAMANCA','Salamanca',1),
(1311,'TF',405,'38',5,'STA. CRUZ DE TENERIFE','Santa Cruz de Tenerife',1),
(1312,'SG',403,'40',3,'SEGOVIA','Segovia',1),
(1313,'SE',401,'41',1,'SEVILLA','Sevilla',1),
(1314,'SO',403,'42',3,'SORIA','Soria',1),
(1315,'T',406,'43',6,'TARRAGONA','Tarragona',1),
(1316,'TE',402,'44',2,'TERUEL','Teruel',1),
(1317,'TO',404,'45',5,'TOLEDO','Toledo',1),
(1318,'V',411,'46',11,'VALENCIA','Valencia',1),
(1319,'VA',403,'47',3,'VALLADOLID','Valladolid',1),
(1320,'BI',419,'48',19,'VIZCAYA','Vizcaya',1),
(1321,'ZA',403,'49',3,'ZAMORA','Zamora',1),
(1322,'Z',402,'50',1,'ZARAGOZA','Zaragoza',1),
(1323,'701',701,NULL,0,NULL,'Bedfordshire',1),
(1324,'702',701,NULL,0,NULL,'Berkshire',1),
(1325,'703',701,NULL,0,NULL,'Bristol, City of',1),
(1326,'704',701,NULL,0,NULL,'Buckinghamshire',1),
(1327,'705',701,NULL,0,NULL,'Cambridgeshire',1),
(1328,'706',701,NULL,0,NULL,'Cheshire',1),
(1329,'707',701,NULL,0,NULL,'Cleveland',1),
(1330,'708',701,NULL,0,NULL,'Cornwall',1),
(1331,'709',701,NULL,0,NULL,'Cumberland',1),
(1332,'710',701,NULL,0,NULL,'Cumbria',1),
(1333,'711',701,NULL,0,NULL,'Derbyshire',1),
(1334,'712',701,NULL,0,NULL,'Devon',1),
(1335,'713',701,NULL,0,NULL,'Dorset',1),
(1336,'714',701,NULL,0,NULL,'Co. Durham',1),
(1337,'715',701,NULL,0,NULL,'East Riding of Yorkshire',1),
(1338,'716',701,NULL,0,NULL,'East Sussex',1),
(1339,'717',701,NULL,0,NULL,'Essex',1),
(1340,'718',701,NULL,0,NULL,'Gloucestershire',1),
(1341,'719',701,NULL,0,NULL,'Greater Manchester',1),
(1342,'720',701,NULL,0,NULL,'Hampshire',1),
(1343,'721',701,NULL,0,NULL,'Hertfordshire',1),
(1344,'722',701,NULL,0,NULL,'Hereford and Worcester',1),
(1345,'723',701,NULL,0,NULL,'Herefordshire',1),
(1346,'724',701,NULL,0,NULL,'Huntingdonshire',1),
(1347,'725',701,NULL,0,NULL,'Isle of Man',1),
(1348,'726',701,NULL,0,NULL,'Isle of Wight',1),
(1349,'727',701,NULL,0,NULL,'Jersey',1),
(1350,'728',701,NULL,0,NULL,'Kent',1),
(1351,'729',701,NULL,0,NULL,'Lancashire',1),
(1352,'730',701,NULL,0,NULL,'Leicestershire',1),
(1353,'731',701,NULL,0,NULL,'Lincolnshire',1),
(1354,'732',701,NULL,0,NULL,'London - City of London',1),
(1355,'733',701,NULL,0,NULL,'Merseyside',1),
(1356,'734',701,NULL,0,NULL,'Middlesex',1),
(1357,'735',701,NULL,0,NULL,'Norfolk',1),
(1358,'736',701,NULL,0,NULL,'North Yorkshire',1),
(1359,'737',701,NULL,0,NULL,'North Riding of Yorkshire',1),
(1360,'738',701,NULL,0,NULL,'Northamptonshire',1),
(1361,'739',701,NULL,0,NULL,'Northumberland',1),
(1362,'740',701,NULL,0,NULL,'Nottinghamshire',1),
(1363,'741',701,NULL,0,NULL,'Oxfordshire',1),
(1364,'742',701,NULL,0,NULL,'Rutland',1),
(1365,'743',701,NULL,0,NULL,'Shropshire',1),
(1366,'744',701,NULL,0,NULL,'Somerset',1),
(1367,'745',701,NULL,0,NULL,'Staffordshire',1),
(1368,'746',701,NULL,0,NULL,'Suffolk',1),
(1369,'747',701,NULL,0,NULL,'Surrey',1),
(1370,'748',701,NULL,0,NULL,'Sussex',1),
(1371,'749',701,NULL,0,NULL,'Tyne and Wear',1),
(1372,'750',701,NULL,0,NULL,'Warwickshire',1),
(1373,'751',701,NULL,0,NULL,'West Midlands',1),
(1374,'752',701,NULL,0,NULL,'West Sussex',1),
(1375,'753',701,NULL,0,NULL,'West Yorkshire',1),
(1376,'754',701,NULL,0,NULL,'West Riding of Yorkshire',1),
(1377,'755',701,NULL,0,NULL,'Wiltshire',1),
(1378,'756',701,NULL,0,NULL,'Worcestershire',1),
(1379,'757',701,NULL,0,NULL,'Yorkshire',1),
(1380,'758',702,NULL,0,NULL,'Anglesey',1),
(1381,'759',702,NULL,0,NULL,'Breconshire',1),
(1382,'760',702,NULL,0,NULL,'Caernarvonshire',1),
(1383,'761',702,NULL,0,NULL,'Cardiganshire',1),
(1384,'762',702,NULL,0,NULL,'Carmarthenshire',1),
(1385,'763',702,NULL,0,NULL,'Ceredigion',1),
(1386,'764',702,NULL,0,NULL,'Denbighshire',1),
(1387,'765',702,NULL,0,NULL,'Flintshire',1),
(1388,'766',702,NULL,0,NULL,'Glamorgan',1),
(1389,'767',702,NULL,0,NULL,'Gwent',1),
(1390,'768',702,NULL,0,NULL,'Gwynedd',1),
(1391,'769',702,NULL,0,NULL,'Merionethshire',1),
(1392,'770',702,NULL,0,NULL,'Monmouthshire',1),
(1393,'771',702,NULL,0,NULL,'Mid Glamorgan',1),
(1394,'772',702,NULL,0,NULL,'Montgomeryshire',1),
(1395,'773',702,NULL,0,NULL,'Pembrokeshire',1),
(1396,'774',702,NULL,0,NULL,'Powys',1),
(1397,'775',702,NULL,0,NULL,'Radnorshire',1),
(1398,'776',702,NULL,0,NULL,'South Glamorgan',1),
(1399,'777',703,NULL,0,NULL,'Aberdeen, City of',1),
(1400,'778',703,NULL,0,NULL,'Angus',1),
(1401,'779',703,NULL,0,NULL,'Argyll',1),
(1402,'780',703,NULL,0,NULL,'Ayrshire',1),
(1403,'781',703,NULL,0,NULL,'Banffshire',1),
(1404,'782',703,NULL,0,NULL,'Berwickshire',1),
(1405,'783',703,NULL,0,NULL,'Bute',1),
(1406,'784',703,NULL,0,NULL,'Caithness',1),
(1407,'785',703,NULL,0,NULL,'Clackmannanshire',1),
(1408,'786',703,NULL,0,NULL,'Dumfriesshire',1),
(1409,'787',703,NULL,0,NULL,'Dumbartonshire',1),
(1410,'788',703,NULL,0,NULL,'Dundee, City of',1),
(1411,'789',703,NULL,0,NULL,'East Lothian',1),
(1412,'790',703,NULL,0,NULL,'Fife',1),
(1413,'791',703,NULL,0,NULL,'Inverness',1),
(1414,'792',703,NULL,0,NULL,'Kincardineshire',1),
(1415,'793',703,NULL,0,NULL,'Kinross-shire',1),
(1416,'794',703,NULL,0,NULL,'Kirkcudbrightshire',1),
(1417,'795',703,NULL,0,NULL,'Lanarkshire',1),
(1418,'796',703,NULL,0,NULL,'Midlothian',1),
(1419,'797',703,NULL,0,NULL,'Morayshire',1),
(1420,'798',703,NULL,0,NULL,'Nairnshire',1),
(1421,'799',703,NULL,0,NULL,'Orkney',1),
(1422,'800',703,NULL,0,NULL,'Peebleshire',1),
(1423,'801',703,NULL,0,NULL,'Perthshire',1),
(1424,'802',703,NULL,0,NULL,'Renfrewshire',1),
(1425,'803',703,NULL,0,NULL,'Ross & Cromarty',1),
(1426,'804',703,NULL,0,NULL,'Roxburghshire',1),
(1427,'805',703,NULL,0,NULL,'Selkirkshire',1),
(1428,'806',703,NULL,0,NULL,'Shetland',1),
(1429,'807',703,NULL,0,NULL,'Stirlingshire',1),
(1430,'808',703,NULL,0,NULL,'Sutherland',1),
(1431,'809',703,NULL,0,NULL,'West Lothian',1),
(1432,'810',703,NULL,0,NULL,'Wigtownshire',1),
(1433,'811',704,NULL,0,NULL,'Antrim',1),
(1434,'812',704,NULL,0,NULL,'Armagh',1),
(1435,'813',704,NULL,0,NULL,'Co. Down',1),
(1436,'814',704,NULL,0,NULL,'Co. Fermanagh',1),
(1437,'815',704,NULL,0,NULL,'Co. Londonderry',1),
(1438,'AN',11701,NULL,0,'AN','Andaman & Nicobar',1),
(1439,'AP',11701,NULL,0,'AP','Andhra Pradesh',1),
(1440,'AR',11701,NULL,0,'AR','Arunachal Pradesh',1),
(1441,'AS',11701,NULL,0,'AS','Assam',1),
(1442,'BR',11701,NULL,0,'BR','Bihar',1),
(1443,'CG',11701,NULL,0,'CG','Chattisgarh',1),
(1444,'CH',11701,NULL,0,'CH','Chandigarh',1),
(1445,'DD',11701,NULL,0,'DD','Daman & Diu',1),
(1446,'DL',11701,NULL,0,'DL','Delhi',1),
(1447,'DN',11701,NULL,0,'DN','Dadra and Nagar Haveli',1),
(1448,'GA',11701,NULL,0,'GA','Goa',1),
(1449,'GJ',11701,NULL,0,'GJ','Gujarat',1),
(1450,'HP',11701,NULL,0,'HP','Himachal Pradesh',1),
(1451,'HR',11701,NULL,0,'HR','Haryana',1),
(1452,'JH',11701,NULL,0,'JH','Jharkhand',1),
(1453,'JK',11701,NULL,0,'JK','Jammu & Kashmir',1),
(1454,'KA',11701,NULL,0,'KA','Karnataka',1),
(1455,'KL',11701,NULL,0,'KL','Kerala',1),
(1456,'LD',11701,NULL,0,'LD','Lakshadweep',1),
(1457,'MH',11701,NULL,0,'MH','Maharashtra',1),
(1458,'ML',11701,NULL,0,'ML','Meghalaya',1),
(1459,'MN',11701,NULL,0,'MN','Manipur',1),
(1460,'MP',11701,NULL,0,'MP','Madhya Pradesh',1),
(1461,'MZ',11701,NULL,0,'MZ','Mizoram',1),
(1462,'NL',11701,NULL,0,'NL','Nagaland',1),
(1463,'OR',11701,NULL,0,'OR','Orissa',1),
(1464,'PB',11701,NULL,0,'PB','Punjab',1),
(1465,'PY',11701,NULL,0,'PY','Puducherry',1),
(1466,'RJ',11701,NULL,0,'RJ','Rajasthan',1),
(1467,'SK',11701,NULL,0,'SK','Sikkim',1),
(1468,'TE',11701,NULL,0,'TE','Telangana',1),
(1469,'TN',11701,NULL,0,'TN','Tamil Nadu',1),
(1470,'TR',11701,NULL,0,'TR','Tripura',1),
(1471,'UL',11701,NULL,0,'UL','Uttarakhand',1),
(1472,'UP',11701,NULL,0,'UP','Uttar Pradesh',1),
(1473,'WB',11701,NULL,0,'WB','West Bengal',1),
(1474,'BA',11801,NULL,0,'BA','Bali',1),
(1475,'BB',11801,NULL,0,'BB','Bangka Belitung',1),
(1476,'BT',11801,NULL,0,'BT','Banten',1),
(1477,'BE',11801,NULL,0,'BA','Bengkulu',1),
(1478,'YO',11801,NULL,0,'YO','DI Yogyakarta',1),
(1479,'JK',11801,NULL,0,'JK','DKI Jakarta',1),
(1480,'GO',11801,NULL,0,'GO','Gorontalo',1),
(1481,'JA',11801,NULL,0,'JA','Jambi',1),
(1482,'JB',11801,NULL,0,'JB','Jawa Barat',1),
(1483,'JT',11801,NULL,0,'JT','Jawa Tengah',1),
(1484,'JI',11801,NULL,0,'JI','Jawa Timur',1),
(1485,'KB',11801,NULL,0,'KB','Kalimantan Barat',1),
(1486,'KS',11801,NULL,0,'KS','Kalimantan Selatan',1),
(1487,'KT',11801,NULL,0,'KT','Kalimantan Tengah',1),
(1488,'KI',11801,NULL,0,'KI','Kalimantan Timur',1),
(1489,'KU',11801,NULL,0,'KU','Kalimantan Utara',1),
(1490,'KR',11801,NULL,0,'KR','Kepulauan Riau',1),
(1491,'LA',11801,NULL,0,'LA','Lampung',1),
(1492,'MA',11801,NULL,0,'MA','Maluku',1),
(1493,'MU',11801,NULL,0,'MU','Maluku Utara',1),
(1494,'AC',11801,NULL,0,'AC','Nanggroe Aceh Darussalam',1),
(1495,'NB',11801,NULL,0,'NB','Nusa Tenggara Barat',1),
(1496,'NT',11801,NULL,0,'NT','Nusa Tenggara Timur',1),
(1497,'PA',11801,NULL,0,'PA','Papua',1),
(1498,'PB',11801,NULL,0,'PB','Papua Barat',1),
(1499,'RI',11801,NULL,0,'RI','Riau',1),
(1500,'SR',11801,NULL,0,'SR','Sulawesi Barat',1),
(1501,'SN',11801,NULL,0,'SN','Sulawesi Selatan',1),
(1502,'ST',11801,NULL,0,'ST','Sulawesi Tengah',1),
(1503,'SG',11801,NULL,0,'SG','Sulawesi Tenggara',1),
(1504,'SA',11801,NULL,0,'SA','Sulawesi Utara',1),
(1505,'SB',11801,NULL,0,'SB','Sumatera Barat',1),
(1506,'SS',11801,NULL,0,'SS','Sumatera Selatan',1),
(1507,'SU',11801,NULL,0,'SU','Sumatera Utara	',1),
(1508,'CMX',15401,'',0,'CMX','Ciudad de México',1),
(1509,'AGS',15401,'',0,'AGS','Aguascalientes',1),
(1510,'BCN',15401,'',0,'BCN','Baja California Norte',1),
(1511,'BCS',15401,'',0,'BCS','Baja California Sur',1),
(1512,'CAM',15401,'',0,'CAM','Campeche',1),
(1513,'CHP',15401,'',0,'CHP','Chiapas',1),
(1514,'CHI',15401,'',0,'CHI','Chihuahua',1),
(1515,'COA',15401,'',0,'COA','Coahuila',1),
(1516,'COL',15401,'',0,'COL','Colima',1),
(1517,'DUR',15401,'',0,'DUR','Durango',1),
(1518,'GTO',15401,'',0,'GTO','Guanajuato',1),
(1519,'GRO',15401,'',0,'GRO','Guerrero',1),
(1520,'HGO',15401,'',0,'HGO','Hidalgo',1),
(1521,'JAL',15401,'',0,'JAL','Jalisco',1),
(1522,'MEX',15401,'',0,'MEX','México',1),
(1523,'MIC',15401,'',0,'MIC','Michoacán de Ocampo',1),
(1524,'MOR',15401,'',0,'MOR','Morelos',1),
(1525,'NAY',15401,'',0,'NAY','Nayarit',1),
(1526,'NLE',15401,'',0,'NLE','Nuevo León',1),
(1527,'OAX',15401,'',0,'OAX','Oaxaca',1),
(1528,'PUE',15401,'',0,'PUE','Puebla',1),
(1529,'QRO',15401,'',0,'QRO','Querétaro',1),
(1530,'ROO',15401,'',0,'ROO','Quintana Roo',1),
(1531,'SLP',15401,'',0,'SLP','San Luis Potosí',1),
(1532,'SIN',15401,'',0,'SIN','Sinaloa',1),
(1533,'SON',15401,'',0,'SON','Sonora',1),
(1534,'TAB',15401,'',0,'TAB','Tabasco',1),
(1535,'TAM',15401,'',0,'TAM','Tamaulipas',1),
(1536,'TLX',15401,'',0,'TLX','Tlaxcala',1),
(1537,'VER',15401,'',0,'VER','Veracruz',1),
(1538,'YUC',15401,'',0,'YUC','Yucatán',1),
(1539,'ZAC',15401,'',0,'ZAC','Zacatecas',1),
(1540,'VE-L',23201,'',0,'VE-L','Mérida',1),
(1541,'VE-T',23201,'',0,'VE-T','Trujillo',1),
(1542,'VE-E',23201,'',0,'VE-E','Barinas',1),
(1543,'VE-M',23202,'',0,'VE-M','Miranda',1),
(1544,'VE-W',23202,'',0,'VE-W','Vargas',1),
(1545,'VE-A',23202,'',0,'VE-A','Distrito Capital',1),
(1546,'VE-D',23203,'',0,'VE-D','Aragua',1),
(1547,'VE-G',23203,'',0,'VE-G','Carabobo',1),
(1548,'VE-I',23204,'',0,'VE-I','Falcón',1),
(1549,'VE-K',23204,'',0,'VE-K','Lara',1),
(1550,'VE-U',23204,'',0,'VE-U','Yaracuy',1),
(1551,'VE-F',23205,'',0,'VE-F','Bolívar',1),
(1552,'VE-X',23205,'',0,'VE-X','Amazonas',1),
(1553,'VE-Y',23205,'',0,'VE-Y','Delta Amacuro',1),
(1554,'VE-O',23206,'',0,'VE-O','Nueva Esparta',1),
(1555,'VE-Z',23206,'',0,'VE-Z','Dependencias Federales',1),
(1556,'VE-C',23207,'',0,'VE-C','Apure',1),
(1557,'VE-J',23207,'',0,'VE-J','Guárico',1),
(1558,'VE-H',23207,'',0,'VE-H','Cojedes',1),
(1559,'VE-P',23207,'',0,'VE-P','Portuguesa',1),
(1560,'VE-B',23208,'',0,'VE-B','Anzoátegui',1),
(1561,'VE-N',23208,'',0,'VE-N','Monagas',1),
(1562,'VE-R',23208,'',0,'VE-R','Sucre',1),
(1563,'VE-V',23209,'',0,'VE-V','Zulia',1),
(1564,'VE-S',23209,'',0,'VE-S','Táchira',1),
(1565,'BI0001',6101,'',0,'','Bubanza',1),
(1566,'BI0002',6101,'',0,'','Gihanga',1),
(1567,'BI0003',6101,'',0,'','Musigati',1),
(1568,'BI0004',6101,'',0,'','Mpanda',1),
(1569,'BI0005',6101,'',0,'','Rugazi',1),
(1570,'BI0006',6102,'',0,'','Muha',1),
(1571,'BI0007',6102,'',0,'','Mukaza',1),
(1572,'BI0008',6102,'',0,'','Ntahangwa',1),
(1573,'BI0009',6103,'',0,'','Isale',1),
(1574,'BI0010',6103,'',0,'','Kabezi',1),
(1575,'BI0011',6103,'',0,'','Kanyosha',1),
(1576,'BI0012',6103,'',0,'','Mubimbi',1),
(1577,'BI0013',6103,'',0,'','Mugongomanga',1),
(1578,'BI0014',6103,'',0,'','Mukike',1),
(1579,'BI0015',6103,'',0,'','Mutambu',1),
(1580,'BI0016',6103,'',0,'','Mutimbuzi',1),
(1581,'BI0017',6103,'',0,'','Nyabiraba',1),
(1582,'BI0018',6104,'',0,'','Bururi',1),
(1583,'BI0019',6104,'',0,'','Matana',1),
(1584,'BI0020',6104,'',0,'','Mugamba',1),
(1585,'BI0021',6104,'',0,'','Rutovu',1),
(1586,'BI0022',6104,'',0,'','Songa',1),
(1587,'BI0023',6104,'',0,'','Vyanda',1),
(1588,'BI0024',6105,'',0,'','Cankuzo',1),
(1589,'BI0025',6105,'',0,'','Cendajuru',1),
(1590,'BI0026',6105,'',0,'','Gisagara',1),
(1591,'BI0027',6105,'',0,'','Kigamba',1),
(1592,'BI0028',6105,'',0,'','Mishiha',1),
(1593,'BI0029',6106,'',0,'','Buganda',1),
(1594,'BI0030',6106,'',0,'','Bukinanyana',1),
(1595,'BI0031',6106,'',0,'','Mabayi',1),
(1596,'BI0032',6106,'',0,'','Mugina',1),
(1597,'BI0033',6106,'',0,'','Murwi',1),
(1598,'BI0034',6106,'',0,'','Rugombo',1),
(1599,'BI0035',6107,'',0,'','Bugendana',1),
(1600,'BI0036',6107,'',0,'','Bukirasazi',1),
(1601,'BI0037',6107,'',0,'','Buraza',1),
(1602,'BI0038',6107,'',0,'','Giheta',1),
(1603,'BI0039',6107,'',0,'','Gishubi',1),
(1604,'BI0040',6107,'',0,'','Gitega',1),
(1605,'BI0041',6107,'',0,'','Itaba',1),
(1606,'BI0042',6107,'',0,'','Makebuko',1),
(1607,'BI0043',6107,'',0,'','Mutaho',1),
(1608,'BI0044',6107,'',0,'','Nyanrusange',1),
(1609,'BI0045',6107,'',0,'','Ryansoro',1),
(1610,'BI0046',6108,'',0,'','Bugenyuzi',1),
(1611,'BI0047',6108,'',0,'','Buhiga',1),
(1612,'BI0048',6108,'',0,'','Gihogazi',1),
(1613,'BI0049',6108,'',0,'','Gitaramuka',1),
(1614,'BI0050',6108,'',0,'','Mutumba',1),
(1615,'BI0051',6108,'',0,'','Nyabikere',1),
(1616,'BI0052',6108,'',0,'','Shombo',1),
(1617,'BI0053',6109,'',0,'','Butaganzwa',1),
(1618,'BI0054',6109,'',0,'','Gahombo',1),
(1619,'BI0055',6109,'',0,'','Gatara',1),
(1620,'BI0056',6109,'',0,'','Kabarore',1),
(1621,'BI0057',6109,'',0,'','Kayanza',1),
(1622,'BI0058',6109,'',0,'','Matongo',1),
(1623,'BI0059',6109,'',0,'','Muhanga',1),
(1624,'BI0060',6109,'',0,'','Muruta',1),
(1625,'BI0061',6109,'',0,'','Rango',1),
(1626,'BI0062',6110,'',0,'','Bugabira',1),
(1627,'BI0063',6110,'',0,'','Busoni',1),
(1628,'BI0064',6110,'',0,'','Bwambarangwe',1),
(1629,'BI0065',6110,'',0,'','Gitobe',1),
(1630,'BI0066',6110,'',0,'','Kirundo',1),
(1631,'BI0067',6110,'',0,'','Ntega',1),
(1632,'BI0068',6110,'',0,'','Vumbi',1),
(1633,'BI0069',6111,'',0,'','Kayogoro',1),
(1634,'BI0070',6111,'',0,'','Kibago',1),
(1635,'BI0071',6111,'',0,'','Mabanda',1),
(1636,'BI0072',6111,'',0,'','Makamba',1),
(1637,'BI0073',6111,'',0,'','Nyanza-Lac',1),
(1638,'BI0074',6111,'',0,'','Vugizo',1),
(1639,'BI0075',6112,'',0,'','Bukeye',1),
(1640,'BI0076',6112,'',0,'','Kiganda',1),
(1641,'BI0077',6112,'',0,'','Mbuye',1),
(1642,'BI0078',6112,'',0,'','Muramvya',1),
(1643,'BI0079',6112,'',0,'','Rutegama',1),
(1644,'BI0080',6113,'',0,'','Buhinyuza',1),
(1645,'BI0081',6113,'',0,'','Butihinda',1),
(1646,'BI0082',6113,'',0,'','Gashoho',1),
(1647,'BI0083',6113,'',0,'','Gasorwe',1),
(1648,'BI0084',6113,'',0,'','Giteranyi',1),
(1649,'BI0085',6113,'',0,'','Muyinga',1),
(1650,'BI0086',6113,'',0,'','Mwakiro',1),
(1651,'BI0087',6114,'',0,'','Bisoro',1),
(1652,'BI0088',6114,'',0,'','Gisozi',1),
(1653,'BI0089',6114,'',0,'','Kayokwe',1),
(1654,'BI0090',6114,'',0,'','Ndava',1),
(1655,'BI0091',6114,'',0,'','Nyabihanga',1),
(1656,'BI0092',6114,'',0,'','Rusaka',1),
(1657,'BI0093',6115,'',0,'','Busiga',1),
(1658,'BI0094',6115,'',0,'','Gashikanwa',1),
(1659,'BI0095',6115,'',0,'','Kiremba',1),
(1660,'BI0096',6115,'',0,'','Marangara',1),
(1661,'BI0097',6115,'',0,'','Mwumba',1),
(1662,'BI0098',6115,'',0,'','Ngozi',1),
(1663,'BI0099',6115,'',0,'','Nyamurenza',1),
(1664,'BI0100',6115,'',0,'','Ruhororo',1),
(1665,'BI0101',6115,'',0,'','Tangara',1),
(1666,'BI0102',6116,'',0,'','Bugarama',1),
(1667,'BI0103',6116,'',0,'','Burambi',1),
(1668,'BI0104',6116,'',0,'','Buyengero',1),
(1669,'BI0105',6116,'',0,'','Muhuta',1),
(1670,'BI0106',6116,'',0,'','Rumonge',1),
(1671,'BI0107',6117,'',0,'','Bukemba',1),
(1672,'BI0108',6117,'',0,'','Giharo',1),
(1673,'BI0109',6117,'',0,'','Gitanga',1),
(1674,'BI0110',6117,'',0,'','Mpinga-Kayove',1),
(1675,'BI0111',6117,'',0,'','Musongati',1),
(1676,'BI0112',6117,'',0,'','Rutana',1),
(1677,'BI0113',6118,'',0,'','Butaganzwa',1),
(1678,'BI0114',6118,'',0,'','Butezi',1),
(1679,'BI0115',6118,'',0,'','Bweru',1),
(1680,'BI0116',6118,'',0,'','Gisuru',1),
(1681,'BI0117',6118,'',0,'','Kinyinya',1),
(1682,'BI0118',6118,'',0,'','Nyabitsinda',1),
(1683,'BI0119',6118,'',0,'','Ruyigi',1),
(1684,'AE-1',22701,'',0,'','Abu Dhabi',1),
(1685,'AE-2',22701,'',0,'','Dubai',1),
(1686,'AE-3',22701,'',0,'','Ajman',1),
(1687,'AE-4',22701,'',0,'','Fujairah',1),
(1688,'AE-5',22701,'',0,'','Ras al-Khaimah',1),
(1689,'AE-6',22701,'',0,'','Sharjah',1),
(1690,'AE-7',22701,'',0,'','Umm al-Quwain',1),
(1691,'01',12301,'',0,'北海','北海道',1),
(1692,'02',12301,'',0,'青森','青森県',1),
(1693,'03',12301,'',0,'岩手','岩手県',1),
(1694,'04',12301,'',0,'宮城','宮城県',1),
(1695,'05',12301,'',0,'秋田','秋田県',1),
(1696,'06',12301,'',0,'山形','山形県',1),
(1697,'07',12301,'',0,'福島','福島県',1),
(1698,'08',12301,'',0,'茨城','茨城県',1),
(1699,'09',12301,'',0,'栃木','栃木県',1),
(1700,'10',12301,'',0,'群馬','群馬県',1),
(1701,'11',12301,'',0,'埼玉','埼玉県',1),
(1702,'12',12301,'',0,'千葉','千葉県',1),
(1703,'13',12301,'',0,'東京','東京都',1),
(1704,'14',12301,'',0,'神奈川','神奈川県',1),
(1705,'15',12301,'',0,'新潟','新潟県',1),
(1706,'16',12301,'',0,'富山','富山県',1),
(1707,'17',12301,'',0,'石川','石川県',1),
(1708,'18',12301,'',0,'福井','福井県',1),
(1709,'19',12301,'',0,'山梨','山梨県',1),
(1710,'20',12301,'',0,'長野','長野県',1),
(1711,'21',12301,'',0,'岐阜','岐阜県',1),
(1712,'22',12301,'',0,'静岡','静岡県',1),
(1713,'23',12301,'',0,'愛知','愛知県',1),
(1714,'24',12301,'',0,'三重','三重県',1),
(1715,'25',12301,'',0,'滋賀','滋賀県',1),
(1716,'26',12301,'',0,'京都','京都府',1),
(1717,'27',12301,'',0,'大阪','大阪府',1),
(1718,'28',12301,'',0,'兵庫','兵庫県',1),
(1719,'29',12301,'',0,'奈良','奈良県',1),
(1720,'30',12301,'',0,'和歌山','和歌山県',1),
(1721,'31',12301,'',0,'鳥取','鳥取県',1),
(1722,'32',12301,'',0,'島根','島根県',1),
(1723,'33',12301,'',0,'岡山','岡山県',1),
(1724,'34',12301,'',0,'広島','広島県',1),
(1725,'35',12301,'',0,'山口','山口県',1),
(1726,'36',12301,'',0,'徳島','徳島県',1),
(1727,'37',12301,'',0,'香川','香川県',1),
(1728,'38',12301,'',0,'愛媛','愛媛県',1),
(1729,'39',12301,'',0,'高知','高知県',1),
(1730,'40',12301,'',0,'福岡','福岡県',1),
(1731,'41',12301,'',0,'佐賀','佐賀県',1),
(1732,'42',12301,'',0,'長崎','長崎県',1),
(1733,'43',12301,'',0,'熊本','熊本県',1),
(1734,'44',12301,'',0,'大分','大分県',1),
(1735,'45',12301,'',0,'宮崎','宮崎県',1),
(1736,'46',12301,'',0,'鹿児島','鹿児島県',1),
(1737,'47',12301,'',0,'沖縄','沖縄県',1),
(1738,'TR-01',22104,NULL,NULL,NULL,'Adana',1),
(1739,'TR-02',22107,NULL,NULL,NULL,'Adıyaman',1),
(1740,'TR-03',22103,NULL,NULL,NULL,'Afyon',1),
(1741,'TR-04',22107,NULL,NULL,NULL,'Ağrı',1),
(1742,'TR-05',22106,NULL,NULL,NULL,'Amasya',1),
(1743,'TR-06',22102,NULL,NULL,NULL,'Ankara',1),
(1744,'TR-07',22104,NULL,NULL,NULL,'Antalya',1),
(1745,'TR-08',22106,NULL,NULL,NULL,'Artvin',1),
(1746,'TR-09',22103,NULL,NULL,NULL,'Aydın',1),
(1747,'TR-10',22101,NULL,NULL,NULL,'Balıkesir',1),
(1748,'TR-11',22101,NULL,NULL,NULL,'Bilecik',1),
(1749,'TR-12',22107,NULL,NULL,NULL,'Bingöl',1),
(1750,'TR-13',22107,NULL,NULL,NULL,'Bitlis',1),
(1751,'TR-14',22106,NULL,NULL,NULL,'Bolu',1),
(1752,'TR-15',22104,NULL,NULL,NULL,'Burdur',1),
(1753,'TR-16',22101,NULL,NULL,NULL,'Bursa',1),
(1754,'TR-17',22101,NULL,NULL,NULL,'Çanakkale',1),
(1755,'TR-18',22102,NULL,NULL,NULL,'Çankırı',1),
(1756,'TR-19',22106,NULL,NULL,NULL,'Çorum',1),
(1757,'TR-20',22104,NULL,NULL,NULL,'Denizli',1),
(1758,'TR-21',22105,NULL,NULL,NULL,'Diyarbakır',1),
(1759,'TR-22',22101,NULL,NULL,NULL,'Edirne',1),
(1760,'TR-23',22107,NULL,NULL,NULL,'Elazığ',1),
(1761,'TR-24',22107,NULL,NULL,NULL,'Erzincan',1),
(1762,'TR-25',22107,NULL,NULL,NULL,'Erzurum',1),
(1763,'TR-26',22102,NULL,NULL,NULL,'Eskişehir',1),
(1764,'TR-27',22105,NULL,NULL,NULL,'Gaziantep',1),
(1765,'TR-28',22106,NULL,NULL,NULL,'Giresun',1),
(1766,'TR-29',22106,NULL,NULL,NULL,'Gümüşhane',1),
(1767,'TR-30',22107,NULL,NULL,NULL,'Hakkari',1),
(1768,'TR-31',22104,NULL,NULL,NULL,'Hatay',1),
(1769,'TR-32',22104,NULL,NULL,NULL,'Isparta',1),
(1770,'TR-33',22104,NULL,NULL,NULL,'İçel',1),
(1771,'TR-34',22101,NULL,NULL,NULL,'İstanbul',1),
(1772,'TR-35',22103,NULL,NULL,NULL,'İzmir',1),
(1773,'TR-36',22107,NULL,NULL,NULL,'Kars',1),
(1774,'TR-37',22106,NULL,NULL,NULL,'Kastamonu',1),
(1775,'TR-38',22102,NULL,NULL,NULL,'Kayseri',1),
(1776,'TR-39',22101,NULL,NULL,NULL,'Kırklareli',1),
(1777,'TR-40',22102,NULL,NULL,NULL,'Kırşehir',1),
(1778,'TR-41',22101,NULL,NULL,NULL,'Kocaeli',1),
(1779,'TR-42',22102,NULL,NULL,NULL,'Konya',1),
(1780,'TR-43',22103,NULL,NULL,NULL,'Kütahya',1),
(1781,'TR-44',22107,NULL,NULL,NULL,'Malatya',1),
(1782,'TR-45',22103,NULL,NULL,NULL,'Manisa',1),
(1783,'TR-46',22104,NULL,NULL,NULL,'Kahramanmaraş',1),
(1784,'TR-47',22105,NULL,NULL,NULL,'Mardin',1),
(1785,'TR-48',22103,NULL,NULL,NULL,'Muğla',1),
(1786,'TR-49',22107,NULL,NULL,NULL,'Muş',1),
(1787,'TR-50',22102,NULL,NULL,NULL,'Nevşehir',1),
(1788,'TR-51',22102,NULL,NULL,NULL,'Niğde',1),
(1789,'TR-52',22106,NULL,NULL,NULL,'Ordu',1),
(1790,'TR-53',22106,NULL,NULL,NULL,'Rize',1),
(1791,'TR-54',22101,NULL,NULL,NULL,'Sakarya',1),
(1792,'TR-55',22106,NULL,NULL,NULL,'Samsun',1),
(1793,'TR-56',22105,NULL,NULL,NULL,'Siirt',1),
(1794,'TR-57',22106,NULL,NULL,NULL,'Sinop',1),
(1795,'TR-58',22102,NULL,NULL,NULL,'Sivas',1),
(1796,'TR-59',22101,NULL,NULL,NULL,'Tekirdağ',1),
(1797,'TR-60',22106,NULL,NULL,NULL,'Tokat',1),
(1798,'TR-61',22106,NULL,NULL,NULL,'Trabzon',1),
(1799,'TR-62',22107,NULL,NULL,NULL,'Tunceli',1),
(1800,'TR-63',22105,NULL,NULL,NULL,'Şanlıurfa',1),
(1801,'TR-63',22103,NULL,NULL,NULL,'Uşak',1),
(1802,'TR-65',22107,NULL,NULL,NULL,'Van',1),
(1803,'TR-66',22102,NULL,NULL,NULL,'Yozgat',1),
(1804,'TR-67',22106,NULL,NULL,NULL,'Zonguldak',1),
(1805,'TR-68',22102,NULL,NULL,NULL,'Aksaray',1),
(1806,'TR-69',22106,NULL,NULL,NULL,'Bayburt',1),
(1807,'TR-70',22102,NULL,NULL,NULL,'Karaman',1),
(1808,'TR-71',22102,NULL,NULL,NULL,'Kırıkkale',1),
(1809,'TR-72',22105,NULL,NULL,NULL,'Batman',1),
(1810,'TR-73',22105,NULL,NULL,NULL,'Şırnak',1),
(1811,'TR-74',22106,NULL,NULL,NULL,'Bartın',1),
(1812,'TR-75',22107,NULL,NULL,NULL,'Ardahan',1),
(1813,'TR-76',22107,NULL,NULL,NULL,'Iğdır',1),
(1814,'TR-77',22101,NULL,NULL,NULL,'Yalova',1),
(1815,'TR-78',22106,NULL,NULL,NULL,'Karabük',1),
(1816,'TR-79',22105,NULL,NULL,NULL,'Kilis',1),
(1817,'TR-80',22104,NULL,NULL,NULL,'Osmaniye',1),
(1818,'TR-81',22106,NULL,NULL,NULL,'Düzce',1);
/*!40000 ALTER TABLE `llx_c_departements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ecotaxe`
--

DROP TABLE IF EXISTS `llx_c_ecotaxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ecotaxe` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_ecotaxe` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ecotaxe`
--

LOCK TABLES `llx_c_ecotaxe` WRITE;
/*!40000 ALTER TABLE `llx_c_ecotaxe` DISABLE KEYS */;
INSERT INTO `llx_c_ecotaxe` VALUES
(1,'25040','PETIT APPAREILS MENAGERS',0.25000000,'Eco-systèmes',1,1),
(2,'25050','TRES PETIT APPAREILS MENAGERS',0.08000000,'Eco-systèmes',1,1),
(3,'32070','ECRAN POIDS < 5 KG',2.08000000,'Eco-systèmes',1,1),
(4,'32080','ECRAN POIDS > 5 KG',1.25000000,'Eco-systèmes',1,1),
(5,'32051','ORDINATEUR PORTABLE',0.42000000,'Eco-systèmes',1,1),
(6,'32061','TABLETTE INFORMATIQUE',0.84000000,'Eco-systèmes',1,1),
(7,'36011','ORDINATEUR FIXE (UC)',1.15000000,'Eco-systèmes',1,1),
(8,'36021','IMPRIMANTES',0.83000000,'Eco-systèmes',1,1),
(9,'36030','IT (INFORMATIQUE ET TELECOMS)',0.83000000,'Eco-systèmes',1,1),
(10,'36040','PETIT IT (CLAVIERS / SOURIS)',0.08000000,'Eco-systèmes',1,1),
(11,'36050','TELEPHONIE MOBILE',0.02000000,'Eco-systèmes',1,1),
(12,'36060','CONNECTIQUE CABLES',0.02000000,'Eco-systèmes',1,1),
(13,'45010','GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)',1.67000000,'Eco-systèmes',1,1),
(14,'45020','MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)',0.42000000,'Eco-systèmes',1,1),
(15,'45030','PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)',0.08000000,'Eco-systèmes',1,1),
(16,'75030','JOUETS < 0,5 KG',0.08000000,'Eco-systèmes',1,1),
(17,'75040','JOUETS ENTRE 0,5 KG ET 10 KG',0.17000000,'Eco-systèmes',1,1),
(18,'74050','JOUETS > 10 KG',1.67000000,'Eco-systèmes',1,1),
(19,'85010','EQUIPEMENT MEDICAL < 0,5 KG',0.08000000,'Eco-systèmes',1,1);
/*!40000 ALTER TABLE `llx_c_ecotaxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_effectif`
--

DROP TABLE IF EXISTS `llx_c_effectif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_effectif` (
  `id` int NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_effectif` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_effectif`
--

LOCK TABLES `llx_c_effectif` WRITE;
/*!40000 ALTER TABLE `llx_c_effectif` DISABLE KEYS */;
INSERT INTO `llx_c_effectif` VALUES
(0,'EF0','-',1,NULL),
(1,'EF1-5','1 - 5',1,NULL),
(2,'EF6-10','6 - 10',1,NULL),
(3,'EF11-50','11 - 50',1,NULL),
(4,'EF51-100','51 - 100',1,NULL),
(5,'EF101-500','101 - 500',1,NULL),
(6,'EF500-','> 500',1,NULL);
/*!40000 ALTER TABLE `llx_c_effectif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_email_senderprofile`
--

DROP TABLE IF EXISTS `llx_c_email_senderprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_email_senderprofile` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `private` smallint NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `signature` text,
  `position` smallint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_email_senderprofile`
--

LOCK TABLES `llx_c_email_senderprofile` WRITE;
/*!40000 ALTER TABLE `llx_c_email_senderprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_email_senderprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_email_templates`
--

DROP TABLE IF EXISTS `llx_c_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_email_templates` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `type_template` varchar(32) DEFAULT NULL,
  `lang` varchar(6) DEFAULT '',
  `private` smallint NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(180) DEFAULT NULL,
  `position` smallint DEFAULT NULL,
  `defaultfortype` smallint DEFAULT '0',
  `enabled` varchar(255) DEFAULT '1',
  `active` tinyint NOT NULL DEFAULT '1',
  `email_from` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `topic` text,
  `joinfiles` text,
  `content` mediumtext,
  `content_lines` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  KEY `idx_type` (`type_template`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_email_templates`
--

LOCK TABLES `llx_c_email_templates` WRITE;
/*!40000 ALTER TABLE `llx_c_email_templates` DISABLE KEYS */;
INSERT INTO `llx_c_email_templates` VALUES
(1,0,'banque','thirdparty','',0,NULL,NULL,'2023-11-22 09:05:55','(YourSEPAMandate)',1,0,'isModEnabled(\"societe\") && isModEnabled(\"banque\") && isModEnabled(\"prelevement\")',0,NULL,NULL,NULL,NULL,'__(YourSEPAMandate)__','0','__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\n__USER_SIGNATURE__',NULL),
(2,0,'adherent','member','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnAutoSubscription)',10,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(3,0,'adherent','member','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnMemberValidation)',20,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__(FirstName)__ : __MEMBER_FIRSTNAME__<br>__(LastName)__ : __MEMBER_LASTNAME__<br>__(ID)__ : __MEMBER_ID__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(4,0,'adherent','member','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnNewSubscription)',30,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__','1','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(5,0,'adherent','member','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingReminderForExpiredSubscription)',40,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(6,0,'adherent','member','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnCancelation)',50,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__','0','__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(7,0,'adherent','member','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingAnEMailToMember)',60,0,'isModEnabled(\"adherent\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__','0','__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civility)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(8,0,'recruitment','recruitmentcandidature_send','',0,NULL,NULL,'2023-11-22 09:05:55','(AnswerCandidature)',100,0,'isModEnabled(\"recruitment\")',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__','0','__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswerMessage)__<br>__ONLINE_INTERVIEW_SCHEDULER_TEXT_AND_URL__\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL),
(9,0,'','conferenceorbooth','',0,NULL,NULL,'2023-11-22 09:05:55','(EventOrganizationEmailAskConf)',10,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskConf)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventConfRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),
(10,0,'','conferenceorbooth','',0,NULL,NULL,'2023-11-22 09:05:55','(EventOrganizationEmailAskBooth)',20,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskBooth)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBoothRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),
(11,0,'','conferenceorbooth','',0,NULL,NULL,'2023-11-22 09:05:55','(EventOrganizationEmailBoothPayment)',30,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailBoothPayment)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfBoothWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),
(12,0,'','conferenceorbooth','',0,NULL,NULL,'2023-11-22 09:05:55','(EventOrganizationEmailRegistrationPayment)',40,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailRegistrationPayment)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfRegistrationWasReceived)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),
(13,0,'','conferenceorbooth','',0,NULL,NULL,'2023-11-22 09:05:55','(EventOrganizationMassEmailAttendees)',50,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailAttendees)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToAttendees)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),
(14,0,'','conferenceorbooth','',0,NULL,NULL,'2023-11-22 09:05:55','(EventOrganizationMassEmailSpeakers)',60,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailSpeakers)__',NULL,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToSpeakers)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL),
(15,0,'partnership','partnership_send','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnPartnershipWillSoonBeCanceled)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipWillSoonBeCanceledTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipWillSoonBeCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(16,0,'partnership','partnership_send','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnPartnershipCanceled)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipCanceledTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(17,0,'partnership','partnership_send','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnPartnershipRefused)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipRefusedTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipRefusedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL),
(18,0,'partnership','partnership_send','',0,NULL,NULL,'2023-11-22 09:05:55','(SendingEmailOnPartnershipAccepted)',100,0,'1',1,NULL,NULL,NULL,NULL,'[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipAcceptedTopic)__','0','<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipAcceptedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL);
/*!40000 ALTER TABLE `llx_c_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_exp_tax_cat`
--

DROP TABLE IF EXISTS `llx_c_exp_tax_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_exp_tax_cat` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_exp_tax_cat`
--

LOCK TABLES `llx_c_exp_tax_cat` WRITE;
/*!40000 ALTER TABLE `llx_c_exp_tax_cat` DISABLE KEYS */;
INSERT INTO `llx_c_exp_tax_cat` VALUES
(1,'ExpAutoCat',1,0),
(2,'ExpCycloCat',1,0),
(3,'ExpMotoCat',1,0),
(4,'ExpAuto3CV',1,1),
(5,'ExpAuto4CV',1,1),
(6,'ExpAuto5CV',1,1),
(7,'ExpAuto6CV',1,1),
(8,'ExpAuto7CV',1,1),
(9,'ExpAuto8CV',1,1),
(10,'ExpAuto9CV',1,0),
(11,'ExpAuto10CV',1,0),
(12,'ExpAuto11CV',1,0),
(13,'ExpAuto12CV',1,0),
(14,'ExpAuto3PCV',1,0),
(15,'ExpAuto4PCV',1,0),
(16,'ExpAuto5PCV',1,0),
(17,'ExpAuto6PCV',1,0),
(18,'ExpAuto7PCV',1,0),
(19,'ExpAuto8PCV',1,0),
(20,'ExpAuto9PCV',1,0),
(21,'ExpAuto10PCV',1,0),
(22,'ExpAuto11PCV',1,0),
(23,'ExpAuto12PCV',1,0),
(24,'ExpAuto13PCV',1,0),
(25,'ExpCyclo',1,0),
(26,'ExpMoto12CV',1,0),
(27,'ExpMoto345CV',1,0),
(28,'ExpMoto5PCV',1,0);
/*!40000 ALTER TABLE `llx_c_exp_tax_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_exp_tax_range`
--

DROP TABLE IF EXISTS `llx_c_exp_tax_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_exp_tax_range` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_c_exp_tax_cat` int NOT NULL DEFAULT '1',
  `range_ik` double NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_exp_tax_range`
--

LOCK TABLES `llx_c_exp_tax_range` WRITE;
/*!40000 ALTER TABLE `llx_c_exp_tax_range` DISABLE KEYS */;
INSERT INTO `llx_c_exp_tax_range` VALUES
(1,4,0,1,1),
(2,4,5000,1,1),
(3,4,20000,1,1),
(4,5,0,1,1),
(5,5,5000,1,1),
(6,5,20000,1,1),
(7,6,0,1,1),
(8,6,5000,1,1),
(9,6,20000,1,1),
(10,7,0,1,1),
(11,7,5000,1,1),
(12,7,20000,1,1),
(13,8,0,1,1),
(14,8,5000,1,1),
(15,8,20000,1,1);
/*!40000 ALTER TABLE `llx_c_exp_tax_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_field_list`
--

DROP TABLE IF EXISTS `llx_c_field_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_field_list` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `element` varchar(64) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint NOT NULL DEFAULT '1',
  `search` tinyint NOT NULL DEFAULT '0',
  `visible` tinyint NOT NULL DEFAULT '1',
  `enabled` varchar(255) DEFAULT '1',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_field_list`
--

LOCK TABLES `llx_c_field_list` WRITE;
/*!40000 ALTER TABLE `llx_c_field_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_field_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_format_cards`
--

DROP TABLE IF EXISTS `llx_c_format_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_format_cards` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paper_size` varchar(20) NOT NULL,
  `orientation` varchar(1) NOT NULL,
  `metric` varchar(5) NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int NOT NULL,
  `ny` int NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_format_cards`
--

LOCK TABLES `llx_c_format_cards` WRITE;
/*!40000 ALTER TABLE `llx_c_format_cards` DISABLE KEYS */;
INSERT INTO `llx_c_format_cards` VALUES
(1,'5160','Avery-5160, WL-875WX','letter','P','mm',5.58165000,12.70000000,3,10,3.55600000,0.00000000,65.87490000,25.40000000,7,0.00000000,0.00000000,1),
(2,'5161','Avery-5161, WL-75WX','letter','P','mm',4.44500000,12.70000000,2,10,3.96800000,0.00000000,101.60000000,25.40000000,7,0.00000000,0.00000000,1),
(3,'5162','Avery-5162, WL-100WX','letter','P','mm',3.87350000,22.35200000,2,7,4.95400000,0.00000000,101.60000000,33.78100000,8,0.00000000,0.00000000,1),
(4,'5163','Avery-5163, WL-125WX','letter','P','mm',4.57200000,12.70000000,2,5,3.55600000,0.00000000,101.60000000,50.80000000,10,0.00000000,0.00000000,1),
(5,'5164','Avery-5164 (inch)','letter','P','in',0.14800000,0.50000000,2,3,0.20310000,0.00000000,4.00000000,3.33000000,12,0.00000000,0.00000000,0),
(6,'8600','Avery-8600','letter','P','mm',7.10000000,19.00000000,3,10,9.50000000,3.10000000,66.60000000,25.40000000,7,0.00000000,0.00000000,1),
(7,'99012','DYMO 99012 89*36mm','custom','L','mm',1.00000000,1.00000000,1,1,0.00000000,0.00000000,36.00000000,89.00000000,10,36.00000000,89.00000000,1),
(8,'99014','DYMO 99014 101*54mm','custom','L','mm',1.00000000,1.00000000,1,1,0.00000000,0.00000000,54.00000000,101.00000000,10,54.00000000,101.00000000,1),
(9,'AVERYC32010','Avery-C32010','A4','P','mm',15.00000000,13.00000000,2,5,10.00000000,0.00000000,85.00000000,54.00000000,10,0.00000000,0.00000000,1),
(10,'CARD','Dolibarr Business cards','A4','P','mm',15.00000000,15.00000000,2,5,0.00000000,0.00000000,85.00000000,54.00000000,10,0.00000000,0.00000000,1),
(11,'L7163','Avery-L7163','A4','P','mm',5.00000000,15.00000000,2,7,2.50000000,0.00000000,99.10000000,38.10000000,8,0.00000000,0.00000000,1);
/*!40000 ALTER TABLE `llx_c_format_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_forme_juridique`
--

DROP TABLE IF EXISTS `llx_c_forme_juridique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_forme_juridique` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `fk_pays` int NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_forme_juridique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_forme_juridique`
--

LOCK TABLES `llx_c_forme_juridique` WRITE;
/*!40000 ALTER TABLE `llx_c_forme_juridique` DISABLE KEYS */;
INSERT INTO `llx_c_forme_juridique` VALUES
(1,0,0,'-',0,1,NULL,0),
(2,2301,23,'Monotributista',0,1,NULL,0),
(3,2302,23,'Sociedad Civil',0,1,NULL,0),
(4,2303,23,'Sociedades Comerciales',0,1,NULL,0),
(5,2304,23,'Sociedades de Hecho',0,1,NULL,0),
(6,2305,23,'Sociedades Irregulares',0,1,NULL,0),
(7,2306,23,'Sociedad Colectiva',0,1,NULL,0),
(8,2307,23,'Sociedad en Comandita Simple',0,1,NULL,0),
(9,2308,23,'Sociedad de Capital e Industria',0,1,NULL,0),
(10,2309,23,'Sociedad Accidental o en participación',0,1,NULL,0),
(11,2310,23,'Sociedad de Responsabilidad Limitada',0,1,NULL,0),
(12,2311,23,'Sociedad Anónima',0,1,NULL,0),
(13,2312,23,'Sociedad Anónima con Participación Estatal Mayoritaria',0,1,NULL,0),
(14,2313,23,'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)',0,1,NULL,0),
(15,4100,41,'GmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL,0),
(16,4101,41,'GesmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL,0),
(17,4102,41,'AG - Aktiengesellschaft',0,1,NULL,0),
(18,4103,41,'EWIV - Europäische wirtschaftliche Interessenvereinigung',0,1,NULL,0),
(19,4104,41,'KEG - Kommanditerwerbsgesellschaft',0,1,NULL,0),
(20,4105,41,'OEG - Offene Erwerbsgesellschaft',0,1,NULL,0),
(21,4106,41,'OHG - Offene Handelsgesellschaft',0,1,NULL,0),
(22,4107,41,'AG & Co KG - Kommanditgesellschaft',0,1,NULL,0),
(23,4108,41,'GmbH & Co KG - Kommanditgesellschaft',0,1,NULL,0),
(24,4109,41,'KG - Kommanditgesellschaft',0,1,NULL,0),
(25,4110,41,'OG - Offene Gesellschaft',0,1,NULL,0),
(26,4111,41,'GbR - Gesellschaft nach bürgerlichem Recht',0,1,NULL,0),
(27,4112,41,'GesbR - Gesellschaft nach bürgerlichem Recht',0,1,NULL,0),
(28,4113,41,'GesnbR - Gesellschaft nach bürgerlichem Recht',0,1,NULL,0),
(29,4114,41,'e.U. - eingetragener Einzelunternehmer',0,1,NULL,0),
(30,200,2,'Indépendant',0,1,NULL,0),
(31,201,2,'SRL - Société à responsabilité limitée',0,1,NULL,0),
(32,202,2,'SA   - Société Anonyme',0,1,NULL,0),
(33,203,2,'SCRL - Société coopérative à responsabilité limitée',0,1,NULL,0),
(34,204,2,'ASBL - Association sans but Lucratif',0,1,NULL,0),
(35,205,2,'SCRI - Société coopérative à responsabilité illimitée',0,1,NULL,0),
(36,206,2,'SCS  - Société en commandite simple',0,1,NULL,0),
(37,207,2,'SCA  - Société en commandite par action',0,1,NULL,0),
(38,208,2,'SNC  - Société en nom collectif',0,1,NULL,0),
(39,209,2,'GIE  - Groupement d intérêt économique',0,1,NULL,0),
(40,210,2,'GEIE - Groupement européen d intérêt économique',0,1,NULL,0),
(41,220,2,'Eenmanszaak',0,1,NULL,0),
(42,221,2,'BVBA - Besloten vennootschap met beperkte aansprakelijkheid',0,1,NULL,0),
(43,222,2,'NV   - Naamloze Vennootschap',0,1,NULL,0),
(44,223,2,'CVBA - Coöperatieve vennootschap met beperkte aansprakelijkheid',0,1,NULL,0),
(45,224,2,'VZW  - Vereniging zonder winstoogmerk',0,1,NULL,0),
(46,225,2,'CVOA - Coöperatieve vennootschap met onbeperkte aansprakelijkheid ',0,1,NULL,0),
(47,226,2,'GCV  - Gewone commanditaire vennootschap',0,1,NULL,0),
(48,227,2,'Comm.VA - Commanditaire vennootschap op aandelen',0,1,NULL,0),
(49,228,2,'VOF  - Vennootschap onder firma',0,1,NULL,0),
(50,229,2,'VS0  - Vennootschap met sociaal oogmerk',0,1,NULL,0),
(52,10,1,'Entrepreneur individuel',0,1,NULL,0),
(53,21,1,'Indivision',0,1,NULL,0),
(54,22,1,'Société créée de fait',0,1,NULL,0),
(55,23,1,'Société en participation',0,1,NULL,0),
(56,24,1,'Fiducie',0,1,NULL,0),
(57,27,1,'Paroisse hors zone concordataire',0,1,NULL,0),
(58,28,1,'Assujetti unique à la TVA',0,1,NULL,0),
(59,29,1,'Autre groupement de droit privé non doté de la personnalité morale',0,1,NULL,0),
(60,31,1,'Personne morale de droit étranger, immatriculée au RCS',0,1,NULL,0),
(61,32,1,'Personne morale de droit étranger, non immatriculée au RCS',0,1,NULL,0),
(62,41,1,'Etablissement public ou régie à caractère industriel ou commercial',0,1,NULL,0),
(63,51,1,'Société coopérative commerciale particulière',0,1,NULL,0),
(64,52,1,'Société en nom collectif',0,1,NULL,0),
(65,53,1,'Société en commandite',0,1,NULL,0),
(66,54,1,'Société à responsabilité limitée (SARL)',0,1,NULL,0),
(67,55,1,'Société anonyme à conseil d\'administration',0,1,NULL,0),
(68,56,1,'Société anonyme à directoire',0,1,NULL,0),
(69,57,1,'Société par actions simplifiée (SAS)',0,1,NULL,0),
(70,58,1,'Société européenne',0,1,NULL,0),
(71,61,1,'Caisse d\'épargne et de prévoyance',0,1,NULL,0),
(72,62,1,'Groupement d\'intérêt économique (GIE)',0,1,NULL,0),
(73,63,1,'Société coopérative agricole',0,1,NULL,0),
(74,64,1,'Société d\'assurance mutuelle',0,1,NULL,0),
(75,65,1,'Société civile',0,1,NULL,0),
(76,69,1,'Autre personne morale de droit privé inscrite au RCS',0,1,NULL,0),
(77,71,1,'Administration de l état',0,1,NULL,0),
(78,72,1,'Collectivité territoriale',0,1,NULL,0),
(79,73,1,'Etablissement public administratif',0,1,NULL,0),
(80,74,1,'Personne morale de droit public administratif',0,1,NULL,0),
(81,81,1,'Organisme gérant régime de protection social à adhésion obligatoire',0,1,NULL,0),
(82,82,1,'Organisme mutualiste',0,1,NULL,0),
(83,83,1,'Comité d entreprise',0,1,NULL,0),
(84,84,1,'Organisme professionnel',0,1,NULL,0),
(85,85,1,'Organisme de retraite à adhésion non obligatoire',0,1,NULL,0),
(86,91,1,'Syndicat de propriétaires',0,1,NULL,0),
(87,92,1,'Association loi 1901 ou assimilé',0,1,NULL,0),
(88,93,1,'Fondation',0,1,NULL,0),
(89,99,1,'Autre personne morale de droit privé',0,1,NULL,0),
(90,500,5,'GmbH - Gesellschaft mit beschränkter Haftung',0,1,NULL,0),
(91,501,5,'AG - Aktiengesellschaft ',0,1,NULL,0),
(92,502,5,'GmbH&Co. KG - Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft',0,1,NULL,0),
(93,503,5,'Gewerbe - Personengesellschaft',0,1,NULL,0),
(94,504,5,'UG - Unternehmergesellschaft -haftungsbeschränkt-',0,1,NULL,0),
(95,505,5,'GbR - Gesellschaft des bürgerlichen Rechts',0,1,NULL,0),
(96,506,5,'KG - Kommanditgesellschaft',0,1,NULL,0),
(97,507,5,'Ltd. - Limited Company',0,1,NULL,0),
(98,508,5,'OHG - Offene Handelsgesellschaft',0,1,NULL,0),
(99,509,5,'eG - eingetragene Genossenschaft',0,1,NULL,0),
(100,8001,80,'Aktieselvskab A/S',0,1,NULL,0),
(101,8002,80,'Anparts Selvskab ApS',0,1,NULL,0),
(102,8003,80,'Personlig ejet selvskab',0,1,NULL,0),
(103,8004,80,'Iværksætterselvskab IVS',0,1,NULL,0),
(104,8005,80,'Interessentskab I/S',0,1,NULL,0),
(105,8006,80,'Holdingselskab',0,1,NULL,0),
(106,8007,80,'Selskab Med Begrænset Hæftelse SMBA',0,1,NULL,0),
(107,8008,80,'Kommanditselskab K/S',0,1,NULL,0),
(108,8009,80,'SPE-selskab',0,1,NULL,0),
(109,10201,102,'Ατομική επιχείρηση',0,1,NULL,0),
(110,10202,102,'Εταιρική  επιχείρηση',0,1,NULL,0),
(111,10203,102,'Ομόρρυθμη Εταιρεία Ο.Ε',0,1,NULL,0),
(112,10204,102,'Ετερόρρυθμη Εταιρεία Ε.Ε',0,1,NULL,0),
(113,10205,102,'Εταιρεία Περιορισμένης Ευθύνης Ε.Π.Ε',0,1,NULL,0),
(114,10206,102,'Ανώνυμη Εταιρεία Α.Ε',0,1,NULL,0),
(115,10207,102,'Ανώνυμη ναυτιλιακή εταιρεία Α.Ν.Ε',0,1,NULL,0),
(116,10208,102,'Συνεταιρισμός',0,1,NULL,0),
(117,10209,102,'Συμπλοιοκτησία',0,1,NULL,0),
(118,301,3,'Società semplice',0,1,NULL,0),
(119,302,3,'Società in nome collettivo s.n.c.',0,1,NULL,0),
(120,303,3,'Società in accomandita semplice s.a.s.',0,1,NULL,0),
(121,304,3,'Società per azioni s.p.a.',0,1,NULL,0),
(122,305,3,'Società a responsabilità limitata s.r.l.',0,1,NULL,0),
(123,306,3,'Società in accomandita per azioni s.a.p.a.',0,1,NULL,0),
(124,307,3,'Società cooperativa a r.l.',0,1,NULL,0),
(125,308,3,'Società consortile',0,1,NULL,0),
(126,309,3,'Società europea',0,1,NULL,0),
(127,310,3,'Società cooperativa europea',0,1,NULL,0),
(128,311,3,'Società unipersonale',0,1,NULL,0),
(129,312,3,'Società di professionisti',0,1,NULL,0),
(130,313,3,'Società di fatto',0,1,NULL,0),
(131,315,3,'Società apparente',0,1,NULL,0),
(132,316,3,'Impresa individuale ',0,1,NULL,0),
(133,317,3,'Impresa coniugale',0,1,NULL,0),
(134,318,3,'Impresa familiare',0,1,NULL,0),
(135,319,3,'Consorzio cooperativo',0,1,NULL,0),
(136,320,3,'Società cooperativa sociale',0,1,NULL,0),
(137,321,3,'Società cooperativa di consumo',0,1,NULL,0),
(138,322,3,'Società cooperativa agricola',0,1,NULL,0),
(139,323,3,'A.T.I. Associazione temporanea di imprese',0,1,NULL,0),
(140,324,3,'R.T.I. Raggruppamento temporaneo di imprese',0,1,NULL,0),
(141,325,3,'Studio associato',0,1,NULL,0),
(142,600,6,'Raison Individuelle',0,1,NULL,0),
(143,601,6,'Société Simple',0,1,NULL,0),
(144,602,6,'Société en nom collectif',0,1,NULL,0),
(145,603,6,'Société en commandite',0,1,NULL,0),
(146,604,6,'Société anonyme (SA)',0,1,NULL,0),
(147,605,6,'Société en commandite par actions',0,1,NULL,0),
(148,606,6,'Société à responsabilité limitée (SARL)',0,1,NULL,0),
(149,607,6,'Société coopérative',0,1,NULL,0),
(150,608,6,'Association',0,1,NULL,0),
(151,609,6,'Fondation',0,1,NULL,0),
(152,700,7,'Sole Trader',0,1,NULL,0),
(153,701,7,'Partnership',0,1,NULL,0),
(154,702,7,'Private Limited Company by shares (LTD)',0,1,NULL,0),
(155,703,7,'Public Limited Company',0,1,NULL,0),
(156,704,7,'Workers Cooperative',0,1,NULL,0),
(157,705,7,'Limited Liability Partnership',0,1,NULL,0),
(158,706,7,'Franchise',0,1,NULL,0),
(159,1000,10,'Société à responsabilité limitée (SARL)',0,1,NULL,0),
(160,1001,10,'Société en Nom Collectif (SNC)',0,1,NULL,0),
(161,1002,10,'Société en Commandite Simple (SCS)',0,1,NULL,0),
(162,1003,10,'société en participation',0,1,NULL,0),
(163,1004,10,'Société Anonyme (SA)',0,1,NULL,0),
(164,1005,10,'Société Unipersonnelle à Responsabilité Limitée (SUARL)',0,1,NULL,0),
(165,1006,10,'Groupement d\'intérêt économique (GEI)',0,1,NULL,0),
(166,1007,10,'Groupe de sociétés',0,1,NULL,0),
(167,1701,17,'Eenmanszaak',0,1,NULL,0),
(168,1702,17,'Maatschap',0,1,NULL,0),
(169,1703,17,'Vennootschap onder firma',0,1,NULL,0),
(170,1704,17,'Commanditaire vennootschap',0,1,NULL,0),
(171,1705,17,'Besloten vennootschap (BV)',0,1,NULL,0),
(172,1706,17,'Naamloze Vennootschap (NV)',0,1,NULL,0),
(173,1707,17,'Vereniging',0,1,NULL,0),
(174,1708,17,'Stichting',0,1,NULL,0),
(175,1709,17,'Coöperatie met beperkte aansprakelijkheid (BA)',0,1,NULL,0),
(176,1710,17,'Coöperatie met uitgesloten aansprakelijkheid (UA)',0,1,NULL,0),
(177,1711,17,'Coöperatie met wettelijke aansprakelijkheid (WA)',0,1,NULL,0),
(178,1712,17,'Onderlinge waarborgmaatschappij',0,1,NULL,0),
(179,401,4,'Empresario Individual',0,1,NULL,0),
(180,402,4,'Comunidad de Bienes',0,1,NULL,0),
(181,403,4,'Sociedad Civil',0,1,NULL,0),
(182,404,4,'Sociedad Colectiva',0,1,NULL,0),
(183,405,4,'Sociedad Limitada',0,1,NULL,0),
(184,406,4,'Sociedad Anónima',0,1,NULL,0),
(185,407,4,'Sociedad Comanditaria por Acciones',0,1,NULL,0),
(186,408,4,'Sociedad Comanditaria Simple',0,1,NULL,0),
(187,409,4,'Sociedad Laboral',0,1,NULL,0),
(188,410,4,'Sociedad Cooperativa',0,1,NULL,0),
(189,411,4,'Sociedad de Garantía Recíproca',0,1,NULL,0),
(190,412,4,'Entidad de Capital-Riesgo',0,1,NULL,0),
(191,413,4,'Agrupación de Interés Económico',0,1,NULL,0),
(192,414,4,'Sociedad de Inversión Mobiliaria',0,1,NULL,0),
(193,415,4,'Agrupación sin Ánimo de Lucro',0,1,NULL,0),
(194,15201,152,'Mauritius Private Company Limited By Shares',0,1,NULL,0),
(195,15202,152,'Mauritius Company Limited By Guarantee',0,1,NULL,0),
(196,15203,152,'Mauritius Public Company Limited By Shares',0,1,NULL,0),
(197,15204,152,'Mauritius Foreign Company',0,1,NULL,0),
(198,15205,152,'Mauritius GBC1 (Offshore Company)',0,1,NULL,0),
(199,15206,152,'Mauritius GBC2 (International Company)',0,1,NULL,0),
(200,15207,152,'Mauritius General Partnership',0,1,NULL,0),
(201,15208,152,'Mauritius Limited Partnership',0,1,NULL,0),
(202,15209,152,'Mauritius Sole Proprietorship',0,1,NULL,0),
(203,15210,152,'Mauritius Trusts',0,1,NULL,0),
(204,15401,154,'601 - General de Ley Personas Morales',0,1,NULL,0),
(205,15402,154,'603 - Personas Morales con Fines no Lucrativos',0,1,NULL,0),
(206,15403,154,'605 - Sueldos y Salarios e Ingresos Asimilados a Salarios',0,1,NULL,0),
(207,15404,154,'606 - Arrendamiento',0,1,NULL,0),
(208,15405,154,'607 - Régimen de Enajenación o Adquisición de Bienes',0,1,NULL,0),
(209,15406,154,'608 - Demás ingresos',0,1,NULL,0),
(210,15407,154,'610 - Residentes en el Extranjero sin Establecimiento Permanente en México',0,1,NULL,0),
(211,15408,154,'611 - Ingresos por Dividendos (socios y accionistas)',0,1,NULL,0),
(212,15409,154,'612 - Personas Físicas con Actividades Empresariales y Profesionales',0,1,NULL,0),
(213,15410,154,'614 - Ingresos por intereses',0,1,NULL,0),
(214,15411,154,'615 - Régimen de los ingresos por obtención de premios',0,1,NULL,0),
(215,15412,154,'616 - Sin obligaciones fiscales',0,1,NULL,0),
(216,15413,154,'620 - Sociedades Cooperativas de Producción que optan por diferir sus ingresos',0,1,NULL,0),
(217,15414,154,'621 - Incorporación Fiscal',0,1,NULL,0),
(218,15415,154,'622 - Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras',0,1,NULL,0),
(219,15416,154,'623 - Opcional para Grupos de Sociedades',0,1,NULL,0),
(220,15417,154,'624 - Coordinados',0,1,NULL,0),
(221,15418,154,'625 - Régimen de las Actividades Empresariales con ingresos a través de Plataformas Tecnológicas',0,1,NULL,0),
(222,15419,154,'626 - Régimen Simplificado de Confianza',0,1,NULL,0),
(223,14001,140,'Entreprise individuelle',0,1,NULL,0),
(224,14002,140,'Société en nom collectif (SENC)',0,1,NULL,0),
(225,14003,140,'Société en commandite simple (SECS)',0,1,NULL,0),
(226,14004,140,'Société en commandite par actions (SECA)',0,1,NULL,0),
(227,14005,140,'Société à responsabilité limitée (SARL)',0,1,NULL,0),
(228,14006,140,'Société anonyme (SA)',0,1,NULL,0),
(229,14007,140,'Société coopérative (SC)',0,1,NULL,0),
(230,14008,140,'Société européenne (SE)',0,1,NULL,0),
(231,14009,140,'Société à responsabilité limitée simplifiée (SARL-S)',0,1,NULL,0),
(232,18801,188,'AFJ - Alte forme juridice',0,1,NULL,0),
(233,18802,188,'ASF - Asociatie familialã',0,1,NULL,0),
(234,18803,188,'CON - Concesiune',0,1,NULL,0),
(235,18804,188,'CRL - Soc civilã profesionala cu pers. juridica si rãspundere limitata (SPRL)',0,1,NULL,0),
(236,18805,188,'INC - Închiriere',0,1,NULL,0),
(237,18806,188,'LOC - Locaţie de gestiune',0,1,NULL,0),
(238,18807,188,'OC1 - Organizaţie cooperatistã meşteşugãreascã',0,1,NULL,0),
(239,18808,188,'OC2 - Organizaţie cooperatistã de consum',0,1,NULL,0),
(240,18809,188,'OC3 - Organizaţie cooperatistã de credit',0,1,NULL,0),
(241,18810,188,'PFA - Persoanã fizicã independentã',0,1,NULL,0),
(242,18811,188,'RA - Regie autonomã',0,1,NULL,0),
(243,18812,188,'SA - Societate comercialã pe acţiuni',0,1,NULL,0),
(244,18813,188,'SCS - Societate comercialã în comanditã simplã',0,1,NULL,0),
(245,18814,188,'SNC - Societate comercialã în nume colectiv',0,1,NULL,0),
(246,18815,188,'SPI - Societate profesionala practicieni in insolventa (SPPI)',0,1,NULL,0),
(247,18816,188,'SRL - Societate comercialã cu rãspundere limitatã',0,1,NULL,0),
(248,18817,188,'URL - Intreprindere profesionala unipersonala cu rãspundere limitata (IPURL)',0,1,NULL,0),
(249,17801,178,'Empresa individual',0,1,NULL,0),
(250,17802,178,'Asociación General',0,1,NULL,0),
(251,17803,178,'Sociedad de Responsabilidad Limitada',0,1,NULL,0),
(252,17804,178,'Sociedad Civil',0,1,NULL,0),
(253,17805,178,'Sociedad Anónima',0,1,NULL,0),
(254,1300,13,'Personne physique',0,1,NULL,0),
(255,1301,13,'Société à responsabilité limitée (SARL)',0,1,NULL,0),
(256,1302,13,'Entreprise unipersonnelle à responsabilité limitée (EURL)',0,1,NULL,0),
(257,1303,13,'Société en Nom Collectif (SNC)',0,1,NULL,0),
(258,1304,13,'société par actions (SPA)',0,1,NULL,0),
(259,1305,13,'Société en Commandite Simple (SCS)',0,1,NULL,0),
(260,1306,13,'Société en commandite par actions (SCA)',0,1,NULL,0),
(261,1307,13,'Société en participation',0,1,NULL,0),
(262,1308,13,'Groupe de sociétés',0,1,NULL,0),
(263,2001,20,'Aktiebolag',0,1,NULL,0),
(264,2002,20,'Publikt aktiebolag (AB publ)',0,1,NULL,0),
(265,2003,20,'Ekonomisk förening (ek. för.)',0,1,NULL,0),
(266,2004,20,'Bostadsrättsförening (BRF)',0,1,NULL,0),
(267,2005,20,'Hyresrättsförening (HRF)',0,1,NULL,0),
(268,2006,20,'Kooperativ',0,1,NULL,0),
(269,2007,20,'Enskild firma (EF)',0,1,NULL,0),
(270,2008,20,'Handelsbolag (HB)',0,1,NULL,0),
(271,2009,20,'Kommanditbolag (KB)',0,1,NULL,0),
(272,2010,20,'Enkelt bolag',0,1,NULL,0),
(273,2011,20,'Ideell förening',0,1,NULL,0),
(274,2012,20,'Stiftelse',0,1,NULL,0),
(275,6100,61,'Indépendant - Personne physique',0,1,NULL,0),
(276,6101,61,'Société Unipersonnelle',0,1,NULL,0),
(277,6102,61,'Société de personne à responsabilité limité (SPRL)',0,1,NULL,0),
(278,6103,61,'Société anonyme (SA)',0,1,NULL,0),
(279,6104,61,'Société coopérative',0,1,NULL,0),
(280,7601,76,'Društvo s ograničenom odgovornošću (d.o.o.)',0,1,NULL,0),
(281,7602,76,'Jednostavno društvo s ograničenom odgovornošću (j.d.o.o.)',0,1,NULL,0),
(282,7603,76,'Dioničko društvo (d.d.)',0,1,NULL,0),
(283,7604,76,'Obrt',0,1,NULL,0),
(284,7605,76,'Javno trgovačko društvo (j.t.d.)',0,1,NULL,0),
(285,7606,76,'Komanditno društvo (k.d.)',0,1,NULL,0),
(286,7607,76,'Gospodarsko interesno udruženje (GIU)',0,1,NULL,0),
(287,7608,76,'Predstavništvo',0,1,NULL,0),
(288,7609,76,'Državno tijelo',0,1,NULL,0),
(289,7610,76,'Kućna radinost',0,1,NULL,0),
(290,7611,76,'Sporedno zanimanje',0,1,NULL,0),
(291,12301,123,'株式会社',0,1,NULL,0),
(292,12302,123,'有限会社',0,1,NULL,0),
(293,12303,123,'合資会社',0,1,NULL,0),
(294,12304,123,'合名会社',0,1,NULL,0),
(295,12305,123,'相互会社',0,1,NULL,0),
(296,12306,123,'医療法人',0,1,NULL,0),
(297,12307,123,'財団法人',0,1,NULL,0),
(298,12308,123,'社団法人',0,1,NULL,0),
(299,12309,123,'社会福祉法人',0,1,NULL,0),
(300,12310,123,'学校法人',0,1,NULL,0),
(301,12311,123,'特定非営利活動法人',0,1,NULL,0),
(302,12312,123,'ＮＰＯ法人',0,1,NULL,0),
(303,12313,123,'商工組合',0,1,NULL,0),
(304,12314,123,'林業組合',0,1,NULL,0),
(305,12315,123,'同業組合',0,1,NULL,0),
(306,12316,123,'農業協同組合',0,1,NULL,0),
(307,12317,123,'漁業協同組合',0,1,NULL,0),
(308,12318,123,'農事組合法人',0,1,NULL,0),
(309,12319,123,'生活互助会',0,1,NULL,0),
(310,12320,123,'協業組合',0,1,NULL,0),
(311,12321,123,'協同組合',0,1,NULL,0),
(312,12322,123,'生活協同組合',0,1,NULL,0),
(313,12323,123,'連合会',0,1,NULL,0),
(314,12324,123,'組合連合会',0,1,NULL,0),
(315,12325,123,'協同組合連合会',0,1,NULL,0),
(316,12329,123,'一般社団法人',0,1,NULL,0),
(317,12330,123,'公益社団法人',0,1,NULL,0),
(318,12331,123,'一般財団法人',0,1,NULL,0),
(319,12332,123,'公益財団法人',0,1,NULL,0),
(320,12333,123,'合同会社',0,1,NULL,0),
(321,12399,123,'個人又はその他の法人',0,1,NULL,0);
/*!40000 ALTER TABLE `llx_c_forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_holiday_types`
--

DROP TABLE IF EXISTS `llx_c_holiday_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_holiday_types` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `affect` int NOT NULL,
  `delay` int NOT NULL,
  `newbymonth` double(8,5) NOT NULL DEFAULT '0.00000',
  `fk_country` int DEFAULT NULL,
  `block_if_negative` int NOT NULL DEFAULT '0',
  `sortorder` smallint DEFAULT NULL,
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_holiday_types` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_holiday_types`
--

LOCK TABLES `llx_c_holiday_types` WRITE;
/*!40000 ALTER TABLE `llx_c_holiday_types` DISABLE KEYS */;
INSERT INTO `llx_c_holiday_types` VALUES
(1,'LEAVE_SICK','Sick leave',0,0,0.00000,NULL,0,1,1),
(2,'LEAVE_OTHER','Other leave',0,0,0.00000,NULL,0,2,1),
(3,'LEAVE_PAID','Paid vacation',1,7,0.00000,NULL,0,3,0),
(4,'LEAVE_RTT_FR','RTT',1,7,0.83000,1,0,4,1),
(5,'LEAVE_PAID_FR','Paid vacation',1,30,2.08334,1,0,5,1),
(6,'5D1Y','Κανονική άδεια(Πενθήμερο 1ο έτος)',1,0,1.66700,102,0,6,1),
(7,'5D2Y','Κανονική άδεια(Πενθήμερο 2ο έτος)',1,0,1.75000,102,0,7,1),
(8,'5D3-10Y','Κανονική άδεια(Πενθήμερο 3ο έως 10ο έτος)',1,0,1.83300,102,0,8,1),
(9,'5D10-25Y','Κανονική άδεια(Πενθήμερο 10ο έως 25ο έτος)',1,0,2.08300,102,0,9,1),
(10,'5D25+Y','Κανονική άδεια(Πενθήμερο 25+ έτη)',1,0,2.16600,102,0,10,1),
(11,'6D1Y','Κανονική άδεια(Εξαήμερο 1ο έτος)',1,0,2.00000,102,0,11,1),
(12,'6D2Y','Κανονική άδεια(Εξαήμερο 2ο έτος)',1,0,2.08300,102,0,12,1),
(13,'6D3-10Y','Κανονική άδεια(Εξαήμερο 3ο έως 10ο έτος)',1,0,2.16600,102,0,13,1),
(14,'6D10-25Y','Κανονική άδεια(Εξαήμερο 10ο έως 25ο έτος)',1,0,2.08300,102,0,14,1),
(15,'6D25+Y','Κανονική άδεια(Εξαήμερο 25+ έτη)',1,0,2.16600,102,0,15,1),
(16,'5D-WED','Πενθήμερη άδεια γάμου(με αποδοχές)',0,0,0.00000,102,0,16,0),
(17,'6D-WED','Εξαήμερη άδεια γάμου(με αποδοχές)',0,0,0.00000,102,0,17,0),
(18,'7D-AR','Επταήμερη άδεια ιατρικώς υποβοηθούμενης αναπαραγωγής(με αποδοχές)',0,0,0.00000,102,0,18,0),
(19,'1D-BC','Μονοήμερη άδεια προγεννητικών εξετάσεων(με αποδοχές)',0,0,0.00000,102,0,19,0),
(20,'1D-GYN','Μονοήμερη άδεια γυναικολογικού ελέγχου(με αποδοχές)',0,0,0.00000,102,0,20,0),
(21,'149D-ML','Άδεια Μητρότητας (Άδεια κύησης – λοχείας)56 ημέρες πριν-93 ημέρες μετα(με αποδοχές)',0,0,0.00000,102,0,21,0),
(22,'14D-PL','14ήμερη Άδεια πατρότητας(με αποδοχές)',0,0,0.00000,102,0,22,0),
(23,'1-2H-CC','Άδεια φροντίδας παιδιών (μειωμένο ωράριο  https://www.kepea.gr/aarticle.php?id=1984)',0,0,0.00000,102,0,23,0),
(24,'9M-M','Ειδική άδεια προστασίας μητρότητας 9 μηνών(χωρίς αποδοχές)',0,0,0.00000,102,0,24,0),
(25,'4M-M','Τετράμηνη γονική Άδεια Ανατροφής Τέκνων(χωρίς αποδοχές)',0,0,0.00000,102,0,25,0),
(26,'6-8D-SP','Εξαήμερη ή Οκταήμερη Άδεια για μονογονεϊκές οικογένειες(με αποδοχές)',0,0,0.00000,102,0,26,0),
(27,'6-8-14D-FC','Άδεια για ασθένεια μελών οικογένειας(χωρίς αποδοχές, 6 ημέρες/έτος ένα παιδί - 8 ημέρες/έτος δύο παιδιά και σε 14 ημέρες/έτος τρία (3) παιδιά και πάνω',0,0,0.00000,102,0,27,0),
(28,'10D-CD','Δεκαήμερη Γονική Άδεια για παιδί με σοβαρά νοσήματα και λόγω νοσηλείας παιδιών(με αποδοχές)',0,0,0.00000,102,0,28,0),
(29,'30D-CD','Άδεια λόγω νοσηλείας των παιδιών(έως 30 ημέρες/έτος χωρίς αποδοχές)',0,0,0.00000,102,0,29,0),
(30,'5D-CG','Άδεια φροντιστή(έως 5 ημέρες/έτος χωρίς αποδοχές)',0,0,0.00000,102,0,30,0),
(31,'2D-CG','Άδεια απουσίας από την εργασία για λόγους ανωτέρας βίας(έως 2 ημέρες/έτος με αποδοχές)',0,0,0.00000,102,0,31,0),
(32,'2D-SC','Άδεια για παρακολούθηση σχολικής επίδοσης(έως 2 ημέρες/έτος με αποδοχές)',0,0,0.00000,102,0,32,0),
(33,'1D-BD','Μονοήμερη άδεια αιμοδοσίας(με αποδοχές)',0,0,0.00000,102,0,33,0),
(34,'22D-BT','Άδεια για μετάγγιση αίματος & αιμοκάθαρση(έως 22 ημέρες/έτος με αποδοχές)',0,0,0.00000,102,0,34,0),
(35,'30D-HIV','Άδεια λόγω AIDS(έως ένα (1) μήνα/έτος με αποδοχές)',0,0,0.00000,102,0,35,0),
(36,'20D-CD','Άδεια πενθούντων γονέων(20 ημέρες με αποδοχές)',0,0,0.00000,102,0,36,0),
(37,'2D-FD','Άδεια λόγω θανάτου συγγενούς(2 ημέρες με αποδοχές)',0,0,0.00000,102,0,37,0),
(38,'DIS','Άδειες αναπήρων(30 ημέρες με αποδοχές)',0,0,0.00000,102,0,38,0),
(39,'SE','Άδεια εξετάσεων μαθητών, σπουδαστών, φοιτητών(30 ημέρες χωρίς αποδοχές)',0,0,0.00000,102,0,39,0),
(40,'NOT PAID','Άδεια άνευ αποδοχών(έως ένα (1) έτος)',0,0,0.00000,102,0,40,0);
/*!40000 ALTER TABLE `llx_c_holiday_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_hrm_department`
--

DROP TABLE IF EXISTS `llx_c_hrm_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_hrm_department` (
  `rowid` int NOT NULL,
  `pos` tinyint NOT NULL DEFAULT '0',
  `code` varchar(16) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_department`
--

LOCK TABLES `llx_c_hrm_department` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_department` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_department` VALUES
(1,5,'MANAGEMENT','Management',1),
(3,15,'TRAINING','Training',1),
(4,20,'IT','Inform. Technology (IT)',0),
(5,25,'MARKETING','Marketing',0),
(6,30,'SALES','Sales',1),
(7,35,'LEGAL','Legal',0),
(8,40,'FINANCIAL','Financial accounting',1),
(9,45,'HUMANRES','Human resources',1),
(10,50,'PURCHASING','Purchasing',1),
(12,60,'CUSTOMSERV','Customer service',0),
(14,70,'LOGISTIC','Logistics',1),
(15,75,'CONSTRUCT','Engineering/design',0),
(16,80,'PRODUCTION','Production',1),
(17,85,'QUALITY','Quality assurance',0);
/*!40000 ALTER TABLE `llx_c_hrm_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_hrm_function`
--

DROP TABLE IF EXISTS `llx_c_hrm_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_hrm_function` (
  `rowid` int NOT NULL,
  `pos` tinyint NOT NULL DEFAULT '0',
  `code` varchar(16) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `c_level` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_function`
--

LOCK TABLES `llx_c_hrm_function` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_function` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_function` VALUES
(1,5,'EXECBOARD','Executive board',0,1),
(2,10,'MANAGDIR','Managing director',1,1),
(3,15,'ACCOUNTMANAG','Account manager',0,1),
(4,20,'ENGAGDIR','Engagement director',1,1),
(5,25,'DIRECTOR','Director',1,1),
(6,30,'PROJMANAG','Project manager',0,1),
(7,35,'DEPHEAD','Department head',0,1),
(8,40,'SECRETAR','Secretary',0,1),
(9,45,'EMPLOYEE','Department employee',0,1);
/*!40000 ALTER TABLE `llx_c_hrm_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_hrm_public_holiday`
--

DROP TABLE IF EXISTS `llx_c_hrm_public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_hrm_public_holiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '0',
  `fk_country` int DEFAULT NULL,
  `fk_departement` int DEFAULT NULL,
  `code` varchar(62) DEFAULT NULL,
  `dayrule` varchar(64) DEFAULT '',
  `day` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `active` int DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_public_holiday`
--

LOCK TABLES `llx_c_hrm_public_holiday` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_public_holiday` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_public_holiday` VALUES
(1,0,0,NULL,'NEWYEARDAY1','',1,1,0,1,NULL),
(2,0,0,NULL,'LABORDAY1','',1,5,0,1,NULL),
(3,0,0,NULL,'ASSOMPTIONDAY1','',15,8,0,1,NULL),
(4,0,0,NULL,'CHRISTMASDAY1','',25,12,0,1,NULL),
(5,0,1,NULL,'FR-VICTORYDAY','',8,5,0,1,NULL),
(6,0,1,NULL,'FR-NATIONALDAY','',14,7,0,1,NULL),
(7,0,1,NULL,'FR-ASSOMPTION','',15,8,0,1,NULL),
(8,0,1,NULL,'FR-TOUSSAINT','',1,11,0,1,NULL),
(9,0,1,NULL,'FR-ARMISTICE','',11,11,0,1,NULL),
(10,0,1,NULL,'FR-EASTER','eastermonday',0,0,0,1,NULL),
(11,0,1,NULL,'FR-ASCENSION','ascension',0,0,0,1,NULL),
(12,0,1,NULL,'FR-PENTECOST','pentecost',0,0,0,1,NULL),
(13,0,2,NULL,'BE-VICTORYDAY','',8,5,0,1,NULL),
(14,0,2,NULL,'BE-NATIONALDAY','',21,7,0,1,NULL),
(15,0,2,NULL,'BE-ASSOMPTION','',15,8,0,1,NULL),
(16,0,2,NULL,'BE-TOUSSAINT','',1,11,0,1,NULL),
(17,0,2,NULL,'BE-ARMISTICE','',11,11,0,1,NULL),
(18,0,2,NULL,'BE-EASTER','eastermonday',0,0,0,1,NULL),
(19,0,2,NULL,'BE-ASCENSION','ascension',0,0,0,1,NULL),
(20,0,2,NULL,'BE-PENTECOST','pentecost',0,0,0,1,NULL),
(21,0,3,NULL,'IT-LIBEAZIONE','',25,4,0,1,NULL),
(22,0,3,NULL,'IT-EPIPHANY','',1,6,0,1,NULL),
(23,0,3,NULL,'IT-REPUBBLICA','',2,6,0,1,NULL),
(24,0,3,NULL,'IT-TUTTISANTIT','',1,11,0,1,NULL),
(25,0,3,NULL,'IT-IMMACULE','',8,12,0,1,NULL),
(26,0,3,NULL,'IT-SAINTSTEFAN','',26,12,0,1,NULL),
(27,0,4,NULL,'ES-EASTER','easter',0,0,0,1,NULL),
(28,0,4,NULL,'ES-REYE','',1,6,0,1,NULL),
(29,0,4,NULL,'ES-HISPANIDAD','',12,10,0,1,NULL),
(30,0,4,NULL,'ES-TOUSSAINT','',1,11,0,1,NULL),
(31,0,4,NULL,'ES-CONSTITUIZION','',6,12,0,1,NULL),
(32,0,4,NULL,'ES-IMMACULE','',8,12,0,1,NULL),
(33,0,5,NULL,'DE-NEUJAHR','',1,1,0,1,NULL),
(34,0,5,NULL,'DE-HL3KOEN--TLW','',6,1,0,0,NULL),
(35,0,5,NULL,'DE-INTFRAUENTAG--TLW','',8,3,0,0,NULL),
(36,0,5,NULL,'DE-KARFREITAG','goodfriday',0,0,0,1,NULL),
(37,0,5,NULL,'DE-OSTERMONTAG','eastermonday',0,0,0,1,NULL),
(38,0,5,NULL,'DE-TAGDERARBEIT','',1,5,0,1,NULL),
(39,0,5,NULL,'DE-HIMMELFAHRT','ascension',0,0,0,1,NULL),
(40,0,5,NULL,'DE-PFINGSTEN','pentecotemonday',0,0,0,1,NULL),
(41,0,5,NULL,'DE-FRONLEICHNAM--TLW','fronleichnam',0,0,0,0,NULL),
(42,0,5,NULL,'DE-MARIAEHIMMEL--TLW','',15,8,0,0,NULL),
(43,0,5,NULL,'DE-WELTKINDERTAG--TLW','',20,9,0,0,NULL),
(44,0,5,NULL,'DE-TAGDERDEUTEINHEIT','',3,10,0,1,NULL),
(45,0,5,NULL,'DE-REFORMATIONSTAG--TLW','',31,10,0,0,NULL),
(46,0,5,NULL,'DE-ALLERHEILIGEN--TLW','',1,11,0,0,NULL),
(47,0,5,NULL,'DE-WEIHNACHTSTAG1','',25,12,0,1,NULL),
(48,0,5,NULL,'DE-WEIHNACHTSTAG2','',26,12,0,1,NULL),
(49,0,41,NULL,'AT-EASTER','eastermonday',0,0,0,1,NULL),
(50,0,41,NULL,'AT-ASCENSION','ascension',0,0,0,1,NULL),
(51,0,41,NULL,'AT-PENTECOST','pentecost',0,0,0,1,NULL),
(52,0,41,NULL,'AT-FRONLEICHNAM','fronleichnam',0,0,0,1,NULL),
(53,0,41,NULL,'AT-KONEGIE','',1,6,0,1,NULL),
(54,0,41,NULL,'AT-26OKT','',26,10,0,1,NULL),
(55,0,41,NULL,'AT-TOUSSAINT','',1,11,0,1,NULL),
(56,0,41,NULL,'AT-IMMACULE','',8,12,0,1,NULL),
(57,0,41,NULL,'AT-24DEC','',24,12,0,1,NULL),
(58,0,41,NULL,'AT-SAINTSTEFAN','',26,12,0,1,NULL),
(59,0,41,NULL,'AT-Silvester','',31,12,0,1,NULL),
(60,0,102,NULL,'GR-ΠΡΩΤΟΧΡΟΝΙΑ','',1,1,0,1,NULL),
(61,0,102,NULL,'GR-ΘΕΟΦΑΝΕΙΑ','',6,1,0,1,NULL),
(62,0,102,NULL,'GR-25Η ΜΑΡΤΙΟΥ','',25,3,0,1,NULL),
(63,0,102,NULL,'GR-ΠΡΩΤΟΜΑΓΙΑ','',1,5,0,1,NULL),
(64,0,102,NULL,'GR-ΚΑΘΑΡΑ ΔΕΥΤΕΡΑ','ΚΑΘΑΡΑ_ΔΕΥΤΕΡΑ',0,0,0,1,NULL),
(65,0,102,NULL,'GR-ΜΕΓΑΛΗ ΠΑΡΑΣΚΕΥΗ','ΜΕΓΑΛΗ_ΠΑΡΑΣΚΕΥΗ',0,0,0,1,NULL),
(66,0,102,NULL,'GR-ΔΕΥΤΕΡΑ ΤΟΥ ΠΑΣΧΑ','ΔΕΥΤΕΡΑ_ΤΟΥ_ΠΑΣΧΑ',0,0,0,1,NULL),
(67,0,102,NULL,'GR-ΤΟΥ ΑΓΙΟΥ ΠΝΕΥΜΑΤΟΣ','ΤΟΥ_ΑΓΙΟΥ_ΠΝΕΥΜΑΤΟΣ',0,0,0,1,NULL),
(68,0,102,NULL,'GR-ΚΟΙΜΗΣΗ ΤΗΣ ΘΕΟΤΟΚΟΥ','',15,8,0,1,NULL),
(69,0,102,NULL,'GR-28Η ΟΚΤΩΒΡΙΟΥ','',28,10,0,1,NULL),
(70,0,102,NULL,'GR-ΧΡΙΣΤΟΥΓΕΝΝΑ','',25,12,0,1,NULL),
(71,0,102,NULL,'GR-ΣΥΝΑΞΗ ΘΕΟΤΟΚΟΥ','',26,12,0,1,NULL),
(72,0,117,NULL,'IN-REPUBLICDAY','',26,1,0,1,NULL),
(73,0,117,NULL,'IN-GANDI','',2,10,0,1,NULL);
/*!40000 ALTER TABLE `llx_c_hrm_public_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_incoterms`
--

DROP TABLE IF EXISTS `llx_c_incoterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_incoterms` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_incoterms` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_incoterms`
--

LOCK TABLES `llx_c_incoterms` WRITE;
/*!40000 ALTER TABLE `llx_c_incoterms` DISABLE KEYS */;
INSERT INTO `llx_c_incoterms` VALUES
(1,'EXW','Ex Works','Ex Works, au départ non chargé, non dédouané sortie d\'usine (uniquement adapté aux flux domestiques, nationaux)',1),
(2,'FCA','Free Carrier','Free Carrier, marchandises dédouanées et chargées dans le pays de départ, chez le vendeur ou chez le commissionnaire de transport de l\'acheteur',1),
(3,'FAS','Free Alongside Ship','Free Alongside Ship, sur le quai du port de départ',1),
(4,'FOB','Free On Board','Free On Board, chargé sur le bateau, les frais de chargement dans celui-ci étant fonction du liner term indiqué par la compagnie maritime (à la charge du vendeur)',1),
(5,'CFR','Cost and Freight','Cost and Freight, chargé dans le bateau, livraison au port de départ, frais payés jusqu\'au port d\'arrivée, sans assurance pour le transport, non déchargé du navire à destination (les frais de déchargement sont inclus ou non au port d\'arrivée)',1),
(6,'CIF','Cost, Insurance, Freight','Cost, Insurance and Freight, chargé sur le bateau, frais jusqu\'au port d\'arrivée, avec l\'assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur',1),
(7,'CPT','Carriage Paid To','Carriage Paid To, livraison au premier transporteur, frais jusqu\'au déchargement du mode de transport, sans assurance pour le transport',1),
(8,'CIP','Carriage Insurance Paid','Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur',1),
(9,'DAT','Delivered At Terminal','Delivered At Terminal, marchandises (déchargées) livrées sur quai, dans un terminal maritime, fluvial, aérien, routier ou ferroviaire désigné (dédouanement import, et post-acheminement payés par l\'acheteur)',1),
(10,'DAP','Delivered At Place','Delivered At Place, marchandises (non déchargées) mises à disposition de l\'acheteur dans le pays d\'importation au lieu précisé dans le contrat (déchargement, dédouanement import payé par l\'acheteur)',1),
(11,'DDP','Delivered Duty Paid','Delivered Duty Paid, marchandises (non déchargées) livrées à destination finale, dédouanement import et taxes à la charge du vendeur ; l\'acheteur prend en charge uniquement le déchargement (si exclusion des taxes type TVA, le préciser clairement)',1),
(12,'DPU','Delivered at Place Unloaded','Delivered at Place unloaded',1);
/*!40000 ALTER TABLE `llx_c_incoterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_input_method`
--

DROP TABLE IF EXISTS `llx_c_input_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_input_method` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_method` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_input_method`
--

LOCK TABLES `llx_c_input_method` WRITE;
/*!40000 ALTER TABLE `llx_c_input_method` DISABLE KEYS */;
INSERT INTO `llx_c_input_method` VALUES
(1,'OrderByMail','Courrier',1,NULL),
(2,'OrderByFax','Fax',1,NULL),
(3,'OrderByEMail','EMail',1,NULL),
(4,'OrderByPhone','Téléphone',1,NULL),
(5,'OrderByWWW','En ligne',1,NULL);
/*!40000 ALTER TABLE `llx_c_input_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_input_reason`
--

DROP TABLE IF EXISTS `llx_c_input_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_input_reason` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_reason` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_input_reason`
--

LOCK TABLES `llx_c_input_reason` WRITE;
/*!40000 ALTER TABLE `llx_c_input_reason` DISABLE KEYS */;
INSERT INTO `llx_c_input_reason` VALUES
(1,'SRC_INTE','Web site',1,NULL),
(2,'SRC_CAMP_MAIL','Mailing campaign',1,NULL),
(3,'SRC_CAMP_PHO','Phone campaign',1,NULL),
(4,'SRC_CAMP_FAX','Fax campaign',1,NULL),
(5,'SRC_COMM','Commercial contact',1,NULL),
(6,'SRC_SHOP','Shop contact',1,NULL),
(7,'SRC_CAMP_EMAIL','EMailing campaign',1,NULL),
(8,'SRC_WOM','Word of mouth',1,NULL),
(9,'SRC_PARTNER','Partner',1,NULL),
(10,'SRC_EMPLOYEE','Employee',1,NULL),
(11,'SRC_SPONSORING','Sponsorship',1,NULL),
(12,'SRC_CUSTOMER','Incoming contact of a customer',1,NULL);
/*!40000 ALTER TABLE `llx_c_input_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_invoice_subtype`
--

DROP TABLE IF EXISTS `llx_c_invoice_subtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_invoice_subtype` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `fk_country` int NOT NULL,
  `code` varchar(4) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_invoice_subtype` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_invoice_subtype`
--

LOCK TABLES `llx_c_invoice_subtype` WRITE;
/*!40000 ALTER TABLE `llx_c_invoice_subtype` DISABLE KEYS */;
INSERT INTO `llx_c_invoice_subtype` VALUES
(1,1,102,'1.1','Τιμολόγιο Πώλησης',1),
(2,1,102,'1.2','Τιμολόγιο Πώλησης / Ενδοκοινοτικές Παραδόσεις',1),
(3,1,102,'1.3','Τιμολόγιο Πώλησης / Παραδόσεις Τρίτων Χωρών',1),
(4,1,102,'1.4','Τιμολόγιο Πώλησης / Πώληση για Λογαριασμό Τρίτων',0),
(5,1,102,'1.5','Τιμολόγιο Πώλησης / Εκκαθάριση Πωλήσεων Τρίτων - Αμοιβή από Πωλήσεις Τρίτων',0),
(6,1,102,'1.6','Τιμολόγιο Πώλησης / Συμπληρωματικό Παραστατικό',0),
(7,1,102,'2.1','Τιμολόγιο Παροχής',1),
(8,1,102,'2.2','Τιμολόγιο Παροχής / Ενδοκοινοτική Παροχή Υπηρεσιών',1),
(9,1,102,'2.3','Τιμολόγιο Παροχής / Παροχή Υπηρεσιών σε λήπτη Τρίτης Χώρας',1),
(10,1,102,'2.4','Τιμολόγιο Παροχής / Συμπληρωματικό Παραστατικό',0),
(11,1,102,'3.1','Τίτλος Κτήσης (μη υπόχρεος Εκδότης)',0),
(12,1,102,'3.2','Τίτλος Κτήσης (άρνηση έκδοσης από υπόχρεο Εκδότη)',0),
(13,1,102,'6.1','Στοιχείο Αυτοπαράδοσης',0),
(14,1,102,'6.2','Στοιχείο Ιδιοχρησιμοποίησης',0),
(15,1,102,'7.1','Συμβόλαιο - Έσοδο',0),
(16,1,102,'8.1','Ενοίκια - Έσοδο',0),
(17,1,102,'8.2','Ειδικό Στοιχείο – Απόδειξης Είσπραξης Φόρου Διαμονής',0),
(18,1,102,'11.1','ΑΛΠ',1),
(19,1,102,'11.2','ΑΠΥ',1),
(20,1,102,'11.3','Απλοποιημένο Τιμολόγιο',0),
(21,1,102,'11.5','Απόδειξη Λιανικής Πώλησης για Λογ/σμό Τρίτων',0);
/*!40000 ALTER TABLE `llx_c_invoice_subtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_lead_status`
--

DROP TABLE IF EXISTS `llx_c_lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_lead_status` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_lead_status_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_lead_status`
--

LOCK TABLES `llx_c_lead_status` WRITE;
/*!40000 ALTER TABLE `llx_c_lead_status` DISABLE KEYS */;
INSERT INTO `llx_c_lead_status` VALUES
(1,'PROSP','Prospection',10,0.00,1),
(2,'QUAL','Qualification',20,20.00,1),
(3,'PROPO','Proposal',30,40.00,1),
(4,'NEGO','Negotiation',40,60.00,1),
(5,'PENDING','Pending',50,50.00,0),
(6,'WON','Won',60,100.00,1),
(7,'LOST','Lost',70,0.00,1);
/*!40000 ALTER TABLE `llx_c_lead_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_paiement`
--

DROP TABLE IF EXISTS `llx_c_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_paiement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(6) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `type` smallint DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_paiement`
--

LOCK TABLES `llx_c_paiement` WRITE;
/*!40000 ALTER TABLE `llx_c_paiement` DISABLE KEYS */;
INSERT INTO `llx_c_paiement` VALUES
(1,1,'TIP','TIP',2,0,NULL,NULL,0),
(2,1,'VIR','Credit Transfer',2,1,NULL,NULL,0),
(3,1,'PRE','Direct Debit',2,1,NULL,NULL,0),
(4,1,'LIQ','Cash',2,1,NULL,NULL,0),
(6,1,'CB','Credit card',2,1,NULL,NULL,0),
(7,1,'CHQ','Cheque',2,1,NULL,NULL,0),
(50,1,'VAD','Online payment',2,0,NULL,NULL,0),
(51,1,'TRA','Traite',2,0,NULL,NULL,0),
(52,1,'LCR','LCR',2,0,NULL,NULL,0),
(53,1,'FAC','Factor',2,0,NULL,NULL,0),
(100,1,'KLA','Klarna',1,0,NULL,NULL,0),
(101,1,'SOF','Sofort',1,0,NULL,NULL,0),
(102,1,'BANCON','Bancontact',1,0,NULL,NULL,0),
(103,1,'IDE','iDeal',1,0,NULL,NULL,0),
(104,1,'GIR','Giropay',1,0,NULL,NULL,0),
(105,1,'PPL','PayPal',1,0,NULL,NULL,0);
/*!40000 ALTER TABLE `llx_c_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_paper_format`
--

DROP TABLE IF EXISTS `llx_c_paper_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_paper_format` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(128) NOT NULL,
  `width` float(6,2) DEFAULT '0.00',
  `height` float(6,2) DEFAULT '0.00',
  `unit` varchar(5) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_paper_format`
--

LOCK TABLES `llx_c_paper_format` WRITE;
/*!40000 ALTER TABLE `llx_c_paper_format` DISABLE KEYS */;
INSERT INTO `llx_c_paper_format` VALUES
(1,'EU4A0','Format 4A0',1682.00,2378.00,'mm',1,NULL),
(2,'EU2A0','Format 2A0',1189.00,1682.00,'mm',1,NULL),
(3,'EUA0','Format A0',840.00,1189.00,'mm',1,NULL),
(4,'EUA1','Format A1',594.00,840.00,'mm',1,NULL),
(5,'EUA2','Format A2',420.00,594.00,'mm',1,NULL),
(6,'EUA3','Format A3',297.00,420.00,'mm',1,NULL),
(7,'EUA4','Format A4',210.00,297.00,'mm',1,NULL),
(8,'EUA5','Format A5',148.00,210.00,'mm',1,NULL),
(9,'EUA6','Format A6',105.00,148.00,'mm',1,NULL),
(100,'USLetter','Format Letter (A)',216.00,279.00,'mm',1,NULL),
(105,'USLegal','Format Legal',216.00,356.00,'mm',1,NULL),
(110,'USExecutive','Format Executive',190.00,254.00,'mm',1,NULL),
(115,'USLedger','Format Ledger/Tabloid (B)',279.00,432.00,'mm',1,NULL),
(200,'CAP1','Format Canadian P1',560.00,860.00,'mm',1,NULL),
(205,'CAP2','Format Canadian P2',430.00,560.00,'mm',1,NULL),
(210,'CAP3','Format Canadian P3',280.00,430.00,'mm',1,NULL),
(215,'CAP4','Format Canadian P4',215.00,280.00,'mm',1,NULL),
(220,'CAP5','Format Canadian P5',140.00,215.00,'mm',1,NULL),
(225,'CAP6','Format Canadian P6',107.00,140.00,'mm',1,NULL);
/*!40000 ALTER TABLE `llx_c_paper_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_payment_term`
--

DROP TABLE IF EXISTS `llx_c_payment_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_payment_term` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text,
  `type_cdr` tinyint DEFAULT NULL,
  `nbjour` smallint DEFAULT NULL,
  `decalage` smallint DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_payment_term`
--

LOCK TABLES `llx_c_payment_term` WRITE;
/*!40000 ALTER TABLE `llx_c_payment_term` DISABLE KEYS */;
INSERT INTO `llx_c_payment_term` VALUES
(1,1,'RECEP',1,1,'Due upon receipt','Due upon receipt',0,1,NULL,NULL,NULL,0),
(2,1,'30D',2,1,'30 days','Due in 30 days',0,30,NULL,NULL,NULL,0),
(3,1,'30DENDMONTH',3,1,'30 days end of month','Due in 30 days, end of month',1,30,NULL,NULL,NULL,0),
(4,1,'60D',4,1,'60 days','Due in 60 days, end of month',0,60,NULL,NULL,NULL,0),
(5,1,'60DENDMONTH',5,1,'60 days end of month','Due in 60 days, end of month',1,60,NULL,NULL,NULL,0),
(6,1,'PT_ORDER',6,1,'Due on order','Due on order',0,1,NULL,NULL,NULL,0),
(7,1,'PT_DELIVERY',7,1,'Due on delivery','Due on delivery',0,1,NULL,NULL,NULL,0),
(8,1,'PT_5050',8,1,'50 and 50','50% on order, 50% on delivery',0,1,NULL,NULL,NULL,0),
(9,1,'10D',9,1,'10 days','Due in 10 days',0,10,NULL,NULL,NULL,0),
(10,1,'10DENDMONTH',10,1,'10 days end of month','Due in 10 days, end of month',1,10,NULL,NULL,NULL,0),
(11,1,'14D',11,1,'14 days','Due in 14 days',0,14,NULL,NULL,NULL,0),
(12,1,'14DENDMONTH',12,1,'14 days end of month','Due in 14 days, end of month',1,14,NULL,NULL,NULL,0),
(13,1,'DEP30PCTDEL',13,0,'__DEPOSIT_PERCENT__% deposit','__DEPOSIT_PERCENT__% deposit, remainder on delivery',0,1,NULL,'30',NULL,0);
/*!40000 ALTER TABLE `llx_c_payment_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_price_expression`
--

DROP TABLE IF EXISTS `llx_c_price_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_price_expression` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `expression` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_expression`
--

LOCK TABLES `llx_c_price_expression` WRITE;
/*!40000 ALTER TABLE `llx_c_price_expression` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_price_global_variable`
--

DROP TABLE IF EXISTS `llx_c_price_global_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_price_global_variable` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` text,
  `value` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_global_variable`
--

LOCK TABLES `llx_c_price_global_variable` WRITE;
/*!40000 ALTER TABLE `llx_c_price_global_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_global_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_price_global_variable_updater`
--

DROP TABLE IF EXISTS `llx_c_price_global_variable_updater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_price_global_variable_updater` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `description` text,
  `parameters` text,
  `fk_variable` int NOT NULL,
  `update_interval` int DEFAULT '0',
  `next_update` int DEFAULT '0',
  `last_status` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_global_variable_updater`
--

LOCK TABLES `llx_c_price_global_variable_updater` WRITE;
/*!40000 ALTER TABLE `llx_c_price_global_variable_updater` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_global_variable_updater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_product_nature`
--

DROP TABLE IF EXISTS `llx_c_product_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_product_nature` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` tinyint NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_product_nature` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_product_nature`
--

LOCK TABLES `llx_c_product_nature` WRITE;
/*!40000 ALTER TABLE `llx_c_product_nature` DISABLE KEYS */;
INSERT INTO `llx_c_product_nature` VALUES
(1,0,'RowMaterial',1),
(2,1,'Finished',1);
/*!40000 ALTER TABLE `llx_c_product_nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_productbatch_qcstatus`
--

DROP TABLE IF EXISTS `llx_c_productbatch_qcstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_productbatch_qcstatus` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(16) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_productbatch_qcstatus` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_productbatch_qcstatus`
--

LOCK TABLES `llx_c_productbatch_qcstatus` WRITE;
/*!40000 ALTER TABLE `llx_c_productbatch_qcstatus` DISABLE KEYS */;
INSERT INTO `llx_c_productbatch_qcstatus` VALUES
(1,1,'OK','InWorkingOrder',1),
(2,1,'KO','OutOfOrder',1);
/*!40000 ALTER TABLE `llx_c_productbatch_qcstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_propalst`
--

DROP TABLE IF EXISTS `llx_c_propalst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_propalst` (
  `id` smallint NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_propalst` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_propalst`
--

LOCK TABLES `llx_c_propalst` WRITE;
/*!40000 ALTER TABLE `llx_c_propalst` DISABLE KEYS */;
INSERT INTO `llx_c_propalst` VALUES
(0,'PR_DRAFT','Brouillon',0,1),
(1,'PR_OPEN','Ouverte',0,1),
(2,'PR_SIGNED','Signée',0,1),
(3,'PR_NOTSIGNED','Non Signée',0,1),
(4,'PR_FAC','Facturée',0,1);
/*!40000 ALTER TABLE `llx_c_propalst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_prospectcontactlevel`
--

DROP TABLE IF EXISTS `llx_c_prospectcontactlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_prospectcontactlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `active` smallint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_prospectcontactlevel`
--

LOCK TABLES `llx_c_prospectcontactlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectcontactlevel` DISABLE KEYS */;
INSERT INTO `llx_c_prospectcontactlevel` VALUES
('PL_HIGH','High',4,1,NULL),
('PL_LOW','Low',2,1,NULL),
('PL_MEDIUM','Medium',3,1,NULL),
('PL_NONE','None',1,1,NULL);
/*!40000 ALTER TABLE `llx_c_prospectcontactlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_prospectlevel`
--

DROP TABLE IF EXISTS `llx_c_prospectlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `active` smallint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_prospectlevel`
--

LOCK TABLES `llx_c_prospectlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectlevel` DISABLE KEYS */;
INSERT INTO `llx_c_prospectlevel` VALUES
('PL_HIGH','High',4,1,NULL),
('PL_LOW','Low',2,1,NULL),
('PL_MEDIUM','Medium',3,1,NULL),
('PL_NONE','None',1,1,NULL);
/*!40000 ALTER TABLE `llx_c_prospectlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_recruitment_origin`
--

DROP TABLE IF EXISTS `llx_c_recruitment_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_recruitment_origin` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_recruitment_origin`
--

LOCK TABLES `llx_c_recruitment_origin` WRITE;
/*!40000 ALTER TABLE `llx_c_recruitment_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_recruitment_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_regions`
--

DROP TABLE IF EXISTS `llx_c_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_regions` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code_region` int NOT NULL,
  `fk_pays` int NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code_region` (`code_region`),
  KEY `idx_c_regions_fk_pays` (`fk_pays`),
  CONSTRAINT `fk_c_regions_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_regions`
--

LOCK TABLES `llx_c_regions` WRITE;
/*!40000 ALTER TABLE `llx_c_regions` DISABLE KEYS */;
INSERT INTO `llx_c_regions` VALUES
(1,0,0,'0',0,'-',1),
(2,1301,13,'',0,'Algerie',1),
(3,34000,34,'AD',NULL,'Andorra',1),
(4,35001,35,'AO',NULL,'Angola',1),
(5,2301,23,'',0,'Norte',1),
(6,2302,23,'',0,'Litoral',1),
(7,2303,23,'',0,'Cuyana',1),
(8,2304,23,'',0,'Central',1),
(9,2305,23,'',0,'Patagonia',1),
(10,2801,28,'',0,'Australia',1),
(11,4101,41,'',0,'Österreich',1),
(12,4601,46,'',0,'Barbados',1),
(13,201,2,'',1,'Flandre',1),
(14,202,2,'',2,'Wallonie',1),
(15,203,2,'',3,'Bruxelles-Capitale',1),
(16,5201,52,'',0,'Chuquisaca',1),
(17,5202,52,'',0,'La Paz',1),
(18,5203,52,'',0,'Cochabamba',1),
(19,5204,52,'',0,'Oruro',1),
(20,5205,52,'',0,'Potosí',1),
(21,5206,52,'',0,'Tarija',1),
(22,5207,52,'',0,'Santa Cruz',1),
(23,5208,52,'',0,'El Beni',1),
(24,5209,52,'',0,'Pando',1),
(25,5601,56,'',0,'Brasil',1),
(26,6101,61,'',0,'Bubanza',1),
(27,6102,61,'',0,'Bujumbura Mairie',1),
(28,6103,61,'',0,'Bujumbura Rural',1),
(29,6104,61,'',0,'Bururi',1),
(30,6105,61,'',0,'Cankuzo',1),
(31,6106,61,'',0,'Cibitoke',1),
(32,6107,61,'',0,'Gitega',1),
(33,6108,61,'',0,'Karuzi',1),
(34,6109,61,'',0,'Kayanza',1),
(35,6110,61,'',0,'Kirundo',1),
(36,6111,61,'',0,'Makamba',1),
(37,6112,61,'',0,'Muramvya',1),
(38,6113,61,'',0,'Muyinga',1),
(39,6114,61,'',0,'Mwaro',1),
(40,6115,61,'',0,'Ngozi',1),
(41,6116,61,'',0,'Rumonge',1),
(42,6117,61,'',0,'Rutana',1),
(43,6118,61,'',0,'Ruyigi',1),
(44,1401,14,'',0,'Canada',1),
(45,6701,67,NULL,NULL,'Tarapacá',1),
(46,6702,67,NULL,NULL,'Antofagasta',1),
(47,6703,67,NULL,NULL,'Atacama',1),
(48,6704,67,NULL,NULL,'Coquimbo',1),
(49,6705,67,NULL,NULL,'Valparaíso',1),
(50,6706,67,NULL,NULL,'General Bernardo O Higgins',1),
(51,6707,67,NULL,NULL,'Maule',1),
(52,6708,67,NULL,NULL,'Biobío',1),
(53,6709,67,NULL,NULL,'Raucanía',1),
(54,6710,67,NULL,NULL,'Los Lagos',1),
(55,6711,67,NULL,NULL,'Aysén General Carlos Ibáñez del Campo',1),
(56,6712,67,NULL,NULL,'Magallanes y Antártica Chilena',1),
(57,6713,67,NULL,NULL,'Metropolitana de Santiago',1),
(58,6714,67,NULL,NULL,'Los Ríos',1),
(59,6715,67,NULL,NULL,'Arica y Parinacota',1),
(60,901,9,'京',0,'北京市',1),
(61,902,9,'津',0,'天津市',1),
(62,903,9,'沪',0,'上海市',1),
(63,904,9,'渝',0,'重庆市',1),
(64,905,9,'冀',0,'河北省',1),
(65,906,9,'晋',0,'山西省',1),
(66,907,9,'辽',0,'辽宁省',1),
(67,908,9,'吉',0,'吉林省',1),
(68,909,9,'黑',0,'黑龙江省',1),
(69,910,9,'苏',0,'江苏省',1),
(70,911,9,'浙',0,'浙江省',1),
(71,912,9,'皖',0,'安徽省',1),
(72,913,9,'闽',0,'福建省',1),
(73,914,9,'赣',0,'江西省',1),
(74,915,9,'鲁',0,'山东省',1),
(75,916,9,'豫',0,'河南省',1),
(76,917,9,'鄂',0,'湖北省',1),
(77,918,9,'湘',0,'湖南省',1),
(78,919,9,'粤',0,'广东省',1),
(79,920,9,'琼',0,'海南省',1),
(80,921,9,'川',0,'四川省',1),
(81,922,9,'贵',0,'贵州省',1),
(82,923,9,'云',0,'云南省',1),
(83,924,9,'陕',0,'陕西省',1),
(84,925,9,'甘',0,'甘肃省',1),
(85,926,9,'青',0,'青海省',1),
(86,927,9,'台',0,'台湾省',1),
(87,928,9,'蒙',0,'内蒙古自治区',1),
(88,929,9,'桂',0,'广西壮族自治区',1),
(89,930,9,'藏',0,'西藏自治区',1),
(90,931,9,'宁',0,'宁夏回族自治区',1),
(91,932,9,'新',0,'新疆维吾尔自治区',1),
(92,933,9,'港',0,'香港特别行政区',1),
(93,934,9,'澳',0,'澳门特别行政区',1),
(94,7001,70,'',0,'Colombie',1),
(95,7601,76,'',0,'Središnja',1),
(96,7602,76,'',0,'Dalmacija',1),
(97,7603,76,'',0,'Slavonija',1),
(98,7604,76,'',0,'Istra',1),
(99,8001,80,'',0,'Nordjylland',1),
(100,8002,80,'',0,'Midtjylland',1),
(101,8003,80,'',0,'Syddanmark',1),
(102,8004,80,'',0,'Hovedstaden',1),
(103,8005,80,'',0,'Sjælland',1),
(104,1,1,'97105',3,'Guadeloupe',1),
(105,2,1,'97209',3,'Martinique',1),
(106,3,1,'97302',3,'Guyane',1),
(107,4,1,'97411',3,'Réunion',1),
(108,6,1,'97601',3,'Mayotte',1),
(109,11,1,'75056',1,'Île-de-France',1),
(110,24,1,'45234',2,'Centre-Val de Loire',1),
(111,27,1,'21231',0,'Bourgogne-Franche-Comté',1),
(112,28,1,'76540',0,'Normandie',1),
(113,32,1,'59350',4,'Hauts-de-France',1),
(114,44,1,'67482',2,'Grand Est',1),
(115,52,1,'44109',4,'Pays de la Loire',1),
(116,53,1,'35238',0,'Bretagne',1),
(117,75,1,'33063',0,'Nouvelle-Aquitaine',1),
(118,76,1,'31355',1,'Occitanie',1),
(119,84,1,'69123',1,'Auvergne-Rhône-Alpes',1),
(120,93,1,'13055',0,'Provence-Alpes-Côte d\'Azur',1),
(121,94,1,'2A004',0,'Corse',1),
(122,501,5,'',0,'Deutschland',1),
(123,10201,102,NULL,NULL,'Αττική',1),
(124,10202,102,NULL,NULL,'Στερεά Ελλάδα',1),
(125,10203,102,NULL,NULL,'Κεντρική Μακεδονία',1),
(126,10204,102,NULL,NULL,'Κρήτη',1),
(127,10205,102,NULL,NULL,'Ανατολική Μακεδονία και Θράκη',1),
(128,10206,102,NULL,NULL,'Ήπειρος',1),
(129,10207,102,NULL,NULL,'Ιόνια νησιά',1),
(130,10208,102,NULL,NULL,'Βόρειο Αιγαίο',1),
(131,10209,102,NULL,NULL,'Πελοπόννησος',1),
(132,10210,102,NULL,NULL,'Νότιο Αιγαίο',1),
(133,10211,102,NULL,NULL,'Δυτική Ελλάδα',1),
(134,10212,102,NULL,NULL,'Θεσσαλία',1),
(135,10213,102,NULL,NULL,'Δυτική Μακεδονία',1),
(136,11401,114,'',0,'Honduras',1),
(137,180100,18,'HU1',NULL,'Közép-Magyarország',1),
(138,182100,18,'HU21',NULL,'Közép-Dunántúl',1),
(139,182200,18,'HU22',NULL,'Nyugat-Dunántúl',1),
(140,182300,18,'HU23',NULL,'Dél-Dunántúl',1),
(141,183100,18,'HU31',NULL,'Észak-Magyarország',1),
(142,183200,18,'HU32',NULL,'Észak-Alföld',1),
(143,183300,18,'HU33',NULL,'Dél-Alföld',1),
(144,11701,117,'',0,'India',1),
(145,11801,118,'',0,'Indonesia',1),
(146,301,3,NULL,1,'Abruzzo',1),
(147,302,3,NULL,1,'Basilicata',1),
(148,303,3,NULL,1,'Calabria',1),
(149,304,3,NULL,1,'Campania',1),
(150,305,3,NULL,1,'Emilia-Romagna',1),
(151,306,3,NULL,1,'Friuli-Venezia Giulia',1),
(152,307,3,NULL,1,'Lazio',1),
(153,308,3,NULL,1,'Liguria',1),
(154,309,3,NULL,1,'Lombardia',1),
(155,310,3,NULL,1,'Marche',1),
(156,311,3,NULL,1,'Molise',1),
(157,312,3,NULL,1,'Piemonte',1),
(158,313,3,NULL,1,'Puglia',1),
(159,314,3,NULL,1,'Sardegna',1),
(160,315,3,NULL,1,'Sicilia',1),
(161,316,3,NULL,1,'Toscana',1),
(162,317,3,NULL,1,'Trentino-Alto Adige',1),
(163,318,3,NULL,1,'Umbria',1),
(164,319,3,NULL,1,'Valle d Aosta',1),
(165,320,3,NULL,1,'Veneto',1),
(166,12301,123,'',0,'日本',1),
(167,14001,140,'',0,'Diekirch',1),
(168,14002,140,'',0,'Grevenmacher',1),
(169,14003,140,'',0,'Luxembourg',1),
(170,15201,152,'',0,'Rivière Noire',1),
(171,15202,152,'',0,'Flacq',1),
(172,15203,152,'',0,'Grand Port',1),
(173,15204,152,'',0,'Moka',1),
(174,15205,152,'',0,'Pamplemousses',1),
(175,15206,152,'',0,'Plaines Wilhems',1),
(176,15207,152,'',0,'Port-Louis',1),
(177,15208,152,'',0,'Rivière du Rempart',1),
(178,15209,152,'',0,'Savanne',1),
(179,15210,152,'',0,'Rodrigues',1),
(180,15211,152,'',0,'Les îles Agaléga',1),
(181,15212,152,'',0,'Les écueils des Cargados Carajos',1),
(182,15401,154,'',0,'Mexique',1),
(183,1201,12,'',0,'Tanger-Tétouan',1),
(184,1202,12,'',0,'Gharb-Chrarda-Beni Hssen',1),
(185,1203,12,'',0,'Taza-Al Hoceima-Taounate',1),
(186,1204,12,'',0,'L\'Oriental',1),
(187,1205,12,'',0,'Fès-Boulemane',1),
(188,1206,12,'',0,'Meknès-Tafialet',1),
(189,1207,12,'',0,'Rabat-Salé-Zemour-Zaër',1),
(190,1208,12,'',0,'Grand Cassablanca',1),
(191,1209,12,'',0,'Chaouia-Ouardigha',1),
(192,1210,12,'',0,'Doukahla-Adba',1),
(193,1211,12,'',0,'Marrakech-Tensift-Al Haouz',1),
(194,1212,12,'',0,'Tadla-Azilal',1),
(195,1213,12,'',0,'Sous-Massa-Drâa',1),
(196,1214,12,'',0,'Guelmim-Es Smara',1),
(197,1215,12,'',0,'Laâyoune-Boujdour-Sakia el Hamra',1),
(198,1216,12,'',0,'Oued Ed-Dahab Lagouira',1),
(199,1701,17,'',0,'Provincies van Nederland ',1),
(200,17801,178,'',0,'Panama',1),
(201,18101,181,'',0,'Amazonas',1),
(202,18102,181,'',0,'Ancash',1),
(203,18103,181,'',0,'Apurimac',1),
(204,18104,181,'',0,'Arequipa',1),
(205,18105,181,'',0,'Ayacucho',1),
(206,18106,181,'',0,'Cajamarca',1),
(207,18107,181,'',0,'Callao',1),
(208,18108,181,'',0,'Cuzco',1),
(209,18109,181,'',0,'Huancavelica',1),
(210,18110,181,'',0,'Huanuco',1),
(211,18111,181,'',0,'Ica',1),
(212,18112,181,'',0,'Junin',1),
(213,18113,181,'',0,'La Libertad',1),
(214,18114,181,'',0,'Lambayeque',1),
(215,18115,181,'',0,'Lima Metropolitana',1),
(216,18116,181,'',0,'Lima',1),
(217,18117,181,'',0,'Loreto',1),
(218,18118,181,'',0,'Madre de Dios',1),
(219,18119,181,'',0,'Moquegua',1),
(220,18120,181,'',0,'Pasco',1),
(221,18121,181,'',0,'Piura',1),
(222,18122,181,'',0,'Puno',1),
(223,18123,181,'',0,'San Martín',1),
(224,18124,181,'',0,'Tacna',1),
(225,18125,181,'',0,'Tumbes',1),
(226,18126,181,'',0,'Ucayali',1),
(227,15001,25,'PT',NULL,'Portugal',1),
(228,15002,25,'PT9',NULL,'Azores-Madeira',1),
(229,18801,188,'',0,'Romania',1),
(230,8601,86,NULL,NULL,'Central',1),
(231,8602,86,NULL,NULL,'Oriental',1),
(232,8603,86,NULL,NULL,'Occidental',1),
(233,20101,201,'SK01',NULL,'Bratislava Region',1),
(234,20102,201,'SK02',NULL,'Western Slovakia',1),
(235,20103,201,'SK03',NULL,'Central Slovakia',1),
(236,20104,201,'SK04',NULL,'Eastern Slovakia',1),
(237,20203,202,'SI03',NULL,'East Slovenia',1),
(238,20204,202,'SI04',NULL,'West Slovenia',1),
(239,401,4,'',0,'Andalucia',1),
(240,402,4,'',0,'Aragón',1),
(241,403,4,'',0,'Castilla y León',1),
(242,404,4,'',0,'Castilla la Mancha',1),
(243,405,4,'',0,'Canarias',1),
(244,406,4,'',0,'Cataluña',1),
(245,407,4,'',0,'Comunidad de Ceuta',1),
(246,408,4,'',0,'Comunidad Foral de Navarra',1),
(247,409,4,'',0,'Comunidad de Melilla',1),
(248,410,4,'',0,'Cantabria',1),
(249,411,4,'',0,'Comunidad Valenciana',1),
(250,412,4,'',0,'Extemadura',1),
(251,413,4,'',0,'Galicia',1),
(252,414,4,'',0,'Islas Baleares',1),
(253,415,4,'',0,'La Rioja',1),
(254,416,4,'',0,'Comunidad de Madrid',1),
(255,417,4,'',0,'Región de Murcia',1),
(256,418,4,'',0,'Principado de Asturias',1),
(257,419,4,'',0,'Pais Vasco',1),
(258,420,4,'',0,'Otros',1),
(259,601,6,'',1,'Cantons',1),
(260,21301,213,'TW',NULL,'Taiwan',1),
(261,1001,10,'',0,'Ariana',1),
(262,1002,10,'',0,'Béja',1),
(263,1003,10,'',0,'Ben Arous',1),
(264,1004,10,'',0,'Bizerte',1),
(265,1005,10,'',0,'Gabès',1),
(266,1006,10,'',0,'Gafsa',1),
(267,1007,10,'',0,'Jendouba',1),
(268,1008,10,'',0,'Kairouan',1),
(269,1009,10,'',0,'Kasserine',1),
(270,1010,10,'',0,'Kébili',1),
(271,1011,10,'',0,'La Manouba',1),
(272,1012,10,'',0,'Le Kef',1),
(273,1013,10,'',0,'Mahdia',1),
(274,1014,10,'',0,'Médenine',1),
(275,1015,10,'',0,'Monastir',1),
(276,1016,10,'',0,'Nabeul',1),
(277,1017,10,'',0,'Sfax',1),
(278,1018,10,'',0,'Sidi Bouzid',1),
(279,1019,10,'',0,'Siliana',1),
(280,1020,10,'',0,'Sousse',1),
(281,1021,10,'',0,'Tataouine',1),
(282,1022,10,'',0,'Tozeur',1),
(283,1023,10,'',0,'Tunis',1),
(284,1024,10,'',0,'Zaghouan',1),
(285,22701,227,'',0,'United Arab Emirates',1),
(286,701,7,'',0,'England',1),
(287,702,7,'',0,'Wales',1),
(288,703,7,'',0,'Scotland',1),
(289,704,7,'',0,'Northern Ireland',1),
(290,1101,11,'',0,'United-States',1),
(291,23201,232,'',0,'Los Andes',1),
(292,23202,232,'',0,'Capital',1),
(293,23203,232,'',0,'Central',1),
(294,23204,232,'',0,'Cento Occidental',1),
(295,23205,232,'',0,'Guayana',1),
(296,23206,232,'',0,'Insular',1),
(297,23207,232,'',0,'Los Llanos',1),
(298,23208,232,'',0,'Nor-Oriental',1),
(299,23209,232,'',0,'Zuliana',1),
(300,22101,221,'',0,'Marmara',1),
(301,22102,221,'',0,'İç Anadolu',1),
(302,22103,221,'',0,'Ege',1),
(303,22104,221,'',0,'Akdeniz',1),
(304,22105,221,'',0,'Güneydoğu',1),
(305,22106,221,'',0,'Karadeniz',1),
(306,22107,221,'',0,'Doğu Anadolu',1);
/*!40000 ALTER TABLE `llx_c_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_revenuestamp`
--

DROP TABLE IF EXISTS `llx_c_revenuestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_revenuestamp` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_pays` int NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) NOT NULL DEFAULT 'fixed',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=22103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_revenuestamp`
--

LOCK TABLES `llx_c_revenuestamp` WRITE;
/*!40000 ALTER TABLE `llx_c_revenuestamp` DISABLE KEYS */;
INSERT INTO `llx_c_revenuestamp` VALUES
(101,10,0.4,'fixed','Revenue stamp tunisia',1,NULL,NULL),
(1541,154,1.5,'percent','Revenue stamp mexico',1,NULL,NULL),
(1542,154,3,'percent','Revenue stamp mexico',1,NULL,NULL),
(22101,221,0.00948,'percent','Mukavelenameler Damga Vergisi',1,NULL,NULL),
(22102,221,0.00189,'percent','Kira mukavelenameleri Damga Vergisi',1,NULL,NULL);
/*!40000 ALTER TABLE `llx_c_revenuestamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_shipment_mode`
--

DROP TABLE IF EXISTS `llx_c_shipment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_shipment_mode` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(30) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `description` text,
  `tracking` varchar(255) DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_shipment_mode`
--

LOCK TABLES `llx_c_shipment_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_mode` DISABLE KEYS */;
INSERT INTO `llx_c_shipment_mode` VALUES
(1,1,'2023-11-22 09:05:55','CATCH','In-Store Collection','In-store collection by the customer','',1,NULL),
(2,1,'2023-11-22 09:05:55','TRANS','Generic transport service','Generic transport service','',1,NULL),
(3,1,'2023-11-22 09:05:55','COLSUI','Colissimo Suivi','Colissimo Suivi','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}',0,NULL),
(4,1,'2023-11-22 09:05:55','LETTREMAX','Lettre Max','Courrier Suivi et Lettre Max','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}',0,NULL),
(5,1,'2023-11-22 09:05:55','UPS','UPS','United Parcel Service','http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}',1,NULL),
(6,1,'2023-11-22 09:05:55','KIALA','KIALA','Relais Kiala','http://www.kiala.fr/tnt/delivery/{TRACKID}',0,NULL),
(7,1,'2023-11-22 09:05:55','GLS','GLS','General Logistics Systems','https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}',0,NULL),
(8,1,'2023-11-22 09:05:55','CHRONO','Chronopost','Chronopost','http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}',0,NULL),
(9,1,'2023-11-22 09:05:55','INPERSON','In person at your site',NULL,NULL,0,NULL),
(10,1,'2023-11-22 09:05:55','FEDEX','Fedex',NULL,'https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}',0,NULL),
(11,1,'2023-11-22 09:05:55','TNT','TNT',NULL,'https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}',0,NULL),
(12,1,'2023-11-22 09:05:55','DHL','DHL',NULL,'https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}',0,NULL),
(13,1,'2023-11-22 09:05:55','DPD','DPD',NULL,'https://www.dpd.fr/trace/{TRACKID}',0,NULL),
(14,1,'2023-11-22 09:05:55','MAINFREIGHT','Mainfreight',NULL,'https://www.mainfreight.com/track?{TRACKID}',0,NULL);
/*!40000 ALTER TABLE `llx_c_shipment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_shipment_package_type`
--

DROP TABLE IF EXISTS `llx_c_shipment_package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_shipment_package_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_shipment_package_type`
--

LOCK TABLES `llx_c_shipment_package_type` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_package_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_shipment_package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_socialnetworks`
--

DROP TABLE IF EXISTS `llx_c_socialnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_socialnetworks` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(100) DEFAULT NULL,
  `label` varchar(150) DEFAULT NULL,
  `url` text,
  `icon` varchar(20) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_socialnetworks_code_entity` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_socialnetworks`
--

LOCK TABLES `llx_c_socialnetworks` WRITE;
/*!40000 ALTER TABLE `llx_c_socialnetworks` DISABLE KEYS */;
INSERT INTO `llx_c_socialnetworks` VALUES
(1,1,'500px','500px','{socialid}','fa-500px',0),
(2,1,'dailymotion','Dailymotion','{socialid}','',0),
(3,1,'diaspora','Diaspora','{socialid}','',0),
(4,1,'discord','Discord','{socialid}','fa-discord',0),
(5,1,'facebook','Facebook','https://www.facebook.com/{socialid}','fa-facebook',1),
(6,1,'flickr','Flickr','{socialid}','fa-flickr',0),
(7,1,'gifycat','Gificat','{socialid}','',0),
(8,1,'giphy','Giphy','{socialid}','',0),
(9,1,'github','GitHub','https://www.github.com/{socialid}','',0),
(10,1,'googleplus','GooglePlus','https://www.googleplus.com/{socialid}','fa-google-plus',0),
(11,1,'instagram','Instagram','https://www.instagram.com/{socialid}','fa-instagram',1),
(12,1,'linkedin','LinkedIn','https://www.linkedin.com/{socialid}','fa-linkedin',1),
(13,1,'mastodon','Mastodon','{socialid}','',0),
(14,1,'meetup','Meetup','{socialid}','fa-meetup',0),
(15,1,'periscope','Periscope','{socialid}','',0),
(16,1,'pinterest','Pinterest','{socialid}','fa-pinterest',0),
(17,1,'quora','Quora','{socialid}','',0),
(18,1,'reddit','Reddit','{socialid}','fa-reddit',0),
(19,1,'slack','Slack','{socialid}','fa-slack',0),
(20,1,'snapchat','Snapchat','{socialid}','fa-snapchat',1),
(21,1,'skype','Skype','https://www.skype.com/{socialid}','fa-skype',1),
(22,1,'tripadvisor','Tripadvisor','{socialid}','',0),
(23,1,'tumblr','Tumblr','https://www.tumblr.com/{socialid}','fa-tumblr',0),
(24,1,'twitch','Twitch','{socialid}','',0),
(25,1,'twitter','Twitter','https://www.twitter.com/{socialid}','fa-twitter',1),
(26,1,'vero','Vero','https://vero.co/{socialid}','',0),
(27,1,'viadeo','Viadeo','https://fr.viadeo.com/fr/{socialid}','fa-viadeo',0),
(28,1,'viber','Viber','{socialid}','',0),
(29,1,'vimeo','Vimeo','{socialid}','fa-vimeo',0),
(30,1,'whatsapp','Whatsapp','{socialid}','fa-whatsapp',1),
(31,1,'wikipedia','Wikipedia','{socialid}','fa-wikipedia-w',0),
(32,1,'xing','Xing','{socialid}','fa-xing',0),
(33,1,'youtube','Youtube','https://www.youtube.com/{socialid}','fa-youtube',1);
/*!40000 ALTER TABLE `llx_c_socialnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_stcomm`
--

DROP TABLE IF EXISTS `llx_c_stcomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_stcomm` (
  `id` int NOT NULL,
  `code` varchar(24) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_stcomm`
--

LOCK TABLES `llx_c_stcomm` WRITE;
/*!40000 ALTER TABLE `llx_c_stcomm` DISABLE KEYS */;
INSERT INTO `llx_c_stcomm` VALUES
(-1,'ST_NO','Do not contact',NULL,0,1),
(0,'ST_NEVER','Never contacted',NULL,0,1),
(1,'ST_TODO','To contact',NULL,0,1),
(2,'ST_PEND','Contact in progress',NULL,0,1),
(3,'ST_DONE','Contacted',NULL,0,1);
/*!40000 ALTER TABLE `llx_c_stcomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_stcommcontact`
--

DROP TABLE IF EXISTS `llx_c_stcommcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_stcommcontact` (
  `id` int NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcommcontact` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_stcommcontact`
--

LOCK TABLES `llx_c_stcommcontact` WRITE;
/*!40000 ALTER TABLE `llx_c_stcommcontact` DISABLE KEYS */;
INSERT INTO `llx_c_stcommcontact` VALUES
(-1,'ST_NO','Do not contact',NULL,1),
(0,'ST_NEVER','Never contacted',NULL,1),
(1,'ST_TODO','To contact',NULL,1),
(2,'ST_PEND','Contact in progress',NULL,1),
(3,'ST_DONE','Contacted',NULL,1);
/*!40000 ALTER TABLE `llx_c_stcommcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_category`
--

DROP TABLE IF EXISTS `llx_c_ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_category` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `public` int DEFAULT '0',
  `use_default` int DEFAULT '1',
  `fk_parent` int NOT NULL DEFAULT '0',
  `force_severity` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_category`
--

LOCK TABLES `llx_c_ticket_category` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_category` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_category` VALUES
(1,1,'OTHER','Other',0,1,0,NULL,NULL,10,1);
/*!40000 ALTER TABLE `llx_c_ticket_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_resolution`
--

DROP TABLE IF EXISTS `llx_c_ticket_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_resolution` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int DEFAULT '1',
  `use_default` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_resolution`
--

LOCK TABLES `llx_c_ticket_resolution` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_resolution` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_resolution` VALUES
(1,1,'SOLVED','10','Solved',1,0,NULL),
(2,1,'CANCELED','50','Canceled',1,0,NULL),
(3,1,'OTHER','90','Other',1,0,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_severity`
--

DROP TABLE IF EXISTS `llx_c_ticket_severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_severity` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `active` int DEFAULT '1',
  `use_default` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_severity`
--

LOCK TABLES `llx_c_ticket_severity` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_severity` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_severity` VALUES
(1,1,'LOW','10','Low','',1,0,NULL),
(2,1,'NORMAL','20','Normal','',1,1,NULL),
(3,1,'HIGH','30','High','',1,0,NULL),
(4,1,'BLOCKING','40','Critical / blocking','',1,0,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_severity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_type`
--

DROP TABLE IF EXISTS `llx_c_ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int DEFAULT '1',
  `use_default` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_type`
--

LOCK TABLES `llx_c_ticket_type` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_type` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_type` VALUES
(1,1,'COM','10','Commercial question',1,0,NULL),
(2,1,'HELP','15','Request for functionnal help',1,0,NULL),
(3,1,'ISSUE','20','Issue or bug',1,0,NULL),
(4,1,'PROBLEM','22','Problem',0,0,NULL),
(5,1,'REQUEST','25','Change or enhancement request',1,0,NULL),
(6,1,'PROJECT','30','Project',0,0,NULL),
(7,1,'OTHER','40','Other',1,1,NULL);
/*!40000 ALTER TABLE `llx_c_ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_transport_mode`
--

DROP TABLE IF EXISTS `llx_c_transport_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_transport_mode` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(3) NOT NULL,
  `label` varchar(255) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_transport_mode`
--

LOCK TABLES `llx_c_transport_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_transport_mode` DISABLE KEYS */;
INSERT INTO `llx_c_transport_mode` VALUES
(1,1,'MAR','Transport maritime (y compris camions ou wagons sur bateau)',1),
(2,1,'TRA','Transport par chemin de fer (y compris camions sur wagon)',1),
(3,1,'ROU','Transport par route',1),
(4,1,'AIR','Transport par air',1),
(5,1,'POS','Envois postaux',1),
(6,1,'OLE','Installations de transport fixe (oléoduc)',1),
(7,1,'NAV','Transport par navigation intérieure',1),
(8,1,'PRO','Propulsion propre',1);
/*!40000 ALTER TABLE `llx_c_transport_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_tva`
--

DROP TABLE IF EXISTS `llx_c_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_tva` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_pays` int NOT NULL,
  `code` varchar(10) DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` varchar(20) NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `use_default` tinyint DEFAULT '0',
  `recuperableonly` int NOT NULL DEFAULT '0',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`)
) ENGINE=InnoDB AUTO_INCREMENT=22105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_tva`
--

LOCK TABLES `llx_c_tva` WRITE;
/*!40000 ALTER TABLE `llx_c_tva` DISABLE KEYS */;
INSERT INTO `llx_c_tva` VALUES
(11,1,'',0,'0','0','0','0',0,0,'VAT rate 0 ou non applicable',1,NULL,NULL),
(12,1,'',20,'0','0','0','0',0,0,'VAT rate - standard (France hors DOM-TOM)',1,NULL,NULL),
(13,1,'',10,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(14,1,'',5.5,'0','0','0','0',0,0,'VAT rate - reduced (France hors DOM-TOM)',1,NULL,NULL),
(15,1,'',2.1,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(16,1,'85',8.5,'0','0','0','0',0,0,'VAT rate - standard (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),
(17,1,'85NPR',8.5,'0','0','0','0',0,1,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',0,NULL,NULL),
(18,1,'85NPROM',8.5,'2','3','0','0',0,1,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer',0,NULL,NULL),
(19,1,'85NPROMOMR',8.5,'2','3','2.5','3',0,1,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional',0,NULL,NULL),
(21,2,'',0,'0','0','0','0',0,0,'VAT rate 0 ou non applicable',1,NULL,NULL),
(22,2,'',6,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(23,2,'',21,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(24,2,'',12,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(31,3,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(32,3,'',10,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(33,3,'',4,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(34,3,'',22,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(41,4,'',0,'0','3','-19:-15:-9','5',0,0,'VAT rate 0',1,NULL,NULL),
(42,4,'',10,'1.4','3','-19:-15:-9','5',0,0,'VAT rate - reduced',1,NULL,NULL),
(43,4,'',4,'0.5','3','-19:-15:-9','5',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(44,4,'',21,'5.2','3','-19:-15:-9','5',0,0,'VAT rate - standard',1,NULL,NULL),
(51,5,'',0,'0','0','0','0',0,0,'No VAT',1,NULL,NULL),
(52,5,'',7,'0','0','0','0',0,0,'ermäßigte USt.',1,NULL,NULL),
(54,5,'',5.5,'0','0','0','0',0,0,'USt. Forst',0,NULL,NULL),
(55,5,'',10.7,'0','0','0','0',0,0,'USt. Landwirtschaft',0,NULL,NULL),
(56,5,'',19,'0','0','0','0',0,0,'allgemeine Ust.',1,NULL,NULL),
(61,6,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(62,6,'',3.7,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(63,6,'',2.5,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(64,6,'',7.7,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(71,7,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(72,7,'',17.5,'0','0','0','0',0,0,'VAT rate - standard before 2011',1,NULL,NULL),
(73,7,'',5,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(74,7,'',20,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(81,8,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(82,8,'',23,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(83,8,'',13.5,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(84,8,'',9,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(85,8,'',4.8,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(91,9,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(92,9,'',13,'0','0','0','0',0,0,'VAT rate - reduced 0',1,NULL,NULL),
(93,9,'',3,'0','0','0','0',0,0,'VAT rate -  super-reduced 0',1,NULL,NULL),
(94,9,'',17,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(101,10,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(102,10,'',12,'0','0','0','0',0,0,'VAT 12%',1,NULL,NULL),
(103,10,'',18,'0','0','0','0',0,0,'VAT 18%',1,NULL,NULL),
(104,10,'',7.5,'0','0','0','0',0,0,'VAT 6% Majoré à 25% (7.5%)',1,NULL,NULL),
(105,10,'',15,'0','0','0','0',0,0,'VAT 12% Majoré à 25% (15%)',1,NULL,NULL),
(106,10,'',22.5,'0','0','0','0',0,0,'VAT 18% Majoré à 25% (22.5%)',1,NULL,NULL),
(107,10,'',6,'0','0','0','0',0,0,'VAT 6%',1,NULL,NULL),
(108,10,'',18.18,'1','4','0','0',0,0,'VAT 18%+FODEC',1,NULL,NULL),
(111,11,'',0,'0','0','0','0',0,0,'No Sales Tax',1,NULL,NULL),
(112,11,'',4,'0','0','0','0',0,0,'Sales Tax 4%',1,NULL,NULL),
(113,11,'',6,'0','0','0','0',0,0,'Sales Tax 6%',1,NULL,NULL),
(121,12,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(122,12,'',14,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(123,12,'',10,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(124,12,'',7,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(125,12,'',20,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(131,13,'',0,'0','0','0','0',0,0,'TVA 0%',1,NULL,NULL),
(132,13,'',9,'0','0','0','0',0,0,'TVA 9%',1,NULL,NULL),
(133,13,'',19,'0','0','0','0',0,0,'TVA 19%',1,NULL,NULL),
(141,14,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(142,14,'',7,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(143,14,'',5,'9.975','1','0','0',0,0,'GST/TPS and PST/TVQ rate for Province',1,NULL,NULL),
(171,17,'',0,'0','0','0','0',0,0,'0 BTW tarief',1,NULL,NULL),
(172,17,'',6,'0','0','0','0',0,0,'Verlaagd BTW tarief',1,NULL,NULL),
(173,17,'',19,'0','0','0','0',0,0,'Algemeen BTW tarief',1,NULL,NULL),
(174,17,'',21,'0','0','0','0',0,0,'Algemeen BTW tarief (vanaf 1 oktober 2012)',0,NULL,NULL),
(201,20,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(202,20,'',12,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(203,20,'',6,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(204,20,'',25,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(211,21,'',0,'0','0','0','0',0,0,'IVA Rate 0',1,NULL,NULL),
(212,21,'',18,'7.5','2','0','0',0,0,'IVA standard rate',1,NULL,NULL),
(221,22,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(222,22,'',10,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(223,22,'',18,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(231,23,'',0,'0','0','0','0',0,0,'IVA Rate 0',1,NULL,NULL),
(232,23,'',10.5,'0','0','0','0',0,0,'IVA reduced rate',1,NULL,NULL),
(233,23,'',21,'0','0','0','0',0,0,'IVA standard rate',1,NULL,NULL),
(241,24,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(242,24,'',19.25,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(251,25,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(252,25,'',13,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(253,25,'',23,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(254,25,'',6,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(261,26,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(262,26,'',5,'0','0','0','0',0,0,'VAT rate 5',1,NULL,NULL),
(271,27,'',0,'0','0','0','0',0,0,'VAT rate 0 ou non applicable',1,NULL,NULL),
(272,27,'',8.5,'0','0','0','0',0,0,'VAT rate - standard (DOM sauf Guyane et Saint-Martin)',0,NULL,NULL),
(273,27,'',8.5,'0','0','0','0',0,1,'VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',0,NULL,NULL),
(274,27,'',5.5,'0','0','0','0',0,0,'VAT rate - reduced (France hors DOM-TOM)',0,NULL,NULL),
(275,27,'',19.6,'0','0','0','0',0,0,'VAT rate - standard (France hors DOM-TOM)',1,NULL,NULL),
(276,27,'',2.1,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(277,27,'',7,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(281,28,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(282,28,'',10,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(351,35,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(352,35,'',7,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(353,35,'',14,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(411,41,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(412,41,'',10,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(413,41,'',20,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(461,46,'',0,'0','0','0','0',0,0,'No VAT',1,NULL,NULL),
(462,46,'',15,'0','0','0','0',0,0,'VAT 15%',1,NULL,NULL),
(463,46,'',7.5,'0','0','0','0',0,0,'VAT 7.5%',1,NULL,NULL),
(561,56,'',0,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(591,59,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(592,59,'',7,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(593,59,'',20,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(671,67,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(672,67,'',19,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(721,72,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(722,72,'',18,'0.9','1','0','0',0,0,'VAT rate 18+0.9',1,NULL,NULL),
(761,76,'',25,'0','0','0','0',0,0,'PDV 25%',1,NULL,NULL),
(762,76,'',13,'0','0','0','0',0,0,'PDV 13%',1,NULL,NULL),
(763,76,'',5,'0','0','0','0',0,0,'PDV 5%',1,NULL,NULL),
(764,76,'',0,'0','0','0','0',0,0,'PDV 0%',1,NULL,NULL),
(781,78,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(782,78,'',9,'0','0','0','0',0,0,'VAT rate 9',1,NULL,NULL),
(783,78,'',5,'0','0','0','0',0,0,'VAT rate 5',1,NULL,NULL),
(784,78,'',19,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(801,80,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(802,80,'',25,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(861,86,'',0,'0','0','0','0',0,0,'SIN IVA',1,NULL,NULL),
(862,86,'',13,'0','0','0','0',0,0,'IVA 13',1,NULL,NULL),
(1021,102,'',0,'0','0','0','0',0,0,'Μηδενικό Φ.Π.Α.',1,NULL,NULL),
(1022,102,'',24,'0','0','0','0',0,0,'Κανονικός Φ.Π.Α.',1,NULL,NULL),
(1023,102,'',13,'0','0','0','0',0,0,'Μειωμένος Φ.Π.Α.',1,NULL,NULL),
(1024,102,'',6,'0','0','0','0',0,0,'Υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),
(1025,102,'',16,'0','0','0','0',0,0,'Νήσων κανονικός Φ.Π.Α.',1,NULL,NULL),
(1026,102,'',9,'0','0','0','0',0,0,'Νήσων μειωμένος Φ.Π.Α.',1,NULL,NULL),
(1027,102,'',4,'0','0','0','0',0,0,'Νήσων υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),
(1028,102,'',17,'0','0','0','0',0,0,'Νήσων υπερμειωμένος Φ.Π.Α.',1,NULL,NULL),
(1141,114,'',0,'0','0','0','0',0,0,'No ISV',1,NULL,NULL),
(1142,114,'',12,'0','0','0','0',0,0,'ISV 12%',1,NULL,NULL),
(1161,116,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1162,116,'',7,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1163,116,'',25.5,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1171,117,'',0,'0','0','0','0',0,0,'VAT rate 0',0,NULL,NULL),
(1172,117,'C+S-5',0,'2.5','1','2.5','1',0,0,'CGST+SGST - Same state sales',1,NULL,NULL),
(1173,117,'I-5',5,'0','0','0','0',0,0,'IGST',1,NULL,NULL),
(1174,117,'C+S-12',0,'6','1','6','1',0,0,'CGST+SGST - Same state sales',1,NULL,NULL),
(1175,117,'I-12',12,'0','0','0','0',0,0,'IGST',1,NULL,NULL),
(1176,117,'C+S-18',0,'9','1','9','1',0,0,'CGST+SGST - Same state sales',1,NULL,NULL),
(1177,117,'I-18',18,'0','0','0','0',0,0,'IGST',1,NULL,NULL),
(1178,117,'C+S-28',0,'14','1','14','1',0,0,'CGST+SGST - Same state sales',1,NULL,NULL),
(1179,117,'I-28',28,'0','0','0','0',0,0,'IGST',1,NULL,NULL),
(1231,123,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1232,123,'',5,'0','0','0','0',0,0,'VAT rate 5',1,NULL,NULL),
(1401,140,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1402,140,'',14,'0','0','0','0',0,0,'VAT rate - intermediary',1,NULL,NULL),
(1403,140,'',8,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1404,140,'',3,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(1405,140,'',16,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1471,147,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1472,147,'',18,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1481,148,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1482,148,'',7,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1483,148,'',5,'0','0','0','0',0,0,'VAT rate - super-reduced',1,NULL,NULL),
(1484,148,'',18,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1511,151,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1512,151,'',14,'0','0','0','0',0,0,'VAT rate 14',1,NULL,NULL),
(1521,152,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1522,152,'',15,'0','0','0','0',0,0,'VAT rate 15',1,NULL,NULL),
(1541,154,'',0,'0','0','0','0',0,0,'No VAT',1,NULL,NULL),
(1542,154,'',16,'0','0','0','0',0,0,'VAT 16%',1,NULL,NULL),
(1543,154,'',10,'0','0','0','0',0,0,'VAT Frontero',1,NULL,NULL),
(1651,165,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1652,165,'',3,'0','0','0','0',0,0,'VAT standard 3',1,NULL,NULL),
(1653,165,'',6,'0','0','0','0',0,0,'VAT standard 6',1,NULL,NULL),
(1654,165,'',11,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1655,165,'',22,'0','0','0','0',0,0,'VAT standard high',1,NULL,NULL),
(1661,166,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1662,166,'',15,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1691,169,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1692,169,'',5,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1731,173,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1732,173,'',14,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1733,173,'',8,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1734,173,'',25,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1781,178,'',0,'0','0','0','0',0,0,'ITBMS Rate 0',1,NULL,NULL),
(1782,178,'',7,'0','0','0','0',0,0,'ITBMS standard rate',1,NULL,NULL),
(1811,181,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1818,181,'',18,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1841,184,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1842,184,'',8,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1843,184,'',3,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1844,184,'',23,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1881,188,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(1882,188,'',9,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1883,188,'',19,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(1884,188,'',5,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(1931,193,'',0,'0','0','0','0',0,0,'No VAT in SPM',1,NULL,NULL),
(2011,201,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(2012,201,'',10,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(2013,201,'',20,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(2021,202,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(2022,202,'',9.5,'0','0','0','0',0,0,'VAT rate - reduced',1,NULL,NULL),
(2023,202,'',22,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(2051,205,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(2052,205,'',15,'0','0','0','0',0,0,'VAT rate - standard',1,NULL,NULL),
(2071,207,'',0,'0','0','0','0',0,0,'VAT 0',1,NULL,NULL),
(2072,207,'',15,'0','0','0','0',0,0,'VAT 15%',1,NULL,NULL),
(2131,213,'',0,'0','0','0','0',0,0,'VAT 0',1,NULL,NULL),
(2132,213,'',5,'0','0','0','0',0,0,'VAT 5%',1,NULL,NULL),
(2261,226,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(2262,226,'',20,'0','0','0','0',0,0,'VAT standart rate',1,NULL,NULL),
(2321,232,'',0,'0','0','0','0',0,0,'No VAT',1,NULL,NULL),
(2322,232,'',12,'0','0','0','0',0,0,'VAT 12%',1,NULL,NULL),
(2323,232,'',8,'0','0','0','0',0,0,'VAT 8%',1,NULL,NULL),
(2331,233,'',0,'0','0','0','0',0,0,'Thuế GTGT đươc khấu trừ 0%',1,NULL,NULL),
(2332,233,'',5,'0','0','0','0',0,0,'Thuế GTGT đươc khấu trừ 5%',1,NULL,NULL),
(2333,233,'',8,'0','0','0','0',0,0,'Thuế GTGT đươc khấu trừ 8%',1,NULL,NULL),
(2334,233,'',10,'0','0','0','0',0,0,'Thuế GTGT đươc khấu trừ 10%',1,NULL,NULL),
(2335,61,'',0,'0','0','0','0',0,0,'No VAT',1,NULL,NULL),
(2336,61,'',10,'0','0','0','0',0,0,'VAT 10%',1,NULL,NULL),
(2337,61,'',18,'0','0','0','0',0,0,'VAT 18%',1,NULL,NULL),
(2461,246,'',0,'0','0','0','0',0,0,'VAT rate 0',1,NULL,NULL),
(22101,221,'',0,'0','0','0','0',0,0,'No VAT',1,NULL,NULL),
(22102,221,'',1,'0','0','0','0',0,0,'VAT 1%',1,NULL,NULL),
(22103,221,'',8,'0','0','0','0',0,0,'VAT 8%',1,NULL,NULL),
(22104,221,'',18,'0','0','0','0',0,0,'VAT 18%',1,NULL,NULL);
/*!40000 ALTER TABLE `llx_c_tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_contact`
--

DROP TABLE IF EXISTS `llx_c_type_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_contact` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `element` varchar(30) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_contact`
--

LOCK TABLES `llx_c_type_contact` WRITE;
/*!40000 ALTER TABLE `llx_c_type_contact` DISABLE KEYS */;
INSERT INTO `llx_c_type_contact` VALUES
(1,'contrat','internal','SALESREPSIGN','Commercial signataire du contrat',1,NULL,0),
(2,'contrat','internal','SALESREPFOLL','Commercial suivi du contrat',1,NULL,0),
(3,'contrat','external','BILLING','Contact client facturation contrat',1,NULL,0),
(4,'contrat','external','CUSTOMER','Contact client suivi contrat',1,NULL,0),
(5,'contrat','external','SALESREPSIGN','Contact client signataire contrat',1,NULL,0),
(6,'propal','internal','SALESREPFOLL','Commercial à l\'origine de la propale',1,NULL,0),
(7,'propal','external','BILLING','Contact client facturation propale',1,NULL,0),
(8,'propal','external','CUSTOMER','Contact client suivi propale',1,NULL,0),
(9,'propal','external','SHIPPING','Contact client livraison propale',1,NULL,0),
(10,'facture','internal','SALESREPFOLL','Responsable suivi du paiement',1,NULL,0),
(11,'facture','external','BILLING','Contact client facturation',1,NULL,0),
(12,'facture','external','SHIPPING','Contact client livraison',1,NULL,0),
(13,'facture','external','SERVICE','Contact client prestation',1,NULL,0),
(14,'invoice_supplier','internal','SALESREPFOLL','Responsable suivi du paiement',1,NULL,0),
(15,'invoice_supplier','external','BILLING','Contact fournisseur facturation',1,NULL,0),
(16,'invoice_supplier','external','SHIPPING','Contact fournisseur livraison',1,NULL,0),
(17,'invoice_supplier','external','SERVICE','Contact fournisseur prestation',1,NULL,0),
(18,'agenda','internal','ACTOR','Responsable',1,NULL,0),
(19,'agenda','internal','GUEST','Guest',1,NULL,0),
(20,'agenda','external','ACTOR','Responsable',1,NULL,0),
(21,'agenda','external','GUEST','Guest',1,NULL,0),
(22,'commande','internal','SALESREPFOLL','Responsable suivi de la commande',1,NULL,0),
(23,'commande','external','BILLING','Contact client facturation commande',1,NULL,0),
(24,'commande','external','CUSTOMER','Contact client suivi commande',1,NULL,0),
(25,'commande','external','SHIPPING','Contact client livraison commande',1,NULL,0),
(26,'fichinter','internal','INTERREPFOLL','Responsable suivi de l\'intervention',1,NULL,0),
(27,'fichinter','internal','INTERVENING','Intervenant',1,NULL,0),
(28,'fichinter','external','BILLING','Contact client facturation intervention',1,NULL,0),
(29,'fichinter','external','CUSTOMER','Contact client suivi de l\'intervention',1,NULL,0),
(30,'order_supplier','internal','SALESREPFOLL','Responsable suivi de la commande',1,NULL,0),
(31,'order_supplier','internal','SHIPPING','Responsable réception de la commande',1,NULL,0),
(32,'order_supplier','external','BILLING','Contact fournisseur facturation commande',1,NULL,0),
(33,'order_supplier','external','CUSTOMER','Contact fournisseur suivi commande',1,NULL,0),
(34,'order_supplier','external','SHIPPING','Contact fournisseur livraison commande',1,NULL,0),
(35,'dolresource','internal','USERINCHARGE','In charge of resource',1,NULL,0),
(36,'dolresource','external','THIRDINCHARGE','In charge of resource',1,NULL,0),
(37,'ticket','internal','SUPPORTTEC','Utilisateur contact support',1,NULL,0),
(38,'ticket','internal','CONTRIBUTOR','Intervenant',1,NULL,0),
(39,'ticket','external','SUPPORTCLI','Contact client suivi incident',1,NULL,0),
(40,'ticket','external','CONTRIBUTOR','Intervenant',1,NULL,0),
(41,'project','internal','PROJECTLEADER','Chef de Projet',1,NULL,0),
(42,'project','internal','PROJECTCONTRIBUTOR','Intervenant',1,NULL,0),
(43,'project','external','PROJECTLEADER','Chef de Projet',1,NULL,0),
(44,'project','external','PROJECTCONTRIBUTOR','Intervenant',1,NULL,0),
(45,'project_task','internal','TASKEXECUTIVE','Responsable',1,NULL,0),
(46,'project_task','internal','TASKCONTRIBUTOR','Intervenant',1,NULL,0),
(47,'project_task','external','TASKEXECUTIVE','Responsable',1,NULL,0),
(48,'project_task','external','TASKCONTRIBUTOR','Intervenant',1,NULL,0),
(49,'supplier_proposal','internal','SALESREPFOLL','Responsable suivi de la demande',1,NULL,0),
(50,'supplier_proposal','external','BILLING','Contact fournisseur facturation',1,NULL,0),
(51,'supplier_proposal','external','SHIPPING','Contact fournisseur livraison',1,NULL,0),
(52,'supplier_proposal','external','SERVICE','Contact fournisseur prestation',1,NULL,0),
(53,'conferenceorbooth','internal','MANAGER','Conference or Booth manager',1,NULL,0),
(54,'conferenceorbooth','external','SPEAKER','Conference Speaker',1,NULL,0),
(55,'conferenceorbooth','external','RESPONSIBLE','Booth responsible',1,NULL,0);
/*!40000 ALTER TABLE `llx_c_type_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_container`
--

DROP TABLE IF EXISTS `llx_c_type_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_container` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `label` varchar(128) NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_container`
--

LOCK TABLES `llx_c_type_container` WRITE;
/*!40000 ALTER TABLE `llx_c_type_container` DISABLE KEYS */;
INSERT INTO `llx_c_type_container` VALUES
(1,'page',1,'Page','system',1),
(2,'banner',1,'Banner','system',1),
(3,'blogpost',1,'BlogPost','system',1),
(4,'menu',1,'Menu','system',1),
(5,'other',1,'Other','system',1);
/*!40000 ALTER TABLE `llx_c_type_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_fees`
--

DROP TABLE IF EXISTS `llx_c_type_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `type` int DEFAULT '0',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_type_fees` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_fees`
--

LOCK TABLES `llx_c_type_fees` WRITE;
/*!40000 ALTER TABLE `llx_c_type_fees` DISABLE KEYS */;
INSERT INTO `llx_c_type_fees` VALUES
(1,'TF_OTHER','Other',0,NULL,1,NULL,0),
(2,'TF_TRIP','Transportation',0,NULL,1,NULL,0),
(3,'TF_LUNCH','Lunch',0,NULL,1,NULL,0),
(4,'EX_KME','ExpLabelKm',0,NULL,1,NULL,0),
(5,'EX_FUE','ExpLabelFuelCV',0,NULL,0,NULL,0),
(6,'EX_HOT','ExpLabelHotel',0,NULL,0,NULL,0),
(7,'EX_PAR','ExpLabelParkingCV',0,NULL,0,NULL,0),
(8,'EX_TOL','ExpLabelTollCV',0,NULL,0,NULL,0),
(9,'EX_TAX','ExpLabelVariousTaxes',0,NULL,0,NULL,0),
(10,'EX_IND','ExpLabelIndemnityTransSubscrip',0,NULL,0,NULL,0),
(11,'EX_SUM','ExpLabelMaintenanceSupply',0,NULL,0,NULL,0),
(12,'EX_SUO','ExpLabelOfficeSupplies',0,NULL,0,NULL,0),
(13,'EX_CAR','ExpLabelCarRental',0,NULL,0,NULL,0),
(14,'EX_DOC','ExpLabelDocumentation',0,NULL,0,NULL,0),
(15,'EX_CUR','ExpLabelCustomersReceiving',0,NULL,0,NULL,0),
(16,'EX_OTR','ExpLabelOtherReceiving',0,NULL,0,NULL,0),
(17,'EX_POS','ExpLabelPostage',0,NULL,0,NULL,0),
(18,'EX_CAM','ExpLabelMaintenanceRepairCV',0,NULL,0,NULL,0),
(19,'EX_EMM','ExpLabelEmployeesMeal',0,NULL,0,NULL,0),
(20,'EX_GUM','ExpLabelGuestsMeal',0,NULL,0,NULL,0),
(21,'EX_BRE','ExpLabelBreakfast',0,NULL,0,NULL,0),
(22,'EX_FUE_VP','ExpLabelFuelPV',0,NULL,0,NULL,0),
(23,'EX_TOL_VP','ExpLabelTollPV',0,NULL,0,NULL,0),
(24,'EX_PAR_VP','ExpLabelParkingPV',0,NULL,0,NULL,0),
(25,'EX_CAM_VP','ExpLabelMaintenanceRepairPV',0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `llx_c_type_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_resource`
--

DROP TABLE IF EXISTS `llx_c_type_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_resource` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_resource`
--

LOCK TABLES `llx_c_type_resource` WRITE;
/*!40000 ALTER TABLE `llx_c_type_resource` DISABLE KEYS */;
INSERT INTO `llx_c_type_resource` VALUES
(1,'RES_ROOMS','Rooms',1),
(2,'RES_CARS','Cars',1);
/*!40000 ALTER TABLE `llx_c_type_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_typent`
--

DROP TABLE IF EXISTS `llx_c_typent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_typent` (
  `id` int NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_typent` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_typent`
--

LOCK TABLES `llx_c_typent` WRITE;
/*!40000 ALTER TABLE `llx_c_typent` DISABLE KEYS */;
INSERT INTO `llx_c_typent` VALUES
(1,'TE_STARTUP','Start-up',NULL,0,NULL,0),
(2,'TE_GROUP','Grand groupe',NULL,1,NULL,0),
(3,'TE_MEDIUM','PME/PMI',NULL,1,NULL,0),
(4,'TE_SMALL','TPE',NULL,1,NULL,0),
(5,'TE_ADMIN','Administration',NULL,1,NULL,0),
(6,'TE_WHOLE','Grossiste',NULL,0,NULL,0),
(7,'TE_RETAIL','Revendeur',NULL,0,NULL,0),
(8,'TE_PRIVATE','Particulier',NULL,1,NULL,0),
(100,'TE_OTHER','Autres',NULL,1,NULL,0),
(231,'TE_A_RI','Responsable Inscripto (typo A)',23,0,NULL,0),
(232,'TE_B_RNI','Responsable No Inscripto (typo B)',23,0,NULL,0),
(233,'TE_C_FE','Consumidor Final/Exento (typo C)',23,0,NULL,0);
/*!40000 ALTER TABLE `llx_c_typent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_units`
--

DROP TABLE IF EXISTS `llx_c_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_units` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(3) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `scale` int DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `short_label` varchar(5) DEFAULT NULL,
  `unit_type` varchar(10) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_units_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_units`
--

LOCK TABLES `llx_c_units` WRITE;
/*!40000 ALTER TABLE `llx_c_units` DISABLE KEYS */;
INSERT INTO `llx_c_units` VALUES
(1,'T',100,3,'WeightUnitton','T','weight',1),
(2,'KG',110,0,'WeightUnitkg','kg','weight',1),
(3,'G',120,-3,'WeightUnitg','g','weight',1),
(4,'MG',130,-6,'WeightUnitmg','mg','weight',1),
(5,'OZ',140,98,'WeightUnitounce','Oz','weight',1),
(6,'LB',150,99,'WeightUnitpound','lb','weight',1),
(7,'M',200,0,'SizeUnitm','m','size',1),
(8,'DM',210,-1,'SizeUnitdm','dm','size',1),
(9,'CM',220,-2,'SizeUnitcm','cm','size',1),
(10,'MM',230,-3,'SizeUnitmm','mm','size',1),
(11,'FT',240,98,'SizeUnitfoot','ft','size',1),
(12,'IN',250,99,'SizeUnitinch','in','size',1),
(13,'M2',300,0,'SurfaceUnitm2','m2','surface',1),
(14,'DM2',310,-2,'SurfaceUnitdm2','dm2','surface',1),
(15,'CM2',320,-4,'SurfaceUnitcm2','cm2','surface',1),
(16,'MM2',330,-6,'SurfaceUnitmm2','mm2','surface',1),
(17,'FT2',340,98,'SurfaceUnitfoot2','ft2','surface',1),
(18,'IN2',350,99,'SurfaceUnitinch2','in2','surface',1),
(19,'M3',400,0,'VolumeUnitm3','m3','volume',1),
(20,'DM3',410,-3,'VolumeUnitdm3','dm3','volume',1),
(21,'CM3',420,-6,'VolumeUnitcm3','cm3','volume',1),
(22,'MM3',430,-9,'VolumeUnitmm3','mm3','volume',1),
(23,'FT3',440,88,'VolumeUnitfoot3','ft3','volume',1),
(24,'IN3',450,89,'VolumeUnitinch3','in3','volume',1),
(25,'OZ3',460,97,'VolumeUnitounce','Oz','volume',1),
(26,'L',470,98,'VolumeUnitlitre','L','volume',1),
(27,'GAL',480,99,'VolumeUnitgallon','gal','volume',1),
(28,'P',500,0,'Piece','p','qty',1),
(29,'SET',510,0,'Set','set','qty',1),
(30,'S',600,0,'second','s','time',1),
(31,'MI',610,60,'minute','i','time',1),
(32,'H',620,3600,'hour','h','time',1),
(33,'D',630,86400,'day','d','time',1),
(34,'W',640,604800,'week','w','time',1),
(35,'MO',650,2629800,'month','m','time',1),
(36,'Y',660,31557600,'year','y','time',1);
/*!40000 ALTER TABLE `llx_c_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ziptown`
--

DROP TABLE IF EXISTS `llx_c_ziptown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ziptown` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int DEFAULT NULL,
  `fk_pays` int NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL,
  `town` varchar(180) NOT NULL,
  `town_up` varchar(180) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  KEY `idx_c_ziptown_fk_county` (`fk_county`),
  KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  KEY `idx_c_ziptown_zip` (`zip`),
  CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `llx_c_departements` (`rowid`),
  CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ziptown`
--

LOCK TABLES `llx_c_ziptown` WRITE;
/*!40000 ALTER TABLE `llx_c_ziptown` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_ziptown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie`
--

DROP TABLE IF EXISTS `llx_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_parent` int NOT NULL DEFAULT '0',
  `label` varchar(180) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1',
  `description` text,
  `color` varchar(8) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `visible` tinyint NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie`
--

LOCK TABLES `llx_categorie` WRITE;
/*!40000 ALTER TABLE `llx_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_account`
--

DROP TABLE IF EXISTS `llx_categorie_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_account` (
  `fk_categorie` int NOT NULL,
  `fk_account` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_account`),
  KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_account_fk_account` (`fk_account`),
  CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_account`
--

LOCK TABLES `llx_categorie_account` WRITE;
/*!40000 ALTER TABLE `llx_categorie_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_actioncomm`
--

DROP TABLE IF EXISTS `llx_categorie_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_actioncomm` (
  `fk_categorie` int NOT NULL,
  `fk_actioncomm` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`),
  CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llx_actioncomm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_actioncomm`
--

LOCK TABLES `llx_categorie_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_categorie_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_contact`
--

DROP TABLE IF EXISTS `llx_categorie_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_contact` (
  `fk_categorie` int NOT NULL,
  `fk_socpeople` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_contact`
--

LOCK TABLES `llx_categorie_contact` WRITE;
/*!40000 ALTER TABLE `llx_categorie_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_fournisseur`
--

DROP TABLE IF EXISTS `llx_categorie_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_fournisseur` (
  `fk_categorie` int NOT NULL,
  `fk_soc` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_fournisseur`
--

LOCK TABLES `llx_categorie_fournisseur` WRITE;
/*!40000 ALTER TABLE `llx_categorie_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_lang`
--

DROP TABLE IF EXISTS `llx_categorie_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_category` int NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`),
  CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_lang`
--

LOCK TABLES `llx_categorie_lang` WRITE;
/*!40000 ALTER TABLE `llx_categorie_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_member`
--

DROP TABLE IF EXISTS `llx_categorie_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_member` (
  `fk_categorie` int NOT NULL,
  `fk_member` int NOT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_member`),
  KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_member_fk_member` (`fk_member`),
  CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `llx_adherent` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_member`
--

LOCK TABLES `llx_categorie_member` WRITE;
/*!40000 ALTER TABLE `llx_categorie_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_product`
--

DROP TABLE IF EXISTS `llx_categorie_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_product` (
  `fk_categorie` int NOT NULL,
  `fk_product` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_product`),
  KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_product_fk_product` (`fk_product`),
  CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_product`
--

LOCK TABLES `llx_categorie_product` WRITE;
/*!40000 ALTER TABLE `llx_categorie_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_project`
--

DROP TABLE IF EXISTS `llx_categorie_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_project` (
  `fk_categorie` int NOT NULL,
  `fk_project` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_project`),
  KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_project_fk_project` (`fk_project`),
  CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `llx_projet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_project`
--

LOCK TABLES `llx_categorie_project` WRITE;
/*!40000 ALTER TABLE `llx_categorie_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_societe`
--

DROP TABLE IF EXISTS `llx_categorie_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_societe` (
  `fk_categorie` int NOT NULL,
  `fk_soc` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_societe_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_societe`
--

LOCK TABLES `llx_categorie_societe` WRITE;
/*!40000 ALTER TABLE `llx_categorie_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_user`
--

DROP TABLE IF EXISTS `llx_categorie_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_user` (
  `fk_categorie` int NOT NULL,
  `fk_user` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_user`),
  KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_user_fk_user` (`fk_user`),
  CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_user`
--

LOCK TABLES `llx_categorie_user` WRITE;
/*!40000 ALTER TABLE `llx_categorie_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_warehouse`
--

DROP TABLE IF EXISTS `llx_categorie_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_warehouse` (
  `fk_categorie` int NOT NULL,
  `fk_warehouse` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `llx_entrepot` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_warehouse`
--

LOCK TABLES `llx_categorie_warehouse` WRITE;
/*!40000 ALTER TABLE `llx_categorie_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categories_extrafields`
--

DROP TABLE IF EXISTS `llx_categories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categories_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_categories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categories_extrafields`
--

LOCK TABLES `llx_categories_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_categories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_chargesociales`
--

DROP TABLE IF EXISTS `llx_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_chargesociales` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_type` int NOT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `paye` smallint NOT NULL DEFAULT '0',
  `periode` date DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_chargesociales`
--

LOCK TABLES `llx_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_chargesociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande`
--

DROP TABLE IF EXISTS `llx_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `source` smallint DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `amount_ht` double(24,8) DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `facture` tinyint DEFAULT '0',
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `fk_availability` int DEFAULT NULL,
  `fk_input_reason` int DEFAULT NULL,
  `fk_delivery_address` int DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  KEY `idx_commande_fk_soc` (`fk_soc`),
  KEY `idx_commande_fk_user_author` (`fk_user_author`),
  KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_commande_fk_projet` (`fk_projet`),
  KEY `idx_commande_fk_account` (`fk_account`),
  KEY `idx_commande_fk_currency` (`fk_currency`),
  CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande`
--

LOCK TABLES `llx_commande` WRITE;
/*!40000 ALTER TABLE `llx_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_extrafields`
--

LOCK TABLES `llx_commande_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_approve` int DEFAULT NULL,
  `fk_user_approve2` int DEFAULT NULL,
  `source` smallint NOT NULL,
  `fk_statut` smallint DEFAULT '0',
  `billed` smallint DEFAULT '0',
  `amount_ht` double(24,8) DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `fk_input_method` int DEFAULT '0',
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`entity`),
  KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  KEY `billed` (`billed`),
  CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur`
--

LOCK TABLES `llx_commande_fournisseur` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_dispatch`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_dispatch` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `fk_commandefourndet` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_reception` int DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cost_price` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseur_dispatch_fk_reception` (`fk_reception`),
  KEY `idx_commande_fournisseur_dispatch_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseur_dispatch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `llx_reception` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_dispatch`
--

LOCK TABLES `llx_commande_fournisseur_dispatch` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_dispatch_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_dispatch_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_dispatch_extrafields`
--

LOCK TABLES `llx_commande_fournisseur_dispatch_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_extrafields`
--

LOCK TABLES `llx_commande_fournisseur_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_log`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datelog` datetime NOT NULL,
  `fk_commande` int NOT NULL,
  `fk_statut` smallint NOT NULL,
  `fk_user` int NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_log`
--

LOCK TABLES `llx_commande_fournisseur_log` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseurdet`
--

DROP TABLE IF EXISTS `llx_commande_fournisseurdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseurdet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseurdet`
--

LOCK TABLES `llx_commande_fournisseurdet` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseurdet_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseurdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseurdet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseurdet_extrafields`
--

LOCK TABLES `llx_commande_fournisseurdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commandedet`
--

DROP TABLE IF EXISTS `llx_commandedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commandedet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_commandefourndet` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_fk_commande` (`fk_commande`),
  KEY `idx_commandedet_fk_product` (`fk_product`),
  KEY `fk_commandedet_fk_unit` (`fk_unit`),
  KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`),
  CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `llx_commande_fournisseurdet` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commandedet`
--

LOCK TABLES `llx_commandedet` WRITE;
/*!40000 ALTER TABLE `llx_commandedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commandedet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commandedet_extrafields`
--

DROP TABLE IF EXISTS `llx_commandedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commandedet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commandedet_extrafields`
--

LOCK TABLES `llx_commandedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commandedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commandedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_comment`
--

DROP TABLE IF EXISTS `llx_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_comment` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_element` int DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int DEFAULT '1',
  `import_key` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_comment`
--

LOCK TABLES `llx_comment` WRITE;
/*!40000 ALTER TABLE `llx_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_const`
--

DROP TABLE IF EXISTS `llx_const`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_const` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `type` varchar(64) DEFAULT 'string',
  `visible` tinyint NOT NULL DEFAULT '1',
  `note` text,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_const` (`name`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_const`
--

LOCK TABLES `llx_const` WRITE;
/*!40000 ALTER TABLE `llx_const` DISABLE KEYS */;
INSERT INTO `llx_const` VALUES
(2,'MAIN_FEATURES_LEVEL',0,'0','chaine',1,'Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development','2023-11-22 09:05:55'),
(3,'MAILING_LIMIT_SENDBYWEB',0,'25','chaine',1,'Number of targets to defined packet size when sending mass email','2023-11-22 09:05:55'),
(4,'SYSLOG_HANDLERS',0,'[\"mod_syslog_file\"]','chaine',0,'Which logger to use','2023-11-22 09:05:55'),
(5,'SYSLOG_FILE',0,'DOL_DATA_ROOT/dolibarr.log','chaine',0,'Directory where to write log file','2023-11-22 09:05:55'),
(6,'SYSLOG_LEVEL',0,'7','chaine',0,'Level of debug info to show','2023-11-22 09:05:55'),
(7,'MAIN_UPLOAD_DOC',0,'2048','chaine',0,'Max size for file upload (0 means no upload allowed)','2023-11-22 09:05:55'),
(8,'MAIN_ENABLE_OVERWRITE_TRANSLATION',1,'1','chaine',0,'Enable translation overwrite','2023-11-22 09:05:55'),
(9,'MAIN_ENABLE_DEFAULT_VALUES',1,'1','chaine',0,'Enable default value overwrite','2023-11-22 09:05:55'),
(11,'MAIN_MAIL_SMTP_SERVER',1,'','chaine',0,'Host or ip address for SMTP server','2023-11-22 09:05:55'),
(12,'MAIN_MAIL_SMTP_PORT',1,'','chaine',0,'Port for SMTP server','2023-11-22 09:05:55'),
(13,'MAIN_MAIL_EMAIL_FROM',1,'robot@domain.com','chaine',0,'email emitter for Dolibarr automatic emails','2023-11-22 09:05:55'),
(14,'MAIN_SIZE_LISTE_LIMIT',0,'20','chaine',0,'Maximum length of lists','2023-11-22 09:05:55'),
(15,'MAIN_SIZE_SHORTLIST_LIMIT',0,'3','chaine',0,'Maximum length of short lists','2023-11-22 09:05:55'),
(16,'MAIN_MENU_STANDARD',0,'eldy_menu.php','chaine',0,'Menu manager for internal users','2023-11-22 09:05:55'),
(17,'MAIN_MENUFRONT_STANDARD',0,'eldy_menu.php','chaine',0,'Menu manager for external users','2023-11-22 09:05:55'),
(18,'MAIN_MENU_SMARTPHONE',0,'eldy_menu.php','chaine',0,'Menu manager for internal users using smartphones','2023-11-22 09:05:55'),
(19,'MAIN_MENUFRONT_SMARTPHONE',0,'eldy_menu.php','chaine',0,'Menu manager for external users using smartphones','2023-11-22 09:05:55'),
(20,'THEME_ELDY_USEBORDERONTABLE',0,'1','chaine',0,'Enable the border in theme','2023-11-22 09:05:55'),
(21,'MAIN_DELAY_ACTIONS_TODO',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées','2023-11-22 09:05:55'),
(22,'MAIN_DELAY_ORDERS_TO_PROCESS',1,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées','2023-11-22 09:05:55'),
(23,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées','2023-11-22 09:05:55'),
(24,'MAIN_DELAY_PROPALS_TO_CLOSE',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales à cloturer','2023-11-22 09:05:55'),
(25,'MAIN_DELAY_PROPALS_TO_BILL',1,'7','chaine',0,'Tolérance de retard avant alerte (en jours) sur propales non facturées','2023-11-22 09:05:55'),
(26,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures client impayées','2023-11-22 09:05:55'),
(27,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY',1,'2','chaine',0,'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées','2023-11-22 09:05:55'),
(28,'MAIN_DELAY_NOT_ACTIVATED_SERVICES',1,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services à activer','2023-11-22 09:05:55'),
(29,'MAIN_DELAY_RUNNING_SERVICES',1,'0','chaine',0,'Tolérance de retard avant alerte (en jours) sur services expirés','2023-11-22 09:05:55'),
(30,'MAIN_DELAY_MEMBERS',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard','2023-11-22 09:05:55'),
(31,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE',1,'62','chaine',0,'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire','2023-11-22 09:05:55'),
(32,'MAIN_DELAY_EXPENSEREPORTS_TO_PAY',1,'31','chaine',0,'Tolérance de retard avant alerte (en jours) sur les notes de frais impayées','2023-11-22 09:05:55'),
(33,'MAILING_EMAIL_FROM',1,'no-reply@mydomain.com','chaine',0,'EMail emmetteur pour les envois d emailings','2023-11-22 09:05:55'),
(34,'PRODUCT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/products','chaine',0,NULL,'2023-11-22 09:05:55'),
(35,'CONTRACT_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/contracts','chaine',0,NULL,'2023-11-22 09:05:55'),
(36,'USERGROUP_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/usergroups','chaine',0,NULL,'2023-11-22 09:05:55'),
(37,'USER_ADDON_PDF_ODT_PATH',1,'DOL_DATA_ROOT/doctemplates/users','chaine',0,NULL,'2023-11-22 09:05:55'),
(38,'PRODUCT_PRICE_BASE_TYPE',0,'HT','string',0,NULL,'2023-11-22 09:05:55'),
(39,'ADHERENT_LOGIN_NOT_REQUIRED',0,'1','string',0,NULL,'2023-11-22 09:05:55'),
(40,'MAIN_MODULE_USER',0,'1','string',0,'{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}','2023-11-22 09:05:55'),
(41,'DATABASE_PWD_ENCRYPTED',1,'1','chaine',0,'','2023-11-22 09:05:55'),
(42,'MAIN_SECURITY_SALT',0,'20231122090555','chaine',0,'','2023-11-22 09:05:55'),
(43,'MAIN_SECURITY_HASH_ALGO',0,'password_hash','chaine',0,'','2023-11-22 09:05:55'),
(44,'MAIN_VERSION_FIRST_INSTALL',0,'18.0.2','chaine',0,'Dolibarr version when first install','2023-11-22 09:05:55'),
(45,'MAIN_VERSION_LAST_INSTALL',0,'18.0.2','chaine',0,'Dolibarr version when last install','2023-11-22 09:05:55'),
(46,'MAIN_MODULE_IMPORT',1,'1','string',0,'{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}','2023-11-22 09:05:56'),
(47,'MAIN_MODULE_FCKEDITOR',1,'1','string',0,'{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}','2023-11-22 09:05:56'),
(48,'FCKEDITOR_ENABLE_SOCIETE',1,'1','yesno',0,'WYSIWIG for the fields descriptions of elements (except products/services)','2023-11-22 09:05:56'),
(49,'FCKEDITOR_ENABLE_DETAILS',1,'1','yesno',0,'WYSIWIG for products details lines for all entities','2023-11-22 09:05:56'),
(50,'FCKEDITOR_ENABLE_USERSIGN',1,'1','yesno',0,'WYSIWIG for user signature','2023-11-22 09:05:56'),
(51,'FCKEDITOR_ENABLE_MAILING',1,'1','yesno',0,'WYSIWIG for mass emailings','2023-11-22 09:05:56'),
(52,'FCKEDITOR_ENABLE_MAIL',1,'1','yesno',0,'WYSIWIG for products details lines for all entities','2023-11-22 09:05:56'),
(53,'MAIN_MODULE_EXPORT',1,'1','string',0,'{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}','2023-11-22 09:05:56'),
(70,'MAIN_INFO_SOCIETE_COUNTRY',1,'1:FR:France','chaine',0,'','2023-11-22 09:09:59'),
(71,'MAIN_INFO_SOCIETE_STATE',1,'327:27:Eure','chaine',0,'','2023-11-22 09:09:59'),
(72,'MAIN_INFO_SOCIETE_NOM',1,'haar-sofianos','chaine',0,'','2023-11-22 09:09:59'),
(73,'MAIN_INFO_SOCIETE_ADDRESS',1,'tout là-haut','chaine',0,'','2023-11-22 09:09:59'),
(74,'MAIN_MONNAIE',1,'EUR','chaine',0,'','2023-11-22 09:09:59'),
(75,'MAIN_INFO_SOCIETE_TEL',1,'0011223344','chaine',0,'','2023-11-22 09:09:59'),
(76,'MAIN_INFO_SOCIETE_MAIL',1,'fabien.haar@univ-rouen.fr','chaine',0,'','2023-11-22 09:09:59'),
(77,'MAIN_INFO_SOCIETE_FORME_JURIDIQUE',1,'0','chaine',0,'','2023-11-22 09:09:59'),
(78,'SOCIETE_FISCAL_MONTH_START',1,'1','chaine',0,'','2023-11-22 09:09:59'),
(79,'FACTURE_TVAOPTION',1,'1','chaine',0,'','2023-11-22 09:09:59');
/*!40000 ALTER TABLE `llx_const` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contrat`
--

DROP TABLE IF EXISTS `llx_contrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contrat` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint DEFAULT '0',
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_commercial_signature` int DEFAULT NULL,
  `fk_commercial_suivi` int DEFAULT NULL,
  `fk_user_author` int NOT NULL DEFAULT '0',
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  KEY `idx_contrat_fk_soc` (`fk_soc`),
  KEY `idx_contrat_fk_user_author` (`fk_user_author`),
  CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contrat`
--

LOCK TABLES `llx_contrat` WRITE;
/*!40000 ALTER TABLE `llx_contrat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contrat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contrat_extrafields`
--

DROP TABLE IF EXISTS `llx_contrat_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contrat_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contrat_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contrat_extrafields`
--

LOCK TABLES `llx_contrat_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_contrat_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contrat_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contratdet`
--

DROP TABLE IF EXISTS `llx_contratdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contratdet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contrat` int NOT NULL,
  `fk_product` int DEFAULT NULL,
  `statut` smallint DEFAULT '0',
  `label` text,
  `description` text,
  `fk_remise_except` int DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '1',
  `info_bits` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `fk_user_author` int NOT NULL DEFAULT '0',
  `fk_user_ouverture` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `commentaire` text,
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  KEY `idx_contratdet_fk_product` (`fk_product`),
  KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  KEY `idx_contratdet_statut` (`statut`),
  KEY `fk_contratdet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `llx_contrat` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet`
--

LOCK TABLES `llx_contratdet` WRITE;
/*!40000 ALTER TABLE `llx_contratdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contratdet_extrafields`
--

DROP TABLE IF EXISTS `llx_contratdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contratdet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet_extrafields`
--

LOCK TABLES `llx_contratdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_contratdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contratdet_log`
--

DROP TABLE IF EXISTS `llx_contratdet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contratdet_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contratdet` int NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint NOT NULL,
  `fk_user_author` int NOT NULL,
  `commentaire` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  KEY `idx_contratdet_log_date` (`date`),
  CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `llx_contratdet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet_log`
--

LOCK TABLES `llx_contratdet_log` WRITE;
/*!40000 ALTER TABLE `llx_contratdet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_cronjob`
--

DROP TABLE IF EXISTS `llx_cronjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_cronjob` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT '0',
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text,
  `lastoutput` text,
  `unitfrequency` varchar(255) NOT NULL DEFAULT '3600',
  `frequency` int NOT NULL DEFAULT '0',
  `maxrun` int NOT NULL DEFAULT '0',
  `nbrun` int DEFAULT NULL,
  `autodelete` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `processing` int NOT NULL DEFAULT '0',
  `pid` int DEFAULT NULL,
  `test` varchar(255) DEFAULT '1',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `fk_mailing` int DEFAULT NULL,
  `note` text,
  `libname` varchar(255) DEFAULT NULL,
  `email_alert` varchar(128) DEFAULT NULL,
  `entity` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_cronjob` (`label`,`entity`),
  KEY `idx_cronjob_status` (`status`),
  KEY `idx_cronjob_datelastrun` (`datelastrun`),
  KEY `idx_cronjob_datenextrun` (`datenextrun`),
  KEY `idx_cronjob_datestart` (`datestart`),
  KEY `idx_cronjob_dateend` (`dateend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_cronjob`
--

LOCK TABLES `llx_cronjob` WRITE;
/*!40000 ALTER TABLE `llx_cronjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_cronjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_default_values`
--

DROP TABLE IF EXISTS `llx_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_default_values` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `type` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `page` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_default_values`
--

LOCK TABLES `llx_default_values` WRITE;
/*!40000 ALTER TABLE `llx_default_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_default_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_delivery`
--

DROP TABLE IF EXISTS `llx_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_delivery` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  KEY `idx_delivery_fk_soc` (`fk_soc`),
  KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  KEY `idx_delivery_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_delivery`
--

LOCK TABLES `llx_delivery` WRITE;
/*!40000 ALTER TABLE `llx_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_delivery_extrafields`
--

DROP TABLE IF EXISTS `llx_delivery_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_delivery_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_delivery_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_delivery_extrafields`
--

LOCK TABLES `llx_delivery_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_delivery_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_delivery_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_deliverydet`
--

DROP TABLE IF EXISTS `llx_deliverydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_deliverydet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_delivery` int DEFAULT NULL,
  `fk_origin_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `description` text,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_fk_delivery` (`fk_delivery`),
  CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `llx_delivery` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deliverydet`
--

LOCK TABLES `llx_deliverydet` WRITE;
/*!40000 ALTER TABLE `llx_deliverydet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deliverydet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_deliverydet_extrafields`
--

DROP TABLE IF EXISTS `llx_deliverydet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_deliverydet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deliverydet_extrafields`
--

LOCK TABLES `llx_deliverydet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_deliverydet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deliverydet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_document_model`
--

DROP TABLE IF EXISTS `llx_document_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_document_model` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `type` varchar(64) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_document_model`
--

LOCK TABLES `llx_document_model` WRITE;
/*!40000 ALTER TABLE `llx_document_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_document_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_directories`
--

DROP TABLE IF EXISTS `llx_ecm_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_directories` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_parent` int DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int NOT NULL DEFAULT '0',
  `fullpath` varchar(750) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int DEFAULT NULL,
  `fk_user_m` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`),
  CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_directories`
--

LOCK TABLES `llx_ecm_directories` WRITE;
/*!40000 ALTER TABLE `llx_ecm_directories` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_directories_extrafields`
--

DROP TABLE IF EXISTS `llx_ecm_directories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_directories_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_directories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_directories_extrafields`
--

LOCK TABLES `llx_ecm_directories_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ecm_directories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_directories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_files`
--

DROP TABLE IF EXISTS `llx_ecm_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_files` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `share_pass` varchar(32) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `filepath` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `src_object_type` varchar(64) DEFAULT NULL,
  `src_object_id` int DEFAULT NULL,
  `fullpath_orig` varchar(750) DEFAULT NULL,
  `description` text,
  `keywords` varchar(750) DEFAULT NULL,
  `cover` text,
  `position` int DEFAULT NULL,
  `gen_or_uploaded` varchar(12) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int DEFAULT NULL,
  `fk_user_m` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  KEY `idx_ecm_files_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_files`
--

LOCK TABLES `llx_ecm_files` WRITE;
/*!40000 ALTER TABLE `llx_ecm_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_files_extrafields`
--

DROP TABLE IF EXISTS `llx_ecm_files_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_files_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_files_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_files_extrafields`
--

LOCK TABLES `llx_ecm_files_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ecm_files_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_files_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_categorie`
--

DROP TABLE IF EXISTS `llx_element_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_categorie` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_categorie` int NOT NULL,
  `fk_element` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_categorie_idx` (`fk_element`,`fk_categorie`),
  KEY `fk_element_categorie_fk_categorie` (`fk_categorie`),
  CONSTRAINT `fk_element_categorie_fk_categorie` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_categorie`
--

LOCK TABLES `llx_element_categorie` WRITE;
/*!40000 ALTER TABLE `llx_element_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_contact`
--

DROP TABLE IF EXISTS `llx_element_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_contact` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint DEFAULT '5',
  `element_id` int NOT NULL,
  `fk_c_type_contact` int NOT NULL,
  `fk_socpeople` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_contact`
--

LOCK TABLES `llx_element_contact` WRITE;
/*!40000 ALTER TABLE `llx_element_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_element`
--

DROP TABLE IF EXISTS `llx_element_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_element` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_source` int NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_target` int NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  KEY `idx_element_element_fk_target` (`fk_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_element`
--

LOCK TABLES `llx_element_element` WRITE;
/*!40000 ALTER TABLE `llx_element_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_resources`
--

DROP TABLE IF EXISTS `llx_element_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_resources` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `element_id` int DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `resource_id` int DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `busy` int DEFAULT NULL,
  `mandatory` int DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  KEY `idx_element_element_element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_resources`
--

LOCK TABLES `llx_element_resources` WRITE;
/*!40000 ALTER TABLE `llx_element_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_time`
--

DROP TABLE IF EXISTS `llx_element_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_time` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref_ext` varchar(32) DEFAULT NULL,
  `fk_element` int NOT NULL,
  `elementtype` varchar(32) NOT NULL,
  `element_date` date DEFAULT NULL,
  `element_datehour` datetime DEFAULT NULL,
  `element_date_withhour` int DEFAULT NULL,
  `element_duration` double DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `invoice_line_id` int DEFAULT NULL,
  `intervention_id` int DEFAULT NULL,
  `intervention_line_id` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_element_time_task` (`fk_element`),
  KEY `idx_element_time_date` (`element_date`),
  KEY `idx_element_time_datehour` (`element_datehour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_time`
--

LOCK TABLES `llx_element_time` WRITE;
/*!40000 ALTER TABLE `llx_element_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_emailcollector_emailcollector`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_emailcollector_emailcollector` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(10) DEFAULT '993',
  `hostcharset` varchar(16) DEFAULT 'UTF-8',
  `imap_encryption` varchar(16) DEFAULT 'ssl',
  `norsh` int DEFAULT '0',
  `login` varchar(128) DEFAULT NULL,
  `acces_type` int DEFAULT '0',
  `oauth_service` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `source_directory` varchar(255) NOT NULL DEFAULT 'Inbox',
  `target_directory` varchar(255) DEFAULT NULL,
  `maxemailpercollect` int DEFAULT '100',
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) DEFAULT NULL,
  `lastresult` text,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  KEY `idx_emailcollector_entity` (`entity`),
  KEY `idx_emailcollector_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollector`
--

LOCK TABLES `llx_emailcollector_emailcollector` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollector` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_emailcollector_emailcollectoraction`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollectoraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_emailcollector_emailcollectoraction` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int NOT NULL,
  `type` varchar(128) NOT NULL,
  `actionparam` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `position` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollectoraction`
--

LOCK TABLES `llx_emailcollector_emailcollectoraction` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectoraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectoraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_emailcollector_emailcollectorfilter`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollectorfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_emailcollector_emailcollectorfilter` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int NOT NULL,
  `type` varchar(128) NOT NULL,
  `rulevalue` varchar(128) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollectorfilter`
--

LOCK TABLES `llx_emailcollector_emailcollectorfilter` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectorfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectorfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_entrepot`
--

DROP TABLE IF EXISTS `llx_entrepot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_entrepot` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entity` int NOT NULL DEFAULT '1',
  `fk_project` int DEFAULT NULL,
  `description` text,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int DEFAULT NULL,
  `fk_pays` int DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `warehouse_usage` int DEFAULT '1',
  `statut` tinyint DEFAULT '1',
  `fk_user_author` int DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_parent` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_entrepot`
--

LOCK TABLES `llx_entrepot` WRITE;
/*!40000 ALTER TABLE `llx_entrepot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_entrepot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_entrepot_extrafields`
--

DROP TABLE IF EXISTS `llx_entrepot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_entrepot_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_entrepot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_entrepot_extrafields`
--

LOCK TABLES `llx_entrepot_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_entrepot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_entrepot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_establishment`
--

DROP TABLE IF EXISTS `llx_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_establishment` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(30) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int DEFAULT '0',
  `fk_country` int DEFAULT '0',
  `profid1` varchar(20) DEFAULT NULL,
  `profid2` varchar(20) DEFAULT NULL,
  `profid3` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fk_user_author` int NOT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_establishment`
--

LOCK TABLES `llx_establishment` WRITE;
/*!40000 ALTER TABLE `llx_establishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_event_element`
--

DROP TABLE IF EXISTS `llx_event_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_event_element` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_source` int NOT NULL,
  `fk_target` int NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_event_element`
--

LOCK TABLES `llx_event_element` WRITE;
/*!40000 ALTER TABLE `llx_event_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_event_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_eventorganization_conferenceorboothattendee`
--

DROP TABLE IF EXISTS `llx_eventorganization_conferenceorboothattendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_eventorganization_conferenceorboothattendee` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_actioncomm` int DEFAULT NULL,
  `fk_project` int NOT NULL,
  `fk_invoice` int DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_company` varchar(128) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `date_subscription` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_eventorganization_conferenceorboothattendee` (`fk_project`,`email`,`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_rowid` (`rowid`),
  KEY `idx_eventorganization_conferenceorboothattendee_ref` (`ref`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_soc` (`fk_soc`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_actioncomm` (`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_project` (`fk_project`),
  KEY `idx_eventorganization_conferenceorboothattendee_email` (`email`),
  KEY `idx_eventorganization_conferenceorboothattendee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_eventorganization_conferenceorboothattendee`
--

LOCK TABLES `llx_eventorganization_conferenceorboothattendee` WRITE;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

DROP TABLE IF EXISTS `llx_eventorganization_conferenceorboothattendee_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_conferenceorboothattendee_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

LOCK TABLES `llx_eventorganization_conferenceorboothattendee_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_events`
--

DROP TABLE IF EXISTS `llx_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_events` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(32) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `prefix_session` varchar(255) DEFAULT NULL,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int DEFAULT NULL,
  `authentication_method` varchar(64) DEFAULT NULL,
  `fk_oauth_token` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_events_dateevent` (`dateevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_events`
--

LOCK TABLES `llx_events` WRITE;
/*!40000 ALTER TABLE `llx_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expedition`
--

DROP TABLE IF EXISTS `llx_expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expedition` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `billed` smallint DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  KEY `idx_expedition_fk_soc` (`fk_soc`),
  KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition`
--

LOCK TABLES `llx_expedition` WRITE;
/*!40000 ALTER TABLE `llx_expedition` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expedition_extrafields`
--

DROP TABLE IF EXISTS `llx_expedition_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expedition_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expedition_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition_extrafields`
--

LOCK TABLES `llx_expedition_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expedition_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expedition_package`
--

DROP TABLE IF EXISTS `llx_expedition_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expedition_package` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expedition` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(24,8) DEFAULT '0.00000000',
  `fk_package_type` int DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int DEFAULT NULL,
  `dangerous_goods` smallint DEFAULT '0',
  `tail_lift` smallint DEFAULT '0',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition_package`
--

LOCK TABLES `llx_expedition_package` WRITE;
/*!40000 ALTER TABLE `llx_expedition_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expeditiondet`
--

DROP TABLE IF EXISTS `llx_expeditiondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expeditiondet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expedition` int NOT NULL,
  `fk_origin_line` int DEFAULT NULL,
  `fk_entrepot` int DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  KEY `idx_expeditiondet_fk_origin_line` (`fk_origin_line`),
  CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `llx_expedition` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet`
--

LOCK TABLES `llx_expeditiondet` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expeditiondet_batch`
--

DROP TABLE IF EXISTS `llx_expeditiondet_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expeditiondet_batch` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expeditiondet` int NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `fk_origin_stock` int NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_expeditiondet` (`fk_expeditiondet`),
  CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `llx_expeditiondet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet_batch`
--

LOCK TABLES `llx_expeditiondet_batch` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expeditiondet_extrafields`
--

DROP TABLE IF EXISTS `llx_expeditiondet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expeditiondet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet_extrafields`
--

LOCK TABLES `llx_expeditiondet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport`
--

DROP TABLE IF EXISTS `llx_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_number_int` int DEFAULT NULL,
  `ref_ext` int DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_validator` int DEFAULT NULL,
  `fk_user_approve` int DEFAULT NULL,
  `fk_user_refuse` int DEFAULT NULL,
  `fk_user_cancel` int DEFAULT NULL,
  `fk_statut` int NOT NULL,
  `fk_c_paiement` int DEFAULT NULL,
  `paid` smallint NOT NULL DEFAULT '0',
  `note_public` text,
  `note_private` text,
  `detail_refuse` varchar(255) DEFAULT NULL,
  `detail_cancel` varchar(255) DEFAULT NULL,
  `integration_compta` int DEFAULT NULL,
  `fk_bank_account` int DEFAULT NULL,
  `model_pdf` varchar(50) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  KEY `idx_expensereport_date_debut` (`date_debut`),
  KEY `idx_expensereport_date_fin` (`date_fin`),
  KEY `idx_expensereport_fk_statut` (`fk_statut`),
  KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  KEY `idx_expensereport_fk_refuse` (`fk_user_approve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport`
--

LOCK TABLES `llx_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_det`
--

DROP TABLE IF EXISTS `llx_expensereport_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_det` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int NOT NULL,
  `docnumber` varchar(128) DEFAULT NULL,
  `fk_c_type_fees` int NOT NULL,
  `fk_c_exp_tax_cat` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `comments` text NOT NULL,
  `product_type` int DEFAULT '-1',
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT '0.00000000',
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `date` date NOT NULL,
  `info_bits` int DEFAULT '0',
  `special_code` int DEFAULT '0',
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_facture` int DEFAULT '0',
  `fk_ecm_files` int DEFAULT NULL,
  `fk_code_ventilation` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `rule_warning_message` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_det`
--

LOCK TABLES `llx_expensereport_det` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_extrafields`
--

DROP TABLE IF EXISTS `llx_expensereport_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expensereport_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_extrafields`
--

LOCK TABLES `llx_expensereport_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_ik`
--

DROP TABLE IF EXISTS `llx_expensereport_ik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_ik` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_c_exp_tax_cat` int NOT NULL DEFAULT '0',
  `fk_range` int NOT NULL DEFAULT '0',
  `coef` double NOT NULL DEFAULT '0',
  `ikoffset` double NOT NULL DEFAULT '0',
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_ik`
--

LOCK TABLES `llx_expensereport_ik` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_ik` DISABLE KEYS */;
INSERT INTO `llx_expensereport_ik` VALUES
(1,NULL,'2023-11-22 09:05:55',4,1,0.41,0,1),
(2,NULL,'2023-11-22 09:05:55',4,2,0.244,824,1),
(3,NULL,'2023-11-22 09:05:55',4,3,0.286,0,1),
(4,NULL,'2023-11-22 09:05:55',5,4,0.493,0,1),
(5,NULL,'2023-11-22 09:05:55',5,5,0.277,1082,1),
(6,NULL,'2023-11-22 09:05:55',5,6,0.332,0,1),
(7,NULL,'2023-11-22 09:05:55',6,7,0.543,0,1),
(8,NULL,'2023-11-22 09:05:55',6,8,0.305,1180,1),
(9,NULL,'2023-11-22 09:05:55',6,9,0.364,0,1),
(10,NULL,'2023-11-22 09:05:55',7,10,0.568,0,1),
(11,NULL,'2023-11-22 09:05:55',7,11,0.32,1244,1),
(12,NULL,'2023-11-22 09:05:55',7,12,0.382,0,1),
(13,NULL,'2023-11-22 09:05:55',8,13,0.595,0,1),
(14,NULL,'2023-11-22 09:05:55',8,14,0.337,1288,1),
(15,NULL,'2023-11-22 09:05:55',8,15,0.401,0,1);
/*!40000 ALTER TABLE `llx_expensereport_ik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_rules`
--

DROP TABLE IF EXISTS `llx_expensereport_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_rules` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint NOT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_usergroup` int DEFAULT NULL,
  `fk_c_type_fees` int NOT NULL,
  `code_expense_rules_type` varchar(50) NOT NULL,
  `is_for_all` tinyint DEFAULT '0',
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_rules`
--

LOCK TABLES `llx_expensereport_rules` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_export_compta`
--

DROP TABLE IF EXISTS `llx_export_compta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_export_compta` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int NOT NULL,
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_export_compta`
--

LOCK TABLES `llx_export_compta` WRITE;
/*!40000 ALTER TABLE `llx_export_compta` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_export_compta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_export_model`
--

DROP TABLE IF EXISTS `llx_export_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_export_model` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '0',
  `fk_user` int NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  `filter` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_export_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_export_model`
--

LOCK TABLES `llx_export_model` WRITE;
/*!40000 ALTER TABLE `llx_export_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_export_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_extrafields`
--

DROP TABLE IF EXISTS `llx_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldcomputed` text,
  `fielddefault` text,
  `fieldunique` int DEFAULT '0',
  `fieldrequired` int DEFAULT '0',
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `pos` int DEFAULT '0',
  `alwayseditable` int DEFAULT '0',
  `param` text,
  `list` varchar(255) DEFAULT '1',
  `printable` int DEFAULT '0',
  `totalizable` tinyint(1) DEFAULT '0',
  `langs` varchar(64) DEFAULT NULL,
  `help` text,
  `css` varchar(128) DEFAULT NULL,
  `cssview` varchar(128) DEFAULT NULL,
  `csslist` varchar(128) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_extrafields`
--

LOCK TABLES `llx_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture`
--

DROP TABLE IF EXISTS `llx_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `subtype` smallint DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_closing` datetime DEFAULT NULL,
  `paye` smallint NOT NULL DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `close_code` varchar(16) DEFAULT NULL,
  `close_missing_amount` double(24,8) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_closing` int DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `fk_fac_rec_source` int DEFAULT NULL,
  `fk_facture_source` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `increment` varchar(10) DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int NOT NULL DEFAULT '1',
  `fk_mode_reglement` int DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int DEFAULT NULL,
  `prorata_discount` double DEFAULT NULL,
  `situation_cycle_ref` int DEFAULT NULL,
  `situation_counter` smallint DEFAULT NULL,
  `situation_final` smallint DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  KEY `idx_facture_fk_soc` (`fk_soc`),
  KEY `idx_facture_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  KEY `idx_facture_fk_projet` (`fk_projet`),
  KEY `idx_facture_fk_account` (`fk_account`),
  KEY `idx_facture_fk_currency` (`fk_currency`),
  KEY `idx_facture_fk_statut` (`fk_statut`),
  KEY `idx_facture_datef` (`datef`),
  CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture`
--

LOCK TABLES `llx_facture` WRITE;
/*!40000 ALTER TABLE `llx_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_extrafields`
--

LOCK TABLES `llx_facture_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn`
--

DROP TABLE IF EXISTS `llx_facture_fourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_closing` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double(24,8) DEFAULT '0.00000000',
  `close_code` varchar(16) DEFAULT NULL,
  `close_missing_amount` double(24,8) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `vat_reverse_charge` tinyint DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_closing` int DEFAULT NULL,
  `fk_fac_rec_source` int DEFAULT NULL,
  `fk_facture_source` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fourn_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn`
--

LOCK TABLES `llx_facture_fourn` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `fk_code_ventilation` int NOT NULL DEFAULT '0',
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det`
--

LOCK TABLES `llx_facture_fourn_det` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_det_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_extrafields`
--

LOCK TABLES `llx_facture_fourn_det_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det_rec`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` int DEFAULT NULL,
  `date_end` int DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `special_code` int unsigned DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_facture_fourn_det_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_rec`
--

LOCK TABLES `llx_facture_fourn_det_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_facture_fourn_det_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_rec_extrafields`
--

LOCK TABLES `llx_facture_fourn_det_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_extrafields`
--

LOCK TABLES `llx_facture_fourn_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_rec`
--

DROP TABLE IF EXISTS `llx_facture_fourn_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `suspended` int DEFAULT '0',
  `libelle` varchar(255) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double DEFAULT '0',
  `vat_src_code` varchar(10) DEFAULT '',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `usenewprice` int DEFAULT '0',
  `frequency` int DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int DEFAULT NULL,
  `nb_gen_max` int DEFAULT NULL,
  `auto_validate` int DEFAULT '0',
  `generate_pdf` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_rec_ref` (`titre`,`entity`),
  KEY `idx_facture_fourn_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_rec`
--

LOCK TABLES `llx_facture_fourn_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_rec_extrafields`
--

LOCK TABLES `llx_facture_fourn_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_rec`
--

DROP TABLE IF EXISTS `llx_facture_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `suspended` int DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `vat_src_code` varchar(10) DEFAULT '',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_cond_reglement` int NOT NULL DEFAULT '1',
  `fk_mode_reglement` int DEFAULT '0',
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `usenewprice` int DEFAULT '0',
  `frequency` int DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int DEFAULT NULL,
  `nb_gen_max` int DEFAULT NULL,
  `auto_validate` int DEFAULT '0',
  `generate_pdf` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_rec`
--

LOCK TABLES `llx_facture_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_rec_extrafields`
--

LOCK TABLES `llx_facture_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet`
--

DROP TABLE IF EXISTS `llx_facturedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_contract_line` int DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_code_ventilation` int NOT NULL DEFAULT '0',
  `situation_percent` double DEFAULT '100',
  `fk_prev_id` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `ref_ext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  KEY `idx_facturedet_fk_facture` (`fk_facture`),
  KEY `idx_facturedet_fk_product` (`fk_product`),
  KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facturedet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet`
--

LOCK TABLES `llx_facturedet` WRITE;
/*!40000 ALTER TABLE `llx_facturedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet_extrafields`
--

DROP TABLE IF EXISTS `llx_facturedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_extrafields`
--

LOCK TABLES `llx_facturedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet_rec`
--

DROP TABLE IF EXISTS `llx_facturedet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int DEFAULT '0',
  `date_end_fill` int DEFAULT '0',
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int unsigned DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_contract_line` int DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_facturedet_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_rec`
--

LOCK TABLES `llx_facturedet_rec` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facturedet_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_rec_extrafields`
--

LOCK TABLES `llx_facturedet_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinter`
--

DROP TABLE IF EXISTS `llx_fichinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinter` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT '0',
  `fk_contrat` int DEFAULT '0',
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  KEY `idx_fichinter_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter`
--

LOCK TABLES `llx_fichinter` WRITE;
/*!40000 ALTER TABLE `llx_fichinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinter_extrafields`
--

DROP TABLE IF EXISTS `llx_fichinter_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinter_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinter_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter_extrafields`
--

LOCK TABLES `llx_fichinter_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_fichinter_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinter_rec`
--

DROP TABLE IF EXISTS `llx_fichinter_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinter_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text,
  `modelpdf` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `frequency` int DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int DEFAULT NULL,
  `nb_gen_max` int DEFAULT NULL,
  `auto_validate` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_fichinter_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter_rec`
--

LOCK TABLES `llx_fichinter_rec` WRITE;
/*!40000 ALTER TABLE `llx_fichinter_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinterdet`
--

DROP TABLE IF EXISTS `llx_fichinterdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinterdet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int DEFAULT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int DEFAULT NULL,
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`),
  CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llx_fichinter` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet`
--

LOCK TABLES `llx_fichinterdet` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinterdet_extrafields`
--

DROP TABLE IF EXISTS `llx_fichinterdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinterdet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinterdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet_extrafields`
--

LOCK TABLES `llx_fichinterdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinterdet_rec`
--

DROP TABLE IF EXISTS `llx_fichinterdet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinterdet_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int DEFAULT NULL,
  `rang` int DEFAULT '0',
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(1) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `fk_code_ventilation` int NOT NULL DEFAULT '0',
  `special_code` int unsigned DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet_rec`
--

LOCK TABLES `llx_fichinterdet_rec` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday`
--

DROP TABLE IF EXISTS `llx_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL,
  `fk_user_create` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_type` int NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int DEFAULT '0',
  `nb_open_day` double(24,8) DEFAULT NULL,
  `statut` int NOT NULL DEFAULT '1',
  `fk_validator` int NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_approval` datetime DEFAULT NULL,
  `fk_user_approve` int DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_entity` (`entity`),
  KEY `idx_holiday_fk_user` (`fk_user`),
  KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  KEY `idx_holiday_date_create` (`date_create`),
  KEY `idx_holiday_date_debut` (`date_debut`),
  KEY `idx_holiday_date_fin` (`date_fin`),
  KEY `idx_holiday_fk_validator` (`fk_validator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday`
--

LOCK TABLES `llx_holiday` WRITE;
/*!40000 ALTER TABLE `llx_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_config`
--

DROP TABLE IF EXISTS `llx_holiday_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_config` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `value` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_holiday_config` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_config`
--

LOCK TABLES `llx_holiday_config` WRITE;
/*!40000 ALTER TABLE `llx_holiday_config` DISABLE KEYS */;
INSERT INTO `llx_holiday_config` VALUES
(1,'lastUpdate',NULL);
/*!40000 ALTER TABLE `llx_holiday_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_extrafields`
--

DROP TABLE IF EXISTS `llx_holiday_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_extrafields`
--

LOCK TABLES `llx_holiday_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_holiday_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_logs`
--

DROP TABLE IF EXISTS `llx_holiday_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_logs` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL,
  `fk_user_action` int NOT NULL,
  `fk_user_update` int NOT NULL,
  `fk_type` int NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_logs`
--

LOCK TABLES `llx_holiday_logs` WRITE;
/*!40000 ALTER TABLE `llx_holiday_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_users`
--

DROP TABLE IF EXISTS `llx_holiday_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_users` (
  `fk_user` int NOT NULL,
  `fk_type` int NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT '0',
  UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_users`
--

LOCK TABLES `llx_holiday_users` WRITE;
/*!40000 ALTER TABLE `llx_holiday_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_import_model`
--

DROP TABLE IF EXISTS `llx_import_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_import_model` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '0',
  `fk_user` int NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_import_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_import_model`
--

LOCK TABLES `llx_import_model` WRITE;
/*!40000 ALTER TABLE `llx_import_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_import_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_links`
--

DROP TABLE IF EXISTS `llx_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_links` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_links` (`objectid`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_links`
--

LOCK TABLES `llx_links` WRITE;
/*!40000 ALTER TABLE `llx_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_localtax`
--

DROP TABLE IF EXISTS `llx_localtax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_localtax` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `localtaxtype` tinyint DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_localtax`
--

LOCK TABLES `llx_localtax` WRITE;
/*!40000 ALTER TABLE `llx_localtax` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_localtax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mailing_unsubscribe`
--

DROP TABLE IF EXISTS `llx_mailing_unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mailing_unsubscribe` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `unsubscribegroup` varchar(128) DEFAULT '',
  `ip` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mailing_unsubscribe`
--

LOCK TABLES `llx_mailing_unsubscribe` WRITE;
/*!40000 ALTER TABLE `llx_mailing_unsubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mailing_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_menu`
--

DROP TABLE IF EXISTS `llx_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_menu` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `module` varchar(255) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int NOT NULL,
  `fk_mainmenu` varchar(100) DEFAULT NULL,
  `fk_leftmenu` varchar(100) DEFAULT NULL,
  `position` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint DEFAULT NULL,
  `perms` text,
  `enabled` text,
  `usertype` int NOT NULL DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_menu`
--

LOCK TABLES `llx_menu` WRITE;
/*!40000 ALTER TABLE `llx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mrp_mo`
--

DROP TABLE IF EXISTS `llx_mrp_mo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mrp_mo` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `mrptype` int DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `fk_product` int NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int DEFAULT NULL,
  `fk_project` int DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_parent_line` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_ref` (`ref`),
  KEY `idx_mrp_mo_entity` (`entity`),
  KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  KEY `idx_mrp_mo_status` (`status`),
  KEY `idx_mrp_mo_fk_product` (`fk_product`),
  KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  KEY `idx_mrp_mo_fk_project` (`fk_project`),
  CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_mo`
--

LOCK TABLES `llx_mrp_mo` WRITE;
/*!40000 ALTER TABLE `llx_mrp_mo` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_mo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mrp_mo_extrafields`
--

DROP TABLE IF EXISTS `llx_mrp_mo_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mrp_mo_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_mo_extrafields`
--

LOCK TABLES `llx_mrp_mo_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_mrp_mo_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_mo_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mrp_production`
--

DROP TABLE IF EXISTS `llx_mrp_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mrp_production` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_mo` int NOT NULL,
  `origin_id` int DEFAULT NULL,
  `origin_type` varchar(10) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `fk_product` int NOT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '1',
  `qty_frozen` smallint DEFAULT '0',
  `disable_stock_change` smallint DEFAULT '0',
  `batch` varchar(128) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `fk_mrp_production` int DEFAULT NULL,
  `fk_stock_movement` int DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_default_workstation` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_mrp_production_product` (`fk_product`),
  KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  KEY `idx_mrp_production_fk_mo` (`fk_mo`),
  CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `llx_mrp_mo` (`rowid`),
  CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `llx_stock_mouvement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_production`
--

LOCK TABLES `llx_mrp_production` WRITE;
/*!40000 ALTER TABLE `llx_mrp_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_multicurrency`
--

DROP TABLE IF EXISTS `llx_multicurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_multicurrency` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity` int DEFAULT '1',
  `fk_user` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_multicurrency`
--

LOCK TABLES `llx_multicurrency` WRITE;
/*!40000 ALTER TABLE `llx_multicurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_multicurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_multicurrency_rate`
--

DROP TABLE IF EXISTS `llx_multicurrency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_multicurrency_rate` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `fk_multicurrency` int NOT NULL,
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_multicurrency_rate`
--

LOCK TABLES `llx_multicurrency_rate` WRITE;
/*!40000 ALTER TABLE `llx_multicurrency_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_multicurrency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_notify`
--

DROP TABLE IF EXISTS `llx_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_notify` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `daten` datetime DEFAULT NULL,
  `fk_action` int NOT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  `type_target` varchar(16) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify`
--

LOCK TABLES `llx_notify` WRITE;
/*!40000 ALTER TABLE `llx_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_notify_def`
--

DROP TABLE IF EXISTS `llx_notify_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_notify_def` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` date DEFAULT NULL,
  `fk_action` int NOT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `threshold` double(24,8) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify_def`
--

LOCK TABLES `llx_notify_def` WRITE;
/*!40000 ALTER TABLE `llx_notify_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_notify_def_object`
--

DROP TABLE IF EXISTS `llx_notify_def_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_notify_def_object` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `objet_type` varchar(16) DEFAULT NULL,
  `objet_id` int NOT NULL,
  `type_notif` varchar(16) DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `moreparam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify_def_object`
--

LOCK TABLES `llx_notify_def_object` WRITE;
/*!40000 ALTER TABLE `llx_notify_def_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify_def_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_oauth_state`
--

DROP TABLE IF EXISTS `llx_oauth_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_oauth_state` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_adherent` int DEFAULT NULL,
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_oauth_state`
--

LOCK TABLES `llx_oauth_state` WRITE;
/*!40000 ALTER TABLE `llx_oauth_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_oauth_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_oauth_token`
--

DROP TABLE IF EXISTS `llx_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_oauth_token` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `token` text,
  `tokenstring` text,
  `state` text,
  `fk_soc` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_adherent` int DEFAULT NULL,
  `restricted_ips` varchar(200) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_oauth_token`
--

LOCK TABLES `llx_oauth_token` WRITE;
/*!40000 ALTER TABLE `llx_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_object_lang`
--

DROP TABLE IF EXISTS `llx_object_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_object_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_object` int NOT NULL DEFAULT '0',
  `type_object` varchar(32) NOT NULL,
  `property` varchar(32) NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT '',
  `value` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_object_lang`
--

LOCK TABLES `llx_object_lang` WRITE;
/*!40000 ALTER TABLE `llx_object_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_object_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_onlinesignature`
--

DROP TABLE IF EXISTS `llx_onlinesignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_onlinesignature` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `object_type` varchar(32) NOT NULL,
  `object_id` int NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `pathoffile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_onlinesignature`
--

LOCK TABLES `llx_onlinesignature` WRITE;
/*!40000 ALTER TABLE `llx_onlinesignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_onlinesignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_overwrite_trans`
--

DROP TABLE IF EXISTS `llx_overwrite_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_overwrite_trans` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `lang` varchar(5) DEFAULT NULL,
  `transkey` varchar(128) DEFAULT NULL,
  `transvalue` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_overwrite_trans` (`entity`,`lang`,`transkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_overwrite_trans`
--

LOCK TABLES `llx_overwrite_trans` WRITE;
/*!40000 ALTER TABLE `llx_overwrite_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_overwrite_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiement`
--

DROP TABLE IF EXISTS `llx_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiement` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  `fk_paiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int NOT NULL DEFAULT '0',
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `fk_export_compta` int NOT NULL DEFAULT '0',
  `pos_change` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement`
--

LOCK TABLES `llx_paiement` WRITE;
/*!40000 ALTER TABLE `llx_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiement_facture`
--

DROP TABLE IF EXISTS `llx_paiement_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiement_facture` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_paiement` int DEFAULT NULL,
  `fk_facture` int DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`),
  CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `llx_paiement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement_facture`
--

LOCK TABLES `llx_paiement_facture` WRITE;
/*!40000 ALTER TABLE `llx_paiement_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiementcharge`
--

DROP TABLE IF EXISTS `llx_paiementcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiementcharge` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_charge` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepaiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementcharge`
--

LOCK TABLES `llx_paiementcharge` WRITE;
/*!40000 ALTER TABLE `llx_paiementcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiementfourn`
--

DROP TABLE IF EXISTS `llx_paiementfourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiementfourn` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_paiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementfourn`
--

LOCK TABLES `llx_paiementfourn` WRITE;
/*!40000 ALTER TABLE `llx_paiementfourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementfourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiementfourn_facturefourn`
--

DROP TABLE IF EXISTS `llx_paiementfourn_facturefourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiementfourn_facturefourn` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_paiementfourn` int DEFAULT NULL,
  `fk_facturefourn` int DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementfourn_facturefourn`
--

LOCK TABLES `llx_paiementfourn_facturefourn` WRITE;
/*!40000 ALTER TABLE `llx_paiementfourn_facturefourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementfourn_facturefourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_donation`
--

DROP TABLE IF EXISTS `llx_payment_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_donation` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_donation` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text,
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_donation`
--

LOCK TABLES `llx_payment_donation` WRITE;
/*!40000 ALTER TABLE `llx_payment_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_expensereport`
--

DROP TABLE IF EXISTS `llx_payment_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_expensereport` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_expensereport`
--

LOCK TABLES `llx_payment_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_payment_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_loan`
--

DROP TABLE IF EXISTS `llx_payment_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_loan` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_loan` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT '0.00000000',
  `amount_insurance` double(24,8) DEFAULT '0.00000000',
  `amount_interest` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_loan`
--

LOCK TABLES `llx_payment_loan` WRITE;
/*!40000 ALTER TABLE `llx_payment_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_salary`
--

DROP TABLE IF EXISTS `llx_payment_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_salary` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_projet` int DEFAULT NULL,
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_salary` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_payment_salary_ref` (`num_payment`),
  KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  KEY `idx_payment_salary_datep` (`datep`),
  KEY `idx_payment_salary_datesp` (`datesp`),
  KEY `idx_payment_salary_dateep` (`dateep`),
  CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_salary`
--

LOCK TABLES `llx_payment_salary` WRITE;
/*!40000 ALTER TABLE `llx_payment_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_various`
--

DROP TABLE IF EXISTS `llx_payment_various`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_various` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_various`
--

LOCK TABLES `llx_payment_various` WRITE;
/*!40000 ALTER TABLE `llx_payment_various` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_various` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_vat`
--

DROP TABLE IF EXISTS `llx_payment_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_vat` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_tva` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepaiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_vat`
--

LOCK TABLES `llx_payment_vat` WRITE;
/*!40000 ALTER TABLE `llx_payment_vat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_vat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_pos_cash_fence`
--

DROP TABLE IF EXISTS `llx_pos_cash_fence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_pos_cash_fence` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(64) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `opening` double(24,8) DEFAULT '0.00000000',
  `cash` double(24,8) DEFAULT '0.00000000',
  `card` double(24,8) DEFAULT '0.00000000',
  `cheque` double(24,8) DEFAULT '0.00000000',
  `status` int DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int DEFAULT NULL,
  `month_close` int DEFAULT NULL,
  `year_close` int DEFAULT NULL,
  `posmodule` varchar(30) DEFAULT NULL,
  `posnumber` varchar(30) DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_pos_cash_fence`
--

LOCK TABLES `llx_pos_cash_fence` WRITE;
/*!40000 ALTER TABLE `llx_pos_cash_fence` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_pos_cash_fence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement`
--

DROP TABLE IF EXISTS `llx_prelevement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture` int DEFAULT NULL,
  `fk_facture_fourn` int DEFAULT NULL,
  `fk_salary` int DEFAULT NULL,
  `fk_prelevement_lignes` int NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_fk_prelevement_lignes` (`fk_prelevement_lignes`),
  CONSTRAINT `fk_prelevement_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `llx_prelevement_lignes` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement`
--

LOCK TABLES `llx_prelevement` WRITE;
/*!40000 ALTER TABLE `llx_prelevement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_bons`
--

DROP TABLE IF EXISTS `llx_prelevement_bons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_bons` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT 'debit-order',
  `ref` varchar(12) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `statut` smallint DEFAULT '0',
  `credite` smallint DEFAULT '0',
  `note` text,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint DEFAULT NULL,
  `fk_user_trans` int DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int DEFAULT NULL,
  `fk_bank_account` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_bons`
--

LOCK TABLES `llx_prelevement_bons` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_bons` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_bons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_demande`
--

DROP TABLE IF EXISTS `llx_prelevement_demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_demande` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_facture` int DEFAULT NULL,
  `fk_facture_fourn` int DEFAULT NULL,
  `fk_salary` int DEFAULT NULL,
  `sourcetype` varchar(32) DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint DEFAULT '0',
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int DEFAULT NULL,
  `fk_user_demande` int NOT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `type` varchar(12) DEFAULT '',
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_demande_fk_facture` (`fk_facture`),
  KEY `idx_prelevement_demande_fk_facture_fourn` (`fk_facture_fourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_demande`
--

LOCK TABLES `llx_prelevement_demande` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_lignes`
--

DROP TABLE IF EXISTS `llx_prelevement_lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_lignes` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_prelevement_bons` int DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `statut` smallint DEFAULT '0',
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`),
  CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `llx_prelevement_bons` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_lignes`
--

LOCK TABLES `llx_prelevement_lignes` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_lignes` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_rejet`
--

DROP TABLE IF EXISTS `llx_prelevement_rejet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_rejet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_prelevement_lignes` int DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int DEFAULT NULL,
  `note` text,
  `afacturer` tinyint DEFAULT '0',
  `fk_facture` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_rejet`
--

LOCK TABLES `llx_prelevement_rejet` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_rejet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_rejet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_printing`
--

DROP TABLE IF EXISTS `llx_printing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_printing` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `copy` int NOT NULL DEFAULT '1',
  `module` varchar(16) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_printing`
--

LOCK TABLES `llx_printing` WRITE;
/*!40000 ALTER TABLE `llx_printing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_printing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product`
--

DROP TABLE IF EXISTS `llx_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_parent` int DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note_public` text,
  `note` text,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `fk_state` int DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `tosell` tinyint DEFAULT '1',
  `tobuy` tinyint DEFAULT '1',
  `onportal` tinyint DEFAULT '0',
  `tobatch` tinyint NOT NULL DEFAULT '0',
  `sell_or_eat_by_mandatory` tinyint NOT NULL DEFAULT '0',
  `batch_mask` varchar(32) DEFAULT NULL,
  `fk_product_type` int DEFAULT '0',
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint DEFAULT NULL,
  `lifetime` int DEFAULT NULL,
  `qc_frequency` int DEFAULT NULL,
  `hidden` tinyint DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_price_expression` int DEFAULT NULL,
  `desiredstock` float DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `price_autogen` tinyint DEFAULT '0',
  `fk_project` int DEFAULT NULL,
  `mandatory_period` tinyint DEFAULT '0',
  `fk_default_bom` int DEFAULT NULL,
  `fk_default_workstation` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_label` (`label`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_import_key` (`import_key`),
  KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  KEY `idx_product_fk_country` (`fk_country`),
  KEY `idx_product_fk_user_author` (`fk_user_author`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  KEY `idx_product_fk_project` (`fk_project`),
  KEY `fk_product_fk_unit` (`fk_unit`),
  KEY `fk_product_finished` (`finished`),
  KEY `fk_product_default_warehouse` (`fk_default_warehouse`),
  CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `llx_c_product_nature` (`code`),
  CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`),
  CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product`
--

LOCK TABLES `llx_product` WRITE;
/*!40000 ALTER TABLE `llx_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_association`
--

DROP TABLE IF EXISTS `llx_product_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_association` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_pere` int NOT NULL DEFAULT '0',
  `fk_product_fils` int NOT NULL DEFAULT '0',
  `qty` double DEFAULT NULL,
  `incdec` int DEFAULT '1',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  KEY `idx_product_association_fils` (`fk_product_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_association`
--

LOCK TABLES `llx_product_association` WRITE;
/*!40000 ALTER TABLE `llx_product_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute`
--

DROP TABLE IF EXISTS `llx_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute`
--

LOCK TABLES `llx_product_attribute` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_combination`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_combination` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_parent` int NOT NULL,
  `fk_product_child` int NOT NULL,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int DEFAULT NULL,
  `variation_weight` double NOT NULL,
  `variation_ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  KEY `idx_product_att_com_product_child` (`fk_product_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination`
--

LOCK TABLES `llx_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_combination2val`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_combination2val` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_prod_combination` int NOT NULL,
  `fk_prod_attr` int NOT NULL,
  `fk_prod_attr_val` int NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination2val`
--

LOCK TABLES `llx_product_attribute_combination2val` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination2val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_combination_price_level`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination_price_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_combination_price_level` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_attribute_combination` int NOT NULL DEFAULT '1',
  `fk_price_level` int NOT NULL DEFAULT '1',
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prod_att_comb_price_level` (`fk_product_attribute_combination`,`fk_price_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination_price_level`
--

LOCK TABLES `llx_product_attribute_combination_price_level` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination_price_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination_price_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_value`
--

DROP TABLE IF EXISTS `llx_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_value` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_attribute` int NOT NULL,
  `ref` varchar(180) NOT NULL,
  `value` varchar(255) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_value`
--

LOCK TABLES `llx_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_batch`
--

DROP TABLE IF EXISTS `llx_product_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_batch` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product_stock` int NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  KEY `idx_fk_product_stock` (`fk_product_stock`),
  KEY `idx_batch` (`batch`),
  CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `llx_product_stock` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_batch`
--

LOCK TABLES `llx_product_batch` WRITE;
/*!40000 ALTER TABLE `llx_product_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_customer_price`
--

DROP TABLE IF EXISTS `llx_product_customer_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_customer_price` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `fk_soc` int NOT NULL,
  `ref_customer` varchar(128) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  KEY `idx_product_customer_price_fk_user` (`fk_user`),
  KEY `idx_product_customer_price_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price`
--

LOCK TABLES `llx_product_customer_price` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_customer_price_log`
--

DROP TABLE IF EXISTS `llx_product_customer_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_customer_price_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `fk_product` int NOT NULL,
  `fk_soc` int NOT NULL DEFAULT '0',
  `ref_customer` varchar(30) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price_log`
--

LOCK TABLES `llx_product_customer_price_log` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_extrafields`
--

DROP TABLE IF EXISTS `llx_product_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_extrafields`
--

LOCK TABLES `llx_product_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_fournisseur_price`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_fournisseur_price` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `ref_fourn` varchar(128) DEFAULT NULL,
  `desc_fourn` text,
  `fk_availability` int DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `charges` double(24,8) DEFAULT '0.00000000',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `info_bits` int NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `fk_supplier_price_expression` int DEFAULT NULL,
  `delivery_time_days` int DEFAULT NULL,
  `supplier_reputation` varchar(10) DEFAULT NULL,
  `packaging` double DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price`
--

LOCK TABLES `llx_product_fournisseur_price` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_fournisseur_price_extrafields`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_fournisseur_price_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price_extrafields`
--

LOCK TABLES `llx_product_fournisseur_price_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_fournisseur_price_log`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_fournisseur_price_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_log_fk_product_fournisseur` (`fk_product_fournisseur`),
  KEY `idx_product_fournisseur_price_log_fk_user` (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price_log`
--

LOCK TABLES `llx_product_fournisseur_price_log` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_lang`
--

DROP TABLE IF EXISTS `llx_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product` int NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`),
  CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lang`
--

LOCK TABLES `llx_product_lang` WRITE;
/*!40000 ALTER TABLE `llx_product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_lot`
--

DROP TABLE IF EXISTS `llx_product_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_lot` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `fk_product` int NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `eol_date` datetime DEFAULT NULL,
  `manufacturing_date` datetime DEFAULT NULL,
  `scrapping_date` datetime DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lot`
--

LOCK TABLES `llx_product_lot` WRITE;
/*!40000 ALTER TABLE `llx_product_lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_lot_extrafields`
--

DROP TABLE IF EXISTS `llx_product_lot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_lot_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_lot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lot_extrafields`
--

LOCK TABLES `llx_product_lot_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_lot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_price`
--

DROP TABLE IF EXISTS `llx_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_price` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint DEFAULT '1',
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL DEFAULT '0.0000',
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `tosell` tinyint DEFAULT '1',
  `price_by_qty` int NOT NULL DEFAULT '0',
  `fk_price_expression` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  KEY `idx_product_price_fk_product` (`fk_product`),
  CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price`
--

LOCK TABLES `llx_product_price` WRITE;
/*!40000 ALTER TABLE `llx_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_price_by_qty`
--

DROP TABLE IF EXISTS `llx_product_price_by_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_price_by_qty` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_price` int NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`),
  CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `llx_product_price` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price_by_qty`
--

LOCK TABLES `llx_product_price_by_qty` WRITE;
/*!40000 ALTER TABLE `llx_product_price_by_qty` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price_by_qty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_pricerules`
--

DROP TABLE IF EXISTS `llx_product_pricerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_pricerules` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `level` int NOT NULL,
  `fk_level` int NOT NULL,
  `var_percent` double NOT NULL,
  `var_min_percent` double NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `unique_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_pricerules`
--

LOCK TABLES `llx_product_pricerules` WRITE;
/*!40000 ALTER TABLE `llx_product_pricerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_pricerules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_stock`
--

DROP TABLE IF EXISTS `llx_product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_stock` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `fk_entrepot` int NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  KEY `idx_product_stock_fk_product` (`fk_product`),
  KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`),
  CONSTRAINT `fk_entrepot_entrepot_rowid` FOREIGN KEY (`fk_entrepot`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_stock`
--

LOCK TABLES `llx_product_stock` WRITE;
/*!40000 ALTER TABLE `llx_product_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_warehouse_properties`
--

DROP TABLE IF EXISTS `llx_product_warehouse_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_warehouse_properties` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `fk_entrepot` int NOT NULL,
  `seuil_stock_alerte` float DEFAULT '0',
  `desiredstock` float DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_warehouse_properties`
--

LOCK TABLES `llx_product_warehouse_properties` WRITE;
/*!40000 ALTER TABLE `llx_product_warehouse_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_warehouse_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet`
--

DROP TABLE IF EXISTS `llx_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_project` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `description` text,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `public` int DEFAULT NULL,
  `fk_statut` int NOT NULL DEFAULT '0',
  `fk_opp_status` int DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `fk_opp_status_end` int DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `email_msgid` varchar(175) DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_opportunity` int DEFAULT '0',
  `usage_task` int DEFAULT '1',
  `usage_bill_time` int DEFAULT '0',
  `usage_organize_event` int DEFAULT '0',
  `date_start_event` datetime DEFAULT NULL,
  `date_end_event` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `accept_conference_suggestions` int DEFAULT '0',
  `accept_booth_suggestions` int DEFAULT '0',
  `max_attendees` int DEFAULT '0',
  `price_registration` double(24,8) DEFAULT NULL,
  `price_booth` double(24,8) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  KEY `idx_projet_fk_soc` (`fk_soc`),
  KEY `idx_projet_ref` (`ref`),
  KEY `idx_projet_fk_statut` (`fk_statut`),
  KEY `idx_projet_fk_opp_status` (`fk_opp_status`),
  CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet`
--

LOCK TABLES `llx_projet` WRITE;
/*!40000 ALTER TABLE `llx_projet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet_extrafields`
--

DROP TABLE IF EXISTS `llx_projet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_extrafields`
--

LOCK TABLES `llx_projet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_projet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet_task`
--

DROP TABLE IF EXISTS `llx_projet_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet_task` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_projet` int NOT NULL,
  `fk_task_parent` int NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `duration_effective` double DEFAULT '0',
  `planned_workload` double DEFAULT '0',
  `progress` int DEFAULT '0',
  `priority` int DEFAULT '0',
  `budget_amount` double(24,8) DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `rang` int DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  KEY `idx_projet_task_fk_projet` (`fk_projet`),
  KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_task`
--

LOCK TABLES `llx_projet_task` WRITE;
/*!40000 ALTER TABLE `llx_projet_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet_task_extrafields`
--

DROP TABLE IF EXISTS `llx_projet_task_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet_task_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_task_extrafields`
--

LOCK TABLES `llx_projet_task_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_projet_task_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_task_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propal`
--

DROP TABLE IF EXISTS `llx_propal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propal` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_signature` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `fk_availability` int DEFAULT NULL,
  `fk_input_reason` int DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  KEY `idx_propal_fk_soc` (`fk_soc`),
  KEY `idx_propal_fk_user_author` (`fk_user_author`),
  KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_propal_fk_user_signature` (`fk_user_signature`),
  KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_propal_fk_projet` (`fk_projet`),
  KEY `idx_propal_fk_account` (`fk_account`),
  KEY `idx_propal_fk_currency` (`fk_currency`),
  KEY `idx_propal_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_signature` FOREIGN KEY (`fk_user_signature`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal`
--

LOCK TABLES `llx_propal` WRITE;
/*!40000 ALTER TABLE `llx_propal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propal_extrafields`
--

DROP TABLE IF EXISTS `llx_propal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propal_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal_extrafields`
--

LOCK TABLES `llx_propal_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_propal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propal_merge_pdf_product`
--

DROP TABLE IF EXISTS `llx_propal_merge_pdf_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propal_merge_pdf_product` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product` int NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal_merge_pdf_product`
--

LOCK TABLES `llx_propal_merge_pdf_product` WRITE;
/*!40000 ALTER TABLE `llx_propal_merge_pdf_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal_merge_pdf_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propaldet`
--

DROP TABLE IF EXISTS `llx_propaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propaldet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_propal` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_fk_propal` (`fk_propal`),
  KEY `idx_propaldet_fk_product` (`fk_product`),
  KEY `fk_propaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `llx_propal` (`rowid`),
  CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propaldet`
--

LOCK TABLES `llx_propaldet` WRITE;
/*!40000 ALTER TABLE `llx_propaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propaldet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propaldet_extrafields`
--

DROP TABLE IF EXISTS `llx_propaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propaldet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propaldet_extrafields`
--

LOCK TABLES `llx_propaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_propaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_reception`
--

DROP TABLE IF EXISTS `llx_reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_reception` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `billed` smallint DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  KEY `idx_reception_fk_soc` (`fk_soc`),
  KEY `idx_reception_fk_user_author` (`fk_user_author`),
  KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_reception`
--

LOCK TABLES `llx_reception` WRITE;
/*!40000 ALTER TABLE `llx_reception` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_reception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_reception_extrafields`
--

DROP TABLE IF EXISTS `llx_reception_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_reception_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_reception_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_reception_extrafields`
--

LOCK TABLES `llx_reception_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_reception_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_reception_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_resource`
--

DROP TABLE IF EXISTS `llx_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_resource` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(255) DEFAULT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `note_public` text,
  `note_private` text,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  KEY `idx_resource_fk_country` (`fk_country`),
  CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_resource`
--

LOCK TABLES `llx_resource` WRITE;
/*!40000 ALTER TABLE `llx_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_resource_extrafields`
--

DROP TABLE IF EXISTS `llx_resource_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_resource_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_resource_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_resource_extrafields`
--

LOCK TABLES `llx_resource_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_resource_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_resource_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_rights_def`
--

DROP TABLE IF EXISTS `llx_rights_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_rights_def` (
  `id` int NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `module_position` int NOT NULL DEFAULT '0',
  `family_position` int NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint DEFAULT '0',
  PRIMARY KEY (`id`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_rights_def`
--

LOCK TABLES `llx_rights_def` WRITE;
/*!40000 ALTER TABLE `llx_rights_def` DISABLE KEYS */;
INSERT INTO `llx_rights_def` VALUES
(251,'Read information of other users, groups and permissions','user',0,0,1,'user','lire','r',0),
(252,'Read permissions of other users','user',0,0,1,'user_advance','readperms','r',0),
(253,'Create/modify internal and external users, groups and permissions','user',0,0,1,'user','creer','w',0),
(254,'Create/modify external users only','user',0,0,1,'user_advance','write','w',0),
(255,'Modify the password of other users','user',0,0,1,'user','password','w',0),
(256,'Delete or disable other users','user',0,0,1,'user','supprimer','d',0),
(341,'Read its own permissions','user',0,0,1,'self_advance','readperms','r',0),
(342,'Create/modify of its own user','user',0,0,1,'self','creer','w',0),
(343,'Modify its own password','user',0,0,1,'self','password','w',0),
(344,'Modify its own permissions','user',0,0,1,'self_advance','writeperms','w',0),
(351,'Read groups','user',0,0,1,'group_advance','read','r',0),
(352,'Read permissions of groups','user',0,0,1,'group_advance','readperms','r',0),
(353,'Create/modify groups and permissions','user',0,0,1,'group_advance','write','w',0),
(354,'Delete groups','user',0,0,1,'group_advance','delete','d',0),
(358,'Export all users','user',0,0,1,'user','export','r',0),
(1201,'Read exports','export',0,0,1,'lire',NULL,'r',0),
(1202,'Creeate/modify export','export',0,0,1,'creer',NULL,'w',0),
(1251,'Run mass imports of external data (data load)','import',0,0,1,'run',NULL,'r',0);
/*!40000 ALTER TABLE `llx_rights_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_salary`
--

DROP TABLE IF EXISTS `llx_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_salary` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user` int NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_projet` int DEFAULT NULL,
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `paye` smallint NOT NULL DEFAULT '0',
  `fk_account` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_salary`
--

LOCK TABLES `llx_salary` WRITE;
/*!40000 ALTER TABLE `llx_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_salary_extrafields`
--

DROP TABLE IF EXISTS `llx_salary_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_salary_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_salary_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_salary_extrafields`
--

LOCK TABLES `llx_salary_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_salary_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_salary_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_session`
--

DROP TABLE IF EXISTS `llx_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_session` (
  `session_id` varchar(50) NOT NULL,
  `session_variable` text,
  `last_accessed` datetime NOT NULL,
  `fk_user` int NOT NULL,
  `remote_ip` varchar(64) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_session`
--

LOCK TABLES `llx_session` WRITE;
/*!40000 ALTER TABLE `llx_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe`
--

DROP TABLE IF EXISTS `llx_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) DEFAULT NULL,
  `name_alias` varchar(128) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `statut` tinyint DEFAULT '0',
  `parent` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `code_compta` varchar(24) DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int DEFAULT '0',
  `fk_pays` int DEFAULT '0',
  `fk_account` int DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `socialnetworks` text,
  `fk_effectif` int DEFAULT '0',
  `fk_typent` int DEFAULT NULL,
  `fk_forme_juridique` int DEFAULT '0',
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint DEFAULT '0',
  `fournisseur` tinyint DEFAULT '0',
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `customer_bad` tinyint DEFAULT '0',
  `customer_rate` double DEFAULT '0',
  `supplier_rate` double DEFAULT '0',
  `remise_client` double DEFAULT '0',
  `remise_supplier` double DEFAULT '0',
  `mode_reglement` tinyint DEFAULT NULL,
  `cond_reglement` tinyint DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `transport_mode` tinyint DEFAULT NULL,
  `mode_reglement_supplier` tinyint DEFAULT NULL,
  `cond_reglement_supplier` tinyint DEFAULT NULL,
  `transport_mode_supplier` tinyint DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `tva_assuj` tinyint DEFAULT '1',
  `vat_reverse_charge` tinyint DEFAULT '0',
  `localtax1_assuj` tinyint DEFAULT '0',
  `localtax1_value` double(7,4) DEFAULT NULL,
  `localtax2_assuj` tinyint DEFAULT '0',
  `localtax2_value` double(7,4) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT '0',
  `price_level` int DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_squarred` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `webservices_url` varchar(255) DEFAULT NULL,
  `webservices_key` varchar(128) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_societe_nom` (`nom`),
  KEY `idx_societe_user_creat` (`fk_user_creat`),
  KEY `idx_societe_user_modif` (`fk_user_modif`),
  KEY `idx_societe_stcomm` (`fk_stcomm`),
  KEY `idx_societe_pays` (`fk_pays`),
  KEY `idx_societe_account` (`fk_account`),
  KEY `idx_societe_prospectlevel` (`fk_prospectlevel`),
  KEY `idx_societe_typent` (`fk_typent`),
  KEY `idx_societe_forme_juridique` (`fk_forme_juridique`),
  KEY `idx_societe_shipping_method` (`fk_shipping_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe`
--

LOCK TABLES `llx_societe` WRITE;
/*!40000 ALTER TABLE `llx_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_account`
--

DROP TABLE IF EXISTS `llx_societe_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_account` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `login` varchar(128) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_website` int DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `site_account` varchar(128) DEFAULT NULL,
  `key_account` varchar(128) DEFAULT NULL,
  `note_private` text,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  KEY `idx_societe_account_rowid` (`rowid`),
  KEY `idx_societe_account_login` (`login`),
  KEY `idx_societe_account_status` (`status`),
  KEY `idx_societe_account_fk_website` (`fk_website`),
  KEY `idx_societe_account_fk_soc` (`fk_soc`),
  CONSTRAINT `llx_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_account`
--

LOCK TABLES `llx_societe_account` WRITE;
/*!40000 ALTER TABLE `llx_societe_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_address`
--

DROP TABLE IF EXISTS `llx_societe_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_address` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int DEFAULT '0',
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_pays` int DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `note` text,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_address`
--

LOCK TABLES `llx_societe_address` WRITE;
/*!40000 ALTER TABLE `llx_societe_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_commerciaux`
--

DROP TABLE IF EXISTS `llx_societe_commerciaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_commerciaux` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_soc` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_commerciaux`
--

LOCK TABLES `llx_societe_commerciaux` WRITE;
/*!40000 ALTER TABLE `llx_societe_commerciaux` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_commerciaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_contacts`
--

DROP TABLE IF EXISTS `llx_societe_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_contacts` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `date_creation` datetime NOT NULL,
  `fk_soc` int NOT NULL,
  `fk_c_type_contact` int NOT NULL,
  `fk_socpeople` int NOT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_contacts`
--

LOCK TABLES `llx_societe_contacts` WRITE;
/*!40000 ALTER TABLE `llx_societe_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_extrafields`
--

DROP TABLE IF EXISTS `llx_societe_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_extrafields`
--

LOCK TABLES `llx_societe_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_societe_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_prices`
--

DROP TABLE IF EXISTS `llx_societe_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_prices` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_soc` int DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `price_level` tinyint DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_prices`
--

LOCK TABLES `llx_societe_prices` WRITE;
/*!40000 ALTER TABLE `llx_societe_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_remise`
--

DROP TABLE IF EXISTS `llx_societe_remise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_remise` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `remise_client` double(7,4) NOT NULL DEFAULT '0.0000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise`
--

LOCK TABLES `llx_societe_remise` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_remise_except`
--

DROP TABLE IF EXISTS `llx_societe_remise_except`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_remise_except` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `discount_type` int NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `tva_tx` double(7,4) NOT NULL DEFAULT '0.0000',
  `vat_src_code` varchar(10) DEFAULT '',
  `fk_user` int NOT NULL,
  `fk_facture_line` int DEFAULT NULL,
  `fk_facture` int DEFAULT NULL,
  `fk_facture_source` int DEFAULT NULL,
  `fk_invoice_supplier_line` int DEFAULT NULL,
  `fk_invoice_supplier` int DEFAULT NULL,
  `fk_invoice_supplier_source` int DEFAULT NULL,
  `description` text NOT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`),
  CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `llx_facturedet` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `llx_facture_fourn_det` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise_except`
--

LOCK TABLES `llx_societe_remise_except` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise_except` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise_except` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_remise_supplier`
--

DROP TABLE IF EXISTS `llx_societe_remise_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_remise_supplier` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `remise_supplier` double(7,4) NOT NULL DEFAULT '0.0000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise_supplier`
--

LOCK TABLES `llx_societe_remise_supplier` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_rib`
--

DROP TABLE IF EXISTS `llx_societe_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_rib` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT 'ban',
  `label` varchar(200) DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint NOT NULL DEFAULT '0',
  `state_id` int DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `rum` varchar(32) DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) DEFAULT 'FRST',
  `last_four` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvn` varchar(255) DEFAULT NULL,
  `exp_date_month` int DEFAULT NULL,
  `exp_date_year` int DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `approved` int DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) DEFAULT NULL,
  `stripe_account` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(68) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`),
  KEY `llx_societe_rib_fk_societe` (`fk_soc`),
  CONSTRAINT `llx_societe_rib_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_rib`
--

LOCK TABLES `llx_societe_rib` WRITE;
/*!40000 ALTER TABLE `llx_societe_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_rib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_socpeople`
--

DROP TABLE IF EXISTS `llx_socpeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_socpeople` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_soc` int DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int DEFAULT NULL,
  `fk_pays` int DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `photo` varchar(255) DEFAULT NULL,
  `no_email` smallint NOT NULL DEFAULT '0',
  `priv` smallint NOT NULL DEFAULT '0',
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_stcommcontact` int NOT NULL DEFAULT '0',
  `fk_user_creat` int DEFAULT '0',
  `fk_user_modif` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_fk_soc` (`fk_soc`),
  KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`),
  KEY `idx_socpeople_lastname` (`lastname`),
  CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_socpeople`
--

LOCK TABLES `llx_socpeople` WRITE;
/*!40000 ALTER TABLE `llx_socpeople` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_socpeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_socpeople_extrafields`
--

DROP TABLE IF EXISTS `llx_socpeople_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_socpeople_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_socpeople_extrafields`
--

LOCK TABLES `llx_socpeople_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_stock_mouvement`
--

DROP TABLE IF EXISTS `llx_stock_mouvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_stock_mouvement` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datem` datetime DEFAULT NULL,
  `fk_product` int NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `type_mouvement` smallint DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventorycode` varchar(128) DEFAULT NULL,
  `fk_project` int DEFAULT NULL,
  `fk_origin` int DEFAULT NULL,
  `origintype` varchar(64) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_projet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stock_mouvement`
--

LOCK TABLES `llx_stock_mouvement` WRITE;
/*!40000 ALTER TABLE `llx_stock_mouvement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stock_mouvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_stock_mouvement_extrafields`
--

DROP TABLE IF EXISTS `llx_stock_mouvement_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_stock_mouvement_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stock_mouvement_extrafields`
--

LOCK TABLES `llx_stock_mouvement_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_stock_mouvement_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stock_mouvement_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_subscription`
--

DROP TABLE IF EXISTS `llx_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_subscription` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int DEFAULT NULL,
  `fk_type` int DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_subscription`
--

LOCK TABLES `llx_subscription` WRITE;
/*!40000 ALTER TABLE `llx_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposal`
--

DROP TABLE IF EXISTS `llx_supplier_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposal` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_supplier_proposal_ref` (`ref`,`entity`),
  KEY `idx_supplier_proposal_fk_soc` (`fk_soc`),
  KEY `idx_supplier_proposal_fk_user_author` (`fk_user_author`),
  KEY `idx_supplier_proposal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_supplier_proposal_fk_projet` (`fk_projet`),
  KEY `idx_supplier_proposal_fk_account` (`fk_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposal`
--

LOCK TABLES `llx_supplier_proposal` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposal_extrafields`
--

DROP TABLE IF EXISTS `llx_supplier_proposal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposal_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposal_extrafields`
--

LOCK TABLES `llx_supplier_proposal_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposaldet`
--

DROP TABLE IF EXISTS `llx_supplier_proposaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposaldet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_supplier_proposal` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `ref_fourn` varchar(30) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_unit` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llx_supplier_proposal` (`rowid`),
  CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposaldet`
--

LOCK TABLES `llx_supplier_proposaldet` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposaldet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposaldet_extrafields`
--

DROP TABLE IF EXISTS `llx_supplier_proposaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposaldet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposaldet_extrafields`
--

LOCK TABLES `llx_supplier_proposaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_tva`
--

DROP TABLE IF EXISTS `llx_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_tva` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_typepayment` int DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `paye` smallint NOT NULL DEFAULT '0',
  `fk_account` int DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_tva`
--

LOCK TABLES `llx_tva` WRITE;
/*!40000 ALTER TABLE `llx_tva` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user`
--

DROP TABLE IF EXISTS `llx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref_employee` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `admin` smallint DEFAULT '0',
  `employee` tinyint DEFAULT '1',
  `fk_establishment` int DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `api_key` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int DEFAULT '0',
  `fk_country` int DEFAULT '0',
  `birth` date DEFAULT NULL,
  `birth_place` varchar(64) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `office_fax` varchar(20) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `personal_mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `signature` text,
  `socialnetworks` text,
  `fk_soc` int DEFAULT NULL,
  `fk_socpeople` int DEFAULT NULL,
  `fk_member` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_user_expense_validator` int DEFAULT NULL,
  `fk_user_holiday_validator` int DEFAULT NULL,
  `idpers1` varchar(128) DEFAULT NULL,
  `idpers2` varchar(128) DEFAULT NULL,
  `idpers3` varchar(128) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `flagdelsessionsbefore` datetime DEFAULT NULL,
  `iplastlogin` varchar(250) DEFAULT NULL,
  `ippreviouslogin` varchar(250) DEFAULT NULL,
  `egroupware_id` int DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint DEFAULT '1',
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT '0',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `nb_holiday` int DEFAULT '0',
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `default_range` int DEFAULT NULL,
  `default_c_exp_tax_cat` int DEFAULT NULL,
  `national_registration_number` varchar(50) DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_login` (`login`,`entity`),
  UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  UNIQUE KEY `uk_user_api_key` (`api_key`),
  KEY `idx_user_fk_societe` (`fk_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user`
--

LOCK TABLES `llx_user` WRITE;
/*!40000 ALTER TABLE `llx_user` DISABLE KEYS */;
INSERT INTO `llx_user` VALUES
(1,0,'',NULL,1,1,0,'2023-11-22 09:05:55','2023-11-22 09:05:55',NULL,NULL,'admin',NULL,NULL,'$2y$10$YHLETscUwFPzvW3QkDRBv.wcWOFOSKt1fjZPQ4Y3x3DSceKkivoy2',NULL,NULL,'','','SuperAdmin','','','','',NULL,NULL,NULL,NULL,'','','','','','','','','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'2023-11-22 09:06:11',NULL,NULL,NULL,NULL,'2023-11-22 09:05:50','172.18.0.1',NULL,NULL,'',NULL,1,NULL,NULL,'',NULL,0,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `llx_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_alert`
--

DROP TABLE IF EXISTS `llx_user_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_alert` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_alert`
--

LOCK TABLES `llx_user_alert` WRITE;
/*!40000 ALTER TABLE `llx_user_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_clicktodial`
--

DROP TABLE IF EXISTS `llx_user_clicktodial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_clicktodial` (
  `fk_user` int NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_clicktodial`
--

LOCK TABLES `llx_user_clicktodial` WRITE;
/*!40000 ALTER TABLE `llx_user_clicktodial` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_clicktodial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_employment`
--

DROP TABLE IF EXISTS `llx_user_employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_employment` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `status` int NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  KEY `fk_user_employment_fk_user` (`fk_user`),
  CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_employment`
--

LOCK TABLES `llx_user_employment` WRITE;
/*!40000 ALTER TABLE `llx_user_employment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_extrafields`
--

DROP TABLE IF EXISTS `llx_user_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_user_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_extrafields`
--

LOCK TABLES `llx_user_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_user_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_param`
--

DROP TABLE IF EXISTS `llx_user_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_param` (
  `fk_user` int NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `param` varchar(180) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_param`
--

LOCK TABLES `llx_user_param` WRITE;
/*!40000 ALTER TABLE `llx_user_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_rib`
--

DROP TABLE IF EXISTS `llx_user_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_rib` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_user` int NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_rib`
--

LOCK TABLES `llx_user_rib` WRITE;
/*!40000 ALTER TABLE `llx_user_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_rib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_rights`
--

DROP TABLE IF EXISTS `llx_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_rights` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL,
  `fk_id` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  KEY `fk_user_rights_fk_user_user` (`fk_user`),
  CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_rights`
--

LOCK TABLES `llx_user_rights` WRITE;
/*!40000 ALTER TABLE `llx_user_rights` DISABLE KEYS */;
INSERT INTO `llx_user_rights` VALUES
(3,1,1,1201),
(4,1,1,1202),
(1,1,1,1251);
/*!40000 ALTER TABLE `llx_user_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup`
--

DROP TABLE IF EXISTS `llx_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup`
--

LOCK TABLES `llx_usergroup` WRITE;
/*!40000 ALTER TABLE `llx_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup_extrafields`
--

DROP TABLE IF EXISTS `llx_usergroup_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_usergroup_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_extrafields`
--

LOCK TABLES `llx_usergroup_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup_rights`
--

DROP TABLE IF EXISTS `llx_usergroup_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup_rights` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_usergroup` int NOT NULL,
  `fk_id` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_rights`
--

LOCK TABLES `llx_usergroup_rights` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup_user`
--

DROP TABLE IF EXISTS `llx_usergroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup_user` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL,
  `fk_usergroup` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  KEY `fk_usergroup_user_fk_user` (`fk_user`),
  KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_user`
--

LOCK TABLES `llx_usergroup_user` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-22 10:18:51
