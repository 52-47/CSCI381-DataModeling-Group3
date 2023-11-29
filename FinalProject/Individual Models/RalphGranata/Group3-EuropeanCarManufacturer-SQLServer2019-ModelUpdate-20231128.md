# SQL Server 2019 Model Update Notes - 11/24/2023 ~ 11/28/2023
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


TODO:
- Sweep and review all schemas, tables, columns, domains (and their data types).
- Add remaining defaults and contraints where necessary throughout the data model.
- Add triggers.
- Add hash functions.
- Add indexing.
- Create views.