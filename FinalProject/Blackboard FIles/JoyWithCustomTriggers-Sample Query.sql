SELECT h.*
  FROM [CustomerTrigger].[Audit].[vwFindUniqueTablePkySalesCustomer] as vw
  cross apply [Audit].[FindAllTransactionsByTablePkyOfSalesCustomer](vw.CustomerID) as h
where vw.CustomerID <= 2
order by vw.CustomerID, h.TransactionNumber desc
