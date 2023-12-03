CREATE VIEW Utils.uvw_VehicleCost
as
SELECT
        Production.ManufacturerVehicleMake.ManufacturerVehicleMakeName,
        Production.ManufacturerModel.ManufacturerModelName            ,
        Production.ManufacturerVehicleStock.Cost
FROM
        Sales.SalesOrderVehicleDetail
INNER JOIN
        Sales.SalesOrderVehicle
ON
        Sales.SalesOrderVehicleDetail.SalesOrderVehicleId = Sales.SalesOrderVehicle.SalesOrderVehicleId
INNER JOIN
        Sales.Customer
ON
        Sales.SalesOrderVehicle.CustomerId = Sales.Customer.CustomerId
INNER JOIN
        Production.ManufacturerVehicleStock
ON
        Sales.SalesOrderVehicleDetail.ManufacturerVehicleStockId = Production.ManufacturerVehicleStock.ManufacturerVehicleStockId
INNER JOIN
        Production.ManufacturerModel
INNER JOIN
        Production.ManufacturerVehicleMake
ON
        Production.ManufacturerModel.ManufacturerVehicleMakeId = Production.ManufacturerVehicleMake.ManufacturerVehicleMakeId
ON
        Production.ManufacturerVehicleStock.ModelId = Production.ManufacturerModel.ManufacturerModelId