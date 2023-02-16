-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2023 at 06:29 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konter`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(4, 'owner', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(5, 'angga', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `bukti`
--

CREATE TABLE `bukti` (
  `id_bukti` int(11) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bukti`
--

INSERT INTO `bukti` (`id_bukti`, `nama`, `image`) VALUES
(16, 'daffa ariftama hanaris', 'ip wifi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `quantity` int(10) NOT NULL,
  `stok` int(12) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `stok`, `image`) VALUES
(133, 3, 11, 'Infinix Hot12 Play NFC', 1699000, 1, 5, 'hp 4.jpg');

--
-- Triggers `cart`
--
DELIMITER $$
CREATE TRIGGER `stok-update` AFTER INSERT ON `cart` FOR EACH ROW BEGIN

   UPDATE products SET stok = stok - NEW.quantity
   WHERE id = NEW.id;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(3, 9, 'anggamustofa', 'anggamustofa@gmail.com', '0877392774', 'baik');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` varchar(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'belum bayar',
  `order_status` varchar(100) NOT NULL DEFAULT 'menunggu pembayaran'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `nama_produk`, `quantity`, `total_products`, `total_price`, `placed_on`, `payment_status`, `order_status`) VALUES
(27, 6, 'aini', '0857235829', 'nuraini@gmail.com', 'credit card', 'sukorejo rt.05, padas, tanon, sragen,  - 57282', '', '', 'Redmi 10c (1899000 x 1) -', '1899000', '2022-10-13', 'lunas', 'proses packing'),
(29, 7, 'risna', '0877463782', 'risnarizki@gmail.com', 'credit card', 'masaran rt 32, masaran, masaran, sragen,  - 57282', '', '', 'Travel Charger U MAX UX-03 (45000 x 2) -', '90000', '2022-10-16', 'belum bayar', 'menunggu pembayaran'),
(30, 7, 'risna', '0877463782', 'risnarizki@gmail.com', 'cash on delivery', 'masaran rt 32, masaran, masaran, sragen,  - 57282', '', '', 'Redmi 10c (1899000 x 1) -', '1899000', '2022-10-21', 'belum bayar', 'menunggu pembayaran'),
(31, 7, 'risna', '0877463782', 'risnarizki@gmail.com', 'credit card', 'masaran rt 32, masaran, masaran, sragen,  - 57282', '', '', 'Travel Charger Double USB model samsung, oppo, redmi, vivo (45000 x 1) -', '45000', '2022-10-25', 'belum bayar', 'menunggu pembayaran'),
(32, 8, 'dimas', '0882736482', 'dimasaditya@gmail.com', 'cash on delivery', 'masaran kulon rt.05, jati, masaran, Sragen,  - 57282', '', '', 'Redmi 10c (1899000 x 1) -', '1899000', '2022-10-28', 'belum bayar', 'menunggu pembayaran'),
(33, 4, 'angga', '23123213', 'pithong990@gmail.com', 'cash on delivery', '12, solo,  - 71112', '', '', 'Charger Double USB model samsung, oppo, redmi, vivo (50000 x 1) -', '50000', '2022-11-11', 'COD', 'menunggu pembayaran'),
(34, 4, 'angga', '23123213', 'pithong990@gmail.com', 'credit card', '12, solo,  - 71112', '', '', 'Redmi 10c (1899000 x 1) -Charger Double USB model samsung, oppo, redmi, vivo (50000 x 1) -', '1949000', '2022-11-11', 'lunas', 'proses packing'),
(35, 9, 'anggamustofa', '0878287637', 'anggamustofa@gmail.com', 'dana', 'masaran kulon rt05, Jati, Masaran, Sragen,  - 57282', '', '', 'OPPO RENO 7 Z 5G (5999000 x 1) -Travel Charger Smart-200 model samsung, oppo, redmi, vivo (35000 x 1) -', '6034000', '2022-11-12', 'lunas', 'proses packing'),
(40, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'cash on delivery', '11, solo,  - 2111', '', '', 'Redmi 10c (1899000 x 2) -', '3798000', '2022-11-22', 'belum bayar', 'menunggu pembayaran'),
(41, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'rekening-687601026791539(BRI)', '11, solo,  - 2111', '', '', 'Redmi 10c (1899000 x 1) -', '1899000', '2022-11-22', 'belum bayar', 'menunggu pembayaran'),
(42, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'ovo-082143131275', '11, solo,  - 2111', '', '', 'Redmi 10c (1899000 x 1) -', '1899000', '2022-11-22', 'belum bayar', 'menunggu pembayaran'),
(43, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'rekening-687601026791539(BRI)', '11, solo,  - 2111', '', '', 'Infinix Hot12 Play NFC (1699000 x 3) -', '5097000', '2022-11-22', 'belum bayar', 'menunggu pembayaran'),
(44, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'dana-082143131275', '11, solo,  - 2111', '', '', 'Infinix Hot12 Play NFC (1699000 x 1) -', '1699000', '2022-11-22', 'belum bayar', 'menunggu pembayaran'),
(45, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'rekening-687601026791539(BRI)', '11, solo,  - 2111', '', '', 'voucher data smartfren unlimited FUP 2GB/hari (82000 x 4) -', '328000', '2022-11-22', 'belum bayar', 'menunggu pembayaran'),
(46, 3, 'daffa', '089645792', 'daffahanaris@gmail.com', 'rekening-687601026791539(BRI)', '11, solo,  - 2111', '', '', 'Infinix Hot12 Play NFC (1699000 x 1) -', '1699000', '2022-11-22', 'belum bayar', 'menunggu pembayaran');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `ket` text NOT NULL,
  `stok` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image`, `ket`, `stok`) VALUES
(8, 'Redmi 10c', 'handphone', '1899000', 'hp 1.jpg', '        Redmi 10 C\r\nspesifikasi :\r\nRAM 4GB ROM 64GB\r\nbaterai jenis Li-Po 5000 mAh Fast charging 18W\r\n4G LTE dual sim\r\nsensor : Fingerprint (rear-mounted), accelerometer, proximityFingerprint (rear-mounted), accelerometer, proximity\r\nHarga Rp. 1.899.000        ', '2'),
(10, 'Charger Double USB model samsung, oppo', 'Aksesoris', '65000', 'chargerdouble.jpg', '      Travel Charger Double USB model samsung, oppo, \r\nmicro usb\r\nadapter atau travel charger dengan double usb yang bisa digunakan untuk charger 2 handphone sekaligus.\r\nharga Rp. 65.000     ', '3'),
(11, 'Infinix Hot12 Play NFC', 'HandPhone', '1699000', 'hp 4.jpg', ' Infinix Hot12 Play\r\nspesifikasi :\r\nLayar 6,82 inci dengan refresh rate 90 Hz\r\nBaterai besar 6000 mAh\r\nRAM 4GB ROM 64GB\r\n4G LTE\r\nSENSOR : Fingerprint (belakang), akselerometer, cahaya, giroskop (virtual), proksimitas, kompas.\r\nHarga Rp. 1.699.000 ', '5'),
(12, 'voucher data smartfren unlimited FUP 2GB/hari', 'Paket', '82000', 'IMG_20220801_182245.jpg', ' voucher data smartfren \r\nunlimited FUP 2GB/hari\r\nmasa aktif 1 bulan\r\nharga Rp. 82.000 ', '10'),
(14, 'Travel Charger P18 model samsung, oppo, redmi, vivo', 'Aksesoris', '35000', 'chargerP18.jpg', 'Travel Charger P18 model samsung, oppo, redmi, vivo\r\nmicro usb\r\nHarga Rp. 35.000', '0'),
(15, 'Travel Charger Smart-200 model samsung, oppo, redmi, vivo', 'Aksesoris', '35000', 'chargersmartS-200.jpg', 'Travel Charger Smart-200 model samsung, oppo, redmi, vivo\r\nmicro usb\r\nHarga 35.000', '0'),
(16, 'Travel Charger Type Original model samsung, oppo, redmi, vivo', 'Aksesoris', '35000', 'chargertypeoriginal.jpg', ' Travel Charger Type Original model samsung, oppo, redmi, vivo\r\nMicro Usb\r\nHarga Rp. 35.000', '0'),
(17, 'AirBag ', 'Aksesoris', '15000', 'AIRBAG.jpg', ' AirBag Lucu\r\nDigunakan untuk body belakang handphone bisa untuk pegangan handphone.\r\nHarga Rp. 15.000', '0'),
(18, 'Baterai Lenovo A1000 double power', 'Aksesoris', '80000', 'BTLENOVOA1000.jpg', 'Baterai Lenovo A1000\r\nDouble Power\r\nharga Rp. 80.000', '0'),
(19, 'Baterai Samsung type I8262', 'Aksesoris', '70000', 'BTSAMSUNGI8262.jpg', ' Baterai Samsung type I8262\r\nharga Rp. 70.000', '0'),
(20, 'Charger Nokia Kecil', 'Aksesoris', '20000', 'chargernokia.jpg', ' Charger Nokia Kecil\r\nkonektor lubang bulat kecil\r\nHarga Rp. 20.000', '0'),
(21, 'Travel Charger U MAX UX-03', 'Aksesoris', '45000', 'chargerUMAX.jpg', ' Travel Charger U MAX UX-03\r\noutput 3A\r\nFast Charging\r\nMicro Usb\r\nHarga Rp. 45.000', '0'),
(22, 'Konektor Bluetooth (wireless music receiver) type CK06', 'Aksesoris', '20000', 'CONNECTORBLUETOOTH.jpg', ' konektor bluetooth\r\nharga Rp. 20.000', '0'),
(23, 'Flashdisk Sandisk 16GB ', 'Aksesoris', '70000', 'FLASHDISKSANDISK.jpg', 'Flashdisk Sandisk 16GB\r\nHarga Rp. 70.000', '0'),
(24, 'Earphone Fleco FL-04 Turbo', 'Aksesoris', '25000', 'hffleco.jpg', 'Earphone Fleco FL-04 Turbo\r\nNon karet\r\nEXTRA BASS\r\nharga Rp. 25.000', '0'),
(25, 'Earphone JBL E20', 'Aksesoris', '25000', 'hfJBLE20.jpg', ' Earphone JBL E20\r\nkaret\r\nHarga Rp. 25.000', '0'),
(26, 'Earphone Philips AT-213 BASS', 'Aksesoris', '25000', 'hfphilipsAT-213.jpg', ' Earphone Philips AT-213 BASS\r\nbahan : METAL JACK\r\nkaret\r\nHarga Rp. 25.000', '0'),
(27, 'Earphone Philips MA-21', 'Aksesoris', '25000', 'hfphilipsextrabassMA-21.jpg', ' Earphone Philips MA-21\r\nEXTRA BASS\r\nKaret\r\nharga Rp. 25.000', '0'),
(28, 'Earphone Philips JB-08', 'Aksesoris', '25000', 'hfphilipsjb08.jpg', ' Earphone Philips JB-08\r\nEXTRA BASS\r\nkaret\r\nHarga Rp. 25.000', '0'),
(29, 'Earphone Realme', 'Aksesoris', '20000', 'hfrealme.jpg', ' Earphone Realme\r\nkaret\r\nbisa buat telepon dan music\r\nHarga Rp. 20.000', '0'),
(30, 'Earphone ROKER RK70K', 'Aksesoris', '30000', 'hfroker70.jpg', ' Earphone ROKER RK70K\r\nNon karet\r\nbisa buat telepon dan music\r\nHarga Rp. 30.000', '0'),
(31, 'Earphone ROKER RK20K ', 'Aksesoris', '35000', 'hfrokerRK20k.jpg', 'Earphone ROKER RK20K \r\nEXTRA BASS\r\nSTEREO SOUND\r\nKARET\r\nHarga Rp. 35.000', '0'),
(32, 'Earphone ROKER RK53K ', 'Aksesoris', '25000', 'hfrokerrk53k.jpg', 'Earphone ROKER RK53K \r\nkaret\r\nbisa untuk telepon dan music\r\nHarga Rp. 25.000', '0'),
(33, 'Earphone ROKER RK71K ', 'Aksesoris', '35000', 'hfrokerrk71.jpg', 'Earphone ROKER RK71K \r\nnon karet\r\nbisa untuk music dan telepon\r\nHarga Rp. 35.000', '0'),
(34, 'Earphone ROKER SAVAGE ', 'Aksesoris', '25000', 'hfrokersavage.jpg', 'Earphone ROKER SAVAGE\r\nSTEREO BASS\r\nbisa untuk music dan telepon\r\nHarga Rp. 25.000', '0'),
(35, 'Earphone ROKER the boss', 'Aksesoris', '25000', 'hfrokertheboss.jpg', 'Earphone ROKER THE BOSS\r\nkaret\r\nbisa untuk music dan telepon\r\nHarga Rp. 25.000', '0'),
(36, 'Earphone U19 ', 'Aksesoris', '20000', 'hfu19.jpg', ' Earphone U19\r\nnon karet\r\nbanyak varian warna diantaranya merah, pink, biru, kuning, hijau.\r\nharga Rp. 20.000', '0'),
(37, 'Earphone U59', 'Aksesoris', '20000', 'HFU59.jpg', 'Earphone U59\r\nbisa untuk music dan telepon\r\nbanyak varian warna biru, merah, kuning.\r\nHarga Rp. 20.000 ', '0'),
(38, 'KABEL AUX / AUDIO', 'Aksesoris', '15000', 'kabelAUX.jpg', 'KABEL AUX/AUDIO\r\ndigunakan untuk menyambungkan handphone ke audio mobil atau radio di rumah.\r\nHarga Rp. 15.000', '0'),
(39, 'KABEL AUX/AUDIO ROKER38', 'Aksesoris', '25000', 'kabelAUXroker38.jpg', 'kabel aux/audio merk roker38\r\nharga Rp. 25.000', '0'),
(40, 'Kabel data Micro Usb DAP', 'Aksesoris', '25000', 'kabelmicroDAP.jpg', 'Kabel data Micro Usb merk DAP\r\npanjang 1m\r\noutput 2.4 A\r\nHarga Rp. 25.000', '0'),
(41, 'Kabel data micro usb roker ultra', 'Aksesoris', '30000', 'kabelrokerultramicro.jpg', 'Kabel data roker ultra\r\nmicro usb\r\npanjang 1m\r\noutput 2.1 A\r\nharga Rp. 30.000', '0'),
(42, 'kabel data iphone( kabel lightning) ', 'Aksesoris', '18000', 'KBLIPHONE.jpg', 'Kabel data Iphone \r\nuntuk iphone 6 keatas\r\npanjang 1m\r\nharga Rp. 18.000', '0'),
(43, 'MEMORY CARD V-GEN 4GB CLASS 6', 'Aksesoris', '48000', 'MMC4GB.jpg', 'MEMORY CARD V-GEN 4GB CLASS 6\r\nHARGA Rp. 48.000', '0'),
(44, 'MEMORY CARD V-GEN 8GB CLASS 6', 'Aksesoris', '55000', 'MMC8GB.jpg', ' MEMORY CARD V-GEN 8GB CLASS 6\r\nHarga Rp. 55.000', '0'),
(45, 'CAR CHARGER DAP ', 'Aksesoris', '55000', 'MOBILDAP.jpg', 'CAR CHARGER DAP \r\n2 USB \r\nFAST CHARGING\r\nMICRO USB\r\nharga Rp. 55.000', '0'),
(46, 'CAR CHARGER FLECO', 'Aksesoris', '35000', 'MOBILFLECO.jpg', 'CAR CHARGER FLECO\r\n2 USB\r\nLED CAR CHARGER\r\nOUTPUT 3.4A\r\nHarga Rp. 35.000', '0'),
(47, 'CAR CHARGER HIPPO alf', 'Aksesoris', '40000', 'MOBILHIPPO.jpg', 'CAR CHARGER HIPPO alf\r\ntidak ada kabel data\r\noutput 2.4 A\r\nharga Rp. 40.000', '0'),
(48, 'OPPO RENO 7 Z 5G', 'HandPhone', '5999000', 'OPPORENO7.jpg', 'OPPO RENO 7 Z 5G\r\nSPESIFIKASI :\r\n5G \r\nRAM : 8 GB\r\nMemori Internal : 128 GB\r\nNFC  : Ada\r\nGPS  : GPS, A-GPS, GLONASS, BDS, GALILEO, QZSS\r\nUSB : Tipe-C 2.0, USB On-The-Go\r\nBATERAI : 4500 mAh Pengisian cepat 33W (klaim 100% dalam 60 menit)\r\nHarga Rp. 5.999.000\r\n', '0'),
(49, 'OTG USB TYPE C', 'Aksesoris', '15000', 'OTGTYPEC.jpg', 'OTG USB TYPE C\r\nharga Rp. 15.000', '0'),
(50, 'OTG USB TYPE C V8', 'Aksesoris', '12000', 'OTGUSB.jpg', 'OTG USB TYPE C V8\r\nharga Rp. 12.000', '0'),
(51, 'POWER BANK ALTO MODEL AP-08 KAPASITAS 12000 mAh', 'Aksesoris', '140000', 'PBALTOAP-08.jpg', 'POWER BANK ALTO MODEL AP-08 KAPASITAS 12000 mAh\r\nharga Rp. 140.000', '0'),
(52, 'POWER BANK VEGERKAPASITAS 10000 mAh', 'Aksesoris', '85000', 'PBVEGER.jpg', 'POWER BANK VEGERKAPASITAS 10000 mAh\r\nHarga Rp. 85.000', '0'),
(53, 'PERDANA PAKET DATA 3 HAPPY 2,5GB', 'Paket', '15000', 'perdana3.jpg', 'PERDANA PAKET DATA 3 HAPPY 2,5GB\r\nMASA AKTIF 1 BULAN\r\nharga Rp. 15.000\r\n', '0'),
(54, 'PERDANA PAKET DATA AXIS  1+3GB', 'Paket', '17000', 'perdanaaxis1gb.jpg', 'PERDANA PAKET DATA AXIS  1+3GB\r\nMASA AKTIF 1BULAN\r\nharga Rp. 17.000', '0'),
(55, 'PERDANA PAKET DATA INDOSAT 3GB 1BULAN', 'Paket', '15000', 'perdanaindosat3gb.jpg', 'PERDANA PAKET DATA INDOSAT 3GB \r\nMASA AKTIF 1BULAN\r\nFULL 24 JAM \r\nharga Rp. 15.000', '0'),
(56, 'PERDANA PAKET DATA INDOSAT 8GB 1BULAN', 'Paket', '35000', 'perdanaindosat8gb.jpg', 'PERDANA PAKET DATA INDOSAT 8GB \r\nMASA AKTIF 1BULAN\r\nFULL 24 JAM \r\nharga Rp. 35.000', '0'),
(57, 'PERDANA PAKET DATA TELKOMSEL 35GB 1BULAN', 'Paket', '82000', 'perdanatelkomsel35gb.jpg', 'PERDANA PAKET DATA TELKOMSEL 35GB MASA AKTIF 1BULAN\r\nFULL 24 JAM\r\nPEMBAGIAN KUOTA :\r\n2GB KUOTA INTERNET NASIONAL\r\n23GB KUOTA INTERNET LOKAL\r\n10GB KUOTA NONTON\r\nharga Rp. 82.000', '0'),
(58, 'PERDANA PAKET DATA XL 4GB 1BULAN', 'Paket', '18000', 'perdanaxl4gb.jpg', 'PERDANA PAKET DATA XL 4GB \r\nMASA AKTIF 1BULAN\r\nKUOTA FULL 24JAM\r\nharga Rp. 18.000\r\n', '0'),
(59, 'PERDANA PAKET DATA XL 45GB+UNLIMITED 1BULAN', 'Paket', '79000', 'perdanaxl45gb.jpg', 'PERDANA PAKET DATA XL 45GB \r\nMASA AKTIF 1BULAN\r\nUNLIMITED SOSIAL MEDIA\r\nKUOTA FULL 24 JAM\r\nharga Rp. 79.000', '0'),
(60, 'REALME C31', 'HandPhone', '1699000', 'realmeC31.jpg', 'REALME C31\r\nSPESIFIKASI :\r\nRAM 3GB ROM 32GB\r\nWLan : Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot\r\nBluetooth : 5.0, A2DP, LE\r\nInfrared : Tidak Ada\r\nNFC : Tidak Ada\r\nGPS : GPS, A-GPS, GLONASS, BDS, GALILEO\r\nUSB : microUSB 2.0, USB On-The-Go\r\nBATERAI : Li-Po kapasitas 5000 mAh\r\nHarga Rp. 1.699.000', '0'),
(61, 'Samsung Galaxy A73 5G', 'HandPhone', '7799000', 'SamsungGalaxyA735G.jpg', 'Samsung Galaxy A73 5G\r\nSPESIFIKASI :\r\nKonektivitas cukup lengkap dengan 5G, WiFi 6, Bluetooth 5.0, dan NFC\r\nPenggunaan chipset Snapdragon 778G yang gahar\r\nHadir dengan sertifikasi IP67\r\nKamera 108 MP dan kamera selfie 32 MP, hadirkan perekaman 4K\r\nLayar cerah dan memukau dengan balutan Super AMOLED+ dan 120 Hz\r\nRAM 8GB ROM 256GB\r\nBATERAI : 5000 mAh Fast charging 25 W\r\nHarga Rp. 7.799.000', '0'),
(62, 'KARTU PERDANA PAKET TELKOMSEL 7GB 1 BULAN', 'Paket', '35000', 'SPTSEL7GB.jpg', 'KARTU PERDANA PAKET TELKOMSEL 7GB 1 BULAN\r\nKUOTA FULL 24 JAM\r\nHarga Rp. 35.000', '0'),
(63, 'KARTU PERDANA  TELKOMSEL BIASA PULSA 0K', 'Paket', '10000', 'SPTSELBIASA.jpg', 'KARTU PERDANA  TELKOMSEL BIASA PULSA 0K\r\nHarga Rp. 10.000', '0'),
(64, 'voucher data 3 AON 6GB', 'Paket', '40000', 'V3AON6.jpg', 'voucher data 3 AON 6GB\r\nmasa aktif 1 tahun (mengikuti masa aktif kartu)\r\nharga Rp. 40.000', '0'),
(65, 'voucher data AXIS 2GB 1 bulan', 'Paket', '27000', 'VAXIS2GB.jpg', 'voucher data AXIS 2GB 1 bulan\r\nisi kuota 2gb + 4gb(lokal)\r\nfull 24 jam\r\nHarga Rp. 27.000', '0'),
(66, 'voucher data AXIS 3GB 15 Hari', 'Paket', '25000', 'VAXIS3GB15HR.jpg', 'voucher data AXIS 3GB 15 Hari\r\nfull 24 jam\r\nmasa aktif 15 hari\r\nHarga Rp. 25.000', '0'),
(67, 'VIVO Y33T', 'HandPhone', '3299000', 'vivoY33T.jpg', 'VIVO Y33T\r\nSPESIFIKASI :\r\nBaterai Terhitung Awet\r\nHadir dengan Reverse Charging\r\nSensor Sidik Jari di Samping\r\nMenggunakan NFC\r\nDesain Bodi yang Menawan, RIngkas, dan Ringan\r\nPerforma Stabil dan Irit Berkat Snapdragon 680\r\nRAM : 8 GB\r\nMemori Internal	: 128 GB\r\nBaterai : 5000 mAh [&#34;Reverse charging&#34;,&#34;Fast Charging 18W&#34;]\r\nOS (Saat Rilis) : Android 11, FunTouch 11.1 (Saat Rilis)\r\nSensor : [&#34;Fingerprint (side)&#34;,&#34;Accelerometer&#34;,&#34;Proximity&#34;,&#34;Compass&#34;]', '0'),
(68, 'voucher data INDOSAT Freedom 9GB 1 bulan', 'Paket', '42000', 'VM3FD9.jpg', 'voucher data INDOSAT Freedom 9GB 1 bulan\r\nfull 24 jam\r\nHarga Rp. 42.000', '0'),
(69, 'voucher data INDOSAT Freedom unlimited 1GB 1 bulan', 'Paket', '34000', 'VM31UNL.jpg', 'voucher data INDOSAT Freedom unlimited 1GB 1 bulan\r\nfull 24 jam\r\nharga Rp. 34.000', '0'),
(70, 'voucher data INDOSAT Freedom unlimited 3GB 1 bulan', 'Paket', '74000', 'VM33UNL.jpg', 'voucher data INDOSAT Freedom unlimited 3GB 1 bulan\r\nkuota full 24 jam\r\nHarga Rp. 74.000', '0'),
(71, 'voucher data 3 22GB + Unlimited Youtube 1 Bulan', 'Paket', '72000', 'voucher322gbunl.jpg', 'voucher data 3 22GB + Unlimited Youtube 1 Bulan\r\nfull 24 jam\r\nHarga Rp. 72.000', '0'),
(72, 'voucher data smartfren 2gb 7hari', 'Paket', '10000', 'vouchersmartfren2gb.jpg', 'voucher data smartfren 2gb 7hari\r\n1gb kuota utama \r\n1gb kuota chat\r\nmasa aktif 7 hari\r\nharga Rp. 10.000', '0'),
(73, 'voucher data smartfren 4GB 7HARI', 'Paket', '13000', 'vouchersmartfren4gb.jpg', 'voucher data smartfren 4GB 7HARI\r\nHarga Rp. 13.000', '0'),
(74, 'voucher data smartfren 6GB NONSTOP 1BULAN', 'Paket', '33000', 'vouchersmartfren6gb.jpg', 'voucher data smartfren 6GB NONSTOP 1BULAN\r\nHarga Rp. 33.000', '0'),
(75, 'voucher data smartfren unlimited FUP 500mb/hari 28 hari', 'Paket', '58000', 'VSMART500MB.jpg', 'voucher data smartfren unlimited FUP 500mb/hari 28 hari\r\nharga Rp. 58.000', '0'),
(76, 'voucher data Telkomsel 2,5GB 5hari', 'Paket', '14000', 'VTSEL2.5GB.jpg', 'voucher data Telkomsel 2,5GB 5hari\r\nHarga Rp. 14.000', '0'),
(77, 'voucher data Telkomsel 7GB 1bulan', 'Paket', '50000', 'VTSEL7GB.jpg', 'voucher data Telkomsel 7GB 1bulan\r\nharga Rp. 50.000\r\n', '0'),
(78, 'MEMORY CARD V-GEN 8GB CLASS 10', 'Aksesoris', '55000', 'MMC8GB.jpg', ' memory card vgen 8gb class 10\r\nHarga Rp. 55.000', '0'),
(79, 'Flashdisk sandisk', 'Aksesoris', '70000', 'FLASHDISKSANDISK.jpg', ' flashdisk sandisk 16gb\r\nHarga Rp. 70.000', '0'),
(80, 'hp', 'HandPhone', '25000', 'hp 1.jpg', ' warna hijau', '0'),
(81, 'Redmi 10c', 'handphone', '1899000', 'hp 1.jpg', '  Redmi 10 C\r\nspesifikasi :\r\nRAM 4GB ROM 64GB\r\nbaterai jenis Li-Po 5000 mAh Fast charging 18W\r\n4G LTE dual sim\r\nsensor : Fingerprint (rear-mounted), accelerometer, proximityFingerprint (rear-mounted), accelerometer, proximity\r\nHarga Rp. 1.899.000  ', '3'),
(82, 'daffa', 'Aksesoris', '25000', 'chargerUMAX.jpg', '  warna putih ', '5');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(3, 'daffa', 'daffahanaris@gmail.com', '089645792', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '11, solo,  - 2111'),
(4, 'angga', 'pithong990@gmail.com', '23123213', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', '12, solo,  - 71112'),
(5, 'ajipratama', 'ajipratama@gmail.com', '0882345568', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'sariguna rt 02, sragen kota,, sragen,  - 57282'),
(6, 'aini', 'nuraini@gmail.com', '0857235829', '51eac6b471a284d3341d8c0c63d0f1a286262a18', 'sukorejo rt.05, padas, tanon, sragen,  - 57282'),
(7, 'risna', 'risnarizki@gmail.com', '0877463782', 'fc1200c7a7aa52109d762a9f005b149abef01479', 'masaran rt 32, masaran, masaran, sragen,  - 57282'),
(8, 'dimas', 'dimasaditya@gmail.com', '0882736482', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'masaran kulon rt.05, jati, masaran, Sragen,  - 57282'),
(9, 'anggamustofa', 'anggamustofa@gmail.com', '0878287637', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'masaran kulon rt05, Jati, Masaran, Sragen,  - 57282');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bukti`
--
ALTER TABLE `bukti`
  ADD PRIMARY KEY (`id_bukti`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bukti`
--
ALTER TABLE `bukti`
  MODIFY `id_bukti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
