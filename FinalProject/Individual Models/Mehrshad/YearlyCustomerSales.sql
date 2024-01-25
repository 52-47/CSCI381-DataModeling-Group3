CREATE VIEW Utils.uvw_YearlyCustomerSales
as
SELECT
        Sales.SalesOrderVehicle.SaleDate                              ,
        Sales.Customer.CustomerName                                   ,
        Production.ManufacturerVehicleMake.ManufacturerVehicleMakeName,
        Production.ManufacturerModel.ManufacturerModelName            ,
        Sales.SalesOrderVehicleDetail.SalePrice
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
CROSS JOIN
        Production.ManufacturerModel
INNER JOIN
        Production.ManufacturerVehicleMake
ON
        Production.ManufacturerModel.ManufacturerVehicleMakeId = Production.ManufacturerVehicleMake.ManufacturerVehicleMakeId