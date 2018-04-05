-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2018 at 06:45 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2017-01-24 16:21:18', '12-08-2017 05:32:16 PM');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(500) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(700) NOT NULL,
  `pincode` int(10) NOT NULL,
  `orders` longtext NOT NULL,
  `orderdate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `name`, `email`, `contactno`, `city`, `address`, `pincode`, `orders`, `orderdate`) VALUES
(1, 'khutalsaheb', 'sss@gmail.com', '2147483647', 'zap', 'mangrul', 412410, ' Lenovo K6 Power (Silver, 32 GB) =>1=9999 ,\nSAMSUNG Galaxy On5=>1=7490 ,\n', '2017-09-27 17:17:55'),
(2, 'hello', 'sss@gmail.com', '2147483647', 'pune north', 'pune helllo', 233233, ' Thea Stilton and the Tropical Treasure =>1=240 ,\n', '2017-09-27 17:24:33'),
(3, 'king', 'sss@gmail.com', '2147483647', 'usa', 'pune', 777777, ' Thea Stilton and the Tropical Treasure =>1=240 ,\n', '2017-09-27 17:30:26'),
(4, 'hh', 'sss@gmail.com', '9855985523', 'hhh', 'hh', 55555, ' Lenovo Ideapad 110 APU Quad Core A6 6th Gen=>1=22990 ,\n', '2017-09-27 17:33:25'),
(5, 'dhoom', 'sss@gmail.com', '989898989889', 'pune 22', 'dhoom pune', 223344, ' Adidas MESSI 16.3 TF Football turf Shoes  (Blue)=>1=4129 ,\nAdidas MESSI 16.3 TF Football turf Shoes  (Blue)=>1=4129 ,\nInduscraft Solid Wood King Bed With Storage=>1=32566 ,\nMicromax Canvas Laptab II (WIFI) Atom 4th Gen=>1=10999 ,\nMind=>1=45000 ,\nSAMSUNG Galaxy On5=>1=7490 ,\n', '2017-09-29 15:27:00');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `categoryDescription` longtext NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(3, 'Books', 'Test anuj', '2017-01-24 19:17:37', '30-01-2017 12:22:24 AM'),
(4, 'Electronics', 'Electronic Products', '2017-01-24 19:19:32', ''),
(5, 'Furniture', 'test', '2017-01-24 19:19:54', ''),
(6, 'Fashion', 'Fashion', '2017-02-20 19:18:52', ''),
(7, 'Show', 'Hello', '2017-08-12 10:41:09', '');

-- --------------------------------------------------------

--
-- Table structure for table `newwishlist`
--

CREATE TABLE `newwishlist` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `wishdate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newwishlist`
--

INSERT INTO `newwishlist` (`id`, `email`, `product_id`, `product_name`, `wishdate`) VALUES
(1, 'sss@gmail.com', 3, 'Redmi Note 4 (Gold, 32 GB)  (With 3 GB RAM)', '2017-09-28 16:13:38'),
(2, 'sss@gmail.com', 8, 'OPPO A57', '2017-09-28 16:18:11'),
(3, 'sss@gmail.com', 9, 'Affix Back Cover for Mi Redmi Note 4', '2017-09-28 17:03:30'),
(4, 'sss@gmail.com', 2, 'Apple iPhone 6 (Silver, 16 GB)', '2017-09-28 17:11:24'),
(5, 'sss@gmail.com', 4, 'Lenovo K6 Power (Silver, 32 GB)', '2017-09-28 17:11:28'),
(6, 'sss@gmail.com', 16, 'Thea Stilton and the Tropical Treasure ', '2017-09-28 17:14:59'),
(7, 'sss@gmail.com', 12, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', '2017-09-28 18:10:13'),
(8, 'sss@gmail.com', 20, 'Adidas MESSI 16.3 TF Football turf Shoes  (Blue)', '2017-09-29 15:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(1, 1, '3', 1, '2017-03-07 19:32:57', 'COD', NULL),
(3, 1, '4', 1, '2017-03-10 19:43:04', 'Debit / Credit card', 'Delivered'),
(4, 1, '17', 1, '2017-03-08 16:14:17', 'COD', 'in Process'),
(5, 1, '3', 1, '2017-03-08 19:21:38', 'COD', NULL),
(6, 1, '4', 1, '2017-03-08 19:21:38', 'COD', NULL),
(7, 3, '3', 1, '2017-08-12 08:33:57', 'Internet Banking', 'in Process'),
(8, 3, '15', 8, '2017-08-12 08:33:57', 'Internet Banking', NULL),
(9, 1, '20', 1, '2017-08-12 08:37:43', NULL, NULL),
(11, 3, '16', 1, '2017-08-16 07:24:34', 'COD', NULL),
(12, 3, '3', 1, '2017-08-16 07:39:15', 'COD', NULL),
(13, 3, '13', 10, '2017-08-17 04:34:42', 'COD', 'Delivered'),
(14, 3, '8', 1, '2017-08-17 07:47:27', 'Debit / Credit card', NULL),
(15, 3, '13', 1, '2017-08-18 11:11:16', 'COD', NULL),
(16, 4, '1', 1, '2017-09-07 10:35:07', 'Debit / Credit card', NULL),
(17, 4, '2', 1, '2017-09-07 10:35:07', 'Debit / Credit card', NULL),
(18, 4, '20', 1, '2017-09-07 10:35:07', 'Debit / Credit card', NULL),
(19, 3, '4', 1, '2017-09-21 09:50:33', 'Debit / Credit card', NULL),
(20, 3, '4', 4, '2017-09-21 09:51:38', 'Debit / Credit card', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(1, 3, 'in Process', 'Order has been Shipped.', '2017-03-10 19:36:45'),
(2, 1, 'Delivered', 'Order Has been delivered', '2017-03-10 19:37:31'),
(3, 3, 'Delivered', 'Product delivered successfully', '2017-03-10 19:43:04'),
(4, 4, 'in Process', 'Product ready for Shipping', '2017-03-10 19:50:36'),
(5, 7, 'in Process', 'hello', '2017-08-12 08:38:49'),
(6, 13, 'in Process', 'UR PRODUCT PACKAGING STARTED... ', '2017-08-17 06:27:21'),
(7, 13, 'Delivered', 'UR PRODUCT HAS BEEN DELIVERD... ', '2017-08-17 07:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `review` longtext NOT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(2, 3, 4, 5, 5, 'Anuj Kumar', 'BEST PRODUCT FOR ME :)', 'BEST PRODUCT FOR ME :)', '2017-02-26 20:43:57'),
(3, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:52:46'),
(4, 3, 3, 4, 3, 'Sarita pandey', 'Nice Product', 'Value for money', '2017-02-26 20:59:19'),
(5, 2, 0, 5, 0, 'fff', 'fff', 'fgfdg', '2017-09-01 07:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productCompany` varchar(255) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productPriceBeforeDiscount` int(11) NOT NULL,
  `productDescription` longtext NOT NULL,
  `productImage1` varchar(255) NOT NULL,
  `productImage2` varchar(255) NOT NULL,
  `productImage3` varchar(255) NOT NULL,
  `shippingCharge` int(11) NOT NULL,
  `productAvailability` varchar(255) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `offers` varchar(200) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `offers`, `updationDate`) VALUES
(1, 4, 3, 'Micromax 81cm (32) HD Ready LED TV  (32T6175MHD, 2 x HDMI, 2 x USB)', 'Micromax test', 139900, 0, '<div class="HoUsOy" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; font-size: 18px; white-space: nowrap; line-height: 1.4; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif;">General</div><ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Sales Package</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">1 TV Unit, Remote Controller, Battery (For Remote Controller), Quick Installation Guide and User Manual: All in One, Wall Mount Support</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Model Name</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">32T6175MHD</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Display Size</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">81 cm (32)</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">Screen Type</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">LED</li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);">HD Technology &amp; Resolutiontest</div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;">HD Ready, 1366 x 768</li></ul></li></ul>', 'micromax1.jpeg', 'micromax main image.jpg', 'micromax main image.jpg', 1200, 'In Stock', '2017-01-30 16:54:35', 'Special', ''),
(2, 4, 4, 'Apple iPhone 6 (Silver, 16 GB)', 'Apple INC', 36990, 0, '<div class="_2PF8IO" style="box-sizing: border-box; margin: 0px 0px 0px 110px; padding: 0px; flex: 1 1 0%; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px;"><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">1 GB RAM | 16 GB ROM |</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">4.7 inch Retina HD Display</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">8MP Primary Camera | 1.2MP Front</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">Li-Ion Battery</li><li class="_1tMfkh" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">A8 Chip with 64-bit Architecture and M8 Motion Co-processor Processor</li></ul></div>', 'apple-iphone-6-1.jpeg', 'apple-iphone-6-2.jpeg', 'apple-iphone-6-3.jpeg', 0, 'Out of Stock', '2017-01-30 16:59:00', '', ''),
(3, 4, 4, 'Redmi Note 4 (Gold, 32 GB)  (With 3 GB RAM)', 'Redmi', 10999, 0, '<br><div><ol><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>4100 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 625 64-bit Processor<br></li></ol></div>', 'http://s3-eu-west-1.amazonaws.com/which-tools-production/feature_tool/projects/46/images/Category_iphone.jpg', 'https://www.engineersgarage.com/sites/default/files/imagecache/Original/wysiwyg_imageupload/1/Mobile-Phone.jpg', 'https://130e178e8f8ba617604b-8aedd782b7d22cfe0d1146da69a52436.ssl.cf1.rackcdn.com/broadening-scope-mobile-security-showcase_image-7-a-9417.jpg', 0, 'In Stock', '2017-02-04 04:03:15', '', ''),
(4, 4, 4, 'Lenovo K6 Power (Silver, 32 GB) ', 'Lenovo', 9999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>4000 mAh Li-Polymer Battery<br></li><li>Qualcomm Snapdragon 430 Processor<br></li></ul>', 'lenovo-k6-power-k33a42-1.jpeg', 'lenovo-k6-power-k33a42-2.jpeg', 'lenovo-k6-power-k33a42-3.jpeg', 45, 'In Stock', '2017-02-04 04:04:43', '', ''),
(5, 4, 4, 'Lenovo Vibe K5 Note (Gold, 32 GB)  ', 'Lenovo', 11999, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 128 GB<br></li><li>5.5 inch Full HD Display<br></li><li>13MP Primary Camera | 8MP Front<br></li><li>3500 mAh Li-Ion Polymer Battery<br></li><li>Helio P10 64-bit Processor<br></li></ul>', 'lenovo-k5-note-pa330010in-1.jpeg', 'lenovo-k5-note-pa330116in-2.jpeg', 'lenovo-k5-note-pa330116in-3.jpeg', 0, 'In Stock', '2017-02-04 04:06:17', 'Todays', ''),
(6, 4, 4, 'Micromax Canvas Mega 4G', 'Micromax', 6999, 0, '<ul><li>3 GB RAM | 16 GB ROM |<br></li><li>5.5 inch HD Display<br></li><li>13MP Primary Camera | 5MP Front<br></li><li>2500 mAh Battery<br></li><li>MT6735 Processor<br></li></ul>', 'micromax-canvas-mega-4g-1.jpeg', 'micromax-canvas-mega-4g-2.jpeg', 'micromax-canvas-mega-4g-3.jpeg', 35, 'In Stock', '2017-02-04 04:08:07', 'Special', ''),
(7, 4, 4, 'SAMSUNG Galaxy On5', 'SAMSUNG', 7490, 0, '<ul><li>1.5 GB RAM | 8 GB ROM | Expandable Upto 128 GB<br></li><li>5 inch HD Display<br></li><li>8MP Primary Camera | 5MP Front<br></li><li>2600 mAh Li-Ion Battery<br></li><li>Exynos 3475 Processor<br></li></ul>', 'samsung-galaxy-on7-sm-1.jpeg', 'samsung-galaxy-on5-sm-2.jpeg', 'samsung-galaxy-on5-sm-3.jpeg', 20, 'In Stock', '2017-02-04 04:10:17', '', ''),
(8, 4, 4, 'OPPO A57', 'OPPO', 14990, 0, '<ul><li>3 GB RAM | 32 GB ROM | Expandable Upto 256 GB<br></li><li>5.2 inch HD Display<br></li><li>13MP Primary Camera | 16MP Front<br></li><li>2900 mAh Battery<br></li><li>Qualcomm MSM8940 64-bit Processor<br></li></ul>', 'oppo-a57-na-original-1.jpeg', 'oppo-a57-na-original-2.jpeg', 'oppo-a57-na-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:11:54', '', ''),
(9, 4, 5, 'Affix Back Cover for Mi Redmi Note 4', 'Techguru', 259, 0, '<ul><li>Suitable For: Mobile<br></li><li>Material: Polyurethane<br></li><li>Theme: No Theme<br></li><li>Type: Back Cover<br></li><li>Waterproof<br></li></ul>', 'amzer-amz98947-original-1.jpeg', 'amzer-amz98947-original-2.jpeg', 'amzer-amz98947-original-3.jpeg', 10, 'In Stock', '2017-02-04 04:17:03', '', ''),
(11, 4, 6, 'Acer ES 15 Pentium Quad Core', 'Acer', 19990, 0, '<ul><li>Intel Pentium Quad Core Processor ( )<br></li><li>4 GB DDR3 RAM<br></li><li>Linux/Ubuntu Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul>', 'acer-aspire-notebook-original-1.jpeg', 'acer-aspire-notebook-original-2.jpeg', 'acer-aspire-notebook-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:26:17', '', ''),
(12, 4, 6, 'Micromax Canvas Laptab II (WIFI) Atom 4th Gen', 'Micromax', 10999, 0, '<ul><li>Intel Atom Processor ( 4th Gen )<br></li><li>2 GB DDR3 RAM<br></li><li>32 bit Windows 10 Operating System<br></li><li>11.6 inch Touchscreen Display<br></li></ul>', 'micromax-lt777w-2-in-1-laptop-original-1.jpeg', 'micromax-lt777w-2-in-1-laptop-original-2.jpeg', 'micromax-lt777w-2-in-1-laptop-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:28:17', '5% Off', ''),
(13, 4, 6, 'HP Core i5 5th Gen', 'HP', 41990, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">HP Core i5 5th Gen - (4 GB/1 TB HDD/Windows 10 Home/2 GB Graphics) N8M28PA 15-ac123tx Notebook</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(15.6 inch, Turbo SIlver, 2.19 kg)</span><br><div><ul><li>Intel Core i5 Processor ( 5th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>1 TB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'hp-notebook-original-1.jpeg', 'hp-notebook-original-2.jpeg', 'hp-notebook-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:30:24', '', ''),
(14, 4, 6, 'Lenovo Ideapad 110 APU Quad Core A6 6th Gen', 'Lenovo', 22990, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">Lenovo Ideapad 110 APU Quad Core A6 6th Gen - (4 GB/500 GB HDD/Windows 10 Home) 80TJ00D2IH IP110 15ACL Notebook</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(15.6 inch, Black, 2.2 kg)</span><br><div><ul><li>AMD APU Quad Core A6 Processor ( 6th Gen )<br></li><li>4 GB DDR3 RAM<br></li><li>64 bit Windows 10 Operating System<br></li><li>500 GB HDD<br></li><li>15.6 inch Display<br></li></ul></div>', 'lenovo-ideapad-notebook-original-1.jpeg', 'lenovo-ideapad-notebook-original-2.jpeg', 'lenovo-ideapad-notebook-3.jpeg', 0, 'In Stock', '2017-02-04 04:32:15', '', ''),
(15, 5, 10, 'The Wimpy Kid Do -It- Yourself Book', 'ABC', 205, 250, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">The Wimpy Kid Do -It- Yourself Book</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(English, Paperback, Jeff Kinney)</span><br><div><ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Penguin Books Ltd<br></li><li>ISBN: 9780141339665, 0141339667<br></li><li>Edition: 1<br></li></ul></div>', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 'diary-of-a-wimpy-kid-do-it-yourself-book-original-1.jpeg', 50, 'In Stock', '2017-02-04 04:35:13', '', ''),
(16, 3, 8, 'Thea Stilton and the Tropical Treasure ', 'XYZ', 240, 0, '<ul><li>Language: English<br></li><li>Binding: Paperback<br></li><li>Publisher: Scholastic<br></li><li>ISBN: 9789351032083, 9351032086<br></li><li>Edition: 2015<br></li><li>Pages: 176<br></li></ul>', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', '22-thea-stilton-and-the-tropical-treasure-original-1.jpeg', 30, 'In Stock', '2017-02-04 04:36:23', '', ''),
(17, 5, 9, 'Induscraft Solid Wood King Bed With Storage', 'Induscraft', 32566, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">Induscraft Solid Wood King Bed With Storage</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(Finish Color - Honey Brown)</span><br><div><ul><li>Material Subtype: Rosewood (Sheesham)<br></li><li>W x H x D: 1850 mm x 875 mm x 2057.5 mm<br></li><li>Floor Clearance: 8 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-1.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-2.jpeg', 'inaf245-queen-rosewood-sheesham-induscraft-na-honey-brown-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:40:37', '', ''),
(18, 5, 10, 'Nilkamal Ursa Metal Queen Bed', 'Nilkamal', 6523, 0, '<span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">@home by Nilkamal Ursa Metal Queen Bed</span><span style="color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 18px;">&nbsp;&nbsp;(Finish Color - NA)</span><br><div><ul><li>Material Subtype: Carbon Steel<br></li><li>W x H x D: 1590 mm x 910 mm x 2070 mm<br></li><li>Floor Clearance: 341 mm<br></li><li>Delivery Condition: Knock Down<br></li></ul></div>', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-1.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-2.jpeg', 'flbdorsabrqbblk-queen-carbon-steel-home-by-nilkamal-na-na-original-3.jpeg', 0, 'In Stock', '2017-02-04 04:42:27', 'Todays', ''),
(19, 6, 12, 'Asian Casuals  (White, White)', 'Asian', 379, 0, '<ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">Colour: White, White</li><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;">Outer Material: Denim</li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><br></div></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 45, 'In Stock', '2017-03-10 20:16:03', '', ''),
(20, 6, 12, 'Adidas MESSI 16.3 TF Football turf Shoes  (Blue)', 'Adidas', 4129, 5000, '<ul style="box-sizing: border-box; margin-bottom: 0px; margin-left: 0px; color: rgb(33, 33, 33); font-family: Roboto, Arial, sans-serif; font-size: 14px;"><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 8px 16px; list-style: none; position: relative;">Colour: Blue</li><li class="_2-riNZ" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 16px; list-style: none; position: relative;">Closure: Laced</li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Weight</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>200 g (per single Shoe) - Weight of the product may vary depending on size.</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Style</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>Panel and Stitch Detail, Textured Detail</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Tip Shape</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>Round</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 16px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Season</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>AW16</b></li></ul></li><li class="_1KuY3T row" style="box-sizing: border-box; margin: 0px; padding: 0px; list-style: none; display: flex; flex-flow: row wrap; width: 731px;"><div class="vmXPri col col-3-12" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px 8px 0px 0px; width: 182.75px; display: inline-block; vertical-align: top; color: rgb(135, 135, 135);"><b>Closure</b></div><ul class="_3dG3ix col col-9-12" style="box-sizing: border-box; margin-left: 0px; width: 548.25px; display: inline-block; vertical-align: top; line-height: 1.4;"><li class="sNqDog" style="text-align: left; box-sizing: border-box; margin: 0px; padding: 0px; list-style: none;"><b>Laced</b></li></ul></li></ul>', '1.jpeg', '2.jpeg', '3.jpeg', 0, 'In Stock', '2017-03-10 20:19:22', '', ''),
(21, 5, 10, 'Mind', 'KK', 45000, 50000, 'Hello Best&nbsp;', 'snap.png', 'snap.png', 'snap.png', 50, 'In Stock', '2017-08-24 05:38:21', '', ''),
(22, 4, 7, 'DELL', 'DELL', 99999, 100000, 'OFFERS', 'snap.png', 'snap.png', 'snap.png', 20, 'In Stock', '2017-08-24 05:52:34', 'Special', '');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(2, 4, 'Led Television', '2017-01-26 16:24:52', '26-01-2017 11:03:40 PM'),
(3, 4, 'Television', '2017-01-26 16:29:09', ''),
(4, 4, 'Mobiles', '2017-01-30 16:55:48', ''),
(5, 4, 'Mobile Accessories', '2017-02-04 04:12:40', ''),
(6, 4, 'Laptops', '2017-02-04 04:13:00', ''),
(7, 4, 'Computers', '2017-02-04 04:13:27', ''),
(8, 3, 'Comics', '2017-02-04 04:13:54', ''),
(9, 5, 'Beds', '2017-02-04 04:36:45', ''),
(10, 5, 'Sofas', '2017-02-04 04:37:02', ''),
(11, 5, 'Dining Tables', '2017-02-04 04:37:51', ''),
(12, 6, 'Men Footwears', '2017-03-10 20:12:59', ''),
(13, 7, 'Admin', '2017-08-12 10:42:08', '');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-07 08:54:58', '', 0),
(2, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-07 08:55:33', '', 0),
(3, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-07 08:55:40', '', 0),
(4, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-07 08:55:48', '', 0),
(5, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-07 08:56:10', '', 0),
(6, 'ssss@gamil.com', 0x3a3a3100000000000000000000000000, '2017-09-07 08:56:50', '', 1),
(7, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-21 09:47:24', '', 0),
(8, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-21 09:47:35', '', 0),
(9, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-21 09:50:06', '', 1),
(10, 'sss@gmail.com', 0x3a3a3100000000000000000000000000, '2017-09-27 12:39:24', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `shippingAddress` longtext NOT NULL,
  `shippingState` varchar(255) NOT NULL,
  `shippingCity` varchar(255) NOT NULL,
  `shippingPincode` int(11) NOT NULL,
  `billingAddress` longtext NOT NULL,
  `billingState` varchar(255) NOT NULL,
  `billingCity` varchar(255) NOT NULL,
  `billingPincode` int(11) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(2, 'Amit ', 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '', '', '', 0, '', '', '', 0, '2017-08-18 17:21:22', ''),
(3, 'sss', 'sss@gmail.com', 8554847034, '670b14728ad9902aecba32e22fa4f6bd', 'pune Bhosari', 'Maharashtra', 'pune', 444444, 'pune', 'maharashtra', 'Pune', 411039, '2017-08-12 08:31:27', ''),
(4, 's', 'ssss@gamil.com', 0, '4a7d1ed414474e4033ac29ccb8653d9b', '', '', '', 0, '', '', '', 0, '2017-09-07 08:56:39', ''),
(5, 'sandeshk', 'cscs@dgfd.com', 9999999999, '6512bd43d9caa6e02c990b0a82652dca', '', '', '', 0, '', '', '', 0, '2017-09-21 12:33:30', ''),
(6, 'cxzc', 'cxzc@dfs.hfgh', 5444343435, '550a141f12de6341fba65b0ad0433500', '', '', '', 0, '', '', '', 0, '2017-09-21 12:35:36', '');

-- --------------------------------------------------------

--
-- Table structure for table `users2`
--

CREATE TABLE `users2` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `gender` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users2`
--

INSERT INTO `users2` (`id`, `username`, `email`, `password`, `gender`) VALUES
(1, 'belalkhan', 'belal@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'male'),
(2, 'ramizkhan', 'ramiz@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male'),
(3, 'azadkhan', 'azad@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male'),
(4, 'pappukhan', 'pappu@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Male'),
(5, 'yasharkhan', 'yashar@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male'),
(6, 'sunnykumar', 'sunny@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male'),
(7, 'faizkhan', 'faiz@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL,
  `website` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `brand_cat` varchar(500) NOT NULL,
  `vendor_desc` varchar(1000) NOT NULL,
  `vreg_certificate` varchar(200) NOT NULL,
  `vid_proof` varchar(200) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `name`, `email`, `contactno`, `address`, `website`, `username`, `password`, `brand`, `brand_cat`, `vendor_desc`, `vreg_certificate`, `vid_proof`, `creationDate`, `updationDate`) VALUES
(1, '', '', '', '', '', 'admin', 'cfcd208495d565ef66e7dff9f98764da', 'HP', '', '', '', '', '2017-01-24 16:21:18', '17-08-2017 11:33:59 AM'),
(2, '', 'aaa@gmail.com', '9876543210', '', '', 'adm', '670b14728ad9902aecba32e22fa4f6bd', 'OPPO', '', '', '', '', '2017-01-24 16:21:18', '17-08-2017 11:44:31 AM'),
(8, 'Anusha', 'anusha.girdhar04@gmail.com', '9665730597', 'Abcchauk', 'www.abc.com', 'admin', '670b14728ad9902aecba32e22fa4f6bd', 'Micromax', 'Core I5', 'scsdvsdv', 'vendordoc_certificate_1502974765.jpg', 'vendor_1502974765.jpg', '2017-08-17 12:59:25', ''),
(9, 'sandesh', 'aaaa@gmail.com', '9898989898', 'pune', 'sss.com', 'sandesh.khutal', 'c6f057b86584942e415435ffb1fa93d4', 'khutal', 'no', 'hello', 'vendordoc_certificate_1503045494.png', 'vendor_1503045494.png', '2017-08-18 08:38:14', ''),
(10, 'sanket', 'aaaa@gmail.com', '2020102012', 'vbvcbcv', 'com.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'HPL', 'zp', 'cbcvbc', 'photo.jpg', 'photo.jpg', '2017-08-24 10:07:10', '');

-- --------------------------------------------------------

--
-- Table structure for table `vendor1`
--

CREATE TABLE `vendor1` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL,
  `website` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `brand_cat` varchar(500) NOT NULL,
  `vendor_desc` varchar(1000) NOT NULL,
  `proof1` varchar(200) NOT NULL,
  `proof2` varchar(200) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vendor1`
--

INSERT INTO `vendor1` (`id`, `name`, `email`, `mobile`, `address`, `website`, `username`, `password`, `brand`, `brand_cat`, `vendor_desc`, `proof1`, `proof2`, `creationDate`, `updationDate`) VALUES
(1, '', '', '', '', '', 'admin', 'cfcd208495d565ef66e7dff9f98764da', 'HP', '', '', '', '', '2017-01-24 16:21:18', '17-08-2017 11:33:59 AM'),
(2, '', '', '', '', '', 'adm', 'dcddb75469b4b4875094e14561e573d8', 'OPPO', '', '', '', '', '2017-01-24 16:21:18', '17-08-2017 11:44:31 AM');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `postingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(1, 1, 0, '2017-02-27 18:53:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newwishlist`
--
ALTER TABLE `newwishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users2`
--
ALTER TABLE `users2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor1`
--
ALTER TABLE `vendor1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `newwishlist`
--
ALTER TABLE `newwishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users2`
--
ALTER TABLE `users2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `vendor1`
--
ALTER TABLE `vendor1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
