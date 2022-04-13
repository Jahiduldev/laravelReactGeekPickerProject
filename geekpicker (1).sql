-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2022 at 01:52 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geekpicker`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountinginformations`
--

CREATE TABLE `accountinginformations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AccountType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ChartOfAccountNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DrOrCr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FiscalYear` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CurrecnyId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionInformationId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreatedBy` date NOT NULL,
  `ModifiedDate` date NOT NULL,
  `ModifiedBy` date NOT NULL,
  `IsActive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `IsDeleted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_04_08_081553_create_accounting_information_table', 1),
(5, '2022_04_08_082353_create_stake_holder_information_table', 1),
(6, '2022_04_08_082415_create_transaction_information_table', 1),
(7, '2022_04_08_082433_create_transaction_fee_information_table', 1),
(8, '2022_04_08_082455_create_transaction_fee_policy_table', 1),
(9, '2022_04_08_082518_create_transaction_profile_table', 1),
(10, '2022_04_08_082539_create_transaction_request_table', 1),
(11, '2022_04_08_082612_create_transaction_request_status_table', 1),
(12, '2022_04_08_082630_create_transaction_request_type_table', 1),
(13, '2022_04_08_082652_create_transaction_status_table', 1),
(14, '2022_04_08_082711_create_transaction_type_table', 1),
(15, '2022_04_08_083805_create__logs_table', 1),
(16, '2022_04_08_084716_create__person_profile_table', 1);

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
-- Table structure for table `person_profile`
--

CREATE TABLE `person_profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_Id` bigint(20) UNSIGNED NOT NULL,
  `PersonAcNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonContactNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AreMarried` tinyint(4) NOT NULL,
  `PersonNidNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonTinNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonFatherName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonMotherName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonHusbandName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonWifeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CurrentUtcTimeZone` date NOT NULL,
  `PersonImgUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CommissionId` int(11) NOT NULL,
  `PersonGender` tinyint(4) NOT NULL,
  `DegreeId` int(11) NOT NULL,
  `PersonPermanentAddress` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `PersonPresentAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BussinessName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BussinessAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TradeLicenseNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TradeLicenseUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TaxStatusId` tinyint(4) NOT NULL,
  `BankId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BankAccountNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BankBranchId` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BankAccountType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BankRoutingNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RevisionNum` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsApproved` tinyint(4) NOT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserTypeId` int(11) NOT NULL,
  `UserStatusId` tinyint(4) NOT NULL,
  `DailyTransactionLimit` bigint(20) NOT NULL,
  `DailyTransactionLimitAmt` bigint(20) NOT NULL,
  `MonthlyTransactionLimit` bigint(20) NOT NULL,
  `MonthlyTransactionLimitAmt` bigint(20) NOT NULL,
  `TodayNumberOfTransaction` bigint(20) NOT NULL,
  `TodayTotalTransactionAmount` bigint(20) NOT NULL,
  `CurrentMonthNumberOfTransaction` int(11) NOT NULL,
  `LastTransactionDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModifiedDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModifiedBy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsDeleted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stake_holder_information`
--

CREATE TABLE `stake_holder_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_fee_information`
--

CREATE TABLE `transaction_fee_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_fee_policy`
--

CREATE TABLE `transaction_fee_policy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_informations`
--

CREATE TABLE `transaction_informations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `CustomerId` bigint(20) UNSIGNED NOT NULL,
  `TransactionNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TransactionTypeId` tinyint(4) NOT NULL COMMENT '1=dabit, 0 = credit',
  `TransactionTypeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Amount` decimal(20,5) NOT NULL,
  `FromAccount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ToAccount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CurrencyCode` tinyint(4) NOT NULL,
  `ReceivedDate` date NOT NULL,
  `Remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ModifiedDate` date NOT NULL,
  `IsActive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsDeleted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_informations`
--

INSERT INTO `transaction_informations` (`id`, `CustomerId`, `TransactionNo`, `TransactionTypeId`, `TransactionTypeName`, `Amount`, `FromAccount`, `ToAccount`, `CurrencyCode`, `ReceivedDate`, `Remarks`, `ModifiedDate`, `IsActive`, `IsDeleted`, `created_at`, `updated_at`) VALUES
(59, 2, '625696f936113', 1, 'debit', '1.00000', '654321', '654321', 0, '2022-04-13', 'remarks', '2022-04-13', '1', '0', '2022-04-13 03:25:13', '2022-04-13 03:25:13'),
(60, 2, '625696f936113', 0, 'credit', '0.92000', '654321', '654321', 0, '2022-04-13', 'remarks', '2022-04-13', '1', '0', '2022-04-13 03:25:13', '2022-04-13 03:25:13'),
(61, 1, '625697897c73f', 1, 'debit', '1.00000', '123456', '123456', 1, '2022-04-13', 'remarks', '2022-04-13', '1', '0', '2022-04-13 03:27:37', '2022-04-13 03:27:37'),
(62, 1, '625697897c73f', 0, 'credit', '1.08331', '123456', '123456', 1, '2022-04-13', 'remarks', '2022-04-13', '1', '0', '2022-04-13 03:27:37', '2022-04-13 03:27:37'),
(63, 2, '62569817c91e5', 1, 'debit', '1.00000', '654321', '123456', 0, '2022-04-13', 'remarks', '2022-04-13', '1', '0', '2022-04-13 03:29:59', '2022-04-13 03:29:59'),
(64, 1, '62569817c91e5', 0, 'credit', '0.92000', '654321', '123456', 1, '2022-04-13', 'remarks', '2022-04-13', '1', '0', '2022-04-13 03:29:59', '2022-04-13 03:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_profile`
--

CREATE TABLE `transaction_profile` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_request`
--

CREATE TABLE `transaction_request` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_request_status`
--

CREATE TABLE `transaction_request_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_request_type`
--

CREATE TABLE `transaction_request_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_status`
--

CREATE TABLE `transaction_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OTP` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IsOTPVerify` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `IsPasswordChanged` tinyint(4) NOT NULL DEFAULT 0,
  `accountsNumber` int(11) NOT NULL DEFAULT 0,
  `CurrentBalance` int(11) NOT NULL DEFAULT 0,
  `CurrencyCode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Euro,0 = USD',
  `PersonProfileId` int(11) DEFAULT NULL,
  `UserIsBlocked` tinyint(1) DEFAULT 0,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1 = admin, 0 = user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `OTP`, `IsOTPVerify`, `IsPasswordChanged`, `accountsNumber`, `CurrentBalance`, `CurrencyCode`, `PersonProfileId`, `UserIsBlocked`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jahidul Isalm', 'kzis1987@gmail.com', NULL, '$2y$10$kwSe3jkQqSCdp1HiW8wql.5iLdsYL1Wqa2jIcgqgUyDsf.hj9ZNFa', NULL, '0', 0, 123456, 0, 1, NULL, 0, 'admin', NULL, '2022-04-12 14:37:08', '2022-04-12 14:37:08'),
(2, 'shamim', 'jahiduldev@gmail.com', NULL, '$2y$10$WNyrXe9JKMbixch7JWpWueDpFRabiPCLQ0Iq7Cg5nfcbFMmfWxpbu', NULL, '0', 0, 654321, 0, 0, NULL, 1, 'user', NULL, '2022-04-12 14:37:20', '2022-04-12 14:37:20'),
(3, 'Jahidul Isalm', 'kazijahidul1987@gmail.com', NULL, '$2y$10$YwI7M.gFMVdFfoVibgHnceO1UiaLVRUPWhefZo1er.6pzZ1n718Y2', NULL, '0', 0, 23456, 0, 0, NULL, 0, 'user', NULL, '2022-04-13 04:52:03', '2022-04-13 04:52:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountinginformations`
--
ALTER TABLE `accountinginformations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `person_profile`
--
ALTER TABLE `person_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_profile_profile_id_foreign` (`profile_Id`);

--
-- Indexes for table `stake_holder_information`
--
ALTER TABLE `stake_holder_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_fee_information`
--
ALTER TABLE `transaction_fee_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_fee_policy`
--
ALTER TABLE `transaction_fee_policy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_informations`
--
ALTER TABLE `transaction_informations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_informations_customerid_foreign` (`CustomerId`);

--
-- Indexes for table `transaction_profile`
--
ALTER TABLE `transaction_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_request`
--
ALTER TABLE `transaction_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_request_status`
--
ALTER TABLE `transaction_request_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_request_type`
--
ALTER TABLE `transaction_request_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_status`
--
ALTER TABLE `transaction_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `accountinginformations`
--
ALTER TABLE `accountinginformations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `person_profile`
--
ALTER TABLE `person_profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stake_holder_information`
--
ALTER TABLE `stake_holder_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_fee_information`
--
ALTER TABLE `transaction_fee_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_fee_policy`
--
ALTER TABLE `transaction_fee_policy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_informations`
--
ALTER TABLE `transaction_informations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `transaction_profile`
--
ALTER TABLE `transaction_profile`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_request`
--
ALTER TABLE `transaction_request`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_request_status`
--
ALTER TABLE `transaction_request_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_request_type`
--
ALTER TABLE `transaction_request_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_status`
--
ALTER TABLE `transaction_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_type`
--
ALTER TABLE `transaction_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `person_profile`
--
ALTER TABLE `person_profile`
  ADD CONSTRAINT `person_profile_profile_id_foreign` FOREIGN KEY (`profile_Id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_informations`
--
ALTER TABLE `transaction_informations`
  ADD CONSTRAINT `transaction_informations_customerid_foreign` FOREIGN KEY (`CustomerId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
