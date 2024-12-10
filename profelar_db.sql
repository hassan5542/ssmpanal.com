-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2024 at 09:22 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profelar_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `balance`, `name`, `photo`, `email`, `email_verified_at`, `password`, `salary_date`, `type`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0.00, 'Md Admin', '/public/admin/assets/images/profile/1706650015HOx.png', 'admin@gmail.com', '2023-11-29 18:37:08', '$2y$10$.O9ojm05bHOurPnS1zujtObf8hDTE8HnJLhK6dI.LiAYMaYKMPhQS', '2024-05-03', 'admin', '01600000000', 'sd', 'SzT6VQmZW8vVLyfQi0AMBeN6Q2mDPEP6uU0utqAsrcbW0pQKXTD0RbavvEWg', '2023-11-28 11:11:57', '2024-09-08 18:40:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_ledgers`
--

CREATE TABLE `admin_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perticulation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `debit` double NOT NULL DEFAULT 0,
  `credit` double NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bonus_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter` int(11) DEFAULT 0 COMMENT 'user get service count',
  `set_service_counter` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winner` int(11) DEFAULT 0,
  `amount` double NOT NULL DEFAULT 0,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`id`, `bonus_name`, `counter`, `set_service_counter`, `code`, `winner`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(80, '1', 100, 100, 'FO9TT', 1, 50, 'active', '2024-09-12 12:05:18', '2024-09-12 13:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `bonus_ledgers`
--

CREATE TABLE `bonus_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bonus_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `bonus_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `date` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `token` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User Number',
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User Deposit Amount',
  `charge_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `final_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','rejected','approved') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_name`, `method_number`, `photo`, `order_id`, `transaction_id`, `number`, `amount`, `charge_amount`, `final_amount`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'USDT1', 'XXXX', NULL, '34023', 'XXXXXXXXX', NULL, '5000', 0.00, 5000.00, '28-10-2024 23:02:31', 'approved', '2024-10-29 06:02:31', '2024-10-29 06:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds`
--

CREATE TABLE `funds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double(20,2) NOT NULL DEFAULT 0.00 COMMENT 'percent',
  `validity` bigint(20) NOT NULL,
  `minimum_invest` double(20,2) NOT NULL DEFAULT 0.00 COMMENT 'amount',
  `status` enum('upcoming','active') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `funds`
--

INSERT INTO `funds` (`id`, `name`, `title`, `photo`, `commission`, `validity`, `minimum_invest`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fund 1', 'Fund oneFund oneFund oneFund one', '/public/upload/fund/1714067352YBp.jpg', 800.00, 5, 500.00, 'active', '2023-06-06 15:38:44', '2024-04-25 23:49:12'),
(18, 'Fund 2', 'Event', '/public/upload/fund/1714067554sbV.jpg', 2500.00, 2, 1500.00, 'active', '2024-03-24 11:28:12', '2024-05-01 07:27:28'),
(19, 'Fund 3', 'Event', '/public/upload/fund/1714067820Ksw.jpg', 3000.00, 1, 2000.00, 'active', '2024-03-24 11:29:44', '2024-05-01 07:25:27'),
(24, 'Fund 3', 'Vip4', '/public/upload/fund/171452681034u.jpg', 7500.00, 1, 5000.00, 'active', '2024-05-01 07:26:51', '2024-05-01 07:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `fund_invests`
--

CREATE TABLE `fund_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fund_id` bigint(20) UNSIGNED NOT NULL,
  `validity_expired` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `return_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lucky_ledgers`
--

CREATE TABLE `lucky_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `draw_id` bigint(20) DEFAULT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `current_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `validity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'count days',
  `commission_with_avg_amount` double NOT NULL DEFAULT 0 COMMENT 'user get average amount after validity',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `aaa` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `category`, `name`, `title`, `photo`, `price`, `validity`, `commission_with_avg_amount`, `status`, `aaa`, `created_at`, `updated_at`) VALUES
(24, 'V.I.P 1', 'V.I.P 1', 'V.I.P 1', '/public/upload/package/1730119542YJj.png', 800, '47', 4512, 'active', '', '2024-01-07 16:59:51', '2024-10-29 01:45:46'),
(25, 'V.I.P 2', 'V.I.P 2', 'V.I.P 2', '/public/upload/package/17301195545CD.png', 1900, '47', 12502, 'active', '', '2024-01-07 17:03:27', '2024-10-29 01:45:55'),
(26, 'V.I.P 3', 'V.I.P 3', 'V.I.P 3', '/public/upload/package/1730119565s1R.png', 3500, '52', 23660, 'active', '', '2024-01-07 17:07:38', '2024-10-29 01:46:05'),
(27, 'V.I.P 4', 'V.I.P 4', 'V.I.P 4', '/public/upload/package/1730119581p6F.png', 6800, '55', 52360, 'active', '', '2024-01-09 18:21:25', '2024-10-29 01:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `address`, `photo`, `status`, `name`, `created_at`, `updated_at`) VALUES
(22, '01862044930', '/public/upload/package/1727674560MXC.png', 'active', 'USDT1', '2024-07-12 02:52:37', '2024-09-30 05:36:00'),
(23, '01309935737', '/public/upload/package/17276745669Yl.png', 'active', 'USDT2', '2024-07-12 02:53:15', '2024-09-30 05:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `daily_income` double(20,2) NOT NULL DEFAULT 0.00,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `validity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `user_id`, `package_id`, `amount`, `daily_income`, `date`, `status`, `validity`, `created_at`, `updated_at`) VALUES
(1, 1, 24, 800, 96.00, '2024-10-29 23:02:59', 'active', '2024-12-14 23:02:59', '2024-10-29 06:02:59', '2024-10-29 06:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `rebates`
--

CREATE TABLE `rebates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interest_commission1` double NOT NULL,
  `interest_commission2` double NOT NULL,
  `interest_commission3` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rebates`
--

INSERT INTO `rebates` (`id`, `interest_commission1`, `interest_commission2`, `interest_commission3`, `created_at`, `updated_at`) VALUES
(1, 20, 3, 2, NULL, '2024-09-06 10:05:13');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `withdraw_charge` int(11) NOT NULL DEFAULT 0 COMMENT 'percent',
  `minimum_withdraw` double(20,2) NOT NULL DEFAULT 0.00,
  `maximum_withdraw` double(20,2) NOT NULL DEFAULT 0.00,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `w_time_status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `checkin` double(20,2) NOT NULL DEFAULT 0.00,
  `registration_bonus` double(20,2) NOT NULL DEFAULT 0.00,
  `total_member_register_reword` int(11) NOT NULL DEFAULT 0,
  `total_member_register_reword_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `service` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `withdraw_charge`, `minimum_withdraw`, `maximum_withdraw`, `photo`, `w_time_status`, `checkin`, `registration_bonus`, `total_member_register_reword`, `total_member_register_reword_amount`, `service`, `created_at`, `updated_at`) VALUES
(1, 1, 200.00, 50000.00, '/public/upload/package/1730135211qhu.png', 'active', 0.00, 0.00, 0, 0.00, 'https://t.me/profelartech', '2022-01-18 11:03:22', '2024-10-29 06:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invest` double NOT NULL DEFAULT 0,
  `bonus` double NOT NULL DEFAULT 0,
  `team_size` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `invest`, `bonus`, `team_size`, `created_at`, `updated_at`) VALUES
(9, 200000, 1500, 150, '2024-05-04 06:56:19', '2024-05-04 06:56:19'),
(10, 400000, 3000, 500, '2024-05-04 06:57:05', '2024-05-04 06:57:05'),
(11, 1000000, 7000, 1500, '2024-05-04 06:57:58', '2024-05-04 06:57:58');

-- --------------------------------------------------------

--
-- Table structure for table `task_requests`
--

CREATE TABLE `task_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_invest` double NOT NULL DEFAULT 0,
  `team_size` bigint(20) NOT NULL DEFAULT 0,
  `bonus` double NOT NULL DEFAULT 0,
  `status` enum('pending','received','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `investor` int(11) NOT NULL DEFAULT 0,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `receive_able_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `rebate_balance` double(20,3) NOT NULL DEFAULT 0.000,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdraw_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `ban_unban` enum('ban','unban') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unban',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active_member` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ref_by`, `ref_id`, `name`, `investor`, `phone`, `ip`, `username`, `email`, `email_verified_at`, `password`, `type`, `balance`, `receive_able_amount`, `rebate_balance`, `photo`, `gateway_method`, `gateway_number`, `withdraw_password`, `ifsc`, `remember_token`, `status`, `ban_unban`, `created_at`, `updated_at`, `active_member`) VALUES
(1, '433r7n392h7j', 'bq7471946xka', 'XXXXXX', 1, '12345678', '::1', 'uname12345678', '12345678@gmail.com', NULL, '$2y$10$.O9ojm05bHOurPnS1zujtObf8hDTE8HnJLhK6dI.LiAYMaYKMPhQS', NULL, 4232.00, 0.00, 0.000, NULL, 'USDT1', 'XXXX', NULL, NULL, NULL, 'active', 'unban', '2024-10-28 06:58:28', '2024-10-29 06:02:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_ledgers`
--

CREATE TABLE `user_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `get_balance_from_user_id` bigint(20) DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perticulation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `debit` double NOT NULL DEFAULT 0,
  `credit` double NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected','default') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `step` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_ledgers`
--

INSERT INTO `user_ledgers` (`id`, `user_id`, `get_balance_from_user_id`, `reason`, `perticulation`, `amount`, `debit`, `credit`, `status`, `date`, `step`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'rebate', 'Congratulations. you have received registration bonus.', 32, 32, 0, 'approved', '2024-10-27 23:58:28', NULL, '2024-10-28 06:58:28', '2024-10-28 06:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `vip_sliders`
--

CREATE TABLE `vip_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `page_type` enum('home_page','vip_page') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home_page',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vip_sliders`
--

INSERT INTO `vip_sliders` (`id`, `photo`, `status`, `page_type`, `created_at`, `updated_at`) VALUES
(15, '/public/upload/slider/1730125780lrj.png', 'active', 'home_page', '2024-09-05 23:54:15', '2024-10-29 03:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `charge` decimal(20,2) NOT NULL DEFAULT 0.00,
  `final_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','approved','rejected','processing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_ledgers`
--
ALTER TABLE `admin_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus_ledgers`
--
ALTER TABLE `bonus_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkins_user_id_foreign` (`user_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `funds`
--
ALTER TABLE `funds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_invests`
--
ALTER TABLE `fund_invests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fund_invests_user_id_foreign` (`user_id`),
  ADD KEY `fund_invests_fund_id_foreign` (`fund_id`);

--
-- Indexes for table `lucky_ledgers`
--
ALTER TABLE `lucky_ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lucky_ledgers_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`),
  ADD KEY `purchases_package_id_foreign` (`package_id`);

--
-- Indexes for table `rebates`
--
ALTER TABLE `rebates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_requests`
--
ALTER TABLE `task_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_ledgers`
--
ALTER TABLE `user_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_sliders`
--
ALTER TABLE `vip_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_ledgers`
--
ALTER TABLE `admin_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `bonus_ledgers`
--
ALTER TABLE `bonus_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funds`
--
ALTER TABLE `funds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `fund_invests`
--
ALTER TABLE `fund_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lucky_ledgers`
--
ALTER TABLE `lucky_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rebates`
--
ALTER TABLE `rebates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `task_requests`
--
ALTER TABLE `task_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_ledgers`
--
ALTER TABLE `user_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vip_sliders`
--
ALTER TABLE `vip_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkins`
--
ALTER TABLE `checkins`
  ADD CONSTRAINT `checkins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lucky_ledgers`
--
ALTER TABLE `lucky_ledgers`
  ADD CONSTRAINT `lucky_ledgers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
