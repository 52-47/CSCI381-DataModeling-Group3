
-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Locale"."Country" as "d"
    WHERE "d"."CountryId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go

-- View Name: "Audit"."FindUniqueTablePkyLocaleCountry"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus LocaleCountry

CREATE VIEW "Audit"."vwFindUniqueTablePkyLocaleCountry" AS

  SELECT "CurrentTable"."CountryId"
  FROM "Locale"."Country" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."CountryId"
  FROM "Audit"."LocaleCountryHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Locale.uTd_Country on Locale.Country
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Locale"."uTd_Country" on "Locale"."Country"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."LocaleCountryHistory"
(
  "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Locale.uTi_Country on Locale.Country
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Locale"."uTi_Country" on "Locale"."Country"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"("i"."CountryId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Locale"."Country" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."CountryId" = "ut"."CountryId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Locale.uTu_Country on Locale.Country
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Locale"."uTu_Country" on "Locale"."Country"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."CountryId" = "d"."CountryId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."LocaleCountryHistory"
    (
      "d"."CountryId","d"."CountryISO3","d"."CountryName","d"."CountryISO2","d"."SalesRegion","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."CountryId" = "d"."CountryId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"("i"."CountryId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Locale"."Country" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."CountryId" = "ut"."CountryId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."CountryId" = "d"."CountryId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfLocaleCountry" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfLocaleCountry" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Locale"."Country" AS "d"
   WHERE "d"."CountryId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."LocaleCountryHistory" as "d"
   WHERE "d"."CountryId" = @Pky
  );

go


















-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "HumanResources"."Staff" as "d"
    WHERE "d"."StaffId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go


-- View Name: "Audit"."FindUniqueTablePkyHumanResourcesStaff"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus HumanResourcesStaff

CREATE VIEW "Audit"."vwFindUniqueTablePkyHumanResourcesStaff" AS

  SELECT "CurrentTable"."StaffId"
  FROM "HumanResources"."Staff" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."StaffId"
  FROM "Audit"."HumanResourcesStaffHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: HumanResources.uTd_Staff on HumanResources.Staff
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "HumanResources"."uTd_Staff" on "HumanResources"."Staff"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."HumanResourcesStaffHistory"
(
  "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: HumanResources.uTi_Staff on HumanResources.Staff
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "HumanResources"."uTi_Staff" on "HumanResources"."Staff"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"("i"."StaffId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "HumanResources"."Staff" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."StaffId" = "ut"."StaffId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: HumanResources.uTu_Staff on HumanResources.Staff
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "HumanResources"."uTu_Staff" on "HumanResources"."Staff"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."StaffId" = "d"."StaffId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."HumanResourcesStaffHistory"
    (
      "d"."StaffId","d"."StaffName","d"."ManagerId","d"."Department","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."StaffId" = "d"."StaffId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"("i"."StaffId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "HumanResources"."Staff" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."StaffId" = "ut"."StaffId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."StaffId" = "d"."StaffId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfHumanResourcesStaff" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfHumanResourcesStaff" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "HumanResources"."Staff" AS "d"
   WHERE "d"."StaffId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."HumanResourcesStaffHistory" as "d"
   WHERE "d"."StaffId" = @Pky
  );

go





-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Production"."ManufacturerModel" as "d"
    WHERE "d"."ManufacturerModelId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go

-- View Name: "Audit"."FindUniqueTablePkyProductionManufacturerModel"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus ProductionManufacturerModel

CREATE VIEW "Audit"."vwFindUniqueTablePkyProductionManufacturerModel" AS

  SELECT "CurrentTable"."ManufacturerModelId"
  FROM "Production"."ManufacturerModel" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."ManufacturerModelId"
  FROM "Audit"."ProductionManufacturerModelHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTd_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Production"."uTd_ManufacturerModel" on "Production"."ManufacturerModel"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."ProductionManufacturerModelHistory"
(
  "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTi_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Production"."uTi_ManufacturerModel" on "Production"."ManufacturerModel"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"("i"."ManufacturerModelId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Production"."ManufacturerModel" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."ManufacturerModelId" = "ut"."ManufacturerModelId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTu_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Production"."uTu_ManufacturerModel" on "Production"."ManufacturerModel"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."ManufacturerModelId" = "d"."ManufacturerModelId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."ProductionManufacturerModelHistory"
    (
      "d"."ManufacturerModelId","d"."ManufacturerVehicleMakeId","d"."ManufacturerModelName","d"."ManufacturerModelVariant","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."ManufacturerModelId" = "d"."ManufacturerModelId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"("i"."ManufacturerModelId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Production"."ManufacturerModel" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."ManufacturerModelId" = "ut"."ManufacturerModelId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."ManufacturerModelId" = "d"."ManufacturerModelId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerModel" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerModel" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Production"."ManufacturerModel" AS "d"
   WHERE "d"."ManufacturerModelId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."ProductionManufacturerModelHistory" as "d"
   WHERE "d"."ManufacturerModelId" = @Pky
  );

go





-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Production"."ManufacturerVehicleMake" as "d"
    WHERE "d"."ManufacturerVehicleMakeId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go


-- View Name: "Audit"."FindUniqueTablePkyProductionManufacturerVehicleMake"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus ProductionManufacturerVehicleMake

CREATE VIEW "Audit"."vwFindUniqueTablePkyProductionManufacturerVehicleMake" AS

  SELECT "CurrentTable"."ManufacturerVehicleMakeId"
  FROM "Production"."ManufacturerVehicleMake" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."ManufacturerVehicleMakeId"
  FROM "Audit"."ProductionManufacturerVehicleMakeHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTd_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Production"."uTd_ManufacturerVehicleMake" on "Production"."ManufacturerVehicleMake"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."ProductionManufacturerVehicleMakeHistory"
(
  "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTi_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Production"."uTi_ManufacturerVehicleMake" on "Production"."ManufacturerVehicleMake"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"("i"."ManufacturerVehicleMakeId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Production"."ManufacturerVehicleMake" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."ManufacturerVehicleMakeId" = "ut"."ManufacturerVehicleMakeId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTu_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Production"."uTu_ManufacturerVehicleMake" on "Production"."ManufacturerVehicleMake"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."ManufacturerVehicleMakeId" = "d"."ManufacturerVehicleMakeId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."ProductionManufacturerVehicleMakeHistory"
    (
      "d"."ManufacturerVehicleMakeId","d"."ManufacturerVehicleMakeName","d"."CountryId","d"."MarketingType","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."ManufacturerVehicleMakeId" = "d"."ManufacturerVehicleMakeId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"("i"."ManufacturerVehicleMakeId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Production"."ManufacturerVehicleMake" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."ManufacturerVehicleMakeId" = "ut"."ManufacturerVehicleMakeId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."ManufacturerVehicleMakeId" = "d"."ManufacturerVehicleMakeId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleMake" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleMake" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Production"."ManufacturerVehicleMake" AS "d"
   WHERE "d"."ManufacturerVehicleMakeId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."ProductionManufacturerVehicleMakeHistory" as "d"
   WHERE "d"."ManufacturerVehicleMakeId" = @Pky
  );

go






-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Production"."ManufacturerVehicleStock" as "d"
    WHERE "d"."ManufacturerVehicleStockId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go

-- View Name: "Audit"."FindUniqueTablePkyProductionManufacturerVehicleStock"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus ProductionManufacturerVehicleStock

CREATE VIEW "Audit"."vwFindUniqueTablePkyProductionManufacturerVehicleStock" AS

  SELECT "CurrentTable"."ManufacturerVehicleStockId"
  FROM "Production"."ManufacturerVehicleStock" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."ManufacturerVehicleStockId"
  FROM "Audit"."ProductionManufacturerVehicleStockHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTd_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Production"."uTd_ManufacturerVehicleStock" on "Production"."ManufacturerVehicleStock"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."ProductionManufacturerVehicleStockHistory"
(
  "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTi_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Production"."uTi_ManufacturerVehicleStock" on "Production"."ManufacturerVehicleStock"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"("i"."ManufacturerVehicleStockId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Production"."ManufacturerVehicleStock" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."ManufacturerVehicleStockId" = "ut"."ManufacturerVehicleStockId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Production.uTu_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Production"."uTu_ManufacturerVehicleStock" on "Production"."ManufacturerVehicleStock"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."ManufacturerVehicleStockId" = "d"."ManufacturerVehicleStockId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."ProductionManufacturerVehicleStockHistory"
    (
      "d"."ManufacturerVehicleStockId","d"."StockCode","d"."ModelId","d"."Cost","d"."RepairsCharge","d"."PartsCharge","d"."DeliveryCharge","d"."IsPremiumRoadHandlingPackage","d"."VehicleColor","d"."CustomerComment","d"."PurchaseDate","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."ManufacturerVehicleStockId" = "d"."ManufacturerVehicleStockId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"("i"."ManufacturerVehicleStockId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Production"."ManufacturerVehicleStock" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."ManufacturerVehicleStockId" = "ut"."ManufacturerVehicleStockId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."ManufacturerVehicleStockId" = "d"."ManufacturerVehicleStockId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleStock" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleStock" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Production"."ManufacturerVehicleStock" AS "d"
   WHERE "d"."ManufacturerVehicleStockId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."ProductionManufacturerVehicleStockHistory" as "d"
   WHERE "d"."ManufacturerVehicleStockId" = @Pky
  );

go









-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Sales"."Customer" as "d"
    WHERE "d"."CustomerId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go

-- View Name: "Audit"."FindUniqueTablePkySalesCustomer"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesCustomer

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesCustomer" AS

  SELECT "CurrentTable"."CustomerId"
  FROM "Sales"."Customer" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."CustomerId"
  FROM "Audit"."SalesCustomerHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTd_Customer on Sales.Customer
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Sales"."uTd_Customer" on "Sales"."Customer"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."SalesCustomerHistory"
(
  "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTi_Customer on Sales.Customer
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTi_Customer" on "Sales"."Customer"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"("i"."CustomerId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Sales"."Customer" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."CustomerId" = "ut"."CustomerId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTu_Customer on Sales.Customer
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTu_Customer" on "Sales"."Customer"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."CustomerId" = "d"."CustomerId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesCustomerHistory"
    (
      "d"."CustomerId","d"."CustomerName","d"."CustomerAddress1","d"."CustomerAddress2","d"."CustomerTown","d"."CustomerPostalCode","d"."CountryId","d"."IsCustomerReseller","d"."IsCustomerCreditRisk","d"."SpendCapacity","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."CustomerId" = "d"."CustomerId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"("i"."CustomerId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Sales"."Customer" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."CustomerId" = "ut"."CustomerId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."CustomerId" = "d"."CustomerId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesCustomer" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesCustomer" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Sales"."Customer" AS "d"
   WHERE "d"."CustomerId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."SalesCustomerHistory" as "d"
   WHERE "d"."CustomerId" = @Pky
  );

go







-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Sales"."SalesCategoryThreshold" as "d"
    WHERE "d"."SalesCategoryThresholdId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go


-- View Name: "Audit"."FindUniqueTablePkySalesSalesCategoryThreshold"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesSalesCategoryThreshold

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesSalesCategoryThreshold" AS

  SELECT "CurrentTable"."SalesCategoryThresholdId"
  FROM "Sales"."SalesCategoryThreshold" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."SalesCategoryThresholdId"
  FROM "Audit"."SalesSalesCategoryThresholdHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTd_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Sales"."uTd_SalesCategoryThreshold" on "Sales"."SalesCategoryThreshold"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."SalesSalesCategoryThresholdHistory"
(
  "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTi_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTi_SalesCategoryThreshold" on "Sales"."SalesCategoryThreshold"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"("i"."SalesCategoryThresholdId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Sales"."SalesCategoryThreshold" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."SalesCategoryThresholdId" = "ut"."SalesCategoryThresholdId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTu_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTu_SalesCategoryThreshold" on "Sales"."SalesCategoryThreshold"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."SalesCategoryThresholdId" = "d"."SalesCategoryThresholdId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesSalesCategoryThresholdHistory"
    (
      "d"."SalesCategoryThresholdId","d"."LowerThreshold","d"."UpperThreshold","d"."CategoryDescription","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."SalesCategoryThresholdId" = "d"."SalesCategoryThresholdId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"("i"."SalesCategoryThresholdId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Sales"."SalesCategoryThreshold" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."SalesCategoryThresholdId" = "ut"."SalesCategoryThresholdId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."SalesCategoryThresholdId" = "d"."SalesCategoryThresholdId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesCategoryThreshold" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesCategoryThreshold" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Sales"."SalesCategoryThreshold" AS "d"
   WHERE "d"."SalesCategoryThresholdId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."SalesSalesCategoryThresholdHistory" as "d"
   WHERE "d"."SalesCategoryThresholdId" = @Pky
  );

go





-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Sales"."SalesOrderVehicle" as "d"
    WHERE "d"."SalesOrderVehicleId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go

-- View Name: "Audit"."FindUniqueTablePkySalesSalesOrderVehicle"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesSalesOrderVehicle

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesSalesOrderVehicle" AS

  SELECT "CurrentTable"."SalesOrderVehicleId"
  FROM "Sales"."SalesOrderVehicle" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."SalesOrderVehicleId"
  FROM "Audit"."SalesSalesOrderVehicleHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTd_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Sales"."uTd_SalesOrderVehicle" on "Sales"."SalesOrderVehicle"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."SalesSalesOrderVehicleHistory"
(
  "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTi_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTi_SalesOrderVehicle" on "Sales"."SalesOrderVehicle"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"("i"."SalesOrderVehicleId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Sales"."SalesOrderVehicle" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."SalesOrderVehicleId" = "ut"."SalesOrderVehicleId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTu_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTu_SalesOrderVehicle" on "Sales"."SalesOrderVehicle"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."SalesOrderVehicleId" = "d"."SalesOrderVehicleId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesSalesOrderVehicleHistory"
    (
      "d"."SalesOrderVehicleId","d"."CustomerId","d"."StaffId","d"."InvoiceNumber","d"."TotalSalePrice","d"."SaleDate","d"."SalesCategoryThresholdId","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."SalesOrderVehicleId" = "d"."SalesOrderVehicleId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"("i"."SalesOrderVehicleId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Sales"."SalesOrderVehicle" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."SalesOrderVehicleId" = "ut"."SalesOrderVehicleId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."SalesOrderVehicleId" = "d"."SalesOrderVehicleId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicle" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicle" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Sales"."SalesOrderVehicle" AS "d"
   WHERE "d"."SalesOrderVehicleId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."SalesSalesOrderVehicleHistory" as "d"
   WHERE "d"."SalesOrderVehicleId" = @Pky
  );

go





-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"
-- Description: Create SHA256 Hashkey from JSON Input


CREATE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail" (@Pky int)
RETURNS VARBINARY(32)
AS
BEGIN
  DECLARE @ColumnOutputInJSONIncludingNullValues nvarchar(max) =
  (
    SELECT "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    FROM "Sales"."SalesOrderVehicleDetail" as "d"
    WHERE "d"."SalesOrderVehicleDetailId" = @Pky
    FOR JSON AUTO, INCLUDE_NULL_VALUES
   );

  RETURN HASHBYTES('SHA2_256', @ColumnOutputInJSONIncludingNullValues);
END;
go


-- View Name: "Audit"."FindUniqueTablePkySalesSalesOrderVehicleDetail"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesSalesOrderVehicleDetail

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesSalesOrderVehicleDetail" AS

  SELECT "CurrentTable"."SalesOrderVehicleDetailId"
  FROM "Sales"."SalesOrderVehicleDetail" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."SalesOrderVehicleDetailId"
  FROM "Audit"."SalesSalesOrderVehicleDetailHistory" 
  AS "AuditHistory"
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTd_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER DELETE

-- Description: TSQL-AuditDeleteTrigger Templated Code

CREATE TRIGGER "Sales"."uTd_SalesOrderVehicleDetail" on "Sales"."SalesOrderVehicleDetail"
WITH
  EXECUTE AS CALLER AFTER DELETE

AS

BEGIN

DECLARE
@NowTimestamp datetime = sysdatetime(),
@DBAction char(1) = 'D',
@isDeleted char(1) = 'Y'

-- Trigger Code
--

INSERT into "Audit"."SalesSalesOrderVehicleDetailHistory"
(
  "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
)
SELECT
  "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."ManufacturerVehicleStockId",
  "d"."TransactionNumber",
  'Last Transaction prior to deletion: ' + coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
  "d"."UserAuthorizationId",
  "d"."SysStartTime",
  @NowTimeStamp, -- AS SysEndTime
  "d"."RowLevelHashKey",
  "d"."PriorRowLevelHashKey",
  "d"."FireAuditTrigger",
  @NowTimeStamp,
  @DBAction,
  @isDeleted
FROM deleted as "d"
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTi_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER INSERT

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTi_SalesOrderVehicleDetail" on "Sales"."SalesOrderVehicleDetail"
WITH
  EXECUTE AS CALLER AFTER INSERT
AS
BEGIN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  UPDATE "ut"
  SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"("i"."SalesOrderVehicleDetailId"),
      "ut"."PriorRowLevelHashKey" = null,
      "ut"."Note" = 'Row Inserted',
      "ut"."FireAuditTrigger" = 'N'
  FROM "Sales"."SalesOrderVehicleDetail" as "ut" --updateTable
    INNER JOIN inserted as "i"
    ON "i"."SalesOrderVehicleDetailId" = "ut"."SalesOrderVehicleDetailId"
       AND "i"."TransactionNumber" = 1;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Trigger Name: Sales.uTu_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After WITH EXECUTE AS CALLER AFTER UPDATE

-- Description: TSQL-AuditInsertTrigger Templated Code

CREATE TRIGGER "Sales"."uTu_SalesOrderVehicleDetail" on "Sales"."SalesOrderVehicleDetail"
WITH
  EXECUTE AS CALLER AFTER UPDATE

AS
BEGIN
  DECLARE
  @NowTimeStamp datetime2(7) = sysdatetime(),
  @OpenEndedSysEndTime datetime2(7) = '99991231 23:59:59.9999999',
  @FireAuditTrigger char(1) = 'N',
  @DBAction char(1) = 'U',
  @isDeleted char(1) = 'N',
  @UpdatedNote varchar(100) = 'Row Updated';

  SELECT @FireAuditTrigger = "i"."FireAuditTrigger"
  FROM deleted as "d"
    INNER JOIN inserted as "i"
      ON "i"."SalesOrderVehicleDetailId" = "d"."SalesOrderVehicleDetailId"
    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if @FireAuditTrigger = 'Y'
  IF (@FireAuditTrigger = 'Y')
  BEGIN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesSalesOrderVehicleDetailHistory"
    (
      "d"."SalesOrderVehicleDetailId","d"."SalesOrderVehicleId","d"."LineItemNumber","d"."ManufacturerVehicleStockId","d"."SalePrice","d"."LineItemDiscount","d"."DerivedDiscountedSalePrice","d"."TransactionNumber","d"."Note","d"."UserAuthorizationId","d"."SysStartTime","d"."SysEndTime","d"."RowLevelHashKey","d"."PriorRowLevelHashKey","d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
       "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."ManufacturerVehicleStockId",
       "d"."TransactionNumber",
       coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
       "d"."UserAuthorizationId",
       "d"."SysStartTime",
       @NowTimeStamp,
       "d"."RowLevelHashKey",
       "d"."PriorRowLevelHashKey",
       "d"."FireAuditTrigger",
       @NowTimeStamp,
       @DBAction,
       @isDeleted
     FROM deleted AS "d"
     INNER JOIN inserted AS "i"
     ON "i"."SalesOrderVehicleDetailId" = "d"."SalesOrderVehicleDetailId"
        AND "i"."TransactionNumber" = "d"."TransactionNumber";

     UPDATE "ut"
     SET "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"("i"."SalesOrderVehicleDetailId"),
         "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
         "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
         "ut"."SysStartTime" = @NowTimeStamp,
         "ut"."SysEndTime" = @OpenEndedSysEndTime,
         "ut"."Note" = @UpdatedNote,
         "ut"."FireAuditTrigger" = 'N'
     FROM "Sales"."SalesOrderVehicleDetail" as "ut"
       INNER JOIN inserted as "i"
         ON "i"."SalesOrderVehicleDetailId" = "ut"."SalesOrderVehicleDetailId"
           AND "i"."TransactionNumber" = "ut"."TransactionNumber"
           AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey"
       INNER JOIN deleted as "d"
         ON "i"."SalesOrderVehicleDetailId" = "d"."SalesOrderVehicleDetailId"
           AND "i"."TransactionNumber" = "d"."TransactionNumber"
          AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"; 
  END;
END;
GO

-- Author: Ralph Granata
-- Creation Date: 11/30/2023
-- Modification Date: 11/30/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicleDetail" ()
-- Description: A view to find all transactions by Primary Key

CREATE FUNCTION "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicleDetail" (@Pky int)
RETURNS TABLE
AS
  RETURN 
  (
   SELECT 'Current' as TransactionType, NULL AS "AuditDateTimeStamp", NULL AS "DBAction",
     "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Sales"."SalesOrderVehicleDetail" AS "d"
   WHERE "d"."SalesOrderVehicleDetailId" = @Pky
   UNION
   SELECT 'History' as TransactionType, "d"."AuditDateTimeStamp", "d"."DBAction",
     "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
   FROM "Audit"."SalesSalesOrderVehicleDetailHistory" as "d"
   WHERE "d"."SalesOrderVehicleDetailId" = @Pky
  );

go
