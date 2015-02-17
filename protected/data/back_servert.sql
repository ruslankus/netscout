-- phpMyAdmin SQL Dump
-- version 4.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 17, 2015 at 01:10 PM
-- Server version: 10.0.16-MariaDB-log
-- PHP Version: 5.4.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `netscout_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL,
  `login` longtext,
  `f_name` longtext,
  `l_name` longtext,
  `password` longtext,
  `full_key` longtext
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `login`, `f_name`, `l_name`, `password`, `full_key`) VALUES
(1, 'admin', 'Ruslan', 'Kiricenko', '$1$RqKEqHop$vCl3yT/Oa7lynh8gtg4eo0', 'YAW4-KISJ-QP7S'),
(2, 'viqtor', 'Viqtor', 'Creed', '$1$GXzAAmaN$qmFwuvaYgKjt13loJQFpm0', '6R3L-2SXH-33ZB'),
(3, 'user', 'User', 'Demo', '$1$IOg3jSyO$/6DmP19eLufqWYJjeHUVx/', 'YAW4-KISJ-QP7S'),
(4, 'pb', 'Pablo', 'Escobar', '$1$anutrUbh$vcflSmPi.HgpBHlXCcZhh0', '1HW7-K1BR-895L');

-- --------------------------------------------------------

--
-- Table structure for table `datacentres`
--

CREATE TABLE IF NOT EXISTS `datacentres` (
  `id` int(11) NOT NULL,
  `datacenter_name` varchar(30) DEFAULT NULL,
  `ip_address` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `datacentres`
--

INSERT INTO `datacentres` (`id`, `datacenter_name`, `ip_address`) VALUES
(9, 'Test Dc', '88.119.151.3'),
(10, 'Demo Dc', '88.119.151.3'),
(11, 'Test', '88.119.151.3'),
(12, 'b', '212.111.111.111');

-- --------------------------------------------------------

--
-- Table structure for table `dc_user`
--

CREATE TABLE IF NOT EXISTS `dc_user` (
  `id` int(11) NOT NULL,
  `dc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dc_user`
--

INSERT INTO `dc_user` (`id`, `dc_id`, `user_id`) VALUES
(6, 9, 1),
(7, 10, 3),
(8, 11, 2),
(9, 12, 4);

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `id` int(11) NOT NULL,
  `label` longtext
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `label`) VALUES
(1, 'login'),
(2, 'password'),
(3, 'main'),
(4, 'about_us'),
(5, 'about_product'),
(6, 'contacts'),
(7, 'account'),
(8, 'your_account'),
(9, 'data_center'),
(10, 'download'),
(11, 'add'),
(12, 'download_licence');

-- --------------------------------------------------------

--
-- Table structure for table `labels_trl`
--

CREATE TABLE IF NOT EXISTS `labels_trl` (
  `id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `value` longtext
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `labels_trl`
--

INSERT INTO `labels_trl` (`id`, `label_id`, `language_id`, `value`) VALUES
(1, 1, 1, 'Login'),
(2, 1, 2, 'Login'),
(3, 2, 1, 'Password'),
(4, 2, 2, 'Slaptazodis'),
(5, 3, 1, 'Main'),
(6, 3, 2, 'Pagrindinis'),
(7, 4, 1, 'About us'),
(8, 4, 2, 'Apie mus'),
(9, 5, 1, 'Products'),
(10, 5, 2, 'Produktai'),
(11, 6, 1, 'Contacts'),
(12, 6, 2, 'Kontaktai'),
(13, 7, 1, 'Account'),
(14, 7, 2, 'Prisijungimas'),
(15, 8, 1, 'Your account'),
(16, 8, 2, 'Jūsų paskyra'),
(17, 9, 1, 'Data centres'),
(18, 9, 2, 'Duomenų centras'),
(19, 10, 1, 'Download'),
(20, 10, 2, 'Parsisiųsti'),
(21, 11, 1, 'Add'),
(22, 11, 2, 'Pridėti'),
(23, 12, 1, 'Download licence'),
(24, 12, 2, 'Parsisiųskite licenziją');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL,
  `lng_name` longtext NOT NULL,
  `lng_prefix` longtext NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lng_name`, `lng_prefix`) VALUES
(1, 'English', 'en'),
(2, 'Lietuviu', 'lt');

-- --------------------------------------------------------

--
-- Table structure for table `license_types`
--

CREATE TABLE IF NOT EXISTS `license_types` (
  `id` int(11) NOT NULL,
  `part_number` varchar(25) DEFAULT NULL,
  `decription` varchar(255) DEFAULT NULL,
  `user_limit` tinyint(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `license_types`
--

INSERT INTO `license_types` (`id`, `part_number`, `decription`, `user_limit`, `comment`) VALUES
(1, 'NET02-01LGT0010-00001', 'Netscout Server Monitoring Tool', 10, 'Light Edition limited to 10 Users'),
(2, 'NET02-01LGT0050-00002', 'Netscout Server Monitoring Tool', 50, 'Light Edition limited to 50 Users'),
(3, 'NET02-01LGT0100-00003', 'Netscout Server Monitoring Tool', 100, 'Light Edition limited to 100 Users'),
(4, 'NET02-01STD0010-00004', 'Netscout Server Monitoring Tool', 10, 'Standard Edition limited to 10 Users'),
(5, 'NET02-01STD0050-00005', 'Netscout Server Monitoring Tool', 50, 'Standard Edition limited to 50 Users'),
(6, 'NET02-01STD0100-00006', 'Netscout Server Monitoring Tool', 100, 'StandardEdition limited to 100 Users'),
(7, 'NET02-01PRF0010-00007', 'Netscout Server Monitoring Tool', 10, 'Professional Edition limited to 10 Users'),
(8, 'NET02-01PRF0050-00008', 'Netscout Server Monitoring Tool', 50, 'Professional Edition limited to 50 Users'),
(9, 'NET02-01PRF0100-00009', 'Netscout Server Monitoring Tool', 100, 'Professional Edition limited to 100 Users'),
(10, 'NET02-TESTKEY-00000', 'Netscout Server Monitoring Tool', 127, 'Testing Key Unlimited');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL,
  `label` longtext,
  `route` longtext
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label`, `route`) VALUES
(1, 'main', NULL),
(2, 'about_us', NULL),
(3, 'about_product', NULL),
(4, 'contacts', NULL),
(5, 'account', 'service');

-- --------------------------------------------------------

--
-- Table structure for table `numbers`
--

CREATE TABLE IF NOT EXISTS `numbers` (
  `id` int(11) NOT NULL,
  `lic_number` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `numbers`
--

INSERT INTO `numbers` (`id`, `lic_number`, `type`, `used`) VALUES
(4, 'URSR-BBJU-JWD1', 1, NULL),
(5, 'KN4E-0B5C-Z4AU', 1, NULL),
(6, '0TWD-9KTX-A3CW', 1, NULL),
(7, '7OEB-LZ9O-J7UV', 1, NULL),
(8, 'N4EF-0XU9-8BHX', 1, NULL),
(9, 'EK6A-3CAX-GWNP', 1, NULL),
(10, 'XK4W-NX7O-S0CG', 1, NULL),
(11, 'KRLV-QGBY-FZKB', 1, NULL),
(12, 'GMS2-Z8YT-R7HL', 1, NULL),
(13, 'YDE1-C069-32RU', 1, NULL),
(14, 'TMU6-3QWF-AJ1Y', 1, NULL),
(15, '81ZG-8PO4-6ITR', 1, NULL),
(16, 'EVGI-RT64-JS3T', 1, NULL),
(17, 'MRUA-D6FS-L1I0', 1, NULL),
(18, 'NT47-EGY1-5GSS', 1, NULL),
(19, 'RX4M-TSBI-N50T', 1, NULL),
(20, 'O6IB-XFHF-S4ZA', 1, NULL),
(21, 'G7AW-YY7J-003Q', 1, NULL),
(22, 'TPSE-VNM1-A3GN', 1, NULL),
(23, 'QTLN-6YYC-9S78', 1, NULL),
(24, 'Z07I-SYI6-YF1X', 1, NULL),
(25, '4TBS-KY9D-4DSN', 1, NULL),
(26, '9LM6-OEYW-6SCF', 1, NULL),
(27, '56Z1-GLDH-DGOX', 1, NULL),
(28, 'SRF2-1ZR7-Z18X', 1, NULL),
(29, 'HOR7-LYRQ-41UZ', 1, NULL),
(30, '7QBG-X404-U0BF', 1, NULL),
(31, '2N1D-8NKE-FBOI', 1, NULL),
(32, '6CQ4-NYM8-EUNC', 1, NULL),
(33, 'J7ND-MVST-YILN', 1, NULL),
(34, '7K88-VZP5-L2FK', 1, NULL),
(35, 'OREZ-TB3I-6MHT', 1, NULL),
(36, 'K00W-4COE-MYXE', 1, NULL),
(37, '9NRI-RTLU-A9FX', 1, NULL),
(38, 'ODQW-0HC4-F3C6', 1, NULL),
(39, 'JNJX-PIZJ-PO8R', 1, NULL),
(40, 'WMHT-5B8E-U8NR', 1, NULL),
(41, 'QC9L-7364-4H13', 1, NULL),
(42, 'TYWP-3HCN-DJI6', 1, NULL),
(43, 'F3YN-MRCU-2JXD', 1, NULL),
(44, 'YEY2-6Y4B-97QX', 1, NULL),
(45, '5UE7-BXF2-Q0HU', 1, NULL),
(46, 'V8TB-P74X-OMFR', 1, NULL),
(47, '616G-WM2P-P1FO', 1, NULL),
(48, 'K39G-UE45-6696', 1, NULL),
(49, 'T9Z6-48UV-GJYE', 1, NULL),
(50, 'N4XK-1IUJ-HOA2', 1, NULL),
(51, 'C0DD-FKO5-3RAM', 1, NULL),
(52, '7KUJ-2GD1-KFJY', 1, NULL),
(53, 'YCF9-YH6N-WG1S', 1, NULL),
(54, 'GZR3-0YOS-722A', 2, NULL),
(55, '6LVM-I7C7-96E2', 2, NULL),
(56, '16CN-F0XN-OTB3', 2, NULL),
(57, '4HVH-GDJO-VC2D', 2, NULL),
(58, 'JTX3-0EAC-9EW6', 2, NULL),
(59, '97FK-6PT4-S7KY', 2, NULL),
(60, '9LLL-D6F6-ATBR', 2, NULL),
(61, 'VS34-R3PE-E49N', 2, NULL),
(62, 'MZCV-F0EP-9NC7', 2, NULL),
(63, 'O2S0-DO57-L8ID', 2, NULL),
(64, '058M-Y8CI-UB5G', 2, NULL),
(65, 'T250-H4MX-QF3V', 2, NULL),
(66, 'VFQ1-Q418-OZ7M', 2, NULL),
(67, 'KYSX-QIVD-N0OQ', 2, NULL),
(68, 'SE1R-YJ7F-KLEL', 2, NULL),
(69, 'M3BL-K669-EEQZ', 2, NULL),
(70, 'LX5J-196B-BJ14', 2, NULL),
(71, 'CDGD-KUMU-ZI9W', 2, NULL),
(72, '1IMC-RFEL-JCTG', 2, NULL),
(73, 'DVKA-R2XX-MKKO', 2, NULL),
(74, 'GGPF-7A3J-E7YT', 2, NULL),
(75, 'YTYL-C5BR-JUUM', 2, NULL),
(76, '0ZO1-R4JD-7GOF', 2, NULL),
(77, 'CHTK-MB4N-0KCZ', 2, NULL),
(78, '1BQF-L6ZC-68AK', 2, NULL),
(79, 'S3EF-UTIS-B0DZ', 2, NULL),
(80, 'QS6U-PNQM-W0HJ', 2, NULL),
(81, 'XG8W-SGOE-4WCK', 2, NULL),
(82, '8J6X-URPM-3FU7', 2, NULL),
(83, 'UV1U-6XB0-WX4X', 2, NULL),
(84, '5QG3-QPQO-UNY7', 2, NULL),
(85, '5XKU-XDJ3-VDD4', 2, NULL),
(86, '7P0I-NRYB-ED36', 2, NULL),
(87, '7W6A-4KWC-G9FM', 2, NULL),
(88, 'Q4DS-8KT3-WKDA', 2, NULL),
(89, 'L3JE-MNLG-31N1', 2, NULL),
(90, 'YFDW-D6FL-LHNV', 2, NULL),
(91, 'WFLT-L49J-S0GT', 2, NULL),
(92, 'D4AV-7ECD-NCQM', 2, NULL),
(93, 'IX94-LAJC-A66K', 2, NULL),
(94, 'JSEK-ANXP-XYUN', 2, NULL),
(95, '47BP-FXZ4-ET4E', 2, NULL),
(96, '32OH-6GXU-O5PF', 2, NULL),
(97, '8XER-XXUS-AXCY', 2, NULL),
(98, 'J3S7-58I3-AHCJ', 2, NULL),
(99, 'JLMZ-S7G6-RGE9', 2, NULL),
(100, 'R6RU-HR05-6AI9', 2, NULL),
(101, 'OVRD-G9MQ-0MA3', 2, NULL),
(102, 'CIIW-W0HX-MRYJ', 2, NULL),
(103, 'U3K0-TPD3-SXT9', 2, NULL),
(106, 'DI6Y-NND4-63QA', 3, NULL),
(107, '421D-19PV-1XJQ', 3, NULL),
(108, 'PQWF-3YMY-U91Q', 3, NULL),
(109, '1X0S-9LXJ-NJJQ', 3, NULL),
(110, 'H8LM-MVAY-ORMS', 3, NULL),
(111, 'VSHP-X9ET-01AQ', 3, NULL),
(112, 'YHOI-WDHR-J46L', 3, NULL),
(113, '5KRL-G0PU-NBXX', 3, NULL),
(114, 'FVYZ-0FPJ-6EOR', 3, NULL),
(115, '3MU6-IFOY-LN3L', 3, NULL),
(116, '4NN9-A98J-TUCH', 3, NULL),
(117, 'W7ZR-AQKD-682Z', 3, NULL),
(118, 'B2NX-3BZO-NG2T', 3, NULL),
(119, 'KEI2-6NEN-C4B9', 3, NULL),
(120, 'FBD5-7640-38Q3', 3, NULL),
(121, 'YER3-0597-8GV7', 3, NULL),
(122, 'WTO9-V494-HYQL', 3, NULL),
(123, '6OMJ-C754-CWES', 3, NULL),
(124, 'QTIA-DL7U-BSR1', 3, NULL),
(125, 'LVXG-HQB1-L1BB', 3, NULL),
(126, '13Q6-EKX5-ROP6', 3, NULL),
(127, 'P3GR-C50T-AHQU', 3, NULL),
(128, 'LBFT-WDG5-8XOW', 3, NULL),
(129, '9MEH-1PIV-6WBJ', 3, NULL),
(130, 'REOG-CZX3-3SXE', 3, NULL),
(131, 'KLWU-LHJJ-AOQL', 3, NULL),
(132, 'OF0I-J7JI-PZTB', 3, NULL),
(133, 'H7Z4-SXLO-XHT5', 3, NULL),
(134, 'QY5B-JRSD-8V90', 3, NULL),
(135, '4ROI-2DMJ-F87C', 3, NULL),
(136, '090M-6Z4L-T965', 3, NULL),
(137, 'P705-5VF3-57EV', 3, NULL),
(138, 'NUNR-3UFN-ITGV', 3, NULL),
(139, 'BVX8-HKJ6-I0KG', 3, NULL),
(140, 'CUPG-G34T-ENFV', 3, NULL),
(141, 'UEMM-Z5WJ-Y32K', 3, NULL),
(142, 'BZJ7-7Z4E-7U5M', 3, NULL),
(143, 'DRIT-CIII-68MI', 3, NULL),
(144, 'QANE-5AJG-9ASS', 3, NULL),
(145, '86BY-U9N0-9EQO', 3, NULL),
(146, '8YYZ-QHF6-2M83', 3, NULL),
(147, 'VDZF-F7PE-M40Q', 3, NULL),
(148, 'RK1N-OHDU-RE1K', 3, NULL),
(149, 'U8QI-8GGX-U2VH', 3, NULL),
(150, 'YJ0F-ETII-LCGW', 3, NULL),
(151, 'B4GB-YNK0-BUEP', 3, NULL),
(152, 'S61L-5O4E-TQPC', 3, NULL),
(153, 'LCD4-T80C-OWOI', 3, NULL),
(154, 'SFD6-BFSO-S05V', 3, NULL),
(155, '4R62-TR34-SLNE', 3, NULL),
(156, 'JE0Q-1QXG-SOLF', 4, NULL),
(157, 'PVQZ-9CLY-GSVP', 4, NULL),
(158, 'R6S1-271D-ZXWI', 4, NULL),
(159, 'BX0S-OAO0-YNKM', 4, NULL),
(160, 'M2WE-O5EP-KAC9', 4, NULL),
(161, '6AQ8-TNNH-HGFA', 4, NULL),
(162, 'N01T-9OU5-28RX', 4, NULL),
(163, 'U296-P0BJ-GGE3', 4, NULL),
(164, '95IF-VJ1N-HD1C', 4, NULL),
(165, 'U2YM-5FQ1-4UUQ', 4, NULL),
(166, '289G-JGRR-1ERL', 4, NULL),
(167, 'ZKE7-4X9A-VXG2', 4, NULL),
(168, '0JKA-Y9O4-I1DC', 4, NULL),
(169, '0DS4-B5G7-SYIT', 4, NULL),
(170, '8NKM-0SOW-Z9GC', 4, NULL),
(171, 'GLZ6-AQV3-V55D', 4, NULL),
(172, 'ZTJP-Z709-Q98U', 4, NULL),
(173, 'JI9L-AUP9-CSN2', 4, NULL),
(174, 'HAPR-2TYI-CZ1J', 4, NULL),
(175, 'BWML-R9WG-3840', 4, NULL),
(176, 'AC1L-VQV0-PY9O', 4, NULL),
(177, 'C3ID-QTAH-C4UT', 4, NULL),
(178, '4PVR-KKL3-NCQ7', 4, NULL),
(179, 'T5IY-0JNN-RMD5', 4, NULL),
(180, '0ET7-RXFD-HOEX', 4, NULL),
(181, '9WJV-Q97M-Y196', 4, NULL),
(182, 'IX1J-4A5K-DHZR', 4, NULL),
(183, 'WFHN-DF5D-2DYI', 4, NULL),
(184, 'PLB4-GX8V-1Q7T', 4, NULL),
(185, 'RT6I-8KM4-QSH6', 4, NULL),
(186, 'ZU8U-4LWN-CWPQ', 4, NULL),
(187, 'Z6L2-T9G8-P2UZ', 4, NULL),
(188, '4VGI-C3EM-7O25', 4, NULL),
(189, 'Q55H-BMWE-ZPZA', 4, NULL),
(190, '5HMZ-VJKT-I1M2', 4, NULL),
(191, 'EQS2-WW4F-07ZN', 4, NULL),
(192, 'YX7O-6Q4Y-WVMI', 4, NULL),
(193, 'M1RH-I4P2-YBTH', 4, NULL),
(194, 'KG0A-4VUM-UD71', 4, NULL),
(195, 'DCMO-N01F-KWCV', 4, NULL),
(196, 'Z630-8EF4-5HXX', 4, NULL),
(197, '3XOL-XN9W-Y5T0', 4, NULL),
(198, 'FWNI-WL27-KJZI', 4, NULL),
(199, 'WSK8-TYLQ-V39V', 4, NULL),
(200, 'YW9X-KCVT-P2RT', 4, NULL),
(201, 'S75U-TBT6-8HWP', 4, NULL),
(202, '0B4R-OXS5-4VJ9', 4, NULL),
(203, 'V8MY-UNRI-J74T', 4, NULL),
(204, 'XHI7-GL2J-32K4', 4, NULL),
(205, 'D36U-67O0-I8GV', 4, NULL),
(206, 'MLK5-LZ6X-02MK', 5, NULL),
(207, '14Q2-7VVY-NHW3', 5, NULL),
(208, 'YP21-5RCR-YC0O', 5, NULL),
(209, 'BPXS-YJEJ-W2BX', 5, NULL),
(210, 'Q0DL-MAX1-LKZ6', 5, NULL),
(211, '3MJM-YU1G-A0I8', 5, NULL),
(212, 'VKD3-W9MM-2IPW', 5, NULL),
(213, 'N3LI-CERL-D96P', 5, NULL),
(214, 'F0BY-RI4X-133O', 5, NULL),
(215, 'KL7W-DWLK-94DM', 5, NULL),
(216, 'FDHA-P5SL-GT3D', 5, NULL),
(217, 'MY4P-N4BO-ISNZ', 5, NULL),
(218, 'NCUK-MI7Z-IHO3', 5, NULL),
(219, 'Z0JG-1BMD-2A6K', 5, NULL),
(220, 'EJG9-X2RW-7W6D', 5, NULL),
(221, '1DGD-54UB-OE88', 5, NULL),
(222, '5XYJ-PWU7-X9QW', 5, NULL),
(223, 'J116-5JOY-3LIR', 5, NULL),
(224, '3J2O-D7CB-MRS1', 5, NULL),
(225, 'OAOF-NF1Y-Q3JA', 5, NULL),
(226, '9U7Q-3JPZ-LQ17', 5, NULL),
(227, 'LCV6-EV94-W9TQ', 5, NULL),
(228, 'EM7S-09BD-VW8F', 5, NULL),
(229, '0P18-SYB7-SN6U', 5, NULL),
(230, '31G2-BWJF-JD7U', 5, NULL),
(231, 'D7US-XM97-QBVM', 5, NULL),
(232, 'XJFY-2ZCO-AVFT', 5, NULL),
(233, '7Y0R-VEIV-ZOKA', 5, NULL),
(234, 'VXVS-S1VE-XKQ6', 5, NULL),
(235, 'VEWK-RDGV-XYJA', 5, NULL),
(236, '62QM-X82Z-YD85', 5, NULL),
(237, 'M9CS-1S8S-0V4G', 5, NULL),
(238, 'U3O5-0L2Q-IY4I', 5, NULL),
(239, 'R8ZB-S1DK-IK0F', 5, NULL),
(240, '671H-6KJ6-3BSZ', 5, NULL),
(241, '0RNT-JIH6-RV31', 5, NULL),
(242, '9HVW-4NMO-0QUX', 5, NULL),
(243, 'VEIW-SSU9-YJST', 5, NULL),
(244, 'GOL8-6UHK-N4MM', 5, NULL),
(245, 'S5QR-11UH-9A5H', 5, NULL),
(246, '0OM1-WXJM-Y8R7', 5, NULL),
(247, 'SCM9-IGZS-PB55', 5, NULL),
(248, 'G30F-ELX1-KZOZ', 5, NULL),
(249, 'MXNO-LQN3-321S', 5, NULL),
(250, '86QN-MRY4-A1M9', 5, NULL),
(251, 'XR1H-I33S-QT3L', 5, NULL),
(252, 'M3XW-TOW5-DSUD', 5, NULL),
(253, 'X23I-VKZS-TKTT', 5, NULL),
(254, '4WG6-LYD0-CKJV', 5, NULL),
(255, '52FV-8BKA-NQ3K', 5, NULL),
(256, 'WK1Q-FI12-1760', 6, NULL),
(257, 'SHL1-BINK-QL6H', 6, NULL),
(258, 'MDKB-23M0-PJO2', 6, NULL),
(259, 'KUMF-9QSK-YHZG', 6, NULL),
(260, '4RKK-ZTEV-0BUS', 6, NULL),
(261, 'EJPC-P6B0-HJQW', 6, NULL),
(262, '4RZH-CRQC-VWFL', 6, NULL),
(263, 'W02U-5H44-V4K2', 6, NULL),
(264, 'RBUT-0UXV-E29D', 6, NULL),
(265, '3WWX-UL6L-V07V', 6, NULL),
(266, 'JD71-ZNU5-PJZF', 6, NULL),
(267, 'IZ7J-TFNQ-EWVP', 6, NULL),
(268, 'NUZP-D6JF-YGO3', 6, NULL),
(269, '6MZG-G3JP-KWYJ', 6, NULL),
(270, 'XHA7-AT6F-2CPF', 6, NULL),
(271, '31GW-QGI1-RGHM', 6, NULL),
(272, 'KJHV-P1FD-DBLK', 6, NULL),
(273, 'KW1W-QU07-TR7W', 6, NULL),
(274, 'AQVQ-5DO2-VSWT', 6, NULL),
(275, 'DJ78-6QU7-7ZJ3', 6, NULL),
(276, 'ZBHP-FEEF-0BJ1', 6, NULL),
(277, 'RNLY-1GSZ-YDUG', 6, NULL),
(278, 'UIZ8-QEWN-36TK', 6, NULL),
(279, 'XGHB-MA3R-79E7', 6, NULL),
(280, '4IKI-CMC1-DNZM', 6, NULL),
(281, '484L-3F1T-9VFM', 6, NULL),
(282, '3MJU-JA2U-2Y7G', 6, NULL),
(283, 'O7R0-S6UE-EF8X', 6, NULL),
(284, '14FI-O99G-CVAR', 6, NULL),
(285, 'OMUW-RRRU-6D22', 6, NULL),
(286, 'LJK7-LR13-ENUZ', 6, NULL),
(287, 'AOF1-4UF0-7LY5', 6, NULL),
(288, 'FWK5-28C7-1LY2', 6, NULL),
(289, 'ODFY-SMDJ-PSW3', 6, NULL),
(290, 'BSKB-Z5IF-HUA5', 6, NULL),
(291, '69PY-H9T3-W5OI', 6, NULL),
(292, 'HAIR-Q1XM-2I3L', 6, NULL),
(293, 'FLWM-D1N6-0278', 6, NULL),
(294, 'ZEX9-A8M8-LBNL', 6, NULL),
(295, 'YVVC-ZJLX-QMPB', 6, NULL),
(296, 'VTIZ-FBVW-1W3J', 6, NULL),
(297, 'SQ3V-8J6B-JJ6X', 6, NULL),
(298, '7GH3-FJVV-QGQN', 6, NULL),
(299, '7GWF-H9OO-N1ZC', 6, NULL),
(300, 'AM3X-H3XD-V9Q6', 6, NULL),
(301, 'HBFA-YZB6-DG9T', 6, NULL),
(302, 'BHMO-WA7P-PKDE', 6, NULL),
(303, 'UJQV-YC4X-ZCLK', 6, NULL),
(304, 'CALW-B12I-LYKI', 6, NULL),
(305, 'DUYI-D1RJ-UFX9', 6, NULL),
(306, 'HCYQ-INSJ-MNWS', 7, NULL),
(307, '2682-LMBI-CT2O', 7, NULL),
(308, '22ZN-0900-WQNX', 7, NULL),
(309, 'XBUW-RC12-PP90', 7, NULL),
(310, 'FPYW-6517-OH23', 7, NULL),
(311, '3HZ5-6H7G-6DRM', 7, NULL),
(312, 'SG2Q-7L5C-54GM', 7, NULL),
(313, 'WXX4-391Y-01TO', 7, NULL),
(314, 'DMNE-CSKQ-OXRK', 7, NULL),
(315, 'VX1S-YURH-0OFG', 7, NULL),
(316, 'FX5U-0IJE-4ZPD', 7, NULL),
(317, 'L87F-SS5U-IK49', 7, NULL),
(318, '428Z-IA2N-ZMRJ', 7, NULL),
(319, 'C3TB-5D9S-S12G', 7, NULL),
(320, 'XYJ3-LMP7-3ADS', 7, NULL),
(321, '4QV8-P21K-G488', 7, NULL),
(322, 'F1B7-ALL2-YXHE', 7, NULL),
(323, 'VN7C-IM4J-O5P1', 7, NULL),
(324, 'J4WG-TW6V-P8JW', 7, NULL),
(325, 'ZKEL-UPSL-ZZ3Z', 7, NULL),
(326, 'M7DB-IT1R-UL3U', 7, NULL),
(327, 'CWO8-JPV8-XOIK', 7, NULL),
(328, 'UX6Y-NVZL-7HI7', 7, NULL),
(329, 'VAU0-F6LR-9PVN', 7, NULL),
(330, '7R7D-NVS6-CY4T', 7, NULL),
(331, 'QHCF-KH1S-9DB2', 7, NULL),
(332, 'M5Q1-09FX-9OYE', 7, NULL),
(333, 'QWFP-8UGJ-524B', 7, NULL),
(334, 'CZ81-C507-884P', 7, NULL),
(335, 'C2PH-1A7T-G2IM', 7, NULL),
(336, '45ZD-7QF3-8K77', 7, NULL),
(337, 'DU5P-49N0-O3H5', 7, NULL),
(338, 'J11L-VB59-7M5N', 7, NULL),
(339, 'P7XP-XRQY-YIHA', 7, NULL),
(340, 'E6I7-C0OQ-EP98', 7, NULL),
(341, 'NF6S-OQSK-JS7Z', 7, NULL),
(342, 'UNJX-27R0-SAET', 7, NULL),
(343, '75M7-VSSF-K6H7', 7, NULL),
(344, 'OSUR-KDSY-09IA', 7, NULL),
(345, '21OE-8UG4-G8LU', 7, NULL),
(346, '7BBC-GPBO-FVMT', 7, NULL),
(347, '5MLC-ZUQA-F7E1', 7, NULL),
(348, 'NZFN-7V6H-71HL', 7, NULL),
(349, '9BOF-FUMX-CBML', 7, NULL),
(350, '10KD-6NSR-UD3P', 7, NULL),
(351, 'KXNH-PM75-Q1TO', 7, NULL),
(352, 'ZXWW-0PI2-SBBX', 7, NULL),
(353, 'JBDO-5MA0-P46W', 7, NULL),
(354, 'IJX6-KKDP-STCT', 7, NULL),
(355, 'OC0C-5U3O-RBUL', 7, NULL),
(356, 'FEXH-L5K5-A8IY', 8, NULL),
(357, 'OZTI-2OZI-KUBW', 8, NULL),
(358, 'Q552-MVE3-VOBE', 8, NULL),
(359, 'KTTY-A665-GA4R', 8, NULL),
(360, 'WI85-INGZ-219A', 8, NULL),
(361, 'RKNQ-BJ1C-YUGR', 8, NULL),
(362, 'CRB0-S5MT-ZFU4', 8, NULL),
(363, '2CXM-VACD-J32Z', 8, NULL),
(364, 'U4LI-Y7VK-LPBA', 8, NULL),
(365, 'E7XP-BGIF-9MJX', 8, NULL),
(366, 'AT61-DK73-0T4S', 8, NULL),
(367, 'P7X3-08QD-O6UW', 8, NULL),
(368, 'G02Y-3LQC-KJHG', 8, NULL),
(369, 'AXK4-9COP-ZW2C', 8, NULL),
(370, '6FEW-9QKS-IBTS', 8, NULL),
(371, '40MW-M6G7-6NAA', 8, NULL),
(372, 'JRL9-XDCQ-0TQ2', 8, NULL),
(373, 'XIXT-1DCE-2JMM', 8, NULL),
(374, '9HVO-J6M9-730M', 8, NULL),
(375, '37NG-LZKI-CFZ6', 8, NULL),
(376, 'T9KH-CQIR-EW1T', 8, NULL),
(377, 'ZBW0-H477-YXTR', 8, NULL),
(378, 'TSTG-1A0P-4LLA', 8, NULL),
(379, '07AL-6AAG-MED7', 8, NULL),
(380, 'RMPP-KLAJ-DISN', 8, NULL),
(381, 'KYKB-9IGL-2XTV', 8, NULL),
(382, '1FH4-UQSW-I0K1', 8, NULL),
(383, 'N264-C2I3-7QUE', 8, NULL),
(384, 'BA0A-FEE7-FVJO', 8, NULL),
(385, 'YQWR-8TF1-0HMO', 8, NULL),
(386, 'ILF7-EGCR-YYBW', 8, NULL),
(387, 'UDTQ-ANTV-10SD', 8, NULL),
(388, 'CFOU-V4ZE-T0NL', 8, NULL),
(389, 'YG5K-G8HW-3Q3N', 8, NULL),
(390, '1SYF-1QJC-BESK', 8, NULL),
(391, '56HV-QCDU-VRVX', 8, NULL),
(392, 'J88G-9XOA-ZDXS', 8, NULL),
(393, '5Q5R-SK4L-AY12', 8, NULL),
(394, 'PHOL-FA5Z-HZ8J', 8, NULL),
(395, 'AK56-VPN8-OHVI', 8, NULL),
(396, 'NGLD-9SNJ-UPV8', 8, NULL),
(397, 'BD92-407L-JGNE', 8, NULL),
(398, '811L-GMDR-XI4T', 8, NULL),
(399, 'M8WW-76JC-6ZJX', 8, NULL),
(400, 'VT3A-HQ8A-2Y3F', 8, NULL),
(401, '31VL-IYU5-T3D8', 8, NULL),
(402, '8DIE-J2OS-X4TX', 8, NULL),
(403, '2TFZ-9ZHG-6ZGJ', 8, NULL),
(404, '1NAS-LCGA-0XYM', 8, NULL),
(405, '1P7X-XI7R-BQG7', 8, NULL),
(406, 'H7VW-48XW-HQMT', 9, NULL),
(407, '9ZEQ-OU88-GNMG', 9, NULL),
(408, 'SAHY-F1BU-LT3O', 9, NULL),
(409, 'ZX9L-T6U6-TZ7J', 9, NULL),
(410, '74F7-PXCJ-FNIE', 9, NULL),
(411, 'R2TK-T7UO-YIP0', 9, NULL),
(412, 'XY8C-XPMT-HKVQ', 9, NULL),
(413, '2M5Y-NG9T-Q6E5', 9, NULL),
(414, '7D8C-L517-V2J3', 9, NULL),
(415, 'H9WV-EAVU-39OU', 9, NULL),
(416, 'KS87-Y3W2-AP4K', 9, NULL),
(417, 'TPLP-8X61-A7ER', 9, NULL),
(418, 'A0A1-3BHM-2L1P', 9, NULL),
(419, '0TL0-AF7T-RFHR', 9, NULL),
(420, 'Q8I2-2WWI-4TPA', 9, NULL),
(421, 'RZK3-9VJ6-IF98', 9, NULL),
(422, 'U5TH-2QOM-F69F', 9, NULL),
(423, 'Q5DG-HESH-GUFI', 9, NULL),
(424, 'DXAB-RRR1-TGDG', 9, NULL),
(425, 'VI8R-TVZO-ZME5', 9, NULL),
(426, 'WUPR-OQLA-Q908', 9, NULL),
(427, '3HWT-D4IG-OFQ6', 9, NULL),
(428, 'K2YF-5AY5-0T2W', 9, NULL),
(429, 'AU7J-I2OL-TTBS', 9, NULL),
(430, 'OI9H-Y0CJ-B9P1', 9, NULL),
(431, '02BL-SSN9-T7NO', 9, NULL),
(432, 'SQTW-52J3-WZOC', 9, NULL),
(433, 'PEXG-VCNL-CKNU', 9, NULL),
(434, '9NNK-N7D4-XD1D', 9, NULL),
(435, '1OEM-J7NR-BNH3', 9, NULL),
(436, 'X5H8-WD9S-ECAI', 9, NULL),
(437, '4TXW-7YW6-KRZ5', 9, NULL),
(438, 'S64Q-DKU0-JRKZ', 9, NULL),
(439, '25IY-E8F5-2QFT', 9, NULL),
(440, 'XL1M-9AGU-T74E', 9, NULL),
(441, 'MESE-NNG9-E0EW', 9, NULL),
(442, 'V3CL-GH86-BJ4H', 9, NULL),
(443, '5Q5D-2SN9-6XF6', 9, NULL),
(444, '3UUJ-WRRC-4FI1', 9, NULL),
(445, 'Z1YN-ZBEK-7IPT', 9, NULL),
(446, 'AA8T-CXTK-X1SK', 9, NULL),
(447, '4ZQK-DTJB-H0ZZ', 9, NULL),
(448, '0IN5-N3XO-77VS', 9, NULL),
(449, 'LU35-3FR2-MZC7', 9, NULL),
(450, 'GW0S-H6CJ-0BGP', 9, NULL),
(451, 'YAWY-KISJ-QP5S', 9, NULL),
(452, '6R0L-2IXH-33ZB', 9, NULL),
(453, '93ZE-0M3M-C829', 9, NULL),
(454, 'O158-0NVU-3WZ2', 9, NULL),
(455, '1HW7-K1I8-895L', 9, NULL),
(456, '1HW7-K1BR-895L', 10, NULL),
(457, 'O158-0NVU-3K52', 10, NULL),
(458, '93ZE-4M3M-C229', 10, NULL),
(459, '6R3L-2SXH-33ZB', 10, NULL),
(460, 'YAW4-KISJ-QP7S', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `content` longtext,
  `template` longtext
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `menu_id`, `content`, `template`) VALUES
(1, 1, NULL, 'index'),
(2, 2, NULL, 'about_us'),
(3, 3, NULL, 'about_product'),
(4, 4, NULL, 'contacts'),
(5, 5, NULL, 'account');

-- --------------------------------------------------------

--
-- Table structure for table `user_licence`
--

CREATE TABLE IF NOT EXISTS `user_licence` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lic_id` int(11) NOT NULL,
  `activation_date` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_licence`
--

INSERT INTO `user_licence` (`id`, `user_id`, `lic_id`, `activation_date`) VALUES
(1, 1, 460, NULL),
(2, 2, 459, NULL),
(3, 3, 460, NULL),
(4, 4, 456, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datacentres`
--
ALTER TABLE `datacentres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_user`
--
ALTER TABLE `dc_user`
  ADD PRIMARY KEY (`id`), ADD KEY `dc_user_ibfk_1` (`dc_id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labels_trl`
--
ALTER TABLE `labels_trl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license_types`
--
ALTER TABLE `license_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_licence`
--
ALTER TABLE `user_licence`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `datacentres`
--
ALTER TABLE `datacentres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `dc_user`
--
ALTER TABLE `dc_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `labels_trl`
--
ALTER TABLE `labels_trl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `license_types`
--
ALTER TABLE `license_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `numbers`
--
ALTER TABLE `numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=461;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `user_licence`
--
ALTER TABLE `user_licence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dc_user`
--
ALTER TABLE `dc_user`
ADD CONSTRAINT `dc_user_ibfk_1` FOREIGN KEY (`dc_id`) REFERENCES `datacentres` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
