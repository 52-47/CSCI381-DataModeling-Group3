# PostgreSQL 11
# Model Update Notes - 12/03/2023 ~ 12/05/2023:
- Copied SQL Server Model, changed target DB to PostgreSQL.
- Updated all necessary Domains, Defaults, Constraints to use proper datatypes and PG syntax.
- Converted views syntax to PG.
- Manipulated data insertion file to work with PG.

# Model Update Notes - 12/05/2023:
- Merged all from latest SQLServerModel
- PG doesnt support 'GENERATED AS' expressions:
  - Created 2 triggers/functions on a table level to compute derived columns: DerivedDiscount and CategoryDescription
- (Attempted) Conversion of U/I/D triggers - UNSUCCESSFUL.
  - These will be omitted in the final submission database if they cannot be completed.
- Tested data insertions (without U/I/D triggers): Successful

# Model Update Notes - 12/06/2023:
- Updated U/I/D Triggers (Functional).
- Fixed Hash Function.
- Tested Data Insertions/Updates/Deletes: Triggers, Hash and Transaction++ successful.
- Could not implement ivtf...Pky function without specifying rows/data types in the return.
  - Converted ivtf...pkyOf to a function that accepts an int PK argument and returns a view.
  - Must call function, then can select from newly created view (and join to see audit trail history).

# Model Update Notes: 12/07/2023
- Removed SalesCategoryThreshold (and history) tables.
- Replaced SalesCategoryThresholdId (FK) with CategoryDescription in SalesOrderVehicle (and history) as a dervied column
  
## TODO:
- Import and convert any new custom views.