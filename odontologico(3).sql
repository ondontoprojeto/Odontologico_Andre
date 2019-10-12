-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11-Out-2019 às 06:21
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.2.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `odontologico`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atend`
--

CREATE TABLE `atend` (
  `id_atend` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nomeconsulta` varchar(30) NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `nomedentista` varchar(30) NOT NULL,
  `procedimento_1` varchar(255) NOT NULL,
  `procedimento_2` varchar(255) DEFAULT NULL,
  `procedimento_3` varchar(255) DEFAULT NULL,
  `valor_1` varchar(255) NOT NULL,
  `valor_2` varchar(255) DEFAULT NULL,
  `valor_3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atend`
--

INSERT INTO `atend` (`id_atend`, `nome`, `nomeconsulta`, `dia`, `hora`, `descricao`, `nomedentista`, `procedimento_1`, `procedimento_2`, `procedimento_3`, `valor_1`, `valor_2`, `valor_3`) VALUES
(29, 'leandro cerqueira da silva 6', 'Consulta Rotina', '2019-10-07', '00:00:00', '', 'Leandro Cerqueira', '', NULL, NULL, '', NULL, NULL),
(30, 'Matheus Ribeiro Figueiredo', 'Consulta Rotina', '0000-00-00', '00:00:00', '', 'Leandro Cerqueira', '', NULL, NULL, '', NULL, NULL),
(32, 'Matheus Ribeiro Figueiredo', 'Ponte', '0000-00-00', '00:00:00', '', 'Cristiani Pires', '', NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `id_atendimento` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `dentista` varchar(50) NOT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `atendimento`
--

INSERT INTO `atendimento` (`id_atendimento`, `nome`, `data`, `id_paciente`, `descricao`, `dentista`, `hora`) VALUES
(1, 'Cirurgia', NULL, NULL, NULL, '', '00:00:00'),
(2, 'Consulta Rotina', '0000-00-00', NULL, '', '', NULL),
(3, '', '0000-00-00', NULL, '', '', NULL),
(4, '', '0000-00-00', NULL, 'teste 1', 'Eu', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `atendproced`
--

CREATE TABLE `atendproced` (
  `id_atend_proced` int(11) NOT NULL,
  `valor` double DEFAULT NULL,
  `id_atendimento` int(11) DEFAULT NULL,
  `id_consuproced` int(11) DEFAULT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consuproced`
--

CREATE TABLE `consuproced` (
  `id_consuproced` int(11) NOT NULL,
  `nomeproced` varchar(50) NOT NULL,
  `nomedentista` varchar(30) NOT NULL,
  `evolucao` varchar(255) DEFAULT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `consuproced`
--

INSERT INTO `consuproced` (`id_consuproced`, `nomeproced`, `nomedentista`, `evolucao`, `valor`) VALUES
(1, 'restauração', 'Cristiani Pires', 'teste1', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dentista`
--

CREATE TABLE `dentista` (
  `id_dentista` int(11) NOT NULL,
  `nomedentista` varchar(50) NOT NULL,
  `cro` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dentista`
--

INSERT INTO `dentista` (`id_dentista`, `nomedentista`, `cro`) VALUES
(3, 'Cristiani Pires', '123456'),
(4, 'Adriane Pires', '654321'),
(5, 'Leandro Cerqueira', '123123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL,
  `numeroproduto` int(11) DEFAULT NULL,
  `nomeproduto` varchar(200) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `fornecedor` varchar(100) DEFAULT NULL,
  `vencimento` date NOT NULL,
  `complemento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `numeroproduto`, `nomeproduto`, `categoria`, `quantidade`, `fornecedor`, `vencimento`, `complemento`) VALUES
(1, 1, 'Gaze', 'K', 5, 'Se', '2019-08-05', 'gjdfhgsdfgjks');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `id_user` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `perfil` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `id_pessoa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nome`, `id_pessoa`) VALUES
(1, 'leandro', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `administrador` varchar(50) NOT NULL,
  `dentista` varchar(30) NOT NULL,
  `secretaria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id_pessoa` int(11) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `orcamento` varchar(3) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `celular` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cep` varchar(15) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(5) DEFAULT NULL,
  `situacaoficha` varchar(20) DEFAULT NULL,
  `doencabase` varchar(255) DEFAULT NULL,
  `alergia` varchar(255) DEFAULT NULL,
  `medicamentos` varchar(255) DEFAULT NULL,
  `cirurgia` varchar(255) DEFAULT NULL,
  `internacoes` varchar(255) DEFAULT NULL,
  `pa` varchar(255) DEFAULT NULL,
  `queixaprinc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`id_pessoa`, `cpf`, `rg`, `nome`, `orcamento`, `telefone`, `celular`, `email`, `cep`, `endereco`, `complemento`, `bairro`, `nascimento`, `cidade`, `uf`, `situacaoficha`, `doencabase`, `alergia`, `medicamentos`, `cirurgia`, `internacoes`, `pa`, `queixaprinc`) VALUES
(1, '17362020732', '12345678', 'Matheus Ribeiro Figueiredo', 'NÃ£', '26627474', '994606169', 'matheusribeirofg1@gmail.com', '25550590', 'Rua belkiss', '', 'Coelho da Rocha', '1999-11-16', 'Rio de Janeiro', 'RJ', 'ativa', 'NÃ£o', 'nÃ£o', 'nÃ£o', 'NÃ£o', 'NÃ£o', 'nÃ£o', 'Clareamento'),
(2, '13195313772', '12345678', 'Marcus Vinicius', 'NÃ£', '12345678', '994606169', 'marcus@gmail.com', '25550590', 'Rua do catete', '', 'Catete', '1995-11-07', 'Rio de Janeiro', 'RJ', 'ativa', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'Clareamento'),
(3, '12345678912', '102345678', 'matheus', 'nao', '103245678', '123456789', 'matheusribeirofg1@gmail.com', '25550590', 'Rua belkiss', '', 'Catete', '1900-11-11', 'Rio de Janeiro', 'RJ', 'ativa', 'NÃ£o', 'nÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'Dor de dente'),
(4, '17362020732', '12345678', 'leandro', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(5, '17362020732', '12345678', 'matheus', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(6, '095.443.637-77', '', 'cerqueira.leandro', '', '', '', 'le22cerqueira@gmail.com', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(7, '095.443.637-77', '', 'cerqueira.leandro', '', '', '', 'le22cerqueira@yahoo.com.br', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(8, '', '', 'leandro cerqueira da silva 2', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(9, '', '', 'leandro cerqueira da silva 3', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(10, '', '', 'leandro cerqueira da silva 4', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(11, '', '', 'leandro cerqueira da silva 5', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(12, '', '', 'Helen Soares Cerqueira', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', ''),
(13, '', '', 'leandro cerqueira da silva 6', '', '', '21983656429', 'le22cerqueira@gmail.com', 'rj', 'Tijuca', '', '', '1983-03-11', 'Rio de Janeiro', 'Rio d', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimento`
--

CREATE TABLE `procedimento` (
  `id_procedimento` int(11) NOT NULL,
  `tipoproce` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `procedimento`
--

INSERT INTO `procedimento` (`id_procedimento`, `tipoproce`) VALUES
(1, 'RestauraÃ§Ã£o'),
(2, 'Limpeza'),
(3, 'Canal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoconsulta`
--

CREATE TABLE `tipoconsulta` (
  `id_tipoconsulta` int(11) NOT NULL,
  `nomeconsulta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipoconsulta`
--

INSERT INTO `tipoconsulta` (`id_tipoconsulta`, `nomeconsulta`) VALUES
(2, 'Consulta Rotina'),
(3, 'Cirurgia'),
(4, 'Ponte'),
(8, 'Teste');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atend`
--
ALTER TABLE `atend`
  ADD PRIMARY KEY (`id_atend`);

--
-- Índices para tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`id_atendimento`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Índices para tabela `atendproced`
--
ALTER TABLE `atendproced`
  ADD PRIMARY KEY (`id_atend_proced`),
  ADD KEY `id_atendimento` (`id_atendimento`),
  ADD KEY `id_procedimento` (`id_consuproced`);

--
-- Índices para tabela `consuproced`
--
ALTER TABLE `consuproced`
  ADD PRIMARY KEY (`id_consuproced`);

--
-- Índices para tabela `dentista`
--
ALTER TABLE `dentista`
  ADD PRIMARY KEY (`id_dentista`);

--
-- Índices para tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`);

--
-- Índices para tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_user`);

--
-- Índices para tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_pessoa` (`id_pessoa`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id_pessoa`);

--
-- Índices para tabela `procedimento`
--
ALTER TABLE `procedimento`
  ADD PRIMARY KEY (`id_procedimento`);

--
-- Índices para tabela `tipoconsulta`
--
ALTER TABLE `tipoconsulta`
  ADD PRIMARY KEY (`id_tipoconsulta`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atend`
--
ALTER TABLE `atend`
  MODIFY `id_atend` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `id_atendimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `atendproced`
--
ALTER TABLE `atendproced`
  MODIFY `id_atend_proced` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `consuproced`
--
ALTER TABLE `consuproced`
  MODIFY `id_consuproced` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `dentista`
--
ALTER TABLE `dentista`
  MODIFY `id_dentista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id_pessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `procedimento`
--
ALTER TABLE `procedimento`
  MODIFY `id_procedimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipoconsulta`
--
ALTER TABLE `tipoconsulta`
  MODIFY `id_tipoconsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Limitadores para a tabela `atendproced`
--
ALTER TABLE `atendproced`
  ADD CONSTRAINT `atendproced_ibfk_1` FOREIGN KEY (`id_atendimento`) REFERENCES `atendimento` (`id_atendimento`),
  ADD CONSTRAINT `atendproced_ibfk_2` FOREIGN KEY (`id_consuproced`) REFERENCES `procedimento` (`id_procedimento`);

--
-- Limitadores para a tabela `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`);

--
-- Limitadores para a tabela `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `login` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
