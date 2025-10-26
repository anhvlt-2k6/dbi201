SELECT d.DepartmentID, d.DepartmentName, 
        CASE
            WHEN c.NumberOfStudents IS NULL THEN 0
            ELSE c.NumberOfStudents
        END AS NumberOfStudents
    FROM (
        SELECT s.DepartmentID, COUNT(s.StudentID) AS NumberOfStudents
            FROM Students AS s
            GROUP BY s.DepartmentID
    ) AS c, Departments AS d
    WHERE c.DepartmentID = d.DepartmentID
