-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 09:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('gipuby@mailinator.com|127.0.0.1', 'i:1;', 1736699285),
('gipuby@mailinator.com|127.0.0.1:timer', 'i:1736699284;', 1736699284),
('john.doe@example.com|127.0.0.1', 'i:4;', 1736600886),
('john.doe@example.com|127.0.0.1:timer', 'i:1736600886;', 1736600886),
('nihiroc@mailinator.com|127.0.0.1', 'i:1;', 1736699281),
('nihiroc@mailinator.com|127.0.0.1:timer', 'i:1736699281;', 1736699281),
('pygyfela@mailinator.com|127.0.0.1', 'i:1;', 1736699277),
('pygyfela@mailinator.com|127.0.0.1:timer', 'i:1736699277;', 1736699277),
('shadi1@gmail.com|127.0.0.1', 'i:1;', 1737792142),
('shadi1@gmail.com|127.0.0.1:timer', 'i:1737792142;', 1737792142);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `title`, `duration`, `status`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(3, 'Math', 6, 1, '2025-01-29', '2025-01-30', '2025-01-08 14:57:14', '2025-01-12 14:34:11'),
(6, 'Python Course', 5, 1, '2025-01-09', '2025-04-30', '2025-01-09 13:15:57', '2025-01-10 08:36:28'),
(7, 'Java Course', 5, 1, '2025-01-09', '2025-02-07', '2025-01-09 13:55:42', '2025-01-11 15:06:21'),
(8, 'Data Structure Course', 4, 1, '2025-01-09', '2025-02-07', '2025-01-09 13:56:05', '2025-01-10 08:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_user`
--

INSERT INTO `course_user` (`id`, `user_id`, `course_id`, `created_at`, `updated_at`) VALUES
(11, 30, 6, NULL, NULL),
(12, 30, 3, NULL, NULL),
(13, 30, 7, NULL, NULL),
(14, 30, 8, NULL, NULL),
(16, 31, 6, NULL, NULL),
(17, 32, 3, NULL, NULL),
(18, 32, 6, NULL, NULL),
(19, 32, 7, NULL, NULL),
(22, 34, 3, NULL, NULL),
(23, 34, 6, NULL, NULL),
(24, 34, 7, NULL, NULL),
(25, 34, 8, NULL, NULL),
(26, 35, 3, NULL, NULL),
(27, 35, 6, NULL, NULL),
(28, 35, 7, NULL, NULL),
(29, 35, 8, NULL, NULL),
(30, 31, 7, NULL, NULL),
(31, 31, 3, NULL, NULL),
(32, 31, 8, NULL, NULL),
(33, 46, 3, NULL, NULL),
(34, 46, 6, NULL, NULL),
(35, 46, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"c39705fe-1262-4c55-bb6e-93b3a23a9c39\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736517534, 1736517534),
(2, 'default', '{\"uuid\":\"6ede40ce-f3f5-4eba-a266-e99f6b39f045\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736517607, 1736517607),
(3, 'default', '{\"uuid\":\"2a9e8a95-c923-4f09-93d2-03b467804da2\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518124, 1736518124),
(4, 'default', '{\"uuid\":\"ea8f580f-40d8-45dc-8533-4bc9873e2d0e\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518162, 1736518162),
(5, 'default', '{\"uuid\":\"7e8edefa-2689-4c9a-955d-8241b01d4355\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518254, 1736518254),
(6, 'default', '{\"uuid\":\"d4b7ba19-b502-4adc-a4df-a4d92868730c\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518268, 1736518268),
(7, 'default', '{\"uuid\":\"633e0d1c-41fe-4ce9-9862-521bf4578799\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518392, 1736518392),
(8, 'default', '{\"uuid\":\"59d894ee-8f93-4a98-bfa2-ab1c278e3ff0\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518427, 1736518427),
(9, 'default', '{\"uuid\":\"452c074b-01eb-4042-ace6-2a3c8f7f72de\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518622, 1736518622),
(10, 'default', '{\"uuid\":\"456bc1b0-7422-4f21-b7e6-1974011c122c\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518622, 1736518622),
(11, 'default', '{\"uuid\":\"7bb78768-a848-4f89-aef8-2e6c3fdcb5c2\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518874, 1736518874),
(12, 'default', '{\"uuid\":\"5638df2e-6146-4dfc-865c-99284a9eaa66\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736518874, 1736518874),
(13, 'default', '{\"uuid\":\"1a8901a3-7ca1-406a-a6af-8645e35b7af0\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736519663, 1736519663),
(14, 'default', '{\"uuid\":\"79ff572b-8201-4677-857a-2b89076b4f94\",\"displayName\":\"App\\\\Events\\\\MessageSent\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":14:{s:5:\\\"event\\\";O:22:\\\"App\\\\Events\\\\MessageSent\\\":1:{s:7:\\\"message\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Message\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 0, NULL, 1736519663, 1736519663);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `video_url` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lessons`
--

INSERT INTO `lessons` (`id`, `course_id`, `video_url`, `title`, `order`, `created_at`, `updated_at`) VALUES
(1, 8, 'videos/QzbOBSqlgeyr6HpsalegjEEg5na4vL3rKnhTcw7c.mp4', 'Officia perferendis', 1, '2025-01-25 06:05:00', '2025-01-25 06:05:00'),
(2, 8, 'videos/3in3LW6zU5Vm0APbRwNjEM8eXFkHTQ2TWFfHp2AG.mp4', 'Duis iure praesentiu', 3, '2025-01-25 07:54:45', '2025-01-25 07:54:45'),
(3, 8, 'videos/qn8jgeGKDbqiGghl3FiprvuaYzRwQbu07Ok3vWsB.mp4', 'Laboriosam illum N', 28, '2025-01-25 09:24:12', '2025-01-25 09:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `mark` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `user_id`, `course_id`, `mark`, `created_at`, `updated_at`) VALUES
(1, 30, 3, 55.00, '2025-01-09 15:10:14', '2025-01-09 15:13:37'),
(2, 30, 7, 99.00, '2025-01-09 15:12:33', '2025-01-09 15:55:59'),
(3, 30, 6, 44.00, '2025-01-09 15:13:14', '2025-01-10 08:31:32'),
(4, 31, 3, 99.00, '2025-01-09 15:38:26', '2025-01-11 08:24:16'),
(5, 34, 6, 55.00, '2025-01-10 13:18:29', '2025-01-11 14:46:04'),
(6, 34, 7, 98.00, '2025-01-10 13:18:41', '2025-01-10 13:18:41'),
(7, 35, 3, 55.00, '2025-01-11 09:41:14', '2025-01-11 09:41:14'),
(8, 30, 8, 89.00, '2025-01-12 10:07:42', '2025-01-12 11:15:47'),
(9, 34, 8, 77.00, '2025-01-12 10:36:19', '2025-01-12 10:36:19'),
(10, 34, 3, 57.00, '2025-01-12 11:16:28', '2025-01-12 11:16:28'),
(11, 46, 3, 88.00, '2025-01-12 16:01:04', '2025-01-12 16:01:04'),
(12, 46, 6, 77.00, '2025-01-12 16:01:13', '2025-01-12 16:01:13');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 30, 31, 'ss', '2025-01-10 09:47:32', '2025-01-10 09:47:32'),
(2, 30, 31, 'sss', '2025-01-10 09:50:29', '2025-01-10 09:50:29'),
(3, 30, 31, 'sss', '2025-01-10 09:50:31', '2025-01-10 09:50:31'),
(4, 30, 31, 'sda', '2025-01-10 09:53:21', '2025-01-10 09:53:21'),
(5, 30, 31, 'sadas', '2025-01-10 09:53:37', '2025-01-10 09:53:37'),
(6, 30, 1, 'ss', '2025-01-10 10:03:51', '2025-01-10 10:03:51'),
(7, 30, 1, 'sda', '2025-01-10 10:14:49', '2025-01-10 10:14:49'),
(8, 30, 1, 'sda', '2025-01-10 10:15:04', '2025-01-10 10:15:04'),
(9, 30, 1, 'sda', '2025-01-10 10:15:04', '2025-01-10 10:15:04'),
(10, 30, 1, 'sss', '2025-01-10 10:17:06', '2025-01-10 10:17:06'),
(11, 30, 1, 'ss', '2025-01-10 10:23:41', '2025-01-10 10:23:41'),
(12, 30, 1, 'helllo', '2025-01-10 10:25:07', '2025-01-10 10:25:07'),
(13, 30, 1, 'sss', '2025-01-10 10:25:50', '2025-01-10 10:25:50'),
(14, 30, 1, 'ss', '2025-01-10 10:27:07', '2025-01-10 10:27:07'),
(15, 30, 1, 'ssssss', '2025-01-10 10:35:23', '2025-01-10 10:35:23'),
(16, 30, 1, 'ssss', '2025-01-10 10:35:49', '2025-01-10 10:35:49'),
(17, 30, 1, 'ss', '2025-01-10 10:36:06', '2025-01-10 10:36:06'),
(18, 30, 1, 'ssss', '2025-01-10 10:43:35', '2025-01-10 10:43:35'),
(19, 30, 1, 'sss', '2025-01-10 10:44:00', '2025-01-10 10:44:00'),
(20, 30, 1, 'sss', '2025-01-10 10:45:22', '2025-01-10 10:45:22'),
(21, 30, 1, 'ss', '2025-01-10 10:50:57', '2025-01-10 10:50:57'),
(22, 30, 1, 'sss', '2025-01-10 10:51:07', '2025-01-10 10:51:07'),
(23, 30, 1, 'sssdsdsd', '2025-01-10 10:51:27', '2025-01-10 10:51:27'),
(24, 30, 1, 'helllo', '2025-01-10 10:58:54', '2025-01-10 10:58:54'),
(25, 30, 1, 'sss', '2025-01-10 11:00:07', '2025-01-10 11:00:07'),
(26, 30, 1, 'helllo', '2025-01-10 11:08:44', '2025-01-10 11:08:44'),
(27, 30, 1, 'ssssss', '2025-01-10 11:09:22', '2025-01-10 11:09:22'),
(28, 30, 1, 'ssss', '2025-01-10 11:10:54', '2025-01-10 11:10:54'),
(29, 30, 1, 'sss', '2025-01-10 11:11:08', '2025-01-10 11:11:08'),
(30, 30, 1, 's', '2025-01-10 11:13:12', '2025-01-10 11:13:12'),
(31, 30, 1, 's', '2025-01-10 11:13:47', '2025-01-10 11:13:47'),
(32, 30, 1, 's', '2025-01-10 11:17:02', '2025-01-10 11:17:02'),
(33, 30, 32, 'ss', '2025-01-10 11:21:14', '2025-01-10 11:21:14'),
(34, 30, 1, 's', '2025-01-10 11:34:23', '2025-01-10 11:34:23'),
(35, 30, 1, 'ggg', '2025-01-10 11:36:53', '2025-01-10 11:36:53'),
(36, 30, 31, 'sdaasd', '2025-01-10 11:37:22', '2025-01-10 11:37:22'),
(37, 30, 32, 'ss', '2025-01-10 11:38:50', '2025-01-10 11:38:50'),
(38, 30, 1, 'sss', '2025-01-10 11:44:30', '2025-01-10 11:44:30'),
(39, 30, 1, 'helllo', '2025-01-10 11:45:23', '2025-01-10 11:45:23'),
(40, 30, 1, 'heelo2', '2025-01-10 11:48:43', '2025-01-10 11:48:43'),
(41, 30, 1, '333', '2025-01-10 11:50:57', '2025-01-10 11:50:57'),
(42, 30, 1, '444', '2025-01-10 11:52:15', '2025-01-10 11:52:15'),
(43, 30, 1, 'ddd', '2025-01-10 11:53:17', '2025-01-10 11:53:17'),
(44, 30, 31, 'xxx', '2025-01-10 12:17:13', '2025-01-10 12:17:13'),
(45, 30, 31, 'xx', '2025-01-10 12:17:52', '2025-01-10 12:17:52'),
(46, 30, 31, 'sda', '2025-01-10 12:17:57', '2025-01-10 12:17:57'),
(47, 30, 31, 's', '2025-01-10 12:18:23', '2025-01-10 12:18:23'),
(48, 30, 31, 'sss', '2025-01-10 12:18:56', '2025-01-10 12:18:56'),
(49, 1, 30, 'hii', '2025-01-10 12:32:09', '2025-01-10 12:32:09'),
(50, 1, 30, 'hii', '2025-01-10 12:32:18', '2025-01-10 12:32:18'),
(51, 1, 30, 'hiii', '2025-01-10 12:32:56', '2025-01-10 12:32:56'),
(52, 1, 30, 'kkkk', '2025-01-10 12:33:56', '2025-01-10 12:33:56'),
(53, 1, 30, 'sss', '2025-01-10 12:35:35', '2025-01-10 12:35:35'),
(54, 1, 30, 'hiii', '2025-01-10 12:45:50', '2025-01-10 12:45:50'),
(55, 1, 30, 'jjjjj', '2025-01-10 12:46:10', '2025-01-10 12:46:10'),
(56, 1, 30, 'helllo', '2025-01-10 12:48:32', '2025-01-10 12:48:32'),
(57, 1, 30, 'sda', '2025-01-10 12:49:50', '2025-01-10 12:49:50'),
(58, 1, 30, 'helllo', '2025-01-10 12:50:31', '2025-01-10 12:50:31'),
(59, 1, 30, 'sda', '2025-01-10 12:59:24', '2025-01-10 12:59:24'),
(60, 1, 30, 'helllo', '2025-01-10 13:01:00', '2025-01-10 13:01:00'),
(61, 1, 30, 'helllo22', '2025-01-10 13:03:27', '2025-01-10 13:03:27'),
(62, 30, 1, 'ss', '2025-01-10 13:07:56', '2025-01-10 13:07:56'),
(63, 1, 30, 'ss', '2025-01-10 13:08:20', '2025-01-10 13:08:20'),
(64, 1, 30, 'helllo', '2025-01-10 13:08:38', '2025-01-10 13:08:38'),
(65, 1, 6, 'sad', '2025-01-10 13:15:57', '2025-01-10 13:15:57'),
(66, 1, 34, 'hi', '2025-01-10 13:24:49', '2025-01-10 13:24:49'),
(67, 1, 34, 'hi', '2025-01-10 13:24:51', '2025-01-10 13:24:51'),
(68, 1, 34, '22', '2025-01-10 13:27:43', '2025-01-10 13:27:43'),
(69, 34, 1, 'hello', '2025-01-10 13:27:51', '2025-01-10 13:27:51'),
(70, 30, 34, 'hi', '2025-01-10 13:31:00', '2025-01-10 13:31:00'),
(71, 34, 30, 'helllo', '2025-01-10 13:31:12', '2025-01-10 13:31:12'),
(72, 1, 34, 'helllo2', '2025-01-10 13:37:54', '2025-01-10 13:37:54'),
(73, 1, 34, 'hi omar', '2025-01-10 13:40:58', '2025-01-10 13:40:58'),
(74, 34, 1, 'Nesciunt vel quia v', '2025-01-10 13:53:20', '2025-01-10 13:53:20'),
(75, 34, 1, 'helllo', '2025-01-10 14:02:58', '2025-01-10 14:02:58'),
(76, 34, 1, 'hi omar', '2025-01-10 14:16:25', '2025-01-10 14:16:25'),
(77, 34, 32, 'helllo', '2025-01-10 15:06:42', '2025-01-10 15:06:42'),
(84, 1, 34, 'helllo', '2025-01-10 15:17:29', '2025-01-10 15:17:29'),
(85, 34, 30, 'hello', '2025-01-11 08:24:53', '2025-01-11 08:24:53'),
(86, 34, 1, 'hello', '2025-01-11 08:41:23', '2025-01-11 08:41:23'),
(87, 1, 34, 'hello', '2025-01-11 10:01:26', '2025-01-11 10:01:26'),
(88, 1, 34, 'hello', '2025-01-11 10:02:22', '2025-01-11 10:02:22'),
(89, 1, 34, 'hello', '2025-01-11 10:02:39', '2025-01-11 10:02:39'),
(90, 35, 1, 'hello', '2025-01-11 10:09:00', '2025-01-11 10:09:00'),
(91, 35, 1, 'hello2', '2025-01-11 10:09:27', '2025-01-11 10:09:27'),
(92, 35, 1, 'test', '2025-01-11 10:12:54', '2025-01-11 10:12:54'),
(93, 1, 35, 'hello', '2025-01-11 10:14:17', '2025-01-11 10:14:17'),
(94, 1, 35, 'hello2', '2025-01-11 10:17:25', '2025-01-11 10:17:25'),
(95, 34, 1, 'hello from apii', '2025-01-11 10:43:59', '2025-01-11 10:43:59'),
(96, 34, 1, 'hello from apii', '2025-01-11 11:47:45', '2025-01-11 11:47:45'),
(98, 34, 1, 'hello from apii2', '2025-01-11 12:50:07', '2025-01-11 12:50:07'),
(99, 34, 1, 'hello', '2025-01-11 12:55:24', '2025-01-11 12:55:24'),
(100, 34, 1, 'hello', '2025-01-11 12:55:43', '2025-01-11 12:55:43'),
(101, 34, 1, 'hello from apii2', '2025-01-11 12:56:15', '2025-01-11 12:56:15'),
(102, 34, 1, 'hello from apii2', '2025-01-11 13:00:34', '2025-01-11 13:00:34'),
(103, 34, 1, 'hello from apii22', '2025-01-11 13:01:26', '2025-01-11 13:01:26'),
(104, 1, 34, 'hello', '2025-01-11 13:07:22', '2025-01-11 13:07:22'),
(105, 34, 1, 'hello from apii2222', '2025-01-11 13:10:58', '2025-01-11 13:10:58'),
(106, 34, 1, 'hello from apii2222', '2025-01-11 13:19:30', '2025-01-11 13:19:30'),
(107, 1, 34, 'hello', '2025-01-11 13:21:33', '2025-01-11 13:21:33'),
(108, 1, 34, 'hello', '2025-01-11 13:23:01', '2025-01-11 13:23:01'),
(109, 1, 34, 'hello', '2025-01-11 13:23:16', '2025-01-11 13:23:16'),
(110, 1, 34, 'hello', '2025-01-11 13:23:26', '2025-01-11 13:23:26'),
(111, 34, 1, 'hello from apii2222', '2025-01-11 13:23:37', '2025-01-11 13:23:37'),
(112, 34, 1, 'hello test', '2025-01-11 13:24:14', '2025-01-11 13:24:14'),
(113, 34, 1, 'hello test2', '2025-01-11 13:39:21', '2025-01-11 13:39:21'),
(114, 1, 34, 'hello', '2025-01-11 15:06:39', '2025-01-11 15:06:39'),
(115, 1, 34, 'hello', '2025-01-11 15:16:26', '2025-01-11 15:16:26'),
(116, 34, 1, 'hello', '2025-01-11 15:16:33', '2025-01-11 15:16:33'),
(117, 34, 1, '😒😒😒', '2025-01-11 15:27:19', '2025-01-11 15:27:19'),
(118, 1, 34, '💕😂😂😂', '2025-01-11 15:44:32', '2025-01-11 15:44:32'),
(119, 1, 34, '😒😒😒', '2025-01-11 15:46:12', '2025-01-11 15:46:12'),
(120, 1, 34, 'hello', '2025-01-11 15:47:45', '2025-01-11 15:47:45'),
(121, 1, 34, 'hello 2', '2025-01-11 15:49:07', '2025-01-11 15:49:07'),
(122, 1, 34, 'hi', '2025-01-12 08:42:11', '2025-01-12 08:42:11'),
(123, 1, 34, 'hi', '2025-01-12 08:42:16', '2025-01-12 08:42:16'),
(124, 34, 1, 'hi ,,hru ??', '2025-01-12 08:42:38', '2025-01-12 08:42:38'),
(125, 1, 34, 'i`m good , wbu ?', '2025-01-12 08:43:11', '2025-01-12 08:43:11'),
(126, 34, 1, 'im fine thx for asking', '2025-01-12 08:43:42', '2025-01-12 08:43:42'),
(127, 34, 31, 'hiii', '2025-01-12 10:55:56', '2025-01-12 10:55:56'),
(128, 34, 1, 'what are u up to ?', '2025-01-12 11:22:10', '2025-01-12 11:22:10'),
(129, 34, 1, '?', '2025-01-12 11:25:56', '2025-01-12 11:25:56'),
(130, 34, 1, '?', '2025-01-12 11:26:05', '2025-01-12 11:26:05'),
(131, 1, 34, 'nothing', '2025-01-12 11:26:39', '2025-01-12 11:26:39'),
(132, 34, 1, 'hello from apii', '2025-01-12 11:50:55', '2025-01-12 11:50:55'),
(133, 45, 1, 'hi', '2025-01-12 13:45:42', '2025-01-12 13:45:42'),
(134, 1, 45, 'hi', '2025-01-12 13:45:57', '2025-01-12 13:45:57'),
(135, 1, 45, 'how can i help you ?', '2025-01-12 13:46:21', '2025-01-12 13:46:21'),
(136, 45, 1, 'i cant see my courses in my dashboard', '2025-01-12 13:46:55', '2025-01-12 13:46:55'),
(137, 1, 45, 'ok , let  me check ...', '2025-01-12 13:47:50', '2025-01-12 13:47:50'),
(138, 1, 34, 'hii', '2025-01-12 14:09:01', '2025-01-12 14:09:01'),
(139, 1, 38, 'hi', '2025-01-12 14:15:03', '2025-01-12 14:15:03'),
(140, 1, 33, 'hi', '2025-01-12 14:17:12', '2025-01-12 14:17:12'),
(141, 1, 24, 'hiii', '2025-01-12 14:17:31', '2025-01-12 14:17:31'),
(142, 46, 1, 'Hi', '2025-01-12 16:01:47', '2025-01-12 16:01:47'),
(143, 30, 34, 'hi', '2025-01-23 13:54:16', '2025-01-23 13:54:16'),
(144, 30, 1, 'hi', '2025-01-23 13:54:30', '2025-01-23 13:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_08_123700_add_role_to_users_table', 2),
(5, '2025_01_08_171638_create_courses_table', 3),
(6, '2025_01_08_221946_create_course_user_table', 4),
(7, '2025_01_09_172823_add_mark_for_student', 5),
(8, '2025_01_09_175803_create_marks_table', 6),
(9, '2025_01_10_120328_create_messages_table', 7),
(10, '2025_01_11_120642_create_personal_access_tokens_table', 8),
(11, '2025_01_23_170201_create_lessons_table', 9),
(12, '2025_01_23_170304_create_videos_table', 9),
(13, '2025_01_25_082810_create_lesson_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('omar@gmail.com', '$2y$12$iZWRaXibc4wMTxa4j2dRAuE3XD6NzHhScqtD6T66LqGPTw8Lyf/L2', '2025-01-12 13:27:15'),
('shadisaad222@gmail.com', '$2y$12$8G1UL7YnQF1gcaeqevI1I.nyaoIvNYv3TeYHAWFFAKZBAWnuhQofC', '2025-01-12 13:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 35, 'auth_token', 'ca3969e9a363c60d40d5c12c4c4d07bc056849cf0dca86fc0bfae9e4e10be74c', '[\"*\"]', '2025-01-11 09:22:13', NULL, '2025-01-11 09:21:34', '2025-01-11 09:22:13'),
(2, 'App\\Models\\User', 35, 'auth_token', '80a9c310f93fd03c4c7b20aea1a8426d47ac23a6feaf7d512c0faeb1db167083', '[\"*\"]', '2025-01-11 10:23:56', NULL, '2025-01-11 09:33:28', '2025-01-11 10:23:56'),
(3, 'App\\Models\\User', 34, 'auth_token', '4b9d1f01e2118c45f9ffd71b5afc2fbd8d0e0f944da07f73f7418934209719bb', '[\"*\"]', '2025-01-12 11:50:55', NULL, '2025-01-11 10:33:04', '2025-01-12 11:50:55'),
(4, 'App\\Models\\User', 34, 'auth_token', '4933cb585af6922ab89ef065b240709163038ddbc98281e59f29ce1e5fe6373b', '[\"*\"]', NULL, NULL, '2025-01-11 10:34:59', '2025-01-11 10:34:59'),
(5, 'App\\Models\\User', 37, 'auth_token', 'c84f3dcacaf833ceb3fc6309469d08fba55fc8c71b136118e0d993b9e5bf08b2', '[\"*\"]', NULL, NULL, '2025-01-11 10:36:04', '2025-01-11 10:36:04'),
(6, 'App\\Models\\User', 34, 'auth_token', '8e0f2404acc4dae302ef78c75b4c4df11c054af629da0ee06244260af23c6c54', '[\"*\"]', NULL, NULL, '2025-01-11 10:36:58', '2025-01-11 10:36:58'),
(7, 'App\\Models\\User', 38, 'auth_token', '1308b8309057d5aee0ce1cf3acea264f26c7bb8af4ac97e535d6aaf0b49ad5fb', '[\"*\"]', NULL, NULL, '2025-01-11 10:38:01', '2025-01-11 10:38:01'),
(8, 'App\\Models\\User', 39, 'auth_token', '6b8bc404304bf10800370f3c045ffc3baeab907b01ba17ed077890d2c422edde', '[\"*\"]', NULL, NULL, '2025-01-11 11:34:20', '2025-01-11 11:34:20'),
(9, 'App\\Models\\User', 40, 'auth_token', '904280b6fecd1efef8503dca615982730ffe3efa8d8170f7e5ea963b9415501e', '[\"*\"]', NULL, NULL, '2025-01-11 11:41:19', '2025-01-11 11:41:19'),
(10, 'App\\Models\\User', 34, 'auth_token', '80a70317f532f940df903f9389640ec986162a51371864ab7348ff9efdc40c1f', '[\"*\"]', NULL, NULL, '2025-01-11 11:42:17', '2025-01-11 11:42:17'),
(11, 'App\\Models\\User', 41, 'auth_token', '2cf1f55b7bef29f055d930206e9de222499d8b41a1187e2f930b11d0b04d8fb6', '[\"*\"]', NULL, NULL, '2025-01-11 11:44:27', '2025-01-11 11:44:27'),
(12, 'App\\Models\\User', 34, 'auth_token', 'a1e79299c61eee603e08509cc072235c6b3093abf156558fe3be06330e7ab6a1', '[\"*\"]', NULL, NULL, '2025-01-11 11:45:02', '2025-01-11 11:45:02'),
(13, 'App\\Models\\User', 42, 'auth_token', '5064c1e910f55a3ca3b35e48f6b34f4cfcf7580a8e5d994aa8d873fae21160cc', '[\"*\"]', NULL, NULL, '2025-01-11 12:04:08', '2025-01-11 12:04:08'),
(14, 'App\\Models\\User', 43, 'auth_token', 'b913e87f692ced1f16789ee369f33ff31ed7f3a566b9ed993924ca49bd4689ec', '[\"*\"]', NULL, NULL, '2025-01-11 12:12:15', '2025-01-11 12:12:15'),
(15, 'App\\Models\\User', 34, 'auth_token', 'a38497b77cae2bab1868f19a6221d155cc0c8c93925356db429e88ecd98e31ec', '[\"*\"]', NULL, NULL, '2025-01-11 13:09:07', '2025-01-11 13:09:07'),
(16, 'App\\Models\\User', 34, 'auth_token', 'a73066920dba2c6c06c00090ad84a08cff1b4dac6c88260fce8ba221961f0018', '[\"*\"]', NULL, NULL, '2025-01-12 11:50:53', '2025-01-12 11:50:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bv6YF0P5dEhuaS4cwQOOsaPD63skvLX1uFBfmcNN', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV1ozazBaMVV4ckZ6SDl6MjJjTkU2NkxGcjVlZmRtSmFoOGNqVXRBOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi91c2VycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1737809153),
('cyniI62VpX7HzCZbyH2lDSNwa9chxNHaS6NGp9UZ', 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQVJwWmVUbWR3SnNnWjdraWlPU3lycm1RWlpBVHRISmNFNXo2ZER5MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jb3Vyc2UtbGVzc29uLzgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozMDt9', 1737804493),
('LeTHjjP7SgYVCf3PoWISfQNNwjA2Ig0zorI88zrE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 Edg/132.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibjJTYUxLVTNhV09jMnEyNlRQdlcxRVdtb2wwOWJrRnVGQzBnekJnbyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1737824928),
('VGMowD6ViGWVJwYFckypfS18e9JRk1KlXrUzX9Iy', 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36 Edg/133.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUTA4dVVXOWs2Mlo4N2cwNXZrN0Vzang2ajhSeFZTdmFaWW5BSzhDdyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jaGF0Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MzA7fQ==', 1737978042);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('student','admin') NOT NULL DEFAULT 'student',
  `status` enum('active','pending') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `status`) VALUES
(1, 'shadi2', 'shadisaad222@gmail.com', NULL, '$2y$12$buq//AqAQWfOc1Onj34SLu7NhQnEh18bL4Z3IlM471RYggR2V1iii', NULL, '2025-01-07 18:10:59', '2025-01-08 08:06:06', 'admin', 'pending'),
(6, 'Stephen Ball', 'huvev@mailinator.com', NULL, '$2y$12$DuGQtphOhf7eZ4fMN/oPR.q7gu7Iey5cEksb9aqC7S5UlgZx3i7c6', NULL, '2025-01-08 11:23:36', '2025-01-08 11:23:36', 'student', 'active'),
(10, 'Levi Morrow', 'fonex@mailinator.com', NULL, '$2y$12$j4n9U0vMslrqutq.OkeoUOodB/c7zVMUUlCcfUc3v5b80XuRNpVC.', NULL, '2025-01-08 11:30:19', '2025-01-08 11:30:19', 'student', 'active'),
(14, 'Madeline Wong', 'hecog@mailinator.com', NULL, '$2y$12$cgaUP45DIB/uYZnoT4aj7eJYzp5DNabNTB5k7vHmqi6rGaeJt9XiG', NULL, '2025-01-08 11:39:22', '2025-01-08 11:39:22', 'student', 'active'),
(16, 'Julian Kerr', 'sahoqy@mailinator.com', NULL, '$2y$12$K70P0.zFB1X0uCd1c5nFFuLnkBCMG8FC0L8w8Gff1Of6CbKccJX62', NULL, '2025-01-08 11:44:59', '2025-01-09 10:03:57', 'student', 'active'),
(21, 'Nell Shannon', 'cofe@mailinator.com', NULL, '$2y$12$Bl1CV.u65ozraEAm/0WUQ.vDmXk8IKM0K1/wHShS3jjpOptRMOMem', NULL, '2025-01-08 15:36:07', '2025-01-09 08:36:21', 'student', 'active'),
(24, 'Len Kidd', 'wuvemi@mailinator.com', NULL, '$2y$12$ZzKsdQb1tV7QkXmgF/TajO5Ml7jxmBdR2V/GYxWqz7QvhZUukQe02', NULL, '2025-01-08 15:42:41', '2025-01-10 08:31:44', 'student', 'pending'),
(29, 'Rebecca Salinas', 'xykyruj@mailinator.com', NULL, '$2y$12$7E4OIbmlL3dLyaLK.HoPBuWiIQYQcAOxwhWsXHlSYD3iVSgtjDBa.', NULL, '2025-01-09 08:30:35', '2025-01-09 10:34:25', 'student', 'active'),
(30, 'hamza', 'hamza@gmail.com', NULL, '$2y$12$9Cx2oRvWsMv7ZlZ0L.PH5.7dTHtm4YqcKV1OW4APk6JuaUXbAmW.2', NULL, '2025-01-09 11:05:31', '2025-01-09 13:10:15', 'student', 'active'),
(31, 'abood', 'abood@gmail.com', NULL, '$2y$12$4a3nd959FEWrqfPwaWwTKu47lu/iMZEzGCeBcJ4dAph0ynz74Sh7K', NULL, '2025-01-09 13:50:02', '2025-01-09 13:50:02', 'student', 'active'),
(32, 'ahmad', 'ahmad@gmail.com', NULL, '$2y$12$uheXtKWjJis84xKETmG.LOuDc43c8G7shGzHy1DxuZl18zfXr0ElS', NULL, '2025-01-09 13:51:22', '2025-01-09 13:51:22', 'student', 'active'),
(33, 'Wylie Dillon', 'kalibadog@mailinator.com', NULL, '$2y$12$EDdUkDLBulpM7h.rk323LOStq0NvtyaPeWIGIAM8hWtWTt1AtiaB.', NULL, '2025-01-09 15:29:35', '2025-01-09 15:29:35', 'student', 'pending'),
(34, 'omar', 'omar@gmail.com', NULL, '$2y$12$YajmvpLuT5xMb/so.cn9TeRXV4Ea4A3/uBxRtBg2qqxuvr.IRTESS', NULL, '2025-01-10 13:18:02', '2025-01-12 11:10:14', 'student', 'active'),
(35, 'John Doe', 'john@example.com', NULL, '$2y$12$RPGeMUByn80oKI2rbBPa9.W3sVcqzFi3RoJ/z1BGsBGeECUjtxSjm', NULL, '2025-01-11 09:21:34', '2025-01-11 09:21:34', 'student', 'pending'),
(36, 'shadi test', 'shaditest@gmail.com', NULL, '$2y$12$aWwk4hyMwNI7IeDmTHUFreNMeic0.m8nVFVvTEKB14M7hSHI6nSbq', NULL, '2025-01-11 09:23:00', '2025-01-11 09:23:00', 'student', 'pending'),
(38, 'Abood2', 'abood2@gmail.com', NULL, '$2y$12$G9HUhUGbPOquHR/.7hGxxeClLM.8q6kPcyDocOFjjVcUfPSSak6Z2', NULL, '2025-01-11 10:38:01', '2025-01-25 09:25:29', 'student', 'active'),
(41, 'Abood2', 'abood4@gmail.com', NULL, '$2y$12$RsASJk0Ty41qKNgDho0uyORekgrrdX25qr0ch3UhUkFtSOlS3HmQa', NULL, '2025-01-11 11:44:27', '2025-01-11 14:42:22', 'student', 'active'),
(44, 'shadi test2', 'shaditest2@gmail.com', NULL, '$2y$12$nm5zlbTUQDQYlQUouVLPk.3waH2bO1.sSdNUR4vNXxMeWV3V.Yf86', NULL, '2025-01-11 14:42:06', '2025-01-11 14:42:06', 'student', 'active'),
(45, 'lana', 'lana@gmail.com', NULL, '$2y$12$NZSB6u/dZqEYL9p6hl99HuSMl3zHf1blshen4pIFvtC.g49aTMXg6', NULL, '2025-01-12 13:33:47', '2025-01-12 13:41:20', 'student', 'active'),
(46, 'abood782', 'abood782@gmail.com', NULL, '$2y$12$Xd.1uaCXwge.4MiFhmBiieHzH6IBUJUFOKfvSsFyCfT/4tHqFmRhq', NULL, '2025-01-12 15:59:34', '2025-01-12 16:00:35', 'student', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_user_user_id_foreign` (`user_id`),
  ADD KEY `course_user_course_id_foreign` (`course_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `marks_user_id_course_id_unique` (`user_id`,`course_id`),
  ADD KEY `marks_course_id_foreign` (`course_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `marks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
