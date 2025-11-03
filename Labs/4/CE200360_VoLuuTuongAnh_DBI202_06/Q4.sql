SELECT s.id AS StudentID, s.Name AS StudentName, m.Mark, s.Department
    FROM Students AS s
        JOIN Enroll AS e ON s.id = e.StudentId
        JOIN Marks AS m ON e.EnrollId = m.EnrollId AND m.Mark = 10.0
    ORDER BY StudentID