
-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Locale"."Country" as "d"
    WHERE "d"."CountryId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfLocaleCountry" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfLocaleCountry" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Locale"."Country" AS "d"
        WHERE "d"."CountryId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."LocaleCountryHistory" as "d"
        WHERE "d"."CountryId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkyLocaleCountry"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus LocaleCountry

CREATE VIEW "Audit"."vwFindUniqueTablePkyLocaleCountry" AS
  SELECT "CurrentTable"."CountryId"
  FROM "Locale"."Country" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."CountryId"
  FROM "Audit"."LocaleCountryHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Locale_uTd_Country on Locale.Country
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_LocaleCountry()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."LocaleCountryHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Locale_uTd_Country"
AFTER DELETE
ON "Locale"."Country"
FOR EACH ROW
EXECUTE FUNCTION delete_LocaleCountry();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Locale_uTi_Country on Locale.Country
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_LocaleCountry()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."CountryId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Locale_uTi_Country"
AFTER INSERT
ON "Locale"."Country"
FOR EACH ROW
EXECUTE FUNCTION insert_LocaleCountry();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Locale_uTu_Country on Locale.Country
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_LocaleCountry()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."CountryId" = "d"."CountryId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."LocaleCountryHistory"
    (
      "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."CountryId" = "d"."CountryId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Locale"."Country" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"("i"."CountryId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."CountryId" = "d"."CountryId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."CountryId" = "ut"."CountryId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Locale_uTu_Country"
AFTER UPDATE
ON "Locale"."Country"
FOR EACH ROW
EXECUTE FUNCTION update_LocaleCountry();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."Customer" as "d"
    WHERE "d"."CustomerId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesCustomer" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfSalesCustomer" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."Customer" AS "d"
        WHERE "d"."CustomerId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesCustomerHistory" as "d"
        WHERE "d"."CustomerId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkySalesCustomer"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesCustomer

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesCustomer" AS
  SELECT "CurrentTable"."CustomerId"
  FROM "Sales"."Customer" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."CustomerId"
  FROM "Audit"."SalesCustomerHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTd_Customer on Sales.Customer
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_SalesCustomer()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."SalesCustomerHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Sales_uTd_Customer"
AFTER DELETE
ON "Sales"."Customer"
FOR EACH ROW
EXECUTE FUNCTION delete_SalesCustomer();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_Customer on Sales.Customer
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_SalesCustomer()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"(NEW."CustomerId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTi_Customer"
AFTER INSERT
ON "Sales"."Customer"
FOR EACH ROW
EXECUTE FUNCTION insert_SalesCustomer();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_Customer on Sales.Customer
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_SalesCustomer()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."CustomerId" = "d"."CustomerId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesCustomerHistory"
    (
      "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."CustomerId" = "d"."CustomerId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Sales"."Customer" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"("i"."CustomerId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."CustomerId" = "d"."CustomerId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."CustomerId" = "ut"."CustomerId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTu_Customer"
AFTER UPDATE
ON "Sales"."Customer"
FOR EACH ROW
EXECUTE FUNCTION update_SalesCustomer();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Production"."ManufacturerModel" as "d"
    WHERE "d"."ManufacturerModelId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerModel" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfProductionManufacturerModel" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Production"."ManufacturerModel" AS "d"
        WHERE "d"."ManufacturerModelId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."ProductionManufacturerModelHistory" as "d"
        WHERE "d"."ManufacturerModelId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkyProductionManufacturerModel"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus ProductionManufacturerModel

CREATE VIEW "Audit"."vwFindUniqueTablePkyProductionManufacturerModel" AS
  SELECT "CurrentTable"."ManufacturerModelId"
  FROM "Production"."ManufacturerModel" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."ManufacturerModelId"
  FROM "Audit"."ProductionManufacturerModelHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTd_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_ProductionManufacturerModel()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."ProductionManufacturerModelHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Production_uTd_ManufacturerModel"
AFTER DELETE
ON "Production"."ManufacturerModel"
FOR EACH ROW
EXECUTE FUNCTION delete_ProductionManufacturerModel();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTi_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_ProductionManufacturerModel()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"(NEW."ManufacturerModelId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Production_uTi_ManufacturerModel"
AFTER INSERT
ON "Production"."ManufacturerModel"
FOR EACH ROW
EXECUTE FUNCTION insert_ProductionManufacturerModel();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Production_uTu_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_ProductionManufacturerModel()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."ManufacturerModelId" = "d"."ManufacturerModelId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."ProductionManufacturerModelHistory"
    (
      "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."ManufacturerModelId" = "d"."ManufacturerModelId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Production"."ManufacturerModel" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"("i"."ManufacturerModelId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."ManufacturerModelId" = "d"."ManufacturerModelId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."ManufacturerModelId" = "ut"."ManufacturerModelId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Production_uTu_ManufacturerModel"
AFTER UPDATE
ON "Production"."ManufacturerModel"
FOR EACH ROW
EXECUTE FUNCTION update_ProductionManufacturerModel();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Production"."ManufacturerVehicleMake" as "d"
    WHERE "d"."ManufacturerVehicleMakeId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleMake" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleMake" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Production"."ManufacturerVehicleMake" AS "d"
        WHERE "d"."ManufacturerVehicleMakeId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."ProductionManufacturerVehicleMakeHistory" as "d"
        WHERE "d"."ManufacturerVehicleMakeId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkyProductionManufacturerVehicleMake"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus ProductionManufacturerVehicleMake

CREATE VIEW "Audit"."vwFindUniqueTablePkyProductionManufacturerVehicleMake" AS
  SELECT "CurrentTable"."ManufacturerVehicleMakeId"
  FROM "Production"."ManufacturerVehicleMake" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."ManufacturerVehicleMakeId"
  FROM "Audit"."ProductionManufacturerVehicleMakeHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTd_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_ProductionManufacturerVehicleMake()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."ProductionManufacturerVehicleMakeHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Production_uTd_ManufacturerVehicleMake"
AFTER DELETE
ON "Production"."ManufacturerVehicleMake"
FOR EACH ROW
EXECUTE FUNCTION delete_ProductionManufacturerVehicleMake();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTi_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_ProductionManufacturerVehicleMake()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"(NEW."ManufacturerVehicleMakeId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Production_uTi_ManufacturerVehicleMake"
AFTER INSERT
ON "Production"."ManufacturerVehicleMake"
FOR EACH ROW
EXECUTE FUNCTION insert_ProductionManufacturerVehicleMake();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Production_uTu_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_ProductionManufacturerVehicleMake()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."ManufacturerVehicleMakeId" = "d"."ManufacturerVehicleMakeId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."ProductionManufacturerVehicleMakeHistory"
    (
      "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."ManufacturerVehicleMakeId" = "d"."ManufacturerVehicleMakeId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Production"."ManufacturerVehicleMake" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"("i"."ManufacturerVehicleMakeId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."ManufacturerVehicleMakeId" = "d"."ManufacturerVehicleMakeId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."ManufacturerVehicleMakeId" = "ut"."ManufacturerVehicleMakeId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Production_uTu_ManufacturerVehicleMake"
AFTER UPDATE
ON "Production"."ManufacturerVehicleMake"
FOR EACH ROW
EXECUTE FUNCTION update_ProductionManufacturerVehicleMake();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Production"."ManufacturerVehicleStock" as "d"
    WHERE "d"."ManufacturerVehicleStockId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleStock" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfProductionManufacturerVehicleStock" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Production"."ManufacturerVehicleStock" AS "d"
        WHERE "d"."ManufacturerVehicleStockId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."ProductionManufacturerVehicleStockHistory" as "d"
        WHERE "d"."ManufacturerVehicleStockId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkyProductionManufacturerVehicleStock"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus ProductionManufacturerVehicleStock

CREATE VIEW "Audit"."vwFindUniqueTablePkyProductionManufacturerVehicleStock" AS
  SELECT "CurrentTable"."ManufacturerVehicleStockId"
  FROM "Production"."ManufacturerVehicleStock" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."ManufacturerVehicleStockId"
  FROM "Audit"."ProductionManufacturerVehicleStockHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTd_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_ProductionManufacturerVehicleStock()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."ProductionManufacturerVehicleStockHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Production_uTd_ManufacturerVehicleStock"
AFTER DELETE
ON "Production"."ManufacturerVehicleStock"
FOR EACH ROW
EXECUTE FUNCTION delete_ProductionManufacturerVehicleStock();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTi_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_ProductionManufacturerVehicleStock()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"(NEW."ManufacturerVehicleStockId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Production_uTi_ManufacturerVehicleStock"
AFTER INSERT
ON "Production"."ManufacturerVehicleStock"
FOR EACH ROW
EXECUTE FUNCTION insert_ProductionManufacturerVehicleStock();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Production_uTu_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_ProductionManufacturerVehicleStock()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."ManufacturerVehicleStockId" = "d"."ManufacturerVehicleStockId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."ProductionManufacturerVehicleStockHistory"
    (
      "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."ManufacturerVehicleStockId" = "d"."ManufacturerVehicleStockId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Production"."ManufacturerVehicleStock" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"("i"."ManufacturerVehicleStockId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."ManufacturerVehicleStockId" = "d"."ManufacturerVehicleStockId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."ManufacturerVehicleStockId" = "ut"."ManufacturerVehicleStockId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Production_uTu_ManufacturerVehicleStock"
AFTER UPDATE
ON "Production"."ManufacturerVehicleStock"
FOR EACH ROW
EXECUTE FUNCTION update_ProductionManufacturerVehicleStock();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."SalesCategoryThreshold" as "d"
    WHERE "d"."SalesCategoryThresholdId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesCategoryThreshold" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfSalesSalesCategoryThreshold" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."SalesCategoryThreshold" AS "d"
        WHERE "d"."SalesCategoryThresholdId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesSalesCategoryThresholdHistory" as "d"
        WHERE "d"."SalesCategoryThresholdId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkySalesSalesCategoryThreshold"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesSalesCategoryThreshold

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesSalesCategoryThreshold" AS
  SELECT "CurrentTable"."SalesCategoryThresholdId"
  FROM "Sales"."SalesCategoryThreshold" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."SalesCategoryThresholdId"
  FROM "Audit"."SalesSalesCategoryThresholdHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTd_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_SalesSalesCategoryThreshold()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."SalesSalesCategoryThresholdHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Sales_uTd_SalesCategoryThreshold"
AFTER DELETE
ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW
EXECUTE FUNCTION delete_SalesSalesCategoryThreshold();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_SalesSalesCategoryThreshold()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"(NEW."SalesCategoryThresholdId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTi_SalesCategoryThreshold"
AFTER INSERT
ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW
EXECUTE FUNCTION insert_SalesSalesCategoryThreshold();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_SalesSalesCategoryThreshold()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."SalesCategoryThresholdId" = "d"."SalesCategoryThresholdId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesSalesCategoryThresholdHistory"
    (
      "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."SalesCategoryThresholdId" = "d"."SalesCategoryThresholdId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Sales"."SalesCategoryThreshold" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"("i"."SalesCategoryThresholdId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."SalesCategoryThresholdId" = "d"."SalesCategoryThresholdId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."SalesCategoryThresholdId" = "ut"."SalesCategoryThresholdId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTu_SalesCategoryThreshold"
AFTER UPDATE
ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW
EXECUTE FUNCTION update_SalesSalesCategoryThreshold();



CREATE OR REPLACE FUNCTION update_category_description()
RETURNS TRIGGER AS $$
BEGIN
  NEW."CategoryDescription" = (CASE
            WHEN new."LowerThreshold" >= 100001.00 THEN 'Very High'
            WHEN new."LowerThreshold" BETWEEN 75001.00 AND 100000.00 THEN 'High'
            WHEN new."LowerThreshold" BETWEEN 50001.00 AND 75000.00 THEN 'Medium'
            WHEN new."LowerThreshold" BETWEEN 25001.00 AND 50000.00 THEN 'Low'
            WHEN new."LowerThreshold" BETWEEN 150001.00 AND 250000.00 THEN 'Exceptional'
            WHEN new."LowerThreshold" BETWEEN 100001.00 AND 150000.00 THEN 'Very High'
            WHEN new."LowerThreshold" BETWEEN 100.00 AND 25000.00 THEN 'Very Low'
            ELSE 'Unknown'
        end);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to call the function before each INSERT or UPDATE
CREATE TRIGGER update_category_description
BEFORE INSERT OR UPDATE ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW EXECUTE FUNCTION update_category_description();

-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."SalesOrderVehicle" as "d"
    WHERE "d"."SalesOrderVehicleId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicle" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicle" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."SalesOrderVehicle" AS "d"
        WHERE "d"."SalesOrderVehicleId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesSalesOrderVehicleHistory" as "d"
        WHERE "d"."SalesOrderVehicleId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkySalesSalesOrderVehicle"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesSalesOrderVehicle

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesSalesOrderVehicle" AS
  SELECT "CurrentTable"."SalesOrderVehicleId"
  FROM "Sales"."SalesOrderVehicle" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."SalesOrderVehicleId"
  FROM "Audit"."SalesSalesOrderVehicleHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTd_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_SalesSalesOrderVehicle()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."SalesSalesOrderVehicleHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Sales_uTd_SalesOrderVehicle"
AFTER DELETE
ON "Sales"."SalesOrderVehicle"
FOR EACH ROW
EXECUTE FUNCTION delete_SalesSalesOrderVehicle();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_SalesSalesOrderVehicle()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"(NEW."SalesOrderVehicleId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTi_SalesOrderVehicle"
AFTER INSERT
ON "Sales"."SalesOrderVehicle"
FOR EACH ROW
EXECUTE FUNCTION insert_SalesSalesOrderVehicle();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_SalesSalesOrderVehicle()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."SalesOrderVehicleId" = "d"."SalesOrderVehicleId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesSalesOrderVehicleHistory"
    (
      "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."SalesOrderVehicleId" = "d"."SalesOrderVehicleId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Sales"."SalesOrderVehicle" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"("i"."SalesOrderVehicleId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."SalesOrderVehicleId" = "d"."SalesOrderVehicleId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."SalesOrderVehicleId" = "ut"."SalesOrderVehicleId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTu_SalesOrderVehicle"
AFTER UPDATE
ON "Sales"."SalesOrderVehicle"
FOR EACH ROW
EXECUTE FUNCTION update_SalesSalesOrderVehicle();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."SalesOrderVehicleDetail" as "d"
    WHERE "d"."SalesOrderVehicleDetailId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicleDetail" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfSalesSalesOrderVehicleDetail" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."SalesOrderVehicleDetail" AS "d"
        WHERE "d"."SalesOrderVehicleDetailId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesSalesOrderVehicleDetailHistory" as "d"
        WHERE "d"."SalesOrderVehicleDetailId" = pky
    );
end;
$$LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION update_derived_discount()
RETURNS TRIGGER AS $$
BEGIN
  NEW."DerivedDiscountedSalePrice" = NEW."SalePrice" - NEW."LineItemDiscount";
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to call the function before each INSERT or UPDATE
CREATE TRIGGER update_derived_column_trigger
BEFORE INSERT OR UPDATE ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW EXECUTE FUNCTION update_derived_discount();


-- View Name: "Audit"."FindUniqueTablePkySalesSalesOrderVehicleDetail"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus SalesSalesOrderVehicleDetail

CREATE VIEW "Audit"."vwFindUniqueTablePkySalesSalesOrderVehicleDetail" AS
  SELECT "CurrentTable"."SalesOrderVehicleDetailId"
  FROM "Sales"."SalesOrderVehicleDetail" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."SalesOrderVehicleDetailId"
  FROM "Audit"."SalesSalesOrderVehicleDetailHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTd_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_SalesSalesOrderVehicleDetail()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."SalesSalesOrderVehicleDetailHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "Sales_uTd_SalesOrderVehicleDetail"
AFTER DELETE
ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW
EXECUTE FUNCTION delete_SalesSalesOrderVehicleDetail();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_SalesSalesOrderVehicleDetail()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"(NEW."SalesOrderVehicleDetailId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTi_SalesOrderVehicleDetail"
AFTER INSERT
ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW
EXECUTE FUNCTION insert_SalesSalesOrderVehicleDetail();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_SalesSalesOrderVehicleDetail()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."SalesOrderVehicleDetailId" = "d"."SalesOrderVehicleDetailId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."SalesSalesOrderVehicleDetailHistory"
    (
      "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."ManufacturerVehicleStockId",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."SalesOrderVehicleDetailId" = "d"."SalesOrderVehicleDetailId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "Sales"."SalesOrderVehicleDetail" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"("i"."SalesOrderVehicleDetailId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."SalesOrderVehicleDetailId" = "d"."SalesOrderVehicleDetailId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."SalesOrderVehicleDetailId" = "ut"."SalesOrderVehicleDetailId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "Sales_uTu_SalesOrderVehicleDetail"
AFTER UPDATE
ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW
EXECUTE FUNCTION update_SalesSalesOrderVehicleDetail();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "HumanResources"."Staff" as "d"
    WHERE "d"."StaffId" = pky;

    RETURN digest(column_output_in_json_including_null_values, 'sha256');
END;
$$ LANGUAGE plpgsql;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "Audit"."itvfnFindAllTransactionsByTablePkyOfHumanResourcesStaff" 
-- Description: A view to find all transactions by Primary Key

CREATE OR REPLACE FUNCTION "itvfnFindAllTransactionsByTablePkyOfHumanResourcesStaff" (pky INT)
returns setof RECORD 
as $$
BEGIN
	return QUERY(
		SELECT 'Current' AS TransactionType,
               NULL AS AuditDateTimeStamp,
               NULL AS DBAction,
               "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "HumanResources"."Staff" AS "d"
        WHERE "d"."StaffId" = pky
        UNION ALL
        SELECT 'History' AS TransactionType,
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."HumanResourcesStaffHistory" as "d"
        WHERE "d"."StaffId" = pky
    );
end;
$$LANGUAGE plpgsql;


-- View Name: "Audit"."FindUniqueTablePkyHumanResourcesStaff"
-- Description: TSQL-vwFindUniqueTablePkyView Templated Code plus HumanResourcesStaff

CREATE VIEW "Audit"."vwFindUniqueTablePkyHumanResourcesStaff" AS
  SELECT "CurrentTable"."StaffId"
  FROM "HumanResources"."Staff" AS "CurrentTable"
  UNION
  SELECT "AuditHistory"."StaffId"
  FROM "Audit"."HumanResourcesStaffHistory" 
  AS "AuditHistory";


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: HumanResources_uTd_Staff on HumanResources.Staff
-- Trigger Type: After

-- Description: PG-AuditDeleteTrigger Templated Code

CREATE OR REPLACE FUNCTION delete_HumanResourcesStaff()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMPTZ := current_timestamp;
  db_action CHAR(1) := 'D';
  is_deleted CHAR(1) := 'Y';
BEGIN
  -- Trigger Code
  INSERT INTO "Audit"."HumanResourcesStaffHistory"
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
  FROM old AS "d";

  RETURN OLD;
END;
$$;

CREATE TRIGGER "HumanResources_uTd_Staff"
AFTER DELETE
ON "HumanResources"."Staff"
FOR EACH ROW
EXECUTE FUNCTION delete_HumanResourcesStaff();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: HumanResources_uTi_Staff on HumanResources.Staff
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION insert_HumanResourcesStaff()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  -- Update the current record hash keys and the temporal range of the transaction of factually being true
  NEW."RowLevelHashKey" := "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"(NEW."StaffId");
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "HumanResources_uTi_Staff"
AFTER INSERT
ON "HumanResources"."Staff"
FOR EACH ROW
EXECUTE FUNCTION insert_HumanResourcesStaff();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: HumanResources_uTu_Staff on HumanResources.Staff
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code

CREATE OR REPLACE FUNCTION update_HumanResourcesStaff()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
  now_timestamp TIMESTAMP := current_timestamp;
  open_ended_sys_end_time TIMESTAMP := '9999-12-31 23:59:59.9999999';
  fire_audit_trigger CHAR(1) := 'N';
  db_action CHAR(1) := 'U';
  is_deleted CHAR(1) := 'N';
BEGIN
  -- Retrieve the value of FireAuditTrigger from the inserted record
  SELECT "i"."FireAuditTrigger"
  INTO fire_audit_trigger
  FROM deleted "d"
  INNER JOIN new "i" ON "i"."StaffId" = "d"."StaffId"
                    AND "i"."TransactionNumber" = "d"."TransactionNumber";

  -- Audit only if FireAuditTrigger = 'Y'
  IF (fire_audit_trigger = 'Y') THEN
    -- Insert record into audit table
    INSERT INTO "Audit"."HumanResourcesStaffHistory"
    (
      "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger", "d"."AuditDateTimeStamp", "d"."DBAction", "d"."isDeleted"
    )
    SELECT
      "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department",
      "d"."TransactionNumber",
      coalesce("d"."Note", concat('No Message Transaction Number: ', "d"."TransactionNumber")),
      "d"."UserAuthorizationId",
      "d"."SysStartTime",
      now_timestamp,
      "d"."RowLevelHashKey",
      "d"."PriorRowLevelHashKey",
      "d"."FireAuditTrigger"
    FROM old "d"
    INNER JOIN new "i" ON "i"."StaffId" = "d"."StaffId"
                      AND "i"."TransactionNumber" = "d"."TransactionNumber";

    -- Update the target table
    UPDATE "HumanResources"."Staff" AS "ut"
    SET
      "ut"."RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"("i"."StaffId"),
      "ut"."PriorRowLevelHashKey" = "d"."RowLevelHashKey",
      "ut"."TransactionNumber" = "d"."TransactionNumber" + 1,
      "ut"."SysStartTime" = now_timestamp,
      "ut"."SysEndTime" = open_ended_sys_end_time,
      "ut"."Note" = "i"."Note",
      "ut"."FireAuditTrigger" = 'N'
    FROM new "i"
    INNER JOIN old "d" ON "i"."StaffId" = "d"."StaffId"
                        AND "i"."TransactionNumber" = "d"."TransactionNumber"
                        AND "i"."RowLevelHashKey" = "d"."RowLevelHashKey"
    WHERE "i"."StaffId" = "ut"."StaffId"
      AND "i"."TransactionNumber" = "ut"."TransactionNumber"
      AND "i"."RowLevelHashKey" = "ut"."RowLevelHashKey";

  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER "HumanResources_uTu_Staff"
AFTER UPDATE
ON "HumanResources"."Staff"
FOR EACH ROW
EXECUTE FUNCTION update_HumanResourcesStaff();


