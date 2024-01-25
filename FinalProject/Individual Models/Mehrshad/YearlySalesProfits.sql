CREATE VIEW Utils.uvw_YearlySalesProfits
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
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId"
