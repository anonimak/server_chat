-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: 21 Mei 2019 pada 15.19
-- Versi Server: 5.7.26-0ubuntu0.18.04.1
-- PHP Version: 7.2.17-0ubuntu0.18.04.1

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

CREATE TABLE `cs` (
  `id` int(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `pass` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cs`
--

INSERT INTO `cs` (`id`, `name`, `nick_name`, `phone`, `email`, `pass`, `status`, `date_add`, `date_modify`, `user_id`) VALUES
(1, 'Qweee', 'Qweee', '1234567893', 'userdemo@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 0, '2019-05-02 06:34:02', '2019-05-02 06:34:02', 1),
(2, 'joni', 'iskandar', '081113131414', 'joni@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 1, '2019-05-02 07:10:23', '2019-05-02 07:10:23', 1),
(3, 'jonatan', 'teofilus', '087899105442', 'jonatan@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 0, '2019-05-02 07:11:04', '2019-05-02 07:11:40', 1),
(5, 'tibo', 'aritibo', '087789867789', 'tibo@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 0, '2019-05-21 10:41:19', '2019-05-21 10:41:39', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_category`
--

CREATE TABLE `m_category` (
  `category_id` int(3) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_image` text NOT NULL,
  `category_file` varchar(50) NOT NULL,
  `category_color` varchar(20) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_category`
--

INSERT INTO `m_category` (`category_id`, `category_name`, `category_image`, `category_file`, `category_color`, `date_add`, `date_modify`, `user_id`) VALUES
(1, 'Example', 'Qwerty.png', 'Qwerty.pdf', '000000', '2019-05-02 06:32:58', '2019-05-21 10:47:01', 1),
(2, 'Low Voltage', 'Low Voltage.png', 'Low Voltage.pdf', '1296FF', '2019-05-02 07:35:59', '2019-05-02 07:39:22', 1),
(3, 'High Voltage Cable', 'High Voltage Cable.png', 'High Voltage Cable.pdf', '690A97', '2019-05-02 08:06:35', '2019-05-02 08:06:35', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_event`
--

CREATE TABLE `m_event` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(100) NOT NULL,
  `event_image` text NOT NULL,
  `event_desc` text NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_event`
--

INSERT INTO `m_event` (`event_id`, `event_title`, `event_image`, `event_desc`, `date_add`, `date_modify`, `user_id`) VALUES
(27, 'MAY DAY', '020519022709.jpg', 'Selamat hari buruh kakak, ayo terus  berkarya untuk memajukan bangsa', '2019-05-02 07:21:31', '2019-05-02 07:28:31', 1),
(28, 'MAYDAY Event', '020519023414.png', 'Ayo ikut orasi yang dilaksanakan pada 1 Mei 2019 di pelataran Monas', '2019-05-02 07:30:24', '2019-05-02 07:34:50', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_product`
--

CREATE TABLE `m_product` (
  `product_id` int(4) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text NOT NULL,
  `id` int(4) DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `category_id` int(3) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_product`
--

INSERT INTO `m_product` (`product_id`, `product_name`, `product_description`, `id`, `date_add`, `date_modify`, `category_id`, `user_id`) VALUES
(2, 'N2XCBr/NA2XCBr2Y 87/150(170) kV', 'Copper/ALmunium conductor, XLPE insulated,  Copper wire screned, Water sealing, Anti terminate brass tape and PE sheated cable', 2, '2019-05-02 08:13:15', '2019-05-02 08:15:55', 3, 1),
(3, 'N2XCK2Y/NA2XCK2Y 87/150(170) kV IEC 60840', 'Copper/Alumunium conductor, XPLE insulated, Copper wire screened, Water sealing, Lead sheathed, PE sheathed cable', 2, '2019-05-02 08:18:24', '2019-05-02 08:18:24', 3, 1),
(6, 'product 1', 'ini adalah contoh produk 1', 5, '2019-05-21 10:42:24', '2019-05-21 10:42:24', 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_product_detail`
--

CREATE TABLE `m_product_detail` (
  `detail_product_id` int(8) NOT NULL,
  `size` varchar(30) NOT NULL,
  `price` int(10) NOT NULL,
  `desc` text,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `product_id` int(4) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_product_detail`
--

INSERT INTO `m_product_detail` (`detail_product_id`, `size`, `price`, `desc`, `date_add`, `date_modify`, `product_id`, `user_id`) VALUES
(2, '1 mm', 10, 'ini adalah detail product example', '2019-05-02 08:08:43', '2019-05-21 13:14:45', 6, 1),
(3, '300 mm', 15560, 'Conductor diameter : 20,90\nNominal conductor shielding thickness : 1,2\nNominal insulation thickness : 19,0\nInsulation diameter(approx) : 64\nNominal lead sheath thickness : 2,4\nNominal outer sheath thickness : 4,5\noverall cable diameter (approx ) : 89', '2019-05-02 08:24:28', '2019-05-02 08:26:38', 2, 1),
(4, '4000', 11560, 'Conductor diameter : 23,70\nNominal conductor shielding thickness : 1,2\nNominal insulation thickness : 19,0\nInsulation diameter(approx) : 67\nNominal lead sheath thickness : 2,4\nNominal outer sheath thickness : 4,5\noverall cable diameter (approx ) : 92', '2019-05-02 08:31:41', '2019-05-02 08:31:41', 3, 1),
(6, '12 mm', 3000, 'ini adalah contoh deskripsi dari sebuah produk', '2019-05-02 10:45:15', '2019-05-21 11:16:23', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_product_image`
--

CREATE TABLE `m_product_image` (
  `image_id` int(8) NOT NULL,
  `product_image` text NOT NULL,
  `product_id` int(4) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_product_image`
--

INSERT INTO `m_product_image` (`image_id`, `product_image`, `product_id`, `date_add`, `date_modify`) VALUES
(9, '080519084632-2.png', 2, '2019-05-08 15:46:32', '2019-05-08 15:46:32'),
(7, '080519084611-2.jpg', 2, '2019-05-08 15:46:11', '2019-05-08 15:46:11'),
(17, '210519104405-6.png', 6, '2019-05-21 10:44:05', '2019-05-21 10:44:05'),
(18, '210519104423-6.png', 6, '2019-05-21 10:44:23', '2019-05-21 10:44:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_profile`
--

CREATE TABLE `m_profile` (
  `profile_id` int(1) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `video` varchar(50) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_profile`
--

INSERT INTO `m_profile` (`profile_id`, `logo`, `video`, `name`, `desc`, `address`, `phone`, `fax`, `email`, `date_add`, `date_modify`, `user_id`) VALUES
(1, 'logo-210519012925.png', 'video-060519070854.gif', 'PT Sucaco Tbk Supreme Cable Manufacturing & Commerce', 'Since 1972, PT SUCACO Tbk has supported and contributed to the infrastructure and industrial development in Indonesia by supplying high quality and reliable power cables, telecommunication cables, and enameled wires.\r\nThe company made its debut on the Jakarta Stock Exchange in 1982, and has shareholdings in a number of public and non public companies including PT Tembaga Mulia Semanan, PT Setia Pratama Lestari Pelletizing, PT Supreme Decoluxe', 'Jl Kebon Sirih No 71, Jakarta, 10340 Indonesia123', '(+62 21) 5402066', '(+62 21) 6195297', 'marketing@sucaco.com', '2019-04-26 00:00:00', '2019-05-21 13:29:25', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_token`
--

CREATE TABLE `m_token` (
  `token_id` int(20) NOT NULL,
  `token` text NOT NULL,
  `date_add` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_token`
--

INSERT INTO `m_token` (`token_id`, `token`, `date_add`) VALUES
(3, 'dzjCuk_WO1k:APA91bHXyuYUev38zfQiDv_Rs9bpisCD9tcu2ML6KB4C8PMwdhympUkMamvUYP9Xd0JVgBZVh9sjDYrrhVkV1E4tKKOigQ39ZbWC-LkIU0PcnRt-NYJutgAoNtqg5rS9afSpFqyRQUTQ', '2019-04-15 11:20:45'),
(4, 'cVwlBEd3h6Y:APA91bHuM7VX8H_WHhBGOPUGra-WysZFXDWH6okzePFezs147QF5KIxGJRNuZ4uwM5W6GhbTYKyN_TtKrzbRdz3-N0xNwzJLgNt6W1SE-l7uAzRnO2lOwgITXfq0BNLctQFbw418qf3p', '2019-04-15 11:25:46'),
(2, 'd0fxcdz4ayU:APA91bGZdQiVoyo6dt3OMq9ZFqbJjdIT7JLOQ9di3kzIeJNZjFx9VoGS4g1KU2OfHoHV8n1_ECT0xkcQXfI4g1QDiCW1VZkT5mus8f-9hbmWBJK3XIIV9zOWkONSBKGNFe7AYHeF-PLo', '2019-04-15 11:06:06'),
(5, 'e2zQO1TUDtU:APA91bFl_BnieVn9856hWXRWodlNPSLQpZqDCcAWnvYtccnwH6-hvM-_bF7Kxwb5XC2pEP0jJdCLTE4u4yLFN0ufgDO8EXv1-0EnPmeTgA_cJW0lZMfV5gzLJmcc2KX3jxLU4ubSn3Fj', '2019-04-16 08:29:48'),
(6, 'cWAezpjziC8:APA91bFwtlWWja47ql6pe2dWuHf-uugBlQJTrB-waYpgxPVyxOg_DjSupUY9WNykG9Mqb48t5POwqBsp35YiB15ZVO-HlBcx5gnfs4fpstSmN_-GnFZRUHJlJ5feH4btk7mw5A347qFm', '2019-04-16 08:31:52'),
(7, 'drnJH8wmfDo:APA91bEZZQtlJ6SYHSpRz7P1YVwrF8Hcw3lT2UiSImv6WbGuSIP-G1Ll9yrCR0JAd3VRb2v9EnXKYhwqBKI48EJfnEeD6eDhWaRcCiLRggpSsulFhuOF8uQ313RHji2wgDwvzHRzesTV', '2019-04-16 08:34:16'),
(8, 'dd9EkCu8pBE:APA91bFawxXe8WfIbjLCws6WpTrmc7lFJczoj1mIyhvg943vZgjIzr8U4qygOh2pnSAiStaP683WI0PO8BlS6EajkTLPJHZ_qqBqKkuFKojW2dvWBO0e9Kix8fVByJ6sFwdX9Sz0TTPr', '2019-04-16 08:37:05'),
(9, 'clwCAp9V-So:APA91bFHP8N1gnLL_PU0qf6CjykiPecw86U-OEuFzQ5oouo8G7EnwWeKk6_tHGtbOmWzkiedOjfX4Mc55gO8L3-AESPw3-Fo_nmL9lofev8CthybeFzkZ6s1fyqXx1zlziS8ZuV1w2Wf', '2019-04-16 08:51:22'),
(10, 'cADa-JzTy2E:APA91bEUuZCZPd7IxRwRfpVOpoHt9Hlm5JTQjqEGk6DOsmiygxIAS9pOMJilvAAStRs1HndY22UQMAmqVBgXeV5JOB_Bj3Lg_Y_2-OIEyA88bUasPexfUL_oux9QIF2GJeOHVNK1R8Tv', '2019-04-16 08:59:31'),
(11, 'dRVhI0nsQ7o:APA91bHQJF9Yq8-A1jFJt_gAHm5ShyIKTAVtz3fQOd1YxSrocAhAawXmBdFYFIJzs4tPaKkRAsxnDQ31Bmm96Fzk5npp_SfCaacZjZaQPqbDkOVDVEjgeAzgmvOwzJs7mEmqw9VL8yVg', '2019-04-16 10:49:22'),
(12, 'eZTfveRVbZs:APA91bGp1toQnAH7wvgbwBJgCWpnS7Ha3joqhq53w9I5UxZGHd8ENKi9k9UVuL102N78KgPfbsSRUodb_xConcQX4Opo-nY2wprWeVahwf7A6K5PyXhE8xHf6XwQRXjsoPxrZbxWkj5V', '2019-04-16 10:53:44'),
(13, 'c2proMq1CUg:APA91bGlL_KBxyEqFrG9IMkqscwFKi1PX3bogV1_Y6XoEUK8izEk3ZmaTRE0b01l2m2sBu2WZCLkHeirP0nHVaYjkrTZELgSqPAoiONdk2mpYxJ6QJbVwe5mh3Pcna-jbjk4q198C2hn', '2019-04-16 10:55:21'),
(14, 'eY54U9WULlo:APA91bEngO8KnAMp51gHlL5YjL9FgcIvBaLcqrCMiKMJypwBAg7L3_U3aRLz4NsOIUWjqPn9sEx2vTnGWlSOFJhM2Hp-aDbzbCIqLUt_fTtPncmFr55xS1X05uSJA1jGgXfczA810u5a', '2019-04-18 00:20:41'),
(15, 'fm4gRaDKYlo:APA91bEjpUM3YprqTqoELwhPp1YdE25O7tuiTpY5bMs-izQ05Zge1rlMnk5EfAqfuvQvB1CGZIwt341gKQuT9F8IRxd0m1uTH4xPderertxAfJU8VjVlTdmi0oIyNfB01pd11-25fEBS', '2019-04-18 02:29:04'),
(16, 'c62PVLbEGQ8:APA91bEfjowlZ8XbOtOIYlYmIUlxzxl1YAALIBJH0jHp7vQ32uGXjqIaPPb7J9wGuYOATkdUcVNA_opmVvNnijNAc61tO9-iCwsGLoYYIX7LUj7ePRUvo091XKWU9qGk6fWwDagIraix', '2019-04-18 02:29:34'),
(17, 'dihwdI0OTrE:APA91bGYw-0PagmCZmGfUknub6sPjbjKD1JtZLVr_fbDQLF_kKnNA1HaeswGn7nwHiXWT2QMqJat-JjNN1jTvdK5ddZZGasbfchReVPPSmMxSmqPHasRnrzhe9P3qkCBH3HpzJdnBqzW', '2019-04-18 03:53:32'),
(18, 'fkY9HcJR7Jo:APA91bH27nLfzw26Zev2V2_bb5bHDqgjohrhZ7fOfslS6A8cJn83B1h7URehOn80fihwsvpJwVWJnH6P68Lx5GIIZSXTahPHZQ7jWK0r4XqmuqhL28B3CFYWLTphh8ScZxZeNreqLljO', '2019-04-18 04:47:59'),
(19, 'fxncA4iGPMQ:APA91bHwCuUsY5KIKfeBTIlzZyIicwmk7IQ3Wsx2ifLOzyaGLGEJ-x5pPNs_aVrx-g0b9oJSVwVyrEuESlQgSnLMIKgIXxXGeB2PbrqTCcKj1xQQGbaPuavNp13JOvBf88SDBuV4bDaw', '2019-04-18 08:30:57'),
(20, 'fBv5DeSge9Q:APA91bHd2_q3iBs17cBYEl8NHArHw3hvzYSHE6DNfWRPGFXL_i6R5xI8l6eKrTHwy3z8J_o2ZCWtAwpFSSKlgd0VsYIUVHmuFZZpotUm_aTbtpCaHoJASyb_7wkvtxkmtPVlq-9DnOzy', '2019-04-18 08:40:57'),
(21, 'eUm2YwvqVKE:APA91bFSUy7JzoEKBS54r_g-aUgFVb5Epp6pQtDIfOuJcU7CaU89R-3MgiMKQZqOCYocz-0OlFnz1TZkGG7y0SI7Xs559MGSQatmvB27qSPEMbSaaD0pMb6toi8heT4J1AzpZNg--wI7', '2019-04-18 08:47:01'),
(22, 'e5BBCwV5u00:APA91bGWcNJazlK5N2KphgUaXzCWT3BFjn30lLInmSSoou_RGpOWcKzQr38YT3_iwU9R2BMaPjMR2K2Luz3lwaioEnHleBzt4So6PPJ3OQ20dfClHQX5UVb6XmRdVDszGi4XqkHwvCA-', '2019-04-18 08:48:09'),
(23, 'cnXmunn69mI:APA91bGY0rJxHAndJVx3zeK_cTVHj6sTiA54lIBjOVMic-uahNyJu1uLIgkySxZ9gMnhB2YjUzi-4y3MEVv8hUhhToO1l9cB0mdvTN8IsfpJquMDEafSGTOe9SUJeMC4LnDUPgP-j03O', '2019-04-18 09:16:19'),
(24, 'ewmUGp1n8i4:APA91bHp766dKCIBwl0woVkk1yCa0if16rEEvMkvuDkpyewBu2egNO2g4qblV2XdfdZLljdrNaNi3EyQX0b7jVlrbQj9eCw3_r_DPDgGIz9LIbc51xcwWAku0q7Z7sf0mA-7nakC28D6', '2019-04-18 09:25:12'),
(25, 'daIVMDwSwBY:APA91bG9q-7pU9D6Xvypc7NfOGRJAH0cdH9Zgz6Jii47S_z0j06XNZz5OG_hdf7rjqDSILy5eqGWin7PYN07wq8fVY5f5i8gmnXRmuQ_q_orKj4l4T7-0Sj-bMrKH47ZqmGN4KxGZ9x2', '2019-04-18 16:57:17'),
(26, 'cpMQ1b1Z8bc:APA91bHGZ6XClJCXFDW2g4JeogEsc3rg5OYNZ8J1UPRXA9qxlmBqBjODDU3l-1pz_8ISnkaosZSE0T_PH-puu1iZLYV_5oIj4F10hzVbU8gmzaG6Wb5nSckbn6nuZQ-uOqbdzVoJKKz9', '2019-04-22 04:18:21'),
(27, 'flZqzFdSlY4:APA91bESY8INOIaZ9yuoL0-GZRLGSvDxOmUibRg7oqMSfFishvaXbw9ImOnpHZhm-jUvNS7pObBF0ON6r0J8tripuFJYJO4V2qeQVARg-T0wqi_5q2yJcGGZrKTE6tIvVaPE4XkxSMft', '2019-04-22 06:40:20'),
(28, 'fmoyRCeqXew:APA91bEfvMdpXa8ICG_N6vCj5UgoVStGYqYzHa9JHeFx7SH3sCGeoWI8XtfecNEKC16FEqIZDKNDzuU2_Nl6z3StUPnhBI5GHnD0cbsvMcR0jyB4ZdQUDnV9j429KyWQldV_0uts5CXT', '2019-04-22 07:21:14'),
(29, 'eMQQnDrRsRI:APA91bHxUNF0CQOx0AeRLoGkoB3oTcaOOgEaj7Ob934sbb-iDJUfppGVz3wgdvqo5FJZ8daEMWs08i1LnZ6fhNRVwD9J0dG5rVSHr1pvVP0LBi9LPM-h3fCHNsslDsTr_fb4bTOlby-P', '2019-04-23 02:58:54'),
(30, 'e2zbGNJVIWQ:APA91bHVdvvOvuhKDHAMl8Blv3x9OC0ujLRfCUkbfwbxpwwLhJGH8YKzfmiL1_Xq6JnzlRsvZ1cJO2yjvN_bsxbbP_PNnraKTz1I1n9StnXSNS3u_9MzqhO8SHwhcG62KMszCHJhG3Qr', '2019-04-25 03:50:16'),
(31, 'eYuYutYnOTU:APA91bHd8VLkPr-aaDJTSC2hb2ct-wFb4MnAx_aeI4rXkD8tb6R7hGoLUohEqCOyTTRYiLvGOXKkAcuIH-caIZlIKO6dgPVlBPJPW4e_kSF3SxHLGZvX0NmsHhpAZ1wm2_q6Z02yJKMy', '2019-04-25 04:31:05'),
(32, 'eAW170X-5JE:APA91bHdqHbqDdI0NbLEu6CM65Irq6os1SvDyWPG_mty8ZC-tp6WPVdoghSv31ySXjrqeLoZ-Fq4ZLoPfkkJGvrvHLqSrwzZXPK7cpvLw7GazJ-0-oEFBrhqr-Kb3u_SsCNPPEoWtz3T', '2019-04-25 08:27:03'),
(33, 'emZPoo70Ovk:APA91bFbAjhDcsGOiCkKQwSQwsDQmcClDM7ge2c0RzcWT4rMLoatylS4ACkXxAIPnhwlDU2k-NICWIis9HSWR1IZNb9Ql2kjaG5QQ53HIIWw6FjB-vhNAyQhUz1s4xx_cgTpPrCoYmPu', '2019-04-25 09:24:23'),
(34, 'fnT4m47s9qQ:APA91bH3M5Odq13iAYZYCIzyNpGjsBnJcqKOICdkicR7GRlVYIKF45pHm7o7oFa7kooK7UAhgY4VoXbK3Xr2802kwTzGQLGwRT-IASrPFUnnH66VKKK6ZyXclcPMY6yZ6VO4qwrFfz2J', '2019-04-25 09:29:16'),
(35, 'ePN4xy5V5jo:APA91bF26tPOxZ4h_ByFH8xJWDEskK568lTIGrLtTs7wicPqRWkZFVwdLLR-ETbFi17gWdxDXh-7yLbxO3OKVvmkgFeiUCU7WGUVd-P5F7BDzTfkgBJNLShz6hbVo4g6ThUOvSbO6RQb', '2019-04-26 03:23:00'),
(36, 'd8_YlEtQgIQ:APA91bHeCcSbpteYAfDv1CamtS_YOkVuKOGO2GVa1VfRRGJ-WBDBy7p_D0JW3zX937DUPyOC5PxgC50FiSgyvqu67VX_aRAiMJ0Jf2E57Ud9m5yPagIWKd4gks3O80zKUnELng5qiMcJ', '2019-04-29 02:49:46'),
(37, 'ek6QbmxGg8Y:APA91bFSHuON4svo7uDeq1FCAMPYBYjJ6yISCGd6wxlb6k8Q8xd_ekvj-1Pwxxg02M9VzC8d9GKw2ooay3d34ASU0e4vkbt2RXyHj-f7AhM7Tni-yjriK2TpVv6bKsLlawD6uxb6g_wG', '2019-04-29 04:10:53'),
(38, 'd8_YlEtQgIQ:APA91bHTSmx1AEUEvd_4mF62fZycaRooblJaX9K04QVFYWXT1_DDD_P8VZaTVQpmfT3APUIHVvhNM8WuNWtJ33OpTJ2EJimJ4JZhMvy_2GE3t-EcayfCgzUWkDFSCUFshXBv8a5iSznn', '2019-04-29 04:30:46'),
(39, 'fm2ZgiIUpbQ:APA91bGCLILktFo_jUPIOPDWVRdAaeJoUDZ5Z6fsa19lmTGqIb9C7P8Lh9akCqEFeyrMQK7eQjKZLU2SKLOFzA8JhQNYrDz9EtMUC12g9XOmLKQPFr0qiVb3pzyQaeMghsQlCcIfZS-h', '2019-04-29 07:10:58'),
(40, 'd8_YlEtQgIQ:APA91bF3anitfo0pi1KVOdkXUzH7OHOAJJXiflJcvDmbCw-0ZszBQec336jF5-ZbSzU1QJzGWpTXYdsu-rYMN2veBk6o_UTLdS43y9ekAm5Eh6RGlWlmpBhAdQjuaPQGYY0FhxBGyANY', '2019-04-29 07:19:59'),
(41, 'f80cApV8SSY:APA91bFESkBo1Ak5JVvcOlyZmUFhftF2C9ZDmKVBcVj1F9vINzYc4iiwaHfFCJziTcIxImJTdmXPA-u40I7xOqHnTAzBVkkIEQZrctvmeuNyBcIUtPq37DYzdRsFxRQkzn32oWjPvlY9', '2019-04-29 23:58:14'),
(42, 'dohzH1ljiRI:APA91bEZDuJ08Mde3CbOGetLwJt3Ctsxnu57n4ExsP6yr5XPIF7Q8MlWsCiFV0quFBDw1gUEtuC_ISELqxcGrZ5iyLYyqYJQkOaM2CknVFfNCuuXWKJpvPU9KPH5tYNfdNQSFebkB9Du', '2019-04-30 03:07:05'),
(43, 'e_YjOMU4YEI:APA91bGUH8lBGZZMayK8IuwIOTuXYKrBNBCM7bL-jnLHF_zNaw2jNjgCde1DID7oyadMGlYhc4hX0Q8HYQEQ6J_9YZwiIooDj3p57UlT7TmtWM_YDB7kwE8V3N8ZxP0r5beQdMy_rY9x', '2019-04-30 06:47:14'),
(44, 'd6skZ11N9U8:APA91bH3I-6rXMHs0HhgzYvaKFdawc6hWnfJTBgTJ-hNs8HuLcsH-ec6keeBL8HR7UxCyqGJcyWT8QQiAcYOZVf2UwaDw7ea2YptXbX7IGa0Amb2tO4EmTAELzXD56dyGPpLMX16TLQ-', '2019-05-03 00:05:30'),
(45, 'cemgPgkRqgs:APA91bFWkUSR23cfg0mo0_W1NLOZBO66RPNSSNQy9RS8aMOJZjzbs7nbGc05MmBv_WBxEz5v0a12ofhBOJx41uOhWHjMiKbI46B2Ln6TD9kEqt_JllTmAE42Lad1RmriB7AGcam2G1Vm', '2019-05-14 21:37:56'),
(46, 'dF_9WbGq8KM:APA91bHPiXHRruTpiVvNkXexbBqZ3Nr6Hj_uOcI2xbkIoz_927qWG9hW6RsMshG2Vwm7KUbUSk_NOWi5lW-CdUvNv0nIhPwSaaxZisr5XdQWdZhCI3GgM_4UlkYS8LaXl4smbgIkWRvM', '2019-05-21 10:40:46'),
(47, 'fcnWTJr9LAY:APA91bEkiB8j8M9CBiM8lLozDin0jNnIeEAln_zoAsL8uBn2VNa45GvB41aPtKUJOjpEdBXoDapPVtg52-ydlWJQ4KJPNe1U0Ocw-2Iulo5z-nrIDK-rt6ok_QJOyZKfqSIGMSCzSsFJ', '2019-05-21 11:04:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notify`
--

CREATE TABLE `notify` (
  `notify_id` int(4) NOT NULL,
  `info` text NOT NULL,
  `push` int(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notify`
--

INSERT INTO `notify` (`notify_id`, `info`, `push`, `date_add`, `date_modify`, `user_id`) VALUES
(1, '<p>Kini sudah tersedia aplikasi sucaco untuk pengguna iphone&nbsp;ðŸ˜</p>\n', 0, '2019-05-02 07:13:24', '2019-05-02 07:13:24', 1),
(2, '<p>silahkan download aplikasi sucaco si play store dan app store&nbsp;ðŸ™ðŸ™</p>\n', 0, '2019-05-02 07:14:34', '2019-05-02 07:14:34', 1),
(3, '<p>hallo, selamat datang pengguna aplikasi sucaco&nbsp;ðŸ˜Š</p>\n', 1, '2019-05-02 07:16:31', '2019-05-02 07:17:54', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `id` int(10) NOT NULL,
  `room_id` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telp` varchar(16) NOT NULL,
  `status_room` enum('opened','taked','deleted') NOT NULL DEFAULT 'opened',
  `product_id` int(4) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`id`, `room_id`, `name`, `email`, `telp`, `status_room`, `product_id`, `creation_date`) VALUES
(30, '2direksi@gmail.com', 'direksi@gmail.com', 'direksi@gmail.com', '0123456789', 'deleted', 2, '2019-05-21 08:12:16'),
(28, '2test@gmail.com', 'test@gmail.com', 'test@gmail.com', '0123456789', 'taked', 2, '2019-05-21 07:36:45'),
(29, '3test@gmail.com', 'test@gmail.com', 'test@gmail.com', '0123456789', 'deleted', 3, '2019-05-21 07:38:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(3) NOT NULL,
  `slider_image` varchar(100) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` enum('admin IT','admin sales','regular user','premium user','internal','direksi') NOT NULL DEFAULT 'admin IT',
  `status` int(1) NOT NULL,
  `date_add` datetime NOT NULL,
  `date_modify` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `level`, `status`, `date_add`, `date_modify`) VALUES
(1, 'userdemo@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 'admin IT', 1, '2019-05-01 00:00:00', '2019-05-21 14:12:03'),
(4, 'fahmifaturohman1995@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 'regular user', 1, '2019-05-02 06:58:19', '2019-05-02 07:09:16'),
(5, 'direksi@gmail.com', '0b1e50e1fd71c96bac94144cc59cff40', 'direksi', 1, '2019-05-02 23:56:01', '2019-05-21 13:41:37');

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
-- Indexes for table `m_product_image`
--
ALTER TABLE `m_product_image`
  ADD PRIMARY KEY (`image_id`);

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
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `m_category`
--
ALTER TABLE `m_category`
  MODIFY `category_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `m_event`
--
ALTER TABLE `m_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `m_product`
--
ALTER TABLE `m_product`
  MODIFY `product_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `m_product_detail`
--
ALTER TABLE `m_product_detail`
  MODIFY `detail_product_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `m_product_image`
--
ALTER TABLE `m_product_image`
  MODIFY `image_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `m_profile`
--
ALTER TABLE `m_profile`
  MODIFY `profile_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_token`
--
ALTER TABLE `m_token`
  MODIFY `token_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `notify`
--
ALTER TABLE `notify`
  MODIFY `notify_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
