SELECT *
    FROM Products
    WHERE UnitPrice >= (
        SELECT AVG(UnitPrice) AS averagePrice
            FROM Products
    )
    ORDER BY UnitPrice DESC;