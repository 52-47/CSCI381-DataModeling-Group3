
CREATE TABLE IF NOT EXISTS `Audit.HumanResources.StaffHistory`
(
	`StaffId` INTEGER COMMENT 'A unique identifier for staff members' NOT NULL ,
	`StaffName` VARCHAR(60) COMMENT 'The full name of a staff member' NOT NULL ,
	`Department` VARCHAR(15) COMMENT 'The department name a staff member works in' NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`ManagerId` INTEGER COMMENT 'The ID of a staff member that supervises an employee' NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`StaffHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.HumanResources.StaffHistory' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	 CONSTRAINT XPKStaffHistory PRIMARY KEY  ( `StaffHistoryId` ASC )
)
COMMENT = 'The audit history table for Staff';


ALTER TABLE `Audit.HumanResources.StaffHistory`
ADD CONSTRAINT `CK_Audit_HumanResourcesStaffHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Locale.CountryHistory`
(
	`CountryId` INTEGER COMMENT 'A unique identifier for countries' NOT NULL ,
	`CountryISO3` CHAR(3) COMMENT 'The ISO3 format of a country' NOT NULL ,
	`CountryName` VARCHAR(50) COMMENT 'The name of the country' NOT NULL ,
	`CountryISO2` VARCHAR(2) COMMENT 'The ISO2 format of a country' NOT NULL ,
	`SalesRegion` VARCHAR(20) COMMENT 'The name of the sales region a coutry belongs to' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`LocaleCountryHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Locale.CountryHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	 CONSTRAINT PK_CountryHistory PRIMARY KEY  ( `LocaleCountryHistoryId` ASC )
)
COMMENT = 'The audit history table for Country';


ALTER TABLE `Audit.Locale.CountryHistory`
ADD CONSTRAINT `CK_Audit_LocaleCountryHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Production.ManufacturerModelHistory`
(
	`ManufacturerModelId` INTEGER COMMENT 'A unique identifier for vehicle models' NOT NULL ,
	`ManufacturerModelName` VARCHAR(35) COMMENT 'The name of a vehicle model' NOT NULL ,
	`ManufacturerModelVariant` VARCHAR(35) COMMENT 'The name of a vehicle model variant if applicable' NULL ,
	`ManufacturerVehicleMakeId` INTEGER COMMENT 'A unique identifier for vehicle makes' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`ProductionManufacturerModelHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Production.ManufacturerModelHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	 CONSTRAINT XPK_ModelHistory PRIMARY KEY  ( `ProductionManufacturerModelHistoryId` ASC )
)
COMMENT = 'The audit history table for ManufacturerModel';


ALTER TABLE `Audit.Production.ManufacturerModelHistory`
ADD CONSTRAINT `CK_ProductionManufacturerVehicleModelHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Production.ManufacturerVehicleMakeHistory`
(
	`ManufacturerVehicleMakeId` INTEGER COMMENT 'A unique identifier for vehicle makes' NOT NULL ,
	`ManufacturerVehicleMakeName` VARCHAR(30) COMMENT 'The name of a vehicles make' NOT NULL ,
	`CountryId` INTEGER COMMENT 'A unique identifier for countries' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`ProductionManufacturerVehicleMakeHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Production.ManufacturerVehicleMakeHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	`MarketingType` VARCHAR(25) COMMENT 'The marketing type of a vehicle make' NULL ,
	 CONSTRAINT XPK_MakeHistory PRIMARY KEY  ( `ProductionManufacturerVehicleMakeHistoryId` ASC )
)
COMMENT = 'The audit history table for ManufacturerVehicleMake';


ALTER TABLE `Audit.Production.ManufacturerVehicleMakeHistory`
ADD CONSTRAINT `CK_Audit_ProductionManufacturerVehicleHistory_AuditDateTimeStamp`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Production.ManufacturerVehicleStockHistory`
(
	`ManufacturerVehicleStockId` INTEGER COMMENT 'A unique identifier for manfacturer vehicle stock' NOT NULL ,
	`StockCode` VARCHAR(50) COMMENT 'The stock code of a vehicle' NOT NULL ,
	`Cost` DECIMAL(18,2) COMMENT 'The cost of a vehicle from the manufacturer' NOT NULL ,
	`RepairsCharge` DECIMAL(18,2) COMMENT 'The charge for repairs on a vehicle' NOT NULL ,
	`PartsCharge` DECIMAL(18,2) COMMENT 'The charge for parts on a vehicle' NOT NULL ,
	`DeliveryCharge` DECIMAL(18,2) COMMENT 'The charge for delivery of a vehicle' NOT NULL ,
	`IsPremiumRoadHandlingPackage` INTEGER COMMENT 'A flag to determine if a vehicle has a premium road handling package' NOT NULL ,
	`VehicleColor` VARCHAR(20) COMMENT 'The color of the vehicle' NOT NULL ,
	`CustomerComment` VARCHAR(200) COMMENT 'A comment added by a customer' NULL ,
	`ModelId` INTEGER COMMENT 'A unique identifier for vehicle models' NOT NULL ,
	`PurchaseDate` DATETIME COMMENT 'The date of purchase' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`ProductionManufacturerVehicleStockHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Production.ManufacturerVehicleStockHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	 CONSTRAINT XPK_StockHistory PRIMARY KEY  ( `ProductionManufacturerVehicleStockHistoryId` ASC )
)
COMMENT = 'The audit history table for ManufacturerVehicleStock';


ALTER TABLE `Audit.Production.ManufacturerVehicleStockHistory`
ADD CONSTRAINT `CK_ProductionManufacturerVehicleStockHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Sales.CustomerHistory`
(
	`CustomerId` INTEGER COMMENT 'A unique identifier for customers' NOT NULL ,
	`CustomerName` VARCHAR(65) COMMENT 'The full name of a customer' NOT NULL ,
	`CustomerAddress1` VARCHAR(60) COMMENT 'The street address of a customer' NOT NULL ,
	`CustomerAddress2` VARCHAR(60) COMMENT 'The extended street address of a customer' NULL ,
	`CustomerTown` VARCHAR(30) COMMENT 'The town or city a customer resides in' NOT NULL ,
	`CustomerPostalCode` VARCHAR(9) COMMENT 'The postal code of a customer if applicable' NULL ,
	`CountryId` INTEGER COMMENT 'A unique identifier for countries' NOT NULL ,
	`IsCustomerReseller` INTEGER COMMENT 'Flag to determine if a customer is a reseller' NOT NULL ,
	`IsCustomerCreditRisk` INTEGER COMMENT 'Flag to determine if customer is a credit risk' NOT NULL ,
	`SpendCapacity` VARCHAR(15) COMMENT 'The spend capacity of a customer' NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`SalesCustomerHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Sales.CustomerHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	 CONSTRAINT XPK_CustomerHistory PRIMARY KEY  ( `SalesCustomerHistoryId` ASC )
)
COMMENT = 'The audit history table for Customer';


ALTER TABLE `Audit.Sales.CustomerHistory`
ADD CONSTRAINT `CK_Audit_SalesSalesCustomerHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Sales.OrderVehicleDetailHistory`
(
	`SalesOrderVehicleDetailId` INTEGER COMMENT 'A unique identifier for Audit.Sales.OrderVehicleDetailHistory Ids' NOT NULL ,
	`SalesOrderVehicleId` INTEGER COMMENT 'A unique identifier for a purchase' NULL ,
	`LineItemNumber` INTEGER COMMENT 'The line item number on the invoice' NOT NULL ,
	`SalePrice` DECIMAL(18,2) COMMENT 'The sale price of a vehicle' NOT NULL ,
	`LineItemDiscount` DECIMAL(18,2) COMMENT 'The discount of the line item number' NOT NULL ,
	`ManufacturerVehicleStockId` INTEGER COMMENT 'A unique identifier for manfacturer vehicle stock' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`SalesSalesOrderVehicleDetailHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Sales.OrderVehicleDetailHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`DerivedDiscountedSalePrice` DECIMAL(18,2) COMMENT 'The derived discounted sale price of a vehicle' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	 CONSTRAINT XPK_SalesDetailsHistory PRIMARY KEY  ( `SalesSalesOrderVehicleDetailHistoryId` ASC )
)
COMMENT = 'The audit history table for SalesOrderVehicleDetail';


ALTER TABLE `Audit.Sales.OrderVehicleDetailHistory`
ADD CONSTRAINT `CK_SalesSalesOrderVehicleDetailHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `Audit.Sales.OrderVehicleHistory`
(
	`SalesOrderVehicleId` INTEGER COMMENT 'A unique identifier for a purchase' NOT NULL ,
	`CustomerId` INTEGER COMMENT 'A unique identifier for customers' NOT NULL ,
	`StaffId` INTEGER COMMENT 'A unique identifier for staff members' NOT NULL ,
	`InvoiceNumber` VARCHAR(8) COMMENT 'The invoice number of an order' NOT NULL ,
	`TotalSalePrice` DECIMAL(18,2) COMMENT 'The total sale price of an order' NOT NULL ,
	`SaleDate` DATETIME COMMENT 'The date an order was made' NOT NULL ,
	`UserAuthorizationId` INTEGER COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`SalesSalesOrderVehicleHistoryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for audit entries in Audit.Sales.OrderVehicleHistory' NOT NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1) COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`AuditDateTimeStamp` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'A timestamp to record audit transactions' NOT NULL ,
	`DBAction` CHAR(1) COMMENT 'Represents the type of action that took place in the database' NOT NULL ,
	`CategoryDescription` VARCHAR(20) COMMENT 'The category description a vehicle sales threshold' NOT NULL ,
	 CONSTRAINT XPKSalesOrderVehicleHistory PRIMARY KEY  ( `SalesSalesOrderVehicleHistoryId` ASC )
)
COMMENT = 'The audit history table for SalesOrderVehicle';


ALTER TABLE `Audit.Sales.OrderVehicleHistory`
ADD CONSTRAINT `CK_SalesSalesOrderVehicleHistory_DBAction`
CHECK ( `DBAction` = 'U' OR `DBAction` = 'I' OR `DBAction`= 'D' ) ;

CREATE TABLE IF NOT EXISTS `DbSecurity.UserAuthorization`
(
	`UserAuthorizationId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`ClassTime` CHAR(5)  DEFAULT '10:45' COMMENT 'The class time for CSCI381 Data Modeling' NULL ,
	`IndividualProject` VARCHAR(60)  DEFAULT 'CSCI381 Final Project' COMMENT 'The name of the individual project' NULL ,
	`GroupMemberLastName` VARCHAR(35) COMMENT 'The group members last name' NOT NULL ,
	`GroupMemberFirstName` VARCHAR(25) COMMENT 'The group members first name' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`GroupName` VARCHAR(20)  DEFAULT 'Group 3' COMMENT 'The name of the group' NOT NULL ,
	 CONSTRAINT XPKUser_Authorization PRIMARY KEY  ( `UserAuthorizationId` ASC )
)
COMMENT = 'The authorization of database actions by a user';


ALTER TABLE `DbSecurity.UserAuthorization`
ADD CONSTRAINT `CK_DbSecurity_UserAuthorization_ClassTime`
CHECK ( `ClassTime` REGEXP '^[0-1][0-9]:[0-5][0-9]$'
OR
`ClassTime` REGEXP '^[0-1][0-9]:[0-5][0-9]$' ) ;

ALTER TABLE `DbSecurity.UserAuthorization`
ADD CONSTRAINT `CK_DbSecurity_UserAuthorization_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `DbSecurity.UserAuthorization`
ADD CONSTRAINT `CK_DbSecurity_UserAuthorization_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

CREATE TABLE IF NOT EXISTS `Locale.Country`
(
	`CountryId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for countries' NOT NULL ,
	`CountryISO3` CHAR(3) COMMENT 'The ISO3 format of a country' NOT NULL ,
	`CountryName` VARCHAR(50) COMMENT 'The name of the country' NOT NULL ,
	`CountryISO2` VARCHAR(2) COMMENT 'The ISO2 format of a country' NOT NULL ,
	`SalesRegion` VARCHAR(20) COMMENT 'The name of the sales region a coutry belongs to' NOT NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	 CONSTRAINT PK_Country PRIMARY KEY  ( `CountryId` ASC ),
	CONSTRAINT `FK_Locale.Country_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'A country or territory in the world';


ALTER TABLE `Locale.Country`
ADD CONSTRAINT `CK_Locale_Country_CountryISO3`
CHECK ( `CountryISO3` REGEXP '^[A-Z][A-Z][A-Z]$' ) ;

ALTER TABLE `Locale.Country`
ADD CONSTRAINT `CK_Locale_Country_CountryISO2`
CHECK ( `CountryISO2` REGEXP '^[A-Z][A-Z]$' ) ;

ALTER TABLE `Locale.Country`
ADD CONSTRAINT `CK_Locale_Country_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Locale.Country`
ADD CONSTRAINT `CK_Locale_Country_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Locale.Country`
ADD CONSTRAINT `CK_Locale_Country_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Sales.Customer`
(
	`CustomerId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for customers' NOT NULL ,
	`CustomerName` VARCHAR(65) COMMENT 'The full name of a customer' NOT NULL ,
	`CustomerAddress1` VARCHAR(60) COMMENT 'The street address of a customer' NOT NULL ,
	`CustomerAddress2` VARCHAR(60) COMMENT 'The extended street address of a customer' NULL ,
	`CustomerTown` VARCHAR(30) COMMENT 'The town or city a customer resides in' NOT NULL ,
	`CustomerPostalCode` VARCHAR(9) COMMENT 'The postal code of a customer if applicable' NULL ,
	`CountryId` INTEGER COMMENT 'A unique identifier for countries' NOT NULL ,
	`IsCustomerReseller` INTEGER COMMENT 'Flag to determine if a customer is a reseller' NOT NULL ,
	`IsCustomerCreditRisk` INTEGER COMMENT 'Flag to determine if customer is a credit risk' NOT NULL ,
	`SpendCapacity` VARCHAR(15) COMMENT 'The spend capacity of a customer' NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	 CONSTRAINT PK_Customer PRIMARY KEY  ( `CustomerId` ASC ),
	CONSTRAINT `FK_Sales.Customer_Locale.Country` FOREIGN KEY (`CountryId`) REFERENCES `Locale.Country` (`CountryId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Sales.Customer_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'A person who purchases a vehicle from the business';


ALTER TABLE `Sales.Customer`
ADD CONSTRAINT `CK_Sales_Customer_IsCustomerReseller`
CHECK ( `IsCustomerReseller` = 0 OR `IsCustomerReseller` = 1 ) ;

ALTER TABLE `Sales.Customer`
ADD CONSTRAINT `BCK_TemplateTable_ValidBit_1125086184`
CHECK ( `IsCustomerCreditRisk` = 0 OR `IsCustomerCreditRisk` = 1 ) ;

ALTER TABLE `Sales.Customer`
ADD CONSTRAINT `CK_Sales_Customer_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Sales.Customer`
ADD CONSTRAINT `CK_Sales_Customer_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Sales.Customer`
ADD CONSTRAINT `CK_Sales_Customer_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `HumanResources.Staff`
(
	`StaffId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for staff members' NOT NULL ,
	`ManagerId` INTEGER COMMENT 'The ID of a staff member that supervises an employee' NULL ,
	`StaffName` VARCHAR(60) COMMENT 'The full name of a staff member' NOT NULL ,
	`Department` VARCHAR(15) COMMENT 'The department name a staff member works in' NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	 CONSTRAINT XPKStaff PRIMARY KEY  ( `StaffId` ASC ),
	CONSTRAINT `FK_HumanResources.Staff_HumanResources.Staff` FOREIGN KEY (`ManagerId`) REFERENCES `HumanResources.Staff` (`StaffId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_HumanResources.Staff_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'A staff member of the business who sells vehicles to customers';


ALTER TABLE `HumanResources.Staff`
ADD CONSTRAINT `CK_HumanResources_Staff_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `HumanResources.Staff`
ADD CONSTRAINT `CK_HumanResources_Staff_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Sales.SalesOrderVehicle`
(
	`SalesOrderVehicleId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for a purchase' NOT NULL ,
	`CustomerId` INTEGER COMMENT 'A unique identifier for customers' NOT NULL ,
	`StaffId` INTEGER COMMENT 'A unique identifier for staff members' NOT NULL ,
	`InvoiceNumber` VARCHAR(8) COMMENT 'The invoice number of an order' NOT NULL ,
	`TotalSalePrice` DECIMAL(18,2)  DEFAULT 0 COMMENT 'The total sale price of an order' NOT NULL ,
	`SaleDate` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The date an order was made' NOT NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`CategoryDescription` VARCHAR(20) GENERATED ALWAYS  AS ( CASE WHEN `TotalSalePrice` >= 100001.00 THEN 'Very High' WHEN `TotalSalePrice` BETWEEN 75001.00 AND 100000.00 THEN 'High' WHEN `TotalSalePrice` BETWEEN 50001.00 AND 75000.00 THEN 'Medium'  WHEN `TotalSalePrice` BETWEEN 25001.00 AND 50000.00 THEN 'Low' WHEN `TotalSalePrice` BETWEEN 150001.00 AND 250000.00 THEN 'Exceptional' WHEN `TotalSalePrice` BETWEEN 100001.00 AND 150000.00 THEN 'Very High' WHEN `TotalSalePrice` BETWEEN 100.00 AND 25000.00 THEN 'Very Low' ELSE 'Unknown' END )  COMMENT 'The category description a vehicle sales threshold' NOT NULL ,
	 CONSTRAINT XPKSales_Order_Vehicle PRIMARY KEY  ( `SalesOrderVehicleId` ASC ),
	CONSTRAINT `FK_Sales.SalesOrderVehicle_Sales.Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Sales.Customer` (`CustomerId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Sales.SalesOrderVehicle_HumanResources.Staff` FOREIGN KEY (`StaffId`) REFERENCES `HumanResources.Staff` (`StaffId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'An order for the purchase of a vehicle';


ALTER TABLE `Sales.SalesOrderVehicle`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicle_TotalSalePrice`
CHECK ( `TotalSalePrice` >= 0 ) ;

ALTER TABLE `Sales.SalesOrderVehicle`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicle_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Sales.SalesOrderVehicle`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicle_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Sales.SalesOrderVehicle`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicle_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Production.ManufacturerVehicleMake`
(
	`ManufacturerVehicleMakeId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for vehicle makes' NOT NULL ,
	`ManufacturerVehicleMakeName` VARCHAR(30) COMMENT 'The name of a vehicle make' NOT NULL ,
	`CountryId` INTEGER COMMENT 'A unique identifier for countries' NOT NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	`MarketingType` VARCHAR(25) COMMENT 'The marketing type of a vehicle make' NULL ,
	 CONSTRAINT PK_Make PRIMARY KEY  ( `ManufacturerVehicleMakeId` ASC ),
	CONSTRAINT `FK_Production.ManufacturerVehicleMake_Locale.Country` FOREIGN KEY (`CountryId`) REFERENCES `Locale.Country` (`CountryId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorizati` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'The company responsible for the production of a vehicle';


ALTER TABLE `Production.ManufacturerVehicleMake`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleMake_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Production.ManufacturerVehicleMake`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleMake_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Production.ManufacturerVehicleMake`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleMakel_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Production.ManufacturerModel`
(
	`ManufacturerModelId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for vehicle models' NOT NULL ,
	`ManufacturerModelName` VARCHAR(35) COMMENT 'The name of a vehicle model' NOT NULL ,
	`ManufacturerModelVariant` VARCHAR(35) COMMENT 'The name of a vehicle model variant if applicable' NULL ,
	`ManufacturerVehicleMakeId` INTEGER COMMENT 'A unique identifier for vehicle makes' NOT NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	 CONSTRAINT PK_Model_1 PRIMARY KEY  ( `ManufacturerModelId` ASC ),
	CONSTRAINT `FK_Production.ManufacturerModel_Production.ManufacturerVehicleMa` FOREIGN KEY (`ManufacturerVehicleMakeId`) REFERENCES `Production.ManufacturerVehicleMake` (`ManufacturerVehicleMakeId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Production.ManufacturerModel_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'The model of a particular vehicle created by the manufacturer';


ALTER TABLE `Production.ManufacturerModel`
ADD CONSTRAINT `CK_Production_ManufacturerModel_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Production.ManufacturerModel`
ADD CONSTRAINT `CK_Production_ManufacturerModel_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Production.ManufacturerModel`
ADD CONSTRAINT `CK_Production_ManufacturerModel_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Production.ManufacturerVehicleStock`
(
	`ManufacturerVehicleStockId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for manfacturer vehicle stock' NOT NULL ,
	`StockCode` VARCHAR(50) COMMENT 'The stock code of a vehicle' NOT NULL ,
	`Cost` DECIMAL(18,2) COMMENT 'The cost of a vehicle from the manufacturer' NOT NULL ,
	`RepairsCharge` DECIMAL(18,2) COMMENT 'The charge for repairs on a vehicle' NOT NULL ,
	`PartsCharge` DECIMAL(18,2) COMMENT 'The charge for parts on a vehicle' NOT NULL ,
	`DeliveryCharge` DECIMAL(18,2) COMMENT 'The charge for delivery of a vehicle' NOT NULL ,
	`IsPremiumRoadHandlingPackage` INTEGER  DEFAULT 0 COMMENT 'A flag to determine if a vehicle has a premium road handling package' NOT NULL ,
	`VehicleColor` VARCHAR(20) COMMENT 'The color of the vehicle' NOT NULL ,
	`CustomerComment` VARCHAR(200) COMMENT 'A comment added by a customer' NULL ,
	`ModelId` INTEGER COMMENT 'A unique identifier for vehicle models' NOT NULL ,
	`PurchaseDate` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The date of purchase' NOT NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	 CONSTRAINT PK_Stock PRIMARY KEY  ( `ManufacturerVehicleStockId` ASC ),
	CONSTRAINT `FK_Production.ManufacturerVehicleStock_Production.ManufacturerMo` FOREIGN KEY (`ModelId`) REFERENCES `Production.ManufacturerModel` (`ManufacturerModelId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorizat` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'A produced physical vehicle that a manufacturer has in stock';


ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_Cost`
CHECK ( `Cost` >= 0 ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_RepairsCharge`
CHECK ( `RepairsCharge` >= 0 ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_PartsCharge`
CHECK ( `PartsCharge` >= 0 ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_DeliveryCharge`
CHECK ( `DeliveryCharge` >= 0 ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_IsPremiumRoadHandlingPack`
CHECK ( `IsPremiumRoadHandlingPackage` = 0 OR `IsPremiumRoadHandlingPackage` = 1 ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManufacturerVehicleStock_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Production.ManufacturerVehicleStock`
ADD CONSTRAINT `CK_Production_ManfuacturerVehicleStock_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Sales.SalesOrderVehicleDetail`
(
	`SalesOrderVehicleDetailId` INTEGER AUTO_INCREMENT  COMMENT 'A unique identifier for Sales.SalesOrderVehicleDetail Ids' NOT NULL ,
	`SalesOrderVehicleId` INTEGER COMMENT 'A unique identifier for a purchase' NULL ,
	`LineItemNumber` INTEGER  DEFAULT 1 COMMENT 'The line item number on the invoice' NOT NULL ,
	`SalePrice` DECIMAL(18,2)  DEFAULT 0 COMMENT 'The sale price of a vehicle' NOT NULL ,
	`LineItemDiscount` DECIMAL(18,2)  DEFAULT 0 COMMENT 'The discount of the line item number' NOT NULL ,
	`DerivedDiscountedSalePrice` DECIMAL(18,2) GENERATED ALWAYS  AS ( `SalePrice` - `LineItemDiscount` )  COMMENT 'The derived discounted sale price of a vehicle' NOT NULL ,
	`ManufacturerVehicleStockId` INTEGER COMMENT 'A unique identifier for manfacturer vehicle stock' NOT NULL ,
	`UserAuthorizationId` INTEGER  DEFAULT 1 COMMENT 'A unique identifier for UserAuthorizationIds' NOT NULL ,
	`SysStartTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The start time for a system transaction' NULL ,
	`SysEndTime` DATETIME  DEFAULT CURRENT_TIMESTAMP COMMENT 'The end time for a system transaction' NULL ,
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`TransactionNumber` INTEGER  DEFAULT 1 COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`Note` VARCHAR(100)  DEFAULT 'Row was inserted' COMMENT 'A note regarding the database transaction' NULL ,
	`PriorRowLevelHashKey` BLOB COMMENT 'The prior transaction row level hash key' NULL ,
	`FireAuditTrigger` CHAR(1)  DEFAULT 'N' COMMENT 'A flag to indicate if an audit trigger should be fired' NOT NULL ,
	 CONSTRAINT PK_SalesDetails PRIMARY KEY  ( `SalesOrderVehicleDetailId` ASC ),
	CONSTRAINT `FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle` FOREIGN KEY (`SalesOrderVehicleId`) REFERENCES `Sales.SalesOrderVehicle` (`SalesOrderVehicleId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleS` FOREIGN KEY (`ManufacturerVehicleStockId`) REFERENCES `Production.ManufacturerVehicleStock` (`ManufacturerVehicleStockId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION ,
	CONSTRAINT `FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization` FOREIGN KEY (`UserAuthorizationId`) REFERENCES `DbSecurity.UserAuthorization` (`UserAuthorizationId`)
		ON DELETE NO ACTION 
		ON UPDATE NO ACTION 
)
COMMENT = 'The details of a vehicle order';


ALTER TABLE `Sales.SalesOrderVehicleDetail`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_SalePrice`
CHECK ( `SalePrice` >= 0 ) ;

ALTER TABLE `Sales.SalesOrderVehicleDetail`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_LineItemDiscount`
CHECK ( `LineItemDiscount` >= 0 ) ;

ALTER TABLE `Sales.SalesOrderVehicleDetail`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_SysStartTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Sales.SalesOrderVehicleDetail`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_SysEndTime`
CHECK ( `SysEndTime` >= `SysStartTime` ) ;

ALTER TABLE `Sales.SalesOrderVehicleDetail`
ADD CONSTRAINT `CK_Sales_SalesOrderVehicleDetail_FireAuditTrigger`
CHECK ( `FireAuditTrigger`='Y' OR `FireAuditTrigger`='N' ) ;

CREATE TABLE IF NOT EXISTS `Utils.CommonColumnsForTriggerTemplate`
(
	`RowLevelHashKey` BLOB COMMENT 'Current row hash key representing all combined columns' NULL ,
	`Note` VARCHAR(100) COMMENT 'A note regarding the database transaction' NULL ,
	`IsDeleted` CHAR(1) COMMENT 'Flag used to check if an entry has been deleted' NOT NULL ,
	`TransactionNumber` INTEGER COMMENT 'The transaction number in a series of database transactions' NOT NULL ,
	`UserAuthenticatedKey` INTEGER COMMENT 'The user authenticated key' NOT NULL ,
	`SysStartTime` DATETIME COMMENT 'The start time for a system transaction' NOT NULL ,
	`SysEndTime` DATETIME COMMENT 'The end time for a system transaction' NOT NULL 
)
COMMENT = 'Common columns for Trigger Audit Tables';

CREATE VIEW `CustomViews.uvw_ChuanModelMake` as 
select PMM.ManufacturerModelName as Model, PMVM.ManufacturerVehicleMakeName as Make from `Production.ManufacturerModel` as PMM
INNER JOIN `Production.ManufacturerVehicleMake` as PMVM on  PMM.ManufacturerVehicleMakeId = PMVM.ManufacturerVehicleMakeId;;;

CREATE VIEW `CustomViews.uvw_ChuanMakeCountry` as
select LC.CountryName as Country, PMVM.ManufacturerVehicleMakeName as Make from `Production.ManufacturerVehicleMake` as PMVM
INNER JOIN `Locale.Country` as LC on PMVM.CountryId = LC.CountryId;;;

CREATE VIEW `CustomViews.uvw_ChuanCustomerCountry` as
select SC.CustomerName,LC.CountryName from `Sales.Customer` as SC INNER JOIN `Locale.Country` as LC on LC.CountryId = SC.CountryId;;;

CREATE VIEW `CustomViews.uvw_MehrshadYearlyCustomerSales`
as
SELECT
        `Sales.SalesOrderVehicle`.`SaleDate`                              ,
        `Sales.Customer`.`CustomerName`                                   ,
        `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName`,
        `Production.ManufacturerModel`.`ManufacturerModelName`            ,
        `Sales.SalesOrderVehicleDetail`.`SalePrice`
FROM
        `Sales.SalesOrderVehicleDetail`
INNER JOIN
        `Sales.SalesOrderVehicle`
ON
        `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicle`.`SalesOrderVehicleId`
INNER JOIN
        `Sales.Customer`
ON
        `Sales.SalesOrderVehicle`.`CustomerId` = `Sales.Customer`.`CustomerId`
CROSS JOIN
        `Production.ManufacturerModel`
INNER JOIN
        `Production.ManufacturerVehicleMake`
ON
        `Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`;;;

CREATE VIEW `CustomViews.uvw_MehrshadYearlySalesProfits`
as
SELECT
    YEAR(`Sales.SalesOrderVehicle`.`SaleDate`) AS `SalesYear`,
    `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,
    `Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,
    `Sales.Customer`.`CustomerName`,
    `Production.ManufacturerVehicleStock`.`Cost`,
    `Production.ManufacturerVehicleStock`.`RepairsCharge`,
    `Production.ManufacturerVehicleStock`.`PartsCharge` AS `PartsCost`,
    `Production.ManufacturerVehicleStock`.`DeliveryCharge` AS `TransportInCost`,
    `Sales.SalesOrderVehicleDetail`.`SalePrice`,
    `Sales.SalesOrderVehicle`.`SaleDate`,
    (`Sales.SalesOrderVehicleDetail`.`SalePrice` - `Production.ManufacturerVehicleStock`.`Cost` - `Production.ManufacturerVehicleStock`.`RepairsCharge` - 
	`Production.ManufacturerVehicleStock`.`PartsCharge` - `Production.ManufacturerVehicleStock`.`DeliveryCharge`) AS `Profit`
FROM
    `Sales.Customer`
INNER JOIN
    `Sales.SalesOrderVehicle`
ON
    `Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`
INNER JOIN
    `Sales.SalesOrderVehicleDetail`
ON
    `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
INNER JOIN
    `Production.ManufacturerVehicleStock`
ON
    `Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`
INNER JOIN
    `Production.ManufacturerModel`
ON
    `Production.ManufacturerModel`.`ManufacturerModelId` = `Production.ManufacturerVehicleStock`.`ModelId`
INNER JOIN
    `Production.ManufacturerVehicleMake`
ON
    `Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`;
;;

CREATE VIEW `CustomViews.uvw_MehrshadVehicleCost`
as
SELECT
        `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName`,
        `Production.ManufacturerModel`.`ManufacturerModelName`            ,
        `Production.ManufacturerVehicleStock`.`Cost`
FROM
        `Sales.SalesOrderVehicleDetail`
INNER JOIN
        `Sales.SalesOrderVehicle`
ON
        `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicle`.`SalesOrderVehicleId`
INNER JOIN
        `Sales.Customer`
ON
        `Sales.SalesOrderVehicle`.`CustomerId` = `Sales.Customer`.`CustomerId`
INNER JOIN
        `Production.ManufacturerVehicleStock`
ON
        `Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`
INNER JOIN
        `Production.ManufacturerModel`
INNER JOIN
        `Production.ManufacturerVehicleMake`
ON
        `Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`
ON
        `Production.ManufacturerVehicleStock`.`ModelId` = `Production.ManufacturerModel`.`ManufacturerModelId`;;

CREATE VIEW `CustomViews.uvw_RalphEmployeeManager`
as
SELECT 
	`emp`.`StaffName` as `Employee Name`,
	`emp`.`Department` as `Employee Department`,
	`mgr`.`StaffName` as `Manager Name`,
	`mgr`.`Department` as `Manager Department`
FROM
`HumanResources.Staff` AS `emp`
INNER JOIN
`HumanResources.Staff` AS `mgr`
ON `emp`.`ManagerId` = `mgr`.`StaffId`;;
;

CREATE VIEW `CustomViews.uvw_RalphMakeModelPartsCost` AS
SELECT 
	`mvm`.`ManufacturerVehicleMakeName` AS `Make`,
	`mm`.`ManufacturerModelName` AS `Model`,
	`mvs`.`PartsCharge` AS `Parts Cost`
FROM 
`Production.ManufacturerVehicleStock` as `mvs`
INNER JOIN
`Production.ManufacturerModel` as `mm`
ON `mm`.`ManufacturerModelId` = `mvs`.`ModelId`
INNER JOIN `Production.ManufacturerVehicleMake` as `mvm`
ON `mm`.`ManufacturerVehicleMakeId` = `mvm`.`ManufacturerVehicleMakeId`;;
;

CREATE VIEW `CustomViews.uvw_RyanCustomerCountryDate` as
SELECT 
    C.CustomerName,
    CO.CountryName,
	MIN(CO.SysStartTime) as StartTime,
	MAX(CO.SysEndTime) as EndTime
FROM 
    `Sales.Customer` C
INNER JOIN 
    `Locale.Country` CO ON C.CountryId = CO.CountryId
GROUP BY 
    C.CustomerName, CO.CountryName;;

CREATE VIEW `CustomViews.uvw_RyanCustomerLatestTotalSaleDate` as
SELECT
	C.CustomerName,
	SUM(SOV.TotalSalePrice) as TotalSalePrice,
	MAX(SOV.SaleDate) as LatestSaleDate
FROM
	`Sales.Customer` C
INNER JOIN
	`Sales.SalesOrderVehicle` SOV ON C.CustomerId = SOV.CustomerId
GROUP BY
	C.CustomerName;;

CREATE VIEW `CustomViews.uvw_RyanGroupSpendCapacity` as
SELECT
    G.GroupName,
    SUM(CAST(C.SpendCapacity AS float)) as TotalSpendCapacity
FROM
    `DbSecurity.UserAuthorization` G
INNER JOIN
    `Sales.Customer` C ON C.UserAuthorizationId = G.UserAuthorizationId
GROUP BY
    G.GroupName;;

CREATE VIEW `CustomViews.uvw_JimmyModelCountry` AS 
SELECT 
	`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,
	`Locale.Country`.`CountryName` AS `CountryName`
FROM 
`Locale.Country` 
INNER JOIN
`Production.ManufacturerModel` 
ON `Locale.Country`.`TransactionNumber` = `Production.ManufacturerModel`.`TransactionNumber`
;;

CREATE VIEW `CustomViews.uvw_JimmyCustomerVehicleVehicleDetail` AS
SELECT 
	`Sales.Customer`.`CustomerName` AS `CustName`,
	`Sales.SalesOrderVehicle`.`TotalSalePrice` AS `TotalSale`, 
	`Sales.SalesOrderVehicleDetail`.`SalePrice` AS `SalePrice`
FROM 
`Sales.Customer`
INNER JOIN
`Sales.SalesOrderVehicle` 
ON `Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`
INNER JOIN 
`Sales.SalesOrderVehicleDetail` 
ON `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
;;

CREATE VIEW `CustomViews.uvw_JimmyCustomerMakeModel` AS
SELECT 
	`Sales.Customer`.`CustomerName` AS `CustName`,
	`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`, 
	`Production.ManufacturerModel`.`ManufacturerModelName` AS `Model`
FROM 
`Production.ManufacturerVehicleMake`
INNER JOIN
`Sales.Customer`
ON `Production.ManufacturerVehicleMake`.`TransactionNumber` = `Sales.Customer`.`TransactionNumber`
INNER JOIN 
`Production.ManufacturerModel`
ON `Sales.Customer`.`TransactionNumber` = `Production.ManufacturerModel`.`TransactionNumber`
;;

CREATE VIEW `Sales_uvw_Sales2018` AS
SELECT
    YEAR(`Sales.SalesOrderVehicle`.`SaleDate`) AS `SalesYear`,
	`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,
    `Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,
    `Sales.Customer`.`CustomerName`,
    `Locale.Country`.`CountryName`,
    `Production.ManufacturerVehicleStock`.`Cost` AS `Cost`,
    `Production.ManufacturerVehicleStock`.`RepairsCharge` AS `RepairCost`,
    `Production.ManufacturerVehicleStock`.`PartsCharge` AS `PartsCost`,
    `Production.ManufacturerVehicleStock`.`DeliveryCharge` AS `TransportInCost`,
    CAST(`Sales.SalesOrderVehicleDetail`.`SalePrice` as UNSIGNED) as `SalePrice`,
    DATE_FORMAT(`Sales.SalesOrderVehicle`.`SaleDate`, '%m/%d/%Y') AS SaleDate
FROM
    `Sales.Customer`
INNER JOIN
    `Sales.SalesOrderVehicle`
ON
    `Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`
INNER JOIN
    `Locale.Country`
ON
    `Sales.Customer`.`CountryId` = `Locale.Country`.`CountryId`
INNER JOIN
    `Sales.SalesOrderVehicleDetail`
ON
    `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
INNER JOIN
    `Production.ManufacturerVehicleStock`
ON
    `Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`
INNER JOIN
    `Production.ManufacturerModel`
ON
    `Production.ManufacturerModel`.`ManufacturerModelId` = `Production.ManufacturerVehicleStock`.`ModelId`
INNER JOIN
    `Production.ManufacturerVehicleMake` 
ON
    `Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId` where YEAR(`Sales.SalesOrderVehicle`.`SaleDate`) = 2018;
;;

CREATE VIEW `Sales_uvw_SalesByCountry` as 
SELECT
	`Locale.Country`.`CountryName`,
	`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,
	`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,
	`Production.ManufacturerVehicleStock`.`VehicleColor` AS `Color`,
	CAST(`Sales.SalesOrderVehicleDetail`.`SalePrice` as UNSIGNED) as SalePrice,
	CAST(`Sales.SalesOrderVehicleDetail`.`LineItemDiscount` as UNSIGNED) as LineItemDiscount,
	`Sales.SalesOrderVehicle`.`InvoiceNumber`,
	DATE_FORMAT( `Sales.SalesOrderVehicle`.`SaleDate`, '%m/%d/%Y') as SaleDate,
	`Sales.Customer`.`CustomerName`,
	`Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleDetailId` AS `SalesDetailsID`
FROM
    `Sales.SalesOrderVehicle`
JOIN
    `Sales.Customer` ON `Sales.SalesOrderVehicle`.`CustomerId` = `Sales.Customer`.`CustomerId`
JOIN
    `Locale.Country` ON `Sales.Customer`.`CountryId` = `Locale.Country`.`CountryId`
JOIN
    `Sales.SalesOrderVehicleDetail` ON `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
JOIN
    `Production.ManufacturerVehicleStock` ON `Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`
JOIN
    `Production.ManufacturerModel` ON `Production.ManufacturerVehicleStock`.`ModelId` = `Production.ManufacturerModel`.`ManufacturerModelId`
JOIN
    `Production.ManufacturerVehicleMake` ON `Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`;

;;

CREATE VIEW `Sales_PivotTable` AS
SELECT
    `VehicleColor`,
    CAST(SUM(CASE WHEN YEAR(`SaleDate`) = 2015 THEN `TotalSalePrice` ELSE 0 END) AS UNSIGNED) AS `CY2015`,
    CAST(SUM(CASE WHEN YEAR(`SaleDate`) = 2016 THEN `TotalSalePrice` ELSE 0 END) AS UNSIGNED) AS `CY2016`,
    CAST(SUM(CASE WHEN YEAR(`SaleDate`) = 2017 THEN `TotalSalePrice` ELSE 0 END) AS UNSIGNED) AS `CY2017`,
    CAST(SUM(CASE WHEN YEAR(`SaleDate`) = 2018 THEN `TotalSalePrice` ELSE 0 END) AS UNSIGNED) AS `CY2018`
FROM
    `Sales.SalesOrderVehicle`
JOIN
    `Sales.SalesOrderVehicleDetail` ON `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
JOIN
    `Production.ManufacturerVehicleStock` ON `Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`
GROUP BY
    `VehicleColor`;
;;

CREATE VIEW `Sales_StockPrices` AS
SELECT
    mvsmm.`ManufacturerVehicleMakeName` AS `MakeName`,
    mm.`ManufacturerModelName` AS `ModelName`,
    FORMAT(mvs.`Cost`, '$#,0.00') AS `RetailCost`
FROM
    `Production.ManufacturerVehicleStock` mvs
    JOIN `Production.ManufacturerModel` mm 
	ON mvs.`ModelId` = mm.`ManufacturerModelId`
    JOIN `Production.ManufacturerVehicleMake` mvsmm 
	ON mm.`ManufacturerVehicleMakeId` = mvsmm.`ManufacturerVehicleMakeId`;

;;

CREATE VIEW `Sales.SalesText` AS
SELECT
    co.`CountryName`,
    mvm.`ManufacturerVehicleMakeName` AS `MakeName`,
    mvs.`Cost` AS `Cost`,
    sv.`TotalSalePrice` AS `SalePrice`
FROM
    `Sales.SalesOrderVehicle` sv
	JOIN `Sales.SalesOrderVehicleDetail` svd ON svd.`SalesOrderVehicleId` = sv.`SalesOrderVehicleId`
    JOIN `Production.ManufacturerVehicleStock` mvs ON svd.`ManufacturerVehicleStockId` = mvs.`ManufacturerVehicleStockId`
    JOIN `Production.ManufacturerModel` mm ON mvs.`ModelId` = mm.`ManufacturerModelId`
	JOIN `Production.ManufacturerVehicleMake` mvm ON mvm.`ManufacturerVehicleMakeId` = mm.`ManufacturerVehicleMakeId`
    JOIN `Sales.Customer` c ON sv.`CustomerId` = c.`CustomerId`
    JOIN `Locale.Country` co ON c.`CountryId` = co.`CountryId`;

;
;

CREATE VIEW `Sales.YearlySales` AS
SELECT
	YEAR(`Sales.SalesOrderVehicle`.`SaleDate`) AS `SalesYear`,
	`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`,
	`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,
    	`Sales.Customer`.`CustomerName`,
	`Locale.Country`.`CountryName`,
	CAST(`Sales.SalesOrderVehicleDetail`.`SalePrice` AS UNSIGNED) as `SalePrice`,
	DATE_FORMAT(`Sales.SalesOrderVehicle`.`SaleDate`, '%m/%d/%Y') AS `SaleDate`
FROM
    `Sales.Customer`
INNER JOIN
    `Sales.SalesOrderVehicle`
ON
    `Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`
INNER JOIN
    `Locale.Country`
ON
    `Sales.Customer`.`CountryId` = `Locale.Country`.`CountryId`
INNER JOIN
    `Sales.SalesOrderVehicleDetail`
ON
    `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
INNER JOIN
    `Production.ManufacturerVehicleStock`
ON
    `Sales.SalesOrderVehicleDetail`.`ManufacturerVehicleStockId` = `Production.ManufacturerVehicleStock`.`ManufacturerVehicleStockId`
INNER JOIN
    `Production.ManufacturerModel`
ON
    `Production.ManufacturerModel`.`ManufacturerModelId` = `Production.ManufacturerVehicleStock`.`ModelId`
INNER JOIN
    `Production.ManufacturerVehicleMake`
ON
    `Production.ManufacturerModel`.`ManufacturerVehicleMakeId` = `Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeId`;

;;;

CREATE VIEW `CustomViews.uvw_ChuanStaffSales` as
select HRS.StaffName, SUM(SSOV.TotalSalePrice) as TotalSales from `HumanResources.Staff` as HRS 
INNER JOIN `Sales.SalesOrderVehicle` as SSOV on HRS.StaffId = SSOV.StaffId group by StaffName;;;;

CREATE VIEW `CustomViews.uvw_ChuanStaffDiscountGiven` as
select HRS.StaffName, SUM(SSOVD.LineItemDiscount) as DiscountGiven from `HumanResources.Staff` as HRS
INNER JOIN `Sales.SalesOrderVehicle` as SSOV on HRS.StaffId = SSOV.StaffId 
INNER JOIN `Sales.SalesOrderVehicleDetail` as SSOVD on SSOV.SalesOrderVehicleId = SSOVD.SalesOrderVehicleId group by StaffName;;;;
