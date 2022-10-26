-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2022 at 08:15 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lelang`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `tgl_daftar` text NOT NULL,
  `tgl_exp` text NOT NULL,
  `harga_awal` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto_barang` text NOT NULL,
  `status` enum('terbuka','terlelang','tertutup') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `tgl_daftar`, `tgl_exp`, `harga_awal`, `deskripsi`, `foto_barang`, `status`) VALUES
(2, 'mouse', '01-10-22 12:00:00', '11-06-22 06:00:00', 50000, 'mouse tikus', 'bebek_kuning.png', 'terbuka'),
(3, 'permen', '01-10-22 12:00:00', '11-09-22 15:02:00', 2000, 'ini permen', 'login.png', 'terlelang'),
(4, 'apel', '10-04-22 07:48:00', '11-10-22 07:48:00', 6000, 'Jus Apel', 'apel.jpg', 'terlelang'),
(5, 'club', '10-04-22 09:48:00', '11-11-22 11:48:00', 3000, 'Air Mineral', 'club.jpg', 'terlelang');

-- --------------------------------------------------------

--
-- Table structure for table `lelang`
--

CREATE TABLE `lelang` (
  `id` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `tgl_lelang` text NOT NULL,
  `harga_akhir` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` enum('pending','terlelang','kalah') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lelang`
--

INSERT INTO `lelang` (`id`, `id_barang`, `tgl_lelang`, `harga_akhir`, `id_user`, `status`) VALUES
(177, 5, '10-05-22', 100000, 11, 'kalah'),
(178, 5, '10-05-22', 120120, 10, 'terlelang'),
(179, 4, '10-19-22', 8000, 11, 'kalah'),
(180, 4, '10-19-22', 10000, 10, 'terlelang'),
(181, 5, '10-20-22', 3500, 11, 'kalah'),
(182, 5, '10-20-22', 5000, 10, 'kalah'),
(183, 3, '10-22-22', 5000, 10, 'terlelang'),
(184, 5, '10-25-22', 3000, 10, 'terlelang'),
(185, 3, '10-26-22', 5000, 10, 'kalah'),
(186, 3, '10-26-22', 6000, 11, 'terlelang');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) NOT NULL,
  `nama_petugas` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `nama_petugas`, `username`, `password`, `level`) VALUES
(1, 'M ZAKY ARISANDHI', 'admin', '1', 'admin'),
(2, 'sistem', 'sistem', 'sistem', 'admin'),
(3, 'Devaro', 'Devaro JR', '123', 'petugas'),
(4, 'kikik gantng cui', 'kikik ganteng', '123', 'petugas'),
(5, 'kikik', 'petugas', '1', 'petugas'),
(358, 'a', 'a', 'a', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `tlpn` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `tlpn`) VALUES
(1, 'Devaro', 'Devaro', '12345', '1'),
(10, 'kikik123', 'user', '123', '123'),
(11, 'kikik', 'user', '12', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_barang` (`nama_barang`,`harga_awal`);

--
-- Indexes for table `lelang`
--
ALTER TABLE `lelang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`,`harga_akhir`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lelang`
--
ALTER TABLE `lelang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=359;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lelang`
--
ALTER TABLE `lelang`
  ADD CONSTRAINT `lelang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lelang_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
