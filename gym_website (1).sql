-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2025 at 05:29 PM
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
-- Database: `gym_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `date`, `time`, `created_at`) VALUES
(1, 'Manasa', '2025-04-18', '15:03:00', '2025-04-07 05:28:08'),
(2, 'josanto', '2025-04-10', '20:51:00', '2025-04-09 10:18:02'),
(5, 'www', '2025-05-23', '04:41:00', '2025-05-06 16:06:51'),
(6, 'fff', '2025-05-29', '15:44:00', '2025-05-07 05:09:40'),
(7, 'om', '2025-06-06', '16:46:00', '2025-05-12 05:10:54');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `name`, `email`, `phone`, `plan_id`, `created_at`) VALUES
(12, 'josanto', 'josanto@gmail.com', '998767646', 1, '2025-04-09 10:58:48'),
(13, 'mary', 'mary@gmail.com', '123', 1, '2025-04-09 11:12:43'),
(15, 'mary', 'mary@gmail.com', '123', 2, '2025-05-06 16:05:52'),
(16, 'mary', 'mary@gmail.com', '123', 3, '2025-05-07 05:09:19'),
(17, 'om', 'mary@gmail.com', '123', 3, '2025-05-12 05:10:33');

-- --------------------------------------------------------

--
-- Table structure for table `membership_plans`
--

CREATE TABLE `membership_plans` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership_plans`
--

INSERT INTO `membership_plans` (`id`, `plan_name`, `cost`, `duration`, `description`) VALUES
(1, 'Basic Plan', 29.99, '1 Month', 'Access to gym facilities during working hours.'),
(2, 'Standard Plan', 79.99, '6 Months', 'Access to gym facilities and group classes.'),
(3, 'Premium Plan', 149.99, '1 Year', 'Unlimited access to all facilities and personal training sessions.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `area` varchar(100) NOT NULL,
  `payment_method` enum('cod','credit_card','debit_card','paypal') NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `created_at`) VALUES
(1, 'Gym Membership', 'Monthly access to all gym facilities.', 29.99, '2025-04-05 10:34:39'),
(2, 'Protein Powder', 'High-quality protein powder for muscle recovery.', 39.99, '2025-04-05 10:34:39'),
(3, 'Yoga Mat', 'Comfortable and durable yoga mat for your workouts.', 19.99, '2025-04-05 10:34:39'),
(4, 'Dumbbells', 'Adjustable dumbbells for strength training.', 49.99, '2025-04-05 10:34:39'),
(5, 'Fitness Tracker', 'Track your workouts and health metrics.', 99.99, '2025-04-05 10:34:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(2, 'xxx', '$2y$10$BiE5liePick0XaFrqvDcWeNmxHryeF2vPX1p2cHXjwxQEdw5sV3ea', 'aa@gmail.com', '2025-04-05 10:09:05'),
(3, 'rithika', '$2y$10$Cmxw8.u/QVu79LGULYldpOgSqbzXCX8HFVx481bC7skSIt82g0.SC', 'rithika@gmail.com', '2025-04-09 08:37:19'),
(4, 'josanto', '$2y$10$98tfLrH8ChUGKtjl7YyOeeWQzfRUJNdCtYZXt/jxIp/M/XH8OvVWa', 'josanto@gmail.com', '2025-04-09 10:15:19'),
(5, 'hewina', '$2y$10$SD4b97R8t66QmoYqRuwdHOWZzGinTTdugW1YA1ymXvx1dwN9DJt.O', 'hewina@gmail.com', '2025-04-09 10:56:21'),
(7, 'xxxx', '$2y$10$Q.raCx9pqye8KFyeHrHRf.YG9xXmVae/gcoN2/QklGwA.PexI9TXq', 'aaa@gmail.com', '2025-05-06 16:03:39'),
(8, 'sss', '$2y$10$y1kPQlpxpu/rxyS/e9e7PuHNCKAHv9I100lqY2g57qeIxAIE73mYe', 'ss@gmail.com', '2025-05-07 05:08:51'),
(9, 'om', '$2y$10$r6zJOI/wltkD4cY8CjSUHO1s0B76xE0YndaceIswMFypxru3JdPWy', 'om@gmail.com', '2025-05-12 05:09:51'),
(10, 'xxxxx', '$2y$10$sSVW0F2J/M9gqnHxRpIq9e50vKKX6JBnxBAZRQPK4V8N8AfWwn4b6', 'y@gmail.com', '2025-05-22 07:19:47'),
(11, 'dd', '$2y$10$tY2ZF53VtXTu2.ZonyMFq.aj5L8ita8D8R8Ked0IxRzFb2yxTHahO', 'manasarasur14@gmail.com', '2025-08-20 14:39:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_id` (`plan_id`);

--
-- Indexes for table `membership_plans`
--
ALTER TABLE `membership_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `membership_plans`
--
ALTER TABLE `membership_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`plan_id`) REFERENCES `membership_plans` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
