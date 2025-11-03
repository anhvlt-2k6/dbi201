SELECT TOP(4) [Customers].CustomerID, CompanyName, SUM(UnitPrice * Quantity) AS SumOfAmount
    FROM [Orders], [Order Details], [Customers]
    WHERE [Orders].OrderID = [Order Details].OrderID AND [Orders].CustomerID = [Customers].CustomerID
    GROUP BY [Customers].CustomerID, CompanyName
    ORDER BY SumOfAmount DESC;