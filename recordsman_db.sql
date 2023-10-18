-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2023 at 09:50 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recordsman_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `member_group` varchar(255) NOT NULL,
  `groupid` int(11) NOT NULL,
  `group` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `event_year` int(11) NOT NULL,
  `donation` double(13,2) NOT NULL,
  `redeemed` double(13,2) NOT NULL DEFAULT 0.00,
  `recorder` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donations`
--

INSERT INTO `donations` (`id`, `member_id`, `uid`, `fullname`, `mobile`, `email`, `gender`, `member_group`, `groupid`, `group`, `event`, `event_year`, `donation`, `redeemed`, `recorder`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '8139247230', 'Temple Choir  ', '08044738495', 'chinedu.ijeomah@yahoo.com', 'group', 'Abuja', 1, 'Abuja', 'Mummy Onyinyeomachukwu Spiritual Birthday', 2023, 25000.00, 25000.00, 'princewill', 'ijeomahprincewill@gmail.com', 1, '2023-10-17 16:19:18', '2023-10-17 16:19:18'),
(2, 18, '3648221748', 'Daughters of Daddy Hezekiah household  ', '08012345678', 'central@livingchristmission.org', 'group', 'Central', 0, 'System', 'Mummy Onyinyeomachukwu Spiritual Birthday', 2023, 500000.00, 470000.00, 'chinedu.ijeomah', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-18 05:11:51', '2023-10-18 06:13:54'),
(3, 43, '6704939489', 'Umu Youth Ihe Daddy na amasi  ', '08012345678', 'abujabranch@livingchristmission.org', 'group', 'Abuja', 1, 'Abuja', 'Mummy Onyinyeomachukwu Spiritual Birthday', 2023, 100000.00, 55000.00, 'Sister Onyenwe Ifediora', 'ijeomahprincewill@gmail.com', 1, '2023-10-18 06:24:49', '2023-10-18 06:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Youth Day', 'ijeomahprincewill@gmail.com', 1, '2023-10-17 16:16:28', '2023-10-17 16:16:28'),
(2, 'International Convention', 'ijeomahprincewill@gmail.com', 1, '2023-10-17 16:16:53', '2023-10-17 16:16:53'),
(3, 'Mummy Onyinyeomachukwu Spiritual Birthday', 'ijeomahprincewill@gmail.com', 1, '2023-10-17 16:17:18', '2023-10-17 16:17:18');

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
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `category`, `title`, `mobile`, `email`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Branch', 'Abuja', '08012345678', 'abuja@livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 16:13:19', '2023-10-17 16:13:19'),
(2, 'Branch', 'Onitsha', '08034567543', 'onitshabranch@livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 16:13:51', '2023-10-17 16:13:51'),
(3, 'Branch', 'Central', '08088889999', 'central@livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:32:39', '2023-10-17 17:32:39'),
(4, 'Branch', 'Dallas', '08012345678', 'dallas@livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:50:47', '2023-10-17 17:50:47'),
(5, 'Branch', 'Nkwerre', '08012345678', 'nkwerrebranch@Livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:57:56', '2023-10-17 17:57:56'),
(6, 'Branch', 'Owerri', '08012345678', 'owerribranch@livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:05:27', '2023-10-17 18:05:27'),
(7, 'Branch', 'Warri', '08012345678', 'warribranch@livingchristmission.org', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:33:20', '2023-10-17 18:33:20');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'individual',
  `uid` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `othernames` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `branchid` int(11) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `wing` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `category`, `uid`, `lastname`, `firstname`, `othernames`, `fullname`, `mobile`, `email`, `gender`, `branchid`, `branch`, `wing`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Group', '8139247230', 'Temple Choir Abuja Branch', NULL, NULL, 'Temple Choir Abuja Branch  ', '08044738495', 'chinedu.ijeomah@yahoo.com', 'group', 1, 'Abuja', 'Group', 'ijeomahprincewill@gmail.com', 1, '2023-10-17 16:18:04', '2023-10-17 17:38:15'),
(2, 'Group', '7593597842', 'Triplet daughters of Daddy Hezekiah', NULL, NULL, 'Triplet daughters of Daddy Hezekiah  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:33:36', '2023-10-17 17:33:36'),
(3, 'Group', '1813907473', 'Royal family', NULL, NULL, 'Royal family  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:34:28', '2023-10-17 17:34:28'),
(4, 'Group', '4138673677', 'Progressive temple mothers', NULL, NULL, 'Progressive temple mothers  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:36:05', '2023-10-17 17:36:05'),
(5, 'Group', '3903976027', 'Progressive temple youths', NULL, NULL, 'Progressive temple youths  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:37:34', '2023-10-17 17:37:34'),
(6, 'Group', '3020534482', 'Progressive temple fathers', NULL, NULL, 'Progressive temple fathers  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:39:24', '2023-10-17 17:39:24'),
(7, 'Group', '1976861136', 'Body of pastors', NULL, NULL, 'Body of pastors  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:41:01', '2023-10-17 17:41:01'),
(8, 'Group', '9224969295', 'Mothers of encouragement', NULL, NULL, 'Mothers of encouragement  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:43:02', '2023-10-17 17:43:02'),
(9, 'Group', '2466773013', 'Special daughters of Daddy Hezekiah', NULL, NULL, 'Special daughters of Daddy Hezekiah  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:49:22', '2023-10-17 17:49:22'),
(10, 'Group', '8691599627', 'Onyinyeomachukwu group Dallas', NULL, NULL, 'Onyinyeomachukwu group Dallas  ', '08012345678', 'dallasbranch@livingchristmission.org', 'group', 4, 'Dallas', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:51:33', '2023-10-17 17:51:54'),
(11, 'Group', '4142864598', 'Fathers Onitsha', NULL, NULL, 'Fathers Onitsha  ', '08012345678', 'onitshabranch@livingchristmission.org', 'group', 2, 'Onitsha', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:52:45', '2023-10-17 17:52:45'),
(12, 'Group', '3778987802', 'Inland girls', NULL, NULL, 'Inland girls  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:53:55', '2023-10-17 17:53:55'),
(13, 'Group', '2681829636', 'Likeminds', NULL, NULL, 'Likeminds  ', '08012345678', 'likeminds@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:54:35', '2023-10-17 17:54:35'),
(14, 'Group', '2025842742', 'Mummy Onyinyeomachukwu household', NULL, NULL, 'Mummy Onyinyeomachukwu household  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:55:27', '2023-10-17 17:55:27'),
(15, 'Group', '6081449771', 'Onyinyeomachukwu squad Nkwerre', NULL, NULL, 'Onyinyeomachukwu squad Nkwerre  ', '08012345678', 'nkwerrebranch@livingchristmission.org', 'group', 5, 'Nkwerre', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:58:37', '2023-10-17 17:58:37'),
(16, 'Group', '7751584143', 'Grand daughters', NULL, NULL, 'Grand daughters  ', '08012345678', 'central@livingchrsitmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 17:59:15', '2023-10-17 17:59:15'),
(17, 'Group', '5773678204', 'Odinobinnaya', NULL, NULL, 'Odinobinnaya  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:00:51', '2023-10-17 18:00:51'),
(18, 'Group', '3648221748', 'Daughters of Daddy Hezekiah household', NULL, NULL, 'Daughters of Daddy Hezekiah household  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:01:26', '2023-10-17 18:01:26'),
(19, 'Group', '7800820939', 'Ushers', NULL, NULL, 'Ushers  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:02:31', '2023-10-17 18:02:31'),
(20, 'Group', '7650122409', 'Favoured women of mummy Onyinyeomachukwu', NULL, NULL, 'Favoured women of mummy Onyinyeomachukwu  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:04:35', '2023-10-17 18:04:35'),
(21, 'Group', '3216312084', 'Caring mothers of mummy Onyinyeomachukwu Owerri', NULL, NULL, 'Caring mothers of mummy Onyinyeomachukwu Owerri  ', '08012345678', 'owerribranch@livingchristmission.org', 'group', 6, 'Owerri', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:06:06', '2023-10-17 18:06:23'),
(22, 'Group', '7688743557', 'Fathers world wide', NULL, NULL, 'Fathers world wide  ', '08012345990', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:07:39', '2023-10-17 18:08:01'),
(23, 'Group', '6558368190', 'Daddy\'s family', NULL, NULL, 'Daddy\'s family  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:08:37', '2023-10-17 18:08:37'),
(24, 'Group', '5799655862', 'Redeemed kids', NULL, NULL, 'Redeemed kids  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:09:48', '2023-10-17 18:09:48'),
(25, 'Group', '7154785419', 'Disciples', NULL, NULL, 'Disciples  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:15:14', '2023-10-17 18:15:14'),
(26, 'Group', '3039772031', 'Compound dwellers', NULL, NULL, 'Compound dwellers  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:15:54', '2023-10-17 18:15:54'),
(27, 'Group', '6213756449', 'Princesses kids Nkwerre', NULL, NULL, 'Princesses kids Nkwerre  ', '08012345678', 'central@livingchristmission.org', 'group', 5, 'Nkwerre', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:16:39', '2023-10-17 18:16:56'),
(28, 'Group', '7583470183', 'Altar/Stage workers', NULL, NULL, 'Altar/Stage workers  ', '08012345678', 'central@livingchrsitmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:17:30', '2023-10-17 18:17:30'),
(29, 'Group', '6443753271', 'Our lord\'s prayer group', NULL, NULL, 'Our lord\'s prayer group  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:18:16', '2023-10-17 18:18:16'),
(30, 'Group', '4362738691', 'Mothers world wide', NULL, NULL, 'Mothers world wide  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:19:04', '2023-10-17 18:19:04'),
(31, 'Group', '8561033473', 'Youths world wide', NULL, NULL, 'Youths world wide  ', '08012345678', 'central@livingchrsitmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:19:40', '2023-10-17 18:19:40'),
(32, 'Group', '2404480127', 'Virtuous Women', NULL, NULL, 'Virtuous Women  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:21:36', '2023-10-17 18:21:36'),
(33, 'Group', '4813926580', 'Digital ladies', NULL, NULL, 'Digital ladies  ', '08012345678', 'central@livingchristmission.org', 'group', 6, 'Owerri', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:22:49', '2023-10-17 18:22:49'),
(34, 'Group', '1283379338', 'Blue wearers worldwide', NULL, NULL, 'Blue wearers worldwide  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:24:17', '2023-10-17 18:24:17'),
(35, 'Group', '4457089161', 'Chukwunazaekpere choir Onitsha', NULL, NULL, 'Chukwunazaekpere choir Onitsha  ', '08012345678', 'onitshabranch@livingchristmission.org', 'group', 2, 'Onitsha', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:27:01', '2023-10-17 18:27:01'),
(36, 'Group', '4119402790', 'Effort mothers', NULL, NULL, 'Effort mothers  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:27:37', '2023-10-17 18:27:37'),
(37, 'Group', '5681912244', 'Jesus wives', NULL, NULL, 'Jesus wives  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:28:31', '2023-10-17 18:28:31'),
(38, 'Group', '7334581132', 'NALCS Unihez', NULL, NULL, 'NALCS Unihez  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:29:32', '2023-10-17 18:29:32'),
(39, 'Group', '5073386801', 'Mothers Onitsha', NULL, NULL, 'Mothers Onitsha  ', '08012345678', 'onitshabranch@livingchrsitmission.org', 'group', 2, 'Onitsha', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:30:32', '2023-10-17 18:30:32'),
(40, 'Group', '2486717590', 'Onitsha natives', NULL, NULL, 'Onitsha natives  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:31:39', '2023-10-17 18:31:39'),
(41, 'Group', '9930426190', 'Friends of beloved princesses Warri', NULL, NULL, 'Friends of beloved princesses Warri  ', '08012345678', 'central@livingchristmission.org', 'group', 7, 'Warri', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:32:35', '2023-10-17 18:33:37'),
(42, 'Group', '2543932909', 'Nkwa group', NULL, NULL, 'Nkwa group  ', '08012345678', 'central@livingchristmission.org', 'group', 3, 'Central', 'Group', 'chinedu.ijeomah@yahoo.com', 1, '2023-10-17 18:34:42', '2023-10-17 18:34:42'),
(43, 'Group', '6704939489', 'Umu Youth Ihe Daddy na amasi', NULL, NULL, 'Umu Youth Ihe Daddy na amasi  ', '08012345678', 'abujabranch@livingchristmission.org', 'group', 1, 'Abuja', 'Group', 'ijeomahprincewill@gmail.com', 1, '2023-10-18 06:18:55', '2023-10-18 06:18:55'),
(44, 'Individual', '6341377296', 'Ijeomah', 'Chinedu', 'Princewill', 'Ijeomah Chinedu Princewill', '08064481852', 'princewill2007@hotmail.com', 'male', 1, 'Abuja', 'Youths', 'ijeomahprincewill@gmail.com', 1, '2023-10-18 06:22:45', '2023-10-18 06:22:45');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_01_190345_create_groups_table', 1),
(6, '2023_03_01_190931_create_events_table', 1),
(7, '2023_03_01_191241_create_subgroups_table', 1),
(8, '2023_03_01_192525_create_members_table', 1),
(9, '2023_03_01_194255_create_donations_table', 1),
(10, '2023_03_01_195828_create_redemptions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `redemptions`
--

CREATE TABLE `redemptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `donation_id` int(11) NOT NULL,
  `amount` double(13,2) NOT NULL,
  `channel` varchar(255) NOT NULL,
  `received_by` varchar(255) NOT NULL,
  `received_on` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `redemptions`
--

INSERT INTO `redemptions` (`id`, `donation_id`, `amount`, `channel`, `received_by`, `received_on`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 25000.00, 'cash', 'princewill', '2023-10-18 08:10:54', 'princewill', '2023-10-17 16:19:18', '2023-10-17 16:19:18'),
(2, 2, 350000.00, 'transfer', 'chinedu.ijeomah', '2023-10-17 00:00:00', 'chinedu.ijeomah@yahoo.com', '2023-10-18 06:12:53', '2023-10-18 06:12:53'),
(3, 2, 120000.00, 'cash', 'chinedu.ijeomah', '2023-10-18 00:00:00', 'chinedu.ijeomah@yahoo.com', '2023-10-18 06:13:54', '2023-10-18 06:13:54'),
(4, 3, 55000.00, 'POS', 'princewill', '2023-10-17 00:00:00', 'ijeomahprincewill@gmail.com', '2023-10-18 06:25:28', '2023-10-18 06:25:28');

-- --------------------------------------------------------

--
-- Table structure for table `subgroups`
--

CREATE TABLE `subgroups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groupid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `groupid` int(11) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `mobile`, `groupid`, `groupname`, `role`, `email`, `email_verified_at`, `password`, `created_by`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'chinedu.ijeomah', '0806448185', 0, 'System', 'admin', 'chinedu.ijeomah@yahoo.com', NULL, '$2y$10$TtnbZlDzZc5X0y56gMJWNuNjxi5KMe7LHmomUH3Lq337YtUiTlojG', '', 1, NULL, NULL, '2023-10-17 17:24:04'),
(2, 'princewill', '08058654032', 1, 'Abuja', 'admin', 'ijeomahprincewill@gmail.com', NULL, '$2y$10$z5xEOAfMh4Tw3OFsGZuiZ.TI0BpsXeExWXnbmDPY0wU4Y1YBCaDIS', 'chinedu.ijeomah@yahoo.com', 1, NULL, '2023-10-17 16:14:29', '2023-10-17 16:14:29'),
(3, 'Nonoo', '08012345678', 3, 'Central', 'admin', 'nonoo@livingchristmission.com', NULL, '$2y$10$AnOXZN0O/40KwFmMH9kl/.zvod2XGy4yksajABqiv2EWphd0WNEuK', 'chinedu.ijeomah@yahoo.com', 1, NULL, '2023-10-18 06:36:45', '2023-10-18 06:36:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_uid_unique` (`uid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `redemptions`
--
ALTER TABLE `redemptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subgroups`
--
ALTER TABLE `subgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `redemptions`
--
ALTER TABLE `redemptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subgroups`
--
ALTER TABLE `subgroups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
