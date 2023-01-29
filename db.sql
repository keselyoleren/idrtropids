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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add User Account',6,'add_useraccount'),(22,'Can change User Account',6,'change_useraccount'),(23,'Can delete User Account',6,'delete_useraccount'),(24,'Can view User Account',6,'view_useraccount'),(25,'Can add blacklisted token',7,'add_blacklistedtoken'),(26,'Can change blacklisted token',7,'change_blacklistedtoken'),(27,'Can delete blacklisted token',7,'delete_blacklistedtoken'),(28,'Can view blacklisted token',7,'view_blacklistedtoken'),(29,'Can add outstanding token',8,'add_outstandingtoken'),(30,'Can change outstanding token',8,'change_outstandingtoken'),(31,'Can delete outstanding token',8,'delete_outstandingtoken'),(32,'Can view outstanding token',8,'view_outstandingtoken'),(33,'Can add Token',9,'add_token'),(34,'Can change Token',9,'change_token'),(35,'Can delete Token',9,'delete_token'),(36,'Can view Token',9,'view_token'),(37,'Can add token',10,'add_tokenproxy'),(38,'Can change token',10,'change_tokenproxy'),(39,'Can delete token',10,'delete_tokenproxy'),(40,'Can view token',10,'view_tokenproxy'),(41,'Can add News',11,'add_news'),(42,'Can change News',11,'change_news'),(43,'Can delete News',11,'delete_news'),(44,'Can view News',11,'view_news'),(45,'Can add symptoms',12,'add_symptoms'),(46,'Can change symptoms',12,'change_symptoms'),(47,'Can delete symptoms',12,'delete_symptoms'),(48,'Can view symptoms',12,'view_symptoms'),(49,'Can add Disease',13,'add_disease'),(50,'Can change Disease',13,'change_disease'),(51,'Can delete Disease',13,'delete_disease'),(52,'Can view Disease',13,'view_disease'),(53,'Can add Article',14,'add_article'),(54,'Can change Article',14,'change_article'),(55,'Can delete Article',14,'delete_article'),(56,'Can view Article',14,'view_article'),(57,'Can add Book',15,'add_book'),(58,'Can change Book',15,'change_book'),(59,'Can delete Book',15,'delete_book'),(60,'Can view Book',15,'view_book'),(61,'Can add keyword',16,'add_keyword'),(62,'Can change keyword',16,'change_keyword'),(63,'Can delete keyword',16,'delete_keyword'),(64,'Can view keyword',16,'view_keyword'),(65,'Can add Category',17,'add_category'),(66,'Can change Category',17,'change_category'),(67,'Can delete Category',17,'delete_category'),(68,'Can view Category',17,'view_category');
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
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
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
  `slug` varchar(50) NOT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_article`
--

LOCK TABLES `disease_article` WRITE;
/*!40000 ALTER TABLE `disease_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_article_keyword`
--

DROP TABLE IF EXISTS `disease_article_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_article_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disease_article_keyword_article_id_keyword_id_c508190f_uniq` (`article_id`,`keyword_id`),
  KEY `disease_article_keyw_keyword_id_de1b4fa5_fk_disease_k` (`keyword_id`),
  CONSTRAINT `disease_article_keyw_article_id_217b6f08_fk_disease_a` FOREIGN KEY (`article_id`) REFERENCES `disease_article` (`id`),
  CONSTRAINT `disease_article_keyw_keyword_id_de1b4fa5_fk_disease_k` FOREIGN KEY (`keyword_id`) REFERENCES `disease_keyword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_article_keyword`
--

LOCK TABLES `disease_article_keyword` WRITE;
/*!40000 ALTER TABLE `disease_article_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_article_keyword` ENABLE KEYS */;
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
  `slug` varchar(50) NOT NULL,
  `year_publish` date NOT NULL,
  `pages` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `edition` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publication` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `issn` varchar(100) NOT NULL,
  `abstract` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_book`
--

LOCK TABLES `disease_book` WRITE;
/*!40000 ALTER TABLE `disease_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_book_keyword`
--

DROP TABLE IF EXISTS `disease_book_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_book_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `disease_book_keyword_book_id_keyword_id_07e91c0f_uniq` (`book_id`,`keyword_id`),
  KEY `disease_book_keyword_keyword_id_157055d4_fk_disease_keyword_id` (`keyword_id`),
  CONSTRAINT `disease_book_keyword_book_id_b95fc8e4_fk_disease_book_id` FOREIGN KEY (`book_id`) REFERENCES `disease_book` (`id`),
  CONSTRAINT `disease_book_keyword_keyword_id_157055d4_fk_disease_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `disease_keyword` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_book_keyword`
--

LOCK TABLES `disease_book_keyword` WRITE;
/*!40000 ALTER TABLE `disease_book_keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_book_keyword` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `disease_disease_category_id_51d90c30_fk_disease_category_id` (`category_id`),
  CONSTRAINT `disease_disease_category_id_51d90c30_fk_disease_category_id` FOREIGN KEY (`category_id`) REFERENCES `disease_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_disease`
--

LOCK TABLES `disease_disease` WRITE;
/*!40000 ALTER TABLE `disease_disease` DISABLE KEYS */;
INSERT INTO `disease_disease` VALUES (1,'2023-01-29 02:55:04.186351','2023-01-29 02:55:04.186414','Coronary Artery Disease (CAD)','Testing','Testing','testing','testing','teting','testing',1),(2,'2023-01-29 02:58:46.720200','2023-01-29 02:58:46.720245','Heart Attack Symptoms, Risk, and Recovery','Test','Test','test','test','test','test',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_keyword`
--

LOCK TABLES `disease_keyword` WRITE;
/*!40000 ALTER TABLE `disease_keyword` DISABLE KEYS */;
INSERT INTO `disease_keyword` VALUES (1,'2023-01-21 08:15:32.728189','2023-01-21 08:15:32.728240','Nominal');
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
  `slug` varchar(50) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `editor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `disease_news_author_id_ea6f3d6d_fk_users_useraccount_id` (`author_id`),
  KEY `disease_news_disease_id_75eb579b_fk_disease_disease_id` (`disease_id`),
  KEY `disease_news_editor_id_5f091f88_fk_users_useraccount_id` (`editor_id`),
  CONSTRAINT `disease_news_author_id_ea6f3d6d_fk_users_useraccount_id` FOREIGN KEY (`author_id`) REFERENCES `users_useraccount` (`id`),
  CONSTRAINT `disease_news_disease_id_75eb579b_fk_disease_disease_id` FOREIGN KEY (`disease_id`) REFERENCES `disease_disease` (`id`),
  CONSTRAINT `disease_news_editor_id_5f091f88_fk_users_useraccount_id` FOREIGN KEY (`editor_id`) REFERENCES `users_useraccount` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_news`
--

LOCK TABLES `disease_news` WRITE;
/*!40000 ALTER TABLE `disease_news` DISABLE KEYS */;
INSERT INTO `disease_news` VALUES (1,'2023-01-29 02:56:58.764535','2023-01-29 02:57:12.990988','Coronary Artery Disease (CAD)','<h1>Coronary Artery Disease (CAD)</h1>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/coronary_ad.htm#print\" onclick=\"window.print()\">Print</a></p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/coronary_ad.htm#\"><img alt=\"Illustration of coronary artery disease.\" src=\"https://www.cdc.gov/heartdisease/images/coronary-artery-disease-medium.jpg?_=80846\" title=\"coronary-artery-disease\" /></a></p>\r\n\r\n<p>Coronary artery disease is caused by plaque buildup in the wall of the arteries that supply blood to the heart (called coronary arteries). Plaque is made up of cholesterol deposits. Plaque buildup causes the inside of the arteries to narrow over time. This process is called atherosclerosis.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/coronary_ad.htm#\">View Larger</a></p>\r\n\r\n<h2>What is coronary artery disease?</h2>\r\n\r\n<p>Coronary artery disease (CAD) is the most common type of heart disease in the United States. It is sometimes called coronary heart disease or ischemic heart disease.</p>\r\n\r\n<p>For some people, the first sign of CAD is a&nbsp;<a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm\">heart attack</a>. You and your health care team may be able to help reduce your risk for CAD.</p>\r\n\r\n<h2>What causes coronary artery disease?</h2>\r\n\r\n<p>CAD is caused by plaque buildup in the walls of the arteries that supply blood to the heart (called coronary arteries) and other parts of the body.</p>\r\n\r\n<p>Plaque is made up of deposits of&nbsp;<a href=\"https://www.cdc.gov/cholesterol/\">cholesterol</a>&nbsp;and other substances in the artery. Plaque buildup causes the inside of the arteries to narrow over time, which can partially or totally block the blood flow. This process is called atherosclerosis.</p>\r\n\r\n<h2>What are the symptoms of coronary artery disease?</h2>\r\n\r\n<p><strong>Angina</strong>, or chest pain and discomfort, is the most common symptom of CAD. Angina can happen when too much plaque builds up inside arteries, causing them to narrow. Narrowed arteries can cause chest pain because they can block blood flow to your heart muscle and the rest of your body.</p>\r\n\r\n<p>For many people, the first clue that they have CAD is a&nbsp;<a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm\">heart attack</a>. Symptoms of heart attack include</p>\r\n\r\n<ul>\r\n	<li>Chest pain or discomfort (angina)</li>\r\n	<li>Weakness, light-headedness, nausea (feeling sick to your stomach), or a cold sweat</li>\r\n	<li>Pain or discomfort in the arms or shoulder</li>\r\n	<li>Shortness of breath</li>\r\n</ul>\r\n\r\n<p>Over time, CAD can weaken the heart muscle. This may lead to heart failure, a serious condition where the heart can&rsquo;t pump blood the way it should.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/facts.htm\"><strong>Learn the facts about heart disease</strong></a>, including coronary artery disease, the most common type of heart disease.</p>\r\n\r\n<h2>What are the risks for coronary artery disease?</h2>\r\n\r\n<p>Overweight, physical inactivity, unhealthy eating, and smoking tobacco are risk factors for CAD. A family history of heart disease also increases your risk for CAD, especially a family history of having heart disease at an early age (50 or younger).</p>\r\n\r\n<p>To find out your risk for CAD, your health care team may measure your blood pressure, blood cholesterol, and blood sugar levels.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/risk_factors.htm\">Learn more about heart disease risk factors</a>.</p>\r\n\r\n<h2>How is coronary artery disease diagnosed?</h2>\r\n\r\n<p>If you&rsquo;re at high risk for heart disease or already have symptoms, your doctor can use several tests to diagnose CAD.</p>\r\n\r\n<table>\r\n	<caption>Heart tests and what they do.</caption>\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\">Test</th>\r\n			<th scope=\"col\">What it Does</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<th scope=\"row\">ECG or EKG (electrocardiogram)</th>\r\n			<td>Measures the electrical activity, rate, and regularity of your heartbeat.</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Echocardiogram</th>\r\n			<td>Uses ultrasound (special sound wave) to create a picture of the heart.</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Exercise stress test</th>\r\n			<td>Measures your heart rate while you walk on a treadmill. This helps to determine how well your heart is working when it has to pump more blood.</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Chest X-ray</th>\r\n			<td>Uses x-rays to create a picture of the heart, lungs, and other organs in the chest.</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Cardiac catheterization</th>\r\n			<td>Checks the inside of your arteries for blockage by inserting a thin, flexible tube through an artery in the groin, arm, or neck to reach the heart. Health care professionals can measure blood pressure within the heart and the strength of blood flow through the heart&rsquo;s chambers as well as collect blood samples from the heart or inject dye into the arteries of the heart (coronary arteries).</td>\r\n		</tr>\r\n		<tr>\r\n			<th scope=\"row\">Coronary angiogram</th>\r\n			<td>Monitors blockage and flow of blood through the coronary arteries. Uses X-rays to detect dye injected via cardiac catheterization.</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Coronary artery calcium scan</th>\r\n			<td>A computed tomography (CT) scan that looks in the coronary arteries for calcium buildup and plaque.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2>What is cardiac rehabilitation and recovery?</h2>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/cardiac_rehabilitation.htm\">Cardiac rehabilitation</a>&nbsp;(rehab) is an important program for anyone recovering from a heart attack, heart failure, or other heart problem that required surgery or medical care. In these people, cardiac rehab can help improve quality of life and can help prevent another cardiac event. Cardiac rehab is a supervised program that includes</p>\r\n\r\n<ul>\r\n	<li>Physical activity</li>\r\n	<li>Education about healthy living, including healthy eating, taking medicine as prescribed, and ways to help you quit smoking</li>\r\n	<li>Counseling to find ways to relieve stress and improve mental health</li>\r\n</ul>\r\n\r\n<p>A team of people may help you through cardiac rehab, including your health care team, exercise and nutrition specialists, physical therapists, and counselors or mental health professionals.</p>\r\n\r\n<h2>How can I be healthier if I have coronary artery disease?</h2>\r\n\r\n<p>If you have CAD, your health care team may suggest the following steps to help lower your risk for heart attack or worsening heart disease:</p>\r\n\r\n<ul>\r\n	<li>Lifestyle changes, such as eating a healthier (lower sodium, lower fat) diet, increasing physical activity, reaching a healthy weight, and quitting smoking</li>\r\n	<li>Medicines to treat risk factors for CAD, such as high cholesterol, high blood pressure, or an irregular heartbeat</li>\r\n	<li>Surgical procedures to help restore blood flow to the heart</li>\r\n</ul>','coronary-artery-disease-cad',2,1,NULL),(2,'2023-01-29 02:59:47.922171','2023-01-29 02:59:47.922215','Heart Attack Symptoms, Risk, and Recovery','<h1>Heart Attack Symptoms, Risk, and Recovery</h1>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm#print\" onclick=\"window.print()\">Print</a></p>\r\n\r\n<h2>What is a heart attack?</h2>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm#\"><img alt=\"Heart attack signs and symptoms in women and men.\" src=\"https://www.cdc.gov/heartdisease/images/Heart-Attack-Signs-Men-Women-medium.jpg?_=75239\" title=\"\" /></a></p>\r\n\r\n<p>Heart attack signs and symptoms in men and women: Chest pain or discomfort; Shortness of breath; Pain or discomfort in the jaw, neck, back, arm, or shoulder; Feeling nauseous, light-headed, or unusually tired.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/heart_attack.htm#\">View Larger</a></p>\r\n\r\n<p>A heart attack, also called a myocardial infarction, happens when a part of the heart muscle doesn&rsquo;t get enough blood.</p>\r\n\r\n<p>The more time that passes without treatment to restore blood flow, the greater the damage to the heart muscle.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/coronary_ad.htm\">Coronary artery disease (CAD)</a>&nbsp;is the main cause of heart attack. A less common cause is a severe spasm, or sudden contraction, of a coronary artery that can stop blood flow to the heart muscle.</p>\r\n\r\n<h2>What are the symptoms of heart attack?</h2>\r\n\r\n<p>The major symptoms of a heart attack are</p>\r\n\r\n<ul>\r\n	<li><strong>Chest pain or discomfort.</strong>&nbsp;Most heart attacks involve discomfort in the center or left side of the chest that lasts for more than a few minutes or that goes away and comes back. The discomfort can feel like uncomfortable pressure, squeezing, fullness, or pain.</li>\r\n	<li><strong>Feeling weak, light-headed, or faint.</strong>&nbsp;You may also break out into a cold sweat.</li>\r\n	<li><strong>Pain or discomfort in the jaw, neck, or back.</strong></li>\r\n	<li><strong>Pain or discomfort in one or both arms or shoulders.</strong></li>\r\n	<li><strong>Shortness of breath.</strong>&nbsp;This often comes along with chest discomfort, but shortness of breath also can happen before chest discomfort.</li>\r\n</ul>\r\n\r\n<p>Other symptoms of a heart attack could include unusual or unexplained tiredness and nausea or vomiting. Women are more likely to have these other symptoms.&nbsp;<a href=\"https://www.cdc.gov/heartdisease/women.htm\">Learn more about women and heart disease</a>.</p>\r\n\r\n<p><strong>Every 40 seconds, someone in the United States has a heart attack.</strong>1&nbsp;<a href=\"https://www.cdc.gov/heartdisease/facts.htm\">Learn more facts about heart attack and heart disease.</a></p>\r\n\r\n<h2>Call 9-1-1 if you notice symptoms of a heart attack.</h2>\r\n\r\n<p>If you notice the symptoms of a heart attack in yourself or someone else,&nbsp;<strong>call 9-1-1 immediately</strong>. The sooner you get to an emergency room, the sooner you can get treatment to reduce the amount of damage to the heart muscle. At the hospital, health care professionals can run tests to find out if a heart attack is happening and decide the best treatment.</p>\r\n\r\n<p>In some cases, a heart attack requires cardiopulmonary resuscitation (CPR) or an electrical shock (defibrillation) to the heart to get the heart pumping again. Bystanders trained to use CPR or a defibrillator may be able to help until emergency medical personnel arrive.</p>\r\n\r\n<p>Remember, the chances of surviving a heart attack are better the sooner emergency treatment begins.</p>\r\n\r\n<h2>What are the risk factors for heart attack?</h2>\r\n\r\n<p>Several health conditions, your lifestyle, and your age and family history can increase your risk for heart disease and heart attack. These are called risk factors. About&nbsp;<strong>half of all Americans&nbsp;</strong>have at least one of the three key risk factors for heart disease: high blood pressure, high blood cholesterol, and smoking.2</p>\r\n\r\n<p>Some risk factors cannot be controlled, such as your age or family history. But you can take steps to lower your risk by changing the factors you&nbsp;<strong>can&nbsp;</strong>control.</p>\r\n\r\n<p>Learn more about&nbsp;<a href=\"https://www.cdc.gov/heartdisease/risk_factors.htm\">risk factors</a>&nbsp;for heart disease and heart attack.</p>\r\n\r\n<h2>What can I do to recover after a heart attack?</h2>\r\n\r\n<p><a href=\"https://www.qzzr.com/c/quiz/480768/cardiac-rehabilitation-and-your-heart\"><img alt=\"Cardiac Rehab Quiz\" src=\"https://www.cdc.gov/heartdisease/images/cardiac-rehab-quiz.jpg?_=91868\" title=\"cardiac-rehab-quiz\" /></a></p>\r\n\r\n<p>Take our&nbsp;<a href=\"https://www.qzzr.com/c/quiz/480768/cardiac-rehabilitation-and-your-heart\">quiz</a>&nbsp;to see how much you know about cardiac rehabilitation.</p>\r\n\r\n<p>If you&rsquo;ve had a heart attack, your heart may be damaged. This could affect your heart&rsquo;s rhythm and its ability to pump blood to the rest of the body. You may also be at risk for another heart attack or conditions such as&nbsp;<a href=\"https://www.cdc.gov/stroke/index.htm\">stroke</a>, kidney disorders, and&nbsp;peripheral arterial disease (PAD).</p>\r\n\r\n<p>You can lower your chances of having future health problems following a heart attack with these steps:</p>\r\n\r\n<ul>\r\n	<li><strong>Physical activity</strong>&mdash;Talk with your health care team about the things you do each day in your life and work. Your doctor may want you to limit work, travel, or sexual activity for some time after a heart attack.</li>\r\n	<li><strong>Lifestyle changes</strong>&mdash;Eating a healthier diet, increasing physical activity, quitting smoking, and managing stress&mdash;in addition to taking prescribed medicines&mdash;can help improve your heart health and quality of life. Ask your health care team about attending a program called cardiac rehabilitation to help you make these lifestyle changes.</li>\r\n	<li><strong>Cardiac rehabilitation</strong>&mdash;<a href=\"https://www.cdc.gov/heartdisease/cardiac_rehabilitation.htm\">Cardiac rehabilitation</a>&nbsp;is an important program for anyone recovering from a heart attack, heart failure, or other heart problem that required surgery or medical care. Cardiac rehab is a supervised program that includes\r\n	<ul>\r\n		<li>Physical activity</li>\r\n		<li>Education about healthy living, including healthy eating, taking medicine as prescribed, and ways to help you quit smoking</li>\r\n		<li>Counseling to find ways to relieve stress and improve mental health</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<p>A team of people may help you through cardiac rehab, including your health care team, exercise and nutrition specialists, physical therapists, and counselors or mental health professionals.</p>\r\n\r\n<p><a href=\"https://www.cdc.gov/heartdisease/images/HA-signs-symptoms-social1.png\" target=\"_blank\"><img alt=\"Every 40 seconds, someone in the United States has a heart attack. Learn prevention steps at cdc.gov/heartdisease.\" src=\"https://www.cdc.gov/heartdisease/images/HA-signs-symptoms-social1.png?_=39875\" title=\"\" /></a></p>\r\n\r\n<h2>More Information</h2>\r\n\r\n<ul>\r\n	<li>American Heart Association:&nbsp;<a href=\"http://www.heart.org/HEARTORG/Conditions/HeartAttack/Heart-Attack_UCM_001092_SubHomePage.jsp\">Heart Attack</a></li>\r\n	<li>National Heart, Lung, and Blood Institute:&nbsp;<a href=\"https://www.nhlbi.nih.gov/health-topics/heart-attack\">Heart Attack</a></li>\r\n</ul>\r\n\r\n<h2>References</h2>\r\n\r\n<ol>\r\n	<li>Tsao CW, Aday AW, Almarzooq ZI, Beaton AZ, Bittencourt MS, Boehme AK, et al.&nbsp;<a href=\"https://doi.org/10.1161/cir.0000000000001052\">Heart Disease and Stroke Statistics&mdash;2022 Update: A Report From the American Heart Association</a>.&nbsp;<em>Circulation.</em>&nbsp;2022;145(8):e153&ndash;e639.</li>\r\n	<li>Fryar CD, Chen T-C, Li X.&nbsp;<a href=\"https://www.cdc.gov/nchs/data/databriefs/db103.pdf\" target=\"_blank\">Prevalence of uncontrolled risk factors for cardiovascular disease: United States, 1999&ndash;2010&nbsp;[PDF-494K]</a>. NCHS data brief, no. 103. Hyattsville, MD: National Center for Health Statistics; 2012. Accessed May 9, 2019.</li>\r\n</ol>','heart-attack-symptoms-risk-and-recovery',1,2,NULL);
/*!40000 ALTER TABLE `disease_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_symptoms`
--

DROP TABLE IF EXISTS `disease_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_symptoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `disease_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disease_symptoms_disease_id_b6cea117_fk_disease_disease_id` (`disease_id`),
  CONSTRAINT `disease_symptoms_disease_id_b6cea117_fk_disease_disease_id` FOREIGN KEY (`disease_id`) REFERENCES `disease_disease` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_symptoms`
--

LOCK TABLES `disease_symptoms` WRITE;
/*!40000 ALTER TABLE `disease_symptoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `disease_symptoms` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-16 03:53:52.213065','2','keselyoleren',1,'[{\"added\": {}}]',6,1),(2,'2023-01-21 08:15:32.729788','1','Nominal',1,'[{\"added\": {}}]',16,1),(3,'2023-01-29 02:51:50.322894','1','About Heart Disease',1,'[{\"added\": {}}]',17,1),(4,'2023-01-29 02:55:04.188278','1','Coronary Artery Disease (CAD)',1,'[{\"added\": {}}]',13,1),(5,'2023-01-29 02:56:58.768381','1','Coronary Artery Disease (CAD)',1,'[{\"added\": {}}]',11,1),(6,'2023-01-29 02:57:12.994494','1','Coronary Artery Disease (CAD)',2,'[]',11,1),(7,'2023-01-29 02:58:46.721866','2','Heart Attack Symptoms, Risk, and Recovery',1,'[{\"added\": {}}]',13,1),(8,'2023-01-29 02:59:47.924957','2','Heart Attack Symptoms, Risk, and Recovery',1,'[{\"added\": {}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(9,'authtoken','token'),(10,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(14,'disease','article'),(15,'disease','book'),(17,'disease','category'),(13,'disease','disease'),(16,'disease','keyword'),(11,'disease','news'),(12,'disease','symptoms'),(5,'sessions','session'),(7,'token_blacklist','blacklistedtoken'),(8,'token_blacklist','outstandingtoken'),(6,'users','useraccount');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-16 02:55:49.973967'),(2,'contenttypes','0002_remove_content_type_name','2023-01-16 02:55:50.125298'),(3,'auth','0001_initial','2023-01-16 02:55:50.272618'),(4,'auth','0002_alter_permission_name_max_length','2023-01-16 02:55:50.781641'),(5,'auth','0003_alter_user_email_max_length','2023-01-16 02:55:50.798896'),(6,'auth','0004_alter_user_username_opts','2023-01-16 02:55:50.830959'),(7,'auth','0005_alter_user_last_login_null','2023-01-16 02:55:50.857013'),(8,'auth','0006_require_contenttypes_0002','2023-01-16 02:55:50.869970'),(9,'auth','0007_alter_validators_add_error_messages','2023-01-16 02:55:50.903788'),(10,'auth','0008_alter_user_username_max_length','2023-01-16 02:55:50.944094'),(11,'auth','0009_alter_user_last_name_max_length','2023-01-16 02:55:50.982523'),(12,'auth','0010_alter_group_name_max_length','2023-01-16 02:55:51.031439'),(13,'auth','0011_update_proxy_permissions','2023-01-16 02:55:51.051566'),(14,'users','0001_initial','2023-01-16 02:55:51.284971'),(15,'admin','0001_initial','2023-01-16 02:55:51.693669'),(16,'admin','0002_logentry_remove_auto_add','2023-01-16 02:55:51.803448'),(17,'admin','0003_logentry_add_action_flag_choices','2023-01-16 02:55:51.833936'),(18,'sessions','0001_initial','2023-01-16 02:55:51.871229'),(19,'token_blacklist','0001_initial','2023-01-16 06:40:57.015841'),(20,'token_blacklist','0002_outstandingtoken_jti_hex','2023-01-16 06:40:57.119814'),(21,'token_blacklist','0003_auto_20171017_2007','2023-01-16 06:40:57.140608'),(22,'token_blacklist','0004_auto_20171017_2013','2023-01-16 06:40:57.235127'),(23,'token_blacklist','0005_remove_outstandingtoken_jti','2023-01-16 06:40:57.360947'),(24,'token_blacklist','0006_auto_20171017_2113','2023-01-16 06:40:57.390483'),(25,'token_blacklist','0007_auto_20171017_2214','2023-01-16 06:40:58.239025'),(26,'token_blacklist','0008_migrate_to_bigautofield','2023-01-16 06:40:58.646571'),(27,'token_blacklist','0010_fix_migrate_to_bigautofield','2023-01-16 06:40:58.665619'),(28,'token_blacklist','0011_linearizes_history','2023-01-16 06:40:58.669461'),(29,'token_blacklist','0012_alter_outstandingtoken_user','2023-01-16 06:40:58.988610'),(30,'authtoken','0001_initial','2023-01-16 07:00:56.415740'),(31,'authtoken','0002_auto_20160226_1747','2023-01-16 07:00:57.067094'),(32,'authtoken','0003_tokenproxy','2023-01-16 07:00:57.072238'),(33,'disease','0001_initial','2023-01-21 08:00:27.188377'),(34,'disease','0002_remove_article_keywords','2023-01-21 08:13:24.873101'),(35,'auth','0012_alter_user_first_name_max_length','2023-01-21 08:31:45.479493'),(36,'disease','0003_auto_20230121_0831','2023-01-21 08:31:45.600701'),(37,'users','0002_alter_useraccount_first_name','2023-01-21 08:31:45.908909'),(38,'disease','0004_auto_20230129_0243','2023-01-29 02:43:47.646972'),(39,'disease','0005_disease_slug','2023-01-29 04:16:28.781530'),(40,'disease','0006_alter_disease_slug','2023-01-29 04:16:28.828281');
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
INSERT INTO `django_session` VALUES ('bt8cm8a5clswj3yvsearmtkl1uwa4ihe','MmIwMzA5Y2M5NGRhY2E4NzIzNjhkNTZiNjViOWZiYmQwNjA0YjQ1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTgwODkyMTM1MDc3NWFjYTI1MDc3MWU2Y2M0YWVkYjJlOTUwNWVlIn0=','2023-02-04 08:14:11.204903'),('n8oiyshvcsbtr7k7m4yunhkcsjynr0tt','MmIwMzA5Y2M5NGRhY2E4NzIzNjhkNTZiNjViOWZiYmQwNjA0YjQ1ODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNTgwODkyMTM1MDc3NWFjYTI1MDc3MWU2Y2M0YWVkYjJlOTUwNWVlIn0=','2023-01-30 02:56:57.679711'),('ranrkroicc8tjx44aii14dc6ox14osd1','.eJxVjMsOwiAQRf-FtSFAedWle7-BzDAgVQNJaVfGf1eSLnR57zk5LxZg30rYe1rDQuzMJDv9fgjxkeoAdId6azy2uq0L8qHwg3Z-bZSel8P9CxToZWS9VSopKRwJN0FGpem7DFjQGBG89h4m5S0mN5HAOWmjbdZoaAbpM3t_AMhFN5I:1pLxkC:VGZGY2-fKxpsVJBy3F_TKJ9Buz9mW95nrIZxXVad6CA','2023-02-12 02:48:36.024008');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_useraccount`
--

LOCK TABLES `users_useraccount` WRITE;
/*!40000 ALTER TABLE `users_useraccount` DISABLE KEYS */;
INSERT INTO `users_useraccount` VALUES (1,'pbkdf2_sha256$260000$d8DxsHV0RqPM1ysyGVpW21$7h7Ri+MrZu514v573bjdZtxlQpaDVEPUY5NKQMI83Dk=','2023-01-29 02:48:36.021081',1,'admin','','','admin@gmail.com',1,1,'2023-01-16 02:56:42.883497','visitor'),(2,'pbkdf2_sha256$180000$J9FblKYMOHW6$ugkF8sDmKB7J7QFNR+kEW5xU2LqAxcR5gpxNlf/f5rQ=',NULL,0,'keselyoleren','','','',0,1,'2023-01-16 03:53:51.979359','editor');
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

-- Dump completed on 2023-01-29 12:35:51