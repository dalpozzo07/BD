-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 04/06/2025 às 14:15
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `exercicios`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codCidade` bigint UNSIGNED NOT NULL,
  `nome` varchar(50) NOT NULL,
  `siglaEstado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `codClasse` bigint UNSIGNED NOT NULL,
  `sigla` varchar(12) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` bigint UNSIGNED NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `codCidade` int NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` char(1) DEFAULT NULL,
  `dataCadastro` date DEFAULT '2018-09-12',
  `cep` varchar(8) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteFisico`
--

CREATE TABLE `clienteFisico` (
  `codCliente` int DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteJuridico`
--

CREATE TABLE `clienteJuridico` (
  `codCliente` int DEFAULT NULL,
  `nomeFantasia` varchar(80) NOT NULL,
  `razaoSocial` varchar(80) DEFAULT NULL,
  `ie` varchar(80) DEFAULT NULL,
  `cgc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codDepartamento` bigint UNSIGNED NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoFuncional` varchar(80) DEFAULT NULL,
  `localizacao` text
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `siglaEstado` tinytext,
  `nome` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codFornecedor` int DEFAULT NULL,
  `nomeFantasia` varchar(80) NOT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ie` varchar(20) NOT NULL,
  `cgc` varchar(20) NOT NULL,
  `endereço` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemPedido`
--

CREATE TABLE `itemPedido` (
  `codPedido` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `quantidade` decimal(20,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemVenda`
--

CREATE TABLE `itemVenda` (
  `codVenda` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `numeroLote` int DEFAULT NULL,
  `quantidade` decimal(14,2) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `codPedido` bigint UNSIGNED NOT NULL,
  `dataRealizacao` date DEFAULT '2025-06-04',
  `dataEntrega` date DEFAULT NULL,
  `codFornecedor` int DEFAULT NULL,
  `valor` decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` bigint UNSIGNED NOT NULL,
  `descrição` varchar(40) NOT NULL,
  `unidadeMedida` char(2) DEFAULT NULL,
  `embalagem` varchar(15) DEFAULT 'padrão',
  `codClasse` int DEFAULT NULL,
  `precovenda` decimal(14,2) DEFAULT NULL,
  `estoqueMinimo` decimal(14,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtoLote`
--

CREATE TABLE `produtoLote` (
  `codProduto` int DEFAULT NULL,
  `numeroLote` int DEFAULT NULL,
  `quantidadeAdquirida` decimal(14,2) DEFAULT NULL,
  `quantidadeVendida` decimal(14,2) DEFAULT NULL,
  `precoCusto` decimal(14,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codVendedor` bigint UNSIGNED NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL,
  `dataContratacao` date DEFAULT '2018-09-12',
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codCidade`),
  ADD UNIQUE KEY `codCidade` (`codCidade`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `siglaEstado` (`siglaEstado`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`codClasse`),
  ADD UNIQUE KEY `codClasse` (`codClasse`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `codCliente` (`codCliente`),
  ADD UNIQUE KEY `codCidade` (`codCidade`);

--
-- Índices de tabela `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`),
  ADD UNIQUE KEY `cgc` (`cgc`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD UNIQUE KEY `codDepartamento` (`codDepartamento`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`),
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `ie` (`ie`),
  ADD UNIQUE KEY `cgc` (`cgc`);

--
-- Índices de tabela `itemPedido`
--
ALTER TABLE `itemPedido`
  ADD UNIQUE KEY `quantidade` (`quantidade`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD UNIQUE KEY `codPedido` (`codPedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD UNIQUE KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codVendedor`),
  ADD UNIQUE KEY `codVendedor` (`codVendedor`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `codCidade` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `codClasse` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCliente` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codDepartamento` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codPedido` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `codVendedor` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
