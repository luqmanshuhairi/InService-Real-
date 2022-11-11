-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2021 at 07:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `aname` varchar(250) NOT NULL,
  `apass` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `aname`, `apass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bid` int(11) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `author` varchar(250) NOT NULL,
  `bimage` varchar(250) NOT NULL,
  `bfile` varchar(250) NOT NULL,
  `keywords` varchar(250) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bid`, `bname`, `author`, `bimage`, `bfile`, `keywords`, `cat_id`, `price`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `itm_no` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`itm_no`, `cus_id`, `bid`) VALUES
(8, 10, 12),
(17, 1, 37);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(250) NOT NULL,
  `cat_image` varchar(250) DEFAULT NULL,
  `cat_image1` varchar(250) DEFAULT NULL,
  `cat_desc` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_image`, `cat_image1`, `cat_desc`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `logs` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`com_id`, `cus_id`, `bid`, `comment`, `logs`) VALUES
(1, 2, 2, 'Fantastic!', '2021-05-15 15:24:50'),
(2, 3, 5, 'Amazing stuff', '2021-05-15 15:33:14'),
(3, 3, 6, 'Woww, must read book.', '2021-05-15 15:37:08'),
(4, 1, 10, 'Expected something more', '2021-05-15 15:38:34'),
(6, 1, 9, 'Uhhhh', '2021-05-18 18:39:18'),
(7, 1, 33, 'hiiii very\'s bad', '2021-05-22 12:59:10'),
(8, 1, 7, 'Mind blowing!', '2021-05-27 22:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `cus_name` varchar(250) NOT NULL,
  `cus_image` varchar(250) NOT NULL,
  `cus_mail` varchar(250) NOT NULL,
  `cus_pass` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `cus_name`, `cus_image`, `cus_mail`, `cus_pass`) VALUES
(1, 'Sachin', 'admin/media/profile_img/Sachin.jpeg', 'sachinraghult2002@gmail.com', 'sachin@T20'),
(2, 'Srivatsav', 'admin/media/profile_img/Srivatsav.jpg', 'srivatsavr02@gmail.com', 'Sri@123'),
(3, 'Sanjeev', 'admin/media/profile_img/Sanjeev.jpg', 'er.sanjeev.au@gmail.com', 'Sanjeev@1'),
(4, 'Rohit', 'admin/media/profile_img/Rohit.jpg', 'rohit45@gmail.com', 'Hitman@45'),
(5, 'Demo', 'admin/media/profile_img/profile5.jpg', 'demo@gmail.com', 'Demo@123'),
(6, 'New', 'admin/media/profile_img/profile6.jpg', 'new@gmail.com', 'New@123'),
(7, 'trial', 'admin/media/profile_img/def99864.jpg', 'trial@gmail.com', 'Trial@123'),
(8, 'Unknown', 'admin/media/profile_img/Rohit3747.jpg', 'unknown@gmail.com', 'Unknown@123'),
(9, 'MSD', 'admin/media/profile_img/Dhoni.jpg', 'msd@gmail.com', 'Thala@7'),
(10, 'Virat', 'admin/media/profile_img/Virat.jpg', 'virat@gmail.com', 'King@18');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `bill_id` int(11) NOT NULL,
  `txn_id` varchar(250) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `logs` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`bill_id`, `txn_id`, `cus_id`, `bid`, `logs`) VALUES
(1, 'OD3910026', 1, 7, '2021-05-15 15:12:29'),
(2, 'OD7421216', 1, 9, '2021-05-15 15:13:39'),
(3, 'OD1038340', 2, 8, '2021-05-15 15:16:03'),
(4, 'OD9061260', 2, 2, '2021-05-15 15:16:44'),
(5, 'OD479970', 3, 6, '2021-05-15 15:17:44'),
(6, 'OD703829', 4, 4, '2021-05-15 15:19:00'),
(7, 'OD5112137', 1, 10, '2021-05-15 15:20:16'),
(8, 'OD3195304', 5, 3, '2021-05-15 15:21:16'),
(9, 'OD6159718', 3, 9, '2021-05-15 15:21:59'),
(10, 'OD5824685', 3, 5, '2021-05-15 15:22:29'),
(11, 'OD5648856', 7, 1, '2021-05-15 15:23:15'),
(12, 'OD1381200', 2, 9, '2021-05-15 15:25:21'),
(13, 'OD2595454', 3, 12, '2021-05-15 15:32:40'),
(14, 'OD999937', 1, 12, '2021-05-15 15:39:28'),
(15, 'OD3584137', 1, 13, '2021-05-15 16:07:15'),
(16, 'OD6787210', 1, 8, '2021-05-18 16:21:19'),
(17, 'OD7410009', 10, 13, '2021-05-18 16:58:04'),
(18, 'OD6761260', 10, 3, '2021-05-18 17:03:49'),
(19, 'OD5281954', 10, 9, '2021-05-18 17:04:41'),
(20, 'OD2032527', 1, 6, '2021-05-20 07:11:09'),
(21, 'OD2032527', 1, 4, '2021-05-20 07:11:09'),
(22, 'OD6117644', 10, 1, '2021-05-20 07:52:26'),
(23, 'OD6117644', 10, 11, '2021-05-20 07:52:26'),
(24, 'OD3102141', 4, 9, '2021-05-20 07:56:06'),
(25, 'OD946759', 4, 13, '2021-05-20 07:57:00'),
(26, 'OD4148659', 9, 11, '2021-05-20 08:49:58'),
(27, 'OD4148659', 9, 8, '2021-05-20 08:49:58'),
(28, 'OD6251326', 9, 13, '2021-05-20 08:51:09'),
(29, 'OD2357994', 2, 6, '2021-05-20 12:26:09'),
(30, 'OD588258', 1, 33, '2021-05-22 10:36:26'),
(31, 'OD494625', 1, 17, '2021-05-27 22:53:46');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `rid` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `request` varchar(250) NOT NULL,
  `logs` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`rid`, `cus_id`, `bname`, `request`, `logs`) VALUES
(4, 3, 'Grandma Tales', 'Needed story books for Bedtime :/', '2021-05-15 15:34:39'),
(6, 10, 'The Guest', 'Much awaited for thrillers', '2021-05-18 17:10:45'),
(7, 1, 'Java Programming', 'I need this book sir!', '2021-05-18 18:24:25'),
(8, 1, 'Tinkle', 'I love Suppandi comedies.', '2021-05-27 22:56:58');

-- --------------------------------------------------------

--
-- Table structure for table `temp_payments`
--

CREATE TABLE `temp_payments` (
  `bill_id` int(11) NOT NULL,
  `txn_id` varchar(250) NOT NULL,
  `cus_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `temp_payments`
--

INSERT INTO `temp_payments` (`bill_id`, `txn_id`, `cus_id`, `bid`) VALUES
(6, 'OD2861488', 3, 1),
(8, 'OD44734', 1, 10),
(14, 'OD1306308', 7, 11),
(16, 'OD8537612', 6, 11),
(17, 'OD270870', 1, 8),
(25, 'OD6612601', 1, 6),
(26, 'OD1874447', 1, 6),
(29, 'OD6526280', 1, 3),
(30, 'OD7044830', 1, 3),
(31, 'OD9920144', 1, 3),
(34, 'OD3528278', 10, 12),
(44, 'OD1200735', 1, 31);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`itm_no`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Indexes for table `temp_payments`
--
ALTER TABLE `temp_payments`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `bid` (`bid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `itm_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `temp_payments`
--
ALTER TABLE `temp_payments`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_payments`
--
ALTER TABLE `temp_payments`
  ADD CONSTRAINT `temp_payments_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_payments_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
