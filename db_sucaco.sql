-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 29 Apr 2019 pada 04.57
-- Versi Server: 5.5.60-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sucaco`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cs`
--

CREATE TABLE IF NOT EXISTS `cs` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cs`
--

INSERT INTO `cs` (`id`, `name`, `nick_name`, `email`, `pass`, `status`, `date_add`, `date_modify`, `user_id`) VALUES
(1, 'rizal', 'jono', 'admin@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 1, '2019-04-15 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_category`
--

CREATE TABLE IF NOT EXISTS `m_category` (
  `category_id` int(3) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_image` text NOT NULL,
  `category_file` varchar(50) NOT NULL,
  `category_color` varchar(20) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_category`
--

INSERT INTO `m_category` (`category_id`, `category_name`, `category_image`, `category_file`, `category_color`, `date_add`, `date_modify`, `user_id`) VALUES
(1, 'building wire', 'building wire.png', 'building wire.pdf', '000', '2019-03-13 00:00:00', '2019-03-26 15:33:28', 50),
(2, 'voltage power', 'voltage power.png', 'voltage power.pdf', 'f3f3f3', '2019-03-13 00:13:00', '2019-03-26 15:33:13', 50),
(12, 'Fiber Optic', 'Fiber Optic.png', 'Fiber Optic.pdf', 'ff0000', '2019-03-22 11:08:18', '2019-03-22 11:08:18', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_event`
--

CREATE TABLE IF NOT EXISTS `m_event` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_image` text NOT NULL,
  `event_desc` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_event`
--

INSERT INTO `m_event` (`event_id`, `event_title`, `event_image`, `event_desc`, `date_add`, `date_modify`, `user_id`) VALUES
(25, 'sampah', '150419093225.png', 'sertifikasi guru adalah salah satu kegiatan yang kami lakukan untuk menunjang guru guru yang lebih kompetitif dibidangnya', '2019-04-15 16:32:25', '2019-04-15 16:32:25', 54);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_product`
--

CREATE TABLE IF NOT EXISTS `m_product` (
  `product_id` int(4) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` text NOT NULL,
  `id` int(4) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `category_id` int(3) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_product`
--

INSERT INTO `m_product` (`product_id`, `product_name`, `product_description`, `product_image`, `id`, `date_add`, `date_modify`, `category_id`, `user_id`) VALUES
(1, 'Cu/PVC 450/750 V (NYA) SNI 04.6629.3 Rp/m', 'Spesification : SPLN 42-1/SH 0208\r\nRated Voltage : 450/750 Volt', '090419105614.png', NULL, '2019-03-13 00:32:00', '2019-04-09 17:56:14', 12, 54),
(2, 'Cu/PVC/PVC 300/500 V (NYM) SNI 04.6629.4 Rp/m', 'Spesification : SPLN 42-2\r\nRated Voltage : 300/500 Volt', 'ym.png', NULL, '2019-03-13 00:35:00', '2019-03-13 00:35:00', 1, 50),
(3, 'Cu/PVC/PVC/PVC 0.6/1 KV (NYY) SNI IEC 60502-1 Rp/m', 'Application : Bare copper conductor half hard or hard, used for grounding conductor', '090419105104.png', NULL, '2019-03-13 00:15:00', '2019-04-26 13:37:15', 2, 54),
(4, 'Cu/PVC/SWA/PVC 0.6/1 KV (NYRGbY) SNI IEC 60502-1 Rp/m', 'All aluminium conductor, used for overhead transmission & distribution\r\n', '090419105239.png', NULL, '2019-03-13 00:16:00', '2019-04-26 11:35:51', 1, 54);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_product_detail`
--

CREATE TABLE IF NOT EXISTS `m_product_detail` (
  `detail_product_id` int(8) NOT NULL,
  `size` varchar(30) NOT NULL,
  `price` int(10) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `product_id` int(4) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_product_detail`
--

INSERT INTO `m_product_detail` (`detail_product_id`, `size`, `price`, `date_add`, `date_modify`, `product_id`, `user_id`) VALUES
(39, '2002', 3013, '2019-04-23 17:08:22', '2019-04-23 17:32:36', 4, 54),
(2, '2,5 mm', 5100, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 1, 1),
(3, '4 mm', 8000, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 1, 1),
(4, '6 mm', 11800, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 1, 1),
(5, '10 mm', 19600, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 1, 1),
(6, '2 x 1,5 mm', 19800, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 2, 1),
(7, '2 x 2.5 mm', 14000, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 2, 1),
(8, '2 x 4 mm', 21000, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 2, 1),
(9, '2 x 6 mm', 28000, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 2, 1),
(10, '2 10', 46200, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 2, 1),
(11, '2 x 1,5 mm', 11200, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 3, 1),
(12, '2 x 2,5 mm', 15400, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 3, 1),
(13, '2 x 4 mm', 23800, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 3, 1),
(14, '2 x 6 mm', 32200, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 3, 1),
(15, '2 x 10 mm', 50400, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 3, 1),
(16, '2 x 1,5 mm', 25900, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 4, 1),
(17, '2 x 2,5 mm', 33100, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 4, 1),
(18, '2 x 4 mm', 43100, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 4, 1),
(19, '2 x 6 mm', 53200, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 4, 1),
(20, '2 x 10 mm', 74700, '2019-03-19 00:00:00', '2019-03-19 00:00:00', 4, 1),
(21, '23', 3000, '2019-03-29 13:51:27', '2019-03-29 13:51:27', 1, 1),
(36, '12323', 232323, '2019-04-09 19:06:50', '2019-04-10 13:52:52', 4, 54);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_profile`
--

CREATE TABLE IF NOT EXISTS `m_profile` (
  `profile_id` int(1) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `video` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_profile`
--

INSERT INTO `m_profile` (`profile_id`, `logo`, `video`, `name`, `desc`, `address`, `phone`, `fax`, `email`, `date_add`, `date_modify`, `user_id`) VALUES
(1, 'logo.png', 'video.mp4', 'PT Sucaco Tbk Supreme Cable Manufacturing & Commerce', 'Since 1972, PT SUCACO Tbk has supported and contributed to the infrastructure and industrial development in Indonesia by supplying high quality and reliable power cables, telecommunication cables, and enameled wires.\nThe company made its debut on the Jakarta Stock Exchange in 1982, and has shareholdings in a number of public and non public companies including PT Tembaga Mulia Semanan, PT Setia Pratama Lestari Pelletizing, PT Supreme Decoluxe.', 'Jl Kebon Sirih No 71, Jakarta, 10340 Indonesia', '(+62 21) 5402066', '(+62 21) 6195297', 'marketing@sucaco.com', '2019-04-26 00:00:00', '2019-04-26 00:00:00', 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_token`
--

CREATE TABLE IF NOT EXISTS `m_token` (
  `token_id` int(20) NOT NULL,
  `token` text NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_token`
--

INSERT INTO `m_token` (`token_id`, `token`, `date_add`) VALUES
(7, 'ffISqacaC1g:APA91bEhgoDFE1ezW3jR-cqWx8Bxuaz6E6wBoJ58FPbpd9Y846qW2TkcwR1u8K9SD1vregf7JkPLz9HHmWL86QS-TZLzd5zubzjQeIRfHHsZ4wVR8WTZe3qlJWIeIO1VryOKWHDCN6QA', '2019-04-16 14:06:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notify`
--

CREATE TABLE IF NOT EXISTS `notify` (
  `notify_id` int(4) NOT NULL,
  `info` text NOT NULL,
  `push` int(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notify`
--

INSERT INTO `notify` (`notify_id`, `info`, `push`, `date_add`, `date_modify`, `user_id`) VALUES
(17, 'notification 2', 1, '2019-04-01 10:59:51', '2019-04-16 15:37:06', 54),
(18, 'notification 3', 1, '2019-04-01 11:00:00', '2019-04-16 16:35:14', 54),
(49, '<p><span style="color:#2c3e50">ðŸ‘¶aku anak sehat tubuhku kuat&nbsp;ðŸ˜¬</span></p>\n', 0, '2019-04-22 16:43:33', '2019-04-23 09:48:07', 54);

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(10) NOT NULL,
  `room_id` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telp` varchar(16) NOT NULL,
  `status_room` enum('opened','taked','deleted') NOT NULL DEFAULT 'opened',
  `product_id` int(4) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `slider_id` int(3) NOT NULL,
  `slider_image` varchar(100) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `slider`
--

INSERT INTO `slider` (`slider_id`, `slider_image`, `date_add`, `date_modify`, `user_id`) VALUES
(1, '190327074402.jpg', '2019-03-26 00:00:00', '2019-03-27 14:44:02', 1),
(2, '190327074415.jpg', '2019-03-26 00:00:00', '2019-03-27 14:44:15', 1),
(5, '190327074326.jpg', '2019-03-27 13:44:27', '2019-03-27 14:43:26', 1),
(16, '190409081618.jpg', '2019-04-09 15:16:18', '2019-04-09 15:16:18', 54);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` enum('admin IT','admin sales','regular user','premium user','internal','direksi') NOT NULL DEFAULT 'admin IT',
  `status` int(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `level`, `status`, `date_add`, `date_modify`) VALUES
(50, 'userdemo@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 'admin IT', 1, '2019-04-02 00:00:00', '2019-04-02 10:12:10'),
(54, 'fahmifaturohman1995@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 'admin IT', 1, '2019-04-04 09:25:22', '2019-04-09 13:37:54'),
(61, 'xiaomi@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 'regular user', 1, '2019-04-23 09:52:12', '2019-04-23 09:52:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs`
--
ALTER TABLE `cs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_category`
--
ALTER TABLE `m_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `m_event`
--
ALTER TABLE `m_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `m_product`
--
ALTER TABLE `m_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `m_product_detail`
--
ALTER TABLE `m_product_detail`
  ADD PRIMARY KEY (`detail_product_id`);

--
-- Indexes for table `m_profile`
--
ALTER TABLE `m_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `m_token`
--
ALTER TABLE `m_token`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`notify_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs`
--
ALTER TABLE `cs`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_category`
--
ALTER TABLE `m_category`
  MODIFY `category_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `m_event`
--
ALTER TABLE `m_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `m_product`
--
ALTER TABLE `m_product`
  MODIFY `product_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `m_product_detail`
--
ALTER TABLE `m_product_detail`
  MODIFY `detail_product_id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `m_profile`
--
ALTER TABLE `m_profile`
  MODIFY `profile_id` int(1) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_token`
--
ALTER TABLE `m_token`
  MODIFY `token_id` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `notify`
--
ALTER TABLE `notify`
  MODIFY `notify_id` int(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
