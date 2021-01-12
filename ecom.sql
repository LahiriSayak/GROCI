-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 16, 2020 at 08:07 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(2, 'Pulses', 1),
(3, 'Meat', 1),
(5, 'Rice', 1),
(7, 'Fruits', 1),
(8, 'Fish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
CREATE TABLE IF NOT EXISTS `contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(20) DEFAULT NULL,
  `mihpayid` varchar(20) DEFAULT NULL,
  `payu_status` varchar(10) DEFAULT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `payu_status`, `added_on`) VALUES
(9, 4, 'Sayak Lahiri , Agarpara', 'kolkata', 700058, 'COD', 750, 'Success', 5, 'f605c3dfc2d2c568c779', NULL, NULL, '2020-06-15 01:21:16'),
(10, 4, 'Raunak Ghosh , Ultadanga', 'kolkata', 700120, 'payu', 80, 'failure', 3, '9d219049cae519f36b8e', '403993715521127059', NULL, '2020-06-15 01:22:05'),
(11, 4, 'Sayak Lahiri , Agarpara', 'kolkata', 700058, 'payu', 250, 'failure', 1, '062e66c10965dd48ff36', '403993715521127075', NULL, '2020-06-15 01:28:23'),
(12, 4, 'Sayak Lahiri , Agarpara', 'kolkata', 700058, 'payu', 80, 'pending', 1, '3b347eb03c226460f439', '403993715521127113', NULL, '2020-06-15 01:36:10'),
(13, 4, 'Sayak Lahiri , Agarpara', 'kolkata', 700058, 'COD', 1350, 'pending', 1, '535b9d831b378acd2b9c', NULL, NULL, '2020-06-15 03:09:17'),
(14, 4, 'Raunak Ghosh , Ultadanga', 'kolkata', 700058, 'payu', 80, 'pending', 1, '7e7438f2e33b9eec03aa', NULL, NULL, '2020-06-15 03:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(20, 9, 4, 3, 250),
(21, 10, 1, 1, 80),
(22, 11, 5, 1, 250),
(23, 12, 1, 1, 80),
(24, 13, 7, 5, 120),
(25, 13, 5, 3, 250),
(26, 14, 1, 1, 80);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(5, 'complete'),
(4, 'canceled'),
(3, 'shipped'),
(2, 'processing'),
(1, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `mrp`, `price`, `qty`, `image`, `short_desc`, `description`, `meta_title`, `meta_desc`, `meta_keyword`, `status`) VALUES
(1, 7, 'Litchi', 150, 80, 5, '296029858_Litchi.jpg', 'Litchis contain generous amounts of vitamins B, C, phytonutrient flavonoids, manganese, copper, magnesium and iron. It is also rich in fibres, antioxidants, and helps in blood production, increases metabolism, prevents early ageing, protects from degenerative diseases, and maintains cardiovascular health.', 'Fresho litchi is obtained from the best growers in the country, and the fruits are fresh, fleshy and refreshingly sweet. They are packed and stored in hygienic conditions at the right temperature to make sure that the taste and benefits are preserved well. So turn down the summer heat in a juicy way with premium quality Fresho litchis.', 'test', 'test', 'test', 1),
(4, 8, 'Rohu Fish', 350, 250, 5, '980997789_rohufish.jpg', 'Whole fish weight arround 2 kg to 3 kg', 'The rohu, rui, or roho labeo is a species of fish of the carp family, found in rivers in South Asia. It is a large omnivore and extensively used in aquaculture.', 'test', 'test', 'test', 1),
(5, 5, 'Basmati Rice', 400, 250, 8, '550208985_BasmatiRice.jpg', 'Basmati rice can be used for preparing special dishes.', 'Basmati is a variety of long, slender-grained aromatic rice which is traditionally from the Indian subcontinent.[As of 2018-19, India exported to 65% of the overseas basmati rice market, while Pakistan accounted for the remainder.Many countries use domestically grown basmati rice crops;however, basmati is geographically exclusive to certain districts of India and Pakistan.', 'test', 'test', 'test', 1),
(6, 2, 'Moong Dal', 400, 250, 4, '367492513_MoongDal.jpg', 'Moong beans is a popular food among vegetarians since it contains a lot of proteins and fiber. It is one of the easiest dals to digest and for this reason it is often given to people recovering from an illness, specially a stomach upset. It has antioxidants which is very healthy for the good functioning of the human body. It is a good balanced diet and could be included in our daily.', 'The mung bean, alternatively known as the green gram, maash, or moong, is a plant species in the legume family. The mung bean is mainly cultivated in East Asia, Southeast Asia and the Indian subcontinent. It is used as an ingredient in both savory and sweet dishes.', 'test', 'test', 'test', 1),
(7, 3, 'chicken', 250, 120, 3, '231106841_chicken.jpg', 'Chicken is the most common type of poultry in the world.', 'Fresho Meats is our in-house brand of fresh meat, poultry and seafood. We take utmost care in selecting the best suppliers to provide you with high quality and succulent products. Every product is stored in our cold storage right until your doorstep ensuring freshness and utmost hygiene. \r\n\r\nAdditionally, every product is packed using food grade plastic which provides a nourishing and wholesome environment. These freshly processed & clean curry pieces are ready for cooking.\r\n\r\nChicken is a good source of protein, vitamin B6 and antioxidants. It also contains selenium, niacin and phosphorous. It is low in fat and cholesterol and is carb-free. It is a good source of energy and since comparatively it contains less saturated fat, is great for weight loss as it is lean meat or white meat. It promotes cardiovascular health and helps prevent age-related diseases. Also, it possesses cancer-preventing properties.', 'test', 'test', 'test', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `mobile`, `added_on`) VALUES
(4, 'Sayak Lahiri', '1234', 'firefox.mozila1998@gmail.com', '7980712754', '2020-06-15 11:21:39'),
(5, 'Sayak Lahiri', '1234', 'sayak.laheri@gmail.com', '7980712755', '2020-06-15 11:22:02'),
(6, 'Raunak Ghosh', '1234', 'raunak99@gmail.com', '7980712756', '2020-06-15 11:22:33');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
