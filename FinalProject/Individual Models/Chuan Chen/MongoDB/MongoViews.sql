CREATE SCHEMA Mongo
go

CREATE VIEW Mongo.uvw_Staff as 
SELECT StaffId, StaffName, Department from HumanResources.Staff;

CREATE VIEW Mongo.uvw_SalesCategoryThreshold as
SELECT SalesCategoryThresholdId, LowerThreshold, UpperThreshold from Sales.SalesCategoryThreshold;

CREATE VIEW Mongo.uvw_Country as
SELECT CountryId, CountryName from Locale.Country;

CREATE VIEW Mongo.uvw_UserAuthorization as 
SELECT UserAuthorizationId, GroupMemberLastName, GroupMemberFirstName from DbSecurity.UserAuthorization;

CREATE VIEW Mongo.uvw_Customer AS 
SELECT 
CustomerId, 
CustomerName, 
CustomerTown, 
CustomerPostalCode, 
(SELECT * FROM Mongo.uvw_Country as MC where Customer.CountryId = MC.CountryId FOR JSON PATH) as Country 
FROM Sales.Customer;



--SalesCategoryThreshold Collection--
SELECT * FROM Mongo.uvw_SalesCategoryThreshold FOR JSON PATH

--Staff Collection--
SELECT * FROM Mongo.uvw_Staff FOR JSON PATH

--Country Collection--
SELECT * FROM Mongo.uvw_Country FOR JSON PATH

--UserAuthorization Collection--
SELECT * FROM Mongo.uvw_UserAuthorization FOR JSON PATH

--Customer Collection--
SELECT * FROM Mongo.uvw_Customer FOR JSON PATH

--SalesOrderVehicle Collection--
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
FROM Sales.SalesOrderVehicle AS SOV
FOR JSON PATH, ROOT('SalesOrderVehicles'), INCLUDE_NULL_VALUES;
