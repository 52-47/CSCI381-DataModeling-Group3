CREATE VIEW Utils.uvw_Sales2018 as
SELECT
    YEAR("Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
    "Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    "Sales"."Customer"."CustomerName",
    "Locale"."Country"."CountryName",
    FORMAT("Production"."ManufacturerVehicleStock"."Cost", 'C', 'en-US') as Cost,
    FORMAT("Production"."ManufacturerVehicleStock"."RepairsCharge", 'C', 'en-US') as RepairCost,
    FORMAT("Production"."ManufacturerVehicleStock"."PartsCharge", 'C', 'en-US') AS "PartsCost",
    FORMAT("Production"."ManufacturerVehicleStock"."DeliveryCharge", 'C', 'en-US') AS "TransportInCost",
    "Sales"."SalesOrderVehicleDetail"."SalePrice",
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