CREATE VIEW `uvw_JimmyCustomerMakeModel` AS
SELECT 
	`Sales.Customer`.`CustomerName` AS `CustName`,
	`Production.ManufacturerVehicleMake`.`ManufacturerVehicleMakeName` AS `MakeName`, 
	`Production.ManufacturerModel`.`ManufacturerModelName` AS `Model`
FROM 
`Production.ManufacturerVehicleMake`
INNER JOIN
`Sales.Customer`
ON `Production.ManufacturerVehicleMake`.`TransactionNumber` = `Sales.Customer`.`TransactionNumber`
INNER JOIN 
`Production.ManufacturerModel`
ON `Sales.Customer`.`TransactionNumber` = `Production.ManufacturerModel`.`TransactionNumber`
;
