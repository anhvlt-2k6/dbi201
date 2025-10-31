/*
# Session 11



Sử dụng `Northwind` database


*/

USE [Northwind];

GO

/*
1. Hiển thị `CustomerID`, `CompanyName` từ bảng `Customer`
*/

SELECT CustomerID, CompanyName

    FROM Customers;

/*
2. Hiển thị tất cả các trường từ bảng `Products` với `CategoryID` bằng `1` hoặc `2` hoặc `6`.
*/

SELECT *

    FROM Products

    WHERE CategoryID = 1 OR CategoryID = 2 OR CategoryID = 6;

/*
3. Hiển thị các sản phẩm (`Products`) có giá từ 40 đến 50 và sắp xếp theo tên sản phẩm (`ProductName`)
*/

SELECT *

    FROM Products

    WHERE UnitPrice >= 40 AND UnitPrice <= 50

    ORDER BY ProductName;

/*
4. Hiển thị 4 mẫu tin (`TOP 4`) đầu tiên trong bảng `Employees`
*/

SELECT TOP(4) *

    FROM Employees;

/*
5. Hiển thị tất cả các cột từ bảng `Order Details` và `Amount` = (`UnitPrice * Quantity`)
*/

SELECT *, UnitPrice * Quantity AS Amount

    FROM [Order Details];

/*
6. Hiển thị thông tin tất cả các khách hàng (`Customers`) tên bắt đầu bằng ký tự `‘A’`
*/

SELECT *

    FROM Customers

    WHERE ContactName LIKE 'A%';

/*
7. Hiển thị danh sách loại sản phẩm (`Categories`) có tên loại (`CategoryName`) không kết thúc bằng ký tự `‘s’`
*/

SELECT *

    FROM Categories

    WHERE CategoryName NOT LIKE '%s';

/*
8. Hiển thị tên quốc gia, tên thành phố từ bảng `Suppliers`. Đảm bảo rằng các dòng dữ liệu trùng nhau  được loại khỏi danh sách
*/

SELECT DISTINCT City, Country

    FROM Suppliers;

/*
9. Hiển thị 3 sản phẩm (`Products`) có giá cao nhất
*/

SELECT TOP(3) *

    FROM Products

    ORDER BY UnitPrice DESC

/*
10. Hiển thị tất cả các hóa đơn (Orders) đặt vào tháng 12/1997.
*/

SELECT *

    FROM Orders

    WHERE OrderDate >= '1997-12-01' AND OrderDate <= '1997-12-31';