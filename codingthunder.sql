-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2021 at 12:03 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `phone_num` varchar(11) NOT NULL,
  `sms` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `sms`, `date`) VALUES
(1, 'subham', 'subhams5', '45623', '', '2021-01-06 23:43:16'),
(2, 'subham sarkar', 'subhamsarkar398@gmail.com', '09113819903', '', '2021-01-07 15:09:39'),
(3, 'subham sarkar', 'subhamsarkar398@gmail.com', '09113819903', 'higdytq', '2021-01-07 15:11:08'),
(4, 'subham sarkar', 'subhamsarkar398@gmail.com', '09113819903', 'hi subham sarkar', '2021-01-07 17:36:47'),
(5, 'subham sarkar', 'subhamsarkar398@gmail.com', '09113819903', 'hi subham sarkar', '2021-01-07 17:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'Miss Thrifty', 'Miss Thrifty', 'One of the more popular frugal blogs in the UK, Miss Thrifty is targeting young mums with her money saving, frugal tips and articles. And rightly so! The market is massive and she’s meeting a need for this type of information. Young mums aren’t exactly rolling in cash. They may have had to give up work and are now relying on just one wage coming in, so the need to be more frugal with everyday living is a must.', '2021-01-07 20:27:30', '2.jpg'),
(2, 'Skint Dad', 'Skint Dad', 'So when I talk about coming at a niche from a different angle, this example is exactly what I mean. Skint Dad is a site that helps young / new dads save money and be more frugal in their day to day living. There’s also a section on their that shows guys how to make a little more cash on top of their monthly day job wage, which is vital in some cases just to keep your head above water.  A lot of new dads have the added stress of not having their wives’ or girlfriends’ wage coming in each month, due to the temporary career change in being a full time mum of a baby. So having some content around how they can make a few extra “Ps” in their wallet each month, can ease the burden somewhat.', '2021-01-07 20:27:30', '3.jpg'),
(3, 'Solopreneur Hour', 'SolopreneurHour', 'A very well designed and slick blog that’s all about being your own boss and creating your own wealth. It’s a blog with a very active podcast feed. Their podcasts are insanely popular on itunes, and no doubt they make a fair bit of money from selling ad space on those podcasts. Podcasts is something to think about when creating your blog as it could be a great monetization tool.\r\n\r\n', '2021-01-07 22:03:17', '4.jpg'),
(4, 'Breaking into Startups', 'BreakingintoStartups', 'A very inspiring blog that contains motivational stories about startups and the people who work in them and create them. If you need a pick me up after a bad day at the office or think that you can’t become that person who goes it along and starts up something awesome, then why not have a read. You’ll soon hear about people who literally only had the shirt on their backs and who rose up to be a success in business and in life.\r\n\r\n', '2021-01-07 22:03:17', '5.jpg'),
(5, 'Know Techie', 'Knowtechie', 'I’ve been following this site since it started and has seen its progression from just one guy writing about stuff he loves, to a site that get’s decent traffic and has a team of writers.\r\n\r\nKnowtechie is a great example of a site that started out as a hobby but has fast become a business. I like the angle they have as well. “Tech News For The Non Techie”. KnowTechie is a blog for people who love tech, but live outside the bubble. This is so refreshing, because so many tech blogs out there are a bit too technical and full to the brim of jargon. It’s nice to see a tech blog that has lowered the entry level to tech news.\r\n\r\n', '2021-01-07 22:05:06', '6.jpg'),
(6, 'Side Hustle Nation', 'Side Hustle Nation', 'Side Hustle is an online community of entrepreneurs who’s goal is to gain financial freedom through creating businesses that can help them achieve that. There’s a collection of highly actionable blog posts on how to make additional income on top of your day job wage. They make good use of the podcast medium of content marketing by creating various podcasts with experts talking about a whole range of topics around entrepreneurship, making money online and creating wealth.', '2021-01-07 22:05:06', '7.jpg'),
(7, 'Web Development ', 'web development', 'Web development is the work involved in developing a Web site for the Internet (World Wide Web) or an intranet (a private network).[1] Web development can range from developing a simple single static page of plain text to complex Web-based Internet applications (Web apps), electronic businesses, and social network services. A more comprehensive list of tasks to which Web development commonly refers, may include Web engineering, Web design, Web content development, client liaison, client-side/server-side scripting, Web server and network security configuration, and e-commerce development.', '2021-01-09 23:29:54', '5.jpg'),
(8, ' Data science', ' Data science', ' Data science is an inter-disciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from many structural and unstructured data. Data science is related to data mining, machine learning and big data', '2021-01-10 22:10:43', '8.jpg'),
(9, ' Data science', ' Data science', ' Data science is an inter-disciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from many structural and unstructured data. Data science is related to data mining, machine learning and big data', '2021-01-10 22:11:42', '8.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
