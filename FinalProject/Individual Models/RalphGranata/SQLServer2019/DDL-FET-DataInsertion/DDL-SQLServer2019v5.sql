

set quoted_identifier on
go

CREATE SCHEMA "Output"
go

CREATE SCHEMA "Utils"
go

CREATE SCHEMA "RawData"
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

CREATE SCHEMA "Hashing"
go

CREATE SCHEMA "CustomViews"
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
	FROM NVARCHAR(100) NULL
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

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesSalesCategoryThresholdHistory_Id" AS bigint
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
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" 
	CONSTRAINT "DF_Sales_SalesCategoryThreshold_TransactionNumber"
		 DEFAULT  1,
	"Note"               "sdLongTextString"."Note" 
	CONSTRAINT "DF_Sales_SalesCategoryThreshold_Note"
		 DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" 
	CONSTRAINT "DF_Sales_SalesCategoryThreshold_FireAuditTrigger"
		 DEFAULT  'N'
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

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Sales',
@level1type = N'TABLE', @level1name = N'SalesCategoryThreshold',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
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
	"ManufacturerVehicleStockId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
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
		 DEFAULT  'N'
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

CREATE TABLE "Audit"."SalesSalesCategoryThresholdHistory"
( 
	"SalesCategoryThresholdId" "sdKey"."SurrogateKeyInteger" ,
	"LowerThreshold"     "sdNumber"."Currency"  NOT NULL ,
	"UpperThreshold"     "sdNumber"."Currency"  NOT NULL ,
	"UserAuthorizationId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SysStartTime"       "sdDateTime"."DateTimestamp"  NULL ,
	"SysEndTime"         "sdDateTime"."DateTimestamp"  NULL ,
	"RowLevelHashKey"    "sdHashKey"."RowLevelHashKey"  NULL ,
	"TransactionNumber"  "sdOrdinalNumber"."TransactionNumber" ,
	"Note"               "sdLongTextString"."Note" ,
	"PriorRowLevelHashKey" "sdHashKey"."RowLevelHashKey" ,
	"FireAuditTrigger"   "sdFlag"."FlagYesNoString" ,
	"AuditDateTimeStamp" "sdDateTime"."DateTimestamp" 
	CONSTRAINT "DF_Audit_SalesSalesCategoryThresholdHistory_AuditDateTimeStamp"
		 DEFAULT  sysdatetime(),
	"DBAction"           "sdAudit"."DbAction"  NOT NULL ,
	"IsDeleted"          "sdFlag"."FlagYesNoString"  NOT NULL ,
	"SalesSalesCategoryThresholdHistoryId" "sdKey"."SurrogateKeyInteger" 
	CONSTRAINT "DF_Audit_SalesSalesCategoryThresholdHistory_Id"
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesSalesCategoryThresholdHistory_Id",
	"CategoryDescription" "sdMarketingTextString"."VehicleSalesThresholdCategory"  NOT NULL 
)
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The audit history for Sales Category Threshold',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for SalesCategoryThresholdIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'SalesCategoryThresholdId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The lowest amount a vehicle in a category is sold for',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'LowerThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The highest amount this vehicle was sold for',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'UpperThreshold'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier for UserAuthorizationIds',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'UserAuthorizationId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The start time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'SysStartTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The end time for a system transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'SysEndTime'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Current row hash key representing all combined columns',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'RowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The transaction number in a series of database transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'TransactionNumber'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A note regarding the database transaction',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'Note'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The prior transaction row level hash key',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'PriorRowLevelHashKey'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A flag to indicate if an audit trigger should be fired',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'FireAuditTrigger'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A timestamp to record audit transactions',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'AuditDateTimeStamp'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Represents the type of action that took place in the database',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'DBAction'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'Flag used to check if an entry has been deleted',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'IsDeleted'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'A unique identifier forSalesSalesCategoryThresholdHistory IDs',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'SalesSalesCategoryThresholdHistoryId'
go

EXEC sp_addextendedproperty
@name = N'MS_Description', @value = N'The category description a vehicle sales threshold',
@level0type = N'SCHEMA', @level0name = N'Audit',
@level1type = N'TABLE', @level1name = N'SalesSalesCategoryThresholdHistory',
@level2type = N'COLUMN', @level2name = N'CategoryDescription'
go

CREATE TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
( 
	"SalesOrderVehicleDetailId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
	"SalesOrderVehicleId" "sdKey"."SurrogateKeyInteger"  NULL ,
	"LineItemNumber"     "sdSequenceNumber"."LineItemNumber"  NOT NULL ,
	"SalePrice"          "sdNumber"."Currency"  NOT NULL ,
	"LineItemDiscount"   "sdNumber"."Currency"  NOT NULL ,
	"ManufacturerVehicleStockId" "sdKey"."SurrogateKeyInteger"  NOT NULL ,
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
	"DBAction"           "sdAudit"."DbAction"  NOT NULL 
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

CREATE NONCLUSTERED INDEX "XIE1Customer" ON "Sales"."Customer"
( 
	"CustomerName"        ASC
)
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

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "XAK1Manufacturer_Vehicle_Stock" UNIQUE ("StockCode"  ASC)
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

ALTER TABLE "Audit"."SalesSalesCategoryThresholdHistory"
	ADD CONSTRAINT "XPKSales_Sales_Category_Threshold_History" PRIMARY KEY  CLUSTERED ("SalesSalesCategoryThresholdHistoryId" ASC)
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

CREATE NONCLUSTERED INDEX "XIE1Staff" ON "HumanResources"."Staff"
( 
	"StaffName"           ASC
)
go

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "XPKUser_Authorization" PRIMARY KEY  CLUSTERED ("UserAuthorizationId" ASC)
go

CREATE NONCLUSTERED INDEX "XIE1User_Authorization" ON "DbSecurity"."UserAuthorization"
( 
	"GroupMemberLastName"  ASC,
	"GroupMemberFirstName"  ASC
)
go

CREATE VIEW "Utils"."uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint" AS  SELECT  concat( tbl.TABLE_SCHEMA , '.' , tbl.TABLE_NAME )  AS FullyQualifiedTableName, tbl.TABLE_SCHEMA AS SchemaName, tbl.TABLE_NAME AS TableName, col.COLUMN_NAME AS ColumnName, col.ORDINAL_POSITION AS OrdinalPosition,  concat( col.DOMAIN_SCHEMA , '.' , col.DOMAIN_NAME )  AS FullyQualifiedDomainName, col.DOMAIN_NAME AS DomainName, CASE WHEN col.DATA_TYPE = 'varchar' THEN  concat( 'varchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'char' THEN  concat( 'char(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'nvarchar' THEN  concat( 'nvarchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'nchar' THEN  concat( 'nchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'numeric' THEN  concat( 'numeric(' , NUMERIC_PRECISION_RADIX , ', ' , NUMERIC_SCALE , ')' )  WHEN col.DATA_TYPE = 'decimal' THEN  concat( 'decimal(' , NUMERIC_PRECISION_RADIX , ', ' , NUMERIC_SCALE , ')' )  ELSE col.DATA_TYPE END AS DataType, col.IS_NULLABLE AS IsNullable, dcn.DefaultName, col.COLUMN_DEFAULT AS DefaultNameDefinition, cc.CONSTRAINT_NAME AS CheckConstraintRuleName, cc.CHECK_CLAUSE AS CheckConstraintRuleNameDefinition FROM (  SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE ( TABLE_TYPE = 'BASE TABLE' ) ) AS tbl    INNER JOIN   (  SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_SCHEMA, CHARACTER_SET_NAME, COLLATION_CATALOG, COLLATION_SCHEMA, COLLATION_NAME, DOMAIN_CATALOG, DOMAIN_SCHEMA, DOMAIN_NAME FROM INFORMATION_SCHEMA.COLUMNS ) AS col  ON col.TABLE_CATALOG = tbl.TABLE_CATALOG AND col.TABLE_SCHEMA = tbl.TABLE_SCHEMA AND col.TABLE_NAME = tbl.TABLE_NAME   LEFT OUTER JOIN   (  SELECT t.name AS TableName,  schema_name( s.schema_id )  AS SchemaName, ac.name AS ColumnName, d.name AS DefaultName FROM sys.all_columns AS ac   INNER JOIN   sys.tables AS t ON ac.object_id = t.object_id   INNER JOIN   sys.schemas AS s ON t.schema_id = s.schema_id   INNER JOIN   sys.default_constraints AS d ON ac.default_object_id = d.object_id ) AS dcn  ON dcn.SchemaName = tbl.TABLE_SCHEMA AND dcn.TableName = tbl.TABLE_NAME AND dcn.ColumnName = col.COLUMN_NAME   LEFT OUTER JOIN   (  SELECT cu.TABLE_CATALOG, cu.TABLE_SCHEMA, cu.TABLE_NAME, cu.COLUMN_NAME, c.CONSTRAINT_CATALOG, c.CONSTRAINT_SCHEMA, c.CONSTRAINT_NAME, c.CHECK_CLAUSE FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cu   INNER JOIN   INFORMATION_SCHEMA.CHECK_CONSTRAINTS AS c ON c.CONSTRAINT_NAME = cu.CONSTRAINT_NAME ) AS cc  ON cc.TABLE_SCHEMA = tbl.TABLE_SCHEMA AND cc.TABLE_NAME = tbl.TABLE_NAME AND cc.COLUMN_NAME = col.COLUMN_NAME
go

CREATE VIEW "Sales"."uvw_Sales2018" AS
SELECT
    YEAR("Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
    "Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    "Sales"."Customer"."CustomerName",
    "Locale"."Country"."CountryName",
    FORMAT("Production"."ManufacturerVehicleStock"."Cost", 'C', 'en-US') as "Cost",
    FORMAT("Production"."ManufacturerVehicleStock"."RepairsCharge", 'C', 'en-US') as RepairCost,
    FORMAT("Production"."ManufacturerVehicleStock"."PartsCharge", 'C', 'en-US') AS "PartsCost",
    FORMAT("Production"."ManufacturerVehicleStock"."DeliveryCharge", 'C', 'en-US') AS "TransportInCost",
    CAST("Sales"."SalesOrderVehicleDetail"."SalePrice" as INT) as "SalePrice",
    TRY_CONVERT(VARCHAR, "Sales"."SalesOrderVehicle"."SaleDate", 101) as SaleDate
FROM
    "Sales"."Customer"
INNER JOIN
    "Sales"."SalesOrderVehicle"
ON
    "Sales"."Customer"."CustomerId" = "Sales"."SalesOrderVehicle"."CustomerId"
INNER JOIN
    "Locale"."Country"
ON
    "Sales"."Customer"."CountryId" = "Locale"."Country"."CountryId"
INNER JOIN
    "Sales"."SalesOrderVehicleDetail"
ON
    "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
INNER JOIN
    "Production"."ManufacturerVehicleStock"
ON
    Sales."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
INNER JOIN
    "Production"."ManufacturerModel"
ON
    "Production"."ManufacturerModel"."ManufacturerModelId" = "Production"."ManufacturerVehicleStock"."ModelId"
INNER JOIN
    "Production"."ManufacturerVehicleMake" 
ON
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId" where YEAR("Sales"."SalesOrderVehicle"."SaleDate") = 2018;
go

CREATE VIEW "Sales"."uvw_SalesByCountry" as 
SELECT
	"Locale"."Country"."CountryName",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
	FORMAT("Production"."ManufacturerVehicleStock"."Cost", 'C', 'en-US') AS "Cost",
	FORMAT("Production"."ManufacturerVehicleStock"."RepairsCharge", 'C', 'en-US') AS "RepairsCost",
	FORMAT("Production"."ManufacturerVehicleStock"."PartsCharge", 'C', 'en-US') AS "PartsCost",
	FORMAT("Production"."ManufacturerVehicleStock"."DeliveryCharge", 'C', 'en-US') AS "TransportInCost",
	"Production"."ManufacturerVehicleStock"."VehicleColor" AS "Color",
	CAST("Sales"."SalesOrderVehicleDetail"."SalePrice" as INT) as SalePrice,
	CAST("Sales"."SalesOrderVehicleDetail"."LineItemDiscount" as INT) as LineItemDiscount,
	"Sales"."SalesOrderVehicle"."InvoiceNumber",
	TRY_CONVERT(VARCHAR, "Sales"."SalesOrderVehicle"."SaleDate", 101) as SaleDate,
	"Sales"."Customer"."CustomerName",
	"Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailId" AS "SalesDetailsID"
FROM
    "Sales"."SalesOrderVehicle"
JOIN
    "Sales"."Customer" ON "Sales"."SalesOrderVehicle"."CustomerId" = "Sales"."Customer"."CustomerId"
JOIN
    "Locale"."Country" ON "Sales"."Customer"."CountryId" = "Locale"."Country"."CountryId"
JOIN
    "Sales"."SalesOrderVehicleDetail" ON "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
JOIN
    "Production"."ManufacturerVehicleStock" ON "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
JOIN
    "Production"."ManufacturerModel" ON "Production"."ManufacturerVehicleStock"."ModelId" = "Production"."ManufacturerModel"."ManufacturerModelId"
JOIN
    "Production"."ManufacturerVehicleMake" ON "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId";


go

CREATE VIEW "Sales"."uvw_PivotTable" AS
SELECT
    "VehicleColor",
    CAST(SUM(CASE WHEN YEAR("SaleDate") = 2015 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2015",
    CAST(SUM(CASE WHEN YEAR("SaleDate") = 2016 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2016",
    CAST(SUM(CASE WHEN YEAR("SaleDate") = 2017 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2017",
    CAST(SUM(CASE WHEN YEAR("SaleDate") = 2018 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2018"
FROM
    "Sales"."SalesOrderVehicle"
JOIN
    "Sales"."SalesOrderVehicleDetail" ON "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
JOIN
    "Production"."ManufacturerVehicleStock" ON "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
GROUP BY
    "VehicleColor";

go

CREATE VIEW "Sales"."uvw_StockPrices" AS
SELECT
    mvsmm."ManufacturerVehicleMakeName" AS "MakeName",
    mm."ManufacturerModelName" AS "ModelName",
    FORMAT(mvs."Cost", '$#,0.00') AS "RetailCost"
FROM
    "Production"."ManufacturerVehicleStock" mvs
    JOIN "Production"."ManufacturerModel" mm 
	ON mvs."ModelId" = mm."ManufacturerModelId"
    JOIN "Production"."ManufacturerVehicleMake" mvsmm 
	ON mm."ManufacturerVehicleMakeId" = mvsmm."ManufacturerVehicleMakeId";


go

CREATE VIEW "Sales"."uvw_SalesText" AS
SELECT
    co."CountryName",
    mvm."ManufacturerVehicleMakeName" AS "MakeName",
    mvs."Cost" AS "Cost",
    sv."TotalSalePrice" AS "SalePrice"
FROM
    "Sales"."SalesOrderVehicle" sv
	JOIN "Sales"."SalesOrderVehicleDetail" svd ON svd."SalesOrderVehicleId" = sv."SalesOrderVehicleId"
    JOIN "Production"."ManufacturerVehicleStock" mvs ON svd."ManufacturerVehicleStockId" = mvs."ManufacturerVehicleStockId"
    JOIN "Production"."ManufacturerModel" mm ON mvs."ModelId" = mm."ManufacturerModelId"
	JOIN "Production"."ManufacturerVehicleMake" mvm ON mvm."ManufacturerVehicleMakeId" = mm."ManufacturerVehicleMakeId"
    JOIN "Sales"."Customer" c ON sv."CustomerId" = c."CustomerId"
    JOIN "Locale"."Country" co ON c."CountryId" = co."CountryId";


go

CREATE VIEW "Sales"."uvw_YearlySales" AS
SELECT
	YEAR("Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    	"Sales"."Customer"."CustomerName",
	"Locale"."Country"."CountryName",
	FORMAT("Production"."ManufacturerVehicleStock"."Cost" , 'C', 'en-US') as "Cost",
    FORMAT("Production"."ManufacturerVehicleStock"."RepairsCharge" , 'C', 'en-US') as "RepairsCost",
    FORMAT("Production"."ManufacturerVehicleStock"."PartsCharge", 'C', 'en-US') AS "PartsCost",
    FORMAT("Production"."ManufacturerVehicleStock"."DeliveryCharge", 'C', 'en-US') AS "TransportInCost",
	CAST("Sales"."SalesOrderVehicleDetail"."SalePrice" AS INT) as "SalePrice",
	TRY_CONVERT(VARCHAR, "Sales"."SalesOrderVehicle"."SaleDate", 101) AS "SaleDate"
FROM
    "Sales"."Customer"
INNER JOIN
    "Sales"."SalesOrderVehicle"
ON
    "Sales"."Customer"."CustomerId" = "Sales"."SalesOrderVehicle"."CustomerId"
INNER JOIN
    "Locale"."Country"
ON
    "Sales"."Customer"."CountryId" = "Locale"."Country"."CountryId"
INNER JOIN
    "Sales"."SalesOrderVehicleDetail"
ON
    "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
INNER JOIN
    "Production"."ManufacturerVehicleStock"
ON
    Sales."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
INNER JOIN
    "Production"."ManufacturerModel"
ON
    "Production"."ManufacturerModel"."ManufacturerModelId" = "Production"."ManufacturerVehicleStock"."ModelId"
INNER JOIN
    "Production"."ManufacturerVehicleMake"
ON
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId";


go

CREATE VIEW "CustomViews"."uvw_ChuanCustomerCountry" as
select SC.CustomerName,LC.CountryName from Sales.Customer as SC INNER JOIN Locale.Country as LC on LC.CountryId = SC.CountryId;
go

CREATE VIEW "CustomViews"."uvw_ChuanMakeCountry" as
select LC.CountryName as Country, PMVM.ManufacturerVehicleMakeName as Make from Production.ManufacturerVehicleMake as PMVM
INNER JOIN Locale.Country as LC on PMVM.CountryId = LC.CountryId;
go

CREATE VIEW "CustomViews"."uvw_ChuanModelMake" as 
select PMM.ManufacturerModelName as Model, PMVM.ManufacturerVehicleMakeName as Make from Production.ManufacturerModel as PMM
INNER JOIN Production.ManufacturerVehicleMake as PMVM on  PMM.ManufacturerVehicleMakeId = PMVM.ManufacturerVehicleMakeId
go

CREATE VIEW "CustomViews"."uvw_ChuanStaffDiscountGiven" as
select HRS.StaffName, FORMAT(SUM(SSOVD.LineItemDiscount), 'C', 'en-US') as DiscountGiven from HumanResources.Staff as HRS
INNER JOIN Sales.SalesOrderVehicle as SSOV on HRS.StaffId = SSOV.StaffId 
INNER JOIN Sales.SalesOrderVehicleDetail as SSOVD on SSOV.SalesOrderVehicleId = SSOVD.SalesOrderVehicleId group by StaffName;
go

CREATE VIEW "CustomViews"."uvw_ChuanStaffSales" as
select HRS.StaffName, FORMAT(SUM(SSOV.TotalSalePrice), 'C', 'en-US') as TotalSales from HumanResources.Staff as HRS 
INNER JOIN Sales.SalesOrderVehicle as SSOV on HRS.StaffId = SSOV.StaffId group by StaffName;
go

CREATE VIEW "CustomViews"."uvw_MehrshadVehicleCost"
as
SELECT
        "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName",
        "Production"."ManufacturerModel"."ManufacturerModelName"            ,
        "Production"."ManufacturerVehicleStock"."Cost"
FROM
        "Sales"."SalesOrderVehicleDetail"
INNER JOIN
        "Sales"."SalesOrderVehicle"
ON
        "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicle"."SalesOrderVehicleId"
INNER JOIN
        "Sales"."Customer"
ON
        "Sales"."SalesOrderVehicle"."CustomerId" = "Sales"."Customer"."CustomerId"
INNER JOIN
        "Production"."ManufacturerVehicleStock"
ON
        "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
INNER JOIN
        "Production"."ManufacturerModel"
INNER JOIN
        "Production"."ManufacturerVehicleMake"
ON
        "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId"
ON
        "Production"."ManufacturerVehicleStock"."ModelId" = "Production"."ManufacturerModel"."ManufacturerModelId"
go

CREATE VIEW "CustomViews"."uvw_MehrshadYearlyCustomerSales"
as
SELECT
        "Sales"."SalesOrderVehicle"."SaleDate"                              ,
        "Sales"."Customer"."CustomerName"                                   ,
        "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName",
        "Production"."ManufacturerModel"."ManufacturerModelName"            ,
        "Sales"."SalesOrderVehicleDetail"."SalePrice"
FROM
        "Sales"."SalesOrderVehicleDetail"
INNER JOIN
        "Sales"."SalesOrderVehicle"
ON
        "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicle"."SalesOrderVehicleId"
INNER JOIN
        "Sales"."Customer"
ON
        "Sales"."SalesOrderVehicle"."CustomerId" = "Sales"."Customer"."CustomerId"
CROSS JOIN
        "Production"."ManufacturerModel"
INNER JOIN
        "Production"."ManufacturerVehicleMake"
ON
        "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId";
go

CREATE VIEW "CustomViews"."uvw_MehrshadYearlySalesProfits"
as
SELECT
    YEAR("Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
    "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
    "Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    "Sales"."Customer"."CustomerName",
    "Production"."ManufacturerVehicleStock"."Cost",
    "Production"."ManufacturerVehicleStock"."RepairsCharge",
    "Production"."ManufacturerVehicleStock"."PartsCharge" AS "PartsCost",
    "Production"."ManufacturerVehicleStock"."DeliveryCharge" AS "TransportInCost",
    "Sales"."SalesOrderVehicleDetail"."SalePrice",
    "Sales"."SalesOrderVehicle"."SaleDate",
    ("Sales"."SalesOrderVehicleDetail"."SalePrice" - "Production"."ManufacturerVehicleStock"."Cost" - "Production"."ManufacturerVehicleStock"."RepairsCharge" - 
	"Production"."ManufacturerVehicleStock"."PartsCharge" - "Production"."ManufacturerVehicleStock"."DeliveryCharge") AS "Profit"
FROM
    "Sales"."Customer"
INNER JOIN
    "Sales"."SalesOrderVehicle"
ON
    "Sales"."Customer"."CustomerId" = "Sales"."SalesOrderVehicle"."CustomerId"
INNER JOIN
    "Sales"."SalesOrderVehicleDetail"
ON
    "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
INNER JOIN
    "Production"."ManufacturerVehicleStock"
ON
    "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
INNER JOIN
    "Production"."ManufacturerModel"
ON
    "Production"."ManufacturerModel"."ManufacturerModelId" = "Production"."ManufacturerVehicleStock"."ModelId"
INNER JOIN
    "Production"."ManufacturerVehicleMake"
ON
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId";

go

CREATE VIEW "CustomViews"."uvw_RalphMakeModelPartsCost" AS
SELECT 
	"mvm"."ManufacturerVehicleMakeName" AS "Make",
	"mm"."ManufacturerModelName" AS "Model",
	"mvs"."PartsCharge" AS "Parts Cost"
FROM 
"Production"."ManufacturerVehicleStock" as "mvs"
INNER JOIN
"Production"."ManufacturerModel" as "mm"
ON "mm"."ManufacturerModelId" = "mvs"."ModelId"
INNER JOIN "Production"."ManufacturerVehicleMake" as "mvm"
ON "mm"."ManufacturerVehicleMakeId" = "mvm"."ManufacturerVehicleMakeId";
go

CREATE VIEW "CustomViews"."uvw_RalphEmployeeManager"
as
SELECT 
	"emp"."StaffName" as "Employee Name",
	"emp"."Department" as "Employee Department",
	"mgr"."StaffName" as "Manager Name",
	"mgr"."Department" as "Manager Department"
FROM
"HumanResources"."Staff" AS "emp"
INNER JOIN
"HumanResources"."Staff" AS "mgr"
ON "emp"."ManagerId" = "mgr"."StaffId";
go

CREATE VIEW "CustomViews"."uvw_RalphSalesPerCategoryThreshold" AS
SELECT 
	"sct"."CategoryDescription",
	COUNT("sov"."SalesOrderVehicleId") as "Number of Sales"
FROM
"Sales"."SalesOrderVehicle" as "sov"
INNER JOIN
"Sales"."SalesCategoryThreshold" as "sct"
ON "sov"."TotalSalePrice" >= "sct"."LowerThreshold"
AND
"sov"."TotalSalePrice" <= "sct"."UpperThreshold"
GROUP BY "sct"."CategoryDescription";
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
	ADD CONSTRAINT "FK_Country_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
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
	ADD CONSTRAINT "FK_Customer_Country" FOREIGN KEY ("CountryId") REFERENCES "Locale"."Country"("CountryId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "FK_Customer_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Audit"."HumanResourcesStaffHistory"
	ADD CONSTRAINT "CK_Audit_HumanResourcesStaffHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
go


ALTER TABLE "Audit"."LocaleCountryHistory"
	ADD CONSTRAINT "CK_Audit_LocaleCountryHistory_DBAction"
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
	ADD CONSTRAINT "FK_ManufacturerModel_ManufacturerVehicleMake" FOREIGN KEY ("ManufacturerVehicleMakeId") REFERENCES "Production"."ManufacturerVehicleMake"("ManufacturerVehicleMakeId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "FK_ManufacturerModel_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
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
	ADD CONSTRAINT "FK_ManufacturerVehicleMake_Country" FOREIGN KEY ("CountryId") REFERENCES "Locale"."Country"("CountryId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "FK_ManufacturerVehicleMake_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
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
	ADD CONSTRAINT "FK_ManufacturerVehicleStock_ManufacturerModel" FOREIGN KEY ("ModelId") REFERENCES "Production"."ManufacturerModel"("ManufacturerModelId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "FK_ManufacturerVehicleStock_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
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
	ADD CONSTRAINT "CK_Sales_SalesCategoryThreshold_FireAuditTrigger"
		CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) 
go


ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "FK_SalesCategoryThreshold_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
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
	ADD CONSTRAINT "FK_SalesOrderVehicle_Customer" FOREIGN KEY ("CustomerId") REFERENCES "Sales"."Customer"("CustomerId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_Staff" FOREIGN KEY ("StaffId") REFERENCES "HumanResources"."Staff"("StaffId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_SalesCategoryThreshold" FOREIGN KEY ("SalesCategoryThresholdId") REFERENCES "Sales"."SalesCategoryThreshold"("SalesCategoryThresholdId")
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
	ADD CONSTRAINT "FK_SalesOrderVehicleDetail_SalesOrderVehicle" FOREIGN KEY ("SalesOrderVehicleId") REFERENCES "Sales"."SalesOrderVehicle"("SalesOrderVehicleId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_SalesOrderVehicleDetail_ManufacturerVehicleStock" FOREIGN KEY ("ManufacturerVehicleStockId") REFERENCES "Production"."ManufacturerVehicleStock"("ManufacturerVehicleStockId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_SalesOrderVehicleDetail_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE "Audit"."SalesSalesCategoryThresholdHistory"
	ADD CONSTRAINT "CK_Audit_SalesSalesCategoryThresholdHistory_DBAction"
		CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) 
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
	ADD CONSTRAINT "FK_Staff_Staff" FOREIGN KEY ("ManagerId") REFERENCES "HumanResources"."Staff"("StaffId")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "FK_Staff_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
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
