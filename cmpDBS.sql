-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: company015
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `assignmentId` int NOT NULL,
  `employeeID` int DEFAULT NULL,
  `projectId` int DEFAULT NULL,
  `role` varchar(40) DEFAULT NULL,
  `hoursWorked` int DEFAULT NULL,
  PRIMARY KEY (`assignmentId`),
  KEY `employeeID` (`employeeID`),
  KEY `projectId` (`projectId`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`),
  CONSTRAINT `chk_hrsWrk` CHECK ((`hoursWorked` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (101,1,1001,'Team Leader',200),(102,2,1002,'Manager',500),(131,3,1003,'Project Head',260);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `depid` int NOT NULL,
  `depname` char(20) NOT NULL,
  `loc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (10,'Administration','rome'),(20,'Marketing','veince'),(30,'Purchasing','kuwait'),(40,'Human Resources','Bangalore'),(50,'Shipping','Sydney'),(60,'IT','Beijing'),(70,'Public Relation','South Korea');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL,
  `ename` char(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phno` varchar(10) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `jobTitle` varchar(20) DEFAULT NULL,
  `depid` int DEFAULT NULL,
  `managerID` int DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `depid` (`depid`),
  KEY `sfk` (`managerID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depid`) REFERENCES `department` (`depid`),
  CONSTRAINT `sfk` FOREIGN KEY (`managerID`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'kai','kai123@gmail.com','8884569645','2020-05-20','Network Admin',60,NULL,NULL),(2,'Temar','temar@gmail.com','8967586985','2020-01-15','Manager',10,2,NULL),(3,'Jacob','jacob@gmail.com','9687968796','2020-03-16','Sr Manager',20,3,NULL),(4,'James','james@gmail.com','9788079679','2020-03-14','controls manager',30,4,NULL),(5,'Morgan','morgan@gmail.com','9867868759','2020-02-15','HRIS Analyst',40,5,NULL),(6,'Steve','steve@gmail.com','9868796859','2020-05-01','Assistant Manager',50,6,NULL),(7,'Benjamin','ben@gmail.com','9695697969','2020-06-29','System Architect',60,7,NULL),(8,'Carol','carol@gmail.com','8695868596','2020-01-15','PR Director',70,8,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeleave`
--

DROP TABLE IF EXISTS `employeeleave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeleave` (
  `leaveID` int NOT NULL,
  `empId` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `leaveType` varchar(20) NOT NULL,
  `statuss` varchar(20) NOT NULL,
  PRIMARY KEY (`leaveID`),
  KEY `empId` (`empId`),
  CONSTRAINT `employeeleave_ibfk_1` FOREIGN KEY (`empId`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `chk_status` CHECK (((`statuss` = _utf8mb4'pending') or (`statuss` = _utf8mb4'approved') or (`statuss` = _utf8mb4'rejected')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeleave`
--

LOCK TABLES `employeeleave` WRITE;
/*!40000 ALTER TABLE `employeeleave` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeleave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `projectId` int NOT NULL,
  `projectName` char(50) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `depid` int DEFAULT NULL,
  PRIMARY KEY (`projectId`),
  KEY `depid` (`depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1001,'project alpha','2023-04-01','2023-12-12',300000,10),(1002,'project beta','2021-01-15','2022-01-15',20000000,20),(1003,'project ghama','2021-04-01','2022-03-12',540000,30);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salaryID` int NOT NULL,
  `empId` int DEFAULT NULL,
  `salaryAmount` int DEFAULT NULL,
  `effectiveDate` date DEFAULT NULL,
  `payGrade` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`salaryID`),
  KEY `empId` (`empId`),
  CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`empId`) REFERENCES `employee` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1,350000,'2022-02-04','A+'),(2,2,400000,'2022-02-04','A+');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-26 15:29:33
