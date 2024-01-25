CREATE VIEW "CustomViews"."uvw_RyanCustomerCountryDate" as
SELECT 
    C.CustomerName,
    CO.CountryName,
	MIN(CO.SysStartTime) as StartTime,
	MAX(CO.SysEndTime) as EndTime
FROM 
    Sales.Customer C
INNER JOIN 
    Locale.Country CO ON C.CountryId = CO.CountryId
GROUP BY 
    C.CustomerName, CO.CountryName;

CREATE VIEW "CustomViews"."uvw_RyanCustomerLatestTotalSaleDate" as
SELECT
	C.CustomerName,
	SUM(SOV.TotalSalePrice) as TotalSalePrice,
	MAX(SOV.SaleDate) as LatestSaleDate
FROM
	Sales.Customer C
INNER JOIN
	Sales.SalesOrderVehicle SOV ON C.CustomerId = SOV.CustomerId
GROUP BY
	C.CustomerName;

CREATE VIEW "CustomViews"."uvw_RyanGroupSpendCapacity" as
SELECT
    G.GroupName,
    SUM(CAST(C.SpendCapacity AS float)) as TotalSpendCapacity
FROM
    DbSecurity.UserAuthorization G
INNER JOIN
    Sales.Customer C ON C.UserAuthorizationId = G.UserAuthorizationId
GROUP BY
    G.GroupName;