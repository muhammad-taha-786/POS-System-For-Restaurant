-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2026 at 05:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_system_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_ban` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=not_ban,1=ban',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `is_ban`, `created_at`) VALUES
(5, 'Muhammad Taha', 'tsyed6804@gmail.com', '$2y$10$/xrwnt0gBJRXiHjpm3gbCuNzxIRWPNBRj0VC5hW2ygi9rWjbcxjRO', '03162418947', 0, '2025-12-18'),
(6, 'Farhan Shoaid', 'farhan@gmail.com', '$2y$10$bE7ugjYqv2CoUTb6/.DR6uY.oU4LA/WgpEpMy.9uyj/UBuHWfpPr.', '214356788', 0, '2025-12-23'),
(7, 'Muhammad Arsalan', 'arslan@gmail.com', '$2y$10$lyr1D7lHvkxsRGyi.11.UujqdBHsm5JJREhvgUGGgKv4KH6nc6ESe', '12345678900', 0, '2026-02-04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `status`) VALUES
(6, 'Static', 'Separated into categories like appetizers, pasta, sandwiches, sides, etc. The dishes are served year-round and are mostly prevalent in fast casual and fast food restaurants.', 0),
(7, 'Tasting', 'A collection of a certain number of small courses that serve as a customer\'s entire meal. Tasting menus can be tweaked to fit dietary needs or created anew if the same customer is dining again, giving them a whole new tasting menu experience.', 0),
(8, 'Beverage', 'A list of a restaurant\'s drinks. This is often cocktails, wine, beer, and other alcoholic drinks sold a la carte, or the menu can be displayed on the wall at coffee shops or juice bars with their list of options.', 0),
(9, 'Dessert', 'A list of desserts, like a beverage menu is often separate from the regular menu and sold a la carte. It is usually presented with the beverage menu again for after-dinner drinks at the end of the main meal.', 0),
(10, 'Wine Captain\'s Book', 'An extensive beverage menu that covers each wine\'s history and features so guests have a better understanding of how they would like to pair their drinks with their meal.', 0),
(11, 'Children\'s Item', 'To create a kid-friendly environment, restaurants will develop a children\'s menu that features limited choices and incorporates bright colors and activities. It is often disposable for easy cleanup.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(225) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `status`, `created_at`) VALUES
(1, 'Syed Taha', 'tsyed6804@gmail.com', '03162418947', 0, '2025-12-26'),
(3, 'Muhammad Owais', '', '97979789', 0, '2026-02-05'),
(5, 'Muhammad Arsalan', 'arsalan@gmail.com', '02246539677', 0, '2026-02-06');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tracking_no` varchar(100) NOT NULL,
  `invoice_no` varchar(100) NOT NULL,
  `total_amount` varchar(100) NOT NULL,
  `order_date` date NOT NULL,
  `order_status` varchar(100) DEFAULT NULL,
  `payment_mode` varchar(100) NOT NULL COMMENT 'cash, online',
  `order_placed_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `tracking_no`, `invoice_no`, `total_amount`, `order_date`, `order_status`, `payment_mode`, `order_placed_by_id`) VALUES
(1, 4, '6698334', 'INV.2913050', '15456', '2026-02-05', 'booked', 'Cash Payment', 5),
(2, 4, '5736301', 'INV.2089204', '243', '2026-02-05', 'booked', 'Online Payment', 5),
(3, 4, '2774166', 'INV.9306392', '243', '2026-02-05', 'booked', 'Cash Payment', 5),
(4, 1, '5208843', 'INV.1935257', '20000', '2026-02-05', 'booked', 'Cash Payment', 5),
(5, 4, '5693951', 'INV.756917', '150', '2026-02-05', 'booked', 'Cash Payment', 5),
(6, 4, '5644942', 'INV.1456218', '15000', '2026-02-06', 'booked', 'Cash Payment', 5),
(7, 4, '5943216', 'INV.780544', '243', '2026-02-06', 'booked', 'Cash Payment', 5),
(8, 4, '8805340', 'INV.6353535', '456', '2026-02-06', 'booked', 'Cash Payment', 5),
(9, 5, '8105827', 'INV.6735119', '1440', '2026-02-07', 'booked', 'Cash Payment', 5),
(10, 1, '9544244', 'INV.7111236', '1170', '2026-02-07', 'booked', 'Cash Payment', 5),
(11, 3, '3088017', 'INV.6371197', '7850', '2026-02-08', 'booked', 'Cash Payment', 6);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `quantity`) VALUES
(1, 1, 2, '', '1'),
(2, 1, 11, '', '15'),
(3, 2, 1, '', '1'),
(4, 3, 1, '', '1'),
(5, 4, 11, '', '20'),
(6, 5, 10, '', '1'),
(7, 6, 11, '', '15'),
(8, 7, 1, '243', '1'),
(9, 8, 2, '456', '1'),
(10, 0, 14, '120', '12'),
(11, 0, 13, '250', '12'),
(12, 0, 12, '250', '1'),
(13, 0, 13, '250', '1'),
(14, 9, 14, '120', '12'),
(15, 10, 15, '117', '10'),
(16, 11, 13, '250', '5'),
(17, 11, 12, '250', '1'),
(18, 11, 14, '120', '5'),
(19, 11, 16, '250', '1'),
(20, 11, 17, '550', '10');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible,1=hidden',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `quantity`, `image`, `status`, `created_at`) VALUES
(12, 7, 'Tasting menu', 'A tasting menu, or degustation menu, consists of several bite-sized dishes that are served to guests as a single meal. They were inspired by the French term degustation, which is defined as the careful tasting of various foods with a focus on the senses and culinary art. The key distinction between a traditional menu and a tasting menu is that you aren\'t just paying for a meal, you\'re paying for an experience. In fact, many guests will order them for milestone events such as birthdays and anniversaries.', 250, 98, 'assets/uploads/products/1770395631.webp', 0, '2026-02-06'),
(13, 7, 'Smaller, plain dishes', 'In order to invoke a sense of culinary art in each course, consider serving them on smaller, plain dishes. This will help your guests to focus on the look and texture of the food rather than the plates you serve them on. In addition, keep a variety of dining utensils ready so that your guests can enjoy the different dishes they’ll be served.', 250, 82, 'assets/uploads/products/1770395682.webp', 0, '2026-02-06'),
(14, 8, 'Pepsi Can - 300ml', 'Pepsi - the bold, refreshing, robust cola.\r\nPerfect for parties, meals, and celebrations (big & small)', 120, 71, 'assets/uploads/products/1770395789.webp', 0, '2026-02-06'),
(15, 8, 'Mountain Dew Can - 300ml', 'Mountain Dew is a carbonated soft drink brand produced and owned by PepsiCo.\r\n', 117, 90, 'assets/uploads/products/1770395862.jfif', 0, '2026-02-06'),
(16, 9, 'Pavlova Bombs', 'I do love a good Pav! They are so iconically Aussie-Christmas. In years gone by, I’ve done a towering Christmas tree pav, Mini Pavlovas, and yup, even a regular one.', 250, 99, 'assets/uploads/products/1770396005.webp', 0, '2026-02-06'),
(17, 9, 'Maple Pecan Pie Bars', 'Maple Pecan Pie Bars is what you make when you don’t have the energy for pie dough – they really do taste just like Pecan Pie! I like mine with a good amount of filling, lots and lots of pecans, and just enough salt to balance out the sweetness. The maple flavour here really hits the spot!', 550, 90, 'assets/uploads/products/1770396055.webp', 0, '2026-02-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
