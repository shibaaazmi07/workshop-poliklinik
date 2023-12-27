-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Des 2023 pada 09.20
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poliklinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED NOT NULL,
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `keluhan` text DEFAULT NULL,
  `no_antrian` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_periksa` int(11) UNSIGNED NOT NULL,
  `id_obat` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL,
  `id_poli` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`) VALUES
(1, 'Dr.Niskala Senja, M.Biomed,Sp.A', 'Jalan Merdeka No 01, Semarang', '081222333444', 1),
(2, 'Dr.Pratama JayaM.Biomed,Sp.A', 'Jalan Sumber Utama No.08, Semarang', '08111555222333', 1),
(3, 'Dr.Mutia, M.Biomed,Sp.M', 'Jalan Terang Bulan No.09, Semarang', '087666555444', 4),
(4, 'Dr.Putra, M.Biomed,Sp.M', 'Jalan Gelap Gulita No.10, Semarang', '0856668889', 4),
(5, 'Dr.Langit Baskara, M.Biomed, Sp.JP', 'Jalan Merdeka Satu No.11, Semarang', '0897776665', 3),
(6, 'Dr.Adi, M.Biomed, Sp.JP', 'Jalan Utama No.55, Semarang', '08977722223', 3),
(7, 'Dr.Abimanyu, Sp.PM', 'Jalan Merak No.99, Semarang', '086665551', 2),
(8, 'Dr.Sri, Sp.Ort', 'Jalan Tulip No.22, Semarang', '08955522211', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_dokter` int(11) UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') DEFAULT NULL,
  `jam_mulai` time DEFAULT NULL,
  `jam_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 1, 'Senin', '09:00:00', '15:00:00'),
(2, 2, 'Rabu', '09:00:00', '15:00:00'),
(3, 7, 'Selasa', '08:00:00', '14:00:00'),
(4, 8, 'Kamis', '08:00:00', '14:00:00'),
(5, 5, 'Jumat', '08:30:00', '14:30:00'),
(6, 6, 'Senin', '08:30:00', '14:30:00'),
(7, 3, 'Selasa', '09:30:00', '15:30:00'),
(8, 4, 'Sabtu', '09:30:00', '15:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_obat` varchar(50) DEFAULT NULL,
  `kemasan` varchar(35) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Cerebrofort G', 'Botol Obat Cair', 25000),
(2, 'Citrex Gummy', 'Tablet Kunyah', 15000),
(3, 'Dentasol', 'Botol Obat Cair', 10000),
(4, 'Cooling 5 Plus', 'Botol Obat Semprot', 46000),
(5, 'Isosorbide Dinitrate', 'Tablet', 3000),
(6, 'Digoxin', 'Tablet', 2000),
(7, 'Blink Contacts', 'Botol Cair', 65000),
(8, 'Alletrol Com Eye Drop', 'Botol Cair', 30000),
(9, 'paracetamol', 'tablet', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` int(255) DEFAULT NULL,
  `alamat` int(255) DEFAULT NULL,
  `no_ktp` int(255) DEFAULT NULL,
  `no_hp` int(50) DEFAULT NULL,
  `no_rm` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_daftar_poli` int(11) UNSIGNED NOT NULL,
  `tgl_periksa` datetime DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `biaya_periksa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_poli` varchar(25) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Poli Anak', 'layanan kesehatan untuk anak sejak dia dilahirkan hingga berusia 18 tahun. Tidak hanya berfokus pada aspek penunjang kesehatan yang dibutuhkan anak, namun juga gangguan kesehatan pada anak, penyakit, kelainan, alergi dan yang lainnya yang dapat mengganggu tumbuh kembang anak.'),
(2, 'Poli Gigi', 'memberi pelayanan kesehatan mulut dan gigi. Jadi, kamu bisa datang ke poli gigi saat membutuhkan layanan kesehatan seputar gigi dan mulut.\r\nBerikut ini beberapa jenis layanan yang bisa didapatkan di poli gigi:\r\nTambal gigi: Prosedur untuk mengatasi gigi berlubang atau patah.\r\nScaling: Untuk membersihkan karang gigi.\r\nPencabutan gigi: Untuk mencabut gigi yang bermasalah atau tidak bisa diperbaiki lagi.\r\nPemasangan mahkota gigi: Untuk memperbaiki gigi yang telah rusak parah karena pembusukan atau cedera.\r\nPemasangan kawat gigi: Untuk meluruskan dan memperbaiki gigi yang bengkok, sehignga lebih sehat dan lebih mudah dirawat.'),
(3, 'Poli Jantung', 'Menyediakan layanan kesehatan untuk kesehatan jantung, misalnya seperti gagal jantung, aritmia, penyakit vaskular atau pembuluh darah, katup jantung, infeksi atau penyakit jantung bawaan (kongenital).\r\nBiasanya klinik jantung akan dilengkapi dengan beberapa faasilitas yang diantaranya adalah seperti treadmill, elektrokardiografi, echokardiografi dan penunjang lainnya.'),
(4, 'Poli Mata', 'Dokter akan memberikan pelayanan kesehatan untuk masalah mata, misalnya seperti gangguan di retina, katarak, lasik, mata kering, strabismus, glaukoma dan lainnya.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `nama`, `password`, `level`) VALUES
(1, 'dokter', 'Dr. Niskala', 'ad', 'Dokter'),
(2, 'admin', 'Shibaa', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarpoli_pasien` (`id_pasien`),
  ADD KEY `fk_daftarpoli_jadwalperiksa` (`id_jadwal`);

--
-- Indeks untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailperiksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailperiksa_obat` (`id_obat`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indeks untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwalperiksa_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarpoli` (`id_daftar_poli`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftarpoli_jadwalperiksa` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftarpoli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailperiksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailperiksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Ketidakleluasaan untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwalperiksa_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Ketidakleluasaan untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarpoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
