-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 23 Oca 2022, 20:20:21
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `datenbank_fur_gesundheitklinik`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `arzt`
--

CREATE TABLE `arzt` (
  `personal_ID` int(8) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `bereich` varchar(100) NOT NULL,
  `tc_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `arzt`
--

INSERT INTO `arzt` (`personal_ID`, `vorname`, `nachname`, `bereich`, `tc_nr`) VALUES
(1, 'mehmet', 'karasakal', 'dahiliye', 1),
(2, 'ahmet', 'kızıl', 'kbb', 2),
(3, 'ahmet', 'yıldız', 'beyin', 3),
(4, 'mert', 'nasip', 'kbb', 4),
(5, 'teoman', 'turan', 'kalp', 5),
(6, 'bahadır', 'akgün', 'kalp', 6),
(7, 'selin', 'yılmaz', 'dahiliye', 7),
(8, 'meltem', 'kaya', '', 8),
(9, 'şebnem', 'kaya', 'diş', 9),
(10, 'ezel', 'kuyu', '', 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `krankenschwester`
--

CREATE TABLE `krankenschwester` (
  `personal_id` int(8) NOT NULL,
  `tc_nr` int(11) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `krankenschwester`
--

INSERT INTO `krankenschwester` (`personal_id`, `tc_nr`, `vorname`, `nachname`) VALUES
(11, 11, 'mehmet', 'arı'),
(12, 12, 'selim', 'tunç'),
(13, 13, 'bülent', 'necmi'),
(14, 14, 'yılmaz', 'sarı'),
(15, 15, 'necmi', 'barış'),
(16, 16, 'barış', 'kurt'),
(17, 17, 'selma', 'açı'),
(18, 18, 'zülfiye', 'haras'),
(19, 19, 'emine', 'nam'),
(20, 20, 'zeynep', 'çanak');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `krankenschwestervonarzt`
--

CREATE TABLE `krankenschwestervonarzt` (
  `id` int(100) NOT NULL,
  `krankenschwester` int(8) NOT NULL,
  `arzt` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `krankenschwestervonarzt`
--

INSERT INTO `krankenschwestervonarzt` (`id`, `krankenschwester`, `arzt`) VALUES
(1, 11, 1),
(2, 12, 2),
(3, 14, 3),
(4, 15, 4),
(5, 16, 6),
(6, 19, 8),
(7, 20, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `medikament`
--

CREATE TABLE `medikament` (
  `produkt_nr` int(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `menge` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `medikament`
--

INSERT INTO `medikament` (`produkt_nr`, `name`, `menge`) VALUES
(1, 'aspirin', 65),
(2, 'dolven', 100),
(3, 'calpol', 254),
(4, 'iburamin', 200),
(5, 'teraflu', 3),
(6, 'majezik', 33),
(7, 'glipix', 76),
(8, 'zarax', 0),
(9, 'cataflam', 1),
(10, 'galvus', 176);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `medikamentvonpatient`
--

CREATE TABLE `medikamentvonpatient` (
  `id` int(100) NOT NULL,
  `patient` int(11) NOT NULL,
  `medikament` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `medikamentvonpatient`
--

INSERT INTO `medikamentvonpatient` (`id`, `patient`, `medikament`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 3, 5),
(8, 4, 4),
(5, 5, 4),
(9, 6, 2),
(7, 8, 4),
(6, 8, 5),
(10, 10, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(8) NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT NULL,
  `tc_nr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `patient`
--

INSERT INTO `patient` (`patient_id`, `vorname`, `nachname`, `tc_nr`) VALUES
(1, 'mehmet', 'kanarya', 21),
(2, 'necmi', 'arslan', 22),
(3, 'mecit', 'nas', 23),
(4, 'özlem', 'imir', 24),
(5, 'ünal', 'imir', 25),
(6, 'gülten', 'imir', 26),
(7, 'doruk', 'şanlı', 27),
(8, 'seda', 'saklı', 28),
(9, 'defne', 'kiraz', 29),
(10, 'hüseyin', 'çanak', 30),
(11, 'kamil', 'tan', 31);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `patientenvonarzt`
--

CREATE TABLE `patientenvonarzt` (
  `id` int(100) NOT NULL,
  `patient` int(11) NOT NULL,
  `arzt` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `patientenvonarzt`
--

INSERT INTO `patientenvonarzt` (`id`, `patient`, `arzt`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 2),
(5, 5, 2),
(6, 6, 3),
(7, 7, 5),
(8, 8, 6),
(9, 9, 7),
(10, 10, 8),
(11, 11, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `raum`
--

CREATE TABLE `raum` (
  `raum_nr` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `raum`
--

INSERT INTO `raum` (`raum_nr`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `raumvonarzt`
--

CREATE TABLE `raumvonarzt` (
  `id` int(100) NOT NULL,
  `raum` int(3) NOT NULL,
  `arzt` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `raumvonarzt`
--

INSERT INTO `raumvonarzt` (`id`, `raum`, `arzt`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(5, 13, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `raumvonkrankenschwester`
--

CREATE TABLE `raumvonkrankenschwester` (
  `id` int(100) NOT NULL,
  `krankenschwester` int(8) NOT NULL,
  `raum` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `raumvonkrankenschwester`
--

INSERT INTO `raumvonkrankenschwester` (`id`, `krankenschwester`, `raum`) VALUES
(1, 11, 1),
(2, 12, 2),
(8, 13, 11),
(3, 14, 3),
(4, 15, 4),
(5, 16, 6),
(9, 17, 11),
(10, 18, 12),
(6, 19, 8),
(7, 20, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `zertifikaten`
--

CREATE TABLE `zertifikaten` (
  `zertifikat_id` int(4) NOT NULL,
  `zertifikat_name` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `zertifikaten`
--

INSERT INTO `zertifikaten` (`zertifikat_id`, `zertifikat_name`) VALUES
(1, 'Z1'),
(2, 'Z2'),
(3, 'Z3');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `zertifikatvonarzt`
--

CREATE TABLE `zertifikatvonarzt` (
  `id` int(100) NOT NULL,
  `arzt` int(8) NOT NULL,
  `zertifikat` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `zertifikatvonarzt`
--

INSERT INTO `zertifikatvonarzt` (`id`, `arzt`, `zertifikat`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 3),
(6, 3, 1),
(7, 4, 2),
(8, 7, 3),
(9, 9, 2),
(10, 10, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `zertifikatvonmedikamenten`
--

CREATE TABLE `zertifikatvonmedikamenten` (
  `id` int(100) NOT NULL,
  `produkt` int(16) NOT NULL,
  `zertifikat` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `zertifikatvonmedikamenten`
--

INSERT INTO `zertifikatvonmedikamenten` (`id`, `produkt`, `zertifikat`) VALUES
(1, 1, 1),
(2, 2, 3),
(5, 3, 2),
(3, 4, 1),
(4, 5, 3),
(6, 6, 2),
(7, 7, 1),
(8, 8, 3),
(9, 9, 2),
(10, 10, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `arzt`
--
ALTER TABLE `arzt`
  ADD PRIMARY KEY (`personal_ID`);

--
-- Tablo için indeksler `krankenschwester`
--
ALTER TABLE `krankenschwester`
  ADD PRIMARY KEY (`personal_id`);

--
-- Tablo için indeksler `krankenschwestervonarzt`
--
ALTER TABLE `krankenschwestervonarzt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `krankenschwester` (`krankenschwester`,`arzt`),
  ADD KEY `arzt` (`arzt`);

--
-- Tablo için indeksler `medikament`
--
ALTER TABLE `medikament`
  ADD PRIMARY KEY (`produkt_nr`);

--
-- Tablo için indeksler `medikamentvonpatient`
--
ALTER TABLE `medikamentvonpatient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient` (`patient`,`medikament`),
  ADD KEY `medikament` (`medikament`);

--
-- Tablo için indeksler `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Tablo için indeksler `patientenvonarzt`
--
ALTER TABLE `patientenvonarzt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient` (`patient`,`arzt`),
  ADD KEY `arzt` (`arzt`);

--
-- Tablo için indeksler `raum`
--
ALTER TABLE `raum`
  ADD PRIMARY KEY (`raum_nr`);

--
-- Tablo için indeksler `raumvonarzt`
--
ALTER TABLE `raumvonarzt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raum` (`raum`,`arzt`);

--
-- Tablo için indeksler `raumvonkrankenschwester`
--
ALTER TABLE `raumvonkrankenschwester`
  ADD PRIMARY KEY (`id`),
  ADD KEY `krankenschwester` (`krankenschwester`,`raum`),
  ADD KEY `raum` (`raum`);

--
-- Tablo için indeksler `zertifikaten`
--
ALTER TABLE `zertifikaten`
  ADD PRIMARY KEY (`zertifikat_id`);

--
-- Tablo için indeksler `zertifikatvonarzt`
--
ALTER TABLE `zertifikatvonarzt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arzt` (`arzt`,`zertifikat`),
  ADD KEY `zertifikat` (`zertifikat`);

--
-- Tablo için indeksler `zertifikatvonmedikamenten`
--
ALTER TABLE `zertifikatvonmedikamenten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produkt` (`produkt`,`zertifikat`),
  ADD KEY `zertifikat` (`zertifikat`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `arzt`
--
ALTER TABLE `arzt`
  MODIFY `personal_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `krankenschwester`
--
ALTER TABLE `krankenschwester`
  MODIFY `personal_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `krankenschwestervonarzt`
--
ALTER TABLE `krankenschwestervonarzt`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `medikament`
--
ALTER TABLE `medikament`
  MODIFY `produkt_nr` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `medikamentvonpatient`
--
ALTER TABLE `medikamentvonpatient`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `patientenvonarzt`
--
ALTER TABLE `patientenvonarzt`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `raum`
--
ALTER TABLE `raum`
  MODIFY `raum_nr` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Tablo için AUTO_INCREMENT değeri `raumvonarzt`
--
ALTER TABLE `raumvonarzt`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `raumvonkrankenschwester`
--
ALTER TABLE `raumvonkrankenschwester`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `zertifikaten`
--
ALTER TABLE `zertifikaten`
  MODIFY `zertifikat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `zertifikatvonarzt`
--
ALTER TABLE `zertifikatvonarzt`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `zertifikatvonmedikamenten`
--
ALTER TABLE `zertifikatvonmedikamenten`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `krankenschwestervonarzt`
--
ALTER TABLE `krankenschwestervonarzt`
  ADD CONSTRAINT `krankenschwestervonarzt_ibfk_1` FOREIGN KEY (`arzt`) REFERENCES `arzt` (`personal_ID`),
  ADD CONSTRAINT `krankenschwestervonarzt_ibfk_2` FOREIGN KEY (`krankenschwester`) REFERENCES `krankenschwester` (`personal_id`);

--
-- Tablo kısıtlamaları `medikamentvonpatient`
--
ALTER TABLE `medikamentvonpatient`
  ADD CONSTRAINT `medikamentvonpatient_ibfk_1` FOREIGN KEY (`medikament`) REFERENCES `medikament` (`produkt_nr`),
  ADD CONSTRAINT `medikamentvonpatient_ibfk_2` FOREIGN KEY (`patient`) REFERENCES `patient` (`patient_id`);

--
-- Tablo kısıtlamaları `patientenvonarzt`
--
ALTER TABLE `patientenvonarzt`
  ADD CONSTRAINT `patientenvonarzt_ibfk_1` FOREIGN KEY (`patient`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `patientenvonarzt_ibfk_2` FOREIGN KEY (`arzt`) REFERENCES `arzt` (`personal_ID`);

--
-- Tablo kısıtlamaları `raumvonarzt`
--
ALTER TABLE `raumvonarzt`
  ADD CONSTRAINT `raumvonarzt_ibfk_1` FOREIGN KEY (`raum`) REFERENCES `raum` (`raum_nr`);

--
-- Tablo kısıtlamaları `raumvonkrankenschwester`
--
ALTER TABLE `raumvonkrankenschwester`
  ADD CONSTRAINT `raumvonkrankenschwester_ibfk_1` FOREIGN KEY (`raum`) REFERENCES `raum` (`raum_nr`),
  ADD CONSTRAINT `raumvonkrankenschwester_ibfk_2` FOREIGN KEY (`krankenschwester`) REFERENCES `krankenschwester` (`personal_id`);

--
-- Tablo kısıtlamaları `zertifikatvonarzt`
--
ALTER TABLE `zertifikatvonarzt`
  ADD CONSTRAINT `zertifikatvonarzt_ibfk_1` FOREIGN KEY (`arzt`) REFERENCES `arzt` (`personal_ID`),
  ADD CONSTRAINT `zertifikatvonarzt_ibfk_2` FOREIGN KEY (`zertifikat`) REFERENCES `zertifikaten` (`zertifikat_id`);

--
-- Tablo kısıtlamaları `zertifikatvonmedikamenten`
--
ALTER TABLE `zertifikatvonmedikamenten`
  ADD CONSTRAINT `zertifikatvonmedikamenten_ibfk_1` FOREIGN KEY (`zertifikat`) REFERENCES `zertifikaten` (`zertifikat_id`),
  ADD CONSTRAINT `zertifikatvonmedikamenten_ibfk_2` FOREIGN KEY (`produkt`) REFERENCES `medikament` (`produkt_nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
