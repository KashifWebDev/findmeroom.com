-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: homzen
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'jBiIBzZHWci9AO9mdh7HsfrqtCv9t5FW',1,'2026-04-27 00:42:16','2026-04-27 00:42:16','2026-04-27 00:42:16');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablet_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_action` tinyint(1) NOT NULL DEFAULT '0',
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_open_new_tab` tinyint(1) NOT NULL DEFAULT '0',
  `dismissible` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Announcement 1','Explore Our Exciting New Property Listings Now Available in Prime Locations!',0,NULL,NULL,0,1,'2026-04-27 07:42:25',NULL,1,'2026-04-27 00:42:25','2026-04-27 00:42:25'),(2,'Announcement 2','Join Us for Exclusive Open House Events This Weekend and Find Your Perfect Home!',0,NULL,NULL,0,1,'2026-04-27 07:42:25',NULL,1,'2026-04-27 00:42:25','2026-04-27 00:42:25'),(3,'Announcement 3','Take Advantage of Limited-Time Offers on Luxury Homes with Stunning Features!',0,NULL,NULL,0,1,'2026-04-27 07:42:25',NULL,1,'2026-04-27 00:42:25','2026-04-27 00:42:25'),(4,'Announcement 4','Discover Your Dream Home with Our Latest Listings and Personalized Services!',0,NULL,NULL,0,1,'2026-04-27 07:42:25',NULL,1,'2026-04-27 00:42:25','2026-04-27 00:42:25');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements_translations`
--

DROP TABLE IF EXISTS `announcements_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `announcements_id` bigint unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `action_label` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`announcements_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements_translations`
--

LOCK TABLES `announcements_translations` WRITE;
/*!40000 ALTER TABLE `announcements_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers`
--

LOCK TABLES `careers` WRITE;
/*!40000 ALTER TABLE `careers` DISABLE KEYS */;
INSERT INTO `careers` VALUES (1,'Senior Full Stack Engineer, Creator Success Full Time','San Francisco, United States','$90,000 - $130,000','Lead development of innovative real estate solutions using modern technologies','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2026-04-27 00:42:25','2026-04-27 00:42:25'),(2,'Data Science Specialist, Analytics Division','New York, United States','$80,000 - $120,000','Drive data-driven decisions through advanced analytics and machine learning models','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2026-04-27 00:42:25','2026-04-27 00:42:25'),(3,'Product Marketing Manager, Growth Team','Los Angeles, United States','$90,000 - $130,000','Craft compelling marketing strategies to drive user acquisition and brand growth','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2026-04-27 00:42:25','2026-04-27 00:42:25'),(4,'UX/UI Designer, User Experience Team','Seattle, United States','$50,000 - $80,000','Design intuitive user interfaces that deliver exceptional customer experiences','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2026-04-27 00:42:25','2026-04-27 00:42:25'),(5,'Operations Manager, Supply Chain Division','Chicago, United States','$80,000 - $120,000','Optimize operational workflows and ensure seamless business processes','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2026-04-27 00:42:25','2026-04-27 00:42:25'),(6,'Financial Analyst, Investment Group','Boston, United States','$80,000 - $120,000','Analyze market trends and investment opportunities for strategic decision-making','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2026-04-27 00:42:25','2026-04-27 00:42:25');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers_translations`
--

DROP TABLE IF EXISTS `careers_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `careers_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `careers_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`careers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `careers_translations`
--

LOCK TABLES `careers_translations` WRITE;
/*!40000 ALTER TABLE `careers_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `careers_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Buying a Home',0,'Explore our collection of articles and insights in this category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(2,'Selling a Home',0,'Explore our collection of articles and insights in this category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(3,'Market Trends',0,'Explore our collection of articles and insights in this category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(4,'Home Improvement',0,'Explore our collection of articles and insights in this category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(5,'Real Estate Investing',0,'Explore our collection of articles and insights in this category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(6,'Neighborhood Guides',0,'Explore our collection of articles and insights in this category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2026-04-27 00:42:22','2026-04-27 00:42:22');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`),
  KEY `idx_categories_trans_categories_id` (`categories_id`),
  KEY `idx_categories_trans_category_lang` (`categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`),
  KEY `idx_cities_name` (`name`),
  KEY `idx_cities_state_status` (`state_id`,`status`),
  KEY `idx_cities_status` (`status`),
  KEY `idx_cities_state_id` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/5.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(2,'London','london',2,2,NULL,0,'locations/4.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(3,'New York City','new-york-city',3,3,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(4,'Amsterdam','amsterdam',4,4,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(6,'Munich','munich',6,6,NULL,0,'locations/5.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(7,'Tokyo','tokyo',7,7,NULL,0,'locations/1.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(8,'Toronto','toronto',8,8,NULL,0,'locations/1.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(9,'Sydney','sydney',9,9,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(10,'Milan','milan',10,10,NULL,0,'locations/3.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(11,'Los Angeles','los-angeles',11,3,NULL,0,'locations/3.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(12,'Berlin','berlin',12,6,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(13,'Osaka','osaka',13,7,NULL,0,'locations/3.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(14,'Vancouver','vancouver',14,8,NULL,0,'locations/1.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(15,'Melbourne','melbourne',15,9,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(16,'Rome','rome',16,10,NULL,0,'locations/5.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(17,'Marseille','marseille',17,1,NULL,0,'locations/5.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(18,'Liverpool','liverpool',18,2,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(19,'Chicago','chicago',19,3,NULL,0,'locations/4.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(20,'Rotterdam','rotterdam',20,4,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(21,'Aarhus','aarhus',21,5,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(22,'Frankfurt','frankfurt',22,6,NULL,0,'locations/1.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(23,'Kyoto','kyoto',23,7,NULL,0,'locations/3.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(24,'Montreal','montreal',24,8,NULL,0,'locations/2.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(25,'Brisbane','brisbane',25,9,NULL,0,'locations/4.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(26,'Naples','naples',26,10,NULL,0,'locations/4.jpg',0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`),
  KEY `idx_cities_trans_city_lang` (`cities_id`,`lang_code`),
  KEY `idx_cities_trans_name` (`name`),
  KEY `idx_cities_trans_cities_id` (`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_id` (`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_lang` (`contact_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_id` (`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_lang` (`contact_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_countries_name` (`name`),
  KEY `idx_countries_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,NULL,0,'published',NULL,NULL,'FRA'),(2,'England','English',0,NULL,0,'published',NULL,NULL,'UK'),(3,'USA','Americans',0,NULL,0,'published',NULL,NULL,'US'),(4,'Holland','Dutch',0,NULL,0,'published',NULL,NULL,'HL'),(5,'Denmark','Danish',0,NULL,0,'published',NULL,NULL,'DN'),(6,'Germany','German',0,NULL,0,'published',NULL,NULL,'DE'),(7,'Japan','Japanese',0,NULL,0,'published',NULL,NULL,'JP'),(8,'Canada','Canadian',0,NULL,0,'published',NULL,NULL,'CA'),(9,'Australia','Australian',0,NULL,0,'published',NULL,NULL,'AU'),(10,'Italy','Italian',0,NULL,0,'published',NULL,NULL,'IT');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`),
  KEY `idx_countries_trans_country_lang` (`countries_id`,`lang_code`),
  KEY `idx_countries_trans_name` (`name`),
  KEY `idx_countries_trans_countries_id` (`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Buying',0,'published','2026-04-27 00:42:15','2026-04-27 00:42:15',NULL),(2,'Selling',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15',NULL),(3,'Renting',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15',NULL),(4,'Financing',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(2,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(3,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(4,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(5,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(6,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(7,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',1,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(8,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(9,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(10,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(11,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(12,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(13,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',2,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(14,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(15,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(16,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(17,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(18,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(19,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(20,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',3,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(21,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',4,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(22,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',4,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(23,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',4,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(24,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',4,'published','2026-04-27 00:42:15','2026-04-27 00:42:15'),(25,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',4,'published','2026-04-27 00:42:15','2026-04-27 00:42:15');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','297bf59be1026fa5556ae96609d5342d',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','601203af9331102fb4dad870b5b25eff',1,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`),
  KEY `media_files_folder_deleted_name` (`folder_id`,`deleted_at`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',6236,'locations/1.jpg','[]','2026-04-27 00:42:15','2026-04-27 00:42:15',NULL,'public'),(2,0,'10','10',1,'image/jpeg',6236,'locations/10.jpg','[]','2026-04-27 00:42:15','2026-04-27 00:42:15',NULL,'public'),(3,0,'11','11',1,'image/jpeg',6236,'locations/11.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(4,0,'2','2',1,'image/jpeg',6236,'locations/2.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(5,0,'3','3',1,'image/jpeg',6236,'locations/3.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(6,0,'4','4',1,'image/jpeg',6236,'locations/4.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(7,0,'5','5',1,'image/jpeg',6236,'locations/5.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(8,0,'6','6',1,'image/jpeg',6236,'locations/6.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(9,0,'7','7',1,'image/jpeg',6236,'locations/7.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(10,0,'8','8',1,'image/jpeg',6236,'locations/8.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(11,0,'9','9',1,'image/jpeg',6236,'locations/9.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(12,0,'1','1',2,'image/jpeg',71367,'users/1.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(13,0,'1','1',3,'image/jpeg',2898,'avatars/1.jpg','[]','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'public'),(14,0,'10','10',3,'image/jpeg',2898,'avatars/10.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(15,0,'11','11',3,'image/jpeg',2898,'avatars/11.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(16,0,'2','2',3,'image/jpeg',2898,'avatars/2.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(17,0,'3','3',3,'image/jpeg',2898,'avatars/3.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(18,0,'4','4',3,'image/jpeg',2898,'avatars/4.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(19,0,'5','5',3,'image/jpeg',2898,'avatars/5.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(20,0,'6','6',3,'image/jpeg',2898,'avatars/6.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(21,0,'7','7',3,'image/jpeg',2898,'avatars/7.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(22,0,'8','8',3,'image/jpeg',2898,'avatars/8.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(23,0,'9','9',3,'image/jpeg',2898,'avatars/9.jpg','[]','2026-04-27 00:42:17','2026-04-27 00:42:17',NULL,'public'),(24,0,'1','1',4,'image/jpeg',9670,'properties/1.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(25,0,'10','10',4,'image/jpeg',9670,'properties/10.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(26,0,'11','11',4,'image/jpeg',9670,'properties/11.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(27,0,'12','12',4,'image/jpeg',9670,'properties/12.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(28,0,'13','13',4,'image/jpeg',9670,'properties/13.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(29,0,'2','2',4,'image/jpeg',9670,'properties/2.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(30,0,'3','3',4,'image/jpeg',9670,'properties/3.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(31,0,'4','4',4,'image/jpeg',9670,'properties/4.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(32,0,'5','5',4,'image/jpeg',9670,'properties/5.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(33,0,'6','6',4,'image/jpeg',9670,'properties/6.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(34,0,'7','7',4,'image/jpeg',9670,'properties/7.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(35,0,'8','8',4,'image/jpeg',9670,'properties/8.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(36,0,'9','9',4,'image/jpeg',9670,'properties/9.jpg','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(37,0,'floor','floor',4,'image/png',11496,'properties/floor.png','[]','2026-04-27 00:42:20','2026-04-27 00:42:20',NULL,'public'),(38,0,'1','1',5,'image/jpeg',9670,'posts/1.jpg','[]','2026-04-27 00:42:21','2026-04-27 00:42:21',NULL,'public'),(39,0,'10','10',5,'image/jpeg',9670,'posts/10.jpg','[]','2026-04-27 00:42:21','2026-04-27 00:42:21',NULL,'public'),(40,0,'2','2',5,'image/jpeg',9670,'posts/2.jpg','[]','2026-04-27 00:42:21','2026-04-27 00:42:21',NULL,'public'),(41,0,'3','3',5,'image/jpeg',9670,'posts/3.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(42,0,'4','4',5,'image/jpeg',9670,'posts/4.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(43,0,'5','5',5,'image/jpeg',9670,'posts/5.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(44,0,'6','6',5,'image/jpeg',9670,'posts/6.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(45,0,'7','7',5,'image/jpeg',9670,'posts/7.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(46,0,'8','8',5,'image/jpeg',9670,'posts/8.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(47,0,'9','9',5,'image/jpeg',9670,'posts/9.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(48,0,'md-1','md-1',5,'image/jpeg',9670,'posts/md-1.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(49,0,'md-2','md-2',5,'image/jpeg',9670,'posts/md-2.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(50,0,'about-us-contact','about-us-contact',6,'image/jpeg',11125,'pages/about-us-contact.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(51,0,'about-us-video','about-us-video',6,'image/jpeg',12341,'pages/about-us-video.jpg','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(52,0,'call-to-action','call-to-action',6,'image/png',12471,'pages/call-to-action.png','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(53,0,'house-service','house-service',6,'image/png',9307,'pages/house-service.png','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(54,0,'properties','properties',6,'image/png',18823,'pages/properties.png','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(55,0,'service-1','service-1',6,'image/png',21898,'pages/service-1.png','[]','2026-04-27 00:42:22','2026-04-27 00:42:22',NULL,'public'),(56,0,'service-2','service-2',6,'image/png',21279,'pages/service-2.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(57,0,'service-3','service-3',6,'image/png',23965,'pages/service-3.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(58,0,'service-4','service-4',6,'image/png',32050,'pages/service-4.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(59,0,'service-5','service-5',6,'image/png',25146,'pages/service-5.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(60,0,'service-6','service-6',6,'image/png',31763,'pages/service-6.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(61,0,'slider-1','slider-1',6,'image/jpeg',12539,'pages/slider-1.jpg','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(62,0,'slider-2','slider-2',6,'image/jpeg',16564,'pages/slider-2.jpg','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(63,0,'slider-3','slider-3',6,'image/jpeg',16564,'pages/slider-3.jpg','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(64,0,'slider-4','slider-4',6,'image/jpeg',16564,'pages/slider-4.jpg','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(65,0,'slider-5','slider-5',6,'image/jpeg',16564,'pages/slider-5.jpg','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(66,0,'slider-6','slider-6',6,'image/png',16985,'pages/slider-6.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(67,0,'slider-left','slider-left',6,'image/jpeg',11483,'pages/slider-left.jpg','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(68,0,'testimonial-banner','testimonial-banner',6,'image/png',12776,'pages/testimonial-banner.png','[]','2026-04-27 00:42:23','2026-04-27 00:42:23',NULL,'public'),(69,0,'asana','asana',7,'image/png',7350,'partners/asana.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(70,0,'github','github',7,'image/png',7350,'partners/github.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(71,0,'lhtech','lhtech',7,'image/png',7350,'partners/lhtech.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(72,0,'panadoxn','panadoxn',7,'image/png',7350,'partners/panadoxn.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(73,0,'shangxi','shangxi',7,'image/png',7350,'partners/shangxi.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(74,0,'tyaalpha','tyaalpha',7,'image/png',7350,'partners/tyaalpha.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(75,0,'vanfaba','vanfaba',7,'image/png',7350,'partners/vanfaba.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(76,0,'banner-footer','banner-footer',8,'image/png',92460,'general/banner-footer.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(77,0,'favicon','favicon',8,'image/png',1899,'general/favicon.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(78,0,'logo-light','logo-light',8,'image/png',4519,'general/logo-light.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(79,0,'logo','logo',8,'image/png',5451,'general/logo.png','[]','2026-04-27 00:42:24','2026-04-27 00:42:24',NULL,'public'),(80,0,'newsletter-image','newsletter-image',8,'image/jpeg',100774,'general/newsletter-image.jpg','[]','2026-04-27 00:42:25','2026-04-27 00:42:25',NULL,'public'),(81,0,'placeholder','placeholder',8,'image/png',12344,'general/placeholder.png','[]','2026-04-27 00:42:25','2026-04-27 00:42:25',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folder_permissions`
--

DROP TABLE IF EXISTS `media_folder_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folder_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `permission` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'view',
  `granted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_folder_permissions_folder_id_user_id_unique` (`folder_id`,`user_id`),
  KEY `media_folder_permissions_folder_id_index` (`folder_id`),
  KEY `media_folder_permissions_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folder_permissions`
--

LOCK TABLES `media_folder_permissions` WRITE;
/*!40000 ALTER TABLE `media_folder_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_folder_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'locations',NULL,'locations',0,'2026-04-27 00:42:15','2026-04-27 00:42:15',NULL),(2,0,'users',NULL,'users',0,'2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(3,0,'avatars',NULL,'avatars',0,'2026-04-27 00:42:16','2026-04-27 00:42:16',NULL),(4,0,'properties',NULL,'properties',0,'2026-04-27 00:42:20','2026-04-27 00:42:20',NULL),(5,0,'posts',NULL,'posts',0,'2026-04-27 00:42:21','2026-04-27 00:42:21',NULL),(6,0,'pages',NULL,'pages',0,'2026-04-27 00:42:22','2026-04-27 00:42:22',NULL),(7,0,'partners',NULL,'partners',0,'2026-04-27 00:42:24','2026-04-27 00:42:24',NULL),(8,0,'general',NULL,'general',0,'2026-04-27 00:42:24','2026-04-27 00:42:24',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2026-04-27 00:42:24','2026-04-27 00:42:24');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,NULL,NULL,0,'Home',NULL,'_self',1,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(2,1,1,1,'Botble\\Page\\Models\\Page','/homepage-1',NULL,0,'Homepage 1',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2',NULL,1,'Homepage 2',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3',NULL,2,'Homepage 3',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4',NULL,3,'Homepage 4',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(6,1,1,5,'Botble\\Page\\Models\\Page','/homepage-5',NULL,4,'Homepage 5',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(7,1,0,NULL,NULL,'/projects',NULL,1,'Projects',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(8,1,0,NULL,NULL,'/properties',NULL,2,'Properties',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(9,1,0,NULL,NULL,'#',NULL,3,'Pages',NULL,'_self',1,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(10,1,9,NULL,NULL,'/agents',NULL,0,'Agents',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(11,1,9,NULL,NULL,'/careers',NULL,1,'Careers',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(12,1,9,NULL,NULL,'/wishlist',NULL,2,'Wishlist',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(13,1,9,10,'Botble\\Page\\Models\\Page','/about-us',NULL,3,'About Us',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(14,1,9,8,'Botble\\Page\\Models\\Page','/our-services',NULL,4,'Our Services',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(15,1,9,11,'Botble\\Page\\Models\\Page','/pricing-plans',NULL,5,'Pricing',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(16,1,9,7,'Botble\\Page\\Models\\Page','/contact-us',NULL,6,'Contact Us',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(17,1,9,9,'Botble\\Page\\Models\\Page','/faqs',NULL,7,'FAQs',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(18,1,9,12,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,8,'Privacy Policy',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(19,1,9,13,'Botble\\Page\\Models\\Page','/coming-soon',NULL,9,'Coming Soon',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(20,1,0,NULL,NULL,'#',NULL,4,'Blog',NULL,'_self',1,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(21,1,20,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog List',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24'),(22,1,20,NULL,NULL,'/news/the-benefits-of-smart-home-technology',NULL,1,'Blog Detail',NULL,'_self',0,'2026-04-27 00:42:24','2026-04-27 00:42:24');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2026-04-27 00:42:24','2026-04-27 00:42:24');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`),
  KEY `meta_boxes_ref_idx` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"ti ti-shopping-cart\"]',1,'Botble\\RealEstate\\Models\\Category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(2,'icon','[\"ti ti-map\"]',2,'Botble\\RealEstate\\Models\\Category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(3,'icon','[\"ti ti-home\"]',3,'Botble\\RealEstate\\Models\\Category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(4,'icon','[\"ti ti-mail\"]',4,'Botble\\RealEstate\\Models\\Category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(5,'icon','[\"ti ti-calendar\"]',5,'Botble\\RealEstate\\Models\\Category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(6,'icon','[\"ti ti-chart-bar\"]',6,'Botble\\RealEstate\\Models\\Category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(7,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',1,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:17','2026-04-27 00:42:17'),(8,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',2,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:17','2026-04-27 00:42:17'),(9,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',3,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:18','2026-04-27 00:42:18'),(10,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',4,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:18','2026-04-27 00:42:18'),(11,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',5,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:18','2026-04-27 00:42:18'),(12,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',6,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:18','2026-04-27 00:42:18'),(13,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',7,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:18','2026-04-27 00:42:18'),(14,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',8,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:19','2026-04-27 00:42:19'),(15,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',9,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:19','2026-04-27 00:42:19'),(16,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',10,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:19','2026-04-27 00:42:19'),(17,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',11,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:19','2026-04-27 00:42:19'),(18,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',12,'Botble\\RealEstate\\Models\\Account','2026-04-27 00:42:20','2026-04-27 00:42:20'),(19,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',1,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:20','2026-04-27 00:42:20'),(20,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',2,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:20','2026-04-27 00:42:20'),(21,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',3,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:20','2026-04-27 00:42:20'),(22,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',4,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:20','2026-04-27 00:42:20'),(23,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',5,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:20','2026-04-27 00:42:20'),(24,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',6,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(25,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',7,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(26,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',8,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(27,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',9,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(28,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',10,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(29,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',11,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(30,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',12,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(31,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',13,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(32,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',14,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(33,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',15,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(34,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',16,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(35,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',17,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(36,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',18,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(37,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',19,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(38,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',20,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(39,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',21,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(40,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',22,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(41,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',23,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(42,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',24,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(43,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',25,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(44,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',26,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(45,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',27,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(46,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',28,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(47,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',29,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(48,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',30,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(49,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',31,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(50,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',32,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(51,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',33,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(52,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',34,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(53,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',35,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(54,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',36,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(55,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',37,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(56,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',38,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(57,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',39,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(58,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',40,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(59,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',41,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(60,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',42,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(61,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',43,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(62,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',44,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(63,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',45,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(64,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',46,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(65,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',47,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(66,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',48,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(67,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',49,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(68,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',50,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(69,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',51,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(70,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',52,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(71,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',53,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(72,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',54,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(73,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',55,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(74,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',56,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(75,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',57,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(76,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',58,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(77,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',59,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(78,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',60,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(79,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',61,'Botble\\RealEstate\\Models\\Property','2026-04-27 00:42:21','2026-04-27 00:42:21'),(80,'breadcrumb','[\"no\"]',1,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(81,'breadcrumb','[\"no\"]',2,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(82,'breadcrumb','[\"no\"]',3,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(83,'breadcrumb','[\"no\"]',5,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(84,'breadcrumb','[\"yes\"]',6,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(85,'breadcrumb','[\"yes\"]',7,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(86,'breadcrumb','[\"yes\"]',8,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(87,'breadcrumb','[\"yes\"]',9,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(88,'breadcrumb','[\"yes\"]',10,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(89,'breadcrumb','[\"yes\"]',11,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(90,'breadcrumb','[\"yes\"]',12,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(91,'breadcrumb','[\"no\"]',13,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(92,'breadcrumb','[\"yes\"]',16,'Botble\\Page\\Models\\Page','2026-04-27 00:42:24','2026-04-27 00:42:24'),(93,'image','[\"general\\/job-details-thumb.png\"]',1,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(94,'icon','[\"icons\\/icon1.png\"]',1,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(95,'apply_url','[\"\\/contact\"]',1,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(96,'image','[\"general\\/job-details-thumb.png\"]',2,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(97,'icon','[\"icons\\/icon2.png\"]',2,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(98,'apply_url','[\"\\/contact\"]',2,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(99,'image','[\"general\\/job-details-thumb.png\"]',3,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(100,'icon','[\"icons\\/icon3.png\"]',3,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(101,'apply_url','[\"\\/contact\"]',3,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(102,'image','[\"general\\/job-details-thumb.png\"]',4,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(103,'icon','[\"icons\\/icon4.png\"]',4,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(104,'apply_url','[\"\\/contact\"]',4,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(105,'image','[\"general\\/job-details-thumb.png\"]',5,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(106,'icon','[\"icons\\/icon5.png\"]',5,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(107,'apply_url','[\"\\/contact\"]',5,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(108,'image','[\"general\\/job-details-thumb.png\"]',6,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(109,'icon','[\"icons\\/icon6.png\"]',6,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25'),(110,'apply_url','[\"\\/contact\"]',6,'ArchiElite\\Career\\Models\\Career','2026-04-27 00:42:25','2026-04-27 00:42:25');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_07_03_162029_remove_plugin_team',1),(36,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(37,'2024_07_12_100000_change_random_hash_for_media',1),(38,'2024_09_30_024515_create_sessions_table',1),(39,'2024_12_01_000000_add_indexes_to_pages_translations_table',1),(40,'2024_12_01_000000_add_key_prefix_index_to_slugs_table',1),(41,'2024_12_19_000001_create_device_tokens_table',1),(42,'2024_12_19_000002_create_push_notifications_table',1),(43,'2024_12_19_000003_create_push_notification_recipients_table',1),(44,'2024_12_30_000001_create_user_settings_table',1),(45,'2025_07_06_030754_add_phone_to_users_table',1),(46,'2025_07_31_add_performance_indexes_to_slugs_table',1),(47,'2025_11_10_000000_cleanup_duplicate_widgets',1),(48,'2026_03_07_153100_add_index_to_meta_boxes_table',1),(49,'2026_03_23_000000_create_media_folder_permissions_table',1),(50,'2026_03_27_085220_add_folder_deleted_name_index_to_media_files_table',1),(51,'2026_04_20_000000_add_sessions_invalidated_at_to_users_table',1),(52,'2020_11_18_150916_ads_create_ads_table',2),(53,'2021_12_02_035301_add_ads_translations_table',2),(54,'2023_04_17_062645_add_open_in_new_tab',2),(55,'2023_11_07_023805_add_tablet_mobile_image',2),(56,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',2),(57,'2025_04_21_000000_add_tablet_mobile_image_to_ads_translations_table',2),(58,'2024_04_27_100730_improve_analytics_setting',3),(59,'2023_08_11_060908_create_announcements_table',4),(60,'2025_02_11_153025_add_action_label_to_announcement_translations',4),(61,'2015_06_29_025744_create_audit_history',5),(62,'2023_11_14_033417_change_request_column_in_table_audit_histories',5),(63,'2025_05_05_000001_add_user_type_to_audit_histories_table',5),(64,'2025_11_07_000001_add_actor_type_to_audit_histories_table',5),(65,'2015_06_18_033822_create_blog_table',6),(66,'2021_02_16_092633_remove_default_value_for_author_type',6),(67,'2021_12_03_030600_create_blog_translations',6),(68,'2022_04_19_113923_add_index_to_table_posts',6),(69,'2023_08_29_074620_make_column_author_id_nullable',6),(70,'2024_07_30_091615_fix_order_column_in_categories_table',6),(71,'2024_12_01_000000_add_indexes_to_blog_translations_tables',6),(72,'2025_01_06_033807_add_default_value_for_categories_author_type',6),(73,'2019_06_24_211801_create_career_table',7),(74,'2021_12_04_095357_create_careers_translations_table',7),(75,'2023_09_20_050420_add_missing_translation_column',7),(76,'2016_06_17_091537_create_contacts_table',8),(77,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',8),(78,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',8),(79,'2024_03_25_000001_update_captcha_settings_for_contact',8),(80,'2024_04_19_063914_create_custom_fields_table',8),(81,'2024_12_01_000000_add_indexes_to_contact_translations_tables',8),(82,'2018_07_09_221238_create_faq_table',9),(83,'2021_12_03_082134_create_faq_translations',9),(84,'2023_11_17_063408_add_description_column_to_faq_categories_table',9),(85,'2016_10_03_032336_create_languages_table',10),(86,'2023_09_14_022423_add_index_for_language_table',10),(87,'2021_10_25_021023_fix-priority-load-for-language-advanced',11),(88,'2021_12_03_075608_create_page_translations',11),(89,'2023_07_06_011444_create_slug_translations_table',11),(90,'2024_12_01_000000_add_indexes_to_slugs_translations_table',11),(91,'2019_11_18_061011_create_country_table',12),(92,'2021_12_03_084118_create_location_translations',12),(93,'2021_12_03_094518_migrate_old_location_data',12),(94,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',12),(95,'2022_01_16_085908_improve_plugin_location',12),(96,'2022_08_04_052122_delete_location_backup_tables',12),(97,'2023_04_23_061847_increase_state_translations_abbreviation_column',12),(98,'2023_07_26_041451_add_more_columns_to_location_table',12),(99,'2023_07_27_041451_add_more_columns_to_location_translation_table',12),(100,'2023_08_15_073307_drop_unique_in_states_cities_translations',12),(101,'2023_10_21_065016_make_state_id_in_table_cities_nullable',12),(102,'2024_08_17_094600_add_image_into_countries',12),(103,'2025_01_08_093652_add_zip_code_to_cities',12),(104,'2025_07_31_083459_add_indexes_for_location_search_performance',12),(105,'2017_10_24_154832_create_newsletter_table',13),(106,'2024_03_25_000001_update_captcha_settings_for_newsletter',13),(107,'2017_05_18_080441_create_payment_tables',14),(108,'2021_03_27_144913_add_customer_type_into_table_payments',14),(109,'2021_05_24_034720_make_column_currency_nullable',14),(110,'2021_08_09_161302_add_metadata_column_to_payments_table',14),(111,'2021_10_19_020859_update_metadata_field',14),(112,'2022_06_28_151901_activate_paypal_stripe_plugin',14),(113,'2022_07_07_153354_update_charge_id_in_table_payments',14),(114,'2024_07_04_083133_create_payment_logs_table',14),(115,'2025_04_12_000003_add_payment_fee_to_payments_table',14),(116,'2025_05_22_000001_add_payment_fee_type_to_settings_table',14),(117,'2018_06_22_032304_create_real_estate_table',15),(118,'2021_02_11_031126_update_price_column_in_projects_and_properties',15),(119,'2021_03_08_024049_add_lat_long_into_real_estate_tables',15),(120,'2021_06_10_091950_add_column_is_featured_to_table_re_accounts',15),(121,'2021_07_07_021757_update_table_account_activity_logs',15),(122,'2021_09_29_042758_create_re_categories_multilevel_table',15),(123,'2021_10_31_031254_add_company_to_accounts_table',15),(124,'2021_12_10_034807_create_real_estate_translation_tables',15),(125,'2021_12_18_081636_add_property_project_views_count',15),(126,'2022_05_04_033044_update_column_images_in_real_estate_tables',15),(127,'2022_07_02_081723_fix_expired_date_column',15),(128,'2022_08_01_090213_update_table_properties_and_projects',15),(129,'2023_01_31_023233_create_re_custom_fields_table',15),(130,'2023_02_06_000000_add_location_to_re_accounts_table',15),(131,'2023_02_06_024257_add_package_translations',15),(132,'2023_02_08_062457_add_custom_fields_translation_table',15),(133,'2023_02_15_024644_create_re_reviews_table',15),(134,'2023_02_20_072604_create_re_invoices_table',15),(135,'2023_02_20_081251_create_re_account_packages_table',15),(136,'2023_04_04_030709_add_unique_id_to_properties_and_projects_table',15),(137,'2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable',15),(138,'2023_05_09_062031_unique_reviews_table',15),(139,'2023_05_26_034353_fix_properties_projects_image',15),(140,'2023_05_27_004215_add_column_ip_into_table_re_consults',15),(141,'2023_07_25_034513_create_re_coupons_table',15),(142,'2023_07_25_034672_add_coupon_code_column_to_jb_invoices_table',15),(143,'2023_08_02_074208_change_square_column_to_float',15),(144,'2023_08_07_000001_add_is_public_profile_column_to_re_accounts_table',15),(145,'2023_08_09_004607_make_column_project_id_nullable',15),(146,'2023_09_11_084630_update_mandatory_fields_in_consult_form_table',15),(147,'2023_11_21_071820_add_missing_slug_for_agents',15),(148,'2024_01_11_084816_add_investor_translations_table',15),(149,'2024_01_31_022842_add_description_to_re_packages_table',15),(150,'2024_03_13_000001_drop_type_column_from_custom_field_translations_table',15),(151,'2024_04_23_124505_add_features_column_to_re_packages',15),(152,'2024_04_23_135106_add_columns_to_re_investors',15),(153,'2024_05_25_000001_update_captcha_settings_for_real_estate',15),(154,'2024_06_16_163428_make_investor_id_nullable',15),(155,'2024_06_20_103539_create_consult_custom_fields_table',15),(156,'2024_07_08_235824_fix_facilities_primary_key',15),(157,'2024_07_26_090340_add_private_notes_column_to_re_properties_projects_table',15),(158,'2024_08_09_075542_add_accounts_translations',15),(159,'2024_08_12_124528_add_approved_at_column_to_re_accounts_table',15),(160,'2024_08_31_074158_add_floor_plans_columns_to_re_properties_table',15),(161,'2024_09_04_130921_add_reject_reason_column_to_re_properties_table',15),(162,'2024_09_19_021436_make_email_in_accounts_table_nullable',15),(163,'2024_11_18_023706_add_floor_plan_to_table_re_properties_translations',15),(164,'2024_12_01_000000_add_floor_plans_column_to_re_projects_table',15),(165,'2024_12_01_000000_add_indexes_to_real_estate_translations_tables',15),(166,'2024_12_18_000000_add_blocked_at_column_to_re_accounts_table',15),(167,'2024_12_18_000001_add_blocked_reason_column_to_re_accounts_table',15),(168,'2025_04_12_161730_add_featured_priority_to_re_properties_table',15),(169,'2025_04_12_165120_add_featured_priority_to_re_projects_table',15),(170,'2025_04_23_034738_make_featured_priority_nullable',15),(171,'2025_05_19_000001_add_zip_code_to_properties_and_projects_tables',15),(172,'2025_07_31_083138_add_indexes_for_real_estate_location_search',15),(173,'2025_08_12_085710_add_verification_fields_to_re_accounts_table',15),(174,'2025_08_14_025316_change_column_description_in_re_accounts_translations_to_text',15),(175,'2025_09_30_103625_add_performance_indexes_to_re_properties_table',15),(176,'2025_09_30_103746_add_status_index_to_re_reviews_table',15),(177,'2025_09_30_103813_add_composite_query_index_to_re_properties_table',15),(178,'2025_09_30_104436_add_performance_indexes_to_re_categories_table',15),(179,'2025_10_10_093314_add_number_format_style_and_space_to_re_currencies_table',15),(180,'2025_10_22_000001_add_whatsapp_to_re_accounts_table',15),(181,'2025_11_24_142748_add_privacy_settings_to_re_accounts_table',15),(182,'2026_01_22_105507_change_re_categories_description_to_text',15),(183,'2026_01_22_105908_add_content_column_to_re_categories_table',15),(184,'2026_03_01_000001_change_bedroom_bathroom_to_decimal',15),(185,'2025_04_08_040931_create_social_logins_table',16),(186,'2018_07_09_214610_create_testimonial_table',17),(187,'2021_12_03_083642_create_testimonials_translations',17),(188,'2024_12_01_000000_add_indexes_to_testimonials_translations_table',17),(189,'2016_10_07_193005_create_translations_table',18),(190,'2023_12_12_105220_drop_translations_table',18);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage 1','[hero-banner style=\"1\" title=\"Find Your\" animation_text=\"Dream Home,Perfect Home,Real Estate\" description=\"We are a real estate agency that will help you find the best residence you dream of, let’s discuss for your dream house?\" background_image=\"pages/slider-1.jpg\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[properties style=\"2\" title=\"Recommended For You\" subtitle=\"Features Properties\" category_ids=\"1,2,3,4,5,6\" type=\"rent\" is_featured=\"\" limit=\"6\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[location title=\"Our Location For You\" subtitle=\"Explore Cities\" type=\"city\" city_ids=\"1,2,3,4,5,6,7\" destination=\"property\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/location]\n[services style=\"1\" title=\"What We Do?\" subtitle=\"Our Services\" background_color=\"transparent\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"4\" counters_label_1=\"SATISFIED CLIENTS\" counters_number_1=\"85\" counters_label_2=\"AWARDS RECEIVED\" counters_number_2=\"112\" counters_label_3=\"SUCCESSFUL TRANSACTIONS\" counters_number_3=\"32\" counters_label_4=\"MONTHLY TRAFFIC\" counters_number_4=\"66\" button_label=\"View All Services\" button_url=\"/\" enable_lazy_loading=\"yes\"][/services]\n[services style=\"1\" title=\"Why Choose Homzen\" subtitle=\"Our Benefit\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Proven Expertise\" services_description_1=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Customized Solutions\" services_description_2=\"We pride ourselves on crafting personalized strategies to match your unique goals, ensuring a seamless real estate journey.\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Transparent Partnerships\" services_description_3=\"Transparency is key in our client relationships. We prioritize clear communication and ethical practices, fostering trust and reliability throughout.\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" centered_content=\"1\" enable_lazy_loading=\"yes\"][/services]\n[properties style=\"1\" title=\"Best Property Value\" subtitle=\"Top Properties\" is_featured=\"1\" limit=\"4\" button_label=\"View All\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[testimonials style=\"1\" title=\"What’s People Say’s\" subtitle=\"Top Properties\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/agents]\n[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"xl\" form_alignment=\"center\" form_margin=\"50px 0\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]\n[blog-posts style=\"1\" title=\"Helpful Homzen Guides\" subtitle=\"Latest News\" type=\"recent\" limit=\"3\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/blog-posts]\n[image-slider background_color=\"transparent\" quantity=\"7\" name_1=\"GitHub\" image_1=\"partners/github.png\" url_1=\"https://github.com\" open_in_new_tab_1=\"\" name_2=\"LH.Tech\" image_2=\"partners/lhtech.png\" url_2=\"https://lhtech.com.my\" open_in_new_tab_2=\"\" name_3=\"Panadoxn\" image_3=\"partners/panadoxn.png\" url_3=\"/\" open_in_new_tab_3=\"\" name_4=\"Shangxi\" image_4=\"partners/shangxi.png\" url_4=\"/\" open_in_new_tab_4=\"\" name_5=\"Tyaalpha\" image_5=\"partners/tyaalpha.png\" url_5=\"/\" open_in_new_tab_5=\"\" name_6=\"Vanfaba\" image_6=\"partners/vanfaba.png\" url_6=\"/\" open_in_new_tab_6=\"\" name_7=\"Asana\" image_7=\"partners/asana.png\" url_7=\"https://asana.com\" open_in_new_tab_7=\"\" enable_lazy_loading=\"yes\"][/image-slider]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(2,'Homepage 2','[hero-banner style=\"2\" title=\"Find A Home That\" animation_text=\"Perfectly,Dream Home\" description=\"We are a real estate agency that will help you find the best residence you dream of.\" background_image=\"pages/slider-left.jpg\" slider_image_1=\"pages/slider-2.jpg\" slider_image_2=\"pages/slider-3.jpg\" slider_image_3=\"pages/slider-4.jpg\" slider_image_4=\"pages/slider-5.jpg\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[property-categories style=\"1\" title=\"Try Searching For\" subtitle=\"PROPERTY TYPE\" category_ids=\"1,2,3,4,5,6\" background_color=\"transparent\" button_label=\"View All\" button_url=\"/categories\" enable_lazy_loading=\"yes\"][/property-categories]\n[properties style=\"4\" title=\"Discover Homzen\'s Finest Properties For Your Dream Home\" subtitle=\"Featured Properties\" limit=\"8\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[services style=\"3\" title=\"Discover What Sets Our Real Estate Expertise Apart\" subtitle=\"Why Choose Us\" description=\"At Homzen, our unwavering commitment lies in crafting unparalleled real estate journeys. Our seasoned professionals, armed with extensive market knowledge, walk alongside you through every phase of your property endeavor. We prioritize understanding your unique aspirations, tailoring our expertise to match your vision.\" checklist=\"Transparent Partnerships,Proven Expertise,Customized Solutions,Local Area Knowledge\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" button_label=\"Contact Us\" button_url=\"/contact-us\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[location style=\"2\" title=\"Our Location For You\" subtitle=\"Explore States\" type=\"state\" state_ids=\"1,2,3,4,5,6\" destination=\"property\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/location]\n[properties style=\"3\" title=\"Best Property Value\" subtitle=\"Top Properties\" is_featured=\"1\" limit=\"4\" button_label=\"View All\" button_url=\"/properties\" enable_lazy_loading=\"yes\" background_color=\"#f7f7f7\"][/properties]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/agents]\n[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"xl\" form_alignment=\"center\" form_margin=\"50px 0\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]\n[testimonials style=\"3\" title=\"What\'s People Say\'s\" subtitle=\"Our Testimonials\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/testimonials]\n[blog-posts style=\"1\" title=\"Helpful Homzen Guides\" subtitle=\"Latest News\" type=\"recent\" limit=\"3\" enable_lazy_loading=\"yes\"][/blog-posts]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(3,'Homepage 3','[hero-banner style=\"3\" title=\"Indulge in Your\" animation_text=\"Sanctuary,Safe House\" description=\"Discover your private oasis at Homzen, where every corner, from the spacious garden to the relaxing pool, is crafted for your comfort and enjoyment.\" background_image=\"pages/slider-6.png\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\" button_label=\"Contact Us\" button_url=\"/contact\"][/hero-banner]\n[location style=\"3\" title=\"Properties By Cities\" subtitle=\"EXPLORE CITIES\" type=\"city\" city_ids=\"1,2,3,4,5,6,7,21,24\" destination=\"property\" background_color=\"#f7f7f7\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/location]\n[properties style=\"2\" title=\"Recommended For You\" subtitle=\"Features Properties\" category_ids=\"1,2,3,4,5,6\" type=\"rent\" is_featured=\"\" limit=\"6\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[property-categories style=\"2\" title=\"Try Searching For\" subtitle=\"PROPERTY TYPE\" category_ids=\"1,2,3,4,5,6\" background_color=\"#161e2d\" enable_lazy_loading=\"yes\"][/property-categories]\n[services style=\"2\" title=\"What We Do?\" subtitle=\"Our Services\" background_color=\"transparent\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" enable_lazy_loading=\"yes\"][/services]\n[testimonials style=\"4\" title=\"What’s People Say’s\" subtitle=\"Our Testimonials\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" background_image=\"pages/testimonial-banner.png\" enable_lazy_loading=\"yes\"][/testimonials]\n[agents style=\"2\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/agents]\n[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"xl\" form_alignment=\"center\" form_margin=\"50px 0\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]\n[blog-posts style=\"2\" title=\"Helpful Homzen Guides\" subtitle=\"Latest News\" type=\"recent\" limit=\"4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/blog-posts]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(4,'Homepage 4','[hero-banner style=\"4\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[properties style=\"5\" title=\"Discover Homzen\'s Finest Properties For Your Dream Home\" subtitle=\"FEATURED PROPERTIES\" is_featured=\"1\" limit=\"6\" button_label=\"View All Properties\" button_url=\"/properties\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[services style=\"4\" title=\"Discover What Sets Our\" subtitle=\"WHAT WE DO\" description=\"At Homzen, our unwavering commitment lies in crafting unparalleled real estate journeys.\" background_color=\"transparent\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Explore diverse properties and expert guidance for a seamless buying experience.\" services_icon_1=\"ti ti-12-hours\" services_icon_image_1=\"pages/service-1.png\" services_button_label_1=\"Learn More\" services_button_url_1=\"/contact\" services_title_2=\"Rent A Home\" services_description_2=\"Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_icon_image_2=\"pages/service-2.png\" services_button_label_2=\"Learn More\" services_button_url_2=\"/contact\" services_title_3=\"Buy A New Home\" services_description_3=\"Showcasing your property\'s best features for a successful sale.\" services_icon_image_3=\"pages/service-3.png\" services_button_label_3=\"Learn More\" services_button_url_3=\"/contact\" counters_quantity=\"1\" background_image=\"pages/house-service.png\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[location title=\"Our Location For You\" subtitle=\"Explore Cities\" type=\"city\" city_ids=\"1,2,3,4,5,6\" destination=\"property\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/location]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"OUR TEAMS\" account_ids=\"1,2,3\" background_color=\"transparent\" items_per_row=\"3\" enable_lazy_loading=\"yes\"][/agents]\n[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"xl\" form_alignment=\"center\" form_margin=\"50px 0\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]\n[properties style=\"6\" title=\"Recommended for you\" subtitle=\"TOP PROPERTIES\" is_featured=\"1\" limit=\"4\" background_image=\"pages/properties.png\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[testimonials style=\"2\" title=\"What\'s People Say\'s\" subtitle=\"OUR TESTIMONIALS\" testimonial_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/testimonials]\n[services style=\"5\" title=\"Why Choose Homzen\" subtitle=\"OUR BENIFIT\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" background_color=\"transparent\" services_quantity=\"8\" services_title_1=\"Buy A New Home\" services_description_1=\"Explore diverse properties and expert guidance for a seamless buying experience.\" services_icon_1=\"ti ti-home\" services_title_2=\"Sell Your Property\" services_description_2=\"Get the best value with our professional selling strategies and market insights.\" services_icon_2=\"ti ti-currency-dollar\" services_title_3=\"Rent A Property\" services_description_3=\"Find the perfect rental property with our extensive listings and support.\" services_icon_3=\"ti ti-building\" services_title_4=\"Property Management\" services_description_4=\"Professional management services to keep your property in top condition.\" services_icon_4=\"ti ti-settings\" services_title_5=\"Real Estate Consulting\" services_description_5=\"Expert advice and insights to help you make informed real estate decisions.\" services_icon_5=\"ti ti-chart-bar\" services_title_6=\"Mortgage Services\" services_description_6=\"Find the best mortgage rates and options with our comprehensive services.\" services_icon_6=\"ti ti-credit-card\" services_title_7=\"Investment Properties\" services_description_7=\"Discover lucrative investment opportunities and maximize your returns.\" services_icon_7=\"ti ti-briefcase\" services_title_8=\"Relocation Services\" services_description_8=\"Smooth and hassle-free relocation services to help you move with ease.\" services_icon_8=\"ti ti-truck\" counters_quantity=\"1\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[blog-posts style=\"1\" title=\"Helpful Homzen Guides\" subtitle=\"LATEST NEWS\" type=\"recent\" limit=\"3\" enable_lazy_loading=\"yes\"][/blog-posts]\n[call-to-action title=\"List Your Properties On Homzen, Join Us Now!\" subtitle=\"BECOME PARTNERS\" button_label=\"Become A Hosting\" button_url=\"/contact\" image=\"pages/call-to-action.png\" enable_lazy_loading=\"yes\"][/call-to-action]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(5,'Homepage 5','[hero-banner style=\"5\" property_id=\"4\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[services style=\"2\" title=\"Why Choose Homzen\" subtitle=\"Our Benefit\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" centered_content=\"1\" enable_lazy_loading=\"yes\"][/services]\n[properties style=\"4\" title=\"Discover Homzen\'s Finest Properties For Your Dream Home\" subtitle=\"FEATURED PROPERTIES\" is_featured=\"1\" limit=\"8\" button_label=\"View All Properties\" button_url=\"/properties\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[location style=\"4\" title=\"Our Location For You\" subtitle=\"EXPLORE CITIES\" type=\"city\" city_ids=\"1,3,5,6,11,23\" destination=\"property\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/location]\n[properties style=\"7\" title=\"Recommended For You\" subtitle=\"TOP PROPERTIES\" is_featured=\"1\" limit=\"4\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[services style=\"5\" title=\"Why Choose Homzen\" subtitle=\"OUR BENIFIT\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" background_color=\"transparent\" services_quantity=\"8\" services_title_1=\"Buy A New Home\" services_description_1=\"Explore diverse properties and expert guidance for a seamless buying experience.\" services_icon_1=\"ti ti-home\" services_title_2=\"Sell Your Property\" services_description_2=\"Get the best value with our professional selling strategies and market insights.\" services_icon_2=\"ti ti-currency-dollar\" services_title_3=\"Rent A Property\" services_description_3=\"Find the perfect rental property with our extensive listings and support.\" services_icon_3=\"ti ti-building\" services_title_4=\"Property Management\" services_description_4=\"Professional management services to keep your property in top condition.\" services_icon_4=\"ti ti-settings\" services_title_5=\"Real Estate Consulting\" services_description_5=\"Expert advice and insights to help you make informed real estate decisions.\" services_icon_5=\"ti ti-chart-bar\" services_title_6=\"Mortgage Services\" services_description_6=\"Find the best mortgage rates and options with our comprehensive services.\" services_icon_6=\"ti ti-credit-card\" services_title_7=\"Investment Properties\" services_description_7=\"Discover lucrative investment opportunities and maximize your returns.\" services_icon_7=\"ti ti-briefcase\" services_title_8=\"Relocation Services\" services_description_8=\"Smooth and hassle-free relocation services to help you move with ease.\" services_icon_8=\"ti ti-truck\" counters_quantity=\"1\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[agents style=\"2\" title=\"Meet Our Agents\" subtitle=\"OUR TEAMS\" account_ids=\"1,2,3,4\" background_color=\"transparent\" items_per_row=\"2\" enable_lazy_loading=\"yes\"][/agents]\n[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"xl\" form_alignment=\"center\" form_margin=\"50px 0\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]\n[testimonials style=\"1\" title=\"What\'s People Say\'s\" subtitle=\"TOP PROPERTIES\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[blog-posts style=\"2\" title=\"The Most Recent Estate\" subtitle=\"LATEST NEWS\" type=\"recent\" limit=\"4\" enable_lazy_loading=\"yes\"][/blog-posts]\n[mortgage-calculator style=\"default\" layout=\"horizontal\" form_style=\"modern\" form_size=\"lg\" form_alignment=\"center\" form_title=\"Mortgage Calculator\" form_description=\"Calculate your monthly mortgage payments\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/mortgage-calculator]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(6,'Blog',NULL,1,NULL,NULL,NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(7,'Contact Us','[contact-form display_fields=\"phone,email,subject,address\" mandatory_fields=\"email\" style=\"1\" title=\"Drop Us A Line\" description=\"Feel free to connect with us through our online channels for updates, news, and more.\" show_information_box=\"1\" contact_title=\"Contact Us\" quantity=\"3\" label_1=\"Address:\" content_1=\"101 E 129th St, East Chicago, IN 46312 United States\" label_2=\"Information:\" content_2=\"1-333-345-6868 hi.themesflat@gmail.com\" label_3=\"Open time:\" content_3=\"Monday - Friday: 08:00 - 20:00 Saturday - Sunday: 10:00 - 18:00\" show_social_links=\"1\"][/contact-form]\n[google-map]101 E 129th St, East Chicago, IN 46312 United States[/google-map]',1,NULL,NULL,NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(8,'Our Services','[services style=\"2\" title=\"Why Choose Homzen\" subtitle=\"Our Benefit\" background_color=\"#ffffff\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" centered_content=\"1\" enable_lazy_loading=\"yes\"][/services]\n[testimonials style=\"1\" title=\"What’s People Say’s\" subtitle=\"Top Properties\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[faqs title=\"Quick Answers To Questions\" subtitle=\"FAQs\" category_ids=\"1,2,3,4\" display_type=\"list\" limit=\"5\" expand_first_time=\"1\" enable_lazy_loading=\"yes\"][/faqs]\n[call-to-action title=\"List your Properties on Homzen, join Us Now!\" subtitle=\"Become Partners\" button_label=\"Become A Hosting\" button_url=\"/\" image=\"pages/call-to-action.png\" enable_lazy_loading=\"yes\"][/call-to-action]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(9,'FAQs','[faqs category_ids=\"1,2,3\" display_type=\"group\" expand_first_time=\"1\" enable_lazy_loading=\"yes\"][/faqs]',1,NULL,NULL,NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(10,'About Us','[about-us title=\"Welcome To The &lt;br&gt; Homzen\" description=\"Welcome to Homzen, where we turn houses into homes and dreams into reality. At Homzen, we understand that a home is more than just a physical space; it\'s a place where memories are created, families grow, and life unfolds.\" button_label=\"Learn More\" button_url=\"/\" image=\"pages/about-us-video.jpg\" video_url=\"https://youtu.be/tRxGSHL8bI0\"][/about-us]\n[services style=\"3\" title=\"Discover What Sets Our Real Estate Expertise Apart\" subtitle=\"Why Choose Us\" description=\"At Homzen, our unwavering commitment lies in crafting unparalleled real estate journeys. Our seasoned professionals, armed with extensive market knowledge, walk alongside you through every phase of your property endeavor. We prioritize understanding your unique aspirations, tailoring our expertise to match your vision.\" checklist=\"Transparent Partnerships,Proven Expertise,Customized Solutions,Local Area Knowledge\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" button_label=\"Contact Us\" button_url=\"/contact-us\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[testimonials style=\"2\" title=\"What’s People Say’s\" subtitle=\"Top Properties\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[image-slider background_color=\"transparent\" quantity=\"7\" name_1=\"GitHub\" image_1=\"partners/github.png\" url_1=\"https://github.com\" open_in_new_tab_1=\"\" name_2=\"LH.Tech\" image_2=\"partners/lhtech.png\" url_2=\"https://lhtech.com.my\" open_in_new_tab_2=\"\" name_3=\"Panadoxn\" image_3=\"partners/panadoxn.png\" url_3=\"/\" open_in_new_tab_3=\"\" name_4=\"Shangxi\" image_4=\"partners/shangxi.png\" url_4=\"/\" open_in_new_tab_4=\"\" name_5=\"Tyaalpha\" image_5=\"partners/tyaalpha.png\" url_5=\"/\" open_in_new_tab_5=\"\" name_6=\"Vanfaba\" image_6=\"partners/vanfaba.png\" url_6=\"/\" open_in_new_tab_6=\"\" name_7=\"Asana\" image_7=\"partners/asana.png\" url_7=\"https://asana.com\" open_in_new_tab_7=\"\" enable_lazy_loading=\"yes\"][/image-slider]\n[contact-form display_fields=\"phone,email,subject,address\" mandatory_fields=\"email\" style=\"2\" title=\"We\'re Always Eager To Hear From You!\" subtitle=\"Contact Us\" description=\"Sed ullamcorper nulla egestas at. Aenean eget tortor nec elit sagittis molestie. Pellentesque tempus massa in.r nulla egestas at. Aenean eget tortor nec elit sagittis mole\" background_image=\"pages/about-us-contact.jpg\"][/contact-form]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" items_per_row=\"4\" enable_lazy_loading=\"yes\"][/agents]\n[call-to-action title=\"List your Properties on Homzen, join Us Now!\" subtitle=\"Become Partners\" button_label=\"Become A Hosting\" button_url=\"/\" image=\"pages/call-to-action.png\" enable_lazy_loading=\"yes\"][/call-to-action]',1,NULL,'full-width',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(11,'Pricing Plans','[pricing-plan title=\"Our Subscription\" subtitle=\"Pricing\" package_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/pricing-plan]\n[faqs title=\"Quick Answers To Questions\" subtitle=\"FAQs\" category_ids=\"1\" display_type=\"list\" limit=\"5\" expand_first_time=\"1\" enable_lazy_loading=\"yes\"][/faqs]',1,NULL,NULL,NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(12,'Privacy Policy','[content-tab title=\"Terms Of Use\" quantity=\"5\" title_1=\"Terms\" content_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed euismod justo, sit amet efficitur dui. Aliquam sodales vestibulum velit, eget sollicitudin quam. Donec non aliquam eros. Etiam sit amet lectus vel justo dignissim condimentum. In malesuada neque quis libero laoreet posuere. In consequat vitae ligula quis rutrum. Morbi dolor orci, maximus a pulvinar sed, bibendum ac lacus. Suspendisse in consectetur lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" title_2=\"Limitations\" content_2=\"Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" title_3=\"Revisions and errata\" content_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed euismod justo, sit amet efficitur dui. Aliquam sodales vestibulum velit, eget sollicitudin quam. Donec non aliquam eros. Etiam sit amet lectus vel justo dignissim condimentum. In malesuada neque quis libero laoreet posuere. In consequat vitae ligula quis rutrum. Morbi dolor orci, maximus a pulvinar sed, bibendum ac lacus. Suspendisse in consectetur lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex.\" title_4=\"Site terms of use modifications\" content_4=\"Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" title_5=\"Risks\" content_5=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed euismod justo, sit amet efficitur dui. Aliquam sodales vestibulum velit, eget sollicitudin quam. Donec non aliquam eros. Etiam sit amet lectus vel justo dignissim condimentum. In malesuada neque quis libero laoreet posuere. In consequat vitae ligula quis rutrum. Morbi dolor orci, maximus a pulvinar sed, bibendum ac lacus. Suspendisse in consectetur lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" enable_lazy_loading=\"yes\"][/content-tab]',1,NULL,NULL,NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(13,'Coming Soon','[coming-soon title=\"Get Notified When We Launch\" countdown_time=\"2026-05-27 07:42:24\" address=\"58 Street Commercial Road Fratton, Australia\" hotline=\"+123456789\" business_hours=\"Mon – Sat: 8 am – 5 pm, Sunday: CLOSED\" show_social_links=\"1\" image=\"pages/properties.png\"][/coming-soon]',1,NULL,'no-layout',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(14,'Properties','',1,NULL,'no-layout',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(15,'Projects','',1,NULL,'no-layout',NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24'),(16,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,NULL,NULL,'published','2026-04-27 00:42:24','2026-04-27 00:42:24');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (2,1),(6,1),(6,2),(5,2),(1,3),(6,3),(4,4),(5,5),(2,5),(6,6),(5,6),(6,7),(1,7),(1,8),(3,8),(1,9),(6,9),(3,10),(1,10),(6,11),(5,11),(5,12),(3,12),(5,13),(1,13),(6,14),(1,14),(4,15),(2,15),(4,16),(5,17),(3,17),(3,18),(6,18);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (7,1),(2,1),(8,1),(6,2),(5,2),(4,2),(1,3),(4,3),(3,4),(2,4),(7,4),(7,5),(8,5),(4,6),(5,6),(7,7),(2,7),(6,7),(7,8),(4,8),(2,9),(7,9),(1,10),(2,10),(6,10),(6,11),(1,11),(4,11),(4,12),(5,12),(7,12),(6,13),(1,13),(7,14),(6,14),(3,15),(6,15),(4,15),(2,16),(6,16),(8,17),(7,17),(6,18),(3,18),(5,18);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Top 10 Tips for First-time Home Buyers','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/10.jpg',1310,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(2,'How to Stage Your Home for a Quick Sale','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/6.jpg',326,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(3,'Understanding the Current Real Estate Market Trends','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/10.jpg',2241,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(4,'DIY Home Improvement Projects That Add Value','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/2.jpg',696,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(5,'A Beginner’s Guide to Real Estate Investing','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/6.jpg',2126,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(6,'How to Choose the Right Neighborhood for Your Family','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/10.jpg',846,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(7,'Luxury Homes: What to Look For','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/5.jpg',1113,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(8,'Property Management: Best Practices for Landlords','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/1.jpg',1431,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(9,'Renovation Ideas to Increase Your Home’s Value','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/10.jpg',2415,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(10,'The Ultimate Guide to Buying a Vacation Home','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/7.jpg',2466,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(11,'How to Successfully Sell Your Home in a Buyer’s Market','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/3.jpg',1701,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(12,'Home Inspection: What to Expect and How to Prepare','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/4.jpg',2111,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(13,'Eco-friendly Home Improvements for Sustainable Living','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/4.jpg',2428,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(14,'How to Navigate the Mortgage Process','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/7.jpg',1317,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(15,'Real Estate Market Analysis: What You Need to Know','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/10.jpg',1381,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(16,'Tips for Renting Out Your Property','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/7.jpg',1509,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(17,'Understanding Property Taxes and How to Lower Them','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/3.jpg',261,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22'),(18,'The Benefits of Smart Home Technology','Discover the latest insights, trends, and expert analysis in this comprehensive article that covers key aspects of the topic.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/5.jpg',722,NULL,'2026-04-27 00:42:22','2026-04-27 00:42:22');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`),
  KEY `idx_posts_trans_posts_id` (`posts_id`),
  KEY `idx_posts_trans_post_lang` (`posts_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_activity_logs`
--

DROP TABLE IF EXISTS `re_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_activity_logs`
--

LOCK TABLES `re_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `re_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_packages`
--

DROP TABLE IF EXISTS `re_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_packages`
--

LOCK TABLES `re_account_packages` WRITE;
/*!40000 ALTER TABLE `re_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_password_resets`
--

DROP TABLE IF EXISTS `re_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `re_account_password_resets_email_index` (`email`),
  KEY `re_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_password_resets`
--

LOCK TABLES `re_account_password_resets` WRITE;
/*!40000 ALTER TABLE `re_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts`
--

DROP TABLE IF EXISTS `re_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int unsigned DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint unsigned DEFAULT NULL,
  `verification_note` text COLLATE utf8mb4_unicode_ci,
  `is_public_profile` tinyint(1) NOT NULL DEFAULT '0',
  `hide_phone` tinyint(1) NOT NULL DEFAULT '0',
  `hide_email` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `blocked_at` datetime DEFAULT NULL,
  `blocked_reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_accounts_email_unique` (`email`),
  UNIQUE KEY `re_accounts_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts`
--

LOCK TABLES `re_accounts` WRITE;
/*!40000 ALTER TABLE `re_accounts` DISABLE KEYS */;
INSERT INTO `re_accounts` VALUES (1,'John','Smith','Experienced agent specializing in luxury homes and investment properties.',NULL,'john.smith@botble.com','john-smith-894','$2y$12$BPnOlzFMM0QoESSZhinaKO3K5yneNus82PowXprrHl1MTOQmTZo3S',20,'1971-01-03','+14155551234','+14155551234',10,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:17','2026-04-27 00:42:17',0,1,'2025-09-13 00:42:17',1,'Verified trusted agent',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(2,'Sarah','Johnson','Dedicated real estate professional with expertise in residential properties.',NULL,'agent@botble.com','sarah-johnson-385','$2y$12$JkBJOfJ2uBXFmP0K.6dyP.xGfrDOTyPKl8JoC5o6rLl4Il9CSWGZG',19,'1984-03-06','+12125559876','+12125559876',10,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:17','2026-04-27 00:42:17',0,0,NULL,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(3,'Michael','Garcia','Passionate about helping clients find their perfect home.',NULL,'michael.garcia1@example.com','michael-garcia-500','$2y$12$4ZR4BqrB7LV1HvgJJtf1TOXf7vHD6VFVprzkOssDwLAFtbUrQG34u',23,'1992-04-29','+12125559876','+12125559876',1,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:18','2026-04-27 00:42:18',1,1,'2025-10-05 00:42:18',1,'Agent credentials confirmed',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(4,'Emily','Miller','Results-driven agent focused on client satisfaction.',NULL,'emily.miller2@example.com','emily-miller-319','$2y$12$gvDQDW9nxUstkOeGnbkxLOB8YWklwbWU2cbReUVrBqvNriMFPUPry',16,'1974-08-16','+13105557890','+13105557890',2,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:18','2026-04-27 00:42:18',1,1,'2025-05-29 00:42:18',1,'',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(5,'David','Davis','Full-service real estate professional for buyers and sellers.',NULL,'david.davis3@example.com','david-davis-419','$2y$12$KElkYdRcmeAt4pFBcC6y8u92EcZ/RtELuZOKUFJnOmhiIvO2b9636',15,'1978-05-28','+17185554321','+17185554321',8,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:18','2026-04-27 00:42:18',1,0,NULL,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(6,'Jennifer','Rodriguez','Full-service real estate professional for buyers and sellers.',NULL,'jennifer.rodriguez4@example.com','jennifer-rodriguez-715','$2y$12$wlE59EpvPsFoW6eWLNUTgeQ/VQCTDbDIr/HdUXwGZ5kLVPxjw9Dre',16,'1978-11-09','+16505558765','+16505558765',8,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:18','2026-04-27 00:42:18',1,1,'2025-10-16 00:42:18',1,'Documents verified successfully',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(7,'Robert','Martinez','Skilled negotiator with a proven track record of success.',NULL,'robert.martinez5@example.com','robert-martinez-995','$2y$12$Kt80vOse8XVjqfJWEVicq.x8oSKtkigwt6yv2Qak3spLhb0opPpsG',18,'1996-11-09','+16465553456','+16465553456',8,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:18','2026-04-27 00:42:18',1,0,NULL,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(8,'Lisa','Wilson','Seasoned professional with extensive market knowledge.',NULL,'lisa.wilson6@example.com','lisa-wilson-998','$2y$12$fojs2tCJs49GaU62EWmCmOCcBZYrxMX4dUBWtIsIK4peQ6VZEcTjy',23,'1985-11-14','+14085552468','+14085552468',5,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:19','2026-04-27 00:42:19',1,1,'2025-05-03 00:42:19',1,'',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(9,'James','Anderson','Results-driven agent focused on client satisfaction.',NULL,'james.anderson7@example.com','james-anderson-931','$2y$12$zLB0Cba3WcmmuX2xo8gEwODNuG4f1UKau6K9j36u0Ao1rw0DU/13W',17,'1985-01-21','+15105551357','+15105551357',7,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:19','2026-04-27 00:42:19',0,1,'2025-07-15 00:42:19',1,'',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(10,'Amanda','Smith','Experienced agent specializing in luxury homes and investment properties.',NULL,'amanda.smith8@example.com','amanda-smith-260','$2y$12$jclbgtwjdD3Smq8F7t9pQOR4uwlFBZu/ntIZ8D5A6DarTptblyxyi',18,'1998-05-21','+16195559630','+16195559630',6,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:19','2026-04-27 00:42:19',0,1,'2025-06-02 00:42:19',1,'Verified trusted partner',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(11,'William','Johnson','Local market expert committed to exceptional client service.',NULL,'william.johnson9@example.com','william-johnson-599','$2y$12$0W/rzLO87UZrPcWTl4jCC.JNlIIJ/DVj.ZxYad4iwXuZ1QiRa4SIi',19,'1991-07-16','+19495558520','+19495558520',2,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:19','2026-04-27 00:42:19',0,1,'2025-11-06 00:42:19',1,'Documents verified successfully',1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL),(12,'Jessica','Williams','Trusted advisor with deep knowledge of the local market.',NULL,'jessica.williams10@example.com','jessica-williams-984','$2y$12$kZKuxYRgs8E1P2TMClxf2Otcq/szocDxOmwucVKA6c91G57wWSdgK',19,'1980-06-04','+13235557410','+13235557410',4,'2026-04-27 07:42:17',NULL,NULL,'2026-04-27 00:42:20','2026-04-27 00:42:20',1,0,NULL,NULL,NULL,1,0,0,NULL,NULL,NULL,NULL,'2026-04-27 07:42:17',NULL,NULL);
/*!40000 ALTER TABLE `re_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts_translations`
--

DROP TABLE IF EXISTS `re_accounts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_accounts_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_accounts_id`),
  KEY `idx_re_accounts_trans_fk` (`re_accounts_id`),
  KEY `idx_re_accounts_trans_fk_lang` (`re_accounts_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts_translations`
--

LOCK TABLES `re_accounts_translations` WRITE;
/*!40000 ALTER TABLE `re_accounts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_accounts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories`
--

DROP TABLE IF EXISTS `re_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_re_categories_status` (`status`),
  KEY `idx_re_categories_parent_id` (`parent_id`),
  KEY `idx_re_categories_status_parent_order` (`status`,`parent_id`,`order`),
  KEY `idx_re_categories_is_default` (`is_default`),
  KEY `idx_re_categories_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories`
--

LOCK TABLES `re_categories` WRITE;
/*!40000 ALTER TABLE `re_categories` DISABLE KEYS */;
INSERT INTO `re_categories` VALUES (1,'Apartment',NULL,NULL,'published',0,1,'2026-04-27 00:42:16','2026-04-27 00:42:16',0),(2,'Villa',NULL,NULL,'published',1,0,'2026-04-27 00:42:16','2026-04-27 00:42:16',0),(3,'Condo',NULL,NULL,'published',2,0,'2026-04-27 00:42:16','2026-04-27 00:42:16',0),(4,'House',NULL,NULL,'published',3,0,'2026-04-27 00:42:16','2026-04-27 00:42:16',0),(5,'Land',NULL,NULL,'published',4,0,'2026-04-27 00:42:16','2026-04-27 00:42:16',0),(6,'Commercial property',NULL,NULL,'published',5,0,'2026-04-27 00:42:16','2026-04-27 00:42:16',0);
/*!40000 ALTER TABLE `re_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories_translations`
--

DROP TABLE IF EXISTS `re_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_categories_id`),
  KEY `idx_re_categories_trans_fk` (`re_categories_id`),
  KEY `idx_re_categories_trans_fk_lang` (`re_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories_translations`
--

LOCK TABLES `re_categories_translations` WRITE;
/*!40000 ALTER TABLE `re_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_field_options`
--

DROP TABLE IF EXISTS `re_consult_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_field_options`
--

LOCK TABLES `re_consult_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consult_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_consult_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_field_options_translations` (
  `re_consult_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_consult_custom_field_options_id`),
  KEY `idx_re_ccfo_trans_fk` (`re_consult_custom_field_options_id`),
  KEY `idx_re_ccfo_trans_fk_lang` (`re_consult_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_field_options_translations`
--

LOCK TABLES `re_consult_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consult_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_fields`
--

DROP TABLE IF EXISTS `re_consult_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_fields`
--

LOCK TABLES `re_consult_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_fields` DISABLE KEYS */;
INSERT INTO `re_consult_custom_fields` VALUES (1,'date',0,'Schedule a Tour (optional)',NULL,999,'published','2026-04-27 00:42:25','2026-04-27 00:42:25');
/*!40000 ALTER TABLE `re_consult_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_consult_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consult_custom_fields_translations` (
  `re_consult_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_consult_custom_fields_id`),
  KEY `idx_re_ccf_trans_fk` (`re_consult_custom_fields_id`),
  KEY `idx_re_ccf_trans_fk_lang` (`re_consult_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consult_custom_fields_translations`
--

LOCK TABLES `re_consult_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_consult_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consult_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consults`
--

DROP TABLE IF EXISTS `re_consults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consults` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `property_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consults`
--

LOCK TABLES `re_consults` WRITE;
/*!40000 ALTER TABLE `re_consults` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_coupons`
--

DROP TABLE IF EXISTS `re_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_coupons`
--

LOCK TABLES `re_coupons` WRITE;
/*!40000 ALTER TABLE `re_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_currencies`
--

DROP TABLE IF EXISTS `re_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `number_format_style` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'western',
  `space_between_price_and_currency` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_currencies`
--

LOCK TABLES `re_currencies` WRITE;
/*!40000 ALTER TABLE `re_currencies` DISABLE KEYS */;
INSERT INTO `re_currencies` VALUES (1,'USD','$',1,0,'western',0,0,1,1,'2026-04-27 00:42:16','2026-04-27 00:42:16'),(2,'EUR','€',0,0,'western',0,1,0,0.91,'2026-04-27 00:42:16','2026-04-27 00:42:16'),(3,'VND','₫',0,0,'western',0,2,0,23717.5,'2026-04-27 00:42:16','2026-04-27 00:42:16');
/*!40000 ALTER TABLE `re_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options`
--

DROP TABLE IF EXISTS `re_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options`
--

LOCK TABLES `re_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_options_id`),
  KEY `idx_re_cfo_trans_fk` (`re_custom_field_options_id`),
  KEY `idx_re_cfo_trans_fk_lang` (`re_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options_translations`
--

LOCK TABLES `re_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values`
--

DROP TABLE IF EXISTS `re_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values`
--

LOCK TABLES `re_custom_field_values` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values_translations`
--

DROP TABLE IF EXISTS `re_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_values_id`),
  KEY `idx_re_cfv_trans_fk` (`re_custom_field_values_id`),
  KEY `idx_re_cfv_trans_fk_lang` (`re_custom_field_values_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values_translations`
--

LOCK TABLES `re_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields`
--

DROP TABLE IF EXISTS `re_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields`
--

LOCK TABLES `re_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_fields_id`),
  KEY `idx_re_cf_trans_fk` (`re_custom_fields_id`),
  KEY `idx_re_cf_trans_fk_lang` (`re_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields_translations`
--

LOCK TABLES `re_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities`
--

DROP TABLE IF EXISTS `re_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities`
--

LOCK TABLES `re_facilities` WRITE;
/*!40000 ALTER TABLE `re_facilities` DISABLE KEYS */;
INSERT INTO `re_facilities` VALUES (1,'Hospital','ti ti-hospital','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(2,'Super Market','ti ti-shopping-cart','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(3,'School','ti ti-school','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(4,'Entertainment','ti ti-movie','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(5,'Pharmacy','ti ti-pill','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(6,'Airport','ti ti-plane-departure','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(7,'Railways','ti ti-train','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(8,'Bus Stop','ti ti-bus','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(9,'Beach','ti ti-beach','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(10,'Mall','ti ti-shopping-cart','published','2026-04-27 00:42:16','2026-04-27 00:42:16'),(11,'Bank','ti ti-building-bank','published','2026-04-27 00:42:16','2026-04-27 00:42:16');
/*!40000 ALTER TABLE `re_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_distances`
--

DROP TABLE IF EXISTS `re_facilities_distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_distances` (
  `facility_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`facility_id`,`reference_id`,`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_distances`
--

LOCK TABLES `re_facilities_distances` WRITE;
/*!40000 ALTER TABLE `re_facilities_distances` DISABLE KEYS */;
INSERT INTO `re_facilities_distances` VALUES (1,1,'Botble\\RealEstate\\Models\\Project','18km'),(1,1,'Botble\\RealEstate\\Models\\Property','1km'),(1,2,'Botble\\RealEstate\\Models\\Project','10km'),(1,2,'Botble\\RealEstate\\Models\\Property','12km'),(1,3,'Botble\\RealEstate\\Models\\Project','8km'),(1,3,'Botble\\RealEstate\\Models\\Property','3km'),(1,4,'Botble\\RealEstate\\Models\\Project','4km'),(1,4,'Botble\\RealEstate\\Models\\Property','7km'),(1,5,'Botble\\RealEstate\\Models\\Project','12km'),(1,5,'Botble\\RealEstate\\Models\\Property','13km'),(1,6,'Botble\\RealEstate\\Models\\Project','9km'),(1,6,'Botble\\RealEstate\\Models\\Property','2km'),(1,7,'Botble\\RealEstate\\Models\\Project','9km'),(1,7,'Botble\\RealEstate\\Models\\Property','14km'),(1,8,'Botble\\RealEstate\\Models\\Project','6km'),(1,8,'Botble\\RealEstate\\Models\\Property','18km'),(1,9,'Botble\\RealEstate\\Models\\Project','12km'),(1,9,'Botble\\RealEstate\\Models\\Property','20km'),(1,10,'Botble\\RealEstate\\Models\\Project','2km'),(1,10,'Botble\\RealEstate\\Models\\Property','2km'),(1,11,'Botble\\RealEstate\\Models\\Project','10km'),(1,11,'Botble\\RealEstate\\Models\\Property','11km'),(1,12,'Botble\\RealEstate\\Models\\Project','16km'),(1,12,'Botble\\RealEstate\\Models\\Property','19km'),(1,13,'Botble\\RealEstate\\Models\\Project','14km'),(1,13,'Botble\\RealEstate\\Models\\Property','17km'),(1,14,'Botble\\RealEstate\\Models\\Project','13km'),(1,14,'Botble\\RealEstate\\Models\\Property','1km'),(1,15,'Botble\\RealEstate\\Models\\Project','4km'),(1,15,'Botble\\RealEstate\\Models\\Property','15km'),(1,16,'Botble\\RealEstate\\Models\\Project','16km'),(1,16,'Botble\\RealEstate\\Models\\Property','4km'),(1,17,'Botble\\RealEstate\\Models\\Project','1km'),(1,17,'Botble\\RealEstate\\Models\\Property','7km'),(1,18,'Botble\\RealEstate\\Models\\Project','3km'),(1,18,'Botble\\RealEstate\\Models\\Property','6km'),(1,19,'Botble\\RealEstate\\Models\\Property','2km'),(1,20,'Botble\\RealEstate\\Models\\Property','9km'),(1,21,'Botble\\RealEstate\\Models\\Property','10km'),(1,22,'Botble\\RealEstate\\Models\\Property','13km'),(1,23,'Botble\\RealEstate\\Models\\Property','15km'),(1,24,'Botble\\RealEstate\\Models\\Property','2km'),(1,25,'Botble\\RealEstate\\Models\\Property','11km'),(1,26,'Botble\\RealEstate\\Models\\Property','15km'),(1,27,'Botble\\RealEstate\\Models\\Property','18km'),(1,28,'Botble\\RealEstate\\Models\\Property','15km'),(1,29,'Botble\\RealEstate\\Models\\Property','14km'),(1,30,'Botble\\RealEstate\\Models\\Property','2km'),(1,31,'Botble\\RealEstate\\Models\\Property','12km'),(1,32,'Botble\\RealEstate\\Models\\Property','15km'),(1,33,'Botble\\RealEstate\\Models\\Property','3km'),(1,34,'Botble\\RealEstate\\Models\\Property','2km'),(1,35,'Botble\\RealEstate\\Models\\Property','10km'),(1,36,'Botble\\RealEstate\\Models\\Property','4km'),(1,37,'Botble\\RealEstate\\Models\\Property','10km'),(1,38,'Botble\\RealEstate\\Models\\Property','17km'),(1,39,'Botble\\RealEstate\\Models\\Property','20km'),(1,40,'Botble\\RealEstate\\Models\\Property','9km'),(1,41,'Botble\\RealEstate\\Models\\Property','20km'),(1,42,'Botble\\RealEstate\\Models\\Property','4km'),(1,43,'Botble\\RealEstate\\Models\\Property','12km'),(1,44,'Botble\\RealEstate\\Models\\Property','14km'),(1,45,'Botble\\RealEstate\\Models\\Property','20km'),(1,46,'Botble\\RealEstate\\Models\\Property','11km'),(1,47,'Botble\\RealEstate\\Models\\Property','9km'),(1,48,'Botble\\RealEstate\\Models\\Property','14km'),(1,49,'Botble\\RealEstate\\Models\\Property','6km'),(1,50,'Botble\\RealEstate\\Models\\Property','12km'),(1,51,'Botble\\RealEstate\\Models\\Property','3km'),(1,52,'Botble\\RealEstate\\Models\\Property','12km'),(1,53,'Botble\\RealEstate\\Models\\Property','2km'),(1,54,'Botble\\RealEstate\\Models\\Property','3km'),(1,55,'Botble\\RealEstate\\Models\\Property','4km'),(1,56,'Botble\\RealEstate\\Models\\Property','4km'),(1,57,'Botble\\RealEstate\\Models\\Property','16km'),(1,58,'Botble\\RealEstate\\Models\\Property','5km'),(1,59,'Botble\\RealEstate\\Models\\Property','10km'),(1,60,'Botble\\RealEstate\\Models\\Property','7km'),(1,61,'Botble\\RealEstate\\Models\\Property','19km'),(2,1,'Botble\\RealEstate\\Models\\Project','8km'),(2,1,'Botble\\RealEstate\\Models\\Property','9km'),(2,2,'Botble\\RealEstate\\Models\\Project','3km'),(2,2,'Botble\\RealEstate\\Models\\Property','18km'),(2,3,'Botble\\RealEstate\\Models\\Project','14km'),(2,3,'Botble\\RealEstate\\Models\\Property','4km'),(2,4,'Botble\\RealEstate\\Models\\Project','12km'),(2,4,'Botble\\RealEstate\\Models\\Property','1km'),(2,5,'Botble\\RealEstate\\Models\\Project','11km'),(2,5,'Botble\\RealEstate\\Models\\Property','19km'),(2,6,'Botble\\RealEstate\\Models\\Project','9km'),(2,6,'Botble\\RealEstate\\Models\\Property','7km'),(2,7,'Botble\\RealEstate\\Models\\Project','18km'),(2,7,'Botble\\RealEstate\\Models\\Property','14km'),(2,8,'Botble\\RealEstate\\Models\\Project','19km'),(2,8,'Botble\\RealEstate\\Models\\Property','15km'),(2,9,'Botble\\RealEstate\\Models\\Project','15km'),(2,9,'Botble\\RealEstate\\Models\\Property','4km'),(2,10,'Botble\\RealEstate\\Models\\Project','18km'),(2,10,'Botble\\RealEstate\\Models\\Property','7km'),(2,11,'Botble\\RealEstate\\Models\\Project','18km'),(2,11,'Botble\\RealEstate\\Models\\Property','16km'),(2,12,'Botble\\RealEstate\\Models\\Project','6km'),(2,12,'Botble\\RealEstate\\Models\\Property','17km'),(2,13,'Botble\\RealEstate\\Models\\Project','11km'),(2,13,'Botble\\RealEstate\\Models\\Property','13km'),(2,14,'Botble\\RealEstate\\Models\\Project','8km'),(2,14,'Botble\\RealEstate\\Models\\Property','17km'),(2,15,'Botble\\RealEstate\\Models\\Project','10km'),(2,15,'Botble\\RealEstate\\Models\\Property','9km'),(2,16,'Botble\\RealEstate\\Models\\Project','12km'),(2,16,'Botble\\RealEstate\\Models\\Property','19km'),(2,17,'Botble\\RealEstate\\Models\\Project','19km'),(2,17,'Botble\\RealEstate\\Models\\Property','19km'),(2,18,'Botble\\RealEstate\\Models\\Project','18km'),(2,18,'Botble\\RealEstate\\Models\\Property','1km'),(2,19,'Botble\\RealEstate\\Models\\Property','19km'),(2,20,'Botble\\RealEstate\\Models\\Property','17km'),(2,21,'Botble\\RealEstate\\Models\\Property','16km'),(2,22,'Botble\\RealEstate\\Models\\Property','9km'),(2,23,'Botble\\RealEstate\\Models\\Property','5km'),(2,24,'Botble\\RealEstate\\Models\\Property','10km'),(2,25,'Botble\\RealEstate\\Models\\Property','4km'),(2,26,'Botble\\RealEstate\\Models\\Property','20km'),(2,27,'Botble\\RealEstate\\Models\\Property','17km'),(2,28,'Botble\\RealEstate\\Models\\Property','17km'),(2,29,'Botble\\RealEstate\\Models\\Property','2km'),(2,30,'Botble\\RealEstate\\Models\\Property','17km'),(2,31,'Botble\\RealEstate\\Models\\Property','13km'),(2,32,'Botble\\RealEstate\\Models\\Property','10km'),(2,33,'Botble\\RealEstate\\Models\\Property','4km'),(2,34,'Botble\\RealEstate\\Models\\Property','8km'),(2,35,'Botble\\RealEstate\\Models\\Property','3km'),(2,36,'Botble\\RealEstate\\Models\\Property','17km'),(2,37,'Botble\\RealEstate\\Models\\Property','14km'),(2,38,'Botble\\RealEstate\\Models\\Property','12km'),(2,39,'Botble\\RealEstate\\Models\\Property','3km'),(2,40,'Botble\\RealEstate\\Models\\Property','19km'),(2,41,'Botble\\RealEstate\\Models\\Property','5km'),(2,42,'Botble\\RealEstate\\Models\\Property','7km'),(2,43,'Botble\\RealEstate\\Models\\Property','17km'),(2,44,'Botble\\RealEstate\\Models\\Property','9km'),(2,45,'Botble\\RealEstate\\Models\\Property','19km'),(2,46,'Botble\\RealEstate\\Models\\Property','19km'),(2,47,'Botble\\RealEstate\\Models\\Property','18km'),(2,48,'Botble\\RealEstate\\Models\\Property','9km'),(2,49,'Botble\\RealEstate\\Models\\Property','16km'),(2,50,'Botble\\RealEstate\\Models\\Property','3km'),(2,51,'Botble\\RealEstate\\Models\\Property','15km'),(2,52,'Botble\\RealEstate\\Models\\Property','1km'),(2,53,'Botble\\RealEstate\\Models\\Property','12km'),(2,54,'Botble\\RealEstate\\Models\\Property','17km'),(2,55,'Botble\\RealEstate\\Models\\Property','12km'),(2,56,'Botble\\RealEstate\\Models\\Property','10km'),(2,57,'Botble\\RealEstate\\Models\\Property','12km'),(2,58,'Botble\\RealEstate\\Models\\Property','13km'),(2,59,'Botble\\RealEstate\\Models\\Property','14km'),(2,60,'Botble\\RealEstate\\Models\\Property','1km'),(2,61,'Botble\\RealEstate\\Models\\Property','6km'),(3,1,'Botble\\RealEstate\\Models\\Project','18km'),(3,1,'Botble\\RealEstate\\Models\\Property','2km'),(3,2,'Botble\\RealEstate\\Models\\Project','7km'),(3,2,'Botble\\RealEstate\\Models\\Property','1km'),(3,3,'Botble\\RealEstate\\Models\\Project','11km'),(3,3,'Botble\\RealEstate\\Models\\Property','9km'),(3,4,'Botble\\RealEstate\\Models\\Project','8km'),(3,4,'Botble\\RealEstate\\Models\\Property','20km'),(3,5,'Botble\\RealEstate\\Models\\Project','3km'),(3,5,'Botble\\RealEstate\\Models\\Property','13km'),(3,6,'Botble\\RealEstate\\Models\\Project','7km'),(3,6,'Botble\\RealEstate\\Models\\Property','5km'),(3,7,'Botble\\RealEstate\\Models\\Project','2km'),(3,7,'Botble\\RealEstate\\Models\\Property','18km'),(3,8,'Botble\\RealEstate\\Models\\Project','18km'),(3,8,'Botble\\RealEstate\\Models\\Property','6km'),(3,9,'Botble\\RealEstate\\Models\\Project','2km'),(3,9,'Botble\\RealEstate\\Models\\Property','18km'),(3,10,'Botble\\RealEstate\\Models\\Project','8km'),(3,10,'Botble\\RealEstate\\Models\\Property','11km'),(3,11,'Botble\\RealEstate\\Models\\Project','1km'),(3,11,'Botble\\RealEstate\\Models\\Property','17km'),(3,12,'Botble\\RealEstate\\Models\\Project','9km'),(3,12,'Botble\\RealEstate\\Models\\Property','19km'),(3,13,'Botble\\RealEstate\\Models\\Project','12km'),(3,13,'Botble\\RealEstate\\Models\\Property','3km'),(3,14,'Botble\\RealEstate\\Models\\Project','14km'),(3,14,'Botble\\RealEstate\\Models\\Property','1km'),(3,15,'Botble\\RealEstate\\Models\\Project','9km'),(3,15,'Botble\\RealEstate\\Models\\Property','12km'),(3,16,'Botble\\RealEstate\\Models\\Project','8km'),(3,16,'Botble\\RealEstate\\Models\\Property','10km'),(3,17,'Botble\\RealEstate\\Models\\Project','9km'),(3,17,'Botble\\RealEstate\\Models\\Property','2km'),(3,18,'Botble\\RealEstate\\Models\\Project','15km'),(3,18,'Botble\\RealEstate\\Models\\Property','13km'),(3,19,'Botble\\RealEstate\\Models\\Property','12km'),(3,20,'Botble\\RealEstate\\Models\\Property','8km'),(3,21,'Botble\\RealEstate\\Models\\Property','19km'),(3,22,'Botble\\RealEstate\\Models\\Property','13km'),(3,23,'Botble\\RealEstate\\Models\\Property','1km'),(3,24,'Botble\\RealEstate\\Models\\Property','9km'),(3,25,'Botble\\RealEstate\\Models\\Property','11km'),(3,26,'Botble\\RealEstate\\Models\\Property','12km'),(3,27,'Botble\\RealEstate\\Models\\Property','19km'),(3,28,'Botble\\RealEstate\\Models\\Property','7km'),(3,29,'Botble\\RealEstate\\Models\\Property','11km'),(3,30,'Botble\\RealEstate\\Models\\Property','18km'),(3,31,'Botble\\RealEstate\\Models\\Property','8km'),(3,32,'Botble\\RealEstate\\Models\\Property','12km'),(3,33,'Botble\\RealEstate\\Models\\Property','18km'),(3,34,'Botble\\RealEstate\\Models\\Property','14km'),(3,35,'Botble\\RealEstate\\Models\\Property','11km'),(3,36,'Botble\\RealEstate\\Models\\Property','2km'),(3,37,'Botble\\RealEstate\\Models\\Property','2km'),(3,38,'Botble\\RealEstate\\Models\\Property','16km'),(3,39,'Botble\\RealEstate\\Models\\Property','14km'),(3,40,'Botble\\RealEstate\\Models\\Property','11km'),(3,41,'Botble\\RealEstate\\Models\\Property','19km'),(3,42,'Botble\\RealEstate\\Models\\Property','12km'),(3,43,'Botble\\RealEstate\\Models\\Property','10km'),(3,44,'Botble\\RealEstate\\Models\\Property','1km'),(3,45,'Botble\\RealEstate\\Models\\Property','9km'),(3,46,'Botble\\RealEstate\\Models\\Property','6km'),(3,47,'Botble\\RealEstate\\Models\\Property','4km'),(3,48,'Botble\\RealEstate\\Models\\Property','4km'),(3,49,'Botble\\RealEstate\\Models\\Property','9km'),(3,50,'Botble\\RealEstate\\Models\\Property','16km'),(3,51,'Botble\\RealEstate\\Models\\Property','10km'),(3,52,'Botble\\RealEstate\\Models\\Property','4km'),(3,53,'Botble\\RealEstate\\Models\\Property','10km'),(3,54,'Botble\\RealEstate\\Models\\Property','12km'),(3,55,'Botble\\RealEstate\\Models\\Property','8km'),(3,56,'Botble\\RealEstate\\Models\\Property','18km'),(3,57,'Botble\\RealEstate\\Models\\Property','16km'),(3,58,'Botble\\RealEstate\\Models\\Property','12km'),(3,59,'Botble\\RealEstate\\Models\\Property','8km'),(3,60,'Botble\\RealEstate\\Models\\Property','19km'),(3,61,'Botble\\RealEstate\\Models\\Property','3km'),(4,1,'Botble\\RealEstate\\Models\\Project','6km'),(4,1,'Botble\\RealEstate\\Models\\Property','18km'),(4,2,'Botble\\RealEstate\\Models\\Project','12km'),(4,2,'Botble\\RealEstate\\Models\\Property','2km'),(4,3,'Botble\\RealEstate\\Models\\Project','1km'),(4,3,'Botble\\RealEstate\\Models\\Property','13km'),(4,4,'Botble\\RealEstate\\Models\\Project','1km'),(4,4,'Botble\\RealEstate\\Models\\Property','8km'),(4,5,'Botble\\RealEstate\\Models\\Project','20km'),(4,5,'Botble\\RealEstate\\Models\\Property','16km'),(4,6,'Botble\\RealEstate\\Models\\Project','2km'),(4,6,'Botble\\RealEstate\\Models\\Property','5km'),(4,7,'Botble\\RealEstate\\Models\\Project','15km'),(4,7,'Botble\\RealEstate\\Models\\Property','5km'),(4,8,'Botble\\RealEstate\\Models\\Project','7km'),(4,8,'Botble\\RealEstate\\Models\\Property','8km'),(4,9,'Botble\\RealEstate\\Models\\Project','12km'),(4,9,'Botble\\RealEstate\\Models\\Property','18km'),(4,10,'Botble\\RealEstate\\Models\\Project','12km'),(4,10,'Botble\\RealEstate\\Models\\Property','11km'),(4,11,'Botble\\RealEstate\\Models\\Project','10km'),(4,11,'Botble\\RealEstate\\Models\\Property','9km'),(4,12,'Botble\\RealEstate\\Models\\Project','4km'),(4,12,'Botble\\RealEstate\\Models\\Property','10km'),(4,13,'Botble\\RealEstate\\Models\\Project','15km'),(4,13,'Botble\\RealEstate\\Models\\Property','20km'),(4,14,'Botble\\RealEstate\\Models\\Project','10km'),(4,14,'Botble\\RealEstate\\Models\\Property','15km'),(4,15,'Botble\\RealEstate\\Models\\Project','3km'),(4,15,'Botble\\RealEstate\\Models\\Property','11km'),(4,16,'Botble\\RealEstate\\Models\\Project','19km'),(4,16,'Botble\\RealEstate\\Models\\Property','4km'),(4,17,'Botble\\RealEstate\\Models\\Project','5km'),(4,17,'Botble\\RealEstate\\Models\\Property','16km'),(4,18,'Botble\\RealEstate\\Models\\Project','4km'),(4,18,'Botble\\RealEstate\\Models\\Property','5km'),(4,19,'Botble\\RealEstate\\Models\\Property','13km'),(4,20,'Botble\\RealEstate\\Models\\Property','3km'),(4,21,'Botble\\RealEstate\\Models\\Property','3km'),(4,22,'Botble\\RealEstate\\Models\\Property','20km'),(4,23,'Botble\\RealEstate\\Models\\Property','14km'),(4,24,'Botble\\RealEstate\\Models\\Property','12km'),(4,25,'Botble\\RealEstate\\Models\\Property','12km'),(4,26,'Botble\\RealEstate\\Models\\Property','14km'),(4,27,'Botble\\RealEstate\\Models\\Property','10km'),(4,28,'Botble\\RealEstate\\Models\\Property','7km'),(4,29,'Botble\\RealEstate\\Models\\Property','18km'),(4,30,'Botble\\RealEstate\\Models\\Property','5km'),(4,31,'Botble\\RealEstate\\Models\\Property','3km'),(4,32,'Botble\\RealEstate\\Models\\Property','9km'),(4,33,'Botble\\RealEstate\\Models\\Property','12km'),(4,34,'Botble\\RealEstate\\Models\\Property','17km'),(4,35,'Botble\\RealEstate\\Models\\Property','11km'),(4,36,'Botble\\RealEstate\\Models\\Property','6km'),(4,37,'Botble\\RealEstate\\Models\\Property','20km'),(4,38,'Botble\\RealEstate\\Models\\Property','10km'),(4,39,'Botble\\RealEstate\\Models\\Property','9km'),(4,40,'Botble\\RealEstate\\Models\\Property','15km'),(4,41,'Botble\\RealEstate\\Models\\Property','8km'),(4,42,'Botble\\RealEstate\\Models\\Property','11km'),(4,43,'Botble\\RealEstate\\Models\\Property','15km'),(4,44,'Botble\\RealEstate\\Models\\Property','2km'),(4,45,'Botble\\RealEstate\\Models\\Property','14km'),(4,46,'Botble\\RealEstate\\Models\\Property','2km'),(4,47,'Botble\\RealEstate\\Models\\Property','19km'),(4,48,'Botble\\RealEstate\\Models\\Property','18km'),(4,49,'Botble\\RealEstate\\Models\\Property','13km'),(4,50,'Botble\\RealEstate\\Models\\Property','15km'),(4,51,'Botble\\RealEstate\\Models\\Property','1km'),(4,52,'Botble\\RealEstate\\Models\\Property','18km'),(4,53,'Botble\\RealEstate\\Models\\Property','19km'),(4,54,'Botble\\RealEstate\\Models\\Property','1km'),(4,55,'Botble\\RealEstate\\Models\\Property','5km'),(4,56,'Botble\\RealEstate\\Models\\Property','18km'),(4,57,'Botble\\RealEstate\\Models\\Property','8km'),(4,58,'Botble\\RealEstate\\Models\\Property','11km'),(4,59,'Botble\\RealEstate\\Models\\Property','18km'),(4,60,'Botble\\RealEstate\\Models\\Property','7km'),(4,61,'Botble\\RealEstate\\Models\\Property','4km'),(5,1,'Botble\\RealEstate\\Models\\Project','16km'),(5,1,'Botble\\RealEstate\\Models\\Property','6km'),(5,2,'Botble\\RealEstate\\Models\\Project','7km'),(5,2,'Botble\\RealEstate\\Models\\Property','11km'),(5,3,'Botble\\RealEstate\\Models\\Project','6km'),(5,3,'Botble\\RealEstate\\Models\\Property','9km'),(5,4,'Botble\\RealEstate\\Models\\Project','15km'),(5,4,'Botble\\RealEstate\\Models\\Property','11km'),(5,5,'Botble\\RealEstate\\Models\\Project','4km'),(5,5,'Botble\\RealEstate\\Models\\Property','4km'),(5,6,'Botble\\RealEstate\\Models\\Project','14km'),(5,6,'Botble\\RealEstate\\Models\\Property','6km'),(5,7,'Botble\\RealEstate\\Models\\Project','14km'),(5,7,'Botble\\RealEstate\\Models\\Property','6km'),(5,8,'Botble\\RealEstate\\Models\\Project','2km'),(5,8,'Botble\\RealEstate\\Models\\Property','1km'),(5,9,'Botble\\RealEstate\\Models\\Project','1km'),(5,9,'Botble\\RealEstate\\Models\\Property','13km'),(5,10,'Botble\\RealEstate\\Models\\Project','10km'),(5,10,'Botble\\RealEstate\\Models\\Property','2km'),(5,11,'Botble\\RealEstate\\Models\\Project','13km'),(5,11,'Botble\\RealEstate\\Models\\Property','6km'),(5,12,'Botble\\RealEstate\\Models\\Project','15km'),(5,12,'Botble\\RealEstate\\Models\\Property','5km'),(5,13,'Botble\\RealEstate\\Models\\Project','15km'),(5,13,'Botble\\RealEstate\\Models\\Property','10km'),(5,14,'Botble\\RealEstate\\Models\\Project','19km'),(5,14,'Botble\\RealEstate\\Models\\Property','19km'),(5,15,'Botble\\RealEstate\\Models\\Project','20km'),(5,15,'Botble\\RealEstate\\Models\\Property','18km'),(5,16,'Botble\\RealEstate\\Models\\Project','10km'),(5,16,'Botble\\RealEstate\\Models\\Property','4km'),(5,17,'Botble\\RealEstate\\Models\\Project','10km'),(5,17,'Botble\\RealEstate\\Models\\Property','19km'),(5,18,'Botble\\RealEstate\\Models\\Project','4km'),(5,18,'Botble\\RealEstate\\Models\\Property','3km'),(5,19,'Botble\\RealEstate\\Models\\Property','6km'),(5,20,'Botble\\RealEstate\\Models\\Property','3km'),(5,21,'Botble\\RealEstate\\Models\\Property','1km'),(5,22,'Botble\\RealEstate\\Models\\Property','11km'),(5,23,'Botble\\RealEstate\\Models\\Property','19km'),(5,24,'Botble\\RealEstate\\Models\\Property','13km'),(5,25,'Botble\\RealEstate\\Models\\Property','18km'),(5,26,'Botble\\RealEstate\\Models\\Property','3km'),(5,27,'Botble\\RealEstate\\Models\\Property','20km'),(5,28,'Botble\\RealEstate\\Models\\Property','9km'),(5,29,'Botble\\RealEstate\\Models\\Property','2km'),(5,30,'Botble\\RealEstate\\Models\\Property','18km'),(5,31,'Botble\\RealEstate\\Models\\Property','1km'),(5,32,'Botble\\RealEstate\\Models\\Property','18km'),(5,33,'Botble\\RealEstate\\Models\\Property','19km'),(5,34,'Botble\\RealEstate\\Models\\Property','14km'),(5,35,'Botble\\RealEstate\\Models\\Property','13km'),(5,36,'Botble\\RealEstate\\Models\\Property','2km'),(5,37,'Botble\\RealEstate\\Models\\Property','17km'),(5,38,'Botble\\RealEstate\\Models\\Property','17km'),(5,39,'Botble\\RealEstate\\Models\\Property','19km'),(5,40,'Botble\\RealEstate\\Models\\Property','13km'),(5,41,'Botble\\RealEstate\\Models\\Property','13km'),(5,42,'Botble\\RealEstate\\Models\\Property','14km'),(5,43,'Botble\\RealEstate\\Models\\Property','20km'),(5,44,'Botble\\RealEstate\\Models\\Property','1km'),(5,45,'Botble\\RealEstate\\Models\\Property','14km'),(5,46,'Botble\\RealEstate\\Models\\Property','16km'),(5,47,'Botble\\RealEstate\\Models\\Property','8km'),(5,48,'Botble\\RealEstate\\Models\\Property','10km'),(5,49,'Botble\\RealEstate\\Models\\Property','11km'),(5,50,'Botble\\RealEstate\\Models\\Property','16km'),(5,51,'Botble\\RealEstate\\Models\\Property','5km'),(5,52,'Botble\\RealEstate\\Models\\Property','15km'),(5,53,'Botble\\RealEstate\\Models\\Property','2km'),(5,54,'Botble\\RealEstate\\Models\\Property','17km'),(5,55,'Botble\\RealEstate\\Models\\Property','4km'),(5,56,'Botble\\RealEstate\\Models\\Property','7km'),(5,57,'Botble\\RealEstate\\Models\\Property','17km'),(5,58,'Botble\\RealEstate\\Models\\Property','20km'),(5,59,'Botble\\RealEstate\\Models\\Property','1km'),(5,60,'Botble\\RealEstate\\Models\\Property','5km'),(5,61,'Botble\\RealEstate\\Models\\Property','14km'),(6,1,'Botble\\RealEstate\\Models\\Project','20km'),(6,1,'Botble\\RealEstate\\Models\\Property','8km'),(6,2,'Botble\\RealEstate\\Models\\Project','9km'),(6,2,'Botble\\RealEstate\\Models\\Property','17km'),(6,3,'Botble\\RealEstate\\Models\\Project','1km'),(6,3,'Botble\\RealEstate\\Models\\Property','20km'),(6,4,'Botble\\RealEstate\\Models\\Project','4km'),(6,4,'Botble\\RealEstate\\Models\\Property','10km'),(6,5,'Botble\\RealEstate\\Models\\Project','4km'),(6,5,'Botble\\RealEstate\\Models\\Property','17km'),(6,6,'Botble\\RealEstate\\Models\\Project','8km'),(6,6,'Botble\\RealEstate\\Models\\Property','2km'),(6,7,'Botble\\RealEstate\\Models\\Project','16km'),(6,7,'Botble\\RealEstate\\Models\\Property','16km'),(6,8,'Botble\\RealEstate\\Models\\Project','10km'),(6,8,'Botble\\RealEstate\\Models\\Property','7km'),(6,9,'Botble\\RealEstate\\Models\\Project','11km'),(6,9,'Botble\\RealEstate\\Models\\Property','17km'),(6,10,'Botble\\RealEstate\\Models\\Project','16km'),(6,10,'Botble\\RealEstate\\Models\\Property','5km'),(6,11,'Botble\\RealEstate\\Models\\Project','19km'),(6,11,'Botble\\RealEstate\\Models\\Property','18km'),(6,12,'Botble\\RealEstate\\Models\\Project','5km'),(6,12,'Botble\\RealEstate\\Models\\Property','20km'),(6,13,'Botble\\RealEstate\\Models\\Project','17km'),(6,13,'Botble\\RealEstate\\Models\\Property','20km'),(6,14,'Botble\\RealEstate\\Models\\Project','8km'),(6,14,'Botble\\RealEstate\\Models\\Property','2km'),(6,15,'Botble\\RealEstate\\Models\\Project','13km'),(6,15,'Botble\\RealEstate\\Models\\Property','19km'),(6,16,'Botble\\RealEstate\\Models\\Project','7km'),(6,16,'Botble\\RealEstate\\Models\\Property','19km'),(6,17,'Botble\\RealEstate\\Models\\Project','14km'),(6,17,'Botble\\RealEstate\\Models\\Property','9km'),(6,18,'Botble\\RealEstate\\Models\\Project','11km'),(6,18,'Botble\\RealEstate\\Models\\Property','14km'),(6,19,'Botble\\RealEstate\\Models\\Property','19km'),(6,20,'Botble\\RealEstate\\Models\\Property','15km'),(6,21,'Botble\\RealEstate\\Models\\Property','7km'),(6,22,'Botble\\RealEstate\\Models\\Property','17km'),(6,23,'Botble\\RealEstate\\Models\\Property','5km'),(6,24,'Botble\\RealEstate\\Models\\Property','17km'),(6,25,'Botble\\RealEstate\\Models\\Property','1km'),(6,26,'Botble\\RealEstate\\Models\\Property','10km'),(6,27,'Botble\\RealEstate\\Models\\Property','15km'),(6,28,'Botble\\RealEstate\\Models\\Property','5km'),(6,29,'Botble\\RealEstate\\Models\\Property','17km'),(6,30,'Botble\\RealEstate\\Models\\Property','16km'),(6,31,'Botble\\RealEstate\\Models\\Property','1km'),(6,32,'Botble\\RealEstate\\Models\\Property','13km'),(6,33,'Botble\\RealEstate\\Models\\Property','11km'),(6,34,'Botble\\RealEstate\\Models\\Property','8km'),(6,35,'Botble\\RealEstate\\Models\\Property','15km'),(6,36,'Botble\\RealEstate\\Models\\Property','10km'),(6,37,'Botble\\RealEstate\\Models\\Property','4km'),(6,38,'Botble\\RealEstate\\Models\\Property','19km'),(6,39,'Botble\\RealEstate\\Models\\Property','5km'),(6,40,'Botble\\RealEstate\\Models\\Property','11km'),(6,41,'Botble\\RealEstate\\Models\\Property','12km'),(6,42,'Botble\\RealEstate\\Models\\Property','19km'),(6,43,'Botble\\RealEstate\\Models\\Property','12km'),(6,44,'Botble\\RealEstate\\Models\\Property','14km'),(6,45,'Botble\\RealEstate\\Models\\Property','13km'),(6,46,'Botble\\RealEstate\\Models\\Property','20km'),(6,47,'Botble\\RealEstate\\Models\\Property','11km'),(6,48,'Botble\\RealEstate\\Models\\Property','12km'),(6,49,'Botble\\RealEstate\\Models\\Property','16km'),(6,50,'Botble\\RealEstate\\Models\\Property','3km'),(6,51,'Botble\\RealEstate\\Models\\Property','18km'),(6,52,'Botble\\RealEstate\\Models\\Property','9km'),(6,53,'Botble\\RealEstate\\Models\\Property','17km'),(6,54,'Botble\\RealEstate\\Models\\Property','7km'),(6,55,'Botble\\RealEstate\\Models\\Property','5km'),(6,56,'Botble\\RealEstate\\Models\\Property','12km'),(6,57,'Botble\\RealEstate\\Models\\Property','20km'),(6,58,'Botble\\RealEstate\\Models\\Property','9km'),(6,59,'Botble\\RealEstate\\Models\\Property','12km'),(6,60,'Botble\\RealEstate\\Models\\Property','1km'),(6,61,'Botble\\RealEstate\\Models\\Property','14km'),(7,1,'Botble\\RealEstate\\Models\\Project','4km'),(7,1,'Botble\\RealEstate\\Models\\Property','13km'),(7,2,'Botble\\RealEstate\\Models\\Project','19km'),(7,2,'Botble\\RealEstate\\Models\\Property','13km'),(7,3,'Botble\\RealEstate\\Models\\Project','4km'),(7,3,'Botble\\RealEstate\\Models\\Property','5km'),(7,4,'Botble\\RealEstate\\Models\\Project','13km'),(7,4,'Botble\\RealEstate\\Models\\Property','3km'),(7,5,'Botble\\RealEstate\\Models\\Project','6km'),(7,5,'Botble\\RealEstate\\Models\\Property','8km'),(7,6,'Botble\\RealEstate\\Models\\Project','7km'),(7,6,'Botble\\RealEstate\\Models\\Property','17km'),(7,7,'Botble\\RealEstate\\Models\\Project','7km'),(7,7,'Botble\\RealEstate\\Models\\Property','3km'),(7,8,'Botble\\RealEstate\\Models\\Project','14km'),(7,8,'Botble\\RealEstate\\Models\\Property','9km'),(7,9,'Botble\\RealEstate\\Models\\Project','2km'),(7,9,'Botble\\RealEstate\\Models\\Property','3km'),(7,10,'Botble\\RealEstate\\Models\\Project','20km'),(7,10,'Botble\\RealEstate\\Models\\Property','13km'),(7,11,'Botble\\RealEstate\\Models\\Project','5km'),(7,11,'Botble\\RealEstate\\Models\\Property','2km'),(7,12,'Botble\\RealEstate\\Models\\Project','8km'),(7,12,'Botble\\RealEstate\\Models\\Property','17km'),(7,13,'Botble\\RealEstate\\Models\\Project','4km'),(7,13,'Botble\\RealEstate\\Models\\Property','18km'),(7,14,'Botble\\RealEstate\\Models\\Project','8km'),(7,14,'Botble\\RealEstate\\Models\\Property','2km'),(7,15,'Botble\\RealEstate\\Models\\Project','18km'),(7,15,'Botble\\RealEstate\\Models\\Property','7km'),(7,16,'Botble\\RealEstate\\Models\\Project','3km'),(7,16,'Botble\\RealEstate\\Models\\Property','2km'),(7,17,'Botble\\RealEstate\\Models\\Project','3km'),(7,17,'Botble\\RealEstate\\Models\\Property','10km'),(7,18,'Botble\\RealEstate\\Models\\Project','8km'),(7,18,'Botble\\RealEstate\\Models\\Property','8km'),(7,19,'Botble\\RealEstate\\Models\\Property','8km'),(7,20,'Botble\\RealEstate\\Models\\Property','5km'),(7,21,'Botble\\RealEstate\\Models\\Property','17km'),(7,22,'Botble\\RealEstate\\Models\\Property','15km'),(7,23,'Botble\\RealEstate\\Models\\Property','3km'),(7,24,'Botble\\RealEstate\\Models\\Property','7km'),(7,25,'Botble\\RealEstate\\Models\\Property','17km'),(7,26,'Botble\\RealEstate\\Models\\Property','16km'),(7,27,'Botble\\RealEstate\\Models\\Property','16km'),(7,28,'Botble\\RealEstate\\Models\\Property','5km'),(7,29,'Botble\\RealEstate\\Models\\Property','7km'),(7,30,'Botble\\RealEstate\\Models\\Property','19km'),(7,31,'Botble\\RealEstate\\Models\\Property','18km'),(7,32,'Botble\\RealEstate\\Models\\Property','2km'),(7,33,'Botble\\RealEstate\\Models\\Property','12km'),(7,34,'Botble\\RealEstate\\Models\\Property','13km'),(7,35,'Botble\\RealEstate\\Models\\Property','10km'),(7,36,'Botble\\RealEstate\\Models\\Property','12km'),(7,37,'Botble\\RealEstate\\Models\\Property','17km'),(7,38,'Botble\\RealEstate\\Models\\Property','19km'),(7,39,'Botble\\RealEstate\\Models\\Property','16km'),(7,40,'Botble\\RealEstate\\Models\\Property','11km'),(7,41,'Botble\\RealEstate\\Models\\Property','10km'),(7,42,'Botble\\RealEstate\\Models\\Property','3km'),(7,43,'Botble\\RealEstate\\Models\\Property','10km'),(7,44,'Botble\\RealEstate\\Models\\Property','16km'),(7,45,'Botble\\RealEstate\\Models\\Property','16km'),(7,46,'Botble\\RealEstate\\Models\\Property','13km'),(7,47,'Botble\\RealEstate\\Models\\Property','17km'),(7,48,'Botble\\RealEstate\\Models\\Property','14km'),(7,49,'Botble\\RealEstate\\Models\\Property','2km'),(7,50,'Botble\\RealEstate\\Models\\Property','13km'),(7,51,'Botble\\RealEstate\\Models\\Property','9km'),(7,52,'Botble\\RealEstate\\Models\\Property','6km'),(7,53,'Botble\\RealEstate\\Models\\Property','9km'),(7,54,'Botble\\RealEstate\\Models\\Property','12km'),(7,55,'Botble\\RealEstate\\Models\\Property','16km'),(7,56,'Botble\\RealEstate\\Models\\Property','20km'),(7,57,'Botble\\RealEstate\\Models\\Property','12km'),(7,58,'Botble\\RealEstate\\Models\\Property','12km'),(7,59,'Botble\\RealEstate\\Models\\Property','18km'),(7,60,'Botble\\RealEstate\\Models\\Property','8km'),(7,61,'Botble\\RealEstate\\Models\\Property','14km'),(8,1,'Botble\\RealEstate\\Models\\Project','4km'),(8,1,'Botble\\RealEstate\\Models\\Property','11km'),(8,2,'Botble\\RealEstate\\Models\\Project','13km'),(8,2,'Botble\\RealEstate\\Models\\Property','14km'),(8,3,'Botble\\RealEstate\\Models\\Project','4km'),(8,3,'Botble\\RealEstate\\Models\\Property','14km'),(8,4,'Botble\\RealEstate\\Models\\Project','2km'),(8,4,'Botble\\RealEstate\\Models\\Property','20km'),(8,5,'Botble\\RealEstate\\Models\\Project','10km'),(8,5,'Botble\\RealEstate\\Models\\Property','19km'),(8,6,'Botble\\RealEstate\\Models\\Project','8km'),(8,6,'Botble\\RealEstate\\Models\\Property','18km'),(8,7,'Botble\\RealEstate\\Models\\Project','15km'),(8,7,'Botble\\RealEstate\\Models\\Property','5km'),(8,8,'Botble\\RealEstate\\Models\\Project','14km'),(8,8,'Botble\\RealEstate\\Models\\Property','12km'),(8,9,'Botble\\RealEstate\\Models\\Project','11km'),(8,9,'Botble\\RealEstate\\Models\\Property','3km'),(8,10,'Botble\\RealEstate\\Models\\Project','2km'),(8,10,'Botble\\RealEstate\\Models\\Property','9km'),(8,11,'Botble\\RealEstate\\Models\\Project','18km'),(8,11,'Botble\\RealEstate\\Models\\Property','17km'),(8,12,'Botble\\RealEstate\\Models\\Project','4km'),(8,12,'Botble\\RealEstate\\Models\\Property','17km'),(8,13,'Botble\\RealEstate\\Models\\Project','14km'),(8,13,'Botble\\RealEstate\\Models\\Property','4km'),(8,14,'Botble\\RealEstate\\Models\\Project','7km'),(8,14,'Botble\\RealEstate\\Models\\Property','8km'),(8,15,'Botble\\RealEstate\\Models\\Project','9km'),(8,15,'Botble\\RealEstate\\Models\\Property','4km'),(8,16,'Botble\\RealEstate\\Models\\Project','6km'),(8,16,'Botble\\RealEstate\\Models\\Property','20km'),(8,17,'Botble\\RealEstate\\Models\\Project','1km'),(8,17,'Botble\\RealEstate\\Models\\Property','3km'),(8,18,'Botble\\RealEstate\\Models\\Project','2km'),(8,18,'Botble\\RealEstate\\Models\\Property','4km'),(8,19,'Botble\\RealEstate\\Models\\Property','14km'),(8,20,'Botble\\RealEstate\\Models\\Property','12km'),(8,21,'Botble\\RealEstate\\Models\\Property','6km'),(8,22,'Botble\\RealEstate\\Models\\Property','10km'),(8,23,'Botble\\RealEstate\\Models\\Property','17km'),(8,24,'Botble\\RealEstate\\Models\\Property','19km'),(8,25,'Botble\\RealEstate\\Models\\Property','19km'),(8,26,'Botble\\RealEstate\\Models\\Property','14km'),(8,27,'Botble\\RealEstate\\Models\\Property','9km'),(8,28,'Botble\\RealEstate\\Models\\Property','17km'),(8,29,'Botble\\RealEstate\\Models\\Property','16km'),(8,30,'Botble\\RealEstate\\Models\\Property','19km'),(8,31,'Botble\\RealEstate\\Models\\Property','14km'),(8,32,'Botble\\RealEstate\\Models\\Property','11km'),(8,33,'Botble\\RealEstate\\Models\\Property','10km'),(8,34,'Botble\\RealEstate\\Models\\Property','15km'),(8,35,'Botble\\RealEstate\\Models\\Property','20km'),(8,36,'Botble\\RealEstate\\Models\\Property','14km'),(8,37,'Botble\\RealEstate\\Models\\Property','4km'),(8,38,'Botble\\RealEstate\\Models\\Property','20km'),(8,39,'Botble\\RealEstate\\Models\\Property','7km'),(8,40,'Botble\\RealEstate\\Models\\Property','2km'),(8,41,'Botble\\RealEstate\\Models\\Property','4km'),(8,42,'Botble\\RealEstate\\Models\\Property','17km'),(8,43,'Botble\\RealEstate\\Models\\Property','10km'),(8,44,'Botble\\RealEstate\\Models\\Property','13km'),(8,45,'Botble\\RealEstate\\Models\\Property','7km'),(8,46,'Botble\\RealEstate\\Models\\Property','10km'),(8,47,'Botble\\RealEstate\\Models\\Property','11km'),(8,48,'Botble\\RealEstate\\Models\\Property','4km'),(8,49,'Botble\\RealEstate\\Models\\Property','15km'),(8,50,'Botble\\RealEstate\\Models\\Property','17km'),(8,51,'Botble\\RealEstate\\Models\\Property','20km'),(8,52,'Botble\\RealEstate\\Models\\Property','10km'),(8,53,'Botble\\RealEstate\\Models\\Property','17km'),(8,54,'Botble\\RealEstate\\Models\\Property','17km'),(8,55,'Botble\\RealEstate\\Models\\Property','18km'),(8,56,'Botble\\RealEstate\\Models\\Property','5km'),(8,57,'Botble\\RealEstate\\Models\\Property','8km'),(8,58,'Botble\\RealEstate\\Models\\Property','11km'),(8,59,'Botble\\RealEstate\\Models\\Property','2km'),(8,60,'Botble\\RealEstate\\Models\\Property','18km'),(8,61,'Botble\\RealEstate\\Models\\Property','17km'),(9,1,'Botble\\RealEstate\\Models\\Project','2km'),(9,1,'Botble\\RealEstate\\Models\\Property','16km'),(9,2,'Botble\\RealEstate\\Models\\Project','12km'),(9,2,'Botble\\RealEstate\\Models\\Property','10km'),(9,3,'Botble\\RealEstate\\Models\\Project','6km'),(9,3,'Botble\\RealEstate\\Models\\Property','18km'),(9,4,'Botble\\RealEstate\\Models\\Project','2km'),(9,4,'Botble\\RealEstate\\Models\\Property','2km'),(9,5,'Botble\\RealEstate\\Models\\Project','20km'),(9,5,'Botble\\RealEstate\\Models\\Property','19km'),(9,6,'Botble\\RealEstate\\Models\\Project','4km'),(9,6,'Botble\\RealEstate\\Models\\Property','18km'),(9,7,'Botble\\RealEstate\\Models\\Project','9km'),(9,7,'Botble\\RealEstate\\Models\\Property','4km'),(9,8,'Botble\\RealEstate\\Models\\Project','5km'),(9,8,'Botble\\RealEstate\\Models\\Property','6km'),(9,9,'Botble\\RealEstate\\Models\\Project','16km'),(9,9,'Botble\\RealEstate\\Models\\Property','3km'),(9,10,'Botble\\RealEstate\\Models\\Project','7km'),(9,10,'Botble\\RealEstate\\Models\\Property','20km'),(9,11,'Botble\\RealEstate\\Models\\Project','1km'),(9,11,'Botble\\RealEstate\\Models\\Property','10km'),(9,12,'Botble\\RealEstate\\Models\\Project','7km'),(9,12,'Botble\\RealEstate\\Models\\Property','4km'),(9,13,'Botble\\RealEstate\\Models\\Project','1km'),(9,13,'Botble\\RealEstate\\Models\\Property','11km'),(9,14,'Botble\\RealEstate\\Models\\Project','6km'),(9,14,'Botble\\RealEstate\\Models\\Property','14km'),(9,15,'Botble\\RealEstate\\Models\\Project','3km'),(9,15,'Botble\\RealEstate\\Models\\Property','18km'),(9,16,'Botble\\RealEstate\\Models\\Project','7km'),(9,16,'Botble\\RealEstate\\Models\\Property','2km'),(9,17,'Botble\\RealEstate\\Models\\Project','8km'),(9,17,'Botble\\RealEstate\\Models\\Property','18km'),(9,18,'Botble\\RealEstate\\Models\\Project','4km'),(9,18,'Botble\\RealEstate\\Models\\Property','9km'),(9,19,'Botble\\RealEstate\\Models\\Property','8km'),(9,20,'Botble\\RealEstate\\Models\\Property','19km'),(9,21,'Botble\\RealEstate\\Models\\Property','6km'),(9,22,'Botble\\RealEstate\\Models\\Property','17km'),(9,23,'Botble\\RealEstate\\Models\\Property','16km'),(9,24,'Botble\\RealEstate\\Models\\Property','18km'),(9,25,'Botble\\RealEstate\\Models\\Property','9km'),(9,26,'Botble\\RealEstate\\Models\\Property','1km'),(9,27,'Botble\\RealEstate\\Models\\Property','4km'),(9,28,'Botble\\RealEstate\\Models\\Property','4km'),(9,29,'Botble\\RealEstate\\Models\\Property','10km'),(9,30,'Botble\\RealEstate\\Models\\Property','2km'),(9,31,'Botble\\RealEstate\\Models\\Property','12km'),(9,32,'Botble\\RealEstate\\Models\\Property','3km'),(9,33,'Botble\\RealEstate\\Models\\Property','16km'),(9,34,'Botble\\RealEstate\\Models\\Property','14km'),(9,35,'Botble\\RealEstate\\Models\\Property','5km'),(9,36,'Botble\\RealEstate\\Models\\Property','14km'),(9,37,'Botble\\RealEstate\\Models\\Property','11km'),(9,38,'Botble\\RealEstate\\Models\\Property','18km'),(9,39,'Botble\\RealEstate\\Models\\Property','16km'),(9,40,'Botble\\RealEstate\\Models\\Property','7km'),(9,41,'Botble\\RealEstate\\Models\\Property','19km'),(9,42,'Botble\\RealEstate\\Models\\Property','3km'),(9,43,'Botble\\RealEstate\\Models\\Property','1km'),(9,44,'Botble\\RealEstate\\Models\\Property','7km'),(9,45,'Botble\\RealEstate\\Models\\Property','12km'),(9,46,'Botble\\RealEstate\\Models\\Property','13km'),(9,47,'Botble\\RealEstate\\Models\\Property','14km'),(9,48,'Botble\\RealEstate\\Models\\Property','12km'),(9,49,'Botble\\RealEstate\\Models\\Property','4km'),(9,50,'Botble\\RealEstate\\Models\\Property','14km'),(9,51,'Botble\\RealEstate\\Models\\Property','1km'),(9,52,'Botble\\RealEstate\\Models\\Property','9km'),(9,53,'Botble\\RealEstate\\Models\\Property','5km'),(9,54,'Botble\\RealEstate\\Models\\Property','11km'),(9,55,'Botble\\RealEstate\\Models\\Property','9km'),(9,56,'Botble\\RealEstate\\Models\\Property','12km'),(9,57,'Botble\\RealEstate\\Models\\Property','8km'),(9,58,'Botble\\RealEstate\\Models\\Property','10km'),(9,59,'Botble\\RealEstate\\Models\\Property','12km'),(9,60,'Botble\\RealEstate\\Models\\Property','3km'),(9,61,'Botble\\RealEstate\\Models\\Property','15km'),(10,1,'Botble\\RealEstate\\Models\\Project','10km'),(10,1,'Botble\\RealEstate\\Models\\Property','12km'),(10,2,'Botble\\RealEstate\\Models\\Project','3km'),(10,2,'Botble\\RealEstate\\Models\\Property','1km'),(10,3,'Botble\\RealEstate\\Models\\Project','18km'),(10,3,'Botble\\RealEstate\\Models\\Property','13km'),(10,4,'Botble\\RealEstate\\Models\\Project','2km'),(10,4,'Botble\\RealEstate\\Models\\Property','5km'),(10,5,'Botble\\RealEstate\\Models\\Project','2km'),(10,5,'Botble\\RealEstate\\Models\\Property','15km'),(10,6,'Botble\\RealEstate\\Models\\Project','2km'),(10,6,'Botble\\RealEstate\\Models\\Property','10km'),(10,7,'Botble\\RealEstate\\Models\\Project','10km'),(10,7,'Botble\\RealEstate\\Models\\Property','18km'),(10,8,'Botble\\RealEstate\\Models\\Project','12km'),(10,8,'Botble\\RealEstate\\Models\\Property','4km'),(10,9,'Botble\\RealEstate\\Models\\Project','13km'),(10,9,'Botble\\RealEstate\\Models\\Property','11km'),(10,10,'Botble\\RealEstate\\Models\\Project','18km'),(10,10,'Botble\\RealEstate\\Models\\Property','19km'),(10,11,'Botble\\RealEstate\\Models\\Project','11km'),(10,11,'Botble\\RealEstate\\Models\\Property','18km'),(10,12,'Botble\\RealEstate\\Models\\Project','3km'),(10,12,'Botble\\RealEstate\\Models\\Property','19km'),(10,13,'Botble\\RealEstate\\Models\\Project','4km'),(10,13,'Botble\\RealEstate\\Models\\Property','19km'),(10,14,'Botble\\RealEstate\\Models\\Project','20km'),(10,14,'Botble\\RealEstate\\Models\\Property','13km'),(10,15,'Botble\\RealEstate\\Models\\Project','4km'),(10,15,'Botble\\RealEstate\\Models\\Property','9km'),(10,16,'Botble\\RealEstate\\Models\\Project','1km'),(10,16,'Botble\\RealEstate\\Models\\Property','10km'),(10,17,'Botble\\RealEstate\\Models\\Project','11km'),(10,17,'Botble\\RealEstate\\Models\\Property','15km'),(10,18,'Botble\\RealEstate\\Models\\Project','13km'),(10,18,'Botble\\RealEstate\\Models\\Property','14km'),(10,19,'Botble\\RealEstate\\Models\\Property','2km'),(10,20,'Botble\\RealEstate\\Models\\Property','20km'),(10,21,'Botble\\RealEstate\\Models\\Property','10km'),(10,22,'Botble\\RealEstate\\Models\\Property','20km'),(10,23,'Botble\\RealEstate\\Models\\Property','20km'),(10,24,'Botble\\RealEstate\\Models\\Property','9km'),(10,25,'Botble\\RealEstate\\Models\\Property','1km'),(10,26,'Botble\\RealEstate\\Models\\Property','11km'),(10,27,'Botble\\RealEstate\\Models\\Property','5km'),(10,28,'Botble\\RealEstate\\Models\\Property','12km'),(10,29,'Botble\\RealEstate\\Models\\Property','13km'),(10,30,'Botble\\RealEstate\\Models\\Property','5km'),(10,31,'Botble\\RealEstate\\Models\\Property','5km'),(10,32,'Botble\\RealEstate\\Models\\Property','20km'),(10,33,'Botble\\RealEstate\\Models\\Property','13km'),(10,34,'Botble\\RealEstate\\Models\\Property','10km'),(10,35,'Botble\\RealEstate\\Models\\Property','1km'),(10,36,'Botble\\RealEstate\\Models\\Property','6km'),(10,37,'Botble\\RealEstate\\Models\\Property','7km'),(10,38,'Botble\\RealEstate\\Models\\Property','3km'),(10,39,'Botble\\RealEstate\\Models\\Property','20km'),(10,40,'Botble\\RealEstate\\Models\\Property','5km'),(10,41,'Botble\\RealEstate\\Models\\Property','11km'),(10,42,'Botble\\RealEstate\\Models\\Property','10km'),(10,43,'Botble\\RealEstate\\Models\\Property','16km'),(10,44,'Botble\\RealEstate\\Models\\Property','7km'),(10,45,'Botble\\RealEstate\\Models\\Property','18km'),(10,46,'Botble\\RealEstate\\Models\\Property','19km'),(10,47,'Botble\\RealEstate\\Models\\Property','14km'),(10,48,'Botble\\RealEstate\\Models\\Property','16km'),(10,49,'Botble\\RealEstate\\Models\\Property','14km'),(10,50,'Botble\\RealEstate\\Models\\Property','11km'),(10,51,'Botble\\RealEstate\\Models\\Property','16km'),(10,52,'Botble\\RealEstate\\Models\\Property','1km'),(10,53,'Botble\\RealEstate\\Models\\Property','17km'),(10,54,'Botble\\RealEstate\\Models\\Property','15km'),(10,55,'Botble\\RealEstate\\Models\\Property','5km'),(10,56,'Botble\\RealEstate\\Models\\Property','2km'),(10,57,'Botble\\RealEstate\\Models\\Property','8km'),(10,58,'Botble\\RealEstate\\Models\\Property','20km'),(10,59,'Botble\\RealEstate\\Models\\Property','10km'),(10,60,'Botble\\RealEstate\\Models\\Property','19km'),(10,61,'Botble\\RealEstate\\Models\\Property','20km'),(11,1,'Botble\\RealEstate\\Models\\Project','15km'),(11,1,'Botble\\RealEstate\\Models\\Property','14km'),(11,2,'Botble\\RealEstate\\Models\\Project','8km'),(11,2,'Botble\\RealEstate\\Models\\Property','3km'),(11,3,'Botble\\RealEstate\\Models\\Project','1km'),(11,3,'Botble\\RealEstate\\Models\\Property','17km'),(11,4,'Botble\\RealEstate\\Models\\Project','1km'),(11,4,'Botble\\RealEstate\\Models\\Property','15km'),(11,5,'Botble\\RealEstate\\Models\\Project','8km'),(11,5,'Botble\\RealEstate\\Models\\Property','4km'),(11,6,'Botble\\RealEstate\\Models\\Project','12km'),(11,6,'Botble\\RealEstate\\Models\\Property','12km'),(11,7,'Botble\\RealEstate\\Models\\Project','17km'),(11,7,'Botble\\RealEstate\\Models\\Property','5km'),(11,8,'Botble\\RealEstate\\Models\\Project','12km'),(11,8,'Botble\\RealEstate\\Models\\Property','3km'),(11,9,'Botble\\RealEstate\\Models\\Project','11km'),(11,9,'Botble\\RealEstate\\Models\\Property','18km'),(11,10,'Botble\\RealEstate\\Models\\Project','4km'),(11,10,'Botble\\RealEstate\\Models\\Property','2km'),(11,11,'Botble\\RealEstate\\Models\\Project','4km'),(11,11,'Botble\\RealEstate\\Models\\Property','5km'),(11,12,'Botble\\RealEstate\\Models\\Project','18km'),(11,12,'Botble\\RealEstate\\Models\\Property','15km'),(11,13,'Botble\\RealEstate\\Models\\Project','4km'),(11,13,'Botble\\RealEstate\\Models\\Property','11km'),(11,14,'Botble\\RealEstate\\Models\\Project','17km'),(11,14,'Botble\\RealEstate\\Models\\Property','7km'),(11,15,'Botble\\RealEstate\\Models\\Project','7km'),(11,15,'Botble\\RealEstate\\Models\\Property','13km'),(11,16,'Botble\\RealEstate\\Models\\Project','13km'),(11,16,'Botble\\RealEstate\\Models\\Property','13km'),(11,17,'Botble\\RealEstate\\Models\\Project','8km'),(11,17,'Botble\\RealEstate\\Models\\Property','13km'),(11,18,'Botble\\RealEstate\\Models\\Project','1km'),(11,18,'Botble\\RealEstate\\Models\\Property','10km'),(11,19,'Botble\\RealEstate\\Models\\Property','16km'),(11,20,'Botble\\RealEstate\\Models\\Property','9km'),(11,21,'Botble\\RealEstate\\Models\\Property','20km'),(11,22,'Botble\\RealEstate\\Models\\Property','3km'),(11,23,'Botble\\RealEstate\\Models\\Property','11km'),(11,24,'Botble\\RealEstate\\Models\\Property','8km'),(11,25,'Botble\\RealEstate\\Models\\Property','17km'),(11,26,'Botble\\RealEstate\\Models\\Property','3km'),(11,27,'Botble\\RealEstate\\Models\\Property','7km'),(11,28,'Botble\\RealEstate\\Models\\Property','11km'),(11,29,'Botble\\RealEstate\\Models\\Property','20km'),(11,30,'Botble\\RealEstate\\Models\\Property','9km'),(11,31,'Botble\\RealEstate\\Models\\Property','20km'),(11,32,'Botble\\RealEstate\\Models\\Property','5km'),(11,33,'Botble\\RealEstate\\Models\\Property','9km'),(11,34,'Botble\\RealEstate\\Models\\Property','7km'),(11,35,'Botble\\RealEstate\\Models\\Property','4km'),(11,36,'Botble\\RealEstate\\Models\\Property','16km'),(11,37,'Botble\\RealEstate\\Models\\Property','19km'),(11,38,'Botble\\RealEstate\\Models\\Property','2km'),(11,39,'Botble\\RealEstate\\Models\\Property','16km'),(11,40,'Botble\\RealEstate\\Models\\Property','3km'),(11,41,'Botble\\RealEstate\\Models\\Property','12km'),(11,42,'Botble\\RealEstate\\Models\\Property','6km'),(11,43,'Botble\\RealEstate\\Models\\Property','1km'),(11,44,'Botble\\RealEstate\\Models\\Property','18km'),(11,45,'Botble\\RealEstate\\Models\\Property','19km'),(11,46,'Botble\\RealEstate\\Models\\Property','3km'),(11,47,'Botble\\RealEstate\\Models\\Property','6km'),(11,48,'Botble\\RealEstate\\Models\\Property','10km'),(11,49,'Botble\\RealEstate\\Models\\Property','7km'),(11,50,'Botble\\RealEstate\\Models\\Property','4km'),(11,51,'Botble\\RealEstate\\Models\\Property','20km'),(11,52,'Botble\\RealEstate\\Models\\Property','16km'),(11,53,'Botble\\RealEstate\\Models\\Property','13km'),(11,54,'Botble\\RealEstate\\Models\\Property','7km'),(11,55,'Botble\\RealEstate\\Models\\Property','7km'),(11,56,'Botble\\RealEstate\\Models\\Property','14km'),(11,57,'Botble\\RealEstate\\Models\\Property','14km'),(11,58,'Botble\\RealEstate\\Models\\Property','6km'),(11,59,'Botble\\RealEstate\\Models\\Property','6km'),(11,60,'Botble\\RealEstate\\Models\\Property','19km'),(11,61,'Botble\\RealEstate\\Models\\Property','16km');
/*!40000 ALTER TABLE `re_facilities_distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_translations`
--

DROP TABLE IF EXISTS `re_facilities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_facilities_id`),
  KEY `idx_re_facilities_trans_fk` (`re_facilities_id`),
  KEY `idx_re_facilities_trans_fk_lang` (`re_facilities_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_translations`
--

LOCK TABLES `re_facilities_translations` WRITE;
/*!40000 ALTER TABLE `re_facilities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features`
--

DROP TABLE IF EXISTS `re_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features`
--

LOCK TABLES `re_features` WRITE;
/*!40000 ALTER TABLE `re_features` DISABLE KEYS */;
INSERT INTO `re_features` VALUES (1,'Wifi','ti ti-wifi','published'),(2,'Parking','ti ti-parking','published'),(3,'Swimming pool','ti ti-pool','published'),(4,'Balcony','ti ti-building-skyscraper','published'),(5,'Garden','ti ti-trees','published'),(6,'Security','ti ti-shield-lock','published'),(7,'Fitness center','ti ti-stretching','published'),(8,'Air Conditioning','ti ti-air-conditioning','published'),(9,'Central Heating','ti ti-thermometer','published'),(10,'Laundry Room','ti ti-wash-machine','published'),(11,'Pets Allow','ti ti-paw','published'),(12,'Spa & Massage','ti ti-bath','published');
/*!40000 ALTER TABLE `re_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features_translations`
--

DROP TABLE IF EXISTS `re_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_features_id`),
  KEY `idx_re_features_trans_fk` (`re_features_id`),
  KEY `idx_re_features_trans_fk_lang` (`re_features_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features_translations`
--

LOCK TABLES `re_features_translations` WRITE;
/*!40000 ALTER TABLE `re_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors`
--

DROP TABLE IF EXISTS `re_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors`
--

LOCK TABLES `re_investors` WRITE;
/*!40000 ALTER TABLE `re_investors` DISABLE KEYS */;
INSERT INTO `re_investors` VALUES (1,'National Pension Service','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(2,'Generali','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(3,'Temasek','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(4,'China Investment Corporation','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(5,'Government Pension Fund Global','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(6,'PSP Investments','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(7,'MEAG Munich ERGO','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(8,'HOOPP','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(9,'BT Group','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(10,'New York City ERS','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(11,'New Jersey Division of Investment','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(12,'State Super','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(13,'Shinkong','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL),(14,'Rest Super','published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,NULL);
/*!40000 ALTER TABLE `re_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors_translations`
--

DROP TABLE IF EXISTS `re_investors_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_investors_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_investors_id`),
  KEY `idx_re_investors_trans_fk` (`re_investors_id`),
  KEY `idx_re_investors_trans_fk_lang` (`re_investors_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors_translations`
--

LOCK TABLES `re_investors_translations` WRITE;
/*!40000 ALTER TABLE `re_investors_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_investors_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoice_items`
--

DROP TABLE IF EXISTS `re_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoice_items`
--

LOCK TABLES `re_invoice_items` WRITE;
/*!40000 ALTER TABLE `re_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoices`
--

DROP TABLE IF EXISTS `re_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_invoices_code_unique` (`code`),
  KEY `re_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `re_invoices_payment_id_index` (`payment_id`),
  KEY `re_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoices`
--

LOCK TABLES `re_invoices` WRITE;
/*!40000 ALTER TABLE `re_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages`
--

DROP TABLE IF EXISTS `re_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned NOT NULL DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `account_limit` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages`
--

LOCK TABLES `re_packages` WRITE;
/*!40000 ALTER TABLE `re_packages` DISABLE KEYS */;
INSERT INTO `re_packages` VALUES (1,'Free Trial',0,1,0,1,1,1,0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'[[{\"key\":\"text\",\"value\":\"Limited time trial period\"}],[{\"key\":\"text\",\"value\":\"1 listing allowed\"}],[{\"key\":\"text\",\"value\":\"Basic support\"}]]'),(2,'Basic Listing',250,1,0,1,5,2,1,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'[[{\"key\":\"text\",\"value\":\"1 listing allowed\"}],[{\"key\":\"text\",\"value\":\"5 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Basic support\"}]]'),(3,'Standard Package',1000,1,20,5,10,3,0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'[[{\"key\":\"text\",\"value\":\"5 listings allowed\"}],[{\"key\":\"text\",\"value\":\"10 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Priority support\"}]]'),(4,'Professional Package',1800,1,28,10,15,4,0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'[[{\"key\":\"text\",\"value\":\"10 listings allowed\"}],[{\"key\":\"text\",\"value\":\"15 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Premium support\"}],[{\"key\":\"text\",\"value\":\"Featured listings\"}]]'),(5,'Premium Package',2500,1,33,15,20,5,0,'published','2026-04-27 00:42:16','2026-04-27 00:42:16',NULL,'[[{\"key\":\"text\",\"value\":\"15 listings allowed\"}],[{\"key\":\"text\",\"value\":\"20 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Premium support\"}],[{\"key\":\"text\",\"value\":\"Featured listings\"}],[{\"key\":\"text\",\"value\":\"Priority listing placement\"}]]');
/*!40000 ALTER TABLE `re_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages_translations`
--

DROP TABLE IF EXISTS `re_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_packages_id`),
  KEY `idx_re_packages_trans_fk` (`re_packages_id`),
  KEY `idx_re_packages_trans_fk_lang` (`re_packages_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages_translations`
--

LOCK TABLES `re_packages_translations` WRITE;
/*!40000 ALTER TABLE `re_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_categories`
--

DROP TABLE IF EXISTS `re_project_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_categories` (
  `project_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`project_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_categories`
--

LOCK TABLES `re_project_categories` WRITE;
/*!40000 ALTER TABLE `re_project_categories` DISABLE KEYS */;
INSERT INTO `re_project_categories` VALUES (1,3),(1,4),(1,6),(2,2),(2,4),(2,6),(3,2),(3,3),(3,5),(4,1),(4,3),(4,5),(5,4),(5,5),(6,3),(7,2),(7,5),(7,6),(8,1),(8,5),(9,4),(10,2),(10,4),(11,1),(11,2),(11,6),(12,1),(13,2),(13,3),(14,4),(14,5),(15,2),(15,4),(16,2),(17,2),(18,2);
/*!40000 ALTER TABLE `re_project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_features`
--

DROP TABLE IF EXISTS `re_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_features` (
  `project_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_features`
--

LOCK TABLES `re_project_features` WRITE;
/*!40000 ALTER TABLE `re_project_features` DISABLE KEYS */;
INSERT INTO `re_project_features` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(2,1),(2,2),(2,3),(2,4),(2,6),(2,10),(2,11),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(4,1),(4,2),(4,3),(4,4),(4,5),(4,7),(4,8),(4,9),(4,10),(4,11),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),(5,11),(5,12),(6,3),(6,8),(6,9),(6,11),(6,12),(7,4),(7,5),(7,6),(7,8),(7,10),(7,11),(7,12),(8,4),(8,8),(8,9),(8,12),(9,2),(9,3),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,12),(10,2),(10,3),(10,9),(10,10),(10,11),(11,2),(11,3),(11,5),(11,9),(11,10),(11,11),(11,12),(12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(12,10),(12,11),(12,12),(13,2),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,11),(14,2),(14,4),(14,9),(14,10),(14,11),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7),(15,9),(15,10),(16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,9),(16,10),(17,1),(17,2),(17,7),(17,8),(17,9),(17,10),(17,12),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),(18,8),(18,9),(18,10),(18,11),(18,12);
/*!40000 ALTER TABLE `re_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects`
--

DROP TABLE IF EXISTS `re_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `floor_plans` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_id` bigint unsigned DEFAULT NULL,
  `number_block` int DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_priority` int DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`),
  KEY `idx_re_projects_status` (`status`),
  KEY `idx_re_projects_location` (`location`),
  KEY `idx_re_projects_city_status` (`city_id`,`status`),
  KEY `idx_re_projects_state_status` (`state_id`,`status`),
  KEY `idx_re_projects_featured_sort` (`is_featured`,`featured_priority`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects`
--

LOCK TABLES `re_projects` WRITE;
/*!40000 ALTER TABLE `re_projects` DISABLE KEYS */;
INSERT INTO `re_projects` VALUES (1,'Walnut Park Apartments','Luxury living redefined with world-class facilities, stunning architecture, and convenient access to urban conveniences.','This prestigious development represents the pinnacle of urban living, combining architectural excellence with practical functionality. Every aspect of this project has been carefully considered, from the grand entrance lobbies to the thoughtfully designed living spaces. The project features multiple building configurations to suit different lifestyles and preferences, all unified by consistent quality and aesthetic appeal. Residents benefit from comprehensive amenities including covered parking, 24/7 security, recreational facilities, and beautifully maintained common areas. The development is strategically located to offer easy access to major business districts, educational institutions, and entertainment venues while providing a peaceful retreat from city bustle. Our commitment to quality extends beyond construction to include attentive property management and responsive customer service. Whether you are seeking a primary residence or an investment property, this development offers exceptional value and lasting appeal.','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\"]',NULL,'600 Metropolitan Center, Business Hub',9,4,24,524,0,0,'2027-11-27','2025-05-27',170,1710,1,2,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.6053','-75.1524',NULL,1795,2,2,'JCHQNS',NULL),(2,'Sunshine Wonder Villas','A masterfully planned community offering diverse housing options with shared amenities and beautiful surroundings.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]',NULL,'75 Harbor Gateway, Waterfront Quarter',7,7,47,214,1,0,'2026-11-27','2025-10-27',8555,17909,1,5,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.895','-76.0597',NULL,2129,5,5,'P8NMAN',NULL),(3,'Diamond Island','An innovative mixed-use development combining residential comfort with commercial convenience in a vibrant community setting.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\"]',NULL,'180 Garden Terrace, Green Valley',11,9,1,706,1,0,'2027-06-27','2025-09-27',3189,8379,1,1,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','42.6173','-75.1468',NULL,6602,1,1,'OQN4S1',NULL),(4,'The Nassim','A masterfully planned community offering diverse housing options with shared amenities and beautiful surroundings.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'250 Parkview Boulevard, Central Heights',14,1,42,4102,0,0,'2028-04-27','2026-01-27',7208,13323,1,5,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.3246','-76.7414',NULL,8975,5,5,'GXEABW',NULL),(5,'Vinhomes Grand Park','Experience elevated living in this thoughtfully planned community featuring green spaces, modern homes, and premium amenities.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'180 Garden Terrace, Green Valley',13,10,33,3659,0,0,'2027-08-27','2025-06-27',5119,6053,1,5,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.2397','-76.0735',NULL,7879,5,5,'J9L73N',NULL),(6,'The Metropole Thu Thiem','A premier residential development offering modern living with exceptional amenities and thoughtful design in a prime location.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]',NULL,'600 Metropolitan Center, Business Hub',10,6,39,42,0,0,'2027-11-27','2026-03-27',6753,12269,1,3,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','42.8609','-75.7271',NULL,2014,3,3,'DY7J9K',NULL),(7,'Villa on Grand Avenue','A premier residential development offering modern living with exceptional amenities and thoughtful design in a prime location.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\"]',NULL,'180 Garden Terrace, Green Valley',6,6,49,71,0,0,'2026-11-27','2025-12-27',6727,13524,1,5,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.5472','-76.1592',NULL,5405,5,5,'7AET6N',NULL),(8,'Traditional Food Restaurant','Premium residences designed for discerning homeowners who appreciate quality, location, and lifestyle excellence.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'250 Parkview Boulevard, Central Heights',9,6,15,4413,1,0,'2028-05-27','2025-06-27',4908,7626,1,1,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.6237','-76.6091',NULL,4902,1,1,'LOKS0M',NULL),(9,'Villa on Hollywood Boulevard','Modern urban living at its finest with sleek design, smart features, and a commitment to sustainable development.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'320 Summit Road, Highland Park',8,1,44,770,0,0,'2027-08-27','2025-09-27',1286,11065,1,2,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.3059','-76.5295',NULL,9565,2,2,'WVOQBM',NULL),(10,'Office Space at Northwest 107th','A landmark development setting new standards for quality construction, sustainable design, and community living.','This prestigious development represents the pinnacle of urban living, combining architectural excellence with practical functionality. Every aspect of this project has been carefully considered, from the grand entrance lobbies to the thoughtfully designed living spaces. The project features multiple building configurations to suit different lifestyles and preferences, all unified by consistent quality and aesthetic appeal. Residents benefit from comprehensive amenities including covered parking, 24/7 security, recreational facilities, and beautifully maintained common areas. The development is strategically located to offer easy access to major business districts, educational institutions, and entertainment venues while providing a peaceful retreat from city bustle. Our commitment to quality extends beyond construction to include attentive property management and responsive customer service. Whether you are seeking a primary residence or an investment property, this development offers exceptional value and lasting appeal.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'320 Summit Road, Highland Park',10,7,7,2119,0,0,'2028-04-27','2025-08-27',5872,12429,1,3,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.068','-75.3302',NULL,836,3,3,'6FAPOG',NULL),(11,'Home in Merrick Way','A landmark development setting new standards for quality construction, sustainable design, and community living.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'75 Harbor Gateway, Waterfront Quarter',9,6,29,1607,1,0,'2028-02-27','2026-03-27',7723,10626,1,5,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.2258','-75.011',NULL,2284,5,5,'MLU0DK',NULL),(12,'Adarsh Greens','Luxury living redefined with world-class facilities, stunning architecture, and convenient access to urban conveniences.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'400 Skyline Avenue, Downtown Core',7,2,1,310,0,0,'2028-02-27','2025-07-27',9821,11624,1,6,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','42.5093','-75.1002',NULL,3344,6,6,'W8726K',NULL),(13,'Rustomjee Evershine Global City','A masterfully planned community offering diverse housing options with shared amenities and beautiful surroundings.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'100 Innovation Drive, Tech District',6,4,38,1539,1,0,'2026-10-27','2026-03-27',2180,9991,1,3,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.1442','-76.1427',NULL,6457,3,3,'37VNND',NULL),(14,'Godrej Exquisite','Luxury living redefined with world-class facilities, stunning architecture, and convenient access to urban conveniences.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\"]',NULL,'50 Riverside Way, Marina District',3,4,44,4169,1,0,'2026-10-27','2025-12-27',6492,7727,1,6,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.1677','-75.1205',NULL,6084,6,6,'3RRQJM',NULL),(15,'Godrej Prime','An innovative mixed-use development combining residential comfort with commercial convenience in a vibrant community setting.','Discover a new standard of community living in this thoughtfully designed development project. Spanning multiple phases, this ambitious project creates a self-contained neighborhood with all the conveniences of modern life. The architectural design draws inspiration from contemporary trends while incorporating timeless elements that ensure lasting appeal. Residents enjoy exclusive access to premium amenities including clubhouse facilities, sports courts, children play areas, and jogging trails. The development places strong emphasis on green spaces and environmental sustainability, with extensive landscaping and eco-friendly building systems. The location offers strategic advantages including proximity to employment centers, quality schools, healthcare facilities, and shopping destinations. Our development team brings decades of experience in creating successful residential communities, ensuring that every detail meets the highest standards. This is more than a place to live – it is a community designed for life.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'600 Metropolitan Center, Business Hub',13,6,33,2273,1,0,'2028-10-27','2025-07-27',5270,13785,1,3,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.0544','-76.3178',NULL,8706,3,3,'GTWVVG',NULL),(16,'PS Panache','An innovative mixed-use development combining residential comfort with commercial convenience in a vibrant community setting.','This prestigious development represents the pinnacle of urban living, combining architectural excellence with practical functionality. Every aspect of this project has been carefully considered, from the grand entrance lobbies to the thoughtfully designed living spaces. The project features multiple building configurations to suit different lifestyles and preferences, all unified by consistent quality and aesthetic appeal. Residents benefit from comprehensive amenities including covered parking, 24/7 security, recreational facilities, and beautifully maintained common areas. The development is strategically located to offer easy access to major business districts, educational institutions, and entertainment venues while providing a peaceful retreat from city bustle. Our commitment to quality extends beyond construction to include attentive property management and responsive customer service. Whether you are seeking a primary residence or an investment property, this development offers exceptional value and lasting appeal.','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]',NULL,'600 Metropolitan Center, Business Hub',3,3,27,3663,0,0,'2027-04-27','2025-07-27',8073,14960,1,5,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.2809','-75.7647',NULL,4969,5,5,'DWMDCE',NULL),(17,'Upturn Atmiya Centria','Premium residences designed for discerning homeowners who appreciate quality, location, and lifestyle excellence.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]',NULL,'400 Skyline Avenue, Downtown Core',11,8,15,4854,1,0,'2027-05-27','2026-01-27',7108,11691,1,1,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','43.3142','-74.8045',NULL,5880,1,1,'9PB8ZW',NULL),(18,'Brigade Oasis','Premium residences designed for discerning homeowners who appreciate quality, location, and lifestyle excellence.','Welcome to our flagship development project, a masterfully planned community that sets new standards for modern living. This exceptional project features a diverse range of residential options, from cozy apartments to spacious family homes, all designed with attention to detail and quality construction. Residents enjoy access to world-class amenities including a state-of-the-art fitness center, swimming pools, landscaped gardens, and community gathering spaces. The development incorporates sustainable building practices and energy-efficient systems, reflecting our commitment to environmental responsibility. Located in a prime area with excellent connectivity to schools, shopping centers, healthcare facilities, and public transportation, this project offers the perfect balance of convenience and tranquility. Our experienced development team has created a community where families can thrive, professionals can unwind, and investors can expect strong returns. With flexible payment plans and competitive pricing, this is an opportunity not to be missed.','[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\"]',NULL,'400 Skyline Avenue, Downtown Core',8,10,39,2697,1,0,'2027-07-27','2025-12-27',2043,7164,1,4,'selling',1,'Botble\\ACL\\Models\\User','2026-04-27 00:42:20','2026-04-27 00:42:20','42.5444','-75.7772',NULL,1275,4,4,'Z8RZPA',NULL);
/*!40000 ALTER TABLE `re_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects_translations`
--

DROP TABLE IF EXISTS `re_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_plans` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_projects_id`),
  KEY `idx_re_projects_trans_proj_lang` (`re_projects_id`,`lang_code`),
  KEY `idx_re_projects_trans_location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects_translations`
--

LOCK TABLES `re_projects_translations` WRITE;
/*!40000 ALTER TABLE `re_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties`
--

DROP TABLE IF EXISTS `re_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `floor_plans` longtext COLLATE utf8mb4_unicode_ci,
  `project_id` bigint unsigned DEFAULT '0',
  `number_bedroom` decimal(8,1) DEFAULT '0.0',
  `number_bathroom` decimal(8,1) DEFAULT '0.0',
  `number_floor` int DEFAULT NULL,
  `square` double DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `featured_priority` int DEFAULT '0',
  `city_id` bigint unsigned DEFAULT NULL,
  `period` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reject_reason` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`),
  KEY `idx_re_properties_status` (`status`),
  KEY `idx_re_properties_location` (`location`),
  KEY `idx_re_properties_city_status` (`city_id`,`status`),
  KEY `idx_re_properties_state_status` (`state_id`,`status`),
  KEY `idx_re_properties_featured_sort` (`is_featured`,`featured_priority`,`created_at`),
  KEY `idx_re_properties_moderation_status` (`moderation_status`),
  KEY `idx_re_properties_expire_date` (`expire_date`),
  KEY `idx_re_properties_type` (`type`),
  KEY `idx_re_properties_never_expired` (`never_expired`),
  KEY `idx_re_properties_mod_status` (`moderation_status`,`status`),
  KEY `idx_re_properties_price` (`price`),
  KEY `idx_re_properties_square` (`square`),
  KEY `idx_re_properties_bedroom` (`number_bedroom`),
  KEY `idx_re_properties_bathroom` (`number_bathroom`),
  KEY `idx_re_properties_floor` (`number_floor`),
  KEY `idx_re_properties_project_id` (`project_id`),
  KEY `idx_re_properties_author` (`author_id`,`author_type`),
  KEY `idx_re_properties_country_id` (`country_id`),
  KEY `idx_re_properties_currency_id` (`currency_id`),
  KEY `idx_re_properties_active_featured_sort` (`moderation_status`,`status`,`expire_date`,`never_expired`,`is_featured`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties`
--

LOCK TABLES `re_properties` WRITE;
/*!40000 ALTER TABLE `re_properties` DISABLE KEYS */;
INSERT INTO `re_properties` VALUES (1,'3 Beds Villa Calpe, Alicante','sale','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','789 Pine Road, Garden Quarter','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',6,10.0,4.0,60,790,654900.00,NULL,1,0,3,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-15',0,1,'2026-04-27 00:42:20','2026-04-27 00:42:20','42.6592','-76.7242',NULL,634,3,3,'EAGAM7',NULL),(2,'Lavida Plus Office-tel 1 Bedroom','sale','Stunning property offering panoramic views and luxurious finishes. Every detail has been carefully considered in this exceptional home.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','258 Spruce Court, Valley Green','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',8,10.0,7.0,5,290,574200.00,NULL,1,0,3,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-13',0,1,'2026-04-27 00:42:20','2026-04-27 00:42:20','43.1154','-76.0864',NULL,51285,3,3,'OAWIVT',NULL),(3,'Vinhomes Grand Park Studio 1 Bedroom','rent','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','258 Spruce Court, Valley Green','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,6.0,4.0,59,870,119900.00,NULL,1,0,2,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-05',0,1,'2026-04-27 00:42:20','2026-04-27 00:42:20','42.8462','-75.513',NULL,72551,2,2,'M6ZIXZ',NULL),(4,'The Sun Avenue Office-tel 1 Bedroom','sale','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',7,4.0,10.0,53,690,794400.00,NULL,1,0,5,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-27',0,1,'2026-04-27 00:42:20','2026-04-27 00:42:20','43.5714','-75.9445',NULL,79585,5,5,'98U6QB',NULL),(5,'Property For sale, Johannesburg, South Africa','sale','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','987 Elm Drive, Mountain View','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,4.0,10.0,34,430,121200.00,NULL,0,0,2,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-05-08',0,1,'2026-04-27 00:42:20','2026-04-27 00:42:20','43.9433','-76.2825',NULL,20633,2,2,'YKDKWK',NULL),(6,'Stunning French Inspired Manor','rent','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','147 Willow Way, Harbor Point','[\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',16,6.0,9.0,42,770,328800.00,NULL,0,0,1,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-01-23',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.9722','-76.5683',NULL,2167,1,1,'7PIPDK',NULL),(7,'Villa for sale at Bermuda Dunes','rent','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','147 Willow Way, Harbor Point','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',5,2.0,7.0,63,930,908000.00,NULL,1,0,3,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-21',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.0052','-76.6655',NULL,30343,3,3,'2FTJEZ',NULL),(8,'Walnut Park Apartment','sale','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','654 Birch Boulevard, Sunset Hills','[\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,9.0,7.0,82,420,167500.00,NULL,0,0,2,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-02-19',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.667','-76.5539',NULL,24755,2,2,'W2OBCB',NULL),(9,'5 beds luxury house','rent','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','789 Pine Road, Garden Quarter','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',16,10.0,4.0,31,50,357800.00,NULL,1,0,3,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-14',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.932','-74.9882',NULL,87592,3,3,'LNMDWH',NULL),(10,'Family Victorian \"View\" Home','sale','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','654 Birch Boulevard, Sunset Hills','[\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,9.0,3.0,68,50,588800.00,NULL,1,0,3,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-05-09',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.0078','-75.2058',NULL,1827,3,3,'TKYJ0H',NULL),(11,'Osaka Heights Apartment','rent','Spacious and bright residence with an excellent layout for modern living. Move-in ready with all appliances included.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','147 Willow Way, Harbor Point','[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,10.0,9.0,55,610,44500.00,NULL,1,0,3,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-29',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.9995','-76.5794',NULL,66120,3,3,'YFIH9T',NULL),(12,'Private Estate Magnificent Views','sale','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','258 Spruce Court, Valley Green','[\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',11,4.0,4.0,51,70,335100.00,NULL,1,0,5,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-03-07',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.7792','-75.6757',NULL,32949,5,5,'F64HSS',NULL),(13,'Thompson Road House for rent','rent','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','987 Elm Drive, Mountain View','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',10,3.0,7.0,79,110,600700.00,NULL,0,0,1,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-09-16',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.2083','-75.3016',NULL,82249,1,1,'VSFQXN',NULL),(14,'Brand New 1 Bedroom Apartment In First Class Location','sale','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','258 Spruce Court, Valley Green','[\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',16,9.0,9.0,48,320,848200.00,NULL,1,0,2,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-05-30',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.2341','-74.8722',NULL,49897,2,2,'LGJ0DR',NULL),(15,'Elegant family home presents premium modern living','sale','Prime real estate opportunity in a desirable neighborhood. This property combines location, quality, and value perfectly.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','369 Ash Circle, Meadow Springs','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,5.0,6.0,100,180,707200.00,NULL,1,0,1,'month','selling',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-10',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6022','-76.1901',NULL,75117,1,1,'ESXDLJ',NULL),(16,'Luxury Apartments in Singapore for Sale','rent','Stunning property offering panoramic views and luxurious finishes. Every detail has been carefully considered in this exceptional home.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','456 Maple Avenue, Downtown District','[\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',6,10.0,5.0,14,430,23900.00,NULL,0,0,1,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-12-25',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.2772','-75.1554',NULL,40365,1,1,'KSCAVG',NULL),(17,'5 room luxury penthouse for sale in Kuala Lumpur','sale','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',6,2.0,3.0,81,550,903100.00,NULL,0,0,3,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-12-09',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.4505','-74.9554',NULL,40861,3,3,'BJ0EDJ',NULL),(18,'2 Floor house in Compound Pejaten Barat Kemang','rent','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','369 Ash Circle, Meadow Springs','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',11,5.0,4.0,23,330,454900.00,NULL,1,0,1,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-11-19',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43','-75.8647',NULL,37926,1,1,'XKIZZJ',NULL),(19,'Apartment Muiderstraatweg in Diemen','sale','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','369 Ash Circle, Meadow Springs','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,3.0,10.0,35,370,900600.00,NULL,0,0,2,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-01-03',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.8458','-74.9569',NULL,66886,2,2,'0RV5DH',NULL),(20,'Nice Apartment for rent in Berlin','rent','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','654 Birch Boulevard, Sunset Hills','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,1.0,1.0,1,330,625200.00,NULL,0,0,5,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-11-23',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.2075','-76.6296',NULL,90937,5,5,'VRRJPK',NULL),(21,'Pumpkin Key - Private Island','rent','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','654 Birch Boulevard, Sunset Hills','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',5,2.0,3.0,28,550,375100.00,NULL,1,0,3,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-01-17',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.632','-76.4524',NULL,26879,3,3,'XBCURW',NULL),(22,'Maplewood Estates','rent','Beautiful property featuring modern design and premium finishes throughout. This stunning home offers an open floor plan perfect for entertaining.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','789 Pine Road, Garden Quarter','[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',5,2.0,8.0,20,160,310600.00,NULL,0,0,6,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-09-02',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.8869','-74.9195',NULL,40986,6,6,'RWGOXM',NULL),(23,'Pine Ridge Manor','sale','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','258 Spruce Court, Valley Green','[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,1.0,1.0,82,120,418200.00,NULL,0,0,4,'month','selling',8,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-09-07',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.1774','-75.1587',NULL,12048,4,4,'QLZZHC',NULL),(24,'Oak Hill Residences','rent','Spacious and bright residence with an excellent layout for modern living. Move-in ready with all appliances included.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','654 Birch Boulevard, Sunset Hills','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,6.0,7.0,93,410,275500.00,NULL,0,0,1,'month','renting',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-24',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6628','-75.7611',NULL,99863,1,1,'YN5PI8',NULL),(25,'Sunnybrook Villas','rent','Prime real estate opportunity in a desirable neighborhood. This property combines location, quality, and value perfectly.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','741 Hickory Place, Forest Glen','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',18,6.0,8.0,18,180,455300.00,NULL,1,0,6,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-02-20',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.8308','-75.1747',NULL,49128,6,6,'OSGLC0',NULL),(26,'Riverstone Condominiums','sale','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','123 Oak Street, Riverside Heights','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',11,7.0,5.0,50,110,574000.00,NULL,1,0,5,'month','selling',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-09-07',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.6309','-75.0071',NULL,95345,5,5,'5NQSFP',NULL),(27,'Cedar Park Apartments','sale','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','123 Oak Street, Riverside Heights','[\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',10,4.0,4.0,75,890,347700.00,NULL,1,0,3,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-12',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.8253','-76.5131',NULL,40339,3,3,'CO7FAJ',NULL),(28,'Lakeside Retreat','rent','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',16,1.0,5.0,64,380,854900.00,NULL,0,0,2,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-29',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.2309','-76.2421',NULL,53337,2,2,'S3ELD2',NULL),(29,'Willow Creek Homes','rent','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','123 Oak Street, Riverside Heights','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',6,10.0,3.0,49,80,740800.00,NULL,0,0,5,'month','renting',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-05-14',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.9063','-76.4676',NULL,58631,5,5,'LTKS0F',NULL),(30,'Grandview Heights','rent','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','654 Birch Boulevard, Sunset Hills','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,9.0,2.0,25,210,645200.00,NULL,0,0,3,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-03-26',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6787','-74.9259',NULL,92699,3,3,'KDUAEK',NULL),(31,'Forest Glen Cottages','sale','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','789 Pine Road, Garden Quarter','[\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',7,9.0,9.0,74,240,897400.00,NULL,0,0,3,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-16',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.9704','-75.1144',NULL,84513,3,3,'BDSD3V',NULL),(32,'Harborview Towers','rent','Prime real estate opportunity in a desirable neighborhood. This property combines location, quality, and value perfectly.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','147 Willow Way, Harbor Point','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,5.0,4.0,64,610,953100.00,NULL,1,0,2,'month','renting',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-17',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.5768','-75.5564',NULL,36449,2,2,'JJP9ZV',NULL),(33,'Meadowlands Estates','sale','Spacious and bright residence with an excellent layout for modern living. Move-in ready with all appliances included.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','456 Maple Avenue, Downtown District','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',9,9.0,1.0,73,490,549400.00,NULL,1,0,4,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-29',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.9176','-75.1776',NULL,91034,4,4,'0FA7QH',NULL),(34,'Highland Meadows','rent','Beautiful property featuring modern design and premium finishes throughout. This stunning home offers an open floor plan perfect for entertaining.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','741 Hickory Place, Forest Glen','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',18,2.0,5.0,64,770,652400.00,NULL,1,0,1,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-03-27',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6621','-74.7753',NULL,81838,1,1,'MJZCI4',NULL),(35,'Brookfield Gardens','rent','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','741 Hickory Place, Forest Glen','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,5.0,9.0,41,640,875300.00,NULL,0,0,6,'month','renting',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-06-29',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.7787','-75.092',NULL,75168,6,6,'2HHW53',NULL),(36,'Silverwood Villas','sale','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','789 Pine Road, Garden Quarter','[\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',10,2.0,8.0,33,460,381000.00,NULL,1,0,6,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-09-20',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.1344','-76.254',NULL,47724,6,6,'X36CPQ',NULL),(37,'Evergreen Terrace','sale','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','369 Ash Circle, Meadow Springs','[\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',16,8.0,9.0,42,310,476400.00,NULL,0,0,2,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-12-28',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.6954','-76.1534',NULL,14740,2,2,'5RVA1J',NULL),(38,'Golden Gate Residences','sale','Charming property with spacious rooms and abundant natural light. The well-maintained garden adds to the appeal of this lovely home.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','147 Willow Way, Harbor Point','[\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,9.0,3.0,8,440,616600.00,NULL,0,0,3,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-02',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.2378','-75.9066',NULL,27812,3,3,'LIIU2R',NULL),(39,'Spring Blossom Park','rent','Spacious and bright residence with an excellent layout for modern living. Move-in ready with all appliances included.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','258 Spruce Court, Valley Green','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',4,5.0,3.0,83,130,367000.00,NULL,1,0,5,'month','renting',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-30',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.6746','-75.1025',NULL,23115,5,5,'8EFHJU',NULL),(40,'Horizon Pointe','sale','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','369 Ash Circle, Meadow Springs','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,9.0,3.0,61,680,958100.00,NULL,0,0,3,'month','selling',3,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-01-30',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.9095','-75.4493',NULL,35450,3,3,'ORIS3K',NULL),(41,'Whispering Pines Lodge','sale','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','456 Maple Avenue, Downtown District','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,9.0,2.0,55,320,407600.00,NULL,0,0,6,'month','selling',10,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-03-08',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.7589','-76.6044',NULL,36178,6,6,'VG8Y0W',NULL),(42,'Sunset Ridge','sale','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','369 Ash Circle, Meadow Springs','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',2,1.0,9.0,87,260,940000.00,NULL,0,0,4,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-02-14',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6295','-76.3622',NULL,12980,4,4,'4HZVOM',NULL),(43,'Timberline Estates','sale','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,3.0,1.0,62,930,495300.00,NULL,1,0,6,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-01-04',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.9129','-75.8343',NULL,65811,6,6,'1APP4B',NULL),(44,'Crystal Lake Condos','sale','Beautiful property featuring modern design and premium finishes throughout. This stunning home offers an open floor plan perfect for entertaining.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','369 Ash Circle, Meadow Springs','[\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',8,8.0,2.0,1,570,448000.00,NULL,1,0,4,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-20',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.8317','-75.7976',NULL,88037,4,4,'7X26QH',NULL),(45,'Briarwood Apartments','sale','Prime real estate opportunity in a desirable neighborhood. This property combines location, quality, and value perfectly.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','456 Maple Avenue, Downtown District','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,4.0,6.0,97,920,970500.00,NULL,1,0,4,'month','selling',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-06-19',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.0885','-75.7249',NULL,60119,4,4,'MAVUZ8',NULL),(46,'Summit View','sale','Prime real estate opportunity in a desirable neighborhood. This property combines location, quality, and value perfectly.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,8.0,3.0,10,890,712700.00,NULL,0,0,2,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-02-14',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.4068','-75.1414',NULL,62059,2,2,'O7BUQI',NULL),(47,'Elmwood Park','rent','Prime real estate opportunity in a desirable neighborhood. This property combines location, quality, and value perfectly.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','321 Cedar Lane, Lakeside Park','[\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',6,2.0,3.0,27,1000,517600.00,NULL,1,0,5,'month','renting',12,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-14',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.7838','-75.549',NULL,19880,5,5,'ORJ554',NULL),(48,'Stonegate Homes','rent','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','741 Hickory Place, Forest Glen','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',2,5.0,1.0,56,90,224700.00,NULL,0,0,2,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-06-09',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.1179','-76.1872',NULL,64162,2,2,'RQBH5F',NULL),(49,'Rosewood Villas','sale','Beautiful property featuring modern design and premium finishes throughout. This stunning home offers an open floor plan perfect for entertaining.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','147 Willow Way, Harbor Point','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',12,2.0,4.0,86,930,296200.00,NULL,1,0,1,'month','selling',8,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-11-09',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.7104','-75.083',NULL,79134,1,1,'FBDATP',NULL),(50,'Prairie Meadows','sale','Beautiful property featuring modern design and premium finishes throughout. This stunning home offers an open floor plan perfect for entertaining.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','456 Maple Avenue, Downtown District','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,2.0,8.0,13,1000,546900.00,NULL,0,0,2,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-01',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6599','-75.4209',NULL,54183,2,2,'OQKXXZ',NULL),(51,'Hawthorne Heights','rent','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','147 Willow Way, Harbor Point','[\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',3,9.0,6.0,14,310,763900.00,NULL,0,0,3,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-03-31',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.4892','-76.1889',NULL,91430,3,3,'MPRWKM',NULL),(52,'Sierra Vista','rent','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','369 Ash Circle, Meadow Springs','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',1,9.0,3.0,98,20,864700.00,NULL,0,0,5,'month','renting',5,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-03-27',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.0506','-76.4641',NULL,84274,5,5,'77WXBD',NULL),(53,'Autumn Leaves','rent','Exceptional residence in a prime location with easy access to schools, shopping, and public transportation. Recently renovated with high-end fixtures.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',2,4.0,5.0,70,140,491500.00,NULL,0,0,6,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-11-09',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.6206','-76.0892',NULL,12123,6,6,'E2RDSW',NULL),(54,'Blue Sky Residences','sale','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','321 Cedar Lane, Lakeside Park','[\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,1.0,4.0,10,700,757900.00,NULL,0,0,2,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-10-06',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.5964','-75.6657',NULL,96547,2,2,'C2DT00',NULL),(55,'Pebble Creek','rent','Elegant home with timeless architecture and thoughtful design elements. Perfect for families seeking comfort and style.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','369 Ash Circle, Meadow Springs','[\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',10,10.0,8.0,86,390,116800.00,NULL,1,0,4,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-02-21',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.7401','-74.9174',NULL,89541,4,4,'6BTQVU',NULL),(56,'Magnolia Manor','rent','Beautiful property featuring modern design and premium finishes throughout. This stunning home offers an open floor plan perfect for entertaining.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','369 Ash Circle, Meadow Springs','[\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',15,1.0,4.0,43,540,131200.00,NULL,1,0,5,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-07-19',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.9041','-75.6142',NULL,301,5,5,'UTOCPM',NULL),(57,'Cherry Blossom Estates','sale','Inviting home with a warm atmosphere and practical layout. The outdoor space is perfect for relaxation and entertainment.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','456 Maple Avenue, Downtown District','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,9.0,3.0,3,10,554100.00,NULL,1,0,4,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-12-02',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.9704','-75.8333',NULL,84595,4,4,'8ZOH5M',NULL),(58,'Windsor Park','rent','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','741 Hickory Place, Forest Glen','[\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',14,10.0,4.0,86,380,349100.00,NULL,1,0,3,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-09-23',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6252','-76.1566',NULL,29602,3,3,'WEIHYJ',NULL),(59,'Seaside Villas','rent','Spacious and bright residence with an excellent layout for modern living. Move-in ready with all appliances included.','Welcome to this exceptional property that redefines modern living. From the moment you enter, you will be captivated by the attention to detail and quality craftsmanship evident throughout. The open-concept living area flows seamlessly into the gourmet kitchen, featuring premium appliances, quartz countertops, and custom cabinetry. Large windows flood the space with natural light while offering views of the beautifully landscaped surroundings. The primary suite is a true retreat, complete with a spa-like bathroom and generous walk-in closet. Additional bedrooms are well-appointed, perfect for family members or guests. The outdoor living space extends your entertaining options with a covered patio and mature landscaping. Located in a sought-after neighborhood with excellent schools, convenient shopping, and easy highway access, this property offers the perfect combination of comfort, style, and location.','741 Hickory Place, Forest Glen','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',13,9.0,5.0,71,660,365200.00,NULL,0,0,3,'month','renting',1,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-12-07',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','43.26','-74.9276',NULL,84944,3,3,'6QDSYJ',NULL),(60,'Mountain View Retreat','sale','Contemporary living at its finest. This property boasts state-of-the-art amenities and a sleek, modern aesthetic throughout.','Discover your dream home in this beautifully appointed property that combines classic elegance with modern convenience. The grand entryway sets the tone for the sophisticated living spaces that follow. Gleaming hardwood floors flow throughout the main level, connecting the formal living room, dining area, and family room. The updated kitchen is a chef delight with granite counters, stainless steel appliances, and a breakfast nook overlooking the garden. Upstairs, the spacious primary suite features a sitting area, walk-in closet, and renovated bathroom. Additional bedrooms provide flexibility for family, guests, or a home office. The finished lower level offers extra living space for recreation or entertainment. Outside, mature trees provide privacy while the manicured lawn and garden beds enhance curb appeal. This is a rare opportunity to own a property that offers both character and modern updates.','321 Cedar Lane, Lakeside Park','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,4.0,1.0,15,900,66500.00,NULL,0,0,6,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2027-02-08',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.5905','-75.0052',NULL,5192,6,6,'KCKDAA',NULL),(61,'Amberwood Apartments','sale','Meticulously maintained property with upgrades throughout. Features include hardwood floors, granite countertops, and stainless appliances.','This stunning residence offers an unparalleled living experience in one of the most desirable locations. The thoughtfully designed floor plan maximizes space and functionality while maintaining an elegant aesthetic. Upon entering, you are greeted by soaring ceilings and an abundance of natural light that highlights the premium finishes throughout. The chef-inspired kitchen features top-of-the-line appliances, a large center island, and ample storage. The living areas are perfect for both intimate gatherings and large-scale entertaining. Each bedroom is generously sized with excellent closet space. The primary suite includes a luxurious bathroom with dual vanities, a soaking tub, and a separate shower. Outside, the property boasts professional landscaping, a private backyard, and a covered outdoor entertaining area. Smart home features, energy-efficient systems, and a two-car garage complete this exceptional offering.','147 Willow Way, Harbor Point','[\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\"]','[{\"name\":{\"key\":\"name\",\"value\":\"First Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"3\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"2\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}},{\"name\":{\"key\":\"name\",\"value\":\"Second Floor\"},\"bedrooms\":{\"key\":\"bedrooms\",\"value\":\"2\"},\"bathrooms\":{\"key\":\"bathrooms\",\"value\":\"1\"},\"image\":{\"key\":\"image\",\"value\":\"properties\\/floor.png\"}}]',17,6.0,6.0,89,650,197800.00,NULL,1,0,1,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved',NULL,'2026-08-17',0,1,'2026-04-27 00:42:21','2026-04-27 00:42:21','42.6895','-76.3509',NULL,50921,1,1,'BHREJX',NULL);
/*!40000 ALTER TABLE `re_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties_translations`
--

DROP TABLE IF EXISTS `re_properties_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floor_plans` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_properties_id`),
  KEY `idx_re_properties_trans_prop_lang` (`re_properties_id`,`lang_code`),
  KEY `idx_re_properties_trans_location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties_translations`
--

LOCK TABLES `re_properties_translations` WRITE;
/*!40000 ALTER TABLE `re_properties_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_properties_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_categories`
--

DROP TABLE IF EXISTS `re_property_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_categories` (
  `property_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`property_id`,`category_id`),
  KEY `idx_property_categories_property_id` (`property_id`),
  KEY `idx_property_categories_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_categories`
--

LOCK TABLES `re_property_categories` WRITE;
/*!40000 ALTER TABLE `re_property_categories` DISABLE KEYS */;
INSERT INTO `re_property_categories` VALUES (1,5),(2,1),(2,2),(2,6),(3,5),(4,3),(5,1),(5,5),(5,6),(6,2),(6,4),(6,5),(7,1),(7,3),(8,2),(9,3),(10,2),(10,5),(10,6),(11,2),(12,4),(13,1),(13,2),(14,3),(15,1),(15,2),(16,2),(16,5),(17,2),(17,4),(17,5),(18,6),(19,5),(20,1),(20,2),(20,6),(21,1),(21,2),(22,2),(23,1),(23,4),(23,5),(24,4),(25,3),(25,6),(26,4),(27,3),(27,5),(27,6),(28,6),(29,1),(29,2),(29,5),(30,3),(31,2),(31,6),(32,2),(32,6),(33,2),(33,5),(34,6),(35,3),(35,6),(36,5),(36,6),(37,4),(37,5),(37,6),(38,4),(38,5),(39,1),(39,4),(40,3),(41,4),(42,3),(43,3),(43,5),(44,3),(44,4),(45,1),(45,3),(45,6),(46,2),(47,1),(47,5),(48,5),(48,6),(49,5),(50,1),(50,2),(51,1),(51,3),(51,4),(52,4),(53,2),(53,3),(54,2),(54,3),(54,4),(55,1),(55,5),(56,5),(57,1),(57,3),(57,4),(58,2),(58,3),(58,6),(59,1),(59,5),(60,1),(60,4),(61,2),(61,4);
/*!40000 ALTER TABLE `re_property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_features`
--

DROP TABLE IF EXISTS `re_property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_features` (
  `property_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL,
  KEY `idx_property_features_property_id` (`property_id`),
  KEY `idx_property_features_feature_id` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_features`
--

LOCK TABLES `re_property_features` WRITE;
/*!40000 ALTER TABLE `re_property_features` DISABLE KEYS */;
INSERT INTO `re_property_features` VALUES (1,1),(1,2),(1,3),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,12),(2,1),(2,2),(2,3),(2,5),(2,6),(2,8),(2,9),(2,10),(2,11),(2,12),(3,3),(3,5),(3,7),(3,8),(3,10),(3,12),(4,1),(4,2),(4,4),(4,5),(4,6),(4,7),(4,10),(4,11),(4,12),(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,10),(5,11),(5,12),(6,1),(6,4),(6,7),(6,9),(6,11),(6,12),(7,2),(7,3),(7,5),(7,11),(8,2),(8,3),(8,4),(8,5),(8,7),(8,8),(8,9),(8,10),(8,12),(9,1),(9,3),(9,4),(9,5),(9,6),(9,8),(9,11),(10,3),(10,7),(10,8),(10,9),(10,10),(11,1),(11,2),(11,3),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(11,12),(12,1),(12,3),(12,5),(12,6),(12,7),(12,8),(12,9),(12,10),(12,11),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(14,2),(14,6),(14,8),(14,10),(15,1),(15,5),(15,6),(15,7),(15,8),(15,10),(15,11),(16,1),(16,2),(16,3),(16,6),(16,8),(16,10),(16,11),(16,12),(17,4),(17,5),(17,6),(17,7),(17,8),(17,9),(17,10),(17,11),(18,3),(18,9),(18,10),(18,12),(19,2),(19,3),(19,4),(19,5),(19,6),(20,1),(20,2),(20,3),(20,4),(20,5),(20,6),(20,7),(20,8),(20,9),(20,10),(20,11),(20,12),(21,1),(21,4),(21,5),(21,7),(21,8),(22,1),(22,3),(22,4),(22,7),(22,8),(22,12),(23,3),(23,6),(23,7),(23,11),(24,1),(24,2),(24,3),(24,4),(24,5),(24,6),(24,7),(24,8),(24,9),(24,10),(24,11),(24,12),(25,2),(25,7),(25,8),(25,10),(25,11),(25,12),(26,1),(26,2),(26,3),(26,4),(26,5),(26,6),(26,7),(26,8),(26,10),(27,7),(27,9),(27,10),(27,11),(27,12),(28,3),(28,7),(28,8),(28,10),(28,11),(29,1),(29,2),(29,4),(29,5),(29,6),(29,7),(29,8),(29,9),(29,10),(29,11),(29,12),(30,1),(30,2),(30,3),(30,4),(30,5),(30,6),(30,7),(30,8),(30,9),(30,10),(30,11),(30,12),(31,1),(31,5),(31,8),(31,10),(31,11),(32,4),(32,6),(32,7),(32,12),(33,1),(33,2),(33,3),(33,4),(33,5),(33,6),(33,7),(33,8),(33,9),(33,10),(33,11),(33,12),(34,3),(34,6),(34,7),(34,8),(35,1),(35,2),(35,7),(35,8),(35,10),(36,4),(36,7),(36,8),(36,10),(36,11),(37,2),(37,3),(37,4),(37,5),(37,8),(37,9),(37,11),(37,12),(38,6),(38,9),(38,10),(38,12),(39,1),(39,4),(39,5),(39,6),(39,7),(39,8),(39,9),(39,10),(39,11),(39,12),(40,1),(40,2),(40,3),(40,4),(40,5),(40,6),(40,7),(40,8),(40,9),(40,10),(40,11),(40,12),(41,1),(41,2),(41,3),(41,4),(41,5),(41,6),(41,7),(41,8),(41,9),(41,10),(41,11),(41,12),(42,1),(42,3),(42,4),(42,6),(42,7),(42,9),(42,10),(42,11),(43,6),(43,7),(43,10),(43,11),(44,1),(44,2),(44,3),(44,5),(44,6),(44,7),(44,9),(44,10),(44,11),(45,2),(45,3),(45,4),(45,5),(45,7),(45,10),(45,12),(46,3),(46,4),(46,5),(46,6),(46,7),(46,8),(46,9),(46,11),(46,12),(47,1),(47,2),(47,3),(47,4),(47,5),(47,6),(47,7),(47,8),(47,9),(47,10),(47,11),(47,12),(48,2),(48,4),(48,5),(48,7),(48,8),(48,9),(48,10),(48,11),(49,1),(49,2),(49,3),(49,4),(49,6),(49,7),(49,8),(49,9),(49,10),(49,12),(50,1),(50,2),(50,4),(50,5),(50,8),(51,1),(51,2),(51,3),(51,4),(51,6),(51,7),(51,9),(51,11),(52,2),(52,5),(52,7),(52,12),(53,1),(53,6),(53,9),(53,10),(53,11),(54,3),(54,4),(54,5),(54,6),(54,7),(54,8),(54,9),(54,10),(54,11),(54,12),(55,2),(55,3),(55,9),(55,10),(55,11),(56,1),(56,2),(56,3),(56,5),(56,10),(57,1),(57,2),(57,3),(57,4),(57,5),(57,6),(57,7),(57,8),(57,9),(57,10),(57,11),(57,12),(58,2),(58,3),(58,5),(58,8),(58,11),(58,12),(59,1),(59,4),(59,5),(59,6),(59,7),(59,12),(60,1),(60,2),(60,3),(60,4),(60,5),(60,6),(60,7),(60,8),(60,9),(60,10),(60,11),(60,12),(61,1),(61,4),(61,5),(61,6),(61,7),(61,8),(61,9),(61,10);
/*!40000 ALTER TABLE `re_property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_reviews`
--

DROP TABLE IF EXISTS `re_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `reviewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `idx_reviews_reviewable_status` (`reviewable_type`,`reviewable_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_reviews`
--

LOCK TABLES `re_reviews` WRITE;
/*!40000 ALTER TABLE `re_reviews` DISABLE KEYS */;
INSERT INTO `re_reviews` VALUES (1,12,'Botble\\RealEstate\\Models\\Property',27,5,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-01-07 00:42:25','2026-04-27 00:42:25'),(2,4,'Botble\\RealEstate\\Models\\Project',12,4,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(3,6,'Botble\\RealEstate\\Models\\Property',43,5,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2025-12-28 00:42:25','2026-04-27 00:42:25'),(4,8,'Botble\\RealEstate\\Models\\Project',15,4,'The project completion ahead of schedule shows excellent project management.','approved','2026-01-22 00:42:25','2026-04-27 00:42:25'),(5,10,'Botble\\RealEstate\\Models\\Property',10,5,'The property has great resale potential. Smart investment for the future.','approved','2026-01-10 00:42:25','2026-04-27 00:42:25'),(6,3,'Botble\\RealEstate\\Models\\Project',4,1,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-04-19 00:42:25','2026-04-27 00:42:25'),(7,9,'Botble\\RealEstate\\Models\\Property',16,5,'The property photos were accurate and the space is even better in person. Move-in ready and professionally cleaned.','approved','2026-02-27 00:42:25','2026-04-27 00:42:25'),(8,12,'Botble\\RealEstate\\Models\\Project',13,2,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-02-03 00:42:25','2026-04-27 00:42:25'),(9,6,'Botble\\RealEstate\\Models\\Property',8,3,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-02-19 00:42:25','2026-04-27 00:42:25'),(10,11,'Botble\\RealEstate\\Models\\Project',13,1,'The project has excellent connectivity to major roads and public transportation.','approved','2026-02-08 00:42:25','2026-04-27 00:42:25'),(11,6,'Botble\\RealEstate\\Models\\Property',57,2,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-04-22 00:42:25','2026-04-27 00:42:25'),(12,2,'Botble\\RealEstate\\Models\\Project',9,4,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-01-26 00:42:25','2026-04-27 00:42:25'),(13,9,'Botble\\RealEstate\\Models\\Property',44,3,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-02-24 00:42:25','2026-04-27 00:42:25'),(14,2,'Botble\\RealEstate\\Models\\Project',4,2,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-03-24 00:42:25','2026-04-27 00:42:25'),(15,4,'Botble\\RealEstate\\Models\\Property',37,2,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(16,10,'Botble\\RealEstate\\Models\\Project',1,3,'This development project has exceeded all expectations. The architects have done an amazing job balancing aesthetics with functionality.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(17,8,'Botble\\RealEstate\\Models\\Property',52,4,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2025-12-30 00:42:25','2026-04-27 00:42:25'),(18,12,'Botble\\RealEstate\\Models\\Project',16,3,'Security features throughout the project are state-of-the-art. Feel safe living here.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(19,6,'Botble\\RealEstate\\Models\\Property',46,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(20,11,'Botble\\RealEstate\\Models\\Project',17,2,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(21,5,'Botble\\RealEstate\\Models\\Property',28,3,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(22,4,'Botble\\RealEstate\\Models\\Project',8,1,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-03-29 00:42:25','2026-04-27 00:42:25'),(24,11,'Botble\\RealEstate\\Models\\Project',11,2,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-01-07 00:42:25','2026-04-27 00:42:25'),(25,8,'Botble\\RealEstate\\Models\\Property',43,3,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(26,11,'Botble\\RealEstate\\Models\\Project',2,2,'The project completion ahead of schedule shows excellent project management.','approved','2026-03-11 00:42:25','2026-04-27 00:42:25'),(27,7,'Botble\\RealEstate\\Models\\Property',4,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-08 00:42:25','2026-04-27 00:42:25'),(28,5,'Botble\\RealEstate\\Models\\Project',6,3,'Security features throughout the project are state-of-the-art. Feel safe living here.','approved','2026-02-13 00:42:25','2026-04-27 00:42:25'),(29,3,'Botble\\RealEstate\\Models\\Property',44,2,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-01-22 00:42:25','2026-04-27 00:42:25'),(30,8,'Botble\\RealEstate\\Models\\Project',3,2,'Energy-efficient design reduces monthly utility costs significantly.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(31,7,'Botble\\RealEstate\\Models\\Property',32,1,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-02-14 00:42:25','2026-04-27 00:42:25'),(32,3,'Botble\\RealEstate\\Models\\Project',1,1,'The project has excellent connectivity to major roads and public transportation.','approved','2026-03-31 00:42:25','2026-04-27 00:42:25'),(33,10,'Botble\\RealEstate\\Models\\Property',13,1,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-02-04 00:42:25','2026-04-27 00:42:25'),(34,11,'Botble\\RealEstate\\Models\\Project',5,4,'The project completion ahead of schedule shows excellent project management.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(35,12,'Botble\\RealEstate\\Models\\Property',28,3,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-01-13 00:42:25','2026-04-27 00:42:25'),(36,4,'Botble\\RealEstate\\Models\\Project',11,3,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-01-02 00:42:25','2026-04-27 00:42:25'),(37,4,'Botble\\RealEstate\\Models\\Property',48,1,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(38,12,'Botble\\RealEstate\\Models\\Project',18,1,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(39,3,'Botble\\RealEstate\\Models\\Property',26,3,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(40,3,'Botble\\RealEstate\\Models\\Project',7,1,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-09 00:42:25','2026-04-27 00:42:25'),(41,7,'Botble\\RealEstate\\Models\\Property',2,2,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(43,12,'Botble\\RealEstate\\Models\\Property',45,1,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(44,2,'Botble\\RealEstate\\Models\\Project',16,2,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2025-12-30 00:42:25','2026-04-27 00:42:25'),(45,5,'Botble\\RealEstate\\Models\\Property',9,3,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(46,5,'Botble\\RealEstate\\Models\\Project',16,3,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-04-24 00:42:25','2026-04-27 00:42:25'),(47,11,'Botble\\RealEstate\\Models\\Property',61,4,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2025-12-29 00:42:25','2026-04-27 00:42:25'),(48,12,'Botble\\RealEstate\\Models\\Project',3,3,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-02-08 00:42:25','2026-04-27 00:42:25'),(49,10,'Botble\\RealEstate\\Models\\Property',9,3,'The property has great resale potential. Smart investment for the future.','approved','2026-04-17 00:42:25','2026-04-27 00:42:25'),(50,7,'Botble\\RealEstate\\Models\\Project',13,2,'The project has excellent connectivity to major roads and public transportation.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(51,6,'Botble\\RealEstate\\Models\\Property',9,4,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2025-12-30 00:42:25','2026-04-27 00:42:25'),(52,2,'Botble\\RealEstate\\Models\\Project',13,2,'The project has enhanced property values in the entire area.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(53,11,'Botble\\RealEstate\\Models\\Property',35,3,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(54,1,'Botble\\RealEstate\\Models\\Project',12,1,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-03-10 00:42:25','2026-04-27 00:42:25'),(55,2,'Botble\\RealEstate\\Models\\Property',12,3,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-04-17 00:42:25','2026-04-27 00:42:25'),(56,3,'Botble\\RealEstate\\Models\\Project',3,5,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-02-28 00:42:25','2026-04-27 00:42:25'),(57,6,'Botble\\RealEstate\\Models\\Property',47,4,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(59,3,'Botble\\RealEstate\\Models\\Property',56,2,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-02-18 00:42:25','2026-04-27 00:42:25'),(60,7,'Botble\\RealEstate\\Models\\Project',6,5,'The project has enhanced property values in the entire area.','approved','2026-04-03 00:42:25','2026-04-27 00:42:25'),(61,2,'Botble\\RealEstate\\Models\\Property',20,4,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-04-15 00:42:25','2026-04-27 00:42:25'),(62,3,'Botble\\RealEstate\\Models\\Project',18,5,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-03-10 00:42:25','2026-04-27 00:42:25'),(63,4,'Botble\\RealEstate\\Models\\Property',38,2,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-02-03 00:42:25','2026-04-27 00:42:25'),(64,3,'Botble\\RealEstate\\Models\\Project',2,4,'Security features throughout the project are state-of-the-art. Feel safe living here.','approved','2026-04-05 00:42:25','2026-04-27 00:42:25'),(65,2,'Botble\\RealEstate\\Models\\Property',22,3,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-22 00:42:25','2026-04-27 00:42:25'),(66,4,'Botble\\RealEstate\\Models\\Project',14,4,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-02-06 00:42:25','2026-04-27 00:42:25'),(67,8,'Botble\\RealEstate\\Models\\Property',61,5,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-03-07 00:42:25','2026-04-27 00:42:25'),(68,11,'Botble\\RealEstate\\Models\\Project',9,5,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(69,3,'Botble\\RealEstate\\Models\\Property',41,1,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(70,8,'Botble\\RealEstate\\Models\\Project',10,5,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(72,9,'Botble\\RealEstate\\Models\\Project',4,2,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(73,5,'Botble\\RealEstate\\Models\\Property',47,4,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-03-10 00:42:25','2026-04-27 00:42:25'),(74,6,'Botble\\RealEstate\\Models\\Project',17,5,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-01-19 00:42:25','2026-04-27 00:42:25'),(75,7,'Botble\\RealEstate\\Models\\Property',20,2,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-02-12 00:42:25','2026-04-27 00:42:25'),(76,5,'Botble\\RealEstate\\Models\\Project',12,3,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-03-25 00:42:25','2026-04-27 00:42:25'),(77,5,'Botble\\RealEstate\\Models\\Property',22,1,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-02 00:42:25','2026-04-27 00:42:25'),(78,5,'Botble\\RealEstate\\Models\\Project',13,4,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(79,7,'Botble\\RealEstate\\Models\\Property',22,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-01-22 00:42:25','2026-04-27 00:42:25'),(81,12,'Botble\\RealEstate\\Models\\Property',56,1,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-01-04 00:42:25','2026-04-27 00:42:25'),(82,7,'Botble\\RealEstate\\Models\\Project',11,1,'Pet-friendly project with designated areas for dogs and cats.','approved','2026-04-14 00:42:25','2026-04-27 00:42:25'),(83,11,'Botble\\RealEstate\\Models\\Property',58,4,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(84,9,'Botble\\RealEstate\\Models\\Project',16,1,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-01-31 00:42:25','2026-04-27 00:42:25'),(85,6,'Botble\\RealEstate\\Models\\Property',53,5,'The property has great resale potential. Smart investment for the future.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(86,5,'Botble\\RealEstate\\Models\\Project',10,3,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-03-26 00:42:25','2026-04-27 00:42:25'),(87,6,'Botble\\RealEstate\\Models\\Property',29,1,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(88,1,'Botble\\RealEstate\\Models\\Project',4,2,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-01-13 00:42:25','2026-04-27 00:42:25'),(89,9,'Botble\\RealEstate\\Models\\Property',41,4,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(90,12,'Botble\\RealEstate\\Models\\Project',5,3,'Pet-friendly project with designated areas for dogs and cats.','approved','2026-04-05 00:42:25','2026-04-27 00:42:25'),(91,1,'Botble\\RealEstate\\Models\\Property',9,3,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-02-18 00:42:25','2026-04-27 00:42:25'),(92,10,'Botble\\RealEstate\\Models\\Project',15,3,'The project completion ahead of schedule shows excellent project management.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(93,4,'Botble\\RealEstate\\Models\\Property',4,1,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-01-23 00:42:25','2026-04-27 00:42:25'),(94,6,'Botble\\RealEstate\\Models\\Project',15,5,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(95,11,'Botble\\RealEstate\\Models\\Property',12,5,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-04-19 00:42:25','2026-04-27 00:42:25'),(96,10,'Botble\\RealEstate\\Models\\Project',6,2,'Impressive project with top-notch facilities. The developers have clearly prioritized quality over quantity.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(97,3,'Botble\\RealEstate\\Models\\Property',20,4,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-04-05 00:42:25','2026-04-27 00:42:25'),(98,6,'Botble\\RealEstate\\Models\\Project',8,4,'The project completion ahead of schedule shows excellent project management.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(99,8,'Botble\\RealEstate\\Models\\Property',29,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(100,11,'Botble\\RealEstate\\Models\\Project',3,1,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(101,8,'Botble\\RealEstate\\Models\\Property',54,1,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(103,6,'Botble\\RealEstate\\Models\\Property',45,3,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(104,7,'Botble\\RealEstate\\Models\\Project',4,3,'Sustainable building practices were used throughout this project. Appreciate the eco-friendly approach.','approved','2026-02-12 00:42:25','2026-04-27 00:42:25'),(105,12,'Botble\\RealEstate\\Models\\Property',19,5,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-01-09 00:42:25','2026-04-27 00:42:25'),(106,12,'Botble\\RealEstate\\Models\\Project',12,5,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2026-02-07 00:42:25','2026-04-27 00:42:25'),(107,7,'Botble\\RealEstate\\Models\\Property',39,3,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(108,9,'Botble\\RealEstate\\Models\\Project',14,2,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-02-17 00:42:25','2026-04-27 00:42:25'),(109,12,'Botble\\RealEstate\\Models\\Property',61,2,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-01-21 00:42:25','2026-04-27 00:42:25'),(110,7,'Botble\\RealEstate\\Models\\Project',15,2,'The project has won multiple awards for its design and sustainability features.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(113,11,'Botble\\RealEstate\\Models\\Property',51,1,'The property photos were accurate and the space is even better in person. Move-in ready and professionally cleaned.','approved','2026-01-10 00:42:25','2026-04-27 00:42:25'),(115,10,'Botble\\RealEstate\\Models\\Property',3,5,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(116,4,'Botble\\RealEstate\\Models\\Project',18,3,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-02-15 00:42:25','2026-04-27 00:42:25'),(117,1,'Botble\\RealEstate\\Models\\Property',6,1,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-02-19 00:42:25','2026-04-27 00:42:25'),(119,8,'Botble\\RealEstate\\Models\\Property',12,3,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-03-01 00:42:25','2026-04-27 00:42:25'),(120,4,'Botble\\RealEstate\\Models\\Project',7,3,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-03-24 00:42:25','2026-04-27 00:42:25'),(121,8,'Botble\\RealEstate\\Models\\Property',45,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-04-03 00:42:25','2026-04-27 00:42:25'),(122,9,'Botble\\RealEstate\\Models\\Project',17,3,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(123,4,'Botble\\RealEstate\\Models\\Property',50,5,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-01-09 00:42:25','2026-04-27 00:42:25'),(124,11,'Botble\\RealEstate\\Models\\Project',16,3,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-01-09 00:42:25','2026-04-27 00:42:25'),(125,5,'Botble\\RealEstate\\Models\\Property',25,1,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(126,6,'Botble\\RealEstate\\Models\\Project',11,4,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2025-12-31 00:42:25','2026-04-27 00:42:25'),(127,6,'Botble\\RealEstate\\Models\\Property',15,4,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(128,9,'Botble\\RealEstate\\Models\\Project',10,2,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(129,3,'Botble\\RealEstate\\Models\\Property',59,1,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(130,6,'Botble\\RealEstate\\Models\\Project',13,1,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(131,8,'Botble\\RealEstate\\Models\\Property',20,1,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-03-12 00:42:25','2026-04-27 00:42:25'),(132,2,'Botble\\RealEstate\\Models\\Project',14,1,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-04-06 00:42:25','2026-04-27 00:42:25'),(133,5,'Botble\\RealEstate\\Models\\Property',19,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-05 00:42:25','2026-04-27 00:42:25'),(134,6,'Botble\\RealEstate\\Models\\Project',1,2,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-03-26 00:42:25','2026-04-27 00:42:25'),(135,5,'Botble\\RealEstate\\Models\\Property',50,4,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-03-29 00:42:25','2026-04-27 00:42:25'),(136,10,'Botble\\RealEstate\\Models\\Project',17,4,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2026-04-17 00:42:25','2026-04-27 00:42:25'),(137,4,'Botble\\RealEstate\\Models\\Property',6,5,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-03-25 00:42:25','2026-04-27 00:42:25'),(138,7,'Botble\\RealEstate\\Models\\Project',14,1,'Energy-efficient design reduces monthly utility costs significantly.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(139,10,'Botble\\RealEstate\\Models\\Property',44,5,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-04 00:42:25','2026-04-27 00:42:25'),(140,3,'Botble\\RealEstate\\Models\\Project',15,2,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(141,2,'Botble\\RealEstate\\Models\\Property',6,2,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-01-11 00:42:25','2026-04-27 00:42:25'),(143,9,'Botble\\RealEstate\\Models\\Property',52,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(145,4,'Botble\\RealEstate\\Models\\Property',19,1,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-02-04 00:42:25','2026-04-27 00:42:25'),(146,12,'Botble\\RealEstate\\Models\\Project',4,1,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(147,4,'Botble\\RealEstate\\Models\\Property',39,5,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-01-09 00:42:25','2026-04-27 00:42:25'),(148,11,'Botble\\RealEstate\\Models\\Project',15,2,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-02-12 00:42:25','2026-04-27 00:42:25'),(150,10,'Botble\\RealEstate\\Models\\Project',9,1,'Security features throughout the project are state-of-the-art. Feel safe living here.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(151,10,'Botble\\RealEstate\\Models\\Property',51,3,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(152,8,'Botble\\RealEstate\\Models\\Project',5,3,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-02-13 00:42:25','2026-04-27 00:42:25'),(153,8,'Botble\\RealEstate\\Models\\Property',46,2,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-04-21 00:42:25','2026-04-27 00:42:25'),(154,7,'Botble\\RealEstate\\Models\\Project',3,2,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-01-15 00:42:25','2026-04-27 00:42:25'),(155,12,'Botble\\RealEstate\\Models\\Property',29,3,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-03-18 00:42:25','2026-04-27 00:42:25'),(156,12,'Botble\\RealEstate\\Models\\Project',15,5,'The project has won multiple awards for its design and sustainability features.','approved','2026-04-12 00:42:25','2026-04-27 00:42:25'),(157,9,'Botble\\RealEstate\\Models\\Property',50,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(158,11,'Botble\\RealEstate\\Models\\Project',18,4,'The project has won multiple awards for its design and sustainability features.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(159,12,'Botble\\RealEstate\\Models\\Property',50,1,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(161,11,'Botble\\RealEstate\\Models\\Property',49,3,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-04-01 00:42:25','2026-04-27 00:42:25'),(163,10,'Botble\\RealEstate\\Models\\Property',1,5,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(164,1,'Botble\\RealEstate\\Models\\Project',2,5,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-15 00:42:25','2026-04-27 00:42:25'),(165,7,'Botble\\RealEstate\\Models\\Property',37,3,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-31 00:42:25','2026-04-27 00:42:25'),(167,9,'Botble\\RealEstate\\Models\\Property',19,5,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-01-19 00:42:25','2026-04-27 00:42:25'),(169,2,'Botble\\RealEstate\\Models\\Property',61,3,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(171,12,'Botble\\RealEstate\\Models\\Property',21,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(173,12,'Botble\\RealEstate\\Models\\Property',41,2,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-04-08 00:42:25','2026-04-27 00:42:25'),(174,2,'Botble\\RealEstate\\Models\\Project',8,3,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-03-31 00:42:25','2026-04-27 00:42:25'),(175,3,'Botble\\RealEstate\\Models\\Property',47,5,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2025-12-31 00:42:25','2026-04-27 00:42:25'),(177,12,'Botble\\RealEstate\\Models\\Property',42,5,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-04-09 00:42:25','2026-04-27 00:42:25'),(178,8,'Botble\\RealEstate\\Models\\Project',12,3,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-04-21 00:42:25','2026-04-27 00:42:25'),(179,10,'Botble\\RealEstate\\Models\\Property',40,4,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-03-01 00:42:25','2026-04-27 00:42:25'),(181,12,'Botble\\RealEstate\\Models\\Property',30,1,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-01-24 00:42:25','2026-04-27 00:42:25'),(183,4,'Botble\\RealEstate\\Models\\Property',60,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-01-30 00:42:25','2026-04-27 00:42:25'),(185,6,'Botble\\RealEstate\\Models\\Property',30,2,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(187,3,'Botble\\RealEstate\\Models\\Property',13,2,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-01-17 00:42:25','2026-04-27 00:42:25'),(188,7,'Botble\\RealEstate\\Models\\Project',10,3,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-03-02 00:42:25','2026-04-27 00:42:25'),(189,10,'Botble\\RealEstate\\Models\\Property',37,4,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(190,5,'Botble\\RealEstate\\Models\\Project',7,2,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(191,1,'Botble\\RealEstate\\Models\\Property',36,2,'The property has great resale potential. Smart investment for the future.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(192,6,'Botble\\RealEstate\\Models\\Project',18,1,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-01-11 00:42:25','2026-04-27 00:42:25'),(194,11,'Botble\\RealEstate\\Models\\Project',14,4,'This development project has exceeded all expectations. The architects have done an amazing job balancing aesthetics with functionality.','approved','2026-03-26 00:42:25','2026-04-27 00:42:25'),(195,10,'Botble\\RealEstate\\Models\\Property',30,3,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-02-01 00:42:25','2026-04-27 00:42:25'),(196,7,'Botble\\RealEstate\\Models\\Project',12,2,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(197,2,'Botble\\RealEstate\\Models\\Property',35,5,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(198,7,'Botble\\RealEstate\\Models\\Project',18,5,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(200,1,'Botble\\RealEstate\\Models\\Project',5,3,'The rooftop amenities are a standout feature of this project. Great views and relaxation spaces.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(201,11,'Botble\\RealEstate\\Models\\Property',55,3,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(202,12,'Botble\\RealEstate\\Models\\Project',7,5,'Sustainable building practices were used throughout this project. Appreciate the eco-friendly approach.','approved','2025-12-30 00:42:25','2026-04-27 00:42:25'),(203,7,'Botble\\RealEstate\\Models\\Property',53,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(204,11,'Botble\\RealEstate\\Models\\Project',10,1,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(205,4,'Botble\\RealEstate\\Models\\Property',46,3,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-01 00:42:25','2026-04-27 00:42:25'),(206,12,'Botble\\RealEstate\\Models\\Project',2,5,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-04-24 00:42:25','2026-04-27 00:42:25'),(208,2,'Botble\\RealEstate\\Models\\Project',10,3,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-04-09 00:42:25','2026-04-27 00:42:25'),(209,7,'Botble\\RealEstate\\Models\\Property',41,2,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-04-02 00:42:25','2026-04-27 00:42:25'),(211,2,'Botble\\RealEstate\\Models\\Property',28,5,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(212,10,'Botble\\RealEstate\\Models\\Project',18,4,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-04-11 00:42:25','2026-04-27 00:42:25'),(214,4,'Botble\\RealEstate\\Models\\Project',5,1,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(215,9,'Botble\\RealEstate\\Models\\Property',33,4,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2025-12-31 00:42:25','2026-04-27 00:42:25'),(217,1,'Botble\\RealEstate\\Models\\Property',47,4,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(218,8,'Botble\\RealEstate\\Models\\Project',9,5,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(221,4,'Botble\\RealEstate\\Models\\Property',18,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-04-08 00:42:25','2026-04-27 00:42:25'),(223,8,'Botble\\RealEstate\\Models\\Property',59,3,'The property has great resale potential. Smart investment for the future.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(225,6,'Botble\\RealEstate\\Models\\Property',42,3,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(226,5,'Botble\\RealEstate\\Models\\Project',14,4,'The developer provided excellent after-sales service. Any snags were fixed promptly.','approved','2026-02-25 00:42:25','2026-04-27 00:42:25'),(227,7,'Botble\\RealEstate\\Models\\Property',23,1,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(228,3,'Botble\\RealEstate\\Models\\Project',14,2,'The project completion ahead of schedule shows excellent project management.','approved','2026-01-27 00:42:25','2026-04-27 00:42:25'),(229,8,'Botble\\RealEstate\\Models\\Property',3,5,'The property has great resale potential. Smart investment for the future.','approved','2026-03-04 00:42:25','2026-04-27 00:42:25'),(231,6,'Botble\\RealEstate\\Models\\Property',6,1,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-25 00:42:25','2026-04-27 00:42:25'),(234,5,'Botble\\RealEstate\\Models\\Project',3,5,'The project has won multiple awards for its design and sustainability features.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(235,4,'Botble\\RealEstate\\Models\\Property',58,1,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-04-21 00:42:25','2026-04-27 00:42:25'),(236,4,'Botble\\RealEstate\\Models\\Project',9,4,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(237,11,'Botble\\RealEstate\\Models\\Property',31,3,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-01-19 00:42:25','2026-04-27 00:42:25'),(238,9,'Botble\\RealEstate\\Models\\Project',1,2,'The rooftop amenities are a standout feature of this project. Great views and relaxation spaces.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(239,12,'Botble\\RealEstate\\Models\\Property',1,1,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-01-04 00:42:25','2026-04-27 00:42:25'),(241,10,'Botble\\RealEstate\\Models\\Property',55,1,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-16 00:42:25','2026-04-27 00:42:25'),(243,11,'Botble\\RealEstate\\Models\\Property',23,1,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-02-17 00:42:25','2026-04-27 00:42:25'),(245,11,'Botble\\RealEstate\\Models\\Property',28,2,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-01-10 00:42:25','2026-04-27 00:42:25'),(246,10,'Botble\\RealEstate\\Models\\Project',10,2,'The project completion ahead of schedule shows excellent project management.','approved','2026-01-09 00:42:25','2026-04-27 00:42:25'),(247,10,'Botble\\RealEstate\\Models\\Property',58,1,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(249,5,'Botble\\RealEstate\\Models\\Property',11,3,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-03-18 00:42:25','2026-04-27 00:42:25'),(250,7,'Botble\\RealEstate\\Models\\Project',16,4,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(251,5,'Botble\\RealEstate\\Models\\Property',31,3,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(254,8,'Botble\\RealEstate\\Models\\Project',2,3,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(255,5,'Botble\\RealEstate\\Models\\Property',18,4,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(256,6,'Botble\\RealEstate\\Models\\Project',4,1,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-02-03 00:42:25','2026-04-27 00:42:25'),(259,12,'Botble\\RealEstate\\Models\\Property',49,3,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(260,1,'Botble\\RealEstate\\Models\\Project',16,5,'Parking facilities are well-planned with ample space for residents and visitors.','approved','2026-01-10 00:42:25','2026-04-27 00:42:25'),(261,1,'Botble\\RealEstate\\Models\\Property',15,5,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-02-24 00:42:25','2026-04-27 00:42:25'),(263,4,'Botble\\RealEstate\\Models\\Property',35,4,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-02-28 00:42:25','2026-04-27 00:42:25'),(264,3,'Botble\\RealEstate\\Models\\Project',8,1,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-01-31 00:42:25','2026-04-27 00:42:25'),(265,8,'Botble\\RealEstate\\Models\\Property',33,3,'The property has great resale potential. Smart investment for the future.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(266,3,'Botble\\RealEstate\\Models\\Project',13,3,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(267,8,'Botble\\RealEstate\\Models\\Property',7,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(268,5,'Botble\\RealEstate\\Models\\Project',18,5,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-02-11 00:42:25','2026-04-27 00:42:25'),(269,1,'Botble\\RealEstate\\Models\\Property',17,5,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(271,1,'Botble\\RealEstate\\Models\\Property',32,2,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-11 00:42:25','2026-04-27 00:42:25'),(273,12,'Botble\\RealEstate\\Models\\Property',17,2,'The property has great resale potential. Smart investment for the future.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(277,2,'Botble\\RealEstate\\Models\\Property',45,2,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(278,10,'Botble\\RealEstate\\Models\\Project',7,3,'Parking facilities are well-planned with ample space for residents and visitors.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(281,5,'Botble\\RealEstate\\Models\\Property',36,4,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-02-18 00:42:25','2026-04-27 00:42:25'),(282,5,'Botble\\RealEstate\\Models\\Project',8,5,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(283,5,'Botble\\RealEstate\\Models\\Property',40,5,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(284,9,'Botble\\RealEstate\\Models\\Project',8,1,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-02-28 00:42:25','2026-04-27 00:42:25'),(285,4,'Botble\\RealEstate\\Models\\Property',25,1,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(286,3,'Botble\\RealEstate\\Models\\Project',6,5,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(287,3,'Botble\\RealEstate\\Models\\Property',37,1,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-01-04 00:42:25','2026-04-27 00:42:25'),(288,8,'Botble\\RealEstate\\Models\\Project',17,4,'This development project has exceeded all expectations. The architects have done an amazing job balancing aesthetics with functionality.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(289,7,'Botble\\RealEstate\\Models\\Property',51,4,'The property has great resale potential. Smart investment for the future.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(290,1,'Botble\\RealEstate\\Models\\Project',17,2,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(293,5,'Botble\\RealEstate\\Models\\Property',16,4,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-04-08 00:42:25','2026-04-27 00:42:25'),(295,11,'Botble\\RealEstate\\Models\\Property',60,4,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-01-21 00:42:25','2026-04-27 00:42:25'),(299,4,'Botble\\RealEstate\\Models\\Property',1,1,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(300,2,'Botble\\RealEstate\\Models\\Project',7,5,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(301,11,'Botble\\RealEstate\\Models\\Property',54,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(303,7,'Botble\\RealEstate\\Models\\Property',21,3,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-01-18 00:42:25','2026-04-27 00:42:25'),(305,5,'Botble\\RealEstate\\Models\\Property',29,5,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-03-28 00:42:25','2026-04-27 00:42:25'),(307,6,'Botble\\RealEstate\\Models\\Property',18,4,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-03-12 00:42:25','2026-04-27 00:42:25'),(308,4,'Botble\\RealEstate\\Models\\Project',3,2,'Pet-friendly project with designated areas for dogs and cats.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(309,1,'Botble\\RealEstate\\Models\\Property',42,2,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(310,4,'Botble\\RealEstate\\Models\\Project',1,1,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(311,2,'Botble\\RealEstate\\Models\\Property',15,1,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-01-17 00:42:25','2026-04-27 00:42:25'),(313,9,'Botble\\RealEstate\\Models\\Property',2,2,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-03-19 00:42:25','2026-04-27 00:42:25'),(314,1,'Botble\\RealEstate\\Models\\Project',11,1,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(316,10,'Botble\\RealEstate\\Models\\Project',3,1,'The project completion ahead of schedule shows excellent project management.','approved','2026-02-07 00:42:25','2026-04-27 00:42:25'),(317,7,'Botble\\RealEstate\\Models\\Property',44,1,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-02-15 00:42:25','2026-04-27 00:42:25'),(318,4,'Botble\\RealEstate\\Models\\Project',4,4,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-03-28 00:42:25','2026-04-27 00:42:25'),(319,11,'Botble\\RealEstate\\Models\\Property',11,1,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(321,2,'Botble\\RealEstate\\Models\\Property',36,1,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(322,9,'Botble\\RealEstate\\Models\\Project',13,3,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-19 00:42:25','2026-04-27 00:42:25'),(323,5,'Botble\\RealEstate\\Models\\Property',45,1,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(327,6,'Botble\\RealEstate\\Models\\Property',25,4,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(328,1,'Botble\\RealEstate\\Models\\Project',13,3,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(330,10,'Botble\\RealEstate\\Models\\Project',14,2,'Parking facilities are well-planned with ample space for residents and visitors.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(331,6,'Botble\\RealEstate\\Models\\Property',60,4,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(333,6,'Botble\\RealEstate\\Models\\Property',27,3,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-02-08 00:42:25','2026-04-27 00:42:25'),(334,2,'Botble\\RealEstate\\Models\\Project',18,3,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-02-27 00:42:25','2026-04-27 00:42:25'),(335,1,'Botble\\RealEstate\\Models\\Property',44,1,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-02-19 00:42:25','2026-04-27 00:42:25'),(337,6,'Botble\\RealEstate\\Models\\Property',1,2,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-17 00:42:25','2026-04-27 00:42:25'),(338,8,'Botble\\RealEstate\\Models\\Project',6,1,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-01-12 00:42:25','2026-04-27 00:42:25'),(340,12,'Botble\\RealEstate\\Models\\Project',6,1,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-03-01 00:42:25','2026-04-27 00:42:25'),(343,7,'Botble\\RealEstate\\Models\\Property',7,5,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-01-11 00:42:25','2026-04-27 00:42:25'),(344,10,'Botble\\RealEstate\\Models\\Project',2,1,'This development project has exceeded all expectations. The architects have done an amazing job balancing aesthetics with functionality.','approved','2026-04-14 00:42:25','2026-04-27 00:42:25'),(345,1,'Botble\\RealEstate\\Models\\Property',23,5,'The property has great resale potential. Smart investment for the future.','approved','2026-01-26 00:42:25','2026-04-27 00:42:25'),(346,5,'Botble\\RealEstate\\Models\\Project',5,3,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-02-17 00:42:25','2026-04-27 00:42:25'),(349,4,'Botble\\RealEstate\\Models\\Property',42,2,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(350,6,'Botble\\RealEstate\\Models\\Project',10,2,'The project has won multiple awards for its design and sustainability features.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(351,5,'Botble\\RealEstate\\Models\\Property',27,1,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(353,11,'Botble\\RealEstate\\Models\\Property',44,4,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(354,10,'Botble\\RealEstate\\Models\\Project',4,2,'The landscaping around this project is beautiful. Green spaces make the community feel alive.','approved','2026-01-23 00:42:25','2026-04-27 00:42:25'),(355,10,'Botble\\RealEstate\\Models\\Property',26,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-26 00:42:25','2026-04-27 00:42:25'),(356,7,'Botble\\RealEstate\\Models\\Project',1,2,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(357,2,'Botble\\RealEstate\\Models\\Property',60,2,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-02-05 00:42:25','2026-04-27 00:42:25'),(358,7,'Botble\\RealEstate\\Models\\Project',2,5,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-03-29 00:42:25','2026-04-27 00:42:25'),(360,8,'Botble\\RealEstate\\Models\\Project',4,4,'Impressive project with top-notch facilities. The developers have clearly prioritized quality over quantity.','approved','2026-04-26 00:42:25','2026-04-27 00:42:25'),(361,5,'Botble\\RealEstate\\Models\\Property',3,3,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-02-26 00:42:25','2026-04-27 00:42:25'),(362,12,'Botble\\RealEstate\\Models\\Project',11,1,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(363,6,'Botble\\RealEstate\\Models\\Property',61,4,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2025-12-31 00:42:25','2026-04-27 00:42:25'),(364,8,'Botble\\RealEstate\\Models\\Project',18,5,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-04-23 00:42:25','2026-04-27 00:42:25'),(365,1,'Botble\\RealEstate\\Models\\Property',58,3,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-03-29 00:42:25','2026-04-27 00:42:25'),(366,6,'Botble\\RealEstate\\Models\\Project',9,5,'The rooftop amenities are a standout feature of this project. Great views and relaxation spaces.','approved','2026-01-03 00:42:25','2026-04-27 00:42:25'),(369,7,'Botble\\RealEstate\\Models\\Property',57,2,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(371,12,'Botble\\RealEstate\\Models\\Property',55,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-02-11 00:42:25','2026-04-27 00:42:25'),(373,11,'Botble\\RealEstate\\Models\\Property',19,3,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-01-09 00:42:25','2026-04-27 00:42:25'),(377,10,'Botble\\RealEstate\\Models\\Property',49,2,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-02-25 00:42:25','2026-04-27 00:42:25'),(378,5,'Botble\\RealEstate\\Models\\Project',1,3,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-04-19 00:42:25','2026-04-27 00:42:25'),(380,10,'Botble\\RealEstate\\Models\\Project',16,1,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(381,1,'Botble\\RealEstate\\Models\\Property',13,1,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-03-05 00:42:25','2026-04-27 00:42:25'),(383,10,'Botble\\RealEstate\\Models\\Property',11,2,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-02-04 00:42:25','2026-04-27 00:42:25'),(386,3,'Botble\\RealEstate\\Models\\Project',16,5,'This development project has exceeded all expectations. The architects have done an amazing job balancing aesthetics with functionality.','approved','2026-02-13 00:42:25','2026-04-27 00:42:25'),(387,12,'Botble\\RealEstate\\Models\\Property',4,1,'The property photos were accurate and the space is even better in person. Move-in ready and professionally cleaned.','approved','2026-04-23 00:42:25','2026-04-27 00:42:25'),(389,6,'Botble\\RealEstate\\Models\\Property',41,2,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-03-25 00:42:25','2026-04-27 00:42:25'),(391,2,'Botble\\RealEstate\\Models\\Property',34,5,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-03-14 00:42:25','2026-04-27 00:42:25'),(395,7,'Botble\\RealEstate\\Models\\Property',45,5,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(397,4,'Botble\\RealEstate\\Models\\Property',13,5,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-03-05 00:42:25','2026-04-27 00:42:25'),(399,1,'Botble\\RealEstate\\Models\\Property',60,2,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-01-06 00:42:25','2026-04-27 00:42:25'),(400,3,'Botble\\RealEstate\\Models\\Project',9,3,'The project completion ahead of schedule shows excellent project management.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(402,11,'Botble\\RealEstate\\Models\\Project',6,4,'The project completion ahead of schedule shows excellent project management.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(403,8,'Botble\\RealEstate\\Models\\Property',58,4,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(407,12,'Botble\\RealEstate\\Models\\Property',52,5,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-04-02 00:42:25','2026-04-27 00:42:25'),(408,10,'Botble\\RealEstate\\Models\\Project',11,1,'Great investment opportunity. The project is in a rapidly developing area with strong growth potential.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(409,9,'Botble\\RealEstate\\Models\\Property',12,4,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-04-01 00:42:25','2026-04-27 00:42:25'),(412,1,'Botble\\RealEstate\\Models\\Project',9,2,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(413,12,'Botble\\RealEstate\\Models\\Property',48,1,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(415,3,'Botble\\RealEstate\\Models\\Property',27,4,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-04-24 00:42:25','2026-04-27 00:42:25'),(416,2,'Botble\\RealEstate\\Models\\Project',15,2,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-01-15 00:42:25','2026-04-27 00:42:25'),(417,9,'Botble\\RealEstate\\Models\\Property',27,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(418,4,'Botble\\RealEstate\\Models\\Project',15,1,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-02-23 00:42:25','2026-04-27 00:42:25'),(419,3,'Botble\\RealEstate\\Models\\Property',28,1,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(421,9,'Botble\\RealEstate\\Models\\Property',42,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(423,10,'Botble\\RealEstate\\Models\\Property',53,5,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-03-12 00:42:25','2026-04-27 00:42:25'),(425,4,'Botble\\RealEstate\\Models\\Property',28,1,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-18 00:42:25','2026-04-27 00:42:25'),(427,5,'Botble\\RealEstate\\Models\\Property',44,5,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-02-11 00:42:25','2026-04-27 00:42:25'),(429,6,'Botble\\RealEstate\\Models\\Property',48,2,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(430,6,'Botble\\RealEstate\\Models\\Project',3,4,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(432,5,'Botble\\RealEstate\\Models\\Project',4,3,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(433,8,'Botble\\RealEstate\\Models\\Property',2,5,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-28 00:42:25','2026-04-27 00:42:25'),(437,2,'Botble\\RealEstate\\Models\\Property',40,3,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-03-26 00:42:25','2026-04-27 00:42:25'),(439,10,'Botble\\RealEstate\\Models\\Property',41,3,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-01-27 00:42:25','2026-04-27 00:42:25'),(441,7,'Botble\\RealEstate\\Models\\Property',17,5,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(444,3,'Botble\\RealEstate\\Models\\Project',17,5,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-01-10 00:42:25','2026-04-27 00:42:25'),(445,9,'Botble\\RealEstate\\Models\\Property',31,1,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(447,10,'Botble\\RealEstate\\Models\\Property',25,4,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-02-27 00:42:25','2026-04-27 00:42:25'),(449,2,'Botble\\RealEstate\\Models\\Property',56,3,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-03-19 00:42:25','2026-04-27 00:42:25'),(451,4,'Botble\\RealEstate\\Models\\Property',53,2,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-02-25 00:42:25','2026-04-27 00:42:25'),(453,4,'Botble\\RealEstate\\Models\\Property',45,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(454,2,'Botble\\RealEstate\\Models\\Project',11,4,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(455,10,'Botble\\RealEstate\\Models\\Property',35,3,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-04-26 00:42:25','2026-04-27 00:42:25'),(459,7,'Botble\\RealEstate\\Models\\Property',6,2,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(463,7,'Botble\\RealEstate\\Models\\Property',19,2,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2025-12-30 00:42:25','2026-04-27 00:42:25'),(464,1,'Botble\\RealEstate\\Models\\Project',18,5,'The project has won multiple awards for its design and sustainability features.','approved','2026-02-26 00:42:25','2026-04-27 00:42:25'),(465,11,'Botble\\RealEstate\\Models\\Property',13,5,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-03-12 00:42:25','2026-04-27 00:42:25'),(466,3,'Botble\\RealEstate\\Models\\Project',12,2,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(467,2,'Botble\\RealEstate\\Models\\Property',49,1,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-02-14 00:42:25','2026-04-27 00:42:25'),(469,7,'Botble\\RealEstate\\Models\\Property',36,5,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-01-20 00:42:25','2026-04-27 00:42:25'),(471,7,'Botble\\RealEstate\\Models\\Property',10,1,'The property has great resale potential. Smart investment for the future.','approved','2026-02-07 00:42:25','2026-04-27 00:42:25'),(472,1,'Botble\\RealEstate\\Models\\Project',1,1,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-04-17 00:42:25','2026-04-27 00:42:25'),(473,12,'Botble\\RealEstate\\Models\\Property',18,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-01-11 00:42:25','2026-04-27 00:42:25'),(475,10,'Botble\\RealEstate\\Models\\Property',34,1,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(477,2,'Botble\\RealEstate\\Models\\Property',43,3,'The property photos were accurate and the space is even better in person. Move-in ready and professionally cleaned.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(478,3,'Botble\\RealEstate\\Models\\Project',11,1,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-03-26 00:42:25','2026-04-27 00:42:25'),(480,4,'Botble\\RealEstate\\Models\\Project',2,2,'The project completion ahead of schedule shows excellent project management.','approved','2026-02-18 00:42:25','2026-04-27 00:42:25'),(481,3,'Botble\\RealEstate\\Models\\Property',36,3,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(483,8,'Botble\\RealEstate\\Models\\Property',57,2,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(484,6,'Botble\\RealEstate\\Models\\Project',6,5,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-04-02 00:42:25','2026-04-27 00:42:25'),(485,11,'Botble\\RealEstate\\Models\\Property',24,3,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-03-08 00:42:25','2026-04-27 00:42:25'),(487,1,'Botble\\RealEstate\\Models\\Property',18,1,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(491,5,'Botble\\RealEstate\\Models\\Property',46,1,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-04-26 00:42:25','2026-04-27 00:42:25'),(492,1,'Botble\\RealEstate\\Models\\Project',10,4,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-01-05 00:42:25','2026-04-27 00:42:25'),(493,12,'Botble\\RealEstate\\Models\\Property',44,2,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(497,10,'Botble\\RealEstate\\Models\\Property',16,4,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-01-27 00:42:25','2026-04-27 00:42:25'),(499,4,'Botble\\RealEstate\\Models\\Property',16,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-04-14 00:42:25','2026-04-27 00:42:25'),(501,12,'Botble\\RealEstate\\Models\\Property',38,2,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-02-04 00:42:25','2026-04-27 00:42:25'),(502,8,'Botble\\RealEstate\\Models\\Project',16,4,'The developer provided excellent after-sales service. Any snags were fixed promptly.','approved','2026-02-23 00:42:25','2026-04-27 00:42:25'),(503,2,'Botble\\RealEstate\\Models\\Property',37,3,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-01-24 00:42:25','2026-04-27 00:42:25'),(504,3,'Botble\\RealEstate\\Models\\Project',5,5,'The project completion ahead of schedule shows excellent project management.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(505,6,'Botble\\RealEstate\\Models\\Property',16,3,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-09 00:42:25','2026-04-27 00:42:25'),(507,11,'Botble\\RealEstate\\Models\\Property',41,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(511,3,'Botble\\RealEstate\\Models\\Property',49,5,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-03-24 00:42:25','2026-04-27 00:42:25'),(514,4,'Botble\\RealEstate\\Models\\Project',10,1,'Energy-efficient design reduces monthly utility costs significantly.','approved','2026-01-31 00:42:25','2026-04-27 00:42:25'),(515,12,'Botble\\RealEstate\\Models\\Property',60,4,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-03-19 00:42:25','2026-04-27 00:42:25'),(517,12,'Botble\\RealEstate\\Models\\Property',20,4,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(519,2,'Botble\\RealEstate\\Models\\Property',41,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(523,5,'Botble\\RealEstate\\Models\\Property',7,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(524,6,'Botble\\RealEstate\\Models\\Project',5,4,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-01-19 00:42:25','2026-04-27 00:42:25'),(525,5,'Botble\\RealEstate\\Models\\Property',6,4,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-01-23 00:42:25','2026-04-27 00:42:25'),(526,12,'Botble\\RealEstate\\Models\\Project',14,5,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-04-11 00:42:25','2026-04-27 00:42:25'),(527,3,'Botble\\RealEstate\\Models\\Property',46,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-23 00:42:25','2026-04-27 00:42:25'),(529,5,'Botble\\RealEstate\\Models\\Property',52,4,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(531,3,'Botble\\RealEstate\\Models\\Property',61,2,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(533,7,'Botble\\RealEstate\\Models\\Property',1,2,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-04-21 00:42:25','2026-04-27 00:42:25'),(535,10,'Botble\\RealEstate\\Models\\Property',57,5,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(537,5,'Botble\\RealEstate\\Models\\Property',34,2,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-04-05 00:42:25','2026-04-27 00:42:25'),(539,4,'Botble\\RealEstate\\Models\\Property',21,2,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-01-23 00:42:25','2026-04-27 00:42:25'),(540,10,'Botble\\RealEstate\\Models\\Project',5,4,'Energy-efficient design reduces monthly utility costs significantly.','approved','2026-04-05 00:42:25','2026-04-27 00:42:25'),(541,8,'Botble\\RealEstate\\Models\\Property',11,2,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-01-22 00:42:25','2026-04-27 00:42:25'),(543,3,'Botble\\RealEstate\\Models\\Property',12,3,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2025-12-28 00:42:25','2026-04-27 00:42:25'),(546,4,'Botble\\RealEstate\\Models\\Project',16,5,'The project has excellent connectivity to major roads and public transportation.','approved','2026-04-26 00:42:25','2026-04-27 00:42:25'),(549,3,'Botble\\RealEstate\\Models\\Property',57,3,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-03-04 00:42:25','2026-04-27 00:42:25'),(550,5,'Botble\\RealEstate\\Models\\Project',15,1,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-04-22 00:42:25','2026-04-27 00:42:25'),(553,8,'Botble\\RealEstate\\Models\\Property',27,3,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-03-14 00:42:25','2026-04-27 00:42:25'),(554,5,'Botble\\RealEstate\\Models\\Project',9,4,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(555,8,'Botble\\RealEstate\\Models\\Property',40,2,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(556,2,'Botble\\RealEstate\\Models\\Project',6,5,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(565,9,'Botble\\RealEstate\\Models\\Property',14,1,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(566,1,'Botble\\RealEstate\\Models\\Project',7,5,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-04-08 00:42:25','2026-04-27 00:42:25'),(567,11,'Botble\\RealEstate\\Models\\Property',20,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-01-15 00:42:25','2026-04-27 00:42:25'),(571,5,'Botble\\RealEstate\\Models\\Property',15,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-03-31 00:42:25','2026-04-27 00:42:25'),(572,5,'Botble\\RealEstate\\Models\\Project',11,4,'The common areas in this project are exceptionally well-designed. Perfect blend of functionality and beauty.','approved','2026-04-17 00:42:25','2026-04-27 00:42:25'),(573,3,'Botble\\RealEstate\\Models\\Property',29,1,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-01-06 00:42:25','2026-04-27 00:42:25'),(577,4,'Botble\\RealEstate\\Models\\Property',23,4,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2025-12-30 00:42:25','2026-04-27 00:42:25'),(579,11,'Botble\\RealEstate\\Models\\Property',46,2,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-03-05 00:42:25','2026-04-27 00:42:25'),(581,2,'Botble\\RealEstate\\Models\\Property',9,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(585,2,'Botble\\RealEstate\\Models\\Property',29,3,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(587,11,'Botble\\RealEstate\\Models\\Property',33,1,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-04-14 00:42:25','2026-04-27 00:42:25'),(589,7,'Botble\\RealEstate\\Models\\Property',54,2,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-03-24 00:42:25','2026-04-27 00:42:25'),(593,4,'Botble\\RealEstate\\Models\\Property',22,2,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-22 00:42:25','2026-04-27 00:42:25'),(597,8,'Botble\\RealEstate\\Models\\Property',51,1,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(601,1,'Botble\\RealEstate\\Models\\Property',53,1,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-02-27 00:42:25','2026-04-27 00:42:25'),(602,6,'Botble\\RealEstate\\Models\\Project',2,4,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-01-17 00:42:25','2026-04-27 00:42:25'),(603,7,'Botble\\RealEstate\\Models\\Property',12,3,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(606,9,'Botble\\RealEstate\\Models\\Project',3,1,'The project has excellent connectivity to major roads and public transportation.','approved','2026-01-12 00:42:25','2026-04-27 00:42:25'),(607,10,'Botble\\RealEstate\\Models\\Property',48,3,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(609,4,'Botble\\RealEstate\\Models\\Property',15,4,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(611,3,'Botble\\RealEstate\\Models\\Property',45,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(613,5,'Botble\\RealEstate\\Models\\Property',32,2,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-01-18 00:42:25','2026-04-27 00:42:25'),(614,8,'Botble\\RealEstate\\Models\\Project',13,4,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-04-19 00:42:25','2026-04-27 00:42:25'),(617,2,'Botble\\RealEstate\\Models\\Property',42,2,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-03-07 00:42:25','2026-04-27 00:42:25'),(619,1,'Botble\\RealEstate\\Models\\Property',8,3,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-03-31 00:42:25','2026-04-27 00:42:25'),(621,10,'Botble\\RealEstate\\Models\\Property',4,1,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(625,12,'Botble\\RealEstate\\Models\\Property',39,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(629,4,'Botble\\RealEstate\\Models\\Property',55,4,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-03-19 00:42:25','2026-04-27 00:42:25'),(632,12,'Botble\\RealEstate\\Models\\Project',9,1,'Impressive project with top-notch facilities. The developers have clearly prioritized quality over quantity.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(633,9,'Botble\\RealEstate\\Models\\Property',9,2,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(637,10,'Botble\\RealEstate\\Models\\Property',54,1,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-01-11 00:42:25','2026-04-27 00:42:25'),(638,9,'Botble\\RealEstate\\Models\\Project',2,4,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(639,11,'Botble\\RealEstate\\Models\\Property',38,2,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(643,2,'Botble\\RealEstate\\Models\\Property',14,4,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-01-07 00:42:25','2026-04-27 00:42:25'),(645,10,'Botble\\RealEstate\\Models\\Property',46,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(647,7,'Botble\\RealEstate\\Models\\Property',24,5,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(649,9,'Botble\\RealEstate\\Models\\Property',34,4,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-01-31 00:42:25','2026-04-27 00:42:25'),(654,12,'Botble\\RealEstate\\Models\\Project',17,5,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-04-02 00:42:25','2026-04-27 00:42:25'),(655,8,'Botble\\RealEstate\\Models\\Property',25,2,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(656,10,'Botble\\RealEstate\\Models\\Project',12,5,'The project timeline was met and the final result is stunning. Very professional team behind this development.','approved','2026-03-09 00:42:25','2026-04-27 00:42:25'),(657,9,'Botble\\RealEstate\\Models\\Property',21,5,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-03-26 00:42:25','2026-04-27 00:42:25'),(658,7,'Botble\\RealEstate\\Models\\Project',17,3,'Looking forward to the next phase of this development. The first phase has been outstanding.','approved','2026-01-20 00:42:25','2026-04-27 00:42:25'),(659,5,'Botble\\RealEstate\\Models\\Property',54,2,'The property has great resale potential. Smart investment for the future.','approved','2026-02-13 00:42:25','2026-04-27 00:42:25'),(661,6,'Botble\\RealEstate\\Models\\Property',40,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-15 00:42:25','2026-04-27 00:42:25'),(663,3,'Botble\\RealEstate\\Models\\Property',9,1,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-04-12 00:42:25','2026-04-27 00:42:25'),(665,4,'Botble\\RealEstate\\Models\\Property',10,3,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-03-28 00:42:25','2026-04-27 00:42:25'),(667,1,'Botble\\RealEstate\\Models\\Property',22,4,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-03-05 00:42:25','2026-04-27 00:42:25'),(673,7,'Botble\\RealEstate\\Models\\Property',25,4,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-04-08 00:42:25','2026-04-27 00:42:25'),(674,3,'Botble\\RealEstate\\Models\\Project',10,4,'This development project has exceeded all expectations. The architects have done an amazing job balancing aesthetics with functionality.','approved','2025-12-31 00:42:25','2026-04-27 00:42:25'),(675,8,'Botble\\RealEstate\\Models\\Property',37,5,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(679,9,'Botble\\RealEstate\\Models\\Property',23,2,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-27 00:42:25','2026-04-27 00:42:25'),(681,3,'Botble\\RealEstate\\Models\\Property',18,4,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(691,11,'Botble\\RealEstate\\Models\\Property',7,1,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-01-26 00:42:25','2026-04-27 00:42:25'),(694,9,'Botble\\RealEstate\\Models\\Project',9,2,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(697,2,'Botble\\RealEstate\\Models\\Property',3,3,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-01-13 00:42:25','2026-04-27 00:42:25'),(700,11,'Botble\\RealEstate\\Models\\Project',4,2,'The project has excellent connectivity to major roads and public transportation.','approved','2026-03-25 00:42:25','2026-04-27 00:42:25'),(701,5,'Botble\\RealEstate\\Models\\Property',53,1,'The property photos were accurate and the space is even better in person. Move-in ready and professionally cleaned.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(703,4,'Botble\\RealEstate\\Models\\Property',11,2,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-01-27 00:42:25','2026-04-27 00:42:25'),(704,6,'Botble\\RealEstate\\Models\\Project',16,2,'Security features throughout the project are state-of-the-art. Feel safe living here.','approved','2026-02-19 00:42:25','2026-04-27 00:42:25'),(707,3,'Botble\\RealEstate\\Models\\Property',55,5,'Spacious rooms and excellent storage space. The property has been recently renovated and everything looks brand new.','approved','2026-01-23 00:42:25','2026-04-27 00:42:25'),(709,7,'Botble\\RealEstate\\Models\\Property',40,5,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-01-02 00:42:25','2026-04-27 00:42:25'),(710,11,'Botble\\RealEstate\\Models\\Project',12,4,'Parking facilities are well-planned with ample space for residents and visitors.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(715,9,'Botble\\RealEstate\\Models\\Property',30,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-02-05 00:42:25','2026-04-27 00:42:25'),(717,7,'Botble\\RealEstate\\Models\\Property',49,3,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(719,12,'Botble\\RealEstate\\Models\\Property',14,5,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2025-12-28 00:42:25','2026-04-27 00:42:25'),(721,7,'Botble\\RealEstate\\Models\\Property',31,3,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(723,9,'Botble\\RealEstate\\Models\\Property',48,3,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-03 00:42:25','2026-04-27 00:42:25'),(724,7,'Botble\\RealEstate\\Models\\Project',8,3,'Sound insulation between units is excellent. No noise complaints whatsoever.','approved','2026-02-12 00:42:25','2026-04-27 00:42:25'),(725,5,'Botble\\RealEstate\\Models\\Property',61,5,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(728,8,'Botble\\RealEstate\\Models\\Project',1,4,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2025-12-29 00:42:25','2026-04-27 00:42:25'),(731,9,'Botble\\RealEstate\\Models\\Property',45,1,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(735,1,'Botble\\RealEstate\\Models\\Property',21,1,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-04-17 00:42:25','2026-04-27 00:42:25'),(736,7,'Botble\\RealEstate\\Models\\Project',7,1,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(737,1,'Botble\\RealEstate\\Models\\Property',33,2,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-02-08 00:42:25','2026-04-27 00:42:25'),(744,5,'Botble\\RealEstate\\Models\\Project',2,3,'The project offers great variety in unit sizes. Something for everyone - singles, couples, and families.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(747,12,'Botble\\RealEstate\\Models\\Property',5,1,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(751,3,'Botble\\RealEstate\\Models\\Property',23,4,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-04-18 00:42:25','2026-04-27 00:42:25'),(753,2,'Botble\\RealEstate\\Models\\Property',32,4,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-01-17 00:42:25','2026-04-27 00:42:25'),(754,1,'Botble\\RealEstate\\Models\\Project',8,2,'Great investment opportunity. The project is in a rapidly developing area with strong growth potential.','approved','2025-12-29 00:42:25','2026-04-27 00:42:25'),(756,8,'Botble\\RealEstate\\Models\\Project',14,1,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2026-02-24 00:42:25','2026-04-27 00:42:25'),(760,9,'Botble\\RealEstate\\Models\\Project',6,2,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-02-15 00:42:25','2026-04-27 00:42:25'),(761,11,'Botble\\RealEstate\\Models\\Property',57,5,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(763,8,'Botble\\RealEstate\\Models\\Property',9,3,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(767,11,'Botble\\RealEstate\\Models\\Property',5,4,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-04-04 00:42:25','2026-04-27 00:42:25'),(769,7,'Botble\\RealEstate\\Models\\Property',28,4,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-04-14 00:42:25','2026-04-27 00:42:25'),(770,4,'Botble\\RealEstate\\Models\\Project',17,3,'The project has enhanced property values in the entire area.','approved','2026-03-06 00:42:25','2026-04-27 00:42:25'),(775,9,'Botble\\RealEstate\\Models\\Property',36,1,'The property has great resale potential. Smart investment for the future.','approved','2026-02-16 00:42:25','2026-04-27 00:42:25'),(776,2,'Botble\\RealEstate\\Models\\Project',2,2,'The project completion ahead of schedule shows excellent project management.','approved','2026-01-05 00:42:25','2026-04-27 00:42:25'),(785,11,'Botble\\RealEstate\\Models\\Property',8,3,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(787,1,'Botble\\RealEstate\\Models\\Property',10,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-02-16 00:42:25','2026-04-27 00:42:25'),(789,12,'Botble\\RealEstate\\Models\\Property',34,4,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-05 00:42:25','2026-04-27 00:42:25'),(791,7,'Botble\\RealEstate\\Models\\Property',42,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-03-10 00:42:25','2026-04-27 00:42:25'),(795,5,'Botble\\RealEstate\\Models\\Property',14,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-04 00:42:25','2026-04-27 00:42:25'),(797,7,'Botble\\RealEstate\\Models\\Property',30,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(799,4,'Botble\\RealEstate\\Models\\Property',56,1,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-03-02 00:42:25','2026-04-27 00:42:25'),(801,8,'Botble\\RealEstate\\Models\\Property',34,3,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(803,11,'Botble\\RealEstate\\Models\\Property',37,1,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(805,3,'Botble\\RealEstate\\Models\\Property',50,3,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-02-19 00:42:25','2026-04-27 00:42:25'),(810,6,'Botble\\RealEstate\\Models\\Project',12,1,'Beautiful architectural design that stands out in the neighborhood.','approved','2026-01-25 00:42:25','2026-04-27 00:42:25'),(813,10,'Botble\\RealEstate\\Models\\Property',60,3,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-03-27 00:42:25','2026-04-27 00:42:25'),(816,6,'Botble\\RealEstate\\Models\\Project',7,2,'The rooftop amenities are a standout feature of this project. Great views and relaxation spaces.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(817,6,'Botble\\RealEstate\\Models\\Property',35,3,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-14 00:42:25','2026-04-27 00:42:25'),(819,4,'Botble\\RealEstate\\Models\\Property',41,2,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(823,8,'Botble\\RealEstate\\Models\\Property',30,4,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-20 00:42:25','2026-04-27 00:42:25'),(826,11,'Botble\\RealEstate\\Models\\Project',7,1,'Sustainable building practices were used throughout this project. Appreciate the eco-friendly approach.','approved','2026-04-22 00:42:25','2026-04-27 00:42:25'),(827,4,'Botble\\RealEstate\\Models\\Property',26,2,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2025-12-29 00:42:25','2026-04-27 00:42:25'),(829,12,'Botble\\RealEstate\\Models\\Property',53,5,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-03-22 00:42:25','2026-04-27 00:42:25'),(830,2,'Botble\\RealEstate\\Models\\Project',1,4,'The fitness center in this project rivals professional gyms. Very well-equipped.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(831,2,'Botble\\RealEstate\\Models\\Property',58,1,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-01 00:42:25','2026-04-27 00:42:25'),(832,7,'Botble\\RealEstate\\Models\\Project',9,5,'Energy-efficient design reduces monthly utility costs significantly.','approved','2026-01-29 00:42:25','2026-04-27 00:42:25'),(833,7,'Botble\\RealEstate\\Models\\Property',58,3,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-01-26 00:42:25','2026-04-27 00:42:25'),(837,6,'Botble\\RealEstate\\Models\\Property',4,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(839,1,'Botble\\RealEstate\\Models\\Property',31,5,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-01-01 00:42:25','2026-04-27 00:42:25'),(841,3,'Botble\\RealEstate\\Models\\Property',51,2,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2025-12-29 00:42:25','2026-04-27 00:42:25'),(845,9,'Botble\\RealEstate\\Models\\Property',47,4,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-03-19 00:42:25','2026-04-27 00:42:25'),(847,12,'Botble\\RealEstate\\Models\\Property',47,4,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-02-26 00:42:25','2026-04-27 00:42:25'),(849,6,'Botble\\RealEstate\\Models\\Property',22,4,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-01-05 00:42:25','2026-04-27 00:42:25'),(853,1,'Botble\\RealEstate\\Models\\Property',27,2,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(858,12,'Botble\\RealEstate\\Models\\Project',10,5,'The developer provided excellent after-sales service. Any snags were fixed promptly.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(861,11,'Botble\\RealEstate\\Models\\Property',22,4,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(863,8,'Botble\\RealEstate\\Models\\Property',5,5,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-04-07 00:42:25','2026-04-27 00:42:25'),(865,6,'Botble\\RealEstate\\Models\\Property',52,2,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-03-06 00:42:25','2026-04-27 00:42:25'),(867,3,'Botble\\RealEstate\\Models\\Property',5,2,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(869,10,'Botble\\RealEstate\\Models\\Property',28,5,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-02-01 00:42:25','2026-04-27 00:42:25'),(875,9,'Botble\\RealEstate\\Models\\Property',60,4,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-17 00:42:25','2026-04-27 00:42:25'),(879,1,'Botble\\RealEstate\\Models\\Property',30,3,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(881,4,'Botble\\RealEstate\\Models\\Property',7,3,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-02-28 00:42:25','2026-04-27 00:42:25'),(887,10,'Botble\\RealEstate\\Models\\Property',23,3,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(891,5,'Botble\\RealEstate\\Models\\Property',41,1,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-03-08 00:42:25','2026-04-27 00:42:25'),(893,12,'Botble\\RealEstate\\Models\\Property',12,1,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-04-12 00:42:25','2026-04-27 00:42:25'),(897,9,'Botble\\RealEstate\\Models\\Property',37,2,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-03-22 00:42:25','2026-04-27 00:42:25'),(900,8,'Botble\\RealEstate\\Models\\Project',8,4,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-23 00:42:25','2026-04-27 00:42:25'),(901,7,'Botble\\RealEstate\\Models\\Property',15,4,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-02-16 00:42:25','2026-04-27 00:42:25'),(903,3,'Botble\\RealEstate\\Models\\Property',54,3,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(908,8,'Botble\\RealEstate\\Models\\Project',7,5,'Child-friendly design throughout the project with safe play areas and family amenities.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(909,9,'Botble\\RealEstate\\Models\\Property',49,2,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-01-13 00:42:25','2026-04-27 00:42:25'),(918,4,'Botble\\RealEstate\\Models\\Project',13,5,'Energy-efficient design reduces monthly utility costs significantly.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(921,5,'Botble\\RealEstate\\Models\\Property',57,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-01-07 00:42:25','2026-04-27 00:42:25'),(923,6,'Botble\\RealEstate\\Models\\Property',13,2,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-12 00:42:25','2026-04-27 00:42:25'),(925,1,'Botble\\RealEstate\\Models\\Property',55,2,'The property photos were accurate and the space is even better in person. Move-in ready and professionally cleaned.','approved','2026-02-20 00:42:25','2026-04-27 00:42:25'),(927,12,'Botble\\RealEstate\\Models\\Property',43,3,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-04-03 00:42:25','2026-04-27 00:42:25'),(929,10,'Botble\\RealEstate\\Models\\Property',2,1,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-03-22 00:42:25','2026-04-27 00:42:25'),(931,3,'Botble\\RealEstate\\Models\\Property',33,2,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-04-08 00:42:25','2026-04-27 00:42:25'),(939,12,'Botble\\RealEstate\\Models\\Property',23,1,'The neighborhood is vibrant with lots of cafes and restaurants nearby. Perfect for young professionals.','approved','2026-01-15 00:42:25','2026-04-27 00:42:25'),(944,6,'Botble\\RealEstate\\Models\\Project',14,4,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-04-11 00:42:25','2026-04-27 00:42:25'),(949,10,'Botble\\RealEstate\\Models\\Property',33,2,'The property has character and charm while still offering modern conveniences. Best of both worlds.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(950,1,'Botble\\RealEstate\\Models\\Project',15,5,'Smart home integration throughout the project. Modern living at its finest.','approved','2026-04-24 00:42:25','2026-04-27 00:42:25'),(951,12,'Botble\\RealEstate\\Models\\Property',13,3,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-01-29 00:42:25','2026-04-27 00:42:25'),(955,10,'Botble\\RealEstate\\Models\\Property',52,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-03-08 00:42:25','2026-04-27 00:42:25'),(959,10,'Botble\\RealEstate\\Models\\Property',42,5,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-02-15 00:42:25','2026-04-27 00:42:25'),(963,10,'Botble\\RealEstate\\Models\\Property',17,4,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-02-21 00:42:25','2026-04-27 00:42:25'),(965,10,'Botble\\RealEstate\\Models\\Property',19,3,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-04-10 00:42:25','2026-04-27 00:42:25'),(971,3,'Botble\\RealEstate\\Models\\Property',32,4,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-04-25 00:42:25','2026-04-27 00:42:25'),(973,3,'Botble\\RealEstate\\Models\\Property',24,3,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-02-10 00:42:25','2026-04-27 00:42:25'),(977,9,'Botble\\RealEstate\\Models\\Property',24,2,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(979,12,'Botble\\RealEstate\\Models\\Property',59,1,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-02-28 00:42:25','2026-04-27 00:42:25'),(981,10,'Botble\\RealEstate\\Models\\Property',32,4,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-03-03 00:42:25','2026-04-27 00:42:25'),(985,7,'Botble\\RealEstate\\Models\\Property',5,3,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-02-08 00:42:25','2026-04-27 00:42:25'),(988,9,'Botble\\RealEstate\\Models\\Project',12,5,'The lobby and entrance areas make a great first impression on visitors.','approved','2026-01-15 00:42:25','2026-04-27 00:42:25'),(991,7,'Botble\\RealEstate\\Models\\Property',34,4,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-01-04 00:42:25','2026-04-27 00:42:25'),(992,9,'Botble\\RealEstate\\Models\\Project',11,1,'Project management was transparent throughout the development phase. Regular updates kept buyers informed.','approved','2026-03-06 00:42:25','2026-04-27 00:42:25'),(998,12,'Botble\\RealEstate\\Models\\Project',8,1,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-04-15 00:42:25','2026-04-27 00:42:25'),(999,5,'Botble\\RealEstate\\Models\\Property',33,4,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-02-19 00:42:25','2026-04-27 00:42:25'),(1003,9,'Botble\\RealEstate\\Models\\Property',32,2,'Modern smart home features throughout. Energy-efficient appliances save on monthly bills.','approved','2026-01-29 00:42:25','2026-04-27 00:42:25'),(1009,4,'Botble\\RealEstate\\Models\\Property',27,3,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(1011,2,'Botble\\RealEstate\\Models\\Property',59,1,'Absolutely loved this property! The location is perfect for commuting to work, and the neighborhood is very safe and friendly. Would highly recommend to anyone looking for a great place to live.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(1013,10,'Botble\\RealEstate\\Models\\Property',31,1,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-24 00:42:25','2026-04-27 00:42:25'),(1014,8,'Botble\\RealEstate\\Models\\Project',11,3,'The project completion ahead of schedule shows excellent project management.','approved','2026-03-17 00:42:25','2026-04-27 00:42:25'),(1015,8,'Botble\\RealEstate\\Models\\Property',21,2,'The property has great resale potential. Smart investment for the future.','approved','2026-03-13 00:42:25','2026-04-27 00:42:25'),(1019,4,'Botble\\RealEstate\\Models\\Property',2,3,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-02-25 00:42:25','2026-04-27 00:42:25'),(1023,11,'Botble\\RealEstate\\Models\\Property',17,5,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-01-21 00:42:25','2026-04-27 00:42:25'),(1033,5,'Botble\\RealEstate\\Models\\Property',5,5,'Love the outdoor space - perfect for gardening and entertaining guests.','approved','2026-03-19 00:42:25','2026-04-27 00:42:25'),(1039,10,'Botble\\RealEstate\\Models\\Property',43,3,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-01-30 00:42:25','2026-04-27 00:42:25'),(1041,1,'Botble\\RealEstate\\Models\\Property',26,5,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-01-11 00:42:25','2026-04-27 00:42:25'),(1043,2,'Botble\\RealEstate\\Models\\Property',23,5,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-03-20 00:42:25','2026-04-27 00:42:25'),(1045,8,'Botble\\RealEstate\\Models\\Property',55,5,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(1046,10,'Botble\\RealEstate\\Models\\Project',8,4,'Great investment opportunity. The project is in a rapidly developing area with strong growth potential.','approved','2026-02-14 00:42:25','2026-04-27 00:42:25'),(1049,2,'Botble\\RealEstate\\Models\\Property',51,1,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(1055,7,'Botble\\RealEstate\\Models\\Property',61,5,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-01-22 00:42:25','2026-04-27 00:42:25'),(1061,5,'Botble\\RealEstate\\Models\\Property',24,4,'Quiet neighbors and a peaceful atmosphere. Perfect for working from home.','approved','2026-03-07 00:42:25','2026-04-27 00:42:25'),(1065,7,'Botble\\RealEstate\\Models\\Property',52,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-04-02 00:42:25','2026-04-27 00:42:25'),(1069,10,'Botble\\RealEstate\\Models\\Property',14,5,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-01-23 00:42:25','2026-04-27 00:42:25'),(1071,12,'Botble\\RealEstate\\Models\\Property',16,1,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-03-15 00:42:25','2026-04-27 00:42:25'),(1072,1,'Botble\\RealEstate\\Models\\Project',3,1,'High-quality materials used in construction. You can see the attention to detail in every corner.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(1079,1,'Botble\\RealEstate\\Models\\Property',37,4,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-04-13 00:42:25','2026-04-27 00:42:25'),(1085,3,'Botble\\RealEstate\\Models\\Property',4,2,'Excellent value for money. The property exceeded my expectations in terms of quality and comfort. The landlord was very responsive and helpful throughout.','approved','2026-01-08 00:42:25','2026-04-27 00:42:25'),(1086,9,'Botble\\RealEstate\\Models\\Project',18,5,'Parking facilities are well-planned with ample space for residents and visitors.','approved','2026-03-06 00:42:25','2026-04-27 00:42:25'),(1087,5,'Botble\\RealEstate\\Models\\Property',1,3,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-02-12 00:42:25','2026-04-27 00:42:25'),(1089,5,'Botble\\RealEstate\\Models\\Property',13,3,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-03-01 00:42:25','2026-04-27 00:42:25'),(1097,3,'Botble\\RealEstate\\Models\\Property',31,2,'Perfect starter home for young couples. Affordable yet comfortable with all necessary amenities. Great community atmosphere.','approved','2026-03-11 00:42:25','2026-04-27 00:42:25'),(1099,6,'Botble\\RealEstate\\Models\\Property',11,1,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-04-19 00:42:25','2026-04-27 00:42:25'),(1105,9,'Botble\\RealEstate\\Models\\Property',56,2,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-03-14 00:42:25','2026-04-27 00:42:25'),(1107,2,'Botble\\RealEstate\\Models\\Property',30,2,'The attention to detail in this property is impressive. Quality fixtures and finishes throughout.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(1109,2,'Botble\\RealEstate\\Models\\Property',1,5,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-02-09 00:42:25','2026-04-27 00:42:25'),(1115,5,'Botble\\RealEstate\\Models\\Property',4,1,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(1119,9,'Botble\\RealEstate\\Models\\Property',59,1,'Generous closet space and built-in storage solutions. Perfect for those who value organization.','approved','2026-04-14 00:42:25','2026-04-27 00:42:25'),(1127,1,'Botble\\RealEstate\\Models\\Property',14,5,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-02-02 00:42:25','2026-04-27 00:42:25'),(1128,9,'Botble\\RealEstate\\Models\\Project',5,2,'Developer reputation speaks for itself. This project maintains their high standards.','approved','2026-04-15 00:42:25','2026-04-27 00:42:25'),(1129,9,'Botble\\RealEstate\\Models\\Property',1,5,'High-quality construction materials visible throughout. This property was built to last.','approved','2026-04-27 00:42:25','2026-04-27 00:42:25'),(1141,3,'Botble\\RealEstate\\Models\\Property',52,2,'Outstanding property management. Any issues were addressed promptly. The security features give peace of mind.','approved','2026-01-18 00:42:25','2026-04-27 00:42:25'),(1143,4,'Botble\\RealEstate\\Models\\Property',20,2,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-01-20 00:42:25','2026-04-27 00:42:25'),(1147,6,'Botble\\RealEstate\\Models\\Property',24,4,'The community amenities are fantastic - pool, gym, and clubhouse all well-maintained.','approved','2026-04-23 00:42:25','2026-04-27 00:42:25'),(1149,1,'Botble\\RealEstate\\Models\\Property',34,1,'Prime location near downtown but surprisingly quiet. Best of both worlds - urban convenience with suburban peace.','approved','2026-02-22 00:42:25','2026-04-27 00:42:25'),(1151,11,'Botble\\RealEstate\\Models\\Property',39,3,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-01-03 00:42:25','2026-04-27 00:42:25'),(1161,3,'Botble\\RealEstate\\Models\\Property',14,4,'Loved the open floor plan and high ceilings. Natural ventilation is excellent, reducing energy costs significantly.','approved','2026-03-02 00:42:25','2026-04-27 00:42:25'),(1162,9,'Botble\\RealEstate\\Models\\Project',7,3,'Security features throughout the project are state-of-the-art. Feel safe living here.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(1163,8,'Botble\\RealEstate\\Models\\Property',18,4,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-05 00:42:25','2026-04-27 00:42:25'),(1164,2,'Botble\\RealEstate\\Models\\Project',5,4,'The amenities included in this project are world-class. Swimming pool, gym, and community spaces are all beautifully designed.','approved','2026-02-23 00:42:25','2026-04-27 00:42:25'),(1165,11,'Botble\\RealEstate\\Models\\Property',1,5,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-03-30 00:42:25','2026-04-27 00:42:25'),(1169,3,'Botble\\RealEstate\\Models\\Property',2,5,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2026-03-29 00:42:25','2026-04-27 00:42:25'),(1173,10,'Botble\\RealEstate\\Models\\Property',6,3,'Wonderful experience from viewing to move-in. The agent was professional and answered all my questions thoroughly.','approved','2026-04-26 00:42:25','2026-04-27 00:42:25'),(1177,4,'Botble\\RealEstate\\Models\\Property',14,1,'Family-friendly community with excellent schools nearby. Safe streets for children to play.','approved','2026-03-29 00:42:25','2026-04-27 00:42:25'),(1179,6,'Botble\\RealEstate\\Models\\Property',54,1,'The layout is practical and space-efficient. Every square foot is well utilized.','approved','2026-03-10 00:42:25','2026-04-27 00:42:25'),(1183,3,'Botble\\RealEstate\\Models\\Property',25,1,'Great investment property. Already seeing good returns. Location ensures consistent demand from tenants.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25'),(1185,6,'Botble\\RealEstate\\Models\\Property',31,3,'Exceptional customer service from the real estate team. They made the entire process smooth and stress-free.','approved','2026-01-28 00:42:25','2026-04-27 00:42:25'),(1189,10,'Botble\\RealEstate\\Models\\Property',27,1,'Great property with modern amenities. The kitchen is spacious and well-equipped. Only wish the parking area was a bit larger.','approved','2026-01-10 00:42:25','2026-04-27 00:42:25'),(1195,8,'Botble\\RealEstate\\Models\\Property',50,2,'Central location means everything is just minutes away. Very convenient for daily errands.','approved','2026-01-14 00:42:25','2026-04-27 00:42:25'),(1201,2,'Botble\\RealEstate\\Models\\Property',46,3,'The property has great resale potential. Smart investment for the future.','approved','2026-01-16 00:42:25','2026-04-27 00:42:25'),(1205,2,'Botble\\RealEstate\\Models\\Property',38,4,'The property has great resale potential. Smart investment for the future.','approved','2026-03-16 00:42:25','2026-04-27 00:42:25'),(1207,4,'Botble\\RealEstate\\Models\\Property',52,1,'The property is well-maintained and in a prime location. Close to schools, shopping centers, and public transportation. Perfect for families.','approved','2025-12-28 00:42:25','2026-04-27 00:42:25'),(1209,11,'Botble\\RealEstate\\Models\\Property',59,3,'Beautiful home with amazing natural light. The garden is well-maintained and perfect for weekend barbecues. Very happy with my decision.','approved','2026-01-13 00:42:25','2026-04-27 00:42:25'),(1211,9,'Botble\\RealEstate\\Models\\Property',55,3,'Great natural lighting throughout the day. The south-facing windows make a huge difference.','approved','2026-04-06 00:42:25','2026-04-27 00:42:25'),(1213,8,'Botble\\RealEstate\\Models\\Property',1,3,'Stunning views from the balcony. The interior design is modern and tasteful. Highly recommend for professionals seeking a quiet retreat.','approved','2026-03-23 00:42:25','2026-04-27 00:42:25'),(1215,10,'Botble\\RealEstate\\Models\\Property',56,2,'Well-insulated property keeps energy costs low. Comfortable in both summer and winter.','approved','2026-04-16 00:42:25','2026-04-27 00:42:25'),(1218,9,'Botble\\RealEstate\\Models\\Project',15,3,'Community events organized by the management create a wonderful neighborhood atmosphere.','approved','2026-02-15 00:42:25','2026-04-27 00:42:25'),(1219,8,'Botble\\RealEstate\\Models\\Property',48,3,'The property has great resale potential. Smart investment for the future.','approved','2026-03-21 00:42:25','2026-04-27 00:42:25');
/*!40000 ALTER TABLE `re_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.phone-number\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"pages.export\":true,\"pages.import\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"announcements.index\":true,\"announcements.create\":true,\"announcements.edit\":true,\"announcements.destroy\":true,\"announcements.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"blog.reports\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"careers.index\":true,\"careers.create\":true,\"careers.edit\":true,\"careers.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"page-translations.export\":true,\"page-translations.import\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"unverified-accounts.index\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"coupons.index\":true,\"coupons.destroy\":true,\"real-estate.settings.general\":true,\"real-estate.settings.currencies\":true,\"real-estate.settings.accounts\":true,\"real-estate.settings.invoices\":true,\"real-estate.settings.invoice-template\":true,\"reports.index\":true,\"property.export\":true,\"property.import\":true,\"project.export\":true,\"project.import\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2026-04-27 00:42:16','2026-04-27 00:42:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','2e4d122e29286e8c1c39ba7aa1bde900',NULL,'2026-04-27 00:42:25'),(2,'api_enabled','0',NULL,'2026-04-27 00:42:25'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"announcement\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"faq\",\"fob-mortgage-calculator\",\"location\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]',NULL,'2026-04-27 00:42:25'),(4,'analytics_dashboard_widgets','0','2026-04-27 00:42:13','2026-04-27 00:42:13'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2026-04-27 00:42:13','2026-04-27 00:42:13'),(6,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2026-04-27 00:42:14','2026-04-27 00:42:14'),(7,'payment_cod_fee_type','fixed',NULL,'2026-04-27 00:42:25'),(8,'payment_bank_transfer_fee_type','fixed',NULL,'2026-04-27 00:42:25'),(9,'real_estate_mandatory_fields_at_consult_form','[\"email\"]',NULL,'2026-04-27 00:42:25'),(10,'theme','homzen',NULL,'2026-04-27 00:42:25'),(11,'show_admin_bar','1',NULL,'2026-04-27 00:42:25'),(12,'language_hide_default','1',NULL,'2026-04-27 00:42:25'),(13,'language_switcher_display','dropdown',NULL,'2026-04-27 00:42:25'),(14,'language_display','all',NULL,'2026-04-27 00:42:25'),(15,'language_hide_languages','[]',NULL,'2026-04-27 00:42:25'),(16,'permalink-botble-blog-models-post','news',NULL,'2026-04-27 00:42:25'),(17,'permalink-botble-blog-models-category','news',NULL,'2026-04-27 00:42:25'),(18,'payment_cod_status','1',NULL,'2026-04-27 00:42:25'),(19,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2026-04-27 00:42:25'),(20,'payment_bank_transfer_status','1',NULL,'2026-04-27 00:42:25'),(21,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2026-04-27 00:42:25'),(22,'payment_stripe_payment_type','stripe_checkout',NULL,'2026-04-27 00:42:25'),(23,'real_estate_display_views_count_in_detail_page','1',NULL,'2026-04-27 00:42:25'),(24,'theme-homzen-site_title','Homzen',NULL,'2026-04-27 00:42:25'),(25,'theme-homzen-seo_description','Find your favorite homes at Homzen',NULL,'2026-04-27 00:42:25'),(26,'theme-homzen-copyright','©%Y Homzen is Proudly Powered by Botble Team.',NULL,'2026-04-27 00:42:25'),(27,'theme-homzen-favicon','general/favicon.png',NULL,'2026-04-27 00:42:25'),(28,'theme-homzen-logo','general/logo.png',NULL,'2026-04-27 00:42:25'),(29,'theme-homzen-logo_light','general/logo-light.png',NULL,'2026-04-27 00:42:25'),(30,'theme-homzen-preloader_enabled','yes',NULL,'2026-04-27 00:42:25'),(31,'theme-homzen-preloader_version','v2',NULL,'2026-04-27 00:42:25'),(32,'theme-homzen-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,'2026-04-27 00:42:25'),(33,'theme-homzen-social_sharing','[[{\"key\":\"social\",\"value\":\"facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"}],[{\"key\":\"social\",\"value\":\"x\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"}],[{\"key\":\"social\",\"value\":\"pinterest\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-pinterest\"}],[{\"key\":\"social\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"}],[{\"key\":\"social\",\"value\":\"whatsapp\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-whatsapp\"}],[{\"key\":\"social\",\"value\":\"email\"},{\"key\":\"icon\",\"value\":\"ti ti-mail\"}]]',NULL,'2026-04-27 00:42:25'),(34,'theme-homzen-primary_color','#db1d23',NULL,'2026-04-27 00:42:25'),(35,'theme-homzen-hover_color','#cd380f',NULL,'2026-04-27 00:42:25'),(36,'theme-homzen-footer_background_color','#161e2d',NULL,'2026-04-27 00:42:25'),(37,'theme-homzen-footer_background_image','general/banner-footer.png',NULL,'2026-04-27 00:42:25'),(38,'theme-homzen-use_modal_for_authentication','1',NULL,'2026-04-27 00:42:25'),(39,'theme-homzen-homepage_id','1',NULL,'2026-04-27 00:42:25'),(40,'theme-homzen-blog_page_id','6',NULL,'2026-04-27 00:42:25'),(41,'theme-homzen-hotline','0123 456 789',NULL,'2026-04-27 00:42:25'),(42,'theme-homzen-email','contact@botble.com',NULL,'2026-04-27 00:42:25'),(43,'theme-homzen-breadcrumb_background_color','#f7f7f7',NULL,'2026-04-27 00:42:25'),(44,'theme-homzen-breadcrumb_text_color','#161e2d',NULL,'2026-04-27 00:42:25'),(45,'theme-homzen-lazy_load_images','1',NULL,'2026-04-27 00:42:25'),(46,'theme-homzen-lazy_load_placeholder_image','general/placeholder.png',NULL,'2026-04-27 00:42:25'),(47,'theme-homzen-newsletter_popup_enable','1',NULL,'2026-04-27 00:42:25'),(48,'theme-homzen-newsletter_popup_image','general/newsletter-image.jpg',NULL,'2026-04-27 00:42:25'),(49,'theme-homzen-newsletter_popup_title','Let’s join our newsletter!',NULL,'2026-04-27 00:42:25'),(50,'theme-homzen-newsletter_popup_subtitle','Weekly Updates',NULL,'2026-04-27 00:42:25'),(51,'theme-homzen-newsletter_popup_description','Do not worry we don’t spam!',NULL,'2026-04-27 00:42:25'),(52,'theme-homzen-properties_list_page_id','14',NULL,'2026-04-27 00:42:25'),(53,'theme-homzen-projects_list_page_id','15',NULL,'2026-04-27 00:42:25'),(54,'announcement_max_width','2481',NULL,NULL),(55,'announcement_text_color','#161e2d',NULL,NULL),(56,'announcement_background_color','transparent',NULL,NULL),(57,'announcement_text_alignment','start',NULL,NULL),(58,'announcement_dismissible','0',NULL,NULL),(59,'announcement_placement','theme',NULL,NULL),(60,'announcement_autoplay','1',NULL,NULL),(61,'announcement_autoplay_delay','5000',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`),
  KEY `idx_key_prefix` (`key`,`prefix`),
  KEY `idx_slugs_reference` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(2,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(3,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(4,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(5,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(6,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2026-04-27 00:42:16','2026-04-27 00:42:16'),(7,'walnut-park-apartments',1,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(8,'sunshine-wonder-villas',2,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(9,'diamond-island',3,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(10,'the-nassim',4,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(11,'vinhomes-grand-park',5,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(12,'the-metropole-thu-thiem',6,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(13,'villa-on-grand-avenue',7,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(14,'traditional-food-restaurant',8,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(15,'villa-on-hollywood-boulevard',9,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(16,'office-space-at-northwest-107th',10,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(17,'home-in-merrick-way',11,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(18,'adarsh-greens',12,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(19,'rustomjee-evershine-global-city',13,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(20,'godrej-exquisite',14,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(21,'godrej-prime',15,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(22,'ps-panache',16,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(23,'upturn-atmiya-centria',17,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(24,'brigade-oasis',18,'Botble\\RealEstate\\Models\\Project','projects','2026-04-27 00:42:20','2026-04-27 00:42:20'),(25,'3-beds-villa-calpe-alicante',1,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:20','2026-04-27 00:42:20'),(26,'lavida-plus-office-tel-1-bedroom',2,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:20','2026-04-27 00:42:20'),(27,'vinhomes-grand-park-studio-1-bedroom',3,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:20','2026-04-27 00:42:20'),(28,'the-sun-avenue-office-tel-1-bedroom',4,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:20','2026-04-27 00:42:20'),(29,'property-for-sale-johannesburg-south-africa',5,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:20','2026-04-27 00:42:20'),(30,'stunning-french-inspired-manor',6,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(31,'villa-for-sale-at-bermuda-dunes',7,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(32,'walnut-park-apartment',8,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(33,'5-beds-luxury-house',9,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(34,'family-victorian-view-home',10,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(35,'osaka-heights-apartment',11,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(36,'private-estate-magnificent-views',12,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(37,'thompson-road-house-for-rent',13,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(38,'brand-new-1-bedroom-apartment-in-first-class-location',14,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(39,'elegant-family-home-presents-premium-modern-living',15,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(40,'luxury-apartments-in-singapore-for-sale',16,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(41,'5-room-luxury-penthouse-for-sale-in-kuala-lumpur',17,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(42,'2-floor-house-in-compound-pejaten-barat-kemang',18,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(43,'apartment-muiderstraatweg-in-diemen',19,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(44,'nice-apartment-for-rent-in-berlin',20,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(45,'pumpkin-key-private-island',21,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(46,'maplewood-estates',22,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(47,'pine-ridge-manor',23,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(48,'oak-hill-residences',24,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(49,'sunnybrook-villas',25,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(50,'riverstone-condominiums',26,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(51,'cedar-park-apartments',27,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(52,'lakeside-retreat',28,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(53,'willow-creek-homes',29,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(54,'grandview-heights',30,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(55,'forest-glen-cottages',31,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(56,'harborview-towers',32,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(57,'meadowlands-estates',33,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(58,'highland-meadows',34,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(59,'brookfield-gardens',35,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(60,'silverwood-villas',36,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(61,'evergreen-terrace',37,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(62,'golden-gate-residences',38,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(63,'spring-blossom-park',39,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(64,'horizon-pointe',40,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(65,'whispering-pines-lodge',41,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(66,'sunset-ridge',42,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(67,'timberline-estates',43,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(68,'crystal-lake-condos',44,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(69,'briarwood-apartments',45,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(70,'summit-view',46,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(71,'elmwood-park',47,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(72,'stonegate-homes',48,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(73,'rosewood-villas',49,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(74,'prairie-meadows',50,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(75,'hawthorne-heights',51,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(76,'sierra-vista',52,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(77,'autumn-leaves',53,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(78,'blue-sky-residences',54,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(79,'pebble-creek',55,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(80,'magnolia-manor',56,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(81,'cherry-blossom-estates',57,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(82,'windsor-park',58,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(83,'seaside-villas',59,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(84,'mountain-view-retreat',60,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(85,'amberwood-apartments',61,'Botble\\RealEstate\\Models\\Property','properties','2026-04-27 00:42:21','2026-04-27 00:42:21'),(86,'buying-a-home',1,'Botble\\Blog\\Models\\Category','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(87,'selling-a-home',2,'Botble\\Blog\\Models\\Category','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(88,'market-trends',3,'Botble\\Blog\\Models\\Category','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(89,'home-improvement',4,'Botble\\Blog\\Models\\Category','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(90,'real-estate-investing',5,'Botble\\Blog\\Models\\Category','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(91,'neighborhood-guides',6,'Botble\\Blog\\Models\\Category','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(92,'tips',1,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(93,'investing',2,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(94,'market-analysis',3,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(95,'diy',4,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(96,'luxury-homes',5,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(97,'first-time-buyers',6,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(98,'property-management',7,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(99,'renovation',8,'Botble\\Blog\\Models\\Tag','tag','2026-04-27 00:42:22','2026-04-27 00:42:22'),(100,'top-10-tips-for-first-time-home-buyers',1,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(101,'how-to-stage-your-home-for-a-quick-sale',2,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(102,'understanding-the-current-real-estate-market-trends',3,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(103,'diy-home-improvement-projects-that-add-value',4,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(104,'a-beginners-guide-to-real-estate-investing',5,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(105,'how-to-choose-the-right-neighborhood-for-your-family',6,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(106,'luxury-homes-what-to-look-for',7,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(107,'property-management-best-practices-for-landlords',8,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(108,'renovation-ideas-to-increase-your-homes-value',9,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(109,'the-ultimate-guide-to-buying-a-vacation-home',10,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(110,'how-to-successfully-sell-your-home-in-a-buyers-market',11,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(111,'home-inspection-what-to-expect-and-how-to-prepare',12,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(112,'eco-friendly-home-improvements-for-sustainable-living',13,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(113,'how-to-navigate-the-mortgage-process',14,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(114,'real-estate-market-analysis-what-you-need-to-know',15,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(115,'tips-for-renting-out-your-property',16,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(116,'understanding-property-taxes-and-how-to-lower-them',17,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(117,'the-benefits-of-smart-home-technology',18,'Botble\\Blog\\Models\\Post','news','2026-04-27 00:42:22','2026-04-27 00:42:22'),(118,'homepage-1',1,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(119,'homepage-2',2,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(120,'homepage-3',3,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(121,'homepage-4',4,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(122,'homepage-5',5,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(123,'blog',6,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(124,'contact-us',7,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(125,'our-services',8,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(126,'faqs',9,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(127,'about-us',10,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(128,'pricing-plans',11,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(129,'privacy-policy',12,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(130,'coming-soon',13,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(131,'properties',14,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(132,'projects',15,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(133,'cookie-policy',16,'Botble\\Page\\Models\\Page','','2026-04-27 00:42:24','2026-04-27 00:42:24'),(134,'senior-full-stack-engineer-creator-success-full-time',1,'ArchiElite\\Career\\Models\\Career','careers','2026-04-27 00:42:25','2026-04-27 00:42:25'),(135,'data-science-specialist-analytics-division',2,'ArchiElite\\Career\\Models\\Career','careers','2026-04-27 00:42:25','2026-04-27 00:42:25'),(136,'product-marketing-manager-growth-team',3,'ArchiElite\\Career\\Models\\Career','careers','2026-04-27 00:42:25','2026-04-27 00:42:25'),(137,'uxui-designer-user-experience-team',4,'ArchiElite\\Career\\Models\\Career','careers','2026-04-27 00:42:25','2026-04-27 00:42:25'),(138,'operations-manager-supply-chain-division',5,'ArchiElite\\Career\\Models\\Career','careers','2026-04-27 00:42:25','2026-04-27 00:42:25'),(139,'financial-analyst-investment-group',6,'ArchiElite\\Career\\Models\\Career','careers','2026-04-27 00:42:25','2026-04-27 00:42:25'),(140,'john',1,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(141,'sarah',2,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(142,'michael',3,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(143,'emily',4,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(144,'david',5,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(145,'jennifer',6,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(146,'robert',7,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(147,'lisa',8,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(148,'james',9,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(149,'amanda',10,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(150,'william',11,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25'),(151,'jessica',12,'Botble\\RealEstate\\Models\\Account','agents','2026-04-27 00:42:25','2026-04-27 00:42:25');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`),
  KEY `idx_slugid_key_prefix` (`slugs_id`,`key`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`),
  KEY `idx_states_name` (`name`),
  KEY `idx_states_status` (`status`),
  KEY `idx_states_country_id` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,'locations/5.jpg',0,'published',NULL,NULL),(2,'England','england','EN',2,0,'locations/4.jpg',0,'published',NULL,NULL),(3,'New York','new-york','NY',3,0,'locations/4.jpg',0,'published',NULL,NULL),(4,'Holland','holland','HL',4,0,'locations/3.jpg',0,'published',NULL,NULL),(5,'Denmark','denmark','DN',5,0,'locations/3.jpg',0,'published',NULL,NULL),(6,'Bavaria','bavaria','BY',6,0,'locations/2.jpg',0,'published',NULL,NULL),(7,'Tokyo','tokyo','TK',7,0,'locations/1.jpg',0,'published',NULL,NULL),(8,'Ontario','ontario','ON',8,0,'locations/1.jpg',0,'published',NULL,NULL),(9,'New South Wales','new-south-wales','NSW',9,0,'locations/3.jpg',0,'published',NULL,NULL),(10,'Lombardy','lombardy','LO',10,0,'locations/2.jpg',0,'published',NULL,NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`),
  KEY `idx_states_trans_state_lang` (`states_id`,`lang_code`),
  KEY `idx_states_trans_name` (`name`),
  KEY `idx_states_trans_states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Tips',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(2,'Investing',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(3,'Market Analysis',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(4,'DIY',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(5,'Luxury Homes',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(6,'First-time Buyers',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(7,'Property Management',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22'),(8,'Renovation',1,'Botble\\ACL\\Models\\User',NULL,'published','2026-04-27 00:42:22','2026-04-27 00:42:22');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`),
  KEY `idx_tags_trans_tags_id` (`tags_id`),
  KEY `idx_tags_trans_tag_lang` (`tags_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Jennifer Lee','From the initial consultation to closing day, the real estate team went above and beyond to ensure I found the perfect home. Their dedication and professionalism made the entire process seamless. Thank you!','avatars/7.jpg','Happy Home Seeker','published','2026-04-27 00:42:21','2026-04-27 00:42:21'),(2,'Robert Evans','I am impressed by the level of expertise and commitment demonstrated by this real estate team. Their insights into the market helped me make informed investment decisions, and I couldn\'t be happier with the results.','avatars/9.jpg','Property Investor','published','2026-04-27 00:42:21','2026-04-27 00:42:21'),(3,'Jessica White','Selling my home with the help of this real estate team was a breeze. They provided valuable advice, staged my property beautifully, and negotiated a great deal. I highly recommend their services to anyone looking to sell their home!','avatars/7.jpg','Delighted Home Seller','published','2026-04-27 00:42:21','2026-04-27 00:42:21'),(4,'Daniel Miller','Thanks to the expertise and guidance of this real estate team, I am now the proud owner of my dream home. They listened to my preferences, answered all my questions, and made the entire home buying process a positive experience.','avatars/10.jpg','Happy New Homeowner','published','2026-04-27 00:42:21','2026-04-27 00:42:21');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`),
  KEY `idx_testimonials_trans_testimonials_id` (`testimonials_id`),
  KEY `idx_testimonials_trans_testimonial_lang` (`testimonials_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `sessions_invalidated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@company.com',NULL,NULL,'$2y$12$dHfyVaE7qJNQrF/T6Q.88epOFKlRzhiOqZqma3PHg.2/m4olVpDim',NULL,'2026-04-27 00:42:16','2026-04-27 00:42:16','System','Admin','admin',12,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_unique_index` (`theme`,`sidebar_id`,`widget_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SiteLogoWidget','top_footer_sidebar','homzen',1,'[]','2026-04-27 00:42:16','2026-04-27 00:42:16'),(2,'SocialLinksWidget','top_footer_sidebar','homzen',2,'{\"title\":\"Follow Us:\"}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(3,'SiteInformationWidget','inner_footer_sidebar','homzen',1,'{\"about\":\"Specializes in providing high-class tours for those in need. Contact Us\",\"items\":[[{\"key\":\"icon\",\"value\":\"ti ti-map-pin\"},{\"key\":\"text\",\"value\":\"101 E 129th St, East Chicago, IN 46312, US\"}],[{\"key\":\"icon\",\"value\":\"ti ti-phone-call\"},{\"key\":\"text\",\"value\":\"1-333-345-6868\"}],[{\"key\":\"icon\",\"value\":\"ti ti-mail\"},{\"key\":\"text\",\"value\":\"contact@botble.com\"}]]}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(4,'Botble\\Widget\\Widgets\\CoreSimpleMenu','inner_footer_sidebar','homzen',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Categories\",\"items\":[[{\"key\":\"label\",\"value\":\"Pricing Plans\"},{\"key\":\"url\",\"value\":\"\\/pricing-plans\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Our Services\"},{\"key\":\"url\",\"value\":\"\\/our-services\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"About Us\"},{\"key\":\"url\",\"value\":\"\\/about-us\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Contact Us\"},{\"key\":\"url\",\"value\":\"\\/contact-us\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(5,'Botble\\Widget\\Widgets\\CoreSimpleMenu','inner_footer_sidebar','homzen',3,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Our Company\",\"items\":[[{\"key\":\"label\",\"value\":\"Property For Sale\"},{\"key\":\"url\",\"value\":\"\\/properties?type=sale\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Property For Rent\"},{\"key\":\"url\",\"value\":\"\\/properties?type=rent\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Privacy Policy\"},{\"key\":\"url\",\"value\":\"\\/privacy-policy\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Our Agents\"},{\"key\":\"url\",\"value\":\"\\/agents\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(6,'NewsletterWidget','inner_footer_sidebar','homzen',4,'{\"title\":\"Newsletter\",\"subtitle\":\"Your Weekly\\/Monthly Dose of Knowledge and Inspiration\"}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(7,'SiteCopyrightWidget','bottom_footer_sidebar','homzen',1,'[]','2026-04-27 00:42:16','2026-04-27 00:42:16'),(8,'Botble\\Widget\\Widgets\\CoreSimpleMenu','bottom_footer_sidebar','homzen',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"items\":[[{\"key\":\"label\",\"value\":\"Terms Of Services\"},{\"key\":\"url\",\"value\":\"\\/our-services\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Privacy Policy\"},{\"key\":\"url\",\"value\":\"\\/privacy-policy\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Cookie Policy\"},{\"key\":\"url\",\"value\":\"\\/cookie-policy\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(9,'BlogSearchWidget','blog_sidebar','homzen',1,'{\"name\":\"Search\"}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(10,'BlogPostsWidget','blog_sidebar','homzen',2,'{\"name\":\"Recent Posts\",\"limit\":3}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(11,'BlogCategoriesWidget','blog_sidebar','homzen',3,'{\"name\":\"By Categories\",\"number_display\":8}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(12,'BlogTagsWidget','blog_sidebar','homzen',4,'{\"name\":\"Popular Tag\",\"number_display\":9}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(13,'RelatedPostsWidget','bottom_post_detail_sidebar','homzen',1,'{\"title\":\"News insight\",\"subtitle\":\"Related Posts\",\"limit\":3}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(14,'FriendsOfBotble\\MortgageCalculator\\Widgets\\MortgageCalculatorWidget','bottom_property_detail_sidebar','homzen',1,'{\"id\":\"FriendsOfBotble\\\\MortgageCalculator\\\\Widgets\\\\MortgageCalculatorWidget\",\"name\":\"Mortgage Calculator\",\"style\":\"default\",\"layout\":\"horizontal\",\"form_style\":\"default\",\"form_margin\":\"40px 0 40px\",\"form_padding\":\"\",\"default_price\":\"\",\"default_term\":\"\",\"default_rate\":\"\",\"default_down_payment_type\":\"\",\"default_down_payment_value\":\"\",\"show_extra_costs\":\"0\"}','2026-04-27 00:42:16','2026-04-27 00:42:16'),(15,'PropertyDisclaimerWidget','bottom_property_detail_sidebar','homzen',2,'[]','2026-04-27 00:42:16','2026-04-27 00:42:16');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-27 14:42:26
