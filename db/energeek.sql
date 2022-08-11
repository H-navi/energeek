-- Adminer 4.8.1 MySQL 5.5.5-10.4.14-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(20) NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `candidates_job_id_foreign` (`job_id`),
  CONSTRAINT `candidates_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `candidates` (`id`, `job_id`, `name`, `email`, `phone`, `year`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3,	54,	'dddd',	'sss@mail.com',	'07436736',	1223,	NULL,	2,	2,	'2022-08-10 23:30:42',	'2022-08-11 05:11:37',	'2022-08-11 05:11:37'),
(4,	53,	'sadas',	'dispendukcapilkabprob@gmail.com',	'+10335420829',	2022,	NULL,	NULL,	2,	'2022-08-10 23:33:55',	'2022-08-11 03:40:59',	'2022-08-11 03:40:59'),
(5,	52,	'xczx',	'dispendukcapilkabprob@gmail.com',	'+10335420829',	2334,	2,	NULL,	NULL,	'2022-08-10 23:45:20',	'2022-08-10 23:45:20',	NULL),
(8,	54,	'testname',	'test@mail.com',	'0978773737',	2033,	2,	NULL,	NULL,	'2022-08-11 04:53:31',	'2022-08-11 04:53:31',	NULL),
(9,	56,	'xxx',	'user@mail.com',	'2344',	2334,	2,	NULL,	NULL,	'2022-08-11 05:12:27',	'2022-08-11 05:12:27',	NULL),
(10,	68,	'aafffg',	'qww@sad.csa',	'23415',	2334,	2,	2,	2,	'2022-08-11 05:12:58',	'2022-08-11 05:18:13',	'2022-08-11 05:18:13');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jobs` (`id`, `name`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(51,	'Hand Sewer',	2,	NULL,	NULL,	'2022-08-10 22:06:57',	NULL,	NULL),
(52,	'Space Sciences Teacher',	2,	NULL,	NULL,	'2022-08-10 22:06:57',	NULL,	NULL),
(53,	'Utility Meter Reader',	2,	NULL,	NULL,	'2022-08-10 22:06:57',	NULL,	NULL),
(54,	'Precision Mold and Pattern Caster',	2,	NULL,	NULL,	'2022-08-10 22:06:57',	NULL,	NULL),
(55,	'Internist',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(56,	'Office and Administrative Support Worker',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(57,	'Human Resource Director',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(58,	'Engineering Manager',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(59,	'Law Clerk',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(60,	'House Cleaner',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(61,	'Software Engineer',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(62,	'Surveyor',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(63,	'Musician OR Singer',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(64,	'Audio and Video Equipment Technician',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(65,	'Law Clerk',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(66,	'Postsecondary Teacher',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(67,	'Personal Financial Advisor',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(68,	'Psychology Teacher',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(69,	'Warehouse',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(70,	'Aircraft Structure Assemblers',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(71,	'Director Of Social Media Marketing',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(72,	'Compacting Machine Operator',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(73,	'Medical Secretary',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(74,	'Title Searcher',	2,	NULL,	NULL,	'2022-08-10 22:06:58',	NULL,	NULL),
(75,	'Dental Laboratory Technician',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(76,	'Government',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(77,	'Petroleum Pump Operator',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(78,	'Psychiatric Technician',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(79,	'Refrigeration Mechanic',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(80,	'Oral Surgeon',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(81,	'Telephone Station Installer and Repairer',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(82,	'Punching Machine Setters',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(83,	'Carpet Installer',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(84,	'Heating and Air Conditioning Mechanic',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(85,	'Precision Etcher and Engraver',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(86,	'Shoe Machine Operators',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(87,	'Automotive Specialty Technician',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(88,	'Annealing Machine Operator',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(89,	'Veterinary Technician',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(90,	'Marking Clerk',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(91,	'Construction Laborer',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(92,	'Anesthesiologist',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(93,	'Transportation Equipment Maintenance',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(94,	'Warehouse',	2,	NULL,	NULL,	'2022-08-10 22:06:59',	NULL,	NULL),
(95,	'Biomedical Engineer',	2,	NULL,	NULL,	'2022-08-10 22:07:00',	NULL,	NULL),
(96,	'Medical Equipment Preparer',	2,	NULL,	NULL,	'2022-08-10 22:07:00',	NULL,	NULL),
(97,	'Musical Instrument Tuner',	2,	NULL,	NULL,	'2022-08-10 22:07:00',	NULL,	NULL),
(98,	'Fire Fighter',	2,	NULL,	NULL,	'2022-08-10 22:07:00',	NULL,	NULL),
(99,	'Medical Technician',	2,	NULL,	NULL,	'2022-08-10 22:07:00',	NULL,	NULL),
(100,	'Furniture Finisher',	2,	NULL,	NULL,	'2022-08-10 22:07:00',	NULL,	NULL);

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2021_05_10_015649_create_sessions_table',	1),
(7,	'2021_05_19_015833_create_permission_tables',	1),
(8,	'2022_08_11_024510_create_skills_table',	2),
(9,	'2022_08_11_025821_create_jobs_table',	2),
(10,	'2022_08_11_025846_create_candidates_table',	3),
(11,	'2022_08_11_025917_create_skill_setss_table',	4),
(12,	'2022_08_11_031234_make_user_id_nullable_on_candidates_table',	5),
(13,	'2022_08_11_031527_make_user_id_nullable_on_jobs_table',	5),
(14,	'2022_08_11_031542_make_user_id_nullable_on_skills_table',	5),
(15,	'2022_08_11_033344_add_deleted_at_on_candidates_table',	6),
(16,	'2022_08_11_033541_add_deleted_at_on_jobs_table',	7),
(17,	'2022_08_11_033557_add_deleted_at_on_skills_table',	7);

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(15,	'App\\Models\\User',	6),
(15,	'App\\Models\\User',	7),
(15,	'App\\Models\\User',	8),
(15,	'App\\Models\\User',	9),
(15,	'App\\Models\\User',	10),
(15,	'App\\Models\\User',	11),
(15,	'App\\Models\\User',	12),
(15,	'App\\Models\\User',	13),
(15,	'App\\Models\\User',	14),
(15,	'App\\Models\\User',	15),
(15,	'App\\Models\\User',	16),
(15,	'App\\Models\\User',	17),
(15,	'App\\Models\\User',	18),
(15,	'App\\Models\\User',	19),
(15,	'App\\Models\\User',	20),
(15,	'App\\Models\\User',	21),
(15,	'App\\Models\\User',	22),
(15,	'App\\Models\\User',	23),
(15,	'App\\Models\\User',	24),
(15,	'App\\Models\\User',	25),
(15,	'App\\Models\\User',	26),
(15,	'App\\Models\\User',	27),
(15,	'App\\Models\\User',	28),
(15,	'App\\Models\\User',	29),
(15,	'App\\Models\\User',	30),
(15,	'App\\Models\\User',	31),
(15,	'App\\Models\\User',	32),
(15,	'App\\Models\\User',	33),
(15,	'App\\Models\\User',	34),
(15,	'App\\Models\\User',	35),
(15,	'App\\Models\\User',	36),
(15,	'App\\Models\\User',	37),
(15,	'App\\Models\\User',	38),
(15,	'App\\Models\\User',	39),
(15,	'App\\Models\\User',	40),
(15,	'App\\Models\\User',	41),
(15,	'App\\Models\\User',	42),
(15,	'App\\Models\\User',	43),
(15,	'App\\Models\\User',	44),
(15,	'App\\Models\\User',	45),
(15,	'App\\Models\\User',	46),
(15,	'App\\Models\\User',	47),
(15,	'App\\Models\\User',	48),
(15,	'App\\Models\\User',	49),
(15,	'App\\Models\\User',	50),
(15,	'App\\Models\\User',	51),
(15,	'App\\Models\\User',	52),
(15,	'App\\Models\\User',	53),
(15,	'App\\Models\\User',	54);

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1,	'App\\Models\\User',	1),
(2,	'App\\Models\\User',	2),
(3,	'App\\Models\\User',	3),
(4,	'App\\Models\\User',	4),
(5,	'App\\Models\\User',	5),
(5,	'App\\Models\\User',	6),
(5,	'App\\Models\\User',	7),
(5,	'App\\Models\\User',	8),
(5,	'App\\Models\\User',	9),
(5,	'App\\Models\\User',	10),
(5,	'App\\Models\\User',	11),
(5,	'App\\Models\\User',	12),
(5,	'App\\Models\\User',	13),
(5,	'App\\Models\\User',	14),
(5,	'App\\Models\\User',	15),
(5,	'App\\Models\\User',	16),
(5,	'App\\Models\\User',	17),
(5,	'App\\Models\\User',	18),
(5,	'App\\Models\\User',	19),
(5,	'App\\Models\\User',	20),
(5,	'App\\Models\\User',	21),
(5,	'App\\Models\\User',	22),
(5,	'App\\Models\\User',	23),
(5,	'App\\Models\\User',	24),
(5,	'App\\Models\\User',	25),
(5,	'App\\Models\\User',	26),
(5,	'App\\Models\\User',	27),
(5,	'App\\Models\\User',	28),
(5,	'App\\Models\\User',	29),
(5,	'App\\Models\\User',	30),
(5,	'App\\Models\\User',	31),
(5,	'App\\Models\\User',	32),
(5,	'App\\Models\\User',	33),
(5,	'App\\Models\\User',	34),
(5,	'App\\Models\\User',	35),
(5,	'App\\Models\\User',	36),
(5,	'App\\Models\\User',	37),
(5,	'App\\Models\\User',	38),
(5,	'App\\Models\\User',	39),
(5,	'App\\Models\\User',	40),
(5,	'App\\Models\\User',	41),
(5,	'App\\Models\\User',	42),
(5,	'App\\Models\\User',	43),
(5,	'App\\Models\\User',	44),
(5,	'App\\Models\\User',	45),
(5,	'App\\Models\\User',	46),
(5,	'App\\Models\\User',	47),
(5,	'App\\Models\\User',	48),
(5,	'App\\Models\\User',	49),
(5,	'App\\Models\\User',	50),
(5,	'App\\Models\\User',	51),
(5,	'App\\Models\\User',	52),
(5,	'App\\Models\\User',	53),
(5,	'App\\Models\\User',	54);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N/A',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `description`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'create:user',	'create user',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(2,	'read: user',	'read user',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(3,	'update: user',	'update user',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(4,	'delete: user',	'delete User',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(5,	'create: role',	'create role',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(6,	'read: role',	'read role',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(7,	'update: role',	'update role',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(8,	'delete: role',	'delete role',	'web',	'2022-08-10 19:05:21',	'2022-08-10 19:05:21'),
(9,	'create: permission',	'create permission',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(10,	'read: permission',	'read permission',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(11,	'update: permission',	'update permission',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(12,	'delete: permission',	'delete permission',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(13,	'read: admin',	'read admin',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(14,	'update: admin',	'update admin',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(15,	'N/A',	'N/A',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22');

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'super-admin',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(2,	'admin',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(3,	'moderator',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(4,	'developer',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22'),
(5,	'user',	'web',	'2022-08-10 19:05:22',	'2022-08-10 19:05:22');

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1,	1),
(1,	2),
(2,	1),
(2,	2),
(2,	3),
(3,	1),
(3,	2),
(4,	1),
(4,	2),
(5,	1),
(5,	2),
(6,	1),
(6,	2),
(6,	3),
(7,	1),
(7,	2),
(8,	1),
(8,	2),
(9,	1),
(9,	2),
(10,	1),
(10,	2),
(10,	3),
(11,	1),
(11,	2),
(12,	1),
(12,	2),
(13,	1),
(13,	2),
(13,	3),
(13,	4),
(14,	1),
(14,	2),
(15,	5);

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eX7yxiVthz7khhk0EsuhNLXXUcS0G5YjWxkG5bIK',	NULL,	'127.0.0.1',	'PostmanRuntime/7.21.0',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYjVoM3VSZGJhaG92WjI1QjYwTHhDRHA5OVJDaU1JM0tVbWlLalRXbSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NDoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2NhbmRpZGF0ZXMvaW5kZXgiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1660217440),
('fcPBFVniWBAXwLhZRGmlxJgLo9AWhXqBbIPx00AZ',	2,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36 Edg/103.0.1264.77',	'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiOWlGQkRmQ1UxcURmMTBzWVNpcGFnRFpmQkFuTXRRWXBEN2oyMUJlRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRzUzUwa3F0aDZBMXZqMXVWRjVQdzVPSG94SWVRVnlwYUdLSGZPWUU0WE5Cc3FSZ3RVenYxYSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkc1M1MGtxdGg2QTF2ajF1VkY1UHc1T0hveEllUVZ5cGFHS0hmT1lFNFhOQnNxUmd0VXp2MWEiO30=',	1660220655),
('RCDMvcfTFAOptzqqGy2H1BLTcqFo9VC1u8yfTYFk',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMVN1WkpzSmlBeEVmVjI0TUlQQURSRjlScEZMazNWa0JRWms3ZEJscCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',	1660212658),
('SghVgG0RhtDMYZJsdiVqx9JslNzh7xohiGRwnUZo',	2,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36 Edg/103.0.1264.77',	'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMWlqZVdPTU1CU1FWYm9OTlh1eWEzakRydnZzZmdwMm9KTHNhRWNINyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHNTNTBrcXRoNkExdmoxdVZGNVB3NU9Ib3hJZVFWeXBhR0tIZk9ZRTRYTkJzcVJndFV6djFhIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRzUzUwa3F0aDZBMXZqMXVWRjVQdzVPSG94SWVRVnlwYUdLSGZPWUU0WE5Cc3FSZ3RVenYxYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jYW5kaWRhdGVzIjt9fQ==',	1660220496),
('xqrb8mCyldOoRHP19CbpC6V6Ac79SJI4w4juRf8U',	NULL,	'127.0.0.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0',	'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRzhzbTg2OXYxdk1PUlAwUndGdTJGYUVLS0hRV0d4R0FLSERXNnZrNiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4vZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',	1660212756);

DROP TABLE IF EXISTS `skills`;
CREATE TABLE `skills` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `updated_by` int(10) unsigned DEFAULT NULL,
  `deleted_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `skills` (`id`, `name`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13,	'php',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(14,	'python',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(15,	'java',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(16,	'laravel',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(17,	'yii2',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(18,	'reactJs',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(19,	'vue.js',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(20,	'flutter',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(21,	'mysql',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(22,	'jquery',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(23,	'css',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL),
(24,	'javascript',	2,	NULL,	NULL,	'2022-08-10 21:49:15',	NULL,	NULL);

DROP TABLE IF EXISTS `skill_sets`;
CREATE TABLE `skill_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `candidate_id` bigint(20) unsigned NOT NULL,
  `skill_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_sets_candidate_id_foreign` (`candidate_id`),
  KEY `skill_sets_skill_id_foreign` (`skill_id`),
  CONSTRAINT `skill_sets_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  CONSTRAINT `skill_sets_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `skill_sets` (`id`, `candidate_id`, `skill_id`) VALUES
(3,	4,	14),
(4,	4,	19),
(5,	5,	13),
(6,	5,	15),
(7,	5,	18),
(11,	8,	13),
(12,	8,	14),
(13,	8,	15),
(14,	3,	15),
(15,	3,	16),
(16,	3,	18),
(17,	9,	14),
(18,	9,	17),
(22,	10,	14),
(23,	10,	15),
(24,	10,	19);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `is_admin`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1,	'super admin',	1,	'super@admin.com',	'2022-08-10 19:05:25',	'$2y$10$hWARCD431CYwwScj8SduXe/B0ZOaZs5n7F0tkQRfgD/k3KF6YroAm',	NULL,	NULL,	'KPy9E63rojAZA8X38D9PhHHxMdr7BpwFTMRdBuCv2fZup3EneLsvMQQ7YLae',	NULL,	NULL,	'2022-08-10 19:05:25',	'2022-08-10 19:05:25'),
(2,	'admin',	1,	'admin@admin.com',	'2022-08-10 19:05:25',	'$2y$10$sS50kqth6A1vj1uVF5Pw5OHoxIeQVypaGKHfOYE4XNBsqRgtUzv1a',	NULL,	NULL,	'BcDr4u7OMe',	NULL,	NULL,	'2022-08-10 19:05:25',	'2022-08-10 19:05:25'),
(3,	'moderator',	1,	'moderator@admin.com',	'2022-08-10 19:05:25',	'$2y$10$Doj.Pm29nhzhFKfOJLPWbeWTIgsinmE08q9T40lX447xompk39KG.',	NULL,	NULL,	'kqethjdtEN',	NULL,	NULL,	'2022-08-10 19:05:25',	'2022-08-10 19:05:25'),
(4,	'developer',	1,	'developer@admin.com',	'2022-08-10 19:05:25',	'$2y$10$D540woNcQxWlv9iw0F81Re2nVood9xQx1piswry.3uE.PHfulGor6',	NULL,	NULL,	'mThLsOfFEO',	NULL,	NULL,	'2022-08-10 19:05:25',	'2022-08-10 19:05:25'),
(5,	'test',	0,	'test@test.com',	'2022-08-10 19:05:26',	'$2y$10$3.PxdgELXBIYsBhC.YDBw.EbuDoLSzYWIj/KMJdmjTp/gxq/R8Hmi',	NULL,	NULL,	'Co7FKpRHpF',	NULL,	NULL,	'2022-08-10 19:05:26',	'2022-08-10 19:05:26'),
(6,	'Test 1',	0,	'test1@test.com',	'2022-08-10 19:05:26',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'lIPpr8CoPJ',	NULL,	NULL,	'2022-08-10 19:05:26',	'2022-08-10 19:05:26'),
(7,	'Test 2',	0,	'test2@test.com',	'2022-08-10 19:05:26',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'ecaiOoXjc3',	NULL,	NULL,	'2022-08-10 19:05:26',	'2022-08-10 19:05:26'),
(8,	'Test 3',	0,	'test3@test.com',	'2022-08-10 19:05:26',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'CGBkuJGIS3',	NULL,	NULL,	'2022-08-10 19:05:26',	'2022-08-10 19:05:26'),
(9,	'Test 4',	0,	'test4@test.com',	'2022-08-10 19:05:27',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'dPVm9Mxkni',	NULL,	NULL,	'2022-08-10 19:05:27',	'2022-08-10 19:05:27'),
(10,	'Test 5',	0,	'test5@test.com',	'2022-08-10 19:05:27',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'HK83tlRqrz',	NULL,	NULL,	'2022-08-10 19:05:27',	'2022-08-10 19:05:27'),
(11,	'Test 6',	0,	'test6@test.com',	'2022-08-10 19:05:27',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'pPa9K21anl',	NULL,	NULL,	'2022-08-10 19:05:27',	'2022-08-10 19:05:27'),
(12,	'Test 7',	0,	'test7@test.com',	'2022-08-10 19:05:27',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'70kjjd257U',	NULL,	NULL,	'2022-08-10 19:05:27',	'2022-08-10 19:05:27'),
(13,	'Test 8',	0,	'test8@test.com',	'2022-08-10 19:05:27',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'y7reQplVG1',	NULL,	NULL,	'2022-08-10 19:05:27',	'2022-08-10 19:05:27'),
(14,	'Test 9',	0,	'test9@test.com',	'2022-08-10 19:05:28',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'Wmd5q0TLJ3',	NULL,	NULL,	'2022-08-10 19:05:28',	'2022-08-10 19:05:28'),
(15,	'Test 10',	0,	'test10@test.com',	'2022-08-10 19:05:28',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'uJ8Ts5pFfd',	NULL,	NULL,	'2022-08-10 19:05:28',	'2022-08-10 19:05:28'),
(16,	'Test 11',	0,	'test11@test.com',	'2022-08-10 19:05:28',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'y7eFazn1zP',	NULL,	NULL,	'2022-08-10 19:05:28',	'2022-08-10 19:05:28'),
(17,	'Test 12',	0,	'test12@test.com',	'2022-08-10 19:05:28',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'qbEyKBpEZ0',	NULL,	NULL,	'2022-08-10 19:05:28',	'2022-08-10 19:05:28'),
(18,	'Test 13',	0,	'test13@test.com',	'2022-08-10 19:05:29',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'fj70q3sAkg',	NULL,	NULL,	'2022-08-10 19:05:29',	'2022-08-10 19:05:29'),
(19,	'Test 14',	0,	'test14@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'mHnlojcGm6',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(20,	'Test 15',	0,	'test15@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'SoLBSSOdWr',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(21,	'Test 16',	0,	'test16@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'fhbIVX8uN3',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(22,	'Test 17',	0,	'test17@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'p1nYGctkTQ',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(23,	'Test 18',	0,	'test18@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'bNaIIzeFhn',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(24,	'Test 19',	0,	'test19@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'9jWlZGHcyC',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(25,	'Test 20',	0,	'test20@test.com',	'2022-08-10 19:05:30',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'IGTemp18L9',	NULL,	NULL,	'2022-08-10 19:05:30',	'2022-08-10 19:05:30'),
(26,	'Test 21',	0,	'test21@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'qFF1vLTgpZ',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(27,	'Test 22',	0,	'test22@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'qPzGwOkYoX',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(28,	'Test 23',	0,	'test23@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'9HekWum8xH',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(29,	'Test 24',	0,	'test24@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'OdpES4gFwK',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(30,	'Test 25',	0,	'test25@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'qZbfrs6dgr',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(31,	'Test 26',	0,	'test26@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'0eI9jcBPcR',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(32,	'Test 27',	0,	'test27@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'7HNF9zDr6j',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(33,	'Test 28',	0,	'test28@test.com',	'2022-08-10 19:05:31',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'gNoosQDUGL',	NULL,	NULL,	'2022-08-10 19:05:31',	'2022-08-10 19:05:31'),
(34,	'Test 29',	0,	'test29@test.com',	'2022-08-10 19:05:32',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'G1AAjpQWsL',	NULL,	NULL,	'2022-08-10 19:05:32',	'2022-08-10 19:05:32'),
(35,	'Test 30',	0,	'test30@test.com',	'2022-08-10 19:05:32',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'GZMOf9VfAH',	NULL,	NULL,	'2022-08-10 19:05:32',	'2022-08-10 19:05:32'),
(36,	'Test 31',	0,	'test31@test.com',	'2022-08-10 19:05:32',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'VIKDasB3SG',	NULL,	NULL,	'2022-08-10 19:05:32',	'2022-08-10 19:05:32'),
(37,	'Test 32',	0,	'test32@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'T2qXMYRp3q',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(38,	'Test 33',	0,	'test33@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'NIT4LSrXVJ',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(39,	'Test 34',	0,	'test34@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'01s6gEZjmg',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(40,	'Test 35',	0,	'test35@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'2RGEpkMyej',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(41,	'Test 36',	0,	'test36@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'ahMoqiowJG',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(42,	'Test 37',	0,	'test37@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'zgXGMChuWG',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(43,	'Test 38',	0,	'test38@test.com',	'2022-08-10 19:05:33',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'SvX8r8YBsP',	NULL,	NULL,	'2022-08-10 19:05:33',	'2022-08-10 19:05:33'),
(44,	'Test 39',	0,	'test39@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'8Q92efPJIi',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(45,	'Test 40',	0,	'test40@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'27vYfBpCdJ',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(46,	'Test 41',	0,	'test41@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'VdFECcxvoy',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(47,	'Test 42',	0,	'test42@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'IdWwru7fiw',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(48,	'Test 43',	0,	'test43@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'rAxsnrvPHX',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(49,	'Test 44',	0,	'test44@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'M0AF60eQdX',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(50,	'Test 45',	0,	'test45@test.com',	'2022-08-10 19:05:34',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'mfjOoMba3P',	NULL,	NULL,	'2022-08-10 19:05:34',	'2022-08-10 19:05:34'),
(51,	'Test 46',	0,	'test46@test.com',	'2022-08-10 19:05:35',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'iZKrpUtKIE',	NULL,	NULL,	'2022-08-10 19:05:35',	'2022-08-10 19:05:35'),
(52,	'Test 47',	0,	'test47@test.com',	'2022-08-10 19:05:35',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'4NcVKSlwxM',	NULL,	NULL,	'2022-08-10 19:05:35',	'2022-08-10 19:05:35'),
(53,	'Test 48',	0,	'test48@test.com',	'2022-08-10 19:05:35',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'ITd2NzSZcS',	NULL,	NULL,	'2022-08-10 19:05:35',	'2022-08-10 19:05:35'),
(54,	'Test 49',	0,	'test49@test.com',	'2022-08-10 19:05:35',	'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi',	NULL,	NULL,	'elkTE9iu4D',	NULL,	NULL,	'2022-08-10 19:05:35',	'2022-08-10 19:05:35');

-- 2022-08-11 12:26:43
