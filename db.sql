-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: db_tropical_diases
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_users_useraccount_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_useraccount_id` FOREIGN KEY (`user_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'lerenyokesel@gmail.com',1,1,7),(2,'keselyoleren@gmail.com',1,1,8);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add User Account',6,'add_useraccount'),(22,'Can change User Account',6,'change_useraccount'),(23,'Can delete User Account',6,'delete_useraccount'),(24,'Can view User Account',6,'view_useraccount'),(25,'Can add blacklisted token',7,'add_blacklistedtoken'),(26,'Can change blacklisted token',7,'change_blacklistedtoken'),(27,'Can delete blacklisted token',7,'delete_blacklistedtoken'),(28,'Can view blacklisted token',7,'view_blacklistedtoken'),(29,'Can add outstanding token',8,'add_outstandingtoken'),(30,'Can change outstanding token',8,'change_outstandingtoken'),(31,'Can delete outstanding token',8,'delete_outstandingtoken'),(32,'Can view outstanding token',8,'view_outstandingtoken'),(33,'Can add Token',9,'add_token'),(34,'Can change Token',9,'change_token'),(35,'Can delete Token',9,'delete_token'),(36,'Can view Token',9,'view_token'),(37,'Can add token',10,'add_tokenproxy'),(38,'Can change token',10,'change_tokenproxy'),(39,'Can delete token',10,'delete_tokenproxy'),(40,'Can view token',10,'view_tokenproxy'),(41,'Can add News',11,'add_news'),(42,'Can change News',11,'change_news'),(43,'Can delete News',11,'delete_news'),(44,'Can view News',11,'view_news'),(45,'Can add symptoms',12,'add_symptoms'),(46,'Can change symptoms',12,'change_symptoms'),(47,'Can delete symptoms',12,'delete_symptoms'),(48,'Can view symptoms',12,'view_symptoms'),(49,'Can add Disease',13,'add_disease'),(50,'Can change Disease',13,'change_disease'),(51,'Can delete Disease',13,'delete_disease'),(52,'Can view Disease',13,'view_disease'),(53,'Can add Article',14,'add_article'),(54,'Can change Article',14,'change_article'),(55,'Can delete Article',14,'delete_article'),(56,'Can view Article',14,'view_article'),(57,'Can add Book',15,'add_book'),(58,'Can change Book',15,'change_book'),(59,'Can delete Book',15,'delete_book'),(60,'Can view Book',15,'view_book'),(61,'Can add keyword',16,'add_keyword'),(62,'Can change keyword',16,'change_keyword'),(63,'Can delete keyword',16,'delete_keyword'),(64,'Can view keyword',16,'view_keyword'),(65,'Can add Category',17,'add_category'),(66,'Can change Category',17,'change_category'),(67,'Can delete Category',17,'delete_category'),(68,'Can view Category',17,'view_category'),(69,'Can add Report',18,'add_report'),(70,'Can change Report',18,'change_report'),(71,'Can delete Report',18,'delete_report'),(72,'Can view Report',18,'view_report'),(73,'Can add Question',19,'add_question'),(74,'Can change Question',19,'change_question'),(75,'Can delete Question',19,'delete_question'),(76,'Can view Question',19,'view_question'),(77,'Can add Answer',20,'add_answer'),(78,'Can change Answer',20,'change_answer'),(79,'Can delete Answer',20,'delete_answer'),(80,'Can view Answer',20,'view_answer'),(81,'Can add site',21,'add_site'),(82,'Can change site',21,'change_site'),(83,'Can delete site',21,'delete_site'),(84,'Can view site',21,'view_site'),(85,'Can add email address',22,'add_emailaddress'),(86,'Can change email address',22,'change_emailaddress'),(87,'Can delete email address',22,'delete_emailaddress'),(88,'Can view email address',22,'view_emailaddress'),(89,'Can add email confirmation',23,'add_emailconfirmation'),(90,'Can change email confirmation',23,'change_emailconfirmation'),(91,'Can delete email confirmation',23,'delete_emailconfirmation'),(92,'Can view email confirmation',23,'view_emailconfirmation'),(93,'Can add social account',24,'add_socialaccount'),(94,'Can change social account',24,'change_socialaccount'),(95,'Can delete social account',24,'delete_socialaccount'),(96,'Can view social account',24,'view_socialaccount'),(97,'Can add social application',25,'add_socialapp'),(98,'Can change social application',25,'change_socialapp'),(99,'Can delete social application',25,'delete_socialapp'),(100,'Can view social application',25,'view_socialapp'),(101,'Can add social application token',26,'add_socialtoken'),(102,'Can change social application token',26,'change_socialtoken'),(103,'Can delete social application token',26,'delete_socialtoken'),(104,'Can view social application token',26,'view_socialtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_useraccount_id` FOREIGN KEY (`user_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('53409fcb45214d2f096be3535fbec4fc7c3fe708','2023-02-18 13:31:05.705818',1),('bde5428a48c2dae8d5e9990e2848da4fdf1d4b47','2023-02-11 09:05:42.229770',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_answer`
--

DROP TABLE IF EXISTS `disease_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `answer` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disease_answer_author_id_38347b9e_fk_users_useraccount_id` (`author_id`),
  KEY `disease_answer_question_id_b7dcb83e_fk_disease_question_id` (`question_id`),
  CONSTRAINT `disease_answer_author_id_38347b9e_fk_users_useraccount_id` FOREIGN KEY (`author_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_answer_question_id_b7dcb83e_fk_disease_question_id` FOREIGN KEY (`question_id`) REFERENCES `disease_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_answer`
--

LOCK TABLES `disease_answer` WRITE;
/*!40000 ALTER TABLE `disease_answer` DISABLE KEYS */;
INSERT INTO `disease_answer` VALUES (2,'2023-02-11 09:15:30.532482','2023-02-11 09:15:30.532588','<p>ini Jawaban saya</p>',1,2);
/*!40000 ALTER TABLE `disease_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_article`
--

DROP TABLE IF EXISTS `disease_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `abstract` longtext NOT NULL,
  `volume` varchar(100) NOT NULL,
  `pages_article` varchar(100) NOT NULL,
  `publication` varchar(100) NOT NULL,
  `issue` varchar(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `issn` varchar(100) NOT NULL,
  `doi` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `visits` int(10) unsigned DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `disease_article_created_by_id_d88e7061_fk_users_useraccount_id` (`created_by_id`),
  CONSTRAINT `disease_article_created_by_id_d88e7061_fk_users_useraccount_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_article_chk_1` CHECK ((`visits` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_article`
--

LOCK TABLES `disease_article` WRITE;
/*!40000 ALTER TABLE `disease_article` DISABLE KEYS */;
INSERT INTO `disease_article` VALUES (1,'2023-02-08 04:43:40.886788','2023-02-25 14:32:11.265311','PENERAPAN ALGORITMA K-MEANS','penerapan-algoritma-k-means','<p>Tuberculosis (TBC) merupakan penyakit menular yang masih menjadi perhatian dunia. Hingga saat ini, belum ada satu negara pun yang bebas TBC. Angka kematian dan kesakitan akibat kuman mycobacterium tuberculosis ini pun tinggi. Tingkat prevalensi penderita TBC di Indonesia diperkirakan sebesar 289 per 100 ribu penduduk dan insidensi sebesar 189 per 100 ribu penduduk. Bahkan 27 dari 1.000 penduduk terancam meninggal seperti yang dilaporkan Direktorat Jendral Pengendalian Penyakit dan Penyehatan Lingkungan, Kementrian Kesehatan Republik Indonesia yang dihimpun sepanjang 2011 mengenai tuberkulosis (TBC) di Indonesia. Pengelompokkan wilayah penyebaran TBC penulis menggunakan algoritma KMeansClustering, algoritma K-MeansClustering mampu mengelompokkan data pada kelompok yang sama dan data yang berbeda pada kelempok yang berbeda. Sehingga akan terlihat titiktitik lokasi penyebaran penyakit diare. Algoritma K-Means Clustering selain mampu mengelompokkan data pada kelompok yang sama dan data yang berbeda pada kelompok berbeda, juga mampu menentukan titik pusat penyebaran. Diharapkan hasil penelitian ini mampu memberikan kontribusi dalam mengatasi penyebaran diare, dengan melihat pusat penyebaran maka akan membantu memfokuskan penanganan diare pada wilayah tersebut</p>','12','124','Test','tes','test','tet','testt','est','https://jurnal.kaputama.ac.id/index.php/JTIK/article/view/41',20019,1,'Pending'),(2,'2023-02-25 14:02:02.645224','2023-02-25 14:02:50.345261','PENERAPAN ALGORITMA K-MEANS CLUSTERING UNTUK PENERAPAN ALGORITMA K-MEANS CLUSTERING UNTUK','penerapan-algoritma-k-means-clustering-untuk-penerapan-algoritma-k-means-clustering-untuk','<p>Tuberculosis (TBC) merupakan penyakit menular yang masih menjadi perhatian dunia. Hingga saat ini, belum ada satu negara pun yang bebas TBC. Angka kematian dan kesakitan akibat kuman mycobacterium tuberculosis ini pun tinggi. Tingkat prevalensi penderita TBC di Indonesia diperkirakan sebesar 289 per 100 ribu penduduk dan insidensi sebesar 189 per 100 ribu penduduk. Bahkan 27 dari 1.000 penduduk terancam meninggal seperti yang dilaporkan Direktorat Jendral Pengendalian Penyakit dan Penyehatan Lingkungan, Kementrian Kesehatan Republik Indonesia yang dihimpun sepanjang 2011 mengenai tuberkulosis (TBC) di Indonesia. Pengelompokkan wilayah penyebaran TBC penulis menggunakan algoritma KMeansClustering, algoritma K-MeansClustering mampu mengelompokkan data pada kelompok yang sama dan data yang berbeda pada kelempok yang berbeda. Sehingga akan terlihat titiktitik lokasi penyebaran penyakit diare. Algoritma K-Means Clustering selain mampu mengelompokkan data pada kelompok yang sama dan data yang berbeda pada kelompok berbeda, juga mampu menentukan titik pusat penyebaran. Diharapkan hasil penelitian ini mampu memberikan kontribusi dalam mengatasi penyebaran diare, dengan melihat pusat penyebaran maka akan membantu memfokuskan penanganan diare pada wilayah tersebut</p>','123','123123','12','tes','test','asdf','testt','Nerandra','https://jurnal.kaputama.ac.id/index.php/JTIK/article/view/41',0,1,'Pending'),(3,'2023-02-25 14:32:45.751087','2023-02-25 14:32:45.757820','asdlfkd','asdlfkd','<p>kajsdkfjadsf</p>','lkajsdf','laksdjf','lkajsdfj','lkjasldfj','lkajsdflk','lkajsd','kljasd','lkajdf','https://www.shutterstock.com/g/M+Hadi+Sasmito?rid=183181748',21,1,'Pending');
/*!40000 ALTER TABLE `disease_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_book`
--

DROP TABLE IF EXISTS `disease_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `year_publish` date NOT NULL,
  `pages` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `edition` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publication` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `issn` varchar(100) NOT NULL,
  `abstract` longtext NOT NULL,
  `visits` int(10) unsigned DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `disease_book_created_by_id_809c5e9a_fk_users_useraccount_id` (`created_by_id`),
  CONSTRAINT `disease_book_created_by_id_809c5e9a_fk_users_useraccount_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_book_chk_1` CHECK ((`visits` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_book`
--

LOCK TABLES `disease_book` WRITE;
/*!40000 ALTER TABLE `disease_book` DISABLE KEYS */;
INSERT INTO `disease_book` VALUES (1,'2023-02-08 04:37:33.124719','2023-02-10 15:34:51.188015','Mengenal Malaria Asimtomatik di Indonesia','mengenal-malaria-asimtomatik-di-indonesia','2012-01-01','200','Falcon Publishing','1','Nerandra','test','https://www.google.co.id/books/edition/Mengenal_Malaria_Asimtomatik_di_Indonesi/K_tgEAAAQBAJ?hl=id','test','<p>Malaria merupakan penyakit dengan penyebaran yang sangat luas di dunia dan menjadi endemis terutama di daerah tropis dan subtropis. Pada tahun 2013 masih terdapat 104 negara yang endemis malaria di dunia.&nbsp;</p>\r\n\r\n<p><br />\r\nSebanyak 3,4 milyar penduduk dunia beresiko terinfeksi malaria. Pada tahun 2012 terdapat 207 juta kasus malaria 627.000 meninggal dunia, 80 persen kasus berada di afrika, 90 persen kematian berada di afrika dan 77 persen angka kematian pada penderita yang berusia di bawah 5 tahun</p>\r\n\r\n<p>(WHO, 2013). Pada tahun 2012 terdapat 31 kabupaten/kota di Jawa Timur yang menginformasikan kasus malaria. Malaria import terbanyak di wilayah Provinsi Jawa Timur adalah di Kabupaten Trenggalek yakni sebesar 310 kasus. Malaria import di Jawa Timur sebesar 93,8% atau 1.320 orang dengan kasus indigenous sebanyak 9 orang atau 6,2% (Dinas Kesehatan Provinsi Jatim, 2013).</p>\r\n\r\n<p><br />\r\nPenilaian situasi malaria di suatu daerah dapat ditentukan melalui kegiatan surveilans epidemiologi. Salah satu parameter untuk pengamatan rutin malaria adalah menggunakan annual parasite insidence (API) (Gunawan, 2000). Pada tahun 2012 angka API malaria Jawa Timur mencapai 0,12 per 1.000 penduduk beresiko. Angka ini lebih rendah dibandingkan API tahun 2011 yakni 0,24 per1.000 penduduk beresiko (Dinas Kesehatan Provinsi Jatim,2013).</p>\r\n\r\n<p><br />\r\nGejala klinis utama dapat menjadi dasar penegakandiagnosis malaria yakni demam mengigil periodis, cefalgia, malaise, anemia, anoreksia, dyspepsia, vomiting disertaip embesaran limpa. Bila derajat penyakit berubah menjadim alaria berat maka akan timbul gejala di atas disertai kejang. Gejala klinis pada anak-anak makin tidak jelas gejala klinis tetapi yang menonjol adalah diare dan anemia serta adanya riwayat kunjungan ke atau berasal dari daerah malaria (McDonald, 2001; Kwena, 2003).</p>\r\n\r\n<p><br />\r\nAnemia merupakan manifestasi klinis yang paling sering dijumpai dan berperan penting pada morbiditas dan mortalitas malaria. Anemia sering terjadi pada penderita malaria berat (Philip, 1992). Anemia berhubungan dengan hemoglobin (Hb) (Philip, 1992). Anemia didefinisikan sebagai penurunan jumlah massa eritrosit yang mengakibatkan kadar hemoglobin menurun sehingga jumlah oksigen yang dibawa tidak cukup di jaringan perifer.</p>\r\n\r\n<p><br />\r\nAnemia pada malaria disebabkan oleh gangguan pembentukan eritrosit di sumsum tulang dan penghancuran eritrosit (Haldar, 2009).</p>\r\n\r\n<p><br />\r\nStudi mengenai anemia malaria sedikit terlambat menarik perhatian para akademisi dan professional. Anemia malaria berat sangat pantas dijadikan sebagai masalah kesehatan masyarakat utama karena banyaknya jumlah orang yang mengalaminya, dan nampaknya jumlah ini menjadi semakin meningkat seiring terjadinya resistensiobat antimalaria. Perhatian terhadap hal ini juga telah didukung oleh data dari penelitian terbaru mengenai vaksin, yang menyatakan bahwa kera yang diimunisasi dengan antigen tahap eritrosit, dan yang telah mendapatkan perlindungan dari infeksi akut, dapat menderita anemia berat selama fase infeksi sub-akut atau kronis (Egan, 2002; Jones, 2002). Lagipula, terjadi peningkatan kesadaran mengenai sulitnya pengobatan yang memuaskan melalui transfusi darah di luar pusat-pusat ahli pada kebanyakan daerah endemis sebagai akibat dari terbatasnya suplai darah yang cepat dan aman (Rowe, 2000; Fleming, 1997).</p>\r\n\r\n<p><br />\r\nOleh karena itu penulis mencoba untuk menulis buku ini sebagai bahan bacaan dan bahan rujukan untuk mengembangkan penelitian lebih lanjut mengenai Malaria Asimtomatik di Indonesia</p>\r\n\r\n<p>&nbsp;</p>',21,NULL,'Pending'),(2,'2023-02-24 14:11:38.111440','2023-02-25 13:43:05.799585','testing','testing','2012-01-01','200','Falcon Publishing','1','test','test','https://www.shutterstock.com/g/M+Hadi+Sasmito?rid=183181748','test','<p>Testing</p>',2,1,'Ditolak'),(3,'2023-02-25 13:15:21.350382','2023-02-25 13:15:21.365841','test','test','2023-02-10','200','asdf','asd','est','test','https://www.shutterstock.com/g/M+Hadi+Sasmito?rid=183181748','test','<p>tesete</p>',0,1,'Pending'),(5,'2023-02-25 13:19:18.712213','2023-02-25 13:39:22.818722','tesaet','tesaet','2023-02-24','test','asdf','asd','aset','test','https://www.shutterstock.com/g/M+Hadi+Sasmito?rid=183181748','asdf','<p>tesetijiasjdf</p>',0,1,'Aproved');
/*!40000 ALTER TABLE `disease_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_category`
--

DROP TABLE IF EXISTS `disease_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disease_category_parent_id_7ae89f28_fk_disease_category_id` (`parent_id`),
  CONSTRAINT `disease_category_parent_id_7ae89f28_fk_disease_category_id` FOREIGN KEY (`parent_id`) REFERENCES `disease_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_category`
--

LOCK TABLES `disease_category` WRITE;
/*!40000 ALTER TABLE `disease_category` DISABLE KEYS */;
INSERT INTO `disease_category` VALUES (1,'2023-01-29 02:51:50.317821','2023-01-29 02:51:50.317960','About Heart Disease',NULL);
/*!40000 ALTER TABLE `disease_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_disease`
--

DROP TABLE IF EXISTS `disease_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_disease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `disease_name` varchar(255) NOT NULL,
  `disease_prevention` longtext NOT NULL,
  `description` longtext NOT NULL,
  `medicine` longtext NOT NULL,
  `diagnose` longtext NOT NULL,
  `lab_check` longtext NOT NULL,
  `cause_of_disease` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `visits` int(10) unsigned NOT NULL,
  `slug` varchar(255) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `disease_disease_category_id_51d90c30_fk_disease_category_id` (`category_id`),
  KEY `disease_disease_author_id_f4cd3efa_fk_users_useraccount_id` (`author_id`),
  CONSTRAINT `disease_disease_author_id_f4cd3efa_fk_users_useraccount_id` FOREIGN KEY (`author_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_disease_category_id_51d90c30_fk_disease_category_id` FOREIGN KEY (`category_id`) REFERENCES `disease_category` (`id`),
  CONSTRAINT `disease_disease_chk_1` CHECK ((`visits` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_disease`
--

LOCK TABLES `disease_disease` WRITE;
/*!40000 ALTER TABLE `disease_disease` DISABLE KEYS */;
INSERT INTO `disease_disease` VALUES (2,'2023-01-29 02:58:46.720200','2023-02-09 14:35:03.679092','Heart Attack Symptoms, Risk, and Recovery','Test','Test','test','test','test','test',1,'<p>Content jangan adegan berbahaya</p>',20,'heart-attack-symptoms-risk-and-recovery',1);
/*!40000 ALTER TABLE `disease_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_keyword`
--

DROP TABLE IF EXISTS `disease_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_keyword`
--

LOCK TABLES `disease_keyword` WRITE;
/*!40000 ALTER TABLE `disease_keyword` DISABLE KEYS */;
INSERT INTO `disease_keyword` VALUES (1,'2023-01-21 08:15:32.728189','2023-01-21 08:15:32.728240','Nominal'),(2,'2023-02-03 14:00:51.989085','2023-02-03 14:00:51.989133','Penyakit'),(3,'2023-02-03 14:01:02.971832','2023-02-03 14:01:02.971874','Covid');
/*!40000 ALTER TABLE `disease_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_news`
--

DROP TABLE IF EXISTS `disease_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  `visits` int(10) unsigned DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `disease_news_editor_id_5f091f88_fk_users_useraccount_id` (`editor_id`),
  KEY `disease_news_created_by_id_43684bda_fk_users_useraccount_id` (`created_by_id`),
  CONSTRAINT `disease_news_created_by_id_43684bda_fk_users_useraccount_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_news_editor_id_5f091f88_fk_users_useraccount_id` FOREIGN KEY (`editor_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_news_chk_1` CHECK ((`visits` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_news`
--

LOCK TABLES `disease_news` WRITE;
/*!40000 ALTER TABLE `disease_news` DISABLE KEYS */;
INSERT INTO `disease_news` VALUES (2,'2023-01-29 02:59:47.922171','2023-02-24 14:24:24.358596','Heart Attack Symptoms, Risk, and Recovery','<h1>Heart Attack Symptoms, Risk, and Recovery</h1>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm#print\" onclick=\"window.print()\">Print</a></p>\r\n\r\n<h2>What is a heart attack?</h2>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm#\"><img alt=\"Heart attack signs and symptoms in women and men.\" src=\"https://www.cdc.gov/heartdisease/images/Heart-Attack-Signs-Men-Women-medium.jpg?_=75239\" title=\"\" /></a></p>\r\n\r\n<p>Heart attack signs and symptoms in men and women: Chest pain or discomfort; Shortness of breath; Pain or discomfort in the jaw, neck, back, arm, or shoulder; Feeling nauseous, light-headed, or unusually tired.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm#\">View Larger</a></p>\r\n\r\n<p>A heart attack, also called a myocardial infarction, happens when a part of the heart muscle doesn&rsquo;t get enough blood.</p>\r\n\r\n<p>The more time that passes without treatment to restore blood flow, the greater the damage to the heart muscle.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/coronary_ad.htm\">Coronary artery disease (CAD)</a>&nbsp;is the main cause of heart attack. A less common cause is a severe spasm, or sudden contraction, of a coronary artery that can stop blood flow to the heart muscle.</p>\r\n\r\n<h2>What are the symptoms of heart attack?</h2>\r\n\r\n<p>The major symptoms of a heart attack are</p>\r\n\r\n<ul>\r\n	<li><strong>Chest pain or discomfort.</strong>&nbsp;Most heart attacks involve discomfort in the center or left side of the chest that lasts for more than a few minutes or that goes away and comes back. The discomfort can feel like uncomfortable pressure, squeezing, fullness, or pain.</li>\r\n	<li><strong>Feeling weak, light-headed, or faint.</strong>&nbsp;You may also break out into a cold sweat.</li>\r\n	<li><strong>Pain or discomfort in the jaw, neck, or back.</strong></li>\r\n	<li><strong>Pain or discomfort in one or both arms or shoulders.</strong></li>\r\n	<li><strong>Shortness of breath.</strong>&nbsp;This often comes along with chest discomfort, but shortness of breath also can happen before chest discomfort.</li>\r\n</ul>\r\n\r\n<p>Other symptoms of a heart attack could include unusual or unexplained tiredness and nausea or vomiting. Women are more likely to have these other symptoms.&nbsp;<a href=\"https://www.cdc.gov/heartdisease/women.htm\">Learn more about women and heart disease</a>.</p>\r\n\r\n<p><strong>Every 40 seconds, someone in the United States has a heart attack.</strong>1&nbsp;<a href=\"https://www.cdc.gov/heartdisease/facts.htm\">Learn more facts about heart attack and heart disease.</a></p>\r\n\r\n<h2>Call 9-1-1 if you notice symptoms of a heart attack.</h2>\r\n\r\n<p>If you notice the symptoms of a heart attack in yourself or someone else,&nbsp;<strong>call 9-1-1 immediately</strong>. The sooner you get to an emergency room, the sooner you can get treatment to reduce the amount of damage to the heart muscle. At the hospital, health care professionals can run tests to find out if a heart attack is happening and decide the best treatment.</p>\r\n\r\n<p>In some cases, a heart attack requires cardiopulmonary resuscitation (CPR) or an electrical shock (defibrillation) to the heart to get the heart pumping again. Bystanders trained to use CPR or a defibrillator may be able to help until emergency medical personnel arrive.</p>\r\n\r\n<p>Remember, the chances of surviving a heart attack are better the sooner emergency treatment begins.</p>\r\n\r\n<h2>What are the risk factors for heart attack?</h2>\r\n\r\n<p>Several health conditions, your lifestyle, and your age and family history can increase your risk for heart disease and heart attack. These are called risk factors. About&nbsp;<strong>half of all Americans&nbsp;</strong>have at least one of the three key risk factors for heart disease: high blood pressure, high blood cholesterol, and smoking.2</p>\r\n\r\n<p>Some risk factors cannot be controlled, such as your age or family history. But you can take steps to lower your risk by changing the factors you&nbsp;<strong>can&nbsp;</strong>control.</p>\r\n\r\n<p>Learn more about&nbsp;<a href=\"https://www.cdc.gov/heartdisease/risk_factors.htm\">risk factors</a>&nbsp;for heart disease and heart attack.</p>\r\n\r\n<h2>What can I do to recover after a heart attack?</h2>\r\n\r\n<p><a href=\"https://www.qzzr.com/c/quiz/480768/cardiac-rehabilitation-and-your-heart\"><img alt=\"Cardiac Rehab Quiz\" src=\"https://www.cdc.gov/heartdisease/images/cardiac-rehab-quiz.jpg?_=91868\" title=\"cardiac-rehab-quiz\" /></a></p>\r\n\r\n<p>Take our&nbsp;<a href=\"https://www.qzzr.com/c/quiz/480768/cardiac-rehabilitation-and-your-heart\">quiz</a>&nbsp;to see how much you know about cardiac rehabilitation.</p>\r\n\r\n<p>If you&rsquo;ve had a heart attack, your heart may be damaged. This could affect your heart&rsquo;s rhythm and its ability to pump blood to the rest of the body. You may also be at risk for another heart attack or conditions such as&nbsp;<a href=\"https://www.cdc.gov/stroke/index.htm\">stroke</a>, kidney disorders, and&nbsp;peripheral arterial disease (PAD).</p>\r\n\r\n<p>You can lower your chances of having future health problems following a heart attack with these steps:</p>\r\n\r\n<ul>\r\n	<li><strong>Physical activity</strong>&mdash;Talk with your health care team about the things you do each day in your life and work. Your doctor may want you to limit work, travel, or sexual activity for some time after a heart attack.</li>\r\n	<li><strong>Lifestyle changes</strong>&mdash;Eating a healthier diet, increasing physical activity, quitting smoking, and managing stress&mdash;in addition to taking prescribed medicines&mdash;can help improve your heart health and quality of life. Ask your health care team about attending a program called cardiac rehabilitation to help you make these lifestyle changes.</li>\r\n	<li><strong>Cardiac rehabilitation</strong>&mdash;<a href=\"https://www.cdc.gov/heartdisease/cardiac_rehabilitation.htm\">Cardiac rehabilitation</a>&nbsp;is an important program for anyone recovering from a heart attack, heart failure, or other heart problem that required surgery or medical care. Cardiac rehab is a supervised program that includes\r\n	<ul>\r\n		<li>Physical activity</li>\r\n		<li>Education about healthy living, including healthy eating, taking medicine as prescribed, and ways to help you quit smoking</li>\r\n		<li>Counseling to find ways to relieve stress and improve mental health</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>A team of people may help you through cardiac rehab, including your health care team, exercise and nutrition specialists, physical therapists, and counselors or mental health professionals.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/images/HA-signs-symptoms-social1.png\" target=\"_blank\"><img alt=\"Every 40 seconds, someone in the United States has a heart attack. Learn prevention steps at cdc.gov/heartdisease.\" src=\"https://www.cdc.gov/heartdisease/images/HA-signs-symptoms-social1.png?_=39875\" title=\"\" /></a></p>\r\n\r\n<h2>More Information</h2>\r\n\r\n<ul>\r\n	<li>American Heart Association:&nbsp;<a href=\"http://www.heart.org/HEARTORG/Conditions/HeartAttack/Heart-Attack_UCM_001092_SubHomePage.jsp\">Heart Attack</a></li>\r\n	<li>National Heart, Lung, and Blood Institute:&nbsp;<a href=\"https://www.nhlbi.nih.gov/health-topics/heart-attack\">Heart Attack</a></li>\r\n</ul>\r\n\r\n<h2>References</h2>\r\n\r\n<ol>\r\n	<li>Tsao CW, Aday AW, Almarzooq ZI, Beaton AZ, Bittencourt MS, Boehme AK, et al.&nbsp;<a href=\"https://doi.org/10.1161/cir.0000000000001052\">Heart Disease and Stroke Statistics&mdash;2022 Update: A Report From the American Heart Association</a>.&nbsp;<em>Circulation.</em>&nbsp;2022;145(8):e153&ndash;e639.</li>\r\n	<li>Fryar CD, Chen T-C, Li X.&nbsp;<a href=\"https://www.cdc.gov/nchs/data/databriefs/db103.pdf\" target=\"_blank\">Prevalence of uncontrolled risk factors for cardiovascular disease: United States, 1999&ndash;2010&nbsp;[PDF-494K]</a>. NCHS data brief, no. 103. Hyattsville, MD: National Center for Health Statistics; 2012. Accessed May 9, 2019.</li>\r\n</ol>','heart-attack-symptoms-risk-and-recovery',1,NULL,12,'Pending'),(4,'2023-02-25 14:17:39.061536','2023-02-25 14:17:39.061626','Testing Content vor admin','<p>tesaijdlkfj</p>','testing-content-vor-admin',NULL,NULL,0,'Pending'),(6,'2023-02-25 14:18:40.478495','2023-02-25 14:18:40.478540','asdlkfaksjdf','<p>lkasjdf</p>','asdlkfaksjdf',NULL,NULL,0,'Pending'),(7,'2023-02-25 14:18:54.737943','2023-02-25 14:18:54.737990','test test','<p>asdf</p>','test-test',NULL,NULL,0,'Pending');
/*!40000 ALTER TABLE `disease_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_news_keyword`
--

DROP TABLE IF EXISTS `disease_news_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_news_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disease_news_keyword_news_id_keyword_id_1561fb58_uniq` (`news_id`,`keyword_id`),
  KEY `disease_news_keyword_keyword_id_d63ff3ec_fk_disease_keyword_id` (`keyword_id`),
  CONSTRAINT `disease_news_keyword_keyword_id_d63ff3ec_fk_disease_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `disease_keyword` (`id`),
  CONSTRAINT `disease_news_keyword_news_id_51306bb6_fk_disease_news_id` FOREIGN KEY (`news_id`) REFERENCES `disease_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_news_keyword`
--

LOCK TABLES `disease_news_keyword` WRITE;
/*!40000 ALTER TABLE `disease_news_keyword` DISABLE KEYS */;
INSERT INTO `disease_news_keyword` VALUES (1,2,2),(2,2,3),(3,4,2),(4,4,3),(5,6,1),(6,6,2),(7,7,1),(8,7,3);
/*!40000 ALTER TABLE `disease_news_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_question`
--

DROP TABLE IF EXISTS `disease_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `question` longtext NOT NULL,
  `is_validate` tinyint(1) NOT NULL,
  `diseases_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disease_question_diseases_id_80671c91_fk_disease_disease_id` (`diseases_id`),
  KEY `disease_question_parent_id_5b1e77fc_fk_disease_question_id` (`parent_id`),
  KEY `disease_question_user_id_8d72f6d1_fk_users_useraccount_id` (`user_id`),
  CONSTRAINT `disease_question_diseases_id_80671c91_fk_disease_disease_id` FOREIGN KEY (`diseases_id`) REFERENCES `disease_disease` (`id`),
  CONSTRAINT `disease_question_parent_id_5b1e77fc_fk_disease_question_id` FOREIGN KEY (`parent_id`) REFERENCES `disease_question` (`id`),
  CONSTRAINT `disease_question_user_id_8d72f6d1_fk_users_useraccount_id` FOREIGN KEY (`user_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_question`
--

LOCK TABLES `disease_question` WRITE;
/*!40000 ALTER TABLE `disease_question` DISABLE KEYS */;
INSERT INTO `disease_question` VALUES (2,'2023-02-11 07:50:22.792953','2023-02-11 09:01:14.572891','apakah ini jangan kabu dan saya sangat sengar dulu?',0,2,NULL,1),(3,'2023-02-11 07:51:20.195399','2023-02-11 07:51:20.195442','apakah ini bebar?',0,2,NULL,1),(4,'2023-02-11 08:32:06.466182','2023-02-11 08:32:06.466369','apakah ini bebar?',0,2,NULL,1),(5,'2023-02-11 08:32:07.879042','2023-02-11 08:32:07.879083','apakah ini bebar?',0,2,NULL,1),(6,'2023-02-11 08:32:09.122500','2023-02-11 08:32:09.122538','apakah ini bebar?',0,2,NULL,1),(7,'2023-02-11 08:32:11.865728','2023-02-11 08:32:11.865768','apakah ini bebar?',0,2,NULL,1),(8,'2023-02-11 08:32:13.225982','2023-02-11 08:32:13.226021','apakah ini bebar?',0,2,NULL,1),(9,'2023-02-11 08:32:15.197099','2023-02-11 08:32:15.197140','apakah ini bebar?',0,2,NULL,1),(10,'2023-02-11 08:32:18.798500','2023-02-11 08:32:18.798549','apakah ini bebar?',0,2,NULL,1),(11,'2023-02-11 08:33:38.274843','2023-02-11 08:33:38.274887','apakah ini bebar?',0,2,NULL,1),(12,'2023-02-11 08:34:02.583463','2023-02-11 08:34:02.583509','apakah ini bebar?',0,2,NULL,1),(13,'2023-02-11 08:35:19.829236','2023-02-11 08:35:19.829299','apakah ini bebar?',0,2,NULL,1),(14,'2023-02-11 08:38:03.279849','2023-02-11 08:38:03.279891','apakah ini bebar?',0,2,NULL,1),(15,'2023-02-11 08:42:34.663853','2023-02-11 08:42:34.663906','apakah ini bebar?',0,2,NULL,1),(16,'2023-02-11 08:42:45.420609','2023-02-11 08:42:45.420648','apakah ini bebar?',0,2,NULL,1),(17,'2023-02-11 08:43:25.022888','2023-02-11 08:43:25.023128','apakah ini bebar?',0,2,NULL,1),(18,'2023-02-11 08:44:42.356957','2023-02-11 08:44:42.356999','apakah ini bebar?',0,2,NULL,1),(19,'2023-02-11 08:44:53.771434','2023-02-11 08:44:53.771478','apakah ini bebar?',0,2,NULL,1),(20,'2023-02-11 08:45:24.799388','2023-02-11 08:45:24.799425','apakah ini bebar?',0,2,NULL,1),(21,'2023-02-11 08:45:39.924190','2023-02-11 08:45:39.924228','apakah ini bebar?',0,2,NULL,1),(22,'2023-02-11 08:49:10.030034','2023-02-11 08:49:10.030113','apakah ini bebar?',0,2,NULL,1),(23,'2023-02-11 08:50:36.739982','2023-02-11 08:50:36.740026','apakah ini bebar?',0,2,NULL,1),(24,'2023-02-11 08:51:47.801412','2023-02-11 08:51:47.801466','apakah ini bebar?',0,2,NULL,1),(25,'2023-02-11 08:52:27.164404','2023-02-11 08:52:27.164462','apakah ini bebar?',0,2,NULL,1),(26,'2023-02-11 08:52:53.606116','2023-02-11 08:52:53.606160','apakah ini bebar?',0,2,NULL,1),(27,'2023-02-11 08:53:32.717784','2023-02-11 08:53:32.717904','apakah ini bebar?',0,2,NULL,1),(28,'2023-02-11 08:53:36.761937','2023-02-11 08:53:36.761986','apakah ini besdfbar?',0,2,NULL,1),(29,'2023-02-11 08:53:43.457377','2023-02-11 08:53:43.457430','apakah ini jangan kabur dulu?',0,2,NULL,1),(30,'2023-02-18 13:31:24.031674','2023-02-18 13:31:24.031715','apakah ini bebar?',0,2,NULL,1);
/*!40000 ALTER TABLE `disease_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_report`
--

DROP TABLE IF EXISTS `disease_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `institution` varchar(200) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `abstract` longtext NOT NULL,
  `author` varchar(100) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `url` varchar(200) NOT NULL,
  `city` varchar(255) NOT NULL,
  `visits` int(10) unsigned DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `disease_report_created_by_id_c954fa6f_fk_users_useraccount_id` (`created_by_id`),
  CONSTRAINT `disease_report_created_by_id_c954fa6f_fk_users_useraccount_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_report_chk_1` CHECK ((`visits` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_report`
--

LOCK TABLES `disease_report` WRITE;
/*!40000 ALTER TABLE `disease_report` DISABLE KEYS */;
INSERT INTO `disease_report` VALUES (1,'2023-02-25 14:30:16.278692','2023-02-25 14:35:17.692160','estasdfasdf','estasdfasdf','tetasdf','testeasdf','<p>taseasdf</p>','asdfasdfadsf','aasd','2023-02-17 00:00:00.000000','https://jurnal.kaputama.ac.id/index.php/JTIK/article/view/41','asdf',0,'<p>asdfasdfasdf</p>',1,'Pending'),(2,'2023-02-25 14:35:51.674456','2023-02-25 14:35:51.682668','asdflkasd','asdflkasd',';kasd;lfk','asdkfjladsjf','<p>asdasdf</p>','kajsdfkj','lkjasdjkf','2023-03-04 00:00:00.000000','https://www.shutterstock.com/g/M+Hadi+Sasmito?rid=183181748','Pacitan',0,'<p>asdlkfakjsdfkj</p>',1,'Pending');
/*!40000 ALTER TABLE `disease_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_report_keyword`
--

DROP TABLE IF EXISTS `disease_report_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_report_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disease_report_keyword_report_id_keyword_id_3158985f_uniq` (`report_id`,`keyword_id`),
  KEY `disease_report_keyword_keyword_id_efdf5ec7_fk_disease_keyword_id` (`keyword_id`),
  CONSTRAINT `disease_report_keyword_keyword_id_efdf5ec7_fk_disease_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `disease_keyword` (`id`),
  CONSTRAINT `disease_report_keyword_report_id_0f3b0f70_fk_disease_report_id` FOREIGN KEY (`report_id`) REFERENCES `disease_report` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_report_keyword`
--

LOCK TABLES `disease_report_keyword` WRITE;
/*!40000 ALTER TABLE `disease_report_keyword` DISABLE KEYS */;
INSERT INTO `disease_report_keyword` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2);
/*!40000 ALTER TABLE `disease_report_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_useraccount_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_useraccount_id` FOREIGN KEY (`user_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-16 03:53:52.213065','2','keselyoleren',1,'[{\"added\": {}}]',6,1),(2,'2023-01-21 08:15:32.729788','1','Nominal',1,'[{\"added\": {}}]',16,1),(3,'2023-01-29 02:51:50.322894','1','About Heart Disease',1,'[{\"added\": {}}]',17,1),(4,'2023-01-29 02:55:04.188278','1','Coronary Artery Disease (CAD)',1,'[{\"added\": {}}]',13,1),(5,'2023-01-29 02:56:58.768381','1','Coronary Artery Disease (CAD)',1,'[{\"added\": {}}]',11,1),(6,'2023-01-29 02:57:12.994494','1','Coronary Artery Disease (CAD)',2,'[]',11,1),(7,'2023-01-29 02:58:46.721866','2','Heart Attack Symptoms, Risk, and Recovery',1,'[{\"added\": {}}]',13,1),(8,'2023-01-29 02:59:47.924957','2','Heart Attack Symptoms, Risk, and Recovery',1,'[{\"added\": {}}]',11,1),(9,'2023-02-03 14:00:51.996444','2','Penyakit',1,'[{\"added\": {}}]',16,1),(10,'2023-02-03 14:01:02.975617','3','Covid',1,'[{\"added\": {}}]',16,1),(11,'2023-02-03 14:01:07.441605','2','Heart Attack Symptoms, Risk, and Recovery',2,'[{\"changed\": {\"fields\": [\"Keyword\"]}}]',11,1),(12,'2023-02-03 14:43:23.674488','1','Coronary Artery Disease (CAD)',2,'[]',11,1),(13,'2023-02-03 14:45:30.237359','3','Cholesterol Communications Kit',1,'[{\"added\": {}}]',11,1),(14,'2023-02-08 04:37:33.133842','1','Book object (1)',1,'[{\"added\": {}}]',15,1),(15,'2023-02-08 04:43:40.904825','1','Article object (1)',1,'[{\"added\": {}}]',14,1),(16,'2023-02-09 13:11:50.685806','1','Article object (1)',2,'[{\"changed\": {\"fields\": [\"Visits\"]}}]',14,1),(17,'2023-02-09 13:26:56.565131','2','Heart Attack Symptoms, Risk, and Recovery',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',13,1),(18,'2023-02-09 13:27:03.589535','1','Coronary Artery Disease (CAD)',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',13,1),(19,'2023-02-09 13:27:09.212876','1','Coronary Artery Disease (CAD)',3,'',13,1),(20,'2023-02-09 13:27:42.957982','2','Heart Attack Symptoms, Risk, and Recovery',2,'[]',13,1),(21,'2023-02-09 14:23:29.549485','1','<p>Apakah pernyaan ini sangat serius?&nbsp;</p>',1,'[{\"added\": {}}]',19,1),(22,'2023-02-09 14:24:51.692905','1','<p>Apakah pernyaan ini sangat serius?&nbsp;</p>',1,'[{\"added\": {}}]',20,1),(23,'2023-02-09 14:35:03.682301','2','Heart Attack Symptoms, Risk, and Recovery',2,'[{\"changed\": {\"fields\": [\"Content\"]}}]',13,1),(24,'2023-02-09 14:47:46.778264','1','f54756825d796093ba657e38ea42565f02281ce5',1,'[{\"added\": {}}]',10,1),(25,'2023-02-11 09:05:42.230802','2','bde5428a48c2dae8d5e9990e2848da4fdf1d4b47',1,'[{\"added\": {}}]',10,1),(26,'2023-02-11 09:15:30.536468','2','apakah ini jangan kabu dan saya sangat sengar dulu?',1,'[{\"added\": {}}]',20,1),(27,'2023-02-21 13:03:47.841747','4','lerenyokesel@gmail.com',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',6,1),(28,'2023-02-21 13:45:00.080448','2','localhost:8000',1,'[{\"added\": {}}]',21,1),(29,'2023-02-21 13:46:48.323390','1','Tropical Diseases',1,'[{\"added\": {}}]',25,1),(30,'2023-02-21 13:58:56.620926','6','hadi',3,'',6,1),(31,'2023-02-21 13:58:56.626548','3','keselyoleren@gmail.com',3,'',6,1),(32,'2023-02-21 13:58:56.629033','4','lerenyokesel@gmail.com',3,'',6,1),(33,'2023-02-21 13:58:56.630796','5','tropicaldisease2023@gmail.com',3,'',6,1),(34,'2023-02-21 13:59:56.545436','7','kita',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',6,1),(35,'2023-02-25 09:44:32.890205','2','Book object (2)',2,'[{\"changed\": {\"fields\": [\"Created by\"]}}]',15,1),(36,'2023-02-25 13:39:22.824866','5','Book object (5)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',15,1),(37,'2023-02-25 13:39:53.618798','4','Book object (4)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',15,1),(38,'2023-02-25 13:43:05.802298','2','Book object (2)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',15,1),(39,'2023-02-25 14:32:11.267218','1','Article object (1)',2,'[]',14,1),(40,'2023-02-25 14:35:17.696404','1','Report object (1)',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (22,'account','emailaddress'),(23,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'authtoken','token'),(10,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(20,'disease','answer'),(14,'disease','article'),(15,'disease','book'),(17,'disease','category'),(13,'disease','disease'),(16,'disease','keyword'),(11,'disease','news'),(19,'disease','question'),(18,'disease','report'),(12,'disease','symptoms'),(5,'sessions','session'),(21,'sites','site'),(24,'socialaccount','socialaccount'),(25,'socialaccount','socialapp'),(26,'socialaccount','socialtoken'),(7,'token_blacklist','blacklistedtoken'),(8,'token_blacklist','outstandingtoken'),(6,'users','useraccount');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-16 02:55:49.973967'),(2,'contenttypes','0002_remove_content_type_name','2023-01-16 02:55:50.125298'),(3,'auth','0001_initial','2023-01-16 02:55:50.272618'),(4,'auth','0002_alter_permission_name_max_length','2023-01-16 02:55:50.781641'),(5,'auth','0003_alter_user_email_max_length','2023-01-16 02:55:50.798896'),(6,'auth','0004_alter_user_username_opts','2023-01-16 02:55:50.830959'),(7,'auth','0005_alter_user_last_login_null','2023-01-16 02:55:50.857013'),(8,'auth','0006_require_contenttypes_0002','2023-01-16 02:55:50.869970'),(9,'auth','0007_alter_validators_add_error_messages','2023-01-16 02:55:50.903788'),(10,'auth','0008_alter_user_username_max_length','2023-01-16 02:55:50.944094'),(11,'auth','0009_alter_user_last_name_max_length','2023-01-16 02:55:50.982523'),(12,'auth','0010_alter_group_name_max_length','2023-01-16 02:55:51.031439'),(13,'auth','0011_update_proxy_permissions','2023-01-16 02:55:51.051566'),(14,'users','0001_initial','2023-01-16 02:55:51.284971'),(15,'admin','0001_initial','2023-01-16 02:55:51.693669'),(16,'admin','0002_logentry_remove_auto_add','2023-01-16 02:55:51.803448'),(17,'admin','0003_logentry_add_action_flag_choices','2023-01-16 02:55:51.833936'),(18,'sessions','0001_initial','2023-01-16 02:55:51.871229'),(19,'token_blacklist','0001_initial','2023-01-16 06:40:57.015841'),(20,'token_blacklist','0002_outstandingtoken_jti_hex','2023-01-16 06:40:57.119814'),(21,'token_blacklist','0003_auto_20171017_2007','2023-01-16 06:40:57.140608'),(22,'token_blacklist','0004_auto_20171017_2013','2023-01-16 06:40:57.235127'),(23,'token_blacklist','0005_remove_outstandingtoken_jti','2023-01-16 06:40:57.360947'),(24,'token_blacklist','0006_auto_20171017_2113','2023-01-16 06:40:57.390483'),(25,'token_blacklist','0007_auto_20171017_2214','2023-01-16 06:40:58.239025'),(26,'token_blacklist','0008_migrate_to_bigautofield','2023-01-16 06:40:58.646571'),(27,'token_blacklist','0010_fix_migrate_to_bigautofield','2023-01-16 06:40:58.665619'),(28,'token_blacklist','0011_linearizes_history','2023-01-16 06:40:58.669461'),(29,'token_blacklist','0012_alter_outstandingtoken_user','2023-01-16 06:40:58.988610'),(30,'authtoken','0001_initial','2023-01-16 07:00:56.415740'),(31,'authtoken','0002_auto_20160226_1747','2023-01-16 07:00:57.067094'),(32,'authtoken','0003_tokenproxy','2023-01-16 07:00:57.072238'),(33,'disease','0001_initial','2023-01-21 08:00:27.188377'),(34,'disease','0002_remove_article_keywords','2023-01-21 08:13:24.873101'),(35,'auth','0012_alter_user_first_name_max_length','2023-01-21 08:31:45.479493'),(36,'disease','0003_auto_20230121_0831','2023-01-21 08:31:45.600701'),(37,'users','0002_alter_useraccount_first_name','2023-01-21 08:31:45.908909'),(38,'disease','0004_auto_20230129_0243','2023-01-29 02:43:47.646972'),(39,'disease','0005_disease_slug','2023-01-29 04:16:28.781530'),(40,'disease','0006_alter_disease_slug','2023-01-29 04:16:28.828281'),(41,'disease','0005_auto_20230203_1359','2023-02-03 13:59:13.809880'),(42,'disease','0006_auto_20230203_1459','2023-02-03 15:00:11.131582'),(43,'disease','0007_auto_20230208_0338','2023-02-08 03:38:54.122433'),(44,'disease','0008_report','2023-02-08 03:53:22.468372'),(45,'disease','0009_auto_20230208_0443','2023-02-08 04:43:34.321696'),(46,'disease','0010_auto_20230209_1305','2023-02-09 13:06:22.004852'),(47,'disease','0011_disease_slug','2023-02-09 13:27:28.279735'),(48,'disease','0012_answer_question','2023-02-09 13:42:49.648755'),(49,'disease','0013_report_content','2023-02-10 15:24:09.156283'),(50,'disease','0014_disease_author','2023-02-10 15:27:00.321203'),(51,'account','0001_initial','2023-02-21 13:38:20.777786'),(52,'account','0002_email_max_length','2023-02-21 13:38:20.899945'),(53,'sites','0001_initial','2023-02-21 13:38:20.948371'),(54,'sites','0002_alter_domain_unique','2023-02-21 13:38:20.996276'),(55,'socialaccount','0001_initial','2023-02-21 13:38:21.514935'),(56,'socialaccount','0002_token_max_lengths','2023-02-21 13:38:21.608183'),(57,'socialaccount','0003_extra_data_default_dict','2023-02-21 13:38:21.635721'),(58,'disease','0015_auto_20230224_1306','2023-02-24 13:06:25.595563'),(59,'disease','0016_auto_20230225_1259','2023-02-25 13:00:01.360425'),(60,'disease','0017_alter_book_slug','2023-02-25 13:15:11.024770'),(61,'disease','0018_auto_20230225_1318','2023-02-25 13:18:13.818102'),(62,'disease','0019_alter_report_visits','2023-02-25 13:22:50.238072'),(63,'disease','0020_auto_20230225_1323','2023-02-25 13:23:22.035088'),(64,'disease','0021_auto_20230225_1342','2023-02-25 13:42:17.099744'),(65,'disease','0022_auto_20230225_1401','2023-02-25 14:01:51.071929'),(66,'disease','0023_auto_20230225_1414','2023-02-25 14:14:16.864964'),(67,'disease','0024_rename_author_news_created_by','2023-02-25 14:29:23.940793');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3lmj3prwt00wa5sjgrig5nm37dnj9dpz','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pVZDM:qjeQxLz0Op6ziLiKfJ4fuH9ZRhkZtcgT1E1qXTl_cA0','2023-03-10 14:38:24.956443'),('5d4og7cl6cjs0nd91p0yvqbirty1s052','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pUSHz:IVG0K1-XO_ny_McaAaM8I6fF0lXuq3CR1Tu-WUpKNu0','2023-03-07 13:02:35.789480'),('bep5qlcz4ik77vx9nnlfblyj4nlu6wnp','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pNwXq:01pCOYvbRPKESBXqiaSU_otMTJsUbSKhhoQ08T8o6Hk','2023-02-17 13:56:02.245404'),('bt8cm8a5clswj3yvsearmtkl1uwa4ihe','MmIwMzA5Y2M5NGRhY2E4NzIzNjhkNTZiNjViOWZiYmQwNjA0YjQ1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTgwODkyMTM1MDc3NWFjYTI1MDc3MWU2Y2M0YWVkYjJlOTUwNWVlIn0=','2023-02-04 08:14:11.204903'),('cnuuptk7wqurprcvavnqateig1czlbvs','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pUTCU:rE4737__7uiQdm33So85V7BvhQQ-od0tpxYiMVo1Fnk','2023-03-07 14:00:58.543469'),('fozgiv5jfjk0qt1svyf8zh7dwi2gfppr','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pPc8n:a1iiEpQ6Yf-CuMMll1UytxC-NkTLFkL7DPmxkSLc2Fk','2023-02-22 04:33:05.144965'),('kykk55icpoh6cb2jp93klevqbcpc6l0z','.eJxVjEEOgjAURO_StSFtgd_iTi9C5reflEhKIu3KeHfBsNDlvJl5LzWiljTWTZ7jHNVVeXX5ZYzwkHwUWJYDNwhhrbk0381Zb81tT5LLHFDmNd_P158qYUu7J_RRR2bque2o4zixJhLfBgYNk7QuGj8YJ-QQrWWIJ6Cz1mjHAEi9P-IVPSo:1pUTCw:WxXEAj-t-YwZtRqnQXFbZ9xlHTHBbSRJ_kHoW0MbSPI','2023-03-07 14:01:26.733312'),('l4gl26r0jjrg5ywzsq0bcvgp9zd67y82','eyJzb2NpYWxhY2NvdW50X3N0YXRlIjpbeyJwcm9jZXNzIjoibG9naW4iLCJzY29wZSI6IiIsImF1dGhfcGFyYW1zIjoiIn0sIkluS05WYnpxb0p2ViJdfQ:1pUT8K:8Zqcvvycc_KMDgEVFc4cdTNmhJ_mtD9A_Nbgu1gsWD0','2023-03-07 13:56:40.725380'),('n8oiyshvcsbtr7k7m4yunhkcsjynr0tt','MmIwMzA5Y2M5NGRhY2E4NzIzNjhkNTZiNjViOWZiYmQwNjA0YjQ1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTgwODkyMTM1MDc3NWFjYTI1MDc3MWU2Y2M0YWVkYjJlOTUwNWVlIn0=','2023-01-30 02:56:57.679711'),('nf5us54jhtwt4gp8rdzj4arfc64c1af8','.eJxVjMsOwiAQRf-FtSEDAyO4dO83kOFRqRqalHZl_HfbpAvd3nPOfYvA61LD2sscxiwugsTpd4ucnqXtID-43SeZprbMY5S7Ig_a5W3K5XU93L-Dyr1uddSZFAIYsAUiIlrAQSfNnjNGT5QUOHLKWZcInCl-kwZKSGfDCo34fAG04TZy:1pUT0P:W3uSWs9OXff776PNWPZKpW6ayJZAxRAi_lNC8iGYi0w','2023-03-07 13:48:29.583892'),('nm9emg9nn8p0flr0zr729r1qfou6g6oi','.eJyVVGtTozAU_Su7-ay1EOhrZmeWPrRa17WltorjMLcQIDUQGgJtdfzvG0rrqrPPb-Tee-7JPeeGZ5RxjwIDz-N5It3qxHhIE9R5Rvtw-Ul91Elyxo5QnhHh_jymghfUJwJ1UMh5yAhSJWUaaVq9idsmbhsY6-2GqeFmS1NZBpl09xxVDx8kcZecJuS1LdlIAa5KwIH9t_1IDJSpPCOCJFv-SDLCvoZlsObxWBUURNCAEt_dV0qRkyOUQEwU6pFK-BQr6COo0pAWJHHfpFQsgJiy7SH4WppST-aiDEVSplnn5IRFuFZpUGrk8USSRJZ3OIETa-CfTlNz2b3pR7rEhR-d4suR1V4A4TSIrmZi8hTZy-tmbzj7krUbx16pFPeAlQwkQS8vlfTvzUghy9ZclPJ8tnHr-7DVm7S_zeYbzY_64VzgCetd3Q565yN7GAc4MbrN2S8toJmb5SkRFUUALCMV337sUgcqFOq9NrtGH5X5qyElmYQgeCVSAfCk0v5gzruNQHpdx8d1_VjXphrumEYHm7V203BUK8F3AhU0o5ILpERSnSUpVVKb6ZEsKy-ym1SlPJ7uh4FcRm4KAuKyoMTtbu2C7wsFIip6_4et_-edOwyUChqD2FbHl4cjJBUoeW8mpOmOQjs6vLw3jPt6tAW9XYO6NSucWcad1rLPx8a1aXS7bm47gWs7_ZDbzNpIZztvrHqhiGTfdNiKXAzWa9O-8OlC06yzYhw0x9rTxPKHl_OVXvTvtj6ANr9QKPdmkcCFubnZbBu573Svjag4dRuxUwzW5i2b2c1uXT8rpnIyzkfDm9EG393h82J4PV2o5abQC-9Glv1oWxPLPh2fLfw1nBvb41UwjuYrA68bl_aU5sNlvq5rDYz2w7kZ8QSRlT9kk1JlhAvyg__Gzn-j1tJMZ_coPvzBKvfv_9v-ljWA4vJ2fNaYxujh5QdoXK_k:1pUT6t:NFgPHFgmcOgiyC9ZkWB7EGtm0u8PL6pBfWM40_RSV2Q','2023-03-07 13:55:11.852931'),('ovw5107pojieebv9rs12lrokygsvcf85','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pVYJD:przZeImjmP7xEludLEJVutI1fiiRdF_OUlFT_H2uLps','2023-03-10 13:40:23.799684'),('ranrkroicc8tjx44aii14dc6ox14osd1','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pLxkC:VGZGY2-fKxpsVJBy3F_TKJ9Buz9mW95nrIZxXVad6CA','2023-02-12 02:48:36.024008'),('w4gwzy5yybqz4cyfaxg848i8hre8g3vh','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pTORT:dFAJdQ8cxu4pWTq4wIw_TN2D_5uEqGoY60J_RNUl5R4','2023-03-04 14:43:59.776011'),('wcbda49k12u37yoa8mfge44t55a28io3','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pQ6i9:JHHJ1K4P9qdzATO7aL7zgkogGD575I4fcqbsaM6Xv1M','2023-02-23 13:11:37.240866'),('yfhqq8kwaf5n6650jqh5tk0lekpjt1kw','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pVXRn:_m4pJAG6ybwA4xsrToMLsH9-Z7jOr5IjuAm-GKYSPVU','2023-03-10 12:45:11.491975');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com'),(2,'localhost:8000','localhost:8000');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_social_user_id_8146e70c_fk_users_use` (`user_id`),
  CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (2,'google','110739539433296513781','2023-02-21 13:59:30.224040','2023-02-21 13:59:30.224085','{\"id\": \"110739539433296513781\", \"email\": \"lerenyokesel@gmail.com\", \"verified_email\": true, \"name\": \"kita mereka\", \"given_name\": \"kita\", \"family_name\": \"mereka\", \"picture\": \"https://lh3.googleusercontent.com/a/AEdFTp5jBUDh2t3vdhF3LKA9baeoifhNVrRzhSjP7CHV=s96-c\", \"locale\": \"en\"}',7),(3,'google','106985580959308652453','2023-02-21 14:01:26.696950','2023-02-21 14:01:26.697003','{\"id\": \"106985580959308652453\", \"email\": \"keselyoleren@gmail.com\", \"verified_email\": true, \"name\": \"Hadi Sasmita\", \"given_name\": \"Hadi\", \"family_name\": \"Sasmita\", \"picture\": \"https://lh3.googleusercontent.com/a/AEdFTp4_XbOjagPc5uATiZMSuWfS2Fmn8A0OsDsRPp41eg=s96-c\", \"locale\": \"en\"}',8);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'google','Tropical Diseases','1043339594187-t7qftsu8gj7vjgrs3usuje92n6l19kl3.apps.googleusercontent.com','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','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
INSERT INTO `socialaccount_socialtoken` VALUES (2,'ya29.a0AVvZVsouFyp3yq-qhqSolCY6zXFuuAWS7FCJrl-aRAYbqnvV8ybONH6cuqy-6ywko7zsBzUqFA1XhwsINB6Rb98vMeAWJb_6lwWftq4RnV8NGUnkJAOB_7pzMwaE6IpYjuQG7zfnI3YA-uMTLwe2DEn5CO27aCgYKAYESARASFQGbdwaIuwSwBkYF6N6-85_WTWwGSQ0163','','2023-02-21 14:59:29.047389',2,1),(3,'ya29.a0AVvZVsrUpTBjTs6y3TAw7nAZyzM_ZO2jcjU3TZBekX1nVWyXtdkUjMhGm7X_k_Qntpmxm2TTPq_aYdy163iA7SKxaygD87WTr4o3ERoAsBGNX-FVCiCHDrsvG-tfBMif9-_4qojt1TR22JZYFBcTw3YH5SSMaCgYKAZ4SARESFQGbdwaIGZ53QlZpNsYamlugAwMJdg0163','','2023-02-21 15:01:25.366601',3,1);
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_blacklistedtoken` VALUES (1,'2023-01-16 07:41:38.381331',2),(2,'2023-01-16 07:44:04.186019',8);
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_users_use` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3MzkzODc2NCwiaWF0IjoxNjczODUyMzY0LCJqdGkiOiI1MDdlYmNmNTM4YTg0OWE3OTIyZjgyMzg1YTNhZjdlZCIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.Jsl6V6tgILewW8q0WlHPCL6h4OdrQ8yuxF74hTuA8mM','2023-01-16 06:59:24.525805','2023-01-17 06:59:24.000000',1,'507ebcf538a849a7922f82385a3af7ed'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3MzkzODc2OCwiaWF0IjoxNjczODUyMzY4LCJqdGkiOiIxZDdiZjA4ZmFkYTA0MWViYmZkNTUyYjJhNGZiMzM3OSIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.k1ct8emlZU3b-JYKdX3YOiqaB7KFyPxmsppVOXVLq0g','2023-01-16 06:59:28.838136','2023-01-17 06:59:28.000000',1,'1d7bf08fada041ebbfd552b2a4fb3379'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0MDY3NywiaWF0IjoxNjczODU0Mjc3LCJqdGkiOiI5NTFmYzVlNDRmMGM0MGNhOTgxYzI1NWVjZDU2YjhiNSIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.krUtLjK2gtFtAAp07lr_7KGXwMs13VTuWc_X9O2hEfY','2023-01-16 07:31:17.202680','2023-01-17 07:31:17.000000',1,'951fc5e44f0c40ca981c255ecd56b8b5'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0MDgwMiwiaWF0IjoxNjczODU0NDAyLCJqdGkiOiI1ZTdmY2MwYzQ0MTM0NjM0YWVkNjhhNjQ1YzA5YTU5OSIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.Jnro-vtzNnmRTeb7PU9FEObB09dNX8c2kWZyrKtWNH0','2023-01-16 07:33:22.764767','2023-01-17 07:33:22.000000',1,'5e7fcc0c44134634aed68a645c09a599'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0MDgyNiwiaWF0IjoxNjczODU0NDI2LCJqdGkiOiI5NzE2YjgwY2Y4NzA0ZjJmYWExMmJhYjFhMDBmNDE1MCIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.bF97nnS84SbnCkV71_2PUGY9WSt-QO2nD5IrIigHfRc','2023-01-16 07:33:46.166122','2023-01-17 07:33:46.000000',1,'9716b80cf8704f2faa12bab1a00f4150'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0MTE1NiwiaWF0IjoxNjczODU0NzU2LCJqdGkiOiI0MGNkZTY1MWJlZTc0NjJjOGMyNWM1MmE4ZWQ3NzExYiIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.3potcgAf31qu83uefUnXgvp0nqCccTKT8ysP4wRdU1M','2023-01-16 07:39:16.021009','2023-01-17 07:39:16.000000',1,'40cde651bee7462c8c25c52a8ed7711b'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0MTI0NywiaWF0IjoxNjczODU0ODQ3LCJqdGkiOiJmMTM4MjM1N2Q2MDA0M2E2YTAxNjVmZDllMWZhYzNmMyIsInVzZXJfaWQiOjEsImF1ZCI6dHJ1ZX0.2GpKWNTt87QkRpkyq1QysTfTMk0uCSnDM-OB8PJJARQ','2023-01-16 07:40:47.296151','2023-01-17 07:40:47.000000',1,'f1382357d60043a6a0165fd9e1fac3f3'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0MTM5NywiaWF0IjoxNjczODU0OTk3LCJqdGkiOiIzN2Q2MTQ5NjlhNjY0ODI2YTEwNTNhY2JkODA2NmFkMiIsInVzZXJfaWQiOjF9.85NgZvLN98sQ9j2sNOnT-_rfdlYoQYOBXmhEHIYLmNI','2023-01-16 07:43:17.470163','2023-01-17 07:43:17.000000',1,'37d614969a664826a1053acbd8066ad2'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3Mzk0NTMzNiwiaWF0IjoxNjczODU4OTM2LCJqdGkiOiIzY2UwNzkzMmU1ZTk0NThmYTg2MDg4Njk2Y2FjNzIzMiIsInVzZXJfaWQiOjF9.BFWcKmnV4bSBeDp3xCKvc2NSTB_w7ti5MZEy2xK2mHk','2023-01-16 08:48:56.434984','2023-01-17 08:48:56.000000',1,'3ce07932e5e9458fa86088696cac7232');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_useraccount`
--

DROP TABLE IF EXISTS `users_useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_useraccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_useraccount`
--

LOCK TABLES `users_useraccount` WRITE;
/*!40000 ALTER TABLE `users_useraccount` DISABLE KEYS */;
INSERT INTO `users_useraccount` VALUES (1,'pbkdf2_sha256$260000$d8DxsHV0RqPM1ysyGVpW21$7h7Ri+MrZu514v573bjdZtxlQpaDVEPUY5NKQMI83Dk=','2023-02-24 14:38:24.928946',1,'admin','','','admin@gmail.com',1,1,'2023-01-16 02:56:42.883497','visitor'),(2,'pbkdf2_sha256$180000$J9FblKYMOHW6$ugkF8sDmKB7J7QFNR+kEW5xU2LqAxcR5gpxNlf/f5rQ=',NULL,0,'keselyoleren','','','',0,1,'2023-01-16 03:53:51.979359','editor'),(7,'!csTyJ5GddN6gKpaiRR3IP3HrRgASRHNeHPazs392','2023-02-21 13:59:30.000000',1,'kita','kita','mereka','lerenyokesel@gmail.com',0,1,'2023-02-21 13:59:30.000000','visitor'),(8,'!HsEPyI3SZDSMyotZzFIb0YwWQyAWNrXbSchm0YZX','2023-02-21 14:01:26.722898',0,'hadi','Hadi','Sasmita','keselyoleren@gmail.com',0,1,'2023-02-21 14:01:26.667726','visitor');
/*!40000 ALTER TABLE `users_useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_useraccount_groups`
--

DROP TABLE IF EXISTS `users_useraccount_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_useraccount_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `useraccount_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_useraccount_groups_useraccount_id_group_id_3cd0c5ca_uniq` (`useraccount_id`,`group_id`),
  KEY `users_useraccount_groups_group_id_1577102c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_useraccount_gr_useraccount_id_5be1cfea_fk_users_use` FOREIGN KEY (`useraccount_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `users_useraccount_groups_group_id_1577102c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_useraccount_groups`
--

LOCK TABLES `users_useraccount_groups` WRITE;
/*!40000 ALTER TABLE `users_useraccount_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_useraccount_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_useraccount_user_permissions`
--

DROP TABLE IF EXISTS `users_useraccount_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_useraccount_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `useraccount_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_useraccount_user_p_useraccount_id_permissio_44b0b237_uniq` (`useraccount_id`,`permission_id`),
  KEY `users_useraccount_us_permission_id_a6d5a0c1_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_useraccount_us_permission_id_a6d5a0c1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_useraccount_us_useraccount_id_79ea4373_fk_users_use` FOREIGN KEY (`useraccount_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_useraccount_user_permissions`
--

LOCK TABLES `users_useraccount_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_useraccount_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_useraccount_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-25 21:49:36
