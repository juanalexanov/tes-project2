-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 03:15 PM
-- Server version: 10.5.27-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rs_puri_bunda`
--
CREATE DATABASE IF NOT EXISTS `rs_puri_bunda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rs_puri_bunda`;

-- --------------------------------------------------------

--
-- Table structure for table `jabatans`
--

CREATE TABLE `jabatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_jabatan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jabatans`
--

INSERT INTO `jabatans` (`id`, `nama_jabatan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Manager', '2020-01-01 11:10:13', NULL, NULL),
(2, 'Supervisor', '2025-01-31 11:10:21', NULL, NULL),
(3, 'Staff', '2025-01-29 11:10:26', NULL, NULL),
(4, 'Intern', '2024-01-01 11:10:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karyawans`
--

CREATE TABLE `karyawans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_bergabung` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawans`
--

INSERT INTO `karyawans` (`id`, `nama`, `username`, `password`, `unit_id`, `tanggal_bergabung`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'John Doe', 'johndoe', 'password123', 1, '2023-01-01', '2025-01-01 11:08:18', NULL, NULL),
(2, 'Jane Smith', 'janesmith', 'password123', 2, '2023-02-15', '2025-01-08 06:08:30', NULL, NULL),
(3, 'Alice Johnson', 'alicej', 'password123', 3, '2023-03-10', '2025-01-03 11:08:41', NULL, NULL),
(4, 'Bob Brown', 'bobbrown', 'password123', 4, '2023-04-05', '2025-01-10 11:08:51', NULL, NULL),
(5, 'Charlie White', 'charliew', 'password123', 5, '2023-05-20', '2025-01-13 11:08:55', NULL, NULL),
(6, 'Diana Prince', 'dianap', 'password123', 1, '2023-06-25', '2025-01-16 11:09:01', NULL, NULL),
(7, 'Ethan Hunt', 'ethanh', 'password123', 2, '2023-07-15', '2025-01-26 11:09:08', NULL, NULL),
(8, 'Fiona Carter', 'fionac', 'password123', 3, '2023-08-05', '2025-01-04 11:09:13', NULL, NULL),
(9, 'George Miller', 'georgem', 'password123', 4, '2023-09-10', '2023-12-01 11:09:17', NULL, NULL),
(10, 'Hannah Lee', 'hannahlee', 'password123', 5, '2023-10-01', '2024-09-26 11:09:25', NULL, NULL),
(16, 'alex', 'alex', 'alex', 3, '2025-01-18', '2025-01-16 14:09:58', '2025-01-16 14:09:58', NULL),
(17, 'juan', 'juan', 'juan', 3, '2025-01-31', '2025-01-17 04:15:58', '2025-01-17 04:15:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan_jabatan`
--

CREATE TABLE `karyawan_jabatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `karyawan_id` bigint(20) UNSIGNED NOT NULL,
  `jabatan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan_jabatan`
--

INSERT INTO `karyawan_jabatan` (`id`, `karyawan_id`, `jabatan_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(2, 2, 2, NULL, NULL, NULL),
(3, 3, 3, NULL, NULL, NULL),
(4, 4, 1, NULL, NULL, NULL),
(5, 5, 2, NULL, NULL, NULL),
(6, 6, 3, NULL, NULL, NULL),
(7, 7, 4, NULL, NULL, NULL),
(8, 8, 3, NULL, NULL, NULL),
(9, 9, 2, NULL, NULL, NULL),
(10, 10, 1, NULL, NULL, NULL),
(15, 16, 1, NULL, NULL, NULL),
(16, 16, 2, NULL, NULL, NULL),
(17, 17, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `karyawan_id` bigint(20) UNSIGNED NOT NULL,
  `login_time` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `karyawan_id`, `login_time`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 16, '2025-01-17 08:57:45', '127.0.0.1', '2025-01-17 01:57:45', '2025-01-17 01:57:45'),
(2, 9, '2025-01-09 21:29:08', '198.128.47.198', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(3, 5, '2025-01-08 10:32:08', '162.139.197.6', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(4, 1, '2025-01-03 14:14:08', '111.150.113.11', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(5, 5, '2024-12-28 03:01:08', '218.107.71.232', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(6, 4, '2024-12-23 14:48:08', '41.84.230.145', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(7, 8, '2025-01-06 22:30:08', '176.41.35.122', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(8, 10, '2025-01-12 00:12:08', '19.230.61.151', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(9, 9, '2024-12-26 21:23:08', '15.132.0.146', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(10, 3, '2024-12-27 18:43:08', '100.116.155.23', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(11, 2, '2025-01-09 01:37:08', '97.157.91.28', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(12, 9, '2025-01-07 18:27:08', '254.190.68.178', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(13, 10, '2024-12-27 16:26:08', '193.19.53.12', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(14, 1, '2024-12-24 11:47:08', '125.32.174.167', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(15, 2, '2024-12-25 15:52:08', '2.54.245.8', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(16, 8, '2024-12-17 12:08:08', '127.116.225.61', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(17, 5, '2025-01-07 13:59:08', '69.146.233.132', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(18, 2, '2024-12-23 23:19:08', '135.129.68.111', '2025-01-17 02:05:08', '2025-01-17 02:05:08'),
(19, 9, '2025-01-05 06:07:09', '17.38.140.22', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(20, 3, '2024-12-26 11:01:09', '150.9.207.149', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(21, 7, '2025-01-03 16:03:09', '137.102.21.94', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(22, 1, '2024-12-17 14:04:09', '82.52.133.241', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(23, 5, '2025-01-14 03:20:09', '45.6.7.136', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(24, 1, '2025-01-13 13:05:09', '65.4.62.40', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(25, 3, '2025-01-17 08:03:09', '9.33.88.243', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(26, 5, '2024-12-25 05:18:09', '224.252.96.101', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(27, 1, '2025-01-12 07:24:09', '45.199.253.235', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(28, 1, '2024-12-27 00:40:09', '30.170.243.193', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(29, 3, '2025-01-10 14:57:09', '176.254.157.127', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(30, 10, '2025-01-06 22:43:09', '79.33.41.178', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(31, 16, '2025-01-12 21:05:09', '152.209.28.130', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(32, 8, '2024-12-30 21:55:09', '215.190.155.200', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(33, 5, '2024-12-17 09:30:09', '10.196.178.245', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(34, 1, '2025-01-14 18:45:09', '41.255.69.239', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(35, 1, '2025-01-06 02:24:09', '27.229.134.232', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(36, 8, '2025-01-07 23:16:09', '105.140.251.0', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(37, 9, '2025-01-16 13:17:09', '194.172.131.182', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(38, 1, '2025-01-16 21:23:09', '140.86.165.122', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(39, 4, '2024-12-30 04:45:09', '255.188.69.250', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(40, 16, '2025-01-09 16:30:09', '8.181.126.35', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(41, 9, '2024-12-20 02:37:09', '103.169.48.1', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(42, 10, '2024-12-28 12:22:09', '9.173.97.122', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(43, 9, '2025-01-10 12:12:09', '182.226.100.31', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(44, 6, '2024-12-27 06:08:09', '222.243.206.82', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(45, 6, '2025-01-03 09:41:09', '239.253.183.58', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(46, 5, '2025-01-10 00:45:09', '63.211.15.212', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(47, 2, '2024-12-24 10:10:09', '202.108.50.81', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(48, 3, '2025-01-11 11:53:09', '15.242.100.40', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(49, 2, '2024-12-18 05:29:09', '175.170.2.133', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(50, 8, '2024-12-21 03:57:09', '158.106.192.13', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(51, 5, '2025-01-13 15:50:09', '235.248.144.238', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(52, 2, '2025-01-12 18:31:09', '72.190.192.119', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(53, 3, '2024-12-28 07:52:09', '11.35.15.134', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(54, 9, '2024-12-22 00:18:09', '178.160.101.204', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(55, 10, '2025-01-06 19:29:09', '79.132.117.8', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(56, 10, '2025-01-01 09:33:09', '252.192.90.194', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(57, 16, '2024-12-29 09:22:09', '97.246.244.167', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(58, 4, '2024-12-23 05:30:09', '95.135.184.33', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(59, 1, '2024-12-25 20:27:09', '56.31.163.221', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(60, 3, '2024-12-30 03:14:09', '231.163.83.131', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(61, 2, '2025-01-11 02:30:09', '240.62.253.62', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(62, 10, '2025-01-03 13:23:09', '19.92.184.37', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(63, 3, '2024-12-31 18:31:09', '76.208.229.14', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(64, 7, '2025-01-16 11:40:09', '73.88.230.20', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(65, 6, '2024-12-26 03:02:09', '226.83.95.38', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(66, 10, '2024-12-25 09:15:09', '173.44.77.194', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(67, 16, '2024-12-30 06:55:09', '169.6.55.122', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(68, 8, '2025-01-13 22:49:09', '174.8.225.64', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(69, 16, '2024-12-22 05:57:09', '164.136.171.158', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(70, 10, '2025-01-15 16:17:09', '172.132.93.99', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(71, 5, '2024-12-28 04:50:09', '10.83.205.142', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(72, 9, '2024-12-20 18:49:09', '242.238.142.141', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(73, 7, '2024-12-31 14:49:09', '185.83.120.81', '2025-01-17 02:05:09', '2025-01-17 02:05:09'),
(74, 7, '2024-12-20 02:38:10', '113.164.166.147', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(75, 7, '2025-01-03 13:08:10', '204.61.253.117', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(76, 1, '2025-01-07 12:52:10', '5.58.91.252', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(77, 9, '2025-01-11 07:33:10', '1.36.115.244', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(78, 9, '2025-01-12 19:48:10', '122.99.168.40', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(79, 16, '2025-01-15 13:48:10', '23.202.40.164', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(80, 5, '2024-12-21 23:08:10', '171.188.153.74', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(81, 4, '2025-01-13 10:38:10', '18.125.69.180', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(82, 6, '2025-01-03 21:52:10', '102.91.59.228', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(83, 9, '2025-01-15 17:46:10', '137.98.232.215', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(84, 10, '2025-01-06 15:38:10', '125.71.59.210', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(85, 1, '2024-12-24 05:29:10', '120.182.96.29', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(86, 10, '2024-12-25 10:18:10', '151.201.157.98', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(87, 1, '2025-01-10 10:36:10', '25.145.215.91', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(88, 8, '2024-12-28 21:12:10', '248.199.125.109', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(89, 3, '2024-12-18 19:57:10', '75.193.230.18', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(90, 1, '2025-01-14 03:21:10', '24.157.41.242', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(91, 5, '2025-01-15 04:51:10', '156.122.8.178', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(92, 3, '2025-01-16 21:49:10', '249.132.165.153', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(93, 9, '2025-01-05 01:30:10', '134.70.130.222', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(94, 9, '2024-12-25 09:38:10', '123.11.165.206', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(95, 6, '2025-01-06 16:20:10', '9.191.111.131', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(96, 16, '2025-01-15 02:15:10', '127.235.97.173', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(97, 8, '2025-01-11 14:37:10', '184.22.62.160', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(98, 1, '2025-01-14 05:44:10', '116.8.36.63', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(99, 3, '2025-01-02 16:19:10', '40.140.153.86', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(100, 2, '2024-12-17 14:16:10', '235.136.11.82', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(101, 16, '2025-01-08 04:36:10', '185.226.104.197', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(102, 16, '2024-12-17 18:50:10', '179.49.192.17', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(103, 3, '2025-01-14 07:09:10', '245.83.229.10', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(104, 5, '2025-01-15 04:34:10', '211.45.99.235', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(105, 1, '2024-12-30 19:20:10', '236.130.163.130', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(106, 4, '2025-01-10 15:12:10', '63.135.206.179', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(107, 3, '2024-12-28 08:03:10', '56.78.194.116', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(108, 16, '2025-01-16 03:10:10', '56.225.131.145', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(109, 7, '2024-12-17 12:50:10', '202.13.7.121', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(110, 10, '2025-01-04 19:32:10', '154.186.190.187', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(111, 1, '2025-01-06 15:45:10', '40.86.180.235', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(112, 16, '2024-12-17 19:42:10', '104.177.207.78', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(113, 4, '2025-01-09 14:12:10', '80.105.160.188', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(114, 9, '2024-12-18 17:18:10', '177.133.140.177', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(115, 2, '2024-12-29 01:54:10', '244.94.113.165', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(116, 4, '2025-01-15 18:05:10', '192.243.81.143', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(117, 3, '2024-12-28 15:39:10', '14.232.135.239', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(118, 10, '2024-12-23 16:27:10', '68.165.148.91', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(119, 7, '2024-12-31 02:42:10', '148.17.149.160', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(120, 7, '2024-12-26 02:10:10', '24.190.186.253', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(121, 6, '2025-01-12 14:58:10', '145.103.247.80', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(122, 3, '2025-01-14 18:48:10', '85.56.236.235', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(123, 1, '2024-12-30 04:21:10', '107.72.75.43', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(124, 4, '2024-12-18 11:16:10', '133.160.242.70', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(125, 7, '2025-01-04 03:47:10', '254.9.47.232', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(126, 1, '2024-12-20 07:18:10', '128.119.134.155', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(127, 7, '2025-01-05 09:14:10', '33.139.166.170', '2025-01-17 02:05:10', '2025-01-17 02:05:10'),
(128, 6, '2025-01-09 05:13:11', '108.250.243.46', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(129, 10, '2025-01-04 20:25:11', '190.128.95.3', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(130, 6, '2024-12-22 15:07:11', '208.0.78.59', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(131, 3, '2024-12-27 16:14:11', '178.94.166.209', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(132, 2, '2025-01-14 01:45:11', '249.223.132.66', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(133, 2, '2025-01-02 20:41:11', '229.107.157.20', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(134, 9, '2024-12-31 19:09:11', '101.98.16.10', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(135, 1, '2024-12-21 05:29:11', '112.17.167.196', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(136, 2, '2025-01-11 19:13:11', '103.252.9.239', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(137, 6, '2025-01-09 18:29:11', '224.48.79.210', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(138, 16, '2025-01-07 14:54:11', '91.140.62.67', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(139, 16, '2024-12-19 10:48:11', '251.72.160.57', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(140, 9, '2025-01-09 11:01:11', '53.53.121.236', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(141, 10, '2025-01-04 13:42:11', '41.66.243.195', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(142, 9, '2024-12-28 04:19:11', '208.78.78.160', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(143, 16, '2025-01-05 05:33:11', '90.254.249.16', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(144, 4, '2024-12-18 20:50:11', '193.90.62.218', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(145, 1, '2024-12-30 09:19:11', '168.186.125.55', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(146, 3, '2024-12-21 10:45:11', '114.46.38.146', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(147, 6, '2024-12-24 14:09:11', '41.241.118.191', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(148, 4, '2025-01-15 21:04:11', '134.16.121.37', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(149, 10, '2025-01-16 01:59:11', '167.41.177.163', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(150, 6, '2024-12-23 13:53:11', '99.29.0.200', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(151, 2, '2025-01-04 03:45:11', '184.221.102.22', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(152, 5, '2024-12-18 14:18:11', '202.18.235.194', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(153, 5, '2025-01-11 05:55:11', '127.189.244.108', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(154, 10, '2024-12-27 09:05:11', '134.69.26.230', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(155, 2, '2025-01-10 19:56:11', '123.10.212.5', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(156, 1, '2025-01-08 21:30:11', '133.26.242.132', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(157, 9, '2025-01-07 02:33:11', '65.156.20.2', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(158, 1, '2024-12-18 16:31:11', '204.158.213.46', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(159, 3, '2025-01-15 04:03:11', '38.93.221.186', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(160, 10, '2025-01-13 11:24:11', '115.236.62.89', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(161, 5, '2025-01-09 18:37:11', '105.253.16.238', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(162, 5, '2024-12-31 06:01:11', '63.50.176.59', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(163, 8, '2024-12-18 12:16:11', '19.125.184.128', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(164, 1, '2025-01-04 11:25:11', '246.17.148.70', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(165, 4, '2025-01-07 19:32:11', '98.64.90.102', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(166, 5, '2024-12-24 00:03:11', '153.77.189.118', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(167, 16, '2024-12-22 01:58:11', '225.190.202.122', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(168, 6, '2024-12-27 19:05:11', '221.85.159.26', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(169, 1, '2025-01-08 06:57:11', '94.171.118.10', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(170, 10, '2024-12-31 17:14:11', '12.199.27.17', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(171, 6, '2025-01-04 19:02:11', '37.21.97.85', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(172, 16, '2024-12-20 11:00:11', '164.200.167.98', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(173, 9, '2025-01-10 18:31:11', '187.105.163.172', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(174, 5, '2025-01-16 22:57:11', '175.106.26.189', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(175, 9, '2024-12-17 18:38:11', '68.246.76.241', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(176, 7, '2025-01-09 19:54:11', '20.53.199.16', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(177, 9, '2024-12-24 00:44:11', '149.96.33.121', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(178, 4, '2024-12-21 21:06:11', '142.142.129.169', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(179, 7, '2025-01-02 02:52:11', '68.140.255.153', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(180, 5, '2024-12-18 19:48:11', '28.47.19.73', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(181, 3, '2025-01-08 15:45:11', '206.184.199.203', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(182, 3, '2025-01-09 17:27:11', '58.192.144.28', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(183, 10, '2024-12-31 07:46:11', '47.220.71.246', '2025-01-17 02:05:11', '2025-01-17 02:05:11'),
(184, 4, '2024-12-19 18:27:12', '77.63.31.122', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(185, 7, '2025-01-06 06:46:12', '191.105.196.11', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(186, 16, '2024-12-20 19:37:12', '81.127.158.138', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(187, 7, '2024-12-18 17:25:12', '246.139.221.243', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(188, 16, '2024-12-22 02:04:12', '206.240.120.216', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(189, 2, '2024-12-23 07:43:12', '124.36.140.146', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(190, 7, '2024-12-31 22:23:12', '178.94.228.241', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(191, 2, '2024-12-25 20:19:12', '81.169.78.64', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(192, 9, '2024-12-30 02:58:12', '249.207.119.58', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(193, 4, '2024-12-24 04:02:12', '121.255.89.229', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(194, 4, '2024-12-28 03:28:12', '241.84.78.44', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(195, 10, '2024-12-31 02:59:12', '96.177.127.249', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(196, 8, '2025-01-01 10:59:12', '79.172.18.188', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(197, 6, '2024-12-31 11:39:12', '142.104.222.41', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(198, 6, '2024-12-20 07:48:12', '6.56.236.253', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(199, 4, '2024-12-24 23:52:12', '165.122.236.144', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(200, 7, '2025-01-02 10:20:12', '207.186.183.15', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(201, 3, '2024-12-30 02:32:12', '111.135.182.81', '2025-01-17 02:05:12', '2025-01-17 02:05:12'),
(202, 16, '2025-01-17 08:55:19', '127.0.0.76', '2025-01-17 02:10:19', '2025-01-17 02:10:19'),
(203, 16, '2025-01-17 08:23:19', '127.0.0.59', '2025-01-17 02:10:19', '2025-01-17 02:10:19'),
(204, 16, '2025-01-17 08:54:19', '127.0.0.211', '2025-01-17 02:10:19', '2025-01-17 02:10:19'),
(205, 16, '2025-01-17 09:06:20', '127.0.0.192', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(206, 16, '2025-01-17 08:20:20', '127.0.0.137', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(207, 16, '2025-01-17 08:48:20', '127.0.0.64', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(208, 16, '2025-01-17 08:35:20', '127.0.0.124', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(209, 16, '2025-01-17 08:18:20', '127.0.0.132', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(210, 16, '2025-01-17 08:23:20', '127.0.0.250', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(211, 16, '2025-01-17 08:44:20', '127.0.0.180', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(212, 16, '2025-01-17 08:12:20', '127.0.0.106', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(213, 16, '2025-01-17 08:22:20', '127.0.0.146', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(214, 16, '2025-01-17 08:23:20', '127.0.0.214', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(215, 16, '2025-01-17 08:45:20', '127.0.0.129', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(216, 16, '2025-01-17 08:46:20', '127.0.0.160', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(217, 16, '2025-01-17 08:35:20', '127.0.0.201', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(218, 16, '2025-01-17 08:59:20', '127.0.0.212', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(219, 16, '2025-01-17 08:59:20', '127.0.0.220', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(220, 16, '2025-01-17 08:34:20', '127.0.0.167', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(221, 16, '2025-01-17 08:11:20', '127.0.0.171', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(222, 16, '2025-01-17 08:11:20', '127.0.0.53', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(223, 16, '2025-01-17 08:47:20', '127.0.0.171', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(224, 16, '2025-01-17 09:10:20', '127.0.0.190', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(225, 16, '2025-01-17 08:48:20', '127.0.0.12', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(226, 16, '2025-01-17 08:44:20', '127.0.0.161', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(227, 16, '2025-01-17 08:48:20', '127.0.0.137', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(228, 16, '2025-01-17 09:01:20', '127.0.0.68', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(229, 16, '2025-01-17 09:02:20', '127.0.0.63', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(230, 16, '2025-01-17 08:35:20', '127.0.0.7', '2025-01-17 02:10:20', '2025-01-17 02:10:20'),
(231, 16, '2025-01-17 08:50:20', '127.0.0.56', '2025-01-17 02:10:20', '2025-01-17 02:10:20');

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
(1, '2025_01_16_161041_create_jabatans_table', 1),
(2, '2025_01_16_161019_create_units_table', 2),
(3, '2025_01_16_160923_create_karyawans_table', 3),
(5, '2025_01_17_085131_create_login_logs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_unit` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `nama_unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Finance', '2024-09-01 11:09:38', NULL, NULL),
(2, 'HR', '2024-12-23 11:09:44', NULL, NULL),
(3, 'IT', '2025-01-01 11:09:49', NULL, NULL),
(4, 'Marketing', '2020-07-01 11:09:53', NULL, NULL),
(5, 'Operations', '2025-01-22 11:10:03', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jabatans`
--
ALTER TABLE `jabatans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawans`
--
ALTER TABLE `karyawans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `karyawans_username_unique` (`username`),
  ADD KEY `karyawans_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `karyawan_jabatan`
--
ALTER TABLE `karyawan_jabatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `karyawan_jabatan_karyawan_id_foreign` (`karyawan_id`),
  ADD KEY `karyawan_jabatan_jabatan_id_foreign` (`jabatan_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_logs_karyawan_id_foreign` (`karyawan_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jabatans`
--
ALTER TABLE `jabatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `karyawans`
--
ALTER TABLE `karyawans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `karyawan_jabatan`
--
ALTER TABLE `karyawan_jabatan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karyawans`
--
ALTER TABLE `karyawans`
  ADD CONSTRAINT `karyawans_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `karyawan_jabatan`
--
ALTER TABLE `karyawan_jabatan`
  ADD CONSTRAINT `karyawan_jabatan_jabatan_id_foreign` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `karyawan_jabatan_karyawan_id_foreign` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD CONSTRAINT `login_logs_karyawan_id_foreign` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;