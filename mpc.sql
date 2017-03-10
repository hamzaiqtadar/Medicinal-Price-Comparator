-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2016 at 04:58 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mpc`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminpass`
--

CREATE TABLE `adminpass` (
  `pass_id` int(11) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `pass_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `admin_u_name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_u_name`, `password`, `modified`) VALUES
(1, 'admin.umar', '1234567', '2016-05-22 05:52:41'),
(2, 'admin.hamza', '1234567', '2016-05-22 05:52:41'),
(3, 'admin.umer', '1234567', '2016-05-22 05:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `date_modified`) VALUES
(1, 'Gentz', '2016-05-22 06:37:19'),
(2, 'CompanyABC', '2016-05-22 16:19:01'),
(3, 'Reckitt Benckiser', '2016-05-23 01:20:35'),
(4, 'SomeNewCompany', '2016-05-23 02:45:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `c_name` varchar(45) NOT NULL,
  `c_email` varchar(45) DEFAULT NULL,
  `address` text NOT NULL,
  `cell_no` varchar(45) NOT NULL,
  `c_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`c_name`, `c_email`, `address`, `cell_no`, `c_id`, `username`) VALUES
('Umar Hussain ', 'xyz@abc.com', 'House 1, Street 1, Sectore, Islamabad', '3121234567', 1, 'umar123');

-- --------------------------------------------------------

--
-- Table structure for table `gen_formula`
--

CREATE TABLE `gen_formula` (
  `formula_id` int(11) NOT NULL,
  `formula_name` varchar(45) NOT NULL,
  `date_modify` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gen_formula`
--

INSERT INTO `gen_formula` (`formula_id`, `formula_name`, `date_modify`) VALUES
(1, 'Paracetamol', NULL),
(2, 'Ibuprofen', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicine_info`
--

CREATE TABLE `medicine_info` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(45) NOT NULL,
  `price_per_unit` varchar(45) NOT NULL,
  `medicine_dateadd` timestamp NULL DEFAULT NULL,
  `medicine_lastmodify` timestamp NULL DEFAULT NULL,
  `med_gen_for` int(11) DEFAULT NULL,
  `med_company_id` int(11) DEFAULT NULL,
  `unit` varchar(45) NOT NULL,
  `med_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicine_info`
--

INSERT INTO `medicine_info` (`medicine_id`, `medicine_name`, `price_per_unit`, `medicine_dateadd`, `medicine_lastmodify`, `med_gen_for`, `med_company_id`, `unit`, `med_type`) VALUES
(6, 'Panadol', '2', NULL, NULL, 1, 2, 'Tablet', NULL),
(7, 'Brufen', '2.25', NULL, NULL, 2, 3, 'Tablet', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicine_type`
--

CREATE TABLE `medicine_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(45) NOT NULL,
  `type_added` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `medicine_type`
--

INSERT INTO `medicine_type` (`type_id`, `type_name`, `type_added`) VALUES
(1, 'Tablet', NULL),
(2, 'Syrup', NULL),
(3, 'Injection', NULL),
(4, 'Capsule', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `order_quanitity` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `medicine_id`, `order_quanitity`, `total_cost`, `store_id`) VALUES
(8, 6, 1, 2, 1),
(9, 7, 12, 27, 1),
(10, 7, 14, 32, 1),
(11, 7, 12, 27, 1),
(11, 6, 13, 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `due_date` datetime NOT NULL,
  `order_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_tbl`
--

INSERT INTO `order_tbl` (`order_id`, `customer_id`, `date_added`, `transaction_id`, `due_date`, `order_status`) VALUES
(8, 1, '2016-05-23 06:13:06', 2, '2016-05-30 06:13:06', 'Expired'),
(9, 1, '2016-05-23 06:28:35', 3, '2016-05-30 06:28:35', 'Pending'),
(10, 1, '2016-05-23 06:33:38', 4, '2016-05-30 06:33:38', 'Pending'),
(11, 1, '2016-05-23 06:34:15', 5, '2016-05-30 06:34:15', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `payment_transcation`
--

CREATE TABLE `payment_transcation` (
  `transaction_id` int(11) NOT NULL,
  `t_status` varchar(45) NOT NULL DEFAULT 'Pending',
  `t_start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_val_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_transcation`
--

INSERT INTO `payment_transcation` (`transaction_id`, `t_status`, `t_start_date`, `t_val_date`) VALUES
(2, 'Pending', '2016-05-23 06:13:06', '2016-06-06 06:13:06'),
(3, 'Pending', '2016-05-23 06:28:35', '2016-06-06 06:28:35'),
(4, 'Pending', '2016-05-23 06:33:38', '2016-06-06 06:33:38'),
(5, 'Pending', '2016-05-23 06:34:15', '2016-06-06 06:34:15');

--
-- Triggers `payment_transcation`
--
DELIMITER $$
CREATE TRIGGER `payment_transcation_BINS` BEFORE INSERT ON `payment_transcation` FOR EACH ROW SET NEW.t_start_date = IFNULL(NEW.t_start_date,NOW()),
NEW.t_val_date= TIMESTAMPADD(DAY,7,NEW.t_val_date)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `stars` decimal(2,1) NOT NULL,
  `med_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `checker` int(11) NOT NULL DEFAULT '0',
  `rating_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `stars`, `med_id`, `u_id`, `checker`, `rating_time`) VALUES
(1, '5.0', 6, 1, 0, '2016-05-22 17:28:55'),
(2, '4.0', 6, 1, 0, '2016-05-23 01:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `review_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reviewtxt` text,
  `med_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `u_id`, `review_time`, `reviewtxt`, `med_id`) VALUES
(1, 1, '2016-05-22 17:29:08', 'Good medicine', 6),
(2, 1, '2016-05-23 01:36:38', 'Qwerty ', 6);

-- --------------------------------------------------------

--
-- Table structure for table `stock_info`
--

CREATE TABLE `stock_info` (
  `store_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `total_quantity` int(11) DEFAULT '0',
  `ordered_quantity` int(11) DEFAULT '0',
  `date_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_info`
--

INSERT INTO `stock_info` (`store_id`, `medicine_id`, `total_quantity`, `ordered_quantity`, `date_modified`) VALUES
(1, 6, 29, 41, '2016-05-23 01:34:15'),
(1, 7, 62, 38, '2016-05-23 01:34:15');

-- --------------------------------------------------------

--
-- Table structure for table `storepass`
--

CREATE TABLE `storepass` (
  `pass_id` int(11) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `pass_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `storeupdate`
--

CREATE TABLE `storeupdate` (
  `update_id` int(11) NOT NULL,
  `medicine` int(11) NOT NULL,
  `operation` varchar(45) NOT NULL,
  `quantity` int(11) NOT NULL,
  `receivetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifytime` timestamp NULL DEFAULT NULL,
  `modified` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `store_user`
--

CREATE TABLE `store_user` (
  `s_user_id` int(11) NOT NULL,
  `store_name` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `locality` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `store_user`
--

INSERT INTO `store_user` (`s_user_id`, `store_name`, `email_id`, `locality`, `address`, `password`, `modified`) VALUES
(1, 'Own Stock', 'sky@gmail.com', 'G-6', 'Aabpra', '1234567', '2016-05-23 00:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `userpass`
--

CREATE TABLE `userpass` (
  `pass_id` int(11) NOT NULL,
  `pass` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pass_modify` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userpass`
--

INSERT INTO `userpass` (`pass_id`, `pass`, `user_id`, `pass_modify`) VALUES
(1, 'qwerty123', 1, '2016-05-22 09:43:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpass`
--
ALTER TABLE `adminpass`
  ADD PRIMARY KEY (`pass_id`),
  ADD KEY `admin_match` (`admin_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `gen_formula`
--
ALTER TABLE `gen_formula`
  ADD PRIMARY KEY (`formula_id`);

--
-- Indexes for table `medicine_info`
--
ALTER TABLE `medicine_info`
  ADD PRIMARY KEY (`medicine_id`),
  ADD KEY `companyfk_idx` (`med_company_id`),
  ADD KEY `formulafk_idx` (`med_gen_for`),
  ADD KEY `typefk_idx` (`med_type`);

--
-- Indexes for table `medicine_type`
--
ALTER TABLE `medicine_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_fk_idx` (`order_id`),
  ADD KEY `storeid_idx` (`store_id`),
  ADD KEY `medinfo_idx` (`medicine_id`);

--
-- Indexes for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cust_fk_idx` (`customer_id`),
  ADD KEY `transfk_idx` (`transaction_id`);

--
-- Indexes for table `payment_transcation`
--
ALTER TABLE `payment_transcation`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `usr_idx` (`u_id`),
  ADD KEY `medinfod_idx` (`med_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_idx` (`u_id`),
  ADD KEY `medsinfo_idx` (`med_id`);

--
-- Indexes for table `stock_info`
--
ALTER TABLE `stock_info`
  ADD PRIMARY KEY (`medicine_id`,`store_id`),
  ADD KEY `med_id_fk_idx` (`medicine_id`);

--
-- Indexes for table `storepass`
--
ALTER TABLE `storepass`
  ADD PRIMARY KEY (`pass_id`),
  ADD KEY `storepass_idx` (`store_id`);

--
-- Indexes for table `storeupdate`
--
ALTER TABLE `storeupdate`
  ADD PRIMARY KEY (`update_id`),
  ADD KEY `store_idx` (`store_id`),
  ADD KEY `mdinof_idx` (`medicine`);

--
-- Indexes for table `store_user`
--
ALTER TABLE `store_user`
  ADD PRIMARY KEY (`s_user_id`);

--
-- Indexes for table `userpass`
--
ALTER TABLE `userpass`
  ADD PRIMARY KEY (`pass_id`),
  ADD KEY `userid_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpass`
--
ALTER TABLE `adminpass`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gen_formula`
--
ALTER TABLE `gen_formula`
  MODIFY `formula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `medicine_info`
--
ALTER TABLE `medicine_info`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `medicine_type`
--
ALTER TABLE `medicine_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `order_tbl`
--
ALTER TABLE `order_tbl`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `payment_transcation`
--
ALTER TABLE `payment_transcation`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `storepass`
--
ALTER TABLE `storepass`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `storeupdate`
--
ALTER TABLE `storeupdate`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store_user`
--
ALTER TABLE `store_user`
  MODIFY `s_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `userpass`
--
ALTER TABLE `userpass`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminpass`
--
ALTER TABLE `adminpass`
  ADD CONSTRAINT `admin_match` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicine_info`
--
ALTER TABLE `medicine_info`
  ADD CONSTRAINT `companyfk` FOREIGN KEY (`med_company_id`) REFERENCES `company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `formulafk` FOREIGN KEY (`med_gen_for`) REFERENCES `gen_formula` (`formula_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `typefk` FOREIGN KEY (`med_type`) REFERENCES `medicine_type` (`type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `medinfo` FOREIGN KEY (`medicine_id`) REFERENCES `medicine_info` (`medicine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_fk` FOREIGN KEY (`order_id`) REFERENCES `order_tbl` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `storeid` FOREIGN KEY (`store_id`) REFERENCES `store_user` (`s_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD CONSTRAINT `cust_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfk` FOREIGN KEY (`transaction_id`) REFERENCES `payment_transcation` (`transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `medinfod` FOREIGN KEY (`med_id`) REFERENCES `medicine_info` (`medicine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usr` FOREIGN KEY (`u_id`) REFERENCES `customer` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `medsinfo` FOREIGN KEY (`med_id`) REFERENCES `medicine_info` (`medicine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user` FOREIGN KEY (`u_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `storepass`
--
ALTER TABLE `storepass`
  ADD CONSTRAINT `store_user` FOREIGN KEY (`store_id`) REFERENCES `store_user` (`s_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `storeupdate`
--
ALTER TABLE `storeupdate`
  ADD CONSTRAINT `mdinof` FOREIGN KEY (`medicine`) REFERENCES `medicine_info` (`medicine_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `store-r` FOREIGN KEY (`store_id`) REFERENCES `store_user` (`s_user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `userpass`
--
ALTER TABLE `userpass`
  ADD CONSTRAINT `userid` FOREIGN KEY (`user_id`) REFERENCES `customer` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
