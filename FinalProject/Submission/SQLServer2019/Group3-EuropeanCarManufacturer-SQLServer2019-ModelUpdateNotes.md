# SQL Server 2019 
# Model Update Notes - 11/24/2023 ~ 11/28/2023
- Created SQL Server 2019 Erwin Template
  - Diagrams, Model Properties
  
- Imported diagrams & model properties from template to model.
- Used complete compare on JoyWithCustomeTriggers.erwin to import domains/schemas
  - Revised domains to proper hierarchy/schema associations
- Created relations on tables using appropriate foreign keys.

- Normalization:
  - SalesCategoryThreshold:
    - Kept table columns, changed domains/datatypes.
    - Now a parent to SalesOrderVehicleDetail
    - Removed MarketCategoryDescription from SalesOrderVehicle table & replaced with SalesCategoryThresholdId
  - MarketingInformation (eliminated)
    - Removed SpendCapacityId from Customer table and replaced with SpendCapacity from MarketingInformation.
  - MarketingCategory (eliminated)
    - Moved MarketingType column to ManufacturerVehicleMake table.

- New Tables:
  - DbSecurity.UserAuthorization table & necessary columns
  - Audit history tables for triggers

- New Columns:
  - Added FirstName and LastName columns to Customer and Staff tables.
  - Added TransactionNumber, Note, UserAuthorizationId, SysStartTime, SysEndTime, RowLevelHashKey, PriorRowLevelHashKey, and FireAudit Trigger to application tables that have corresponding History tables.
  - Added AuditDateTimeStamp, DBAction, IsDeleted to Audit History tables.

- Defaults, Constraints, UDPS, Sequences
  - Added various defaults, constraints, UDPs
    - More to follow...
  - Added Sequence objects for all primary keys with associated defaults (1:1 mappings)

# Model Update Notes - 11/29/2023
- Added spaces to all table names and columns in LDM only.
- Merged definitions from Chuan's model
- Removed first & last name columns from tables to match data.

# Model Update Notes - 11/30/2023
- Finalized Domains/Datatypes
- Added remaining defaults & constraints to application tables.
- Created working DDL and Data Insertion to test view creations.
- Re-added StockCode to SalesOrderDetail (and history table) for multi-table queries on VehicleStock table since the ID (FK) in SalesOrderDetail will be null unless we have the time to manipulate the data.
- Added double quote delimiter to all constraints.

# Model Update Notes - 12/01/2023
- Added triggers.
- Added ITVFs.
- Bound to table.
- Removed StockCode from VehicleOrderDetails table and made ManufacturerVehicleStockId NOT NULL.
- Revised data insertion to include the appropriate ManufacturerVehicleStockId for each row.

# Model Update Notes - 12/03/2023
- Merged Chuan's views & updated triggers.
- Updated view schemas.

# Model Update Notes - 12/04/2023
- Merged Chuans, Ralphs, Mehrshads custom views.
- Remade DDL for tables with new views included.
- Removed hardcoded Note in update triggers.

# Model Update Notes: 12/05/2023
- Added indexing to history tables.
- Updated DDL.
- Added subject areas to model.

# Model Update Notes: 12/07/2023
- Removed SalesCategoryThreshold (and history) tables.
- Replaced SalesCategoryThresholdId (FK) with CategoryDescription in SalesOrderVehicle (and history) as a dervied column
  
