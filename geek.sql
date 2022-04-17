-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 10:17 AM
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
-- Database: `geek`
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
-- Table structure for table `currency_rates`
--

CREATE TABLE `currency_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(20,5) NOT NULL COMMENT 'Base rates EURO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currency_rates`
--

INSERT INTO `currency_rates` (`id`, `name`, `rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '0.92000', NULL, NULL),
(2, 'EURO', '1.00000', NULL, NULL);

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
(17, '2022_04_16_233550_create_currency_rates_table', 1),
(18, '2022_04_08_084716_create__person_profile_table', 2);

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
-- Table structure for table `personal_profiles`
--

CREATE TABLE `personal_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profile_Id` bigint(20) UNSIGNED NOT NULL,
  `accountNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalAmount` decimal(20,5) DEFAULT NULL,
  `currencyType` int(11) DEFAULT NULL COMMENT 'Must be set before transaction',
  `PersonContactNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonNidNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonTinNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonFatherName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonMotherName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonHusbandName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonWifeName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CurrentUtcTimeZone` date DEFAULT NULL,
  `PersonPermanentAddress` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PersonPresentAddress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TradeLicenseNo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TaxStatusId` tinyint(4) DEFAULT NULL,
  `DailyTransactionLimit` bigint(20) NOT NULL DEFAULT 0,
  `DailyTransactionLimitAmt` bigint(20) NOT NULL DEFAULT 0,
  `MonthlyTransactionLimit` bigint(20) NOT NULL DEFAULT 0,
  `MonthlyTransactionLimitAmt` bigint(20) NOT NULL DEFAULT 0,
  `TotalNumberOfTransaction` bigint(20) NOT NULL DEFAULT 0,
  `TotalTotalTransactionAmount` bigint(20) NOT NULL DEFAULT 0,
  `CurrentMonthNumberOfTransaction` int(11) NOT NULL,
  `LastTransactionDate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,0=blocked',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_profiles`
--

INSERT INTO `personal_profiles` (`id`, `profile_Id`, `accountNumber`, `totalAmount`, `currencyType`, `PersonContactNo`, `PersonNidNo`, `PersonTinNo`, `PersonFatherName`, `PersonMotherName`, `PersonHusbandName`, `PersonWifeName`, `CurrentUtcTimeZone`, `PersonPermanentAddress`, `PersonPresentAddress`, `TradeLicenseNo`, `TaxStatusId`, `DailyTransactionLimit`, `DailyTransactionLimitAmt`, `MonthlyTransactionLimit`, `MonthlyTransactionLimitAmt`, `TotalNumberOfTransaction`, `TotalTotalTransactionAmount`, `CurrentMonthNumberOfTransaction`, `LastTransactionDate`, `status`, `created_at`, `updated_at`) VALUES
(10, 1, '123456', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, '1', NULL, NULL),
(11, 2, '654321', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, '1', NULL, NULL),
(12, 3, '234567', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, '1', NULL, NULL);

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
  `TransactionType` tinyint(4) NOT NULL COMMENT '1=dabit, 0 = credit',
  `TransactionTypeName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Amount` decimal(20,5) NOT NULL,
  `FromAccount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ToAccount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CurrencyCode` tinyint(4) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1=active,0=pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_informations`
--

INSERT INTO `transaction_informations` (`id`, `CustomerId`, `TransactionNo`, `TransactionType`, `TransactionTypeName`, `Amount`, `FromAccount`, `ToAccount`, `CurrencyCode`, `status`, `created_at`, `updated_at`) VALUES
(33, 1, '625bccd57dabf', 1, 'debit', '1.08144', '3', '123456', 1, '0', '2022-04-17 02:16:21', '2022-04-17 02:16:21'),
(34, 3, '625bccd57dabf', 0, 'credit', '1.08144', '3', '123456', 1, '0', '2022-04-17 02:16:21', '2022-04-17 02:16:21');

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
  `CurrencyCode` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=Euro,0 = USD',
  `PersonProfileId` int(11) DEFAULT NULL,
  `UserIsBlocked` tinyint(4) NOT NULL DEFAULT 0,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '1=admin,0 = user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `OTP`, `IsOTPVerify`, `IsPasswordChanged`, `accountsNumber`, `CurrencyCode`, `PersonProfileId`, `UserIsBlocked`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kazi shamim', 'jahiduldev@gmail.com', NULL, '$2y$10$.gHZrnzJWGT5js1w8Hy1GuNgF5Rl81XsvhyNXrDRkEMA7bfQcoK4.', NULL, '0', 0, 0, 0, NULL, 0, 'admin', NULL, '2022-04-16 18:19:16', '2022-04-16 18:19:16'),
(2, 'Jahidul Isalm', 'kzis1987@gmail.com', NULL, '$2y$10$AhHh8v7Knono6ah4oWgfUONQ9FMSwnGtGIgLoTAo41tlAz6H3irhK', NULL, '0', 0, 0, 0, NULL, 0, 'user', NULL, '2022-04-16 18:19:25', '2022-04-16 18:19:25'),
(3, 'Kazi Maisha', 'kazijahidul1987@gmail.com', NULL, '$2y$10$M5q7OGjGBghQQ0R08ciU8OfamDyenN7uoifCOvzHiM2oSB4l5Qqs6', NULL, '0', 0, 0, 0, NULL, 0, 'user', NULL, '2022-04-16 18:20:13', '2022-04-16 18:20:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountinginformations`
--
ALTER TABLE `accountinginformations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_rates`
--
ALTER TABLE `currency_rates`
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
-- Indexes for table `personal_profiles`
--
ALTER TABLE `personal_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_profiles_profile_id_foreign` (`profile_Id`);

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
-- AUTO_INCREMENT for table `currency_rates`
--
ALTER TABLE `currency_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_profiles`
--
ALTER TABLE `personal_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `personal_profiles`
--
ALTER TABLE `personal_profiles`
  ADD CONSTRAINT `personal_profiles_profile_id_foreign` FOREIGN KEY (`profile_Id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_informations`
--
ALTER TABLE `transaction_informations`
  ADD CONSTRAINT `transaction_informations_customerid_foreign` FOREIGN KEY (`CustomerId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
