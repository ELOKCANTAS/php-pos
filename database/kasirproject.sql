-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Sep 2024 pada 15.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasirproject`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `DetailIID` int(11) NOT NULL,
  `PenjualanID` int(11) NOT NULL,
  `ProdukID` int(11) NOT NULL,
  `kode_pembayaran` varchar(200) NOT NULL,
  `kode_penjualan` varchar(200) NOT NULL,
  `JumlahProduk` int(11) NOT NULL,
  `TotalHarga` decimal(10,2) NOT NULL,
  `DibuatPada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TotalBayar` decimal(10,2) NOT NULL,
  `kembalian` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`DetailIID`, `PenjualanID`, `ProdukID`, `kode_pembayaran`, `kode_penjualan`, `JumlahProduk`, `TotalHarga`, `DibuatPada`, `TotalBayar`, `kembalian`) VALUES
(1, 0, 0, 'QHJ4Z6ELUB', 'ORD-20240903144357-4285', 0, 44000.00, '2024-09-03 13:50:29', 0.00, 0.00),
(2, 0, 0, '726KD4MIPA', 'ORD-20240903052253-5475', 0, 30000.00, '2024-09-03 13:52:16', 0.00, 0.00),
(3, 0, 0, 'V3FSUL2XNI', 'ORD-20240903155240-2762', 0, 33000.00, '2024-09-03 13:52:53', 0.00, 0.00),
(4, 35, 0, 'RH9SXNC1Y5', 'ORD-20240903161012-4759', 0, 29000.00, '2024-09-03 14:10:35', 0.00, 0.00),
(5, 36, 0, '2H17JOYGN4', 'ORD-20240903161027-1573', 0, 68000.00, '2024-09-03 14:11:27', 0.00, 0.00),
(6, 37, 0, 'UC3F9D1KAQ', 'ORD-20240903161204-6508', 0, 30000.00, '2024-09-03 14:12:08', 0.00, 0.00),
(7, 0, 0, '2V6SFADZ54', 'ORD-20240903161930-6093', 0, 2000.00, '2024-09-03 14:19:34', 0.00, 0.00),
(8, 0, 0, 'VXWIYOR7PS', 'ORD-20240903162048-6483', 0, 6000.00, '2024-09-03 14:28:19', 0.00, 0.00),
(9, 0, 0, 'P83N9W6HGR', 'ORD-20240903163718-9701', 0, 3000.00, '2024-09-03 14:37:23', 0.00, 0.00),
(10, 0, 0, 'FZ3KPO82WS', 'ORD-20240904143152-8383', 0, 12000.00, '2024-09-04 12:32:04', 0.00, 0.00),
(11, 0, 0, '2C13U6IKOX', 'ORD-20240908082716-4637', 0, 11000.00, '2024-09-10 02:04:32', 0.00, 0.00),
(12, 0, 0, 'FDHUSPC2O6', 'ORD-20240908081856-3860', 0, 14000.00, '2024-09-10 02:07:20', 0.00, 0.00),
(13, 0, 0, 'XDJVW83LYM', 'ORD-20240908080902-9576', 0, 25000.00, '2024-09-10 02:07:40', 0.00, 0.00),
(14, 0, 0, '4CKOFW2V6Y', 'ORD-20240910040824-6721', 0, 17000.00, '2024-09-10 02:08:31', 0.00, 0.00),
(15, 0, 0, 'MSLBEYG637', 'ORD-20240910041833-1504', 0, 11000.00, '2024-09-10 02:18:39', 0.00, 0.00),
(16, 0, 0, 'ETPGSIFJX9', 'ORD-20240910040801-2738', 0, 5000.00, '2024-09-10 02:20:22', 0.00, 0.00),
(17, 0, 0, 'V5L61AYMQB', 'ORD-20240904143509-9993', 0, 24000.00, '2024-09-10 11:47:14', 25000.00, -1000.00),
(18, 0, 0, 'Q6C9D4Z1YP', 'ORD-20240910042240-9331', 0, 13000.00, '2024-09-10 11:50:29', 20000.00, 20000.00),
(19, 0, 0, 'JIA2MX9KLB', 'ORD-20240910135105-6127', 0, 15000.00, '2024-09-10 11:51:12', 20000.00, 5000.00),
(20, 0, 0, 'INXYECQ5FP', 'ORD-20240910135849-4012', 0, 13000.00, '2024-09-10 11:59:35', 25000.00, 12000.00),
(21, 69, 0, '58ORATNS6Z', 'ORD-20240910140412-4843', 0, 30000.00, '2024-09-10 12:04:26', 40000.00, 10000.00),
(22, 68, 0, '7NQP3HZK8X', 'ORD-20240910140356-6150', 0, 11000.00, '2024-09-10 12:09:25', 20000.00, 9000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `PelangganID` int(11) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `NomorTelepon` varchar(15) NOT NULL,
  `DibuatPada` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`PelangganID`, `NamaPelanggan`, `Alamat`, `NomorTelepon`, `DibuatPada`) VALUES
(1, 'elok', 'pyk', '0988877', '2024-08-20 10:50:10.201389'),
(2, 'dini', 'leuwiseeng', '08997766', '2024-08-23 12:33:31.592445'),
(4, 'Aas', 'panyingkiran', '089977669', '2024-08-29 08:31:16.533730'),
(5, 'nabil', 'Majalengka', '09876599', '2024-09-03 02:40:40.417031'),
(6, 'tedi', 'Rajagaluh', '08799880', '2024-09-03 12:43:30.728479');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL,
  `kode_penjualan` varchar(200) NOT NULL,
  `TanggalPenjualan` date NOT NULL,
  `TotalHarga` decimal(10,2) NOT NULL,
  `PelangganID` int(11) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `DibuatPada` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `kode_penjualan`, `TanggalPenjualan`, `TotalHarga`, `PelangganID`, `NamaPelanggan`, `DibuatPada`, `status`) VALUES
(11, 'ORD-20240829105537-3321', '2024-08-29', 22000.00, 2, 'dini', '2024-09-02 14:39:46', 'Selesai'),
(12, 'ORD-20240829105609-2360', '2024-08-29', 35000.00, 4, 'Aas', '2024-09-02 14:39:46', 'Selesai'),
(13, 'ORD-20240829105643-3308', '2024-08-29', 78000.00, 1, 'elok', '2024-09-03 03:20:20', 'Bayar'),
(14, 'ORD-20240829105751-2370', '2024-08-29', 44000.00, 1, 'elok', '2024-09-02 14:39:46', 'Selesai'),
(15, 'ORD-20240829130855-4664', '2024-08-29', 51000.00, 1, 'elok', '2024-09-02 14:39:46', 'Selesai'),
(16, 'ORD-20240829134511-2245', '2024-08-29', 23000.00, 1, 'elok', '2024-09-02 14:39:46', 'Selesai'),
(17, 'ORD-20240829135756-7932', '2024-08-29', 102000.00, 2, 'dini', '2024-09-02 14:39:46', 'Selesai'),
(18, 'ORD-20240901182356-9060', '2024-09-01', 11000.00, 1, 'elok', '2024-09-02 14:39:46', 'Selesai'),
(19, 'ORD-20240901182417-7066', '2024-09-01', 59000.00, 1, 'elok', '2024-09-02 14:39:46', 'Selesai'),
(20, 'ORD-20240901183807-2434', '2024-09-01', 142000.00, 1, 'elok', '2024-09-02 14:39:46', 'Selesai'),
(21, 'ORD-20240902162950-6451', '2024-09-02', 19000.00, 1, 'elok', '2024-09-03 03:14:13', 'Bayar'),
(22, 'ORD-20240902163007-9822', '2024-09-02', 24000.00, 4, 'Aas', '2024-09-02 14:39:49', 'Selesai'),
(23, 'ORD-20240902163020-8718', '2024-09-02', 33000.00, 2, 'dini', '2024-09-02 14:39:46', 'Selesai'),
(24, 'ORD-20240902164016-1051', '2024-09-02', 47000.00, 1, 'elok', '2024-09-02 14:43:17', 'Bayar'),
(25, 'ORD-20240902164337-1716', '2024-09-02', 42000.00, 2, 'dini', '2024-09-03 03:11:15', 'Bayar'),
(26, 'ORD-20240903042727-2539', '2024-09-03', 12000.00, 1, 'elok', '2024-09-03 02:35:52', 'Bayar'),
(27, 'ORD-20240903050052-5141', '2024-09-03', 27000.00, 5, 'nabil', '2024-09-03 03:01:23', 'Bayar'),
(28, 'ORD-20240903052253-5475', '2024-09-03', 30000.00, 5, 'nabil', '2024-09-03 13:52:16', 'Bayar'),
(30, 'ORD-20240903052330-8110', '2024-09-03', 107000.00, 4, 'Aas', '2024-09-03 03:23:48', 'Bayar'),
(31, 'ORD-20240903144357-4285', '2024-09-03', 44000.00, 6, 'tedi', '2024-09-03 13:50:29', 'Bayar'),
(32, 'ORD-20240903145706-4521', '2024-09-03', 22000.00, 1, 'elok', '2024-09-03 12:57:18', 'Bayar'),
(33, 'ORD-20240903155240-2762', '2024-09-03', 33000.00, 1, 'elok', '2024-09-03 13:52:53', 'Bayar'),
(34, 'ORD-20240903160954-1543', '2024-09-03', 76000.00, 2, 'dini', '2024-09-03 14:14:24', 'Bayar'),
(35, 'ORD-20240903161012-4759', '2024-09-03', 29000.00, 5, 'nabil', '2024-09-03 14:10:35', 'Bayar'),
(36, 'ORD-20240903161027-1573', '2024-09-03', 68000.00, 4, 'Aas', '2024-09-03 14:11:27', 'Bayar'),
(37, 'ORD-20240903161204-6508', '2024-09-03', 30000.00, 6, 'tedi', '2024-09-03 14:12:08', 'Bayar'),
(38, 'ORD-20240903161535-1613', '2024-09-03', 33000.00, 6, 'tedi', '2024-09-03 14:15:41', 'Bayar'),
(39, 'ORD-20240903161758-5885', '2024-09-03', 55000.00, 4, 'Aas', '2024-09-03 14:18:04', 'Bayar'),
(40, 'ORD-20240903161930-6093', '2024-09-03', 2000.00, 1, 'elok', '2024-09-03 14:19:34', 'Bayar'),
(41, 'ORD-20240903162048-6483', '2024-09-03', 6000.00, 2, 'dini', '2024-09-03 14:28:04', 'Bayar'),
(42, 'ORD-20240903163142-9872', '2024-09-03', 3000.00, 6, 'tedi', '2024-09-03 14:31:48', 'Bayar'),
(43, 'ORD-20240903163432-9246', '2024-09-03', 2000.00, 1, 'elok', '2024-09-03 14:34:37', 'Bayar'),
(44, 'ORD-20240903163637-8655', '2024-09-03', 3000.00, 5, 'nabil', '2024-09-03 14:36:43', 'Bayar'),
(45, 'ORD-20240903163718-9701', '2024-09-03', 3000.00, 4, 'Aas', '2024-09-03 14:37:23', 'Bayar'),
(46, 'ORD-20240904143152-8383', '2024-09-04', 12000.00, 1, 'elok', '2024-09-04 12:32:04', 'Bayar'),
(47, 'ORD-20240904143509-9993', '2024-09-04', 24000.00, 1, 'elok', '2024-09-10 11:47:14', 'Bayar'),
(48, 'ORD-20240908080902-9576', '2024-09-08', 25000.00, 1, 'elok', '2024-09-10 02:07:40', 'Bayar'),
(49, 'ORD-20240908081856-3860', '0000-00-00', 14000.00, 5, 'nabil', '2024-09-10 02:07:20', 'Bayar'),
(51, 'ORD-20240908081856-3860', '0000-00-00', 14000.00, 5, 'nabil', '2024-09-10 02:07:20', 'Bayar'),
(52, 'ORD-20240908081856-3860', '0000-00-00', 14000.00, 5, 'nabil', '2024-09-10 02:07:20', 'Bayar'),
(53, 'ORD-20240908081856-3860', '0000-00-00', 14000.00, 5, 'nabil', '2024-09-10 02:07:20', 'Bayar'),
(55, 'ORD-20240908082716-4637', '2024-09-08', 11000.00, 1, 'elok', '2024-09-10 02:04:32', 'Bayar'),
(62, 'ORD-20240910040801-2738', '2024-09-10', 5000.00, 6, 'tedi', '2024-09-10 02:20:22', 'Bayar'),
(63, 'ORD-20240910040824-6721', '2024-09-10', 17000.00, 2, 'dini', '2024-09-10 02:08:31', 'Bayar'),
(64, 'ORD-20240910041833-1504', '2024-09-10', 11000.00, 6, 'tedi', '2024-09-10 02:18:40', 'Bayar'),
(65, 'ORD-20240910042240-9331', '2024-09-10', 13000.00, 5, 'nabil', '2024-09-10 11:50:29', 'Bayar'),
(66, 'ORD-20240910135105-6127', '2024-09-10', 15000.00, 1, 'elok', '2024-09-10 11:51:12', 'Bayar'),
(67, 'ORD-20240910135849-4012', '2024-09-10', 13000.00, 1, 'elok', '2024-09-10 11:59:35', 'Bayar'),
(68, 'ORD-20240910140356-6150', '2024-09-10', 11000.00, 4, 'Aas', '2024-09-10 12:09:25', 'Bayar'),
(69, 'ORD-20240910140412-4843', '2024-09-10', 30000.00, 6, 'tedi', '2024-09-10 12:04:26', 'Bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `PetugasID` int(11) NOT NULL,
  `NamaPetugas` varchar(200) NOT NULL,
  `NamaLengkap` varchar(200) NOT NULL,
  `EmailPetugas` varchar(200) NOT NULL,
  `NomorPetugas` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Alamat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL,
  `NamaProduk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL,
  `ProdukImg` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`ProdukID`, `NamaProduk`, `Harga`, `Stok`, `ProdukImg`, `kode_produk`) VALUES
(1, 'Ice Cream Taro ', 3000.00, 100, 'e36a53ac-3d32-4fa4-95ea-8e1f8ca25c0c.jpg', '1122a'),
(7, 'Miem sedap', 2000.00, 200, '9a786f53aa40326bc300fb8ebcba1fa8.jpeg', 'SYRK-4802'),
(8, 'Chitato', 6000.00, 100, '13c32f2ce2f54fd918c094a99b3e2fb9.jpeg', 'RYXB-3259'),
(9, 'Roti Aoka', 5000.00, 150, 'images.jpeg', 'NZAP-7823'),
(10, 'Mie sedap spicy', 2000.00, 50, '3eb6ce9087870268834019003daf0805.jpg', 'QIYU-9270'),
(11, 'Teh Pucuk', 4000.00, 100, 'eeac6a08-301d-401c-81f9-5085e544fec7.jpg', 'WGKD-4865'),
(12, 'Ice Cream Cup Coklat', 5000.00, 50, '20092989_1.jpeg', 'VFTR-1206'),
(13, 'bengbeng', 2000.00, 100, 'db572b217ce298e397ea8fc452302f8a.jpeg', 'GABJ-7165'),
(14, 'Teh Gelas', 1000.00, 300, 'd5dd7f75-50a9-42d8-b72a-836ce98a2aa5.jpg', 'NBYR-8519');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` varchar(200) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `level`) VALUES
(4, 'elok cantas irdina', '50df03c0497a277ce829897ec9aea8c50c3b3a95', 'elok@elok', 'elok cantas', 'pyk', 'petugas'),
(5, 'ELOK c', 'AAAA', 'AAAA@GMAIL', 'AAAA', 'AAAA', 'admin'),
(6, 'elok', 'loklok', 'elok@elok', 'elok c', 'AAAA', 'admin'),
(7, 'elok', 'elok', 'elok@elok', 'elok c', 'pyk', 'admin'),
(8, 'elok', 'nindita12273', 'elokck@gmail.com', 'elok cantas i.n.', 'pyk', 'admin'),
(10, '', '$2y$10$y6l9MRqaqAs/MjscFziVcOCO.rzBY5hxD2Udt6t1CD82MxEsWoysi', '', '', '', 'admin'),
(11, 'elok', '$2y$10$1LqNbytHDiPo9b5hC7Q3h.8xZAo4vshqNlVaRY9l8qe/rDAtzMoPi', 'elok@elok2', '', 'pyk', 'admin'),
(12, 'elok', '$2y$10$ld9e8lZoKT.0xjwp57kg4eUvvY0MXUy4K/qX6E975T6C9XqO71brS', 'elok@elok3', 'elok cantas irdina', 'pyk', 'admin'),
(13, 'elok', '$2y$10$p6mzHZnZO3CqsuyYvlqv/u154oFFCU56Z1JjRxfevpvNt/PBc3Iv2', 'elok@elok5', 'elok c', 'pyk', 'admin'),
(15, 'irdina', '$2y$10$ike3ivbQ2MaD8434SncyV.KeH8VSazT90bna7bb86.bHY4uEi8KcO', 'elokckk@gmail.com', 'elok cantas irdina', 'panyingkiran', 'admin'),
(16, 'elok', '12333', 'elok@eloks', 'elok cantas', 'pyk', 'admin'),
(111, 'admin', 'admin123', 'admin@mail.com', 'admin elok', 'pyk', 'admin'),
(112, 'elok ', 'fb13d9ee6b2f1607e16ebd51605bf45cb217b1d1', 'petugas@mail.com', 'elok cantas irdina', 'pyk', 'petugas'),
(114, 'Aas', '02bb526de8643b5822091f3a64801e4df6293bfc', 'aas@mail.com', 'Aas Rosmanah', 'Majalengka', 'petugas'),
(116, ' dini', 'e4fc76c0cfb2e65260a64b73d07bfa56462edf01', 'petugas2@mail.com', 'dini', 'leuwiseeng', 'petugas'),
(117, ' nabil', 'e4fc76c0cfb2e65260a64b73d07bfa56462edf01', 'petugas3@mail.com', 'nabl', 'kadipaten', 'petugas'),
(118, ' elok', '50df03c0497a277ce829897ec9aea8c50c3b3a95', 'elokpetugas@mail.com', 'elok', 'panyingkiran', 'petugas'),
(119, ' nabil', '$2y$10$DxWRWNiS5vTVHbj/Z9rk5uMV5pmnghkXNFC77Z691YKttrAop.eB.', 'petugas4@mail.com', 'nabil', 'leuwiseeng', 'petugas'),
(120, 'elok', '$2y$10$gNrCUZHy8yxwfPZ9vtKUXuq2TYw1Pcy893dgg0GXc41Yq.C/EJwW2', 'elokca@elok', 'elok cantas irdina', 'panyingkiran', 'admin'),
(121, 'dini', '$2y$10$SyuBD86AA9LjCt2TS0mTHOYabe0ZOIw9eSzCkvG3tTCRjV6c8PSC6', 'dini2@mail.com', 'dini', 'leuwiseeng', 'admin'),
(122, 'elok', '$2y$10$OrcInoMdQcdo3Y8GPF47.ObQlIMS4mksL6DXPyYSyXDJqgu1sF8Da', 'elokadmin@mail.com', 'elok cantas', 'panyingkiran', 'admin'),
(123, ' elok', '$2y$10$gCJaZWKdpnA18qdOfbQohOvL/1DbOK2Yy2eMAH96QRP9vYMI7Ldg2', 'elokpetugas@gmail.com', 'elok', 'panyingkiran', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`DetailIID`),
  ADD KEY `PenjualanID` (`PenjualanID`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`PelangganID`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `PelangganID` (`PelangganID`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`PetugasID`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ProdukID`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `DetailIID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `PelangganID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `PenjualanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `PetugasID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `ProdukID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
