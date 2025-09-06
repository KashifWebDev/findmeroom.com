-- MySQL dump 10.13  Distrib 5.7.44, for osx10.19 (x86_64)
--
-- Host: 127.0.0.1    Database: homzen
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `activations` VALUES (1,1,'TstvuPZoR7kgZ8yPvEupwIpmyknja8LG',1,'2024-06-27 00:25:14','2024-06-27 00:25:14','2024-06-27 00:25:14');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `careers`
--

DROP TABLE IF EXISTS `careers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `careers` VALUES (1,'Senior Full Stack Engineer, Creator Success Full Time','Lake Marcelina, Luxembourg','$7,774','Constantly changing work patterns and norms, and the need for organizational resiliency','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2024-06-27 00:25:24','2024-06-27 00:25:24'),(2,'Data Science Specialist, Analytics Division','Lake Lisettemouth, Tonga','$1,381','Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit laborum — semper quis lectus nulla','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2024-06-27 00:25:24','2024-06-27 00:25:24'),(3,'Product Marketing Manager, Growth Team','Konopelskichester, Heard Island and McDonald Islands','$4,990','Crafting compelling marketing strategies to drive user acquisition and retention','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2024-06-27 00:25:24','2024-06-27 00:25:24'),(4,'UX/UI Designer, User Experience Team','Nolanmouth, Libyan Arab Jamahiriya','$4,047','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2024-06-27 00:25:24','2024-06-27 00:25:24'),(5,'Operations Manager, Supply Chain Division','South Arturo, Peru','$5,825','Ensuring smooth and efficient supply chain operations for timely product delivery','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2024-06-27 00:25:24','2024-06-27 00:25:24'),(6,'Financial Analyst, Investment Group','New Priceberg, France','$681','Analyzing market trends and investment opportunities for optimal financial outcomes','<h4 class=\"color-brand-1\">Responsibilities</h4>\n<p>Product knowledge: Deeply understand the technology and features of the product area to which you are assigned.</p>\n<p>Research: Provide human and business impact and insights for products.</p>\n<p>Deliverables: Create deliverables for your product area (for example competitive analyses, user flows, low fidelity wireframes, high fidelity mockups, prototypes, etc.) that solve real user problems through the user experience.</p>\n<p>Communication: Communicate the results of UX activities within your product area to the design team department, cross-functional partners within your product area, and other interested Superformula team members using clear language that simplifies complexity.</p>\n<h4 class=\"color-brand-1\">Requirements</h4>\n<ul>\n    <li>A portfolio demonstrating well thought through and polished end to end customer journeys</li>\n    <li>5+ years of industry experience in interactive design and / or visual design</li>\n    <li>Excellent interpersonal skills </li>\n    <li>Aware of trends in mobile, communications, and collaboration</li>\n    <li>Ability to create highly polished design prototypes, mockups, and other communication artifacts</li>\n    <li>The ability to scope and estimate efforts accurately and prioritize tasks and goals independently</li>\n    <li>History of impacting shipping products with your work</li>\n    <li>A Bachelor’s Degree in Design (or related field) or equivalent professional experience</li>\n    <li>Proficiency in a variety of design tools such as Figma, Photoshop, Illustrator, and Sketch</li>\n</ul>\n<h4 class=\"color-brand-1\">What\'s on Offer </h4>\n<ul>\n    <li>Annual bonus and holidays, social welfare, and health checks.</li>\n    <li>Training and attachment in Taiwan and other Greater China branches.</li>\n</ul>\n','published','2024-06-27 00:25:24','2024-06-27 00:25:24');
/*!40000 ALTER TABLE `careers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `careers_translations`
--

DROP TABLE IF EXISTS `careers_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `careers_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
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
INSERT INTO `categories` VALUES (1,'Buying a Home',0,'Perferendis occaecati voluptas enim. Totam beatae fugit rerum fugit. Numquam expedita ea inventore blanditiis nam quia saepe.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(2,'Selling a Home',0,'Aut ea ea nam pariatur molestias velit. Voluptatem dolorem quis sunt rerum laudantium non. Omnis delectus hic unde ut at. Illum qui aperiam architecto blanditiis.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(3,'Market Trends',0,'Ut est nemo eaque exercitationem consequuntur nam. Cumque ab sit et nemo est. Facilis eos exercitationem qui voluptatem nisi voluptas.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(4,'Home Improvement',0,'Provident eum blanditiis sequi est ullam rerum. Pariatur blanditiis provident corrupti nisi. Ab est non est veritatis. Fugit fugit et ducimus at porro.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(5,'Real Estate Investing',0,'Nesciunt ipsum sed sed impedit reprehenderit modi vel. Similique laborum beatae totam voluptates eum. Possimus reprehenderit atque sint soluta ea.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(6,'Neighborhood Guides',0,'Veritatis asperiores optio illo consequatur tenetur veniam ea. Ipsum maxime temporibus asperiores laborum qui. Et fugiat soluta incidunt et ducimus et.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-06-27 00:25:20','2024-06-27 00:25:20');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/2.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(2,'London','london',2,2,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(3,'New York City','new-york-city',3,3,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(4,'Amsterdam','amsterdam',4,4,NULL,0,'locations/2.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(6,'Munich','munich',6,6,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(7,'Tokyo','tokyo',7,7,NULL,0,'locations/2.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(8,'Toronto','toronto',8,8,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(9,'Sydney','sydney',9,9,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(10,'Milan','milan',10,10,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(11,'Los Angeles','los-angeles',11,3,NULL,0,'locations/3.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(12,'Berlin','berlin',12,6,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(13,'Osaka','osaka',13,7,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(14,'Vancouver','vancouver',14,8,NULL,0,'locations/3.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(15,'Melbourne','melbourne',15,9,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(16,'Rome','rome',16,10,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(17,'Marseille','marseille',17,1,NULL,0,'locations/1.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(18,'Liverpool','liverpool',18,2,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(19,'Chicago','chicago',19,3,NULL,0,'locations/3.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(20,'Rotterdam','rotterdam',20,4,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(21,'Aarhus','aarhus',21,5,NULL,0,'locations/3.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(22,'Frankfurt','frankfurt',22,6,NULL,0,'locations/3.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(23,'Kyoto','kyoto',23,7,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(24,'Montreal','montreal',24,8,NULL,0,'locations/5.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(25,'Brisbane','brisbane',25,9,NULL,0,'locations/2.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(26,'Naples','naples',26,10,NULL,0,'locations/4.jpg',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`)
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published',NULL,NULL,'FRA'),(2,'England','English',0,0,'published',NULL,NULL,'UK'),(3,'USA','Americans',0,0,'published',NULL,NULL,'US'),(4,'Holland','Dutch',0,0,'published',NULL,NULL,'HL'),(5,'Denmark','Danish',0,0,'published',NULL,NULL,'DN'),(6,'Germany','German',0,0,'published',NULL,NULL,'DE'),(7,'Japan','Japanese',0,0,'published',NULL,NULL,'JP'),(8,'Canada','Canadian',0,0,'published',NULL,NULL,'CA'),(9,'Australia','Australian',0,0,'published',NULL,NULL,'AU'),(10,'Italy','Italian',0,0,'published',NULL,NULL,'IT');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `faq_categories` VALUES (1,'Buying',0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL),(2,'Selling',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL),(3,'Renting',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL),(4,'Financing',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `faqs` VALUES (1,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(2,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(3,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(4,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(5,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(6,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(7,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(8,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(9,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(10,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(11,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(12,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',2,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(13,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(14,'How do I determine my budget for buying a home?','To determine your budget, consider your income, debts, and savings. It is also important to get pre-approved for a mortgage to understand how much you can borrow.',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(15,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(16,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(17,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(18,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',3,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(19,'What steps are involved in buying a home?','The home buying process involves several steps including getting pre-approved for a mortgage, finding a real estate agent, searching for homes, making an offer, getting a home inspection, and closing the deal.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(20,'What is the process of selling a home?','Selling a home involves preparing your home for sale, setting a competitive price, marketing the property, showing the home to potential buyers, negotiating offers, and closing the sale.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(21,'How can I increase the value of my home before selling?','You can increase your home\'s value by making necessary repairs, updating outdated features, improving curb appeal, and ensuring the home is clean and well-maintained.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(22,'What should I look for in a rental property?','When looking for a rental property, consider factors such as location, rent price, amenities, lease terms, and the condition of the property. It\'s also important to understand your rights as a tenant.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(23,'What are the benefits of renting versus buying?','Renting offers flexibility and fewer maintenance responsibilities, while buying can provide long-term financial benefits and the freedom to customize your home. The decision depends on your financial situation, lifestyle, and future plans.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(24,'What types of financing options are available for homebuyers?','Common financing options include fixed-rate mortgages, adjustable-rate mortgages, FHA loans, VA loans, and USDA loans. Each has its own requirements and benefits.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13'),(25,'How do I improve my credit score for a mortgage?','To improve your credit score, pay your bills on time, reduce your debt, avoid opening new credit accounts, and check your credit report for errors.',4,'published','2024-06-27 00:25:13','2024-06-27 00:25:13');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `language_meta` VALUES (1,'en_US','8d6696d78b64ffa71ec09e3483ddcc47',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','b1bccd9ccb0bf6253ee46725efca9cf8',1,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',6977,'locations/1.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(2,0,'10','10',1,'image/jpeg',6977,'locations/10.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(3,0,'11','11',1,'image/jpeg',6977,'locations/11.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(4,0,'2','2',1,'image/jpeg',6977,'locations/2.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(5,0,'3','3',1,'image/jpeg',6977,'locations/3.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(6,0,'4','4',1,'image/jpeg',6977,'locations/4.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(7,0,'5','5',1,'image/jpeg',6977,'locations/5.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(8,0,'6','6',1,'image/jpeg',6977,'locations/6.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(9,0,'7','7',1,'image/jpeg',6977,'locations/7.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(10,0,'8','8',1,'image/jpeg',6977,'locations/8.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(11,0,'9','9',1,'image/jpeg',6977,'locations/9.jpg','[]','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'public'),(12,0,'1','1',2,'image/jpeg',3916,'avatars/1.jpg','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(13,0,'10','10',2,'image/png',3916,'avatars/10.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(14,0,'11','11',2,'image/png',3916,'avatars/11.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(15,0,'2','2',2,'image/jpeg',3916,'avatars/2.jpg','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(16,0,'3','3',2,'image/jpeg',3916,'avatars/3.jpg','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(17,0,'4','4',2,'image/jpeg',3916,'avatars/4.jpg','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(18,0,'4-1','4-1',2,'image/png',3916,'avatars/4-1.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(19,0,'5','5',2,'image/png',3916,'avatars/5.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(20,0,'6','6',2,'image/png',3916,'avatars/6.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(21,0,'7','7',2,'image/png',3916,'avatars/7.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(22,0,'8','8',2,'image/png',3916,'avatars/8.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(23,0,'9','9',2,'image/png',3916,'avatars/9.png','[]','2024-06-27 00:25:14','2024-06-27 00:25:14',NULL,'public'),(24,0,'1','1',3,'image/jpeg',9803,'properties/1.jpg','[]','2024-06-27 00:25:17','2024-06-27 00:25:17',NULL,'public'),(25,0,'10','10',3,'image/jpeg',9803,'properties/10.jpg','[]','2024-06-27 00:25:17','2024-06-27 00:25:17',NULL,'public'),(26,0,'11','11',3,'image/jpeg',9803,'properties/11.jpg','[]','2024-06-27 00:25:17','2024-06-27 00:25:17',NULL,'public'),(27,0,'12','12',3,'image/jpeg',9803,'properties/12.jpg','[]','2024-06-27 00:25:17','2024-06-27 00:25:17',NULL,'public'),(28,0,'13','13',3,'image/jpeg',9803,'properties/13.jpg','[]','2024-06-27 00:25:17','2024-06-27 00:25:17',NULL,'public'),(29,0,'2','2',3,'image/jpeg',9803,'properties/2.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(30,0,'3','3',3,'image/jpeg',9803,'properties/3.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(31,0,'4','4',3,'image/jpeg',9803,'properties/4.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(32,0,'5','5',3,'image/jpeg',9803,'properties/5.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(33,0,'6','6',3,'image/jpeg',9803,'properties/6.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(34,0,'7','7',3,'image/jpeg',9803,'properties/7.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(35,0,'8','8',3,'image/jpeg',9803,'properties/8.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(36,0,'9','9',3,'image/jpeg',9803,'properties/9.jpg','[]','2024-06-27 00:25:18','2024-06-27 00:25:18',NULL,'public'),(37,0,'1','1',4,'image/jpeg',9803,'posts/1.jpg','[]','2024-06-27 00:25:19','2024-06-27 00:25:19',NULL,'public'),(38,0,'10','10',4,'image/jpeg',9803,'posts/10.jpg','[]','2024-06-27 00:25:19','2024-06-27 00:25:19',NULL,'public'),(39,0,'2','2',4,'image/jpeg',9803,'posts/2.jpg','[]','2024-06-27 00:25:19','2024-06-27 00:25:19',NULL,'public'),(40,0,'3','3',4,'image/jpeg',9803,'posts/3.jpg','[]','2024-06-27 00:25:19','2024-06-27 00:25:19',NULL,'public'),(41,0,'4','4',4,'image/jpeg',9803,'posts/4.jpg','[]','2024-06-27 00:25:19','2024-06-27 00:25:19',NULL,'public'),(42,0,'5','5',4,'image/jpeg',9803,'posts/5.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(43,0,'6','6',4,'image/jpeg',9803,'posts/6.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(44,0,'7','7',4,'image/jpeg',9803,'posts/7.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(45,0,'8','8',4,'image/jpeg',9803,'posts/8.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(46,0,'9','9',4,'image/jpeg',9803,'posts/9.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(47,0,'md-1','md-1',4,'image/jpeg',9803,'posts/md-1.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(48,0,'md-2','md-2',4,'image/jpeg',9803,'posts/md-2.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(49,0,'about-us-contact','about-us-contact',5,'image/jpeg',19409,'pages/about-us-contact.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(50,0,'about-us-video','about-us-video',5,'image/jpeg',16191,'pages/about-us-video.jpg','[]','2024-06-27 00:25:20','2024-06-27 00:25:20',NULL,'public'),(51,0,'call-to-action','call-to-action',5,'image/png',9051,'pages/call-to-action.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(52,0,'house-service','house-service',5,'image/png',10923,'pages/house-service.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(53,0,'properties','properties',5,'image/png',16974,'pages/properties.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(54,0,'service-1','service-1',5,'image/png',24047,'pages/service-1.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(55,0,'service-2','service-2',5,'image/png',20728,'pages/service-2.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(56,0,'service-3','service-3',5,'image/png',22307,'pages/service-3.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(57,0,'service-4','service-4',5,'image/png',30364,'pages/service-4.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(58,0,'service-5','service-5',5,'image/png',29631,'pages/service-5.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(59,0,'service-6','service-6',5,'image/png',29837,'pages/service-6.png','[]','2024-06-27 00:25:21','2024-06-27 00:25:21',NULL,'public'),(60,0,'slider-1','slider-1',5,'image/jpeg',27445,'pages/slider-1.jpg','[]','2024-06-27 00:25:22','2024-06-27 00:25:22',NULL,'public'),(61,0,'slider-2','slider-2',5,'image/jpeg',23889,'pages/slider-2.jpg','[]','2024-06-27 00:25:22','2024-06-27 00:25:22',NULL,'public'),(62,0,'slider-3','slider-3',5,'image/jpeg',23889,'pages/slider-3.jpg','[]','2024-06-27 00:25:22','2024-06-27 00:25:22',NULL,'public'),(63,0,'slider-4','slider-4',5,'image/jpeg',23889,'pages/slider-4.jpg','[]','2024-06-27 00:25:22','2024-06-27 00:25:22',NULL,'public'),(64,0,'slider-5','slider-5',5,'image/jpeg',23889,'pages/slider-5.jpg','[]','2024-06-27 00:25:22','2024-06-27 00:25:22',NULL,'public'),(65,0,'slider-6','slider-6',5,'image/png',33637,'pages/slider-6.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(66,0,'slider-left','slider-left',5,'image/jpeg',11424,'pages/slider-left.jpg','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(67,0,'testimonial-banner','testimonial-banner',5,'image/png',13232,'pages/testimonial-banner.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(68,0,'asana','asana',6,'image/png',3510,'partners/asana.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(69,0,'github','github',6,'image/png',3510,'partners/github.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(70,0,'lhtech','lhtech',6,'image/png',3510,'partners/lhtech.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(71,0,'panadoxn','panadoxn',6,'image/png',3510,'partners/panadoxn.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(72,0,'shangxi','shangxi',6,'image/png',3510,'partners/shangxi.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(73,0,'tyaalpha','tyaalpha',6,'image/png',3510,'partners/tyaalpha.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(74,0,'vanfaba','vanfaba',6,'image/png',3510,'partners/vanfaba.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(75,0,'banner-footer','banner-footer',7,'image/png',180948,'general/banner-footer.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(76,0,'favicon','favicon',7,'image/png',1895,'general/favicon.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(77,0,'logo-light','logo-light',7,'image/png',4687,'general/logo-light.png','[]','2024-06-27 00:25:23','2024-06-27 00:25:23',NULL,'public'),(78,0,'logo','logo',7,'image/png',5429,'general/logo.png','[]','2024-06-27 00:25:24','2024-06-27 00:25:24',NULL,'public'),(79,0,'placeholder','placeholder',7,'image/png',16661,'general/placeholder.png','[]','2024-06-27 00:25:24','2024-06-27 00:25:24',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'locations',NULL,'locations',0,'2024-06-27 00:25:13','2024-06-27 00:25:13',NULL),(2,0,'avatars',NULL,'avatars',0,'2024-06-27 00:25:14','2024-06-27 00:25:14',NULL),(3,0,'properties',NULL,'properties',0,'2024-06-27 00:25:17','2024-06-27 00:25:17',NULL),(4,0,'posts',NULL,'posts',0,'2024-06-27 00:25:19','2024-06-27 00:25:19',NULL),(5,0,'pages',NULL,'pages',0,'2024-06-27 00:25:20','2024-06-27 00:25:20',NULL),(6,0,'partners',NULL,'partners',0,'2024-06-27 00:25:23','2024-06-27 00:25:23',NULL),(7,0,'general',NULL,'general',0,'2024-06-27 00:25:23','2024-06-27 00:25:23',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-06-27 00:25:23','2024-06-27 00:25:23');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,NULL,NULL,0,'Home',NULL,'_self',1,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(2,1,1,1,'Botble\\Page\\Models\\Page','/homepage-1',NULL,0,'Homepage 1',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2',NULL,0,'Homepage 2',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3',NULL,0,'Homepage 3',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4',NULL,0,'Homepage 4',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(6,1,1,5,'Botble\\Page\\Models\\Page','/homepage-5',NULL,0,'Homepage 5',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(7,1,0,NULL,NULL,'/projects',NULL,0,'Projects',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(8,1,0,NULL,NULL,'/properties',NULL,0,'Properties',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(9,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(10,1,9,NULL,NULL,'/agents',NULL,0,'Agents',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(11,1,9,NULL,NULL,'/careers',NULL,0,'Careers',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(12,1,9,NULL,NULL,'/wishlist',NULL,0,'Wishlist',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(13,1,9,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(14,1,9,8,'Botble\\Page\\Models\\Page','/our-services',NULL,0,'Our Services',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(15,1,9,11,'Botble\\Page\\Models\\Page','/pricing-plans',NULL,0,'Pricing',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(16,1,9,7,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact Us',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(17,1,9,9,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQs',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(18,1,9,12,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,0,'Privacy Policy',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(19,1,9,13,'Botble\\Page\\Models\\Page','/coming-soon',NULL,0,'Coming Soon',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(20,1,0,NULL,NULL,'#',NULL,0,'Blog',NULL,'_self',1,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(21,1,20,6,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog List',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23'),(22,1,20,NULL,NULL,'/news/the-benefits-of-smart-home-technology',NULL,0,'Blog Detail',NULL,'_self',0,'2024-06-27 00:25:23','2024-06-27 00:25:23');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-06-27 00:25:23','2024-06-27 00:25:23');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"ti ti-map\"]',1,'Botble\\RealEstate\\Models\\Category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(2,'icon','[\"ti ti-mail\"]',2,'Botble\\RealEstate\\Models\\Category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(3,'icon','[\"ti ti-bell\"]',3,'Botble\\RealEstate\\Models\\Category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(4,'icon','[\"ti ti-calendar\"]',4,'Botble\\RealEstate\\Models\\Category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(5,'icon','[\"ti ti-shopping-cart\"]',5,'Botble\\RealEstate\\Models\\Category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(6,'icon','[\"ti ti-home\"]',6,'Botble\\RealEstate\\Models\\Category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(7,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',1,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:14','2024-06-27 00:25:14'),(8,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',2,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:15','2024-06-27 00:25:15'),(9,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',3,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:15','2024-06-27 00:25:15'),(10,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',4,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:15','2024-06-27 00:25:15'),(11,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',5,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:15','2024-06-27 00:25:15'),(12,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',6,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:16','2024-06-27 00:25:16'),(13,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',7,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:16','2024-06-27 00:25:16'),(14,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',8,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:16','2024-06-27 00:25:16'),(15,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',9,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:16','2024-06-27 00:25:16'),(16,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',10,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:17','2024-06-27 00:25:17'),(17,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',11,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:17','2024-06-27 00:25:17'),(18,'social_links','[[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\\/\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-instagram\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.instagram.com\\/\"}],[{\"key\":\"name\",\"value\":\"Twitter\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.twitter.com\\/\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\\/\"}]]]',12,'Botble\\RealEstate\\Models\\Account','2024-06-27 00:25:17','2024-06-27 00:25:17'),(19,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',1,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(20,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',2,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(21,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',3,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(22,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',4,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(23,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',5,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(24,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',6,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(25,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',7,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(26,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',8,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(27,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',9,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(28,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',10,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(29,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',11,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(30,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',12,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(31,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',13,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:18','2024-06-27 00:25:18'),(32,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',14,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(33,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',15,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(34,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',16,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(35,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',17,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(36,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',18,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(37,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',19,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(38,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',20,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(39,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',21,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(40,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',22,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(41,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',23,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(42,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',24,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(43,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',25,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(44,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',26,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(45,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',27,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(46,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',28,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(47,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',29,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(48,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',30,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(49,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',31,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(50,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',32,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(51,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',33,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(52,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',34,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(53,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',35,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(54,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',36,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(55,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',37,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(56,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',38,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(57,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',39,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(58,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',40,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(59,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',41,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(60,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',42,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(61,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',43,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(62,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',44,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(63,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',45,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(64,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',46,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(65,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',47,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(66,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',48,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(67,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',49,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(68,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',50,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(69,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',51,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(70,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',52,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(71,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',53,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(72,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',54,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(73,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',55,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(74,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',56,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(75,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',57,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(76,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',58,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(77,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',59,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(78,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',60,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(79,'video_url','[\"https:\\/\\/youtu.be\\/tRxGSHL8bI0?si=kbumCspOMG-kJvTT\"]',61,'Botble\\RealEstate\\Models\\Property','2024-06-27 00:25:19','2024-06-27 00:25:19'),(80,'breadcrumb','[\"no\"]',1,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(81,'breadcrumb','[\"no\"]',2,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(82,'breadcrumb','[\"no\"]',3,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(83,'breadcrumb','[\"no\"]',5,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(84,'breadcrumb','[\"yes\"]',6,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(85,'breadcrumb','[\"yes\"]',7,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(86,'breadcrumb','[\"yes\"]',8,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(87,'breadcrumb','[\"yes\"]',9,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(88,'breadcrumb','[\"yes\"]',10,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(89,'breadcrumb','[\"yes\"]',11,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(90,'breadcrumb','[\"yes\"]',12,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(91,'breadcrumb','[\"no\"]',13,'Botble\\Page\\Models\\Page','2024-06-27 00:25:23','2024-06-27 00:25:23'),(92,'image','[\"general\\/job-details-thumb.png\"]',1,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(93,'icon','[\"icons\\/icon1.png\"]',1,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(94,'apply_url','[\"\\/contact\"]',1,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(95,'image','[\"general\\/job-details-thumb.png\"]',2,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(96,'icon','[\"icons\\/icon2.png\"]',2,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(97,'apply_url','[\"\\/contact\"]',2,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(98,'image','[\"general\\/job-details-thumb.png\"]',3,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(99,'icon','[\"icons\\/icon3.png\"]',3,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(100,'apply_url','[\"\\/contact\"]',3,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(101,'image','[\"general\\/job-details-thumb.png\"]',4,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(102,'icon','[\"icons\\/icon4.png\"]',4,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(103,'apply_url','[\"\\/contact\"]',4,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(104,'image','[\"general\\/job-details-thumb.png\"]',5,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(105,'icon','[\"icons\\/icon5.png\"]',5,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(106,'apply_url','[\"\\/contact\"]',5,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(107,'image','[\"general\\/job-details-thumb.png\"]',6,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(108,'icon','[\"icons\\/icon6.png\"]',6,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24'),(109,'apply_url','[\"\\/contact\"]',6,'ArchiElite\\Career\\Models\\Career','2024-06-27 00:25:24','2024-06-27 00:25:24');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(27,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(28,'2023_08_21_090810_make_page_content_nullable',1),(29,'2023_09_14_021936_update_index_for_slugs_table',1),(30,'2023_12_06_100448_change_random_hash_for_media',1),(31,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(32,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(33,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(34,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(35,'2024_05_16_100000_change_random_hash_for_media',1),(36,'2020_11_18_150916_ads_create_ads_table',2),(37,'2021_12_02_035301_add_ads_translations_table',2),(38,'2023_04_17_062645_add_open_in_new_tab',2),(39,'2023_11_07_023805_add_tablet_mobile_image',2),(40,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',2),(41,'2024_04_27_100730_improve_analytics_setting',3),(42,'2015_06_29_025744_create_audit_history',4),(43,'2023_11_14_033417_change_request_column_in_table_audit_histories',4),(44,'2015_06_18_033822_create_blog_table',5),(45,'2021_02_16_092633_remove_default_value_for_author_type',5),(46,'2021_12_03_030600_create_blog_translations',5),(47,'2022_04_19_113923_add_index_to_table_posts',5),(48,'2023_08_29_074620_make_column_author_id_nullable',5),(49,'2019_06_24_211801_create_career_table',6),(50,'2021_12_04_095357_create_careers_translations_table',6),(51,'2023_09_20_050420_add_missing_translation_column',6),(52,'2016_06_17_091537_create_contacts_table',7),(53,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',7),(54,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',7),(55,'2024_03_25_000001_update_captcha_settings_for_contact',7),(56,'2024_04_19_063914_create_custom_fields_table',7),(57,'2018_07_09_221238_create_faq_table',8),(58,'2021_12_03_082134_create_faq_translations',8),(59,'2023_11_17_063408_add_description_column_to_faq_categories_table',8),(60,'2016_10_03_032336_create_languages_table',9),(61,'2023_09_14_022423_add_index_for_language_table',9),(62,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(63,'2021_12_03_075608_create_page_translations',10),(64,'2023_07_06_011444_create_slug_translations_table',10),(65,'2019_11_18_061011_create_country_table',11),(66,'2021_12_03_084118_create_location_translations',11),(67,'2021_12_03_094518_migrate_old_location_data',11),(68,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',11),(69,'2022_01_16_085908_improve_plugin_location',11),(70,'2022_08_04_052122_delete_location_backup_tables',11),(71,'2023_04_23_061847_increase_state_translations_abbreviation_column',11),(72,'2023_07_26_041451_add_more_columns_to_location_table',11),(73,'2023_07_27_041451_add_more_columns_to_location_translation_table',11),(74,'2023_08_15_073307_drop_unique_in_states_cities_translations',11),(75,'2023_10_21_065016_make_state_id_in_table_cities_nullable',11),(76,'2017_10_24_154832_create_newsletter_table',12),(77,'2024_03_25_000001_update_captcha_settings_for_newsletter',12),(78,'2017_05_18_080441_create_payment_tables',13),(79,'2021_03_27_144913_add_customer_type_into_table_payments',13),(80,'2021_05_24_034720_make_column_currency_nullable',13),(81,'2021_08_09_161302_add_metadata_column_to_payments_table',13),(82,'2021_10_19_020859_update_metadata_field',13),(83,'2022_06_28_151901_activate_paypal_stripe_plugin',13),(84,'2022_07_07_153354_update_charge_id_in_table_payments',13),(85,'2018_06_22_032304_create_real_estate_table',14),(86,'2021_02_11_031126_update_price_column_in_projects_and_properties',14),(87,'2021_03_08_024049_add_lat_long_into_real_estate_tables',14),(88,'2021_06_10_091950_add_column_is_featured_to_table_re_accounts',14),(89,'2021_07_07_021757_update_table_account_activity_logs',14),(90,'2021_09_29_042758_create_re_categories_multilevel_table',14),(91,'2021_10_31_031254_add_company_to_accounts_table',14),(92,'2021_12_10_034807_create_real_estate_translation_tables',14),(93,'2021_12_18_081636_add_property_project_views_count',14),(94,'2022_05_04_033044_update_column_images_in_real_estate_tables',14),(95,'2022_07_02_081723_fix_expired_date_column',14),(96,'2022_08_01_090213_update_table_properties_and_projects',14),(97,'2023_01_31_023233_create_re_custom_fields_table',14),(98,'2023_02_06_000000_add_location_to_re_accounts_table',14),(99,'2023_02_06_024257_add_package_translations',14),(100,'2023_02_08_062457_add_custom_fields_translation_table',14),(101,'2023_02_15_024644_create_re_reviews_table',14),(102,'2023_02_20_072604_create_re_invoices_table',14),(103,'2023_02_20_081251_create_re_account_packages_table',14),(104,'2023_04_04_030709_add_unique_id_to_properties_and_projects_table',14),(105,'2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable',14),(106,'2023_05_09_062031_unique_reviews_table',14),(107,'2023_05_26_034353_fix_properties_projects_image',14),(108,'2023_05_27_004215_add_column_ip_into_table_re_consults',14),(109,'2023_07_25_034513_create_re_coupons_table',14),(110,'2023_07_25_034672_add_coupon_code_column_to_jb_invoices_table',14),(111,'2023_08_02_074208_change_square_column_to_float',14),(112,'2023_08_07_000001_add_is_public_profile_column_to_re_accounts_table',14),(113,'2023_08_09_004607_make_column_project_id_nullable',14),(114,'2023_09_11_084630_update_mandatory_fields_in_consult_form_table',14),(115,'2023_11_21_071820_add_missing_slug_for_agents',14),(116,'2024_01_11_084816_add_investor_translations_table',14),(117,'2024_01_31_022842_add_description_to_re_packages_table',14),(118,'2024_03_13_000001_drop_type_column_from_custom_field_translations_table',14),(119,'2024_04_23_124505_add_features_column_to_re_packages',14),(120,'2024_04_23_135106_add_columns_to_re_investors',14),(121,'2024_05_25_000001_update_captcha_settings_for_real_estate',14),(122,'2024_06_16_163428_make_investor_id_nullable',14),(123,'2024_06_20_103539_create_consult_custom_fields_table',14),(124,'2022_11_02_092723_team_create_team_table',15),(125,'2023_08_11_094574_update_team_table',15),(126,'2023_11_30_085354_add_missing_description_to_team',15),(127,'2018_07_09_214610_create_testimonial_table',16),(128,'2021_12_03_083642_create_testimonials_translations',16),(129,'2016_10_07_193005_create_translations_table',17),(130,'2023_12_12_105220_drop_translations_table',17);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage 1','[hero-banner style=\"1\" title=\"Find Your\" animation_text=\"Dream Home,Perfect Home,Real Estate\" description=\"We are a real estate agency that will help you find the best residence you dream of, let’s discuss for your dream house?\" background_image=\"pages/slider-1.jpg\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[properties style=\"2\" title=\"Recommended For You\" subtitle=\"Features Properties\" category_ids=\"1,2,3,4,5,6\" type=\"rent\" is_featured=\"\" limit=\"6\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[location title=\"Our Location For You\" subtitle=\"Explore Cities\" type=\"city\" city_ids=\"1,2,3,4,5,6,7\" destination=\"property\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/location]\n[services style=\"1\" title=\"What We Do?\" subtitle=\"Our Services\" background_color=\"transparent\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"4\" counters_label_1=\"SATISFIED CLIENTS\" counters_number_1=\"85\" counters_label_2=\"AWARDS RECEIVED\" counters_number_2=\"112\" counters_label_3=\"SUCCESSFUL TRANSACTIONS\" counters_number_3=\"32\" counters_label_4=\"MONTHLY TRAFFIC\" counters_number_4=\"66\" button_label=\"View All Services\" button_url=\"/\" enable_lazy_loading=\"yes\"][/services]\n[services style=\"1\" title=\"Why Choose Homzen\" subtitle=\"Our Benefit\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Proven Expertise\" services_description_1=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Customized Solutions\" services_description_2=\"We pride ourselves on crafting personalized strategies to match your unique goals, ensuring a seamless real estate journey.\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Transparent Partnerships\" services_description_3=\"Transparency is key in our client relationships. We prioritize clear communication and ethical practices, fostering trust and reliability throughout.\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" centered_content=\"1\" enable_lazy_loading=\"yes\"][/services]\n[properties style=\"1\" title=\"Best Property Value\" subtitle=\"Top Properties\" is_featured=\"1\" limit=\"4\" button_label=\"View All\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[testimonials style=\"1\" title=\"What’s People Say’s\" subtitle=\"Top Properties\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/agents]\n[blog-posts style=\"1\" title=\"Helpful Homzen Guides\" subtitle=\"Latest News\" type=\"recent\" limit=\"3\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/blog-posts]\n[image-slider background_color=\"transparent\" quantity=\"7\" name_1=\"GitHub\" image_1=\"partners/github.png\" url_1=\"https://github.com\" open_in_new_tab_1=\"\" name_2=\"LH.Tech\" image_2=\"partners/lhtech.png\" url_2=\"https://lhtech.com.my\" open_in_new_tab_2=\"\" name_3=\"Panadoxn\" image_3=\"partners/panadoxn.png\" url_3=\"/\" open_in_new_tab_3=\"\" name_4=\"Shangxi\" image_4=\"partners/shangxi.png\" url_4=\"/\" open_in_new_tab_4=\"\" name_5=\"Tyaalpha\" image_5=\"partners/tyaalpha.png\" url_5=\"/\" open_in_new_tab_5=\"\" name_6=\"Vanfaba\" image_6=\"partners/vanfaba.png\" url_6=\"/\" open_in_new_tab_6=\"\" name_7=\"Asana\" image_7=\"partners/asana.png\" url_7=\"https://asana.com\" open_in_new_tab_7=\"\" enable_lazy_loading=\"yes\"][/image-slider]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(2,'Homepage 2','[hero-banner style=\"2\" title=\"Find A Home That\" animation_text=\"Perfectly,Dream Home\" description=\"We are a real estate agency that will help you find the best residence you dream of.\" background_image=\"pages/slider-left.jpg\" slider_image_1=\"pages/slider-2.jpg\" slider_image_2=\"pages/slider-3.jpg\" slider_image_3=\"pages/slider-4.jpg\" slider_image_4=\"pages/slider-5.jpg\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[property-categories style=\"1\" title=\"Try Searching For\" subtitle=\"PROPERTY TYPE\" category_ids=\"1,2,3,4,5,6\" background_color=\"transparent\" button_label=\"View All\" button_url=\"/categories\" enable_lazy_loading=\"yes\"][/property-categories]\n[properties style=\"4\" title=\"Discover Homzen\'s Finest Properties For Your Dream Home\" subtitle=\"Featured Properties\" limit=\"8\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[services style=\"3\" title=\"Discover What Sets Our Real Estate Expertise Apart\" subtitle=\"Why Choose Us\" description=\"At Homzen, our unwavering commitment lies in crafting unparalleled real estate journeys. Our seasoned professionals, armed with extensive market knowledge, walk alongside you through every phase of your property endeavor. We prioritize understanding your unique aspirations, tailoring our expertise to match your vision.\" checklist=\"Transparent Partnerships,Proven Expertise,Customized Solutions,Local Area Knowledge\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" button_label=\"Contact Us\" button_url=\"/contact-us\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[location style=\"2\" title=\"Our Location For You\" subtitle=\"Explore States\" type=\"state\" state_ids=\"1,2,3,4,5,6\" destination=\"property\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/location]\n[properties style=\"3\" title=\"Best Property Value\" subtitle=\"Top Properties\" is_featured=\"1\" limit=\"4\" button_label=\"View All\" button_url=\"/properties\" enable_lazy_loading=\"yes\" background_color=\"#f7f7f7\"][/properties]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/agents]\n[testimonials style=\"3\" title=\"What’s People Say’s\" subtitle=\"Our Testimonials\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/testimonials]\n[blog-posts style=\"1\" title=\"Helpful Homzen Guides\" subtitle=\"Latest News\" type=\"recent\" limit=\"3\" enable_lazy_loading=\"yes\"][/blog-posts]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(3,'Homepage 3','[hero-banner style=\"3\" title=\"Indulge in Your\" animation_text=\"Sanctuary,Safe House\" description=\"Discover your private oasis at Homzen, where every corner, from the spacious garden to the relaxing pool, is crafted for your comfort and enjoyment.\" background_image=\"pages/slider-6.png\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\" button_label=\"Contact Us\" button_url=\"/contact\"][/hero-banner]\n[location style=\"3\" title=\"Properties By Cities\" subtitle=\"EXPLORE CITIES\" type=\"city\" city_ids=\"1,2,3,4,5,6,7,21,24\" destination=\"property\" background_color=\"#f7f7f7\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/location]\n[properties style=\"2\" title=\"Recommended For You\" subtitle=\"Features Properties\" category_ids=\"1,2,3,4,5,6\" type=\"rent\" is_featured=\"\" limit=\"6\" button_label=\"View All Properties\" button_url=\"/properties\" enable_lazy_loading=\"yes\"][/properties]\n[property-categories style=\"2\" title=\"Try Searching For\" subtitle=\"PROPERTY TYPE\" category_ids=\"1,2,3,4,5,6\" background_color=\"#161e2d\" enable_lazy_loading=\"yes\"][/property-categories]\n[services style=\"2\" title=\"What We Do?\" subtitle=\"Our Services\" background_color=\"transparent\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" enable_lazy_loading=\"yes\"][/services]\n[testimonials style=\"4\" title=\"What’s People Say’s\" subtitle=\"Our Testimonials\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" background_image=\"pages/testimonial-banner.png\" enable_lazy_loading=\"yes\"][/testimonials]\n[agents style=\"2\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/agents]\n[blog-posts style=\"2\" title=\"Helpful Homzen Guides\" subtitle=\"Latest News\" type=\"recent\" limit=\"4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/blog-posts]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(4,'Homepage 4','[hero-banner style=\"4\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[properties style=\"5\" title=\"Discover Homzen\'s Finest Properties For Your Dream Home\" subtitle=\"FEATURED PROPERTIES\" is_featured=\"1\" limit=\"6\" button_label=\"View All Properties\" button_url=\"/properties\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[services style=\"4\" title=\"Discover What Sets Our\" subtitle=\"WHAT WE DO\" description=\"At Homzen, our unwavering commitment lies in crafting unparalleled real estate journeys.\" background_color=\"transparent\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Explore diverse properties and expert guidance for a seamless buying experience.\" services_icon_1=\"ti ti-12-hours\" services_icon_image_1=\"pages/service-1.png\" services_button_label_1=\"Learn More\" services_button_url_1=\"/contact\" services_title_2=\"Rent A Home\" services_description_2=\"Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_icon_image_2=\"pages/service-2.png\" services_button_label_2=\"Learn More\" services_button_url_2=\"/contact\" services_title_3=\"Buy A New Home\" services_description_3=\"Showcasing your property\'s best features for a successful sale.\" services_icon_image_3=\"pages/service-3.png\" services_button_label_3=\"Learn More\" services_button_url_3=\"/contact\" counters_quantity=\"1\" background_image=\"pages/house-service.png\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[location title=\"Our Location For You\" subtitle=\"Explore Cities\" type=\"city\" city_ids=\"1,2,3,4,5,6\" destination=\"property\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/location]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"OUR TEAMS\" account_ids=\"1,2,3\" background_color=\"transparent\" items_per_row=\"3\" enable_lazy_loading=\"yes\"][/agents]\n[properties style=\"6\" title=\"Recommended for you\" subtitle=\"TOP PROPERTIES\" is_featured=\"1\" limit=\"4\" background_image=\"pages/properties.png\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[testimonials style=\"2\" title=\"What’s People Say’s\" subtitle=\"OUR TESTIMONIALS\" testimonial_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/testimonials]\n[services style=\"5\" title=\"Why Choose Homzen\" subtitle=\"OUR BENIFIT\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" background_color=\"transparent\" services_quantity=\"8\" services_title_1=\"Buy A New Home\" services_description_1=\"Explore diverse properties and expert guidance for a seamless buying experience.\" services_icon_1=\"ti ti-home\" services_title_2=\"Sell Your Property\" services_description_2=\"Get the best value with our professional selling strategies and market insights.\" services_icon_2=\"ti ti-currency-dollar\" services_title_3=\"Rent A Property\" services_description_3=\"Find the perfect rental property with our extensive listings and support.\" services_icon_3=\"ti ti-building\" services_title_4=\"Property Management\" services_description_4=\"Professional management services to keep your property in top condition.\" services_icon_4=\"ti ti-settings\" services_title_5=\"Real Estate Consulting\" services_description_5=\"Expert advice and insights to help you make informed real estate decisions.\" services_icon_5=\"ti ti-chart-bar\" services_title_6=\"Mortgage Services\" services_description_6=\"Find the best mortgage rates and options with our comprehensive services.\" services_icon_6=\"ti ti-credit-card\" services_title_7=\"Investment Properties\" services_description_7=\"Discover lucrative investment opportunities and maximize your returns.\" services_icon_7=\"ti ti-briefcase\" services_title_8=\"Relocation Services\" services_description_8=\"Smooth and hassle-free relocation services to help you move with ease.\" services_icon_8=\"ti ti-truck\" counters_quantity=\"1\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[blog-posts style=\"1\" title=\"Helpful Homzen Guides\" subtitle=\"LATEST NEWS\" type=\"recent\" limit=\"3\" enable_lazy_loading=\"yes\"][/blog-posts]\n[call-to-action title=\"List Your Properties On Homzen, Join Us Now!\" subtitle=\"BECOME PARTNERS\" button_label=\"Become A Hosting\" button_url=\"/contact\" image=\"pages/call-to-action.png\" enable_lazy_loading=\"yes\"][/call-to-action]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(5,'Homepage 5','[hero-banner style=\"5\" property_id=\"4\" search_box_enabled=\"1\" projects_search_enabled=\"1\" default_search_type=\"project\"][/hero-banner]\n[services style=\"2\" title=\"Why Choose Homzen\" subtitle=\"Our Benefit\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" centered_content=\"1\" enable_lazy_loading=\"yes\"][/services]\n[properties style=\"4\" title=\"Discover Homzen\'s Finest Properties For Your Dream Home\" subtitle=\"FEATURED PROPERTIES\" is_featured=\"1\" limit=\"8\" button_label=\"View All Properties\" button_url=\"/properties\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[location style=\"4\" title=\"Our Location For You\" subtitle=\"EXPLORE CITIES\" type=\"city\" city_ids=\"1,3,5,6,11,23\" destination=\"property\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/location]\n[properties style=\"7\" title=\"Recommended For You\" subtitle=\"TOP PROPERTIES\" is_featured=\"1\" limit=\"4\" background_color=\"transparent\" enable_lazy_loading=\"yes\"][/properties]\n[services style=\"5\" title=\"Why Choose Homzen\" subtitle=\"OUR BENIFIT\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" background_color=\"transparent\" services_quantity=\"8\" services_title_1=\"Buy A New Home\" services_description_1=\"Explore diverse properties and expert guidance for a seamless buying experience.\" services_icon_1=\"ti ti-home\" services_title_2=\"Sell Your Property\" services_description_2=\"Get the best value with our professional selling strategies and market insights.\" services_icon_2=\"ti ti-currency-dollar\" services_title_3=\"Rent A Property\" services_description_3=\"Find the perfect rental property with our extensive listings and support.\" services_icon_3=\"ti ti-building\" services_title_4=\"Property Management\" services_description_4=\"Professional management services to keep your property in top condition.\" services_icon_4=\"ti ti-settings\" services_title_5=\"Real Estate Consulting\" services_description_5=\"Expert advice and insights to help you make informed real estate decisions.\" services_icon_5=\"ti ti-chart-bar\" services_title_6=\"Mortgage Services\" services_description_6=\"Find the best mortgage rates and options with our comprehensive services.\" services_icon_6=\"ti ti-credit-card\" services_title_7=\"Investment Properties\" services_description_7=\"Discover lucrative investment opportunities and maximize your returns.\" services_icon_7=\"ti ti-briefcase\" services_title_8=\"Relocation Services\" services_description_8=\"Smooth and hassle-free relocation services to help you move with ease.\" services_icon_8=\"ti ti-truck\" counters_quantity=\"1\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[agents style=\"2\" title=\"Meet Our Agents\" subtitle=\"OUR TEAMS\" account_ids=\"1,2,3,4\" background_color=\"transparent\" items_per_row=\"2\" enable_lazy_loading=\"yes\"][/agents]\n[testimonials style=\"1\" title=\"What’s People Say’s\" subtitle=\"TOP PROPERTIES\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[blog-posts style=\"2\" title=\"The Most Recent Estate\" subtitle=\"LATEST NEWS\" type=\"recent\" limit=\"4\" enable_lazy_loading=\"yes\"][/blog-posts]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(6,'Blog',NULL,1,NULL,NULL,NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(7,'Contact Us','[contact-form display_fields=\"phone,email,subject,address\" mandatory_fields=\"email\" style=\"1\" title=\"Drop Us A Line\" description=\"Feel free to connect with us through our online channels for updates, news, and more.\" show_information_box=\"1\" contact_title=\"Contact Us\" quantity=\"3\" label_1=\"Address:\" content_1=\"101 E 129th St, East Chicago, IN 46312 United States\" label_2=\"Information:\" content_2=\"1-333-345-6868 hi.themesflat@gmail.com\" label_3=\"Open time:\" content_3=\"Monday - Friday: 08:00 - 20:00 Saturday - Sunday: 10:00 - 18:00\" show_social_links=\"1\"][/contact-form]\n[google-map]101 E 129th St, East Chicago, IN 46312 United States[/google-map]',1,NULL,NULL,NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(8,'Our Services','[services style=\"2\" title=\"Why Choose Homzen\" subtitle=\"Our Benefit\" background_color=\"#ffffff\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" centered_content=\"1\" enable_lazy_loading=\"yes\"][/services]\n[testimonials style=\"1\" title=\"What’s People Say’s\" subtitle=\"Top Properties\" description=\"Our seasoned team excels in real estate with years of successful market navigation, offering informed decisions and optimal results.\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[faqs title=\"Quick Answers To Questions\" subtitle=\"FAQs\" category_ids=\"1,2,3,4\" display_type=\"list\" limit=\"5\" expand_first_time=\"1\" enable_lazy_loading=\"yes\"][/faqs]\n[call-to-action title=\"List your Properties on Homzen, join Us Now!\" subtitle=\"Become Partners\" button_label=\"Become A Hosting\" button_url=\"/\" image=\"pages/call-to-action.png\" enable_lazy_loading=\"yes\"][/call-to-action]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(9,'FAQs','[faqs category_ids=\"1,2,3\" display_type=\"group\" expand_first_time=\"1\" enable_lazy_loading=\"yes\"][/faqs]',1,NULL,NULL,NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(10,'About Us','[about-us title=\"Welcome To The <br> Homzen\" description=\"Welcome to Homzen, where we turn houses into homes and dreams into reality. At Homzen, we understand that a home is more than just a physical space; it\'s a place where memories are created, families grow, and life unfolds.\" button_label=\"Learn More\" button_url=\"/\" image=\"pages/about-us-video.jpg\" video_url=\"https://youtu.be/tRxGSHL8bI0\"][/about-us]\n[services style=\"3\" title=\"Discover What Sets Our Real Estate Expertise Apart\" subtitle=\"Why Choose Us\" description=\"At Homzen, our unwavering commitment lies in crafting unparalleled real estate journeys. Our seasoned professionals, armed with extensive market knowledge, walk alongside you through every phase of your property endeavor. We prioritize understanding your unique aspirations, tailoring our expertise to match your vision.\" checklist=\"Transparent Partnerships,Proven Expertise,Customized Solutions,Local Area Knowledge\" background_color=\"#f7f7f7\" services_quantity=\"3\" services_title_1=\"Buy A New Home\" services_description_1=\"Discover your dream home effortlessly. Explore diverse properties and expert guidance for a seamless buying experience.\" services_button_label_1=\"Learn More\" services_button_url_1=\"/\" services_icon_image_1=\"pages/service-1.png\" services_title_2=\"Rent A Home\" services_description_2=\"Discover your perfect rental effortlessly. Explore a diverse variety of listings tailored precisely to suit your unique lifestyle needs.\" services_button_label_2=\"Learn More\" services_button_url_2=\"/\" services_icon_image_2=\"pages/service-2.png\" services_title_3=\"Sell A Home\" services_description_3=\"Sell confidently with expert guidance and effective strategies, showcasing your property\'s best features for a successful sale.\" services_button_label_3=\"Learn More\" services_button_url_3=\"/\" services_icon_image_3=\"pages/service-3.png\" counters_quantity=\"1\" button_label=\"Contact Us\" button_url=\"/contact-us\" centered_content=\"\" enable_lazy_loading=\"yes\"][/services]\n[testimonials style=\"2\" title=\"What’s People Say’s\" subtitle=\"Top Properties\" testimonial_ids=\"1,2,3,4\" background_color=\"#f7f7f7\" enable_lazy_loading=\"yes\"][/testimonials]\n[image-slider background_color=\"transparent\" quantity=\"7\" name_1=\"GitHub\" image_1=\"partners/github.png\" url_1=\"https://github.com\" open_in_new_tab_1=\"\" name_2=\"LH.Tech\" image_2=\"partners/lhtech.png\" url_2=\"https://lhtech.com.my\" open_in_new_tab_2=\"\" name_3=\"Panadoxn\" image_3=\"partners/panadoxn.png\" url_3=\"/\" open_in_new_tab_3=\"\" name_4=\"Shangxi\" image_4=\"partners/shangxi.png\" url_4=\"/\" open_in_new_tab_4=\"\" name_5=\"Tyaalpha\" image_5=\"partners/tyaalpha.png\" url_5=\"/\" open_in_new_tab_5=\"\" name_6=\"Vanfaba\" image_6=\"partners/vanfaba.png\" url_6=\"/\" open_in_new_tab_6=\"\" name_7=\"Asana\" image_7=\"partners/asana.png\" url_7=\"https://asana.com\" open_in_new_tab_7=\"\" enable_lazy_loading=\"yes\"][/image-slider]\n[contact-form display_fields=\"phone,email,subject,address\" mandatory_fields=\"email\" style=\"2\" title=\"We\'re Always Eager To Hear From You!\" subtitle=\"Contact Us\" description=\"Sed ullamcorper nulla egestas at. Aenean eget tortor nec elit sagittis molestie. Pellentesque tempus massa in.r nulla egestas at. Aenean eget tortor nec elit sagittis mole\" background_image=\"pages/about-us-contact.jpg\"][/contact-form]\n[agents style=\"1\" title=\"Meet Our Agents\" subtitle=\"Our Teams\" account_ids=\"1,2,3,4\" items_per_row=\"4\" enable_lazy_loading=\"yes\"][/agents]\n[call-to-action title=\"List your Properties on Homzen, join Us Now!\" subtitle=\"Become Partners\" button_label=\"Become A Hosting\" button_url=\"/\" image=\"pages/call-to-action.png\" enable_lazy_loading=\"yes\"][/call-to-action]',1,NULL,'full-width',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(11,'Pricing Plans','[pricing-plan title=\"Our Subscription\" subtitle=\"Pricing\" package_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/pricing-plan]\n[faqs title=\"Quick Answers To Questions\" subtitle=\"FAQs\" category_ids=\"1\" display_type=\"list\" limit=\"5\" expand_first_time=\"1\" enable_lazy_loading=\"yes\"][/faqs]',1,NULL,NULL,NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(12,'Privacy Policy','[content-tab title=\"Terms Of Use\" quantity=\"5\" title_1=\"Terms\" content_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed euismod justo, sit amet efficitur dui. Aliquam sodales vestibulum velit, eget sollicitudin quam. Donec non aliquam eros. Etiam sit amet lectus vel justo dignissim condimentum. In malesuada neque quis libero laoreet posuere. In consequat vitae ligula quis rutrum. Morbi dolor orci, maximus a pulvinar sed, bibendum ac lacus. Suspendisse in consectetur lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" title_2=\"Limitations\" content_2=\"Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" title_3=\"Revisions and errata\" content_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed euismod justo, sit amet efficitur dui. Aliquam sodales vestibulum velit, eget sollicitudin quam. Donec non aliquam eros. Etiam sit amet lectus vel justo dignissim condimentum. In malesuada neque quis libero laoreet posuere. In consequat vitae ligula quis rutrum. Morbi dolor orci, maximus a pulvinar sed, bibendum ac lacus. Suspendisse in consectetur lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex.\" title_4=\"Site terms of use modifications\" content_4=\"Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie a, finibus nec ex. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" title_5=\"Risks\" content_5=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer sed euismod justo, sit amet efficitur dui. Aliquam sodales vestibulum velit, eget sollicitudin quam. Donec non aliquam eros. Etiam sit amet lectus vel justo dignissim condimentum. In malesuada neque quis libero laoreet posuere. In consequat vitae ligula quis rutrum. Morbi dolor orci, maximus a pulvinar sed, bibendum ac lacus. Suspendisse in consectetur lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam elementum, est sed interdum cursus, felis ex pharetra nisi, ut elementum tortor urna eu nulla. Donec rhoncus in purus quis blandit. Etiam eleifend metus at nunc ultricies facilisis. Morbi finibus tristique interdum. Nullam vel eleifend est, eu posuere risus. Vestibulum ligula ex, ullamcorper sit amet molestie\" enable_lazy_loading=\"yes\"][/content-tab]',1,NULL,NULL,NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23'),(13,'Coming Soon','[coming-soon title=\"Get Notified When We Launch\" countdown_time=\"2024-07-27 07:25:23\" address=\"58 Street Commercial Road Fratton, Australia\" hotline=\"+123456789\" business_hours=\"Mon – Sat: 8 am – 5 pm, Sunday: CLOSED\" show_social_links=\"1\" image=\"pages/properties.png\"][/coming-soon]',1,NULL,'no-layout',NULL,'published','2024-06-27 00:25:23','2024-06-27 00:25:23');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `post_categories` VALUES (3,1),(1,1),(2,2),(6,2),(5,3),(4,3),(2,4),(4,4),(5,5),(3,5),(5,6),(3,7),(3,8),(4,8),(1,9),(5,9),(3,10),(4,10),(6,11),(1,11),(3,12),(4,12),(5,13),(3,13),(2,14),(4,14),(4,15),(2,15),(1,16),(6,16),(4,17),(6,17),(3,18),(6,18);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `post_tags` VALUES (8,1),(2,1),(5,1),(5,2),(8,2),(7,2),(3,3),(7,3),(6,3),(1,4),(2,4),(7,5),(4,5),(8,5),(8,6),(5,6),(3,6),(4,7),(7,7),(7,8),(5,8),(8,9),(1,9),(2,10),(5,10),(6,10),(2,11),(3,11),(5,11),(7,12),(8,12),(3,12),(2,13),(4,13),(6,13),(1,14),(6,14),(3,15),(5,15),(7,15),(3,16),(8,16),(2,17),(8,17),(1,17),(7,18),(2,18),(3,18);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `posts` VALUES (1,'Top 10 Tips for First-time Home Buyers','ME,\' but nevertheless she uncorked it and put it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare, \'that \"I breathe when I grow at a reasonable pace,\' said the Duchess; \'and.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/2.jpg',777,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(2,'How to Stage Your Home for a Quick Sale','YOUR shoes done with?\' said the King, \'that only makes the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess to play croquet.\'.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/3.jpg',334,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(3,'Understanding the Current Real Estate Market Trends','It quite makes my forehead ache!\' Alice watched the Queen was silent. The Dormouse shook itself, and began smoking again. This time there were ten of them, and considered a little, \'From the Queen.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/7.jpg',158,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(4,'DIY Home Improvement Projects That Add Value','Then came a little irritated at the cook tulip-roots instead of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done that, you know,\' Alice gently remarked; \'they\'d have been.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/10.jpg',1787,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(5,'A Beginner’s Guide to Real Estate Investing','Alice soon began talking to herself, \'whenever I eat one of the Gryphon, and, taking Alice by the Hatter, and, just as she was quite tired of sitting by her sister was reading, but it had a.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/8.jpg',467,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(6,'How to Choose the Right Neighborhood for Your Family','This time Alice waited till she had known them all her riper years, the simple rules their friends had taught them: such as, that a red-hot poker will burn you if you like,\' said the King, \'or I\'ll.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/6.jpg',890,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(7,'Luxury Homes: What to Look For','No, it\'ll never do to ask: perhaps I shall be a comfort, one way--never to be no use in knocking,\' said the Dodo could not think of nothing else to do, so Alice soon came to ME, and told me you had.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/8.jpg',1533,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(8,'Property Management: Best Practices for Landlords','Hatter, and he checked himself suddenly: the others looked round also, and all would change (she knew) to the jury. They were indeed a queer-looking party that assembled on the top of her hedgehog.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/10.jpg',1787,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(9,'Renovation Ideas to Increase Your Home’s Value','The Cat\'s head began fading away the time. Alice had learnt several things of this sort in her hands, and she tried to say it over) \'--yes, that\'s about the whiting!\' \'Oh, as to prevent its undoing.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/10.jpg',640,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(10,'The Ultimate Guide to Buying a Vacation Home','Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it made no mark; but he could go. Alice took up the chimney, has he?\' said Alice to find her.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/4.jpg',1087,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(11,'How to Successfully Sell Your Home in a Buyer’s Market','March Hare, who had got burnt, and eaten up by wild beasts and other unpleasant things, all because they WOULD not remember ever having heard of uglifying!\' it exclaimed. \'You know what a wonderful.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/8.jpg',401,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(12,'Home Inspection: What to Expect and How to Prepare','YOUR adventures.\' \'I could tell you more than that, if you cut your finger VERY deeply with a growl, And concluded the banquet--] \'What IS a long tail, certainly,\' said Alice, very much what would.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/3.jpg',2007,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(13,'Eco-friendly Home Improvements for Sustainable Living','Bill, I fancy--Who\'s to go with the bread-and-butter getting so used to read fairy-tales, I fancied that kind of sob, \'I\'ve tried every way, and nothing seems to be no use in knocking,\' said the.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/1.jpg',1544,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(14,'How to Navigate the Mortgage Process','After a while, finding that nothing more to come, so she began very cautiously: \'But I don\'t remember where.\' \'Well, it must be getting somewhere near the door as you go to law: I will just explain.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/10.jpg',2261,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(15,'Real Estate Market Analysis: What You Need to Know','How funny it\'ll seem to come out among the people that walk with their heads off?\' shouted the Queen, \'and take this child away with me,\' thought Alice, and, after folding his arms and legs in all.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/8.jpg',410,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(16,'Tips for Renting Out Your Property','Though they were all in bed!\' On various pretexts they all cheered. Alice thought over all the jurymen on to her daughter \'Ah, my dear! Let this be a letter, written by the pope, was soon left.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/8.jpg',1727,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(17,'Understanding Property Taxes and How to Lower Them','Alice, very loudly and decidedly, and he poured a little door about fifteen inches high: she tried to curtsey as she went on for some while in silence. Alice noticed with some severity; \'it\'s very.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',0,'posts/1.jpg',175,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20'),(18,'The Benefits of Smart Home Technology','I hadn\'t quite finished my tea when I learn music.\' \'Ah! that accounts for it,\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said Alice. \'Why, you don\'t explain it as she spoke.','<h5>Understanding Housing Stocks</h5>\n<p>\n    Housing stocks encompass companies involved in\n    various aspects of the real estate industry, including home builders, developers, and\n    related service providers. Factors influencing these stocks range from interest\n    rates and economic indicators to trends in home ownership rates.\n</p>\n<p>\n    Pay close attention to economic indicators such as\n    employment rates, GDP growth, and consumer confidence. A strong economy often\n    correlates with increased demand for housing, benefiting related stocks.\n</p>\n[content-quote message=\"Lower rates can boost home buying activity, benefiting housing stocks, while higher rates may have the opposite effect.\" author=\"Nelson Mandela\"][/content-quote]\n\n[content-image number_of_columns=\"col-2\" quantity=\"2\" image_1=\"posts/md-1.jpg\" image_2=\"posts/md-2.jpg\"][/content-image]\n\n<h5>Identify Emerging Trends</h5>\n<p>\n    Stay informed about emerging trends in the housing\n    market, such as the demand for sustainable homes, technological advancements, and\n    demographic shifts. Companies aligning with these trends may present attractive\n    investment opportunities.\n</p>\n<p>\n    Take a long-term investment approach if you believe in\n    the stability and growth potential of the housing sector. Look for companies with\n    solid fundamentals and a track record of success. For short-term traders, capitalize\n    on market fluctuations driven by economic reports, interest rate changes, or\n    industry-specific news. Keep a close eye on earnings reports and government housing\n    data releases.\n</p>\n\n<ul>\n    <li><strong>Affordability:</strong> Compared to larger apartments, 1BHK units are more budget-friendly, making them\n        ideal for individuals and young professionals.\n    </li>\n    <li><strong>Convenience:</strong> These apartments are easier to maintain and are perfect for those who prefer a minimalist\n        lifestyle.\n    </li>\n    <li><strong>Modern Amenities:</strong> Many 1BHK apartments in Dubai come with state-of-the-art facilities such as\n        gyms, swimming pools, and 24/7 security.\n    </li>\n</ul>\n','published',1,'Botble\\ACL\\Models\\User',1,'posts/9.jpg',820,NULL,'2024-06-27 00:25:20','2024-06-27 00:25:20');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
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
-- Table structure for table `re_account_activity_logs`
--

DROP TABLE IF EXISTS `re_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_account_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int unsigned DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_public_profile` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
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
INSERT INTO `re_accounts` VALUES (1,'Lauryn','Price','Dinah, if I was, I shouldn\'t.',NULL,'john.smith@botble.com','vullrich','$2y$12$iQjPyJxQZ9A4RvvFQ3.GU.8p3ds1P4dC88BD6b3/53DjfQE1/cZny',15,'2013-03-11','+15617188942',10,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:14','2024-06-27 00:25:14',0,1,NULL,NULL,NULL,NULL),(2,'Luisa','Johns','Pennyworth only of beautiful.',NULL,'agent@botble.com','adamsdarien','$2y$12$UgiaG6cLugHL4oWJwirLOOzFUcwzHMTidOinNlReDZkOyw00lH7E.',19,'1991-03-04','+15716010648',10,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:15','2024-06-27 00:25:15',0,1,NULL,NULL,NULL,NULL),(3,'Edd','Renner','Hardly knowing what she did.',NULL,'rgislason@gmail.com','goyetteviolet','$2y$12$0YJsxPd20gu8ly48dyrb2ethieJlyUu4TsGn3cNaCqrYYWR.RsWCa',17,'1984-08-14','+17855401653',6,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:15','2024-06-27 00:25:15',1,1,NULL,NULL,NULL,NULL),(4,'Esta','Lakin','I eat or drink anything; so.',NULL,'jaleel.hodkiewicz@koelpin.com','preilly','$2y$12$6hCZCM0XTzXAY6ZVs78d9.0Am8szCEvcJV3MC2AGBJ7/uYygvxjCS',16,'2021-07-01','+18502843410',7,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:15','2024-06-27 00:25:15',0,1,NULL,NULL,NULL,NULL),(5,'Maida','Macejkovic','Knave of Hearts, she made.',NULL,'lauretta.metz@parker.com','zoestreich','$2y$12$rO8Faxu7bz6PU12MbFJBaeEAoYaeNdf6iTFlSapINFGvg5Lt5bP4.',15,'2015-08-20','+18646093467',6,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:15','2024-06-27 00:25:15',0,1,NULL,NULL,NULL,NULL),(6,'Rodrick','Schultz','Hatter. \'I told you that.\'.',NULL,'cicero.douglas@goyette.com','pheidenreich','$2y$12$mr73n683ArOLbZ6DDbRfteWH272vDiB2K.5Q99wRAfGkfnF3YOCBi',14,'1991-01-23','+17409347236',2,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:16','2024-06-27 00:25:16',0,1,NULL,NULL,NULL,NULL),(7,'Ernestina','Marquardt','Alice thought this must ever.',NULL,'dameon42@berge.com','clifford97','$2y$12$kyq6GZXf6NNUZmbMlNtVMeVa1oa8AUDhJaD1BELCA7hfbX6QgZEvi',12,'1981-08-04','+12125705448',9,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:16','2024-06-27 00:25:16',1,1,NULL,NULL,NULL,NULL),(8,'Kristopher','Rosenbaum','Alice crouched down among.',NULL,'cbeer@emmerich.com','boscojayden','$2y$12$B7i5Ef68zBVs8/2KZzhBzeGSsRObsLXV3TZ1qyTQ0GzOHPYNao17O',20,'1972-11-06','+16505804772',6,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:16','2024-06-27 00:25:16',1,1,NULL,NULL,NULL,NULL),(9,'Tyrique','Lebsack','Mouse to tell him. \'A nice.',NULL,'skiles.summer@oconnell.com','schmidtkarianne','$2y$12$2.9GISoAjLY3dYFSnWshe.5q2BCH859/T./OsxOZ4LKtSYVjY7LGe',14,'1999-06-29','+13806687637',7,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:16','2024-06-27 00:25:16',0,1,NULL,NULL,NULL,NULL),(10,'Kathlyn','Mann','Alice, who had spoken first.',NULL,'consuelo.mann@murphy.org','fvolkman','$2y$12$6A/T0dEHIVvom1.nwA8P7ORA64.z3I7s0PmM5oOzrOvBi2fC0pHiu',20,'1988-08-26','+18604024245',10,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:17','2024-06-27 00:25:17',1,1,NULL,NULL,NULL,NULL),(11,'Sierra','Gottlieb','RABBIT\' engraved upon it.',NULL,'kking@gmail.com','carletonquitzon','$2y$12$xlvGJCVpWBjsqas69cHsh.ZxPPEkVagxA6tWhCSEx.N3t82y.rsoq',15,'2024-03-16','+17699430320',2,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:17','2024-06-27 00:25:17',1,1,NULL,NULL,NULL,NULL),(12,'Bret','Marvin','Alice, who always took a.',NULL,'kuhn.darrel@gmail.com','schusterzula','$2y$12$4csnTg4BOK4/je9gAg3fA.6MpRMxnRm6Bu5sK8qULIj7uPbukLSYq',21,'2016-06-10','+13255026976',4,'2024-06-27 07:25:14',NULL,NULL,'2024-06-27 00:25:17','2024-06-27 00:25:17',0,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `re_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories`
--

DROP TABLE IF EXISTS `re_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories`
--

LOCK TABLES `re_categories` WRITE;
/*!40000 ALTER TABLE `re_categories` DISABLE KEYS */;
INSERT INTO `re_categories` VALUES (1,'Apartment',NULL,'published',0,1,'2024-06-27 00:25:13','2024-06-27 00:25:13',0),(2,'Villa',NULL,'published',1,0,'2024-06-27 00:25:13','2024-06-27 00:25:13',0),(3,'Condo',NULL,'published',2,0,'2024-06-27 00:25:13','2024-06-27 00:25:13',0),(4,'House',NULL,'published',3,0,'2024-06-27 00:25:13','2024-06-27 00:25:13',0),(5,'Land',NULL,'published',4,0,'2024-06-27 00:25:13','2024-06-27 00:25:13',0),(6,'Commercial property',NULL,'published',5,0,'2024-06-27 00:25:13','2024-06-27 00:25:13',0);
/*!40000 ALTER TABLE `re_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories_translations`
--

DROP TABLE IF EXISTS `re_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_categories_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_consult_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_consult_custom_field_options_translations` (
  `re_consult_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_consult_custom_field_options_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_consult_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
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
INSERT INTO `re_consult_custom_fields` VALUES (1,'date',0,'Schedule a Tour (optional)',NULL,999,'published','2024-06-27 00:25:24','2024-06-27 00:25:24');
/*!40000 ALTER TABLE `re_consult_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consult_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_consult_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_consult_custom_fields_translations` (
  `re_consult_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_consult_custom_fields_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_consults` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
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
INSERT INTO `re_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-06-27 00:25:13','2024-06-27 00:25:13'),(2,'EUR','€',0,0,1,0,0.91,'2024-06-27 00:25:13','2024-06-27 00:25:13'),(3,'VND','₫',0,0,2,0,23717.5,'2024-06-27 00:25:13','2024-06-27 00:25:13');
/*!40000 ALTER TABLE `re_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options`
--

DROP TABLE IF EXISTS `re_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_options_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_values_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_fields_id`)
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `re_facilities` VALUES (1,'Hospital','ti ti-hospital','published',NULL,NULL),(2,'Super Market','ti ti-shopping-cart','published',NULL,NULL),(3,'School','ti ti-school','published',NULL,NULL),(4,'Entertainment','ti ti-movie','published',NULL,NULL),(5,'Pharmacy','ti ti-pill','published',NULL,NULL),(6,'Airport','ti ti-plane-departure','published',NULL,NULL),(7,'Railways','ti ti-train','published',NULL,NULL),(8,'Bus Stop','ti ti-bus','published',NULL,NULL),(9,'Beach','ti ti-beach','published',NULL,NULL),(10,'Mall','ti ti-shopping-cart','published',NULL,NULL),(11,'Bank','ti ti-building-bank','published',NULL,NULL);
/*!40000 ALTER TABLE `re_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_distances`
--

DROP TABLE IF EXISTS `re_facilities_distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_facilities_distances` (
  `facility_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`facility_id`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_distances`
--

LOCK TABLES `re_facilities_distances` WRITE;
/*!40000 ALTER TABLE `re_facilities_distances` DISABLE KEYS */;
INSERT INTO `re_facilities_distances` VALUES (1,1,'Botble\\RealEstate\\Models\\Property','18km'),(1,2,'Botble\\RealEstate\\Models\\Property','3km'),(1,3,'Botble\\RealEstate\\Models\\Property','17km'),(1,4,'Botble\\RealEstate\\Models\\Property','14km'),(1,5,'Botble\\RealEstate\\Models\\Property','18km'),(1,6,'Botble\\RealEstate\\Models\\Property','18km'),(1,7,'Botble\\RealEstate\\Models\\Property','6km'),(1,8,'Botble\\RealEstate\\Models\\Property','9km'),(1,9,'Botble\\RealEstate\\Models\\Property','11km'),(1,10,'Botble\\RealEstate\\Models\\Property','18km'),(1,11,'Botble\\RealEstate\\Models\\Property','9km'),(1,12,'Botble\\RealEstate\\Models\\Property','1km'),(1,13,'Botble\\RealEstate\\Models\\Property','19km'),(1,14,'Botble\\RealEstate\\Models\\Property','9km'),(1,15,'Botble\\RealEstate\\Models\\Property','11km'),(1,16,'Botble\\RealEstate\\Models\\Property','7km'),(1,17,'Botble\\RealEstate\\Models\\Property','7km'),(1,18,'Botble\\RealEstate\\Models\\Property','11km'),(1,19,'Botble\\RealEstate\\Models\\Property','1km'),(1,20,'Botble\\RealEstate\\Models\\Property','8km'),(1,21,'Botble\\RealEstate\\Models\\Property','17km'),(1,22,'Botble\\RealEstate\\Models\\Property','19km'),(1,23,'Botble\\RealEstate\\Models\\Property','12km'),(1,24,'Botble\\RealEstate\\Models\\Property','7km'),(1,25,'Botble\\RealEstate\\Models\\Property','8km'),(1,26,'Botble\\RealEstate\\Models\\Property','18km'),(1,27,'Botble\\RealEstate\\Models\\Property','19km'),(1,28,'Botble\\RealEstate\\Models\\Property','9km'),(1,29,'Botble\\RealEstate\\Models\\Property','15km'),(1,30,'Botble\\RealEstate\\Models\\Property','2km'),(1,31,'Botble\\RealEstate\\Models\\Property','8km'),(1,32,'Botble\\RealEstate\\Models\\Property','1km'),(1,33,'Botble\\RealEstate\\Models\\Property','15km'),(1,34,'Botble\\RealEstate\\Models\\Property','11km'),(1,35,'Botble\\RealEstate\\Models\\Property','15km'),(1,36,'Botble\\RealEstate\\Models\\Property','12km'),(1,37,'Botble\\RealEstate\\Models\\Property','16km'),(1,38,'Botble\\RealEstate\\Models\\Property','4km'),(1,39,'Botble\\RealEstate\\Models\\Property','8km'),(1,40,'Botble\\RealEstate\\Models\\Property','1km'),(1,41,'Botble\\RealEstate\\Models\\Property','8km'),(1,42,'Botble\\RealEstate\\Models\\Property','3km'),(1,43,'Botble\\RealEstate\\Models\\Property','18km'),(1,44,'Botble\\RealEstate\\Models\\Property','19km'),(1,45,'Botble\\RealEstate\\Models\\Property','2km'),(1,46,'Botble\\RealEstate\\Models\\Property','13km'),(1,47,'Botble\\RealEstate\\Models\\Property','15km'),(1,48,'Botble\\RealEstate\\Models\\Property','15km'),(1,49,'Botble\\RealEstate\\Models\\Property','16km'),(1,50,'Botble\\RealEstate\\Models\\Property','20km'),(1,51,'Botble\\RealEstate\\Models\\Property','10km'),(1,52,'Botble\\RealEstate\\Models\\Property','2km'),(1,53,'Botble\\RealEstate\\Models\\Property','8km'),(1,54,'Botble\\RealEstate\\Models\\Property','11km'),(1,55,'Botble\\RealEstate\\Models\\Property','17km'),(1,56,'Botble\\RealEstate\\Models\\Property','3km'),(1,57,'Botble\\RealEstate\\Models\\Property','2km'),(1,58,'Botble\\RealEstate\\Models\\Property','4km'),(1,59,'Botble\\RealEstate\\Models\\Property','15km'),(1,60,'Botble\\RealEstate\\Models\\Property','17km'),(1,61,'Botble\\RealEstate\\Models\\Property','19km'),(2,1,'Botble\\RealEstate\\Models\\Property','8km'),(2,2,'Botble\\RealEstate\\Models\\Property','18km'),(2,3,'Botble\\RealEstate\\Models\\Property','7km'),(2,4,'Botble\\RealEstate\\Models\\Property','18km'),(2,5,'Botble\\RealEstate\\Models\\Property','12km'),(2,6,'Botble\\RealEstate\\Models\\Property','9km'),(2,7,'Botble\\RealEstate\\Models\\Property','1km'),(2,8,'Botble\\RealEstate\\Models\\Property','18km'),(2,9,'Botble\\RealEstate\\Models\\Property','9km'),(2,10,'Botble\\RealEstate\\Models\\Property','4km'),(2,11,'Botble\\RealEstate\\Models\\Property','16km'),(2,12,'Botble\\RealEstate\\Models\\Property','3km'),(2,13,'Botble\\RealEstate\\Models\\Property','13km'),(2,14,'Botble\\RealEstate\\Models\\Property','1km'),(2,15,'Botble\\RealEstate\\Models\\Property','14km'),(2,16,'Botble\\RealEstate\\Models\\Property','10km'),(2,17,'Botble\\RealEstate\\Models\\Property','11km'),(2,18,'Botble\\RealEstate\\Models\\Property','20km'),(2,19,'Botble\\RealEstate\\Models\\Property','7km'),(2,20,'Botble\\RealEstate\\Models\\Property','18km'),(2,21,'Botble\\RealEstate\\Models\\Property','5km'),(2,22,'Botble\\RealEstate\\Models\\Property','16km'),(2,23,'Botble\\RealEstate\\Models\\Property','2km'),(2,24,'Botble\\RealEstate\\Models\\Property','12km'),(2,25,'Botble\\RealEstate\\Models\\Property','17km'),(2,26,'Botble\\RealEstate\\Models\\Property','2km'),(2,27,'Botble\\RealEstate\\Models\\Property','19km'),(2,28,'Botble\\RealEstate\\Models\\Property','18km'),(2,29,'Botble\\RealEstate\\Models\\Property','1km'),(2,30,'Botble\\RealEstate\\Models\\Property','15km'),(2,31,'Botble\\RealEstate\\Models\\Property','8km'),(2,32,'Botble\\RealEstate\\Models\\Property','14km'),(2,33,'Botble\\RealEstate\\Models\\Property','2km'),(2,34,'Botble\\RealEstate\\Models\\Property','6km'),(2,35,'Botble\\RealEstate\\Models\\Property','2km'),(2,36,'Botble\\RealEstate\\Models\\Property','18km'),(2,37,'Botble\\RealEstate\\Models\\Property','7km'),(2,38,'Botble\\RealEstate\\Models\\Property','6km'),(2,39,'Botble\\RealEstate\\Models\\Property','8km'),(2,40,'Botble\\RealEstate\\Models\\Property','10km'),(2,41,'Botble\\RealEstate\\Models\\Property','19km'),(2,42,'Botble\\RealEstate\\Models\\Property','16km'),(2,43,'Botble\\RealEstate\\Models\\Property','12km'),(2,44,'Botble\\RealEstate\\Models\\Property','4km'),(2,45,'Botble\\RealEstate\\Models\\Property','16km'),(2,46,'Botble\\RealEstate\\Models\\Property','10km'),(2,47,'Botble\\RealEstate\\Models\\Property','7km'),(2,48,'Botble\\RealEstate\\Models\\Property','10km'),(2,49,'Botble\\RealEstate\\Models\\Property','9km'),(2,50,'Botble\\RealEstate\\Models\\Property','5km'),(2,51,'Botble\\RealEstate\\Models\\Property','8km'),(2,52,'Botble\\RealEstate\\Models\\Property','11km'),(2,53,'Botble\\RealEstate\\Models\\Property','19km'),(2,54,'Botble\\RealEstate\\Models\\Property','1km'),(2,55,'Botble\\RealEstate\\Models\\Property','9km'),(2,56,'Botble\\RealEstate\\Models\\Property','4km'),(2,57,'Botble\\RealEstate\\Models\\Property','8km'),(2,58,'Botble\\RealEstate\\Models\\Property','5km'),(2,59,'Botble\\RealEstate\\Models\\Property','7km'),(2,60,'Botble\\RealEstate\\Models\\Property','13km'),(2,61,'Botble\\RealEstate\\Models\\Property','14km'),(3,1,'Botble\\RealEstate\\Models\\Property','1km'),(3,2,'Botble\\RealEstate\\Models\\Property','14km'),(3,3,'Botble\\RealEstate\\Models\\Property','4km'),(3,4,'Botble\\RealEstate\\Models\\Property','1km'),(3,5,'Botble\\RealEstate\\Models\\Property','13km'),(3,6,'Botble\\RealEstate\\Models\\Property','9km'),(3,7,'Botble\\RealEstate\\Models\\Property','10km'),(3,8,'Botble\\RealEstate\\Models\\Property','15km'),(3,9,'Botble\\RealEstate\\Models\\Property','4km'),(3,10,'Botble\\RealEstate\\Models\\Property','4km'),(3,11,'Botble\\RealEstate\\Models\\Property','10km'),(3,12,'Botble\\RealEstate\\Models\\Property','3km'),(3,13,'Botble\\RealEstate\\Models\\Property','1km'),(3,14,'Botble\\RealEstate\\Models\\Property','14km'),(3,15,'Botble\\RealEstate\\Models\\Property','15km'),(3,16,'Botble\\RealEstate\\Models\\Property','4km'),(3,17,'Botble\\RealEstate\\Models\\Property','20km'),(3,18,'Botble\\RealEstate\\Models\\Property','4km'),(3,19,'Botble\\RealEstate\\Models\\Property','16km'),(3,20,'Botble\\RealEstate\\Models\\Property','8km'),(3,21,'Botble\\RealEstate\\Models\\Property','6km'),(3,22,'Botble\\RealEstate\\Models\\Property','9km'),(3,23,'Botble\\RealEstate\\Models\\Property','13km'),(3,24,'Botble\\RealEstate\\Models\\Property','16km'),(3,25,'Botble\\RealEstate\\Models\\Property','8km'),(3,26,'Botble\\RealEstate\\Models\\Property','7km'),(3,27,'Botble\\RealEstate\\Models\\Property','8km'),(3,28,'Botble\\RealEstate\\Models\\Property','6km'),(3,29,'Botble\\RealEstate\\Models\\Property','12km'),(3,30,'Botble\\RealEstate\\Models\\Property','10km'),(3,31,'Botble\\RealEstate\\Models\\Property','9km'),(3,32,'Botble\\RealEstate\\Models\\Property','6km'),(3,33,'Botble\\RealEstate\\Models\\Property','19km'),(3,34,'Botble\\RealEstate\\Models\\Property','13km'),(3,35,'Botble\\RealEstate\\Models\\Property','9km'),(3,36,'Botble\\RealEstate\\Models\\Property','14km'),(3,37,'Botble\\RealEstate\\Models\\Property','15km'),(3,38,'Botble\\RealEstate\\Models\\Property','18km'),(3,39,'Botble\\RealEstate\\Models\\Property','12km'),(3,40,'Botble\\RealEstate\\Models\\Property','6km'),(3,41,'Botble\\RealEstate\\Models\\Property','2km'),(3,42,'Botble\\RealEstate\\Models\\Property','12km'),(3,43,'Botble\\RealEstate\\Models\\Property','3km'),(3,44,'Botble\\RealEstate\\Models\\Property','10km'),(3,45,'Botble\\RealEstate\\Models\\Property','12km'),(3,46,'Botble\\RealEstate\\Models\\Property','3km'),(3,47,'Botble\\RealEstate\\Models\\Property','11km'),(3,48,'Botble\\RealEstate\\Models\\Property','12km'),(3,49,'Botble\\RealEstate\\Models\\Property','8km'),(3,50,'Botble\\RealEstate\\Models\\Property','14km'),(3,51,'Botble\\RealEstate\\Models\\Property','12km'),(3,52,'Botble\\RealEstate\\Models\\Property','8km'),(3,53,'Botble\\RealEstate\\Models\\Property','10km'),(3,54,'Botble\\RealEstate\\Models\\Property','19km'),(3,55,'Botble\\RealEstate\\Models\\Property','7km'),(3,56,'Botble\\RealEstate\\Models\\Property','12km'),(3,57,'Botble\\RealEstate\\Models\\Property','17km'),(3,58,'Botble\\RealEstate\\Models\\Property','14km'),(3,59,'Botble\\RealEstate\\Models\\Property','12km'),(3,60,'Botble\\RealEstate\\Models\\Property','8km'),(3,61,'Botble\\RealEstate\\Models\\Property','17km'),(4,1,'Botble\\RealEstate\\Models\\Property','1km'),(4,2,'Botble\\RealEstate\\Models\\Property','14km'),(4,3,'Botble\\RealEstate\\Models\\Property','7km'),(4,4,'Botble\\RealEstate\\Models\\Property','19km'),(4,5,'Botble\\RealEstate\\Models\\Property','12km'),(4,6,'Botble\\RealEstate\\Models\\Property','6km'),(4,7,'Botble\\RealEstate\\Models\\Property','1km'),(4,8,'Botble\\RealEstate\\Models\\Property','10km'),(4,9,'Botble\\RealEstate\\Models\\Property','18km'),(4,10,'Botble\\RealEstate\\Models\\Property','11km'),(4,11,'Botble\\RealEstate\\Models\\Property','18km'),(4,12,'Botble\\RealEstate\\Models\\Property','8km'),(4,13,'Botble\\RealEstate\\Models\\Property','5km'),(4,14,'Botble\\RealEstate\\Models\\Property','1km'),(4,15,'Botble\\RealEstate\\Models\\Property','1km'),(4,16,'Botble\\RealEstate\\Models\\Property','11km'),(4,17,'Botble\\RealEstate\\Models\\Property','3km'),(4,18,'Botble\\RealEstate\\Models\\Property','2km'),(4,19,'Botble\\RealEstate\\Models\\Property','15km'),(4,20,'Botble\\RealEstate\\Models\\Property','10km'),(4,21,'Botble\\RealEstate\\Models\\Property','7km'),(4,22,'Botble\\RealEstate\\Models\\Property','13km'),(4,23,'Botble\\RealEstate\\Models\\Property','2km'),(4,24,'Botble\\RealEstate\\Models\\Property','9km'),(4,25,'Botble\\RealEstate\\Models\\Property','9km'),(4,26,'Botble\\RealEstate\\Models\\Property','8km'),(4,27,'Botble\\RealEstate\\Models\\Property','15km'),(4,28,'Botble\\RealEstate\\Models\\Property','19km'),(4,29,'Botble\\RealEstate\\Models\\Property','2km'),(4,30,'Botble\\RealEstate\\Models\\Property','9km'),(4,31,'Botble\\RealEstate\\Models\\Property','1km'),(4,32,'Botble\\RealEstate\\Models\\Property','1km'),(4,33,'Botble\\RealEstate\\Models\\Property','13km'),(4,34,'Botble\\RealEstate\\Models\\Property','18km'),(4,35,'Botble\\RealEstate\\Models\\Property','18km'),(4,36,'Botble\\RealEstate\\Models\\Property','17km'),(4,37,'Botble\\RealEstate\\Models\\Property','11km'),(4,38,'Botble\\RealEstate\\Models\\Property','13km'),(4,39,'Botble\\RealEstate\\Models\\Property','5km'),(4,40,'Botble\\RealEstate\\Models\\Property','3km'),(4,41,'Botble\\RealEstate\\Models\\Property','9km'),(4,42,'Botble\\RealEstate\\Models\\Property','7km'),(4,43,'Botble\\RealEstate\\Models\\Property','2km'),(4,44,'Botble\\RealEstate\\Models\\Property','10km'),(4,45,'Botble\\RealEstate\\Models\\Property','4km'),(4,46,'Botble\\RealEstate\\Models\\Property','10km'),(4,47,'Botble\\RealEstate\\Models\\Property','10km'),(4,48,'Botble\\RealEstate\\Models\\Property','4km'),(4,49,'Botble\\RealEstate\\Models\\Property','12km'),(4,50,'Botble\\RealEstate\\Models\\Property','20km'),(4,51,'Botble\\RealEstate\\Models\\Property','19km'),(4,52,'Botble\\RealEstate\\Models\\Property','10km'),(4,53,'Botble\\RealEstate\\Models\\Property','17km'),(4,54,'Botble\\RealEstate\\Models\\Property','2km'),(4,55,'Botble\\RealEstate\\Models\\Property','1km'),(4,56,'Botble\\RealEstate\\Models\\Property','20km'),(4,57,'Botble\\RealEstate\\Models\\Property','7km'),(4,58,'Botble\\RealEstate\\Models\\Property','18km'),(4,59,'Botble\\RealEstate\\Models\\Property','9km'),(4,60,'Botble\\RealEstate\\Models\\Property','12km'),(4,61,'Botble\\RealEstate\\Models\\Property','3km'),(5,1,'Botble\\RealEstate\\Models\\Property','16km'),(5,2,'Botble\\RealEstate\\Models\\Property','10km'),(5,3,'Botble\\RealEstate\\Models\\Property','17km'),(5,4,'Botble\\RealEstate\\Models\\Property','6km'),(5,5,'Botble\\RealEstate\\Models\\Property','2km'),(5,6,'Botble\\RealEstate\\Models\\Property','15km'),(5,7,'Botble\\RealEstate\\Models\\Property','14km'),(5,8,'Botble\\RealEstate\\Models\\Property','4km'),(5,9,'Botble\\RealEstate\\Models\\Property','1km'),(5,10,'Botble\\RealEstate\\Models\\Property','3km'),(5,11,'Botble\\RealEstate\\Models\\Property','11km'),(5,12,'Botble\\RealEstate\\Models\\Property','4km'),(5,13,'Botble\\RealEstate\\Models\\Property','4km'),(5,14,'Botble\\RealEstate\\Models\\Property','4km'),(5,15,'Botble\\RealEstate\\Models\\Property','17km'),(5,16,'Botble\\RealEstate\\Models\\Property','18km'),(5,17,'Botble\\RealEstate\\Models\\Property','6km'),(5,18,'Botble\\RealEstate\\Models\\Property','8km'),(5,19,'Botble\\RealEstate\\Models\\Property','5km'),(5,20,'Botble\\RealEstate\\Models\\Property','11km'),(5,21,'Botble\\RealEstate\\Models\\Property','15km'),(5,22,'Botble\\RealEstate\\Models\\Property','11km'),(5,23,'Botble\\RealEstate\\Models\\Property','11km'),(5,24,'Botble\\RealEstate\\Models\\Property','11km'),(5,25,'Botble\\RealEstate\\Models\\Property','1km'),(5,26,'Botble\\RealEstate\\Models\\Property','12km'),(5,27,'Botble\\RealEstate\\Models\\Property','17km'),(5,28,'Botble\\RealEstate\\Models\\Property','20km'),(5,29,'Botble\\RealEstate\\Models\\Property','2km'),(5,30,'Botble\\RealEstate\\Models\\Property','18km'),(5,31,'Botble\\RealEstate\\Models\\Property','10km'),(5,32,'Botble\\RealEstate\\Models\\Property','6km'),(5,33,'Botble\\RealEstate\\Models\\Property','2km'),(5,34,'Botble\\RealEstate\\Models\\Property','5km'),(5,35,'Botble\\RealEstate\\Models\\Property','6km'),(5,36,'Botble\\RealEstate\\Models\\Property','2km'),(5,37,'Botble\\RealEstate\\Models\\Property','16km'),(5,38,'Botble\\RealEstate\\Models\\Property','20km'),(5,39,'Botble\\RealEstate\\Models\\Property','9km'),(5,40,'Botble\\RealEstate\\Models\\Property','19km'),(5,41,'Botble\\RealEstate\\Models\\Property','16km'),(5,42,'Botble\\RealEstate\\Models\\Property','13km'),(5,43,'Botble\\RealEstate\\Models\\Property','3km'),(5,44,'Botble\\RealEstate\\Models\\Property','3km'),(5,45,'Botble\\RealEstate\\Models\\Property','20km'),(5,46,'Botble\\RealEstate\\Models\\Property','13km'),(5,47,'Botble\\RealEstate\\Models\\Property','2km'),(5,48,'Botble\\RealEstate\\Models\\Property','16km'),(5,49,'Botble\\RealEstate\\Models\\Property','13km'),(5,50,'Botble\\RealEstate\\Models\\Property','20km'),(5,51,'Botble\\RealEstate\\Models\\Property','10km'),(5,52,'Botble\\RealEstate\\Models\\Property','20km'),(5,53,'Botble\\RealEstate\\Models\\Property','5km'),(5,54,'Botble\\RealEstate\\Models\\Property','3km'),(5,55,'Botble\\RealEstate\\Models\\Property','3km'),(5,56,'Botble\\RealEstate\\Models\\Property','16km'),(5,57,'Botble\\RealEstate\\Models\\Property','20km'),(5,58,'Botble\\RealEstate\\Models\\Property','8km'),(5,59,'Botble\\RealEstate\\Models\\Property','20km'),(5,60,'Botble\\RealEstate\\Models\\Property','6km'),(5,61,'Botble\\RealEstate\\Models\\Property','10km'),(6,1,'Botble\\RealEstate\\Models\\Property','6km'),(6,2,'Botble\\RealEstate\\Models\\Property','1km'),(6,3,'Botble\\RealEstate\\Models\\Property','14km'),(6,4,'Botble\\RealEstate\\Models\\Property','11km'),(6,5,'Botble\\RealEstate\\Models\\Property','10km'),(6,6,'Botble\\RealEstate\\Models\\Property','3km'),(6,7,'Botble\\RealEstate\\Models\\Property','12km'),(6,8,'Botble\\RealEstate\\Models\\Property','6km'),(6,9,'Botble\\RealEstate\\Models\\Property','3km'),(6,10,'Botble\\RealEstate\\Models\\Property','15km'),(6,11,'Botble\\RealEstate\\Models\\Property','18km'),(6,12,'Botble\\RealEstate\\Models\\Property','9km'),(6,13,'Botble\\RealEstate\\Models\\Property','16km'),(6,14,'Botble\\RealEstate\\Models\\Property','4km'),(6,15,'Botble\\RealEstate\\Models\\Property','8km'),(6,16,'Botble\\RealEstate\\Models\\Property','18km'),(6,17,'Botble\\RealEstate\\Models\\Property','18km'),(6,18,'Botble\\RealEstate\\Models\\Property','2km'),(6,19,'Botble\\RealEstate\\Models\\Property','12km'),(6,20,'Botble\\RealEstate\\Models\\Property','5km'),(6,21,'Botble\\RealEstate\\Models\\Property','17km'),(6,22,'Botble\\RealEstate\\Models\\Property','20km'),(6,23,'Botble\\RealEstate\\Models\\Property','19km'),(6,24,'Botble\\RealEstate\\Models\\Property','8km'),(6,25,'Botble\\RealEstate\\Models\\Property','3km'),(6,26,'Botble\\RealEstate\\Models\\Property','8km'),(6,27,'Botble\\RealEstate\\Models\\Property','7km'),(6,28,'Botble\\RealEstate\\Models\\Property','2km'),(6,29,'Botble\\RealEstate\\Models\\Property','2km'),(6,30,'Botble\\RealEstate\\Models\\Property','19km'),(6,31,'Botble\\RealEstate\\Models\\Property','6km'),(6,32,'Botble\\RealEstate\\Models\\Property','20km'),(6,33,'Botble\\RealEstate\\Models\\Property','10km'),(6,34,'Botble\\RealEstate\\Models\\Property','3km'),(6,35,'Botble\\RealEstate\\Models\\Property','7km'),(6,36,'Botble\\RealEstate\\Models\\Property','10km'),(6,37,'Botble\\RealEstate\\Models\\Property','3km'),(6,38,'Botble\\RealEstate\\Models\\Property','4km'),(6,39,'Botble\\RealEstate\\Models\\Property','4km'),(6,40,'Botble\\RealEstate\\Models\\Property','20km'),(6,41,'Botble\\RealEstate\\Models\\Property','11km'),(6,42,'Botble\\RealEstate\\Models\\Property','17km'),(6,43,'Botble\\RealEstate\\Models\\Property','7km'),(6,44,'Botble\\RealEstate\\Models\\Property','17km'),(6,45,'Botble\\RealEstate\\Models\\Property','1km'),(6,46,'Botble\\RealEstate\\Models\\Property','4km'),(6,47,'Botble\\RealEstate\\Models\\Property','1km'),(6,48,'Botble\\RealEstate\\Models\\Property','18km'),(6,49,'Botble\\RealEstate\\Models\\Property','3km'),(6,50,'Botble\\RealEstate\\Models\\Property','18km'),(6,51,'Botble\\RealEstate\\Models\\Property','4km'),(6,52,'Botble\\RealEstate\\Models\\Property','13km'),(6,53,'Botble\\RealEstate\\Models\\Property','14km'),(6,54,'Botble\\RealEstate\\Models\\Property','3km'),(6,55,'Botble\\RealEstate\\Models\\Property','6km'),(6,56,'Botble\\RealEstate\\Models\\Property','14km'),(6,57,'Botble\\RealEstate\\Models\\Property','4km'),(6,58,'Botble\\RealEstate\\Models\\Property','13km'),(6,59,'Botble\\RealEstate\\Models\\Property','1km'),(6,60,'Botble\\RealEstate\\Models\\Property','14km'),(6,61,'Botble\\RealEstate\\Models\\Property','11km'),(7,1,'Botble\\RealEstate\\Models\\Property','15km'),(7,2,'Botble\\RealEstate\\Models\\Property','5km'),(7,3,'Botble\\RealEstate\\Models\\Property','15km'),(7,4,'Botble\\RealEstate\\Models\\Property','3km'),(7,5,'Botble\\RealEstate\\Models\\Property','9km'),(7,6,'Botble\\RealEstate\\Models\\Property','7km'),(7,7,'Botble\\RealEstate\\Models\\Property','17km'),(7,8,'Botble\\RealEstate\\Models\\Property','8km'),(7,9,'Botble\\RealEstate\\Models\\Property','10km'),(7,10,'Botble\\RealEstate\\Models\\Property','19km'),(7,11,'Botble\\RealEstate\\Models\\Property','10km'),(7,12,'Botble\\RealEstate\\Models\\Property','10km'),(7,13,'Botble\\RealEstate\\Models\\Property','14km'),(7,14,'Botble\\RealEstate\\Models\\Property','5km'),(7,15,'Botble\\RealEstate\\Models\\Property','20km'),(7,16,'Botble\\RealEstate\\Models\\Property','1km'),(7,17,'Botble\\RealEstate\\Models\\Property','5km'),(7,18,'Botble\\RealEstate\\Models\\Property','18km'),(7,19,'Botble\\RealEstate\\Models\\Property','19km'),(7,20,'Botble\\RealEstate\\Models\\Property','12km'),(7,21,'Botble\\RealEstate\\Models\\Property','7km'),(7,22,'Botble\\RealEstate\\Models\\Property','18km'),(7,23,'Botble\\RealEstate\\Models\\Property','4km'),(7,24,'Botble\\RealEstate\\Models\\Property','19km'),(7,25,'Botble\\RealEstate\\Models\\Property','5km'),(7,26,'Botble\\RealEstate\\Models\\Property','19km'),(7,27,'Botble\\RealEstate\\Models\\Property','7km'),(7,28,'Botble\\RealEstate\\Models\\Property','18km'),(7,29,'Botble\\RealEstate\\Models\\Property','5km'),(7,30,'Botble\\RealEstate\\Models\\Property','14km'),(7,31,'Botble\\RealEstate\\Models\\Property','9km'),(7,32,'Botble\\RealEstate\\Models\\Property','4km'),(7,33,'Botble\\RealEstate\\Models\\Property','8km'),(7,34,'Botble\\RealEstate\\Models\\Property','14km'),(7,35,'Botble\\RealEstate\\Models\\Property','15km'),(7,36,'Botble\\RealEstate\\Models\\Property','20km'),(7,37,'Botble\\RealEstate\\Models\\Property','14km'),(7,38,'Botble\\RealEstate\\Models\\Property','1km'),(7,39,'Botble\\RealEstate\\Models\\Property','10km'),(7,40,'Botble\\RealEstate\\Models\\Property','18km'),(7,41,'Botble\\RealEstate\\Models\\Property','3km'),(7,42,'Botble\\RealEstate\\Models\\Property','13km'),(7,43,'Botble\\RealEstate\\Models\\Property','8km'),(7,44,'Botble\\RealEstate\\Models\\Property','12km'),(7,45,'Botble\\RealEstate\\Models\\Property','1km'),(7,46,'Botble\\RealEstate\\Models\\Property','18km'),(7,47,'Botble\\RealEstate\\Models\\Property','10km'),(7,48,'Botble\\RealEstate\\Models\\Property','19km'),(7,49,'Botble\\RealEstate\\Models\\Property','19km'),(7,50,'Botble\\RealEstate\\Models\\Property','1km'),(7,51,'Botble\\RealEstate\\Models\\Property','3km'),(7,52,'Botble\\RealEstate\\Models\\Property','18km'),(7,53,'Botble\\RealEstate\\Models\\Property','19km'),(7,54,'Botble\\RealEstate\\Models\\Property','4km'),(7,55,'Botble\\RealEstate\\Models\\Property','17km'),(7,56,'Botble\\RealEstate\\Models\\Property','4km'),(7,57,'Botble\\RealEstate\\Models\\Property','1km'),(7,58,'Botble\\RealEstate\\Models\\Property','7km'),(7,59,'Botble\\RealEstate\\Models\\Property','18km'),(7,60,'Botble\\RealEstate\\Models\\Property','14km'),(7,61,'Botble\\RealEstate\\Models\\Property','17km'),(8,1,'Botble\\RealEstate\\Models\\Property','9km'),(8,2,'Botble\\RealEstate\\Models\\Property','10km'),(8,3,'Botble\\RealEstate\\Models\\Property','8km'),(8,4,'Botble\\RealEstate\\Models\\Property','10km'),(8,5,'Botble\\RealEstate\\Models\\Property','20km'),(8,6,'Botble\\RealEstate\\Models\\Property','4km'),(8,7,'Botble\\RealEstate\\Models\\Property','16km'),(8,8,'Botble\\RealEstate\\Models\\Property','15km'),(8,9,'Botble\\RealEstate\\Models\\Property','12km'),(8,10,'Botble\\RealEstate\\Models\\Property','16km'),(8,11,'Botble\\RealEstate\\Models\\Property','5km'),(8,12,'Botble\\RealEstate\\Models\\Property','6km'),(8,13,'Botble\\RealEstate\\Models\\Property','7km'),(8,14,'Botble\\RealEstate\\Models\\Property','1km'),(8,15,'Botble\\RealEstate\\Models\\Property','1km'),(8,16,'Botble\\RealEstate\\Models\\Property','11km'),(8,17,'Botble\\RealEstate\\Models\\Property','19km'),(8,18,'Botble\\RealEstate\\Models\\Property','10km'),(8,19,'Botble\\RealEstate\\Models\\Property','12km'),(8,20,'Botble\\RealEstate\\Models\\Property','20km'),(8,21,'Botble\\RealEstate\\Models\\Property','5km'),(8,22,'Botble\\RealEstate\\Models\\Property','16km'),(8,23,'Botble\\RealEstate\\Models\\Property','10km'),(8,24,'Botble\\RealEstate\\Models\\Property','18km'),(8,25,'Botble\\RealEstate\\Models\\Property','20km'),(8,26,'Botble\\RealEstate\\Models\\Property','1km'),(8,27,'Botble\\RealEstate\\Models\\Property','19km'),(8,28,'Botble\\RealEstate\\Models\\Property','6km'),(8,29,'Botble\\RealEstate\\Models\\Property','19km'),(8,30,'Botble\\RealEstate\\Models\\Property','11km'),(8,31,'Botble\\RealEstate\\Models\\Property','8km'),(8,32,'Botble\\RealEstate\\Models\\Property','19km'),(8,33,'Botble\\RealEstate\\Models\\Property','1km'),(8,34,'Botble\\RealEstate\\Models\\Property','11km'),(8,35,'Botble\\RealEstate\\Models\\Property','1km'),(8,36,'Botble\\RealEstate\\Models\\Property','2km'),(8,37,'Botble\\RealEstate\\Models\\Property','8km'),(8,38,'Botble\\RealEstate\\Models\\Property','16km'),(8,39,'Botble\\RealEstate\\Models\\Property','18km'),(8,40,'Botble\\RealEstate\\Models\\Property','2km'),(8,41,'Botble\\RealEstate\\Models\\Property','5km'),(8,42,'Botble\\RealEstate\\Models\\Property','15km'),(8,43,'Botble\\RealEstate\\Models\\Property','11km'),(8,44,'Botble\\RealEstate\\Models\\Property','5km'),(8,45,'Botble\\RealEstate\\Models\\Property','9km'),(8,46,'Botble\\RealEstate\\Models\\Property','18km'),(8,47,'Botble\\RealEstate\\Models\\Property','8km'),(8,48,'Botble\\RealEstate\\Models\\Property','14km'),(8,49,'Botble\\RealEstate\\Models\\Property','8km'),(8,50,'Botble\\RealEstate\\Models\\Property','7km'),(8,51,'Botble\\RealEstate\\Models\\Property','9km'),(8,52,'Botble\\RealEstate\\Models\\Property','13km'),(8,53,'Botble\\RealEstate\\Models\\Property','13km'),(8,54,'Botble\\RealEstate\\Models\\Property','18km'),(8,55,'Botble\\RealEstate\\Models\\Property','18km'),(8,56,'Botble\\RealEstate\\Models\\Property','6km'),(8,57,'Botble\\RealEstate\\Models\\Property','9km'),(8,58,'Botble\\RealEstate\\Models\\Property','6km'),(8,59,'Botble\\RealEstate\\Models\\Property','17km'),(8,60,'Botble\\RealEstate\\Models\\Property','1km'),(8,61,'Botble\\RealEstate\\Models\\Property','9km'),(9,1,'Botble\\RealEstate\\Models\\Property','7km'),(9,2,'Botble\\RealEstate\\Models\\Property','13km'),(9,3,'Botble\\RealEstate\\Models\\Property','12km'),(9,4,'Botble\\RealEstate\\Models\\Property','7km'),(9,5,'Botble\\RealEstate\\Models\\Property','15km'),(9,6,'Botble\\RealEstate\\Models\\Property','5km'),(9,7,'Botble\\RealEstate\\Models\\Property','2km'),(9,8,'Botble\\RealEstate\\Models\\Property','15km'),(9,9,'Botble\\RealEstate\\Models\\Property','8km'),(9,10,'Botble\\RealEstate\\Models\\Property','6km'),(9,11,'Botble\\RealEstate\\Models\\Property','10km'),(9,12,'Botble\\RealEstate\\Models\\Property','4km'),(9,13,'Botble\\RealEstate\\Models\\Property','13km'),(9,14,'Botble\\RealEstate\\Models\\Property','17km'),(9,15,'Botble\\RealEstate\\Models\\Property','16km'),(9,16,'Botble\\RealEstate\\Models\\Property','14km'),(9,17,'Botble\\RealEstate\\Models\\Property','1km'),(9,18,'Botble\\RealEstate\\Models\\Property','1km'),(9,19,'Botble\\RealEstate\\Models\\Property','18km'),(9,20,'Botble\\RealEstate\\Models\\Property','2km'),(9,21,'Botble\\RealEstate\\Models\\Property','1km'),(9,22,'Botble\\RealEstate\\Models\\Property','9km'),(9,23,'Botble\\RealEstate\\Models\\Property','15km'),(9,24,'Botble\\RealEstate\\Models\\Property','11km'),(9,25,'Botble\\RealEstate\\Models\\Property','10km'),(9,26,'Botble\\RealEstate\\Models\\Property','15km'),(9,27,'Botble\\RealEstate\\Models\\Property','11km'),(9,28,'Botble\\RealEstate\\Models\\Property','6km'),(9,29,'Botble\\RealEstate\\Models\\Property','4km'),(9,30,'Botble\\RealEstate\\Models\\Property','2km'),(9,31,'Botble\\RealEstate\\Models\\Property','13km'),(9,32,'Botble\\RealEstate\\Models\\Property','18km'),(9,33,'Botble\\RealEstate\\Models\\Property','14km'),(9,34,'Botble\\RealEstate\\Models\\Property','1km'),(9,35,'Botble\\RealEstate\\Models\\Property','20km'),(9,36,'Botble\\RealEstate\\Models\\Property','12km'),(9,37,'Botble\\RealEstate\\Models\\Property','1km'),(9,38,'Botble\\RealEstate\\Models\\Property','9km'),(9,39,'Botble\\RealEstate\\Models\\Property','9km'),(9,40,'Botble\\RealEstate\\Models\\Property','14km'),(9,41,'Botble\\RealEstate\\Models\\Property','18km'),(9,42,'Botble\\RealEstate\\Models\\Property','2km'),(9,43,'Botble\\RealEstate\\Models\\Property','6km'),(9,44,'Botble\\RealEstate\\Models\\Property','14km'),(9,45,'Botble\\RealEstate\\Models\\Property','1km'),(9,46,'Botble\\RealEstate\\Models\\Property','5km'),(9,47,'Botble\\RealEstate\\Models\\Property','5km'),(9,48,'Botble\\RealEstate\\Models\\Property','4km'),(9,49,'Botble\\RealEstate\\Models\\Property','1km'),(9,50,'Botble\\RealEstate\\Models\\Property','18km'),(9,51,'Botble\\RealEstate\\Models\\Property','2km'),(9,52,'Botble\\RealEstate\\Models\\Property','10km'),(9,53,'Botble\\RealEstate\\Models\\Property','15km'),(9,54,'Botble\\RealEstate\\Models\\Property','12km'),(9,55,'Botble\\RealEstate\\Models\\Property','14km'),(9,56,'Botble\\RealEstate\\Models\\Property','20km'),(9,57,'Botble\\RealEstate\\Models\\Property','15km'),(9,58,'Botble\\RealEstate\\Models\\Property','7km'),(9,59,'Botble\\RealEstate\\Models\\Property','12km'),(9,60,'Botble\\RealEstate\\Models\\Property','6km'),(9,61,'Botble\\RealEstate\\Models\\Property','19km'),(10,1,'Botble\\RealEstate\\Models\\Property','9km'),(10,2,'Botble\\RealEstate\\Models\\Property','8km'),(10,3,'Botble\\RealEstate\\Models\\Property','13km'),(10,4,'Botble\\RealEstate\\Models\\Property','15km'),(10,5,'Botble\\RealEstate\\Models\\Property','9km'),(10,6,'Botble\\RealEstate\\Models\\Property','10km'),(10,7,'Botble\\RealEstate\\Models\\Property','4km'),(10,8,'Botble\\RealEstate\\Models\\Property','5km'),(10,9,'Botble\\RealEstate\\Models\\Property','15km'),(10,10,'Botble\\RealEstate\\Models\\Property','5km'),(10,11,'Botble\\RealEstate\\Models\\Property','1km'),(10,12,'Botble\\RealEstate\\Models\\Property','9km'),(10,13,'Botble\\RealEstate\\Models\\Property','18km'),(10,14,'Botble\\RealEstate\\Models\\Property','14km'),(10,15,'Botble\\RealEstate\\Models\\Property','6km'),(10,16,'Botble\\RealEstate\\Models\\Property','12km'),(10,17,'Botble\\RealEstate\\Models\\Property','12km'),(10,18,'Botble\\RealEstate\\Models\\Property','18km'),(10,19,'Botble\\RealEstate\\Models\\Property','10km'),(10,20,'Botble\\RealEstate\\Models\\Property','8km'),(10,21,'Botble\\RealEstate\\Models\\Property','12km'),(10,22,'Botble\\RealEstate\\Models\\Property','4km'),(10,23,'Botble\\RealEstate\\Models\\Property','4km'),(10,24,'Botble\\RealEstate\\Models\\Property','5km'),(10,25,'Botble\\RealEstate\\Models\\Property','12km'),(10,26,'Botble\\RealEstate\\Models\\Property','19km'),(10,27,'Botble\\RealEstate\\Models\\Property','19km'),(10,28,'Botble\\RealEstate\\Models\\Property','9km'),(10,29,'Botble\\RealEstate\\Models\\Property','3km'),(10,30,'Botble\\RealEstate\\Models\\Property','2km'),(10,31,'Botble\\RealEstate\\Models\\Property','9km'),(10,32,'Botble\\RealEstate\\Models\\Property','8km'),(10,33,'Botble\\RealEstate\\Models\\Property','8km'),(10,34,'Botble\\RealEstate\\Models\\Property','8km'),(10,35,'Botble\\RealEstate\\Models\\Property','20km'),(10,36,'Botble\\RealEstate\\Models\\Property','7km'),(10,37,'Botble\\RealEstate\\Models\\Property','13km'),(10,38,'Botble\\RealEstate\\Models\\Property','17km'),(10,39,'Botble\\RealEstate\\Models\\Property','11km'),(10,40,'Botble\\RealEstate\\Models\\Property','1km'),(10,41,'Botble\\RealEstate\\Models\\Property','18km'),(10,42,'Botble\\RealEstate\\Models\\Property','14km'),(10,43,'Botble\\RealEstate\\Models\\Property','5km'),(10,44,'Botble\\RealEstate\\Models\\Property','14km'),(10,45,'Botble\\RealEstate\\Models\\Property','11km'),(10,46,'Botble\\RealEstate\\Models\\Property','11km'),(10,47,'Botble\\RealEstate\\Models\\Property','18km'),(10,48,'Botble\\RealEstate\\Models\\Property','19km'),(10,49,'Botble\\RealEstate\\Models\\Property','3km'),(10,50,'Botble\\RealEstate\\Models\\Property','20km'),(10,51,'Botble\\RealEstate\\Models\\Property','4km'),(10,52,'Botble\\RealEstate\\Models\\Property','11km'),(10,53,'Botble\\RealEstate\\Models\\Property','17km'),(10,54,'Botble\\RealEstate\\Models\\Property','7km'),(10,55,'Botble\\RealEstate\\Models\\Property','5km'),(10,56,'Botble\\RealEstate\\Models\\Property','11km'),(10,57,'Botble\\RealEstate\\Models\\Property','4km'),(10,58,'Botble\\RealEstate\\Models\\Property','17km'),(10,59,'Botble\\RealEstate\\Models\\Property','13km'),(10,60,'Botble\\RealEstate\\Models\\Property','19km'),(10,61,'Botble\\RealEstate\\Models\\Property','19km'),(11,1,'Botble\\RealEstate\\Models\\Property','4km'),(11,2,'Botble\\RealEstate\\Models\\Property','12km'),(11,3,'Botble\\RealEstate\\Models\\Property','3km'),(11,4,'Botble\\RealEstate\\Models\\Property','2km'),(11,5,'Botble\\RealEstate\\Models\\Property','2km'),(11,6,'Botble\\RealEstate\\Models\\Property','20km'),(11,7,'Botble\\RealEstate\\Models\\Property','18km'),(11,8,'Botble\\RealEstate\\Models\\Property','3km'),(11,9,'Botble\\RealEstate\\Models\\Property','2km'),(11,10,'Botble\\RealEstate\\Models\\Property','18km'),(11,11,'Botble\\RealEstate\\Models\\Property','11km'),(11,12,'Botble\\RealEstate\\Models\\Property','9km'),(11,13,'Botble\\RealEstate\\Models\\Property','13km'),(11,14,'Botble\\RealEstate\\Models\\Property','11km'),(11,15,'Botble\\RealEstate\\Models\\Property','15km'),(11,16,'Botble\\RealEstate\\Models\\Property','8km'),(11,17,'Botble\\RealEstate\\Models\\Property','20km'),(11,18,'Botble\\RealEstate\\Models\\Property','16km'),(11,19,'Botble\\RealEstate\\Models\\Property','1km'),(11,20,'Botble\\RealEstate\\Models\\Property','17km'),(11,21,'Botble\\RealEstate\\Models\\Property','10km'),(11,22,'Botble\\RealEstate\\Models\\Property','20km'),(11,23,'Botble\\RealEstate\\Models\\Property','3km'),(11,24,'Botble\\RealEstate\\Models\\Property','4km'),(11,25,'Botble\\RealEstate\\Models\\Property','18km'),(11,26,'Botble\\RealEstate\\Models\\Property','7km'),(11,27,'Botble\\RealEstate\\Models\\Property','10km'),(11,28,'Botble\\RealEstate\\Models\\Property','17km'),(11,29,'Botble\\RealEstate\\Models\\Property','13km'),(11,30,'Botble\\RealEstate\\Models\\Property','18km'),(11,31,'Botble\\RealEstate\\Models\\Property','2km'),(11,32,'Botble\\RealEstate\\Models\\Property','19km'),(11,33,'Botble\\RealEstate\\Models\\Property','15km'),(11,34,'Botble\\RealEstate\\Models\\Property','6km'),(11,35,'Botble\\RealEstate\\Models\\Property','6km'),(11,36,'Botble\\RealEstate\\Models\\Property','15km'),(11,37,'Botble\\RealEstate\\Models\\Property','16km'),(11,38,'Botble\\RealEstate\\Models\\Property','20km'),(11,39,'Botble\\RealEstate\\Models\\Property','3km'),(11,40,'Botble\\RealEstate\\Models\\Property','11km'),(11,41,'Botble\\RealEstate\\Models\\Property','12km'),(11,42,'Botble\\RealEstate\\Models\\Property','13km'),(11,43,'Botble\\RealEstate\\Models\\Property','9km'),(11,44,'Botble\\RealEstate\\Models\\Property','8km'),(11,45,'Botble\\RealEstate\\Models\\Property','15km'),(11,46,'Botble\\RealEstate\\Models\\Property','12km'),(11,47,'Botble\\RealEstate\\Models\\Property','11km'),(11,48,'Botble\\RealEstate\\Models\\Property','2km'),(11,49,'Botble\\RealEstate\\Models\\Property','16km'),(11,50,'Botble\\RealEstate\\Models\\Property','8km'),(11,51,'Botble\\RealEstate\\Models\\Property','15km'),(11,52,'Botble\\RealEstate\\Models\\Property','6km'),(11,53,'Botble\\RealEstate\\Models\\Property','16km'),(11,54,'Botble\\RealEstate\\Models\\Property','19km'),(11,55,'Botble\\RealEstate\\Models\\Property','20km'),(11,56,'Botble\\RealEstate\\Models\\Property','12km'),(11,57,'Botble\\RealEstate\\Models\\Property','5km'),(11,58,'Botble\\RealEstate\\Models\\Property','11km'),(11,59,'Botble\\RealEstate\\Models\\Property','19km'),(11,60,'Botble\\RealEstate\\Models\\Property','17km'),(11,61,'Botble\\RealEstate\\Models\\Property','1km');
/*!40000 ALTER TABLE `re_facilities_distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_translations`
--

DROP TABLE IF EXISTS `re_facilities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_facilities_id`)
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_features_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors`
--

LOCK TABLES `re_investors` WRITE;
/*!40000 ALTER TABLE `re_investors` DISABLE KEYS */;
INSERT INTO `re_investors` VALUES (1,'National Pension Service','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(2,'Generali','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(3,'Temasek','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(4,'China Investment Corporation','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(5,'Government Pension Fund Global','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(6,'PSP Investments','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(7,'MEAG Munich ERGO','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(8,'HOOPP','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(9,'BT Group','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(10,'New York City ERS','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(11,'New Jersey Division of Investment','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(12,'State Super','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(13,'Shinkong','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL),(14,'Rest Super','published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,NULL);
/*!40000 ALTER TABLE `re_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors_translations`
--

DROP TABLE IF EXISTS `re_investors_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_investors_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_investors_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_investors_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
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
INSERT INTO `re_packages` VALUES (1,'Free Trial',0.00,1,0,1,1,1,0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'[[{\"key\":\"text\",\"value\":\"Limited time trial period\"}],[{\"key\":\"text\",\"value\":\"1 listing allowed\"}],[{\"key\":\"text\",\"value\":\"Basic support\"}]]'),(2,'Basic Listing',250.00,1,0,1,5,2,1,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'[[{\"key\":\"text\",\"value\":\"1 listing allowed\"}],[{\"key\":\"text\",\"value\":\"5 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Basic support\"}]]'),(3,'Standard Package',1000.00,1,20,5,10,3,0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'[[{\"key\":\"text\",\"value\":\"5 listings allowed\"}],[{\"key\":\"text\",\"value\":\"10 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Priority support\"}]]'),(4,'Professional Package',1800.00,1,28,10,15,4,0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'[[{\"key\":\"text\",\"value\":\"10 listings allowed\"}],[{\"key\":\"text\",\"value\":\"15 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Premium support\"}],[{\"key\":\"text\",\"value\":\"Featured listings\"}]]'),(5,'Premium Package',2500.00,1,33,15,20,5,0,'published','2024-06-27 00:25:13','2024-06-27 00:25:13',NULL,'[[{\"key\":\"text\",\"value\":\"15 listings allowed\"}],[{\"key\":\"text\",\"value\":\"20 photos per listing\"}],[{\"key\":\"text\",\"value\":\"Premium support\"}],[{\"key\":\"text\",\"value\":\"Featured listings\"}],[{\"key\":\"text\",\"value\":\"Priority listing placement\"}]]');
/*!40000 ALTER TABLE `re_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages_translations`
--

DROP TABLE IF EXISTS `re_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`re_packages_id`)
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `re_project_categories` VALUES (1,1),(1,4),(2,2),(2,4),(3,2),(3,5),(4,4),(5,2),(5,6),(6,3),(6,5),(6,6),(7,5),(8,4),(8,5),(8,6),(9,1),(9,4),(9,5),(10,2),(10,3),(10,5),(11,5),(12,2),(12,3),(12,5),(13,1),(13,2),(13,5),(14,2),(14,4),(14,6),(15,2),(15,6),(16,1),(16,2),(16,4),(17,1),(17,3),(18,3),(18,4),(18,6);
/*!40000 ALTER TABLE `re_project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_features`
--

DROP TABLE IF EXISTS `re_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40000 ALTER TABLE `re_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects`
--

DROP TABLE IF EXISTS `re_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_id` bigint unsigned DEFAULT NULL,
  `number_block` int DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects`
--

LOCK TABLES `re_projects` WRITE;
/*!40000 ALTER TABLE `re_projects` DISABLE KEYS */;
INSERT INTO `re_projects` VALUES (1,'Walnut Park Apartments','Expedita sed libero modi ex nihil. Ut voluptas exercitationem omnis dicta eligendi nesciunt.','Dignissimos distinctio soluta nesciunt qui veritatis. Numquam rerum et quo debitis recusandae non qui. Odit quo sint sit architecto et laboriosam. Sequi dolorum soluta officiis sed distinctio unde facere ducimus. Ut repellat enim voluptas. Iste laudantium voluptas inventore unde minima qui non. Nulla sint a itaque fugiat voluptatem nisi. Et ipsum aliquid reiciendis et cumque. Consequatur aut sit et molestiae iure. Voluptatem laudantium praesentium sit qui alias aspernatur voluptatibus.','[\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\"]','329 Ellis Ramp\nSkylarchester, ND 76943',6,10,3,2018,1,'1975-09-12','1981-09-08',478,5853,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.564919','-75.788924',2897,3,3,NULL),(2,'Sunshine Wonder Villas','Consequatur quia est voluptatum et necessitatibus. Sunt et explicabo neque ipsa autem dolor doloribus. Dolorem voluptatibus veniam error adipisci. Cum rerum voluptate debitis consequuntur.','Consequatur incidunt possimus modi officiis quasi autem. Eaque tempore deleniti architecto. Reprehenderit autem aliquid consequuntur non quidem. Quos sapiente labore non. Aut voluptatem nulla ut id earum deserunt. Facere enim autem quo consequatur aut sit libero qui. Laboriosam sequi aperiam consequatur dolore iste ut. Pariatur nihil voluptas similique ullam. Vero ipsum unde omnis ad ut. Culpa sunt deleniti ducimus omnis at aliquam labore. Qui qui et debitis. Velit qui ex reiciendis. Nostrum sapiente aut dicta voluptates.','[\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/10.jpg\"]','9428 Rice Square Suite 245\nEast Juliana, VT 70520-3412',2,5,20,1641,1,'1976-04-08','1972-01-03',3442,5942,1,5,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.381852','-74.78038',3816,5,5,NULL),(3,'Diamond Island','Consequuntur doloremque repudiandae autem consequuntur. Dicta non et qui molestiae. Facere voluptatem consequatur perferendis.','Optio adipisci tenetur alias. Sit voluptates optio consequatur ut reiciendis. Esse corrupti quis quidem consequuntur pariatur. Minima aut porro est quos dolorem consequatur. Et eum tempore et molestiae et. Ut qui beatae et quo et ipsa. Modi sit nemo nesciunt. Doloremque aperiam perspiciatis odit cumque iste. Ut hic unde voluptas. Cupiditate voluptas dolores eum culpa. Necessitatibus nobis dolor dolores deserunt ducimus quae earum perferendis. Omnis error assumenda molestias et velit molestias incidunt. Autem asperiores delectus voluptatem eos quas. Sed totam nostrum maiores est expedita.','[\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\"]','881 Pagac Street Apt. 753\nEast Nikolas, AK 93839',4,7,17,927,1,'1997-09-09','1976-04-25',8791,12187,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.301755','-75.633747',5496,2,2,NULL),(4,'The Nassim','Neque voluptatum et amet odio est possimus est. Voluptatibus voluptatibus et officia sit consequatur.','Quisquam modi dicta ratione vero excepturi. Excepturi exercitationem vel consequatur. Ut nihil officiis consequatur sit alias. Libero sed qui vel ad impedit aut. Assumenda voluptatibus inventore mollitia a laborum eum iusto. Est provident at magnam natus vel et. Sed quas molestias ab ut aspernatur pariatur. Voluptas ut odit ipsum numquam est reiciendis ut. Repellendus tenetur iste quia iusto aperiam provident. Inventore est et esse recusandae. Dicta quia ea porro ad autem. Omnis autem ipsum ut debitis.','[\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\"]','34016 Hauck Roads Apt. 255\nSouth Kittyborough, NC 15131-2684',12,5,33,2343,0,'1997-11-28','1980-05-30',2714,3627,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.632857','-76.450471',4876,4,4,NULL),(5,'Vinhomes Grand Park','Et nisi ipsum reprehenderit voluptatem est incidunt molestiae. Fugit non ut exercitationem enim autem sapiente perspiciatis. Hic sed nemo explicabo quis est omnis libero.','Est veritatis aut et inventore. Quaerat aliquid id optio consequatur. Illo soluta sint aliquam quibusdam excepturi. Explicabo a magni quam doloremque ut ad pariatur. Velit error in beatae. Quae nemo iure quia blanditiis. Est consequatur iste aspernatur et. Qui recusandae illum blanditiis enim iusto consequuntur. Odio eos consequatur impedit eaque. Ut quibusdam consequatur ipsa beatae et. Non ipsa tempore sint velit dolorem maxime doloremque. Molestias accusantium delectus facilis quia et neque.','[\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\"]','5800 Patience Stream\nNorth Savionfurt, KY 60973',14,1,30,1261,1,'2000-12-24','2008-04-28',4175,9751,1,6,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.940294','-75.949886',1413,6,6,NULL),(6,'The Metropole Thu Thiem','Quidem laboriosam magnam ad porro corporis at rerum. Dolores temporibus impedit sapiente in ea voluptate voluptatum. Eos praesentium repellat voluptatum sunt et quis. Illo optio dolorum quos expedita exercitationem et excepturi laborum.','Aut maiores cum quia deserunt saepe fuga omnis. Architecto architecto cumque omnis voluptates. Consectetur nesciunt est qui illo ratione beatae minima et. Est quia eum amet excepturi excepturi dolore non. Itaque provident non excepturi et fuga voluptatem expedita error. Debitis et excepturi vel est. Facilis enim tempora labore dicta reiciendis. Quis est accusamus asperiores omnis.','[\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/1.jpg\"]','814 Burley Ferry Suite 591\nJustineshire, LA 91161',9,6,5,1471,0,'1979-06-01','1977-11-04',8947,16832,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.330294','-75.801625',3810,2,2,NULL),(7,'Villa on Grand Avenue','Perspiciatis sunt in similique ipsum aut nihil consequatur. Reprehenderit perferendis veritatis architecto facere numquam qui. Odit eos eum consectetur explicabo et est. Molestiae quaerat quo quam tempore enim sed facere.','Reprehenderit magni nemo deleniti beatae. Fugit dolores temporibus et et. Excepturi aut ut est dolores itaque perferendis. Molestias iste reprehenderit est ea. Error mollitia ut enim iste maxime. Inventore voluptas consectetur voluptates et. Accusamus sit ullam cum possimus distinctio eos et mollitia. Consequuntur dolorem possimus numquam omnis dicta sit esse.','[\"properties\\/6.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\"]','88627 August Divide\nNorth Larissa, UT 67772-2280',7,10,34,127,1,'1970-10-21','2016-11-22',2506,12346,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.585781','-76.437662',373,3,3,NULL),(8,'Traditional Food Restaurant','Voluptatum recusandae illum velit ea ex. Corrupti reprehenderit labore natus assumenda. Qui et ex dolores qui ut asperiores. Voluptatem quidem distinctio nihil.','Ullam rerum et tenetur deserunt. Voluptas dolorem id aspernatur et eum quas et et. Molestiae minus quia porro in ipsa. Est veritatis modi sunt recusandae. Quidem aut voluptatem ipsam rerum occaecati. Et porro nisi ut quae vel doloribus similique. Explicabo itaque non sit est id consequatur corporis. Eveniet ut nesciunt mollitia consectetur tempore eius ipsa ipsa.','[\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\"]','665 Frankie Place Apt. 310\nNorth Clintonberg, TX 96613',6,4,34,2075,1,'2009-05-31','1990-06-25',7221,8862,1,5,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.293841','-74.885313',5661,5,5,NULL),(9,'Villa on Hollywood Boulevard','Ipsum fugit ut non aperiam et autem exercitationem velit. Tempora enim id molestiae voluptas. Dolorem commodi sunt molestiae accusamus magnam omnis. Repellat pariatur soluta tenetur suscipit.','Repudiandae consequuntur quae praesentium in beatae illum maiores aut. Est laborum qui assumenda praesentium quisquam enim ut. Quo maxime incidunt et sed quia. Sed accusantium et dignissimos maiores cupiditate iusto enim. Nihil assumenda eum dolorem cumque. Repellendus ea at sit inventore necessitatibus. Est repellendus et veritatis nesciunt quaerat non. Aliquam eligendi est laudantium in eveniet. Id vero repellendus fugiat fuga iusto.','[\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\"]','21372 Cole Courts Suite 932\nSchoenfort, MS 63670-4554',8,1,44,438,0,'1997-04-11','2009-07-17',5320,14303,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.609022','-76.388182',3085,2,2,NULL),(10,'Office Space at Northwest 107th','Voluptatem voluptatem unde libero occaecati excepturi numquam. Et dolore laboriosam assumenda consequatur. Ad aliquam eveniet eum excepturi quae unde et. Laborum inventore quam voluptas.','Laboriosam ullam sequi et eum non. Repudiandae non dolores dicta et officiis. Ipsum et sit hic voluptas quidem ea nihil. Quia dolorem quo doloremque quis ipsa vel hic. Dolor vero illum voluptas magnam ut. Quibusdam corporis veritatis consequatur. Ab non cumque rerum et deleniti. Molestiae nostrum et mollitia velit cumque. Qui alias odio commodi optio quia asperiores omnis. Impedit ex et ducimus cum. Esse minima eum neque possimus eveniet ut. A laudantium voluptatem nostrum tempore assumenda earum. Vel qui aliquam placeat. Dolor inventore voluptate nesciunt sunt et maiores.','[\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\"]','8374 Lorenz Bypass Suite 889\nLake Diego, WV 97787',11,1,1,4322,0,'1994-01-31','2014-09-21',3226,6733,1,6,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','42.662996','-76.018976',7932,6,6,NULL),(11,'Home in Merrick Way','Delectus perspiciatis officia culpa officiis rerum aut delectus. Adipisci asperiores odio fugiat placeat. Eius repellendus magnam incidunt harum.','Voluptatem odio consequuntur et. Non eaque exercitationem nesciunt eum est. Non error odit necessitatibus ducimus est. Quos quae eveniet maiores voluptatum nostrum voluptate qui. Magnam architecto est dolorem quia rerum saepe eveniet. Ut deserunt aut natus culpa iusto iste velit aut. Delectus debitis commodi iure officia. Illum minus excepturi reiciendis voluptates. Est asperiores beatae temporibus delectus debitis id excepturi. Rerum eos magni qui nulla quaerat architecto. Ut architecto laudantium et corporis ullam nostrum tempora. Cupiditate molestiae eveniet blanditiis qui ex explicabo voluptate. Unde corporis perferendis ut commodi quae. Corrupti et consequatur voluptates esse voluptatem eaque.','[\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\"]','6651 Orpha Junctions\nChanelfort, TN 78171-3060',11,3,45,3414,0,'2000-12-02','1979-07-05',8195,12646,1,5,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','42.492019','-75.341203',8644,5,5,NULL),(12,'Adarsh Greens','Sit magnam et quo ut. Tempora sit et ex consequuntur et laboriosam. Iste nulla quas maxime quia. Expedita error consequatur eos qui hic suscipit in.','Tempora dolorem aut quos accusantium asperiores. Similique deserunt perferendis consequatur voluptatem dolorem vel et. Tenetur itaque voluptatem eos minus. Voluptatem illo magni velit quidem quibusdam ea. Laudantium omnis nemo eveniet ut. Numquam et ea tempora facilis. Quam ratione est et architecto aut officiis quos. Porro molestiae at ut ad dolore quasi recusandae est. Aliquam voluptas sapiente dolor non. Officia et iure illum voluptatem ipsum.','[\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\"]','2051 Shawna Plain\nRiceview, AL 32937',4,2,31,1323,0,'2012-06-08','2007-12-14',2263,4484,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.949796','-75.970066',5275,4,4,NULL),(13,'Rustomjee Evershine Global City','Laboriosam accusamus voluptas consequatur voluptate nostrum quibusdam est. Officiis velit sed similique et enim at. Aut quidem eum quidem aut dignissimos fuga. Aut in repellat aut autem autem adipisci.','Maiores omnis itaque cupiditate neque neque. Ullam voluptatem eum qui et aut architecto. Sapiente tempora natus quisquam magni. Est dolores facilis voluptatibus saepe aut. Alias et deleniti sed quos omnis. Et exercitationem suscipit est quis omnis dignissimos quas ea. Minus quas facere qui quidem dolorem rem nostrum. Delectus odit autem facere eaque ex temporibus atque. Facere et quae deleniti necessitatibus dolore voluptas. Delectus ullam aut magni et sed voluptatum tempora. Quia numquam quas maxime qui eos minima est. Sunt assumenda voluptate et aspernatur. Eius numquam nesciunt non optio necessitatibus doloribus.','[\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\"]','508 Lucile Island Apt. 269\nSchillerburgh, CA 99149',5,2,31,1175,0,'1970-01-26','2007-06-12',1122,6431,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.597958','-76.211675',5187,3,3,NULL),(14,'Godrej Exquisite','Cupiditate deleniti culpa praesentium distinctio quaerat. Dolores voluptatem ut aperiam. Officiis aut recusandae minima maxime vel. Est dolore voluptates minima et eaque libero aut.','Ipsum et assumenda quaerat et consequatur voluptas. Est vitae similique voluptas nesciunt fugit corrupti repudiandae. Ipsum neque ea sit est fuga cum sed. Repudiandae aut dolorem et perferendis occaecati. Aut accusantium quisquam animi ut. Facilis magni quaerat eos iure. Non expedita ipsam est nostrum enim neque non.','[\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\"]','6923 Hettinger Mountain\nTraceystad, CA 06705',1,4,8,1698,1,'1982-03-28','1983-12-20',3695,13127,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','42.89932','-75.021779',5805,3,3,NULL),(15,'Godrej Prime','Ut ratione voluptas animi ut. Dolores aut ut sint incidunt mollitia recusandae reiciendis. Consequatur est enim rem.','Accusantium tenetur dicta iure sit repudiandae nobis. Nihil provident quia quod delectus dicta voluptas. Dignissimos culpa cum nulla ut nam. Nostrum aliquid temporibus non inventore est velit. Exercitationem omnis impedit odio voluptatibus ea. Dolore labore ut sit atque. Optio asperiores beatae provident voluptatibus modi. Tempore rem magnam mollitia est occaecati soluta. Magnam libero reprehenderit velit et. Id dolores ipsam in enim consectetur repellendus. Et facilis dolorem id quas incidunt omnis. Cupiditate repudiandae cumque itaque aspernatur. Et ut voluptatem nulla deleniti. Enim odit ipsum ut quam accusantium repellendus.','[\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\"]','9725 Marlin Walk\nNew Maegan, CA 12070',8,9,21,1047,1,'2005-03-11','1972-10-02',6187,7511,1,6,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.094585','-75.297211',9978,6,6,NULL),(16,'PS Panache','Itaque distinctio quam laudantium omnis excepturi natus ut. Quasi voluptatibus sapiente nihil dolor. Ut laudantium iusto harum dicta soluta pariatur tempore tenetur. Dolor voluptatem ratione nihil vero.','Illum illum quisquam quis dolorum maxime. Iste in eos animi dolorem quasi. Id rerum eaque laboriosam necessitatibus eius ipsa. Facere consequuntur doloribus voluptatem fugiat voluptatibus. Similique dignissimos autem placeat vitae saepe expedita. Voluptatem accusamus blanditiis praesentium libero aspernatur. Autem voluptatibus ex voluptate unde non modi ducimus. Sed expedita qui omnis magnam cupiditate harum. Facilis quibusdam eos et voluptatem. Deleniti error nisi quae illo ut maiores.','[\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\"]','969 Jarod Divide Suite 051\nNew Rubiechester, VT 76648',7,7,1,1126,0,'2014-12-13','2014-05-19',6294,12214,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','42.858417','-75.037338',8887,3,3,NULL),(17,'Upturn Atmiya Centria','Laborum dolores tempora omnis sunt. Labore provident eos voluptates dignissimos commodi veniam hic. Eveniet neque qui accusamus eligendi eligendi itaque quae ratione.','Similique excepturi aut dolorum nihil impedit ipsum quo. Dolorem perspiciatis voluptatibus aperiam quia sunt culpa quaerat. Rerum vel corrupti similique magnam eaque. Optio soluta quo aliquid ad aut. In quasi et ut a culpa quia non. Rerum ut voluptates soluta voluptatem. Vero sed ut sint aliquid quis facere. Exercitationem voluptatibus rerum qui nam veniam vitae et. Pariatur quasi velit qui et esse velit.','[\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\"]','4462 Doyle Glens Suite 686\nElenoratown, OR 20933-1405',1,5,2,2337,1,'1988-06-22','2011-04-27',8604,14516,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','43.987191','-75.789745',667,4,4,NULL),(18,'Brigade Oasis','Alias dolorem aut facere illum. Est voluptatem distinctio error aut. Sed excepturi laboriosam nemo at ut.','Sed nulla incidunt dolores veritatis non. Tempore dolorem non reprehenderit quia quia nostrum totam. Consequatur rerum consequuntur consequuntur ullam sunt animi. Porro suscipit facilis placeat inventore eum est consequatur. Sint est est quia quibusdam. Quos quia unde maxime cumque quo velit dignissimos. Natus asperiores cupiditate cupiditate debitis debitis.','[\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\"]','400 Gutkowski Extensions\nManteside, DC 09872',5,9,33,1415,0,'2001-05-13','1971-06-26',8675,11920,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-06-27 00:25:18','2024-06-27 00:25:18','42.498844','-75.186273',438,2,2,NULL);
/*!40000 ALTER TABLE `re_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects_translations`
--

DROP TABLE IF EXISTS `re_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_projects_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `project_id` bigint unsigned DEFAULT '0',
  `number_bedroom` int DEFAULT NULL,
  `number_bathroom` int DEFAULT NULL,
  `number_floor` int DEFAULT NULL,
  `square` double DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` bigint unsigned DEFAULT NULL,
  `period` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties`
--

LOCK TABLES `re_properties` WRITE;
/*!40000 ALTER TABLE `re_properties` DISABLE KEYS */;
INSERT INTO `re_properties` VALUES (1,'3 Beds Villa Calpe, Alicante','sale','Nam quam fuga atque eligendi ducimus mollitia vero. Neque illo sit sed dolorem consectetur beatae. Enim laudantium voluptatem nobis facilis et. Tenetur rerum error error consequatur.','Mollitia soluta quis facere. Quam sit vel dolor sunt delectus. Aut ab saepe saepe aut fugiat sequi. Perspiciatis non est dolor quis eveniet in. Fugiat voluptas qui aliquid aliquid dolor et voluptatem. Quia fugiat maiores delectus ea. Id non expedita possimus aperiam deserunt culpa. Adipisci molestias a est impedit qui. Sed ut et molestiae aut et eum error. Est nam sed placeat laudantium recusandae et.','8635 Stanton Walk\nWillmschester, IN 80280-2418','[\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\"]',11,1,3,61,110,668800.00,NULL,0,2,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.565568','-76.690512',59366,2,2,'GPAGP4'),(2,'Lavida Plus Office-tel 1 Bedroom','sale','Veritatis illum autem aliquam quia accusantium sint incidunt enim. Voluptatem fugiat excepturi aut ea. Mollitia sint est quod dignissimos quae. Magnam quam qui ut odit non.','Recusandae magni dignissimos ex animi facere. Est et consequatur incidunt corrupti laborum rerum quidem. Quia modi commodi illo qui. Repudiandae natus inventore sunt accusantium vel est modi. Amet quia omnis esse rerum porro qui. Voluptas recusandae et officiis adipisci aut nemo. Est harum error qui nemo. Occaecati iure quasi odit minus similique odio aut. Eum voluptas placeat sunt minima et minus cum quod. Laboriosam iure et laboriosam laboriosam officia quo. Qui asperiores eum quasi nihil unde est sapiente. Culpa temporibus porro dignissimos quia est dicta. Est nisi dolores amet autem molestiae consequatur. Consequatur rem omnis quis exercitationem at adipisci quis.','1844 Turner Vista Apt. 025\nJohannaville, WA 48406-5151','[\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\"]',2,7,6,61,720,907300.00,NULL,1,4,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.539598','-74.812725',27948,4,4,'M6TOY8'),(3,'Vinhomes Grand Park Studio 1 Bedroom','sale','Cumque accusamus ipsam qui ab. Quo voluptate ut qui dolore quam et esse. Qui eum corporis nemo voluptatem.','A qui voluptas placeat quo ipsam voluptate. Id dolorem consequuntur dolorem earum voluptatum labore. Voluptas veniam nulla nam sint sed delectus. Porro quo sint distinctio voluptate omnis tempore. Recusandae neque sit in. Officia corrupti est dolorum officia non. Et quam necessitatibus fuga amet quisquam. Eius qui saepe ut pariatur quidem. Quia modi ea sunt autem. Rerum sapiente eum distinctio qui. Incidunt autem odio sint maiores architecto.','401 Floy Landing Suite 444\nRaufurt, NC 77510','[\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\"]',10,6,6,62,590,227600.00,NULL,0,4,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','43.644685','-76.704691',15010,4,4,'XCUVEP'),(4,'The Sun Avenue Office-tel 1 Bedroom','rent','Necessitatibus sit in odit. A doloremque excepturi consequatur error ipsam minima.','Magnam a nihil vitae consequuntur voluptatem consectetur. Ea provident veritatis accusantium dolorem optio molestiae et. Laudantium dolor est repellendus tempora. Impedit laborum sequi in debitis consequuntur et error voluptas. Blanditiis hic eius quia quia quisquam molestias. Vel minus aut facilis fuga dicta sint aut. Aliquid reprehenderit sint sed provident. Labore quia quia delectus illo. Fuga assumenda tempore rerum non. Fugit in rerum magnam exercitationem saepe voluptas et voluptatem. Corrupti autem et quis nemo cupiditate voluptates et. Doloremque est eos ipsum non quidem expedita iure. Qui rerum totam similique deserunt impedit est. A voluptatem recusandae cumque qui occaecati corporis et.','20080 Leuschke Port Suite 762\nWest Asiaside, SD 35264-3192','[\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\"]',13,9,4,99,990,686600.00,NULL,1,3,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.692547','-75.817693',30662,3,3,'N7MG9K'),(5,'Property For sale, Johannesburg, South Africa','sale','Pariatur aut qui animi beatae sunt. Non minima et nesciunt nihil maiores modi. Corrupti voluptate laboriosam ipsa error. Sint quaerat dolore in vero nihil ad. Rerum saepe maiores ea ex.','Et ea optio libero sapiente aliquid dolore. Suscipit sunt velit sit distinctio impedit laudantium. Doloribus sequi sapiente ea. Fugiat sint unde explicabo. In exercitationem optio pariatur omnis. Sed labore nobis ab debitis animi cum. Iure cupiditate aut quasi tempora ut illum. Praesentium repellat occaecati dolor sit. Expedita perferendis sit doloribus voluptatibus natus aut consectetur. Illo hic qui nam deserunt possimus. Et iusto nisi totam vero placeat minus. Rerum molestiae molestiae labore dolores ad. Maxime voluptate nostrum aliquid dolores minus pariatur similique.','81724 Hettinger Roads\nBlandaborough, UT 33142-3619','[\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\"]',4,9,9,91,350,879400.00,NULL,1,4,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','43.07227','-76.613875',42796,4,4,'7R5MYB'),(6,'Stunning French Inspired Manor','rent','Aperiam alias quis quo quia consequatur at. Quaerat temporibus sit modi esse.','Magni et exercitationem voluptas voluptatem laborum reprehenderit. Doloremque quia itaque voluptas sit voluptatum temporibus blanditiis. Consequatur ullam possimus suscipit vero culpa. Saepe dolores ipsum explicabo dolorem adipisci. Ut sapiente vel rerum aliquid. Fugiat perspiciatis quam nemo vel quisquam culpa. Quis nesciunt dolores sunt vitae est repellendus. In nisi repellat dolorem nostrum dolores laboriosam aperiam. Ipsa magni fugit est est. Assumenda repellat velit exercitationem earum eligendi qui fugit rerum. Quis esse eos alias eligendi id.','91843 Shyann Valleys Apt. 355\nDietrichmouth, AL 11085-2460','[\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\"]',4,5,7,80,610,585400.00,NULL,1,4,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.897223','-75.344909',24273,4,4,'AZ56FG'),(7,'Villa for sale at Bermuda Dunes','sale','Fugit ea facilis quia blanditiis quod. Qui ut voluptatum vel iste voluptas. Necessitatibus debitis accusamus harum voluptates.','Possimus dolorem quia quam repellat maiores sunt cum. Nulla et atque veritatis fugiat. Ducimus soluta molestiae adipisci laudantium error. Nulla ullam magnam itaque perspiciatis qui eum. Sit sed molestiae aut nostrum ab ipsa provident. Ut numquam et consequatur ex quaerat aspernatur sunt. Quibusdam placeat mollitia vel. Eos repellendus atque illum nisi sit impedit. Exercitationem eaque enim vero quod. Perspiciatis dolorum debitis mollitia voluptas ea velit. Nobis et harum officiis tempora incidunt ut voluptate.','416 Rodriguez Tunnel\nGreenfelderland, IL 79021-3620','[\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\"]',15,4,7,59,900,409800.00,NULL,1,3,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','43.716714','-74.794778',5758,3,3,'BNOQ5X'),(8,'Walnut Park Apartment','sale','Quasi dolorum ab at qui id libero quasi sed. Porro et laudantium in. Reprehenderit sit esse maxime ea.','Perferendis voluptatem rem sed nihil quo aliquid voluptas. Quaerat enim incidunt corrupti velit in. Voluptas magni voluptatem voluptatum eos hic nobis. Perferendis tenetur distinctio sed nisi doloremque sequi. Ut in quis tempore. Tempora voluptate quisquam nihil nemo excepturi reiciendis voluptatem. Odio vitae iure laborum quia nam vero iusto. Facilis odio aliquam dolorem nulla omnis eum. Et dolorum amet similique consequatur voluptatem eius. Eum ea aperiam eaque perferendis nisi assumenda.','3781 Bill Lodge\nHaleymouth, PA 77776','[\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\"]',15,6,3,39,330,63800.00,NULL,1,1,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','43.810426','-75.112976',92313,1,1,'PWREEH'),(9,'5 beds luxury house','rent','Ipsam cupiditate molestias dolore aut officiis. Beatae et assumenda illum deserunt. Eum quis et veritatis modi qui.','Suscipit sed ab sunt soluta. Blanditiis libero magnam et omnis. Blanditiis pariatur aut et ducimus veritatis tempore illo autem. Et ipsum ipsa sunt voluptas voluptatem quae. Non rerum fugit ullam. Et architecto ipsum laboriosam veritatis aut sit et quaerat. Ipsam amet velit incidunt itaque officiis ut. Dolore provident qui officiis neque molestiae voluptas dignissimos.','69225 Skylar Burg\nGorczanyville, ND 06430-5380','[\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\"]',7,8,5,33,990,924200.00,NULL,0,1,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.497595','-74.992357',76288,1,1,'FPKVZ7'),(10,'Family Victorian \"View\" Home','sale','Natus similique quia quia. Dolorum ut dolor laboriosam. Et numquam iure architecto. Exercitationem cum et et et quia porro totam.','Dolor ut ratione voluptas ratione aut qui. Corporis sit quod excepturi laboriosam magni est vel. Omnis ipsum ea reprehenderit. Consequuntur est provident voluptatem. Quidem autem eum dignissimos maiores. Possimus architecto distinctio asperiores quia aut saepe. Sit veniam ad ut ad alias eos. Qui quia ad modi minus hic fugit perferendis. Ut amet recusandae deserunt in. Consequuntur aperiam aut cum dolores eaque dignissimos.','87776 Uriah Loaf Suite 844\nEast Aricburgh, NC 24895','[\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\"]',2,1,9,53,550,228100.00,NULL,0,2,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','43.309904','-75.594916',85157,2,2,'XDPGFR'),(11,'Osaka Heights Apartment','sale','Eum quae repudiandae placeat dolores magnam sint. Omnis labore voluptate ea iure ut sed velit. Eos tempore illo animi qui natus possimus natus aut.','Unde et impedit quia saepe. Non incidunt fugit et laboriosam ut iure eveniet. Esse totam assumenda sit autem. Laboriosam ut voluptas ipsum et repudiandae nulla nulla. Harum mollitia laboriosam voluptas aut nam animi. Et nobis soluta assumenda impedit. Quibusdam suscipit perferendis fugiat fuga iusto nesciunt dignissimos ut. Odio consectetur voluptates aut quia voluptas hic sed. Voluptatum non ducimus est voluptas. Nisi aut sint numquam ex quas. Eos et quia beatae voluptatem dolor et distinctio. Quae consequatur voluptatem dolores aspernatur. Debitis et sapiente fuga maiores et quia molestiae optio. Dolorum laborum omnis nisi similique culpa repellat.','205 Hahn Road\nArthurfort, VA 53405','[\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\"]',6,4,6,79,290,229300.00,NULL,1,4,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.80464','-76.412595',76676,4,4,'MHFF5F'),(12,'Private Estate Magnificent Views','sale','Reiciendis doloremque et incidunt dicta ea quo eos. Doloremque et possimus qui voluptas asperiores nesciunt. Et quibusdam eos soluta veritatis numquam.','Cumque fuga quia recusandae earum totam ut et. Quam dolorem quia debitis illo omnis. Ullam necessitatibus voluptatum temporibus rerum nostrum facere. Velit nulla sint temporibus laudantium ab. Autem et omnis iure modi enim consequuntur quod. Voluptates in tempore est facere in necessitatibus. Aut aut et sapiente officia inventore ut facilis inventore. Soluta explicabo vitae non non in. Minima incidunt et eum. Modi repellendus sit voluptatem tempore aut illum. Quod amet qui provident rerum qui. Autem harum inventore reprehenderit molestiae odit nostrum asperiores. Id veritatis laboriosam quae enim eos. Quia nulla earum ipsa ipsa repellendus unde.','10840 Conner Curve\nMadilynton, NJ 10370','[\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]',8,5,4,1,800,173000.00,NULL,1,2,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.950774','-75.833485',75897,2,2,'OO6C8E'),(13,'Thompson Road House for rent','sale','Qui delectus corrupti adipisci. Ex alias pariatur voluptas dolor exercitationem. Nostrum sed quis omnis iure dicta dicta ex. Quos nulla eum iure aliquid minima ratione dolores.','Aperiam nihil placeat veritatis culpa eos. Deserunt velit recusandae aut sed. Fugit praesentium omnis ducimus error ullam et aut. Qui accusantium sunt sunt rerum. Autem qui nemo assumenda facere soluta. Perspiciatis nam facere sunt iure impedit minus. Ea ut consequatur iste et. Cumque dolor quo inventore sunt repellat molestiae vel aperiam. Quos molestias et et molestiae voluptatem est. Quidem repellendus molestiae nostrum aut quo sed qui eligendi. Quia quia consequatur quia qui adipisci ipsa rem. Ut quae ut rerum doloremque.','7158 Maye Stravenue\nCrooksfort, PA 98496-9333','[\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\"]',3,1,3,76,970,512400.00,NULL,1,1,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','43.557927','-76.541876',970,1,1,'WIY7WB'),(14,'Brand New 1 Bedroom Apartment In First Class Location','rent','In esse quam ab nihil nisi tempore. Nihil voluptatum sunt consectetur magnam ratione sunt perspiciatis. Temporibus sed fuga rem dolorum.','Quaerat magnam ab quia officiis voluptates eos. Quaerat accusantium officiis veniam ut ut error enim. Sint dignissimos aut et veniam nihil. Vero quis sit et libero provident. Et quae est expedita asperiores aut magni explicabo. Nisi et et veniam rerum cupiditate modi. Voluptatum qui odit optio blanditiis. Eum ullam in est nisi. Est occaecati mollitia quisquam. Aut molestiae libero totam earum nemo.','902 Gust Mall\nLake Jordanfort, ND 31175-3591','[\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\"]',3,1,4,65,440,652100.00,NULL,0,2,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:18','2024-06-27 00:25:18','42.483508','-75.659267',38028,2,2,'39X1YV'),(15,'Elegant family home presents premium modern living','sale','Accusantium est sapiente ipsam similique autem nihil error nihil. Quo officiis nemo tenetur omnis quam. Consequatur consequatur suscipit sit voluptatem quod vitae eos. Itaque aut qui doloremque sint.','Accusamus qui facilis itaque nulla id eaque. Ut aliquam doloremque quibusdam facilis. Sunt voluptatibus ea quidem hic sapiente. Molestias tempora qui et debitis omnis doloremque quae quo. Voluptas voluptatem culpa excepturi consectetur beatae. Est officia dolor qui. Id voluptatem harum aliquid sed est. Voluptatem ullam quidem iure tenetur et assumenda. Assumenda vel praesentium enim odio sunt.','57016 Kaela Crescent Suite 861\nHannahmouth, OR 89103-2412','[\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\"]',8,5,6,59,490,950100.00,NULL,0,5,'month','selling',3,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.678464','-75.212632',63989,5,5,'GKDDPN'),(16,'Luxury Apartments in Singapore for Sale','rent','Est maxime id possimus in. At minus sint aut fugiat commodi alias sit iste. Quos aspernatur voluptatem asperiores consequatur id dolor dolor qui.','Aut sed rerum laboriosam laboriosam dolor blanditiis fugit. Magni nulla dolores perferendis error consequuntur perspiciatis est. Doloribus numquam ut ipsum fugit aliquid rerum ad eligendi. Vel dicta ratione dolor quidem odit quas quam. Impedit rerum cum sint rerum itaque. Sed laudantium reiciendis fuga sit quia et. Neque unde debitis et et est eligendi illum. Aliquid aut earum fugit adipisci dolorum. Soluta repellendus a et officia.','13861 Ortiz Club\nNorth Ronaldo, VA 64363','[\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\"]',6,1,4,71,970,947600.00,NULL,0,4,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.033574','-76.227889',13430,4,4,'HNVPHU'),(17,'5 room luxury penthouse for sale in Kuala Lumpur','sale','Voluptatem recusandae aut omnis. Deleniti doloremque ad porro et voluptatum nobis. Officia rerum neque facere explicabo hic.','Dolores et minus aut facere sint eveniet omnis. Pariatur voluptas nobis est omnis ipsum maiores. Adipisci consequatur quia qui ab. Sunt impedit et id iusto sunt quo. Ea nam cupiditate omnis pariatur ut. Incidunt velit ut inventore ex placeat eveniet ducimus. Ut labore nisi ut magnam est molestiae reprehenderit. Neque necessitatibus quos est culpa. Necessitatibus quibusdam aut totam ut. Architecto eum impedit molestiae iure rerum. Quas quisquam sint aspernatur delectus excepturi aspernatur assumenda rerum. Vitae in ad aut quisquam consectetur. Minima nemo nostrum ut. Voluptatum et tenetur rerum voluptates.','69111 Treutel Trail\nWillmschester, VT 12810','[\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\"]',13,8,3,42,230,300000.00,NULL,0,2,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.799474','-76.503969',17657,2,2,'RMFNZN'),(18,'2 Floor house in Compound Pejaten Barat Kemang','rent','Voluptate blanditiis occaecati dicta reiciendis et. Est illo et nihil ut aspernatur. Et fugit nulla quasi architecto nam. Qui facere repellat et veniam ut atque rerum.','Ut alias tempore minus eum ullam repellat. Maxime adipisci commodi vel sed qui nisi. Id quisquam et dicta atque quidem hic similique. Quo et animi autem sint voluptatem qui. Consequatur qui consequatur ullam ut vitae quo. Sunt eligendi dolor molestias et sint ut ea. Alias atque sequi quae magni vero quas. Voluptatum dolores sit quia odio quia optio autem. Non voluptatem corrupti at itaque reprehenderit. Perferendis ratione numquam quo hic fuga. Voluptatum neque ea iste sed. Mollitia ipsam ex nemo voluptatum magnam dolores ut.','131 Ryleigh Spur Suite 827\nEast Hilma, ME 78146','[\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\"]',4,4,3,81,420,477500.00,NULL,1,2,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.556711','-76.077025',10798,2,2,'FPFFNB'),(19,'Apartment Muiderstraatweg in Diemen','rent','Autem excepturi mollitia animi id. Fugiat veritatis debitis molestiae voluptatem sunt dolores aliquid.','Sunt magni modi ipsa pariatur sint perferendis tempora. Dolore neque quia culpa aut voluptate in. Minima provident nemo quia in aut aliquam veniam. Non nam error saepe consequatur itaque. Et sapiente voluptatem eum omnis nihil. Qui aperiam voluptate sunt itaque. Illum rerum iure provident culpa aut repellendus voluptas aut. Architecto distinctio voluptatem nesciunt. Doloremque voluptatem in eum. Maxime rem consectetur sint cum.','305 Jacky Junction\nSimeonland, AK 41923','[\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\"]',6,6,1,14,130,517600.00,NULL,0,4,'month','renting',10,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.907282','-75.840171',69821,4,4,'NCLYMA'),(20,'Nice Apartment for rent in Berlin','rent','Et libero quo velit asperiores quo. Omnis eaque quos eum dicta inventore aut culpa aperiam.','Alias quia veniam sunt sunt ipsa dignissimos. Ut aperiam excepturi velit aut sunt. Ipsa ut quasi et autem. Quis et ex odit in quae voluptas. Facilis architecto libero vitae illo dolorem rerum. Repellendus velit praesentium voluptatem sed hic. Molestias ipsa deserunt sit in dolor voluptatem ab. Ipsum fugit iusto et voluptatem ut exercitationem voluptas. Eaque sit perspiciatis consectetur numquam in ipsa illo. Vel eum omnis sed rerum cupiditate. Eos sit est nobis voluptas labore dolores eligendi animi. Culpa iusto rerum voluptates eligendi neque. Quis nihil distinctio magnam dolor.','50452 Damon Union\nLake Dexterside, SC 97876','[\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\"]',18,3,2,78,100,710500.00,NULL,1,2,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.755785','-74.958127',98784,2,2,'AUUNFD'),(21,'Pumpkin Key - Private Island','rent','Maxime cum non aut officiis laudantium aperiam. Accusantium maxime ut rem omnis at. Sed quo aut mollitia quia.','Impedit enim quia iure voluptatem impedit ipsa beatae. Autem quaerat est consequatur earum qui odio. Deleniti suscipit est maiores ut. Laborum aspernatur impedit quae et consectetur assumenda error. Voluptas nihil facilis autem neque dicta nam. Expedita totam sapiente corporis accusamus explicabo dolorem. Aspernatur laboriosam fugiat qui. Iste perspiciatis tempora quia sequi facere. Qui nesciunt quos qui sunt. Architecto aut ducimus ex ut recusandae aut. Illum nihil vel enim et ad est.','7261 Irma Avenue\nAshleymouth, AK 57496','[\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\"]',8,8,10,19,320,980900.00,NULL,0,4,'month','renting',7,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.248867','-74.957219',97437,4,4,'LI5X1Y'),(22,'Maplewood Estates','sale','Illo et deleniti vel voluptates amet ipsum ipsam pariatur. Praesentium magnam tempora provident doloremque. Tempora ut a veritatis sed nihil consequatur neque.','Dolor nihil eaque quia debitis suscipit quia saepe excepturi. Vitae quisquam minima pariatur quo voluptatem ab non. Consequuntur facilis consequuntur temporibus exercitationem quia sunt. Culpa suscipit et facilis ex voluptatem. Non quas dolorem fuga animi consectetur odit. Libero quis nobis blanditiis nihil praesentium ut. Error reiciendis optio iste quis quasi voluptate aut illum. Et numquam et odit qui et magnam in. Id qui laborum eligendi enim. Sunt quae id autem itaque magnam sint ut.','2859 Will Landing Apt. 894\nNatland, MD 48026-8295','[\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\"]',3,5,4,81,580,189100.00,NULL,0,6,'month','selling',1,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.975445','-76.348798',94164,6,6,'ZI0UTM'),(23,'Pine Ridge Manor','sale','Sed repellat reiciendis inventore enim est autem omnis. Ipsa aperiam adipisci sint perspiciatis. Molestiae voluptatem quo ex et aut perspiciatis soluta. Autem culpa iure voluptas animi laudantium.','Qui soluta iure veniam expedita. Repellat consequuntur deserunt quis accusantium. Optio porro molestiae maxime consectetur illo sint velit reiciendis. Earum autem voluptate eveniet architecto rem sunt. Placeat qui in ratione deserunt laudantium et id. Optio aut est quae magnam eius. Adipisci quis libero laboriosam autem sit id. Unde sed quia error tempora esse eveniet.','855 Anastacio Station\nNorth Josephinefurt, UT 69842-5938','[\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/6.jpg\"]',16,9,6,47,680,127600.00,NULL,1,1,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.157873','-75.796799',76087,1,1,'KWH72J'),(24,'Oak Hill Residences','sale','Quo tempore quibusdam doloremque qui qui libero. Inventore et quod voluptatem nostrum. Nihil voluptas iusto nihil.','Fugit excepturi quis dolorem odit et perferendis eius. Beatae occaecati ut eum vel qui necessitatibus. Quasi quo consequatur dolor voluptas est. Aut veniam culpa rerum qui delectus impedit ut. Voluptatem doloribus ex itaque voluptas. Rerum vero voluptatem expedita odio illo ut saepe. Est et consequatur voluptas modi. Qui perspiciatis harum quae tempora eaque eos. Reiciendis beatae illo dolorem quis. Sequi eum laudantium distinctio minus. Iure repellendus assumenda aperiam et ut amet fuga.','80662 Jakayla Trace Suite 237\nWest Lexi, AZ 26552-0276','[\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\"]',6,9,6,63,170,342000.00,NULL,0,5,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.697143','-76.586976',77117,5,5,'PZEAUN'),(25,'Sunnybrook Villas','sale','Est eius ipsa eaque ut neque dolores. Sunt praesentium consequatur aut quisquam adipisci. Consectetur deleniti sit maiores nostrum.','Reiciendis debitis deleniti nostrum exercitationem. Aut veritatis ipsam ut voluptatem. Incidunt ipsa laborum porro doloribus aut sint et. Quo sapiente labore corrupti distinctio vel. Et exercitationem tempore cupiditate neque dolores. Velit nemo quas cupiditate earum. Aut architecto enim quaerat exercitationem inventore. Id consequatur consequatur ut ut voluptatem explicabo consequuntur. Consequatur fugiat et quas beatae qui beatae. Omnis tenetur omnis eius. In veniam repudiandae rerum perferendis perspiciatis officiis consequatur quis. Animi possimus pariatur repellat quos. Aperiam voluptatem hic in rerum aut et. Soluta vitae atque sit non ipsam quo fugiat.','84703 Paige Streets Suite 557\nLake Frederiqueport, GA 22818-0393','[\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\"]',10,8,2,31,460,487800.00,NULL,0,1,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.546003','-76.146073',41008,1,1,'4ZC25U'),(26,'Riverstone Condominiums','rent','Quo praesentium exercitationem est omnis. Odit aliquid et dolorum eum enim repellendus. Nihil voluptatem rem ea voluptatibus fugit est quis. Vel qui alias omnis aut neque soluta adipisci.','Veniam et eius corrupti beatae est et. Consequatur commodi magnam eaque voluptas. Impedit ut fuga enim hic officia. Repudiandae consequatur ullam corporis deserunt maiores non voluptatem. Harum odit mollitia fugiat sed. Nihil nam sequi fugit velit aut. Reprehenderit accusantium eos deserunt non assumenda ut sint. Omnis omnis possimus nostrum praesentium omnis illum. Id sunt explicabo molestiae illo et. Voluptates voluptas inventore et ut sit. Tempore dicta ut officiis non ut qui doloremque. Omnis voluptatem consequatur nemo vitae consequatur inventore sapiente qui.','821 Cortez Throughway Suite 129\nNorth Green, VA 82625','[\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\"]',2,5,8,89,980,367500.00,NULL,0,3,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.692621','-76.591023',90348,3,3,'NV7WQ1'),(27,'Cedar Park Apartments','sale','Omnis quo eveniet esse odio. Accusamus itaque eaque qui incidunt. Assumenda aliquam minus quo quae atque.','In quis ut quisquam molestias nobis sunt laudantium. Nulla iste esse pariatur ipsam perspiciatis perferendis iure. Laudantium enim quae iusto. Amet et aut qui officia. Numquam quo dignissimos porro beatae fuga earum labore quia. Rerum nesciunt nisi ducimus voluptatum error reprehenderit. Voluptatem aut aut atque reprehenderit. Quisquam vitae voluptas tempore quidem aliquam sint recusandae voluptatibus. Voluptas maiores iste libero voluptatibus facere in. Eos a nisi exercitationem laborum possimus. Assumenda quos perspiciatis quod qui sed nam magnam. Ea libero fugit architecto. Dolorem ut consequuntur consequuntur rerum ad adipisci.','92180 Mallory Mountains Apt. 704\nNew Leonelport, NY 40928','[\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\"]',8,6,7,4,950,223600.00,NULL,1,2,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.584949','-75.717878',44111,2,2,'DJXRIO'),(28,'Lakeside Retreat','sale','Nemo error nulla esse aut adipisci exercitationem. Enim beatae ut deserunt. Commodi vel eius nobis sed unde dolores omnis.','Cupiditate aperiam qui iusto amet sunt vel. At libero ducimus sit eos sapiente nihil nostrum necessitatibus. Quia saepe dolorem officiis velit quibusdam porro ut. Ipsa et ullam tempora. Cum autem incidunt et nisi. Et autem fuga omnis esse repudiandae consequatur eius eos. Quasi dicta eum aspernatur in sit sint. Porro consequuntur quia maiores assumenda laudantium quasi. Qui aliquam consequatur corporis accusamus dignissimos. Reprehenderit molestiae officiis et sint. Incidunt nobis nobis id a pariatur recusandae sint. Perferendis maiores vero architecto qui quia. Consequatur molestiae dolorem laborum praesentium et laboriosam recusandae. Voluptatem assumenda rem vel quisquam consequatur non.','8162 Volkman Forest Apt. 156\nChristyburgh, NJ 79836-9242','[\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\"]',17,10,2,9,160,363700.00,NULL,1,3,'month','selling',9,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.974066','-75.563985',28942,3,3,'VTTAAZ'),(29,'Willow Creek Homes','sale','Perspiciatis harum hic est voluptatem magni. Rerum praesentium sit facere ex. Eligendi omnis est dolore accusamus.','Nesciunt nobis dolores pariatur eum omnis est voluptatibus provident. Corrupti qui eos provident aliquid sint. Qui molestias voluptatum minus blanditiis. Deserunt et ipsam in voluptatibus numquam dolor. Est voluptate laborum sint pariatur quod. Aliquid sequi minima et sed minima aut non id. Aut quia magnam rerum praesentium sint beatae. Temporibus ullam corrupti quos nihil animi corporis. Id beatae explicabo nihil at molestiae explicabo. Ab blanditiis optio debitis.','748 Tremblay Meadows Apt. 176\nNew Furmanbury, NY 86190','[\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/2.jpg\"]',1,3,2,69,80,351500.00,NULL,1,5,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.581587','-75.206402',5461,5,5,'PYNPPO'),(30,'Grandview Heights','sale','Sequi dolorum qui est. Repudiandae qui earum provident est ab. Vero nulla ex sed omnis explicabo doloremque quis dicta. Reiciendis neque qui aspernatur explicabo eos velit. Omnis possimus et quo dignissimos at vel.','Aliquam sint tenetur quibusdam eius. Eveniet magnam nemo vero quae. Non dolorem ut et. Laborum est rem corrupti quas et ipsum. Nisi consequatur minima iure. Voluptatibus officiis tempore quia praesentium cum. Soluta est in dolor qui corrupti. Necessitatibus consequatur excepturi quis molestias dolore quam. Sed et totam non maxime cum. Earum dolores itaque reiciendis dolorem enim et. Eum repellendus non et autem. Id nulla aut ut et animi.','2437 Medhurst Rapid\nMohrton, MS 39571','[\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\"]',15,2,1,21,360,556800.00,NULL,0,6,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.895627','-76.425503',20424,6,6,'8HPZDE'),(31,'Forest Glen Cottages','rent','Praesentium mollitia ut vel et sapiente. Omnis odio laudantium consectetur rerum ea. Aut eligendi iste ut laborum.','A velit nam quos dolores. Cumque quos pariatur qui distinctio. Dolor architecto et consectetur. Delectus voluptas perspiciatis esse odit tenetur deleniti. In incidunt qui dolor ut non. Nobis voluptatem nobis ea vero. Eum numquam dolores aut ut iusto soluta praesentium. Assumenda et facilis rem eos. Quia sequi facere quam aut inventore sint ut. Omnis officiis ipsam blanditiis. Voluptatem non est accusamus voluptas et et voluptate. Sunt corrupti atque quaerat nulla saepe.','40095 Deja Mission\nGarlandmouth, WV 11322','[\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\"]',17,7,8,48,930,386600.00,NULL,1,3,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.330042','-74.805711',36217,3,3,'LNHCA6'),(32,'Harborview Towers','sale','Voluptas molestiae ducimus voluptas quia. Aspernatur omnis tempora dolore repudiandae aspernatur doloremque natus cumque. Facilis ut totam facilis sequi dolorem aut magni.','Sed et rerum voluptas quisquam aut. Rem alias qui eius quis eaque omnis id. Nisi deleniti nemo adipisci qui. Nulla incidunt tempore sit reprehenderit. Cum laboriosam facere fugiat rerum consectetur vero et. Ut eligendi vero autem sunt veniam dolorum et in. Ea ut quaerat qui commodi iure vitae aut. Voluptate dolor officia omnis sunt et rerum. Omnis in aut aut quaerat delectus.','649 Kali Stravenue\nPort Kamille, GA 53510','[\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\"]',3,5,1,86,650,654600.00,NULL,0,1,'month','selling',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.357356','-76.504877',93494,1,1,'GBKZFI'),(33,'Meadowlands Estates','sale','Repellendus aut iusto asperiores neque. Doloribus architecto neque recusandae qui esse.','Deserunt laborum ea ut accusamus sit et praesentium. Culpa quasi incidunt ut voluptatem aspernatur voluptate omnis natus. Blanditiis at omnis non expedita. Id vel ut placeat veniam sunt earum. Quia esse blanditiis sit est quia. Praesentium et quod et hic expedita sed iure. Harum mollitia ad consequatur libero laboriosam alias praesentium dolorem. Et sunt aut qui quaerat. Autem asperiores libero quia quia.','68717 Ratke Cove\nBaileyville, FL 70650-6240','[\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\"]',7,1,3,10,310,785000.00,NULL,0,5,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.980935','-75.476222',30196,5,5,'8XNZAV'),(34,'Highland Meadows','sale','Eum maxime alias unde placeat quia voluptatibus. Illum et omnis voluptatem. Repellat ut quia corporis non quam eveniet. Recusandae et error veniam quo facere dolorem. Repudiandae officiis blanditiis necessitatibus ab ipsa veritatis.','Vitae ratione accusantium atque quis sapiente. Quae eveniet et sit error similique. Atque labore ab reiciendis eos quia. Accusantium sit beatae esse qui omnis aut sit. Animi rerum doloribus tempora. Tempora ipsum reiciendis maiores error. Est dolorum laudantium fuga voluptatem. Recusandae unde repellat numquam tempora voluptatibus. Esse ut est nulla quis provident placeat maiores.','4912 Fannie Village Apt. 038\nRoobbury, FL 20361-3296','[\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\"]',10,9,2,17,150,679600.00,NULL,1,4,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.091547','-75.466449',66880,4,4,'PBMJNH'),(35,'Brookfield Gardens','sale','Harum rerum vel nesciunt doloremque voluptatem ullam facilis. Error cum unde error libero nostrum. Ut sunt quae voluptates qui nesciunt voluptates. Animi aut aperiam dignissimos quasi nisi.','Voluptas doloribus autem consequatur tempore fugit. Et eos explicabo et repellat ut. Cum omnis ut rerum aliquam. Voluptatum consectetur fugit sit quos animi libero. Dolorum totam fugiat modi quam non aliquam voluptas libero. Aut illo labore repudiandae fugit voluptatem. Autem minima magni iusto. Sed suscipit deserunt laborum debitis quia harum. Maxime totam ipsum itaque ipsum vero dolores. Inventore mollitia amet dolores. Minus in aut voluptatibus vel. Debitis dolor quae temporibus quis ipsum ipsa tempore.','211 Ledner Summit\nBashirianberg, NY 06357','[\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\"]',9,3,5,82,40,203000.00,NULL,1,5,'month','selling',10,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.67779','-75.341065',33503,5,5,'P8FP83'),(36,'Silverwood Villas','sale','Ratione quidem eaque nobis modi quia id. Id vero molestiae tenetur vitae dolor non. Earum enim et doloribus quia veritatis suscipit. Non velit dignissimos ea consequatur quo.','Consectetur odio quam quo voluptas autem. Ducimus veritatis ut qui facilis. Deserunt quasi et aut ut fugit voluptatem et. Eaque pariatur est quia saepe. Repudiandae sunt dolorum eos facere et quia. Nulla reiciendis ex nihil et maxime labore totam. Molestiae eaque cupiditate quis aspernatur. Corporis consequatur consequatur illum sunt quisquam. Vel excepturi et suscipit dolor id rerum dolorum vel. Laudantium corrupti enim excepturi quod corporis accusamus ut. Quasi magnam et iure alias.','344 Carmen Shoals Apt. 784\nLake Haylee, ND 74383-6538','[\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\"]',8,4,3,70,320,193100.00,NULL,0,1,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.812545','-75.711218',1226,1,1,'ULG4SH'),(37,'Evergreen Terrace','sale','Magni rem non ullam voluptatum. Sit minus excepturi quia possimus est et molestias. Corporis fuga quia omnis culpa amet. Quia provident optio optio quibusdam.','Rerum dolorum in quidem doloribus consequatur. Omnis labore voluptatem laudantium dolores at dolorum quidem. Distinctio consequatur itaque asperiores est omnis voluptatibus. Maxime ut qui rem. Odio aut et provident ut. Et minima voluptatibus maiores ratione voluptatum et. Quia ratione aut accusamus nesciunt rerum. Sed possimus voluptas ducimus quasi nihil est quibusdam accusamus. Tempora expedita est modi doloremque. Aut totam reprehenderit accusamus dolorem vero eos vitae.','1171 Reichert Avenue Suite 943\nCaspermouth, NY 12709-0097','[\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\"]',8,10,1,85,560,835200.00,NULL,0,1,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.749037','-75.350507',12511,1,1,'L4H21U'),(38,'Golden Gate Residences','rent','Qui totam vel sunt autem doloribus. In cupiditate iusto eveniet ratione. Temporibus aperiam omnis et qui voluptatem qui recusandae. Voluptatem quia asperiores voluptas quis deleniti enim vitae quis. Necessitatibus architecto molestiae quis facere reprehenderit id.','Voluptas corporis eius facere. Rerum rerum id earum et. Fugiat ut laboriosam quos rem. Et ut iure sunt quia non quia consequatur. Ad deserunt amet nihil repellendus sed minima voluptas. Quaerat aliquid ut incidunt sit numquam qui. Tenetur laudantium quae minus et quidem. Laudantium rerum quaerat quibusdam sed doloremque et. Dignissimos officia qui molestiae quas deleniti impedit. Ad odio voluptatibus reprehenderit quas molestias.','56936 Mraz Alley\nJohnpaulton, CA 20740','[\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\"]',11,10,2,59,140,400600.00,NULL,0,1,'month','renting',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.579668','-75.622046',39896,1,1,'YGQXLU'),(39,'Spring Blossom Park','rent','Voluptas autem reprehenderit quos. Dolores magni et at quia minus nisi. Excepturi fugit eligendi odio veritatis officia.','Omnis quia vel sunt quis. Maxime laborum ut quisquam impedit tempore. Eos cum qui et eveniet optio ut voluptas. Porro corrupti culpa et velit aliquid quis debitis. Rerum autem sunt ipsum aliquid reprehenderit sed quam animi. Aut rerum dolorum quidem. Qui quo modi odio et recusandae molestias sint. Beatae iure aut labore molestiae. Qui ut iure recusandae itaque aut commodi nemo perferendis. Et accusantium consectetur aliquid error. Id accusamus fugit repudiandae repellendus nostrum repellendus repudiandae. Nobis ut aut a facere non. Ut at saepe et odio dolor.','9932 Kerluke Extensions Apt. 438\nJustonchester, AL 57705','[\"properties\\/11.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\"]',13,10,9,57,800,985300.00,NULL,1,5,'month','renting',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.623948','-75.67762',6148,5,5,'ZPG2LI'),(40,'Horizon Pointe','rent','Vitae deleniti aliquid qui ducimus sit. Blanditiis consequatur necessitatibus error velit. Voluptas culpa similique amet impedit sed ut doloremque. Id vel quo soluta et repudiandae.','Quo maxime possimus corporis vel. Architecto ea ab repudiandae cum. Pariatur amet et sit. Possimus in incidunt quaerat sint ab ratione qui. Quod deserunt expedita in. Architecto tempora aut illum tempora delectus. Quaerat blanditiis accusantium error ut aspernatur.','5823 Albertha Lane\nTownestad, WA 18872','[\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/5.jpg\"]',16,9,6,89,160,964700.00,NULL,1,2,'month','renting',1,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.79131','-75.357635',29094,2,2,'LUTO5J'),(41,'Whispering Pines Lodge','rent','Qui sed molestiae mollitia ut mollitia. Velit qui expedita odit. Velit fugit aut expedita omnis ut.','Tempora et deleniti aut fugiat est unde. Dolore ut aut corporis natus. Eos qui ut ea. Omnis at laudantium modi officiis similique porro. Cumque unde esse et dicta est quaerat. Eligendi est dolorem non ab nobis possimus. Labore accusantium autem odit quis consequatur. Inventore rerum qui assumenda. Sed quos recusandae necessitatibus iusto reprehenderit quibusdam molestiae.','50296 Gerda Springs\nSouth Westley, OR 51141-8983','[\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\"]',15,1,6,67,220,529900.00,NULL,1,5,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.215368','-75.149602',40666,5,5,'72NTRK'),(42,'Sunset Ridge','rent','Et sequi et labore provident. Quidem cupiditate eos consequatur voluptates earum qui aut. Exercitationem nostrum beatae neque.','Voluptas earum dolores ad aut consequatur. Facere officiis temporibus at eligendi. Suscipit quia tempore modi hic. Laudantium est nobis ea aut ut. Enim tempore aliquam ut eaque rerum. Vero velit repellendus atque ut natus nulla numquam. Quos repellat placeat suscipit doloremque. Rerum est cumque amet in alias aut. Fugit voluptatem ratione qui et hic.','3260 Rau Forge Apt. 136\nFlatleyville, UT 05498','[\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\"]',6,5,5,51,300,551300.00,NULL,1,3,'month','renting',12,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.823391','-75.895069',35900,3,3,'9VYYKM'),(43,'Timberline Estates','rent','Est aspernatur ipsam molestias assumenda error eos natus ut. Consequuntur architecto assumenda dolore inventore ut nihil esse culpa. Aut a aut est molestiae cumque qui consequatur.','Labore impedit explicabo rem voluptate et voluptatibus pariatur. Nostrum et qui sit magni in. Eos sapiente in deleniti tempora laboriosam vero nisi. Nostrum saepe sed iste harum incidunt vel sequi. Iure repellendus iusto consequuntur cum nihil et consequatur voluptas. At nam qui est omnis distinctio qui similique eaque. Eius nobis cumque et ipsum. Doloremque eum et voluptates excepturi libero beatae. Necessitatibus delectus natus enim est dolorum porro qui. Atque eveniet quis magni doloremque. Commodi animi et consequatur velit.','639 Gerlach Light Apt. 227\nEast Clarabelleside, CT 72670','[\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\"]',13,5,4,86,580,474300.00,NULL,0,5,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.619598','-76.072846',72318,5,5,'MZDFWK'),(44,'Crystal Lake Condos','rent','Doloremque distinctio culpa quaerat hic qui. Enim qui quos consequatur unde ea dicta voluptas enim. Debitis commodi ipsa non ut eaque voluptatem esse. Dolore incidunt eaque voluptatem.','Mollitia doloribus voluptas vero tempore iste iure quia. Animi praesentium error doloribus. Non quae architecto iusto qui ut molestiae iste repellendus. Debitis itaque maxime ut maxime. Enim sapiente cupiditate dolores porro perspiciatis velit nemo. Excepturi nam sit inventore dicta saepe vero. Est eaque omnis veniam repellendus delectus consequatur ad. Est eius voluptatem accusamus non eaque est sunt. Nobis nisi aut voluptatum et sed. Quibusdam quod magni rerum dolores dolor iusto. Beatae inventore rem iure non est vel recusandae.','5818 Fritsch Meadow\nIanhaven, WI 09522','[\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/2.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\"]',14,8,9,29,260,147200.00,NULL,1,3,'month','renting',5,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.220372','-74.988823',55603,3,3,'LCMHTB'),(45,'Briarwood Apartments','sale','Cumque omnis maiores fugiat eos at. Iusto dolores et eum labore illo ipsa temporibus. Officia iusto illum et. Culpa dolores qui atque.','Veniam impedit rem quod quisquam accusantium aperiam minima. Esse iusto est dolor quasi autem. Consectetur non quae assumenda aspernatur impedit. Laborum facere sint ut. Laboriosam voluptates iusto voluptatibus eos. Maxime enim delectus rerum ut. Ex aspernatur velit beatae quisquam.','540 Adela Roads\nWest Laurianneshire, WY 81770','[\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\"]',10,8,4,1,440,256900.00,NULL,0,2,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.114722','-76.602878',74446,2,2,'X3EETA'),(46,'Summit View','sale','Quisquam qui aliquam nesciunt est velit provident commodi. Autem adipisci perferendis voluptas voluptatem corporis praesentium voluptate.','Repudiandae rerum qui qui accusamus necessitatibus molestiae. Qui ut consequatur fuga omnis eligendi recusandae officiis. Tempore laudantium cumque vel. Quia reprehenderit saepe est eius voluptates. Rerum et sapiente et voluptatem voluptatibus ea quas. Voluptatem esse perferendis necessitatibus nam recusandae. Sit laboriosam similique voluptate. Voluptas molestiae vitae tempora ut. Aut recusandae architecto quaerat doloremque. Eos debitis et alias quaerat ut eum. Consequuntur nulla possimus reiciendis voluptate labore deleniti debitis. Unde voluptatem provident quo laborum.','846 Bashirian Villages Suite 015\nSouth Charley, LA 58847','[\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\"]',2,7,1,9,210,381900.00,NULL,1,2,'month','selling',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.709023','-76.07637',65142,2,2,'DPSZLS'),(47,'Elmwood Park','sale','Voluptatem quisquam laudantium deserunt aliquam sit fugiat et. Velit nemo corporis beatae illo consequatur. Voluptatibus eligendi blanditiis reprehenderit libero. Dolores aut omnis minus soluta soluta est perferendis vel.','Aut tenetur quibusdam sit harum. Ducimus ex voluptatem ea quo quis nemo rerum non. Ipsa vel at est eveniet. Numquam ad aliquid iste est quia. Suscipit nihil est quod fuga laudantium qui provident consequatur. Iure incidunt occaecati soluta delectus in pariatur. Non reprehenderit sed aut. Quas autem placeat a repellat temporibus sequi quaerat eaque.','650 Douglas Knolls Suite 045\nKuhlmanmouth, FL 07424-6474','[\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/2.jpg\"]',15,1,10,86,1000,837400.00,NULL,1,4,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.929431','-76.166585',60468,4,4,'LQDOIM'),(48,'Stonegate Homes','rent','Eos voluptas dolores eos consequatur impedit voluptatibus dolorem. Enim accusamus qui in labore officia quibusdam. Ipsa consequatur impedit aut sapiente.','Atque aspernatur minus minima et mollitia voluptate. Qui voluptatem rerum consectetur iure quo. Dolorem hic qui aut fuga vel rem rerum quo. Aut nam hic tenetur. Aspernatur sit qui ducimus laborum. Enim omnis eaque sapiente sed. Explicabo et dolor soluta ut aut quis. Voluptates vitae et et itaque aut. Minima accusantium facere enim vero deserunt non. Tempora voluptate ea nemo sint optio sit. Est autem id ducimus itaque quidem aliquid. Qui maiores nemo accusamus repudiandae harum.','7169 Harris Causeway\nPort Emanuelborough, TX 25219','[\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\"]',11,2,9,44,60,755500.00,NULL,1,2,'month','renting',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.004296','-75.704723',64058,2,2,'G5EJPR'),(49,'Rosewood Villas','rent','Voluptatum sit culpa deserunt non quidem iure est. Deleniti dolorem ipsam sed itaque. Temporibus deserunt et rerum dolorum repudiandae numquam beatae. Cum sint temporibus fugit. Sint autem sed necessitatibus accusantium laborum.','Placeat quae non eum consectetur. Ipsum qui et porro molestiae sunt assumenda rem. Reiciendis inventore delectus cupiditate provident nam. Aliquam fugiat enim ea facere fuga. Praesentium laboriosam omnis itaque a quasi quis. Nam dolorem molestiae eos deleniti at. Iste et nihil facere a sed delectus. Voluptates laborum ipsam est quo. Adipisci consectetur suscipit error minus aliquam. Sapiente quam labore aut dicta dicta. Officia harum quaerat sed ipsa quia. Et adipisci consequatur qui accusantium fugit perferendis.','9184 Morar Rue Suite 576\nPort Teresamouth, AR 79273','[\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/3.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\"]',3,2,2,53,520,798800.00,NULL,1,3,'month','renting',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.898662','-74.920132',77803,3,3,'I4U4JA'),(50,'Prairie Meadows','rent','Soluta eum harum corrupti. Error iusto dignissimos qui. Officiis et est molestiae qui neque. Modi voluptates et unde modi fugit dolorem ut illo.','Et est et et quis at dolorem mollitia. Consequatur unde officia eum voluptatem eos. Minus quo distinctio soluta fuga ut eligendi. Ut ducimus veniam saepe eius rerum eum. Ducimus qui consequuntur ut quisquam dolor. Quae eaque autem id sunt eum in omnis. Temporibus perferendis rerum quia non. Consequatur et explicabo excepturi facere odit. Quis quaerat et unde inventore ut. Nam id aut aut aliquam molestias quaerat.','3643 Veum Viaduct\nWest Jaceybury, AZ 35643','[\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\"]',16,8,1,17,350,417200.00,NULL,0,6,'month','renting',3,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.589295','-76.133005',87108,6,6,'BC447T'),(51,'Hawthorne Heights','sale','Enim ut eveniet corrupti. Perspiciatis sed sit laboriosam alias. Architecto quod molestias deserunt sit totam omnis non vero. Quas vel omnis sed ut nostrum id.','Qui ut totam consequuntur. Delectus magnam magni rerum ipsam tenetur. Consectetur sint natus minus officia deleniti porro sint. Tempora dolor voluptatem sequi quia. Pariatur facilis molestias repellat optio blanditiis et. Laboriosam consequuntur consequatur tempore sint beatae sunt. Sunt aut facilis cupiditate neque quibusdam. Quia sit alias velit porro. Hic distinctio aperiam impedit assumenda pariatur. Magnam in reiciendis voluptatibus eos excepturi. Optio amet laudantium dolorem excepturi in et. Consequatur laborum assumenda quo saepe. Tempora tempora optio corrupti excepturi.','7232 Stoltenberg Crossing Suite 640\nMaggioburgh, KS 60960','[\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\"]',16,8,6,78,860,699700.00,NULL,1,4,'month','selling',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.878741','-76.262734',65505,4,4,'DXP39U'),(52,'Sierra Vista','rent','Totam error sed optio quasi et ducimus. Repellendus repudiandae exercitationem earum pariatur itaque debitis dolor quas. Est corporis non necessitatibus voluptatem officiis repudiandae at. Consequatur impedit corrupti inventore facilis dolor magni.','Labore dicta sint ab id tempore cupiditate dolore. Nemo repudiandae consequuntur quis sunt necessitatibus mollitia. Ea impedit omnis dolorem dolor rerum enim. Tempore ea suscipit iste sunt. Est expedita corporis omnis reiciendis reiciendis qui. Impedit ut voluptatem at harum et dolore. Voluptas distinctio qui explicabo. Eligendi dignissimos adipisci sed quas. Nam voluptate sint iste harum rerum ut. Et perspiciatis quibusdam rem alias aut quam. Totam perspiciatis soluta ducimus et. Illo dolor dolore voluptate officia voluptatem. Vel fugiat quidem voluptatem.','53365 Skiles Street Apt. 404\nSteubershire, CA 68514','[\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\"]',16,5,3,48,670,73200.00,NULL,0,6,'month','renting',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.603385','-76.26598',76743,6,6,'8ZDOFT'),(53,'Autumn Leaves','sale','Id omnis voluptatum sequi recusandae occaecati consequatur. Voluptates nesciunt magnam amet et consectetur. Ratione molestias vitae voluptatem totam. Optio modi suscipit aut aut quas architecto hic. Dolor enim voluptatibus laborum.','Commodi totam voluptatibus et autem. Ut quo odit amet ut earum aliquid id. Impedit necessitatibus eligendi quis porro ullam. Reiciendis eos officiis cumque ut. Delectus dolores qui voluptas odio officia provident magnam. Quaerat molestiae quasi repellendus cum ratione delectus consequuntur occaecati. Sint et aspernatur officia voluptatibus officiis aut quod. Mollitia sit quia voluptas iste. Unde optio assumenda sed sed. Fugit voluptas amet harum maxime expedita. Molestias iste totam consequatur ullam.','820 Monahan Route Suite 118\nWest Barrett, IL 18453','[\"properties\\/10.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\"]',16,4,1,92,340,171300.00,NULL,0,4,'month','selling',3,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.452482','-75.335667',96386,4,4,'RCIRYQ'),(54,'Blue Sky Residences','sale','Laudantium id illum officiis odio hic voluptatem id impedit. Voluptate est corporis aliquid eius error odit. Eligendi sit doloribus est aut dolorum.','Aut eum dolor ut dicta ducimus provident. Laborum numquam libero quae est dignissimos repudiandae. Tempora aut laudantium unde rem aut eum. Expedita aut aspernatur et et. Nisi itaque totam dolores enim possimus fugiat. Quia quaerat ipsam ad repellat. Ut harum ipsa veniam. Eligendi architecto omnis sequi eveniet et reprehenderit repellat. Aut qui quod et vero voluptate. Eum incidunt vero iste sed in eos.','946 Talia Wells Suite 805\nWest Napoleon, VA 07169','[\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/4.jpg\"]',15,4,5,26,470,216300.00,NULL,0,1,'month','selling',10,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.073273','-76.675298',55261,1,1,'MDNPHC'),(55,'Pebble Creek','rent','Aut corporis eum sint velit minus. Earum eius nihil nisi quas ut saepe. Vel mollitia corrupti illo accusamus. Excepturi tenetur ut beatae. Dolorem quo voluptas voluptas voluptatem consequatur.','Inventore eos ad ipsum itaque eligendi sed inventore. Accusantium dolor molestiae culpa in et. Blanditiis dolor sit blanditiis pariatur ratione quibusdam. Dolorum est eos saepe velit. Qui autem quasi corporis ratione dolor consequatur magni velit. Accusantium animi atque reprehenderit officiis iusto sint quo. Ut aperiam dolores officia consequatur aspernatur maxime. Eligendi praesentium pariatur odio placeat.','373 Kozey Mission Apt. 905\nLake Burnicemouth, VA 05440-6107','[\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\"]',11,7,3,25,740,42500.00,NULL,0,6,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.063465','-75.37901',65512,6,6,'SAJSN5'),(56,'Magnolia Manor','rent','Aut quis dolores incidunt repellendus qui ut qui dolores. Non nam provident iure et id. Molestiae et aperiam accusamus dolores.','Earum quaerat tempore est est eos. Labore rerum omnis et ex voluptatibus. Praesentium cupiditate doloribus quo repellat enim exercitationem ipsa. Sit aliquid quia dolor ut dicta debitis. Atque quia reprehenderit eaque possimus consectetur. Quaerat harum est temporibus inventore. Sunt porro ut aut recusandae dolores ex porro. Non minima voluptas quia ratione qui et deleniti. Inventore nobis illo nulla sit est cum exercitationem. Et hic officia soluta minus est. Inventore architecto nihil iusto labore qui aliquam eum sit.','3258 Wanda Prairie\nKutchmouth, DE 13504-4552','[\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\"]',7,2,1,95,260,122000.00,NULL,0,6,'month','renting',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','43.619599','-76.237459',24313,6,6,'WEYIF4'),(57,'Cherry Blossom Estates','sale','Fugiat exercitationem doloremque dolores ea autem consequatur sunt. Soluta et est odio dolorem officia qui. Ut dolorem officia laboriosam et pariatur nesciunt inventore.','Nobis quis voluptatem blanditiis sed nihil et tempore. Voluptate ipsa aut ex ut. Error non dolores enim pariatur incidunt. Nostrum optio quis omnis sit. Quas nam alias dolores maxime quaerat aliquam. Molestias suscipit omnis est necessitatibus. Sapiente sed quaerat nostrum. Autem itaque nobis omnis dolorem molestias. Aliquam quia voluptas non excepturi. Necessitatibus vitae ullam amet debitis.','54477 Neoma Field\nMarcelluschester, GA 25058','[\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\"]',7,9,4,79,540,562400.00,NULL,0,6,'month','selling',8,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.938554','-76.056443',48815,6,6,'OLJVHY'),(58,'Windsor Park','sale','Quia suscipit in a totam. Quasi non omnis qui velit. Nesciunt labore dolore asperiores eum voluptas repellat amet.','Rem consectetur repellendus expedita et saepe. Distinctio minus quasi quia eum est optio voluptas. Aliquid aspernatur aut est magnam. Laborum nisi aut fugit excepturi omnis qui. Distinctio nihil nostrum quae provident quaerat. Nulla earum laboriosam laudantium et. Non labore consequatur est dolor odit dolor. Distinctio saepe numquam quidem est dolore dolores molestias eos. Ut consequatur voluptate repellendus cumque similique autem ut. Qui rerum atque et facilis consequuntur sequi aut. Nostrum ad rerum autem quis omnis.','13259 Jena Estates Apt. 396\nCassinport, KS 23914','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\"]',16,10,5,49,390,348700.00,NULL,1,5,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.902086','-74.793143',41071,5,5,'JTQ1KT'),(59,'Seaside Villas','rent','Sequi deleniti expedita quia nihil. Quod vel minus ea. Deserunt non error occaecati ea enim officiis distinctio.','Dolore sit voluptatem et sed non vitae quia. Recusandae accusamus et deleniti in tempore tempore. Quia qui nihil quo aut exercitationem amet sit quibusdam. Id sed ut impedit magni libero fugiat alias. Molestias quia voluptates quia doloremque atque ratione. Omnis itaque dolores voluptatum doloribus dolor repudiandae. Enim totam perferendis consectetur qui.','1897 Delilah Landing Apt. 507\nLuettgenborough, WI 75132-0209','[\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\"]',14,7,2,62,700,590900.00,NULL,0,4,'month','renting',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.71682','-75.27899',27599,4,4,'PKJASV'),(60,'Mountain View Retreat','sale','Odio voluptatum itaque enim dolorum velit quia. Et ea laborum nam praesentium impedit excepturi eius recusandae. Nihil vel aut reiciendis nam quos necessitatibus minus.','Labore culpa iste unde veritatis qui incidunt tempore. Officiis similique sit quia dolores earum. Labore qui harum ea. Vero est eius ducimus quae iure tenetur qui. Possimus dolore aut officia dolorem in nostrum. Rem quia autem quia voluptatibus sapiente. Incidunt quisquam quas odio accusamus libero repudiandae fugit odit. Odit molestias et rerum dolorem aperiam. Consectetur nisi nam error sunt dolor debitis fugiat.','63387 Laurence Lodge Apt. 209\nEast Samanthaview, SC 67026-5395','[\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\"]',10,10,7,5,370,296200.00,NULL,1,5,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.630613','-76.672021',65211,5,5,'301F2I'),(61,'Amberwood Apartments','sale','Libero hic nesciunt molestias est placeat eos ut. Dignissimos voluptas velit facilis eos non et qui. Ea voluptatem modi aperiam qui et.','Odit id et eligendi quisquam necessitatibus et. Alias molestiae pariatur nihil consequuntur aut nostrum unde dignissimos. Id porro et aliquam voluptatem autem. Et ratione optio et incidunt. Omnis nihil quisquam consequatur est voluptas et porro. Error eaque perspiciatis dolore ratione perferendis. Facere adipisci facere quia optio est.','735 Andrew Vista\nO\'Connerfurt, KS 74749','[\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\"]',8,9,2,79,860,456900.00,NULL,0,2,'month','selling',5,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-06-27 00:25:19','2024-06-27 00:25:19','42.843062','-75.980523',97003,2,2,'B805ZL');
/*!40000 ALTER TABLE `re_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties_translations`
--

DROP TABLE IF EXISTS `re_properties_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_properties_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_property_categories` (
  `property_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`property_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_categories`
--

LOCK TABLES `re_property_categories` WRITE;
/*!40000 ALTER TABLE `re_property_categories` DISABLE KEYS */;
INSERT INTO `re_property_categories` VALUES (1,5),(2,2),(3,1),(4,3),(4,4),(4,6),(5,1),(5,3),(6,3),(7,1),(7,3),(8,4),(9,1),(9,2),(9,5),(10,2),(10,5),(10,6),(11,4),(11,5),(11,6),(12,3),(13,5),(14,1),(14,5),(15,1),(15,3),(15,6),(16,1),(16,3),(17,3),(17,4),(18,4),(18,6),(19,2),(19,6),(20,1),(20,2),(21,1),(21,3),(21,5),(22,3),(23,5),(24,2),(24,4),(25,1),(25,3),(25,4),(26,2),(26,5),(26,6),(27,2),(27,6),(28,1),(28,2),(29,3),(30,2),(30,6),(31,3),(31,4),(32,2),(33,1),(33,2),(34,2),(34,6),(35,3),(36,1),(36,4),(36,5),(37,2),(37,5),(37,6),(38,4),(38,5),(38,6),(39,5),(40,2),(41,5),(42,5),(43,1),(43,3),(44,2),(44,3),(45,2),(45,4),(46,1),(46,2),(46,4),(47,1),(48,2),(48,5),(48,6),(49,3),(50,1),(50,2),(50,5),(51,6),(52,1),(53,1),(53,4),(54,4),(54,5),(55,1),(55,2),(55,6),(56,6),(57,5),(57,6),(58,3),(58,5),(59,1),(59,4),(60,3),(61,5),(61,6);
/*!40000 ALTER TABLE `re_property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_features`
--

DROP TABLE IF EXISTS `re_property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_property_features` (
  `property_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_features`
--

LOCK TABLES `re_property_features` WRITE;
/*!40000 ALTER TABLE `re_property_features` DISABLE KEYS */;
INSERT INTO `re_property_features` VALUES (1,1),(1,2),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(3,2),(3,3),(3,4),(3,5),(3,6),(4,1),(4,2),(4,4),(4,6),(4,8),(4,9),(4,10),(4,11),(5,1),(5,2),(5,3),(5,4),(5,7),(5,8),(5,9),(5,10),(5,11),(6,2),(6,3),(6,8),(6,9),(7,1),(7,2),(7,3),(7,5),(7,7),(7,8),(7,9),(7,10),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(9,1),(9,3),(9,4),(9,5),(9,6),(9,8),(9,10),(9,12),(10,1),(10,2),(10,3),(10,4),(10,5),(10,8),(10,9),(10,10),(10,12),(11,1),(11,2),(11,4),(11,6),(11,7),(11,8),(11,9),(11,10),(11,11),(11,12),(12,1),(12,2),(12,3),(12,6),(12,7),(12,8),(12,10),(12,11),(12,12),(13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),(13,8),(13,9),(13,10),(13,11),(13,12),(14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,8),(14,9),(14,10),(14,11),(14,12),(15,1),(15,8),(15,9),(15,10),(15,12),(16,2),(16,3),(16,6),(16,7),(16,9),(16,11),(16,12),(17,2),(17,5),(17,7),(17,10),(18,2),(18,3),(18,5),(18,6),(18,7),(18,9),(18,10),(18,11),(18,12),(19,1),(19,3),(19,5),(19,6),(19,7),(19,8),(19,9),(19,10),(19,11),(19,12),(20,1),(20,5),(20,6),(20,7),(20,9),(20,10),(20,12),(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(21,9),(21,10),(21,11),(21,12),(22,2),(22,3),(22,4),(22,5),(22,8),(22,10),(22,11),(22,12),(23,1),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),(23,8),(23,9),(23,10),(23,11),(23,12),(24,2),(24,3),(24,6),(24,7),(24,8),(24,9),(24,10),(24,11),(24,12),(25,1),(25,3),(25,4),(25,6),(25,9),(25,10),(25,12),(26,2),(26,3),(26,4),(26,5),(26,7),(26,8),(26,10),(26,11),(27,2),(27,5),(27,9),(27,10),(27,12),(28,1),(28,2),(28,3),(28,4),(28,6),(28,8),(28,10),(28,11),(28,12),(29,1),(29,2),(29,3),(29,4),(29,6),(29,8),(29,9),(29,10),(29,11),(29,12),(30,1),(30,2),(30,3),(30,4),(30,5),(30,7),(30,8),(30,9),(31,2),(31,4),(31,5),(31,8),(31,11),(31,12),(32,1),(32,2),(32,3),(32,4),(32,5),(32,6),(32,7),(32,10),(32,12),(33,2),(33,5),(33,6),(33,7),(33,11),(34,2),(34,3),(34,4),(34,5),(34,6),(34,7),(34,8),(34,10),(34,11),(34,12),(35,1),(35,2),(35,3),(35,4),(35,6),(35,7),(35,8),(35,9),(35,10),(35,12),(36,3),(36,9),(36,10),(36,11),(36,12),(37,1),(37,3),(37,4),(37,5),(37,7),(37,8),(37,11),(38,1),(38,2),(38,3),(38,4),(38,5),(38,6),(38,9),(38,10),(38,11),(38,12),(39,1),(39,3),(39,5),(39,7),(39,8),(39,12),(40,1),(40,5),(40,8),(40,11),(40,12),(41,1),(41,2),(41,3),(41,4),(41,7),(41,8),(41,9),(41,11),(41,12),(42,1),(42,3),(42,11),(42,12),(43,3),(43,5),(43,7),(43,9),(43,11),(43,12),(44,1),(44,2),(44,3),(44,4),(44,5),(44,6),(44,8),(44,9),(44,10),(44,11),(44,12),(45,1),(45,2),(45,3),(45,4),(45,5),(45,6),(45,7),(45,8),(45,9),(45,10),(45,11),(45,12),(46,1),(46,2),(46,3),(46,4),(46,5),(46,6),(46,7),(46,9),(46,10),(46,11),(46,12),(47,1),(47,2),(47,5),(47,6),(47,7),(47,8),(47,9),(47,10),(47,11),(47,12),(48,4),(48,7),(48,11),(48,12),(49,1),(49,2),(49,3),(49,4),(49,5),(49,6),(49,7),(49,8),(49,9),(49,10),(49,11),(50,1),(50,2),(50,4),(50,5),(50,6),(50,7),(50,8),(50,9),(50,10),(50,11),(50,12),(51,2),(51,5),(51,6),(51,8),(51,9),(52,1),(52,2),(52,3),(52,4),(52,5),(52,7),(52,8),(52,9),(52,10),(52,11),(52,12),(53,1),(53,2),(53,4),(53,8),(53,10),(54,1),(54,3),(54,4),(54,5),(54,6),(54,7),(54,8),(54,9),(54,11),(55,4),(55,6),(55,7),(55,9),(56,1),(56,2),(56,3),(56,5),(56,6),(56,7),(56,8),(56,9),(56,10),(56,11),(56,12),(57,1),(57,2),(57,3),(57,4),(57,5),(57,6),(57,7),(57,9),(57,11),(57,12),(58,1),(58,2),(58,3),(58,4),(58,5),(58,6),(58,7),(58,8),(58,9),(58,10),(58,11),(58,12),(59,1),(59,2),(59,3),(59,5),(59,10),(59,12),(60,1),(60,8),(60,9),(60,11),(61,1),(61,3),(61,7),(61,9),(61,12);
/*!40000 ALTER TABLE `re_property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_reviews`
--

DROP TABLE IF EXISTS `re_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `re_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_reviews`
--

LOCK TABLES `re_reviews` WRITE;
/*!40000 ALTER TABLE `re_reviews` DISABLE KEYS */;
INSERT INTO `re_reviews` VALUES (1,3,'Botble\\RealEstate\\Models\\Property',19,1,'Alice had been broken to pieces. \'Please, then,\' said the Dormouse: \'not in that soup!\' Alice said to herself, being rather proud of it: for she thought, \'and hand round the rosetree; for, you see, as well as pigs, and was just saying to her.','approved','2024-06-19 00:25:24','2024-06-27 00:25:24'),(2,6,'Botble\\RealEstate\\Models\\Project',12,3,'Duchess by this time.) \'You\'re nothing but the three were all locked; and when she noticed a.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(3,3,'Botble\\RealEstate\\Models\\Property',61,5,'CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, with a large canvas bag, which tied up at the flowers and the two creatures, who had got to grow here,\' said the Queen. \'Well.','approved','2024-03-22 00:25:24','2024-06-27 00:25:24'),(4,4,'Botble\\RealEstate\\Models\\Project',18,1,'PROVES his guilt,\' said the Mock Turtle sang this, very slowly and.','approved','2024-05-28 00:25:24','2024-06-27 00:25:24'),(5,12,'Botble\\RealEstate\\Models\\Property',1,1,'Queen. \'It proves nothing of the house before she got to the Hatter. He came in sight of the others looked round also, and all would change (she knew) to the whiting,\' said Alice, \'how am I to do?\' said Alice. \'Off with their heads.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(6,10,'Botble\\RealEstate\\Models\\Project',6,1,'It sounded an excellent opportunity for showing off a bit hurt, and she told her sister, as well to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it had struck her foot! She was walking by.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(7,9,'Botble\\RealEstate\\Models\\Property',51,4,'Alice. \'I\'ve so often read in the back. However, it was very nearly in the middle. Alice kept.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(8,6,'Botble\\RealEstate\\Models\\Project',5,1,'And yet I wish you would seem to put everything upon Bill! I wouldn\'t say anything about it, so she bore it as well to say it over) \'--yes, that\'s about the right word) \'--but I shall only look up in a low voice, \'Your Majesty must cross-examine the next question is, what did.','approved','2024-03-03 00:25:24','2024-06-27 00:25:24'),(9,12,'Botble\\RealEstate\\Models\\Property',2,1,'King hastily said, and went on: \'But why did they live on?\' said the King: \'however, it may kiss my hand if it had lost something; and she sat still and said to the Queen. \'Well, I shan\'t go, at any rate I\'ll never go THERE again!\' said.','approved','2024-04-20 00:25:24','2024-06-27 00:25:24'),(10,6,'Botble\\RealEstate\\Models\\Project',18,3,'MINE.\' The Queen had never done such a puzzled expression that she still held the pieces of mushroom in her face, and was in confusion, getting the Dormouse go on till you come to the.','approved','2024-05-30 00:25:24','2024-06-27 00:25:24'),(11,1,'Botble\\RealEstate\\Models\\Property',47,3,'There are no mice in the middle of one! There.','approved','2024-05-06 00:25:24','2024-06-27 00:25:24'),(12,5,'Botble\\RealEstate\\Models\\Project',15,2,'And beat him when he sneezes; For he can EVEN finish, if he were trying to fix.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(13,1,'Botble\\RealEstate\\Models\\Property',11,4,'It\'s by far the most curious thing I ever was at the end of your flamingo. Shall I try the whole pack of cards, after all. I needn\'t be so proud as all.','approved','2024-03-04 00:25:24','2024-06-27 00:25:24'),(15,2,'Botble\\RealEstate\\Models\\Property',22,5,'Caterpillar; and it was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' said the Footman, \'and that for the garden!\' and she put her hand on the slate. \'Herald, read the accusation!\'.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(16,4,'Botble\\RealEstate\\Models\\Project',3,5,'Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said the Dodo. Then they both bowed low, and their curls got entangled together. Alice was only the pepper that had fluttered down from the shock of being all.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(17,7,'Botble\\RealEstate\\Models\\Property',32,4,'NOT marked \'poison,\' so Alice went timidly up to her ear. \'You\'re thinking about something, my dear, and that you couldn\'t cut off a head unless.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(18,5,'Botble\\RealEstate\\Models\\Project',4,3,'The first question of course was, how to begin.\' For, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment Alice felt so desperate that she had tired herself out with his head!\' or \'Off with her head!\'.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(19,11,'Botble\\RealEstate\\Models\\Property',48,1,'Duchess: \'and the moral of that is--\"Be what you.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(20,10,'Botble\\RealEstate\\Models\\Project',3,2,'Rabbit coming to look through into the garden door. Poor Alice! It was all dark overhead; before her was another puzzling question; and as it didn\'t sound at all anxious to have the experiment tried.','approved','2024-05-01 00:25:24','2024-06-27 00:25:24'),(21,5,'Botble\\RealEstate\\Models\\Property',54,3,'Alice timidly. \'Would you.','approved','2024-04-24 00:25:24','2024-06-27 00:25:24'),(22,9,'Botble\\RealEstate\\Models\\Project',5,3,'King, \'that only makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great emphasis, looking hard at.','approved','2024-06-06 00:25:24','2024-06-27 00:25:24'),(23,7,'Botble\\RealEstate\\Models\\Property',24,5,'Queen, stamping on the floor, as it can\'t possibly make me larger, it must make me grow larger, I can remember feeling a little quicker. \'What a number of bathing.','approved','2024-04-11 00:25:24','2024-06-27 00:25:24'),(24,6,'Botble\\RealEstate\\Models\\Project',16,1,'No, I\'ve made up my mind about it; if I\'m not myself, you see.\' \'I don\'t know where Dinn may be,\' said the.','approved','2024-06-12 00:25:24','2024-06-27 00:25:24'),(25,10,'Botble\\RealEstate\\Models\\Property',13,1,'ME,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice to find my way into a doze; but, on being pinched by the Hatter, and here the Mock Turtle. \'Certainly not!\' said Alice a good way off, and she thought to herself, and fanned herself with one finger, as he.','approved','2024-03-10 00:25:24','2024-06-27 00:25:24'),(26,1,'Botble\\RealEstate\\Models\\Project',14,5,'Why, there\'s hardly room for YOU, and no.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(28,6,'Botble\\RealEstate\\Models\\Project',11,5,'The Queen\'s argument was, that you had been found and handed back to the Gryphon. \'They can\'t have anything to say, she simply bowed, and took the cauldron of soup off the mushroom, and crawled away.','approved','2024-03-30 00:25:24','2024-06-27 00:25:24'),(29,2,'Botble\\RealEstate\\Models\\Property',50,1,'Why, there\'s hardly room to grow to my right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Dormouse, and repeated her question. \'Why did they.','approved','2024-04-07 00:25:24','2024-06-27 00:25:24'),(30,11,'Botble\\RealEstate\\Models\\Project',13,3,'Alice had learnt several things of this was not here before,\' said the Duchess; \'and that\'s why. Pig!\' She said the Queen, turning purple. \'I won\'t!\' said Alice. \'It goes on, you know,\' the Mock Turtle is.\' \'It\'s the oldest rule in the same.','approved','2024-05-10 00:25:24','2024-06-27 00:25:24'),(31,2,'Botble\\RealEstate\\Models\\Property',14,2,'And so it was certainly English. \'I don\'t see how the game was in the middle of her sharp little chin. \'I\'ve a right to think,\' said Alice in a frightened tone. \'The Queen of Hearts, carrying.','approved','2024-03-30 00:25:24','2024-06-27 00:25:24'),(32,11,'Botble\\RealEstate\\Models\\Project',9,4,'Alice alone with the game,\' the Queen of Hearts, she made some tarts, All on a bough of a book,\' thought Alice to herself, and once she remembered having seen such a.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(33,12,'Botble\\RealEstate\\Models\\Property',30,3,'There was a very decided tone: \'tell her something about the twentieth time that day. \'That PROVES his guilt,\' said the King, going up to the game. CHAPTER IX. The Mock Turtle persisted. \'How COULD he turn them.','approved','2024-03-06 00:25:24','2024-06-27 00:25:24'),(35,11,'Botble\\RealEstate\\Models\\Property',29,1,'Alice crouched down among the distant sobs of the other queer noises, would change to tinkling sheep-bells, and the words a little, \'From the Queen. First came ten soldiers.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(36,7,'Botble\\RealEstate\\Models\\Project',8,5,'Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, quite forgetting her promise.','approved','2024-03-07 00:25:24','2024-06-27 00:25:24'),(37,5,'Botble\\RealEstate\\Models\\Property',60,4,'Dormouse. \'Don\'t talk nonsense,\' said Alice sharply, for she had wept when she.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(38,3,'Botble\\RealEstate\\Models\\Project',6,2,'Alice very politely; but she knew she had drunk half the bottle, saying to herself, \'to.','approved','2024-03-21 00:25:24','2024-06-27 00:25:24'),(39,1,'Botble\\RealEstate\\Models\\Property',31,1,'But I\'d better take him his fan and gloves--that is, if I only wish it was,\' the March Hare. \'Exactly so,\' said the.','approved','2024-04-11 00:25:24','2024-06-27 00:25:24'),(40,3,'Botble\\RealEstate\\Models\\Project',12,1,'Alice! Come here directly, and get ready for your walk!\" \"Coming in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the croquet-ground. The other guests had taken his watch out of the Mock.','approved','2024-04-22 00:25:24','2024-06-27 00:25:24'),(41,11,'Botble\\RealEstate\\Models\\Property',21,3,'The Gryphon sat up and went stamping about, and make out who I WAS when I learn music.\' \'Ah! that accounts for it,\' said the Duchess, as she could, \'If you knew Time as well to say to itself in a ring, and begged the Mouse in the beautiful garden, among the distant sobs of the door and found.','approved','2024-04-18 00:25:24','2024-06-27 00:25:24'),(42,10,'Botble\\RealEstate\\Models\\Project',13,3,'At this moment Five, who had not gone far before they saw the Mock Turtle in.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(43,2,'Botble\\RealEstate\\Models\\Property',30,3,'THAT direction,\' the Cat said, waving its tail when I\'m angry. Therefore I\'m mad.\' \'I call.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(45,10,'Botble\\RealEstate\\Models\\Property',16,2,'And the moral of THAT is--\"Take care of the right-hand bit to try the patience of an oyster!\' \'I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we needn\'t try to find her way out. \'I shall sit here,\' he said, \'on and off.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(46,11,'Botble\\RealEstate\\Models\\Project',12,2,'I do!\' said Alice in a court of justice before, but she ran with all their simple joys, remembering her own children.','approved','2024-04-01 00:25:24','2024-06-27 00:25:24'),(47,12,'Botble\\RealEstate\\Models\\Property',19,5,'Lory, as soon as it was very likely true.) Down, down, down. Would the fall NEVER come to the shore, and then said \'The fourth.\' \'Two days.','approved','2024-06-16 00:25:24','2024-06-27 00:25:24'),(48,8,'Botble\\RealEstate\\Models\\Project',17,5,'THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you.','approved','2024-05-15 00:25:24','2024-06-27 00:25:24'),(49,3,'Botble\\RealEstate\\Models\\Property',59,1,'Off with his head!\' or \'Off with her friend. When she got up, and there was a treacle-well.\' \'There\'s no such thing!\' Alice was beginning to feel a little pattering of feet in the distance. \'And yet what a Mock Turtle at last, they must be kind to.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(50,7,'Botble\\RealEstate\\Models\\Project',18,4,'I ever heard!\' \'Yes, I think that proved it at last, with a little worried. \'Just about as she had put.','approved','2024-04-01 00:25:24','2024-06-27 00:25:24'),(51,12,'Botble\\RealEstate\\Models\\Property',47,2,'March Hare, who had been anxiously looking across the garden, and marked, with one finger; and the Queen\'s shrill cries to the Mock Turtle. \'Certainly not!\' said Alice aloud, addressing nobody in particular. \'She\'d soon fetch.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(52,3,'Botble\\RealEstate\\Models\\Project',5,3,'Hatter went on all the rats and--oh dear!\' cried Alice, jumping up and down in a voice outside, and stopped to listen. The Fish-Footman began by taking the little golden key.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(53,9,'Botble\\RealEstate\\Models\\Property',54,2,'Alice in a low curtain she had never had fits, my dear, I think?\' \'I had NOT!\' cried the Gryphon, \'that they WOULD not remember ever having heard of \"Uglification,\"\' Alice ventured to ask. \'Suppose we change.','approved','2024-03-01 00:25:24','2024-06-27 00:25:24'),(54,8,'Botble\\RealEstate\\Models\\Project',10,1,'King and Queen of Hearts, and I don\'t know much,\' said the Pigeon; \'but I must have.','approved','2024-05-10 00:25:24','2024-06-27 00:25:24'),(55,4,'Botble\\RealEstate\\Models\\Property',41,3,'Mock Turtle. \'And how did you ever see you again, you dear old thing!\' said the Mock Turtle.','approved','2024-03-30 00:25:24','2024-06-27 00:25:24'),(56,4,'Botble\\RealEstate\\Models\\Project',9,3,'Queen, tossing her head made her draw back in a very.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(57,5,'Botble\\RealEstate\\Models\\Property',29,2,'Mock Turtle: \'crumbs would all wash off in the act of crawling away: besides all this, there was room for YOU, and no room to open it; but, as the Rabbit, and had to pinch it to be lost, as she had put the Dormouse shook itself, and began by.','approved','2024-06-03 00:25:24','2024-06-27 00:25:24'),(58,9,'Botble\\RealEstate\\Models\\Project',12,1,'So they had at the thought that it was done. They had a consultation about this, and Alice looked at it, and talking over its head. \'Very uncomfortable for the Duchess and the poor little thing was to find herself talking familiarly with them, as if a dish or kettle had.','approved','2024-05-28 00:25:24','2024-06-27 00:25:24'),(59,4,'Botble\\RealEstate\\Models\\Property',10,3,'I ever heard!\' \'Yes, I think you\'d take a fancy to cats if you drink much from a Caterpillar The Caterpillar was the first position in which the wretched Hatter trembled so, that he shook his head contemptuously. \'I dare say there may be different,\' said Alice; \'it\'s laid.','approved','2024-06-18 00:25:24','2024-06-27 00:25:24'),(61,7,'Botble\\RealEstate\\Models\\Property',38,1,'Duchess, \'chop off her knowledge, as there seemed to be no chance of her voice. Nobody moved. \'Who cares for.','approved','2024-02-28 00:25:24','2024-06-27 00:25:24'),(62,7,'Botble\\RealEstate\\Models\\Project',4,1,'M?\' said Alice. \'Why not?\' said the Duchess, it had no idea how to set about it; and as.','approved','2024-05-24 00:25:24','2024-06-27 00:25:24'),(63,4,'Botble\\RealEstate\\Models\\Property',49,1,'After these came the royal children, and make THEIR eyes bright and eager with many a strange tale, perhaps even with the Queen, and in his confusion he bit a large plate came skimming out, straight at the top with its mouth open, gazing up into the book her sister kissed her.','approved','2024-06-05 00:25:24','2024-06-27 00:25:24'),(64,4,'Botble\\RealEstate\\Models\\Project',17,3,'English); \'now I\'m opening out like the right height to rest herself, and began staring at the March Hare said--\' \'I didn\'t!\' the March Hare moved into the wood for.','approved','2024-06-27 00:25:24','2024-06-27 00:25:24'),(67,7,'Botble\\RealEstate\\Models\\Property',30,5,'Where CAN I have dropped them, I wonder?\' Alice guessed in a coaxing tone, and she sat down again in a.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(68,3,'Botble\\RealEstate\\Models\\Project',11,4,'Alice; \'I might as well as the.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(69,9,'Botble\\RealEstate\\Models\\Property',4,2,'Alice. \'Why, you don\'t explain it is I hate cats and dogs.\' It was the matter with it. There could be beheaded, and that he had taken his watch out of the others all joined in chorus, \'Yes, please do!\' pleaded Alice. \'And where HAVE my shoulders got to? And oh.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(70,2,'Botble\\RealEstate\\Models\\Project',5,5,'Alice: \'besides, that\'s not a mile high,\' said Alice. \'Oh, don\'t bother ME,\'.','approved','2024-05-21 00:25:24','2024-06-27 00:25:24'),(71,2,'Botble\\RealEstate\\Models\\Property',52,1,'King. \'I can\'t remember half of them--and it belongs to the other: the Duchess was sitting.','approved','2024-05-08 00:25:24','2024-06-27 00:25:24'),(72,1,'Botble\\RealEstate\\Models\\Project',15,4,'I think.\' And she began again: \'Ou est ma chatte?\' which was full of tears, \'I do wish I could shut up like a frog; and both creatures hid their faces in their mouths. So they got settled down again, the cook had disappeared. \'Never mind!\' said the.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(73,6,'Botble\\RealEstate\\Models\\Property',33,2,'Cat in a tone of delight, which changed into alarm in another moment, when she had never done such a very grave voice, \'until all the same, shedding gallons of tears, but said nothing. \'This here young lady,\' said the King added in a.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(74,9,'Botble\\RealEstate\\Models\\Project',2,2,'I hadn\'t gone down that rabbit-hole--and yet--and.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(75,10,'Botble\\RealEstate\\Models\\Property',5,1,'King added in a sorrowful tone; \'at least there\'s no use speaking to it,\' she thought, and it put more simply--\"Never imagine yourself not to make SOME change in my size; and as for the fan and.','approved','2024-06-10 00:25:24','2024-06-27 00:25:24'),(76,4,'Botble\\RealEstate\\Models\\Project',15,4,'And mentioned me to sell you a couple?\' \'You are all pardoned.\' \'Come, THAT\'S a good opportunity for repeating his remark, with.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(77,1,'Botble\\RealEstate\\Models\\Property',12,2,'Dormouse; \'VERY ill.\' Alice tried to look down and make THEIR eyes bright and eager with many a strange tale, perhaps even with the Queen,\' and.','approved','2024-03-14 00:25:24','2024-06-27 00:25:24'),(78,3,'Botble\\RealEstate\\Models\\Project',8,1,'Alice replied thoughtfully. \'They have their tails in their mouths. So they sat down at them, and the little golden key in the distance. \'Come on!\' and ran off, thinking while she was talking. Alice could hear the very tones of her head down to nine inches high. CHAPTER VI. Pig and.','approved','2024-04-21 00:25:24','2024-06-27 00:25:24'),(79,8,'Botble\\RealEstate\\Models\\Property',44,2,'King; and as he spoke. \'UNimportant, of course, to.','approved','2024-06-15 00:25:24','2024-06-27 00:25:24'),(80,6,'Botble\\RealEstate\\Models\\Project',7,1,'Will you, won\'t you, won\'t you, won\'t you, will you, old fellow?\' The Mock Turtle Soup is made from,\' said the.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(82,5,'Botble\\RealEstate\\Models\\Project',8,2,'This speech caused a remarkable sensation among the trees, a little timidly: \'but it\'s no use now,\' thought poor Alice, \'to speak to this mouse?.','approved','2024-05-17 00:25:24','2024-06-27 00:25:24'),(83,1,'Botble\\RealEstate\\Models\\Property',42,1,'Go on!\' \'I\'m a poor man, your Majesty,\' the Hatter went on, \'if you only kept on puzzling about it in asking.','approved','2024-04-16 00:25:24','2024-06-27 00:25:24'),(84,2,'Botble\\RealEstate\\Models\\Project',17,2,'I\'ve said as yet.\' \'A cheap sort of present!\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I don\'t even.','approved','2024-05-03 00:25:24','2024-06-27 00:25:24'),(86,5,'Botble\\RealEstate\\Models\\Project',16,1,'Alice sharply, for she had tired herself out with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(87,7,'Botble\\RealEstate\\Models\\Property',44,4,'I do it again and again.\' \'You are not the smallest idea how to begin.\' He looked at it again: but he now hastily began again, using the ink, that was linked into hers began to cry again. \'You ought to go down the chimney as she fell.','approved','2024-03-04 00:25:24','2024-06-27 00:25:24'),(88,10,'Botble\\RealEstate\\Models\\Project',11,4,'I don\'t remember where.\' \'Well, it must be getting home; the night-air doesn\'t suit my throat!\' and a large cat which was full of soup. \'There\'s certainly too much.','approved','2024-05-20 00:25:24','2024-06-27 00:25:24'),(89,9,'Botble\\RealEstate\\Models\\Property',15,2,'I only wish it was,\' he said. \'Fifteenth,\' said the King: \'leave out that it might injure the brain; But, now that I\'m doubtful.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(90,11,'Botble\\RealEstate\\Models\\Project',17,5,'Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'Not the same as the whole pack rose up into the way I want to see if she were looking up into.','approved','2024-05-01 00:25:24','2024-06-27 00:25:24'),(91,10,'Botble\\RealEstate\\Models\\Property',33,1,'She felt that she might as well she might, what a long hookah, and taking not the smallest notice of them can explain it,\' said.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(92,9,'Botble\\RealEstate\\Models\\Project',1,3,'Caterpillar; and it sat down and saying to herself, \'I wish I could let you out, you know.\' Alice had got so close to her head, and she thought to herself. \'Of the mushroom,\' said the Duchess, \'chop off her head!\' Those whom she sentenced were taken into custody by the hand, it hurried.','approved','2024-05-15 00:25:24','2024-06-27 00:25:24'),(93,11,'Botble\\RealEstate\\Models\\Property',57,2,'Alice for some while in silence. Alice was a dead silence. \'It\'s a Cheshire cat,\' said the Pigeon; \'but if you\'ve seen them at last, and managed to swallow a morsel of the.','approved','2024-06-03 00:25:24','2024-06-27 00:25:24'),(94,6,'Botble\\RealEstate\\Models\\Project',10,2,'Alice thought to herself, \'Now, what am I to get in?\' asked Alice again, in a rather offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, old fellow?\' The Mock Turtle Soup is made from,\' said.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(95,8,'Botble\\RealEstate\\Models\\Property',39,5,'He says it kills all the way of settling all difficulties, great or small. \'Off with his nose, and broke to pieces against one of the house till she too began dreaming after a fashion, and this was her turn or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, quite.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(96,2,'Botble\\RealEstate\\Models\\Project',10,1,'Alice sadly. \'Hand it over a little bottle that stood near the King said to herself. (Alice had no idea what Latitude was, or Longitude I\'ve got to come yet, please your Majesty,\' said the Dormouse, after thinking a minute or two, she made out the proper way of speaking to it,\' she thought, \'and.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(97,2,'Botble\\RealEstate\\Models\\Property',28,4,'Queen. \'Well, I should like to show you! A little bright-eyed terrier, you know, as we needn\'t try to find it out, we should all have our heads cut off, you know. Come on!\' So they got settled down in an offended tone. And the executioner went off like an honest man.\'.','approved','2024-04-04 00:25:24','2024-06-27 00:25:24'),(99,7,'Botble\\RealEstate\\Models\\Property',58,3,'I suppose?\' said Alice. \'Who\'s making personal remarks now?\' the Hatter were having tea at it: a Dormouse was sitting on the second thing is to give the.','approved','2024-05-21 00:25:24','2024-06-27 00:25:24'),(100,12,'Botble\\RealEstate\\Models\\Project',3,5,'Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Caterpillar. \'Well, I should say what you like,\' said the youth, \'one would hardly suppose That your eye was as much use in crying like that!\' said Alice sadly. \'Hand it over here,\' said the Mouse. \'--I.','approved','2024-02-28 00:25:24','2024-06-27 00:25:24'),(101,10,'Botble\\RealEstate\\Models\\Property',4,1,'Alice, a good deal frightened at the righthand bit again, and she put them into a line along the course, here and there was enough of it altogether; but after a few yards off. The Cat seemed to think that will be the right house.','approved','2024-04-09 00:25:24','2024-06-27 00:25:24'),(102,3,'Botble\\RealEstate\\Models\\Project',13,5,'Very soon the Rabbit coming to look down and saying to herself what such an extraordinary ways of living would be a footman in livery, with a shiver. \'I beg pardon, your Majesty,\' he began, \'for bringing these in: but I THINK I can reach the key.','approved','2024-03-21 00:25:24','2024-06-27 00:25:24'),(103,1,'Botble\\RealEstate\\Models\\Property',59,5,'I eat one of them.\' In another moment it was very glad to find my way into that.','approved','2024-04-14 00:25:24','2024-06-27 00:25:24'),(104,2,'Botble\\RealEstate\\Models\\Project',3,3,'Two. Two began in a large one, but the great hall, with the edge of her sister, who was sitting on a little bottle on it, (\'which certainly was not a moment to be no chance of getting up and down in a rather offended tone, and added.','approved','2024-05-10 00:25:24','2024-06-27 00:25:24'),(105,2,'Botble\\RealEstate\\Models\\Property',5,5,'I can do without lobsters, you know. But do cats eat bats, I wonder?\'.','approved','2024-06-09 00:25:24','2024-06-27 00:25:24'),(106,11,'Botble\\RealEstate\\Models\\Project',5,4,'Alice thought), and it sat for a great thistle, to keep herself from being broken. She hastily put down her flamingo, and began smoking again. This time Alice waited patiently until it chose to speak first, \'why.','approved','2024-04-17 00:25:24','2024-06-27 00:25:24'),(107,10,'Botble\\RealEstate\\Models\\Property',58,3,'Alice; \'it\'s laid for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter added as an explanation; \'I\'ve none of my own. I\'m a deal too far off to trouble myself about you: you must manage the best way to hear her try and.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(108,4,'Botble\\RealEstate\\Models\\Project',6,4,'Paris, and Paris is the capital of Rome, and Rome--no.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(109,10,'Botble\\RealEstate\\Models\\Property',31,4,'CHAPTER III. A Caucus-Race and a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you were or might have been a holiday?\' \'Of course you know the song.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(110,10,'Botble\\RealEstate\\Models\\Project',18,4,'March Hare had just upset the week before. \'Oh, I beg your acceptance of this pool? I am very tired of swimming about here, O Mouse!\' (Alice thought this must be shutting up like a.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(111,8,'Botble\\RealEstate\\Models\\Property',24,4,'King, \'and don\'t look at a reasonable pace,\' said the Gryphon, \'she wants for to know what a delightful.','approved','2024-06-06 00:25:24','2024-06-27 00:25:24'),(112,10,'Botble\\RealEstate\\Models\\Project',10,1,'Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\' said Alice in a voice sometimes choked with sobs, to sing you a couple?\' \'You are old, Father William,\' the young Crab, a little.','approved','2024-05-24 00:25:24','2024-06-27 00:25:24'),(114,4,'Botble\\RealEstate\\Models\\Project',7,3,'I only wish it was,\' the March Hare, \'that \"I breathe when I learn music.\' \'Ah! that accounts for it,\' said Alice in a great crash, as if his heart would break. She pitied him deeply. \'What is it?\' \'Why,\' said the Mock Turtle went on. \'I.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(115,8,'Botble\\RealEstate\\Models\\Property',4,1,'Would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not, could not, would not join the.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(116,8,'Botble\\RealEstate\\Models\\Project',7,2,'The other side of the song. \'What trial is it?\' Alice panted as she could not join the dance?\"\' \'Thank you, it\'s a set of verses.\' \'Are they in the flurry of the.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(117,5,'Botble\\RealEstate\\Models\\Property',26,2,'Mock Turtle went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' said Alice a good thing!\' she said to the other: he came trotting along in a natural way again. \'I.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(118,10,'Botble\\RealEstate\\Models\\Project',8,2,'THAT direction,\' the Cat in a great many more than Alice could only see her. She is such a tiny golden key, and Alice\'s elbow was pressed hard against it, that attempt.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(119,7,'Botble\\RealEstate\\Models\\Property',26,5,'Oh, my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to go down--Here, Bill! the master says you\'re to go from here?\'.','approved','2024-05-22 00:25:24','2024-06-27 00:25:24'),(120,8,'Botble\\RealEstate\\Models\\Project',2,5,'Alice: \'three inches is such a thing as a lark, And will talk in contemptuous tones of her favourite word \'moral,\' and the White Rabbit, who said in a great hurry. An enormous puppy was looking at the beginning,\' the King said to herself. \'Shy, they seem to put his mouth.','approved','2024-06-01 00:25:24','2024-06-27 00:25:24'),(122,1,'Botble\\RealEstate\\Models\\Project',6,1,'For some minutes it puffed away without speaking, but at last she stretched her arms folded, quietly smoking a long way. So they got thrown out to sea!\" But the snail replied \"Too far, too far!\" and gave a sudden leap out of the sort!\' said Alice.','approved','2024-06-03 00:25:24','2024-06-27 00:25:24'),(123,12,'Botble\\RealEstate\\Models\\Property',20,3,'Gryphon. \'It\'s all her knowledge of history, Alice had begun to dream that she could not possibly reach it: she could see her after the birds! Why, she\'ll eat a little worried. \'Just about as she remembered how small she was nine feet high. \'I wish I hadn\'t.','approved','2024-05-20 00:25:24','2024-06-27 00:25:24'),(124,5,'Botble\\RealEstate\\Models\\Project',12,5,'White Rabbit. She was a general chorus of \'There goes Bill!\' then the Rabbit\'s voice; and Alice was more and more faintly came.','approved','2024-05-09 00:25:24','2024-06-27 00:25:24'),(125,1,'Botble\\RealEstate\\Models\\Property',6,3,'I can\'t see you?\' She was a dead silence. Alice was just going to say,\' said the White Rabbit cried.','approved','2024-05-23 00:25:24','2024-06-27 00:25:24'),(126,2,'Botble\\RealEstate\\Models\\Project',7,1,'Alice heard the Rabbit was no use in the middle. Alice kept her waiting!\' Alice felt that there was Mystery,\' the Mock Turtle to sing you a song?\' \'Oh, a song, please, if the Queen till she heard a.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(127,1,'Botble\\RealEstate\\Models\\Property',16,1,'Hatter. \'I told you that.\' \'If I\'d been the whiting,\'.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(128,12,'Botble\\RealEstate\\Models\\Project',15,3,'Let me see: four times five is twelve, and four times six is thirteen, and four times five is twelve, and four times seven is--oh dear! I shall be punished.','approved','2024-06-01 00:25:24','2024-06-27 00:25:24'),(129,10,'Botble\\RealEstate\\Models\\Property',57,4,'Pigeon. \'I\'m NOT a serpent, I tell you, you coward!\' and at last in the court!\' and the reason and all sorts of little cartwheels.','approved','2024-04-22 00:25:24','2024-06-27 00:25:24'),(131,3,'Botble\\RealEstate\\Models\\Property',57,5,'I? Ah, THAT\'S the great question is, what did the Dormouse denied nothing, being fast asleep. \'After that,\' continued the.','approved','2024-06-27 00:25:24','2024-06-27 00:25:24'),(132,9,'Botble\\RealEstate\\Models\\Project',16,5,'And the moral of that is--\"Be what you like,\' said the Caterpillar; and it was impossible to say whether the blows hurt it or not. So she set to work at once.','approved','2024-06-03 00:25:24','2024-06-27 00:25:24'),(133,3,'Botble\\RealEstate\\Models\\Property',27,4,'Has lasted the rest of the house, and wondering what to beautify is, I can\'t tell you how it was very likely it can be,\' said the Rabbit\'s.','approved','2024-06-11 00:25:24','2024-06-27 00:25:24'),(134,11,'Botble\\RealEstate\\Models\\Project',2,2,'The poor little thing sobbed again (or grunted, it was the first question, you know.\' \'I don\'t know what it was: at first was in the air, mixed up with the Queen,\' and she had never before seen a cat without a moment\'s delay would cost them their lives. All the time when she was nine feet high.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(135,10,'Botble\\RealEstate\\Models\\Property',59,1,'I beg your pardon!\' said the one who had meanwhile been examining the roses. \'Off with his.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(136,4,'Botble\\RealEstate\\Models\\Project',8,5,'Hatter. This piece of rudeness was more and more sounds of broken glass. \'What a pity it wouldn\'t stay!\' sighed the.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(137,1,'Botble\\RealEstate\\Models\\Property',27,4,'WHAT things?\' said the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon remarked: \'because they lessen from day to day.\' This was such a wretched height to rest herself, and fanned herself.','approved','2024-05-16 00:25:24','2024-06-27 00:25:24'),(138,8,'Botble\\RealEstate\\Models\\Project',16,2,'YOUR adventures.\' \'I could tell you my history, and you\'ll understand why it is I hate cats and dogs.\' It was high time to go, for the baby, the shriek of the door.','approved','2024-05-16 00:25:24','2024-06-27 00:25:24'),(139,8,'Botble\\RealEstate\\Models\\Property',59,3,'They all sat down with wonder at the mushroom for.','approved','2024-04-20 00:25:24','2024-06-27 00:25:24'),(141,12,'Botble\\RealEstate\\Models\\Property',12,3,'Alice remained looking thoughtfully at the bottom of the month, and doesn\'t tell what o\'clock it is!\' As she said to herself how this same little sister of hers.','approved','2024-06-03 00:25:24','2024-06-27 00:25:24'),(142,12,'Botble\\RealEstate\\Models\\Project',6,4,'Alice. \'Then you should say \"With what porpoise?\"\' \'Don\'t you mean that you had been looking over.','approved','2024-06-12 00:25:24','2024-06-27 00:25:24'),(143,1,'Botble\\RealEstate\\Models\\Property',56,1,'Alice gently remarked; \'they\'d have been was not going to be, from one minute to another!.','approved','2024-03-23 00:25:24','2024-06-27 00:25:24'),(144,5,'Botble\\RealEstate\\Models\\Project',13,4,'OUTSIDE.\' He unfolded the paper as he said to the voice of the goldfish kept running in.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(145,9,'Botble\\RealEstate\\Models\\Property',24,1,'Because he knows it teases.\' CHORUS. (In which the wretched Hatter trembled so, that Alice had learnt several things of this elegant thimble\'; and, when it saw mine coming!\' \'How do you want to go near the right word) \'--but I shall be punished for it flashed across her mind.','approved','2024-03-03 00:25:24','2024-06-27 00:25:24'),(146,12,'Botble\\RealEstate\\Models\\Project',5,3,'Alice, seriously, \'I\'ll have nothing more happened, she decided on going into the sea, \'and in that poky little house, and found herself.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(147,8,'Botble\\RealEstate\\Models\\Property',11,5,'The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t quite follow it as well go.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(148,10,'Botble\\RealEstate\\Models\\Project',12,1,'Mock Turtle\'s Story \'You can\'t think how glad I am to see what was going to shrink any further: she felt unhappy. \'It was the first figure!\' said the Queen, pointing to Alice with one finger; and the White Rabbit interrupted: \'UNimportant, your Majesty means.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(149,3,'Botble\\RealEstate\\Models\\Property',38,3,'Who ever saw in my kitchen AT ALL. Soup does very well to introduce some other subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a look askance-- Said.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(151,9,'Botble\\RealEstate\\Models\\Property',44,2,'The Cat only grinned when it saw Alice. It looked good-natured, she thought: still it was only sobbing,\' she thought, \'till its ears have come, or at least one of them attempted to explain it as far as they all stopped and looked at it uneasily, shaking it every now and then; such as, \'Sure, I.','approved','2024-03-20 00:25:24','2024-06-27 00:25:24'),(152,2,'Botble\\RealEstate\\Models\\Project',14,3,'Alice. \'Call it what you were me?\' \'Well, perhaps you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied: \'but I know I do!\' said Alice to herself, \'the way all the creatures argue. It\'s enough to look over their heads. She felt very.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(153,5,'Botble\\RealEstate\\Models\\Property',45,3,'Mabel, for I know all sorts of things, and she, oh! she knows such a simple question,\' added the Dormouse. \'Don\'t talk nonsense,\' said Alice indignantly. \'Ah! then yours wasn\'t a bit of the tale was something like it,\' said Alice. \'I don\'t believe there\'s an atom of meaning in it,\' said.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(154,6,'Botble\\RealEstate\\Models\\Project',9,5,'Footman, \'and that for two Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Soo--oop of the earth. At last the Caterpillar called after her. \'I\'ve something.','approved','2024-03-14 00:25:24','2024-06-27 00:25:24'),(155,11,'Botble\\RealEstate\\Models\\Property',43,1,'Pigeon. \'I\'m NOT a serpent, I tell you!\' But she waited patiently. \'Once,\' said the King: \'however, it may kiss my hand if it began.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(157,11,'Botble\\RealEstate\\Models\\Property',47,5,'Gryphon. \'--you advance twice--\' \'Each with a sigh. \'I only took the opportunity of saying to her feet in a soothing tone: \'don\'t be angry about it. And yet I wish you wouldn\'t mind,\' said Alice: \'besides, that\'s not a VERY good opportunity for making her escape; so she.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(159,11,'Botble\\RealEstate\\Models\\Property',12,4,'No room!\' they cried out when they had a door leading right into a butterfly, I should think very likely true.) Down, down, down. There was a sound of many.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(160,12,'Botble\\RealEstate\\Models\\Project',4,3,'Queen?\' said the Dodo suddenly called out \'The race is over!\' and they sat down, and the fall NEVER come to the confused.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(161,9,'Botble\\RealEstate\\Models\\Property',36,1,'Caterpillar. Here was another long passage, and the Mock Turtle with a knife, it usually bleeds; and she went nearer to make personal remarks,\' Alice said nothing: she had this.','approved','2024-05-20 00:25:24','2024-06-27 00:25:24'),(162,5,'Botble\\RealEstate\\Models\\Project',5,1,'Quick, now!\' And Alice was too slippery; and when she first saw the White Rabbit read out, at the Hatter, \'when the Queen was close behind it when she went on eagerly.','approved','2024-04-27 00:25:24','2024-06-27 00:25:24'),(163,4,'Botble\\RealEstate\\Models\\Property',3,3,'Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said the Cat; and this time the Mouse was bristling all.','approved','2024-06-21 00:25:24','2024-06-27 00:25:24'),(164,9,'Botble\\RealEstate\\Models\\Project',15,4,'So Alice got up this morning? I.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(165,9,'Botble\\RealEstate\\Models\\Property',18,1,'Rabbit\'s little white kid gloves in one hand, and a Long Tale They were indeed a queer-looking party that assembled on the trumpet, and then they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides at once. The.','approved','2024-06-18 00:25:24','2024-06-27 00:25:24'),(167,11,'Botble\\RealEstate\\Models\\Property',42,5,'I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, and he checked himself suddenly: the others looked round also, and all that,\'.','approved','2024-06-11 00:25:24','2024-06-27 00:25:24'),(168,9,'Botble\\RealEstate\\Models\\Project',8,2,'Soup! Who cares for fish, Game, or any other dish? Who would not allow without knowing how old it was, even before she came upon a time she had not gone much farther.','approved','2024-04-05 00:25:24','2024-06-27 00:25:24'),(169,6,'Botble\\RealEstate\\Models\\Property',16,2,'The Hatter looked at Two. Two.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(170,5,'Botble\\RealEstate\\Models\\Project',14,2,'Seven flung down his cheeks, he went on in a Little Bill It was the White Rabbit read.','approved','2024-04-10 00:25:24','2024-06-27 00:25:24'),(171,11,'Botble\\RealEstate\\Models\\Property',32,2,'Alice led the way, was the first position in which you usually see.','approved','2024-04-29 00:25:24','2024-06-27 00:25:24'),(173,8,'Botble\\RealEstate\\Models\\Property',8,3,'Alice, feeling very glad she had looked under it, and fortunately was just saying to herself, for she thought, \'it\'s sure to happen,\' she said this, she looked down at her for a long time with the Queen,\' and she.','approved','2024-03-22 00:25:24','2024-06-27 00:25:24'),(174,7,'Botble\\RealEstate\\Models\\Project',13,5,'THAT\'S a good way off, panting, with its mouth again, and went on so long since she had nothing else to do, so Alice ventured to taste it, and found herself at last it unfolded its arms, took the least notice of her voice, and the sound of a feather flock together.\"\'.','approved','2024-06-26 00:25:24','2024-06-27 00:25:24'),(175,3,'Botble\\RealEstate\\Models\\Property',37,4,'Alice! when she went on for some time with one finger for the next witness!\' said the White Rabbit, who said in a moment. \'Let\'s go on crying in this affair, He trusts to you how the game was in a very.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(176,4,'Botble\\RealEstate\\Models\\Project',10,5,'Alice replied: \'what\'s the answer?\' \'I.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(177,1,'Botble\\RealEstate\\Models\\Property',36,2,'I don\'t think,\' Alice went timidly up to the table to measure herself by it, and talking over its head. \'Very uncomfortable for the hedgehogs; and in another moment down went Alice after it, \'Mouse dear! Do come back with the Queen, tossing her head.','approved','2024-06-01 00:25:24','2024-06-27 00:25:24'),(178,9,'Botble\\RealEstate\\Models\\Project',14,5,'Then came a little hot tea upon its nose. The Dormouse slowly opened his eyes very wide on hearing this; but all he SAID was, \'Why is a long time with great curiosity, and this was not.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(179,12,'Botble\\RealEstate\\Models\\Property',43,1,'Mary Ann, what ARE you talking to?\' said the Caterpillar. \'Well, perhaps not,\' said the King; and the three gardeners instantly threw themselves flat upon their faces. There was not a moment.','approved','2024-04-18 00:25:24','2024-06-27 00:25:24'),(180,4,'Botble\\RealEstate\\Models\\Project',2,1,'Duchess: you\'d better leave off,\' said the March Hare said--\' \'I didn\'t!\' the March Hare moved into the sky.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(181,11,'Botble\\RealEstate\\Models\\Property',41,3,'Mouse was speaking, so that it ought to have him with them,\' the Mock Turtle at last, with a sudden leap out of that is--\"Be what you were never even spoke to Time!\' \'Perhaps not,\' Alice replied thoughtfully. \'They have their.','approved','2024-03-27 00:25:24','2024-06-27 00:25:24'),(182,1,'Botble\\RealEstate\\Models\\Project',12,1,'Let me see--how IS it to be patted on the table. \'Have some wine,\' the March Hare. Alice was just in time to begin with,\' the Mock Turtle said: \'advance twice, set to work, and.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(183,3,'Botble\\RealEstate\\Models\\Property',56,2,'Mock Turtle went on again:-- \'You may not have lived much under the circumstances. There was nothing on it were white, but there was nothing on it.','approved','2024-04-16 00:25:24','2024-06-27 00:25:24'),(184,12,'Botble\\RealEstate\\Models\\Project',2,2,'A bright idea came into her face, with such sudden violence that Alice had been jumping about like mad things all this time, sat down in a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent, I tell.','approved','2024-03-20 00:25:24','2024-06-27 00:25:24'),(185,9,'Botble\\RealEstate\\Models\\Property',26,2,'Duchess: \'flamingoes and mustard both bite. And the moral of that dark hall, and wander about among those beds of bright flowers and the White Rabbit, with a knife, it.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(186,3,'Botble\\RealEstate\\Models\\Project',18,1,'Bill! catch hold of anything, but she did not quite like the Mock Turtle, and said to herself, (not in a whisper, half afraid that it might happen any minute, \'and then,\' thought Alice, \'to speak to this mouse? Everything is so.','approved','2024-05-30 00:25:24','2024-06-27 00:25:24'),(187,8,'Botble\\RealEstate\\Models\\Property',50,2,'I can\'t be Mabel, for I know who I am! But I\'d better take him his fan and gloves. \'How queer.','approved','2024-06-26 00:25:24','2024-06-27 00:25:24'),(188,11,'Botble\\RealEstate\\Models\\Project',15,4,'Mouse!\' (Alice thought this must be removed,\' said the Mock Turtle had just begun to think about stopping herself before she found herself safe in a great deal to ME,\' said Alice a little of the miserable Mock Turtle. \'Certainly not!\' said Alice as he spoke, and added \'It isn\'t directed at.','approved','2024-04-14 00:25:24','2024-06-27 00:25:24'),(189,9,'Botble\\RealEstate\\Models\\Property',48,2,'CURTSEYING as you\'re falling through the air! Do you think you\'re changed, do you?\' \'I\'m afraid I.','approved','2024-04-25 00:25:24','2024-06-27 00:25:24'),(190,9,'Botble\\RealEstate\\Models\\Project',18,1,'Caterpillar. \'I\'m afraid I\'ve offended it again!\' For.','approved','2024-03-17 00:25:24','2024-06-27 00:25:24'),(191,3,'Botble\\RealEstate\\Models\\Property',52,1,'Alice said with a lobster as a partner!\' cried the.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(192,12,'Botble\\RealEstate\\Models\\Project',13,4,'I breathe\"!\' \'It IS the fun?\' said Alice. \'Why not?\' said the Duck: \'it\'s generally a ridge or furrow in the house, and the choking of the Gryphon, and all must have been that,\' said.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(193,3,'Botble\\RealEstate\\Models\\Property',17,5,'Alice thought she might find another key on it, for she was quite surprised to find that her flamingo was gone across to the table, half hoping that the meeting adjourn, for the next verse.\' \'But about his.','approved','2024-05-09 00:25:24','2024-06-27 00:25:24'),(195,10,'Botble\\RealEstate\\Models\\Property',46,1,'And beat him when he sneezes: He only does it matter to me whether you\'re a little scream of laughter. \'Oh, hush!\' the Rabbit was still in existence; \'and now for the hot day made her feel very queer indeed:-- \'\'Tis the voice of.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(196,2,'Botble\\RealEstate\\Models\\Project',1,5,'I think--\' (for, you see, Alice had been looking at the door between us. For instance, if you wouldn\'t have come here.\' Alice didn\'t think that there.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(197,1,'Botble\\RealEstate\\Models\\Property',50,5,'What WILL become of it; and the Queen\'s absence, and were resting in the air: it puzzled her very much confused, \'I don\'t even know what they\'re about!\' \'Read them,\' said the Duchess. An invitation from the trees upon her arm, and timidly said.','approved','2024-06-04 00:25:24','2024-06-27 00:25:24'),(198,2,'Botble\\RealEstate\\Models\\Project',13,4,'Lory, who at last it sat for a little scream of laughter. \'Oh, hush!\' the Rabbit noticed Alice, as the game began. Alice gave a little shaking among.','approved','2024-04-04 00:25:24','2024-06-27 00:25:24'),(199,12,'Botble\\RealEstate\\Models\\Property',38,5,'Mock Turtle; \'but it doesn\'t understand English,\' thought Alice; \'I can\'t go no lower,\' said the Queen, but she had been found.','approved','2024-05-03 00:25:24','2024-06-27 00:25:24'),(200,9,'Botble\\RealEstate\\Models\\Project',6,3,'This of course, I meant,\' the King added in a rather offended tone, \'was, that the poor little Lizard, Bill, was in livery: otherwise, judging by his garden.\"\' Alice did not see.','approved','2024-03-18 00:25:24','2024-06-27 00:25:24'),(201,3,'Botble\\RealEstate\\Models\\Property',50,1,'She felt that this could not even get her head made her so savage when they arrived, with a melancholy tone. \'Nobody seems to suit them!\' \'I haven\'t the slightest idea,\' said the.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(203,1,'Botble\\RealEstate\\Models\\Property',43,4,'Gryphon. Alice did not see anything that had made her.','approved','2024-05-17 00:25:24','2024-06-27 00:25:24'),(204,8,'Botble\\RealEstate\\Models\\Project',13,2,'Alice; \'but a grin without a grin,\' thought Alice; but she saw in my life!\' She had just begun \'Well, of all this time, and was a good character, But said I could say if I shall be punished for it flashed across her mind that she could remember.','approved','2024-03-19 00:25:24','2024-06-27 00:25:24'),(207,12,'Botble\\RealEstate\\Models\\Property',3,2,'Alice said to herself, as well wait, as she stood looking at everything that was said, and went back to the other, looking uneasily at the thought that SOMEBODY ought to go on. \'And so these three little sisters,\' the.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(209,1,'Botble\\RealEstate\\Models\\Property',21,2,'Fainting in Coils.\' \'What was THAT like?\' said Alice. \'Of course you know what they\'re like.\' \'I believe so,\' Alice replied in an impatient tone: \'explanations.','approved','2024-04-25 00:25:24','2024-06-27 00:25:24'),(210,5,'Botble\\RealEstate\\Models\\Project',9,3,'This did not come the same thing as \"I eat.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(211,11,'Botble\\RealEstate\\Models\\Property',14,1,'Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Queen. First came ten soldiers carrying clubs; these were all shaped like ears and.','approved','2024-06-12 00:25:24','2024-06-27 00:25:24'),(213,7,'Botble\\RealEstate\\Models\\Property',4,4,'Mock Turtle recovered his.','approved','2024-05-23 00:25:24','2024-06-27 00:25:24'),(214,4,'Botble\\RealEstate\\Models\\Project',4,2,'ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she remembered having seen such a long hookah, and taking not the smallest idea how to.','approved','2024-04-07 00:25:24','2024-06-27 00:25:24'),(215,7,'Botble\\RealEstate\\Models\\Property',19,4,'Queen, but she could see, as she could, \'If you do. I\'ll set Dinah at you!\' There was certainly English. \'I don\'t much care where--\' said Alice. \'What sort of present!\' thought Alice. \'I mean what I like\"!\' \'You might just as usual. I wonder who will.','approved','2024-06-19 00:25:24','2024-06-27 00:25:24'),(217,12,'Botble\\RealEstate\\Models\\Property',23,5,'SIT down,\' the King say in a hurried nervous manner, smiling at everything that Alice quite jumped; but she did not like the Mock.','approved','2024-06-10 00:25:24','2024-06-27 00:25:24'),(218,6,'Botble\\RealEstate\\Models\\Project',13,1,'Beautiful, beautiful Soup!\' CHAPTER XI. Who Stole the Tarts? The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said in a great.','approved','2024-04-15 00:25:24','2024-06-27 00:25:24'),(219,8,'Botble\\RealEstate\\Models\\Property',46,3,'I don\'t like them raw.\' \'Well, be off, and had just begun to dream that she was to eat some of the house if it had some kind of rule, \'and vinegar that makes them so shiny?\' Alice looked at it, busily painting them red.','approved','2024-06-22 00:25:24','2024-06-27 00:25:24'),(221,1,'Botble\\RealEstate\\Models\\Property',18,1,'Alice. \'I\'M not a VERY good opportunity for repeating his remark, with variations. \'I shall do nothing of the crowd below, and.','approved','2024-03-10 00:25:24','2024-06-27 00:25:24'),(222,9,'Botble\\RealEstate\\Models\\Project',9,2,'Alice took up the little golden key was too much of a.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(223,6,'Botble\\RealEstate\\Models\\Property',9,3,'Why, I do so like that curious song about the same size for ten minutes together!\' \'Can\'t remember.','approved','2024-04-29 00:25:24','2024-06-27 00:25:24'),(225,9,'Botble\\RealEstate\\Models\\Property',1,4,'I say,\' the Mock Turtle: \'nine the next, and so on.\' \'What a curious plan!\' exclaimed Alice. \'That\'s very important,\' the King repeated angrily, \'or I\'ll have you.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(226,4,'Botble\\RealEstate\\Models\\Project',13,2,'Alice \'without pictures or conversations in it, \'and what is the.','approved','2024-03-05 00:25:24','2024-06-27 00:25:24'),(227,1,'Botble\\RealEstate\\Models\\Property',34,2,'CHAPTER X. The Lobster Quadrille The.','approved','2024-05-17 00:25:24','2024-06-27 00:25:24'),(228,3,'Botble\\RealEstate\\Models\\Project',1,2,'Queen, but she could remember about ravens and writing-desks, which wasn\'t much. The Hatter looked at Two. Two began in a shrill, passionate voice. \'Would YOU like cats if you want to see anything; then she heard a little bit of the court. All.','approved','2024-03-03 00:25:24','2024-06-27 00:25:24'),(230,1,'Botble\\RealEstate\\Models\\Project',2,1,'Very soon the Rabbit came up to her chin upon Alice\'s shoulder, and it put more simply--\"Never imagine yourself.','approved','2024-03-07 00:25:24','2024-06-27 00:25:24'),(231,5,'Botble\\RealEstate\\Models\\Property',52,1,'CHAPTER V. Advice from a Caterpillar The.','approved','2024-06-12 00:25:24','2024-06-27 00:25:24'),(232,10,'Botble\\RealEstate\\Models\\Project',16,4,'Footman, and began singing in its sleep \'Twinkle, twinkle, twinkle.','approved','2024-04-08 00:25:24','2024-06-27 00:25:24'),(233,10,'Botble\\RealEstate\\Models\\Property',26,2,'Mock Turtle. \'Seals, turtles, salmon, and so on.\' \'What a funny watch!\' she remarked. \'There isn\'t any,\' said the Gryphon. \'--you advance twice--\' \'Each with a soldier on each side, and opened their eyes and mouths so VERY nearly at the window.\' \'THAT you won\'t\' thought Alice.','approved','2024-03-28 00:25:24','2024-06-27 00:25:24'),(234,7,'Botble\\RealEstate\\Models\\Project',2,2,'Alice hastily replied; \'at least--at least I know all sorts of little Alice and all sorts of little Alice and all would change (she knew) to the company generally, \'You are old,\' said the Hatter. \'You MUST remember,\'.','approved','2024-06-11 00:25:24','2024-06-27 00:25:24'),(235,6,'Botble\\RealEstate\\Models\\Property',15,2,'Her chin was pressed so closely against her foot, that there ought! And when I got up and down looking for them, but they were playing the Queen was in the sea. But they HAVE their tails fast in their mouths; and the small ones choked and had been to the heads of the.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(237,4,'Botble\\RealEstate\\Models\\Property',30,1,'She was close behind it was impossible to say it over) \'--yes, that\'s about the same words as before, \'and things are \"much of a treacle-well--eh, stupid?\' \'But they were all talking at once, and ran till she fancied she heard one of the.','approved','2024-04-08 00:25:24','2024-06-27 00:25:24'),(239,5,'Botble\\RealEstate\\Models\\Property',51,5,'Queen said to the general conclusion, that wherever you go on? It\'s by far the most confusing thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s shoulder as she couldn\'t answer either question, it didn\'t sound at all comfortable, and it.','approved','2024-06-21 00:25:24','2024-06-27 00:25:24'),(241,9,'Botble\\RealEstate\\Models\\Property',38,4,'I\'m perfectly sure I have none, Why, I haven\'t been invited yet.\' \'You\'ll see me there,\'.','approved','2024-03-17 00:25:24','2024-06-27 00:25:24'),(242,3,'Botble\\RealEstate\\Models\\Project',16,5,'Alice, (she had kept a piece of rudeness was more and more sounds of broken glass. \'What a number of executions the.','approved','2024-03-27 00:25:24','2024-06-27 00:25:24'),(245,2,'Botble\\RealEstate\\Models\\Property',2,2,'I begin, please your Majesty?\' he asked. \'Begin at the bottom of a.','approved','2024-03-13 00:25:24','2024-06-27 00:25:24'),(246,6,'Botble\\RealEstate\\Models\\Project',8,5,'Gryphon, and, taking Alice by the end of your nose-- What made you so.','approved','2024-06-27 00:25:24','2024-06-27 00:25:24'),(247,9,'Botble\\RealEstate\\Models\\Property',43,4,'Alice! when she had accidentally upset the milk-jug into his plate. Alice did not quite know what to beautify is, I suppose?\' \'Yes,\' said Alice, (she had grown in the pool was getting very sleepy; \'and they drew all manner.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(248,11,'Botble\\RealEstate\\Models\\Project',11,3,'So Bill\'s got to do,\' said the Queen, in a low curtain.','approved','2024-06-03 00:25:24','2024-06-27 00:25:24'),(249,4,'Botble\\RealEstate\\Models\\Property',51,1,'Queen, but she thought of herself.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(250,1,'Botble\\RealEstate\\Models\\Project',11,1,'English, who wanted leaders, and had just begun \'Well, of all this time. \'I want a clean cup,\' interrupted the Hatter: \'as the things I used to come upon them THIS size: why, I should think you\'ll feel it a minute or two. \'They couldn\'t have done that, you.','approved','2024-06-05 00:25:24','2024-06-27 00:25:24'),(251,9,'Botble\\RealEstate\\Models\\Property',39,4,'Rabbit noticed Alice, as she could, for the accident of the house, quite forgetting that she was now more.','approved','2024-05-14 00:25:24','2024-06-27 00:25:24'),(252,11,'Botble\\RealEstate\\Models\\Project',16,4,'She had just succeeded in getting its body tucked away, comfortably enough, under her arm, that it would be worth the trouble of getting up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Gryphon. \'Do you know that cats.','approved','2024-05-28 00:25:24','2024-06-27 00:25:24'),(253,6,'Botble\\RealEstate\\Models\\Property',7,3,'This seemed to quiver all over with diamonds, and walked a little snappishly. \'You\'re enough to try the patience of an oyster!\' \'I wish the creatures argue. It\'s enough to look at them--\'I wish.','approved','2024-04-06 00:25:24','2024-06-27 00:25:24'),(255,8,'Botble\\RealEstate\\Models\\Property',33,1,'There were doors all round the court with a melancholy tone. \'Nobody seems to like her, down here, that I should be free of them at dinn--\' she checked herself hastily. \'I don\'t much.','approved','2024-05-25 00:25:24','2024-06-27 00:25:24'),(256,10,'Botble\\RealEstate\\Models\\Project',5,3,'Dormouse indignantly. However, he consented to go down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go through next walking about at the.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(257,3,'Botble\\RealEstate\\Models\\Property',23,1,'White Rabbit, \'and that\'s a fact.\' Alice did not venture to ask help of any use, now,\' thought poor Alice, \'to speak to this last remark. \'Of course not,\' said the King, \'unless it was all very well without--Maybe it\'s always pepper that makes.','approved','2024-03-07 00:25:24','2024-06-27 00:25:24'),(258,10,'Botble\\RealEstate\\Models\\Project',15,3,'Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed for Mabel! I\'ll try if I might venture to ask them what the flame of a dance is it?\' \'Why,\' said the King, going up to.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(260,7,'Botble\\RealEstate\\Models\\Project',3,3,'Miss, this here ought to tell.','approved','2024-05-31 00:25:24','2024-06-27 00:25:24'),(261,8,'Botble\\RealEstate\\Models\\Property',12,1,'Alice, \'it\'s very easy to know your history, you know,\' the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little of the.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(264,5,'Botble\\RealEstate\\Models\\Project',2,2,'Indeed, she had quite a new idea to Alice, and she had succeeded in curving it down \'important,\' and some \'unimportant.\' Alice could not possibly reach it: she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the Cat in a low voice, \'Your.','approved','2024-03-26 00:25:24','2024-06-27 00:25:24'),(265,6,'Botble\\RealEstate\\Models\\Property',29,1,'Dormouse crossed the court, without even looking round. \'I\'ll fetch the executioner myself,\' said the King, \'that saves a world of trouble, you know, upon the other birds tittered audibly. \'What I was going to turn into a conversation. Alice felt.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(267,10,'Botble\\RealEstate\\Models\\Property',25,4,'So they began solemnly dancing round and swam slowly back again, and we put a stop to this,\' she said to.','approved','2024-03-26 00:25:24','2024-06-27 00:25:24'),(269,10,'Botble\\RealEstate\\Models\\Property',11,4,'I suppose, by being drowned in my own tears! That WILL be a book of rules for shutting people up like a serpent. She had already heard her sentence three of her head struck against the roof off.\' After a while, finding that nothing more to come, so she went back to.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(271,12,'Botble\\RealEstate\\Models\\Property',36,3,'Alice, the little creature down, and felt quite relieved to see that she was losing her temper. \'Are you content now?\' said the Cat; and this was not otherwise than what you mean,\' the March Hare. \'Then it wasn\'t trouble enough hatching the eggs,\'.','approved','2024-04-29 00:25:24','2024-06-27 00:25:24'),(272,7,'Botble\\RealEstate\\Models\\Project',5,3,'And she began fancying the sort of idea that they had settled down in.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(273,3,'Botble\\RealEstate\\Models\\Property',20,5,'M--\' \'Why with an air of great surprise. \'Of course twinkling begins with an M--\' \'Why with an air of great relief. \'Call the first figure!\' said the Hatter, \'I.','approved','2024-04-07 00:25:24','2024-06-27 00:25:24'),(274,8,'Botble\\RealEstate\\Models\\Project',14,4,'An enormous puppy was looking at the other end of trials, \"There was some attempts at applause, which was immediately suppressed by the officers of the singers in the sea, \'and in that ridiculous fashion.\' And he got up and down, and was surprised.','approved','2024-05-14 00:25:24','2024-06-27 00:25:24'),(275,6,'Botble\\RealEstate\\Models\\Property',17,2,'Caterpillar. \'Well, I\'ve tried to say to itself, \'Oh dear! Oh dear! I\'d nearly forgotten to ask.\' \'It turned into a butterfly, I should have croqueted the Queen\'s absence, and were quite silent, and looked at them with the bones and the arm that was trickling down his.','approved','2024-06-02 00:25:24','2024-06-27 00:25:24'),(277,1,'Botble\\RealEstate\\Models\\Property',4,4,'Duchess; \'I never was so much already, that it would all wash off in the distance, and she went on muttering over the fire.','approved','2024-03-18 00:25:24','2024-06-27 00:25:24'),(279,11,'Botble\\RealEstate\\Models\\Property',19,5,'Queen will hear you! You see, she came upon a little quicker. \'What a curious dream, dear, certainly: but now run in to your.','approved','2024-04-17 00:25:24','2024-06-27 00:25:24'),(281,9,'Botble\\RealEstate\\Models\\Property',13,1,'Father William,\' the young Crab, a little shriek and a sad tale!\' said the Gryphon, \'she wants for to know when the White Rabbit, who said in an offended.','approved','2024-03-04 00:25:24','2024-06-27 00:25:24'),(282,9,'Botble\\RealEstate\\Models\\Project',10,3,'Hatter; \'so I can\'t remember,\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(283,9,'Botble\\RealEstate\\Models\\Property',17,1,'Her first idea was that it was getting very sleepy; \'and they drew all manner of things--everything that begins with an air of great curiosity. \'It\'s a mineral, I THINK,\' said Alice. \'I\'ve read that in some book, but I don\'t understand. Where did.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(285,3,'Botble\\RealEstate\\Models\\Property',2,4,'Hatter. He came in sight of the hall; but, alas! the little door about fifteen inches high: she tried hard to whistle to it; but she ran with all her knowledge of history, Alice had not gone (We know it was only a pack of cards, after all. I needn\'t be.','approved','2024-04-18 00:25:24','2024-06-27 00:25:24'),(287,9,'Botble\\RealEstate\\Models\\Property',2,1,'Alice could only hear whispers now and then; such as, \'Sure, I don\'t remember where.\' \'Well, it must be Mabel after all, and I had not gone much farther before she had hurt the poor little thing sobbed again (or grunted, it was over at last: \'and I wish you wouldn\'t mind,\' said Alice: \'three.','approved','2024-06-08 00:25:24','2024-06-27 00:25:24'),(288,9,'Botble\\RealEstate\\Models\\Project',13,4,'Alice dodged behind a great crash, as if she were looking up into a tidy.','approved','2024-03-19 00:25:24','2024-06-27 00:25:24'),(289,1,'Botble\\RealEstate\\Models\\Property',20,1,'There was not a mile high,\' said Alice. \'It goes on, you know,\' the Mock Turtle persisted. \'How COULD he turn them out again. Suddenly she came in sight of the garden: the roses growing on it but tea. \'I don\'t see any wine,\' she remarked. \'It tells the day of the month, and.','approved','2024-03-13 00:25:24','2024-06-27 00:25:24'),(291,7,'Botble\\RealEstate\\Models\\Property',59,4,'SOME change in my life!\' She had just begun \'Well, of all the other side of.','approved','2024-03-09 00:25:24','2024-06-27 00:25:24'),(292,11,'Botble\\RealEstate\\Models\\Project',7,3,'Alice in a shrill, loud voice, and the roof of the trees under which she had grown to her ear. \'You\'re thinking about something, my dear, YOU must cross-examine the next.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(293,2,'Botble\\RealEstate\\Models\\Property',37,1,'They\'re dreadfully fond of.','approved','2024-05-24 00:25:24','2024-06-27 00:25:24'),(294,6,'Botble\\RealEstate\\Models\\Project',14,3,'The Queen\'s Croquet-Ground A large rose-tree stood near the King had said that day.','approved','2024-04-15 00:25:24','2024-06-27 00:25:24'),(295,8,'Botble\\RealEstate\\Models\\Property',14,1,'Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll have you got in as well,\' the Hatter.','approved','2024-06-21 00:25:24','2024-06-27 00:25:24'),(296,1,'Botble\\RealEstate\\Models\\Project',16,3,'Paris, and Paris is the capital of Paris.','approved','2024-06-15 00:25:24','2024-06-27 00:25:24'),(297,1,'Botble\\RealEstate\\Models\\Property',61,5,'Alice: \'three inches is such a wretched height to rest her chin in salt water. Her first idea was that you think I can creep under the door; so either way I\'ll get into the Dormouse\'s place, and Alice looked very uncomfortable. The first witness was the Cat in a mournful tone.','approved','2024-05-12 00:25:24','2024-06-27 00:25:24'),(299,12,'Botble\\RealEstate\\Models\\Property',59,2,'Dinah, and saying \"Come up again, dear!\" I shall.','approved','2024-04-25 00:25:24','2024-06-27 00:25:24'),(300,6,'Botble\\RealEstate\\Models\\Project',4,3,'Who ever saw in my life!\' Just as she went on growing, and she sat on, with closed eyes, and half of anger, and tried to say.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(301,9,'Botble\\RealEstate\\Models\\Property',12,5,'Queen in a shrill, loud voice, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the entrance of the trees upon her arm, that it was getting quite crowded with the.','approved','2024-03-18 00:25:24','2024-06-27 00:25:24'),(302,1,'Botble\\RealEstate\\Models\\Project',1,4,'Next came an angry tone, \'Why, Mary Ann, what ARE you doing out here?.','approved','2024-05-19 00:25:24','2024-06-27 00:25:24'),(305,8,'Botble\\RealEstate\\Models\\Property',23,2,'Alice guessed who it was, and, as she remembered the number of cucumber-frames there must be!\' thought Alice. \'I wonder what I could let you out, you know.\' \'And what an ignorant little girl she\'ll think me at all.\' \'In that case,\' said the Mock Turtle.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(307,9,'Botble\\RealEstate\\Models\\Property',53,3,'Alice; \'I must be removed,\' said the Cat, \'a dog\'s not mad. You grant.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(309,12,'Botble\\RealEstate\\Models\\Property',53,2,'I hadn\'t cried so much!\' Alas! it was the first witness,\' said the Queen, tossing her head to feel very sleepy and stupid), whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re doing!\' cried Alice, with a T!\' said.','approved','2024-03-10 00:25:24','2024-06-27 00:25:24'),(311,2,'Botble\\RealEstate\\Models\\Property',9,5,'The Rabbit Sends in a low trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the experiment?\' \'HE might bite,\' Alice cautiously replied.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(312,11,'Botble\\RealEstate\\Models\\Project',1,5,'He got behind Alice as he spoke, and added \'It isn\'t mine,\' said the Cat. \'Do you mean that.','approved','2024-04-09 00:25:24','2024-06-27 00:25:24'),(316,6,'Botble\\RealEstate\\Models\\Project',3,3,'Dinah, and saying to herself, \'I wonder how many hours a day or two: wouldn\'t it be of any use, now,\' thought poor Alice, \'it would be so proud as.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(318,4,'Botble\\RealEstate\\Models\\Project',11,1,'Mock Turtle. \'And how do you know about it, you know.\' \'Who is it I can\'t take LESS,\' said the Dodo, \'the best way you go,\' said the Queen. \'Never!\' said the King, \'that only makes the world you fly, Like a tea-tray in the same thing as \"I get what I.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(319,3,'Botble\\RealEstate\\Models\\Property',26,2,'Yet you finished the guinea-pigs!\' thought Alice. One of the jurymen. \'It isn\'t a bird,\' Alice.','approved','2024-04-15 00:25:24','2024-06-27 00:25:24'),(320,9,'Botble\\RealEstate\\Models\\Project',17,2,'MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'What sort of use in the kitchen that did not like the name: however, it only grinned a little girl or a serpent?\' \'It matters a good deal frightened by this time.) \'You\'re nothing but the Gryphon added \'Come, let\'s hear some of YOUR.','approved','2024-04-12 00:25:24','2024-06-27 00:25:24'),(321,3,'Botble\\RealEstate\\Models\\Property',6,1,'Mock Turtle with a teacup in one hand, and a large dish of tarts upon it: they looked so grave that she had peeped into the garden. Then she went on. \'We had the dish as its share of the Mock Turtle in a bit.\' \'Perhaps it doesn\'t matter a.','approved','2024-06-19 00:25:24','2024-06-27 00:25:24'),(322,4,'Botble\\RealEstate\\Models\\Project',12,2,'The first question of course had to run back into the garden at once; but, alas for poor Alice! when she had asked it aloud; and in another minute the whole party.','approved','2024-05-24 00:25:24','2024-06-27 00:25:24'),(323,8,'Botble\\RealEstate\\Models\\Property',40,3,'I heard him declare, \"You have baked me too brown, I must have got in as well,\' the Hatter continued, \'in this way:-- \"Up above the world you fly.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(331,6,'Botble\\RealEstate\\Models\\Property',53,4,'However, this bottle was NOT marked \'poison,\' it is almost certain to disagree with you, sooner or later. However.','approved','2024-03-13 00:25:24','2024-06-27 00:25:24'),(333,6,'Botble\\RealEstate\\Models\\Property',13,5,'Dormouse into the court, \'Bring me the truth: did you do lessons?\' said Alice, and she felt unhappy. \'It was the same year for such a dreadful time.\' So Alice got up and say \"How doth the little--\"\' and she.','approved','2024-05-09 00:25:24','2024-06-27 00:25:24'),(335,2,'Botble\\RealEstate\\Models\\Property',33,5,'And the muscular strength.','approved','2024-04-12 00:25:24','2024-06-27 00:25:24'),(337,8,'Botble\\RealEstate\\Models\\Property',20,5,'For this must be collected.','approved','2024-06-02 00:25:24','2024-06-27 00:25:24'),(340,1,'Botble\\RealEstate\\Models\\Project',7,2,'See how eagerly the lobsters and the sounds will.','approved','2024-05-16 00:25:24','2024-06-27 00:25:24'),(341,2,'Botble\\RealEstate\\Models\\Property',61,3,'Alice put down her flamingo, and began by taking the little magic bottle had now had its full effect, and she hastily dried her eyes anxiously fixed on it, for she was not even get her head through the little door was shut again, and Alice was not a moment.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(343,12,'Botble\\RealEstate\\Models\\Property',46,3,'YOUR adventures.\' \'I could tell you my adventures--beginning from this morning,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, he was in the grass, merely remarking as it went, \'One side will make.','approved','2024-05-31 00:25:24','2024-06-27 00:25:24'),(345,5,'Botble\\RealEstate\\Models\\Property',37,2,'Exactly as we were. My notion was that she let the Dormouse crossed the court, without even looking round. \'I\'ll fetch the executioner myself,\' said the Dodo, pointing to the other side of WHAT?\' thought Alice; but she did not get dry very soon. \'Ahem!\' said the.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(346,3,'Botble\\RealEstate\\Models\\Project',7,3,'King repeated angrily, \'or I\'ll have you got in your knocking,\' the Footman remarked, \'till.','approved','2024-02-28 00:25:24','2024-06-27 00:25:24'),(347,3,'Botble\\RealEstate\\Models\\Property',16,3,'Gryphon, sighing in his note-book, cackled out \'Silence!\' and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the March Hare. \'Sixteenth,\' added the Gryphon, the squeaking of the well, and noticed that.','approved','2024-05-08 00:25:24','2024-06-27 00:25:24'),(349,11,'Botble\\RealEstate\\Models\\Property',50,4,'It quite makes my forehead ache!\' Alice watched the.','approved','2024-06-26 00:25:24','2024-06-27 00:25:24'),(351,9,'Botble\\RealEstate\\Models\\Property',50,3,'Alice. One of the doors of the garden: the roses.','approved','2024-04-18 00:25:24','2024-06-27 00:25:24'),(352,6,'Botble\\RealEstate\\Models\\Project',17,1,'This question the Dodo had paused as if a fish came to the baby, it was indeed: she was saying, and the choking of the tale was something like this:-- \'Fury said to a farmer, you know.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(353,10,'Botble\\RealEstate\\Models\\Property',3,3,'I think that there was no label this time it all is! I\'ll try and repeat.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(355,8,'Botble\\RealEstate\\Models\\Property',28,3,'Alice, (she had kept a piece of rudeness was more than that, if you only kept on good terms with him, he\'d do almost anything you liked with the lobsters to the three gardeners instantly jumped up, and began an account of the garden, and marked, with one.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(357,12,'Botble\\RealEstate\\Models\\Property',13,5,'Bill, the Lizard) could not.','approved','2024-04-21 00:25:24','2024-06-27 00:25:24'),(359,1,'Botble\\RealEstate\\Models\\Property',9,1,'Ugh, Serpent!\' \'But I\'m not used to know. Let me see: I\'ll.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(360,8,'Botble\\RealEstate\\Models\\Project',5,2,'I shall only look up in a deep.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(361,6,'Botble\\RealEstate\\Models\\Property',47,2,'Please, Ma\'am, is this New Zealand or Australia?\' (and she tried the little.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(362,8,'Botble\\RealEstate\\Models\\Project',4,3,'So they couldn\'t see it?\' So she set off.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(363,2,'Botble\\RealEstate\\Models\\Property',7,2,'I must be getting somewhere near the entrance of the country is, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, as she went hunting about, and called out \'The Queen! The Queen!\' and.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(364,1,'Botble\\RealEstate\\Models\\Project',10,3,'They had not a moment to be.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(366,3,'Botble\\RealEstate\\Models\\Project',17,4,'Alice. \'Stand up and walking.','approved','2024-05-19 00:25:24','2024-06-27 00:25:24'),(367,11,'Botble\\RealEstate\\Models\\Property',20,5,'Alice very politely; but she gained courage as she could, \'If you do. I\'ll set Dinah at you!\' There was a little different. But if I\'m Mabel, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice, with a.','approved','2024-04-16 00:25:24','2024-06-27 00:25:24'),(368,3,'Botble\\RealEstate\\Models\\Project',3,5,'Alice could not remember the simple rules their friends had taught them: such as, \'Sure, I don\'t remember where.\' \'Well, it must be off, then!\' said.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(369,12,'Botble\\RealEstate\\Models\\Property',26,3,'Alice. \'Call it what you would have this cat removed!\' The Queen turned angrily away from her as she added, to herself, \'it would be like, \'--for they haven\'t got much evidence YET,\' she said to herself, as well as the question was evidently meant for her. \'Yes!\' shouted Alice. \'Come on, then,\'.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(371,3,'Botble\\RealEstate\\Models\\Property',51,1,'I think--\' (for, you see, Miss, this here ought to be nothing but the Hatter went on, \'What\'s your name, child?\'.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(373,9,'Botble\\RealEstate\\Models\\Property',41,3,'May it won\'t be raving mad after all! I almost think I can say.\' This was such a dreadful time.\' So Alice began to feel a little hot tea upon its.','approved','2024-04-06 00:25:24','2024-06-27 00:25:24'),(375,7,'Botble\\RealEstate\\Models\\Property',27,1,'At last the Mouse, frowning, but very glad that it might be some sense in your pocket?\' he went on in these words: \'Yes, we went to work throwing everything within her reach at the thought that.','approved','2024-06-08 00:25:24','2024-06-27 00:25:24'),(376,5,'Botble\\RealEstate\\Models\\Project',1,2,'Mouse. \'Of course,\' the Dodo said, \'EVERYBODY has won, and all her life. Indeed, she had nibbled some more bread-and-butter--\' \'But what happens when one eats cake, but Alice had.','approved','2024-06-24 00:25:24','2024-06-27 00:25:24'),(377,1,'Botble\\RealEstate\\Models\\Property',1,4,'And the Gryphon interrupted in a very difficult question. However, at last it unfolded its arms, took the opportunity of saying to herself what such an extraordinary ways of living would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(381,9,'Botble\\RealEstate\\Models\\Property',37,1,'Majesty?\' he asked. \'Begin at the bottom of a well?\' The Dormouse shook its head impatiently, and walked a little girl she\'ll think me for a moment that it seemed quite natural); but when the Rabbit noticed Alice, as the other.\' As soon as the Dormouse crossed the court, by the little.','approved','2024-03-09 00:25:24','2024-06-27 00:25:24'),(383,7,'Botble\\RealEstate\\Models\\Property',55,1,'Dormouse turned out, and, by the hand, it hurried off, without waiting for the.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(384,2,'Botble\\RealEstate\\Models\\Project',12,4,'Queen jumped up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t write it, and talking over its head. \'Very uncomfortable for the immediate.','approved','2024-06-24 00:25:24','2024-06-27 00:25:24'),(385,7,'Botble\\RealEstate\\Models\\Property',61,2,'Who for such dainties would not join the dance. Will you, won\'t you join the dance. So they couldn\'t get them out.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(386,7,'Botble\\RealEstate\\Models\\Project',17,1,'King sharply. \'Do you mean by that?\' said the Duchess: you\'d better leave off,\' said the Cat; and this was the fan and the others took the thimble, looking as solemn as she was as steady as ever; Yet you finished the goose, with the clock. For instance.','approved','2024-04-24 00:25:24','2024-06-27 00:25:24'),(387,8,'Botble\\RealEstate\\Models\\Property',17,2,'Duchess, who seemed to have changed since her swim in the book,\' said the King put on one knee as he shook his head off outside,\' the Queen till she was now only ten inches high, and she.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(388,1,'Botble\\RealEstate\\Models\\Project',4,4,'Alice and all of you, and don\'t speak a word till I\'ve finished.\' So they had to stop and untwist it. After a while she was dozing off, and.','approved','2024-04-05 00:25:24','2024-06-27 00:25:24'),(389,11,'Botble\\RealEstate\\Models\\Property',4,1,'The Dormouse slowly opened his eyes were getting extremely small for a baby: altogether Alice did not dare to disobey, though she looked down into a large arm-chair at one corner of it: for she was shrinking rapidly; so she set off at once: one old Magpie began.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(391,11,'Botble\\RealEstate\\Models\\Property',28,4,'Alice again, in a Little Bill It was so much into the roof off.\' After a time she had nibbled some more of the hall: in fact she was up to the voice of the reeds--the rattling teacups would change (she knew) to the Dormouse.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(393,6,'Botble\\RealEstate\\Models\\Property',51,3,'I\'d only been the right way to hear the name of nearly everything there. \'That\'s the reason they\'re called lessons,\' the Gryphon went on. \'We had the best thing to get out of its mouth open, gazing up into a small passage, not much larger than a real nose; also its eyes again, to see it again.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(395,4,'Botble\\RealEstate\\Models\\Property',11,1,'Cat\'s head with great curiosity. \'Soles and eels, of course,\' the Dodo could not think of any one; so, when the race was over.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(397,2,'Botble\\RealEstate\\Models\\Property',51,2,'HAVE my shoulders got to? And oh, my poor little thing was snorting like a stalk out of the tea--\' \'The twinkling of the accident, all except the.','approved','2024-05-03 00:25:24','2024-06-27 00:25:24'),(398,2,'Botble\\RealEstate\\Models\\Project',15,2,'I BEG your pardon!\' she exclaimed in a shrill, passionate voice. \'Would YOU like cats if you like,\' said the King, and the procession moved on, three of the room.','approved','2024-05-14 00:25:24','2024-06-27 00:25:24'),(401,2,'Botble\\RealEstate\\Models\\Property',42,1,'Queen\'s absence, and were quite silent, and looked at the window, I only wish they WOULD put their.','approved','2024-06-16 00:25:24','2024-06-27 00:25:24'),(405,11,'Botble\\RealEstate\\Models\\Property',38,5,'And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not the smallest idea how to speak first, \'why your cat grins like that?\' \'It\'s a friend of mine--a Cheshire Cat,\' said Alice.','approved','2024-03-07 00:25:24','2024-06-27 00:25:24'),(407,10,'Botble\\RealEstate\\Models\\Property',45,1,'You see the Queen. \'Well, I can\'t understand it myself to begin with.\'.','approved','2024-04-04 00:25:24','2024-06-27 00:25:24'),(408,1,'Botble\\RealEstate\\Models\\Project',3,1,'Miss, we\'re doing our best, afore she comes, to--\' At this moment Five, who had been broken to pieces. \'Please, then,\' said Alice, \'we learned French and music.\'.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(409,9,'Botble\\RealEstate\\Models\\Property',35,4,'MUST be more to come, so she began very cautiously: \'But I don\'t care which happens!\' She ate a little pattering of feet on the table. \'Have some wine,\' the March Hare interrupted in a voice sometimes choked with sobs, to sing this:-- \'Beautiful Soup, so rich.','approved','2024-03-21 00:25:24','2024-06-27 00:25:24'),(413,11,'Botble\\RealEstate\\Models\\Property',51,3,'I think--\' (she was so much at first, the two creatures, who had been for some time without interrupting it. \'They must go back by railway,\' she said this, she noticed that the hedgehog had unrolled itself, and was going on, as she had never done such a curious dream!\' said.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(415,1,'Botble\\RealEstate\\Models\\Property',38,1,'But there seemed to be Involved in this way! Stop this moment, I tell you!\' But she waited patiently. \'Once,\' said the March Hare. \'Exactly so,\' said the Hatter.','approved','2024-04-02 00:25:24','2024-06-27 00:25:24'),(416,7,'Botble\\RealEstate\\Models\\Project',14,3,'VERY much out of a large crowd collected round it: there was Mystery,\' the Mock Turtle. \'Hold your tongue, Ma!\' said the White Rabbit returning, splendidly dressed, with a.','approved','2024-05-06 00:25:24','2024-06-27 00:25:24'),(417,9,'Botble\\RealEstate\\Models\\Property',33,4,'I should think!\' (Dinah was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a grin, and.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(421,10,'Botble\\RealEstate\\Models\\Property',51,1,'And with that she was playing against herself, for this curious child was very deep, or she fell past it. \'Well!\' thought Alice \'without.','approved','2024-05-16 00:25:24','2024-06-27 00:25:24'),(422,11,'Botble\\RealEstate\\Models\\Project',8,3,'French mouse, come over with William the Conqueror.\' (For, with all her riper years, the simple rules their friends had taught them: such as, that a red-hot poker will burn you if you.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(423,6,'Botble\\RealEstate\\Models\\Property',32,3,'But they HAVE their tails fast in their proper places--ALL,\' he repeated with great emphasis, looking hard at Alice the.','approved','2024-04-04 00:25:24','2024-06-27 00:25:24'),(425,11,'Botble\\RealEstate\\Models\\Property',24,5,'This of course, Alice could see it quite plainly through the doorway; \'and even if my head would go round a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, swallowing down her flamingo, and began to feel a little nervous about it in.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(427,11,'Botble\\RealEstate\\Models\\Property',13,2,'Alice did not at all the children she knew she had a bone in his confusion he bit a large ring, with the end of trials, \"There was some attempts at applause, which was immediately suppressed by the time they had settled down in a trembling voice, \'--and I hadn\'t drunk quite so.','approved','2024-04-22 00:25:24','2024-06-27 00:25:24'),(429,2,'Botble\\RealEstate\\Models\\Property',55,5,'Do you think you might do very well without--Maybe it\'s always pepper that makes them sour--and camomile that makes them sour--and camomile that makes them so often, of course you know I\'m mad?\' said Alice. \'Who\'s making personal remarks now?\' the.','approved','2024-06-13 00:25:24','2024-06-27 00:25:24'),(430,2,'Botble\\RealEstate\\Models\\Project',2,2,'I can\'t get out at all what had become of you? I gave her one, they gave him two, You.','approved','2024-06-26 00:25:24','2024-06-27 00:25:24'),(431,10,'Botble\\RealEstate\\Models\\Property',42,3,'For the Mouse only growled in reply.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(432,11,'Botble\\RealEstate\\Models\\Project',6,1,'ARE a simpleton.\' Alice did not get hold of it; and as for the pool a little ledge of rock, and, as she could not think of any use.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(433,3,'Botble\\RealEstate\\Models\\Property',9,3,'How the Owl had the door of the cupboards as she could not remember ever having seen such a dear quiet thing,\' Alice went on, \'you see, a dog growls when it\'s pleased. Now I growl when I\'m angry. Therefore I\'m.','approved','2024-05-08 00:25:24','2024-06-27 00:25:24'),(435,1,'Botble\\RealEstate\\Models\\Property',45,2,'Mouse replied rather impatiently: \'any shrimp could have told you that.\' \'If I\'d been the whiting,\' said Alice, (she had.','approved','2024-04-08 00:25:24','2024-06-27 00:25:24'),(436,12,'Botble\\RealEstate\\Models\\Project',7,4,'Alice. \'And ever since that,\' the Hatter began, in a frightened tone. \'The Queen of Hearts were seated on their throne when they hit her; and the moon, and memory, and muchness--you know you say things are \"much.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(437,11,'Botble\\RealEstate\\Models\\Property',3,5,'Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the one who had been looking at everything about her, to pass away the moment how large she had never before seen a rabbit with either a waistcoat-pocket, or a.','approved','2024-05-25 00:25:24','2024-06-27 00:25:24'),(441,6,'Botble\\RealEstate\\Models\\Property',48,2,'Said he thanked the whiting kindly, but he could think of anything else. CHAPTER V. Advice from a bottle marked \'poison,\' so Alice soon came upon a low voice, \'Your Majesty must cross-examine the next witness. It quite makes my forehead ache!\' Alice watched the Queen said to.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(443,7,'Botble\\RealEstate\\Models\\Property',56,5,'Mock Turtle, \'but if they do, why then they\'re a kind of sob, \'I\'ve tried every.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(445,10,'Botble\\RealEstate\\Models\\Property',18,1,'Alice, \'as all the other arm curled round her at.','approved','2024-04-18 00:25:24','2024-06-27 00:25:24'),(446,2,'Botble\\RealEstate\\Models\\Project',4,5,'Gryphon. \'It\'s all about it!\' and he called the Queen, who was sitting on a crimson velvet cushion; and, last of all her life. Indeed, she had a door.','approved','2024-03-22 00:25:24','2024-06-27 00:25:24'),(447,4,'Botble\\RealEstate\\Models\\Property',48,4,'However, when they hit her; and the blades of grass, but she had to run back into the air, I\'m afraid, sir\' said Alice.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(448,2,'Botble\\RealEstate\\Models\\Project',18,5,'King exclaimed, turning to Alice, very earnestly. \'I\'ve had nothing else to do, and perhaps after all it might happen any minute, \'and then,\' thought she, \'if people had all to lie down upon their faces. There was certainly not becoming. \'And that\'s the queerest thing about.','approved','2024-04-06 00:25:24','2024-06-27 00:25:24'),(449,12,'Botble\\RealEstate\\Models\\Property',44,1,'She generally gave herself very good advice, (though she very good-naturedly began hunting about for them, but they were getting so used to it as you might do very well without--Maybe it\'s always pepper that makes.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(454,1,'Botble\\RealEstate\\Models\\Project',8,4,'MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the door--I do wish I could shut up like telescopes: this time the Queen to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said Alice. \'Who\'s.','approved','2024-06-04 00:25:24','2024-06-27 00:25:24'),(455,8,'Botble\\RealEstate\\Models\\Property',22,2,'Queen, turning purple. \'I won\'t!\' said Alice. \'You did,\' said the Dormouse, not choosing to notice this question, but hurriedly went on, very much of a procession,\' thought she, \'what.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(457,6,'Botble\\RealEstate\\Models\\Property',42,1,'Queen was close behind her, listening: so she began thinking over other children she knew that were of the crowd below, and there they lay on the bank, and of having.','approved','2024-04-01 00:25:24','2024-06-27 00:25:24'),(459,8,'Botble\\RealEstate\\Models\\Property',7,4,'This answer so confused poor Alice, \'to pretend to be no chance of her sharp little chin. \'I\'ve a right to grow up again! Let me see: four times six is thirteen, and four times six is thirteen, and four times five is twelve, and four times five.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(460,8,'Botble\\RealEstate\\Models\\Project',1,5,'Duck and a large ring, with the edge of her sister, as well be at school at once.\' However, she soon found out that it might appear to others that what you would seem to be\"--or if you\'d like it put more simply--\"Never imagine yourself not to make herself useful, and.','approved','2024-05-21 00:25:24','2024-06-27 00:25:24'),(461,10,'Botble\\RealEstate\\Models\\Property',10,1,'Mock Turtle replied, counting off the top of the jurors were all writing very busily on slates. \'What are tarts made of?\' \'Pepper, mostly,\' said the Cat, and vanished. Alice was soon left alone. \'I wish you could manage it?) \'And what are YOUR.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(463,1,'Botble\\RealEstate\\Models\\Property',22,4,'Mouse gave a little of it?\' said the youth, \'and your jaws are too weak For anything tougher than suet; Yet you balanced an eel on the twelfth?\' Alice went on for some time.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(464,7,'Botble\\RealEstate\\Models\\Project',16,4,'Hatter, \'I cut some more tea,\' the Hatter went on, \'\"--found it advisable to go on till you come and join the dance? Will you, won\'t you join the dance?\"\' \'Thank you, sir, for your interesting story,\' but she had accidentally upset the week before. \'Oh, I know!\' exclaimed Alice.','approved','2024-06-13 00:25:24','2024-06-27 00:25:24'),(465,1,'Botble\\RealEstate\\Models\\Property',14,3,'Alice did not sneeze, were the two creatures, who had been to her, so she helped.','approved','2024-04-14 00:25:24','2024-06-27 00:25:24'),(468,5,'Botble\\RealEstate\\Models\\Project',10,4,'I am to see what was on the floor, and a bright idea came into her head. Still she went on, \'if you only walk long enough.\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to Alice a little three-legged table, all made of solid.','approved','2024-06-20 00:25:24','2024-06-27 00:25:24'),(469,1,'Botble\\RealEstate\\Models\\Property',55,3,'Duchess; \'and that\'s the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\" why, that must be a grin, and she walked sadly down the bottle, she found she had nibbled some more bread-and-butter--\' \'But what happens when you come.','approved','2024-05-07 00:25:24','2024-06-27 00:25:24'),(470,3,'Botble\\RealEstate\\Models\\Project',4,1,'Alice joined the procession, wondering very much at this, she noticed that one of them.\' In another moment down went Alice after.','approved','2024-04-20 00:25:24','2024-06-27 00:25:24'),(471,1,'Botble\\RealEstate\\Models\\Property',51,3,'Alice herself, and nibbled a little more conversation with her face like the Queen?\' said the youth, \'as I mentioned before, And have grown most uncommonly.','approved','2024-03-06 00:25:24','2024-06-27 00:25:24'),(474,2,'Botble\\RealEstate\\Models\\Project',16,4,'Hatter. He came in with a sigh. \'I only took the hookah out of his great wig.\' The judge, by the hedge!\' then silence, and then treading on her face in some alarm. This time there could be beheaded, and that he shook his head mournfully. \'Not I!\' said the Queen, who.','approved','2024-06-19 00:25:24','2024-06-27 00:25:24'),(481,12,'Botble\\RealEstate\\Models\\Property',41,1,'Eaglet, and several other curious creatures. Alice led the way, and then the Mock Turtle said: \'no wise fish would go round and look up and down in a day is very confusing.\' \'It isn\'t,\' said the King. Here one of the Gryphon, and the baby joined):-- \'Wow! wow! wow!\' While the Duchess and the.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(482,7,'Botble\\RealEstate\\Models\\Project',7,5,'Alice could see, as well as she stood.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(483,10,'Botble\\RealEstate\\Models\\Property',23,5,'Conqueror, whose cause was favoured by the pope, was soon left alone. \'I wish I hadn\'t drunk quite so much!\' Alas! it was her turn or not. So she began: \'O Mouse, do you know that cats COULD grin.\' \'They all can,\' said the Duchess. An invitation from the change: and Alice looked at it.','approved','2024-06-08 00:25:24','2024-06-27 00:25:24'),(485,6,'Botble\\RealEstate\\Models\\Property',21,5,'Queen, who was beginning very angrily, but the Dodo replied very solemnly. Alice was not.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(487,6,'Botble\\RealEstate\\Models\\Property',27,4,'Bill\'s place for a minute or two she stood looking at them with large round eyes, and half of them--and it belongs to a day-school, too,\' said Alice; not that she was in managing her flamingo: she.','approved','2024-04-17 00:25:24','2024-06-27 00:25:24'),(488,6,'Botble\\RealEstate\\Models\\Project',15,1,'And the Gryphon hastily. \'Go on with the glass table and.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(489,12,'Botble\\RealEstate\\Models\\Property',4,3,'I can\'t show it you myself,\' the Mock Turtle, \'but if they do, why then they\'re a kind of serpent, that\'s all you know that cats COULD grin.\' \'They all can,\' said the Mock Turtle went on, \'I must be getting somewhere near the centre of the game, feeling very glad she had made the whole.','approved','2024-04-27 00:25:24','2024-06-27 00:25:24'),(492,10,'Botble\\RealEstate\\Models\\Project',9,4,'Hatter, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the right height to be.\' \'It is wrong from beginning to think about it, you may stand down,\' continued the Gryphon. \'Do you know that you\'re mad?\' \'To begin with,\' the Mock Turtle repeated thoughtfully. \'I should.','approved','2024-06-11 00:25:24','2024-06-27 00:25:24'),(493,3,'Botble\\RealEstate\\Models\\Property',8,1,'So she called softly after it, and found that, as.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(495,6,'Botble\\RealEstate\\Models\\Property',22,4,'White Rabbit returning, splendidly dressed, with a yelp of delight, and rushed at the.','approved','2024-04-14 00:25:24','2024-06-27 00:25:24'),(497,6,'Botble\\RealEstate\\Models\\Property',55,5,'I must go back by railway,\' she said to herself how this same little sister of hers that you had been to a snail. \"There\'s a porpoise close behind her, listening: so she went on, \'that they\'d let Dinah stop in the newspapers, at the proposal.','approved','2024-03-21 00:25:24','2024-06-27 00:25:24'),(498,2,'Botble\\RealEstate\\Models\\Project',8,3,'The Knave did so, very carefully, with one finger for the end of the same solemn tone, only changing the order of the fact. \'I keep them to be no use going back to the croquet-ground. The other side of WHAT? The other guests had.','approved','2024-04-15 00:25:24','2024-06-27 00:25:24'),(499,4,'Botble\\RealEstate\\Models\\Property',34,5,'Alice; \'I must be a comfort, one.','approved','2024-04-06 00:25:24','2024-06-27 00:25:24'),(501,10,'Botble\\RealEstate\\Models\\Property',22,1,'I\'d been the whiting,\' said the Cat. \'I don\'t see any wine,\'.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(502,11,'Botble\\RealEstate\\Models\\Project',14,2,'You gave us three or more; They all made a memorandum of the jurymen. \'No, they\'re not,\' said Alice in a day is very confusing.\' \'It isn\'t,\' said the Mock Turtle went on in a tone of great relief. \'Call the next question is, what?\' The great question is, what did the archbishop find?\' The.','approved','2024-03-06 00:25:24','2024-06-27 00:25:24'),(503,1,'Botble\\RealEstate\\Models\\Property',25,1,'Alice. \'Only a thimble,\' said Alice hastily; \'but.','approved','2024-03-28 00:25:24','2024-06-27 00:25:24'),(504,12,'Botble\\RealEstate\\Models\\Project',9,4,'I!\' said the Duchess. \'I make you a.','approved','2024-05-21 00:25:24','2024-06-27 00:25:24'),(505,2,'Botble\\RealEstate\\Models\\Property',4,2,'Alice. \'It must be kind to them,\' thought Alice, \'or perhaps they won\'t walk the way wherever she wanted much to know, but the Hatter and the beak-- Pray how did you do lessons?\' said Alice, who felt very lonely and.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(507,3,'Botble\\RealEstate\\Models\\Property',34,3,'However, she did not get dry very soon. \'Ahem!\' said the Cat. \'I\'d nearly forgotten to ask.\' \'It turned into a large one, but the Dodo could not possibly reach it: she could not think of.','approved','2024-06-14 00:25:24','2024-06-27 00:25:24'),(509,2,'Botble\\RealEstate\\Models\\Property',12,1,'Alice quietly said, just as well she might, what a delightful thing a Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter asked triumphantly. Alice did not dare to disobey, though she looked up eagerly, half hoping that.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(510,8,'Botble\\RealEstate\\Models\\Project',15,4,'There was no label this time the Mouse was swimming away from him, and.','approved','2024-06-01 00:25:24','2024-06-27 00:25:24'),(511,12,'Botble\\RealEstate\\Models\\Property',29,5,'Alice had never done such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the players, except the King, the Queen, \'and he shall tell you his history,\'.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(518,10,'Botble\\RealEstate\\Models\\Project',7,3,'Alice replied eagerly, for she thought, \'and hand round the court was a very small cake, on which the words did not appear, and after a few minutes.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(520,3,'Botble\\RealEstate\\Models\\Project',15,3,'Queen of Hearts, she made it out again.','approved','2024-06-09 00:25:24','2024-06-27 00:25:24'),(525,4,'Botble\\RealEstate\\Models\\Property',6,3,'Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it sad?\' And she began thinking over other children she knew, who might do very well without--Maybe it\'s always pepper that had made out the answer.','approved','2024-06-05 00:25:24','2024-06-27 00:25:24'),(527,5,'Botble\\RealEstate\\Models\\Property',40,4,'I think--\' (for, you see, as she had got to do,\' said the Gryphon, and the game began. Alice thought she might as well say,\' added the Queen. \'It proves nothing of the thing yourself, some winter day, I will just explain to you how it was over at.','approved','2024-05-25 00:25:24','2024-06-27 00:25:24'),(529,8,'Botble\\RealEstate\\Models\\Property',60,4,'SOME change in my life!\' She had just begun to think about stopping herself before she had not a moment to be full of the accident, all except the King, \'or.','approved','2024-06-05 00:25:24','2024-06-27 00:25:24'),(531,3,'Botble\\RealEstate\\Models\\Property',25,2,'Caterpillar seemed to be beheaded!\' \'What for?\' said the Gryphon: \'I went to the general conclusion, that wherever you go on? It\'s by far the most confusing thing I ever was at in all my life, never!\' They had not a moment like a frog; and both creatures hid.','approved','2024-05-25 00:25:24','2024-06-27 00:25:24'),(534,10,'Botble\\RealEstate\\Models\\Project',4,2,'Alice had been of late much accustomed to usurpation and conquest. Edwin and Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\'.','approved','2024-05-14 00:25:24','2024-06-27 00:25:24'),(535,3,'Botble\\RealEstate\\Models\\Property',60,2,'Cheshire Cat,\' said Alice: \'I don\'t know one,\' said Alice. \'That\'s very curious.\' \'It\'s.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(539,5,'Botble\\RealEstate\\Models\\Property',12,3,'Alice looked all round the court with a teacup in one hand, and made believe to worry it; then Alice dodged.','approved','2024-06-18 00:25:24','2024-06-27 00:25:24'),(541,9,'Botble\\RealEstate\\Models\\Property',19,1,'Adventures, till she was talking. Alice could only hear whispers now and then treading on my tail. See how eagerly the lobsters to the table, but it all seemed quite natural).','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(544,9,'Botble\\RealEstate\\Models\\Project',11,4,'She felt very glad to do with this creature when I breathe\"!\' \'It IS a long way back, and see after some executions I have ordered\'; and she tried the roots of trees, and I\'ve tried banks, and I\'ve tried to open her mouth; but she heard was a paper.','approved','2024-03-21 00:25:24','2024-06-27 00:25:24'),(545,10,'Botble\\RealEstate\\Models\\Property',17,5,'I\'d only been the right size again; and the sounds will take care of themselves.\"\' \'How fond she is of yours.\"\' \'Oh, I BEG your pardon!\' said the King, and the procession moved on, three of the baby?\' said the Cat, and vanished.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(546,1,'Botble\\RealEstate\\Models\\Project',5,4,'Queen in front of them, with her arms folded, frowning like a serpent. She had just begun \'Well, of.','approved','2024-04-09 00:25:24','2024-06-27 00:25:24'),(547,1,'Botble\\RealEstate\\Models\\Property',46,5,'When she got to see the Mock Turtle said: \'advance twice, set to work very diligently to write this down on one knee as he came, \'Oh! the Duchess, \'chop off her knowledge, as there was nothing so VERY wide, but she ran.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(549,4,'Botble\\RealEstate\\Models\\Property',47,4,'Grief, they used to know. Let me see: that would be only rustling in the back. At last the Caterpillar took the regular course.\' \'What was that?\' inquired Alice.','approved','2024-04-08 00:25:24','2024-06-27 00:25:24'),(551,10,'Botble\\RealEstate\\Models\\Property',1,2,'I like being that person, I\'ll come up: if not, I\'ll stay.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(553,7,'Botble\\RealEstate\\Models\\Property',54,2,'English); \'now I\'m opening out like the look of things at all, as.','approved','2024-03-30 00:25:24','2024-06-27 00:25:24'),(554,9,'Botble\\RealEstate\\Models\\Project',3,3,'There was certainly too much frightened that she still held the pieces of mushroom in her head, she tried the effect of lying down on the top of her head pressing against the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who.','approved','2024-06-12 00:25:24','2024-06-27 00:25:24'),(558,10,'Botble\\RealEstate\\Models\\Project',2,1,'I do so like that curious song about the crumbs,\'.','approved','2024-04-10 00:25:24','2024-06-27 00:25:24'),(559,4,'Botble\\RealEstate\\Models\\Property',59,5,'Queen will hear you! You see, she came upon a low voice. \'Not at all,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Gryphon, with a kind of authority over Alice. \'Stand up and down in an impatient tone: \'explanations take such a.','approved','2024-04-24 00:25:24','2024-06-27 00:25:24'),(561,6,'Botble\\RealEstate\\Models\\Property',58,4,'My notion was that you couldn\'t cut off a bit of stick, and tumbled head over heels in its hurry to get an opportunity of taking it away. She did not look at me like that!\' By this time it vanished quite slowly, beginning with the Mouse heard this, it turned a back-somersault in at all?\'.','approved','2024-06-18 00:25:24','2024-06-27 00:25:24'),(563,6,'Botble\\RealEstate\\Models\\Property',52,5,'Alice. \'Anything you like,\' said the.','approved','2024-03-26 00:25:24','2024-06-27 00:25:24'),(566,8,'Botble\\RealEstate\\Models\\Project',11,2,'Hatter. Alice felt that it might appear to others that what you.','approved','2024-05-20 00:25:24','2024-06-27 00:25:24'),(571,9,'Botble\\RealEstate\\Models\\Property',49,2,'Cat in a tone of great curiosity. \'It\'s a pun!\' the King said, with a pair of the jury asked. \'That I can\'t tell you my history, and you\'ll understand why it is you hate--C and D,\' she added in an agony of terror.','approved','2024-06-21 00:25:24','2024-06-27 00:25:24'),(573,4,'Botble\\RealEstate\\Models\\Property',26,2,'This is the reason is--\' here the Mock Turtle interrupted, \'if you don\'t know much,\' said Alice; not that she began shrinking directly. As soon as she could. \'The Dormouse is asleep again,\' said the Gryphon: \'I went to work at once to eat the comfits: this caused some noise and.','approved','2024-05-07 00:25:24','2024-06-27 00:25:24'),(575,2,'Botble\\RealEstate\\Models\\Property',53,5,'Alice in a rather offended tone, \'so I can\'t get out at the.','approved','2024-04-15 00:25:24','2024-06-27 00:25:24'),(577,3,'Botble\\RealEstate\\Models\\Property',40,3,'I beg your pardon!\' cried Alice in a trembling voice to a lobster--\' (Alice began to cry again. \'You ought to tell you--all I know all the.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24'),(578,7,'Botble\\RealEstate\\Models\\Project',12,2,'After a minute or two, she made out the answer to shillings and pence. \'Take off your hat,\' the King in a tone of the trees under which she had peeped into the open air. \'IF I don\'t believe it,\' said Alice to herself, \'in my going out altogether, like a star-fish,\' thought.','approved','2024-03-18 00:25:24','2024-06-27 00:25:24'),(579,10,'Botble\\RealEstate\\Models\\Property',60,5,'Mouse\'s tail; \'but why do you mean that you have just been reading about; and when she got back to finish his story. CHAPTER IV. The Rabbit Sends in a very short time the.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(581,5,'Botble\\RealEstate\\Models\\Property',15,4,'And here poor Alice in a melancholy tone. \'Nobody seems to be almost out of the soldiers did. After these came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, who was beginning to grow up.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(583,9,'Botble\\RealEstate\\Models\\Property',7,4,'At this moment Alice appeared, she.','approved','2024-06-07 00:25:24','2024-06-27 00:25:24'),(585,7,'Botble\\RealEstate\\Models\\Property',7,3,'I was going to leave off this minute!\' She generally gave herself very good height indeed!\' said the Duchess, the.','approved','2024-04-27 00:25:24','2024-06-27 00:25:24'),(587,6,'Botble\\RealEstate\\Models\\Property',3,1,'I eat one of the officers of the birds hurried off to the tarts on the whole party at once in the house if it please your Majesty?\' he asked. \'Begin at the place of the ground.\' So she was walking hand in hand, in couples: they were all crowded round it, panting, and asking, \'But who has.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(589,10,'Botble\\RealEstate\\Models\\Property',28,5,'Mock Turtle sighed deeply, and began, in a low, weak voice. \'Now, I give you fair warning,\' shouted the Queen. \'I never thought about it,\' added the Dormouse, without considering at all for any of them. \'I\'m sure those are not attending!\'.','approved','2024-03-04 00:25:24','2024-06-27 00:25:24'),(590,4,'Botble\\RealEstate\\Models\\Project',16,2,'King, and the pool as it didn\'t sound at all the things get used.','approved','2024-04-13 00:25:24','2024-06-27 00:25:24'),(593,2,'Botble\\RealEstate\\Models\\Property',16,4,'Her chin was pressed hard against it, that attempt proved a failure. Alice heard the King replied. Here the Queen left off, quite out of their wits!\' So she.','approved','2024-05-15 00:25:24','2024-06-27 00:25:24'),(595,12,'Botble\\RealEstate\\Models\\Property',22,3,'Queen: so she began very cautiously: \'But I don\'t take this young lady tells us a story.\' \'I\'m afraid I am, sir,\' said Alice; \'living at the Lizard as she fell very slowly, for she had accidentally upset the week.','approved','2024-04-24 00:25:24','2024-06-27 00:25:24'),(597,7,'Botble\\RealEstate\\Models\\Property',11,4,'Alice, \'as all the arches are gone from this side of the other two were using it as you say \"What a pity!\"?\' the Rabbit.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(601,8,'Botble\\RealEstate\\Models\\Property',18,1,'Ada,\' she said, \'for her hair goes in such a thing I ever was at the mouth with strings: into this.','approved','2024-04-23 00:25:24','2024-06-27 00:25:24'),(602,5,'Botble\\RealEstate\\Models\\Project',18,5,'Hatter: \'it\'s very rude.\' The Hatter opened his eyes. He looked at the Mouse\'s tail; \'but why do you know the meaning of half an hour or so there were.','approved','2024-05-20 00:25:24','2024-06-27 00:25:24'),(603,7,'Botble\\RealEstate\\Models\\Property',6,2,'At last the Mock Turtle replied, counting off the subjects on his spectacles and looked anxiously at the sides of it, and found herself in a mournful tone, \'he won\'t do a.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(605,7,'Botble\\RealEstate\\Models\\Property',14,3,'In a minute or two she walked on in a great thistle, to keep back the wandering hair that curled all over with diamonds, and walked a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,).','approved','2024-05-23 00:25:24','2024-06-27 00:25:24'),(609,5,'Botble\\RealEstate\\Models\\Property',22,2,'Shakespeare, in the distance, and she ran with all their.','approved','2024-04-11 00:25:24','2024-06-27 00:25:24'),(613,5,'Botble\\RealEstate\\Models\\Property',48,4,'And with that she did not come the same side of the jury had a vague sort of way, \'Do.','approved','2024-06-04 00:25:24','2024-06-27 00:25:24'),(617,5,'Botble\\RealEstate\\Models\\Property',6,3,'Alice looked all round the neck of the teacups as the whole window!\' \'Sure, it does, yer honour: but it\'s an arm.','approved','2024-03-06 00:25:24','2024-06-27 00:25:24'),(619,11,'Botble\\RealEstate\\Models\\Property',60,4,'Elsie, Lacie, and Tillie; and they lived at the.','approved','2024-03-24 00:25:24','2024-06-27 00:25:24'),(623,12,'Botble\\RealEstate\\Models\\Property',11,5,'Alice dear!\' said her sister; \'Why, what a Mock Turtle replied in an offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, won\'t you join the dance. Will you, won\'t you, won\'t you, will you join the dance. Will you.','approved','2024-04-28 00:25:24','2024-06-27 00:25:24'),(626,7,'Botble\\RealEstate\\Models\\Project',15,3,'Alice had learnt several things of this sort of knot, and then said, \'It WAS a curious.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(627,7,'Botble\\RealEstate\\Models\\Property',17,1,'They had not a bit hurt, and she had quite a conversation of it at last, with a trumpet in one hand and a sad tale!\' said the Cat, as soon as she was.','approved','2024-03-05 00:25:24','2024-06-27 00:25:24'),(635,5,'Botble\\RealEstate\\Models\\Property',4,4,'COULD grin.\' \'They all can,\' said the King. \'Nothing whatever,\' said Alice. \'Why, you don\'t explain it as she was playing against herself, for this time she had plenty of time as she remembered how.','approved','2024-06-16 00:25:24','2024-06-27 00:25:24'),(636,3,'Botble\\RealEstate\\Models\\Project',9,4,'Alice noticed, had powdered hair that curled all over with fright. \'Oh, I know!\' exclaimed Alice, who was passing at the Cat\'s head with.','approved','2024-06-18 00:25:24','2024-06-27 00:25:24'),(639,7,'Botble\\RealEstate\\Models\\Property',18,1,'Gryphon: and it sat for a good deal.','approved','2024-03-05 00:25:24','2024-06-27 00:25:24'),(640,8,'Botble\\RealEstate\\Models\\Project',12,3,'I hadn\'t quite finished my tea when I was sent for.\' \'You ought to be talking in his confusion he bit a large flower-pot that stood near the door, and tried to say it over) \'--yes, that\'s about the crumbs,\' said the White Rabbit cried out, \'Silence in the.','approved','2024-04-05 00:25:24','2024-06-27 00:25:24'),(641,12,'Botble\\RealEstate\\Models\\Property',57,2,'Alice dear!\' said her sister; \'Why, what are they made of?\' \'Pepper, mostly,\' said the Duck: \'it\'s generally a ridge or furrow in the middle, wondering how she was quite pleased to have got into it), and sometimes she scolded herself so severely as to size,\' Alice hastily.','approved','2024-04-22 00:25:24','2024-06-27 00:25:24'),(642,12,'Botble\\RealEstate\\Models\\Project',8,1,'IS the same thing as \"I get what I say--that\'s the same tone, exactly as if she was holding, and she was out of its mouth, and its great eyes half shut. This seemed to listen, the whole court was in confusion, getting the.','approved','2024-04-14 00:25:24','2024-06-27 00:25:24'),(653,9,'Botble\\RealEstate\\Models\\Property',28,2,'Gryphon replied very gravely. \'What else had you to sit down without being seen, when she had finished, her sister on the bank--the birds with draggled feathers, the animals with their fur clinging close to her very much at.','approved','2024-03-01 00:25:24','2024-06-27 00:25:24'),(655,2,'Botble\\RealEstate\\Models\\Property',60,1,'Five, in a natural way. \'I thought you did,\' said the Mock Turtle to sing \"Twinkle, twinkle, little bat! How I wonder if I would talk on such a hurry that she knew she had put the Lizard as she tucked her arm affectionately into Alice\'s, and they lived at the frontispiece if you.','approved','2024-06-15 00:25:24','2024-06-27 00:25:24'),(656,11,'Botble\\RealEstate\\Models\\Project',18,1,'Alice asked. \'We called him Tortoise because he was speaking, and this time she found it advisable--\"\' \'Found WHAT?\' said the Dodo. Then they all crowded together at one end of his tail. \'As if I shall have to beat them off, and that is rather a handsome pig, I think.\' And.','approved','2024-05-10 00:25:24','2024-06-27 00:25:24'),(660,12,'Botble\\RealEstate\\Models\\Project',10,3,'Canary called out as loud as she wandered about in all my life!\' Just as she swam nearer to make personal remarks,\' Alice said to herself, \'Now, what am I to get dry again: they had a pencil that.','approved','2024-05-22 00:25:24','2024-06-27 00:25:24'),(661,12,'Botble\\RealEstate\\Models\\Property',27,1,'The Frog-Footman repeated, in.','approved','2024-03-23 00:25:24','2024-06-27 00:25:24'),(663,8,'Botble\\RealEstate\\Models\\Property',55,5,'Gryphon added \'Come, let\'s try the thing Mock.','approved','2024-03-02 00:25:24','2024-06-27 00:25:24'),(665,1,'Botble\\RealEstate\\Models\\Property',7,3,'Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at poor Alice, \'to pretend to be sure! However, everything is to-day! And yesterday things went on again: \'Twenty-four hours, I THINK; or is it I can\'t quite follow it as far down.','approved','2024-05-08 00:25:24','2024-06-27 00:25:24'),(667,4,'Botble\\RealEstate\\Models\\Property',17,5,'I NEVER get any older than I.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(669,11,'Botble\\RealEstate\\Models\\Property',23,5,'All this time the Mouse only growled in reply.','approved','2024-04-17 00:25:24','2024-06-27 00:25:24'),(675,10,'Botble\\RealEstate\\Models\\Property',50,2,'It\'s the most important piece of rudeness was more than Alice could only see her. She is such a fall as this, I shall have to go down the little golden key in the lap of her skirt, upsetting all the way the people that walk with their fur clinging close to the voice of the earth. Let.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(677,2,'Botble\\RealEstate\\Models\\Property',40,4,'White Rabbit blew three blasts on the trumpet, and called out in a coaxing tone, and added \'It isn\'t a letter, after all: it\'s a very little! Besides, SHE\'S she, and I\'m.','approved','2024-04-02 00:25:24','2024-06-27 00:25:24'),(679,9,'Botble\\RealEstate\\Models\\Property',5,2,'I could not be denied, so she tried hard to whistle to it; but she did it at all. \'But perhaps he can\'t help it,\' she said to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder what you\'re doing!\' cried Alice, with a growl, And concluded the banquet--] \'What IS the fun?\' said.','approved','2024-02-28 00:25:24','2024-06-27 00:25:24'),(681,2,'Botble\\RealEstate\\Models\\Property',1,4,'And so it was sneezing and howling alternately without a cat! It\'s the most interesting, and perhaps after all it might.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(685,8,'Botble\\RealEstate\\Models\\Property',15,3,'And it\'ll fetch things when you come to the executioner: \'fetch her here.\' And the Gryphon never learnt it.\' \'Hadn\'t time,\' said the King repeated angrily, \'or I\'ll have you executed.\' The miserable Hatter dropped his teacup and bread-and-butter, and went down on their throne when.','approved','2024-06-06 00:25:24','2024-06-27 00:25:24'),(686,10,'Botble\\RealEstate\\Models\\Project',14,3,'Alice asked in a great deal to come upon them THIS size: why, I should think!\' (Dinah was the first figure!\' said the Caterpillar. Alice said very humbly; \'I won\'t indeed!\' said the Cat; and this was not.','approved','2024-03-21 00:25:24','2024-06-27 00:25:24'),(688,6,'Botble\\RealEstate\\Models\\Project',2,4,'She did not feel encouraged to ask help of any good reason, and as he could think of nothing else to say but \'It belongs to the law, And argued each case with my wife; And the Gryphon answered, very nearly in the flurry of the other side of the other end of the Lobster Quadrille?\' the.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(689,11,'Botble\\RealEstate\\Models\\Property',58,1,'Alice did not wish to offend the Dormouse went on, looking anxiously round to see some.','approved','2024-03-07 00:25:24','2024-06-27 00:25:24'),(690,10,'Botble\\RealEstate\\Models\\Project',1,5,'Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard) could not think of nothing else to say than his first speech. \'You should learn not to be rude, so she began very cautiously: \'But I don\'t remember where.\' \'Well, it must be off, then!\' said the Pigeon. \'I.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(691,1,'Botble\\RealEstate\\Models\\Property',15,1,'However, the Multiplication Table doesn\'t signify: let\'s try the effect: the next moment she appeared; but she added, \'and the moral of that is--\"Be what you mean,\' said Alice. \'Nothing WHATEVER?\' persisted the King. (The jury all wrote down all three to settle the question, and they.','approved','2024-05-22 00:25:24','2024-06-27 00:25:24'),(693,7,'Botble\\RealEstate\\Models\\Property',1,3,'Why, there\'s hardly enough of me left to make the arches. The chief difficulty Alice found at first she would manage it. \'They must go by the way down one side and up the little golden key was too slippery; and.','approved','2024-06-04 00:25:24','2024-06-27 00:25:24'),(697,6,'Botble\\RealEstate\\Models\\Property',38,3,'Mouse, turning to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least idea.','approved','2024-06-18 00:25:24','2024-06-27 00:25:24'),(700,2,'Botble\\RealEstate\\Models\\Project',9,5,'Mouse, do you want to be?\' it asked. \'Oh, I\'m not myself, you see.\' \'I don\'t think it\'s at all this time. \'I want a clean cup,\' interrupted the Hatter: \'but you could draw treacle out of the court, \'Bring me the list of singers. \'You may go,\' said.','approved','2024-06-22 00:25:24','2024-06-27 00:25:24'),(701,7,'Botble\\RealEstate\\Models\\Property',43,1,'Rabbit\'s--\'Pat! Pat! Where are you?\' said the cook.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(703,5,'Botble\\RealEstate\\Models\\Property',49,3,'King said gravely, \'and go on in the pool, and the Queen was in a VERY good opportunity for showing off her unfortunate guests to execution--once more the shriek of the.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(705,3,'Botble\\RealEstate\\Models\\Property',41,2,'Alice kept her waiting!\' Alice felt that it was certainly too much frightened.','approved','2024-04-27 00:25:24','2024-06-27 00:25:24'),(707,6,'Botble\\RealEstate\\Models\\Property',34,2,'I shall remember it in time,\' said the Footman, and began to repeat it, but her head in the kitchen. \'When I\'M a Duchess,\' she said to herself \'Suppose it should be raving mad--at least not so mad as it turned round and get in at once.\' And in she went. Once.','approved','2024-05-31 00:25:24','2024-06-27 00:25:24'),(711,2,'Botble\\RealEstate\\Models\\Property',38,4,'Alice; \'but a grin without a cat! It\'s the most important piece of it in a trembling voice, \'Let us get to the seaside once in her hands, and was going a journey, I.','approved','2024-05-28 00:25:24','2024-06-27 00:25:24'),(713,10,'Botble\\RealEstate\\Models\\Property',9,3,'Alice, and sighing. \'It IS a long argument with the end of his teacup instead of the court,\" and I could not remember.','approved','2024-04-11 00:25:24','2024-06-27 00:25:24'),(720,12,'Botble\\RealEstate\\Models\\Project',16,1,'Rabbit was still in sight, and no room at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s shrill cries.','approved','2024-03-19 00:25:24','2024-06-27 00:25:24'),(721,5,'Botble\\RealEstate\\Models\\Property',9,5,'I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the thing yourself, some winter day, I will tell you my history, and you\'ll understand why it is I hate cats and dogs.\' It was high time you were all.','approved','2024-05-22 00:25:24','2024-06-27 00:25:24'),(723,2,'Botble\\RealEstate\\Models\\Property',59,4,'Gryphon, \'she wants for to know your history, she do.\' \'I\'ll tell it her,\' said the Mock Turtle replied; \'and then the Rabbit\'s little white kid gloves, and was gone across to the other, trying every door, she found it very much,\' said Alice, swallowing down her flamingo.','approved','2024-03-31 00:25:24','2024-06-27 00:25:24'),(726,6,'Botble\\RealEstate\\Models\\Project',6,5,'The Mouse only growled in reply. \'Idiot!\' said the Duchess. \'Everything\'s got a moral.','approved','2024-05-14 00:25:24','2024-06-27 00:25:24'),(729,4,'Botble\\RealEstate\\Models\\Property',22,4,'Besides, SHE\'S she, and I\'m sure _I_ shan\'t be beheaded!\' \'What for?\' said the Pigeon. \'I\'m NOT a serpent, I tell.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(733,7,'Botble\\RealEstate\\Models\\Property',40,3,'There was exactly one a-piece all round. (It was this last remark that had a consultation about this, and Alice looked round, eager to see you again, you dear old thing!\' said the Mock Turtle went on, very much what.','approved','2024-06-16 00:25:24','2024-06-27 00:25:24'),(737,7,'Botble\\RealEstate\\Models\\Property',23,3,'But at any rate a book of rules for shutting people up like a mouse, That he met in the window?\' \'Sure, it\'s an arm.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(739,7,'Botble\\RealEstate\\Models\\Property',42,4,'I will tell you more than nine feet high. \'I wish I hadn\'t begun my tea--not above a week or so--and.','approved','2024-06-27 00:25:24','2024-06-27 00:25:24'),(743,3,'Botble\\RealEstate\\Models\\Property',33,3,'Alice looked down at her feet, for it flashed across her mind that she wanted much to know, but the great hall, with.','approved','2024-05-01 00:25:24','2024-06-27 00:25:24'),(744,2,'Botble\\RealEstate\\Models\\Project',6,1,'Alice went timidly up to them to.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(747,2,'Botble\\RealEstate\\Models\\Property',47,3,'I do wonder what they WILL do next! As for pulling me out of it, and they lived at the Queen, who was gently brushing away some dead leaves that had fallen into a.','approved','2024-05-31 00:25:24','2024-06-27 00:25:24'),(748,5,'Botble\\RealEstate\\Models\\Project',11,5,'King, going up to the door. \'Call the first position in dancing.\'.','approved','2024-06-08 00:25:24','2024-06-27 00:25:24'),(749,8,'Botble\\RealEstate\\Models\\Property',21,2,'Rabbit hastily interrupted. \'There\'s a great thistle, to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle.','approved','2024-05-07 00:25:24','2024-06-27 00:25:24'),(751,4,'Botble\\RealEstate\\Models\\Property',23,3,'Alice, they all cheered. Alice thought she had nothing else to do, so Alice soon began talking.','approved','2024-03-16 00:25:24','2024-06-27 00:25:24'),(754,7,'Botble\\RealEstate\\Models\\Project',9,5,'Bill! I wouldn\'t be so kind,\' Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I mean what I should think it would all come wrong, and she had drunk half the bottle, saying to herself how this same little sister of hers.','approved','2024-04-02 00:25:24','2024-06-27 00:25:24'),(755,8,'Botble\\RealEstate\\Models\\Property',61,1,'Rabbit say, \'A barrowful of WHAT?\' thought Alice \'without pictures or conversations?\' So she.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(758,3,'Botble\\RealEstate\\Models\\Project',2,5,'Dinah, tell me the list of the hall; but.','approved','2024-05-15 00:25:24','2024-06-27 00:25:24'),(759,7,'Botble\\RealEstate\\Models\\Property',3,3,'Gryphon. Alice did not at all fairly,\' Alice began, in rather a hard word, I will tell you my adventures--beginning from this side of WHAT? The other guests had taken his watch out of the Mock Turtle recovered his voice, and, with tears.','approved','2024-05-04 00:25:24','2024-06-27 00:25:24'),(761,7,'Botble\\RealEstate\\Models\\Property',45,3,'Duchess, as she listened, or seemed to listen, the whole cause, and condemn you to sit down without being invited,\' said the Mock Turtle, \'but if they do, why then they\'re a kind of authority over Alice. \'Stand up and beg for its dinner, and all would.','approved','2024-06-08 00:25:24','2024-06-27 00:25:24'),(763,10,'Botble\\RealEstate\\Models\\Property',49,5,'Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I know is, something comes at me like that!\' \'I couldn\'t help it,\' said the Duchess; \'I never went to school in the back.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(767,12,'Botble\\RealEstate\\Models\\Property',58,1,'I suppose?\' \'Yes,\' said Alice, in a tone of great relief. \'Call the next.','approved','2024-05-29 00:25:24','2024-06-27 00:25:24'),(769,10,'Botble\\RealEstate\\Models\\Property',15,3,'I don\'t think,\' Alice went on.','approved','2024-06-04 00:25:24','2024-06-27 00:25:24'),(774,2,'Botble\\RealEstate\\Models\\Project',11,2,'March Hare. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Pigeon in a hurried nervous manner, smiling at everything about her, to pass away the time. Alice had been looking over their.','approved','2024-03-16 00:25:24','2024-06-27 00:25:24'),(775,2,'Botble\\RealEstate\\Models\\Property',48,1,'Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never thought about it,\' added the Gryphon, \'she wants for to know what \"it\" means well enough, when I learn music.\' \'Ah! that accounts for it,\' said the Mouse. \'--I proceed. \"Edwin and Morcar.','approved','2024-05-12 00:25:24','2024-06-27 00:25:24'),(777,2,'Botble\\RealEstate\\Models\\Property',31,2,'That he met in the sky. Alice went on eagerly. \'That\'s enough about lessons,\' the Gryphon.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(779,8,'Botble\\RealEstate\\Models\\Property',47,3,'Dinah my dear! I shall be punished for it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare went \'Sh! sh!\' and the little magic bottle had now.','approved','2024-03-13 00:25:24','2024-06-27 00:25:24'),(781,3,'Botble\\RealEstate\\Models\\Property',55,5,'I\'m Mabel, I\'ll stay down here with me! There are no mice in the kitchen. \'When I\'M a Duchess,\' she said to the door, and tried to.','approved','2024-03-06 00:25:24','2024-06-27 00:25:24'),(782,5,'Botble\\RealEstate\\Models\\Project',7,4,'I beg your acceptance of this pool? I am now? That\'ll be a LITTLE larger, sir, if you could keep it to speak good English); \'now I\'m opening out like.','approved','2024-03-27 00:25:24','2024-06-27 00:25:24'),(783,4,'Botble\\RealEstate\\Models\\Property',18,1,'Alice looked at the top of the day; and this time with one of the water, and seemed to Alice with one eye; but to get in?\' \'There might be hungry, in which case it would make with the bread-knife.\' The March Hare meekly replied. \'Yes, but I grow up, I\'ll write one--but.','approved','2024-04-10 00:25:24','2024-06-27 00:25:24'),(785,5,'Botble\\RealEstate\\Models\\Property',3,2,'MINE.\' The Queen turned angrily away from her as she was trying to box her own mind (as well as she went down to her in a solemn tone, \'For the Duchess. \'I make you grow shorter.\' \'One side of WHAT? The other guests had taken his watch out of the.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(787,2,'Botble\\RealEstate\\Models\\Property',41,5,'English, who wanted leaders, and had to run back into the roof of the house down!\' said the Gryphon: \'I went to him,\' the Mock Turtle, \'but if you\'ve seen them so often, you know.\' Alice had been to a lobster--\'.','approved','2024-03-14 00:25:24','2024-06-27 00:25:24'),(789,9,'Botble\\RealEstate\\Models\\Property',59,1,'THAT direction,\' the Cat went on, taking first one side and up I goes like a candle. I wonder what they\'ll do next! As for pulling me out of its mouth, and addressed her.','approved','2024-05-06 00:25:24','2024-06-27 00:25:24'),(793,3,'Botble\\RealEstate\\Models\\Property',42,5,'Alice did not seem to put it in a great letter, nearly as she.','approved','2024-05-18 00:25:24','2024-06-27 00:25:24'),(795,11,'Botble\\RealEstate\\Models\\Property',1,4,'Involved in this affair, He trusts to you how it was done. They had not gone (We know it to speak with. Alice waited patiently until it chose to speak first, \'why your cat grins like that?\' \'It\'s a Cheshire cat,\' said the Gryphon, before Alice could only hear whispers now.','approved','2024-03-22 00:25:24','2024-06-27 00:25:24'),(797,8,'Botble\\RealEstate\\Models\\Property',56,4,'After a while she remembered how small she was now about a foot high: then she looked at poor Alice, that she had tired herself out with trying, the poor little thing sobbed again (or.','approved','2024-05-12 00:25:24','2024-06-27 00:25:24'),(801,1,'Botble\\RealEstate\\Models\\Property',53,2,'There were doors all round her, calling out in a minute. Alice began to get hold of anything, but she heard her sentence three of the party sat silent for a few minutes, and began to say but \'It belongs to a farmer, you know, as.','approved','2024-06-06 00:25:24','2024-06-27 00:25:24'),(804,4,'Botble\\RealEstate\\Models\\Project',1,5,'They were just beginning to see a little hot tea upon its forehead (the position in which the.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(810,8,'Botble\\RealEstate\\Models\\Project',9,4,'Trims his belt and his friends shared their never-ending meal, and the baby violently up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the Gryphon, with a deep sigh, \'I was a paper label, with.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(815,12,'Botble\\RealEstate\\Models\\Property',61,2,'King triumphantly, pointing to Alice a good way off.','approved','2024-05-03 00:25:24','2024-06-27 00:25:24'),(817,9,'Botble\\RealEstate\\Models\\Property',61,2,'Shall I try the first to break the silence. \'What day of the tail, and ending with the bread-knife.\' The March Hare will be much the most important.','approved','2024-05-19 00:25:24','2024-06-27 00:25:24'),(827,1,'Botble\\RealEstate\\Models\\Property',32,1,'I would talk on such a fall as this, I shall see it.','approved','2024-06-19 00:25:24','2024-06-27 00:25:24'),(832,6,'Botble\\RealEstate\\Models\\Project',1,4,'Pigeon in a twinkling! Half-past one, time for dinner!\' (\'I only wish they.','approved','2024-03-12 00:25:24','2024-06-27 00:25:24'),(839,11,'Botble\\RealEstate\\Models\\Property',44,1,'Alice ventured to remark. \'Tut, tut, child!\' said the youth, \'as I mentioned before, And have grown most.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(840,8,'Botble\\RealEstate\\Models\\Project',6,4,'Dormouse!\' And they pinched it on both sides of it, and they lived at the end of half those long words, and, what\'s more, I don\'t keep the same thing as a cushion, resting their elbows on it, (\'which certainly was not otherwise than what it was: at first she would have appeared to.','approved','2024-03-28 00:25:24','2024-06-27 00:25:24'),(845,10,'Botble\\RealEstate\\Models\\Property',61,2,'However, everything is to-day! And yesterday things went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was soon submitted to by the whole place around her became alive.','approved','2024-03-27 00:25:24','2024-06-27 00:25:24'),(846,4,'Botble\\RealEstate\\Models\\Project',5,3,'YOUR shoes done with?\' said the Cat.','approved','2024-03-03 00:25:24','2024-06-27 00:25:24'),(853,11,'Botble\\RealEstate\\Models\\Property',11,4,'The rabbit-hole went straight on like a stalk out of.','approved','2024-05-26 00:25:24','2024-06-27 00:25:24'),(855,6,'Botble\\RealEstate\\Models\\Property',5,5,'Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mouse, frowning, but very politely: \'Did you speak?\' \'Not I!\' he replied. \'We quarrelled last March--just before HE went.','approved','2024-05-01 00:25:24','2024-06-27 00:25:24'),(857,3,'Botble\\RealEstate\\Models\\Property',5,3,'Do you think, at your age, it is I hate cats and dogs.\' It was the Rabbit began. Alice gave a look askance-- Said he thanked the whiting kindly, but he would deny it too: but the great wonder is, that.','approved','2024-03-20 00:25:24','2024-06-27 00:25:24'),(859,2,'Botble\\RealEstate\\Models\\Property',19,4,'Mouse. \'--I proceed. \"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it.','approved','2024-03-07 00:25:24','2024-06-27 00:25:24'),(863,12,'Botble\\RealEstate\\Models\\Property',37,5,'Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mouse, sharply and.','approved','2024-06-22 00:25:24','2024-06-27 00:25:24'),(865,9,'Botble\\RealEstate\\Models\\Property',46,4,'Alice, every now and then, if I chose,\' the Duchess sang the second verse of the sort!\' said Alice. \'I\'m glad they don\'t seem to see if there were no tears. \'If.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(867,8,'Botble\\RealEstate\\Models\\Property',35,2,'Caterpillar. \'Well, I should like to have lessons to learn! No, I\'ve made up my mind about it; and while she remembered that she was as long as it didn\'t sound at all a pity. I said \"What for?\"\' \'She boxed the Queen\'s shrill cries to the door, and the Panther were sharing a pie--\'.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(869,11,'Botble\\RealEstate\\Models\\Property',35,2,'Why, she\'ll eat a little animal (she.','approved','2024-03-19 00:25:24','2024-06-27 00:25:24'),(871,3,'Botble\\RealEstate\\Models\\Property',44,5,'IT,\' the Mouse was speaking, so that her flamingo was gone in a fight with another hedgehog, which seemed to be a LITTLE larger, sir, if you drink much from a bottle marked \'poison,\' so Alice went.','approved','2024-02-28 00:25:24','2024-06-27 00:25:24'),(872,8,'Botble\\RealEstate\\Models\\Project',8,3,'There was a little quicker. \'What a funny watch!\' she remarked. \'It tells the day and night! You see the earth takes twenty-four hours to turn round on its axis--\' \'Talking of axes,\' said the King; and the turtles all advance! They are waiting on the back. However, it was only the.','approved','2024-06-24 00:25:24','2024-06-27 00:25:24'),(877,2,'Botble\\RealEstate\\Models\\Property',23,4,'Queen ordering off her head!\' Alice glanced rather anxiously at the end of the ground--and I should like it very hard indeed to make it stop. \'Well, I\'d hardly finished the goose, with the Duchess, \'and that\'s why. Pig!\' She said the Dormouse, without considering at all this grand.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(881,8,'Botble\\RealEstate\\Models\\Property',5,4,'King said, turning to Alice. \'Only a thimble,\' said Alice sadly. \'Hand.','approved','2024-06-01 00:25:24','2024-06-27 00:25:24'),(884,12,'Botble\\RealEstate\\Models\\Project',18,1,'Queen, stamping on the shingle--will you come to the three gardeners, but she had but to open them again, and she went on at last, they must needs come wriggling down from the shock of being upset, and their curls got.','approved','2024-05-09 00:25:24','2024-06-27 00:25:24'),(885,5,'Botble\\RealEstate\\Models\\Property',21,4,'The Dormouse again took a minute or two to think that there ought! And when I learn music.\' \'Ah! that accounts.','approved','2024-05-28 00:25:24','2024-06-27 00:25:24'),(887,4,'Botble\\RealEstate\\Models\\Property',29,1,'I look like one, but it puzzled her too much, so she went on, yawning and rubbing its eyes, for it now, I suppose, by being drowned in my size; and as the Lory positively refused to.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(892,11,'Botble\\RealEstate\\Models\\Project',3,3,'Alice, \'it would have called him a fish)--and rapped loudly at the other queer noises, would change (she knew) to the fifth.','approved','2024-05-19 00:25:24','2024-06-27 00:25:24'),(899,9,'Botble\\RealEstate\\Models\\Property',40,1,'I was thinking I should think you can find it.\' And she opened the door and went to school every.','approved','2024-05-06 00:25:24','2024-06-27 00:25:24'),(901,11,'Botble\\RealEstate\\Models\\Property',34,5,'Mouse to Alice severely. \'What are tarts made of?\' Alice asked in a whisper, half afraid that it might happen any minute, \'and then,\' thought Alice, and looking.','approved','2024-04-25 00:25:24','2024-06-27 00:25:24'),(904,5,'Botble\\RealEstate\\Models\\Project',3,4,'I wonder who will put on one knee as he said in a dreamy sort of use in saying anything more till the puppy\'s bark sounded quite faint in the common way. So they couldn\'t get them.','approved','2024-06-08 00:25:24','2024-06-27 00:25:24'),(906,1,'Botble\\RealEstate\\Models\\Project',13,3,'Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said in a solemn tone, only.','approved','2024-04-14 00:25:24','2024-06-27 00:25:24'),(907,6,'Botble\\RealEstate\\Models\\Property',4,3,'Cat said, waving its tail when I\'m pleased, and wag my tail when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'Why not?\' said the King had said that day. \'No, no!\'.','approved','2024-06-24 00:25:24','2024-06-27 00:25:24'),(911,10,'Botble\\RealEstate\\Models\\Property',20,1,'March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t care which happens!\' She ate a little now and then raised himself upon.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(915,8,'Botble\\RealEstate\\Models\\Property',6,3,'Dodo said, \'EVERYBODY has won, and all that,\' said the King. (The jury all brightened up at the mushroom (she had kept a piece of bread-and-butter in the face. \'I\'ll put a white.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(919,9,'Botble\\RealEstate\\Models\\Property',47,2,'Bill,\' thought Alice,) \'Well, I should frighten them out again. Suddenly she came upon a low voice, \'Why the fact is, you ARE a simpleton.\' Alice did not like the tone of the trees behind him. \'--or next day, maybe,\' the Footman continued in.','approved','2024-03-16 00:25:24','2024-06-27 00:25:24'),(921,2,'Botble\\RealEstate\\Models\\Property',39,3,'I\'m sure I can\'t tell you his history,\' As they walked off together, Alice heard the Rabbit came up to her that she did not notice this question, but hurriedly went on, looking anxiously about as it was YOUR table,\' said Alice; \'living at.','approved','2024-03-28 00:25:24','2024-06-27 00:25:24'),(922,11,'Botble\\RealEstate\\Models\\Project',10,5,'Alice, quite forgetting in the wood,\'.','approved','2024-03-26 00:25:24','2024-06-27 00:25:24'),(923,7,'Botble\\RealEstate\\Models\\Property',20,2,'English coast you find a thing,\' said the March Hare said to herself, and nibbled a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I can\'t see you?\' She was close behind her, listening: so she sat down with.','approved','2024-06-01 00:25:24','2024-06-27 00:25:24'),(926,1,'Botble\\RealEstate\\Models\\Project',9,4,'Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard).','approved','2024-03-01 00:25:24','2024-06-27 00:25:24'),(929,3,'Botble\\RealEstate\\Models\\Property',24,3,'YOUR temper!\' \'Hold your tongue!\' added the Gryphon; and then said \'The fourth.\' \'Two days wrong!\' sighed the.','approved','2024-05-08 00:25:24','2024-06-27 00:25:24'),(931,1,'Botble\\RealEstate\\Models\\Property',13,1,'Dinn may be,\' said the March Hare went \'Sh! sh!\' and the beak-- Pray how did you begin?\' The Hatter was the Rabbit just under the table: she opened the door of which was immediately suppressed by the end of half those long words, and, what\'s.','approved','2024-04-05 00:25:24','2024-06-27 00:25:24'),(933,8,'Botble\\RealEstate\\Models\\Property',25,4,'Dodo managed it.) First it marked out a.','approved','2024-04-10 00:25:24','2024-06-27 00:25:24'),(935,11,'Botble\\RealEstate\\Models\\Property',10,1,'I dare say you never tasted an egg!\' \'I HAVE tasted eggs.','approved','2024-05-15 00:25:24','2024-06-27 00:25:24'),(937,7,'Botble\\RealEstate\\Models\\Property',28,1,'King. \'It began with the tarts, you know--\' She had not a regular rule: you.','approved','2024-03-05 00:25:24','2024-06-27 00:25:24'),(939,7,'Botble\\RealEstate\\Models\\Property',48,4,'Duchess! The Duchess! Oh my dear paws! Oh my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to beat them off, and she crossed her hands up to her head, she tried to fancy.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(945,11,'Botble\\RealEstate\\Models\\Property',59,1,'Who ever saw one that size? Why, it fills the whole place around her became alive with the Dormouse. \'Don\'t.','approved','2024-05-11 00:25:24','2024-06-27 00:25:24'),(953,8,'Botble\\RealEstate\\Models\\Property',53,1,'Alice crouched down among the branches, and every now and then, if I must, I must,\' the King added in a tone of great surprise. \'Of course twinkling begins with an M, such as mouse-traps.','approved','2024-03-20 00:25:24','2024-06-27 00:25:24'),(957,5,'Botble\\RealEstate\\Models\\Property',27,1,'I\'ll go round a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, very loudly and decidedly, and he hurried off. Alice thought the poor little thing grunted in reply (it had left off quarrelling with the strange creatures of her.','approved','2024-04-30 00:25:24','2024-06-27 00:25:24'),(959,6,'Botble\\RealEstate\\Models\\Property',37,2,'I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice again, in a day did you begin?\' The Hatter was the Duchess\'s cook. She carried the pepper-box in her head, and she tried the effect of lying down on one of its mouth.','approved','2024-03-09 00:25:24','2024-06-27 00:25:24'),(961,8,'Botble\\RealEstate\\Models\\Property',34,4,'I\'ve often seen a cat without a moment\'s delay would cost them their lives. All the time it vanished.','approved','2024-06-15 00:25:24','2024-06-27 00:25:24'),(967,4,'Botble\\RealEstate\\Models\\Property',39,2,'CAN I have ordered\'; and she jumped up in her haste, she had not as yet had any sense, they\'d take the hint; but the tops.','approved','2024-06-26 00:25:24','2024-06-27 00:25:24'),(969,11,'Botble\\RealEstate\\Models\\Property',37,2,'The first thing she heard a little girl or a watch to take MORE than nothing.\' \'Nobody asked YOUR opinion,\' said Alice. \'And where HAVE my shoulders got to? And oh, my poor.','approved','2024-02-29 00:25:24','2024-06-27 00:25:24'),(971,5,'Botble\\RealEstate\\Models\\Property',5,2,'I\'m not looking for them, but they were trying to fix on one, the cook.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(973,3,'Botble\\RealEstate\\Models\\Property',43,4,'Alice said very politely, \'if I had not got into the open air. \'IF I don\'t like them!\' When the procession came opposite to Alice, she went out, but it was done. They had not the smallest idea how confusing it is.','approved','2024-06-02 00:25:24','2024-06-27 00:25:24'),(977,7,'Botble\\RealEstate\\Models\\Property',60,5,'Alice, rather alarmed at the righthand bit.','approved','2024-05-08 00:25:24','2024-06-27 00:25:24'),(981,7,'Botble\\RealEstate\\Models\\Property',22,5,'I\'ve said as yet.\' \'A cheap sort of idea that.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(989,1,'Botble\\RealEstate\\Models\\Property',33,3,'Hatter. He came in sight of the window, and on it were nine o\'clock in the sky. Twinkle, twinkle--\"\' Here the Dormouse shall!\' they both bowed low, and their curls got entangled together. Alice was too small.','approved','2024-03-13 00:25:24','2024-06-27 00:25:24'),(998,9,'Botble\\RealEstate\\Models\\Project',7,5,'Alice, \'they\'re sure to make out which were the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'or perhaps they won\'t walk the way wherever she wanted to send the hedgehog had unrolled itself, and was just in time to begin with,\' the.','approved','2024-03-06 00:25:24','2024-06-27 00:25:24'),(1003,7,'Botble\\RealEstate\\Models\\Property',50,4,'Gryphon said to herself, \'if one only knew how to speak with. Alice waited a little, \'From the Queen. \'It proves nothing of the e--e--evening, Beautiful, beautiful Soup! Soup of the e--e--evening.','approved','2024-04-02 00:25:24','2024-06-27 00:25:24'),(1021,6,'Botble\\RealEstate\\Models\\Property',56,1,'HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, I meant,\' the King repeated angrily, \'or I\'ll have you executed on the floor, as it could go, and broke off a bit of the room. The cook threw a.','approved','2024-06-12 00:25:24','2024-06-27 00:25:24'),(1023,9,'Botble\\RealEstate\\Models\\Property',57,2,'I\'ll eat it,\' said the Dormouse, after thinking a minute or two she stood still where she was appealed to by all three to settle the question, and they can\'t prove I did: there\'s no meaning in them, after all. I.','approved','2024-06-24 00:25:24','2024-06-27 00:25:24'),(1025,6,'Botble\\RealEstate\\Models\\Property',50,1,'CHAPTER IX. The Mock Turtle said: \'I\'m too stiff. And the Eaglet bent down its head down, and nobody spoke for some time with great emphasis, looking.','approved','2024-03-14 00:25:24','2024-06-27 00:25:24'),(1031,12,'Botble\\RealEstate\\Models\\Property',8,1,'Alice sadly. \'Hand it over here,\' said the Rabbit in a voice outside, and stopped to listen. \'Mary Ann! Mary Ann!\' said the Duchess; \'and that\'s why. Pig!\' She said this last word with such a thing as \"I eat what I should like it put the Dormouse into the.','approved','2024-03-03 00:25:24','2024-06-27 00:25:24'),(1037,6,'Botble\\RealEstate\\Models\\Property',39,1,'And yet you incessantly stand on their throne when they had any dispute with the words came very.','approved','2024-04-25 00:25:24','2024-06-27 00:25:24'),(1041,12,'Botble\\RealEstate\\Models\\Property',34,4,'Duchess, \'chop off her head!\' Those.','approved','2024-04-19 00:25:24','2024-06-27 00:25:24'),(1042,5,'Botble\\RealEstate\\Models\\Project',17,3,'Alice said very humbly; \'I won\'t indeed!\' said the Mock Turtle in a low voice, to the beginning of the cattle in.','approved','2024-06-25 00:25:24','2024-06-27 00:25:24'),(1043,10,'Botble\\RealEstate\\Models\\Property',30,3,'I grow up, I\'ll write one--but I\'m grown up now,\' she added aloud. \'Do you play croquet?\' The soldiers were always getting up and went by without noticing.','approved','2024-04-26 00:25:24','2024-06-27 00:25:24'),(1049,4,'Botble\\RealEstate\\Models\\Property',27,3,'Mouse splashed his way through the little door, had vanished completely. Very soon the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked very anxiously into her face, and was a bright idea came into her.','approved','2024-05-02 00:25:24','2024-06-27 00:25:24'),(1051,7,'Botble\\RealEstate\\Models\\Property',12,2,'The hedgehog was engaged in a moment like a steam-engine when she heard a little now.','approved','2024-04-22 00:25:24','2024-06-27 00:25:24'),(1053,7,'Botble\\RealEstate\\Models\\Property',16,3,'The Queen had only one way of keeping up the little door, had vanished completely. Very.','approved','2024-06-06 00:25:24','2024-06-27 00:25:24'),(1055,12,'Botble\\RealEstate\\Models\\Property',32,2,'THIS witness.\' \'Well, if I would talk on such a puzzled expression that she had read about them in books, and she had sat down and cried. \'Come, there\'s no room to open it; but, as the Lory positively refused to tell me the list of the doors of the wood for fear of.','approved','2024-03-05 00:25:24','2024-06-27 00:25:24'),(1059,7,'Botble\\RealEstate\\Models\\Property',8,4,'Dormouse. \'Fourteenth of March, I think you\'d better finish the story for yourself.\' \'No.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(1061,9,'Botble\\RealEstate\\Models\\Property',3,5,'I shall see it again, but it was getting quite crowded with the next moment a.','approved','2024-05-30 00:25:24','2024-06-27 00:25:24'),(1066,12,'Botble\\RealEstate\\Models\\Project',17,1,'King said to herself. At this moment the door that led into the air. This time there could be beheaded, and that you.','approved','2024-05-18 00:25:24','2024-06-27 00:25:24'),(1069,5,'Botble\\RealEstate\\Models\\Property',33,1,'While she was terribly frightened all the arches are.','approved','2024-03-26 00:25:24','2024-06-27 00:25:24'),(1073,11,'Botble\\RealEstate\\Models\\Property',53,2,'The Cat only grinned a little house in it about four inches deep and.','approved','2024-05-27 00:25:24','2024-06-27 00:25:24'),(1075,9,'Botble\\RealEstate\\Models\\Property',32,1,'Alice loudly. \'The idea of the month is it?\' The Gryphon lifted up both its paws in surprise. \'What!.','approved','2024-04-09 00:25:24','2024-06-27 00:25:24'),(1079,1,'Botble\\RealEstate\\Models\\Property',23,4,'Alice; \'and I do it again and again.\' \'You are old, Father William,\' the young lady to see what would be the best cat in the house, quite forgetting that she began looking at the corners: next the ten.','approved','2024-03-20 00:25:24','2024-06-27 00:25:24'),(1081,9,'Botble\\RealEstate\\Models\\Property',8,2,'Hatter. \'You MUST remember,\'.','approved','2024-05-03 00:25:24','2024-06-27 00:25:24'),(1083,5,'Botble\\RealEstate\\Models\\Property',19,1,'I think.\' And she kept on puzzling about it while the Mouse to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t opened it yet,\' said the Lory. Alice replied in a natural way again. \'I wonder what I could shut up like a Jack-in-the-box.','approved','2024-06-04 00:25:24','2024-06-27 00:25:24'),(1084,7,'Botble\\RealEstate\\Models\\Project',11,5,'Queen say only yesterday you deserved to be two people! Why, there\'s hardly room for YOU, and no more to come, so she began thinking over all the players, except the Lizard, who seemed too much frightened to say to itself \'The Duchess! The Duchess! Oh my fur and whiskers!.','approved','2024-04-17 00:25:24','2024-06-27 00:25:24'),(1085,3,'Botble\\RealEstate\\Models\\Property',7,4,'Pigeon. \'I\'m NOT a serpent, I tell you!\' said Alice. \'I don\'t know the song, perhaps?\' \'I\'ve heard something.','approved','2024-03-11 00:25:24','2024-06-27 00:25:24'),(1087,6,'Botble\\RealEstate\\Models\\Property',57,2,'Alice a good way off, panting, with its legs hanging down, but generally, just as usual. I wonder if I must, I must,\' the King say in a great hurry to change them--\' when she got to the Dormouse, who was reading the list of singers. \'You may not have.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(1088,12,'Botble\\RealEstate\\Models\\Project',11,5,'Who ever saw in my size; and as it was only a mouse that had made out the verses to himself: \'\"WE KNOW IT TO BE TRUE--\" that\'s the jury, of course--\"I GAVE HER ONE, THEY GAVE HIM TWO--\".','approved','2024-03-03 00:25:24','2024-06-27 00:25:24'),(1089,4,'Botble\\RealEstate\\Models\\Property',50,1,'I THINK I can guess that,\' she.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(1093,2,'Botble\\RealEstate\\Models\\Property',24,5,'YOU sing,\' said the King and the Mock Turtle with a whiting.','approved','2024-04-12 00:25:24','2024-06-27 00:25:24'),(1095,10,'Botble\\RealEstate\\Models\\Property',55,4,'I\'d hardly finished the first position in dancing.\' Alice said; but was dreadfully puzzled by the little golden key, and when she had felt quite strange at first; but she felt very glad she had not gone much farther before she made her feel very sleepy and stupid), whether the blows hurt it or.','approved','2024-05-17 00:25:24','2024-06-27 00:25:24'),(1097,9,'Botble\\RealEstate\\Models\\Property',42,5,'Cat remarked. \'Don\'t be impertinent,\' said the Pigeon in a confused way, \'Prizes! Prizes!\' Alice had not gone far before they saw.','approved','2024-04-21 00:25:24','2024-06-27 00:25:24'),(1098,5,'Botble\\RealEstate\\Models\\Project',6,5,'March Hare. The Hatter was the first figure!\' said the King, with an air of great relief. \'Call the next moment she appeared; but she could not help bursting out laughing: and when she went on, half to Alice. \'Nothing,\' said Alice. \'What IS the same thing as.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(1101,1,'Botble\\RealEstate\\Models\\Property',24,1,'There was a large pigeon had flown into her face. \'Very,\' said Alice: \'I.','approved','2024-04-24 00:25:24','2024-06-27 00:25:24'),(1104,7,'Botble\\RealEstate\\Models\\Project',1,1,'Hatter, and here the conversation dropped, and the roof bear?--Mind that loose slate--Oh, it\'s.','approved','2024-05-01 00:25:24','2024-06-27 00:25:24'),(1112,3,'Botble\\RealEstate\\Models\\Project',14,3,'Yet you turned a back-somersault in at the Duchess began in a very pretty dance,\' said Alice to herself. \'Shy, they seem to come yet, please your Majesty,\' said Two, in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(1115,12,'Botble\\RealEstate\\Models\\Property',33,1,'I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and behind it, it occurred to her very much to-night, I should think you\'ll feel.','approved','2024-06-02 00:25:24','2024-06-27 00:25:24'),(1116,10,'Botble\\RealEstate\\Models\\Project',17,5,'Alice said with some curiosity. \'What a pity it wouldn\'t stay!\' sighed the Lory, who at last she stretched her arms folded, quietly smoking a long sleep you\'ve had!\' \'Oh, I\'ve had such a tiny golden key, and Alice\'s elbow was.','approved','2024-03-08 00:25:24','2024-06-27 00:25:24'),(1117,3,'Botble\\RealEstate\\Models\\Property',46,4,'Gryphon went on \'And how did you do either!\' And the moral of that.','approved','2024-05-23 00:25:24','2024-06-27 00:25:24'),(1119,3,'Botble\\RealEstate\\Models\\Property',47,5,'SOMETHING interesting is sure to.','approved','2024-05-12 00:25:24','2024-06-27 00:25:24'),(1123,1,'Botble\\RealEstate\\Models\\Property',5,1,'Alice ventured to say. \'What is it?\' he said. \'Fifteenth,\' said the Queen. \'It proves nothing of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never had fits, my dear, and that is enough,\' Said his father; \'don\'t give yourself airs! Do.','approved','2024-05-05 00:25:24','2024-06-27 00:25:24'),(1125,8,'Botble\\RealEstate\\Models\\Property',48,2,'Hatter added as an explanation; \'I\'ve none of my life.\' \'You are old,\' said the Hatter went on, very much pleased at having found out that the reason and all that,\' said the Gryphon. \'Turn a.','approved','2024-03-30 00:25:24','2024-06-27 00:25:24'),(1129,10,'Botble\\RealEstate\\Models\\Property',52,4,'Alice, and tried to get rather sleepy, and went back to yesterday, because I was going to happen next. The first question of course had to ask help of any that do,\' Alice hastily replied; \'at least--at least I mean what I eat\" is the.','approved','2024-05-24 00:25:24','2024-06-27 00:25:24'),(1132,8,'Botble\\RealEstate\\Models\\Project',3,2,'Soup of the trial.\' \'Stupid.','approved','2024-03-10 00:25:24','2024-06-27 00:25:24'),(1133,2,'Botble\\RealEstate\\Models\\Property',26,4,'Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the fifth bend, I think?\' he said in a.','approved','2024-05-09 00:25:24','2024-06-27 00:25:24'),(1135,10,'Botble\\RealEstate\\Models\\Property',6,2,'Queen merely remarking as it.','approved','2024-04-05 00:25:24','2024-06-27 00:25:24'),(1137,5,'Botble\\RealEstate\\Models\\Property',61,2,'Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first to.','approved','2024-06-17 00:25:24','2024-06-27 00:25:24'),(1139,10,'Botble\\RealEstate\\Models\\Property',36,3,'Mouse, do you want to go from here?\' \'That depends a good thing!\' she said this, she was as much as she could, for her neck from.','approved','2024-04-21 00:25:24','2024-06-27 00:25:24'),(1143,5,'Botble\\RealEstate\\Models\\Property',25,4,'Go on!\' \'I\'m a poor man, your Majesty,\' he began, \'for bringing these in: but I hadn\'t quite finished my tea when I find a thing,\' said.','approved','2024-05-30 00:25:24','2024-06-27 00:25:24'),(1167,9,'Botble\\RealEstate\\Models\\Property',58,2,'ARE a simpleton.\' Alice did not like to be.','approved','2024-04-15 00:25:24','2024-06-27 00:25:24'),(1177,5,'Botble\\RealEstate\\Models\\Property',36,3,'Dormouse,\' thought Alice; \'I must be kind to them,\' thought Alice, \'shall I NEVER get any older than you, and must know better\'; and this Alice would not give all else for two reasons. First, because I\'m on the second time round, she found this a very grave voice.','approved','2024-06-24 00:25:24','2024-06-27 00:25:24'),(1185,5,'Botble\\RealEstate\\Models\\Property',55,2,'THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never even.','approved','2024-04-04 00:25:24','2024-06-27 00:25:24'),(1191,7,'Botble\\RealEstate\\Models\\Property',2,2,'Gryphon replied very solemnly. Alice was silent. The Dormouse shook itself, and was surprised to find her in a melancholy air, and, after folding his arms and legs in all their simple sorrows, and find a thing,\' said the Cat, and vanished. Alice was.','approved','2024-04-06 00:25:24','2024-06-27 00:25:24'),(1193,5,'Botble\\RealEstate\\Models\\Property',35,3,'Alice heard the Rabbit came near her, about four feet high. \'I wish the creatures order one about, and shouting \'Off with their heads down and make one quite.','approved','2024-05-06 00:25:24','2024-06-27 00:25:24'),(1195,10,'Botble\\RealEstate\\Models\\Property',32,4,'Dinah my dear! I wish you wouldn\'t mind,\' said Alice: \'I don\'t think they play at all anxious to have been changed several times since then.\' \'What do you know the way YOU manage?\' Alice asked. The Hatter looked at Alice. \'I\'M not a mile.','approved','2024-05-17 00:25:24','2024-06-27 00:25:24'),(1197,9,'Botble\\RealEstate\\Models\\Property',34,2,'Gryphon, \'you first form into a pig,\' Alice quietly said, just as if she was in confusion, getting the Dormouse turned out, and, by the whole window!\' \'Sure, it does, yer honour: but it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you.','approved','2024-03-25 00:25:24','2024-06-27 00:25:24'),(1199,4,'Botble\\RealEstate\\Models\\Property',36,1,'Poor Alice! It was the White Rabbit. She was a good deal frightened by this time, as it turned round and round goes the clock in a tone of great.','approved','2024-04-20 00:25:24','2024-06-27 00:25:24'),(1203,1,'Botble\\RealEstate\\Models\\Property',37,4,'SOMETHING interesting is sure to do with you. Mind now!\' The poor little Lizard, Bill, was in confusion, getting the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Pigeon, but in a low voice. \'Not at all,\' said the King, and the.','approved','2024-05-13 00:25:24','2024-06-27 00:25:24'),(1205,1,'Botble\\RealEstate\\Models\\Property',26,4,'Let me see: four times seven is--oh dear! I shall think nothing of the same year for such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me hear the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s.','approved','2024-04-03 00:25:24','2024-06-27 00:25:24'),(1206,9,'Botble\\RealEstate\\Models\\Project',4,4,'Alice waited patiently until it chose to.','approved','2024-04-06 00:25:24','2024-06-27 00:25:24'),(1209,1,'Botble\\RealEstate\\Models\\Property',48,4,'Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'and those twelve creatures,\' (she was rather.','approved','2024-03-15 00:25:24','2024-06-27 00:25:24'),(1211,4,'Botble\\RealEstate\\Models\\Property',60,5,'March Hare. \'Yes, please do!\' pleaded Alice.','approved','2024-06-15 00:25:24','2024-06-27 00:25:24'),(1217,11,'Botble\\RealEstate\\Models\\Property',27,3,'Alice had got its neck nicely straightened out, and was going off into a large plate came skimming out, straight at.','approved','2024-03-29 00:25:24','2024-06-27 00:25:24'),(1219,6,'Botble\\RealEstate\\Models\\Property',11,5,'Cheshire cats always grinned; in fact, I didn\'t know that cats COULD grin.\' \'They all can,\' said the Hatter. \'You MUST remember,\' remarked the King, and the Dormouse crossed the court, arm-in-arm with the day of the game, feeling very curious thing, and longed to.','approved','2024-06-23 00:25:24','2024-06-27 00:25:24');
/*!40000 ALTER TABLE `re_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"careers.index\":true,\"careers.create\":true,\"careers.edit\":true,\"careers.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.create\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"export-properties.index\":true,\"import-projects.index\":true,\"export-projects.index\":true,\"coupons.index\":true,\"coupons.destroy\":true,\"real-estate.settings.general\":true,\"real-estate.settings.currencies\":true,\"real-estate.settings.accounts\":true,\"real-estate.settings.invoices\":true,\"real-estate.settings.invoice-template\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true}','Admin users role',1,1,1,'2024-06-27 00:25:14','2024-06-27 00:25:14');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','f99c022a51f4c82c12c4d4934ec85394',NULL,'2024-06-27 00:25:24'),(2,'api_enabled','0',NULL,'2024-06-27 00:25:24'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"career\",\"contact\",\"cookie-consent\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]',NULL,'2024-06-27 00:25:24'),(4,'analytics_dashboard_widgets','0','2024-06-27 00:25:12','2024-06-27 00:25:12'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2024-06-27 00:25:12','2024-06-27 00:25:12'),(6,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2024-06-27 00:25:12','2024-06-27 00:25:12'),(7,'real_estate_mandatory_fields_at_consult_form','[\"email\"]',NULL,'2024-06-27 00:25:24'),(8,'theme','homzen',NULL,'2024-06-27 00:25:24'),(9,'show_admin_bar','1',NULL,'2024-06-27 00:25:24'),(10,'language_hide_default','1',NULL,'2024-06-27 00:25:24'),(11,'language_switcher_display','dropdown',NULL,'2024-06-27 00:25:24'),(12,'language_display','all',NULL,'2024-06-27 00:25:24'),(13,'language_hide_languages','[]',NULL,'2024-06-27 00:25:24'),(14,'permalink-botble-blog-models-post','news',NULL,'2024-06-27 00:25:24'),(15,'permalink-botble-blog-models-category','news',NULL,'2024-06-27 00:25:24'),(16,'payment_cod_status','1',NULL,'2024-06-27 00:25:24'),(17,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2024-06-27 00:25:24'),(18,'payment_bank_transfer_status','1',NULL,'2024-06-27 00:25:24'),(19,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2024-06-27 00:25:24'),(20,'payment_stripe_payment_type','stripe_checkout',NULL,'2024-06-27 00:25:24'),(21,'theme-homzen-site_title','Homzen',NULL,NULL),(22,'theme-homzen-seo_description','Find your favorite homes at Homzen',NULL,NULL),(23,'theme-homzen-copyright','©%Y Homzen is Proudly Powered by Botble Team.',NULL,NULL),(24,'theme-homzen-favicon','general/favicon.png',NULL,NULL),(25,'theme-homzen-logo','general/logo.png',NULL,NULL),(26,'theme-homzen-logo_light','general/logo-light.png',NULL,NULL),(27,'theme-homzen-preloader_enabled','yes',NULL,NULL),(28,'theme-homzen-preloader_version','v2',NULL,NULL),(29,'theme-homzen-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"Youtube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(30,'theme-homzen-social_sharing','[[{\"key\":\"social\",\"value\":\"facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"}],[{\"key\":\"social\",\"value\":\"x\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"}],[{\"key\":\"social\",\"value\":\"pinterest\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-pinterest\"}],[{\"key\":\"social\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"}],[{\"key\":\"social\",\"value\":\"whatsapp\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-whatsapp\"}],[{\"key\":\"social\",\"value\":\"email\"},{\"key\":\"icon\",\"value\":\"ti ti-mail\"}]]',NULL,NULL),(31,'theme-homzen-primary_color','#ed2027',NULL,NULL),(32,'theme-homzen-hover_color','#cd380f',NULL,NULL),(33,'theme-homzen-footer_background_color','#161e2d',NULL,NULL),(34,'theme-homzen-footer_background_image','general/banner-footer.png',NULL,NULL),(35,'theme-homzen-use_modal_for_authentication','1',NULL,NULL),(36,'theme-homzen-homepage_id','1',NULL,NULL),(37,'theme-homzen-blog_page_id','6',NULL,NULL),(38,'theme-homzen-hotline','0123 456 789',NULL,NULL),(39,'theme-homzen-email','contact@botble.com',NULL,NULL),(40,'theme-homzen-breadcrumb_background_color','#f7f7f7',NULL,NULL),(41,'theme-homzen-breadcrumb_text_color','#161e2d',NULL,NULL),(42,'theme-homzen-lazy_load_images','1',NULL,NULL),(43,'theme-homzen-lazy_load_placeholder_image','general/placeholder.png',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(2,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(3,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(4,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(5,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(6,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2024-06-27 00:25:13','2024-06-27 00:25:13'),(7,'walnut-park-apartments',1,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(8,'sunshine-wonder-villas',2,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(9,'diamond-island',3,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(10,'the-nassim',4,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(11,'vinhomes-grand-park',5,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(12,'the-metropole-thu-thiem',6,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(13,'villa-on-grand-avenue',7,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(14,'traditional-food-restaurant',8,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(15,'villa-on-hollywood-boulevard',9,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(16,'office-space-at-northwest-107th',10,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(17,'home-in-merrick-way',11,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(18,'adarsh-greens',12,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(19,'rustomjee-evershine-global-city',13,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(20,'godrej-exquisite',14,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(21,'godrej-prime',15,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(22,'ps-panache',16,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(23,'upturn-atmiya-centria',17,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(24,'brigade-oasis',18,'Botble\\RealEstate\\Models\\Project','projects','2024-06-27 00:25:18','2024-06-27 00:25:18'),(25,'3-beds-villa-calpe-alicante',1,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(26,'lavida-plus-office-tel-1-bedroom',2,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(27,'vinhomes-grand-park-studio-1-bedroom',3,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(28,'the-sun-avenue-office-tel-1-bedroom',4,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(29,'property-for-sale-johannesburg-south-africa',5,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(30,'stunning-french-inspired-manor',6,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(31,'villa-for-sale-at-bermuda-dunes',7,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(32,'walnut-park-apartment',8,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(33,'5-beds-luxury-house',9,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(34,'family-victorian-view-home',10,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(35,'osaka-heights-apartment',11,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(36,'private-estate-magnificent-views',12,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(37,'thompson-road-house-for-rent',13,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:18','2024-06-27 00:25:18'),(38,'brand-new-1-bedroom-apartment-in-first-class-location',14,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(39,'elegant-family-home-presents-premium-modern-living',15,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(40,'luxury-apartments-in-singapore-for-sale',16,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(41,'5-room-luxury-penthouse-for-sale-in-kuala-lumpur',17,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(42,'2-floor-house-in-compound-pejaten-barat-kemang',18,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(43,'apartment-muiderstraatweg-in-diemen',19,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(44,'nice-apartment-for-rent-in-berlin',20,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(45,'pumpkin-key-private-island',21,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(46,'maplewood-estates',22,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(47,'pine-ridge-manor',23,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(48,'oak-hill-residences',24,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(49,'sunnybrook-villas',25,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(50,'riverstone-condominiums',26,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(51,'cedar-park-apartments',27,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(52,'lakeside-retreat',28,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(53,'willow-creek-homes',29,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(54,'grandview-heights',30,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(55,'forest-glen-cottages',31,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(56,'harborview-towers',32,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(57,'meadowlands-estates',33,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(58,'highland-meadows',34,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(59,'brookfield-gardens',35,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(60,'silverwood-villas',36,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(61,'evergreen-terrace',37,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(62,'golden-gate-residences',38,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(63,'spring-blossom-park',39,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(64,'horizon-pointe',40,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(65,'whispering-pines-lodge',41,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(66,'sunset-ridge',42,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(67,'timberline-estates',43,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(68,'crystal-lake-condos',44,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(69,'briarwood-apartments',45,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(70,'summit-view',46,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(71,'elmwood-park',47,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(72,'stonegate-homes',48,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(73,'rosewood-villas',49,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(74,'prairie-meadows',50,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(75,'hawthorne-heights',51,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(76,'sierra-vista',52,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(77,'autumn-leaves',53,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(78,'blue-sky-residences',54,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(79,'pebble-creek',55,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(80,'magnolia-manor',56,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(81,'cherry-blossom-estates',57,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(82,'windsor-park',58,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(83,'seaside-villas',59,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(84,'mountain-view-retreat',60,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(85,'amberwood-apartments',61,'Botble\\RealEstate\\Models\\Property','properties','2024-06-27 00:25:19','2024-06-27 00:25:19'),(86,'buying-a-home',1,'Botble\\Blog\\Models\\Category','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(87,'selling-a-home',2,'Botble\\Blog\\Models\\Category','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(88,'market-trends',3,'Botble\\Blog\\Models\\Category','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(89,'home-improvement',4,'Botble\\Blog\\Models\\Category','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(90,'real-estate-investing',5,'Botble\\Blog\\Models\\Category','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(91,'neighborhood-guides',6,'Botble\\Blog\\Models\\Category','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(92,'tips',1,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(93,'investing',2,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(94,'market-analysis',3,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(95,'diy',4,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(96,'luxury-homes',5,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(97,'first-time-buyers',6,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(98,'property-management',7,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(99,'renovation',8,'Botble\\Blog\\Models\\Tag','tag','2024-06-27 00:25:20','2024-06-27 00:25:20'),(100,'top-10-tips-for-first-time-home-buyers',1,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(101,'how-to-stage-your-home-for-a-quick-sale',2,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(102,'understanding-the-current-real-estate-market-trends',3,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(103,'diy-home-improvement-projects-that-add-value',4,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(104,'a-beginners-guide-to-real-estate-investing',5,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(105,'how-to-choose-the-right-neighborhood-for-your-family',6,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(106,'luxury-homes-what-to-look-for',7,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(107,'property-management-best-practices-for-landlords',8,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(108,'renovation-ideas-to-increase-your-homes-value',9,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(109,'the-ultimate-guide-to-buying-a-vacation-home',10,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(110,'how-to-successfully-sell-your-home-in-a-buyers-market',11,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(111,'home-inspection-what-to-expect-and-how-to-prepare',12,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(112,'eco-friendly-home-improvements-for-sustainable-living',13,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(113,'how-to-navigate-the-mortgage-process',14,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(114,'real-estate-market-analysis-what-you-need-to-know',15,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(115,'tips-for-renting-out-your-property',16,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(116,'understanding-property-taxes-and-how-to-lower-them',17,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(117,'the-benefits-of-smart-home-technology',18,'Botble\\Blog\\Models\\Post','news','2024-06-27 00:25:20','2024-06-27 00:25:20'),(118,'homepage-1',1,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(119,'homepage-2',2,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(120,'homepage-3',3,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(121,'homepage-4',4,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(122,'homepage-5',5,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(123,'blog',6,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(124,'contact-us',7,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(125,'our-services',8,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(126,'faqs',9,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(127,'about-us',10,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(128,'pricing-plans',11,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(129,'privacy-policy',12,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(130,'coming-soon',13,'Botble\\Page\\Models\\Page','','2024-06-27 00:25:23','2024-06-27 00:25:23'),(131,'senior-full-stack-engineer-creator-success-full-time',1,'ArchiElite\\Career\\Models\\Career','careers','2024-06-27 00:25:24','2024-06-27 00:25:24'),(132,'data-science-specialist-analytics-division',2,'ArchiElite\\Career\\Models\\Career','careers','2024-06-27 00:25:24','2024-06-27 00:25:24'),(133,'product-marketing-manager-growth-team',3,'ArchiElite\\Career\\Models\\Career','careers','2024-06-27 00:25:24','2024-06-27 00:25:24'),(134,'uxui-designer-user-experience-team',4,'ArchiElite\\Career\\Models\\Career','careers','2024-06-27 00:25:24','2024-06-27 00:25:24'),(135,'operations-manager-supply-chain-division',5,'ArchiElite\\Career\\Models\\Career','careers','2024-06-27 00:25:24','2024-06-27 00:25:24'),(136,'financial-analyst-investment-group',6,'ArchiElite\\Career\\Models\\Career','careers','2024-06-27 00:25:24','2024-06-27 00:25:24'),(137,'lauryn',1,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(138,'luisa',2,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(139,'edd',3,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(140,'esta',4,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(141,'maida',5,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(142,'rodrick',6,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(143,'ernestina',7,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(144,'kristopher',8,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(145,'tyrique',9,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(146,'kathlyn',10,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(147,'sierra',11,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24'),(148,'bret',12,'Botble\\RealEstate\\Models\\Account','agents','2024-06-27 00:25:24','2024-06-27 00:25:24');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
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
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,'locations/3.jpg',0,'published',NULL,NULL),(2,'England','england','EN',2,0,'locations/5.jpg',0,'published',NULL,NULL),(3,'New York','new-york','NY',3,0,'locations/4.jpg',0,'published',NULL,NULL),(4,'Holland','holland','HL',4,0,'locations/1.jpg',0,'published',NULL,NULL),(5,'Denmark','denmark','DN',5,0,'locations/4.jpg',0,'published',NULL,NULL),(6,'Bavaria','bavaria','BY',6,0,'locations/4.jpg',0,'published',NULL,NULL),(7,'Tokyo','tokyo','TK',7,0,'locations/2.jpg',0,'published',NULL,NULL),(8,'Ontario','ontario','ON',8,0,'locations/5.jpg',0,'published',NULL,NULL),(9,'New South Wales','new-south-wales','NSW',9,0,'locations/5.jpg',0,'published',NULL,NULL),(10,'Lombardy','lombardy','LO',10,0,'locations/4.jpg',0,'published',NULL,NULL);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
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
INSERT INTO `tags` VALUES (1,'Tips',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(2,'Investing',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(3,'Market Analysis',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(4,'DIY',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(5,'Luxury Homes',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(6,'First-time Buyers',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(7,'Property Management',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20'),(8,'Renovation',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-06-27 00:25:20','2024-06-27 00:25:20');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
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
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `testimonials` VALUES (1,'Jennifer Lee','From the initial consultation to closing day, the real estate team went above and beyond to ensure I found the perfect home. Their dedication and professionalism made the entire process seamless. Thank you!','avatars/5.png','Happy Home Seeker','published','2024-06-27 00:25:19','2024-06-27 00:25:19'),(2,'Robert Evans','I am impressed by the level of expertise and commitment demonstrated by this real estate team. Their insights into the market helped me make informed investment decisions, and I couldn\'t be happier with the results.','avatars/1.jpg','Property Investor','published','2024-06-27 00:25:19','2024-06-27 00:25:19'),(3,'Jessica White','Selling my home with the help of this real estate team was a breeze. They provided valuable advice, staged my property beautifully, and negotiated a great deal. I highly recommend their services to anyone looking to sell their home!','avatars/3.jpg','Delighted Home Seller','published','2024-06-27 00:25:19','2024-06-27 00:25:19'),(4,'Daniel Miller','Thanks to the expertise and guidance of this real estate team, I am now the proud owner of my dream home. They listened to my preferences, answered all my questions, and made the entire home buying process a positive experience.','avatars/3.jpg','Happy New Homeowner','published','2024-06-27 00:25:19','2024-06-27 00:25:19');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `users` VALUES (1,'crunte@douglas.com',NULL,'$2y$12$08puF3IKVzBFcUdA9LI7QO3Cwqb/3uoxc6w0tiLGdbkakefll6Ss6',NULL,'2024-06-27 00:25:14','2024-06-27 00:25:14','Vance','Stroman','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'SiteLogoWidget','top_footer_sidebar','homzen',1,'[]','2024-06-27 00:25:13','2024-06-27 00:25:13'),(2,'SocialLinksWidget','top_footer_sidebar','homzen',2,'{\"title\":\"Follow Us:\"}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(3,'SiteInformationWidget','inner_footer_sidebar','homzen',1,'{\"about\":\"Specializes in providing high-class tours for those in need. Contact Us\",\"items\":[[{\"key\":\"icon\",\"value\":\"ti ti-map-pin\"},{\"key\":\"text\",\"value\":\"101 E 129th St, East Chicago, IN 46312, US\"}],[{\"key\":\"icon\",\"value\":\"ti ti-phone-call\"},{\"key\":\"text\",\"value\":\"1-333-345-6868\"}],[{\"key\":\"icon\",\"value\":\"ti ti-mail\"},{\"key\":\"text\",\"value\":\"contact@botble.com\"}]]}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(4,'Botble\\Widget\\Widgets\\CoreSimpleMenu','inner_footer_sidebar','homzen',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Categories\",\"items\":[[{\"key\":\"label\",\"value\":\"Pricing Plans\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Our Services\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"About Us\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Contact Us\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(5,'Botble\\Widget\\Widgets\\CoreSimpleMenu','inner_footer_sidebar','homzen',3,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"name\":\"Our Company\",\"items\":[[{\"key\":\"label\",\"value\":\"Property For Sale\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Property For Rent\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Property For Buy\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Our Agents\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(6,'NewsletterWidget','inner_footer_sidebar','homzen',4,'{\"title\":\"Newsletter\",\"subtitle\":\"Your Weekly\\/Monthly Dose of Knowledge and Inspiration\"}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(7,'SiteCopyrightWidget','bottom_footer_sidebar','homzen',1,'[]','2024-06-27 00:25:13','2024-06-27 00:25:13'),(8,'Botble\\Widget\\Widgets\\CoreSimpleMenu','bottom_footer_sidebar','homzen',2,'{\"id\":\"Botble\\\\Widget\\\\Widgets\\\\CoreSimpleMenu\",\"items\":[[{\"key\":\"label\",\"value\":\"Terms Of Services\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Privacy Policy\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}],[{\"key\":\"label\",\"value\":\"Cookie Policy\"},{\"key\":\"url\",\"value\":\"\\/\"},{\"key\":\"attributes\",\"value\":\"\"},{\"key\":\"is_open_new_tab\",\"value\":\"0\"}]]}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(9,'BlogSearchWidget','blog_sidebar','homzen',1,'{\"name\":\"Search\"}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(10,'BlogPostsWidget','blog_sidebar','homzen',2,'{\"name\":\"Recent Posts\",\"limit\":3}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(11,'BlogCategoriesWidget','blog_sidebar','homzen',3,'{\"name\":\"By Categories\",\"number_display\":8}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(12,'BlogTagsWidget','blog_sidebar','homzen',4,'{\"name\":\"Popular Tag\",\"number_display\":9}','2024-06-27 00:25:13','2024-06-27 00:25:13'),(13,'RelatedPostsWidget','bottom_post_detail_sidebar','homzen',1,'{\"title\":\"News insight\",\"subtitle\":\"Related Posts\",\"limit\":3}','2024-06-27 00:25:13','2024-06-27 00:25:13');
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

-- Dump completed on 2024-06-27 14:25:25
