-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `unique_cpf_cliente` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria','M','Silva','12346789','rua silva de prata 29, Carangola'),(2,'Matheus','O','Pimentel','987654321','rua alemeda 289, Centro'),(3,'Ricardo','F','Silva','45678913','avenida alemeda vinha 1009,'),(4,'Julia','S','França','789123456','rua lareijras 861, Centro'),(5,'Roberta','G','Assis','98745631','avenidade koller 19, Centro'),(6,'Isabela','M','Cruz','654789123','rua alemeda das flores 28');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `estoqueLocation` varchar(255) DEFAULT NULL,
  `quantidade` int DEFAULT '0',
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rio de Janeiro',1000),(2,'Rio de Janeiro',500),(3,'São Paulo',10),(4,'São Paulo',100),(5,'São Paulo',10),(6,'Brasilia',60);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `Socialname` varchar(255) NOT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `contato` char(11) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `unique_fornecedor_cnpj` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Almeida e filhos','123456789123456','21985474'),(2,'Eletrônicos Silva','854519649143457','21985484'),(3,'Eletrônicos Valma','934567893934695','21975474');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localestoque`
--

DROP TABLE IF EXISTS `localestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localestoque` (
  `idLproduto` int NOT NULL,
  `idLestoque` int NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`idLproduto`,`idLestoque`),
  KEY `fk_eproduto_estoque` (`idLestoque`),
  CONSTRAINT `fk_eproduto_estoque` FOREIGN KEY (`idLestoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_eproduto_produto` FOREIGN KEY (`idLproduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localestoque`
--

LOCK TABLES `localestoque` WRITE;
/*!40000 ALTER TABLE `localestoque` DISABLE KEYS */;
INSERT INTO `localestoque` VALUES (15,2,'RJ'),(16,6,'GO');
/*!40000 ALTER TABLE `localestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `idPeClient` int DEFAULT NULL,
  `peStatus` enum('Cancelado','Confirmado','Em Andamento') DEFAULT NULL,
  `peDescripition` varchar(255) DEFAULT NULL,
  `sendValor` float DEFAULT '10',
  `paymentcah` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_cliente` (`idPeClient`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`idPeClient`) REFERENCES `cliente` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,NULL,'compra via aplicativo',NULL,1),(2,2,NULL,'compra via aplicativo',50,0),(3,3,'Confirmado',NULL,NULL,1),(4,4,NULL,'compra via web site',150,0);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(20) DEFAULT NULL,
  `Classificationkids` tinyint(1) DEFAULT NULL,
  `Category` enum('Eletronico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `avaliacao` float DEFAULT '0',
  `size` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (15,'Fone de ouvido',0,'Eletronico',NULL,4,NULL),(16,'Barbie Elsa',1,'Brinquedos',NULL,3,NULL),(17,'Body Carters',1,'Vestimenta',NULL,5,NULL),(18,'Microfone Vedo',0,'Eletronico',NULL,4,NULL),(19,'Sofa retratil',0,'Móveis',NULL,3,'3x57x80'),(20,'Farinha de arroz',0,'Alimentos',NULL,2,NULL),(21,'Fire Stick Amazon',0,'Eletronico',NULL,3,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtofornecedor`
--

DROP TABLE IF EXISTS `produtofornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtofornecedor` (
  `idpfFornecedor` int NOT NULL,
  `idpfProduto` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idpfFornecedor`,`idpfProduto`),
  KEY `fk_pf_produto` (`idpfProduto`),
  CONSTRAINT `fk_pf_fornecedor` FOREIGN KEY (`idpfFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_pf_produto` FOREIGN KEY (`idpfProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtofornecedor`
--

LOCK TABLES `produtofornecedor` WRITE;
/*!40000 ALTER TABLE `produtofornecedor` DISABLE KEYS */;
INSERT INTO `produtofornecedor` VALUES (1,15,500),(1,16,400),(2,18,633),(2,19,10),(3,17,5);
/*!40000 ALTER TABLE `produtofornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtopedido`
--

DROP TABLE IF EXISTS `produtopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtopedido` (
  `idPPproduto` int NOT NULL,
  `idPPpedido` int NOT NULL,
  `ppQuantidade` int DEFAULT '1',
  `ppStatus` enum('Disponivel','Sem Estoque') DEFAULT 'Disponivel',
  PRIMARY KEY (`idPPproduto`,`idPPpedido`),
  KEY `fk_PP_ppedido` (`idPPpedido`),
  CONSTRAINT `fk_PP_ppedido` FOREIGN KEY (`idPPpedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_PP_produto` FOREIGN KEY (`idPPproduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtopedido`
--

LOCK TABLES `produtopedido` WRITE;
/*!40000 ALTER TABLE `produtopedido` DISABLE KEYS */;
INSERT INTO `produtopedido` VALUES (15,1,2,NULL),(16,1,1,NULL),(17,2,1,NULL);
/*!40000 ALTER TABLE `produtopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtovendedor`
--

DROP TABLE IF EXISTS `produtovendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtovendedor` (
  `idPVendedor` int NOT NULL,
  `idPProduto` int NOT NULL,
  `quantity` int DEFAULT '1',
  `postatus` enum('Disponivel','Sem estoque') DEFAULT NULL,
  PRIMARY KEY (`idPVendedor`,`idPProduto`),
  KEY `fk_produtp_produtp` (`idPProduto`),
  CONSTRAINT `fk_produto_vendedor` FOREIGN KEY (`idPVendedor`) REFERENCES `vendedor` (`idVendedor`),
  CONSTRAINT `fk_produtp_produtp` FOREIGN KEY (`idPProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtovendedor`
--

LOCK TABLES `produtovendedor` WRITE;
/*!40000 ALTER TABLE `produtovendedor` DISABLE KEYS */;
INSERT INTO `produtovendedor` VALUES (1,20,80,NULL),(2,21,10,NULL);
/*!40000 ALTER TABLE `produtovendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `Socialname` varchar(255) NOT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(11) DEFAULT NULL,
  `contato` char(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`),
  UNIQUE KEY `unique_fornecedor_cnpj` (`CNPJ`),
  UNIQUE KEY `unique_fornecedor_cpf` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Tech eletronics','123456789456321',NULL,'219946287','Rio de Janeiro'),(2,'Botique Durgas',NULL,'123456783','219567895','Rio de Janeiro'),(3,'Kids World','456789123654485',NULL,'1198657484','São Paulo');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-18 15:17:02
