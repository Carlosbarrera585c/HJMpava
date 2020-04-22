-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: controlhv
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `co`
--

DROP TABLE IF EXISTS `co`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co` (
  `id` varchar(4) NOT NULL,
  `desc_co` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co`
--

LOCK TABLES `co` WRITE;
/*!40000 ALTER TABLE `co` DISABLE KEYS */;
INSERT INTO `co` VALUES ('001','DISTRIBUIDORA'),('002','MERCAPAVA S.A'),('003','PLAZA ALKOSTO MAYORISTA'),('010','MERCAPAVA VILLAMARINA'),('011','MERCAPAVA EL PLACER'),('012','AUTOSERVICIO PLAZA ALKOSTO'),('013','MERCAPAVA MAYORISTA'),('015','MAYORISTA MERCAPAVA EL PLACER'),('016','MERCAPAVA CANDELARIA'),('017','PROVEEDURIA TENDEROS'),('018','PLAZA ALKOSTO EL PLACER'),('ADM','ADMINISTRATIVA'),('CDA','CENTRO DE ACOPIO');
/*!40000 ALTER TABLE `co` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipos`
--

DROP TABLE IF EXISTS `equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` int NOT NULL,
  `activo_fijo` int NOT NULL,
  `tipo_equipo` int NOT NULL,
  `desc_equipo` varchar(50) NOT NULL,
  `id_marca` int NOT NULL,
  `caracteristicas` varchar(500) NOT NULL,
  `accesorios` varchar(500) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `nit` varchar(15) NOT NULL,
  `fecha_compra` date NOT NULL,
  `valor` int NOT NULL,
  `id_intervencion` int NOT NULL,
  `sis_operativo` varchar(20) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `co` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serial` (`serial`,`id_marca`,`nit`,`id_intervencion`),
  KEY `id_marca` (`id_marca`),
  KEY `id_intervencion` (`id_intervencion`),
  KEY `tipo_equipo` (`tipo_equipo`),
  KEY `nit` (`nit`),
  KEY `co` (`co`),
  CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `equipos_ibfk_3` FOREIGN KEY (`id_intervencion`) REFERENCES `tipo_intervencion` (`id_tipo_intervencion`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `equipos_ibfk_5` FOREIGN KEY (`tipo_equipo`) REFERENCES `tipo_equipo` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `equipos_ibfk_6` FOREIGN KEY (`nit`) REFERENCES `proveedor` (`nit`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `equipos_ibfk_7` FOREIGN KEY (`co`) REFERENCES `co` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipos`
--

LOCK TABLES `equipos` WRITE;
/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hv`
--

DROP TABLE IF EXISTS `hv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hv` (
  `id_hv` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(20) NOT NULL,
  `desc_intervencion` varchar(50) NOT NULL,
  `id_tipo_intervencion` int NOT NULL,
  `fecha_intervencion` date NOT NULL,
  `hecho_por` varchar(60) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id_hv`),
  UNIQUE KEY `id_tipo_intervencion_2` (`id_tipo_intervencion`),
  KEY `id_tipo_intervencion` (`id_tipo_intervencion`),
  KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hv`
--

LOCK TABLES `hv` WRITE;
/*!40000 ALTER TABLE `hv` DISABLE KEYS */;
/*!40000 ALTER TABLE `hv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `desc_marca` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Hewlett Packard'),(2,'Lenovo'),(3,'Dell'),(4,'Compumax'),(5,'Acer'),(6,'LG'),(7,'Asus'),(8,'Toshiba'),(9,'EPSON'),(10,'Compaq'),(11,'AOC'),(12,'Samsung'),(13,'TP-Link'),(14,'Grandstream'),(15,'Unitec'),(16,'Logitech');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `nit` varchar(15) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `direccion` varchar(40) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `contacto` varchar(40) NOT NULL,
  `barrio` varchar(30) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  PRIMARY KEY (`nit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('1112218475','CPS ON TECHNOLOGIES','CL 6 8 10','2672403','PAMELA A SOLARTE','LA MISERICORDIA','PRADERA'),('16764127','UNIX CLUB','CRA 3 12 40 OF 602','5245246','MAURICIO EDUARDO ROCHA','LA ERMITA','CALI'),('29561883','COMPUTIENDA CALI CAM','AV 5A NORTE 23 D N 68 LC 156','3955624','CLARIBEL ARIAS','LA PASARELA','CALI'),('800027927','LINEADATASCAN SA','CL 87  19A 27 P 4','5930255','LINEADATASCAN','BOGOTA','BOGOTA'),('805012966','ETIMARCAS SAS','CL 38 A N 4N 183','6651117','MARCELA BONILLA','PRADOS DEL NORTE','CALI'),('890306166','ESSEN SAS','CL 34 8 43','4853100','ESSEN','CALI','CALI'),('900758785','AMERICAN SCAN SERVICES AND SOLUTIONS SAS','CR 63 A 33 30 OF 201','4484623','BIBIANA OCAMPO','PRIMER PLANO','MEDELLIN'),('900809496','EL PUNTO DE LA TECNOLOGIA','AV ESTACION 5N 70','4879020','JULIAN PRADA','ESTACION','CALI'),('901024979','TECNOLOGIAS MERCATECH SAS','CL 7 9 59','3234823567','CARLOS EDUARDO RUIZ','ORIENTE','PRADERA'),('94331792','TELECTRONICA UPS','CR 20A 16 43','3123550435','OSCAR FELIPE FIGUEROA','EL SEMBRADOR','PALMIRA');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_equipo`
--

DROP TABLE IF EXISTS `tipo_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_equipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `desc_tipo_equipo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_equipo`
--

LOCK TABLES `tipo_equipo` WRITE;
/*!40000 ALTER TABLE `tipo_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_intervencion`
--

DROP TABLE IF EXISTS `tipo_intervencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_intervencion` (
  `id_tipo_intervencion` int NOT NULL AUTO_INCREMENT,
  `desc_tipo_intervencion` varchar(40) NOT NULL,
  PRIMARY KEY (`id_tipo_intervencion`),
  CONSTRAINT `tipo_intervencion_ibfk_1` FOREIGN KEY (`id_tipo_intervencion`) REFERENCES `hv` (`id_tipo_intervencion`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_intervencion`
--

LOCK TABLES `tipo_intervencion` WRITE;
/*!40000 ALTER TABLE `tipo_intervencion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_intervencion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 12:25:15
