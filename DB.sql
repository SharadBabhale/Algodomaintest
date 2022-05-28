-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: algodomain
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `specification` json DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `brand` varchar(128) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  KEY `product_seller_idx` (`seller_id`),
  CONSTRAINT `product_seller` FOREIGN KEY (`seller_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'{\"ram\": \"2 GB\", \"screen\": \"1020 X 768\"}','Lenovo Thinkpad','Laptop','Electronics','Lenovo',45000,2),(2,'{\"colour\": \"Red\"}','Tshirt','Sports wear','Men\'s fashion','Spykar',450,4),(3,'{\"load\": \"top load\", \"power\": \"40 V\", \"capacity\": \"6 KG\"}','Bosh 35010','Washing machine','Electronics','Bosh',25000,2),(4,'{\"load\": \"FRONT load\", \"power\": \"40 V\", \"capacity\": \"6 KG\"}','Bosh 35011','Washing machine','Electronics','Bosh',30000,2),(5,NULL,'Lenovo Thinkpad','Laptop','Electronics','Lenovo',45000,2),(6,NULL,'Lenovo Thinkpad','Laptop','Electronics','Lenovo',45000,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('1a321c05-0fb3-4149-b690-3e2d83c5acd6','1b5397aa-01c5-4426-9f46-113b20c1980a',1653733283184,1653733299293,1800,1653735099293,'baba@mailinator.com'),('1ce6d262-770c-48d6-afbc-670695c6bf32','4caca31a-e163-465e-9e01-242d8d821bcf',1653733267285,1653733267286,1800,1653735067286,NULL),('f08c1811-1096-4604-9d9b-87bb5f035a2a','d6d6aab7-376a-4f3b-83fa-5a752feca69e',1653733219754,1653733244479,1800,1653735044479,'sharad@mailinator.com'),('ff7d4063-5201-43dc-ad5a-55d8ee74bbf8','c8688177-0700-49d6-8539-e43f48ab0d85',1653731090226,1653732998164,1800,1653734798164,'baba@mailinator.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('1a321c05-0fb3-4149-b690-3e2d83c5acd6','SESSION_USER',_binary '¨\Ì\0sr\0\Zcom.algodomain.entity.User=X\ÀÛÆΩâ\0	I\0userIdL\0addresst\0Ljava/lang/String;L\0customerStatust\0%Lcom/algodomain/enums/CustomerStatus;L\0dateOfBirtht\0Ljava/sql/Date;L\0emailq\0~\0L\0	firstNameq\0~\0L\0lastNameq\0~\0L\0passwordq\0~\0L\0rolest\0Lcom/algodomain/enums/Roles;xp\0\0\0t\0PQR~r\0#com.algodomain.enums.CustomerStatus\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0Activept\0baba@mailinator.comt\0Babat\0Laptopst\0Baba@123~r\0\Zcom.algodomain.enums.Roles\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ROLE_SELLER'),('1a321c05-0fb3-4149-b690-3e2d83c5acd6','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0:\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0:\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0:\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_SELLERxq\0~\0\rsr\0\Zcom.algodomain.entity.User=X\ÀÛÆΩâ\0	I\0userIdL\0addressq\0~\0L\0customerStatust\0%Lcom/algodomain/enums/CustomerStatus;L\0dateOfBirtht\0Ljava/sql/Date;L\0emailq\0~\0L\0	firstNameq\0~\0L\0lastNameq\0~\0L\0passwordq\0~\0L\0rolest\0Lcom/algodomain/enums/Roles;xp\0\0\0t\0PQR~r\0#com.algodomain.enums.CustomerStatus\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0Activept\0baba@mailinator.comt\0Babat\0Laptopst\0Baba@123~r\0\Zcom.algodomain.enums.Roles\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ROLE_SELLERpt\0baba@mailinator.com'),('1ce6d262-770c-48d6-afbc-670695c6bf32','SPRING_SECURITY_SAVED_REQUEST',_binary '¨\Ì\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0:\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0êt\0\0sr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0\0w\0\0\0\0xsr\0java.util.TreeMap¡ˆ>-%j\Ê\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\Â\Œ\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0*/*xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, brxt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0content-lengthsq\0~\0\0\0\0w\0\0\0t\0425xt\0content-typesq\0~\0\0\0\0w\0\0\0t\0application/jsonxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0PostmanRuntime/7.26.8xt\0x-auth-tokensq\0~\0\0\0\0w\0\0\0t\0$bceae7c0-8db3-4784-889c-216deef0b535xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~¯`ú0˘\Ï\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpˇˇˇˇt\0INq\0~\0t\0enq\0~\0q\0~\0xxt\0POSTsq\0~\0pw\0\0\0\0xppt\0/addProductt\0 http://localhost:8080/addProductt\0httpt\0	localhostt\0/addProduct'),('f08c1811-1096-4604-9d9b-87bb5f035a2a','SESSION_USER',_binary '¨\Ì\0sr\0\Zcom.algodomain.entity.User=X\ÀÛÆΩâ\0	I\0userIdL\0addresst\0Ljava/lang/String;L\0customerStatust\0%Lcom/algodomain/enums/CustomerStatus;L\0dateOfBirtht\0Ljava/sql/Date;L\0emailq\0~\0L\0	firstNameq\0~\0L\0lastNameq\0~\0L\0passwordq\0~\0L\0rolest\0Lcom/algodomain/enums/Roles;xp\0\0\0t\0ABC~r\0#com.algodomain.enums.CustomerStatus\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0Activesr\0\rjava.sql.Date˙Fh?5fó\0\0xr\0java.util.DatehjÅKYt\0\0xpw\0\0\0»≠£\0@xt\0sharad@mailinator.comt\0sharadt\0babhalet\0	Sharad123~r\0\Zcom.algodomain.enums.Roles\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\rROLE_CUSTOMER'),('f08c1811-1096-4604-9d9b-87bb5f035a2a','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0:\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0:\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0:\0L\0rolet\0Ljava/lang/String;xpt\0\rROLE_CUSTOMERxq\0~\0\rsr\0\Zcom.algodomain.entity.User=X\ÀÛÆΩâ\0	I\0userIdL\0addressq\0~\0L\0customerStatust\0%Lcom/algodomain/enums/CustomerStatus;L\0dateOfBirtht\0Ljava/sql/Date;L\0emailq\0~\0L\0	firstNameq\0~\0L\0lastNameq\0~\0L\0passwordq\0~\0L\0rolest\0Lcom/algodomain/enums/Roles;xp\0\0\0t\0ABC~r\0#com.algodomain.enums.CustomerStatus\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0Activesr\0\rjava.sql.Date˙Fh?5fó\0\0xr\0java.util.DatehjÅKYt\0\0xpw\0\0\0»≠£\0@xt\0sharad@mailinator.comt\0sharadt\0babhalet\0	Sharad123~r\0\Zcom.algodomain.enums.Roles\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0\rROLE_CUSTOMERpt\0sharad@mailinator.com'),('ff7d4063-5201-43dc-ad5a-55d8ee74bbf8','SESSION_USER',_binary '¨\Ì\0sr\0\Zcom.algodomain.entity.User=X\ÀÛÆΩâ\0	I\0userIdL\0addresst\0Ljava/lang/String;L\0customerStatust\0%Lcom/algodomain/enums/CustomerStatus;L\0dateOfBirtht\0Ljava/sql/Date;L\0emailq\0~\0L\0	firstNameq\0~\0L\0lastNameq\0~\0L\0passwordq\0~\0L\0rolest\0Lcom/algodomain/enums/Roles;xp\0\0\0t\0PQR~r\0#com.algodomain.enums.CustomerStatus\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0Activept\0baba@mailinator.comt\0Babat\0Laptopst\0Baba@123~r\0\Zcom.algodomain.enums.Roles\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ROLE_SELLER'),('ff7d4063-5201-43dc-ad5a-55d8ee74bbf8','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0:\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0:\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0:\0L\0rolet\0Ljava/lang/String;xpt\0ROLE_SELLERxq\0~\0\rsr\0\Zcom.algodomain.entity.User=X\ÀÛÆΩâ\0	I\0userIdL\0addressq\0~\0L\0customerStatust\0%Lcom/algodomain/enums/CustomerStatus;L\0dateOfBirtht\0Ljava/sql/Date;L\0emailq\0~\0L\0	firstNameq\0~\0L\0lastNameq\0~\0L\0passwordq\0~\0L\0rolest\0Lcom/algodomain/enums/Roles;xp\0\0\0t\0PQR~r\0#com.algodomain.enums.CustomerStatus\0\0\0\0\0\0\0\0\0\0xr\0java.lang.Enum\0\0\0\0\0\0\0\0\0\0xpt\0Activept\0baba@mailinator.comt\0Babat\0Laptopst\0Baba@123~r\0\Zcom.algodomain.enums.Roles\0\0\0\0\0\0\0\0\0\0xq\0~\0t\0ROLE_SELLERpt\0baba@mailinator.com');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  `role` enum('ROLE_CUSTOMER','ROLE_SELLER') DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `address` text,
  `status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'sharad','babhale','ROLE_CUSTOMER','sharad@mailinator.com','1997-04-25','Sharad123','ABC','Active'),(2,'Baba','Laptops','ROLE_SELLER','baba@mailinator.com',NULL,'Baba@123','PQR','Active'),(3,'Abc','Tech','ROLE_SELLER','abc@mailinator.com',NULL,'Abc@123','XYZ','Active'),(4,'Spykar',NULL,'ROLE_SELLER','spykar@mailinator.com',NULL,'Spykar@123','Camp','Active');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-28 16:15:34
