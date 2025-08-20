-- MySQL dump 10.13  Distrib 8.4.6, for Win64 (x86_64)
--
-- Host: localhost    Database: projeto_seguro
-- ------------------------------------------------------
-- Server version	8.4.6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bem`
--

DROP TABLE IF EXISTS `bem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bem` (
  `id_bem` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `valor_estimado` decimal(9,2) DEFAULT NULL,
  `rua` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bem`
--

LOCK TABLES `bem` WRITE;
/*!40000 ALTER TABLE `bem` DISABLE KEYS */;
/*!40000 ALTER TABLE `bem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiario`
--

DROP TABLE IF EXISTS `beneficiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiario` (
  `id_beneficiario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `percentual` decimal(5,2) DEFAULT NULL,
  `id_segurado` int DEFAULT NULL,
  PRIMARY KEY (`id_beneficiario`),
  KEY `fk_segurado` (`id_segurado`),
  CONSTRAINT `fk_segurado` FOREIGN KEY (`id_segurado`) REFERENCES `segurado` (`id_segurado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiario`
--

LOCK TABLES `beneficiario` WRITE;
/*!40000 ALTER TABLE `beneficiario` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela`
--

DROP TABLE IF EXISTS `parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcela` (
  `id_parcela` int NOT NULL AUTO_INCREMENT,
  `valor_parcela` decimal(10,2) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `status` enum('pago','pendente','atrasado') DEFAULT NULL,
  `id_seguro` int DEFAULT NULL,
  PRIMARY KEY (`id_parcela`),
  KEY `id_seguro` (`id_seguro`),
  CONSTRAINT `parcela_ibfk_1` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela`
--

LOCK TABLES `parcela` WRITE;
/*!40000 ALTER TABLE `parcela` DISABLE KEYS */;
/*!40000 ALTER TABLE `parcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segurado`
--

DROP TABLE IF EXISTS `segurado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segurado` (
  `id_segurado` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `CEP` char(8) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_segurado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segurado`
--

LOCK TABLES `segurado` WRITE;
/*!40000 ALTER TABLE `segurado` DISABLE KEYS */;
/*!40000 ALTER TABLE `segurado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro` (
  `id_seguro` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `tipo` enum('veiculo','bem','vida') DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `status` enum('ativo','inativo','cancelado','pendente') DEFAULT NULL,
  `data_renovacao` date DEFAULT NULL,
  `id_segurado` int DEFAULT NULL,
  `id_veiculo` int DEFAULT NULL,
  `id_bem` int DEFAULT NULL,
  PRIMARY KEY (`id_seguro`),
  KEY `id_segurado` (`id_segurado`),
  KEY `fk_veiculo` (`id_veiculo`),
  KEY `fk_bem` (`id_bem`),
  CONSTRAINT `fk_bem` FOREIGN KEY (`id_bem`) REFERENCES `bem` (`id_bem`),
  CONSTRAINT `fk_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo` (`id_veiculo`),
  CONSTRAINT `seguro_ibfk_1` FOREIGN KEY (`id_segurado`) REFERENCES `segurado` (`id_segurado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinistro`
--

DROP TABLE IF EXISTS `sinistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinistro` (
  `id_sinistro` int NOT NULL AUTO_INCREMENT,
  `data_sinistro` date DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor_indenizado` decimal(10,2) DEFAULT NULL,
  `id_seguro` int DEFAULT NULL,
  PRIMARY KEY (`id_sinistro`),
  KEY `id_seguro` (`id_seguro`),
  CONSTRAINT `sinistro_ibfk_1` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinistro`
--

LOCK TABLES `sinistro` WRITE;
/*!40000 ALTER TABLE `sinistro` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinistro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `chassi` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-17 21:07:52
