-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2024 at 05:22 PM
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
-- Database: `academy_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unique_identifier` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `about` longtext DEFAULT NULL,
  `purchase_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`id`, `user_id`, `address`, `phone`, `message`, `document`, `status`) VALUES
(1, 3, NULL, '+918340460297', 'fsf', 'eFHvg9wVqrD2XIo.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` text NOT NULL,
  `description` longtext NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `is_popular` int(11) NOT NULL,
  `likes` longtext NOT NULL,
  `added_date` varchar(100) NOT NULL,
  `updated_date` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category`
--

CREATE TABLE `blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `added_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `blog_comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `likes` longtext NOT NULL,
  `added_date` varchar(100) NOT NULL,
  `updated_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `font_awesome_class` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `code`, `name`, `parent`, `slug`, `date_added`, `last_modified`, `font_awesome_class`, `thumbnail`) VALUES
(1, '1f5d154f56', 'Web Developments', 0, 'web-developments', 1705878000, NULL, 'fab fa-accusoft', 'd11786b828d01b6ecb7d5fdebfcfa7a1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('jvojdgsm0rgd45nfum50c4748l1b53d0', '::1', 1705561133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730353536313133333b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226e6577223b7d636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b),
('f8ras8t28ae4mgbtcdirg31rl6vokve6', '::1', 1705561134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730353536313133333b636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226e6577223b7d),
('sck500mcrlmqphfl0i2ki4lvvq1itnj5', '::1', 1705561133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730353536313133333b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226e6577223b7d636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b),
('faudahd0b9f9291neukjb3c22r1r5tf4', '::1', 1705561133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730353536313133333b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226e6577223b7d636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b),
('v9fjdjalk5qabb802i3pa9dkpiid0ljd', '::1', 1705561133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730353536313133333b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226e6577223b7d636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b),
('vm2b71g66j3fqbla2i51t1pg6d6ns365', '::1', 1705940515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730353536323931393b636172745f6974656d737c613a303a7b7d6c616e67756167657c733a373a22656e676c697368223b637573746f6d5f73657373696f6e5f6c696d69747c693a313730363830343531343b757365725f69647c733a313a2233223b726f6c655f69647c733a313a2232223b726f6c657c733a343a2255736572223b6e616d657c733a31343a224368616e64616e2050616e646974223b69735f696e7374727563746f727c733a313a2230223b757365725f6c6f67696e7c733a313a2231223b6c61796f75747c733a343a226c697374223b636f756e7443616c6c7c693a313b5f5f63695f766172737c613a313a7b733a393a22636f756e7443616c6c223b733a333a226e6577223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `body` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(21) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `has_read` int(11) DEFAULT NULL,
  `replied` int(11) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_at` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount_percentage` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `expiry_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `outcomes` longtext DEFAULT NULL,
  `faqs` text NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `section` longtext DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `price` double DEFAULT NULL,
  `discount_flag` int(11) DEFAULT 0,
  `discounted_price` double DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `is_top_course` int(11) DEFAULT 0,
  `is_admin` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `course_overview_provider` varchar(255) DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `is_free_course` int(11) DEFAULT NULL,
  `multi_instructor` int(11) NOT NULL DEFAULT 0,
  `enable_drip_content` int(11) NOT NULL,
  `creator` int(11) DEFAULT NULL,
  `expiry_period` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `paypal_supported` int(11) DEFAULT NULL,
  `stripe_supported` int(11) DEFAULT NULL,
  `ccavenue_supported` int(11) DEFAULT 0,
  `iyzico_supported` int(11) DEFAULT 0,
  `paystack_supported` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`, `ccavenue_supported`, `iyzico_supported`, `paystack_supported`) VALUES
(1, 'US Dollar', 'USD', '$', 1, 1, 0, 0, 0),
(2, 'Albanian Lek', 'ALL', 'Lek', 0, 1, 0, 0, 0),
(3, 'Algerian Dinar', 'DZD', 'دج', 1, 1, 0, 0, 0),
(4, 'Angolan Kwanza', 'AOA', 'Kz', 1, 1, 0, 0, 0),
(5, 'Argentine Peso', 'ARS', '$', 1, 1, 0, 0, 0),
(6, 'Armenian Dram', 'AMD', '֏', 1, 1, 0, 0, 0),
(7, 'Aruban Florin', 'AWG', 'ƒ', 1, 1, 0, 0, 0),
(8, 'Australian Dollar', 'AUD', '$', 1, 1, 0, 0, 0),
(9, 'Azerbaijani Manat', 'AZN', 'm', 1, 1, 0, 0, 0),
(10, 'Bahamian Dollar', 'BSD', 'B$', 1, 1, 0, 0, 0),
(11, 'Bahraini Dinar', 'BHD', '.د.ب', 1, 1, 0, 0, 0),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1, 1, 0, 0, 0),
(13, 'Barbadian Dollar', 'BBD', 'Bds$', 1, 1, 0, 0, 0),
(14, 'Belarusian Ruble', 'BYR', 'Br', 0, 0, 0, 0, 0),
(15, 'Belgian Franc', 'BEF', 'fr', 1, 1, 0, 0, 0),
(16, 'Belize Dollar', 'BZD', '$', 1, 1, 0, 0, 0),
(17, 'Bermudan Dollar', 'BMD', '$', 1, 1, 0, 0, 0),
(18, 'Bhutanese Ngultrum', 'BTN', 'Nu.', 1, 1, 0, 0, 0),
(19, 'Bitcoin', 'BTC', '฿', 1, 1, 0, 0, 0),
(20, 'Bolivian Boliviano', 'BOB', 'Bs.', 1, 1, 0, 0, 0),
(21, 'Bosnia', 'BAM', 'KM', 1, 1, 0, 0, 0),
(22, 'Botswanan Pula', 'BWP', 'P', 1, 1, 0, 0, 0),
(23, 'Brazilian Real', 'BRL', 'R$', 1, 1, 0, 0, 0),
(24, 'British Pound Sterling', 'GBP', '£', 1, 1, 0, 0, 0),
(25, 'Brunei Dollar', 'BND', 'B$', 1, 1, 0, 0, 0),
(26, 'Bulgarian Lev', 'BGN', 'Лв.', 1, 1, 0, 0, 0),
(27, 'Burundian Franc', 'BIF', 'FBu', 1, 1, 0, 0, 0),
(28, 'Cambodian Riel', 'KHR', 'KHR', 1, 1, 0, 0, 0),
(29, 'Canadian Dollar', 'CAD', '$', 1, 1, 0, 0, 0),
(30, 'Cape Verdean Escudo', 'CVE', '$', 1, 1, 0, 0, 0),
(31, 'Cayman Islands Dollar', 'KYD', '$', 1, 1, 0, 0, 0),
(32, 'CFA Franc BCEAO', 'XOF', 'CFA', 1, 1, 0, 0, 0),
(33, 'CFA Franc BEAC', 'XAF', 'FCFA', 1, 1, 0, 0, 0),
(34, 'CFP Franc', 'XPF', '₣', 1, 1, 0, 0, 0),
(35, 'Chilean Peso', 'CLP', '$', 1, 1, 0, 0, 0),
(36, 'Chinese Yuan', 'CNY', '¥', 1, 1, 0, 0, 0),
(37, 'Colombian Peso', 'COP', '$', 1, 1, 0, 0, 0),
(38, 'Comorian Franc', 'KMF', 'CF', 1, 1, 0, 0, 0),
(39, 'Congolese Franc', 'CDF', 'FC', 1, 1, 0, 0, 0),
(40, 'Costa Rican ColÃ³n', 'CRC', '₡', 1, 1, 0, 0, 0),
(41, 'Croatian Kuna', 'HRK', 'kn', 1, 1, 0, 0, 0),
(42, 'Cuban Convertible Peso', 'CUC', '$, CUC', 1, 1, 0, 0, 0),
(43, 'Czech Republic Koruna', 'CZK', 'Kč', 1, 1, 0, 0, 0),
(44, 'Danish Krone', 'DKK', 'Kr.', 1, 1, 0, 0, 0),
(45, 'Djiboutian Franc', 'DJF', 'Fdj', 1, 1, 0, 0, 0),
(46, 'Dominican Peso', 'DOP', '$', 1, 1, 0, 0, 0),
(47, 'East Caribbean Dollar', 'XCD', '$', 1, 1, 0, 0, 0),
(48, 'Egyptian Pound', 'EGP', 'ج.م', 1, 1, 0, 0, 0),
(49, 'Eritrean Nakfa', 'ERN', 'Nfk', 1, 1, 0, 0, 0),
(50, 'Estonian Kroon', 'EEK', 'kr', 1, 1, 0, 0, 0),
(51, 'Ethiopian Birr', 'ETB', 'Nkf', 1, 1, 0, 0, 0),
(52, 'Euro', 'EUR', '€', 1, 1, 0, 0, 0),
(53, 'Falkland Islands Pound', 'FKP', '£', 1, 1, 0, 0, 0),
(54, 'Fijian Dollar', 'FJD', 'FJ$', 1, 1, 0, 0, 0),
(55, 'Gambian Dalasi', 'GMD', 'D', 1, 1, 0, 0, 0),
(56, 'Georgian Lari', 'GEL', 'ლ', 1, 1, 0, 0, 0),
(57, 'German Mark', 'DEM', 'DM', 1, 1, 0, 0, 0),
(58, 'Ghanaian Cedi', 'GHS', 'GH₵', 1, 1, 0, 0, 0),
(59, 'Gibraltar Pound', 'GIP', '£', 1, 1, 0, 0, 0),
(60, 'Greek Drachma', 'GRD', '₯, Δρχ, Δρ', 1, 1, 0, 0, 0),
(61, 'Guatemalan Quetzal', 'GTQ', 'Q', 1, 1, 0, 0, 0),
(62, 'Guinean Franc', 'GNF', 'FG', 1, 1, 0, 0, 0),
(63, 'Guyanaese Dollar', 'GYD', '$', 1, 1, 0, 0, 0),
(64, 'Haitian Gourde', 'HTG', 'G', 1, 1, 0, 0, 0),
(65, 'Honduran Lempira', 'HNL', 'L', 1, 1, 0, 0, 0),
(66, 'Hong Kong Dollar', 'HKD', '$', 1, 1, 0, 0, 0),
(67, 'Hungarian Forint', 'HUF', 'Ft', 1, 1, 0, 0, 0),
(68, 'Icelandic KrÃ³na', 'ISK', 'kr', 1, 1, 0, 0, 0),
(69, 'Indian Rupee', 'INR', '₹', 1, 1, 1, 0, 0),
(70, 'Indonesian Rupiah', 'IDR', 'Rp', 1, 1, 0, 0, 0),
(71, 'Iranian Rial', 'IRR', '﷼', 1, 1, 0, 0, 0),
(72, 'Iraqi Dinar', 'IQD', 'د.ع', 1, 1, 0, 0, 0),
(73, 'Israeli New Sheqel', 'ILS', '₪', 1, 1, 0, 0, 0),
(74, 'Italian Lira', 'ITL', 'L,£', 1, 1, 0, 0, 0),
(75, 'Jamaican Dollar', 'JMD', 'J$', 1, 1, 0, 0, 0),
(76, 'Japanese Yen', 'JPY', '¥', 1, 1, 0, 0, 0),
(77, 'Jordanian Dinar', 'JOD', 'ا.د', 1, 1, 0, 0, 0),
(78, 'Kazakhstani Tenge', 'KZT', 'лв', 1, 1, 0, 0, 0),
(79, 'Kenyan Shilling', 'KES', 'KSh', 1, 1, 0, 0, 0),
(80, 'Kuwaiti Dinar', 'KWD', 'ك.د', 1, 1, 0, 0, 0),
(81, 'Kyrgystani Som', 'KGS', 'лв', 1, 1, 0, 0, 0),
(82, 'Laotian Kip', 'LAK', '₭', 1, 1, 0, 0, 0),
(83, 'Latvian Lats', 'LVL', 'Ls', 0, 0, 0, 0, 0),
(84, 'Lebanese Pound', 'LBP', '£', 1, 1, 0, 0, 0),
(85, 'Lesotho Loti', 'LSL', 'L', 1, 1, 0, 0, 0),
(86, 'Liberian Dollar', 'LRD', '$', 1, 1, 0, 0, 0),
(87, 'Libyan Dinar', 'LYD', 'د.ل', 1, 1, 0, 0, 0),
(88, 'Lithuanian Litas', 'LTL', 'Lt', 0, 0, 0, 0, 0),
(89, 'Macanese Pataca', 'MOP', '$', 1, 1, 0, 0, 0),
(90, 'Macedonian Denar', 'MKD', 'ден', 1, 1, 0, 0, 0),
(91, 'Malagasy Ariary', 'MGA', 'Ar', 1, 1, 0, 0, 0),
(92, 'Malawian Kwacha', 'MWK', 'MK', 1, 1, 0, 0, 0),
(93, 'Malaysian Ringgit', 'MYR', 'RM', 1, 1, 0, 0, 0),
(94, 'Maldivian Rufiyaa', 'MVR', 'Rf', 1, 1, 0, 0, 0),
(95, 'Mauritanian Ouguiya', 'MRO', 'MRU', 1, 1, 0, 0, 0),
(96, 'Mauritian Rupee', 'MUR', '₨', 1, 1, 0, 0, 0),
(97, 'Mexican Peso', 'MXN', '$', 1, 1, 0, 0, 0),
(98, 'Moldovan Leu', 'MDL', 'L', 1, 1, 0, 0, 0),
(99, 'Mongolian Tugrik', 'MNT', '₮', 1, 1, 0, 0, 0),
(100, 'Moroccan Dirham', 'MAD', 'MAD', 1, 1, 0, 0, 0),
(101, 'Mozambican Metical', 'MZM', 'MT', 1, 1, 0, 0, 0),
(102, 'Myanmar Kyat', 'MMK', 'K', 1, 1, 0, 0, 0),
(103, 'Namibian Dollar', 'NAD', '$', 1, 1, 0, 0, 0),
(104, 'Nepalese Rupee', 'NPR', '₨', 1, 1, 0, 0, 0),
(105, 'Netherlands Antillean Guilder', 'ANG', 'ƒ', 1, 1, 0, 0, 0),
(106, 'New Taiwan Dollar', 'TWD', '$', 1, 1, 0, 0, 0),
(107, 'New Zealand Dollar', 'NZD', '$', 1, 1, 0, 0, 0),
(108, 'Nicaraguan CÃ³rdoba', 'NIO', 'C$', 1, 1, 0, 0, 0),
(109, 'Nigerian Naira', 'NGN', '₦', 1, 1, 0, 0, 1),
(110, 'North Korean Won', 'KPW', '₩', 0, 0, 0, 0, 0),
(111, 'Norwegian Krone', 'NOK', 'kr', 1, 1, 0, 0, 0),
(112, 'Omani Rial', 'OMR', '.ع.ر', 0, 0, 0, 0, 0),
(113, 'Pakistani Rupee', 'PKR', '₨', 1, 1, 0, 0, 0),
(114, 'Panamanian Balboa', 'PAB', 'B/.', 1, 1, 0, 0, 0),
(115, 'Papua New Guinean Kina', 'PGK', 'K', 1, 1, 0, 0, 0),
(116, 'Paraguayan Guarani', 'PYG', '₲', 1, 1, 0, 0, 0),
(117, 'Peruvian Nuevo Sol', 'PEN', 'S/.', 1, 1, 0, 0, 0),
(118, 'Philippine Peso', 'PHP', '₱', 1, 1, 0, 0, 0),
(119, 'Polish Zloty', 'PLN', 'zł', 1, 1, 0, 0, 0),
(120, 'Qatari Rial', 'QAR', 'ق.ر', 1, 1, 0, 0, 0),
(121, 'Romanian Leu', 'RON', 'lei', 1, 1, 0, 0, 0),
(122, 'Russian Ruble', 'RUB', '₽', 1, 1, 0, 0, 0),
(123, 'Rwandan Franc', 'RWF', 'FRw', 1, 1, 0, 0, 0),
(124, 'Salvadoran ColÃ³n', 'SVC', '₡', 0, 0, 0, 0, 0),
(125, 'Samoan Tala', 'WST', 'SAT', 1, 1, 0, 0, 0),
(126, 'Saudi Riyal', 'SAR', '﷼', 1, 1, 0, 0, 0),
(127, 'Serbian Dinar', 'RSD', 'din', 1, 1, 0, 0, 0),
(128, 'Seychellois Rupee', 'SCR', 'SRe', 1, 1, 0, 0, 0),
(129, 'Sierra Leonean Leone', 'SLL', 'Le', 1, 1, 0, 0, 0),
(130, 'Singapore Dollar', 'SGD', '$', 1, 1, 0, 0, 0),
(131, 'Slovak Koruna', 'SKK', 'Sk', 1, 1, 0, 0, 0),
(132, 'Solomon Islands Dollar', 'SBD', 'Si$', 1, 1, 0, 0, 0),
(133, 'Somali Shilling', 'SOS', 'Sh.so.', 1, 1, 0, 0, 0),
(134, 'South African Rand', 'ZAR', 'R', 1, 1, 0, 0, 0),
(135, 'South Korean Won', 'KRW', '₩', 1, 1, 0, 0, 0),
(136, 'Special Drawing Rights', 'XDR', 'SDR', 1, 1, 0, 0, 0),
(137, 'Sri Lankan Rupee', 'LKR', 'Rs', 1, 1, 0, 0, 0),
(138, 'St. Helena Pound', 'SHP', '£', 1, 1, 0, 0, 0),
(139, 'Sudanese Pound', 'SDG', '.س.ج', 1, 1, 0, 0, 0),
(140, 'Surinamese Dollar', 'SRD', '$', 1, 1, 0, 0, 0),
(141, 'Swazi Lilangeni', 'SZL', 'E', 1, 1, 0, 0, 0),
(142, 'Swedish Krona', 'SEK', 'kr', 1, 1, 0, 0, 0),
(143, 'Swiss Franc', 'CHF', 'CHf', 1, 1, 0, 0, 0),
(144, 'Syrian Pound', 'SYP', 'LS', 0, 0, 0, 0, 0),
(145, 'São Tomé and Príncipe Dobra', 'STD', 'Db', 1, 1, 0, 0, 0),
(146, 'Tajikistani Somoni', 'TJS', 'SM', 1, 1, 0, 0, 0),
(147, 'Tanzanian Shilling', 'TZS', 'TSh', 1, 1, 0, 0, 0),
(148, 'Thai Baht', 'THB', '฿', 1, 1, 0, 0, 0),
(149, 'Tongan pa\'anga', 'TOP', '$', 1, 1, 0, 0, 0),
(150, 'Trinidad & Tobago Dollar', 'TTD', '$', 1, 1, 0, 0, 0),
(151, 'Tunisian Dinar', 'TND', 'ت.د', 1, 1, 0, 0, 0),
(152, 'Turkish Lira', 'TRY', '₺', 1, 1, 0, 1, 0),
(153, 'Turkmenistani Manat', 'TMT', 'T', 1, 1, 0, 0, 0),
(154, 'Ugandan Shilling', 'UGX', 'USh', 1, 1, 0, 0, 0),
(155, 'Ukrainian Hryvnia', 'UAH', '₴', 1, 1, 0, 0, 0),
(156, 'United Arab Emirates Dirham', 'AED', 'إ.د', 1, 1, 0, 0, 0),
(157, 'Uruguayan Peso', 'UYU', '$', 1, 1, 0, 0, 0),
(158, 'Afghan Afghani', 'AFA', '؋', 1, 1, 0, 0, 0),
(159, 'Uzbekistan Som', 'UZS', 'лв', 1, 1, 0, 0, 0),
(160, 'Vanuatu Vatu', 'VUV', 'VT', 1, 1, 0, 0, 0),
(161, 'Venezuelan BolÃvar', 'VEF', 'Bs', 0, 0, 0, 0, 0),
(162, 'Vietnamese Dong', 'VND', '₫', 1, 1, 0, 0, 0),
(163, 'Yemeni Rial', 'YER', '﷼', 1, 1, 0, 0, 0),
(164, 'Zambian Kwacha', 'ZMK', 'ZK', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_page`
--

CREATE TABLE `custom_page` (
  `custom_page_id` int(11) NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `page_content` longtext NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `button_title` varchar(255) NOT NULL,
  `button_position` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrol`
--

CREATE TABLE `enrol` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `gifted_by` int(11) NOT NULL DEFAULT 0,
  `expiry_date` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`) VALUES
(1, 'banner_title', 'Start learning from best Platform'),
(2, 'banner_sub_title', 'Study any topic, anytime. Explore thousands of courses for the lowest price ever!'),
(4, 'about_us', '<p></p><h2><span xss=\"removed\">About us</span></h2>'),
(10, 'terms_and_condition', '<h2>Terms and Condition</h2>'),
(11, 'privacy_policy', '<p></p><p></p><h2><span xss=\"removed\">Privacy Policy</span></h2>'),
(13, 'theme', 'default-new'),
(14, 'cookie_note', 'This website uses cookies to personalize content and analyse traffic in order to offer you a better experience.'),
(15, 'cookie_status', 'active'),
(16, 'cookie_policy', '<h1>Cookie policy</h1><ol><li>Cookies are small text files that can be used by websites to make a user\'s experience more efficient.</li><li>The law states that we can store cookies on your device if they are strictly necessary for the operation of this site. For all other types of cookies we need your permission.</li><li>This site uses different types of cookies. Some cookies are placed by third party services that appear on our pages.</li></ol>'),
(17, 'banner_image', '{\"home_1\":\"home-1.png\"}'),
(18, 'light_logo', 'logo-light.png'),
(19, 'dark_logo', 'logo-dark.png'),
(20, 'small_logo', 'logo-light-sm.png'),
(21, 'favicon', 'favicon.png'),
(22, 'recaptcha_status', '0'),
(23, 'recaptcha_secretkey', 'Valid-secret-key'),
(24, 'recaptcha_sitekey', 'Valid-site-key'),
(25, 'refund_policy', '<h2><span xss=\"removed\">Refund Policy</span></h2>'),
(26, 'facebook', 'https://facebook.com'),
(27, 'twitter', 'https://twitter.com'),
(28, 'linkedin', ''),
(31, 'blog_page_title', 'Where possibilities begin'),
(32, 'blog_page_subtitle', 'We’re a leading marketplace platform for learning and teaching online. Explore some of our most popular content and learn something new.'),
(33, 'blog_page_banner', 'blog-page.png'),
(34, 'instructors_blog_permission', '0'),
(35, 'blog_visibility_on_the_home_page', '1'),
(37, 'website_faqs', '[]'),
(38, 'motivational_speech', '[]'),
(39, 'home_page', 'home_2'),
(40, 'contact_info', '{\"email\":\"\",\"phone\":\"\",\"address\":\"\",\"office_hours\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext DEFAULT NULL,
  `english` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`) VALUES
(1, '404_not_found', '404 not found'),
(2, 'courses', 'Courses'),
(3, 'all_courses', 'All courses'),
(4, 'search', 'Search'),
(5, 'you_have_no_items_in_your_cart!', 'You have no items in your cart!'),
(6, 'checkout', 'Checkout'),
(7, 'login', 'Login'),
(8, 'join_now', 'Join now'),
(9, 'sign_up', 'Sign up'),
(10, 'cart', 'Cart'),
(11, 'categories', 'Categories'),
(12, 'categories', 'Categories'),
(13, 'cookie_policy', 'Cookie policy'),
(14, 'accept', 'Accept'),
(15, 'accept', 'Accept'),
(16, 'home', 'Home'),
(17, 'the_page_you_requested_could_not_be_found', 'The page you requested could not be found'),
(18, 'the_page_you_requested_could_not_be_found', 'The page you requested could not be found'),
(19, 'check_the_spelling_of_the_url', 'Check the spelling of the url'),
(20, 'check_the_spelling_of_the_url', 'Check the spelling of the url'),
(21, 'if_you_are_still_puzzled,_click_on_the_home_link_below', 'If you are still puzzled, click on the home link below'),
(22, 'back_to_home', 'Back to home'),
(23, 'back_to_home', 'Back to home'),
(24, 'top_categories', 'Top categories'),
(25, 'top_categories', 'Top categories'),
(26, 'useful_links', 'Useful links'),
(27, 'become_an_instructor', 'Become an instructor'),
(28, 'blog', 'Blog'),
(29, 'help', 'Help'),
(30, 'contact_us', 'Contact us'),
(31, 'about_us', 'About us'),
(32, 'privacy_policy', 'Privacy policy'),
(33, 'terms_and_condition', 'Terms and condition'),
(34, 'faq', 'Faq'),
(35, 'refund_policy', 'Refund policy'),
(36, 'refund_policy', 'Refund policy'),
(37, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter'),
(38, 'enter_your_email_address', 'Enter your email address'),
(39, 'subscribe_to_our_newsletter', 'Subscribe to our newsletter'),
(40, 'creativeitem', 'Creativeitem'),
(41, 'are_you_sure', 'Are you sure'),
(42, 'yes', 'Yes'),
(43, 'yes', 'Yes'),
(44, 'no', 'No'),
(45, 'no', 'No'),
(46, 'log_in', 'Log in'),
(47, 'explore,_learn,_and_grow_with_us._enjoy_a_seamless_and_enriching_educational_journey._lets_begin!', 'Explore, learn, and grow with us. enjoy a seamless and enriching educational journey. lets begin!'),
(48, 'your_email', 'Your email'),
(49, 'enter_your_email', 'Enter your email'),
(50, 'password', 'Password'),
(51, 'enter_your_valid_password', 'Enter your valid password'),
(52, 'forgot_password?', 'Forgot password?'),
(53, 'don`t_have_an_account?', 'Don`t have an account?'),
(54, 'or', 'Or'),
(55, 'welcome', 'Welcome'),
(56, 'dashboard', 'Dashboard'),
(57, 'quick_actions', 'Quick actions'),
(58, 'create_course', 'Create course'),
(59, 'add_course', 'Add course'),
(60, 'add_new_lesson', 'Add new lesson'),
(61, 'add_lesson', 'Add lesson'),
(62, 'add_student', 'Add student'),
(63, 'enrol_a_student', 'Enrol a student'),
(64, 'enrol_student', 'Enrol student'),
(65, 'help_center', 'Help center'),
(66, 'read_documentation', 'Read documentation'),
(67, 'watch_video_tutorial', 'Watch video tutorial'),
(68, 'get_customer_support', 'Get customer support'),
(69, 'order_customization', 'Order customization'),
(70, 'request_a_new_feature', 'Request a new feature'),
(71, 'browse_addons', 'Browse addons'),
(72, 'remove_all', 'Remove all'),
(73, 'notification', 'Notification'),
(74, 'no_notification', 'No notification'),
(75, 'stay_tuned!', 'Stay tuned!'),
(76, 'notifications_about_your_activity_will_show_up_here.', 'Notifications about your activity will show up here.'),
(77, 'notification_settings', 'Notification settings'),
(78, 'mark_all_as_read', 'Mark all as read'),
(79, 'admin', 'Admin'),
(80, 'my_account', 'My account'),
(81, 'settings', 'Settings'),
(82, 'logout', 'Logout'),
(83, 'visit_website', 'Visit website'),
(84, 'navigation', 'Navigation'),
(85, 'manage_courses', 'Manage courses'),
(86, 'add_new_course', 'Add new course'),
(87, 'course_category', 'Course category'),
(88, 'coupons', 'Coupons'),
(89, 'enrollments', 'Enrollments'),
(90, 'course_enrollment', 'Course enrollment'),
(91, 'enrol_history', 'Enrol history'),
(92, 'report', 'Report'),
(93, 'admin_revenue', 'Admin revenue'),
(94, 'instructor_revenue', 'Instructor revenue'),
(95, 'purchase_history', 'Purchase history'),
(96, 'users', 'Users'),
(97, 'admins', 'Admins'),
(98, 'manage_admins', 'Manage admins'),
(99, 'add_new_admin', 'Add new admin'),
(100, 'instructors', 'Instructors'),
(101, 'manage_instructors', 'Manage instructors'),
(102, 'add_new_instructor', 'Add new instructor'),
(103, 'instructor_payout', 'Instructor payout'),
(104, 'instructor_settings', 'Instructor settings'),
(105, 'applications', 'Applications'),
(106, 'students', 'Students'),
(107, 'manage_students', 'Manage students'),
(108, 'add_new_student', 'Add new student'),
(109, 'message', 'Message'),
(110, 'newsletter', 'Newsletter'),
(111, 'all_newsletter', 'All newsletter'),
(112, 'subscribed_user', 'Subscribed user'),
(113, 'contact', 'Contact'),
(114, 'all_blogs', 'All blogs'),
(115, 'pending_blog', 'Pending blog'),
(116, 'blog_category', 'Blog category'),
(117, 'blog_settings', 'Blog settings'),
(118, 'addons', 'Addons'),
(119, 'themes', 'Themes'),
(120, 'system_settings', 'System settings'),
(121, 'website_settings', 'Website settings'),
(122, 'academy_cloud', 'Academy cloud'),
(123, 'drip_content_settings', 'Drip content settings'),
(124, 'payment_settings', 'Payment settings'),
(125, 'language_settings', 'Language settings'),
(126, 'social_login', 'Social login'),
(127, 'custom_page_builder', 'Custom page builder'),
(128, 'data_center', 'Data center'),
(129, 'about', 'About'),
(130, 'manage_profile', 'Manage profile'),
(131, 'admin_revenue_this_year', 'Admin revenue this year'),
(132, 'number_courses', 'Number courses'),
(133, 'number_of_lessons', 'Number of lessons'),
(134, 'number_of_enrolment', 'Number of enrolment'),
(135, 'number_of_student', 'Number of student'),
(136, 'course_overview', 'Course overview'),
(137, 'active_courses', 'Active courses'),
(138, 'pending_courses', 'Pending courses'),
(139, 'requested_withdrawal', 'Requested withdrawal'),
(140, 'january', 'January'),
(141, 'february', 'February'),
(142, 'march', 'March'),
(143, 'april', 'April'),
(144, 'may', 'May'),
(145, 'june', 'June'),
(146, 'july', 'July'),
(147, 'august', 'August'),
(148, 'september', 'September'),
(149, 'october', 'October'),
(150, 'november', 'November'),
(151, 'december', 'December'),
(152, 'this_year', 'This year'),
(153, 'active_course', 'Active course'),
(154, 'pending_course', 'Pending course'),
(155, 'heads_up', 'Heads up'),
(156, 'congratulations', 'Congratulations'),
(157, 'oh_snap', 'Oh snap'),
(158, 'please_fill_all_the_required_fields', 'Please fill all the required fields'),
(159, 'close', 'Close'),
(160, 'cancel', 'Cancel'),
(161, 'continue', 'Continue'),
(162, 'ok', 'Ok'),
(163, 'success', 'Success'),
(164, 'your_server_does_not_allow_uploading_files_that_large.', 'Your server does not allow uploading files that large.'),
(165, 'your_servers_file_upload_limit_is_40mb', 'Your servers file upload limit is 40mb'),
(166, 'successfully', 'Successfully'),
(167, 'div_added_to_bottom_', 'Div added to bottom '),
(168, 'div_has_been_deleted_', 'Div has been deleted '),
(169, 'administration', 'Administration'),
(170, 'log_out', 'Log out'),
(171, 'start_learning_from_best_platform', 'Start learning from best platform'),
(172, 'study_any_topic,_anytime._explore_thousands_of_courses_for_the_lowest_price_ever!', 'Study any topic, anytime. explore thousands of courses for the lowest price ever!'),
(173, 'what_do_you_want_to_learn', 'What do you want to learn'),
(174, 'happy', 'Happy'),
(175, 'experienced', 'Experienced'),
(176, 'online_courses', 'Online courses'),
(177, 'explore_a_variety_of_fresh_topics', 'Explore a variety of fresh topics'),
(178, 'expert_instruction', 'Expert instruction'),
(179, 'find_the_right_course_for_you', 'Find the right course for you'),
(180, 'smart_solution', 'Smart solution'),
(181, 'learn_on_your_schedule', 'Learn on your schedule'),
(182, 'top_courses', 'Top courses'),
(183, 'these_are_the_most_popular_courses_among_listen_courses_learners_worldwide', 'These are the most popular courses among listen courses learners worldwide'),
(184, 'top', 'Top'),
(185, 'latest_courses', 'Latest courses'),
(186, 'these_are_the_most_latest_courses_among_listen_courses_learners_worldwide', 'These are the most latest courses among listen courses learners worldwide'),
(187, 'join_now_to_start_learning', 'Join now to start learning'),
(188, 'learn_from_our_quality_instructors!', 'Learn from our quality instructors!'),
(189, 'get_started', 'Get started'),
(190, 'become_a_new_instructor', 'Become a new instructor'),
(191, 'teach_thousands_of_students_and_earn_money!', 'Teach thousands of students and earn money!'),
(192, 'all_category', 'All category'),
(193, 'show_more', 'Show more'),
(194, 'show_less', 'Show less'),
(195, 'price', 'Price'),
(196, 'all', 'All'),
(197, 'free', 'Free'),
(198, 'paid', 'Paid'),
(199, 'level', 'Level'),
(200, 'beginner', 'Beginner'),
(201, 'intermediate', 'Intermediate'),
(202, 'advanced', 'Advanced'),
(203, 'language', 'Language'),
(204, 'ratings', 'Ratings'),
(205, 'list_view', 'List view'),
(206, 'grid_view', 'Grid view'),
(207, 'reset', 'Reset'),
(208, 'showing', 'Showing'),
(209, 'of', 'Of'),
(210, 'results', 'Results'),
(211, 'newly_published', 'Newly published'),
(212, 'highest_rating', 'Highest rating'),
(213, 'lowest_price', 'Lowest price'),
(214, 'highest_price', 'Highest price'),
(215, 'discounted', 'Discounted'),
(216, 'website_name', 'Website name'),
(217, 'website_title', 'Website title'),
(218, 'website_keywords', 'Website keywords'),
(219, 'website_description', 'Website description'),
(220, 'author', 'Author'),
(221, 'slogan', 'Slogan'),
(222, 'system_email', 'System email'),
(223, 'address', 'Address'),
(224, 'phone', 'Phone'),
(225, 'youtube_api_key', 'Youtube api key'),
(226, 'get_youtube_api_key', 'Get youtube api key'),
(227, 'if_you_want_to_use_google_drive_video,_you_need_to_enable_the_google_drive_service_in_this_api', 'If you want to use google drive video, you need to enable the google drive service in this api'),
(228, 'vimeo_api_key', 'Vimeo api key'),
(229, 'get_vimeo_api_key', 'Get vimeo api key'),
(230, 'purchase_code', 'Purchase code'),
(231, 'system_language', 'System language'),
(232, 'student_email_verification', 'Student email verification'),
(233, 'enable', 'Enable'),
(234, 'disable', 'Disable'),
(235, 'course_accessibility', 'Course accessibility'),
(236, 'publicly', 'Publicly'),
(237, 'only_logged_in_users', 'Only logged in users'),
(238, 'number_of_authorized_devices', 'Number of authorized devices'),
(239, 'how_many_devices_do_you_want_to_allow_for_logging_in_using_a_single_account', 'How many devices do you want to allow for logging in using a single account'),
(240, 'course_selling_tax', 'Course selling tax'),
(241, 'enter_0_if_you_want_to_disable_the_tax_option', 'Enter 0 if you want to disable the tax option'),
(242, 'google_analytics_id', 'Google analytics id'),
(243, 'keep_it_blank_if_you_want_to_disable_it', 'Keep it blank if you want to disable it'),
(244, 'meta_pixel_id', 'Meta pixel id'),
(245, 'footer_text', 'Footer text'),
(246, 'footer_link', 'Footer link'),
(247, 'save', 'Save'),
(248, 'update_product', 'Update product'),
(249, 'file', 'File'),
(250, 'update', 'Update'),
(251, 'frontend_settings', 'Frontend settings'),
(252, 'home_page_layout', 'Home page layout'),
(253, 'motivational_speech', 'Motivational speech'),
(254, 'website_faqs', 'Website faqs'),
(255, 'contact_information', 'Contact information'),
(256, 'recaptcha', 'Recaptcha'),
(257, 'logo_&_images', 'Logo & images'),
(258, 'frontend_website_settings', 'Frontend website settings'),
(259, 'banner_title', 'Banner title'),
(260, 'banner_sub_title', 'Banner sub title'),
(261, 'cookie_status', 'Cookie status'),
(262, 'active', 'Active'),
(263, 'inactive', 'Inactive'),
(264, 'cookie_note', 'Cookie note'),
(265, 'facebook', 'Facebook'),
(266, 'twitter', 'Twitter'),
(267, 'linkedin', 'Linkedin'),
(268, 'update_settings', 'Update settings'),
(269, 'activated', 'Activated'),
(270, 'title', 'Title'),
(271, 'description', 'Description'),
(272, 'image', 'Image'),
(273, 'upload_image', 'Upload image'),
(274, 'faq_question', 'Faq question'),
(275, 'save_changes', 'Save changes'),
(276, 'question', 'Question'),
(277, 'answer', 'Answer'),
(278, 'contact_email', 'Contact email'),
(279, 'phone_number', 'Phone number'),
(280, 'office_hours', 'Office hours'),
(281, 'submit', 'Submit'),
(282, 'recaptcha_settings', 'Recaptcha settings'),
(283, 'recaptcha_status', 'Recaptcha status'),
(284, 'recaptcha_sitekey', 'Recaptcha sitekey'),
(285, 'recaptcha_secretkey', 'Recaptcha secretkey'),
(286, 'update_recaptcha_settings', 'Update recaptcha settings'),
(287, 'update_banner_image', 'Update banner image'),
(288, 'upload_banner_image', 'Upload banner image'),
(289, 'update_light_logo', 'Update light logo'),
(290, 'upload_light_logo', 'Upload light logo'),
(291, 'update_dark_logo', 'Update dark logo'),
(292, 'upload_dark_logo', 'Upload dark logo'),
(293, 'update_small_logo', 'Update small logo'),
(294, 'upload_small_logo', 'Upload small logo'),
(295, 'update_favicon', 'Update favicon'),
(296, 'upload_favicon', 'Upload favicon'),
(297, 'manage_your_drip_content_settings', 'Manage your drip content settings'),
(298, 'lesson_completion_role', 'Lesson completion role'),
(299, 'video_percentage_wise', 'Video percentage wise'),
(300, 'video_duration_wise', 'Video duration wise'),
(301, 'minimum_duration_to_watch', 'Minimum duration to watch'),
(302, 'minimum_percentage_to_watch', 'Minimum percentage to watch'),
(303, 'message_for_locked_lesson', 'Message for locked lesson'),
(304, 'attention', 'Attention'),
(305, 'the_auto_checkmark_is_only_applicable_for_video_lessons', 'The auto checkmark is only applicable for video lessons'),
(306, 'learn_more', 'Learn more'),
(307, 'setup_payment_informations', 'Setup payment informations'),
(308, 'system_currency_settings', 'System currency settings'),
(309, 'system_currency', 'System currency'),
(310, 'select_system_currency', 'Select system currency'),
(311, 'currency_position', 'Currency position'),
(312, 'left', 'Left'),
(313, 'right', 'Right'),
(314, 'left_with_a_space', 'Left with a space'),
(315, 'right_with_a_space', 'Right with a space'),
(316, 'update_system_currency', 'Update system currency'),
(317, 'want_to_keep_test_mode_enabled', 'Want to keep test mode enabled'),
(318, 'select_currency', 'Select currency'),
(319, 'sandbox_client_id', 'Sandbox client id'),
(320, 'sandbox_secret_key', 'Sandbox secret key'),
(321, 'production_client_id', 'Production client id'),
(322, 'production_secret_key', 'Production secret key'),
(323, 'public_key', 'Public key'),
(324, 'secret_key', 'Secret key'),
(325, 'public_live_key', 'Public live key'),
(326, 'secret_live_key', 'Secret live key'),
(327, 'key_id', 'Key id'),
(328, 'theme_color', 'Theme color'),
(329, 'ensure_that_the_system_currency_and_all_active_payment_gateway_currencies_are_same', 'Ensure that the system currency and all active payment gateway currencies are same'),
(330, 'multi_language_settings', 'Multi language settings'),
(331, 'manage_language', 'Manage language'),
(332, 'language_list', 'Language list'),
(333, 'add_language', 'Add language'),
(334, 'import_language', 'Import language'),
(335, 'direction', 'Direction'),
(336, 'option', 'Option'),
(337, 'ltr', 'Ltr'),
(338, 'rtl', 'Rtl'),
(339, 'edit_phrase', 'Edit phrase'),
(340, 'export', 'Export'),
(341, 'delete_language', 'Delete language'),
(342, 'add_new_phrase', 'Add new phrase'),
(343, 'add_new_language', 'Add new language'),
(344, 'no_special_character_or_space_is_allowed', 'No special character or space is allowed'),
(345, 'valid_examples', 'Valid examples'),
(346, 'choose_your_json_file', 'Choose your json file'),
(347, 'import', 'Import'),
(348, 'phrase_updated', 'Phrase updated'),
(349, 'website_notification', 'Website notification'),
(350, 'smtp_settings', 'Smtp settings'),
(351, 'email_template', 'Email template'),
(352, 'protocol', 'Protocol'),
(353, 'smtp_crypto', 'Smtp crypto'),
(354, 'smtp_host', 'Smtp host'),
(355, 'smtp_port', 'Smtp port'),
(356, 'smtp_from_email', 'Smtp from email'),
(357, 'smtp_username', 'Smtp username'),
(358, 'smtp_password', 'Smtp password'),
(359, 'email_type', 'Email type'),
(360, 'email_subject', 'Email subject'),
(361, 'action', 'Action'),
(362, 'to_admin', 'To admin'),
(363, 'to_user', 'To user'),
(364, 'edit_email_template', 'Edit email template'),
(365, 'to_instructor', 'To instructor'),
(366, 'to_student', 'To student'),
(367, 'to_affiliator', 'To affiliator'),
(368, 'to_payer', 'To payer'),
(369, 'to_receiver', 'To receiver'),
(370, 'configure_your_notification_settings', 'Configure your notification settings'),
(371, 'new_user_registration', 'New user registration'),
(372, 'get_notified_when_a_new_user_signs_up', 'Get notified when a new user signs up'),
(373, 'configure_for_admin', 'Configure for admin'),
(374, 'system_notification', 'System notification'),
(375, 'email_notification', 'Email notification'),
(376, 'configure_for_user', 'Configure for user'),
(377, 'email_verification', 'Email verification'),
(378, 'not_editable', 'Not editable'),
(379, 'it_is_permanently_enabled_for_student_email_verification.', 'It is permanently enabled for student email verification.'),
(380, 'forgot_password_mail', 'Forgot password mail'),
(381, 'account_security_alert', 'Account security alert'),
(382, 'send_verification_code_for_login_from_a_new_device', 'Send verification code for login from a new device'),
(383, 'course_purchase_notification', 'Course purchase notification'),
(384, 'stay_up-to-date_on_student_course_purchases.', 'Stay up-to-date on student course purchases.'),
(385, 'configure_for_student', 'Configure for student'),
(386, 'configure_for_instructor', 'Configure for instructor'),
(387, 'course_completion_mail', 'Course completion mail'),
(388, 'stay_up_to_date_on_student_course_completion.', 'Stay up to date on student course completion.'),
(389, 'course_gift_notification', 'Course gift notification'),
(390, 'notify_users_after_course_gift', 'Notify users after course gift'),
(391, 'configure_for_payer', 'Configure for payer'),
(392, 'configure_for_receiver', 'Configure for receiver'),
(393, 'social_login_configuration', 'Social login configuration'),
(394, 'issue', 'Issue'),
(395, 'you_must_use_an_ssl_supported_server_to_use_the_facebook_login_feature', 'You must use an ssl supported server to use the facebook login feature'),
(396, 'facebook_login', 'Facebook login'),
(397, 'facebook_app_creation_instruction', 'Facebook app creation instruction'),
(398, 'facebook_app_id', 'Facebook app id'),
(399, 'facebook_app_secret', 'Facebook app secret'),
(400, 'custom_pages', 'Custom pages'),
(401, 'add_a_new_page', 'Add a new page'),
(402, 'page_title', 'Page title'),
(403, 'button_title', 'Button title'),
(404, 'button_position', 'Button position'),
(405, 'actions', 'Actions'),
(406, 'add_custom_page', 'Add custom page'),
(407, 'add_your_new_page', 'Add your new page'),
(408, 'page_information', 'Page information'),
(409, 'enter_page_title', 'Enter page title'),
(410, 'page_content', 'Page content'),
(411, 'footer', 'Footer'),
(412, 'header', 'Header'),
(413, 'page_url', 'Page url'),
(414, 'add_page', 'Add page'),
(415, 'import_your_data', 'Import your data'),
(416, 'choose_your_demo_file', 'Choose your demo file'),
(417, 'backup_your_website', 'Backup your website'),
(418, 'backup_your_current_data', 'Backup your current data'),
(419, 'keep_a_backup', 'Keep a backup'),
(420, 'no_backup', 'No backup'),
(421, 'your_backup_file_has_been_stored_successfully', 'Your backup file has been stored successfully'),
(422, 'delete', 'Delete'),
(423, 'not_found', 'Not found'),
(424, 'about_this_application', 'About this application'),
(425, 'software_version', 'Software version'),
(426, 'check_update', 'Check update'),
(427, 'php_version', 'Php version'),
(428, 'curl_enable', 'Curl enable'),
(429, 'enabled', 'Enabled'),
(430, 'product_license', 'Product license'),
(431, 'invalid', 'Invalid'),
(432, 'enter_valid_purchase_code', 'Enter valid purchase code'),
(433, 'customer_support_status', 'Customer support status'),
(434, 'support_expiry_date', 'Support expiry date'),
(435, 'customer_name', 'Customer name'),
(436, 'customer_support', 'Customer support'),
(437, 'basic_info', 'Basic info'),
(438, 'first_name', 'First name'),
(439, 'last_name', 'Last name'),
(440, 'email', 'Email'),
(441, 'facebook_link', 'Facebook link'),
(442, 'twitter_link', 'Twitter link'),
(443, 'linkedin_link', 'Linkedin link'),
(444, 'a_short_title_about_yourself', 'A short title about yourself'),
(445, 'skills', 'Skills'),
(446, 'write_your_skill_and_click_the_enter_button', 'Write your skill and click the enter button'),
(447, 'biography', 'Biography'),
(448, 'photo', 'Photo'),
(449, 'the_image_size_should_be_any_square_image', 'The image size should be any square image'),
(450, 'choose_file', 'Choose file'),
(451, 'update_profile', 'Update profile'),
(452, 'current_password', 'Current password'),
(453, 'new_password', 'New password'),
(454, 'confirm_new_password', 'Confirm new password'),
(455, 'update_password', 'Update password'),
(456, 'blogs', 'Blogs'),
(457, 'add_new_blog', 'Add new blog'),
(458, 'creator', 'Creator'),
(459, 'category', 'Category'),
(460, 'status', 'Status'),
(461, 'add_blog', 'Add blog'),
(462, 'add_a_new_blog', 'Add a new blog'),
(463, 'enter_blog_title', 'Enter blog title'),
(464, 'select_a_category', 'Select a category'),
(465, 'keywords', 'Keywords'),
(466, 'click_the_enter_button_after_writing_your_keyword', 'Click the enter button after writing your keyword'),
(467, 'blog_banner', 'Blog banner'),
(468, 'choose_a_banner', 'Choose a banner'),
(469, 'blog_thumbnail', 'Blog thumbnail'),
(470, 'choose_a_thumbnail', 'Choose a thumbnail'),
(471, 'do_you_want_to_mark_it_as_popular', 'Do you want to mark it as popular'),
(472, 'mark_as_popular', 'Mark as popular'),
(473, 'instructors_pending_blog', 'Instructors pending blog'),
(474, 'total_pending', 'Total pending'),
(475, 'blog_categories', 'Blog categories'),
(476, 'add_a_new_category', 'Add a new category'),
(477, 'add_new_category', 'Add new category'),
(478, 'subtitle', 'Subtitle'),
(479, 'character', 'Character'),
(480, 'blog_page_title', 'Blog page title'),
(481, 'blog_page_subtitle', 'Blog page subtitle'),
(482, 'instructors_blog_permission', 'Instructors blog permission'),
(483, 'blog_visibility_on_the_home_page', 'Blog visibility on the home page'),
(484, 'visible', 'Visible'),
(485, 'invisible', 'Invisible'),
(486, 'blog_page_banner', 'Blog page banner'),
(487, 'addon_manager', 'Addon manager'),
(488, 'buy_new_addon', 'Buy new addon'),
(489, 'install_addon', 'Install addon'),
(490, 'installed_addons', 'Installed addons'),
(491, 'available_addons', 'Available addons'),
(492, 'name', 'Name'),
(493, 'version', 'Version'),
(494, 'add_addon', 'Add addon'),
(495, 'install_an_addon', 'Install an addon'),
(496, 'back_to_addon_list', 'Back to addon list'),
(497, 'upload_addon_file', 'Upload addon file'),
(498, 'zip_file', 'Zip file'),
(499, 'back', 'Back'),
(500, 'filter', 'Filter'),
(501, 'enrolled_course', 'Enrolled course'),
(502, 'total_amount', 'Total amount'),
(503, 'enrolment_date', 'Enrolment date'),
(504, 'instructor', 'Instructor'),
(505, 'user', 'User'),
(506, 'course', 'Course'),
(507, 'paid_amount', 'Paid amount'),
(508, 'payment_method', 'Payment method'),
(509, 'purchased_date', 'Purchased date'),
(510, 'add_admin', 'Add admin'),
(511, 'root_admin', 'Root admin'),
(512, 'admin_add', 'Admin add'),
(513, 'back_to_admins', 'Back to admins'),
(514, 'admin_add_form', 'Admin add form'),
(515, 'login_credentials', 'Login credentials'),
(516, 'social_information', 'Social information'),
(517, 'finish', 'Finish'),
(518, 'user_image', 'User image'),
(519, 'choose_user_image', 'Choose user image'),
(520, 'thank_you', 'Thank you'),
(521, 'you_are_just_one_click_away', 'You are just one click away'),
(522, 'add_instructor', 'Add instructor'),
(523, 'enrolled_courses', 'Enrolled courses'),
(524, 'instructor_add', 'Instructor add'),
(525, 'instructor_add_form', 'Instructor add form'),
(526, 'payment_info', 'Payment info'),
(527, 'paypal', 'Paypal'),
(528, 'required_for_instructor', 'Required for instructor'),
(529, 'stripe', 'Stripe'),
(530, 'razorpay', 'Razorpay'),
(531, 'instructor_payouts', 'Instructor payouts'),
(532, 'list_of_payouts', 'List of payouts'),
(533, 'completed_payouts', 'Completed payouts'),
(534, 'pending_payouts', 'Pending payouts'),
(535, 'payout_amount', 'Payout amount'),
(536, 'payment_type', 'Payment type'),
(537, 'payout_date', 'Payout date'),
(538, 'public_instructor_settings', 'Public instructor settings'),
(539, 'allow_public_instructor', 'Allow public instructor'),
(540, 'instructor_application_note', 'Instructor application note'),
(541, 'instructor_commission_settings', 'Instructor commission settings'),
(542, 'instructor_revenue_percentage', 'Instructor revenue percentage'),
(543, 'admin_revenue_percentage', 'Admin revenue percentage'),
(544, 'instructor_application', 'Instructor application'),
(545, 'instructor_applications', 'Instructor applications'),
(546, 'list_of_applications', 'List of applications'),
(547, 'pending_applications', 'Pending applications'),
(548, 'approved_applications', 'Approved applications'),
(549, 'document', 'Document'),
(550, 'details', 'Details'),
(551, 'student', 'Student'),
(552, 'student_add', 'Student add'),
(553, 'student_add_form', 'Student add form'),
(554, 'email_duplication', 'Email duplication'),
(555, 'user_added_successfully', 'User added successfully'),
(556, 'edit', 'Edit'),
(557, 'contact_users', 'Contact users'),
(558, 'theme_settings', 'Theme settings'),
(559, 'upcoming_courses', 'Upcoming courses'),
(560, 'free_courses', 'Free courses'),
(561, 'paid_courses', 'Paid courses'),
(562, 'course_list', 'Course list'),
(563, 'pending', 'Pending'),
(564, 'private', 'Private'),
(565, 'upcoming', 'Upcoming'),
(566, 'lesson_and_section', 'Lesson and section'),
(567, 'enrolled_student', 'Enrolled student'),
(568, 'course_adding_form', 'Course adding form'),
(569, 'back_to_course_list', 'Back to course list'),
(570, 'basic', 'Basic'),
(571, 'info', 'Info'),
(572, 'pricing', 'Pricing'),
(573, 'media', 'Media'),
(574, 'seo', 'Seo'),
(575, 'course_title', 'Course title'),
(576, 'enter_course_title', 'Enter course title'),
(577, 'short_description', 'Short description'),
(578, 'select_sub_category', 'Select sub category'),
(579, 'language_made_in', 'Language made in'),
(580, 'enable_drip_content', 'Enable drip content'),
(581, 'create_as_a', 'Create as a'),
(582, 'private_course', 'Private course'),
(583, 'upcoming_course', 'Upcoming course'),
(584, 'check_if_this_course_is_top_course', 'Check if this course is top course'),
(585, 'course_faq', 'Course faq'),
(586, 'requirements', 'Requirements'),
(587, 'provide_requirements', 'Provide requirements'),
(588, 'outcomes', 'Outcomes'),
(589, 'provide_outcomes', 'Provide outcomes'),
(590, 'check_if_this_is_a_free_course', 'Check if this is a free course'),
(591, 'course_price', 'Course price'),
(592, 'enter_course_course_price', 'Enter course course price'),
(593, 'check_if_this_course_has_discount', 'Check if this course has discount'),
(594, 'discounted_price', 'Discounted price'),
(595, 'this_course_has', 'This course has'),
(596, 'discount', 'Discount'),
(597, 'expiry_period', 'Expiry period'),
(598, 'lifetime', 'Lifetime'),
(599, 'limited_time', 'Limited time'),
(600, 'number_of_month', 'Number of month'),
(601, 'after_purchase,_students_can_access_the_course_until_your_selected_time.', 'After purchase, students can access the course until your selected time.'),
(602, 'course_overview_provider', 'Course overview provider'),
(603, 'youtube', 'Youtube'),
(604, 'vimeo', 'Vimeo'),
(605, 'html5', 'Html5'),
(606, 'course_overview_url', 'Course overview url'),
(607, 'course_thumbnail', 'Course thumbnail'),
(608, 'meta_keywords', 'Meta keywords'),
(609, 'write_a_keyword_and_then_press_enter_button', 'Write a keyword and then press enter button'),
(610, 'meta_description', 'Meta description'),
(611, 'add_category', 'Add category'),
(612, 'category_add_form', 'Category add form'),
(613, 'category_code', 'Category code'),
(614, 'category_title', 'Category title'),
(615, 'parent', 'Parent'),
(616, 'none', 'None'),
(617, 'select_none_to_create_a_parent_category', 'Select none to create a parent category'),
(618, 'icon_picker', 'Icon picker'),
(619, 'category_thumbnail', 'Category thumbnail'),
(620, 'the_image_size_should_be', 'The image size should be'),
(621, 'choose_thumbnail', 'Choose thumbnail'),
(622, 'add_new_coupon', 'Add new coupon'),
(623, 'coupon_code', 'Coupon code'),
(624, 'discount_percentage', 'Discount percentage'),
(625, 'validity_till', 'Validity till'),
(626, 'course_enrolment', 'Course enrolment'),
(627, 'enrolment_form', 'Enrolment form'),
(628, 'course_to_enrol', 'Course to enrol'),
(629, 'select_a_course', 'Select a course'),
(630, 'student_has_been_enrolled', 'Student has been enrolled'),
(631, 'enrol_histories', 'Enrol histories'),
(632, 'no_data_found', 'No data found'),
(633, 'my_course', 'My course'),
(634, 'you_have_no_items_in_your_wishlist!', 'You have no items in your wishlist!'),
(635, 'go_to_wishlist', 'Go to wishlist'),
(636, 'my_courses', 'My courses'),
(637, 'my_wishlist', 'My wishlist'),
(638, 'my_messages', 'My messages'),
(639, 'user_profile', 'User profile'),
(640, 'wishlist', 'Wishlist'),
(641, 'messages', 'Messages'),
(642, 'profile', 'Profile'),
(643, 'account_credentials', 'Account credentials'),
(644, 'new_message', 'New message'),
(645, 'select_a_user', 'Select a user'),
(646, 'write_your_message', 'Write your message'),
(647, 'send', 'Send'),
(648, 'message_sent', 'Message sent'),
(649, 'year', 'Year'),
(650, 'month', 'Month'),
(651, 'day', 'Day'),
(652, 'hour', 'Hour'),
(653, 'minute', 'Minute'),
(654, 'second', 'Second'),
(655, 'ago', 'Ago'),
(656, 'purchased_courses', 'Purchased courses'),
(657, 'invoice', 'Invoice'),
(658, 'profile_photo', 'Profile photo'),
(659, 'update_your_profile_photo_and_personal_details', 'Update your profile photo and personal details'),
(660, 'upload_photo', 'Upload photo'),
(661, 'profile_info', 'Profile info'),
(662, 'add_your_twitter_link', 'Add your twitter link'),
(663, 'add_your_facebook_link', 'Add your facebook link'),
(664, 'add_your_linkedin_link', 'Add your linkedin link'),
(665, 'credentials', 'Credentials'),
(666, 'account_information', 'Account information'),
(667, 'enter_current_password', 'Enter current password'),
(668, 'enter_new_password', 'Enter new password'),
(669, 'confirm_password', 'Confirm password'),
(670, 're-type_your_password', 'Re-type your password'),
(671, 'shopping_cart', 'Shopping cart'),
(672, 'your_cart_items', 'Your cart items'),
(673, 'items', 'Items'),
(674, 'total', 'Total'),
(675, 'subtotal', 'Subtotal'),
(676, 'apply_coupon', 'Apply coupon'),
(677, 'apply', 'Apply'),
(678, 'send_as_a_gift', 'Send as a gift'),
(679, 'email_address', 'Email address'),
(680, 'continue_to_payment', 'Continue to payment'),
(681, 'searching', 'Searching'),
(682, 'new_home_page_layout_has_been_activated', 'New home page layout has been activated'),
(683, 'we_provides_you_world_class_performance', 'We provides you world class performance'),
(684, 'select_lesson_type', 'Select lesson type'),
(685, 'video', 'Video'),
(686, 'secured', 'Secured'),
(687, 'video_file', 'Video file'),
(688, 'video_url', 'Video url'),
(689, 'google_drive_video', 'Google drive video'),
(690, 'document_file', 'Document file'),
(691, 'text', 'Text'),
(692, 'image_file', 'Image file'),
(693, 'iframe_embed', 'Iframe embed'),
(694, 'next', 'Next'),
(695, 'please_select_a_course', 'Please select a course'),
(696, 'data_added_successfully', 'Data added successfully'),
(697, 'sub_categories', 'Sub categories'),
(698, 'private_messaging', 'Private messaging'),
(699, 'private_message', 'Private message'),
(700, 'choose_an_option_from_the_left_side', 'Choose an option from the left side'),
(701, 'please_enter_your_messsage', 'Please enter your messsage'),
(702, 'sent_message', 'Sent message'),
(703, 'write_new_messages', 'Write new messages'),
(704, 'recipient', 'Recipient'),
(705, 'type_your_message', 'Type your message'),
(706, 'newsletters', 'Newsletters'),
(707, 'newsletter_template', 'Newsletter template'),
(708, 'there_are_no_courses_on_your_cart', 'There are no courses on your cart'),
(709, 'your_phone', 'Your phone'),
(710, 'enter_your_phone_number', 'Enter your phone number'),
(711, 'provide_some_documents_about_your_qualifications', 'Provide some documents about your qualifications'),
(712, 'you_have_successfully_submitted_your_application.', 'You have successfully submitted your application.'),
(713, 'we_will_review_it_and_notify_you_via_email_notification', 'We will review it and notify you via email notification'),
(714, 'your_application', 'Your application'),
(715, 'applicant_details', 'Applicant details'),
(716, 'application_details', 'Application details'),
(717, 'download', 'Download'),
(718, 'applicant', 'Applicant'),
(719, 'user_update_successfully', 'User update successfully'),
(720, 'updated_successfully', 'Updated successfully'),
(721, 'thanks_for_subscribing_to_our_newsletter', 'Thanks for subscribing to our newsletter');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `cloud_video_id` int(20) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `lesson_type` varchar(255) DEFAULT NULL,
  `attachment` longtext DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `is_free` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `quiz_attempt` int(11) NOT NULL DEFAULT 0,
  `video_type_for_mobile_application` varchar(255) DEFAULT NULL,
  `video_url_for_mobile_application` varchar(255) DEFAULT NULL,
  `duration_for_mobile_application` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `from` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `sender` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `message_thread_code`, `message`, `sender`, `timestamp`, `read_status`) VALUES
(1, 'b33fb737159be73', 'rr', '2', '1705562817', 1),
(2, 'b33fb737159be73', 'testing', '1', '1705939883', 0);

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext DEFAULT NULL,
  `sender` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `last_message_timestamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_thread`
--

INSERT INTO `message_thread` (`message_thread_id`, `message_thread_code`, `sender`, `receiver`, `last_message_timestamp`) VALUES
(1, 'b33fb737159be73', '2', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscriber`
--

CREATE TABLE `newsletter_subscriber` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `newsletter_subscriber`
--

INSERT INTO `newsletter_subscriber` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'test@gmail.com', '1705940459', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `from_user` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_editable` int(11) DEFAULT NULL,
  `addon_identifier` varchar(255) DEFAULT NULL,
  `user_types` varchar(400) DEFAULT NULL,
  `system_notification` varchar(400) DEFAULT NULL,
  `email_notification` varchar(400) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `template` longtext DEFAULT NULL,
  `setting_title` varchar(255) DEFAULT NULL,
  `setting_sub_title` varchar(255) DEFAULT NULL,
  `date_updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `type`, `is_editable`, `addon_identifier`, `user_types`, `system_notification`, `email_notification`, `subject`, `template`, `setting_title`, `setting_sub_title`, `date_updated`) VALUES
(1, 'signup', 1, NULL, '[\"admin\",\"user\"]', '{\"admin\":\"1\",\"user\":\"1\"}', '{\"admin\":\"0\",\"user\":\"0\"}', '{\"admin\":\"New user registered\",\"user\":\"Registered successfully\"}', '{\"admin\":\"New user registered [user_name] \\r\\n<br>User email: <b>[user_email]<\\/b>\",\"user\":\"You have successfully registered with us at [system_name].\"}', 'New user registration', 'Get notified when a new user signs up', '1693215071'),
(2, 'email_verification', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Email verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [email_verification_code]\"}', 'Email verification', 'It is permanently enabled for student email verification.', '1684135777'),
(3, 'forget_password_mail', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Forgot password verification code\"}', '{\"user\":\"You have received a email verification code. Your verification code is [system_name][verification_link][minutes]\"}', 'Forgot password mail', 'It is permanently enabled for student email verification.', '1684145383'),
(4, 'new_device_login_confirmation', 0, NULL, '[\"user\"]', '{\"user\":\"0\"}', '{\"user\":\"1\"}', '{\"user\":\"Please confirm your login\"}', '{\"user\":\"Have you tried logging in with a different device? Confirm using the verification code. Your verification code is [verification_code]. Remember that you will lose access to your previous device after logging in to the new device <b>[user_agent]<\\/b>.<br> Use the verification code within [minutes] minutes\"}', 'Account security alert', 'Send verification code for login from a new device', '1684145383'),
(6, 'course_purchase', 1, NULL, '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course has been sold\",\"instructor\":\"A new course has been sold\",\"student\":\"You have purchased a new course\"}', '{\"admin\":\"<p>Course title: [course_title]<\\/p><p>Student: [student_name]\\r\\n<\\/p><p>Paid amount: [paid_amount]<\\/p><p>Instructor: [instructor_name]<\\/p>\",\"instructor\":\"Course title: [course_title]\\r\\nStudent: [student_name]\\r\\nPaid amount: [paid_amount]\",\"student\":\"Course title: [course_title]\\r\\nPaid amount: [paid_amount]\\r\\nInstructor: [instructor_name]\"}', 'Course purchase notification', 'Stay up-to-date on student course purchases.', '1684303456'),
(7, 'course_completion_mail', 1, NULL, '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Course completion\",\"student\":\"You have completed a new course\"}', '{\"instructor\":\"Course completed [course_title]\\r\\nStudent: [student_name]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\"}', 'Course completion mail', 'Stay up to date on student course completion.', '1684303457'),
(8, 'certificate_eligibility', 1, 'certificate', '[\"student\",\"instructor\"]', '{\"student\":\"1\",\"instructor\":\"1\"}', '{\"student\":\"0\",\"instructor\":\"0\"}', '{\"instructor\":\"Certificate eligibility\",\"student\":\"certificate eligibility\"}', '{\"instructor\":\"Course: [course_title]\\r\\nStudent: [student_name]\\r\\nCertificate link: [certificate_link]\",\"student\":\"Course: [course_title]\\r\\nInstructor: [instructor_name]\\r\\nCertificate link: [certificate_link]\"}', 'Course eligibility notification', 'Stay up to date on course certificate eligibility.', '1684303460'),
(9, 'offline_payment_suspended_mail', 1, 'offline_payment', '[\"student\"]', '{\"student\":\"1\"}', '{\"student\":\"0\"}', '{\"student\":\"Your payment has been suspended\"}', '{\"student\":\"<p>Your offline payment has been <b style=\'color: red;\'>suspended</b> !</p><p>Please provide a valid document of your payment.</p>\"}', 'Offline payment suspended mail', 'If students provides fake information, notify them of the suspension', '1684303463'),
(10, 'bundle_purchase', 1, 'course_bundle', '[\"admin\",\"student\",\"instructor\"]', '{\"admin\":\"1\",\"student\":\"1\",\"instructor\":\"1\"}', '{\"admin\":\"0\",\"student\":\"0\",\"instructor\":\"0\"}', '{\"admin\":\"A new course bundle has been sold \",\"instructor\":\"A new course bundle has been sold \",\"student\":\"You have purchased a new course bundle test\"}', '{\"admin\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name]\\r\\nInstructor: [instructor_name] \",\"instructor\":\"Course bundle: [bundle_title]\\r\\nStudent: [student_name] \",\"student\":\"Course bundle: [bundle_title]\\r\\nInstructor: [instructor_name] \"}', 'Course bundle purchase notification', 'Stay up-to-date on student course bundle purchases.', '1684303467'),
(13, 'add_new_user_as_affiliator', 0, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"Congratulation ! You are assigned as an affiliator\"}', '{\"affiliator\":\"You are assigned as a website Affiliator.\\r\\nWebsite: [website_link]\\r\\n<br>\\r\\nPassword: [password]\"}', 'New user added as affiliator', 'Send account information to the new user', '1684135777'),
(14, 'affiliator_approval_notification', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', '{\"affiliator\":\"Congratulations! Your affiliate request has been approved\"}', 'Affiliate approval notification', 'Send affiliate approval mail to the user account', '1684303472'),
(15, 'affiliator_request_cancellation', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused\"}', '{\"affiliator\":\"Sorry ! Your request has been currently refused.\"}', 'Affiliator request cancellation', 'Send mail, when you cancel the affiliation request', '1684303473'),
(16, 'affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"admin\",\"affiliator\"]', '{\"admin\":\"1\",\"affiliator\":\"1\"}', '{\"admin\":\"0\",\"affiliator\":\"0\"}', '{\"admin\":\"New money withdrawal request\",\"affiliator\":\"New money withdrawal request\"}', '{\"admin\":\"New money withdrawal request by [\'user_name] [amount]\",\"affiliator\":\"Your Withdrawal request of [amount] has been sent to authority\"}', 'Affiliation money withdrawal request', 'Send mail, when the users request the withdrawal of money', '1684303476'),
(17, 'approval_affiliation_amount_withdrawal_request', 1, 'affiliate_course', '[\"affiliator\"]', '{\"affiliator\":\"1\"}', '{\"affiliator\":\"0\"}', '{\"affiliator\":\"Congartulation ! Your withdrawal request has been approved\"}', '{\"affiliator\":\"Congartulation ! Your payment request has been approved.\"}', 'Approval of withdrawal request of affiliation', 'Send mail, when you approved the affiliation withdrawal request', '1684303480'),
(18, 'course_gift', 1, NULL, '[\"payer\",\"receiver\"]', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"1\",\"receiver\":\"1\"}', '{\"payer\":\"You have gift a course\",\"receiver\":\"You have received a course gift\"}', '{\"payer\":\"You have gift a course to [user_name] [course_title][instructor]\",\"receiver\":\"You have received a course gift by [payer][course_title][instructor]\"}', 'Course gift notification', 'Notify users after course gift', '1691818623');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `admin_revenue` varchar(255) DEFAULT NULL,
  `instructor_revenue` varchar(255) DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `instructor_payment_status` int(11) DEFAULT 0,
  `transaction_id` varchar(255) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `coupon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `currency` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keys` text NOT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `enabled_test_mode` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_addon` int(11) NOT NULL,
  `created_at` varchar(100) NOT NULL,
  `updated_at` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `identifier`, `currency`, `title`, `description`, `keys`, `model_name`, `enabled_test_mode`, `status`, `is_addon`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'USD', 'Paypal', '', '{\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}', 'Payment_model', 1, 1, 0, '', '1673263724'),
(2, 'stripe', 'USD', 'Stripe', '', '{\"public_key\":\"pk_test_CAC3cB1mhgkJqXtypYBTGb4f\",\"secret_key\":\"sk_test_iatnshcHhQVRXdygXw3L2Pp2\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}', 'Payment_model', 1, 1, 0, '', '1673263724'),
(3, 'razorpay', 'USD', 'Razorpay', '', '{\"key_id\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\",\"theme_color\":\"#23d792\"}', 'Payment_model', 1, 1, 0, '', '1673264610');

-- --------------------------------------------------------

--
-- Table structure for table `payout`
--

CREATE TABLE `payout` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `permissions` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) UNSIGNED NOT NULL,
  `quiz_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `number_of_options` int(11) DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `correct_answers` longtext DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_results`
--

CREATE TABLE `quiz_results` (
  `quiz_result_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_answers` longtext NOT NULL,
  `correct_answers` longtext NOT NULL COMMENT 'question_id',
  `total_obtained_marks` double NOT NULL,
  `date_added` varchar(100) NOT NULL,
  `date_updated` varchar(100) NOT NULL,
  `is_submitted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) UNSIGNED NOT NULL,
  `rating` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ratable_id` int(11) DEFAULT NULL,
  `ratable_type` varchar(50) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `review` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `date_added`, `last_modified`) VALUES
(1, 'Admin', 1234567890, 1234567890),
(2, 'User', 1234567890, 1234567890);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'language', 'english'),
(2, 'system_name', 'PCLearning'),
(3, 'system_title', 'Academy Learning Club'),
(4, 'system_email', 'academy@example.com'),
(5, 'address', 'Sydney, Australia'),
(6, 'phone', '+143-52-9933631'),
(7, 'purchase_code', 'your-purchase-code'),
(8, 'paypal', '[{\"active\":\"1\",\"mode\":\"sandbox\",\"sandbox_client_id\":\"AfGaziKslex-scLAyYdDYXNFaz2aL5qGau-SbDgE_D2E80D3AFauLagP8e0kCq9au7W4IasmFbirUUYc\",\"sandbox_secret_key\":\"EMa5pCTuOpmHkhHaCGibGhVUcKg0yt5-C3CzJw-OWJCzaXXzTlyD17SICob_BkfM_0Nlk7TWnN42cbGz\",\"production_client_id\":\"1234\",\"production_secret_key\":\"12345\"}]'),
(9, 'stripe_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"public_key\":\"pk_test_CAC3cB1mhgkJqXtypYBTGb4f\",\"secret_key\":\"sk_test_iatnshcHhQVRXdygXw3L2Pp2\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}]'),
(10, 'youtube_api_key', 'api-key-for-youtube-and-google-drive'),
(11, 'vimeo_api_key', 'vimeo-api-key'),
(12, 'slogan', 'A course based video CMS'),
(13, 'text_align', NULL),
(14, 'allow_instructor', '1'),
(15, 'instructor_revenue', '70'),
(16, 'system_currency', 'USD'),
(17, 'paypal_currency', 'USD'),
(18, 'stripe_currency', 'USD'),
(19, 'author', 'Creativeitem'),
(20, 'currency_position', 'left'),
(21, 'website_description', 'Study any topic, anytime. explore thousands of courses for the lowest price ever!'),
(22, 'website_keywords', 'LMS,Learning Management System,Creativeitem,Academy LMS'),
(23, 'footer_text', 'Creativeitem'),
(24, 'footer_link', 'https://creativeitem.com/'),
(25, 'protocol', 'smtp'),
(26, 'smtp_host', 'smtp.gmail.com'),
(27, 'smtp_port', '587'),
(28, 'smtp_user', 'your-email-address'),
(29, 'smtp_pass', 'SMTP-password'),
(30, 'version', '6.2'),
(31, 'student_email_verification', 'disable'),
(32, 'instructor_application_note', 'Fill all the fields carefully and share if you want to share any document with us it will help us to evaluate you as an instructor.'),
(33, 'razorpay_keys', '[{\"active\":\"1\",\"key\":\"rzp_test_J60bqBOi1z1aF5\",\"secret_key\":\"uk935K7p4j96UCJgHK8kAU4q\",\"theme_color\":\"#c7a600\"}]'),
(34, 'razorpay_currency', 'USD'),
(35, 'fb_app_id', 'fb-app-id'),
(36, 'fb_app_secret', 'fb-app-secret'),
(37, 'fb_social_login', '0'),
(38, 'drip_content_settings', '{\"lesson_completion_role\":\"percentage\",\"minimum_duration\":15,\"minimum_percentage\":\"50\",\"locked_lesson_message\":\"&lt;h3 xss=&quot;removed&quot; style=&quot;text-align: center; &quot;&gt;&lt;span xss=&quot;removed&quot;&gt;&lt;strong&gt;Permission denied!&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/h3&gt;&lt;p xss=&quot;removed&quot; style=&quot;text-align: center; &quot;&gt;&lt;span xss=&quot;removed&quot;&gt;This course supports drip content, so you must complete the previous lessons.&lt;\\/span&gt;&lt;\\/p&gt;\"}'),
(41, 'course_accessibility', 'publicly'),
(42, 'smtp_crypto', 'tls'),
(43, 'allowed_device_number_of_loging', '5'),
(47, 'academy_cloud_access_token', 'jdfghasdfasdfasdfasdfasdf'),
(48, 'course_selling_tax', '0'),
(49, 'ccavenue_keys', '[{\"active\":\"1\",\"ccavenue_merchant_id\":\"cmi_xxxxxx\",\"ccavenue_working_key\":\"cwk_xxxxxxxxxxxx\",\"ccavenue_access_code\":\"ccc_xxxxxxxxxxxxx\"}]'),
(50, 'ccavenue_currency', 'INR'),
(51, 'iyzico_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"iyzico_currency\":\"TRY\",\"api_test_key\":\"atk_xxxxxxxx\",\"secret_test_key\":\"stk_xxxxxxxx\",\"api_live_key\":\"alk_xxxxxxxx\",\"secret_live_key\":\"slk_xxxxxxxx\"}]'),
(52, 'iyzico_currency', 'TRY'),
(53, 'paystack_keys', '[{\"active\":\"1\",\"testmode\":\"on\",\"secret_test_key\":\"sk_test_c746060e693dd50c6f397dffc6c3b2f655217c94\",\"public_test_key\":\"pk_test_0816abbed3c339b8473ff22f970c7da1c78cbe1b\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxx\"}]'),
(54, 'paystack_currency', 'NGN'),
(55, 'paytm_keys', '[{\"PAYTM_MERCHANT_KEY\":\"PAYTM_MERCHANT_KEY\",\"PAYTM_MERCHANT_MID\":\"PAYTM_MERCHANT_MID\",\"PAYTM_MERCHANT_WEBSITE\":\"DEFAULT\",\"INDUSTRY_TYPE_ID\":\"Retail\",\"CHANNEL_ID\":\"WEB\"}]'),
(57, 'google_analytics_id', ''),
(58, 'meta_pixel_id', ''),
(59, 'smtp_from_email', 'your-email-address'),
(61, 'language_dirs', '{\"english\":\"ltr\",\"hindi\":\"rtl\",\"arabic\":\"rtl\"}');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tagable_id` int(11) DEFAULT NULL,
  `tagable_type` varchar(255) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `skills` longtext NOT NULL,
  `social_links` longtext DEFAULT NULL,
  `biography` longtext DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `date_added` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `wishlist` longtext DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `payment_keys` longtext NOT NULL,
  `verification_code` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_instructor` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `sessions` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `password`, `skills`, `social_links`, `biography`, `role_id`, `date_added`, `last_modified`, `wishlist`, `title`, `payment_keys`, `verification_code`, `status`, `is_instructor`, `image`, `sessions`) VALUES
(1, 'pandit', 'programmer', 'panditprogrammer@test.com', NULL, NULL, '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', NULL, 1, NULL, NULL, NULL, NULL, '', NULL, 1, 1, NULL, ''),
(2, 'Chandan', 'Kumar', 'panditprogrammer@test.co', '+18340460297', 'Shahpur, Ara', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', '', 2, 1705562217, NULL, '[]', NULL, '{\"paypal\":{\"sandbox_client_id\":\"\",\"sandbox_secret_key\":\"\",\"production_client_id\":\"\",\"production_secret_key\":\"\"},\"stripe\":{\"public_key\":\"\",\"secret_key\":\"\",\"public_live_key\":\"\",\"secret_live_key\":\"\"},\"razorpay\":{\"key_id\":\"\",\"secret_key\":\"\",\"theme_color\":\"\"}}', NULL, 1, 0, '9f5d3ddf3e12056cd334e1b2fc9ff0d4', '[]'),
(3, 'Chandan', 'Pandit', 'chandankumaracp@gmail.com', '08340460297', 'Shahpur, Ara', '7c222fb2927d828af22f592134e8932480637c0d', '', '{\"facebook\":\"\",\"twitter\":\"\",\"linkedin\":\"\"}', '<p>dfd</p>', 2, 1705940231, NULL, '[]', NULL, '{\"paypal\":{\"sandbox_client_id\":\"\",\"sandbox_secret_key\":\"\",\"production_client_id\":\"\",\"production_secret_key\":\"\"},\"stripe\":{\"public_key\":\"\",\"secret_key\":\"\",\"public_live_key\":\"\",\"secret_live_key\":\"\"},\"razorpay\":{\"key_id\":\"\",\"secret_key\":\"\",\"theme_color\":\"\"}}', NULL, 1, 0, '4d44fa1bfec62e6eaa9cf1da0bad5dae', '[\"vm2b71g66j3fqbla2i51t1pg6d6ns365\"]');

-- --------------------------------------------------------

--
-- Table structure for table `watched_duration`
--

CREATE TABLE `watched_duration` (
  `watched_id` int(11) UNSIGNED NOT NULL,
  `watched_student_id` int(11) DEFAULT NULL,
  `watched_course_id` int(11) DEFAULT NULL,
  `watched_lesson_id` int(11) DEFAULT NULL,
  `current_duration` int(20) DEFAULT NULL,
  `watched_counter` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `watch_histories`
--

CREATE TABLE `watch_histories` (
  `watch_history_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `completed_lesson` longtext NOT NULL,
  `course_progress` int(11) NOT NULL,
  `watching_lesson_id` int(11) NOT NULL,
  `quiz_result` longtext NOT NULL,
  `completed_date` varchar(255) DEFAULT NULL,
  `date_added` varchar(100) DEFAULT NULL,
  `date_updated` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`blog_comment_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_page`
--
ALTER TABLE `custom_page`
  ADD PRIMARY KEY (`custom_page_id`);

--
-- Indexes for table `enrol`
--
ALTER TABLE `enrol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout`
--
ALTER TABLE `payout`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_results`
--
ALTER TABLE `quiz_results`
  ADD PRIMARY KEY (`quiz_result_id`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `watched_duration`
--
ALTER TABLE `watched_duration`
  ADD PRIMARY KEY (`watched_id`);

--
-- Indexes for table `watch_histories`
--
ALTER TABLE `watch_histories`
  ADD PRIMARY KEY (`watch_history_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `custom_page`
--
ALTER TABLE `custom_page`
  MODIFY `custom_page_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrol`
--
ALTER TABLE `enrol`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscriber`
--
ALTER TABLE `newsletter_subscriber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payout`
--
ALTER TABLE `payout`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_results`
--
ALTER TABLE `quiz_results`
  MODIFY `quiz_result_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `watched_duration`
--
ALTER TABLE `watched_duration`
  MODIFY `watched_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `watch_histories`
--
ALTER TABLE `watch_histories`
  MODIFY `watch_history_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
