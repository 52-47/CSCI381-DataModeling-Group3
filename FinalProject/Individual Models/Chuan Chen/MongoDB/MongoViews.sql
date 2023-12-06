

select SalesOrderVehicleId, InvoiceNumber, TotalSalePrice, SaleDate, TransactionNumber, SysStartTime, SysEndTime, RowLevelHashKey, PriorRowLevelHashKey, FireAuditTrigger, Staff.* , SalesCategoryThreshold.* from Sales.SalesOrderVehicle as SalesOrderVehicle
INNER JOIN (SELECT StaffId, StaffName, Department from HumanResources.Staff) as Staff on SalesOrderVehicle.StaffId = Staff.StaffId 
INNER JOIN (SELECT SalesCategoryThresholdId, LowerThreshold, UpperThreshold from Sales.SalesCategoryThreshold) as SalesCategoryThreshold on SalesOrderVehicle.SalesCategoryThresholdId = SalesCategoryThreshold.SalesCategoryThresholdId
for json auto, include_null_values;