

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

--
-- Table structure for table `fotografija`
--

CREATE TABLE `fotografija` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) DEFAULT NULL,
  `slika` varchar(50) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fotografija`
--

INSERT INTO `fotografija` (`id`, `naziv`, `slika`, `tag`) VALUES
(1, 'Prvi background', 'prvi_background.png', 'default'),
(2, 'Drugi background', 'drugi_background.png', 'default'),
(3, 'Treci background', 'treci_background.png', 'default'),
(4, 'Custom background', 'custom_background.png', 'custom'),
(5, 'Cetvrti background', 'prvi_background.png', 'default'),
(6, 'Peti background', 'drugi_background.png', 'default'),
(7, 'Sesti background', 'treci_background.png', 'default'),
(8, 'Custom background', 'custom_background.png', 'custom');

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
  `fotografija` int(11) DEFAULT NULL,
  `figurice` int(11) DEFAULT NULL,
  `ploca` int(11) DEFAULT NULL,
  `dostava` varchar(50) DEFAULT NULL,
  `placanje` varchar(50) DEFAULT NULL,
  `datum` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `narudzba`
--

INSERT INTO `narudzba` (`id`, `narucitelj`, `broj_igraca`, `oblik_ploce`, `fotografija`, `figurice`, `ploca`, `dostava`, `placanje`, `datum`) VALUES
(1, 2, 1, 1, 1, 2, 1, 'Pošta', 'Pouzeće', NULL);

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
(3, 'Šest igrača, zvijezda', 1, '2_6_zvijezda.png', 66),
(4, 'Šest igrača, ploha', 1, '2_6_ploha.png', 74),
(5, 'Osam igrača, zvijezda', 1, '2_8_zvijezda.png', 88),
(6, 'Osam igrača, ploha', 1, '2_8_ploha.png', 98),
(7, 'Deset igrača, zvijezda', 1, '2_10_zvijezda.png', 110),
(8, 'Deset igrača, ploha', 1, '2_10_ploha.png', 122);

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
  `visina` int(11) DEFAULT NULL,
  `sirina` int(11) DEFAULT NULL,
  `boja_pozadine` varchar(10) DEFAULT NULL,
  `dodavanje_pravila` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polja_ploca`
--

INSERT INTO `polja_ploca` (`id`, `naziv`, `broj_polja`, `oblik_ploce`, `x_kordinata`, `y_kordinata`, `kut`, `visina`, `sirina`, `boja_pozadine`, `dodavanje_pravila`) VALUES
(1, '1_1', 1, 1, '2.4', '37.7', '0', 7, 7, '#000', 1),
(2, '1_2', 2, 1, '10.9', '37.7', '0', 7, 7, '#000', 1),
(3, '1_3', 3, 1, '19.4', '37.7', '0', 7, 7, '#000', 1),
(4, '1_4', 4, 1, '27.9', '37.7', '0', 7, 7, '#000', 1),
(5, '1_5', 5, 1, '36.4', '37.7', '90', 7, 7, '#000', 1),
(6, '1_6', 6, 1, '36.4', '29.2', '90', 7, 7, '#000', 1),
(7, '1_7', 7, 1, '36.4', '20.7', '90', 7, 7, '#000', 1),
(8, '1_8', 8, 1, '36.4', '12.2', '90', 7, 7, '#000', 1),
(9, '1_9', 9, 1, '36.4', '3.7', '90', 7, 7, '#EE3B3B', 1),
(10, '1_10', 10, 1, '44.9', '3.7', '90', 7, 7, '#000', 1),
(11, '1_11', 11, 1, '53.4', '3.7', '90', 7, 7, '#000', 0),
(12, '1_12', 12, 1, '53.4', '12.2', '90', 7, 7, '#000', 1),
(13, '1_13', 13, 1, '53.4', '20.7', '90', 7, 7, '#000', 1),
(14, '1_14', 14, 1, '53.4', '29.2', '90', 7, 7, '#000', 1),
(15, '1_15', 15, 1, '53.4', '37.7', '90', 7, 7, '#000', 1),
(16, '1_16', 16, 1, '61.9', '37.7', '180', 7, 7, '#000', 1),
(17, '1_17', 17, 1, '70.4', '37.7', '180', 7, 7, '#000', 1),
(18, '1_18', 18, 1, '78.9', '37.7', '180', 7, 7, '#000', 1),
(19, '1_19', 19, 1, '87.4', '37.7', '180', 7, 7, '#3E5BF7', 1),
(20, '1_20', 20, 1, '87.4', '54.7', '180', 7, 7, '#000', 1),
(21, '1_21', 21, 1, '87.4', '46.2', '180', 7, 7, '#000', 0),
(22, '1_22', 22, 1, '78.9', '54.7', '180', 7, 7, '#000', 1),
(23, '1_23', 23, 1, '70.4', '54.7', '180', 7, 7, '#000', 1),
(24, '1_24', 24, 1, '61.9', '54.7', '180', 7, 7, '#000', 1),
(25, '1_25', 25, 1, '53.4', '54.7', '270', 7, 7, '#000', 1),
(26, '1_26', 26, 1, '53.4', '63.2', '270', 7, 7, '#000', 1),
(27, '1_27', 27, 1, '53.4', '71.7', '270', 7, 7, '#000', 1),
(28, '1_28', 28, 1, '53.4', '80.2', '270', 7, 7, '#000', 1),
(29, '1_29', 29, 1, '53.4', '88.7', '270', 7, 7, '#EEDC3B', 1),
(30, '1_30', 30, 1, '44.9', '88.7', '270', 7, 7, '#000', 1),
(31, '1_31', 31, 1, '36.4', '88.7', '270', 7, 7, '#000', 0),
(32, '1_32', 32, 1, '36.4', '80.2', '270', 7, 7, '#000', 1),
(33, '1_33', 33, 1, '36.4', '71.7', '270', 7, 7, '#000', 1),
(34, '1_34', 34, 1, '36.4', '63.2', '270', 7, 7, '#000', 1),
(35, '1_35', 35, 1, '36.4', '54.7', '270', 7, 7, '#000', 1),
(36, '1_36', 36, 1, '27.9', '54.7', '0', 7, 7, '#000', 1),
(37, '1_37', 37, 1, '19.4', '54.7', '0', 7, 7, '#000', 1),
(38, '1_38', 38, 1, '10.9', '54.7', '0', 7, 7, '#000', 1),
(39, '1_39', 39, 1, '2.4', '54.7', '0', 7, 7, '#4EEE94', 1),
(40, '1_40', 40, 1, '2.4', '46.2', '0', 7, 7, '#000', 1),
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
(72, '1_72', 72, 1, '44.9', '54.7', '0', 7, 7, '#EEDC3B', 0);

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
(4, 'Popij pivo', '2 puta baci ponovno', 'custom');

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
-- Indexes for table `fotografija`
--
ALTER TABLE `fotografija`
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
  ADD KEY `fotografija` (`fotografija`),
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
-- AUTO_INCREMENT for table `fotografija`
--
ALTER TABLE `fotografija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `narudzba_ibfk_4` FOREIGN KEY (`fotografija`) REFERENCES `fotografija` (`id`),
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
