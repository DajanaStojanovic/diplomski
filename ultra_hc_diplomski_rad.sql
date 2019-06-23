

CREATE Database ultra_hc_diplomski_rad;


CREATE TABLE `broj_igraca` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `broj` varchar(5) DEFAULT NULL,
  `slika` varchar(50) DEFAULT NULL,
  `cijena` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `broj_igraca`
--

INSERT INTO `broj_igraca` (`id`, `naziv`, `broj`, `slika`, `cijena`) VALUES
(1, 'Četiri igrača', '2-4', '2_4_igraca.png', '80.00'),
(2, 'Šest igrača', '2-6', '2_6_igraca.png', '100.00'),
(3, 'Osam igrača', '2-8', '2_8_igraca.png', '120.00'),
(4, 'Deset igrača', '2-10', '2_10_igraca.png', '140.00');

-- --------------------------------------------------------

--
-- Table structure for table `figurice`
--

CREATE TABLE `figurice` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `opis` text,
  `slika` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `figurice`
--

INSERT INTO `figurice` (`id`, `naziv`, `opis`, `slika`) VALUES
(1, 'Prva vrsta figurica', 'Opis figurica', 'prva_vrsta.png'),
(2, 'Druga vrsta figurica', 'Opis figurica', 'druga_vrsta.png'),
(3, 'Treca vrsta figurica', 'Opis figurica', 'treca_vrsta.png'),
(4, 'Cetvrta vrsta figurica', 'Opis figurica', 'cetvrta_vrsta.png');

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Table structure for table `narucitelj`
--

CREATE TABLE `narucitelj` (
  `id` int(11) NOT NULL,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `postanski_broj` varchar(10) NOT NULL,
  `mjesto` varchar(50) NOT NULL,
  `drzava` varchar(50) NOT NULL,
  `broj_telefona` varchar(50) NOT NULL,
  `napomena` text,
  `privola` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `narucitelj`
--

INSERT INTO `narucitelj` (`id`, `ime`, `prezime`, `email`, `postanski_broj`, `mjesto`, `drzava`, `broj_telefona`, `napomena`, `privola`) VALUES
(1, 'Pero', 'Perić', 'pero.peric@gmail.com', '31000', 'Osijek', 'Hrvatska', '0987654321', 'Napomena', 1),
(2, 'Pero', 'Perić', 'pero.peric@gmail.com', '31000', 'Osijek', 'Hrvatska', '0987654321', 'Napomena', 1);

-- --------------------------------------------------------

--
-- Table structure for table `narudzba`
--

CREATE TABLE `narudzba` (
  `id` int(11) NOT NULL,
  `narucitelj` int(11) DEFAULT NULL,
  `broj_igraca` int(11) DEFAULT NULL,
  `oblik_ploce` int(11) DEFAULT NULL,
  `boja_ploce` varchar(11) DEFAULT NULL,
  `figurice` int(11) DEFAULT NULL,
  `ploca` int(11) DEFAULT NULL,
  `dostava` varchar(50) DEFAULT NULL,
  `placanje` varchar(50) DEFAULT NULL,
  `datum` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `narudzba`
--

INSERT INTO `narudzba` (`id`, `narucitelj`, `broj_igraca`, `oblik_ploce`, `boja_ploce`, `figurice`, `ploca`, `dostava`, `placanje`, `datum`) VALUES
(1, 2, 1, 1, "#fff", 2, 1, 'Pošta', 'Pouzeće', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oblik_ploce`
--

CREATE TABLE `oblik_ploce` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `broj_igraca` int(11) DEFAULT NULL,
  `slika` varchar(100) DEFAULT NULL,
  `broj_polja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oblik_ploce`
--

INSERT INTO `oblik_ploce` (`id`, `naziv`, `broj_igraca`, `slika`, `broj_polja`) VALUES
(1, 'Četiri igrača, zvijezda', 1, '2_4_zvijezda.png', 40),
(2, 'Četiri igrača, ploha', 1, '2_4_ploha.png', 50),
(3, 'Šest igrača, zvijezda', 2, '2_6_zvijezda.png', 66),
(4, 'Šest igrača, ploha', 2, '2_6_ploha.png', 74),
(5, 'Osam igrača, zvijezda', 3, '2_8_zvijezda.png', 88),
(6, 'Osam igrača, ploha', 3, '2_8_ploha.png', 98),
(7, 'Deset igrača, zvijezda', 4, '2_10_zvijezda.png', 110),
(8, 'Deset igrača, ploha', 4, '2_10_ploha.png', 122);

-- --------------------------------------------------------

--
-- Table structure for table `ploca`
--

CREATE TABLE `ploca` (
  `id` int(11) NOT NULL,
  `polja` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ploca`
--

INSERT INTO `ploca` (`id`, `polja`) VALUES
(1, '1_1 2; 1_3 4');

-- --------------------------------------------------------

--
-- Table structure for table `polja_ploca`
--

CREATE TABLE `polja_ploca` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `broj_polja` int(11) DEFAULT NULL,
  `oblik_ploce` int(11) DEFAULT NULL,
  `x_kordinata` varchar(10) DEFAULT NULL,
  `y_kordinata` varchar(10) DEFAULT NULL,
  `kut` varchar(10) DEFAULT NULL,
  `visina` decimal(11,2) DEFAULT NULL,
  `sirina` decimal(11,2) DEFAULT NULL,
  `boja_pozadine` varchar(10) DEFAULT NULL,
  `dodavanje_pravila` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polja_ploca`
--

INSERT INTO `polja_ploca` (`id`, `naziv`, `broj_polja`, `oblik_ploce`, `x_kordinata`, `y_kordinata`, `kut`, `visina`, `sirina`, `boja_pozadine`, `dodavanje_pravila`) VALUES
(1, '1_1', 1, 1, '2.4', '37.7', '0', 7, 7, '#fff', 1),
(2, '1_2', 2, 1, '10.9', '37.7', '0', 7, 7, '#fff', 1),
(3, '1_3', 3, 1, '19.4', '37.7', '0', 7, 7, '#fff', 1),
(4, '1_4', 4, 1, '27.9', '37.7', '0', 7, 7, '#fff', 1),
(5, '1_5', 5, 1, '36.4', '37.7', '90', 7, 7, '#fff', 1),
(6, '1_6', 6, 1, '36.4', '29.2', '90', 7, 7, '#fff', 1),
(7, '1_7', 7, 1, '36.4', '20.7', '90', 7, 7, '#fff', 1),
(8, '1_8', 8, 1, '36.4', '12.2', '90', 7, 7, '#fff', 1),
(9, '1_9', 9, 1, '36.4', '3.7', '90', 7, 7, '#EE3B3B', 1),
(10, '1_10', 10, 1, '44.9', '3.7', '90', 7, 7, '#fff', 1),
(11, '1_11', 11, 1, '53.4', '3.7', '90', 7, 7, '#fff', 0),
(12, '1_12', 12, 1, '53.4', '12.2', '90', 7, 7, '#fff', 1),
(13, '1_13', 13, 1, '53.4', '20.7', '90', 7, 7, '#fff', 1),
(14, '1_14', 14, 1, '53.4', '29.2', '90', 7, 7, '#fff', 1),
(15, '1_15', 15, 1, '53.4', '37.7', '90', 7, 7, '#fff', 1),
(16, '1_16', 16, 1, '61.9', '37.7', '180', 7, 7, '#fff', 1),
(17, '1_17', 17, 1, '70.4', '37.7', '180', 7, 7, '#fff', 1),
(18, '1_18', 18, 1, '78.9', '37.7', '180', 7, 7, '#fff', 1),
(19, '1_19', 19, 1, '87.4', '37.7', '180', 7, 7, '#3E5BF7', 1),
(20, '1_20', 20, 1, '87.4', '54.7', '180', 7, 7, '#fff', 1),
(21, '1_21', 21, 1, '87.4', '46.2', '180', 7, 7, '#fff', 0),
(22, '1_22', 22, 1, '78.9', '54.7', '180', 7, 7, '#fff', 1),
(23, '1_23', 23, 1, '70.4', '54.7', '180', 7, 7, '#fff', 1),
(24, '1_24', 24, 1, '61.9', '54.7', '180', 7, 7, '#fff', 1),
(25, '1_25', 25, 1, '53.4', '54.7', '270', 7, 7, '#fff', 1),
(26, '1_26', 26, 1, '53.4', '63.2', '270', 7, 7, '#fff', 1),
(27, '1_27', 27, 1, '53.4', '71.7', '270', 7, 7, '#fff', 1),
(28, '1_28', 28, 1, '53.4', '80.2', '270', 7, 7, '#fff', 1),
(29, '1_29', 29, 1, '53.4', '88.7', '270', 7, 7, '#EEDC3B', 1),
(30, '1_30', 30, 1, '44.9', '88.7', '270', 7, 7, '#fff', 1),
(31, '1_31', 31, 1, '36.4', '88.7', '270', 7, 7, '#fff', 0),
(32, '1_32', 32, 1, '36.4', '80.2', '270', 7, 7, '#fff', 1),
(33, '1_33', 33, 1, '36.4', '71.7', '270', 7, 7, '#fff', 1),
(34, '1_34', 34, 1, '36.4', '63.2', '270', 7, 7, '#fff', 1),
(35, '1_35', 35, 1, '36.4', '54.7', '270', 7, 7, '#fff', 1),
(36, '1_36', 36, 1, '27.9', '54.7', '0', 7, 7, '#fff', 1),
(37, '1_37', 37, 1, '19.4', '54.7', '0', 7, 7, '#fff', 1),
(38, '1_38', 38, 1, '10.9', '54.7', '0', 7, 7, '#fff', 1),
(39, '1_39', 39, 1, '2.4', '54.7', '0', 7, 7, '#4EEE94', 1),
(40, '1_40', 40, 1, '2.4', '46.2', '0', 7, 7, '#fff', 1),
(41, '1_41', 41, 1, '11.4', '6.8', '0', 7, 7, '#4EEE94', 0),
(42, '1_42', 42, 1, '19.9', '6.8', '0', 7, 7, '#4EEE94', 0),
(43, '1_43', 43, 1, '11.4', '15.3', '0', 7, 7, '#4EEE94', 0),
(44, '1_44', 44, 1, '19.9', '15.3', '0', 7, 7, '#4EEE94', 0),
(45, '1_45', 45, 1, '10.9', '46.2', '0', 7, 7, '#4EEE94', 0),
(46, '1_46', 46, 1, '19.4', '46.2', '0', 7, 7, '#4EEE94', 0),
(47, '1_47', 47, 1, '27.9', '46.2', '0', 7, 7, '#4EEE94', 0),
(48, '1_48', 48, 1, '36.4', '46.2', '0', 7, 7, '#4EEE94', 0),
(49, '1_49', 49, 1, '87', '12', '0', 7, 7, '#EE3B3B', 0),
(50, '1_50', 50, 1, '87', '20.5', '0', 7, 7, '#EE3B3B', 0),
(51, '1_51', 51, 1, '78.5', '12', '0', 7, 7, '#EE3B3B', 0),
(52, '1_52', 52, 1, '78.5', '20.5', '0', 7, 7, '#EE3B3B', 0),
(53, '1_53', 53, 1, '44.9', '12.2', '0', 7, 7, '#EE3B3B', 0),
(54, '1_54', 54, 1, '44.9', '20.7', '0', 7, 7, '#EE3B3B', 0),
(55, '1_55', 55, 1, '44.9', '29.2', '0', 7, 7, '#EE3B3B', 0),
(56, '1_56', 56, 1, '44.9', '37.7', '0', 7, 7, '#EE3B3B', 0),
(57, '1_57', 57, 1, '82', '78.5', '0', 7, 7, '#3E5BF7', 0),
(58, '1_58', 58, 1, '73.5', '78.5', '0', 7, 7, '#3E5BF7', 0),
(59, '1_59', 59, 1, '73.5', '87', '0', 7, 7, '#3E5BF7', 0),
(60, '1_60', 60, 1, '82', '87', '0', 7, 7, '#3E5BF7', 0),
(61, '1_61', 61, 1, '78.9', '46.2', '0', 7, 7, '#3E5BF7', 0),
(62, '1_62', 62, 1, '70.4', '46.2', '0', 7, 7, '#3E5BF7', 0),
(63, '1_63', 63, 1, '61.9', '46.2', '0', 7, 7, '#3E5BF7', 0),
(64, '1_64', 64, 1, '53.4', '46.2', '0', 7, 7, '#3E5BF7', 0),
(65, '1_65', 65, 1, '6', '72.5', '0', 7, 7, '#EEDC3B', 0),
(66, '1_66', 66, 1, '14.5', '72.5', '0', 7, 7, '#EEDC3B', 0),
(67, '1_67', 67, 1, '6', '81', '0', 7, 7, '#EEDC3B', 0),
(68, '1_68', 68, 1, '14.5', '81', '0', 7, 7, '#EEDC3B', 0),
(69, '1_69', 69, 1, '44.9', '80.2', '0', 7, 7, '#EEDC3B', 0),
(70, '1_70', 70, 1, '44.9', '71.7', '0', 7, 7, '#EEDC3B', 0),
(71, '1_71', 71, 1, '44.9', '63.2', '0', 7, 7, '#EEDC3B', 0),
(72, '1_72', 72, 1, '44.9', '54.7', '0', 7, 7, '#EEDC3B', 0),

(73, '2_1', 1, 2, '32.5', '19.46', '0', 4.2, 4.2, '#EE3B3B', 0),
(74, '2_2', 2, 2, '32.5', '24.64', '0', 4.2, 4.2, '#fff', 1),
(75, '2_3', 3, 2, '32.5', '29.82', '0', 4.2, 4.2, '#fff', 1),
(76, '2_4', 4, 2, '32.5', '35', '0', 4.2, 4.2, '#fff', 1),
(77, '2_5', 5, 2, '32.5', '40.18', '0', 4.2, 4.2, '#fff', 1),
(78, '2_6', 6, 2, '32.5', '45.36', '0', 4.2, 4.2, '#fff', 1),
(79, '2_7', 7, 2, '32.5', '50.54', '0', 4.2, 4.2, '#fff', 1),
(80, '2_8', 8, 2, '32.5', '55.72', '0', 4.2, 4.2, '#fff', 1),
(81, '2_9', 9, 2, '32.5', '60.9', '0', 4.2, 4.2, '#fff', 1),
(82, '2_10', 10, 2, '32.5', '66.08', '0', 4.2, 4.2, '#fff', 1),
(83, '2_11', 11, 2, '32.5', '71.26', '0', 4.2, 4.2, '#fff', 1),
(84, '2_12', 12, 2, '32.5', '76.44', '0', 4.2, 4.2, '#fff', 1),
(85, '2_13', 13, 2, '37.68', '76.44', '0', 4.2, 4.2, '#fff', 1),
(86, '2_14', 14, 2, '37.68', '71.26', '0', 4.2, 4.2, '#4EEE94', 0),
(87, '2_15', 15, 2, '37.68', '66.08', '0', 4.2, 4.2, '#4EEE94', 0),
(88, '2_16', 16, 2, '37.68', '60.9', '0', 4.2, 4.2, '#4EEE94', 0),
(89, '2_17', 17, 2, '37.68', '55.72', '0', 4.2, 4.2, '#4EEE94', 0),
(90, '2_18', 18, 2, '42.86', '76.44', '0', 4.2, 4.2, '#4EEE94', 0),
(91, '2_19', 19, 2, '42.86', '71.26', '0', 4.2, 4.2, '#fff', 1),
(92, '2_20', 20, 2, '42.86', '66.08', '0', 4.2, 4.2, '#fff', 1),
(93, '2_21', 21, 2, '42.86', '60.9', '0', 4.2, 4.2, '#fff', 1),
(94, '2_22', 22, 2, '42.86', '55.72', '0', 4.2, 4.2, '#fff', 1),
(95, '2_23', 23, 2, '48.04', '55.72', '0', 4.2, 4.2, '#fff', 1),
(96, '2_24', 24, 2, '53.22', '55.72', '0', 4.2, 4.2, '#fff', 1),
(97, '2_25', 25, 2, '53.22', '60.9', '0', 4.2, 4.2, '#fff', 1),
(98, '2_26', 26, 2, '53.22', '66.08', '0', 4.2, 4.2, '#fff', 1),
(99, '2_27', 27, 2, '53.22', '71.26', '0', 4.2, 4.2, '#fff', 1),
(100, '2_28', 28, 2, '53.22', '76.44', '0', 4.2, 4.2, '#fff', 1),
(101, '2_29', 29, 2, '58.4', '76.44', '0', 4.2, 4.2, '#fff', 1),
(102, '2_30', 30, 2, '63.58', '76.44', '0', 4.2, 4.2, '#3E5BF7', 0),
(103, '2_31', 31, 2, '58.4', '71.26', '0', 4.2, 4.2, '#3E5BF7', 0),
(104, '2_32', 32, 2, '58.4', '66.08', '0', 4.2, 4.2, '#3E5BF7', 0),
(105, '2_33', 33, 2, '58.4', '60.9', '0', 4.2, 4.2, '#3E5BF7', 0),
(106, '2_34', 34, 2, '58.4', '55.72', '0', 4.2, 4.2, '#3E5BF7', 0),
(107, '2_35', 35, 2, '63.58', '71.26', '0', 4.2, 4.2, '#fff', 1),
(108, '2_36', 36, 2, '63.58', '66.08', '0', 4.2, 4.2, '#fff', 1),
(109, '2_37', 37, 2, '63.58', '60.9', '0', 4.2, 4.2, '#fff', 1),
(110, '2_38', 38, 2, '63.58', '55.72', '0', 4.2, 4.2, '#fff', 1),
(111, '2_39', 39, 2, '63.58', '50.54', '0', 4.2, 4.2, '#fff', 1),
(112, '2_40', 40, 2, '63.58', '45.36', '0', 4.2, 4.2, '#fff', 1),
(113, '2_41', 41, 2, '63.58', '40.18', '0', 4.2, 4.2, '#fff', 1),
(114, '2_42', 42, 2, '63.58', '35', '0', 4.2, 4.2, '#fff', 1),
(115, '2_43', 43, 2, '63.58', '29.82', '0', 4.2, 4.2, '#fff', 1),
(116, '2_44', 44, 2, '63.58', '24.64', '0', 4.2, 4.2, '#fff', 1),
(117, '2_45', 45, 2, '63.58', '19.46', '0', 4.2, 4.2, '#fff', 1),
(118, '2_46', 46, 2, '58.4', '40.18', '0', 4.2, 4.2, '#EEDC3B', 0),
(119, '2_47', 47, 2, '58.4', '35', '0', 4.2, 4.2, '#EEDC3B', 0),
(120, '2_48', 48, 2, '58.4', '29.82', '0', 4.2, 4.2, '#EEDC3B', 0),
(121, '2_49', 49, 2, '58.4', '24.64', '0', 4.2, 4.2, '#EEDC3B', 0),
(122, '2_50', 50, 2, '58.4', '19.46', '0', 4.2, 4.2, '#fff', 1),
(123, '2_51', 51, 2, '53.22', '19.46', '0', 4.2, 4.2, '#EEDC3B', 0),
(124, '2_52', 52, 2, '53.22', '24.64', '0', 4.2, 4.2, '#fff', 1),
(125, '2_53', 53, 2, '53.22', '29.82', '0', 4.2, 4.2, '#fff', 1),
(126, '2_54', 54, 2, '53.22', '35', '0', 4.2, 4.2, '#fff', 1),
(127, '2_55', 55, 2, '53.22', '40.18', '0', 4.2, 4.2, '#fff', 1),
(128, '2_56', 56, 2, '48.04', '40.18', '0', 4.2, 4.2, '#fff', 1),
(129, '2_57', 57, 2, '42.86', '40.18', '0', 4.2, 4.2, '#fff', 1),
(130, '2_58', 58, 2, '42.86', '35', '0', 4.2, 4.2, '#fff', 1),
(131, '2_59', 59, 2, '42.86', '29.82', '0', 4.2, 4.2, '#fff', 1),
(132, '2_60', 60, 2, '42.86', '24.64', '0', 4.2, 4.2, '#fff', 1),
(133, '2_61', 61, 2, '42.86', '19.46', '0', 4.2, 4.2, '#fff', 1),
(134, '2_62', 62, 2, '37.68', '19.46', '0', 4.2, 4.2, '#fff', 1),
(135, '2_63', 63, 2, '37.68', '24.64', '0', 4.2, 4.2, '#EE3B3B', 0),
(136, '2_64', 64, 2, '37.68', '29.82', '0', 4.2, 4.2, '#EE3B3B', 0),
(137, '2_65', 65, 2, '37.68', '35', '0', 4.2, 4.2, '#EE3B3B', 0),
(138, '2_66', 66, 2, '37.68', '40.18', '0', 4.2, 4.2, '#EE3B3B', 0),
(139, '2_67', 67, 2, '35', '3.3', '0', 4.2, 4.2, '#EE3B3B', 0),
(140, '2_68', 68, 2, '40.18', '3.3', '0', 4.2, 4.2, '#EE3B3B', 0),
(141, '2_69', 69, 2, '35', '8.48', '0', 4.2, 4.2, '#EE3B3B', 0),
(142, '2_70', 70, 2, '40.18', '8.48', '0', 4.2, 4.2, '#EE3B3B', 0),
(143, '2_71', 71, 2, '55.72', '3.3', '0', 4.2, 4.2, '#EEDC3B', 0),
(144, '2_72', 72, 2, '60.9', '3.3', '0', 4.2, 4.2, '#EEDC3B', 0),
(145, '2_73', 73, 2, '55.72', '8.48', '0', 4.2, 4.2, '#EEDC3B', 0),
(146, '2_74', 74, 2, '60.9', '8.48', '0', 4.2, 4.2, '#EEDC3B', 0),
(147, '2_75', 75, 2, '35', '86.34', '0', 4.2, 4.2, '#4EEE94', 0),
(148, '2_76', 76, 2, '40.18', '86.34', '0', 4.2, 4.2, '#4EEE94', 0),
(149, '2_77', 77, 2, '35', '91.52', '0', 4.2, 4.2, '#4EEE94', 0),
(150, '2_78', 78, 2, '40.18', '91.52', '0', 4.2, 4.2, '#4EEE94', 0),
(151, '2_79', 79, 2, '55.72', '86.34', '0', 4.2, 4.2, '#3E5BF7', 0),
(152, '2_80', 80, 2, '60.9', '86.34', '0', 4.2, 4.2, '#3E5BF7', 0),
(153, '2_81', 81, 2, '55.72', '91.52', '0', 4.2, 4.2, '#3E5BF7', 0),
(154, '2_82', 82, 2, '60.9', '91.52', '0', 4.2, 4.2, '#3E5BF7', 0),


(155, '4_1', 1, 4, '23.92', '19.46', '0', 4.2, 4.2, '#EE3B3B', 0),
(156, '4_1', 1, 4, '23.92', '19.46', '0', 4.2, 4.2, '#EE3B3B', 0),
(157, '4_2', 2, 4, '23.92', '24.64', '0', 4.2, 4.2, '#fff', 1),
(158, '4_3', 3, 4, '23.92', '29.82', '0', 4.2, 4.2, '#fff', 1),
(159, '4_4', 4, 4, '23.92', '35', '0', 4.2, 4.2, '#fff', 1),
(160, '4_5', 5, 4, '23.92', '40.18', '0', 4.2, 4.2, '#fff', 1),
(161, '4_6', 6, 4, '23.92', '45.36', '0', 4.2, 4.2, '#fff', 1),
(162, '4_7', 7, 4, '23.92', '50.54', '0', 4.2, 4.2, '#fff', 1),
(163, '4_8', 8, 4, '23.92', '55.72', '0', 4.2, 4.2, '#fff', 1),
(164, '4_9', 9, 4, '23.92', '60.9', '0', 4.2, 4.2, '#fff', 1),
(165, '4_10', 10, 4, '23.92', '66.08', '0', 4.2, 4.2, '#fff', 1),
(166, '4_11', 11, 4, '23.92', '71.26', '0', 4.2, 4.2, '#fff', 1),
(167, '4_12', 12, 4, '23.92', '76.44', '0', 4.2, 4.2, '#fff', 1),
(168, '4_13', 13, 4, '29.1', '76.44', '0', 4.2, 4.2, '#fff', 1),
(169, '4_14', 14, 4, '29.1', '71.26', '0', 4.2, 4.2, '#4EEE94', 0),
(170, '4_15', 15, 4, '29.1', '66.08', '0', 4.2, 4.2, '#4EEE94', 0),
(171, '4_16', 16, 4, '29.1', '60.9', '0', 4.2, 4.2, '#4EEE94', 0),
(172, '4_17', 17, 4, '29.1', '55.72', '0', 4.2, 4.2, '#4EEE94', 0),
(173, '4_18', 18, 4, '34.28', '76.44', '0', 4.2, 4.2, '#4EEE94', 0),
(174, '4_19', 19, 4, '34.28', '71.26', '0', 4.2, 4.2, '#fff', 1),
(175, '4_20', 20, 4, '34.28', '66.08', '0', 4.2, 4.2, '#fff', 1),
(176, '4_21', 21, 4, '34.28', '60.9', '0', 4.2, 4.2, '#fff', 1),
(177, '4_22', 22, 4, '34.28', '55.72', '0', 4.2, 4.2, '#fff', 1),
(178, '4_23', 23, 4, '34.28', '55.72', '0', 4.2, 4.2, '#fff', 1),
(179, '4_24', 24, 4, '44.64', '55.72', '0', 4.2, 4.2, '#fff', 1),
(180, '4_25', 25, 4, '44.64', '60.9', '0', 4.2, 4.2, '#fff', 1),
(181, '4_26', 26, 4, '44.64', '66.08', '0', 4.2, 4.2, '#fff', 1),
(182, '4_27', 27, 4, '44.64', '71.26', '0', 4.2, 4.2, '#fff', 1),
(183, '4_28', 28, 4, '44.64', '76.44', '0', 4.2, 4.2, '#fff', 1),
(184, '4_29', 29, 4, '49.82', '76.44', '0', 4.2, 4.2, '#fff', 1),
(185, '4_30', 30, 4, '55', '76.44', '0', 4.2, 4.2, '#3E5BF7', 0),
(186, '4_31', 31, 4, '49.82', '71.26', '0', 4.2, 4.2, '#3E5BF7', 0),
(187, '4_32', 32, 4, '49.82', '66.08', '0', 4.2, 4.2, '#3E5BF7', 0),
(188, '4_33', 33, 4, '49.82', '60.9', '0', 4.2, 4.2, '#3E5BF7', 0),
(189, '4_34', 34, 4, '49.82', '55.72', '0', 4.2, 4.2, '#3E5BF7', 0),
(190, '4_35', 35, 4, '55', '71.26', '0', 4.2, 4.2, '#fff', 1),
(191, '4_36', 36, 4, '55', '66.08', '0', 4.2, 4.2, '#fff', 1),
(192, '4_37', 37, 4, '55', '60.9', '0', 4.2, 4.2, '#fff', 1),
(193, '4_38', 38, 4, '55', '55.72', '0', 4.2, 4.2, '#fff', 1),
(194, '4_39', 39, 4, '39.46', '55.72', '0', 4.2, 4.2, '#fff', 1),
(195, '4_40', 40, 4, '60.18', '55.72', '0', 4.2, 4.2, '#fff', 1),
(196, '4_41', 41, 4, '65.36', '55.72', '0', 4.2, 4.2, '#fff', 1),
(197, '4_42', 42, 4, '65.36', '60.9', '0', 4.2, 4.2, '#fff', 1),
(198, '4_43', 43, 4, '65.36', '66.08', '0', 4.2, 4.2, '#fff', 1),
(199, '4_44', 44, 4, '65.36', '71.26', '0', 4.2, 4.2, '#fff', 1),
(200, '4_45', 45, 4, '65.36', '76.44', '0', 4.2, 4.2, '#fff', 1),
(201, '4_46', 46, 4, '70.54', '76.44', '0', 4.2, 4.2, '#fff', 1),
(202, '4_47', 47, 4, '70.54', '71.26', '0', 4.2, 4.2, '#BB4EEE', 0),
(203, '4_48', 48, 4, '70.54', '66.08', '0', 4.2, 4.2, '#BB4EEE', 0),
(204, '4_49', 49, 4, '70.54', '60.9', '0', 4.2, 4.2, '#BB4EEE', 0),
(205, '4_50', 50, 4, '70.54', '55.72', '0', 4.2, 4.2, '#BB4EEE', 0),
(206, '4_51', 51, 4, '75.72', '76.44', '0', 4.2, 4.2, '#BB4EEE', 0),
(207, '4_52', 52, 4, '75.72', '71.26', '0', 4.2, 4.2, '#fff', 1),
(208, '4_53', 53, 4, '75.72', '66.08', '0', 4.2, 4.2, '#fff', 1),
(209, '4_54', 54, 4, '75.72', '60.9', '0', 4.2, 4.2, '#fff', 1),
(210, '4_55', 55, 4, '75.72', '55.72', '0', 4.2, 4.2, '#fff', 1),
(211, '4_56', 56, 4, '75.72', '50.54', '0', 4.2, 4.2, '#fff', 1),
(212, '4_57', 57, 4, '75.72', '45.36', '0', 4.2, 4.2, '#fff', 1),
(213, '4_58', 58, 4, '75.72', '40.18', '0', 4.2, 4.2, '#fff', 1),
(214, '4_59', 59, 4, '75.72', '35', '0', 4.2, 4.2, '#fff', 1),
(215, '4_60', 60, 4, '75.72', '29.82', '0', 4.2, 4.2, '#fff', 1),
(216, '4_61', 61, 4, '75.72', '24.64', '0', 4.2, 4.2, '#fff', 1),
(217, '4_62', 62, 4, '75.72', '19.46', '0', 4.2, 4.2, '#fff', 1),
(218, '4_63', 63, 4, '70.54', '40.18', '0', 4.2, 4.2, '#3ED6F7', 0),
(219, '4_64', 64, 4, '70.54', '35', '0', 4.2, 4.2, '#3ED6F7', 0),
(220, '4_65', 65, 4, '70.54', '29.82', '0', 4.2, 4.2, '#3ED6F7', 0),
(221, '4_66', 66, 4, '70.54', '24.64', '0', 4.2, 4.2, '#3ED6F7', 0),
(222, '4_67', 67, 4, '70.54', '19.46', '0', 4.2, 4.2, '#fff', 1),
(223, '4_68', 68, 4, '65.36', '40.18', '0', 4.2, 4.2, '#fff', 1),
(224, '4_69', 69, 4, '65.36', '35', '0', 4.2, 4.2, '#fff', 1),
(225, '4_70', 70, 4, '65.36', '29.82', '0', 4.2, 4.2, '#fff', 1),
(226, '4_71', 71, 4, '65.36', '24.64', '0', 4.2, 4.2, '#fff', 1),
(227, '4_72', 72, 4, '65.36', '19.46', '0', 4.2, 4.2, '#3ED6F7', 0),
(228, '4_73', 73, 4, '60.18', '40.18', '0', 4.2, 4.2, '#fff', 1),
(229, '4_74', 74, 4, '55', '40.18', '0', 4.2, 4.2, '#fff', 1),
(230, '4_75', 75, 4, '55', '35', '0', 4.2, 4.2, '#fff', 1),
(231, '4_76', 76, 4, '55', '29.82', '0', 4.2, 4.2, '#fff', 1),
(232, '4_77', 77, 4, '55', '24.64', '0', 4.2, 4.2, '#fff', 1),
(233, '4_78', 78, 4, '55', '19.46', '0', 4.2, 4.2, '#fff', 1),
(234, '4_79', 79, 4, '49.82', '40.18', '0', 4.2, 4.2, '#EEDC3B', 0),
(235, '4_80', 80, 4, '49.82', '35', '0', 4.2, 4.2, '#EEDC3B', 0),
(236, '4_81', 81, 4, '49.82', '29.82', '0', 4.2, 4.2, '#EEDC3B', 0),
(237, '4_82', 82, 4, '49.82', '24.64', '0', 4.2, 4.2, '#EEDC3B', 0),
(238, '4_83', 83, 4, '49.82', '19.46', '0', 4.2, 4.2, '#fff', 1),
(239, '4_84', 84, 4, '44.64', '40.18', '0', 4.2, 4.2, '#fff', 1),
(240, '4_85', 85, 4, '44.64', '35', '0', 4.2, 4.2, '#fff', 1),
(241, '4_86', 86, 4, '44.64', '29.82', '0', 4.2, 4.2, '#fff', 1),
(242, '4_87', 87, 4, '44.64', '24.64', '0', 4.2, 4.2, '#fff', 1),
(243, '4_88', 88, 4, '44.64', '19.46', '0', 4.2, 4.2, '#EEDC3B', 0),
(244, '4_89', 89, 4, '39.46', '40.18', '0', 4.2, 4.2, '#fff', 1),
(245, '4_90', 90, 4, '34.28', '40.18', '0', 4.2, 4.2, '#fff', 1),
(246, '4_91', 91, 4, '34.28', '35', '0', 4.2, 4.2, '#fff', 1),
(247, '4_92', 92, 4, '34.28', '29.82', '0', 4.2, 4.2, '#fff', 1),
(248, '4_93', 93, 4, '34.28', '24.64', '0', 4.2, 4.2, '#fff', 1),
(249, '4_94', 94, 4, '34.28', '19.46', '0', 4.2, 4.2, '#fff', 1),
(250, '4_95', 95, 4, '29.1', '40.18', '0', 4.2, 4.2, '#EE3B3B', 0),
(251, '4_96', 96, 4, '29.1', '35', '0', 4.2, 4.2, '#EE3B3B', 0),
(252, '4_97', 97, 4, '29.1', '29.82', '0', 4.2, 4.2, '#EE3B3B', 0),
(253, '4_98', 98, 4, '29.1', '24.64', '0', 4.2, 4.2, '#EE3B3B', 0),
(254, '4_99', 99, 4, '29.1', '19.46', '0', 4.2, 4.2, '#fff', 1),
(255, '4_100', 100, 4, '26.43', '3.3', '0', 4.2, 4.2, '#EE3B3B', 0),
(256, '4_101', 101, 4, '31.61', '3.3', '0', 4.2, 4.2, '#EE3B3B', 0),
(257, '4_102', 102, 4, '26.43', '8.48', '0', 4.2, 4.2, '#EE3B3B', 0),
(258, '4_103', 103, 4, '31.61', '8.48', '0', 4.2, 4.2, '#EE3B3B', 0),
(259, '4_104', 104, 4, '26.43', '86.34', '0', 4.2, 4.2, '#4EEE94', 0),
(260, '4_105', 105, 4, '31.61', '86.34', '0', 4.2, 4.2, '#4EEE94', 0),
(261, '4_106', 106, 4, '26.43', '91.52', '0', 4.2, 4.2, '#4EEE94', 0),
(262, '4_107', 107, 4, '31.61', '91.52', '0', 4.2, 4.2, '#4EEE94', 0),
(263, '4_108', 108, 4, '45.71', '3.3', '0', 4.2, 4.2, '#EEDC3B', 0),
(264, '4_109', 109, 4, '50.89', '3.3', '0', 4.2, 4.2, '#EEDC3B', 0),
(265, '4_110', 110, 4, '45.71', '8.48', '0', 4.2, 4.2, '#EEDC3B', 0),
(266, '4_111', 111, 4, '50.89', '8.48', '0', 4.2, 4.2, '#EEDC3B', 0),
(267, '4_112', 112, 4, '45.71', '86.34', '0', 4.2, 4.2, '#3E5BF7', 0),
(268, '4_113', 113, 4, '50.89', '86.34', '0', 4.2, 4.2, '#3E5BF7', 0),
(269, '4_114', 114, 4, '45.71', '91.52', '0', 4.2, 4.2, '#3E5BF7', 0),
(270, '4_115', 115, 4, '50.89', '91.52', '0', 4.2, 4.2, '#3E5BF7', 0),
(271, '4_116', 116, 4, '66.69', '3.3', '0', 4.2, 4.2, '#3ED6F7', 0),
(272, '4_117', 117, 4, '71.87', '3.3', '0', 4.2, 4.2, '#3ED6F7', 0),
(273, '4_118', 118, 4, '66.69', '8.48', '0', 4.2, 4.2, '#3ED6F7', 0),
(274, '4_119', 119, 4, '71.87', '8.48', '0', 4.2, 4.2, '#3ED6F7', 0),
(275, '4_120', 120, 4, '71.87', '86.34', '0', 4.2, 4.2, '#BB4EEE', 0),
(276, '4_121', 121, 4, '66.69', '86.34', '0', 4.2, 4.2, '#BB4EEE', 0),
(277, '4_122', 122, 4, '71.87', '91.52', '0', 4.2, 4.2, '#BB4EEE', 0),
(278, '4_123', 123, 4, '66.69', '91.52', '0', 4.2, 4.2, '#BB4EEE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `polje_pravilo_narucitelj`
--

CREATE TABLE `polje_pravilo_narucitelj` (
  `id` int(11) NOT NULL,
  `pravilo` int(11) DEFAULT NULL,
  `polje` int(11) DEFAULT NULL,
  `narucitelj` int(11) DEFAULT NULL,
  `oblik_ploce` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polje_pravilo_narucitelj`
--

INSERT INTO `polje_pravilo_narucitelj` (`id`, `pravilo`, `polje`, `narucitelj`, `oblik_ploce`) VALUES
(1, 2, 20, 1, 1),
(2, 1, 2, 1, 1),
(3, 4, 72, 1, 1),
(4, 2, 72, 1, 1),
(5, 3, 72, 1, 1),
(6, 4, 72, 1, 1),
(7, 3, 72, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pravilo`
--

CREATE TABLE `pravilo` (
  `id` int(11) NOT NULL,
  `naziv` varchar(100) DEFAULT NULL,
  `opis` text,
  `tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pravilo`
--

INSERT INTO `pravilo` (`id`, `naziv`, `opis`, `tag`) VALUES
(1, 'Izbaci 2 igrača po izboru', 'Odaberi koja dva igrača želiš izbaciti. Također možeš izbaciti dvije figurice jednog igrača', 'default'),
(2, 'Svi igrači 2 koraka naprijed', 'Svaki igrač se mora pomaknuti 2 koraka naprijed', 'default'),
(3, 'Bacaj ponovno 2x', '2 puta baci ponovno', 'default'),
(4, 'Popij pivo', '2 puta baci ponovno', 'custom'),
(5, 'Bacaj ponovno', 'Baci ponovno', 'custom'),
(6, 'Idi 3 koraka nazad', 'Idi 3 koraka nazad', 'custom'),
(7, 'Idi u kućicu', 'Idi u kućicu', 'custom'),
(8, '3 figure u polju, 1 izbaci', '3 figure u polju, 1 izbaci', 'custom'),
(9, '1 figura u polju, 1 na polje', '1 figura u polju, 1 na polje', 'custom'),
(10, '3 figure u polju, 1 izbaci', '3 figure u polju, 1 izbaci', 'custom'),
(11, '4 figure u polju, 2 u kućicu', '4 figure u polju, 2 u kućicu ', 'custom'),
(12, '3 figure u polju, 1 u kućicu', '3 figure u polju, 1 u kućicu', 'custom'),
(13, 'Propusti 1 krug', 'Propusti 1 krug', 'custom'),
(14, '2 figure u polju, 1 u polje', '2 figure u polju, 1 u polje', 'custom'),
(15, '4 figure u polju, 2 izbaci', '4 figure u polju, 2 izbaci', 'custom'),
(16, 'Izbaci igrača po izboru', 'Izbaci igrača po izboru', 'custom'),
(17, 'Izbaci 2 igrača po izboru', 'Izbaci 2 igrača po izboru', 'custom'),
(18, 'Svi igrači 4 koraka naprijed', 'Svi igrači 4 koraka naprijed', 'custom'),
(19, 'Izbaci igrača ispred sebe', 'Izbaci igrača ispred sebe', 'custom'),
(20, 'Svi igrači 3 koraka naprijed', 'Svi igrači 3 koraka naprijed', 'custom'),
(21, 'Propusti 4 kruga', 'Propusti 4 kruga', 'custom'),
(22, 'Idi 3 koraka naprijed', 'Idi 3 koraka naprijed', 'custom'),
(23, 'Propusti 3 kruga', 'Propusti 3 kruga', 'custom'),
(24, 'Svi igrači 2 koraka naprijed', 'Svi igrači 2 koraka naprijed', 'custom'),
(25, 'Svi igrači 4 koraka nazad', 'Svi igrači 4 koraka nazad', 'custom'),
(26, 'Svi igrači 3 koraka nazad', 'Svi igrači 3 koraka nazad', 'custom'),
(27, 'Svi igrači 1 korak nazad', 'Svi igrači 1 korak nazad', 'custom'),
(28, 'Svi igrači 2 koraka nazad', 'Svi igrači 2 koraka nazad', 'custom'),
(29, 'Izbaci svog igrača', 'Izbaci svog igrača', 'custom'),
(30, 'Svi igrači 1 korak naprijed', 'Svi igrači 1 korak naprijed', 'custom'),
(31, 'Bingo! 20 koraka naprijed!', 'Bingo! 20 koraka naprijed!', 'custom'),
(32, 'Izvedi sve figure u polje', 'Izvedi sve figure u polje', 'custom'),
(33, 'Sve figure u polju u kućicu', 'Sve figure u polju u kućicu', 'custom'),
(34, '1 figurica iz kućice', '1 figurica iz kućice', 'custom');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `broj_igraca`
--
ALTER TABLE `broj_igraca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `figurice`
--
ALTER TABLE `figurice`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `narucitelj`
--
ALTER TABLE `narucitelj`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `narudzba`
--
ALTER TABLE `narudzba`
  ADD PRIMARY KEY (`id`),
  ADD KEY `narucitelj` (`narucitelj`),
  ADD KEY `broj_igraca` (`broj_igraca`),
  ADD KEY `oblik_ploce` (`oblik_ploce`),
  ADD KEY `figurice` (`figurice`),
  ADD KEY `ploca` (`ploca`);

--
-- Indexes for table `oblik_ploce`
--
ALTER TABLE `oblik_ploce`
  ADD PRIMARY KEY (`id`),
  ADD KEY `broj_igraca` (`broj_igraca`);

--
-- Indexes for table `ploca`
--
ALTER TABLE `ploca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polja_ploca`
--
ALTER TABLE `polja_ploca`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polje_pravilo_narucitelj`
--
ALTER TABLE `polje_pravilo_narucitelj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `polje` (`polje`),
  ADD KEY `pravilo` (`pravilo`),
  ADD KEY `narucitelj` (`narucitelj`),
  ADD KEY `oblik_ploce` (`oblik_ploce`);

--
-- Indexes for table `pravilo`
--
ALTER TABLE `pravilo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `broj_igraca`
--
ALTER TABLE `broj_igraca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `figurice`
--
ALTER TABLE `figurice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;



--
-- AUTO_INCREMENT for table `narucitelj`
--
ALTER TABLE `narucitelj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `narudzba`
--
ALTER TABLE `narudzba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oblik_ploce`
--
ALTER TABLE `oblik_ploce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ploca`
--
ALTER TABLE `ploca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `polja_ploca`
--
ALTER TABLE `polja_ploca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `polje_pravilo_narucitelj`
--
ALTER TABLE `polje_pravilo_narucitelj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pravilo`
--
ALTER TABLE `pravilo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `narudzba`
--
ALTER TABLE `narudzba`
  ADD CONSTRAINT `narudzba_ibfk_1` FOREIGN KEY (`narucitelj`) REFERENCES `narucitelj` (`id`),
  ADD CONSTRAINT `narudzba_ibfk_2` FOREIGN KEY (`broj_igraca`) REFERENCES `broj_igraca` (`id`),
  ADD CONSTRAINT `narudzba_ibfk_3` FOREIGN KEY (`oblik_ploce`) REFERENCES `oblik_ploce` (`id`),
  ADD CONSTRAINT `narudzba_ibfk_5` FOREIGN KEY (`figurice`) REFERENCES `figurice` (`id`),
  ADD CONSTRAINT `narudzba_ibfk_6` FOREIGN KEY (`ploca`) REFERENCES `ploca` (`id`);

--
-- Constraints for table `oblik_ploce`
--
ALTER TABLE `oblik_ploce`
  ADD CONSTRAINT `oblik_ploce_ibfk_1` FOREIGN KEY (`broj_igraca`) REFERENCES `broj_igraca` (`id`);

--
-- Constraints for table `polje_pravilo_narucitelj`
--
ALTER TABLE `polje_pravilo_narucitelj`
  ADD CONSTRAINT `polje_pravilo_narucitelj_ibfk_1` FOREIGN KEY (`polje`) REFERENCES `polja_ploca` (`id`),
  ADD CONSTRAINT `polje_pravilo_narucitelj_ibfk_2` FOREIGN KEY (`pravilo`) REFERENCES `pravilo` (`id`),
  ADD CONSTRAINT `polje_pravilo_narucitelj_ibfk_3` FOREIGN KEY (`narucitelj`) REFERENCES `narucitelj` (`id`),
  ADD CONSTRAINT `polje_pravilo_narucitelj_ibfk_4` FOREIGN KEY (`narucitelj`) REFERENCES `narucitelj` (`id`),
  ADD CONSTRAINT `polje_pravilo_narucitelj_ibfk_5` FOREIGN KEY (`oblik_ploce`) REFERENCES `oblik_ploce` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
