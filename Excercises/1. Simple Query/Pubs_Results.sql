/*
# Session 11



Sử dụng `Pubs` database


*/

USE [pubs];

GO

/*
1. Hiển thị tất cả các quyển sách thuộc loại `business`
*/

SELECT *

    FROM titles

    WHERE type = 'business';

/*
2. Hiển thị các loại sách (`type`) từ bảng `titles`. Đảm bảo dữ liệu không có sự trùng nhau và sắp xếp theo thứ tự giảm dần.
*/

SELECT DISTINCT type

    FROM titles

    ORDER BY type DESC;

/*
3. Hiển thị tất cả các mẫu tin trên bảng `sales`.
*/

SELECT *

    FROm sales;

/*
4. Display all records in `Sales` table that were order in December 1993.
*/

SELECT *
  FROM sales
  WHERE ord_date >= '1993-12-01' AND ord_date <= '1993-12-31';

/*
5. Hiển thị tất cả các tác giả ở thành phố `Oakland` và mã có chứa `93`
*/

SELECT *

    FROM authors

    WHERE city = 'Oakland' AND zip LIKE '%94%';

/*
6. Hiển thị tất cả các nhân viên làm việc cho nhà xuất bảng có mã `‘9901’` hoặc `‘9999’`
*/

SELECT *

    FROM employee

    WHERE pub_id = '9901' OR pub_id = '9999';

/*
7. Hiển thị tất cả các nhân viên có mã bắt đầu bằng chữ `‘P’` hoặc `‘C’`.
*/

SELECT (fname + ' ' + lname) AS fullname

    FROM employee

    WHERE fname LIKE 'P%' OR fname LIKE 'C%';