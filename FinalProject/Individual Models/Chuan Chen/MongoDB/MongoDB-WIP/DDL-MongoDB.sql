/*
file has to be rand within currently operating sql server 2019 use provided ddl first for sql generation
*/
--Create Mongo Schema--
CREATE SCHEMA Mongo
go

-- Staff Views --
CREATE VIEW Mongo.uvw_Staff as 
SELECT StaffId, StaffName, Department from HumanResources.Staff;
go

-- SalesCategoryThreshold Views --
CREATE VIEW Mongo.uvw_SalesCategoryThreshold as
SELECT SalesCategoryThresholdId, LowerThreshold, UpperThreshold from Sales.SalesCategoryThreshold;
go

-- Country Views --
CREATE VIEW Mongo.uvw_Country as
SELECT CountryId, CountryName from Locale.Country;
go

-- UserAuthorization Views --
CREATE VIEW Mongo.uvw_UserAuthorization as 
SELECT UserAuthorizationId, GroupMemberLastName, GroupMemberFirstName from DbSecurity.UserAuthorization;
go

-- Customer Views --
CREATE VIEW Mongo.uvw_Customer AS 
SELECT 
CustomerId, 
CustomerName, 
CustomerTown, 
CustomerPostalCode, 
(SELECT * FROM Mongo.uvw_Country as MC where Customer.CountryId = MC.CountryId FOR JSON PATH) as Country 
FROM Sales.Customer;
go

-- SalesOrderVehicle Views --
CREATE VIEW Mongo.uvw_SalesOrderVehicle AS
SELECT
    SOV.SalesOrderVehicleId,
    SOV.TotalSalePrice,
    SOV.SaleDate,
    (
        SELECT *
        FROM Mongo.uvw_SalesCategoryThreshold AS SCT
        WHERE SCT.SalesCategoryThresholdId = SOV.SalesCategoryThresholdId
        FOR JSON PATH
    ) AS SalesCategoryThreshold,
    (
        SELECT *
        FROM Mongo.uvw_Staff AS S
        WHERE S.StaffId = SOV.StaffId
        FOR JSON PATH
    ) AS Staff,
    (
        SELECT * 
        FROM Mongo.uvw_Customer AS C
        WHERE C.CustomerId = SOV.CustomerId
        FOR JSON PATH
    ) AS Customer,
	(
		SELECT *
		From Mongo.uvw_UserAuthorization AS UA
		WHERE UA.UserAuthorizationId = SOV.UserAuthorizationId
		FOR JSON PATH
	) AS UserAuthorization
FROM Sales.SalesOrderVehicle AS SOV;
go

-- ManufacturerVehicleMake Views --
CREATE VIEW Mongo.uvw_ManufacturerVehicleMake AS SELECT ManufacturerVehicleMakeId, 
ManufacturerVehicleMakeName, 
(SELECT * FROM Mongo.uvw_Country as MC where PMVM.CountryId = MC.CountryId FOR JSON PATH) as Country FROM Production.ManufacturerVehicleMake as PMVM;
go

-- ManufacturerModel Views --
CREATE VIEW Mongo.uvw_ManufacturerModel AS 
SELECT 
ManufacturerModelId, 
ManufacturerModelName, 
ManufacturerModelVariant, 
(SELECT * FROM Mongo.uvw_ManufacturerVehicleMake as MVM where MVM.ManufacturerVehicleMakeId = PMM.ManufacturerVehicleMakeId FOR JSON PATH) as ManufacturerVehicleMake
FROM Production.ManufacturerModel as PMM;
go

-- ManufacturerVehicleStock Views --
CREATE VIEW Mongo.uvw_ManufacturerVehicleStock AS
SELECT 
ManufacturerVehicleStockId, 
StockCode, 
Cost, 
RepairsCharge, 
PartsCharge, 
DeliveryCharge, 
VehicleColor, ModelId, PurchaseDate, 
(SELECT * FROM Mongo.uvw_ManufacturerModel as MVM where MVM.ManufacturerModelId = PMVS.ModelId FOR JSON PATH) as ManufacturerModel 
FROM Production.ManufacturerVehicleStock as PMVS;
go

-- SalesOrderVehicleDetail Views --
CREATE VIEW Mongo.uvw_SalesOrderVehicleDetail AS
SELECT 
SalesOrderVehicleDetailId, 
LineItemNumber, 
SalePrice, 
LineItemDiscount, 
DerivedDiscountedSalePrice, 
(SELECT * FROM Mongo.uvw_ManufacturerVehicleStock AS MVS where MVS.ManufacturerVehicleStockId = SSOVD.ManufacturerVehicleStockId FOR JSON PATH) AS ManufacturerVehicleStock,
(SELECT * FROM Mongo.uvw_SalesOrderVehicle AS SOV where SOV.SalesOrderVehicleId = SSOVD.SalesOrderVehicleId FOR JSON PATH) AS SalesOrderVehicle FROM
Sales.SalesOrderVehicleDetail AS SSOVD;
go

--Collections--

--SalesCategoryThreshold Collection--
SELECT (SELECT * FROM Mongo.uvw_SalesCategoryThreshold FOR JSON PATH, INCLUDE_NULL_VALUES) AS SalesCategoryThreshold;

--Staff Collection--
SELECT (SELECT * FROM Mongo.uvw_Staff FOR JSON PATH, INCLUDE_NULL_VALUES) AS Staff;

--Country Collection--
SELECT (SELECT * FROM Mongo.uvw_Country FOR JSON PATH, INCLUDE_NULL_VALUES) AS Country;

--UserAuthorization Collection--
SELECT (SELECT * FROM Mongo.uvw_UserAuthorization FOR JSON PATH, INCLUDE_NULL_VALUES) AS UserAuthorization;

--Customer Collection--
SELECT (SELECT * FROM Mongo.uvw_Customer FOR JSON PATH, INCLUDE_NULL_VALUES) AS Customer;

--SalesOrderVehicle Collection--
--SELECT * FROM Mongo.uvw_SalesOrderVehicle FOR JSON PATH, ROOT('SalesOrderVehicles'), INCLUDE_NULL_VALUES;
SELECT (SELECT * FROM Mongo.uvw_SalesOrderVehicle FOR JSON PATH, INCLUDE_NULL_VALUES) AS SalesOrderVehicle;

-- ManufacturerVehicleMake Collection--
SELECT (SELECT ManufacturerVehicleMakeId, 
ManufacturerVehicleMakeName, 
(SELECT * FROM Mongo.uvw_Country as MC where PMVM.CountryId = MC.CountryId FOR JSON PATH) as Country 
FROM Production.ManufacturerVehicleMake as PMVM FOR JSON PATH, INCLUDE_NULL_VALUES) AS ManufacturerVehicleMake;

-- ManufacturerVehicleModel Collection --

SELECT (SELECT * FROM Mongo.uvw_ManufacturerModel FOR JSON PATH, INCLUDE_NULL_VALUES) AS ManufacturerModel;

-- ManufacturerVehicleModel Collection --
SELECT (SELECT * FROM Mongo.uvw_ManufacturerVehicleStock FOR JSON PATH , INCLUDE_NULL_VALUES) AS ManufacturerVehicleStock;

-- SalesOrderVehicleDetail Collection --
SELECT (SELECT * FROM Mongo.uvw_SalesOrderVehicleDetail FOR JSON PATH , INCLUDE_NULL_VALUES) AS SalesOrderVehicleDetail;