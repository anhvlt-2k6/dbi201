SELECT s.Id AS StudentId, s.Name AS StudentName, e.EnrollId, se.Code AS CodeName, s.Department, se.BeginDate
    FROM Students AS s
        JOIN Enroll AS e ON s.Id = e.StudentId AND (e.EnrollId BETWEEN 15 AND 20)
        JOIN Semesters AS se ON se.Id = e.SemesterId
    WHERE s.Department = 'SE'
    ORDER BY se.BeginDate ASC;