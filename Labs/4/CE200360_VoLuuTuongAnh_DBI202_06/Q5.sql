SELECT s.Id, s.Name AS StudentName, se.Code, s.Department, COUNT(*) AS NumberOfStudents
    FROM Students AS s
        JOIN Enroll AS e ON s.Id = e.StudentId 
        JOIN Semesters AS se ON e.SemesterId = se.Id AND se.Code = 'Fa2022'
    WHERE s.Department = 'AI'
    GROUP BY s.Id, s.Name, se.Code, s.Department