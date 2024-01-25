CREATE VIEW `uvw_JimmyModelCountry` AS 
SELECT 
	`Production.ManufacturerModel`.`ManufacturerModelName` AS `ModelName`,
	`Locale.Country`.`CountryName` AS `CountryName`
FROM 
`Locale.Country` 
INNER JOIN
`Production.ManufacturerModel` 
ON `Locale.Country`.`TransactionNumber` = `Production.ManufacturerModel`.`TransactionNumber`
;