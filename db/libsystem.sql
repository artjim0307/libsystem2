-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2021 at 09:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `libsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `user_type` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `middlename`, `lastname`, `stats`, `user_type`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$1VmOehdw8EfSiTn.wRR2EOmRviX23G6G/8KrbTRkAatc4dRTBLB2q', 'Artjim', 'A', 'Villapana', 'Active', 'Admin', 'bebe.png', '2018-05-03'),
(3, 'staff', '$2y$10$1VmOehdw8EfSiTn.wRR2EOmRviX23G6G/8KrbTRkAatc4dRTBLB2q', 'staff', 'a', 'medina', '', 'staff', '', '2021-04-26'),
(4, 'staff', '$2y$10$1VmOehdw8EfSiTn.wRR2EOmRviX23G6G/8KrbTRkAatc4dRTBLB2q', 'staff', 'a', 'medina', '', 'staff', '', '2021-04-26');

-- --------------------------------------------------------

--
-- Table structure for table `allowed_book`
--

CREATE TABLE `allowed_book` (
  `allowed_book_id` int(100) NOT NULL,
  `qntty_books` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allowed_book`
--

INSERT INTO `allowed_book` (`allowed_book_id`, `qntty_books`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `allowed_days`
--

CREATE TABLE `allowed_days` (
  `allowed_days_id` int(11) NOT NULL,
  `no_of_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allowed_days`
--

INSERT INTO `allowed_days` (`allowed_days_id`, `no_of_days`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `archbooks`
--

CREATE TABLE `archbooks` (
  `id` int(250) NOT NULL,
  `accesion` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `pub_yr` date NOT NULL,
  `edition` varchar(100) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `audiovisual`
--

CREATE TABLE `audiovisual` (
  `id` int(11) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `publishyr` date NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `descript` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audiovisual`
--

INSERT INTO `audiovisual` (`id`, `isbn`, `title`, `authors`, `publisher`, `publishyr`, `category_id`, `section`, `descript`) VALUES
(20, '9781138184145', 'asdasd', 'asdasd', 'London Routledge, Taylor & Francis Group [2018]', '2021-04-26', 'A-General Works', 'Circulation Section', 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `audiovisual_inv`
--

CREATE TABLE `audiovisual_inv` (
  `id` int(11) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `typ` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audiovisual_inv`
--

INSERT INTO `audiovisual_inv` (`id`, `isbn`, `stats`, `typ`, `quantity`) VALUES
(1, '9781138184145', 'Available', 'Donated', '1'),
(2, '9781138184145', 'Available', 'Purchased', '1');

-- --------------------------------------------------------

--
-- Table structure for table `bookinformation`
--

CREATE TABLE `bookinformation` (
  `id` int(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `publishyr` date NOT NULL,
  `edit` varchar(100) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookinformation`
--

INSERT INTO `bookinformation` (`id`, `title`, `isbn`, `author`, `publisher`, `publishyr`, `edit`, `category_id`, `section`) VALUES
(28, 'asdasd', '9781138184145', 'Giannachi, Gabriella (Editor), Westerman, Jonah (Editor)', 'London Routledge, Taylor & Francis Group [2018]', '2021-04-20', 'IX', 'A-General Works', 'Circulation Section');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `typ` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `isbn`, `stats`, `typ`, `quantity`) VALUES
(41, '9781138184145', 'Not Available', 'Purchased', 1),
(42, '9781138184145', 'Available', 'Replaced', 1),
(43, '9781138184145', 'Available', 'Purchased', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `date_borrow` date NOT NULL,
  `date_issued` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `report_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `detail_action` varchar(100) NOT NULL,
  `date_transaction` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrowed_books`
--

INSERT INTO `borrowed_books` (`report_id`, `book_id`, `student_id`, `admin_name`, `detail_action`, `date_transaction`) VALUES
(1, 20, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-10 03:38:19'),
(2, 20, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-10 04:03:53'),
(3, 20, 20161234, 'Artjim A Villapana', 'Borrowed Book', '2021-04-12 17:22:03'),
(4, 32, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 14:56:03'),
(5, 33, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:13:46'),
(6, 34, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:15:48'),
(7, 35, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:20:59'),
(8, 37, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:38:22'),
(9, 37, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:44:38'),
(10, 37, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:51:29'),
(11, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 12:46:28'),
(12, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:28:38'),
(13, 42, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:29:07'),
(14, 43, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:29:13'),
(15, 43, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:32:01'),
(16, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:36:10'),
(17, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:36:43'),
(18, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:40:48'),
(19, 41, 20161234, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 17:52:20'),
(20, 43, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 17:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_report`
--

CREATE TABLE `borrowed_report` (
  `report_id` int(100) NOT NULL,
  `book_id` int(100) NOT NULL,
  `student_id` int(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `detail_action` varchar(100) NOT NULL,
  `date_transaction` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrowed_report`
--

INSERT INTO `borrowed_report` (`report_id`, `book_id`, `student_id`, `admin_name`, `detail_action`, `date_transaction`) VALUES
(1, 20, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-10 03:38:19'),
(2, 20, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-10 04:03:53'),
(3, 20, 20161234, 'Artjim A Villapana', 'Borrowed Book', '2021-04-12 17:22:03'),
(4, 32, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 14:56:03'),
(5, 33, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:13:46'),
(6, 34, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:15:48'),
(7, 35, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:20:59'),
(8, 37, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:38:22'),
(9, 37, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:44:39'),
(10, 37, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-24 15:51:29'),
(11, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 12:46:29'),
(12, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:28:38'),
(13, 42, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:29:07'),
(14, 43, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:29:13'),
(15, 43, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:32:01'),
(16, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:36:10'),
(17, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:36:43'),
(18, 41, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 13:40:48'),
(19, 41, 20161234, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 17:52:20'),
(20, 43, 201710162, 'Artjim A Villapana', 'Borrowed Book', '2021-04-25 17:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_book`
--

CREATE TABLE `borrow_book` (
  `borrow_book_id` int(100) NOT NULL,
  `student_id` int(100) NOT NULL,
  `book_id` int(100) NOT NULL,
  `date_borrowed` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `date_returned` datetime NOT NULL,
  `borrowed_status` varchar(100) NOT NULL,
  `book_penalty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `borrow_book`
--

INSERT INTO `borrow_book` (`borrow_book_id`, `student_id`, `book_id`, `date_borrowed`, `due_date`, `date_returned`, `borrowed_status`, `book_penalty`) VALUES
(1, 201710162, 20, '2021-04-10 03:38:17', '2021-04-10 03:38:17', '2021-04-10 04:02:45', 'returned', '0'),
(2, 201710162, 20, '2021-04-10 04:03:50', '2021-04-10 04:03:50', '2021-04-10 04:04:11', 'returned', '0'),
(3, 20161234, 20, '2021-04-12 17:22:01', '2021-04-12 17:22:01', '2021-04-12 17:22:16', 'returned', '0'),
(4, 201710162, 32, '2021-04-24 14:56:01', '2021-04-24 14:56:01', '2021-04-24 14:57:55', 'returned', '0'),
(5, 201710162, 33, '2021-04-24 15:13:45', '2021-04-24 15:13:45', '2021-04-24 15:13:59', 'returned', '0'),
(6, 201710162, 34, '2021-04-24 15:15:46', '2021-04-24 15:15:46', '2021-04-24 15:16:39', 'returned', '0'),
(7, 201710162, 35, '2021-04-24 15:20:58', '2021-04-24 15:20:58', '2021-04-24 15:21:51', 'returned', '0'),
(8, 201710162, 37, '2021-04-24 15:38:19', '2021-04-24 15:38:19', '2021-04-24 15:39:31', 'returned', '0'),
(9, 201710162, 37, '2021-04-24 15:44:37', '2021-04-24 15:44:37', '2021-04-24 15:51:10', 'returned', '0'),
(10, 201710162, 37, '2021-04-24 15:51:28', '2021-04-24 15:51:28', '2021-04-24 15:52:03', 'returned', '0'),
(11, 201710162, 41, '2021-04-25 12:46:27', '2021-04-25 12:46:27', '2021-04-25 12:47:19', 'returned', '0'),
(12, 201710162, 41, '2021-04-25 13:28:37', '2021-04-25 13:28:37', '2021-04-25 13:34:20', 'returned', '0'),
(13, 201710162, 42, '2021-04-25 13:29:06', '2021-04-25 13:29:06', '2021-04-25 13:34:19', 'returned', '0'),
(14, 201710162, 43, '2021-04-25 13:29:10', '2021-04-25 13:29:10', '2021-04-25 13:30:27', 'returned', '0'),
(15, 201710162, 43, '2021-04-25 13:31:59', '2021-04-28 13:31:59', '2021-04-25 13:34:17', 'returned', 'No Penalty'),
(16, 201710162, 41, '2021-04-25 13:36:08', '2021-04-25 13:36:08', '2021-04-25 13:36:22', 'returned', '0'),
(17, 201710162, 41, '2021-04-25 13:36:41', '2021-04-25 13:36:41', '2021-04-25 13:40:45', 'returned', '0'),
(18, 201710162, 41, '2021-04-25 13:40:47', '2021-04-27 13:40:47', '2021-04-25 13:42:50', 'returned', 'No Penalty'),
(19, 20161234, 41, '2021-04-25 17:52:17', '2021-04-27 17:52:17', '0000-00-00 00:00:00', 'borrowed', ''),
(20, 201710162, 43, '2021-04-25 17:56:36', '2021-04-27 17:56:36', '2021-04-25 17:57:06', 'returned', 'No Penalty');

-- --------------------------------------------------------

--
-- Table structure for table `borrow_report`
--

CREATE TABLE `borrow_report` (
  `id` int(100) NOT NULL,
  `student_id` varchar(100) NOT NULL,
  `book_id` varchar(100) NOT NULL,
  `date_borrowed` date NOT NULL,
  `due_date` date NOT NULL,
  `borrowed_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow_report`
--

INSERT INTO `borrow_report` (`id`, `student_id`, `book_id`, `date_borrowed`, `due_date`, `borrowed_status`) VALUES
(1, '201710162', '20', '2021-04-10', '2021-04-10', 'borrowed'),
(2, '201710162', '20', '2021-04-10', '2021-04-10', 'borrowed'),
(3, '20161234', '20', '2021-04-12', '2021-04-12', 'borrowed'),
(4, '201710162', '32', '2021-04-24', '2021-04-24', 'borrowed'),
(5, '201710162', '33', '2021-04-24', '2021-04-24', 'borrowed'),
(6, '201710162', '34', '2021-04-24', '2021-04-24', 'borrowed'),
(7, '201710162', '35', '2021-04-24', '2021-04-24', 'borrowed'),
(8, '201710162', '37', '2021-04-24', '2021-04-24', 'borrowed'),
(9, '201710162', '37', '2021-04-24', '2021-04-24', 'borrowed'),
(10, '201710162', '37', '2021-04-24', '2021-04-24', 'borrowed'),
(11, '201710162', '41', '2021-04-25', '2021-04-25', 'borrowed'),
(12, '201710162', '41', '2021-04-25', '2021-04-25', 'borrowed'),
(13, '201710162', '42', '2021-04-25', '2021-04-25', 'borrowed'),
(14, '201710162', '43', '2021-04-25', '2021-04-25', 'borrowed'),
(15, '201710162', '43', '2021-04-25', '2021-04-28', 'borrowed'),
(16, '201710162', '41', '2021-04-25', '2021-04-25', 'borrowed'),
(17, '201710162', '41', '2021-04-25', '2021-04-25', 'borrowed'),
(18, '201710162', '41', '2021-04-25', '2021-04-27', 'borrowed'),
(19, '20161234', '41', '2021-04-25', '2021-04-27', 'borrowed'),
(20, '201710162', '43', '2021-04-25', '2021-04-27', 'borrowed');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(7, 'A-General Works'),
(8, 'B-Philosophy. Psychology. Religion'),
(9, 'C-Auxiliary Sciences of History'),
(10, 'D-World History and History of Europe, Asia, Africa, Australia, New Zealand, etc.'),
(11, 'E - United States History'),
(12, 'F - General American History'),
(13, 'G - Geography, Anthropology, Recreation'),
(14, 'H - Social Science'),
(15, 'J - Political Science'),
(16, 'K - Law'),
(17, 'L - Education'),
(18, 'M - Music'),
(19, 'N - Fine Arts'),
(20, 'P - Language and Literature'),
(21, 'Q - Science'),
(22, 'R - Medicine'),
(23, ' S - Agriculture'),
(24, 'T - Technology'),
(25, 'U - Military Science'),
(26, 'Z - Library Science');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `code`) VALUES
(1, 'Bachelor of Science in Information Systems', 'BSIS'),
(2, 'Bachelor of Science in Computer Science', 'BSCS');

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `id` int(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `publishyr` date NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `descript` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal`
--

INSERT INTO `journal` (`id`, `isbn`, `title`, `authors`, `publisher`, `publishyr`, `category_id`, `descript`, `section`) VALUES
(1, '9781138184145', 'asdasdas', 'asdasd', 'asdasd', '2021-04-19', 'A-General Works', 'asdasdasd', 'Circulation Section');

-- --------------------------------------------------------

--
-- Table structure for table `journal_inv`
--

CREATE TABLE `journal_inv` (
  `id` int(11) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `typ` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_inv`
--

INSERT INTO `journal_inv` (`id`, `isbn`, `stats`, `typ`, `quantity`) VALUES
(1, '9781138184145', 'Available', 'Purchased', '1');

-- --------------------------------------------------------

--
-- Table structure for table `magazine`
--

CREATE TABLE `magazine` (
  `id` int(11) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `authors` varchar(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `publishyr` varchar(100) NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `descript` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `magazine`
--

INSERT INTO `magazine` (`id`, `isbn`, `title`, `authors`, `publisher`, `publishyr`, `category_id`, `section`, `descript`) VALUES
(3, '9781138184145', 'bdfdfgdfg', 'asdasd', 'London Routledge, Taylor & Francis Group [2018]', '2021-04-28', 'A-General Works', 'Circulation Section', 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `magazine_inv`
--

CREATE TABLE `magazine_inv` (
  `id` int(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `typ` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `magazine_inv`
--

INSERT INTO `magazine_inv` (`id`, `isbn`, `stats`, `typ`, `quantity`) VALUES
(1, '9781138184145', 'Available', 'Purchased', '1'),
(2, '9781138184145', 'Available', 'Purchased', '1'),
(3, '9781138184145', 'Available', 'Donated', '1');

-- --------------------------------------------------------

--
-- Table structure for table `obsolete`
--

CREATE TABLE `obsolete` (
  `id` varchar(100) NOT NULL,
  `student_id` varchar(100) NOT NULL,
  `book_id` varchar(100) NOT NULL,
  `date_obsolete` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obsolete`
--

INSERT INTO `obsolete` (`id`, `student_id`, `book_id`, `date_obsolete`) VALUES
('', '1', '13', '2021-02-19'),
('', '1', '2', '2021-02-19'),
('', '1', '2', '2021-02-19'),
('', '1', '13', '2021-02-19'),
('', '1', '13', '2021-03-07'),
('', '1', '13', '2021-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `penalty`
--

CREATE TABLE `penalty` (
  `penalty_id` int(100) NOT NULL,
  `penalty_amount` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penalty`
--

INSERT INTO `penalty` (`penalty_id`, `penalty_amount`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `photographs`
--

CREATE TABLE `photographs` (
  `id` int(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `authors` int(100) NOT NULL,
  `publisher` varchar(100) NOT NULL,
  `publishyr` date NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `section` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `descript` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photographs`
--

INSERT INTO `photographs` (`id`, `isbn`, `title`, `authors`, `publisher`, `publishyr`, `category_id`, `section`, `photo`, `descript`) VALUES
(3, '9781138184145', 'asdasd', 0, 'London Routledge, Taylor & Francis Group [2018]', '2021-04-21', 'A-General Works', 'Circulation Section', '', 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `photographs_inv`
--

CREATE TABLE `photographs_inv` (
  `id` int(100) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `typ` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `photographs_inv`
--

INSERT INTO `photographs_inv` (`id`, `isbn`, `stats`, `typ`, `quantity`) VALUES
(3, '9781138184145', 'Available', 'Purchased', '1');

-- --------------------------------------------------------

--
-- Table structure for table `returned_books`
--

CREATE TABLE `returned_books` (
  `report_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `detail_action` varchar(100) NOT NULL,
  `date_transaction` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `returned_books`
--

INSERT INTO `returned_books` (`report_id`, `book_id`, `student_id`, `admin_name`, `detail_action`, `date_transaction`) VALUES
(1, 20, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-10 04:02:45'),
(2, 20, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-10 04:04:11'),
(3, 20, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-12 17:22:16'),
(4, 32, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 14:57:55'),
(5, 33, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 15:14:00'),
(6, 34, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 15:16:39'),
(7, 35, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 15:21:51'),
(8, 37, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 15:39:31'),
(9, 37, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 15:51:10'),
(10, 37, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-24 15:52:03'),
(11, 41, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 12:47:20'),
(12, 43, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:30:27'),
(13, 43, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:34:17'),
(14, 42, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:34:19'),
(15, 41, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:34:20'),
(16, 41, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:36:22'),
(17, 41, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:40:45'),
(18, 41, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 13:42:51'),
(19, 43, 0, 'Artjim A Villapana', 'Returned Book', '2021-04-25 17:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `date_return` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `returns`
--

INSERT INTO `returns` (`id`, `student_id`, `book_id`, `date_return`) VALUES
(5, 1, 2, '2021-02-06'),
(6, 1, 13, '2021-02-06'),
(7, 1, 13, '2021-03-07');

-- --------------------------------------------------------

--
-- Table structure for table `return_book`
--

CREATE TABLE `return_book` (
  `return_book_id` int(100) NOT NULL,
  `student_id` int(100) NOT NULL,
  `book_id` int(100) NOT NULL,
  `date_borrowed` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `date_returned` datetime NOT NULL,
  `book_penalty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `return_book`
--

INSERT INTO `return_book` (`return_book_id`, `student_id`, `book_id`, `date_borrowed`, `due_date`, `date_returned`, `book_penalty`) VALUES
(1, 201710162, 20, '2021-04-04 00:44:24', '2021-04-07 00:44:24', '2021-04-06 19:11:36', 'No Penalty'),
(2, 201710162, 20, '2021-04-04 00:44:24', '2021-04-07 00:44:24', '2021-04-06 19:11:36', 'No Penalty'),
(3, 201710162, 20, '2021-04-04 00:44:24', '2021-04-07 00:44:24', '2021-04-06 19:11:36', 'No Penalty'),
(4, 20161234, 20, '2021-04-06 20:21:45', '2021-04-06 20:21:45', '2021-04-06 20:26:06', '0'),
(5, 20161234, 20, '2021-04-06 20:21:45', '2021-04-06 20:21:45', '2021-04-06 20:26:15', '0'),
(6, 20161234, 20, '2021-04-06 20:27:02', '2021-04-06 20:27:02', '2021-04-06 20:28:41', '0'),
(7, 20161234, 20, '2021-04-06 20:27:02', '2021-04-06 20:27:02', '2021-04-06 20:28:45', '0'),
(8, 20161234, 20, '2021-04-06 20:32:05', '2021-04-06 20:32:05', '2021-04-06 20:35:15', '0'),
(9, 20161234, 20, '2021-04-06 20:32:05', '2021-04-06 20:32:05', '2021-04-06 20:35:15', '0'),
(10, 20161234, 20, '2021-04-06 20:41:52', '2021-04-06 20:41:52', '2021-04-06 21:38:44', '0'),
(11, 20161234, 20, '2021-04-06 20:41:52', '2021-04-06 20:41:52', '2021-04-06 21:39:06', '0'),
(12, 20161234, 20, '2021-04-06 21:41:06', '2021-04-06 21:41:06', '2021-04-06 21:44:14', '0'),
(13, 20161234, 20, '2021-04-06 21:41:06', '2021-04-06 21:41:06', '2021-04-06 21:44:18', '0'),
(14, 201710162, 20, '2021-04-09 22:39:42', '2021-04-09 22:39:42', '2021-04-09 22:40:17', '0'),
(15, 201710162, 20, '2021-04-09 22:39:42', '2021-04-09 22:39:42', '2021-04-09 22:40:38', '0'),
(16, 20161234, 20, '2021-04-09 22:42:21', '2021-04-09 22:42:21', '2021-04-09 22:43:37', '0'),
(17, 20161234, 20, '2021-04-09 22:42:21', '2021-04-09 22:42:21', '2021-04-09 22:43:37', '0'),
(18, 20161234, 20, '2021-04-09 22:42:21', '2021-04-09 22:42:21', '2021-04-09 22:43:37', '0'),
(19, 201710162, 20, '2021-04-09 22:47:40', '2021-04-09 22:47:40', '2021-04-09 22:47:49', '0'),
(20, 201710162, 20, '2021-04-09 22:47:40', '2021-04-09 22:47:40', '2021-04-09 22:47:49', '0'),
(21, 201710162, 20, '2021-04-09 22:47:40', '2021-04-09 22:47:40', '2021-04-09 22:47:49', '0'),
(22, 201710162, 20, '2021-04-09 22:47:40', '2021-04-09 22:47:40', '2021-04-09 22:47:49', '0'),
(23, 201710162, 20, '2021-04-10 00:12:46', '2021-04-10 00:12:46', '2021-04-10 00:37:01', '0'),
(24, 201710162, 20, '2021-04-10 00:12:46', '2021-04-10 00:12:46', '2021-04-10 00:37:01', '0'),
(25, 201710162, 20, '2021-04-10 00:12:46', '2021-04-10 00:12:46', '2021-04-10 00:37:01', '0'),
(26, 201710162, 20, '2021-04-10 00:12:46', '2021-04-10 00:12:46', '2021-04-10 00:37:01', '0'),
(27, 201710162, 20, '2021-04-10 01:27:31', '2021-04-10 01:27:31', '2021-04-10 01:31:14', '0'),
(28, 201710162, 20, '2021-04-10 01:27:31', '2021-04-10 01:27:31', '2021-04-10 01:31:15', '0'),
(29, 201710162, 20, '2021-04-10 01:39:07', '2021-04-10 01:39:07', '2021-04-10 01:40:22', '0'),
(30, 201710162, 20, '2021-04-10 01:39:07', '2021-04-10 01:39:07', '2021-04-10 01:40:24', '0'),
(31, 201710162, 20, '2021-04-10 03:38:17', '2021-04-10 03:38:17', '2021-04-10 03:50:29', '0'),
(32, 201710162, 20, '2021-04-10 04:03:50', '2021-04-10 04:03:50', '2021-04-10 04:04:08', '0'),
(33, 20161234, 20, '2021-04-12 17:22:01', '2021-04-12 17:22:01', '2021-04-12 17:22:08', '0'),
(34, 201710162, 32, '2021-04-24 14:56:01', '2021-04-24 14:56:01', '2021-04-24 14:56:07', '0'),
(35, 201710162, 33, '2021-04-24 15:13:45', '2021-04-24 15:13:45', '2021-04-24 15:13:55', '0'),
(36, 201710162, 34, '2021-04-24 15:15:46', '2021-04-24 15:15:46', '2021-04-24 15:16:37', '0'),
(37, 201710162, 35, '2021-04-24 15:20:58', '2021-04-24 15:20:58', '2021-04-24 15:21:49', '0'),
(38, 201710162, 37, '2021-04-24 15:38:19', '2021-04-24 15:38:19', '2021-04-24 15:39:30', '0'),
(39, 201710162, 37, '2021-04-24 15:44:37', '2021-04-24 15:44:37', '2021-04-24 15:45:32', '0'),
(40, 201710162, 37, '2021-04-24 15:51:28', '2021-04-24 15:51:28', '2021-04-24 15:52:02', '0'),
(41, 201710162, 41, '2021-04-25 12:46:27', '2021-04-25 12:46:27', '2021-04-25 12:47:18', '0'),
(42, 201710162, 43, '2021-04-25 13:29:10', '2021-04-25 13:29:10', '2021-04-25 13:30:25', '0'),
(43, 201710162, 43, '2021-04-25 13:31:59', '2021-04-28 13:31:59', '2021-04-25 13:34:16', 'No Penalty'),
(44, 201710162, 42, '2021-04-25 13:29:06', '2021-04-25 13:29:06', '2021-04-25 13:34:18', '0'),
(45, 201710162, 41, '2021-04-25 13:28:37', '2021-04-25 13:28:37', '2021-04-25 13:34:19', '0'),
(46, 201710162, 41, '2021-04-25 13:36:08', '2021-04-25 13:36:08', '2021-04-25 13:36:18', '0'),
(47, 201710162, 41, '2021-04-25 13:36:41', '2021-04-25 13:36:41', '2021-04-25 13:40:34', '0'),
(48, 201710162, 41, '2021-04-25 13:40:47', '2021-04-27 13:40:47', '2021-04-25 13:42:49', 'No Penalty'),
(49, 201710162, 43, '2021-04-25 17:56:36', '2021-04-27 17:56:36', '2021-04-25 17:57:05', 'No Penalty');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(255) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`) VALUES
(1, 'Circulation Section'),
(2, 'Filipiniana Section');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `course_id` int(11) NOT NULL,
  `stats` varchar(100) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `firstname`, `middlename`, `lastname`, `gender`, `photo`, `course_id`, `stats`, `created_on`) VALUES
(1, '201710162', 'wowo', 'A', 'sanity', 'Male', '162590228_4466629550020818_1076567791791764971_n.jpg', 0, 'Active', '0000-00-00'),
(5, 'MHX312054986', 'Tab', 'T', 'Ander', '', '', 1, 'Archieved', '2021-04-06'),
(6, '123456', 'Tab', 'g', 'Ander', 'Male', '', 0, 'Archieved', '2021-04-06'),
(7, '20161234', 'Audric', '', 'Sugatan', 'Male', '', 0, 'Archieved', '2021-04-06'),
(8, '20161234', 'Tab', '', 'Ander', 'Male', '', 0, 'Archieved', '2021-04-06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowed_days`
--
ALTER TABLE `allowed_days`
  ADD PRIMARY KEY (`allowed_days_id`);

--
-- Indexes for table `archbooks`
--
ALTER TABLE `archbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audiovisual`
--
ALTER TABLE `audiovisual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audiovisual_inv`
--
ALTER TABLE `audiovisual_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookinformation`
--
ALTER TABLE `bookinformation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `borrowed_report`
--
ALTER TABLE `borrowed_report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `borrow_book`
--
ALTER TABLE `borrow_book`
  ADD PRIMARY KEY (`borrow_book_id`);

--
-- Indexes for table `borrow_report`
--
ALTER TABLE `borrow_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_inv`
--
ALTER TABLE `journal_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magazine_inv`
--
ALTER TABLE `magazine_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penalty`
--
ALTER TABLE `penalty`
  ADD PRIMARY KEY (`penalty_id`);

--
-- Indexes for table `photographs`
--
ALTER TABLE `photographs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photographs_inv`
--
ALTER TABLE `photographs_inv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `returned_books`
--
ALTER TABLE `returned_books`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_book`
--
ALTER TABLE `return_book`
  ADD PRIMARY KEY (`return_book_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `allowed_days`
--
ALTER TABLE `allowed_days`
  MODIFY `allowed_days_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `archbooks`
--
ALTER TABLE `archbooks`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audiovisual`
--
ALTER TABLE `audiovisual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `audiovisual_inv`
--
ALTER TABLE `audiovisual_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookinformation`
--
ALTER TABLE `bookinformation`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `borrowed_report`
--
ALTER TABLE `borrowed_report`
  MODIFY `report_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `borrow_book`
--
ALTER TABLE `borrow_book`
  MODIFY `borrow_book_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `borrow_report`
--
ALTER TABLE `borrow_report`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `journal_inv`
--
ALTER TABLE `journal_inv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `magazine`
--
ALTER TABLE `magazine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `magazine_inv`
--
ALTER TABLE `magazine_inv`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penalty`
--
ALTER TABLE `penalty`
  MODIFY `penalty_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `photographs`
--
ALTER TABLE `photographs`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photographs_inv`
--
ALTER TABLE `photographs_inv`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `returned_books`
--
ALTER TABLE `returned_books`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `return_book`
--
ALTER TABLE `return_book`
  MODIFY `return_book_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
