CREATE VIEW Sales.ChuanModelMake as 
select PMM.ManufacturerModelName as Model, PMVM.ManufacturerVehicleMakeName as Make from Production.ManufacturerModel as PMM
INNER JOIN Production.ManufacturerVehicleMake as PMVM on  PMM.ManufacturerVehicleMakeId = PMVM.ManufacturerVehicleMakeId


CREATE VIEW Sales.ChuanMakeCountry as
select LC.CountryName as Country, PMVM.ManufacturerVehicleMakeName as Make from Production.ManufacturerVehicleMake as PMVM
INNER JOIN Locale.Country as LC on PMVM.CountryId = LC.CountryId;


CREATE VIEW Sales.ChuanCustomerCountry as
select SC.CustomerName,LC.CountryName from Sales.Customer as SC INNER JOIN Locale.Country as LC on LC.CountryId = SC.CountryId;

CREATE VIEW Sales.ChuanStaffSales as
select HRS.StaffName, FORMAT(SUM(SSOV.TotalSalePrice), 'C', 'en-US') as TotalSales from HumanResources.Staff as HRS 
INNER JOIN Sales.SalesOrderVehicle as SSOV on HRS.StaffId = SSOV.StaffId group by StaffName;

CREATE VIEW Sales.ChuanStaffDiscountGiven as
select HRS.StaffName, FORMAT(SUM(SSOVD.LineItemDiscount), 'C', 'en-US') as DiscountGiven from HumanResources.Staff as HRS
INNER JOIN Sales.SalesOrderVehicle as SSOV on HRS.StaffId = SSOV.StaffId 
INNER JOIN Sales.SalesOrderVehicleDetail as SSOVD on SSOV.SalesOrderVehicleId = SSOVD.SalesOrderVehicleId group by StaffName;

