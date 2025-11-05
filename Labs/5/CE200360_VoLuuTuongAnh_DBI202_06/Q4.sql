WITH s AS (
    SELECT s.Id AS StudentId, s.Name AS StudentName, m.Mark, s.Department
        FROM Students AS s
            JOIN Enroll AS e ON s.Id = e.StudentId
            JOIN Marks AS m ON e.EnrollId = m.EnrollId
)

SELECT s.StudentId, s.StudentName, s.Mark, s.Department
    FROM s
    WHERE s.Mark = (
        SELECT MAX(Mark)
            FROM s
    ) AND s.Department = 'SE'
    ORDER BY s.StudentId;