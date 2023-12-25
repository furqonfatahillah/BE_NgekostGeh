-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Des 2023 pada 08.16
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kostgeh`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_kost`
--

CREATE TABLE `detail_kost` (
  `id_detailKos` int(11) DEFAULT NULL,
  `komentar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `register_pemilikkos`
--

CREATE TABLE `register_pemilikkos` (
  `id_pemilikKos` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `No_Hp` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `register_pencarikos`
--

CREATE TABLE `register_pencarikos` (
  `id_pencariKos` int(11) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `No_Hp` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `register_pencarikos`
--

INSERT INTO `register_pencarikos` (`id_pencariKos`, `Nama`, `No_Hp`, `Email`, `PasswordHash`) VALUES
(2, 'furqon', '085240153953', 'furqon@gmail.com', 'kkakakak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tambah_kos`
--

CREATE TABLE `tambah_kos` (
  `id` int(11) NOT NULL,
  `nama_kos` varchar(100) NOT NULL,
  `fasilitas_kamar` enum('kasur','bantal','lemari baju','meja','kursi','jendela') NOT NULL,
  `fasilitas_kamarMandi` enum('kamar mandi dalam','kamar mandi luar','kloset duduk','shower') NOT NULL,
  `peraturan_khusus` enum('maksimal penghuni','membawa pasangan','tamu dilarang menginap') NOT NULL,
  `fasilitas_umum` enum('wifi','dapur','kulkas','parkir mobil','parkir motor','cctv') NOT NULL,
  `peraturan_Kos` enum('akses 24 jam','dilarang merokok','lawan jenis dilarang ke kamar','dilarang membawa hewan') NOT NULL,
  `foto_kos` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_kost`
--
ALTER TABLE `detail_kost`
  ADD KEY `id_detailKos` (`id_detailKos`);

--
-- Indeks untuk tabel `register_pemilikkos`
--
ALTER TABLE `register_pemilikkos`
  ADD PRIMARY KEY (`id_pemilikKos`);

--
-- Indeks untuk tabel `register_pencarikos`
--
ALTER TABLE `register_pencarikos`
  ADD PRIMARY KEY (`id_pencariKos`);

--
-- Indeks untuk tabel `tambah_kos`
--
ALTER TABLE `tambah_kos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `register_pemilikkos`
--
ALTER TABLE `register_pemilikkos`
  MODIFY `id_pemilikKos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `register_pencarikos`
--
ALTER TABLE `register_pencarikos`
  MODIFY `id_pencariKos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_kost`
--
ALTER TABLE `detail_kost`
  ADD CONSTRAINT `detail_kost_ibfk_1` FOREIGN KEY (`id_detailKos`) REFERENCES `tambah_kos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
