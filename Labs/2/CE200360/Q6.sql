SELECT [Orders].OrderID, OrderDate, ProductName, CompanyName, SUM([Order Details].UnitPrice * Quantity) AS Amount
    FROM Customers, Orders, [Order Details], Products
    WHERE Customers.CustomerID = Orders.CustomerID AND Orders.OrderID = [Order Details].OrderID AND [Order Details].ProductID = Products.ProductID
        AND CompanyName = 'Queen Cozinha' AND OrderDate BETWEEN '1998-05-01' AND '1998-05-31'
    GROUP BY [Orders].OrderID, OrderDate, ProductName, CompanyName