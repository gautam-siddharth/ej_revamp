-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 23, 2021 at 02:00 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `editorji`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletevideo` (IN `video_id_to_delete` BIGINT)  BEGIN
delete from user_clickstream  where user_clickstream_video_version_id in (select video_version_id from video_version where video_id = video_id_to_delete);
delete from user_playlist_videos  where user_playlist_video_version_id in (select video_version_id from video_version where video_id = video_id_to_delete);
delete from video_rendition  where video_version_id in (select video_version_id from video_version where video_id = video_id_to_delete);
delete from video_tag  where video_tag_video_id = video_id_to_delete;
delete from video_category  where video_category_video_id = video_id_to_delete;
delete from video_version where video_id = video_id_to_delete;
delete from video where video_id = video_id_to_delete;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `active_record_log`
--

CREATE TABLE `active_record_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `model` varchar(150) DEFAULT NULL,
  `new_data` text,
  `creationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ad_tech_playlist`
--

CREATE TABLE `ad_tech_playlist` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `lang` varchar(20) DEFAULT NULL,
  `thumb_image` text NOT NULL,
  `video_ids` text,
  `assigned_video_id` text,
  `duration` float DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `airtel_video`
--

CREATE TABLE `airtel_video` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `video_name` varchar(255) DEFAULT NULL,
  `video_short_description` text,
  `video_long_description` text,
  `category_name` text,
  `video_state` longtext,
  `video_location` enum('national','international','local') DEFAULT NULL,
  `video_tags` text,
  `more_tags` text,
  `genres` text,
  `video_date` datetime DEFAULT NULL,
  `video_duration` varchar(50) DEFAULT NULL,
  `video_url` text,
  `file_url` text,
  `landscape_img` text NOT NULL,
  `portrait_img` text,
  `banner_img` text,
  `video_languages` text,
  `video_created_date` datetime DEFAULT NULL,
  `video_created_by` text,
  `video_updated_date` datetime DEFAULT NULL,
  `video_updated_by` text,
  `is_deleted` varchar(50) DEFAULT NULL,
  `video_deleted_by` varchar(255) DEFAULT NULL,
  `json_data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `airtel_video`
--

INSERT INTO `airtel_video` (`video_id`, `video_name`, `video_short_description`, `video_long_description`, `category_name`, `video_state`, `video_location`, `video_tags`, `more_tags`, `genres`, `video_date`, `video_duration`, `video_url`, `file_url`, `landscape_img`, `portrait_img`, `banner_img`, `video_languages`, `video_created_date`, `video_created_by`, `video_updated_date`, `video_updated_by`, `is_deleted`, `video_deleted_by`, `json_data`) VALUES
(1556194195519, 'test', 'test', '', '', 'Kolkata', '', '', 'Auto', NULL, '2019-04-25 12:00:00', '12', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194195519/1556194195519.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194195519/1556194195519.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194195519/1556194195519_landscape.jpg', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194195519/1556194195519_portrait.jpg', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194195519/1556194195519_banner.jpg', 'en', '2019-04-25 17:39:55', 'admin', NULL, '', 'N', NULL, '{\"id\":1556194195519,\"title\":\"test\",\"short_description\":\"test\",\"long_description\":\"\",\"date\":\"2019-04-25 12-00-00\",\"tags\":\"Auto\",\"state\":\"Kolkata\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"12\"}'),
(1556194841725, 'Test Election Express with Vikram Chandra', 'Watch all the election news from across the country ', 'Watch all the election news from across the country ', '', 'Uttar Pradesh, National', '', '', 'National', NULL, '2019-04-25 12:00:00', '17', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194841725/1556194841725.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194841725/1556194841725.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556194841725/1556194841725_landscape.jpg', '', '', 'en', '2019-04-25 17:50:41', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556194841725,\"title\":\"Test Election Express with Vikram Chandra\",\"short_description\":\"Watch all the election news from across the country \",\"long_description\":\"Watch all the election news from across the country \",\"date\":\"2019-04-25 12-00-00\",\"tags\":\"National\",\"state\":\"Uttar Pradesh, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"17\"}'),
(1556206555840, 'ElectionsWithVikram: मोदी का रोडशो', 'BJP का घोषणापत्र, उसपर वोटरों की राय... और भी बहुत कुछ ', 'BJP का घोषणापत्र, उसपर वोटरों की राय... और भी बहुत कुछ ', '', 'Uttar Pradesh', '', '', 'देश', NULL, '2019-04-25 21:05:55', '1131', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556206555840/1556206555840.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556206555840/1556206555840.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556206555840/1556206555840_landscape.jpg', '', '', 'hi', '2019-04-25 21:05:55', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556206555840,\"title\":\"ElectionsWithVikram: \\u092e\\u094b\\u0926\\u0940 \\u0915\\u093e \\u0930\\u094b\\u0921\\u0936\\u094b\",\"short_description\":\"BJP \\u0915\\u093e \\u0918\\u094b\\u0937\\u0923\\u093e\\u092a\\u0924\\u094d\\u0930, \\u0909\\u0938\\u092a\\u0930 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0930\\u093e\\u092f... \\u0914\\u0930 \\u092d\\u0940 \\u092c\\u0939\\u0941\\u0924 \\u0915\\u0941\\u091b \",\"long_description\":\"BJP \\u0915\\u093e \\u0918\\u094b\\u0937\\u0923\\u093e\\u092a\\u0924\\u094d\\u0930, \\u0909\\u0938\\u092a\\u0930 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0930\\u093e\\u092f... \\u0914\\u0930 \\u092d\\u0940 \\u092c\\u0939\\u0941\\u0924 \\u0915\\u0941\\u091b \",\"date\":\"2019-04-25 21:05:55\",\"tags\":\"\\u0926\\u0947\\u0936\",\"state\":\"Uttar Pradesh\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"1131\"}'),
(1556207026482, '#ElectionsWithVikram', 'The Modi roadshow: BJP\'s mega show of strength', 'The Modi roadshow: BJP\'s mega show of strength', '', 'Uttar Pradesh, National', '', '', 'National', NULL, '2019-04-25 21:13:46', '784', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556207026482/1556207026482.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556207026482/1556207026482.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-25/1556207026482/1556207026482_landscape.jpg', '', '', 'en', '2019-04-25 21:13:46', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556207026482,\"title\":\"#ElectionsWithVikram\",\"short_description\":\"The Modi roadshow: BJP\'s mega show of strength\",\"long_description\":\"The Modi roadshow: BJP\'s mega show of strength\",\"date\":\"2019-04-25 21:13:46\",\"tags\":\"National\",\"state\":\"Uttar Pradesh, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"784\"}'),
(1556288413969, 'test2', 'test', '', '', 'Chennai, National', '', '', 'National', NULL, '2019-04-26 19:50:13', '66', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-26/1556288413969/1556288413969.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-26/1556288413969/1556288413969.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-26/1556288413969/1556288413969_landscape.jpg', '', '', 'en', '2019-04-26 19:50:13', 'admin', NULL, '', 'N', NULL, '{\"id\":1556288413969,\"title\":\"test2\",\"short_description\":\"test\",\"long_description\":\"\",\"date\":\"2019-04-26 19:50:13\",\"tags\":\"National\",\"state\":\"Chennai, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"66\"}'),
(1556288909360, 'test 3', 'test', '', '', 'Kolkata, National', '', '', 'National', NULL, '2019-04-26 19:58:29', '9', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-26/1556288909360/1556288909360.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-26/1556288909360/1556288909360.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-26/1556288909360/1556288909360_landscape.jpg', '', '', 'en', '2019-04-26 19:58:29', 'admin', NULL, '', 'N', NULL, '{\"id\":1556288909360,\"title\":\"test 3\",\"short_description\":\"test\",\"long_description\":\"\",\"date\":\"2019-04-26 19:58:29\",\"tags\":\"National\",\"state\":\"Kolkata, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"9\"}'),
(1556368560578, '#ElectionsWithVikram', 'Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?', 'Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?', '', 'Uttar Pradesh, National', '', '', 'National', NULL, '2019-04-27 18:06:00', '1002', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556368560578/1556368560578.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556368560578/1556368560578.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556368560578/1556368560578_landscape.jpg', '', '', 'en', '2019-04-27 18:06:00', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556368560578,\"title\":\"#ElectionsWithVikram\",\"short_description\":\"Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?\",\"long_description\":\"Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?\",\"date\":\"2019-04-27 18:06:00\",\"tags\":\"National\",\"state\":\"Uttar Pradesh, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"1002\"}'),
(1556370752850, '#ElectionsWithVikram', 'Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?', 'Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?', '', 'Uttar Pradesh, National', '', '', 'National', NULL, '2019-04-27 18:42:32', '994', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556370752850/1556370752850.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556370752850/1556370752850.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556370752850/1556370752850_landscape.jpg', '', '', 'en', '2019-04-27 18:42:32', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556370752850,\"title\":\"#ElectionsWithVikram\",\"short_description\":\"Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?\",\"long_description\":\"Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?\",\"date\":\"2019-04-27 18:42:32\",\"tags\":\"National\",\"state\":\"Uttar Pradesh, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"994\"}'),
(1556371801992, '#ElectionsWithVikram', 'यूपी का रण- लखनऊ से \'चाय पर चुनावी चर्चा\' ', 'चुनाव स्पेशल- विक्रम चंद्रा के साथ \'चाय पर चर्चा\' ', '', 'Uttar Pradesh', '', '', 'इलेक्शन विक्रम के साथ ', NULL, '2019-04-27 19:00:02', '891', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556371801992/1556371801992.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556371801992/1556371801992.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556371801992/1556371801992_landscape.jpg', '', '', 'hi', '2019-04-27 19:00:02', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556371801992,\"title\":\"#ElectionsWithVikram\",\"short_description\":\"\\u092f\\u0942\\u092a\\u0940 \\u0915\\u093e \\u0930\\u0923- \\u0932\\u0916\\u0928\\u090a \\u0938\\u0947 \'\\u091a\\u093e\\u092f \\u092a\\u0930 \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u091a\\u0930\\u094d\\u091a\\u093e\' \",\"long_description\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \'\\u091a\\u093e\\u092f \\u092a\\u0930 \\u091a\\u0930\\u094d\\u091a\\u093e\' \",\"date\":\"2019-04-27 19:00:02\",\"tags\":\"\\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"state\":\"Uttar Pradesh\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"891\"}'),
(1556373120025, '#ElectionsWithVikram', 'Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?', 'Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?', '', 'Uttar Pradesh', '', '', 'देश', NULL, '2019-04-27 19:22:00', '891', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556373120025/1556373120025.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556373120025/1556373120025.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-27/1556373120025/1556373120025_landscape.jpg', '', '', 'hi', '2019-04-27 19:22:00', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556373120025,\"title\":\"#ElectionsWithVikram\",\"short_description\":\"Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?\",\"long_description\":\"Vikram Chandra and editorji decode the battle for Uttar Pradesh with our panel of experts. Is Narendra Modi still a rallying point? With polarisation a central theme this election, can BJP improve on its 2014 record or has the Gathbandhan dampened the mood?\",\"date\":\"2019-04-27 19:22:00\",\"tags\":\"\\u0926\\u0947\\u0936\",\"state\":\"Uttar Pradesh\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"891\"}'),
(1556531308734, 'test 29-4', 'hello', '', '', 'Mumbai, National', '', 'newtag', 'Bollywood,National', NULL, '2019-04-29 15:18:28', '24', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556531308734/1556531308734.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556531308734/1556531308734.json', '', '', '', 'en', '2019-04-29 15:18:28', 'admin', NULL, '', 'N', NULL, '{\"id\":1556531308734,\"title\":\"test 29-4\",\"short_description\":\"hello\",\"long_description\":\"\",\"date\":\"2019-04-29 15:18:28\",\"tags\":\"newtag,Bollywood,National\",\"state\":\"Mumbai, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"24\"}'),
(1556532952611, '#ElectionsWithVikram: What\'s on today\'s show', 'It\'s phase 4 of elections today.. and as Mumbai votes.. Vikram Chandra and editorji decode what Maximum City Kya Mangta...', 'It\'s phase 4 of elections today.. and as Mumbai votes.. Vikram Chandra and editorji decode what Maximum City Kya Mangta...', '', 'Maharashtra, National', '', '', 'National', NULL, '2019-04-29 15:45:52', '14', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556532952611/1556532952611.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556532952611/1556532952611.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556532952611/1556532952611_landscape.jpg', '', '', 'en', '2019-04-29 15:45:52', 'Abhimanyu', NULL, '', 'N', NULL, '{\"id\":1556532952611,\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"short_description\":\"It\'s phase 4 of elections today.. and as Mumbai votes.. Vikram Chandra and editorji decode what Maximum City Kya Mangta...\",\"long_description\":\"It\'s phase 4 of elections today.. and as Mumbai votes.. Vikram Chandra and editorji decode what Maximum City Kya Mangta...\",\"date\":\"2019-04-29 15:45:52\",\"tags\":\"National\",\"state\":\"Maharashtra, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"14\"}'),
(1556533137121, 'इलेक्शन विक्रम के साथ', 'चौथे चरण का रण - भाजपा की क्या है चुनौती, क्यों दबाव में कांग्रेस ?', 'चौथे चरण का रण - भाजपा की क्या है चुनौती, क्यों दबाव में कांग्रेस ?', '', 'Maharashtra', '', '', 'देश', NULL, '2019-04-29 15:48:57', '20', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556533137121/1556533137121.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556533137121/1556533137121.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556533137121/1556533137121_landscape.jpg', '', '', 'hi', '2019-04-29 15:48:57', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556533137121,\"title\":\"\\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925\",\"short_description\":\"\\u091a\\u094c\\u0925\\u0947 \\u091a\\u0930\\u0923 \\u0915\\u093e \\u0930\\u0923 - \\u092d\\u093e\\u091c\\u092a\\u093e \\u0915\\u0940 \\u0915\\u094d\\u092f\\u093e \\u0939\\u0948 \\u091a\\u0941\\u0928\\u094c\\u0924\\u0940, \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0926\\u092c\\u093e\\u0935 \\u092e\\u0947\\u0902 \\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 ?\",\"long_description\":\"\\u091a\\u094c\\u0925\\u0947 \\u091a\\u0930\\u0923 \\u0915\\u093e \\u0930\\u0923 - \\u092d\\u093e\\u091c\\u092a\\u093e \\u0915\\u0940 \\u0915\\u094d\\u092f\\u093e \\u0939\\u0948 \\u091a\\u0941\\u0928\\u094c\\u0924\\u0940, \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0926\\u092c\\u093e\\u0935 \\u092e\\u0947\\u0902 \\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 ?\",\"date\":\"2019-04-29 15:48:57\",\"tags\":\"\\u0926\\u0947\\u0936\",\"state\":\"Maharashtra\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"20\"}'),
(1556540519374, '#ElectionsWithVikram: Neta Speak', 'As Mumbai votes, Congress\' Mumbai South candidate Milind Deora, speaks to Vikram Chandra', 'As Mumbai votes, Congress\' Mumbai South candidate Milind Deora, speaks to Vikram Chandra', '', 'Maharashtra, National', '', '', 'National', NULL, '2019-04-29 17:51:59', '366', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556540519374/1556540519374.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556540519374/1556540519374.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556540519374/1556540519374_landscape.jpg', '', '', 'en', '2019-04-29 17:51:59', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556540519374,\"title\":\"#ElectionsWithVikram: Neta Speak\",\"short_description\":\"As Mumbai votes, Congress\' Mumbai South candidate Milind Deora, speaks to Vikram Chandra\",\"long_description\":\"As Mumbai votes, Congress\' Mumbai South candidate Milind Deora, speaks to Vikram Chandra\",\"date\":\"2019-04-29 17:51:59\",\"tags\":\"National\",\"state\":\"Maharashtra, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"366\"}'),
(1556541253164, '#ElectionsWithVikram: Neta Speak', 'BJP leader Shaina NC tells editorji in an exclusive interview, that the BJP will get a clear mandate. On the love-hate relationship between the Sena and the BJP, she added that there\'s infighting in every family, but the alliance is rock solid.', 'BJP leader Shaina NC tells editorji in an exclusive interview, that the BJP will get a clear mandate. On the love-hate relationship between the Sena and the BJP, she added that there\'s infighting in every family, but the alliance is rock solid.', '', 'Maharashtra, National', '', '', 'National', NULL, '2019-04-29 18:04:13', '421', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556541253164/1556541253164.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556541253164/1556541253164.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556541253164/1556541253164_landscape.jpg', '', '', 'en', '2019-04-29 18:04:13', 'srinwanti', NULL, '', 'N', NULL, '{\"id\":1556541253164,\"title\":\"#ElectionsWithVikram: Neta Speak\",\"short_description\":\"BJP leader Shaina NC tells editorji in an exclusive interview, that the BJP will get a clear mandate. On the love-hate relationship between the Sena and the BJP, she added that there\'s infighting in every family, but the alliance is rock solid.\",\"long_description\":\"BJP leader Shaina NC tells editorji in an exclusive interview, that the BJP will get a clear mandate. On the love-hate relationship between the Sena and the BJP, she added that there\'s infighting in every family, but the alliance is rock solid.\",\"date\":\"2019-04-29 18:04:13\",\"tags\":\"National\",\"state\":\"Maharashtra, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"421\"}'),
(1556541466207, '#ElectionsWithVikram: Neta Speak', 'कांग्रेस नेता मिलिंद देवड़ा से खास बातचीत ', 'कांग्रेस नेता मिलिंद देवड़ा से खास बातचीत ', '', 'Maharashtra', '', '', 'देश', NULL, '2019-04-29 18:07:46', '258', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556541466207/1556541466207.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556541466207/1556541466207.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556541466207/1556541466207_landscape.jpg', '', '', 'hi', '2019-04-29 18:07:46', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556541466207,\"title\":\"#ElectionsWithVikram: Neta Speak\",\"short_description\":\"\\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0928\\u0947\\u0924\\u093e \\u092e\\u093f\\u0932\\u093f\\u0902\\u0926 \\u0926\\u0947\\u0935\\u0921\\u093c\\u093e \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"long_description\":\"\\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0928\\u0947\\u0924\\u093e \\u092e\\u093f\\u0932\\u093f\\u0902\\u0926 \\u0926\\u0947\\u0935\\u0921\\u093c\\u093e \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"date\":\"2019-04-29 18:07:46\",\"tags\":\"\\u0926\\u0947\\u0936\",\"state\":\"Maharashtra\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"258\"}'),
(1556551837770, 'चुनाव स्पेशल- विक्रम के साथ ', 'क्या भाजपा बचा पाएगी अपना किला?', '', '', 'Maharashtra', '', '', 'देश', NULL, '2019-04-29 21:00:37', '1591', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556551837770/1556551837770.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556551837770/1556551837770.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556551837770/1556551837770_landscape.PNG', '', '', 'hi', '2019-04-29 21:00:37', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556551837770,\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"short_description\":\"\\u0915\\u094d\\u092f\\u093e \\u092d\\u093e\\u091c\\u092a\\u093e \\u092c\\u091a\\u093e \\u092a\\u093e\\u090f\\u0917\\u0940 \\u0905\\u092a\\u0928\\u093e \\u0915\\u093f\\u0932\\u093e?\",\"long_description\":\"\",\"date\":\"2019-04-29 21:00:37\",\"tags\":\"\\u0926\\u0947\\u0936\",\"state\":\"Maharashtra\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"1591\"}'),
(1556553059257, 'चुनाव स्पेशल- विक्रम के साथ ', 'क्या भाजपा बचा पाएगी अपना किला?', '', '', 'Maharashtra', '', '', 'देश', NULL, '2019-04-29 21:20:59', '1591', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556553059257/1556553059257.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556553059257/1556553059257.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556553059257/1556553059257_landscape.PNG', '', '', 'hi', '2019-04-29 21:20:59', 'vasudha', NULL, '', 'N', NULL, '{\"id\":1556553059257,\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"short_description\":\"\\u0915\\u094d\\u092f\\u093e \\u092d\\u093e\\u091c\\u092a\\u093e \\u092c\\u091a\\u093e \\u092a\\u093e\\u090f\\u0917\\u0940 \\u0905\\u092a\\u0928\\u093e \\u0915\\u093f\\u0932\\u093e?\",\"long_description\":\"\",\"date\":\"2019-04-29 21:20:59\",\"tags\":\"\\u0926\\u0947\\u0936\",\"state\":\"Maharashtra\",\"genres\":\"ELECTIONS\",\"languages\":\"hi\",\"duration\":\"1591\"}'),
(1556555863431, '#ElectionsWithVikram: The \'Maha\' Battle ', 'As Maharashtra votes, Vikram Chandra and editorji travel to Mumbai. We catch up with Congress\' Milind Deora who is confident that Congress can turn the tide. Also BJP\'s Shaina NC says anti-incumbency is not an issue in Maharashtra, it\'s \'pro-incumbency\' here.', 'As Maharashtra votes, Vikram Chandra and editorji travel to Mumbai. We catch up with Congress\' Milind Deora who is confident that Congress can turn the tide. Also BJP\'s Shaina NC says anti-incumbency is not an issue in Maharashtra, it\'s \'pro-incumbency\' here.', '', 'Maharashtra, National', '', '', 'National', NULL, '2019-04-29 22:07:43', '1543', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556555863431/1556555863431.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556555863431/1556555863431.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/demo/2019-04-29/1556555863431/1556555863431_landscape.PNG', '', '', 'en', '2019-04-29 22:07:43', 'admin', NULL, '', 'N', NULL, '{\"id\":1556555863431,\"title\":\"#ElectionsWithVikram: The \'Maha\' Battle \",\"short_description\":\"As Maharashtra votes, Vikram Chandra and editorji travel to Mumbai. We catch up with Congress\' Milind Deora who is confident that Congress can turn the tide. Also BJP\'s Shaina NC says anti-incumbency is not an issue in Maharashtra, it\'s \'pro-incumbency\' here.\",\"long_description\":\"As Maharashtra votes, Vikram Chandra and editorji travel to Mumbai. We catch up with Congress\' Milind Deora who is confident that Congress can turn the tide. Also BJP\'s Shaina NC says anti-incumbency is not an issue in Maharashtra, it\'s \'pro-incumbency\' here.\",\"date\":\"2019-04-29 22:07:43\",\"tags\":\"National\",\"state\":\"Maharashtra, National\",\"genres\":\"ELECTIONS\",\"languages\":\"en\",\"duration\":\"1543\"}'),
(1556619923636, '#ElectionsWithVikram: What\'s on today\'s show', 'Catch the latest episode of election express with editorji\'s Vikram Chandra, to watch a special analysis of Lok Sabha elections in Haryana, Punjab and Himachal Pradesh', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '17', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556619923636/1556619923636.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556619923636/1556619923636.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556619923636/1556619923636_landscape.jpg', '', '', 'en', '2019-04-30 15:55:23', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"Catch the latest episode of election express with editorji\'s Vikram Chandra, to watch a special analysis of Lok Sabha elections in Haryana, Punjab and Himachal Pradesh\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"languages\":\"en\",\"duration\":17,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-04-30\\/1556619923636\\/1556619923636_landscape.jpg\"}]}}'),
(1556620003330, 'चुनाव स्पेशल - विक्रम चंद्रा के साथ ', 'क्या फिर खिलेगा \'कमल\', या मजबूत होगा \'हाथ\'? पंजाब, हरियाणा और हिमाचल का चुनावी रण \r\n\r\n', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '17', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556620003330/1556620003330.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556620003330/1556620003330.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556620003330/1556620003330_landscape.jpg', '', '', 'hi', '2019-04-30 15:56:43', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 - \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"description\":\"\\u0915\\u094d\\u092f\\u093e \\u092b\\u093f\\u0930 \\u0916\\u093f\\u0932\\u0947\\u0917\\u093e \'\\u0915\\u092e\\u0932\', \\u092f\\u093e \\u092e\\u091c\\u092c\\u0942\\u0924 \\u0939\\u094b\\u0917\\u093e \'\\u0939\\u093e\\u0925\'? \\u092a\\u0902\\u091c\\u093e\\u092c, \\u0939\\u0930\\u093f\\u092f\\u093e\\u0923\\u093e \\u0914\\u0930 \\u0939\\u093f\\u092e\\u093e\\u091a\\u0932 \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u0930\\u0923 \\r\\n\\r\\n\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"languages\":\"hi\",\"duration\":17,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-04-30\\/1556620003330\\/1556620003330_landscape.jpg\"}]}}'),
(1556621668567, '#ElectionsWithVikram: What\'s on today\'s show', 'Watch the latest analysis on Lok Sabha elections in Punjab, Haryana and Himachal Pradesh with editorji only on Airtel TV', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '17', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556621668567/1556621668567.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556621668567/1556621668567.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556621668567/1556621668567_landscape.jpg', '', '', 'en', '2019-04-30 16:24:28', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"Watch the latest analysis on Lok Sabha elections in Punjab, Haryana and Himachal Pradesh with editorji only on Airtel TV\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":17,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-04-30\\/1556621668567\\/1556621668567_landscape.jpg\"}]}}'),
(1556621837831, 'चुनाव स्पेशल - विक्रम चंद्रा के साथ ', 'क्या फिर खिलेगा \'कमल\', या मजबूत होगा \'हाथ\'? पंजाब, हरियाणा और हिमाचल का चुनावी रण ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '17', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556621837831/1556621837831.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556621837831/1556621837831.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556621837831/1556621837831_landscape.jpg', '', '', 'hi', '2019-04-30 16:27:17', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 - \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"description\":\"\\u0915\\u094d\\u092f\\u093e \\u092b\\u093f\\u0930 \\u0916\\u093f\\u0932\\u0947\\u0917\\u093e \'\\u0915\\u092e\\u0932\', \\u092f\\u093e \\u092e\\u091c\\u092c\\u0942\\u0924 \\u0939\\u094b\\u0917\\u093e \'\\u0939\\u093e\\u0925\'? \\u092a\\u0902\\u091c\\u093e\\u092c, \\u0939\\u0930\\u093f\\u092f\\u093e\\u0923\\u093e \\u0914\\u0930 \\u0939\\u093f\\u092e\\u093e\\u091a\\u0932 \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u0930\\u0923 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":17,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-04-30\\/1556621837831\\/1556621837831_landscape.jpg\"}]}}'),
(1556632814015, '#ElectionsWithVikram: The Haryana Heartland', 'Vikram Chandra and editorji travels to the Haryana heartland to understand the issues that will determine their vote. While the Jat Vs Non-Jat votes has become the defining feature of the state politics here, can PM Modi recreate the 2014 magic?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1489', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556632814015/1556632814015.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556632814015/1556632814015.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556632814015/1556632814015_landscape.jpg', '', '', 'en', '2019-04-30 19:30:14', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Haryana Heartland\",\"description\":\"Vikram Chandra and editorji travels to the Haryana heartland to understand the issues that will determine their vote. While the Jat Vs Non-Jat votes has become the defining feature of the state politics here, can PM Modi recreate the 2014 magic?\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1489,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-04-30\\/1556632814015\\/1556632814015_landscape.jpg\"}]}}'),
(1556643724174, 'विक्रम के साथ देखें चुनाव 2019 ', 'BJP का घोषणापत्र, उसपर वोटरों की राय... और भी बहुत कुछ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1623', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556643724174/1556643724174.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556643724174/1556643724174.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-04-30/1556643724174/1556643724174_landscape.jpg', '', '', 'hi', '2019-04-30 22:32:04', 'admin', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0926\\u0947\\u0916\\u0947\\u0902 \\u091a\\u0941\\u0928\\u093e\\u0935 2019 \",\"description\":\"BJP \\u0915\\u093e \\u0918\\u094b\\u0937\\u0923\\u093e\\u092a\\u0924\\u094d\\u0930, \\u0909\\u0938\\u092a\\u0930 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0930\\u093e\\u092f... \\u0914\\u0930 \\u092d\\u0940 \\u092c\\u0939\\u0941\\u0924 \\u0915\\u0941\\u091b\",\"tags\":[\"\\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1623,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-04-30\\/1556643724174\\/1556643724174_landscape.jpg\"}]}}'),
(1556699755788, 'A Special Interview with Piyush Goyal ', 'In our fourth episode of Twitter Dialogues, Union Minister Piyush Goyal was confident that the BJP will get a majority in Lok Sabha elections. Slamming the opposition he said, the people of India don\'t want a jamboree they want decisive leaders.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1335', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556699755788/1556699755788.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556699755788/1556699755788.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556699755788/1556699755788_landscape.jpg', '', '', 'en', '2019-05-01 08:35:55', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"A Special Interview with Piyush Goyal \",\"description\":\"In our fourth episode of Twitter Dialogues, Union Minister Piyush Goyal was confident that the BJP will get a majority in Lok Sabha elections. Slamming the opposition he said, the people of India don\'t want a jamboree they want decisive leaders.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1335,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556699755788\\/1556699755788_landscape.jpg\"}]}}'),
(1556700908116, 'A Special Interview with Piyush Goyal', 'In our fourth episode of Twitter Dialogues, Union Minister Piyush Goyal was confident that the BJP will get a majority in Lok Sabha elections. Slamming the opposition he said, the people of India don\'t want a jamboree they want decisive leaders.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1335', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556700908116/1556700908116.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556700908116/1556700908116.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556700908116/1556700908116_landscape.jpg', '', '', 'en', '2019-05-01 08:55:08', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"A Special Interview with Piyush Goyal\",\"description\":\"In our fourth episode of Twitter Dialogues, Union Minister Piyush Goyal was confident that the BJP will get a majority in Lok Sabha elections. Slamming the opposition he said, the people of India don\'t want a jamboree they want decisive leaders.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1335,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556700908116\\/1556700908116_landscape.jpg\"}]}}'),
(1556701462391, 'A Special Interview with Piyush Goyal ', 'In our fourth episode of Twitter Dialogues, Union Minister Piyush Goyal was confident that the BJP will get a majority in Lok Sabha elections. Slamming the opposition he said, the people of India don\'t want a jamboree they want decisive leaders.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1332', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556701462391/1556701462391.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556701462391/1556701462391.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556701462391/1556701462391_landscape.jpg', '', '', 'hi', '2019-05-01 09:04:22', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"A Special Interview with Piyush Goyal \",\"description\":\"In our fourth episode of Twitter Dialogues, Union Minister Piyush Goyal was confident that the BJP will get a majority in Lok Sabha elections. Slamming the opposition he said, the people of India don\'t want a jamboree they want decisive leaders.\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1332,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556701462391\\/1556701462391_landscape.jpg\"}]}}'),
(1556706749641, '#ElectionsWithVikram: What\'s on today\'s show', 'We at editorji are travelling thousands of kilometers to bring you a sense of elections in India, watch all the latest news on your Airtel TV', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '14', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556706749641/1556706749641.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556706749641/1556706749641.json', '', '', '', 'en', '2019-05-01 10:32:29', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"We at editorji are travelling thousands of kilometers to bring you a sense of elections in India, watch all the latest news on your Airtel TV\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":14}'),
(1556706886260, '#ElectionsWithVikram: What\'s on today\'s show', 'We at editorji are travelling thousands of kilometers to bring you a sense of elections in India, watch all the latest news on your Airtel TV', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '14', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556706886260/1556706886260.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556706886260/1556706886260.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556706886260/1556706886260_landscape.jpg', '', '', 'en', '2019-05-01 10:34:46', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"We at editorji are travelling thousands of kilometers to bring you a sense of elections in India, watch all the latest news on your Airtel TV\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":14,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556706886260\\/1556706886260_landscape.jpg\"}]}}'),
(1556707432350, 'चुनाव स्पेशल ... आज वारणसी से ', 'क्या है पीएम मोदी के क्षेत्र का मिजाज ?\r\nमोदी के खिलाफ मैदान में कौन ठोक रहा ताल ? \r\nचुनाव स्पेशल में आज... वाराणसी की सियासी बयार ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '19', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556707432350/1556707432350.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556707432350/1556707432350.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556707432350/1556707432350_landscape.jpg', '', '', 'hi', '2019-05-01 10:43:52', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 ... \\u0906\\u091c \\u0935\\u093e\\u0930\\u0923\\u0938\\u0940 \\u0938\\u0947 \",\"description\":\"\\u0915\\u094d\\u092f\\u093e \\u0939\\u0948 \\u092a\\u0940\\u090f\\u092e \\u092e\\u094b\\u0926\\u0940 \\u0915\\u0947 \\u0915\\u094d\\u0937\\u0947\\u0924\\u094d\\u0930 \\u0915\\u093e \\u092e\\u093f\\u091c\\u093e\\u091c ?\\r\\n\\u092e\\u094b\\u0926\\u0940 \\u0915\\u0947 \\u0916\\u093f\\u0932\\u093e\\u092b \\u092e\\u0948\\u0926\\u093e\\u0928 \\u092e\\u0947\\u0902 \\u0915\\u094c\\u0928 \\u0920\\u094b\\u0915 \\u0930\\u0939\\u093e \\u0924\\u093e\\u0932 ? \\r\\n\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c... \\u0935\\u093e\\u0930\\u093e\\u0923\\u0938\\u0940 \\u0915\\u0940 \\u0938\\u093f\\u092f\\u093e\\u0938\\u0940 \\u092c\\u092f\\u093e\\u0930 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":19,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556707432350\\/1556707432350_landscape.jpg\"}]}}'),
(1556711097228, 'An exclusive interview with SP\'s Tej Bahadur Yadav', 'He was the surprise entry into the Varanasi battleground. But with the Election Commission cancelling the nomination of ex-BSF jawan Tej Bahadur Yadav, everyone wants to know what next.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '243', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556711097228/1556711097228.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556711097228/1556711097228.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556711097228/1556711097228_landscape.jpg', '', '', 'en', '2019-05-01 11:44:57', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"An exclusive interview with SP\'s Tej Bahadur Yadav\",\"description\":\"He was the surprise entry into the Varanasi battleground. But with the Election Commission cancelling the nomination of ex-BSF jawan Tej Bahadur Yadav, everyone wants to know what next.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":243,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556711097228\\/1556711097228_landscape.jpg\"}]}}'),
(1556716303233, 'Will Ajay Rai be Varanasi\'s giant killer?', 'Vikram Chandra and editorji catch up with Congress\' candidate from Varanasi - Ajay Rai.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '0', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556716303233/1556716303233.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556716303233/1556716303233.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556716303233/1556716303233_landscape.jpg', '', '', 'en', '2019-05-01 13:11:43', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"Will Ajay Rai be Varanasi\'s giant killer?\",\"description\":\"Vikram Chandra and editorji catch up with Congress\' candidate from Varanasi - Ajay Rai.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":0,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556716303233\\/1556716303233_landscape.jpg\"}]}}'),
(1556716421254, '#ElectionsWithVikram: Varanasi End Game', 'As we edge closer to the battle for Varanasi, Editorji lines up all the players who want to take on what many say is an invincible Prime Minister Narendra Modi. Can the Congress\' Ajay Rai be a giant killer? Can ex-BSF jawan Tej Bahadur Yadav get past the poll panel to enter the fray?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1261', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556716421254/1556716421254.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556716421254/1556716421254.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556716421254/1556716421254_landscape.jpg', '', '', 'en', '2019-05-01 13:13:41', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Varanasi End Game\",\"description\":\"As we edge closer to the battle for Varanasi, Editorji lines up all the players who want to take on what many say is an invincible Prime Minister Narendra Modi. Can the Congress\' Ajay Rai be a giant killer? Can ex-BSF jawan Tej Bahadur Yadav get past the poll panel to enter the fray?\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1261,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556716421254\\/1556716421254_landscape.jpg\"}]}}'),
(1556717268475, '# पीएम मोदी के सामने फिर अजय राय ', 'कांग्रेस उम्मीदवार अजय राय से खास बात', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '273', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556717268475/1556717268475.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556717268475/1556717268475.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556717268475/1556717268475_landscape.jpg', '', '', 'hi', '2019-05-01 13:27:48', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"# \\u092a\\u0940\\u090f\\u092e \\u092e\\u094b\\u0926\\u0940 \\u0915\\u0947 \\u0938\\u093e\\u092e\\u0928\\u0947 \\u092b\\u093f\\u0930 \\u0905\\u091c\\u092f \\u0930\\u093e\\u092f \",\"description\":\"\\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0909\\u092e\\u094d\\u092e\\u0940\\u0926\\u0935\\u093e\\u0930 \\u0905\\u091c\\u092f \\u0930\\u093e\\u092f \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":273,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556717268475\\/1556717268475_landscape.jpg\"}]}}');
INSERT INTO `airtel_video` (`video_id`, `video_name`, `video_short_description`, `video_long_description`, `category_name`, `video_state`, `video_location`, `video_tags`, `more_tags`, `genres`, `video_date`, `video_duration`, `video_url`, `file_url`, `landscape_img`, `portrait_img`, `banner_img`, `video_languages`, `video_created_date`, `video_created_by`, `video_updated_date`, `video_updated_by`, `is_deleted`, `video_deleted_by`, `json_data`) VALUES
(1556719247161, '# तेज बहादुर से editorji की EXCLUSIVE बातचीत', 'editorji से खास बातचीत में तेज बहादुर ने कहा: मुझसे डर गए हैं मोदी-शाह!', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '507', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556719247161/1556719247161.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556719247161/1556719247161.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556719247161/1556719247161_landscape.jpg', '', '', 'hi', '2019-05-01 14:00:47', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"# \\u0924\\u0947\\u091c \\u092c\\u0939\\u093e\\u0926\\u0941\\u0930 \\u0938\\u0947 editorji \\u0915\\u0940 EXCLUSIVE \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924\",\"description\":\"editorji \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \\u092e\\u0947\\u0902 \\u0924\\u0947\\u091c \\u092c\\u0939\\u093e\\u0926\\u0941\\u0930 \\u0928\\u0947 \\u0915\\u0939\\u093e: \\u092e\\u0941\\u091d\\u0938\\u0947 \\u0921\\u0930 \\u0917\\u090f \\u0939\\u0948\\u0902 \\u092e\\u094b\\u0926\\u0940-\\u0936\\u093e\\u0939!\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":507,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556719247161\\/1556719247161_landscape.jpg\"}]}}'),
(1556720593193, 'विक्रम के साथ देखें चुनाव 2019 ', 'BJP का घोषणापत्र, उसपर वोटरों की राय... और भी बहुत कुछ ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1668', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556720593193/1556720593193.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556720593193/1556720593193.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-01/1556720593193/1556720593193_landscape.jpg', '', '', 'hi', '2019-05-01 14:23:13', 'Ravinder', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0926\\u0947\\u0916\\u0947\\u0902 \\u091a\\u0941\\u0928\\u093e\\u0935 2019 \",\"description\":\"BJP \\u0915\\u093e \\u0918\\u094b\\u0937\\u0923\\u093e\\u092a\\u0924\\u094d\\u0930, \\u0909\\u0938\\u092a\\u0930 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0930\\u093e\\u092f... \\u0914\\u0930 \\u092d\\u0940 \\u092c\\u0939\\u0941\\u0924 \\u0915\\u0941\\u091b \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1668,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-01\\/1556720593193\\/1556720593193_landscape.jpg\"}]}}'),
(1556790992955, '#ElectionsWithVikram: What\'s on today\'s show', 'On today\'s show we feature on South Delhi, we will meet all the candidates today- BJP\'s Ramesh Bhiduri, Congress\' Vijender Singh and AAP\'s Raghav Chadha. All this and more on today\'s Election Express.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '19', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556790992955/1556790992955.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556790992955/1556790992955.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556790992955/1556790992955_landscape.jpg', '', '', 'en', '2019-05-02 09:56:32', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"On today\'s show we feature on South Delhi, we will meet all the candidates today- BJP\'s Ramesh Bhiduri, Congress\' Vijender Singh and AAP\'s Raghav Chadha. All this and more on today\'s Election Express.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":19,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556790992955\\/1556790992955_landscape.jpg\"}]}}'),
(1556791145128, 'चुनाव स्पेशल में आज देखिए दिल्ली का दंगल ', 'राजधानी के रण का क्या है सियासी रंग ?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '24', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556791145128/1556791145128.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556791145128/1556791145128.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556791145128/1556791145128_landscape.jpg', '', '', 'hi', '2019-05-02 09:59:05', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c \\u0926\\u0947\\u0916\\u093f\\u090f \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0915\\u093e \\u0926\\u0902\\u0917\\u0932 \",\"description\":\"\\u0930\\u093e\\u091c\\u0927\\u093e\\u0928\\u0940 \\u0915\\u0947 \\u0930\\u0923 \\u0915\\u093e \\u0915\\u094d\\u092f\\u093e \\u0939\\u0948 \\u0938\\u093f\\u092f\\u093e\\u0938\\u0940 \\u0930\\u0902\\u0917 ?\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":24,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556791145128\\/1556791145128_landscape.jpg\"}]}}'),
(1556792300754, 'Editorji\'s exclusive interview with AAP\'s Raghav Chadha', 'Raghav Chadha, Aam Aadmi Party\'s candidate from South Delhi constituency, joins us at the Editorji Cafe to talk about elections, alliances and his party\'s chances in the ongoing Lok Sabha elections', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1127', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556792300754/1556792300754.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556792300754/1556792300754.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556792300754/1556792300754_landscape.jpg', '', '', 'en', '2019-05-02 10:18:20', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"Editorji\'s exclusive interview with AAP\'s Raghav Chadha\",\"description\":\"Raghav Chadha, Aam Aadmi Party\'s candidate from South Delhi constituency, joins us at the Editorji Cafe to talk about elections, alliances and his party\'s chances in the ongoing Lok Sabha elections\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1127,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556792300754\\/1556792300754_landscape.jpg\"}]}}'),
(1556796848402, '#editorji Exclusive राघव चड्ढा के साथ', '#editorji Exclusive राघव चड्ढा के साथ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1046', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556796848402/1556796848402.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556796848402/1556796848402.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556796848402/1556796848402_landscape.jpg', '', '', 'hi', '2019-05-02 11:34:08', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#editorji Exclusive \\u0930\\u093e\\u0918\\u0935 \\u091a\\u0921\\u094d\\u0922\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925\",\"description\":\"#editorji Exclusive \\u0930\\u093e\\u0918\\u0935 \\u091a\\u0921\\u094d\\u0922\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1046,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556796848402\\/1556796848402_landscape.jpg\"}]}}'),
(1556797802425, 'Editorji\'s exclusive interview with Congress\'s South Delhi Candidate Vijender Singh', 'Congress\' South Delhi candidate, Vijender Singh talks exclusively to editorji on the ongoing Lok Sabha elections', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '229', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556797802425/1556797802425.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556797802425/1556797802425.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556797802425/1556797802425_landscape.jpg', '', '', 'en', '2019-05-02 11:50:02', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"Editorji\'s exclusive interview with Congress\'s South Delhi Candidate Vijender Singh\",\"description\":\"Congress\' South Delhi candidate, Vijender Singh talks exclusively to editorji on the ongoing Lok Sabha elections\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":229,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556797802425\\/1556797802425_landscape.jpg\"}]}}'),
(1556800668593, 'An exclusive interview with BJP MP Ramesh Bidhuri', 'Editorji catches up with BJP\'s South Delhi Candidate & Sitting MP Ramesh Bidhuri on the campaign trail. And he is  confident that the AAP and Congress are no competition for him.\r\n', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '247', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556800668593/1556800668593.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556800668593/1556800668593.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556800668593/1556800668593_landscape.jpg', '', '', 'en', '2019-05-02 12:37:48', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"An exclusive interview with BJP MP Ramesh Bidhuri\",\"description\":\"Editorji catches up with BJP\'s South Delhi Candidate & Sitting MP Ramesh Bidhuri on the campaign trail. And he is  confident that the AAP and Congress are no competition for him.\\r\\n\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":247,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556800668593\\/1556800668593_landscape.jpg\"}]}}'),
(1556802043691, 'भाजपा नेता रमेश बिधूड़ी से EXCLUSIVE बातचीत ', 'क्या भाजपा दिल्ली को बनाएगी पूर्ण राज्य ? भाजपा सांसद और उम्मीदवार रमेश बिधूड़ी से खास बातचीत\r\n', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '247', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802043691/1556802043691.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802043691/1556802043691.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802043691/1556802043691_landscape.jpg', '', '', 'hi', '2019-05-02 13:00:43', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u092d\\u093e\\u091c\\u092a\\u093e \\u0928\\u0947\\u0924\\u093e \\u0930\\u092e\\u0947\\u0936 \\u092c\\u093f\\u0927\\u0942\\u0921\\u093c\\u0940 \\u0938\\u0947 EXCLUSIVE \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"description\":\"\\u0915\\u094d\\u092f\\u093e \\u092d\\u093e\\u091c\\u092a\\u093e \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0915\\u094b \\u092c\\u0928\\u093e\\u090f\\u0917\\u0940 \\u092a\\u0942\\u0930\\u094d\\u0923 \\u0930\\u093e\\u091c\\u094d\\u092f ? \\u092d\\u093e\\u091c\\u092a\\u093e \\u0938\\u093e\\u0902\\u0938\\u0926 \\u0914\\u0930 \\u0909\\u092e\\u094d\\u092e\\u0940\\u0926\\u0935\\u093e\\u0930 \\u0930\\u092e\\u0947\\u0936 \\u092c\\u093f\\u0927\\u0942\\u0921\\u093c\\u0940 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924\\r\\n\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":247,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556802043691\\/1556802043691_landscape.jpg\"}]}}'),
(1556802216949, '#ElectionsWithVikram: The Bout for the Ballot', 'It\'s a power packed battle for South Delhi this election and editorji catches up with all the players – BJP\'s Ramesh Bidhuri, AAP\'s Raghav Chadha and Congress\' Vijender Singh. Now you decide.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1132', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802216949/1556802216949.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802216949/1556802216949.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802216949/1556802216949_landscape.jpg', '', '', 'en', '2019-05-02 13:03:36', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Bout for the Ballot\",\"description\":\"It\'s a power packed battle for South Delhi this election and editorji catches up with all the players \\u2013 BJP\'s Ramesh Bidhuri, AAP\'s Raghav Chadha and Congress\' Vijender Singh. Now you decide.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1132,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556802216949\\/1556802216949_landscape.jpg\"}]}}'),
(1556802354858, 'कांग्रेस उम्मीदवार विजेंदर से EXCLUSIVE बातचीत ', 'राजनीति के रिंग में क्या लगेगा विजेंदर का पंच ?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '246', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802354858/1556802354858.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802354858/1556802354858.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556802354858/1556802354858_landscape.jpg', '', '', 'hi', '2019-05-02 13:05:54', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0909\\u092e\\u094d\\u092e\\u0940\\u0926\\u0935\\u093e\\u0930 \\u0935\\u093f\\u091c\\u0947\\u0902\\u0926\\u0930 \\u0938\\u0947 EXCLUSIVE \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"description\":\"\\u0930\\u093e\\u091c\\u0928\\u0940\\u0924\\u093f \\u0915\\u0947 \\u0930\\u093f\\u0902\\u0917 \\u092e\\u0947\\u0902 \\u0915\\u094d\\u092f\\u093e \\u0932\\u0917\\u0947\\u0917\\u093e \\u0935\\u093f\\u091c\\u0947\\u0902\\u0926\\u0930 \\u0915\\u093e \\u092a\\u0902\\u091a ?\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":246,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556802354858\\/1556802354858_landscape.jpg\"}]}}'),
(1556803915630, 'विक्रम के साथ देखें चुनाव 2019', 'BJP का घोषणापत्र, उसपर वोटरों की राय... और भी बहुत कुछ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1338', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556803915630/1556803915630.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556803915630/1556803915630.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-02/1556803915630/1556803915630_landscape.jpg', '', '', 'hi', '2019-05-02 13:31:55', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0926\\u0947\\u0916\\u0947\\u0902 \\u091a\\u0941\\u0928\\u093e\\u0935 2019\",\"description\":\"BJP \\u0915\\u093e \\u0918\\u094b\\u0937\\u0923\\u093e\\u092a\\u0924\\u094d\\u0930, \\u0909\\u0938\\u092a\\u0930 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0930\\u093e\\u092f... \\u0914\\u0930 \\u092d\\u0940 \\u092c\\u0939\\u0941\\u0924 \\u0915\\u0941\\u091b\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1338,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-02\\/1556803915630\\/1556803915630_landscape.jpg\"}]}}'),
(1556878956290, '#ElectionsWithVikram: What\'s on today\'s show', 'Watch our special election show with Vikram Chandra, today we focus on Bihar. Are Modi & Nitish a winning combination or uneasy allies?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '15', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556878956290/1556878956290.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556878956290/1556878956290.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556878956290/1556878956290_landscape.jpg', '', '', 'en', '2019-05-03 10:22:36', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"Watch our special election show with Vikram Chandra, today we focus on Bihar. Are Modi & Nitish a winning combination or uneasy allies?\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":15,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-03\\/1556878956290\\/1556878956290_landscape.jpg\"}]}}'),
(1556879034766, 'विक्रम के साथ देखें चुनाव 2019', 'बिहार का सियासी गणित ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '18', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556879034766/1556879034766.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556879034766/1556879034766.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556879034766/1556879034766_landscape.jpg', '', '', 'hi', '2019-05-03 10:23:54', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0926\\u0947\\u0916\\u0947\\u0902 \\u091a\\u0941\\u0928\\u093e\\u0935 2019\",\"description\":\"\\u092c\\u093f\\u0939\\u093e\\u0930 \\u0915\\u093e \\u0938\\u093f\\u092f\\u093e\\u0938\\u0940 \\u0917\\u0923\\u093f\\u0924 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":18,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-03\\/1556879034766\\/1556879034766_landscape.jpg\"}]}}'),
(1556890654297, 'An exclusive interview with Shatrughan Sinha ', 'Congress\' Patna Sahib candidate Shatrughan Sinha speaks to editorji\'s Vikram Chandra.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '715', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556890654297/1556890654297.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556890654297/1556890654297.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556890654297/1556890654297_landscape.jpg', '', '', 'en', '2019-05-03 13:37:34', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"An exclusive interview with Shatrughan Sinha \",\"description\":\"Congress\' Patna Sahib candidate Shatrughan Sinha speaks to editorji\'s Vikram Chandra.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":715,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-03\\/1556890654297\\/1556890654297_landscape.jpg\"}]}}'),
(1556893478070, '#ElectionsWithVikram: The Battle for Bihar', 'As Bihar goes to poll in the next phase we decode if Narendra Modi and Nitish Kumar together are a winning combination or just uneasy allies? Also Vikram Chandra speaks to Shatrughan Sinha as he takes aim at PM Modi and Amit Shah.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1726', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556893478070/1556893478070.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556893478070/1556893478070.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556893478070/1556893478070_landscape.jpg', '', '', 'en', '2019-05-03 14:24:38', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Battle for Bihar\",\"description\":\"As Bihar goes to poll in the next phase we decode if Narendra Modi and Nitish Kumar together are a winning combination or just uneasy allies? Also Vikram Chandra speaks to Shatrughan Sinha as he takes aim at PM Modi and Amit Shah.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1726,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-03\\/1556893478070\\/1556893478070_landscape.jpg\"}]}}'),
(1556895232781, 'शत्रुघ्न सिन्हा से editorji की Exclusive बातचीत ', 'शत्रुघ्न सिन्हा से editorji की Exclusive बातचीत ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '611', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556895232781/1556895232781.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556895232781/1556895232781.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556895232781/1556895232781_landscape.jpg', '', '', 'hi', '2019-05-03 14:53:52', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0936\\u0924\\u094d\\u0930\\u0941\\u0918\\u094d\\u0928 \\u0938\\u093f\\u0928\\u094d\\u0939\\u093e \\u0938\\u0947 editorji \\u0915\\u0940 Exclusive \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"description\":\"\\u0936\\u0924\\u094d\\u0930\\u0941\\u0918\\u094d\\u0928 \\u0938\\u093f\\u0928\\u094d\\u0939\\u093e \\u0938\\u0947 editorji \\u0915\\u0940 Exclusive \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":611,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-03\\/1556895232781\\/1556895232781_landscape.jpg\"}]}}'),
(1556897066072, 'चुनाव स्पेशल: विक्रम चंद्रा के साथ ', 'चुनाव स्पेशल में आज खास नजर होगी बिहार की सियासी बयार पर. बिहार की जंग में कौन जमाएगा रंग ? NDA एक बार फिर मारेगा बाज़ी या फिर गठबंधन करेगा कमाल ? शो में बिहारी बाबू शत्रुघ्न सिन्हा से मोदी, जिन्ना और गठबंधन की उम्मीदों पर होगी खास बातचीत, तो NDA का पक्ष रखेंगे जेडीयू नेता पवन वर्मा. \r\n', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1737', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556897066072/1556897066072.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556897066072/1556897066072.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-03/1556897066072/1556897066072_landscape.jpg', '', '', 'hi', '2019-05-03 15:24:26', 'srinwanti', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932: \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"description\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c \\u0916\\u093e\\u0938 \\u0928\\u091c\\u0930 \\u0939\\u094b\\u0917\\u0940 \\u092c\\u093f\\u0939\\u093e\\u0930 \\u0915\\u0940 \\u0938\\u093f\\u092f\\u093e\\u0938\\u0940 \\u092c\\u092f\\u093e\\u0930 \\u092a\\u0930. \\u092c\\u093f\\u0939\\u093e\\u0930 \\u0915\\u0940 \\u091c\\u0902\\u0917 \\u092e\\u0947\\u0902 \\u0915\\u094c\\u0928 \\u091c\\u092e\\u093e\\u090f\\u0917\\u093e \\u0930\\u0902\\u0917 ? NDA \\u090f\\u0915 \\u092c\\u093e\\u0930 \\u092b\\u093f\\u0930 \\u092e\\u093e\\u0930\\u0947\\u0917\\u093e \\u092c\\u093e\\u091c\\u093c\\u0940 \\u092f\\u093e \\u092b\\u093f\\u0930 \\u0917\\u0920\\u092c\\u0902\\u0927\\u0928 \\u0915\\u0930\\u0947\\u0917\\u093e \\u0915\\u092e\\u093e\\u0932 ? \\u0936\\u094b \\u092e\\u0947\\u0902 \\u092c\\u093f\\u0939\\u093e\\u0930\\u0940 \\u092c\\u093e\\u092c\\u0942 \\u0936\\u0924\\u094d\\u0930\\u0941\\u0918\\u094d\\u0928 \\u0938\\u093f\\u0928\\u094d\\u0939\\u093e \\u0938\\u0947 \\u092e\\u094b\\u0926\\u0940, \\u091c\\u093f\\u0928\\u094d\\u0928\\u093e \\u0914\\u0930 \\u0917\\u0920\\u092c\\u0902\\u0927\\u0928 \\u0915\\u0940 \\u0909\\u092e\\u094d\\u092e\\u0940\\u0926\\u094b\\u0902 \\u092a\\u0930 \\u0939\\u094b\\u0917\\u0940 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924, \\u0924\\u094b NDA \\u0915\\u093e \\u092a\\u0915\\u094d\\u0937 \\u0930\\u0916\\u0947\\u0902\\u0917\\u0947 \\u091c\\u0947\\u0921\\u0940\\u092f\\u0942 \\u0928\\u0947\\u0924\\u093e \\u092a\\u0935\\u0928 \\u0935\\u0930\\u094d\\u092e\\u093e. \\r\\n\",\"tags\":[\"\\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1737,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-03\\/1556897066072\\/1556897066072_landscape.jpg\"}]}}'),
(1556955706249, '#TwitterDialogues कांग्रेस नेता पी चिदंबरम के साथ ', '#TwitterDialogues कांग्रेस नेता पी चिदंबरम के साथ ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1657', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-04/1556955706249/1556955706249.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-04/1556955706249/1556955706249.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-04/1556955706249/1556955706249_landscape.jpg', '', '', 'hi', '2019-05-04 07:41:46', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues \\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0928\\u0947\\u0924\\u093e \\u092a\\u0940 \\u091a\\u093f\\u0926\\u0902\\u092c\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"description\":\"#TwitterDialogues \\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0928\\u0947\\u0924\\u093e \\u092a\\u0940 \\u091a\\u093f\\u0926\\u0902\\u092c\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1657,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-04\\/1556955706249\\/1556955706249_landscape.jpg\"}]}}'),
(1556981919848, '#TwitterDialogues with Congress leader P Chidambaram', 'On #TwitterDialogues, a confident P Chidambaram said, as per his party\'s analysis, the Congress and its allies are ahead of the BJP. He also added that the BJP will lose at least 60 seats, apart from states like Uttar Pradesh.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1657', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-04/1556981919848/1556981919848.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-04/1556981919848/1556981919848.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-04/1556981919848/1556981919848_landscape.jpg', '', '', 'en', '2019-05-04 14:58:39', 'srinwanti', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues with Congress leader P Chidambaram\",\"description\":\"On #TwitterDialogues, a confident P Chidambaram said, as per his party\'s analysis, the Congress and its allies are ahead of the BJP. He also added that the BJP will lose at least 60 seats, apart from states like Uttar Pradesh.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1657,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-04\\/1556981919848\\/1556981919848_landscape.jpg\"}]}}'),
(1557031178812, '#ElectionsWithVikram: The week that was', 'It\'s all you need to know about elections this week. Also senior Congress leader P Chidambaram gives his word there will be no increase in tax burden due to the rollout of NYAY.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1628', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-05/1557031178812/1557031178812.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-05/1557031178812/1557031178812.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-05/1557031178812/1557031178812_landscape.PNG', '', '', 'en', '2019-05-05 04:39:38', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The week that was\",\"description\":\"It\'s all you need to know about elections this week. Also senior Congress leader P Chidambaram gives his word there will be no increase in tax burden due to the rollout of NYAY.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1628,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-05\\/1557031178812\\/1557031178812_landscape.PNG\"}]}}'),
(1557037465101, 'चुनाव स्पेशल - द वीकेंड शो ', 'चुनावी मूड पर दो वित्त मंत्रियों से खास चर्चा ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1978', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-05/1557037465101/1557037465101.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-05/1557037465101/1557037465101.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-05/1557037465101/1557037465101_landscape.PNG', '', '', 'hi', '2019-05-05 06:24:25', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 - \\u0926 \\u0935\\u0940\\u0915\\u0947\\u0902\\u0921 \\u0936\\u094b \",\"description\":\"\\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092e\\u0942\\u0921 \\u092a\\u0930 \\u0926\\u094b \\u0935\\u093f\\u0924\\u094d\\u0924 \\u092e\\u0902\\u0924\\u094d\\u0930\\u093f\\u092f\\u094b\\u0902 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u091a\\u0930\\u094d\\u091a\\u093e \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1978,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-05\\/1557037465101\\/1557037465101_landscape.PNG\"}]}}'),
(1557142335977, '#ElectionsWithVikram: What\'s on today\'s show', 'India votes in Phase 5: We decode the Mamata magic in West Bengal and the Raje factor in Rajasthan', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '14', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557142335977/1557142335977.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557142335977/1557142335977.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557142335977/1557142335977_landscape.jpg', '', '', 'en', '2019-05-06 11:32:15', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"India votes in Phase 5: We decode the Mamata magic in West Bengal and the Raje factor in Rajasthan\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":14,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-06\\/1557142335977\\/1557142335977_landscape.jpg\"}]}}'),
(1557142662369, 'इलेक्शन विक्रम के साथ: पांचवें चरण का मतदान ', 'बंगाल और राजस्थान- क्या फिर चलेगा ममता और मोदी मैजिक ?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '12', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557142662369/1557142662369.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557142662369/1557142662369.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557142662369/1557142662369_landscape.jpg', '', '', 'hi', '2019-05-06 11:37:42', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925: \\u092a\\u093e\\u0902\\u091a\\u0935\\u0947\\u0902 \\u091a\\u0930\\u0923 \\u0915\\u093e \\u092e\\u0924\\u0926\\u093e\\u0928 \",\"description\":\"\\u092c\\u0902\\u0917\\u093e\\u0932 \\u0914\\u0930 \\u0930\\u093e\\u091c\\u0938\\u094d\\u0925\\u093e\\u0928- \\u0915\\u094d\\u092f\\u093e \\u092b\\u093f\\u0930 \\u091a\\u0932\\u0947\\u0917\\u093e \\u092e\\u092e\\u0924\\u093e \\u0914\\u0930 \\u092e\\u094b\\u0926\\u0940 \\u092e\\u0948\\u091c\\u093f\\u0915 ?\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":12,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-06\\/1557142662369\\/1557142662369_landscape.jpg\"}]}}'),
(1557148771285, '#ElectionsWithVikram: India Votes in Phase 5', 'As India votes in phase 5, all eyes are on Amethi, Rae Bareli and Lucknow. Also we decode the Mamata magic in Bengal and the Raje factor in Rajasthan.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '996', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557148771285/1557148771285.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557148771285/1557148771285.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557148771285/1557148771285_landscape.jpg', '', '', 'en', '2019-05-06 13:19:31', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: India Votes in Phase 5\",\"description\":\"As India votes in phase 5, all eyes are on Amethi, Rae Bareli and Lucknow. Also we decode the Mamata magic in Bengal and the Raje factor in Rajasthan.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":996,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-06\\/1557148771285\\/1557148771285_landscape.jpg\"}]}}'),
(1557152277661, 'पांचवें दौर का मतदान पूरा ', 'क्या बीजेपी बचा सकेगी अपनी 40 सीटें ? ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1216', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557152277661/1557152277661.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557152277661/1557152277661.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557152277661/1557152277661_landscape.jpg', '', '', 'hi', '2019-05-06 14:17:57', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"\\u092a\\u093e\\u0902\\u091a\\u0935\\u0947\\u0902 \\u0926\\u094c\\u0930 \\u0915\\u093e \\u092e\\u0924\\u0926\\u093e\\u0928 \\u092a\\u0942\\u0930\\u093e \",\"description\":\"\\u0915\\u094d\\u092f\\u093e \\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \\u092c\\u091a\\u093e \\u0938\\u0915\\u0947\\u0917\\u0940 \\u0905\\u092a\\u0928\\u0940 40 \\u0938\\u0940\\u091f\\u0947\\u0902 ? \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1216,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-06\\/1557152277661\\/1557152277661_landscape.jpg\"}]}}'),
(1557158705552, 'पांचवें दौर का मतदान पूरा ', 'क्या बीजेपी बचा सकेगी अपनी 40 सीटें ? ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1216', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557158705552/1557158705552.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557158705552/1557158705552.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-06/1557158705552/1557158705552_landscape.jpg', '', '', 'hi', '2019-05-06 16:05:05', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"\\u092a\\u093e\\u0902\\u091a\\u0935\\u0947\\u0902 \\u0926\\u094c\\u0930 \\u0915\\u093e \\u092e\\u0924\\u0926\\u093e\\u0928 \\u092a\\u0942\\u0930\\u093e \",\"description\":\"\\u0915\\u094d\\u092f\\u093e \\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \\u092c\\u091a\\u093e \\u0938\\u0915\\u0947\\u0917\\u0940 \\u0905\\u092a\\u0928\\u0940 40 \\u0938\\u0940\\u091f\\u0947\\u0902 ? \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1216,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-06\\/1557158705552\\/1557158705552_landscape.jpg\"}]}}'),
(1557203617352, '#TwitterDialogues with Dr Harsh Vardhan', 'On #TwitterDialogues, Union Minister Dr Harsh Vardhan says he is confident the BJP will get a majority in Delhi, as the work done by his govt has been perceptible and measurable. On the crucial issue of air pollution in the national capital, he said that his govt didn\'t get the desired support from the Delhi govt, but pollution is the top most priority and the govt will do its best to tackle the issue.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1466', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557203617352/1557203617352.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557203617352/1557203617352.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557203617352/1557203617352_landscape.jpg', '', '', 'en', '2019-05-07 04:33:37', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues with Dr Harsh Vardhan\",\"description\":\"On #TwitterDialogues, Union Minister Dr Harsh Vardhan says he is confident the BJP will get a majority in Delhi, as the work done by his govt has been perceptible and measurable. On the crucial issue of air pollution in the national capital, he said that his govt didn\'t get the desired support from the Delhi govt, but pollution is the top most priority and the govt will do its best to tackle the issue.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1466,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557203617352\\/1557203617352_landscape.jpg\"}]}}'),
(1557209086643, '#TwitterDialogues डॉ. हर्षवर्धन के साथ', '#TwitterDialogues में Editorji से बोले हर्षवर्धन... \'अराजक\' CM को कैसे दें पुलिस पावर ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1451', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557209086643/1557209086643.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557209086643/1557209086643.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557209086643/1557209086643_landscape.jpg', '', '', 'hi', '2019-05-07 06:04:46', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues \\u0921\\u0949. \\u0939\\u0930\\u094d\\u0937\\u0935\\u0930\\u094d\\u0927\\u0928 \\u0915\\u0947 \\u0938\\u093e\\u0925\",\"description\":\"#TwitterDialogues \\u092e\\u0947\\u0902 Editorji \\u0938\\u0947 \\u092c\\u094b\\u0932\\u0947 \\u0939\\u0930\\u094d\\u0937\\u0935\\u0930\\u094d\\u0927\\u0928... \'\\u0905\\u0930\\u093e\\u091c\\u0915\' CM \\u0915\\u094b \\u0915\\u0948\\u0938\\u0947 \\u0926\\u0947\\u0902 \\u092a\\u0941\\u0932\\u093f\\u0938 \\u092a\\u093e\\u0935\\u0930 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1451,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557209086643\\/1557209086643_landscape.jpg\"}]}}'),
(1557226419444, 'चुनाव स्पेशल में आज दिल्ली की जंग ', 'राम माधव, आतिशी और डॉ. हर्षवर्धन से खास बातचीत ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '14', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557226419444/1557226419444.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557226419444/1557226419444.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557226419444/1557226419444_landscape.jpg', '', '', 'hi', '2019-05-07 10:53:39', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0915\\u0940 \\u091c\\u0902\\u0917 \",\"description\":\"\\u0930\\u093e\\u092e \\u092e\\u093e\\u0927\\u0935, \\u0906\\u0924\\u093f\\u0936\\u0940 \\u0914\\u0930 \\u0921\\u0949. \\u0939\\u0930\\u094d\\u0937\\u0935\\u0930\\u094d\\u0927\\u0928 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":14,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557226419444\\/1557226419444_landscape.jpg\"}]}}'),
(1557226611650, '#ElectionsWithVikram: What\'s on today\'s show', 'Decoding the Battle for Delhi', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '14', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557226611650/1557226611650.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557226611650/1557226611650.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557226611650/1557226611650_landscape.jpg', '', '', 'en', '2019-05-07 10:56:51', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"Decoding the Battle for Delhi\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":14,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557226611650\\/1557226611650_landscape.jpg\"}]}}'),
(1557236951511, 'राम माधव, आतिशी और डॉ. हर्षवर्धन से खास बातचीत ', 'राजधानी का रण इस बार त्रिकोणीय है, जो दिन ब दिन दिलचस्प होता जा रहा है. दिल्ली के सियासी दंगल का रुख जानने के लिए हमने बात की बीजेपी और आप के दो वरिष्ठ नेताओं से. केंद्रीय मंत्री और वरिष्ठ भाजपा नेता डॉ. हर्षवर्धन ने बताया कि क्यों उनकी पार्टी केजरीवाल सरकार के हाथ में पुलिस पावर नहीं दे सकती. तो वहीं आम आदमी पार्टी की पूर्वी दिल्ली से उम्मीदवार आतिशी ने कहा कि अगर मोदी जीते तो देश कभी राहुल गांधी को माफ नहीं करेगा. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1449', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557236951511/1557236951511.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557236951511/1557236951511.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557236951511/1557236951511_landscape.jpg', '', '', 'hi', '2019-05-07 13:49:11', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0930\\u093e\\u092e \\u092e\\u093e\\u0927\\u0935, \\u0906\\u0924\\u093f\\u0936\\u0940 \\u0914\\u0930 \\u0921\\u0949. \\u0939\\u0930\\u094d\\u0937\\u0935\\u0930\\u094d\\u0927\\u0928 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"description\":\"\\u0930\\u093e\\u091c\\u0927\\u093e\\u0928\\u0940 \\u0915\\u093e \\u0930\\u0923 \\u0907\\u0938 \\u092c\\u093e\\u0930 \\u0924\\u094d\\u0930\\u093f\\u0915\\u094b\\u0923\\u0940\\u092f \\u0939\\u0948, \\u091c\\u094b \\u0926\\u093f\\u0928 \\u092c \\u0926\\u093f\\u0928 \\u0926\\u093f\\u0932\\u091a\\u0938\\u094d\\u092a \\u0939\\u094b\\u0924\\u093e \\u091c\\u093e \\u0930\\u0939\\u093e \\u0939\\u0948. \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0915\\u0947 \\u0938\\u093f\\u092f\\u093e\\u0938\\u0940 \\u0926\\u0902\\u0917\\u0932 \\u0915\\u093e \\u0930\\u0941\\u0916 \\u091c\\u093e\\u0928\\u0928\\u0947 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0939\\u092e\\u0928\\u0947 \\u092c\\u093e\\u0924 \\u0915\\u0940 \\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \\u0914\\u0930 \\u0906\\u092a \\u0915\\u0947 \\u0926\\u094b \\u0935\\u0930\\u093f\\u0937\\u094d\\u0920 \\u0928\\u0947\\u0924\\u093e\\u0913\\u0902 \\u0938\\u0947. \\u0915\\u0947\\u0902\\u0926\\u094d\\u0930\\u0940\\u092f \\u092e\\u0902\\u0924\\u094d\\u0930\\u0940 \\u0914\\u0930 \\u0935\\u0930\\u093f\\u0937\\u094d\\u0920 \\u092d\\u093e\\u091c\\u092a\\u093e \\u0928\\u0947\\u0924\\u093e \\u0921\\u0949. \\u0939\\u0930\\u094d\\u0937\\u0935\\u0930\\u094d\\u0927\\u0928 \\u0928\\u0947 \\u092c\\u0924\\u093e\\u092f\\u093e \\u0915\\u093f \\u0915\\u094d\\u092f\\u094b\\u0902 \\u0909\\u0928\\u0915\\u0940 \\u092a\\u093e\\u0930\\u094d\\u091f\\u0940 \\u0915\\u0947\\u091c\\u0930\\u0940\\u0935\\u093e\\u0932 \\u0938\\u0930\\u0915\\u093e\\u0930 \\u0915\\u0947 \\u0939\\u093e\\u0925 \\u092e\\u0947\\u0902 \\u092a\\u0941\\u0932\\u093f\\u0938 \\u092a\\u093e\\u0935\\u0930 \\u0928\\u0939\\u0940\\u0902 \\u0926\\u0947 \\u0938\\u0915\\u0924\\u0940. \\u0924\\u094b \\u0935\\u0939\\u0940\\u0902 \\u0906\\u092e \\u0906\\u0926\\u092e\\u0940 \\u092a\\u093e\\u0930\\u094d\\u091f\\u0940 \\u0915\\u0940 \\u092a\\u0942\\u0930\\u094d\\u0935\\u0940 \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0938\\u0947 \\u0909\\u092e\\u094d\\u092e\\u0940\\u0926\\u0935\\u093e\\u0930 \\u0906\\u0924\\u093f\\u0936\\u0940 \\u0928\\u0947 \\u0915\\u0939\\u093e \\u0915\\u093f \\u0905\\u0917\\u0930 \\u092e\\u094b\\u0926\\u0940 \\u091c\\u0940\\u0924\\u0947 \\u0924\\u094b \\u0926\\u0947\\u0936 \\u0915\\u092d\\u0940 \\u0930\\u093e\\u0939\\u0941\\u0932 \\u0917\\u093e\\u0902\\u0927\\u0940 \\u0915\\u094b \\u092e\\u093e\\u092b \\u0928\\u0939\\u0940\\u0902 \\u0915\\u0930\\u0947\\u0917\\u093e. \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1449,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557236951511\\/1557236951511_landscape.jpg\"}]}}'),
(1557237567589, '#ElectionsWithVikram: Capital Fight', 'Days ahead of the May 12 vote, we decode the battle for Delhi. Will the Cong, AAP divide help the BJP? We also speak to AAP\'s Atishi who is straight up in her assertion - “History will not forgive Rahul Gandhi if Modi comes back to power”.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1680', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557237567589/1557237567589.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557237567589/1557237567589.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557237567589/1557237567589_landscape.jpg', '', '', 'en', '2019-05-07 13:59:27', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Capital Fight\",\"description\":\"Days ahead of the May 12 vote, we decode the battle for Delhi. Will the Cong, AAP divide help the BJP? We also speak to AAP\'s Atishi who is straight up in her assertion - \\u201cHistory will not forgive Rahul Gandhi if Modi comes back to power\\u201d.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1680,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557237567589\\/1557237567589_landscape.jpg\"}]}}');
INSERT INTO `airtel_video` (`video_id`, `video_name`, `video_short_description`, `video_long_description`, `category_name`, `video_state`, `video_location`, `video_tags`, `more_tags`, `genres`, `video_date`, `video_duration`, `video_url`, `file_url`, `landscape_img`, `portrait_img`, `banner_img`, `video_languages`, `video_created_date`, `video_created_by`, `video_updated_date`, `video_updated_by`, `is_deleted`, `video_deleted_by`, `json_data`) VALUES
(1557240568390, '#ElectionsWithVikram: Capital Fight', 'Days ahead of the May 12 vote, we decode the battle for Delhi. Will the Cong, AAP divide help the BJP? We also speak to AAP\'s Atishi who is straight up in her assertion - “History will not forgive Rahul Gandhi if Modi comes back to power”.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1681', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557240568390/1557240568390.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557240568390/1557240568390.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-07/1557240568390/1557240568390_landscape.jpg', '', '', 'en', '2019-05-07 14:49:28', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Capital Fight\",\"description\":\"Days ahead of the May 12 vote, we decode the battle for Delhi. Will the Cong, AAP divide help the BJP? We also speak to AAP\'s Atishi who is straight up in her assertion - \\u201cHistory will not forgive Rahul Gandhi if Modi comes back to power\\u201d.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1681,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-07\\/1557240568390\\/1557240568390_landscape.jpg\"}]}}'),
(1557297767524, 'चुनाव स्पेशल में आज दिल्ली की जंग ', 'राम माधव, आतिशी और डॉ. हर्षवर्धन से खास बातचीत', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1449', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557297767524/1557297767524.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557297767524/1557297767524.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557297767524/1557297767524_landscape.jpg', '', '', 'hi', '2019-05-08 06:42:47', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0915\\u0940 \\u091c\\u0902\\u0917 \",\"description\":\"\\u0930\\u093e\\u092e \\u092e\\u093e\\u0927\\u0935, \\u0906\\u0924\\u093f\\u0936\\u0940 \\u0914\\u0930 \\u0921\\u0949. \\u0939\\u0930\\u094d\\u0937\\u0935\\u0930\\u094d\\u0927\\u0928 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1449,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-08\\/1557297767524\\/1557297767524_landscape.jpg\"}]}}'),
(1557331271094, '#ElectionsWithVikram: Vikas vs NYAY ', 'Ahead of the final two phases of voting, editorji brings you a special episode from Varanasi. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1668', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557331271094/1557331271094.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557331271094/1557331271094.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557331271094/1557331271094_landscape.jpg', '', '', 'en', '2019-05-08 16:01:11', 'admin', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Vikas vs NYAY \",\"description\":\"Ahead of the final two phases of voting, editorji brings you a special episode from Varanasi. \",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1668,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-08\\/1557331271094\\/1557331271094_landscape.jpg\"}]}}'),
(1557334261351, 'विक्रम चंद्रा के साथ वाराणसी से देखिए ... चुनाव स्पेशल ', 'वाराणसी में पीएम मोदी के रोड शो से ही काशी मोदीमय है, पर क्या बस यही हकीकत है? कितना अंतर है शहर और गांव के वोटरों की सोच में? जमीन पर गठबंधन का कितना है असर? तमाम मुद्दों पर वाराणसी से देखिए editorji की ये खास पेशकश ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1541', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557334261351/1557334261351.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557334261351/1557334261351.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-08/1557334261351/1557334261351_landscape.jpg', '', '', 'en', '2019-05-08 16:51:01', 'admin', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0935\\u093e\\u0930\\u093e\\u0923\\u0938\\u0940 \\u0938\\u0947 \\u0926\\u0947\\u0916\\u093f\\u090f ... \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \",\"description\":\"\\u0935\\u093e\\u0930\\u093e\\u0923\\u0938\\u0940 \\u092e\\u0947\\u0902 \\u092a\\u0940\\u090f\\u092e \\u092e\\u094b\\u0926\\u0940 \\u0915\\u0947 \\u0930\\u094b\\u0921 \\u0936\\u094b \\u0938\\u0947 \\u0939\\u0940 \\u0915\\u093e\\u0936\\u0940 \\u092e\\u094b\\u0926\\u0940\\u092e\\u092f \\u0939\\u0948, \\u092a\\u0930 \\u0915\\u094d\\u092f\\u093e \\u092c\\u0938 \\u092f\\u0939\\u0940 \\u0939\\u0915\\u0940\\u0915\\u0924 \\u0939\\u0948? \\u0915\\u093f\\u0924\\u0928\\u093e \\u0905\\u0902\\u0924\\u0930 \\u0939\\u0948 \\u0936\\u0939\\u0930 \\u0914\\u0930 \\u0917\\u093e\\u0902\\u0935 \\u0915\\u0947 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0938\\u094b\\u091a \\u092e\\u0947\\u0902? \\u091c\\u092e\\u0940\\u0928 \\u092a\\u0930 \\u0917\\u0920\\u092c\\u0902\\u0927\\u0928 \\u0915\\u093e \\u0915\\u093f\\u0924\\u0928\\u093e \\u0939\\u0948 \\u0905\\u0938\\u0930? \\u0924\\u092e\\u093e\\u092e \\u092e\\u0941\\u0926\\u094d\\u0926\\u094b\\u0902 \\u092a\\u0930 \\u0935\\u093e\\u0930\\u093e\\u0923\\u0938\\u0940 \\u0938\\u0947 \\u0926\\u0947\\u0916\\u093f\\u090f editorji \\u0915\\u0940 \\u092f\\u0947 \\u0916\\u093e\\u0938 \\u092a\\u0947\\u0936\\u0915\\u0936 \",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1541,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-08\\/1557334261351\\/1557334261351_landscape.jpg\"}]}}'),
(1557407854192, '#ElectionsWithVikram: \'Dilli Ka Dangal\'', 'Days ahead of the Delhi vote, editorji hits the campaign trail in Delhi. From PM Modi\'s Ramlila rally to Priyanka Gandhi Vadra\'s road show. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1147', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-09/1557407854192/1557407854192.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-09/1557407854192/1557407854192.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-09/1557407854192/1557407854192_landscape.jpg', '', '', 'en', '2019-05-09 13:17:34', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: \'Dilli Ka Dangal\'\",\"description\":\"Days ahead of the Delhi vote, editorji hits the campaign trail in Delhi. From PM Modi\'s Ramlila rally to Priyanka Gandhi Vadra\'s road show. \",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1147,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-09\\/1557407854192\\/1557407854192_landscape.jpg\"}]}}'),
(1557408255914, 'विक्रम चंद्रा के साथ देखिए दिल्ली का दंगल ', 'चुनावी रैली में editorji: Cong रोड शो बनाम BJP की रामलीला  ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1146', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-09/1557408255914/1557408255914.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-09/1557408255914/1557408255914.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-09/1557408255914/1557408255914_landscape.jpg', '', '', 'hi', '2019-05-09 13:24:15', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0926\\u0947\\u0916\\u093f\\u090f \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0915\\u093e \\u0926\\u0902\\u0917\\u0932 \",\"description\":\"\\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u0930\\u0948\\u0932\\u0940 \\u092e\\u0947\\u0902 editorji: Cong \\u0930\\u094b\\u0921 \\u0936\\u094b \\u092c\\u0928\\u093e\\u092e BJP \\u0915\\u0940 \\u0930\\u093e\\u092e\\u0932\\u0940\\u0932\\u093e  \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1146,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-09\\/1557408255914\\/1557408255914_landscape.jpg\"}]}}'),
(1557496388818, '#ElectionsWithVikram: The Poll Arithmetic', 'With 70% of the elections now over, we breakdown the numbers game. What is the bare minimum the BJP needs to form the next \'Modi Sarkar\'? What is the BJP\'s and Congress\' post poll strategy? Vikram Chandra along with his panel of experts does the poll arithmetic for you.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '0', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-10/1557496388818/1557496388818.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-10/1557496388818/1557496388818.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-10/1557496388818/1557496388818_landscape.jpg', '', '', 'en', '2019-05-10 13:53:08', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Poll Arithmetic\",\"description\":\"With 70% of the elections now over, we breakdown the numbers game. What is the bare minimum the BJP needs to form the next \'Modi Sarkar\'? What is the BJP\'s and Congress\' post poll strategy? Vikram Chandra along with his panel of experts does the poll arithmetic for you.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":0,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-10\\/1557496388818\\/1557496388818_landscape.jpg\"}]}}'),
(1557500549078, 'विक्रम के साथ चुनाव स्पेशल ', 'नतीजों के बाद क्या हो सकता है बीजेपी का चुनावी गणित ?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1750', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-10/1557500549078/1557500549078.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-10/1557500549078/1557500549078.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-10/1557500549078/1557500549078_landscape.jpg', '', '', 'hi', '2019-05-10 15:02:29', 'Ravinder', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \",\"description\":\"\\u0928\\u0924\\u0940\\u091c\\u094b\\u0902 \\u0915\\u0947 \\u092c\\u093e\\u0926 \\u0915\\u094d\\u092f\\u093e \\u0939\\u094b \\u0938\\u0915\\u0924\\u093e \\u0939\\u0948 \\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u0917\\u0923\\u093f\\u0924 ?\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1750,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-10\\/1557500549078\\/1557500549078_landscape.jpg\"}]}}'),
(1557646337724, '#ElectionsWithVikram: What\'s on today\'s show', 'We look at the key contests and issues as India votes for 59 seats in the six states of Uttar Pradesh, Madhya Pradesh, West Bengal, Jharkhand, Haryana, Bihar and the national capital Delh.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '13', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557646337724/1557646337724.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557646337724/1557646337724.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557646337724/1557646337724_landscape.jpg', '', '', 'en', '2019-05-12 07:32:17', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"We look at the key contests and issues as India votes for 59 seats in the six states of Uttar Pradesh, Madhya Pradesh, West Bengal, Jharkhand, Haryana, Bihar and the national capital Delh.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":13,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-12\\/1557646337724\\/1557646337724_landscape.jpg\"}]}}'),
(1557646527370, 'इलेक्शन विक्रम के साथ ', 'छठे चरण की वोटिंग में कैसा है लोगों का उत्साह? देखिए Editorji के कैमरे से. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '11', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557646527370/1557646527370.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557646527370/1557646527370.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557646527370/1557646527370_landscape.jpg', '', '', 'hi', '2019-05-12 07:35:27', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"description\":\"\\u091b\\u0920\\u0947 \\u091a\\u0930\\u0923 \\u0915\\u0940 \\u0935\\u094b\\u091f\\u093f\\u0902\\u0917 \\u092e\\u0947\\u0902 \\u0915\\u0948\\u0938\\u093e \\u0939\\u0948 \\u0932\\u094b\\u0917\\u094b\\u0902 \\u0915\\u093e \\u0909\\u0924\\u094d\\u0938\\u093e\\u0939? \\u0926\\u0947\\u0916\\u093f\\u090f Editorji \\u0915\\u0947 \\u0915\\u0948\\u092e\\u0930\\u0947 \\u0938\\u0947. \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":11,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-12\\/1557646527370\\/1557646527370_landscape.jpg\"}]}}'),
(1557667632141, ' इलेक्शन विक्रम के साथ: दिल्ली-गुरुग्राम का चुनावी मूड ', 'रविवार को छठे दौर का मतदान हुआ, इस चरण में दिल्ली और हरियाणा की सभी सीटों पर वोट डाले गए.  editorji ने राजधानी दिल्ली और गुड़गांव के शहरी और ग्रामीण इलाकों में जाकर जाना कि वोटिंग के दिन जनता क्या सोच कर वोट दे रही है. क्या हैं लोगों के मुद्दे, क्या सिर्फ मोदी और राष्टवाद ही चुनावी मुद्दा है या फिर वोटरों के लिए दूसरे मुद्दे भी मायने रखते हैं. देखिए हमारी ये खास पेशकश. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '0', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557667632141/1557667632141.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557667632141/1557667632141.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557667632141/1557667632141_landscape.jpg', '', '', 'hi', '2019-05-12 13:27:12', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\" \\u0907\\u0932\\u0947\\u0915\\u094d\\u0936\\u0928 \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925: \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940-\\u0917\\u0941\\u0930\\u0941\\u0917\\u094d\\u0930\\u093e\\u092e \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092e\\u0942\\u0921 \",\"description\":\"\\u0930\\u0935\\u093f\\u0935\\u093e\\u0930 \\u0915\\u094b \\u091b\\u0920\\u0947 \\u0926\\u094c\\u0930 \\u0915\\u093e \\u092e\\u0924\\u0926\\u093e\\u0928 \\u0939\\u0941\\u0906, \\u0907\\u0938 \\u091a\\u0930\\u0923 \\u092e\\u0947\\u0902 \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0914\\u0930 \\u0939\\u0930\\u093f\\u092f\\u093e\\u0923\\u093e \\u0915\\u0940 \\u0938\\u092d\\u0940 \\u0938\\u0940\\u091f\\u094b\\u0902 \\u092a\\u0930 \\u0935\\u094b\\u091f \\u0921\\u093e\\u0932\\u0947 \\u0917\\u090f.  editorji \\u0928\\u0947 \\u0930\\u093e\\u091c\\u0927\\u093e\\u0928\\u0940 \\u0926\\u093f\\u0932\\u094d\\u0932\\u0940 \\u0914\\u0930 \\u0917\\u0941\\u0921\\u093c\\u0917\\u093e\\u0902\\u0935 \\u0915\\u0947 \\u0936\\u0939\\u0930\\u0940 \\u0914\\u0930 \\u0917\\u094d\\u0930\\u093e\\u092e\\u0940\\u0923 \\u0907\\u0932\\u093e\\u0915\\u094b\\u0902 \\u092e\\u0947\\u0902 \\u091c\\u093e\\u0915\\u0930 \\u091c\\u093e\\u0928\\u093e \\u0915\\u093f \\u0935\\u094b\\u091f\\u093f\\u0902\\u0917 \\u0915\\u0947 \\u0926\\u093f\\u0928 \\u091c\\u0928\\u0924\\u093e \\u0915\\u094d\\u092f\\u093e \\u0938\\u094b\\u091a \\u0915\\u0930 \\u0935\\u094b\\u091f \\u0926\\u0947 \\u0930\\u0939\\u0940 \\u0939\\u0948. \\u0915\\u094d\\u092f\\u093e \\u0939\\u0948\\u0902 \\u0932\\u094b\\u0917\\u094b\\u0902 \\u0915\\u0947 \\u092e\\u0941\\u0926\\u094d\\u0926\\u0947, \\u0915\\u094d\\u092f\\u093e \\u0938\\u093f\\u0930\\u094d\\u092b \\u092e\\u094b\\u0926\\u0940 \\u0914\\u0930 \\u0930\\u093e\\u0937\\u094d\\u091f\\u0935\\u093e\\u0926 \\u0939\\u0940 \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092e\\u0941\\u0926\\u094d\\u0926\\u093e \\u0939\\u0948 \\u092f\\u093e \\u092b\\u093f\\u0930 \\u0935\\u094b\\u091f\\u0930\\u094b\\u0902 \\u0915\\u0947 \\u0932\\u093f\\u090f \\u0926\\u0942\\u0938\\u0930\\u0947 \\u092e\\u0941\\u0926\\u094d\\u0926\\u0947 \\u092d\\u0940 \\u092e\\u093e\\u092f\\u0928\\u0947 \\u0930\\u0916\\u0924\\u0947 \\u0939\\u0948\\u0902. \\u0926\\u0947\\u0916\\u093f\\u090f \\u0939\\u092e\\u093e\\u0930\\u0940 \\u092f\\u0947 \\u0916\\u093e\\u0938 \\u092a\\u0947\\u0936\\u0915\\u0936. \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":0,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-12\\/1557667632141\\/1557667632141_landscape.jpg\"}]}}'),
(1557668789766, '#ElectionsWithVikram: The Capital Conundrum', 'It\'s Phase 6 of elections, for 59 seats across six states including Delhi. And Vikram Chandra and editorji try to decode the issues at play in Delhi and Gurugram. While the BJP\'s nationalism push seems to be winning voters in Delhi, the environment is the only concern in Gurugram.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1372', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557668789766/1557668789766.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557668789766/1557668789766.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-12/1557668789766/1557668789766_landscape.jpg', '', '', 'en', '2019-05-12 13:46:29', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Capital Conundrum\",\"description\":\"It\'s Phase 6 of elections, for 59 seats across six states including Delhi. And Vikram Chandra and editorji try to decode the issues at play in Delhi and Gurugram. While the BJP\'s nationalism push seems to be winning voters in Delhi, the environment is the only concern in Gurugram.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1372,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-12\\/1557668789766\\/1557668789766_landscape.jpg\"}]}}'),
(1557748968080, '#ElectionsWithVikram: The Poll Arithmetic Part II', 'In Part II of our ongoing series with Hindustan Times we delve deeper into two states that could define #Elections2019 – Uttar Pradesh and West Bengal. We also speak to Anthro.ai to understand their latest shocking projections for UP – the undercurrent that is an earthquake.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '943', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-13/1557748968080/1557748968080.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-13/1557748968080/1557748968080.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-13/1557748968080/1557748968080_landscape.jpg', '', '', 'en', '2019-05-13 12:02:48', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Poll Arithmetic Part II\",\"description\":\"In Part II of our ongoing series with Hindustan Times we delve deeper into two states that could define #Elections2019 \\u2013 Uttar Pradesh and West Bengal. We also speak to Anthro.ai to understand their latest shocking projections for UP \\u2013 the undercurrent that is an earthquake.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":943,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-13\\/1557748968080\\/1557748968080_landscape.jpg\"}]}}'),
(1557750904796, 'यूपी-बंगाल का चुनावी आकलन ', 'यूपी में राष्ट्रवाद बनाम जाति, तो बंगाल में किला बचाने की चुनौती  ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '751', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-13/1557750904796/1557750904796.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-13/1557750904796/1557750904796.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-13/1557750904796/1557750904796_landscape.jpg', '', '', 'hi', '2019-05-13 12:35:04', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u092f\\u0942\\u092a\\u0940-\\u092c\\u0902\\u0917\\u093e\\u0932 \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u0906\\u0915\\u0932\\u0928 \",\"description\":\"\\u092f\\u0942\\u092a\\u0940 \\u092e\\u0947\\u0902 \\u0930\\u093e\\u0937\\u094d\\u091f\\u094d\\u0930\\u0935\\u093e\\u0926 \\u092c\\u0928\\u093e\\u092e \\u091c\\u093e\\u0924\\u093f, \\u0924\\u094b \\u092c\\u0902\\u0917\\u093e\\u0932 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0932\\u093e \\u092c\\u091a\\u093e\\u0928\\u0947 \\u0915\\u0940 \\u091a\\u0941\\u0928\\u094c\\u0924\\u0940  \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":751,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-13\\/1557750904796\\/1557750904796_landscape.jpg\"}]}}'),
(1557815703423, '#TwitterDialogues with Union Minister Babul Supriyo', 'As the Lok Sabha election campaign wraps up, Union Minister and BJP candidate from Asansol Babul Supriyo joins editorji on #TwitterDialogues. In scathing comments, Supriyo called West Bengal Chief Minister Mamata Banerjee a violent and cruel lady, who he accused of doing blatant politics of appeasement to retain her Muslim votebank. On the BJP\'s prospects in Bengal, he said the party will definitely win more than 8 seats. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1860', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557815703423/1557815703423.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557815703423/1557815703423.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557815703423/1557815703423_landscape.jpg', '', '', 'en', '2019-05-14 06:35:03', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues with Union Minister Babul Supriyo\",\"description\":\"As the Lok Sabha election campaign wraps up, Union Minister and BJP candidate from Asansol Babul Supriyo joins editorji on #TwitterDialogues. In scathing comments, Supriyo called West Bengal Chief Minister Mamata Banerjee a violent and cruel lady, who he accused of doing blatant politics of appeasement to retain her Muslim votebank. On the BJP\'s prospects in Bengal, he said the party will definitely win more than 8 seats. \",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1860,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-14\\/1557815703423\\/1557815703423_landscape.jpg\"}]}}'),
(1557817935602, '#TwitterDialogues केंद्रीय मंत्री बाबुल सुप्रियो के साथ ', '#TwitterDialogues केंद्रीय मंत्री बाबुल सुप्रियो के साथ ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1859', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557817935602/1557817935602.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557817935602/1557817935602.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557817935602/1557817935602_landscape.jpg', '', '', 'hi', '2019-05-14 07:12:15', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues \\u0915\\u0947\\u0902\\u0926\\u094d\\u0930\\u0940\\u092f \\u092e\\u0902\\u0924\\u094d\\u0930\\u0940 \\u092c\\u093e\\u092c\\u0941\\u0932 \\u0938\\u0941\\u092a\\u094d\\u0930\\u093f\\u092f\\u094b \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"description\":\"#TwitterDialogues \\u0915\\u0947\\u0902\\u0926\\u094d\\u0930\\u0940\\u092f \\u092e\\u0902\\u0924\\u094d\\u0930\\u0940 \\u092c\\u093e\\u092c\\u0941\\u0932 \\u0938\\u0941\\u092a\\u094d\\u0930\\u093f\\u092f\\u094b \\u0915\\u0947 \\u0938\\u093e\\u0925 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1859,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-14\\/1557817935602\\/1557817935602_landscape.jpg\"}]}}'),
(1557834637703, 'Election Express: What\'s on today\'s show', 'The Battle for Bengal', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '18', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557834637703/1557834637703.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557834637703/1557834637703.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557834637703/1557834637703_landscape.jpg', '', '', 'en', '2019-05-14 11:50:37', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"Election Express: What\'s on today\'s show\",\"description\":\"The Battle for Bengal\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":18,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-14\\/1557834637703\\/1557834637703_landscape.jpg\"}]}}'),
(1557834741303, 'चुनाव स्पेशल- कोलकाता से ', 'चुनाव स्पेशल- कोलकाता से ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '18', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557834741303/1557834741303.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557834741303/1557834741303.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557834741303/1557834741303_landscape.jpg', '', '', 'hi', '2019-05-14 11:52:21', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0915\\u094b\\u0932\\u0915\\u093e\\u0924\\u093e \\u0938\\u0947 \",\"description\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0915\\u094b\\u0932\\u0915\\u093e\\u0924\\u093e \\u0938\\u0947 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":18,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-14\\/1557834741303\\/1557834741303_landscape.jpg\"}]}}'),
(1557851762625, '#ElectionsWithVikram: The Battle for Bengal', 'In the last lap of elections, we go to Kolkata and try to decode the rising tenor of political faceoffs. Also Vikram Chandra speaks to Bengal\'s two senior-most leaders - BJP\'s Babul Supriyo and TMC\'s Derek O\'Brien.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '0', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557851762625/1557851762625.m4v', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557851762625/1557851762625.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557851762625/1557851762625_landscape.jpg', '', '', 'en', '2019-05-14 16:36:02', 'sefat', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Battle for Bengal\",\"description\":\"In the last lap of elections, we go to Kolkata and try to decode the rising tenor of political faceoffs. Also Vikram Chandra speaks to Bengal\'s two senior-most leaders - BJP\'s Babul Supriyo and TMC\'s Derek O\'Brien.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":0,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-14\\/1557851762625\\/1557851762625_landscape.jpg\"}]}}'),
(1557853254726, 'चुनाव स्पेशल- कोलकाता से...बंगाल में किसका पलड़ा भारी?', 'कोलकाता का चुनावी मूड... क्या सोच रहे हैं नेता, तो क्या कह रही है जनता ?\r\n', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '0', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557853254726/1557853254726.m4v', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557853254726/1557853254726.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-14/1557853254726/1557853254726_landscape.jpg', '', '', 'hi', '2019-05-14 17:00:54', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0915\\u094b\\u0932\\u0915\\u093e\\u0924\\u093e \\u0938\\u0947...\\u092c\\u0902\\u0917\\u093e\\u0932 \\u092e\\u0947\\u0902 \\u0915\\u093f\\u0938\\u0915\\u093e \\u092a\\u0932\\u0921\\u093c\\u093e \\u092d\\u093e\\u0930\\u0940?\",\"description\":\"\\u0915\\u094b\\u0932\\u0915\\u093e\\u0924\\u093e \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092e\\u0942\\u0921... \\u0915\\u094d\\u092f\\u093e \\u0938\\u094b\\u091a \\u0930\\u0939\\u0947 \\u0939\\u0948\\u0902 \\u0928\\u0947\\u0924\\u093e, \\u0924\\u094b \\u0915\\u094d\\u092f\\u093e \\u0915\\u0939 \\u0930\\u0939\\u0940 \\u0939\\u0948 \\u091c\\u0928\\u0924\\u093e ?\\r\\n\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":0,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-14\\/1557853254726\\/1557853254726_landscape.jpg\"}]}}'),
(1557900217504, '#TwitterDialogues with Derek O\'Brien', '#TwitterDialogues with Derek O\'Brien', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '0', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557900217504/1557900217504.m4v', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557900217504/1557900217504.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557900217504/1557900217504_landscape.jpg', '', '', 'en', '2019-05-15 06:03:37', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues with Derek O\'Brien\",\"description\":\"#TwitterDialogues with Derek O\'Brien\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":0,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557900217504\\/1557900217504_landscape.jpg\"}]}}'),
(1557902972930, '#TwitterDialogues with Derek O\'Brien', '#TwitterDialogues with Derek O\'Brien', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '2362', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557902972930/1557902972930.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557902972930/1557902972930.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557902972930/1557902972930_landscape.jpg', '', '', 'en', '2019-05-15 06:49:32', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues with Derek O\'Brien\",\"description\":\"#TwitterDialogues with Derek O\'Brien\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":2362,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557902972930\\/1557902972930_landscape.jpg\"}]}}'),
(1557903842914, '#TwitterDialogues में TMC नेता डेरेक ओ ब्रायन से खास बातचीत ', '#TwitterDialogues में TMC नेता डेरेक ओ ब्रायन से खास बातचीत ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '2363', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557903842914/1557903842914.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557903842914/1557903842914.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557903842914/1557903842914_landscape.jpg', '', '', 'hi', '2019-05-15 07:04:02', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#TwitterDialogues \\u092e\\u0947\\u0902 TMC \\u0928\\u0947\\u0924\\u093e \\u0921\\u0947\\u0930\\u0947\\u0915 \\u0913 \\u092c\\u094d\\u0930\\u093e\\u092f\\u0928 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"description\":\"#TwitterDialogues \\u092e\\u0947\\u0902 TMC \\u0928\\u0947\\u0924\\u093e \\u0921\\u0947\\u0930\\u0947\\u0915 \\u0913 \\u092c\\u094d\\u0930\\u093e\\u092f\\u0928 \\u0938\\u0947 \\u0916\\u093e\\u0938 \\u092c\\u093e\\u0924\\u091a\\u0940\\u0924 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":2363,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557903842914\\/1557903842914_landscape.jpg\"}]}}'),
(1557904822633, '#ElectionsWithVikram: The Battle for Bengal', 'Rising tenor of the BJP, TMC face-off', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1893', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557904822633/1557904822633.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557904822633/1557904822633.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557904822633/1557904822633_landscape.jpg', '', '', 'en', '2019-05-15 07:20:22', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: The Battle for Bengal\",\"description\":\"Rising tenor of the BJP, TMC face-off\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1893,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557904822633\\/1557904822633_landscape.jpg\"}]}}'),
(1557906367736, 'चुनाव स्पेशल- कोलकाता से ', 'कोलकाता का चुनावी मूड... क्या सोच रहे हैं नेता, तो क्या कह रही है जनता ?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '2298', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557906367736/1557906367736.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557906367736/1557906367736.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557906367736/1557906367736_landscape.jpg', '', '', 'hi', '2019-05-15 07:46:07', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932- \\u0915\\u094b\\u0932\\u0915\\u093e\\u0924\\u093e \\u0938\\u0947 \",\"description\":\"\\u0915\\u094b\\u0932\\u0915\\u093e\\u0924\\u093e \\u0915\\u093e \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092e\\u0942\\u0921... \\u0915\\u094d\\u092f\\u093e \\u0938\\u094b\\u091a \\u0930\\u0939\\u0947 \\u0939\\u0948\\u0902 \\u0928\\u0947\\u0924\\u093e, \\u0924\\u094b \\u0915\\u094d\\u092f\\u093e \\u0915\\u0939 \\u0930\\u0939\\u0940 \\u0939\\u0948 \\u091c\\u0928\\u0924\\u093e ?\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":2298,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557906367736\\/1557906367736_landscape.jpg\"}]}}'),
(1557921508246, '#ElectionsWithVikram: Maach, Mishti & More', 'As the battle between the TMC and the BJP hits a crescendo, Vikram Chandra along with a panel of experts break down the Didi vs Modi war.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1668', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557921508246/1557921508246.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557921508246/1557921508246.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557921508246/1557921508246_landscape.PNG', '', '', 'en', '2019-05-15 11:58:28', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Maach, Mishti & More\",\"description\":\"As the battle between the TMC and the BJP hits a crescendo, Vikram Chandra along with a panel of experts break down the Didi vs Modi war.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1668,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557921508246\\/1557921508246_landscape.PNG\"}]}}'),
(1557925610336, 'बंगाल में कौन किसपर भारी ... दीदी बनाम बीजेपी ', 'चुनाव स्पेशल में आज... जानकारों की नजर से बंगाल की सियासी बयार ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1784', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557925610336/1557925610336.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557925610336/1557925610336.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-15/1557925610336/1557925610336_landscape.PNG', '', '', 'hi', '2019-05-15 13:06:50', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"\\u092c\\u0902\\u0917\\u093e\\u0932 \\u092e\\u0947\\u0902 \\u0915\\u094c\\u0928 \\u0915\\u093f\\u0938\\u092a\\u0930 \\u092d\\u093e\\u0930\\u0940 ... \\u0926\\u0940\\u0926\\u0940 \\u092c\\u0928\\u093e\\u092e \\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \",\"description\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c... \\u091c\\u093e\\u0928\\u0915\\u093e\\u0930\\u094b\\u0902 \\u0915\\u0940 \\u0928\\u091c\\u0930 \\u0938\\u0947 \\u092c\\u0902\\u0917\\u093e\\u0932 \\u0915\\u0940 \\u0938\\u093f\\u092f\\u093e\\u0938\\u0940 \\u092c\\u092f\\u093e\\u0930 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1784,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-15\\/1557925610336\\/1557925610336_landscape.PNG\"}]}}'),
(1558000050019, 'विक्रम के साथ चुनाव स्पेशल में आज 3 मुद्दों की बात ', 'बीजेपी के पक्ष और विरोध वाले वो 3 मुद्दे, जो हमारी चुनावी यात्रा में हर जगह सुनाई दिए ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '18', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558000050019/1558000050019.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558000050019/1558000050019.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558000050019/1558000050019_landscape.jpg', '', '', 'hi', '2019-05-16 09:47:30', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c 3 \\u092e\\u0941\\u0926\\u094d\\u0926\\u094b\\u0902 \\u0915\\u0940 \\u092c\\u093e\\u0924 \",\"description\":\"\\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \\u0915\\u0947 \\u092a\\u0915\\u094d\\u0937 \\u0914\\u0930 \\u0935\\u093f\\u0930\\u094b\\u0927 \\u0935\\u093e\\u0932\\u0947 \\u0935\\u094b 3 \\u092e\\u0941\\u0926\\u094d\\u0926\\u0947, \\u091c\\u094b \\u0939\\u092e\\u093e\\u0930\\u0940 \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092f\\u093e\\u0924\\u094d\\u0930\\u093e \\u092e\\u0947\\u0902 \\u0939\\u0930 \\u091c\\u0917\\u0939 \\u0938\\u0941\\u0928\\u093e\\u0908 \\u0926\\u093f\\u090f \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":18,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-16\\/1558000050019\\/1558000050019_landscape.jpg\"}]}}'),
(1558000336287, '#ElectionsWithVikram: What\'s on today\'s show', 'Editorji lists out the top 3 reasons why people want to vote for the BJP and top 3 reasons for them not to vote for the BJP', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '18', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558000336287/1558000336287.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558000336287/1558000336287.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558000336287/1558000336287_landscape.jpg', '', '', 'en', '2019-05-16 09:52:16', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"Editorji lists out the top 3 reasons why people want to vote for the BJP and top 3 reasons for them not to vote for the BJP\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":18,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-16\\/1558000336287\\/1558000336287_landscape.jpg\"}]}}'),
(1558006487612, '#ElectionsWithVikram: What\'s on today\'s show', 'Editorji looks at the top three reasons why people support and criticize the BJP government', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '18', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558006487612/1558006487612.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558006487612/1558006487612.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558006487612/1558006487612_landscape.jpg', '', '', 'en', '2019-05-16 11:34:47', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: What\'s on today\'s show\",\"description\":\"Editorji looks at the top three reasons why people support and criticize the BJP government\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":18,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-16\\/1558006487612\\/1558006487612_landscape.jpg\"}]}}'),
(1558013276382, '#ElectionsWithVikram: Countdown to May 23', 'As campaigning enters the final lap, there is no denying the \'Modi Factor\' in #Elections2019. Vikram Chandra & editorji break down the factors that could determine if Narendra Modi will be India\'s next Prime Minister, through the voices of the people.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1550', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558013276382/1558013276382.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558013276382/1558013276382.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558013276382/1558013276382_landscape.jpg', '', '', 'en', '2019-05-16 13:27:56', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Countdown to May 23\",\"description\":\"As campaigning enters the final lap, there is no denying the \'Modi Factor\' in #Elections2019. Vikram Chandra & editorji break down the factors that could determine if Narendra Modi will be India\'s next Prime Minister, through the voices of the people.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1550,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-16\\/1558013276382\\/1558013276382_landscape.jpg\"}]}}'),
(1558014410939, 'विक्रम के साथ चुनाव स्पेशल में आज 3 मुद्दों की बात', 'बीजेपी के पक्ष और विरोध वाले वो 3 मुद्दे, जो हमारी चुनावी यात्रा में हर जगह सुनाई दिए ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1798', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558014410939/1558014410939.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558014410939/1558014410939.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-16/1558014410939/1558014410939_landscape.jpg', '', '', 'hi', '2019-05-16 13:46:50', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c 3 \\u092e\\u0941\\u0926\\u094d\\u0926\\u094b\\u0902 \\u0915\\u0940 \\u092c\\u093e\\u0924\",\"description\":\"\\u092c\\u0940\\u091c\\u0947\\u092a\\u0940 \\u0915\\u0947 \\u092a\\u0915\\u094d\\u0937 \\u0914\\u0930 \\u0935\\u093f\\u0930\\u094b\\u0927 \\u0935\\u093e\\u0932\\u0947 \\u0935\\u094b 3 \\u092e\\u0941\\u0926\\u094d\\u0926\\u0947, \\u091c\\u094b \\u0939\\u092e\\u093e\\u0930\\u0940 \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092f\\u093e\\u0924\\u094d\\u0930\\u093e \\u092e\\u0947\\u0902 \\u0939\\u0930 \\u091c\\u0917\\u0939 \\u0938\\u0941\\u0928\\u093e\\u0908 \\u0926\\u093f\\u090f \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1798,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-16\\/1558014410939\\/1558014410939_landscape.jpg\"}]}}'),
(1558078252665, 'BSP leader Sudhindra Bhadoria on Elections 2019', 'What after May 23? BSP leader Sudhindra Bhadoria says, \"There is a strong, intense desire among the marginalised\r\n people to see a Dalit become PM,\" in this exclusive chat with editorji.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1128', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558078252665/1558078252665.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558078252665/1558078252665.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558078252665/1558078252665_landscape.PNG', '', '', 'en', '2019-05-17 07:30:52', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"BSP leader Sudhindra Bhadoria on Elections 2019\",\"description\":\"What after May 23? BSP leader Sudhindra Bhadoria says, \\\"There is a strong, intense desire among the marginalised\\r\\n people to see a Dalit become PM,\\\" in this exclusive chat with editorji.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1128,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558078252665\\/1558078252665_landscape.PNG\"}]}}');
INSERT INTO `airtel_video` (`video_id`, `video_name`, `video_short_description`, `video_long_description`, `category_name`, `video_state`, `video_location`, `video_tags`, `more_tags`, `genres`, `video_date`, `video_duration`, `video_url`, `file_url`, `landscape_img`, `portrait_img`, `banner_img`, `video_languages`, `video_created_date`, `video_created_by`, `video_updated_date`, `video_updated_by`, `is_deleted`, `video_deleted_by`, `json_data`) VALUES
(1558079020854, 'editorji कैफे में बोले सुधीन्द्र भदौरिया: बहनजी PM बनेंगी तो आंबेडकर का सपना साकार होगा', 'editorji कैफे में बोले सुधीन्द्र भदौरिया: बहनजी PM बनेंगी तो आंबेडकर का सपना साकार होगा', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '718', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558079020854/1558079020854.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558079020854/1558079020854.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558079020854/1558079020854_landscape.PNG', '', '', 'hi', '2019-05-17 07:43:40', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"editorji \\u0915\\u0948\\u092b\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u094b\\u0932\\u0947 \\u0938\\u0941\\u0927\\u0940\\u0928\\u094d\\u0926\\u094d\\u0930 \\u092d\\u0926\\u094c\\u0930\\u093f\\u092f\\u093e: \\u092c\\u0939\\u0928\\u091c\\u0940 PM \\u092c\\u0928\\u0947\\u0902\\u0917\\u0940 \\u0924\\u094b \\u0906\\u0902\\u092c\\u0947\\u0921\\u0915\\u0930 \\u0915\\u093e \\u0938\\u092a\\u0928\\u093e \\u0938\\u093e\\u0915\\u093e\\u0930 \\u0939\\u094b\\u0917\\u093e\",\"description\":\"editorji \\u0915\\u0948\\u092b\\u0947 \\u092e\\u0947\\u0902 \\u092c\\u094b\\u0932\\u0947 \\u0938\\u0941\\u0927\\u0940\\u0928\\u094d\\u0926\\u094d\\u0930 \\u092d\\u0926\\u094c\\u0930\\u093f\\u092f\\u093e: \\u092c\\u0939\\u0928\\u091c\\u0940 PM \\u092c\\u0928\\u0947\\u0902\\u0917\\u0940 \\u0924\\u094b \\u0906\\u0902\\u092c\\u0947\\u0921\\u0915\\u0930 \\u0915\\u093e \\u0938\\u092a\\u0928\\u093e \\u0938\\u093e\\u0915\\u093e\\u0930 \\u0939\\u094b\\u0917\\u093e\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":718,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558079020854\\/1558079020854_landscape.PNG\"}]}}'),
(1558094612157, 'Poll of Polls: May 19th Hindi Promo', 'Poll of Polls: May 19th Hindi Promo', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '47', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558094612157/1558094612157.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558094612157/1558094612157.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558094612157/1558094612157_landscape.PNG', '', '', 'en', '2019-05-17 12:03:32', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"Poll of Polls: May 19th Hindi Promo\",\"description\":\"Poll of Polls: May 19th Hindi Promo\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":47,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558094612157\\/1558094612157_landscape.PNG\"}]}}'),
(1558098292554, 'Welcome to the daily election show', 'Today we turn our attention to the 5 factors that will decide who will be the next Prime Minister. Also, BSP leader Sudhindra Bhadoria makes a strong \'Mayawati for PM\' pitch in this exclusive chat with Vikram Chandra.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1267', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098292554/1558098292554.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098292554/1558098292554.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098292554/1558098292554_landscape.jpg', '', '', 'en', '2019-05-17 13:04:52', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"Welcome to the daily election show\",\"description\":\"Today we turn our attention to the 5 factors that will decide who will be the next Prime Minister. Also, BSP leader Sudhindra Bhadoria makes a strong \'Mayawati for PM\' pitch in this exclusive chat with Vikram Chandra.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1267,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558098292554\\/1558098292554_landscape.jpg\"}]}}'),
(1558098737522, 'चुनाव स्पेशल में आज ... \'वो 5 बात\' ', 'वो 5 बातें जो तय कर सकती हैं 2019 के नतीजे ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1423', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098737522/1558098737522.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098737522/1558098737522.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098737522/1558098737522_landscape.jpg', '', '', 'hi', '2019-05-17 13:12:17', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 \\u092e\\u0947\\u0902 \\u0906\\u091c ... \'\\u0935\\u094b 5 \\u092c\\u093e\\u0924\' \",\"description\":\"\\u0935\\u094b 5 \\u092c\\u093e\\u0924\\u0947\\u0902 \\u091c\\u094b \\u0924\\u092f \\u0915\\u0930 \\u0938\\u0915\\u0924\\u0940 \\u0939\\u0948\\u0902 2019 \\u0915\\u0947 \\u0928\\u0924\\u0940\\u091c\\u0947 \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1423,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558098737522\\/1558098737522_landscape.jpg\"}]}}'),
(1558098765183, '#ElectionsWithVikram: 5 factors that will decide who will be the next Prime Minister', 'Today we turn our attention to the 5 factors that will decide who will be the next Prime Minister. Also, BSP leader Sudhindra Bhadoria makes a strong \'Mayawati for PM\' pitch in this exclusive chat with Vikram Chandra.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1267', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098765183/1558098765183.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098765183/1558098765183.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558098765183/1558098765183_landscape.jpg', '', '', 'en', '2019-05-17 13:12:45', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: 5 factors that will decide who will be the next Prime Minister\",\"description\":\"Today we turn our attention to the 5 factors that will decide who will be the next Prime Minister. Also, BSP leader Sudhindra Bhadoria makes a strong \'Mayawati for PM\' pitch in this exclusive chat with Vikram Chandra.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1267,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558098765183\\/1558098765183_landscape.jpg\"}]}}'),
(1558106480885, 'Poll of Polls: May 19th Hindi Promo', 'Poll of Polls: May 19th Hindi Promo', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '47', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558106480885/1558106480885.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558106480885/1558106480885.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-17/1558106480885/1558106480885_landscape.PNG', '', '', 'en', '2019-05-17 15:21:20', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"Poll of Polls: May 19th Hindi Promo\",\"description\":\"Poll of Polls: May 19th Hindi Promo\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":47,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-17\\/1558106480885\\/1558106480885_landscape.PNG\"}]}}'),
(1558185017117, '#ElectionsWithVikram: चुनाव नतीजे 2019', '#ElectionsWithVikram: चुनाव नतीजे 2019', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '34', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-18/1558185017117/1558185017117.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-18/1558185017117/1558185017117.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-18/1558185017117/1558185017117_landscape.JPG', '', '', 'hi', '2019-05-18 13:10:17', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0928\\u0924\\u0940\\u091c\\u0947 2019\",\"description\":\"#ElectionsWithVikram: \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0928\\u0924\\u0940\\u091c\\u0947 2019\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":34,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-18\\/1558185017117\\/1558185017117_landscape.JPG\"}]}}'),
(1558236330681, '#ElectionsWithVikram: 23rd of May Hindi Promo', '', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '36', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-19/1558236330681/1558236330681.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-19/1558236330681/1558236330681.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-19/1558236330681/1558236330681_landscape.jpg', '', '', 'hi', '2019-05-19 03:25:30', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: 23rd of May Hindi Promo\",\"description\":\"\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":36,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-19\\/1558236330681\\/1558236330681_landscape.jpg\"}]}}'),
(1558268101447, '#ElectionsWithVikram: 23rd of May Hindi Promo', '#ElectionsWithVikram: 23rd of May Hindi Promo', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '36', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-19/1558268101447/1558268101447.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-19/1558268101447/1558268101447.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-19/1558268101447/1558268101447_landscape.PNG', '', '', 'hi', '2019-05-19 12:15:01', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: 23rd of May Hindi Promo\",\"description\":\"#ElectionsWithVikram: 23rd of May Hindi Promo\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":36,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-19\\/1558268101447\\/1558268101447_landscape.PNG\"}]}}'),
(1558343272136, '#ElectionsWithVikram: Counting Day Promo', '#ElectionsWithVikram: Counting Day Promo', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '30', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558343272136/1558343272136.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558343272136/1558343272136.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558343272136/1558343272136_landscape.JPG', '', '', 'en', '2019-05-20 09:07:52', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Counting Day Promo\",\"description\":\"#ElectionsWithVikram: Counting Day Promo\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":30,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-20\\/1558343272136\\/1558343272136_landscape.JPG\"}]}}'),
(1558345413886, '#ElectionsWithVikram: Counting Day Promo	ENGLISH', '#ElectionsWithVikram: Counting Day Promo	ENGLISH', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '31', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558345413886/1558345413886.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558345413886/1558345413886.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558345413886/1558345413886_landscape.JPG', '', '', 'en', '2019-05-20 09:43:33', 'vasudha', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Counting Day Promo\\tENGLISH\",\"description\":\"#ElectionsWithVikram: Counting Day Promo\\tENGLISH\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":31,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-20\\/1558345413886\\/1558345413886_landscape.JPG\"}]}}'),
(1558364965185, '#ElectionsWithVikram: Decoding the Exit Polls', 'As the exit polls predict an overwhelming mandate for the BJP-led NDA, there are multiple factors at play which may finally decide the May 23 numbers. What\'s still up in the air for the BJP, the Congress and key allies. And why you need to keep an eye on the markets which saw the best post-exit poll rally since 1999.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '908', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558364965185/1558364965185.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558364965185/1558364965185.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558364965185/1558364965185_landscape.jpg', '', '', 'en', '2019-05-20 15:09:25', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Decoding the Exit Polls\",\"description\":\"As the exit polls predict an overwhelming mandate for the BJP-led NDA, there are multiple factors at play which may finally decide the May 23 numbers. What\'s still up in the air for the BJP, the Congress and key allies. And why you need to keep an eye on the markets which saw the best post-exit poll rally since 1999.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":908,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-20\\/1558364965185\\/1558364965185_landscape.jpg\"}]}}'),
(1558365272671, 'चुनाव स्पेशल 2019: क्या कहानी बयां करते हैं एग्ज़िट पोल्स ', 'एग्जिट पोल्स के नतीजों का विश्लेषण... विक्रम चंद्रा की नज़र से. क्या कहानी कह रहे हैं हिंदी पट्टी के राज्यों के अनुमान, तो किन दो राज्यों में कांग्रेस को है गेन. वो 3 राज्य कौन हैं जहां कन्फ्यूज हैं एग्जिट पोल्स भी, तो वो दो राज्य कौन से हैं जिनके विनर बन सकते हैं किंग मेकर. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '892', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558365272671/1558365272671.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558365272671/1558365272671.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-20/1558365272671/1558365272671_landscape.jpg', '', '', 'hi', '2019-05-20 15:14:32', 'sefat', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 2019: \\u0915\\u094d\\u092f\\u093e \\u0915\\u0939\\u093e\\u0928\\u0940 \\u092c\\u092f\\u093e\\u0902 \\u0915\\u0930\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u090f\\u0917\\u094d\\u091c\\u093c\\u093f\\u091f \\u092a\\u094b\\u0932\\u094d\\u0938 \",\"description\":\"\\u090f\\u0917\\u094d\\u091c\\u093f\\u091f \\u092a\\u094b\\u0932\\u094d\\u0938 \\u0915\\u0947 \\u0928\\u0924\\u0940\\u091c\\u094b\\u0902 \\u0915\\u093e \\u0935\\u093f\\u0936\\u094d\\u0932\\u0947\\u0937\\u0923... \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0940 \\u0928\\u091c\\u093c\\u0930 \\u0938\\u0947. \\u0915\\u094d\\u092f\\u093e \\u0915\\u0939\\u093e\\u0928\\u0940 \\u0915\\u0939 \\u0930\\u0939\\u0947 \\u0939\\u0948\\u0902 \\u0939\\u093f\\u0902\\u0926\\u0940 \\u092a\\u091f\\u094d\\u091f\\u0940 \\u0915\\u0947 \\u0930\\u093e\\u091c\\u094d\\u092f\\u094b\\u0902 \\u0915\\u0947 \\u0905\\u0928\\u0941\\u092e\\u093e\\u0928, \\u0924\\u094b \\u0915\\u093f\\u0928 \\u0926\\u094b \\u0930\\u093e\\u091c\\u094d\\u092f\\u094b\\u0902 \\u092e\\u0947\\u0902 \\u0915\\u093e\\u0902\\u0917\\u094d\\u0930\\u0947\\u0938 \\u0915\\u094b \\u0939\\u0948 \\u0917\\u0947\\u0928. \\u0935\\u094b 3 \\u0930\\u093e\\u091c\\u094d\\u092f \\u0915\\u094c\\u0928 \\u0939\\u0948\\u0902 \\u091c\\u0939\\u093e\\u0902 \\u0915\\u0928\\u094d\\u092b\\u094d\\u092f\\u0942\\u091c \\u0939\\u0948\\u0902 \\u090f\\u0917\\u094d\\u091c\\u093f\\u091f \\u092a\\u094b\\u0932\\u094d\\u0938 \\u092d\\u0940, \\u0924\\u094b \\u0935\\u094b \\u0926\\u094b \\u0930\\u093e\\u091c\\u094d\\u092f \\u0915\\u094c\\u0928 \\u0938\\u0947 \\u0939\\u0948\\u0902 \\u091c\\u093f\\u0928\\u0915\\u0947 \\u0935\\u093f\\u0928\\u0930 \\u092c\\u0928 \\u0938\\u0915\\u0924\\u0947 \\u0939\\u0948\\u0902 \\u0915\\u093f\\u0902\\u0917 \\u092e\\u0947\\u0915\\u0930. \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":892,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-20\\/1558365272671\\/1558365272671_landscape.jpg\"}]}}'),
(1558451083939, 'Welcome to the daily election show', 'After the highs and lows of Elections 2019, it\'s time to take stock. It\'s an all-you-need-to-know episode from editorji. Also in our continuing series #TwitterDialogues, we speak to Congress leader Shashi Tharoor who asks - where are the 20 lakh missing EVMs?', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1554', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-21/1558451083939/1558451083939.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-21/1558451083939/1558451083939.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-21/1558451083939/1558451083939_landscape.jpg', '', '', 'en', '2019-05-21 15:04:43', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"Welcome to the daily election show\",\"description\":\"After the highs and lows of Elections 2019, it\'s time to take stock. It\'s an all-you-need-to-know episode from editorji. Also in our continuing series #TwitterDialogues, we speak to Congress leader Shashi Tharoor who asks - where are the 20 lakh missing EVMs?\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1554,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-21\\/1558451083939\\/1558451083939_landscape.jpg\"}]}}'),
(1558451137929, 'चुनाव स्पेशल 2019: चुनाव के चेहरे', 'आम चुनाव के कौन रहे अहम चेहरे, 23 मई के बाद किन चेहरों पर रहेगी चुनावी पंडितों से लेकर राजनीतिक दलों की नजर', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1520', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-21/1558451137929/1558451137929.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-21/1558451137929/1558451137929.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-21/1558451137929/1558451137929_landscape.jpg', '', '', 'hi', '2019-05-21 15:05:37', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"\\u091a\\u0941\\u0928\\u093e\\u0935 \\u0938\\u094d\\u092a\\u0947\\u0936\\u0932 2019: \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0915\\u0947 \\u091a\\u0947\\u0939\\u0930\\u0947\",\"description\":\"\\u0906\\u092e \\u091a\\u0941\\u0928\\u093e\\u0935 \\u0915\\u0947 \\u0915\\u094c\\u0928 \\u0930\\u0939\\u0947 \\u0905\\u0939\\u092e \\u091a\\u0947\\u0939\\u0930\\u0947, 23 \\u092e\\u0908 \\u0915\\u0947 \\u092c\\u093e\\u0926 \\u0915\\u093f\\u0928 \\u091a\\u0947\\u0939\\u0930\\u094b\\u0902 \\u092a\\u0930 \\u0930\\u0939\\u0947\\u0917\\u0940 \\u091a\\u0941\\u0928\\u093e\\u0935\\u0940 \\u092a\\u0902\\u0921\\u093f\\u0924\\u094b\\u0902 \\u0938\\u0947 \\u0932\\u0947\\u0915\\u0930 \\u0930\\u093e\\u091c\\u0928\\u0940\\u0924\\u093f\\u0915 \\u0926\\u0932\\u094b\\u0902 \\u0915\\u0940 \\u0928\\u091c\\u0930\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1520,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-21\\/1558451137929\\/1558451137929_landscape.jpg\"}]}}'),
(1558523212244, '#ElectionsWithVikram: English Donut for 23rd May', '', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '49', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558523212244/1558523212244.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558523212244/1558523212244.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558523212244/1558523212244_landscape.PNG', '', '', 'en', '2019-05-22 11:06:52', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: English Donut for 23rd May\",\"description\":\"\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":49,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-22\\/1558523212244\\/1558523212244_landscape.PNG\"}]}}'),
(1558526875130, '#ElectionsWithVikram: Hindi Donut for 23rd May', '', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '57', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558526875130/1558526875130.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558526875130/1558526875130.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558526875130/1558526875130_landscape.PNG', '', '', 'hi', '2019-05-22 12:07:55', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Hindi Donut for 23rd May\",\"description\":\"\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":57,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-22\\/1558526875130\\/1558526875130_landscape.PNG\"}]}}'),
(1558530390337, '#ElectionsWithVikram: English Donut for 23rd May', '', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '41', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558530390337/1558530390337.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558530390337/1558530390337.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558530390337/1558530390337_landscape.PNG', '', '', 'en', '2019-05-22 13:06:30', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: English Donut for 23rd May\",\"description\":\"\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":41,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-22\\/1558530390337\\/1558530390337_landscape.PNG\"}]}}'),
(1558530544084, '#ElectionsWithVikram: Hindi Promo for 23rd May', '', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '52', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558530544084/1558530544084.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558530544084/1558530544084.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-22/1558530544084/1558530544084_landscape.PNG', '', '', 'hi', '2019-05-22 13:09:04', 'zarah', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram: Hindi Promo for 23rd May\",\"description\":\"\",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":52,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-22\\/1558530544084\\/1558530544084_landscape.PNG\"}]}}'),
(1558715271595, ' चुनाव 2019: फिर क्यों चली नमो की सुनामी ?', ': फिर एक बार मोदी सरकार, पहले से ज़ोरदार. विक्रम चंद्रा के साथ देखिए क्या है मोदी की प्रचंड जीत की वजह और इस ऐतिहासिक जीत पर editorji से जुड़े राजनीतिक विश्लेषकों की क्या है राय. ', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1685', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-24/1558715271595/1558715271595.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-24/1558715271595/1558715271595.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-24/1558715271595/1558715271595_landscape.jpg', '', '', 'hi', '2019-05-24 16:27:51', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\" \\u091a\\u0941\\u0928\\u093e\\u0935 2019: \\u092b\\u093f\\u0930 \\u0915\\u094d\\u092f\\u094b\\u0902 \\u091a\\u0932\\u0940 \\u0928\\u092e\\u094b \\u0915\\u0940 \\u0938\\u0941\\u0928\\u093e\\u092e\\u0940 ?\",\"description\":\": \\u092b\\u093f\\u0930 \\u090f\\u0915 \\u092c\\u093e\\u0930 \\u092e\\u094b\\u0926\\u0940 \\u0938\\u0930\\u0915\\u093e\\u0930, \\u092a\\u0939\\u0932\\u0947 \\u0938\\u0947 \\u091c\\u093c\\u094b\\u0930\\u0926\\u093e\\u0930. \\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e \\u0915\\u0947 \\u0938\\u093e\\u0925 \\u0926\\u0947\\u0916\\u093f\\u090f \\u0915\\u094d\\u092f\\u093e \\u0939\\u0948 \\u092e\\u094b\\u0926\\u0940 \\u0915\\u0940 \\u092a\\u094d\\u0930\\u091a\\u0902\\u0921 \\u091c\\u0940\\u0924 \\u0915\\u0940 \\u0935\\u091c\\u0939 \\u0914\\u0930 \\u0907\\u0938 \\u0910\\u0924\\u093f\\u0939\\u093e\\u0938\\u093f\\u0915 \\u091c\\u0940\\u0924 \\u092a\\u0930 editorji \\u0938\\u0947 \\u091c\\u0941\\u0921\\u093c\\u0947 \\u0930\\u093e\\u091c\\u0928\\u0940\\u0924\\u093f\\u0915 \\u0935\\u093f\\u0936\\u094d\\u0932\\u0947\\u0937\\u0915\\u094b\\u0902 \\u0915\\u0940 \\u0915\\u094d\\u092f\\u093e \\u0939\\u0948 \\u0930\\u093e\\u092f. \",\"tags\":[\"\\u0926\\u0947\\u0936\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"hi\",\"duration\":1685,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-24\\/1558715271595\\/1558715271595_landscape.jpg\"}]}}'),
(1558718213317, '#ElectionsWithVikram', ': The people of India have spoken and their choice is clear – it\'s Narendra Modi. But what led to this unprecedented mandate? We try to decode Modi, the man and his outreach with our panel of experts.', NULL, NULL, 'national', NULL, NULL, NULL, 'ELECTIONS', NULL, '1534', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-24/1558718213317/1558718213317.mp4', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-24/1558718213317/1558718213317.json', 'https://airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com/input/editorji/2019-05-24/1558718213317/1558718213317_landscape.jpg', '', '', 'en', '2019-05-24 17:16:53', 'richa', NULL, NULL, NULL, NULL, '{\"title\":\"#ElectionsWithVikram\",\"description\":\": The people of India have spoken and their choice is clear \\u2013 it\'s Narendra Modi. But what led to this unprecedented mandate? We try to decode Modi, the man and his outreach with our panel of experts.\",\"tags\":[\"National\"],\"state\":\"national\",\"genres\":[\"ELECTIONS\"],\"language\":\"en\",\"duration\":1534,\"images\":{\"Landscape_43\":[{\"cpUrl\":\"https:\\/\\/airtel-tv-prod-vod.s3.ap-south-1.amazonaws.com\\/input\\/editorji\\/2019-05-24\\/1558718213317\\/1558718213317_landscape.jpg\"}]}}');

-- --------------------------------------------------------

--
-- Table structure for table `anchors`
--

CREATE TABLE `anchors` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text,
  `description` text,
  `password_hash` text,
  `token` text,
  `image_compress` text,
  `image` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `json_data` text,
  `editorial_priority` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anchors`
--

INSERT INTO `anchors` (`id`, `name`, `email`, `password`, `description`, `password_hash`, `token`, `image_compress`, `image`, `priority`, `json_data`, `editorial_priority`, `createdOn`, `updatedOn`) VALUES
(2147483647, 'Pradip Bhandari', 'feedback@editorji.com', NULL, '{\"en\":{\"description\":\"Founder, Jan Ki Baat\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5ba3a3f09002f', 'https://cue-data-stream.s3.amazonaws.com/cue_ts/155413191896033_image.jpg', '5c6a6b059094b_pradip.jpg', 80, '{\"en\":{\"name\":\"Pradip Bhandari\"},\"hi\":{\"name\":\"\\u092a\\u094d\\u0930\\u0926\\u0940\\u092a \\u092d\\u0902\\u0921\\u093e\\u0930\\u0940\"},\"ta\":{\"name\":\"\"}}', 20, '2017-06-09 16:34:00', '2017-06-09 11:04:00'),
(1497351122849, 'Vikas Pandey', 'vikas.pandey@gmail.com', NULL, '{\"en\":{\"description\":\"Political Analyst\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5c6a6aea8fb33', 'https://cue-data-stream.s3.amazonaws.com/5c8169fa5b9f0_5c6a6bcb013aa-vikas-pandey.jpg', '5c8169fa5b9f0_5c6a6bcb013aa-vikas-pandey.jpg', 80, '{\"en\":{\"name\":\"Vikas Pandey\"},\"hi\":{\"name\":\"\\u0935\\u093f\\u0915\\u093e\\u0938 \\u092a\\u093e\\u0902\\u0921\\u0947\"},\"ta\":{\"name\":\"\"}}', 2, '2017-06-13 16:22:02', '2017-06-13 10:52:02'),
(1497965874624, 'Rana Ayyub', 'testemailopalina@gmail.com', NULL, '{\"en\":{\"description\":\"Author & Journalist\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5b90be0eb3ff1', 'https://cue-data-stream.s3.amazonaws.com/5c6a6a8087d26_rana-ayyub.png', '5c6a6a8087d26_rana-ayyub.png', 80, '{\"en\":{\"name\":\"Rana Ayyub\"},\"hi\":{\"name\":\"\\u0930\\u093e\\u0923\\u093e \\u0905\\u092f\\u0942\\u092c\"},\"ta\":{\"name\":\"\"}}', 2, '2017-06-20 19:07:54', '2017-06-20 13:37:54'),
(1538985643265, 'Mitali Mukherjee', 'mitalim@gmail.com', NULL, '{\"en\":{\"description\":\"Editorial Consultant, Business, editorji\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5bbb0eab4206c', 'https://cue-data-stream.s3.amazonaws.com/cue_ts/155587410565932_image.jpg', '5c7f69e40daee_mitali-new.jpg', 80, '{\"en\":{\"name\":\"Mitali Mukherjee\"},\"hi\":{\"name\":\"\\u092e\\u093f\\u0924\\u093e\\u0932\\u0940 \\u092e\\u0941\\u0916\\u0930\\u094d\\u091c\\u0940 \"},\"ta\":{\"name\":\"\"}}', 3, '2018-10-08 13:30:43', '2018-10-08 08:00:43'),
(1538985699308, 'Nishant Padhiar', 'nishant.padhiar@gmail.com', NULL, '{\"en\":{\"description\":\"Editor, Stuff (India)\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5bbb0ee34c9fb', 'https://cue-data-stream.s3.amazonaws.com/5c86340fae77c_5c6acab67faed-nishant-lo.PNG', '5c86340fae77c_5c6acab67faed-nishant-lo.PNG', 80, '{\"en\":{\"name\":\"Nishant Padhiar\"},\"hi\":{\"name\":\"\\u0928\\u093f\\u0936\\u093e\\u0902\\u0924 \\u092a\\u0922\\u093f\\u092f\\u093e\\u0930\"},\"ta\":{\"name\":\"\"}}', 3, '2018-10-08 13:31:39', '2018-10-08 08:01:39'),
(1547193859144, 'Abhisar Sharma', 'abhisarsharma1@gmail.com', NULL, '{\"en\":{\"description\":\"Senior Journalist, Author & Political Analyst\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5c384e0324a3c', 'https://cue-data-stream.s3.amazonaws.com/cue_ts/155413077453330_image.jpg', '5c67eaf40106c_5c38682f120ef-abhisar.jpg', 80, '{\"en\":{\"name\":\"Abhisar Sharma\"},\"hi\":{\"name\":\"\\u0905\\u092d\\u093f\\u0938\\u093e\\u0930 \\u0936\\u0930\\u094d\\u092e\\u093e\"},\"ta\":{\"name\":\"\"}}', 2, '2019-01-11 13:34:19', '2019-01-11 08:04:19'),
(1552282707105, 'Ravdeep Singh', 'indiaallsports@gmail.com', NULL, '{\"en\":{\"description\":\"Founder, India_AllSports\"},\"hi\":{\"description\":\"Founder, India_AllSports\"},\"ta\":{\"description\":\"\"}}', NULL, '5c85f4531b0aa', 'https://cue-data-stream.s3.amazonaws.com/cue_ts/155487991698681_image.jpg', '5c86289427603_a.JPG', 4, '{\"en\":{\"name\":\"Ravdeep Singh\"},\"hi\":{\"name\":\"\\u0930\\u0935\\u0926\\u0940\\u092a \\u0938\\u093f\\u0902\\u0939 \"},\"ta\":{\"name\":\"\"}}', 4, '2019-03-11 11:08:27', '2019-03-11 05:38:27'),
(1552589332011, 'Vikram Chandra', 'vikramoa@editorji.com', NULL, '{\"en\":{\"description\":\"Founder, editorji\"},\"hi\":{\"description\":\"Founder, editorji\"},\"ta\":{\"description\":\"\"}}', NULL, '5c8aa214040f6', 'https://cue-data-stream.s3.amazonaws.com/cue_ts/155487984082881_image.jpg', '5c8b831965743_5c8b38c955220-vc-final-cropped.jpg', 8, '{\"en\":{\"name\":\"Vikram Chandra\"},\"hi\":{\"name\":\"\\u0935\\u093f\\u0915\\u094d\\u0930\\u092e \\u091a\\u0902\\u0926\\u094d\\u0930\\u093e\"},\"ta\":{\"name\":\"\"}}', 8, '2019-03-15 00:18:52', '2019-03-14 18:48:52'),
(1552626599746, 'Devika Anand Gupta', ' devikaa@editorji.com', NULL, '{\"en\":{\"description\":\"Editorial Consultant, Entertainment\"},\"hi\":{\"description\":\"\"},\"ta\":{\"description\":\"\"}}', NULL, '5c8b33a7b797b', 'https://cue-data-stream.s3.amazonaws.com/cue_ts/155428809003227_image.jpg', '5c8b751c460e0_devika.jpg', 6, '{\"en\":{\"name\":\"Devika Anand Gupta\"},\"hi\":{\"name\":\" \\u0926\\u0947\\u0935\\u093f\\u0915\\u093e \\u0906\\u0928\\u0902\\u0926 \\u0917\\u0941\\u092a\\u094d\\u0924\\u093e\"},\"ta\":{\"name\":\"\"}}', 6, '2019-03-15 10:39:59', '2019-03-15 05:09:59');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_user`
--

CREATE TABLE `anchor_user` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT '0',
  `anchor_id` bigint(20) DEFAULT '0',
  `user_priority` varchar(255) DEFAULT '0',
  `slider` varchar(255) DEFAULT '0',
  `type` enum('slider','anchor') DEFAULT 'anchor',
  `createdOn` datetime DEFAULT '0000-00-00 00:00:00',
  `updatedOn` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anchor_user`
--

INSERT INTO `anchor_user` (`id`, `user_id`, `anchor_id`, `user_priority`, `slider`, `type`, `createdOn`, `updatedOn`) VALUES
(2023, '1503992040326', 0, '0', '49', 'slider', '2017-08-29 07:34:32', '2017-08-29 02:04:32'),
(2024, '1503992040326', 2147483647, '0', '0', 'anchor', '2017-08-29 07:34:33', '2017-08-29 02:04:33'),
(2025, '1503992040326', 1497351122849, '0', '0', 'anchor', '2017-08-29 07:34:33', '2017-08-29 02:04:33'),
(2026, '1503992040326', 1497965874624, '', '0', 'anchor', '2017-08-29 07:34:33', '2017-08-29 02:04:33'),
(2478, '1487743325561', 0, '0', '49', 'slider', '2017-09-01 14:48:00', '2017-09-01 09:18:00'),
(2480, '1487743325561', 2147483647, '-1', '0', 'anchor', '2017-09-01 14:48:00', '2017-09-01 09:18:00'),
(2481, '1487743325561', 1497351122849, '-1', '0', 'anchor', '2017-09-01 14:48:00', '2017-09-01 09:18:00'),
(2482, '1487743325561', 1497965874624, '-1', '0', 'anchor', '2017-09-01 14:48:00', '2017-09-01 09:18:00'),
(3397, '1505302297102', 0, '0', '49', 'slider', '2017-09-13 11:48:43', '2017-09-13 06:18:43'),
(3398, '1505302297102', 2147483647, '', '0', 'anchor', '2017-09-13 11:48:43', '2017-09-13 06:18:43'),
(3399, '1505302297102', 1497351122849, '2', '0', 'anchor', '2017-09-13 11:48:43', '2017-09-13 06:18:43'),
(3400, '1505302297102', 1497965874624, '', '0', 'anchor', '2017-09-13 11:48:43', '2017-09-13 06:18:43'),
(3408, '1505555326902', 0, '0', '49', 'slider', '2017-09-16 09:53:31', '2017-09-16 04:23:31'),
(3409, '1505555326902', 2147483647, '', '0', 'anchor', '2017-09-16 09:53:32', '2017-09-16 04:23:32'),
(3410, '1505555326902', 1497351122849, '', '0', 'anchor', '2017-09-16 09:53:32', '2017-09-16 04:23:32'),
(3411, '1505555326902', 1497965874624, '', '0', 'anchor', '2017-09-16 09:53:32', '2017-09-16 04:23:32'),
(3911, '1507193028606', 0, '0', '49', 'slider', '2017-10-05 08:46:58', '2017-10-05 03:16:58'),
(3912, '1507193028606', 2147483647, '', '0', 'anchor', '2017-10-05 08:46:58', '2017-10-05 03:16:58'),
(3913, '1507193028606', 1497351122849, '', '0', 'anchor', '2017-10-05 08:46:58', '2017-10-05 03:16:58'),
(3914, '1507193028606', 1497965874624, '', '0', 'anchor', '2017-10-05 08:46:58', '2017-10-05 03:16:58'),
(4925, '1488191926967', 0, '0', '49', 'slider', '2017-10-13 10:38:54', '2017-10-13 05:08:54'),
(4977, '1508159312090', 0, '0', '49', 'slider', '2017-10-16 14:00:53', '2017-10-16 08:30:53'),
(4979, '1508159312090', 2147483647, '1', '0', 'anchor', '2017-10-16 14:00:54', '2017-10-16 08:30:54'),
(4980, '1508159312090', 1497351122849, '', '0', 'anchor', '2017-10-16 14:00:54', '2017-10-16 08:30:54'),
(4981, '1508159312090', 1497965874624, '', '0', 'anchor', '2017-10-16 14:00:54', '2017-10-16 08:30:54'),
(5225, '1511260026601', 0, '0', '49', 'slider', '2017-11-25 10:42:20', '2017-11-25 05:12:20'),
(5226, '1511260026601', 2147483647, '2', '0', 'anchor', '2017-11-25 10:42:21', '2017-11-25 05:12:21'),
(5227, '1511260026601', 1497351122849, '-1', '0', 'anchor', '2017-11-25 10:42:21', '2017-11-25 05:12:21'),
(5228, '1511260026601', 1497965874624, '-1', '0', 'anchor', '2017-11-25 10:42:21', '2017-11-25 05:12:21'),
(5260, '1486918420864', 0, '0', '49', 'slider', '2017-11-29 06:50:17', '2017-11-29 01:20:17'),
(5262, '1486918420864', 1497351122849, '', '0', 'anchor', '2017-11-29 06:50:17', '2017-11-29 01:20:17'),
(5263, '1486918420864', 1497965874624, '', '0', 'anchor', '2017-11-29 06:50:17', '2017-11-29 01:20:17'),
(5264, '1486918420864', 2147483647, '2', '0', 'anchor', '2017-11-29 06:50:17', '2017-11-29 01:20:17'),
(5343, '1507729563580', 0, '0', '49', 'slider', '2017-12-12 13:38:04', '2017-12-12 08:08:04'),
(5344, '1507729563580', 2147483647, '', '0', 'anchor', '2017-12-12 13:38:04', '2017-12-12 08:08:04'),
(5345, '1507729563580', 1497351122849, '', '0', 'anchor', '2017-12-12 13:38:04', '2017-12-12 08:08:04'),
(5346, '1507729563580', 1497965874624, '', '0', 'anchor', '2017-12-12 13:38:04', '2017-12-12 08:08:04'),
(5348, '1487155308877', 0, '0', '49', 'slider', '2017-12-12 14:52:00', '2017-12-12 09:22:00'),
(5350, '1487155308877', 1497351122849, '2', '0', 'anchor', '2017-12-12 14:52:00', '2017-12-12 09:22:00'),
(5351, '1487155308877', 1497965874624, '-1', '0', 'anchor', '2017-12-12 14:52:00', '2017-12-12 09:22:00'),
(5352, '1487155308877', 2147483647, '0', '0', 'anchor', '2017-12-12 14:52:00', '2017-12-12 09:22:00'),
(5360, '1487438651777', 0, '0', '49', 'slider', '2017-12-13 06:49:19', '2017-12-13 01:19:19'),
(5362, '1487438651777', 2147483647, '-1', '0', 'anchor', '2017-12-13 06:49:19', '2017-12-13 01:19:19'),
(5363, '1487438651777', 1497351122849, '-1', '0', 'anchor', '2017-12-13 06:49:19', '2017-12-13 01:19:19'),
(5364, '1487438651777', 1497965874624, '1', '0', 'anchor', '2017-12-13 06:49:19', '2017-12-13 01:19:19'),
(5427, '1513767620325', 0, '0', '49', 'slider', '2017-12-20 11:05:54', '2017-12-20 05:35:54'),
(5428, '1513767620325', 2147483647, '', '0', 'anchor', '2017-12-20 11:05:54', '2017-12-20 05:35:54'),
(5429, '1513767620325', 1497351122849, '', '0', 'anchor', '2017-12-20 11:05:54', '2017-12-20 05:35:54'),
(5430, '1513767620325', 1497965874624, '', '0', 'anchor', '2017-12-20 11:05:54', '2017-12-20 05:35:54'),
(5871, '1511253536427', 0, '0', '49', 'slider', '2018-01-04 12:37:34', '2018-01-04 07:07:34');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_video`
--

CREATE TABLE `anchor_video` (
  `anchor_id` bigint(20) UNSIGNED NOT NULL,
  `anchor_title` varchar(255) NOT NULL,
  `anchor_description` text,
  `video_ts_name` text,
  `video_ts_description` text,
  `anchor_video_path` varchar(255) DEFAULT NULL,
  `anchor_rendition_height` int(11) UNSIGNED DEFAULT NULL,
  `anchor_rendition_width` int(11) UNSIGNED DEFAULT NULL,
  `anchor_rendition_bitrate` int(11) UNSIGNED DEFAULT NULL,
  `anchor_rendition_framerate` decimal(10,2) DEFAULT NULL,
  `anchor_rendition_duration` bigint(20) DEFAULT NULL,
  `anchor_rendition_encoding` varchar(50) DEFAULT NULL,
  `anchor_rendition_mimetype` varchar(100) DEFAULT NULL,
  `anchor_rendition_size` varchar(10) DEFAULT NULL,
  `anchor_rendition_bytes` bigint(20) DEFAULT NULL,
  `anchor_rendition_format` varchar(100) DEFAULT NULL,
  `anchor_rendition_path` varchar(255) DEFAULT NULL,
  `anchor_rendition_name` varchar(255) DEFAULT NULL,
  `anchor_rendition_thumbnail` varchar(255) DEFAULT NULL,
  `anchor_rendition_raw_json` text,
  `anchor_rendition_status` enum('complete','pending','wip','error') NOT NULL,
  `anchor_language_code` varchar(2) NOT NULL,
  `anchor_category_id` bigint(20) UNSIGNED NOT NULL,
  `anchor_video_created_date` datetime NOT NULL,
  `anchor_video_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `anchor_video_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anchor_video`
--

INSERT INTO `anchor_video` (`anchor_id`, `anchor_title`, `anchor_description`, `video_ts_name`, `video_ts_description`, `anchor_video_path`, `anchor_rendition_height`, `anchor_rendition_width`, `anchor_rendition_bitrate`, `anchor_rendition_framerate`, `anchor_rendition_duration`, `anchor_rendition_encoding`, `anchor_rendition_mimetype`, `anchor_rendition_size`, `anchor_rendition_bytes`, `anchor_rendition_format`, `anchor_rendition_path`, `anchor_rendition_name`, `anchor_rendition_thumbnail`, `anchor_rendition_raw_json`, `anchor_rendition_status`, `anchor_language_code`, `anchor_category_id`, `anchor_video_created_date`, `anchor_video_updated_date`, `anchor_video_updated_by`) VALUES
(1487051244189, 'Entertainment', '', 'https://cue-stream-data.s3.amazonaws.com/cue_ts/rendition1-58a3f707b6f9a_ent-intro.m3u8', '#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:0\n#EXT-X-ALLOW-CACHE:YES\n#EXT-X-TARGETDURATION:7\n#EXTINF:6.052444,\nrendition1-58a3f707b6f9a_ent-intro00000.ts\n#EXTINF:4.037367,\nrendition1-58a3f707b6f9a_ent-intro00001.ts\n#EXT-X-ENDLIST\n', 'http://cue-stream-data.s3.amazonaws.com/58a3f707b6f9a_ent-intro.mp4', 100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'complete', 'en', 1481179303632744347, '2017-02-15 12:06:56', '2018-02-13 10:16:31', 1481179303607728865),
(1487141030041, 'International News', '', 'https://cue-stream-data.s3.amazonaws.com/cue_ts/rendition1-58a3f8a60af29_intl-intro.m3u8', '#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:0\n#EXT-X-ALLOW-CACHE:YES\n#EXT-X-TARGETDURATION:2\n#EXTINF:1.034367,\nrendition-58a3f8a60af29_intl-intro00000.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00001.ts\n#EXTINF:1.935267,\nrendition-58a3f8a60af29_intl-intro00002.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00003.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00004.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00005.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00006.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00007.ts\n#EXTINF:0.967633,\nrendition-58a3f8a60af29_intl-intro00008.ts\n#EXTINF:0.700700,\nrendition-58a3f8a60af29_intl-intro00009.ts\n#EXT-X-ENDLIST\n', 'http://cue-stream-data.s3.amazonaws.com/58a3f8a60af29_intl-intro.mp4', 320, 320, 256, '29.97', 10436, NULL, NULL, '572075', NULL, NULL, 'http://cue-stream-data.s3.amazonaws.com/cue-1/rendition-58a3f8a60af29_intl-intro.mp4', 'rendition-58a3f8a60af29_intl-intro.mp4', 'http://cue-stream-data.s3.amazonaws.com/cue-1/thumb-58a3f8a60af29_intl-intro-00001.png', '{\"Job\":{\"Id\":\"1487141033487-mavwd8\",\"Arn\":\"arn:aws:elastictranscoder:us-east-1:703630450572:job/1487141033487-mavwd8\",\"PipelineId\":\"1480669783313-xlb7mq\",\"Input\":{\"Key\":\"58a3f8a60af29_intl-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":12591513,\"DurationMillis\":10389}},\"Inputs\":[{\"Key\":\"58a3f8a60af29_intl-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":12591513,\"DurationMillis\":10389}}],\"Output\":{\"Id\":\"1\",\"Key\":\"rendition-58a3f8a60af29_intl-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3f8a60af29_intl-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":11,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":572075,\"DurationMillis\":10436,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null},\"Outputs\":[{\"Id\":\"1\",\"Key\":\"rendition-58a3f8a60af29_intl-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3f8a60af29_intl-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":11,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":572075,\"DurationMillis\":10436,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null}],\"OutputKeyPrefix\":\"cue-1/\",\"Playlists\":[],\"Status\":\"Complete\",\"Timing\":{\"SubmitTimeMillis\":1487141033521,\"StartTimeMillis\":1487141035482,\"FinishTimeMillis\":1487141048245}}}', 'complete', 'en', 1481179303616506989, '2017-02-15 12:13:50', '2018-02-15 11:28:46', 1481179303607728865),
(1487141924298, 'Local News', '', 'https://cue-stream-data.s3.amazonaws.com/cue_ts/rendition1-58a3fc2449984_local-intro.m3u8', '#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:0\n#EXT-X-ALLOW-CACHE:YES\n#EXT-X-TARGETDURATION:7\n#EXTINF:6.052444,\nrendition1-58a3f8a60af29_intl-intro00000.ts\n#EXTINF:4.371033,\nrendition1-58a3f8a60af29_intl-intro00001.ts\n#EXT-X-ENDLIST\n', 'http://cue-stream-data.s3.amazonaws.com/58a3fc2449984_local-intro.mp4', 320, 320, 256, '29.97', 11802, NULL, NULL, '638034', NULL, NULL, 'http://cue-stream-data.s3.amazonaws.com/cue-1/rendition-58a3fc2449984_local-intro.mp4', 'rendition-58a3fc2449984_local-intro.mp4', 'http://cue-stream-data.s3.amazonaws.com/cue-1/thumb-58a3fc2449984_local-intro-00001.png', '{\"Job\":{\"Id\":\"1487141925421-j52o0g\",\"Arn\":\"arn:aws:elastictranscoder:us-east-1:703630450572:job/1487141925421-j52o0g\",\"PipelineId\":\"1480669783313-xlb7mq\",\"Input\":{\"Key\":\"58a3fc2449984_local-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":14384170,\"DurationMillis\":11754}},\"Inputs\":[{\"Key\":\"58a3fc2449984_local-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":14384170,\"DurationMillis\":11754}}],\"Output\":{\"Id\":\"1\",\"Key\":\"rendition-58a3fc2449984_local-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3fc2449984_local-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":12,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":638034,\"DurationMillis\":11802,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null},\"Outputs\":[{\"Id\":\"1\",\"Key\":\"rendition-58a3fc2449984_local-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3fc2449984_local-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":12,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":638034,\"DurationMillis\":11802,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null}],\"OutputKeyPrefix\":\"cue-1/\",\"Playlists\":[],\"Status\":\"Complete\",\"Timing\":{\"SubmitTimeMillis\":1487141925444,\"StartTimeMillis\":1487141927431,\"FinishTimeMillis\":1487141941244}}}', 'complete', 'en', 1481179303619960884, '2017-02-15 12:28:44', '2018-02-15 11:29:09', 1481179303607728865),
(1487142541406, 'Politics', '', 'https://cue-stream-data.s3.amazonaws.com/cue_ts/rendition1-58a3fe8d64078_politics-intro.m3u8', '#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:0\n#EXT-X-ALLOW-CACHE:YES\n#EXT-X-TARGETDURATION:7\n#EXTINF:6.052444,\nrendition1-58a3fe8d64078_politics-intro00000.ts\n#EXTINF:4.104100,\nrendition1-58a3fe8d64078_politics-intro00001.ts\n#EXT-X-ENDLIST\n', 'http://cue-stream-data.s3.amazonaws.com/58a3fe8d64078_politics-intro.mp4', 320, 320, 256, '29.97', 10180, NULL, NULL, '558639', NULL, NULL, 'http://cue-stream-data.s3.amazonaws.com/cue-1/rendition-58a3fe8d64078_politics-intro.mp4', 'rendition-58a3fe8d64078_politics-intro.mp4', 'http://cue-stream-data.s3.amazonaws.com/cue-1/thumb-58a3fe8d64078_politics-intro-00001.png', '{\"Job\":{\"Id\":\"1487142544088-eijbw5\",\"Arn\":\"arn:aws:elastictranscoder:us-east-1:703630450572:job/1487142544088-eijbw5\",\"PipelineId\":\"1480669783313-xlb7mq\",\"Input\":{\"Key\":\"58a3fe8d64078_politics-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":12241652,\"DurationMillis\":10133}},\"Inputs\":[{\"Key\":\"58a3fe8d64078_politics-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":12241652,\"DurationMillis\":10133}}],\"Output\":{\"Id\":\"1\",\"Key\":\"rendition-58a3fe8d64078_politics-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3fe8d64078_politics-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":11,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":558639,\"DurationMillis\":10180,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null},\"Outputs\":[{\"Id\":\"1\",\"Key\":\"rendition-58a3fe8d64078_politics-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3fe8d64078_politics-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":11,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":558639,\"DurationMillis\":10180,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null}],\"OutputKeyPrefix\":\"cue-1/\",\"Playlists\":[],\"Status\":\"Complete\",\"Timing\":{\"SubmitTimeMillis\":1487142544120,\"StartTimeMillis\":1487142545786,\"FinishTimeMillis\":1487142559365}}}', 'complete', 'en', 1481179303610674895, '2017-02-15 12:39:02', '2018-02-15 11:29:18', 1481179303607728865),
(1487142747710, 'Sports', '', 'https://cue-stream-data.s3.amazonaws.com/cue_ts/rendition1-58a3ff5bae264_sports-intro.m3u8', '#EXTM3U\n#EXT-X-VERSION:3\n#EXT-X-MEDIA-SEQUENCE:0\n#EXT-X-ALLOW-CACHE:YES\n#EXT-X-TARGETDURATION:7\n#EXTINF:6.052444,\nrendition1-58a3ff5bae264_sports-intro00000.ts\n#EXTINF:2.836167,\nrendition1-58a3ff5bae264_sports-intro00001.ts\n#EXT-X-ENDLIST\n', 'http://cue-stream-data.s3.amazonaws.com/58a3ff5bae264_sports-intro.mp4', 320, 320, 256, '29.97', 8900, NULL, NULL, '496234', NULL, NULL, 'http://cue-stream-data.s3.amazonaws.com/cue-1/rendition-58a3ff5bae264_sports-intro.mp4', 'rendition-58a3ff5bae264_sports-intro.mp4', 'http://cue-stream-data.s3.amazonaws.com/cue-1/thumb-58a3ff5bae264_sports-intro-00001.png', '{\"Job\":{\"Id\":\"1487142751217-ke8gkt\",\"Arn\":\"arn:aws:elastictranscoder:us-east-1:703630450572:job/1487142751217-ke8gkt\",\"PipelineId\":\"1480669783313-xlb7mq\",\"Input\":{\"Key\":\"58a3ff5bae264_sports-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":10812148,\"DurationMillis\":8853}},\"Inputs\":[{\"Key\":\"58a3ff5bae264_sports-intro.mp4\",\"FrameRate\":\"auto\",\"Resolution\":\"auto\",\"AspectRatio\":\"auto\",\"Interlaced\":\"auto\",\"Container\":\"auto\",\"DetectedProperties\":{\"Width\":1280,\"Height\":720,\"FrameRate\":\"29.97\",\"FileSize\":10812148,\"DurationMillis\":8853}}],\"Output\":{\"Id\":\"1\",\"Key\":\"rendition-58a3ff5bae264_sports-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3ff5bae264_sports-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":9,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":496234,\"DurationMillis\":8900,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null},\"Outputs\":[{\"Id\":\"1\",\"Key\":\"rendition-58a3ff5bae264_sports-intro.mp4\",\"ThumbnailPattern\":\"thumb-58a3ff5bae264_sports-intro-{count}\",\"Rotate\":null,\"PresetId\":\"1485155584219-396bem\",\"SegmentDuration\":null,\"Status\":\"Complete\",\"StatusDetail\":null,\"Duration\":9,\"Width\":320,\"Height\":320,\"FrameRate\":\"29.97\",\"FileSize\":496234,\"DurationMillis\":8900,\"Watermarks\":[],\"AppliedColorSpaceConversion\":null}],\"OutputKeyPrefix\":\"cue-1/\",\"Playlists\":[],\"Status\":\"Complete\",\"Timing\":{\"SubmitTimeMillis\":1487142751253,\"StartTimeMillis\":1487142754189,\"FinishTimeMillis\":1487142766984}}}', 'complete', 'en', 1481179303622920022, '2017-02-15 12:42:28', '2018-02-15 11:29:28', 1481179303607728865);

-- --------------------------------------------------------

--
-- Table structure for table `api_error_log`
--

CREATE TABLE `api_error_log` (
  `id` int(11) NOT NULL,
  `api_name` varchar(255) DEFAULT NULL,
  `source_code` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `livestream_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `livestream_embedded_url` text CHARACTER SET utf8,
  `livestream_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` longtext CHARACTER SET utf8,
  `json_data` text,
  `image_url` varchar(255) DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8,
  `meta_title` text,
  `meta_tags` text,
  `status` enum('Enabled','Disabled') DEFAULT 'Disabled',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `deleted_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `livestream_url` varchar(255) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `language_code` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `description` longtext CHARACTER SET utf8,
  `embedded_link` longtext CHARACTER SET utf8,
  `image_url` varchar(255) DEFAULT NULL,
  `image_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `type_id` varchar(200) DEFAULT NULL,
  `m3u8_url` varchar(200) DEFAULT NULL,
  `type` enum('text','image','video','embedded-link','facebook','instagram','twitter','youtube','telegram','linkedin','google','livestream') DEFAULT 'text',
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content_updated_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bucket`
--

CREATE TABLE `bucket` (
  `name` varchar(50) NOT NULL,
  `defaultsize` float DEFAULT NULL,
  `flag` tinyint(4) DEFAULT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bucket`
--

INSERT INTO `bucket` (`name`, `defaultsize`, `flag`, `position`) VALUES
('BUSINESS', 5, 1, 5),
('ENTERTAINMENT', 5, 1, 7),
('LOCAL STORIES', 20, 1, 2),
('SPORTS', 10, 1, 4),
('TECH', 5, 1, 6),
('TRENDING NEWS', 5, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `category_sibling_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_language_code` varchar(2) NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `category_hour` varchar(50) DEFAULT NULL,
  `cat_seq` varchar(50) DEFAULT NULL,
  `header_seq` tinyint(4) DEFAULT NULL,
  `category_video` text,
  `category_sequence` int(10) UNSIGNED DEFAULT NULL,
  `video_category_banner_id` int(11) UNSIGNED DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT '99',
  `category_banner` text,
  `serial_no` enum('1','2','3','0') DEFAULT '0',
  `category_sequence_bucket` int(11) DEFAULT '0',
  `category_percentage` float DEFAULT '0',
  `serial_sequence` enum('1','2','3','4') DEFAULT '4',
  `category_created_date` datetime NOT NULL,
  `category_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category_updated_by` bigint(20) UNSIGNED NOT NULL,
  `category_type` enum('preferences','news') NOT NULL DEFAULT 'news',
  `status` enum('0','1') DEFAULT '1',
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `deleted_by` bigint(20) DEFAULT NULL,
  `cms_status` enum('0','1') DEFAULT '1',
  `add_video_status` enum('0','1') DEFAULT '1',
  `meta_title` text,
  `meta_description` text,
  `dashboard_headline` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `anchor_video` varchar(50) DEFAULT 'disabled',
  `is_parent` tinyint(5) DEFAULT '0',
  `is_child` tinyint(5) DEFAULT '0',
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `parent_id`, `category_sibling_id`, `category_language_code`, `category_name`, `category_hour`, `cat_seq`, `header_seq`, `category_video`, `category_sequence`, `video_category_banner_id`, `priority`, `category_banner`, `serial_no`, `category_sequence_bucket`, `category_percentage`, `serial_sequence`, `category_created_date`, `category_updated_date`, `category_updated_by`, `category_type`, `status`, `is_deleted`, `deleted_by`, `cms_status`, `add_video_status`, `meta_title`, `meta_description`, `dashboard_headline`, `thumbnail`, `anchor_video`, `is_parent`, `is_child`, `slug`) VALUES
(1486711720088, 0, NULL, 'en', 'National', '48', '2', 2, 'https://editorji-live-bucket.s3.amazonaws.com/5e31766ad3839_national.mp4', NULL, 3, 13, 'https://editorji-live-bucket.s3.amazonaws.com/1556776470549_20190502055430_compress.jpeg', '0', 0, 0, '4', '2020-08-05 19:31:34', '2021-08-16 09:32:27', 1551856719352, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 1, 0, NULL),
(1568977955683, 1533017780651, NULL, 'hi', 'हेल्थ', '168', NULL, NULL, '', NULL, 126, 29, 'https://editorji-live-bucket.s3.amazonaws.com/5d1c5eb5dd3d6_airtel-1-.jpg ', '0', 0, 0, '4', '2019-09-20 16:42:35', '2020-10-29 08:39:57', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1568977997400, 1533017780651, 4, 'hi', 'आर्ट एंड कल्चर ', '168', NULL, NULL, '', NULL, NULL, 22, NULL, '0', 0, 0, '4', '2019-09-20 16:43:17', '2020-10-13 08:26:54', 1481179303607728865, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1568978040736, 1486712654178, NULL, 'hi', 'शिक्षा', '168', NULL, NULL, '', NULL, NULL, 6, '', '0', 0, 0, '4', '2019-09-20 16:44:00', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1568978232187, 0, NULL, 'hi', 'करियर', '168', NULL, NULL, '', NULL, 16, 24, 'https://editorji-live-bucket.s3.amazonaws.com/1557315460814_20190508113740_compress.jpg ', '0', 0, 0, '4', '2019-09-20 16:47:12', '2021-04-19 05:14:28', 1481179303607728865, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, 'hrllo-1568978232187'),
(1568978275520, 1486712654178, NULL, 'hi', 'धर्म', '168', NULL, NULL, '', NULL, NULL, 24, NULL, '0', 0, 0, '4', '2019-09-20 16:47:55', '2020-10-29 08:37:01', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 1, NULL),
(1568978302485, 0, NULL, 'hi', 'ज्योतिष ', '168', NULL, NULL, '', NULL, NULL, 25, NULL, '0', 0, 0, '4', '2019-09-20 16:48:22', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1568993813671, 1486712654178, NULL, 'hi', 'हाउडी मोदी', '48', NULL, NULL, '', NULL, NULL, 27, NULL, '0', 0, 0, '4', '2019-09-20 21:06:53', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '0', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1569559487876, 0, NULL, 'hi', 'नवरात्रि', '48', NULL, NULL, '', NULL, NULL, 37, NULL, '0', 0, 0, '4', '2019-09-27 10:14:47', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1570439590740, 0, NULL, 'en', 'Durga Puja', '48', NULL, NULL, '', NULL, 416, 68, 'https://editorji-live-bucket.s3.amazonaws.com/1570188914236_20191004113514_compress.jpg ', '0', 0, 0, '4', '2019-10-07 14:43:10', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1570771208302, 1533017780651, 2, 'hi', 'पर्यावरण', '', NULL, NULL, '', NULL, 371, 30, 'https://editorji-live-bucket.s3.amazonaws.com/1569307050083_20190924063730_compress.jpg ', '0', 0, 0, '4', '2019-10-11 10:50:08', '2020-10-29 08:37:08', 1481179303607728865, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1570771248565, 1533017780651, NULL, 'hi', 'फेस्टिवल', '', NULL, NULL, '', NULL, NULL, 38, NULL, '0', 0, 0, '4', '2019-10-11 10:50:48', '2020-10-29 08:38:05', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 1, NULL),
(1571311120557, 0, NULL, 'en', 'Bank', '', NULL, NULL, '', NULL, NULL, 43, NULL, '0', 0, 0, '4', '2019-10-17 16:48:40', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '0', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1571311169203, 0, NULL, 'hi', 'बैंक', '', NULL, NULL, '', NULL, NULL, 32, NULL, '0', 0, 0, '4', '2019-10-17 16:49:29', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1578309955152, 0, NULL, 'en', 'Hindustan Times', '', NULL, NULL, '', NULL, NULL, 5, '', '0', 0, 0, '4', '2020-01-06 16:55:55', '2020-10-13 08:26:54', 1598951711445, 'news', '1', 'N', NULL, '1', '0', 'Editorji Partner: Hindustan Times News Video ', 'Watch Editorji Partner Hindustan Times News Video related to Politics, India, World, Entertainment and Sports at editorji.com.', '', '', 'disabled', 0, 0, NULL),
(1578311775927, 0, NULL, 'en', 'CES', '168', NULL, NULL, '', NULL, NULL, 7, NULL, '0', 0, 0, '4', '2020-01-06 17:26:15', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1578375226240, 1486712654178, NULL, 'hi', 'दिल्ली चुनाव', '', NULL, NULL, '', NULL, NULL, 4, '', '0', 0, 0, '4', '2020-01-07 11:03:46', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1578996534006, 0, NULL, 'en', 'Editor\'s Picks', '', NULL, NULL, '', NULL, NULL, 49, '', '0', 0, 0, '4', '2020-01-14 15:38:53', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1579002783161, 0, NULL, 'hi', 'हिन्दुस्तान', '', NULL, NULL, '', NULL, NULL, 37, '', '0', 0, 0, '4', '2020-01-14 17:23:03', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1579154215477, 1481179303664292304, NULL, 'hi', 'बजट', '', NULL, NULL, '', NULL, NULL, 17, '', '0', 0, 0, '4', '2020-01-16 11:26:55', '2021-08-17 13:10:45', 1624335361884, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 1, NULL),
(1579603364391, 0, NULL, 'en', 'Republic Day', '', NULL, NULL, '', NULL, NULL, 2, NULL, '0', 0, 0, '4', '2020-01-21 16:12:44', '2020-10-13 08:26:54', 1576506117562, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1579603472931, 0, NULL, 'en', 'Delhi elections', '', NULL, NULL, '', NULL, NULL, 9, '', '0', 0, 0, '4', '2020-01-21 16:14:32', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1579603544674, 1481179303629834929, NULL, 'en', 'Budget 2020', '', NULL, NULL, '', NULL, NULL, 2, NULL, '0', 0, 0, '4', '2020-01-21 16:15:44', '2020-10-13 08:26:54', 1576506117562, 'news', '1', 'N', NULL, '1', '0', '', '', '', '', 'disabled', 0, 0, NULL),
(1584615037231, 0, 45, 'hi', 'कोविड-19', '', NULL, 1, '', NULL, 566, 15, 'https://editorji-live-bucket.s3.amazonaws.com/1580357134562_20200130040534_compress.jpg ', '0', 0, 0, '4', '2020-03-19 16:20:37', '2021-03-14 23:57:32', 1481179303607728865, 'news', '1', 'N', NULL, '1', '0', 'कोरोना वायरस न्यूज़,  कोरोना वायरस पर Latest News,  कोरोना वायरस से जुड़ी ताज़ा खबरें हिंदी में - Editorji', 'कोरोना वायरस: क्या है कोरोना वायरस,  कोरोना वायरस से बचाव के उपाय, इसके लक्षण? कोरोना वायरस पर Live News, कोरोना वायरस न्यूज़, Coronavirus Hindi News, Corona Virus Latest News ताज़ा ख़बर India - Editorji', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1584615037231.jpg', 'disabled', 0, 1, 'covid-news'),
(1585218632129, 0, NULL, 'en', 'Covid-19', '', NULL, NULL, '', NULL, 549, 40, 'https://editorji-live-bucket.s3.amazonaws.com/5e2a631caaf4d_airtel-6-.jpg ', '0', 0, 0, '4', '2020-03-26 16:00:32', '2021-04-07 02:22:04', 1598951711445, 'news', '1', 'N', NULL, '1', '1', 'COVID-19 News Videos: Coronavirus Latest news From India and around the world', 'Find the latest information about coronavirus live in India & across the world with complete information about covid19 new cases, death tolls, recovered cases, count, status, helpline number & other information only at Editorji.', 'Covid-19', NULL, 'disabled', 0, 1, NULL),
(1589353702350, 0, NULL, 'hi', 'जन की बात', '', NULL, NULL, '', NULL, NULL, 20, NULL, '0', 0, 0, '4', '2020-05-13 12:38:22', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1596259322655, 1481179303622920022, NULL, 'en', 'IPL', '', NULL, NULL, '', NULL, 627, 12, 'https://editorji-live-bucket.s3.amazonaws.com/5e660ef0d7f37_airtel-41-.jpg ', '0', 0, 0, '4', '2020-08-01 10:52:02', '2020-11-16 02:09:54', 1551856719352, 'news', '1', 'N', NULL, '0', '0', 'IPL 2020 News Video: IPL Live Cricket Scores, Latest News, Point Tables, Schedules, Results and Highlights', 'IPL 2020 News Video: Get all latest news and updates on IPL 2020 Live Criket Score, IPL live Match, IPL 2020 lastest News, IPL 2020 live scorecard, IPL live score and IPL 2020 Point Table only on editorji.com.', 'IPL', NULL, 'disabled', 0, 1, NULL),
(1596259434099, 1481179303658158944, NULL, 'hi', 'IPL हिन्दी', '', NULL, NULL, '', NULL, 627, 10, 'https://editorji-live-bucket.s3.amazonaws.com/5e660ef0d7f37_airtel-41-.jpg ', '0', 0, 0, '4', '2020-08-01 10:53:54', '2020-11-16 02:06:24', 1551856719352, 'news', '1', 'N', NULL, '0', '0', 'IPL 2020 News in Hindi: IPL Live Score, आईपीएल 2020 लाइव क्रिकेट स्कोर, Latest IPL News Videos, आईपीएल  2020 न्यूज़', 'IPL 2020 Video in Hindi: Get latest IPL news in hindi, IPL news video, IPL points tables, IPL Live score in Hindi and all the latest news of IPL T20 at Editorji.', '', NULL, 'disabled', 0, 1, NULL),
(1596636094201, 0, NULL, 'en', 'Bangla Beta', '', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5f2abbbe35690_placeholder-video-for-website-dummy-video.mp4', NULL, 3, 13, 'https://editorji-live-bucket.s3.amazonaws.com/5cca861670e4f_national.jpeg ', '0', 0, 0, '4', '2020-08-05 19:31:34', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1597824951523, 1481179303636282807, NULL, 'en', 'Spencer\'s playlist', '', NULL, NULL, '', NULL, NULL, 8, NULL, '0', 0, 0, '4', '2020-08-19 13:45:51', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1598192389673, 1486712654178, NULL, 'hi', 'बिहार चुनाव 2020', '', NULL, NULL, '', NULL, 3, 21, 'https://editorji-live-bucket.s3.amazonaws.com/5cca861670e4f_national.jpeg ', '0', 0, 0, '4', '2020-08-23 19:49:49', '2020-10-13 08:26:54', 1598951711445, 'news', '1', 'N', NULL, '1', '0', 'Bihar Election Video 2020: बिहार विधानसभा चुनाव, Bihar Assembly Election Dates, Results and Exit Polls in Hindi', 'Bihar Election 2020 In Hindi: Get latest news updates on Bihar Vidhan Sabha Chunav 2020, Election Voting, Bihar Election results, exit poll and Opinion poll in Hindi on Editorji.', 'बिहार विधानसभा चुनाव 2020', NULL, 'disabled', 0, 0, NULL),
(1598263798373, 1536772136155, NULL, 'hi', 'सुशांत केस', '', NULL, NULL, '', NULL, NULL, 60, NULL, '0', 0, 0, '4', '2020-08-24 15:39:58', '2020-10-13 08:26:54', 1576506117562, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1599062518442, 1553579255928, NULL, 'hi', 'स्पेन्सर्स', '', NULL, NULL, '', NULL, NULL, 60, NULL, '0', 0, 0, '4', '2020-09-02 21:31:58', '2020-10-13 08:26:54', 1576506117562, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1599889107188, 1533017780651, NULL, 'hi', 'फैशन ट्रेंड्स', '', NULL, NULL, '', NULL, NULL, 14, NULL, '0', 0, 0, '4', '2020-09-12 11:08:27', '2020-10-13 08:26:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 0, NULL),
(1602043373237, 0, NULL, 'en', 'Pollution', '', NULL, NULL, '', NULL, 953, 13, 'https://editorji-live-bucket.s3.amazonaws.com/5f7d3dc61ef40_airtel-10-.jpg ', '0', 0, 0, '4', '2020-10-07 09:32:53', '2020-10-29 08:15:54', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1602073146612, 0, NULL, 'hi', 'प्रदूषण', '', NULL, NULL, '', NULL, 953, 14, 'https://editorji-live-bucket.s3.amazonaws.com/5f7d3dc61ef40_airtel-10-.jpg ', '0', 0, 0, '4', '2020-10-07 17:49:06', '2020-10-29 08:37:16', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1602073258900, 0, NULL, 'hi', 'साइंस', '', NULL, NULL, '', NULL, 542, 15, 'https://editorji-live-bucket.s3.amazonaws.com/5e2686c709cc9_airtel.jpg ', '0', 0, 0, '4', '2020-10-07 17:50:58', '2020-10-29 08:39:34', 1551856719352, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1604036767118, 0, NULL, 'en', 'Elections', '', NULL, NULL, '', NULL, NULL, 15, '', '0', 0, 0, '4', '2020-10-30 11:16:07', '2020-11-18 05:17:38', 1598951711445, 'news', '1', 'N', NULL, '1', '0', 'Election News Videos: Latest Election News, Live Updates, Results, Poll Dates, Exit Polls', 'Election News Videos: Get all the latest news videos on election, assembly election news from India and the around the world. Editorji brings to you the live coverage of Indian Elections and Assembly elections.', '', NULL, 'disabled', 0, 1, NULL),
(1604036920987, 0, NULL, 'en', 'Science', '', NULL, NULL, '', NULL, NULL, 14, '', '0', 0, 0, '4', '2020-10-30 11:18:40', '2020-11-18 04:23:04', 1598951711445, 'news', '1', 'N', NULL, '1', '0', 'Science News Videos: Latest Science News, World Science News, Space & Asteroid News', 'Editorji provides the latest news videos on science including space science, earth science, world, science news and interesting science articles on various topics.', '', NULL, 'disabled', 0, 1, NULL),
(1604037056439, 0, NULL, 'hi', 'टेनिस', '', NULL, NULL, '', NULL, NULL, 15, NULL, '0', 0, 0, '4', '2020-10-30 11:20:56', '2020-10-30 00:20:56', 1602244311612, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1604037210062, 0, NULL, 'hi', 'पर्सनल फाइनेंस', '', NULL, NULL, '', NULL, NULL, 15, NULL, '0', 0, 0, '4', '2020-10-30 11:23:30', '2020-10-30 00:23:30', 1602244311612, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1604037301125, 0, NULL, 'hi', 'बाजार', '', NULL, NULL, '', NULL, NULL, 15, NULL, '0', 0, 0, '4', '2020-10-30 11:25:01', '2020-10-30 00:25:01', 1602244311612, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1604037968466, 0, NULL, 'hi', 'OTT हिंदी', '', NULL, NULL, '', NULL, NULL, 15, NULL, '0', 0, 0, '4', '2020-10-30 11:36:08', '2020-10-30 00:36:08', 1602244311612, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1604038014651, 0, NULL, 'hi', 'इकॉनमी', '', NULL, NULL, '', NULL, NULL, 15, NULL, '0', 0, 0, '4', '2020-10-30 11:36:54', '2020-10-30 00:36:54', 1602244311612, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1604038067241, 0, NULL, 'hi', 'फुटबॉल', '', NULL, NULL, '', NULL, NULL, 15, NULL, '0', 0, 0, '4', '2020-10-30 11:37:47', '2020-10-30 00:37:47', 1602244311612, 'news', '1', 'N', NULL, '1', '0', '', '', '', NULL, 'disabled', 0, 1, NULL),
(1614853252778, 0, NULL, 'hi', 'hindi one', '', NULL, 18, '', NULL, NULL, 7, '', '0', 0, 0, '4', '2021-03-04 15:50:52', '2021-03-14 23:57:32', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, 'dsds'),
(1614853573468, 0, NULL, 'en', 'engggg', '', NULL, NULL, '', NULL, NULL, 3, NULL, '0', 0, 0, '4', '2021-03-04 15:56:13', '2021-03-04 04:56:13', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, 'engggg'),
(1614853762964, 0, NULL, 'ta', 'bangla hello', '', NULL, 6, '', NULL, NULL, 8, '', '0', 0, 0, '4', '2021-03-04 15:59:22', '2021-03-14 23:59:05', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, 'bangla-hello'),
(1614854980928, 0, NULL, 'hi', 'cccc', '', NULL, 17, '', NULL, NULL, NULL, NULL, '0', 0, 0, '4', '2021-03-04 16:19:40', '2021-03-14 23:57:32', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, 'ccc'),
(1614855009424, 0, NULL, 'ta', 'bbbb', '', NULL, NULL, '', NULL, NULL, NULL, '', '0', 0, 0, '4', '2021-03-04 16:20:09', '2021-03-08 02:31:11', 1481179303607728865, 'news', '1', 'N', NULL, '0', '1', '', '', '', NULL, 'disabled', 0, 0, 'ccc'),
(1615549395362, 0, NULL, 'en', 'Hello WORld', '', NULL, NULL, '', NULL, NULL, 7, NULL, '0', 0, 0, '4', '2021-03-12 17:13:15', '2021-04-07 02:22:04', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 0, 0, 'hello-world'),
(1618829106574, 0, NULL, 'hi', 'new acr', '', NULL, NULL, '', NULL, NULL, 4, NULL, '0', 0, 0, '4', '2021-04-19 16:15:06', '2021-04-19 05:15:06', 1481179303607728865, 'news', '1', 'N', NULL, '0', '0', '', '', '', NULL, 'disabled', 0, 0, 'cat-1618829106574'),
(1481179303610674895, 0, NULL, 'en', 'Politics', '48', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5a8ff9c66a81d_politics-intro.mp4', 1, 0, 7, 'https://editorji-live-bucket.s3.amazonaws.com/5cc3f8acc97f5_elections-1.jpg', '0', 0, 0, '4', '2016-12-05 08:44:38', '2020-11-18 08:04:25', 1598951711445, 'preferences', '1', 'N', NULL, '1', '1', 'Politics News Videos: Latest Political News, Indian Politics News, Politics News Online', 'Politics News Videos: Editorji brings to you the latest political news in India and breaking news headlines. Stay updated with the current news on Indian politics and top political headlines online. ', '', '', 'disabled', 0, 1, NULL),
(1481179303613656085, 0, NULL, 'en', 'Social', '48', NULL, NULL, '', 2, 12, 9, 'https://editorji-live-bucket.s3.amazonaws.com/1557314935608_20190508112855_compress.jpg ', '0', 0, 0, '4', '2016-12-05 08:44:38', '2020-10-13 08:26:54', 1563171338586, 'preferences', '0', 'N', NULL, '0', '0', '', '', NULL, NULL, 'disabled', 0, 0, NULL),
(1481179303616506989, 0, NULL, 'en', 'International', '48', '1', 1, 'https://editorji-live-bucket.s3.amazonaws.com/5e2ec6f2b886f_international.mp4', 3, 5, 3, 'https://editorji-live-bucket.s3.amazonaws.com/1557115268113_20190506040108_compress.jpeg ', '2', 3, 10, '2', '2016-12-05 08:44:38', '2021-07-22 00:26:49', 1481179303607728865, 'preferences', '1', 'N', NULL, '1', '1', 'World News Videos: Latest International News, Breaking World News, World News Headlines', 'World News Videos: Get the latest international news & watch breaking world news videos from across the globe on editorji. Our world news headlines cover politics, crime, celebrity and sports.', 'International affairs', '', 'enabled', 1, 1, 'international-1481179303616506989'),
(1481179303619960884, 0, NULL, 'en', 'Local', '48', '3', NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5b8cc6915209e_vikram-local-news-link-0109.mp4', 4, 0, 5, 'https://editorji-live-bucket.s3.amazonaws.com/5cc3f7a11a210_national-1.jpg', '3', 2, 10, '3', '2016-12-05 08:44:38', '2021-03-08 02:32:16', 1598951711445, 'preferences', '1', 'N', NULL, '0', '0', 'Local News Videos: Latest Local News, City News, Today\'s Regional News, Local News Headlines', 'Get updates on the latest local news and headlines and easy access to a personalised news feed on editorji. Find the latest regional news in English online on Editorji.', '', NULL, 'disabled', 0, 1, NULL),
(1481179303622920022, 0, NULL, 'en', 'Sports', '48', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5e2ec73237084_sports.mp4', 5, 0, 11, 'https://editorji-live-bucket.s3.amazonaws.com/5cc3f1bd18513_sports.jpg', '0', 4, 15, '4', '2016-12-05 08:44:38', '2021-04-07 02:22:04', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Sports News Videos: Latest Sports News, Cricket News, Sports News Headlines, Cricket Live Scores', 'Sports News Video: Catch the lastest buzz on national and international sports news coverage, live scores, video highlights and updates on cricket, football, tennis, basketball, hockey and badminton.', 'Sports News', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303622920022.jpg', 'enabled', 1, 1, 'sports'),
(1481179303626055122, 0, NULL, 'en', 'Tech', '168', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5ca2f6ad6e487_5c9ad04b59135-tech.mp4', 6, 0, 17, 'https://editorji-live-bucket.s3.amazonaws.com/5cc41daf38bb2_tech-2.jpg', '0', 5, 10, '4', '2016-12-05 08:44:38', '2021-08-16 09:25:59', 1598951711445, 'news', '1', 'N', NULL, '1', '1', 'Tech News Video: Latest Technology News, Mobile News, New Gadgets Reviews ', 'Get the latest technology news, mobile news, gadget news and review videos on upcoming technology and products. editorji.com is your destination to watch the latest tech news.', 'Technology News', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303626055122.jpg', 'enabled', 1, 1, NULL),
(1481179303629834929, 0, NULL, 'en', 'Business', '48', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5e2ec70dec622_business.mp4', 7, 0, 20, 'https://editorji-live-bucket.s3.amazonaws.com/5cc3f648b1fa3_business.jpg', '0', 6, 5, '4', '2016-12-05 08:44:38', '2021-04-07 02:22:04', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Business News Video: Latest Financial News, Business News Today, Share Market News', 'Business News Video: Get insights into the business world and stay up-to-date with the latest economy news video, sensex news, changing market trends and stock values in India and around the World at Editorji.', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303629834929.jpg', 'enabled', 1, 1, 'business'),
(1481179303632744347, 0, NULL, 'en', 'Showbiz', '48', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5e2ec76a36bf9_showbiz.mp4', 8, 210, 27, 'https://editorji-live-bucket.s3.amazonaws.com/1565692755904_20190813103915_compress.jpg ', '0', 7, 10, '4', '2016-12-05 08:44:38', '2021-04-07 02:22:04', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Entertainment News Videos: Latest Showbiz News, Bollywood News, Celebrity Gossip, Entertainment News', 'Your daily fix of the latest from the world of showbiz, entertainment news, tv news, celebrity gossip, exclusive photos and interviews, movie reviews and celebrity videos. Are you a fan of Bollywood gossip? Get spicy showbiz news on Editorji. Not only the latest Bollywood news, get the latest showbiz news from Hollywood also.', 'From the world of showbiz', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303632744347.jpg', 'enabled', 1, 1, 'showbiz'),
(1481179303636282807, 0, NULL, 'en', 'Lifestyle', '168', NULL, NULL, 'https://editorji-live-bucket.s3.amazonaws.com/5e31767f030d4_lifestyle.mp4', 9, 0, 35, 'https://editorji-live-bucket.s3.amazonaws.com/5cc3f38b8bde0_lifestyle-2.jpg', '0', 8, 10, '4', '2016-12-05 08:44:38', '2021-04-07 02:22:04', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Lifestyle News Videos: Latest Lifestyle News, Fashion Trends, Beauty Tips and Health News', 'Lifestyle News Video: Follow the latest lifestyle news, food videos, fashion trends, beauty tips, travel guides and health news.', 'Lifestyle News', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303636282807.jpg', 'enabled', 1, 1, 'lifestyle'),
(1481179303645408129, 0, 40, 'hi', 'राजनीति', '48', NULL, 3, '', 1, 4, 3, 'https://editorji-live-bucket.s3.amazonaws.com/1557115170734_20190506035930_compress.jpg ', '0', 0, 0, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Political News In Hindi: Political Samachar, राजनीति समाचार वीडियो,  Indian Political News, राजनीति न्यूज़ ', 'Political News Video in Hindi: Read and Watch latest Political news, Politics ki taza khabar, राजनीति समाचार  on Editorji Hindi. पढ़ें राजनीति जगत की ताजा खबरें और समाचार exclusively एडिटर जी पर.', '', NULL, 'disabled', 1, 1, 'polotics'),
(1481179303648248571, 0, 34, 'hi', 'सामाजिक ', '168', NULL, NULL, '', 2, 14, 99, 'https://editorji-live-bucket.s3.amazonaws.com/1557315017825_20190508113017_compress.jpg ', '0', 0, 0, '4', '2016-12-05 07:04:31', '2020-10-13 08:26:54', 1554105018985, 'news', '1', 'N', NULL, '0', '0', NULL, NULL, NULL, NULL, 'disabled', 0, 0, NULL),
(1481179303651531140, 0, 6, 'hi', 'दुनिया', '48', '1', 5, 'https://editorji-live-bucket.s3.amazonaws.com/5c502996ea599_duniya-new-hindi.mp4', 3, 8, 7, 'https://editorji-live-bucket.s3.amazonaws.com/1557292411237_20190508051331_compress.jpg ', '0', 6, 5, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1602244311612, 'preferences', '1', 'N', NULL, '1', '1', 'International News Video in Hindi: विश्व समाचार, World News Video, अंतर्राष्ट्रीय समाचार वीडियो ', 'Watch latest International and World news video clips in hindi from all over country at Editorji. वीडियो में देखियें सबसे ताज़ातरीन विश्व और दुनिया की मुख्य खबरें हिंदी में.', '', NULL, 'enabled', 1, 1, NULL),
(1481179303654623112, 0, 39, 'hi', 'लोकल ख़बरें', '48', '3', 4, '', 4, 6, 2, 'https://editorji-live-bucket.s3.amazonaws.com/1557144574921_20190506120934_compress.jpeg ', '0', 2, 10, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1598951711445, 'preferences', '1', 'N', NULL, '1', '1', 'Local News Videos in Hindi, राज्य और शहर की खबरें, Latest Hindi News of City and States', 'Local News In Hindi: Watch Latest Local News Videos in hindi from all over India at Editorji. Get breaking शहर और राज्य समाचार on includes politics, business, sports, entertainment, crime and more.', '', NULL, 'disabled', 1, 1, NULL),
(1481179303658158944, 0, 16, 'hi', 'खेल', '48', NULL, 6, 'https://editorji-live-bucket.s3.amazonaws.com/5c4b315781446_khel-hindi.mp4', 5, 18, 9, 'https://editorji-live-bucket.s3.amazonaws.com/1557315658354_20190508114058_compress.jpg ', '0', 3, 10, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1602244311612, 'news', '1', 'N', NULL, '1', '1', 'Sports News Video in Hindi: खेल समाचार,  Sports Hindi News Headlines, क्रिकेट समाचार', 'Sports News in Hindi: Watch and Read All Latest Sports Hindi News, IPL 2020 News hindi, स्पोर्ट्स न्यूज़,  क्रिकेट समाचार, live scores (लाइव स्कोर) on Cricket, Tennis, Badminton and more related to sports at editorji. पाइए खेल और खिलाड़ियों से जुड़ी पल-पल की खबर सिर्फ एडिटर जी पर.', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303658158944.jpg', 'enabled', 1, 1, NULL),
(1481179303661492641, 0, 44, 'hi', 'टेक-ऑटो', '168', NULL, 11, 'https://editorji-live-bucket.s3.amazonaws.com/5c4b31139d437_tech-hindi.mp4', 6, 12, 12, 'https://editorji-live-bucket.s3.amazonaws.com/1557314935608_20190508112855_compress.jpg ', '0', 8, 10, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Tech and Auto News In Hindi: Car and Auto Reviews, ऑटो न्यूज़, Latest Gadget, Laptop and Mobile Review Video', 'Read and Watch Tech and Auto News videos in Hindi, Gadgets News, Car News, Upcoming Mobile Phones, गैजेट समाचार, Automobiles Reviews in Video, ऑटोमोबाइल्स वीडियो, Latest Laptops and Mobile Reviews in Hindi at Editorji.', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303661492641.jpg', 'enabled', 1, 1, 'tech-auto'),
(1481179303664292304, 0, 27, 'hi', 'बिज़नेस', '48', NULL, 13, 'https://editorji-live-bucket.s3.amazonaws.com/5c4b336a27a31_vyapar-hindi.mp4', 7, 16, 16, 'https://editorji-live-bucket.s3.amazonaws.com/1557315460814_20190508113740_compress.jpg ', '0', 7, 10, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', 'Business News Video in Hindi: बिजनेस समाचार, Today Business News, व्यापार समाचार, Sensex News and Nifty, BSE News Hindi', 'Get latest business news (बिजनेस समाचार) videos in Hindi from India and around the world. Read Sensex News, Stock Market (स्टॉक मार्केट) News In Hindi, Finance News Videos, Economics News India at Editorji.', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303664292304.jpg', 'enabled', 1, 1, 'business'),
(1481179303667502492, 0, 42, 'hi', 'एंटरटेनमेंट', '48', NULL, 9, 'https://editorji-live-bucket.s3.amazonaws.com/5c4b33a3de3a2_manoranjan-hindi.mp4', 8, 2, 19, 'https://editorji-live-bucket.s3.amazonaws.com/1556711521913_20190501115201_compress.jpeg ', '0', 4, 10, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1602244311612, 'news', '1', 'N', NULL, '1', '1', 'Entertainment Video in Hindi: एंटरटेनमेंट समाचार,  Bollywood News Video, Movie Review In Hindi, मनोरंजन की खबर', 'Bollywood News Video In Hindi: Read Latest Entertainment News in Hindi, Gossip News, Movie Review in Hindi, TV news and Mnoranjan ki Khabren, बॉक्स ऑफिस कलेक्शन और मनोरंजन की खबर at editorji.com.', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303667502492.jpg', 'enabled', 1, 1, NULL),
(1481179303671335840, 0, 36, 'hi', 'वायरल', '168', NULL, 7, '', 9, 0, 32, 'https://editorji-live-bucket.s3.amazonaws.com/5c6bf701f1b7a_generic.jpg', '0', 5, 10, '4', '2016-12-05 07:04:31', '2021-03-14 23:57:32', 1598951711445, 'news', '1', 'N', NULL, '1', '1', 'Viral Videos in Hindi: Social Viral News, Trending News, वायरल न्यूज हिंदी, Latest Viral News', 'Watch and Read all viral hindi news and see latest viral videos, trending news in hindi on Editorji. Read trending viral news in hindi. पढ़िए वायरल और ट्रेंडिंग से जुड़े हुए ताज़ा ख़बर सिर्फ एडिटर जी पर.', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303671335840.jpg', 'enabled', 1, 1, NULL),
(1481179303680266448, 0, 1481179303680266448, 'ta', 'রাজনীতি', '168', NULL, NULL, '', 1, NULL, 99, '', '0', 4, 5, '4', '2016-12-05 07:04:31', '2020-10-29 04:03:49', 1598951711445, 'news', '1', 'N', NULL, '1', '1', '', '', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303680266448.jpg', 'disabled', 1, 0, NULL),
(1481179303683185641, 0, 1481179303683185641, 'ta', 'করোনা', '168', NULL, NULL, '', 2, NULL, 99, '', '0', 0, 0, '4', '2016-12-05 07:04:31', '2020-10-29 04:03:49', 1598951711445, 'news', '1', 'N', NULL, '1', '1', '', '', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303683185641.jpg', 'disabled', 1, 0, NULL),
(1481179303686732370, 0, 1481179303686732370, 'ta', 'দেশ', '168', NULL, 1, '', 3, NULL, 99, '', '0', 1, 15, '4', '2016-12-05 07:04:31', '2021-03-14 23:59:05', 1481179303607728865, 'preferences', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 1, 0, 'ban-gal'),
(1481179303690979049, 0, 1481179303690979049, 'ta', 'বিদেশ', '168', NULL, 5, '', 4, NULL, 99, '', '0', 8, 5, '4', '2016-12-05 07:04:31', '2021-03-14 23:59:05', 1481179303607728865, 'preferences', '1', 'N', NULL, '1', '1', '', '', '', NULL, 'disabled', 1, 0, 'sbcs-h'),
(1481179303693925850, 0, 1481179303693925850, 'ta', 'ট্রেন্ডিং', '168', NULL, NULL, '', 5, NULL, 99, '', '0', 6, 5, '4', '2016-12-05 07:04:31', '2020-10-29 04:03:49', 1598951711445, 'news', '1', 'N', NULL, '1', '1', '', '', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303693925850.jpg', 'disabled', 1, 0, NULL),
(1481179303696882312, 0, 1481179303696882312, 'ta', 'লাইফস্টাইল', '168', NULL, NULL, '', 6, NULL, 99, '', '0', 7, 5, '4', '2016-12-05 07:04:31', '2020-10-29 04:03:49', 1598951711445, 'news', '1', 'N', NULL, '1', '1', '', '', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481179303696882312.jpg', 'disabled', 1, 0, NULL),
(1481181378842237045, 0, 1481181378842237045, 'ta', 'বিনোদন', '168', NULL, 2, '', 7, NULL, 99, '', '0', 5, 5, '4', '2016-12-05 07:04:31', '2021-04-19 05:13:47', 1481179303607728865, 'news', '1', 'N', NULL, '1', '1', '', '', 'বিনোদনের সব খবর', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481181378842237045.jpg', 'disabled', 1, 0, 'bangla-cat-1481181378842237045'),
(1481181378845364146, 0, 1481181378845364146, 'ta', 'কলকাতা', '168', NULL, NULL, '', 8, NULL, 99, '', '0', 2, 30, '4', '2016-12-05 07:04:31', '2021-08-17 13:10:45', 1624335361884, 'news', '1', 'N', NULL, '1', '1', '', '', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481181378845364146.jpg', 'disabled', 1, 0, NULL),
(1481181378848297063, 0, 1481181378848297063, 'ta', 'ব্যবসা-বাণিজ্য', '168', NULL, NULL, '', 9, NULL, 99, '', '0', 10, 5, '4', '2016-12-05 07:04:31', '2020-10-29 04:03:49', 1598951711445, 'news', '1', 'N', NULL, '1', '1', '', '', '', 'https://editorji-live-bucket.s3.amazonaws.com/category_thumb/1481181378848297063.jpg', 'disabled', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_sibling`
--

CREATE TABLE `category_sibling` (
  `id` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL DEFAULT '0',
  `category_id_ta` bigint(20) NOT NULL DEFAULT '0',
  `category_name` varchar(50) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_sibling`
--

INSERT INTO `category_sibling` (`id`, `category_id`, `category_id_ta`, `category_name`, `sequence`, `created_by`, `updated_by`, `created_date`, `updated_date`) VALUES
(0, 1578309955152, 1481181378845364146, 'Hindustan Times', NULL, 1624335361884, 1624335361884, '2021-08-17 18:40:45', '2021-08-17 13:10:45');

-- --------------------------------------------------------

--
-- Table structure for table `category_tags`
--

CREATE TABLE `category_tags` (
  `id` bigint(11) NOT NULL,
  `category_id` bigint(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `city_state_id` bigint(20) UNSIGNED NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `city_abb` varchar(15) DEFAULT NULL,
  `city_std` varchar(15) DEFAULT NULL,
  `is_top_city` bit(1) DEFAULT NULL,
  `json_data` text,
  `city_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `city_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_state_id`, `city_name`, `city_abb`, `city_std`, `is_top_city`, `json_data`, `city_updated_date`, `city_updated_by`) VALUES
(1481179303097085243, 1481178683110014642, 'Ahmedabad', '', '', b'0', '{\"en\":{\"title\":\"Ahmedabad\"},\"hi\":{\"title\":\"अहमदाबाद\"},  \"ta\":{\"title\":\"அகமதாபாத்\"  }}', '2014-05-07 05:23:49', 'admin'),
(1481179303099992771, 1481179303062111024, 'Allahabad', '', '', b'0', '{\"en\":{\"title\":\"Allahabad\"},\"hi\":{\"title\":\"इलाहाबाद\"},  \"ta\":{\"title\":\"அலகாபாத்\"  }}', '2014-05-06 12:35:01', 'admin'),
(1481179303104348390, 1481179303049011399, 'Alwar', '', '', b'0', '{\"en\":{\"title\":\"Alwar\"},\"hi\":{\"title\":\"अलवर\"},  \"ta\":{\"title\":\"ஆழ்வார்\"  }}', '2014-05-07 05:27:57', 'admin'),
(1481179303107319151, 1481179303094181377, 'Amritsar', '', '', b'0', '{\"en\":{\"title\":\"Amritsar\"},\"hi\":{\"title\":\"अमृतसर\"},  \"ta\":{\"title\":\"அமிர்தசரஸ்\"  }}', '2014-05-07 05:28:55', 'admin'),
(1481179303110245304, 1481178683089753788, 'Andhra Pradesh', '', '', b'0', '{\"en\":{\"title\":\"Andhra Pradesh\"},\"hi\":{\"title\":\"आंध्र प्रदेश\"},  \"ta\":{\"title\":\"ஆந்திரப் பிரதேசம்\"  }}', '2014-05-07 05:29:26', 'admin'),
(1481179303113284267, 1481178683134969818, 'Aurangabad', '', '', b'0', '{\"en\":{\"title\":\"Aurangabad\"},\"hi\":{\"title\":\"औरंगाबाद\"},  \"ta\":{\"title\":\"அவுரங்காபாத்\"  }}', '2014-05-07 05:32:46', 'admin'),
(1481179303116332062, 1481178683112788636, 'Ballabgarh', '', '', b'0', '{\"en\":{\"title\":\"Ballabgarh\"},\"hi\":{\"title\":\"बल्लभगढ़\"},  \"ta\":{\"title\":\"பாலாப்கார்\"  }}', '2014-05-07 05:35:06', 'admin'),
(1481179303120292090, 1481178683125912637, 'Bangalore', '', '', b'1', '{\"en\":{\"title\":\"Bangalore\"},\"hi\":{\"title\":\"बैंगलोर\"},  \"ta\":{\"title\":\"பெங்களூர்\"  }}', '2014-05-07 05:35:33', 'admin'),
(1481179303123500815, 1481178683125912637, 'Bellary', '', '', b'0', '{\"en\":{\"title\":\"Bellary\"},\"hi\":{\"title\":\"बेल्लारी\"},  \"ta\":{\"title\":\"பெல்லாரி\"  }}', '2014-05-07 05:38:12', 'admin'),
(1481179303126488128, 1481178683125912637, 'Bengaluru', '', '', b'0', '{\"en\":{\"title\":\"Bengaluru\"},\"hi\":{\"title\":\"बेंगलुरू\"},  \"ta\":{\"title\":\"பெங்களூரு\"  }}', '2014-05-07 05:39:54', 'admin'),
(1481179303129521193, 1481179303046007522, 'Bhubaneswar', '', '', b'0', '{\"en\":{\"title\":\"Bhubaneswar\"},\"hi\":{\"title\":\"भुवनेश्वर\"},  \"ta\":{\"title\":\"புவனேஸ்வர்\"  }}', '2014-05-07 05:40:49', 'admin'),
(1481179303132751714, 1481179303094181377, 'Chandigarh', '', '', b'0', '{\"en\":{\"title\":\"Chandigarh\"},\"hi\":{\"title\":\"चंडीगढ़\"},  \"ta\":{\"title\":\"சண்டிகர்\"  }}', '2014-05-12 07:17:56', 'admin'),
(1481179303136377357, 1481179303056193882, 'Chennai', '', '', b'1', '{\"en\":{\"title\":\"Chennai\"},\"hi\":{\"title\":\"चेन्नई\"},  \"ta\":{\"title\":\"சென்னை\"  }}', '2014-05-07 05:54:08', 'admin'),
(1481179303139871965, 1481179303046007522, 'Cuttack', '', '', b'0', '{\"en\":{\"title\":\"Cuttack\"},\"hi\":{\"title\":\"कटक\"},  \"ta\":{\"title\":\"கட்டாக்\"  }}', '2014-05-07 05:55:19', 'admin'),
(1481179303142616655, 1481179303088263059, 'Delhi', '', '', b'0', '{\"en\":{\"title\":\"Delhi\"},\"hi\":{\"title\":\"दिल्ली\"},  \"ta\":{\"title\":\"தில்லி\"  }}', '2017-02-14 00:00:01', 'admin'),
(1481179303145408239, 1481178683116798065, 'Dharamsala', '', '', b'0', '{\"en\":{\"title\":\"Dharamsala\"},\"hi\":{\"title\":\"धर्मशाला\"},  \"ta\":{\"title\":\"தர்மசாலா\"  }}', '2014-05-07 05:55:30', 'admin'),
(1481179303148367853, 1481178683112788636, 'Dharuhera', '', '', b'0', '{\"en\":{\"title\":\"Dharuhera\"},\"hi\":{\"title\":\"धारूहेड़ा\"},  \"ta\":{\"title\":\"Dharuhera\"  }}', '2014-05-07 05:55:38', 'admin'),
(1481179303151800516, 1481178683112788636, 'Faridabad', '', '', b'0', '{\"en\":{\"title\":\"Faridabad\"},\"hi\":{\"title\":\"फरीदाबाद\"},  \"ta\":{\"title\":\"பரிதாபாத்\"  }}', '2014-05-07 05:55:52', 'admin'),
(1481179303155364995, 1481178683110014642, 'Gandhi Nagar', '', '', b'0', '{\"en\":{\"title\":\"Gandhi Nagar\"},\"hi\":{\"title\":\"गांधी नगर\"},  \"ta\":{\"title\":\"காந்தி நகர்\"  }}', '2014-05-07 05:57:11', 'admin'),
(1481179303158330354, 1481179303062111024, 'Ghaziabad', '', '', b'0', '{\"en\":{\"title\":\"Ghaziabad\"},\"hi\":{\"title\":\"गाज़ियाबाद\"},  \"ta\":{\"title\":\"காஸியாபாத்\"  }}', '2014-05-07 05:55:59', 'admin'),
(1481179303161287754, 1481179303088263059, 'Greater Mumbai', '', '', b'0', '{\"en\":{\"title\":\"Greater Mumbai\"},\"hi\":{\"title\":\"ग्रेटर मुंबई\"},  \"ta\":{\"title\":\"கிரேட்டர் மும்பை\"  }}', '2014-05-07 05:56:27', 'admin'),
(1481179303164384749, 1481179303062111024, 'Greater Noida', '', '', b'0', '{\"en\":{\"title\":\"Greater Noida\"},\"hi\":{\"title\":\"ग्रेटर नोएडा\"},  \"ta\":{\"title\":\"கிரேட்டர் நொய்டா\"  }}', '2014-05-07 05:56:33', 'admin'),
(1481179303168581391, 1481178683112788636, 'Gurgaon', '', '', b'0', '{\"en\":{\"title\":\"Gurgaon\"},\"hi\":{\"title\":\"गुडगाँव\"},  \"ta\":{\"title\":\"குர்கான்\"  }}', '2014-05-07 05:56:48', 'admin'),
(1481179303172271499, 1481179303062111024, 'Hapur', '', '', b'0', '{\"en\":{\"title\":\"Hapur\"},\"hi\":{\"title\":\"हापुड़\"},  \"ta\":{\"title\":\"மீரட்\"  }}', '2014-05-07 05:58:01', 'admin'),
(1481179303175268098, 1481178683089753788, 'Hyderabad', '', '', b'0', '{\"en\":{\"title\":\"Hyderabad\"},\"hi\":{\"title\":\"हैदराबाद\"},  \"ta\":{\"title\":\"ஹைதெராபாத்\"  }}', '2014-05-07 05:58:23', 'admin'),
(1481179303178258124, 1481178683132228530, 'Indore', '', '', b'0', '{\"en\":{\"title\":\"Indore\"},\"hi\":{\"title\":\"इंदौर\"},  \"ta\":{\"title\":\"இந்தூர்\"  }}', '2014-05-07 05:58:29', 'admin'),
(1481179303181212601, 1481179303049011399, 'Jaipur', '', '', b'0', '{\"en\":{\"title\":\"Jaipur\"},\"hi\":{\"title\":\"जयपुर\"},  \"ta\":{\"title\":\"ஜெய்ப்பூர்\"  }}', '2014-05-19 09:54:43', 'admin'),
(1481179303184505093, 1481179303094181377, 'Jalandhar', '', '', b'0', '{\"en\":{\"title\":\"Jalandhar\"},\"hi\":{\"title\":\"जालंधर\"},  \"ta\":{\"title\":\"ஜலந்தர்\"  }}', '2014-05-07 05:58:48', 'admin'),
(1481179303187564537, 1481179303062111024, 'Kanpur', '', '', b'0', '{\"en\":{\"title\":\"Kanpur\"},\"hi\":{\"title\":\"कानपुर\"},  \"ta\":{\"title\":\"கான்பூர்\"  }}', '2014-05-07 05:59:07', 'admin'),
(1481179303190432559, 1481178683112788636, 'Karnal', '', '', b'0', '{\"en\":{\"title\":\"Karnal\"},\"hi\":{\"title\":\"करनाल\"},  \"ta\":{\"title\":\"கர்னால்\"  }}', '2014-05-07 05:59:11', 'admin'),
(1481179303193415038, 1481178683129305258, 'Kochi', '', '', b'0', '{\"en\":{\"title\":\"Kochi\"},\"hi\":{\"title\":\"कोच्चि\"},  \"ta\":{\"title\":\"கொச்சி\"  }}', '2014-05-07 05:59:27', 'admin'),
(1481179303196968820, 1481179303068417016, 'Kolkata', '', '', b'1', '{\"en\":{\"title\":\"Kolkata\"},\"hi\":{\"title\":\"कोलकाता\"},  \"ta\":{\"title\":\"கொல்கத்தா\"  }}', '2014-05-07 05:59:43', 'admin'),
(1481179303200773970, 1481178683134969818, 'Latur', '', '', b'0', '{\"en\":{\"title\":\"Latur\"},\"hi\":{\"title\":\"लातूर\"},  \"ta\":{\"title\":\"லத்தூர்\"  }}', '2014-05-07 06:00:57', 'admin'),
(1481179303204448564, 1481179303062111024, 'Lucknow', '', '', b'0', '{\"en\":{\"title\":\"Lucknow\"},\"hi\":{\"title\":\"लखनऊ\"},  \"ta\":{\"title\":\"லக்னோ\"  }}', '2014-05-07 06:01:03', 'admin'),
(1481179303207281972, 1481179303094181377, 'Ludhiana', '', '', b'0', '{\"en\":{\"title\":\"Ludhiana\"},\"hi\":{\"title\":\"लुधियाना\"},  \"ta\":{\"title\":\"லூதியானா\"  }}', '2014-05-07 06:01:09', 'admin'),
(1481179303210099784, 1481178683132228530, 'Madhya Pradesh', '', '', b'0', '{\"en\":{\"title\":\"Madhya Pradesh\"},\"hi\":{\"title\":\"मध्य प्रदेश\"},  \"ta\":{\"title\":\"மத்தியப் பிரதேசம்\"  }}', '2014-05-07 06:01:14', 'admin'),
(1481179303212920252, 1481178683112788636, 'Manesar', '', '', b'0', '{\"en\":{\"title\":\"Manesar\"},\"hi\":{\"title\":\"मानेसर\"},  \"ta\":{\"title\":\"மானேசர்\"  }}', '2014-05-07 06:01:28', 'admin'),
(1481179303215807273, 1481179303062111024, 'Modinagar', '', '', b'0', '{\"en\":{\"title\":\"Modinagar\"},\"hi\":{\"title\":\"मोदीनगर\"},  \"ta\":{\"title\":\"மோதிநகர்\"  }}', '2014-05-07 06:01:40', 'admin'),
(1481179303219322285, 1481179303094181377, 'Mohali', '', '', b'0', '{\"en\":{\"title\":\"Mohali\"},\"hi\":{\"title\":\"मोहाली\"},  \"ta\":{\"title\":\"மொஹாலி\"  }}', '2014-05-07 06:01:45', 'admin'),
(1481179303222380438, 1481178683134969818, 'Mumbai', '', '', b'1', '{\"en\":{\"title\":\"Mumbai\"},\"hi\":{\"title\":\"मुंबई\"},  \"ta\":{\"title\":\"மும்பை\"  }}', '2014-05-07 06:01:51', 'admin'),
(1481179303225328714, 1481179303062111024, 'Murad Nagar', '', '', b'0', '{\"en\":{\"title\":\"Murad Nagar\"},\"hi\":{\"title\":\"मुराद नगर\"},  \"ta\":{\"title\":\"முராத் நகர்\"  }}', '2014-05-07 06:01:55', 'admin'),
(1481179303229256965, 1481178683134969818, 'Nagpur', '', '', b'0', '{\"en\":{\"title\":\"Nagpur\"},\"hi\":{\"title\":\"नागपुर\"},  \"ta\":{\"title\":\"நாக்பூர்\"  }}', '2014-05-07 06:02:05', 'admin'),
(1481179303232176388, 1481178683134969818, 'Nanded', '', '', b'0', '{\"en\":{\"title\":\"Nanded\"},\"hi\":{\"title\":\"नांदेड़\"},  \"ta\":{\"title\":\"நான்டெட்\"  }}', '2014-05-07 06:02:10', 'admin'),
(1481179303235832879, 1481179303062111024, 'Narora ', '', '', b'0', '{\"en\":{\"title\":\"Narora \"},\"hi\":{\"title\":\"नरोरा\"},  \"ta\":{\"title\":\"Narora\"  }}', '2014-05-07 06:02:20', 'admin'),
(1481179303239295972, 1481178683134969818, 'Navi Mumbai', '', '', b'1', '{\"en\":{\"title\":\"Navi Mumbai\"},\"hi\":{\"title\":\"नवी मुंबई\"},  \"ta\":{\"title\":\"நவி மும்பை\"  }}', '2014-05-07 06:02:38', 'admin'),
(1481179303242234562, 1481179303088263059, 'NCR', '', '', b'1', '{\"en\":{\"title\":\"NCR\"},\"hi\":{\"title\":\"एनसीआर\"},  \"ta\":{\"title\":\"என்.சி.ஆர்\"  }}', '2014-05-07 06:02:42', 'admin'),
(1481179303245230458, 1481179303088263059, 'New Delhi', '', '', b'1', '{\"en\":{\"title\":\"New Delhi\"},\"hi\":{\"title\":\"नई दिल्ली\"},  \"ta\":{\"title\":\"புது தில்லி\"  }}', '2014-05-07 06:03:18', 'admin'),
(1481179303248173096, 1481179303062111024, 'Noida', '', '', b'0', '{\"en\":{\"title\":\"Noida\"},\"hi\":{\"title\":\"नोएडा\"},  \"ta\":{\"title\":\"நொய்டா\"  }}', '2014-05-07 06:03:23', 'admin'),
(1481179303251405952, 1481179303046007522, 'Orissa', '', '', b'0', '{\"en\":{\"title\":\"Orissa\"},\"hi\":{\"title\":\"ओडिशा\"},  \"ta\":{\"title\":\"ஒரிசா\"  }}', '2014-05-07 06:03:28', 'admin'),
(1481179303254534743, 1481178683112788636, 'Palwal', '', '', b'0', '{\"en\":{\"title\":\"Palwal\"},\"hi\":{\"title\":\"पलवल\"},  \"ta\":{\"title\":\"பல்வால்\"  }}', '2014-05-07 06:03:37', 'admin'),
(1481179303257794038, 1481178683106873617, 'Panaji', '', '', b'0', '{\"en\":{\"title\":\"Panaji\"},\"hi\":{\"title\":\"पणजी\"},  \"ta\":{\"title\":\"பனாஜி\"  }}', '2014-05-07 06:03:41', 'admin'),
(1481179303261518276, 1481178683134969818, 'Pune', '', '', b'0', '{\"en\":{\"title\":\"Pune\"},\"hi\":{\"title\":\"पुणे\"},  \"ta\":{\"title\":\"புனே\"  }}', '2014-05-07 06:03:55', 'admin'),
(1481179303264468922, 1481178683103918515, 'Raipur', '', '', b'0', '{\"en\":{\"title\":\"Raipur\"},\"hi\":{\"title\":\"रायपुर\"},  \"ta\":{\"title\":\"ராய்ப்பூர்\"  }}', '2014-05-07 06:04:03', 'admin'),
(1481179303267742009, 1481178683110014642, 'Rajkot', '', '', b'0', '{\"en\":{\"title\":\"Rajkot\"},\"hi\":{\"title\":\"राजकोट\"},  \"ta\":{\"title\":\"ராஜ்கோட்\"  }}', '2014-05-07 06:04:11', 'admin'),
(1481179303271782631, 1481178683112788636, 'Rewari', '', '', b'0', '{\"en\":{\"title\":\"Rewari\"},\"hi\":{\"title\":\"रेवाड़ी\"},  \"ta\":{\"title\":\"ரேவாரி\"  }}', '2014-05-07 06:04:15', 'admin'),
(1481179303274680176, 1481178683089753788, 'Secunderabad', '', '', b'0', '{\"en\":{\"title\":\"Secunderabad\"},\"hi\":{\"title\":\"सिकंदराबाद\"},  \"ta\":{\"title\":\"சிக்கந்தராபாத்\"  }}', '2014-05-07 06:04:38', 'admin'),
(1481179303277824548, 1481178683116798065, 'Shimla', '', '', b'0', '{\"en\":{\"title\":\"Shimla\"},\"hi\":{\"title\":\"शिमला\"},  \"ta\":{\"title\":\"சிம்லா\"  }}', '2014-05-07 06:04:46', 'admin'),
(1481179303280901861, 1481178683112788636, 'Sirsa', '', '', b'0', '{\"en\":{\"title\":\"Sirsa\"},\"hi\":{\"title\":\"सिरसा\"},  \"ta\":{\"title\":\"சிர்சா\"  }}', '2014-05-07 06:04:50', 'admin'),
(1481179303284110462, 1481178683112788636, 'Sonepat', '', '', b'0', '{\"en\":{\"title\":\"Sonepat\"},\"hi\":{\"title\":\"सोनीपत\"},  \"ta\":{\"title\":\"சோனிபட்\"  }}', '2014-05-07 06:05:09', 'admin'),
(1481179303287489549, 1481178683110014642, 'Surat', '', '', b'0', '{\"en\":{\"title\":\"Surat\"},\"hi\":{\"title\":\"सूरत\"},  \"ta\":{\"title\":\"சூரத்\"  }}', '2014-05-07 06:05:17', 'admin'),
(1481179303291041036, 1481179303056193882, 'Tamil Nadu', '', '', b'0', '{\"en\":{\"title\":\"Tamil Nadu\"},\"hi\":{\"title\":\"तमिलनाडु\"},  \"ta\":{\"title\":\"தமிழ்நாடு\"  }}', '2014-05-07 06:05:42', 'admin'),
(1481179303294154994, 1481178683134969818, 'Thane', '', '', b'0', '{\"en\":{\"title\":\"Thane\"},\"hi\":{\"title\":\"थाइन\"},  \"ta\":{\"title\":\"தானே\"  }}', '2014-05-07 06:05:55', 'admin'),
(1481179303297170849, 1481179303049011399, 'Udaipur', '', '', b'0', '{\"en\":{\"title\":\"Udaipur\"},\"hi\":{\"title\":\"उदयपुर\"},  \"ta\":{\"title\":\"உதய்பூர்\"  }}', '2014-05-07 06:06:15', 'admin'),
(1481179303300150772, 1481178683132228530, 'Ujjain', '', '', b'0', '{\"en\":{\"title\":\"Ujjain\"},\"hi\":{\"title\":\"उज्जैन\"},  \"ta\":{\"title\":\"உஜ்ஜைன்\"  }}', '2014-05-07 06:06:21', 'admin'),
(1481179303304622265, 1481178683110014642, 'Vadodara', '', '', b'0', '{\"en\":{\"title\":\"Vadodara\"},\"hi\":{\"title\":\"वडोदरा\"},  \"ta\":{\"title\":\"வதோதரா\"  }}', '2014-05-07 06:06:25', 'admin'),
(1481179303307607161, 1481178683089753788, 'Visakhapatnam', '', '', b'0', '{\"en\":{\"title\":\"Visakhapatnam\"},\"hi\":{\"title\":\"विशाखापत्तनम\"},  \"ta\":{\"title\":\"விசாகப்பட்டினம்\"  }}', '2014-05-07 06:06:35', 'admin'),
(1481179303310526205, 1481179303068417016, 'West Bengal', '', '033', b'0', '{\"en\":{\"title\":\"West Bengal\"},\"hi\":{\"title\":\"पश्चिम बंगाल\"},  \"ta\":{\"title\":\"மேற்கு வங்க\"  }}', '2014-05-07 06:06:39', 'admin'),
(1481179303313781854, 1481178683129305258, 'kottayam', '', '0481', b'0', '{\"en\":{\"title\":\"kottayam\"},\"hi\":{\"title\":\"कोट्टायम\"},  \"ta\":{\"title\":\"கோட்டயம்\"  }}', '2014-05-07 06:00:39', 'admin'),
(1481179303317348888, 1481178683125912637, 'Mysore', '', '0821', b'0', '{\"en\":{\"title\":\"Mysore\"},\"hi\":{\"title\":\"मैसूर\"},  \"ta\":{\"title\":\"மைசூர்\"  }}', '2014-06-04 10:57:14', 'admin'),
(1481179303321729127, 1481178683106873617, 'Salcette', '', '0832', b'0', '{\"en\":{\"title\":\"Salcette\"},\"hi\":{\"title\":\"Salcette\"},  \"ta\":{\"title\":\"Salcette\"  }}', '2014-05-07 06:04:29', 'admin'),
(1481179303324745288, 1481178683106873617, 'Cansaulim', '', '832', b'0', '{\"en\":{\"title\":\"Cansaulim\"},\"hi\":{\"title\":\"Cansaulim\"},  \"ta\":{\"title\":\"Cansaulim\"  }}', '2014-05-07 05:53:12', 'admin'),
(1481179303327620242, 1481178683106873617, 'Goa', '', '+91832', b'0', '{\"en\":{\"title\":\"Goa\"},\"hi\":{\"title\":\"गोवा\"},  \"ta\":{\"title\":\"கோவா\"  }}', '2014-05-07 05:56:04', 'admin'),
(1481179303330506357, 1481179303062111024, 'Agra', '', '0562', b'0', '{\"en\":{\"title\":\"Agra\"},\"hi\":{\"title\":\"आगरा\"},  \"ta\":{\"title\":\"ஆக்ரா\"  }}', '2014-05-07 05:24:11', 'admin'),
(1481179303333415381, 1481179303065087128, 'Tehri-Garhwal', '', '01378', b'0', '{\"en\":{\"title\":\"Tehri-Garhwal\"},\"hi\":{\"title\":\"टिहरी-गढ़वाल\"},  \"ta\":{\"title\":\"தெஹ்ரி-கர்வால்\"  }}', '2014-05-07 06:05:51', 'admin'),
(1481179303337817806, 1481178683132228530, 'Bhopal', '', '0755', b'0', '{\"en\":{\"title\":\"Bhopal\"},\"hi\":{\"title\":\"भोपाल\"},  \"ta\":{\"title\":\"போபால்\"  }}', '2014-05-07 05:38:53', 'admin'),
(1481179303340859740, 1481179303049011399, 'Sawai Madhopur', '', '07462', b'0', '{\"en\":{\"title\":\"Sawai Madhopur\"},\"hi\":{\"title\":\"सवाई माधोपुर\"},  \"ta\":{\"title\":\"சவாய் மாதோபூர்\"  }}', '2014-05-07 06:04:34', 'admin'),
(1481179303343886200, 1481178683129305258, 'Trivandrum', '', '0471', b'0', '{\"en\":{\"title\":\"Trivandrum\"},\"hi\":{\"title\":\"त्रिवेंद्रम\"},  \"ta\":{\"title\":\"திருவனந்தபுரம்\"  }}', '2014-05-07 06:06:06', 'admin'),
(1481179303346974120, 1481178683129305258, 'Kasaragod ', '', '0467', b'0', '{\"en\":{\"title\":\"Kasaragod \"},\"hi\":{\"title\":\"कासरगोड\"},  \"ta\":{\"title\":\"காசர்கோடு\"  }}', '2014-05-07 05:59:17', 'admin'),
(1481179303349977220, 1481178683116798065, 'Solan', '', '01792', b'0', '{\"en\":{\"title\":\"Solan\"},\"hi\":{\"title\":\"सोलन\"},  \"ta\":{\"title\":\"சோலன்\"  }}', '2014-05-07 06:05:22', 'admin'),
(1481179303354467148, 1481179303056193882, 'Coimbatore', '', '0422', b'0', '{\"en\":{\"title\":\"Coimbatore\"},\"hi\":{\"title\":\"कोयम्बटूर\"},  \"ta\":{\"title\":\"கோயம்புத்தூர்\"  }}', '2014-05-07 05:55:01', 'admin'),
(1481179303357812911, 1481178683125912637, 'Coorg', '', '0827', b'0', '{\"en\":{\"title\":\"Coorg\"},\"hi\":{\"title\":\"कूर्ग\"},  \"ta\":{\"title\":\"கூர்க்\"  }}', '2014-05-07 05:55:12', 'admin'),
(1481179303360860942, 1481179303049011399, 'Jodhpur', '', '0291', b'0', '{\"en\":{\"title\":\"Jodhpur\"},\"hi\":{\"title\":\"जोधपुर\"},  \"ta\":{\"title\":\"ஜோத்பூர்\"  }}', '2014-05-07 05:58:56', 'admin'),
(1481179303363855751, 1481178683129305258, 'Calicut', '', '0495', b'0', '{\"en\":{\"title\":\"Calicut\"},\"hi\":{\"title\":\"कालीकट\"},  \"ta\":{\"title\":\"கோழிக்கோடு\"  }}', '2014-05-07 05:41:42', 'admin'),
(1481179303367032936, 1481178683125912637, 'Mangalore', '', '0824', b'0', '{\"en\":{\"title\":\"Mangalore\"},\"hi\":{\"title\":\"मंगलौर\"},  \"ta\":{\"title\":\"மங்களூர்\"  }}', '2014-05-07 06:01:35', 'admin'),
(1481179303371171099, 1481178683134969818, 'Nashik', '', '0253', b'0', '{\"en\":{\"title\":\"Nashik\"},\"hi\":{\"title\":\"नासिक\"},  \"ta\":{\"title\":\"நாசிக்\"  }}', '2014-05-07 06:02:34', 'admin'),
(1481179303374274002, 1481178683125912637, 'Chikmagalur', '', '08262', b'0', '{\"en\":{\"title\":\"Chikmagalur\"},\"hi\":{\"title\":\"चिकमंगलूर\"},  \"ta\":{\"title\":\"சிக்மகளூர்\"  }}', '2014-05-07 05:54:44', 'admin'),
(1481179303377339098, 1481178683125912637, 'Coonoor', '', '0423', b'0', '{\"en\":{\"title\":\"Coonoor\"},\"hi\":{\"title\":\"कुन्नूर\"},  \"ta\":{\"title\":\"குன்னூர்\"  }}', '2014-05-07 05:55:06', 'admin'),
(1481179303380752226, 1481178683129305258, 'Ernakulam', '', '0484', b'0', '{\"en\":{\"title\":\"Ernakulam\"},\"hi\":{\"title\":\"एर्नाकुलम\"},  \"ta\":{\"title\":\"எர்ணாகுளம்\"  }}', '2014-05-07 05:55:46', 'admin'),
(1481179303385209151, 1481178683110014642, 'Junagadh', '', '0285', b'0', '{\"en\":{\"title\":\"Junagadh\"},\"hi\":{\"title\":\"जूनागढ़\"},  \"ta\":{\"title\":\"ஜூனாகத்\"  }}', '2014-05-07 05:59:02', 'admin'),
(1481179303388936591, 1481178683125912637, 'Hubli', '', '0836', b'0', '{\"en\":{\"title\":\"Hubli\"},\"hi\":{\"title\":\"हुबली\"},  \"ta\":{\"title\":\"ஹூப்ளி\"  }}', '2014-05-07 05:58:17', 'admin'),
(1481179303391868425, 1481178683125912637, 'Madurai', '', '0452', b'0', '{\"en\":{\"title\":\"Madurai\"},\"hi\":{\"title\":\"मदुरै\"},  \"ta\":{\"title\":\"மதுரை\"  }}', '2014-05-07 06:01:21', 'admin'),
(1481179303394836391, 1481179303049011399, 'Jaisalmer', '', '02992', b'0', '{\"en\":{\"title\":\"Jaisalmer\"},\"hi\":{\"title\":\"जैसलमेर\"},  \"ta\":{\"title\":\"ஜெய்சால்மர்\"  }}', '2014-05-07 05:58:42', 'admin'),
(1481179303397845155, 1481179303062111024, 'Varanasi', '', '0542', b'0', '{\"en\":{\"title\":\"Varanasi\"},\"hi\":{\"title\":\"वाराणसी\"},  \"ta\":{\"title\":\"வாரணாசி\"  }}', '2014-05-07 06:06:30', 'admin'),
(1481179303401540577, 1481178683129305258, 'Cochin', '', '484', b'0', '{\"en\":{\"title\":\"Cochin\"},\"hi\":{\"title\":\"कोचीन\"},  \"ta\":{\"title\":\"கொச்சி\"  }}', '2014-05-07 05:54:55', 'admin'),
(1481179303404660183, 1481178683129305258, 'Kollam', '', '0474', b'0', '{\"en\":{\"title\":\"Kollam\"},\"hi\":{\"title\":\"कोल्लम\"},  \"ta\":{\"title\":\"கொல்லம்\"  }}', '2014-03-25 22:53:16', 'admin'),
(1481179303407651608, 1481179303065087128, 'Rishikesh', '', '0135', b'0', '{\"en\":{\"title\":\"Rishikesh\"},\"hi\":{\"title\":\"ऋषिकेश\"},  \"ta\":{\"title\":\"ரிஷிகேஷ்\"  }}', '2014-05-07 06:04:20', 'admin'),
(1481179303410630624, 1481179303049011399, 'Ajmer', '', '0145', b'0', '{\"en\":{\"title\":\"Ajmer\"},\"hi\":{\"title\":\"अजमेर\"},  \"ta\":{\"title\":\"அஜ்மீர்\"  }}', '2014-05-07 05:25:11', 'admin'),
(1481179303414274190, 1481178683125912637, 'Gokarna', '', '08386', b'0', '{\"en\":{\"title\":\"Gokarna\"},\"hi\":{\"title\":\"गोकर्ण\"},  \"ta\":{\"title\":\"கோகர்ணா\"  }}', '2014-05-07 05:56:23', 'admin'),
(1481179303417644445, 1481178683129305258, 'Alappuzha', '', '0477', b'0', '{\"en\":{\"title\":\"Alappuzha\"},\"hi\":{\"title\":\"अलाप्पुझा\"},  \"ta\":{\"title\":\"ஆலப்புழா\"  }}', '2014-05-07 05:30:26', 'admin'),
(1481179303421449612, 1481179303094181377, 'Hoshiarpur', '', '01882', b'0', '{\"en\":{\"title\":\"Hoshiarpur\"},\"hi\":{\"title\":\"होशियारपुर\"},  \"ta\":{\"title\":\"ஹோஷியார்பூர்\"  }}', '2014-05-07 05:58:13', 'admin'),
(1481179303424358175, 1481178683129305258, 'Alleppey', '', '477', b'0', '{\"en\":{\"title\":\"Alleppey\"},\"hi\":{\"title\":\"अल्लेप्पी\"},  \"ta\":{\"title\":\"ஆலப்புழா\"  }}', '2014-05-07 05:26:48', 'admin'),
(1481179303427172541, 1481178683129305258, 'Thiruvananthapuram', '', '471', b'0', '{\"en\":{\"title\":\"Thiruvananthapuram\"},\"hi\":{\"title\":\"तिरुवनंतपुरम\"},  \"ta\":{\"title\":\"திருவனந்தபுரம்\"  }}', '2014-05-07 06:06:00', 'admin'),
(1481179303429942118, 1481178683110014642, 'Gujarat', '', '02692', b'0', '{\"en\":{\"title\":\"Gujarat\"},\"hi\":{\"title\":\"गुजरात\"},  \"ta\":{\"title\":\"குஜராத்\"  }}', '2014-05-07 05:56:39', 'admin'),
(1481179303432808613, 1481179303065087128, 'Haridwar', '', '01334', b'0', '{\"en\":{\"title\":\"Haridwar\"},\"hi\":{\"title\":\"हरिद्वार\"},  \"ta\":{\"title\":\"ஹரித்வார்\"  }}', '2014-05-07 05:58:07', 'admin'),
(1481179303436515681, 1481178683106873617, 'Bardez', '', '91832', b'0', '{\"en\":{\"title\":\"Bardez\"},\"hi\":{\"title\":\"बर्देज़\"},  \"ta\":{\"title\":\"பார்டெஸ்\"  }}', '2014-05-07 05:39:16', 'admin'),
(1481179303439590916, 1481179303056193882, 'Pudhucherry', '', '0413', b'0', '{\"en\":{\"title\":\"Pudhucherry\"},\"hi\":{\"title\":\"Pudhucherry\"},  \"ta\":{\"title\":\"புதுச்சேரி\"  }}', '2014-05-07 06:03:46', 'admin'),
(1481179303443230134, 1481178683129305258, 'Kerala', '', '91471', b'0', '{\"en\":{\"title\":\"Kerala\"},\"hi\":{\"title\":\"केरल\"},  \"ta\":{\"title\":\"கேரளா\"  }}', '2014-05-07 05:59:21', 'admin'),
(1481179303446809199, 1481178683129305258, 'Kumily', '', '048', b'0', '{\"en\":{\"title\":\"Kumily\"},\"hi\":{\"title\":\"कुमीली\"},  \"ta\":{\"title\":\"குமுளி\"  }}', '2014-05-07 06:00:49', 'admin'),
(1481179303449641097, 1481178683132228530, 'Khajuraho', '', '07686', b'0', '{\"en\":{\"title\":\"Khajuraho\"},\"hi\":{\"title\":\"खजुराहो\"},  \"ta\":{\"title\":\"கஜுராஹோ\"  }}', '2014-04-15 02:46:08', 'admin'),
(1481179303453610748, 1481178683129305258, 'Palakkad', '', '04912', b'0', '{\"en\":{\"title\":\"Palakkad\"},\"hi\":{\"title\":\"पलक्कड़\"},  \"ta\":{\"title\":\"பாலக்காடு\"  }}', '2014-05-07 06:03:33', 'admin'),
(1481179303456806264, 1481178683095353072, 'Guwahati', '', '0361', b'0', '{\"en\":{\"title\":\"Guwahati\"},\"hi\":{\"title\":\"गुवाहाटी\"},  \"ta\":{\"title\":\"கவுகாத்தி\"  }}', '2014-05-07 05:57:52', 'admin'),
(1481179303459775550, 1481179303049011399, 'Pali', '', '', b'0', '{\"en\":{\"title\":\"Pali\"},\"hi\":{\"title\":\"पाली\"},  \"ta\":{\"title\":\"பாலி\"  }}', '2014-05-12 08:57:26', 'admin'),
(1481179303463227470, 1481178683134969818, 'Alibaug', '', '', b'0', '{\"en\":{\"title\":\"Alibaug\"},\"hi\":{\"title\":\"अलीबाग\"},  \"ta\":{\"title\":\"அலிபாக்கிலுள்ள\"  }}', '2014-05-12 10:24:02', 'admin'),
(1481179303467483703, 1481178683129305258, 'Thrissur', '', '', b'0', '{\"en\":{\"title\":\"Thrissur\"},\"hi\":{\"title\":\"त्रिशूर\"},  \"ta\":{\"title\":\"திருச்சூர்\"  }}', '2014-05-12 11:21:32', 'admin'),
(1481179303475756684, 1481178683112788636, 'Panchkula', '', '', b'0', '{\"en\":{\"title\":\"Panchkula\"},\"hi\":{\"title\":\"पंचकुला\"},  \"ta\":{\"title\":\"பஞ்ச்குலா\"  }}', '2014-05-12 14:20:01', 'admin'),
(1481179303478693367, 1481179303094181377, 'Patiala', '', '', b'0', '{\"en\":{\"title\":\"Patiala\"},\"hi\":{\"title\":\"पटियाला\"},  \"ta\":{\"title\":\"பாட்டியாலா\"  }}', '2014-05-12 15:42:38', 'admin'),
(1481179303481675449, 1481178683089753788, 'Tirupati', '', '', b'0', '{\"en\":{\"title\":\"Tirupati\"},\"hi\":{\"title\":\"तिरुपति\"},  \"ta\":{\"title\":\"திருப்பதி\"  }}', '2014-05-13 05:52:46', 'admin'),
(1481179303485466066, 1481178683134969818, 'Mahabaleshwar', '', '', b'0', '{\"en\":{\"title\":\"Mahabaleshwar\"},\"hi\":{\"title\":\"महाबलेश्वर\"},  \"ta\":{\"title\":\"மஹாபலேஷ்வர்\"  }}', '2014-05-13 05:59:10', 'admin'),
(1481179303489204219, 1481178683106873617, 'Canacona', '', '', b'0', '{\"en\":{\"title\":\"Canacona\"},\"hi\":{\"title\":\"Canacona\"},  \"ta\":{\"title\":\"கொங்கனா\"  }}', '2014-05-13 07:39:10', 'admin'),
(1481179303492234253, 1481178683119587833, 'Srinagar', '', '0194', b'0', '{\"en\":{\"title\":\"Srinagar\"},\"hi\":{\"title\":\"श्रीनगर\"},  \"ta\":{\"title\":\"ஸ்ரீநகர்\"  }}', '2014-05-13 08:11:20', 'admin'),
(1481179303495181221, 1481178683129305258, 'Munnar', '', '', b'0', '{\"en\":{\"title\":\"Munnar\"},\"hi\":{\"title\":\"मुन्नार\"},  \"ta\":{\"title\":\"மூணாறு\"  }}', '2014-05-15 07:33:49', 'admin'),
(1481179303498071549, 1481179303056193882, 'Kumbakonam', '', '', b'0', '{\"en\":{\"title\":\"Kumbakonam\"},\"hi\":{\"title\":\"कुंभकोणम\"},  \"ta\":{\"title\":\"கும்பகோணம்\"  }}', '2014-05-15 09:32:11', 'admin'),
(1481179303501348906, 1481179303056193882, 'Nilgiris', '', '', b'0', '{\"en\":{\"title\":\"Nilgiris\"},\"hi\":{\"title\":\"नीलगिरी\"},  \"ta\":{\"title\":\"நீலகிரி\"  }}', '2014-05-16 08:27:14', 'admin'),
(1481179303505018339, 1481178683106873617, 'Salcete', '', '', b'0', '{\"en\":{\"title\":\"Salcete\"},\"hi\":{\"title\":\"साष्टी\"},  \"ta\":{\"title\":\"சல்சிட்டெ\"  }}', '2014-05-16 11:21:21', 'admin'),
(1481179303508501411, 1481179303046007522, 'Gopalpur', '', '', b'0', '{\"en\":{\"title\":\"Gopalpur\"},\"hi\":{\"title\":\"गोपालपुर\"},  \"ta\":{\"title\":\"கோபால்பூர்\"  }}', '2014-05-16 12:04:50', 'admin'),
(1481179303511389789, 1481179303052811155, 'Gangtok', '', '', b'0', '{\"en\":{\"title\":\"Gangtok\"},\"hi\":{\"title\":\"गंगटोक\"},  \"ta\":{\"title\":\"கேங்டாக்\"  }}', '2014-05-16 12:20:02', 'admin'),
(1481179303514384366, 1481179303068417016, 'Darjeeling', '', '', b'0', '{\"en\":{\"title\":\"Darjeeling\"},\"hi\":{\"title\":\"दार्जिलिंग\"},  \"ta\":{\"title\":\"டார்ஜிலிங்\"  }}', '2014-05-16 12:37:26', 'admin'),
(1481179303517941175, 1481178683122371791, 'Ranchi', '', '', b'0', '{\"en\":{\"title\":\"Ranchi\"},\"hi\":{\"title\":\"रांची\"},  \"ta\":{\"title\":\"ராஞ்சி\"  }}', '2014-05-19 12:40:56', 'admin'),
(1481179303521746168, 1481178683110014642, 'Meghpar', '', '', b'0', '{\"en\":{\"title\":\"Meghpar\"},\"hi\":{\"title\":\"Meghpar\"},  \"ta\":{\"title\":\"Meghpar\"  }}', '2014-05-20 07:39:54', 'admin'),
(1481179303524701941, 1481178683110014642, 'Goblej', '', '', b'0', '{\"en\":{\"title\":\"Goblej\"},\"hi\":{\"title\":\"Goblej\"},  \"ta\":{\"title\":\"Goblej\"  }}', '2014-05-20 09:49:12', 'admin'),
(1481179303527659970, 1481178683125912637, 'Kodagu', '', '', b'0', '{\"en\":{\"title\":\"Kodagu\"},\"hi\":{\"title\":\"कोडागू\"},  \"ta\":{\"title\":\"குடகு\"  }}', '2014-05-21 08:07:25', 'admin'),
(1481179303530675430, 1481178683129305258, 'Wayanad', '', '', b'0', '{\"en\":{\"title\":\"Wayanad\"},\"hi\":{\"title\":\"वायनाड\"},  \"ta\":{\"title\":\"வயநாடு\"  }}', '2014-05-21 08:47:21', 'admin'),
(1481179303534185574, 1481178683106873617, 'Benaulim', '', '', b'0', '{\"en\":{\"title\":\"Benaulim\"},\"hi\":{\"title\":\"Benaulim\"},  \"ta\":{\"title\":\"Benaulim\"  }}', '2014-05-22 05:50:50', 'admin'),
(1481179303538040141, 1481179303068417016, 'Siliguri', '', '0353', b'0', '{\"en\":{\"title\":\"Siliguri\"},\"hi\":{\"title\":\"सिलीगुड़ी\"},  \"ta\":{\"title\":\"சிலிகுரி\"  }}', '2014-05-22 06:21:40', 'admin'),
(1481179303540956577, 1481179303065087128, 'Dehradun', '', '135', b'0', '{\"en\":{\"title\":\"Dehradun\"},\"hi\":{\"title\":\"देहरादून\"},  \"ta\":{\"title\":\"டேராடூன்\"  }}', '2014-05-27 06:52:38', 'admin'),
(1481179303543820996, 1481178683095353072, 'Dibrugarh', '', '', b'0', '{\"en\":{\"title\":\"Dibrugarh\"},\"hi\":{\"title\":\"डिब्रूगढ़\"},  \"ta\":{\"title\":\"திப்ருகார்\"  }}', '2014-05-29 13:13:45', 'admin'),
(1481179303546695091, 1481179303049011399, 'Rajsamand', '', '', b'0', '{\"en\":{\"title\":\"Rajsamand\"},\"hi\":{\"title\":\"राजसमंद\"},  \"ta\":{\"title\":\"ராஜ்சமுந்த்\"  }}', '2014-05-29 13:26:43', 'admin'),
(1481179303549637526, 1481178683119587833, 'katra', '', '1991', b'0', '{\"en\":{\"title\":\"katra\"},\"hi\":{\"title\":\"कटरा\"},  \"ta\":{\"title\":\"கத்ரா\"  }}', '2014-06-03 11:06:13', 'admin'),
(1481179303553685725, 1481179303065087128, 'Mussoorie', '', '', b'0', '{\"en\":{\"title\":\"Mussoorie\"},\"hi\":{\"title\":\"मसूरी\"},  \"ta\":{\"title\":\"முசோரி\"  }}', '2014-06-03 11:32:34', 'admin'),
(1481179303557346472, 1481179303065087128, 'Ramnagar', '', '05945', b'0', '{\"en\":{\"title\":\"Ramnagar\"},\"hi\":{\"title\":\"रामनगर\"},  \"ta\":{\"title\":\"ராம்நகர்\"  }}', '2014-06-04 06:31:12', 'admin'),
(1481179303560417324, 1481179303062111024, 'Mathura', '', '', b'0', '{\"en\":{\"title\":\"Mathura\"},\"hi\":{\"title\":\"मथुरा\"},  \"ta\":{\"title\":\"மதுராவில்\"  }}', '2014-06-06 07:54:59', 'admin'),
(1481179303563370986, 1481179303056193882, 'Mamallapuram', '', '', b'0', '{\"en\":{\"title\":\"Mamallapuram\"},\"hi\":{\"title\":\"Mamallapuram\"},  \"ta\":{\"title\":\"மாமல்லபுரத்தில்\"  }}', '2014-06-09 05:49:43', 'admin'),
(1481179303566329204, 1481178683129305258, 'Alapuzha', '', '', b'0', '{\"en\":{\"title\":\"Alapuzha\"},\"hi\":{\"title\":\"अलपुझा\"},  \"ta\":{\"title\":\"ஆலப்புழா\"  }}', '2014-07-07 05:57:38', 'admin'),
(1481179303570441247, 1481178683129305258, 'Vazhoor', '', '', b'0', '{\"en\":{\"title\":\"Vazhoor\"},\"hi\":{\"title\":\"वलूर\"},  \"ta\":{\"title\":\"வழூர்\"  }}', '2014-07-07 06:05:48', 'admin'),
(1481179303573835164, 1481178683134969818, 'Shirdi', '', '', b'0', '{\"en\":{\"title\":\"Shirdi\"},\"hi\":{\"title\":\"शिरडी\"},  \"ta\":{\"title\":\"ஷீர்டி\"  }}', '2014-07-07 07:15:19', 'admin'),
(1481179303577510164, 1481178683089753788, 'Siripuram', '', '', b'0', '{\"en\":{\"title\":\"Siripuram\"},\"hi\":{\"title\":\"Siripuram\"},  \"ta\":{\"title\":\"Siripuram\"  }}', '2014-07-09 04:57:24', 'admin'),
(1481179303604691747, 1481178683112788636, 'Hisar', 'HR', '', b'0', '{\"en\":{\"title\":\"Hisar\"},\"hi\":{\"title\":\"हिसार\"},  \"ta\":{\"title\":\"ஹிசார்\"  }}', '2014-11-28 08:17:20', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cms_user`
--

CREATE TABLE `cms_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `email` varchar(64) NOT NULL,
  `auth_key` varchar(64) DEFAULT NULL,
  `password_hash` varchar(64) DEFAULT NULL,
  `password_reset_token` varchar(64) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `list_limit` smallint(6) DEFAULT '10',
  `lang` enum('en','hi','ta') NOT NULL DEFAULT 'en',
  `token` text,
  `status` enum('enabled','disabled') DEFAULT 'disabled',
  `login_status` enum('login','logout') DEFAULT 'logout',
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms_user`
--

INSERT INTO `cms_user` (`id`, `username`, `display_name`, `avatar`, `email`, `auth_key`, `password_hash`, `password_reset_token`, `role`, `list_limit`, `lang`, `token`, `status`, `login_status`, `login_time`, `logout_time`, `created_at`, `updated_at`, `updated_by`) VALUES
(1602580859504, 'vaidyas', 'Vaidyas', '', 'shohit.raina@drvaidyas.com', 'mpai1O_kSGSn5jie-Bb4Vi7ArCBQ7rcB', '$2y$13$fmpYJiEVhAWHaLC/6Oe7h.AZxqE43iUFFhhMuTCVlZZpcMo.aKVOO', 'QYNmrAOcJcdDG0FLlaCe-K_QjWd5m9hI_1602580859', 'dr-vaidya-s', 10, 'en', NULL, 'enabled', 'logout', NULL, NULL, '2020-10-13 14:51:00', '2020-10-13 09:21:00', 'admin'),
(1603167603315, 'neerajr', 'Neeraj R', '', 'neerajr@editorji.com', 'Qvf24sbT6QXqcByjpWZlYw_38G2jBha_', '$2y$13$89vz1.WKBUY2cnLOrJWb2.AgWksqcUDS4x4.C4CpDKK9B9bvIZlSq', 'DDtyKff2KfSjCRtYzqU-HsORw24HSSB3_1603167603', 'Editor', 10, 'en', NULL, 'enabled', 'login', '2020-10-30 13:02:17', '2020-10-20 19:52:20', '2020-10-20 09:50:03', '2020-10-30 07:32:17', 'Ravinder'),
(1603167874874, 'manish', 'Manish Sharma', '', 'manish@editorji.com', 'mtOpMf-SQuXO6kZ1oQt9FI7ezheXIzvR', '$2y$13$5SEG2g964iAuMbZqTSZMvuabkICVpZPYm.qh3BJXswjprt0BY9aKu', 'SeSxQQ1_X9DFzsjEktgTTo3SjM70QiPD_1603167875', 'Editor', 10, 'en', NULL, 'enabled', 'logout', NULL, NULL, '2020-10-20 09:54:35', '2020-10-20 04:24:35', 'Ravinder'),
(1604641249028, 'deepaks', 'Deepak Sehgal ', '', 'deepaks@editorji.com', 'yoLw0wZcYDx3tu9NlcJoecEso-e5uqz9', '$2y$13$tJ6AOFvVOUCVqFwuK9OES.IjM7xXAZnhaqVAudOHPaj.doC42bE9u', 'anL--DPgsOe-XddySUpGoDFrfhbIfCqT_1604641249', 'Editor', 10, 'en', NULL, 'enabled', 'login', '2020-11-07 18:10:59', NULL, '2020-11-06 11:10:49', '2020-11-07 12:40:59', 'Ravinder'),
(1616648816017, 'avarnita', 'Avarnita Mathur', '', 'avarnitam@editorji.com', 'YfXpYYYU9RuXZYtz7XBuyfXgUyPAVy9-', '$2y$13$GpD8VXlJOwWhn9XsTyX3YudOi8sKpXj2hzwsPw9sQ0f9Hy2mjZULu', 'ZY3GmGLMO_PpqYO5TRFGMhaa951cbp63_1616648816', 'senior_editor_with_live', 10, 'en', NULL, 'enabled', 'login', '2021-03-25 12:31:45', '2021-03-25 12:31:10', '2021-03-25 10:36:56', '2021-03-25 07:01:45', 'Ravinder'),
(1624335361883, 'ranjan', 'Ranjan Kumar', '', 'ranjan@editorji.com', 'aLNpc9vy4pTwwaHU05uGlTJmUSmBgfr8', '$2y$13$Z3HjovQ9YTphYU.aMoqTmOs65nAwP17tL/SvVeZ30qEhMrwRkd.Za', 'kCnrqnIT7ly1-daNCwueX2h0HqAlvGeE_1624335362', 'senior_editor_with_live', 30, 'en', NULL, 'enabled', 'login', '2021-08-10 14:54:08', '2021-07-29 14:33:39', '2021-06-22 09:46:02', '2021-08-10 09:24:08', 'Ravinder'),
(1624335361884, 'siddharth', 'Siddharth Kumar', '', 'siddhart@editorji.com', 'LeJg-LkNqngJpDwNsLlgqHzNyzshkvfl', '$2y$13$2/z8NKrl6gMJBKftffhPbOqsM4JwMcz2zpgpdzGt5x2jR1lcgGyaK', 'TL1kWAM-8GbFGhTQw3gAAIHjC71epZMc_1628576197', 'admin', 10, 'en', '60ffde7e88566', 'enabled', 'login', '2021-08-17 18:56:35', '2021-08-17 18:56:22', '0000-00-00 00:00:00', '2021-08-18 05:39:34', 'siddharth'),
(1481179303607728865, 'admin', 'Administrator', '57e254e7eb1a6_image5684aabaa66be-download-72.jpg', 'manu.srivastav@opalina.in', '9CadHvJDvbC_VKmNtEKh8jlUIEC0n93_', '$2y$13$NVz/oDyp4bm4CLqQfjMRsex6a/5Mb7B9pACbm1xpVEOcKV4F/2YTK', '4PKks5amdYCkQkyXzWWS7If1FUqA0ItE_1450242480', 'admin', 100, 'en', '5bb1d9270f29d', 'enabled', 'login', '2021-06-09 10:15:21', '2021-04-29 12:16:30', '2016-09-21 15:22:11', '2021-06-09 04:45:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `comment_relation_id` bigint(20) UNSIGNED NOT NULL,
  `comment_relation_type` enum('viceo') DEFAULT NULL,
  `comment_title` varchar(64) DEFAULT NULL,
  `comment_text` longtext,
  `comment_status` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `comment_thread` varchar(255) DEFAULT NULL,
  `comment_by` bigint(20) UNSIGNED NOT NULL,
  `comment_like_count` int(11) DEFAULT '0',
  `comment_dislike_count` int(11) DEFAULT '0',
  `comment_machine_ip_v4` varchar(15) DEFAULT NULL,
  `comment_machine_ip_v6` varchar(39) DEFAULT NULL,
  `comment_browser_detail` text,
  `comment_platform` varchar(100) DEFAULT NULL,
  `comment_live_on` datetime DEFAULT NULL,
  `comment_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment_duration`
--

CREATE TABLE `comment_duration` (
  `id` int(11) NOT NULL,
  `duration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `corona_stats`
--

CREATE TABLE `corona_stats` (
  `id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `subtype` varchar(50) DEFAULT NULL,
  `total_case` int(11) DEFAULT '0',
  `cured` int(11) DEFAULT '0',
  `deaths` int(11) DEFAULT '0',
  `created_by` varchar(50) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(15) DEFAULT NULL,
  `country_name` varchar(100) DEFAULT NULL,
  `country_abb` varchar(10) DEFAULT NULL,
  `country_isd` varchar(5) DEFAULT NULL,
  `country_currency_code` varchar(5) DEFAULT NULL,
  `country_language_code` varchar(5) DEFAULT NULL,
  `json_data` text,
  `country_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `country_code`, `country_name`, `country_abb`, `country_isd`, `country_currency_code`, `country_language_code`, `json_data`, `country_updated_date`, `country_updated_by`) VALUES
(1616566834614, 'EN', 'England', 'ENG', '+44', 'EN', '', '{\"en\":{\"title\":\"England\"},\"hi\":{\"title\":\"\"},\"ta\":{\"title\":\"\"}}', '2021-03-24 00:50:46', '1531815491526'),
(1617627949661, 'AUS', 'Australiya', 'aus', '89', '', '', '{\"en\":{\"title\":\"australiya\"},\"hi\":{\"title\":\"\"},\"ta\":{\"title\":\"\"}}', '2021-07-28 10:20:00', '1481179303607728865'),
(1481178683085455718, 'IN', 'India', 'IN', '91', NULL, NULL, '{\"en\":{\"title\":\"India\"},\"hi\":{\"title\":\"इंडिया\"  },  \"ta\":{\"title\":\"இந்தியா\"  }}', '2013-09-30 01:21:35', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `cron_share_playlist`
--

CREATE TABLE `cron_share_playlist` (
  `id` int(11) NOT NULL,
  `share_url` text,
  `share_id` text,
  `tiny_url` text,
  `date` text,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_app`
--

CREATE TABLE `dashboard_app` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `subtype` text NOT NULL,
  `share_image` text NOT NULL,
  `original_image` text,
  `share_url` text NOT NULL,
  `video_id` text NOT NULL,
  `image` text NOT NULL,
  `image_compress` text NOT NULL,
  `lang_code` varchar(50) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `partner_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `partner_logo` text NOT NULL,
  `share_playlist_id` varchar(255) NOT NULL,
  `partner_type` varchar(255) NOT NULL,
  `partner_id` varchar(255) NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `custom_image_status` enum('Y','N') NOT NULL DEFAULT 'N',
  `auto_update_title` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_tv_app` enum('Yes','No') NOT NULL DEFAULT 'No',
  `seqence` int(11) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `updated_by` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config` text NOT NULL,
  `cloud_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discover_app`
--

CREATE TABLE `discover_app` (
  `id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lang_code` varchar(255) DEFAULT NULL,
  `sequence` varchar(255) DEFAULT NULL,
  `share_playlist_id` varchar(255) DEFAULT NULL,
  `partner_name` text CHARACTER SET utf8,
  `partner_image` text,
  `partner_img_16_9` text,
  `anchore_image` text,
  `partner_id` text,
  `anchor_name` text CHARACTER SET utf8,
  `anchor_id` text,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discover_v2`
--

CREATE TABLE `discover_v2` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `headline` varchar(50) CHARACTER SET utf8 NOT NULL,
  `lang_code` varchar(5) NOT NULL,
  `sequence` tinyint(4) NOT NULL,
  `related_data` text CHARACTER SET utf8 NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint(20) NOT NULL DEFAULT '0',
  `updated_by` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dw_feed`
--

CREATE TABLE `dw_feed` (
  `id` int(11) NOT NULL,
  `date` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `description` text,
  `category` varchar(50) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `error_log`
--

CREATE TABLE `error_log` (
  `id` int(11) NOT NULL,
  `error_messsage` text,
  `error_id` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `api` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `featured_news`
--

CREATE TABLE `featured_news` (
  `id` bigint(20) NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `url` text,
  `video_ids` text,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feature_opinion`
--

CREATE TABLE `feature_opinion` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `share_url` text,
  `anchor_id` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `sharedplaylist_id` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `headers_category`
--

CREATE TABLE `headers_category` (
  `id` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `type` enum('primary','secondary') DEFAULT NULL,
  `lang_code` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `headers_category`
--

INSERT INTO `headers_category` (`id`, `category_id`, `category_name`, `slug`, `sequence`, `type`, `lang_code`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(20, 1614853252778, 'hindi one', 'dsds', 1, 'secondary', 'hi', '2021-04-07 17:50:17', '2021-04-07 17:50:17', 'admin', 'admin'),
(21, 1536772136155, 'बॉलीवुड', NULL, 2, 'primary', 'hi', '2021-04-07 17:50:17', '2021-04-07 17:50:17', 'admin', 'admin'),
(66, 1568715127046, 'Nutrition Month', NULL, 1, 'primary', 'en', '2021-04-07 18:10:44', '2021-04-07 18:10:44', 'admin', 'admin'),
(67, 1536674756509, 'Regional Entertainment', NULL, 2, 'secondary', 'en', '2021-04-07 18:10:44', '2021-04-07 18:10:44', 'admin', 'admin'),
(68, 1565540547537, 'Personal Finance', NULL, 3, 'secondary', 'en', '2021-04-07 18:10:44', '2021-04-07 18:10:44', 'admin', 'admin'),
(69, 1570439590740, 'Durga Puja', NULL, 4, 'primary', 'en', '2021-04-07 18:10:44', '2021-04-07 18:10:44', 'admin', 'admin'),
(70, 1614853762964, 'bangla hello', 'bangla-hello', 1, 'secondary', 'ta', '2021-04-07 18:29:22', '2021-04-07 18:29:22', 'admin', 'admin'),
(71, 1614855009424, 'bbbb', 'ccc', 2, 'primary', 'ta', '2021-04-07 18:29:22', '2021-04-07 18:29:22', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `headline`
--

CREATE TABLE `headline` (
  `id` int(11) NOT NULL,
  `sequence` int(11) DEFAULT NULL,
  `headline_id` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) DEFAULT NULL,
  `createdOn` date DEFAULT NULL,
  `updatedOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `headline`
--

INSERT INTO `headline` (`id`, `sequence`, `headline_id`, `language_code`, `createdOn`, `updatedOn`) VALUES
(459, 0, '1533726500363', NULL, '2018-08-08', '2018-08-08 17:11:29'),
(461, 19, '1533695423014', NULL, '2018-08-08', '2018-08-08 17:11:29'),
(463, 20, '1533726096431', NULL, '2018-08-08', '2018-08-08 17:11:29'),
(464, 21, '1533704155352', NULL, '2018-08-08', '2018-08-08 17:11:29'),
(323397, 4, '1606807826652', 'ta', '2020-12-01', '2020-12-01 13:16:38'),
(323398, 10, '1606805829999', 'ta', '2020-12-01', '2020-12-01 13:16:38'),
(323399, 16, '1606800783889', 'ta', '2020-12-01', '2020-12-01 13:16:38'),
(323400, 17, '1606747968183', 'ta', '2020-12-01', '2020-12-01 13:16:38'),
(323401, 18, '1606796767651', 'ta', '2020-12-01', '2020-12-01 13:16:38'),
(323415, 3, '1606806075054', 'hi', '2020-12-01', '2020-12-01 13:40:33'),
(323416, 6, '1606798362094', 'hi', '2020-12-01', '2020-12-01 13:40:33'),
(323417, 8, '1606804503137', 'hi', '2020-12-01', '2020-12-01 13:40:33'),
(323418, 9, '1606791248438', 'hi', '2020-12-01', '2020-12-01 13:40:33'),
(323419, 11, '1606804433909', 'hi', '2020-12-01', '2020-12-01 13:40:33'),
(323420, 14, '1606801415448', 'hi', '2020-12-01', '2020-12-01 13:40:33'),
(323421, 15, '1606810171477', 'hi', '2020-12-01', '2020-12-01 13:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_code` varchar(2) NOT NULL,
  `language_name` varchar(20) NOT NULL,
  `language_created_date` datetime NOT NULL,
  `language_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `language_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_code`, `language_name`, `language_created_date`, `language_updated_date`, `language_updated_by`) VALUES
('en', 'English', '2016-12-05 08:44:38', '2016-12-05 00:48:40', 1),
('hi', 'हिंदी', '2016-12-05 07:04:31', '2016-12-05 00:49:33', 1),
('ta', 'বাংলা', '2016-12-05 07:04:31', '2020-08-28 16:52:41', 1481179303607728865);

-- --------------------------------------------------------

--
-- Table structure for table `language_labels`
--

CREATE TABLE `language_labels` (
  `language_code` varchar(2) NOT NULL,
  `language_label_code` varchar(20) NOT NULL,
  `language_label_value` varchar(400) NOT NULL,
  `language_created_date` datetime NOT NULL,
  `language_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `language_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language_labels`
--

INSERT INTO `language_labels` (`language_code`, `language_label_code`, `language_label_value`, `language_created_date`, `language_updated_date`, `language_updated_by`) VALUES
('en', '10_minute', '10 MINUTES', '0000-00-00 00:00:00', '2017-02-10 00:47:06', 0),
('en', '1_minute', '1 MINUTE', '0000-00-00 00:00:00', '2017-02-10 00:47:04', 0),
('en', '5_minute', '5 MINUTES', '0000-00-00 00:00:00', '2017-02-10 00:47:05', 0),
('en', 'app_name', 'Cue', '0000-00-00 00:00:00', '2017-02-10 00:47:03', 0),
('en', 'categories_descripti', 'What news do you like to watch?', '0000-00-00 00:00:00', '2017-02-10 00:47:20', 0),
('en', 'categories_instructi', 'Tap once on the category you like,or twice on the ones you love. Tap Thrice on the once you dont like.', '0000-00-00 00:00:00', '2017-02-10 00:47:21', 0),
('en', 'change', 'CHANGE', '0000-00-00 00:00:00', '2017-02-10 00:47:24', 0),
('en', 'cities', 'Cities', '0000-00-00 00:00:00', '2017-02-10 00:47:26', 0),
('en', 'create_account', 'CREATE ACCOUNT', '0000-00-00 00:00:00', '2017-02-10 00:47:16', 0),
('en', 'customize', 'CUSTOMIZE', '0000-00-00 00:00:00', '2017-02-10 00:47:06', 0),
('en', 'dont_have_account', 'DONT HAVE ACCOUNT? CREATE', '0000-00-00 00:00:00', '2017-02-10 00:47:18', 0),
('en', 'edit_playlist', 'Edit Playlist', '0000-00-00 00:00:00', '2017-02-10 00:47:07', 0),
('en', 'email', 'Email', '0000-00-00 00:00:00', '2017-02-10 00:47:14', 0),
('en', 'forgot_password', 'FORGOT PASSWORD', '0000-00-00 00:00:00', '2017-02-10 00:47:17', 0),
('en', 'forgot_password_desc', 'We will send you an email with instructions on how to reset your password.', '0000-00-00 00:00:00', '2017-02-10 00:47:19', 0),
('en', 'less', 'Less', '0000-00-00 00:00:00', '2017-02-10 00:47:25', 0),
('en', 'more', 'More', '0000-00-00 00:00:00', '2017-02-10 00:47:25', 0),
('en', 'more_news', 'More News', '0000-00-00 00:00:00', '2017-02-10 00:47:27', 0),
('en', 'more_opinions', 'More Opinions', '0000-00-00 00:00:00', '2017-02-10 00:47:27', 0),
('en', 'name', 'Name', '0000-00-00 00:00:00', '2017-02-10 00:47:14', 0),
('en', 'news_language', 'News language', '0000-00-00 00:00:00', '2017-02-10 00:47:37', 0),
('en', 'news_or_opinions', 'News or Opinions', '0000-00-00 00:00:00', '2017-02-10 00:47:28', 0),
('en', 'next', 'NEXT', '0000-00-00 00:00:00', '2017-02-10 00:47:18', 0),
('en', 'others', 'OTHERS', '0000-00-00 00:00:00', '2017-02-10 00:47:31', 0),
('en', 'password', 'Password', '0000-00-00 00:00:00', '2017-02-10 00:47:15', 0),
('en', 'play', 'PLAY', '0000-00-00 00:00:00', '2017-02-10 00:47:08', 0),
('en', 'play_newcast', 'Play Newscast', '0000-00-00 00:00:00', '2017-02-10 00:47:03', 0),
('en', 'privacy_policy', 'Privacy Policy', '0000-00-00 00:00:00', '2017-02-10 00:47:39', 0),
('en', 'program_description', 'What kind of programs do you prefer?', '0000-00-00 00:00:00', '2017-02-10 00:47:29', 0),
('en', 'region_description', 'News from which regions do you prefer?', '0000-00-00 00:00:00', '2017-02-10 00:47:23', 0),
('en', 'region_instruction', 'we will recommend local and national news based on the choosen cities.', '0000-00-00 00:00:00', '2017-02-10 00:47:24', 0),
('en', 'region_international', 'International', '0000-00-00 00:00:00', '2017-02-10 00:47:21', 0),
('en', 'region_local', 'Local', '0000-00-00 00:00:00', '2017-02-10 00:47:22', 0),
('en', 'region_national', 'National', '0000-00-00 00:00:00', '2017-02-10 00:47:23', 0),
('en', 'removed', 'Removed', '0000-00-00 00:00:00', '2017-02-10 00:47:09', 0),
('en', 'screen_categories', 'Categories', '0000-00-00 00:00:00', '2017-02-10 00:47:34', 0),
('en', 'screen_create_accoun', 'Create Account', '0000-00-00 00:00:00', '2017-02-10 00:47:32', 0),
('en', 'screen_forgot_passwo', 'Forgot Password', '0000-00-00 00:00:00', '2017-02-10 00:47:33', 0),
('en', 'screen_programs', 'Programs', '0000-00-00 00:00:00', '2017-02-10 00:47:35', 0),
('en', 'screen_region', 'Region', '0000-00-00 00:00:00', '2017-02-10 00:47:34', 0),
('en', 'screen_save', 'Save', '0000-00-00 00:00:00', '2017-02-10 00:47:31', 0),
('en', 'screen_search', 'Search for cities', '0000-00-00 00:00:00', '2017-02-10 00:47:35', 0),
('en', 'screen_settings', 'Settings', '0000-00-00 00:00:00', '2017-02-10 00:47:36', 0),
('en', 'screen_sign_in', 'Sign In', '0000-00-00 00:00:00', '2017-02-10 00:47:32', 0),
('en', 'share', 'SHARE', '0000-00-00 00:00:00', '2017-02-10 00:47:08', 0),
('en', 'show', 'SHOW', '0000-00-00 00:00:00', '2017-02-10 00:47:15', 0),
('en', 'show_more', 'SHOW MORE', '0000-00-00 00:00:00', '2017-02-10 00:47:20', 0),
('en', 'signed_in_as', 'Signed in as', '0000-00-00 00:00:00', '2017-02-10 00:47:38', 0),
('en', 'sign_in', 'SIGN IN', '0000-00-00 00:00:00', '2017-02-10 00:47:17', 0),
('en', 'sign_in_email', 'Sign in with Email', '0000-00-00 00:00:00', '2017-02-10 00:47:12', 0),
('en', 'sign_in_facebook', 'Sign in with Facebook', '0000-00-00 00:00:00', '2017-02-10 00:47:10', 0),
('en', 'sign_in_google', 'Sign in with Google', '0000-00-00 00:00:00', '2017-02-10 00:47:11', 0),
('en', 'sign_in_to_save_cust', 'Sign in to save customisation', '0000-00-00 00:00:00', '2017-02-10 00:47:13', 0),
('en', 'sign_in_twitter', 'Sign in with Twitter', '0000-00-00 00:00:00', '2017-02-10 00:47:11', 0),
('en', 'sign_out', 'SIGN OUT', '0000-00-00 00:00:00', '2017-02-10 00:47:37', 0),
('en', 'skip_and_play', 'SKIP AND PLAY', '0000-00-00 00:00:00', '2017-02-10 00:47:12', 0),
('en', 'terms_of_service', 'Terms of Service', '0000-00-00 00:00:00', '2017-02-10 00:47:40', 0),
('en', 'top_cities', 'Top Cities', '0000-00-00 00:00:00', '2017-02-10 00:47:30', 0),
('en', 'undo', 'UNDO', '0000-00-00 00:00:00', '2017-02-10 00:47:10', 0),
('en', 'use_current_location', 'Use current location', '0000-00-00 00:00:00', '2017-02-10 00:47:29', 0),
('en', 'version', 'Version 1.0', '0000-00-00 00:00:00', '2017-02-10 00:47:38', 0),
('hi', '10_minute', '10  मिनट', '0000-00-00 00:00:00', '2017-02-10 00:47:43', 0),
('hi', '1_minute', '1 मिनट', '0000-00-00 00:00:00', '2017-02-10 00:47:42', 0),
('hi', '5_minute', '5 मिनट', '0000-00-00 00:00:00', '2017-02-10 00:47:42', 0),
('hi', 'app_name', 'क्यू', '0000-00-00 00:00:00', '2017-02-10 00:47:40', 0),
('hi', 'categories_descripti', 'क्या खबर आप देखना पसंद है?', '0000-00-00 00:00:00', '2017-02-10 00:47:58', 0),
('hi', 'categories_instructi', 'लोगों को आप प्यार पर दो बार श्रेणी में आप की तरह पर एक बार ठोकर, या। एक बार जब आप पसंद नहीं करते पर तीन बार टैप करें।', '0000-00-00 00:00:00', '2017-02-10 00:47:59', 0),
('hi', 'change', 'परिवर्तन', '0000-00-00 00:00:00', '2017-02-10 00:48:02', 0),
('hi', 'cities', 'शहरों', '0000-00-00 00:00:00', '2017-02-10 00:48:04', 0),
('hi', 'create_account', 'खाता बनाएं', '0000-00-00 00:00:00', '2017-02-10 00:47:54', 0),
('hi', 'customize', 'कस्टमाइज़ करें', '0000-00-00 00:00:00', '2017-02-10 00:47:44', 0),
('hi', 'dont_have_account', 'नहीं खाता है? सर्जन करना', '0000-00-00 00:00:00', '2017-02-10 00:47:55', 0),
('hi', 'edit_playlist', 'प्लेलिस्ट संपादित करें', '0000-00-00 00:00:00', '2017-02-10 00:47:44', 0),
('hi', 'email', 'ईमेल', '0000-00-00 00:00:00', '2017-02-10 00:47:52', 0),
('hi', 'forgot_password', 'पासवर्ड भूल गए', '0000-00-00 00:00:00', '2017-02-10 00:47:54', 0),
('hi', 'forgot_password_desc', 'हम आपको अपना पासवर्ड रीसेट करने के निर्देशों के साथ एक ईमेल भेज देंगे।', '0000-00-00 00:00:00', '2017-02-10 00:47:57', 0),
('hi', 'less', 'कम', '0000-00-00 00:00:00', '2017-02-10 00:48:03', 0),
('hi', 'more', 'अधिक', '0000-00-00 00:00:00', '2017-02-10 00:48:04', 0),
('hi', 'more_news', 'अधिक समाचार', '0000-00-00 00:00:00', '2017-02-10 00:48:05', 0),
('hi', 'more_opinions', 'अधिक राय', '0000-00-00 00:00:00', '2017-02-10 00:48:05', 0),
('hi', 'name', 'नाम', '0000-00-00 00:00:00', '2017-02-10 00:47:51', 0),
('hi', 'news_language', 'समाचार भाषा', '0000-00-00 00:00:00', '2017-02-10 00:48:15', 0),
('hi', 'news_or_opinions', 'समाचार या राय', '0000-00-00 00:00:00', '2017-02-10 00:48:06', 0),
('hi', 'next', 'अगला', '0000-00-00 00:00:00', '2017-02-10 00:47:56', 0),
('hi', 'others', 'दूसरों', '0000-00-00 00:00:00', '2017-02-10 00:48:09', 0),
('hi', 'password', 'पासवर्ड', '0000-00-00 00:00:00', '2017-02-10 00:47:52', 0),
('hi', 'play', 'प्ले', '0000-00-00 00:00:00', '2017-02-10 00:47:45', 0),
('hi', 'play_newcast', 'नेव्सकास्ट प्ले करें', '0000-00-00 00:00:00', '2017-02-10 00:47:41', 0),
('hi', 'privacy_policy', 'गोपनीयता नीति', '0000-00-00 00:00:00', '2017-02-10 00:48:17', 0),
('hi', 'program_description', 'आप कार्यक्रमों की किस तरह पसंद करते हैं?', '0000-00-00 00:00:00', '2017-02-10 00:48:07', 0),
('hi', 'region_description', 'समाचार जिसमें से क्षेत्रों आप पसंद करते हैं?', '0000-00-00 00:00:00', '2017-02-10 00:48:01', 0),
('hi', 'region_instruction', 'हम चुना शहरों के आधार पर स्थानीय और राष्ट्रीय समाचार की सिफारिश करेंगे।', '0000-00-00 00:00:00', '2017-02-10 00:48:02', 0),
('hi', 'region_international', 'अंतरराष्ट्रीय', '0000-00-00 00:00:00', '2017-02-10 00:47:59', 0),
('hi', 'region_local', 'स्थानीय', '0000-00-00 00:00:00', '2017-02-10 00:48:00', 0),
('hi', 'region_national', 'राष्ट्रीय', '0000-00-00 00:00:00', '2017-02-10 00:48:01', 0),
('hi', 'removed', 'हटा दिया', '0000-00-00 00:00:00', '2017-02-10 00:47:46', 0),
('hi', 'screen_categories', 'श्रेणियाँ', '0000-00-00 00:00:00', '2017-02-10 00:48:12', 0),
('hi', 'screen_create_accoun', 'खाता बनाएं', '0000-00-00 00:00:00', '2017-02-10 00:48:10', 0),
('hi', 'screen_forgot_passwo', 'पासवर्ड भूल गए', '0000-00-00 00:00:00', '2017-02-10 00:48:11', 0),
('hi', 'screen_programs', 'प्रोग्राम्स', '0000-00-00 00:00:00', '2017-02-10 00:48:13', 0),
('hi', 'screen_region', 'क्षेत्र', '0000-00-00 00:00:00', '2017-02-10 00:48:12', 0),
('hi', 'screen_save', 'बचाना', '0000-00-00 00:00:00', '2017-02-10 00:48:09', 0),
('hi', 'screen_search', 'शहरों के लिए खोजें', '0000-00-00 00:00:00', '2017-02-10 00:48:13', 0),
('hi', 'screen_settings', 'सेटिंग्स', '0000-00-00 00:00:00', '2017-02-10 00:48:14', 0),
('hi', 'screen_sign_in', 'साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:48:10', 0),
('hi', 'share', 'शेयर', '0000-00-00 00:00:00', '2017-02-10 00:47:46', 0),
('hi', 'show', 'दिखाना', '0000-00-00 00:00:00', '2017-02-10 00:47:53', 0),
('hi', 'show_more', 'और दिखाओ', '0000-00-00 00:00:00', '2017-02-10 00:47:57', 0),
('hi', 'signed_in_as', 'इस रूप में साइन इन किया', '0000-00-00 00:00:00', '2017-02-10 00:48:16', 0),
('hi', 'sign_in', 'साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:47:55', 0),
('hi', 'sign_in_email', 'ईमेल से साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:47:49', 0),
('hi', 'sign_in_facebook', 'फ़ेसबुक से साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:47:47', 0),
('hi', 'sign_in_google', 'गूगल से साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:47:49', 0),
('hi', 'sign_in_to_save_cust', 'साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:47:51', 0),
('hi', 'sign_in_twitter', 'ट्विटर से साइन इन करें', '0000-00-00 00:00:00', '2017-02-10 00:47:48', 0),
('hi', 'sign_out', 'साइन आउट', '0000-00-00 00:00:00', '2017-02-10 00:48:15', 0),
('hi', 'skip_and_play', 'स्किप और प्ले करें', '0000-00-00 00:00:00', '2017-02-10 00:47:50', 0),
('hi', 'terms_of_service', 'सेवा की शर्तें', '0000-00-00 00:00:00', '2017-02-10 00:48:18', 0),
('hi', 'top_cities', 'शीर्ष शहरों', '0000-00-00 00:00:00', '2017-02-10 00:48:08', 0),
('hi', 'undo', 'अंडू करें', '0000-00-00 00:00:00', '2017-02-10 00:47:47', 0),
('hi', 'use_current_location', 'वर्तमान स्थान का प्रयोग करें', '0000-00-00 00:00:00', '2017-02-10 00:48:07', 0),
('hi', 'version', 'संस्करण 1.0', '0000-00-00 00:00:00', '2017-02-10 00:48:17', 0),
('ta', '10_minute', '10 நிமிடங்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', '1_minute', '1 நிமிடம்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', '5_minute', '5 நிமிடம்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'app_name', 'கோல்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'categories_descripti', 'என்ன செய்தி நீங்கள் பார்க்க விரும்புகிறீர்கள்?', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'categories_instructi', 'ஒரு முறை நீங்கள் விரும்பும் வகை நீங்கள் நேசிப்பவர்களை இருமுறை, தட்டுக அல்லது. நீங்கள் பிடிக்காது முறை மூன்று முறை தட்டவும்.', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'change', 'மாற்றம்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'cities', 'நகரங்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'create_account', 'உங்கள் கணக்கை துவங்குங்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'customize', 'தனிப்பயனாக்கலாம்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'dont_have_account', 'கணக்கு இல்லை? CREATE', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'edit_playlist', 'பட்டியலைத் திருத்து', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'email', 'மின்னஞ்சல்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'forgot_password', 'கடவுச்சொல் மறந்து விட்டீர்களா', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'forgot_password_desc', 'உங்கள் கடவுச்சொல்லை மீட்டமைக்க எப்படி வழிமுறைகளை நீங்கள் ஒரு மின்னஞ்சல் அனுப்ப வேண்டும்.', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'less', 'குறைவான', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'more', 'மேலும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'more_news', 'மேலும் செய்திகள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'more_opinions', 'கருத்துக்களை', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'name', 'பெயர்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'news_language', 'செய்திகள் மொழி', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'news_or_opinions', 'செய்திகள் அல்லது கருத்துகள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'next', 'அடுத்தது', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'others', 'மற்றவர்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'password', 'கடவுச்சொல்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'play', 'விளையாடு', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'play_newcast', 'பிரசுரமாக விளையாட', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'privacy_policy', 'தனியுரிமை கொள்கை', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'program_description', 'நீங்கள் நிரல்கள் என்ன விரும்புகிறார்கள் இல்லை?', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'region_description', 'பகுதிகளில் நீங்கள் விரும்பினால், அதில் இருந்து செய்திகள்?', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'region_instruction', 'நாங்கள் choosen நகரங்களில் அடிப்படையில் உள்ளூர் மற்றும் தேசிய செய்தி பரிந்துரைப்பேன்.', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'region_international', 'சர்வதேச', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'region_local', 'உள்ளூர்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'region_national', 'தேசிய', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'removed', 'நீக்கப்பட்ட', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_categories', 'வகைகள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_create_accoun', 'உங்கள் கணக்கை துவங்குங்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_forgot_passwo', 'கடவுச்சொல் மறந்து விட்டீர்களா', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_programs', 'நிகழ்ச்சிகள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_region', 'பகுதி', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_save', 'சேமி', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_search', 'நகரங்களில் தேடல்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_settings', 'அமைப்புகள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'screen_sign_in', 'உள்நுழையவும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'share', 'பங்கு', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'show', 'காட்டு', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'show_more', 'மேலும் காட்ட', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'signed_in_as', 'ஆக உள்நுழைந்துள்ளீர்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_in', 'உள்நுழை', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_in_email', 'மின்னஞ்சல் கொண்டு உள்நுழையவும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_in_facebook', 'பேஸ்புக் கொண்டு உள்நுழையவும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_in_google', 'கூகிள் கொண்டு உள்நுழையவும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_in_to_save_cust', 'தனிப்பட்ட சேமிக்க உள்நுழையவும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_in_twitter', 'ட்விட்டர் கொண்டு உள்நுழையவும்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'sign_out', 'வெளியேறு', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'skip_and_play', 'தவிர்த்துவிட்டு, விளையாடு', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'terms_of_service', 'சேவை விதிமுறைகள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'top_cities', 'சிறந்த நகரங்கள்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'undo', 'செயல்தவிர்', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'use_current_location', 'தற்போதைய இடத்தை பயன்படுத்த', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865),
('ta', 'version', 'பதிப்பு 1.0', '2020-08-29 03:52:41', '2020-08-28 16:52:41', 1481179303607728865);

-- --------------------------------------------------------

--
-- Table structure for table `microsite_logs`
--

CREATE TABLE `microsite_logs` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `microsite_app_widget_id` int(11) DEFAULT NULL,
  `microsite_widget_id` int(11) DEFAULT NULL,
  `microsite_widget_news_id` int(11) DEFAULT NULL,
  `action` enum('Created','Updated','Deleted') DEFAULT 'Updated',
  `sequence` int(11) DEFAULT '0',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `microsite_logs`
--

INSERT INTO `microsite_logs` (`id`, `category_id`, `title`, `microsite_app_widget_id`, `microsite_widget_id`, `microsite_widget_news_id`, `action`, `sequence`, `created_by`, `updated_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3333, 'carousel', 1, 4, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 12:50:35', NULL),
(2, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 4, 1, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 12:50:35', NULL),
(3, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 1, 4, 2, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 12:50:35', NULL),
(4, 3333, 'A night of embarrassments | Tap for the latest football results ', 1, 4, 3, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 12:50:35', NULL),
(5, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 4, 4, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 12:50:35', NULL),
(6, 3333, 'carousel', 1, 2, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-06-12 12:56:47', '2021-06-12 12:56:47'),
(7, 3333, 'carousel', 1, 3, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-06-12 12:56:55', '2021-06-12 12:56:55'),
(8, 3333, 'carousel', 1, 1, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-06-12 12:57:03', '2021-06-12 12:57:03'),
(9, 3333, 'carousel', 1, 4, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 13:55:57', NULL),
(10, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 4, 1, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 13:55:57', NULL),
(11, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 1, 4, 2, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 13:55:57', NULL),
(12, 3333, 'A night of embarrassments | Tap for the latest football results ', 1, 4, 3, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 13:55:57', NULL),
(13, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 4, 4, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 12:50:35', '2021-06-12 13:55:57', NULL),
(14, 3333, 'carousel', 1, 4, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-06-12 15:24:39', '2021-06-12 15:24:39'),
(15, 3333, 'carousel', 1, 5, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-12 15:30:00', NULL),
(16, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-12 15:30:00', NULL),
(17, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-12 15:30:00', NULL),
(18, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-12 15:30:00', NULL),
(19, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-12 15:30:00', NULL),
(20, 3333, 'carousel', 1, 6, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:39:25', NULL),
(21, 3333, 'hello', 1, 6, 9, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:39:25', NULL),
(22, 3333, '#ElectionsWithVikram', 1, 6, 10, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:39:25', NULL),
(23, 3333, 'Barcelona host Napoli, Chelsea have a mountain to climb', 1, 6, 11, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:39:25', NULL),
(24, 3333, 'Contact tracing app can help', 1, 6, 12, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:39:25', NULL),
(25, 3333, 'carousel', 1, 6, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:46:09', NULL),
(26, 3333, 'Federer surprises viral rooftop tennis stars ', 1, 6, 13, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:09', '2021-06-13 09:46:09', NULL),
(27, 3333, 'hello', 1, 6, 9, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:46:09', NULL),
(28, 3333, '#ElectionsWithVikram', 1, 6, 10, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:46:09', NULL),
(29, 3333, 'Barcelona host Napoli, Chelsea have a mountain to climb', 1, 6, 11, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:46:09', NULL),
(30, 3333, 'Contact tracing app can help', 1, 6, 12, 'Updated', 5, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 09:46:09', NULL),
(31, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:46:25', NULL),
(32, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:46:25', NULL),
(33, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:46:25', NULL),
(34, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:46:25', NULL),
(35, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:46:25', NULL),
(36, 3333, 'carousel', 1, 7, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:49', '2021-06-13 09:46:49', NULL),
(37, 3333, 'Federer surprises viral rooftop tennis stars ', 1, 7, 14, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:49', '2021-06-13 09:46:49', NULL),
(38, 3333, 'Going viral', 1, 7, 15, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:49', '2021-06-13 09:46:49', NULL),
(39, 3333, 'Going Viral | Indore police made two criminals do sit-ups, video goes viral', 1, 7, 16, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:49', '2021-06-13 09:46:49', NULL),
(40, 3333, 'Going Viral', 1, 7, 17, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:49', '2021-06-13 09:46:49', NULL),
(41, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:47:45', NULL),
(42, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:47:45', NULL),
(43, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:47:45', NULL),
(44, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:47:45', NULL),
(45, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:47:45', NULL),
(46, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:48:46', NULL),
(47, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:48:46', NULL),
(48, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:48:46', NULL),
(49, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:48:46', NULL),
(50, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:48:46', NULL),
(51, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:51:39', NULL),
(52, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:51:39', NULL),
(53, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:51:39', NULL),
(54, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:51:39', NULL),
(55, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:51:39', NULL),
(56, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:52:26', NULL),
(57, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:52:26', NULL),
(58, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:52:26', NULL),
(59, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:52:26', NULL),
(60, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:52:26', NULL),
(61, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:00', NULL),
(62, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:00', NULL),
(63, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:00', NULL),
(64, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:00', NULL),
(65, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:00', NULL),
(66, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:53', NULL),
(67, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:53', NULL),
(68, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:53', NULL),
(69, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:53', NULL),
(70, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:54:53', NULL),
(71, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:58:28', NULL),
(72, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:58:28', NULL),
(73, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:58:28', NULL),
(74, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:58:28', NULL),
(75, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 09:58:28', NULL),
(76, 3333, 'carousel', 1, 5, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 10:06:19', NULL),
(77, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 5, 5, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 10:06:19', NULL),
(78, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 5, 6, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 10:06:19', NULL),
(79, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 5, 7, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 10:06:19', NULL),
(80, 3333, '\'Ensure there is no smog\'', 1, 5, 8, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-12 15:30:00', '2021-06-13 10:06:19', NULL),
(81, 3333, 'carousel', 1, 6, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:06:46', NULL),
(82, 3333, 'Federer surprises viral rooftop tennis stars ', 1, 6, 13, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:09', '2021-06-13 10:06:46', NULL),
(83, 3333, 'hello', 1, 6, 9, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:06:46', NULL),
(84, 3333, '#ElectionsWithVikram', 1, 6, 10, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:06:46', NULL),
(85, 3333, 'Barcelona host Napoli, Chelsea have a mountain to climb', 1, 6, 11, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:06:46', NULL),
(86, 3333, 'Contact tracing app can help', 1, 6, 12, 'Updated', 5, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:06:46', NULL),
(87, 3333, 'carousel121', 1, 6, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:07:51', NULL),
(88, 3333, '#ElectionsWithVikram', 1, 6, 10, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:07:51', NULL),
(89, 3333, 'hello', 1, 6, 9, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:07:51', NULL),
(90, 3333, 'Federer surprises viral rooftop tennis stars ', 1, 6, 13, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:46:09', '2021-06-13 10:07:51', NULL),
(91, 3333, 'Barcelona host Napoli, Chelsea have a mountain to climb', 1, 6, 11, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:07:51', NULL),
(92, 3333, 'Contact tracing app can help', 1, 6, 12, 'Updated', 5, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 09:39:25', '2021-06-13 10:07:51', NULL),
(93, 3333, 'carousel', 1, 8, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:27:12', NULL),
(94, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 8, 18, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:27:12', NULL),
(95, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 8, 19, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:27:12', NULL),
(96, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 8, 20, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:27:12', NULL),
(97, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 1, 8, 21, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:27:12', NULL),
(98, 3333, 'carousel', 1, 8, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:40:57', NULL),
(99, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 8, 18, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:40:57', NULL),
(100, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 8, 19, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:40:57', NULL),
(101, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 8, 20, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:40:57', NULL),
(102, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 1, 8, 21, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:27:12', '2021-06-13 11:40:57', NULL),
(103, 3333, 'carousel', 1, 9, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:41:35', '2021-06-13 11:41:35', NULL),
(104, 3333, 'Watch \'Hamilton\' trailer introduce the original Broadway cast', 1, 9, 22, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:41:35', '2021-06-13 11:41:35', NULL),
(105, 3333, ' Environment Updates', 1, 9, 23, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:41:35', '2021-06-13 11:41:35', NULL),
(106, 3333, '#TeachersDay: Deepika gets an emotional letter from her Teacher', 1, 9, 24, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:41:35', '2021-06-13 11:41:35', NULL),
(107, 3333, '#TechCheck | \'Made in India\' iPhone SE, Moto G9 launch & more', 1, 9, 25, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:41:35', '2021-06-13 11:41:35', NULL),
(108, 3333, 'carousel', 1, 10, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:44:20', '2021-06-13 11:44:20', NULL),
(109, 3333, ' Environment Updates', 1, 10, 26, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:44:20', '2021-06-13 11:44:20', NULL),
(110, 3333, '#TechCheck | Apple to begin online sales in India, Nokia 5.3 debuts', 1, 10, 27, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:44:20', '2021-06-13 11:44:20', NULL),
(111, 3333, '#TechCheck | BigBasket confirms data breach of 20 million users', 1, 10, 28, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:44:20', '2021-06-13 11:44:20', NULL),
(112, 3333, '#TechCheck | Apple\'s entire iPhone 12 series goes on sale', 1, 10, 29, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:44:20', '2021-06-13 11:44:20', NULL),
(113, 3333, 'carousel', 1, 11, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:48:56', '2021-06-13 11:48:56', NULL),
(114, 3333, '#ElectionsWithVikram', 1, 11, 30, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:48:56', '2021-06-13 11:48:56', NULL),
(115, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 11, 31, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:48:56', '2021-06-13 11:48:56', NULL),
(116, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 11, 32, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:48:56', '2021-06-13 11:48:56', NULL),
(117, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 11, 33, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:48:56', '2021-06-13 11:48:56', NULL),
(118, 3333, 'carousel', 1, 12, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:54:06', NULL),
(119, 3333, 'Thunder Down Under | Here is why the Aussies fight with Virat & much more', 1, 12, 34, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:54:06', NULL),
(120, 3333, 'Apache vs Hero Xpulse', 1, 12, 35, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:54:06', NULL),
(121, 3333, '\'Pink bloom\' ', 1, 12, 36, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:54:06', NULL),
(122, 3333, 'Age of supersonic flights', 1, 12, 37, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:54:06', NULL),
(123, 3333, 'carousel', 1, 12, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:55:12', NULL),
(124, 3333, 'Thunder Down Under | Here is why the Aussies fight with Virat & much more', 1, 12, 34, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:55:12', NULL),
(125, 3333, 'Apache vs Hero Xpulse', 1, 12, 35, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:55:12', NULL),
(126, 3333, '\'Pink bloom\' ', 1, 12, 36, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:55:12', NULL),
(127, 3333, 'Age of supersonic flights', 1, 12, 37, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-13 11:54:06', '2021-06-13 11:55:12', NULL),
(128, 3333, 'carousel', 1, 13, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 01:16:54', '2021-06-14 01:16:54', NULL),
(129, 3333, '#ElectionsWithVikram', 1, 13, 38, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 01:16:54', '2021-06-14 01:16:54', NULL),
(130, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 13, 39, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 01:16:54', '2021-06-14 01:16:54', NULL),
(131, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 13, 40, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 01:16:54', '2021-06-14 01:16:54', NULL),
(132, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 13, 41, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 01:16:54', '2021-06-14 01:16:54', NULL),
(133, 3333, 'carousel', 1, 14, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 10:17:15', '2021-06-14 10:17:15', NULL),
(134, 3333, 'Going Viral', 1, 14, 42, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 10:17:15', '2021-06-14 10:17:15', NULL),
(135, 3333, 'Thunder Down Under | Here is why the Aussies fight with Virat & much more', 1, 14, 43, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 10:17:15', '2021-06-14 10:17:15', NULL),
(136, 3333, 'hello1', 1, 14, 44, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 10:17:15', '2021-06-14 10:17:15', NULL),
(137, 3333, 'Virat vs Rohit: should India try split captaincy?', 1, 14, 45, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-14 10:17:15', '2021-06-14 10:17:15', NULL),
(138, 3333, 'video-carousel', 2, 15, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 00:12:19', NULL),
(139, 3333, 'video-carousel', 2, 16, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:21', '2021-06-15 00:12:21', NULL),
(140, 3333, 'video-carousel', 2, 15, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 09:48:48', NULL),
(141, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 2, 15, 46, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 09:48:48', NULL),
(142, 3333, '#TechCheck | The latest in TikTok-US saga', 2, 15, 47, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 09:48:48', NULL),
(143, 3333, '#TechCheck | This is how much the new Note20 series will cost', 2, 15, 48, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 09:48:48', NULL),
(144, 3333, '#TechCheck | These Xiaomi phones are launching soon', 2, 15, 49, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 09:48:48', NULL),
(145, 3333, 'video-carousel', 2, 15, NULL, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 09:56:31', NULL),
(146, 3333, 'video-carousel', 2, 15, NULL, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 09:56:42', NULL),
(147, 3333, 'video-carousel', 2, 16, NULL, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:21', '2021-06-15 10:20:06', NULL),
(148, 3333, '\'Sabka saath, sabke Ram\' | PM lays first brick at Ayodhya: watch the highlights', 2, 16, 50, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:20:06', NULL),
(149, 3333, '#TechCheck | This is how much the new Note20 series will cost', 2, 16, 51, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:20:06', NULL),
(150, 3333, '#TechCheck | These Xiaomi phones are launching soon', 2, 16, 52, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:20:06', NULL),
(151, 3333, '#TechCheck | The latest in TikTok-US saga', 2, 16, 53, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:20:06', NULL),
(152, 3333, 'video-carousel123', 2, 16, NULL, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:21', '2021-06-15 10:34:11', NULL),
(153, 3333, NULL, 2, 16, 50, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:34:11', NULL),
(154, 3333, NULL, 2, 16, 51, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:34:11', NULL),
(155, 3333, NULL, 2, 16, 52, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:34:11', NULL),
(156, 3333, NULL, 2, 16, 53, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 10:20:06', '2021-06-15 10:34:11', NULL),
(157, 3333, 'video-carousel', 2, 15, NULL, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 11:32:34', NULL),
(158, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 15, 46, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 11:32:34', NULL),
(159, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 15, 47, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 11:32:34', NULL),
(160, 3333, ' Old Age Home Residents Test COVID Positive. This Video Will Fill Your', 2, 15, 48, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 11:32:34', NULL),
(161, 3333, ' test video001', 2, 15, 49, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 09:48:48', '2021-06-15 11:32:34', NULL),
(162, 3333, 'video-carousel123', 2, 16, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 11:40:04', '2021-06-15 11:40:04'),
(163, 3333, 'carousel', 1, 15, NULL, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 12:15:14', NULL),
(164, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 15, 54, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:15:14', NULL),
(165, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 15, 55, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:15:14', NULL),
(166, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 15, 56, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:15:14', NULL),
(167, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 1, 15, 57, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:15:14', NULL),
(168, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, NULL, 46, 'Deleted', 1, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 12:16:51', '2021-06-15 12:16:51'),
(169, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, NULL, 47, 'Deleted', 2, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 12:16:55', '2021-06-15 12:16:55'),
(170, 3333, ' Old Age Home Residents Test COVID Positive. This Video Will Fill Your', 2, NULL, 48, 'Deleted', 3, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 12:17:00', '2021-06-15 12:17:00'),
(171, 3333, ' test video001', 2, NULL, 49, 'Deleted', 4, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 12:17:04', '2021-06-15 12:17:04'),
(172, 3333, 'carousel2', 1, 15, NULL, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 00:12:19', '2021-06-15 12:17:08', NULL),
(173, 3333, '#TechCheck | The latest in TikTok-US saga', 1, 15, 54, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:17:08', NULL),
(174, 3333, '#TechCheck | These Xiaomi phones are launching soon', 1, 15, 55, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:17:09', NULL),
(175, 3333, '#TechCheck | This is how much the new Note20 series will cost', 1, 15, 56, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:17:09', NULL),
(176, 3333, '\'Alien\' creature caught in Alaska will give you the creeps ', 1, 15, 57, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:15:14', '2021-06-15 12:17:09', NULL),
(177, 3333, 'video-carousel', 2, 17, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:21:39', NULL),
(178, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 17, 58, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:21:39', NULL),
(179, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, 17, 59, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:21:39', NULL),
(180, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 17, 60, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:21:39', NULL),
(181, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 17, 61, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:21:39', NULL),
(182, 3333, 'video-carousel', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:38:22', NULL),
(183, 3333, 'In a first, Bata names an Indian as its global CEO', 2, 17, 58, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:38:22', NULL),
(184, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, 17, 59, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:38:22', NULL),
(185, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 17, 60, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:38:22', NULL),
(186, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 17, 61, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:38:22', NULL),
(187, 3333, 'In a first, Bata names an Indian as its global CEO', 2, NULL, 58, 'Deleted', 1, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 12:39:36', '2021-06-15 12:39:36'),
(188, 3333, 'video-carousel', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:49:32', NULL),
(189, 3333, 'video-carousel', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:49:44', NULL),
(190, 3333, 'video-carousel', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:55:00', NULL),
(191, 3333, 'In a first, Bata names an Indian as its global CEO', 2, 17, 62, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:55:00', '2021-06-15 12:55:00', NULL),
(192, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, 17, 59, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:55:00', NULL),
(193, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 17, 60, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:55:00', NULL),
(194, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 17, 61, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:55:00', NULL),
(195, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, NULL, 59, 'Deleted', 2, NULL, NULL, 1481179303607728865, NULL, '2021-06-15 12:56:55', '2021-06-15 12:56:55'),
(196, 3333, 'video-carousel', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:57:09', NULL),
(197, 3333, ' \'Modi Voting Machine\' or \'Modi ji\'s media\', not scared of them: Rahul', 2, 17, 63, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:57:09', '2021-06-15 12:57:09', NULL),
(198, 3333, 'In a first, Bata names an Indian as its global CEO', 2, 17, 62, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:55:00', '2021-06-15 12:57:09', NULL),
(199, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 17, 60, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:57:09', NULL),
(200, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 17, 61, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-15 12:57:09', NULL),
(201, 3333, 'video-carousel', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-17 12:08:29', NULL),
(202, 3333, '1st T20: Virat Kohli wins the toss, elects to bowl first vs New Zealand', 2, 17, 64, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-17 12:08:29', '2021-06-17 12:08:29', NULL),
(203, 3333, 'In a first, Bata names an Indian as its global CEO', 2, 17, 62, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:55:00', '2021-06-17 12:08:29', NULL),
(204, 3333, ' \'Modi Voting Machine\' or \'Modi ji\'s media\', not scared of them: Rahul', 2, 17, 63, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:57:09', '2021-06-17 12:08:29', NULL),
(205, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 17, 60, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-17 12:08:29', NULL),
(206, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 17, 61, 'Updated', 5, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-17 12:08:29', NULL),
(207, 3333, 'video-carousel6789', 2, 17, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-18 11:45:33', NULL),
(208, 3333, '1st T20: Virat Kohli wins the toss, elects to bowl first vs New Zealand', 2, 17, 64, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-06-17 12:08:29', '2021-06-18 11:45:33', NULL),
(209, 3333, 'In a first, Bata names an Indian as its global CEO', 2, 17, 62, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:55:00', '2021-06-18 11:45:33', NULL),
(210, 3333, ' \'Modi Voting Machine\' or \'Modi ji\'s media\', not scared of them: Rahul', 2, 17, 63, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:57:09', '2021-06-18 11:45:33', NULL),
(211, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 17, 60, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-18 11:45:33', NULL),
(212, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 17, 61, 'Updated', 5, 1481179303607728865, 1481179303607728865, NULL, '2021-06-15 12:21:39', '2021-06-18 11:45:33', NULL),
(213, 3333, 'video-carousel', 2, 18, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-06 16:11:17', NULL),
(214, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 18, 65, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-06 16:11:17', NULL),
(215, 3333, ' \'The Tashkent Files\' to release on April 12', 2, 18, 66, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-06 16:11:17', NULL),
(216, 3333, ' First electric bus service launched between Mumbai and Pune', 2, 18, 67, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-06 16:11:17', NULL),
(217, 3333, ' Police under Centre in new UT of JK, land under elected govt', 2, 18, 68, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-06 16:11:17', NULL),
(218, 3333, 'video-carousel', 2, 18, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 10:15:08', NULL),
(219, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 18, 65, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 10:15:08', NULL),
(220, 3333, ' \'The Tashkent Files\' to release on April 12', 2, 18, 66, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 10:15:08', NULL),
(221, 3333, ' First electric bus service launched between Mumbai and Pune', 2, 18, 67, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 10:15:08', NULL),
(222, 3333, ' Police under Centre in new UT of JK, land under elected govt', 2, 18, 68, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 10:15:08', NULL),
(223, 3333, 'video-carousel', 2, 18, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 14:45:02', NULL),
(224, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 18, 65, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 14:45:02', NULL),
(225, 3333, ' \'The Tashkent Files\' to release on April 12', 2, 18, 66, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 14:45:02', NULL),
(226, 3333, ' First electric bus service launched between Mumbai and Pune', 2, 18, 67, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 14:45:02', NULL),
(227, 3333, ' Police under Centre in new UT of JK, land under elected govt', 2, 18, 68, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-06 16:11:17', '2021-07-07 14:45:02', NULL),
(228, 3333, 'video-carousel', 2, 18, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-07-07 14:45:09', '2021-07-07 14:45:09'),
(229, 3333, 'Election', 2, 19, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-07 14:45:49', '2021-07-07 14:45:49', NULL),
(230, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 19, 69, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-07 14:45:49', '2021-07-07 14:45:49', NULL),
(231, 3333, ' Maharashtra Elections 2019: All You Need To Know', 2, 19, 70, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-07 14:45:49', '2021-07-07 14:45:49', NULL),
(232, 3333, ' Sonu Sood named state icon of Punjab by Election Commission', 2, 19, 71, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-07 14:45:49', '2021-07-07 14:45:49', NULL),
(233, 3333, ' Hong Kong votes in election seen as referendum on protests', 2, 19, 72, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-07 14:45:49', '2021-07-07 14:45:49', NULL),
(234, 3333, 'v1', 2, 20, NULL, 'Created', 1, 1531815491526, 1531815491526, NULL, '2021-07-07 15:48:13', '2021-07-07 15:48:13', NULL),
(235, 3333, ' \'De De Pyaar De\': Ajay Devgn looks split between two women ', 2, 20, 73, 'Created', 1, 1531815491526, 1531815491526, NULL, '2021-07-07 15:48:13', '2021-07-07 15:48:13', NULL),
(236, 3333, '	 Paperwallah! Roundup of morning newspapers', 2, 20, 74, 'Created', 2, 1531815491526, 1531815491526, NULL, '2021-07-07 15:48:13', '2021-07-07 15:48:13', NULL),
(237, 3333, ' \"Spongebob Squarepants is gay\" trends on Twitter!', 2, 20, 75, 'Created', 3, 1531815491526, 1531815491526, NULL, '2021-07-07 15:48:13', '2021-07-07 15:48:13', NULL),
(238, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 20, 76, 'Created', 4, 1531815491526, 1531815491526, NULL, '2021-07-07 15:48:13', '2021-07-07 15:48:13', NULL),
(239, 3333, ' #MeToo: Tanushree Dutta to file FIR against filmmaker Vivek Agnihotri', 2, 20, 77, 'Created', 5, 1531815491526, 1531815491526, NULL, '2021-07-07 15:48:13', '2021-07-07 15:48:13', NULL),
(240, 3333, 'carousel1', 2, 21, NULL, 'Created', 1, 1531815491526, 1531815491526, NULL, '2021-07-07 16:05:02', '2021-07-07 16:05:02', NULL),
(241, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, 21, 78, 'Created', 1, 1531815491526, 1531815491526, NULL, '2021-07-07 16:05:02', '2021-07-07 16:05:02', NULL),
(242, 3333, '#Breaking News: Crisis in Bengal, Didi blocks CBI', 2, 21, 79, 'Created', 2, 1531815491526, 1531815491526, NULL, '2021-07-07 16:05:02', '2021-07-07 16:05:02', NULL),
(243, 3333, ' Tottenham\'s stunning return sends Twitter in a frenzy', 2, 21, 80, 'Created', 3, 1531815491526, 1531815491526, NULL, '2021-07-07 16:05:02', '2021-07-07 16:05:02', NULL),
(244, 3333, ' \'Hum tayar hain\': Sadhvi Pragya to take on Digvijaya', 2, 21, 81, 'Created', 4, 1531815491526, 1531815491526, NULL, '2021-07-07 16:05:02', '2021-07-07 16:05:02', NULL),
(245, 3333, ' \"Spongebob Squarepants is gay\" trends on Twitter!', 2, 21, 82, 'Created', 5, 1531815491526, 1531815491526, NULL, '2021-07-07 16:05:02', '2021-07-07 16:05:02', NULL),
(246, 3333, 'carousel', 1, 22, NULL, 'Created', 1, 1531815491526, 1531815491526, NULL, '2021-07-07 16:07:58', '2021-07-07 16:07:58', NULL),
(247, 3333, '#TechCheck | China\'s clampdown on Big Tech', 1, 22, 83, 'Created', 1, 1531815491526, 1531815491526, NULL, '2021-07-07 16:07:58', '2021-07-07 16:07:58', NULL),
(248, 3333, 'test new 169', 1, 22, 84, 'Created', 2, 1531815491526, 1531815491526, NULL, '2021-07-07 16:07:58', '2021-07-07 16:07:58', NULL),
(249, 3333, 'Hero Xtreme 160R review', 1, 22, 85, 'Created', 3, 1531815491526, 1531815491526, NULL, '2021-07-07 16:07:58', '2021-07-07 16:07:58', NULL),
(250, 3333, '#TechCheck | iPhone 12 delayed, Twitter hack update & more', 1, 22, 86, 'Created', 4, 1531815491526, 1531815491526, NULL, '2021-07-07 16:07:58', '2021-07-07 16:07:58', NULL),
(251, 3333, '#MahaPoliticalTwist', 1, 22, 87, 'Created', 5, 1531815491526, 1531815491526, NULL, '2021-07-07 16:07:58', '2021-07-07 16:07:58', NULL),
(252, 3333, 'Election', 2, 19, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-07-08 14:18:09', '2021-07-08 14:18:09'),
(253, 3333, 'video-carousel6789', 2, 17, NULL, 'Deleted', NULL, NULL, NULL, 1481179303607728865, NULL, '2021-07-08 14:18:13', '2021-07-08 14:18:13'),
(254, 3333, 'Test 1', 2, 23, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:18:41', '2021-07-08 14:18:41', NULL),
(255, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 23, 88, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:18:41', '2021-07-08 14:18:41', NULL),
(256, 3333, ' In a first, US President-elect included ‘Transgenders\' in speech', 2, 23, 89, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:18:41', '2021-07-08 14:18:41', NULL),
(257, 3333, ' Police under Centre in new UT of JK, land under elected govt', 2, 23, 90, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:18:41', '2021-07-08 14:18:41', NULL),
(258, 3333, ' Rahul congratulates Biden, Harris for US election win', 2, 23, 91, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:18:41', '2021-07-08 14:18:41', NULL),
(259, 3333, 'video-carousel', 2, 24, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:50:22', NULL),
(260, 3333, ' \'Attukal Pongala\' celebrated in Thiruvananthapuram', 2, 24, 92, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:50:22', NULL),
(261, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 24, 93, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:50:22', NULL),
(262, 3333, ' \'Joker\'s\' Joaquin Phoenix watches the premiere with his family in LA', 2, 24, 94, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:50:22', NULL),
(263, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 24, 95, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:50:22', NULL),
(264, 3333, 'video-carousel', 2, 24, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:51:04', NULL),
(265, 3333, ' \'Modi Voting Machine\' or \'Modi ji\'s media\', not scared of them: Rahul', 2, 24, 92, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:51:04', NULL),
(266, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 24, 93, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:51:04', NULL),
(267, 3333, ' \'Joker\'s\' Joaquin Phoenix watches the premiere with his family in LA', 2, 24, 94, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:51:04', NULL),
(268, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 24, 95, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:51:04', NULL),
(269, 3333, 'video-carousel', 2, 24, NULL, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:54:05', NULL),
(270, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, 24, 92, 'Updated', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:54:05', NULL),
(271, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 24, 93, 'Updated', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:54:05', NULL),
(272, 3333, ' \'Joker\'s\' Joaquin Phoenix watches the premiere with his family in LA', 2, 24, 94, 'Updated', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:54:05', NULL),
(273, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 24, 95, 'Updated', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 14:50:22', '2021-07-08 14:54:05', NULL),
(274, 3333, 'video-carousel', 2, 25, NULL, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 15:39:45', '2021-07-08 15:39:45', NULL),
(275, 3333, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 2, 25, 96, 'Created', 1, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 15:39:45', '2021-07-08 15:39:45', NULL),
(276, 3333, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 2, 25, 97, 'Created', 2, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 15:39:45', '2021-07-08 15:39:45', NULL),
(277, 3333, ' #ElectionsWithVikram: Ear to the ground', 2, 25, 98, 'Created', 3, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 15:39:45', '2021-07-08 15:39:45', NULL),
(278, 3333, ' \'Joker\'s\' Joaquin Phoenix watches the premiere with his family in LA', 2, 25, 99, 'Created', 4, 1481179303607728865, 1481179303607728865, NULL, '2021-07-08 15:39:45', '2021-07-08 15:39:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `microsite_publishers`
--

CREATE TABLE `microsite_publishers` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `microsite_publishers`
--

INSERT INTO `microsite_publishers` (`id`, `name`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'gaurav', 1481179303607728865, 1481179303607728865, '2021-06-12 15:30:00', '2021-06-13 10:06:19'),
(2, 'new21', 1481179303607728865, 1481179303607728865, '2021-06-13 09:39:25', '2021-06-14 01:13:45'),
(3, 'wdwqdwq', 1481179303607728865, 1481179303607728865, '2021-06-13 11:27:12', '2021-06-13 11:27:12'),
(4, 'asdaaaaaaaaaaa', 1481179303607728865, 1481179303607728865, '2021-06-13 11:41:35', '2021-06-13 11:41:35'),
(5, 'test', 1481179303607728865, 1481179303607728865, '2021-06-13 11:44:20', '2021-06-14 10:16:00'),
(6, 'nitin', 1481179303607728865, 1481179303607728865, '2021-06-13 11:48:56', '2021-06-14 10:17:15'),
(7, 'the new', 1481179303607728865, 1481179303607728865, '2021-06-14 01:14:00', '2021-06-14 01:14:00'),
(8, 'hey', 1481179303607728865, 1481179303607728865, '2021-06-14 10:18:29', '2021-06-14 10:18:29'),
(9, 'Test1', 1531815491526, 1531815491526, '2021-07-07 15:48:13', '2021-07-07 15:48:13'),
(10, 'Fortune1', 1531815491526, 1531815491526, '2021-07-07 16:04:03', '2021-07-07 16:04:03');

-- --------------------------------------------------------

--
-- Table structure for table `microsite_widgets`
--

CREATE TABLE `microsite_widgets` (
  `id` bigint(20) NOT NULL,
  `microsite_app_widget_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  `subcategory_id` bigint(20) DEFAULT NULL,
  `sport_widget_id` bigint(20) DEFAULT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `lang` tinytext,
  `cloud_image` varchar(200) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `microsite_widgets`
--

INSERT INTO `microsite_widgets` (`id`, `microsite_app_widget_id`, `blog_id`, `category_id`, `sequence`, `subcategory_id`, `sport_widget_id`, `match_id`, `keyword`, `is_default`, `title`, `publisher_id`, `type`, `lang`, `cloud_image`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(5, 1, NULL, 3333, 5, NULL, NULL, NULL, NULL, 0, 'carousel', 1, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-12 15:30:00', '2021-07-08 15:39:45'),
(6, 1, NULL, 3333, 2, NULL, NULL, NULL, NULL, 0, 'carousel121', 2, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 09:39:25', '2021-06-13 10:08:27'),
(7, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 2, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 09:46:49', '2021-06-13 10:08:27'),
(8, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 3, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 11:27:12', '2021-06-13 11:40:58'),
(9, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 4, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 11:41:35', '2021-06-13 11:41:35'),
(10, 1, NULL, 3333, 2, NULL, NULL, NULL, NULL, 0, 'carousel', 5, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 11:44:20', '2021-06-13 11:55:12'),
(11, 1, NULL, 3333, 2, NULL, NULL, NULL, NULL, 0, 'carousel', 6, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 11:48:56', '2021-06-14 10:17:16'),
(12, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 5, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-13 11:54:06', '2021-06-13 11:55:12'),
(13, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 7, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-14 01:16:54', '2021-06-14 01:16:54'),
(14, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 6, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-14 10:17:15', '2021-06-14 10:17:15'),
(15, 1, NULL, 3333, 4, NULL, NULL, NULL, NULL, 0, 'carousel2', 1, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-06-15 00:12:19', '2021-07-08 15:39:45'),
(20, 2, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'v1', 9, NULL, 'en', NULL, 1531815491526, 1531815491526, '2021-07-07 15:48:13', '2021-07-07 15:48:13'),
(21, 2, NULL, 3333, 2, NULL, NULL, NULL, NULL, 0, 'carousel1', 10, NULL, 'en', NULL, 1531815491526, 1531815491526, '2021-07-07 16:05:02', '2021-07-07 16:07:59'),
(22, 1, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'carousel', 10, NULL, 'en', NULL, 1531815491526, 1531815491526, '2021-07-07 16:07:58', '2021-07-07 16:07:58'),
(23, 2, NULL, 3333, 3, NULL, NULL, NULL, NULL, 0, 'Test 1', 1, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-07-08 14:18:41', '2021-07-08 15:39:45'),
(24, 2, NULL, 3333, 2, NULL, NULL, NULL, NULL, 0, 'video-carousel', 1, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-07-08 14:50:22', '2021-07-08 15:39:45'),
(25, 2, NULL, 3333, 1, NULL, NULL, NULL, NULL, 0, 'video-carousel', 1, NULL, 'en', NULL, 1481179303607728865, 1481179303607728865, '2021-07-08 15:39:45', '2021-07-08 15:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `microsite_widget_news`
--

CREATE TABLE `microsite_widget_news` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `microsite_app_widget_id` int(11) DEFAULT NULL,
  `microsite_widget_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `news` bigint(20) DEFAULT NULL,
  `thumbnail` varchar(100) DEFAULT NULL,
  `cloud_image` varchar(50) DEFAULT NULL,
  `news_content` text CHARACTER SET utf8,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `microsite_widget_news`
--

INSERT INTO `microsite_widget_news` (`id`, `category_id`, `microsite_app_widget_id`, `microsite_widget_id`, `sequence`, `news`, `thumbnail`, `cloud_image`, `news_content`, `created_by`, `updated_by`, `updated_at`, `created_at`) VALUES
(5, 3333, 1, 5, 1, 38070, NULL, NULL, '#TechCheck | These Xiaomi phones are launching soon', 1481179303607728865, 1481179303607728865, '2021-06-12 23:06:19', '2021-06-12 04:30:00'),
(6, 3333, 1, 5, 2, 29172, NULL, NULL, '#TechCheck | The latest in TikTok-US saga', 1481179303607728865, 1481179303607728865, '2021-06-12 23:06:19', '2021-06-12 04:30:00'),
(7, 3333, 1, 5, 3, 29095, NULL, NULL, '#TechCheck | This is how much the new Note20 series will cost', 1481179303607728865, 1481179303607728865, '2021-06-12 23:06:19', '2021-06-12 04:30:00'),
(8, 3333, 1, 5, 4, 37033, NULL, NULL, '\'Ensure there is no smog\'', 1481179303607728865, 1481179303607728865, '2021-06-12 23:06:19', '2021-06-12 04:30:00'),
(9, 3333, 1, 6, 2, 11837, NULL, NULL, 'hello', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:51', '2021-06-12 22:39:25'),
(10, 3333, 1, 6, 1, 7679, NULL, NULL, '#ElectionsWithVikram', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:51', '2021-06-12 22:39:25'),
(11, 3333, 1, 6, 4, 29222, NULL, NULL, 'Barcelona host Napoli, Chelsea have a mountain to climb', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:51', '2021-06-12 22:39:25'),
(12, 3333, 1, 6, 5, 31326, NULL, NULL, 'Contact tracing app can help', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:51', '2021-06-12 22:39:25'),
(13, 3333, 1, 6, 3, 28639, NULL, NULL, 'Federer surprises viral rooftop tennis stars ', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:51', '2021-06-12 22:46:09'),
(14, 3333, 1, 7, 2, 28639, NULL, NULL, 'Federer surprises viral rooftop tennis stars ', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:27', '2021-06-12 22:46:49'),
(15, 3333, 1, 7, 4, 15252, NULL, NULL, 'Going viral', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:31', '2021-06-12 22:46:49'),
(16, 3333, 1, 7, 1, 30210, NULL, NULL, 'Going Viral | Indore police made two criminals do sit-ups, video goes viral', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:27', '2021-06-12 22:46:49'),
(17, 3333, 1, 7, 3, 13594, NULL, NULL, 'Going Viral', 1481179303607728865, 1481179303607728865, '2021-06-12 23:07:31', '2021-06-12 22:46:49'),
(18, 3333, 1, 8, 1, 29172, NULL, NULL, '#TechCheck | The latest in TikTok-US saga', 1481179303607728865, 1481179303607728865, '2021-06-13 00:40:57', '2021-06-13 00:27:12'),
(19, 3333, 1, 8, 2, 38070, NULL, NULL, '#TechCheck | These Xiaomi phones are launching soon', 1481179303607728865, 1481179303607728865, '2021-06-13 00:40:57', '2021-06-13 00:27:12'),
(20, 3333, 1, 8, 3, 29095, NULL, NULL, '#TechCheck | This is how much the new Note20 series will cost', 1481179303607728865, 1481179303607728865, '2021-06-13 00:40:57', '2021-06-13 00:27:12'),
(21, 3333, 1, 8, 4, 9705, NULL, NULL, '\'Alien\' creature caught in Alaska will give you the creeps ', 1481179303607728865, 1481179303607728865, '2021-06-13 00:40:57', '2021-06-13 00:27:12'),
(22, 3333, 1, 9, 1, 6934, NULL, NULL, 'Watch \'Hamilton\' trailer introduce the original Broadway cast', 1481179303607728865, 1481179303607728865, '2021-06-13 00:41:35', '2021-06-13 00:41:35'),
(23, 3333, 1, 9, 2, 10345, NULL, NULL, ' Environment Updates', 1481179303607728865, 1481179303607728865, '2021-06-13 00:41:35', '2021-06-13 00:41:35'),
(24, 3333, 1, 9, 3, 10048, NULL, NULL, '#TeachersDay: Deepika gets an emotional letter from her Teacher', 1481179303607728865, 1481179303607728865, '2021-06-13 00:41:35', '2021-06-13 00:41:35'),
(25, 3333, 1, 9, 4, 30453, NULL, NULL, '#TechCheck | \'Made in India\' iPhone SE, Moto G9 launch & more', 1481179303607728865, 1481179303607728865, '2021-06-13 00:41:35', '2021-06-13 00:41:35'),
(26, 3333, 1, 10, 1, 10345, NULL, NULL, ' Environment Updates', 1481179303607728865, 1481179303607728865, '2021-06-13 00:44:20', '2021-06-13 00:44:20'),
(27, 3333, 1, 10, 2, 30516, NULL, NULL, '#TechCheck | Apple to begin online sales in India, Nokia 5.3 debuts', 1481179303607728865, 1481179303607728865, '2021-06-13 00:44:20', '2021-06-13 00:44:20'),
(28, 3333, 1, 10, 3, 37344, NULL, NULL, '#TechCheck | BigBasket confirms data breach of 20 million users', 1481179303607728865, 1481179303607728865, '2021-06-13 00:44:20', '2021-06-13 00:44:20'),
(29, 3333, 1, 10, 4, 37820, NULL, NULL, '#TechCheck | Apple\'s entire iPhone 12 series goes on sale', 1481179303607728865, 1481179303607728865, '2021-06-13 00:44:20', '2021-06-13 00:44:20'),
(30, 3333, 1, 11, 1, 7682, NULL, NULL, '#ElectionsWithVikram', 1481179303607728865, 1481179303607728865, '2021-06-13 00:48:56', '2021-06-13 00:48:56'),
(31, 3333, 1, 11, 2, 29172, NULL, NULL, '#TechCheck | The latest in TikTok-US saga', 1481179303607728865, 1481179303607728865, '2021-06-13 00:48:56', '2021-06-13 00:48:56'),
(32, 3333, 1, 11, 3, 38070, NULL, NULL, '#TechCheck | These Xiaomi phones are launching soon', 1481179303607728865, 1481179303607728865, '2021-06-13 00:48:56', '2021-06-13 00:48:56'),
(33, 3333, 1, 11, 4, 29095, NULL, NULL, '#TechCheck | This is how much the new Note20 series will cost', 1481179303607728865, 1481179303607728865, '2021-06-13 00:48:56', '2021-06-13 00:48:56'),
(34, 3333, 1, 12, 1, 38255, NULL, NULL, 'Thunder Down Under | Here is why the Aussies fight with Virat & much more', 1481179303607728865, 1481179303607728865, '2021-06-13 00:55:12', '2021-06-13 00:54:06'),
(35, 3333, 1, 12, 2, 28056, NULL, NULL, 'Apache vs Hero Xpulse', 1481179303607728865, 1481179303607728865, '2021-06-13 00:55:12', '2021-06-13 00:54:06'),
(36, 3333, 1, 12, 3, 38834, NULL, NULL, '\'Pink bloom\' ', 1481179303607728865, 1481179303607728865, '2021-06-13 00:55:12', '2021-06-13 00:54:06'),
(37, 3333, 1, 12, 4, 35840, NULL, NULL, 'Age of supersonic flights', 1481179303607728865, 1481179303607728865, '2021-06-13 00:55:12', '2021-06-13 00:54:06'),
(38, 3333, 1, 13, 1, 7682, NULL, NULL, '#ElectionsWithVikram', 1481179303607728865, 1481179303607728865, '2021-06-13 14:16:54', '2021-06-13 14:16:54'),
(39, 3333, 1, 13, 2, 38070, NULL, NULL, '#TechCheck | These Xiaomi phones are launching soon', 1481179303607728865, 1481179303607728865, '2021-06-13 14:16:54', '2021-06-13 14:16:54'),
(40, 3333, 1, 13, 3, 29172, NULL, NULL, '#TechCheck | The latest in TikTok-US saga', 1481179303607728865, 1481179303607728865, '2021-06-13 14:16:54', '2021-06-13 14:16:54'),
(41, 3333, 1, 13, 4, 29095, NULL, NULL, '#TechCheck | This is how much the new Note20 series will cost', 1481179303607728865, 1481179303607728865, '2021-06-13 14:16:54', '2021-06-13 14:16:54'),
(42, 3333, 1, 14, 2, 11415, NULL, NULL, 'Going Viral', 1481179303607728865, 1481179303607728865, '2021-06-14 00:17:06', '2021-06-13 23:17:15'),
(43, 3333, 1, 14, 1, 38255, NULL, NULL, 'Thunder Down Under | Here is why the Aussies fight with Virat & much more', 1481179303607728865, 1481179303607728865, '2021-06-14 00:17:06', '2021-06-13 23:17:15'),
(44, 3333, 1, 14, 3, 11838, NULL, NULL, 'hello1', 1481179303607728865, 1481179303607728865, '2021-06-13 23:17:15', '2021-06-13 23:17:15'),
(45, 3333, 1, 14, 4, 38370, NULL, NULL, 'Virat vs Rohit: should India try split captaincy?', 1481179303607728865, 1481179303607728865, '2021-06-13 23:17:15', '2021-06-13 23:17:15'),
(54, 3333, 1, 15, 1, 29172, NULL, NULL, '#TechCheck | The latest in TikTok-US saga', 1481179303607728865, 1481179303607728865, '2021-06-15 01:17:08', '2021-06-15 01:15:14'),
(55, 3333, 1, 15, 2, 38070, NULL, NULL, '#TechCheck | These Xiaomi phones are launching soon', 1481179303607728865, 1481179303607728865, '2021-06-15 01:17:09', '2021-06-15 01:15:14'),
(56, 3333, 1, 15, 3, 29095, NULL, NULL, '#TechCheck | This is how much the new Note20 series will cost', 1481179303607728865, 1481179303607728865, '2021-06-15 01:17:09', '2021-06-15 01:15:14'),
(57, 3333, 1, 15, 4, 9705, NULL, NULL, '\'Alien\' creature caught in Alaska will give you the creeps ', 1481179303607728865, 1481179303607728865, '2021-06-15 01:17:09', '2021-06-15 01:15:14'),
(73, 3333, 2, 20, 1, 1553236410243, NULL, NULL, ' \'De De Pyaar De\': Ajay Devgn looks split between two women ', 1531815491526, 1531815491526, '2021-07-07 04:48:13', '2021-07-07 04:48:13'),
(74, 3333, 2, 20, 2, 1567048624479, NULL, NULL, '	 Paperwallah! Roundup of morning newspapers', 1531815491526, 1531815491526, '2021-07-07 04:48:13', '2021-07-07 04:48:13'),
(75, 3333, 2, 20, 3, 1592222141905, NULL, NULL, ' \"Spongebob Squarepants is gay\" trends on Twitter!', 1531815491526, 1531815491526, '2021-07-07 04:48:13', '2021-07-07 04:48:13'),
(76, 3333, 2, 20, 4, 1555565975597, NULL, NULL, ' #ElectionsWithVikram: Ear to the ground', 1531815491526, 1531815491526, '2021-07-07 04:48:13', '2021-07-07 04:48:13'),
(77, 3333, 2, 20, 5, 1540359833539, NULL, NULL, ' #MeToo: Tanushree Dutta to file FIR against filmmaker Vivek Agnihotri', 1531815491526, 1531815491526, '2021-07-07 04:48:13', '2021-07-07 04:48:13'),
(78, 3333, 2, 21, 1, 1570000521342, NULL, NULL, ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 1531815491526, 1531815491526, '2021-07-07 05:05:02', '2021-07-07 05:05:02'),
(79, 3333, 2, 21, 2, 1549202674473, NULL, NULL, '#Breaking News: Crisis in Bengal, Didi blocks CBI', 1531815491526, 1531815491526, '2021-07-07 05:05:02', '2021-07-07 05:05:02'),
(80, 3333, 2, 21, 3, 1557381299104, NULL, NULL, ' Tottenham\'s stunning return sends Twitter in a frenzy', 1531815491526, 1531815491526, '2021-07-07 05:05:02', '2021-07-07 05:05:02'),
(81, 3333, 2, 21, 4, 1555501367300, NULL, NULL, ' \'Hum tayar hain\': Sadhvi Pragya to take on Digvijaya', 1531815491526, 1531815491526, '2021-07-07 05:05:02', '2021-07-07 05:05:02'),
(82, 3333, 2, 21, 5, 1592222141905, NULL, NULL, ' \"Spongebob Squarepants is gay\" trends on Twitter!', 1531815491526, 1531815491526, '2021-07-07 05:05:02', '2021-07-07 05:05:02'),
(83, 3333, 1, 22, 1, 37459, NULL, NULL, '#TechCheck | China\'s clampdown on Big Tech', 1531815491526, 1531815491526, '2021-07-07 05:07:58', '2021-07-07 05:07:58'),
(84, 3333, 1, 22, 2, 39586, NULL, NULL, 'test new 169', 1531815491526, 1531815491526, '2021-07-07 05:07:58', '2021-07-07 05:07:58'),
(85, 3333, 1, 22, 3, 28898, NULL, NULL, 'Hero Xtreme 160R review', 1531815491526, 1531815491526, '2021-07-07 05:07:58', '2021-07-07 05:07:58'),
(86, 3333, 1, 22, 4, 28583, NULL, NULL, '#TechCheck | iPhone 12 delayed, Twitter hack update & more', 1531815491526, 1531815491526, '2021-07-07 05:07:58', '2021-07-07 05:07:58'),
(87, 3333, 1, 22, 5, 13676, NULL, NULL, '#MahaPoliticalTwist', 1531815491526, 1531815491526, '2021-07-07 05:07:58', '2021-07-07 05:07:58'),
(88, 3333, 2, 23, 1, 1576995014551, NULL, NULL, ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 1481179303607728865, 1481179303607728865, '2021-07-08 03:18:41', '2021-07-08 03:18:41'),
(89, 3333, 2, 23, 2, 1604848381888, NULL, NULL, ' In a first, US President-elect included ‘Transgenders\' in speech', 1481179303607728865, 1481179303607728865, '2021-07-08 03:18:41', '2021-07-08 03:18:41'),
(90, 3333, 2, 23, 3, 1572436313122, NULL, NULL, ' Police under Centre in new UT of JK, land under elected govt', 1481179303607728865, 1481179303607728865, '2021-07-08 03:18:41', '2021-07-08 03:18:41'),
(91, 3333, 2, 23, 4, 1604773867561, NULL, NULL, ' Rahul congratulates Biden, Harris for US election win', 1481179303607728865, 1481179303607728865, '2021-07-08 03:18:41', '2021-07-08 03:18:41'),
(92, 3333, 2, 24, 1, 1570000521342, 'https://cdn.editorji.com/1570000522580_1570000566556_292_560.JPG', '', ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 1481179303607728865, 1481179303607728865, '2021-07-08 03:54:05', '2021-07-08 03:50:22'),
(93, 3333, 2, 24, 2, 1576995014551, 'https://cdn.editorji.com/1576995022603_1576995134831_292_560.jpg', 'Images/b35wvmgy2uyroxjpbt05', ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 1481179303607728865, 1481179303607728865, '2021-07-08 03:54:05', '2021-07-08 03:50:22'),
(94, 3333, 2, 24, 3, 1569834525466, 'https://cdn.editorji.com/1569834526252_1569834666229_292_560.JPG', '', ' \'Joker\'s\' Joaquin Phoenix watches the premiere with his family in LA', 1481179303607728865, 1481179303607728865, '2021-07-08 03:54:05', '2021-07-08 03:50:22'),
(95, 3333, 2, 24, 4, 1555565975597, 'https://cdn.editorji.com/cue_ts/155662033623957_292_560.jpg', '', ' #ElectionsWithVikram: Ear to the ground', 1481179303607728865, 1481179303607728865, '2021-07-08 03:54:05', '2021-07-08 03:50:22'),
(96, 3333, 2, 25, 1, 1570000521342, 'https://cdn.editorji.com/I2k1DtqscM.png', '', ' \'6 Underground\' a story of 6 billionaires who fake their deaths', 1481179303607728865, 1481179303607728865, '2021-07-08 04:39:45', '2021-07-08 04:39:45'),
(97, 3333, 2, 25, 2, 1576995014551, 'https://cdn.editorji.com/bqrhgbCYY9.jpg', 'Images/b35wvmgy2uyroxjpbt05', ' \'Jharkhand Elections: Why Jamshedpur East is the hot seat\'', 1481179303607728865, 1481179303607728865, '2021-07-08 04:39:45', '2021-07-08 04:39:45'),
(98, 3333, 2, 25, 3, 1555565975597, 'https://cdn.editorji.com/cue_ts/155662033623957_292_560.jpg', '', ' #ElectionsWithVikram: Ear to the ground', 1481179303607728865, 1481179303607728865, '2021-07-08 04:39:45', '2021-07-08 04:39:45'),
(99, 3333, 2, 25, 4, 1569834525466, 'https://cdn.editorji.com/uU7FRady77.png', '', ' \'Joker\'s\' Joaquin Phoenix watches the premiere with his family in LA', 1481179303607728865, 1481179303607728865, '2021-07-08 04:39:45', '2021-07-08 04:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `most_trending_video`
--

CREATE TABLE `most_trending_video` (
  `id` int(11) NOT NULL,
  `sequence` int(11) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `thumb_img` text,
  `script_id` bigint(20) DEFAULT NULL,
  `image16_9` varchar(255) DEFAULT NULL,
  `slug` text,
  `lang_code` varchar(2) DEFAULT NULL,
  `user_id` varchar(255) NOT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `multi_language`
--

CREATE TABLE `multi_language` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `key_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `key_type` enum('hi','ta') DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `multi_language`
--

INSERT INTO `multi_language` (`id`, `key_name`, `key_value`, `key_type`, `created_on`, `updated_on`) VALUES
(15, 'NATIONAL', 'राष्ट्रीय', 'hi', '2018-01-05', '2018-01-05 12:11:16'),
(17, 'TRENDING NEWS', 'ट्रॅनडिंग समाचार', 'hi', '2018-01-05', '2018-01-05 12:11:46'),
(18, 'TRENDING NEWS', 'பிரபலமாகும் செய்திகள்', 'ta', '2018-01-05', '2018-01-05 12:11:46'),
(20, 'ENTERTAINMENT', 'मनोरंजन', 'hi', '2018-01-05', '2018-01-05 14:51:31'),
(21, 'ENTERTAINMENT', 'பொழுதுபோக்கு', 'ta', '2018-01-05', '2018-01-05 14:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `user_id`, `email`, `created_at`, `updated_at`) VALUES
(4, 1486709236796, 'rajput@gmail.com', '2020-11-28 17:26:15', '2020-11-28 17:26:15'),
(7, 1486710799414, 'ram@gmail', '2020-11-28 17:48:27', '2020-11-28 17:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `newslists`
--

CREATE TABLE `newslists` (
  `id` int(11) NOT NULL,
  `sequence` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `partner_id` varchar(50) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  `language_code` varchar(4) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `type` varchar(50) DEFAULT NULL,
  `json_data` text,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `header_title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `type` enum('Playlist','Video') DEFAULT NULL,
  `duration` varchar(255) NOT NULL,
  `thumbimage` text NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `video_ids` text NOT NULL,
  `share_url` text NOT NULL,
  `created_On` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_On` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `video_slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Inactive',
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `is_breaking` tinyint(4) DEFAULT '0',
  `share_category_video_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `header_title`, `type`, `duration`, `thumbimage`, `lang_code`, `video_ids`, `share_url`, `created_On`, `updated_On`, `user_id`, `deleted_by`, `cloud_image`, `video_slug`, `description`, `status`, `is_deleted`, `is_breaking`, `share_category_video_id`) VALUES
(12, 'Final exams in universities', NULL, 'Video', '0', 'https://cdn.editorji.com/5f09d2970d097_college-students-editorji.jpg', 'en', '1594479248039', 'https://www.editorji.com/playlist/notification-12', '2020-07-14 14:20:38', '2020-08-20 12:41:58', 1481179303607728865, NULL, 'Images/vv4wojzqu3yqzwlawkmr', 'final-exams-in-universities', '', 'Inactive', 'N', 0, NULL),
(13, 'PUBG Mobile Season 14', NULL, 'Video', '47407', 'https://cdn.editorji.com/5f0d77a19f135_pubg-mobile-s14-min.jpg', 'en', '1594718106769', 'https://www.editorji.com/playlist/notification-13', '2020-07-14 14:47:11', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/uvy0gt1ztzwmospnzads', 'pubg-mobile-season-14', '', 'Active', 'N', 0, NULL),
(14, 'Sushant\'s 1 month death anniversary', NULL, 'Playlist', '98655', 'https://cdn.editorji.com/5f0d789da8502_sushant-ankita-0.jpeg', 'en', '1594718360276,1594718060895,1594717548564,1594717787250', 'https://www.editorji.com/playlist/notification-27307', '2020-07-14 14:52:29', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/ctkgyfqnnjeqprvdcjem', 'sushant-s-1-month-death-anniversary', '', 'Active', 'N', 0, 27307),
(15, 'NEWS FLASH', NULL, 'Video', '32238', 'https://cdn.editorji.com/5f0d7b733a429_iiy7ozvdxc.jpg', 'en', '1594718948610', 'https://www.editorji.com/playlist/notification-15', '2020-07-14 15:01:33', '2020-08-20 12:43:25', 1576506117562, NULL, 'Images/xmynm0cjiyd0jgdxbrz0', 'news-flash', 'Truth can be troubled, cannot be defeated: Pilot', 'Inactive', 'N', 1, NULL),
(16, 'BCCI appoints Hemang Amin', NULL, 'Video', '36612', 'https://cdn.editorji.com/5f0d7acd7b640_hemang.PNG', 'en', '1594718920832', 'https://www.editorji.com/playlist/notification-16', '2020-07-14 16:01:54', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/irnvukynqdwiumihgym7', 'bcci-appoints-hemang-amin', '', 'Active', 'N', 0, NULL),
(17, 'Finch comes to the rescue of a 2nd-grade student', NULL, 'Playlist', '99447', 'https://cdn.editorji.com/5f0d7b9a92655_aaron-finch.PNG', 'en', '1594719125596,1594718948610,1594720837805', 'https://www.editorji.com/playlist/notification-27312', '2020-07-14 16:06:11', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/pw8fx3rx8owvyhqc2uxi', 'finch-comes-to-the-rescue-of-a-2nd-grade-student', '', 'Active', 'N', 0, 27312),
(18, 'Is Itolizumab effective in reducing Covid-19', NULL, 'Video', '963897', 'https://cdn.editorji.com/5f0d8b4a22890_drug-1-.jpg', 'en', '1594723141306', 'https://www.editorji.com/playlist/notification-18', '2020-07-14 16:22:10', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/nt3yssrwaoufbc94gqgq', 'is-itolizumab-effective-in-reducing-covid-19', '', 'Inactive', 'N', 0, NULL),
(19, 'विकास दुबे के घर से पुलिस से लूटी AK 47', NULL, 'Video', '45487', 'https://cdn.editorji.com/5f0d5a41f0536_pc.png', 'hi', '1594710588787', 'https://www.editorji.com/playlist/notification-19', '2020-07-14 16:26:12', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/rlegpdp9dqgfgpc5i0ul', 'ak-47', '', 'Active', 'N', 0, NULL),
(20, 'Business wrap', NULL, 'Playlist', '351573', 'https://cdn.editorji.com/5f0d8eab398cf_markets-closing.jpg', 'en', '1594724005038,1594712476171,1594714133195,1594709029449,1594719766980,1594710526092,1594711080133,1594711791176,1594709632103', 'https://www.editorji.com/playlist/notification-27313', '2020-07-14 16:38:26', '2020-08-20 12:43:25', 1576506117562, NULL, 'Images/eciaxvssk0elenf7y8hb', 'business-wrap', 'Sensex tumbles 660 points; Nifty ends near 10,600', 'Active', 'N', 0, 27313),
(21, 'बिहार BJP मुख्यालय में कोरोना विस्फोट', NULL, 'Playlist', '343582', 'https://cdn.editorji.com/5f0d1f7a0ce7e_who.jpg', 'hi', '1594695539087,1594665309111,1594721399833', 'https://www.editorji.com/playlist/notification-27314', '2020-07-14 16:41:21', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/iwhmd2tgaqjkquodnzbz', 'bjp', '', 'Active', 'N', 0, 27314),
(22, 'Big B & Abhishek to stay in hospital for at least seven days', NULL, 'Video', '18244', 'https://cdn.editorji.com/5f0d9dbd80603_big-b-update-thumb.jpg', 'en', '1594727864892', 'https://www.editorji.com/playlist/notification-22', '2020-07-14 17:33:54', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/ucpoodnyniw2ssynskab', 'big-b-abhishek-to-stay-in-hospital-for-at-least-seven-days', '', 'Inactive', 'N', 1, NULL),
(23, 'Morning Newsbrief', NULL, 'Playlist', '375619', 'https://cdn.editorji.com/5f0e5e25661df_trump.jpg', 'en', '1594777120256,1594779645770,1594718948610,1594735855846,1594778019751,1594780581037,1594748495911,1594735325787,1594726389713', 'https://www.editorji.com/playlist/notification-27362', '2020-07-15 08:33:03', '2020-08-20 12:43:25', 1551856719352, NULL, 'Images/yf4x38lyijvhduvmyjuc', 'morning-newsbrief', 'Trump\'s u-turn on student visa rule after backlash', 'Inactive', 'N', 0, 27362),
(24, 'Morning Newsbrief', NULL, 'Playlist', '412701', 'https://cdn.editorji.com/5f0e5e25661df_trump.jpg', 'en', '1594777120256,1594779645770,1594718948610,1594735855846,1594778019751,1594782463367,1594780581037,1594748495911,1594735325787,1594726389713', 'https://www.editorji.com/playlist/notification-27363', '2020-07-15 08:39:29', '2020-08-20 12:43:25', 1551856719352, NULL, 'Images/cszdns3baygwcxv1csmv', 'morning-newsbrief', 'Trump\'s u-turn on student visa rule after backlash', 'Active', 'N', 0, 27363),
(25, '29,000+ cases in India', NULL, 'Video', '39962', 'https://cdn.editorji.com/5f0e84e7d2cfb_icmr.jpg', 'en', '1594787042068', 'https://www.editorji.com/playlist/notification-25', '2020-07-15 10:15:28', '2020-08-20 12:43:25', 1551856719352, NULL, 'Images/jgvovpxjeio4c2dqpxfw', '29-000-cases-in-india', '29,000+ cases in India in one day for the first time', 'Active', 'N', 0, NULL),
(26, 'Comedian Rohan Joshi goes off Twitter', NULL, 'Video', '35156', 'https://cdn.editorji.com/5f0ea176d9859_1-2-.jpg', 'en', '1594794353876', 'https://www.editorji.com/playlist/notification-26', '2020-07-15 12:13:57', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/yfcnnaaqju02xqy6xs2k', 'comedian-rohan-joshi-goes-off-twitter', '', 'Active', 'N', 1, NULL),
(27, 'India-China military talks on LAC last for 15 hours', NULL, 'Playlist', '137918', 'https://cdn.editorji.com/5f0ea801742f8_download-copy.jpg', 'en', '1594794552999,1594793494874,1594793383535', 'https://www.editorji.com/playlist/notification-27374', '2020-07-15 12:23:55', '2020-08-20 12:43:25', 1481179303607728865, NULL, 'Images/bap9odrt8dwckajy3llc', 'india-china-military-talks-on-lac-last-for-15-hours', '', 'Active', 'N', 0, 27374);

-- --------------------------------------------------------

--
-- Table structure for table `opinion_video_link`
--

CREATE TABLE `opinion_video_link` (
  `id` int(11) NOT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `video_link_id` varchar(255) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column 6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `opinion_video_link`
--

INSERT INTO `opinion_video_link` (`id`, `video_id`, `video_link_id`, `createdOn`, `updatedOn`, `Column 6`) VALUES
(2, '1537453940530', '1537456064829', '2018-09-22 09:23:49', '2018-09-21 22:23:49', NULL),
(4, '1540804743592', '1540794841535', '2018-10-29 15:11:57', '2018-10-29 04:11:57', NULL),
(6, '1540974327916', '1540964072198', '2018-11-01 07:54:26', '2018-10-31 20:54:26', NULL),
(8, '1541501816759', '1541486293624', '2018-11-08 13:54:47', '2018-11-08 02:54:47', NULL),
(10, '1544010739387', '1544010661623', '2018-12-05 17:36:58', '2018-12-05 06:36:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parameter`
--

CREATE TABLE `parameter` (
  `parameter_code` varchar(50) NOT NULL,
  `parameter_group` varchar(50) NOT NULL,
  `parameter_display` varchar(50) NOT NULL,
  `parameter_value` text NOT NULL,
  `parameter_sequence` int(11) NOT NULL,
  `parameter_created_date` datetime NOT NULL,
  `parameter_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parameter_updated_by` bigint(20) UNSIGNED NOT NULL,
  `live_stream` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name_slug` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo_url` text,
  `logo_16_9` text,
  `image` text,
  `json_data` text,
  `headline_data` text,
  `width_percentage` int(11) DEFAULT '40',
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image16_9` varchar(255) DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `meta_image` varchar(150) DEFAULT NULL,
  `thumb_preference` int(2) DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `partner_play_list`
--

CREATE TABLE `partner_play_list` (
  `id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `video_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_date` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `thumb_image` text,
  `partner_type` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `playlist_created_by` varchar(255) DEFAULT NULL,
  `playlist_sequence` int(11) DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_views`
--

CREATE TABLE `playlist_views` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `playlist_id` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pti_feed`
--

CREATE TABLE `pti_feed` (
  `id` bigint(20) NOT NULL,
  `file_name` varchar(50) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `subcategory` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `published_at` varchar(50) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `copyrights` varchar(255) DEFAULT NULL,
  `story` text,
  `feed_title` varchar(100) DEFAULT NULL,
  `feed_desc` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification`
--

CREATE TABLE `push_notification` (
  `push_notification_sent_id` bigint(20) UNSIGNED NOT NULL,
  `push_notification_sent_title` text COLLATE utf8_unicode_ci,
  `push_notification_json_data` text COLLATE utf8_unicode_ci,
  `push_notification_sent_status` enum('enabled','disabled') COLLATE utf8_unicode_ci DEFAULT NULL,
  `push_notification_sent_on` datetime DEFAULT NULL,
  `push_notification_sent_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `push_notification_sent_updated_by` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `sequence` smallint(2) UNSIGNED NOT NULL DEFAULT '0',
  `language_code` varchar(2) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `type` enum('Initial','Secondary') DEFAULT 'Secondary',
  `report_text` text CHARACTER SET utf8,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `share_category_video`
--

CREATE TABLE `share_category_video` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `sharedplaylist_id` varchar(255) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `title_alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `duration` varchar(255) NOT NULL,
  `thumbimage` text NOT NULL,
  `partner_playlist_id` text NOT NULL,
  `image_compress` text NOT NULL,
  `video_comment` enum('Y','N') NOT NULL DEFAULT 'N',
  `auto_update_title` enum('Yes','No') NOT NULL DEFAULT 'No',
  `video_comment_id` varchar(255) NOT NULL,
  `lang_code` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `partner_type` varchar(255) NOT NULL,
  `partner_id` varchar(255) NOT NULL,
  `video_ids` text NOT NULL,
  `share_url` text NOT NULL,
  `type_playlist` text NOT NULL,
  `share_date` text NOT NULL,
  `share_views` text NOT NULL,
  `share_status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `created_On` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_On` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cloud_image` varchar(255) DEFAULT NULL,
  `video_slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `share_category_video_like`
--

CREATE TABLE `share_category_video_like` (
  `id` int(11) NOT NULL,
  `share_category_playlist_id` varchar(255) NOT NULL DEFAULT '0',
  `user_id` varchar(50) NOT NULL DEFAULT '0',
  `view_status` enum('1','0') NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `site_errors`
--

CREATE TABLE `site_errors` (
  `site_errors_id` bigint(20) NOT NULL,
  `site_errors_url` text,
  `site_errors_message` text,
  `site_errors_browser_detail` text,
  `site_errors_platform` enum('web','android','pn') NOT NULL DEFAULT 'web',
  `site_errors_client_ip` varchar(100) DEFAULT NULL,
  `site_errors_on_server_ip` varchar(100) DEFAULT NULL,
  `site_errors_stacktrace` text,
  `site_errors_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `social_stories`
--

CREATE TABLE `social_stories` (
  `id` int(11) NOT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `video_name` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `story_url` text CHARACTER SET utf8,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `image16_9` varchar(255) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT 'en',
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `type` enum('Instagram','Facebook') DEFAULT 'Instagram',
  `image1_1` varchar(255) DEFAULT NULL,
  `cloud1_1` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `deleted_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_video_share`
--

CREATE TABLE `social_video_share` (
  `video_id` bigint(20) NOT NULL,
  `video_title` varchar(255) DEFAULT NULL,
  `video_description` text,
  `video_size` float DEFAULT NULL,
  `video_duration` float DEFAULT NULL,
  `video_options` text,
  `video_url` text,
  `status` varchar(50) DEFAULT NULL,
  `share_status` varchar(50) DEFAULT NULL,
  `json_data` text,
  `tweet_json` text,
  `created_by` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sport_blogs`
--

CREATE TABLE `sport_blogs` (
  `id` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `tournament_id` bigint(20) DEFAULT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `home_team` int(11) DEFAULT NULL,
  `teama` int(11) DEFAULT NULL,
  `teamb` int(11) DEFAULT NULL,
  `tournament_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `match_name` varchar(200) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `cloud_image` varchar(100) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8,
  `json_data` text,
  `video_type` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `video_type_content_id` bigint(20) DEFAULT NULL,
  `video_type_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `livestream_embedded_url` text,
  `language_code` varchar(2) DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8,
  `meta_title` text,
  `meta_tags` text,
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `view_more` enum('0','1') DEFAULT '0',
  `deleted_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `state_country_id` bigint(20) UNSIGNED NOT NULL,
  `state_code` varchar(15) DEFAULT NULL,
  `state_name` varchar(50) NOT NULL,
  `state_abb` varchar(10) DEFAULT NULL,
  `is_union_teritory` bit(1) DEFAULT NULL,
  `is_top_state` enum('0','1') DEFAULT '0',
  `json_data` text,
  `state_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_country_id`, `state_code`, `state_name`, `state_abb`, `is_union_teritory`, `is_top_state`, `json_data`, `state_updated_date`, `state_updated_by`) VALUES
(1487047424097, 1481178683085455718, 'MU', 'Mumbai', 'MU', b'0', '1', '{\r\n\"en\":{\r\n\"title\":\"Mumbai\"\r\n},\r\n\"hi\":{\r\n\"title\":\"मुंबई\"\r\n},\r\n\"ta\":{\r\n\"title\":\"মুম্বই\"\r\n}\r\n}', '2020-12-08 09:48:36', '1481179303607728865'),
(1487048273958, 1481178683085455718, 'KMC', 'Kolkata', 'KMC', b'0', '1', '{\r\n\"en\":{\r\n\"title\":\"Kolkata\"\r\n},\r\n\"hi\":{\r\n\"title\":\"कोलकाता\"\r\n},\r\n\"ta\":{\r\n\"title\":\"কলকাতা\"\r\n}\r\n}', '2020-12-08 09:48:07', '1481179303607728865'),
(1487048395404, 1481178683085455718, 'CHA', 'Chennai', 'CHA', b'0', '1', '{\r\n\"en\":{\r\n\"title\":\"Chennai\"\r\n},\r\n\"hi\":{\r\n\"title\":\"चेन्नई\"\r\n},\r\n\"ta\":{\r\n\"title\":\"চেন্নাই\"\r\n}\r\n}', '2020-12-08 09:47:14', '1481179303607728865'),
(1487048462286, 1481178683085455718, 'HYD', 'Hyderabad', 'HYD', b'0', '1', '{\r\n\"en\":{\r\n\"title\":\"Hyderabad\"\r\n},\r\n\"hi\":{\r\n\"title\":\"हैदराबाद\"\r\n},\r\n\"ta\":{\r\n\"title\":\"হায়দরাবাদ\"\r\n}\r\n}', '2020-12-08 09:49:32', '1481179303607728865'),
(1487048536011, 1481178683085455718, 'BLR', 'Bengaluru', 'BLR', b'0', '1', '{\r\n\"en\":{\r\n\"title\":\"Bengaluru\"\r\n},\r\n\"hi\":{\r\n\"title\":\"बेंगलुरु\"\r\n},\r\n\"ta\":{\r\n\"title\":\"বেঙ্গালুরু\"\r\n}\r\n}', '2020-12-08 09:50:00', '1481179303607728865'),
(1519898653663, 1481178683085455718, 'TS', 'Telangana', 'TS', b'0', '', '{\r\n\"en\":{\r\n\"title\":\"Telangana\"\r\n},\r\n\"hi\":{\r\n\"title\":\"तेलंगाना\"\r\n},\r\n\"ta\":{\r\n\"title\":\"তেলঙ্গানা\"\r\n}\r\n}', '2020-12-08 09:50:46', '1481179303607728865'),
(1481178683089753788, 1481178683085455718, 'AP', 'Andhra Pradesh', 'AP', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Andhra Pradesh\"\r\n},\r\n\"hi\":{\r\n\"title\":\"आंध्र प्रदेश\"\r\n},\r\n\"ta\":{\r\n\"title\":\"অন্ধ্র প্রদেশ\"\r\n}\r\n}', '2020-12-08 09:51:16', '1481179303607728865'),
(1481178683095353072, 1481178683085455718, 'AR', 'Arunachal Pradesh', 'AR', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Arunachal Pradesh\"},\"hi\":{\"title\":\"अरुणाचल प्रदेश\"\r\n},\"ta\":{\r\n\"title\":\"অরুণাচল প্রদেশ\"\r\n}\r\n}', '2020-12-08 09:53:07', '1481179303607728865'),
(1481178683098338246, 1481178683085455718, 'AS', 'Assam', 'AS', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Assam\"\r\n},\r\n\"hi\":{\r\n\"title\":\"असम\"\r\n},\r\n\"ta\":{\r\n\"title\":\"আসাম\"\r\n}\r\n}', '2020-12-08 09:53:56', '1481179303607728865'),
(1481178683101114494, 1481178683085455718, 'BR', 'Bihar', 'BR', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Bihar\"\r\n},\r\n\"hi\":{\r\n\"title\":\"बिहार\"\r\n},\r\n\"ta\":{\r\n\"title\":\"বিহার\"\r\n}\r\n}', '2020-12-08 09:54:30', '1481179303607728865'),
(1481178683103918515, 1481178683085455718, 'CT', 'Chhattisgarh', 'CT', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Chhattisgarh\"\r\n},\r\n\"hi\":{\r\n\"title\":\"छत्तीसगढ़\"\r\n},\r\n\"ta\":{\r\n\"title\":\"ছত্তিসগড়\"\r\n}\r\n}', '2020-12-08 11:04:52', '1525352623349'),
(1481178683106873617, 1481178683085455718, 'GA', 'Goa', 'GA', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Goa\"\r\n},\r\n\"hi\":{\r\n\"title\":\"गोवा\"\r\n},\r\n\"ta\":{\r\n\"title\":\"গোয়া\"\r\n}\r\n}', '2020-12-08 11:06:58', '1481179303607728865'),
(1481178683110014642, 1481178683085455718, 'GJ', 'Gujarat', 'GJ', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Gujarat\"\r\n},\r\n\"hi\":{\r\n\"title\":\"गुजरात\"\r\n},\r\n\"ta\":{\r\n\"title\":\"গুজরাট\"\r\n}\r\n}', '2020-12-08 11:07:28', '1481179303607728865'),
(1481178683112788636, 1481178683085455718, 'HR', 'Haryana', 'HR', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Haryana\"\r\n},\r\n\"hi\":{\r\n\"title\":\"हरियाणा\"\r\n},\r\n\"ta\":{\r\n\"title\":\"হরিয়ানা\"\r\n}\r\n}', '2020-12-08 11:07:57', '1481179303607728865'),
(1481178683116798065, 1481178683085455718, 'HP', 'Himachal Pradesh', 'HP', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Himachal Pradesh\"\r\n},\r\n\"hi\":{\r\n\"title\":\"हिमाचल प्रदेश\"\r\n},\r\n\"ta\":{\r\n\"title\":\"হিমাচল প্রদেশ\"\r\n}\r\n}', '2020-12-08 11:08:24', '1481179303607728865'),
(1481178683119587833, 1481178683085455718, 'JK', 'Jammu and Kashmir', 'JK', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Jammu and Kashmir\"\r\n},\r\n\"hi\":{\r\n\"title\":\"जम्मू और कश्मीर\"\r\n},\r\n\"ta\":{\r\n\"title\":\"জম্মু ও কাশ্মীর\"\r\n}\r\n}', '2020-12-08 11:16:11', '1481179303607728865'),
(1481178683122371791, 1481178683085455718, 'JH', 'Jharkhand', 'JH', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Jharkhand\"\r\n},\r\n\"hi\":{\r\n\"title\":\"झारखंड\"\r\n},\r\n\"ta\":{\r\n\"title\":\"ঝাড়খণ্ড\"\r\n}\r\n}', '2020-12-08 11:16:38', '1481179303607728865'),
(1481178683125912637, 1481178683085455718, 'KA', 'Karnataka', 'KA', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Karnataka\"\r\n},\r\n\"hi\":{\r\n\"title\":\"कर्नाटक\"\r\n},\r\n\"ta\":{\r\n\"title\":\"কর্ণাটক\"\r\n}\r\n}', '2020-12-08 11:17:42', '1481179303607728865'),
(1481178683129305258, 1481178683085455718, 'KL', 'Kerala', 'KL', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Kerala\"\r\n},\r\n\"hi\":{\r\n\"title\":\"केरल\"\r\n},\r\n\"ta\":{\r\n\"title\":\"কেরালা\"\r\n}\r\n}', '2020-12-08 11:27:07', '1481179303607728865'),
(1481178683132228530, 1481178683085455718, 'MP', 'Madhya Pradesh', 'MP', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Madhya Pradesh\"\r\n},\r\n\"hi\":{\r\n\"title\":\"मध्य प्रदेश\"\r\n},\r\n\"ta\":{\r\n\"title\":\"মধ্য প্রদেশ\"\r\n}\r\n}', '2020-12-08 11:35:12', '1481179303607728865'),
(1481178683134969818, 1481178683085455718, 'MH', 'Maharashtra', 'MH', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Maharashtra\"\r\n},\r\n\"hi\":{\r\n\"title\":\"महाराष्ट्र\"\r\n},\r\n\"ta\":{\r\n\"title\":\"মহারাষ্ট্র\"\r\n}\r\n}', '2020-12-08 11:35:35', '1481179303607728865'),
(1481178683137713323, 1481178683085455718, 'MN', 'Manipur', 'MN', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Manipur\"\r\n},\r\n\"hi\":{\r\n\"title\":\"मणिपुर\"\r\n},\r\n\"ta\":{\r\n\"title\":\"মণিপুর\"\r\n}\r\n}', '2020-12-08 11:36:53', '1481179303607728865'),
(1481178683140798524, 1481178683085455718, 'ML', 'Meghalaya', 'ML', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Meghalaya\"\r\n},\r\n\"hi\":{\r\n\"title\":\"मेघालय\"\r\n},\r\n\"ta\":{\r\n\"title\":\"মেঘালয়\"\r\n}\r\n}', '2020-12-08 11:37:32', '1481179303607728865'),
(1481178683143939192, 1481178683085455718, 'MZ', 'Mizoram', 'MZ', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Mizoram\"\r\n},\r\n\"hi\":{\r\n\"title\":\"मिजोरम\"\r\n},\r\n\"ta\":{\r\n\"title\":\"মিজোরাম\"\r\n}\r\n}', '2020-12-08 11:38:12', '1481179303607728865'),
(1481178683147424166, 1481178683085455718, 'NL', 'Nagaland', 'NL', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Nagaland\"\r\n},\r\n\"hi\":{\r\n\"title\":\"नगालैंड\"\r\n},\r\n\"ta\":{\r\n\"title\":\"নাগাল্যান্ড\"\r\n}\r\n}', '2020-12-08 11:39:59', '1481179303607728865'),
(1481179303046007522, 1481178683085455718, 'OR', 'Odisha', 'OR', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Odisha\"\r\n},\r\n\"hi\":{\r\n\"title\":\"ओडिशा\"\r\n},\r\n\"ta\":{\r\n\"title\":\"ওড়িশা\"\r\n}\r\n}', '2020-12-08 11:40:25', '1481179303607728865'),
(1481179303049011399, 1481178683085455718, 'RJ', 'Rajasthan', 'RJ', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Rajasthan\"\r\n},\r\n\"hi\":{\r\n\"title\":\"राजस्थान\"\r\n},\r\n\"ta\":{\r\n\"title\":\"রাজস্থান\"\r\n}\r\n}', '2020-12-08 11:41:06', '1481179303607728865'),
(1481179303052811155, 1481178683085455718, 'SK', 'Sikkim', 'SK', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Sikkim\"\r\n},\r\n\"hi\":{\r\n\"title\":\"सिक्किम\"\r\n},\r\n\"ta\":{\r\n\"title\":\"সিকিম\"\r\n}\r\n}', '2020-12-08 11:41:35', '1481179303607728865'),
(1481179303056193882, 1481178683085455718, 'TN', 'Tamil Nadu', 'TN', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Tamil Nadu\"\r\n},\r\n\"hi\":{\r\n\"title\":\"तमिलनाडु\"\r\n},\r\n\"ta\":{\r\n\"title\":\"তামিলনাড়ু\"\r\n}\r\n}', '2020-12-08 11:41:53', '1481179303607728865'),
(1481179303059190663, 1481178683085455718, 'TR', 'Tripura', 'TR', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Tripura\"\r\n},\r\n\"hi\":{\r\n\"title\":\"त्रिपुरा\"\r\n},\r\n\"ta\":{\r\n\"title\":\"ত্রিপুরা\"\r\n}\r\n}', '2020-12-08 11:42:13', '1481179303607728865'),
(1481179303062111024, 1481178683085455718, 'UP', 'Uttar Pradesh', 'UP', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Uttar Pradesh\"\r\n},\r\n\"hi\":{\r\n\"title\":\"उत्तर प्रदेश\"\r\n},\r\n\"ta\":{\r\n\"title\":\"উত্তর প্রদেশ\"\r\n}\r\n}', '2020-12-08 11:44:18', '1481179303607728865'),
(1481179303065087128, 1481178683085455718, 'UT', 'Uttarakhand', 'UT', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Uttarakhand\"\r\n},\r\n\"hi\":{\r\n\"title\":\"उत्तराखंड\"\r\n},\r\n\"ta\":{\r\n\"title\":\"উত্তরাখণ্ড\"\r\n}\r\n}', '2020-12-08 11:44:37', '1481179303607728865'),
(1481179303068417016, 1481178683085455718, 'WB', 'West Bengal', 'WB', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"West Bengal\"\r\n},\r\n\"hi\":{\r\n\"title\":\"पश्चिम बंगाल\"\r\n},\r\n\"ta\":{\r\n\"title\":\"পশ্চিমবঙ্গ\"\r\n}\r\n}', '2020-12-08 11:45:15', '1481179303607728865'),
(1481179303071842041, 1481178683085455718, 'AN', 'Andaman and Nicobar Islands', 'AN', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Andaman and Nicobar Islands\"\r\n},\r\n\"hi\":{\r\n\"title\":\"अंडमान व नोकोबार द्वीप समूह\"\r\n},\r\n\"ta\":{\r\n\"title\":\"আন্দামান এবং নিকোবর\"\r\n}\r\n}', '2020-12-08 11:45:35', '1481179303607728865'),
(1481179303075235543, 1481178683085455718, 'CH', 'Chandigarh', 'CH', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Chandigarh\"\r\n},\r\n\"hi\":{\r\n\"title\":\"चंडीगढ़\"\r\n},\r\n\"ta\":{\r\n\"title\":\"চণ্ডীগড়\"\r\n}\r\n}', '2020-12-08 11:45:52', '1481179303607728865'),
(1481179303078112587, 1481178683085455718, 'DN', 'Dadra and Nagar Haveli', 'DN', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Dadra and Nagar Haveli\"\r\n},\r\n\"hi\":{\r\n\"title\":\"दादरा और नगर हवेली\"\r\n},\r\n\"ta\":{\r\n\"title\":\"দাদরা ও নগর হাভেলি\"\r\n}\r\n}', '2020-12-08 11:46:22', '1481179303607728865'),
(1481179303081107762, 1481178683085455718, 'DD', 'Daman and Diu', 'DD', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Daman and Diu\"\r\n},\r\n\"hi\":{\r\n\"title\":\"दमन और दीव\"\r\n},\r\n\"ta\":{\r\n\"title\":\"দামান ও দিউ\"\r\n}\r\n}', '2020-12-08 11:47:55', '1481179303607728865'),
(1481179303084461627, 1481178683085455718, 'LD', 'Lakshadweep', 'LD', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Lakshadweep\"\r\n},\r\n\"hi\":{\r\n\"title\":\"लक्षद्वीप\"\r\n},\r\n\"ta\":{\r\n\"title\":\"লক্ষদ্বীপ\"\r\n}\r\n}', '2020-12-08 11:48:19', '1481179303607728865'),
(1481179303088263059, 1481178683085455718, 'NCR', 'DELHI/NCR', 'NCR', b'0', '1', '{\r\n\"en\":{\r\n\"title\":\"DELHI/NCR\"\r\n},\r\n\"hi\":{\r\n\"title\":\"दिल्ली / एनसीआर\"\r\n},\r\n\"ta\":{\r\n\"title\":\"দিল্লি / এনসিআর\"\r\n}\r\n}', '2020-12-08 11:52:44', '1481179303607728865'),
(1481179303091289564, 1481178683085455718, 'PY', 'Puducherry', 'PY', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Puducherry\"\r\n},\r\n\"hi\":{\r\n\"title\":\"पुडुचेरी\"\r\n},\r\n\"ta\":{\r\n\"title\":\"পুডুচেরি\"\r\n}\r\n}', '2020-12-08 11:53:10', '1481179303607728865'),
(1481179303094181377, 1481178683085455718, 'PB', 'Punjab', 'PB', b'0', '0', '{\r\n\"en\":{\r\n\"title\":\"Punjab\"\r\n},\r\n\"hi\":{\r\n\"title\":\"पंजाब\"\r\n},\r\n\"ta\":{\r\n\"title\":\"পাঞ্জাব\"\r\n}\r\n}', '2020-12-08 11:53:34', '1481179303607728865');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `tag_language_code` varchar(2) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_created_date` datetime NOT NULL,
  `tag_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tag_updated_by` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_language_code`, `tag_name`, `tag_parent_id`, `tag_created_date`, `tag_updated_date`, `tag_updated_by`, `status`) VALUES
(1483965444801, 'en', 'on bottom', NULL, '2017-01-09 18:07:24', '2017-02-10 06:21:51', 1481179303607728865, 'active'),
(1483965444806, 'en', 'on top', NULL, '2017-01-09 18:07:24', '2017-02-10 06:21:51', 1481179303607728865, 'active'),
(1486710942157, 'en', 'newtag', NULL, '2017-02-10 12:45:42', '2017-02-10 07:15:42', 1481179303607728865, 'active'),
(1486720228179, 'en', ' Federal Court', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228204, 'en', ' Blocks', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228205, 'en', ' Donald Trump', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228210, 'en', ' Travel Ban', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228213, 'en', ' Muslims', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228215, 'en', ' United States of America', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228217, 'en', ' President', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720647166, 'en', 'O Panneerselvam', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647188, 'en', ' Withdraw', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647191, 'en', ' Resignation', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647195, 'en', ' Governor', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647199, 'en', ' Sasikala', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647201, 'en', ' Chief Minister', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486721082192, 'en', 'Sanjay Arora', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082194, 'en', ' Police Commissioner', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082198, 'en', ' S. George', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082202, 'en', ' Transfer', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721596270, 'en', 'High Court', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486721596294, 'en', ' Habeas Corpus Petition', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486721596300, 'en', ' AIADMK', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486722192106, 'en', 'Jayalalithaa', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722192108, 'en', ' Memorial', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722192110, 'en', ' Meeting', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722512349, 'en', 'Amma Memorial', NULL, '2017-02-10 15:58:32', '2017-02-10 10:28:32', 1481179303607728865, 'active'),
(1486723241667, 'en', 'Ganesh Idol', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241679, 'en', ' White Marble', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241681, 'en', ' Temple', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241683, 'en', ' Religion', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723404385, 'en', 'Actress', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404389, 'en', ' Shruti Ulfat', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404392, 'en', ' Arrested', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404396, 'en', ' Cobra. Bail', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404398, 'en', ' Court', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404400, 'en', ' Television', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723543093, 'en', 'India', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543096, 'en', ' China', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543098, 'en', ' Masood Azhar', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543100, 'en', ' Issue', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543105, 'en', ' Terrorist', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543107, 'en', ' Terrorism', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543112, 'en', ' Demarche', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723724873, 'en', 'Sports Minister', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724878, 'en', ' Inaugurates', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724881, 'en', ' Kabaddi championship', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724883, 'en', ' Players', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723850393, 'en', 'Extradition', NULL, '2017-02-10 16:20:50', '2017-02-10 10:50:50', 1481179303607728865, 'active'),
(1486723850398, 'en', ' Request', NULL, '2017-02-10 16:20:50', '2017-02-10 10:50:50', 1481179303607728865, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tag_unique`
--

CREATE TABLE `tag_unique` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `tag_language_code` varchar(2) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_created_date` datetime NOT NULL,
  `tag_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tag_updated_by` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_unique`
--

INSERT INTO `tag_unique` (`tag_id`, `tag_language_code`, `tag_name`, `tag_parent_id`, `tag_created_date`, `tag_updated_date`, `tag_updated_by`, `status`) VALUES
(1483965444801, 'en', 'on bottom', NULL, '2017-01-09 18:07:24', '2017-02-10 06:21:51', 1481179303607728865, 'active'),
(1483965444806, 'en', 'on top', NULL, '2017-01-09 18:07:24', '2017-02-10 06:21:51', 1481179303607728865, 'active'),
(1486710942157, 'en', 'newtag', NULL, '2017-02-10 12:45:42', '2017-02-10 07:15:42', 1481179303607728865, 'active'),
(1486720228179, 'en', ' Federal Court', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228204, 'en', ' Blocks', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228205, 'en', ' Donald Trump', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228210, 'en', ' Travel Ban', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228213, 'en', ' Muslims', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228215, 'en', ' United States of America', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228217, 'en', ' President', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720647166, 'en', 'O Panneerselvam', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647188, 'en', ' Withdraw', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647191, 'en', ' Resignation', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647195, 'en', ' Governor', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647199, 'en', ' Sasikala', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647201, 'en', ' Chief Minister', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486721082192, 'en', 'Sanjay Arora', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082194, 'en', ' Police Commissioner', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082198, 'en', ' S. George', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082202, 'en', ' Transfer', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721596270, 'en', 'High Court', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486721596294, 'en', ' Habeas Corpus Petition', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486721596300, 'en', ' AIADMK', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486722192106, 'en', 'Jayalalithaa', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722192108, 'en', ' Memorial', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722192110, 'en', ' Meeting', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722512349, 'en', 'Amma Memorial', NULL, '2017-02-10 15:58:32', '2017-02-10 10:28:32', 1481179303607728865, 'active'),
(1486723241667, 'en', 'Ganesh Idol', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241679, 'en', ' White Marble', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241681, 'en', ' Temple', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241683, 'en', ' Religion', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723404385, 'en', 'Actress', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404389, 'en', ' Shruti Ulfat', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404392, 'en', ' Arrested', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404396, 'en', ' Cobra. Bail', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404398, 'en', ' Court', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404400, 'en', ' Television', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723543093, 'en', 'India', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543096, 'en', ' China', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543098, 'en', ' Masood Azhar', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543100, 'en', ' Issue', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543105, 'en', ' Terrorist', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543107, 'en', ' Terrorism', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543112, 'en', ' Demarche', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723724873, 'en', 'Sports Minister', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724878, 'en', ' Inaugurates', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724881, 'en', ' Kabaddi championship', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724883, 'en', ' Players', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723850393, 'en', 'Extradition', NULL, '2017-02-10 16:20:50', '2017-02-10 10:50:50', 1481179303607728865, 'active'),
(1486723850398, 'en', ' Request', NULL, '2017-02-10 16:20:50', '2017-02-10 10:50:50', 1481179303607728865, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tag_updated`
--

CREATE TABLE `tag_updated` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `tag_language_code` varchar(2) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `tag_parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_created_date` datetime NOT NULL,
  `tag_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tag_updated_by` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_updated`
--

INSERT INTO `tag_updated` (`tag_id`, `tag_language_code`, `tag_name`, `tag_parent_id`, `tag_created_date`, `tag_updated_date`, `tag_updated_by`, `status`) VALUES
(1483965444801, 'en', 'on bottom', NULL, '2017-01-09 18:07:24', '2017-02-10 06:21:51', 1481179303607728865, 'active'),
(1483965444806, 'en', 'on top', NULL, '2017-01-09 18:07:24', '2017-02-10 06:21:51', 1481179303607728865, 'active'),
(1486710942157, 'en', 'newtag', NULL, '2017-02-10 12:45:42', '2017-02-10 07:15:42', 1481179303607728865, 'active'),
(1486720228179, 'en', ' Federal Court', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228204, 'en', ' Blocks', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228205, 'en', ' Donald Trump', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228210, 'en', ' Travel Ban', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228213, 'en', ' Muslims', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228215, 'en', ' United States of America', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720228217, 'en', ' President', NULL, '2017-02-10 15:20:28', '2017-02-10 09:50:28', 1481179303607728865, 'active'),
(1486720647166, 'en', 'O Panneerselvam', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647188, 'en', ' Withdraw', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647191, 'en', ' Resignation', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647195, 'en', ' Governor', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647199, 'en', ' Sasikala', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486720647201, 'en', ' Chief Minister', NULL, '2017-02-10 15:27:27', '2017-02-10 09:57:27', 1481179303607728865, 'active'),
(1486721082192, 'en', 'Sanjay Arora', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082194, 'en', ' Police Commissioner', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082198, 'en', ' S. George', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721082202, 'en', ' Transfer', NULL, '2017-02-10 15:34:42', '2017-02-10 10:04:42', 1481179303607728865, 'active'),
(1486721596270, 'en', 'High Court', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486721596294, 'en', ' Habeas Corpus Petition', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486721596300, 'en', ' AIADMK', NULL, '2017-02-10 15:43:16', '2017-02-10 10:13:16', 1481179303607728865, 'active'),
(1486722192106, 'en', 'Jayalalithaa', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722192108, 'en', ' Memorial', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722192110, 'en', ' Meeting', NULL, '2017-02-10 15:53:12', '2017-02-10 10:23:12', 1481179303607728865, 'active'),
(1486722512349, 'en', 'Amma Memorial', NULL, '2017-02-10 15:58:32', '2017-02-10 10:28:32', 1481179303607728865, 'active'),
(1486723241667, 'en', 'Ganesh Idol', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241679, 'en', ' White Marble', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241681, 'en', ' Temple', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723241683, 'en', ' Religion', NULL, '2017-02-10 16:10:41', '2017-02-10 10:40:41', 1481179303607728865, 'active'),
(1486723404385, 'en', 'Actress', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404389, 'en', ' Shruti Ulfat', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404392, 'en', ' Arrested', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404396, 'en', ' Cobra. Bail', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404398, 'en', ' Court', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723404400, 'en', ' Television', NULL, '2017-02-10 16:13:24', '2017-02-10 10:43:24', 1481179303607728865, 'active'),
(1486723543093, 'en', 'India', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543096, 'en', ' China', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543098, 'en', ' Masood Azhar', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543100, 'en', ' Issue', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543105, 'en', ' Terrorist', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543107, 'en', ' Terrorism', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723543112, 'en', ' Demarche', NULL, '2017-02-10 16:15:43', '2017-02-10 10:45:43', 1481179303607728865, 'active'),
(1486723724873, 'en', 'Sports Minister', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724878, 'en', ' Inaugurates', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724881, 'en', ' Kabaddi championship', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723724883, 'en', ' Players', NULL, '2017-02-10 16:18:44', '2017-02-10 10:48:44', 1481179303607728865, 'active'),
(1486723850393, 'en', 'Extradition', NULL, '2017-02-10 16:20:50', '2017-02-10 10:50:50', 1481179303607728865, 'active'),
(1486723850398, 'en', ' Request', NULL, '2017-02-10 16:20:50', '2017-02-10 10:50:50', 1481179303607728865, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auth_assignment`
--

CREATE TABLE `tbl_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_auth_assignment`
--

INSERT INTO `tbl_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1481179303607728865', NULL),
('admin', '1521178035643', NULL),
('News', '1521698029719', NULL),
('Jr_admin', '1525349569368', NULL),
('senior_editor_with_live', '1525352273570', NULL),
('Senior_editor', '1525352531757', NULL),
('senior_editor_with_live', '1525352595968', NULL),
('senior_editor_with_live', '1525352623349', NULL),
('NIL', '1525352792067', NULL),
('Senior_editor', '1525352938610', NULL),
('Senior_editor', '1525411383863', NULL),
('Senior_editor', '1526896350782', NULL),
('Senior_editor', '1527844375697', NULL),
('senior_editor_with_live', '1530513472575', NULL),
('Senior_editor', '1531293967407', NULL),
('Senior_editor', '1531725429858', NULL),
('Senior_editor', '1532932089979', NULL),
('Senior_editor', '1534399197386', NULL),
('Senior_editor', '1535000685441', NULL),
('Senior_editor', '1535193565587', NULL),
('Senior_editor', '1537955642283', NULL),
('Senior_editor', '1539244506950', NULL),
('senior_editor_with_live', '1539592662145', NULL),
('Senior_editor', '1541063364076', NULL),
('Senior_editor', '1541155776328', NULL),
('Senior_editor', '1541487663786', NULL),
('Senior_editor', '1543564656795', NULL),
('isha-foundation', '1543585505087', NULL),
('News', '15446543546578', NULL),
('isha-foundation', '1545116869552', NULL),
('news-minute', '1545291754986', NULL),
('Minnambalam', '1545291969828', NULL),
('Senior_editor', '1545806075262', NULL),
('Senior_editor', '1545806186688', NULL),
('Senior_editor', '1546852263919', NULL),
('senior_editor_with_live', '1546940164731', NULL),
('jankibaat', '1547804784104', NULL),
('zigwheels', '1547815097748', NULL),
('Senior_editor', '1548051573881', NULL),
('Senior_editor', '1549265569070', NULL),
('the-bridge', '1549357934362', NULL),
('Senior_editor', '1549959276687', NULL),
('sodapoplove', '1551792743226', NULL),
('senior_editor_with_live', '1551856719352', NULL),
('Senior_editor', '1551857483053', NULL),
('kashmir-monitor', '1552285981540', NULL),
('news24', '1552388478551', NULL),
('the-print', '1552479967709', NULL),
('skymet-weather', '1552539358600', NULL),
('newsroompost', '1552632889597', NULL),
('Senior_editor', '1552911848073', NULL),
('hindustan-hindi', '1552975535951', NULL),
('hindustan-times', '1552975692037', NULL),
('stuff-india', '1553581795276', NULL),
('senior_editor_with_live', '1554105018985', NULL),
('Senior_editor', '1555305443190', NULL),
('senior_editor_with_live', '1557393891446', NULL),
('IndiaAllSports', '1557731657053', NULL),
('vbeauty', '1560159908150', NULL),
('skymet-weather', '1560328628660', NULL),
('senior_editor_with_live', '1561364114734', NULL),
('senior_editor_with_live', '1562565434098', NULL),
('senior_editor_with_live', '1563171338586', NULL),
('the-sentinel', '1565756703067', NULL),
('plush-places', '1568011306470', NULL),
('the-sentinel-assam', '1570599006926', NULL),
('warpcore', '1573472628015', NULL),
('senior_editor_with_live', '1576506117562', NULL),
('the-bastion', '1577427516555', NULL),
('yoganama', '1578564679259', NULL),
('yoga-connect', '1578564835306', NULL),
('senior_editor_with_live', '1597570879769', NULL),
('senior_editor_with_live', '1597676629764', NULL),
('senior_editor_with_live', '1598094909816', NULL),
('senior_editor_with_live', '1598951711445', NULL),
('raftaar-rebooted', '1599629794237', NULL),
('summachar', '1600069968727', NULL),
('sp-guide-publications', '1600336401800', NULL),
('Senior_editor', '1600662539609', NULL),
('senior_editor_with_live', '1601532990845', NULL),
('senior_editor_with_live', '1601535419550', NULL),
('senior_editor_with_live', '1602244311612', NULL),
('senior_editor_with_live', '1616648816017', NULL),
('senior_editor_with_live', '1624335361883', NULL),
('admin', '1624335361884', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auth_item`
--

CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `is_parent` int(11) DEFAULT '0',
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_auth_item`
--

INSERT INTO `tbl_auth_item` (`name`, `type`, `description`, `rule_name`, `is_parent`, `data`, `created_at`, `updated_at`) VALUES
('activity', 1, 'to access activity section', NULL, 0, NULL, NULL, NULL),
('ad-tech', 1, '', NULL, 0, NULL, NULL, NULL),
('ad-tech-create', 1, '', NULL, 0, NULL, NULL, NULL),
('add-news', 1, '', NULL, 0, NULL, NULL, NULL),
('add-widget', 1, 'can create and update widget', NULL, 0, NULL, NULL, NULL),
('admin', 1, 'allow to all access', NULL, 1, NULL, NULL, NULL),
('anchor-delete', 1, 'This will use for delete anchor', NULL, 0, NULL, NULL, NULL),
('app-intro-outro', 1, 'allow to access app intro outro section', NULL, 0, NULL, NULL, NULL),
('app-user', 1, 'access to app user', NULL, 0, NULL, NULL, NULL),
('artinmyheart', 1, 'artinmyheart', NULL, 1, NULL, NULL, NULL),
('autox', 1, 'AutoX', NULL, 1, NULL, NULL, NULL),
('blogs', 1, '', NULL, 0, NULL, NULL, NULL),
('boomlive', 1, 'BoomLive', NULL, 1, NULL, NULL, NULL),
('brain-yog', 1, 'Brain Yog', NULL, 1, NULL, NULL, NULL),
('brain-yog-hindi', 1, 'Brain Yog Hindi', NULL, 1, NULL, NULL, NULL),
('car-and-bike', 1, 'Car and Bike', NULL, 1, NULL, NULL, NULL),
('cardekho', 1, 'CarDekho', NULL, 1, NULL, NULL, NULL),
('category', 1, 'access to category', NULL, 0, NULL, NULL, NULL),
('city', 1, 'allow to access all city', NULL, 0, NULL, NULL, NULL),
('cms-user', 1, 'access to cms-user', NULL, 0, NULL, NULL, NULL),
('comment-delete', 1, 'comment delete', NULL, 0, NULL, NULL, NULL),
('comment-index', 1, 'comment listing', NULL, 0, NULL, NULL, NULL),
('comment-view', 1, 'comment view', NULL, 0, NULL, NULL, NULL),
('construction-world', 1, 'Construction World', NULL, 1, NULL, NULL, NULL),
('construction-world-hindi', 1, 'Construction World hindi', NULL, 1, NULL, NULL, NULL),
('corona_news', 1, '', NULL, 0, NULL, NULL, NULL),
('country', 1, 'allow to access all country ', NULL, 0, NULL, NULL, NULL),
('create-airtel-video', 1, '', NULL, 0, NULL, NULL, NULL),
('create-social-video', 1, '', NULL, 0, NULL, NULL, NULL),
('cry', 1, 'Cry', NULL, 1, NULL, NULL, NULL),
('dashboad', 1, 'dashboad over view ', NULL, 1, NULL, NULL, NULL),
('Dashboad-appuser', 1, 'Dashboad-appuser', NULL, 0, NULL, NULL, NULL),
('Dashboad-breaking', 1, 'Dashboad-breaking', NULL, 0, NULL, NULL, NULL),
('dashboad-category', 1, 'allow to access dashboard category', NULL, 0, NULL, NULL, NULL),
('Dashboad-city', 1, 'Dashboad-city', NULL, 0, NULL, NULL, NULL),
('Dashboad-country', 1, 'Dashboad-country', NULL, 0, NULL, NULL, NULL),
('Dashboad-devices', 1, 'Dashboad-devices', NULL, 0, NULL, NULL, NULL),
('dashboad-editor', 1, 'allow to access dashboard category', NULL, 0, NULL, NULL, NULL),
('dashboad-home', 1, 'allow to access dashboard home', NULL, 0, NULL, NULL, NULL),
('Dashboad-language', 1, 'Dashboad-language', NULL, 0, NULL, NULL, NULL),
('Dashboad-state', 1, 'Dashboad-state', NULL, 0, NULL, NULL, NULL),
('Dashboad-tags', 1, 'Dashboad-tags', NULL, 0, NULL, NULL, NULL),
('Dashboad-user', 1, 'Dashboad-user', NULL, 0, NULL, NULL, NULL),
('Dashboad-videos', 1, 'Dashboad-videos', NULL, 0, NULL, NULL, NULL),
('databaaz', 1, 'Databaaz', NULL, 1, NULL, NULL, NULL),
('deepali-bhardwaj-skin-and-hair-clinic', 1, 'Deepali Bhardwaj: Skin and Hair Clinic ', NULL, 1, NULL, NULL, NULL),
('diet-decisions', 1, 'Diet Decisions', NULL, 1, NULL, NULL, NULL),
('digit', 1, 'Digit', NULL, 1, NULL, NULL, NULL),
('discover-create', 1, 'discover create', NULL, 0, NULL, NULL, NULL),
('discover-delete', 1, 'discover-delete', NULL, 0, NULL, NULL, NULL),
('discover-seqence-app', 1, 'discover-seqence-app', NULL, 0, NULL, NULL, NULL),
('discover-update', 1, 'discover-update', NULL, 0, NULL, NULL, NULL),
('discover-v2', 1, '', NULL, 0, NULL, NULL, NULL),
('dr-kiran-isya', 1, 'Dr Kiran Isya', NULL, 1, NULL, NULL, NULL),
('dr-vaidya-s', 1, 'Dr.Vaidya\'s', NULL, 1, NULL, NULL, NULL),
('dw-feed', 1, '', NULL, 0, NULL, NULL, NULL),
('dynamic-create', 1, 'This is for dynamic-list', NULL, 0, NULL, NULL, NULL),
('dynamic-list', 1, 'This is dynamic-list ', NULL, 0, NULL, NULL, NULL),
('east-mojo', 1, 'East Mojo', NULL, 1, NULL, NULL, NULL),
('Editor', 1, 'Editior parent user', NULL, 1, NULL, NULL, NULL),
('editordashboard-addheadline', 1, 'allow to access adding headline in editor dashboard', NULL, 0, NULL, NULL, NULL),
('editordashboard-dragheadline', 1, 'allow to access drag and drop headline section in Editor dashboard ', NULL, 0, NULL, NULL, NULL),
('editordashboard-removeheadline', 1, 'allow to access remove headline from editor dashboard', NULL, 0, NULL, NULL, NULL),
('Editorial-Priority', 1, 'Editorial Priority', NULL, 0, NULL, NULL, NULL),
('editorji-inhouse', 1, 'editorji-inhouse', NULL, 1, NULL, NULL, NULL),
('embedded-partner', 1, '', NULL, 1, NULL, NULL, NULL),
('error-log', 1, 'allow to access error logs', NULL, 0, NULL, NULL, NULL),
('featured_news', 1, '', NULL, 0, NULL, NULL, NULL),
('for-up-from-up', 1, 'For UP From UP', NULL, 1, NULL, NULL, NULL),
('for-up-from-up-hindi', 1, 'For Up From Up Hindi', NULL, 1, NULL, NULL, NULL),
('headers-category', 1, '', NULL, 0, NULL, NULL, NULL),
('headline-view', 1, 'allow to  access all heading', NULL, 0, NULL, NULL, NULL),
('highlight-video', 1, 'access to high light video', NULL, 0, NULL, NULL, NULL),
('hindustan-hindi', 1, 'hindustan Hindi', NULL, 1, NULL, NULL, NULL),
('hindustan-times', 1, 'Hindustan Times', NULL, 1, NULL, NULL, NULL),
('IndiaAllSports', 1, '', NULL, 1, NULL, NULL, NULL),
('Intern', 1, '', NULL, 1, NULL, NULL, NULL),
('isha-foundation', 1, 'Isha Foundation', NULL, 1, NULL, NULL, NULL),
('jankibaat', 1, 'JanKiBaat', NULL, 1, NULL, NULL, NULL),
('Jr_admin', 1, 'junior_admin access to multiples roles\r\n ', NULL, 1, NULL, NULL, NULL),
('kashmir-monitor', 1, 'Kashmir Monitor', NULL, 1, NULL, NULL, NULL),
('language', 1, 'access to language', NULL, 0, NULL, NULL, NULL),
('link-list', 1, 'allow to access video link list', NULL, 0, NULL, NULL, NULL),
('live_stream', 1, 'can manage live stream', NULL, 0, NULL, NULL, NULL),
('microsite-sections', 1, '', NULL, 0, NULL, NULL, NULL),
('Minnambalam', 1, '', NULL, 1, NULL, NULL, NULL),
('miss-news', 1, 'allow to access all missing news', NULL, 0, NULL, NULL, NULL),
('more-filters', 1, '', NULL, 0, NULL, NULL, NULL),
('most-trending-video', 1, '', NULL, 0, NULL, NULL, NULL),
('nba', 1, 'nba ?????', NULL, 1, NULL, NULL, NULL),
('new-test-partner', 1, 'new test partner', NULL, 1, NULL, NULL, NULL),
('News', 1, 'access to news', NULL, 1, NULL, NULL, NULL),
('news-minute', 1, 'News Minute', NULL, 1, NULL, NULL, NULL),
('news24', 1, 'News24', NULL, 1, NULL, NULL, NULL),
('newslist_section', 1, '', NULL, 0, NULL, NULL, NULL),
('newsroompost', 1, 'NewsroomPost', NULL, 1, NULL, NULL, NULL),
('NIL', 1, '', NULL, 1, NULL, NULL, NULL),
('opinion-anchor', 1, 'allow to access opinion anchor', NULL, 0, NULL, NULL, NULL),
('parameter', 1, 'access to parameter', NULL, 0, NULL, NULL, NULL),
('partner-create', 1, 'partner create', NULL, 0, NULL, NULL, NULL),
('partner-create-link', 1, 'partner-create-link', NULL, 0, NULL, NULL, NULL),
('partner-delete', 1, 'partner delete', NULL, 0, NULL, NULL, NULL),
('partner-delete-link', 1, 'partner-delete-link', NULL, 0, NULL, NULL, NULL),
('partner-edit', 1, 'partner edit', NULL, 0, NULL, NULL, NULL),
('partner-editor-dashboard', 1, 'this is Partner-editor-dashboard', NULL, 0, NULL, NULL, NULL),
('partner-list', 1, 'partner list', NULL, 0, NULL, NULL, NULL),
('partner-list-link', 1, 'partner-list-link', NULL, 0, NULL, NULL, NULL),
('partner-play-list', 1, 'This is Partner-play-list', NULL, 0, NULL, NULL, NULL),
('partner-playlist-sequence', 1, 'partner playlist sequence', NULL, 0, NULL, NULL, NULL),
('partner-playlist-sequence-delete', 1, 'partner playlist sequence delete', NULL, 0, NULL, NULL, NULL),
('partner-playlist-sequence-update', 1, 'partner playlist sequence update', NULL, 0, NULL, NULL, NULL),
('partner-services', 1, '', NULL, 0, NULL, NULL, NULL),
('partner-share-url', 1, 'This is Partner-share-url', NULL, 0, NULL, NULL, NULL),
('partner-video', 1, 'partner video', NULL, 0, NULL, NULL, NULL),
('partner-video-create', 1, 'partner video create', NULL, 0, NULL, NULL, NULL),
('partner-video-delete', 1, 'partner video delete', NULL, 0, NULL, NULL, NULL),
('partner-video-view', 1, 'partner video view', NULL, 0, NULL, NULL, NULL),
('partner-view-list', 1, '', NULL, 0, NULL, NULL, NULL),
('playlist-seqence-app', 1, 'This is Playlist-seqence-app', NULL, 0, NULL, NULL, NULL),
('playlist-seqence-create', 1, 'This is Playlist-seqence-create', NULL, 0, NULL, NULL, NULL),
('playlist-seqence-delete', 1, 'playlist seqence delete', NULL, 0, NULL, NULL, NULL),
('playlistcategory-seq', 1, 'Play list category sequence ', NULL, 0, NULL, NULL, NULL),
('plush-places', 1, 'Plush Places', NULL, 1, NULL, NULL, NULL),
('posts', 1, '', NULL, 0, NULL, NULL, NULL),
('pti-feed', 1, '', NULL, 0, NULL, NULL, NULL),
('push-notification', 1, 'alllow to access push notification', NULL, 0, NULL, NULL, NULL),
('push_notification', 1, '', NULL, 0, NULL, NULL, NULL),
('raftaar-rebooted', 1, 'Raftaar Rebooted', NULL, 1, NULL, NULL, NULL),
('report_section', 1, '', NULL, 0, NULL, NULL, NULL),
('role', 1, 'allow to access all roles', NULL, 0, NULL, NULL, NULL),
('script-delete', 1, 'allow to delete script', NULL, 0, NULL, NULL, NULL),
('send_notification', 1, '', NULL, 0, NULL, NULL, NULL),
('Senior_editor', 1, 'senior_editor parent ', NULL, 1, NULL, NULL, NULL),
('senior_editor_with_live', 1, '', NULL, 1, NULL, NULL, NULL),
('setting', 1, 'access to  setting', NULL, 1, NULL, NULL, NULL),
('share-url', 1, 'this is share url', NULL, 0, NULL, NULL, NULL),
('share-video', 1, '', NULL, 0, NULL, NULL, NULL),
('show-partnerplay-list', 1, 'show partnerplay list', NULL, 0, NULL, NULL, NULL),
('show-playlist-view', 1, 'show playlist view', NULL, 0, NULL, NULL, NULL),
('skymet-weather', 1, 'SkyMet Weather', NULL, 1, NULL, NULL, NULL),
('social-story', 1, '', NULL, 0, NULL, NULL, NULL),
('social_editors', 1, '', NULL, 1, NULL, NULL, NULL),
('sodapoplove', 1, 'SodaPopLove', NULL, 1, NULL, NULL, NULL),
('sp-guide-publications', 1, 'SP Guide Publications', NULL, 1, NULL, NULL, NULL),
('sportblogs', 1, '', NULL, 0, NULL, NULL, NULL),
('state', 1, 'allow to access all state', NULL, 0, NULL, NULL, NULL),
('stuff-india', 1, 'Stuff (India)', NULL, 1, NULL, NULL, NULL),
('stuffindia', 1, 'StuffIndia', NULL, 1, NULL, NULL, NULL),
('summachar', 1, 'Summachar', NULL, 1, NULL, NULL, NULL),
('test-partner112', 1, 'Test Partner112', NULL, 1, NULL, NULL, NULL),
('Tester', 1, 'Tester Group', NULL, 1, NULL, NULL, NULL),
('The Sentinel', 1, '', NULL, 1, NULL, NULL, NULL),
('the-bastion', 1, 'The Bastion', NULL, 1, NULL, NULL, NULL),
('the-bridge', 1, 'The Bridge', NULL, 1, NULL, NULL, NULL),
('the-print', 1, 'The Print', NULL, 1, NULL, NULL, NULL),
('the-sentinel', 1, 'The Sentinel', NULL, 1, NULL, NULL, NULL),
('the-sentinel-assam', 1, 'The Sentinel Assam', NULL, 1, NULL, NULL, NULL),
('tournaments', 1, '', NULL, 0, NULL, NULL, NULL),
('transit-video', 1, 'This is upload transit-video', NULL, 0, NULL, NULL, NULL),
('transition-create', 1, 'transition create', NULL, 0, NULL, NULL, NULL),
('transition-delete', 1, 'transition delete', NULL, 0, NULL, NULL, NULL),
('transition-update', 1, 'transition update', NULL, 0, NULL, NULL, NULL),
('transition-video', 1, 'transition video', NULL, 0, NULL, NULL, NULL),
('trend-news', 1, 'access to trend news', NULL, 0, NULL, NULL, NULL),
('trending-video', 1, 'This is Trending-video', NULL, 0, NULL, NULL, NULL),
('trending-video-create', 1, 'This  is trending-video-create', NULL, 0, NULL, NULL, NULL),
('trending-video-delete', 1, 'This is trending-video-delete', NULL, 0, NULL, NULL, NULL),
('tv-app-sections', 1, '', NULL, 0, NULL, NULL, NULL),
('tv-app-widgets', 1, '', NULL, 0, NULL, NULL, NULL),
('tvapp-headers-category', 1, '', NULL, 0, NULL, NULL, NULL),
('tvapp-section-log', 1, '', NULL, 0, NULL, NULL, NULL),
('tvapp-sections', 1, '', NULL, 0, NULL, NULL, NULL),
('tvapp-widgets', 1, '', NULL, 0, NULL, NULL, NULL),
('update-blogs', 1, '', NULL, 0, NULL, NULL, NULL),
('update-editor-video', 1, '', NULL, 0, NULL, NULL, NULL),
('update-post', 1, '', NULL, 0, NULL, NULL, NULL),
('update-web-sections', 1, '', NULL, 0, NULL, NULL, NULL),
('update_app_bands', 1, '', NULL, 0, NULL, NULL, NULL),
('update_live_stream', 1, '', NULL, 0, NULL, NULL, NULL),
('user-changepassword', 1, 'user change password', NULL, 0, NULL, NULL, NULL),
('user-create', 1, 'allow to create user', NULL, 0, NULL, NULL, NULL),
('useractivity-log', 1, 'allow user to show log', NULL, 0, NULL, NULL, NULL),
('userstatus-activity', 1, 'allow to user show activity', NULL, 0, NULL, NULL, NULL),
('v-beauty', 1, 'V Beauty', NULL, 1, NULL, NULL, NULL),
('vbeauty', 1, 'V Beauty', NULL, 1, NULL, NULL, NULL),
('video-add', 1, 'This is for add video', NULL, 0, NULL, NULL, NULL),
('video-create', 1, 'allow to create video', NULL, 0, NULL, NULL, NULL),
('video-delete', 1, 'allow to access video delete section', NULL, 0, NULL, NULL, NULL),
('video-duration', 1, '', NULL, 0, NULL, NULL, NULL),
('video-list', 1, 'allow to access all video section', NULL, 0, NULL, NULL, NULL),
('video-setting', 1, 'allow to access all video setting', NULL, 0, NULL, NULL, NULL),
('video-show-deleted', 1, 'video show deleted', NULL, 0, NULL, NULL, NULL),
('video-update', 1, 'allow to access video update section', NULL, 0, NULL, NULL, NULL),
('video-view', 1, 'allow to access video view section', NULL, 0, NULL, NULL, NULL),
('video-views', 1, '', NULL, 0, NULL, NULL, NULL),
('videoapp-index', 1, 'allow to access mannage app intro outro', NULL, 0, NULL, NULL, NULL),
('videoplay-list', 1, 'allow to access video play list', NULL, 0, NULL, NULL, NULL),
('videotime-manage', 1, 'allow to access mannage video time', NULL, 0, NULL, NULL, NULL),
('view-airtel-video', 1, '', NULL, 0, NULL, NULL, NULL),
('view-social-video', 1, '', NULL, 0, NULL, NULL, NULL),
('view-video-section', 1, '', NULL, 0, NULL, NULL, NULL),
('view_only', 1, 'can only view ', NULL, 1, NULL, NULL, NULL),
('vikram-show', 1, 'vikram-show', NULL, 0, NULL, NULL, NULL),
('VO_Artist', 1, 'vo_artist parent user', NULL, 1, NULL, NULL, NULL),
('warpcore', 1, 'Warpcore', NULL, 1, NULL, NULL, NULL),
('web-config', 1, '', NULL, 0, NULL, NULL, NULL),
('web-section-cat-pages', 1, '', NULL, 0, NULL, NULL, NULL),
('web-sections', 1, '', NULL, 0, NULL, NULL, NULL),
('web-trending', 1, '', NULL, 0, NULL, NULL, NULL),
('web-video-trending', 1, '', NULL, 0, NULL, 2021, NULL),
('web-widgets', 1, '', NULL, 0, NULL, NULL, NULL),
('websection-log', 1, '', NULL, 0, NULL, NULL, NULL),
('yoga-connect', 1, 'Yoga Connect', NULL, 1, NULL, NULL, NULL),
('yoganama', 1, 'Yoganama', NULL, 1, NULL, NULL, NULL),
('zigwheels', 1, 'ZigWheels', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auth_item_child`
--

CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_auth_item_child`
--

INSERT INTO `tbl_auth_item_child` (`parent`, `child`) VALUES
('artinmyheart', 'partner-video'),
('artinmyheart', 'partner-video-create'),
('artinmyheart', 'partner-video-delete'),
('artinmyheart', 'partner-video-view'),
('autox', 'partner-play-list'),
('autox', 'partner-share-url'),
('autox', 'partner-video'),
('autox', 'partner-video-create'),
('autox', 'partner-video-delete'),
('autox', 'partner-video-view'),
('boomlive', 'partner-play-list'),
('boomlive', 'partner-share-url'),
('boomlive', 'partner-video'),
('boomlive', 'partner-video-create'),
('boomlive', 'partner-video-delete'),
('boomlive', 'partner-video-view'),
('brain-yog', 'partner-video'),
('brain-yog', 'partner-video-create'),
('brain-yog', 'partner-video-delete'),
('brain-yog', 'partner-video-view'),
('brain-yog-hindi', 'partner-video'),
('brain-yog-hindi', 'partner-video-create'),
('brain-yog-hindi', 'partner-video-delete'),
('brain-yog-hindi', 'partner-video-view'),
('car-and-bike', 'partner-video'),
('car-and-bike', 'partner-video-create'),
('car-and-bike', 'partner-video-delete'),
('car-and-bike', 'partner-video-view'),
('cardekho', 'partner-editor-dashboard'),
('cardekho', 'partner-play-list'),
('cardekho', 'partner-share-url'),
('cardekho', 'partner-video'),
('cardekho', 'partner-video-create'),
('cardekho', 'partner-video-delete'),
('cardekho', 'partner-video-view'),
('construction-world', 'partner-video'),
('construction-world', 'partner-video-create'),
('construction-world', 'partner-video-delete'),
('construction-world', 'partner-video-view'),
('construction-world-hindi', 'partner-video'),
('construction-world-hindi', 'partner-video-create'),
('construction-world-hindi', 'partner-video-delete'),
('construction-world-hindi', 'partner-video-view'),
('cry', 'partner-play-list'),
('cry', 'partner-share-url'),
('cry', 'partner-video'),
('cry', 'partner-video-create'),
('cry', 'partner-video-delete'),
('cry', 'partner-video-view'),
('dashboad', 'dashboad-category'),
('dashboad', 'dashboad-editor'),
('dashboad', 'dashboad-home'),
('databaaz', 'partner-play-list'),
('databaaz', 'partner-share-url'),
('databaaz', 'partner-video'),
('databaaz', 'partner-video-create'),
('databaaz', 'partner-video-delete'),
('databaaz', 'partner-video-view'),
('deepali-bhardwaj-skin-and-hair-clinic', 'partner-play-list'),
('deepali-bhardwaj-skin-and-hair-clinic', 'partner-share-url'),
('deepali-bhardwaj-skin-and-hair-clinic', 'partner-video'),
('deepali-bhardwaj-skin-and-hair-clinic', 'partner-video-create'),
('deepali-bhardwaj-skin-and-hair-clinic', 'partner-video-delete'),
('deepali-bhardwaj-skin-and-hair-clinic', 'partner-video-view'),
('diet-decisions', 'partner-play-list'),
('diet-decisions', 'partner-share-url'),
('diet-decisions', 'partner-video'),
('diet-decisions', 'partner-video-create'),
('diet-decisions', 'partner-video-delete'),
('diet-decisions', 'partner-video-view'),
('digit', 'partner-video'),
('digit', 'partner-video-create'),
('digit', 'partner-video-delete'),
('digit', 'partner-video-view'),
('dr-kiran-isya', 'partner-play-list'),
('dr-kiran-isya', 'partner-share-url'),
('dr-kiran-isya', 'partner-video'),
('dr-kiran-isya', 'partner-video-create'),
('dr-kiran-isya', 'partner-video-delete'),
('dr-kiran-isya', 'partner-video-view'),
('dr-vaidya-s', 'partner-video'),
('dr-vaidya-s', 'partner-video-create'),
('dr-vaidya-s', 'partner-video-delete'),
('dr-vaidya-s', 'partner-video-view'),
('east-mojo', 'partner-editor-dashboard'),
('east-mojo', 'partner-play-list'),
('east-mojo', 'partner-share-url'),
('east-mojo', 'partner-video'),
('east-mojo', 'partner-video-create'),
('east-mojo', 'partner-video-delete'),
('east-mojo', 'partner-video-view'),
('Editor', 'activity'),
('Editor', 'category'),
('Editor', 'corona_news'),
('Editor', 'Dashboad-appuser'),
('Editor', 'Dashboad-breaking'),
('Editor', 'dashboad-category'),
('Editor', 'Dashboad-city'),
('Editor', 'Dashboad-country'),
('Editor', 'Dashboad-devices'),
('Editor', 'dashboad-editor'),
('Editor', 'dashboad-home'),
('Editor', 'Dashboad-language'),
('Editor', 'Dashboad-state'),
('Editor', 'Dashboad-tags'),
('Editor', 'Dashboad-user'),
('Editor', 'Dashboad-videos'),
('Editor', 'dynamic-create'),
('Editor', 'dynamic-list'),
('Editor', 'editordashboard-addheadline'),
('Editor', 'editordashboard-dragheadline'),
('Editor', 'Editorial-Priority'),
('Editor', 'highlight-video'),
('Editor', 'link-list'),
('Editor', 'miss-news'),
('Editor', 'pti-feed'),
('Editor', 'script-delete'),
('Editor', 'share-url'),
('Editor', 'sportblogs'),
('Editor', 'tournaments'),
('Editor', 'trend-news'),
('Editor', 'video-create'),
('Editor', 'video-list'),
('Editor', 'video-update'),
('Editor', 'video-view'),
('embedded-partner', 'partner-view-list'),
('for-up-from-up', 'partner-play-list'),
('for-up-from-up', 'partner-share-url'),
('for-up-from-up', 'partner-video'),
('for-up-from-up', 'partner-video-create'),
('for-up-from-up', 'partner-video-delete'),
('for-up-from-up', 'partner-video-view'),
('for-up-from-up-hindi', 'partner-play-list'),
('for-up-from-up-hindi', 'partner-share-url'),
('for-up-from-up-hindi', 'partner-video'),
('for-up-from-up-hindi', 'partner-video-create'),
('for-up-from-up-hindi', 'partner-video-delete'),
('for-up-from-up-hindi', 'partner-video-view'),
('hindustan-hindi', 'partner-play-list'),
('hindustan-hindi', 'partner-share-url'),
('hindustan-hindi', 'partner-video'),
('hindustan-hindi', 'partner-video-create'),
('hindustan-hindi', 'partner-video-delete'),
('hindustan-hindi', 'partner-video-view'),
('hindustan-times', 'partner-play-list'),
('hindustan-times', 'partner-share-url'),
('hindustan-times', 'partner-video'),
('hindustan-times', 'partner-video-create'),
('hindustan-times', 'partner-video-delete'),
('hindustan-times', 'partner-video-view'),
('IndiaAllSports', 'partner-play-list'),
('IndiaAllSports', 'partner-share-url'),
('IndiaAllSports', 'partner-video'),
('IndiaAllSports', 'partner-video-create'),
('IndiaAllSports', 'partner-video-delete'),
('IndiaAllSports', 'partner-video-view'),
('Intern', 'discover-create'),
('Intern', 'discover-delete'),
('Intern', 'discover-seqence-app'),
('Intern', 'discover-update'),
('Intern', 'trending-video'),
('Intern', 'trending-video-create'),
('Intern', 'trending-video-delete'),
('isha-foundation', 'partner-editor-dashboard'),
('isha-foundation', 'partner-play-list'),
('isha-foundation', 'partner-share-url'),
('isha-foundation', 'partner-video'),
('isha-foundation', 'partner-video-create'),
('isha-foundation', 'partner-video-delete'),
('isha-foundation', 'partner-video-view'),
('jankibaat', 'partner-video'),
('jankibaat', 'partner-video-create'),
('jankibaat', 'partner-video-delete'),
('jankibaat', 'partner-video-view'),
('Jr_admin', 'activity'),
('Jr_admin', 'anchor-delete'),
('Jr_admin', 'app-user'),
('Jr_admin', 'category'),
('Jr_admin', 'cms-user'),
('Jr_admin', 'corona_news'),
('Jr_admin', 'Dashboad-appuser'),
('Jr_admin', 'Dashboad-breaking'),
('Jr_admin', 'dashboad-category'),
('Jr_admin', 'Dashboad-city'),
('Jr_admin', 'Dashboad-country'),
('Jr_admin', 'Dashboad-devices'),
('Jr_admin', 'dashboad-editor'),
('Jr_admin', 'dashboad-home'),
('Jr_admin', 'Dashboad-language'),
('Jr_admin', 'Dashboad-state'),
('Jr_admin', 'Dashboad-tags'),
('Jr_admin', 'Dashboad-user'),
('Jr_admin', 'Dashboad-videos'),
('Jr_admin', 'dynamic-create'),
('Jr_admin', 'dynamic-list'),
('Jr_admin', 'editordashboard-addheadline'),
('Jr_admin', 'editordashboard-dragheadline'),
('Jr_admin', 'editordashboard-removeheadline'),
('Jr_admin', 'Editorial-Priority'),
('Jr_admin', 'error-log'),
('Jr_admin', 'headline-view'),
('Jr_admin', 'highlight-video'),
('Jr_admin', 'language'),
('Jr_admin', 'link-list'),
('Jr_admin', 'miss-news'),
('Jr_admin', 'opinion-anchor'),
('Jr_admin', 'playlistcategory-seq'),
('Jr_admin', 'pti-feed'),
('Jr_admin', 'trend-news'),
('Jr_admin', 'video-create'),
('Jr_admin', 'video-delete'),
('Jr_admin', 'video-list'),
('Jr_admin', 'video-update'),
('Jr_admin', 'video-view'),
('Jr_admin', 'videoplay-list'),
('Jr_admin', 'videotime-manage'),
('kashmir-monitor', 'partner-editor-dashboard'),
('kashmir-monitor', 'partner-play-list'),
('kashmir-monitor', 'partner-share-url'),
('kashmir-monitor', 'partner-video'),
('kashmir-monitor', 'partner-video-create'),
('kashmir-monitor', 'partner-video-delete'),
('kashmir-monitor', 'partner-video-view'),
('Minnambalam', 'partner-play-list'),
('Minnambalam', 'partner-share-url'),
('Minnambalam', 'partner-video'),
('Minnambalam', 'partner-video-create'),
('Minnambalam', 'partner-video-delete'),
('Minnambalam', 'partner-video-view'),
('News', 'activity'),
('News', 'anchor-delete'),
('News', 'app-user'),
('News', 'category'),
('News', 'city'),
('News', 'cms-user'),
('News', 'country'),
('News', 'dashboad-category'),
('News', 'dashboad-editor'),
('News', 'dashboad-home'),
('News', 'editordashboard-addheadline'),
('News', 'editordashboard-dragheadline'),
('News', 'editordashboard-removeheadline'),
('News', 'error-log'),
('News', 'highlight-video'),
('News', 'language'),
('News', 'link-list'),
('News', 'miss-news'),
('News', 'opinion-anchor'),
('News', 'parameter'),
('News', 'playlistcategory-seq'),
('News', 'pti-feed'),
('News', 'push-notification'),
('News', 'role'),
('News', 'state'),
('News', 'trend-news'),
('News', 'user-create'),
('News', 'useractivity-log'),
('News', 'userstatus-activity'),
('News', 'video-create'),
('News', 'video-delete'),
('News', 'video-list'),
('News', 'video-setting'),
('News', 'video-update'),
('News', 'video-view'),
('News', 'videoapp-index'),
('News', 'videoplay-list'),
('News', 'videotime-manage'),
('news-minute', 'partner-editor-dashboard'),
('news-minute', 'partner-play-list'),
('news-minute', 'partner-share-url'),
('news-minute', 'partner-video'),
('news-minute', 'partner-video-create'),
('news-minute', 'partner-video-delete'),
('news-minute', 'partner-video-view'),
('news24', 'partner-editor-dashboard'),
('news24', 'partner-play-list'),
('news24', 'partner-share-url'),
('news24', 'partner-video'),
('news24', 'partner-video-create'),
('news24', 'partner-video-delete'),
('news24', 'partner-video-view'),
('newsroompost', 'partner-editor-dashboard'),
('newsroompost', 'partner-play-list'),
('newsroompost', 'partner-share-url'),
('newsroompost', 'partner-video'),
('newsroompost', 'partner-video-create'),
('newsroompost', 'partner-video-delete'),
('newsroompost', 'partner-video-view'),
('plush-places', 'partner-play-list'),
('plush-places', 'partner-share-url'),
('plush-places', 'partner-video'),
('plush-places', 'partner-video-create'),
('plush-places', 'partner-video-delete'),
('plush-places', 'partner-video-view'),
('raftaar-rebooted', 'partner-video'),
('raftaar-rebooted', 'partner-video-create'),
('raftaar-rebooted', 'partner-video-delete'),
('raftaar-rebooted', 'partner-video-view'),
('Senior_editor', 'activity'),
('Senior_editor', 'add-widget'),
('Senior_editor', 'anchor-delete'),
('Senior_editor', 'app-intro-outro'),
('Senior_editor', 'app-user'),
('Senior_editor', 'category'),
('Senior_editor', 'comment-delete'),
('Senior_editor', 'comment-index'),
('Senior_editor', 'comment-view'),
('Senior_editor', 'corona_news'),
('Senior_editor', 'create-airtel-video'),
('Senior_editor', 'create-social-video'),
('Senior_editor', 'Dashboad-appuser'),
('Senior_editor', 'Dashboad-breaking'),
('Senior_editor', 'dashboad-category'),
('Senior_editor', 'Dashboad-city'),
('Senior_editor', 'Dashboad-country'),
('Senior_editor', 'Dashboad-devices'),
('Senior_editor', 'dashboad-editor'),
('Senior_editor', 'dashboad-home'),
('Senior_editor', 'Dashboad-language'),
('Senior_editor', 'Dashboad-state'),
('Senior_editor', 'Dashboad-tags'),
('Senior_editor', 'Dashboad-user'),
('Senior_editor', 'Dashboad-videos'),
('Senior_editor', 'discover-create'),
('Senior_editor', 'discover-delete'),
('Senior_editor', 'discover-seqence-app'),
('Senior_editor', 'discover-update'),
('Senior_editor', 'dynamic-create'),
('Senior_editor', 'dynamic-list'),
('Senior_editor', 'editordashboard-addheadline'),
('Senior_editor', 'editordashboard-dragheadline'),
('Senior_editor', 'editordashboard-removeheadline'),
('Senior_editor', 'Editorial-Priority'),
('Senior_editor', 'error-log'),
('Senior_editor', 'headline-view'),
('Senior_editor', 'highlight-video'),
('Senior_editor', 'link-list'),
('Senior_editor', 'live_stream'),
('Senior_editor', 'miss-news'),
('Senior_editor', 'opinion-anchor'),
('Senior_editor', 'partner-create'),
('Senior_editor', 'partner-create-link'),
('Senior_editor', 'partner-delete'),
('Senior_editor', 'partner-delete-link'),
('Senior_editor', 'partner-edit'),
('Senior_editor', 'partner-list'),
('Senior_editor', 'partner-list-link'),
('Senior_editor', 'partner-play-list'),
('Senior_editor', 'partner-playlist-sequence'),
('Senior_editor', 'partner-playlist-sequence-delete'),
('Senior_editor', 'partner-playlist-sequence-update'),
('Senior_editor', 'partner-share-url'),
('Senior_editor', 'playlist-seqence-app'),
('Senior_editor', 'playlist-seqence-create'),
('Senior_editor', 'playlist-seqence-delete'),
('Senior_editor', 'playlistcategory-seq'),
('Senior_editor', 'pti-feed'),
('Senior_editor', 'script-delete'),
('Senior_editor', 'share-url'),
('Senior_editor', 'show-partnerplay-list'),
('Senior_editor', 'social-story'),
('Senior_editor', 'sportblogs'),
('Senior_editor', 'tournaments'),
('Senior_editor', 'transit-video'),
('Senior_editor', 'trend-news'),
('Senior_editor', 'trending-video'),
('Senior_editor', 'trending-video-create'),
('Senior_editor', 'trending-video-delete'),
('Senior_editor', 'tv-app-sections'),
('Senior_editor', 'update-editor-video'),
('Senior_editor', 'video-create'),
('Senior_editor', 'video-delete'),
('Senior_editor', 'video-list'),
('Senior_editor', 'video-setting'),
('Senior_editor', 'video-show-deleted'),
('Senior_editor', 'video-update'),
('Senior_editor', 'video-view'),
('Senior_editor', 'videoapp-index'),
('Senior_editor', 'view-airtel-video'),
('Senior_editor', 'view-social-video'),
('Senior_editor', 'vikram-show'),
('Senior_editor', 'web-section-cat-pages'),
('senior_editor_with_live', 'activity'),
('senior_editor_with_live', 'ad-tech'),
('senior_editor_with_live', 'ad-tech-create'),
('senior_editor_with_live', 'add-widget'),
('senior_editor_with_live', 'anchor-delete'),
('senior_editor_with_live', 'app-intro-outro'),
('senior_editor_with_live', 'app-user'),
('senior_editor_with_live', 'blogs'),
('senior_editor_with_live', 'category'),
('senior_editor_with_live', 'city'),
('senior_editor_with_live', 'cms-user'),
('senior_editor_with_live', 'comment-delete'),
('senior_editor_with_live', 'comment-view'),
('senior_editor_with_live', 'corona_news'),
('senior_editor_with_live', 'create-airtel-video'),
('senior_editor_with_live', 'create-social-video'),
('senior_editor_with_live', 'Dashboad-appuser'),
('senior_editor_with_live', 'Dashboad-breaking'),
('senior_editor_with_live', 'Dashboad-city'),
('senior_editor_with_live', 'Dashboad-country'),
('senior_editor_with_live', 'Dashboad-devices'),
('senior_editor_with_live', 'dashboad-editor'),
('senior_editor_with_live', 'dashboad-home'),
('senior_editor_with_live', 'Dashboad-language'),
('senior_editor_with_live', 'Dashboad-state'),
('senior_editor_with_live', 'Dashboad-tags'),
('senior_editor_with_live', 'Dashboad-user'),
('senior_editor_with_live', 'Dashboad-videos'),
('senior_editor_with_live', 'discover-create'),
('senior_editor_with_live', 'discover-delete'),
('senior_editor_with_live', 'discover-seqence-app'),
('senior_editor_with_live', 'discover-update'),
('senior_editor_with_live', 'discover-v2'),
('senior_editor_with_live', 'dw-feed'),
('senior_editor_with_live', 'dynamic-create'),
('senior_editor_with_live', 'dynamic-list'),
('senior_editor_with_live', 'editordashboard-addheadline'),
('senior_editor_with_live', 'editordashboard-dragheadline'),
('senior_editor_with_live', 'editordashboard-removeheadline'),
('senior_editor_with_live', 'Editorial-Priority'),
('senior_editor_with_live', 'featured_news'),
('senior_editor_with_live', 'headers-category'),
('senior_editor_with_live', 'headline-view'),
('senior_editor_with_live', 'highlight-video'),
('senior_editor_with_live', 'link-list'),
('senior_editor_with_live', 'live_stream'),
('senior_editor_with_live', 'miss-news'),
('senior_editor_with_live', 'more-filters'),
('senior_editor_with_live', 'opinion-anchor'),
('senior_editor_with_live', 'partner-create'),
('senior_editor_with_live', 'partner-create-link'),
('senior_editor_with_live', 'partner-delete'),
('senior_editor_with_live', 'partner-delete-link'),
('senior_editor_with_live', 'partner-edit'),
('senior_editor_with_live', 'partner-list'),
('senior_editor_with_live', 'partner-list-link'),
('senior_editor_with_live', 'partner-playlist-sequence-delete'),
('senior_editor_with_live', 'partner-playlist-sequence-update'),
('senior_editor_with_live', 'partner-share-url'),
('senior_editor_with_live', 'playlist-seqence-app'),
('senior_editor_with_live', 'playlist-seqence-create'),
('senior_editor_with_live', 'playlist-seqence-delete'),
('senior_editor_with_live', 'playlistcategory-seq'),
('senior_editor_with_live', 'posts'),
('senior_editor_with_live', 'pti-feed'),
('senior_editor_with_live', 'push_notification'),
('senior_editor_with_live', 'script-delete'),
('senior_editor_with_live', 'send_notification'),
('senior_editor_with_live', 'share-url'),
('senior_editor_with_live', 'share-video'),
('senior_editor_with_live', 'show-partnerplay-list'),
('senior_editor_with_live', 'social-story'),
('senior_editor_with_live', 'sportblogs'),
('senior_editor_with_live', 'state'),
('senior_editor_with_live', 'tournaments'),
('senior_editor_with_live', 'transit-video'),
('senior_editor_with_live', 'trend-news'),
('senior_editor_with_live', 'trending-video'),
('senior_editor_with_live', 'trending-video-create'),
('senior_editor_with_live', 'trending-video-delete'),
('senior_editor_with_live', 'tv-app-sections'),
('senior_editor_with_live', 'tvapp-section-log'),
('senior_editor_with_live', 'tvapp-sections'),
('senior_editor_with_live', 'update-blogs'),
('senior_editor_with_live', 'update-editor-video'),
('senior_editor_with_live', 'update-post'),
('senior_editor_with_live', 'update-web-sections'),
('senior_editor_with_live', 'update_live_stream'),
('senior_editor_with_live', 'video-create'),
('senior_editor_with_live', 'video-delete'),
('senior_editor_with_live', 'video-duration'),
('senior_editor_with_live', 'video-list'),
('senior_editor_with_live', 'video-setting'),
('senior_editor_with_live', 'video-show-deleted'),
('senior_editor_with_live', 'video-update'),
('senior_editor_with_live', 'video-view'),
('senior_editor_with_live', 'video-views'),
('senior_editor_with_live', 'videoapp-index'),
('senior_editor_with_live', 'view-airtel-video'),
('senior_editor_with_live', 'view-social-video'),
('senior_editor_with_live', 'vikram-show'),
('senior_editor_with_live', 'web-config'),
('senior_editor_with_live', 'web-section-cat-pages'),
('senior_editor_with_live', 'web-sections'),
('senior_editor_with_live', 'websection-log'),
('setting', 'app-user'),
('setting', 'category'),
('setting', 'cms-user'),
('setting', 'language'),
('setting', 'parameter'),
('skymet-weather', 'partner-editor-dashboard'),
('skymet-weather', 'partner-play-list'),
('skymet-weather', 'partner-share-url'),
('skymet-weather', 'partner-video'),
('skymet-weather', 'partner-video-create'),
('skymet-weather', 'partner-video-delete'),
('skymet-weather', 'partner-video-view'),
('social_editors', 'activity'),
('social_editors', 'category'),
('social_editors', 'corona_news'),
('social_editors', 'Dashboad-appuser'),
('social_editors', 'Dashboad-breaking'),
('social_editors', 'dashboad-category'),
('social_editors', 'Dashboad-city'),
('social_editors', 'Dashboad-country'),
('social_editors', 'Dashboad-devices'),
('social_editors', 'dashboad-editor'),
('social_editors', 'dashboad-home'),
('social_editors', 'Dashboad-language'),
('social_editors', 'Dashboad-state'),
('social_editors', 'Dashboad-tags'),
('social_editors', 'Dashboad-user'),
('social_editors', 'Dashboad-videos'),
('social_editors', 'dynamic-create'),
('social_editors', 'dynamic-list'),
('social_editors', 'editordashboard-addheadline'),
('social_editors', 'editordashboard-dragheadline'),
('social_editors', 'Editorial-Priority'),
('social_editors', 'highlight-video'),
('social_editors', 'link-list'),
('social_editors', 'miss-news'),
('social_editors', 'pti-feed'),
('social_editors', 'script-delete'),
('social_editors', 'share-url'),
('social_editors', 'share-video'),
('social_editors', 'trend-news'),
('social_editors', 'video-create'),
('social_editors', 'video-list'),
('social_editors', 'video-update'),
('social_editors', 'video-view'),
('sodapoplove', 'partner-video'),
('sodapoplove', 'partner-video-create'),
('sodapoplove', 'partner-video-delete'),
('sodapoplove', 'partner-video-view'),
('sp-guide-publications', 'partner-video'),
('sp-guide-publications', 'partner-video-create'),
('sp-guide-publications', 'partner-video-delete'),
('sp-guide-publications', 'partner-video-view'),
('stuff-india', 'partner-editor-dashboard'),
('stuff-india', 'partner-play-list'),
('stuff-india', 'partner-share-url'),
('stuff-india', 'partner-video'),
('stuff-india', 'partner-video-create'),
('stuff-india', 'partner-video-delete'),
('stuff-india', 'partner-video-view'),
('stuffindia', 'partner-editor-dashboard'),
('stuffindia', 'partner-play-list'),
('stuffindia', 'partner-share-url'),
('stuffindia', 'partner-video'),
('stuffindia', 'partner-video-create'),
('stuffindia', 'partner-video-delete'),
('stuffindia', 'partner-video-view'),
('summachar', 'partner-video'),
('summachar', 'partner-video-create'),
('summachar', 'partner-video-delete'),
('summachar', 'partner-video-view'),
('Tester', 'dashboad-editor'),
('Tester', 'discover-create'),
('Tester', 'discover-delete'),
('Tester', 'discover-seqence-app'),
('Tester', 'discover-update'),
('Tester', 'playlist-seqence-app'),
('Tester', 'playlist-seqence-create'),
('Tester', 'playlist-seqence-delete'),
('Tester', 'trending-video'),
('Tester', 'trending-video-create'),
('Tester', 'trending-video-delete'),
('Tester', 'video-list'),
('Tester', 'video-update'),
('Tester', 'video-view'),
('The Sentinel', 'partner-play-list'),
('The Sentinel', 'partner-share-url'),
('The Sentinel', 'partner-video'),
('The Sentinel', 'partner-video-create'),
('The Sentinel', 'partner-video-delete'),
('The Sentinel', 'partner-video-view'),
('the-bastion', 'partner-play-list'),
('the-bastion', 'partner-share-url'),
('the-bastion', 'partner-video'),
('the-bastion', 'partner-video-create'),
('the-bastion', 'partner-video-delete'),
('the-bastion', 'partner-video-view'),
('the-bridge', 'partner-play-list'),
('the-bridge', 'partner-share-url'),
('the-bridge', 'partner-video'),
('the-bridge', 'partner-video-create'),
('the-bridge', 'partner-video-delete'),
('the-bridge', 'partner-video-view'),
('the-print', 'partner-editor-dashboard'),
('the-print', 'partner-play-list'),
('the-print', 'partner-share-url'),
('the-print', 'partner-video'),
('the-print', 'partner-video-create'),
('the-print', 'partner-video-delete'),
('the-print', 'partner-video-view'),
('the-sentinel', 'partner-play-list'),
('the-sentinel', 'partner-share-url'),
('the-sentinel', 'partner-video'),
('the-sentinel', 'partner-video-create'),
('the-sentinel', 'partner-video-delete'),
('the-sentinel', 'partner-video-view'),
('the-sentinel-assam', 'partner-play-list'),
('the-sentinel-assam', 'partner-share-url'),
('the-sentinel-assam', 'partner-video'),
('the-sentinel-assam', 'partner-video-create'),
('the-sentinel-assam', 'partner-video-delete'),
('the-sentinel-assam', 'partner-video-view'),
('v-beauty', 'partner-play-list'),
('v-beauty', 'partner-share-url'),
('v-beauty', 'partner-video'),
('v-beauty', 'partner-video-create'),
('v-beauty', 'partner-video-delete'),
('v-beauty', 'partner-video-view'),
('vbeauty', 'partner-play-list'),
('vbeauty', 'partner-share-url'),
('vbeauty', 'partner-video'),
('vbeauty', 'partner-video-create'),
('vbeauty', 'partner-video-delete'),
('vbeauty', 'partner-video-view'),
('view_only', 'dashboad-editor'),
('view_only', 'video-list'),
('view_only', 'video-view'),
('view_only', 'view-video-section'),
('VO_Artist', 'activity'),
('VO_Artist', 'dashboad-category'),
('VO_Artist', 'dashboad-editor'),
('VO_Artist', 'dashboad-home'),
('VO_Artist', 'editordashboard-addheadline'),
('VO_Artist', 'editordashboard-dragheadline'),
('VO_Artist', 'editordashboard-removeheadline'),
('VO_Artist', 'link-list'),
('VO_Artist', 'miss-news'),
('VO_Artist', 'pti-feed'),
('VO_Artist', 'trend-news'),
('VO_Artist', 'video-create'),
('VO_Artist', 'video-list'),
('VO_Artist', 'video-update'),
('VO_Artist', 'video-view'),
('warpcore', 'partner-play-list'),
('warpcore', 'partner-share-url'),
('warpcore', 'partner-video'),
('warpcore', 'partner-video-create'),
('warpcore', 'partner-video-delete'),
('warpcore', 'partner-video-view'),
('yoga-connect', 'partner-play-list'),
('yoga-connect', 'partner-share-url'),
('yoga-connect', 'partner-video'),
('yoga-connect', 'partner-video-create'),
('yoga-connect', 'partner-video-delete'),
('yoga-connect', 'partner-video-view'),
('yoganama', 'partner-play-list'),
('yoganama', 'partner-share-url'),
('yoganama', 'partner-video'),
('yoganama', 'partner-video-create'),
('yoganama', 'partner-video-delete'),
('yoganama', 'partner-video-view'),
('zigwheels', 'partner-editor-dashboard'),
('zigwheels', 'partner-play-list'),
('zigwheels', 'partner-share-url'),
('zigwheels', 'partner-video'),
('zigwheels', 'partner-video-create'),
('zigwheels', 'partner-video-delete'),
('zigwheels', 'partner-video-view'),
('senior_editor_with_live', 'web-video-trending'),
('admin', 'activity'),
('admin', 'ad-tech'),
('admin', 'ad-tech-create'),
('admin', 'add-news'),
('admin', 'add-widget'),
('admin', 'anchor-delete'),
('admin', 'app-intro-outro'),
('admin', 'app-user'),
('admin', 'blogs'),
('admin', 'category'),
('admin', 'city'),
('admin', 'cms-user'),
('admin', 'comment-delete'),
('admin', 'comment-view'),
('admin', 'corona_news'),
('admin', 'country'),
('admin', 'create-airtel-video'),
('admin', 'create-social-video'),
('admin', 'Dashboad-appuser'),
('admin', 'Dashboad-breaking'),
('admin', 'Dashboad-city'),
('admin', 'Dashboad-country'),
('admin', 'Dashboad-devices'),
('admin', 'dashboad-editor'),
('admin', 'dashboad-home'),
('admin', 'Dashboad-language'),
('admin', 'Dashboad-state'),
('admin', 'Dashboad-tags'),
('admin', 'Dashboad-user'),
('admin', 'Dashboad-videos'),
('admin', 'discover-create'),
('admin', 'discover-delete'),
('admin', 'discover-seqence-app'),
('admin', 'discover-update'),
('admin', 'discover-v2'),
('admin', 'dw-feed'),
('admin', 'dynamic-create'),
('admin', 'dynamic-list'),
('admin', 'editordashboard-addheadline'),
('admin', 'editordashboard-dragheadline'),
('admin', 'editordashboard-removeheadline'),
('admin', 'Editorial-Priority'),
('admin', 'featured_news'),
('admin', 'headers-category'),
('admin', 'headline-view'),
('admin', 'highlight-video'),
('admin', 'language'),
('admin', 'link-list'),
('admin', 'live_stream'),
('admin', 'microsite-sections'),
('admin', 'miss-news'),
('admin', 'more-filters'),
('admin', 'most-trending-video'),
('admin', 'newslist_section'),
('admin', 'opinion-anchor'),
('admin', 'parameter'),
('admin', 'partner-create'),
('admin', 'partner-create-link'),
('admin', 'partner-delete'),
('admin', 'partner-delete-link'),
('admin', 'partner-edit'),
('admin', 'partner-list'),
('admin', 'partner-list-link'),
('admin', 'partner-playlist-sequence-delete'),
('admin', 'partner-playlist-sequence-update'),
('admin', 'partner-services'),
('admin', 'partner-view-list'),
('admin', 'playlist-seqence-app'),
('admin', 'playlist-seqence-create'),
('admin', 'playlist-seqence-delete'),
('admin', 'playlistcategory-seq'),
('admin', 'posts'),
('admin', 'pti-feed'),
('admin', 'push-notification'),
('admin', 'push_notification'),
('admin', 'report_section'),
('admin', 'role'),
('admin', 'script-delete'),
('admin', 'send_notification'),
('admin', 'share-url'),
('admin', 'share-video'),
('admin', 'show-partnerplay-list'),
('admin', 'show-playlist-view'),
('admin', 'social-story'),
('admin', 'sportblogs'),
('admin', 'state'),
('admin', 'tournaments'),
('admin', 'transit-video'),
('admin', 'transition-create'),
('admin', 'transition-delete'),
('admin', 'transition-update'),
('admin', 'transition-video'),
('admin', 'trend-news'),
('admin', 'trending-video'),
('admin', 'trending-video-create'),
('admin', 'trending-video-delete'),
('admin', 'tv-app-sections'),
('admin', 'tv-app-widgets'),
('admin', 'tvapp-headers-category'),
('admin', 'tvapp-section-log'),
('admin', 'tvapp-sections'),
('admin', 'tvapp-widgets'),
('admin', 'update-blogs'),
('admin', 'update-editor-video'),
('admin', 'update-post'),
('admin', 'update-web-sections'),
('admin', 'update_app_bands'),
('admin', 'update_live_stream'),
('admin', 'user-changepassword'),
('admin', 'user-create'),
('admin', 'useractivity-log'),
('admin', 'userstatus-activity'),
('admin', 'video-add'),
('admin', 'video-create'),
('admin', 'video-delete'),
('admin', 'video-duration'),
('admin', 'video-list'),
('admin', 'video-setting'),
('admin', 'video-show-deleted'),
('admin', 'video-update'),
('admin', 'video-view'),
('admin', 'video-views'),
('admin', 'videoapp-index'),
('admin', 'view-airtel-video'),
('admin', 'view-social-video'),
('admin', 'vikram-show'),
('admin', 'web-config'),
('admin', 'web-section-cat-pages'),
('admin', 'web-sections'),
('admin', 'web-trending'),
('admin', 'web-widgets'),
('admin', 'websection-log');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_auth_rule`
--

CREATE TABLE `tbl_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8,
  `json_data` text CHARACTER SET utf8,
  `image_url` varchar(255) DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `image16_9` varchar(255) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT 'en',
  `meta_description` text CHARACTER SET utf8,
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `type` enum('Domestic','International') DEFAULT 'Domestic',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `deleted_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `country_code`, `description`, `json_data`, `image_url`, `cloud_image`, `image16_9`, `language_code`, `meta_description`, `status`, `type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `is_deleted`, `deleted_by`) VALUES
(2, 'Mumbai Indians', 'IN', '<p><strong>Mumbai Indians Mumbai IndiansMumbai Indians</strong>Mumbai IndiansMumbai IndiansMumbai IndiansMumbai IndiansMumbai IndiansMumbai IndiansMumbai IndiansMumbai Indianss</p>', NULL, 'U2IairzKi8.jpg', 'Images/mnivsqfd5xlumwckk24g', NULL, 'en', NULL, 'Enabled', 'Domestic', '2021-03-22 07:52:28', '2021-04-06 07:53:51', 1481179303607728865, 1531815491526, 'N', 0),
(3, 'Royal Challengers Bangalore', '', '<p><strong>Royal Challengers BangloreRoyal Challengers BangloreRoyal Challengers BangloreRoyal Challengers BangloreRoyal Challengers Banglore</strong></p>', NULL, 'WX24U0xmTH.jpg', 'Images/e0pkrkaksuwfefv40wjq', NULL, 'en', NULL, 'Enabled', 'International', '2021-03-23 04:13:33', '2021-04-06 07:52:59', 1481179303607728865, 1531815491526, 'N', 0),
(4, 'Delhi Capitals', 'IN', '', NULL, 'yqkMbr2bBt.jpg', 'Images/kquqtjlxivinhhygpm0l', NULL, 'en', NULL, 'Enabled', 'Domestic', '2021-03-24 00:52:24', '2021-03-24 05:13:59', 1531815491526, 1531815491526, 'N', 0),
(5, 'UP dabang', '', '', NULL, 'svfXjQhMGA.jpg', 'Images/wdpcdn6p9jqwmacjys6l', NULL, 'en', NULL, 'Enabled', 'Domestic', '2021-04-05 07:27:06', '2021-04-07 10:28:11', 1481179303607728865, 1481179303607728865, 'Y', 1481179303607728865),
(6, 'Rajasthan Royals', '', '<p>Rajasthan Royals</p>', NULL, 'qLOmLPL6rG.jpg', 'Images/unfnnzvzexaims44lkot', NULL, 'en', NULL, 'Enabled', 'International', '2021-04-07 10:10:57', '2021-04-07 10:24:40', 1481179303607728865, 1481179303607728865, 'N', 0),
(7, 'Punjab Kings', '', '<p>Punjab Kings</p>', NULL, 'LOKKH5vQzD.jpg', 'Images/koxo4o9lhoo1g1kxaxw8', NULL, 'en', NULL, 'Enabled', 'International', '2021-04-07 10:22:07', '2021-04-08 09:23:41', 1481179303607728865, 1481179303607728865, 'N', 0);

-- --------------------------------------------------------

--
-- Table structure for table `top_tranding`
--

CREATE TABLE `top_tranding` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `script_id` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ignore` tinyint(4) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `json_object` text CHARACTER SET utf8,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `top_tranding`
--

INSERT INTO `top_tranding` (`id`, `title`, `description`, `script_id`, `image`, `source`, `url`, `ignore`, `date`, `json_object`, `created_date`) VALUES
(1, 'Test from Siddharth', '<p>Test from Siddharth</p>', '1', NULL, 'Script Trend', NULL, 0, '2021-07-30 13:51:56', NULL, '2021-07-30 13:51:56'),
(2, 'Test from Siddharth Stage', '<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged</p>', '2', NULL, 'Script Trend', NULL, 0, '2021-07-30 15:46:27', NULL, '2021-07-30 15:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `id` int(11) NOT NULL,
  `tournament_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `country_code` varchar(5) DEFAULT NULL,
  `tournament_name` varchar(100) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8,
  `json_data` text CHARACTER SET utf8,
  `image_url` varchar(255) DEFAULT NULL,
  `cloud_image` varchar(255) DEFAULT NULL,
  `image16_9` varchar(255) DEFAULT NULL,
  `cloud16_9` varchar(255) DEFAULT NULL,
  `language_code` varchar(2) DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8,
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `type` enum('Domestic','International') DEFAULT 'Domestic',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year` year(4) DEFAULT '2021',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `deleted_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `tournament_id`, `name`, `country_code`, `tournament_name`, `description`, `json_data`, `image_url`, `cloud_image`, `image16_9`, `cloud16_9`, `language_code`, `meta_description`, `status`, `type`, `created_at`, `updated_at`, `year`, `created_by`, `updated_by`, `is_deleted`, `deleted_by`) VALUES
(1, 116208, 'ireland', 'IN', 'Ireland tour of England ', '<p>Bihar T20 tournament</p>', NULL, 'Y7KCpk6AF4.jpg', 'Images/nl6cpwfxokgx5cb0gu3g', 'https://editorji-live-bucket.s3.amazonaws.com/HjRvkea7zB.jpg', '', 'en', NULL, 'Enabled', 'Domestic', '2021-03-22 10:21:59', '2021-04-07 15:36:31', 2020, 1481179303607728865, 1481179303607728865, 'N', 0),
(2, 118273, 'Indian Premier League 2021', 'IN', '', '<p><strong>Indian Premier League 2021</strong></p>\r\n<p> </p>\r\n<p><strong>IPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPLIPL  </strong>IPLIPLIPLIPLIPLIPLIPL  IPLIPLIPLIPLIPLIPLIPL</p>', NULL, 'd2t6C09Tof.jpg', 'Images/xpqksebsqcff7vysk7rm', 'https://editorji-live-bucket.s3.amazonaws.com/tA9ED4psas.jpg', '', 'en', NULL, 'Enabled', 'International', '2021-03-23 06:32:22', '2021-04-07 04:03:58', 2021, 1481179303607728865, 1481179303607728865, 'N', 0),
(3, 115745, 'icc women cup', '', 'ICC Women\'s World Cup ', '<p>icc women cup icc women cup</p>', NULL, 'XR6nPmVwXx.jpg', 'Images/m2dvggzq2e181c4perer', NULL, NULL, NULL, NULL, 'Enabled', 'International', '2021-04-05 12:55:44', '2021-04-05 12:55:48', 2021, 1481179303607728865, 1481179303607728865, 'N', 0),
(4, 116925, 'india and australia', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Enabled', 'International', '2021-04-06 13:24:10', '2021-04-06 15:45:39', 2020, 1481179303607728865, 1481179303607728865, 'N', 0),
(5, 118273, 'Indian Premier League ', '', '', '', NULL, NULL, NULL, NULL, NULL, 'en', NULL, 'Enabled', 'International', '2021-04-06 13:26:55', '2021-04-07 15:23:57', 2021, 1481179303607728865, 1481179303607728865, 'N', 1481179303607728865),
(6, 118520, 'sri lanka tour of west bangal', 'EN', 'ECS Bologna T10 ', '<p>sri lanka tour of west bangalsri lanka tour of west bangal</p>', NULL, 'ZKze4cIukI.jpg', 'Images/hdqtghbfyhkqw3emfavc', 'https://editorji-live-bucket.s3.amazonaws.com/Lgv3PZS0hh.jpg', '', NULL, NULL, 'Enabled', 'Domestic', '2021-04-06 14:03:27', '2021-04-07 03:52:52', 2021, 1481179303607728865, 1481179303607728865, 'Y', 1481179303607728865);

-- --------------------------------------------------------

--
-- Table structure for table `transitvideo`
--

CREATE TABLE `transitvideo` (
  `id` int(11) NOT NULL,
  `video_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `video_path` text,
  `category_id` text,
  `language_code` enum('en','hi','ta','default','comment-en','comment-hi') DEFAULT NULL,
  `status` enum('Y','N') DEFAULT 'Y',
  `video_updatednew_by` text,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tv_app_category`
--

CREATE TABLE `tv_app_category` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `category_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `image_url` text,
  `selected_image_url` text,
  `sequence` int(4) DEFAULT '0',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tv_app_category_logs`
--

CREATE TABLE `tv_app_category_logs` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `tv_app_widget_id` int(11) DEFAULT NULL,
  `tv_app_category_widget_id` int(11) DEFAULT NULL,
  `tv_app_category_widget_news_id` int(11) DEFAULT NULL,
  `action` enum('Created','Updated','Deleted') DEFAULT 'Updated',
  `sequence` int(11) DEFAULT '0',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tv_app_category_widgets`
--

CREATE TABLE `tv_app_category_widgets` (
  `id` bigint(20) NOT NULL,
  `tv_app_widget_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  `subcategory_id` bigint(20) DEFAULT NULL,
  `sport_widget_id` bigint(20) DEFAULT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `blog_title` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `lang` tinytext,
  `blog_image` varchar(200) DEFAULT NULL,
  `cloud_image` varchar(200) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tv_app_category_widget_news`
--

CREATE TABLE `tv_app_category_widget_news` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `tv_app_widget_id` int(11) DEFAULT NULL,
  `tv_app_category_widget_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `news` bigint(20) DEFAULT NULL,
  `news_content` text CHARACTER SET utf8,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tv_app_trending_video`
--

CREATE TABLE `tv_app_trending_video` (
  `id` int(11) NOT NULL,
  `trending_topic` text CHARACTER SET utf8,
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `url` text CHARACTER SET utf8,
  `lang_code` varchar(4) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tv_app_widgets`
--

CREATE TABLE `tv_app_widgets` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'default',
  `ui_type` enum('playlist','carousel','more_news','live_sport','inline_grid','inline_list','partners','sport_widget','covid_widget','tv_app_view','live_blog','carousel-video') DEFAULT NULL,
  `description` text,
  `image_url` varchar(250) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_name_display` varchar(100) DEFAULT NULL,
  `user_login_email` varchar(64) DEFAULT NULL,
  `user_mobile` varchar(15) DEFAULT NULL,
  `user_age` varchar(255) DEFAULT NULL,
  `social_data` text,
  `user_device_token` text,
  `device_type` enum('android','ios','airtel-android','airtel-ios','web') DEFAULT 'android',
  `user_gender` enum('M','F','O') DEFAULT 'O',
  `user_notification_status` enum('Y','N') DEFAULT 'Y',
  `user_password_hash` varchar(64) DEFAULT NULL,
  `user_password_reset_token` varchar(64) DEFAULT NULL,
  `user_password_otp` varchar(5) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_avatar_url` varchar(1000) DEFAULT NULL,
  `user_status` enum('enabled','disabled') DEFAULT 'disabled',
  `social_type` enum('facebook','twitter','google','register') DEFAULT 'register',
  `social_id` varchar(255) DEFAULT 'register',
  `email_token` text,
  `user_type` enum('user','opinion') DEFAULT 'user',
  `user_preference_language_code` varchar(2) DEFAULT 'en',
  `user_prefered_location` text,
  `user_preference_newscast_time` time DEFAULT NULL,
  `user_preference_duration_type` int(11) DEFAULT '10',
  `user_preference_national_percentage` int(11) DEFAULT NULL,
  `user_preference_international_percentage` int(11) DEFAULT NULL,
  `user_preference_local_percentage` int(11) DEFAULT NULL,
  `user_masala_preference` enum('Yes','No') DEFAULT 'No',
  `user_anchor_preference` enum('Yes','No') DEFAULT 'No',
  `user_preference_blog_percentage` int(11) DEFAULT NULL,
  `user_preference_news_percentage` int(11) DEFAULT NULL,
  `sync_data` tinyint(1) DEFAULT '0',
  `user_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_name_display`, `user_login_email`, `user_mobile`, `user_age`, `social_data`, `user_device_token`, `device_type`, `user_gender`, `user_notification_status`, `user_password_hash`, `user_password_reset_token`, `user_password_otp`, `user_password`, `user_avatar_url`, `user_status`, `social_type`, `social_id`, `email_token`, `user_type`, `user_preference_language_code`, `user_prefered_location`, `user_preference_newscast_time`, `user_preference_duration_type`, `user_preference_national_percentage`, `user_preference_international_percentage`, `user_preference_local_percentage`, `user_masala_preference`, `user_anchor_preference`, `user_preference_blog_percentage`, `user_preference_news_percentage`, `sync_data`, `user_created_date`, `user_updated_date`, `user_updated_by`) VALUES
(131232321, 'Abhinav Saxena', 'Abhinav Saxena', 'abhidcoosdsd121@gmail.com', NULL, NULL, '{\"id\":\"10211901100650100\",\"name\":\"Abhinav Saxena\",\"firstName\":\"Abhinav\",\"lastName\":\"Saxena\",\"email\":\"abhidcool121@gmail.com\",\"profilePicURL\":\"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10211900200650100&height=50&width=50&ext=1538120592&hash=AeSnmOD_uXh6Uf6r\"}', NULL, 'android', 'O', 'Y', NULL, NULL, NULL, NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10211900200650100&height=50&width=50&ext=1538120592&hash=AeSnmOD_uXh6Uf6r', 'enabled', 'facebook', '102119111200650100', 'cfcd208495d565ef66e7dff9f98764da', 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486709236796, 'test11', NULL, 'ss@gmail.com', NULL, '22', NULL, NULL, 'android', 'M', 'Y', NULL, NULL, NULL, '1111', 'https://cue-data-stream.s3.amazonaws.com/Screenshot_7_47XCU3.png', 'enabled', 'register', '1234', NULL, 'user', 'en', NULL, NULL, 10, 24, 24, 100, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486710799414, 'test11', NULL, 'aa@gmail.com', NULL, '12', NULL, NULL, 'android', 'M', 'Y', NULL, NULL, NULL, NULL, 'null', 'enabled', 'register', '12345', NULL, 'user', 'en', NULL, NULL, 10, 0, 0, 0, 'Yes', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486721799785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486722415593, 'test', 'test', 'tesat2112@gmail.com', NULL, '20', NULL, NULL, 'android', '', 'N', '$2y$13$6RS9sK7ZQM1O7DJPFU9bk.rfLuGcP2acsY3C/3EihsM/zgho0KmCy', 'e6d32825e20fd3fde54e88d273111ca3', NULL, '12345', 'https://cue-data-stream.s3.amazonaws.com/5b84dd2e53c3a_download1.jpeg', 'disabled', 'register', 'register', 'e6d32825e20fd3fde54e88d273111ca3', 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, NULL, 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486722875595, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486786573437, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, 24, 0, 24, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486818785063, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, 100, 100, 100, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1486918420864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, 77, 56, 22, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487067772532, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487073244221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487155308877, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, 100, 0, 24, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487161156041, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, 0, 0, 0, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487237106396, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487438651777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487731117744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1487743325561, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', 0, 0, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1488004498319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1488191926967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', 0, 43, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1495717066009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', 0, 100, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1497442867944, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1501220447855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1501669635410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1503130011076, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1503130290711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1503992040326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1505302297102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1505555326902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1507193028606, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'hi', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1507706001690, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1507729563580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1508159312090, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1511253536427, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1511260026601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1511767277941, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1513662909149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1513767620325, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1513767975477, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1513929386353, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1514352879408, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1514450506573, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515656228601, 'Abhishek Agrawal', 'Abhishek Agrawal', 'chkhjkj@dbjg.com', NULL, '12', '', NULL, 'android', 'F', 'Y', '$2y$13$ZMVhTnpxXgywNrYTSzUwGub35GX7u3Qm3A5CNmAlrwEAR8.Q2f2dq', NULL, NULL, 'chhjh', 'https://cue-data-stream.s3.amazonaws.com/5b9758df1c8a5_image.jpg', 'enabled', 'google', '116252993663584317563', '91d7dd01718a0d87773168c4b2ea6142', 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515657676605, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515658977631, 'rohit kumar', 'rohit kumar', 'testdam35@gmail.com', NULL, '', '{\"id\":\"10211136388635277\",\"name\":\"Abhinav Saxena\",\"firstName\":\"Abhinav\",\"lastName\":\"Saxena\",\"email\":\"abhidcool121@gmail.com\",\"profilePicURL\":\"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10211136388635277&height=50&width=50&ext=1536417631&hash=AeTK1AscN1zq4Wov\"}', NULL, 'android', '', 'N', '$2y$13$uRBSdHajGioZ1AP0xceoZOoIJZxdNk/nfdjEDeuyhXXy8KeNUVNka', '05751f20da79585eaeada565d7ccba6c', NULL, NULL, '', 'enabled', 'facebook', '112850300630014575945', '05751f20da79585eaeada565d7ccba6c', 'user', 'en', NULL, NULL, 1, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515666628649, 'Nitin Rathi', 'Nitin Rathi', 'nitin.dec0612@gmail.com', NULL, '28', '', NULL, 'android', 'M', 'Y', '$2y$13$ZxYBl5byyvpXzD3xEMcOzeK0m1eGenASTtY.e8PNddycLS7bhBbVC', '9d8ad7180f8a64a6c31d7693cecffb1f', NULL, '123456', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1836801389773129&height=200&width=200&ext=1590092585&hash=AeQCada8sWOjrr49', 'enabled', 'facebook', '1836801389773129', '9d8ad7180f8a64a6c31d7693cecffb1f', 'user', 'en', NULL, NULL, 10, 0, 0, 0, '', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515678791081, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515679917702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515681643751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515682792545, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL),
(1515732664406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'android', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, 'enabled', 'register', 'register', NULL, 'user', 'en', NULL, NULL, 10, NULL, NULL, NULL, 'No', 'No', NULL, NULL, 1, '0000-00-00 00:00:00', '2020-08-30 16:09:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_caption`
--

CREATE TABLE `user_activity_caption` (
  `id` int(11) NOT NULL,
  `user_activity_id` int(11) DEFAULT NULL,
  `caption` text CHARACTER SET utf8,
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_log`
--

CREATE TABLE `user_activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `story` text,
  `category` varchar(255) DEFAULT NULL,
  `headline` text,
  `source` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  `script_txt` text,
  `video_editor` varchar(255) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `is_script` enum('Y','N') DEFAULT 'N',
  `is_editor` enum('Y','N') DEFAULT 'N',
  `is_vo` enum('Y','N') DEFAULT 'N',
  `is_approved` enum('Y','N') DEFAULT 'N',
  `is_video_editor` enum('Y','N') DEFAULT 'N',
  `story_time` text,
  `story_time_status` enum('pending','complete') DEFAULT 'pending',
  `is_spell_check` enum('Y','N') DEFAULT 'N',
  `editor` varchar(255) DEFAULT NULL,
  `vo` varchar(255) DEFAULT NULL,
  `approved` varchar(255) DEFAULT NULL,
  `script_time` varchar(50) DEFAULT NULL,
  `editor_time` varchar(50) DEFAULT NULL,
  `vo_time` varchar(50) DEFAULT NULL,
  `approved_time` varchar(50) DEFAULT NULL,
  `video_editor_time` varchar(50) DEFAULT NULL,
  `spell_check` datetime DEFAULT NULL,
  `published_date` datetime DEFAULT NULL,
  `time_created` datetime DEFAULT NULL,
  `kill_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(100) DEFAULT NULL,
  `og_site_name` varchar(50) DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `social_share_url` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_type` varchar(50) DEFAULT NULL,
  `seo_headline` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `summary` text,
  `meta_keywords` text,
  `parent_category` bigint(20) DEFAULT NULL,
  `is_deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `deleted_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_activity_log`
--

INSERT INTO `user_activity_log` (`id`, `user_id`, `story`, `category`, `headline`, `source`, `author`, `script`, `script_txt`, `video_editor`, `language`, `is_script`, `is_editor`, `is_vo`, `is_approved`, `is_video_editor`, `story_time`, `story_time_status`, `is_spell_check`, `editor`, `vo`, `approved`, `script_time`, `editor_time`, `vo_time`, `approved_time`, `video_editor_time`, `spell_check`, `published_date`, `time_created`, `kill_date`, `created_date`, `updated_date`, `updated_by`, `og_site_name`, `og_title`, `social_share_url`, `og_description`, `og_type`, `seo_headline`, `meta_description`, `summary`, `meta_keywords`, `parent_category`, `is_deleted`, `deleted_by`) VALUES
(0, 1624335361884, '<p>test</p>', 'Pollution,Elections,National', 'Test from Siddharth', 'Editorji News Desk', 'Editorji News Desk', 'siddharth', '<p>test</p>', NULL, 'en', 'Y', 'N', 'N', 'N', 'N', NULL, 'pending', 'N', NULL, NULL, NULL, '2021-08-19 17:13:01', NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-19 17:13:01', NULL, NULL, '2021-08-19 11:43:01', '1624335361884', 'www.editorji.com', 'Hello test', NULL, '<p>Hello test</p>', 'Video', 'asdasd', 'Hello', '<p>Test</p>', 'Test', 1486711720088, 'N', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_log_category`
--

CREATE TABLE `user_activity_log_category` (
  `user_activity_log_id` bigint(20) UNSIGNED NOT NULL,
  `user_activity_log_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_activity_log_created_date` datetime NOT NULL,
  `user_activity_log_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_activity_log_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_category`
--

CREATE TABLE `user_category` (
  `user_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_category_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_category_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_category_priority` int(11) DEFAULT NULL,
  `user_category_slider` int(11) DEFAULT NULL,
  `user_category_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_category_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_category_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_city`
--

CREATE TABLE `user_city` (
  `user_city_id` bigint(20) UNSIGNED NOT NULL,
  `user_city_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_city_city_id` bigint(20) UNSIGNED NOT NULL,
  `user_city_created_date` datetime NOT NULL,
  `user_city_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_city_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_clickstream`
--

CREATE TABLE `user_clickstream` (
  `user_clickstream_id` bigint(20) UNSIGNED NOT NULL,
  `user_clickstream_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_clickstream_video_version_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_clickstream_text` text,
  `user_clickstream_type` enum('search','like','share','favorite','review','rating','view','playback-percent','category','tag') NOT NULL,
  `user_clickstream_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_device`
--

CREATE TABLE `user_device` (
  `user_device_id` bigint(20) UNSIGNED NOT NULL,
  `user_device_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_device_type` enum('android','ios','web','airtel-android','airtel-ios') DEFAULT 'android',
  `user_device_code` varchar(255) DEFAULT NULL,
  `clevertap_id` varchar(255) DEFAULT NULL,
  `appsflyer_id` varchar(255) DEFAULT NULL,
  `android_gaid_id` varchar(255) DEFAULT NULL,
  `user_device_token` varchar(255) DEFAULT NULL,
  `user_preference_language_code` varchar(255) DEFAULT NULL,
  `user_device_detail` text,
  `user_device_last_accessed` datetime NOT NULL,
  `user_device_token_status` enum('enabled','disabled') NOT NULL,
  `user_device_created_date` datetime NOT NULL,
  `user_device_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_device_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_device`
--

INSERT INTO `user_device` (`user_device_id`, `user_device_user_id`, `user_device_type`, `user_device_code`, `clevertap_id`, `appsflyer_id`, `android_gaid_id`, `user_device_token`, `user_preference_language_code`, `user_device_detail`, `user_device_last_accessed`, `user_device_token_status`, `user_device_created_date`, `user_device_updated_date`, `user_device_updated_by`) VALUES
(1486709236799, 1486709236796, 'android', '5093907354a517', NULL, NULL, NULL, 'app', NULL, NULL, '2017-02-10 12:17:16', 'enabled', '2017-02-10 12:17:16', '2017-02-10 06:47:16', NULL),
(1486710799434, 1486710799414, 'android', '2f5cf57c293aa1d8', NULL, NULL, NULL, 'app', NULL, NULL, '2017-02-10 12:43:19', 'enabled', '2017-02-10 12:43:19', '2017-02-10 07:13:19', NULL),
(1486721799788, 1486721799785, 'android', '13e4b1d21bcc4adf', NULL, NULL, NULL, 'app', NULL, NULL, '2017-02-10 15:46:39', 'enabled', '2017-02-10 15:46:39', '2017-02-10 10:16:39', NULL),
(1486722415596, 1486722415593, 'android', 'android_Test', NULL, NULL, NULL, 'deviceToken', NULL, NULL, '2017-02-10 15:56:55', 'enabled', '2017-02-10 15:56:55', '2017-02-10 10:26:55', NULL),
(1486722875597, 1486722875595, 'android', 'eedd24664357f302', NULL, NULL, NULL, 'app', NULL, NULL, '2017-02-10 16:04:35', 'enabled', '2017-02-10 16:04:35', '2017-02-10 10:34:35', NULL),
(1486786573460, 1486786573437, 'android', '33906e5d9398b85', NULL, NULL, NULL, 'app', NULL, NULL, '2017-02-11 09:46:13', 'enabled', '2017-02-11 09:46:13', '2017-02-11 04:16:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `activity` varchar(255) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL DEFAULT '0',
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_log_updateby` bigint(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_log`
--

INSERT INTO `user_log` (`id`, `activity`, `time`, `createdOn`, `updatedOn`, `user_log_updateby`) VALUES
(26, 'login', '2021-07-29 12:53:17', '2021-07-29 12:53:17', '2021-07-29 07:23:17', 1624335361883),
(27, 'logout', '2021-07-29 12:59:11', '2021-07-29 12:59:11', '2021-07-29 07:29:11', 1624335361883),
(28, 'login', '2021-07-29 13:03:21', '2021-07-29 13:03:21', '2021-07-29 07:33:21', 1624335361884),
(29, 'logout', '2021-07-29 13:10:41', '2021-07-29 13:10:41', '2021-07-29 07:40:41', 1624335361884),
(30, 'login', '2021-07-29 13:13:07', '2021-07-29 13:13:07', '2021-07-29 07:43:07', 1624335361883),
(31, 'logout', '2021-07-29 13:35:53', '2021-07-29 13:35:53', '2021-07-29 08:05:53', 1624335361883),
(32, 'login', '2021-07-29 13:36:10', '2021-07-29 13:36:10', '2021-07-29 08:06:10', 1624335361883),
(33, 'logout', '2021-07-29 13:37:10', '2021-07-29 13:37:10', '2021-07-29 08:07:10', 1624335361883),
(34, 'login', '2021-07-29 13:37:30', '2021-07-29 13:37:30', '2021-07-29 08:07:30', 1624335361883),
(35, 'logout', '2021-07-29 13:38:17', '2021-07-29 13:38:17', '2021-07-29 08:08:17', 1624335361883),
(36, 'login', '2021-07-29 13:38:29', '2021-07-29 13:38:29', '2021-07-29 08:08:29', 1624335361883),
(37, 'logout', '2021-07-29 13:38:36', '2021-07-29 13:38:36', '2021-07-29 08:08:36', 1624335361883),
(38, 'login', '2021-07-29 13:38:56', '2021-07-29 13:38:56', '2021-07-29 08:08:56', 1624335361883),
(39, 'logout', '2021-07-29 14:05:45', '2021-07-29 14:05:45', '2021-07-29 08:35:45', 1624335361883),
(40, 'login', '2021-07-29 14:05:55', '2021-07-29 14:05:55', '2021-07-29 08:35:55', 1624335361883),
(41, 'logout', '2021-07-29 14:06:42', '2021-07-29 14:06:42', '2021-07-29 08:36:42', 1624335361883),
(42, 'login', '2021-07-29 14:06:56', '2021-07-29 14:06:56', '2021-07-29 08:36:56', 1624335361883),
(43, 'logout', '2021-07-29 14:08:53', '2021-07-29 14:08:53', '2021-07-29 08:38:53', 1624335361883),
(44, 'login', '2021-07-29 14:09:08', '2021-07-29 14:09:08', '2021-07-29 08:39:08', 1624335361883),
(45, 'logout', '2021-07-29 14:10:04', '2021-07-29 14:10:04', '2021-07-29 08:40:04', 1624335361883),
(46, 'login', '2021-07-29 14:10:14', '2021-07-29 14:10:14', '2021-07-29 08:40:14', 1624335361883),
(47, 'logout', '2021-07-29 14:11:07', '2021-07-29 14:11:07', '2021-07-29 08:41:07', 1624335361883),
(48, 'login', '2021-07-29 14:11:25', '2021-07-29 14:11:25', '2021-07-29 08:41:25', 1624335361883),
(49, 'logout', '2021-07-29 14:12:33', '2021-07-29 14:12:33', '2021-07-29 08:42:33', 1624335361883),
(50, 'login', '2021-07-29 14:12:51', '2021-07-29 14:12:51', '2021-07-29 08:42:51', 1624335361883),
(51, 'logout', '2021-07-29 14:14:24', '2021-07-29 14:14:24', '2021-07-29 08:44:24', 1624335361883),
(52, 'login', '2021-07-29 14:14:36', '2021-07-29 14:14:36', '2021-07-29 08:44:36', 1624335361883),
(53, 'logout', '2021-07-29 14:33:39', '2021-07-29 14:33:39', '2021-07-29 09:03:39', 1624335361883),
(54, 'login', '2021-07-29 15:20:51', '2021-07-29 15:20:51', '2021-07-29 09:50:51', 1624335361883),
(0, 'login', '2021-08-10 14:54:09', '2021-08-10 14:54:09', '2021-08-10 09:24:09', 1624335361883),
(0, 'login', '2021-08-12 18:18:24', '2021-08-12 18:18:24', '2021-08-12 12:48:24', 1624335361884),
(0, 'login', '2021-08-12 18:22:58', '2021-08-12 18:22:58', '2021-08-12 12:52:58', 1624335361884),
(0, 'logout', '2021-08-12 18:24:25', '2021-08-12 18:24:25', '2021-08-12 12:54:25', 1624335361884),
(0, 'logout', '2021-08-13 10:45:26', '2021-08-13 10:45:26', '2021-08-13 05:15:26', 1624335361884),
(0, 'login', '2021-08-13 10:45:44', '2021-08-13 10:45:44', '2021-08-13 05:15:44', 1624335361884),
(0, 'logout', '2021-08-16 11:19:21', '2021-08-16 11:19:21', '2021-08-16 05:49:21', 1624335361884),
(0, 'login', '2021-08-16 11:20:28', '2021-08-16 11:20:28', '2021-08-16 05:50:28', 1624335361884),
(0, 'logout', '2021-08-17 11:43:11', '2021-08-17 11:43:11', '2021-08-17 06:13:11', 1624335361884),
(0, 'login', '2021-08-17 11:43:37', '2021-08-17 11:43:37', '2021-08-17 06:13:37', 1624335361884),
(0, 'logout', '2021-08-17 16:30:28', '2021-08-17 16:30:28', '2021-08-17 11:00:28', 1624335361884),
(0, 'login', '2021-08-17 16:30:54', '2021-08-17 16:30:54', '2021-08-17 11:00:54', 1624335361884),
(0, 'logout', '2021-08-17 18:26:01', '2021-08-17 18:26:01', '2021-08-17 12:56:01', 1624335361884),
(0, 'login', '2021-08-17 18:38:06', '2021-08-17 18:38:06', '2021-08-17 13:08:06', 1624335361884),
(0, 'logout', '2021-08-17 18:56:22', '2021-08-17 18:56:22', '2021-08-17 13:26:22', 1624335361884),
(0, 'login', '2021-08-17 18:56:35', '2021-08-17 18:56:35', '2021-08-17 13:26:35', 1624335361884);

-- --------------------------------------------------------

--
-- Table structure for table `user_log_activity`
--

CREATE TABLE `user_log_activity` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_activity_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_newscast`
--

CREATE TABLE `user_newscast` (
  `user_newscast_id` bigint(20) UNSIGNED NOT NULL,
  `user_newscast_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_newscast_time` varchar(255) NOT NULL,
  `user_newscast_status` enum('enabled','disabled') NOT NULL,
  `user_newscast_created_date` datetime NOT NULL,
  `user_newscast_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_newscast_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_otp`
--

CREATE TABLE `user_otp` (
  `id` int(11) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_playlist`
--

CREATE TABLE `user_playlist` (
  `user_playlist_id` bigint(20) UNSIGNED NOT NULL,
  `user_playlist_user_id` bigint(20) UNSIGNED NOT NULL,
  `user_playlist_name` varchar(50) NOT NULL,
  `user_playlist_description` text,
  `user_playlist_created_date` datetime NOT NULL,
  `user_playlist_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_playlist_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_playlist_videos`
--

CREATE TABLE `user_playlist_videos` (
  `user_playlist_videos_id` bigint(20) UNSIGNED NOT NULL,
  `user_playlist_id` bigint(20) UNSIGNED NOT NULL,
  `user_playlist_video_version_id` bigint(20) UNSIGNED NOT NULL,
  `user_playlist_sequence` int(11) DEFAULT NULL,
  `user_playlist_status` enum('enabled','deleted') NOT NULL,
  `user_playlist_created_date` datetime NOT NULL,
  `user_playlist_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_playlist_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_preferred_location`
--

CREATE TABLE `user_preferred_location` (
  `user_loc_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(50) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_social_data`
--

CREATE TABLE `user_social_data` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `social_id` varchar(150) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `social_data` text,
  `user_email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `avatar_url` varchar(350) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_social_login`
--

CREATE TABLE `user_social_login` (
  `user_login_id` bigint(20) UNSIGNED NOT NULL,
  `user_login_type` enum('facebook','google') NOT NULL,
  `user_login_user_id` int(11) UNSIGNED NOT NULL,
  `user_login_name` varchar(100) NOT NULL,
  `user_login_type_id` varchar(64) NOT NULL,
  `social_data` text NOT NULL,
  `user_login_token` varchar(255) DEFAULT NULL,
  `user_login_email` varchar(64) DEFAULT NULL,
  `user_login_avatar_url` varchar(1000) DEFAULT NULL,
  `user_login_profile_url` varchar(1000) DEFAULT NULL,
  `user_login_status` enum('enabled','disabled') NOT NULL,
  `user_login_last_accessed` datetime NOT NULL,
  `user_login_created_date` datetime NOT NULL,
  `user_login_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_login_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_unwanted_video`
--

CREATE TABLE `user_unwanted_video` (
  `user_id` bigint(20) DEFAULT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_video`
--

CREATE TABLE `user_video` (
  `user_id` bigint(20) DEFAULT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_video`
--

INSERT INTO `user_video` (`user_id`, `video_id`, `created_on`, `updated_on`) VALUES
(1486709236796, 1486965677062, '0000-00-00 00:00:00', '2017-02-14 15:39:13'),
(1486709236796, 1481179303088263059, '2017-02-14 18:11:39', '2017-02-14 18:11:39'),
(1486710799414, 1481179303088263059, '2017-05-23 13:08:53', '2017-05-23 13:08:53'),
(1486710799414, 1486965677062, '2018-03-09 10:54:24', '2018-03-09 10:54:24'),
(1486710799414, 1486965677062, '2018-08-13 14:09:41', '2018-08-13 08:39:41');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `video_name` varchar(255) NOT NULL,
  `video_slug` text NOT NULL,
  `video_script_id` bigint(20) DEFAULT NULL,
  `video_script` text NOT NULL,
  `category_banner` text NOT NULL,
  `video_description` text,
  `video_name_comprehend_json` text,
  `video_description_comprehend_json` text,
  `automatic_video_id` int(11) DEFAULT NULL,
  `video_name_time` text,
  `video_description_time` text,
  `category_video_name` text,
  `category_id` bigint(20) DEFAULT NULL COMMENT 'if id present then this is catgory video',
  `video_language_code` varchar(2) NOT NULL,
  `video_city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `masal_news_status` enum('masala','serious') DEFAULT 'serious',
  `video_state_id` longtext NOT NULL,
  `video_location` enum('national','international','local') NOT NULL,
  `video_type` enum('news','debate','opinion','blog','ad-tech') NOT NULL,
  `video_duration_type` enum('short-version','long-version') NOT NULL,
  `video_default_duration_type` enum('short-version','long-version') NOT NULL,
  `video_tags` text,
  `video_date` datetime NOT NULL,
  `video_duration` varchar(50) DEFAULT NULL,
  `video_disable_date_time` datetime DEFAULT NULL,
  `video_search_status` enum('pending','update-pending','disabled-pending','wip','complete','error') NOT NULL,
  `breaking_news` enum('0','1') DEFAULT '0',
  `catelog_status` enum('0','1','-1') DEFAULT '0',
  `video_anchor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `elastic_status` enum('0','1','2') DEFAULT '0',
  `trending_index` bigint(20) UNSIGNED DEFAULT NULL,
  `video_editing_url` text,
  `video_languages` text,
  `video_created_date` datetime NOT NULL,
  `video_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_updatednew_by` text NOT NULL,
  `video_created_by` text NOT NULL,
  `video_read_status` enum('pending','complete') NOT NULL DEFAULT 'pending',
  `99_news` bit(1) DEFAULT b'0',
  `partner_type` varchar(255) DEFAULT 'editorji',
  `massala_range` int(11) DEFAULT '0',
  `is_video` enum('0','1') DEFAULT '1' COMMENT 'if is video=1 then 0',
  `is_deleted` enum('N','Y') DEFAULT 'N',
  `video_deleted_by` varchar(255) DEFAULT 'N',
  `is_dynamic_video` enum('0','1') DEFAULT '0',
  `is_partner` enum('0','1') DEFAULT '0',
  `editorji_special` enum('0','1') DEFAULT '0',
  `is_compehrend_status` enum('0','1') DEFAULT '0',
  `is_intro_outro` enum('0','1') DEFAULT '1',
  `is_transition` enum('0','1') DEFAULT '1',
  `is_opinion` bit(1) DEFAULT b'0',
  `image1_1` varchar(255) DEFAULT NULL,
  `image16_9` varchar(255) DEFAULT NULL,
  `seo_headline` varchar(255) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `sub_brand` varchar(50) DEFAULT NULL,
  `buy_now_url` text,
  `ad_tech_playlist_id` int(11) DEFAULT NULL,
  `show_on_desktop` enum('0','1') DEFAULT '1',
  `cloud1_1` varchar(255) DEFAULT NULL,
  `cloud16_9` varchar(255) DEFAULT NULL,
  `video_resolution` varchar(5) DEFAULT '1_1',
  `og_site_name` varchar(50) DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_automatic`
--

CREATE TABLE `video_automatic` (
  `id` int(11) NOT NULL,
  `video_title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `video_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_vo_text` varchar(255) DEFAULT NULL,
  `json` longtext,
  `video_id` bigint(20) DEFAULT NULL,
  `status` enum('0','1','2','3') DEFAULT '0',
  `template` varchar(255) DEFAULT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `language` varchar(50) CHARACTER SET utf8 DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_automatic_media`
--

CREATE TABLE `video_automatic_media` (
  `id` int(11) NOT NULL,
  `template_name` varchar(255) NOT NULL DEFAULT '0',
  `media_type` enum('video','mp3','image') NOT NULL DEFAULT 'image',
  `media_url` text NOT NULL,
  `uploaded_by` bigint(20) NOT NULL,
  `createdon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_category`
--

CREATE TABLE `video_category` (
  `video_category_video_id` bigint(20) UNSIGNED NOT NULL,
  `script_id` bigint(20) UNSIGNED DEFAULT NULL,
  `video_category_category_id` bigint(20) UNSIGNED NOT NULL,
  `video_category_created_date` datetime NOT NULL,
  `video_category_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_category_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_category_banner`
--

CREATE TABLE `video_category_banner` (
  `id` int(11) NOT NULL,
  `banner_url` text,
  `banner` varchar(255) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `deleted_by` bigint(20) DEFAULT NULL,
  `compress_banner_url` text,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_comments`
--

CREATE TABLE `video_comments` (
  `id` int(11) NOT NULL,
  `comment_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `original_path` varchar(255) DEFAULT NULL,
  `name_slug` varchar(255) DEFAULT NULL,
  `thumb` text,
  `language_code` enum('en','ta','hi') DEFAULT 'en',
  `m3u8_name` text,
  `duration` text,
  `playlist_id` bigint(20) DEFAULT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(30) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `spot` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `video_rendition_json` text,
  `review_status` enum('under_process','reject','accept') DEFAULT 'under_process',
  `m3u8_response_json` text,
  `video_rendition_status` enum('pending','wip','complete','error') DEFAULT 'pending',
  `m3u8_ts_rendition_status` enum('pending','wip','complete','error') DEFAULT 'pending',
  `m3u8_status` enum('0','1') DEFAULT '1',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_json`
--

CREATE TABLE `video_json` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `name_comprehend_json` text,
  `description_comprehend_json` text,
  `rendition_raw_json` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_link`
--

CREATE TABLE `video_link` (
  `id` int(11) NOT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `video_link` text,
  `createdOn` date DEFAULT NULL,
  `updatedOn` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_opinion`
--

CREATE TABLE `video_opinion` (
  `id` int(11) NOT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `anchor_id` varchar(255) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_path`
--

CREATE TABLE `video_path` (
  `id` int(11) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `tiny_url` text,
  `playlist_id` bigint(20) DEFAULT NULL,
  `video_ids` mediumtext,
  `user_id` bigint(20) DEFAULT NULL,
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_json` longtext,
  `is_share` enum('YES','NO') DEFAULT NULL,
  `server_name` varchar(50) DEFAULT NULL,
  `time_taken` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_rendition`
--

CREATE TABLE `video_rendition` (
  `video_rendition_id` bigint(20) UNSIGNED NOT NULL,
  `video_version_id` bigint(20) UNSIGNED NOT NULL,
  `video_rendition_version` enum('original','rendition') NOT NULL,
  `video_ts_name` varchar(255) NOT NULL,
  `video_ts_description` text NOT NULL,
  `m3u8_new_response_json` text NOT NULL,
  `video_rendition_img_type` bit(1) NOT NULL DEFAULT b'0',
  `video_rendition_type` enum('image','video') NOT NULL,
  `video_rendition_height` int(11) UNSIGNED DEFAULT NULL,
  `video_rendition_width` int(11) UNSIGNED DEFAULT NULL,
  `video_rendition_bitrate` int(11) UNSIGNED DEFAULT NULL,
  `video_rendition_framerate` decimal(10,2) DEFAULT NULL,
  `video_rendition_duration` bigint(20) DEFAULT NULL,
  `video_rendition_encoding` varchar(50) DEFAULT NULL,
  `video_rendition_mimetype` varchar(100) DEFAULT NULL,
  `video_rendition_size` varchar(10) DEFAULT NULL,
  `video_rendition_bytes` bigint(20) DEFAULT NULL,
  `video_rendition_format` varchar(100) DEFAULT NULL,
  `video_rendition_path` varchar(255) DEFAULT NULL,
  `video_rendition_path_lessbiterate` varchar(255) DEFAULT NULL,
  `video_rendition_name` varchar(255) DEFAULT NULL,
  `video_rendition_name_less_biterate` varchar(255) DEFAULT NULL,
  `video_rendition_thumbnail` varchar(255) DEFAULT NULL,
  `share_image_thumb` varchar(255) DEFAULT NULL,
  `video_rendition_thumbnail_size` text,
  `image_json` longtext,
  `image_json_status` enum('0','1') DEFAULT '0',
  `video_rendition_raw_json` text,
  `image_size_small` text,
  `m3u8_ts_status_new` text,
  `job_status_new` text,
  `video_rendition_status` enum('complete','pending','wip','error') NOT NULL,
  `video_rendition_status_lessbitrate` enum('complete','pending','wip','error') NOT NULL,
  `video_rendition_status_size` enum('complete','pending','wip','error') NOT NULL DEFAULT 'pending',
  `video_rendition_status_big_size` enum('complete','pending','wip','error') NOT NULL DEFAULT 'pending',
  `m3u8_ts_status` enum('0','1') NOT NULL DEFAULT '1',
  `job_status` enum('0','1','-1') NOT NULL DEFAULT '1',
  `video_rendition_created_date` datetime NOT NULL,
  `video_rendition_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_rendition_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_reports`
--

CREATE TABLE `video_reports` (
  `id` int(11) NOT NULL,
  `video_id` bigint(20) NOT NULL DEFAULT '0',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `report_id` int(11) NOT NULL DEFAULT '0',
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_share`
--

CREATE TABLE `video_share` (
  `id` int(11) NOT NULL,
  `sharedplaylist_id` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `tiny_url` text,
  `redirect_url` varchar(255) DEFAULT NULL,
  `playlist_id` bigint(20) DEFAULT NULL,
  `video_ids` text,
  `user_id` bigint(20) DEFAULT NULL,
  `video_json` longtext CHARACTER SET utf8,
  `video_comment_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_json` text,
  `tiny_hash` varchar(10) DEFAULT NULL,
  `is_share` enum('YES','NO') DEFAULT 'NO',
  `is_story` enum('0','1') DEFAULT '0',
  `is_deleted` enum('0','1') DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `userimage` varchar(255) DEFAULT NULL,
  `total_views` int(11) DEFAULT NULL,
  `sharedplaylist_name` varchar(255) DEFAULT 'NO',
  `createdOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_sharing_url`
--

CREATE TABLE `video_sharing_url` (
  `id` int(11) NOT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `sharing_url` varchar(100) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_state_category`
--

CREATE TABLE `video_state_category` (
  `video_id` bigint(20) DEFAULT NULL,
  `category_id` longtext,
  `state_id` longtext,
  `created_on` datetime DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_stats`
--

CREATE TABLE `video_stats` (
  `id` bigint(20) NOT NULL,
  `video_id` bigint(20) NOT NULL DEFAULT '0',
  `video_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `playlist_id` bigint(20) NOT NULL DEFAULT '0',
  `action` varchar(50) NOT NULL DEFAULT '0',
  `category_id` bigint(20) NOT NULL DEFAULT '0',
  `video_viewed_time` int(11) NOT NULL DEFAULT '0',
  `view_mode` varchar(50) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_tag`
--

CREATE TABLE `video_tag` (
  `video_tag_video_id` bigint(20) UNSIGNED NOT NULL,
  `video_tag_tag_id` bigint(20) UNSIGNED NOT NULL,
  `script_id` bigint(20) UNSIGNED DEFAULT NULL,
  `video_tag_created_date` datetime NOT NULL,
  `video_tag_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_tag_updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_template`
--

CREATE TABLE `video_template` (
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `template_json` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_time`
--

CREATE TABLE `video_time` (
  `id` bigint(20) DEFAULT NULL,
  `storytime` varchar(50) DEFAULT NULL,
  `proiritytime` varchar(50) DEFAULT NULL,
  `elapsedtime` varchar(50) DEFAULT NULL,
  `status` enum('1','0') DEFAULT '1',
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT NULL,
  `masalafactor` varchar(50) DEFAULT NULL,
  `lambda` varchar(50) DEFAULT NULL,
  `localization` varchar(50) DEFAULT NULL,
  `alreadyviewed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_time__seeting`
--

CREATE TABLE `video_time__seeting` (
  `id` bigint(20) DEFAULT NULL,
  `storytime` varchar(50) DEFAULT NULL,
  `proiritytime` varchar(50) DEFAULT NULL,
  `elapsedtime` varchar(50) DEFAULT NULL,
  `status` enum('1','0') DEFAULT '1',
  `createdOn` datetime DEFAULT NULL,
  `updatedOn` timestamp NULL DEFAULT NULL,
  `masalafactor` varchar(50) DEFAULT NULL,
  `lambda` varchar(50) DEFAULT NULL,
  `localization` varchar(50) DEFAULT NULL,
  `alreadyviewed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `video_v2`
--

CREATE TABLE `video_v2` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` text,
  `script_id` bigint(20) DEFAULT NULL,
  `text_description` text,
  `category_banner` text,
  `video_description` text,
  `name_time` text,
  `description_time` text,
  `language_code` varchar(2) DEFAULT NULL,
  `masala_news_status` enum('masala','serious') DEFAULT 'serious',
  `state_id` varchar(255) DEFAULT NULL,
  `type` enum('news','debate','opinion','blog','ad-tech') DEFAULT NULL,
  `video_tags` text,
  `date` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `disable_time` datetime DEFAULT NULL,
  `breaking_news` enum('0','1') DEFAULT '0',
  `catelog_status` enum('0','1','-1') DEFAULT '0',
  `elastic_status` enum('0','1','2','3') DEFAULT '0',
  `trending_index` bigint(20) UNSIGNED DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `partner_type` varchar(150) DEFAULT 'editorji',
  `is_deleted` enum('N','Y') DEFAULT 'N',
  `deleted_by` varchar(255) DEFAULT 'N',
  `editorji_special` enum('0','1') DEFAULT '0',
  `is_comprehend_status` enum('0','1') DEFAULT '0',
  `image1_1` varchar(255) DEFAULT NULL,
  `image16_9` varchar(255) DEFAULT NULL,
  `seo_headline` varchar(255) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `sub_brand` varchar(50) DEFAULT NULL,
  `buy_now_url` text,
  `ad_tech_playlist_id` int(11) DEFAULT NULL,
  `show_on_desktop` enum('0','1') DEFAULT '1',
  `cloud1_1` varchar(255) DEFAULT NULL,
  `cloud16_9` varchar(255) DEFAULT NULL,
  `resolution` varchar(5) DEFAULT '1_1',
  `path` varchar(255) DEFAULT NULL,
  `thumb_img` text,
  `m3u8_name` text,
  `mp3_name` text,
  `priority` int(11) DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL,
  `m3u8_response_json` text,
  `rendition_duration` int(11) DEFAULT NULL,
  `rendition_size` int(11) DEFAULT NULL,
  `rendition_name` varchar(255) DEFAULT NULL,
  `rendition_thumbnail` varchar(255) DEFAULT NULL,
  `rendition_status` enum('complete','pending','wip','error') NOT NULL DEFAULT 'pending',
  `no_social` enum('0','1') NOT NULL DEFAULT '0',
  `category_id` bigint(20) DEFAULT NULL,
  `og_type` varchar(50) DEFAULT NULL,
  `og_description` text,
  `og_title` varchar(255) DEFAULT NULL,
  `og_site_name` varchar(50) DEFAULT NULL,
  `share_url` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `summary` text,
  `meta_keywords` text,
  `parent_category` bigint(20) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_version`
--

CREATE TABLE `video_version` (
  `video_version_id` bigint(20) UNSIGNED NOT NULL,
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `video_path` varchar(255) DEFAULT NULL,
  `video_thumb_img` text,
  `image_thumb` text,
  `image_big_thumb` text,
  `m3u8_new_response_json` text,
  `video_ts_description` text,
  `m3u8_name` text,
  `image_small_size` text,
  `mp3_name` text,
  `video_ts_name` varchar(255) DEFAULT NULL,
  `transition_id` varchar(255) DEFAULT NULL,
  `video_encoding` varchar(50) DEFAULT NULL,
  `video_mimetype` varchar(100) DEFAULT NULL,
  `video_size` varchar(10) DEFAULT NULL,
  `video_bytes` bigint(20) DEFAULT NULL,
  `video_priority` int(11) DEFAULT NULL,
  `video_view_count` bigint(20) DEFAULT NULL,
  `video_duration_type` enum('short-version','long-version','anchor-video','category-video') NOT NULL,
  `video_status` enum('enabled','disabled') NOT NULL,
  `video_rendition_status` enum('complete','pending','wip','error') NOT NULL,
  `video_rendition_status_size` enum('complete','pending','wip','error') NOT NULL DEFAULT 'pending',
  `video_rendition_status_big_size` enum('complete','pending','wip','error') NOT NULL DEFAULT 'pending',
  `video_rendition_status_lessbitrate` enum('complete','pending','wip','error') NOT NULL DEFAULT 'pending',
  `video_rendition_json` text,
  `video_rendition_json_size` text,
  `video_rendition_json_lessrate` text,
  `video_rendition_json_big_size` text,
  `m3u8_ts_status_new` text,
  `job_status_new` text,
  `m3u8_json` text,
  `m3u8_response_json` text,
  `mp3_response_json` text,
  `video_ts_status` enum('0','1') DEFAULT '1',
  `mp3_status` enum('0','1') DEFAULT '1',
  `m3u8_ts_status` enum('0','1') DEFAULT '1',
  `job_status` enum('0','1','-1') DEFAULT '1',
  `video_ts_rendition_status` enum('pending','complete') DEFAULT 'pending',
  `mp3_rendition_status` enum('pending','complete','error') DEFAULT 'pending',
  `m3u8_ts_rendition_status` enum('pending','complete') DEFAULT 'pending',
  `video_created_date` datetime NOT NULL,
  `video_updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_transition` enum('0','1') DEFAULT '1',
  `m3u8_status` enum('0','1') DEFAULT '1',
  `video_updated_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `video_views`
--

CREATE TABLE `video_views` (
  `video_id` bigint(20) UNSIGNED NOT NULL,
  `view_count` bigint(20) UNSIGNED NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video_views`
--

INSERT INTO `video_views` (`video_id`, `view_count`, `updated_date`) VALUES
(1627633710190, 0, '2021-07-30 08:28:30');

-- --------------------------------------------------------

--
-- Table structure for table `video_watch_duration`
--

CREATE TABLE `video_watch_duration` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `total_minutes` float DEFAULT NULL,
  `device_type` enum('ANDROID','IOS','WEB') DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `walk_though`
--

CREATE TABLE `walk_though` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '0',
  `video_path` text NOT NULL,
  `type` enum('android','ios','pwa') NOT NULL,
  `language_code` enum('en','hi','ta') NOT NULL,
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_category_logs`
--

CREATE TABLE `web_category_logs` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `web_widget_id` int(11) DEFAULT NULL,
  `web_category_widget_id` int(11) DEFAULT NULL,
  `web_category_widget_news_id` int(11) DEFAULT NULL,
  `action` enum('Created','Updated','Deleted') DEFAULT 'Updated',
  `sequence` int(11) DEFAULT '0',
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_category_widgets`
--

CREATE TABLE `web_category_widgets` (
  `id` bigint(20) NOT NULL,
  `web_widget_id` int(11) DEFAULT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  `subcategory_id` bigint(20) DEFAULT NULL,
  `sport_widget_id` bigint(20) DEFAULT NULL,
  `match_id` bigint(20) DEFAULT NULL,
  `keyword` varchar(50) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `blog_title` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `lang` tinytext,
  `blog_image` varchar(200) DEFAULT NULL,
  `cloud_image` varchar(200) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_category_widget_news`
--

CREATE TABLE `web_category_widget_news` (
  `id` bigint(20) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `web_widget_id` int(11) DEFAULT NULL,
  `web_category_widget_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `news` bigint(20) DEFAULT NULL,
  `news_content` text CHARACTER SET utf8,
  `created_by` bigint(20) NOT NULL,
  `updated_by` bigint(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_trending_video`
--

CREATE TABLE `web_trending_video` (
  `id` int(11) NOT NULL,
  `trending_topic` text CHARACTER SET utf8,
  `sequence` smallint(6) NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `url` text CHARACTER SET utf8,
  `lang_code` varchar(4) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `is_deleted` enum('Y','N') DEFAULT 'N',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `web_widgets`
--

CREATE TABLE `web_widgets` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT 'default',
  `ui_type` enum('playlist','carousel','more_news','live_sport','inline_grid','inline_list','partners','sport_widget','covid_widget','web_view','live_blog') DEFAULT NULL,
  `description` text,
  `image_url` varchar(250) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE `widget` (
  `id` bigint(20) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `sub_category` varchar(255) DEFAULT NULL,
  `match_id` varchar(255) DEFAULT NULL,
  `match_name` varchar(255) DEFAULT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `created_by` varchar(50) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `widget`
--

INSERT INTO `widget` (`id`, `category`, `sub_category`, `match_id`, `match_name`, `status`, `created_by`, `created_on`, `updated_by`, `updated_on`) VALUES
(1, 'sport', 'Indian Premier League ', '40966', 'Delhi Capitals vs Rajasthan Royals ', 'disable', 'admin', '2019-05-04 16:38:26', 'admin', '2019-05-09 18:16:53'),
(2, 'sport', 'Indian Premier League ', '40967', 'Royal Challengers Bangalore vs Sunrisers Hyderabad ', 'disable', 'admin', '2019-05-04 17:18:33', 'admin', '2019-05-09 18:16:52'),
(3, 'sport', 'Indian Premier League ', '41321', 'Mumbai Indians vs Chennai Super Kings ', 'disable', 'Abhimanyu', '2019-05-07 18:45:47', 'srinwanti', '2019-05-12 19:30:32'),
(4, 'sport', 'Indian Premier League ', '41323', 'Chennai Super Kings vs Delhi Capitals ', 'disable', 'zoya', '2019-05-10 17:11:53', 'srinwanti', '2019-05-12 19:30:29'),
(5, 'sport', 'Indian Premier League ', '41324', 'Mumbai Indians vs Chennai Super Kings ', 'disable', 'srinwanti', '2019-05-12 19:29:17', 'zoya', '2019-05-25 14:57:50'),
(6, 'sport', 'ICC World Cup Warm-up Matches ', '41399', 'India vs New Zealand ', 'disable', 'zoya', '2019-05-25 14:57:44', 'zoya', '2019-05-28 11:35:29'),
(7, 'sport', 'ICC World Cup Warm-up Matches ', '41406', 'Bangladesh vs India ', 'disable', 'zoya', '2019-05-28 11:35:24', 'zoya', '2019-05-30 14:40:55'),
(8, 'sport', 'ICC Cricket World Cup ', '38522', 'England vs South Africa ', 'disable', 'zoya', '2019-05-30 14:40:51', 'zoya', '2019-05-31 14:37:22'),
(9, 'sport', 'ICC Cricket World Cup ', '38523', 'Pakistan vs West Indies ', 'disable', 'zoya', '2019-05-31 14:37:18', 'zoya', '2019-06-01 08:49:47'),
(10, 'sport', 'ICC Cricket World Cup ', '38524', 'New Zealand vs Sri Lanka ', 'disable', 'zoya', '2019-06-01 08:50:10', 'zoya', '2019-06-02 14:38:53'),
(11, 'sport', 'ICC Cricket World Cup ', '38525', 'Afghanistan vs Australia ', 'disable', 'zoya', '2019-06-01 08:50:26', 'zoya', '2019-06-02 14:38:57'),
(12, 'sport', 'ICC Cricket World Cup ', '38526', 'Bangladesh vs South Africa ', 'disable', 'zoya', '2019-06-02 14:39:11', 'zoya', '2019-06-03 14:36:10'),
(13, 'sport', 'ICC Cricket World Cup ', '38527', 'England vs Pakistan ', 'disable', 'zoya', '2019-06-03 14:37:46', 'zoya', '2019-06-04 13:30:07'),
(14, 'sport', 'ICC Cricket World Cup ', '38528', 'Afghanistan vs Sri Lanka ', 'disable', 'zoya', '2019-06-04 13:30:15', 'zoya', '2019-06-10 13:33:11'),
(15, 'sport', 'ICC Cricket World Cup ', '38529', 'India vs South Africa ', 'disable', 'yash', '2019-06-05 15:08:00', 'zoya', '2019-06-10 13:33:30'),
(16, 'sport', 'ICC Cricket World Cup ', '38530', 'Bangladesh vs New Zealand ', 'disable', 'yash', '2019-06-05 18:48:28', 'zoya', '2019-06-10 13:33:33'),
(17, 'sport', 'ICC Cricket World Cup ', '38531', 'Australia vs West Indies ', 'disable', 'yash', '2019-06-06 14:52:44', 'zoya', '2019-06-10 13:33:25'),
(18, 'sport', 'ICC Cricket World Cup ', '38532', 'Pakistan vs Sri Lanka ', 'disable', 'yash', '2019-06-07 15:11:51', 'zoya', '2019-06-10 13:33:22'),
(19, 'sport', 'ICC Cricket World Cup ', '38533', 'England vs Bangladesh ', 'disable', 'yash', '2019-06-08 14:59:37', 'zoya', '2019-06-10 13:33:19'),
(20, 'sport', 'ICC Cricket World Cup ', '38534', 'Afghanistan vs New Zealand ', 'disable', 'yash', '2019-06-08 18:03:56', 'zoya', '2019-06-10 13:33:14'),
(21, 'sport', 'ICC Cricket World Cup ', '38535', 'Australia vs India ', 'disable', 'yash', '2019-06-09 14:43:36', 'zoya', '2019-06-10 13:33:16'),
(22, 'sport', 'ICC Cricket World Cup ', '38536', 'South Africa vs West Indies ', 'disable', 'zoya', '2019-06-10 13:33:44', 'zoya', '2019-06-11 13:59:58'),
(23, 'sport', 'ICC Cricket World Cup ', '38537', 'Bangladesh vs Sri Lanka ', 'disable', 'zoya', '2019-06-11 14:00:09', 'zoya', '2019-06-12 14:36:22'),
(24, 'sport', 'ICC Cricket World Cup ', '38538', 'Australia vs Pakistan ', 'disable', 'zoya', '2019-06-12 14:36:29', 'zoya', '2019-06-13 14:33:10'),
(25, 'sport', 'ICC Cricket World Cup ', '38539', 'India vs New Zealand ', 'disable', 'zoya', '2019-06-13 14:33:17', 'zoya', '2019-06-17 15:14:14'),
(26, 'sport', 'ICC Cricket World Cup ', '38540', 'England vs West Indies ', 'disable', 'khyati', '2019-06-14 14:59:45', 'zoya', '2019-06-17 15:14:09'),
(27, 'sport', 'ICC Cricket World Cup ', '38541', 'Australia vs Sri Lanka ', 'disable', 'lav', '2019-06-15 14:58:18', 'zoya', '2019-06-17 15:14:06'),
(28, 'sport', 'ICC Cricket World Cup ', '38542', 'Afghanistan vs South Africa ', 'disable', 'lav', '2019-06-15 19:11:27', 'zoya', '2019-06-17 15:14:02'),
(29, 'sport', 'ICC Cricket World Cup ', '38543', 'India vs Pakistan ', 'disable', 'yash', '2019-06-16 14:57:19', 'zoya', '2019-06-17 15:13:57'),
(30, 'sport', 'ICC Cricket World Cup ', '38544', 'Bangladesh vs West Indies ', 'disable', 'khyati', '2019-06-17 14:46:04', 'zoya', '2019-06-18 14:58:20'),
(31, 'sport', 'ICC Cricket World Cup ', '38545', 'Afghanistan vs England ', 'disable', 'zoya', '2019-06-18 14:58:28', 'zoya', '2019-06-19 12:44:18'),
(32, 'sport', 'ICC Cricket World Cup ', '38546', 'New Zealand vs South Africa ', 'disable', 'zoya', '2019-06-19 12:44:25', 'zoya', '2019-06-21 12:34:10'),
(33, 'sport', 'ICC Cricket World Cup ', '38547', 'Australia vs Bangladesh ', 'disable', 'yash', '2019-06-20 14:26:21', 'zoya', '2019-06-21 12:34:12'),
(34, 'sport', 'ICC Cricket World Cup ', '38548', 'England vs Sri Lanka ', 'disable', 'zoya', '2019-06-21 12:34:21', 'zoya', '2019-06-23 15:06:21'),
(35, 'sport', 'ICC Cricket World Cup ', '38549', 'Afghanistan vs India ', 'disable', 'yash', '2019-06-22 13:00:47', 'zoya', '2019-06-23 15:06:28'),
(36, 'sport', 'ICC Cricket World Cup ', '38550', 'New Zealand vs West Indies ', 'disable', 'lav', '2019-06-22 17:52:33', 'zoya', '2019-06-23 15:06:33'),
(37, 'sport', 'ICC Cricket World Cup ', '38551', 'Pakistan vs South Africa ', 'disable', 'lav', '2019-06-23 15:05:01', 'zoya', '2019-06-24 14:38:14'),
(38, 'sport', 'ICC Cricket World Cup ', '38552', 'Afghanistan vs Bangladesh ', 'disable', 'zoya', '2019-06-24 14:38:24', 'zoya', '2019-06-25 14:22:23'),
(39, 'sport', 'ICC Cricket World Cup ', '38553', 'England vs Australia ', 'disable', 'zoya', '2019-06-25 14:22:33', 'zoya', '2019-06-26 13:26:56'),
(40, 'sport', 'ICC Cricket World Cup ', '38554', 'New Zealand vs Pakistan ', 'disable', 'zoya', '2019-06-26 13:27:03', 'zoya', '2019-06-27 13:23:03'),
(41, 'sport', 'ICC Cricket World Cup ', '38555', 'India vs West Indies ', 'disable', 'zoya', '2019-06-27 13:23:10', 'zoya', '2019-06-28 18:45:59'),
(42, 'sport', 'ICC Cricket World Cup ', '38556', 'South Africa vs Sri Lanka ', 'disable', 'lav', '2019-06-28 15:10:01', 'khyati', '2019-06-28 23:29:33'),
(43, 'sport', 'ICC Cricket World Cup ', '38557', 'Afghanistan vs Pakistan ', 'disable', 'khyati', '2019-06-29 15:06:21', 'khyati', '2019-06-30 15:16:32'),
(44, 'sport', 'ICC Cricket World Cup ', '38558', 'Australia vs New Zealand ', 'disable', 'lav', '2019-06-29 18:10:51', 'khyati', '2019-06-30 15:16:34'),
(45, 'sport', 'ICC Cricket World Cup ', '38559', 'England vs India ', 'disable', 'khyati', '2019-06-30 14:42:49', 'zoya', '2019-07-01 14:16:10'),
(46, 'sport', 'ICC Cricket World Cup ', '38560', 'Sri Lanka vs West Indies ', 'disable', 'zoya', '2019-07-01 14:16:20', 'lav', '2019-07-02 02:10:12'),
(47, 'sport', 'ICC Cricket World Cup ', '38561', 'Bangladesh vs India ', 'disable', 'khyati', '2019-07-02 15:04:17', 'lav', '2019-07-02 23:09:58'),
(48, 'sport', 'ICC Cricket World Cup ', '38562', 'England vs New Zealand ', 'disable', 'lav', '2019-07-03 15:02:03', 'lav', '2019-07-04 01:18:17'),
(49, 'sport', 'ICC Cricket World Cup ', '38563', 'Afghanistan vs West Indies ', 'disable', 'zoya', '2019-07-04 15:03:49', 'lav', '2019-07-04 23:51:17'),
(50, 'sport', 'ICC Cricket World Cup ', '38564', 'Bangladesh vs Pakistan ', 'disable', 'zoya', '2019-07-05 15:02:47', 'lav', '2019-07-06 03:29:13'),
(51, 'sport', 'ICC Cricket World Cup ', '38565', 'India vs Sri Lanka ', 'disable', 'khyati', '2019-07-06 14:49:48', 'lav', '2019-07-07 12:05:23'),
(52, 'sport', 'ICC Cricket World Cup ', '38566', 'Australia vs South Africa ', 'disable', 'lav', '2019-07-06 17:52:19', 'lav', '2019-07-07 12:05:20'),
(53, 'sport', 'ICC Cricket World Cup ', '38567', 'India vs New Zealand ', 'disable', 'zoya', '2019-07-09 13:54:00', 'lav', '2019-07-10 20:20:39'),
(54, 'sport', 'ICC Cricket World Cup ', '38568', 'Australia vs England ', 'disable', 'zoya', '2019-07-11 14:31:14', 'lav', '2019-07-15 01:09:45'),
(55, 'sport', 'ICC Cricket World Cup ', '38569', 'England vs New Zealand ', 'disable', 'yash', '2019-07-14 14:59:47', 'lav', '2019-07-15 01:09:42'),
(56, 'sport', 'The Ashes ', '39216', 'England vs Australia ', 'disable', 'zoya', '2019-08-01 14:39:59', 'lav', '2019-08-03 17:33:55'),
(57, 'sport', 'India tour of West Indies ', '41818', 'West Indies vs India ', 'disable', 'lav', '2019-08-03 20:01:59', 'yash', '2019-08-11 19:07:35'),
(58, 'sport', 'India tour of West Indies ', '41819', 'India vs West Indies ', 'disable', 'khyati', '2019-08-04 20:04:03', 'lav', '2019-08-06 21:20:23'),
(59, 'sport', 'India tour of West Indies ', '41820', 'West Indies vs India ', 'disable', 'lav', '2019-08-06 20:45:11', 'lav', '2019-08-07 04:31:07'),
(60, 'sport', 'India tour of West Indies ', '41821', 'West Indies vs India ', 'disable', 'yash', '2019-08-08 21:01:33', 'yash', '2019-08-11 19:07:38'),
(61, 'sport', 'India tour of West Indies ', '41822', 'West Indies vs India ', 'disable', 'yash', '2019-08-11 19:03:58', 'lav', '2019-08-14 18:52:45'),
(62, 'sport', 'India tour of West Indies ', '41823', 'West Indies vs India ', 'disable', 'lav', '2019-08-14 18:52:54', 'yash', '2019-08-30 19:50:21'),
(63, 'sport', 'India tour of West Indies ', '41826', 'West Indies vs India ', 'disable', 'yash', '2019-08-30 19:50:35', 'lav', '2019-09-18 18:57:50'),
(64, 'sport', 'South Africa tour of India ', '41984', 'India vs South Africa ', 'disable', 'lav', '2019-09-18 18:57:44', 'lav', '2019-09-22 20:28:04'),
(65, 'sport', 'South Africa tour of India ', '41985', 'India vs South Africa ', 'disable', 'lav', '2019-09-22 20:27:42', 'lav', '2019-10-02 09:28:52'),
(66, 'sport', 'South Africa tour of India ', '41986', 'India vs South Africa ', 'disable', 'lav', '2019-10-02 09:29:08', 'lav', '2019-10-06 15:07:14'),
(67, 'sport', 'South Africa tour of India ', '41987', 'India vs South Africa ', 'disable', 'yash', '2019-10-10 09:54:03', 'lav', '2019-10-19 09:44:21'),
(68, 'sport', 'South Africa tour of India ', '41988', 'India vs South Africa ', 'disable', 'lav', '2019-10-19 09:44:32', 'lav', '2019-11-03 23:59:08'),
(69, 'sport', 'Bangladesh tour of India ', '41898', 'India vs Bangladesh ', 'disable', 'lav', '2019-11-03 19:00:43', 'lav', '2019-11-03 23:59:06'),
(70, 'sport', 'Bangladesh tour of India ', '41899', 'India vs Bangladesh ', 'disable', 'lav', '2019-11-07 18:56:21', 'lav', '2019-11-10 18:44:56'),
(71, 'sport', 'Bangladesh tour of India ', '41900', 'India vs Bangladesh ', 'disable', 'lav', '2019-11-10 18:45:01', 'yash', '2019-11-14 09:12:52'),
(72, 'sport', 'Bangladesh tour of India ', '41901', 'India vs Bangladesh ', 'disable', 'yash', '2019-11-14 09:12:45', 'yash', '2019-11-22 12:39:58'),
(73, 'sport', 'Bangladesh tour of India ', '41902', 'India vs Bangladesh ', 'disable', 'yash', '2019-11-22 12:40:07', 'yash', '2019-12-08 18:02:30'),
(74, 'sport', 'West Indies tour of India ', '42002', 'India vs West Indies ', 'disable', 'yash', '2019-12-06 19:04:40', 'yash', '2019-12-08 18:02:22'),
(75, 'sport', 'West Indies tour of India ', '42003', 'India vs West Indies ', 'disable', 'sriwanti', '2019-12-08 19:03:53', 'sriwanti', '2019-12-11 19:16:00'),
(76, 'sport', 'West Indies tour of India ', '42004', 'India vs West Indies ', 'disable', 'sriwanti', '2019-12-11 19:12:08', 'yash', '2019-12-18 13:24:37'),
(77, 'sport', 'West Indies tour of India ', '42005', 'India vs West Indies ', 'disable', 'saket', '2019-12-15 13:26:24', 'yash', '2019-12-18 13:24:40'),
(78, 'sport', 'West Indies tour of India ', '42006', 'India vs West Indies ', 'disable', 'yash', '2019-12-18 13:24:50', 'saket', '2019-12-22 13:28:35'),
(79, 'sport', 'West Indies tour of India ', '42007', 'India vs West Indies ', 'disable', 'saket', '2019-12-22 13:28:50', 'lav', '2020-01-05 18:20:07'),
(80, 'sport', 'Sri Lanka tour of India ', '43681', 'India vs Sri Lanka ', 'disable', 'lav', '2020-01-05 18:20:20', 'lav', '2020-01-07 18:08:55'),
(81, 'sport', 'Sri Lanka tour of India ', '43682', 'India vs Sri Lanka ', 'disable', 'lav', '2020-01-07 18:09:01', 'lav', '2020-01-07 23:44:37'),
(82, 'sport', 'Sri Lanka tour of India ', '43683', 'India vs Sri Lanka ', 'disable', 'lav', '2020-01-10 17:44:37', 'lav', '2020-01-14 22:36:07'),
(83, 'sport', 'Australia tour of India ', '41906', 'India vs Australia ', 'disable', 'yash', '2020-01-14 13:34:46', 'lav', '2020-01-14 22:36:05'),
(84, 'sport', 'Australia tour of India ', '41907', 'India vs Australia ', 'disable', 'yash', '2020-01-17 13:29:14', 'lav', '2020-01-19 13:25:25'),
(85, 'sport', 'Australia tour of India ', '41908', 'India vs Australia ', 'disable', 'lav', '2020-01-19 13:25:39', 'sefat', '2020-01-20 23:57:18'),
(86, 'sport', 'ICC Under-19 World Cup ', '43640', 'India Under-19s vs Japan Under-19s ', 'disable', 'yash', '2020-01-21 13:27:14', 'lav', '2020-01-21 16:50:54'),
(87, 'sport', 'India tour of New Zealand ', '41933', 'New Zealand vs India ', 'disable', 'yash', '2020-01-24 12:20:14', 'lav', '2020-01-26 12:02:12'),
(88, 'sport', 'ICC Under-19 World Cup ', '43648', 'India Under-19s vs New Zealand Under-19s ', 'disable', 'yash', '2020-01-24 13:32:42', 'lav', '2020-01-26 12:02:10'),
(89, 'sport', 'India tour of New Zealand ', '41935', 'New Zealand vs India ', 'disable', 'lav', '2020-01-26 12:02:20', 'lav', '2020-01-28 13:52:26'),
(90, 'sport', 'ICC Under-19 World Cup ', '43659', 'India Under-19s vs Australia Under-19s ', 'disable', 'lav', '2020-01-28 13:52:56', 'yash', '2020-01-29 12:14:51'),
(91, 'sport', 'India tour of New Zealand ', '41937', 'New Zealand vs India ', 'disable', 'yash', '2020-01-29 12:15:10', 'lav', '2020-01-29 16:33:49'),
(92, 'sport', 'India tour of New Zealand ', '41938', 'New Zealand vs India ', 'disable', 'lav', '2020-01-31 12:43:49', 'lav', '2020-01-31 17:28:54'),
(93, 'sport', 'India tour of New Zealand ', '41939', 'New Zealand vs India ', 'disable', 'lav', '2020-02-02 12:29:57', 'lav', '2020-02-04 13:30:42'),
(94, 'sport', 'ICC Under-19 World Cup ', '43673', 'India Under-19s vs Pakistan Under-19s ', 'disable', 'lav', '2020-02-04 13:30:49', 'lav', '2020-02-05 07:27:05'),
(95, 'sport', 'India tour of New Zealand ', '41940', 'New Zealand vs India ', 'disable', 'lav', '2020-02-05 07:27:14', 'yash', '2020-02-08 07:11:04'),
(96, 'sport', 'India tour of New Zealand ', '41942', 'New Zealand vs India ', 'disable', 'yash', '2020-02-08 07:11:10', 'yash', '2020-02-23 04:08:00'),
(97, 'sport', 'ICC Under-19 World Cup ', '43678', 'Bangladesh Under-19s vs India Under-19s ', 'disable', 'saket', '2020-02-09 13:13:05', 'lav', '2020-02-11 07:33:02'),
(98, 'sport', 'India tour of New Zealand ', '41943', 'New Zealand vs India ', 'disable', 'lav', '2020-02-11 07:33:08', 'yash', '2020-02-21 04:04:19'),
(99, 'sport', 'India tour of New Zealand ', '41944', 'New Zealand vs India ', 'disable', 'admin', '2020-02-21 09:45:53', 'yash', '2020-02-24 16:32:49'),
(100, 'sport', 'ICC Women\'s T20 World Cup ', '41925', 'Australia Women vs India Women 1st Match, Group A ', 'disable', 'lav', '2020-02-21 13:32:21', 'yash', '2020-02-22 06:21:17'),
(101, 'sport', 'ICC Women\'s T20 World Cup ', '41930', 'Bangladesh Women vs India Women 6th Match, Group A ', 'disable', 'yash', '2020-02-24 16:32:44', 'yash', '2020-02-27 09:23:16'),
(102, 'sport', 'ICC Women\'s T20 World Cup ', '41934', 'India Women vs New Zealand Women 9th Match, Group A ', 'disable', 'yash', '2020-02-27 09:23:23', 'yash', '2020-02-29 04:01:04'),
(103, 'sport', 'India tour of New Zealand ', '41945', 'New Zealand vs India 2nd Test ', 'disable', 'yash', '2020-02-29 04:01:12', 'lav', '2020-03-08 12:21:54'),
(104, 'sport', 'ICC Women\'s T20 World Cup ', '41953', 'India Women vs Sri Lanka Women 14th Match, Group A ', 'disable', 'lav', '2020-02-29 09:31:38', 'lav', '2020-03-08 12:21:52'),
(105, 'sport', 'ICC Women\'s T20 World Cup ', '41962', 'Australia Women vs India Women Final ', 'disable', 'lav', '2020-03-08 12:21:48', 'lav', '2020-07-08 18:33:42'),
(106, 'sport', 'West Indies tour of England ', '44616', 'England vs West Indies 1st Test ', 'disable', 'lav', '2020-07-08 18:33:35', 'lav', '2020-07-16 15:29:25'),
(107, 'sport', 'West Indies tour of England ', '44617', 'England vs West Indies 2nd Test ', 'disable', 'lav', '2020-07-16 15:29:21', 'lav', '2020-07-24 15:12:55'),
(108, 'sport', 'West Indies tour of England ', '44618', 'England vs West Indies 3rd Test ', 'disable', 'lav', '2020-07-24 15:13:02', 'lav', '2020-07-28 20:38:00'),
(109, 'sport', 'Ireland tour of England ', '44995', 'England vs Ireland 1st ODI ', 'disable', 'lav', '2020-07-30 18:42:19', 'yash', '2020-08-01 19:24:22'),
(110, 'sport', 'Ireland tour of England ', '44996', 'England vs Ireland 2nd ODI ', 'disable', 'yash', '2020-08-01 19:24:15', 'lav', '2020-08-02 14:03:05'),
(111, 'sport', 'Pakistan tour England ', '44625', 'England vs Pakistan 1st Test ', 'disable', 'lav', '2020-08-05 15:34:30', 'lav', '2020-08-13 15:53:16'),
(112, 'sport', 'Pakistan tour England ', '44626', 'England vs Pakistan 2nd Test ', 'disable', 'lav', '2020-08-13 15:53:23', 'lav', '2020-08-21 16:32:27'),
(113, 'sport', 'Pakistan tour England ', '44627', 'England vs Pakistan 3rd Test ', 'disable', 'lav', '2020-08-21 16:32:34', 'lav', '2020-09-11 19:59:00'),
(114, 'sport', 'Australia tour of England ', '45469', 'England vs Australia 1st ODI ', 'disable', 'lav', '2020-09-11 19:59:09', 'lav', '2020-09-16 17:31:37'),
(115, 'sport', 'Australia tour of England ', '45471', 'England vs Australia 3rd ODI ', 'disable', 'lav', '2020-09-16 17:31:43', 'yash', '2020-09-19 11:37:56'),
(116, 'sport', 'Indian Premier League ', '45587', 'Mumbai Indians vs Chennai Super Kings 1st Match ', 'disable', 'yash', '2020-09-19 11:37:53', 'lav', '2020-09-20 19:17:55'),
(117, 'sport', 'Indian Premier League ', '45588', 'Delhi Capitals vs Kings XI Punjab 2nd Match ', 'disable', 'lav', '2020-09-20 19:18:21', 'yash', '2020-09-21 19:24:43'),
(118, 'sport', 'Indian Premier League ', '45589', 'Sunrisers Hyderabad vs Royal Challengers Bangalore 3rd Match ', 'disable', 'yash', '2020-09-21 19:24:55', 'yash', '2020-09-22 19:21:08'),
(119, 'sport', 'Indian Premier League ', '45590', 'Rajasthan Royals vs Chennai Super Kings 4th Match ', 'disable', 'yash', '2020-09-22 19:21:15', 'yash', '2020-09-23 19:05:27'),
(120, 'sport', 'Indian Premier League ', '45591', 'Kolkata Knight Riders vs Mumbai Indians 5th Match ', 'disable', 'yash', '2020-09-23 19:05:38', 'yash', '2020-09-24 19:21:31'),
(121, 'sport', 'Indian Premier League ', '45592', 'Kings XI Punjab vs Royal Challengers Bangalore 6th Match ', 'disable', 'yash', '2020-09-24 19:21:38', 'zoya', '2020-09-25 19:26:28'),
(122, 'sport', 'Indian Premier League ', '45593', 'Chennai Super Kings vs Delhi Capitals 7th Match ', 'disable', 'zoya', '2020-09-25 19:26:13', 'zoya', '2020-09-26 19:01:48'),
(123, 'sport', 'Indian Premier League ', '45594', 'Kolkata Knight Riders vs Sunrisers Hyderabad 8th Match ', 'disable', 'zoya', '2020-09-26 19:01:44', 'lav', '2020-09-27 19:23:59'),
(124, 'sport', 'Indian Premier League ', '45595', 'Rajasthan Royals vs Kings XI Punjab 9th Match ', 'disable', 'lav', '2020-09-27 19:24:11', 'lav', '2020-09-28 18:31:55'),
(125, 'sport', 'Indian Premier League ', '45596', 'Royal Challengers Bangalore vs Mumbai Indians 10th Match ', 'disable', 'lav', '2020-09-28 19:23:13', 'lav', '2020-09-29 19:26:04'),
(126, 'sport', 'Indian Premier League ', '45597', 'Delhi Capitals vs Sunrisers Hyderabad 11th Match ', 'disable', 'lav', '2020-09-29 19:26:16', 'lav', '2020-09-30 19:18:36'),
(127, 'sport', 'Indian Premier League ', '45598', 'Rajasthan Royals vs Kolkata Knight Riders 12th Match ', 'disable', 'lav', '2020-09-30 19:18:52', 'lav', '2020-10-01 19:27:21'),
(128, 'sport', 'Indian Premier League ', '45599', 'Kings XI Punjab vs Mumbai Indians 13th Match ', 'disable', 'lav', '2020-10-01 19:27:35', 'yash', '2020-10-02 19:15:19'),
(129, 'sport', 'Indian Premier League ', '45600', 'Chennai Super Kings vs Sunrisers Hyderabad 14th Match ', 'disable', 'yash', '2020-10-02 19:15:17', 'lav', '2020-10-03 15:32:34'),
(130, 'sport', 'Indian Premier League ', '45601', 'Royal Challengers Bangalore vs Rajasthan Royals 15th Match ', 'disable', 'lav', '2020-10-03 15:32:41', 'lav', '2020-10-04 19:28:13'),
(131, 'sport', 'Indian Premier League ', '45602', 'Delhi Capitals vs Kolkata Knight Riders 16th Match ', 'disable', 'lav', '2020-10-03 23:24:15', 'lav', '2020-10-04 15:30:23'),
(132, 'sport', 'Indian Premier League ', '45603', 'Mumbai Indians vs Sunrisers Hyderabad 17th Match ', 'disable', 'lav', '2020-10-04 15:30:31', 'lav', '2020-10-04 19:29:58'),
(133, 'sport', 'Indian Premier League ', '45604', 'Kings XI Punjab vs Chennai Super Kings 18th Match ', 'disable', 'lav', '2020-10-04 19:28:26', 'lav', '2020-10-05 19:08:06'),
(134, 'sport', 'Indian Premier League ', '45605', 'Royal Challengers Bangalore vs Delhi Capitals 19th Match ', 'disable', 'lav', '2020-10-05 19:08:44', 'lav', '2020-10-06 19:23:29'),
(135, 'sport', 'Indian Premier League ', '45606', 'Mumbai Indians vs Rajasthan Royals 20th Match ', 'disable', 'lav', '2020-10-06 19:23:53', 'lav', '2020-10-07 18:25:26'),
(136, 'sport', 'Indian Premier League ', '45607', 'Kolkata Knight Riders vs Chennai Super Kings 21st Match ', 'disable', 'vikas', '2020-10-07 18:26:31', 'yash', '2020-10-08 19:19:56'),
(137, 'sport', 'Indian Premier League ', '45608', 'Sunrisers Hyderabad vs Kings XI Punjab 22nd Match ', 'disable', 'yash', '2020-10-08 19:20:02', 'yash', '2020-10-09 19:22:34'),
(138, 'sport', 'Indian Premier League ', '45609', 'Rajasthan Royals vs Delhi Capitals 23rd Match ', 'disable', 'yash', '2020-10-09 19:22:40', 'lav', '2020-10-10 15:18:43'),
(139, 'sport', 'Indian Premier League ', '45610', 'Kings XI Punjab vs Kolkata Knight Riders 24th Match ', 'disable', 'lav', '2020-10-10 15:19:04', 'lav', '2020-10-10 19:30:54'),
(140, 'sport', 'Indian Premier League ', '45611', 'Chennai Super Kings vs Royal Challengers Bangalore 25th Match ', 'disable', 'lav', '2020-10-10 19:31:07', 'lav', '2020-10-11 15:28:09'),
(141, 'sport', 'Indian Premier League ', '45612', 'Sunrisers Hyderabad vs Rajasthan Royals 26th Match ', 'disable', 'vikas', '2020-10-11 15:24:21', 'yash', '2020-10-12 19:22:09'),
(142, 'sport', 'Indian Premier League ', '45613', 'Mumbai Indians vs Delhi Capitals 27th Match ', 'disable', 'lav', '2020-10-11 19:23:24', 'yash', '2020-10-12 19:18:16'),
(143, 'sport', 'Indian Premier League ', '45614', 'Royal Challengers Bangalore vs Kolkata Knight Riders 28th Match ', 'disable', 'yash', '2020-10-12 19:18:24', 'lav', '2020-10-13 19:08:18'),
(144, 'sport', 'Indian Premier League ', '45615', 'Sunrisers Hyderabad vs Chennai Super Kings 29th Match ', 'disable', 'lav', '2020-10-13 19:08:57', 'yash', '2020-10-14 19:23:10'),
(145, 'sport', 'Indian Premier League ', '45616', 'Delhi Capitals vs Rajasthan Royals 30th Match ', 'disable', 'yash', '2020-10-14 19:23:20', 'yash', '2020-10-15 19:20:42'),
(146, 'sport', 'Indian Premier League ', '45617', 'Royal Challengers Bangalore vs Kings XI Punjab 31st Match ', 'disable', 'yash', '2020-10-15 19:20:57', 'yash', '2020-10-16 19:26:32'),
(147, 'sport', 'Indian Premier League ', '45618', 'Mumbai Indians vs Kolkata Knight Riders 32nd Match ', 'disable', 'yash', '2020-10-16 19:26:39', 'lav', '2020-10-17 17:23:10'),
(148, 'sport', 'Indian Premier League ', '45619', 'Rajasthan Royals vs Royal Challengers Bangalore 33rd Match ', 'disable', 'vikas', '2020-10-17 15:11:19', 'lav', '2020-10-17 19:26:46'),
(149, 'sport', 'Indian Premier League ', '45620', 'Delhi Capitals vs Chennai Super Kings 34th Match ', 'disable', 'lav', '2020-10-17 19:26:43', 'lav', '2020-10-18 15:28:53'),
(150, 'sport', 'Indian Premier League ', '45621', 'Sunrisers Hyderabad vs Kolkata Knight Riders 35th Match ', 'disable', 'lav', '2020-10-18 15:29:01', 'yash', '2020-10-19 19:27:51'),
(151, 'sport', 'Indian Premier League ', '45622', 'Mumbai Indians vs Kings XI Punjab 36th Match ', 'disable', 'vikas', '2020-10-18 19:44:03', 'yash', '2020-10-19 19:18:37'),
(152, 'sport', 'Indian Premier League ', '45623', 'Rajasthan Royals vs Chennai Super Kings 37th Match ', 'disable', 'yash', '2020-10-19 19:18:47', 'yash', '2020-10-20 19:29:44'),
(153, 'sport', 'Indian Premier League ', '45624', 'Kings XI Punjab vs Delhi Capitals 38th Match ', 'disable', 'yash', '2020-10-20 19:29:55', 'yash', '2020-10-21 19:18:23'),
(154, 'sport', 'Indian Premier League ', '45625', 'Royal Challengers Bangalore vs Kolkata Knight Riders 39th Match ', 'disable', 'yash', '2020-10-21 19:18:33', 'yash', '2020-10-22 19:12:48'),
(155, 'sport', 'Indian Premier League ', '45626', 'Rajasthan Royals vs Sunrisers Hyderabad 40th Match ', 'disable', 'yash', '2020-10-22 19:12:44', 'lav', '2020-10-23 19:27:57'),
(156, 'sport', 'Indian Premier League ', '45627', 'Chennai Super Kings vs Mumbai Indians 41st Match ', 'disable', 'lav', '2020-10-23 19:27:52', 'zoya', '2020-10-24 14:55:50'),
(157, 'sport', 'Indian Premier League ', '45628', 'Kolkata Knight Riders vs Delhi Capitals 42nd Match ', 'disable', 'zoya', '2020-10-24 14:56:00', 'yash', '2020-10-24 19:20:48'),
(158, 'sport', 'Indian Premier League ', '45629', 'Kings XI Punjab vs Sunrisers Hyderabad 43rd Match ', 'disable', 'yash', '2020-10-24 19:20:55', 'yash', '2020-10-25 15:03:06'),
(159, 'sport', 'Indian Premier League ', '45630', 'Royal Challengers Bangalore vs Chennai Super Kings 44th Match ', 'disable', 'yash', '2020-10-25 15:03:20', 'yash', '2020-10-25 19:11:50'),
(160, 'sport', 'Indian Premier League ', '45631', 'Rajasthan Royals vs Mumbai Indians 45th Match ', 'disable', 'yash', '2020-10-25 19:12:02', 'lav', '2020-10-26 19:29:16'),
(161, 'sport', 'Indian Premier League ', '45632', 'Kolkata Knight Riders vs Kings XI Punjab 46th Match ', 'disable', 'lav', '2020-10-26 19:29:25', 'lav', '2020-10-27 19:28:27'),
(162, 'sport', 'Indian Premier League ', '45633', 'Sunrisers Hyderabad vs Delhi Capitals 47th Match ', 'disable', 'lav', '2020-10-27 19:28:38', 'lav', '2020-10-28 19:28:05'),
(163, 'sport', 'Indian Premier League ', '45634', 'Mumbai Indians vs Royal Challengers Bangalore 48th Match ', 'disable', 'lav', '2020-10-28 19:28:23', 'lav', '2020-10-29 19:26:01'),
(164, 'sport', 'Indian Premier League ', '45635', 'Chennai Super Kings vs Kolkata Knight Riders 49th Match ', 'disable', 'lav', '2020-10-29 19:26:12', 'yash', '2020-10-30 19:24:48'),
(165, 'sport', 'Indian Premier League ', '45636', 'Kings XI Punjab vs Rajasthan Royals 50th Match ', 'disable', 'yash', '2020-10-30 19:24:56', 'lav', '2020-10-31 15:29:51'),
(166, 'sport', 'Indian Premier League ', '45637', 'Delhi Capitals vs Mumbai Indians 51st Match ', 'disable', 'vikas', '2020-10-31 15:19:57', 'lav', '2020-10-31 19:21:10'),
(167, 'sport', 'Indian Premier League ', '45638', 'Royal Challengers Bangalore vs Sunrisers Hyderabad 52nd Match ', 'disable', 'lav', '2020-10-31 19:21:20', 'lav', '2020-11-01 15:34:51'),
(168, 'sport', 'Indian Premier League ', '45639', 'Chennai Super Kings vs Kings XI Punjab 53rd Match ', 'disable', 'vikas', '2020-11-01 15:29:36', 'lav', '2020-11-01 19:23:33'),
(169, 'sport', 'Indian Premier League ', '45640', 'Kolkata Knight Riders vs Rajasthan Royals 54th Match ', 'disable', 'lav', '2020-11-01 19:31:11', 'lav', '2020-11-02 19:28:32'),
(170, 'sport', 'Indian Premier League ', '45641', 'Delhi Capitals vs Royal Challengers Bangalore 55th Match ', 'disable', 'lav', '2020-11-02 19:28:48', 'lav', '2020-11-03 19:29:22'),
(171, 'sport', 'Indian Premier League ', '45642', 'Sunrisers Hyderabad vs Mumbai Indians 56th Match ', 'disable', 'lav', '2020-11-03 19:29:32', 'lav', '2020-11-05 19:25:09'),
(172, 'sport', 'Indian Premier League ', '46136', 'Mumbai Indians vs Delhi Capitals Qualifier 1 ', 'disable', 'lav', '2020-11-05 19:25:07', 'lav', '2020-11-06 19:27:36'),
(173, 'sport', 'Indian Premier League ', '46137', 'Royal Challengers Bangalore vs Sunrisers Hyderabad Eliminator ', 'disable', 'lav', '2020-11-06 19:27:47', 'lav', '2020-11-08 19:30:19'),
(174, 'sport', 'Indian Premier League ', '46138', 'Delhi Capitals vs Sunrisers Hyderabad Qualifier 2 ', 'disable', 'lav', '2020-11-08 19:29:36', 'lav', '2020-11-27 09:12:04'),
(175, 'sport', 'Indian Premier League ', '46139', 'Mumbai Indians vs Delhi Capitals Final ', 'disable', 'vikas', '2020-11-10 19:30:21', 'admin', '2020-12-28 12:23:23'),
(176, 'sport', 'India tour of Australia ', '46104', 'Australia vs India 1st ODI ', 'disable', 'lav', '2020-11-27 09:12:00', 'lav', '2020-11-29 09:20:24'),
(177, 'sport', 'India tour of Australia ', '46105', 'Australia vs India 2nd ODI ', 'enable', 'lav', '2020-11-29 09:20:32', NULL, '2020-11-29 09:20:32'),
(178, 'sport', 'ICC Men\'s T20 World Cup ', '44395', 'Oman vs Papua New Guinea 2nd Match, First Round Group A ', 'enable', 'admin', '2021-01-07 06:20:54', NULL, '2021-01-07 06:20:54'),
(179, 'sport', 'England tour of India ', '46850', 'India vs England 1st Test ', 'enable', 'admin', '2021-02-05 08:43:48', NULL, '2021-02-05 08:43:48'),
(180, 'sport', 'Indian Premier League ', '47551', 'Mumbai Indians vs Delhi Capitals 55th Match ', 'enable', 'admin', '2021-04-06 20:44:30', NULL, '2021-04-06 20:44:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_record_log`
--
ALTER TABLE `active_record_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ad_tech_playlist`
--
ALTER TABLE `ad_tech_playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `airtel_video`
--
ALTER TABLE `airtel_video`
  ADD PRIMARY KEY (`video_id`);

--
-- Indexes for table `anchors`
--
ALTER TABLE `anchors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anchor_user`
--
ALTER TABLE `anchor_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bucket`
--
ALTER TABLE `bucket`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cms_user`
--
ALTER TABLE `cms_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `headline`
--
ALTER TABLE `headline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_code`);

--
-- Indexes for table `most_trending_video`
--
ALTER TABLE `most_trending_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `share_category_video`
--
ALTER TABLE `share_category_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_auth_assignment`
--
ALTER TABLE `tbl_auth_assignment`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_auth_item`
--
ALTER TABLE `tbl_auth_item`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tbl_auth_rule`
--
ALTER TABLE `tbl_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tv_app_trending_video`
--
ALTER TABLE `tv_app_trending_video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_activity_log`
--
ALTER TABLE `user_activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log_activity`
--
ALTER TABLE `user_log_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_tag`
--
ALTER TABLE `video_tag`
  ADD PRIMARY KEY (`video_tag_video_id`);

--
-- Indexes for table `web_trending_video`
--
ALTER TABLE `web_trending_video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `share_category_video`
--
ALTER TABLE `share_category_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
