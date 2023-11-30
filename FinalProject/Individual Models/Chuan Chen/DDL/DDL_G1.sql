
CREATE SCHEMA [Output] AUTHORIZATION [dbo]
go

CREATE SCHEMA [Utils] AUTHORIZATION [dbo]
go

CREATE SCHEMA [RawData] AUTHORIZATION [dbo]
go

CREATE SCHEMA [HumanResources]
go

CREATE SCHEMA [Sales]
go

CREATE SCHEMA [Locale]
go

CREATE SCHEMA [Production]
go

CREATE SCHEMA [Audit]
go

CREATE SCHEMA [sdString]
go

CREATE SCHEMA [sdNumber]
go

CREATE SCHEMA [sdDateTime]
go

CREATE SCHEMA [sdAddressesString]
go

CREATE SCHEMA [sdLongTextString]
go

CREATE SCHEMA [sdMarketingTextString]
go

CREATE SCHEMA [sdShortTextString]
go

CREATE SCHEMA [sdVehicleString]
go

CREATE SCHEMA [sdSequenceNumber]
go

CREATE SCHEMA [sdDate]
go

CREATE SCHEMA [sdHashKey]
go

CREATE SCHEMA [sdCountryStringVariant]
go

CREATE SCHEMA [dEuropeanCarManufacturer]
go

CREATE SCHEMA [sdOrdinalNumber]
go

CREATE SCHEMA [sdBusinessComponentString]
go

CREATE SCHEMA [sdNameString]
go

CREATE SCHEMA [sdTimeString]
go

CREATE SCHEMA [sdProjectString]
go

CREATE SCHEMA [sdAudit]
go

CREATE SCHEMA [sdBlob]
go

CREATE SCHEMA [sdKey]
go

CREATE SCHEMA [SequenceIdInsert]
go

CREATE SCHEMA [DbSecurity]
go

CREATE SCHEMA [sdFlag]
go

CREATE TYPE [dEuropeanCarManufacturer]
	FROM CHAR(18) NULL
go

CREATE TYPE [sdNumber]
	FROM INT NULL
go

CREATE TYPE [sdDatetime]
	FROM DATETIME NULL
go

CREATE TYPE [sdString]
	FROM NVARCHAR(20) NULL
go

CREATE TYPE [sdSequenceNumber]
	FROM INT NOT NULL
go

CREATE TYPE [SurrogateKeyInteger]
	FROM INT NOT NULL
go

CREATE TYPE [sdDate]
	FROM DATE NULL
go

CREATE TYPE [sdLongTextString]
	FROM NVARCHAR(200) NULL
go

CREATE TYPE [Note]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [sdShortTextString]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [StockCode]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [InvoiceNumber]
	FROM NCHAR(8) NULL
go

CREATE TYPE [sdVehicleString]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [VehicleIdentifier]
	FROM NVARCHAR(150) NULL
go

CREATE TYPE [VehicleColor]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [DateTimestamp]
	FROM DATETIME2(7) NOT NULL
go

CREATE TYPE [FlagBit]
	FROM INTEGER NULL
go

CREATE TYPE [sdAddressesString]
	FROM NVARCHAR(20) NULL
go

CREATE TYPE [AddressString]
	FROM NVARCHAR(60) NULL
go

CREATE TYPE [PostalCodeString]
	FROM NVARCHAR(9) NULL
go

CREATE TYPE [TownString]
	FROM NVARCHAR(30) NULL
go

CREATE TYPE [sdCountryStringVariant]
	FROM NVARCHAR(20) NULL
go

CREATE TYPE [CountryISO2]
	FROM NVARCHAR(2) NULL
go

CREATE TYPE [CountryISO3]
	FROM NCHAR(3) NULL
go

CREATE TYPE [CountryString]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [RegionString]
	FROM NVARCHAR(20) NULL
go

CREATE TYPE [sdBusinessComponentString]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [DepartmentString]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [sdOrdinalNumber]
	FROM INT NOT NULL
go

CREATE TYPE [CustomerComments]
	FROM NVARCHAR(200) NULL
go

CREATE TYPE [VehicleSalesThresholdCategory]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [sdNameString]
	FROM NVARCHAR(50) NOT NULL
go

CREATE TYPE [sdTimeString]
	FROM NVARCHAR(20) NULL
go

CREATE TYPE [ClassTimeString]
	FROM NCHAR(5) NULL
go

CREATE TYPE [sdProjectString]
	FROM NVARCHAR(50) NULL
go

CREATE TYPE [GrouplProjectNameString]
	FROM NVARCHAR(20) NULL
go

CREATE TYPE [FirstNameString]
	FROM NVARCHAR(25) NOT NULL
go

CREATE TYPE [LastNameString]
	FROM NVARCHAR(35) NOT NULL
go

CREATE TYPE [FullNameString]
	FROM NVARCHAR(60) NOT NULL
go

CREATE TYPE [VehicleManufacturerMarketingType]
	FROM NVARCHAR(25) NULL
go

CREATE TYPE [TransactionNumber]
	FROM INT NOT NULL
go

CREATE TYPE [LineItemNumber]
	FROM INT NOT NULL
go

CREATE TYPE [CustomerName]
	FROM NVARCHAR(65) NULL
go

CREATE TYPE [CustomerSpendCapacity]
	FROM NVARCHAR(25) NULL
go

CREATE TYPE [sdHashKey]
	FROM VARBINARY(32) NULL
go

CREATE TYPE [RowLevelHashKey]
	FROM VARBINARY(32) NULL
go

CREATE TYPE [DbAction]
	FROM CHAR(1) NULL
go

CREATE TYPE [sdAudit]
	FROM CHAR(1) NULL
go

CREATE TYPE [FlagYesNoString]
	FROM CHAR(1) NOT NULL
go

CREATE TYPE [sdMarketingTextString]
	FROM NVARCHAR(25) NULL
go

CREATE TYPE [sdKey]
	FROM INT NULL
go

CREATE TYPE [VehicleMakeString]
	FROM NVARCHAR(30) NULL
go

CREATE TYPE [VehicleModelString]
	FROM NVARCHAR(35) NULL
go

CREATE TYPE [StockIdNumber]
	FROM INT NOT NULL
go

CREATE TYPE [Currency]
	FROM NUMERIC(18,2) NULL
go

CREATE TYPE [DateYYYYMMDD]
	FROM DATE NULL
go

CREATE TYPE [IndividualProjectNameString]
	FROM NVARCHAR(60) NULL
go

CREATE TYPE [sdFlag]
	FROM INTEGER NULL
go

CREATE SEQUENCE [SequenceIdInsert].[Locale_Country_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Production_ManufacturerVehicleMake_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Production_ManufacturerModel_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Production_ManufacturerVehicleStock_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Sales_SalesOrderVehicleDetail_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Sales_SalesOrderVehicle_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[HumanResources_Staff_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Sales_Customer_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[DbSecurity_UserAuthorization_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Sales_SalesCategoryThreshold_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_HumanResourcesStaffHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_LocaleCountryHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_SalesCustomerHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_ProductionManufacturerModelHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_ProductionManufacturerVehicleMakeHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_ProductionManufacturerVehicleStockHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_SalesSalesOrderVehicleHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE SEQUENCE [SequenceIdInsert].[Audit_SalesSalesOrderVehicleDetailHistory_Id] AS bigint
START WITH 1
INCREMENT BY 1
go

CREATE TABLE [CommonColumnsForTriggerTemplate]
( 
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[UserAuthenticatedKey] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NOT NULL ,
	[SysEndTime]         [DateTimestamp]  NOT NULL 
)
go

CREATE TABLE [Country]
( 
	[CountryId]          [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Locale_Country_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Locale_Country_Id",
	[CountryISO3]        [CountryISO3]  NOT NULL ,
	[CountryName]        [CountryString]  NOT NULL ,
	[CountryISO2]        [CountryISO2]  NOT NULL ,
	[SalesRegion]        [RegionString]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Locale_Country_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [DF_Locale_Country_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Locale_Country_FireAuditTrigger]
		 DEFAULT  'N'

)
go

ALTER TABLE [Country]
	ADD CONSTRAINT [CK_Locale_Country_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" ) 
go

ALTER TABLE [Country]
	ADD CONSTRAINT [CK_Locale_Country_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [Country]
	ADD CONSTRAINT [CK_Locale_Country_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go

CREATE TABLE [Customer]
( 
	[CustomerId]         [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Sales_Customer_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_Customer_Id",
	[CustomerName]       [CustomerName]  NOT NULL ,
	[CustomerAddress1]   [AddressString]  NOT NULL ,
	[CustomerAddress2]   [AddressString]  NULL ,
	[CustomerTown]       [TownString]  NOT NULL ,
	[CustomerPostalCode] [PostalCodeString]  NULL ,
	[CountryId]          [SurrogateKeyInteger]  NOT NULL ,
	[IsCustomerReseller] [FlagBit]  NOT NULL ,
	[IsCustomerCreditRisk] [FlagBit]  NOT NULL ,
	[SpendCapacity]      [CustomerSpendCapacity]  NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Sales_Customer_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [DF_Sales_Customer_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Sales_Customer_FireAuditTrigger]
		 DEFAULT  'N'
)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [CK_Sales_Customer_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [CK_Sales_Customer_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [CK_Sales_Customer_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go

CREATE TABLE [HumanResourcesStaffHistory]
( 
	[StaffId]            [SurrogateKeyInteger]  NOT NULL ,
	[StaffName]          [FullNameString]  NOT NULL ,
	[Department]         [DepartmentString]  NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[ManagerId]          [SurrogateKeyInteger]  NULL ,
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[StaffHistoryId]     [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_HumanResourcesStaffHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_HumanResourcesStaffHistory_Id",
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_Audit_HumanResourcesStaffHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL 
)
go

ALTER TABLE [HumanResourcesStaffHistory]
	ADD CONSTRAINT [CK_Audit_HumanResourcesStaffHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go



CREATE TABLE [LocaleCountryHistory]
( 
	[CountryId]          [SurrogateKeyInteger]  NOT NULL ,
	[CountryISO3]        [CountryISO3]  NOT NULL ,
	[CountryName]        [CountryString]  NOT NULL ,
	[CountryISO2]        [CountryISO2]  NOT NULL ,
	[SalesRegion]        [RegionString]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[LocaleCountryHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_LocaleCountryHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_LocaleCountryHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_Audit_LocaleCountryHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL 
)
go

ALTER TABLE [LocaleCountryHistory]
	ADD CONSTRAINT [CK_LocaleCountryHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go

CREATE TABLE [ManufacturerModel]
( 
	[ManufacturerModelId] [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Production_ManufacturerModel_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Production_ManufacturerModel_Id",
	[ManufacturerModelName] [VehicleModelString]  NOT NULL ,
	[ManufacturerModelVariant] [VehicleModelString]  NULL ,
	[ManufacturerVehicleMakeId] [SurrogateKeyInteger]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Production_ManufacturerModel_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [DF_Production_ManufacturerModel_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Production_ManufacturerModel_FireAuditTrigger]
		 DEFAULT  'N'
)
go

ALTER TABLE [ManufacturerModel]
	ADD CONSTRAINT [CK_Production_ManufacturerModel_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [ManufacturerModel]
	ADD CONSTRAINT [CK_Production_ManufacturerModel_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [ManufacturerModel]
	ADD CONSTRAINT [CK_Production_ManufacturerModel_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go



CREATE TABLE [ManufacturerVehicleMake]
( 
	[ManufacturerVehicleMakeId] [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Production_ManufacturerVehicleMake_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Production_ManufacturerVehicleMake_Id",
	[ManufacturerVehicleMakeName] [VehicleMakeString]  NOT NULL ,
	[CountryId]          [SurrogateKeyInteger]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Production_ManufacturerVehicleMake_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [CK_Production_ManufacturerVehicleMake_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Production_ManufacturerVehicleMakel_FireAuditTrigger]
		 DEFAULT  'N',
	[MarketingType]      [VehicleManufacturerMarketingType] 
)
go

ALTER TABLE [ManufacturerVehicleMake]
	ADD CONSTRAINT [CK_Production_ManufacturerVehicleMake_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [ManufacturerVehicleMake]
	ADD CONSTRAINT [CK_Production_ManufacturerVehicleMake_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [ManufacturerVehicleMake]
	ADD CONSTRAINT [CK_Production_ManufacturerVehicleMakel_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go

CREATE TABLE [ManufacturerVehicleStock]
( 
	[ManufacturerVehicleStockId] [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Production_ManufacturerVehicleStock_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Production_ManufacturerVehicleStock_Id",
	[StockCode]          [StockCode]  NOT NULL ,
	[Cost]               [Currency]  NOT NULL ,
	[RepairsCharge]      [Currency]  NOT NULL ,
	[PartsCharge]        [Currency]  NOT NULL ,
	[DeliveryCharge]     [Currency]  NOT NULL ,
	[IsPremiumRoadHandlingPackage] [FlagBit]  NOT NULL ,
	[VehicleColor]       [VehicleColor]  NOT NULL ,
	[CustomerComment]    [CustomerComments]  NULL ,
	[ModelId]            [SurrogateKeyInteger]  NULL ,
	[PurchaseDate]       [DateYYYYMMDD]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Production_ManufacturerVehicleStock_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [CK_Production_ManufacturerVehicleStock_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Production_ManfuacturerVehicleStock_FireAuditTrigger]
		 DEFAULT  'N'
)
go

ALTER TABLE [ManufacturerVehicleStock]
	ADD CONSTRAINT [CK_Production_ManufacturerVehicleStock_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [ManufacturerVehicleStock]
	ADD CONSTRAINT [CK_Production_ManufacturerVehicleStock_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [ManufacturerVehicleStock]
	ADD CONSTRAINT [CK_Production_ManfuacturerVehicleStock_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go

CREATE TABLE [ProductionManufacturerModelHistory]
( 
	[ManufacturerModelId] [SurrogateKeyInteger]  NOT NULL ,
	[ManufacturerModelName] [VehicleModelString]  NOT NULL ,
	[ManufacturerModelVariant] [VehicleModelString]  NULL ,
	[ManufacturerVehicleMakeId] [SurrogateKeyInteger]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[ProductionManufacturerModelHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_ProductionManufacturerVehicleModelHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_ProductionManufacturerModelHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_ProductionManufacturerVehicleModelHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL 
)
go

ALTER TABLE [ProductionManufacturerModelHistory]
	ADD CONSTRAINT [CK_ProductionManufacturerVehicleModelHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go

CREATE TABLE [ProductionManufacturerVehicleMakeHistory]
( 
	[ManufacturerVehicleMakeId] [SurrogateKeyInteger]  NOT NULL ,
	[ManufacturerVehicleMakeName] [VehicleMakeString]  NOT NULL ,
	[CountryId]          [SurrogateKeyInteger]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[ProductionManufacturerVehicleMakeHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_ProductionManufacturerVehicleMakeHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_ProductionManufacturerVehicleMakeHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_ProductionManufacturerVehicleMakeHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL ,
	[MarketingType]      [VehicleManufacturerMarketingType] 
)
go

ALTER TABLE [ProductionManufacturerVehicleMakeHistory]
	ADD CONSTRAINT [CK_Audit_ProductionManufacturerVehicleHistory_AuditDateTimeStamp]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go

CREATE TABLE [ProductionManufacturerVehicleStockHistory]
( 
	[ManufacturerVehicleStockId] [SurrogateKeyInteger]  NOT NULL ,
	[StockCode]          [StockCode]  NOT NULL ,
	[Cost]               [Currency]  NOT NULL ,
	[RepairsCharge]      [Currency]  NOT NULL ,
	[PartsCharge]        [Currency]  NOT NULL ,
	[DeliveryCharge]     [Currency]  NOT NULL ,
	[IsPremiumRoadHandlingPackage] [FlagBit]  NOT NULL ,
	[VehicleColor]       [VehicleColor]  NOT NULL ,
	[CustomerComment]    [CustomerComments]  NULL ,
	[ModelId]            [SurrogateKeyInteger] ,
	[StockId]            [StockIdNumber]  NULL ,
	[PurchaseDate]       [DateYYYYMMDD]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[ProductionManufacturerVehicleStockHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_ProductionManufacturerVehicleStockHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_ProductionManufacturerVehicleStockHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_ProductionManufacturerVehicleStockHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL 
)
go

ALTER TABLE [ProductionManufacturerVehicleStockHistory]
	ADD 	CONSTRAINT [CK_ProductionManufacturerVehicleStockHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go


CREATE TABLE [SalesCategoryThreshold]
( 
	[SalesCategoryThresholdId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Sales_SalesCategoryThresholdId]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_SalesCategoryThreshold_Id",
	[LowerThreshold]     [Currency]  NOT NULL ,
	[UpperThreshold]     [Currency]  NOT NULL ,
	[CategoryDescription] AS ('Create computed column based upon the SalesCategoryThreshold Table') COLLATE SQL_Latin1_General_CP1_CI_AS PERSISTED NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Sales_SalesCategoryThreshold_SysStartTime]
		 DEFAULT  sysdatetime()
,
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [CK_Sales_SalesCategoryThreshold_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL 
)
go

ALTER TABLE [SalesCategoryThreshold]
	ADD CONSTRAINT [CK_Sales_SalesCategoryThreshold_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [SalesCategoryThreshold]
	ADD CONSTRAINT [CK_Sales_SalesCategoryThreshold_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go



CREATE TABLE [SalesCustomerHistory]
( 
	[CustomerId]         [SurrogateKeyInteger]  NOT NULL ,
	[CustomerName]       [CustomerName]  NOT NULL ,
	[CustomerAddress1]   [AddressString]  NOT NULL ,
	[CustomerAddress2]   [AddressString]  NULL ,
	[CustomerTown]       [TownString]  NOT NULL ,
	[CustomerPostalCode] [PostalCodeString]  NULL ,
	[CountryId]          [SurrogateKeyInteger]  NOT NULL ,
	[IsCustomerReseller] [FlagBit]  NOT NULL ,
	[IsCustomerCreditRisk] [FlagBit]  NOT NULL ,
	[SpendCapacity]      [CustomerSpendCapacity]  NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[SalesCustomerHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_SalesCustomerHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesCustomerHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_Audit_SalesSalesCustomerHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL 
)
go

ALTER TABLE [SalesCustomerHistory]
	ADD CONSTRAINT [CK_Audit_SalesSalesCustomerHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go

CREATE TABLE [SalesOrderVehicle]
( 
	[SalesOrderVehicleId] [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Sales_SalesOrderVehicle_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_SalesOrderVehicle_Id",
	[CustomerId]         [SurrogateKeyInteger]  NOT NULL ,
	[StaffId]            [SurrogateKeyInteger]  NOT NULL ,
	[InvoiceNumber]      [InvoiceNumber]  NOT NULL ,
	[TotalSalePrice]     [Currency]  NOT NULL ,
	[SaleDate]           [DateYYYYMMDD]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [CK_Sales_SalesOrderVehicle_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [CK_Sales_SalesOrderVehicle_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Sales_SalesOrderVehicle_FireAuditTrigger]
		 DEFAULT  'N',
	[SalesCategoryThresholdId] [SurrogateKeyInteger]  NULL 
)
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [CK_Sales_SalesOrderVehicle_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [CK_Sales_SalesOrderVehicle_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [CK_Sales_SalesOrderVehicle_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go


CREATE TABLE [SalesOrderVehicleDetail]
( 
	[SalesOrderVehicleDetailId] [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_Sales_SalesOrderVehicleDetail_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Sales_SalesOrderVehicleDetail_Id",
	[SalesOrderVehicleId] [SurrogateKeyInteger]  NULL ,
	[LineItemNumber]     [LineItemNumber]  NOT NULL ,
	[SalePrice]          [Currency]  NOT NULL ,
	[LineItemDiscount]   [Currency]  NOT NULL ,
	[DerivedDiscountedSalePrice] AS "SalePrice" - "LineItemDiscount" PERSISTED NOT NULL ,
	[ManufacturerVehicleStockId] [SurrogateKeyInteger]  NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_Sales_SalesOrderVehicleDetail_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [DF_Sales_SalesOrderVehicleDetail_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_Sales_SalesOrderVehicleDetail_FireAuditTrigger]
		 DEFAULT  'N'

)
go

ALTER TABLE [SalesOrderVehicleDetail]
	ADD	CONSTRAINT [CK_Sales_SalesOrderVehicleDetail_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [SalesOrderVehicleDetail]
	ADD	CONSTRAINT [CK_Sales_SalesOrderVehicleDetail_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [SalesOrderVehicleDetail]
	ADD	CONSTRAINT [CK_Sales_SalesOrderVehicleDetail_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go

CREATE TABLE [SalesSalesOrderVehicleDetailHistory]
( 
	[SalesOrderVehicleDetailId] [SurrogateKeyInteger]  NOT NULL ,
	[SalesOrderVehicleId] [SurrogateKeyInteger]  NULL ,
	[LineItemNumber]     [LineItemNumber]  NOT NULL ,
	[SalePrice]          [Currency]  NOT NULL ,
	[LineItemDiscount]   [Currency]  NOT NULL ,
	[ManufacturerVehicleStockId] [SurrogateKeyInteger] ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[SalesSalesOrderVehicleDetailHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_SalesSalesOrderVehicleDetailHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesSalesOrderVehicleDetailHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[DerivedDiscountedSalePrice] [Currency] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_SalesSalesOrderVehicleDetailHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL 
)
go

ALTER TABLE [SalesSalesOrderVehicleDetailHistory]
	ADD	CONSTRAINT [CK_SalesSalesOrderVehicleDetailHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go

CREATE TABLE [SalesSalesOrderVehicleHistory]
( 
	[SalesOrderVehicleId] [SurrogateKeyInteger]  NOT NULL ,
	[CustomerId]         [SurrogateKeyInteger]  NOT NULL ,
	[StaffId]            [SurrogateKeyInteger]  NOT NULL ,
	[InvoiceNumber]      [InvoiceNumber]  NOT NULL ,
	[TotalSalePrice]     [Currency]  NOT NULL ,
	[SaleDate]           [DateYYYYMMDD]  NOT NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL ,
	[SysEndTime]         [DateTimestamp]  NULL ,
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[SalesSalesOrderVehicleHistoryId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_Audit_SalesSalesOrderVehicleHistory_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."Audit_SalesSalesOrderVehicleHistory_Id",
	[Note]               [Note]  NULL ,
	[IsDeleted]          [FlagYesNoString]  NOT NULL ,
	[TransactionNumber]  [TransactionNumber]  NOT NULL ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] ,
	[AuditDateTimeStamp] [DateTimestamp] 
	CONSTRAINT [DF_SalesSalesOrderVehicleHistory_AuditDateTimeStamp]
		 DEFAULT  sysdatetime(),
	[DBAction]           [DbAction]  NOT NULL ,
	[SalesCategoryThresholdId] [SurrogateKeyInteger]  NULL 
)
go

ALTER TABLE [SalesSalesOrderVehicleDetailHistory]
	ADD	CONSTRAINT [CK_SalesSalesOrderVehicleHistory_DBAction]
		CHECK  ( DBAction='U' OR DBAction='I' OR DBAction='D' )
go


CREATE TABLE d
( 
	[StaffId]            [SurrogateKeyInteger]  NOT NULL 
	CONSTRAINT [DF_HumanResources_Staff_Id]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."HumanResources_Staff_Id",
	[ManagerId]          [SurrogateKeyInteger]  NULL ,
	[StaffName]          [FullNameString]  NOT NULL ,
	[Department]         [DepartmentString]  NULL ,
	[UserAuthorizationId] [SurrogateKeyInteger]  NOT NULL ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_HumanResources_Staff_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [DF_HumanResources_Staff_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[RowLevelHashKey]    [RowLevelHashKey]  NULL ,
	[TransactionNumber]  [TransactionNumber] ,
	[Note]               [Note] ,
	[PriorRowLevelHashKey] [RowLevelHashKey] ,
	[FireAuditTrigger]   [FlagYesNoString] 
	CONSTRAINT [DF_HumanResources_Staff_FireAuditTrigger]
		 DEFAULT  'N'
)
go

ALTER TABLE [Staff]
	ADD	CONSTRAINT [CK_HumanResources_Staff_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [Staff]
	ADD	CONSTRAINT [CK_HumanResources_Staff_FireAuditTrigger]
		CHECK  ( FireAuditTrigger='Y' OR FireAuditTrigger='N' )
go

CREATE TABLE [UserAuthorization]
( 
	[UserAuthorizationId] [SurrogateKeyInteger] 
	CONSTRAINT [DF_DbSecurity_UserAuthorization_Id_903797191]
		 DEFAULT  NEXT VALUE FOR "SequenceIdInsert"."DbSecurity_UserAuthorization_Id",
	[ClassTime]          [ClassTimeString] 
	CONSTRAINT [DF_DbSecurity_UserAuthorization_ClassTime]
		 DEFAULT  '10:45',
	[IndividualProject]  [IndividualProjectNameString] 
	CONSTRAINT [DF_DbSecurity_UserAuthorization_IndividualProject]
		 DEFAULT  'CSCI381 Final Project',
	[GroupMemberLastName] [LastNameString] ,
	[GroupMemberFirstName] [FirstNameString] ,
	[SysStartTime]       [DateTimestamp]  NULL 
	CONSTRAINT [DF_DbSecurity_UserAuthorization_SysStartTime]
		 DEFAULT  sysdatetime(),
	[SysEndTime]         [DateTimestamp]  NULL 
	CONSTRAINT [DF_DbSecurity_UserAuthorization_SysEndTime]
		 DEFAULT  '99991231 23:59:59.9999999',
	[GroupName]          [GrouplProjectNameString]  NOT NULL 
	CONSTRAINT [DF_DbSecurity_UserAuthorization_GroupName]
		 DEFAULT  'Group 3'
)
go

ALTER TABLE [UserAuthorization]
	ADD	CONSTRAINT [CK_DbSecurity_UserAuthorization_ClassTime]
		CHECK  ( ClassTime LIKE '[0-1][0-9]:[0-5][0-9]' OR ClassTime LIKE '[0-2][0-4]:[0-5][0-9]' )
go

ALTER TABLE [UserAuthorization]
	ADD	CONSTRAINT [CK_DbSecurity_UserAuthorization_SysStartTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [UserAuthorization]
	ADD	CONSTRAINT [CK_DbSecurity_UserAuthorization_SysEndTime]
		CHECK  ( "SysEndTime" >= "SysStartTime" )
go

ALTER TABLE [Country]
	ADD CONSTRAINT [PK_Country] PRIMARY KEY  CLUSTERED ([CountryId] ASC)
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [PK_Customer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC)
go

ALTER TABLE [HumanResourcesStaffHistory]
	ADD CONSTRAINT [XPKStaff] PRIMARY KEY  CLUSTERED ([StaffHistoryId] ASC)
go

ALTER TABLE [LocaleCountryHistory]
	ADD CONSTRAINT [PK_Country] PRIMARY KEY  CLUSTERED ([LocaleCountryHistoryId] ASC)
go

ALTER TABLE [ManufacturerModel]
	ADD CONSTRAINT [PK_Model_1] PRIMARY KEY  CLUSTERED ([ManufacturerModelId] ASC)
go

ALTER TABLE [ManufacturerVehicleMake]
	ADD CONSTRAINT [PK_Make] PRIMARY KEY  CLUSTERED ([ManufacturerVehicleMakeId] ASC)
go

ALTER TABLE [ManufacturerVehicleStock]
	ADD CONSTRAINT [PK_Stock] PRIMARY KEY  CLUSTERED ([ManufacturerVehicleStockId] ASC)
go

ALTER TABLE [ProductionManufacturerModelHistory]
	ADD CONSTRAINT [PK_Model_1] PRIMARY KEY  CLUSTERED ([ProductionManufacturerModelHistoryId] ASC)
go

ALTER TABLE [ProductionManufacturerVehicleMakeHistory]
	ADD CONSTRAINT [PK_Make] PRIMARY KEY  CLUSTERED ([ProductionManufacturerVehicleMakeHistoryId] ASC)
go

ALTER TABLE [ProductionManufacturerVehicleStockHistory]
	ADD CONSTRAINT [PK_Stock] PRIMARY KEY  CLUSTERED ([ProductionManufacturerVehicleStockHistoryId] ASC)
go

ALTER TABLE [SalesCategoryThreshold]
	ADD CONSTRAINT [XPKSales_Category_Threshold] PRIMARY KEY  CLUSTERED ([SalesCategoryThresholdId] ASC)
go

ALTER TABLE [SalesCustomerHistory]
	ADD CONSTRAINT [PK_Customer] PRIMARY KEY  CLUSTERED ([SalesCustomerHistoryId] ASC)
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [XPKSales_Order_Vehicle] PRIMARY KEY  CLUSTERED ([SalesOrderVehicleId] ASC)
go

ALTER TABLE [SalesOrderVehicleDetail]
	ADD CONSTRAINT [PK_SalesDetails] PRIMARY KEY  CLUSTERED ([SalesOrderVehicleDetailId] ASC)
go

ALTER TABLE [SalesSalesOrderVehicleDetailHistory]
	ADD CONSTRAINT [PK_SalesDetails] PRIMARY KEY  CLUSTERED ([SalesSalesOrderVehicleDetailHistoryId] ASC)
go

ALTER TABLE [SalesSalesOrderVehicleHistory]
	ADD CONSTRAINT [XPKSales_Sales_Order_Vehicle_History] PRIMARY KEY  CLUSTERED ([SalesSalesOrderVehicleHistoryId] ASC)
go

ALTER TABLE [Staff]
	ADD CONSTRAINT [XPKStaff] PRIMARY KEY  CLUSTERED ([StaffId] ASC)
go

ALTER TABLE [UserAuthorization]
	ADD CONSTRAINT [XPKUser_Authorization] PRIMARY KEY  CLUSTERED ([UserAuthorizationId] ASC)
go

CREATE VIEW [Utils].[uvw_FindColumnDefinitionPlusDefaultAndCheckConstraint] AS  SELECT  concat( tbl.TABLE_SCHEMA , '.' , tbl.TABLE_NAME )  AS FullyQualifiedTableName, tbl.TABLE_SCHEMA AS SchemaName, tbl.TABLE_NAME AS TableName, col.COLUMN_NAME AS ColumnName, col.ORDINAL_POSITION AS OrdinalPosition,  concat( col.DOMAIN_SCHEMA , '.' , col.DOMAIN_NAME )  AS FullyQualifiedDomainName, col.DOMAIN_NAME AS DomainName, CASE WHEN col.DATA_TYPE = 'varchar' THEN  concat( 'varchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'char' THEN  concat( 'char(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'nvarchar' THEN  concat( 'nvarchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'nchar' THEN  concat( 'nchar(' , CHARACTER_MAXIMUM_LENGTH , ')' )  WHEN col.DATA_TYPE = 'numeric' THEN  concat( 'numeric(' , NUMERIC_PRECISION_RADIX , ', ' , NUMERIC_SCALE , ')' )  WHEN col.DATA_TYPE = 'decimal' THEN  concat( 'decimal(' , NUMERIC_PRECISION_RADIX , ', ' , NUMERIC_SCALE , ')' )  ELSE col.DATA_TYPE END AS DataType, col.IS_NULLABLE AS IsNullable, dcn.DefaultName, col.COLUMN_DEFAULT AS DefaultNameDefinition, cc.CONSTRAINT_NAME AS CheckConstraintRuleName, cc.CHECK_CLAUSE AS CheckConstraintRuleNameDefinition FROM (  SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE ( TABLE_TYPE = 'BASE TABLE' ) ) AS tbl    INNER JOIN   (  SELECT TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, ORDINAL_POSITION, COLUMN_DEFAULT, IS_NULLABLE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_PRECISION_RADIX, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_CATALOG, CHARACTER_SET_SCHEMA, CHARACTER_SET_NAME, COLLATION_CATALOG, COLLATION_SCHEMA, COLLATION_NAME, DOMAIN_CATALOG, DOMAIN_SCHEMA, DOMAIN_NAME FROM INFORMATION_SCHEMA.COLUMNS ) AS col  ON col.TABLE_CATALOG = tbl.TABLE_CATALOG AND col.TABLE_SCHEMA = tbl.TABLE_SCHEMA AND col.TABLE_NAME = tbl.TABLE_NAME   LEFT OUTER JOIN   (  SELECT t.name AS TableName,  schema_name( s.schema_id )  AS SchemaName, ac.name AS ColumnName, d.name AS DefaultName FROM sys.all_columns AS ac   INNER JOIN   sys.tables AS t ON ac.object_id = t.object_id   INNER JOIN   sys.schemas AS s ON t.schema_id = s.schema_id   INNER JOIN   sys.default_constraints AS d ON ac.default_object_id = d.object_id ) AS dcn  ON dcn.SchemaName = tbl.TABLE_SCHEMA AND dcn.TableName = tbl.TABLE_NAME AND dcn.ColumnName = col.COLUMN_NAME   LEFT OUTER JOIN   (  SELECT cu.TABLE_CATALOG, cu.TABLE_SCHEMA, cu.TABLE_NAME, cu.COLUMN_NAME, c.CONSTRAINT_CATALOG, c.CONSTRAINT_SCHEMA, c.CONSTRAINT_NAME, c.CHECK_CLAUSE FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE AS cu   INNER JOIN   INFORMATION_SCHEMA.CHECK_CONSTRAINTS AS c ON c.CONSTRAINT_NAME = cu.CONSTRAINT_NAME ) AS cc  ON cc.TABLE_SCHEMA = tbl.TABLE_SCHEMA AND cc.TABLE_NAME = tbl.TABLE_NAME AND cc.COLUMN_NAME = col.COLUMN_NAME
go


ALTER TABLE [Country]
	ADD CONSTRAINT [FK_Country_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Customer]
	ADD CONSTRAINT [FK_Customer_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country]([CountryId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Customer]
	ADD CONSTRAINT [FK_Customer_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ManufacturerModel]
	ADD CONSTRAINT [FK_ManufacturerModel_ManufacturerVehicleMake] FOREIGN KEY ([ManufacturerVehicleMakeId]) REFERENCES [ManufacturerVehicleMake]([ManufacturerVehicleMakeId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ManufacturerModel]
	ADD CONSTRAINT [FK_ManufacturerModel_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ManufacturerVehicleMake]
	ADD CONSTRAINT [FK_ManufacturerVehicleMake_Country] FOREIGN KEY ([CountryId]) REFERENCES [Country]([CountryId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ManufacturerVehicleMake]
	ADD CONSTRAINT [FK_ManufacturerVehicleMake_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [ManufacturerVehicleStock]
	ADD CONSTRAINT [FK_ManufacturerVehicleStock_ManufacturerModel] FOREIGN KEY ([ModelId]) REFERENCES [ManufacturerModel]([ManufacturerModelId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [ManufacturerVehicleStock]
	ADD CONSTRAINT [FK_ManufacturerVehicleStock_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SalesCategoryThreshold]
	ADD CONSTRAINT [FK_SalesCategoryThreshold_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [FK_SalesOrderVehicle_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [Customer]([CustomerId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [FK_SalesOrderVehicle_Staff] FOREIGN KEY ([StaffId]) REFERENCES [Staff]([StaffId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [FK_SalesOrderVehicle_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [SalesOrderVehicle]
	ADD CONSTRAINT [FK_SalesOrderVehicle_SalesCategoryThreshold] FOREIGN KEY ([SalesCategoryThresholdId]) REFERENCES [SalesCategoryThreshold]([SalesCategoryThresholdId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [SalesOrderVehicleDetail]
	ADD CONSTRAINT [FK_SalesOrderVehicleDetail_SalesOrderVehicle] FOREIGN KEY ([SalesOrderVehicleId]) REFERENCES [SalesOrderVehicle]([SalesOrderVehicleId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [SalesOrderVehicleDetail]
	ADD CONSTRAINT [FK_SalesOrderVehicleDetail_ManufacturerVehicleStock] FOREIGN KEY ([ManufacturerVehicleStockId]) REFERENCES [ManufacturerVehicleStock]([ManufacturerVehicleStockId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [SalesOrderVehicleDetail]
	ADD CONSTRAINT [FK_SalesOrderVehicleDetail_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [Staff]
	ADD CONSTRAINT [FK_Staff_Staff] FOREIGN KEY ([ManagerId]) REFERENCES [Staff]([StaffId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Staff]
	ADD CONSTRAINT [FK_Staff_UserAuthorization] FOREIGN KEY ([UserAuthorizationId]) REFERENCES [UserAuthorization]([UserAuthorizationId])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go
