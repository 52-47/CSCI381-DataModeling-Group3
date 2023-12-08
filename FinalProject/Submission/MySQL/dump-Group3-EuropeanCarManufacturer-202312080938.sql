-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: Group3-EuropeanCarManufacturer
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `Audit.HumanResources.StaffHistory`
--

DROP TABLE IF EXISTS `Audit.HumanResources.StaffHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.HumanResources.StaffHistory` (
  `StaffId` int NOT NULL COMMENT 'A unique identifier for staff members',
  `StaffName` varchar(60) NOT NULL COMMENT 'The full name of a staff member',
  `Department` varchar(15) DEFAULT NULL COMMENT 'The department name a staff member works in',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `ManagerId` int DEFAULT NULL COMMENT 'The ID of a staff member that supervises an employee',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `StaffHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.HumanResources.StaffHistory',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  PRIMARY KEY (`StaffHistoryId`),
  CONSTRAINT `CK_Audit_HumanResourcesStaffHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for Staff';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.HumanResources.StaffHistory`
--

LOCK TABLES `Audit.HumanResources.StaffHistory` WRITE;
/*!40000 ALTER TABLE `Audit.HumanResources.StaffHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.HumanResources.StaffHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Locale.CountryHistory`
--

DROP TABLE IF EXISTS `Audit.Locale.CountryHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Locale.CountryHistory` (
  `CountryId` int NOT NULL COMMENT 'A unique identifier for countries',
  `CountryISO3` char(3) NOT NULL COMMENT 'The ISO3 format of a country',
  `CountryName` varchar(50) NOT NULL COMMENT 'The name of the country',
  `CountryISO2` varchar(2) NOT NULL COMMENT 'The ISO2 format of a country',
  `SalesRegion` varchar(20) NOT NULL COMMENT 'The name of the sales region a coutry belongs to',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `LocaleCountryHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Locale.CountryHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  PRIMARY KEY (`LocaleCountryHistoryId`),
  CONSTRAINT `CK_Audit_LocaleCountryHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Locale.CountryHistory`
--

LOCK TABLES `Audit.Locale.CountryHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Locale.CountryHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Locale.CountryHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Production.ManufacturerModelHistory`
--

DROP TABLE IF EXISTS `Audit.Production.ManufacturerModelHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Production.ManufacturerModelHistory` (
  `ManufacturerModelId` int NOT NULL COMMENT 'A unique identifier for vehicle models',
  `ManufacturerModelName` varchar(35) NOT NULL COMMENT 'The name of a vehicle model',
  `ManufacturerModelVariant` varchar(35) DEFAULT NULL COMMENT 'The name of a vehicle model variant if applicable',
  `ManufacturerVehicleMakeId` int NOT NULL COMMENT 'A unique identifier for vehicle makes',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `ProductionManufacturerModelHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Production.ManufacturerModelHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  PRIMARY KEY (`ProductionManufacturerModelHistoryId`),
  CONSTRAINT `CK_ProductionManufacturerVehicleModelHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for ManufacturerModel';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Production.ManufacturerModelHistory`
--

LOCK TABLES `Audit.Production.ManufacturerModelHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Production.ManufacturerModelHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Production.ManufacturerModelHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Production.ManufacturerVehicleMakeHistory`
--

DROP TABLE IF EXISTS `Audit.Production.ManufacturerVehicleMakeHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Production.ManufacturerVehicleMakeHistory` (
  `ManufacturerVehicleMakeId` int NOT NULL COMMENT 'A unique identifier for vehicle makes',
  `ManufacturerVehicleMakeName` varchar(30) NOT NULL COMMENT 'The name of a vehicles make',
  `CountryId` int NOT NULL COMMENT 'A unique identifier for countries',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `ProductionManufacturerVehicleMakeHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Production.ManufacturerVehicleMakeHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  `MarketingType` varchar(25) DEFAULT NULL COMMENT 'The marketing type of a vehicle make',
  PRIMARY KEY (`ProductionManufacturerVehicleMakeHistoryId`),
  CONSTRAINT `CK_Audit_ProductionManufacturerVehicleHistory_AuditDateTimeStamp` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for ManufacturerVehicleMake';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Production.ManufacturerVehicleMakeHistory`
--

LOCK TABLES `Audit.Production.ManufacturerVehicleMakeHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Production.ManufacturerVehicleMakeHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Production.ManufacturerVehicleMakeHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Production.ManufacturerVehicleStockHistory`
--

DROP TABLE IF EXISTS `Audit.Production.ManufacturerVehicleStockHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Production.ManufacturerVehicleStockHistory` (
  `ManufacturerVehicleStockId` int NOT NULL COMMENT 'A unique identifier for manfacturer vehicle stock',
  `StockCode` varchar(50) NOT NULL COMMENT 'The stock code of a vehicle',
  `Cost` decimal(18,2) NOT NULL COMMENT 'The cost of a vehicle from the manufacturer',
  `RepairsCharge` decimal(18,2) NOT NULL COMMENT 'The charge for repairs on a vehicle',
  `PartsCharge` decimal(18,2) NOT NULL COMMENT 'The charge for parts on a vehicle',
  `DeliveryCharge` decimal(18,2) NOT NULL COMMENT 'The charge for delivery of a vehicle',
  `IsPremiumRoadHandlingPackage` int NOT NULL COMMENT 'A flag to determine if a vehicle has a premium road handling package',
  `VehicleColor` varchar(20) NOT NULL COMMENT 'The color of the vehicle',
  `CustomerComment` varchar(200) DEFAULT NULL COMMENT 'A comment added by a customer',
  `ModelId` int NOT NULL COMMENT 'A unique identifier for vehicle models',
  `PurchaseDate` datetime NOT NULL COMMENT 'The date of purchase',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `ProductionManufacturerVehicleStockHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Production.ManufacturerVehicleStockHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  PRIMARY KEY (`ProductionManufacturerVehicleStockHistoryId`),
  CONSTRAINT `CK_ProductionManufacturerVehicleStockHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for ManufacturerVehicleStock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Production.ManufacturerVehicleStockHistory`
--

LOCK TABLES `Audit.Production.ManufacturerVehicleStockHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Production.ManufacturerVehicleStockHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Production.ManufacturerVehicleStockHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Sales.CustomerHistory`
--

DROP TABLE IF EXISTS `Audit.Sales.CustomerHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Sales.CustomerHistory` (
  `CustomerId` int NOT NULL COMMENT 'A unique identifier for customers',
  `CustomerName` varchar(65) NOT NULL COMMENT 'The full name of a customer',
  `CustomerAddress1` varchar(60) NOT NULL COMMENT 'The street address of a customer',
  `CustomerAddress2` varchar(60) DEFAULT NULL COMMENT 'The extended street address of a customer',
  `CustomerTown` varchar(30) NOT NULL COMMENT 'The town or city a customer resides in',
  `CustomerPostalCode` varchar(9) DEFAULT NULL COMMENT 'The postal code of a customer if applicable',
  `CountryId` int NOT NULL COMMENT 'A unique identifier for countries',
  `IsCustomerReseller` int NOT NULL COMMENT 'Flag to determine if a customer is a reseller',
  `IsCustomerCreditRisk` int NOT NULL COMMENT 'Flag to determine if customer is a credit risk',
  `SpendCapacity` varchar(15) DEFAULT NULL COMMENT 'The spend capacity of a customer',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `SalesCustomerHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Sales.CustomerHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  PRIMARY KEY (`SalesCustomerHistoryId`),
  CONSTRAINT `CK_Audit_SalesSalesCustomerHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Sales.CustomerHistory`
--

LOCK TABLES `Audit.Sales.CustomerHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Sales.CustomerHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Sales.CustomerHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Sales.OrderVehicleDetailHistory`
--

DROP TABLE IF EXISTS `Audit.Sales.OrderVehicleDetailHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Sales.OrderVehicleDetailHistory` (
  `SalesOrderVehicleDetailId` int NOT NULL COMMENT 'A unique identifier for Audit.Sales.OrderVehicleDetailHistory Ids',
  `SalesOrderVehicleId` int DEFAULT NULL COMMENT 'A unique identifier for a purchase',
  `LineItemNumber` int NOT NULL COMMENT 'The line item number on the invoice',
  `SalePrice` decimal(18,2) NOT NULL COMMENT 'The sale price of a vehicle',
  `LineItemDiscount` decimal(18,2) NOT NULL COMMENT 'The discount of the line item number',
  `ManufacturerVehicleStockId` int NOT NULL COMMENT 'A unique identifier for manfacturer vehicle stock',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `SalesSalesOrderVehicleDetailHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Sales.OrderVehicleDetailHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `DerivedDiscountedSalePrice` decimal(18,2) DEFAULT NULL COMMENT 'The derived discounted sale price of a vehicle',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  PRIMARY KEY (`SalesSalesOrderVehicleDetailHistoryId`),
  CONSTRAINT `CK_SalesSalesOrderVehicleDetailHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for SalesOrderVehicleDetail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Sales.OrderVehicleDetailHistory`
--

LOCK TABLES `Audit.Sales.OrderVehicleDetailHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Sales.OrderVehicleDetailHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Sales.OrderVehicleDetailHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Audit.Sales.OrderVehicleHistory`
--

DROP TABLE IF EXISTS `Audit.Sales.OrderVehicleHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Audit.Sales.OrderVehicleHistory` (
  `SalesOrderVehicleId` int NOT NULL COMMENT 'A unique identifier for a purchase',
  `CustomerId` int NOT NULL COMMENT 'A unique identifier for customers',
  `StaffId` int NOT NULL COMMENT 'A unique identifier for staff members',
  `InvoiceNumber` varchar(8) NOT NULL COMMENT 'The invoice number of an order',
  `TotalSalePrice` decimal(18,2) NOT NULL COMMENT 'The total sale price of an order',
  `SaleDate` datetime NOT NULL COMMENT 'The date an order was made',
  `UserAuthorizationId` int NOT NULL COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT NULL COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `SalesSalesOrderVehicleHistoryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for audit entries in Audit.Sales.OrderVehicleHistory',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL COMMENT 'A flag to indicate if an audit trigger should be fired',
  `AuditDateTimeStamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions',
  `DBAction` char(1) NOT NULL COMMENT 'Represents the type of action that took place in the database',
  `CategoryDescription` varchar(20) NOT NULL COMMENT 'The category description a vehicle sales threshold',
  PRIMARY KEY (`SalesSalesOrderVehicleHistoryId`),
  CONSTRAINT `CK_SalesSalesOrderVehicleHistory_DBAction` CHECK (((`DBAction` = _utf8mb4'U') or (`DBAction` = _utf8mb4'I') or (`DBAction` = _utf8mb4'D')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The audit history table for SalesOrderVehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Audit.Sales.OrderVehicleHistory`
--

LOCK TABLES `Audit.Sales.OrderVehicleHistory` WRITE;
/*!40000 ALTER TABLE `Audit.Sales.OrderVehicleHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `Audit.Sales.OrderVehicleHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `CustomViews.uvw_ChuanCustomerCountry`
--

DROP TABLE IF EXISTS `CustomViews.uvw_ChuanCustomerCountry`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanCustomerCountry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_ChuanCustomerCountry` AS SELECT 
 1 AS `CustomerName`,
 1 AS `CountryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_ChuanMakeCountry`
--

DROP TABLE IF EXISTS `CustomViews.uvw_ChuanMakeCountry`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanMakeCountry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_ChuanMakeCountry` AS SELECT 
 1 AS `Country`,
 1 AS `Make`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_ChuanModelMake`
--

DROP TABLE IF EXISTS `CustomViews.uvw_ChuanModelMake`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanModelMake`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_ChuanModelMake` AS SELECT 
 1 AS `Model`,
 1 AS `Make`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_ChuanStaffDiscountGiven`
--

DROP TABLE IF EXISTS `CustomViews.uvw_ChuanStaffDiscountGiven`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanStaffDiscountGiven`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_ChuanStaffDiscountGiven` AS SELECT 
 1 AS `StaffName`,
 1 AS `DiscountGiven`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_ChuanStaffSales`
--

DROP TABLE IF EXISTS `CustomViews.uvw_ChuanStaffSales`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanStaffSales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_ChuanStaffSales` AS SELECT 
 1 AS `StaffName`,
 1 AS `TotalSales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_JimmyCustomerMakeModel`
--

DROP TABLE IF EXISTS `CustomViews.uvw_JimmyCustomerMakeModel`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_JimmyCustomerMakeModel`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_JimmyCustomerMakeModel` AS SELECT 
 1 AS `CustName`,
 1 AS `MakeName`,
 1 AS `Model`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail`
--

DROP TABLE IF EXISTS `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail` AS SELECT 
 1 AS `CustName`,
 1 AS `TotalSale`,
 1 AS `SalePrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_JimmyModelCountry`
--

DROP TABLE IF EXISTS `CustomViews.uvw_JimmyModelCountry`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_JimmyModelCountry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_JimmyModelCountry` AS SELECT 
 1 AS `ModelName`,
 1 AS `CountryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_MehrshadVehicleCost`
--

DROP TABLE IF EXISTS `CustomViews.uvw_MehrshadVehicleCost`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_MehrshadVehicleCost`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_MehrshadVehicleCost` AS SELECT 
 1 AS `ManufacturerVehicleMakeName`,
 1 AS `ManufacturerModelName`,
 1 AS `Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_MehrshadYearlyCustomerSales`
--

DROP TABLE IF EXISTS `CustomViews.uvw_MehrshadYearlyCustomerSales`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_MehrshadYearlyCustomerSales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_MehrshadYearlyCustomerSales` AS SELECT 
 1 AS `SaleDate`,
 1 AS `CustomerName`,
 1 AS `ManufacturerVehicleMakeName`,
 1 AS `ManufacturerModelName`,
 1 AS `SalePrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_MehrshadYearlySalesProfits`
--

DROP TABLE IF EXISTS `CustomViews.uvw_MehrshadYearlySalesProfits`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_MehrshadYearlySalesProfits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_MehrshadYearlySalesProfits` AS SELECT 
 1 AS `SalesYear`,
 1 AS `MakeName`,
 1 AS `ModelName`,
 1 AS `CustomerName`,
 1 AS `Cost`,
 1 AS `RepairsCharge`,
 1 AS `PartsCost`,
 1 AS `TransportInCost`,
 1 AS `SalePrice`,
 1 AS `SaleDate`,
 1 AS `Profit`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_RalphEmployeeManager`
--

DROP TABLE IF EXISTS `CustomViews.uvw_RalphEmployeeManager`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RalphEmployeeManager`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_RalphEmployeeManager` AS SELECT 
 1 AS `Employee Name`,
 1 AS `Employee Department`,
 1 AS `Manager Name`,
 1 AS `Manager Department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_RalphMakeModelPartsCost`
--

DROP TABLE IF EXISTS `CustomViews.uvw_RalphMakeModelPartsCost`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RalphMakeModelPartsCost`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_RalphMakeModelPartsCost` AS SELECT 
 1 AS `Make`,
 1 AS `Model`,
 1 AS `Parts Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_RyanCustomerCountryDate`
--

DROP TABLE IF EXISTS `CustomViews.uvw_RyanCustomerCountryDate`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RyanCustomerCountryDate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_RyanCustomerCountryDate` AS SELECT 
 1 AS `CustomerName`,
 1 AS `CountryName`,
 1 AS `StartTime`,
 1 AS `EndTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_RyanCustomerLatestTotalSaleDate`
--

DROP TABLE IF EXISTS `CustomViews.uvw_RyanCustomerLatestTotalSaleDate`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RyanCustomerLatestTotalSaleDate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_RyanCustomerLatestTotalSaleDate` AS SELECT 
 1 AS `CustomerName`,
 1 AS `TotalSalePrice`,
 1 AS `LatestSaleDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `CustomViews.uvw_RyanGroupSpendCapacity`
--

DROP TABLE IF EXISTS `CustomViews.uvw_RyanGroupSpendCapacity`;
/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RyanGroupSpendCapacity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomViews.uvw_RyanGroupSpendCapacity` AS SELECT 
 1 AS `GroupName`,
 1 AS `TotalSpendCapacity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `DbSecurity.UserAuthorization`
--

DROP TABLE IF EXISTS `DbSecurity.UserAuthorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DbSecurity.UserAuthorization` (
  `UserAuthorizationId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for UserAuthorizationIds',
  `ClassTime` char(5) DEFAULT '10:45' COMMENT 'The class time for CSCI381 Data Modeling',
  `IndividualProject` varchar(60) DEFAULT 'CSCI381 Final Project' COMMENT 'The name of the individual project',
  `GroupMemberLastName` varchar(35) NOT NULL COMMENT 'The group members last name',
  `GroupMemberFirstName` varchar(25) NOT NULL COMMENT 'The group members first name',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `GroupName` varchar(20) NOT NULL DEFAULT 'Group 3' COMMENT 'The name of the group',
  PRIMARY KEY (`UserAuthorizationId`),
  CONSTRAINT `CK_DbSecurity_UserAuthorization_ClassTime` CHECK ((regexp_like(`ClassTime`,_utf8mb4'^[0-1][0-9]:[0-5][0-9]$') or regexp_like(`ClassTime`,_utf8mb4'^[0-1][0-9]:[0-5][0-9]$'))),
  CONSTRAINT `CK_DbSecurity_UserAuthorization_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_DbSecurity_UserAuthorization_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The authorization of database actions by a user';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DbSecurity.UserAuthorization`
--

LOCK TABLES `DbSecurity.UserAuthorization` WRITE;
/*!40000 ALTER TABLE `DbSecurity.UserAuthorization` DISABLE KEYS */;
INSERT INTO `DbSecurity.UserAuthorization` VALUES (1,'10:45','CSCI381 Final Project','Granata','Ralph','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3'),(2,'10:45','CSCI381 Final Project','Chen','Chuan','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3'),(3,'10:45','CSCI381 Final Project','Eshaghianpour','Mehrshad','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3'),(4,'10:45','CSCI381 Final Project','Hasiholan','Kenneth','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3'),(5,'10:45','CSCI381 Final Project','King','Ryan','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3'),(6,'10:45','CSCI381 Final Project','Puli','Jimmy','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3'),(7,'10:45','CSCI381 Final Project','Khattak','Savaze','2023-12-08 05:03:57','2023-12-08 05:03:57','Group 3');
/*!40000 ALTER TABLE `DbSecurity.UserAuthorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HumanResources.Staff`
--

DROP TABLE IF EXISTS `HumanResources.Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HumanResources.Staff` (
  `StaffId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for staff members',
  `ManagerId` int DEFAULT NULL COMMENT 'The ID of a staff member that supervises an employee',
  `StaffName` varchar(60) NOT NULL COMMENT 'The full name of a staff member',
  `Department` varchar(15) DEFAULT NULL COMMENT 'The department name a staff member works in',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  PRIMARY KEY (`StaffId`),
  KEY `FK_HumanResources.Staff_HumanResources.Staff` (`ManagerId`),
  KEY `FK_HumanResources.Staff_DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_HumanResources.Staff_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_HumanResources.Staff_HumanResources.Staff` FOREIGN KEY (`ManagerId`) REFERENCES `HumanResources.Staff` (`StaffId`),
  CONSTRAINT `CK_HumanResources_Staff_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_HumanResources_Staff_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A staff member of the business who sells vehicles to customers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HumanResources.Staff`
--

LOCK TABLES `HumanResources.Staff` WRITE;
/*!40000 ALTER TABLE `HumanResources.Staff` DISABLE KEYS */;
INSERT INTO `HumanResources.Staff` VALUES (1,NULL,'Amelia',NULL,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(2,1,'Gerard','Finance',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(3,1,'Chloe','Marketing',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(4,1,'Susa','Sales',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(5,4,'Andy','Sales',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(6,4,'Steve','Sales',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(7,4,'Sta','Sales',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(8,4,'Natha','Sales',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(9,4,'Maggie','Sales',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(10,2,'Jenny','Finance',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(11,2,'Chris','Finance',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(12,3,'Mega','Marketing',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `HumanResources.Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locale.Country`
--

DROP TABLE IF EXISTS `Locale.Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locale.Country` (
  `CountryId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for countries',
  `CountryISO3` char(3) NOT NULL COMMENT 'The ISO3 format of a country',
  `CountryName` varchar(50) NOT NULL COMMENT 'The name of the country',
  `CountryISO2` varchar(2) NOT NULL COMMENT 'The ISO2 format of a country',
  `SalesRegion` varchar(20) NOT NULL COMMENT 'The name of the sales region a coutry belongs to',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  PRIMARY KEY (`CountryId`),
  KEY `FK_Locale.Country_DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Locale.Country_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `CK_Locale_Country_CountryISO2` CHECK (regexp_like(`CountryISO2`,_utf8mb4'^[A-Z][A-Z]$')),
  CONSTRAINT `CK_Locale_Country_CountryISO3` CHECK (regexp_like(`CountryISO3`,_utf8mb4'^[A-Z][A-Z][A-Z]$')),
  CONSTRAINT `CK_Locale_Country_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_Locale_Country_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Locale_Country_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A country or territory in the world';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locale.Country`
--

LOCK TABLES `Locale.Country` WRITE;
/*!40000 ALTER TABLE `Locale.Country` DISABLE KEYS */;
INSERT INTO `Locale.Country` VALUES (1,'BEL','Belgium','BE','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(2,'CHF','Switzerland','CH','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(3,'CHI','China','CN','Asia',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(4,'DEU','Germany','DE','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(5,'ESP','Spain','ES','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(6,'FRA','France','FR','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(7,'GBR','United Kingdom','GB','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(8,'IND','India','IN','Asia',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(9,'ITA','Italy','IT','EMEA',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(10,'USA','United States','US','North America',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `Locale.Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Production.ManufacturerModel`
--

DROP TABLE IF EXISTS `Production.ManufacturerModel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Production.ManufacturerModel` (
  `ManufacturerModelId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for vehicle models',
  `ManufacturerModelName` varchar(35) NOT NULL COMMENT 'The name of a vehicle model',
  `ManufacturerModelVariant` varchar(35) DEFAULT NULL COMMENT 'The name of a vehicle model variant if applicable',
  `ManufacturerVehicleMakeId` int NOT NULL COMMENT 'A unique identifier for vehicle makes',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  PRIMARY KEY (`ManufacturerModelId`),
  KEY `FK_Production.ManufacturerModel_Production.ManufacturerVehicleMa` (`ManufacturerVehicleMakeId`),
  KEY `FK_Production.ManufacturerModel_DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Production.ManufacturerModel_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Production.ManufacturerModel_Production.ManufacturerVehicleMa` FOREIGN KEY (`ManufacturerVehicleMakeId`) REFERENCES `Production.ManufacturerVehicleMake` (`ManufacturerVehicleMakeId`),
  CONSTRAINT `CK_Production_ManufacturerModel_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_Production_ManufacturerModel_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Production_ManufacturerModel_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The model of a particular vehicle created by the manufacturer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Production.ManufacturerModel`
--

LOCK TABLES `Production.ManufacturerModel` WRITE;
/*!40000 ALTER TABLE `Production.ManufacturerModel` DISABLE KEYS */;
INSERT INTO `Production.ManufacturerModel` VALUES (1,'Daytona',NULL,1,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(2,'Testarossa',NULL,1,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(3,'355',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(4,'308',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(5,'Dino',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(6,'Mondial',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(7,'F40',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(8,'F50',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(9,'360',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(10,'Enzo',NULL,1,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(11,'911',NULL,2,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(12,'924',NULL,2,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(13,'944',NULL,2,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(14,'959',NULL,2,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(15,'928',NULL,2,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(16,'Boxster',NULL,2,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(17,'Countach',NULL,3,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(18,'Diabolo',NULL,3,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(19,'Jarama',NULL,3,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(20,'400GT',NULL,3,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(21,'DB2',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(22,'DB4',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(23,'DB5',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(24,'DB6',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(25,'DB9',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(26,'Virage',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(27,'Vantage',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(28,'Vanquish',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(29,'Rapide',NULL,4,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(30,'Mulsanne',NULL,5,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(31,'Continental',NULL,5,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(32,'Flying Spur',NULL,5,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(33,'Arnage',NULL,5,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(34,'Brooklands',NULL,5,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(35,'Phantom',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(36,'Ghost',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(37,'Wraith',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(38,'Silver Shadow',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(39,'Corniche',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(40,'Camargue',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(41,'Silver Seraph',NULL,6,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(42,'57',NULL,7,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(43,'62',NULL,7,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(44,'Exelero',NULL,7,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(45,'280SL',NULL,8,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(46,'350SL',NULL,8,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(47,'500SL',NULL,8,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(48,'250SL',NULL,8,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(49,'R107',NULL,8,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(50,'W107',NULL,8,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(51,'Giulia',NULL,9,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(52,'Spider',NULL,9,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(53,'1750',NULL,9,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(54,'Giulietta',NULL,9,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(55,'Lichfield',NULL,10,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(56,'Princess',NULL,10,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(57,'Cambridge',NULL,10,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(58,'Isetta',NULL,11,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(59,'Alpina',NULL,11,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(60,'E30',NULL,11,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(61,'35',NULL,12,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(62,'Veyron',NULL,12,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(63,'57C',NULL,12,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(64,'Torpedo',NULL,13,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(65,'Rosalie',NULL,13,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(66,'Traaction Avant',NULL,13,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(67,'135',NULL,14,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(68,'145',NULL,14,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(69,'175',NULL,14,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(70,'DMC 12',NULL,15,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(71,'Mark V',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(72,'Mark X',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(73,'XJ12',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(74,'XK120',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(75,'XK150',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(76,'XJS',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(77,'E-Type',NULL,16,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(78,'V12',NULL,17,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(79,'3 Litre',NULL,17,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(80,'P1',NULL,18,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(81,'Plus 8',NULL,19,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(82,'Plus 4',NULL,19,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(83,'Supersport',NULL,19,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(84,'M14',NULL,20,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(85,'M600',NULL,20,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(86,'TR4',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(87,'TR5',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(88,'TR6',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(89,'TR7',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(90,'GT6',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(91,'Roadster',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(92,'Stag',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(93,'TR3A',NULL,21,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(94,'500',NULL,22,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(95,'600',NULL,22,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(96,'205',NULL,23,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(97,'Type VA',NULL,23,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(98,'404',NULL,23,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(99,'203',NULL,23,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(100,'Robin',NULL,24,1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `Production.ManufacturerModel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Production.ManufacturerVehicleMake`
--

DROP TABLE IF EXISTS `Production.ManufacturerVehicleMake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Production.ManufacturerVehicleMake` (
  `ManufacturerVehicleMakeId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for vehicle makes',
  `ManufacturerVehicleMakeName` varchar(30) NOT NULL COMMENT 'The name of a vehicle make',
  `CountryId` int NOT NULL COMMENT 'A unique identifier for countries',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  `MarketingType` varchar(25) DEFAULT NULL COMMENT 'The marketing type of a vehicle make',
  PRIMARY KEY (`ManufacturerVehicleMakeId`),
  KEY `FK_Production.ManufacturerVehicleMake_Locale.Country` (`CountryId`),
  KEY `FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorizati` (`UserAuthorizationId`),
  CONSTRAINT `FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorizati` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Production.ManufacturerVehicleMake_Locale.Country` FOREIGN KEY (`CountryId`) REFERENCES `Locale.Country` (`CountryId`),
  CONSTRAINT `CK_Production_ManufacturerVehicleMake_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Production_ManufacturerVehicleMake_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Production_ManufacturerVehicleMakel_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The company responsible for the production of a vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Production.ManufacturerVehicleMake`
--

LOCK TABLES `Production.ManufacturerVehicleMake` WRITE;
/*!40000 ALTER TABLE `Production.ManufacturerVehicleMake` DISABLE KEYS */;
INSERT INTO `Production.ManufacturerVehicleMake` VALUES (1,'Ferrari',9,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(2,'Porsche',4,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports,Tourer'),(3,'Lamborghini',9,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(4,'Aston Martin',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports,Tourer'),(5,'Bentley',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Tourer,Chauffer,Prestige'),(6,'Rolls Royce',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Chauffer,Prestige'),(7,'Maybach',4,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Chauffer,Prestige'),(8,'Mercedes',4,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Tourer,Sports'),(9,'Alfa Romeo',9,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(10,'Austi',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Relic'),(11,'BMW',4,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports,Tourer'),(12,'Bugatti',6,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(13,'Citroe',6,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family'),(14,'Delahaye',6,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family'),(15,'Delorea',10,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports,Family'),(16,'Jaguar',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports,Family'),(17,'Lagonda',9,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(18,'McLaren',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(19,'Morga',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(20,'Noble',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(21,'Triumph',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Sports'),(22,'Trabant',4,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family'),(23,'Peugeot',4,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family'),(24,'Reliant',6,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family'),(25,'Riley',7,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family'),(26,'Cadillac',10,1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N','Family');
/*!40000 ALTER TABLE `Production.ManufacturerVehicleMake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Production.ManufacturerVehicleStock`
--

DROP TABLE IF EXISTS `Production.ManufacturerVehicleStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Production.ManufacturerVehicleStock` (
  `ManufacturerVehicleStockId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for manfacturer vehicle stock',
  `StockCode` varchar(50) NOT NULL COMMENT 'The stock code of a vehicle',
  `Cost` decimal(18,2) NOT NULL COMMENT 'The cost of a vehicle from the manufacturer',
  `RepairsCharge` decimal(18,2) NOT NULL COMMENT 'The charge for repairs on a vehicle',
  `PartsCharge` decimal(18,2) NOT NULL COMMENT 'The charge for parts on a vehicle',
  `DeliveryCharge` decimal(18,2) NOT NULL COMMENT 'The charge for delivery of a vehicle',
  `IsPremiumRoadHandlingPackage` int NOT NULL DEFAULT '0' COMMENT 'A flag to determine if a vehicle has a premium road handling package',
  `VehicleColor` varchar(20) NOT NULL COMMENT 'The color of the vehicle',
  `CustomerComment` varchar(200) DEFAULT NULL COMMENT 'A comment added by a customer',
  `ModelId` int NOT NULL COMMENT 'A unique identifier for vehicle models',
  `PurchaseDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The date of purchase',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  PRIMARY KEY (`ManufacturerVehicleStockId`),
  KEY `FK_Production.ManufacturerVehicleStock_Production.ManufacturerMo` (`ModelId`),
  KEY `FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorizat` (`UserAuthorizationId`),
  CONSTRAINT `FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorizat` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Production.ManufacturerVehicleStock_Production.ManufacturerMo` FOREIGN KEY (`ModelId`) REFERENCES `Production.ManufacturerModel` (`ManufacturerModelId`),
  CONSTRAINT `CK_Production_ManfuacturerVehicleStock_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_Cost` CHECK ((`Cost` >= 0)),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_DeliveryCharge` CHECK ((`DeliveryCharge` >= 0)),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_IsPremiumRoadHandlingPack` CHECK (((`IsPremiumRoadHandlingPackage` = 0) or (`IsPremiumRoadHandlingPackage` = 1))),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_PartsCharge` CHECK ((`PartsCharge` >= 0)),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_RepairsCharge` CHECK ((`RepairsCharge` >= 0)),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Production_ManufacturerVehicleStock_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A produced physical vehicle that a manufacturer has in stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Production.ManufacturerVehicleStock`
--

LOCK TABLES `Production.ManufacturerVehicleStock` WRITE;
/*!40000 ALTER TABLE `Production.ManufacturerVehicleStock` DISABLE KEYS */;
INSERT INTO `Production.ManufacturerVehicleStock` VALUES (1,'B1C3B95E-3005-4840-8CE3-A7BC5F9CFB3F',52000.00,2175.00,1500.00,750.00,1,'Red','Superb Car! Wish I could afford a second one!',100,'2015-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(2,'A2C3B95E-3005-4840-8CE3-A7BC5F9CFB5F',176000.00,5500.00,2200.00,1950.00,1,'Blue',NULL,69,'2015-01-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(3,'558620F5-B9E8-4FFF-8F73-A83FA9559C41',15600.00,660.00,0.00,150.00,1,'British Racing Green','An absolute example of the pinnacle of British engineering. This is a wonderful piece of kit.',45,'2015-01-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(4,'72443561-FAC4-4C25-B8FF-0C47361DDE2D',9200.00,500.00,750.00,150.00,1,'British Racing Green',NULL,4,'2015-02-14 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(5,'2189D556-D1C4-4BC1-B0C8-4053319E8E9D',15960.00,1360.00,500.00,150.00,1,'Red',NULL,64,'2015-01-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(6,'DE3096AD-76F9-4AAF-B2E1-49FA8E2C377F',176000.00,1000.00,3150.00,1950.00,1,'Black',NULL,87,'2015-03-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(7,'C1459308-7EA5-4A2D-82BC-38079BB4049B',23600.00,500.00,750.00,150.00,1,'Night Blue',NULL,60,'2015-03-05 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(8,'E6E6270A-60B0-4817-AA57-17F26B2B8DAF',39600.00,2500.00,1500.00,550.00,1,'Black','FAbulous motor!',87,'2015-03-15 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(9,'CEDFB8D2-BD98-4A08-BC46-406D23940527',60800.00,3250.00,750.00,750.00,0,'Canary Yellow',NULL,53,'2015-03-26 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(10,'8BD326B3-8DE8-4DC9-9F96-FD132C5E1BF2',172000.00,750.00,150.00,1950.00,1,'Red',NULL,58,'2015-04-04 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(11,'6081DBE7-9AD6-4C64-A676-61D919E64979',15680.00,890.00,500.00,150.00,1,'Blue',NULL,30,'2015-04-04 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(12,'D63C8CC9-DB19-4B9C-9C8E-6C6370812041',29200.00,1950.00,500.00,550.00,1,'Blue',NULL,36,'2015-04-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(13,'F3A2712D-20CA-495D-9F6A-8A4CA195248D',6800.00,250.00,225.00,150.00,1,'Blue',NULL,64,'2015-04-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(14,'EDCCE461-5DA8-4E2E-8F08-798431841575',36000.00,1250.00,750.00,550.00,1,'Night Blue',NULL,61,'2015-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(15,'4C57F13A-E21B-4AAC-9E9D-A219D4C691C6',64400.00,500.00,750.00,750.00,1,'British Racing Green',NULL,31,'2015-05-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(16,'98C1E31A-4258-4F78-95D4-2365167E6F3F',135600.00,5500.00,2200.00,1950.00,1,'Black',NULL,79,'2015-05-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(17,'951195C4-7B69-418B-9AC2-61CCB7FE7C09',7160.00,500.00,750.00,150.00,1,'Green',NULL,55,'2015-05-26 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(18,'91CF8133-EF19-4C92-BEFB-6A24FD85EF3A',156000.00,6000.00,1500.00,1950.00,1,'Green',NULL,19,'2015-06-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(19,'BCCB9C13-AEDA-4467-A014-48F0C7A0D6A4',18360.00,550.00,500.00,150.00,1,'Red',NULL,74,'2015-06-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(20,'94FF5451-471C-4F17-BE27-BA55D3ECF5DC',6956.00,400.00,750.00,150.00,1,'Red',NULL,18,'2015-07-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(21,'325F4D73-D44A-44BD-B109-AD25D924D38F',18392.00,390.00,150.00,150.00,1,'Night Blue',NULL,86,'2015-07-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(22,'FDCDF3F0-F0AD-4E7F-8793-8B146700D035',15600.00,290.00,750.00,150.00,1,'Silver',NULL,34,'2015-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(23,'34CEE6C8-985B-4005-AB2F-AD3235C6A16D',44800.00,1785.00,500.00,550.00,1,'Canary Yellow',NULL,96,'2015-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(24,'CE0A56A6-8218-4F4C-A0E2-63F3DC9E4AE6',7040.00,140.00,750.00,150.00,1,'Blue',NULL,1,'2015-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(25,'BEECAE2C-0A38-473D-893F-7C8917A779C2',4400.00,500.00,750.00,150.00,1,'Night Blue',NULL,7,'2015-08-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(26,'5672C4AF-78E1-4BA4-B1D1-19383DCBE43C',10120.00,320.00,750.00,150.00,1,'Green',NULL,36,'2015-08-24 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(27,'C001858B-0B5D-4648-8F0D-80269964C921',125200.00,2200.00,3150.00,1950.00,1,'British Racing Green',NULL,56,'2015-09-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(28,'F95052DB-3E09-4070-ADA4-5114CCAD96C0',7160.00,360.00,750.00,150.00,1,'Black',NULL,68,'2015-09-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(29,'A6FCB276-6311-4B3E-9C99-23F197952F1C',44360.00,490.00,225.00,550.00,1,'Red',NULL,90,'2015-09-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(30,'646C802F-C868-40F0-AF81-1BF387AFB82B',12480.00,1100.00,500.00,150.00,1,'Red',NULL,94,'2015-10-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(31,'1BB4B941-79F4-4E98-9E13-46875CA7EB67',18080.00,660.00,750.00,150.00,0,'Red',NULL,99,'2015-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(32,'86450D0C-EAA5-4B83-A9DA-55D742E9C2D8',9352.00,500.00,750.00,150.00,1,'Black',NULL,88,'2015-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(33,'26A3D067-DCEA-4FF1-9A97-E7AEE0D2BC14',43000.00,2000.00,750.00,550.00,1,'British Racing Green',NULL,3,'2015-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(34,'18E980AB-452D-42EF-8728-12822AD20C60',98872.00,2175.00,2200.00,750.00,1,'Black',NULL,85,'2015-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(35,'F2DE934E-62C3-45F6-AFA8-2FFA963F5360',18360.00,500.00,750.00,150.00,1,'Black',NULL,86,'2015-11-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(36,'0CC75388-9A95-4F14-8D9A-8373E3B44D8A',55600.00,1490.00,1500.00,750.00,1,'Silver',NULL,2,'2015-11-11 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(37,'5CCF4F6B-43B3-4C7F-B674-6CAFD056E52A',10000.00,500.00,225.00,150.00,1,'Silver',NULL,80,'2015-12-22 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(38,'E264504D-3451-4670-AAB8-E4C66F2387B0',10000.00,500.00,750.00,150.00,1,'Black',NULL,8,'2015-12-23 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(39,'A926BB6C-FC26-4EBB-997E-2DF7EDC48E92',127600.00,2000.00,3150.00,1950.00,1,'Silver',NULL,16,'2015-12-24 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(40,'202B3C90-188F-413E-A44A-B99F16F03464',132000.00,3950.00,2200.00,1950.00,1,'Night Blue',NULL,17,'2015-12-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(41,'486C65E8-5CB9-4A33-9507-E2E5E3CB91CC',2040.00,500.00,750.00,150.00,1,'British Racing Green',NULL,17,'2016-01-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(42,'3F3BED8D-1203-4D3E-8AC0-3ACAC73BDE17',23600.00,1360.00,500.00,150.00,0,'Black',NULL,58,'2016-01-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(43,'281946B6-D061-455A-801B-A0EDF3E37530',10120.00,500.00,750.00,150.00,1,'Night Blue',NULL,50,'2016-01-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(44,'98A92DA3-2B99-4625-998B-2BB2FBB8F167',45560.00,2000.00,750.00,550.00,0,'Pink',NULL,40,'2016-01-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(45,'A9D335E7-2389-4DE1-9484-DC4EC6BA81D4',44800.00,1360.00,500.00,550.00,1,'British Racing Green',NULL,6,'2016-01-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(46,'53C088BA-6E14-4758-826A-56FC57D3EEDA',52712.00,1490.00,1500.00,750.00,1,'Canary Yellow',NULL,29,'2016-02-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(47,'6C76FDEC-683F-45E1-B027-20ACFD2F501C',4800.00,500.00,750.00,150.00,1,'British Racing Green',NULL,71,'2016-02-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(48,'373B7D39-B5A3-4018-883C-AC81EF3B5D8F',38280.00,660.00,750.00,550.00,1,'Red',NULL,11,'2016-02-11 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(49,'C82D133F-3442-464B-A16A-D5419A9E1CDF',125560.00,2000.00,750.00,1950.00,1,'Red',NULL,55,'2016-02-27 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(50,'A7A80CA3-06D6-40AF-A558-09146A650340',31600.00,500.00,1500.00,550.00,1,'Green',NULL,92,'2016-03-15 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(51,'A2112C27-FE1F-48C5-A3BE-A019EE17DDD6',2920.00,500.00,750.00,150.00,1,'Green',NULL,34,'2016-03-19 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(52,'88AFBF67-13A6-4BC5-AE50-8C64F0F25453',176400.00,5500.00,3150.00,1950.00,0,'Blue',NULL,51,'2016-04-17 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(53,'11790E1E-859C-4E05-B6B3-6D72DDCC8DAE',82360.00,2175.00,2200.00,750.00,1,'Black',NULL,98,'2016-04-26 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(54,'B165CAEF-FF77-4E63-98C1-59D97F97E7C9',14000.00,2000.00,500.00,150.00,1,'British Racing Green',NULL,72,'2016-04-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(55,'23E7F9FA-67D4-47C1-8D66-F1CFBC33540F',79600.00,500.00,750.00,750.00,1,'Black',NULL,20,'2016-05-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(56,'07F0D746-085B-4FB9-9F82-6CEAC851FBC3',14000.00,1360.00,225.00,150.00,0,'Green',NULL,77,'2016-05-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(57,'7BABE805-CE07-4C06-AAF1-6B5D83645CD8',10000.00,500.00,750.00,150.00,1,'Black',NULL,85,'2016-05-11 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(58,'D7BF8DD9-1841-4FDE-8469-66B09FA30A74',7960.00,500.00,750.00,150.00,1,'Red',NULL,43,'2016-05-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(59,'8F278478-CA0B-4CDB-8F02-1A054AAE88A9',31600.00,2000.00,750.00,550.00,1,'Black',NULL,41,'2016-05-28 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(60,'4FFB74AD-C031-4BD9-9589-A87F462E6842',39664.00,660.00,500.00,550.00,1,'Black',NULL,48,'2016-05-28 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(61,'055F7639-30EA-4975-A8CB-29F5C1C1C48E',4400.00,500.00,750.00,150.00,1,'Black',NULL,78,'2016-05-28 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(62,'518125AE-9A67-45A6-B3FD-557C785796FC',17720.00,1360.00,750.00,150.00,1,'Night Blue',NULL,80,'2016-05-28 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(63,'18974E49-6B03-4C6E-BA0C-D564CFF868E0',62000.00,2000.00,1500.00,750.00,1,'Dark Purple',NULL,15,'2016-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(64,'65F89D52-9B2D-4363-8A07-4A5CE90197DB',28000.00,500.00,750.00,550.00,1,'Black',NULL,3,'2016-06-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(65,'54A66D7C-9E0B-40E9-B1B1-CA655F060CDE',23720.00,660.00,750.00,150.00,1,'Red',NULL,37,'2016-06-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(66,'D93AF620-4F69-475A-98ED-829E0F8A3A40',36400.00,500.00,750.00,550.00,1,'Red',NULL,85,'2016-06-04 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(67,'62611547-0F2D-41B1-BA32-E34AB67E10A3',26800.00,1360.00,750.00,550.00,0,'Canary Yellow',NULL,9,'2016-06-05 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(68,'0BE222D6-9254-4FC8-892D-76563CA81F9B',79600.00,2175.00,750.00,750.00,1,'Silver',NULL,47,'2016-06-06 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(69,'521659A4-8FF2-441A-8D2E-C584D561301F',12520.00,500.00,225.00,150.00,1,'Night Blue',NULL,55,'2016-06-30 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(70,'1A210C04-C981-4EA4-83B9-A6E76B5B9BDB',39600.00,500.00,500.00,550.00,1,'Silver',NULL,10,'2016-07-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(71,'66CCEBEA-00EA-44B3-BBFE-AC5EC2DE456D',10000.00,500.00,750.00,150.00,1,'British Racing Green',NULL,30,'2016-07-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(72,'B36188E4-3684-4337-91FE-84BB33736476',156000.00,3950.00,3150.00,1950.00,1,'Black',NULL,73,'2016-07-05 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(73,'66C9034C-23A3-44F1-B946-2DDA65E684D8',164000.00,9250.00,750.00,1950.00,1,'Black',NULL,91,'2016-07-07 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(74,'E00D10E9-7F7F-49A9-BDC0-4C2611580B4E',53200.00,1490.00,750.00,750.00,1,'Black',NULL,100,'2016-07-08 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(75,'AAF61ECC-0BAC-4EAF-9E50-01749253329A',15600.00,1360.00,750.00,150.00,1,'Night Blue',NULL,96,'2016-07-09 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(76,'A1A4180E-B929-467D-91A6-73D2D0F34C65',63600.00,2000.00,1500.00,750.00,1,'Blue',NULL,35,'2016-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(77,'B5E7DD25-9D69-464C-9327-A8C5E706F534',11672.00,500.00,750.00,150.00,1,'Silver',NULL,75,'2016-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(78,'0B0E0FC2-E72B-4BD4-9C46-1AF98F17BEC4',10200.00,970.00,750.00,150.00,1,'Blue',NULL,17,'2016-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(79,'7F08368D-B6EA-4DFC-A1EC-B1A1B0221F04',180000.00,5500.00,3150.00,1950.00,1,'Black',NULL,56,'2016-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(80,'356EE84B-F4FD-4923-9423-D58E2863E9A1',36480.00,500.00,500.00,550.00,1,'Dark Purple',NULL,83,'2016-07-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(81,'92D7DE8E-0BA7-4221-B2B1-A01F7FAFDD3E',5200.00,500.00,750.00,150.00,1,'Black',NULL,47,'2016-07-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(82,'5BE0098D-511F-4CF1-B87C-2CE2532F1B31',82000.00,2175.00,1500.00,750.00,1,'Pink',NULL,53,'2016-07-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(83,'F0235F1B-636C-4E8B-8617-927F45DA97DB',20400.00,660.00,750.00,150.00,1,'Black',NULL,65,'2016-08-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(84,'BDC5E621-D976-478D-A620-A0751FCBEF96',79600.00,2000.00,750.00,750.00,1,'Canary Yellow',NULL,30,'2016-08-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(85,'72EF5AA5-997C-4AC0-A32E-591D1E009818',10000.00,500.00,750.00,150.00,1,'Dark Purple',NULL,60,'2016-08-03 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(86,'4BFD3782-0B79-4F4E-981A-96CEF827497F',49200.00,1360.00,750.00,550.00,1,'Red',NULL,28,'2016-08-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(87,'E6E23C74-39AF-4A44-BAAE-7CD48B0F6161',63600.00,1490.00,750.00,750.00,1,'Red',NULL,88,'2016-08-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(88,'420701D6-5F66-4885-8A72-8B54541965A6',13200.00,500.00,750.00,150.00,1,'British Racing Green',NULL,89,'2016-08-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(89,'870C2B0A-A6AE-4F84-91EF-806C985A02E5',26880.00,500.00,500.00,550.00,1,'Black',NULL,97,'2016-08-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(90,'6BF8C577-E615-4667-A48C-25E8D825AAC6',53200.00,2175.00,1500.00,750.00,1,'British Racing Green',NULL,89,'2016-08-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(91,'74F717DA-B4DA-44F2-857A-F062AC60052E',15600.00,660.00,750.00,150.00,1,'Black',NULL,67,'2016-08-11 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(92,'98C3863B-7A70-4FAD-B3C7-2B5702956E18',36000.00,500.00,150.00,550.00,1,'Red',NULL,47,'2016-08-11 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(93,'8C1E8506-711C-442A-89A4-EDA28EB5B788',15600.00,500.00,750.00,150.00,1,'Night Blue',NULL,36,'2016-08-11 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(94,'BC4D491E-764B-48AE-BEDC-07DE123B7200',61200.00,2000.00,750.00,750.00,1,'Pink',NULL,57,'2016-08-20 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(95,'4C00023A-47C5-4F98-A9B1-F222EDE2F563',36720.00,500.00,500.00,550.00,0,'Red',NULL,57,'2016-08-20 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(96,'170FAF32-4223-4806-B483-D89F4D38AC16',100000.00,500.00,2200.00,750.00,1,'Green',NULL,63,'2016-08-22 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(97,'9CFAF367-ED4B-4A3E-8CB2-394F1F7A58C1',52400.00,500.00,750.00,750.00,1,'Green',NULL,10,'2016-08-22 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(98,'126C36BB-9C33-4BC5-9127-F941731DD0C8',73720.00,2175.00,225.00,750.00,1,'Blue',NULL,60,'2016-08-22 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(99,'98B3C1C2-7AE2-4A88-A3C9-484483C6EC66',7600.00,500.00,750.00,150.00,1,'Black',NULL,71,'2016-08-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(100,'4A40B2AA-A76B-4C08-A59B-19CDE0ED868C',7960.00,500.00,225.00,150.00,1,'Blue',NULL,34,'2016-08-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(101,'100EE806-DFE5-4C5E-9AB4-8F881615F8BD',4544.00,500.00,150.00,150.00,1,'Canary Yellow',NULL,17,'2016-08-26 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(102,'00DDC5C0-E266-49E4-A785-E4F8BC3C9B24',15600.00,2000.00,750.00,150.00,1,'Black',NULL,3,'2016-08-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(103,'97AFC7D5-91BF-47E3-8568-01B704E956C2',2800.00,500.00,750.00,150.00,1,'Black',NULL,57,'2016-09-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(104,'6A2699A6-ED27-42A9-B811-06D19EB5FA3C',3160.00,500.00,150.00,150.00,1,'Black',NULL,29,'2016-09-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(105,'70C9BE5C-3CCA-4FB2-B4DE-E5F0A61BB84D',16760.00,1360.00,750.00,150.00,1,'British Racing Green',NULL,38,'2016-09-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(106,'B76D6985-E106-4213-AACC-288088795C92',6000.00,500.00,750.00,150.00,1,'British Racing Green',NULL,13,'2016-09-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(107,'955E8BC5-C31B-4EE5-A48D-76517063C334',45200.00,500.00,1500.00,550.00,1,'Dark Purple',NULL,45,'2016-09-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(108,'2FCD3EBC-CBA7-4B3C-B6A0-A3A011D3A47B',39600.00,660.00,500.00,550.00,1,'British Racing Green',NULL,69,'2016-09-06 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(109,'155E940E-7AA7-47EA-B83F-B3521F0B5718',55120.00,500.00,750.00,750.00,1,'Dark Purple',NULL,72,'2016-09-09 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(110,'B25CB659-C0A2-451E-AADB-7A006414D6E1',44000.00,500.00,150.00,550.00,1,'Silver',NULL,83,'2016-09-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(111,'19D1000C-178F-4BBA-9B19-C93804D047AC',2860.00,500.00,750.00,150.00,1,'Silver',NULL,85,'2016-09-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(112,'DD6A0129-40CF-449F-8427-1C97BF14B2BD',28200.00,500.00,750.00,550.00,1,'British Racing Green',NULL,96,'2016-09-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(113,'66D70810-1EE2-4BCA-B1B4-1E5B86C75002',15680.00,1360.00,150.00,150.00,1,'Night Blue',NULL,44,'2016-09-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(114,'384778FF-C28D-4FE6-9BEF-D787EFDC23CF',22312.00,970.00,500.00,150.00,1,'Black',NULL,71,'2016-09-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(115,'B760CF74-6468-4A0D-9485-36C7F7710EB0',36760.00,970.00,750.00,550.00,1,'Night Blue',NULL,52,'2016-09-16 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(116,'E1350CBE-B916-4F18-B5BF-F7D53A31205A',7960.00,500.00,150.00,150.00,1,'Black',NULL,87,'2016-09-17 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(117,'9D74A1A9-7342-4FEA-9C21-6AC4EFE92018',5240.00,500.00,750.00,150.00,1,'Black',NULL,84,'2016-09-18 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(118,'6943ADF3-01A4-4281-B0CE-93384FE60418',10000.00,500.00,750.00,150.00,1,'Red',NULL,43,'2016-10-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(119,'BB4B9483-7AE3-47B4-A788-7EB5D12A7516',61200.00,2175.00,750.00,750.00,1,'Canary Yellow',NULL,97,'2016-10-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(120,'2319EA77-F4D9-4E34-9771-C42DCA3E210C',151600.00,500.00,1500.00,1950.00,1,'Blue',NULL,98,'2016-10-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(121,'6120D922-6703-4267-969B-A9A9D3CAE787',95680.00,1490.00,2200.00,750.00,0,'Green',NULL,40,'2016-10-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(122,'30DC26F7-E98B-4FE8-B834-D625EC7E12F3',68520.00,2175.00,750.00,750.00,0,'Silver',NULL,11,'2016-10-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(123,'3D993E95-26AF-416D-B89E-688873C03AA7',12760.00,660.00,750.00,150.00,0,'Blue',NULL,13,'2016-10-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(124,'34A69512-CDC3-4BEB-ADCB-AAE360CA7CF4',7960.00,500.00,750.00,150.00,1,'Black',NULL,66,'2016-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(125,'3EDC8773-9603-4D38-9DC9-64E1C4768F7D',10000.00,500.00,750.00,150.00,1,'Black',NULL,17,'2016-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(126,'9FF62C70-89E4-4815-912F-C5DFBF8BDF0F',10000.00,500.00,750.00,150.00,1,'Black',NULL,33,'2016-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(127,'EC25FA02-2692-42E1-85A0-71F0775C8F8A',45512.00,2000.00,750.00,550.00,1,'Silver',NULL,14,'2016-11-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(128,'E368D03E-239C-499F-A41A-CC4D2AE1AFF8',44000.00,660.00,500.00,550.00,1,'Silver',NULL,91,'2016-11-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(129,'4C1762AE-F7FD-4F2C-875B-CAC022B0DF63',7992.00,500.00,750.00,150.00,0,'Black',NULL,42,'2016-11-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(130,'DB8869B2-1EC0-48D5-9DA6-FDF1665155F0',37200.00,2000.00,750.00,550.00,1,'British Racing Green',NULL,21,'2016-11-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(131,'DD651733-FE5C-46B9-AC97-727F8CD170A6',7600.00,500.00,750.00,150.00,1,'Black',NULL,55,'2016-11-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(132,'F810FAB0-6BAE-4AC0-BDBC-F14A71AC35B9',100400.00,3950.00,1500.00,1950.00,1,'Red',NULL,22,'2016-12-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(133,'3CF2C0F8-21E1-4ADE-AE72-AB9DFE3790DD',79600.00,1490.00,750.00,750.00,1,'Dark Purple',NULL,62,'2016-12-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(134,'A017241D-3A92-4EA7-A3EE-22FC119542F8',48400.00,500.00,1500.00,550.00,1,'Night Blue',NULL,48,'2016-12-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(135,'4537B83B-2444-4389-B2DE-F30E15608163',98800.00,2000.00,750.00,750.00,0,'Black',NULL,92,'2016-12-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(136,'7CEA62B1-9CBE-4E13-BECC-54E7EED128EF',20000.00,1360.00,750.00,150.00,1,'Night Blue',NULL,58,'2016-12-07 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(137,'102A734C-3212-4708-85A5-A96FE8E14641',135600.00,9250.00,1500.00,1950.00,1,'British Racing Green',NULL,15,'2016-12-07 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(138,'9B8B87E1-7770-4136-8EB4-B7173C8783A6',79600.00,2175.00,750.00,750.00,1,'Black',NULL,30,'2016-12-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(139,'C0E2E06D-AE60-4223-9E7C-B8387F2A4335',31600.00,500.00,500.00,550.00,1,'Canary Yellow',NULL,86,'2016-12-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(140,'3EEC687A-759C-4D8A-8776-E257E8230376',18000.00,1360.00,750.00,150.00,1,'Pink',NULL,13,'2016-12-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(141,'09FA3947-726D-4987-B9DD-2F4CF7CD7C45',100000.00,500.00,1500.00,750.00,1,'Green',NULL,56,'2016-12-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(142,'52CE8210-53B8-4C09-B821-6389A09733C5',68000.00,1490.00,1500.00,750.00,1,'Black',NULL,78,'2016-12-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(143,'DE44149E-1225-4B7C-97E5-8089A4F21C1C',1000.00,500.00,750.00,150.00,1,'Silver',NULL,24,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(144,'CF9A23D7-6F8A-4CA6-A037-95EA7385B539',18000.00,500.00,750.00,150.00,1,'Silver',NULL,53,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(145,'E9FE6FE1-1957-4BD4-8643-D8326BC43255',18760.00,500.00,750.00,150.00,1,'Green',NULL,86,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(146,'98299E86-0B98-42D8-A549-37D89435B4E3',100760.00,9250.00,2200.00,1950.00,0,'Black',NULL,49,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(147,'F187F74F-3909-4291-A15B-F793AB88DE3B',156000.00,5500.00,1500.00,1950.00,1,'Black',NULL,73,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(148,'DD8D9340-29B0-4E0D-89B3-BD33B70E087D',7080.00,500.00,750.00,150.00,1,'Black',NULL,87,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(149,'BBDFB7CF-FBA6-4463-BC1E-FE79522431EE',7960.00,500.00,750.00,150.00,1,'Pink',NULL,76,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(150,'837C835A-5341-46C7-A282-14612449DDB0',18800.00,2000.00,500.00,150.00,1,'Black',NULL,91,'2017-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(151,'47077B33-09BC-4FF2-B71B-58E243952BAA',45200.00,500.00,750.00,550.00,1,'Black',NULL,8,'2017-01-20 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(152,'A48E5430-ACA4-41FD-BC6F-446BE2B46DF8',44000.00,500.00,750.00,550.00,1,'Black',NULL,8,'2017-01-21 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(153,'AB327B58-DD8E-46F9-BF23-DE6D1C0F7AD8',62800.00,500.00,750.00,750.00,1,'Red',NULL,52,'2017-01-21 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(154,'E869D5E4-CAC0-48ED-8961-03D0405EA2FD',45560.00,1360.00,750.00,550.00,1,'Night Blue',NULL,37,'2017-01-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(155,'74DD8FE1-B205-4400-A951-1E54E7C22E40',292000.00,3950.00,750.00,1950.00,1,'Black',NULL,50,'2017-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(156,'579AD98F-B7A5-456A-8F17-5B77A5479767',125200.00,9250.00,1500.00,1950.00,0,'Night Blue',NULL,68,'2017-02-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(157,'7392B5F6-783C-4D4B-B687-74A98411A7CB',316000.00,9250.00,2200.00,1950.00,1,'British Racing Green',NULL,100,'2017-02-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(158,'01B087C6-00D1-40B2-808F-B4B5BC1E344D',17200.00,500.00,500.00,150.00,1,'Dark Purple',NULL,7,'2017-02-04 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(159,'11BCE306-33ED-4C8D-9198-2A4B653D9F8A',5200.00,500.00,750.00,150.00,1,'Pink',NULL,73,'2017-02-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(160,'A08FCF25-5B27-4215-BF50-E94D0F7C8CD6',1800.00,500.00,750.00,150.00,1,'Canary Yellow',NULL,15,'2017-02-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(161,'8F100F91-FE3C-4338-AA52-7BF61A540199',2800.00,500.00,750.00,150.00,1,'Blue',NULL,8,'2017-02-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(162,'84BE4607-F8D7-49DA-8C27-D87FE529DF96',4544.00,500.00,750.00,150.00,1,'Blue',NULL,27,'2017-02-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(163,'EB59DB36-5E67-4AF1-AE8A-46E8999EEF45',6840.00,500.00,750.00,150.00,1,'Black',NULL,30,'2017-02-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(164,'7372D1C7-800F-4DE4-B3BC-FFA46CE77099',125200.00,2000.00,1500.00,1950.00,1,'Blue',NULL,94,'2017-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(165,'E267042F-449B-4CA9-8BDE-5C197DC8A647',45200.00,660.00,750.00,550.00,0,'Silver',NULL,64,'2017-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(166,'2C377634-90F1-4BC1-A366-0F0EBD26910D',69200.00,2000.00,1500.00,750.00,1,'Silver',NULL,46,'2017-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(167,'49D19AE8-FBBF-496C-BC1E-9450544DD193',53200.00,2175.00,1500.00,750.00,0,'Black',NULL,19,'2017-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(168,'0B3AEBF5-0997-447D-B0E8-B399B7343742',44480.00,660.00,750.00,550.00,1,'Green',NULL,22,'2017-03-12 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(169,'643800B3-AD63-4B67-8ACF-672B91F04C57',244000.00,3950.00,3150.00,1950.00,0,'Green',NULL,63,'2017-03-12 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(170,'5F898C04-BDFB-437B-A640-AE520F14031E',23200.00,500.00,750.00,150.00,1,'Dark Purple',NULL,66,'2017-03-12 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(171,'4831A9DA-09BD-4AC3-8984-947F284CD4A8',43992.00,970.00,500.00,550.00,1,'Green',NULL,88,'2017-03-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(172,'0588AA57-B6B5-47F5-910F-5A1099B0476D',34360.00,970.00,750.00,550.00,1,'Night Blue',NULL,79,'2017-03-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(173,'32C41EC9-CB3C-4D0F-9C85-2500CE2E4813',792.00,500.00,150.00,150.00,0,'British Racing Green',NULL,36,'2017-03-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(174,'1909CD9B-9C06-4CFB-B8AD-292967E55E2F',23600.00,970.00,750.00,150.00,1,'Black',NULL,66,'2017-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(175,'1B77D0BA-45C9-4C76-952E-B2FA2859B7AB',111600.00,9250.00,2200.00,1950.00,1,'British Racing Green',NULL,48,'2017-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(176,'CD06C0DF-D3A2-4593-BF40-7DAE6B73F58C',236000.00,5500.00,750.00,1950.00,1,'Black',NULL,36,'2017-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(177,'08B3555E-47A2-4365-AED8-2DF054FF73E2',176400.00,9250.00,2200.00,1950.00,1,'Red',NULL,27,'2017-04-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(178,'C1A812F1-5FA1-48BA-8787-16F2F0A704BC',63600.00,500.00,750.00,750.00,1,'Red',NULL,71,'2017-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(179,'3A8161E3-C69D-4CC0-83DA-18EDE07CC83A',45592.00,970.00,750.00,550.00,1,'Red',NULL,97,'2017-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(180,'05AB94D5-2F8D-4B06-878D-615956C94EC2',130000.00,3950.00,3150.00,1950.00,1,'Red',NULL,36,'2017-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(181,'B607E8E1-5ECA-4DE2-BC46-909DBF9371D3',63600.00,2175.00,750.00,750.00,0,'Black',NULL,97,'2017-05-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(182,'57137FAF-3144-4CB7-BAAB-BA533A710E72',29200.00,500.00,500.00,550.00,1,'Canary Yellow',NULL,39,'2017-05-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(183,'7A12CA8A-DC67-4A4F-B6F4-8B150873523A',52712.00,500.00,750.00,750.00,1,'Blue',NULL,99,'2017-05-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(184,'4A4A1D5E-1682-4ACA-A60D-0072693FE190',49200.00,1360.00,750.00,550.00,1,'Black',NULL,71,'2017-05-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(185,'C4ACB04E-C8D4-465E-8D66-8BA033443D61',10000.00,500.00,750.00,150.00,1,'Blue',NULL,41,'2017-05-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(186,'5D11974B-326C-44C5-BA1D-57968CAB0DEE',204000.00,9250.00,1500.00,1950.00,1,'Black',NULL,41,'2017-05-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(187,'F8B48177-FB78-4245-935F-FB6FBCE8D870',204760.00,5500.00,750.00,1950.00,1,'Blue',NULL,40,'2017-05-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(188,'6AEAC4F1-4C81-4FAA-A97C-3DCC0E6CB5DE',200000.00,3950.00,3150.00,1950.00,1,'Black',NULL,64,'2017-05-12 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(189,'A5BDB4E0-1544-449F-8596-D63D70548675',5200.00,500.00,750.00,150.00,1,'Blue',NULL,38,'2017-05-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(190,'06FD2864-8415-44A5-B022-B98BEFB7E490',7400.00,500.00,750.00,150.00,1,'Silver',NULL,66,'2017-05-18 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(191,'ECC534C7-B2DD-425C-98D3-98D2332B373C',760.00,500.00,750.00,150.00,1,'Black',NULL,11,'2017-05-19 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(192,'589E8DB1-B2D4-4921-A11B-9A2A80EA73D9',236000.00,9250.00,3150.00,1950.00,1,'Silver',NULL,82,'2017-05-20 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(193,'BD15948E-42F0-41BC-920C-343E0816B0AB',79600.00,1490.00,750.00,750.00,1,'Night Blue',NULL,51,'2017-05-21 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(194,'E0760EF4-3939-4063-821F-5923EF8760B4',26800.00,500.00,750.00,550.00,1,'Black',NULL,89,'2017-05-22 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(195,'D3C15454-EF60-415F-860D-99D41F0A485F',36000.00,500.00,750.00,550.00,1,'Night Blue',NULL,65,'2017-05-23 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(196,'DF5411FC-24C5-4CAB-89DF-54741054D8DD',29200.00,500.00,500.00,550.00,1,'Black',NULL,100,'2017-05-24 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(197,'8BB5BBD3-E03C-457C-86E2-67199FCB302A',62000.00,1490.00,1500.00,750.00,1,'Canary Yellow',NULL,96,'2017-05-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(198,'3A0070F8-C340-4B6F-9F36-4A1CBDB39FE9',1880.00,500.00,225.00,150.00,1,'British Racing Green',NULL,95,'2017-05-26 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(199,'638FCDD5-AFFF-4DCA-AAEC-17F527FB9D02',26000.00,1360.00,750.00,550.00,1,'Black',NULL,22,'2017-05-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(200,'0C3EBD09-B9DF-414D-AD00-90F5819812D0',36000.00,500.00,750.00,550.00,1,'Blue',NULL,67,'2017-05-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(201,'A0098927-0C7D-4CC8-8022-57A24433EF61',1000.00,500.00,225.00,150.00,1,'Red',NULL,57,'2017-06-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(202,'8BB7FF86-2D80-40B7-B216-254C16843529',6800.00,500.00,750.00,150.00,1,'Green',NULL,72,'2017-06-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(203,'9743A284-D059-4EEB-98AB-ACDE88C1E9F5',5272.00,500.00,750.00,150.00,1,'Dark Purple',NULL,99,'2017-06-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(204,'57E2BA34-6397-448F-8A8C-1306CC922231',79600.00,2175.00,750.00,750.00,1,'Green',NULL,39,'2017-06-09 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(205,'2EE943CB-2473-4333-8626-FC94FCD0947E',20000.00,500.00,150.00,150.00,1,'Canary Yellow',NULL,8,'2017-06-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(206,'1A80A54C-D98D-41D6-87EE-8F67F3B06FA8',15600.00,1360.00,500.00,150.00,1,'Blue',NULL,20,'2017-06-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(207,'D32D55B7-3546-4CCA-B4C0-DBA976572CA2',10360.00,1360.00,750.00,150.00,1,'Blue',NULL,13,'2017-06-12 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(208,'D05D6642-FABF-4F56-8A7E-D8C47A8AAB70',4520.00,500.00,150.00,150.00,1,'Black',NULL,20,'2017-06-21 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(209,'658F0B06-2357-4DAA-803C-4DD7F569F270',23600.00,500.00,150.00,150.00,1,'Black',NULL,26,'2017-06-22 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(210,'2866BF16-7A79-4DB7-8657-30958E4035A9',45512.00,500.00,500.00,550.00,1,'Red',NULL,77,'2017-06-23 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(211,'760F5558-3C9E-4B70-A412-0448B90B0D89',3160.00,500.00,750.00,150.00,1,'Black',NULL,49,'2017-06-23 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(212,'B09E4DDD-C2DD-45BE-B5F1-19FBF5970352',23600.00,1360.00,750.00,150.00,1,'Black',NULL,73,'2017-06-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(213,'B4CC6E9A-8473-4A84-A811-73EABAFDC582',10000.00,500.00,750.00,150.00,1,'Black',NULL,94,'2017-06-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(214,'2595D5C0-5002-464B-8F2B-C873FB29B4F9',79960.00,1490.00,750.00,750.00,1,'Blue',NULL,3,'2017-06-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(215,'D69ABA72-1B0D-4073-8B7D-D6CA65C4DDF7',268000.00,2000.00,2200.00,1950.00,0,'Silver',NULL,93,'2017-07-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(216,'332CE8D2-E19F-4656-BCC6-E3E45AD09D85',45200.00,500.00,750.00,550.00,1,'Silver',NULL,100,'2017-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(217,'306507B9-D2E1-4C5D-8F01-C93C90C93B6E',79600.00,2175.00,750.00,750.00,1,'Night Blue',NULL,44,'2017-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(218,'2B0FC8E5-82CB-4804-8691-0586F2255E9E',108000.00,2000.00,1500.00,1950.00,1,'Silver',NULL,94,'2017-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(219,'ACB85DBA-4914-4222-8D24-6D87B0DAE10A',71600.00,500.00,750.00,750.00,1,'British Racing Green',NULL,32,'2017-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(220,'23E43063-5402-4946-8830-0723F6B3CE1C',132000.00,9250.00,3150.00,1950.00,1,'Dark Purple',NULL,49,'2017-08-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(221,'E59BFE04-E70B-4BAC-9269-ADC311ED0032',18080.00,1360.00,500.00,150.00,1,'Black',NULL,4,'2017-08-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(222,'8979136A-B34A-4CD3-B119-A6B158D15FFF',26140.00,660.00,500.00,550.00,1,'Dark Purple',NULL,90,'2017-08-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(223,'34A4BB21-60B3-4B0D-8DDB-8189C471A581',36000.00,2000.00,500.00,550.00,1,'Night Blue',NULL,18,'2017-08-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(224,'AFAF5C3E-80C9-4C5A-9D2A-CDD238E40264',4400.00,500.00,750.00,150.00,1,'Blue',NULL,82,'2017-08-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(225,'7FCABEE5-E116-4AE3-B7B1-483C2F0D18CA',44000.00,500.00,500.00,550.00,1,'Black',NULL,95,'2017-08-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(226,'B84575EE-2E61-482C-8B72-5A6A90ADC3FE',39600.00,1360.00,500.00,550.00,1,'Green',NULL,77,'2017-08-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(227,'DB2AF439-6293-4925-B905-1A57A0118B1A',200000.00,500.00,2200.00,1950.00,1,'Black',NULL,27,'2017-09-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(228,'15108517-AD0C-4FF2-A7D4-57679C374A68',124000.00,9250.00,750.00,1950.00,1,'Red',NULL,36,'2017-09-03 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(229,'10AD713C-C997-48BB-A5FB-F0B5FD26479B',12600.00,1360.00,750.00,150.00,1,'Pink',NULL,22,'2017-09-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(230,'C1C9D15D-9E57-4D22-8997-D1333EEC6B13',15600.00,1360.00,750.00,150.00,0,'Black',NULL,54,'2017-10-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(231,'8A275CE2-D116-49F7-8571-FD91F21ADAAA',188000.00,500.00,1500.00,1950.00,1,'Black',NULL,18,'2017-10-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(232,'009A5323-23E5-48BE-95DB-BA94E1897419',20000.00,1360.00,750.00,150.00,1,'Black',NULL,77,'2017-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(233,'EBE7AD85-117F-4781-A5E5-13920EE2B546',196000.00,500.00,3150.00,1950.00,1,'British Racing Green',NULL,70,'2017-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(234,'B822FA7C-5FA5-4F17-A3A6-7199CB00F7F8',31600.00,970.00,500.00,550.00,1,'Black',NULL,57,'2017-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(235,'F1997A16-CB98-4D67-BCA3-DD22D990D1D2',1800.00,500.00,750.00,150.00,1,'British Racing Green',NULL,55,'2017-10-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(236,'ECD53BA8-3C63-4938-92C4-C955AEA6C4BC',18800.00,1360.00,500.00,150.00,1,'Black',NULL,17,'2017-11-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(237,'26199C63-95B5-419B-A827-C0EEAF594A5B',8400.00,500.00,750.00,150.00,1,'Black',NULL,40,'2017-11-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(238,'C9D8FCFE-4A88-479C-A2CA-E2474AF4D8DF',9200.00,500.00,150.00,150.00,1,'Blue',NULL,34,'2017-11-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(239,'43195E1A-46B2-4554-B1A9-C849B1C0B53B',7960.00,500.00,750.00,150.00,1,'Blue',NULL,59,'2017-11-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(240,'05D4115C-3F27-4059-BDC8-C0C3FFC85E8B',40960.00,1360.00,500.00,550.00,1,'Black',NULL,15,'2017-11-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(241,'B503DD91-24FA-4F4A-AF49-1EB15347A33D',36760.00,500.00,150.00,550.00,1,'Black',NULL,3,'2017-11-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(242,'896B39D5-8040-4947-94D0-0234B4E78B23',17280.00,1360.00,750.00,150.00,0,'Red',NULL,25,'2017-11-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(243,'BCA945A6-8F87-4A00-93ED-6F2A08F8F923',1276.00,500.00,225.00,150.00,0,'Red',NULL,77,'2017-12-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(244,'38264675-F235-412B-9B67-8F8CD86CF40D',20000.00,500.00,750.00,150.00,1,'Black',NULL,7,'2017-12-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(245,'2657F22B-5D29-4A7A-B3F9-3A04C14D7C93',18880.00,1360.00,750.00,150.00,0,'Night Blue',NULL,91,'2017-12-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(246,'7005E3EC-5DBF-4409-8545-AC401CF204DB',340000.00,2000.00,2200.00,1950.00,1,'Canary Yellow',NULL,87,'2017-12-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(247,'9BFDC1FA-8416-4F58-BE6C-3CCFA7A51860',79960.00,1490.00,750.00,750.00,1,'Black',NULL,56,'2017-12-07 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(248,'A88F114F-3808-4B2D-92BE-BD43EEA71742',37520.00,500.00,1500.00,550.00,1,'Silver',NULL,57,'2017-12-07 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(249,'1860F37A-EBC7-42E9-B339-3F6D6048322F',36760.00,2000.00,500.00,550.00,1,'Black',NULL,39,'2017-12-09 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(250,'00E07EB4-4A3A-434F-B3FC-76A312BEEF5D',6040.00,500.00,750.00,150.00,1,'Red',NULL,91,'2017-12-09 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(251,'C72ABA1C-D1FA-4A4B-9E16-9FE066D509BA',9592.00,500.00,750.00,150.00,1,'Green',NULL,97,'2017-12-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(252,'B8F3827A-5689-42B9-A1DE-26AFE7E2343E',10000.00,500.00,750.00,150.00,1,'Black',NULL,36,'2017-12-19 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(253,'A21CAFB1-7242-42D1-80AC-E5D26941E2BE',6000.00,500.00,750.00,150.00,1,'Blue',NULL,8,'2017-12-20 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(254,'76D2E902-DF33-4BE5-8181-B9DA01869131',45480.00,500.00,1500.00,550.00,1,'Canary Yellow',NULL,22,'2017-12-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(255,'2309FF52-564A-4A2C-B6EB-D94AA321D687',31600.00,1360.00,500.00,550.00,0,'Black',NULL,63,'2017-12-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(256,'2CE57C5E-98DE-402F-884A-A6227FD7FB5F',45560.00,500.00,1500.00,550.00,1,'Pink',NULL,38,'2017-12-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(257,'61B73BA2-9EA0-4DB9-8D89-6E8D2A5D32DA',50000.00,500.00,750.00,550.00,1,'British Racing Green',NULL,76,'2017-12-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(258,'8BED3FBE-29EA-48AF-A8CE-7770F51A548F',34000.00,2000.00,150.00,550.00,1,'Black',NULL,29,'2017-12-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(259,'B0559A26-5CE0-4C70-89EC-C73C0837B1E8',52360.00,500.00,1500.00,750.00,1,'Black',NULL,73,'2017-12-31 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(260,'99DF9E69-9DAF-4D81-8334-D7058F1030E2',1560.00,500.00,750.00,150.00,1,'British Racing Green',NULL,46,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(261,'D231E90A-140A-4623-AA79-16970966DDF3',920.00,500.00,750.00,150.00,0,'Black',NULL,11,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(262,'26122425-FE14-4318-8713-15C8F9EED630',9240.00,500.00,750.00,150.00,1,'Night Blue',NULL,47,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(263,'80B21E0F-66E3-4582-838A-D7EC560C7C0B',10056.00,2000.00,500.00,150.00,1,'Black',NULL,25,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(264,'8D9BF815-FAE4-47CE-ADBB-33339D382319',7912.00,500.00,225.00,150.00,1,'Black',NULL,71,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(265,'F6C384B6-B768-4031-AC12-81C8CE37049E',45560.00,2000.00,500.00,550.00,1,'Night Blue',NULL,11,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(266,'F9EF8BCC-5744-4EBC-91AD-739775C597D9',36760.00,660.00,1500.00,550.00,1,'Dark Purple',NULL,62,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(267,'457046F9-68AC-468E-9C5E-9C1B957FE9B9',760.00,500.00,750.00,150.00,1,'British Racing Green',NULL,65,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(268,'3DCFE242-5286-404C-A37E-5207E6F51BB1',17240.00,970.00,750.00,150.00,1,'Black',NULL,2,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(269,'BF9128E0-D61A-4214-8128-44A9880E20C2',4760.00,500.00,225.00,150.00,1,'Black',NULL,54,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(270,'808F1237-9F5C-484F-8E14-63FF713A864D',284000.00,9250.00,7500.00,1950.00,1,'Red',NULL,40,'2018-01-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(271,'790E96BC-2F59-4B8F-9DE2-6BB65F92216B',96000.00,2175.00,750.00,750.00,1,'Black',NULL,63,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(272,'88975E00-70FD-44B6-9A1F-9E3B9CCE4382',14280.00,1360.00,150.00,150.00,1,'British Racing Green',NULL,79,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(273,'6218BE0E-185B-4B12-8696-AA976EA81B29',82920.00,1490.00,750.00,750.00,1,'Pink',NULL,1,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(274,'03AC7842-CA66-4AC0-92AD-F538494D1FAE',146000.00,5500.00,1500.00,1950.00,1,'Green',NULL,66,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(275,'7FF88424-96A2-4149-ABF3-21AC9FBCDD4C',18000.00,1360.00,750.00,150.00,1,'Black',NULL,33,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(276,'48437CA9-988E-42EA-94F8-DC2D6DA48BA7',17200.00,500.00,750.00,150.00,0,'Black',NULL,51,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(277,'CDF97188-5367-4CCF-94DF-AC41093B9A48',6000.00,500.00,750.00,150.00,1,'Red',NULL,27,'2018-02-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(278,'E010830C-E636-49F7-ABA6-2DFDF502A587',1800.00,500.00,750.00,150.00,0,'Canary Yellow',NULL,43,'2018-02-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(279,'F5F70D13-C9BD-48E6-A903-ABC5F289A758',18120.00,500.00,750.00,150.00,1,'Blue',NULL,53,'2018-02-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(280,'89C3293F-F665-4E93-9929-315CBA3DD498',79160.00,1490.00,750.00,750.00,1,'Blue',NULL,25,'2018-02-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(281,'59650ADF-0886-43B4-B360-3A79E0CA327E',284000.00,9250.00,2200.00,1950.00,1,'Blue',NULL,18,'2018-02-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(282,'4BA7F44F-422D-4AD2-84B3-2AE4F0028DB8',4800.00,500.00,750.00,150.00,1,'Black',NULL,64,'2018-03-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(283,'1DDF23D7-3CB8-49C7-A19B-2A9C5AB23ADF',4552.00,500.00,750.00,150.00,1,'Night Blue',NULL,72,'2018-03-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(284,'A2201698-CA26-428A-988F-ABB4A8893E21',45520.00,1360.00,500.00,550.00,1,'Silver',NULL,68,'2018-03-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(285,'F556C096-7EFE-4827-9AFF-2FD0416B1C9B',116000.00,9250.00,1500.00,1950.00,1,'Black',NULL,51,'2018-03-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(286,'9868BF47-F113-4721-BF95-26FEF8DD51D2',79600.00,500.00,1500.00,750.00,1,'Silver',NULL,58,'2018-03-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(287,'C7086D43-16DA-444F-A461-76DA9C479425',98800.00,2175.00,1500.00,750.00,1,'Dark Purple',NULL,9,'2018-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(288,'20041639-9549-415A-AEC2-7159352E8CB7',248000.00,9250.00,7900.00,1950.00,0,'Silver',NULL,34,'2018-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(289,'AF51E444-D0BE-477F-8834-615824E0A89C',7840.00,500.00,750.00,150.00,1,'Canary Yellow',NULL,11,'2018-03-08 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(290,'FAB39B43-A811-4410-A69A-707C35C767E7',12760.00,500.00,500.00,150.00,0,'Silver',NULL,100,'2018-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(291,'A23F2E70-66D3-44A1-982C-ADE1ECA9CC30',204000.00,2000.00,150.00,1950.00,1,'Black',NULL,34,'2018-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(292,'1D997989-769F-4879-B7E1-837015CEEFC5',19600.00,660.00,750.00,150.00,1,'Black',NULL,47,'2018-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(293,'BFC6861C-8D2E-40C8-A4F7-07F9E41056DC',10360.00,1360.00,750.00,150.00,1,'Green',NULL,29,'2018-04-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(294,'07E4BA14-7B78-4B11-9A11-1520460A5631',124000.00,3950.00,3150.00,1950.00,1,'Black',NULL,9,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(295,'9E98DDEF-D2A3-4BEC-99DD-BEFEFC11E5EE',2000.00,500.00,750.00,150.00,1,'Red',NULL,71,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(296,'A4A2F089-526E-4C69-AACC-F58488B2E1C7',36400.00,500.00,750.00,550.00,0,'Green',NULL,21,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(297,'7808CA65-E449-4280-A128-F5B581F47B8F',31600.00,500.00,750.00,550.00,1,'Green',NULL,15,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(298,'B2D76C72-FA30-40AE-9AB9-DFB47560348C',18800.00,1360.00,750.00,150.00,1,'Black',NULL,64,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(299,'C19B3F44-9EA7-49FF-953A-86BF48B55615',36760.00,500.00,750.00,550.00,1,'Black',NULL,60,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(300,'A0F4D013-88EB-4692-B5EE-6BA800593036',44000.00,500.00,750.00,550.00,1,'Blue',NULL,93,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(301,'9CD9439F-E15F-4469-BE82-7A4041633A50',80000.00,500.00,750.00,750.00,1,'Blue',NULL,24,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(302,'87A6B5EF-1E2B-49CA-85D7-263BC7E32189',35908.00,2000.00,750.00,550.00,1,'British Racing Green',NULL,64,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(303,'361E0EFF-56B8-4E0A-A1DD-41D4A51BF704',49200.00,500.00,750.00,550.00,1,'Black',NULL,13,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(304,'B89AF48B-4BB9-409B-876B-941E51D19381',760.00,500.00,750.00,150.00,1,'Black',NULL,47,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(305,'15A09123-FE51-47D2-A7B0-600CB300F826',1200.00,500.00,750.00,150.00,1,'Night Blue',NULL,79,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(306,'FBF39066-2C13-469D-B913-EBCF22CCFD63',156000.00,2000.00,2200.00,1950.00,0,'Black',NULL,21,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(307,'A326183E-7D45-4CF2-A353-7177A3EAB71F',156000.00,9250.00,750.00,1950.00,1,'British Racing Green',NULL,16,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(308,'266404D4-FBC5-4DC6-BB7C-A2ED7246D6D7',42000.00,500.00,750.00,550.00,0,'Green',NULL,34,'2018-04-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(309,'798C76AF-985B-4B9F-B24A-4B4311AE2A08',1080.00,500.00,750.00,150.00,1,'Black',NULL,95,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(310,'71C9EDC5-7897-4CCE-9B2F-5B04BEDC36D0',1996.00,500.00,750.00,150.00,1,'Canary Yellow',NULL,18,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(311,'61F8CF9A-F53C-4386-9BF8-578F54547CD2',215600.00,5500.00,1500.00,1950.00,1,'Dark Purple',NULL,7,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(312,'FF62897D-E06C-4BC1-B5EA-E6BE415B0CD1',156000.00,3950.00,1500.00,1950.00,1,'Green',NULL,68,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(313,'9555FF33-EE29-4A81-854A-69F6485BB216',20760.00,1360.00,750.00,150.00,1,'Black',NULL,63,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(314,'EA1B19C6-631A-4683-9E29-1BC601FC850E',7992.00,500.00,750.00,150.00,1,'Black',NULL,69,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(315,'27C180A1-7C39-4E88-B5DE-ACD0C9594F3C',108000.00,5500.00,5600.00,1950.00,1,'British Racing Green',NULL,95,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(316,'52F665EA-2D6D-4ECA-8A14-553522A45B04',12760.00,500.00,750.00,150.00,1,'Black',NULL,12,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(317,'BEC34DF7-3E37-4322-A406-04BB5DF2A0FE',71600.00,1490.00,750.00,750.00,1,'Black',NULL,4,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(318,'F075AC9E-1124-4194-A05F-683F9D553335',14800.00,500.00,750.00,150.00,1,'Blue',NULL,10,'2018-05-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(319,'39CEB089-BC4F-4724-A47B-CDB0E2401714',12440.00,1360.00,750.00,150.00,1,'Green',NULL,30,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(320,'05F6C06A-9CD8-448B-9F67-FDBC0A7CEDCE',2860.00,500.00,750.00,150.00,1,'Black',NULL,80,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(321,'B1ABF9BD-1FBC-4E9A-BCCC-0B9AFEE5CFF1',5560.00,500.00,457.00,150.00,1,'Red',NULL,78,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(322,'3D2907ED-A866-4E81-B7CB-723EA2254718',12480.00,1360.00,750.00,150.00,1,'Black',NULL,80,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(323,'607CA291-F642-4CBD-967B-7A36DF45D150',21200.00,500.00,750.00,150.00,1,'Night Blue',NULL,51,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(324,'695E6D94-12E6-49BC-8E23-29AC3EB38D93',26800.00,2000.00,750.00,550.00,0,'Black',NULL,77,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(325,'614ED49B-6DA9-4BFE-9560-3DB52A6593CD',19600.00,1360.00,750.00,150.00,1,'British Racing Green',NULL,54,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(326,'532B985F-94AC-45DF-AE17-431FBCC66D0C',39600.00,970.00,750.00,550.00,1,'Silver',NULL,71,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(327,'740A7CB4-BF3F-46FD-98F3-D85748E5B9BA',79600.00,500.00,1050.00,750.00,1,'Night Blue',NULL,22,'2018-06-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(328,'D0B8D738-B33D-4F7F-BA25-46EC06DEB8E2',79992.00,2000.00,750.00,750.00,1,'Silver',NULL,52,'2018-07-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(329,'23FDFA0D-C905-41A6-B95A-D5A3517293D8',5560.00,500.00,1050.00,150.00,1,'Black',NULL,30,'2018-07-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(330,'6A140D65-C354-48F6-A92E-40FF36CF1216',8400.00,500.00,750.00,150.00,1,'Black',NULL,69,'2018-07-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(331,'4AFC6EDF-49EA-4D57-85AF-D60734328922',26760.00,1360.00,750.00,550.00,1,'Black',NULL,60,'2018-07-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(332,'EF8621F7-41EB-4C2D-ADBD-D4287083D41F',58000.00,2175.00,1500.00,750.00,1,'Night Blue',NULL,9,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(333,'E66B3E09-F02D-484A-8B9F-A8CD7833CD6B',1920.00,500.00,750.00,150.00,1,'Canary Yellow',NULL,40,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(334,'13F9FBD7-9342-4A2D-A249-E3AD6AE9A9CB',54800.00,500.00,1500.00,750.00,1,'Dark Purple',NULL,48,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(335,'E68BB825-0487-44CA-AE6C-7C650F81E22B',1880.00,500.00,750.00,150.00,1,'British Racing Green',NULL,9,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(336,'519C0ED1-7611-4CDC-8153-5C4B81A7FD0F',14800.00,970.00,1050.00,150.00,1,'Pink',NULL,40,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(337,'3CD0AFE8-9909-4A5D-BA9F-5C1F71B0DEE3',4400.00,500.00,750.00,150.00,0,'Blue',NULL,33,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(338,'114760E3-FC54-4C31-B323-BC4B83AB80D0',102800.00,3950.00,2200.00,1950.00,1,'Blue',NULL,21,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(339,'757E7DB7-3688-41FD-AFB6-E49CC56BCCD8',44000.00,1360.00,1500.00,550.00,1,'Silver',NULL,88,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(340,'BA123B46-B5DF-439B-9326-82174419FC14',1000.00,500.00,750.00,150.00,1,'Red',NULL,29,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(341,'FCB80D65-7D65-41E4-9081-6C92D0C7F1F5',276000.00,5500.00,457.00,1950.00,1,'Red',NULL,55,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(342,'51451AC8-A35F-4597-B4BC-94E92C150C3D',37520.00,2000.00,750.00,550.00,1,'Red',NULL,73,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(343,'B56F7C8F-0452-49C2-BEE2-C4C53BF38AD8',28760.00,500.00,750.00,550.00,1,'Black',NULL,8,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(344,'0318C525-58CA-438E-A5A5-BA854855A664',66072.00,1490.00,457.00,750.00,1,'Green',NULL,60,'2018-07-25 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(345,'17FA511D-1C85-4F74-A164-B4EE39F48565',90872.00,500.00,225.00,750.00,1,'Night Blue',NULL,13,'2018-07-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(346,'4B47A26E-2723-4E06-A661-21271A6759D0',36000.00,1360.00,750.00,550.00,1,'Black',NULL,21,'2018-07-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(347,'47572651-C884-4C1D-A433-E8641A1A1172',46080.00,2000.00,1500.00,550.00,1,'Night Blue',NULL,69,'2018-07-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(348,'2A27FF01-DC3C-4FE2-AC8C-9145C29F651C',82000.00,2175.00,1500.00,750.00,1,'Black',NULL,74,'2018-08-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(349,'F4443E46-3EAC-4C10-902C-71257DEEE229',31600.00,970.00,750.00,550.00,1,'Blue',NULL,97,'2018-08-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(350,'4EE854BF-A9DD-453B-815E-E0692A75A969',49240.00,660.00,750.00,550.00,1,'Black',NULL,100,'2018-08-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(351,'3D2E9AD0-972B-4A09-895F-1833655CFB21',44000.00,1360.00,1500.00,550.00,1,'Blue',NULL,1,'2018-08-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(352,'480D88A9-B1E5-4A79-9D2C-C1050C6DA00A',79600.00,2000.00,750.00,750.00,1,'Silver',NULL,59,'2018-08-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(353,'EE92EE4A-977E-4BC6-BEFF-512CC468944C',45440.00,500.00,750.00,550.00,1,'Silver',NULL,54,'2018-08-02 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(354,'B8498BEE-D1C5-4D93-981F-640031A3AE6C',71600.00,1490.00,750.00,750.00,1,'Dark Purple',NULL,24,'2018-08-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(355,'A44EE0A0-B924-4B29-9C05-BA4BFADE084B',58000.00,1490.00,225.00,750.00,1,'British Racing Green',NULL,29,'2018-08-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(356,'C8C871B4-F08D-445A-BCD1-ACFEC616A113',45560.00,970.00,750.00,550.00,0,'Red',NULL,63,'2018-08-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(357,'47693731-F213-4E60-97D6-115A7BD83259',50000.00,500.00,225.00,550.00,1,'Canary Yellow',NULL,73,'2018-09-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(358,'73FB2744-5AD9-42DC-A29C-B9B2FEF8353C',45512.00,1360.00,750.00,550.00,1,'Silver',NULL,91,'2018-09-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(359,'DB742D0B-E562-41F4-AC94-8C58C2B0B69C',26880.00,2000.00,457.00,550.00,1,'Dark Purple',NULL,19,'2018-09-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(360,'51784E0D-09DB-4A40-8E92-CB09A0DE4444',24400.00,1360.00,750.00,150.00,1,'Silver',NULL,11,'2018-09-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(361,'1A861C29-F198-4D34-BDAF-B35E8080320A',20000.00,1360.00,457.00,150.00,1,'Green',NULL,15,'2018-09-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(362,'D0F51768-8924-4EF5-A3E9-B31AC7129BFB',20400.00,1360.00,750.00,150.00,1,'Dark Purple',NULL,49,'2018-09-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(363,'E8FF8444-2B18-45A0-84AC-F776755E06ED',31600.00,970.00,750.00,550.00,1,'Night Blue',NULL,71,'2018-09-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(364,'A3E788F8-889C-45E1-A610-881983869F6B',10000.00,500.00,457.00,150.00,1,'Pink',NULL,91,'2018-09-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(365,'C8F49B5E-EDDB-42D0-BE0F-8C4181A6C81D',920.00,500.00,750.00,150.00,1,'Red',NULL,46,'2018-09-30 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(366,'1D5C9493-4BA2-415A-B4D6-7079278CA2DC',1560.00,500.00,750.00,150.00,1,'Red',NULL,99,'2018-10-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(367,'0A059F54-46DE-4A25-8B5D-D7373AEE6F91',2000.00,500.00,750.00,150.00,1,'Blue',NULL,98,'2018-10-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(368,'6AE8BA09-AE75-4CA4-81EE-6CD2B3947120',55600.00,2000.00,457.00,750.00,1,'Blue',NULL,85,'2018-10-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(369,'3BDD9316-9359-464B-B98E-308494AD3056',36000.00,500.00,750.00,550.00,1,'Silver',NULL,41,'2018-10-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(370,'3C17F01C-25FF-463B-86AA-1A34FEA02FF2',45592.00,970.00,457.00,550.00,1,'Black',NULL,72,'2018-10-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(371,'6FF2BEFA-53A6-40CB-A427-ECD8197D0CC5',24400.00,1360.00,750.00,150.00,1,'Black',NULL,30,'2018-10-10 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(372,'30EC553A-ADEA-4503-B748-C908A979EC45',17880.00,970.00,750.00,150.00,1,'Black',NULL,92,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(373,'2D512849-C35D-4B54-BDC8-C5523C1ABF86',44000.00,500.00,457.00,550.00,1,'Black',NULL,45,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(374,'0E2AECED-5A41-412A-9414-DE7217C0B6EB',69200.00,2175.00,750.00,750.00,1,'Red',NULL,71,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(375,'91B4067A-EBDE-4C1E-9370-3E894FD2FD7D',14280.00,970.00,750.00,150.00,1,'Black',NULL,18,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(376,'436E43FB-E015-48E4-B549-33F4A0EE8D3F',20760.00,1360.00,457.00,150.00,1,'Black',NULL,43,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(377,'E166158C-F3BA-47DE-A499-A703210CF128',23600.00,660.00,750.00,150.00,1,'Black',NULL,4,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(378,'1C9E6944-A890-4D7B-8F98-32B7276A78B3',47200.00,2000.00,750.00,550.00,0,'Blue',NULL,69,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(379,'CF66838B-8A21-4084-9771-07A82CDBEBD8',7160.00,500.00,228.00,150.00,1,'Dark Purple',NULL,59,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(380,'7461FB42-ECE2-4C8C-BDBB-EF26AF3069F9',7600.00,500.00,750.00,150.00,1,'Green',NULL,51,'2018-10-29 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(381,'F287EE1D-48C6-4E75-9595-E0AE235FBEA8',7600.00,500.00,330.00,150.00,1,'Green',NULL,65,'2018-11-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(382,'98828061-0C7A-42C2-95D0-3095AD2EF0E4',7120.00,500.00,750.00,150.00,1,'British Racing Green',NULL,63,'2018-11-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(383,'E519F3CF-BE4B-44CF-98D5-80EC33EC6CE1',9272.00,500.00,250.00,150.00,1,'Black',NULL,61,'2018-11-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(384,'E6923E8C-C07A-430F-B80D-7D5F329055AB',6800.00,500.00,750.00,150.00,1,'Red',NULL,58,'2018-11-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(385,'0487C263-79B7-4F2B-8D0E-B0BAA41D7F24',47600.00,500.00,500.00,550.00,1,'Black',NULL,13,'2018-12-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(386,'92FDF39E-6565-4B68-80BA-02ED30F00A7E',98800.00,2000.00,3150.00,750.00,1,'Black',NULL,41,'2018-12-01 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(387,'5D7C9AA9-F0C7-4F8E-8524-6481BE3CC62E',79600.00,1490.00,750.00,750.00,1,'Night Blue',NULL,27,'2018-12-05 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(388,'CD2E20D3-1A10-4460-AC3B-FAC658F5F6F4',43600.00,970.00,289.00,550.00,1,'Black',NULL,90,'2018-12-07 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(389,'3C384AE3-7F59-4CD6-BAFE-5E6EFFD25FAD',1272.00,500.00,750.00,150.00,1,'Black',NULL,92,'2018-12-07 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(390,'6556A473-CE18-428F-8F33-955E80FBA888',9200.00,500.00,750.00,150.00,1,'Black',NULL,87,'2018-12-15 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(391,'F166C930-3101-42E9-8AE8-189F47FA0014',14360.00,2000.00,1050.00,150.00,1,'Night Blue',NULL,33,'2018-12-16 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(392,'2E0E8003-F9CC-486D-9D08-D4DAC688C800',4400.00,500.00,750.00,150.00,1,'Black',NULL,31,'2018-12-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(393,'C2623FF4-88AA-40E9-AF3B-8D009C25027B',760.00,500.00,750.00,150.00,1,'Black',NULL,34,'2018-12-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N'),(394,'C7569243-BDDB-4250-901E-EA6034824106',116000.00,3950.00,750.00,1950.00,1,'Black',NULL,60,'2018-12-31 00:00:00',1,'2023-12-08 05:03:58','2023-12-08 05:03:58',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `Production.ManufacturerVehicleStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales.Customer`
--

DROP TABLE IF EXISTS `Sales.Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales.Customer` (
  `CustomerId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for customers',
  `CustomerName` varchar(65) NOT NULL COMMENT 'The full name of a customer',
  `CustomerAddress1` varchar(60) NOT NULL COMMENT 'The street address of a customer',
  `CustomerAddress2` varchar(60) DEFAULT NULL COMMENT 'The extended street address of a customer',
  `CustomerTown` varchar(30) NOT NULL COMMENT 'The town or city a customer resides in',
  `CustomerPostalCode` varchar(9) DEFAULT NULL COMMENT 'The postal code of a customer if applicable',
  `CountryId` int NOT NULL COMMENT 'A unique identifier for countries',
  `IsCustomerReseller` int NOT NULL COMMENT 'Flag to determine if a customer is a reseller',
  `IsCustomerCreditRisk` int NOT NULL COMMENT 'Flag to determine if customer is a credit risk',
  `SpendCapacity` varchar(15) DEFAULT NULL COMMENT 'The spend capacity of a customer',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  PRIMARY KEY (`CustomerId`),
  KEY `FK_Sales.Customer_Locale.Country` (`CountryId`),
  KEY `FK_Sales.Customer_DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Sales.Customer_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Sales.Customer_Locale.Country` FOREIGN KEY (`CountryId`) REFERENCES `Locale.Country` (`CountryId`),
  CONSTRAINT `BCK_TemplateTable_ValidBit_1125086184` CHECK (((`IsCustomerCreditRisk` = 0) or (`IsCustomerCreditRisk` = 1))),
  CONSTRAINT `CK_Sales_Customer_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_Sales_Customer_IsCustomerReseller` CHECK (((`IsCustomerReseller` = 0) or (`IsCustomerReseller` = 1))),
  CONSTRAINT `CK_Sales_Customer_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Sales_Customer_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A person who purchases a vehicle from the business';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales.Customer`
--

LOCK TABLES `Sales.Customer` WRITE;
/*!40000 ALTER TABLE `Sales.Customer` DISABLE KEYS */;
INSERT INTO `Sales.Customer` VALUES (1,'Magic Motors','27, Handsworth Road',NULL,'Birmingham','B1 7AZ',7,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(2,'Snazzy Roadsters','102, Bleak Street',NULL,'Birmingham','B3 5ST',7,1,1,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(3,'Birmingham Executive Prestige Vehicles','96, Aardvark Avenue',NULL,'Birmingham','B2 8UH',7,1,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(4,'WunderKar','AlexanderPlatz 205',NULL,'Berli',NULL,4,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(5,'Casseroles Chromes','29, Rue Gigondas',NULL,'Lyo',NULL,6,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(6,'Le Luxe en Motio','Avenue des Indes, 26',NULL,'Geneva','CH-1201',3,1,1,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(7,'Eat My Exhaust Ltd','29, Kop Hill',NULL,'Liverpool','L1 8UY',7,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(8,'M. Pierre Dubois','14, Rue De La Hutte',NULL,'Marseille',NULL,6,0,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(9,'Sondra Horowitz','10040 Great Western Road',NULL,'Los Angeles',NULL,10,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(10,'Wonderland Wheels','57, Grosvenor Estate Avenue',NULL,'Londo','E7 4BR',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(11,'London Executive Prestige Vehicles','199, Park Lane',NULL,'Londo','NW1 0AK',7,1,1,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(12,'Glittering Prize Cars Ltd','46, Golders Green Road','PO Box 27','Londo','E17 9IK',7,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(13,'La Bagnole de Luxe','890 Place de la Concorde','Cedex 8','Paris',NULL,6,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(14,'Convertible Dreams','31, Archbishop Ave',NULL,'Londo','SW2 6PL',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(15,'Alexei Tolstoi','83, Abbey Road',NULL,'Londo','N4 2CV',7,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(16,'SuperSport S.A.R.L.','210 Place de la Republique',NULL,'Paris',NULL,6,1,1,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(17,'Theo Kowalski','1000 East 51st Street',NULL,'New York',NULL,10,0,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(18,'Peter McLuckie','73, Entwhistle Street',NULL,'Londo','W10 B',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(19,'Posh Vehicles Ltd','82, Millar Close',NULL,'Manchester','M4 5SD',7,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(20,'Jason B. Wight','5300 Star Boulevard',NULL,'Washingto',NULL,10,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(21,'Silver HubCaps','54, Didsbury Lane',NULL,'Manchester','M1 7TH',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(22,'Stan Collywobble','65, Townsend Road',NULL,'Manchester','M1 5HJ',7,0,1,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(23,'Glitz','FriedrichStrasse 579',NULL,'Stuttgart',NULL,4,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(24,'Matterhorn Motors','1, Rue de la Colline',NULL,'Lausanne',NULL,3,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(25,'King Leer Cars','87, Lindisfarne Road',NULL,'Newcastle','NE1 4OX',7,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(26,'Honest Pete Motors','76, Williams Street',NULL,'Stoke','ST3 9XY',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(27,'Peter Smith','82, Ell Pie Lane',NULL,'Birmingham','B5 5SD',7,0,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(28,'Vive La Vitesse','56, Rue Noiratre',NULL,'Marseille',NULL,6,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(29,'Liverpool Executive Prestige Vehicles','8, Everton Avenue',NULL,'Liverpool','L2 2RD',7,1,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(30,'Mrs. Ivana Telford','52, Gerrard Mansions',NULL,'Liverpool','L2 9RT',7,0,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(31,'Kieran O\'Harris','71, Askwith Ave',NULL,'Liverpool','L7 6OP',7,0,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(32,'Prestige Imports','Gran Via 26',NULL,'Barcelona','08120',5,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(33,'Prestissimo!','Via Appia 239',NULL,'Mila',NULL,9,1,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(34,'Diplomatic Cars','Rue Des Coteaux, 39',NULL,'Brussels',NULL,1,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(35,'Laurent Saint Yves','49, Rue Quicampoix',NULL,'Marseille',NULL,6,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(36,'Screami\' Wheels','1090 Reagan Road',NULL,'Los Angeles',NULL,10,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(37,'Screami\' Wheels','4, Churchill Close',NULL,'Londo','SE1 5RU',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(38,'Executive Motor Delight','17, The Brambles',NULL,'Londo','SE17 6AD',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(39,'Alicia Almodovar','Palacia Del Sol',NULL,'Barcelona','08400',5,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(40,'Ronaldo Bianco','Palazzo Medusa 2000',NULL,'Mila',NULL,9,0,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(41,'Sport.Car','Via Barberini 59',NULL,'Rome','00120',9,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(42,'Autos Sportivos','Paseo del Prado, 270',NULL,'Madrid',NULL,5,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(43,'Le Luxe en Motio','32, Allee de la Paix',NULL,'Paris',NULL,6,1,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(44,'Screami\' Wheels Corp','50000 Fifth Avenue',NULL,'New York',NULL,10,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(45,'Pierre Blanc','52 Deirdre Lane',NULL,'Londo','C1 3EJ',7,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(46,'Capots Reluisants S.A.','567 rue Lafayette',NULL,'Paris',NULL,6,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(47,'Stefano DiLonghi','Piazza Verona',NULL,'Rome','00129',9,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(48,'Antonio Maura','Puerta del Sol, 45',NULL,'Madrid',NULL,5,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(49,'Stefan Van Helsing','Nieuwstraat 5',NULL,'Brussels',NULL,1,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(50,'Mme Anne Duport','90, Place de la Victoire 1945',NULL,'Paris',NULL,6,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(51,'Screami\' Wheels','10500 The Potomac',NULL,'Washingto',NULL,10,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(52,'Clubbing Cars','91, Acid Avenue',NULL,'Manchester','M5 9RD',7,1,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(53,'Jean-Yves Truffaut','87 Rue du Combat',NULL,'Paris',NULL,6,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(54,'Mr. Evan Telford','7, Godzilla Street',NULL,'Manchester','M2 6KL',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(55,'Ralph Oberman','BerolinaStrasse 210',NULL,'Berli',NULL,4,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(56,'ImpressTheNeighbours.Com','47, Edgbaston Row',NULL,'Birmingham','B4 4RY',7,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(57,'Wladimir Lacroix','3, Rue de la Vie en Rose',NULL,'Lyo',NULL,6,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(58,'Raimondo Delattre','9, Place de Chatelet',NULL,'Geneva','CH-1211',3,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(59,'Boris Spry','53, Odeon Way',NULL,'Birmingham','B1 4BZ',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(60,'Andrea Tarbuck','2,Newcastle Lane',NULL,'Birmingham','B4 8SG',7,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(61,'Beltway Prestige Driving','1, Smithy Close',NULL,'Liverpool','L1 WS',7,1,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(62,'Bling Motors','2, Arndale Lane',NULL,'Liverpool','L3 QS',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(63,'Smooth Rocking Chrome','Via Stromboli 2',NULL,'Mila',NULL,9,1,1,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(64,'YO! Speed!','Plaza Mayor',NULL,'Barcelona','08550',5,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(65,'Stephany Rousso','10180 Orange County Place',NULL,'Los Angeles',NULL,10,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(66,'My Shiny Sports Car Ltd.','1091, Cambride Street',NULL,'Londo','W1 3GH',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(67,'Flash Voitures','Place Anspach 85',NULL,'Brussels',NULL,1,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(68,'Paul Blasio','50500 JFK Square',NULL,'New York',NULL,10,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(69,'Mary Blackhouse','260, Oxford Avenue',NULL,'Londo','E1 9AP',7,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(70,'Maurice Dujardi','10, Daltrey Lane',NULL,'Londo','NW1 7YU',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(71,'Leslie Whittingto','17, Mercury Street',NULL,'Londo','SE1 4AT',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(72,'Mike Beeto','Green Plaza Place',NULL,'Londo','SW13 7ED',7,0,1,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(73,'Melissa Bertrand','7, Westlands Street',NULL,'Londo','NW10 2SG',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(74,'El Sport','Plaza San Andres',NULL,'Madrid',NULL,5,1,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(75,'Bling Bling S.A.','7, Place de la Richesse','Z.I Les Arnaques','Paris',NULL,6,1,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(76,'Bravissima!','Via Rosso, 34',NULL,'Rome','00175',9,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(77,'Jayden Jones','10500 Lincoln Square',NULL,'Washingto',NULL,10,0,0,'Some',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(78,'Expensive Shine','89, Abbots Lane',NULL,'Manchester','M17 3EF',7,1,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(79,'Steve Docherty','5, Albermarle Avenue',NULL,'Manchester','M7 9AS',7,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(80,'Rodolph Legler','SingerStrasse 89',NULL,'Stuttgart',NULL,4,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(81,'Pete Spring','53, Pimlico Square',NULL,'Manchester','M3 4WR',7,0,1,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(82,'Khader El Ghannam','10, rue de Jemappes','4eme etage','Paris',NULL,6,0,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(83,'Jacques Mitterand','1 Quai des Pertes',NULL,'Paris',NULL,6,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(84,'Francoise LeBru','56, Rue Verte',NULL,'Lausanne',NULL,3,0,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(85,'Alex McWhirter','89, Harlequin Road',NULL,'Newcastle','NE1 7DH',7,0,0,'None',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(86,'Francois Chirac','2, Quai de l\'Enfer',NULL,'Paris',NULL,6,0,0,'Immense',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(87,'Andy Cheshire','7, Wedgewood Steet',NULL,'Stoke','ST4 2OZ',7,0,0,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N'),(88,'Jimmy McFiddler','57, Smile Square',NULL,'Glasgow','G15 1AA',7,1,1,'Lots',1,'2023-12-08 05:03:57','2023-12-08 05:03:57',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `Sales.Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales.SalesOrderVehicle`
--

DROP TABLE IF EXISTS `Sales.SalesOrderVehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales.SalesOrderVehicle` (
  `SalesOrderVehicleId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for a purchase',
  `CustomerId` int NOT NULL COMMENT 'A unique identifier for customers',
  `StaffId` int NOT NULL COMMENT 'A unique identifier for staff members',
  `InvoiceNumber` varchar(8) NOT NULL COMMENT 'The invoice number of an order',
  `TotalSalePrice` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'The total sale price of an order',
  `SaleDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The date an order was made',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  `CategoryDescription` varchar(20) GENERATED ALWAYS AS ((case when (`TotalSalePrice` >= 100001.00) then _utf8mb4'Very High' when (`TotalSalePrice` between 75001.00 and 100000.00) then _utf8mb4'High' when (`TotalSalePrice` between 50001.00 and 75000.00) then _utf8mb4'Medium' when (`TotalSalePrice` between 25001.00 and 50000.00) then _utf8mb4'Low' when (`TotalSalePrice` between 150001.00 and 250000.00) then _utf8mb4'Exceptional' when (`TotalSalePrice` between 100001.00 and 150000.00) then _utf8mb4'Very High' when (`TotalSalePrice` between 100.00 and 25000.00) then _utf8mb4'Very Low' else _utf8mb4'Unknown' end)) VIRTUAL NOT NULL COMMENT 'The category description a vehicle sales threshold',
  PRIMARY KEY (`SalesOrderVehicleId`),
  KEY `FK_Sales.SalesOrderVehicle_Sales.Customer` (`CustomerId`),
  KEY `FK_Sales.SalesOrderVehicle_HumanResources.Staff` (`StaffId`),
  KEY `FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Sales.SalesOrderVehicle_HumanResources.Staff` FOREIGN KEY (`StaffId`) REFERENCES `HumanResources.Staff` (`StaffId`),
  CONSTRAINT `FK_Sales.SalesOrderVehicle_Sales.Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Sales.Customer` (`CustomerId`),
  CONSTRAINT `CK_Sales_SalesOrderVehicle_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_Sales_SalesOrderVehicle_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Sales_SalesOrderVehicle_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Sales_SalesOrderVehicle_TotalSalePrice` CHECK ((`TotalSalePrice` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='An order for the purchase of a vehicle';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales.SalesOrderVehicle`
--

LOCK TABLES `Sales.SalesOrderVehicle` WRITE;
/*!40000 ALTER TABLE `Sales.SalesOrderVehicle` DISABLE KEYS */;
INSERT INTO `Sales.SalesOrderVehicle` (`SalesOrderVehicleId`, `CustomerId`, `StaffId`, `InvoiceNumber`, `TotalSalePrice`, `SaleDate`, `UserAuthorizationId`, `SysStartTime`, `SysEndTime`, `RowLevelHashKey`, `TransactionNumber`, `Note`, `PriorRowLevelHashKey`, `FireAuditTrigger`) VALUES (1,1,1,'GBPGB001',65000.00,'2015-01-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(2,2,2,'GBPGB002',220000.10,'2015-01-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(3,3,3,'GBPGB003',19500.00,'2015-02-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(4,4,4,'EURDE004',11500.00,'2015-02-16 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(5,5,5,'EURFR005',19900.00,'2015-01-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(6,1,6,'GBPGB006',29500.00,'2015-03-14 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(7,3,7,'GBPGB007',49500.20,'2015-03-24 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(8,7,8,'GBPGB008',76000.90,'2015-03-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(9,8,9,'EURFR009',19600.00,'2015-04-06 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(10,9,10,'USDUS010',36500.00,'2015-04-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(11,10,11,'GBPGB011',89000.00,'2015-04-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(12,11,12,'GBPGB012',169500.00,'2015-05-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(13,8,7,'EURFR013',8950.00,'2015-05-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(14,12,1,'GBPGB014',195000.00,'2015-05-28 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(15,13,2,'EURFR015',22950.00,'2015-06-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(16,14,3,'GBPGB016',8695.00,'2015-07-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(17,15,4,'GBPGB017',22990.00,'2015-07-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(18,16,5,'EURFR018',75500.00,'2015-07-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(19,17,6,'USDUS019',5500.00,'2015-08-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(20,18,7,'GBPGB020',12650.00,'2015-09-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(21,19,8,'GBPGB021',8950.00,'2015-09-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(22,18,9,'GBPGB022',15600.00,'2015-09-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(23,15,10,'GBPGB023',22600.00,'2015-10-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(24,17,11,'USDUS024',123590.00,'2015-10-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(25,14,12,'GBPGB025',22950.00,'2015-11-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(26,15,7,'GBPGB026',69500.00,'2015-12-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(27,6,1,'GBPCH027',12500.00,'2016-01-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(28,7,2,'GBPGB028',12500.00,'2016-01-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(29,9,3,'USDUS029',159500.00,'2016-01-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(30,10,4,'GBPGB030',165000.00,'2016-01-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(31,8,5,'EURFR031',2550.00,'2016-01-07 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(32,19,6,'GBPGB032',29500.00,'2016-01-07 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(33,20,7,'USDUS033',12650.00,'2016-01-09 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(34,21,8,'GBPGB034',56950.00,'2016-01-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(35,22,9,'GBPGB035',56000.00,'2016-02-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(36,23,10,'EURDE036',71890.00,'2016-02-17 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(37,16,11,'EURFR037',39500.00,'2016-02-16 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(38,1,12,'GBPGB038',3650.00,'2016-02-28 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(39,24,7,'GBPCH039',220500.00,'2016-03-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(40,25,1,'GBPGB040',102950.00,'2016-04-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(41,20,2,'USDUS041',17500.00,'2016-04-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(42,21,3,'GBPGB042',8800.00,'2016-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(43,23,4,'EURDE043',99500.00,'2016-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(44,21,5,'GBPGB044',17500.00,'2016-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(45,10,6,'GBPGB045',12500.00,'2016-04-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(46,15,7,'GBPGB046',49450.00,'2016-05-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(47,16,8,'EURFR047',49580.00,'2016-05-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(48,8,9,'EURFR048',5500.00,'2016-06-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(49,26,10,'GBPGB049',22150.00,'2016-06-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(50,27,11,'GBPGB050',35000.00,'2016-06-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(51,28,12,'EURFR051',174650.00,'2016-06-15 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(52,29,7,'GBPGB052',15650.00,'2016-07-01 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(53,20,1,'USDUS053',12500.00,'2016-07-06 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(54,30,2,'GBPGB054',195000.00,'2016-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(55,15,3,'GBPGB055',205000.00,'2016-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(56,14,4,'GBPGB056',66500.00,'2016-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(57,31,5,'GBPGB057',19500.00,'2016-07-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(58,32,6,'EURES058',79500.00,'2016-07-26 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(59,33,7,'EURIT059',14590.00,'2016-07-26 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(60,32,8,'EURES060',12750.00,'2016-08-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(61,22,9,'GBPGB061',45600.00,'2016-08-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(62,21,10,'GBPGB062',6500.00,'2016-08-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(63,15,11,'GBPGB063',102500.00,'2016-08-02 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(64,16,12,'EURFR064',99500.00,'2016-08-09 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(65,14,7,'GBPGB065',12500.00,'2016-08-10 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(66,4,1,'EURDE066',61500.00,'2016-08-12 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(67,6,2,'GBPCH067',79500.00,'2016-08-13 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(68,18,3,'GBPGB068',50100.00,'2016-08-13 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(69,5,4,'EURFR069',66500.00,'2016-08-13 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(70,33,5,'EURIT070',45000.00,'2016-08-19 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(71,23,6,'EURDE071',19500.00,'2016-08-19 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(72,21,7,'GBPGB072',76500.00,'2016-08-21 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(73,14,8,'GBPGB073',45900.00,'2016-08-22 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(74,34,9,'EURBE074',125000.00,'2016-08-23 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(75,35,10,'EURFR075',65500.00,'2016-08-24 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(76,36,11,'USDUS076',92150.00,'2016-08-25 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(77,37,12,'GBPGB077',9500.00,'2016-08-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(78,33,7,'EURIT078',9950.00,'2016-08-28 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(79,25,1,'GBPGB079',5680.00,'2016-08-29 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(80,24,2,'GBPCH080',19500.00,'2016-08-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(81,15,3,'GBPGB081',3500.00,'2016-09-04 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(82,6,4,'GBPCH082',3950.00,'2016-09-04 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(83,19,5,'GBPGB083',20950.00,'2016-09-04 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(84,3,6,'GBPGB084',7500.00,'2016-09-06 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(85,2,7,'GBPGB085',56500.00,'2016-09-07 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(86,22,8,'GBPGB086',49500.00,'2016-09-07 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(87,32,9,'EURES087',68900.00,'2016-09-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(88,1,10,'GBPGB088',55000.00,'2016-09-11 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(89,8,11,'EURFR089',3575.00,'2016-09-14 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(90,12,12,'GBPGB090',35250.00,'2016-09-14 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(91,13,7,'EURFR091',47490.00,'2016-09-16 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(92,15,1,'GBPGB092',45950.00,'2016-09-16 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(93,25,2,'GBPGB093',9950.00,'2016-09-18 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(94,26,3,'GBPGB094',163050.00,'2016-09-19 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(95,22,4,'GBPGB095',76500.00,'2016-10-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(96,32,5,'EURES096',119600.00,'2016-10-05 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(97,38,6,'GBPGB097',95600.00,'2016-10-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(98,39,7,'EURES098',12500.00,'2016-10-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(99,40,8,'EURIT099',12500.00,'2016-10-30 00:00:00',1,'2023-12-08 05:03:59','2023-12-08 05:03:59',NULL,1,'Row was inserted',NULL,'N'),(100,3,9,'GBPGB100',56890.00,'2016-11-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(101,12,10,'GBPGB101',55000.00,'2016-11-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(102,26,11,'GBPGB102',191490.00,'2016-12-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(103,33,12,'EURIT103',99500.00,'2016-12-06 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(104,13,7,'EURFR104',60500.00,'2016-12-06 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(105,14,1,'GBPGB105',123500.00,'2016-12-06 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(106,23,2,'EURDE106',25000.00,'2016-12-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(107,28,3,'EURFR107',169500.00,'2016-12-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(108,29,4,'GBPGB108',99500.00,'2016-12-28 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(109,39,5,'EURES109',39500.00,'2016-12-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(110,28,6,'EURFR110',22500.00,'2017-01-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(111,27,7,'GBPGB111',125000.00,'2017-01-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(112,7,8,'GBPGB112',85000.00,'2017-01-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(113,13,9,'EURFR113',1250.00,'2017-01-21 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(114,6,10,'GBPCH114',22500.00,'2017-01-11 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(115,1,11,'GBPGB115',125950.00,'2017-01-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(116,6,12,'GBPCH116',8850.00,'2017-01-13 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(117,19,7,'GBPGB117',9950.00,'2017-01-14 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(118,28,1,'EURFR118',56500.00,'2017-01-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(119,37,2,'GBPGB119',55000.00,'2017-01-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(120,26,3,'GBPGB120',56950.00,'2017-01-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(121,28,4,'EURFR121',365000.00,'2017-02-07 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(122,35,5,'EURFR122',395000.00,'2017-02-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(123,36,6,'USDUS123',21500.00,'2017-02-09 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(124,37,7,'GBPGB124',6500.00,'2017-02-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(125,34,8,'EURBE125',12500.00,'2017-02-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(126,1,9,'GBPGB126',2250.00,'2017-02-14 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(127,11,10,'GBPGB127',3500.00,'2017-03-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(128,12,11,'GBPGB128',5680.00,'2017-03-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(129,16,12,'EURFR129',8550.00,'2017-03-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(130,26,7,'GBPGB130',156500.00,'2017-03-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(131,25,1,'GBPGB131',56500.00,'2017-03-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(132,34,2,'EURBE132',86500.00,'2017-03-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(133,1,3,'GBPGB133',66500.00,'2017-03-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(134,5,4,'EURFR134',55600.00,'2017-03-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(135,23,5,'EURDE135',305000.00,'2017-03-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(136,28,6,'EURFR136',45000.00,'2017-03-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(137,29,7,'GBPGB137',225000.00,'2017-03-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(138,37,8,'GBPGB138',42950.00,'2017-03-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(139,31,9,'GBPGB139',990.00,'2017-03-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(140,32,10,'EURES140',29500.00,'2017-04-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(141,35,11,'EURFR141',139500.00,'2017-04-06 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(142,26,12,'GBPGB142',295000.00,'2017-04-07 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(143,28,7,'EURFR143',220500.00,'2017-04-07 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(144,29,1,'GBPGB144',79500.00,'2017-05-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(145,27,2,'GBPGB145',162500.00,'2017-05-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(146,41,3,'EURIT146',79500.00,'2017-05-09 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(147,42,4,'EURES147',65890.00,'2017-05-09 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(148,40,5,'EURIT148',61500.00,'2017-05-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(149,39,6,'EURES149',12500.00,'2017-05-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(150,1,7,'GBPGB150',255000.00,'2017-05-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(151,43,8,'EURFR151',255950.00,'2017-05-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(152,44,9,'USDUS152',250000.00,'2017-05-13 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(153,33,10,'EURIT153',6500.00,'2017-05-16 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(154,22,11,'GBPGB154',9250.00,'2017-05-19 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(155,11,12,'GBPGB155',950.00,'2017-05-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(156,8,7,'EURFR156',295000.00,'2017-05-21 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(157,45,1,'GBPGB157',99500.00,'2017-05-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(158,46,2,'EURFR158',33500.00,'2017-05-23 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(159,23,3,'EURDE159',45000.00,'2017-05-24 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(160,35,4,'EURFR160',114000.00,'2017-05-26 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(161,24,5,'GBPCH161',2350.00,'2017-05-27 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(162,11,6,'GBPGB162',32500.00,'2017-06-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(163,19,7,'GBPGB163',45000.00,'2017-06-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(164,6,8,'GBPCH164',8500.00,'2017-06-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(165,4,9,'EURDE165',99500.00,'2017-06-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(166,47,10,'EURIT166',25000.00,'2017-06-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(167,33,11,'EURIT167',19500.00,'2017-06-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(168,48,12,'EURES168',12950.00,'2017-06-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(169,25,7,'GBPGB169',5650.00,'2017-06-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(170,16,1,'EURFR170',29500.00,'2017-06-24 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(171,49,2,'EURBE171',45950.00,'2017-07-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(172,50,3,'EURFR172',99950.00,'2017-07-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(173,3,4,'GBPGB173',335000.00,'2017-07-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(174,8,5,'EURFR174',56500.00,'2017-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(175,11,6,'GBPGB175',99500.00,'2017-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(176,16,7,'EURFR176',135000.00,'2017-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(177,25,8,'GBPGB177',89500.00,'2017-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(178,24,9,'GBPCH178',165000.00,'2017-08-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(179,36,10,'USDUS179',22600.00,'2017-08-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(180,46,11,'EURFR180',32675.00,'2017-08-06 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(181,28,12,'EURFR181',45000.00,'2017-08-07 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(182,21,7,'GBPGB182',5500.00,'2017-08-27 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(183,7,1,'GBPGB183',55000.00,'2017-08-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(184,9,2,'USDUS184',49500.00,'2017-09-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(185,39,3,'EURES185',250000.00,'2017-09-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(186,28,4,'EURFR186',155000.00,'2017-09-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(187,17,5,'USDUS187',15750.00,'2017-09-26 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(188,26,6,'GBPGB188',19500.00,'2017-10-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(189,35,7,'EURFR189',235000.00,'2017-10-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(190,14,8,'GBPGB190',25000.00,'2017-11-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(191,47,9,'EURIT191',245000.00,'2017-11-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(192,48,10,'EURES192',89000.00,'2017-11-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(193,49,11,'EURBE193',34000.00,'2017-11-06 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(194,50,12,'EURFR194',62700.00,'2017-11-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(195,2,7,'GBPGB195',45950.00,'2017-12-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(196,12,1,'GBPGB196',21600.00,'2017-12-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(197,22,2,'GBPGB197',25000.00,'2017-12-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(198,23,3,'EURDE198',23600.00,'2017-12-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(199,32,4,'EURES199',99950.00,'2017-12-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(200,41,5,'EURIT200',46900.00,'2017-12-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(201,45,6,'GBPGB201',45950.00,'2017-12-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(202,46,7,'EURFR202',7550.00,'2017-12-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(203,48,8,'EURES203',11990.00,'2017-12-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(204,36,9,'USDUS204',12500.00,'2017-12-27 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(205,37,10,'GBPGB205',7500.00,'2017-12-27 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(206,25,11,'GBPGB206',56850.00,'2018-01-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(207,21,12,'GBPGB207',62500.00,'2018-01-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(208,26,7,'GBPGB208',42500.00,'2018-01-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(209,51,1,'USDUS209',65450.00,'2018-01-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(210,52,2,'GBPGB210',56950.00,'2018-01-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(211,53,3,'EURFR211',1950.00,'2018-01-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(212,54,4,'GBPGB212',1150.00,'2018-01-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(213,55,5,'EURDE213',11550.00,'2018-01-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(214,45,6,'GBPGB214',12570.00,'2018-01-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(215,46,7,'EURFR215',9890.00,'2018-01-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(216,12,8,'GBPGB216',56950.00,'2018-01-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(217,32,9,'EURES217',45950.00,'2018-01-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(218,49,10,'EURBE218',950.00,'2018-01-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(219,35,11,'EURFR219',21550.00,'2018-01-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(220,21,12,'GBPGB220',5950.00,'2018-01-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(221,13,7,'EURFR221',355000.00,'2018-01-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(222,8,1,'EURFR222',120000.00,'2018-02-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(223,6,2,'GBPCH223',121500.00,'2018-02-11 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(224,9,3,'USDUS224',182500.00,'2018-02-12 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(225,56,4,'GBPGB225',22500.00,'2018-02-13 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(226,57,5,'EURFR226',21500.00,'2018-02-14 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(227,46,6,'EURFR227',189500.00,'2018-02-17 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(228,58,7,'GBPCH228',55450.00,'2018-02-17 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(229,59,8,'GBPGB229',98950.00,'2018-02-17 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(230,60,9,'GBPGB230',355000.00,'2018-02-17 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(231,28,10,'EURFR231',6000.00,'2018-03-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(232,39,11,'EURES232',5690.00,'2018-03-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(233,17,12,'USDUS233',56900.00,'2018-03-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(234,48,7,'EURES234',368000.00,'2018-03-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(235,46,1,'EURFR235',310000.00,'2018-03-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(236,45,2,'GBPGB236',9800.00,'2018-03-19 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(237,39,3,'EURES237',15950.00,'2018-04-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(238,31,4,'GBPGB238',267950.00,'2018-04-09 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(239,25,5,'GBPGB239',155000.00,'2018-04-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(240,36,6,'USDUS240',2500.00,'2018-04-11 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(241,28,7,'EURFR241',9950.00,'2018-04-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(242,36,8,'USDUS242',39500.00,'2018-04-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(243,38,9,'GBPGB243',23500.00,'2018-04-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(244,39,10,'EURES244',45950.00,'2018-04-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(245,51,11,'USDUS245',55000.00,'2018-04-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(246,56,12,'GBPGB246',100000.00,'2018-04-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(247,61,7,'GBPGB247',44885.00,'2018-04-20 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(248,62,1,'GBPGB248',61500.00,'2018-04-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(249,52,2,'GBPGB249',950.00,'2018-04-23 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(250,63,3,'EURIT250',195000.00,'2018-04-24 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(251,64,4,'EURES251',52500.00,'2018-04-29 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(252,3,5,'GBPGB252',1350.00,'2018-05-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(253,21,6,'GBPGB253',2495.00,'2018-05-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(254,35,7,'EURFR254',269500.00,'2018-05-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(255,65,8,'USDUS255',195000.00,'2018-05-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(256,66,9,'GBPGB256',25950.00,'2018-05-23 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(257,61,10,'GBPGB257',9990.00,'2018-05-23 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(258,63,11,'EURIT258',135000.00,'2018-05-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(259,62,12,'GBPGB259',1250.00,'2018-05-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(260,66,7,'GBPGB260',6590.00,'2018-05-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(261,35,1,'EURFR261',89500.00,'2018-05-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(262,31,2,'GBPGB262',18500.00,'2018-05-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(263,24,3,'GBPCH263',3575.00,'2018-06-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(264,67,4,'EURBE264',6950.00,'2018-06-03 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(265,2,5,'GBPGB265',26500.00,'2018-06-16 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(266,68,6,'USDUS266',33500.00,'2018-06-18 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(267,12,7,'GBPGB267',24500.00,'2018-06-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(268,25,8,'GBPGB268',99500.00,'2018-06-23 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(269,38,9,'GBPGB269',99990.00,'2018-07-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(270,69,10,'GBPGB270',6950.00,'2018-07-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(271,70,11,'GBPGB271',10500.00,'2018-07-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(272,62,12,'GBPGB272',33450.00,'2018-07-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(273,54,7,'GBPGB273',72500.00,'2018-07-25 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(274,71,1,'GBPGB274',2400.00,'2018-07-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(275,72,2,'GBPGB275',68500.00,'2018-07-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(276,6,3,'GBPCH276',2350.00,'2018-07-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(277,56,4,'GBPGB277',18500.00,'2018-07-30 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(278,73,5,'GBPGB278',5500.00,'2018-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(279,74,6,'EURES279',128500.00,'2018-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(280,65,7,'USDUS280',55000.00,'2018-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(281,63,8,'EURIT281',1250.00,'2018-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(282,75,9,'EURFR282',345000.00,'2018-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(283,76,10,'EURIT283',82590.00,'2018-07-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(284,77,11,'USDUS284',113590.00,'2018-08-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(285,65,12,'USDUS285',45000.00,'2018-08-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(286,64,7,'EURES286',57600.00,'2018-08-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(287,45,1,'GBPGB287',102500.00,'2018-08-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(288,54,2,'GBPGB288',39500.00,'2018-08-10 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(289,78,3,'GBPGB289',61550.00,'2018-08-11 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(290,79,4,'GBPGB290',55000.00,'2018-08-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(291,80,5,'EURDE291',99500.00,'2018-08-16 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(292,6,6,'GBPCH292',56800.00,'2018-08-18 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(293,36,7,'USDUS293',89500.00,'2018-09-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(294,16,8,'EURFR294',72500.00,'2018-09-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(295,14,9,'GBPGB295',56950.00,'2018-09-01 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(296,56,10,'GBPGB296',62500.00,'2018-09-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(297,48,11,'EURES297',56890.00,'2018-09-04 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(298,57,12,'EURFR298',33600.00,'2018-09-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(299,81,7,'GBPGB299',30500.00,'2018-09-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(300,82,1,'EURFR300',50500.00,'2018-09-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(301,78,2,'GBPGB301',39500.00,'2018-09-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(302,76,3,'EURIT302',12500.00,'2018-09-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(303,69,4,'GBPGB303',5600.00,'2018-10-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(304,83,5,'EURFR304',69500.00,'2018-10-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(305,84,6,'GBPCH305',45000.00,'2018-10-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(306,65,7,'USDUS306',56990.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(307,77,8,'USDUS307',86500.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(308,85,9,'GBPGB308',17850.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(309,86,10,'EURFR309',25950.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(310,87,11,'GBPGB310',29500.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(311,5,12,'EURFR311',59000.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(312,65,7,'USDUS312',9500.00,'2018-10-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(313,35,1,'EURFR313',8900.00,'2018-11-02 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(314,24,2,'GBPCH314',11590.00,'2018-11-15 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(315,19,3,'GBPGB315',8500.00,'2018-11-22 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(316,20,4,'USDUS316',59500.00,'2018-12-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(317,40,5,'EURIT317',123500.00,'2018-12-05 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(318,60,6,'GBPGB318',99500.00,'2018-12-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(319,59,7,'GBPGB319',56090.00,'2018-12-08 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(320,48,8,'EURES320',11500.00,'2018-12-16 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(321,36,9,'USDUS321',17950.00,'2018-12-17 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(322,35,10,'EURFR322',5500.00,'2018-12-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(323,30,11,'GBPGB323',950.00,'2018-12-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(324,87,12,'GBPGB324',145000.00,'2018-12-31 00:00:00',1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `Sales.SalesOrderVehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales.SalesOrderVehicleDetail`
--

DROP TABLE IF EXISTS `Sales.SalesOrderVehicleDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales.SalesOrderVehicleDetail` (
  `SalesOrderVehicleDetailId` int NOT NULL AUTO_INCREMENT COMMENT 'A unique identifier for Sales.SalesOrderVehicleDetail Ids',
  `SalesOrderVehicleId` int DEFAULT NULL COMMENT 'A unique identifier for a purchase',
  `LineItemNumber` int NOT NULL DEFAULT '1' COMMENT 'The line item number on the invoice',
  `SalePrice` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'The sale price of a vehicle',
  `LineItemDiscount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT 'The discount of the line item number',
  `DerivedDiscountedSalePrice` decimal(18,2) GENERATED ALWAYS AS ((`SalePrice` - `LineItemDiscount`)) VIRTUAL NOT NULL COMMENT 'The derived discounted sale price of a vehicle',
  `ManufacturerVehicleStockId` int NOT NULL COMMENT 'A unique identifier for manfacturer vehicle stock',
  `UserAuthorizationId` int NOT NULL DEFAULT '1' COMMENT 'A unique identifier for UserAuthorizationIds',
  `SysStartTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction',
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `TransactionNumber` int NOT NULL DEFAULT '1' COMMENT 'The transaction number in a series of database transactions',
  `Note` varchar(100) DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction',
  `PriorRowLevelHashKey` blob COMMENT 'The prior transaction row level hash key',
  `FireAuditTrigger` char(1) NOT NULL DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired',
  PRIMARY KEY (`SalesOrderVehicleDetailId`),
  KEY `FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle` (`SalesOrderVehicleId`),
  KEY `FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleS` (`ManufacturerVehicleStockId`),
  KEY `FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`),
  CONSTRAINT `FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleS` FOREIGN KEY (`ManufacturerVehicleStockId`) REFERENCES `Production.ManufacturerVehicleStock` (`ManufacturerVehicleStockId`),
  CONSTRAINT `FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle` FOREIGN KEY (`SalesOrderVehicleId`) REFERENCES `Sales.SalesOrderVehicle` (`SalesOrderVehicleId`),
  CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_FireAuditTrigger` CHECK (((`FireAuditTrigger` = _utf8mb4'Y') or (`FireAuditTrigger` = _utf8mb4'N'))),
  CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_LineItemDiscount` CHECK ((`LineItemDiscount` >= 0)),
  CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_SalePrice` CHECK ((`SalePrice` >= 0)),
  CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_SysEndTime` CHECK ((`SysEndTime` >= `SysStartTime`)),
  CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_SysStartTime` CHECK ((`SysEndTime` >= `SysStartTime`))
) ENGINE=InnoDB AUTO_INCREMENT=352 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='The details of a vehicle order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales.SalesOrderVehicleDetail`
--

LOCK TABLES `Sales.SalesOrderVehicleDetail` WRITE;
/*!40000 ALTER TABLE `Sales.SalesOrderVehicleDetail` DISABLE KEYS */;
INSERT INTO `Sales.SalesOrderVehicleDetail` (`SalesOrderVehicleDetailId`, `SalesOrderVehicleId`, `LineItemNumber`, `SalePrice`, `LineItemDiscount`, `ManufacturerVehicleStockId`, `UserAuthorizationId`, `SysStartTime`, `SysEndTime`, `RowLevelHashKey`, `TransactionNumber`, `Note`, `PriorRowLevelHashKey`, `FireAuditTrigger`) VALUES (1,1,1,65000.00,2700.00,1,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(2,2,1,220000.00,60000.00,2,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(3,3,1,19500.00,0.00,3,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(4,4,1,11500.00,0.00,4,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(5,5,1,19950.00,0.00,5,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(6,6,1,29500.00,1250.00,7,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(7,7,1,49500.00,2450.00,8,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(8,8,1,76000.00,5500.00,9,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(9,9,1,19600.00,0.00,11,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(10,10,1,36500.00,2500.00,12,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(11,11,1,8500.00,50.00,13,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(12,11,2,80500.00,500.00,15,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(13,12,1,169500.00,0.00,16,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(14,13,1,8950.00,25.00,17,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(15,14,1,195000.00,0.00,18,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(16,15,1,22950.00,950.00,19,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(17,16,1,8695.00,95.00,20,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(18,17,1,22990.00,0.00,21,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(19,18,1,19500.00,1500.00,22,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(20,18,2,56000.00,0.00,23,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(21,19,1,5500.00,500.00,25,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(22,20,1,12650.00,0.00,26,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(23,21,1,8950.00,950.00,28,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(24,22,1,15600.00,0.00,30,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(25,23,1,22600.00,600.00,31,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(26,24,1,123590.00,2450.00,34,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(27,25,1,22950.00,50.00,35,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(28,26,1,69500.00,0.00,36,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(29,27,1,12500.00,0.00,37,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(30,28,1,12500.00,1500.00,38,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(31,29,1,159500.00,0.00,39,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(32,30,1,165000.00,5000.00,40,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(33,31,1,2550.00,50.00,41,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(34,32,1,29500.00,0.00,42,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(35,33,1,12650.00,500.00,43,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(36,34,1,56950.00,0.00,44,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(37,35,1,56000.00,0.00,45,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(38,36,1,65890.00,750.00,46,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(39,36,2,6000.00,0.00,47,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(40,37,1,39500.00,2450.00,50,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(41,38,1,3650.00,0.00,51,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(42,39,1,220500.00,0.00,52,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(43,40,1,102950.00,2450.00,53,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(44,41,1,17500.00,0.00,54,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(45,42,1,8800.00,500.00,24,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(46,43,1,99500.00,500.00,55,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(47,44,1,17500.00,500.00,56,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(48,45,1,12500.00,0.00,57,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(49,46,1,9950.00,0.00,58,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(50,46,2,39500.00,2450.00,59,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(51,47,1,49580.00,0.00,60,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(52,48,1,5500.00,0.00,61,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(53,49,1,22150.00,500.00,62,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(54,50,1,35000.00,0.00,64,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(55,51,1,29650.00,0.00,65,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(56,51,2,45500.00,0.00,66,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(57,51,3,99500.00,750.00,68,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(58,52,1,15650.00,0.00,69,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(59,53,1,12500.00,750.00,71,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(60,54,1,195000.00,0.00,72,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(61,55,1,205000.00,0.00,73,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(62,56,1,66500.00,0.00,74,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(63,57,1,19500.00,0.00,75,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(64,58,1,79500.00,500.00,76,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(65,59,1,14590.00,0.00,77,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(66,60,1,12750.00,0.00,78,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(67,61,1,45600.00,0.00,80,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(68,62,1,6500.00,500.00,81,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(69,63,1,102500.00,1500.00,82,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(70,64,1,99500.00,0.00,84,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(71,65,1,12500.00,750.00,85,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(72,66,1,61500.00,0.00,86,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(73,67,1,79500.00,2450.00,87,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(74,68,1,16500.00,0.00,88,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(75,68,2,33600.00,0.00,89,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(76,69,1,66500.00,750.00,90,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(77,70,1,45000.00,0.00,92,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(78,71,1,19500.00,0.00,93,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(79,72,1,76500.00,0.00,94,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(80,73,1,45900.00,500.00,95,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(81,74,1,125000.00,1500.00,96,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(82,75,1,65500.00,0.00,97,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(83,76,1,92150.00,0.00,98,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(84,77,1,9500.00,0.00,99,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(85,78,1,9950.00,0.00,100,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(86,79,1,5680.00,500.00,101,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(87,80,1,19500.00,0.00,102,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(88,81,1,3500.00,0.00,103,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(89,82,1,3950.00,0.00,104,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(90,83,1,20950.00,750.00,105,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(91,84,1,7500.00,75.00,106,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(92,85,1,56500.00,1500.00,107,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(93,86,1,49500.00,750.00,108,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(94,87,1,68900.00,0.00,109,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(95,88,1,55000.00,0.00,110,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(96,89,1,3575.00,0.00,111,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(97,90,1,35250.00,0.00,112,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(98,91,1,19600.00,1250.00,113,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(99,91,2,27890.00,0.00,114,1,'2023-12-08 05:04:00','2023-12-08 05:04:00',NULL,1,'Row was inserted',NULL,'N'),(100,92,1,45950.00,0.00,115,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(101,93,1,9950.00,0.00,116,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(102,94,1,6550.00,750.00,117,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(103,94,2,156500.00,0.00,27,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(104,95,1,76500.00,1500.00,119,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(105,96,1,119600.00,0.00,121,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(106,97,1,85650.00,2450.00,122,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(107,97,2,9950.00,0.00,124,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(108,98,1,12500.00,0.00,125,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(109,99,1,12500.00,750.00,126,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(110,100,1,56890.00,2450.00,127,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(111,101,1,55000.00,2450.00,128,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(112,102,1,9990.00,0.00,129,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(113,102,2,46500.00,0.00,130,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(114,102,3,9500.00,0.00,131,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(115,102,4,125500.00,0.00,132,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(116,103,1,99500.00,5000.00,133,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(117,104,1,60500.00,0.00,134,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(118,105,1,123500.00,5000.00,135,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(119,106,1,25000.00,0.00,136,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(120,107,1,169500.00,0.00,137,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(121,108,1,99500.00,0.00,138,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(122,109,1,39500.00,0.00,139,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(123,110,1,22500.00,0.00,140,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(124,111,1,125000.00,0.00,141,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(125,112,1,85000.00,0.00,142,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(126,113,1,1250.00,0.00,143,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(127,114,1,22500.00,0.00,144,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(128,115,1,125950.00,12500.00,146,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(129,116,1,8850.00,0.00,148,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(130,117,1,9950.00,0.00,149,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(131,118,1,56500.00,2450.00,151,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(132,119,1,55000.00,0.00,152,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(133,120,1,56950.00,750.00,154,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(134,121,1,365000.00,0.00,155,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(135,122,1,395000.00,0.00,157,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(136,123,1,21500.00,0.00,158,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(137,124,1,6500.00,0.00,159,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(138,125,1,12500.00,750.00,118,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(139,126,1,2250.00,0.00,160,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(140,127,1,3500.00,0.00,161,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(141,128,1,5680.00,750.00,162,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(142,129,1,8550.00,0.00,163,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(143,130,1,156500.00,10000.00,164,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(144,131,1,56500.00,0.00,165,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(145,132,1,86500.00,1250.00,166,1,'2023-12-08 05:04:02','2023-12-08 05:04:02',NULL,1,'Row was inserted',NULL,'N'),(146,133,1,66500.00,0.00,167,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(147,134,1,55600.00,0.00,168,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(148,135,1,305000.00,0.00,169,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(149,136,1,45000.00,0.00,14,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(150,137,1,225000.00,0.00,79,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(151,138,1,42950.00,0.00,172,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(152,139,1,990.00,0.00,173,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(153,140,1,29500.00,1500.00,174,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(154,141,1,139500.00,0.00,175,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(155,142,1,295000.00,0.00,176,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(156,143,1,220500.00,0.00,177,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(157,144,1,79500.00,1500.00,178,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(158,145,1,162500.00,0.00,180,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(159,146,1,79500.00,0.00,181,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(160,147,1,65890.00,0.00,183,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(161,148,1,61500.00,0.00,184,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(162,149,1,12500.00,0.00,185,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(163,150,1,255000.00,0.00,186,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(164,151,1,255950.00,500.00,187,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(165,152,1,250000.00,2450.00,188,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(166,153,1,6500.00,0.00,189,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(167,154,1,9250.00,0.00,190,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(168,155,1,950.00,0.00,191,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(169,156,1,295000.00,0.00,192,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(170,157,1,99500.00,0.00,193,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(171,158,1,33500.00,750.00,194,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(172,159,1,45000.00,2450.00,195,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(173,160,1,36500.00,0.00,196,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(174,160,2,77500.00,0.00,197,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(175,161,1,2350.00,0.00,198,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(176,162,1,32500.00,500.00,199,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(177,163,1,45000.00,1500.00,200,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(178,164,1,8500.00,0.00,202,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(179,165,1,99500.00,0.00,204,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(180,166,1,25000.00,0.00,205,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(181,167,1,19500.00,0.00,206,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(182,168,1,12950.00,750.00,207,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(183,169,1,5650.00,0.00,208,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(184,170,1,29500.00,1500.00,209,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(185,171,1,3950.00,750.00,211,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(186,171,2,29500.00,750.00,212,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(187,171,3,12500.00,0.00,213,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(188,172,1,99950.00,0.00,214,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(189,173,1,335000.00,1250.00,215,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(190,174,1,56500.00,0.00,216,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(191,175,1,99500.00,0.00,217,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(192,176,1,135000.00,1500.00,218,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(193,177,1,89500.00,0.00,219,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(194,178,1,165000.00,0.00,220,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(195,179,1,22600.00,500.00,221,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(196,180,1,32675.00,0.00,222,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(197,181,1,45000.00,0.00,223,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(198,182,1,5500.00,0.00,224,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(199,183,1,55000.00,2450.00,225,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(200,184,1,49500.00,0.00,226,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(201,185,1,250000.00,0.00,227,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(202,186,1,155000.00,500.00,228,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(203,187,1,15750.00,0.00,229,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(204,188,1,19500.00,0.00,230,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(205,189,1,235000.00,750.00,231,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(206,190,1,25000.00,1500.00,232,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(207,191,1,245000.00,0.00,233,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(208,192,1,39500.00,0.00,234,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(209,192,2,49500.00,0.00,70,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(210,193,1,23500.00,0.00,236,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(211,193,2,10500.00,0.00,237,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(212,194,1,11500.00,750.00,238,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(213,194,2,51200.00,0.00,240,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(214,195,1,45950.00,0.00,241,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(215,196,1,21600.00,0.00,242,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(216,197,1,25000.00,1250.00,244,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(217,198,1,23600.00,0.00,245,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(218,199,1,99950.00,0.00,247,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(219,200,1,46900.00,0.00,248,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(220,201,1,45950.00,0.00,249,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(221,202,1,7550.00,0.00,250,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(222,203,1,11990.00,900.00,251,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(223,204,1,12500.00,0.00,252,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(224,205,1,7500.00,0.00,253,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(225,206,1,56850.00,0.00,254,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(226,207,1,62500.00,1250.00,257,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(227,208,1,42500.00,0.00,258,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(228,209,1,65450.00,1250.00,259,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(229,210,1,56950.00,0.00,256,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(230,211,1,1950.00,0.00,260,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(231,212,1,1150.00,0.00,261,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(232,213,1,11550.00,0.00,262,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(233,214,1,12570.00,500.00,263,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(234,215,1,9890.00,0.00,264,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(235,216,1,56950.00,0.00,265,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(236,217,1,45950.00,0.00,266,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(237,218,1,950.00,25.00,267,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(238,219,1,21550.00,1250.00,268,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(239,220,1,5950.00,0.00,269,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(240,221,1,365000.00,0.00,270,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(241,222,1,120000.00,0.00,271,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(242,223,1,17850.00,750.00,272,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(243,223,2,103650.00,0.00,273,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(244,224,1,182500.00,17500.00,274,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(245,225,1,22500.00,0.00,275,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(246,226,1,21500.00,0.00,276,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(247,227,1,189500.00,1500.00,120,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(248,228,1,55450.00,1500.00,29,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(249,229,1,98950.00,0.00,280,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(250,230,1,355000.00,0.00,281,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(251,231,1,6000.00,0.00,282,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(252,232,1,5690.00,750.00,283,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(253,233,1,56900.00,500.00,284,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(254,234,1,145000.00,0.00,285,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(255,234,2,99500.00,0.00,286,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(256,234,3,123500.00,750.00,287,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(257,235,1,310000.00,0.00,288,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(258,236,1,9800.00,35.00,289,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(259,237,1,15950.00,0.00,290,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(260,238,1,255000.00,0.00,291,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(261,238,2,12950.00,0.00,293,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(262,239,1,155000.00,0.00,294,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(263,240,1,2500.00,0.00,295,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(264,241,1,9950.00,0.00,239,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(265,242,1,39500.00,2450.00,297,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(266,243,1,23500.00,0.00,298,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(267,244,1,45950.00,0.00,299,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(268,245,1,55000.00,750.00,300,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(269,246,1,100000.00,0.00,301,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(270,247,1,44885.00,0.00,302,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(271,248,1,61500.00,0.00,303,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(272,249,1,950.00,0.00,304,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(273,250,1,195000.00,0.00,307,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(274,251,1,52500.00,1575.00,308,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(275,252,1,1350.00,0.00,309,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(276,253,1,2495.00,45.00,310,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(277,254,1,269500.00,0.00,311,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(278,255,1,195000.00,0.00,312,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(279,256,1,25950.00,1250.00,313,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(280,257,1,9990.00,0.00,314,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(281,258,1,135000.00,0.00,315,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(282,259,1,1250.00,0.00,201,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(283,260,1,6590.00,750.00,203,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(284,261,1,89500.00,0.00,317,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(285,262,1,18500.00,0.00,318,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(286,263,1,3575.00,750.00,320,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(287,264,1,6950.00,0.00,321,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(288,265,1,26500.00,0.00,323,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(289,266,1,33500.00,0.00,324,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(290,267,1,24500.00,0.00,325,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(291,268,1,99500.00,500.00,327,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(292,269,1,99990.00,0.00,328,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(293,270,1,6950.00,1250.00,329,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(294,271,1,10500.00,1500.00,330,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(295,272,1,33450.00,0.00,331,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(296,273,1,72500.00,0.00,332,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(297,274,1,2400.00,0.00,333,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(298,275,1,68500.00,2450.00,334,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(299,276,1,2350.00,0.00,335,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(300,277,1,18500.00,1950.00,336,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(301,278,1,5500.00,0.00,337,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(302,279,1,128500.00,12500.00,338,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(303,280,1,55000.00,0.00,339,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(304,281,1,1250.00,0.00,340,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(305,282,1,345000.00,0.00,341,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(306,283,1,82590.00,0.00,344,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(307,284,1,113590.00,0.00,345,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(308,285,1,45000.00,1250.00,346,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(309,286,1,57600.00,0.00,347,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(310,287,1,102500.00,0.00,348,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(311,288,1,39500.00,0.00,349,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(312,289,1,61550.00,0.00,350,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(313,290,1,55000.00,0.00,351,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(314,291,1,99500.00,1250.00,352,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(315,292,1,56800.00,750.00,353,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(316,293,1,89500.00,0.00,354,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(317,294,1,72500.00,0.00,355,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(318,295,1,56950.00,0.00,356,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(319,296,1,62500.00,0.00,357,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(320,297,1,56890.00,0.00,358,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(321,298,1,33600.00,0.00,359,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(322,299,1,30500.00,2450.00,360,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(323,300,1,25000.00,0.00,361,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(324,300,2,25500.00,0.00,362,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(325,301,1,39500.00,0.00,363,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(326,302,1,12500.00,0.00,364,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(327,303,1,1150.00,1500.00,365,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(328,303,2,1950.00,0.00,366,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(329,303,3,2500.00,0.00,367,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(330,304,1,69500.00,0.00,368,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(331,305,1,45000.00,0.00,369,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(332,306,1,56990.00,0.00,370,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(333,307,1,86500.00,2450.00,374,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(334,308,1,17850.00,1250.00,375,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(335,309,1,25950.00,0.00,376,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(336,310,1,29500.00,0.00,377,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(337,311,1,59000.00,4500.00,378,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(338,312,1,9500.00,0.00,380,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(339,313,1,8900.00,0.00,382,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(340,314,1,11590.00,0.00,383,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(341,315,1,8500.00,0.00,384,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(342,316,1,59500.00,0.00,385,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(343,317,1,123500.00,3500.00,386,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(344,318,1,99500.00,0.00,387,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(345,319,1,54500.00,0.00,388,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(346,319,2,1590.00,0.00,389,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(347,320,1,11500.00,0.00,390,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(348,321,1,17950.00,1500.00,391,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(349,322,1,5500.00,0.00,392,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(350,323,1,950.00,0.00,393,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N'),(351,324,1,145000.00,5000.00,394,1,'2023-12-08 05:04:01','2023-12-08 05:04:01',NULL,1,'Row was inserted',NULL,'N');
/*!40000 ALTER TABLE `Sales.SalesOrderVehicleDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Sales.SalesText`
--

DROP TABLE IF EXISTS `Sales.SalesText`;
/*!50001 DROP VIEW IF EXISTS `Sales.SalesText`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Sales.SalesText` AS SELECT 
 1 AS `CountryName`,
 1 AS `MakeName`,
 1 AS `Cost`,
 1 AS `SalePrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Sales.YearlySales`
--

DROP TABLE IF EXISTS `Sales.YearlySales`;
/*!50001 DROP VIEW IF EXISTS `Sales.YearlySales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Sales.YearlySales` AS SELECT 
 1 AS `SalesYear`,
 1 AS `MakeName`,
 1 AS `ModelName`,
 1 AS `CustomerName`,
 1 AS `CountryName`,
 1 AS `SalePrice`,
 1 AS `SaleDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Sales_PivotTable`
--

DROP TABLE IF EXISTS `Sales_PivotTable`;
/*!50001 DROP VIEW IF EXISTS `Sales_PivotTable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Sales_PivotTable` AS SELECT 
 1 AS `VehicleColor`,
 1 AS `CY2015`,
 1 AS `CY2016`,
 1 AS `CY2017`,
 1 AS `CY2018`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Sales_StockPrices`
--

DROP TABLE IF EXISTS `Sales_StockPrices`;
/*!50001 DROP VIEW IF EXISTS `Sales_StockPrices`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Sales_StockPrices` AS SELECT 
 1 AS `MakeName`,
 1 AS `ModelName`,
 1 AS `RetailCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Sales_uvw_Sales2018`
--

DROP TABLE IF EXISTS `Sales_uvw_Sales2018`;
/*!50001 DROP VIEW IF EXISTS `Sales_uvw_Sales2018`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Sales_uvw_Sales2018` AS SELECT 
 1 AS `SalesYear`,
 1 AS `MakeName`,
 1 AS `ModelName`,
 1 AS `CustomerName`,
 1 AS `CountryName`,
 1 AS `Cost`,
 1 AS `RepairCost`,
 1 AS `PartsCost`,
 1 AS `TransportInCost`,
 1 AS `SalePrice`,
 1 AS `SaleDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Sales_uvw_SalesByCountry`
--

DROP TABLE IF EXISTS `Sales_uvw_SalesByCountry`;
/*!50001 DROP VIEW IF EXISTS `Sales_uvw_SalesByCountry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Sales_uvw_SalesByCountry` AS SELECT 
 1 AS `CountryName`,
 1 AS `MakeName`,
 1 AS `ModelName`,
 1 AS `Color`,
 1 AS `SalePrice`,
 1 AS `LineItemDiscount`,
 1 AS `InvoiceNumber`,
 1 AS `SaleDate`,
 1 AS `CustomerName`,
 1 AS `SalesDetailsID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Utils.CommonColumnsForTriggerTemplate`
--

DROP TABLE IF EXISTS `Utils.CommonColumnsForTriggerTemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Utils.CommonColumnsForTriggerTemplate` (
  `RowLevelHashKey` blob COMMENT 'Current row hash key representing all combined columns',
  `Note` varchar(100) DEFAULT NULL COMMENT 'A note regarding the database transaction',
  `IsDeleted` char(1) NOT NULL COMMENT 'Flag used to check if an entry has been deleted',
  `TransactionNumber` int NOT NULL COMMENT 'The transaction number in a series of database transactions',
  `UserAuthenticatedKey` int NOT NULL COMMENT 'The user authenticated key',
  `SysStartTime` datetime NOT NULL COMMENT 'The start time for a system transaction',
  `SysEndTime` datetime NOT NULL COMMENT 'The end time for a system transaction'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Common columns for Trigger Audit Tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utils.CommonColumnsForTriggerTemplate`
--

LOCK TABLES `Utils.CommonColumnsForTriggerTemplate` WRITE;
/*!40000 ALTER TABLE `Utils.CommonColumnsForTriggerTemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `Utils.CommonColumnsForTriggerTemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Group3-EuropeanCarManufacturer'
--

--
-- Final view structure for view `CustomViews.uvw_ChuanCustomerCountry`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanCustomerCountry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_ChuanCustomerCountry` AS select `SC`.`CustomerName` AS `CustomerName`,`LC`.`CountryName` AS `CountryName` from (`Sales.Customer` `SC` join `Locale.Country` `LC` on((`LC`.`CountryId` = `SC`.`CountryId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_ChuanMakeCountry`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanMakeCountry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_ChuanMakeCountry` AS select `LC`.`CountryName` AS `Country`,`PMVM`.`ManufacturerVehicleMakeName` AS `Make` from (`Production.ManufacturerVehicleMake` `PMVM` join `Locale.Country` `LC` on((`PMVM`.`CountryId` = `LC`.`CountryId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_ChuanModelMake`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanModelMake`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_ChuanModelMake` AS select `PMM`.`ManufacturerModelName` AS `Model`,`PMVM`.`ManufacturerVehicleMakeName` AS `Make` from (`Production.ManufacturerModel` `PMM` join `Production.ManufacturerVehicleMake` `PMVM` on((`PMM`.`ManufacturerVehicleMakeId` = `PMVM`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_ChuanStaffDiscountGiven`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanStaffDiscountGiven`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_ChuanStaffDiscountGiven` AS select `HRS`.`StaffName` AS `StaffName`,sum(`SSOVD`.`LineItemDiscount`) AS `DiscountGiven` from ((`HumanResources.Staff` `HRS` join `Sales.SalesOrderVehicle` `SSOV` on((`HRS`.`StaffId` = `SSOV`.`StaffId`))) join `Sales.SalesOrderVehicleDetail` `SSOVD` on((`SSOV`.`SalesOrderVehicleId` = `SSOVD`.`SalesOrderVehicleId`))) group by `HRS`.`StaffName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_ChuanStaffSales`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_ChuanStaffSales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_ChuanStaffSales` AS select `HRS`.`StaffName` AS `StaffName`,sum(`SSOV`.`TotalSalePrice`) AS `TotalSales` from (`HumanResources.Staff` `HRS` join `Sales.SalesOrderVehicle` `SSOV` on((`HRS`.`StaffId` = `SSOV`.`StaffId`))) group by `HRS`.`StaffName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_JimmyCustomerMakeModel`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_JimmyCustomerMakeModel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_JimmyCustomerMakeModel` AS select `Sales.Customer`.`CustomerName` AS `CustName`,`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `Model` from ((`Production.ManufacturerVehicleMake` join `Sales.Customer` on((`Production.ManufacturerVehicleMake`.`TransactionNumber` = `Sales.Customer`.`TransactionNumber`))) join `Production.ManufacturerModel` on((`Sales.Customer`.`TransactionNumber` = `Production.ManufacturerModel`.`TransactionNumber`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail` AS select `Sales.Customer`.`CustomerName` AS `CustName`,`Sales.SalesOrderVehicle`.`TotalSalePrice` AS `TotalSale`,`Sales.SalesOrderVehicleDetail`.`SalePrice` AS `SalePrice` from ((`Sales.Customer` join `Sales.SalesOrderVehicle` on((`Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`))) join `Sales.SalesOrderVehicleDetail` on((`Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_JimmyModelCountry`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_JimmyModelCountry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_JimmyModelCountry` AS select `Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,`Locale.Country`.`CountryName` AS `CountryName` from (`Locale.Country` join `Production.ManufacturerModel` on((`Locale.Country`.`TransactionNumber` = `Production.ManufacturerModel`.`TransactionNumber`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_MehrshadVehicleCost`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_MehrshadVehicleCost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_MehrshadVehicleCost` AS select `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `ManufacturerVehicleMakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `ManufacturerModelName`,`Production.ManufacturerVehicleStock`.`Cost` AS `Cost` from ((((`Sales.SalesOrderVehicleDetail` join `Sales.SalesOrderVehicle` on((`Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicle`.`SalesOrderVehicleId`))) join `Sales.Customer` on((`Sales.SalesOrderVehicle`.`CustomerId` = `Sales.Customer`.`CustomerId`))) join `Production.ManufacturerVehicleStock` on((`Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`))) join (`Production.ManufacturerModel` join `Production.ManufacturerVehicleMake` on((`Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`))) on((`Production.ManufacturerVehicleStock`.`ModelId` = `Production.ManufacturerModel`.`ManufacturerModelId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_MehrshadYearlyCustomerSales`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_MehrshadYearlyCustomerSales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_MehrshadYearlyCustomerSales` AS select `Sales.SalesOrderVehicle`.`SaleDate` AS `SaleDate`,`Sales.Customer`.`CustomerName` AS `CustomerName`,`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `ManufacturerVehicleMakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `ManufacturerModelName`,`Sales.SalesOrderVehicleDetail`.`SalePrice` AS `SalePrice` from ((((`Sales.SalesOrderVehicleDetail` join `Sales.SalesOrderVehicle` on((`Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicle`.`SalesOrderVehicleId`))) join `Sales.Customer` on((`Sales.SalesOrderVehicle`.`CustomerId` = `Sales.Customer`.`CustomerId`))) join `Production.ManufacturerModel`) join `Production.ManufacturerVehicleMake` on((`Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_MehrshadYearlySalesProfits`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_MehrshadYearlySalesProfits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_MehrshadYearlySalesProfits` AS select year(`Sales.SalesOrderVehicle`.`SaleDate`) AS `SalesYear`,`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,`Sales.Customer`.`CustomerName` AS `CustomerName`,`Production.ManufacturerVehicleStock`.`Cost` AS `Cost`,`Production.ManufacturerVehicleStock`.`RepairsCharge` AS `RepairsCharge`,`Production.ManufacturerVehicleStock`.`PartsCharge` AS `PartsCost`,`Production.ManufacturerVehicleStock`.`DeliveryCharge` AS `TransportInCost`,`Sales.SalesOrderVehicleDetail`.`SalePrice` AS `SalePrice`,`Sales.SalesOrderVehicle`.`SaleDate` AS `SaleDate`,((((`Sales.SalesOrderVehicleDetail`.`SalePrice` - `Production.ManufacturerVehicleStock`.`Cost`) - `Production.ManufacturerVehicleStock`.`RepairsCharge`) - `Production.ManufacturerVehicleStock`.`PartsCharge`) - `Production.ManufacturerVehicleStock`.`DeliveryCharge`) AS `Profit` from (((((`Sales.Customer` join `Sales.SalesOrderVehicle` on((`Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`))) join `Sales.SalesOrderVehicleDetail` on((`Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`))) join `Production.ManufacturerVehicleStock` on((`Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`))) join `Production.ManufacturerModel` on((`Production.ManufacturerModel`.`ManufacturerModelId` = `Production.ManufacturerVehicleStock`.`ModelId`))) join `Production.ManufacturerVehicleMake` on((`Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_RalphEmployeeManager`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RalphEmployeeManager`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_RalphEmployeeManager` AS select `emp`.`StaffName` AS `Employee Name`,`emp`.`Department` AS `Employee Department`,`mgr`.`StaffName` AS `Manager Name`,`mgr`.`Department` AS `Manager Department` from (`HumanResources.Staff` `emp` join `HumanResources.Staff` `mgr` on((`emp`.`ManagerId` = `mgr`.`StaffId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_RalphMakeModelPartsCost`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RalphMakeModelPartsCost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_RalphMakeModelPartsCost` AS select `mvm`.`ManufacturerVehicleMakeName` AS `Make`,`mm`.`ManufacturerModelName` AS `Model`,`mvs`.`PartsCharge` AS `Parts Cost` from ((`Production.ManufacturerVehicleStock` `mvs` join `Production.ManufacturerModel` `mm` on((`mm`.`ManufacturerModelId` = `mvs`.`ModelId`))) join `Production.ManufacturerVehicleMake` `mvm` on((`mm`.`ManufacturerVehicleMakeId` = `mvm`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_RyanCustomerCountryDate`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RyanCustomerCountryDate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_RyanCustomerCountryDate` AS select `C`.`CustomerName` AS `CustomerName`,`CO`.`CountryName` AS `CountryName`,min(`CO`.`SysStartTime`) AS `StartTime`,max(`CO`.`SysEndTime`) AS `EndTime` from (`Sales.Customer` `C` join `Locale.Country` `CO` on((`C`.`CountryId` = `CO`.`CountryId`))) group by `C`.`CustomerName`,`CO`.`CountryName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_RyanCustomerLatestTotalSaleDate`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RyanCustomerLatestTotalSaleDate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_RyanCustomerLatestTotalSaleDate` AS select `C`.`CustomerName` AS `CustomerName`,sum(`SOV`.`TotalSalePrice`) AS `TotalSalePrice`,max(`SOV`.`SaleDate`) AS `LatestSaleDate` from (`Sales.Customer` `C` join `Sales.SalesOrderVehicle` `SOV` on((`C`.`CustomerId` = `SOV`.`CustomerId`))) group by `C`.`CustomerName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomViews.uvw_RyanGroupSpendCapacity`
--

/*!50001 DROP VIEW IF EXISTS `CustomViews.uvw_RyanGroupSpendCapacity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomViews.uvw_RyanGroupSpendCapacity` AS select `G`.`GroupName` AS `GroupName`,sum(cast(`C`.`SpendCapacity` as float)) AS `TotalSpendCapacity` from (`DbSecurity.UserAuthorization` `G` join `Sales.Customer` `C` on((`C`.`UserAuthorizationId` = `G`.`UserAuthorizationId`))) group by `G`.`GroupName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sales.SalesText`
--

/*!50001 DROP VIEW IF EXISTS `Sales.SalesText`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Sales.SalesText` AS select `co`.`CountryName` AS `CountryName`,`mvm`.`ManufacturerVehicleMakeName` AS `MakeName`,`mvs`.`Cost` AS `Cost`,`sv`.`TotalSalePrice` AS `SalePrice` from ((((((`Sales.SalesOrderVehicle` `sv` join `Sales.SalesOrderVehicleDetail` `svd` on((`svd`.`SalesOrderVehicleId` = `sv`.`SalesOrderVehicleId`))) join `Production.ManufacturerVehicleStock` `mvs` on((`svd`.`ManufacturerVehicleStockId` = `mvs`.`ManufacturerVehicleStockId`))) join `Production.ManufacturerModel` `mm` on((`mvs`.`ModelId` = `mm`.`ManufacturerModelId`))) join `Production.ManufacturerVehicleMake` `mvm` on((`mvm`.`ManufacturerVehicleMakeId` = `mm`.`ManufacturerVehicleMakeId`))) join `Sales.Customer` `c` on((`sv`.`CustomerId` = `c`.`CustomerId`))) join `Locale.Country` `co` on((`c`.`CountryId` = `co`.`CountryId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sales.YearlySales`
--

/*!50001 DROP VIEW IF EXISTS `Sales.YearlySales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Sales.YearlySales` AS select year(`Sales.SalesOrderVehicle`.`SaleDate`) AS `SalesYear`,`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,`Sales.Customer`.`CustomerName` AS `CustomerName`,`Locale.Country`.`CountryName` AS `CountryName`,cast(`Sales.SalesOrderVehicleDetail`.`SalePrice` as unsigned) AS `SalePrice`,date_format(`Sales.SalesOrderVehicle`.`SaleDate`,'%m/%d/%Y') AS `SaleDate` from ((((((`Sales.Customer` join `Sales.SalesOrderVehicle` on((`Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`))) join `Locale.Country` on((`Sales.Customer`.`CountryId` = `Locale.Country`.`CountryId`))) join `Sales.SalesOrderVehicleDetail` on((`Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`))) join `Production.ManufacturerVehicleStock` on((`Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`))) join `Production.ManufacturerModel` on((`Production.ManufacturerModel`.`ManufacturerModelId` = `Production.ManufacturerVehicleStock`.`ModelId`))) join `Production.ManufacturerVehicleMake` on((`Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sales_PivotTable`
--

/*!50001 DROP VIEW IF EXISTS `Sales_PivotTable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Sales_PivotTable` AS select `Production.ManufacturerVehicleStock`.`VehicleColor` AS `VehicleColor`,cast(sum((case when (year(`Sales.SalesOrderVehicle`.`SaleDate`) = 2015) then `Sales.SalesOrderVehicle`.`TotalSalePrice` else 0 end)) as unsigned) AS `CY2015`,cast(sum((case when (year(`Sales.SalesOrderVehicle`.`SaleDate`) = 2016) then `Sales.SalesOrderVehicle`.`TotalSalePrice` else 0 end)) as unsigned) AS `CY2016`,cast(sum((case when (year(`Sales.SalesOrderVehicle`.`SaleDate`) = 2017) then `Sales.SalesOrderVehicle`.`TotalSalePrice` else 0 end)) as unsigned) AS `CY2017`,cast(sum((case when (year(`Sales.SalesOrderVehicle`.`SaleDate`) = 2018) then `Sales.SalesOrderVehicle`.`TotalSalePrice` else 0 end)) as unsigned) AS `CY2018` from ((`Sales.SalesOrderVehicle` join `Sales.SalesOrderVehicleDetail` on((`Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`))) join `Production.ManufacturerVehicleStock` on((`Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`))) group by `Production.ManufacturerVehicleStock`.`VehicleColor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sales_StockPrices`
--

/*!50001 DROP VIEW IF EXISTS `Sales_StockPrices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Sales_StockPrices` AS select `mvsmm`.`ManufacturerVehicleMakeName` AS `MakeName`,`mm`.`ManufacturerModelName` AS `ModelName`,format(`mvs`.`Cost`,'$#,0.00') AS `RetailCost` from ((`Production.ManufacturerVehicleStock` `mvs` join `Production.ManufacturerModel` `mm` on((`mvs`.`ModelId` = `mm`.`ManufacturerModelId`))) join `Production.ManufacturerVehicleMake` `mvsmm` on((`mm`.`ManufacturerVehicleMakeId` = `mvsmm`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sales_uvw_Sales2018`
--

/*!50001 DROP VIEW IF EXISTS `Sales_uvw_Sales2018`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Sales_uvw_Sales2018` AS select year(`Sales.SalesOrderVehicle`.`SaleDate`) AS `SalesYear`,`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,`Sales.Customer`.`CustomerName` AS `CustomerName`,`Locale.Country`.`CountryName` AS `CountryName`,`Production.ManufacturerVehicleStock`.`Cost` AS `Cost`,`Production.ManufacturerVehicleStock`.`RepairsCharge` AS `RepairCost`,`Production.ManufacturerVehicleStock`.`PartsCharge` AS `PartsCost`,`Production.ManufacturerVehicleStock`.`DeliveryCharge` AS `TransportInCost`,cast(`Sales.SalesOrderVehicleDetail`.`SalePrice` as unsigned) AS `SalePrice`,date_format(`Sales.SalesOrderVehicle`.`SaleDate`,'%m/%d/%Y') AS `SaleDate` from ((((((`Sales.Customer` join `Sales.SalesOrderVehicle` on((`Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`))) join `Locale.Country` on((`Sales.Customer`.`CountryId` = `Locale.Country`.`CountryId`))) join `Sales.SalesOrderVehicleDetail` on((`Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`))) join `Production.ManufacturerVehicleStock` on((`Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`))) join `Production.ManufacturerModel` on((`Production.ManufacturerModel`.`ManufacturerModelId` = `Production.ManufacturerVehicleStock`.`ModelId`))) join `Production.ManufacturerVehicleMake` on((`Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`))) where (year(`Sales.SalesOrderVehicle`.`SaleDate`) = 2018) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Sales_uvw_SalesByCountry`
--

/*!50001 DROP VIEW IF EXISTS `Sales_uvw_SalesByCountry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Sales_uvw_SalesByCountry` AS select `Locale.Country`.`CountryName` AS `CountryName`,`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,`Production.ManufacturerVehicleStock`.`VehicleColor` AS `Color`,cast(`Sales.SalesOrderVehicleDetail`.`SalePrice` as unsigned) AS `SalePrice`,cast(`Sales.SalesOrderVehicleDetail`.`LineItemDiscount` as unsigned) AS `LineItemDiscount`,`Sales.SalesOrderVehicle`.`InvoiceNumber` AS `InvoiceNumber`,date_format(`Sales.SalesOrderVehicle`.`SaleDate`,'%m/%d/%Y') AS `SaleDate`,`Sales.Customer`.`CustomerName` AS `CustomerName`,`Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleDetailId` AS `SalesDetailsID` from ((((((`Sales.SalesOrderVehicle` join `Sales.Customer` on((`Sales.SalesOrderVehicle`.`CustomerId` = `Sales.Customer`.`CustomerId`))) join `Locale.Country` on((`Sales.Customer`.`CountryId` = `Locale.Country`.`CountryId`))) join `Sales.SalesOrderVehicleDetail` on((`Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`))) join `Production.ManufacturerVehicleStock` on((`Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`))) join `Production.ManufacturerModel` on((`Production.ManufacturerVehicleStock`.`ModelId` = `Production.ManufacturerModel`.`ManufacturerModelId`))) join `Production.ManufacturerVehicleMake` on((`Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08  9:38:19
