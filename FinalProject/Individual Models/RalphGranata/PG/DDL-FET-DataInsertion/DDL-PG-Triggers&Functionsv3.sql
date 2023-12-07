
-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "CountryId", "d"."CountryId", "CountryISO3", "d"."CountryISO3", "CountryName", "d"."CountryName", "CountryISO2", "d"."CountryISO2", "SalesRegion", "d"."SalesRegion", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Locale"."Country" as "d"
    WHERE "d"."CountryId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfLocaleCountry" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfLocaleCountry"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOLocaleCountry" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Locale"."Country" AS "d"
        WHERE "d"."CountryId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."CountryId", "d"."CountryISO3", "d"."CountryName", "d"."CountryISO2", "d"."SalesRegion", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."LocaleCountryHistory" as "d"
        WHERE "d"."CountryId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Locale"."funcDeleteCountryHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."LocaleCountryHistory"
    (
      "CountryId", "CountryISO3", "CountryName", "CountryISO2", "SalesRegion", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."CountryId", old."CountryISO3", old."CountryName", old."CountryISO2", old."SalesRegion",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_LocaleCountry"
AFTER DELETE
ON "Locale"."Country"
FOR EACH ROW
EXECUTE FUNCTION "Locale"."funcDeleteCountryHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Locale_uTi_Country on Locale.Country
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Locale"."funcInsertCountryHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Locale"."Country"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."CountryId")
  where "CountryId" = new."CountryId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_LocaleCountry"
AFTER INSERT
ON "Locale"."Country"
FOR EACH ROW
EXECUTE FUNCTION "Locale"."funcInsertCountryHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Locale_uTu_Country on Locale.Country
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Locale"."funcUpdateCountryHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."LocaleCountryHistory"
    (
      "CountryId", "CountryISO3", "CountryName", "CountryISO2", "SalesRegion", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."CountryId", old."CountryISO3", old."CountryName", old."CountryISO2", old."SalesRegion",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Locale"."Country"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."CountryId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "CountryId" = new."CountryId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_LocaleCountry"
AFTER UPDATE
ON "Locale"."Country"
FOR EACH ROW
EXECUTE FUNCTION "Locale"."funcUpdateCountryHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "CustomerId", "d"."CustomerId", "CustomerName", "d"."CustomerName", "CustomerAddress1", "d"."CustomerAddress1", "CustomerTown", "d"."CustomerTown", "CountryId", "d"."CountryId", "IsCustomerReseller", "d"."IsCustomerReseller", "IsCustomerCreditRisk", "d"."IsCustomerCreditRisk", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."Customer" as "d"
    WHERE "d"."CustomerId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfSalesCustomer" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfSalesCustomer"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOSalesCustomer" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."Customer" AS "d"
        WHERE "d"."CustomerId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."CustomerId", "d"."CustomerName", "d"."CustomerAddress1", "d"."CustomerAddress2", "d"."CustomerTown", "d"."CustomerPostalCode", "d"."CountryId", "d"."IsCustomerReseller", "d"."IsCustomerCreditRisk", "d"."SpendCapacity", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesCustomerHistory" as "d"
        WHERE "d"."CustomerId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Sales"."funcDeleteCustomerHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."SalesCustomerHistory"
    (
      "CustomerId", "CustomerName", "CustomerAddress1", "CustomerAddress2", "CustomerTown", "CustomerPostalCode", "CountryId", "IsCustomerReseller", "IsCustomerCreditRisk", "SpendCapacity", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."CustomerId", old."CustomerName", old."CustomerAddress1", old."CustomerAddress2", old."CustomerTown", old."CustomerPostalCode", old."CountryId", old."IsCustomerReseller", old."IsCustomerCreditRisk", old."SpendCapacity",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_SalesCustomer"
AFTER DELETE
ON "Sales"."Customer"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcDeleteCustomerHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_Customer on Sales.Customer
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcInsertCustomerHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Sales"."Customer"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesCustomer"(NEW."CustomerId")
  where "CustomerId" = new."CustomerId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_SalesCustomer"
AFTER INSERT
ON "Sales"."Customer"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcInsertCustomerHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_Customer on Sales.Customer
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcUpdateCustomerHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."SalesCustomerHistory"
    (
      "CustomerId", "CustomerName", "CustomerAddress1", "CustomerAddress2", "CustomerTown", "CustomerPostalCode", "CountryId", "IsCustomerReseller", "IsCustomerCreditRisk", "SpendCapacity", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."CustomerId", old."CustomerName", old."CustomerAddress1", old."CustomerAddress2", old."CustomerTown", old."CustomerPostalCode", old."CountryId", old."IsCustomerReseller", old."IsCustomerCreditRisk", old."SpendCapacity",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Sales"."Customer"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."CustomerId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "CustomerId" = new."CustomerId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_SalesCustomer"
AFTER UPDATE
ON "Sales"."Customer"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcUpdateCustomerHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "ManufacturerModelId", "d"."ManufacturerModelId", "ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeId", "ManufacturerModelName", "d"."ManufacturerModelName", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Production"."ManufacturerModel" as "d"
    WHERE "d"."ManufacturerModelId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfProductionManufacturerModel" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfProductionManufacturerModel"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOProductionManufacturerModel" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Production"."ManufacturerModel" AS "d"
        WHERE "d"."ManufacturerModelId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."ManufacturerModelId", "d"."ManufacturerVehicleMakeId", "d"."ManufacturerModelName", "d"."ManufacturerModelVariant", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."ProductionManufacturerModelHistory" as "d"
        WHERE "d"."ManufacturerModelId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Production"."funcDeleteManufacturerModelHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."ProductionManufacturerModelHistory"
    (
      "ManufacturerModelId", "ManufacturerVehicleMakeId", "ManufacturerModelName", "ManufacturerModelVariant", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."ManufacturerModelId", old."ManufacturerVehicleMakeId", old."ManufacturerModelName", old."ManufacturerModelVariant",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_ProductionManufacturerModel"
AFTER DELETE
ON "Production"."ManufacturerModel"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcDeleteManufacturerModelHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTi_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Production"."funcInsertManufacturerModelHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Production"."ManufacturerModel"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerModel"(NEW."ManufacturerModelId")
  where "ManufacturerModelId" = new."ManufacturerModelId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_ProductionManufacturerModel"
AFTER INSERT
ON "Production"."ManufacturerModel"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcInsertManufacturerModelHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Production_uTu_ManufacturerModel on Production.ManufacturerModel
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Production"."funcUpdateManufacturerModelHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."ProductionManufacturerModelHistory"
    (
      "ManufacturerModelId", "ManufacturerVehicleMakeId", "ManufacturerModelName", "ManufacturerModelVariant", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."ManufacturerModelId", old."ManufacturerVehicleMakeId", old."ManufacturerModelName", old."ManufacturerModelVariant",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Production"."ManufacturerModel"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."ManufacturerModelId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "ManufacturerModelId" = new."ManufacturerModelId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_ProductionManufacturerModel"
AFTER UPDATE
ON "Production"."ManufacturerModel"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcUpdateManufacturerModelHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeId", "ManufacturerVehicleMakeName", "d"."ManufacturerVehicleMakeName", "CountryId", "d"."CountryId", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Production"."ManufacturerVehicleMake" as "d"
    WHERE "d"."ManufacturerVehicleMakeId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfProductionManufacturerVehicleMake" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfProductionManufacturerVehicleMake"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOProductionManufacturerVehicleMake" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Production"."ManufacturerVehicleMake" AS "d"
        WHERE "d"."ManufacturerVehicleMakeId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."ManufacturerVehicleMakeId", "d"."ManufacturerVehicleMakeName", "d"."CountryId", "d"."MarketingType", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."ProductionManufacturerVehicleMakeHistory" as "d"
        WHERE "d"."ManufacturerVehicleMakeId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Production"."funcDeleteManufacturerVehicleMakeHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."ProductionManufacturerVehicleMakeHistory"
    (
      "ManufacturerVehicleMakeId", "ManufacturerVehicleMakeName", "CountryId", "MarketingType", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."ManufacturerVehicleMakeId", old."ManufacturerVehicleMakeName", old."CountryId", old."MarketingType",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_ProductionManufacturerVehicleMake"
AFTER DELETE
ON "Production"."ManufacturerVehicleMake"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcDeleteManufacturerVehicleMakeHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTi_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Production"."funcInsertManufacturerVehicleMakeHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Production"."ManufacturerVehicleMake"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleMake"(NEW."ManufacturerVehicleMakeId")
  where "ManufacturerVehicleMakeId" = new."ManufacturerVehicleMakeId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_ProductionManufacturerVehicleMake"
AFTER INSERT
ON "Production"."ManufacturerVehicleMake"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcInsertManufacturerVehicleMakeHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Production_uTu_ManufacturerVehicleMake on Production.ManufacturerVehicleMake
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Production"."funcUpdateManufacturerVehicleMakeHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."ProductionManufacturerVehicleMakeHistory"
    (
      "ManufacturerVehicleMakeId", "ManufacturerVehicleMakeName", "CountryId", "MarketingType", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."ManufacturerVehicleMakeId", old."ManufacturerVehicleMakeName", old."CountryId", old."MarketingType",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Production"."ManufacturerVehicleMake"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."ManufacturerVehicleMakeId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "ManufacturerVehicleMakeId" = new."ManufacturerVehicleMakeId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_ProductionManufacturerVehicleMake"
AFTER UPDATE
ON "Production"."ManufacturerVehicleMake"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcUpdateManufacturerVehicleMakeHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "ManufacturerVehicleStockId", "d"."ManufacturerVehicleStockId", "StockCode", "d"."StockCode", "ModelId", "d"."ModelId", "Cost", "d"."Cost", "RepairsCharge", "d"."RepairsCharge", "PartsCharge", "d"."PartsCharge", "DeliveryCharge", "d"."DeliveryCharge", "IsPremiumRoadHandlingPackage", "d"."IsPremiumRoadHandlingPackage", "VehicleColor", "d"."VehicleColor", "PurchaseDate", "d"."PurchaseDate", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Production"."ManufacturerVehicleStock" as "d"
    WHERE "d"."ManufacturerVehicleStockId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfProductionManufacturerVehicleStock" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfProductionManufacturerVehicleStock"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOProductionManufacturerVehicleStock" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Production"."ManufacturerVehicleStock" AS "d"
        WHERE "d"."ManufacturerVehicleStockId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."ManufacturerVehicleStockId", "d"."StockCode", "d"."ModelId", "d"."Cost", "d"."RepairsCharge", "d"."PartsCharge", "d"."DeliveryCharge", "d"."IsPremiumRoadHandlingPackage", "d"."VehicleColor", "d"."CustomerComment", "d"."PurchaseDate", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."ProductionManufacturerVehicleStockHistory" as "d"
        WHERE "d"."ManufacturerVehicleStockId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Production"."funcDeleteManufacturerVehicleStockHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."ProductionManufacturerVehicleStockHistory"
    (
      "ManufacturerVehicleStockId", "StockCode", "ModelId", "Cost", "RepairsCharge", "PartsCharge", "DeliveryCharge", "IsPremiumRoadHandlingPackage", "VehicleColor", "CustomerComment", "PurchaseDate", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."ManufacturerVehicleStockId", old."StockCode", old."ModelId", old."Cost", old."RepairsCharge", old."PartsCharge", old."DeliveryCharge", old."IsPremiumRoadHandlingPackage", old."VehicleColor", old."CustomerComment", old."PurchaseDate",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_ProductionManufacturerVehicleStock"
AFTER DELETE
ON "Production"."ManufacturerVehicleStock"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcDeleteManufacturerVehicleStockHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Production_uTi_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Production"."funcInsertManufacturerVehicleStockHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Production"."ManufacturerVehicleStock"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputProductionManufacturerVehicleStock"(NEW."ManufacturerVehicleStockId")
  where "ManufacturerVehicleStockId" = new."ManufacturerVehicleStockId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_ProductionManufacturerVehicleStock"
AFTER INSERT
ON "Production"."ManufacturerVehicleStock"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcInsertManufacturerVehicleStockHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Production_uTu_ManufacturerVehicleStock on Production.ManufacturerVehicleStock
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Production"."funcUpdateManufacturerVehicleStockHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."ProductionManufacturerVehicleStockHistory"
    (
      "ManufacturerVehicleStockId", "StockCode", "ModelId", "Cost", "RepairsCharge", "PartsCharge", "DeliveryCharge", "IsPremiumRoadHandlingPackage", "VehicleColor", "CustomerComment", "PurchaseDate", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."ManufacturerVehicleStockId", old."StockCode", old."ModelId", old."Cost", old."RepairsCharge", old."PartsCharge", old."DeliveryCharge", old."IsPremiumRoadHandlingPackage", old."VehicleColor", old."CustomerComment", old."PurchaseDate",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Production"."ManufacturerVehicleStock"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."ManufacturerVehicleStockId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "ManufacturerVehicleStockId" = new."ManufacturerVehicleStockId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_ProductionManufacturerVehicleStock"
AFTER UPDATE
ON "Production"."ManufacturerVehicleStock"
FOR EACH ROW
EXECUTE FUNCTION "Production"."funcUpdateManufacturerVehicleStockHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "SalesCategoryThresholdId", "d"."SalesCategoryThresholdId", "LowerThreshold", "d"."LowerThreshold", "UpperThreshold", "d"."UpperThreshold", "CategoryDescription", "d"."CategoryDescription", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."SalesCategoryThreshold" as "d"
    WHERE "d"."SalesCategoryThresholdId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfSalesSalesCategoryThreshold" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfSalesSalesCategoryThreshold"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOSalesSalesCategoryThreshold" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."SalesCategoryThreshold" AS "d"
        WHERE "d"."SalesCategoryThresholdId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."SalesCategoryThresholdId", "d"."LowerThreshold", "d"."UpperThreshold", "d"."CategoryDescription", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesSalesCategoryThresholdHistory" as "d"
        WHERE "d"."SalesCategoryThresholdId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Sales"."funcDeleteSalesCategoryThresholdHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."SalesSalesCategoryThresholdHistory"
    (
      "SalesCategoryThresholdId", "LowerThreshold", "UpperThreshold", "CategoryDescription", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."SalesCategoryThresholdId", old."LowerThreshold", old."UpperThreshold", old."CategoryDescription",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_SalesSalesCategoryThreshold"
AFTER DELETE
ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcDeleteSalesCategoryThresholdHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcInsertSalesCategoryThresholdHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Sales"."SalesCategoryThreshold"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesCategoryThreshold"(NEW."SalesCategoryThresholdId")
  where "SalesCategoryThresholdId" = new."SalesCategoryThresholdId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_SalesSalesCategoryThreshold"
AFTER INSERT
ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcInsertSalesCategoryThresholdHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_SalesCategoryThreshold on Sales.SalesCategoryThreshold
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcUpdateSalesCategoryThresholdHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."SalesSalesCategoryThresholdHistory"
    (
      "SalesCategoryThresholdId", "LowerThreshold", "UpperThreshold", "CategoryDescription", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."SalesCategoryThresholdId", old."LowerThreshold", old."UpperThreshold", old."CategoryDescription",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Sales"."SalesCategoryThreshold"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."SalesCategoryThresholdId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "SalesCategoryThresholdId" = new."SalesCategoryThresholdId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_SalesSalesCategoryThreshold"
AFTER UPDATE
ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcUpdateSalesCategoryThresholdHistory"();



CREATE OR REPLACE FUNCTION "Sales"."funcUpdateSalesCategoryThresholdCategoryDescription"()
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
CREATE TRIGGER "uTu_SalesSalesCategoryThresholdCategoryDescription"
BEFORE INSERT OR UPDATE ON "Sales"."SalesCategoryThreshold"
FOR EACH ROW EXECUTE FUNCTION "Sales"."funcUpdateSalesCategoryThresholdCategoryDescription"();

-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "SalesOrderVehicleId", "d"."SalesOrderVehicleId", "CustomerId", "d"."CustomerId", "StaffId", "d"."StaffId", "InvoiceNumber", "d"."InvoiceNumber", "TotalSalePrice", "d"."TotalSalePrice", "SaleDate", "d"."SaleDate", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."SalesOrderVehicle" as "d"
    WHERE "d"."SalesOrderVehicleId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfSalesSalesOrderVehicle" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfSalesSalesOrderVehicle"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOSalesSalesOrderVehicle" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."SalesOrderVehicle" AS "d"
        WHERE "d"."SalesOrderVehicleId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."SalesOrderVehicleId", "d"."CustomerId", "d"."StaffId", "d"."InvoiceNumber", "d"."TotalSalePrice", "d"."SaleDate", "d"."SalesCategoryThresholdId", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesSalesOrderVehicleHistory" as "d"
        WHERE "d"."SalesOrderVehicleId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "Sales"."funcDeleteSalesOrderVehicleHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."SalesSalesOrderVehicleHistory"
    (
      "SalesOrderVehicleId", "CustomerId", "StaffId", "InvoiceNumber", "TotalSalePrice", "SaleDate", "SalesCategoryThresholdId", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."SalesOrderVehicleId", old."CustomerId", old."StaffId", old."InvoiceNumber", old."TotalSalePrice", old."SaleDate", old."SalesCategoryThresholdId",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_SalesSalesOrderVehicle"
AFTER DELETE
ON "Sales"."SalesOrderVehicle"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcDeleteSalesOrderVehicleHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcInsertSalesOrderVehicleHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Sales"."SalesOrderVehicle"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicle"(NEW."SalesOrderVehicleId")
  where "SalesOrderVehicleId" = new."SalesOrderVehicleId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_SalesSalesOrderVehicle"
AFTER INSERT
ON "Sales"."SalesOrderVehicle"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcInsertSalesOrderVehicleHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_SalesOrderVehicle on Sales.SalesOrderVehicle
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcUpdateSalesOrderVehicleHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."SalesSalesOrderVehicleHistory"
    (
      "SalesOrderVehicleId", "CustomerId", "StaffId", "InvoiceNumber", "TotalSalePrice", "SaleDate", "SalesCategoryThresholdId", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."SalesOrderVehicleId", old."CustomerId", old."StaffId", old."InvoiceNumber", old."TotalSalePrice", old."SaleDate", old."SalesCategoryThresholdId",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Sales"."SalesOrderVehicle"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."SalesOrderVehicleId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "SalesOrderVehicleId" = new."SalesOrderVehicleId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_SalesSalesOrderVehicle"
AFTER UPDATE
ON "Sales"."SalesOrderVehicle"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcUpdateSalesOrderVehicleHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "SalesOrderVehicleDetailId", "d"."SalesOrderVehicleDetailId", "SalesOrderVehicleId", "d"."SalesOrderVehicleId", "LineItemNumber", "d"."LineItemNumber", "ManufacturerVehicleStockId", "d"."ManufacturerVehicleStockId", "SalePrice", "d"."SalePrice", "LineItemDiscount", "d"."LineItemDiscount", "DerivedDiscountedSalePrice", "d"."DerivedDiscountedSalePrice", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "Sales"."SalesOrderVehicleDetail" as "d"
    WHERE "d"."SalesOrderVehicleDetailId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfSalesSalesOrderVehicleDetail" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfSalesSalesOrderVehicleDetail"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOSalesSalesOrderVehicleDetail" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Sales"."SalesOrderVehicleDetail" AS "d"
        WHERE "d"."SalesOrderVehicleDetailId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."SalesOrderVehicleDetailId", "d"."SalesOrderVehicleId", "d"."LineItemNumber", "d"."ManufacturerVehicleStockId", "d"."SalePrice", "d"."LineItemDiscount", "d"."DerivedDiscountedSalePrice", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."SalesSalesOrderVehicleDetailHistory" as "d"
        WHERE "d"."SalesOrderVehicleDetailId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "Sales"."funcUpdateSalesOrderVehicleDetailDerivedDiscountedSalePrice"()
RETURNS TRIGGER AS $$
BEGIN
  NEW."DerivedDiscountedSalePrice" = NEW."SalePrice" - NEW."LineItemDiscount";
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to call the function before each INSERT or UPDATE
CREATE TRIGGER "uTu_SalesSalesOrderVehicleDetailDerivedDiscountedSalePrice"
BEFORE INSERT OR UPDATE ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW EXECUTE FUNCTION "Sales"."funcUpdateSalesOrderVehicleDetailDerivedDiscountedSalePrice"();

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

CREATE OR REPLACE FUNCTION "Sales"."funcDeleteSalesOrderVehicleDetailHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."SalesSalesOrderVehicleDetailHistory"
    (
      "SalesOrderVehicleDetailId", "SalesOrderVehicleId", "LineItemNumber", "ManufacturerVehicleStockId", "SalePrice", "LineItemDiscount", "DerivedDiscountedSalePrice", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
       old."SalesOrderVehicleDetailId",  old."SalesOrderVehicleId", old."LineItemNumber",  old."SalePrice", old."LineItemDiscount",  old."DerivedDiscountedSalePrice", old."ManufacturerVehicleStockId",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_SalesSalesOrderVehicleDetail"
AFTER DELETE
ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcDeleteSalesOrderVehicleDetailHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: Sales_uTi_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcInsertSalesOrderVehicleDetailHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "Sales"."SalesOrderVehicleDetail"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputSalesSalesOrderVehicleDetail"(NEW."SalesOrderVehicleDetailId")
  where "SalesOrderVehicleDetailId" = new."SalesOrderVehicleDetailId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_SalesSalesOrderVehicleDetail"
AFTER INSERT
ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcInsertSalesOrderVehicleDetailHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: Sales_uTu_SalesOrderVehicleDetail on Sales.SalesOrderVehicleDetail
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "Sales"."funcUpdateSalesOrderVehicleDetailHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."SalesSalesOrderVehicleDetailHistory"
    (
      "SalesOrderVehicleDetailId", "SalesOrderVehicleId", "LineItemNumber", "ManufacturerVehicleStockId", "SalePrice", "LineItemDiscount", "DerivedDiscountedSalePrice", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
       old."SalesOrderVehicleDetailId",  old."SalesOrderVehicleId", old."LineItemNumber",  old."SalePrice", old."LineItemDiscount",  old."DerivedDiscountedSalePrice", old."ManufacturerVehicleStockId",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "Sales"."SalesOrderVehicleDetail"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."SalesOrderVehicleDetailId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "SalesOrderVehicleDetailId" = new."SalesOrderVehicleDetailId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_SalesSalesOrderVehicleDetail"
AFTER UPDATE
ON "Sales"."SalesOrderVehicleDetail"
FOR EACH ROW
EXECUTE FUNCTION "Sales"."funcUpdateSalesOrderVehicleDetailHistory"();



-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Function Name: "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"
-- Description: Create SHA256 Hashkey from JSON Input

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE FUNCTION "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff" (pky INT)
RETURNS BYTEA AS
$$
DECLARE
    column_output_in_json_including_null_values JSONB;
BEGIN
    SELECT jsonb_build_object(
      "StaffId", "d"."StaffId", "StaffName", "d"."StaffName", "TransactionNumber", "d"."TransactionNumber", "Note", "d"."Note", "UserAuthorizationId", "d"."UserAuthorizationId", "SysStartTime", "d"."SysStartTime", "SysEndTime", "d"."SysEndTime", "FireAuditTrigger", "d"."FireAuditTrigger"
    )::TEXT
    INTO column_output_in_json_including_null_values
    FROM "HumanResources"."Staff" as "d"
    WHERE "d"."StaffId" = pky;

    RETURN encode(digest(column_output_in_json_including_null_values::text, 'sha256'), 'hex')::BYTEA;
END;
$$ LANGUAGE plpgsql
;

-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Function Name: "viewFunc-FindAllTransactionsViewByTablePkyOfHumanResourcesStaff" 
-- Description: A view to find all transactions by Primary Key


CREATE OR REPLACE FUNCTION "viewFunc-FindAllTransactionsViewByTablePkyOfHumanResourcesStaff"(pky INT)
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE OR REPLACE VIEW "vw_FindAllTransactionsByTablePkyOHumanResourcesStaff" AS
        SELECT ''Current'' AS "TransactionType",
               NULL AS "AuditDateTimeStamp",
               NULL AS "DBAction",
               "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "HumanResources"."Staff" AS "d"
        WHERE "d"."StaffId" = ' || pky || '
        UNION ALL
        SELECT ''History'' AS "TransactionType",
               "d"."AuditDateTimeStamp",
               "d"."DBAction",
               "d"."StaffId", "d"."StaffName", "d"."ManagerId", "d"."Department", "d"."TransactionNumber", "d"."Note", "d"."UserAuthorizationId", "d"."SysStartTime", "d"."SysEndTime", "d"."RowLevelHashKey", "d"."PriorRowLevelHashKey", "d"."FireAuditTrigger"
        FROM "Audit"."HumanResourcesStaffHistory" as "d"
        WHERE "d"."StaffId" = ' || pky;
END;
$$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION "HumanResources"."funcDeleteStaffHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    INSERT INTO "Audit"."HumanResourcesStaffHistory"
    (
      "StaffId", "StaffName", "ManagerId", "Department", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."StaffId", old."StaffName", old."ManagerId", old."Department",
      old."TransactionNumber",
      'Row was deleted',
      old."UserAuthorizationId",
      old."SysStartTime",
      now(),
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      old."FireAuditTrigger",
      now(),
      'D',
      'Y'
    );
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTd_HumanResourcesStaff"
AFTER DELETE
ON "HumanResources"."Staff"
FOR EACH ROW
EXECUTE FUNCTION "HumanResources"."funcDeleteStaffHistory"();


-- Author: Ralph Granata
-- Creation Date: 12/05/2023
-- Trigger Name: HumanResources_uTi_Staff on HumanResources.Staff
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "HumanResources"."funcInsertStaffHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
  IF NEW."TransactionNumber" = 1 THEN
  NEW."PriorRowLevelHashKey" := NULL;
  NEW."Note" := 'Row Inserted';
  NEW."FireAuditTrigger" := 'N';

  update "HumanResources"."Staff"
  set "RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputHumanResourcesStaff"(NEW."StaffId")
  where "StaffId" = new."StaffId";
  END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTi_HumanResourcesStaff"
AFTER INSERT
ON "HumanResources"."Staff"
FOR EACH ROW
EXECUTE FUNCTION "HumanResources"."funcInsertStaffHistory"();





-- Author: Ralph Granata
-- Creation Date: 12/05/2023

-- Trigger Name: HumanResources_uTu_Staff on HumanResources.Staff
-- Trigger Type: After 

-- Description: PG-AuditInsertTrigger Templated Code
CREATE OR REPLACE FUNCTION "HumanResources"."funcUpdateStaffHistory"()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $function$

BEGIN
    if (new."FireAuditTrigger" = 'Y') then
    INSERT INTO "Audit"."HumanResourcesStaffHistory"
    (
      "StaffId", "StaffName", "ManagerId", "Department", "TransactionNumber", "Note", "UserAuthorizationId", "SysStartTime", "SysEndTime", "RowLevelHashKey", "PriorRowLevelHashKey", "FireAuditTrigger", "AuditDateTimeStamp", "DBAction", "IsDeleted"
    )
    VALUES(
      old."StaffId", old."StaffName", old."ManagerId", old."Department",
      old."TransactionNumber",
      coalesce(old."Note", concat('No Message Transaction Number: ', old."TransactionNumber")),
      old."UserAuthorizationId",
      old."SysStartTime",
      new."SysStartTime",
      old."RowLevelHashKey",
      old."PriorRowLevelHashKey",
      new."FireAuditTrigger",
      new."SysStartTime",
      'U',
      'N'
    );
    update "HumanResources"."Staff"
    SET
    "TransactionNumber" = old."TransactionNumber" + 1,
	"RowLevelHashKey" = "Hashing"."CreateSha256KeyFromJsonInputLocaleCountry"(NEW."StaffId"),
	"PriorRowLevelHashKey" = old."RowLevelHashKey",
	"Note" = coalesce(new."Note", 'Row updated'),
	"FireAuditTrigger" = 'N'
	where "StaffId" = new."StaffId";
    END IF;
  RETURN NEW;
END;
$function$
;

CREATE TRIGGER "uTu_HumanResourcesStaff"
AFTER UPDATE
ON "HumanResources"."Staff"
FOR EACH ROW
EXECUTE FUNCTION "HumanResources"."funcUpdateStaffHistory"();


