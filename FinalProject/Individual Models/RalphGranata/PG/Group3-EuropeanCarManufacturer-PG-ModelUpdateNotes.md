# PostgreSQL 11
# Model Update Notes - 12/03/2023 ~ 12/05/2023
- Copied SQL Server Model, changed target DB to PostgreSQL.
- Updated all necessary Domains, Defaults, Constraints to use proper datatypes and PG syntax.
- Converted views syntax to PG.

## TODO:
- Merge latest history table indexing from SQLServer2019 model.
- Import subject areas.
- Import and convert any new custom views.
- Fix derived columns (DerivedDiscount and CategoryDescription) by either:
  - Creating triggers to perform derivations,
  - Hardcoding data from derived columns.
- Convert U/I/D Triggers to PG.
- Convert Functions to PG.