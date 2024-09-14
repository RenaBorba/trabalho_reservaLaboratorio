-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:33306
-- Tempo de geração: 14/09/2024 às 02:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ifpr`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `laboratorio`
--

CREATE TABLE `laboratorio` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `numero_computadores` int(11) NOT NULL,
  `bloco` varchar(50) NOT NULL,
  `sala` varchar(50) NOT NULL,
  `liberado` tinyint(1) NOT NULL DEFAULT 1,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `laboratorio`
--

INSERT INTO `laboratorio` (`id`, `nome`, `numero_computadores`, `bloco`, `sala`, `liberado`, `criado_em`, `atualizado_em`) VALUES
(1, 'LABORATORIO 1', 10, 'D14', '3', 1, '2024-08-30 00:07:13', '2024-08-30 00:07:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('comum','admin') NOT NULL DEFAULT 'comum',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ultimo_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoa`
--

INSERT INTO `pessoa` (`id`, `nome`, `email`, `senha`, `tipo`, `criado_em`, `atualizado_em`, `ultimo_login`) VALUES
(5, 'fulano', 'fulano@email.com', '$2y$10$w0xH7VkZ.yqzvXe8czs11upP23CZaw6jdni90Uqty1fguNhJCP/Uq', 'admin', '2024-08-24 19:16:29', '2024-08-24 20:47:46', NULL),
(9, 'teste', 'teste@email.com', '$2y$10$vNLHlZA3DprE5oSH6TzJLO8G.mfZuGdesBDnh0qsZMko57bVRv1Sa', 'comum', '2024-08-24 20:47:23', '2024-08-24 20:47:23', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `pessoa_id` int(11) NOT NULL,
  `laboratorio_id` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `data` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fim` time NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `atualizado_em` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `reserva`
--

INSERT INTO `reserva` (`id`, `pessoa_id`, `laboratorio_id`, `descricao`, `data`, `hora_inicio`, `hora_fim`, `criado_em`, `atualizado_em`) VALUES
(1, 5, 1, 'GOSTARIO DE SOLICITAR ', '2024-08-29', '21:08:00', '22:08:00', '2024-08-30 00:08:33', '2024-08-30 00:08:33');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pessoa_id` (`pessoa_id`),
  ADD KEY `laboratorio_id` (`laboratorio_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`laboratorio_id`) REFERENCES `laboratorio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
