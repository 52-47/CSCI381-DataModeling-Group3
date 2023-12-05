
CREATE SCHEMA "Audit";

CREATE SCHEMA "CustomViews";

CREATE SCHEMA "DbSecurity";

CREATE SCHEMA "dEuropeanCarManufacturer";

CREATE SCHEMA "Hashing";

CREATE SCHEMA "HumanResources";

CREATE SCHEMA "Locale";

CREATE SCHEMA "Output";

CREATE SCHEMA "Production";

CREATE SCHEMA "RawData";

CREATE SCHEMA "Sales";

CREATE SCHEMA "sdAddressesString";

CREATE SCHEMA "sdAudit";

CREATE SCHEMA "sdBlob";

CREATE SCHEMA "sdBusinessComponentString";

CREATE SCHEMA "sdCountryStringVariant";

CREATE SCHEMA "sdDate";

CREATE SCHEMA "sdDateTime";

CREATE SCHEMA "sdFlag";

CREATE SCHEMA "sdHashKey";

CREATE SCHEMA "sdKey";

CREATE SCHEMA "sdLongTextString";

CREATE SCHEMA "sdMarketingTextString";

CREATE SCHEMA "sdNameString";

CREATE SCHEMA "sdNumber";

CREATE SCHEMA "sdOrdinalNumber";

CREATE SCHEMA "sdProjectString";

CREATE SCHEMA "sdSequenceNumber";

CREATE SCHEMA "sdShortTextString";

CREATE SCHEMA "sdString";

CREATE SCHEMA "sdTimeString";

CREATE SCHEMA "sdVehicleString";

CREATE SCHEMA "SequenceIdInsert";

CREATE SCHEMA "Utils";

CREATE Domain "sdAddressesString"."AddressString"
	AS VARCHAR(60) NULL;

COMMENT ON  DOMAIN "sdAddressesString"."AddressString"
	 IS 'for street addresses';

CREATE Domain "sdTimeString"."ClassTimeString"
	AS CHAR(5) NULL;

COMMENT ON  DOMAIN "sdTimeString"."ClassTimeString"
	 IS 'for representing class time as a string';

CREATE Domain "sdCountryStringVariant"."CountryISO2"
	AS VARCHAR(2) NULL;

COMMENT ON  DOMAIN "sdCountryStringVariant"."CountryISO2"
	 IS 'for Country ISO 2 characters';

CREATE Domain "sdCountryStringVariant"."CountryISO3"
	AS CHAR(3) NULL;

COMMENT ON  DOMAIN "sdCountryStringVariant"."CountryISO3"
	 IS 'for country ISO 3 characters
';

CREATE Domain "sdAddressesString"."CountryString"
	AS VARCHAR(50) NULL;

COMMENT ON  DOMAIN "sdAddressesString"."CountryString"
	 IS 'for country names';

CREATE Domain "sdNumber"."Currency"
	AS NUMERIC(18,2) NULL;

COMMENT ON  DOMAIN "sdNumber"."Currency"
	 IS 'for currency amounts';

CREATE Domain "sdLongTextString"."CustomerComments"
	AS VARCHAR(200) NULL;

COMMENT ON  DOMAIN "sdLongTextString"."CustomerComments"
	 IS 'for customer comments';

CREATE Domain "sdNameString"."CustomerName"
	AS VARCHAR(65) NULL;

COMMENT ON  DOMAIN "sdNameString"."CustomerName"
	 IS 'for customer or business name';

CREATE Domain "sdMarketingTextString"."CustomerSpendCapacity"
	AS VARCHAR(15) NULL;

COMMENT ON  DOMAIN "sdMarketingTextString"."CustomerSpendCapacity"
	 IS 'for the spending capacity of a customer';

CREATE Domain "sdDateTime"."DateTimestamp"
	AS TIMESTAMP NOT NULL;

CREATE Domain "sdDate"."DateYYYYMMDD"
	AS DATE NULL;

COMMENT ON  DOMAIN "sdDate"."DateYYYYMMDD"
	 IS 'date string YYYYMMDD';

CREATE Domain "sdAudit"."DbAction"
	AS CHAR(1) NULL;

COMMENT ON  DOMAIN "sdAudit"."DbAction"
	 IS 'for database actions';

CREATE Domain "sdBusinessComponentString"."DepartmentString"
	AS VARCHAR(15) NULL;

COMMENT ON  DOMAIN "sdBusinessComponentString"."DepartmentString"
	 IS 'for department name';

CREATE Domain "dEuropeanCarManufacturer"
	AS CHAR(18) NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"
	 IS 'The top level domain for European Car Manufacturer Data Model';

CREATE Domain "sdNameString"."FirstNameString"
	AS VARCHAR(25) NOT NULL;

COMMENT ON  DOMAIN "sdNameString"."FirstNameString"
	 IS 'for first names';

CREATE Domain "sdFlag"."FlagBit"
	AS INTEGER NULL;

COMMENT ON  DOMAIN "sdFlag"."FlagBit"
	 IS 'integer flag bit';

CREATE Domain "sdFlag"."FlagYesNoString"
	AS CHAR(1) NOT NULL;

COMMENT ON  DOMAIN "sdFlag"."FlagYesNoString"
	 IS 'for a flag to indicating Yes or No';

CREATE Domain "sdNameString"."FullNameString"
	AS VARCHAR(60) NOT NULL;

COMMENT ON  DOMAIN "sdNameString"."FullNameString"
	 IS 'for full names';

CREATE Domain "sdProjectString"."GrouplProjectNameString"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdProjectString"."GrouplProjectNameString"
	 IS 'for the group project name';

CREATE Domain "sdProjectString"."IndividualProjectNameString"
	AS VARCHAR(60) NULL;

COMMENT ON  DOMAIN "sdProjectString"."IndividualProjectNameString"
	 IS 'for the individual project name';

CREATE Domain "sdShortTextString"."InvoiceNumber"
	AS VARCHAR(8) NULL;

COMMENT ON  DOMAIN "sdShortTextString"."InvoiceNumber"
	 IS 'for invoice numbers that may contain characters';

CREATE Domain "sdNameString"."LastNameString"
	AS VARCHAR(35) NOT NULL;

COMMENT ON  DOMAIN "sdNameString"."LastNameString"
	 IS 'for last names';

CREATE Domain "sdSequenceNumber"."LineItemNumber"
	AS INTEGER NOT NULL;

COMMENT ON  DOMAIN "sdSequenceNumber"."LineItemNumber"
	 IS 'for line item numbers';

CREATE Domain "sdLongTextString"."Note"
	AS VARCHAR(100) NULL;

COMMENT ON  DOMAIN "sdLongTextString"."Note"
	 IS 'for notes';

CREATE Domain "sdAddressesString"."PostalCodeString"
	AS VARCHAR(9) NULL;

COMMENT ON  DOMAIN "sdAddressesString"."PostalCodeString"
	 IS 'for postal codes';

CREATE Domain "sdAddressesString"."RegionString"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdAddressesString"."RegionString"
	 IS 'for region names';

CREATE Domain "sdHashKey"."RowLevelHashKey"
	AS BYTEA NULL;

COMMENT ON  DOMAIN "sdHashKey"."RowLevelHashKey"
	 IS 'for all Row Level Hash Keys and Prior Row Level Hash Keys';

CREATE Domain "sdString"."sdAddressesString"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdString"."sdAddressesString"
	 IS 'contains all address related strings';

CREATE Domain "sdString"."sdAudit"
	AS CHAR(1) NULL;

COMMENT ON  DOMAIN "sdString"."sdAudit"
	 IS 'contains all audit action strings';

CREATE Domain "dEuropeanCarManufacturer"."sdBlob"
	AS BYTEA NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"."sdBlob"
	 IS 'contains all blob and binary types';

CREATE Domain "sdString"."sdBusinessComponentString"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdString"."sdBusinessComponentString"
	 IS 'contains all business component strings';

CREATE Domain "sdString"."sdCountryStringVariant"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdString"."sdCountryStringVariant"
	 IS 'contains all country variants';

CREATE Domain "sdDateTime"."sdDate"
	AS DATE NULL;

COMMENT ON  DOMAIN "sdDateTime"."sdDate"
	 IS 'contains all date types';

CREATE Domain "dEuropeanCarManufacturer"."sdDatetime"
	AS TIMESTAMP NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"."sdDatetime"
	 IS 'contains all date-time types';

CREATE Domain "dEuropeanCarManufacturer"."sdFlag"
	AS INTEGER NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"."sdFlag"
	 IS 'contains all flag types';

CREATE Domain "sdBlob"."sdHashKey"
	AS BYTEA NULL;

COMMENT ON  DOMAIN "sdBlob"."sdHashKey"
	 IS 'for row level hash keys';

CREATE Domain "dEuropeanCarManufacturer"."sdKey"
	AS INTEGER NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"."sdKey"
	 IS 'contains all key types';

CREATE Domain "sdString"."sdLongTextString"
	AS VARCHAR(200) NULL;

COMMENT ON  DOMAIN "sdString"."sdLongTextString"
	 IS 'contains all long text strings';

CREATE Domain "sdString"."sdMarketingTextString"
	AS VARCHAR(25) NULL;

COMMENT ON  DOMAIN "sdString"."sdMarketingTextString"
	 IS 'contains all marketing related strings';

CREATE Domain "sdString"."sdNameString"
	AS VARCHAR(50) NOT NULL;

COMMENT ON  DOMAIN "sdString"."sdNameString"
	 IS 'contains all person name strings';

CREATE Domain "dEuropeanCarManufacturer"."sdNumber"
	AS INTEGER NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"."sdNumber"
	 IS 'contains all number types';

CREATE Domain "sdNumber"."sdOrdinalNumber"
	AS INTEGER NOT NULL;

COMMENT ON  DOMAIN "sdNumber"."sdOrdinalNumber"
	 IS 'contains all ordinal numbers';

CREATE Domain "sdString"."sdProjectString"
	AS VARCHAR(50) NULL;

COMMENT ON  DOMAIN "sdString"."sdProjectString"
	 IS 'contains all project related strings';

CREATE Domain "sdNumber"."sdSequenceNumber"
	AS INTEGER NOT NULL;

COMMENT ON  DOMAIN "sdNumber"."sdSequenceNumber"
	 IS 'contains all sequence type numbers';

CREATE Domain "sdString"."sdShortTextString"
	AS VARCHAR(50) NULL;

COMMENT ON  DOMAIN "sdString"."sdShortTextString"
	 IS 'contains all short text strings';

CREATE Domain "dEuropeanCarManufacturer"."sdString"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "dEuropeanCarManufacturer"."sdString"
	 IS 'contains all string types';

CREATE Domain "sdString"."sdTimeString"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdString"."sdTimeString"
	 IS 'contains all strings that represent time';

CREATE Domain "sdString"."sdVehicleString"
	AS VARCHAR(50) NULL;

COMMENT ON  DOMAIN "sdString"."sdVehicleString"
	 IS 'contains all vehicle strings';

CREATE Domain "sdShortTextString"."StockCode"
	AS VARCHAR(50) NULL;

COMMENT ON  DOMAIN "sdShortTextString"."StockCode"
	 IS 'for stock codes that may contain characters';

CREATE Domain "sdSequenceNumber"."StockIdNumber"
	AS INTEGER NOT NULL;

COMMENT ON  DOMAIN "sdSequenceNumber"."StockIdNumber"
	 IS 'for stock id numbers';

CREATE Domain "sdKey"."SurrogateKeyInteger"
	AS INTEGER NOT NULL;

COMMENT ON  DOMAIN "sdKey"."SurrogateKeyInteger"
	 IS 'for all integer primary keys';

CREATE Domain "sdAddressesString"."TownString"
	AS VARCHAR(30) NULL;

COMMENT ON  DOMAIN "sdAddressesString"."TownString"
	 IS 'for town names';

CREATE Domain "sdOrdinalNumber"."TransactionNumber"
	AS INTEGER NOT NULL;

COMMENT ON  DOMAIN "sdOrdinalNumber"."TransactionNumber"
	 IS 'for transaction numbers';

CREATE Domain "sdVehicleString"."VehicleColor"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdVehicleString"."VehicleColor"
	 IS 'for the color of a vehicle';

CREATE Domain "sdVehicleString"."VehicleIdentifier"
	AS VARCHAR(150) NULL;

COMMENT ON  DOMAIN "sdVehicleString"."VehicleIdentifier"
	 IS 'for Vehicle Identification Numbers';

CREATE Domain "sdVehicleString"."VehicleMakeString"
	AS VARCHAR(30) NULL;

COMMENT ON  DOMAIN "sdVehicleString"."VehicleMakeString"
	 IS 'for vehicle makes';

CREATE Domain "sdVehicleString"."VehicleManufacturerMarketingType"
	AS VARCHAR(25) NULL;

COMMENT ON  DOMAIN "sdVehicleString"."VehicleManufacturerMarketingType"
	 IS 'for marketing type descriptions';

CREATE Domain "sdVehicleString"."VehicleModelString"
	AS VARCHAR(35) NULL;

COMMENT ON  DOMAIN "sdVehicleString"."VehicleModelString"
	 IS 'for vehicle models';

CREATE Domain "sdMarketingTextString"."VehicleSalesThresholdCategory"
	AS VARCHAR(20) NULL;

COMMENT ON  DOMAIN "sdMarketingTextString"."VehicleSalesThresholdCategory"
	 IS 'for describing the vehicle threshold category';

CREATE SEQUENCE "SequenceIdInsert"."Audit_HumanResourcesStaffHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_LocaleCountryHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_ProductionManufacturerModelHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_ProductionManufacturerVehicleMakeHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_ProductionManufacturerVehicleStockHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesCustomerHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesSalesCategoryThresholdHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesSalesOrderVehicleDetailHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Audit_SalesSalesOrderVehicleHistory_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."DbSecurity_UserAuthorization_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."HumanResources_Staff_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Locale_Country_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Production_ManufacturerModel_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Production_ManufacturerVehicleMake_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Production_ManufacturerVehicleStock_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Sales_Customer_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Sales_SalesCategoryThreshold_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Sales_SalesOrderVehicle_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE SEQUENCE "SequenceIdInsert"."Sales_SalesOrderVehicleDetail_Id"
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
START WITH 1
NO CYCLE;

CREATE TABLE "Locale"."Country"
( 
	"CountryId"          integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Locale_Country_Id"'),
	"CountryISO3"        char(3)  NOT NULL ,
	"CountryName"        varchar(50)  NOT NULL ,
	"CountryISO2"        varchar(2)  NOT NULL ,
	"SalesRegion"        varchar(20)  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "PK_Country" PRIMARY KEY ("CountryId");

CREATE TABLE "Sales"."Customer"
( 
	"CustomerId"         integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Sales_Customer_Id"'),
	"CustomerName"       varchar(65)  NOT NULL ,
	"CustomerAddress1"   varchar(60)  NOT NULL ,
	"CustomerAddress2"   varchar(60)  NULL ,
	"CustomerTown"       varchar(30)  NOT NULL ,
	"CustomerPostalCode" varchar(9)  NULL ,
	"CountryId"          integer  NOT NULL ,
	"IsCustomerReseller" integer  NOT NULL ,
	"IsCustomerCreditRisk" integer  NOT NULL ,
	"SpendCapacity"      varchar(15)  NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "PK_Customer" PRIMARY KEY ("CustomerId");

CREATE INDEX "XIE1Customer" ON "Sales"."Customer"
( 
	"CustomerName"
);

CREATE TABLE "Audit"."HumanResourcesStaffHistory"
( 
	"StaffId"            integer  NOT NULL ,
	"StaffName"          varchar(60)  NOT NULL ,
	"Department"         varchar(15)  NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"ManagerId"          integer  NULL ,
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"StaffHistoryId"     integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_HumanResourcesStaffHistory_Id"'),
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL 
);

ALTER TABLE "Audit"."HumanResourcesStaffHistory"
	ADD CONSTRAINT "XPKStaffHistory" PRIMARY KEY ("StaffHistoryId");

CREATE TABLE "Audit"."LocaleCountryHistory"
( 
	"CountryId"          integer  NOT NULL ,
	"CountryISO3"        char(3)  NOT NULL ,
	"CountryName"        varchar(50)  NOT NULL ,
	"CountryISO2"        varchar(2)  NOT NULL ,
	"SalesRegion"        varchar(20)  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"LocaleCountryHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_LocaleCountryHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL 
);

ALTER TABLE "Audit"."LocaleCountryHistory"
	ADD CONSTRAINT "PK_CountryHistory" PRIMARY KEY ("LocaleCountryHistoryId");

CREATE TABLE "Production"."ManufacturerModel"
( 
	"ManufacturerModelId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Production_ManufacturerModel_Id"'),
	"ManufacturerModelName" varchar(35)  NOT NULL ,
	"ManufacturerModelVariant" varchar(35)  NULL ,
	"ManufacturerVehicleMakeId" integer  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "PK_Model_1" PRIMARY KEY ("ManufacturerModelId");

CREATE TABLE "Production"."ManufacturerVehicleMake"
( 
	"ManufacturerVehicleMakeId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Production_ManufacturerVehicleMake_Id"'),
	"ManufacturerVehicleMakeName" varchar(30)  NOT NULL ,
	"CountryId"          integer  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N',
	"MarketingType"      varchar(25)  NULL 
);

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "PK_Make" PRIMARY KEY ("ManufacturerVehicleMakeId");

CREATE TABLE "Production"."ManufacturerVehicleStock"
( 
	"ManufacturerVehicleStockId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Production_ManufacturerVehicleStock_Id"'),
	"StockCode"          varchar(50)  NOT NULL ,
	"Cost"               numeric(18,2)  NOT NULL ,
	"RepairsCharge"      numeric(18,2)  NOT NULL ,
	"PartsCharge"        numeric(18,2)  NOT NULL ,
	"DeliveryCharge"     numeric(18,2)  NOT NULL ,
	"IsPremiumRoadHandlingPackage" integer  NOT NULL   DEFAULT  0,
	"VehicleColor"       varchar(20)  NOT NULL ,
	"CustomerComment"    varchar(200)  NULL ,
	"ModelId"            integer  NULL ,
	"PurchaseDate"       date  NOT NULL   DEFAULT  NOW(),
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "PK_Stock" PRIMARY KEY ("ManufacturerVehicleStockId");

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "XAK1Manufacturer_Vehicle_Stock" UNIQUE ("StockCode");

CREATE TABLE "Audit"."ProductionManufacturerModelHistory"
( 
	"ManufacturerModelId" integer  NOT NULL ,
	"ManufacturerModelName" varchar(35)  NOT NULL ,
	"ManufacturerModelVariant" varchar(35)  NULL ,
	"ManufacturerVehicleMakeId" integer  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"ProductionManufacturerModelHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_ProductionManufacturerModelHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL 
);

ALTER TABLE "Audit"."ProductionManufacturerModelHistory"
	ADD CONSTRAINT "XPK_ModelHistory" PRIMARY KEY ("ProductionManufacturerModelHistoryId");

CREATE TABLE "Audit"."ProductionManufacturerVehicleMakeHistory"
( 
	"ManufacturerVehicleMakeId" integer  NOT NULL ,
	"ManufacturerVehicleMakeName" varchar(30)  NOT NULL ,
	"CountryId"          integer  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"ProductionManufacturerVehicleMakeHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_ProductionManufacturerVehicleMakeHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL ,
	"MarketingType"      varchar(25)  NULL 
);

ALTER TABLE "Audit"."ProductionManufacturerVehicleMakeHistory"
	ADD CONSTRAINT "XPK_MakeHistory" PRIMARY KEY ("ProductionManufacturerVehicleMakeHistoryId");

CREATE TABLE "Audit"."ProductionManufacturerVehicleStockHistory"
( 
	"ManufacturerVehicleStockId" integer  NOT NULL ,
	"StockCode"          varchar(50)  NOT NULL ,
	"Cost"               numeric(18,2)  NOT NULL ,
	"RepairsCharge"      numeric(18,2)  NOT NULL ,
	"PartsCharge"        numeric(18,2)  NOT NULL ,
	"DeliveryCharge"     numeric(18,2)  NOT NULL ,
	"IsPremiumRoadHandlingPackage" integer  NOT NULL ,
	"VehicleColor"       varchar(20)  NOT NULL ,
	"CustomerComment"    varchar(200)  NULL ,
	"ModelId"            integer  NOT NULL ,
	"StockId"            integer  NULL ,
	"PurchaseDate"       date  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"ProductionManufacturerVehicleStockHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_ProductionManufacturerVehicleStockHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL 
);

ALTER TABLE "Audit"."ProductionManufacturerVehicleStockHistory"
	ADD CONSTRAINT "XPK_StockHistory" PRIMARY KEY ("ProductionManufacturerVehicleStockHistoryId");

CREATE TABLE "Sales"."SalesCategoryThreshold"
( 
	"SalesCategoryThresholdId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Sales_SalesCategoryThreshold_Id"'),
	"LowerThreshold"     numeric(18,2)  NOT NULL ,
	"UpperThreshold"     numeric(18,2)  NOT NULL ,
	"CategoryDescription" varchar(20)  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "XPKSales_Category_Threshold" PRIMARY KEY ("SalesCategoryThresholdId");

CREATE TABLE "Audit"."SalesCustomerHistory"
( 
	"CustomerId"         integer  NOT NULL ,
	"CustomerName"       varchar(65)  NOT NULL ,
	"CustomerAddress1"   varchar(60)  NOT NULL ,
	"CustomerAddress2"   varchar(60)  NULL ,
	"CustomerTown"       varchar(30)  NOT NULL ,
	"CustomerPostalCode" varchar(9)  NULL ,
	"CountryId"          integer  NOT NULL ,
	"IsCustomerReseller" integer  NOT NULL ,
	"IsCustomerCreditRisk" integer  NOT NULL ,
	"SpendCapacity"      varchar(15)  NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"SalesCustomerHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_SalesCustomerHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL 
);

ALTER TABLE "Audit"."SalesCustomerHistory"
	ADD CONSTRAINT "XPK_CustomerHistory" PRIMARY KEY ("SalesCustomerHistoryId");

CREATE TABLE "Sales"."SalesOrderVehicle"
( 
	"SalesOrderVehicleId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Sales_SalesOrderVehicle_Id"'),
	"CustomerId"         integer  NOT NULL ,
	"StaffId"            integer  NOT NULL ,
	"InvoiceNumber"      varchar(8)  NOT NULL ,
	"TotalSalePrice"     numeric(18,2)  NOT NULL   DEFAULT  0,
	"SaleDate"           date  NOT NULL   DEFAULT  NOW(),
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N',
	"SalesCategoryThresholdId" integer  NULL 
);

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "XPKSales_Order_Vehicle" PRIMARY KEY ("SalesOrderVehicleId");

CREATE TABLE "Sales"."SalesOrderVehicleDetail"
( 
	"SalesOrderVehicleDetailId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Sales_SalesOrderVehicleDetail_Id"'),
	"SalesOrderVehicleId" integer  NULL ,
	"LineItemNumber"     integer  NOT NULL   DEFAULT  1,
	"SalePrice"          numeric(18,2)  NOT NULL   DEFAULT  0,
	"LineItemDiscount"   numeric(18,2)  NOT NULL   DEFAULT  0,
	"DerivedDiscountedSalePrice" numeric(18,2)  NOT NULL ,
	"ManufacturerVehicleStockId" integer  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "PK_SalesDetails" PRIMARY KEY ("SalesOrderVehicleDetailId");

CREATE TABLE "Audit"."SalesSalesCategoryThresholdHistory"
( 
	"SalesCategoryThresholdId" integer  NOT NULL ,
	"LowerThreshold"     numeric(18,2)  NOT NULL ,
	"UpperThreshold"     numeric(18,2)  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"Note"               varchar(100)  NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"SalesSalesCategoryThresholdHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_SalesSalesCategoryThresholdHistory_Id"'),
	"CategoryDescription" varchar(20)  NOT NULL 
);

ALTER TABLE "Audit"."SalesSalesCategoryThresholdHistory"
	ADD CONSTRAINT "XPKSales_Sales_Category_Threshold_History" PRIMARY KEY ("SalesSalesCategoryThresholdHistoryId");

CREATE TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
( 
	"SalesOrderVehicleDetailId" integer  NOT NULL ,
	"SalesOrderVehicleId" integer  NULL ,
	"LineItemNumber"     integer  NOT NULL ,
	"SalePrice"          numeric(18,2)  NOT NULL ,
	"LineItemDiscount"   numeric(18,2)  NOT NULL ,
	"ManufacturerVehicleStockId" integer  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"SalesSalesOrderVehicleDetailHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_SalesSalesOrderVehicleDetailHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"DerivedDiscountedSalePrice" numeric(18,2)  NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL 
);

ALTER TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
	ADD CONSTRAINT "XPK_SalesDetailsHistory" PRIMARY KEY ("SalesSalesOrderVehicleDetailHistoryId");

CREATE TABLE "Audit"."SalesSalesOrderVehicleHistory"
( 
	"SalesOrderVehicleId" integer  NOT NULL ,
	"CustomerId"         integer  NOT NULL ,
	"StaffId"            integer  NOT NULL ,
	"InvoiceNumber"      varchar(8)  NOT NULL ,
	"TotalSalePrice"     numeric(18,2)  NOT NULL ,
	"SaleDate"           date  NOT NULL ,
	"UserAuthorizationId" integer  NOT NULL ,
	"SysStartTime"       timestamp  NULL ,
	"SysEndTime"         timestamp  NULL ,
	"RowLevelHashKey"    bytea  NULL ,
	"SalesSalesOrderVehicleHistoryId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."Audit_SalesSalesOrderVehicleHistory_Id"'),
	"Note"               varchar(100)  NULL ,
	"IsDeleted"          char(1)  NOT NULL ,
	"TransactionNumber"  integer  NOT NULL ,
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL ,
	"AuditDateTimeStamp" timestamp  NOT NULL   DEFAULT  NOW(),
	"DBAction"           char(1)  NOT NULL ,
	"SalesCategoryThresholdId" integer  NULL 
);

ALTER TABLE "Audit"."SalesSalesOrderVehicleHistory"
	ADD CONSTRAINT "XPKSalesOrderVehicleHistory" PRIMARY KEY ("SalesSalesOrderVehicleHistoryId");

CREATE TABLE "HumanResources"."Staff"
( 
	"StaffId"            integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."HumanResources_Staff_Id"'),
	"ManagerId"          integer  NULL ,
	"StaffName"          varchar(60)  NOT NULL ,
	"Department"         varchar(15)  NULL ,
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  1,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"RowLevelHashKey"    bytea  NULL ,
	"TransactionNumber"  integer  NOT NULL   DEFAULT  1,
	"Note"               varchar(100)  NULL   DEFAULT  'Row was inserted',
	"PriorRowLevelHashKey" bytea  NULL ,
	"FireAuditTrigger"   char(1)  NOT NULL   DEFAULT  'N'
);

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "XPKStaff" PRIMARY KEY ("StaffId");

CREATE INDEX "XIE1Staff" ON "HumanResources"."Staff"
( 
	"StaffName"
);

CREATE TABLE "DbSecurity"."UserAuthorization"
( 
	"UserAuthorizationId" integer  NOT NULL   DEFAULT  NEXTVAL('"SequenceIdInsert"."DbSecurity_UserAuthorization_Id"'),
	"ClassTime"          char(5)  NULL   DEFAULT  '10:45',
	"IndividualProject"  varchar(60)  NULL   DEFAULT  'CSCI381 Final Project',
	"GroupMemberLastName" varchar(35)  NOT NULL ,
	"GroupMemberFirstName" varchar(25)  NOT NULL ,
	"SysStartTime"       timestamp  NULL   DEFAULT  NOW(),
	"SysEndTime"         timestamp  NULL   DEFAULT  '99991231 23:59:59.9999999',
	"GroupName"          varchar(20)  NOT NULL   DEFAULT  'Group 3'
);

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "XPKUser_Authorization" PRIMARY KEY ("UserAuthorizationId");

CREATE INDEX "XIE1User_Authorization" ON "DbSecurity"."UserAuthorization"
( 
	"GroupMemberLastName",
	"GroupMemberFirstName"
);

CREATE OR REPLACE VIEW "Sales"."uvw_Sales2018" AS 
SELECT
    date_part('YEAR', "Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
    "Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    "Sales"."Customer"."CustomerName",
    "Locale"."Country"."CountryName",
    "Production"."ManufacturerVehicleStock"."Cost" as "Cost",
    "Production"."ManufacturerVehicleStock"."RepairsCharge" as RepairCost,
    "Production"."ManufacturerVehicleStock"."PartsCharge" AS "PartsCost",
    "Production"."ManufacturerVehicleStock"."DeliveryCharge" AS "TransportInCost",
    CAST("Sales"."SalesOrderVehicleDetail"."SalePrice" as INT) as "SalePrice",
    "Sales"."SalesOrderVehicle"."SaleDate" as "SaleDate"
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
    "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
INNER JOIN
    "Production"."ManufacturerModel"
ON
    "Production"."ManufacturerModel"."ManufacturerModelId" = "Production"."ManufacturerVehicleStock"."ModelId"
INNER JOIN
    "Production"."ManufacturerVehicleMake" 
ON
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId" where date_part('YEAR', "Sales"."SalesOrderVehicle"."SaleDate") = 2018
;

CREATE OR REPLACE VIEW "Sales"."uvw_SalesByCountry" AS 
SELECT
	"Locale"."Country"."CountryName",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
	"Production"."ManufacturerVehicleStock"."Cost" AS "Cost",
	"Production"."ManufacturerVehicleStock"."RepairsCharge" AS "RepairsCost",
	"Production"."ManufacturerVehicleStock"."PartsCharge" AS "PartsCost",
	"Production"."ManufacturerVehicleStock"."DeliveryCharge" AS "TransportInCost",
	"Production"."ManufacturerVehicleStock"."VehicleColor" AS "Color",
	CAST("Sales"."SalesOrderVehicleDetail"."SalePrice" as INT) as SalePrice,
	CAST("Sales"."SalesOrderVehicleDetail"."LineItemDiscount" as INT) as LineItemDiscount,
	"Sales"."SalesOrderVehicle"."InvoiceNumber",
	"Sales"."SalesOrderVehicle"."SaleDate" as SaleDate,
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
    "Production"."ManufacturerVehicleMake" ON "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId"
;

CREATE OR REPLACE VIEW "Sales"."uvw_PivotTable" AS 
SELECT
    "VehicleColor",
    CAST(SUM(CASE WHEN  date_part('YEAR', "SaleDate") = 2015 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2015",
    CAST(SUM(CASE WHEN  date_part('YEAR', "SaleDate") = 2016 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2016",
    CAST(SUM(CASE WHEN  date_part('YEAR', "SaleDate") = 2017 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2017",
    CAST(SUM(CASE WHEN  date_part('YEAR', "SaleDate") = 2018 THEN "TotalSalePrice" ELSE 0 END) AS INT) AS "CY2018"
FROM
    "Sales"."SalesOrderVehicle"
JOIN
    "Sales"."SalesOrderVehicleDetail" ON "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
JOIN
    "Production"."ManufacturerVehicleStock" ON "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
GROUP BY
    "VehicleColor";

CREATE OR REPLACE VIEW "Sales"."uvw_StockPrices" AS 
SELECT
    mvsmm."ManufacturerVehicleMakeName" AS "MakeName",
    mm."ManufacturerModelName" AS "ModelName",
    mvs."Cost" AS "RetailCost"
FROM
    "Production"."ManufacturerVehicleStock" mvs
    JOIN "Production"."ManufacturerModel" mm 
	ON mvs."ModelId" = mm."ManufacturerModelId"
    JOIN "Production"."ManufacturerVehicleMake" mvsmm 
	ON mm."ManufacturerVehicleMakeId" = mvsmm."ManufacturerVehicleMakeId"
;

CREATE OR REPLACE VIEW "Sales"."uvw_SalesText" AS 
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
    JOIN "Locale"."Country" co ON c."CountryId" = co."CountryId"

;

CREATE OR REPLACE VIEW "Sales"."uvw_YearlySales" AS 
SELECT
	date_part('YEAR', "Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    	"Sales"."Customer"."CustomerName",
	"Locale"."Country"."CountryName",
	"Production"."ManufacturerVehicleStock"."Cost" as "Cost",
    "Production"."ManufacturerVehicleStock"."RepairsCharge" as "RepairsCost",
    "Production"."ManufacturerVehicleStock"."PartsCharge" AS "PartsCost",
    "Production"."ManufacturerVehicleStock"."DeliveryCharge" AS "TransportInCost",
	CAST("Sales"."SalesOrderVehicleDetail"."SalePrice" AS INT) as "SalePrice",
	"Sales"."SalesOrderVehicle"."SaleDate" AS "SaleDate"
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
    "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
INNER JOIN
    "Production"."ManufacturerModel"
ON
    "Production"."ManufacturerModel"."ManufacturerModelId" = "Production"."ManufacturerVehicleStock"."ModelId"
INNER JOIN
    "Production"."ManufacturerVehicleMake"
ON
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId";

CREATE OR REPLACE VIEW "CustomViews"."uvw_ChuanCustomerCountry" AS 
select "SC"."CustomerName","LC"."CountryName" from "Sales"."Customer" as "SC" INNER JOIN "Locale"."Country" as "LC" on "LC"."CountryId" = "SC"."CountryId"
;

CREATE OR REPLACE VIEW "CustomViews"."uvw_ChuanMakeCountry" AS 
select "LC"."CountryName" as "Country", "PMVM"."ManufacturerVehicleMakeName" as "Make" from "Production"."ManufacturerVehicleMake" as "PMVM"
INNER JOIN "Locale"."Country" as "LC" on "PMVM"."CountryId" = "LC"."CountryId"
;

CREATE OR REPLACE VIEW "CustomViews"."uvw_ChuanModelMake" AS 
select "PMM"."ManufacturerModelName" as "Model", "PMVM"."ManufacturerVehicleMakeName" as "Make" from "Production"."ManufacturerModel" as "PMM"
INNER JOIN "Production"."ManufacturerVehicleMake" as "PMVM" on  "PMM"."ManufacturerVehicleMakeId" = "PMVM"."ManufacturerVehicleMakeId"
;

CREATE OR REPLACE VIEW "CustomViews"."uvw_ChuanStaffDiscountGiven" AS 
select "HRS"."StaffName", SUM("SSOVD"."LineItemDiscount") as "DiscountGiven" from "HumanResources"."Staff" as "HRS"
INNER JOIN "Sales"."SalesOrderVehicle" as "SSOV" on "HRS"."StaffId" = "SSOV"."StaffId" 
INNER JOIN "Sales"."SalesOrderVehicleDetail" as "SSOVD" on "SSOV"."SalesOrderVehicleId" = "SSOVD"."SalesOrderVehicleId" group by "StaffName"
;

CREATE OR REPLACE VIEW "CustomViews"."uvw_MehrshadYearlyCustomerSales" AS 
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

CREATE OR REPLACE VIEW "CustomViews"."uvw_MehrshadYearlySalesProfits" AS 
SELECT
    date_part('YEAR', "Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
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

CREATE OR REPLACE VIEW "CustomViews"."uvw_MershadVehicleCost" AS 
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
        "Production"."ManufacturerVehicleStock"."ModelId" = "Production"."ManufacturerModel"."ManufacturerModelId";

CREATE OR REPLACE VIEW "CustomViews"."uvw_Ralph_EmployeeManager" AS 
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

CREATE OR REPLACE VIEW "CustomViews"."uvw_RalphMakeModelPartsCost" AS 
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

CREATE OR REPLACE VIEW "CustomViews"."uvw_RalphSalesPerCategoryThreshold" AS 
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

CREATE OR REPLACE VIEW "Sales"."uvw_ChuanStaffSales" AS 
select "HRS"."StaffName",SUM("SSOV"."TotalSalePrice") as "TotalSales" from "HumanResources"."Staff" as "HRS" 
INNER JOIN "Sales"."SalesOrderVehicle" as "SSOV" on "HRS"."StaffId" = "SSOV"."StaffId" group by "StaffName"
;


ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_CountryISO3" CHECK  ( "CountryISO3" SIMILAR TO '[A-Z][A-Z][A-Z]' ) ;

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_CountryISO2" CHECK  ( "CountryISO2" SIMILAR TO'[A-Z][A-Z]' ) ;

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "CK_Locale_Country_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Locale"."Country"
	ADD CONSTRAINT "FK_Country_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_IsCustomerReseller" CHECK  ( "IsCustomerReseller"=0 OR "IsCustomerReseller"=1 ) ;

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "BCK_TemplateTable_ValidBit_161407054" CHECK  ( "IsCustomerCreditRisk"=0 OR "IsCustomerCreditRisk"=1 ) ;

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "CK_Sales_Customer_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "FK_Customer_Country" FOREIGN KEY ("CountryId") REFERENCES "Locale"."Country"("CountryId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Sales"."Customer"
	ADD CONSTRAINT "FK_Customer_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Audit"."HumanResourcesStaffHistory"
	ADD CONSTRAINT "CK_Audit_HumanResourcesStaffHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Audit"."LocaleCountryHistory"
	ADD CONSTRAINT "CK_Audit_LocaleCountryHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "CK_Production_ManufacturerModel_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "CK_Production_ManufacturerModel_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "CK_Production_ManufacturerModel_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "FK_ManufacturerModel_ManufacturerVehicleMake" FOREIGN KEY ("ManufacturerVehicleMakeId") REFERENCES "Production"."ManufacturerVehicleMake"("ManufacturerVehicleMakeId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Production"."ManufacturerModel"
	ADD CONSTRAINT "FK_ManufacturerModel_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleMake_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleMake_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleMakel_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "FK_ManufacturerVehicleMake_Country" FOREIGN KEY ("CountryId") REFERENCES "Locale"."Country"("CountryId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Production"."ManufacturerVehicleMake"
	ADD CONSTRAINT "FK_ManufacturerVehicleMake_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_Cost" CHECK  ( "Cost" >= 0 ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_RepairsCharge" CHECK  ( "RepairsCharge" >= 0 ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_PartsCharge" CHECK  ( "PartsCharge" >= 0 ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_DeliveryCharge" CHECK  ( "DeliveryCharge" >= 0 ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_IsPremiumRoadHandlingPac" CHECK  ( "IsPremiumRoadHandlingPackage"=0 OR "IsPremiumRoadHandlingPackage"=1 ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManufacturerVehicleStock_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "CK_Production_ManfuacturerVehicleStock_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "FK_ManufacturerVehicleStock_ManufacturerModel" FOREIGN KEY ("ModelId") REFERENCES "Production"."ManufacturerModel"("ManufacturerModelId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Production"."ManufacturerVehicleStock"
	ADD CONSTRAINT "FK_ManufacturerVehicleStock_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Audit"."ProductionManufacturerModelHistory"
	ADD CONSTRAINT "CK_ProductionManufacturerVehicleModelHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Audit"."ProductionManufacturerVehicleMakeHistory"
	ADD CONSTRAINT "CK_Audit_ProductionManufacturerVehicleHistory_AuditDateTimeStam" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Audit"."ProductionManufacturerVehicleStockHistory"
	ADD CONSTRAINT "CK_ProductionManufacturerVehicleStockHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "CK_Sales_SalesCategoryThreshold_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "CK_Sales_SalesCategoryThreshold_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "CK_Sales_SalesCategoryThreshold_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Sales"."SalesCategoryThreshold"
	ADD CONSTRAINT "FK_SalesCategoryThreshold_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Audit"."SalesCustomerHistory"
	ADD CONSTRAINT "CK_Audit_SalesSalesCustomerHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_TotalSalePrice" CHECK  ( "TotalSalePrice" >= 0 ) ;

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicle_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_Customer" FOREIGN KEY ("CustomerId") REFERENCES "Sales"."Customer"("CustomerId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_Staff" FOREIGN KEY ("StaffId") REFERENCES "HumanResources"."Staff"("StaffId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Sales"."SalesOrderVehicle"
	ADD CONSTRAINT "FK_SalesOrderVehicle_SalesCategoryThreshold" FOREIGN KEY ("SalesCategoryThresholdId") REFERENCES "Sales"."SalesCategoryThreshold"("SalesCategoryThresholdId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_SalePrice" CHECK  ( "SalePrice" >= 0 ) ;

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_LineItemDiscount" CHECK  ( "LineItemDiscount" >= 0 ) ;

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "CK_Sales_SalesOrderVehicleDetail_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_SalesOrderVehicleDetail_SalesOrderVehicle" FOREIGN KEY ("SalesOrderVehicleId") REFERENCES "Sales"."SalesOrderVehicle"("SalesOrderVehicleId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_SalesOrderVehicleDetail_ManufacturerVehicleStock" FOREIGN KEY ("ManufacturerVehicleStockId") REFERENCES "Production"."ManufacturerVehicleStock"("ManufacturerVehicleStockId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "Sales"."SalesOrderVehicleDetail"
	ADD CONSTRAINT "FK_SalesOrderVehicleDetail_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "Audit"."SalesSalesCategoryThresholdHistory"
	ADD CONSTRAINT "CK_Audit_SalesSalesCategoryThresholdHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Audit"."SalesSalesOrderVehicleDetailHistory"
	ADD CONSTRAINT "CK_SalesSalesOrderVehicleDetailHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "Audit"."SalesSalesOrderVehicleHistory"
	ADD CONSTRAINT "CK_SalesSalesOrderVehicleHistory_DBAction" CHECK  ( "DBAction"='U' OR "DBAction"='I' OR "DBAction"='D' ) ;


ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "CK_HumanResources_Staff_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "CK_HumanResources_Staff_FireAuditTrigger" CHECK  ( "FireAuditTrigger"='Y' OR "FireAuditTrigger"='N' ) ;


ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "FK_Staff_Staff" FOREIGN KEY ("ManagerId") REFERENCES "HumanResources"."Staff"("StaffId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;

ALTER TABLE "HumanResources"."Staff"
	ADD CONSTRAINT "FK_Staff_UserAuthorization" FOREIGN KEY ("UserAuthorizationId") REFERENCES "DbSecurity"."UserAuthorization"("UserAuthorizationId")
		ON UPDATE SET NULL
		ON DELETE SET NULL;


ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "CK_DbSecurity_UserAuthorization_ClassTime" CHECK  ( "ClassTime" SIMILAR TO '[0-1][0-9]:[0-5][0-9]'
OR
"ClassTime" SIMILAR TO '[0-2][0-4]:[0-5][0-9]' ) ;

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "CK_DbSecurity_UserAuthorization_SysStartTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

ALTER TABLE "DbSecurity"."UserAuthorization"
	ADD CONSTRAINT "CK_DbSecurity_UserAuthorization_SysEndTime" CHECK  ( "SysEndTime" >= "SysStartTime" ) ;

COMMENT ON TABLE "Locale"."Country" IS 'A country or territory in the world';

COMMENT ON COLUMN "Locale"."Country"."CountryId" IS 'A unique identifier for countries';

COMMENT ON COLUMN "Locale"."Country"."CountryISO3" IS 'The ISO3 format of a country';

COMMENT ON COLUMN "Locale"."Country"."CountryName" IS 'The name of the country';

COMMENT ON COLUMN "Locale"."Country"."CountryISO2" IS 'The ISO2 format of a country';

COMMENT ON COLUMN "Locale"."Country"."SalesRegion" IS 'The name of the sales region a coutry belongs to';

COMMENT ON COLUMN "Locale"."Country"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Locale"."Country"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Locale"."Country"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Locale"."Country"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Locale"."Country"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Locale"."Country"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Locale"."Country"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Locale"."Country"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "Sales"."Customer" IS 'A person who purchases a vehicle from the business';

COMMENT ON COLUMN "Sales"."Customer"."CustomerId" IS 'A unique identifier for customers';

COMMENT ON COLUMN "Sales"."Customer"."CustomerName" IS 'The full name of a customer';

COMMENT ON COLUMN "Sales"."Customer"."CustomerAddress1" IS 'The street address of a customer';

COMMENT ON COLUMN "Sales"."Customer"."CustomerAddress2" IS 'The extended street address of a customer';

COMMENT ON COLUMN "Sales"."Customer"."CustomerTown" IS 'The town or city a customer resides in';

COMMENT ON COLUMN "Sales"."Customer"."CustomerPostalCode" IS 'The postal code of a customer if applicable';

COMMENT ON COLUMN "Sales"."Customer"."CountryId" IS 'A unique identifier for countries';

COMMENT ON COLUMN "Sales"."Customer"."IsCustomerReseller" IS 'Flag to determine if a customer is a reseller';

COMMENT ON COLUMN "Sales"."Customer"."IsCustomerCreditRisk" IS 'Flag to determine if customer is a credit risk';

COMMENT ON COLUMN "Sales"."Customer"."SpendCapacity" IS 'The spend capacity of a customer';

COMMENT ON COLUMN "Sales"."Customer"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Sales"."Customer"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Sales"."Customer"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Sales"."Customer"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Sales"."Customer"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Sales"."Customer"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Sales"."Customer"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Sales"."Customer"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "Audit"."HumanResourcesStaffHistory" IS 'The audit history table for Staff';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."StaffId" IS 'A unique identifier for staff members';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."StaffName" IS 'The full name of a staff member';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."Department" IS 'The department name a staff member works in';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."ManagerId" IS 'The ID of a staff member that supervises an employee';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."StaffHistoryId" IS 'A unique identifier for audit entries in HumanResourcesStaffHistory';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."HumanResourcesStaffHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON TABLE "Audit"."LocaleCountryHistory" IS 'The audit history table for Country';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."CountryId" IS 'A unique identifier for countries';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."CountryISO3" IS 'The ISO3 format of a country';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."CountryName" IS 'The name of the country';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."CountryISO2" IS 'The ISO2 format of a country';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."SalesRegion" IS 'The name of the sales region a coutry belongs to';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."LocaleCountryHistoryId" IS 'A unique identifier for audit entries in LocaleCountryHistory';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."LocaleCountryHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON TABLE "Production"."ManufacturerModel" IS 'The model of a particular vehicle created by the manufacturer';

COMMENT ON COLUMN "Production"."ManufacturerModel"."ManufacturerModelId" IS 'A unique identifier for vehicle models';

COMMENT ON COLUMN "Production"."ManufacturerModel"."ManufacturerModelName" IS 'The name of a vehicle model';

COMMENT ON COLUMN "Production"."ManufacturerModel"."ManufacturerModelVariant" IS 'The name of a vehicle model variant if applicable';

COMMENT ON COLUMN "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" IS 'A unique identifier for vehicle makes';

COMMENT ON COLUMN "Production"."ManufacturerModel"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Production"."ManufacturerModel"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Production"."ManufacturerModel"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Production"."ManufacturerModel"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Production"."ManufacturerModel"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Production"."ManufacturerModel"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Production"."ManufacturerModel"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Production"."ManufacturerModel"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "Production"."ManufacturerVehicleMake" IS 'The company responsible for the production of a vehicle';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId" IS 'A unique identifier for vehicle makes';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" IS 'The name of a vehicle make';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."CountryId" IS 'A unique identifier for countries';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Production"."ManufacturerVehicleMake"."MarketingType" IS 'The marketing type of a vehicle make';

COMMENT ON TABLE "Production"."ManufacturerVehicleStock" IS 'A produced physical vehicle that a manufacturer has in stock';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId" IS 'A unique identifier for manfacturer vehicle stock';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."StockCode" IS 'The stock code of a vehicle';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."Cost" IS 'The cost of a vehicle from the manufacturer';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."RepairsCharge" IS 'The charge for repairs on a vehicle';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."PartsCharge" IS 'The charge for parts on a vehicle';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."DeliveryCharge" IS 'The charge for delivery of a vehicle';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."IsPremiumRoadHandlingPackage" IS 'A flag to determine if a vehicle has a premium road handling package';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."VehicleColor" IS 'The color of the vehicle';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."CustomerComment" IS 'A comment added by a customer';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."ModelId" IS 'A unique identifier for vehicle models';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."PurchaseDate" IS 'The date of purchase';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Production"."ManufacturerVehicleStock"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "Audit"."ProductionManufacturerModelHistory" IS 'The audit history table for ManufacturerModel';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."ManufacturerModelId" IS 'A unique identifier for vehicle models';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."ManufacturerModelName" IS 'The name of a vehicle model';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."ManufacturerModelVariant" IS 'The name of a vehicle model variant if applicable';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."ManufacturerVehicleMakeId" IS 'A unique identifier for vehicle makes';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."ProductionManufacturerModelHistoryId" IS 'A unique identifier for audit entries in ProductionManufacturerModelHistory';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."ProductionManufacturerModelHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON TABLE "Audit"."ProductionManufacturerVehicleMakeHistory" IS 'The audit history table for ManufacturerVehicleMake';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."ManufacturerVehicleMakeId" IS 'A unique identifier for vehicle makes';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."ManufacturerVehicleMakeName" IS 'The name of a vehicles make';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."CountryId" IS 'A unique identifier for countries';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."ProductionManufacturerVehicleMakeHistoryId" IS 'A unique identifier for audit entries in ProductionManufacturerVehicleMakeHistory';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleMakeHistory"."MarketingType" IS 'The marketing type of a vehicle make';

COMMENT ON TABLE "Audit"."ProductionManufacturerVehicleStockHistory" IS 'The audit history table for ManufacturerVehicleStock';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."ManufacturerVehicleStockId" IS 'A unique identifier for manfacturer vehicle stock';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."StockCode" IS 'The stock code of a vehicle';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."Cost" IS 'The cost of a vehicle from the manufacturer';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."RepairsCharge" IS 'The charge for repairs on a vehicle';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."PartsCharge" IS 'The charge for parts on a vehicle';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."DeliveryCharge" IS 'The charge for delivery of a vehicle';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."IsPremiumRoadHandlingPackage" IS 'A flag to determine if a vehicle has a premium road handling package';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."VehicleColor" IS 'The color of the vehicle';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."CustomerComment" IS 'A comment added by a customer';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."ModelId" IS 'A unique identifier for vehicle models';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."StockId" IS 'The internal stock ID number of a vehicle';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."PurchaseDate" IS 'The date of purchase';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."ProductionManufacturerVehicleStockHistoryId" IS 'A unique identifier for audit entries in ProductionManufacturerVehicleStockHistory';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."ProductionManufacturerVehicleStockHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON TABLE "Sales"."SalesCategoryThreshold" IS 'The classification of vehicle categories based on price range';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."SalesCategoryThresholdId" IS 'A unique identifier for SalesCategoryThresholdIds';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."LowerThreshold" IS 'The lowest amount a vehicle in a category is sold for';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."UpperThreshold" IS 'The highest amount this vehicle was sold for';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."CategoryDescription" IS 'The category description a vehicle sales threshold';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Sales"."SalesCategoryThreshold"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "Audit"."SalesCustomerHistory" IS 'The audit history table for Customer';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CustomerId" IS 'A unique identifier for customers';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CustomerName" IS 'The full name of a customer';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CustomerAddress1" IS 'The street address of a customer';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CustomerAddress2" IS 'The extended street address of a customer';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CustomerTown" IS 'The town or city a customer resides in';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CustomerPostalCode" IS 'The postal code of a customer if applicable';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."CountryId" IS 'A unique identifier for countries';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."IsCustomerReseller" IS 'Flag to determine if a customer is a reseller';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."IsCustomerCreditRisk" IS 'Flag to determine if customer is a credit risk';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."SpendCapacity" IS 'The spend capacity of a customer';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."SalesCustomerHistoryId" IS 'A unique identifier for audit entries in SalesCustomerHistory';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."SalesCustomerHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON TABLE "Sales"."SalesOrderVehicle" IS 'An order for the purchase of a vehicle';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" IS 'A unique identifier for a purchase';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."CustomerId" IS 'A unique identifier for customers';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."StaffId" IS 'A unique identifier for staff members';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."InvoiceNumber" IS 'The invoice number of an order';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."TotalSalePrice" IS 'The total sale price of an order';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."SaleDate" IS 'The date an order was made';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Sales"."SalesOrderVehicle"."SalesCategoryThresholdId" IS 'A unique identifier for SalesCategoryThresholdIds';

COMMENT ON TABLE "Sales"."SalesOrderVehicleDetail" IS 'The details of a vehicle order';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleDetailId" IS 'A unique identifier for SalesOrderVehicleDetail Ids';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId" IS 'A unique identifier for a purchase';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."LineItemNumber" IS 'The line item number on the invoice';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."SalePrice" IS 'The sale price of a vehicle';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."LineItemDiscount" IS 'The discount of the line item number';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."DerivedDiscountedSalePrice" IS 'The derived discounted sale price of a vehicle';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" IS 'A unique identifier for manfacturer vehicle stock';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Sales"."SalesOrderVehicleDetail"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "Audit"."SalesSalesCategoryThresholdHistory" IS 'The audit history for Sales Category Threshold';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."SalesCategoryThresholdId" IS 'A unique identifier for SalesCategoryThresholdIds';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."LowerThreshold" IS 'The lowest amount a vehicle in a category is sold for';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."UpperThreshold" IS 'The highest amount this vehicle was sold for';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."SalesSalesCategoryThresholdHistoryId" IS 'A unique identifier forSalesSalesCategoryThresholdHistory IDs';

COMMENT ON COLUMN "Audit"."SalesSalesCategoryThresholdHistory"."CategoryDescription" IS 'The category description a vehicle sales threshold';

COMMENT ON TABLE "Audit"."SalesSalesOrderVehicleDetailHistory" IS 'The audit history table for SalesOrderVehicleDetail';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."SalesOrderVehicleDetailId" IS 'A unique identifier for SalesSalesOrderVehicleDetailHistory Ids';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."SalesOrderVehicleId" IS 'A unique identifier for a purchase';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."LineItemNumber" IS 'The line item number on the invoice';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."SalePrice" IS 'The sale price of a vehicle';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."LineItemDiscount" IS 'The discount of the line item number';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."ManufacturerVehicleStockId" IS 'A unique identifier for manfacturer vehicle stock';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."SalesSalesOrderVehicleDetailHistoryId" IS 'A unique identifier for audit entries in SalesSalesOrderVehicleDetailHistory';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."DerivedDiscountedSalePrice" IS 'The derived discounted sale price of a vehicle';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleDetailHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON TABLE "Audit"."SalesSalesOrderVehicleHistory" IS 'The audit history table for SalesOrderVehicle';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."SalesOrderVehicleId" IS 'A unique identifier for a purchase';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."CustomerId" IS 'A unique identifier for customers';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."StaffId" IS 'A unique identifier for staff members';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."InvoiceNumber" IS 'The invoice number of an order';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."TotalSalePrice" IS 'The total sale price of an order';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."SaleDate" IS 'The date an order was made';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."SalesSalesOrderVehicleHistoryId" IS 'A unique identifier for audit entries in SalesSalesOrderVehicleHistory';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."IsDeleted" IS 'Flag used to check if an entry has been deleted';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."AuditDateTimeStamp" IS 'A timestamp to record audit transactions';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."DBAction" IS 'Represents the type of action that took place in the database';

COMMENT ON COLUMN "Audit"."SalesSalesOrderVehicleHistory"."SalesCategoryThresholdId" IS 'A unique identifier for SalesCategoryThresholdIds';

COMMENT ON TABLE "HumanResources"."Staff" IS 'A staff member of the business who sells vehicles to customers';

COMMENT ON COLUMN "HumanResources"."Staff"."StaffId" IS 'A unique identifier for staff members';

COMMENT ON COLUMN "HumanResources"."Staff"."ManagerId" IS 'The ID of a staff member that supervises an employee';

COMMENT ON COLUMN "HumanResources"."Staff"."StaffName" IS 'The full name of a staff member';

COMMENT ON COLUMN "HumanResources"."Staff"."Department" IS 'The department name a staff member works in';

COMMENT ON COLUMN "HumanResources"."Staff"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "HumanResources"."Staff"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "HumanResources"."Staff"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "HumanResources"."Staff"."RowLevelHashKey" IS 'Current row hash key representing all combined columns';

COMMENT ON COLUMN "HumanResources"."Staff"."TransactionNumber" IS 'The transaction number in a series of database transactions';

COMMENT ON COLUMN "HumanResources"."Staff"."Note" IS 'A note regarding the database transaction';

COMMENT ON COLUMN "HumanResources"."Staff"."PriorRowLevelHashKey" IS 'The prior transaction row level hash key';

COMMENT ON COLUMN "HumanResources"."Staff"."FireAuditTrigger" IS 'A flag to indicate if an audit trigger should be fired';

COMMENT ON TABLE "DbSecurity"."UserAuthorization" IS 'The authorization of database actions by a user';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."UserAuthorizationId" IS 'A unique identifier for UserAuthorizationIds';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."ClassTime" IS 'The class time for CSCI381 Data Modeling';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."IndividualProject" IS 'The name of the individual project';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."GroupMemberLastName" IS 'The group members last name';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."GroupMemberFirstName" IS 'The group members first name';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."SysStartTime" IS 'The start time for a system transaction';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."SysEndTime" IS 'The end time for a system transaction';

COMMENT ON COLUMN "DbSecurity"."UserAuthorization"."GroupName" IS 'The name of the group';
