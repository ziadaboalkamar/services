-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 28, 2022 at 03:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ust_service`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`ust`@`%` FUNCTION `json_extract` (`details` TEXT, `required_field` VARCHAR(255)) RETURNS TEXT CHARSET latin1 BEGIN
        SET details = SUBSTRING_INDEX(details, "{", -1);
        SET details = SUBSTRING_INDEX(details, "}", 1);
        RETURN TRIM(
            BOTH '"' FROM SUBSTRING_INDEX(
                SUBSTRING_INDEX(
                    SUBSTRING_INDEX(
                        details,
                        CONCAT(
                            '"',
                            SUBSTRING_INDEX(required_field,'$.', -1),
                            '":'
                        ),
                        -1
                    ),
                    ',"',
                    1
                ),
                ':',
                -1
            )
        ) ;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `longitude` double(20,17) NOT NULL DEFAULT 0.00000000000000000,
  `default` tinyint(1) DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `description`, `address`, `latitude`, `longitude`, `default`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Hotel', '578 Vandervort Radial Apt. 739\nBeattyland, PA 60339', 50.45523343000000000, 9.48870650000000000, 0, 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(2, 'Hotel', '746 Barton Orchard\nFreddyfurt, NV 15634', 51.86407609000000000, 10.13296537000000000, 0, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(3, 'Office', '18777 Zaria Harbor\nWest Sammieview, UT 82081', 51.76891779000000000, 9.66568229000000000, 0, 8, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(4, 'Home', '8154 Tania Junction Apt. 927\nColeshire, RI 41186-9247', 51.00197555000000000, 9.99637797000000000, 0, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(5, 'Work', '88439 Carmen Crossroad Suite 782\nNorth Kraigton, MD 76493', 51.07680288000000000, 10.70221863000000000, 0, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(6, 'Building', '70090 Trantow Square\nWest Raeganville, UT 67050-7876', 51.89906861000000000, 11.60772568000000000, 0, 6, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(7, 'Building', '964 Russel Ports Suite 944\nPort Holliestad, WA 24522-1386', 51.43973580000000000, 10.03830375000000000, 0, 7, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(8, 'Work', '764 Gaylord Terrace Apt. 389\nChamplinview, DE 01288', 51.97037979000000000, 11.53550723000000000, 0, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(9, 'Office', '8919 Thompson Point\nEast Jennings, WI 85779-2544', 51.10649152000000000, 10.48053536000000000, 0, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(10, 'Home', '10687 Durward Route Suite 433\nLeschburgh, MO 49291', 50.40085213000000000, 10.19626900000000000, 0, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(11, 'Building', '24592 Margaret Glen\nOkunevamouth, MS 17348-6037', 51.51226307000000000, 9.94112637000000000, 0, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(12, 'Office', '198 Waelchi Via Apt. 986\nNorth Oscar, IL 12687', 50.14831884000000000, 10.26505959000000000, 0, 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(13, 'Home', '42279 Swaniawski Falls\nGrantchester, RI 03724-1093', 50.06382849000000000, 10.28332569000000000, 0, 7, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(14, 'Building', '3774 Skylar Drive\nVitaberg, DE 98377', 51.60697073000000000, 9.31136840000000000, 0, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(15, 'Hotel', '467 Purdy Estate Suite 100\nSouth Meaghan, IA 36336-8925', 51.72506004000000000, 11.87981927000000000, 0, 6, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(16, 'Building', '623 Courtney Burg\nWest Sydniburgh, NJ 67020', 50.99208316000000000, 11.79797018000000000, 0, 7, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(17, 'Office', '562 Alf Brook\nNoeliaview, WY 04565-3377', 50.93043241000000000, 10.09963125000000000, 0, 6, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(18, 'Home', '91993 Bridget Crossroad\nBergeton, NV 86627-0136', 50.08062161000000000, 9.90197402000000000, 0, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(19, 'Work', '89294 Waelchi Rest\nDurwardmouth, FL 25155-5005', 51.04440587000000000, 9.91514012000000000, 0, 7, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(20, 'Home', '530 Tianna Manors Suite 022\nHayleybury, KY 64949-0295', 50.40028531000000000, 11.95744580000000000, 0, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(7, 'date_format', 'l jS F Y (H:i:s)'),
(8, 'language', 'ar'),
(17, 'is_human_date_format', '1'),
(18, 'app_name', 'Home Services'),
(19, 'app_short_description', 'Manage Mobile Application'),
(20, 'mail_driver', 'smtp'),
(21, 'mail_host', 'smtp.hostinger.com'),
(22, 'mail_port', '587'),
(23, 'mail_username', 'test@demo.com'),
(24, 'mail_password', '-'),
(25, 'mail_encryption', 'ssl'),
(26, 'mail_from_address', 'test@demo.com'),
(27, 'mail_from_name', 'Smarter Vision'),
(30, 'timezone', 'America/Montserrat'),
(32, 'theme_contrast', 'light'),
(33, 'theme_color', 'primary'),
(34, 'app_logo', '020a2dd4-4277-425a-b450-426663f52633'),
(35, 'nav_color', 'navbar-dark navbar-navy'),
(38, 'logo_bg_color', 'text-light  navbar-navy'),
(66, 'default_role', 'admin'),
(68, 'facebook_app_id', '518416208939727'),
(69, 'facebook_app_secret', '93649810f78fa9ca0d48972fee2a75cd'),
(71, 'twitter_app_id', 'twitter'),
(72, 'twitter_app_secret', 'twitter 1'),
(74, 'google_app_id', '527129559488-roolg8aq110p8r1q952fqa9tm06gbloe.apps.googleusercontent.com'),
(75, 'google_app_secret', 'FpIi8SLgc69ZWodk-xHaOrxn'),
(77, 'enable_google', '1'),
(78, 'enable_facebook', '1'),
(93, 'enable_stripe', '1'),
(94, 'stripe_key', 'pk_test_pltzOnX3zsUZMoTTTVUL4O41'),
(95, 'stripe_secret', 'sk_test_o98VZx3RKDUytaokX4My3a20'),
(101, 'custom_field_models.0', 'App\\Models\\User'),
(104, 'default_tax', '10'),
(107, 'default_currency', '$'),
(108, 'fixed_header', '1'),
(109, 'fixed_footer', '0'),
(110, 'fcm_key', 'AAAAHMZiAQA:APA91bEb71b5sN5jl-w_mmt6vLfgGY5-_CQFxMQsVEfcwO3FAh4-mk1dM6siZwwR3Ls9U0pRDpm96WN1AmrMHQ906GxljILqgU2ZB6Y1TjiLyAiIUETpu7pQFyicER8KLvM9JUiXcfWK'),
(111, 'enable_notifications', '1'),
(112, 'paypal_username', 'sb-z3gdq482047_api1.business.example.com'),
(113, 'paypal_password', '-'),
(114, 'paypal_secret', '-'),
(115, 'enable_paypal', '1'),
(116, 'main_color', '#F4841F'),
(117, 'main_dark_color', '#F4841F'),
(118, 'second_color', '#08143A'),
(119, 'second_dark_color', '#CCCCDD'),
(120, 'accent_color', '#8C9DA8'),
(121, 'accent_dark_color', '#9999AA'),
(122, 'scaffold_dark_color', '#2C2C2C'),
(123, 'scaffold_color', '#FAFAFA'),
(124, 'google_maps_key', '-'),
(125, 'mobile_language', 'en'),
(126, 'app_version', '1.0.0'),
(127, 'enable_version', '1'),
(128, 'default_currency_id', '1'),
(129, 'default_currency_code', 'USD'),
(130, 'default_currency_decimal_digits', '2'),
(131, 'default_currency_rounding', '0'),
(132, 'currency_right', '1'),
(133, 'distance_unit', 'km'),
(134, 'default_theme', 'light'),
(135, 'enable_paystack', '1'),
(136, 'paystack_key', 'pk_test_d754715fa3fa9048c9ab2832c440fb183d7c91f5'),
(137, 'paystack_secret', 'sk_test_66f87edaac94f8adcb28fdf7452f12ccc63d068d'),
(138, 'enable_flutterwave', '1'),
(139, 'flutterwave_key', 'FLWPUBK_TEST-d465ba7e4f6b86325cb9881835726402-X'),
(140, 'flutterwave_secret', 'FLWSECK_TEST-d3f8801da31fc093fb1207ea34e68fbb-X'),
(141, 'enable_stripe_fpx', '1'),
(142, 'stripe_fpx_key', 'pk_test_51IQ0zvB0wbAJesyPLo3x4LRgOjM65IkoO5hZLHOMsnO2RaF0NlH7HNOfpCkjuLSohvdAp30U5P1wKeH98KnwXkOD00mMDavaFX'),
(143, 'stripe_fpx_secret', 'sk_test_51IQ0zvB0wbAJesyPUtR7yGdyOR7aGbMQAX5Es9P56EDUEsvEQAC0NBj7JPqFuJEYXrvSCm5OPRmGaUQBswjkRxVB00mz8xhkFX'),
(144, 'enable_paymongo', '1'),
(145, 'paymongo_key', 'pk_test_iD6aYYm4yFuvkuisyU2PGSYH'),
(146, 'paymongo_secret', 'sk_test_oxD79bMKxb8sA47ZNyYPXwf3'),
(147, 'provider_app_name', 'Service Provider'),
(148, 'default_country_code', 'DE'),
(149, 'enable_otp', '0');

-- --------------------------------------------------------

--
-- Table structure for table `availability_hours`
--

CREATE TABLE `availability_hours` (
  `id` int(10) UNSIGNED NOT NULL,
  `day` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monday',
  `start_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_at` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `availability_hours`
--

INSERT INTO `availability_hours` (`id`, `day`, `start_at`, `end_at`, `data`, `e_provider_id`) VALUES
(1, 'tuesday', '10:00', '19:00', '{\"en\":\"Temporibus non dolorem totam quas provident.\"}', 12),
(2, 'tuesday', '10:00', '21:00', '{\"en\":\"Sint aliquam cupiditate illum eos qui vel magnam.\"}', 17),
(3, 'thursday', '11:00', '22:00', '{\"en\":\"Aut facere voluptate quam.\"}', 8),
(4, 'friday', '12:00', '19:00', '{\"en\":\"Minima et magnam qui quaerat fugit sed adipisci.\"}', 2),
(5, 'thursday', '03:00', '17:00', '{\"en\":\"Consequuntur voluptas accusantium nostrum.\"}', 5),
(6, 'monday', '05:00', '23:00', '{\"en\":\"Est optio atque error repudiandae debitis iusto.\"}', 12),
(7, 'sunday', '10:00', '23:00', '{\"en\":\"Illo omnis rem odit.\"}', 11),
(8, 'wednesday', '11:00', '22:00', '{\"en\":\"Quasi dolorum sunt asperiores.\"}', 14),
(9, 'friday', '02:00', '16:00', '{\"en\":\"Dolor et nulla officiis sequi.\"}', 13),
(10, 'thursday', '02:00', '19:00', '{\"en\":\"Ullam quae odio sit quia sit.\"}', 15),
(11, 'monday', '02:00', '20:00', '{\"en\":\"Ipsam ut et aut impedit.\"}', 5),
(12, 'thursday', '09:00', '19:00', '{\"en\":\"Vel vitae aperiam id illum et.\"}', 7),
(13, 'sunday', '10:00', '23:00', '{\"en\":\"Non aut ut illum placeat natus.\"}', 6),
(14, 'thursday', '03:00', '17:00', '{\"en\":\"Reiciendis et sequi quam eaque omnis repudiandae.\"}', 1),
(15, 'thursday', '06:00', '17:00', '{\"en\":\"Aperiam temporibus velit impedit corporis.\"}', 9),
(16, 'sunday', '04:00', '20:00', '{\"en\":\"Aut autem similique assumenda.\"}', 1),
(17, 'sunday', '10:00', '23:00', '{\"en\":\"Quis voluptas hic aut illo sequi nemo.\"}', 5),
(18, 'saturday', '04:00', '17:00', '{\"en\":\"Pariatur doloribus et et voluptatem.\"}', 7),
(19, 'wednesday', '09:00', '15:00', '{\"en\":\"Aut deleniti laboriosam est non.\"}', 13),
(20, 'wednesday', '04:00', '21:00', '{\"en\":\"Odio quis maiores similique.\"}', 2),
(21, 'wednesday', '10:00', '21:00', '{\"en\":\"Sit error maiores molestiae quas.\"}', 13),
(22, 'saturday', '10:00', '23:00', '{\"en\":\"Quod minima vero quisquam numquam beatae.\"}', 10),
(23, 'wednesday', '04:00', '16:00', '{\"en\":\"Placeat adipisci quo fugiat fugit libero vel.\"}', 9),
(24, 'wednesday', '11:00', '23:00', '{\"en\":\"Dolorem et ab totam amet voluptatibus voluptatem.\"}', 3),
(25, 'saturday', '07:00', '22:00', '{\"en\":\"Optio ut voluptas eius eaque necessitatibus.\"}', 9),
(26, 'monday', '03:00', '19:00', '{\"en\":\"Sapiente sed vero beatae laudantium.\"}', 16),
(27, 'sunday', '02:00', '17:00', '{\"en\":\"Sunt ipsam aut amet eum voluptate illum.\"}', 7),
(28, 'tuesday', '08:00', '14:00', '{\"en\":\"Optio consequuntur temporibus perferendis.\"}', 11),
(29, 'thursday', '05:00', '18:00', '{\"en\":\"Quod culpa minus praesentium veritatis.\"}', 10),
(30, 'thursday', '04:00', '23:00', '{\"en\":\"Ut qui et molestiae odit.\"}', 8),
(31, 'tuesday', '04:00', '14:00', '{\"en\":\"Qui non cumque officiis qui nam sapiente.\"}', 10),
(32, 'saturday', '07:00', '14:00', '{\"en\":\"Et consequatur dignissimos tempore amet.\"}', 18),
(33, 'thursday', '08:00', '13:00', '{\"en\":\"Soluta enim iusto non in.\"}', 11),
(34, 'wednesday', '10:00', '14:00', '{\"en\":\"Dolor quidem eveniet ducimus libero non.\"}', 13),
(35, 'monday', '05:00', '16:00', '{\"en\":\"Officia tempore ut non.\"}', 2),
(36, 'monday', '09:00', '20:00', '{\"en\":\"Vero quam molestiae repudiandae eum et.\"}', 14),
(37, 'thursday', '10:00', '20:00', '{\"en\":\"Molestias quis tempora fuga sit.\"}', 11),
(38, 'sunday', '09:00', '21:00', '{\"en\":\"Nulla similique aspernatur eos placeat.\"}', 10),
(39, 'saturday', '02:00', '23:00', '{\"en\":\"A aut et ut facilis.\"}', 11),
(40, 'wednesday', '02:00', '19:00', '{\"en\":\"Dolores libero veniam sapiente laborum.\"}', 2),
(41, 'wednesday', '04:00', '18:00', '{\"en\":\"Dolorum dolores nesciunt fugiat non minus.\"}', 13),
(42, 'saturday', '12:00', '13:00', '{\"en\":\"Inventore repudiandae voluptate architecto modi.\"}', 5),
(43, 'thursday', '11:00', '19:00', '{\"en\":\"Expedita quasi et architecto qui.\"}', 3),
(44, 'monday', '11:00', '14:00', '{\"en\":\"Soluta nam qui nisi officia corrupti.\"}', 17),
(45, 'tuesday', '07:00', '20:00', '{\"en\":\"Saepe dolorem reiciendis et et et qui.\"}', 9),
(46, 'saturday', '08:00', '14:00', '{\"en\":\"Dolore voluptatem totam perferendis est et harum.\"}', 2),
(47, 'thursday', '10:00', '17:00', '{\"en\":\"Vitae quo sint aut qui.\"}', 11),
(48, 'friday', '04:00', '17:00', '{\"en\":\"Ea veniam praesentium rerum dolores expedita.\"}', 14),
(49, 'wednesday', '11:00', '17:00', '{\"en\":\"Nostrum repellat omnis adipisci aut.\"}', 2),
(50, 'saturday', '02:00', '21:00', '{\"en\":\"Et et aut eum id sed tempora dolores.\"}', 11);

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `title`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Dicta sint earum veniam dolores temporibus. Ut qui aut atque aut est optio sint.\"}', '{\"en\":\"Dinah stop in the wind, and was surprised to find herself talking familiarly with them, as if she could not answer without a great thistle, to keep back the wandering hair that curled all over with.\"}', 12, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(2, '{\"en\":\"Et assumenda ex debitis culpa blanditiis id. Omnis non qui quibusdam.\"}', '{\"en\":\"Mouse. \'--I proceed. \\\"Edwin and Morcar, the earls of Mercia and Northumbria, declared for him: and even Stigand, the patriotic archbishop of Canterbury, found it advisable--\\\"\' \'Found WHAT?\' said the.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(3, '{\"en\":\"Quo est accusamus debitis. Veritatis et facere esse quaerat. Eveniet perspiciatis quod eum sed.\"}', '{\"en\":\"I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go after that into a butterfly, I should think you could keep it to the dance. Would not, could not, would not, could not, would not, could not.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(4, '{\"en\":\"Qui qui dolorum consequuntur. Voluptatem optio et ab. Nemo dolore at rerum dolores debitis et fuga.\"}', '{\"en\":\"Five and Seven said nothing, but looked at her, and said, very gravely, \'I think, you ought to eat the comfits: this caused some noise and confusion, as the other.\' As soon as she went on, \'if you.\"}', 17, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(5, '{\"en\":\"Deserunt in et dolorem nemo dolore. Ut sed impedit a. Molestias possimus aperiam esse suscipit.\"}', '{\"en\":\"Between yourself and me.\' \'That\'s the reason they\'re called lessons,\' the Gryphon never learnt it.\' \'Hadn\'t time,\' said the one who had got so close to her, And mentioned me to him: She gave me a.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(6, '{\"en\":\"Officiis deserunt maiores molestiae minima est amet rem omnis. Rerum non sit eveniet.\"}', '{\"en\":\"Some of the mushroom, and crawled away in the last few minutes, and began talking to herself, \'after such a thing. After a while, finding that nothing more happened, she decided to remain where she.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(7, '{\"en\":\"Veritatis fuga ea reprehenderit harum. Illo at quaerat illum. Molestiae aut et nostrum sed.\"}', '{\"en\":\"Queen was to eat some of them hit her in a whisper.) \'That would be so easily offended, you know!\' The Mouse only growled in reply. \'Please come back with the next moment she felt a little scream.\"}', 18, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(8, '{\"en\":\"Quis iure ex sit vel et. Qui magni numquam et et. Dolore sint labore totam fuga velit aut.\"}', '{\"en\":\"By the time she went on, spreading out the verses to himself: \'\\\"WE KNOW IT TO BE TRUE--\\\" that\'s the jury-box,\' thought Alice, \'as all the rats and--oh dear!\' cried Alice, jumping up and say \\\"How.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(9, '{\"en\":\"Et quas eum ipsa molestiae eaque. Non est non qui quis corrupti modi non.\"}', '{\"en\":\"Soo--oop! Soo--oop of the same thing as \\\"I get what I was sent for.\' \'You ought to tell me your history, you know,\' said the Dormouse, without considering at all like the look of it had been. But.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(10, '{\"en\":\"Quia quasi molestiae nulla eos recusandae. Minus odit voluptatem quis quis ad et quisquam.\"}', '{\"en\":\"CHAPTER III. A Caucus-Race and a sad tale!\' said the Mock Turtle, \'but if they do, why then they\'re a kind of rule, \'and vinegar that makes the world go round!\\\"\' \'Somebody said,\' Alice whispered.\"}', 13, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(11, '{\"en\":\"Quo est corporis ut et sequi unde sunt ad. Officia illum distinctio doloribus ut.\"}', '{\"en\":\"She generally gave herself very good height indeed!\' said the March Hare,) \'--it was at in all their simple joys, remembering her own ears for having cheated herself in the court!\' and the Queen.\"}', 11, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(12, '{\"en\":\"Sed qui voluptatem qui nam. Quo in quae corporis reprehenderit.\"}', '{\"en\":\"No, no! You\'re a serpent; and there\'s no name signed at the number of executions the Queen was silent. The Dormouse shook itself, and began bowing to the three gardeners instantly threw themselves.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(13, '{\"en\":\"Quia molestias ut voluptatem eos omnis. Autem voluptatem est officiis animi.\"}', '{\"en\":\"Alice, in a frightened tone. \'The Queen will hear you! You see, she came upon a Gryphon, lying fast asleep in the sand with wooden spades, then a row of lodging houses, and behind it when she had.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(14, '{\"en\":\"Error eligendi facere corporis dolorem illo deserunt velit. Recusandae dolorum earum aut ut.\"}', '{\"en\":\"There were doors all round the hall, but they were nowhere to be listening, so she set to work nibbling at the cook and the beak-- Pray how did you begin?\' The Hatter shook his head sadly. \'Do I.\"}', 17, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(15, '{\"en\":\"Magni corrupti non porro quis voluptatem. Ipsam quae aspernatur ut inventore et eos.\"}', '{\"en\":\"This time there were three little sisters,\' the Dormouse fell asleep instantly, and neither of the window, I only knew how to begin.\' He looked at it, busily painting them red. Alice thought to.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(16, '{\"en\":\"Quasi qui accusantium animi excepturi sit odio. Omnis neque ut molestiae odit sunt facilis.\"}', '{\"en\":\"Alice, very loudly and decidedly, and there she saw maps and pictures hung upon pegs. She took down a jar from one of them say, \'Look out now, Five! Don\'t go splashing paint over me like a.\"}', 12, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(17, '{\"en\":\"Ea exercitationem aut et sapiente hic sunt ut. Et nobis ut omnis. Vel est ad quis doloribus.\"}', '{\"en\":\"Then followed the Knave was standing before them, in chains, with a smile. There was nothing so VERY remarkable in that; nor did Alice think it was,\' said the Cat, as soon as look at me like that!\'.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(18, '{\"en\":\"Ducimus libero dolor esse facilis non. Voluptas vero voluptate quod neque.\"}', '{\"en\":\"Alice. \'And where HAVE my shoulders got to? And oh, I wish I hadn\'t quite finished my tea when I get it home?\' when it saw Alice. It looked good-natured, she thought: still it was too small, but at.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(19, '{\"en\":\"Sapiente aut earum laborum sint. Autem aut laudantium nisi ea. Voluptas error expedita omnis.\"}', '{\"en\":\"Said he thanked the whiting kindly, but he would not open any of them. However, on the other birds tittered audibly. \'What I was a long tail, certainly,\' said Alice, very earnestly. \'I\'ve had.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(20, '{\"en\":\"Excepturi consequatur ab nam ratione alias. Fuga fugit vel tenetur nobis quas expedita voluptatem.\"}', '{\"en\":\"King said, for about the twentieth time that day. \'That PROVES his guilt,\' said the King had said that day. \'No, no!\' said the Hatter. He came in sight of the sort. Next came an angry tone, \'Why.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(21, '{\"en\":\"Ex est minus dolorem quae et. Quidem pariatur quas eos consequatur eum. Quas architecto eos qui et.\"}', '{\"en\":\"And argued each case with my wife; And the Gryphon went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'And what are they made of?\' \'Pepper, mostly,\' said.\"}', 11, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(22, '{\"en\":\"Rerum asperiores facere id est nihil. Velit rerum omnis totam cum autem quia quia nobis.\"}', '{\"en\":\"Dormouse; \'--well in.\' This answer so confused poor Alice, \'it would have done just as she swam lazily about in the last time she heard a little snappishly. \'You\'re enough to get hold of this sort.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(23, '{\"en\":\"Modi praesentium sint autem commodi mollitia et. Aut cupiditate odio alias aspernatur aut maxime.\"}', '{\"en\":\"Who ever saw one that size? Why, it fills the whole she thought to herself. \'I dare say you\'re wondering why I don\'t believe you do lessons?\' said Alice, \'but I know all sorts of things--I can\'t.\"}', 11, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(24, '{\"en\":\"Aspernatur odio praesentium similique quibusdam. Fugiat nisi non blanditiis nisi delectus.\"}', '{\"en\":\"LITTLE larger, sir, if you hold it too long; and that makes you forget to talk. I can\'t get out at all like the three gardeners, but she could not tell whether they were IN the well,\' Alice said.\"}', 5, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(25, '{\"en\":\"Repellat officiis cumque eum dignissimos. Earum maiores quia in id autem et accusantium qui.\"}', '{\"en\":\"The question is, what did the archbishop find?\' The Mouse did not notice this question, but hurriedly went on, taking first one side and then I\'ll tell him--it was for bringing the cook and the.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(26, '{\"en\":\"Cumque minima repellendus atque et tempore. Voluptates eos enim dolor et officia iusto sit.\"}', '{\"en\":\"MINE.\' The Queen turned angrily away from him, and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(27, '{\"en\":\"Vel voluptas dolores facere optio eum assumenda repudiandae. Non totam rerum aspernatur dicta.\"}', '{\"en\":\"Alice heard the Rabbit came up to the Gryphon. \'They can\'t have anything to put down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go down the little door was shut again.\"}', 14, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(28, '{\"en\":\"Laborum quibusdam temporibus eos sapiente omnis. Distinctio sed adipisci animi voluptatem non.\"}', '{\"en\":\"Duchess. An invitation for the hedgehogs; and in a deep voice, \'are done with a yelp of delight, which changed into alarm in another moment that it was over at last, and they went on \'And how did.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(29, '{\"en\":\"Facilis unde sint adipisci et dolorum. Consequuntur sunt corrupti voluptate tenetur.\"}', '{\"en\":\"You grant that?\' \'I suppose they are the jurors.\' She said the Hatter. \'Nor I,\' said the Mock Turtle sighed deeply, and began, in a loud, indignant voice, but she had grown in the last time she went.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(30, '{\"en\":\"Perferendis dolorem possimus id tenetur officiis est. Et eos excepturi beatae sed repudiandae quis.\"}', '{\"en\":\"King replied. Here the other side will make you grow taller, and the little crocodile Improve his shining tail, And pour the waters of the what?\' said the Mock Turtle; \'but it doesn\'t understand.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(31, '{\"en\":\"Quam non nisi quo. Aut eius omnis ipsum ex ut. Et corrupti ipsam quia.\"}', '{\"en\":\"I can\'t understand it myself to begin with,\' said the Mouse. \'Of course,\' the Gryphon said to the beginning again?\' Alice ventured to remark. \'Tut, tut, child!\' said the Dodo could not tell whether.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(32, '{\"en\":\"Ut quam ut libero ex. Laudantium consequuntur voluptas alias est et occaecati at.\"}', '{\"en\":\"Let this be a great deal too far off to the waving of the month, and doesn\'t tell what o\'clock it is!\' As she said to herself, \'I wonder how many hours a day or two: wouldn\'t it be of very little.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(33, '{\"en\":\"Qui quia voluptates quia aliquam quo. Accusamus commodi aperiam ipsam facilis dolorum ut.\"}', '{\"en\":\"Alice could see this, as she went back to the door. \'Call the next thing was to twist it up into the wood for fear of their wits!\' So she began shrinking directly. As soon as it settled down again.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(34, '{\"en\":\"Et sapiente nobis temporibus quia voluptas ad vel. Perspiciatis est hic aut amet blanditiis.\"}', '{\"en\":\"I wish you wouldn\'t mind,\' said Alice: \'I don\'t like the right way to change them--\' when she found a little house in it a little before she made her so savage when they liked, so that by the.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(35, '{\"en\":\"Possimus esse vel iusto. Voluptatum quia sed laboriosam iste mollitia voluptates.\"}', '{\"en\":\"I can\'t put it right; \'not that it was very deep, or she should chance to be a very interesting dance to watch,\' said Alice, (she had grown up,\' she said aloud. \'I shall do nothing of the house, and.\"}', 10, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(36, '{\"en\":\"Id modi voluptas qui doloribus. Amet asperiores impedit suscipit quisquam.\"}', '{\"en\":\"So she swallowed one of the room. The cook threw a frying-pan after her as she went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. \'You make me giddy.\' And then, turning to the other, and.\"}', 12, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(37, '{\"en\":\"Est totam laborum a eaque qui aut temporibus. Voluptatem sed sit dicta.\"}', '{\"en\":\"Off with his head!\' or \'Off with his head!\' she said, \'than waste it in asking riddles that have no answers.\' \'If you do. I\'ll set Dinah at you!\' There was nothing on it were white, but there was.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(38, '{\"en\":\"Error sed non aut ea. Quia corporis non asperiores neque. Eum consequatur non sapiente est in qui.\"}', '{\"en\":\"It was high time to see a little scream of laughter. \'Oh, hush!\' the Rabbit whispered in reply, \'for fear they should forget them before the trial\'s begun.\' \'They\'re putting down their names,\' the.\"}', 18, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(39, '{\"en\":\"Sapiente esse atque quis molestiae sunt sit reiciendis. Enim eum animi quia doloribus et earum.\"}', '{\"en\":\"WHAT things?\' said the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, she found this a very hopeful tone.\"}', 17, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(40, '{\"en\":\"Sit velit aut eos voluptas. Veritatis nisi qui laborum et. Minima non esse aut quia voluptatem.\"}', '{\"en\":\"Queen furiously, throwing an inkstand at the picture.) \'Up, lazy thing!\' said Alice, as the door and went in. The door led right into it. \'That\'s very curious.\' \'It\'s all his fancy, that: they never.\"}', 13, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(41, '{\"en\":\"Quis laboriosam at harum adipisci ducimus cumque iste harum. A unde sint sunt et quos debitis.\"}', '{\"en\":\"And she began again: \'Ou est ma chatte?\' which was immediately suppressed by the officers of the Queen had ordered. They very soon had to do next, when suddenly a White Rabbit interrupted.\"}', 14, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(42, '{\"en\":\"Quae dolorem cum est voluptatem blanditiis. Laborum soluta nisi voluptas qui eveniet neque.\"}', '{\"en\":\"CAN all that stuff,\' the Mock Turtle. \'Hold your tongue!\' added the Queen. \'I haven\'t the slightest idea,\' said the Queen, and in THAT direction,\' waving the other queer noises, would change (she.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(43, '{\"en\":\"Animi hic id in expedita. Laborum explicabo cumque commodi. Ut voluptatem ipsam sequi odit.\"}', '{\"en\":\"I\'ve got to the heads of the court, without even looking round. \'I\'ll fetch the executioner ran wildly up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t know it to speak.\"}', 10, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(44, '{\"en\":\"Ratione eaque explicabo laborum. Eius soluta iste hic non qui in.\"}', '{\"en\":\"Alice heard the Queen say only yesterday you deserved to be lost, as she could, and waited till she got to grow here,\' said the Hatter. \'I told you that.\' \'If I\'d been the whiting,\' said Alice.\"}', 8, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(45, '{\"en\":\"Reprehenderit occaecati cupiditate quis quis. Facilis et aut tempore mollitia.\"}', '{\"en\":\"The Queen turned angrily away from her as she could, for her to speak again. In a minute or two to think that very few things indeed were really impossible. There seemed to be a LITTLE larger, sir.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(46, '{\"en\":\"Blanditiis voluptatum aut ut necessitatibus. Est natus vitae ut ad saepe.\"}', '{\"en\":\"I was thinking I should be free of them didn\'t know how to get rather sleepy, and went to the Knave. The Knave did so, and giving it something out of the right-hand bit to try the effect: the next.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(47, '{\"en\":\"Eos vel et et consequatur et autem. Non doloremque nostrum voluptatem quo. Et tempora tempora hic.\"}', '{\"en\":\"THIS size: why, I should have croqueted the Queen\'s absence, and were resting in the morning, just time to begin at HIS time of life. The King\'s argument was, that she ran off at once: one old.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(48, '{\"en\":\"Ratione ad cumque eum corrupti. Iste voluptas minima sed sed. Voluptas qui natus saepe.\"}', '{\"en\":\"Hatter went on, very much confused, \'I don\'t know of any that do,\' Alice hastily replied; \'at least--at least I know all the children she knew, who might do very well without--Maybe it\'s always.\"}', 12, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(49, '{\"en\":\"Quia quia dicta deleniti. Eos pariatur et sed facilis. Quos ad aut in voluptatem.\"}', '{\"en\":\"Majesty,\' said the sage, as he spoke, and then added them up, and reduced the answer to it?\' said the Duchess; \'and the moral of that is--\\\"Be what you mean,\' the March Hare,) \'--it was at the sides.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(50, '{\"en\":\"Ea tempore eligendi explicabo expedita velit sit. In rerum ut dolor nesciunt.\"}', '{\"en\":\"WAS a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice got up very carefully, with one finger for the hot day made her feel very sleepy and stupid), whether.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `e_service` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `booking_status_id` int(10) UNSIGNED DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `coupon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_at` datetime DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `hint` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_statuses`
--

CREATE TABLE `booking_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking_statuses`
--

INSERT INTO `booking_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Received', 1, '2021-01-26 03:25:46', '2021-01-30 01:56:35'),
(2, 'In Progress', 40, '2021-01-26 03:26:02', '2021-02-17 05:56:52'),
(3, 'On the Way', 20, '2021-01-28 15:47:23', '2021-02-16 20:10:13'),
(4, 'Accepted', 10, '2021-02-16 20:09:29', '2021-02-16 20:10:06'),
(5, 'Ready', 30, '2021-02-16 20:11:50', '2021-02-17 05:56:42'),
(6, 'Done', 50, '2021-02-17 05:57:02', '2021-02-17 05:57:02'),
(7, 'Failed', 60, '2021-02-17 05:58:36', '2021-02-17 05:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `featured` tinyint(1) DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `color`, `description`, `order`, `featured`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Car Services', '#ff9f43', '<p>Categories for all cars services</p>', 1, 1, NULL, '2021-01-20 01:01:35', '2021-01-31 22:19:56'),
(2, 'Medical Services', '#0abde3', '<p>Categories for all Medical Services<br></p>', 2, 1, NULL, '2021-01-20 02:05:00', '2021-01-31 21:35:11'),
(3, 'Laundry Service', '#ee5253', '<p>Category for allأ‚آ Laundry Service</p>', 3, 1, NULL, '2021-01-31 21:37:04', '2021-02-02 08:33:10'),
(4, 'Beauty & Hair Cuts', '#10ac84', '<p>Category for Hair Cuts and Barber</p>', 4, 0, NULL, '2021-01-31 21:38:37', '2021-02-23 22:37:09'),
(5, 'Washing & Cleaning', '#5f27cd', '<p>Category for&nbsp;Washing &amp; Cleaning&nbsp;</p>', 5, 0, NULL, '2021-01-31 21:42:02', '2021-01-31 21:42:02'),
(6, 'Media & Photography', '#ff9f43', '<p>Category for Media & Photography</p>', 6, 0, NULL, '2021-01-31 21:43:20', '2021-01-31 22:55:51'),
(7, 'Sewer Cleaning', '#5f27cd', '<p>Category for Sewer Cleaning<br></p>', 1, 0, 5, '2021-01-31 22:46:15', '2021-01-31 22:46:30'),
(8, 'Carpet Cleaning', '#5f27cd', '<p>Category for Carpet Cleaning<br></p>', 2, 0, 5, '2021-01-31 22:47:23', '2021-01-31 22:47:23'),
(9, 'Wheel Repair', '#5f27cd', '<p>Category for Wheel Repair<br></p>', 1, 0, 1, '2021-01-31 22:49:40', '2021-01-31 22:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_digits` tinyint(3) UNSIGNED DEFAULT NULL,
  `rounding` tinyint(3) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `decimal_digits`, `rounding`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', '$', 'USD', 2, 0, '2020-10-22 22:50:48', '2020-10-22 22:50:48'),
(2, 'Euro', 'أ¢â€ڑآ¬', 'EUR', 2, 0, '2020-10-22 22:51:39', '2020-10-22 22:51:39'),
(3, 'Indian Rupee', 'أ آ¦إ¸أ آ¦â€¢أ آ¦آ¾', 'INR', 2, 0, '2020-10-22 22:52:50', '2020-10-22 22:52:50'),
(4, 'Indonesian Rupiah', 'Rp', 'IDR', 0, 0, '2020-10-22 22:53:22', '2020-10-22 22:53:22'),
(5, 'Brazilian Real', 'R$', 'BRL', 2, 0, '2020-10-22 22:54:00', '2020-10-22 22:54:00'),
(6, 'Cambodian Riel', 'أ،إ¸â€؛', 'KHR', 2, 0, '2020-10-22 22:55:51', '2020-10-22 22:55:51'),
(7, 'Vietnamese Dong', 'أ¢â€ڑآ«', 'VND', 0, 0, '2020-10-22 22:56:26', '2020-10-22 22:56:26');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(56) COLLATE utf8mb4_unicode_ci NOT NULL,
  `values` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `in_table` tinyint(1) DEFAULT NULL,
  `bootstrap_column` tinyint(4) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `custom_field_model` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `type`, `values`, `disabled`, `required`, `in_table`, `bootstrap_column`, `order`, `custom_field_model`, `created_at`, `updated_at`) VALUES
(5, 'bio', 'textarea', NULL, 0, 0, 0, 6, 1, 'App\\Models\\User', '2019-09-07 04:43:58', '2019-09-07 04:43:58'),
(6, 'address', 'text', NULL, 0, 0, 0, 6, 3, 'App\\Models\\User', '2019-09-07 04:49:22', '2019-09-07 04:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `customizable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customizable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_field_values`
--

INSERT INTO `custom_field_values` (`id`, `value`, `view`, `custom_field_id`, `customizable_type`, `customizable_id`, `created_at`, `updated_at`) VALUES
(30, 'Explicabo. Eum provi.&nbsp;', 'Explicabo. Eum provi.&nbsp;', 5, 'App\\Models\\User', 2, '2019-09-07 04:52:30', '2021-02-02 19:32:57'),
(31, 'Modi est libero qui', 'Modi est libero qui', 6, 'App\\Models\\User', 2, '2019-09-07 04:52:30', '2021-02-02 19:32:57'),
(33, 'Consequatur error ip.&nbsp;', 'Consequatur error ip.&nbsp;', 5, 'App\\Models\\User', 1, '2019-09-07 04:53:58', '2021-02-02 19:32:01'),
(34, 'Qui vero ratione vel', 'Qui vero ratione vel', 6, 'App\\Models\\User', 1, '2019-09-07 04:53:58', '2021-02-02 19:32:01'),
(36, 'Dolor optio, error e', 'Dolor optio, error e', 5, 'App\\Models\\User', 3, '2019-10-16 00:21:32', '2021-02-02 19:33:23'),
(37, 'Voluptatibus ad ipsu', 'Voluptatibus ad ipsu', 6, 'App\\Models\\User', 3, '2019-10-16 00:21:32', '2021-02-02 19:33:23'),
(39, 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 'Faucibus ornare suspendisse sed nisi lacus sed. Pellentesque sit amet porttitor eget dolor morbi non arcu. Eu scelerisque felis imperdiet proin fermentum leo vel orci porta', 5, 'App\\Models\\User', 4, '2019-10-17 02:31:46', '2019-10-17 02:31:46'),
(40, 'Sequi molestiae ipsa1', 'Sequi molestiae ipsa1', 6, 'App\\Models\\User', 4, '2019-10-17 02:31:46', '2021-02-22 07:32:10'),
(42, 'Omnis fugiat et cons.', 'Omnis fugiat et cons.', 5, 'App\\Models\\User', 5, '2019-12-16 02:49:44', '2021-02-02 19:29:47'),
(43, 'Consequatur delenit', 'Consequatur delenit', 6, 'App\\Models\\User', 5, '2019-12-16 02:49:44', '2021-02-02 19:29:47'),
(45, '<p>Short bio for this driver</p>', 'Short bio for this driver', 5, 'App\\Models\\User', 6, '2020-03-30 00:28:05', '2020-03-30 00:28:05'),
(46, '4722 Villa Drive', '4722 Villa Drive', 6, 'App\\Models\\User', 6, '2020-03-30 00:28:05', '2020-03-30 00:28:05'),
(48, 'Voluptatem. Omnis op.', 'Voluptatem. Omnis op.', 5, 'App\\Models\\User', 7, '2021-01-18 00:13:24', '2021-02-02 19:31:36'),
(49, 'Perspiciatis aut ei', 'Perspiciatis aut ei', 6, 'App\\Models\\User', 7, '2021-01-18 00:13:24', '2021-02-02 19:31:36'),
(51, 'sdfsdf56', 'sdfsdf56', 5, 'App\\Models\\User', 8, '2021-02-10 19:31:12', '2021-02-19 22:09:37'),
(52, 'Adressttt', 'Adressttt', 6, 'App\\Models\\User', 8, '2021-02-10 19:31:12', '2021-02-19 21:57:27'),
(53, NULL, '', 5, 'App\\Models\\User', 9, '2022-05-17 20:02:53', '2022-05-17 20:02:53'),
(54, NULL, NULL, 6, 'App\\Models\\User', 9, '2022-05-17 20:02:53', '2022-05-17 20:02:53'),
(55, NULL, '', 5, 'App\\Models\\User', 10, '2022-05-19 21:53:11', '2022-05-19 21:53:11'),
(56, NULL, NULL, 6, 'App\\Models\\User', 10, '2022-05-19 21:53:11', '2022-05-19 21:53:11'),
(57, NULL, '', 5, 'App\\Models\\User', 11, '2022-05-21 17:55:49', '2022-05-21 17:55:49'),
(58, NULL, NULL, 6, 'App\\Models\\User', 11, '2022-05-21 17:55:49', '2022-05-21 17:55:49'),
(59, NULL, '', 5, 'App\\Models\\User', 12, '2022-05-22 14:58:15', '2022-05-22 14:58:15'),
(60, NULL, NULL, 6, 'App\\Models\\User', 12, '2022-05-22 14:58:15', '2022-05-22 14:58:15'),
(61, NULL, '', 5, 'App\\Models\\User', 13, '2022-05-22 19:08:57', '2022-05-22 19:08:57'),
(62, NULL, NULL, 6, 'App\\Models\\User', 13, '2022-05-22 19:08:57', '2022-05-22 19:08:57'),
(63, NULL, '', 5, 'App\\Models\\User', 14, '2022-05-22 19:43:37', '2022-05-22 19:43:37'),
(64, NULL, NULL, 6, 'App\\Models\\User', 14, '2022-05-22 19:43:37', '2022-05-22 19:43:37'),
(65, NULL, '', 5, 'App\\Models\\User', 15, '2022-05-22 20:01:21', '2022-05-22 20:01:21'),
(66, NULL, NULL, 6, 'App\\Models\\User', 15, '2022-05-22 20:01:21', '2022-05-22 20:01:21'),
(67, NULL, '', 5, 'App\\Models\\User', 16, '2022-05-22 20:05:10', '2022-05-22 20:05:10'),
(68, NULL, NULL, 6, 'App\\Models\\User', 16, '2022-05-22 20:05:10', '2022-05-22 20:05:10'),
(69, NULL, '', 5, 'App\\Models\\User', 17, '2022-05-22 20:16:16', '2022-05-22 20:16:16'),
(70, NULL, NULL, 6, 'App\\Models\\User', 17, '2022-05-22 20:16:16', '2022-05-22 20:16:16'),
(71, NULL, '', 5, 'App\\Models\\User', 18, '2022-05-22 20:26:42', '2022-05-22 20:26:42'),
(72, NULL, NULL, 6, 'App\\Models\\User', 18, '2022-05-22 20:26:42', '2022-05-22 20:26:42'),
(73, NULL, '', 5, 'App\\Models\\User', 19, '2022-05-22 20:33:03', '2022-05-22 20:33:03'),
(74, NULL, NULL, 6, 'App\\Models\\User', 19, '2022-05-22 20:33:03', '2022-05-22 20:33:03'),
(75, NULL, '', 5, 'App\\Models\\User', 20, '2022-05-23 15:40:46', '2022-05-23 15:40:46'),
(76, NULL, NULL, 6, 'App\\Models\\User', 20, '2022-05-23 15:40:46', '2022-05-23 15:40:46'),
(77, NULL, '', 5, 'App\\Models\\User', 21, '2022-05-23 15:53:56', '2022-05-23 15:53:56'),
(78, NULL, NULL, 6, 'App\\Models\\User', 21, '2022-05-23 15:53:56', '2022-05-23 15:53:56'),
(79, NULL, '', 5, 'App\\Models\\User', 22, '2022-05-24 15:06:34', '2022-05-24 15:06:34'),
(80, NULL, NULL, 6, 'App\\Models\\User', 22, '2022-05-24 15:06:34', '2022-05-24 15:06:34'),
(81, NULL, '', 5, 'App\\Models\\User', 23, '2022-05-24 15:12:03', '2022-05-24 15:12:03'),
(82, NULL, NULL, 6, 'App\\Models\\User', 23, '2022-05-24 15:12:03', '2022-05-24 15:12:03'),
(83, NULL, '', 5, 'App\\Models\\User', 24, '2022-05-24 15:17:28', '2022-05-24 15:17:28'),
(84, NULL, NULL, 6, 'App\\Models\\User', 24, '2022-05-24 15:17:28', '2022-05-24 15:17:28'),
(85, NULL, '', 5, 'App\\Models\\User', 25, '2022-05-24 15:49:36', '2022-05-24 15:49:36'),
(86, NULL, NULL, 6, 'App\\Models\\User', 25, '2022-05-24 15:49:36', '2022-05-24 15:49:36'),
(87, NULL, '', 5, 'App\\Models\\User', 26, '2022-05-24 16:23:14', '2022-05-24 16:23:14'),
(88, NULL, NULL, 6, 'App\\Models\\User', 26, '2022-05-24 16:23:14', '2022-05-24 16:23:14'),
(89, NULL, '', 5, 'App\\Models\\User', 27, '2022-05-24 16:44:47', '2022-05-24 16:44:47'),
(90, NULL, NULL, 6, 'App\\Models\\User', 27, '2022-05-24 16:44:47', '2022-05-24 16:44:47'),
(91, NULL, '', 5, 'App\\Models\\User', 28, '2022-05-24 16:52:11', '2022-05-24 16:52:11'),
(92, NULL, NULL, 6, 'App\\Models\\User', 28, '2022-05-24 16:52:11', '2022-05-24 16:52:11'),
(93, NULL, '', 5, 'App\\Models\\User', 29, '2022-05-25 04:35:20', '2022-05-25 04:35:20'),
(94, NULL, NULL, 6, 'App\\Models\\User', 29, '2022-05-25 04:35:20', '2022-05-25 04:35:20'),
(95, NULL, '', 5, 'App\\Models\\User', 30, '2022-05-25 12:37:30', '2022-05-25 12:37:30'),
(96, NULL, NULL, 6, 'App\\Models\\User', 30, '2022-05-25 12:37:30', '2022-05-25 12:37:30'),
(97, NULL, '', 5, 'App\\Models\\User', 31, '2022-05-26 12:34:20', '2022-05-26 12:34:20'),
(98, NULL, NULL, 6, 'App\\Models\\User', 31, '2022-05-26 12:34:20', '2022-05-26 12:34:20'),
(99, NULL, '', 5, 'App\\Models\\User', 32, '2022-05-28 15:21:41', '2022-05-28 15:21:41'),
(100, NULL, NULL, 6, 'App\\Models\\User', 32, '2022-05-28 15:21:41', '2022-05-28 15:21:41'),
(101, NULL, '', 5, 'App\\Models\\User', 33, '2022-05-28 15:34:39', '2022-05-28 15:34:39'),
(102, NULL, NULL, 6, 'App\\Models\\User', 33, '2022-05-28 15:34:39', '2022-05-28 15:34:39'),
(103, NULL, '', 5, 'App\\Models\\User', 34, '2022-05-28 17:33:16', '2022-05-28 17:33:16'),
(104, NULL, NULL, 6, 'App\\Models\\User', 34, '2022-05-28 17:33:16', '2022-05-28 17:33:16'),
(105, NULL, '', 5, 'App\\Models\\User', 35, '2022-05-29 14:24:33', '2022-05-29 14:24:33'),
(106, NULL, NULL, 6, 'App\\Models\\User', 35, '2022-05-29 14:24:33', '2022-05-29 14:24:33'),
(107, NULL, '', 5, 'App\\Models\\User', 36, '2022-06-06 16:52:37', '2022-06-06 16:52:37'),
(108, NULL, NULL, 6, 'App\\Models\\User', 36, '2022-06-06 16:52:37', '2022-06-06 16:52:37'),
(109, NULL, '', 5, 'App\\Models\\User', 37, '2022-06-09 20:20:25', '2022-06-09 20:20:25'),
(110, NULL, NULL, 6, 'App\\Models\\User', 37, '2022-06-09 20:20:25', '2022-06-09 20:20:25'),
(111, NULL, '', 5, 'App\\Models\\User', 38, '2022-06-11 19:05:21', '2022-06-11 19:05:21'),
(112, NULL, NULL, 6, 'App\\Models\\User', 38, '2022-06-11 19:05:21', '2022-06-11 19:05:21'),
(113, NULL, '', 5, 'App\\Models\\User', 39, '2022-07-28 04:43:53', '2022-07-28 04:43:53'),
(114, 'Gaza', 'Gaza', 6, 'App\\Models\\User', 39, '2022-07-28 04:43:53', '2022-07-28 04:43:53');

-- --------------------------------------------------------

--
-- Table structure for table `custom_pages`
--

CREATE TABLE `custom_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_pages`
--

INSERT INTO `custom_pages` (`id`, `title`, `content`, `published`, `created_at`, `updated_at`) VALUES
(1, 'Privacy Policy', '<h1>Privacy Policy of SmarterVision</h1>\n<p>SmarterVision operates the SmarterVision website, which provides the SERVICE.</p>\n<p>This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the smartersvision.com website.</p>\n<p>If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at smartersvision.com, unless otherwise defined in this Privacy Policy.</p>\n<h2>Information Collection and Use</h2>\n<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.</p>\n<h2>Log Data</h2>\n<p>We want to inform you that whenever you visit our Service, we collect information that your browser sends to us which is called Log Data. This Log Data may include information such as your computer\'s Internet Protocol (أ¢â‚¬إ“IPأ¢â‚¬آ‌) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.</p>\n<h2>Cookies</h2>\n<p>Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer\'s hard drive.</p>\n<p>Our website uses these أ¢â‚¬إ“cookiesأ¢â‚¬آ‌ to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.</p>\n<h2>Service Providers</h2>\n<p>We may employ third-party companies and individuals due to the following reasons:</p>\n<ul>\n<li>To facilitate our Service;</li>\n<li>To provide the Service on our behalf;</li>\n<li>To perform Service-related services; or</li>\n<li>To assist us in analyzing how our Service is used.</li>\n</ul>\n<p>We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>\n<h2>Security</h2>\n<p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p>\n<h2>Links to Other Sites</h2>\n<p>Our Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>\n<h2>Children\'s Privacy</h2>\n<p>Our Services do not address anyone under the age of 13. We do not knowingly collect personal identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.</p>\n<h2>Changes to This Privacy Policy</h2>\n<p>We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.</p>\n<h2>Contact Us</h2>\n<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us.</p>', 1, '2021-02-24 19:53:21', '2021-02-24 21:19:19'),
(2, 'Terms & Conditions', '<h2>Terms &amp; Conditions</h2><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.</p><p>Dolor consequat. Ex ducimus, dolores fugiat ipsam sunt non a dolor quidem nulla ullamco Nam labore nostrum sit amet, tenetur ut consequatur? Non aut incididunt consequatur, rem veniam, veritatis molestiae neque non veniam, nemo facilis eligendi qui aut enim aperiam rerum fugiat, dolorum qui id, in sint et assumenda mollitia dignissimos illum, ipsum maiores asperiores exercitationem odio labore laboris consequatur? Consequatur, sapiente ipsum, laboriosam, laudantium, dolor sed autem eligendi ea a.<br></p>', 1, '2021-02-24 21:20:06', '2021-02-24 21:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `discountables`
--

CREATE TABLE `discountables` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_id` int(10) UNSIGNED NOT NULL,
  `discountable_type` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discountable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED DEFAULT NULL,
  `total_bookings` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `admin_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `e_provider_earning` double(10,2) NOT NULL DEFAULT 0.00,
  `taxes` double(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `e_provider_id`, `total_bookings`, `total_earning`, `admin_earning`, `e_provider_earning`, `taxes`, `created_at`, `updated_at`) VALUES
(1, 19, 0, 0.00, 0.00, 0.00, 0.00, '2022-06-09 20:23:52', '2022-06-09 20:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `title`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Sit perspiciatis molestiae aut labore. Soluta est dolor ratione quos sint. Dolorum et eum voluptatem vero tenetur minima.\"}', '{\"en\":\"Alice watched the White Rabbit cried out, \'Silence in the air. \'--as far out to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said the Gryphon. \'Well, I should have.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(2, '{\"en\":\"Quo voluptate sequi veniam illo. A necessitatibus nesciunt aut quidem hic explicabo. Illum odit aut dolorum.\"}', '{\"en\":\"Kings and Queens, and among them Alice recognised the White Rabbit interrupted: \'UNimportant, your Majesty means, of course,\' the Gryphon whispered in reply, \'for fear they should forget them before.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(3, '{\"en\":\"Consequatur officia labore qui provident in harum. Labore repudiandae quia laboriosam ut quidem.\"}', '{\"en\":\"King added in a low trembling voice, \'--and I hadn\'t mentioned Dinah!\' she said this, she looked down at them, and the shrill voice of the house, quite forgetting in the kitchen. \'When I\'M a.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(4, '{\"en\":\"Ea rerum dolores odit eos corrupti laboriosam. Repellat qui qui officiis nostrum.\"}', '{\"en\":\"WOULD not remember ever having heard of \\\"Uglification,\\\"\' Alice ventured to say. \'What is his sorrow?\' she asked the Mock Turtle replied, counting off the subjects on his flappers, \'--Mystery.\"}', 17, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(5, '{\"en\":\"Quis quia et minus sunt dolorum hic. Error sunt doloremque optio eaque omnis et veniam. Iure voluptas et omnis aut ipsa.\"}', '{\"en\":\"The King turned pale, and shut his eyes.--\'Tell her about the reason and all of them didn\'t know how to spell \'stupid,\' and that makes the matter worse. You MUST have meant some mischief, or else.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(6, '{\"en\":\"Beatae enim temporibus numquam facere quia. Veniam harum est rem accusantium vero libero eveniet.\"}', '{\"en\":\"Cheshire Cat, she was talking. Alice could not join the dance. \'\\\"What matters it how far we go?\\\" his scaly friend replied. \\\"There is another shore, you know, upon the other side, the puppy made.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(7, '{\"en\":\"Sed porro sed non suscipit. Laborum velit et quibusdam iure. Esse sequi mollitia et dolor quas et.\"}', '{\"en\":\"Alice thought), and it said in a tone of delight, which changed into alarm in another moment, splash! she was trying to put down her flamingo, and began picking them up again with a knife, it.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(8, '{\"en\":\"Beatae id architecto veniam voluptates facere debitis eos veniam. Voluptas nihil atque esse facilis quam error.\"}', '{\"en\":\"As she said to herself \'This is Bill,\' she gave a look askance-- Said he thanked the whiting kindly, but he now hastily began again, using the ink, that was sitting on a crimson velvet cushion; and.\"}', 16, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(9, '{\"en\":\"Nihil rerum consequatur ex et ad. Hic eos animi tempora molestiae id culpa.\"}', '{\"en\":\"Alice, and, after waiting till she too began dreaming after a few minutes it seemed quite dull and stupid for life to go and take it away!\' There was a large fan in the morning, just time to avoid.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(10, '{\"en\":\"Et nihil voluptas ipsa ut. Dolores ipsa laboriosam et rerum. Eius minima aut ad eaque.\"}', '{\"en\":\"ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said the Dormouse: \'not in that poky little house, and found that, as nearly as she ran; but the Dormouse began in a trembling voice to.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(11, '{\"en\":\"Et repellendus vel suscipit ad odit. Iusto ratione vel unde aut. Consectetur eveniet velit nesciunt praesentium iste quo.\"}', '{\"en\":\"I wish I hadn\'t quite finished my tea when I learn music.\' \'Ah! that accounts for it,\' said the Caterpillar. This was such a nice soft thing to nurse--and she\'s such a curious croquet-ground in her.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(12, '{\"en\":\"Consequuntur consequatur adipisci iure eos culpa aperiam. Laudantium cumque rem ad ut.\"}', '{\"en\":\"How queer everything is to-day! And yesterday things went on again:-- \'You may not have lived much under the sea,\' the Gryphon said, in a sorrowful tone, \'I\'m afraid I can\'t tell you his history,\'.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(13, '{\"en\":\"Cupiditate cumque dolores magni. Debitis voluptates culpa pariatur error quos.\"}', '{\"en\":\"There was a dispute going on within--a constant howling and sneezing, and every now and then said, \'It WAS a curious dream!\' said Alice, who was sitting on a summer day: The Knave did so, and giving.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(14, '{\"en\":\"Omnis voluptatibus qui aut ab. Tempore adipisci sed est est quasi cumque maxime. Labore reiciendis et ab veniam.\"}', '{\"en\":\"Let me see--how IS it to the table for it, you may SIT down,\' the King and the sounds will take care of themselves.\\\"\' \'How fond she is of yours.\\\"\' \'Oh, I know!\' exclaimed Alice, who always took a.\"}', 13, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(15, '{\"en\":\"Quo iusto nulla eum. Odit est corporis accusantium enim. Et sunt autem nihil beatae numquam.\"}', '{\"en\":\"Hatter continued, \'in this way:-- \\\"Up above the world you fly, Like a tea-tray in the kitchen that did not seem to be\\\"--or if you\'d rather not.\' \'We indeed!\' cried the Mouse, who seemed to be sure.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(16, '{\"en\":\"Fugit consequatur sapiente illum et quisquam. Eaque ea voluptatem porro. Quo omnis illo sunt.\"}', '{\"en\":\"Mouse splashed his way through the neighbouring pool--she could hear the very tones of her childhood: and how she would get up and ran off, thinking while she ran, as well as she did not like to.\"}', 14, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(17, '{\"en\":\"Eveniet dicta molestiae perspiciatis eos et. Omnis ab cupiditate dolorem laboriosam.\"}', '{\"en\":\"I THINK,\' said Alice. \'It goes on, you know,\' the Hatter asked triumphantly. Alice did not come the same tone, exactly as if he would deny it too: but the Rabbit came near her, she began, rather.\"}', 7, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(18, '{\"en\":\"Porro sint laboriosam dolorem sunt facere natus. Dolorem repellat sed necessitatibus facilis repudiandae.\"}', '{\"en\":\"I tell you!\' But she went on to the door, she ran off as hard as it didn\'t much matter which way I want to go! Let me see: I\'ll give them a new idea to Alice, very loudly and decidedly, and there.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(19, '{\"en\":\"Aspernatur dolorem cupiditate sit dolor deserunt. Ut aliquam ratione qui magnam esse.\"}', '{\"en\":\"THAT like?\' said Alice. \'Off with his head!\' or \'Off with her face like the Mock Turtle; \'but it sounds uncommon nonsense.\' Alice said very humbly; \'I won\'t interrupt again. I dare say you\'re.\"}', 10, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(20, '{\"en\":\"Natus distinctio dolorem harum perferendis commodi ea. Et saepe eos qui ut quam. Iusto harum alias nemo.\"}', '{\"en\":\"Alice (she was so full of the March Hare said to herself, \'because of his shrill little voice, the name again!\' \'I won\'t indeed!\' said the Queen, \'and he shall tell you his history,\' As they walked.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(21, '{\"en\":\"Optio facere enim placeat numquam laboriosam expedita occaecati voluptas. Minus cupiditate nostrum est quisquam minima.\"}', '{\"en\":\"I believe.\' \'Boots and shoes under the window, and some were birds,) \'I suppose so,\' said Alice. \'Well, then,\' the Cat said, waving its tail about in all my limbs very supple By the use of this.\"}', 18, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(22, '{\"en\":\"Maiores reprehenderit exercitationem et quia voluptatem doloremque neque. Voluptas tenetur praesentium at omnis facere culpa.\"}', '{\"en\":\"Duchess to play with, and oh! ever so many out-of-the-way things had happened lately, that Alice said; but was dreadfully puzzled by the pope, was soon left alone. \'I wish I had to ask help of any.\"}', 10, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(23, '{\"en\":\"Repellat ullam ratione et et aperiam in. Tempore iure nam et eos. Quod voluptas asperiores qui et asperiores id autem.\"}', '{\"en\":\"However, I\'ve got to see it trot away quietly into the sky all the way YOU manage?\' Alice asked. \'We called him Tortoise because he taught us,\' said the Gryphon. \'It all came different!\' Alice.\"}', 12, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(24, '{\"en\":\"Est aut voluptatum libero animi. Et ut quae voluptas fuga enim inventore.\"}', '{\"en\":\"There seemed to follow, except a tiny little thing!\' It did so indeed, and much sooner than she had peeped into the wood for fear of their hearing her; and the procession came opposite to Alice, and.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(25, '{\"en\":\"Dolores sint et non et possimus eius vero enim. Eius dignissimos dolor molestiae tempore corporis animi quas.\"}', '{\"en\":\"Rabbit say to itself \'The Duchess! The Duchess! Oh my dear Dinah! I wonder who will put on his knee, and looking anxiously round to see if there were three gardeners at it, and talking over its.\"}', 6, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(26, '{\"en\":\"Aspernatur quia et est. Totam ad dolorem quisquam sequi quis aspernatur. Vel ea similique nisi et ad.\"}', '{\"en\":\"BEST butter,\' the March Hare said to herself. \'I dare say you\'re wondering why I don\'t care which happens!\' She ate a little scream, half of anger, and tried to beat them off, and that in some book.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(27, '{\"en\":\"Maiores illo nam facere non dignissimos quos. Aliquid ipsum et debitis non autem at est. Iusto aut porro blanditiis possimus.\"}', '{\"en\":\"Alice in a low voice, \'Why the fact is, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried hard to whistle to it; but she stopped hastily, for the rest of the party went back.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(28, '{\"en\":\"Amet dolorem autem quis. Recusandae sed voluptatibus explicabo qui accusamus totam aut. Voluptas veritatis eos est fugit quo.\"}', '{\"en\":\"I am to see what this bottle does. I do hope it\'ll make me smaller, I can find it.\' And she began again. \'I should like to hear the name again!\' \'I won\'t indeed!\' said the King. \'Nothing whatever,\'.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(29, '{\"en\":\"Blanditiis et aliquid numquam quis velit natus aut. Suscipit iusto id quibusdam. Qui aut amet autem explicabo libero.\"}', '{\"en\":\"Alice\'s head. \'Is that the Gryphon answered, very nearly in the pool, and the three gardeners, oblong and flat, with their heads!\' and the Mock Turtle. \'And how do you want to be?\' it asked. \'Oh.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(30, '{\"en\":\"A atque tempora et. Possimus voluptas et facilis. Aut facilis deleniti aut architecto necessitatibus.\"}', '{\"en\":\"She had quite a crowd of little Alice was very likely to eat or drink something or other; but the cook till his eyes were nearly out of sight. Alice remained looking thoughtfully at the cook.\"}', 18, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(31, '{\"en\":\"Libero nostrum molestias aut quaerat est. Quo et id sapiente deleniti nemo optio.\"}', '{\"en\":\"Alice; \'but when you throw them, and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. \'You might just as usual. \'Come, there\'s no name signed at the top of his shrill little voice, the.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(32, '{\"en\":\"Est magnam totam libero laborum vel. Placeat accusantium similique tempora aut quia. Temporibus quia corrupti quis ut quaerat.\"}', '{\"en\":\"March Hare said to herself in a helpless sort of thing never happened, and now here I am now? That\'ll be a comfort, one way--never to be a walrus or hippopotamus, but then she heard something like.\"}', 10, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(33, '{\"en\":\"Optio omnis voluptatem quibusdam. Non deleniti doloribus sit est iste. Fugiat illum beatae porro libero aspernatur.\"}', '{\"en\":\"I\'ll stay down here! It\'ll be no doubt that it was only a mouse that had a little queer, won\'t you?\' \'Not a bit,\' said the cook. \'Treacle,\' said the King. \'When did you manage on the bank, with her.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(34, '{\"en\":\"Consequatur facilis error modi vel in. Odit odio excepturi voluptatem quia deserunt et. Cum eos quae fugiat iusto.\"}', '{\"en\":\"Queen will hear you! You see, she came up to her lips. \'I know SOMETHING interesting is sure to kill it in a coaxing tone, and everybody laughed, \'Let the jury asked. \'That I can\'t see you?\' She was.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(35, '{\"en\":\"Fuga autem culpa ut animi et et sit. Consequuntur optio ipsa tempora eum nostrum. Est aliquid minima magni.\"}', '{\"en\":\"Mock Turtle, and to stand on their hands and feet, to make out exactly what they said. The executioner\'s argument was, that anything that had fallen into it: there were three little sisters--they.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(36, '{\"en\":\"Aperiam vitae rerum ea consequatur non ut. Beatae ex facere laudantium nesciunt. Vel enim molestiae in ut et fugit quasi.\"}', '{\"en\":\"I don\'t know,\' he went on planning to herself \'This is Bill,\' she gave her one, they gave him two, You gave us three or more; They all sat down a good deal: this fireplace is narrow, to be an old.\"}', 11, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(37, '{\"en\":\"Consequatur adipisci aut iure dolorem veniam. Atque itaque ut iste deserunt.\"}', '{\"en\":\"Alice, with a great crash, as if he had never left off when they saw the White Rabbit returning, splendidly dressed, with a kind of authority over Alice. \'Stand up and throw us, with the game,\' the.\"}', 12, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(38, '{\"en\":\"Rerum cumque excepturi rem et maiores sint. Necessitatibus voluptate hic error. Reiciendis eos vero laboriosam.\"}', '{\"en\":\"Alice remarked. \'Right, as usual,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, \'to pretend to be a person of authority over Alice. \'Stand up and straightening itself out.\"}', 10, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(39, '{\"en\":\"Sunt expedita minus voluptatem eos. Voluptatem dolor nemo doloremque laboriosam necessitatibus.\"}', '{\"en\":\"But said I didn\'t!\' interrupted Alice. \'You are,\' said the Gryphon. \'Well, I shan\'t go, at any rate, the Dormouse go on till you come and join the dance? Will you, won\'t you, won\'t you join the.\"}', 13, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(40, '{\"en\":\"Et voluptatem velit id similique. Quae molestiae in sed non et et. Incidunt magni labore et adipisci laborum ab amet.\"}', '{\"en\":\"Hatter. Alice felt that she was going to happen next. First, she tried the roots of trees, and I\'ve tried banks, and I\'ve tried banks, and I\'ve tried banks, and I\'ve tried banks, and I\'ve tried.\"}', 16, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(41, '{\"en\":\"Voluptatem consectetur illum cumque. Reiciendis facere qui illo recusandae voluptas.\"}', '{\"en\":\"Alice in a fight with another dig of her sharp little chin. \'I\'ve a right to think,\' said Alice indignantly. \'Ah! then yours wasn\'t a really good school,\' said the King said to herself, \'I don\'t.\"}', 5, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(42, '{\"en\":\"Ipsam nisi voluptas et iure quia sunt omnis. Ipsa quia voluptatem odit eos.\"}', '{\"en\":\"The Lobster Quadrille The Mock Turtle to the jury. They were just beginning to feel a little worried. \'Just about as it happens; and if it had been, it suddenly appeared again. \'By-the-bye, what.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(43, '{\"en\":\"Aliquid temporibus ab dolor vero veniam earum. Iusto excepturi est quo quia nemo eos.\"}', '{\"en\":\"AT ALL. Soup does very well to say \'Drink me,\' but the Rabbit asked. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Gryphon: and Alice rather.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(44, '{\"en\":\"Illum et fugit et sint molestiae quo quia. Unde omnis rem sit. Vero expedita quis in tempora est.\"}', '{\"en\":\"Oh dear! I\'d nearly forgotten that I\'ve got to come yet, please your Majesty?\' he asked. \'Begin at the number of bathing machines in the pool, and the other ladder?--Why, I hadn\'t to bring tears.\"}', 15, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(45, '{\"en\":\"Optio praesentium cumque officiis pariatur. Enim tempore nesciunt in. Vitae voluptatem quia quos.\"}', '{\"en\":\"So they couldn\'t see it?\' So she was quite surprised to find herself still in sight, and no one else seemed inclined to say \'Drink me,\' but the Dodo replied very gravely. \'What else have you got in.\"}', 18, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(46, '{\"en\":\"Quia aut unde omnis fugiat cum. Dolores ipsa blanditiis maiores qui non. Velit ut impedit ut corrupti iure.\"}', '{\"en\":\"King. \'When did you manage on the spot.\' This did not much like keeping so close to them, they set to work shaking him and punching him in the air, and came back again. \'Keep your temper,\' said the.\"}', 11, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(47, '{\"en\":\"Assumenda ratione tempore consequatur molestias. Ea quod vitae distinctio sunt explicabo soluta. Ut vitae omnis ipsum.\"}', '{\"en\":\"Dinah, and saying \\\"Come up again, dear!\\\" I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(48, '{\"en\":\"Deserunt esse quod ipsum at quia similique. Nemo ipsam iusto rerum quo sit velit natus. Occaecati nam optio saepe ea.\"}', '{\"en\":\"However, I\'ve got to see it trying in a minute or two, looking for eggs, as it can\'t possibly make me grow larger, I can guess that,\' she added in a rather offended tone, \'so I can\'t remember,\' said.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(49, '{\"en\":\"Esse consequatur sit voluptatem reiciendis. Cupiditate velit non sunt. Assumenda non non aut velit eligendi ut quia.\"}', '{\"en\":\"Alice, quite forgetting in the kitchen. \'When I\'M a Duchess,\' she said to Alice, flinging the baby violently up and walking off to trouble myself about you: you must manage the best plan.\' It.\"}', 9, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(50, '{\"en\":\"Amet dolore nemo dolorum quia magni. In quis voluptatem est soluta et ut vitae.\"}', '{\"en\":\"So they went up to her feet as the other.\' As soon as it can talk: at any rate, there\'s no harm in trying.\' So she tucked it away under her arm, and timidly said \'Consider, my dear: she is only a.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `e_providers`
--

CREATE TABLE `e_providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_type_id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `availability_range` double(9,2) DEFAULT 0.00,
  `available` tinyint(1) DEFAULT 1,
  `featured` tinyint(1) DEFAULT 0,
  `accepted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `Facebook` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_facebook` tinyint(1) DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_twitter` tinyint(1) DEFAULT NULL,
  `instegram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_instegram` tinyint(1) DEFAULT NULL,
  `tiktok` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_tiktok` tinyint(1) DEFAULT NULL,
  `whats_app` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_whats_app` tinyint(1) DEFAULT NULL,
  `website_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_website_url` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_providers`
--

INSERT INTO `e_providers` (`id`, `name`, `e_provider_type_id`, `description`, `phone_number`, `mobile_number`, `availability_range`, `available`, `featured`, `accepted`, `created_at`, `updated_at`, `Facebook`, `active_facebook`, `twitter`, `active_twitter`, `instegram`, `active_instegram`, `tiktok`, `active_tiktok`, `whats_app`, `active_whats_app`, `website_url`, `active_website_url`) VALUES
(1, '{\"en\":\"Roofing Murazik-Bergnaum\"}', 3, '{\"en\":\"Esse fugiat voluptas placeat magnam a nostrum ea autem. A consequuntur tenetur ea et quae officiis. Et non quo placeat sed est quia molestiae. At voluptas laborum praesentium.\"}', '+19185812628', '+19302562208', 11124.09, 1, 0, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '{\"en\":\"Care Services Conn, Dickinson and Powlowski\"}', 2, '{\"en\":\"Est assumenda cupiditate voluptatem modi non. Sequi molestiae modi cumque harum. Vel voluptatum molestiae quam harum. Omnis distinctio sit id maiores vel et distinctio.\"}', '360-610-3816', '605.447.9489', 12002.12, 1, 0, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '{\"en\":\"Gardner Construction Bins, Wintheiser and Bailey\"}', 3, '{\"en\":\"Alias vel distinctio aut quia. Sit qui voluptas maiores est veritatis aut vel. Aut enim atque ipsa quasi et. Id omnis quam perferendis dolores quis.\"}', '1-318-612-9499', '215-514-9731', 7239.30, 1, 0, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '{\"en\":\"Epoxy Coating Kessler-Stokes\"}', 2, '{\"en\":\"Sequi modi animi reprehenderit et inventore laudantium. Nisi dicta maxime est nisi quia hic. Assumenda a maxime nulla magni a earum. Omnis quibusdam architecto officia voluptatem.\"}', '1-458-827-1399', '+1.919.437.4111', 14849.91, 1, 1, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '{\"en\":\"House Senger, Anderson and Kshlerin\"}', 3, '{\"en\":\"Sit eaque similique est hic in qui. Autem ratione non quo aspernatur et in animi qui. Enim dolorem aspernatur eos sit et et. Dolor ipsa laudantium harum suscipit eum sit sit.\"}', '(716) 596-0488', '+19287503967', 14947.56, 1, 0, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '{\"en\":\"Concrete Dare PLC\"}', 3, '{\"en\":\"Omnis minus maxime molestiae quasi dolorem culpa. Repudiandae dolores atque debitis. Aut eum explicabo consectetur rerum distinctio ea rerum. Ut et omnis blanditiis deserunt velit aut id.\"}', '1-680-662-8129', '+13109183175', 11780.96, 1, 0, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, '{\"en\":\"Epoxy Coating Armstrong Inc\"}', 3, '{\"en\":\"Porro quibusdam ea totam aut iure molestiae rerum. Veniam rem et corporis laboriosam. Eos suscipit temporibus numquam consequatur. Saepe vero itaque veritatis mollitia ab non officia.\"}', '+1.276.214.2865', '813-791-8553', 8354.64, 1, 1, 1, '2022-05-16 23:15:46', '2022-05-16 23:15:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, '{\"en\":\"Dentists Nikolaus-Sporer\"}', 3, '{\"en\":\"Debitis animi aperiam ea saepe qui occaecati. Ut impedit at ducimus odio vel excepturi. Culpa temporibus in excepturi quos possimus voluptas sunt atque.\"}', '480-200-1998', '(862) 681-4223', 11692.77, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, '{\"en\":\"Gardner Construction Mayert-Morar\"}', 2, '{\"en\":\"Mollitia nemo consectetur quia sapiente molestiae ea. Quis quam voluptas autem quia repellat. Eos nesciunt nihil quo voluptate a qui.\"}', '+1-854-540-7899', '+1.570.798.9284', 13496.23, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '{\"en\":\"Care Services Rempel, Wyman and Weber\"}', 2, '{\"en\":\"Soluta perspiciatis ad quibusdam impedit rerum. Corporis exercitationem maiores consequuntur quod. Dolores omnis tempora dignissimos sint.\"}', '(704) 819-4100', '(380) 476-0527', 12111.10, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '{\"en\":\"Concrete Gutkowski Ltd\"}', 3, '{\"en\":\"At facere aut esse deserunt corrupti voluptates sit. Deleniti perspiciatis quam atque rerum aliquam aut. Aspernatur doloribus fugiat odio. Tempore qui laudantium et dolorem facere nam.\"}', '+1-937-217-6615', '1-320-674-2513', 13561.56, 1, 1, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '{\"en\":\"Architect Shanahan-Rau\"}', 3, '{\"en\":\"Incidunt qui nisi dolorem aliquid unde voluptatem. Rem non quam excepturi et dolorum numquam explicabo. Vel quasi in voluptate.\"}', '(520) 732-0524', '502-371-9260', 14763.93, 1, 1, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, '{\"en\":\"Security Beier Inc\"}', 3, '{\"en\":\"Tenetur autem vel dolor qui labore aut. Soluta animi vel porro illo. Aliquid ex deleniti labore libero dolores molestias. Minus veritatis reprehenderit molestias mollitia officiis.\"}', '1-480-488-7860', '1-707-472-8314', 10254.72, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '{\"en\":\"Architect Ruecker, Terry and Prosacco\"}', 3, '{\"en\":\"Velit expedita sit atque placeat. Molestias voluptatem sequi incidunt pariatur dolore dolore nisi. Dolor ipsum odit sint rerum necessitatibus sit aliquid consequuntur.\"}', '(332) 265-9764', '1-984-408-3965', 13764.85, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, '{\"en\":\"Dentists Hettinger Inc\"}', 2, '{\"en\":\"Qui quos provident ipsam at repellat. Veniam harum accusantium nam dignissimos ipsam voluptate ipsam. Qui quis beatae ut beatae ut et. Error rerum modi ad accusamus accusamus dolores.\"}', '+13319464495', '+1.331.270.8734', 10354.11, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, '{\"en\":\"Security Kozey, Corkery and Labadie\"}', 3, '{\"en\":\"Est laborum cumque tempora velit dicta quasi et. Est et rerum dolor a ipsum consectetur. Nobis nam error aliquam ullam optio.\"}', '+1 (458) 631-4336', '951-538-7549', 10768.04, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, '{\"en\":\"Concrete Green-Hettinger\"}', 3, '{\"en\":\"Et sint ullam blanditiis harum est atque. Laborum totam aut ullam ipsum suscipit nobis hic. Nihil pariatur dolorem libero vero explicabo.\"}', '(279) 652-5477', '512.642.4625', 12078.27, 1, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, '{\"en\":\"Dentists Johns-Fahey\"}', 2, '{\"en\":\"Vel quo quisquam labore. Vitae sint eius quam vel. Accusantium blanditiis atque quos qui est quia illo.\"}', '779-309-7265', '+18045596878', 9492.26, 1, 1, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, '{\"en\":\"abbas\"}', 3, '{\"en\":null}', '+9647719512094', '+9647719512094', 5.00, 1, 1, 1, '2022-06-09 20:23:52', '2022-06-09 20:23:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, '{\"ar\":\"ziad abo alkamar\"}', 2, '{\"ar\":\"<p>fhdgfjgf<\\/p>\"}', '0595321661', '0595321661', 56.00, 0, 0, 0, '2022-07-28 05:40:15', '2022-07-28 05:40:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '{\"ar\":\"ziad test\"}', 2, NULL, '0595321661', '0595321661', 67.00, 1, 0, 0, '2022-07-28 05:49:05', '2022-07-28 05:49:05', 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 0, NULL, 0, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, NULL, NULL),
(22, '{\"ar\":\"ziad test 32434\"}', 2, NULL, '0595321661', '0595321661', 67.00, 1, 0, 0, '2022-07-28 05:51:26', '2022-07-28 05:51:26', 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 0, NULL, 0, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, NULL, NULL),
(23, '{\"ar\":\"ziad test 32434\"}', 2, NULL, '0595321661', '0595321661', 67.00, 1, 0, 0, '2022-07-28 05:52:29', '2022-07-28 05:52:29', 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 0, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 0, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, NULL, NULL),
(24, '{\"ar\":\"test test\"}', 2, NULL, '888888', '052323232', 65.00, 1, 0, 0, '2022-07-28 05:54:30', '2022-07-28 06:48:23', 'ziad', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 0, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 0, 'https://us05web.zoom.us/postattendee?mn=oIxqLNDemsQaKA0jsqAvuYayJRjoqZuemIM.5GUmDSs1_yB1SHaP&id=52', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_addresses`
--

CREATE TABLE `e_provider_addresses` (
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `address_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_addresses`
--

INSERT INTO `e_provider_addresses` (`e_provider_id`, `address_id`) VALUES
(2, 4),
(2, 7),
(2, 13),
(2, 20),
(3, 3),
(3, 4),
(3, 14),
(4, 8),
(4, 14),
(4, 15),
(5, 9),
(5, 18),
(6, 13),
(6, 15),
(7, 1),
(8, 3),
(8, 10),
(9, 11),
(11, 7),
(12, 3),
(12, 20),
(14, 16),
(14, 18),
(15, 11),
(17, 8),
(17, 17),
(18, 3);

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_payouts`
--

CREATE TABLE `e_provider_payouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `paid_date` datetime NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_taxes`
--

CREATE TABLE `e_provider_taxes` (
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_types`
--

CREATE TABLE `e_provider_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commission` double(5,2) NOT NULL DEFAULT 0.00,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_types`
--

INSERT INTO `e_provider_types` (`id`, `name`, `commission`, `disabled`, `created_at`, `updated_at`) VALUES
(2, 'Company', 75.00, 0, '2021-01-14 02:05:35', '2021-02-02 05:22:19'),
(3, 'Freelancer', 50.00, 0, '2021-01-18 03:27:18', '2021-02-25 02:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `e_provider_users`
--

CREATE TABLE `e_provider_users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_provider_users`
--

INSERT INTO `e_provider_users` (`user_id`, `e_provider_id`) VALUES
(2, 4),
(2, 12),
(2, 16),
(2, 18),
(4, 1),
(4, 2),
(4, 9),
(4, 13),
(4, 15),
(4, 17),
(6, 1),
(6, 7),
(6, 10),
(6, 15),
(6, 16),
(6, 18),
(37, 19),
(39, 20),
(39, 21),
(39, 22),
(39, 23),
(39, 24);

-- --------------------------------------------------------

--
-- Table structure for table `e_services`
--

CREATE TABLE `e_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `discount_price` double(10,2) DEFAULT 0.00,
  `price_unit` enum('hourly','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity_unit` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `enable_booking` tinyint(1) DEFAULT 1,
  `available` tinyint(1) DEFAULT 1,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_services`
--

INSERT INTO `e_services` (`id`, `name`, `price`, `discount_price`, `price_unit`, `quantity_unit`, `duration`, `description`, `featured`, `enable_booking`, `available`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Deck Cleaning \\/ Sealing\"}', 41.02, 0.00, 'hourly', NULL, '5:00', '{\"en\":\"Quia rerum modi eligendi ut vel fugit iusto beatae. Autem cum eos sapiente molestiae itaque cumque amet.\"}', 1, 1, 1, 15, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(2, '{\"en\":\"Full Home Deep Cleaning\"}', 21.33, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Fugiat et sit sit minima corporis a. Ipsum est earum dolores molestias. Ad rerum consequatur alias explicabo id. Dignissimos omnis vitae mollitia.\"}', 0, 0, 0, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(3, '{\"en\":\"Post Party Cleaning\"}', 16.94, 0.00, 'fixed', NULL, '1:00', '{\"en\":\"Id ut facilis fuga. Voluptatem perspiciatis velit repellat sed dolor quia eum provident. Iusto quisquam nostrum laboriosam quae consequatur.\"}', 0, 0, 0, 3, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(4, '{\"en\":\"Tank Cleaning\"}', 27.81, 0.00, 'hourly', NULL, '1:00', '{\"en\":\"Quidem aliquid qui expedita aliquam sequi. Animi possimus dicta molestiae explicabo quae dolor deserunt maxime. Vel animi soluta aut perspiciatis. Quo amet dolor natus numquam reprehenderit.\"}', 1, 1, 1, 10, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(5, '{\"en\":\"Screens - New and Repair\"}', 13.41, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Accusantium dolor ex earum omnis. Fugiat fugit non possimus et est. Nulla minima excepturi eos aut iure. Voluptatem magni occaecati laudantium ad deleniti quae nesciunt aut.\"}', 0, 1, 1, 15, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(6, '{\"en\":\"Lawn Care Services\"}', 15.88, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Id nemo sapiente sapiente eligendi. Quasi harum doloremque velit voluptatibus ipsam dolor. Voluptatum repudiandae qui velit voluptatum voluptas quo placeat.\"}', 0, 1, 1, 14, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(7, '{\"en\":\"Nurse Service\"}', 22.34, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Quos a cum voluptatem asperiores vitae molestiae. Labore facere rerum impedit repellat sit suscipit accusamus. Exercitationem et nulla et perferendis porro. Ut ut id nihil maxime nisi optio deserunt.\"}', 1, 0, 0, 10, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(8, '{\"en\":\"Real Estate Agents\"}', 29.72, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Molestiae consequatur quis quam sint consequatur. Magnam explicabo deleniti odit molestiae aut molestias. Blanditiis perferendis iure accusamus suscipit. Dolor architecto dolor id sed et voluptates.\"}', 1, 1, 0, 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(9, '{\"en\":\"Facials Services\"}', 46.27, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Ut est sequi saepe dolorum amet et adipisci. Rem non laudantium dicta et. Nihil sunt molestias voluptatem. Est illum dolorem et unde.\"}', 1, 0, 1, 16, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(10, '{\"en\":\"Doctor at home Service\"}', 18.03, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Provident non at totam autem. Esse sit consequatur illum assumenda excepturi rerum asperiores iste. Quam culpa ea ea voluptatum totam.\"}', 1, 1, 0, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(11, '{\"en\":\"Tank Cleaning\"}', 33.83, 30.50, 'hourly', NULL, '1:00', '{\"en\":\"Minus voluptatem voluptatem facere vitae explicabo quia. Occaecati non autem esse voluptas quo aut velit. Commodi consequatur et voluptatem. Est qui possimus placeat.\"}', 1, 0, 0, 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(12, '{\"en\":\"Real Estate Agents\"}', 28.29, 0.00, 'hourly', NULL, '1:00', '{\"en\":\"Fugit optio eveniet earum rerum maiores unde. Eaque et quis ut perspiciatis et asperiores deleniti ea. Vitae velit soluta aperiam iste placeat qui dignissimos.\"}', 0, 1, 0, 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(13, '{\"en\":\"Real Estate Agents\"}', 45.69, 0.00, 'fixed', NULL, '2:00', '{\"en\":\"Sunt non qui fuga sit. Maxime et earum porro quia inventore. Aliquid ipsum nemo ea labore dolores in.\"}', 0, 1, 1, 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(14, '{\"en\":\"Real Estate Agents\"}', 14.84, 6.80, 'fixed', NULL, '3:00', '{\"en\":\"Dolor molestias rerum velit esse dicta in. Aut reprehenderit ut autem ea non provident. Aut recusandae vitae velit nihil. Dignissimos sint ipsa ut qui voluptatem.\"}', 0, 0, 1, 10, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(15, '{\"en\":\"Hair Style Service\"}', 29.37, 22.70, 'hourly', NULL, '1:00', '{\"en\":\"Sed delectus quis omnis consequatur consectetur. Optio molestiae illo omnis praesentium quos. Iure reiciendis a assumenda assumenda.\"}', 0, 1, 0, 15, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(16, '{\"en\":\"Lawn Care Services\"}', 18.19, 0.00, 'hourly', NULL, '5:00', '{\"en\":\"Consequatur facilis soluta error commodi saepe. Omnis eius numquam blanditiis. Dolore magni aperiam quaerat quis sed voluptatum. Voluptatem deleniti rem velit itaque.\"}', 0, 1, 1, 5, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(17, '{\"en\":\"Facials Services\"}', 34.13, 29.63, 'hourly', NULL, '2:00', '{\"en\":\"Aut id ipsum occaecati totam soluta. Molestiae aut non sit et itaque inventore aut. Consequatur dolorem eaque ratione.\"}', 0, 0, 0, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(18, '{\"en\":\"Office Cleaning\"}', 27.40, 0.00, 'fixed', NULL, '4:00', '{\"en\":\"Illo omnis et omnis. Enim et sit est quo delectus sit numquam. Exercitationem soluta qui consequatur et aliquam dolore. Fuga et temporibus nihil vero harum non incidunt voluptatum.\"}', 1, 0, 1, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(19, '{\"en\":\"Lawn Care Services\"}', 43.12, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Qui non neque dolorem est. Eligendi ut fugit rem possimus ut aut minus.\"}', 0, 0, 1, 6, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(20, '{\"en\":\"Thai Massage Services\"}', 10.11, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Velit iusto molestias autem nobis necessitatibus qui architecto. Doloribus et quibusdam ad fuga qui quibusdam quibusdam. In et nulla in qui a.\"}', 0, 1, 0, 2, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(21, '{\"en\":\"Facials Services\"}', 17.24, 10.79, 'fixed', NULL, '1:00', '{\"en\":\"Maxime modi esse voluptatem rerum in iure. Aut exercitationem cupiditate quo vel voluptatum. Omnis esse aliquid omnis numquam eaque qui. Corporis sint in alias voluptatem adipisci.\"}', 1, 0, 0, 12, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(22, '{\"en\":\"Portrait Photos Services\"}', 16.27, 0.00, 'fixed', NULL, '3:00', '{\"en\":\"Et sit laboriosam non eum quod. Odio quibusdam et reiciendis nemo dolorum atque eum. Quo non quos repudiandae debitis. Et eum ut sit labore dolore doloremque.\"}', 0, 1, 0, 16, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(23, '{\"en\":\"Hair Style Service\"}', 30.73, 29.23, 'hourly', NULL, '4:00', '{\"en\":\"Quisquam reprehenderit possimus rem odit ipsa quae et. Ut error beatae occaecati quo consectetur voluptatem. Quis ut dolorem et aperiam nihil iusto consequatur.\"}', 0, 0, 0, 2, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(24, '{\"en\":\"Facials Services\"}', 10.33, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Non ad laboriosam veniam culpa. Maiores et deleniti facilis voluptatem illo optio. Qui libero et sint. Vel modi sint sequi molestiae debitis.\"}', 1, 0, 1, 18, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(25, '{\"en\":\"Doctor at home Service\"}', 24.54, 0.00, 'fixed', NULL, '1:00', '{\"en\":\"Tenetur libero itaque magni voluptas. Velit omnis ut illum vel. Et iure nesciunt sunt maxime et. Ut corrupti necessitatibus accusamus earum aut nobis error nihil.\"}', 1, 0, 0, 16, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(26, '{\"en\":\"Facials Services\"}', 20.04, 13.86, 'fixed', NULL, '2:00', '{\"en\":\"Voluptatem distinctio laudantium dolores a perferendis. Id sit labore laudantium saepe. Earum animi veritatis sed voluptatem dolores eveniet aut ex.\"}', 0, 1, 1, 9, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(27, '{\"en\":\"Hair Style Service\"}', 42.23, 0.00, 'hourly', NULL, '2:00', '{\"en\":\"Consequatur consequatur ut maiores nemo facilis facilis illo. Quasi excepturi cum et in. Aliquam expedita occaecati aut. Alias delectus quod animi repudiandae ducimus.\"}', 0, 0, 0, 16, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(28, '{\"en\":\"Portrait Photos Services\"}', 16.55, 12.79, 'hourly', NULL, '5:00', '{\"en\":\"Ipsum dolorem at neque mollitia distinctio magnam. Velit et ad eos quia. Repudiandae quae iure explicabo vitae.\"}', 0, 1, 0, 5, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(29, '{\"en\":\"Suv Car Washing \"}', 48.16, 0.00, 'hourly', NULL, '4:00', '{\"en\":\"Repellat laudantium non et quia consectetur quaerat. Rerum voluptas ut pariatur aut repudiandae consectetur repellat expedita. Neque et qui consequatur non.\"}', 0, 1, 0, 2, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(30, '{\"en\":\"Real Estate Agents\"}', 24.23, 16.26, 'hourly', NULL, '1:00', '{\"en\":\"Expedita et inventore autem fugit. Voluptatem exercitationem est enim atque reprehenderit architecto atque. Occaecati sequi aut aspernatur ea.\"}', 1, 1, 1, 17, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(31, '{\"en\":\"Nurse Service\"}', 43.66, 0.00, 'hourly', NULL, '3:00', '{\"en\":\"Assumenda eum non illo ea ut sunt. Excepturi maxime vitae ut voluptatibus sed illum dolores. Et repellat sunt et iste id id fugit fugit. Qui expedita explicabo aut ut ut.\"}', 0, 1, 1, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(32, '{\"en\":\"Portrait Photos Services\"}', 44.69, 0.00, 'hourly', NULL, '1:00', '{\"en\":\"Commodi et explicabo sapiente adipisci molestiae. Et explicabo quibusdam blanditiis consequatur unde omnis rerum quo. Ea illo est eaque odit omnis unde. Ut vero sunt ut tempora nemo aut officia et.\"}', 1, 1, 0, 14, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(33, '{\"en\":\"Full Home Deep Cleaning\"}', 33.01, 24.00, 'fixed', NULL, '5:00', '{\"en\":\"Delectus quaerat repellendus minus. Ut error ea ut sapiente. Aliquam numquam et unde ex neque odit.\"}', 1, 0, 1, 2, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(34, '{\"en\":\"Architect Service\"}', 29.88, 0.00, 'fixed', NULL, '5:00', '{\"en\":\"Dolores aut consequuntur qui veniam et quo est. Nemo autem ea voluptates et atque velit adipisci. Velit velit numquam quo aperiam quam at.\"}', 1, 1, 0, 4, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(35, '{\"en\":\"Facials Services\"}', 44.51, 42.94, 'fixed', NULL, '2:00', '{\"en\":\"Rerum sapiente nesciunt autem qui et est. Earum ab sequi commodi ratione. Est ratione magnam autem dicta nemo ab adipisci.\"}', 1, 1, 0, 11, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(36, '{\"en\":\"Architect Service\"}', 35.37, 34.00, 'hourly', NULL, '4:00', '{\"en\":\"Aut qui fugit quia dolorum aut corrupti dolorum. Aut est natus laudantium non voluptate cumque. Alias qui occaecati quia qui. Eveniet sed reiciendis et dolores vitae.\"}', 0, 1, 0, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(37, '{\"en\":\"Nurse Service\"}', 16.18, 0.00, 'fixed', NULL, '5:00', '{\"en\":\"Iste vel voluptates ipsam excepturi ipsam aut. Vero nesciunt aspernatur voluptatem. Aut esse velit quae tempora consequatur velit. Tempora eaque commodi delectus.\"}', 1, 1, 0, 4, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(38, '{\"en\":\"Portrait Photos Services\"}', 38.57, 30.69, 'hourly', NULL, '2:00', '{\"en\":\"Eligendi accusantium veniam est distinctio sint libero. Provident error delectus explicabo. Officia repellendus maxime cupiditate at ad quis.\"}', 1, 1, 0, 6, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(39, '{\"en\":\"Photography Services\"}', 33.09, 0.00, 'fixed', NULL, '1:00', '{\"en\":\"Sit sit quis quia laborum reprehenderit voluptatem et animi. Possimus voluptate qui quae consequatur officia. Ut exercitationem quae molestias rerum.\"}', 0, 0, 0, 3, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(40, '{\"en\":\"Makeup & Beauty Services\"}', 23.23, 15.77, 'fixed', NULL, '5:00', '{\"en\":\"Adipisci praesentium exercitationem vero et. Cum quas minus aut ipsa qui laboriosam suscipit. Eius ullam nam qui illo quidem dolore.\"}', 0, 0, 0, 11, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(41, '{\"en\":\"fff\"}', 23.00, 50.00, 'fixed', '{\"en\":null}', NULL, '{\"en\":\"fffff\"}', 0, 1, 1, 19, '2022-07-26 17:19:41', '2022-07-26 17:19:41'),
(42, '{\"ar\":\"غسيل سيارات\"}', 15.00, 0.00, 'fixed', '{\"ar\":\"خدمة\"}', '1:30', '{\"ar\":\"غسيل احترافي\"}', 1, 1, 1, 19, '2022-07-27 09:21:29', '2022-07-27 09:21:29'),
(43, '{\"ar\":\"غسل سيارات\"}', 15.00, 0.00, 'fixed', '{\"ar\":\"خدمة\"}', '1:30', '{\"ar\":\"غسل احترافي\"}', 1, 1, 1, 19, '2022-07-27 09:22:32', '2022-07-27 09:22:32'),
(44, '{\"ar\":\"nonanme\"}', 50.00, 9.00, 'fixed', '{\"ar\":\"1\"}', '20', '{\"ar\":\"good\"}', 1, 1, 1, 19, '2022-07-27 11:36:43', '2022-07-27 11:36:44'),
(45, '{\"ar\":\"تنظيف سيارة\"}', 14.00, 0.00, 'fixed', '{\"ar\":\"خدمة\"}', '1:30', '{\"ar\":\"تنظيف\"}', 1, 1, 1, 19, '2022-07-27 11:55:21', '2022-07-27 11:55:21'),
(46, '{\"ar\":\"new\"}', 34.00, 23.00, 'hourly', '{\"ar\":\"1\"}', '22', '{\"ar\":\"car\"}', 1, 1, 1, 19, '2022-07-27 12:05:46', '2022-07-27 12:05:46'),
(47, '{\"ar\":\"test1\"}', 33.00, 0.00, 'hourly', '{\"ar\":\"2\"}', '11', '{\"ar\":\"desc\"}', 1, 1, 1, 19, '2022-07-27 12:36:43', '2022-07-27 12:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `e_service_categories`
--

CREATE TABLE `e_service_categories` (
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_categories`
--

INSERT INTO `e_service_categories` (`e_service_id`, `category_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 6),
(2, 8),
(3, 4),
(4, 3),
(4, 4),
(4, 5),
(5, 8),
(6, 4),
(6, 7),
(8, 7),
(8, 9),
(9, 4),
(9, 5),
(11, 1),
(11, 3),
(11, 5),
(12, 1),
(13, 4),
(14, 3),
(15, 1),
(15, 4),
(15, 6),
(15, 9),
(16, 3),
(17, 1),
(17, 3),
(18, 9),
(41, 1),
(41, 3),
(41, 5),
(41, 8),
(42, 1),
(43, 1),
(44, 2),
(44, 7),
(44, 9),
(45, 1),
(46, 1),
(46, 7),
(47, 2),
(47, 8);

-- --------------------------------------------------------

--
-- Table structure for table `e_service_reviews`
--

CREATE TABLE `e_service_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` decimal(3,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `e_service_reviews`
--

INSERT INTO `e_service_reviews` (`id`, `review`, `rate`, `user_id`, `e_service_id`, `created_at`, `updated_at`) VALUES
(1, 'CHAPTER II. The Pool of Tears \'Curiouser and curiouser!\' cried Alice again, in a very long.', '2.00', 8, 13, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(2, 'Rabbit came up to the game. CHAPTER IX. The Mock Turtle\'s heavy sobs. Lastly, she pictured to.', '1.00', 3, 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(3, 'White Rabbit blew three blasts on the look-out for serpents night and day! Why, I haven\'t had a.', '1.00', 3, 16, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(4, 'Queen. \'Can you play croquet?\' The soldiers were silent, and looked at Two. Two began in a large.', '2.00', 5, 15, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(5, 'Dinah: I think it would feel with all her life. Indeed, she had not gone much farther before she.', '1.00', 7, 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(6, 'Mock Turtle. \'No, no! The adventures first,\' said the King. \'Nearly two miles high,\' added the.', '2.00', 7, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(7, 'I have done just as I\'d taken the highest tree in front of the song, \'I\'d have said to Alice.', '5.00', 7, 26, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(8, 'Mind now!\' The poor little thing grunted in reply (it had left off writing on his slate with one.', '3.00', 8, 23, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(9, 'I can\'t remember,\' said the Queen said to the Caterpillar, just as she passed; it was all ridges.', '1.00', 5, 30, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(10, 'So they got thrown out to sea. So they began running about in the other: he came trotting along in.', '1.00', 8, 9, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(11, 'Alice. \'Come on, then!\' roared the Queen, turning purple. \'I won\'t!\' said Alice. \'Why, there they.', '3.00', 5, 24, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(12, 'Alice, rather alarmed at the Gryphon hastily. \'Go on with the day and night! You see the Hatter.', '1.00', 5, 27, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(13, 'Alice, whose thoughts were still running on the spot.\' This did not see anything that had made the.', '4.00', 7, 22, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(14, 'Has lasted the rest waited in silence. Alice was beginning to grow larger again, and that\'s all I.', '4.00', 3, 5, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(15, 'Mouse replied rather crossly: \'of course you know the meaning of it had grown to her lips. \'I know.', '1.00', 7, 23, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(16, 'Mouse, turning to Alice, that she had somehow fallen into a pig,\' Alice quietly said, just as well.', '5.00', 8, 30, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(17, 'I am in the same as the whole place around her became alive with the lobsters, out to be ashamed.', '3.00', 7, 12, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(18, 'Number One,\' said Alice. The poor little Lizard, Bill, was in managing her flamingo: she succeeded.', '3.00', 3, 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(19, 'Caterpillar sternly. \'Explain yourself!\' \'I can\'t help it,\' said Alice, a little before she had.', '5.00', 7, 25, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(20, 'King, the Queen, who was talking. \'How CAN I have done just as I get it home?\' when it grunted.', '1.00', 8, 2, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(21, 'So Alice got up and rubbed its eyes: then it watched the Queen added to one of the door between.', '2.00', 8, 6, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(22, 'Mock Turtle a little nervous about it just missed her. Alice caught the flamingo and brought it.', '5.00', 7, 21, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(23, 'Seaography: then Drawling--the Drawling-master was an immense length of neck, which seemed to be.', '5.00', 7, 15, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(24, 'Queen! The Queen!\' and the little door was shut again, and went to the fifth bend, I think?\' he.', '1.00', 7, 20, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(25, 'Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t think--\' \'Then you may SIT down,\'.', '2.00', 8, 8, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(26, 'Classics master, though. He was an old crab, HE was.\' \'I never said I didn\'t!\' interrupted Alice.', '5.00', 5, 19, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(27, 'Majesty,\' said Two, in a court of justice before, but she saw them, they were filled with.', '2.00', 5, 26, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(28, 'The Hatter was out of the lefthand bit of mushroom, and her eyes filled with tears again as.', '2.00', 7, 28, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(29, 'Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be ashamed of yourself for asking.', '2.00', 8, 38, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(30, 'Mock Turtle drew a long time with one elbow against the roof off.\' After a time there were a Duck.', '1.00', 8, 11, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(31, 'I suppose.\' So she set to work shaking him and punching him in the window?\' \'Sure, it\'s an arm.', '1.00', 7, 11, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(32, 'I\'ll look first,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she was a large.', '1.00', 5, 26, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(33, 'These were the cook, and a scroll of parchment in the sand with wooden spades, then a row of.', '3.00', 5, 24, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(34, 'She got up and rubbed its eyes: then it chuckled. \'What fun!\' said the Caterpillar sternly.', '1.00', 3, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(35, 'Mock Turtle a little girl,\' said Alice, who always took a minute or two, and the game was in.', '4.00', 5, 23, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(36, 'Dinah, if I was, I shouldn\'t like THAT!\' \'Oh, you can\'t help that,\' said the Mock Turtle. \'Very.', '5.00', 5, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(37, 'But, now that I\'m doubtful about the reason they\'re called lessons,\' the Gryphon went on, turning.', '5.00', 5, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(38, 'Her first idea was that you couldn\'t cut off a bit afraid of interrupting him,) \'I\'ll give him.', '3.00', 3, 36, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(39, 'Alice. \'I wonder what was going to remark myself.\' \'Have you seen the Mock Turtle, who looked at.', '4.00', 5, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(40, 'The Rabbit started violently, dropped the white kid gloves and a Dodo, a Lory and an Eaglet, and.', '2.00', 3, 7, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(41, 'Do you think you could only hear whispers now and then, if I was, I shouldn\'t want YOURS: I don\'t.', '2.00', 3, 26, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(42, 'Duchess?\' \'Hush! Hush!\' said the Mock Turtle yawned and shut his eyes.--\'Tell her about the right.', '2.00', 8, 6, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(43, 'I am so VERY remarkable in that; nor did Alice think it so quickly that the mouse to the confused.', '1.00', 7, 26, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(44, 'YET,\' she said to herself, \'the way all the unjust things--\' when his eye chanced to fall upon.', '4.00', 7, 9, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(45, 'Alice; not that she had forgotten the little glass box that was said, and went on: \'But why did.', '2.00', 3, 17, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(46, 'Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. He looked at it.', '4.00', 8, 19, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(47, 'Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit.', '1.00', 3, 36, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(48, 'There was a good deal frightened by this time). \'Don\'t grunt,\' said Alice; \'it\'s laid for a.', '4.00', 3, 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(49, 'Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Gryphon. \'I mean, what makes them.', '2.00', 7, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(50, 'Mouse only growled in reply. \'Idiot!\' said the Gryphon, sighing in his confusion he bit a large.', '1.00', 8, 9, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(51, 'Queen. \'I never went to the shore. CHAPTER III. A Caucus-Race and a scroll of parchment in the.', '2.00', 3, 24, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(52, 'So they had been wandering, when a cry of \'The trial\'s beginning!\' was heard in the pool, \'and she.', '2.00', 7, 38, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(53, 'Alice, always ready to make ONE respectable person!\' Soon her eye fell upon a low trembling voice.', '3.00', 7, 23, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(54, 'YOU manage?\' Alice asked. The Hatter shook his head off outside,\' the Queen to play croquet.\' The.', '1.00', 5, 18, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(55, 'Lory. Alice replied very politely, \'for I can\'t remember,\' said the Caterpillar angrily, rearing.', '1.00', 5, 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(56, 'The Antipathies, I think--\' (for, you see, Alice had learnt several things of this was the Hatter.', '4.00', 8, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(57, 'Alice sharply, for she had grown in the way I want to see if she had somehow fallen into a small.', '5.00', 3, 16, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(58, 'Alice, seriously, \'I\'ll have nothing more happened, she decided to remain where she was, and.', '2.00', 8, 31, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(59, 'YOU do it!--That I won\'t, then!--Bill\'s to go with the strange creatures of her skirt, upsetting.', '2.00', 5, 34, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(60, 'King, \'unless it was very likely true.) Down, down, down. There was no \'One, two, three, and.', '1.00', 5, 16, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(61, 'I\'ll never go THERE again!\' said Alice timidly. \'Would you tell me,\' said Alice, and she went on.', '1.00', 5, 20, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(62, 'Sing her \"Turtle Soup,\" will you, won\'t you, won\'t you, will you, old fellow?\' The Mock Turtle.', '2.00', 8, 16, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(63, 'THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at the Caterpillar\'s making such VERY short.', '4.00', 3, 38, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(64, 'Duchess and the party sat silent and looked at each other for some time after the candle is like.', '3.00', 5, 20, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(65, 'Queen in front of them, with her face like the look of the wood--(she considered him to you.', '2.00', 8, 20, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(66, 'YOU must cross-examine the next question is, what did the archbishop find?\' The Mouse gave a look.', '2.00', 8, 6, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(67, 'What WILL become of you? I gave her one, they gave him two, You gave us three or more; They all.', '1.00', 7, 15, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(68, 'I hadn\'t begun my tea--not above a week or so--and what with the time,\' she said, \'than waste it.', '2.00', 3, 20, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(69, 'Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, whose thoughts were still running on the.', '1.00', 8, 32, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(70, 'French lesson-book. The Mouse looked at it gloomily: then he dipped it into one of the jury.', '2.00', 3, 30, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(71, 'Footman. \'That\'s the first figure,\' said the Gryphon replied very politely, feeling quite pleased.', '4.00', 8, 9, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(72, 'So they went up to her feet as the Caterpillar took the hookah into its eyes by this time, as it.', '1.00', 8, 9, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(73, 'Oh dear! I wish you wouldn\'t mind,\' said Alice: \'three inches is such a rule at processions; \'and.', '1.00', 3, 25, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(74, 'Alice. \'I\'ve so often read in the other. In the very middle of one! There ought to have him with.', '3.00', 8, 16, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(75, 'I\'d only been the whiting,\' said the Lory hastily. \'I thought you did,\' said the Gryphon. \'Well, I.', '1.00', 7, 5, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(76, 'THE VOICE OF THE SLUGGARD,\"\' said the Gryphon. \'How the creatures argue. It\'s enough to get hold.', '1.00', 8, 12, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(77, 'Australia?\' (and she tried to open her mouth; but she remembered how small she was now about two.', '3.00', 8, 29, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(78, 'But she went back to her: its face was quite tired and out of it, and found that, as nearly as she.', '2.00', 5, 20, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(79, 'Allow me to sell you a present of everything I\'ve said as yet.\' \'A cheap sort of idea that they.', '1.00', 7, 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(80, 'Alice, timidly; \'some of the Gryphon, \'you first form into a tree. \'Did you say pig, or fig?\' said.', '5.00', 7, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(81, 'Number One,\' said Alice. \'Of course not,\' said Alice aloud, addressing nobody in particular.', '2.00', 3, 29, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(82, 'Gryphon, and the two creatures, who had got its head to feel a little pattering of feet in a large.', '2.00', 7, 24, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(83, 'Five, \'and I\'ll tell him--it was for bringing the cook tulip-roots instead of onions.\' Seven flung.', '2.00', 5, 7, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(84, 'I\'ve seen that done,\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'Now we shall.', '1.00', 8, 24, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(85, 'I vote the young man said, \'And your hair has become very white; And yet you incessantly stand on.', '2.00', 8, 22, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(86, 'Cat\'s head began fading away the time. Alice had no idea what to beautify is, I suppose?\' said.', '1.00', 7, 17, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(87, 'Gryphon, and the sound of a candle is like after the birds! Why, she\'ll eat a little scream of.', '3.00', 5, 20, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(88, 'I shan\'t grow any more--As it is, I suppose?\' \'Yes,\' said Alice as he said in an offended tone.', '4.00', 3, 32, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(89, 'Alice, and she felt unhappy. \'It was much pleasanter at home,\' thought poor Alice, that she let.', '4.00', 8, 19, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(90, 'King added in a low voice, \'Why the fact is, you ARE a simpleton.\' Alice did not dare to disobey.', '3.00', 5, 30, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(91, 'There could be NO mistake about it: it was quite silent for a moment to be two people. \'But it\'s.', '1.00', 5, 23, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(92, 'Alice)--\'and perhaps you were me?\' \'Well, perhaps you haven\'t found it made no mark; but he would.', '1.00', 8, 26, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(93, 'What happened to me! I\'LL soon make you dry enough!\' They all sat down and saying to herself what.', '4.00', 3, 37, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(94, 'Just at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh!.', '4.00', 7, 26, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(95, 'Gryphon in an offended tone, \'so I should like to be ashamed of yourself for asking such a very.', '1.00', 5, 13, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(96, 'Alice began to cry again. \'You ought to be lost, as she could. \'No,\' said Alice. \'Why?\' \'IT DOES.', '1.00', 8, 23, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(97, 'KNOW IT TO BE TRUE--\" that\'s the jury-box,\' thought Alice, \'as all the first sentence in her.', '1.00', 8, 17, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(98, 'I don\'t care which happens!\' She ate a little worried. \'Just about as much use in saying anything.', '3.00', 3, 25, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(99, 'I see\"!\' \'You might just as I used--and I don\'t like the look of the goldfish kept running in her.', '3.00', 5, 22, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(100, 'My notion was that it was a dead silence. Alice noticed with some difficulty, as it was YOUR.', '1.00', 3, 8, '2022-05-16 23:15:48', '2022-05-16 23:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `faq_category_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Voluptas repudiandae rerum eum voluptatem. Voluptatem omnis incidunt architecto placeat ut.\"}', '{\"en\":\"Cheshire Cat: now I shall have to fly; and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the looking-glass. There was no one to listen to her, still it.\"}', 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(2, '{\"en\":\"Maxime consequatur consectetur neque. Unde cumque nulla libero. Iusto sit sunt corrupti impedit.\"}', '{\"en\":\"White Rabbit, jumping up and rubbed its eyes: then it chuckled. \'What fun!\' said the King. (The jury all looked puzzled.) \'He must have been changed in the world am I? Ah, THAT\'S the great hall.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(3, '{\"en\":\"Quas explicabo est ipsum autem nostrum quia corporis. Quibusdam laudantium ducimus similique at.\"}', '{\"en\":\"Fury: \\\"I\'ll try the thing Mock Turtle is.\' \'It\'s the thing yourself, some winter day, I will prosecute YOU.--Come, I\'ll take no denial; We must have a trial: For really this morning I\'ve nothing to.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(4, '{\"en\":\"Non alias dignissimos blanditiis. Et libero quos laboriosam impedit. Atque quae ut non et.\"}', '{\"en\":\"CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, jumping up and straightening itself out again, so she sat on, with closed eyes, and half of them--and it belongs to the other side of the shepherd.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(5, '{\"en\":\"Aut maxime est animi. Nisi quia esse sint ea veniam distinctio.\"}', '{\"en\":\"Come on!\' \'Everybody says \\\"come on!\\\" here,\' thought Alice, \'and those twelve creatures,\' (she was so full of tears, \'I do wish I hadn\'t begun my tea--not above a week or so--and what with the dream.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(6, '{\"en\":\"Sunt voluptas natus sapiente. Maiores animi et odio odit sit omnis ea.\"}', '{\"en\":\"For anything tougher than suet; Yet you finished the goose, with the game,\' the Queen jumped up in spite of all her coaxing. Hardly knowing what she did, she picked up a little bit of mushroom, and.\"}', 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(7, '{\"en\":\"Dolores repellat natus quia praesentium suscipit et et. Pariatur quas hic et voluptatem nisi.\"}', '{\"en\":\"As she said this, she came up to the jury. They were indeed a queer-looking party that assembled on the breeze that followed them, the melancholy words:-- \'Soo--oop of the Lizard\'s slate-pencil, and.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(8, '{\"en\":\"Est reprehenderit laborum quod cupiditate est aperiam. Minus eveniet porro rem animi sint.\"}', '{\"en\":\"But, now that I\'m perfectly sure I can\'t quite follow it as well as she picked up a little now and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. \'He won\'t stand beating. Now, if you.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(9, '{\"en\":\"Accusantium aperiam minima eum debitis nemo. Dicta iste magni officiis. Et aliquam non provident.\"}', '{\"en\":\"Gryphon, the squeaking of the bill, \\\"French, music, AND WASHING--extra.\\\"\' \'You couldn\'t have wanted it much,\' said Alice; \'all I know all sorts of things--I can\'t remember half of fright and half of.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(10, '{\"en\":\"Voluptas sapiente ipsa illum voluptatem. Vero sapiente autem quis cum et. Ut natus et numquam odio.\"}', '{\"en\":\"Exactly as we were. My notion was that you never to lose YOUR temper!\' \'Hold your tongue!\' added the Dormouse, not choosing to notice this question, but hurriedly went on, very much confused, \'I.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(11, '{\"en\":\"Libero qui temporibus qui est. Voluptate animi ut quaerat maxime. Illum ab et mollitia quo.\"}', '{\"en\":\"Alice the moment she appeared; but she ran off at once, while all the first really clever thing the King said to the game. CHAPTER IX. The Mock Turtle\'s heavy sobs. Lastly, she pictured to herself.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(12, '{\"en\":\"Blanditiis expedita sed fuga facere. Quasi deleniti impedit autem. Est voluptatem nihil voluptatem.\"}', '{\"en\":\"Alice: \'I don\'t even know what they\'re about!\' \'Read them,\' said the Cat, and vanished. Alice was just beginning to think about it, you may SIT down,\' the King said, for about the games now.\'.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(13, '{\"en\":\"Ut vel molestiae omnis ipsa dolor libero. Et deserunt placeat excepturi aut.\"}', '{\"en\":\"THIS!\' (Sounds of more broken glass.) \'Now tell me, please, which way it was only too glad to find that the way of escape, and wondering what to do, so Alice went on again:-- \'I didn\'t write it, and.\"}', 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(14, '{\"en\":\"Maxime quidem aliquid architecto doloremque. Quaerat non et provident facere et cupiditate.\"}', '{\"en\":\"Five. \'I heard the Rabbit just under the window, and one foot to the jury, in a furious passion, and went to school in the way the people that walk with their heads down! I am very tired of being.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(15, '{\"en\":\"Nesciunt quas magnam expedita alias ex. Eos fugiat molestiae deserunt eius.\"}', '{\"en\":\"There was a child,\' said the King; and the baby violently up and down looking for eggs, as it didn\'t much matter which way I want to get hold of anything, but she had somehow fallen into a tidy.\"}', 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(16, '{\"en\":\"Veritatis nobis illum aperiam nemo. Sint ipsum dolorem molestias architecto.\"}', '{\"en\":\"Soup! \'Beautiful Soup! Who cares for fish, Game, or any other dish? Who would not stoop? Soup of the court. (As that is enough,\' Said his father; \'don\'t give yourself airs! Do you think, at your.\"}', 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(17, '{\"en\":\"Ut vero commodi sit sapiente veniam ex. Accusantium et nobis eos modi qui.\"}', '{\"en\":\"Alice did not look at the bottom of a well?\' The Dormouse shook itself, and was a bright idea came into Alice\'s head. \'Is that the way YOU manage?\' Alice asked. \'We called him a fish)--and rapped.\"}', 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(18, '{\"en\":\"Consequatur voluptatem vitae aperiam facere id. Nesciunt et eveniet facere eos magnam et.\"}', '{\"en\":\"Alice. \'Why?\' \'IT DOES THE BOOTS AND SHOES.\' the Gryphon hastily. \'Go on with the distant sobs of the sort!\' said Alice. \'Come, let\'s try Geography. London is the same words as before, \'It\'s all his.\"}', 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(19, '{\"en\":\"Commodi qui ullam aliquid sed aliquam sed. Beatae aliquam et quis.\"}', '{\"en\":\"Those whom she sentenced were taken into custody by the Hatter, and here the conversation dropped, and the March Hare took the hookah out of sight, he said to the law, And argued each case with my.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(20, '{\"en\":\"Sint rem et cumque doloribus harum. Debitis officia ut beatae minus optio.\"}', '{\"en\":\"I THINK; or is it I can\'t take LESS,\' said the Queen. \'Can you play croquet?\' The soldiers were silent, and looked at them with one foot. \'Get up!\' said the Footman, \'and that for the Dormouse,\'.\"}', 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(21, '{\"en\":\"Enim velit cumque consequatur rem. Pariatur sit maiores est amet tempore ut.\"}', '{\"en\":\"Where CAN I have to whisper a hint to Time, and round the rosetree; for, you see, as they were playing the Queen to play croquet.\' The Frog-Footman repeated, in the night? Let me see: I\'ll give them.\"}', 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(22, '{\"en\":\"Ea dolor et et sunt est quo vel. Consequatur aut rem voluptatem aliquid et iure explicabo.\"}', '{\"en\":\"Alice did not like to show you! A little bright-eyed terrier, you know, this sort of way, \'Do cats eat bats, I wonder?\' And here Alice began to get rather sleepy, and went by without noticing her.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(23, '{\"en\":\"Assumenda doloribus sed delectus et. Dignissimos sed consectetur velit et est itaque id.\"}', '{\"en\":\"SIT down,\' the King said to herself what such an extraordinary ways of living would be the right word) \'--but I shall think nothing of tumbling down stairs! How brave they\'ll all think me for his.\"}', 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(24, '{\"en\":\"Ipsam beatae nam repellat laudantium omnis omnis. Accusantium ut eligendi sit fugiat ex et.\"}', '{\"en\":\"Why, there\'s hardly room for her. \'I wish I could not answer without a cat! It\'s the most important piece of rudeness was more than that, if you like,\' said the Gryphon only answered \'Come on!\' and.\"}', 4, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(25, '{\"en\":\"Eum qui eum adipisci vel minus consequuntur. Iusto ex est qui et fuga.\"}', '{\"en\":\"March Hare and his friends shared their never-ending meal, and the m--\' But here, to Alice\'s side as she could not help bursting out laughing: and when she had not as yet had any dispute with the.\"}', 4, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(26, '{\"en\":\"Quod debitis velit autem et soluta error. Magni ducimus eos beatae culpa.\"}', '{\"en\":\"At last the Gryphon whispered in a twinkling! Half-past one, time for dinner!\' (\'I only wish it was,\' he said. \'Fifteenth,\' said the Dormouse into the loveliest garden you ever eat a little timidly.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(27, '{\"en\":\"Quaerat et dicta iste dolore. Rerum non pariatur placeat est labore. At expedita quos non et.\"}', '{\"en\":\"Alice, who had been all the jurymen are back in their mouths; and the reason they\'re called lessons,\' the Gryphon whispered in reply, \'for fear they should forget them before the trial\'s over!\'.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(28, '{\"en\":\"Consequuntur vero nulla laudantium atque amet omnis. Autem soluta et vel et facere doloribus.\"}', '{\"en\":\"Queen of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said to one of its right ear and left foot, so as to the table to measure herself by it, and yet it was.\"}', 1, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(29, '{\"en\":\"Dolore quibusdam unde quo id. Dolorum ut tempora enim sit.\"}', '{\"en\":\"Gryphon. \'Do you mean by that?\' said the Cat; and this was not an encouraging opening for a great deal to come yet, please your Majesty?\' he asked. \'Begin at the corners: next the ten courtiers.\"}', 3, '2022-05-16 23:15:49', '2022-05-16 23:15:49'),
(30, '{\"en\":\"Fugiat veniam aliquam ut commodi et nulla. Quibusdam aut omnis ipsa voluptas ad et fugit.\"}', '{\"en\":\"YOUR temper!\' \'Hold your tongue!\' said the Dormouse; \'VERY ill.\' Alice tried to speak, and no one could possibly hear you.\' And certainly there was nothing else to say whether the pleasure of making.\"}', 2, '2022-05-16 23:15:49', '2022-05-16 23:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Service\"}', '2022-05-16 23:15:46', '2022-05-16 23:15:46'),
(2, '{\"en\":\"Service\"}', '2022-05-16 23:15:46', '2022-05-16 23:15:46'),
(3, '{\"en\":\"Service\"}', '2022-05-16 23:15:46', '2022-05-16 23:15:46'),
(4, '{\"en\":\"Service\"}', '2022-05-16 23:15:46', '2022-05-16 23:15:46'),
(5, '{\"en\":\"Service\"}', '2022-05-16 23:15:46', '2022-05-16 23:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(10) UNSIGNED NOT NULL,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorite_options`
--

CREATE TABLE `favorite_options` (
  `option_id` int(10) UNSIGNED NOT NULL,
  `favorite_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `description`, `e_provider_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"Qui quis eos vel deserunt odit et possimus.\"}', 5, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(2, '{\"en\":\"Sit atque ad est hic.\"}', 6, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(3, '{\"en\":\"Sequi consequatur excepturi voluptas autem similique.\"}', 9, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(4, '{\"en\":\"Vitae minus similique veniam id.\"}', 3, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(5, '{\"en\":\"Saepe sunt et id ea et.\"}', 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(6, '{\"en\":\"Beatae vel quibusdam sed qui aut.\"}', 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(7, '{\"en\":\"Suscipit quasi qui necessitatibus harum in harum.\"}', 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(8, '{\"en\":\"Qui consequatur sed repudiandae sed voluptatem sed in.\"}', 18, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(9, '{\"en\":\"Expedita rerum qui aspernatur incidunt.\"}', 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(10, '{\"en\":\"Quae non non pariatur dolorem.\"}', 5, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(11, '{\"en\":\"Odit soluta explicabo quia.\"}', 11, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(12, '{\"en\":\"Aperiam necessitatibus odio omnis ad blanditiis et excepturi.\"}', 11, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(13, '{\"en\":\"Beatae eum ducimus autem quis quaerat quaerat quos nostrum.\"}', 5, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(14, '{\"en\":\"Eos repellat ut autem culpa laboriosam nulla.\"}', 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(15, '{\"en\":\"Nemo possimus dolorem harum sit repellat.\"}', 1, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(16, '{\"en\":\"Vel est ullam expedita officiis natus.\"}', 12, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(17, '{\"en\":\"Facere perspiciatis qui perspiciatis vero optio ea dolore nihil.\"}', 12, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(18, '{\"en\":\"Autem in aliquam eaque libero.\"}', 3, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(19, '{\"en\":\"Iusto omnis ut libero esse et.\"}', 4, '2022-05-16 23:15:47', '2022-05-16 23:15:47'),
(20, '{\"en\":\"Tempore veniam laboriosam tenetur sed.\"}', 7, '2022-05-16 23:15:47', '2022-05-16 23:15:47');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\PaymentMethod', 2, 'logo', 'razorpay', 'razorpay.png', 'image/png', 'public', 13026, '[]', '{\"uuid\":\"13e62475-6b5f-4812-b484-2b94cc52b715\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 3, '2021-05-08 01:03:38', '2021-05-08 01:03:38'),
(5, 'App\\Models\\PaymentMethod', 5, 'logo', 'paypal', 'paypal.png', 'image/png', 'public', 15819, '[]', '{\"uuid\":\"2b8bd9b8-5c37-4464-a5c7-623496d7655f\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 5, '2021-05-08 01:03:49', '2021-05-08 01:03:49'),
(7, 'App\\Models\\PaymentMethod', 6, 'logo', 'pay_pickup', 'pay_pickup.png', 'image/png', 'public', 11712, '[]', '{\"uuid\":\"5e06e7ca-ac33-413c-9ab0-6fd4e3083cc1\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 7, '2021-05-08 01:03:58', '2021-05-08 01:03:58'),
(9, 'App\\Models\\PaymentMethod', 7, 'logo', 'stripe-logo', 'stripe-logo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a36-8a5e-4c85-8d6e-c356843429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 9, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(10, 'App\\Models\\PaymentMethod', 9, 'logo', 'flutterwave', 'flutterwave.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a96-8a5e-4a85-8d6e-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 10, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(11, 'App\\Models\\PaymentMethod', 8, 'logo', 'paystack', 'paystack.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd448a96-8a5e-4c85-8d6e-c356648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 11, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(12, 'App\\Models\\PaymentMethod', 10, 'logo', 'fpx', 'fpx.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(13, 'App\\Models\\PaymentMethod', 11, 'logo', 'wallet', 'wallet.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(14, 'App\\Models\\PaymentMethod', 12, 'logo', 'paymongo', 'paymongo.png', 'image/png', 'public', 5436, '[]', '{\"uuid\":\"bd558a84-8a5e-4b85-8d6f-c456648429c8\",\"user_id\":1,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 12, '2021-05-08 01:04:23', '2021-05-08 01:04:23'),
(15, 'App\\Models\\Upload', 1, 'image', 'scaled_image_picker8438199976938633800', 'scaled_image_picker8438199976938633800.jpg', 'image/jpeg', 'public', 48952, '[]', '{\"uuid\":\"fac3d494-8d91-4124-867f-e1db8143cf53\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 13, '2022-07-26 16:24:59', '2022-07-26 16:25:02'),
(16, 'App\\Models\\Upload', 2, 'image', 'scaled_image_picker8860313814243473989', 'scaled_image_picker8860313814243473989.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"9c613fbe-70fe-46a0-9155-88c7a38d7f12\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 14, '2022-07-26 17:18:37', '2022-07-26 17:18:38'),
(17, 'App\\Models\\EService', 41, 'image', 'scaled_image_picker8860313814243473989', 'scaled_image_picker8860313814243473989.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"9c613fbe-70fe-46a0-9155-88c7a38d7f12\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 15, '2022-07-26 17:19:41', '2022-07-26 17:19:41'),
(18, 'App\\Models\\Upload', 3, 'image', 'scaled_image_picker3793149220871917445', 'scaled_image_picker3793149220871917445.png', 'image/jpeg', 'public', 30632, '[]', '{\"uuid\":\"6cf88d93-2b48-4e51-ab25-4c73711dc7d1\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 16, '2022-07-27 09:20:35', '2022-07-27 09:20:36'),
(19, 'App\\Models\\EService', 42, 'image', 'scaled_image_picker3793149220871917445', 'scaled_image_picker3793149220871917445.png', 'image/jpeg', 'public', 30632, '[]', '{\"uuid\":\"6cf88d93-2b48-4e51-ab25-4c73711dc7d1\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 17, '2022-07-27 09:21:29', '2022-07-27 09:21:29'),
(20, 'App\\Models\\Upload', 4, 'image', 'scaled_image_picker5614820465485544851', 'scaled_image_picker5614820465485544851.png', 'image/jpeg', 'public', 30632, '[]', '{\"uuid\":\"8f4d617a-54a6-4488-a0c2-9caef30b0bfa\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 18, '2022-07-27 09:22:04', '2022-07-27 09:22:04'),
(21, 'App\\Models\\EService', 43, 'image', 'scaled_image_picker5614820465485544851', 'scaled_image_picker5614820465485544851.png', 'image/jpeg', 'public', 30632, '[]', '{\"uuid\":\"8f4d617a-54a6-4488-a0c2-9caef30b0bfa\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 19, '2022-07-27 09:22:32', '2022-07-27 09:22:32'),
(22, 'App\\Models\\Upload', 5, 'image', 'scaled_image_picker6061621935824611113', 'scaled_image_picker6061621935824611113.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"7a1f7568-84b6-4703-98fd-a579d29c36e3\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 20, '2022-07-27 11:35:17', '2022-07-27 11:35:19'),
(23, 'App\\Models\\EService', 44, 'image', 'scaled_image_picker6061621935824611113', 'scaled_image_picker6061621935824611113.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"7a1f7568-84b6-4703-98fd-a579d29c36e3\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 21, '2022-07-27 11:36:44', '2022-07-27 11:36:44'),
(24, 'App\\Models\\Upload', 6, 'image', 'scaled_image_picker1460177954289513090', 'scaled_image_picker1460177954289513090.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"4f050978-0d7c-4c3c-84c0-0a52ed13f663\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 22, '2022-07-27 11:39:10', '2022-07-27 11:39:12'),
(25, 'App\\Models\\Option', 101, 'image', 'scaled_image_picker1460177954289513090', 'scaled_image_picker1460177954289513090.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"4f050978-0d7c-4c3c-84c0-0a52ed13f663\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 23, '2022-07-27 11:39:40', '2022-07-27 11:39:40'),
(26, 'App\\Models\\Upload', 7, 'image', 'scaled_image_picker2050097486917512890', 'scaled_image_picker2050097486917512890.jpg', 'image/jpeg', 'public', 48952, '[]', '{\"uuid\":\"415eb666-36fb-4aaf-befa-f6aefc3e448f\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 24, '2022-07-27 11:54:36', '2022-07-27 11:54:37'),
(27, 'App\\Models\\EService', 45, 'image', 'scaled_image_picker2050097486917512890', 'scaled_image_picker2050097486917512890.jpg', 'image/jpeg', 'public', 48952, '[]', '{\"uuid\":\"415eb666-36fb-4aaf-befa-f6aefc3e448f\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 25, '2022-07-27 11:55:21', '2022-07-27 11:55:21'),
(28, 'App\\Models\\Upload', 8, 'image', 'scaled_image_picker1817723027992355365', 'scaled_image_picker1817723027992355365.png', 'image/jpeg', 'public', 192913, '[]', '{\"uuid\":\"c1b76138-2848-4f7c-aadb-af36b414cd54\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 26, '2022-07-27 12:03:44', '2022-07-27 12:03:46'),
(29, 'App\\Models\\EService', 46, 'image', 'scaled_image_picker1817723027992355365', 'scaled_image_picker1817723027992355365.png', 'image/jpeg', 'public', 192913, '[]', '{\"uuid\":\"c1b76138-2848-4f7c-aadb-af36b414cd54\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 27, '2022-07-27 12:05:46', '2022-07-27 12:05:46'),
(30, 'App\\Models\\Upload', 9, 'image', 'scaled_image_picker4402587526630982224', 'scaled_image_picker4402587526630982224.png', 'image/png', 'public', 22570, '[]', '{\"uuid\":\"9c47e18f-c254-4e05-895f-9af4ad92a1a0\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 28, '2022-07-27 12:35:40', '2022-07-27 12:35:40'),
(31, 'App\\Models\\EService', 47, 'image', 'scaled_image_picker4402587526630982224', 'scaled_image_picker4402587526630982224.png', 'image/png', 'public', 22570, '[]', '{\"uuid\":\"9c47e18f-c254-4e05-895f-9af4ad92a1a0\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 29, '2022-07-27 12:36:43', '2022-07-27 12:36:43'),
(32, 'App\\Models\\Upload', 10, 'image', 'scaled_image_picker5362101211503868249', 'scaled_image_picker5362101211503868249.png', 'image/png', 'public', 721, '[]', '{\"uuid\":\"0cc6b07e-27da-4a92-ac2c-2d27fae8c6dd\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 30, '2022-07-27 13:04:25', '2022-07-27 13:04:26'),
(33, 'App\\Models\\Upload', 11, 'image', 'scaled_image_picker3947993621097324670', 'scaled_image_picker3947993621097324670.png', 'image/jpeg', 'public', 125644, '[]', '{\"uuid\":\"91d77880-39d3-495c-b6cc-3b6024932b06\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 31, '2022-07-27 13:24:08', '2022-07-27 13:24:09'),
(34, 'App\\Models\\Upload', 12, 'image', 'scaled_image_picker1530833315339500545', 'scaled_image_picker1530833315339500545.png', 'image/jpeg', 'public', 57002, '[]', '{\"uuid\":\"0a1f2b72-9074-43a3-8704-d0c28dd86812\",\"user_id\":37,\"generated_conversions\":{\"thumb\":true,\"icon\":true}}', '[]', 32, '2022-07-27 13:50:19', '2022-07-27 13:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_05_26_175145_create_permission_tables', 1),
(4, '2018_06_12_140344_create_media_table', 1),
(5, '2018_06_13_035117_create_uploads_table', 1),
(6, '2018_07_17_180731_create_settings_table', 1),
(7, '2018_07_24_211308_create_custom_fields_table', 1),
(8, '2018_07_24_211327_create_custom_field_values_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_08_29_213829_create_faq_categories_table', 1),
(11, '2019_08_29_213926_create_faqs_table', 1),
(12, '2019_10_22_144652_create_currencies_table', 1),
(13, '2021_01_07_162658_create_payment_methods_table', 1),
(14, '2021_01_07_164755_create_payment_statuses_table', 1),
(15, '2021_01_07_165422_create_payments_table', 1),
(16, '2021_01_13_105605_create_e_provider_types_table', 1),
(17, '2021_01_13_111155_create_e_providers_table', 1),
(18, '2021_01_13_111622_create_experiences_table', 1),
(19, '2021_01_13_111730_create_awards_table', 1),
(20, '2021_01_13_114302_create_taxes_table', 1),
(21, '2021_01_13_200249_create_addresses_table', 1),
(22, '2021_01_15_115239_create_e_provider_addresses_table', 1),
(23, '2021_01_15_115747_create_e_provider_users_table', 1),
(24, '2021_01_15_115850_create_e_provider_taxes_table', 1),
(25, '2021_01_16_160838_create_availability_hours_table', 1),
(26, '2021_01_19_135951_create_e_services_table', 1),
(27, '2021_01_19_140427_create_categories_table', 1),
(28, '2021_01_19_171553_create_e_service_categories_table', 1),
(29, '2021_01_22_194514_create_option_groups_table', 1),
(30, '2021_01_22_200807_create_options_table', 1),
(31, '2021_01_22_205819_create_favorites_table', 1),
(32, '2021_01_22_205944_create_favorite_options_table', 1),
(33, '2021_01_23_125641_create_e_service_reviews_table', 1),
(34, '2021_01_23_201533_create_galleries_table', 1),
(35, '2021_01_25_105421_create_slides_table', 1),
(36, '2021_01_25_162055_create_notifications_table', 1),
(37, '2021_01_25_170522_create_coupons_table', 1),
(38, '2021_01_25_170529_create_discountables_table', 1),
(39, '2021_01_25_191833_create_booking_statuses_table', 1),
(40, '2021_01_25_212252_create_bookings_table', 1),
(41, '2021_01_30_111717_create_e_provider_payouts_table', 1),
(42, '2021_01_30_135356_create_earnings_table', 1),
(43, '2021_02_24_102838_create_custom_pages_table', 1),
(44, '2021_06_26_110636_create_json_extract_function', 1),
(45, '2021_08_08_134136_create_wallets_table', 1),
(46, '2021_08_08_155732_create_wallet_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 37),
(4, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 7),
(4, 'App\\Models\\User', 8),
(4, 'App\\Models\\User', 9),
(4, 'App\\Models\\User', 10),
(4, 'App\\Models\\User', 11),
(4, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 13),
(4, 'App\\Models\\User', 14),
(4, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(4, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22),
(4, 'App\\Models\\User', 23),
(4, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(4, 'App\\Models\\User', 26),
(4, 'App\\Models\\User', 27),
(4, 'App\\Models\\User', 28),
(4, 'App\\Models\\User', 29),
(4, 'App\\Models\\User', 30),
(4, 'App\\Models\\User', 31),
(4, 'App\\Models\\User', 32),
(4, 'App\\Models\\User', 33),
(4, 'App\\Models\\User', 34),
(4, 'App\\Models\\User', 35),
(4, 'App\\Models\\User', 36),
(4, 'App\\Models\\User', 38),
(4, 'App\\Models\\User', 39);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `e_service_id` int(10) UNSIGNED NOT NULL,
  `option_group_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `description`, `price`, `e_service_id`, `option_group_id`, `created_at`, `updated_at`) VALUES
(1, '{\"en\":\"20m\"}', '{\"en\":\"Exercitationem placeat cupiditate.\"}', 16.66, 39, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(2, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Quidem pariatur quas blanditiis exercitationem.\"}', 17.15, 2, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(3, '{\"en\":\"40m\"}', '{\"en\":\"Repudiandae earum adipisci rerum modi doloremque.\"}', 38.09, 16, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(4, '{\"en\":\"20m\"}', '{\"en\":\"Nobis sapiente harum ut deserunt.\"}', 16.30, 2, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(5, '{\"en\":\"20m\"}', '{\"en\":\"Quo ex corporis corporis fugit.\"}', 38.62, 18, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(6, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Similique reprehenderit cumque rerum iure.\"}', 34.01, 13, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(7, '{\"en\":\"40m\"}', '{\"en\":\"Voluptas id pariatur tenetur sint.\"}', 14.10, 18, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(8, '{\"en\":\"40m\"}', '{\"en\":\"Laudantium quasi sint nobis qui rerum.\"}', 19.78, 7, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(9, '{\"en\":\"20m\"}', '{\"en\":\"Incidunt exercitationem amet omnis.\"}', 27.47, 17, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(10, '{\"en\":\"40m\"}', '{\"en\":\"Earum autem voluptatem totam et.\"}', 39.63, 2, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(11, '{\"en\":\"40m\"}', '{\"en\":\"Aut quo sit dolores et.\"}', 33.62, 19, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(12, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Architecto quas pariatur reprehenderit.\"}', 13.21, 35, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(13, '{\"en\":\"20m\"}', '{\"en\":\"Quis libero nostrum dignissimos.\"}', 25.96, 9, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(14, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Neque tempore vitae provident.\"}', 33.04, 3, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(15, '{\"en\":\"20m\"}', '{\"en\":\"Id molestiae quo nulla.\"}', 41.26, 29, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(16, '{\"en\":\"20m\"}', '{\"en\":\"Facilis molestiae ut sed laboriosam.\"}', 40.92, 11, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(17, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Natus mollitia nisi error voluptas.\"}', 22.13, 36, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(18, '{\"en\":\"20m\"}', '{\"en\":\"Aperiam et qui delectus.\"}', 41.29, 31, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(19, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Necessitatibus voluptatibus ut velit beatae.\"}', 22.45, 24, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(20, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Sed asperiores hic.\"}', 10.01, 13, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(21, '{\"en\":\"20m\"}', '{\"en\":\"Et optio dolorum magni qui quibusdam.\"}', 38.28, 40, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(22, '{\"en\":\"40m\"}', '{\"en\":\"Ipsa quam maiores perspiciatis quos.\"}', 41.59, 16, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(23, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Cumque qui qui voluptas.\"}', 32.34, 13, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(24, '{\"en\":\"20m\"}', '{\"en\":\"Nemo autem omnis.\"}', 47.90, 25, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(25, '{\"en\":\"20m\"}', '{\"en\":\"Mollitia occaecati beatae.\"}', 41.60, 31, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(26, '{\"en\":\"20m\"}', '{\"en\":\"Sed aut provident dolor tenetur.\"}', 36.76, 20, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(27, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Voluptates vel ut aut.\"}', 49.83, 20, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(28, '{\"en\":\"20m\"}', '{\"en\":\"Odit unde et facere commodi.\"}', 25.65, 17, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(29, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Explicabo ullam sed.\"}', 49.37, 25, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(30, '{\"en\":\"40m\"}', '{\"en\":\"Expedita ex quo sapiente.\"}', 46.00, 12, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(31, '{\"en\":\"40m\"}', '{\"en\":\"Dolores id eaque reprehenderit placeat enim.\"}', 15.96, 2, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(32, '{\"en\":\"20m\"}', '{\"en\":\"Voluptates dolor occaecati ea.\"}', 32.31, 3, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(33, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Omnis nisi culpa.\"}', 41.83, 32, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(34, '{\"en\":\"20m\"}', '{\"en\":\"Autem unde id voluptatem.\"}', 33.56, 10, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(35, '{\"en\":\"20m\"}', '{\"en\":\"Id voluptatum et culpa quod.\"}', 44.00, 8, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(36, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Ipsum distinctio quis molestias.\"}', 14.25, 8, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(37, '{\"en\":\"20m\"}', '{\"en\":\"Dolore molestias et hic itaque sit.\"}', 44.16, 23, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(38, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Facilis pariatur rerum.\"}', 43.14, 38, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(39, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Voluptatem nam possimus nisi commodi.\"}', 18.06, 15, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(40, '{\"en\":\"20m\"}', '{\"en\":\"Reprehenderit et neque harum.\"}', 19.91, 13, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(41, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Reprehenderit vel est sunt.\"}', 14.31, 5, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(42, '{\"en\":\"20m\"}', '{\"en\":\"Tempore itaque modi et quis sit.\"}', 22.92, 4, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(43, '{\"en\":\"40m\"}', '{\"en\":\"Possimus ut illo commodi quo.\"}', 40.30, 1, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(44, '{\"en\":\"20m\"}', '{\"en\":\"Commodi nihil illum ea ducimus inventore.\"}', 29.92, 7, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(45, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Facere aut molestias nemo ea.\"}', 20.32, 32, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(46, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Saepe labore dolore quia reiciendis.\"}', 37.25, 24, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(47, '{\"en\":\"20m\"}', '{\"en\":\"Dicta sapiente consequuntur et.\"}', 18.60, 7, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(48, '{\"en\":\"40m\"}', '{\"en\":\"Non qui qui.\"}', 45.16, 35, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(49, '{\"en\":\"20m\"}', '{\"en\":\"Aut accusantium velit ab.\"}', 31.11, 35, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(50, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Nisi et est harum placeat.\"}', 19.75, 15, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(51, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Cumque qui assumenda.\"}', 41.53, 25, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(52, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Dolorum rerum fuga aut.\"}', 29.19, 36, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(53, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Architecto quia magni ipsam quia.\"}', 12.05, 8, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(54, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Deserunt sit nemo ipsum dolorem numquam.\"}', 31.78, 1, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(55, '{\"en\":\"20m\"}', '{\"en\":\"Nam aut doloremque nisi aliquid.\"}', 22.33, 3, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(56, '{\"en\":\"20m\"}', '{\"en\":\"Placeat harum cum non eius.\"}', 13.78, 3, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(57, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Quas enim recusandae qui.\"}', 42.63, 33, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(58, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Voluptatem quia quasi.\"}', 33.27, 29, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(59, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Ipsum ipsam qui nesciunt.\"}', 38.17, 40, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(60, '{\"en\":\"20m\"}', '{\"en\":\"Exercitationem quis at blanditiis.\"}', 40.40, 17, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(61, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Ad minus qui.\"}', 45.45, 11, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(62, '{\"en\":\"40m\"}', '{\"en\":\"Quos saepe esse enim aspernatur.\"}', 14.80, 21, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(63, '{\"en\":\"20m\"}', '{\"en\":\"Eaque possimus error quidem ex.\"}', 10.59, 7, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(64, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Sapiente consectetur harum voluptatem ab.\"}', 30.78, 17, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(65, '{\"en\":\"20m\"}', '{\"en\":\"Et dolorem officia ut aperiam.\"}', 20.21, 31, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(66, '{\"en\":\"40m\"}', '{\"en\":\"Facere porro nisi id aperiam.\"}', 45.92, 22, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(67, '{\"en\":\"20m\"}', '{\"en\":\"Aut dolores in sed qui.\"}', 25.22, 37, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(68, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Assumenda et dolorum amet.\"}', 47.34, 7, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(69, '{\"en\":\"20m\"}', '{\"en\":\"Autem inventore aut sunt incidunt vitae.\"}', 26.55, 35, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(70, '{\"en\":\"40m\"}', '{\"en\":\"Et eaque porro optio nihil inventore.\"}', 34.93, 26, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(71, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Reprehenderit nulla neque fugit molestias est.\"}', 36.47, 32, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(72, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Optio sint quasi voluptatem.\"}', 48.56, 4, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(73, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Error optio ullam ut dignissimos.\"}', 42.27, 29, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(74, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Delectus sunt omnis rerum dolores et.\"}', 22.69, 26, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(75, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Iusto nobis laborum ut dolores.\"}', 22.79, 27, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(76, '{\"en\":\"40m\"}', '{\"en\":\"Vel iste ratione pariatur error.\"}', 20.88, 18, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(77, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Velit consequatur a.\"}', 30.79, 27, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(78, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Necessitatibus nihil est voluptatem voluptate.\"}', 19.33, 8, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(79, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Laborum consequatur facilis.\"}', 48.73, 32, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(80, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Sint praesentium accusantium repellat.\"}', 42.26, 38, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(81, '{\"en\":\"40m\"}', '{\"en\":\"Asperiores laboriosam autem facere iste et.\"}', 48.99, 25, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(82, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Ex tempore voluptatem tenetur.\"}', 21.16, 3, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(83, '{\"en\":\"20m\"}', '{\"en\":\"Quae voluptates voluptas consequatur.\"}', 35.96, 19, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(84, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Ea deserunt tempore non exercitationem occaecati.\"}', 45.37, 23, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(85, '{\"en\":\"40m\"}', '{\"en\":\"Qui dolore temporibus sint eos.\"}', 48.46, 3, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(86, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Iusto qui qui voluptas.\"}', 49.09, 28, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(87, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Ut modi aliquam alias odit esse.\"}', 26.57, 3, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(88, '{\"en\":\"40m\"}', '{\"en\":\"Eum ut nobis.\"}', 31.60, 40, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(89, '{\"en\":\"20m\"}', '{\"en\":\"Non esse neque.\"}', 13.04, 8, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(90, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Sint nostrum voluptatem eos.\"}', 30.10, 11, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(91, '{\"en\":\"20m\"}', '{\"en\":\"Et totam et.\"}', 14.44, 12, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(92, '{\"en\":\"20m\"}', '{\"en\":\"Eos cumque cumque.\"}', 11.09, 26, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(93, '{\"en\":\"40m\"}', '{\"en\":\"Ut nulla qui accusantium ipsam molestiae.\"}', 37.47, 15, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(94, '{\"en\":\"40m\"}', '{\"en\":\"Natus non expedita.\"}', 18.45, 10, 1, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(95, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Commodi et repellat qui et.\"}', 17.74, 35, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(96, '{\"en\":\"20m\"}', '{\"en\":\"Quo sapiente illum aut.\"}', 27.27, 27, 3, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(97, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Alias dolor non iusto esse blanditiis.\"}', 28.69, 18, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(98, '{\"en\":\"30mأ‚آ²\"}', '{\"en\":\"Cupiditate ut eaque a officiis.\"}', 14.51, 3, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(99, '{\"en\":\"10mأ‚آ²\"}', '{\"en\":\"Molestiae et pariatur.\"}', 42.11, 8, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(100, '{\"en\":\"20m\"}', '{\"en\":\"Est cumque non fugit ut aliquam.\"}', 14.61, 12, 2, '2022-05-16 23:15:48', '2022-05-16 23:15:48'),
(101, '{\"ar\":\"fair\"}', '{\"ar\":\"good\"}', 22.00, 44, 2, '2022-07-27 11:39:40', '2022-07-27 11:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `option_groups`
--

CREATE TABLE `option_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_multiple` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `option_groups`
--

INSERT INTO `option_groups` (`id`, `name`, `allow_multiple`, `created_at`, `updated_at`) VALUES
(1, 'Size', 1, '2021-01-23 03:49:15', '2021-02-08 04:30:19'),
(2, 'Area', 1, '2021-01-23 04:46:28', '2021-01-23 04:46:28'),
(3, 'Surface', 0, '2021-01-23 04:46:47', '2021-01-23 04:46:47');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `payment_status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `route`, `order`, `default`, `enabled`, `created_at`, `updated_at`) VALUES
(2, 'RazorPay', 'Click to pay with RazorPay gateway', '/RazorPay', 2, 0, 1, '2021-01-17 22:33:49', '2021-02-18 06:37:30'),
(5, 'PayPal', 'Click to pay with your PayPal account', '/PayPal', 1, 0, 1, '2021-01-17 23:46:06', '2021-02-18 06:38:47'),
(6, 'Cash', 'Click to pay cash when finish', '/Cash', 3, 1, 1, '2021-02-18 06:38:42', '2021-02-18 06:38:42'),
(7, 'Credit Card (Stripe)', 'Click to pay with your Credit Card', '/Stripe', 3, 0, 1, '2021-02-18 06:38:42', '2021-02-18 06:38:42'),
(8, 'PayStack', 'Click to pay with PayStack gateway', '/PayStack', 5, 0, 1, '2021-07-24 05:38:42', '2021-07-24 05:38:42'),
(9, 'FlutterWave', 'Click to pay with FlutterWave gateway', '/FlutterWave', 6, 0, 1, '2021-07-24 05:38:42', '2021-07-24 05:38:42'),
(10, 'Malaysian Stripe FPX	', 'Click to pay with Stripe FPX gateway', '/StripeFPX', 7, 0, 1, '2021-07-25 05:38:42', '2021-07-25 05:38:42'),
(11, 'Wallet', 'Click to pay with Wallet', '/Wallet', 8, 0, 1, '2021-08-09 05:38:42', '2021-08-09 05:38:42'),
(12, 'PayMongo', 'Click to pay with PayMongo', '/PayMongo', 12, 0, 1, '2021-10-09 05:38:42', '2021-10-09 05:38:42');

-- --------------------------------------------------------

--
-- Table structure for table `payment_statuses`
--

CREATE TABLE `payment_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_statuses`
--

INSERT INTO `payment_statuses` (`id`, `status`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Pending', 1, '2021-01-17 23:28:28', '2021-02-18 05:55:15'),
(2, 'Paid', 10, '2021-01-12 07:19:49', '2021-02-18 05:55:53'),
(3, 'Failed', 20, '2021-01-17 22:05:04', '2021-02-18 05:56:32'),
(4, 'Refunded', 40, '2021-02-18 05:58:14', '2021-02-18 05:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2021-01-07 21:17:34', '2021-01-07 21:17:34'),
(2, 'medias.create', 'web', '2021-01-07 21:17:35', '2021-01-07 21:17:35'),
(3, 'users.profile', 'web', '2021-01-07 21:17:35', '2021-01-07 21:17:35'),
(4, 'users.index', 'web', '2021-01-07 21:17:35', '2021-01-07 21:17:35'),
(5, 'users.create', 'web', '2021-01-07 21:17:35', '2021-01-07 21:17:35'),
(6, 'users.store', 'web', '2021-01-07 21:17:35', '2021-01-07 21:17:35'),
(7, 'users.show', 'web', '2021-01-07 21:17:35', '2021-01-07 21:17:35'),
(8, 'users.edit', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(9, 'users.update', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(10, 'users.destroy', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(11, 'medias.delete', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(12, 'medias', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(13, 'permissions.index', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(14, 'permissions.create', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(15, 'permissions.store', 'web', '2021-01-07 21:17:36', '2021-01-07 21:17:36'),
(16, 'permissions.show', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(17, 'permissions.edit', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(18, 'permissions.update', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(19, 'permissions.destroy', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(20, 'roles.index', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(21, 'roles.create', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(22, 'roles.store', 'web', '2021-01-07 21:17:37', '2021-01-07 21:17:37'),
(23, 'roles.show', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(24, 'roles.edit', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(25, 'roles.update', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(26, 'roles.destroy', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(27, 'customFields.index', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(28, 'customFields.create', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(29, 'customFields.store', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(30, 'customFields.show', 'web', '2021-01-07 21:17:38', '2021-01-07 21:17:38'),
(31, 'customFields.edit', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(32, 'customFields.update', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(33, 'customFields.destroy', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(34, 'currencies.index', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(35, 'currencies.create', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(36, 'currencies.store', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(37, 'currencies.edit', 'web', '2021-01-07 21:17:39', '2021-01-07 21:17:39'),
(38, 'currencies.update', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(39, 'currencies.destroy', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(40, 'users.login-as-user', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(41, 'app-settings', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(42, 'faqCategories.index', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(43, 'faqCategories.create', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(44, 'faqCategories.store', 'web', '2021-01-07 21:17:40', '2021-01-07 21:17:40'),
(45, 'faqCategories.edit', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(46, 'faqCategories.update', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(47, 'faqCategories.destroy', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(48, 'faqs.index', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(49, 'faqs.create', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(50, 'faqs.store', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(51, 'faqs.edit', 'web', '2021-01-07 21:17:41', '2021-01-07 21:17:41'),
(52, 'faqs.update', 'web', '2021-01-07 21:17:42', '2021-01-07 21:17:42'),
(53, 'faqs.destroy', 'web', '2021-01-07 21:17:42', '2021-01-07 21:17:42'),
(54, 'payments.index', 'web', '2021-01-11 08:04:33', '2021-01-11 08:04:33'),
(55, 'payments.show', 'web', '2021-01-11 08:04:33', '2021-01-11 08:04:33'),
(56, 'payments.update', 'web', '2021-01-11 08:04:33', '2021-01-11 08:04:33'),
(57, 'paymentMethods.index', 'web', '2021-01-11 08:04:33', '2021-01-11 08:04:33'),
(58, 'paymentMethods.create', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(59, 'paymentMethods.store', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(60, 'paymentMethods.edit', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(61, 'paymentMethods.update', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(62, 'paymentMethods.destroy', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(63, 'paymentStatuses.index', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(64, 'paymentStatuses.create', 'web', '2021-01-11 08:04:34', '2021-01-11 08:04:34'),
(65, 'paymentStatuses.store', 'web', '2021-01-11 08:04:35', '2021-01-11 08:04:35'),
(66, 'paymentStatuses.edit', 'web', '2021-01-11 08:04:35', '2021-01-11 08:04:35'),
(67, 'paymentStatuses.update', 'web', '2021-01-11 08:04:35', '2021-01-11 08:04:35'),
(68, 'paymentStatuses.destroy', 'web', '2021-01-11 08:04:35', '2021-01-11 08:04:35'),
(69, 'verification.notice', 'web', '2021-01-12 18:19:50', '2021-01-12 18:19:50'),
(70, 'verification.verify', 'web', '2021-01-12 18:19:50', '2021-01-12 18:19:50'),
(71, 'verification.resend', 'web', '2021-01-12 18:19:51', '2021-01-12 18:19:51'),
(72, 'awards.index', 'web', '2021-01-12 18:19:51', '2021-01-12 18:19:51'),
(73, 'awards.create', 'web', '2021-01-12 18:19:52', '2021-01-12 18:19:52'),
(74, 'awards.store', 'web', '2021-01-12 18:19:52', '2021-01-12 18:19:52'),
(75, 'awards.show', 'web', '2021-01-12 18:19:52', '2021-01-12 18:19:52'),
(76, 'awards.edit', 'web', '2021-01-12 18:19:52', '2021-01-12 18:19:52'),
(77, 'awards.update', 'web', '2021-01-12 18:19:52', '2021-01-12 18:19:52'),
(78, 'awards.destroy', 'web', '2021-01-12 18:19:52', '2021-01-12 18:19:52'),
(79, 'experiences.index', 'web', '2021-01-12 19:20:29', '2021-01-12 19:20:29'),
(80, 'experiences.create', 'web', '2021-01-12 19:20:29', '2021-01-12 19:20:29'),
(81, 'experiences.store', 'web', '2021-01-12 19:20:30', '2021-01-12 19:20:30'),
(82, 'experiences.show', 'web', '2021-01-12 19:20:30', '2021-01-12 19:20:30'),
(83, 'experiences.edit', 'web', '2021-01-12 19:20:30', '2021-01-12 19:20:30'),
(84, 'experiences.update', 'web', '2021-01-12 19:20:30', '2021-01-12 19:20:30'),
(85, 'experiences.destroy', 'web', '2021-01-12 19:20:30', '2021-01-12 19:20:30'),
(92, 'eProviderTypes.index', 'web', '2021-01-13 19:31:08', '2021-01-13 19:31:08'),
(93, 'eProviderTypes.create', 'web', '2021-01-13 19:31:09', '2021-01-13 19:31:09'),
(94, 'eProviderTypes.store', 'web', '2021-01-13 19:31:09', '2021-01-13 19:31:09'),
(95, 'eProviderTypes.edit', 'web', '2021-01-13 19:31:09', '2021-01-13 19:31:09'),
(96, 'eProviderTypes.update', 'web', '2021-01-13 19:31:09', '2021-01-13 19:31:09'),
(97, 'eProviderTypes.destroy', 'web', '2021-01-13 19:31:09', '2021-01-13 19:31:09'),
(98, 'eProviders.index', 'web', '2021-01-13 19:48:55', '2021-01-13 19:48:55'),
(99, 'eProviders.create', 'web', '2021-01-13 19:48:56', '2021-01-13 19:48:56'),
(100, 'eProviders.store', 'web', '2021-01-13 19:48:56', '2021-01-13 19:48:56'),
(101, 'eProviders.edit', 'web', '2021-01-13 19:48:56', '2021-01-13 19:48:56'),
(102, 'eProviders.update', 'web', '2021-01-13 19:48:56', '2021-01-13 19:48:56'),
(103, 'eProviders.destroy', 'web', '2021-01-13 19:48:56', '2021-01-13 19:48:56'),
(104, 'addresses.index', 'web', '2021-01-13 19:48:56', '2021-01-13 19:48:56'),
(105, 'addresses.create', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(106, 'addresses.store', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(107, 'addresses.edit', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(108, 'addresses.update', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(109, 'addresses.destroy', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(110, 'taxes.index', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(111, 'taxes.create', 'web', '2021-01-13 19:48:57', '2021-01-13 19:48:57'),
(112, 'taxes.store', 'web', '2021-01-13 19:48:58', '2021-01-13 19:48:58'),
(113, 'taxes.edit', 'web', '2021-01-13 19:48:58', '2021-01-13 19:48:58'),
(114, 'taxes.update', 'web', '2021-01-13 19:48:58', '2021-01-13 19:48:58'),
(115, 'taxes.destroy', 'web', '2021-01-13 19:48:58', '2021-01-13 19:48:58'),
(116, 'availabilityHours.index', 'web', '2021-01-17 00:14:21', '2021-01-17 00:14:21'),
(117, 'availabilityHours.create', 'web', '2021-01-17 00:14:21', '2021-01-17 00:14:21'),
(118, 'availabilityHours.store', 'web', '2021-01-17 00:14:21', '2021-01-17 00:14:21'),
(119, 'availabilityHours.edit', 'web', '2021-01-17 00:14:21', '2021-01-17 00:14:21'),
(120, 'availabilityHours.update', 'web', '2021-01-17 00:14:22', '2021-01-17 00:14:22'),
(121, 'availabilityHours.destroy', 'web', '2021-01-17 00:14:22', '2021-01-17 00:14:22'),
(122, 'eServices.index', 'web', '2021-01-19 22:03:00', '2021-01-19 22:03:00'),
(123, 'eServices.create', 'web', '2021-01-19 22:03:00', '2021-01-19 22:03:00'),
(124, 'eServices.store', 'web', '2021-01-19 22:03:00', '2021-01-19 22:03:00'),
(126, 'eServices.edit', 'web', '2021-01-19 22:03:01', '2021-01-19 22:03:01'),
(127, 'eServices.update', 'web', '2021-01-19 22:03:01', '2021-01-19 22:03:01'),
(128, 'eServices.destroy', 'web', '2021-01-19 22:03:01', '2021-01-19 22:03:01'),
(129, 'categories.index', 'web', '2021-01-19 22:08:55', '2021-01-19 22:08:55'),
(130, 'categories.create', 'web', '2021-01-19 22:08:55', '2021-01-19 22:08:55'),
(131, 'categories.store', 'web', '2021-01-19 22:08:55', '2021-01-19 22:08:55'),
(132, 'categories.edit', 'web', '2021-01-19 22:08:55', '2021-01-19 22:08:55'),
(133, 'categories.update', 'web', '2021-01-19 22:08:56', '2021-01-19 22:08:56'),
(134, 'categories.destroy', 'web', '2021-01-19 22:08:56', '2021-01-19 22:08:56'),
(135, 'optionGroups.index', 'web', '2021-01-23 03:48:32', '2021-01-23 03:48:32'),
(136, 'optionGroups.create', 'web', '2021-01-23 03:48:32', '2021-01-23 03:48:32'),
(137, 'optionGroups.store', 'web', '2021-01-23 03:48:32', '2021-01-23 03:48:32'),
(138, 'optionGroups.edit', 'web', '2021-01-23 03:48:32', '2021-01-23 03:48:32'),
(139, 'optionGroups.update', 'web', '2021-01-23 03:48:32', '2021-01-23 03:48:32'),
(140, 'optionGroups.destroy', 'web', '2021-01-23 03:48:32', '2021-01-23 03:48:32'),
(141, 'options.index', 'web', '2021-01-23 04:10:51', '2021-01-23 04:10:51'),
(142, 'options.create', 'web', '2021-01-23 04:10:51', '2021-01-23 04:10:51'),
(143, 'options.store', 'web', '2021-01-23 04:10:52', '2021-01-23 04:10:52'),
(144, 'options.edit', 'web', '2021-01-23 04:10:52', '2021-01-23 04:10:52'),
(145, 'options.update', 'web', '2021-01-23 04:10:52', '2021-01-23 04:10:52'),
(146, 'options.destroy', 'web', '2021-01-23 04:10:52', '2021-01-23 04:10:52'),
(147, 'favorites.index', 'web', '2021-01-23 05:01:13', '2021-01-23 05:01:13'),
(148, 'favorites.create', 'web', '2021-01-23 05:01:13', '2021-01-23 05:01:13'),
(149, 'favorites.store', 'web', '2021-01-23 05:01:13', '2021-01-23 05:01:13'),
(150, 'favorites.edit', 'web', '2021-01-23 05:01:13', '2021-01-23 05:01:13'),
(151, 'favorites.update', 'web', '2021-01-23 05:01:13', '2021-01-23 05:01:13'),
(152, 'favorites.destroy', 'web', '2021-01-23 05:01:13', '2021-01-23 05:01:13'),
(153, 'eServiceReviews.index', 'web', '2021-01-24 03:42:57', '2021-01-24 03:42:57'),
(154, 'eServiceReviews.create', 'web', '2021-01-24 03:42:58', '2021-01-24 03:42:58'),
(155, 'eServiceReviews.store', 'web', '2021-01-24 03:42:58', '2021-01-24 03:42:58'),
(156, 'eServiceReviews.edit', 'web', '2021-01-24 03:42:58', '2021-01-24 03:42:58'),
(157, 'eServiceReviews.update', 'web', '2021-01-24 03:42:58', '2021-01-24 03:42:58'),
(158, 'eServiceReviews.destroy', 'web', '2021-01-24 03:42:58', '2021-01-24 03:42:58'),
(160, 'galleries.index', 'web', '2021-01-24 04:17:46', '2021-01-24 04:17:46'),
(161, 'galleries.create', 'web', '2021-01-24 04:17:47', '2021-01-24 04:17:47'),
(162, 'galleries.store', 'web', '2021-01-24 04:17:47', '2021-01-24 04:17:47'),
(163, 'galleries.edit', 'web', '2021-01-24 04:17:47', '2021-01-24 04:17:47'),
(164, 'galleries.update', 'web', '2021-01-24 04:17:47', '2021-01-24 04:17:47'),
(165, 'galleries.destroy', 'web', '2021-01-24 04:17:47', '2021-01-24 04:17:47'),
(166, 'requestedEProviders.index', 'web', '2021-01-25 17:53:17', '2021-01-25 17:53:17'),
(167, 'slides.index', 'web', '2021-01-25 19:01:20', '2021-01-25 19:01:20'),
(168, 'slides.create', 'web', '2021-01-25 19:01:20', '2021-01-25 19:01:20'),
(169, 'slides.store', 'web', '2021-01-25 19:01:20', '2021-01-25 19:01:20'),
(170, 'slides.edit', 'web', '2021-01-25 19:01:20', '2021-01-25 19:01:20'),
(171, 'slides.update', 'web', '2021-01-25 19:01:20', '2021-01-25 19:01:20'),
(172, 'slides.destroy', 'web', '2021-01-25 19:01:20', '2021-01-25 19:01:20'),
(173, 'notifications.index', 'web', '2021-01-25 23:42:33', '2021-01-25 23:42:33'),
(174, 'notifications.show', 'web', '2021-01-25 23:42:34', '2021-01-25 23:42:34'),
(175, 'notifications.destroy', 'web', '2021-01-25 23:42:34', '2021-01-25 23:42:34'),
(176, 'coupons.index', 'web', '2021-01-26 00:11:55', '2021-01-26 00:11:55'),
(177, 'coupons.create', 'web', '2021-01-26 00:11:55', '2021-01-26 00:11:55'),
(178, 'coupons.store', 'web', '2021-01-26 00:11:55', '2021-01-26 00:11:55'),
(179, 'coupons.edit', 'web', '2021-01-26 00:11:55', '2021-01-26 00:11:55'),
(180, 'coupons.update', 'web', '2021-01-26 00:11:55', '2021-01-26 00:11:55'),
(181, 'coupons.destroy', 'web', '2021-01-26 00:11:55', '2021-01-26 00:11:55'),
(182, 'bookingStatuses.index', 'web', '2021-01-26 03:21:01', '2021-01-26 03:21:01'),
(183, 'bookingStatuses.create', 'web', '2021-01-26 03:21:01', '2021-01-26 03:21:01'),
(184, 'bookingStatuses.store', 'web', '2021-01-26 03:21:01', '2021-01-26 03:21:01'),
(185, 'bookingStatuses.edit', 'web', '2021-01-26 03:21:01', '2021-01-26 03:21:01'),
(186, 'bookingStatuses.update', 'web', '2021-01-26 03:21:01', '2021-01-26 03:21:01'),
(187, 'bookingStatuses.destroy', 'web', '2021-01-26 03:21:01', '2021-01-26 03:21:01'),
(188, 'bookings.index', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(189, 'bookings.create', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(190, 'bookings.store', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(191, 'bookings.show', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(192, 'bookings.edit', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(193, 'bookings.update', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(194, 'bookings.destroy', 'web', '2021-01-26 05:27:09', '2021-01-26 05:27:09'),
(195, 'eProviderPayouts.index', 'web', '2021-01-30 19:23:08', '2021-01-30 19:23:08'),
(196, 'eProviderPayouts.create', 'web', '2021-01-30 19:23:08', '2021-01-30 19:23:08'),
(197, 'eProviderPayouts.store', 'web', '2021-01-30 19:23:08', '2021-01-30 19:23:08'),
(198, 'eProviderPayouts.destroy', 'web', '2021-01-30 19:23:09', '2021-01-30 19:23:09'),
(199, 'earnings.index', 'web', '2021-01-30 21:57:57', '2021-01-30 21:57:57'),
(200, 'earnings.create', 'web', '2021-01-30 21:57:57', '2021-01-30 21:57:57'),
(201, 'earnings.store', 'web', '2021-01-30 21:57:57', '2021-01-30 21:57:57'),
(202, 'earnings.destroy', 'web', '2021-01-30 21:57:57', '2021-01-30 21:57:57'),
(203, 'customPages.index', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(204, 'customPages.create', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(205, 'customPages.store', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(206, 'customPages.show', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(207, 'customPages.edit', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(208, 'customPages.update', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(209, 'customPages.destroy', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(210, 'wallets.index', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(211, 'wallets.create', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(212, 'wallets.store', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(213, 'wallets.update', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(214, 'wallets.edit', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(215, 'wallets.destroy', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(216, 'walletTransactions.index', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(217, 'walletTransactions.create', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(218, 'walletTransactions.store', 'web', '2021-02-24 19:37:44', '2021-02-24 19:37:44'),
(219, 'modules.update', 'web', '2022-05-16 23:15:45', '2022-05-16 23:15:45'),
(220, 'modules.install', 'web', '2022-05-16 23:15:45', '2022-05-16 23:15:45'),
(221, 'modules.index', 'web', '2022-05-16 23:15:45', '2022-05-16 23:15:45'),
(222, 'modules.enable', 'web', '2022-05-16 23:15:45', '2022-05-16 23:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `default`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', 0, NULL, NULL),
(3, 'provider', 'web', 0, NULL, NULL),
(4, 'customer', 'web', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 3),
(3, 4),
(4, 2),
(5, 2),
(6, 2),
(8, 2),
(9, 2),
(9, 3),
(9, 4),
(10, 2),
(11, 2),
(11, 3),
(11, 4),
(12, 2),
(12, 3),
(13, 2),
(16, 2),
(19, 2),
(20, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(42, 3),
(42, 4),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(48, 3),
(48, 4),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(54, 3),
(54, 4),
(57, 2),
(57, 3),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(66, 2),
(67, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(72, 3),
(73, 2),
(73, 3),
(74, 2),
(74, 3),
(75, 2),
(75, 3),
(76, 2),
(76, 3),
(77, 2),
(77, 3),
(78, 2),
(78, 3),
(79, 2),
(79, 3),
(80, 2),
(80, 3),
(81, 2),
(81, 3),
(82, 2),
(82, 3),
(83, 2),
(83, 3),
(84, 2),
(84, 3),
(85, 2),
(85, 3),
(92, 2),
(92, 3),
(93, 2),
(94, 2),
(95, 2),
(96, 2),
(97, 2),
(98, 2),
(98, 3),
(98, 4),
(99, 2),
(99, 3),
(99, 4),
(100, 2),
(100, 3),
(100, 4),
(101, 2),
(101, 3),
(102, 2),
(102, 3),
(103, 2),
(104, 2),
(104, 3),
(104, 4),
(105, 2),
(105, 3),
(105, 4),
(106, 2),
(106, 3),
(106, 4),
(107, 2),
(107, 3),
(107, 4),
(108, 2),
(108, 3),
(108, 4),
(109, 2),
(109, 3),
(109, 4),
(110, 2),
(111, 2),
(112, 2),
(113, 2),
(114, 2),
(115, 2),
(116, 2),
(116, 3),
(117, 2),
(117, 3),
(118, 2),
(118, 3),
(119, 2),
(119, 3),
(120, 2),
(120, 3),
(121, 2),
(121, 3),
(122, 2),
(122, 3),
(122, 4),
(123, 2),
(123, 3),
(124, 2),
(124, 3),
(126, 2),
(126, 3),
(127, 2),
(127, 3),
(128, 2),
(128, 3),
(129, 2),
(129, 3),
(129, 4),
(130, 2),
(131, 2),
(132, 2),
(133, 2),
(134, 2),
(135, 2),
(135, 3),
(136, 2),
(136, 3),
(137, 2),
(137, 3),
(138, 2),
(139, 2),
(140, 2),
(141, 2),
(141, 3),
(142, 2),
(142, 3),
(143, 2),
(143, 3),
(144, 2),
(144, 3),
(145, 2),
(145, 3),
(146, 2),
(146, 3),
(147, 2),
(147, 3),
(147, 4),
(148, 2),
(149, 2),
(149, 3),
(150, 2),
(151, 2),
(151, 3),
(152, 2),
(153, 2),
(153, 3),
(153, 4),
(156, 2),
(156, 3),
(156, 4),
(157, 2),
(157, 3),
(157, 4),
(158, 2),
(160, 2),
(160, 3),
(161, 2),
(161, 3),
(162, 2),
(162, 3),
(163, 2),
(163, 3),
(164, 2),
(164, 3),
(165, 2),
(165, 3),
(166, 2),
(166, 3),
(166, 4),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(173, 3),
(173, 4),
(174, 2),
(175, 2),
(175, 3),
(175, 4),
(176, 2),
(176, 3),
(177, 2),
(178, 2),
(179, 2),
(179, 3),
(180, 2),
(180, 3),
(181, 2),
(182, 2),
(182, 3),
(185, 2),
(186, 2),
(188, 2),
(188, 3),
(188, 4),
(191, 2),
(191, 3),
(191, 4),
(192, 2),
(192, 3),
(193, 2),
(193, 3),
(194, 2),
(194, 3),
(195, 2),
(195, 3),
(196, 2),
(196, 3),
(197, 2),
(197, 3),
(199, 2),
(199, 3),
(200, 2),
(200, 3),
(203, 2),
(203, 3),
(203, 4),
(204, 2),
(205, 2),
(206, 2),
(207, 2),
(208, 2),
(209, 2),
(210, 2),
(210, 3),
(210, 4),
(211, 2),
(212, 2),
(213, 2),
(214, 2),
(215, 2),
(216, 2),
(216, 3),
(216, 4),
(217, 2),
(218, 2),
(219, 2),
(220, 2),
(221, 2),
(222, 2);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT 0,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_position` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'start',
  `text_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indicator_color` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_fit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'cover',
  `e_service_id` int(10) UNSIGNED DEFAULT NULL,
  `e_provider_id` int(10) UNSIGNED DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `order`, `text`, `button`, `text_position`, `text_color`, `button_color`, `background_color`, `indicator_color`, `image_fit`, `e_service_id`, `e_provider_id`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 1, 'Assign a Handyman at Work to Fix the Household', 'Discover It', 'bottom_start', '#333333', '#009E6A', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 19:51:45', '2021-01-31 19:08:13'),
(2, 2, 'Fix the Broken Stuff by Asking for the Technicians', 'Repair', 'bottom_start', '#333333', '#F4841F', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-25 22:23:49', '2021-01-31 19:03:05'),
(3, 3, 'Add Hands to Your Cleaning Chores', 'Book Now', 'bottom_start', '#333333', '#1FA3F4', '#FFFFFF', '#333333', 'cover', NULL, NULL, 1, '2021-01-31 19:04:36', '2021-01-31 19:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(10,2) NOT NULL DEFAULT 0.00,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Tax 20', 20.00, 'percent', '2021-01-15 19:12:13', '2021-02-02 05:23:01'),
(2, 'Tax 10', 10.00, 'percent', '2021-01-15 19:19:30', '2021-01-15 19:19:30'),
(3, 'Maintenance', 2.00, 'fixed', '2021-01-19 04:48:29', '2021-02-02 05:25:13'),
(4, 'Tools Fee', 5.00, 'fixed', '2021-02-02 05:24:12', '2021-02-02 05:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `uuid`, `created_at`, `updated_at`) VALUES
(1, 'fac3d494-8d91-4124-867f-e1db8143cf53', '2022-07-26 16:24:59', '2022-07-26 16:24:59'),
(2, '9c613fbe-70fe-46a0-9155-88c7a38d7f12', '2022-07-26 17:18:37', '2022-07-26 17:18:37'),
(3, '6cf88d93-2b48-4e51-ab25-4c73711dc7d1', '2022-07-27 09:20:35', '2022-07-27 09:20:35'),
(4, '8f4d617a-54a6-4488-a0c2-9caef30b0bfa', '2022-07-27 09:22:04', '2022-07-27 09:22:04'),
(5, '7a1f7568-84b6-4703-98fd-a579d29c36e3', '2022-07-27 11:35:17', '2022-07-27 11:35:17'),
(6, '4f050978-0d7c-4c3c-84c0-0a52ed13f663', '2022-07-27 11:39:10', '2022-07-27 11:39:10'),
(7, '415eb666-36fb-4aaf-befa-f6aefc3e448f', '2022-07-27 11:54:36', '2022-07-27 11:54:36'),
(8, 'c1b76138-2848-4f7c-aadb-af36b414cd54', '2022-07-27 12:03:44', '2022-07-27 12:03:44'),
(9, '9c47e18f-c254-4e05-895f-9af4ad92a1a0', '2022-07-27 12:35:40', '2022-07-27 12:35:40'),
(10, '0cc6b07e-27da-4a92-ac2c-2d27fae8c6dd', '2022-07-27 13:04:25', '2022-07-27 13:04:25'),
(11, '91d77880-39d3-495c-b6cc-3b6024932b06', '2022-07-27 13:24:08', '2022-07-27 13:24:08'),
(12, '0a1f2b72-9074-43a3-8704-d0c28dd86812', '2022-07-27 13:50:19', '2022-07-27 13:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` char(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `paypal_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `phone_verified_at`, `email_verified_at`, `password`, `api_token`, `device_token`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `paypal_email`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hyatt Zimmerman', 'admin@demo.com', '+1 234 8996 321', '2021-01-11 01:22:10', '2021-01-11 01:22:10', '$2y$10$JsML7rLptnkSAkTI07k7RuIWMsCcAl4.VRWv6WEO5S/ZtztXCUtBm', 'PivvPlsQWxPl1bB5KrbKNBuraJit0PrUZekQUgtLyTRuyBq921atFtoR1HuA', '', NULL, NULL, NULL, NULL, NULL, 'fU74kiNeDsPSli77nLRFboCEmUOuK57tpt9SGSczqnmlebqgOODfO8HXjYrb', NULL, '2021-02-10 00:50:32'),
(2, 'Jennifer Paul', 'provider@demo.com', '+1 234 8996 322', '2021-01-11 01:22:10', '2021-01-11 01:22:10', '$2y$10$YOn/Xq6vfvi9oaixrtW8QuM2W0mawkLLqIxL.IoGqrsqOqbIsfBNu', 'tVSfIKRSX2Yn8iAMoUS3HPls84ycS8NAxO2dj2HvePbbr4WHorp4gIFRmFwB', '', NULL, NULL, NULL, NULL, NULL, 'TwyKlf5NJ0oG6l5FfFhbCKsdRWrjF6HCunV8nZn2U9OXhJJTZ2Jxx4EqAJPA', NULL, '2021-03-01 01:06:55'),
(3, 'Germaine Guzman', 'customer@demo.com', '+1 234 8996 323', '2021-01-11 01:22:10', '2021-01-11 01:22:10', '$2y$10$EBubVy3wDbqNbHvMQwkj3OTYVitL8QnHvh/zV0ICVOaSbALy5dD0K', 'fXLu7VeYgXDu82SkMxlLPG1mCAXc4EBIx6O5isgYVIKFQiHah0xiOHmzNsBv', '', NULL, NULL, NULL, NULL, NULL, 'SPz6luq3aoxCbgIS1gqmFDgM1qzGlIDtF0HgmDbtWcx2reaeFcogcFQzdP2F', NULL, '2021-02-25 05:52:57'),
(4, 'Aimee Mcgee', 'provider1@demo.com', '+1 234 8996 324', '2021-01-11 01:22:10', '2021-01-11 01:22:10', '$2y$10$pmdnepS1FhZUMqOaFIFnNO0spltJpziz3j13UqyEwShmLhokmuoei', 'Czrsk9rwD0c75NUPkzNXM2WvbxYHKj8p0nG29pjKT0PZaTgMVzuVyv4hOlte', '', NULL, NULL, NULL, NULL, NULL, 'yCzPqDP1oczySU57q6G71SxTIJSiZUBE4vYdXbXCqzpzC2iN09igcs3jzSQK', NULL, '2021-02-21 22:50:29'),
(5, 'Josephine Harding', 'customer3@demo.com', NULL, NULL, NULL, '$2y$10$n/06hZG121ZGp3tSwDQS3uhsQKxEYspjKrn7kGlLxRinUZKiulrEm', 'gkEWScQHIol9EIRhP3m5m7JqnK5UvcGdEsKQJo7YeBcQawYFq3JAJ6SX9UKy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-11 18:55:52', '2021-02-02 19:29:47'),
(6, 'Nicolette Christiansen', 'provider2@demo.com', NULL, NULL, '2021-01-11 08:00:00', '$2y$04$WRpHC9iMxZ3f.gctQ4igsuZjsYfGjX7igVM8GsC2AMME3.4au3dYu', 'TKArYDDFHNiEI33sfExaBEhxHCs5kFaWP7EO6aNlUZfnqHrvsMCwsYeAk9s2', NULL, NULL, NULL, NULL, NULL, NULL, 'JbiYaHlRWGKkfITxH9qI87GzTMPf0zJ2Iw6NIdlS5dDvWuT5PC2sP5ELGwKx', '2021-01-11 19:33:59', '2021-02-02 19:30:56'),
(7, 'Rose Bauer', 'customer2@demo.com', NULL, NULL, NULL, '$2y$10$3GhoIShzRdSXevYAh1NF/.67J3OshX9D2.sqY50o8kxh7EXPw7tuC', 'w6QJYqZyllY24AIR3nSsKqgj5eMSZevmgpSywwxJxUS9nwULcuriRLBxEXZC', '', NULL, NULL, NULL, NULL, NULL, 'WxYP9zjTBy9SYF5OWjcFbMt2Ob9r0bahBKzPDOtw9OrAJ89JqaMxkN5aqu8J', '2021-01-18 00:13:24', '2021-03-01 02:03:25'),
(8, 'smarter8', 'smartersvision@gmail.com', '+12645595482', NULL, NULL, '$2y$10$MqPMTfg6RUNxxEH6aLdqnOYZUBsT7xtxkglD74pDgThV52.HJrLba', 'WivbG2oAEbEGl51EBeBuHaZeCqyfBnCVGo18nSaj2FwwiDjux2ZOAZWUoddK', '', NULL, NULL, NULL, NULL, NULL, 'SdstZCaeYW0pjqZn832HMzBD7WPGJ5m9hwWG28nhbIrzSS0etj33rbTRJ6kD', '2021-02-10 19:31:12', '2021-02-24 04:41:50'),
(9, 'omar', 'omar99@gmail.com', '1234561267', NULL, NULL, '$2y$10$vSkYlc/wqt7ODmS3iEOymet2y85NPPJn3mbSO/WxGLKVveTMg5/vy', 'kXqBd5X44QcjKKO5ZaJIRpWQcJsO7cVvKMWhJgTGY5KlDNt2rIkHL41XbHiO', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-17 20:02:53', '2022-05-17 20:02:53'),
(10, 'Mohamed', 'm7aymn@gmail.com', '+201552159417', NULL, NULL, '$2y$10$yfgdMso9xC2M2CUftGBaPOdLctMx/EDk1IpKb1jiS6UxEqYjp4ebG', 'tQ1LuP5u0RDDgxV9LMzNcuFj8RdTiizY72pGqq1kDTbC2Pt5vahJ3DWvTM74', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-19 21:53:11', '2022-05-19 21:53:11'),
(11, 'ط¹ط¨ط§ط³', 'abbasstar114@gmail.com', '+9647721905552', NULL, NULL, '$2y$10$aK7fMnUPawzBOf7PnqAs8eLHExq4mGkHVZmo2IBKpYKkbi9bcC85i', 'KnLqMeX4DC4dvDGAWvYw9msmt6OkfAxKCzbsUNDQZHoofymjmcbUwTcNlByP', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-21 17:55:49', '2022-05-21 17:55:49'),
(20, 'dsfds', 'dsdssd@hffghf.com', '+9644354543534', NULL, NULL, '$2y$10$4do6pkaiPtAn4jbtfjC7meNw049XbAtW3NbK2rQeERCDw9b1YS2hK', 'nXydXUGBqmyQKtQK6WVflE9dLpVZ4ifzbHgHaSZQlHIaqmu811d66Pssf8VM', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 15:40:46', '2022-05-23 15:40:46'),
(21, 'adsa', 'dasd@dsfds.com', '+964343434666', NULL, NULL, '$2y$10$oR7y6Dvz.fhZWjHtlwzCHeozUYaN.ImJhZbvfM6Jj5i8aXCDAEH5C', '6bIcQ7fG5uVnFxOtCKlnhpxi0J6JZn0MVQWSP9fvMZP5L9Ck2pTg3hsD4iXM', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-23 15:53:56', '2022-05-23 15:53:56'),
(22, 'ط¹ط¨ط§ط³', 'aaqw@gmail.com', '+9647719512095', NULL, NULL, '$2y$10$pVYT3Xo7yD/7MkUU26DDcumY9.74lb9wcQScEoZZ0.1yho0QU62PK', 'W8idQ5X6fQrN8agTpvBnxp90ruKGfOsxo5AsH1Hh4A5KPjwtrwERI5ugR0hx', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-24 15:06:34', '2022-05-24 15:06:34'),
(23, 'Cash', 'cash.box.pgms@gmail.com', '+9641234567891', '2022-05-05 07:00:00', NULL, '$2y$10$9Idt.LWxQqRKEeQ/8xsdJeylCQmrVNE/nYVe4eDioSeP4lFj0VF6q', 'yuM82boqKA3M2uXm9H9C2scNDwsoDV4EZsSp9Ft9wlxmYNUlEqBl6D4abgOo', '', NULL, NULL, NULL, NULL, NULL, 'q4I537VVcMW6dGH20vBRCewwpHQP8IyN1MxWoJbGmCb3YQyKp3EFoIe0qQZt', '2022-05-24 15:12:03', '2022-05-24 15:12:03'),
(24, 'kjkjk', 'kljlk@dsfds.com', '+964454543543', NULL, NULL, '$2y$10$XsxAtOTG85Pq4peYY/S7Ou9SdrcPhSwPxrk7qUZ1DQL7osvmar.RO', 'lPa87Wq4dMwCCNXKzK6zMslGGTMpmFvLrjhXNeX9EpSPRfWK3HRzHdvzSuhp', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-24 15:17:28', '2022-05-24 15:17:28'),
(25, 'iuiuio', 'iuiiuooiu@fds.com', '+96424324232', NULL, NULL, '$2y$10$/l8nG2JToDLnQLJa.GrPduvpnspB7sgEwuaqVf3dG69aqydERm.mO', 'sag9vGopXLJLwLpEAtAEklkurhFuT2BxYyMLhnHDsko1gMuo4xL9oQ9yv7Jc', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-24 15:49:36', '2022-05-24 15:49:36'),
(28, 'Amr', 'amrelgendy232@gmail.com', '+964686868686', '2022-05-05 07:00:00', NULL, '$2y$10$P.Y5k.nyJBC.FCT93TXjLOEtvfWEpxS6flLQ2.Vf19KVp4J5uwAJG', 'tCAnJsCxBigqdtBqZhcggdTtbAOfIFngLlUIDlijg49NGNLQd3FtnlinXqub', '', NULL, NULL, NULL, NULL, NULL, 'WQprjx75lIC8sprlI1fdv4G21MLmiYw6EfU0zA6mhFvK1pVy6Tz3wGX17THQ', '2022-05-24 16:52:11', '2022-05-24 16:52:11'),
(29, 'Test', 'testtest@test.com', '+9648434687347', NULL, NULL, '$2y$10$XAm4JCzTSt.aNPMs1H89hO7Y1kD3Mh2uHjoOKPMadGg5xiRxXto6a', '4Cofjjv4rYM9UOnECCsNknMr5cnwcQ1uJLjos1p7E3FBOuTYydzmn1xTVlmp', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-25 04:35:20', '2022-05-25 04:35:20'),
(30, 'Mohamed', 'modyhemead@icloud.com', '+201552159418', NULL, NULL, '$2y$10$ME7c6uua5aWN1XQYIPOwV.6jvG.qd8rD40H7x3BNb5o8U/9jsmuGG', 'HSeH9IU837a1Iqz3EM5WTENxcIpz06rbwLBFtqJTa2U9dKY55H33fTGSfDgX', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-25 12:37:30', '2022-05-25 12:37:30'),
(31, 'Test', 'nfibrh@gmail.com', '+964456484384', NULL, NULL, '$2y$10$zQTgm.Qx8Extz2kpAj6sw.vvn6J3qpl7TSUmdHhBA2EuwyIJVSaoW', 'YOFYL0GEwxI4YE3x6y0OwDHyjfP6TfHS6SH8kxiWjy0QH2BsegZDFqbMuivD', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-26 12:34:20', '2022-05-26 12:34:20'),
(32, 'Test', 'test@gmail.com', '+964123456789', NULL, NULL, '$2y$10$72xOJiTtVcC.0BMnmdP.9uTcGluThgtLfsmOYdcVtCSYC8owdUGHC', 'pauL3GbWEO2pG64ok2ZXrJgZ7XiNEU6fkqsFNttKhlsZTUTFcpcQLV4dL1QG', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-28 15:21:41', '2022-05-28 15:21:41'),
(33, 'T', 't@gmail.com', '+96412345678', NULL, NULL, '$2y$10$VjRpKXgn/BRerVUBkc.Y5eRxp76kuWxSfekStZYqgA1n4l6lH8V56', 'gLRAiPWozX8BdfAYMu113uS1TjWFUZSuvJOcwFkq4hwKj2j5rh6h21SNW2vW', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-28 15:34:38', '2022-05-28 15:34:38'),
(34, 'sa', 'saifggmzb@gmail.com', '+9647706134057', NULL, NULL, '$2y$10$9EM239J7aYwQHLbv7sL1/.Py8EooXox.qm3dNvTQY0vyX6vQkQv5y', 'Ajw9oVjlXtoPMuMYurOzKH16ZrgDDJBqEBF4dhqbKksSzj8tMSO8SmxBzVXf', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-28 17:33:16', '2022-05-28 17:33:16'),
(35, 'Amr', 'amr_ahmed222001@hotmail.com', '+9641272700', '2022-05-05 07:00:00', NULL, '$2y$10$n8cvvpoRRxiogwZM6RGl2uNP3OgJWbRuJrZKL76yoRnhEtSsHR29y', 'YFh8vaDVu2ZehMabTL49jiCidM0g5XI24YgdmFaKKqUe31IIQymJ9u7UjKTw', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-05-29 14:24:33', '2022-05-29 14:24:33'),
(36, 'nagy', 'nagygalal74@gmail.com', '+2001096240656', NULL, NULL, '$2y$10$D5YoaytK.lmukkgmacNnNuEdXlZH1pdk3/wb89ZyBMiU3KemB0Fk.', 'UKANMOS8uVaIZcsopksLUYNA97uMcOn2NTRCld7mLQl1bWbVGiC8wNpRuG0A', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-06 16:52:37', '2022-06-06 16:52:37'),
(37, 'abbas', 'abbasstarc9@gmail.com', '+9647719512094', NULL, NULL, '$2y$10$fkNRTdyUYE7IImFB72gNSO0PLKrhuEV.YZpNA7NxlPuQmsVJB9CT.', 'hE5H00I9swEMGUvZHeoiFk0fhq55guBfvGRuGNtpR23cCxxc69dRuRgesVvK', 'dd86gr4_QX6P4ypnvWk7Ft:APA91bE9paskcX0RFDEc1vyAWa2HdGS17KciT-IvALN-O5WIK-qIkJNCyX9B8g_LqRVjaNg6FPShFedwFmXtA9SufPW4CHz-2OsGpLilUv41fOAw3fWQF7DaQhv1ueULzrlyg5-61OaA', NULL, NULL, NULL, NULL, NULL, 'YbiTlZL2xvSueORvSWhy52ANocB0FJU7Fh3j5N9ibB11nOrOPQME65YwzWIX', '2022-06-09 20:20:25', '2022-07-27 12:31:40'),
(38, 'Lina', 'linaehabcivileng@gmail.com', '+9647811518589', NULL, NULL, '$2y$10$WZeqho8q9QY2UwjRT7nUCu.Zlu7OgOOG0NNG4s5KGUziuXizfjZI6', 'yBh9hCCWACyPg7wBgZl7DPPfP4C5RZKPiFMeOcULq0J1ab2itdmXrUQl0jNw', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-06-11 19:05:21', '2022-06-11 19:05:21'),
(39, 'ziad abo alkamar', 'ziadaboalkamar@gmail.com', '0595321661', NULL, NULL, '$2y$10$Qg8Sc5T.qlHFQ3jnyv1hc.4MZoGVj28K5dBQrwBzD9WX4jJlJ4lem', 'CVhokjvbUnLSMEE3iXqSqLoox1qvAz5vnMalMxRvMH7ogELEM5COG1YQxE7K', '', NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-28 04:37:31', '2022-07-28 05:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double(16,2) NOT NULL DEFAULT 0.00,
  `currency` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `name`, `balance`, `currency`, `user_id`, `enabled`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 'My USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 1, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 'Home USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 2, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 'Work USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 3, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 'Dummy USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 4, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 'Old USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 5, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 'New USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 6, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 'USD Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 7, 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 'Dollar Wallet', 200.00, '{\"id\":1,\"name\":\"US Dollar\",\"symbol\":\"$\",\"code\":\"USD\",\"decimal_digits\":2,\"rounding\":0}', 8, 1, '2021-01-07 21:17:34', '2021-01-07 21:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` enum('credit','debit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `amount`, `description`, `action`, `wallet_id`, `user_id`, `created_at`, `updated_at`) VALUES
('01194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '01194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('02194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '02194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('03194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '03194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('04194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '04194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('05194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '05194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('06194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '06194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('07194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '07194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34'),
('8d194a4f-f302-47af-80b2-ceb2075d36dc', 200.00, 'First Transaction', 'credit', '8d194a4f-f302-47af-80b2-ceb2075d36dc', 1, '2021-08-07 20:17:34', '2021-08-07 20:17:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_settings_key_index` (`key`);

--
-- Indexes for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `availability_hours_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `awards_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_booking_status_id_foreign` (`booking_status_id`),
  ADD KEY `bookings_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_values_custom_field_id_foreign` (`custom_field_id`);

--
-- Indexes for table `custom_pages`
--
ALTER TABLE `custom_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discountables`
--
ALTER TABLE `discountables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discountables_coupon_id_foreign` (`coupon_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiences_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_providers_e_provider_type_id_foreign` (`e_provider_type_id`);

--
-- Indexes for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD PRIMARY KEY (`e_provider_id`,`address_id`),
  ADD KEY `e_provider_addresses_address_id_foreign` (`address_id`);

--
-- Indexes for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_provider_payouts_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD PRIMARY KEY (`e_provider_id`,`tax_id`),
  ADD KEY `e_provider_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD PRIMARY KEY (`user_id`,`e_provider_id`),
  ADD KEY `e_provider_users_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_services`
--
ALTER TABLE `e_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_services_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD PRIMARY KEY (`e_service_id`,`category_id`),
  ADD KEY `e_service_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e_service_reviews_user_id_foreign` (`user_id`),
  ADD KEY `e_service_reviews_e_service_id_foreign` (`e_service_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_e_service_id_foreign` (`e_service_id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`);

--
-- Indexes for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD PRIMARY KEY (`option_id`,`favorite_id`),
  ADD KEY `favorite_options_favorite_id_foreign` (`favorite_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_e_service_id_foreign` (`e_service_id`),
  ADD KEY `options_option_group_id_foreign` (`option_group_id`);

--
-- Indexes for table `option_groups`
--
ALTER TABLE `option_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_foreign` (`user_id`),
  ADD KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  ADD KEY `payments_payment_status_id_foreign` (`payment_status_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slides_e_service_id_foreign` (`e_service_id`),
  ADD KEY `slides_e_provider_id_foreign` (`e_provider_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_wallet_id_foreign` (`wallet_id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `availability_hours`
--
ALTER TABLE `availability_hours`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_statuses`
--
ALTER TABLE `booking_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `custom_pages`
--
ALTER TABLE `custom_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discountables`
--
ALTER TABLE `discountables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `e_providers`
--
ALTER TABLE `e_providers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_provider_types`
--
ALTER TABLE `e_provider_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `e_services`
--
ALTER TABLE `e_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `option_groups`
--
ALTER TABLE `option_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payment_statuses`
--
ALTER TABLE `payment_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `availability_hours`
--
ALTER TABLE `availability_hours`
  ADD CONSTRAINT `availability_hours_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booking_status_id_foreign` FOREIGN KEY (`booking_status_id`) REFERENCES `booking_statuses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discountables`
--
ALTER TABLE `discountables`
  ADD CONSTRAINT `discountables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `experiences`
--
ALTER TABLE `experiences`
  ADD CONSTRAINT `experiences_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_providers`
--
ALTER TABLE `e_providers`
  ADD CONSTRAINT `e_providers_e_provider_type_id_foreign` FOREIGN KEY (`e_provider_type_id`) REFERENCES `e_provider_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_addresses`
--
ALTER TABLE `e_provider_addresses`
  ADD CONSTRAINT `e_provider_addresses_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_addresses_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_payouts`
--
ALTER TABLE `e_provider_payouts`
  ADD CONSTRAINT `e_provider_payouts_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_taxes`
--
ALTER TABLE `e_provider_taxes`
  ADD CONSTRAINT `e_provider_taxes_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_provider_users`
--
ALTER TABLE `e_provider_users`
  ADD CONSTRAINT `e_provider_users_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_provider_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_services`
--
ALTER TABLE `e_services`
  ADD CONSTRAINT `e_services_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_categories`
--
ALTER TABLE `e_service_categories`
  ADD CONSTRAINT `e_service_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_categories_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `e_service_reviews`
--
ALTER TABLE `e_service_reviews`
  ADD CONSTRAINT `e_service_reviews_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `e_service_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite_options`
--
ALTER TABLE `favorite_options`
  ADD CONSTRAINT `favorite_options_favorite_id_foreign` FOREIGN KEY (`favorite_id`) REFERENCES `favorites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `options_option_group_id_foreign` FOREIGN KEY (`option_group_id`) REFERENCES `option_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `payment_statuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_e_provider_id_foreign` FOREIGN KEY (`e_provider_id`) REFERENCES `e_providers` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `slides_e_service_id_foreign` FOREIGN KEY (`e_service_id`) REFERENCES `e_services` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
