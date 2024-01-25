CREATE VIEW `uvw_JimmyCustomerVehicleVehicleDetail` AS
SELECT 
	`Sales.Customer`.`CustomerName` AS `CustName`,
	`Sales.SalesOrderVehicle`.`TotalSalePrice` AS `TotalSale`, 
	`Sales.SalesOrderVehicleDetail`.`SalePrice` AS `SalePrice`
FROM 
`Sales.Customer`
INNER JOIN
`Sales.SalesOrderVehicle` 
ON `Sales.Customer`.`CustomerId` = `Sales.SalesOrderVehicle`.`CustomerId`
INNER JOIN 
`Sales.SalesOrderVehicleDetail` 
ON `Sales.SalesOrderVehicle`.`SalesOrderVehicleId` = `Sales.SalesOrderVehicleDetail`.`SalesOrderVehicleId`
;