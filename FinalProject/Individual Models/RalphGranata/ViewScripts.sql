-- YearlySales
SELECT
	YEAR("Sales"."SalesOrderVehicle"."SaleDate") AS "SalesYear",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
    	"Sales"."Customer"."CustomerName",
	"Locale"."Country"."CountryName",
	"Production"."ManufacturerVehicleStock"."Cost",
    	"Production"."ManufacturerVehicleStock"."RepairsCharge",
    	"Production"."ManufacturerVehicleStock"."PartsCharge" AS "PartsCost",
    	"Production"."ManufacturerVehicleStock"."DeliveryCharge" AS "TransportInCost",
	"Sales"."SalesOrderVehicleDetail"."SalePrice",
	"Sales"."SalesOrderVehicle"."SaleDate"
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
    "Production"."ManufacturerModel"."ManufacturerVehicleMakeId" = "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId"
ORDER BY "Sales"."SalesOrderVehicle"."SaleDate";



-- SalesByCountry
SELECT
	"Locale"."Country"."CountryName",
	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName",
	"Production"."ManufacturerVehicleStock"."Cost" AS "Cost",
	"Production"."ManufacturerVehicleStock"."RepairsCharge" AS "RepairsCost",
	"Production"."ManufacturerVehicleStock"."PartsCharge" AS "PartsCost",
	"Production"."ManufacturerVehicleStock"."DeliveryCharge" AS "TransportInCost",
	"Production"."ManufacturerVehicleStock"."VehicleColor" AS "Color",
	"Sales"."SalesOrderVehicleDetail"."SalePrice",
	"Sales"."SalesOrderVehicleDetail"."LineItemDiscount",
	"Sales"."SalesOrderVehicle"."InvoiceNumber",
	"Sales"."SalesOrderVehicle"."SaleDate",
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
ORDER BY "Locale"."Country"."CountryName";


--Pivot Table
SELECT
    "VehicleColor",
    SUM(CASE WHEN YEAR("SaleDate") = 2015 THEN "TotalSalePrice" ELSE 0 END) AS "CY2015",
    SUM(CASE WHEN YEAR("SaleDate") = 2016 THEN "TotalSalePrice" ELSE 0 END) AS "CY2016",
    SUM(CASE WHEN YEAR("SaleDate") = 2017 THEN "TotalSalePrice" ELSE 0 END) AS "CY2017",
    SUM(CASE WHEN YEAR("SaleDate") = 2018 THEN "TotalSalePrice" ELSE 0 END) AS "CY2018"
FROM
    "Sales"."SalesOrderVehicle"
JOIN
    "Sales"."SalesOrderVehicleDetail" ON "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
JOIN
    "Production"."ManufacturerVehicleStock" ON "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
GROUP BY
    "VehicleColor"
ORDER BY
    "VehicleColor";


-- Stock Prices
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


-- SalesText
SELECT
    co."CountryName",
    mvm."ManufacturerVehicleMakeName" AS "MakeName",
    FORMAT(mvs."Cost", 'C', 'en-US') AS "Cost",
    FORMAT(sv."TotalSalePrice", 'C', 'en-US') AS "SalePrice"
FROM
    "Sales"."SalesOrderVehicle" sv
	JOIN "Sales"."SalesOrderVehicleDetail" svd ON svd."SalesOrderVehicleId" = sv."SalesOrderVehicleId"
    JOIN "Production"."ManufacturerVehicleStock" mvs ON svd."ManufacturerVehicleStockId" = mvs."ManufacturerVehicleStockId"
    JOIN "Production"."ManufacturerModel" mm ON mvs."ModelId" = mm."ManufacturerModelId"
	JOIN "Production"."ManufacturerVehicleMake" mvm ON mvm."ManufacturerVehicleMakeId" = mm."ManufacturerVehicleMakeId"
    JOIN "Sales"."Customer" c ON sv."CustomerId" = c."CustomerId"
    JOIN "Locale"."Country" co ON c."CountryId" = co."CountryId"
ORDER BY co."CountryName", mvm."ManufacturerVehicleMakeName" ;



-- SalesByCountry
SELECT
    	"Locale"."Country"."CountryName",
    	"Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeName" AS "MakeName",
    	"Production"."ManufacturerModel"."ManufacturerModelName" AS "ModelName", 
    	FORMAT("Production"."ManufacturerVehicleStock"."Cost", 'C', 'en-US') AS "Cost",
    	FORMAT("Production"."ManufacturerVehicleStock"."RepairsCharge", 'C', 'en-US') AS "RepairsCost",
    	FORMAT("Production"."ManufacturerVehicleStock"."PartsCharge", 'C', 'en-US') AS "PartsCost",
    	FORMAT("Production"."ManufacturerVehicleStock"."DeliveryCharge", 'C', 'en-US') AS "TransportInCost",
    	"Production"."ManufacturerVehicleStock"."VehicleColor" AS "Color",
    	"Sales"."SalesOrderVehicle"."TotalSalePrice" AS "SalePrice",
    	"Sales"."SalesOrderVehicleDetail"."LineItemDiscount",
    	"Sales"."SalesOrderVehicle"."InvoiceNumber",
    	"Sales"."SalesOrderVehicle"."SaleDate",
    	"Sales"."Customer"."CustomerName",
    	"Sales"."SalesOrderVehicle"."SalesOrderVehicleId" AS "SalesDetailsID"
FROM
    "Sales"."SalesOrderVehicle"
	JOIN "Sales"."SalesOrderVehicleDetail" ON "Sales"."SalesOrderVehicle"."SalesOrderVehicleId" = "Sales"."SalesOrderVehicleDetail"."SalesOrderVehicleId"
   	JOIN "Production"."ManufacturerVehicleStock" ON "Sales"."SalesOrderVehicleDetail"."ManufacturerVehicleStockId" = "Production"."ManufacturerVehicleStock"."ManufacturerVehicleStockId"
   	JOIN "Production"."ManufacturerModel" ON "Production"."ManufacturerVehicleStock"."ModelId" = "Production"."ManufacturerModel"."ManufacturerModelId"
	JOIN "Production"."ManufacturerVehicleMake" ON "Production"."ManufacturerVehicleMake"."ManufacturerVehicleMakeId" = "Production"."ManufacturerModel"."ManufacturerVehicleMakeId"
   	JOIN "Sales"."Customer" ON "Sales"."SalesOrderVehicle"."CustomerId" = "Sales"."Customer"."CustomerId"
   	JOIN "Locale"."Country" ON "Sales"."Customer"."CountryId" = "Locale"."Country"."CountryId";
