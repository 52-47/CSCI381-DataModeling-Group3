

set quoted_identifier on
go

CREATE SCHEMA "Output" AUTHORIZATION "dbo"
go

CREATE SCHEMA "Utils" AUTHORIZATION "dbo"
go

CREATE SCHEMA "RawData" AUTHORIZATION "dbo"
go

CREATE SCHEMA "HumanResources"
go

CREATE SCHEMA "Sales"
go

CREATE SCHEMA "Locale"
go

CREATE SCHEMA "Production"
go

CREATE SCHEMA "Audit"
go

CREATE SCHEMA "sdString"
go

CREATE SCHEMA "sdNumber"
go

CREATE SCHEMA "sdDateTime"
go

CREATE SCHEMA "sdAddressesString"
go

CREATE SCHEMA "sdLongTextString"
go

CREATE SCHEMA "sdMarketingTextString"
go

CREATE SCHEMA "sdShortTextString"
go

CREATE SCHEMA "sdVehicleString"
go

CREATE SCHEMA "sdSequenceNumber"
go

CREATE SCHEMA "sdDate"
go

CREATE SCHEMA "sdHashKey"
go

CREATE SCHEMA "sdCountryStringVariant"
go

CREATE SCHEMA "dEuropeanCarManufacturer"
go

CREATE SCHEMA "sdOrdinalNumber"
go

CREATE SCHEMA "sdBusinessComponentString"
go

CREATE SCHEMA "sdNameString"
go

CREATE SCHEMA "sdTimeString"
go

CREATE SCHEMA "sdProjectString"
go

CREATE SCHEMA "sdAudit"
go

CREATE SCHEMA "sdBlob"
go

CREATE SCHEMA "sdKey"
go

CREATE SCHEMA "SequenceIdInsert"
go

CREATE SCHEMA "DbSecurity"
go

CREATE SCHEMA "sdFlag"
go

CREATE TYPE "dEuropeanCarManufacturer"
	FROM CHAR(18) NULL
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The top level domain for European Car Manufacturer Data Model',
@level0type = N'TYPE', @level0name = N'dEuropeanCarManufacturer'
go

CREATE TYPE "dEuropeanCarManufacturer"."sdNumber"
	FROM INT NULL
go


CREATE TYPE "dEuropeanCarManufacturer"."sdDatetime"
	FROM DATETIME NULL
go


CREATE TYPE "dEuropeanCarManufacturer"."sdString"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdNumber"."sdSequenceNumber"
	FROM INT NOT NULL
go


CREATE TYPE "sdKey"."SurrogateKeyInteger"
	FROM INT NOT NULL
go


CREATE TYPE "sdDateTime"."sdDate"
	FROM DATE NULL
go


CREATE TYPE "sdString"."sdLongTextString"
	FROM NVARCHAR(200) NULL
go


CREATE TYPE "sdLongTextString"."Note"
	FROM NVARCHAR(50) NULL
go


CREATE TYPE "sdString"."sdShortTextString"
	FROM NVARCHAR(50) NULL
go


CREATE TYPE "sdShortTextString"."StockCode"
	FROM NVARCHAR(50) NULL
go


CREATE TYPE "sdShortTextString"."InvoiceNumber"
	FROM VARCHAR(8) NULL
go


CREATE TYPE "sdString"."sdVehicleString"
	FROM NVARCHAR(50) NULL
go


CREATE TYPE "sdVehicleString"."VehicleIdentifier"
	FROM NVARCHAR(150) NULL
go


CREATE TYPE "sdVehicleString"."VehicleColor"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdDateTime"."DateTimestamp"
	FROM DATETIME2(7) NOT NULL
go

CREATE TYPE "sdFlag"."FlagBit"
	FROM INTEGER NULL
go


CREATE TYPE "sdString"."sdAddressesString"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdAddressesString"."AddressString"
	FROM NVARCHAR(60) NULL
go


CREATE TYPE "sdAddressesString"."PostalCodeString"
	FROM NVARCHAR(9) NULL
go


CREATE TYPE "sdAddressesString"."TownString"
	FROM NVARCHAR(30) NULL
go


CREATE TYPE "sdString"."sdCountryStringVariant"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdCountryStringVariant"."CountryISO2"
	FROM NVARCHAR(2) NULL
go


CREATE TYPE "sdCountryStringVariant"."CountryISO3"
	FROM NCHAR(3) NULL
go


CREATE TYPE "sdAddressesString"."CountryString"
	FROM NVARCHAR(50) NULL
go


CREATE TYPE "sdAddressesString"."RegionString"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdString"."sdBusinessComponentString"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdBusinessComponentString"."DepartmentString"
	FROM NVARCHAR(15) NULL
go


CREATE TYPE "sdNumber"."sdOrdinalNumber"
	FROM INT NOT NULL
go


CREATE TYPE "sdLongTextString"."CustomerComments"
	FROM NVARCHAR(200) NULL
go


CREATE TYPE "sdMarketingTextString"."VehicleSalesThresholdCategory"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdString"."sdNameString"
	FROM NVARCHAR(50) NOT NULL
go


CREATE TYPE "sdString"."sdTimeString"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdTimeString"."ClassTimeString"
	FROM NCHAR(5) NULL
go


CREATE TYPE "sdString"."sdProjectString"
	FROM NVARCHAR(50) NULL
go


CREATE TYPE "sdProjectString"."GrouplProjectNameString"
	FROM NVARCHAR(20) NULL
go


CREATE TYPE "sdNameString"."FirstNameString"
	FROM NVARCHAR(25) NOT NULL
go


CREATE TYPE "sdNameString"."LastNameString"
	FROM NVARCHAR(35) NOT NULL
go


CREATE TYPE "sdNameString"."FullNameString"
	FROM NVARCHAR(60) NOT NULL
go


CREATE TYPE "sdVehicleString"."VehicleManufacturerMarketingType"
	FROM NVARCHAR(25) NULL
go


CREATE TYPE "sdOrdinalNumber"."TransactionNumber"
	FROM INT NOT NULL
go


CREATE TYPE "sdSequenceNumber"."LineItemNumber"
	FROM INT NOT NULL
go


CREATE TYPE "sdNameString"."CustomerName"
	FROM NVARCHAR(65) NULL
go


CREATE TYPE "sdMarketingTextString"."CustomerSpendCapacity"
	FROM NVARCHAR(15) NULL
go


CREATE TYPE "sdBlob"."sdHashKey"
	FROM VARBINARY(32) NULL
go


CREATE TYPE "sdHashKey"."RowLevelHashKey"
	FROM VARBINARY(32) NULL
go


CREATE TYPE "sdAudit"."DbAction"
	FROM CHAR(1) NULL
go


CREATE TYPE "sdString"."sdAudit"
	FROM CHAR(1) NULL
go


CREATE TYPE "sdFlag"."FlagYesNoString"
	FROM CHAR(1) NOT NULL
go


CREATE TYPE "dEuropeanCarManufacturer"."sdBlob"
	FROM VARBINARY(32) NULL
go


CREATE TYPE "sdString"."sdMarketingTextString"
	FROM NVARCHAR(25) NULL
go


CREATE TYPE "dEuropeanCarManufacturer"."sdKey"
	FROM INT NULL
go


CREATE TYPE "VehicleMakeString"
	FROM NVARCHAR(30) NULL
go


CREATE TYPE "VehicleModelString"
	FROM NVARCHAR(35) NULL
go


CREATE TYPE "StockIdNumber"
	FROM INT NOT NULL
go


CREATE TYPE "sdNumber"."Currency"
	FROM NUMERIC(18,2) NULL
go


CREATE TYPE "DateYYYYMMDD"
	FROM DATE NULL
go


CREATE TYPE "sdProjectString"."IndividualProjectNameString"
	FROM NVARCHAR(60) NULL
go


CREATE TYPE "sdFlag"
	FROM INTEGER NULL
go

CREATE SEQUENCE "SequenceIdInsert"."Locale_Country_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Production_ManufacturerVehicleMake_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Production_ManufacturerModel_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Production_ManufacturerVehicleStock_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Sales_SalesOrderVehicleDetail_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Sales_SalesOrderVehicle_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."HumanResources_Staff_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Sales_Customer_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."DbSecurity_UserAuthorization_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Sales_SalesCategoryThreshold_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_HumanResourcesStaffHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_LocaleCountryHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesCustomerHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_ProductionManufacturerModelHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_ProductionManufacturerVehicleMakeHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_ProductionManufacturerVehicleStockHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesSalesOrderVehicleHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesSalesOrderVehicleDetailHistory_Id" AS bigint
START WITH 1
INCREMENT BY 1
go


CREATE TABLE "Utils"."CommonColumnsForTriggerTemplate"
( 
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"UserAuthenticatedKey" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NOT NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Common columns for Trigger Audit Tables',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The user authenticated key',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'UserAuthenticatedKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'TABLE', @level1name = N'CommonColumnsForTriggerTemplate',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

CREATE TABLE "Locale"."Country"
( 
	"CountryId"          "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Locale_Country_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Locale_Country_Id",
	"CountryISO3"        "sdCountryStringVariant"."CountryISO3"  NOT NULL ,
	"CountryName"        "sdAddressesString"."CountryString"  NOT NULL ,
	"CountryISO2"        "sdCountryStringVariant"."CountryISO2"  NOT NULL ,
	"SalesRegion"        "sdAddressesString"."RegionString"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Locale_Country_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Locale_Country_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Locale_Country_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Locale_Country_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Locale_Country_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Locale_Country_FireAuditTrigger"
		 DEFAULT  'N'
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A country or territory in the world',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for countries',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ISO3 format of a country',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryISO3'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the country',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ISO2 format of a country',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'CountryISO2'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the sales region a coutry belongs to',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'SalesRegion'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Locale',
@level1type = N'TABLE', @level1name = N'Country',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

CREATE TABLE "Sales"."Customer"
( 
	"CustomerId"         "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_Customer_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_Customer_Id",
	"CustomerName"       "sdNameString"."CustomerName"  NOT NULL ,
	"CustomerAddress1"   "sdAddressesString"."AddressString"  NOT NULL ,
	"CustomerAddress2"   "sdAddressesString"."AddressString"  NULL ,
	"CustomerTown"       "sdAddressesString"."TownString"  NOT NULL ,
	"CustomerPostalCode" "sdAddressesString"."PostalCodeString"  NULL ,
	"CountryId"          "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"IsCustomerReseller" "sdFlag"."FlagBit"  NOT NULL ,
	"IsCustomerCreditRisk" "sdFlag"."FlagBit"  NOT NULL ,
	"SpendCapacity"      "sdMarketingTextString"."CustomerSpendCapacity"  NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_Customer_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_Customer_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_Customer_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Sales_Customer_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Sales_Customer_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Sales_Customer_FireAuditTrigger"
		 DEFAULT  'N'
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A person who purchases a vehicle from the business',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for customers',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The full name of a customer',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The street address of a customer',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerAddress1'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The extended street address of a customer',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerAddress2'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The town or city a customer resides in',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerTown'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The postal code of a customer if applicable',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CustomerPostalCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for countries',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag to determine if a customer is a reseller',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'IsCustomerReseller'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag to determine if customer is a credit risk',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'IsCustomerCreditRisk'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The spend capacity of a customer',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'SpendCapacity'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'Customer',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

CREATE TABLE "Audit"."HumanResourcesStaffHistory"
( 
	"StaffId"            "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"StaffName"          "sdNameString"."FullNameString"  NOT NULL ,
	"Department"         "sdBusinessComponentString"."DepartmentString"  NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"ManagerId"          "sdKey"."SurrogateKeyInteger"  NULL ,
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"StaffHistoryId"     "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_HumanResourcesStaffHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_HumanResourcesStaffHistory_Id",
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_Audit_HumanResourcesStaffHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for Staff',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for staff members',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The full name of a staff member',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'StaffName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The department name a staff member works in',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'Department'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ID of a staff member that supervises an employee',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'ManagerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in HumanResourcesStaffHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'StaffHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'HumanResourcesStaffHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

CREATE TABLE "Audit"."LocaleCountryHistory"
( 
	"CountryId"          "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"CountryISO3"        "sdCountryStringVariant"."CountryISO3"  NOT NULL ,
	"CountryName"        "sdAddressesString"."CountryString"  NOT NULL ,
	"CountryISO2"        "sdCountryStringVariant"."CountryISO2"  NOT NULL ,
	"SalesRegion"        "sdAddressesString"."RegionString"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"LocaleCountryHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_LocaleCountryHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_LocaleCountryHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_Audit_LocaleCountryHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for Country',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for countries',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ISO3 format of a country',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'CountryISO3'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the country',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'CountryName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ISO2 format of a country',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'CountryISO2'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the sales region a coutry belongs to',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'SalesRegion'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in LocaleCountryHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'LocaleCountryHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'LocaleCountryHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

CREATE TABLE "Production"."ManufacturerModel"
( 
	"ManufacturerModelId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerModel_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Production_ManufacturerModel_Id",
	"ManufacturerModelName" "VehicleModelString"  NOT NULL ,
	"ManufacturerModelVariant" "VehicleModelString"  NULL ,
	"ManufacturerVehicleMakeId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerModel_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Production_ManufacturerModel_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Production_ManufacturerModel_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Production_ManufacturerModel_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Production_ManufacturerModel_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Production_ManufacturerModel_FireAuditTrigger"
		 DEFAULT  'N'
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The model of a particular vehicle created by the manufacturer',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle models',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a vehicle model',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a vehicle model variant if applicable',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelVariant'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle makes',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerModel',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

CREATE TABLE "Production"."ManufacturerVehicleMake"
( 
	"ManufacturerVehicleMakeId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleMake_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Production_ManufacturerVehicleMake_Id",
	"ManufacturerVehicleMakeName" "VehicleMakeString"  NOT NULL ,
	"CountryId"          "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleMake_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleMake_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleMake_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Production_ManufacturerVehicleMake_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Production_ManufacturerVehicleMake_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Production_ManufacturerVehicleMakel_FireAuditTrigger"
		 DEFAULT  'N',
	"MarketingType"      "sdVehicleString"."VehicleManufacturerMarketingType" 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The company responsible for the production of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle makes',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a vehicle make',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for countries',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The marketing type of a vehicle make',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleMake',
@level2type = N'COLUMN', @level2name = N'MarketingType'
go

CREATE TABLE "Production"."ManufacturerVehicleStock"
( 
	"ManufacturerVehicleStockId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Production_ManufacturerVehicleStock_Id",
	"StockCode"          "sdShortTextString"."StockCode"  NOT NULL ,
	"Cost"               "sdNumber"."Currency"  NOT NULL ,
	"RepairsCharge"      "sdNumber"."Currency"  NOT NULL ,
	"PartsCharge"        "sdNumber"."Currency"  NOT NULL ,
	"DeliveryCharge"     "sdNumber"."Currency"  NOT NULL ,
	"IsPremiumRoadHandlingPackage" "sdFlag"."FlagBit"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_IsPremiumRoadHandlingPackage"
		 DEFAULT  0,
	"VehicleColor"       "sdVehicleString"."VehicleColor"  NOT NULL ,
	"CustomerComment"    "sdLongTextString"."CustomerComments"  NULL ,
	"ModelId"            "sdKey"."SurrogateKeyInteger"  NULL ,
	"PurchaseDate"       "DateYYYYMMDD"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_PurchaseDate"
		 DEFAULT  sysdatetime(),
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "CK_Production_ManufacturerVehicleStock_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Production_ManufacturerVehicleStock_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Production_ManfuacturerVehicleStock_FireAuditTrigger"
		 DEFAULT  'N'
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A produced physical vehicle that a manufacturer has in stock',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for manfacturer vehicle stock',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The stock code of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'StockCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The cost of a vehicle from the manufacturer',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'Cost'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The charge for repairs on a vehicle',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'RepairsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The charge for parts on a vehicle',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'PartsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The charge for delivery of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'DeliveryCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to determine if a vehicle has a premium road handling package',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'IsPremiumRoadHandlingPackage'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The color of the vehicle',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'VehicleColor'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A comment added by a customer',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'CustomerComment'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle models',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'ModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The date of purchase',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'PurchaseDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Production',
@level1type = N'TABLE', @level1name = N'ManufacturerVehicleStock',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

CREATE TABLE "Audit"."ProductionManufacturerModelHistory"
( 
	"ManufacturerModelId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"ManufacturerModelName" "VehicleModelString"  NOT NULL ,
	"ManufacturerModelVariant" "VehicleModelString"  NULL ,
	"ManufacturerVehicleMakeId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"ProductionManufacturerModelHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_ProductionManufacturerVehicleModelHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_ProductionManufacturerModelHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_ProductionManufacturerVehicleModelHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for ManufacturerModel',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle models',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a vehicle model',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a vehicle model variant if applicable',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerModelVariant'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle makes',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in ProductionManufacturerModelHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'ProductionManufacturerModelHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerModelHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

CREATE TABLE "Audit"."ProductionManufacturerVehicleMakeHistory"
( 
	"ManufacturerVehicleMakeId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"ManufacturerVehicleMakeName" "VehicleMakeString"  NOT NULL ,
	"CountryId"          "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"ProductionManufacturerVehicleMakeHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_ProductionManufacturerVehicleMakeHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_ProductionManufacturerVehicleMakeHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_ProductionManufacturerVehicleMakeHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL ,
	"MarketingType"      "sdVehicleString"."VehicleManufacturerMarketingType" 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for ManufacturerVehicleMake',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle makes',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a vehicles make',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleMakeName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for countries',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in ProductionManufacturerVehicleMakeHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'ProductionManufacturerVehicleMakeHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The marketing type of a vehicle make',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleMakeHistory',
@level2type = N'COLUMN', @level2name = N'MarketingType'
go

CREATE TABLE "Audit"."ProductionManufacturerVehicleStockHistory"
( 
	"ManufacturerVehicleStockId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"StockCode"          "sdShortTextString"."StockCode"  NOT NULL ,
	"Cost"               "sdNumber"."Currency"  NOT NULL ,
	"RepairsCharge"      "sdNumber"."Currency"  NOT NULL ,
	"PartsCharge"        "sdNumber"."Currency"  NOT NULL ,
	"DeliveryCharge"     "sdNumber"."Currency"  NOT NULL ,
	"IsPremiumRoadHandlingPackage" "sdFlag"."FlagBit"  NOT NULL ,
	"VehicleColor"       "sdVehicleString"."VehicleColor"  NOT NULL ,
	"CustomerComment"    "sdLongTextString"."CustomerComments"  NULL ,
	"ModelId"            "sdKey"."SurrogateKeyInteger" ,
	"StockId"            "StockIdNumber"  NULL ,
	"PurchaseDate"       "DateYYYYMMDD"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"ProductionManufacturerVehicleStockHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_ProductionManufacturerVehicleStockHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_ProductionManufacturerVehicleStockHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_ProductionManufacturerVehicleStockHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for ManufacturerVehicleStock',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for manfacturer vehicle stock',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The stock code of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'StockCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The cost of a vehicle from the manufacturer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'Cost'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The charge for repairs on a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'RepairsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The charge for parts on a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'PartsCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The charge for delivery of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'DeliveryCharge'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to determine if a vehicle has a premium road handling package',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'IsPremiumRoadHandlingPackage'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The color of the vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'VehicleColor'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A comment added by a customer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'CustomerComment'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for vehicle models',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'ModelId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The internal stock ID number of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'StockId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The date of purchase',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'PurchaseDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in ProductionManufacturerVehicleStockHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'ProductionManufacturerVehicleStockHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'ProductionManufacturerVehicleStockHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

CREATE TABLE "Sales"."SalesCategoryThreshold"
( 
	"SalesCategoryThresholdId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Sales_SalesCategoryThresholdId"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_SalesCategoryThreshold_Id",
	"LowerThreshold"     "sdNumber"."Currency"  NOT NULL ,
	"UpperThreshold"     "sdNumber"."Currency"  NOT NULL ,
	"CategoryDescription" AS         CASE
            WHEN "LowerThreshold" >= 100001.00 THEN 'Very High'
            WHEN "LowerThreshold" BETWEEN 75001.00 AND 100000.00 THEN 'High'
            WHEN "LowerThreshold" BETWEEN 50001.00 AND 75000.00 THEN 'Medium'
            WHEN "LowerThreshold" BETWEEN 25001.00 AND 50000.00 THEN 'Low'
            WHEN "LowerThreshold" BETWEEN 150001.00 AND 250000.00 THEN 'Exceptional'
            WHEN "LowerThreshold" BETWEEN 100001.00 AND 150000.00 THEN 'Very High'
            WHEN "LowerThreshold" BETWEEN 100.00 AND 25000.00 THEN 'Very Low'
            ELSE 'Unknown'
        END COLLATE SQL_Latin1_General_CP1_CI_AS PERSISTED NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesCategoryThreshold_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_SalesCategoryThreshold_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_SalesCategoryThreshold_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The classification of vehicle categories based on price range',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for SalesCategoryThresholdIds',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'SalesCategoryThresholdId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The lowest amount a vehicle in a category is sold for',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'LowerThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The highest amount this vehicle was sold for',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'UpperThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The category description a vehicle sales threshold',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'CategoryDescription'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

CREATE TABLE "Audit"."SalesCustomerHistory"
( 
	"CustomerId"         "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"CustomerName"       "sdNameString"."CustomerName"  NOT NULL ,
	"CustomerAddress1"   "sdAddressesString"."AddressString"  NOT NULL ,
	"CustomerAddress2"   "sdAddressesString"."AddressString"  NULL ,
	"CustomerTown"       "sdAddressesString"."TownString"  NOT NULL ,
	"CustomerPostalCode" "sdAddressesString"."PostalCodeString"  NULL ,
	"CountryId"          "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"IsCustomerReseller" "sdFlag"."FlagBit"  NOT NULL ,
	"IsCustomerCreditRisk" "sdFlag"."FlagBit"  NOT NULL ,
	"SpendCapacity"      "sdMarketingTextString"."CustomerSpendCapacity"  NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"SalesCustomerHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_SalesCustomerHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesCustomerHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_Audit_SalesSalesCustomerHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for Customer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for customers',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The full name of a customer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CustomerName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The street address of a customer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CustomerAddress1'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The extended street address of a customer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CustomerAddress2'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The town or city a customer resides in',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CustomerTown'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The postal code of a customer if applicable',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CustomerPostalCode'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for countries',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'CountryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag to determine if a customer is a reseller',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'IsCustomerReseller'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag to determine if customer is a credit risk',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'IsCustomerCreditRisk'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The spend capacity of a customer',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'SpendCapacity'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in SalesCustomerHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'SalesCustomerHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesCustomerHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

CREATE TABLE "Sales"."SalesOrderVehicle"
( 
	"SalesOrderVehicleId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_SalesOrderVehicle_Id",
	"CustomerId"         "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"StaffId"            "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"InvoiceNumber"      "sdShortTextString"."InvoiceNumber"  NOT NULL ,
	"TotalSalePrice"     "sdNumber"."Currency"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_TotalSalePrice"
		 DEFAULT  0,
	"SaleDate"           "DateYYYYMMDD"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_SaleDate"
		 DEFAULT  sysdatetime(),
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Sales_SalesOrderVehicle_FireAuditTrigger"
		 DEFAULT  'N',
	"SalesCategoryThresholdId" "sdKey"."SurrogateKeyInteger"  NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'An order for the purchase of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for a purchase',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for customers',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for staff members',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The invoice number of an order',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'InvoiceNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The total sale price of an order',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'TotalSalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The date an order was made',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SaleDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for SalesCategoryThresholdIds',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicle',
@level2type = N'COLUMN', @level2name = N'SalesCategoryThresholdId'
go

CREATE TABLE "Sales"."SalesOrderVehicleDetail"
( 
	"SalesOrderVehicleDetailId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_SalesOrderVehicleDetail_Id",
	"SalesOrderVehicleId" "sdKey"."SurrogateKeyInteger"  NULL ,
	"LineItemNumber"     "sdSequenceNumber"."LineItemNumber"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_LineItemNumber"
		 DEFAULT  1,
	"SalePrice"          "sdNumber"."Currency"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_SalePrice"
		 DEFAULT  0,
	"LineItemDiscount"   "sdNumber"."Currency"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_LineItemDiscount"
		 DEFAULT  0,
	"DerivedDiscountedSalePrice" AS "SalePrice" - "LineItemDiscount" PERSISTED NOT NULL ,
	"ManufacturerVehicleStockId" "sdKey"."SurrogateKeyInteger"  NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Sales_SalesOrderVehicleDetail_FireAuditTrigger"
		 DEFAULT  'N',
	"StockCode"          "sdShortTextString"."StockCode"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The details of a vehicle order',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for SalesOrderVehicleDetail Ids',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for a purchase',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The line item number on the invoice',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'LineItemNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The sale price of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The discount of the line item number',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'LineItemDiscount'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The derived discounted sale price of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'DerivedDiscountedSalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for manfacturer vehicle stock',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The stock code of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesOrderVehicleDetail',
@level2type = N'COLUMN', @level2name = N'StockCode'
go

CREATE TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
( 
	"SalesOrderVehicleDetailId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SalesOrderVehicleId" "sdKey"."SurrogateKeyInteger"  NULL ,
	"LineItemNumber"     "sdSequenceNumber"."LineItemNumber"  NOT NULL ,
	"SalePrice"          "sdNumber"."Currency"  NOT NULL ,
	"LineItemDiscount"   "sdNumber"."Currency"  NOT NULL ,
	"ManufacturerVehicleStockId" "sdKey"."SurrogateKeyInteger"  NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"SalesSalesOrderVehicleDetailHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_SalesSalesOrderVehicleDetailHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesSalesOrderVehicleDetailHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"DerivedDiscountedSalePrice" "sdNumber"."Currency" ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_SalesSalesOrderVehicleDetailHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL ,
	"StockCode"          "sdShortTextString"."StockCode"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for SalesOrderVehicleDetail',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for SalesSalesOrderVehicleDetailHistory Ids',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleDetailId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for a purchase',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The line item number on the invoice',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'LineItemNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The sale price of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'SalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The discount of the line item number',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'LineItemDiscount'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for manfacturer vehicle stock',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'ManufacturerVehicleStockId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in SalesSalesOrderVehicleDetailHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'SalesSalesOrderVehicleDetailHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The derived discounted sale price of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'DerivedDiscountedSalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The stock code of a vehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleDetailHistory',
@level2type = N'COLUMN', @level2name = N'StockCode'
go

CREATE TABLE "Audit"."SalesSalesOrderVehicleHistory"
( 
	"SalesOrderVehicleId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"CustomerId"         "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"StaffId"            "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"InvoiceNumber"      "sdShortTextString"."InvoiceNumber"  NOT NULL ,
	"TotalSalePrice"     "sdNumber"."Currency"  NOT NULL ,
	"SaleDate"           "DateYYYYMMDD"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"SalesSalesOrderVehicleHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_SalesSalesOrderVehicleHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesSalesOrderVehicleHistory_Id",
	"Note"               "sdLongTextString"."Note"  NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber"  NOT NULL ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_SalesSalesOrderVehicleHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL ,
	"SalesCategoryThresholdId" "sdKey"."SurrogateKeyInteger"  NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history table for SalesOrderVehicle',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for a purchase',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'SalesOrderVehicleId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for customers',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'CustomerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for staff members',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The invoice number of an order',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'InvoiceNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The total sale price of an order',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'TotalSalePrice'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The date an order was made',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'SaleDate'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for audit entries in SalesSalesOrderVehicleHistory',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'SalesSalesOrderVehicleHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for SalesCategoryThresholdIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesOrderVehicleHistory',
@level2type = N'COLUMN', @level2name = N'SalesCategoryThresholdId'
go

CREATE TABLE "HumanResources"."Staff"
( 
	"StaffId"            "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_HumanResources_Staff_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."HumanResources_Staff_Id",
	"ManagerId"          "sdKey"."SurrogateKeyInteger"  NULL ,
	"StaffName"          "sdNameString"."FullNameString"  NOT NULL ,
	"Department"         "sdBusinessComponentString"."DepartmentString"  NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL 
	CONSTRAINT "DF_HumanResources_Staff_UserAuthorizationId"
		 DEFAULT  1,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_HumanResources_Staff_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_HumanResources_Staff_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_HumanResources_Staff_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_HumanResources_Staff_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_HumanResources_Staff_FireAuditTrigger"
		 DEFAULT  'N'
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A staff member of the business who sells vehicles to customers',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for staff members',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The ID of a staff member that supervises an employee',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'ManagerId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The full name of a staff member',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'StaffName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The department name a staff member works in',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'Department'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'HumanResources',
@level1type = N'TABLE', @level1name = N'Staff',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

CREATE TABLE "DbSecurity"."UserAuthorization"
( 
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_Id_903797191"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."DbSecurity_UserAuthorization_Id",
	"ClassTime"          "sdTimeString"."ClassTimeString" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_ClassTime"
		 DEFAULT  '10:45',
	"IndividualProject"  "sdProjectString"."IndividualProjectNameString" 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_IndividualProject"
		 DEFAULT  'CSCI381 Final Project',
	"GroupMemberLastName" "sdNameString"."LastNameString" ,
	"GroupMemberFirstName" "sdNameString"."FirstNameString" ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_SysStartTime"
		 DEFAULT  sysdatetime(),
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_SysEndTime"
		 DEFAULT  '99991231 23:59:59.9999999',
	"GroupName"          "sdProjectString"."GrouplProjectNameString"  NOT NULL 
	CONSTRAINT "DF_DbSecurity_UserAuthorization_GroupName"
		 DEFAULT  'Group 3'
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The authorization of database actions by a user',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The class time for CSCI381 Data Modeling',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'ClassTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the individual project',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'IndividualProject'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The group members last name',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'GroupMemberLastName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The group members first name',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'GroupMemberFirstName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the group',
@level0type = N'SCHEMA', @level0name = N'DbSecurity',
@level1type = N'TABLE', @level1name = N'UserAuthorization',
@level2type = N'COLUMN', @level2name = N'GroupName'
go

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "PK_Country" PRIMARY KEY  CLUSTERED ("CountryId" ASC)
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "PK_Customer" PRIMARY KEY  CLUSTERED ("CustomerId" ASC)
go

ALTER TABLE "Audit"."HumanResourcesStaffHistory"
	ADD CONSTRAINT "XPKStaffHistory" PRIMARY KEY  CLUSTERED ("StaffHistoryId" ASC)
go

ALTER TABLE "Audit"."LocaleCountryHistory"
	ADD CONSTRAINT "PK_CountryHistory" PRIMARY KEY  CLUSTERED ("LocaleCountryHistoryId" ASC)
go

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "PK_Model_1" PRIMARY KEY  CLUSTERED ("ManufacturerModelId" ASC)
go

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "PK_Make" PRIMARY KEY  CLUSTERED ("ManufacturerVehicleMakeId" ASC)
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "PK_Stock" PRIMARY KEY  CLUSTERED ("ManufacturerVehicleStockId" ASC)
go

ALTER TABLE "Audit"."ProductionManufacturerModelHistory"
	ADD CONSTRAINT "XPK_ModelHistory" PRIMARY KEY  CLUSTERED ("ProductionManufacturerModelHistoryId" ASC)
go

ALTER TABLE "Audit"."ProductionManufacturerVehicleMakeHistory"
	ADD CONSTRAINT "XPK_MakeHistory" PRIMARY KEY  CLUSTERED ("ProductionManufacturerVehicleMakeHistoryId" ASC)
go

ALTER TABLE "Audit"."ProductionManufacturerVehicleStockHistory"
	ADD CONSTRAINT "XPK_StockHistory" PRIMARY KEY  CLUSTERED ("ProductionManufacturerVehicleStockHistoryId" ASC)
go

ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "XPKSales_Category_Threshold" PRIMARY KEY  CLUSTERED ("SalesCategoryThresholdId" ASC)
go

ALTER TABLE "Audit"."SalesCustomerHistory"
	ADD CONSTRAINT "XPK_CustomerHistory" PRIMARY KEY  CLUSTERED ("SalesCustomerHistoryId" ASC)
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "XPKSales_Order_Vehicle" PRIMARY KEY  CLUSTERED ("SalesOrderVehicleId" ASC)
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "PK_SalesDetails" PRIMARY KEY  CLUSTERED ("SalesOrderVehicleDetailId" ASC)
go

ALTER TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
	ADD CONSTRAINT "XPK_SalesDetailsHistory" PRIMARY KEY  CLUSTERED ("SalesSalesOrderVehicleDetailHistoryId" ASC)
go

ALTER TABLE "Audit"."SalesSalesOrderVehicleHistory"
	ADD CONSTRAINT "XPKSalesOrderVehicleHistory" PRIMARY KEY  CLUSTERED ("SalesSalesOrderVehicleHistoryId" ASC)
go

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "XPKStaff" PRIMARY KEY  CLUSTERED ("StaffId" ASC)
go

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "XPKUser_Authorization" PRIMARY KEY  CLUSTERED ("UserAuthorizationId" ASC)
go

CREATE VIEW [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint] AS  SELECT  concat( tbl.TABLE_SCHEMA , '.' , tbl.TABLE_NAME )  AS FullyQualifiedTableName, tbl.TABLE_SCHEMA AS SchemaName, tbl.TABLE_NAME AS TableName, col.COLUMN_NAME AS ColumnName, col.ORDINAL_POSITION AS OrdinalPosition,  concat( col.DOMAIN_SCHEMA , '.' , col.DOMAIN_NAME )  AS FullyQualifiedDomainName, col.DOMAIN_NAME AS DomainName, CASE WHEN col.DATA_TYPE = 'varchar' THEN  concat( 'varchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'char' THEN  concat( 'char(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'nvarchar' THEN  concat( 'nvarchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'nchar' THEN  concat( 'nchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'numeric' THEN  concat( 'numeric(' , NUMERIC_PRECISION_RADIX , ', ' , NUMERIC_SCALE , ')' )  WHEN col.DATA_TYPE = 'decimal' THEN  concat( 'decimal(' , NUMERIC_PRECISION_RADIX , ', ' , NUMERIC_SCALE , ')' )  ELSE col.DATA_TYPE END AS DataType, col.IS_NULLABLE AS IsNullable, dcn.DefaultName, col.COLUMN_DEFAULT AS DefaultNameDefinition, cc.CONSTRAINT_NAME AS CheckConstraintRuleName, cc.CHECK_CLAUSE AS CheckConstraintRuleNameDefinition FROM (  SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE ( TABLE_TYPE = 'BASE TABLE' ) ) AS tbl    INNER JOIN   (  SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_SCHEMA, CHARACTER_SET_NAME, COLLATION_CATALOG, COLLATION_SCHEMA, COLLATION_NAME, DOMAIN_CATALOG, DOMAIN_SCHEMA, DOMAIN_NAME FROM INFORMATION_SCHEMA.COLUMNS ) AS col  ON col.TABLE_CATALOG = tbl.TABLE_CATALOG AND col.TABLE_SCHEMA = tbl.TABLE_SCHEMA AND col.TABLE_NAME = tbl.TABLE_NAME   LEFT OUTER JOIN   (  SELECT t.name AS TableName,  schema_name( s.schema_id )  AS SchemaName, ac.name AS ColumnName, d.name AS DefaultName FROM sys.all_columns AS ac   INNER JOIN   sys.tables AS t ON ac.object_id = t.object_id   INNER JOIN   sys.schemas AS s ON t.schema_id = s.schema_id   INNER JOIN   sys.default_constraints AS d ON ac.default_object_id = d.object_id ) AS dcn  ON dcn.SchemaName = tbl.TABLE_SCHEMA AND dcn.TableName = tbl.TABLE_NAME AND dcn.ColumnName = col.COLUMN_NAME   LEFT OUTER JOIN   (  SELECT cu.TABLE_CATALOG, cu.TABLE_SCHEMA, cu.TABLE_NAME, cu.COLUMN_NAME, c.CONSTRAINT_CATALOG, c.CONSTRAINT_SCHEMA, c.CONSTRAINT_NAME, c.CHECK_CLAUSE FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cu   INNER JOIN   INFORMATION_SCHEMA.CHECK_CONSTRAINTS AS c ON c.CONSTRAINT_NAME = cu.CONSTRAINT_NAME ) AS cc  ON cc.TABLE_SCHEMA = tbl.TABLE_SCHEMA AND cc.TABLE_NAME = tbl.TABLE_NAME AND cc.COLUMN_NAME = col.COLUMN_NAME
go


ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_CountryISO3"
		CHECK  ( "CountryISO3" LIKE '[A-Z][A-Z][A-Z]' ) 
go

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_CountryISO2"
		CHECK  ( "CountryISO2" LIKE '[A-Z][A-Z]' ) 
go

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "FK_Locale.Country_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_IsCustomerReseller"
		CHECK  ( "IsCustomerReseller"=0 OR "IsCustomerReseller"=1 ) 
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "BCK_TemplateTable_ValidBit_161407054"
		CHECK  ( "IsCustomerCreditRisk"=0 OR "IsCustomerCreditRisk"=1 ) 
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "FK_Sales.Customer_Locale.Country" FOREIGN KEY ("CountryId") REFERENCES "Locale"."Country"("CountryId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "FK_Sales.Customer_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Audit"."HumanResourcesStaffHistory"
	ADD CONSTRAINT "CK_Audit_HumanResourcesStaffHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Audit"."LocaleCountryHistory"
	ADD CONSTRAINT "CK_LocaleCountryHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "CK_Production_ManufacturerModel_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "CK_Production_ManufacturerModel_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "CK_Production_ManufacturerModel_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "FK_Production.ManufacturerModel_Production.ManufacturerVehicleMake" FOREIGN KEY ("ManufacturerVehicleMakeId") REFERENCES "Production"."ManufacturerVehicleMake"("ManufacturerVehicleMakeId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "FK_Production.ManufacturerModel_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleMake_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleMake_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleMakel_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "FK_Production.ManufacturerVehicleMake_Locale.Country" FOREIGN KEY ("CountryId") REFERENCES "Locale"."Country"("CountryId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_Cost"
		CHECK  ( "Cost" >= 0 ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_RepairsCharge"
		CHECK  ( "RepairsCharge" >= 0 ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_PartsCharge"
		CHECK  ( "PartsCharge" >= 0 ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_DeliveryCharge"
		CHECK  ( "DeliveryCharge" >= 0 ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_IsPremiumRoadHandlingPackage"
		CHECK  ( "IsPremiumRoadHandlingPackage"=0 OR "IsPremiumRoadHandlingPackage"=1 ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManfuacturerVehicleStock_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "FK_Production.ManufacturerVehicleStock_Production.ManufacturerModel" FOREIGN KEY ("ModelId") REFERENCES "Production"."ManufacturerModel"("ManufacturerModelId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Audit"."ProductionManufacturerModelHistory"
	ADD CONSTRAINT "CK_ProductionManufacturerVehicleModelHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Audit"."ProductionManufacturerVehicleMakeHistory"
	ADD CONSTRAINT "CK_Audit_ProductionManufacturerVehicleHistory_AuditDateTimeStamp"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Audit"."ProductionManufacturerVehicleStockHistory"
	ADD CONSTRAINT "CK_ProductionManufacturerVehicleStockHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "CK_Sales_SalesCategoryThreshold_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "CK_Sales_SalesCategoryThreshold_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go


ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "FK_Sales.SalesCategoryThreshold_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Audit"."SalesCustomerHistory"
	ADD CONSTRAINT "CK_Audit_SalesSalesCustomerHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_TotalSalePrice"
		CHECK  ( "TotalSalePrice" >= 0 ) 
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicle_Sales.Customer" FOREIGN KEY ("CustomerId") REFERENCES "Sales"."Customer"("CustomerId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicle_HumanResources.Staff" FOREIGN KEY ("StaffId") REFERENCES "HumanResources"."Staff"("StaffId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicle_Sales.SalesCategoryThreshold" FOREIGN KEY ("SalesCategoryThresholdId") REFERENCES "Sales"."SalesCategoryThreshold"("SalesCategoryThresholdId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_SalePrice"
		CHECK  ( "SalePrice" >= 0 ) 
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_LineItemDiscount"
		CHECK  ( "LineItemDiscount" >= 0 ) 
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle" FOREIGN KEY ("SalesOrderVehicleId") REFERENCES "Sales"."SalesOrderVehicle"("SalesOrderVehicleId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleStock" FOREIGN KEY ("ManufacturerVehicleStockId") REFERENCES "Production"."ManufacturerVehicleStock"("ManufacturerVehicleStockId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
	ADD CONSTRAINT "CK_SalesSalesOrderVehicleDetailHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Audit"."SalesSalesOrderVehicleHistory"
	ADD CONSTRAINT "CK_SalesSalesOrderVehicleHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "CK_HumanResources_Staff_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "CK_HumanResources_Staff_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "FK_HumanResources.Staff_HumanResources.Staff" FOREIGN KEY ("ManagerId") REFERENCES "HumanResources"."Staff"("StaffId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "FK_HumanResources.Staff_DbSecurity.UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "CK_DbSecurity_UserAuthorization_ClassTime"
		CHECK  ( "ClassTime" LIKE '[0-1][0-9]:[0-5][0-9]'
OR
"ClassTime" LIKE '[0-2][0-4]:[0-5][0-9]' ) 
go

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "CK_DbSecurity_UserAuthorization_SysStartTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "CK_DbSecurity_UserAuthorization_SysEndTime"
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The fully qualified name of a table',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'FullyQualifiedTableName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a schema',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'SchemaName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of a table',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'TableName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The name of the column',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'ColumnName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'An ordinal position',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'OrdinalPosition'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The fully qualified name of a domain',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'FullyQualifiedDomainName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The domain name',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'DomainName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The data type for a column',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'DataType'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry is nullable',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'IsNullable'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The default name',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'DefaultName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The default name definition',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'DefaultNameDefinition'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The rule name of a check constraint',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'CheckConstraintRuleName'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The definition of a check constraint rule name',
@level0type = N'SCHEMA', @level0name = N'Utils',
@level1type = N'VIEW', @level1name = N'uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint',
@level2type = N'COLUMN', @level2name = N'CheckConstraintRuleNameDefinition'
go

CREATE TRIGGER Locale.tD_Country ON Locale.Country FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Country */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Locale.Country is the country location of Production.ManufacturerVehicleMake on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00045788", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_Locale.Country", FK_COLUMNS="CountryId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleMake
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleMake,deleted," = "," AND") */
        Production.ManufacturerVehicleMake.CountryId = deleted.CountryId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Locale.Country because Production.ManufacturerVehicleMake exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Locale.Country is the country location of Sales.Customer on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Sales.Customer_Locale.Country", FK_COLUMNS="CountryId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.Customer
      WHERE
        /*  %JoinFKPK(Sales.Customer,deleted," = "," AND") */
        Sales.Customer.CountryId = deleted.CountryId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Locale.Country because Sales.Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Locale.Country on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Locale", CHILD_TABLE="Country"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Locale.Country_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Locale.Country
          WHERE
            /* %JoinFKPK(Locale.Country,DbSecurity.UserAuthorization," = "," AND") */
            Locale.Country.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Locale.Country because DbSecurity.UserAuthorization exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Locale.tU_Country ON Locale.Country FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Country */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCountryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Locale.Country is the country location of Production.ManufacturerVehicleMake on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004a694", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_Locale.Country", FK_COLUMNS="CountryId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CountryId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleMake
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleMake,deleted," = "," AND") */
        Production.ManufacturerVehicleMake.CountryId = deleted.CountryId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Locale.Country because Production.ManufacturerVehicleMake exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Locale.Country is the country location of Sales.Customer on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Sales.Customer_Locale.Country", FK_COLUMNS="CountryId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CountryId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.Customer
      WHERE
        /*  %JoinFKPK(Sales.Customer,deleted," = "," AND") */
        Sales.Customer.CountryId = deleted.CountryId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Locale.Country because Sales.Customer exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Locale.Country on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Locale", CHILD_TABLE="Country"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Locale.Country_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Locale.Country because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_Customer ON Sales.Customer FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Customer */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Sales.Customer purchases Sales.SalesOrderVehicle on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00049316", PARENT_OWNER="Sales", PARENT_TABLE="Customer"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="purchases", C2P_VERB_PHRASE="is purchased by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.Customer", FK_COLUMNS="CustomerId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Sales.Customer because Sales.SalesOrderVehicle exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.Customer on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.Customer_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Sales.Customer
          WHERE
            /* %JoinFKPK(Sales.Customer,DbSecurity.UserAuthorization," = "," AND") */
            Sales.Customer.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.Customer because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Locale.Country is the country location of Sales.Customer on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Sales.Customer_Locale.Country", FK_COLUMNS="CountryId" */
    IF EXISTS (SELECT * FROM deleted,Locale.Country
      WHERE
        /* %JoinFKPK(deleted,Locale.Country," = "," AND") */
        deleted.CountryId = Locale.Country.CountryId AND
        NOT EXISTS (
          SELECT * FROM Sales.Customer
          WHERE
            /* %JoinFKPK(Sales.Customer,Locale.Country," = "," AND") */
            Sales.Customer.CountryId = Locale.Country.CountryId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.Customer because Locale.Country exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tU_Customer ON Sales.Customer FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Customer */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCustomerId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Sales.Customer purchases Sales.SalesOrderVehicle on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004fc72", PARENT_OWNER="Sales", PARENT_TABLE="Customer"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="purchases", C2P_VERB_PHRASE="is purchased by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.Customer", FK_COLUMNS="CustomerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.CustomerId = deleted.CustomerId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Sales.Customer because Sales.SalesOrderVehicle exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.Customer on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.Customer_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.Customer because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Locale.Country is the country location of Sales.Customer on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Sales.Customer_Locale.Country", FK_COLUMNS="CountryId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CountryId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Locale.Country
        WHERE
          /* %JoinFKPK(inserted,Locale.Country) */
          inserted.CountryId = Locale.Country.CountryId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CountryId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.Customer because Locale.Country does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tD_ManufacturerModel ON Production.ManufacturerModel FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ManufacturerModel */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.ManufacturerModel describes Production.ManufacturerVehicleStock on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005c528", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerModel"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="describes", C2P_VERB_PHRASE="is described by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_Production.ManufacturerModel", FK_COLUMNS="ModelId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleStock
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleStock,deleted," = "," AND") */
        Production.ManufacturerVehicleStock.ModelId = deleted.ManufacturerModelId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Production.ManufacturerModel because Production.ManufacturerVehicleStock exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Production.ManufacturerModel on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Production.ManufacturerModel
          WHERE
            /* %JoinFKPK(Production.ManufacturerModel,DbSecurity.UserAuthorization," = "," AND") */
            Production.ManufacturerModel.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.ManufacturerModel because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Production.ManufacturerVehicleMake is the maker of Production.ManufacturerModel on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleMake"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="is the maker of", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_Production.ManufacturerVehicleMake", FK_COLUMNS="ManufacturerVehicleMakeId" */
    IF EXISTS (SELECT * FROM deleted,Production.ManufacturerVehicleMake
      WHERE
        /* %JoinFKPK(deleted,Production.ManufacturerVehicleMake," = "," AND") */
        deleted.ManufacturerVehicleMakeId = Production.ManufacturerVehicleMake.ManufacturerVehicleMakeId AND
        NOT EXISTS (
          SELECT * FROM Production.ManufacturerModel
          WHERE
            /* %JoinFKPK(Production.ManufacturerModel,Production.ManufacturerVehicleMake," = "," AND") */
            Production.ManufacturerModel.ManufacturerVehicleMakeId = Production.ManufacturerVehicleMake.ManufacturerVehicleMakeId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.ManufacturerModel because Production.ManufacturerVehicleMake exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tU_ManufacturerModel ON Production.ManufacturerModel FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ManufacturerModel */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insManufacturerModelId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.ManufacturerModel describes Production.ManufacturerVehicleStock on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005e2aa", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerModel"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="describes", C2P_VERB_PHRASE="is described by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_Production.ManufacturerModel", FK_COLUMNS="ModelId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ManufacturerModelId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleStock
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleStock,deleted," = "," AND") */
        Production.ManufacturerVehicleStock.ModelId = deleted.ManufacturerModelId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Production.ManufacturerModel because Production.ManufacturerVehicleStock exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Production.ManufacturerModel on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.ManufacturerModel because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Production.ManufacturerVehicleMake is the maker of Production.ManufacturerModel on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleMake"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="is the maker of", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_Production.ManufacturerVehicleMake", FK_COLUMNS="ManufacturerVehicleMakeId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ManufacturerVehicleMakeId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Production.ManufacturerVehicleMake
        WHERE
          /* %JoinFKPK(inserted,Production.ManufacturerVehicleMake) */
          inserted.ManufacturerVehicleMakeId = Production.ManufacturerVehicleMake.ManufacturerVehicleMakeId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.ManufacturerVehicleMakeId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.ManufacturerModel because Production.ManufacturerVehicleMake does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tD_ManufacturerVehicleMake ON Production.ManufacturerVehicleMake FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ManufacturerVehicleMake */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.ManufacturerVehicleMake is the maker of Production.ManufacturerModel on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00055c34", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleMake"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="is the maker of", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_Production.ManufacturerVehicleMake", FK_COLUMNS="ManufacturerVehicleMakeId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerModel
      WHERE
        /*  %JoinFKPK(Production.ManufacturerModel,deleted," = "," AND") */
        Production.ManufacturerModel.ManufacturerVehicleMakeId = deleted.ManufacturerVehicleMakeId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Production.ManufacturerVehicleMake because Production.ManufacturerModel exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleMake on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Production.ManufacturerVehicleMake
          WHERE
            /* %JoinFKPK(Production.ManufacturerVehicleMake,DbSecurity.UserAuthorization," = "," AND") */
            Production.ManufacturerVehicleMake.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.ManufacturerVehicleMake because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Locale.Country is the country location of Production.ManufacturerVehicleMake on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_Locale.Country", FK_COLUMNS="CountryId" */
    IF EXISTS (SELECT * FROM deleted,Locale.Country
      WHERE
        /* %JoinFKPK(deleted,Locale.Country," = "," AND") */
        deleted.CountryId = Locale.Country.CountryId AND
        NOT EXISTS (
          SELECT * FROM Production.ManufacturerVehicleMake
          WHERE
            /* %JoinFKPK(Production.ManufacturerVehicleMake,Locale.Country," = "," AND") */
            Production.ManufacturerVehicleMake.CountryId = Locale.Country.CountryId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.ManufacturerVehicleMake because Locale.Country exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tU_ManufacturerVehicleMake ON Production.ManufacturerVehicleMake FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ManufacturerVehicleMake */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insManufacturerVehicleMakeId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.ManufacturerVehicleMake is the maker of Production.ManufacturerModel on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005a2e2", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleMake"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="is the maker of", C2P_VERB_PHRASE="is made by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_Production.ManufacturerVehicleMake", FK_COLUMNS="ManufacturerVehicleMakeId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ManufacturerVehicleMakeId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerModel
      WHERE
        /*  %JoinFKPK(Production.ManufacturerModel,deleted," = "," AND") */
        Production.ManufacturerModel.ManufacturerVehicleMakeId = deleted.ManufacturerVehicleMakeId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Production.ManufacturerVehicleMake because Production.ManufacturerModel exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleMake on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.ManufacturerVehicleMake because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Locale.Country is the country location of Production.ManufacturerVehicleMake on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Locale", PARENT_TABLE="Country"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="is the country location of", C2P_VERB_PHRASE="is located in", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_Locale.Country", FK_COLUMNS="CountryId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CountryId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Locale.Country
        WHERE
          /* %JoinFKPK(inserted,Locale.Country) */
          inserted.CountryId = Locale.Country.CountryId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CountryId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.ManufacturerVehicleMake because Locale.Country does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tD_ManufacturerVehicleStock ON Production.ManufacturerVehicleStock FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on ManufacturerVehicleStock */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Production.ManufacturerVehicleStock is the specific vehicle listed in Sales.SalesOrderVehicleDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0005a085", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleStock"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is the specific vehicle listed in", C2P_VERB_PHRASE="contains the specific vehicle", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleStock", FK_COLUMNS="ManufacturerVehicleStockId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicleDetail
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicleDetail,deleted," = "," AND") */
        Sales.SalesOrderVehicleDetail.ManufacturerVehicleStockId = deleted.ManufacturerVehicleStockId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Production.ManufacturerVehicleStock because Sales.SalesOrderVehicleDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleStock on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Production.ManufacturerVehicleStock
          WHERE
            /* %JoinFKPK(Production.ManufacturerVehicleStock,DbSecurity.UserAuthorization," = "," AND") */
            Production.ManufacturerVehicleStock.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.ManufacturerVehicleStock because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Production.ManufacturerModel describes Production.ManufacturerVehicleStock on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerModel"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="describes", C2P_VERB_PHRASE="is described by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_Production.ManufacturerModel", FK_COLUMNS="ModelId" */
    IF EXISTS (SELECT * FROM deleted,Production.ManufacturerModel
      WHERE
        /* %JoinFKPK(deleted,Production.ManufacturerModel," = "," AND") */
        deleted.ModelId = Production.ManufacturerModel.ManufacturerModelId AND
        NOT EXISTS (
          SELECT * FROM Production.ManufacturerVehicleStock
          WHERE
            /* %JoinFKPK(Production.ManufacturerVehicleStock,Production.ManufacturerModel," = "," AND") */
            Production.ManufacturerVehicleStock.ModelId = Production.ManufacturerModel.ManufacturerModelId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Production.ManufacturerVehicleStock because Production.ManufacturerModel exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Production.tU_ManufacturerVehicleStock ON Production.ManufacturerVehicleStock FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on ManufacturerVehicleStock */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insManufacturerVehicleStockId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Production.ManufacturerVehicleStock is the specific vehicle listed in Sales.SalesOrderVehicleDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005d35b", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleStock"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is the specific vehicle listed in", C2P_VERB_PHRASE="contains the specific vehicle", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleStock", FK_COLUMNS="ManufacturerVehicleStockId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(ManufacturerVehicleStockId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicleDetail
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicleDetail,deleted," = "," AND") */
        Sales.SalesOrderVehicleDetail.ManufacturerVehicleStockId = deleted.ManufacturerVehicleStockId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Production.ManufacturerVehicleStock because Sales.SalesOrderVehicleDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleStock on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.ManufacturerVehicleStock because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Production.ManufacturerModel describes Production.ManufacturerVehicleStock on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerModel"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="describes", C2P_VERB_PHRASE="is described by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_Production.ManufacturerModel", FK_COLUMNS="ModelId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ModelId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Production.ManufacturerModel
        WHERE
          /* %JoinFKPK(inserted,Production.ManufacturerModel) */
          inserted.ModelId = Production.ManufacturerModel.ManufacturerModelId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.ModelId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Production.ManufacturerVehicleStock because Production.ManufacturerModel does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_SalesOrderVehicle ON Sales.SalesOrderVehicle FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SalesOrderVehicle */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Sales.SalesOrderVehicle is described by Sales.SalesOrderVehicleDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0008b0bd", PARENT_OWNER="Sales", PARENT_TABLE="SalesOrderVehicle"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is described by", C2P_VERB_PHRASE="describes", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle", FK_COLUMNS="SalesOrderVehicleId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicleDetail
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicleDetail,deleted," = "," AND") */
        Sales.SalesOrderVehicleDetail.SalesOrderVehicleId = deleted.SalesOrderVehicleId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Sales.SalesOrderVehicle because Sales.SalesOrderVehicleDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Sales.SalesCategoryThreshold is a description of the sale price bounds for Sales.SalesOrderVehicle on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="SalesCategoryThreshold"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="is a description of the sale price bounds for", C2P_VERB_PHRASE="should fall within the price bounds of", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.SalesCategoryThreshold", FK_COLUMNS="SalesCategoryThresholdId" */
    IF EXISTS (SELECT * FROM deleted,Sales.SalesCategoryThreshold
      WHERE
        /* %JoinFKPK(deleted,Sales.SalesCategoryThreshold," = "," AND") */
        deleted.SalesCategoryThresholdId = Sales.SalesCategoryThreshold.SalesCategoryThresholdId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicle
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicle,Sales.SalesCategoryThreshold," = "," AND") */
            Sales.SalesOrderVehicle.SalesCategoryThresholdId = Sales.SalesCategoryThreshold.SalesCategoryThresholdId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicle because Sales.SalesCategoryThreshold exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicle on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicle
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicle,DbSecurity.UserAuthorization," = "," AND") */
            Sales.SalesOrderVehicle.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicle because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Staff handles the sale of Sales.SalesOrderVehicle on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="handles the sale of", C2P_VERB_PHRASE="is sold by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_HumanResources.Staff", FK_COLUMNS="StaffId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.Staff
      WHERE
        /* %JoinFKPK(deleted,HumanResources.Staff," = "," AND") */
        deleted.StaffId = HumanResources.Staff.StaffId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicle
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicle,HumanResources.Staff," = "," AND") */
            Sales.SalesOrderVehicle.StaffId = HumanResources.Staff.StaffId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicle because HumanResources.Staff exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Sales.Customer purchases Sales.SalesOrderVehicle on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="Customer"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="purchases", C2P_VERB_PHRASE="is purchased by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.Customer", FK_COLUMNS="CustomerId" */
    IF EXISTS (SELECT * FROM deleted,Sales.Customer
      WHERE
        /* %JoinFKPK(deleted,Sales.Customer," = "," AND") */
        deleted.CustomerId = Sales.Customer.CustomerId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicle
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicle,Sales.Customer," = "," AND") */
            Sales.SalesOrderVehicle.CustomerId = Sales.Customer.CustomerId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicle because Sales.Customer exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tU_SalesOrderVehicle ON Sales.SalesOrderVehicle FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SalesOrderVehicle */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesOrderVehicleId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Sales.SalesOrderVehicle is described by Sales.SalesOrderVehicleDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000927fe", PARENT_OWNER="Sales", PARENT_TABLE="SalesOrderVehicle"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is described by", C2P_VERB_PHRASE="describes", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle", FK_COLUMNS="SalesOrderVehicleId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SalesOrderVehicleId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicleDetail
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicleDetail,deleted," = "," AND") */
        Sales.SalesOrderVehicleDetail.SalesOrderVehicleId = deleted.SalesOrderVehicleId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Sales.SalesOrderVehicle because Sales.SalesOrderVehicleDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Sales.SalesCategoryThreshold is a description of the sale price bounds for Sales.SalesOrderVehicle on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="SalesCategoryThreshold"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="is a description of the sale price bounds for", C2P_VERB_PHRASE="should fall within the price bounds of", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.SalesCategoryThreshold", FK_COLUMNS="SalesCategoryThresholdId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SalesCategoryThresholdId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Sales.SalesCategoryThreshold
        WHERE
          /* %JoinFKPK(inserted,Sales.SalesCategoryThreshold) */
          inserted.SalesCategoryThresholdId = Sales.SalesCategoryThreshold.SalesCategoryThresholdId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SalesCategoryThresholdId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicle because Sales.SalesCategoryThreshold does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicle on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicle because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Staff handles the sale of Sales.SalesOrderVehicle on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="handles the sale of", C2P_VERB_PHRASE="is sold by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_HumanResources.Staff", FK_COLUMNS="StaffId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(StaffId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.Staff
        WHERE
          /* %JoinFKPK(inserted,HumanResources.Staff) */
          inserted.StaffId = HumanResources.Staff.StaffId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.StaffId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicle because HumanResources.Staff does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Sales.Customer purchases Sales.SalesOrderVehicle on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="Customer"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="purchases", C2P_VERB_PHRASE="is purchased by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.Customer", FK_COLUMNS="CustomerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(CustomerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Sales.Customer
        WHERE
          /* %JoinFKPK(inserted,Sales.Customer) */
          inserted.CustomerId = Sales.Customer.CustomerId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.CustomerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicle because Sales.Customer does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_SalesOrderVehicleDetail ON Sales.SalesOrderVehicleDetail FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SalesOrderVehicleDetail */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicleDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00061dd3", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicleDetail
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicleDetail,DbSecurity.UserAuthorization," = "," AND") */
            Sales.SalesOrderVehicleDetail.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicleDetail because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Production.ManufacturerVehicleStock is the specific vehicle listed in Sales.SalesOrderVehicleDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleStock"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is the specific vehicle listed in", C2P_VERB_PHRASE="contains the specific vehicle", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleStock", FK_COLUMNS="ManufacturerVehicleStockId" */
    IF EXISTS (SELECT * FROM deleted,Production.ManufacturerVehicleStock
      WHERE
        /* %JoinFKPK(deleted,Production.ManufacturerVehicleStock," = "," AND") */
        deleted.ManufacturerVehicleStockId = Production.ManufacturerVehicleStock.ManufacturerVehicleStockId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicleDetail
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicleDetail,Production.ManufacturerVehicleStock," = "," AND") */
            Sales.SalesOrderVehicleDetail.ManufacturerVehicleStockId = Production.ManufacturerVehicleStock.ManufacturerVehicleStockId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicleDetail because Production.ManufacturerVehicleStock exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* Sales.SalesOrderVehicle is described by Sales.SalesOrderVehicleDetail on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="SalesOrderVehicle"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is described by", C2P_VERB_PHRASE="describes", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle", FK_COLUMNS="SalesOrderVehicleId" */
    IF EXISTS (SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /* %JoinFKPK(deleted,Sales.SalesOrderVehicle," = "," AND") */
        deleted.SalesOrderVehicleId = Sales.SalesOrderVehicle.SalesOrderVehicleId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesOrderVehicleDetail
          WHERE
            /* %JoinFKPK(Sales.SalesOrderVehicleDetail,Sales.SalesOrderVehicle," = "," AND") */
            Sales.SalesOrderVehicleDetail.SalesOrderVehicleId = Sales.SalesOrderVehicle.SalesOrderVehicleId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesOrderVehicleDetail because Sales.SalesOrderVehicle exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tU_SalesOrderVehicleDetail ON Sales.SalesOrderVehicleDetail FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SalesOrderVehicleDetail */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesOrderVehicleDetailId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicleDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00064981", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicleDetail because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Production.ManufacturerVehicleStock is the specific vehicle listed in Sales.SalesOrderVehicleDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Production", PARENT_TABLE="ManufacturerVehicleStock"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is the specific vehicle listed in", C2P_VERB_PHRASE="contains the specific vehicle", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Production.ManufacturerVehicleStock", FK_COLUMNS="ManufacturerVehicleStockId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ManufacturerVehicleStockId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Production.ManufacturerVehicleStock
        WHERE
          /* %JoinFKPK(inserted,Production.ManufacturerVehicleStock) */
          inserted.ManufacturerVehicleStockId = Production.ManufacturerVehicleStock.ManufacturerVehicleStockId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.ManufacturerVehicleStockId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicleDetail because Production.ManufacturerVehicleStock does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* Sales.SalesOrderVehicle is described by Sales.SalesOrderVehicleDetail on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="Sales", PARENT_TABLE="SalesOrderVehicle"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="is described by", C2P_VERB_PHRASE="describes", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_Sales.SalesOrderVehicle", FK_COLUMNS="SalesOrderVehicleId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(SalesOrderVehicleId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,Sales.SalesOrderVehicle
        WHERE
          /* %JoinFKPK(inserted,Sales.SalesOrderVehicle) */
          inserted.SalesOrderVehicleId = Sales.SalesOrderVehicle.SalesOrderVehicleId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.SalesOrderVehicleId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesOrderVehicleDetail because Sales.SalesOrderVehicle does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER HumanResources.tD_Staff ON HumanResources.Staff FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Staff */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* HumanResources.Staff handles the sale of Sales.SalesOrderVehicle on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000607ff", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="handles the sale of", C2P_VERB_PHRASE="is sold by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_HumanResources.Staff", FK_COLUMNS="StaffId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.StaffId = deleted.StaffId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.Staff because Sales.SalesOrderVehicle exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Staff manages HumanResources.Staff on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="manages", C2P_VERB_PHRASE="is managed by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_HumanResources.Staff", FK_COLUMNS="ManagerId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Staff
      WHERE
        /*  %JoinFKPK(HumanResources.Staff,deleted," = "," AND") */
        HumanResources.Staff.ManagerId = deleted.StaffId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete HumanResources.Staff because HumanResources.Staff exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes HumanResources.Staff on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.Staff
          WHERE
            /* %JoinFKPK(HumanResources.Staff,DbSecurity.UserAuthorization," = "," AND") */
            HumanResources.Staff.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.Staff because DbSecurity.UserAuthorization exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* HumanResources.Staff manages HumanResources.Staff on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="manages", C2P_VERB_PHRASE="is managed by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_HumanResources.Staff", FK_COLUMNS="ManagerId" */
    IF EXISTS (SELECT * FROM deleted,HumanResources.Staff
      WHERE
        /* %JoinFKPK(deleted,HumanResources.Staff," = "," AND") */
        deleted.ManagerId = HumanResources.Staff.StaffId AND
        NOT EXISTS (
          SELECT * FROM HumanResources.Staff
          WHERE
            /* %JoinFKPK(HumanResources.Staff,HumanResources.Staff," = "," AND") */
            HumanResources.Staff.ManagerId = HumanResources.Staff.StaffId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last HumanResources.Staff because HumanResources.Staff exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER HumanResources.tU_Staff ON HumanResources.Staff FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Staff */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStaffId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* HumanResources.Staff handles the sale of Sales.SalesOrderVehicle on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0006736d", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="handles the sale of", C2P_VERB_PHRASE="is sold by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_HumanResources.Staff", FK_COLUMNS="StaffId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StaffId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.StaffId = deleted.StaffId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.Staff because Sales.SalesOrderVehicle exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Staff manages HumanResources.Staff on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="manages", C2P_VERB_PHRASE="is managed by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_HumanResources.Staff", FK_COLUMNS="ManagerId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(StaffId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Staff
      WHERE
        /*  %JoinFKPK(HumanResources.Staff,deleted," = "," AND") */
        HumanResources.Staff.ManagerId = deleted.StaffId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update HumanResources.Staff because HumanResources.Staff exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes HumanResources.Staff on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.Staff because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* HumanResources.Staff manages HumanResources.Staff on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="HumanResources", PARENT_TABLE="Staff"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="manages", C2P_VERB_PHRASE="is managed by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_HumanResources.Staff", FK_COLUMNS="ManagerId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(ManagerId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,HumanResources.Staff
        WHERE
          /* %JoinFKPK(inserted,HumanResources.Staff) */
          inserted.ManagerId = HumanResources.Staff.StaffId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.ManagerId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update HumanResources.Staff because HumanResources.Staff does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tD_SalesCategoryThreshold ON Sales.SalesCategoryThreshold FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on SalesCategoryThreshold */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* Sales.SalesCategoryThreshold is a description of the sale price bounds for Sales.SalesOrderVehicle on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00038c0e", PARENT_OWNER="Sales", PARENT_TABLE="SalesCategoryThreshold"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="is a description of the sale price bounds for", C2P_VERB_PHRASE="should fall within the price bounds of", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.SalesCategoryThreshold", FK_COLUMNS="SalesCategoryThresholdId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.SalesCategoryThresholdId = deleted.SalesCategoryThresholdId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete Sales.SalesCategoryThreshold because Sales.SalesOrderVehicle exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.SalesCategoryThreshold on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesCategoryThreshold"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesCategoryThreshold_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (SELECT * FROM deleted,DbSecurity.UserAuthorization
      WHERE
        /* %JoinFKPK(deleted,DbSecurity.UserAuthorization," = "," AND") */
        deleted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId AND
        NOT EXISTS (
          SELECT * FROM Sales.SalesCategoryThreshold
          WHERE
            /* %JoinFKPK(Sales.SalesCategoryThreshold,DbSecurity.UserAuthorization," = "," AND") */
            Sales.SalesCategoryThreshold.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last Sales.SalesCategoryThreshold because DbSecurity.UserAuthorization exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER Sales.tU_SalesCategoryThreshold ON Sales.SalesCategoryThreshold FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on SalesCategoryThreshold */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesCategoryThresholdId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* Sales.SalesCategoryThreshold is a description of the sale price bounds for Sales.SalesOrderVehicle on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003b7a6", PARENT_OWNER="Sales", PARENT_TABLE="SalesCategoryThreshold"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="is a description of the sale price bounds for", C2P_VERB_PHRASE="should fall within the price bounds of", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_Sales.SalesCategoryThreshold", FK_COLUMNS="SalesCategoryThresholdId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(SalesCategoryThresholdId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.SalesCategoryThresholdId = deleted.SalesCategoryThresholdId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update Sales.SalesCategoryThreshold because Sales.SalesOrderVehicle exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.SalesCategoryThreshold on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesCategoryThreshold"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesCategoryThreshold_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,DbSecurity.UserAuthorization
        WHERE
          /* %JoinFKPK(inserted,DbSecurity.UserAuthorization) */
          inserted.UserAuthorizationId = DbSecurity.UserAuthorization.UserAuthorizationId
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.UserAuthorizationId IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update Sales.SalesCategoryThreshold because DbSecurity.UserAuthorization does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER DbSecurity.tD_UserAuthorization ON DbSecurity.UserAuthorization FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on UserAuthorization */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicle on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000d1366", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Sales.SalesOrderVehicle exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes HumanResources.Staff on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Staff
      WHERE
        /*  %JoinFKPK(HumanResources.Staff,deleted," = "," AND") */
        HumanResources.Staff.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because HumanResources.Staff exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicleDetail on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicleDetail
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicleDetail,deleted," = "," AND") */
        Sales.SalesOrderVehicleDetail.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Sales.SalesOrderVehicleDetail exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.SalesCategoryThreshold on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesCategoryThreshold"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesCategoryThreshold_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesCategoryThreshold
      WHERE
        /*  %JoinFKPK(Sales.SalesCategoryThreshold,deleted," = "," AND") */
        Sales.SalesCategoryThreshold.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Sales.SalesCategoryThreshold exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleStock on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleStock
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleStock,deleted," = "," AND") */
        Production.ManufacturerVehicleStock.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Production.ManufacturerVehicleStock exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Production.ManufacturerModel on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerModel
      WHERE
        /*  %JoinFKPK(Production.ManufacturerModel,deleted," = "," AND") */
        Production.ManufacturerModel.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Production.ManufacturerModel exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleMake on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleMake
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleMake,deleted," = "," AND") */
        Production.ManufacturerVehicleMake.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Production.ManufacturerVehicleMake exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Sales.Customer on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.Customer_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Sales.Customer
      WHERE
        /*  %JoinFKPK(Sales.Customer,deleted," = "," AND") */
        Sales.Customer.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Sales.Customer exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* DbSecurity.UserAuthorization authorizes Locale.Country on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Locale", CHILD_TABLE="Country"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Locale.Country_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
    IF EXISTS (
      SELECT * FROM deleted,Locale.Country
      WHERE
        /*  %JoinFKPK(Locale.Country,deleted," = "," AND") */
        Locale.Country.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete DbSecurity.UserAuthorization because Locale.Country exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER DbSecurity.tU_UserAuthorization ON DbSecurity.UserAuthorization FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on UserAuthorization */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insUserAuthorizationId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicle on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000e1a14", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicle"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicle_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicle
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicle,deleted," = "," AND") */
        Sales.SalesOrderVehicle.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Sales.SalesOrderVehicle exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes HumanResources.Staff on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="HumanResources", CHILD_TABLE="Staff"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_HumanResources.Staff_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,HumanResources.Staff
      WHERE
        /*  %JoinFKPK(HumanResources.Staff,deleted," = "," AND") */
        HumanResources.Staff.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because HumanResources.Staff exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.SalesOrderVehicleDetail on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesOrderVehicleDetail"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesOrderVehicleDetail_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesOrderVehicleDetail
      WHERE
        /*  %JoinFKPK(Sales.SalesOrderVehicleDetail,deleted," = "," AND") */
        Sales.SalesOrderVehicleDetail.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Sales.SalesOrderVehicleDetail exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.SalesCategoryThreshold on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="SalesCategoryThreshold"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.SalesCategoryThreshold_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.SalesCategoryThreshold
      WHERE
        /*  %JoinFKPK(Sales.SalesCategoryThreshold,deleted," = "," AND") */
        Sales.SalesCategoryThreshold.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Sales.SalesCategoryThreshold exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleStock on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleStock"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleStock_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleStock
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleStock,deleted," = "," AND") */
        Production.ManufacturerVehicleStock.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Production.ManufacturerVehicleStock exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Production.ManufacturerModel on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerModel"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerModel_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerModel
      WHERE
        /*  %JoinFKPK(Production.ManufacturerModel,deleted," = "," AND") */
        Production.ManufacturerModel.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Production.ManufacturerModel exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Production.ManufacturerVehicleMake on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Production", CHILD_TABLE="ManufacturerVehicleMake"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Production.ManufacturerVehicleMake_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Production.ManufacturerVehicleMake
      WHERE
        /*  %JoinFKPK(Production.ManufacturerVehicleMake,deleted," = "," AND") */
        Production.ManufacturerVehicleMake.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Production.ManufacturerVehicleMake exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Sales.Customer on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Sales", CHILD_TABLE="Customer"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Sales.Customer_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Sales.Customer
      WHERE
        /*  %JoinFKPK(Sales.Customer,deleted," = "," AND") */
        Sales.Customer.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Sales.Customer exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* DbSecurity.UserAuthorization authorizes Locale.Country on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="DbSecurity", PARENT_TABLE="UserAuthorization"
    CHILD_OWNER="Locale", CHILD_TABLE="Country"
    P2C_VERB_PHRASE="authorizes", C2P_VERB_PHRASE="is authorized by", 
    FK_CONSTRAINT="FK_Locale.Country_DbSecurity.UserAuthorization", FK_COLUMNS="UserAuthorizationId" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(UserAuthorizationId)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Locale.Country
      WHERE
        /*  %JoinFKPK(Locale.Country,deleted," = "," AND") */
        Locale.Country.UserAuthorizationId = deleted.UserAuthorizationId
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update DbSecurity.UserAuthorization because Locale.Country exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER "Audit"."Trigger_1032" ON "Audit"."SalesCustomerHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "SalesCustomerHistory" */
/* default body for "Trigger_1032" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesCustomerHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1033" ON "Audit"."SalesCustomerHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "SalesCustomerHistory" */
/* default body for "Trigger_1033" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesCustomerHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1034" ON "Audit"."SalesCustomerHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "SalesCustomerHistory" */
/* default body for "Trigger_1034" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesCustomerHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1062" ON "Audit"."LocaleCountryHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "LocaleCountryHistory" */
/* default body for "Trigger_1062" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insLocaleCountryHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1063" ON "Audit"."LocaleCountryHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "LocaleCountryHistory" */
/* default body for "Trigger_1063" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insLocaleCountryHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1064" ON "Audit"."LocaleCountryHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "LocaleCountryHistory" */
/* default body for "Trigger_1064" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insLocaleCountryHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1084" ON "Audit"."ProductionManufacturerVehicleMakeHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "ProductionManufacturerVehicleMakeHistory" */
/* default body for "Trigger_1084" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerVehicleMakeHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1085" ON "Audit"."ProductionManufacturerVehicleMakeHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "ProductionManufacturerVehicleMakeHistory" */
/* default body for "Trigger_1085" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerVehicleMakeHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1086" ON "Audit"."ProductionManufacturerVehicleMakeHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "ProductionManufacturerVehicleMakeHistory" */
/* default body for "Trigger_1086" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerVehicleMakeHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1143" ON "Audit"."SalesSalesOrderVehicleHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "SalesSalesOrderVehicleHistory" */
/* default body for "Trigger_1143" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesSalesOrderVehicleHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1144" ON "Audit"."SalesSalesOrderVehicleHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "SalesSalesOrderVehicleHistory" */
/* default body for "Trigger_1144" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesSalesOrderVehicleHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1145" ON "Audit"."SalesSalesOrderVehicleHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "SalesSalesOrderVehicleHistory" */
/* default body for "Trigger_1145" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesSalesOrderVehicleHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1224" ON "Audit"."ProductionManufacturerVehicleStockHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "ProductionManufacturerVehicleStockHistory" */
/* default body for "Trigger_1224" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerVehicleStockHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1225" ON "Audit"."ProductionManufacturerVehicleStockHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "ProductionManufacturerVehicleStockHistory" */
/* default body for "Trigger_1225" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerVehicleStockHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1226" ON "Audit"."ProductionManufacturerVehicleStockHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "ProductionManufacturerVehicleStockHistory" */
/* default body for "Trigger_1226" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerVehicleStockHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1251" ON "Audit"."ProductionManufacturerModelHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "ProductionManufacturerModelHistory" */
/* default body for "Trigger_1251" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerModelHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1252" ON "Audit"."ProductionManufacturerModelHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "ProductionManufacturerModelHistory" */
/* default body for "Trigger_1252" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerModelHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1253" ON "Audit"."ProductionManufacturerModelHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "ProductionManufacturerModelHistory" */
/* default body for "Trigger_1253" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insProductionManufacturerModelHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1193" ON "Audit"."SalesSalesOrderVehicleDetailHistory"
    AFTER DELETE 
  
  AS
/* erwin Builtin Trigger */
/* DELETE trigger on "SalesSalesOrderVehicleDetailHistory" */
/* default body for "Trigger_1193" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesSalesOrderVehicleDetailHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1194" ON "Audit"."SalesSalesOrderVehicleDetailHistory"
    AFTER UPDATE 
  
  AS
/* erwin Builtin Trigger */
/* UPDATE trigger on "SalesSalesOrderVehicleDetailHistory" */
/* default body for "Trigger_1194" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesSalesOrderVehicleDetailHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



CREATE TRIGGER "Audit"."Trigger_1195" ON "Audit"."SalesSalesOrderVehicleDetailHistory"
    AFTER INSERT 
  
  AS
/* erwin Builtin Trigger */
/* INSERT trigger on "SalesSalesOrderVehicleDetailHistory" */
/* default body for "Trigger_1195" */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insSalesSalesOrderVehicleDetailHistoryId sdKey.SurrogateKeyInteger,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount


  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go

