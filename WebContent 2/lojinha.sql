
DROP DATABASE  IF EXISTS `lojinha`;
CREATE DATABASE  IF NOT EXISTS `lojinha` CHARSET utf8;

USE `lojinha`;

DROP TABLE IF EXISTS `nivelUsuarios`;
CREATE TABLE `nivelUsuarios` (
  `idNivelUsuario` int NOT NULL AUTO_INCREMENT,
  `nivel` varchar(20) DEFAULT NULL COMMENT '{''Cliente '', ''Administrador''}',
  PRIMARY KEY (`idNivelUsuario`)
);


DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(64) NOT NULL,
  `idNivelUsuario` int DEFAULT '1',
  `nome` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `ativo` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `idNivelUsuario` (`idNivelUsuario`),
  FOREIGN KEY (`idNivelUsuario`) REFERENCES `nivelUsuarios` (`idNivelUsuario`)
);



