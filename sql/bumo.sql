-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2015 a las 03:02:48
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bumo`
--
CREATE DATABASE IF NOT EXISTS `bumo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bumo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `readings`
--

DROP TABLE IF EXISTS `readings`;
CREATE TABLE IF NOT EXISTS `readings` (
  `reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `reading_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reading_temperature` varchar(10) NOT NULL,
  `reading_id_station` int(11) NOT NULL,
  PRIMARY KEY (`reading_id`),
  KEY `fk_station_id` (`reading_id_station`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=310 ;

--
-- Volcado de datos para la tabla `readings`
--

INSERT INTO `readings` (`reading_id`, `reading_date`, `reading_temperature`, `reading_id_station`) VALUES
(1, '2015-11-29 00:18:49', '37', 1),
(2, '2015-11-29 00:18:52', '32', 3),
(3, '2015-11-29 00:18:56', '38', 3),
(4, '2015-11-29 00:18:59', '36', 3),
(5, '2015-11-29 00:19:02', '37', 1),
(6, '2015-11-29 00:19:05', '34', 1),
(7, '2015-11-29 00:19:10', '38', 3),
(8, '2015-11-29 00:19:13', '39', 2),
(9, '2015-11-29 00:19:17', '37', 3),
(10, '2015-11-28 09:58:52', '30.0', 2),
(11, '2015-11-29 09:58:54', '30.0', 2),
(12, '2015-11-29 09:58:56', '31.0', 1),
(13, '2015-11-29 09:58:58', '34.0', 2),
(14, '2015-11-29 09:59:00', '33.0', 1),
(15, '2015-11-29 09:59:02', '36.0', 1),
(16, '2015-11-29 09:59:04', '31.0', 2),
(17, '2015-11-29 09:59:06', '36.0', 1),
(18, '2015-11-29 09:59:09', '30.0', 1),
(19, '2015-11-29 09:59:11', '38.0', 3),
(20, '2015-11-29 09:59:13', '37.0', 1),
(21, '2015-11-29 09:59:15', '34.0', 2),
(22, '2015-11-29 09:59:17', '40.0', 2),
(23, '2015-11-29 09:59:19', '31.0', 1),
(24, '2015-11-29 09:59:21', '30.0', 3),
(25, '2015-11-29 09:59:23', '36.0', 1),
(26, '2015-11-29 09:59:25', '32.0', 3),
(27, '2015-11-29 09:59:27', '32.0', 2),
(28, '2015-11-29 09:59:29', '33.0', 1),
(29, '2015-11-29 09:59:31', '30.0', 1),
(30, '2015-11-29 09:59:33', '31.0', 2),
(31, '2015-11-29 09:59:35', '35.0', 1),
(32, '2015-11-29 09:59:37', '31.0', 2),
(33, '2015-11-29 09:59:39', '37.0', 1),
(34, '2015-11-29 09:59:41', '34.0', 3),
(35, '2015-11-29 09:59:43', '36.0', 1),
(36, '2015-11-29 09:59:45', '37.0', 2),
(37, '2015-11-29 09:59:47', '36.0', 2),
(38, '2015-11-29 09:59:49', '33.0', 2),
(39, '2015-11-29 09:59:52', '37.0', 1),
(40, '2015-11-29 09:59:54', '39.0', 3),
(41, '2015-11-29 09:59:56', '40.0', 1),
(42, '2015-11-29 09:59:58', '34.0', 2),
(43, '2015-11-29 10:00:00', '40.0', 1),
(44, '2015-11-29 10:00:02', '38.0', 3),
(45, '2015-11-29 10:00:04', '38.0', 3),
(46, '2015-11-29 10:00:06', '33.0', 2),
(47, '2015-11-29 10:00:08', '36.0', 1),
(48, '2015-11-29 10:00:10', '38.0', 1),
(49, '2015-11-29 10:00:12', '34.0', 2),
(50, '2015-11-29 10:00:14', '37.0', 1),
(51, '2015-11-29 10:00:16', '32.0', 2),
(52, '2015-11-29 10:00:18', '37.0', 1),
(53, '2015-11-29 10:01:34', '39.0', 1),
(54, '2015-11-29 10:01:37', '34.0', 3),
(55, '2015-11-29 10:01:39', '40.0', 3),
(56, '2015-11-29 10:01:41', '34.0', 3),
(57, '2015-11-29 10:01:43', '30.0', 2),
(58, '2015-11-29 10:01:45', '35.0', 2),
(59, '2015-11-29 10:01:47', '35.0', 2),
(60, '2015-11-29 10:01:49', '37.0', 2),
(61, '2015-11-29 10:01:51', '33.0', 3),
(62, '2015-11-29 10:01:53', '36.0', 3),
(63, '2015-11-29 10:01:55', '36.0', 3),
(64, '2015-11-29 10:01:57', '36.0', 3),
(65, '2015-11-29 10:01:59', '38.0', 1),
(66, '2015-11-29 10:02:01', '39.0', 1),
(67, '2015-11-29 10:02:03', '34.0', 1),
(68, '2015-11-29 10:21:34', '40.0', 3),
(69, '2015-11-29 10:21:36', '36.0', 3),
(70, '2015-11-29 10:21:38', '39.0', 1),
(71, '2015-11-29 10:21:40', '34.0', 2),
(72, '2015-11-29 10:21:43', '33.0', 3),
(73, '2015-11-29 10:21:45', '32.0', 1),
(74, '2015-11-29 10:21:47', '40.0', 2),
(75, '2015-11-29 10:30:37', '30.0', 1),
(76, '2015-11-29 10:30:40', '35.0', 2),
(77, '2015-11-29 10:30:42', '40.0', 1),
(78, '2015-11-29 10:30:44', '31.0', 3),
(79, '2015-11-29 02:36:42', '39.0', 2),
(80, '2015-11-29 02:36:44', '38.0', 2),
(81, '2015-11-29 02:36:46', '35.0', 1),
(82, '2015-11-29 02:36:48', '35.0', 1),
(83, '2015-11-29 02:36:50', '35.0', 1),
(84, '2015-11-29 02:36:52', '39.0', 3),
(85, '2015-11-29 02:36:54', '40.0', 2),
(86, '2015-11-29 02:36:56', '36.0', 3),
(87, '2015-11-29 02:36:58', '39.0', 2),
(88, '2015-11-29 02:37:00', '34.0', 3),
(89, '2015-11-29 02:37:02', '30.0', 3),
(90, '2015-11-29 02:37:04', '33.0', 1),
(91, '2015-11-29 02:37:06', '33.0', 3),
(92, '2015-11-29 02:37:08', '34.0', 1),
(93, '2015-11-29 02:37:11', '38.0', 1),
(94, '2015-11-29 02:37:13', '37.0', 2),
(95, '2015-11-29 02:37:15', '38.0', 1),
(96, '2015-11-29 02:37:17', '36.0', 3),
(97, '2015-11-29 02:37:19', '39.0', 1),
(98, '2015-11-29 02:37:21', '30.0', 2),
(99, '2015-11-29 02:37:23', '31.0', 1),
(100, '2015-11-29 02:37:25', '34.0', 1),
(101, '2015-11-29 02:37:27', '37.0', 1),
(102, '2015-11-29 02:37:29', '33.0', 1),
(103, '2015-11-29 02:37:31', '31.0', 2),
(104, '2015-11-29 02:37:33', '33.0', 1),
(105, '2015-11-29 02:37:35', '38.0', 3),
(106, '2015-11-29 02:37:37', '40.0', 3),
(107, '2015-11-29 02:37:39', '31.0', 2),
(108, '2015-11-29 02:37:41', '32.0', 1),
(109, '2015-11-29 02:37:43', '38.0', 1),
(110, '2015-11-29 02:37:45', '40.0', 2),
(111, '2015-11-29 02:37:47', '39.0', 1),
(112, '2015-11-29 02:37:49', '33.0', 1),
(113, '2015-11-29 02:37:51', '39.0', 2),
(114, '2015-11-29 02:37:53', '38.0', 1),
(115, '2015-11-29 02:37:55', '37.0', 3),
(116, '2015-11-29 02:37:57', '38.0', 3),
(117, '2015-11-29 02:37:59', '38.0', 3),
(118, '2015-11-29 02:38:02', '39.0', 2),
(119, '2015-11-29 02:38:04', '38.0', 2),
(120, '2015-11-29 02:38:06', '38.0', 2),
(121, '2015-11-29 02:38:08', '36.0', 2),
(122, '2015-11-29 02:38:10', '31.0', 1),
(123, '2015-11-29 02:38:12', '36.0', 3),
(124, '2015-11-29 02:38:14', '39.0', 2),
(125, '2015-11-29 02:38:16', '40.0', 2),
(126, '2015-11-29 02:38:18', '30.0', 1),
(127, '2015-11-29 02:38:20', '39.0', 3),
(128, '2015-11-29 02:38:22', '33.0', 1),
(129, '2015-11-29 02:38:24', '34.0', 1),
(130, '2015-11-29 02:38:26', '39.0', 2),
(131, '2015-11-29 02:38:28', '32.0', 1),
(132, '2015-11-29 02:38:30', '36.0', 2),
(133, '2015-11-29 02:38:32', '32.0', 3),
(134, '2015-11-29 02:38:34', '37.0', 3),
(135, '2015-11-29 02:38:36', '40.0', 1),
(136, '2015-11-29 02:38:38', '33.0', 2),
(137, '2015-11-29 02:38:40', '31.0', 1),
(138, '2015-11-29 02:38:42', '37.0', 1),
(139, '2015-11-29 02:38:44', '39.0', 1),
(140, '2015-11-29 02:38:46', '39.0', 2),
(141, '2015-11-29 02:38:48', '30.0', 2),
(142, '2015-11-29 02:38:50', '32.0', 2),
(143, '2015-11-29 02:38:52', '32.0', 3),
(144, '2015-11-29 02:38:54', '33.0', 2),
(145, '2015-11-29 02:38:56', '36.0', 2),
(146, '2015-11-29 02:38:58', '31.0', 1),
(147, '2015-11-29 02:39:01', '33.0', 1),
(148, '2015-11-29 02:39:03', '39.0', 2),
(149, '2015-11-29 02:39:05', '35.0', 3),
(150, '2015-11-29 02:39:07', '31.0', 1),
(151, '2015-11-29 02:39:09', '32.0', 2),
(152, '2015-11-29 02:39:11', '34.0', 1),
(153, '2015-11-29 02:39:13', '33.0', 3),
(154, '2015-11-29 02:39:15', '35.0', 3),
(155, '2015-11-29 02:39:17', '35.0', 2),
(156, '2015-11-29 02:39:19', '34.0', 1),
(157, '2015-11-29 02:39:21', '31.0', 2),
(158, '2015-11-29 02:39:23', '37.0', 2),
(159, '2015-11-29 02:39:25', '38.0', 1),
(160, '2015-11-29 02:39:27', '37.0', 1),
(161, '2015-11-29 02:39:29', '31.0', 1),
(162, '2015-11-29 02:39:31', '36.0', 1),
(163, '2015-11-29 02:39:33', '34.0', 2),
(164, '2015-11-29 02:39:35', '32.0', 2),
(165, '2015-11-29 02:39:37', '30.0', 3),
(166, '2015-11-29 02:39:39', '36.0', 2),
(167, '2015-11-29 02:39:41', '33.0', 1),
(168, '2015-11-29 02:39:43', '31.0', 1),
(169, '2015-11-29 02:39:45', '34.0', 3),
(170, '2015-11-29 02:39:47', '39.0', 1),
(171, '2015-11-29 02:39:50', '38.0', 3),
(172, '2015-11-29 02:39:52', '32.0', 1),
(173, '2015-11-29 02:39:54', '30.0', 3),
(174, '2015-11-29 02:39:56', '37.0', 3),
(175, '2015-11-29 02:39:58', '35.0', 3),
(176, '2015-11-29 02:40:00', '39.0', 2),
(177, '2015-11-29 02:40:02', '33.0', 2),
(178, '2015-12-01 05:56:26', '30.0', 3),
(179, '2015-12-01 05:56:29', '38.0', 1),
(180, '2015-12-01 05:56:31', '33.0', 1),
(181, '2015-12-01 05:56:33', '38.0', 3),
(182, '2015-12-01 05:56:35', '37.0', 1),
(183, '2015-12-01 05:56:37', '32.0', 2),
(184, '2015-12-01 05:56:39', '35.0', 3),
(185, '2015-12-01 05:56:41', '40.0', 2),
(186, '2015-12-01 05:56:43', '39.0', 1),
(187, '2015-12-01 05:56:45', '39.0', 3),
(188, '2015-12-01 05:56:48', '33.0', 2),
(189, '2015-12-01 05:56:50', '34.0', 3),
(190, '2015-12-01 05:56:52', '38.0', 2),
(191, '2015-12-01 05:56:54', '38.0', 2),
(192, '2015-12-01 05:56:56', '32.0', 1),
(193, '2015-12-01 05:56:58', '39.0', 3),
(194, '2015-12-01 05:57:00', '36.0', 1),
(195, '2015-12-01 05:57:02', '34.0', 1),
(196, '2015-12-01 05:57:04', '31.0', 1),
(197, '2015-12-01 05:57:06', '30.0', 2),
(198, '2015-12-01 05:57:08', '33.0', 1),
(199, '2015-12-01 05:57:10', '40.0', 3),
(200, '2015-12-01 05:57:12', '38.0', 2),
(201, '2015-12-01 05:57:14', '34.0', 3),
(202, '2015-12-01 05:57:16', '32.0', 2),
(203, '2015-12-01 05:57:18', '30.0', 3),
(204, '2015-12-01 05:57:20', '35.0', 2),
(205, '2015-12-01 05:57:22', '31.0', 1),
(206, '2015-12-01 05:57:24', '40.0', 3),
(207, '2015-12-01 05:57:26', '31.0', 1),
(208, '2015-12-01 05:57:28', '33.0', 1),
(209, '2015-12-01 05:57:30', '32.0', 3),
(210, '2015-12-01 05:57:32', '31.0', 1),
(211, '2015-12-01 05:57:34', '34.0', 1),
(212, '2015-12-01 05:57:36', '31.0', 2),
(213, '2015-12-01 05:57:39', '37.0', 3),
(214, '2015-12-01 05:57:41', '32.0', 3),
(215, '2015-12-01 05:57:43', '33.0', 3),
(216, '2015-12-01 00:44:38', '36.0', 2),
(217, '2015-12-01 00:44:40', '32.0', 1),
(218, '2015-12-01 00:44:42', '33.0', 1),
(219, '2015-12-01 00:44:44', '36.0', 2),
(220, '2015-12-01 00:44:46', '31.0', 1),
(221, '2015-12-01 00:44:48', '37.0', 1),
(222, '2015-12-01 00:44:50', '30.0', 3),
(223, '2015-12-01 00:44:52', '38.0', 1),
(224, '2015-12-01 00:44:54', '38.0', 1),
(225, '2015-12-01 00:44:57', '31.0', 1),
(226, '2015-12-01 00:44:59', '40.0', 2),
(227, '2015-12-01 00:45:01', '31.0', 3),
(228, '2015-12-01 00:45:03', '35.0', 3),
(229, '2015-12-01 00:45:05', '39.0', 2),
(230, '2015-12-01 00:45:07', '40.0', 2),
(231, '2015-12-01 00:45:09', '31.0', 3),
(232, '2015-12-01 00:45:11', '31.0', 1),
(233, '2015-12-01 00:45:13', '38.0', 3),
(234, '2015-12-01 00:45:15', '32.0', 2),
(235, '2015-12-01 00:45:17', '34.0', 2),
(236, '2015-12-01 00:45:19', '37.0', 1),
(237, '2015-12-01 00:45:21', '35.0', 2),
(238, '2015-12-01 00:45:23', '32.0', 2),
(239, '2015-12-01 00:45:25', '38.0', 3),
(240, '2015-12-01 00:45:27', '34.0', 1),
(241, '2015-12-01 00:45:29', '32.0', 3),
(242, '2015-12-01 00:45:31', '30.0', 3),
(243, '2015-12-01 00:45:33', '37.0', 1),
(244, '2015-12-01 00:45:35', '39.0', 1),
(245, '2015-12-01 00:45:37', '34.0', 3),
(246, '2015-12-01 00:45:39', '33.0', 2),
(247, '2015-12-01 00:45:41', '40.0', 3),
(248, '2015-12-01 00:45:43', '37.0', 1),
(249, '2015-12-01 00:45:45', '40.0', 3),
(250, '2015-12-01 00:45:47', '37.0', 2),
(251, '2015-12-01 00:45:49', '35.0', 2),
(252, '2015-12-01 00:45:52', '40.0', 3),
(253, '2015-12-01 00:45:54', '37.0', 2),
(254, '2015-12-01 00:45:56', '31.0', 1),
(255, '2015-12-01 00:45:58', '40.0', 1),
(256, '2015-12-01 00:46:00', '30.0', 2),
(257, '2015-12-01 00:46:02', '34.0', 2),
(258, '2015-12-01 00:46:04', '31.0', 1),
(259, '2015-12-01 00:46:06', '39.0', 1),
(260, '2015-12-01 00:46:08', '34.0', 2),
(261, '2015-12-01 00:46:10', '31.0', 2),
(262, '2015-12-01 00:46:12', '34.0', 3),
(263, '2015-12-01 00:46:14', '35.0', 2),
(264, '2015-12-01 00:46:16', '32.0', 1),
(265, '2015-12-01 00:46:18', '37.0', 1),
(266, '2015-12-01 00:46:20', '36.0', 2),
(267, '2015-12-01 00:46:22', '32.0', 1),
(268, '2015-12-01 00:46:25', '37.0', 3),
(269, '2015-12-01 00:46:27', '40.0', 2),
(270, '2015-12-01 00:46:29', '34.0', 3),
(271, '2015-12-01 00:46:31', '39.0', 3),
(272, '2015-12-01 00:46:33', '37.0', 1),
(273, '2015-12-01 00:46:35', '32.0', 2),
(274, '2015-12-01 00:46:37', '40.0', 2),
(275, '2015-12-01 00:46:39', '36.0', 1),
(276, '2015-12-01 00:46:41', '36.0', 1),
(277, '2015-12-01 00:46:43', '31.0', 3),
(278, '2015-12-01 00:46:45', '32.0', 3),
(279, '2015-12-01 00:46:47', '38.0', 1),
(280, '2015-12-01 00:46:49', '32.0', 2),
(281, '2015-12-01 00:46:51', '33.0', 1),
(282, '2015-12-01 00:46:53', '37.0', 2),
(283, '2015-12-01 00:46:55', '35.0', 2),
(284, '2015-12-01 00:46:57', '30.0', 1),
(285, '2015-12-01 00:46:59', '39.0', 2),
(286, '2015-12-01 00:47:01', '34.0', 1),
(287, '2015-12-01 00:47:03', '36.0', 2),
(288, '2015-12-01 00:47:05', '36.0', 3),
(289, '2015-12-01 00:47:08', '35.0', 1),
(290, '2015-12-01 00:47:10', '40.0', 2),
(291, '2015-12-01 00:47:12', '37.0', 2),
(292, '2015-12-01 00:47:14', '33.0', 3),
(293, '2015-12-01 00:47:16', '37.0', 1),
(294, '2015-12-01 00:47:18', '30.0', 2),
(295, '2015-12-01 00:47:20', '30.0', 2),
(296, '2015-12-01 00:47:22', '37.0', 3),
(297, '2015-12-01 00:47:24', '40.0', 3),
(298, '2015-12-01 00:47:26', '32.0', 3),
(299, '2015-12-01 00:47:28', '37.0', 2),
(300, '2015-12-01 00:47:30', '38.0', 3),
(301, '2015-12-01 00:47:32', '39.0', 2),
(302, '2015-12-01 00:47:34', '31.0', 1),
(303, '2015-12-01 00:47:36', '40.0', 1),
(304, '2015-12-01 00:47:38', '38.0', 1),
(305, '2015-12-01 00:47:40', '35.0', 1),
(306, '2015-12-01 00:47:42', '40.0', 3),
(307, '2015-12-01 00:47:44', '33.0', 3),
(308, '2015-12-01 00:47:46', '33.0', 1),
(309, '2015-12-01 00:47:48', '40.0', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `station_id` int(11) NOT NULL,
  `station_description` varchar(30) NOT NULL,
  `station_ip_address` varchar(30) NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `station`
--

INSERT INTO `station` (`station_id`, `station_description`, `station_ip_address`) VALUES
(1, 'Station 1', '192.168.165.2'),
(2, 'Station 2', '168.125.52.13'),
(3, 'Station 3', '192.168.165.1');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `readings`
--
ALTER TABLE `readings`
  ADD CONSTRAINT `fk_station_id` FOREIGN KEY (`reading_id_station`) REFERENCES `station` (`station_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
