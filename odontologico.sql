/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : odontologico

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 16/10/2019 07:24:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for atend
-- ----------------------------
DROP TABLE IF EXISTS `atend`;
CREATE TABLE `atend`  (
  `id_atend` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) NULL DEFAULT NULL,
  `id_dentista` int(11) NULL DEFAULT NULL,
  `nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomeconsulta` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dia` date NOT NULL,
  `hora` time(0) NOT NULL,
  `descricao` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomedentista` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `procedimento_1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `procedimento_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `procedimento_3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `valor_1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `valor_2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `valor_3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_atend`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of atend
-- ----------------------------
INSERT INTO `atend` VALUES (29, NULL, NULL, 'leandro cerqueira da silva 6', 'Consulta Rotina', '2019-10-07', '00:00:00', '', 'Leandro Cerqueira', '', NULL, NULL, '', NULL, NULL);
INSERT INTO `atend` VALUES (30, NULL, NULL, 'Matheus Ribeiro Figueiredo', 'Consulta Rotina', '0000-00-00', '00:00:00', '', 'Leandro Cerqueira', '', NULL, NULL, '', NULL, NULL);
INSERT INTO `atend` VALUES (32, NULL, NULL, 'Matheus Ribeiro Figueiredo', 'Ponte', '0000-00-00', '00:00:00', '', 'Cristiani Pires', '', NULL, NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for atendimento
-- ----------------------------
DROP TABLE IF EXISTS `atendimento`;
CREATE TABLE `atendimento`  (
  `id_atendimento` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NULL DEFAULT 'current_timestamp()',
  `hora` time(0) NULL DEFAULT 'current_timestamp()',
  `descricao` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_atendimento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of atendimento
-- ----------------------------
INSERT INTO `atendimento` VALUES (1, NULL, '00:00:00', 'descr');
INSERT INTO `atendimento` VALUES (2, NULL, NULL, 'eee');
INSERT INTO `atendimento` VALUES (3, NULL, NULL, 'eee');
INSERT INTO `atendimento` VALUES (4, NULL, NULL, 'cccc');
INSERT INTO `atendimento` VALUES (5, '2019-10-16', '01:06:50', 'eee');
INSERT INTO `atendimento` VALUES (6, NULL, NULL, 'www');
INSERT INTO `atendimento` VALUES (7, NULL, NULL, 'www');
INSERT INTO `atendimento` VALUES (8, NULL, NULL, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrr');
INSERT INTO `atendimento` VALUES (9, NULL, NULL, 'rrrrrrrrrrrrrrrrrrrrrrrrrrrr');
INSERT INTO `atendimento` VALUES (10, NULL, NULL, 'wwwxxx');
INSERT INTO `atendimento` VALUES (11, NULL, NULL, 'hnhn');
INSERT INTO `atendimento` VALUES (12, NULL, NULL, 'oioi');
INSERT INTO `atendimento` VALUES (13, NULL, NULL, 'testesesetsetsets');

-- ----------------------------
-- Table structure for atendproced
-- ----------------------------
DROP TABLE IF EXISTS `atendproced`;
CREATE TABLE `atendproced`  (
  `id_atend_proced` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NULL DEFAULT NULL,
  `id_atendimento` int(11) NULL DEFAULT NULL,
  `id_consuproced` int(11) NULL DEFAULT NULL,
  `descricao` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_atend_proced`) USING BTREE,
  INDEX `id_atendimento`(`id_atendimento`) USING BTREE,
  INDEX `id_procedimento`(`id_consuproced`) USING BTREE,
  CONSTRAINT `atendproced_ibfk_1` FOREIGN KEY (`id_atendimento`) REFERENCES `atendimento` (`id_atendimento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `atendproced_ibfk_2` FOREIGN KEY (`id_consuproced`) REFERENCES `procedimento` (`id_procedimento`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for consuproced
-- ----------------------------
DROP TABLE IF EXISTS `consuproced`;
CREATE TABLE `consuproced`  (
  `id_consuproced` int(11) NOT NULL AUTO_INCREMENT,
  `nomeproced` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomedentista` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `evolucao` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `valor` double NULL DEFAULT NULL,
  PRIMARY KEY (`id_consuproced`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of consuproced
-- ----------------------------
INSERT INTO `consuproced` VALUES (1, 'restauração', 'Cristiani Pires', 'teste1', 10);

-- ----------------------------
-- Table structure for dentista
-- ----------------------------
DROP TABLE IF EXISTS `dentista`;
CREATE TABLE `dentista`  (
  `id_dentista` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `cro` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_dentista`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dentista
-- ----------------------------
INSERT INTO `dentista` VALUES (1, 'Cristiani Pires', '123456');
INSERT INTO `dentista` VALUES (2, 'Adriane Pires', '654321');
INSERT INTO `dentista` VALUES (3, 'Leandro Cerqueira', '123123');

-- ----------------------------
-- Table structure for estoque
-- ----------------------------
DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque`  (
  `id_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `numeroproduto` int(11) NULL DEFAULT NULL,
  `nomeproduto` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `categoria` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quantidade` int(11) NOT NULL,
  `fornecedor` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `vencimento` date NOT NULL,
  `complemento` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estoque`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of estoque
-- ----------------------------
INSERT INTO `estoque` VALUES (1, 1, 'Gaze', 'K', 5, 'Se', '2019-08-05', 'gjdfhgsdfgjks');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `login` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `senha` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perfil` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for perfil
-- ----------------------------
DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil`  (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `administrador` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dentista` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `secretaria` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  INDEX `id_perfil`(`id_perfil`) USING BTREE,
  CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `login` (`id_user`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pessoa
-- ----------------------------
DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE `pessoa`  (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rg` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nome` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `orcamento` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `telefone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `celular` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cep` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `endereco` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `complemento` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bairro` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nascimento` date NOT NULL,
  `cidade` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `uf` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `situacaoficha` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `doencabase` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alergia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `medicamentos` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cirurgia` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `internacoes` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `queixaprinc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pessoa
-- ----------------------------
INSERT INTO `pessoa` VALUES (1, '17362020732', '12345678', 'Matheus Ribeiro Figueiredo', 'NÃ£', '26627474', '994606169', 'matheusribeirofg1@gmail.com', '25550590', 'Rua belkiss', '', 'Coelho da Rocha', '1999-11-16', 'Rio de Janeiro', 'RJ', 'ativa', 'NÃ£o', 'nÃ£o', 'nÃ£o', 'NÃ£o', 'NÃ£o', 'nÃ£o', 'Clareamento');
INSERT INTO `pessoa` VALUES (2, '13195313772', '12345678', 'Marcus Vinicius', 'NÃ£', '12345678', '994606169', 'marcus@gmail.com', '25550590', 'Rua do catete', '', 'Catete', '1995-11-07', 'Rio de Janeiro', 'RJ', 'ativa', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'Clareamento');
INSERT INTO `pessoa` VALUES (3, '12345678912', '102345678', 'matheus', 'nao', '103245678', '123456789', 'matheusribeirofg1@gmail.com', '25550590', 'Rua belkiss', '', 'Catete', '1900-11-11', 'Rio de Janeiro', 'RJ', 'ativa', 'NÃ£o', 'nÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'NÃ£o', 'Dor de dente');
INSERT INTO `pessoa` VALUES (4, '17362020732', '12345678', 'leandro', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (5, '17362020732', '12345678', 'matheus', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (6, '095.443.637-77', '', 'cerqueira.leandro', '', '', '', 'le22cerqueira@gmail.com', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (7, '095.443.637-77', '', 'cerqueira.leandro', '', '', '', 'le22cerqueira@yahoo.com.br', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (8, '', '', 'leandro cerqueira da silva 2', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (9, '', '', 'leandro cerqueira da silva 3', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (10, '', '', 'leandro cerqueira da silva 4', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (11, '', '', 'leandro cerqueira da silva 5', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (12, '', '', 'Helen Soares Cerqueira', '', '', '', '', '', '', '', '', '0000-00-00', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (13, '', '', 'leandro cerqueira da silva 6', '', '', '21983656429', 'le22cerqueira@gmail.com', 'rj', 'Tijuca', '', '', '1983-03-11', 'Rio de Janeiro', 'Rio d', '', '', '', '', '', '', '', '');
INSERT INTO `pessoa` VALUES (14, '3334', '3334', '3334', '333', '3334', '3334', '33334@333.com', '3334', '3334', '4', '3334', '4444-03-31', '3334', '334', '334', '4', '4', '4', '4', '4', '4', '4');

-- ----------------------------
-- Table structure for pessoa_atendimento
-- ----------------------------
DROP TABLE IF EXISTS `pessoa_atendimento`;
CREATE TABLE `pessoa_atendimento`  (
  `id_atendimento` int(11) NOT NULL,
  `id_pessoa` int(11) NULL DEFAULT NULL,
  `id_dentista` int(11) NULL DEFAULT NULL,
  `id_tipoconsulta` int(11) NULL DEFAULT NULL,
  INDEX `id_pessoa`(`id_pessoa`) USING BTREE,
  CONSTRAINT `pessoa_atendimento_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pessoa_atendimento
-- ----------------------------
INSERT INTO `pessoa_atendimento` VALUES (1, 14, 1, 1);
INSERT INTO `pessoa_atendimento` VALUES (2, 14, 2, 2);
INSERT INTO `pessoa_atendimento` VALUES (3, 14, 3, 3);
INSERT INTO `pessoa_atendimento` VALUES (4, 14, 1, 4);
INSERT INTO `pessoa_atendimento` VALUES (4, 14, 1, 4);
INSERT INTO `pessoa_atendimento` VALUES (9, 14, 2, 2);
INSERT INTO `pessoa_atendimento` VALUES (10, 14, 1, 1);
INSERT INTO `pessoa_atendimento` VALUES (11, 14, 2, 2);
INSERT INTO `pessoa_atendimento` VALUES (12, 14, 2, 2);
INSERT INTO `pessoa_atendimento` VALUES (13, 14, 2, 2);

-- ----------------------------
-- Table structure for procedimento
-- ----------------------------
DROP TABLE IF EXISTS `procedimento`;
CREATE TABLE `procedimento`  (
  `id_procedimento` int(11) NOT NULL AUTO_INCREMENT,
  `tipoproce` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_procedimento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of procedimento
-- ----------------------------
INSERT INTO `procedimento` VALUES (1, 'RestauraÃ§Ã£o');
INSERT INTO `procedimento` VALUES (2, 'Limpeza');
INSERT INTO `procedimento` VALUES (3, 'Canal');

-- ----------------------------
-- Table structure for tipoconsulta
-- ----------------------------
DROP TABLE IF EXISTS `tipoconsulta`;
CREATE TABLE `tipoconsulta`  (
  `id_tipoconsulta` int(11) NOT NULL AUTO_INCREMENT,
  `nomeconsulta` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_tipoconsulta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipoconsulta
-- ----------------------------
INSERT INTO `tipoconsulta` VALUES (1, 'Consulta Rotina');
INSERT INTO `tipoconsulta` VALUES (2, 'Cirurgia');
INSERT INTO `tipoconsulta` VALUES (3, 'Ponte');
INSERT INTO `tipoconsulta` VALUES (4, 'Teste');

SET FOREIGN_KEY_CHECKS = 1;
