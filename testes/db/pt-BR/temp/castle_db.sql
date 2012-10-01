--
-- Estrutura da tabela `castle_db`
--

CREATE TABLE IF NOT EXISTS `castle_db` (
  `castle_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `map_name` text NOT NULL,
  `name` text NOT NULL,
  `label` text NOT NULL,
  `flag` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`castle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `castle_db`
--

INSERT INTO `castle_db` (`castle_id`, `map_name`, `name`, `label`, `flag`) VALUES
(4, 'aldeg_cas05', 'Acrux', 'Agit#aldeg_cas05', 1),
(3, 'aldeg_cas04', 'Rigel', 'Agit#aldeg_cas04', 1),
(2, 'aldeg_cas03', 'Canopus', 'Agit#aldeg_cas03', 1),
(1, 'aldeg_cas02', 'Astrum', 'Agit#aldeg_cas02', 1),
(0, 'aldeg_cas01', 'Sirius', 'Agit#aldeg_cas01', 1),
(5, 'gefg_cas01', 'Arsulf', 'Agit#gefg_cas01', 1),
(6, 'gefg_cas02', 'Trapesac', 'Agit#gefg_cas02', 1),
(7, 'gefg_cas03', 'Ruaden', 'Agit#gefg_cas03', 1),
(8, 'gefg_cas04', 'Saffran', 'Agit#gefg_cas04', 1),
(9, 'gefg_cas05', 'Arima', 'Agit#gefg_cas05', 1),
(10, 'payg_cas01', 'Palácio do Sol', 'Agit#payg_cas01', 1),
(11, 'payg_cas02', 'Palácio do Lago Sagrado', 'Agit#payg_cas02', 1),
(12, 'payg_cas03', 'Palácio da Sombra', 'Agit#payg_cas03', 1),
(13, 'payg_cas04', 'Palácio Escarlate', 'Agit#payg_cas04', 1),
(14, 'payg_cas05', 'Palácio da Colina', 'Agit#payg_cas05', 1),
(15, 'prtg_cas01', 'Kriemhild', 'Agit#prtg_cas01', 1),
(16, 'prtg_cas02', 'Hrist', 'Agit#prtg_cas02', 1),
(17, 'prtg_cas03', 'Brynhildr', 'Agit#prtg_cas03', 1),
(18, 'prtg_cas04', 'Skoegul', 'Agit#prtg_cas04', 1),
(19, 'prtg_cas05', 'Gondul', 'Agit#prtg_cas05', 1),
(20, 'nguild_alde', 'Terra', 'Agit_N01', 2),
(21, 'nguild_gef', 'Vento', 'Agit_N02', 2),
(22, 'nguild_pay', 'Água', 'Agit_N03', 2),
(23, 'nguild_prt', 'Fogo', 'Agit_N04', 2),
(24, 'schg_cas01', 'Himinn', 'Agit_Sc01', 1),
(25, 'schg_cas02', 'Andlangr', 'Agit_Sc02', 1),
(26, 'schg_cas03', 'Viblainn', 'Agit_Sc03', 1),
(27, 'schg_cas04', 'Hljod', 'Agit_Sc04', 1),
(28, 'schg_cas05', 'Skatyrnir', 'Agit_Sc05', 1),
(29, 'arug_cas01', 'Mardol', 'Agit_Ar01', 1),
(30, 'arug_cas02', 'Syr', 'Agit_Ar02', 1),
(31, 'arug_cas03', 'Horn', 'Agit_Ar03', 1),
(32, 'arug_cas04', 'Gefn', 'Agit_Ar04', 1),
(33, 'arug_cas05', 'Vanadis', 'Agit_Ar05', 1);
