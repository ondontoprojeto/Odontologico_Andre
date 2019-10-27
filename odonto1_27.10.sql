-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Out-2019 às 17:40
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `odonto1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE IF NOT EXISTS `atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) DEFAULT NULL,
  `dentista_id` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `data` timestamp NULL DEFAULT NULL,
  `descricao` text,
  `atendimentonome` varchar(30) DEFAULT NULL,
  `hora` time DEFAULT '00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_a_paciente_id` (`paciente_id`) USING BTREE,
  KEY `fk_a_dentista_id` (`dentista_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `atendimento`
--

INSERT INTO `atendimento` (`id`, `paciente_id`, `dentista_id`, `nome`, `data`, `descricao`, `atendimentonome`, `hora`) VALUES
(1, 1, 2, 'Consulta de rotina', '2019-10-22 00:41:28', 'ADescricao1', NULL, '00:00:00'),
(2, 1, 1, 'Consulta de revisao', '2019-10-22 00:42:01', 'ADescricao2', NULL, '00:00:00'),
(3, 2, 1, 'Consulta 3', '2019-10-22 00:48:22', 'ADescricao3', NULL, '00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento_tipo`
--

CREATE TABLE IF NOT EXISTS `atendimento_tipo` (
  `atendimentotipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `atendimentonome` varchar(50) NOT NULL,
  PRIMARY KEY (`atendimentotipo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `atendimento_tipo`
--

INSERT INTO `atendimento_tipo` (`atendimentotipo_id`, `atendimentonome`) VALUES
(1, 'Rotina'),
(2, 'Cirurgia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dentista`
--

CREATE TABLE IF NOT EXISTS `dentista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `dentista`
--

INSERT INTO `dentista` (`id`, `nome`, `cro`) VALUES
(1, 'Dentista 1', '111'),
(2, 'Denstita 2', '222'),
(3, 'Dentista 3', '1231236');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `estoque_id` int(11) NOT NULL,
  `numeroproduto` int(11) DEFAULT NULL,
  `nomeproduto` varchar(200) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `vencimento` date NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estoque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `cep` varchar(15) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(5) DEFAULT NULL,
  `doencabase` varchar(255) DEFAULT NULL,
  `alergia` varchar(255) DEFAULT NULL,
  `medicamentos` varchar(255) DEFAULT NULL,
  `cirurgia` varchar(255) DEFAULT NULL,
  `internacoes` varchar(255) DEFAULT NULL,
  `pa` varchar(255) DEFAULT NULL,
  `queixaprinc` varchar(255) DEFAULT NULL,
  `situacaoficha` varchar(10) NOT NULL,
  `orcamento` varchar(5) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `email`, `cpf`, `rg`, `telefone`, `celular`, `cep`, `endereco`, `bairro`, `nascimento`, `cidade`, `uf`, `doencabase`, `alergia`, `medicamentos`, `cirurgia`, `internacoes`, `pa`, `queixaprinc`, `situacaoficha`, `orcamento`, `complemento`) VALUES
(1, 'Paciente 1', 'p1@email.com.br', '', '', '', '', '', '', '', '1983-03-11', '', '', '', '', '', '', '', '', '', 'ativa', '', ''),
(2, 'Paciente 2', 'p2@email.com', '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(3, 'paciente 3', 'p3@email.com', '', '', '', '', '', '', '', '0000-00-00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', ''),
(7, 'Paciente 07', 'le22cerqueira@gmail.com', '123.654.789-00', '111111', '21983656429', '21983656429', 'rj', 'Rua São Miguel, 556 Casa 62', 'Tijuca', '2019-10-16', 'Rio de Janeiro', 'RJ', 'Não Existente', 'Não tem', 'Não', 'Só algumas', 'Uma vez', 'Não', 'Dor de Dente', 'inativa', 'Sim', '556 Casa 62'),
(8, 'Paciente 4', 'le22cerqueira@yahoo.com.br', '111.222.333-44', '010101', '21983656429', '21983656429', '20530-420', 'Rua São Miguel, 556 Casa 62', 'Tijuca', '2019-10-14', 'Rio de Janeiro', 'RJ', 'Não Existente', 'Sim', 'Não', 'Não', 'Não', 'Não', 'sem', 'ativa', 'Sim', '500 CASA 62');

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimento`
--

CREATE TABLE IF NOT EXISTS `procedimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atendimento_id` int(11) DEFAULT NULL,
  `procedimento_tipo_id` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `obs` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_p_procedimento_tipo_id` (`procedimento_tipo_id`) USING BTREE,
  KEY `fk_p_atendimento_id` (`atendimento_id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `procedimento`
--

INSERT INTO `procedimento` (`id`, `atendimento_id`, `procedimento_tipo_id`, `valor`, `obs`) VALUES
(1, 1, 1, 10, ''),
(2, 1, 2, 20, ''),
(3, 2, 3, 30, ''),
(4, 2, 1, 10, ''),
(5, NULL, NULL, 150, 'Paciente 2'),
(6, NULL, NULL, 150, 'teste'),
(7, NULL, NULL, 150, 'Paciente 2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimento_tipo`
--

CREATE TABLE IF NOT EXISTS `procedimento_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `procedimento_tipo`
--

INSERT INTO `procedimento_tipo` (`id`, `nome`) VALUES
(1, 'Revisão'),
(2, 'Limpeza'),
(3, 'Canal'),
(4, ''),
(5, ''),
(6, ''),
(7, 'Restauração');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_a_dentista_id` FOREIGN KEY (`dentista_id`) REFERENCES `dentista` (`id`),
  ADD CONSTRAINT `fk_a_paciente_id` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`);

--
-- Limitadores para a tabela `procedimento`
--
ALTER TABLE `procedimento`
  ADD CONSTRAINT `fk_p_atendimento_id` FOREIGN KEY (`atendimento_id`) REFERENCES `atendimento` (`id`),
  ADD CONSTRAINT `fk_p_procedimento_tipo_id` FOREIGN KEY (`procedimento_tipo_id`) REFERENCES `procedimento_tipo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
