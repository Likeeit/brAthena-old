--
-- Estrutura da tabela `abra_db`
--

CREATE TABLE IF NOT EXISTS `abra_db` (
  `skill_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `reqlevel` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rate` smallint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`skill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `abra_db`
--

INSERT INTO `abra_db` (`skill_id`, `name`, `reqlevel`, `rate`) VALUES
(19, 'Lanças de Fogo', 1, 5000),
(18, 'Barreira de Fogo', 4, 5000),
(17, 'Bola de Fogo', 2, 5000),
(16, 'Petrificar', 1, 5000),
(15, 'Rajada Congelante', 2, 5000),
(14, 'Lanças de Gelo', 1, 5000),
(13, 'Espíritos Anciões', 2, 5000),
(12, 'Escudo Mágico', 4, 5000),
(11, 'Ataque Espiritual', 1, 5000),
(10, 'Chama Reveladora', 1, 5000),
(5, 'Golpe Fulminante', 1, 5000),
(6, 'Provocar', 1, 5000),
(7, 'Impacto Explosivo', 1, 5000),
(8, 'Vigor', 1, 5000),
(20, 'Relâmpago', 1, 5000),
(21, 'Tempestade de Raios', 2, 5000),
(24, 'Revelação', 1, 5000),
(25, 'Escudo Sagrado', 6, 5000),
(26, 'Teleporte', 2, 5000),
(27, 'Portal', 4, 5000),
(28, 'Curar', 1, 5000),
(29, 'Aumentar Agilidade', 2, 5000),
(30, 'Diminuir Agilidade', 4, 5000),
(31, 'Aqua Benedicta', 1, 5000),
(32, 'Signum Crusis', 1, 5000),
(33, 'Angelus', 1, 5000),
(34, 'Bênção', 2, 5000),
(35, 'Medicar', 1, 5000),
(40, 'Identificar Item', 1, 5000),
(41, 'Comércio', 4, 5000),
(42, 'Mammonita', 1, 5000),
(45, 'Concentração', 4, 5000),
(46, 'Rajada de Flechas', 1, 5000),
(47, 'Chuva de Flechas', 2, 5000),
(50, 'Furto', 2, 5000),
(51, 'Esconderijo', 2, 5000),
(52, 'Envenenar', 1, 5000),
(53, 'Desintoxicar', 1, 5000),
(54, 'Ressuscitar', 1, 5000),
(56, 'Perfurar', 2, 4000),
(57, 'Brandir Lança', 6, 4000),
(58, 'Estocada', 1, 4000),
(59, 'Lança Bumerangue', 4, 4000),
(60, 'Rapidez com Duas Mãos', 1, 4000),
(61, 'Contra-Ataque', 2, 4000),
(62, 'Impacto de Tyr', 6, 4000),
(66, 'Impositio Manus', 1, 4000),
(67, 'Suffragium', 2, 4000),
(68, 'Aspersio', 2, 4000),
(69, 'B.S. Sacramenti', 4, 4000),
(70, 'Santuário', 2, 4000),
(71, 'Retardar Veneno', 1, 4000),
(72, 'Graça Divina', 1, 4000),
(73, 'Kyrie Eleison', 2, 4000),
(74, 'Magnificat', 2, 4000),
(75, 'Gloria', 4, 4000),
(76, 'Lex Divina', 2, 4000),
(77, 'Esconjurar', 2, 4000),
(78, 'Lex Aeterna', 4, 4000),
(79, 'Magnus Exorcismus', 6, 4000),
(80, 'Coluna de Fogo', 2, 4000),
(81, 'Supernova', 2, 4000),
(83, 'Chuva de Meteoros', 6, 4000),
(84, 'Trovão de Júpiter', 2, 4000),
(85, 'Ira de Thor', 6, 4000),
(86, 'Esfera d''Água', 4, 4000),
(87, 'Barreira de Gelo', 2, 4000),
(88, 'Congelar', 1, 4000),
(89, 'Nevasca', 6, 4000),
(90, 'Coluna de Pedra', 1, 4000),
(91, 'Fúria da Terra', 2, 4000),
(92, 'Pântano dos Mortos', 4, 4000),
(93, 'Sentido Sobrenatural', 1, 4000),
(108, 'Consertar Armas', 1, 0),
(110, 'Martelo de Thor', 1, 4000),
(111, 'Adrenalina Pura', 2, 4000),
(112, 'Manejo Perfeito', 4, 4000),
(113, 'Força Violenta', 4, 4000),
(114, 'Amplificar Poder', 6, 4000),
(115, 'Armadilha Escorregadia', 1, 4000),
(116, 'Armadilha Atordoante', 2, 4000),
(117, 'Instalar Armadilha', 2, 4000),
(118, 'Armadilha Extenuante', 4, 4000),
(119, 'Armadilha Sonífera', 4, 4000),
(120, 'Armadilha Luminosa', 4, 4000),
(121, 'Armadilha Congelante', 4, 4000),
(122, 'Instalar Mina', 4, 4000),
(123, 'Armadilha Explosiva', 6, 4000),
(124, 'Remover Armadilha', 1, 4000),
(125, 'Mensagem Secreta', 1, 4000),
(129, 'Ataque Aéreo', 4, 4000),
(130, 'Alerta', 1, 4000),
(131, 'Desativar Armadilha', 1, 4000),
(135, 'Furtividade', 2, 4000),
(136, 'Lâminas Destruidoras', 2, 4000),
(137, 'Tocaia', 4, 4000),
(138, 'Envenenar Arma', 2, 4000),
(139, 'Refletir Veneno', 2, 4000),
(140, 'Névoa Tóxica', 4, 4000),
(141, 'Explosão Tóxica', 4, 4000),
(142, 'Primeiros Socorros', 1, 5000),
(143, 'Fingir de Morto', 1, 5000),
(146, 'Instinto de Sobrevivência', 1, 0),
(147, 'Fabricar Flechas', 1, 5000),
(148, 'Disparo Violento', 1, 5000),
(149, 'Chutar Areia', 1, 5000),
(150, 'Recuar', 1, 5000),
(151, 'Procurar Pedras', 1, 5000),
(152, 'Arremessar Pedra', 1, 5000),
(153, 'Cavalo-de-Pau', 1, 5000),
(154, 'Personalizar Carrinho', 1, 5000),
(155, 'Grito de Guerra', 1, 5000),
(156, 'Luz Divina', 1, 5000),
(157, 'Proteção Arcana', 1, 5000),
(211, 'Afanar', 1, 4000),
(212, 'Apunhalar', 4, 4000),
(214, 'Ataque Surpresa', 2, 4000),
(215, 'Remover Arma', 4, 4000),
(216, 'Remover Escudo', 4, 4000),
(217, 'Remover Armadura', 4, 4000),
(218, 'Remover Capacete', 4, 4000),
(219, 'Rapto', 4, 4000),
(220, 'Grafitti', 1, 4000),
(221, 'Pichar', 1, 0),
(222, 'Faxina', 4, 4000),
(228, 'Preparar Poção', 1, 4000),
(229, 'Fogo Grego', 2, 4000),
(230, 'Terror Ácido', 2, 4000),
(231, 'Arremessar Poção', 2, 4000),
(232, 'Criar Monstro Planta', 4, 4000),
(233, 'Criar Esfera Marinha', 4, 4000),
(234, 'Revestir Arma', 4, 4000),
(235, 'Revestir Escudo', 4, 4000),
(236, 'Revestir Armadura', 4, 4000),
(237, 'Revestir Capacete', 4, 4000),
(249, 'Bloqueio', 1, 4000),
(250, 'Punição Divina', 2, 4000),
(251, 'Escudo Bumerangue', 2, 4000),
(252, 'Escudo Refletor', 4, 4000),
(253, 'Crux Divinum', 2, 4000),
(254, 'Crux Magnun', 6, 4000),
(255, 'Redenção', 4, 4000),
(256, 'Divina Providência', 2, 4000),
(257, 'Aura Sagrada', 4, 4000),
(258, 'Rapidez com Lança', 1, 4000),
(261, 'Invocar Esfera Espiritual', 1, 4000),
(262, 'Absorver Esferas Espirituais', 1, 4000),
(264, 'Passo Etéreo', 4, 4000),
(266, 'Impacto Psíquico', 2, 4000),
(267, 'Disparo de Esferas Espirituais', 2, 4000),
(268, 'Corpo Fechado', 4, 4000),
(269, 'Dilema', 2, 4000),
(270, 'Fúria Interior', 2, 4000),
(271, 'Punho Supremo de Asura', 6, 4000),
(272, 'Combo Quádruplo', 1, 0),
(273, 'O Último Dragão', 1, 0),
(275, 'Cancelar magia', 1, 4000),
(276, 'Espelho Mágico', 1, 4000),
(277, 'Desconcentrar', 2, 4000),
(279, 'Desejo Arcano', 2, 4000),
(280, 'Encantar com Chama', 2, 4000),
(281, 'Encantar com Geada', 2, 4000),
(282, 'Encantar com Ventania', 2, 4000),
(283, 'Encantar com Terremoto', 2, 4000),
(285, 'Vulcão', 4, 4000),
(286, 'Dilúvio', 4, 4000),
(287, 'Furacão', 4, 4000),
(288, 'Proteger Terreno', 4, 4000),
(289, 'Desencantar', 6, 4000),
(290, 'Abracadabra', 4, 4000),
(291, 'Mono Cell', 4, 2500),
(292, 'Transformação', 8, 2500),
(293, 'Invocar Monstro', 6, 3500),
(294, 'Transformação Orc', 4, 5000),
(295, 'Extermínio', 8, 2000),
(297, 'Hipnose', 6, 4000),
(298, 'Interrogatório', 4, 5000),
(299, 'Gravity', 4, 5000),
(301, 'Suicídio', 4, 2000),
(302, 'Recuperação', 8, 3000),
(303, 'Coma', 4, 4000),
(304, 'Encerramento', 1, 0),
(305, 'Bis', 1, 0),
(306, 'Cantiga de Ninar', 1, 0),
(307, 'Banquete de Njord', 1, 0),
(308, 'Ritmo Caótico', 1, 0),
(309, 'Rufar dos Tambores', 1, 0),
(310, 'Anel dos Nibelungos', 1, 0),
(311, 'Lamento de Loki', 1, 0),
(312, 'Canção Preciosa', 1, 0),
(313, 'Ode a Siegfried', 1, 0),
(316, 'Flecha Melódica', 1, 4000),
(317, 'Dissonância', 1, 0),
(318, 'Piada Infame', 2, 4000),
(319, 'Assovio', 1, 0),
(320, 'Crepúsculo Sangrento', 1, 0),
(321, 'Poema de Bragi', 1, 0),
(322, 'Maçãs de Idun', 1, 0),
(324, 'Estilingue', 1, 4000),
(325, 'Dança do Ventre', 1, 0),
(326, 'Escândalo', 2, 4000),
(327, 'Sibilo', 1, 0),
(328, 'Não Me Abandones', 1, 0),
(329, 'Beijo da Sorte', 1, 0),
(330, 'Dança Cigana', 1, 0);
