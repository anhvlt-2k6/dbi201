SELECT ProductID, ProductName, CategoryName, (UnitPrice * 0.8) AS DiscountedPrice
    FROM Products, Categories
    WHERE Products.CategoryID = Categories.CategoryID AND CategoryName = 'Beverages';