SELECT t.ProductID, t.ProductName, t.SumOfQty, t.SumOfAmount
    FROM (
        SELECT Products.ProductID, Products.ProductName, SUM([Order Details].Quantity) AS SumOfQty, SUM([Order Details].Quantity * [Order Details].UnitPrice) AS SumOfAmount
            FROM Products, [Order Details]
            WHERE Products.ProductID = [Order Details].ProductID
            GROUP BY Products.ProductID, Products.ProductName
    ) AS t
    WHERE t.SumOfQty > 1000
    ORDER BY t.SumOfQty DESC;