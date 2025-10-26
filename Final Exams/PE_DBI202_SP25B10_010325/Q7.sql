WITH c AS (
    SELECT r.SubjectID, COUNT(r.Score) AS numberOfFailedExams
        FROM Results AS r
        WHERE Score < 5
        GROUP BY r.SubjectID
), s AS (
    SELECT su.SubjectID, su.SubjectName, su.DepartmentID, d.DepartmentName
        FROM  Subjects AS su, Departments AS d
        WHERE d.DepartmentID = su.DepartmentID
)

SELECT TOP(1) s.DepartmentName, s.SubjectName, c.numberOfFailedExams
    FROM c, s
    WHERE c.SubjectID = s.SubjectID
    ORDER BY c.numberOfFailedExams DESC